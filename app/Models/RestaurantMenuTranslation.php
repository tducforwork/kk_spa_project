<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RestaurantMenuTranslation extends Model
{
    protected $guarded = ['id'];

    public function restaurantMenu()
    {
        return $this->belongsTo(RestaurantMenu::class, 'restaurant_menu_id');
    }
}
