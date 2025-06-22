<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Mosque Admin Dashboard')</title>

    <!-- Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="{{ asset('admin/style.css') }}" rel="stylesheet">


    @stack('styles')
</head>

<body class="bg-gray-50">
    <!-- Mobile Menu Overlay -->
    <div id="mobileMenuOverlay" class="fixed inset-0 z-40 mobile-menu-overlay hidden lg:hidden"></div>

    <!-- Sidebar -->
    @include('admin.layouts.nav-bar')

    <!-- Main Content -->
    <div class="lg:ml-64">
        <!-- Top Navigation -->
        @include('admin.layouts.header')

        <!-- Page Content -->
        <main class="p-4 sm:p-6">


            @yield('content')
        </main>
    </div>

    <!-- Footer -->
    @include('admin.layouts.footer')

    <!-- Modals -->
    @stack('modals')
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <script src="{{ asset('admin/app.js') }}"></script>
    @stack('scripts') 
</body>

</html>
