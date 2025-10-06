<?php

namespace Modules\CMS\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class AdminAuthenticate extends Middleware
{
    public function handle($request, \Closure $next, ...$guards)
    {
        $this->auth->shouldUse('admin');

        if (!Auth::guard('admin')->check()) {
            return redirect()->route('login.form');
        }

        // Get the authenticated user
        $user = Auth::guard('admin')->user();
        
        // Share admin info with all Inertia views only if user exists
        if ($user) {
            Inertia::share('auth.user', fn () => [
                'id'     => $user->id,
                'name'   => $user->name,
                'email'  => $user->email,
                'role'   => $user->role,
                'status' => $user->status,
            ]);
        }

        return $next($request);
    }

    protected function redirectTo(Request $request): ?string
    {
        return $request->expectsJson() ? null : route('login.form');
    }
} 