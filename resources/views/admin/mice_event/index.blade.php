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
                                    <th>@lang('Event')</th>
                                    <th>@lang('Featured')</th>
                                    <th>@lang('Sort Order')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($events as $event)
                                    <tr>
                                        <td>
                                            <div class="user gap-2">
                                                <div class="thumb">
                                                    <img src="{{ getImage(getFilePath('mice_event') . '/' . $event->avatar, getFileSize('mice_event')) }}"
                                                        alt="event-image">
                                                </div>
                                                <span>{{ __($event->t->name ?? 'No Name') }}</span>
                                            </div>
                                        </td>
                                        <td>
                                            @if ($event->is_featured == 1)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>{{ $event->sort_order }}</td>
                                       <td>
                                            @if ($event->status == 1)
                                                <span class="badge badge--success">@lang('Yes')</span>
                                            @else
                                                <span class="badge badge--danger">@lang('No')</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.mice.event.edit', $event->id) }}"
                                                    class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </a>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this event?')"
                                                    data-action="{{ route('admin.mice.event.status', $event->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to delete this event?')"
                                                    data-action="{{ route('admin.mice.event.remove', $event->id) }}">
                                                    <i class="la la-trash"></i> @lang('Delete')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">
                                            {{ __($emptyMessage ?? 'No events found') }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($events->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($events) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.mice.event.create') }}" class="btn btn-outline--primary btn-sm">
        <i class="las la-plus"></i> @lang('Add New')
    </a>
@endpush
