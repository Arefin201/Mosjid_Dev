<?php

// app/Http/Controllers/Admin/AboutMosqueController.php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AboutMosque;
use Illuminate\Support\Facades\Auth;

class AboutMosqueController extends Controller
{
    public function edit()
    {
        $about = AboutMosque::firstOrCreate([]);
        return view('admin.pages.about.index', compact('about'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'mosque_name' => 'required|string|max:255',
            'history_paragraph1' => 'required|string',
            'history_paragraph2' => 'nullable|string|max:200',
        ]);

        $about = AboutMosque::first();
        if (!$about) {
            $about = new AboutMosque();
        }

        $about->update($request->all());

        return redirect()->back()->with('success', 'About section updated successfully!');
    }
}
