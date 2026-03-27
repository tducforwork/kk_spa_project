<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class Post extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(PostTranslation::class, 'post_id');
    }

    public function category()
    {
        return $this->belongsTo(CategoryPost::class, 'category_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }

    public function images()
    {
        return $this->hasMany(PostImage::class, 'post_id');
    }
}
