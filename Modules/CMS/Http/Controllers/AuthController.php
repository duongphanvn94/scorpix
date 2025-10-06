<?php

namespace Modules\CMS\Http\Controllers;

use App\Enums\AdminStatus;
use App\Enums\Role;
use App\Enums\ShopStatus;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Shop;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use Inertia\Response;
use Laravel\Socialite\Facades\Socialite;
use Modules\CMS\Contracts\Services\AuthService;
use Illuminate\Validation\ValidationException;
use Modules\CMS\Http\Requests\LoginRequest;

class AuthController extends Controller
{
    /**
     * @param AuthService $authService
     */
    public function __construct(private readonly AuthService $authService)
    {
    }

    /**
     * @return Response
     */
    public function formLogin(): Response
    {
        return Inertia::render('login/Index');
    }

    /**
     * @param LoginRequest $request
     * @return RedirectResponse|JsonResponse
     */
    public function login(LoginRequest $request): RedirectResponse|JsonResponse
    {
        try {
            $this->authService->login(request: $request);

            // Get the authenticated user using admin guard
            $user = Auth::guard('admin')->user();

            // Handle AJAX requests
            if ($request->expectsJson() || $request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Login successful',
                    'user' => [
                        'id' => $user->id,
                        'name' => $user->name,
                        'email' => $user->email,
                        'role' => $user->role->value,
                        'role_name' => $user->role->name,
                        'avatar' => $user->avatar,
                        'credit' => $user->credit ?? 0,
                        'shop_id' => $user->shop_id
                    ],
                    'redirect_url' => $this->getRedirectUrl($request, $user)
                ]);
            }

            // Handle traditional form submissions
            // Check if redirect_to parameter is set for shop users
            if ($request->has('redirect_to') && $request->redirect_to === 'dashboard' && $user && $user->role === Role::SHOP) {
                // Ensure session is committed before redirect
                session()->save();
                return redirect('/dashboard');
            }

            // Default redirect for admin users
            session()->save();
            return to_route('cms.dashboard');

        } catch (ValidationException $e) {
            // Handle AJAX requests
            if ($request->expectsJson() || $request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid email or password',
                    'errors' => $e->errors()
                ], 422);
            }

            // Handle traditional form submissions
            return back()->withErrors($e->errors())->withInput($request->only('email'));
        }
    }

    /**
     * Get redirect URL based on user role and request parameters
     */
    private function getRedirectUrl(Request $request, $user): string
    {
        // Check if redirect_to parameter is set for shop users
        if ($request->has('redirect_to') && $request->redirect_to === 'dashboard' && $user && $user->role === Role::SHOP) {
            return '/dashboard';
        }

        // Default redirect for admin users
        return route('cms.dashboard');
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function logout(Request $request): RedirectResponse
    {
        $user = Auth::guard('admin')->user();

        $this->authService->logout(request: $request);

        // Check if user was shop role, redirect to homepage instead of cms login
        if ($user && $user->role === Role::SHOP) {
            return redirect('/');
        }

        // Default redirect for admin users
        return to_route('cms.login');
    }

    /**
     * Get current authenticated user info for frontend
     * @param Request $request
     * @return JsonResponse
     */
    public function currentUser(Request $request): JsonResponse
    {
        // Use admin guard to get the user
        $user = Auth::guard('admin')->user();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Not authenticated'
            ], 401);
        }

        // Get shop information if user has shop_id
        $credit = 0;
        if ($user->shop_id) {
            $shop = \App\Models\Shop::find($user->shop_id);
            if ($shop) {
                $credit = $shop->current_token_qty ?? 0;
            }
        }

        return response()->json([
            'success' => true,
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role' => $user->role->value,
                'role_name' => $user->role->name,
                'avatar' => $user->avatar,
                'credit' => $credit,
                'shop_id' => $user->shop_id
            ]
        ]);
    }

    /**
     * @param Request $request
     * @return RedirectResponse|JsonResponse
     */
    public function redirectToGoogle(Request $request): RedirectResponse|JsonResponse
    {
        // Handle AJAX requests
        if ($request->expectsJson() || $request->ajax()) {
            return response()->json([
                'redirect_url' => Socialite::driver('google')->redirect()->getTargetUrl()
            ]);
        }

        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback(Request $request): RedirectResponse|JsonResponse
    {
        try {
            $googleUser = Socialite::driver('google')->user();

            $admin = Admin::where('email', $googleUser->getEmail())->first();

            if (!$admin) {
                $admin = Admin::create([
                    'name'     => $googleUser->getName(),
                    'email'    => $googleUser->getEmail(),
                    'password' => bcrypt(uniqid()),
                    'role'     => Role::SHOP->value,
                    'shop_id'  => null,
                    'status'   => \App\Enums\RequestKeyFlag::REQUEST->value,
                    'google_id' => $googleUser->getId(),
                    'avatar'   => $googleUser->getAvatar(),
                ]);

                $shop = Shop::create([
                    'admin_id' => $admin->id,
                    'name'     => $googleUser->getName(),
                    'status'   => ShopStatus::INACTIVE->value,
                    'api_key'   => null, // API key will be generated when domain is updated
                ]);

                $admin->update(['shop_id' => $shop->id]);
            } else {
                // Update Google ID and avatar if not set
                if (!$admin->google_id) {
                    $admin->update([
                        'google_id' => $googleUser->getId(),
                        'avatar' => $googleUser->getAvatar(),
                    ]);
                }
            }

            auth('admin')->login($admin, true);

            // Handle AJAX requests
            if ($request->expectsJson() || $request->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Google login successful',
                    'user' => [
                        'id' => $admin->id,
                        'name' => $admin->name,
                        'email' => $admin->email,
                        'role' => $admin->role->value,
                        'role_name' => $admin->role->name,
                        'avatar' => $admin->avatar,
                        'credit' => $admin->credit ?? 0,
                        'shop_id' => $admin->shop_id
                    ],
                    'redirect_url' => $this->getRedirectUrl($request, $admin)
                ]);
            }

            // Check if user is admin or shop and redirect accordingly
            if ($admin->role === Role::ADMIN) {
                return redirect()->route('cms.dashboard');
            } else {
                // For shop users, redirect to shop dashboard
                return redirect('/dashboard');
            }

        } catch (\Exception $e) {
            Log::error('Google OAuth Error: ' . $e->getMessage());

            // Handle AJAX requests
            if ($request->expectsJson() || $request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Google login failed. Please try again.',
                    'errors' => ['google' => ['Authentication failed']]
                ], 422);
            }

            return redirect()->route('login.form')->withErrors(['login' => 'Google login failed. Please try again.']);
        }
    }
}
