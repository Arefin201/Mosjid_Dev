@extends('admin.layouts.app')

@section('title', 'System Settings')
@section('page-title', 'Mosque Settings')

@section('content')
    <div id="settingsPage" class="page-content">
        <div class="space-y-6">
            @if(session('success'))
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4">
                    {{ session('success') }}
                </div>
            @endif
            
            @if($errors->any())
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4">
                    <ul>
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="bg-white rounded-lg shadow-sm p-6">
                <h3 class="text-xl font-semibold mb-6">Mosque Settings</h3>

                <form id="settingsForm" method="POST" action="{{ route('admin.settings.mosque.update') }}" class="space-y-6">
                    @csrf
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Mosque Name</label>
                            <input type="text" name="mosqueName" value="{{ old('mosqueName', $settings->mosque_name ?? '') }}"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            @error('mosqueName')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Contact Phone</label>
                            <input type="tel" name="contactPhone" value="{{ old('contactPhone', $settings->contact_phone ?? '') }}"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            @error('contactPhone')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                            <input type="email" name="email" value="{{ old('email', $settings->email ?? '') }}"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            @error('email')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Address</label>
                            <input type="text" name="address" value="{{ old('address', $settings->address ?? '') }}"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            @error('address')
                                <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Footer Message</label>
                        <textarea name="footerMessage" rows="3"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">{{ old('footerMessage', $settings->footer_message ?? '') }}</textarea>
                        @error('footerMessage')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Default Language</label>
                        <select name="language"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            <option value="en" {{ old('language', $settings->language ?? '') == 'en' ? 'selected' : '' }}>English</option>
                            <option value="bn" {{ old('language', $settings->language ?? '') == 'bn' ? 'selected' : '' }}>বাংলা</option>
                            <option value="ar" {{ old('language', $settings->language ?? '') == 'ar' ? 'selected' : '' }}>العربية</option>
                        </select>
                        @error('language')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <button type="submit" class="bg-green-700 hover:bg-green-800 text-white px-6 py-2 rounded-lg transition duration-200">
                        <i class="fas fa-save mr-2"></i>Save Settings
                    </button>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('styles')
    <style>
        .btn-primary {
            background-color: #0a5f38;
            color: white;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: #07492a;
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .focus\:ring-green-500:focus {
            --tw-ring-opacity: 1;
            --tw-ring-color: rgba(10, 95, 56, var(--tw-ring-opacity));
        }
        
        .border {
            border: 1px solid #e2e8f0;
            border-radius: 0.5rem;
        }
    </style>
@endpush

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const settingsForm = document.getElementById('settingsForm');
            
            settingsForm.addEventListener('submit', function(e) {
                // Show loading indicator
                const submitButton = this.querySelector('button[type="submit"]');
                submitButton.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Saving...';
                submitButton.disabled = true;
                
                // You can optionally add client-side validation here
                // before the form submits
            });
            
            // Initialize Toastr if available
            if (typeof toastr !== 'undefined') {
                @if(session('success'))
                    toastr.success('{{ session('success') }}');
                @endif
                
                @if($errors->any())
                    toastr.error('Please fix the errors in the form');
                @endif
            }
        });
    </script>
@endpush