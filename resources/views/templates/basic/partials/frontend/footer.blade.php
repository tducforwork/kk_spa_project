@php
    $footerContent = getContent('footer.content', true);
    $socialIcons = getContent('social_links.element', orderById: true);
    $aboutMenu = get_menu('footer_about_us_menu');
    $accommodationMenu = get_menu('footer_accommodation');
    $diningMenu = get_menu('footer_dining_bar');
    $meetingsMenu = get_menu('footer_meetings_events');
    $facilitiesMenu = get_menu('footer_facilities');

    // Combine meetings and facilities for SERVICES column

@endphp

<footer class="footer">
    <div class="container">
        <div class="footer-top">
            <div class="row gy-4">
                {{-- Info Column --}}
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                    <div class="footer-widget info-widget">
                        <a href="{{ route('home') }}" class="footer-logo mb-4 d-inline-block">
                            <img src="{{ frontendImage('footer', @$footerContent->data_values->footer_logo) }}"
                                alt="logo">
                        </a>
                        <div class="footer-info-content">
                            {!! @$footerContent->data_values->{'footer_info_' . app()->getLocale()} !!}
                        </div>
                    </div>
                </div>

                {{-- Menu Columns --}}
                <div class="col-xl-9 col-lg-9 col-md-12">
                    <div class="row gy-4">
                        {{-- ABOUT --}}
                        <div class="col-lg-2-4 col-md-4 col-sm-6">
                            <div class="footer-widget">
                                <h4 class="footer-widget-title">@lang('ABOUT')</h4>
                                <ul class="footer-menu-list list-unstyled">
                                    @foreach ($aboutMenu as $item)
                                        <li><a href="{{ url($item['url']) }}">{{ __($item['title']) }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>

                        {{-- ACCOMMODATION --}}
                        <div class="col-lg-2-4 col-md-4 col-sm-6">
                            <div class="footer-widget">
                                <h4 class="footer-widget-title">@lang('ACCOMMODATION')</h4>
                                <ul class="footer-menu-list list-unstyled">
                                    @foreach ($accommodationMenu as $item)
                                        <li><a href="{{ url($item['url']) }}">{{ __($item['title']) }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>

                        {{-- GASTRONOMY --}}
                        <div class="col-lg-2-4 col-md-4 col-sm-6">
                            <div class="footer-widget">
                                <h4 class="footer-widget-title">@lang('DINNING & BAR')</h4>
                                <ul class="footer-menu-list list-unstyled">
                                    @foreach ($diningMenu as $item)
                                        <li><a href="{{ url($item['url']) }}">{{ __($item['title']) }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>

                        {{-- SERVICES --}}
                        <div class="col-lg-2-4 col-md-4 col-sm-6">
                            <div class="footer-widget">
                                <h4 class="footer-widget-title">@lang('MEETING & EVENTS')</h4>
                                <ul class="footer-menu-list list-unstyled">
                                    @foreach ($meetingsMenu as $item)
                                        <li><a href="{{ url($item['url']) }}">{{ __($item['title']) }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>

                        {{-- POLICY --}}
                        <div class="col-lg-2-4 col-md-4 col-sm-6">
                            <div class="footer-widget">
                                <h4 class="footer-widget-title">@lang('FACILITES')</h4>
                                <ul class="footer-menu-list list-unstyled">
                                    @foreach ($facilitiesMenu as $item)
                                        <li><a href="{{ url($item['url']) }}">{{ __($item['title']) }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-4 text-center text-md-start">
                    <div class="social-icons">
                        @foreach ($socialIcons as $icon)
                            <a href="{{ @$icon->data_values->url }}" target="_blank">
                                <img src="{{ frontendImage('social_links', @$icon->data_values->icon_image) }}"
                                    alt="social">
                            </a>
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 text-center my-3 my-md-0">
                    <p class="copyright-text mb-0">
                        {{ __(@$footerContent->data_values->copyright) ?: 'Copyright Web360' }}
                    </p>
                </div>
                <div class="col-lg-4 col-md-4 text-center text-md-end">
                    <div class="payment-methods">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/5/5e/Visa_Inc._logo.svg" alt="Visa"
                            height="15">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/2/2a/Mastercard-logo.svg"
                            alt="Mastercard" height="20" class="ms-3">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/PayPal.svg" alt="PayPal"
                            height="18" class="ms-3">
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
