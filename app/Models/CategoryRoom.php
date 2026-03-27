<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class CategoryRoom extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(CategoryRoomTranslation::class, 'category_room_id');
    }

    public function images()
    {
        return $this->hasMany(RoomImage::class, 'room_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }

    public function rooms()
    {
        return $this->hasMany(Room::class, 'category_id');
    }

    public function parent()
    {
        return $this->belongsTo(CategoryRoom::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(CategoryRoom::class, 'parent_id');
    }
}
