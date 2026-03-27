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
                                <th>@lang('Name')</th>
                                <th>@lang('Total Permissions')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($roles as $role)
                            <tr>
                                <td>
                                    <span class="fw-bold">{{__($role->name)}}</span>
                                </td>
                                <td>
                                    <span class="badge badge--primary">{{ $role->permissions_count }}</span>
                                </td>
                                <td>
                                    @php
                                    echo $role->status == 1 ? '<span class="badge badge--success">Hoạt động</span>' : '<span class="badge badge--danger">Khóa</span>';
                                    @endphp
                                </td>
                                <td>
                                    <div class="button--group">
                                        <a href="{{ route('admin.roles.edit', $role->id) }}" class="btn btn-sm btn-outline--primary">
                                            <i class="la la-pencil"></i> @lang('Edit')
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
            @if ($roles->hasPages())
            <div class="card-footer py-4">
                {{ paginateLinks($roles) }}
            </div>
            @endif
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<a class="btn btn-sm btn-outline--primary" href="{{ route('admin.roles.create') }}"><i class="las la-plus"></i>@lang('Thêm Mới')</a>
@endpush
