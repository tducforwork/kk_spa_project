@php
    $customCaptcha = loadCustomCaptcha();
    $googleCaptcha = loadReCaptcha();
@endphp

@if ($googleCaptcha)
    @php echo $googleCaptcha @endphp
    <input type="hidden" name="g-recaptcha-response" id="g-recaptcha-response">
    @push('script')
        <script>
            (function($) {
                "use strict"
                $('.verify-gcaptcha').on('submit', function(e) {
                    var form = $(this);
                    if ($('#g-recaptcha-response').val() === "") {
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
                                action: 'login'
                            }).then(function(token) {
                                $('#g-recaptcha-response').val(token);
                                form.submit();
                            });
                        });
                    }
                });
            })(jQuery);
        </script>
    @endpush
@endif

@if ($customCaptcha)
    <div class="form-group">
        <label class="{{ $labelClass }}">@lang('Captcha')</label>
        <div class="mb-2">
            @php echo $customCaptcha @endphp
        </div>
        <input type="text" name="captcha" class="form-control" placeholder="@lang('Enter Captcha')" required>
    </div>
@endif
