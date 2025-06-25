-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 01:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mosjid_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_mosques`
--

CREATE TABLE `about_mosques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mosque_name` varchar(255) DEFAULT NULL,
  `history_paragraph1` text DEFAULT NULL,
  `history_paragraph2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_mosques`
--

INSERT INTO `about_mosques` (`id`, `mosque_name`, `history_paragraph1`, `history_paragraph2`, `created_at`, `updated_at`) VALUES
(1, 'Badda Al-Amin Jame Mosjid', 'Al-Noor Mosque was established in 1985 with a small group of dedicated community members. What began as a humble prayer space has grown into a vibrant Islamic center serving thousands of Muslims in our city.\r\n\r\nOver the years, we\'ve expanded our facilities to include a full-time Islamic school, community hall, and library. Our mosque has become a cornerstone of the Muslim community, providing spiritual guidance and social services to all.', 'Serving the community since 1985', '2025-06-24 10:22:32', '2025-06-24 10:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `announcements_tables`
--

CREATE TABLE `announcements_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `category` enum('general','prayer','event','fundraising','ramadan') NOT NULL,
  `description` text NOT NULL,
  `event_time` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements_tables`
--

INSERT INTO `announcements_tables` (`id`, `title`, `date`, `category`, `description`, `event_time`, `created_at`, `updated_at`) VALUES
(1, 'Friday Prayer Change', '2025-07-04', 'general', 'Starting next week, Jumu\'ah prayer will begin at 1:30 PM instead of 1:15 PM due to summer timing.', NULL, NULL, '2025-06-24 10:33:29'),
(2, 'Eid al-Adha Celebration', '2025-06-07', 'event', 'Join us for Eid prayer and community gathering', '8:00 AM - 12:00 PM', '2025-06-24 10:34:30', '2025-06-24 10:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donors_tables`
--

CREATE TABLE `donors_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','bank','mobile','card') NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `last_paid` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donors_tables`
--

