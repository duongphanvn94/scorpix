<?php

namespace Modules\CMS\Http\Middleware;

use App\Enums\ShopStatus;
use App\Mail\ReminderMail;
use App\Models\Setting;
use App\Models\Shop;
use Closure;
use Illuminate\Http\Request;
use App\Models\ShopFrequency;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class TrackShopFrequency
{
    public function handle(Request $request, Closure $next)
    {
        $apiKey = $request->get('apiKey');
        $domain = $request->get('domain');

        if (!$apiKey || !$domain) {
            return response()->json(['error' => 'apiKey and domain is required'], 400);
        }

        $shop = Shop::query()
            ->where('api_key', $apiKey)
            ->where('status', ShopStatus::ACTIVE->value)
            ->first();

        if (!$shop || ShopStatus::INACTIVE->is($shop->status)) {
            return response()->json(['error' => 'API key not correct'], 403);
        }

        $isTokenCurrentShopNotEnough = $shop->token_expired_date < now()->format('Y-m-d')
            || $shop->current_token_qty <= 0;
        $isTokenSubscribeShopNotEnough = $shop->token_subscribe_expired_date < now()->format('Y-m-d H:i:s')
            || $shop->current_token_subscribe_qty <= 0;

        if ($isTokenCurrentShopNotEnough && $isTokenSubscribeShopNotEnough)
        {
            return response()->json(['error' => 'API_key is not token enough to use'], 400);
        }

        $isUseToken = false;
        if (!$isTokenCurrentShopNotEnough) {
            $shop->current_token_qty --;
            $shop->save();

            $isUseToken = true;
        }

        if (!$isUseToken && !$isTokenSubscribeShopNotEnough) {
            $shop->current_token_subscribe_qty --;
            $shop->save();

            $isUseToken = true;
        }

        if (!$isUseToken) {
            return response()->json(['error' => 'API_key is not token enough to use'], 400);
        }

        $this->handleCalculateTokenQty($shop);

        return $next($request);
    }

    protected function handleCalculateTokenQty($shop)
    {
        try {
            DB::beginTransaction();

            $setting = Setting::first();

            if ($setting->remaining == $shop->current_token_qty) {
                Mail::to($shop->admin->email)->send(new ReminderMail($setting));
            }

            $date = Carbon::today()->toDateString();

            $frequency = ShopFrequency::where('api_key', $shop->api_key)
                ->where('date', $date)
                ->first();

            if ($frequency) {
                $frequency->increment('daily_count');
            } else {
                ShopFrequency::create([
                    'shop_id' => $shop->id,
                    'api_key' => $shop->api_key,
                    'date' => $date,
                    'daily_count' => 1
                ]);
            }

            DB::commit();
            return;
        } catch (\Exception $exception) {
            DB::rollBack();
            Log::error($exception->getMessage());
            Log::error($exception);

            return;
        }
    }
}
