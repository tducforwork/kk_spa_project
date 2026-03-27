<?php

namespace App\Models;

use App\Constants\Status;
use App\Traits\GlobalStatus;
use App\Traits\UserNotify;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use UserNotify, GlobalStatus;

    protected $casts = [
        'social_media' => 'object',
        'ver_code_send_at' => 'datetime'
    ];

    public function deviceTokens()
    {
        return $this->hasMany(DeviceToken::class);
    }

    public function loginLogs()
    {
        return $this->hasMany(UserLogin::class);
    }

    public function fullname(): Attribute
    {
        return new Attribute(
            get: fn() => $this->firstname . ' ' . $this->lastname,
        );
    }

    public function mobileNumber(): Attribute
    {
        return new Attribute(
            get: fn() => $this->dial_code . $this->mobile,
        );
    }

    public function featuredBadge(): Attribute
    {
        return new Attribute(function () {
            $html = '';
            if ($this->is_featured == Status::YES) {
                $html = '<span class="badge badge--success">' . trans('Yes') . '</span>';
            } elseif ($this->is_featured == Status::NO) {
                $html = '<span class="badge badge--dark">' . trans('No') . '</span>';
            }
            return $html;
        });
    }

    // SCOPES
    public function scopeActive($query)
    {
        return $query->where('status', Status::USER_ACTIVE)->where('ev', Status::VERIFIED)->where('sv', Status::VERIFIED);
    }

    public function scopeBanned($query)
    {
        return $query->where('status', Status::USER_BAN);
    }

    public function scopeEmailUnverified($query)
    {
        return $query->where('ev', Status::NO);
    }

    public function scopeMobileUnverified($query)
    {
        return $query->where('sv', Status::NO);
    }

    public function scopeEmailVerified($query)
    {
        return $query->where('ev', Status::VERIFIED);
    }

    public function scopeMobileVerified($query)
    {
        return $query->where('sv', Status::VERIFIED);
    }

    public function scopeFeaturedUser($query)
    {
        return $query->where('is_featured', Status::YES);
    }
}
