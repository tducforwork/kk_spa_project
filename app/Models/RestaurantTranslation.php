<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RestaurantTranslation extends Model
{
    protected $guarded = ['id'];

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class, 'restaurant_id');
    }
}
