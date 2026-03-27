<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class CategoryRestaurant extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(CategoryRestaurantTranslation::class, 'category_restaurant_id');
    }

    public function chefs()
    {
        return $this->hasMany(RestaurantChef::class, 'restaurant_id');
    }

    public function restaurants()
    {
        return $this->hasMany(Restaurant::class, 'category_id');
    }

    public function parent()
    {
        return $this->belongsTo(CategoryRestaurant::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(CategoryRestaurant::class, 'parent_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
