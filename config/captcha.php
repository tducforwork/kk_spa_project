<?php

return [
    'google' => [
        'site_key'   => env('GOOGLE_RECAPTCHA_SITE_KEY'),
        'secret_key' => env('GOOGLE_RECAPTCHA_SECRET_KEY'),
        'status'     => env('GOOGLE_RECAPTCHA_STATUS', 1),
    ],
    'custom' => [
        'status'     => env('CUSTOM_CAPTCHA_STATUS', 1),
        'random_key' => env('CUSTOM_CAPTCHA_RANDOM_KEY'),
    ],
];
