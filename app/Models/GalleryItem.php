<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GalleryItem extends Model
{
    protected $table = 'gallery_items';

    protected $fillable = [
        'title',
        'description',
        'type',
        'event_date',
        'image_path',
        'is_featured'
    ];

    protected $casts = [
        'event_date' => 'date',
        'is_featured' => 'boolean'
    ];


}
