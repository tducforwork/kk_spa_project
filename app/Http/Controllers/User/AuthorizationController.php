<?php

namespace App\Http\Controllers\User\Auth;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class AuthorizationController extends Controller
{
    protected function checkCodeValidity($User, $addMin = 2)
    {
        if (!$User->ver_code_send_at) {
            return false;
        }
        if ($User->ver_code_send_at->addMinutes($addMin) < Carbon::now()) {
            return false;
        }
        return true;
    }

    public function authorizeForm()
    {
        $User = auth()->guard('user')->user();
        if (!$User->status) {
            $pageTitle = 'Banned';
            $type      = 'ban';
        } else if (!$User->ev) {
            $type           = 'email';
            $pageTitle      = 'Verify Email';
            $notifyTemplate = 'EVER_CODE';
        } else if (!$User->sv) {
            $type           = 'sms';
            $pageTitle      = 'Verify Mobile Number';
            $notifyTemplate = 'SVER_CODE';
        } else if (!$User->tv) {
            $pageTitle = '2FA Verification';
            $type      = '2fa';
        } else {
            return to_route('User.home');
        }

        if (!$this->checkCodeValidity($User) && ($type != '2fa') && ($type != 'ban')) {
            $User->ver_code         = verificationCode(6);
            $User->ver_code_send_at = Carbon::now();
            $User->save();
            notify($User, $notifyTemplate, [
                'code' => $User->ver_code,
            ], [$type]);
        }

        return view('Template::User.auth.authorization.' . $type, compact('user', 'pageTitle'));
    }

    public function sendVerifyCode($type)
    {
        $User = authUser('user');
        if ($this->checkCodeValidity($User)) {
            $targetTime = $User->ver_code_send_at->addMinutes(2)->timestamp;
            $delay      = $targetTime - time();
            throw ValidationException::withMessages(['resend' => 'Please try after ' . $delay . ' seconds']);
        }

        $User->ver_code         = verificationCode(6);
        $User->ver_code_send_at = Carbon::now();
        $User->save();

        if ($type == 'email') {
            $type           = 'email';
            $notifyTemplate = 'EVER_CODE';
        } else {
            $type           = 'sms';
            $notifyTemplate = 'SVER_CODE';
        }

        notify($User, $notifyTemplate, [
            'code' => $User->ver_code,
        ], [$type]);

        $notify[] = ['success', 'Verification code sent successfully'];
        return back()->withNotify($notify);
    }

    public function emailVerification(Request $request)
    {
        $request->validate([
            'code' => 'required',
        ]);

        $User = auth()->guard('user')->user();

        if ($User->ver_code == $request->code) {
            $User->ev               = Status::VERIFIED;
            $User->ver_code         = null;
            $User->ver_code_send_at = null;
            $User->save();
            return to_route('User.home');
        }
        throw ValidationException::withMessages(['code' => 'Verification code didn\'t match!']);
    }

    public function mobileVerification(Request $request)
    {
        $request->validate([
            'code' => 'required',
        ]);

        $User = auth()->guard('user')->user();
        if ($User->ver_code == $request->code) {
            $User->sv               = Status::VERIFIED;
            $User->ver_code         = null;
            $User->ver_code_send_at = null;
            $User->save();
            return to_route('User.home');
        }
        throw ValidationException::withMessages(['code' => 'Verification code didn\'t match!']);
    }

    public function g2faVerification(Request $request)
    {
        $User = auth()->guard('user')->user();
        $request->validate([
            'code' => 'required',
        ]);
        $response = verifyG2fa($User, $request->code);
        if ($response) {
            $notify[] = ['success', 'Verification successful'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }
}
