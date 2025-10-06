<?php

namespace Modules\CMS\Http\Controllers;

use App\Enums\Role;
use App\Enums\ShopStatus;
use App\Http\Controllers\Controller;
use App\Models\Shop;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use Inertia\Response;
use Modules\CMS\Contracts\Repositories\ProductRepository;
use Modules\CMS\Contracts\Services\AdminService;
use Modules\CMS\Contracts\Services\MailService;
use Modules\CMS\Contracts\Services\ShopService;
use Modules\CMS\Http\Requests\Shop\UpdateKeyRequest;
use Modules\CMS\Http\Requests\Shop\StoreRequest;
use Modules\CMS\Http\Requests\Shop\UpdateRequest;

class ShopController extends Controller
{
    public function __construct(
        private readonly ShopService $shopService,
        private readonly ProductRepository $productRepository
    ){}

    /**
     * @return Response
     */
    public function index(): Response
    {
        $shops = $this->shopService->getAllShops();
        $products = $this->productRepository->get();

        return Inertia::render('shops/Index', [
            'shops' => $shops,
            'products' => $products
        ]);
    }

    /**
     * @return Response
     */
    public function contract(): Response
    {
        return Inertia::render('shops/contract');
    }

    public function getInfo(Request $request): JsonResponse
    {
        $apiKey = $request->get('apiKey');
        $domain = $request->get('domain');

        $shop = Shop::query()
            ->with('currentSubscription.product')
            ->where('api_key', $apiKey)
            ->where('status', ShopStatus::ACTIVE->value)
            ->first();

        if (!$shop) {
            return response()->json([
                'message' => 'Shop not found',
            ], 404);
        }

        $subscriptionInfo = [];

        $currentSubscription = $shop->currentSubscription;
        if ($currentSubscription) {
            $subscriptionInfo['subscription'] = [
                'name' => $currentSubscription->product->name,
                'price' => $currentSubscription->product->price,
                'subtitle' => $currentSubscription->product->subtitle,
                'token_qty' => $currentSubscription->product->token_qty,
            ];
            $subscriptionInfo['buy_at'] = $currentSubscription->created_at;
        }

        return response()->json([
            'name' => $shop->name,
            'address' => $shop->address,
            'phone_number' => $shop->phone_number,
            'current_token_qty' => $shop->current_token_qty,
            'token_expired_date' => $shop->token_expired_date,
            'token_subscribe_qty' => $shop->current_token_subscribe_qty,
            'token_subscribe_expired_date' => $shop->token_subscribe_expired_date,
            'subscription_info' => $subscriptionInfo,
        ]);
    }

    /**
     * @return Response
     */
    public function create(): Response
    {
        $plans = $this->shopService->getPlanSubscribe();

        return Inertia::render('shops/Create', [
            'admin' => Auth::user(),
            'plans' => $plans
        ]);
    }

    /**
     * @param StoreRequest $request
     * @param \Modules\CMS\Http\Requests\Admin\StoreRequest $adminRequest
     * @return RedirectResponse
     */
    public function store(StoreRequest $request, \Modules\CMS\Http\Requests\Admin\StoreRequest $adminRequest): RedirectResponse
    {
        $this->shopService->create($request, $adminRequest);

        return to_route('shops.index');
    }

    /**
     * @return Response
     */
    public function showKey(): Response
    {
        $shop = $this->shopService->show();

        return Inertia::render('shops/RequestKey',[
            'shop' => $shop,
        ]);
    }

    /**
     * @return Response
     */
    public function show(): Response
    {
        $shop = $this->shopService->show();

        return Inertia::render('shops/UpdateKey', [
            'shop' => $shop
        ]);
    }

    /**
     * @param int $shop
     * @return Response
     */
    public function edit(int $shop): Response
    {
        $data = $this->shopService->edit($shop);
        $plans = $this->shopService->getPlanSubscribe();

        return Inertia::render('shops/Update', [
            'shop' => $data,
            'plans' => $plans
        ]);
    }

    /**
     * @param UpdateRequest $request
     * @param int $shop
     * @return RedirectResponse
     */
    public function update(UpdateRequest $request, int $shop): RedirectResponse
    {
        $this->shopService->update($request, $shop);

        if (Role::SHOP->is(Auth::user()->role)) {
            return to_route('shops.key.edit');
        }

        return to_route('shops.index');
    }

    /**
     * @return RedirectResponse
     */
    public function updateStatus(): RedirectResponse
    {
        $this->shopService->updateRequestKey();
//        $this->mailService->send([
//            'to' => 'nguyentuankietdz@gmail.com',
//            'subject' => 'Request Key Updated',
//            'content' => "A new request key update API Key has been submitted.\n\n"
//                . "Shop name: " . Auth::user()->name . "\n"
//                . "Shop email: " . Auth::user()->email . "\n"
//                . "Requested at: " . now()->format('Y-m-d H:i:s'),
//        ]);

        return to_route('shops.key.edit');
    }

    /**
     * @param UpdateKeyRequest $request
     * @param $id
     * @return RedirectResponse
     */
    public function updateApiKey(UpdateKeyRequest $request, $id): RedirectResponse
    {
            $this->shopService->updateApiKey($request, $id);

            return to_route('shops.index');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id) {}
}
