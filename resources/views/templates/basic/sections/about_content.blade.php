@php
    $aboutContent = getContent('about_content.content', true);
@endphp

<section class="about-content-section py-lg-5 py-4">
    <div class="container ">
        <div class="single-post-heading">
            @include('Template::sections.feature_icons')
        </div>
        <div class="d-flex align-items-center justify-content-center position-relative mb-4 mb-lg-5">
            <h2 class="single-post-section-title mb-0">
                {{ __(@$aboutContent->data_values->{'heading_' . app()->getLocale()} ?? @$aboutContent->data_values->heading) }}
            </h2>
        </div>
        <div class="intro-slider-wrapper">
            <div class="intro-content-box intro-restaurant">
                <h4 class="text-center">{{ __('Contact') }}</h4>

                <div class="divider-restaurant"></div>
                <div class="offer-contact">
                    <ul>
                        <li class="d-flex align-items-center gap-3 flex-column mb-4">
                            <img src="{{ asset('assets/images/kk_sapa/phone.webp') }}" alt="">
                            <span>{{ __(@$aboutContent->data_values->{'hotline_' . app()->getLocale()} ?? @$aboutContent->data_values->hotline) }}</span>
                        </li>

                        <li class="d-flex align-items-center gap-3 flex-column">
                            <img src="{{ asset('assets/images/kk_sapa/mail.webp') }}" alt="">
                            <a
                                href="mailto:{{ __(@$aboutContent->data_values->{'email_' . app()->getLocale()} ?? @$aboutContent->data_values->email) }}">{{ __(@$aboutContent->data_values->{'email_' . app()->getLocale()} ?? @$aboutContent->data_values->email) }}</a>
                        </li>
                    </ul>
                </div>
                <div class="divider-restaurant"></div>
                <div class="intro-actions">
                    <ul>
                        <li class="intro-action-item mb-4">
                            <a href="https://book.securebookings.net/roomrate?id=ecec4926-aab8-1659321528-4540-b400-0e44b8bca614&lang={{ app()->getLocale() == 'vi' ? 'vi' : 'en' }}"
                                class="intro-action-link " target="_blank">
                                {{ __('Book a room') }}
                                <i class="las la-arrow-right"></i>
                            </a>
                        </li>
                        <li class="intro-action-item mb-4">
                            <a href="#" class="intro-action-link show-menu-btn">
                                {{ __('Promotion') }}
                                <i class="las la-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="intro-slider-box">
                <div class="intro-img">
                    <img src="{{ frontendImage('about_content', @$aboutContent->data_values->image, '1000x800') }}"
                        alt="About Image" class="w-100 ">
                </div>
            </div>

        </div>

        {{-- Description Text --}}
        <div class="about-description-text mt-5 pt-lg-4">
            @php echo @$aboutContent->data_values->{'description_' . app()->getLocale()} ?? @$aboutContent->data_values->description @endphp
        </div>
    </div>
</section>

@push('style')
    <style>
        .about-feature-item .about-feature-text {
            font-family: 'Josefin Sans', sans-serif;
            font-weight: 500;
            color: #333;
        }

        .about-main-title .section-title {
            color: #005153;
            font-weight: 700;
            letter-spacing: 2px;
        }

        .about-image-wrapper {
            position: relative;
        }

        .contact-floating-card {
            position: absolute;
            top: 50%;
            left: 50px;
            transform: translateY(-50%);
            width: 300px;
            background: #fff;
            border-radius: 4px;
            z-index: 10;
        }

        .contact-icon i {
            color: #005153;
            font-size: 1.2rem;
        }

        .contact-value {
            font-weight: 600;
            color: #555;
        }

        .btn-about-custom {
            background-color: #c4a16b;
            color: white;
            border-radius: 4px;
            padding: 10px;
            border: none;
            transition: all 0.3s;
            text-transform: capitalize;
        }

        .btn-about-custom:hover {
            background-color: #005153;
            color: white;
        }

        .about-description-text {
            line-height: 1.8;
            color: #666;
            font-size: 1.05rem;
        }

        .about-description-text p {
            margin-bottom: 20px;
        }

        @media (max-width: 991px) {
            .contact-floating-card {
                position: static;
                transform: none;
                width: 100%;
                margin-top: 20px;
            }
        }
    </style>
@endpush
