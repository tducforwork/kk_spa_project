<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FacilityImage extends Model
{
    protected $guarded = ['id'];

    public function facility()
    {
        return $this->belongsTo(Facility::class, 'facility_id');
    }
}
