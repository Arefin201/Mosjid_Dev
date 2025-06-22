@extends('admin.layouts.app')

@section('title', 'Mosque - Add Donor')
@section('page-title', 'Add New Donor')

@section('content')
    <div id="donorModal" class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center p-4">
        <div class="bg-white rounded-lg max-w-md w-full max-h-[90vh] overflow-y-auto">
            <div class="p-6">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-lg font-semibold" id="donorModalTitle">Add New Donor</h3>
                    <a href="{{ route('admin.donors.index') }}" id="closeDonorModal" class="text-gray-400 hover:text-gray-600">
                        <i class="fas fa-times"></i>
                    </a>
                </div>

                <form id="donorForm" method="POST" action="{{ route('admin.donors.store') }}" class="space-y-4" novalidate="novalidate">
                    @csrf
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Full Name *</label>
                        <input type="text" name="name" required
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <span class="text-red-500 text-sm error-name"></span>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number *</label>
                        <input type="tel" name="phone" required
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <span class="text-red-500 text-sm error-phone"></span>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                        <input type="email" name="email"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <span class="text-red-500 text-sm error-email"></span>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Monthly Amount (৳) *</label>
                        <input type="number" name="amount" required min="0.01" step="0.01"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <span class="text-red-500 text-sm error-amount"></span>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Payment Method *</label>
                        <select name="payment_method" required
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            <option value="">Select Payment Method</option>
                            <option value="cash">Cash</option>
                            <option value="bank">Bank Transfer</option>
                            <option value="mobile">Mobile Banking</option>
                            <option value="card">Card</option>
                        </select>
                        <span class="text-red-500 text-sm error-payment_method"></span>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Status</label>
                        <select name="status"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            <option value="active" selected>Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
                        <input type="date" name="start_date"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                    </div>

                    <div class="flex space-x-3 pt-4">
                        <button type="submit" class="flex-1 btn-primary text-white py-2 rounded-lg">
                            <i class="fas fa-save mr-2"></i>Save Donor
                        </button>
                        <button type="button" id="resetDonorForm"
                            class="flex-1 bg-gray-500 text-white py-2 rounded-lg hover:bg-gray-600">
                            <i class="fas fa-undo mr-2"></i>Reset
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function() {
            // Initialize form validation
            $('#donorForm').validate({
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
                    // Custom error placement
                    const fieldName = element.attr('name');
                    $(`.error-${fieldName}`).html(error);
                },
                submitHandler: function(form) {
                    // Clear previous errors
                    $('.text-red-500').html('');
                    
                    // Serialize form data
                    const formData = $(form).serialize();
                    
                    // Submit form via AJAX
                    $.ajax({
                        url: $(form).attr('action'),
                        method: 'POST',
                        data: formData,
                        success: function(response) {
                            // Close modal and redirect
                            window.location.href = "{{ route('admin.donors.index') }}";
                        },
                        error: function(xhr) {
                            // Handle validation errors
                            const errors = xhr.responseJSON.errors;
                            $.each(errors, function(key, value) {
                                $(`.error-${key}`).html(`<span>${value[0]}</span>`);
                            });
                        }
                    });
                }
            });

            // Reset form button
            $('#resetDonorForm').click(function() {
                $('#donorForm')[0].reset();
                $('.text-red-500').html('');
                $('select[name="status"]').val('active');
            });
        });
    </script>
@endpush