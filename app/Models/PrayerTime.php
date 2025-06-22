<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrayerTime extends Model
{
    use HasFactory;

    protected $table = 'prayer_times_tables';

    protected $fillable = [
        'fajr',
        'dhuhr',
        'asr',
        'maghrib',
        'isha',
        'jummah'
    ];

    // Accessors for raw (HH:MM) time
    public function getRawFajrAttribute()
    {
        return $this->getRawOriginal('fajr') ? substr($this->getRawOriginal('fajr'), 0, 5) : '05:15';
    }

    public function getRawDhuhrAttribute()
    {
        return $this->getRawOriginal('dhuhr') ? substr($this->getRawOriginal('dhuhr'), 0, 5) : '12:30';
    }

    public function getRawAsrAttribute()
    {
        return $this->getRawOriginal('asr') ? substr($this->getRawOriginal('asr'), 0, 5) : '16:45';
    }

    public function getRawMaghribAttribute()
    {
        return $this->getRawOriginal('maghrib') ? substr($this->getRawOriginal('maghrib'), 0, 5) : '18:20';
    }

    public function getRawIshaAttribute()
    {
        return $this->getRawOriginal('isha') ? substr($this->getRawOriginal('isha'), 0, 5) : '19:45';
    }

    public function getRawJummahAttribute()
    {
        return $this->getRawOriginal('jummah') ? substr($this->getRawOriginal('jummah'), 0, 5) : '13:00';
    }

    // Optional: formatted for display (12-hour)
    public function getFajrAttribute($value)
    {
        return date('g:i A', strtotime($value));
    }

    public function getDhuhrAttribute($value)
    {
        return date('g:i A', strtotime($value));
    }

    public function getAsrAttribute($value)
    {
        return date('g:i A', strtotime($value));
    }

    public function getMaghribAttribute($value)
    {
        return date('g:i A', strtotime($value));
    }

    public function getIshaAttribute($value)
    {
        return date('g:i A', strtotime($value));
    }

    public function getJummahAttribute($value)
    {
        return date('g:i A', strtotime($value));
    }
}
