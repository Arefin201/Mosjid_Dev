<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MosqueSetting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MosqueSettingController extends Controller
{
    public function index()
    {
        $settings = MosqueSetting::first();
        return view('admin.pages.setting.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mosqueName' => 'required|string|max:255',
            'contactPhone' => 'required|string|max:20',
            'email' => 'nullable|email|max:255',
            'address' => 'required|string|max:500',
            'footerMessage' => 'required|string',
            'language' => 'nullable|in:en,bn,ar',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $settings = MosqueSetting::firstOrNew();
        $settings->mosque_name = $request->mosqueName;
        $settings->contact_phone = $request->contactPhone;
        $settings->email = $request->email;
        $settings->address = $request->address;
        $settings->footer_message = $request->footerMessage;
        $settings->language = $request->language;
        $settings->save();

        return redirect()->back()->with('success', 'Settings updated successfully!');
    }
}
