<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Announcement extends Model
{
    use HasFactory;

    protected $table = 'announcements_tables';

    protected $fillable = [
        'title',
        'date',
        'category',
        'description',
        'event_time'
    ];

    protected $casts = [
        'date' => 'date'
    ];

    
}