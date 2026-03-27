@php
    $heroElements = getContent('hero_slider.element', orderById: true);
    $firstHero = $heroElements->first();
    $firstImageUrl = $firstHero ? frontendImage('hero_slider', @$firstHero->data_values->image, '1920x1080') : null;
@endphp

@push('style')
    @if ($firstImageUrl)
        <link rel="preload" as="image" href="{{ $firstImageUrl }}" fetchpriority="high">
    @endif
    <style>
        .slide-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            aspect-ratio: 16 / 9;
            /* Placeholder background while loading */
            background-color: #2d1200;
        }

        @media (max-width: 768px) {
            .slide-image {
                aspect-ratio: 4 / 5;
                /* Mobile optimized aspect ratio if needed */
            }
        }
    </style>
@endpush

<section id="hero" aria-label="Luxury hotel slider">
    <div class="hero-overlay"></div>

    <div class="hero-wrapper">
        <div class="swiper hero-swiper">
            <div class="swiper-wrapper">
                @foreach ($heroElements as $item)
                    <div class="swiper-slide">
                        <img class="slide-image"
                            src="{{ frontendImage('hero_slider', @$item->data_values->image, '1920x1080') }}"
                            alt="{{ __($item->data_values->{'title_' . app()->getLocale()} ?? $item->data_values->title) }}"
                            @if ($loop->first) fetchpriority="high" decoding="sync" @else loading="lazy" decoding="async" @endif
                            width="1920" height="1080">
                        <div class="container hero-container">
                            <div class="hero-content">
                                <h1>@php echo __($item->data_values->{'title_' . app()->getLocale()} ?? $item->data_values->title); @endphp</h1>
                                <a class="hero-button" href="{{ @$item->data_values->button_link }}" role="button">
                                    <span>{{ __($item->data_values->{'button_text_' . app()->getLocale()} ?? $item->data_values->button_text) }}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="hero-nav-wrap">
                <button class="hero-nav hero-nav--left swiper-button-prev" aria-label="Previous slide">
                    <svg width="48" height="48" viewBox="0 0 48 48" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <circle cx="24" cy="24" r="23.5" fill="#2D1200" fill-opacity="0.5"
                            stroke="#CAA05C" />
                        <path
                            d="M17.9947 20.3678L17.4633 24.0277C17.458 24.073 17.458 24.1196 17.4633 24.1649L17.9947 27.6143C18.0034 27.6744 18.0014 27.7376 17.989 27.7958C17.9767 27.8539 17.9545 27.9044 17.9254 27.9407C17.8963 27.9771 17.8616 27.9976 17.8256 27.9998C17.7897 28.002 17.7542 27.9856 17.7237 27.9528L16.1611 26.4798C15.6224 25.9747 15.0469 25.5962 14.4498 25.3544L12.1325 24.4394C12.0947 24.423 12.0611 24.3852 12.0371 24.3322C12.013 24.2792 12 24.2139 12 24.1466C12 24.0794 12.013 24.014 12.0371 23.961C12.0611 23.908 12.0947 23.8703 12.1325 23.8538L14.8324 22.4722C15.1773 22.2985 15.5104 22.0624 15.8263 21.7677L17.7131 20.0567C17.7424 20.0211 17.7773 20.0014 17.8132 20.0001C17.8491 19.9987 17.8844 20.0159 17.9146 20.0493C17.9449 20.0827 17.9686 20.1308 17.9829 20.1875C17.9972 20.2443 18.0013 20.307 17.9947 20.3678Z"
                            fill="white" />
                        <path
                            d="M34.5631 23.7056C34.8003 23.3348 35.0917 23.0904 35.4038 23.0006C35.48 22.9959 35.5559 23.0181 35.6272 23.0658C35.6986 23.1135 35.7638 23.1859 35.8193 23.2787C35.8748 23.3714 35.9193 23.4828 35.9503 23.6063C35.9813 23.7299 35.9982 23.8631 36 23.9982C35.9985 24.1337 35.9818 24.2673 35.9509 24.3912C35.92 24.5151 35.8755 24.6269 35.82 24.7201C35.7645 24.8132 35.6991 24.8859 35.6277 24.9339C35.5562 24.9818 35.4801 25.0041 35.4038 24.9994C35.0787 24.935 34.7737 24.688 34.5333 24.2944H18V23.7374L34.5631 23.7056Z"
                            fill="white" />
                        <path
                            d="M18 22.0004C18.2571 21.9895 18.5058 22.1929 18.6929 22.5669C18.8799 22.9408 18.9902 23.4554 19 23.9999C18.9914 24.5453 18.8815 25.0614 18.6942 25.4359C18.5069 25.8103 18.2574 26.0129 18 25.9994C17.7426 26.0129 17.4931 25.8103 17.3058 25.4359C17.1185 25.0614 17.0086 24.5453 17 23.9999C17.0098 23.4554 17.1201 22.9408 17.3071 22.5669C17.4942 22.1929 17.7429 21.9895 18 22.0004Z"
                            fill="white" />
                    </svg>
                </button>
                <button class="hero-nav hero-nav--right swiper-button-next" aria-label="Next slide">
                    <svg width="48" height="48" viewBox="0 0 48 48" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <circle cx="24" cy="24" r="23.5" transform="rotate(-180 24 24)" fill="#2D1200"
                            fill-opacity="0.5" stroke="#CAA05C" />
                        <path
                            d="M30.0053 27.6322L30.5367 23.9723C30.542 23.927 30.542 23.8804 30.5367 23.8351L30.0053 20.3857C29.9966 20.3256 29.9986 20.2624 30.011 20.2043C30.0233 20.1461 30.0455 20.0956 30.0746 20.0593C30.1037 20.0229 30.1384 20.0024 30.1744 20.0002C30.2103 19.998 30.2458 20.0144 30.2763 20.0472L31.8389 21.5202C32.3776 22.0253 32.9531 22.4038 33.5502 22.6456L35.8675 23.5606C35.9053 23.577 35.9389 23.6148 35.9629 23.6678C35.987 23.7209 36 23.7861 36 23.8534C36 23.9206 35.987 23.986 35.9629 24.039C35.9389 24.0921 35.9053 24.1298 35.8675 24.1462L33.1676 25.5278C32.8227 25.7015 32.4896 25.9376 32.1737 26.2323L30.2869 27.9433C30.2576 27.9789 30.2227 27.9986 30.1868 27.9999C30.1509 28.0013 30.1156 27.9841 30.0854 27.9507C30.0551 27.9174 30.0314 27.8692 30.0171 27.8125C30.0028 27.7557 29.9987 27.693 30.0053 27.6322Z"
                            fill="white" />
                        <path
                            d="M13.4369 24.2944C13.1997 24.6652 12.9083 24.9096 12.5962 24.9994C12.52 25.0041 12.4441 24.9819 12.3728 24.9342C12.3014 24.8865 12.2362 24.8141 12.1807 24.7213C12.1252 24.6286 12.0807 24.5172 12.0497 24.3937C12.0187 24.2701 12.0018 24.1369 12 24.0018C12.0015 23.8663 12.0182 23.7327 12.0491 23.6088C12.08 23.4849 12.1245 23.3731 12.18 23.2799C12.2355 23.1868 12.3009 23.1141 12.3723 23.0661C12.4438 23.0182 12.5199 22.9959 12.5962 23.0006C12.9213 23.065 13.2263 23.312 13.4667 23.7056L30 23.7056L30 24.2626L13.4369 24.2944Z"
                            fill="white" />
                        <circle cx="24" cy="24" r="23.5" transform="rotate(-180 24 24)"
                            stroke="#CAA05C" />
                        <path
                            d="M30 25.9996C29.7429 26.0105 29.4942 25.8071 29.3071 25.4331C29.1201 25.0592 29.0098 24.5446 29 24.0001C29.0086 23.4547 29.1185 22.9386 29.3058 22.5641C29.4931 22.1897 29.7426 21.9871 30 22.0006C30.2574 21.9871 30.5069 22.1897 30.6942 22.5641C30.8815 22.9386 30.9914 23.4547 31 24.0001C30.9902 24.5446 30.8799 25.0592 30.6929 25.4331C30.5058 25.8103 30.2571 26.0105 30 25.9996Z"
                            fill="white" />
                    </svg>
                </button>
            </div>

            <div class="swiper-pagination hero-tracker"></div>
        </div>
    </div>
