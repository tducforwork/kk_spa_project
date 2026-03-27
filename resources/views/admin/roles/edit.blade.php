@extends('admin.layouts.app')

@section('panel')
<div class="row mb-none-30">
    <div class="col-lg-12 col-md-12 mb-30">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('admin.roles.update', $role->id) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label>@lang('Role Name')</label>
                                <input type="text" name="name" class="form-control" value="{{ $role->name }}" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>@lang('Status')</label>
                                <input type="checkbox" data-width="100%" data-onstyle="-success" data-offstyle="-danger"
                                    data-bs-toggle="toggle" data-on="@lang('Active')" data-off="@lang('Inactive')" name="status" {{ $role->status ? 'checked' : '' }}>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-md-12">
                            <h5>@lang('Assign Permissions')</h5>
                            <hr>
                        </div>
                        @foreach($adminRoutes as $route)
                        <div class="col-md-4 col-sm-6 mb-3">
                            <div class="form-check form-check-primary">
                                <input class="form-check-input" type="checkbox" name="permissions[]" value="{{ $route }}" id="perm_{{ $loop->index }}"
                                    {{ in_array($route, $currentPermissions) ? 'checked' : '' }}>
                                <label class="form-check-label" for="perm_{{ $loop->index }}">
                                    <code>{{ $route }}</code>
                                </label>
                            </div>
                        </div>
                        @endforeach
                    </div>

                    <div class="form-group mt-4">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Update')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection

@push('breadcrumb-plugins')
<a href="{{ route('admin.roles.index') }}" class="btn btn-sm btn-outline--primary"><i class="las la-undo"></i> @lang('Back') </a>
@endpush
