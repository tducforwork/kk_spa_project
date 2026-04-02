@php
    $contactContent = getContent('contact_form.content', true);
@endphp

<section id="contact-form-section" class="contact-form-section py-lg-5 py-4">
    <div class="container">
        <div class="row gy-5" style="align-items: stretch">
            <div class="col-lg-5">
                <div class="contact-banner-wrapper">
                    <div class="contact-banner-inner">
                        <img src="{{ frontendImage('contact_form', @$contactContent->data_values->banner, '800x1000') }}"
                            alt="Contact Banner" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="contact-form-wrapper ps-lg-4">
                    <h2 class="contact-form-title">
                        {{ __(@$contactContent->data_values->{'title_' . app()->getLocale()} ?? @$contactContent->data_values->title) }}
                    </h2>
                    <p class="contact-form-desc">
                        {{ __(@$contactContent->data_values->{'description_' . app()->getLocale()} ?? @$contactContent->data_values->description) }}
                    </p>

                    <form action="{{ route('contact.submit') }}" method="POST" class="contact-main-form mt-4"
                        id="contactForm">
                        @csrf
                        {!! loadReCaptcha() !!}
                        <div class="form-group">
                            <label class="form--label">@lang('Name')</label>
                            <input type="text" name="name" class="form--control" required>
                        </div>
                        <div class="form-group">
                            <label class="form--label">@lang('Phone')</label>
                            <input type="text" name="phone" class="form--control" required>
                        </div>
                        <div class="form-group">
                            <label class="form--label">@lang('Email')</label>
                            <input type="email" name="email" class="form--control" required>
                        </div>
                        <div class="form-group">
                            <label class="form--label">@lang('Message')</label>
                            <textarea name="message" class="form--control" rows="5" required></textarea>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-contact-submit" id="submitBtn">
                                <span>@lang('SEND A MESSAGE')</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    @if (@$contactContent->data_values->google_map_iframe)
        <div class="contact-map-wrapper my-5">

            <div class="container p-0">
                <div class="google-map">
                    {!! @$contactContent->data_values->google_map_iframe !!}
                </div>
            </div>
        </div>
    @endif
</section>

@push('script')
    <script>
        (function($) {
            "use strict";
            $('#contactForm').on('submit', function(e) {
                e.preventDefault();
                let $form = $(this);
                let formData = new FormData($form[0]);
                let $btn = $('#submitBtn');
                let $btnContent = $btn.html();

                $btn.prop('disabled', true).html(
                    '<span>Verifying... <i class="fas fa-spinner fa-spin"></i></span>');

                grecaptcha.ready(function() {
                    @php
                        $siteKey = config('captcha.google.site_key');
                        if (!$siteKey) {
                            $reCaptcha = App\Models\Extension::where('act', 'google-recaptcha2')->first();
                            $siteKey = $reCaptcha ? $reCaptcha->shortcode->site_key->value : '';
                        }
                    @endphp
                    grecaptcha.execute('{{ $siteKey }}', {
                        action: 'contact'
                    }).then(function(token) {
                        formData.append('g-recaptcha-response', token);
                        $btn.html(
                            '<span>Sending... <i class="fas fa-spinner fa-spin"></i></span>'
                        );

                        $.ajax({
                            url: $form.attr('action'),
                            method: "POST",
                            data: formData,
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                if (response.success) {
                                    notify('success', response.success);
                                    $('#contactForm')[0].reset();
                                } else {
                                    notify('error', response.error ||
                                        'Something went wrong');
                                }
                            },
                            error: function(response) {
                                let errors = response.responseJSON?.errors;
                                if (errors) {
                                    $.each(errors, function(key, value) {
                                        notify('error', value);
                                    });
                                } else {
                                    notify('error', 'Something went wrong');
                                }
                            },
                            complete: function() {
                                $btn.prop('disabled', false).html($btnContent);
                            }
                        });
                    });
                });
            });
        })(jQuery);
    </script>
@endpush
