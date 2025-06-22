<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PrayerTime;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class PrayerTimeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
     public function edit()
    {
        // Get the latest prayer times or create new if none exist
        $prayerTime = PrayerTime::firstOrNew();
        
        return view('admin.pages.prayer-times.prayer-times', compact('prayerTime'));
    }


    /**
     * Update the specified resource in storage.
     */
    
    public function update(Request $request)
    {
        $validated = $request->validate([
            'fajr' => 'required|date_format:H:i',
            'dhuhr' => 'required|date_format:H:i',
            'asr' => 'required|date_format:H:i',
            'maghrib' => 'required|date_format:H:i',
            'isha' => 'required|date_format:H:i',
            'jummah' => 'required|date_format:H:i',
        ], [
            'fajr.required' => 'Fajr time is required',
            'fajr.date_format' => 'Fajr time must be in valid format',
            'dhuhr.required' => 'Dhuhr time is required',
            'dhuhr.date_format' => 'Dhuhr time must be in valid format',
            'asr.required' => 'Asr time is required',
            'asr.date_format' => 'Asr time must be in valid format',
            'maghrib.required' => 'Maghrib time is required',
            'maghrib.date_format' => 'Maghrib time must be in valid format',
            'isha.required' => 'Isha time is required',
            'isha.date_format' => 'Isha time must be in valid format',
            'jummah.required' => 'Jummah time is required',
            'jummah.date_format' => 'Jummah time must be in valid format',
        ]);

        // Append seconds to match database format (TIME type expects HH:MM:SS)
        $data = array_map(function ($time) {
            return $time . ':00';
        }, $validated);

        // Update or create the prayer time record
        PrayerTime::updateOrCreate(['id' => 1], $data);

        return redirect()->back()->with('success', 'Prayer times updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
