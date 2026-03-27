<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckAdminPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $admin = auth()->guard('admin')->user();

        if (!$admin) {
            return redirect()->route('admin.login');
        }

        // Super Admin (role_id = 0) has all permissions
        if ($admin->role_id == 0) {
            return $next($request);
        }

        // If sub-admin, check status of their role
        if ($admin->role && $admin->role->status == 0) {
            auth()->guard('admin')->logout();
            $notify[] = ['error', 'Nhóm quyền của bạn đã bị khóa. Vui lòng liên hệ Quản trị viên.'];
            return redirect()->route('admin.login')->withNotify($notify);
        }

        // Check if the current route is in their allowed permissions list
        $currentRoute = \Route::currentRouteName();
        $baseRoutes = ['admin.dashboard', 'admin.profile', 'admin.password', 'admin.login', 'admin.logout'];

        // Always allow base routes (dashboard, profile update, logout)
        if (in_array($currentRoute, $baseRoutes)) {
            return $next($request);
        }

        $permissions = $admin->role->permissions->pluck('permission_route')->toArray();

        if (in_array($currentRoute, $permissions)) {
            return $next($request);
        }

        abort(403, 'Bạn không có quyền truy cập chức năng này.');
    }
}
