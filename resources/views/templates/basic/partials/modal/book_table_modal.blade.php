<div id="book-table-modal" class="book-table-modal">
    <div class="book-table-modal-overlay"></div>
    <div class="book-table-modal-content">
        <button class="book-table-modal-close"><svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M6.4 19L5 17.6L10.6 12L5 6.4L6.4 5L12 10.6L17.6 5L19 6.4L13.4 12L19 17.6L17.6 19L12 13.4L6.4 19Z"
                    fill="#B3B3B3" />
            </svg></button>
        <div class="book-table-modal-header text-center">
            <h3 class="book-table-modal-title">{{ __('BOOK A TABLE') }}</h3>
        </div>
        <form action="{{ route('inquiry.submit') }}" method="POST" class="book-table-form mt-3" id="bookTableForm">
            @csrf
            <input type="hidden" name="form_type" value="booking">
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
                <div class="col-md-6 col-6 mb-3">
                    <label class="form-label">{{ __('Time') }}</label>
                    <input type="text" name="time" class="form-control time-picker" required readonly>
                </div>
                <div class="col-md-6 col-6 mb-3">
                    <label class="form-label">{{ __('Number of Guests') }}</label>
                    <input type="number" name="guests" class="form-control" required>
                </div>
                <div class="col-12 mb-4">
                    <label class="form-label">{{ __('Message') }}</label>
                    <textarea name="message" class="form-control" rows="4"></textarea>
                </div>
            </div>
            <div class="text-end">
                <button type="submit" class="btn-book-table-submit">
                    <span class="btn-text">{{ __('BOOK A TABLE') }}</span>
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
            $('#bookTableForm').on('submit', function(e) {
                e.preventDefault();
                const form = $(this);
                const submitBtn = form.find('.btn-book-table-submit');
                const btnText = submitBtn.find('.btn-text');
                const originalText = btnText.text();

                btnText.text('{{ __('Processing...') }}');
                submitBtn.prop('disabled', true);

                @if ($captchaStatus && $siteKey)
                    grecaptcha.ready(function() {
                        grecaptcha.execute('{{ $siteKey }}', {
                            action: 'booking_form'
                        }).then(function(token) {
                            const formData = form.serializeArray();
                            formData.push({
                                name: 'g-recaptcha-response',
                                value: token
                            });

                            sendBookingAjax(form, formData, submitBtn, btnText,
                                originalText);
                        });
                    });
                @else
                    const formData = form.serializeArray();
                    sendBookingAjax(form, formData, submitBtn, btnText, originalText);
                @endif
            });

            // Initialize Date Picker for Modal
            $('.date-picker').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                autoUpdateInput: false,
                minDate: moment(),
                locale: {
                    format: 'DD/MM/YYYY'
                }
            });

            $('.date-picker').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('DD/MM/YYYY'));
            });

            // Simple Time Picker Logic (or initialize if using a library)
            // If using a specific timepicker library, initialize it here.
            // For now, ensuring it starts empty or handles input correctly.

            function sendBookingAjax(form, formData, submitBtn, btnText, originalText) {
                $.ajax({
                    url: form.attr('action'),
                    method: 'POST',
                    data: formData,
                    success: function(response) {
                        if (response.success) {
                            notify('success', response.success);
                            form[0].reset();
                            $('#book-table-modal').removeClass('active');
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
