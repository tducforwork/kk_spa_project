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
                                    <th>@lang('Restaurant')</th>
                                    <th>@lang('Category')</th>
                                    <th>@lang('Sort Order')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($restaurants as $restaurant)
                                    <tr>
                                        <td>
                                            <div class="user gap-2">
                                                <div class="thumb">
                                                    <img src="{{ getImage(getFilePath('restaurant') . '/' . $restaurant->image, getFileSize('restaurant')) }}"
                                                        alt="restaurant-image">
                                                </div>
                                                <span>{{ __($restaurant->t->name ?? 'No Name') }}</span>
                                            </div>
                                        </td>
                                        <td>{{ __($restaurant->category->t->name ?? 'None') }}</td>
                                        <td>{{ $restaurant->sort_order }}</td>
                                        <td>
                                            @if ($restaurant->status == 1)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.restaurant.edit', $restaurant->id) }}"
                                                    class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </a>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this restaurant?')"
                                                    data-action="{{ route('admin.restaurant.status', $restaurant->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to delete this restaurant?')"
                                                    data-action="{{ route('admin.restaurant.remove', $restaurant->id) }}">
                                                    <i class="la la-trash"></i> @lang('Delete')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">
                                            {{ __($emptyMessage ?? 'No restaurants found') }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($restaurants->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($restaurants) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.restaurant.create') }}" class="btn btn-outline--primary btn-sm">
        <i class="las la-plus"></i> @lang('Add New')
    </a>
@endpush
