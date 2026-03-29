<div id="book-table-modal" class="book-table-modal">
    <div class="book-table-modal-overlay"></div>
    <div class="book-table-modal-content">
        <button class="book-table-modal-close"><svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path d="M6.4 19L5 17.6L10.6 12L5 6.4L6.4 5L12 10.6L17.6 5L19 6.4L13.4 12L19 17.6L17.6 19L12 13.4L6.4 19Z"
                    fill="#B3B3B3" />
            </svg></button>
        <div class="book-table-modal-header text-center">
            <h3 class="book-table-modal-title">{{ __('BOOK A TABLE') }}</h3>
        </div>
        <form action="{{ route('contact.submit') }}" method="POST" class="book-table-form mt-3">
            @csrf
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">{{ __('Name') }}</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">{{ __('Phone') }}</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">{{ __('Email') }}</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">{{ __('Date') }}</label>
                    <input type="text" name="date" class="form-control date-picker" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">{{ __('Time') }}</label>
                    <input type="time" name="time" class="form-control" required>
                </div>
                <div class="col-md-6 mb-3">
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
