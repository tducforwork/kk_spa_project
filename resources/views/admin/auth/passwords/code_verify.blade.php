@extends('admin.layouts.master')

@push('style')
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="{{ asset('assets/admin/css/verification_code.css') }}">
<style>
    :root {
        --primary-color: #3b82f6;
        --primary-hover: #2563eb;
        --bg-dark: #0f172a;
        --bg-input: #1e293b;
        --border-input: #334155;
        --text-main: #f8fafc;
        --text-muted: #94a3b8;
    }

    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        overflow: hidden;
        font-family: 'Inter', sans-serif;
        background-color: var(--bg-dark);
    }

    .login-split {
        display: flex;
        height: 100vh;
        width: 100%;
    }

    .login-left {
        width: 550px;
        background-color: var(--bg-dark);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px;
        flex-shrink: 0;
        z-index: 2;
    }

    .login-right {
        flex-grow: 1;
        position: relative;
        background-image: url("{{ asset('assets/admin/images/login_bg.webp') }}");
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
    }

    .login-form-wrapper {
        width: 100%;
        max-width: 400px;
        animation: fadeIn 0.8s ease-out;
        text-align: center;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .logo {
        margin-bottom: 30px;
        display: flex;
        justify-content: center;
    }

    .logo img {
        max-width: 160px;
        filter: drop-shadow(0 0 10px rgba(59, 130, 246, 0.3));
    }

    .login-heading {
        margin-bottom: 35px;
    }

    .login-heading h2 {
        font-size: 22px;
        font-weight: 700;
        color: var(--text-main);
        margin-bottom: 8px;
    }

    .login-heading p {
        color: var(--text-muted);
        font-size: 13px;
    }

    .form-group {
        margin-bottom: 22px;
        text-align: left;
    }

    .form-label {
        display: block;
        margin-bottom: 10px;
        font-size: 12px;
        font-weight: 600;
        color: var(--text-muted);
        letter-spacing: 0.8px;
    }

    .verification-code input {
        color: var(--text-main) !important;
    }

    .verification-code .boxes span {
        border: 1px solid var(--border-input);
        background-color: var(--bg-input);
        color: var(--text-main);
    }

    .btn-login {
        background-color: var(--primary-color);
        color: white;
        border: none;
        padding: 10px;
        border-radius: 8px;
        width: 100%;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 12px rgba(59, 130, 246, 0.25);
        margin-bottom: 20px;
    }

    .btn-login:hover {
        background-color: var(--primary-hover);
        transform: translateY(-1px);
        box-shadow: 0 6px 16px rgba(59, 130, 246, 0.35);
    }

    .btn-login.disabled,
    .btn-login:disabled {
        opacity: 0.7;
        cursor: not-allowed;
    }

    .auth-links {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .auth-link {
        font-size: 14px;
        color: var(--text-muted);
        text-decoration: none;
        transition: all 0.2s;
        display: inline-flex;
        align-items: center;
        gap: 5px;
    }

    .auth-link:hover {
        color: var(--primary-color);
        text-decoration: none;
    }

    @media (max-width: 1024px) {
        .login-left {
            width: 450px;
            padding: 40px;
        }
    }

    @media (max-width: 768px) {
        .login-right {
            display: none;
        }

        .login-left {
            width: 100%;
        }
    }
</style>
@endpush

@section('content')
<div class="login-split">
    <div class="login-left">
        <div class="login-form-wrapper">
            <div class="logo">
                <img src="{{ siteLogo() }}" alt="logo">
            </div>

            <div class="login-heading">
                <h2>@lang('Verify Code')</h2>
                <p>@lang('Please check your email and enter the verification code you received.')</p>
            </div>

            <form action="{{ route('admin.password.verify.code') }}" method="POST" class="login-form">
                @csrf
                <div class="form-group">
                    <label class="form-label">@lang('Verification Code')</label>
                    <div class="verification-code">
                        <input type="text" name="code" class="overflow-hidden" autocomplete="off">
                        <div class="boxes">
                            <span>-</span>
                            <span>-</span>
                            <span>-</span>
                            <span>-</span>
                            <span>-</span>
                            <span>-</span>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn-login disabled">
                    @lang('Verify Code')
                </button>

                <div class="auth-links">
                    <a href="{{ route('admin.password.reset') }}" class="auth-link">
                        @lang('Resend Code')
                    </a>
                    <a href="{{ route('admin.login') }}" class="auth-link">
                        <i class="las la-sign-in-alt"></i>
                        @lang('Back to Login')
                    </a>
                </div>
            </form>
        </div>
    </div>
    <div class="login-right">
    </div>
</div>
@endsection

@push('script')
<script>
    (function($) {
        'use strict';
        $('[name=code]').on('input', function() {

            $(this).val(function(i, val) {
                if (val.length == 6) {
                    $('form').find('button[type=submit]').html(
                        '<i class="las la-spinner fa-spin"></i> @lang("Verifying...")');
                    $('form').find('button[type=submit]').removeClass('disabled');
                    $('form')[0].submit();
                } else {
                    $('form').find('button[type=submit]').addClass('disabled');
                }
                if (val.length > 6) {
                    return val.substring(0, val.length - 1);
                }
                return val;
            });

            for (let index = $(this).val().length; index >= 0; index--) {
                $($('.boxes span')[index]).html('');
            }
        });

    })(jQuery)
</script>
@endpush
