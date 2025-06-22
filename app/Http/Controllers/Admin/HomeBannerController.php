<?php


namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HomeBanner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class HomeBannerController extends Controller
{
    public function edit()
    {
        $banner = HomeBanner::firstOrFail();
        return view('admin.pages.hero.index', compact('banner'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'subtitle' => 'required|string',
            'button_text' => 'required|string|max:50',
            'button_link' => 'required|string|max:255',
            'banner_image' => 'nullable|image|mimes:jpeg,png,jpg|max:4096',
        ]);

        $banner = HomeBanner::firstOrFail();
        $data = $request->only(['title', 'subtitle', 'button_text', 'button_link']);

        // Handle image upload
        if ($request->hasFile('banner_image')) {
            // Delete old image
            if ($banner->banner_image) {
                Storage::delete('public/'.$banner->banner_image);
            }
            
            // Store new image
            $path = $request->file('banner_image')->store('banners', 'public');
            $data['banner_image'] = $path;
        }

        $banner->update($data);

        return redirect()->back()->with('success', 'Banner updated successfully!');
    }
}
