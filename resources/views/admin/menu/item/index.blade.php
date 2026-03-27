@extends('admin.layouts.app')
@section('panel')
    <div class="row">

        <div class="col-lg-12">
            <div class="show-filter mb-3 text-end">
                <button type="button" class="btn btn-outline--primary showFilterBtn btn-sm"><i class="las la-filter"></i>
                    @lang('Filter')</button>
            </div>
            <div class="card b-radius--10 mb-3 responsive-filter-card ">
                <div class="card-body">
                    <form action="">
                        <div class="d-flex flex-wrap gap-4">
                            <div class="flex-grow-1">
                                <label>@lang('Group')</label>
                                <select name="group_id" class="form-control">
                                    <option value="">@lang('All Groups')</option>
                                    @foreach ($groups as $group)
                                        <option value="{{ $group->id }}" @selected(request()->group_id == $group->id)>
                                            {{ __($group->name) }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="flex-grow-1">
                                <label>@lang('Location')</label>
                                <select name="location" class="form-control">
                                    <option value="">@lang('All Locations')</option>
                                    @foreach ($locations as $loc)
                                        <option value="{{ $loc }}" @selected(request()->location == $loc)>{{ $loc }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="flex-grow-1 align-self-end">
                                <button class="btn btn--primary w-100 h-45"><i class="fas fa-filter"></i>
                                    @lang('Filter')</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card b-radius--10 ">
                <div class="card-body p-0">
                    <div class="table-responsive--md  table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('Title')</th>
                                    <th>@lang('Group')</th>
                                    <th>@lang('Parent')</th>
                                    <th>@lang('Order')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($items as $item)
                                    @php
                                        $hasChildren = $items->where('parent_id', $item->id)->count() > 0;
                                    @endphp
                                    <tr class="menu-item-row @if ($item->parent_id != 0) child-row @endif"
                                        data-id="{{ $item->id }}" data-parent-id="{{ $item->parent_id }}"
                                        @if ($item->parent_id != 0) style="display: none;" @endif>
                                        <td>
                                            @if ($item->depth > 0)
                                                {{ str_repeat('—', $item->depth) }}
                                            @endif

                                            @if ($hasChildren)
                                                <span class="toggle-menu me-2" style="cursor: pointer;">
                                                    <i class="las la-chevron-right toggle-icon"></i>
                                                </span>
                                            @endif

                                            {{ __($item->getTranslation()?->title ?? $item->title) }}
                                        </td>
                                        <td>{{ __($item->group->name) }} ({{ $item->group->location }})</td>
                                        <td>{{ $item->parent ? __($item->parent->getTranslation()?->title ?? $item->parent->title) : __('Root') }}</td>
                                        <td>{{ $item->order }}</td>
                                        <td>
                                            @if ($item->status == \App\Constants\Status::ENABLE)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.menu.item.edit', $item->id) }}"
                                                    class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </a>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this item?')"
                                                    data-action="{{ route('admin.menu.item.status', $item->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to delete this item?')"
                                                    data-action="{{ route('admin.menu.item.remove', $item->id) }}">
                                                    <i class="las la-trash"></i> @lang('Delete')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">@lang('No menu items found')</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('style')
    <style>
        .toggle-icon {
            transition: transform 0.3s ease;
        }

        .toggle-icon.expanded {
            transform: rotate(90deg);
        }

        .child-row {
            background-color: #f9f9f9;
        }
    </style>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            $('.toggle-menu').on('click', function() {
                var $row = $(this).closest('tr');
                var id = $row.data('id');
                var $icon = $(this).find('.toggle-icon');

                // Toggle children
                var $children = $('.menu-item-row[data-parent-id="' + id + '"]');

                if ($icon.hasClass('expanded')) {
                    // Collapse: hide all descendants
                    collapseRecursive(id);
                    $icon.removeClass('expanded');
                } else {
                    // Expand: show immediate children
                    $children.show();
                    $icon.addClass('expanded');
                }
            });

            function collapseRecursive(parentId) {
                var $children = $('.menu-item-row[data-parent-id="' + parentId + '"]');
                $children.each(function() {
                    var childId = $(this).data('id');
                    $(this).hide();
                    $(this).find('.toggle-icon').removeClass('expanded');
                    collapseRecursive(childId);
                });
            }
        })(jQuery);
    </script>
@endpush

@push('breadcrumb-plugins')
    <a href="{{ route('admin.menu.item.create') }}" class="btn btn-outline--primary btn-sm">
        <i class="las la-plus"></i> @lang('Add New')
    </a>
@endpush
