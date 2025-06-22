<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Leader;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;


class LeadershipController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $leaders = Leader::orderBy('order')->get();
        return view('admin.pages.leadership.index', compact('leaders'));

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.pages.leadership.create');

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Custom validation rules
        $request->validate([
            'name' => [
                'required',
                'string',
                'max:255',
                'min:2',
                'regex:/^[a-zA-Z\s\-\.\']+$/' // Only letters, spaces, hyphens, dots, apostrophes
            ],
            'designation' => [
                'required',
                'string',
                'max:255',
                'min:2'
            ],
            'email' => [
                'nullable',
                'email:rfc,dns',
                'max:255',
                'unique:leaders,email'
            ],
            'phone' => [
                'nullable',
                'string',
                'max:20',
                'regex:/^[\+]?[0-9\s\-\(\)]{7,20}$/' // International phone format
            ],
            'photo' => [
                'nullable',
                'image',
                'mimes:jpeg,png,jpg,gif,webp',
                'max:2048', // 2MB max
                'dimensions:min_width=100,min_height=100,max_width=2000,max_height=2000'
            ],
            'photo_url' => [
                'nullable',
                'url',
                'max:500',
                'regex:/\.(jpeg|jpg|png|gif|webp)$/i' // Must end with image extension
            ],
            'bio' => [
                'nullable',
                'string',
                'max:1000',
                'min:10'
            ]
        ], [
            // Custom error messages
            'name.required' => 'Name is required.',
            'name.regex' => 'Name can only contain letters, spaces, hyphens, dots, and apostrophes.',
            'name.min' => 'Name must be at least 2 characters long.',
            'designation.required' => 'Designation is required.',
            'designation.min' => 'Designation must be at least 2 characters long.',
            'email.email' => 'Please provide a valid email address.',
            'email.unique' => 'This email is already registered.',
            'phone.regex' => 'Please provide a valid phone number.',
            'photo.image' => 'Photo must be an image file.',
            'photo.mimes' => 'Photo must be a JPEG, PNG, JPG, GIF, or WebP file.',
            'photo.max' => 'Photo size cannot exceed 2MB.',
            'photo.dimensions' => 'Photo dimensions must be between 100x100 and 2000x2000 pixels.',
            'photo_url.url' => 'Photo URL must be a valid URL.',
            'photo_url.regex' => 'Photo URL must link to an image file (jpeg, jpg, png, gif, webp).',
            'bio.min' => 'Biography must be at least 10 characters long.',
            'bio.max' => 'Biography cannot exceed 1000 characters.'
        ]);

        // Additional custom validation
        if ($request->hasFile('photo') && $request->filled('photo_url')) {
            return back()->withErrors([
                'photo' => 'Please provide either a photo file or a photo URL, not both.'
            ])->withInput();
        }

        if (!$request->hasFile('photo') && !$request->filled('photo_url')) {
            return back()->withErrors([
                'photo' => 'Please provide either a photo file or a photo URL.'
            ])->withInput();
        }

        // Validate photo URL accessibility (optional - can be heavy on performance)
        if ($request->filled('photo_url')) {
            $photoUrl = $request->input('photo_url');
            $headers = @get_headers($photoUrl);
            if (!$headers || strpos($headers[0], '200') === false) {
                return back()->withErrors([
                    'photo_url' => 'The provided photo URL is not accessible.'
                ])->withInput();
            }
        }

        try {
            $photoPath = null;

            if ($request->hasFile('photo')) {
                // Generate unique filename
                $file = $request->file('photo');
                $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
                $photoPath = $file->storeAs('leaders', $filename, 'public');
            } elseif ($request->filled('photo_url')) {
                $photoPath = $request->input('photo_url');
            }

            Leader::create([
                'name' => trim($request->name),
                'designation' => trim($request->designation),
                'email' => $request->email ? trim(strtolower($request->email)) : null,
                'phone' => $request->phone ? trim($request->phone) : null,
                'photo' => $photoPath,
                'bio' => $request->bio ? trim($request->bio) : null,
                'order' => Leader::max('order') + 1,
            ]);

            return redirect()->route('admin.leadership')
                ->with('success', 'Leader added successfully!');

        } catch (\Exception $e) {
            // Log the error
            \Log::error('Leader creation failed: ' . $e->getMessage());

            return back()->withErrors([
                'general' => 'An error occurred while saving the leader. Please try again.'
            ])->withInput();
        }
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
    public function edit(Leader $leader)
    {
        return view('admin.pages.leadership.edit', compact('leader'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Leader $leader)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'designation' => 'required|string|max:255',
            'email' => 'nullable|email',
            'phone' => 'nullable|string',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'photo_url' => 'nullable|url',
            'bio' => 'nullable|string',
        ]);

        $data = $request->only(['name', 'designation', 'email', 'phone', 'bio']);

        if ($request->hasFile('photo')) {
            if ($leader->photo && !filter_var($leader->photo, FILTER_VALIDATE_URL)) {
                Storage::disk('public')->delete($leader->photo);
            }
            $data['photo'] = $request->file('photo')->store('leaders', 'public');
        } elseif ($request->filled('photo_url')) {
            $data['photo'] = $request->input('photo_url');
        }

        $leader->update($data);

        return redirect()->route('admin.leadership')->with('success', 'Leader updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Leader $leader)
    {
        if ($leader->photo && !filter_var($leader->photo, FILTER_VALIDATE_URL)) {
            Storage::disk('public')->delete($leader->photo);
        }
        $leader->delete();
        return redirect()->back()->with('success', 'Leader deleted successfully!');
    }

    public function reorder(Request $request)
    {
        $request->validate([
            'order' => 'required|array',
        ]);

        foreach ($request->order as $index => $id) {
            Leader::where('id', $id)->update(['order' => $index + 1]);
        }

        return response()->json(['success' => true]);
    }
}