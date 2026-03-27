<?php

namespace App\Models;

use App\Traits\Translatable;
use Illuminate\Database\Eloquent\Model;

class MiceEvent extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(MiceEventTranslation::class, 'mice_event_id');
    }

    public function images()
    {
        return $this->hasMany(MiceEventImage::class, 'mice_event_id')->where('type', 1);
    }

    public function introImages()
    {
        return $this->hasMany(MiceEventImage::class, 'mice_event_id')->where('type', 2);
    }
}
