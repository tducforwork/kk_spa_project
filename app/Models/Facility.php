<?php

namespace App\Models;

use App\Traits\Translatable;
use Illuminate\Database\Eloquent\Model;

class Facility extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(FacilityTranslation::class, 'facility_id');
    }

    public function images()
    {
        return $this->hasMany(FacilityImage::class, 'facility_id')->orderBy('type');
    }

    public function mainImages()
    {
        return $this->hasMany(FacilityImage::class, 'facility_id')->where('type', 1);
    }

    public function introImages()
    {
        return $this->hasMany(FacilityImage::class, 'facility_id')->where('type', 2);
    }
}
