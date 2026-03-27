@extends('admin.layouts.app')

@section('panel')
<div class="row mb-none-30">
    <div class="col-lg-12 col-md-12 mb-30">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('admin.staff.update', $staff->id) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Họ và Tên')</label>
                                <input type="text" name="name" class="form-control" value="{{ $staff->name }}" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Nhóm Quyền (Role)')</label>
                                <select name="role_id" class="form-control" required>
                                    <option value="" disabled>-- Chọn nhóm quyền --</option>
                                    @foreach($roles as $role)
                                    <option value="{{ $role->id }}" {{ $staff->role_id == $role->id ? 'selected' : '' }}>{{ $role->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Email')</label>
                                <input type="email" name="email" class="form-control" value="{{ $staff->email }}" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Username')</label>
                                <input type="text" name="username" class="form-control" value="{{ $staff->username }}" required>
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                            <h6>Mật Khẩu Mới (Bỏ trống nếu không đổi)</h6>
                            <hr>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Mật khẩu')</label>
                                <input type="password" name="password" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>@lang('Nhập lại Mật khẩu')</label>
                                <input type="password" name="password_confirmation" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="form-group mt-4">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Cập Nhật')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<a href="{{ route('admin.staff.index') }}" class="btn btn-sm btn-outline--primary"><i class="las la-undo"></i> @lang('Trở về') </a>
@endpush
