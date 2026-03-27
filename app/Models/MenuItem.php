<?php

namespace App\Models;

use App\Traits\GlobalStatus;
use App\Traits\Translatable;
use Illuminate\Database\Eloquent\Model;

class MenuItem extends Model
{
    use GlobalStatus, Translatable;

    protected $guarded = ['id'];

    public function group()
    {
        return $this->belongsTo(MenuGroup::class, 'menu_group_id');
    }

    public function parent()
    {
        return $this->belongsTo(MenuItem::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(MenuItem::class, 'parent_id')->orderBy('order', 'asc');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function translations()
    {
        return $this->hasMany(MenuItemTranslation::class, 'menu_item_id');
    }
}
