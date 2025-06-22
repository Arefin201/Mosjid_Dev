<?php

namespace App\Http\Controllers\Admin;

use App\Models\Donor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\Rule;

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
            'payment_method' => ['required', Rule::in(['cash', 'bank', 'mobile', 'card'])],
            'status' => ['nullable', Rule::in(['active', 'inactive'])],
            'start_date' => 'nullable|date'
        ]);

        // Set default status if not provided
        $validated['status'] = $validated['status'] ?? 'active';

        Donor::create($validated);

        return response()->json(['success' => true]);
    }

    // Show donor edit form
    public function edit(Donor $donor)
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
        'payment_method' => ['required', Rule::in(['cash', 'bank', 'mobile', 'card'])],
        'status' => ['required', Rule::in(['active', 'inactive'])],
        'last_paid' => 'nullable|date',
        'start_date' => 'nullable|date'
    ]);

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
