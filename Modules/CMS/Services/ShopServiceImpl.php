<?php

namespace Modules\CMS\Services;

use App\Enums\PaymentStatus;
use App\Enums\ProductType;
use App\Enums\RequestKeyFlag;
use App\Enums\TokenStockStatus;
use App\Models\Product;
use App\Models\Shop;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Modules\CMS\Contracts\Repositories\CurrentSubscriptionRepository;
use Modules\CMS\Contracts\Repositories\ShopRepository;
use Modules\CMS\Contracts\Repositories\ShopTokenStockRepository;
use Modules\CMS\Contracts\Repositories\SubscriberHistoryRepository;
use Modules\CMS\Contracts\Services\AdminService;
use Modules\CMS\Contracts\Services\ShopService;
use Modules\CMS\Contracts\Services\SubscriberHistoryService;
use Modules\CMS\Http\Requests\Shop\UpdateKeyRequest;
use Modules\CMS\Http\Requests\Shop\StoreRequest;
use Modules\CMS\Http\Requests\Shop\UpdateRequest;

class ShopServiceImpl implements ShopService
{
    private string $adminAdded = '';

    public function __construct(
        private readonly ShopRepository                $shopRepository,
        private readonly AdminService                  $adminService,
        private readonly CurrentSubscriptionRepository $currentSubscriptionRepository,
        private readonly SubscriberHistoryRepository   $subscriberHistoryRepository,
        private readonly ShopTokenStockRepository      $shopTokenStockRepository,
        private readonly SubscriberHistoryService      $subscriberHistoryService,
    )
    {
        $this->adminAdded = config('app.stripe.admin_add_prefix_str') . now()->timestamp;
    }

    /**
     * @return Collection
     */
    public function getAllShops(): Collection
    {
        $condition = new Request([
//            'admin_id' => Auth::user()->id
        ]);
        return $this->shopRepository
            ->handle($condition)
            ->with(['admin', 'currentSubscription.product'])
            ->orderBy('id', 'desc')
            ->get();
    }

    /**
     * @param StoreRequest $request
     * @return ?Model
     */
    public function create(StoreRequest $request, \Modules\CMS\Http\Requests\Admin\StoreRequest $adminRequest): ?Model
    {
        try {
            DB::beginTransaction();

            $data = $request->validated();
            $data['admin_id'] = Auth::user()->id;
            $data['create_at'] = Carbon::now()->format('Y-m-d H:i:s');

            $shop = $this->shopRepository->handle()->create($data);

            $admin = $this->adminService->store($adminRequest, $shop->id);

            $shop->update(['admin_id' => $admin->id]);

            if (isset($data['current_subscription'])) {
                $product = Product::query()->where('id', $data['current_subscription'])->firstOrFail();

                $this->handleRegisterPlanForShop($shop, $product, $admin);
            }

            DB::commit();
            return $shop;
        } catch (\Exception $exception) {
            DB::rollBack();
            Log::error(__METHOD__ . ' error: ' . $exception->getMessage());
            Log::error($exception);

            return null;
        }
    }

