@extends('admin.layouts.app')

@section('title', 'Mosque - Create Announcement')
@section('page-title', 'Create Announcement')

@section('content')

    <!-- About Section -->
    <div id="about" class="section-content hidden active">
        <div class="bg-white rounded-xl shadow-sm p-6">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">পরিচিতি সেকশন ব্যবস্থাপনা</h2>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div>
                    <h3 class="text-lg font-semibold mb-4">সাধারণ তথ্য</h3>

                    <div class="mb-4">
                        <label class="block text-gray-700 mb-2">শিরোনাম</label>
                        <input type="text"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                            value="আমাদের মসজিদ সম্পর্কে">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 mb-2">সাবটাইটেল</label>
                        <input type="text"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                            value="ইতিহাস, মূল্যবোধ এবং সম্প্রদায়">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 mb-2">প্রতিষ্ঠার বছর</label>
                        <input type="number"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                            value="1985">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 mb-2">ইমামের নাম</label>
                        <input type="text"
                            class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                            value="মাওলানা আব্দুল করিম">
                    </div>
                </div>

                <div>
                    <h3 class="text-lg font-semibold mb-4">আমাদের ছবি</h3>

                    <div class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center mb-4">
                        <img src="https://images.unsplash.com/photo-1558694111-2c28b7b92e3a?ixlib=rb-4.0.3&amp;auto=format&amp;fit=crop&amp;w=800&amp;q=80"
                            alt="Mosque Interior" class="w-full h-48 object-cover rounded-lg mb-4">
                        <p class="text-gray-600 mb-3">বর্তমান ছবি</p>
                        <button
                            class="bg-primary text-white px-4 py-2 rounded-lg font-medium hover:bg-secondary transition">
                            <i class="fas fa-upload mr-2"></i> নতুন ছবি আপলোড
                        </button>
                    </div>
                </div>
            </div>

            <div class="mt-6">
                <h3 class="text-lg font-semibold mb-4">আমাদের সম্পর্কে</h3>
                <textarea class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary" rows="8">আমাদের মসজিদটি ১৯৮৫ সালে প্রতিষ্ঠিত হয়েছিল এবং তখন থেকে এটি আমাদের সম্প্রদায়ের আধ্যাত্মিক কেন্দ্র হিসেবে কাজ করে আসছে। আমরা ইসলামের শিক্ষা প্রচার, সম্প্রদায়ের উন্নয়ন এবং সামাজিক সেবা প্রদানে নিবেদিত।

আমাদের মূল্যবোধ:
- ধর্মীয় শিক্ষার প্রচার ও প্রসার
- সম্প্রদায়ের মধ্যে ঐক্য ও ভ্রাতৃত্ব গড়ে তোলা
- দরিদ্র ও অসহায়দের সাহায্য করা
- তরুণ প্রজন্মকে ইসলামিক মূল্যবোধ শিক্ষা দেওয়া

আমাদের সুবিধাসমূহ:
- দৈনিক পাঁচ ওয়াক্ত নামাজ
- জুমার নামাজ
- ইসলামিক শিক্ষা কার্যক্রম
- বিবাহ ও জানাজা পরিষেবা
- সম্প্রদায় কেন্দ্র
                            </textarea>
            </div>

            <div class="mt-8 flex justify-end">
                <button class="bg-primary text-white px-6 py-2 rounded-lg font-medium hover:bg-secondary transition">
                    পরিবর্তনগুলি সংরক্ষণ করুন
                </button>
            </div>
        </div>
    </div>

@endsection
