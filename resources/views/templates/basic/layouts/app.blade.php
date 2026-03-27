@php
    $fixedSocials = getContent('fixed_social_links.element');
@endphp
<!doctype html>
<html lang="{{ config('app.locale') }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>{{ gs()->siteName(__($pageTitle)) }}</title>

    @include('partials.seo')

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500;600;700&family=Josefin+Sans:wght@400;500;600;700&display=swap"
        rel="stylesheet">

    <link href="{{ asset('assets/global/css/bootstrap.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/global/css/all.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/global/css/line-awesome.min.css') }}" rel="stylesheet" />

    <link href="{{ asset(activeTemplate(true) . 'css/slick.css') }}" rel="stylesheet" />
    <link href="{{ asset(activeTemplate(true) . 'css/magnifiq.css') }}" rel="stylesheet" />
    <link href="{{ asset(activeTemplate(true) . 'css/animate.css') }}" rel="stylesheet" />
    <link href="{{ asset(activeTemplate(true) . 'css/slider-range.css') }}" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    @stack('style-lib')

    {{-- <link href="{{ asset(activeTemplate(true) . 'css/main.css') }}" rel="stylesheet" /> --}}
    <link href="{{ asset(activeTemplate(true) . 'css/custom.css') }}" rel="stylesheet" />
    <link href="{{ asset(activeTemplate(true) . 'css/responsive.css') }}" rel="stylesheet" />

    @stack('style')

    <link rel="stylesheet" href="{{ asset(activeTemplate(true) . 'css/color.php') }}?color={{ gs('base_color') }}">
</head>

@php echo loadExtension('google-analytics') @endphp

