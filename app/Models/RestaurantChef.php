<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class RestaurantChef extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(RestaurantChefTranslation::class, 'restaurant_chef_id');
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class, 'restaurant_id');
    }
}
