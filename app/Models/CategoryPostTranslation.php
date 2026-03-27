<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CategoryPostTranslation extends Model
{
    protected $guarded = ['id'];

    public function categoryPost()
    {
        return $this->belongsTo(CategoryPost::class, 'category_post_id');
    }
}
