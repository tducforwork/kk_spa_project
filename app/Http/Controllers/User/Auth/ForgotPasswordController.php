<?php

namespace App\Http\Controllers\User\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PasswordReset;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;

class ForgotPasswordController extends Controller {
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
     */

    use SendsPasswordResetEmails;

    public function showLinkRequestForm() {
        $pageTitle = "Account Recovery";
        return view('Template::User.auth.passwords.email', compact('pageTitle'));
    }

    public function sendResetCodeEmail(Request $request) {
        $request->validate([
            'value' => 'required',
        ]);

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        $fieldType = $this->findFieldType();
        $User  = User::where($fieldType, $request->value)->first();

        if (!$User) {
            $notify[] = ['error', 'Couldn\'t find any account with this information'];
            return back()->withNotify($notify);
        }

        PasswordReset::where('email', $User->email)->delete();

        $code                 = verificationCode(6);
        $password             = new PasswordReset();
        $password->email      = $User->email;
        $password->token      = $code;
        $password->created_at = Carbon::now();
        $password->save();

        $UserBrowserInfo = osBrowser();

        notify($User, 'PASS_RESET_CODE', [
            'code'             => $code,
            'operating_system' => isset($UserBrowserInfo['os_platform']) ? $UserBrowserInfo['os_platform'] : '',
            'browser'          => isset($UserBrowserInfo['browser']) ? $UserBrowserInfo['browser'] : '',
            'ip'               => getRealIp(),
            'time'             => date('Y-m-d h:i:s A'),
        ], ['email']);

        $email = $User->email;
        session()->put('pass_res_mail', $email);
        $notify[] = ['success', 'Password reset email sent successfully'];
        return to_route('User.password.code.verify')->withNotify($notify);
    }

    public function findFieldType() {
        $input     = request()->input('value');
        $fieldType = filter_var($input, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$fieldType => $input]);
        return $fieldType;
    }

    public function codeVerify() {
        $pageTitle = 'Verify Email';
        $email     = session()->get('pass_res_mail');
        if (!$email) {
            $notify[] = ['error', 'Oops! session expired'];
            return to_route('User.password.request')->withNotify($notify);
        }
        return view('Template::User.auth.passwords.code_verify', compact('pageTitle', 'email'));
    }

    public function verifyCode(Request $request) {
        $request->validate([
            'code'  => 'required',
            'email' => 'required',
        ]);

        $code            = str_replace(' ', '', $request->code);
        $tokenMatchCount = PasswordReset::where('token', $code)->where('email', $request->email)->count();
        if ($tokenMatchCount != 1) {
            $notify[] = ['error', 'Verification code doesn\'t match'];
            return to_route('User.password.request')->withNotify($notify);
        }
        $notify[] = ['success', 'You can change your password.'];
        session()->flash('fpass_email', $request->email);
        return to_route('User.password.reset', $code)->withNotify($notify);
    }
}
