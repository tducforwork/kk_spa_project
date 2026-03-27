<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CategoryRoomTranslation extends Model
{
    protected $guarded = ['id'];

    public function categoryRoom()
    {
        return $this->belongsTo(CategoryRoom::class, 'category_room_id');
    }
}
