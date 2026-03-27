<?php

namespace App\Models;

use App\Traits\GlobalStatus;
use Illuminate\Database\Eloquent\Model;

class MenuGroup extends Model
{
    use GlobalStatus;

    protected $guarded = ['id'];

    public function menuItems()
    {
        return $this->hasMany(MenuItem::class, 'menu_group_id')->orderBy('order', 'asc');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
}