<body>
    @stack('fbComment')

    <div class="preloader-dot-loading">
        <div class="cssload-loading">
            <i></i>
            <i></i>
            <i></i>
            <i></i>
            <i></i>
            <i></i>
        </div>
    </div>

    <div class="body-overlay"></div>

    <div class="sidebar-overlay"></div>
    <div id="best_price_float">
        <div class="best-price-content">
            <button class="best-price-close"><i class="fa-solid fa-xmark"></i></button>
            <h5 class="best-price-title">@lang('BEST PRICE GUARANTEE')</h5>
            <p class="best-price-text">
                Enter the special code
                SUPERSAVE to get further 10% DISCOUNT on all current rate plan
            </p>
            <a href="" class="btn-book-code">@lang('Book with code')</a>
        </div>
    </div>
    <div id="tripadvisor_float">
        <a href="https://www.tripadvisor.com" target="_blank">
            <img src="{{ asset('assets/images/kk_sapa/tripadvisor_float.webp') }}" alt="TripAdvisor">
        </a>
    </div>
    {{-- Floating Social Links --}}
    @if ($fixedSocials->count() > 0)
        <div class="fixed-social-menu" id="fixed-social-menu">
            <div class="social-list-wrapper">
                @foreach ($fixedSocials as $item)
                    @if ($item->data_values->{'name_' . app()->getLocale()} == 'Tripadvisor')
                        <a href="{{ $item->data_values->{'url_' . app()->getLocale()} ?? $item->data_values->url_en }}"
                            target="_blank" class="social-item social-tripadvisor">
                            <img src="{{ frontendImage('fixed_social_links', @$item->data_values->icon_image, '40x40') }}"
                                alt="{{ __($item->data_values->{'name_' . app()->getLocale()} ?? $item->data_values->name_en) }}">
                            <span>{{ __($item->data_values->{'name_' . app()->getLocale()} ?? $item->data_values->name_en) }}</span>
                        </a>
                    @else
                        <a href="{{ $item->data_values->{'url_' . app()->getLocale()} ?? $item->data_values->url_en }}"
                            target="_blank" class="social-item">
                            <img src="{{ frontendImage('fixed_social_links', @$item->data_values->icon_image, '40x40') }}"
                                alt="{{ __($item->data_values->{'name_' . app()->getLocale()} ?? $item->data_values->name_en) }}">
                            <span>{{ __($item->data_values->{'name_' . app()->getLocale()} ?? $item->data_values->name_en) }}</span>
                        </a>
                    @endif
                @endforeach
            </div>
            <button class="social-toggle-btn" id="social-toggle-btn" aria-label="Toggle Social Links">
                <div class="open-social-fixed d-flex">
                    <svg width="27" height="27" viewBox="0 0 27 27" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M13.3333 0C20.6973 0 26.6667 5.96933 26.6667 13.3333C26.6667 20.6973 20.6973 26.6667 13.3333 26.6667C11.1763 26.6695 9.05105 26.1469 7.14135 25.144L1.42135 26.6333C1.23022 26.6831 1.0294 26.6821 0.838799 26.6303C0.648195 26.5786 0.474421 26.4779 0.334698 26.3384C0.194976 26.1988 0.0941574 26.0251 0.0422338 25.8345C-0.00968972 25.644 -0.0109152 25.4432 0.0386788 25.252L1.52668 19.5333C0.521129 17.6216 -0.00290626 15.4934 1.21229e-05 13.3333C1.21229e-05 5.96933 5.96935 0 13.3333 0ZM15.0027 14.6667H9.00001L8.86401 14.676C8.62466 14.7089 8.40533 14.8274 8.24656 15.0095C8.08779 15.1916 8.00032 15.4251 8.00032 15.6667C8.00032 15.9083 8.08779 16.1417 8.24656 16.3238C8.40533 16.5059 8.62466 16.6244 8.86401 16.6573L9.00001 16.6667H15.0027L15.1373 16.6573C15.3767 16.6244 15.596 16.5059 15.7548 16.3238C15.9136 16.1417 16.001 15.9083 16.001 15.6667C16.001 15.4251 15.9136 15.1916 15.7548 15.0095C15.596 14.8274 15.3767 14.7089 15.1373 14.676L15.0027 14.6667ZM17.6667 10H9.00001L8.86401 10.0093C8.62466 10.0423 8.40533 10.1607 8.24656 10.3428C8.08779 10.525 8.00032 10.7584 8.00032 11C8.00032 11.2416 8.08779 11.475 8.24656 11.6572C8.40533 11.8393 8.62466 11.9577 8.86401 11.9907L9.00001 12H17.6667L17.8027 11.9907C18.042 11.9577 18.2614 11.8393 18.4201 11.6572C18.5789 11.475 18.6664 11.2416 18.6664 11C18.6664 10.7584 18.5789 10.525 18.4201 10.3428C18.2614 10.1607 18.042 10.0423 17.8027 10.0093L17.6667 10Z"
                            fill="white" />
                    </svg>
                </div>
                <div class="close-social-fixed d-none ">
                    <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M8.76667 10.6333L2.23333 17.1667C1.98889 17.4111 1.67778 17.5333 1.3 17.5333C0.922222 17.5333 0.611111 17.4111 0.366666 17.1667C0.122222 16.9222 0 16.6111 0 16.2333C0 15.8556 0.122222 15.5444 0.366666 15.3L6.9 8.76667L0.366666 2.23333C0.122222 1.98889 0 1.67778 0 1.3C0 0.922222 0.122222 0.611111 0.366666 0.366666C0.611111 0.122222 0.922222 0 1.3 0C1.67778 0 1.98889 0.122222 2.23333 0.366666L8.76667 6.9L15.3 0.366666C15.5444 0.122222 15.8556 0 16.2333 0C16.6111 0 16.9222 0.122222 17.1667 0.366666C17.4111 0.611111 17.5333 0.922222 17.5333 1.3C17.5333 1.67778 17.4111 1.98889 17.1667 2.23333L10.6333 8.76667L17.1667 15.3C17.4111 15.5444 17.5333 15.8556 17.5333 16.2333C17.5333 16.6111 17.4111 16.9222 17.1667 17.1667C16.9222 17.4111 16.6111 17.5333 16.2333 17.5333C15.8556 17.5333 15.5444 17.4111 15.3 17.1667L8.76667 10.6333Z"
                            fill="white" />
                    </svg>
                </div>
            </button>
        </div>
    @endif

    {{-- Inquiry Popup Modal --}}
    @include('Template::partials.modal.inquiry_modal')

    @yield('panel')

    @include('Template::partials.frontend.cookie_card')

    <script src="{{ asset('assets/global/js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('assets/global/js/bootstrap.bundle.min.js') }}"></script>

    <script src="{{ asset(activeTemplate(true) . 'js/magnifiq-popup.js') }}"></script>
    <script src="{{ asset(activeTemplate(true) . 'js/wow.js') }}"></script>
    <script src="{{ asset(activeTemplate(true) . 'js/slick.min.js') }}"></script>
    <script src="{{ asset(activeTemplate(true) . 'js/slider.js') }}"></script>
    <script src="{{ asset('assets/global/js/moment.min.js') }}"></script>
    <script src="{{ asset('assets/global/js/daterangepicker.min.js') }}"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    @stack('script-lib')

    <script src="{{ asset(activeTemplate(true) . 'js/main.js') }}"></script>

    @include('partials.notify')

    @php echo loadExtension('tawk-chat') @endphp

    @if (gs('pn'))
        @include('partials.push_script')
    @endif

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    @stack('script')

    <script>
        (function($) {
            "use strict";

            $('.policy').on('click', function() {
                $.get('{{ route('cookie.accept') }}', function(response) {
                    $('.cookies-card').addClass('d-none');
                });
            });

            setTimeout(function() {
                $('.cookies-card').removeClass('hide')
            }, 2000);

            var inputElements = $('input,select');
            $.each(inputElements, function(index, element) {
                if (element.id) {
                    return false;
                }
                element = $(element);
                element.closest('.form-group').find('label').attr('for', element.attr('name'));
                element.attr('id', element.attr('name'))
            });

            var inputElements = $('[type=text],select,textarea');
            $.each(inputElements, function(index, element) {
                if (element.id) {
                    return false;
                }
                element = $(element);
                element.closest('.form-group').find('label').attr('for', element.attr('name'));
                element.attr('id', element.attr('name'))
            });

            $.each($('input, select, textarea'), function(i, element) {
                var elementType = $(element);
                if (elementType.attr('type') != 'checkbox') {
                    if (element.hasAttribute('required')) {
                        $(element).closest('.form-group').find('label').addClass('required');
                    }
                }
            });

            $.each($('input:not([type=checkbox]):not([type=hidden]), select, textarea'), function(i, element) {
                if (element.hasAttribute('required')) {
                    $(element).closest('.form-group').find('label').addClass('required');
                }
            });

            Array.from(document.querySelectorAll('table')).forEach(table => {
                let heading = table.querySelectorAll('thead tr th');
                Array.from(table.querySelectorAll('tbody tr')).forEach((row) => {
                    Array.from(row.querySelectorAll('td')).forEach((colum, i) => {
                        colum.setAttribute('data-label', heading[i].innerText)
                    });
                });
            });

            let disableSubmission = false;
            $('.disableSubmission').on('submit', function(e) {
                if (disableSubmission) {
                    e.preventDefault()
                } else {
                    disableSubmission = true;
                }
            });

            $('.showFilterBtn').on('click', function() {
                $('.responsive-filter-card').slideToggle();
            });
            // Social Menu Toggle
            $('#social-toggle-btn').on('click', function() {
                const $menu = $('#fixed-social-menu');
                const $openIcon = $('.open-social-fixed');
                const $closeIcon = $('.close-social-fixed');

                $menu.toggleClass('active');

                if ($menu.hasClass('active')) {
                    $openIcon.addClass('d-none').removeClass('d-flex');
                    $closeIcon.removeClass('d-none').addClass('d-flex');
                } else {
                    $openIcon.removeClass('d-none').addClass('d-flex');
                    $closeIcon.addClass('d-none').removeClass('d-flex');
                }
            });

            // Inquiry Modal Logic
            $('.inquiry-open-form').on('click', function(e) {
                e.preventDefault();
                $('#inquiry-modal').addClass('active');
                $('body').addClass('modal-open');
            });

            $('.inquiry-modal-close, .inquiry-modal-overlay').on('click', function() {
                $('#inquiry-modal').removeClass('active');
                $('body').removeClass('modal-open');
            });

            // Date Picker for Inquiry
            $('.date-picker').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                minDate: moment(),
                locale: {
                    format: 'DD/MM/YYYY'
                }
            });

        })(jQuery);
    </script>
</body>

</html>
