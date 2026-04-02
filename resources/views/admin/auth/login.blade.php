@extends('admin.layouts.master')

@push('style')
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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

    .login-right::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    .login-form-wrapper {
        width: 100%;
        max-width: 380px;
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

    .form-control {
        background-color: var(--bg-input);
        border: 1px solid var(--border-input);
        color: var(--text-main) !important;
        padding: 11px 16px;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.2s ease;
        width: 100%;
    }

    .form-control::placeholder {
        color: #475569;
        font-size: 13px;
    }

    .form-control:focus {
        background-color: var(--bg-input);
        border-color: var(--primary-color);
        box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.12);
        outline: none;
    }

    .password-container {
        position: relative;
    }

    .password-toggle {
        position: absolute;
        right: 14px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-muted);
        cursor: pointer;
        padding: 5px;
        transition: color 0.2s;
    }

    .password-toggle:hover {
        color: var(--primary-color);
    }

    .form-footer {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 30px;
    }

    .remember-me {
        display: flex;
        align-items: center;
        gap: 8px;
        cursor: pointer;
        user-select: none;
        color: var(--text-muted);
        font-size: 13px;
    }

    .remember-me input {
        width: 16px;
        height: 16px;
        accent-color: var(--primary-color);
        cursor: pointer;
    }

    .forgot-password {
        font-size: 13px;
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 500;
    }

    .forgot-password:hover {
        color: var(--primary-hover);
        text-decoration: none;
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
    }

    .btn-login:hover {
        background-color: var(--primary-hover);
        transform: translateY(-1px);
        box-shadow: 0 6px 16px rgba(59, 130, 246, 0.35);
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
                <h2>@lang('Sign In Below')</h2>
                <p>@lang('Welcome back! Please enter your details.')</p>
            </div>

            <form action="{{ route('admin.login') }}" method="POST" class="verify-gcaptcha login-form">
                @csrf
                <div class="form-group">
                    <label class="form-label">@lang('Email/Username')</label>
                    <input type="text" class="form-control" name="username" value="{{ old('username') }}" required placeholder="Enter username">
                </div>

                <div class="form-group">
                    <label class="form-label">@lang('Password')</label>
                    <div class="password-container">
                        <input type="password" class="form-control" id="password" name="password" required placeholder="••••••••">
                        <span class="password-toggle"><i class="las la-eye"></i></span>
                    </div>
                </div>

                <div class="form-footer">
                    <label class="remember-me">
                        <input type="checkbox" name="remember" id="remember">
                        <span>@lang('Remember me')</span>
                    </label>
                    <a href="{{ route('admin.password.reset') }}" class="forgot-password">@lang('Lost your password?')</a>
                </div>

                <x-captcha path="admin.auth" />

                <button type="submit" class="btn-login">
                    <i class="las la-sign-in-alt"></i>
                    @lang('Sign in')
                </button>
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
        "use strict";
        $('.password-toggle').on('click', function() {
            var passInput = $("#password");
            if (passInput.attr('type') == 'password') {
                passInput.attr('type', 'text');
                $(this).find('i').removeClass('la-eye').addClass('la-eye-slash');
            } else {
                passInput.attr('type', 'password');
                $(this).find('i').removeClass('la-eye-slash').addClass('la-eye');
            }
        });
    })(jQuery);
</script>
@endpush
