@php
@endphp
<header class="header {{ Request::routeIs('booking') ? 'header--booking' : '' }}" id="header">
    <div class="container custom-container">
        <nav class="navbar navbar-expand-lg">
            @if (Request::routeIs('booking'))
                @include('templates.basic.partials.frontend.header.booking_header')
            @else
                @include('templates.basic.partials.frontend.header.main_header')
            @endif
        </nav>
    </div>

</header>

@include('templates.basic.partials.frontend.header.mobile_sidebar')
@include('templates.basic.partials.frontend.header.header_scripts')

@if (auth()->guard('user')->check())
    @include('Template::partials.user.profile_sidebar')
@endif
