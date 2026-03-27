<?php

namespace App\Http\Controllers\User\Auth;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\Intended;
use App\Models\UserLogin;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    protected $username;
    protected $Username;

    public function __construct()
    {
        parent::__construct();
        $this->username = $this->findUsername();
    }

    public function showLoginForm()
    {
        $pageTitle = "Login";
        Intended::identifyRoute();
        return view('Template::User.auth.login', compact('pageTitle'));
    }

    public function login(Request $request)
    {
        $this->validateLogin($request);

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        if ($this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);

            return $this->sendLockoutResponse($request);
        }

        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        // If the login attempt was unsuccessful we will increment the number of attempts
        // to login and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.
        $this->incrementLoginAttempts($request);

        Intended::reAssignSession();

        return $this->sendFailedLoginResponse($request);
    }

    public function findUsername()
    {
        $login = request()->input('username');

        $fieldType = filter_var($login, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$fieldType => $login]);
        return $fieldType;
    }

    public function username()
    {
        return $this->username;
    }

    protected function validateLogin($request)
    {
        $validator = Validator::make($request->all(), [
            $this->username() => 'required|string',
            'password'        => 'required|string',
        ]);
        if ($validator->fails()) {
            Intended::reAssignSession();
            $validator->validate();
        }
    }

    public function logout()
    {
        $this->guard('user')->logout();
        request()->session()->invalidate();
        $notify[] = ['success', 'You have been logged out.'];
        return to_route('User.login')->withNotify($notify);
    }

    protected function guard()
    {
        return auth()->guard('user');
    }

    public function authenticated(Request $request, $User)
    {
        $User->tv = $User->ts == Status::VERIFIED ? Status::UNVERIFIED : Status::VERIFIED;
        $User->save();

        $ip            = getRealIP();
        $exist         = UserLogin::where('user_ip', $ip)->first();
        $UserLogin = new UserLogin();
        if ($exist) {
            $UserLogin->longitude    = $exist->longitude;
            $UserLogin->latitude     = $exist->latitude;
            $UserLogin->city         = $exist->city;
            $UserLogin->country_code = $exist->country_code;
            $UserLogin->country      = $exist->country;
        } else {
            $info                        = json_decode(json_encode(getIpInfo()), true);
            $UserLogin->longitude    = isset($info['long']) ? implode(',', $info['long']) : '';
            $UserLogin->latitude     = isset($info['lat']) ? implode(',', $info['lat']) : '';
            $UserLogin->city         = isset($info['city']) ? implode(',', $info['city']) : '';
            $UserLogin->country_code = isset($info['code']) ? implode(',', $info['code']) : '';
            $UserLogin->country      = isset($info['country']) ? implode(',', $info['country']) : '';
        }

        $UserAgent              = osBrowser();
        $UserLogin->User_id = $User->id;
        $UserLogin->user_ip     = $ip;

        $UserLogin->browser = isset($UserAgent['browser']) ? $UserAgent['browser'] : '';
        $UserLogin->os      = isset($UserAgent['os_platform']) ? $UserAgent['os_platform'] : '';
        $UserLogin->save();

        $redirection = Intended::getRedirection();

        return $redirection ? $redirection : to_route('User.home');
    }
}
