<?php

namespace App\Http\Controllers\Admin;

use App\Models\Donor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;


class DonorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Donor::query();

        // Search functionality
        if ($request->has('search') && !empty($request->search)) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%$search%")
                    ->orWhere('phone', 'like', "%$search%")
                    ->orWhere('email', 'like', "%$search%");
            });
        }

        // Status filter
        if ($request->has('status') && in_array($request->status, ['active', 'inactive'])) {
            $query->where('status', $request->status);
        }

        // Order and paginate
        $donors = $query->orderBy('amount', 'desc')->paginate(10);

        return view('admin.pages.donors.index', compact('donors'));
    }


    // Show donor creation form
    public function create()
    {
        $paymentMethods = ['cash', 'bank', 'mobile', 'card'];
        $statusOptions = ['active', 'inactive'];
        return view('admin.pages.donors.create', compact('paymentMethods', 'statusOptions'));
    }

    // Store new donor
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'email' => 'nullable|email|max:255',
            'amount' => 'required|numeric|between:0.01,99999999.99',
            'person_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'payment_method' => ['required', Rule::in(['cash', 'bank', 'mobile', 'card'])],
            'status' => ['nullable', Rule::in(['active', 'inactive'])],
            'start_date' => 'nullable|date'
        ]);

        // Handle image upload
        if ($request->hasFile('person_image')) {
            $image = $request->file('person_image');
            $filename = time() . '.' . $image->getClientOriginalExtension();

            // Create directory if not exists
            $path = public_path('uploads/donors');
            File::ensureDirectoryExists($path);

            // Move image to public directory
            $image->move($path, $filename);
            $validated['person_image'] = 'uploads/donors/' . $filename;
        }

        // Set default status if not provided
        $validated['status'] = $validated['status'] ?? 'active';
        Donor::create($validated);

        return response()->json(['success' => true]);
    }

    // Show donor edit form
    public function edit(Request $request, Donor $donor)
    {
        $paymentMethods = ['cash', 'bank', 'mobile', 'card'];
        $statusOptions = ['active', 'inactive'];
        return view('admin.pages.donors.edit', compact('donor', 'paymentMethods', 'statusOptions'));
    }

    // Update donor record
    public function update(Request $request, Donor $donor)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'email' => 'nullable|email|max:255',
            'amount' => 'required|numeric|between:0.01,99999999.99',
            'person_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'payment_method' => ['required', Rule::in(['cash', 'bank', 'mobile', 'card'])],
            'status' => ['required', Rule::in(['active', 'inactive'])],
            'last_paid' => 'nullable|date',
            'start_date' => 'nullable|date'
        ]);



        // Handle image update
        if ($request->hasFile('person_image')) {
            // Delete old image if exists
            if ($donor->person_image && file_exists(public_path($donor->person_image))) {
                unlink(public_path($donor->person_image));
            }

            $image = $request->file('person_image');
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $path = public_path('uploads/donors');
            $image->move($path, $filename);
            $validated['person_image'] = 'uploads/donors/' . $filename;
        } else {
            // Keep existing image if not updating
            unset($validated['person_image']);
        }


        $donor->update($validated);

        return redirect()->route('admin.donors.index')->with('success', 'Donor updated successfully!');
    }

    // Delete donor
    public function destroy(Donor $donor)
    {
        $donor->delete();
        return redirect()->route('admin.donors.index')->with('success', 'Donor deleted successfully!');
    }

}
