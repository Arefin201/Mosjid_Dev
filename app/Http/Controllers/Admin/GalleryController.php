<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\GalleryItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class GalleryController extends Controller
{
    public function index()
    {
        $galleryItems = GalleryItem::all();
        return view('admin.pages.gallery.index', compact('galleryItems'));
    }

    public function create()
    {
        return view('admin.pages.gallery.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'type' => 'required|',
            'event_date' => 'nullable|date',
            'image' => 'required_without:image_url|image|mimes:jpeg,png,jpg,gif|max:4096',
            'is_featured' => 'boolean'
        ]);

        $imagePath = null;
        
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('gallery', 'public');
        } elseif ($request->filled('image_url')) {
            $imagePath = $request->input('image_url');
        }

        GalleryItem::create([
            'title' => $request->title,
            'description' => $request->description,
            'type' => $request->type,
            'event_date' => $request->event_date,
            'image_path' => $imagePath,
            'is_featured' => $request->boolean('is_featured')
        ]);

        return redirect()->route('admin.gallery.index')->with('success', 'Gallery item added successfully!');
    }

    public function edit(GalleryItem $galleryItem)
    {
        return view('admin.pages.gallery.edit', compact('galleryItem'));
    }

    public function update(Request $request, GalleryItem $galleryItem)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'type' => 'required|in:prayer,event,other',
            'event_date' => 'nullable|date',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'image_url' => 'nullable|url',
            'is_featured' => 'boolean'
        ]);

        $data = $request->only(['title', 'description', 'type', 'event_date', 'is_featured']);

        if ($request->hasFile('image')) {
            // Delete old image if it's not a URL
            if ($galleryItem->image_path && !filter_var($galleryItem->image_path, FILTER_VALIDATE_URL)) {
                Storage::disk('public')->delete($galleryItem->image_path);
            }
            $data['image_path'] = $request->file('image')->store('gallery', 'public');
        } elseif ($request->filled('image_url')) {
            // Delete old image if it's not a URL
            if ($galleryItem->image_path && !filter_var($galleryItem->image_path, FILTER_VALIDATE_URL)) {
                Storage::disk('public')->delete($galleryItem->image_path);
            }
            $data['image_path'] = $request->input('image_url');
        }

        $galleryItem->update($data);

        return redirect()->route('admin.gallery.index')->with('success', 'Gallery item updated successfully!');
    }

    public function destroy(GalleryItem $galleryItem)
    {
        // Delete image if it's not a URL
        if ($galleryItem->image_path && !filter_var($galleryItem->image_path, FILTER_VALIDATE_URL)) {
            Storage::disk('public')->delete($galleryItem->image_path);
        }
        
        $galleryItem->delete();
        return redirect()->back()->with('success', 'Gallery item deleted successfully!');
    }
}