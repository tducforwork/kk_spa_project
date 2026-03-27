@extends('admin.layouts.app')

@section('panel')
<div class="row">
    <div class="col-lg-12">
        <div class="card b-radius--10 ">
            <div class="card-body p-0">
                <div class="table-responsive--md  table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                            <tr>
                                <th>@lang('Tên Nhân Viên')</th>
                                <th>@lang('Email') | @lang('Username')</th>
                                <th>@lang('Vai Trò (Role)')</th>
                                <th>@lang('Hành Động')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($staffs as $staff)
                            <tr>
                                <td>
                                    <span class="fw-bold">{{$staff->name}}</span>
                                </td>
                                <td>
                                    <span>{{ $staff->email }}</span><br>
                                    <a href="javascript:voide(0)"><span>@</span>{{ $staff->username }}</a>
                                </td>
                                <td>
                                    @if($staff->role)
                                    <span class="badge badge-pill bg--primary">{{ $staff->role->name }}</span>
                                    @else
                                    <span class="badge badge-pill bg--danger">Chưa cấp quyền</span>
                                    @endif
                                </td>
                                <td>
                                    <div class="button--group">
                                        <a href="{{ route('admin.staff.edit', $staff->id) }}" class="btn btn-sm btn-outline--primary">
                                            <i class="la la-pencil"></i> @lang('Sửa')
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                            @endforelse

                        </tbody>
                    </table><!-- table end -->
                </div>
            </div>
            @if ($staffs->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($staffs) }}
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<a class="btn btn-sm btn-outline--primary" href="{{ route('admin.staff.create') }}"><i class="las la-plus"></i>@lang('Thêm Nhân Viên')</a>
@endpush
