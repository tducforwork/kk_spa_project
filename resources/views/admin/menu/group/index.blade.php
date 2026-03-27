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
                                    <th>@lang('Location')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($groups as $group)
                                    <tr>
                                        <td>{{ __($group->name) }}</td>
                                        <td><span class="badge badge--primary">{{ $group->location }}</span></td>
                                        <td>
                                            @if ($group->status == 1)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <button class="btn btn-sm btn-outline--primary editBtn"
                                                    data-id="{{ $group->id }}" data-name="{{ $group->name }}"
                                                    data-location="{{ $group->location }}">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this group?')"
                                                    data-action="{{ route('admin.menu.group.status', $group->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to delete this group? All items will be unlinked from this group.')"
                                                    data-action="{{ route('admin.menu.group.remove', $group->id) }}">
                                                    <i class="las la-trash"></i> @lang('Delete')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($groups->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($groups) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    {{-- SAVE MODAL --}}
    <div id="groupModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Name')</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>@lang('Location')</label>
                            <input type="text" class="form-control" name="location" required
                                placeholder="e.g. main_menu, footer_menu">
                            <small class="text-muted"><i class="las la-info-circle"></i> @lang('Unique identifier for get_menu() helper')</small>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <button class="btn btn-outline--primary btn-sm addBtn">
        <i class="las la-plus"></i> @lang('Add New')
    </button>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";

            var modal = $('#groupModal');

            $('.addBtn').on('click', function() {
                modal.find('.modal-title').text("@lang('Add Menu Group')");
                modal.find('form').attr('action', "{{ route('admin.menu.group.store') }}");
                modal.find('input[name=name]').val('');
                modal.find('input[name=location]').val('');
                modal.modal('show');
            });

            $('.editBtn').on('click', function() {
                var data = $(this).data();
                modal.find('.modal-title').text("@lang('Edit Menu Group')");
                modal.find('form').attr('action', "{{ route('admin.menu.group.store', '') }}/" + data.id);
                modal.find('input[name=name]').val(data.name);
                modal.find('input[name=location]').val(data.location);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
