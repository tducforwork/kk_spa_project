<?php

namespace App\Lib;

use App\Constants\Status;
use App\Models\Extension;

class Captcha
{
    /*
    |--------------------------------------------------------------------------
    | Captcha
    |--------------------------------------------------------------------------
    |
    | This class is using verify and show captcha. Here is currently available
    | custom captcha and google recaptcha2. Developer can use verify method
    | to verify all captcha or can use separately if required
    |
    */

    /**
     * Google recaptcha2 script
     *
     * @return string
     */
    public static function reCaptcha()
    {
        $siteKey = config('captcha.google.site_key');
        $status  = config('captcha.google.status');

        if (!$siteKey) {
            $reCaptcha = Extension::where('act', 'google-recaptcha2')->where('status', Status::ENABLE)->first();
            if (!$reCaptcha) {
                return null;
            }
            return $reCaptcha->generateScript();
        }

        if (!$status) {
            return null;
        }

        return '<script src="https://www.google.com/recaptcha/api.js?render=' . $siteKey . '"></script>';
    }

    /**
     * Custom captcha script
     *
     * @return string
     */
    public static function customCaptcha($width = '100%', $height = 46, $bgColor = '#003')
    {
        $status    = config('captcha.custom.status');
        $randomKey = config('captcha.custom.random_key');

        if ($status === null) {
            $captcha = Extension::where('act', 'custom-captcha')->where('status', Status::ENABLE)->first();
            if (!$captcha) {
                return 0;
            }
            $randomKey = $captcha->shortcode->random_key->value;
        } elseif (!$status) {
            return 0;
        }

        $textColor = '#' . gs('base_color');
        $code = rand(100000, 999999);
        $char = str_split($code);
        $ret = '<link href="https://fonts.googleapis.com/css?family=Henny+Penny&display=swap" rel="stylesheet">';
        $ret .= '<div style="height: ' . $height . 'px; line-height: ' . $height . 'px; width:' . $width . '; text-align: center; background-color: ' . $bgColor . '; color: ' . $textColor . '; font-size: ' . ($height - 20) . 'px; font-weight: bold; letter-spacing: 20px; font-family: \'Henny Penny\', cursive;  -webkit-user-select: none; -moz-user-select: none;-ms-user-select: none;user-select: none;  display: flex; justify-content: center;">';
        foreach ($char as $value) {
            $ret .= '<span style="    float:left;     -webkit-transform: rotate(' . rand(-60, 60) . 'deg);">' . $value . '</span>';
        }
        $ret .= '</div>';
        $captchaSecret = hash_hmac('sha256', $code, $randomKey);
        $ret .= '<input type="hidden" name="captcha_secret" value="' . $captchaSecret . '">';
        return $ret;
    }

    /**
     * Verify all captcha
     *
     * @return boolean
     */
    public static function verify()
    {
        $gCaptchaPass = self::verifyGoogleCaptcha();
        $cCaptchaPass = self::verifyCustomCaptcha();
        if ($gCaptchaPass && $cCaptchaPass) {
            return true;
        }
        return false;
    }

    /**
     * Verify google recaptcha2
     *
     * @return boolean
     */
    public static function verifyGoogleCaptcha()
    {
        $pass      = true;
        $secretKey = config('captcha.google.secret_key');
        $status    = config('captcha.google.status');

        if (!$secretKey) {
            $googleCaptcha = Extension::where('act', 'google-recaptcha2')->where('status', Status::ENABLE)->first();
            if ($googleCaptcha) {
                $secretKey = $googleCaptcha->shortcode->secret_key->value;
            }
        }

        if ($secretKey && ($status || $status === null)) {
            $resp = json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=" . $secretKey . "&response=" . request()['g-recaptcha-response'] . "&remoteip=" . getRealIP()), true);
            if (!$resp['success']) {
                $pass = false;
            }
        }
        return $pass;
    }

    /**
     * Verify custom captcha
     *
     * @return boolean
     */
    public static function verifyCustomCaptcha()
    {
        $pass      = true;
        $status    = config('captcha.custom.status');
        $randomKey = config('captcha.custom.random_key');

        if ($status === null) {
            $customCaptcha = Extension::where('act', 'custom-captcha')->where('status', Status::ENABLE)->first();
            if ($customCaptcha) {
                $randomKey = $customCaptcha->shortcode->random_key->value;
            } else {
                $status = 0;
            }
        }

        if ($randomKey && ($status || $status === null)) {
            $captchaSecret = hash_hmac('sha256', request()->captcha, $randomKey);
            if ($captchaSecret != request()->captcha_secret) {
                $pass = false;
            }
        }
        return $pass;
    }
}
