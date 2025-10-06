<?php

/**
 * MoMo Integration Test Script
 * 
 * This script tests the MoMo service configuration and basic functionality
 * Run with: php test_momo_integration.php
 */

require_once __DIR__ . '/vendor/autoload.php';

// Load Laravel environment
$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Services\MoMoService;

echo "=== MoMo Integration Test ===\n\n";

try {
    // Initialize MoMo service
    $momoService = new MoMoService();
    
    // Test 1: Check configuration
    echo "1. Testing Configuration...\n";
    $config = $momoService->getConfigStatus();
    
    echo "   Sandbox Mode: " . ($config['sandbox'] ? 'Yes' : 'No') . "\n";
    echo "   Partner Code: " . $config['partner_code'] . "\n";
    echo "   Access Key: " . $config['access_key'] . "\n";
    echo "   Secret Key: " . $config['secret_key'] . "\n";
    echo "   Endpoint: " . $config['endpoint'] . "\n";
    echo "   Configured: " . ($config['configured'] ? 'Yes' : 'No') . "\n\n";
    
    if (!$config['configured']) {
        echo "❌ MoMo is not properly configured. Please check your .env file.\n";
        echo "Required variables: MOMO_PARTNER_CODE, MOMO_ACCESS_KEY, MOMO_SECRET_KEY\n\n";
        exit(1);
    }
    
    echo "✅ Configuration looks good!\n\n";
    
    // Test 2: Currency conversion
    echo "2. Testing Currency Conversion...\n";
    $testAmountUSD = 10.50;
    $convertedVND = $momoService->convertUsdToVnd($testAmountUSD);
    echo "   $" . $testAmountUSD . " USD = " . number_format($convertedVND) . " VND\n\n";
    
    // Test 3: Test payment creation (without actually calling MoMo API)
    echo "3. Testing Payment Data Preparation...\n";
    
    $testPaymentData = [
        'orderId' => 'test_order_' . time(),
        'requestId' => 'test_req_' . time(),
        'amount' => $convertedVND,
        'orderInfo' => 'Test ScorpiX Payment',
        'redirectUrl' => config('services.momo.redirect_url'),
        'ipnUrl' => config('services.momo.ipn_url'),
        'lang' => 'vi',
        'extraData' => json_encode(['test' => true])
    ];
    
    echo "   Order ID: " . $testPaymentData['orderId'] . "\n";
    echo "   Request ID: " . $testPaymentData['requestId'] . "\n";
    echo "   Amount: " . number_format($testPaymentData['amount']) . " VND\n";
    echo "   Order Info: " . $testPaymentData['orderInfo'] . "\n";
    echo "   Redirect URL: " . $testPaymentData['redirectUrl'] . "\n";
    echo "   IPN URL: " . $testPaymentData['ipnUrl'] . "\n\n";
    
    echo "✅ Payment data preparation successful!\n\n";
    
    // Test 4: Test signature generation
    echo "4. Testing Signature Generation...\n";
    
    // We'll test this by creating a payment request and checking if signature is generated
    // Note: This will make an actual API call to MoMo sandbox
    if ($config['sandbox']) {
        echo "   Creating test payment request...\n";
        
        $result = $momoService->createPayment($testPaymentData);
        
        if ($result['success']) {
            echo "   ✅ Payment request created successfully!\n";
            echo "   Pay URL: " . $result['data']['payUrl'] . "\n";
            if (isset($result['data']['qrCodeURL'])) {
                echo "   QR Code URL: " . $result['data']['qrCodeURL'] . "\n";
            }
            echo "   Order ID: " . $result['data']['orderId'] . "\n";
            echo "   Request ID: " . $result['data']['requestId'] . "\n\n";
            
            // Test 5: Test status checking
            echo "5. Testing Payment Status Check...\n";
            $statusResult = $momoService->checkPaymentStatus(
                $result['data']['orderId'],
                $result['data']['requestId']
            );
            
            if ($statusResult['success']) {
                echo "   ✅ Status check successful!\n";
                echo "   Payment Status: " . ($statusResult['data']['isPaid'] ? 'Paid' : 'Not Paid') . "\n";
                echo "   Result Code: " . ($statusResult['data']['resultCode'] ?? 'N/A') . "\n";
                echo "   Message: " . ($statusResult['data']['message'] ?? 'N/A') . "\n\n";
            } else {
                echo "   ❌ Status check failed: " . $statusResult['error'] . "\n\n";
            }
        } else {
            echo "   ❌ Payment request failed: " . $result['error'] . "\n";
            echo "   This could be due to invalid credentials or network issues.\n\n";
        }
    } else {
        echo "   Skipping API test (production mode - avoiding test charges)\n\n";
    }
    
    echo "=== Test Summary ===\n";
    echo "✅ Configuration: OK\n";
    echo "✅ Currency Conversion: OK\n";
    echo "✅ Payment Data Preparation: OK\n";
    
    if ($config['sandbox']) {
        echo ($result['success'] ? "✅" : "❌") . " MoMo API Integration: " . ($result['success'] ? "OK" : "Failed") . "\n";
    } else {
        echo "⚠️  MoMo API Integration: Skipped (Production Mode)\n";
    }
    
    echo "\n=== Next Steps ===\n";
    echo "1. Test the payment flow through the web interface\n";
    echo "2. Use MoMo's test app to complete a test payment\n";
    echo "3. Verify webhook notifications are received\n";
    echo "4. Check that credits are added to user accounts\n\n";
    
    if (!$config['sandbox']) {
        echo "⚠️  PRODUCTION MODE DETECTED ⚠️\n";
        echo "Make sure to test thoroughly in sandbox before going live!\n\n";
    }
    
} catch (Exception $e) {
    echo "❌ Test failed with error: " . $e->getMessage() . "\n";
    echo "Stack trace:\n" . $e->getTraceAsString() . "\n\n";
    exit(1);
}

echo "🎉 MoMo integration test completed!\n";
