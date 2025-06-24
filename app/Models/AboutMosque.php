<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AboutMosque extends Model
{
   protected $fillable = [
        'mosque_name',
        'history_paragraph1',
        'history_paragraph2',
    ];
}
