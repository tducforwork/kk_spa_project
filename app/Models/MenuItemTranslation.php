<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuItemTranslation extends Model
{
    protected $guarded = ['id'];

    public function menu_item()
    {
        return $this->belongsTo(MenuItem::class, 'menu_item_id');
    }
}
