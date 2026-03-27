<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MiceEventTranslation extends Model
{
    protected $guarded = ['id'];
    protected $casts = [
        'additional_info' => 'array'
    ];

    public function MiceEvent()
    {
        return $this->belongsTo(MiceEvent::class, 'mice_event_id');
    }
}