INSERT INTO `donors_tables` (`id`, `name`, `phone`, `email`, `amount`, `payment_method`, `status`, `last_paid`, `start_date`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', '01640764896', 'arefinmojumder825@gmail.com', 200.00, 'cash', 'active', NULL, '2025-06-01', '2025-06-24 10:31:36', '2025-06-24 10:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_items`
--

CREATE TABLE `gallery_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `event_date` date DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_items`
--

INSERT INTO `gallery_items` (`id`, `title`, `description`, `type`, `event_date`, `image_path`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Friday Khutbah', 'Starting next week, Jumu\'ah prayer will begin at 1:30 PM instead of 1:15 PM due to summer timing.\r\n\r\nOpportunity to sponsor community iftar during Ramadan. Contact the office to participate.', 'event', '2025-07-04', 'gallery/2r83yakeeqmbLiypQbstGAf1mOTeOlNWGBThXkGy.jpg', 0, '2025-06-24 10:37:19', '2025-06-24 10:38:05'),
(2, 'Eid al-Adha Celebration', 'Join us for Eid prayer and community gathering', 'Eid-Event', '2025-06-07', 'gallery/GDAS4CmjztpSwkMniNl0t9VO6Cibthjhk2QZICrI.jpg', 0, '2025-06-24 10:39:14', '2025-06-24 10:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `button_link` varchar(255) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `title`, `subtitle`, `button_text`, `button_link`, `banner_image`, `created_at`, `updated_at`) VALUES
(1, 'Welcome to Al-Noor Mosque', 'A center for spiritual growth, community service, and Islamic education. Join us in prayer, learning, and serving humanity.', 'Visit Us', '/', 'banners/jpTzLJ4ZyC3NQdmqfkjnC73b6lRdMs6CoFx720ZI.jpg', NULL, '2025-06-24 10:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaders`
--

CREATE TABLE `leaders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaders`
--

INSERT INTO `leaders` (`id`, `name`, `designation`, `email`, `phone`, `photo`, `bio`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', 'Web Development', 'arefinmojumder825@gmail.com', '01640764896', 'leaders/1750761312_685a7f6083b8b.jpg', NULL, 1, '2025-06-24 10:35:12', '2025-06-24 10:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `messages_tables`
--

CREATE TABLE `messages_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('read','unread') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_17_112626_create_donors_tables', 1),
(5, '2025_06_17_112644_create_prayer_times_tables', 1),
(6, '2025_06_17_112700_create_announcements_tables', 1),
(7, '2025_06_17_112734_create_messages_tables', 1),
(8, '2025_06_19_063022_create_home_banners_table', 1),
(9, '2025_06_19_101918_create_leaders_table', 1),
(10, '2025_06_19_122720_create_gallery_items_table', 1),
(11, '2025_06_20_010413_create_mosque_settings_table', 1),
(12, '2025_06_22_012020_create_monthly_collections_table', 1),
(13, '2025_06_22_175910_create_contact_messages_table', 1),
(14, '2025_06_24_122918_create_about_mosques_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monthly_collections`
--

CREATE TABLE `monthly_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collection_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `category` enum('monthly_chanda','zakat','fitrah','mosque_fund','other') NOT NULL DEFAULT 'monthly_chanda',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monthly_collections`
--

INSERT INTO `monthly_collections` (`id`, `collection_date`, `total_amount`, `category`, `notes`, `created_at`, `updated_at`) VALUES
(1, '2025-06-01', 50000.00, 'monthly_chanda', NULL, '2025-06-24 10:35:38', '2025-06-24 10:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `mosque_settings`
--

CREATE TABLE `mosque_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mosque_name` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `footer_message` text NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mosque_settings`
--

INSERT INTO `mosque_settings` (`id`, `mosque_name`, `contact_phone`, `email`, `address`, `footer_message`, `language`, `created_at`, `updated_at`) VALUES
(1, 'Badda Al-Amin Jame Mosjid', '01000000000', NULL, 'Badda,Hajigonj,Chandpur-3610', 'A beacon of faith, knowledge, and community service. Serving Muslims since 1985.', 'en', '2025-06-24 10:45:53', '2025-06-24 10:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prayer_times_tables`
--

CREATE TABLE `prayer_times_tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fajr` time NOT NULL,
  `dhuhr` time NOT NULL,
  `asr` time NOT NULL,
  `maghrib` time NOT NULL,
  `isha` time NOT NULL,
  `jummah` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prayer_times_tables`
--

INSERT INTO `prayer_times_tables` (`id`, `fajr`, `dhuhr`, `asr`, `maghrib`, `isha`, `jummah`, `created_at`, `updated_at`) VALUES
(1, '04:51:00', '13:30:00', '16:45:00', '18:20:00', '20:30:00', '13:30:00', '2025-06-24 10:23:39', '2025-06-24 10:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3GcMHEdCGGTqjOMk1n6MZovaT4krnlyA6KXsoeXJ', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoickhsRkNheDdxeW81ZzNmSWVRSFZFUFU1aDlrTVN0TnRBRG5DcFp0aCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1750762531),
('Dm2SdnJLVWkQYO0Ho6ruKNRpTlFWg6104ggNIv7y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR2lLZmNUd1NvNWlQd1F4aVdPWDJqaWpiSlJ2TFlYNGEzbzRtNUFvSCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Fib3V0Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9hYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750760433),
('FtutZvj6kSo4bDGgNap9XwzNvE5VzNjLatGOPXaa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHRVRUJxTWdNMkZtWTVrMWFKaUtWbXpocHFVb0QyVEhDZzN6SmpBcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750760431);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@gmail.com', NULL, '$2y$12$hAkXVVifUvd.iCYDPntFDuUe7kEuyJOfWbPnzqfXJHSTYhS0IqSh2', NULL, '2025-06-24 10:20:00', '2025-06-24 10:20:00'),
(2, 'Admin User', 'admin2@gmail.com', NULL, '$2y$12$YfLTWQOoluwgecCxCphmzuCfDGZqlEaexUp3Lm/q.WUIb2VKAJBfG', NULL, '2025-06-24 10:20:01', '2025-06-24 10:20:01'),
(3, 'Admin User', 'arefinmojumder825@gmail.com', NULL, '$2y$12$T9ypJnOwgsF64Z3aoofTVuOCgw7HMrMNf0A1hLKALZC6lXTg/.5cK', 'zfVqsozXlE0qIMvlcmmaT2i0uPoF48o0b9D46vQoVZ3wrIhR3p9PkA0Lmaso', '2025-06-24 10:20:01', '2025-06-24 10:20:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_mosques`
--
ALTER TABLE `about_mosques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements_tables`
--
ALTER TABLE `announcements_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donors_tables`
--
ALTER TABLE `donors_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gallery_items`
--
ALTER TABLE `gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaders`
--
ALTER TABLE `leaders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_tables`
--
ALTER TABLE `messages_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_collections`
--
ALTER TABLE `monthly_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mosque_settings`
--
ALTER TABLE `mosque_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `prayer_times_tables`
--
ALTER TABLE `prayer_times_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_mosques`
--
ALTER TABLE `about_mosques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements_tables`
--
ALTER TABLE `announcements_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donors_tables`
--
ALTER TABLE `donors_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_items`
--
ALTER TABLE `gallery_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaders`
--
ALTER TABLE `leaders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages_tables`
--
ALTER TABLE `messages_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `monthly_collections`
--
ALTER TABLE `monthly_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mosque_settings`
--
ALTER TABLE `mosque_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prayer_times_tables`
--
ALTER TABLE `prayer_times_tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
