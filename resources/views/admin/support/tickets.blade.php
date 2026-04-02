@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light">
                            <thead>
                                <tr>
                                    <th>@lang('Subject')</th>
                                    <th>@lang('Submitted By')</th>
                                    <th>@lang('Origin')</th>
                                    @if(request()->routeIs('admin.ticket.booking'))
                                        <th>@lang('Booking Date')</th>
                                        <th>@lang('Time')</th>
                                        <th>@lang('Guests')</th>
                                    @elseif(request()->routeIs('admin.ticket.inquiry'))
                                        <th>@lang('Inquiry Date')</th>
                                    @endif
                                    <th>@lang('Status')</th>
                                    <th>@lang('Priority')</th>
                                    <th>@lang('Last Reply')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($items as $item)
                                    <tr>
                                        <td>
                                            <a href="{{ route('admin.ticket.view', $item->id) }}" class="fw-bold">
                                                [@lang('Ticket')#{{ $item->ticket }}] {{ strLimit($item->subject, 30) }}
                                            </a>
                                        </td>
                                        <td>
                                            @if ($item->user)
                                                <a href="{{ route('admin.users.detail', $item->user_id) }}">
                                                    {{ @$item->user->fullname }}
                                                </a>
                                                <br>
                                                @lang('User')
                                            @elseif($item->User)
                                                <a href="{{ route('admin.users.detail', $item->user_id) }}">
                                                    {{ @$item->User->company_name }}
                                                </a>
                                                <br>
                                                @lang('User')
                                            @else
                                                <p class="fw-bold">{{ $item->name }}</p>
                                                @lang('Guest')
                                            @endif
                                        </td>
                                        <td>{{ $item->origin }}</td>
                                        @if(request()->routeIs('admin.ticket.booking'))
                                            <td>{{ $item->booking_date }}</td>
                                            <td>{{ $item->booking_time }}</td>
                                            <td>{{ $item->guests }}</td>
                                        @elseif(request()->routeIs('admin.ticket.inquiry'))
                                            <td>{{ $item->booking_date }}</td>
                                        @endif
                                        <td>@php echo $item->statusBadge; @endphp</td>
                                        <td>@php echo $item->priorityBadge;@endphp</td>
                                        <td>{{ diffForHumans($item->last_reply) }}</td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.ticket.view', $item->id) }}"
                                                    class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-desktop"></i> @lang('Details')
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
                        </table>
                    </div>
                </div>
                @if ($items->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($items) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="Search here..." />
@endpush
