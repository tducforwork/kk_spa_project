@extends('Template::layouts.frontend')
@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::sections.booking_features')

    <section id="booking-form-section" class="">
        <div class="container">
            <div class="booking-form-header mb-lg-5 pb-lg-5 pb-4 mb-4 border-bottom border-color-green">
                <h1 class="booking-page-title">{{ __('Details of your stay') }}</h1>
            </div>

            <form action="https://book.securebookings.net/roomrate" method="GET" class="booking-page-form" target="_blank">
                <input type="hidden" name="id" id="hotel_id_fixed" value="ecec4926-aab8-1659321528-4540-b400-0e44b8bca614">
                <input type="hidden" name="lang" id="hotel_lang_fixed" value="{{ app()->getLocale() == 'vi' ? 'vi' : 'en' }}">
                <div class="row">
                    <!-- Dates -->
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-sm-6 mb-4">
                                <div class="form-group-custom">
                                    <label class="form-label-custom">@lang('Check-in date')</label>
                                    <div class="input-group-custom">
                                        <span class="input-icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip0_26_2892)">
                                                    <path
                                                        d="M6.8076 0C7.03038 0 7.24404 0.0884998 7.40157 0.24603C7.5591 0.403561 7.6476 0.617218 7.6476 0.84V2.4108H16.668V0.8508C16.668 0.628018 16.7565 0.414361 16.914 0.25683C17.0716 0.0992998 17.2852 0.0108 17.508 0.0108C17.7308 0.0108 17.9444 0.0992998 18.102 0.25683C18.2595 0.414361 18.348 0.628018 18.348 0.8508V2.4108H21.6C22.2363 2.4108 22.8466 2.66349 23.2966 3.11332C23.7467 3.56315 23.9997 4.17329 24 4.8096V21.6012C23.9997 22.2375 23.7467 22.8477 23.2966 23.2975C22.8466 23.7473 22.2363 24 21.6 24H2.4C1.76369 24 1.15342 23.7473 0.703368 23.2975C0.253315 22.8477 0.000318156 22.2375 0 21.6012L0 4.8096C0.000318156 4.17329 0.253315 3.56315 0.703368 3.11332C1.15342 2.66349 1.76369 2.4108 2.4 2.4108H5.9676V0.8388C5.96792 0.616226 6.05656 0.402877 6.21405 0.245606C6.37155 0.0883348 6.58503 -2.27116e-07 6.8076 0ZM1.68 9.2904V21.6012C1.68 21.6958 1.69862 21.7894 1.73481 21.8767C1.77099 21.9641 1.82403 22.0435 1.89088 22.1103C1.95774 22.1772 2.03711 22.2302 2.12447 22.2664C2.21182 22.3026 2.30545 22.3212 2.4 22.3212H21.6C21.6946 22.3212 21.7882 22.3026 21.8755 22.2664C21.9629 22.2302 22.0423 22.1772 22.1091 22.1103C22.176 22.0435 22.229 21.9641 22.2652 21.8767C22.3014 21.7894 22.32 21.6958 22.32 21.6012V9.3072L1.68 9.2904ZM8.0004 17.5428V19.542H6V17.5428H8.0004ZM12.9996 17.5428V19.542H11.0004V17.5428H12.9996ZM18 17.5428V19.542H15.9996V17.5428H18ZM8.0004 12.7704V14.7696H6V12.7704H8.0004ZM12.9996 12.7704V14.7696H11.0004V12.7704H12.9996ZM18 12.7704V14.7696H15.9996V12.7704H18ZM5.9676 4.0896H2.4C2.30545 4.0896 2.21182 4.10822 2.12447 4.14441C2.03711 4.18059 1.95774 4.23362 1.89088 4.30048C1.82403 4.36734 1.77099 4.44671 1.73481 4.53407C1.69862 4.62142 1.68 4.71505 1.68 4.8096V7.6116L22.32 7.6284V4.8096C22.32 4.71505 22.3014 4.62142 22.2652 4.53407C22.229 4.44671 22.176 4.36734 22.1091 4.30048C22.0423 4.23362 21.9629 4.18059 21.8755 4.14441C21.7882 4.10822 21.6946 4.0896 21.6 4.0896H18.348V5.2044C18.348 5.42718 18.2595 5.64084 18.102 5.79837C17.9444 5.9559 17.7308 6.0444 17.508 6.0444C17.2852 6.0444 17.0716 5.9559 16.914 5.79837C16.7565 5.64084 16.668 5.42718 16.668 5.2044V4.0896H7.6476V5.1936C7.6476 5.41638 7.5591 5.63004 7.40157 5.78757C7.24404 5.9451 7.03038 6.0336 6.8076 6.0336C6.58482 6.0336 6.37116 5.9451 6.21363 5.78757C6.0561 5.63004 5.9676 5.41638 5.9676 5.1936V4.0896Z"
                                                        fill="#8D8D8D" />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip0_26_2892">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg>
                                        </span>
                                        <input type="text" name="check_in" class="form-control-custom date-picker-single"
                                            placeholder="mm/ dd/ yyyy" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 mb-4">
                                <div class="form-group-custom">
                                    <label class="form-label-custom">@lang('Check-out date')</label>
                                    <div class="input-group-custom">
                                        <span class="input-icon"><svg width="24" height="24" viewBox="0 0 24 24"
                                                fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <g clip-path="url(#clip0_26_2892)">
                                                    <path
                                                        d="M6.8076 0C7.03038 0 7.24404 0.0884998 7.40157 0.24603C7.5591 0.403561 7.6476 0.617218 7.6476 0.84V2.4108H16.668V0.8508C16.668 0.628018 16.7565 0.414361 16.914 0.25683C17.0716 0.0992998 17.2852 0.0108 17.508 0.0108C17.7308 0.0108 17.9444 0.0992998 18.102 0.25683C18.2595 0.414361 18.348 0.628018 18.348 0.8508V2.4108H21.6C22.2363 2.4108 22.8466 2.66349 23.2966 3.11332C23.7467 3.56315 23.9997 4.17329 24 4.8096V21.6012C23.9997 22.2375 23.7467 22.8477 23.2966 23.2975C22.8466 23.7473 22.2363 24 21.6 24H2.4C1.76369 24 1.15342 23.7473 0.703368 23.2975C0.253315 22.8477 0.000318156 22.2375 0 21.6012L0 4.8096C0.000318156 4.17329 0.253315 3.56315 0.703368 3.11332C1.15342 2.66349 1.76369 2.4108 2.4 2.4108H5.9676V0.8388C5.96792 0.616226 6.05656 0.402877 6.21405 0.245606C6.37155 0.0883348 6.58503 -2.27116e-07 6.8076 0ZM1.68 9.2904V21.6012C1.68 21.6958 1.69862 21.7894 1.73481 21.8767C1.77099 21.9641 1.82403 22.0435 1.89088 22.1103C1.95774 22.1772 2.03711 22.2302 2.12447 22.2664C2.21182 22.3026 2.30545 22.3212 2.4 22.3212H21.6C21.6946 22.3212 21.7882 22.3026 21.8755 22.2664C21.9629 22.2302 22.0423 22.1772 22.1091 22.1103C22.176 22.0435 22.229 21.9641 22.2652 21.8767C22.3014 21.7894 22.32 21.6958 22.32 21.6012V9.3072L1.68 9.2904ZM8.0004 17.5428V19.542H6V17.5428H8.0004ZM12.9996 17.5428V19.542H11.0004V17.5428H12.9996ZM18 17.5428V19.542H15.9996V17.5428H18ZM8.0004 12.7704V14.7696H6V12.7704H8.0004ZM12.9996 12.7704V14.7696H11.0004V12.7704H12.9996ZM18 12.7704V14.7696H15.9996V12.7704H18ZM5.9676 4.0896H2.4C2.30545 4.0896 2.21182 4.10822 2.12447 4.14441C2.03711 4.18059 1.95774 4.23362 1.89088 4.30048C1.82403 4.36734 1.77099 4.44671 1.73481 4.53407C1.69862 4.62142 1.68 4.71505 1.68 4.8096V7.6116L22.32 7.6284V4.8096C22.32 4.71505 22.3014 4.62142 22.2652 4.53407C22.229 4.44671 22.176 4.36734 22.1091 4.30048C22.0423 4.23362 21.9629 4.18059 21.8755 4.14441C21.7882 4.10822 21.6946 4.0896 21.6 4.0896H18.348V5.2044C18.348 5.42718 18.2595 5.64084 18.102 5.79837C17.9444 5.9559 17.7308 6.0444 17.508 6.0444C17.2852 6.0444 17.0716 5.9559 16.914 5.79837C16.7565 5.64084 16.668 5.42718 16.668 5.2044V4.0896H7.6476V5.1936C7.6476 5.41638 7.5591 5.63004 7.40157 5.78757C7.24404 5.9451 7.03038 6.0336 6.8076 6.0336C6.58482 6.0336 6.37116 5.9451 6.21363 5.78757C6.0561 5.63004 5.9676 5.41638 5.9676 5.1936V4.0896Z"
                                                        fill="#8D8D8D" />
                                                </g>
                                                <defs>
                                                    <clipPath id="clip0_26_2892">
                                                        <rect width="24" height="24" fill="white" />
                                                    </clipPath>
                                                </defs>
                                            </svg></span>
                                        <input type="text" name="check_out"
                                            class="form-control-custom date-picker-single" placeholder="mm/ dd/ yyyy"
                                            readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Guests -->
                        <div class="row mt-2">
                            <div class="col-12 mb-2">
                                <label class="form-label-main">@lang('Stay in room')</label>
                                <p class="form-label-sub">@lang('Guests aged 12 or above')</p>
                            </div>
                            <div class="col-sm-6 mb-4">
                                <div class="input-group-custom select-wrap">
                                    <span class="input-icon"><svg width="24" height="24" viewBox="0 0 24 24"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                d="M12 4C10.9391 4 9.92172 4.42143 9.17157 5.17157C8.42143 5.92172 8 6.93913 8 8C8 9.06087 8.42143 10.0783 9.17157 10.8284C9.92172 11.5786 10.9391 12 12 12C13.0609 12 14.0783 11.5786 14.8284 10.8284C15.5786 10.0783 16 9.06087 16 8C16 6.93913 15.5786 5.92172 14.8284 5.17157C14.0783 4.42143 13.0609 4 12 4ZM10 13C8.93913 13 7.92172 13.4214 7.17157 14.1716C6.42143 14.9217 6 15.9391 6 17V18C6 18.5304 6.21071 19.0391 6.58579 19.4142C6.96086 19.7893 7.46957 20 8 20H16C16.5304 20 17.0391 19.7893 17.4142 19.4142C17.7893 19.0391 18 18.5304 18 18V17C18 15.9391 17.5786 14.9217 16.8284 14.1716C16.0783 13.4214 15.0609 13 14 13H10Z"
                                                fill="#8D8D8D" />
                                        </svg>
                                    </span>
                                    <select name="adults" class="form-control-custom select-custom">
                                        <option value="1">1 adult</option>
                                        <option value="2" selected>2 adults</option>
                                        <option value="3">3 adults</option>
                                        <option value="4">4 adults</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6 mb-4">
                                <div class="input-group-custom select-wrap">
                                    <span class="input-icon"><svg width="24" height="24" viewBox="0 0 24 24"
                                            fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="M19 12.998H13V18.998H11V12.998H5V10.998H11V4.99805H13V10.998H19V12.998Z"
                                                fill="#8D8D8D" />
                                        </svg></span>
                                    <select name="children" class="form-control-custom select-custom">
                                        <option value="0">Add a child</option>
                                        <option value="1">1 child</option>
                                        <option value="2">2 children</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Promo Code -->
                        <div class="row mt-2">
                            <div class="col-12 mb-4">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="promoCode">
                                    <label class="custom-control-label" for="promoCode">@lang('I have a promo code')</label>
                                </div>
                            </div>
                        </div>

                        <!-- Action Button -->
                        <div class="row">
                            <div class="col-12 mt-4">
                                <button type="submit" class="btn-booking-submit">
                                    @lang('CHECK AVAILABILITY')
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    @push('script')
        <script>
            (function($) {
                "use strict";
                $('.date-picker-single').daterangepicker({
                    singleDatePicker: true,
                    showDropdowns: true,
                    minDate: moment(),
                    autoUpdateInput: false,
                    locale: {
                        format: 'DD MMM YYYY'
                    }
                });

                $('.date-picker-single').on('apply.daterangepicker', function(ev, picker) {
                    $(this).val(picker.startDate.format('DD MMM YYYY'));
                });

                $('.date-picker-single').on('cancel.daterangepicker', function(ev, picker) {
                    $(this).val('');
                });

            })(jQuery);
        </script>
    @endpush
@endsection
