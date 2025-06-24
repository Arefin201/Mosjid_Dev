-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 12:47 PM
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
-- Database: `car_rental_db`
--
CREATE DATABASE IF NOT EXISTS `car_rental_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `car_rental_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_arefinmojumder8235@gmail.com|127.0.0.1', 'i:1;', 1747328846),
('laravel_cache_arefinmojumder8235@gmail.com|127.0.0.1:timer', 'i:1747328846;', 1747328846);

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
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `daily_rent_price` decimal(8,2) NOT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2025_05_15_121217_create_cars_table', 1),
(5, '2025_05_15_121225_create_rentals_table', 1);

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
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('6ha8BSAvxA4OyZt7ll3vV2ARYwHnoI4btTEPsy6D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkdiVW1oSmtYUVJmQTM1QXFnQXZzZUNLN1puYk44RzJhbEM3akc1YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747338659),
('cgQJhLfIvrgWAQUt55ITGA33b19QilvuQT4rXLNT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRURXczNXSnR3aEkzUVlNTkNJbmdFc3B6dnZjOE5USHA4V1M3SVN2dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9mb3Jnb3QtcGFzc3dvcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747337981),
('FLk5wBSlVWNMRFiCkhCvEyanPfkdZrRseWwrMdDd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWZlbG5nTXZhc3FnZlkwSTEwclVMcmRxVWlxelZwWTRLb1lZa3p5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747338629),
('iDibrZoBY0ZugZjxAxtQGEJTwsCszzOIfGOvpkqC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRUJ1bzFYRzFrd2JaUW9seURaa2MyQ3lBc0tFaFRGR25NY01YajdQdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1747338845),
('Qjo3e21hSNXDn8qBFkpHqcOP6hPNNraXPCTqGlu0', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRjdVdDJYYkhoNzZIclhGdmtqMEQ2dUs5cVM0UUNQVXNXUzBXYXVRcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1747338041),
('UIgMLfVtzhKAMJeLif4cEkAmADhuRL56pLQtfv42', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM2N2M1VkWW1jMGZ2VW5XSDdhNnR6SGk0eUc0eEVsY1NmR3RLaFdzNyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovLzEyNy4wLjAuMTo4MDkwL2xvZ291dCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwOTAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747338603);

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
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Arefin Mojumder', 'arefinmojumder825@gmail.com', NULL, '$2y$12$A9IlS2ayyj0uSGj/JrW0UuZKcqulAN8lRbSoFMk0s7y7yAxcT7GGm', 'customer', 'F9oWMR2e0uvB5jOANw6BPHTbU0DqDAxa2Ib1dywaa4n2yh5LxEsDWmQIT8Ps', '2025-05-15 13:36:52', '2025-05-15 13:40:34');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rentals_user_id_foreign` (`user_id`),
  ADD KEY `rentals_car_id_foreign` (`car_id`);

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
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  ADD CONSTRAINT `rentals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Database: `dalyexpense`
--
CREATE DATABASE IF NOT EXISTS `dalyexpense` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dalyexpense`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1750528483),
('5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1750528483;', 1750528483);

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
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `custom_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `custom_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2025_01_10_182310_create_incomes', 1),
(5, '2025_01_10_182402_create_expenses', 1),
(6, '2025_01_15_070402_create_quick_notes_table', 1);

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
-- Table structure for table `quick_notes`
--

CREATE TABLE `quick_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('Nx5a6hDuk9HfJvxU0RbJhFVMY9KJmxMDvjipxhsZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibVUyMWJOTFlab3o5cFdkMzR0TUJDbG1qYVlHdFBiTGh5ZUJXSThuZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1750528341),
('sdCC7qkkBieku8ALY9n5kRF5lITo1eT0GUCVD28K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQUJpT3ZmaGlaMWJGMDJZVDMxdElWZndpSTloc0U3TDFTMjU1R1NKaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1750528397),
('tYz5ooeGuFXBe8h5zTdAYfz4l600WUrk5m073Lli', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzhncVl4Skcxc2JxR1RVakQwS0ZpbERQYmxseGhPb3NUZkN0NWppRSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RyYXRpb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750528434);

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
  `otp` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-06-21 11:51:54', '$2y$12$RjndYU9ffhGT.JoCEXA2Q.4O/OW1cFGZKFbmblY5wcaYAyd5My1g6', 0, 'Iwk4QMuCg9', '2025-06-21 11:51:56', '2025-06-21 11:51:56');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_user_id_foreign` (`user_id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `quick_notes`
--
ALTER TABLE `quick_notes`
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
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `quick_notes`
--
ALTER TABLE `quick_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Database: `event_management`
--
CREATE DATABASE IF NOT EXISTS `event_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `event_management`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `event_id`, `quantity`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 10, 500.00, 'pending', '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(2, 2, 1, 8, 1500.00, 'confirmed', '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(3, 3, 2, 4, 500.00, 'cancelled', '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(4, 4, 4, 10, 5000.00, 'confirmed', '2025-05-24 23:23:56', '2025-05-24 23:23:56');

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
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 'Title 1', 'Description 1', '2025-06-01 05:23:56', '2025-06-02 05:23:56', '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(2, 'Title 2', 'Description 2', '2025-06-01 05:23:56', '2025-06-02 05:23:56', '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(3, 'Title 3', 'Description 3', '2025-06-01 05:23:56', '2025-06-02 05:23:56', '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(4, 'Title 4', 'Description 4', '2025-06-01 05:23:56', '2025-06-02 05:23:56', '2025-05-24 23:23:56', '2025-05-24 23:23:56');

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
(4, '2025_04_21_123438_create_events_table', 1),
(5, '2025_04_21_123719_create_bookings_table', 1),
(6, '2025_04_21_123826_create_notificatons_table', 1),
(7, '2025_04_26_190636_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notificatons`
--

CREATE TABLE `notificatons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 5, 'auth_token', 'c33846d70c330afc5ead9938af6df38562479b7dfc2565c73d35e0a44f8bdd2d', '[\"*\"]', NULL, NULL, '2025-05-24 23:24:18', '2025-05-24 23:24:18'),
(2, 'App\\Models\\User', 6, 'auth_token', 'fbfe6601d70e889a519882c63b2db2b1932c7def0d9f4e2a68e81a0a4ad1c0d7', '[\"*\"]', NULL, NULL, '2025-05-24 23:25:02', '2025-05-24 23:25:02'),
(3, 'App\\Models\\User', 7, 'auth_token', 'c8c8067cf2a5f1eec3c6f3337ea80bf261b11e1f6cb54ad137c5bbb8c8b20b19', '[\"*\"]', NULL, NULL, '2025-05-24 23:27:10', '2025-05-24 23:27:10'),
(4, 'App\\Models\\User', 8, 'auth_token', '34182d08e1c7b7ec32003e7606d691a643b36dfff5ee072da5594c08ddc784e4', '[\"*\"]', NULL, NULL, '2025-05-24 23:29:38', '2025-05-24 23:29:38'),
(5, 'App\\Models\\User', 9, 'auth_token', '7b082c831467d4ff548bda3b0848f82aef0e6d7acb75a02bba3e4eca7aae0a55', '[\"*\"]', NULL, NULL, '2025-05-25 11:36:48', '2025-05-25 11:36:48'),
(6, 'App\\Models\\User', 10, 'auth_token', '9101f1c5ce05f2189cd7ee4723ddbbf1dc234f5b3e7886b525cad47ec69bbeae', '[\"*\"]', NULL, NULL, '2025-05-25 11:40:05', '2025-05-25 11:40:05'),
(7, 'App\\Models\\User', 11, 'auth_token', 'efcc1d7273e415e37ab3f3427ebbc3b598978c0638bab8e43771c82d29da00dd', '[\"*\"]', NULL, NULL, '2025-05-25 11:42:00', '2025-05-25 11:42:00'),
(8, 'App\\Models\\User', 12, 'auth_token', 'a9fd190c5833b61141b2a8d86c9db2d73d847fb29d4c5ec6d29b76382dc16473', '[\"*\"]', NULL, NULL, '2025-05-25 11:43:45', '2025-05-25 11:43:45'),
(9, 'App\\Models\\User', 13, 'auth_token', '5a1750f725c058c8dc358eadba75e7de9fa59093b4dc3c5bedf1c60264218900', '[\"*\"]', NULL, NULL, '2025-05-25 11:44:52', '2025-05-25 11:44:52'),
(10, 'App\\Models\\User', 14, 'auth_token', '80358f68e1c3b42ba9c50ab85774d39207d4a71324c9049bde66c3272576f15f', '[\"*\"]', NULL, NULL, '2025-05-25 11:48:00', '2025-05-25 11:48:00'),
(11, 'App\\Models\\User', 15, 'auth_token', 'f283ce7923e459700c729572cffc93d420f52b19186d409b3919d7bcf2f9240d', '[\"*\"]', NULL, NULL, '2025-05-25 11:56:24', '2025-05-25 11:56:24'),
(12, 'App\\Models\\User', 16, 'auth_token', '3b35dd328a03515afacb027c7d117f76ba72efeabef08d7c405c0a526ee0124f', '[\"*\"]', NULL, NULL, '2025-05-25 12:20:29', '2025-05-25 12:20:29'),
(13, 'App\\Models\\User', 17, 'auth_token', '325c4c257576c0504e1c357792f481cd4507098b363b94d71d406097959f6452', '[\"*\"]', NULL, NULL, '2025-05-25 12:47:30', '2025-05-25 12:47:30'),
(14, 'App\\Models\\User', 17, 'auth_token', 'e56797663eb879c731be2d4965d69b98fb001bb66e9e46e7b50ad344339e4909', '[\"*\"]', NULL, NULL, '2025-05-25 12:52:04', '2025-05-25 12:52:04'),
(15, 'App\\Models\\User', 17, 'auth_token', '3cc9c8c09f5e22cdde257e806c1d1c9d67b4f2a8bf6e7e0cb507e9df1eb4f1bc', '[\"*\"]', NULL, NULL, '2025-05-25 13:00:28', '2025-05-25 13:00:28'),
(16, 'App\\Models\\User', 17, 'auth_token', 'b2fb6540874a783442d4fa6e98d29dc427b002d86ad9763870e4c30cfd30793d', '[\"*\"]', NULL, NULL, '2025-05-25 13:26:45', '2025-05-25 13:26:45'),
(17, 'App\\Models\\User', 17, 'auth_token', '92b15b2b74c4e0b858f73f7e60a6e04336ecd7177e86627d56d1cd2c4f8dd50c', '[\"*\"]', NULL, NULL, '2025-05-25 13:27:08', '2025-05-25 13:27:08'),
(18, 'App\\Models\\User', 17, 'auth_token', 'ddbcde46cc1bf63983f1cee528dd7540f1941ade998cf9b19e57b5fcd9ec0c6f', '[\"*\"]', NULL, NULL, '2025-05-25 13:32:19', '2025-05-25 13:32:19'),
(19, 'App\\Models\\User', 17, 'auth_token', '5318205603a5f6af4731010f6adc31c2e272e3f1f540878618719d142aea7e9d', '[\"*\"]', NULL, NULL, '2025-05-25 13:34:19', '2025-05-25 13:34:19'),
(20, 'App\\Models\\User', 17, 'auth_token', 'b41ba89bb9dbb702594179cd4c34b6eccbe1a1aa385c95f9062116bd5c3d4e9a', '[\"*\"]', NULL, NULL, '2025-05-25 13:44:55', '2025-05-25 13:44:55'),
(21, 'App\\Models\\User', 17, 'auth_token', '214b5ab5263deec2e183daa23ee16c5e9741c2446ee0eaddfa4412083083c28d', '[\"*\"]', NULL, NULL, '2025-05-25 13:47:47', '2025-05-25 13:47:47'),
(22, 'App\\Models\\User', 17, 'auth_token', '9e517b7ffdece8a99b7976ede6b8b27acc6b6bdae9eefb60857524ed0c157205', '[\"*\"]', NULL, NULL, '2025-05-25 13:52:45', '2025-05-25 13:52:45'),
(23, 'App\\Models\\User', 17, 'auth_token', '45913fef5579264e162cfc49da1cb082c84ffa1b944a8a55f9b122522a9905f7', '[\"*\"]', NULL, NULL, '2025-05-25 13:57:03', '2025-05-25 13:57:03'),
(24, 'App\\Models\\User', 17, 'auth_token', '7f398cd5a4ac243522b79296c30fc375023c9af607207cab6230f50ad0bf7990', '[\"*\"]', NULL, NULL, '2025-05-26 01:19:44', '2025-05-26 01:19:44'),
(25, 'App\\Models\\User', 17, 'auth_token', '5344d013c382236b20688416bb33c7f28369abd055bac595a79da9b9612f7f55', '[\"*\"]', NULL, NULL, '2025-05-26 01:19:46', '2025-05-26 01:19:46'),
(26, 'App\\Models\\User', 17, 'auth_token', '462fe88ee1d8feb182e135edec19897238090744c2140686d2302a7b95c84322', '[\"*\"]', NULL, NULL, '2025-05-26 01:20:47', '2025-05-26 01:20:47'),
(27, 'App\\Models\\User', 17, 'auth_token', '3cdde6d62148fe4fffe38a3c888c1a7b76f75c75322f76a5760a6874f2ad8f54', '[\"*\"]', NULL, NULL, '2025-05-26 02:44:47', '2025-05-26 02:44:47'),
(28, 'App\\Models\\User', 17, 'auth_token', 'a9944575cf11166f1c5b98c3fd7691cba49cf1e73c9362db9a4fbbd5b18db427', '[\"*\"]', NULL, NULL, '2025-05-26 02:45:09', '2025-05-26 02:45:09'),
(29, 'App\\Models\\User', 17, 'auth_token', '133982c6bd2eea854e99be86d04b1fac32ff228051a606b79ad5e19431fc82c0', '[\"*\"]', NULL, NULL, '2025-05-26 02:45:21', '2025-05-26 02:45:21'),
(30, 'App\\Models\\User', 17, 'auth_token', 'f715acb1200c04d306ecdebe23a0faf65bb7240465fa1a5a82cc2881de02692d', '[\"*\"]', NULL, NULL, '2025-05-26 03:28:11', '2025-05-26 03:28:11'),
(31, 'App\\Models\\User', 18, 'auth_token', '69eab9c1cf7ccaba04a3367cedea6d45f016eaf0c779439dd5e8757ea928144e', '[\"*\"]', NULL, NULL, '2025-05-26 03:31:40', '2025-05-26 03:31:40'),
(32, 'App\\Models\\User', 18, 'auth_token', 'f6f70c8b524511a36b933fee9e06eb4104edba0bf8f96bbcbff1b9ad2948526f', '[\"*\"]', NULL, NULL, '2025-05-26 03:32:10', '2025-05-26 03:32:10'),
(33, 'App\\Models\\User', 17, 'auth_token', '488d309b04f0688acd1cd9e66b1c4fc598cdafe6f734d0b93b377ec5d414f7c5', '[\"*\"]', NULL, NULL, '2025-05-26 03:36:15', '2025-05-26 03:36:15'),
(34, 'App\\Models\\User', 17, 'auth_token', '0532f2dcc9ccefabaac645c64010ea0afb86e1ee0fff6823485d655d2d9bd2f3', '[\"*\"]', NULL, NULL, '2025-05-26 03:37:31', '2025-05-26 03:37:31'),
(35, 'App\\Models\\User', 19, 'auth_token', 'ca84d9961c3897208b36696abe44fa54c363bbf28c8bc4d14690eeb21cf0e5e3', '[\"*\"]', NULL, NULL, '2025-05-26 03:41:32', '2025-05-26 03:41:32'),
(36, 'App\\Models\\User', 19, 'auth_token', '0a6371b8df5e9f756ec97d811b09a411214f3dc05cf9af00f9ee8108fa07c019', '[\"*\"]', NULL, NULL, '2025-05-26 03:41:43', '2025-05-26 03:41:43'),
(37, 'App\\Models\\User', 17, 'auth_token', 'b9d644269a2feda0c1eec5bd07794cec52c856a75910351ccb41425d9d1e628e', '[\"*\"]', NULL, NULL, '2025-05-26 03:44:41', '2025-05-26 03:44:41'),
(38, 'App\\Models\\User', 20, 'auth_token', '39ad6976c9fda70a671a974a50ac266723bccdbb172405ed4fa9446fc617bbfc', '[\"*\"]', NULL, NULL, '2025-05-26 03:45:11', '2025-05-26 03:45:11'),
(39, 'App\\Models\\User', 20, 'auth_token', '875c4a719f2907164021724be8572c7c8bb905c2b71e7d648c91e6c016238056', '[\"*\"]', NULL, NULL, '2025-05-26 03:45:19', '2025-05-26 03:45:19'),
(40, 'App\\Models\\User', 17, 'auth_token', 'eea5501eb2b59b1b75d07b60c6b3d706389f73ad835cf426ce41939f6fec7768', '[\"*\"]', NULL, NULL, '2025-05-26 03:46:25', '2025-05-26 03:46:25'),
(41, 'App\\Models\\User', 17, 'auth_token', 'a5d6175b8e25ab370e9e18d9032a85c3dca91321763565a8904b9bb466da17e5', '[\"*\"]', NULL, NULL, '2025-05-26 03:46:29', '2025-05-26 03:46:29'),
(42, 'App\\Models\\User', 17, 'auth_token', '1ae65ecca0b36d2de36b5c1049cc603f10949fbfa83c6e7593ea8fe2e223007e', '[\"*\"]', NULL, NULL, '2025-05-26 03:47:20', '2025-05-26 03:47:20'),
(43, 'App\\Models\\User', 17, 'auth_token', 'bb2b59b0246142a7f1dc0b88177c51660c8b0a9b8024952e4c0b98d8a6a69e2a', '[\"*\"]', NULL, NULL, '2025-05-26 03:48:00', '2025-05-26 03:48:00'),
(44, 'App\\Models\\User', 17, 'auth_token', '5802b88073da9f68b0f13c32b1fa9e4b45819f4399d6b7fe63b590e1d3aff864', '[\"*\"]', NULL, NULL, '2025-05-26 03:48:54', '2025-05-26 03:48:54'),
(45, 'App\\Models\\User', 17, 'auth_token', '3ed0cb621bf85f9886ac31cc0188ae2f25b9ac2f1453273a6aac4d0950f0bd96', '[\"*\"]', NULL, NULL, '2025-05-26 03:53:50', '2025-05-26 03:53:50'),
(46, 'App\\Models\\User', 21, 'auth_token', 'c86c54bf2ec727c88f9c81e888c252b2dce2f08e0d78cbb48b85d3676ac40877', '[\"*\"]', NULL, NULL, '2025-05-26 03:55:49', '2025-05-26 03:55:49');

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
  `ip_address` varchar(45) DEFAULT NULL,
  `role` enum('admin','user','event_manager') NOT NULL DEFAULT 'user',
  `profile_image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `ip_address`, `role`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$1b0mzT.P.pVmi7.FuXaYVOjLWLwSncuaggZF1NKS3OR2OIYTRAl7y', NULL, 'admin', NULL, NULL, '2025-05-24 23:23:55', '2025-05-24 23:23:55'),
(2, 'Event Manager', 'event_manager@gmail.com', NULL, '$2y$12$JX.T.YjiAwdWa6314AwFO./o6rUDofbXhxKASpVLWImDzw7WN6P4y', NULL, 'event_manager', NULL, NULL, '2025-05-24 23:23:55', '2025-05-24 23:23:55'),
(3, 'User 1', 'user1@gmail.com', NULL, '$2y$12$/xfoJwIXsVFlOGVb36TRsOKCHYdEWYJ0icIt4gnQHtZbdJRAeidBK', NULL, 'user', NULL, NULL, '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(4, 'user 2', 'user2@gmail.com', NULL, '$2y$12$aFKLec/CimV4Y0cXEFLU3OrU2/8LfBTM8DUsEDhOjSCmugIOl/gFi', NULL, 'user', NULL, NULL, '2025-05-24 23:23:56', '2025-05-24 23:23:56'),
(15, 'adsassadas', 'arefinmojumder82adsassadas5@gmail.com', NULL, '$2y$12$u58yVPmGLBOgqYCTeTO2S.ybvjt96vlYPO/gNx3kkHKqRyuvwWBuK', '127.0.0.1', 'user', 'storage/profile_image/profile_image1748195783.jpg', NULL, '2025-05-25 11:56:24', '2025-05-25 11:56:24'),
(16, 'azhar', 'arefinmojumder825azhar@gmail.com', NULL, '$2y$12$M.CosTQJs9EqJ0RnUq7vXuPmilSSk5VDnalbP.q9Ds./q1SIXjGFC', '127.0.0.1', 'user', 'storage/profile_image/profile_image1748197229.jpg', NULL, '2025-05-25 12:20:29', '2025-05-25 12:20:29'),
(17, 'arefin', 'arefinmojumder825@gmail.com', NULL, '$2y$12$3025C2YHfnbDrwcv6oxK2.9xkv90Z3eAoG8IMN9VSHOV36WJr.D2e', '127.0.0.1', 'user', NULL, NULL, '2025-05-25 12:47:30', '2025-05-25 12:47:30'),
(18, 'dddd', 'teste@exemplo.us', NULL, '$2y$12$FiW78CIvlZc4tZt2xHpXXONwhXhsKve.0oXaz.qlC.dPo/WXEH7F6', '127.0.0.1', 'user', 'storage/profile_image/profile_image1748251899.PNG', NULL, '2025-05-26 03:31:40', '2025-05-26 03:31:40'),
(19, 'demo', 'adminhasan@gmail.com', NULL, '$2y$12$sbHmh/RvgIeqrNT4AMDLH.5Mlu6IO4kfMsKVASjRrHYk3l69tSDh2', '127.0.0.1', 'user', NULL, NULL, '2025-05-26 03:41:32', '2025-05-26 03:41:32'),
(20, 'rfd', 'arefinmojumder@gmail.com', NULL, '$2y$12$q.kWR.yksvAy.Tp5oJTBN.oU51vuTKegrVXo9Z79QE88zDYs5lWt2', '127.0.0.1', 'user', NULL, NULL, '2025-05-26 03:45:11', '2025-05-26 03:45:11'),
(21, 'dddddA', 'dddffgddrt@gmail.com', NULL, '$2y$12$HvS1SbQvl5MtSHDiyFQN9evmV1iHQe2uKD5Ffwyrxv58B0Pk9dpdm', '127.0.0.1', 'user', NULL, NULL, '2025-05-26 03:55:49', '2025-05-26 03:55:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_event_id_foreign` (`event_id`);

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
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notificatons`
--
ALTER TABLE `notificatons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notificatons_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notificatons`
--
ALTER TABLE `notificatons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notificatons`
--
ALTER TABLE `notificatons`
  ADD CONSTRAINT `notificatons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `inventory_db`
--
CREATE DATABASE IF NOT EXISTS `inventory_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inventory_db`;

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
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `slug`, `name`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'da781ac4-0186-4669-874c-8636dc107479', 'Azharul Islam', 'arefinmojumder825@gmail.com', '01640764896', 'Dhaka,Bangaladesh', 'active', '2025-05-02 19:16:34', '2025-05-03 11:39:24'),
(3, '71a56013-08f2-4bf6-8b2f-910b331e5834', 'Azharul Islam', 'Light@adminhasan', '01640764896', 'Dhaka,Bangaladesh', 'active', '2025-05-03 13:11:09', '2025-05-03 13:11:09'),
(4, '24097198-c9e8-4003-9a4b-b9c32dcdd265', 'Azharul Islam', 'arefinmojumder82225@gmail.com', '01640764896', 'Dhaka,Bangaladesh', 'inactive', '2025-05-03 13:11:19', '2025-05-03 13:11:19');

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
(6, '2025_05_02_213757_create_customers_table', 2),
(7, '2025_05_02_232820_create_orders_table', 3),
(8, '0001_01_01_000000_create_users_table', 4),
(9, '0001_01_01_000001_create_cache_table', 4),
(10, '0001_01_01_000002_create_jobs_table', 4),
(11, '2025_04_26_100905_create_products_table', 4),
(12, '2025_04_26_193613_create_personal_access_tokens_table', 4),
(13, '2025_05_03_005754_create_customers_table', 5),
(14, '2025_05_03_005852_create_orders_table', 6),
(15, '2025_05_03_005905_create_order_product_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `slug` char(36) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','featured') NOT NULL,
  `release_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category`, `price`, `stock_quantity`, `weight`, `dimensions`, `image`, `status`, `release_date`, `description`, `tags`, `created_at`, `updated_at`) VALUES
(5, 'Mula', 'mula-681618012be01', 'Books', 11.00, 45, 2.00, '10x10x12', 'product_images/gmbXEnjpkjCKOCLM0RrNOWF6HXQrC6ejBQaBtxtA.webp', 'active', '2025-05-03', NULL, '[\"new\",\"sale\"]', '2025-05-03 13:20:01', '2025-05-03 13:20:01'),
(7, 'Alu', 'alu-68161ba537171', 'Furniture', 22.00, 6, 5.00, '10x10x12', 'product_images/dfdaGobI86jQYEIVVyMJsa9L6OM3q3mX6YI0JAa9.webp', 'active', '2025-05-08', NULL, '[\"new\",\"sale\"]', '2025-05-03 13:35:33', '2025-05-03 13:35:33'),
(8, 'Mula', 'mula-681665ce247ec', 'Furniture', 33.00, 11, 22.00, NULL, 'product_images/O7pBlt8dupTItvQnRTJCSrew4T5dER8OhNcmjWrv.webp', 'featured', '2025-05-03', NULL, '[]', '2025-05-03 18:51:58', '2025-05-03 18:51:58'),
(9, 'Alu', 'alu-681cb34bb437d', 'Clothing', 99.00, 5, 90.00, '10x10x12', NULL, 'active', '2025-05-09', NULL, '[\"new\",\"bestseller\",\"sale\"]', '2025-05-08 13:36:11', '2025-05-08 13:36:11');

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
('4v5d5x9TTyIq5j0hqoreQRCv8qgsjosyWEnLn1By', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUDBKZGJubzZFelBNT2w3QzJURE9YQ1RnREtiYkJUb3o5YjVPRkRiaSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDA3Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwNy9wcm9kdWN0cy9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1746879891);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_hash` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `otp` varchar(4) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `verification_hash`, `email_verified_at`, `password`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', 'arefinmojumder825@gmail.com', '2f808294-8d9f-4d54-b296-1cb00f8e63cb', '2025-05-02 19:10:52', '$2y$12$1uTaCYEWOtNLYwG3Mn4Pguv1xGtECns3XV9SSOnBePVlRIFhAx.vi', NULL, NULL, '2025-05-02 19:08:39', '2025-05-10 12:21:32');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_slug_unique` (`slug`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_slug_unique` (`slug`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_verification_hash_unique` (`verification_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
--
-- Database: `laravel_form`
--
CREATE DATABASE IF NOT EXISTS `laravel_form` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravel_form`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('arefin_cache_5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1745935778),
('arefin_cache_5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1745935778;', 1745935778);

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
(6, '0001_01_01_000000_create_users_table', 1),
(7, '0001_01_01_000001_create_cache_table', 1),
(8, '0001_01_01_000002_create_jobs_table', 1),
(9, '2025_04_26_180948_create_personal_access_tokens_table', 1),
(10, '2025_04_29_121426_create_products_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','featured') NOT NULL,
  `release_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('T6aIM6d55wneHa0TLyClEs6GMbr7RPOlWPMP6ZDH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibTlWWjNCNGhITEdOQTNpam50bW9qVDBGbFZ4Tk5xazRtNGlJYmh6WSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1745937281),
('UeTqgMkojGZXDWmyaquiskBIIU8nmDk4jTJUImHN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjFYR2FaWnRqZnN6TnlPY2VYRW1MSUhPZG8zTVhJVW5GcVpJTnNKZCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDA4Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwOC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750697900);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_hash` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `role` enum('admin','user','event_manager') NOT NULL DEFAULT 'user',
  `otp` varchar(4) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `verification_hash`, `email_verified_at`, `password`, `ip_address`, `role`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', 'arefinmojumder825@gmail.com', '917df39a-dd2a-4316-b988-beae259a7e51', '2025-04-29 14:34:41', '$2y$12$C1w0R.92fhmfdMuWrclWsuaY1UHuz9MCgaptLrmdY4epxHtmzuy8e', '127.0.0.1', 'user', NULL, 'O3PP4oZXcrF6dijRVoRl0MHpX9ao7lnxhdh4JHD8g3G8wGtquRezcx21THOT', '2025-04-29 13:58:12', '2025-04-29 14:34:41'),
(2, 'Mouse', 'arefinmojumder82005@gmail.com', '112df75d-1db9-4ec9-ac54-c18f6d357664', NULL, '$2y$12$4kazCbP2JsSm6Pm0K9YcGu.DPZLdmC47/07dMM2z9gmJejObshUoK', '127.0.0.1', 'user', NULL, 'oc3WpEVQVmoTRH8BxMx71Y9JMZzfkHFzI2IMSX8gw6jgk42i4aHpLzQ86x1S', '2025-04-29 14:08:49', '2025-04-29 14:08:49');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_verification_hash_unique` (`verification_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `meal_management_db`
--
CREATE DATABASE IF NOT EXISTS `meal_management_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `meal_management_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('arefinmojumder825@gmail.com|127.0.0.1', 'i:1;', 1750511192),
('arefinmojumder825@gmail.com|127.0.0.1:timer', 'i:1750511192;', 1750511192),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:43:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"user-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"user-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"user-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:9:\"user-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"user-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:9:\"role-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"role-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:11:\"role-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:9:\"role-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"role-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"payments-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:13:\"payments-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:15:\"payments-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"payments-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:15:\"payments-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"payments-show\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:11:\"member-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:11:\"member-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:13:\"member-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:11:\"member-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:13:\"member-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"markets-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:12:\"markets-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:14:\"markets-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:12:\"markets-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:14:\"markets-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:10:\"meals-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:10:\"meals-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:12:\"meals-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:10:\"meals-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:12:\"meals-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:20:\"cooking_members-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:20:\"cooking_members-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:22:\"cooking_members-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:20:\"cooking_members-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:22:\"cooking_members-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:21:\"cooking_payments-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:21:\"cooking_payments-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:23:\"cooking_payments-create\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:21:\"cooking_payments-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:23:\"cooking_payments-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:19:\"monthlySummary-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:19:\"monthlySummary-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:6:\"Editor\";s:1:\"c\";s:3:\"web\";}}}', 1750582684),
('superadmin@dema.gmail.com|127.0.0.1', 'i:1;', 1750496126),
('superadmin@dema.gmail.com|127.0.0.1:timer', 'i:1750496126;', 1750496126);

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
-- Table structure for table `cooking_members`
--

CREATE TABLE `cooking_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cooking_payments`
--

CREATE TABLE `cooking_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cooking_member_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `breakfast` tinyint(1) NOT NULL DEFAULT 0,
  `lunch` tinyint(1) NOT NULL DEFAULT 0,
  `dinner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
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
(4, '2025_05_17_065143_create_permission_tables', 1),
(5, '2025_05_18_093214_create_members_table', 1),
(6, '2025_05_18_171252_create_payments_table', 1),
(7, '2025_05_18_181734_create_markets_table', 1),
(8, '2025_05_18_203539_create_cooking_members_table', 1),
(9, '2025_05_19_130318_create_cooking_payments_table', 1),
(10, '2025_05_19_194237_creaate_meals_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 3);

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-menu', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(2, 'user-list', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(3, 'user-create', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(4, 'user-edit', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(5, 'user-delite', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(6, 'role-menu', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(7, 'role-list', 'web', '2025-05-24 05:20:07', '2025-05-24 05:20:07'),
(8, 'role-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(9, 'role-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(10, 'role-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(11, 'payments-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(12, 'payments-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(13, 'payments-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(14, 'payments-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(15, 'payments-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(16, 'payments-show', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(17, 'member-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(18, 'member-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(19, 'member-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(20, 'member-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(21, 'member-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(22, 'markets-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(23, 'markets-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(24, 'markets-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(25, 'markets-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(26, 'markets-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(27, 'meals-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(28, 'meals-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(29, 'meals-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(30, 'meals-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(31, 'meals-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(32, 'cooking_members-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(33, 'cooking_members-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(34, 'cooking_members-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(35, 'cooking_members-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(36, 'cooking_members-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(37, 'cooking_payments-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(38, 'cooking_payments-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(39, 'cooking_payments-create', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(40, 'cooking_payments-edit', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(41, 'cooking_payments-delite', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(42, 'monthlySummary-menu', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(43, 'monthlySummary-list', 'web', '2025-05-24 05:20:08', '2025-05-24 05:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-05-24 05:20:09', '2025-05-24 05:20:09'),
(2, 'Editor', 'web', '2025-05-24 05:21:38', '2025-05-24 05:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(14, 1),
(14, 2),
(15, 1),
(16, 1),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(20, 1),
(20, 2),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(35, 1),
(35, 2),
(36, 1),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(40, 1),
(40, 2),
(41, 1),
(42, 1),
(43, 1);

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
('1O0imnc87ZXs6lY9gwCT6jIuMmRCs01B3Pcpsizs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'ZXlKcGRpSTZJbXQ0VnpsbldVRlZVVlU1Tm5kSmRWaE9UV2g1UTJjOVBTSXNJblpoYkhWbElqb2lUMnQxTDB4cE1qaE5XVU5vUjBRcmN6TkJZVXd3Vm5seWFHTTJkamhqY1ZORFRFcFBSRFJYVDAxMFVsZElhRzF1YUdOWGRVbFNVakphY25RM2VpOTBibmgxVGxCelZsUjVibmxIY0M4eFRVWTRjbXBHVlM5NFkxbFlTWGhuVVdGdVRHMTBXSEJXUTI5R2FsZDBaMEpTWW5CU2NVZzRWVkEyVlhaNVpEQnRiMjVUYkcxNFVHaGlUR0ZITkhrMmVrNHhVbkJxYjBsSVpGUkZSWHBuWWt4NGRGTm9XRXRGTTBvNVpIaHZQU0lzSW0xaFl5STZJamhpTkRjeU16VTBZamhpT0RWaFpXRTVNV0ZqTmpSbE5UZGhPVGRsWkRkbFpXSTNZalF3WmpBek1qUTROVEl4TURWaFptWXdOR1ZtWWpRNVpHSTVZak1pTENKMFlXY2lPaUlpZlE9PQ==', 1750492824),
('kgVg45EtDrzC0dROmzA5x5iJkh98rV96Dbqq95Li', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'ZXlKcGRpSTZJazlqVGxrMk9DdHZRV0Z2U0d4elFVMU9ZMG8xZW5jOVBTSXNJblpoYkhWbElqb2lSMlJtYW5wdFEwMDROemgxWTJKTVpra3JjSGRFYldwSWNXbG5OekJZVVhKMU1ubzVPRzl5YTNsWkwxbEVkRmxxTWtwT2FURTVRUzl3ZDI5MkswaDFhamxhTDFCblFqRnRZbmhCTjNsTFQwVm1TWHAwUjNodWNEWTVSSGw2VFRrM1QyaERkVFZCWVRJeU1UWlBOeXRXYzA1Nk5GUTVPVGhZWkVKM1EzUmtaa3hxTjFGcVdtbHdjMmRNVHpkTmQzbHZXRGR0VTBoWlFUUlBWbFp2TjI5YVlrZFNTSGd3UVRKSmVFbE5hVXBwU1hkNk4zaFdSVkptWmpCaFdEY3JhbTFaVUVZdlFXSnNkek5RWlZCbVlsVjBURzFEVDFveFJtaHZlbEIyV0daRlJFVnBUWEppWlVrMVlXOVBiWEZ6YVV3NU0wZ3lNVXRTY0RGM1drNVNiMGxKWlUwNUwyUjFjSGszVGxORWRWUXlNRFpGUTFkdlRISnNTMEZCYlV4cVlWRmpWVzVxYUhneU9UVTBjMFJxVVdJM1pIRjVUamcwU0VKTU16WnNiR04yTUdoelRUUTJiVWh1TDNsWFlVUmFkeTlvYlROeFN6WmhZWGN5TnpOdGFVZzVWVGt2Y0hGV1MybHZka280UFNJc0ltMWhZeUk2SW1Nek5EWm1ObVJqTm1VeFpEQmxNak5tTURjMk1UTTJZekEzTUdFME4yVTRObU16WkdKbFlqUmpZelExTlRBek4yVm1aRGswTkRjeVlUbG1ZakpsTVdZaUxDSjBZV2NpT2lJaWZRPT0=', 1750496925),
('TixJyBXko0trehVqRLpT4L6x7gGgJ6fIrtE56oAk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'ZXlKcGRpSTZJa1U1TkdwQ1oxTTVPRFJpUVVwV1FYQm9OSFZaSzBFOVBTSXNJblpoYkhWbElqb2lhVUZ1U0RjdlNrdzRjVXczV1hSNFEwZFdOREZLVkhOUlVYZDNabXB1TjNOV1lWbHZTa0ZGVEZWemEyMVVNbTgxTjJ4S0wwVnFRWGhwVFdGUmRGcEVMM2N3VkZJMWVUQmxSemR1VmtkalYxY3piVzR2T0ZKVWIyVnNRbGc0YUUwck1YbDVabVV6WjJoR1JERXZMMGhrTHpCdFNrVlpaVVZOVEdWTk9GbGlXVXRuYUM4eVEwdGlRbXRMWjBOMU1IUkVhRWxKYW0xNGNTc3hOMGt5Ukc4emNUVkhlUzlzV0dFeVMxQjVOMmt4ZVZsemQxSm1SRll3WVdwU2RGSTNTbXBoWmxaMU5EaFhUek1yVDI0dlJESmxWalJNZUVGR1VVTXZlR2xqVEVZek5FcEpiM2xoV0VSdVNrbEtlalpuUzJ0T2NXaDBibTFYVWxsRGNqZDRaSEZPU2tWaGFGWlRZMFk0YjNneVVuUm9RbWR2T0RWM1VtYzlQU0lzSW0xaFl5STZJalJqWVRBek16bG1ZbUZoTUdZeFpEUTNOV1UyTWpVNVkyWTNZbUZqTkRNNE9HRTRaREl6TXpkbE1tWmlORFk1TkRnMlltSm1PV1V4TldJNU16VXhPREFpTENKMFlXY2lPaUlpZlE9PQ==', 1750496066),
('xCrnxQjYoA5n2xMiERyiAGAaqzTzjXDx2vi0azA9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'ZXlKcGRpSTZJbkJKVFVSSE9VSlhkRzVOVFdkWlVXMUhjVVYzUjBFOVBTSXNJblpoYkhWbElqb2lRVnB6ZUVsRVIyTkpUR1ozYmtaU1NIRlRUMGxtTDNKVlozTnFTVlZTZW5OUFlscElhak5vYlhCVE5XaERSbGRGTTJWQlJtbFpkVGRuT0UxVGJYQmhhSGQzVDB0RFRYWk1jbGxGV1VWTGJqUkRNVGd6Y21KRWQyNHpSV2RMT0ZsQ2JEVjZTbXROTlhKcVVtcHJWVTVDVjFOdVJHUkxObVpuSzFrd1JYWktNRXQxTm01U2NuZGtXR056ZG5sNVZtcHRURWxoUTFKYVpHTkNRM1pCVGs5TU56TnJTME5GUTNwNWFVVlNXSFpIUmt0UFlYaHVPRVUwT1RKWVJYbGFlVWhSVEM5bFQyZEpkelkyTkc1VlNIaFpURkJuWnpOeVNXRnRaamhHUWs5UVVrUlJkVGQyWm5wTVRtRnFObEJGYVhsWlFYZExSVU5oTUd4V2RuQkphWFZQU0V0WE16bFlUVlExWXpOTVl5OUJWR1JSV0VrMWJsTmFhWGxxTDFacFpWcFhZVUUyT1dsMFdtSjBXV1JJYmxsU1pFcFBZVzlTT0ZGMVYxUkxLMGx2YWtORWJVOVlLMVpxVFdaMVZVZENUemd3VjBwbGMwaFFXbVYxVW5kV01YZHRRMncwV2xoQlYxcDNVRmRqUFNJc0ltMWhZeUk2SW1aak5UUXhOVEE0WmpKbVkyUmlPVEUzTjJZd056ZzFOelpsWkRnME1HVmlZVEJpTkRneU5HVmlOR0ptTWpRME1EWXhNV1UxTURRMVlqa3lOamhpTkdFaUxDSjBZV2NpT2lJaWZRPT0=', 1750511363);

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
(1, 'Super Admin', 'superadmin@gmail.com', NULL, '$2y$12$E7A2F7WMMlvRXnJ9DtaK3eKiKN63EprscM/Ngy6ANB3Clcn304I9q', 'CK5GHwUh0Kg9YCycxj17aNtmLqOep6dhXphpjJQjH7BPyWT7Uyji0h9GTb2V', '2025-05-24 05:20:08', '2025-05-24 05:20:08'),
(2, 'Admin', 'admin@dema.gmail.com', NULL, '$2y$12$A0Eof7iyE5qxwzs5pBOYJeoIGde8cJTmeV7eEvY3j.QFn9ZKcfqUK', NULL, '2025-05-24 05:20:09', '2025-05-24 05:20:09'),
(3, 'Demo', 'demo1@gmail.com', NULL, '$2y$12$3zknH5N0HT9pRCksO0j6buivnjL96Ep8GU0BmzZ6cm.arZCGP.ZuC', NULL, '2025-05-24 05:22:02', '2025-05-24 05:28:00');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `cooking_members`
--
ALTER TABLE `cooking_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cooking_payments`
--
ALTER TABLE `cooking_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cooking_payments_cooking_member_id_foreign` (`cooking_member_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `markets_member_id_foreign` (`member_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meals_member_id_foreign` (`member_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_member_id_foreign` (`member_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `cooking_members`
--
ALTER TABLE `cooking_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cooking_payments`
--
ALTER TABLE `cooking_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cooking_payments`
--
ALTER TABLE `cooking_payments`
  ADD CONSTRAINT `cooking_payments_cooking_member_id_foreign` FOREIGN KEY (`cooking_member_id`) REFERENCES `cooking_members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `markets`
--
ALTER TABLE `markets`
  ADD CONSTRAINT `markets_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `meals_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
--
-- Database: `mosjid_db`
--
CREATE DATABASE IF NOT EXISTS `mosjid_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mosjid_db`;

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
('3GcMHEdCGGTqjOMk1n6MZovaT4krnlyA6KXsoeXJ', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoickhsRkNheDdxeW81ZzNmSWVRSFZFUFU1aDlrTVN0TnRBRG5DcFp0aCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO30=', 1750761961),
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
--
-- Database: `myapp_db`
--
CREATE DATABASE IF NOT EXISTS `myapp_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myapp_db`;

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `about_image` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `cv_file` varchar(255) DEFAULT NULL,
  `hire_me_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `title`, `description`, `education`, `phone`, `email`, `about_image`, `experience`, `cv_file`, `hire_me_link`, `created_at`, `updated_at`) VALUES
(3, 'How is Me ?', 'আমি একজন প্যাশনেট ফুল স্ট্যাক ওয়েব ডেভেলপার। ৫ বছরের বেশি অভিজ্ঞতা নিয়ে আমি বিভিন্ন ধরনের ওয়েব অ্যাপ্লিকেশন ডেভেলপ করেছি। আমার কাজের মধ্যে রয়েছে ই-কমার্স সাইট, ব্যবস্থাপনা সিস্টেম, এবং কাস্টম ওয়েব অ্যাপ্লিকেশন।\r\n\r\nআমি বিশ্বাস করি কোড শুধু কাজ করলেই হবে না, এটি সুন্দর, দক্ষ এবং রক্ষণাবেক্ষণযোগ্য হতে হবে। আমি সর্বদা নতুন প্রযুক্তি শিখতে এবং আমার দক্ষতা উন্নত করতে আগ্রহী।', 'BBA Accounting National University', '+880 1640 764896', 'arefinmojumder825@gmail.com', 'about_images/tEZCYQNcQvG3nGxecSwIfaMgioTXDT2JuDfCq2bm.jpg', 'Full_Stack Web Developer', 'cv_files/6OGPhmOQWUbRuf4tkAgGNzHPrx976uevqaqWJyoc.doc', NULL, '2025-05-28 07:30:08', '2025-05-28 07:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('demo1@gmail.com|127.0.0.1', 'i:1;', 1748336883),
('demo1@gmail.com|127.0.0.1:timer', 'i:1748336883;', 1748336883);

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
-- Table structure for table `hero_sections`
--

CREATE TABLE `hero_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `cv_download_link` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `github_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hero_sections`
--

INSERT INTO `hero_sections` (`id`, `name`, `title`, `short_description`, `cv_download_link`, `profile_image`, `github_link`, `linkedin_link`, `twitter_link`, `created_at`, `updated_at`) VALUES
(2, 'Azharul Islam', 'Azharul Islam  Arefin Mojumder', 'Azharul Islam  Arefin Mojumder hiii', '/storage/cvs/vMrGA2GIQCwEbKBmAvOytEdxjsWknYNjXMjTzfAv.doc', '/storage/profile_images/aCfAkW3TGntO2VLQG7unFhWffB3pNBHxh3WxLvyK.jpg', NULL, NULL, NULL, '2025-05-27 16:09:04', '2025-05-27 16:17:32');

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
(4, '2025_05_26_115634_create_permission_tables', 1),
(5, '2025_05_27_201454_create_hero_sections_table', 2),
(6, '2025_05_28_115959_create_projects_table', 3),
(7, '2025_05_28_121215_create_abouts_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 3);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-menu', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(2, 'user-list', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(3, 'user-creat', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(4, 'user-edit', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(5, 'user-delite', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(6, 'role-menu', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(7, 'role-list', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(8, 'role-creat', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(9, 'role-edit', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(10, 'role-delite', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(11, 'product-menu', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(12, 'product-list', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(13, 'product-creat', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(14, 'product-edit', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(15, 'product-delite', 'web', '2025-05-26 06:07:07', '2025-05-26 06:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-05-26 06:07:08', '2025-05-26 06:07:08'),
(2, 'Azharul Islam', 'web', '2025-05-26 13:30:05', '2025-05-26 13:30:05'),
(3, 'Mouse', 'web', '2025-05-26 13:34:19', '2025-05-26 13:34:19'),
(4, 'pizza', 'web', '2025-05-26 13:34:42', '2025-05-26 13:34:42'),
(5, 'Azharul Islam1', 'web', '2025-05-26 13:35:01', '2025-05-26 13:35:01'),
(7, 'aarafen12@gma', 'web', '2025-05-26 13:36:31', '2025-05-26 13:47:13'),
(8, 'demo', 'web', '2025-05-27 03:09:18', '2025-05-27 03:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 7),
(3, 8),
(4, 1),
(4, 3),
(4, 4),
(4, 7),
(4, 8),
(5, 1),
(5, 3),
(5, 4),
(5, 5),
(5, 7),
(6, 1),
(6, 3),
(6, 4),
(7, 1),
(7, 3),
(7, 4),
(7, 5),
(7, 7),
(8, 1),
(8, 4),
(9, 1),
(9, 4),
(9, 5),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(13, 8),
(14, 1),
(14, 4),
(14, 8),
(15, 1),
(15, 4);

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
('5Yo6c5zIAeLVVpB0tuIAY2nGTH4cJxQChXXXW83W', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTXpOT1RBdHVzRGFGUnVLS3Iwa2hJTThLNU9yU1MyemVaczlpeFk0aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9hYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1748439939),
('BCq3OZOmtwHs3uiCKijwFUrGggN3k8XvY4cAdRo0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR3M3akNJNXdKa1o2QWZza0tYVkhJcVFlU01UNno0MEkyVERGVmtmZSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2hvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748449079);

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
(1, 'Super Admin', 'superadmin@dema.gmail.com', NULL, '$2y$12$39CEKUXJTdm9bfuSAj7oXOy96yTiw/coDefQ48kgOvEBFvk/oBJUm', 'i9EbxI8BGRKoIVFHREfvh952AAvZQbWiJoP86yc0ClVDvzyJJnRR13NNHxUm', '2025-05-26 06:07:07', '2025-05-26 06:07:07'),
(2, 'Admin', 'admin@dema.gmail.com', NULL, '$2y$12$J.Vqhai2QLQXaFV4rwWXaerXRMt4dX12aGyZ9PDQELFODrHAS0i5e', 'dV0oYsxtOtcz0n0TmsELrGI5rWGqQLEcRYVhOuEIuzdJZ3w8QIlULBFfOHoI', '2025-05-26 06:07:08', '2025-05-26 06:07:08'),
(3, 'Azharul Islam', 'admin@dema11.gmail.com', NULL, '$2y$12$4oT3USwDagedqZEa37taBe9EeBX9wam7t1d0ShWxvtfuov0fUbmzW', NULL, '2025-05-26 14:08:27', '2025-05-26 14:08:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hero_sections`
--
ALTER TABLE `hero_sections`
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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hero_sections`
--
ALTER TABLE `hero_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
--
-- Database: `myproject_db`
--
CREATE DATABASE IF NOT EXISTS `myproject_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myproject_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('aarafen12@gmail.com|127.0.0.1', 'i:1;', 1748262276),
('aarafen12@gmail.com|127.0.0.1:timer', 'i:1748262276;', 1748262276),
('arefinmojumder825@gmail.com|127.0.0.1', 'i:1;', 1747548547),
('arefinmojumder825@gmail.com|127.0.0.1:timer', 'i:1747548547;', 1747548547),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:15:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"user-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:9:\"user-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"user-creat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:9:\"user-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"user-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:9:\"role-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"role-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:10:\"role-creat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:9:\"role-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"role-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:5;i:3;i:6;i:4;i:7;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"product-menu\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:7;i:6;i:8;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:12:\"product-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:7:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:7;i:6;i:8;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:13:\"product-creat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"product-edit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:14:\"product-delite\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;}}}s:5:\"roles\";a:8:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:13:\"Azharul Islam\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:6:\"Editor\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:16:\"DESKTOP-CL8CE9Q1\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:22:\"Azharul Islam  Arefin1\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:13:\"All Permition\";s:1:\"c\";s:3:\"web\";}i:6;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:4:\"view\";s:1:\"c\";s:3:\"web\";}i:7;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:4:\"user\";s:1:\"c\";s:3:\"web\";}}}', 1748357496);

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
(4, '2025_05_13_131524_create_permission_tables', 1),
(5, '2025_05_16_134614_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 5),
(7, 'App\\Models\\User', 5),
(8, 'App\\Models\\User', 6);

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-menu', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(2, 'user-list', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(3, 'user-creat', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(4, 'user-edit', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(5, 'user-delite', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(6, 'role-menu', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(7, 'role-list', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(8, 'role-creat', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(9, 'role-edit', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(10, 'role-delite', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(11, 'product-menu', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(12, 'product-list', 'web', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(13, 'product-creat', 'web', '2025-05-16 12:14:27', '2025-05-16 12:14:27'),
(14, 'product-edit', 'web', '2025-05-16 12:14:27', '2025-05-16 12:14:27'),
(15, 'product-delite', 'web', '2025-05-16 12:14:27', '2025-05-16 12:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2025-05-16 12:14:27', '2025-05-16 12:14:27'),
(2, 'Azharul Islam', 'web', '2025-05-16 12:15:33', '2025-05-16 12:15:33'),
(3, 'user', 'web', '2025-05-16 12:16:11', '2025-05-16 12:16:11'),
(4, 'Editor', 'web', '2025-05-16 12:17:20', '2025-05-16 12:17:20'),
(5, 'DESKTOP-CL8CE9Q1', 'web', '2025-05-17 13:56:21', '2025-05-17 13:56:21'),
(6, 'Azharul Islam  Arefin1', 'web', '2025-05-17 13:56:39', '2025-05-17 13:56:39'),
(7, 'All Permition', 'web', '2025-05-17 15:19:54', '2025-05-17 15:19:54'),
(8, 'view', 'web', '2025-05-18 00:09:12', '2025-05-18 00:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 5),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 1),
(5, 2),
(5, 7),
(6, 1),
(6, 2),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(7, 1),
(7, 2),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(8, 1),
(8, 2),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(9, 1),
(9, 2),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(10, 1),
(10, 2),
(10, 5),
(10, 6),
(10, 7),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 7),
(11, 8),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 7),
(12, 8),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 7),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 7),
(15, 1),
(15, 2),
(15, 3),
(15, 7);

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
('4HcInu33qn4Eq5RfJPtyIK5BBDPoPRkrCDspfspf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS01Gczh6bzExQjdHdlR4RERhQXpuUDliRllVRmZrVTNMMGt0SWZZViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748259481),
('atceSIsx1I4ey5aCJbRPjBtFzvL9V8zVvT6crU2I', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQWVoeWFIcTlTbUlOTldEeE9rUEJ3NTRUUDlXZnNFa1Q5V3B0bWZRaCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNDoiaHR0cDovLzEyNy4wLjAuMTo4MDkwL3JvbGVzL2NyZWF0ZSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwOTAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748285798),
('DTD6RPji2SJvLrL4ZlV35QTVYccVwXRpcaTPPhEv', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN0RLQWphVTdDYTdFanNnM0tGTWo5eU4xVWU1d2J5djlnTjVtTFhtcyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwOTAvcm9sZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1748279751),
('HF89nDIPvSnWyALEn0jz3nQRq9hY5GGq1E4lQqXv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblhaU0VteXFWN1JiWUVDd0E4VFlUVXBhY012SWlUWWxPQVFlVHJLViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748262217),
('lqTtiVpFGzcplILpRm0DBOAca9HY7U6MWyCGVUxi', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoienVNQ2lYS1kyRmNldHZLTW1kOTFhbkROekNjMVpFeVRRbjd0OFVMRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1748271096),
('MOkRhQeIHfnIGZ1EUWLr2Vex7hJGv5HskygVhiqU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid1ZJWjVCS09aSVMyeVFaa1M5ZG1WM0Y4UmQ3b0dwRXdNa0I4OEJtYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748259973),
('OAFEvmT4qqcDamcjAWkuwWYsPVXBi96MLNl52VG7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZWU3TWxOd2NGR2JZWHZsRDlyZjhJYmZHZFFhblVoc3VpeDdBaUtvciI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovLzEyNy4wLjAuMTo4MDkwL2xvZ291dCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwOTAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748286658),
('OQ7vK2H5ByBMwHXbbIMIpqDMFKOULZzl4dKaj3VU', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNm1jQ1U0MnpVYVVNcDhyNlBFNXR0TUFKRjFvYVNnQVY2Q0t5ZGdwdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9yb2xlcy9jcmVhdGUiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1748286408),
('SbVu4bCgNsazhsdcp35J1WaoNC3WoHItZ6mpFwN4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1ZNVU5XQlVGRkh6YU5WUWlJTVl3RFFCcFpRVTd2M013MGpxZEdiSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748292831),
('wvcXiyLG8m2UOq1J4BjuJeKc45GkZRpOZauJU6mp', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWFNEU21pSUx2OG5vYzg0cjlMdElmV2tXOGdBa0ZQTXJpcnZiZ0hmNiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDkwL3VzZXJzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748276898),
('xgABwdmHQy0JdFFa766foPAhneaYhi9fkV3gbncw', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRTlVU2lnZ0JrUnQ4MGxWdk53ZjFZQ0t3N3dwam92SXFhQ1lvemxZeCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwOTAvcm9sZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1748278775),
('yQFYcF83ymtxBJ05xDuW3vypgv6MjQRaAzXWKNfz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUhEMzBjOUMxUG5mQ2ZhNDhBMkwyeHp3NDFtcFp6UExJeTJ3THZVbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748292777),
('zaaO3bhPZwDrHOBhUAlLouSoODeJJD0mvlPAJGCp', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVhrckdWQ0pvZWdjbHBHUUVPYjV2SWZoeXptUm9hWDNuRUsxS2U5byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9yb2xlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1747548623);

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
(1, 'Test User', 'test@example.com', '2025-05-16 12:14:26', '$2y$12$uWR/l.XgJYWJdwAUOz8rz.83xZuOv7SMKJV.9Ncme1jMtgU9Cpbjm', 'VUGoMSNvJH', '2025-05-16 12:14:26', '2025-05-16 12:14:26'),
(2, 'Super Admin', 'superadmin@dema.gmail.com', NULL, '$2y$12$4bB7R9aM7/KEZ3EBcrYXRu6viIf9L9OKNrykbAgoTyAezuG/DNIF2', 'wpu4TAEFYdaCZVbqbXCVKdZVV1gCqfCqz0Vw2xGQHSW0A01din652L9ICSy8', '2025-05-16 12:14:27', '2025-05-16 12:14:27'),
(3, 'Admin', 'admin@dema.gmail.com', NULL, '$2y$12$xt.n2bkzOKDy0sEmFxajI.pue4lyRDPHWGGuL28hpJtsKyxkTCEmC', NULL, '2025-05-16 12:14:27', '2025-05-16 12:14:27'),
(5, 'Azharul Islam  Arefin Mojumder', 'arefinmojumder825@gmail.com', NULL, '$2y$12$0fX1zjTE20bSgrIwAWsOmOzsSwcGXAN/m0HUhTxjrJn4Gky4xMYP.', NULL, '2025-05-17 15:21:07', '2025-05-17 15:21:07'),
(6, 'Demo1', 'demo1@gmail.com', NULL, '$2y$12$h09AxlOJZXqSL3oXJA/Lg.K2QvC94S2FwSo/N401ejj6wlTPzcTom', '08MVxsJz3C6XDW2bM8QuiHSLH6njmzqJxO1A2ldR7USURrhTirEkt0CkgiC6', '2025-05-18 00:09:57', '2025-05-18 00:09:57');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
--
-- Database: `office_app_db`
--
CREATE DATABASE IF NOT EXISTS `office_app_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `office_app_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba', 'i:3;', 1748081190),
('laravel_cache_5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1748081190;', 1748081190);

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
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `motherboard` varchar(255) NOT NULL,
  `processor` varchar(255) NOT NULL,
  `operating_system` varchar(255) NOT NULL,
  `last_update` date DEFAULT NULL,
  `last_update_details` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `computers`
--

INSERT INTO `computers` (`id`, `user_id`, `assigned_to`, `name`, `model`, `ram`, `storage`, `motherboard`, `processor`, `operating_system`, `last_update`, `last_update_details`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Azharul Islam', 'Azharul Islam', 'Lenovo', '8.00 GB', '256', 'gigabyte-932F44', 'Intel(R) Core(TM) i5-4300M CPU @ 2.60GHz   2.60 GHz', 'windows', '2025-05-01', NULL, NULL, '2025-05-24 04:08:03', '2025-05-24 04:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `cook_payments`
--

CREATE TABLE `cook_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cook_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `daily_rate` decimal(10,2) NOT NULL,
  `days` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `electrical_equipments`
--

CREATE TABLE `electrical_equipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('fan','light','ac','printer','other') NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `electrical_equipments`
--

INSERT INTO `electrical_equipments` (`id`, `user_id`, `type`, `model`, `purchase_date`, `last_update`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'fan', 'LG', '2025-05-01', NULL, NULL, '2025-05-24 04:09:46', '2025-05-24 04:09:46');

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
-- Table structure for table `markets`
--

CREATE TABLE `markets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `meal_member_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `breakfast` tinyint(1) NOT NULL DEFAULT 0,
  `lunch` tinyint(1) NOT NULL DEFAULT 0,
  `dinner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`id`, `user_id`, `meal_member_id`, `date`, `breakfast`, `lunch`, `dinner`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-05-01', 0, 0, 1, '2025-05-12 06:32:15', '2025-05-12 06:32:15'),
(2, 1, 1, '2025-05-09', 1, 0, 0, '2025-05-12 06:42:01', '2025-05-12 06:42:01'),
(3, 2, 3, '2025-05-02', 1, 1, 1, '2025-05-12 06:46:06', '2025-05-12 08:47:51');

-- --------------------------------------------------------

--
-- Table structure for table `meal_members`
--

CREATE TABLE `meal_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_members`
--

INSERT INTO `meal_members` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'arefin', 1, '2025-05-12 05:47:57', '2025-05-12 05:47:57'),
(2, 'arefin', 1, '2025-05-12 06:37:55', '2025-05-12 06:37:55'),
(3, 'Azharul Islam', 2, '2025-05-12 06:45:48', '2025-05-12 06:45:48'),
(4, 'pizza', 2, '2025-05-12 08:25:42', '2025-05-12 08:25:42');

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
(4, '2025_05_11_043018_create_computers_table', 1),
(5, '2025_05_11_085911_create_monitors_table', 1),
(6, '2025_05_11_123817_create_upses_table', 1),
(7, '2025_05_11_155846_create_electrical_equipments', 1),
(8, '2025_05_12_052020_creat_meal_members_creat', 1),
(9, '2025_05_12_052150_create_meals_table', 1),
(10, '2025_05_12_052438_creat_markets_table', 1),
(11, '2025_05_12_052515_creat_cook_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monitors`
--

CREATE TABLE `monitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `model` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monitors`
--

INSERT INTO `monitors` (`id`, `user_id`, `assigned_to`, `model`, `size`, `resolution`, `purchase_date`, `last_update`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Azharul Islam', 'LG', '21', '60gh', '2025-05-01', NULL, NULL, '2025-05-24 04:08:48', '2025-05-24 04:08:48');

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
('3gGscA1rmmRVieFp5q0e1MFczwWHtL1lFqVXut6i', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlBSYWY1RnhEVWpESDVCYW9HSldBYmtWZGlpRlA2bGwzbjFjR1FpWSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1747061647),
('ah2u4gM7usELhoeNuanBlSZjDrbHS0Clrq14SJR7', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ2MycG0wWUg1Mk8xSGFJUDZVVFp3MFlXVDRZR0FLdUR3dEJXVVl1aCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL21lYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747071362),
('KLP94b5fAc7Bg5PtZAvs2F3UHGlSLsOxOqG8YREi', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmtJNlZqekJjTzNrUlpSTWp3MnNyQlR6bkZIdTZmMEhoZjBTTTIxTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODA5MC9jb21wdXRlciI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1748081402),
('kTe2nw01xCcvTE3npVBmaFFCHy2gGGGXgmM8RyI8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSk9RQUE1SFV0bUVHU3lRcjd4SzQyNGlPRTNndG8yd3h4YUVKTGFFcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDkwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748081067),
('OggXz2TlamQxlAMicVjj1yXgIXhisJOJ0MdjlmTf', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWlZ2VkhZdXBmOE5pWFEzcTRMeDQ3Q3VEd0xJOU1PMVc0UjMyM0JSRyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL21lYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1747061378),
('ohXvK92hiy32r8mUtNDWl8ubnSYR2onCfdOKpUq1', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYTVlRmY5WnExOGZ5N1Z3YkVETW95aFh6dUxFQXNXclpod0JZcHdPMyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2VtYWlsLzE2NThmMDI2LTMxOTMtNGFlZS04NWRiLWYzZTQ4NDY3ZDhhMi92ZXJpZnkiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozNDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL21lYWxzLzEvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1747060579),
('WRVJnEI1me7GinsarhefENfA1jKiFig8h9aDq9qZ', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaEZpQklOdFJFd2p4MG1nYTlLZ0oyVmg4anU0TXEzYnp0Qm5iaFNGUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL21lYWxzL2NyZWF0ZSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbWVhbHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1747053967);

-- --------------------------------------------------------

--
-- Table structure for table `upses`
--

CREATE TABLE `upses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `model` varchar(255) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `last_update_details` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upses`
--

INSERT INTO `upses` (`id`, `user_id`, `assigned_to`, `model`, `capacity`, `purchase_date`, `last_update`, `last_update_details`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Azharul Islam', 'Value-Top', '650v', '2025-05-01', NULL, NULL, NULL, '2025-05-24 04:09:22', '2025-05-24 04:09:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_hash` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `company_name` text NOT NULL,
  `otp` varchar(4) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `verification_hash`, `email_verified_at`, `password`, `company_name`, `otp`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', 'accademy1378@gmail.com', '1658f026-3193-4aee-85db-f3e48467d8a2', '2025-05-12 05:47:19', '$2y$12$GfQmwI1jgfICF.sLyYo.t.aljlg7BxpCGu9aaesviAgxQuZKhOQFq', 'ltd', NULL, 'nfDJGAzx5cLqywvqXlNjmT4hb0G69aC7E9qDFCJFQO9d409mxZDYSzuudiMO', '2025-05-12 05:46:28', '2025-05-12 05:47:19'),
(2, 'arefin', 'arefinmojumder825@gmail.com', '878e5e4b-5376-4fa9-9ffd-458b7420aa6f', '2025-05-12 06:35:15', '$2y$12$.MVfjEIuAOe5qfX6VniRa.mnl5LeVq8WgwVHyOqLPbncJxRNKrdoq', 'Ltd', NULL, 'oeW0NPWuamVXaRoGR2oZZ3oHLFNhpj7PBDFFSRyYP3wiKMQ15OV74V3WvaFL', '2025-05-12 06:33:27', '2025-05-12 06:35:15');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computers_user_id_foreign` (`user_id`);

--
-- Indexes for table `cook_payments`
--
ALTER TABLE `cook_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cook_payments_cook_id_foreign` (`cook_id`);

--
-- Indexes for table `electrical_equipments`
--
ALTER TABLE `electrical_equipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `electrical_equipments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `markets`
--
ALTER TABLE `markets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `markets_user_id_foreign` (`user_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meals_user_id_foreign` (`user_id`),
  ADD KEY `meals_meal_member_id_foreign` (`meal_member_id`);

--
-- Indexes for table `meal_members`
--
ALTER TABLE `meal_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monitors`
--
ALTER TABLE `monitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monitors_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `upses`
--
ALTER TABLE `upses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upses_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_verification_hash_unique` (`verification_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `computers`
--
ALTER TABLE `computers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cook_payments`
--
ALTER TABLE `cook_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `electrical_equipments`
--
ALTER TABLE `electrical_equipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `markets`
--
ALTER TABLE `markets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meal_members`
--
ALTER TABLE `meal_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `monitors`
--
ALTER TABLE `monitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `upses`
--
ALTER TABLE `upses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `computers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cook_payments`
--
ALTER TABLE `cook_payments`
  ADD CONSTRAINT `cook_payments_cook_id_foreign` FOREIGN KEY (`cook_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `electrical_equipments`
--
ALTER TABLE `electrical_equipments`
  ADD CONSTRAINT `electrical_equipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `markets`
--
ALTER TABLE `markets`
  ADD CONSTRAINT `markets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `meals_meal_member_id_foreign` FOREIGN KEY (`meal_member_id`) REFERENCES `meal_members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_members`
--
ALTER TABLE `meal_members`
  ADD CONSTRAINT `meal_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `monitors`
--
ALTER TABLE `monitors`
  ADD CONSTRAINT `monitors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `upses`
--
ALTER TABLE `upses`
  ADD CONSTRAINT `upses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'migrations', 'table', 'office_app_db', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"mosjid_db\",\"table\":\"mosque_settings\"},{\"db\":\"mosjid_db\",\"table\":\"home_banners\"},{\"db\":\"mosjid_db\",\"table\":\"cache_locks\"},{\"db\":\"mosjid_db\",\"table\":\"cache\"},{\"db\":\"mosjid_db\",\"table\":\"announcements_tables\"},{\"db\":\"mosjid_db\",\"table\":\"about_mosques\"},{\"db\":\"task_manager\",\"table\":\"tasks\"},{\"db\":\"task_manager\",\"table\":\"users\"},{\"db\":\"mosjid_db\",\"table\":\"contact_messages\"},{\"db\":\"mosjid_db\",\"table\":\"gallery_items\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'laravel_form', 'users', '{\"sorted_col\":\"`users`.`verification_hash` ASC\"}', '2025-05-08 09:46:29'),
('root', 'pos', 'users', '{\"sorted_col\":\"`users`.`otp` DESC\"}', '2025-05-07 17:00:04'),
('root', 'sells_inventory_db', 'users', '{\"sorted_col\":\"`users`.`otp` DESC\"}', '2025-05-10 05:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-06-24 10:45:14', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `porter_api_db`
--
CREATE DATABASE IF NOT EXISTS `porter_api_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `porter_api_db`;

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
(4, '2025_06_22_190018_create_tasks_table', 1);

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
('rD5pjh2q8tlADl5FNcdHwf804WEAuOp5TdnodCoG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidFBGMUV0RFM2azJiaFpzVGF3NmlwS1VBazBkUWs3Z3dabU1lMzdweCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1750621012);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `category` enum('work','personal','education','health') DEFAULT NULL,
  `deadline` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `progress` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `pos`
--
CREATE DATABASE IF NOT EXISTS `pos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pos`;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `pos_old`
--
CREATE DATABASE IF NOT EXISTS `pos_old` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pos_old`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Foods', 1, '2025-05-31 00:28:26', '2025-05-31 00:28:26'),
(2, 'food', 2, '2025-05-31 00:55:46', '2025-05-31 00:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', 'arefinmojumder825@gmail.com', '01640764896', 1, '2025-05-31 00:28:18', '2025-05-31 00:28:18'),
(2, 'Azharul Islam', 'arefinmojumder825@gmail.com', '01640764896', 2, '2025-05-31 00:55:41', '2025-05-31 00:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(50) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `vat` varchar(50) NOT NULL,
  `payable` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `total`, `discount`, `vat`, `payable`, `user_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '88', '0', '4.40', '92.40', 1, 1, '2025-05-31 00:30:01', '2025-05-31 00:30:01'),
(2, '440', '0', '22.00', '462.00', 2, 2, '2025-05-31 00:56:56', '2025-05-31 00:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(50) NOT NULL,
  `sale_price` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `product_id`, `user_id`, `qty`, `sale_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '4', '88.00', '2025-05-31 00:30:01', '2025-05-31 00:30:01'),
(2, 2, 3, 2, '20', '440.00', '2025-05-31 00:56:56', '2025-05-31 00:56:56');

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_07_11_152531_create_users', 1),
(3, '2023_07_23_133550_create_customers', 1),
(4, '2023_07_23_133551_create_categories', 1),
(5, '2023_07_23_133552_create_products', 1),
(6, '2023_07_30_105124_create_invoices', 1),
(7, '2023_07_30_110928_create_invoice_products', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `img_url` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `price`, `unit`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Mula', '22', '10', 'uploads/1-1748672945-100-mula-sri-sai-forestry-original-imag4uadzbqhphdp.jpg', '2025-05-31 00:29:05', '2025-05-31 00:29:05'),
(2, 2, 2, 'Alu', '55', '5', 'uploads/2-1748674567-images.webp', '2025-05-31 00:56:07', '2025-05-31 00:56:07'),
(3, 2, 2, 'Mula', '22', '10', 'uploads/2-1748674593-100-mula-sri-sai-forestry-original-imag4uadzbqhphdp.jpg', '2025-05-31 00:56:33', '2025-05-31 00:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `mobile`, `password`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'Azharul', 'Islam', 'arefinmojumder825@gmail.com', '01640764896', 'arefinmojumder825', '0', '2025-05-31 00:27:36', '2025-05-31 00:28:04'),
(2, 'Azharul', 'Islam', 'arefinmojumder11825@gmail.com', '01640764896', 'arefinmojumder11825', '0', '2025-05-31 00:54:44', '2025-05-31 00:54:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
--
-- Database: `pos_system_db`
--
CREATE DATABASE IF NOT EXISTS `pos_system_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pos_system_db`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2025_05_13_190554_create_categories_table', 1),
(5, '2025_05_13_190732_create_brands_table', 1),
(6, '2025_05_13_191451_create_products_table', 1),
(7, '2025_05_13_193149_create_customers_table', 1),
(8, '2025_05_13_193305_create_sales_table', 1),
(9, '2025_05_13_193358_create_sale_details_table', 1),
(10, '2025_05_13_201458_add_role_to_users_table', 1);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('aC9SldLkb6yxeuFXzqYJJ1c9BJRlFVNxoSpS9PX7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRklGcngyWVhUZVdZQlBKc1dlWDVFaUZZUk4xVDZYNXNkOWdnbkdSaSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1748670553),
('IMVxZ71liKRyiG0WHOBuMDX5smN4FRXCvtcRNMrt', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU3BUQnRtR2VubmZXYnlHUlpzcHZGNWwyM2JsZlBWMGJCMExWVkFSQiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDA4L2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDgvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1750697400);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','cashier') NOT NULL DEFAULT 'cashier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Azharul Islam', 'superadmin@gmail.com', NULL, '$2y$12$/tfhvIX6ypFF/g4cThvy9uwT2MlczNg4XZBVPBEbzJsIFGezE8tY6', NULL, '2025-06-23 10:49:53', '2025-06-23 10:49:53', 'cashier');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_barcode_unique` (`barcode`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_user_id_foreign` (`user_id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_details_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_details_product_id_foreign` (`product_id`);

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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`);
--
-- Database: `sells_inventory_db`
--
CREATE DATABASE IF NOT EXISTS `sells_inventory_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sells_inventory_db`;

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Food\'s', 5, '2025-05-10 06:36:52', '2025-05-10 04:49:30'),
(3, 'Book\'s', 6, '2025-05-10 06:38:27', '2025-05-10 06:38:27'),
(6, 'pizza', 5, '2025-05-10 04:49:41', '2025-05-10 04:49:41'),
(10, 'Mouse', 5, '2025-05-10 04:50:01', '2025-05-10 04:50:01'),
(16, 'pizza', 5, '2025-05-12 08:52:22', '2025-05-12 08:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Azharul Islam', 'arefinmojumder825@gmail.com', '01640764896', 5, '2025-05-10 05:26:44', '2025-05-10 05:26:44'),
(2, 'Azharul Islam', 'Light@adminhasan', '01640764896', 5, '2025-05-10 05:26:54', '2025-05-10 05:26:54');

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
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `payble` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(255) NOT NULL,
  `sale_price` varchar(255) NOT NULL,
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
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2025_05_03_182842_create_categorys_table', 1),
(15, '2025_05_03_183027_create_customers_table', 1),
(16, '2025_05_03_183046_create_products_table', 1),
(17, '2025_05_03_183052_create_invoices_table', 1),
(18, '2025_05_03_183057_create_invoice_products_table', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','featured') NOT NULL,
  `release_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `name`, `price`, `weight`, `stock_quantity`, `image`, `status`, `release_date`, `description`, `created_at`, `updated_at`) VALUES
(1, 5, 6, 'pizza', 250.00, '5', 5, 'products/i8vLsNbQO3ULtLNTUUHIGOcJ1xTA9Ys5JoT3X0l6.png', 'active', '2025-05-10', NULL, '2025-05-10 10:26:32', '2025-05-10 10:28:49'),
(3, 5, 6, 'Azharul Islam', 100.00, '5', 10, 'products/yNRLCrD01aUTNlVRH30enJ53f3aXSyeHGZMZYmuf.jpg', 'inactive', '2025-05-15', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2025-05-10 10:31:01', '2025-05-10 11:04:03'),
(4, 5, 1, 'Mouse', 22.00, '90', 900, 'products/wKPnnoaclof4IuVQsTV4pjJQWa7ner483IHov0Nr.png', 'active', '2025-05-17', NULL, '2025-05-10 10:47:44', '2025-05-10 10:47:44'),
(5, 5, 10, 'ad', 111.00, '10', 5, 'products/UCfg8n5cnQ9bkeiXLzNGn99leYXGxGVTkENticVS.jpg', 'featured', '2025-05-17', NULL, '2025-05-10 10:48:36', '2025-05-10 10:48:36'),
(6, 5, 6, 'Azharul Islam', 100.00, '6', 6, 'products/k3nKMSHukO31OQrdS3qC5JtsmBNk1xYLPjT1nsGy.jpg', 'active', '2025-05-16', NULL, '2025-05-10 10:49:35', '2025-05-10 10:49:35'),
(7, 5, 6, 'aarafen12@gmail.com', 250.00, '5', 5, 'products/QhQo5b87GWUuQ9Lu7lfkT4UUUd4lHFNNV5cju094.webp', 'active', NULL, NULL, '2025-05-10 10:50:02', '2025-05-10 10:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_hash` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ipAddress` varchar(45) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `verification_hash`, `email_verified_at`, `otp`, `password`, `ipAddress`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Azharul Islam', 'arefinmojumder825@gmail.com', 'c8eb6900-83df-40b3-bcd5-0e4d0a16e60d', '2025-05-08 12:05:26', '0', '$2y$10$kpsOSyKg4l9Y6KwqC.z9POaxn93hIHapn87KnE6WGLNiA9VZVANi6', '127.0.0.1', NULL, '2025-05-08 12:03:53', '2025-05-30 23:56:42'),
(6, 'Jane NA', 'janena@gmail.com', '', NULL, '', 'janena', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorys_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`),
  ADD KEY `invoices_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`),
  ADD KEY `invoice_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_verification_hash_unique` (`verification_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorys`
--
ALTER TABLE `categorys`
  ADD CONSTRAINT `categorys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
--
-- Database: `task_manager`
--
CREATE DATABASE IF NOT EXISTS `task_manager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `task_manager`;

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2025_06_22_065601_create_users_table', 1),
(3, '2025_06_23_161855_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `deadline` datetime NOT NULL,
  `category` enum('work','personal','education','health') NOT NULL DEFAULT 'work',
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `progress` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `deadline`, `category`, `priority`, `status`, `progress`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Eaque voluptates tenetur quam nostrum magni omnis et.', 'Ipsa voluptatibus eum praesentium ut. Eos esse repellendus occaecati ut. Exercitationem ab illo facilis deserunt nulla perferendis.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(2, 1, 'Porro sit sapiente neque odio unde molestias.', 'Autem fugit debitis fugit autem. Perspiciatis sapiente delectus ipsa blanditiis optio quae quo. Possimus voluptatibus asperiores aspernatur recusandae.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, '2025-06-23 13:34:05', '2025-06-23 13:15:45', '2025-06-23 13:34:05'),
(3, 1, 'Ratione velit repudiandae dolor animi.', 'Qui ea velit officia id. Aut ipsum aspernatur placeat aperiam deleniti possimus dignissimos quos. Ipsam eveniet molestias cum distinctio autem. Esse nesciunt ad autem ea.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(4, 1, 'Sunt a velit rerum.', 'Expedita provident enim possimus beatae. In mollitia sit commodi et sunt necessitatibus possimus. Accusantium id adipisci sunt ex.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(5, 1, 'Est tempore blanditiis in dolor.', 'Quis necessitatibus sed aperiam quisquam libero. Nesciunt omnis optio libero voluptatibus aut. Architecto unde nihil dignissimos consectetur aut. Exercitationem est iure nihil eum nobis porro consequatur. Ipsa fuga id veritatis omnis quia ut.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(6, 1, 'Autem voluptatem et eligendi repellat quia qui.', 'Dicta at dolores qui sit est nisi ipsum. Molestiae qui officiis quia est repellendus aut non. Minus sapiente earum exercitationem eveniet fuga aut quia dolorem.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(7, 1, 'Necessitatibus suscipit temporibus quia qui quia et odio id.', 'Veniam nihil error quis omnis. Adipisci est excepturi libero in ut et dolorem occaecati. Et molestiae dolorum est fugit et.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(8, 1, 'Soluta tempora odit magni.', 'Et quas laudantium ut est aut possimus. Et expedita eos totam corrupti vitae asperiores consequatur. Occaecati omnis dignissimos distinctio ducimus. Cumque quo harum sed tenetur.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(9, 1, 'Quo quae maxime qui est odio fugit.', 'Nulla dolore maxime qui voluptatem. Deserunt assumenda quam corrupti nobis nisi dicta assumenda voluptatem. Fuga occaecati tempore inventore incidunt sint qui. Aut nobis quaerat nam in maxime laborum quia.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(10, 1, 'Ea eaque nihil dolor modi corporis velit et ex.', 'Aperiam qui accusamus voluptatem ea aut minus qui. Perspiciatis cupiditate et eum ab incidunt. Voluptatem corporis sit facere cupiditate eaque incidunt. Sint corporis id consequatur autem tempore.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(11, 1, 'Eos repellendus harum modi officia repellat vero.', 'Possimus rerum id libero aliquam ut. Veniam nulla perferendis sint quis. Ut ullam voluptatum nam quia.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(12, 1, 'Quisquam quo omnis expedita dolorem rerum porro.', 'Consequatur dicta ipsam omnis temporibus ut tempore beatae rerum. Quibusdam ex velit fugit. Modi adipisci neque et odio et repellendus impedit. Sed ut at qui eum.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(13, 1, 'Ut debitis autem dolores veritatis debitis ab necessitatibus.', 'Tenetur voluptatem soluta repudiandae dolor et. Illo quia alias sed magnam earum vitae. Provident esse porro ipsam sunt cum. Impedit nihil assumenda soluta. Eum sed veritatis est non qui quibusdam aut eum.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(14, 1, 'Quisquam ut saepe facere numquam nisi.', 'Animi debitis earum provident nemo facilis. Explicabo aperiam illo nulla dolore quam veritatis voluptas. Reiciendis perspiciatis in deleniti sunt nesciunt qui consequuntur suscipit.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(15, 1, 'Repellendus et officia enim ab.', 'Quia asperiores non optio non qui magni. Veritatis perspiciatis eum consequatur ut aut. Non est asperiores corporis sed labore voluptatum aut. Laudantium molestiae repudiandae itaque praesentium dolorem quidem quaerat.', '2025-07-01 19:15:45', 'personal', 'medium', 'pending', 65, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(16, 2, 'Accusantium nulla magnam occaecati at.', 'Ratione unde voluptates est ratione. Ipsam illo veritatis voluptatibus voluptas harum fugiat. Iste incidunt sequi doloremque doloremque suscipit molestiae. Nihil et vitae ex impedit sunt ratione.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(17, 2, 'Deserunt exercitationem consectetur mollitia omnis quae consequatur.', 'Aut itaque quaerat quam esse. Dolor vel accusamus vitae nihil culpa. Libero reprehenderit autem itaque sed atque. Aut tenetur veniam sit repellat.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(18, 2, 'Sunt fuga aut ipsum adipisci et numquam.', 'Libero enim quidem quia quos. Rerum illo consequatur voluptatem aut modi.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(19, 2, 'Exercitationem iure quod velit quia.', 'Sit voluptatem atque non totam porro neque. Molestiae ullam nostrum accusamus quae iure omnis repudiandae et. Dolorem velit culpa sed omnis et.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(20, 2, 'Sit harum reiciendis atque consequatur.', 'Laborum aperiam voluptatem laboriosam ad architecto at. Recusandae consequuntur quis consequatur qui reiciendis iusto qui quam.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, '2025-06-23 13:35:56', '2025-06-23 13:15:45', '2025-06-23 13:35:56'),
(21, 2, 'Possimus est ab corrupti quia animi rerum.', 'Molestiae voluptas maxime magni commodi. Consequatur vel nulla sunt. Recusandae quis voluptatibus dicta voluptas et voluptas. Iure omnis tenetur est cupiditate velit sunt accusamus.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(22, 2, 'Nihil voluptas expedita omnis eveniet molestias.', 'Adipisci praesentium eaque quod quis velit. Dolorum cupiditate tempore nam quaerat totam nisi. Vitae minus dicta at fugit. Molestias delectus dolore sed magni.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, '2025-06-23 13:38:31', '2025-06-23 13:15:45', '2025-06-23 13:38:31'),
(23, 2, 'Ut laborum libero officia doloremque.', 'Vitae sit maxime sed et sit est. Omnis illo cumque suscipit. Labore est commodi unde est. Assumenda placeat sint quam dolores quidem necessitatibus.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(24, 2, 'Eius quia minus molestiae.', 'Id velit rerum et molestias. Amet fugit distinctio consequatur et facilis. Vel ad sit quas est consequatur.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(25, 2, 'Rerum nobis at ut necessitatibus.', 'Unde quo quos dolor iure non. Veritatis enim qui nobis occaecati blanditiis tenetur. Cupiditate eum repellat voluptate delectus corporis maxime.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(26, 2, 'Vel tenetur temporibus numquam ratione.', 'Quia voluptas labore omnis saepe. Ut libero in accusantium excepturi dicta odio. Similique eius corporis quia sed ea nostrum iure autem. Officiis consequuntur est sunt dolorum similique quaerat veniam.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(27, 2, 'Cupiditate laborum dolor vero nisi.', 'A tempore non aspernatur. Cumque culpa ducimus ut odit ipsam. Minus neque veritatis sint aut. Voluptatum nobis repellendus nemo tenetur vel non. Amet modi animi excepturi eum praesentium optio.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(28, 2, 'Esse veritatis rerum consequatur unde sed quia.', 'Iure officia repellat esse. Nulla repellat beatae incidunt quae deleniti et. Ratione enim quod non rem. Illum commodi sunt voluptate praesentium.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(29, 2, 'Ad laboriosam quam ipsam mollitia.', 'Repudiandae quia aut ut dolorum quo. Sit autem aliquam mollitia ut. Et voluptatem molestias dicta voluptatem possimus laudantium tenetur. Quia aut nulla ad sint autem nihil magni.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(30, 2, 'Fuga hic et sed veniam.', 'Fugiat dolorem ratione veritatis repudiandae odio. Eum sint reiciendis corporis impedit quia natus quia. Et consectetur autem enim sed sed dolores.', '2025-07-10 19:15:45', 'health', 'low', 'completed', 61, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(31, 3, 'Doloremque illo nulla in et ratione sint aperiam.', 'Ut quia repellat similique ut itaque vel. Et sint rerum ipsam in deserunt qui sint quis. Suscipit eos quibusdam quo. Eius nihil ab aut quam corporis nobis.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(32, 3, 'Minima in quis dolor.', 'In optio rerum aut. Animi rem possimus nobis omnis voluptas. Molestias est sit atque officiis voluptatum omnis eaque eligendi. Dolor beatae odio dolor illo molestiae id est ut.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(33, 3, 'Minus quod voluptas cupiditate nobis.', 'Vero autem debitis porro corrupti. Consequuntur culpa nobis explicabo eligendi distinctio. Autem et quidem quia ut. Porro quis dolor et sit veritatis temporibus officiis.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(34, 3, 'Explicabo odio id nihil quaerat ratione eos officiis.', 'Repudiandae inventore et sit reprehenderit rem suscipit molestiae. Unde aperiam aspernatur dolorem aspernatur aperiam velit nobis. Aut nulla rerum earum ad. Odio ipsa impedit non occaecati.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(35, 3, 'Omnis eaque nobis ut aspernatur.', 'A excepturi assumenda ex explicabo nam sit. Iste sunt ad ducimus consequatur veritatis earum tempora. Non vel repellendus ut eum provident consectetur.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(36, 3, 'Dolorum nisi dolorem eum quae laboriosam.', 'Quaerat dolores et ut. Magnam et consectetur commodi ut pariatur iusto totam. Occaecati ea sapiente molestias illum. Consectetur recusandae porro minus qui nam.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(37, 3, 'Ut ea omnis sapiente et quaerat accusamus iusto.', 'Excepturi at iusto repudiandae perspiciatis perspiciatis facere magni quia. Excepturi non sed aliquam incidunt aut. Eligendi et reprehenderit velit officia porro illum voluptas.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(38, 3, 'Est illo facilis ducimus fuga maiores sunt quo qui.', 'Veritatis consectetur molestias earum eligendi. Incidunt distinctio dolorum ducimus quaerat. Alias nobis cumque itaque et. Sed dolor excepturi libero accusamus.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(39, 3, 'Ut voluptatem molestiae tempore.', 'Ipsa dolore exercitationem deleniti suscipit ut. Dignissimos placeat neque saepe possimus velit. Molestias est error explicabo quidem vitae consequatur dolore.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(40, 3, 'At libero laudantium quis et aliquid quis totam qui.', 'Nam qui rerum qui et. Voluptatem blanditiis quisquam eius enim eos. Beatae consequatur ut magnam tempora dolorem.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(41, 3, 'Ullam labore ab quia corrupti fuga.', 'Dolorem unde explicabo accusamus aperiam nam minus. Omnis consequuntur voluptates dolor eos sed qui ad. Distinctio fugiat nihil voluptatum nemo.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(42, 3, 'Rerum quod in consectetur aut non animi.', 'Excepturi ullam soluta exercitationem sint ea suscipit voluptates molestias. Maxime placeat enim id vel qui earum. Praesentium est est ut doloribus. Dolorem quaerat consequuntur voluptatum exercitationem.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(43, 3, 'Sed dolore qui ut est natus.', 'Laudantium quasi harum et sed rem. Dolorem enim quam asperiores sit suscipit. Quia provident dignissimos est libero quaerat.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(44, 3, 'Quia omnis consequuntur consequatur et et et.', 'Voluptate blanditiis ut omnis. Ducimus qui facere dolorum at et ut culpa.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(45, 3, 'Nostrum dolor sit nostrum enim ut.', 'Dolores dolorem cumque est facere. Ullam beatae optio ducimus nihil. Ratione dolorem quae distinctio eligendi. Aspernatur et et error quaerat. Quae consequuntur et tempora facere placeat eum minima.', '2025-06-30 19:15:45', 'work', 'high', 'pending', 79, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(46, 4, 'Eligendi sint ut error omnis harum labore.', 'Architecto beatae at sed eum. Est fugiat occaecati accusantium vel. Blanditiis est est qui aut inventore quibusdam odit. Sequi nemo qui non necessitatibus ut fugiat. Autem dignissimos perferendis tempore magni et consectetur beatae.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(47, 4, 'Quasi rerum aperiam molestiae veniam.', 'Officiis ea molestiae impedit labore odit consequuntur. Illum nostrum consequatur aut ea. Tenetur dolor vel qui reiciendis quia. Quia cum quasi cumque aut veniam explicabo nihil odit.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(48, 4, 'Tempora nesciunt accusantium eaque voluptatem fugit.', 'Quasi assumenda maiores aut sunt necessitatibus repudiandae velit. Itaque vel doloribus quaerat. Dignissimos iste culpa maiores ipsum adipisci omnis optio non. Ab labore debitis possimus porro. Accusamus qui qui doloribus optio.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(49, 4, 'Exercitationem ab culpa fugit ad.', 'Cum dolore molestiae enim ea quia. Fugit dolores necessitatibus quibusdam ea enim. Nam quos unde quia quidem illum expedita. Consectetur et est autem qui voluptas. Veniam recusandae sunt quaerat sed vel recusandae.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(50, 4, 'Culpa voluptatum alias voluptatem velit voluptas.', 'Culpa sunt quis voluptatem autem voluptatem laboriosam aperiam repellendus. Ratione architecto sint voluptas. Facere quo cum dolores quisquam.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(51, 4, 'Ut consequatur nam eos et.', 'Modi suscipit dolorum quo quia. Qui maiores harum voluptatum illum voluptatibus. A voluptatem incidunt beatae atque et. Maiores earum odio odio aut architecto soluta itaque. Laborum est sed laboriosam alias quam.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(52, 4, 'Porro deleniti ex laudantium iste sint.', 'Autem debitis modi sunt est. Commodi dolorem et omnis sunt sunt ex. Nam dicta et mollitia dolores qui nobis vel.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(53, 4, 'Deleniti quisquam voluptatum deleniti pariatur non provident.', 'Quas pariatur illum ut quo sit est. Sequi odit unde et aut. Autem dolorem officiis eum nihil est ut. Exercitationem non ut nostrum natus id delectus.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(54, 4, 'Cum unde officia nisi perspiciatis aperiam accusamus laboriosam.', 'Amet aut voluptatem ipsa exercitationem quisquam. Deleniti adipisci quis ex et voluptatem et. Aut illo laborum dolore eum. Maxime quasi esse sunt.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(55, 4, 'Quisquam ipsa omnis qui sapiente porro minima officiis.', 'Sequi officiis beatae eum et veritatis perspiciatis sit. Molestias assumenda voluptas ut repellat non est. Omnis soluta quia sapiente rerum qui voluptates. Quidem molestias non id voluptate repellendus qui blanditiis.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(56, 4, 'Consequatur id ea quibusdam magnam consequatur a.', 'Qui deserunt aut praesentium libero et ut. Nesciunt aut placeat repellat fugiat rerum exercitationem voluptatem. Repellat perferendis illum quia. Unde corrupti illo in in harum corrupti est harum.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(57, 4, 'Inventore quia eveniet id et id sed quaerat.', 'Delectus et aut voluptatem quia voluptas. Qui cupiditate expedita tempore et inventore est. Facilis ratione explicabo non repellendus. Provident iure quos ea fuga quis. Ex pariatur itaque rerum est culpa rem debitis et.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(58, 4, 'Distinctio reprehenderit rerum a ex.', 'Consequuntur unde laboriosam et dolorum voluptatem. Quas amet quos id exercitationem sint illum.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(59, 4, 'Enim omnis qui tenetur quae commodi.', 'Sapiente nemo ut saepe aut voluptatem. Rerum eveniet accusamus est voluptates aliquam. Qui illo exercitationem quas repellat rerum.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(60, 4, 'Quidem nisi harum dignissimos hic.', 'Ipsum esse est voluptatem porro. Non placeat eligendi dolorum qui enim. Rerum ratione beatae aut veniam. Ea dolorem ab eaque sunt voluptatem eveniet accusamus.', '2025-07-05 19:15:45', 'health', 'high', 'completed', 0, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(61, 5, 'Dignissimos voluptate deserunt dolorem ducimus pariatur quos molestiae.', 'Quae sapiente dolores et sequi culpa earum facere. Tempore et qui magni. Non unde cumque odio eaque.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(62, 5, 'Non ab commodi ea.', 'Vero vitae ut voluptatem quo vitae ipsam. Qui et praesentium quos qui placeat deserunt sed.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(63, 5, 'Repellat aut voluptatibus placeat optio minima.', 'Ea rerum sit distinctio sint saepe. Repellat ut odio impedit cum est deleniti iste. Accusamus quibusdam impedit molestias dolores explicabo illo. Debitis hic id et voluptas.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(64, 5, 'Et voluptas ullam rem et.', 'Quia harum dolor repellendus quaerat qui. Officia in deserunt et reprehenderit consectetur rerum molestiae. Enim enim ea corrupti omnis ut. At pariatur facere aspernatur tenetur harum. Et possimus velit laudantium aperiam.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(65, 5, 'Aperiam voluptatem nulla totam explicabo enim eveniet consequuntur nostrum.', 'Id dolorem ut suscipit voluptatem cumque aut doloribus. Velit est soluta sed tenetur aut deleniti omnis. Eum aut voluptatem magni eum veniam sunt. Voluptatem non quos quo mollitia id.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(66, 5, 'Non pariatur quas nihil omnis suscipit dolorum.', 'Dolor expedita et natus sequi voluptates ut. Et et optio corrupti eos. Nihil quis dignissimos ullam laudantium. Ut animi impedit ex natus ut.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(67, 5, 'At quasi porro nemo expedita molestiae.', 'Laudantium tempore numquam corrupti quod non sit sint. Nisi eum pariatur recusandae sed. Voluptatum eos autem officia sed repellat voluptatem. Ab ratione voluptatem et dolore quasi vero.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(68, 5, 'Et possimus et minima est quia voluptates.', 'Ipsa modi voluptas voluptatem vel ut est. Aut nostrum nostrum similique earum. Et enim similique molestias quaerat. Suscipit eligendi architecto quis pariatur magnam praesentium.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(69, 5, 'Velit vel vel quo distinctio natus omnis debitis.', 'Odio voluptas qui ex id sint ut rerum atque. Itaque autem minus omnis aut minus asperiores cum autem. Eveniet rerum qui enim deleniti quia dignissimos cupiditate nobis. Eum reprehenderit non consequatur sit quo.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(70, 5, 'Illum inventore quam mollitia laudantium doloribus ut.', 'Libero aut nulla consequatur quos repellat dolorem aut. Temporibus excepturi voluptatem molestiae dolorem aut sit omnis. Ut sed quia dolor reiciendis.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(71, 5, 'Soluta laborum sit nemo dignissimos sint ab.', 'Nihil corrupti qui vel consectetur aliquam non soluta. Et in error expedita sunt et. Non rerum aut voluptas eveniet ea illum.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(72, 5, 'Inventore quo quod necessitatibus natus cum dicta quisquam.', 'Unde libero et dicta. Fugit expedita est dolores. Eaque quidem aliquid laudantium et reprehenderit reiciendis harum sint. At assumenda officiis cupiditate.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(73, 5, 'Et vitae molestias tempora illo.', 'Quisquam consequatur ut magni omnis inventore. Exercitationem minus modi repudiandae voluptate alias libero asperiores. Eveniet qui autem exercitationem voluptatem consequatur dolore ex.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(74, 5, 'Perspiciatis laboriosam inventore eaque veniam et.', 'Et est sed similique veniam libero sapiente. Repellendus vel molestias mollitia praesentium fuga aut. Et accusantium omnis soluta veniam sed quidem eligendi.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(75, 5, 'Non iure a qui minima perspiciatis dolor ea nobis.', 'Ut quis delectus facere nulla expedita. Sapiente minima in sint aperiam temporibus in. Labore est fuga cupiditate dolore.', '2025-07-03 19:15:45', 'personal', 'low', 'completed', 36, NULL, '2025-06-23 13:15:45', '2025-06-23 13:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `profile_image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Wilmer Krajcik', 'ebba93@example.net', '2025-06-23 13:15:45', NULL, '$2y$10$ulIJhIevfJOl.KGrn/6w9uyzWewg/vRDY5XCrMnGxVt9maq6qQOLq', '5ZZ7HtVbNk', '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(2, 'Jerome Medhurst', 'van.boehm@example.com', '2025-06-23 13:15:45', NULL, '$2y$10$fKRbWKWBiLgg3PN4TTyb6.5RWSG3b0/Z4YPhb/2SIOUMh4K1tNlQu', 'BvqOxXrmCL', '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(3, 'Carroll Ankunding', 'friedrich.leffler@example.com', '2025-06-23 13:15:45', NULL, '$2y$10$qt2ATutwd.UpcvOMUMtwbOMBFbNRIqAf2DEXQ0/u26REwKmDkNKlO', 'j01HymassH', '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(4, 'Miss Annabel Barrows MD', 'ckirlin@example.net', '2025-06-23 13:15:45', NULL, '$2y$10$582lQFJG6owTNCRP40A8h.sBPeVJKFdwHwCnD8z8CAP7clmi5HqQ6', '8lpFvFFEsA', '2025-06-23 13:15:45', '2025-06-23 13:15:45'),
(5, 'Drew Gaylord I', 'lilliana31@example.com', '2025-06-23 13:15:45', NULL, '$2y$10$1Y4o6rG3WonMXsZV7genJ.2DCz7fPYuiiHcNV5eNehFqr6MkOMbkW', 'iEIFyMripV', '2025-06-23 13:15:45', '2025-06-23 13:15:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_status_deadline_index` (`status`,`deadline`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `user_role_db`
--
CREATE DATABASE IF NOT EXISTS `user_role_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `user_role_db`;

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
(3, '0001_01_01_000002_create_jobs_table', 1);

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
('62sYy4WGh7lYdpDQdLr50JwG834jCHGXwvMiYHtr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlBUamVuU3lPdUNybUxuRk9TdVc5MnRkbkpWNUpNeGQzdzBWS0ZGRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwOCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747139776);

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
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
