@extends('admin.layouts.app')

@section('title', 'Mosque - Edit About')
@section('page-title', 'Edit About Mosque')

@section('content')
<div class="max-w-3xl mx-auto py-10">
    <h2 class="text-2xl font-bold mb-4">Edit About Mosque Section</h2>

    @if (session('success'))
        <div class="bg-green-100 text-green-800 p-3 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif

    <form action="{{ route('admin.about.update') }}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-4">
            <label class="block mb-1 font-semibold">Mosque Name</label>
            <input type="text" name="mosque_name" value="{{ old('mosque_name', $about->mosque_name ?? '') }}"
                class="w-full border rounded p-2">
            @error('mosque_name')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label class="block mb-1 font-semibold">History Paragraph 1</label>
            <textarea name="history_paragraph1" class="w-full border rounded p-2" rows="4">{{ old('history_paragraph1', $about->history_paragraph1 ?? '') }}</textarea>
            @error('history_paragraph1')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
    <label class="block mb-1 font-semibold">Community since Year</label>
    <input type="text" name="history_paragraph2"
        value="{{ old('history_paragraph2', $about->history_paragraph2 ?? '') }}"
        class="w-full border rounded p-2">
    @error('history_paragraph2')
        <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
    @enderror
</div>


        <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
            Save Changes
        </button>
    </form>
</div>
@endsection