    /**
     * @param Shop $shop
     * @param Product $product
     * @param $admin
     * @return void
     */
    protected function handleRegisterPlanForShop(Shop $shop, Product $product, $admin): void
    {
        $this->currentSubscriptionRepository->handle()->create([
            'shop_id' => $shop->id,
            'stripe_subscription_id' => $this->adminAdded,
            'payment_session_id' => $this->adminAdded,
            'admin_id' => $admin->id,
            'product_id' => $product->id,
        ]);

        $this->subscriberHistoryRepository->handle()->create([
            'payment_session_id' => $this->adminAdded,
            'payment_price_id' => $this->adminAdded,
            'payment_data' => $this->adminAdded,
            'shop_id' => $shop->id,
            'product_id' => $product->id,
            'token_qty' => $product->token_qty,
            'price' => $product->price,
            'type' => $product->type,
            'payment_status' => PaymentStatus::SUCCESS->value
        ]);

        $availableEndDate = match ($product?->type->value) {
            ProductType::ONE_TIME->value => now()->addDays($product->day_available)->format('Y-m-d 23:59:59'),
            ProductType::WEEKLY->value => now()->addDays(7)->format('Y-m-d 23:59:59'),
            ProductType::MONTHLY->value => now()->addMonth()->format('Y-m-d 23:59:59'),
            ProductType::YEARLY->value => now()->addYear()->format('Y-m-d 23:59:59'),
            ProductType::EVERY_THREE_MONTH->value => now()->addMonths(3)->format('Y-m-d 23:59:59'),
            ProductType::EVERY_SIX_MONTH->value => now()->addMonths(6)->format('Y-m-d  23:59:59'),
            default => null
        };

        if (ProductType::ONE_TIME->is($product->type)) {
            // Recalculate total credits from all successful payments
            $totalCredits = \App\Models\SubscriberHistory::where('shop_id', $shop->id)
                ->where('payment_status', \App\Enums\PaymentStatus::SUCCESS)
                ->sum('token_qty');
            $shop->current_token_qty = $totalCredits;
            $shop->token_expired_date = $availableEndDate;
            
            // Also update credit column in admins table for all admins with this shop_id
            \App\Models\Admin::where('shop_id', $shop->id)
                ->update(['credit' => $totalCredits]);
        } else {
            $shop->current_token_subscribe_qty = $product->token_qty;
            $shop->token_subscribe_expired_date = $availableEndDate;
        }

        $shop->save();

        $this->shopTokenStockRepository->handle()->create([
            'shop_id' => $shop->id,
            'token_qty' => $product->token_qty,
            'product_id' => $product->id,
            'available_start_date' => now()->format('Y-m-d 00:00:00'),
            'available_end_date' => $availableEndDate,
            'status' => TokenStockStatus::ADDED->value,
        ]);
    }

    /**
     * @return Model
     */
    public function show(): Model
    {
        $condition = new Request([
            'id' => Auth::user()->shop_id,
            'admin_id' => Auth::user()->id
        ]);

        return $this->shopRepository->handle($condition)->firstOrFail();
    }

    /**
     * @param int $shop
     * @return Model
     */
    public function edit(int $shop): Model
    {
        $condition = new Request([
            'id' => $shop
        ]);

        return $this->shopRepository->handle($condition)
            ->with('currentSubscription.product')
            ->firstOrFail();
    }

    /**
     * @return Collection
     */
    public function getPlanSubscribe(): Collection
    {
        return Product::query()
            ->where('type', '!=', ProductType::ONE_TIME->value)
            ->get();
    }

    /**
     * @param UpdateRequest $request
     * @param int $shop
     * @return Model
     */
    public function update(UpdateRequest $request, int $shop): Model
    {
        $data = $request->validated();
        $condition = new Request([
            'id' => $shop
        ]);
        $shopData = $this->shopRepository->handle($condition)
            ->with('currentSubscription.product', 'admin')
            ->firstOrFail();

        if (isset($data['current_subscription'])) {
            $product = Product::query()->where('id', $data['current_subscription'])->firstOrFail();

            $this->handleUpdateSubscription($shopData, $product, $shopData->admin);
        }

        return $this->shopRepository->updateModel($shopData, $data);
    }

    /**
     * @param Shop $shop
     * @param Product $product
     * @param $admin
     * @return void
     */
    protected function handleUpdateSubscription(Shop $shop, Product $product, $admin): void
    {
        try {
            $currentSubscribe = $shop->currentSubscription;
            if ($currentSubscribe) {
                $this->subscriberHistoryService->handleDataUnsubscribe($currentSubscribe->id);
            }

            $this->handleRegisterPlanForShop($shop, $product, $admin);
        } catch (\Exception $exception) {
            Log::error(__METHOD__ . ' error: ' . $exception->getMessage());
            Log::error($exception);

            return;
        }
    }

    /**
     * @return Model
     */
    public function updateRequestKey(): Model
    {
        $shop = $this->show();
        $requestKey = [
            'request_key_flag' => RequestKeyFlag::REQUEST->value
        ];

        return $this->shopRepository->updateModel($shop, $requestKey);
    }

    /**
     * @param UpdateKeyRequest $request
     * @param $id
     * @return Model
     */
    public function updateApiKey(UpdateKeyRequest $request, $id): Model
    {
        $data = $request->validated();
        $shop = $this->shopRepository->handle(new Request(['id' => $id]))->firstOrFail();

        return $this->shopRepository->updateModel($shop, $data);
    }
}
