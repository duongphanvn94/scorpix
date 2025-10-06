<?php

namespace Modules\CMS\Services;

use App\Enums\AdminStatus;
use App\Enums\PaymentStatus;
use App\Enums\ProductType;
use App\Enums\Role;
use App\Enums\ShopStatus;
use App\Enums\TokenStockStatus;
use App\Models\CurrentSubscription;
use App\Models\Product;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Modules\CMS\Contracts\Repositories\CurrentSubscriptionRepository;
use Modules\CMS\Contracts\Repositories\ProductRepository;
use Modules\CMS\Contracts\Repositories\ShopTokenStockRepository;
use Modules\CMS\Contracts\Repositories\SubscriberHistoryRepository;
use Modules\CMS\Contracts\Services\ShopService;
use Modules\CMS\Contracts\Services\SubscriberHistoryService;
use Stripe\SetupIntent;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use Stripe\StripeClient;
use Stripe\Subscription;

readonly class SubscriberHistoryServiceImpl implements SubscriberHistoryService
{
    private string $subscribedName;

    public function __construct(
        private SubscriberHistoryRepository $subscriberHistoryRepository,
        private ProductRepository           $productRepository,
        private ShopTokenStockRepository    $shopTokenStockRepository,
        private CurrentSubscriptionRepository   $currentSubscriptionRepository,
    )
    {
        $this->subscribedName = env('STRIPE_SUBSCRIPTION_NAME', "default");
    }

    /**
     * @return Collection
     */
    public function getAll(): Collection
    {
        $currentUser = Auth::user();

        return $this->subscriberHistoryRepository
            ->handle()
            ->when(Role::SHOP->is($currentUser->role), fn($q) => $q->where('shop_id', $currentUser->shop_id))
            ->orderByDesc('created_at')
            ->get();
    }

    /**
     * @return array
     */
    public function stripeSetupIntent(): array
    {
        try {
            $currentUser = Auth::user();

            $stripeSecret = config('stripe.secret');
            if (!$stripeSecret) {
                return [
                    'result' => false,
                    'message' => 'Stripe secret key not configured'
                ];
            }

            Stripe::setApiKey($stripeSecret);

            // Check if user has Stripe customer method
            if (!method_exists($currentUser, 'createOrGetStripeCustomer')) {
                return [
                    'result' => false,
                    'message' => 'User model does not support Stripe customer creation'
                ];
            }

            $intent = SetupIntent::create([
                'customer' => $currentUser->createOrGetStripeCustomer()->id,
                'payment_method_types' => ['card']
            ]);

            return [
                'result' => true,
                'client_secret' => $intent->client_secret
            ];
        } catch (\Exception $exception) {
            Log::error(__METHOD__ . " error:" . $exception->getMessage());
            Log::error($exception);

            return [
                'result' => false,
                'message' => $exception->getMessage()
            ];
        }
    }

    /**
     * @param string $sessionId
     * @return bool
     */
    public function handleStripePaymentSuccess(string $sessionId): bool
    {
        $stripeSecret = config('stripe.secret');
        if (!$stripeSecret) {
            Log::error('Stripe secret key not configured');
            return false;
        }

        Stripe::setApiKey($stripeSecret);

        try {
            $currentUser = Auth::user();

            if (Role::ADMIN->is($currentUser->role)) {
                Log::error("Admin can not subscribe product");
                return false;
            }

            $stripeSession = Session::retrieve($sessionId);

            $subscriberHistory = $this->subscriberHistoryRepository->handle()
                ->where('payment_session_id', $sessionId)
                ->first();

            if (!$subscriberHistory) {
                Log::error("Subscriber history not found for session: " . $sessionId);
                return false;
            }

            $subscriberHistory->payment_status = PaymentStatus::SUCCESS->value;
            $subscriberHistory->payment_data = json_encode($stripeSession);
            $subscriberHistory->save();

            return $this->handleTokenStockAfterSuccessPayment($subscriberHistory, $currentUser, $stripeSession);
        } catch (\Exception $exception) {
            Log::error(__METHOD__ . " error:" . $exception->getMessage());
            Log::error($exception);
            return false;
        }
    }

    /**
     * @param $subscriberHistory
     * @param $currentUser
     * @return bool
     */
    protected function handleTokenStockAfterSuccessPayment($subscriberHistory, $currentUser, $stripeSession): bool
    {
        try {
            DB::beginTransaction();
            $product = $subscriberHistory->product;

            $availableEndDate = match ($product?->type->value) {
                ProductType::ONE_TIME->value => now()->addDays($product->day_available)->format('Y-m-d 23:59:59'),
                ProductType::WEEKLY->value => now()->addDays(7)->format('Y-m-d 23:59:59'),
                ProductType::MONTHLY->value => now()->addMonth()->format('Y-m-d 23:59:59'),
                ProductType::YEARLY->value => now()->addYear()->format('Y-m-d 23:59:59'),
                ProductType::EVERY_THREE_MONTH->value => now()->addMonths(3)->format('Y-m-d 23:59:59'),
                ProductType::EVERY_SIX_MONTH->value => now()->addMonths(6)->format('Y-m-d  23:59:59'),
                default => null
            };

            $this->shopTokenStockRepository->create([
                'shop_id' => $subscriberHistory->shop_id,
                'product_id' => $product->id,
                'token_qty' => $product->token_qty,
                'available_start_date' => now()->format('Y-m-d H:i:s'),
                'available_end_date' => $availableEndDate,
                'status' => TokenStockStatus::ADDED
            ]);

            $currentUser->shop->currentSubscriotion?->delete();

            $this->currentSubscriptionRepository->create([
                'payment_session_id' => $stripeSession->id,
                'stripe_subscription_id' => $stripeSession->subscription,
                'shop_id' => $subscriberHistory->shop_id,
                'admin_id' => $currentUser->id,
                'product_id' => $product->id,
            ]);

            $shop = $subscriberHistory->shop;
            if (!isset($shop)) {
                DB::rollBack();
            }

            if (ProductType::ONE_TIME->is($product->type)) {
                $shop->token_expired_date = $availableEndDate;
                // Recalculate total credits from all successful payments
                $totalCredits = \App\Models\SubscriberHistory::where('shop_id', $shop->id)
                    ->where('payment_status', \App\Enums\PaymentStatus::SUCCESS)
                    ->sum('token_qty');
                $shop->current_token_qty = $totalCredits;
                
                // Also update credit column in admins table for all admins with this shop_id
                \App\Models\Admin::where('shop_id', $shop->id)
                    ->update(['credit' => $totalCredits]);
            } else {
                $shop->current_token_subscribe_qty = $product->token_qty;
                $shop->token_subscribe_expired_date = $availableEndDate;
            }

            if (!ShopStatus::ACTIVE->is($shop->status)) {
                $shop->status = ShopStatus::ACTIVE->value;
            }
            $shop->save();

            if (AdminStatus::ENABLE != $currentUser->status) {
                $currentUser->status = AdminStatus::ENABLE->value;
                $currentUser->save();
            }

            DB::commit();

            return true;
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error(__METHOD__ . " error:" . $e->getMessage());
            Log::error($e);

            return false;
        }
    }

    /**
     * @param string $sessionId
     * @return bool
     */
    public function handleStripePaymentCancel(string $sessionId): bool
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        try {
            $session = Session::retrieve($sessionId);

            if (!$session) {
                Log::error(__METHOD__ . " payment session not found: session_id => $sessionId");

                return false;
            }

            $subscriberHistory = $this->subscriberHistoryRepository->handle()
                ->where('payment_session_id', $session->id)
                ->with(['product', 'shop'])
                ->first();

            if (!$subscriberHistory) {
                Log::error(__METHOD__ . " Not found subscribe history has session_id => $sessionId");

                return false;
            }

            if ($subscriberHistory->payment_status === PaymentStatus::PENDING) {
                $subscriberHistory->payment_status = PaymentStatus::CANCEL->value;

                $subscriberHistory->save();
            }

            return true;
        } catch (\Exception $e) {
            Log::error(__METHOD__ . " error:" . $e->getMessage());
            Log::error($e);

            return false;
        }
    }

    /**
     * @return CurrentSubscription|null
     */
    public function getCurrentSubscriber(): ?CurrentSubscription
    {
        try {
            $currentUser = Auth::user();

            // Check if user exists
            if (!$currentUser) {
                return null;
            }

            // Check if user has shop
            if (!$currentUser->shop_id) {
                return null;
            }

            // Get current subscription for the shop
            return $this->currentSubscriptionRepository->handle()
                ->where('shop_id', $currentUser->shop_id)
                ->with('product')
                ->first();
        } catch (\Exception $e) {
            Log::error(__METHOD__ . " error:" . $e->getMessage());
            Log::error($e);

            return null;
        }
    }

    /**
     * @param int $productId
     * @return array
     */
    public function store(int $productId): array
    {
        try {
            DB::beginTransaction();

            $product = $this->productRepository->handle(new Request())->findOrFail($productId);

            $currentUser = Auth::user();

            if (ProductType::ONE_TIME->is($product->type)) {
                $resultPayment = $this->handleOnetimePayment($currentUser, $product);
            } else {
                $resultPayment = $this->handleSubscribePayment($currentUser, $product);
            }

            if (!$resultPayment['result']) {
                DB::rollBack();

                return $resultPayment;
            }

            DB::commit();

            return [
                "result" => true,
                "stripeUrl" => $resultPayment['stripeUrl']
            ];
        } catch (\Exception $exception) {
            DB::rollBack();
            Log::error(__METHOD__ . " error:" . $exception->getMessage());
            Log::error($exception);

            return [
                "result" => false,
                "message" => $exception->getMessage()
            ];
        }
    }

    /**
     * @param int $currentSubscriberId
     * @return array
     */
    public function unsubscriber(int $currentSubscriberId): array
    {
        try {
            DB::beginTransaction();

            $this->handleDataUnsubscribe($currentSubscriberId);

            DB::commit();

            return [
                "result" => true,
                "message" => 'Unsubscribed successfully'
            ];
        } catch (\Exception $exception) {
            DB::rollBack();
            Log::error(__METHOD__ . " error:" . $exception->getMessage());
            Log::error($exception);

            return [
                "result" => false,
                "message" => $exception->getMessage()
            ];
        }
    }

    /**
     * @param int $currentSubscriberId
     * @return void
     * @throws \Stripe\Exception\ApiErrorException
     */
    public function handleDataUnsubscribe(int $currentSubscriberId): void
    {
        $currentSubscriber = $this->currentSubscriptionRepository->handle()
            ->where('id', $currentSubscriberId)
            ->firstOrFail();

        if (!str_starts_with($currentSubscriber->stripe_subscription_id, config('app.stripe.admin_add_prefix_str'))
            && !str_starts_with($currentSubscriber->payment_session_id, config('app.stripe.admin_add_prefix_str'))
        ) {
            Stripe::setApiKey(env('STRIPE_SECRET'));

            $subscription = Subscription::retrieve($currentSubscriber->stripe_subscription_id);

            $subscription->cancel();
        }

        $currentSubscriber->delete();
    }

    /**
     * @param $user
     * @param Product $product
     * @return array
     */
    private function handleOnetimePayment($user, Product $product): array
    {
        try {
            $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
            $lineItems = [
                [
                    'price' => $product->stripe_price_id,
                    'quantity' => 1,
                ]
            ];

            $newSubscriberHistory = $this->subscriberHistoryRepository->create([
                'payment_session_id' => null,
                'payment_price_id' => $product->stripe_price_id,
                'payment_data' => '',
                'shop_id' => $user->shop_id,
                'product_id' => $product->id,
                'price' => $product->price,
                'type' => $product->type->value,
                'payment_status' => PaymentStatus::PENDING->value,
            ]);

            $checkoutSession = $stripe->checkout->sessions->create([
                'line_items' => $lineItems,
                'mode' => 'payment',
                'metadata' => [
                    'subscriber_history_id' => $newSubscriberHistory->id,
                    'admin_id' => $user->id
                ],
                'success_url' => route('orders.stripePaymentSuccess') . '?session_id={CHECKOUT_SESSION_ID}',
                'cancel_url' => route('orders.stripePaymentCancel') . '?session_id={CHECKOUT_SESSION_ID}',
            ]);

            $newSubscriberHistory->payment_session_id = $checkoutSession->id;
            $newSubscriberHistory->save();

            return [
                "result" => true,
                "stripeUrl" => $checkoutSession->url
            ];
        } catch (\Exception $exception) {
            Log::error(__METHOD__ . " error:" . $exception->getMessage());
            Log::error($exception);

            return [
                "result" => false,
                "message" => $exception->getMessage()
            ];
        }
    }

    /**
     * @param $user
     * @param Product $product
     * @return array
     */
    private function handleSubscribePayment($user, Product $product): array
    {
        try {
            $priceId = $product->stripe_price_id;

            // Check if Stripe is configured
            $stripeSecret = config('stripe.secret');
            if (!$stripeSecret) {
                return [
                    'result' => false,
                    'message' => 'Stripe secret key not configured'
                ];
            }

            $newSubscriberHistory = $this->subscriberHistoryRepository->create([
                'payment_session_id' => null,
                'payment_price_id' => $priceId,
                'payment_data' => '',
                'shop_id' => $user->shop_id,
                'product_id' => $product->id,
                'price' => $product->price,
                'type' => $product->type->value,
                'payment_status' => PaymentStatus::PENDING->value,
            ]);

            $stripeSession = $user->newSubscription(config('stripe.subscription_name', "default"), $priceId)
                ->checkout([
                    'success_url' => route('orders.stripePaymentSuccess') . '?session_id={CHECKOUT_SESSION_ID}',
                    'cancel_url' => route('orders.stripePaymentCancel') . '?session_id={CHECKOUT_SESSION_ID}',
                ]);

            $newSubscriberHistory->payment_session_id = $stripeSession->id;
            $newSubscriberHistory->save();

            return [
                'result' => true,
                'stripeUrl' => $stripeSession->url
            ];
        } catch (\Exception $exception) {
            Log::error(__METHOD__ . " error:" . $exception->getMessage());
            Log::error($exception);

            return [
                "result" => false,
                "message" => $exception->getMessage()
            ];
        }
    }
}
