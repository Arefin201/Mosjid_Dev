@extends('admin.layouts.app')
@section('title', 'View Contact Message')
@section('page-title', 'View Contact Message')

@section('content')
<main class="p-4 sm:p-6">
    <div class="bg-white rounded-lg shadow-sm p-6">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h3 class="text-xl font-semibold">Message Details</h3>
                <p class="text-gray-600">Received on {{ $contact->created_at->format('M d, Y h:i A') }}</p>
            </div>
            <div>
                <span class="px-3 py-1 rounded-full text-sm font-medium 
                    {{ $contact->status == 'unread' ? 'bg-yellow-100 text-yellow-800' : 'bg-green-100 text-green-800' }}">
                    {{ ucfirst($contact->status) }}
                </span>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
            <div>
                <h4 class="text-sm font-medium text-gray-500 mb-1">Full Name</h4>
                <p class="text-lg">{{ $contact->name }}</p>
            </div>
            <div>
                <h4 class="text-sm font-medium text-gray-500 mb-1">Email Address</h4>
                <p class="text-lg">{{ $contact->email }}</p>
            </div>
            <div>
                <h4 class="text-sm font-medium text-gray-500 mb-1">Phone Number</h4>
                <p class="text-lg">{{ $contact->phone ?? 'N/A' }}</p>
            </div>
            <div>
                <h4 class="text-sm font-medium text-gray-500 mb-1">Subject</h4>
                <p class="text-lg">{{ $contact->subject }}</p>
            </div>
        </div>

        <div class="mb-8">
            <h4 class="text-sm font-medium text-gray-500 mb-1">Message</h4>
            <div class="bg-gray-50 p-6 rounded-lg">
                <p class="text-gray-800 whitespace-pre-line">{{ $contact->message }}</p>
            </div>
        </div>

        <div class="flex justify-between items-center">
            <div>
                <a href="{{ route('admin.contact.index') }}" 
                   class="bg-gray-200 text-gray-800 hover:bg-gray-300 px-4 py-2 rounded-lg">
                    <i class="fas fa-arrow-left mr-2"></i> Back to Messages
                </a>
            </div>
            
        </div>
    </div>
</main>
@endsection