</section>

{{-- form booking  --}}
<section class="booking-section">
    <div class="container pb-0">
        <div class="booking-wrapper">
            <form action="" method="GET" class="booking-form">
                <div class="booking-item date-picker-trigger" id="check-in-trigger">
                    <span class="booking-label">@lang('CHECK IN')</span>
                    <div class="booking-value-wrap">
                        <span class="booking-big-num" id="check-in-day">11</span>
                        <div class="booking-sub-val">
                            <span id="check-in-month">FEB</span>
                            <i class="las la-angle-down"></i>
                        </div>
                    </div>
                    <input type="hidden" name="check_in" id="check-in-input">
                </div>

                <div class="booking-item date-picker-trigger" id="check-out-trigger">
                    <span class="booking-label">@lang('CHECK OUT')</span>
                    <div class="booking-value-wrap">
                        <span class="booking-big-num" id="check-out-day">12</span>
                        <div class="booking-sub-val">
                            <span id="check-out-month">FEB</span>
                            <i class="las la-angle-down"></i>
                        </div>
                    </div>
                    <input type="hidden" name="check_out" id="check-out-input">
                </div>

                <div class="booking-item guest-picker">
                    <span class="booking-label">@lang('GUESTS')</span>
                    <div class="booking-value-wrap">
                        <span class="booking-big-num" id="guest-count-display">2</span>
                        <div class="booking-sub-val guest-controls">
                            <i class="las la-angle-up guest-up"></i>
                            <i class="las la-angle-down guest-down"></i>
                        </div>
                    </div>
                    <input type="number" name="guests" id="guest-count-input" value="2" class="d-none">
                </div>

                <div class="booking-action">
                    <button type="submit" class="btn-book-now">@lang('BOOK NOW')</button>
                </div>
            </form>
        </div>
    </div>
