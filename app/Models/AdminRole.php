<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminRole extends Model
{
    protected $guarded = ['id'];

    public function permissions()
    {
        return $this->hasMany(AdminPermission::class, 'role_id');
    }
}
