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

                <form id="donorForm" method="POST" action="{{ route('admin.donors.store') }}" enctype="multipart/form-data"
                    class="space-y-4" novalidate="novalidate">
                    @csrf

                    <!-- Existing fields... -->

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
                    <!-- Add this new image upload field -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Donor Image</label>
                        <div class="mt-1 flex items-center">
                            <div class="relative">
                                <img id="imagePreview" src="{{ asset('images/default-user.png') }}"
                                    class="w-20 h-20 rounded-full object-cover border-2 border-gray-300">
                                <label for="person_image"
                                    class="absolute bottom-0 right-0 bg-white rounded-full p-1 border border-gray-300 cursor-pointer">
                                    <i class="fas fa-camera text-gray-600"></i>
                                    <input type="file" id="person_image" name="person_image" class="hidden"
                                        accept="image/*">
                                </label>
                            </div>
                            <div class="ml-4">
                                <button type="button" id="removeImage" class="text-red-600 text-sm hidden">
                                    <i class="fas fa-trash mr-1"></i> Remove
                                </button>
                                <p class="text-xs text-gray-500 mt-1">Max 2MB. JPG, PNG, GIF</p>
                            </div>
                        </div>
                        <span class="text-red-500 text-sm error-person_image"></span>
                    </div>

                    <!-- Rest of your existing form fields... -->

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function() {
            // Image preview functionality
            $('#person_image').change(function(e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        $('#imagePreview').attr('src', event.target.result);
                        $('#removeImage').removeClass('hidden');
                    }
                    reader.readAsDataURL(file);
                }
            });

            // Remove image functionality
            $('#removeImage').click(function() {
                $('#person_image').val('');
                $('#imagePreview').attr('src', "{{ asset('images/default-user.png') }}");
                $(this).addClass('hidden');
            });

            // Update form validation to include image
            $('#donorForm').validate({
                rules: {
                    // ... your existing rules ...
                    person_image: {
                        accept: "image/jpeg,image/png,image/gif",
                        filesize: 2048 // 2MB
                    }
                },
                messages: {
                    // ... your existing messages ...
                    person_image: {
                        accept: "Please upload a valid image (JPG, PNG, GIF)",
                        filesize: "Image must be less than 2MB"
                    }
                },
                // ... rest of your validation config ...
            });

            // Custom validation method for file size
            $.validator.addMethod('filesize', function(value, element, param) {
                return this.optional(element) || (element.files[0].size <= param * 1024);
            }, 'File size must be less than {0} KB');

            // Update AJAX form submission to handle file uploads
            $('#donorForm').submit(function(e) {
                e.preventDefault();

                if ($(this).valid()) {
                    const formData = new FormData(this);

                    $.ajax({
                        url: $(this).attr('action'),
                        method: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function(response) {
                            window.location.href = "{{ route('admin.donors.index') }}";
                        },
                        error: function(xhr) {
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
                $('#imagePreview').attr('src', "{{ asset('images/default-user.png') }}");
                $('#removeImage').addClass('hidden');
            });
        });
    </script>
@endpush