</section>

@push('script-lib')
    <script src="{{ asset('assets/global/js/moment.min.js') }}"></script>
    <script src="{{ asset('assets/global/js/daterangepicker.min.js') }}"></script>
@endpush

@push('style-lib')
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/global/css/daterangepicker.css') }}">
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            var heroSwiper = new Swiper('.hero-swiper', {
                loop: true,
                speed: 1000,
                // autoplay: {
                //     delay: 5000,
                //     disableOnInteraction: false,
                // },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },

            });

            // Booking Form Logic
            const start = moment();
            const end = moment().add(1, 'days');

            function updateUI(startDate, endDate) {
                $('#check-in-day').text(startDate.format('DD'));
                $('#check-in-month').text(startDate.format('MMM').toUpperCase());
                $('#check-in-input').val(startDate.format('YYYY-MM-DD'));

                $('#check-out-day').text(endDate.format('DD'));
                $('#check-out-month').text(endDate.format('MMM').toUpperCase());
                $('#check-out-input').val(endDate.format('YYYY-MM-DD'));
            }

            updateUI(start, end);

            $('.date-picker-trigger').daterangepicker({
                startDate: start,
                endDate: end,
                minDate: moment(),
                opens: 'center',
                drops: 'up',
                autoApply: true,
                autoUpdateInput: false,
                parentEl: '.booking-wrapper'
            }, function(start, end, label) {
                updateUI(start, end);
            });

            // Guest Count Logic
            $('.guest-up').on('click', function() {
                let count = parseInt($('#guest-count-input').val());
                count++;
                $('#guest-count-input').val(count);
                $('#guest-count-display').text(count);
            });

            $('.guest-down').on('click', function() {
                let count = parseInt($('#guest-count-input').val());
                if (count > 1) {
                    count--;
                    $('#guest-count-input').val(count);
                    $('#guest-count-display').text(count);
                }
            });

        })(jQuery);
    </script>
@endpush
