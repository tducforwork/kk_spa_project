<?php

namespace App\Http\Controllers\User;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\GoogleAuthenticator;
use App\Models\DeviceToken;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class UserController extends Controller {
    public function home() {
        $pageTitle = "User Dashboard";
        $user      = authUser('user');
        return view('Template::user.dashboard', compact('pageTitle', 'user'));
    }


    public function show2faForm() {
        $general   = gs();
        $ga        = new GoogleAuthenticator();
        $User  = authUser('user');
        $secret    = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($User->username . '@' . $general->site_name, $secret);
        $pageTitle = '2FA Setting';
        return view('Template::User.twofactor', compact('pageTitle', 'secret', 'qrCodeUrl', 'user'));
    }

    public function create2fa(Request $request) {
        $request->validate([
            'key'  => 'required',
            'code' => 'required',
        ]);

        $user     = authUser('user');
        $response = verifyG2fa($user, $request->code, $request->key);
        if ($response) {
            $user->tsc = $request->key;
            $user->ts  = Status::ENABLE;
            $user->save();
            $notify[] = ['success', 'Google authenticator activated successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'Wrong verification code'];
            return back()->withNotify($notify);
        }
    }

    public function disable2fa(Request $request) {
        $request->validate([
            'code' => 'required',
        ]);

        $user     = authUser('user');
        $response = verifyG2fa($user, $request->code);

        if ($response) {
            $user->tsc = null;
            $user->ts  = Status::DISABLE;
            $user->save();
            $notify[] = ['success', 'Two factor authenticator deactivated successfully'];
        } else {
            $notify[] = ['error', 'Wrong verification code'];
        }
        return back()->withNotify($notify);
    }

    public function userData() {
        $User = authUser('user');
        if ($User->profile_complete == Status::YES) {
            return to_route('User.home');
        }
        $pageTitle  = 'User Data';
        $info       = json_decode(json_encode(getIpInfo()), true);
        $mobileCode = isset($info['code']) ? implode(',', $info['code']) : '';
        $countries  = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        return view('Template::User.User_data', compact('pageTitle', 'user', 'countries', 'mobileCode', 'info'));
    }
    public function userDataSubmit(Request $request) {
        $User = authUser('user');
        if ($User->profile_complete == Status::YES) {
            return to_route('user.home');
        }

        $countryData  = (array) json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $countryCodes = implode(',', array_keys($countryData));
        $mobileCodes  = implode(',', array_column($countryData, 'dial_code'));
        $countries    = implode(',', array_column($countryData, 'country'));

        $request->validate([
            'country_code' => 'required|in:' . $countryCodes,
            'country'      => 'required|in:' . $countries,
            'mobile_code'  => 'required|in:' . $mobileCodes,
            'username'     => 'required|unique:users|min:6',
            'company_name' => 'required',
            'slug'         => 'required|string|max:255',
            'mobile'       => ['required', 'regex:/^([0-9]*)$/', Rule::unique('users')->where('dial_code', $request->mobile_code)],
        ]);

        if (preg_match("/[^a-z0-9_]/", trim($request->username))) {
            $notify[] = ['info', 'Username can contain only small letters, numbers and underscore.'];
            $notify[] = ['error', 'No special character, space or capital letters in username.'];
            return back()->withNotify($notify)->withInput($request->all());
        }

        $User->country_code     = $request->country_code;
        $User->mobile           = $request->mobile;
        $User->username         = $request->username;
        $User->address          = $request->address;
        $User->city             = $request->city;
        $User->state            = $request->state;
        $User->zip              = $request->zip;
        $User->country_name     = @$request->country;
        $User->dial_code        = $request->mobile_code;
        $User->profile_complete = Status::YES;
        $User->company_name     = $request->company_name;
        $User->slug             = $request->slug;
        $User->save();

        return to_route('User.home');
    }


    public function addDeviceToken(Request $request) {
        $validator = Validator::make($request->all(), [
            'token' => 'required',
        ]);

        if ($validator->fails()) {
            return ['success' => false, 'errors' => $validator->errors()->all()];
        }

        $deviceToken = DeviceToken::where('User_id', auth()->guard('user')->id())->where('token', $request->token)->first();

        if ($deviceToken) {
            return ['success' => true, 'message' => 'Already exists'];
        }

        $deviceToken              = new DeviceToken();
        $deviceToken->User_id = authUser('user')->id;
        $deviceToken->token       = $request->token;
        $deviceToken->is_app      = Status::NO;
        $deviceToken->save();

        return ['success' => true, 'message' => 'Token saved successfully'];
    }

}
