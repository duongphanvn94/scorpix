<?php

/**
 * MoMo Integration Demo Script
 * 
 * This script demonstrates MoMo payment integration with mock data
 * Shows how the system would work with real credentials
 */

require_once __DIR__ . '/vendor/autoload.php';

// Load Laravel environment
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

echo "=== MoMo Integration Demo ===\n\n";

// Demo 1: Show what a successful configuration looks like
echo "1. Example Configuration:\n";
echo "   Partner Code: MOMOIQA420180417 (example)\n";
echo "   Access Key: F8BBA842ECF85 (example)\n";
echo "   Secret Key: K951B6PE1waDMi640xX08PD3vg6EkVlz (example)\n";
echo "   Sandbox Mode: Yes\n";
echo "   Endpoint: https://test-payment.momo.vn/v2/gateway/api/create\n\n";

// Demo 2: Show payment data structure
echo "2. Example Payment Request:\n";
$examplePayment = [
    'partnerCode' => 'MOMOIQA420180417',
    'orderId' => 'scorpix_' . time(),
    'requestId' => 'req_' . time(),
    'amount' => 252000, // $10.50 USD = 252,000 VND
    'orderInfo' => 'ScorpiX Professional Plan - 5000 credits',
    'redirectUrl' => 'https://yoursite.com/pricing',
    'ipnUrl' => 'https://yoursite.com/api/v1/payment/momo/notify',
    'requestType' => 'captureWallet',
    'signature' => 'abc123...', // Generated with HMAC-SHA256
];

foreach ($examplePayment as $key => $value) {
    echo "   {$key}: {$value}\n";
}
echo "\n";

// Demo 3: Show expected response structure
echo "3. Example MoMo API Response:\n";
$exampleResponse = [
    'partnerCode' => 'MOMOIQA420180417',
    'orderId' => 'scorpix_1691654321',
    'requestId' => 'req_1691654321',
    'amount' => 252000,
    'responseTime' => 1691654321000,
    'message' => 'Successful.',
    'resultCode' => 0,
    'payUrl' => 'https://test-payment.momo.vn/gw_payment/transactionProcessor?partnerCode=MOMOIQA420180417&orderId=scorpix_1691654321',
    'qrCodeURL' => 'https://test-payment.momo.vn/gw_payment/qr/qr_code.png?partnerCode=MOMOIQA420180417&orderId=scorpix_1691654321',
    'deeplink' => 'momo://payment?partnerCode=MOMOIQA420180417&orderId=scorpix_1691654321'
];

foreach ($exampleResponse as $key => $value) {
    echo "   {$key}: {$value}\n";
}
echo "\n";

// Demo 4: Show signature generation process
echo "4. Signature Generation Process:\n";
echo "   Raw signature string:\n";
echo "   accessKey=F8BBA842ECF85&amount=252000&extraData=&ipnUrl=https://yoursite.com/api/v1/payment/momo/notify&orderId=scorpix_1691654321&orderInfo=ScorpiX Professional Plan - 5000 credits&partnerCode=MOMOIQA420180417&redirectUrl=https://yoursite.com/pricing&requestId=req_1691654321&requestType=captureWallet\n\n";
echo "   Generated signature (HMAC-SHA256):\n";
echo "   996ed81d68a1b05c99516835e404b2d0146d9b12fbcecbf80c7e51df51cac85e\n\n";

// Demo 5: Show payment status check
echo "5. Payment Status Check:\n";
$statusExample = [
    'partnerCode' => 'MOMOIQA420180417',
    'orderId' => 'scorpix_1691654321',
    'requestId' => 'req_1691654321',
    'resultCode' => 0,
    'message' => 'Successful.',
    'transId' => 2758312164,
    'amount' => 252000,
    'payType' => 'qr'
];

foreach ($statusExample as $key => $value) {
    echo "   {$key}: {$value}\n";
}
echo "\n";

