<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdminRole;
use App\Models\AdminPermission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class AdminRoleController extends Controller
{
    public function index()
    {
        $pageTitle = 'Quản lý Phân Quyền (Roles)';
        $roles = AdminRole::withCount('permissions')->paginate(getPaginate());
        return view('admin.roles.index', compact('pageTitle', 'roles'));
    }

    public function create()
    {
        $pageTitle = 'Thêm Nhóm Quyền Mới';
        // Get all admin routes that have 'admin.' prefix
        $routes = Route::getRoutes()->getRoutesByName();
        $adminRoutes = [];

        foreach ($routes as $name => $route) {
            if (strpos($name, 'admin.') === 0 && !in_array($name, ['admin.login', 'admin.password.reset'])) {
                $adminRoutes[] = $name;
            }
        }

        return view('admin.roles.create', compact('pageTitle', 'adminRoutes'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:40|unique:admin_roles,name',
            'permissions' => 'required|array'
        ], [
            'name.required' => 'Vui lòng nhập tên Nhóm quyền.',
            'name.unique' => 'Tên Nhóm quyền này đã tồn tại.',
            'permissions.required' => 'Bạn phải chọn ít nhất 1 quyền cho nhóm này.'
        ]);

        $role = AdminRole::create([
            'name' => $request->name,
            'status' => $request->status ? 1 : 0
        ]);

        foreach ($request->permissions as $route) {
            AdminPermission::create([
                'role_id' => $role->id,
                'permission_route' => $route
            ]);
        }

        $notify[] = ['success', 'Tạo Nhóm Quyền thành công.'];
        return back()->withNotify($notify);
    }

    public function edit($id)
    {
        $role = AdminRole::with('permissions')->findOrFail($id);
        $pageTitle = 'Chỉnh sửa Quyền: ' . $role->name;

        $routes = Route::getRoutes()->getRoutesByName();
        $adminRoutes = [];

        foreach ($routes as $name => $route) {
            if (strpos($name, 'admin.') === 0 && !in_array($name, ['admin.login', 'admin.password.reset'])) {
                $adminRoutes[] = $name;
            }
        }

        $currentPermissions = $role->permissions->pluck('permission_route')->toArray();

        return view('admin.roles.edit', compact('pageTitle', 'role', 'adminRoutes', 'currentPermissions'));
    }

    public function update(Request $request, $id)
    {
        $role = AdminRole::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:40|unique:admin_roles,name,' . $id,
            'permissions' => 'required|array'
        ]);

        $role->update([
            'name' => $request->name,
            'status' => $request->status ? 1 : 0
        ]);

        // Wipe old permissions
        AdminPermission::where('role_id', $role->id)->delete();

        // Save new permissions
        foreach ($request->permissions as $route) {
            AdminPermission::create([
                'role_id' => $role->id,
                'permission_route' => $route
            ]);
        }

        $notify[] = ['success', 'Cập nhật Nhóm Quyền thành công.'];
        return back()->withNotify($notify);
    }
}
