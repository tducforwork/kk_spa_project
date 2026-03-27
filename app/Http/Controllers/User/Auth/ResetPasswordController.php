<?php

namespace App\Http\Controllers\User\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PasswordReset;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class ResetPasswordController extends Controller {
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
     */

    use ResetsPasswords;

    public function __construct() {
        parent::__construct();
    }

    public function showResetForm(Request $request, $token = null) {
        $email = session('fpass_email');
        $token = session()->has('token') ? session('token') : $token;

        if (PasswordReset::where('token', $token)->where('email', $email)->count() != 1) {
            $notify[] = ['error', 'Invalid token'];
            return to_route('User.password.request')->withNotify($notify);
        }
        return view('Template::User.auth.passwords.reset')->with(
            ['token' => $token, 'email' => $email, 'pageTitle' => 'Reset Password']
        );
    }

    public function reset(Request $request) {
        session()->put('fpass_email', $request->email);
        $request->validate($this->rules(), $this->validationErrorMessages());
        $reset = PasswordReset::where('token', $request->token)->orderBy('created_at', 'desc')->first();

        if (!$reset) {
            $notify[] = ['error', 'Invalid verification code'];
            return to_route('User.login')->withNotify($notify);
        }

        $User           = User::where('email', $reset->email)->first();
        $User->password = Hash::make($request->password);
        $User->save();

        $UserBrowser = osBrowser();

        notify($User, 'PASS_RESET_DONE', [
            'operating_system' => isset($UserBrowser['os_platform']) ? $UserBrowser['os_platform'] : '',
            'browser'          => isset($UserBrowser['browser']) ? $UserBrowser['browser'] : '',
            'ip'               => getRealIp(),
            'time'             => date('Y-m-d h:i:s A'),
        ], ['email']);

        $notify[] = ['success', 'Password changed successfully'];
        return to_route('User.login')->withNotify($notify);
    }

    /**
     * Get the password reset validation rules.
     *
     * @return array
     */
    protected function rules() {
        $passwordValidation = Password::min(6);
        $general            = gs();
        if ($general->secure_password) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }
        return [
            'token'    => 'required',
            'email'    => 'required|email',
            'password' => ['required', 'confirmed', $passwordValidation],
        ];
    }
}
