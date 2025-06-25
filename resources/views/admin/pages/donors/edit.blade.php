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

                <form id="donorEditForm" method="POST" action="{{ route('admin.donors.update', $donor->id) }}"
                    enctype="multipart/form-data" class="space-y-4">
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
                        <input type="number" name="amount" required min="0.01" step="0.01"
                            value="{{ old('amount', $donor->amount) }}"
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
                            <option value="cash"
                                {{ old('payment_method', $donor->payment_method) == 'cash' ? 'selected' : '' }}>Cash
                            </option>
                            <option value="bank"
                                {{ old('payment_method', $donor->payment_method) == 'bank' ? 'selected' : '' }}>Bank
                                Transfer</option>
                            <option value="mobile"
                                {{ old('payment_method', $donor->payment_method) == 'mobile' ? 'selected' : '' }}>Mobile
                                Banking</option>
                            <option value="card"
                                {{ old('payment_method', $donor->payment_method) == 'card' ? 'selected' : '' }}>Card
                            </option>
                        </select>
                        @error('payment_method')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Status *</label>
                        <select name="status"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            <option value="active" {{ old('status', $donor->status) == 'active' ? 'selected' : '' }}>Active
                            </option>
                            <option value="inactive" {{ old('status', $donor->status) == 'inactive' ? 'selected' : '' }}>
                                Inactive</option>
                        </select>
                        @error('status')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Last Paid Date</label>
                        <input type="date" name="last_paid"
                            value="{{ old('last_paid', $donor->last_paid ? $donor->last_paid->format('Y-m-d') : '') }}"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        @error('last_paid')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Start Date</label>
                        <input type="date" name="start_date"
                            value="{{ old('start_date', $donor->start_date ? $donor->start_date->format('Y-m-d') : '') }}"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        @error('start_date')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    </div>
                    <!-- Image Upload Field -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Donor Image</label>
                        <div class="mt-1 flex items-center">
                            <div class="relative">
                                <img id="imagePreview"
                                    src="{{ $donor->person_image ? asset($donor->person_image) : asset('images/default-user.png') }}"
                                    class="w-20 h-20 rounded-full object-cover border-2 border-gray-300">
                                <label for="person_image"
                                    class="absolute bottom-0 right-0 bg-white rounded-full p-1 border border-gray-300 cursor-pointer">
                                    <i class="fas fa-camera text-gray-600"></i>
                                    <input type="file" id="person_image" name="person_image" class="hidden"
                                        accept="image/*">
                                </label>
                            </div>
                            <div class="ml-4">
                                @if ($donor->person_image)
                                    <button type="button" id="removeImage" class="text-red-600 text-sm">
                                        <i class="fas fa-trash mr-1"></i> Remove
                                    </button>
                                @else
                                    <button type="button" id="removeImage" class="text-red-600 text-sm hidden">
                                        <i class="fas fa-trash mr-1"></i> Remove
                                    </button>
                                @endif
                                <p class="text-xs text-gray-500 mt-1">Max 2MB. JPG, PNG, GIF</p>
                            </div>
                        </div>
                        @error('person_image')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Existing fields... -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Full Name *</label>
                        <input type="text" name="name" required value="{{ old('name', $donor->name) }}"
                            class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        @error('name')
                            <span class="text-red-500 text-sm">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Rest of your form fields... -->

                    <div class="flex space-x-3 pt-4">
                        <button type="submit" class="flex-1 btn-primary text-white py-2 rounded-lg">
                            <i class="fas fa-save mr-2"></i>Update Donor
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

@push('styles')
    <style>
        #imagePreview {
            transition: all 0.3s ease;
        }

        #removeImage:hover {
            text-decoration: underline;
        }
    </style>
@endpush

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Image preview functionality
            const imageInput = document.getElementById('person_image');
            const imagePreview = document.getElementById('imagePreview');
            const removeButton = document.getElementById('removeImage');
            const defaultImage = "{{ asset('images/default-user.png') }}";
            const originalImage =
                "{{ $donor->person_image ? asset($donor->person_image) : asset('images/default-user.png') }}";

            imageInput.addEventListener('change', function(e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        imagePreview.src = event.target.result;
                        removeButton.classList.remove('hidden');
                    }
                    reader.readAsDataURL(file);
                }
            });

            // Remove image functionality
            removeButton.addEventListener('click', function() {
                imageInput.value = '';
                imagePreview.src = defaultImage;
                removeButton.classList.add('hidden');

                // Add hidden field to indicate image removal if needed
                if (document.getElementById('remove_image_flag')) {
                    document.getElementById('remove_image_flag').value = '1';
                } else {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'remove_image';
                    input.id = 'remove_image_flag';
                    input.value = '1';
                    document.getElementById('donorEditForm').appendChild(input);
                }
            });

            // Reset form to original values
            document.getElementById('resetDonorForm').addEventListener('click', function() {
                const form = document.getElementById('donorEditForm');
                form.reset();

                // Reset image preview
                imagePreview.src = originalImage;
                if ("{{ $donor->person_image }}") {
                    removeButton.classList.remove('hidden');
                } else {
                    removeButton.classList.add('hidden');
                }

                // Remove the remove_image flag if it exists
                const removeFlag = document.getElementById('remove_image_flag');
                if (removeFlag) {
                    removeFlag.remove();
                }

                // Manually reset select fields to original values
                document.querySelector('select[name="payment_method"]').value =
                    "{{ old('payment_method', $donor->payment_method) }}";

                document.querySelector('select[name="status"]').value =
                    "{{ old('status', $donor->status) }}";

                document.querySelector('input[name="last_paid"]').value =
                    "{{ old('last_paid', $donor->last_paid ? $donor->last_paid->format('Y-m-d') : '') }}";

                document.querySelector('input[name="start_date"]').value =
                    "{{ old('start_date', $donor->start_date ? $donor->start_date->format('Y-m-d') : '') }}";
            });

            // Form validation with image support
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
                    },
                    person_image: {
                        accept: "image/jpeg,image/png,image/gif",
                        filesize: 2048 // 2MB
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
                    },
                    person_image: {
                        accept: "Please upload a valid image (JPG, PNG, GIF)",
                        filesize: "Image must be less than 2MB"
                    }
                },
                errorPlacement: function(error, element) {
                    if (element.attr('name') === 'person_image') {
                        error.insertAfter(element.closest('div').nextElementSibling);
                    } else {
                        error.insertAfter(element);
                    }
                    error.addClass('text-red-500 text-sm');
                },
                submitHandler: function(form) {
                    // Submit the form normally
                    form.submit();
                }
            });

            // Custom validation method for file size
            $.validator.addMethod('filesize', function(value, element, param) {
                if (element.files.length === 0) return true; // No file selected is valid
                return element.files[0].size <= param * 1024;
            }, 'File size must be less than {0} KB');
        });
    </script>
@endpush
