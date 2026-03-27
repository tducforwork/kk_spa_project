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
                                    <th>@lang('Room')</th>
                                    <th>@lang('Category')</th>
                                    <th>@lang('Price')</th>
                                    <th>@lang('Hot')</th>
                                    <th>@lang('Sort Order')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($rooms as $room)
                                    <tr>
                                        <td>
                                            <div class="user gap-2">
                                                <div class="thumb">
                                                    <img src="{{ getImage(getFilePath('room') . '/' . $room->image, getFileSize('room')) }}"
                                                        alt="room-image">
                                                </div>
                                                <span>{{ __($room->t->name ?? 'No Name') }}</span>
                                            </div>
                                        </td>
                                        <td>{{ __($room->category->t->name ?? 'None') }}</td>
                                        <td>{{ showAmount($room->price) }}</td>
                                        <td>
                                            @if ($room->is_hot == 1)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--warning">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>{{ $room->sort_order }}</td>
                                        <td>
                                            @if ($room->status == 1)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.room.edit', $room->id) }}"
                                                    class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </a>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this room?')"
                                                    data-action="{{ route('admin.room.status', $room->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to delete this room?')"
                                                    data-action="{{ route('admin.room.remove', $room->id) }}">
                                                    <i class="la la-trash"></i> @lang('Delete')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">
                                            {{ __($emptyMessage ?? 'No rooms found') }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($rooms->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($rooms) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.room.create') }}" class="btn btn-outline--primary btn-sm">
        <i class="las la-plus"></i> @lang('Add New')
    </a>
@endpush
