@extends('admin.layouts.app')

@section('title', 'Admin Profile')
@section('page-title', 'My Profile')

@section('content')
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex items-center justify-between mb-6">
            <h3 class="text-xl font-semibold">Profile Information</h3>
            <button class="btn-primary text-white px-6 py-2 rounded-lg">
                <i class="fas fa-save mr-2"></i>Save Changes
            </button>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-1">
                <div class="flex flex-col items-center">
                    <div class="relative mb-4">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z'/%3E%3C/svg%3E"
                            alt="Admin" class="w-32 h-32 rounded-full bg-green-700 text-white p-4">
                        <button class="absolute bottom-2 right-2 bg-green-600 text-white rounded-full p-2">
                            <i class="fas fa-camera"></i>
                        </button>
                    </div>
                    <h2 class="text-2xl font-bold">Admin User</h2>
                    <p class="text-gray-600">Super Administrator</p>
                </div>
            </div>

            <div class="lg:col-span-2">
                <form class="space-y-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                            <input type="text" value="Admin User"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                            <input type="email" value="admin@mosque.org"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        </div>

                        <!-- Other fields -->
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Bio</label>
                        <textarea rows="4"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">Mosque administrator since 2020</textarea>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
