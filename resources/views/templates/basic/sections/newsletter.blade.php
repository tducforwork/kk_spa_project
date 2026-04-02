@php
    $newsletterContent = getContent('newsletter.content', true);
@endphp

<section class="newsletter-section">
    <div class="container">
        <div class="newsletter-wrapper text-center">
            <h2 class="newsletter-title">{{ __(@$newsletterContent->data_values->{'heading_' . app()->getLocale()}) }}
            </h2>
            <div class="newsletter-divider">
                <span class="diamond-dot left"></span>
                <span class="line"></span>
                <span class="diamond-dot right"></span>
            </div>

            <form action="{{ route('subscribe') }}" method="POST" class="newsletter-form">
                @csrf
                {!! loadReCaptcha() !!}
                <div class="newsletter-input-group">
                    <input type="email" name="email" class="form-control newsletter-input"
                        placeholder="{{ __('Your email') }}" required>
                    <button type="submit" class="newsletter-submit-btn">{{ __('SUBSCRIBE') }}</button>
                </div>
            </form>
        </div>
    </div>
</section>

@push('script')
    <script>
        (function($) {
            "use strict";
            $('.newsletter-form').on('submit', function(e) {
                e.preventDefault();
                var $form = $(this);
                var url = $form.attr('action');
                var $btn = $form.find('button[type=submit]');
                var originalText = $btn.text();

                $btn.prop('disabled', true).text("{{ __('Verifying...') }}");

                grecaptcha.ready(function() {
                    @php
                        $siteKey = config('captcha.google.site_key');
                        if (!$siteKey) {
                            $reCaptcha = App\Models\Extension::where('act', 'google-recaptcha2')->first();
                            $siteKey = $reCaptcha ? $reCaptcha->shortcode->site_key->value : '';
                        }
                    @endphp
                    grecaptcha.execute('{{ $siteKey }}', {
                        action: 'subscribe'
                    }).then(function(token) {
                        var data = $form.serialize() + '&g-recaptcha-response=' + token;
                        $btn.text("{{ __('Subscribing...') }}");

                        $.ajax({
                            url: url,
                            method: 'POST',
                            data: data,
                            success: function(response) {
                                if (response.success) {
                                    notify('success', response.message);
                                    $('.newsletter-form').trigger("reset");
                                } else {
                                    notify('error', response.error);
                                }
                            },
                            error: function(response) {
                                notify('error',
                                    "{{ __('Something went wrong. Please try again.') }}"
                                );
                            },
                            complete: function() {
                                $btn.prop('disabled', false).text(originalText);
                            }
                        });
                    });
                });
            });
        })(jQuery);
    </script>
@endpush
