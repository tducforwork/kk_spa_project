<?php

namespace App\Http\Controllers\User\Auth;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\Intended;
use App\Models\AdminNotification;
use App\Models\User;
use App\Models\UserLogin;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class RegisterController extends Controller {
    use RegistersUsers;

    public function __construct() {
        parent::__construct();
    }

    public function showRegistrationForm() {
        $pageTitle = "Register";
        Intended::identifyRoute();
        return view('Template::User.auth.register', compact('pageTitle'));
    }

    protected function validator(array $data) {
        $passwordValidation = Password::min(6);
        if (gs('secure_password')) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $agree = 'nullable';
        if (gs('agree')) {
            $agree = 'required';
        }

        $validate = Validator::make($data, [
            'firstname' => 'required',
            'lastname'  => 'required',
            'email'     => 'required|string|email|unique:users',
            'password'  => ['required', 'confirmed', $passwordValidation],
            'captcha'   => 'sometimes|required',
            'agree'     => $agree,
        ], [
            'firstname.required' => 'The first name field is required',
            'lastname.required'  => 'The last name field is required',
        ]);

        return $validate;
    }

    public function register(Request $request) {
        if (!gs('registration')) {
            $notify[] = ['error', 'Registration not allowed'];
            return back()->withNotify($notify);
        }

        $this->validator($request->all())->validate();

        $request->session()->regenerateToken();

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        event(new Registered($User = $this->create($request->all())));

        auth()->guard('user')->login($User);

        return $this->registered($request, $User)
        ?: redirect($this->redirectPath());
    }

    protected function create(array $data) {
        //User Create
        $User            = new User();
        $User->email     = strtolower($data['email']);
        $User->firstname = $data['firstname'];
        $User->lastname  = $data['lastname'];
        $User->password  = Hash::make($data['password']);

        $User->ev                  = gs('ev') ? Status::NO : Status::YES;
        $User->sv                  = gs('sv') ? Status::NO : Status::YES;
        $User->ts                  = Status::DISABLE;
        $User->tv                  = Status::ENABLE;
        $User->free_job_post_limit = gs('free_job_post_limit');
        $User->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = $User->id;
        $adminNotification->title     = 'New User registered';
        $adminNotification->click_url = urlPath('admin.Users.detail', $User->id);
        $adminNotification->save();

        //Login Log Create
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

        $userAgent              = osBrowser();
        $UserLogin->user_id = $User->id;
        $UserLogin->user_ip = $ip;
        $UserLogin->browser = isset($userAgent['browser']) ? $userAgent['browser'] : '';
        $UserLogin->os      = isset($userAgent['os_platform']) ? $userAgent['os_platform'] : '';
        $UserLogin->save();

        return $User;
    }

    public function checkUser(Request $request) {
        $exist['data'] = false;
        $exist['type'] = null;
        if ($request->email) {
            $exist['data']  = User::where('email', $request->email)->exists();
            $exist['type']  = 'email';
            $exist['field'] = 'Email';
        }
        if ($request->mobile) {
            $exist['data']  = User::where('mobile', $request->mobile)->where('dial_code', $request->mobile_code)->exists();
            $exist['type']  = 'mobile';
            $exist['field'] = 'Mobile';
        }
        if ($request->username) {
            $exist['data']  = User::where('username', $request->username)->exists();
            $exist['type']  = 'username';
            $exist['field'] = 'Username';
        }
        return response($exist);
    }

    public function registered() {
        return to_route('User.home');
    }
}
