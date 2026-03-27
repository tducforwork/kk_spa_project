@php
@endphp
<header class="header" id="header">
    <div class="container custom-container">
        <nav class="navbar navbar-expand-lg">
            <!-- Mobile Menu Toggle -->
            <button class="navbar-toggler header-button d-lg-none" type="button" aria-label="Toggle navigation">
                <span id="hiddenNav"><i class="las la-bars"></i></span>
            </button>

            <!-- Centered Logo for Mobile (d-lg-none) -->
            <a class="navbar-brand logo d-lg-none mx-auto" href="{{ route('home') }}">
                <img src="{{ frontendImage('header', @$header->data_values->header_logo) }}" alt="logo">
            </a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="header-inner w-100 d-flex justify-content-between align-items-center">

                    <!-- Left Menu -->
                    <div class="header-menu-left d-none d-lg-block">
                        <ul class="navbar-nav">
                            @foreach ($menu_left as $item)
                                <li class="nav-item {{ count($item['children']) > 0 ? 'has-submenu' : '' }}">
                                    <a class="nav-link" href="{{ url($item['url']) }}">{{ __($item['title']) }}</a>
                                    @if (count($item['children']) > 0)
                                        <ul class="submenu">
                                            @foreach ($item['children'] as $child)
                                                <li><a href="{{ url($child['url']) }}">{{ __($child['title']) }}</a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    @endif
                                </li>
                            @endforeach
                        </ul>
                    </div>

                    <!-- Centered Logo for Desktop (d-none d-lg-block) -->
                    <div class="header-logo d-none d-lg-block">
                        <a class="logo" href="{{ route('home') }}">
                            <img src="{{ frontendImage('header', @$header->data_values->header_logo) }}" alt="logo">
                        </a>
                    </div>

                    <!-- Right Menu -->
                    <div class="header-menu-right d-none d-lg-block">
                        <ul class="navbar-nav align-items-center">
                            @foreach ($menu_right as $item)
                                <li class="nav-item {{ count($item['children']) > 0 ? 'has-submenu' : '' }}">
                                    <a class="nav-link" href="{{ url($item['url']) }}">{{ __($item['title']) }}</a>
                                    @if (count($item['children']) > 0)
                                        <ul class="submenu">
                                            @foreach ($item['children'] as $child)
                                                <li><a href="{{ url($child['url']) }}">{{ __($child['title']) }}</a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    @endif
                                </li>
                            @endforeach
                            <!-- Search Icon -->
                            <li class="nav-item ms-3">
                                <a href="javascript:void(0)" class="nav-link search-btn">
                                    <i class="las la-search"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <!-- Mobile Sidebar -->
    <div class="mobile-sidebar d-lg-none">
        <div class="mobile-sidebar-header">
            <button class="sidebar-close"><i class="las la-times"></i></button>
        </div>
        <div class="mobile-sidebar-body">
            <ul class="mobile-menu">
                @php
                    $all_menus = array_merge($menu_left, $menu_right);
                @endphp
                @foreach ($all_menus as $item)
                    <li class="mobile-menu-item {{ count($item['children']) > 0 ? 'has-dropdown' : '' }}">
                        <div class="menu-link-wrapper">
                            <a href="{{ url($item['url']) }}" class="mobile-menu-link">{{ __($item['title']) }}</a>
                            @if (count($item['children']) > 0)
                                <span class="submenu-toggler"><i class="fa-solid fa-chevron-down"></i></span>
                            @endif
                        </div>
                        @if (count($item['children']) > 0)
                            <ul class="mobile-submenu">
                                @foreach ($item['children'] as $child)
                                    <li><a href="{{ url($child['url']) }}">{{ __($child['title']) }}</a></li>
                                @endforeach
                            </ul>
                        @endif
                    </li>
                @endforeach
                <li class="mobile-menu-item mt-4">
                    <a href="#" class="mobile-menu-link "
                        style="font-size: 16px; text-transform: none;">@lang('Terms & Conditions')</a>
                </li>
            </ul>
        </div>
    </div>
</header>

@push('script')
    <script>
        (function($) {
            "use strict";
            $('.navbar-toggler').on('click', function() {
                $('.mobile-sidebar').addClass('show');
                $('.sidebar-overlay').addClass('show');
            });

            $('.sidebar-close, .sidebar-overlay').on('click', function() {
                $('.mobile-sidebar').removeClass('show');
                $('.sidebar-overlay').removeClass('show');
            });

            $('.submenu-toggler').on('click', function() {
                $(this).parent().next('.mobile-submenu').slideToggle();
                $(this).toggleClass('active');
            });
        })(jQuery);
    </script>
@endpush
@if (auth()->guard('user')->check())
    @include('Template::partials.user.profile_sidebar')
@endif
