<div id="inquiry-modal" class="inquiry-modal">
    <div class="inquiry-modal-overlay"></div>
    <div class="inquiry-modal-content">
        <button class="inquiry-modal-close"><svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M6.4 19L5 17.6L10.6 12L5 6.4L6.4 5L12 10.6L17.6 5L19 6.4L13.4 12L19 17.6L17.6 19L12 13.4L6.4 19Z"
                    fill="#B3B3B3" />
            </svg></button>
        <div class="inquiry-modal-header text-center">
            <h3 class="inquiry-modal-title">{{ __('SEND AN INQUIRY') }}</h3>
        </div>
        <form action="{{ route('inquiry.submit') }}" method="POST" class="inquiry-form mt-3" id="inquiryForm">
            @csrf
            <input type="hidden" name="form_type" value="inquiry">
            <input type="hidden" name="origin" value="General">
            <div class="row">
                <div class="col-md-6 col-6 mb-3">
                    <label class="form-label">{{ __('Name') }}</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="col-md-6 col-6 mb-3">
                    <label class="form-label">{{ __('Phone') }}</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                <div class="col-md-6 col-6 mb-3">
                    <label class="form-label">{{ __('Email') }}</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="col-md-6 col-6 mb-3">
                    <label class="form-label">{{ __('Date') }}</label>
                    <input type="text" name="date" class="form-control date-picker" required readonly>
                </div>
                <div class="col-12 mb-4">
                    <label class="form-label">{{ __('Message') }}</label>
                    <textarea name="message" class="form-control" rows="4" required></textarea>
                </div>
            </div>
            <div class="text-end">
                <button type="submit" class="btn-inquiry-submit">
                    <span class="btn-text">{{ __('SEND A MESSAGE') }}</span>
                </button>
            </div>
        </form>
    </div>
</div>

@push('script')
    @php
        $siteKey = config('captcha.google.site_key');
        if (!$siteKey) {
            $reCaptcha = App\Models\Extension::where('act', 'google-recaptcha2')->first();
            $siteKey = $reCaptcha ? $reCaptcha->shortcode->site_key->value : '';
        }
        $captchaStatus =
            config('captcha.google.status') ??
            App\Models\Extension::where('act', 'google-recaptcha2')
                ->where('status', \App\Constants\Status::ENABLE)
                ->exists();
    @endphp
    @if ($captchaStatus && $siteKey)
        <script src="https://www.google.com/recaptcha/api.js?render={{ $siteKey }}"></script>
    @endif
    <script>
        $(document).ready(function() {
            $('#inquiryForm').on('submit', function(e) {
                e.preventDefault();
                const form = $(this);
                const submitBtn = form.find('.btn-inquiry-submit');
                const btnText = submitBtn.find('.btn-text');
                const originalText = btnText.text();

                btnText.text('{{ __('Sending...') }}');
                submitBtn.prop('disabled', true);

                @if ($captchaStatus && $siteKey)
                    grecaptcha.ready(function() {
                        grecaptcha.execute('{{ $siteKey }}', {
                            action: 'inquiry_form'
                        }).then(function(token) {
                            const formData = form.serializeArray();
                            formData.push({
                                name: 'g-recaptcha-response',
                                value: token
                            });

                            sendAjax(form, formData, submitBtn, btnText, originalText);
                        });
                    });
                @else
                    const formData = form.serializeArray();
                    sendAjax(form, formData, submitBtn, btnText, originalText);
                @endif
            });

            function sendAjax(form, formData, submitBtn, btnText, originalText) {
                $.ajax({
                    url: form.attr('action'),
                    method: 'POST',
                    data: formData,
                    success: function(response) {
                        if (response.success) {
                            notify('success', response.success);
                            form[0].reset();
                            $('#inquiry-modal').removeClass('active');
                            $('body').removeClass('modal-open');
                        } else {
                            notify('error', response.error || 'Something went wrong');
                        }
                    },
                    error: function() {
                        notify('error', 'An error occurred. Please try again.');
                    },
                    complete: function() {
                        btnText.text(originalText);
                        submitBtn.prop('disabled', false);
                    }
                });
            }
        });
    </script>
@endpush
