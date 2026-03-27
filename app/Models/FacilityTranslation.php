<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FacilityTranslation extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'additional_info' => 'array'
    ];

    public function facility()
    {
        return $this->belongsTo(Facility::class, 'facility_id');
    }
}
