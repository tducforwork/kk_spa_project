<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\AdminRole;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class StaffController extends Controller
{
    public function index()
    {
        $pageTitle = 'Quản lý Nhân Viên (Staff)';
        $staffs    = Admin::where('id', '!=', 1)->with('role')->paginate(getPaginate());
        return view('admin.staff.index', compact('pageTitle', 'staffs'));
    }

    public function create()
    {
        $pageTitle = 'Thêm Nhân Viên Mới';
        $roles     = AdminRole::where('status', 1)->get();
        return view('admin.staff.create', compact('pageTitle', 'roles'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'     => 'required|string|max:40',
            'email'    => 'required|string|email|max:40|unique:admins,email',
            'username' => 'required|string|max:40|unique:admins,username',
            'password' => 'required|string|min:4|confirmed',
            'role_id'  => 'required|integer|exists:admin_roles,id'
        ]);

        $admin           = new Admin();
        $admin->name     = $request->name;
        $admin->email    = $request->email;
        $admin->username = $request->username;
        $admin->password = Hash::make($request->password);
        $admin->role_id  = $request->role_id;
        $admin->save();

        $notify[] = ['success', 'Thêm Nhân viên thành công.'];
        return back()->withNotify($notify);
    }

    public function edit($id)
    {
        $staff     = Admin::where('id', '!=', 1)->findOrFail($id);
        $pageTitle = 'Sửa Nhân Viên: ' . $staff->name;
        $roles     = AdminRole::where('status', 1)->get();

        return view('admin.staff.edit', compact('pageTitle', 'roles', 'staff'));
    }

    public function update(Request $request, $id)
    {
        $admin = Admin::where('id', '!=', 1)->findOrFail($id);

        $request->validate([
            'name'     => 'required|string|max:40',
            'email'    => ['required', 'string', 'email', 'max:40', Rule::unique('admins')->ignore($admin->id)],
            'username' => ['required', 'string', 'max:40', Rule::unique('admins')->ignore($admin->id)],
            'role_id'  => 'required|integer|exists:admin_roles,id',
            'password' => 'nullable|string|min:4|confirmed'
        ]);

        $admin->name     = $request->name;
        $admin->email    = $request->email;
        $admin->username = $request->username;
        $admin->role_id  = $request->role_id;

        if ($request->password) {
            $admin->password = Hash::make($request->password);
        }

        $admin->save();

        $notify[] = ['success', 'Cập nhật Nhân viên thành công.'];
        return back()->withNotify($notify);
    }
}
