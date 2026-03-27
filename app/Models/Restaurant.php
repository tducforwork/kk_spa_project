<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class Restaurant extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(RestaurantTranslation::class, 'restaurant_id');
    }

    public function category()
    {
        return $this->belongsTo(CategoryRestaurant::class, 'category_id');
    }

    public function images()
    {
        return $this->hasMany(RestaurantImage::class, 'restaurant_id')->orderBy('type');
    }

    public function mainImages()
    {
        return $this->hasMany(RestaurantImage::class, 'restaurant_id')->where('type', 1);
    }

    public function introImages()
    {
        return $this->hasMany(RestaurantImage::class, 'restaurant_id')->where('type', 2);
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
