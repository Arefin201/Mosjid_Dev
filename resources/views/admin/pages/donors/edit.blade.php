@extends('admin.layouts.app')

@section('title', 'Mosque - Edit Donor')
@section('page-title', 'Edit Donor')

@section('content')
<div id="donorModal" class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center p-4">
    <div class="bg-white rounded-lg max-w-md w-full max-h-[90vh] overflow-y-auto">
        <div class="p-6">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-lg font-semibold">Edit Donor</h3>
                <a href="{{ route('admin.donors.index') }}" id="closeDonorModal" class="text-gray-400 hover:text-gray-600">
                    <i class="fas fa-times"></i>
                </a>
            </div>

            <form id="donorEditForm" method="POST" action="{{ route('admin.donors.update', $donor->id) }}" class="space-y-4">
                @csrf
                @method('PUT')
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Full Name *</label>
                    <input type="text" name="name" required value="{{ old('name', $donor->name) }}"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    @error('name')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number *</label>
                    <input type="tel" name="phone" required value="{{ old('phone', $donor->phone) }}"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    @error('phone')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                    <input type="email" name="email" value="{{ old('email', $donor->email) }}"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    @error('email')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Monthly Amount (৳) *</label>
                    <input type="number" name="amount" required min="0.01" step="0.01" value="{{ old('amount', $donor->amount) }}"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    @error('amount')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Payment Method *</label>
                    <select name="payment_method" required
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <option value="">Select Payment Method</option>
                        <option value="cash" {{ old('payment_method', $donor->payment_method) == 'cash' ? 'selected' : '' }}>Cash</option>
                        <option value="bank" {{ old('payment_method', $donor->payment_method) == 'bank' ? 'selected' : '' }}>Bank Transfer</option>
                        <option value="mobile" {{ old('payment_method', $donor->payment_method) == 'mobile' ? 'selected' : '' }}>Mobile Banking</option>
                        <option value="card" {{ old('payment_method', $donor->payment_method) == 'card' ? 'selected' : '' }}>Card</option>
                    </select>
                    @error('payment_method')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Status *</label>
                    <select name="status"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <option value="active" {{ old('status', $donor->status) == 'active' ? 'selected' : '' }}>Active</option>
                        <option value="inactive" {{ old('status', $donor->status) == 'inactive' ? 'selected' : '' }}>Inactive</option>
                    </select>
                    @error('status')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Last Paid Date</label>
                    <input type="date" name="last_paid" value="{{ old('last_paid', $donor->last_paid ? $donor->last_paid->format('Y-m-d') : '') }}"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    @error('last_paid')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
                    <input type="date" name="start_date" value="{{ old('start_date', $donor->start_date ? $donor->start_date->format('Y-m-d') : '') }}"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    @error('start_date')
                        <span class="text-red-500 text-sm">{{ $message }}</span>
                    @enderror
                </div>

                <div class="flex space-x-3 pt-4">
                    <button type="submit" class="flex-1 btn-primary text-white py-2 rounded-lg">
                        <i class="fas fa-save mr-2"></i>Update Donor
                    </button>
                    <button type="button" id="resetDonorForm" class="flex-1 bg-gray-500 text-white py-2 rounded-lg hover:bg-gray-600">
                        <i class="fas fa-undo mr-2"></i>Reset
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Reset form to original values
        document.getElementById('resetDonorForm').addEventListener('click', function() {
            const form = document.getElementById('donorEditForm');
            form.reset();
            
            // Manually reset select fields to original values
            const originalValues = @json($donor->toArray());
            
            // Payment method
            document.querySelector('select[name="payment_method"]').value = 
                "{{ old('payment_method', $donor->payment_method) }}";
                
            // Status
            document.querySelector('select[name="status"]').value = 
                "{{ old('status', $donor->status) }}";
                
            // Dates
            document.querySelector('input[name="last_paid"]').value = 
                "{{ old('last_paid', $donor->last_paid ? $donor->last_paid->format('Y-m-d') : '') }}";
                
            document.querySelector('input[name="start_date"]').value = 
                "{{ old('start_date', $donor->start_date ? $donor->start_date->format('Y-m-d') : '') }}";
        });
        
        // Form validation
        $('#donorEditForm').validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 255
                },
                phone: {
                    required: true,
                    minlength: 10,
                    maxlength: 20
                },
                email: {
                    email: true,
                    maxlength: 255
                },
                amount: {
                    required: true,
                    number: true,
                    min: 0.01
                },
                payment_method: {
                    required: true
                },
                last_paid: {
                    date: true
                },
                start_date: {
                    date: true
                }
            },
            messages: {
                name: {
                    required: "Please enter donor's full name",
                    minlength: "Name must be at least 2 characters"
                },
                phone: {
                    required: "Phone number is required",
                    minlength: "Phone number must be at least 10 digits"
                },
                amount: {
                    required: "Please enter donation amount",
                    min: "Amount must be at least 0.01"
                },
                payment_method: {
                    required: "Please select a payment method"
                }
            },
            errorPlacement: function(error, element) {
                // Append error message after the input field
                error.addClass('text-red-500 text-sm');
                error.insertAfter(element);
            },
            submitHandler: function(form) {
                // Submit the form normally
                form.submit();
            }
        });
    });
</script>
@endpush