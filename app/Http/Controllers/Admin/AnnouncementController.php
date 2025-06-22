<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\Announcement;
use Illuminate\Validation\Rule;


class AnnouncementController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $announcements = Announcement::latest()->paginate(10);
        return view('admin.pages.announcements.index', compact('announcements'));
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.pages.announcements.create');
    }


   // Store new announcement
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'date' => 'required|date',
            'category' => 'required|in:general,prayer,event,fundraising,ramadan',
            'description' => 'required|string',
            'event_time' => 'nullable|string|max:100'
        ]);

        Announcement::create($validated);

        return redirect()->route('admin.announcements.index')
            ->with('success', 'Announcement created successfully!');
    }

    // Show edit form
    public function edit(Announcement $announcement)
    {
        return view('admin.pages.announcements.edit', compact('announcement'));
    }

    // Update announcement
    public function update(Request $request, Announcement $announcement)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'date' => 'required|date',
           'category' => 'required|in:general,prayer,event,fundraising,ramadan',
            'description' => 'required|string',
            'event_time' => 'nullable|string|max:100'
        ]);

        $announcement->update($validated);

        return redirect()->route('admin.announcements.index')
            ->with('success', 'Announcement updated successfully!');
    }

    // Delete announcement
    public function destroy(Announcement $announcement)
    {
        $announcement->delete();
        return back()->with('success', 'Announcement deleted successfully!');

    }

}
