@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--md table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('Name')</th>
                                    <th>@lang('Parent')</th>
                                    <th>@lang('Order')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($categories as $category)
                                    <tr>
                                        <td>
                                            <div class="user gap-2">
                                                <div class="thumb">
                                                    <img src="{{ getImage(getFilePath('post_category') . '/' . $category->image, getFileSize('post_category')) }}" alt="category-image">
                                                </div>
                                                <span>{{ __($category->t->name ?? 'No Name') }}</span>
                                            </div>
                                        </td>
                                        <td>{{ __($category->parent->t->name ?? 'None') }}</td>
                                        <td>{{ $category->order }}</td>
                                        <td>@php echo $category->statusBadge; @endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.post.category.edit', $category->id) }}" class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </a>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this category?')"
                                                    data-action="{{ route('admin.post.category.status', $category->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage ?? 'No categories found') }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($categories->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($categories) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.post.category.create') }}" class="btn btn-outline--primary btn-sm">
        <i class="las la-plus"></i> @lang('Add New')
    </a>
@endpush
