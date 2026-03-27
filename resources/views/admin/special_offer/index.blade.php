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
                                    <th>@lang('Offer')</th>
                                    <th>@lang('Hotlines')</th>
                                    <th>@lang('Sort Order')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($offers as $offer)
                                    <tr>
                                        <td>
                                            <div class="user gap-2">
                                                <div class="thumb">
                                                    <img src="{{ getImage(getFilePath('special_offer') . '/' . $offer->image, getFileSize('special_offer')) }}" alt="offer-image">
                                                </div>
                                                <span>{{ __($offer->t->name ?? 'No Name') }}</span>
                                            </div>
                                        </td>
                                        <td>
                                            {{ $offer->hotline_1 }} <br>
                                            {{ $offer->hotline_2 }}
                                        </td>
                                        <td>{{ $offer->sort_order }}</td>
                                        <td>@php echo $offer->statusBadge; @endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.special.offer.edit', $offer->id) }}" class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-pen"></i> @lang('Edit')
                                                </a>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to change status of this offer?')"
                                                    data-action="{{ route('admin.special.offer.status', $offer->id) }}">
                                                    <i class="la la-eye-slash"></i> @lang('Status')
                                                </button>
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                    data-question="@lang('Are you sure to delete this offer?')"
                                                    data-action="{{ route('admin.special.offer.remove', $offer->id) }}">
                                                    <i class="la la-trash"></i> @lang('Delete')
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage ?? 'No offers found') }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($offers->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($offers) }}
                    </div>
                @endif
            </div>
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.special.offer.create') }}" class="btn btn-outline--primary btn-sm">
        <i class="las la-plus"></i> @lang('Add New')
    </a>
@endpush
