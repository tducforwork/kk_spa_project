<!-- Mobile Menu Toggle -->
<button class="navbar-toggler header-button d-lg-none" type="button" aria-label="Toggle navigation">
    <span id="hiddenNav"><i class="las la-bars"></i></span>
</button>

<!-- Centered Logo for Mobile (d-lg-none) -->
<a class="navbar-brand logo d-lg-none" href="{{ route('home') }}">
    <img src="{{ frontendImage('header', @$header->data_values->header_logo) }}" alt="logo">


</a>
<a class="navbar-brand logo logo-white-bg d-none" href="{{ route('home') }}">
    <img class="" src="{{ frontendImage('header', @$header->data_values->header_logo_white_background) }}"
        alt="logo">
</a>

<div class="header-menu-right d-lg-none">
    <ul class="navbar-nav align-items-center flex-row">
        <!-- Search Icon -->
        <li class="nav-item search-item">
            <a href="javascript:void(0)" class="nav-link search-btn">
                <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M17.25 17.25L20.75 20.75M19.75 10.25C19.75 5.00329 15.4967 0.75 10.25 0.75C5.00329 0.75 0.75 5.00329 0.75 10.25C0.75 15.4967 5.00329 19.75 10.25 19.75C15.4967 19.75 19.75 15.4967 19.75 10.25Z"
                        stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </a>
            <div class="search-dropdown">
                <form action="{{ route('search') }}" method="GET">
                    <div class="search-form-group">
                        <input type="text" name="search" class="search-input" placeholder="@lang('Search here...')"
                            autocomplete="off" value="{{ request()->search }}">
                        <button type="submit" class="search-submit">
                            <i class="las la-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </li>
        @include('templates.basic.partials.frontend.language_switcher')
    </ul>
</div>
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
            <a href="{{ route('home') }}" class="logo-white-bg d-none">
                <img src="{{ frontendImage('header', @$header->data_values->header_logo_white_background) }}"
                    alt="logo">
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
                <li class="nav-item search-item">
                    <a href="javascript:void(0)" class="nav-link search-btn">
                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M17.25 17.25L20.75 20.75M19.75 10.25C19.75 5.00329 15.4967 0.75 10.25 0.75C5.00329 0.75 0.75 5.00329 0.75 10.25C0.75 15.4967 5.00329 19.75 10.25 19.75C15.4967 19.75 19.75 15.4967 19.75 10.25Z"
                                stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </a>
                    <div class="search-dropdown">
                        <form action="{{ route('search') }}" method="GET">
                            <div class="search-form-group">
                                <input type="text" name="search" class="search-input"
                                    placeholder="@lang('Search here...')" autocomplete="off" value="{{ request()->search }}">
                                <button type="submit" class="search-submit">
                                    <i class="las la-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </li>
                @include('templates.basic.partials.frontend.language_switcher')
            </ul>
        </div>
    </div>
</div>
