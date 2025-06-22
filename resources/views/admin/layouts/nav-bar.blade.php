<div id="sidebar"
    class="fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-lg transform -translate-x-full lg:translate-x-0 sidebar-transition">
    <div class="flex items-center justify-center h-16 bg-gradient-to-r from-green-800 to-green-700">
        <i class="fas fa-mosque text-white text-2xl mr-3"></i>
        <h1 class="text-white text-xl font-bold">Mosque Admin</h1>
        <button id="closeSidebarMobile" class="lg:hidden text-white ml-4">
            <i class="fas fa-times"></i>
        </button>
    </div>
    <nav class="flex mt-8 px-4">
        <ul class="space-y-2 px-3">
            <li><a href="{{ route('admin.dashboard') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg @if (request()->routeIs('admin.dashboard')) bg-gray-100 font-semibold @endif"
                    data-page="dashboard">
                    <i class="fas fa-tachometer-alt mr-3"></i> Dashboard
                </a></li>
            <li><a href="{{ route('admin.home') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.home') || request()->routeIs('admin.home-banner.*')) bg-gray-100 font-semibold @endif"
                    data-page="hero">
                    <i class="fa-solid fa-house mr-3"></i> Hero Section
                </a></li>
            <li><a href="{{ route('admin.about') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.about') || request()->routeIs('admin.about.*')) bg-gray-100 font-semibold @endif"
                    data-page="about">
                    <i class="fa-solid fa-file mr-3"></i> About Section
                </a></li>
            <li><a href="{{ route('admin.donors.index') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.donors.*')) bg-gray-100 font-semibold @endif"
                    data-page="donors">
                    <i class="fas fa-users mr-3"></i> Donor List
                </a></li>
            <li><a href="{{ route('admin.prayer-times.edit') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.prayer-times.*')) bg-gray-100 font-semibold @endif"
                    data-page="prayer-times">
                    <i class="fas fa-clock mr-3"></i> Prayer Times
                </a></li>
            
            <li><a href="{{ route('admin.announcements.index') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.announcements.*')) bg-gray-100 font-semibold @endif"
                    data-page="announcements">
                    <i class="fas fa-bullhorn mr-3"></i> Announcements
                </a></li>
            <li><a href="{{ route('admin.leadership') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.leadership.*')) bg-gray-100 font-semibold @endif"
                    data-page="leadership">
                    <i class="fa-solid fa-user mr-3"></i> Leadership 
                </a></li>
            <li><a href="{{ route('admin.monthly-collections.index')  }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.monthly-collection.*')) bg-gray-100 font-semibold @endif"
                    data-page="monthlyCollection">
                    <i class="fas fa-coins mr-3"></i> Monthly Collection
                </a></li>
            <li><a href="{{ route('admin.gallery.index') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.gallery.*')) bg-gray-100 font-semibold @endif"
                    data-page="gallery">
                    <i class="fas fa-images mr-3"></i> Gallery
                </a></li>
            <li><a href="{{ route('admin.contact.index') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.contact.*')) bg-gray-100 font-semibold @endif"
                    data-page="contact">
                    <i class="fas fa-envelope mr-3"></i> Contact 
                </a></li>
            <li><a href="{{ route('admin.settings.mosque') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-gray-100 @if (request()->routeIs('admin.settings.*')) bg-gray-100 font-semibold @endif"
                    data-page="settings">
                    <i class="fas fa-cog mr-3"></i> Settings
                </a></li>
            <li><a href="{{ route('admin.logout') }}"
                    class="sidebar-link flex items-center px-4 py-3 rounded-lg hover:bg-red-100 text-red-600">
                    <i class="fas fa-sign-out-alt mr-3"></i> Logout
                </a></li>
        </ul>
    </nav>
</div>