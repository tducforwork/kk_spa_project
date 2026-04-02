@php
    $customCaptcha = loadCustomCaptcha();
    $googleCaptcha = loadReCaptcha();
@endphp
@if ($googleCaptcha)
    @php echo $googleCaptcha @endphp
    <input type="hidden" name="g-recaptcha-response" class="g-recaptcha-response">
@endif
@if ($customCaptcha)
    @props(['hasIcon'])
    <div class="form-group">
        <div class="mb-2">
            @php echo $customCaptcha @endphp
        </div>
        @if ((bool) @$hasIcon)
            <label class="{{ $labelClass }}">@lang('Captcha')</label>
            <div class="custom-icon-field">
                <i class="las la-fingerprint"></i>
                <input type="text" name="captcha" class="form-control form--control" required>
            </div>
        @else
            <label class="{{ $labelClass }}">@lang('Captcha')</label>
            <input type="text" name="captcha" class="form-control form--control" required>
        @endif
    </div>
@endif
@if ($googleCaptcha)
    @push('script')
        <script>
            (function($) {
                "use strict"
                $('.verify-gcaptcha').on('submit', function(e) {
                    var form = $(this);
                    var responseField = form.find('.g-recaptcha-response');
                    if (responseField.val() === "") {
                        e.preventDefault();
                        @php
                            $siteKey = config('captcha.google.site_key');
                            if (!$siteKey) {
                                $reCaptcha = App\Models\Extension::where('act', 'google-recaptcha2')->first();
                                $siteKey = $reCaptcha ? $reCaptcha->shortcode->site_key->value : '';
                            }
                        @endphp
                        grecaptcha.ready(function() {
                            grecaptcha.execute("{{ $siteKey }}", {
                                action: 'form_submit'
                            }).then(function(token) {
                                responseField.val(token);
                                form.submit();
                            });
                        });
                    }
                });
            })(jQuery);
        </script>
    @endpush
@endif
