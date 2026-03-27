<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class Room extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    protected $casts = [
        'amenities' => 'array'
    ];

    public function translations()
    {
        return $this->hasMany(RoomTranslation::class, 'room_id');
    }

    public function category()
    {
        return $this->belongsTo(CategoryRoom::class, 'category_id');
    }

    public function images()
    {
        return $this->hasMany(RoomImage::class, 'room_id')->orderBy('type');
    }

    public function mainImages()
    {
        return $this->hasMany(RoomImage::class, 'room_id')->where('type', 1);
    }

    public function introImages()
    {
        return $this->hasMany(RoomImage::class, 'room_id')->where('type', 2);
    }
    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
