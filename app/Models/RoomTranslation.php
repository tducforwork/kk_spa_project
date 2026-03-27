<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoomTranslation extends Model
{
    protected $guarded = ['id'];
    protected $casts = [
        'additional_info' => 'array'
    ];

    public function room()
    {
        return $this->belongsTo(Room::class, 'room_id');
    }
}