// Demo 6: Show webhook data
echo "6. Webhook (IPN) Data Structure:\n";
$webhookExample = [
    'partnerCode' => 'MOMOIQA420180417',
    'orderId' => 'scorpix_1691654321',
    'requestId' => 'req_1691654321',
    'amount' => 252000,
    'orderInfo' => 'ScorpiX Professional Plan - 5000 credits',
    'orderType' => 'momo_wallet',
    'transId' => 2758312164,
    'resultCode' => 0,
    'message' => 'Successful.',
    'payType' => 'qr',
    'responseTime' => 1691654325000,
    'extraData' => '',
    'signature' => 'def456...'
];

foreach ($webhookExample as $key => $value) {
    echo "   {$key}: {$value}\n";
}
echo "\n";

// Demo 7: Show database record structure
echo "7. Database Record (subscriber_histories):\n";
$dbExample = [
    'id' => 123,
    'customer_id' => 1,
    'product_id' => 2,
    'amount_raw' => 10.50, // USD
    'amount' => 252000, // VND
    'payment_method' => 'momo',
    'payment_status' => 'SUCCESS',
    'order_id' => 'scorpix_1691654321',
    'payment_reference' => '2758312164',
    'token_qty' => 5000,
    'metadata' => json_encode([
        'momo_request_id' => 'req_1691654321',
        'momo_trans_id' => '2758312164',
        'momo_pay_type' => 'qr',
        'exchange_rate' => 24000
    ]),
    'paid_at' => '2024-08-10 10:30:25'
];

foreach ($dbExample as $key => $value) {
    echo "   {$key}: {$value}\n";
}
echo "\n";

echo "=== Integration Flow ===\n";
echo "1. User selects plan on /pricing page\n";
echo "2. Frontend calls POST /api/v1/payment/generate-momo\n";
echo "3. Backend creates payment request with MoMo API\n";
echo "4. User scans QR code or opens MoMo app\n";
echo "5. User completes payment in MoMo app\n";
echo "6. MoMo sends webhook to /api/v1/payment/momo/notify\n";
echo "7. Backend verifies webhook and updates database\n";
echo "8. Credits are added to user's account\n";
echo "9. User can verify payment status via frontend\n\n";

echo "=== Files Created/Modified ===\n";
echo "✅ app/Services/MoMoService.php - MoMo API integration\n";
echo "✅ app/Http/Controllers/Api/PaymentController.php - Added MoMo methods\n";
echo "✅ config/services.php - Added MoMo configuration\n";
echo "✅ routes/api.php - Added MoMo API routes\n";
echo "✅ resources/js/components/pages/Pricing.vue - Updated MoMo frontend\n";
echo "✅ docs/MOMO_INTEGRATION.md - Complete documentation\n";
echo "✅ docs/MOMO_SETUP_GUIDE.md - Setup instructions\n";
echo "✅ .env.example - Added MoMo environment variables\n";
echo "✅ test_momo_integration.php - Integration test script\n\n";

echo "=== Next Steps ===\n";
echo "1. Register for MoMo business account\n";
echo "2. Get sandbox credentials\n";
echo "3. Update .env file with real credentials\n";
echo "4. Run: php test_momo_integration.php\n";
echo "5. Test payment flow through web interface\n";
echo "6. Set up webhook endpoint (use ngrok for local testing)\n";
echo "7. Test complete payment cycle\n";
echo "8. Move to production when ready\n\n";

echo "🎉 MoMo integration is ready for testing!\n";

// Show current environment status
echo "\n=== Current Environment Status ===\n";
$hasCredentials = !empty(env('MOMO_PARTNER_CODE')) && !empty(env('MOMO_ACCESS_KEY')) && !empty(env('MOMO_SECRET_KEY'));
echo "Credentials configured: " . ($hasCredentials ? "✅ Yes" : "❌ No") . "\n";
echo "Sandbox mode: " . (env('MOMO_SANDBOX', true) ? "✅ Yes" : "⚠️ Production") . "\n";
echo "Exchange rate: " . env('MOMO_USD_TO_VND_RATE', 24000) . " VND per USD\n";

if (!$hasCredentials) {
    echo "\n⚠️  To enable MoMo payments, add credentials to .env:\n";
    echo "MOMO_PARTNER_CODE=your_partner_code\n";
    echo "MOMO_ACCESS_KEY=your_access_key\n";
    echo "MOMO_SECRET_KEY=your_secret_key\n";
}
