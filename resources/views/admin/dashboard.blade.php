@extends('admin.layouts.app')
@section('panel')
<div class="row gy-4">
    <div class="col-xxl-3 col-sm-6">
        <x-widget link="{{ route('admin.users.all') }}" style="6" icon="las la-users"
            title="Total Users" value="{{ $widget['total_users'] }}" bg="primary" />
    </div>
    <div class="col-xxl-3 col-sm-6">
        <x-widget link="{{ route('admin.users.active') }}" style="6" icon="las la-user-check"
            title="Active Users" value="{{ $widget['verified_users'] }}" bg="success" />
    </div>
    <div class="col-xxl-3 col-sm-6">
        <x-widget link="{{ route('admin.users.email.unverified') }}" style="6"
            icon="las la-envelope" title="Email Unverified Users"
            value="{{ $widget['email_unverified_users'] }}" bg="danger" />
    </div>
    <div class="col-xxl-3 col-sm-6">
        <x-widget link="{{ route('admin.users.mobile.unverified') }}" style="6"
            icon="las la-comment-slash" title="Mobile Unverified Users"
            value="{{ $widget['mobile_unverified_users'] }}" bg="warning" />
    </div>
</div>
</div>
<div class="row mb-none-30 mt-4">
    <div class="col-xl-4 col-lg-6 mb-30">
        <div class="card overflow-hidden">
            <div class="card-body">
                <h5 class="card-title">@lang('Login By Browser') (@lang('Last 30 days'))</h5>
                <canvas id="userBrowserChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-6 mb-30">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">@lang('Login By OS') (@lang('Last 30 days'))</h5>
                <canvas id="userOsChart"></canvas>
            </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-6 mb-30">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">@lang('Login By Country') (@lang('Last 30 days'))</h5>
                <canvas id="userCountryChart"></canvas>
            </div>
        </div>
    </div>
</div>

@include('admin.partials.cron_modal')
@endsection

@push('breadcrumb-plugins')
<button class="btn btn-outline--primary btn-sm" data-bs-toggle="modal" data-bs-target="#cronModal">
    <i class="las la-server"></i>@lang('Cron Setup')
</button>
@endpush

@push('script-lib')
<script src="{{ asset('assets/admin/js/vendor/apexcharts.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/vendor/chart.js.2.8.0.js') }}"></script>
<script src="{{ asset('assets/global/js/moment.min.js') }}"></script>
<script src="{{ asset('assets/global/js/daterangepicker.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/charts.js') }}"></script>
@endpush

@push('style-lib')
<link rel="stylesheet" type="text/css" href="{{ asset('assets/global/css/daterangepicker.css') }}">
@endpush

@push('script')
<script>
    "use strict";

    piChart(
        document.getElementById('userBrowserChart'),
        @json(@$chart['user_browser_counter']->keys()),
        @json(@$chart['user_browser_counter']->flatten())
    );

    piChart(
        document.getElementById('userOsChart'),
        @json(@$chart['user_os_counter']->keys()),
        @json(@$chart['user_os_counter']->flatten())
    );

    piChart(
        document.getElementById('userCountryChart'),
        @json(@$chart['user_country_counter']->keys()),
        @json(@$chart['user_country_counter']->flatten())
    );
</script>
@endpush
@push('style')
<style>
    .apexcharts-menu {
        min-width: 120px !important;
    }
</style>
@endpush
