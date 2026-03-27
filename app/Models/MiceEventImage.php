<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MiceEventImage extends Model
{
    protected $guarded = ['id'];

    public function MiceEvent()
    {
        return $this->belongsTo(MiceEvent::class, 'mice_event_id');
    }
}
