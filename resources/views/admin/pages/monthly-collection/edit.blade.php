@extends('admin.layouts.app')

@section('title', 'Edit Monthly Collection')
@section('page-title', 'Edit Monthly Collection')

@section('content')

    <div class="container mx-auto px-4 py-8">
        <!-- Page Header -->
        <div class="mb-8">
            <div class="flex items-center justify-between">
                <div>
                    <h1 class="text-3xl font-bold text-gray-800">Monthly Collections</h1>
                    <p class="text-gray-600 mt-2">Edit monthly collection record -
                        MC{{ str_pad($monthlyCollection->id, 4, '0', STR_PAD_LEFT) }}</p>
                </div>
                <div class="flex space-x-3">
                    <a href="{{ route('admin.monthly-collections.index') }}"
                        class="px-4 py-2 bg-gray-200 text-gray-700 rounded-lg font-medium hover:bg-gray-300 transition">
                        <i class="fas fa-arrow-left mr-2"></i>Back to Collections
                    </a>
                    
                </div>
            </div>
        </div>

        <!-- Success Message -->
        @if (session('success'))
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6">
                <div class="flex">
                    <div class="py-1">
                        <i class="fas fa-check-circle mr-2"></i>
                        {{ session('success') }}
                    </div>
                </div>
            </div>
        @endif

        <!-- Error Messages -->
        @if ($errors->any())
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
                <div class="flex">
                    <div class="py-1">
                        <i class="fas fa-exclamation-circle mr-2"></i>
                        <strong>Please correct the following errors:</strong>
                        <ul class="mt-2 list-disc list-inside">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        @endif

        <!-- Current Information Card -->
        <div class="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6">
            <div class="flex items-center mb-3">
                <i class="fas fa-info-circle text-blue-600 mr-2"></i>
                <h3 class="text-lg font-semibold text-blue-800">Current Information</h3>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                <div>
                    <span class="font-medium text-blue-700">Month:</span>
                    <span
                        class="text-blue-600">{{ \Carbon\Carbon::parse($monthlyCollection->collection_date)->format('F Y') }}</span>
                </div>
                <div>
                    <span class="font-medium text-blue-700">Amount:</span>
                    <span class="text-blue-600">৳{{ number_format($monthlyCollection->total_amount, 2) }}</span>
                </div>
                <div>
                    <span class="font-medium text-blue-700">Category:</span>
                    <span
                        class="text-blue-600">{{ $categories[$monthlyCollection->category] ?? ucfirst(str_replace('_', ' ', $monthlyCollection->category)) }}</span>
                </div>
            </div>
        </div>

        <!-- Edit Form -->
        <div id="editForm" class="card rounded-xl shadow-lg p-6 mb-12 mosque-pattern animate-form">
            <div class="flex items-center mb-6">
                <div class="bg-primary/20 w-10 h-10 rounded-lg flex items-center justify-center mr-3">
                    <i class="fas fa-edit text-primary text-lg"></i>
                </div>
                <h2 class="text-xl font-bold text-gray-800">Edit Collection</h2>
            </div>

            <form action="{{ route('admin.monthly-collections.update', $monthlyCollection) }}" method="POST"
                id="collectionForm">
                @csrf
                @method('PUT')

                <!-- Month -->
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2" for="collection_date">
                        Month <span class="text-red-500">*</span>
                    </label>
                    <input type="month" id="collection_date" name="collection_date"
                        value="{{ old('collection_date', \Carbon\Carbon::parse($monthlyCollection->collection_date)->format('Y-m')) }}"
                        class="form-input w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/30 @error('collection_date') border-red-500 @enderror"
                        required>
                    @error('collection_date')
                        <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                    @enderror
                    <div class="text-gray-500 text-xs mt-1">
                        <i class="fas fa-info-circle mr-1"></i>
                        The date will be automatically set to the first day of the selected month
                    </div>
                </div>

                <!-- Amount -->
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2" for="total_amount">
                        Amount (৳) <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <span class="absolute left-3 top-3 text-gray-500">৳</span>
                        <input type="number" step="0.01" id="total_amount" name="total_amount"
                            value="{{ old('total_amount', $monthlyCollection->total_amount) }}"
                            class="form-input w-full pl-8 p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/30 @error('total_amount') border-red-500 @enderror"
                            placeholder="Enter amount" required>
                    </div>
                    @error('total_amount')
                        <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Category -->
                <div class="mb-6">
                    <label class="block text-gray-700 font-medium mb-2" for="category">
                        Category <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <select id="category" name="category"
                            class="form-input w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/30 appearance-none @error('category') border-red-500 @enderror"
                            required>
                            <option value="" disabled>Select a category</option>
                            @foreach ($categories as $key => $label)
                                <option value="{{ $key }}"
                                    {{ old('category', $monthlyCollection->category) == $key ? 'selected' : '' }}>
                                    {{ $label }}
                                </option>
                            @endforeach
                        </select>
                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                            <i class="fas fa-chevron-down"></i>
                        </div>
                    </div>
                    @error('category')
                        <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Notes -->
                <div class="mb-8">
                    <label class="block text-gray-700 font-medium mb-2" for="notes">Notes</label>
                    <textarea id="notes" name="notes" rows="3"
                        class="form-input w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/30 @error('notes') border-red-500 @enderror"
                        placeholder="Add any additional notes about this collection">{{ old('notes', $monthlyCollection->notes) }}</textarea>
                    @error('notes')
                        <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                    @enderror
                </div>

                <!-- Form Actions -->
                <div class="flex flex-col sm:flex-row justify-between gap-4">
                    <div class="flex gap-3">
                        <a href="{{ route('admin.monthly-collections.index') }}"
                            class="px-6 py-3 bg-gray-200 text-gray-700 rounded-lg font-medium hover:bg-gray-300 transition text-center">
                            <i class="fas fa-arrow-left mr-2"></i> Back to Collections
                        </a>
                        
                    </div>
                    <div class="flex gap-3">
                        <button type="reset"
                            class="px-6 py-3 bg-yellow-500 text-white rounded-lg font-medium hover:bg-yellow-600 transition"
                            onclick="resetForm()">
                            <i class="fas fa-undo mr-2"></i> Reset Changes
                        </button>
                        <button type="submit" class="btn-primary px-6 py-3 text-white rounded-lg font-medium">
                            <i class="fas fa-save mr-2"></i> Update Collection
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Danger Zone -->
        <div class="card rounded-xl shadow-lg p-6 border-red-200">
            <div class="flex items-center mb-4">
                <div class="bg-red-100 w-10 h-10 rounded-lg flex items-center justify-center mr-3">
                    <i class="fas fa-exclamation-triangle text-red-600 text-lg"></i>
                </div>
                <h3 class="text-lg font-bold text-red-600">Danger Zone</h3>
            </div>
            <p class="text-gray-600 mb-4">
                Permanently delete this monthly collection record. This action cannot be undone and will remove all
                associated data.
            </p>
            <form action="{{ route('admin.monthly-collections.destroy', $monthlyCollection) }}" method="POST"
                class="inline" onsubmit="return confirmDelete()">
                @csrf
                @method('DELETE')
                <button type="submit"
                    class="px-6 py-3 bg-red-500 text-white rounded-lg font-medium hover:bg-red-600 transition">
                    <i class="fas fa-trash mr-2"></i> Delete Collection
                </button>
            </form>
        </div>
    </div>

    @push('scripts')
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const form = document.getElementById('collectionForm');
                const collectionDate = document.getElementById('collection_date');
                const totalAmount = document.getElementById('total_amount');
                const category = document.getElementById('category');

                // Store original values for reset functionality
                const originalValues = {
                    collection_date: collectionDate.value,
                    total_amount: totalAmount.value,
                    category: category.value,
                    notes: document.getElementById('notes').value
                };

                // Form validation
                form.addEventListener('submit', function(e) {
                    let isValid = true;

                    // Clear previous error messages
                    document.querySelectorAll('.error-message').forEach(el => el.classList.add('hidden'));

                    // Validate collection date
                    if (!collectionDate.value) {
                        showError('date-error', 'Please select a valid month');
                        isValid = false;
                    }

                    // Validate amount
                    if (!totalAmount.value || parseFloat(totalAmount.value) <= 0) {
                        showError('amount-error', 'Please enter a valid amount');
                        isValid = false;
                    }

                    // Validate category
                    if (!category.value) {
                        showError('category-error', 'Please select a category');
                        isValid = false;
                    }

                    if (!isValid) {
                        e.preventDefault();
                    }
                });

                function showError(elementId, message) {
                    const errorElement = document.getElementById(elementId);
                    if (errorElement) {
                        errorElement.textContent = message;
                        errorElement.classList.remove('hidden');
                    }
                }

                // Format amount input
                totalAmount.addEventListener('input', function() {
                    let value = this.value;
                    if (value < 0) {
                        this.value = 0;
                    }
                });

                // Reset form function
                window.resetForm = function() {
                    if (confirm(
                            'Are you sure you want to reset all changes? This will restore the original values.')) {
                        collectionDate.value = originalValues.collection_date;
                        totalAmount.value = originalValues.total_amount;
                        category.value = originalValues.category;
                        document.getElementById('notes').value = originalValues.notes;
                    }
                };

                // Delete confirmation
                window.confirmDelete = function() {
                    return confirm('Are you sure you want to delete this monthly collection?\n\n' +
                        'Collection: MC{{ str_pad($monthlyCollection->id, 4, '0', STR_PAD_LEFT) }}\n' +
                        'Month: {{ \Carbon\Carbon::parse($monthlyCollection->collection_date)->format('F Y') }}\n' +
                        'Amount: ৳{{ number_format($monthlyCollection->total_amount, 2) }}\n\n' +
                        'This action cannot be undone!');
                };
            });
        </script>
    @endpush

    @push('styles')
        <style>
            .mosque-pattern {
                background-image:
                    radial-gradient(circle at 20px 50px, #3B82F6 2px, transparent 2px),
                    radial-gradient(circle at 70px 50px, #3B82F6 2px, transparent 2px);
                background-size: 100px 100px;
                background-color: #ffffff;
            }

            .animate-form {
                animation: slideInUp 0.6s ease-out;
            }

            @keyframes slideInUp {
                from {
                    transform: translateY(30px);
                    opacity: 0;
                }

                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            .btn-primary {
                background: linear-gradient(135deg, #3B82F6, #1E40AF);
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                background: linear-gradient(135deg, #1E40AF, #1E3A8A);
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4);
            }

            .form-input:focus {
                border-color: #3B82F6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            }

            .card {
                background: #ffffff;
                border: 1px solid #e5e7eb;
            }

            .text-primary {
                color: #3B82F6;
            }

            .bg-primary\/20 {
                background-color: rgba(59, 130, 246, 0.2);
            }

            .focus\:ring-primary\/30:focus {
                --tw-ring-color: rgba(59, 130, 246, 0.3);
            }

            /* Responsive adjustments */
            @media (max-width: 640px) {
                .flex.gap-3 {
                    flex-direction: column;
                }

                .flex.gap-3>* {
                    width: 100%;
                    text-align: center;
                }
            }
        </style>
    @endpush
@endsection
