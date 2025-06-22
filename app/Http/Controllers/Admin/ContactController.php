<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\ContactMessage;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;


class ContactController extends Controller
{
    
    public function index()
    {
        $messages = ContactMessage::orderBy('created_at', 'desc')->paginate(10);
        return view('admin.pages.contact.index', compact('messages'));
    }

    public function view(ContactMessage $contact)
    {
        return view('admin.pages.contact.view', compact('contact'));
    }

      public function store(Request $request)
    {
        // Validate the request
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'nullable|email|max:255',
            'phone' => 'nullable|string|max:20',
            'subject' => 'required|string|max:255',
            'message' => 'required|string|min:10'
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        // Create new contact message
        ContactMessage::create($validator->validated());

        return redirect()->back()
            ->with('success', 'Thank you for your message! We will contact you soon.');
    }
}
