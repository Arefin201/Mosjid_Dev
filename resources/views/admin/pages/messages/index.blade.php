@extends('admin.layouts.app')

@section('title', 'Mosque - Messages Page')
@section('page-title', 'Messages Page')

@section('content')

    <!-- Messages Page -->
    <div id="messagesPage" class="page-content">
        <div class="bg-white rounded-lg shadow-sm p-6">
            <h3 class="text-xl font-semibold mb-6">Contact Messages</h3>

            <div class="table-container overflow-x-auto">
                <table class="w-full table-auto">
                    <thead>
                        <tr class="bg-gray-50">
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Name</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Email</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Subject</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Date</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Status</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="messagesTableBody">
                        <tr class="border-b hover:bg-gray-50">
                            <td class="px-4 py-3 font-medium">Ahmed Ali</td>
                            <td class="px-4 py-3">ahmed@email.com</td>
                            <td class="px-4 py-3">Prayer Time Inquiry</td>
                            <td class="px-4 py-3">2024-06-16</td>
                            <td class="px-4 py-3">
                                <span class="px-2 py-1 text-xs rounded-full bg-blue-100 text-blue-800">
                                    unread
                                </span>
                            </td>
                            <td class="px-4 py-3">
                                <button onclick="viewMessage(1)" class="text-green-600 hover:text-green-800 mr-2">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button onclick="deleteMessage(1)" class="text-red-600 hover:text-red-800">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>

                        <tr class="border-b hover:bg-gray-50">
                            <td class="px-4 py-3 font-medium">Sarah Ahmed</td>
                            <td class="px-4 py-3">sarah@email.com</td>
                            <td class="px-4 py-3">Donation Question</td>
                            <td class="px-4 py-3">2024-06-15</td>
                            <td class="px-4 py-3">
                                <span class="px-2 py-1 text-xs rounded-full bg-gray-100 text-gray-800">
                                    read
                                </span>
                            </td>
                            <td class="px-4 py-3">
                                <button onclick="viewMessage(2)" class="text-green-600 hover:text-green-800 mr-2">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button onclick="deleteMessage(2)" class="text-red-600 hover:text-red-800">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>

                        <tr class="border-b hover:bg-gray-50">
                            <td class="px-4 py-3 font-medium">Ibrahim Khan</td>
                            <td class="px-4 py-3">ibrahim@email.com</td>
                            <td class="px-4 py-3">Event Participation</td>
                            <td class="px-4 py-3">2024-06-14</td>
                            <td class="px-4 py-3">
                                <span class="px-2 py-1 text-xs rounded-full bg-blue-100 text-blue-800">
                                    unread
                                </span>
                            </td>
                            <td class="px-4 py-3">
                                <button onclick="viewMessage(3)" class="text-green-600 hover:text-green-800 mr-2">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button onclick="deleteMessage(3)" class="text-red-600 hover:text-red-800">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
