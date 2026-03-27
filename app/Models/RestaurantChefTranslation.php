<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RestaurantChefTranslation extends Model
{
    protected $guarded = ['id'];

    public function restaurantChef()
    {
        return $this->belongsTo(RestaurantChef::class, 'restaurant_chef_id');
    }
}
