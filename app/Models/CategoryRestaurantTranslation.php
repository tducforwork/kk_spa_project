<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CategoryRestaurantTranslation extends Model
{
    protected $guarded = ['id'];

    public function categoryRestaurant()
    {
        return $this->belongsTo(CategoryRestaurant::class, 'category_restaurant_id');
    }
}
