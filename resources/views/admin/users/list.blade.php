@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--md  table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('User')</th>
                                    <th>@lang('Email | Phone')</th>
                                    <th>@lang('Country')</th>
                                    <th>@lang('Joined At')</th>
                                    <th>@lang('Is Featured')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($users as $user)
                                    <tr>
                                        <td>
                                            <div class="user">
                                                <div class="thumb">
                                                    <img src="{{ getProfileImage($user->image, 'user') }}"
                                                        alt="{{ $user->fullname }}" class="plugin_bg">
                                                </div>
                                                <span class="name">
                                                    <span class="fw-bold d-block">{{ $user->fullname }}</span>
                                                    <span class="text--small">
                                                        <a href="{{ route('admin.users.detail', $user->id) }}">
                                                            <span>@</span>{{ $user->username }}
                                                        </a>
                                                    </span>
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="d-block">{{ $user->email }}</span>
                                            <span>{{ $user->mobileNumber }}</span>
                                        </td>
                                        <td>
                                            <span class="fw-bold">{{ $user->country_code }}</span>
                                        </td>
                                        <td>
                                            <span class="d-block">{{ showDateTime($user->created_at) }}</span>
                                            <span>{{ diffForHumans($user->created_at) }}</span>
                                        </td>
                                        <td>@php echo $user->featuredBadge;@endphp</td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.users.detail', $user->id) }}"
                                                    class="btn btn-sm btn-outline--primary">
                                                    <i class="las la-desktop"></i>@lang('Details')
                                                </a>
                                                @if ($user->is_featured == Status::YES)
                                                    <button class="btn btn-outline--danger btn-sm confirmationBtn"
                                                        data-action="{{ route('admin.users.featured', $user->id) }}"
                                                        data-question="@lang('Are you sure to unfeatured this User?')">
                                                        <i class="las la-star-of-life"></i> @lang('Unfeatured')
                                                    </button>
                                                @else
                                                    <button class="btn btn-outline--success btn-sm confirmationBtn"
                                                        data-action="{{ route('admin.users.featured', $user->id) }}"
                                                        data-question="@lang('Are you sure to featured this User?')">
                                                        <i class="las la-star-of-life"></i> @lang('Featured')
                                                    </button>
                                                @endif
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
                @if ($users->hasPages())
                    <div class="card-footer py-4">
                        {{ paginateLinks($users) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="Username / Email" />
@endpush
