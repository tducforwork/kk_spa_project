-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2026 at 11:18 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kk_spa_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 for Super Admin',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 0, 'Super Admin', 'tducforwork@gmail.com', 'tuanduc', NULL, NULL, '$2y$12$Y4wKYvDfZPh9aS5989HEwenIfY1c82vLFLUiyWZ8Ujwdx6mpfIfDq', 'ewTZx1383yl4NCZ2yAk012m70hOFcbF8QjvRmBZhsOCSFbXofWj0yWfLBxha', '2026-03-12 04:27:57', '2026-03-12 04:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `is_read`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 0, 'New employer registered', 0, '/admin/employers/detail/1', '2026-03-02 20:49:26', '2026-03-02 20:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `permission_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `role_id`, `permission_route`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin.logout', '2026-03-03 04:54:10', '2026-03-03 04:54:10'),
(2, 1, 'admin.password.verify.code', '2026-03-03 04:54:10', '2026-03-03 04:54:10'),
(3, 1, 'admin.dashboard', '2026-03-03 04:54:10', '2026-03-03 04:54:10'),
(4, 1, 'admin.profile', '2026-03-03 04:54:10', '2026-03-03 04:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Quản lý', 1, '2026-03-03 04:54:10', '2026-03-03 04:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `category_posts`
--

CREATE TABLE `category_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT '0',
  `admin_id` bigint UNSIGNED DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_post_translations`
--

CREATE TABLE `category_post_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `category_post_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_restaurants`
--

CREATE TABLE `category_restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT '0',
  `admin_id` bigint UNSIGNED DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_restaurant_translations`
--

CREATE TABLE `category_restaurant_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `category_restaurant_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_rooms`
--

CREATE TABLE `category_rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT '0',
  `admin_id` bigint UNSIGNED DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_rooms`
--

INSERT INTO `category_rooms` (`id`, `parent_id`, `admin_id`, `image`, `icon`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 4, NULL, NULL, 0, 1, '2026-03-12 08:42:22', '2026-03-12 08:42:22'),
(2, 0, 4, '69b28003316f61773305859.webp', NULL, 0, 1, '2026-03-12 08:57:39', '2026-03-27 05:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `category_room_translations`
--

CREATE TABLE `category_room_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `category_room_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_room_translations`
--

INSERT INTO `category_room_translations` (`id`, `category_room_id`, `lang_code`, `name`, `slug`, `description`, `content`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'TEst danh muc', 'test-danh-muc', 'dá', NULL, NULL, NULL, NULL, '2026-03-12 08:42:22', '2026-03-12 08:42:22'),
(2, 1, 'hi', 'Test', 'test-1', NULL, NULL, NULL, NULL, NULL, '2026-03-12 08:42:22', '2026-03-26 03:28:45'),
(3, 1, 'bn', 'Test', 'test-2', NULL, NULL, NULL, NULL, NULL, '2026-03-12 08:42:22', '2026-03-26 03:28:45'),
(4, 1, 'vi', 'Test', 'test', NULL, NULL, NULL, NULL, NULL, '2026-03-12 08:42:22', '2026-03-12 08:42:22'),
(5, 2, 'en', 'TEst danh muc', 'test-danh-muc22', NULL, NULL, NULL, NULL, NULL, '2026-03-12 08:57:39', '2026-03-12 08:57:39');

-- --------------------------------------------------------

--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_schedule_id` int NOT NULL DEFAULT '0',
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Job Expired', 'job_erxpired', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"jobExpired\"]', NULL, 1, '2025-07-20 08:42:29', '2025-07-20 08:37:29', 1, 1, NULL, '2025-07-20 02:37:29'),
(2, 'Plan Expired', 'plan_erxpired', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"planExpired\"]', NULL, 1, '2025-07-20 08:42:32', '2025-07-20 08:37:32', 1, 1, NULL, '2025-07-20 02:37:32');

-- --------------------------------------------------------

--
-- Table structure for table `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `cron_job_id` int UNSIGNED NOT NULL DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedules`
--

CREATE TABLE `cron_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cron_schedules`
--

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 MInute', 300, 1, '2024-07-02 16:54:25', '2024-07-02 16:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `is_app` tinyint(1) NOT NULL DEFAULT '0',
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.webp', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.webp', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.webp', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"RECAPTCHA_SITE_KEY_DUMMY\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"RECAPTCHA_SECRET_KEY_DUMMY\"}}', 'recaptcha.webp', 0, '2019-10-18 23:16:05', '2025-04-05 05:28:31'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.webp', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2025-07-20 05:02:37'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.webp', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.webp', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.webp', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.webp', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `admin_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `image`, `status`, `admin_id`, `created_at`, `updated_at`, `sort_order`) VALUES
(1, '69c63af0bd6d51774598896.webp', 1, 4, '2026-03-23 08:26:02', '2026-03-27 08:08:19', 1),
(2, '69c63d1f87c3d1774599455.webp', 1, 4, '2026-03-24 08:55:12', '2026-03-27 08:17:35', 2),
(3, '69c63d2e9880e1774599470.webp', 1, 4, '2026-03-24 08:56:10', '2026-03-27 08:17:50', 3),
(4, '69c63d3ba521a1774599483.webp', 1, 4, '2026-03-24 08:56:48', '2026-03-27 08:18:03', 4),
(5, '69c63d47b51671774599495.webp', 1, 4, '2026-03-24 08:57:21', '2026-03-27 08:18:16', 5);

-- --------------------------------------------------------

--
-- Table structure for table `facility_images`
--

CREATE TABLE `facility_images` (
  `id` bigint UNSIGNED NOT NULL,
  `facility_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1: main gallery, 2: intro gallery',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facility_images`
--

INSERT INTO `facility_images` (`id`, `facility_id`, `image`, `type`, `created_at`, `updated_at`) VALUES
(12, 1, '69c63af3362471774598899.webp', 2, '2026-03-27 08:08:20', '2026-03-27 08:08:20'),
(13, 1, '69c63af4b1aa91774598900.webp', 1, '2026-03-27 08:08:23', '2026-03-27 08:08:23'),
(14, 1, '69c63af733e7c1774598903.webp', 1, '2026-03-27 08:08:26', '2026-03-27 08:08:26'),
(15, 1, '69c63afa9af151774598906.webp', 1, '2026-03-27 08:08:29', '2026-03-27 08:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `facility_translations`
--

CREATE TABLE `facility_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `facility_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `additional_info` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facility_translations`
--

INSERT INTO `facility_translations` (`id`, `facility_id`, `lang_code`, `name`, `slug`, `description`, `content`, `additional_info`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Pool (Demo)', 'pool-demo', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-23 08:26:05', '2026-03-27 08:12:59'),
(2, 2, 'en', 'Bar - Vip Lounge', 'bar-vip-lounge-1', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:55:12', '2026-03-27 08:26:12'),
(3, 2, 'vi', 'Bar - Vip Lounge', 'bar-vip-lounge', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:55:12', '2026-03-27 08:26:12'),
(4, 1, 'vi', 'Pool', 'pool', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:55:27', '2026-03-24 08:55:27'),
(5, 3, 'en', 'Rose Garden', 'rose-garden-1', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:56:10', '2026-03-24 08:56:10'),
(6, 3, 'vi', 'Rose Garden', 'rose-garden', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:56:10', '2026-03-24 08:56:10'),
(7, 4, 'en', 'Kids Club', 'kids-club-1', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:56:48', '2026-03-24 08:56:48'),
(8, 4, 'vi', 'Kids Club', 'kids-club', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:56:48', '2026-03-24 08:56:48'),
(9, 5, 'en', 'Gym - Yoga', 'gym-yoga-1', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:57:21', '2026-03-24 08:57:21'),
(10, 5, 'vi', 'Gym - Yoga', 'gym-yoga', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, '{\"1774254256621\":{\"icon\":\"69c0f91dd99c71774254365.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774254281504\":{\"icon\":\"69c0f91ddca001774254365.webp\",\"text\":\"1 King Bed\"},\"1774254283704\":{\"icon\":\"69c0f91ddfb101774254365.webp\",\"text\":\"Room size: 68 m2\"},\"1774254284290\":{\"icon\":\"69c0f91de2bbc1774254365.webp\",\"text\":\"View: Neighboring or street view\"},\"1774254284715\":{\"icon\":\"69c0f91de5af81774254365.webp\",\"text\":\"Wifi\"},\"1774254285152\":{\"icon\":\"69c0f91de879c1774254365.webp\",\"text\":\"No smoking\"},\"1774254285655\":{\"icon\":\"69c0f91dec6c21774254365.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774254286092\":{\"icon\":\"69c0f91defa4f1774254365.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:57:21', '2026-03-24 08:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seo_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"travel\",\"kksapahotel\"],\"meta_robots\":null,\"description\":\"Discover 5-star luxury at KK Sapa Hotel. Featuring elegant rooms with Muong Hoa Valley views and world-class service. Book directly to unlock our best rates!\",\"social_title\":\"JobLab - Job Portal Platform\",\"social_description\":\"Indulge in a premium stay at KK Sapa Hotel. Immerse yourself in luxury with breathtaking views of Muong Hoa Valley and international 5-star amenities. Reserve your stay today!\",\"image\":\"69c361292d3271774412073.webp\"}', NULL, 'basic', '', '2020-07-04 23:42:52', '2026-03-25 04:14:36'),
(24, 'about.content', '{\"heading_en\":\"Come for the mountain, stay for the memories\",\"heading_vi\":\"\\u0110\\u1ebfn v\\u00ec ng\\u1ecdn n\\u00fai, \\u1edf l\\u1ea1i v\\u00ec nh\\u1eefng k\\u1ef7 ni\\u1ec7m.\",\"subheading_en\":\"KK Sapa Hotel - Nestled in the heart of Sapa\",\"subheading_vi\":\"Kh\\u00e1ch s\\u1ea1n KK Sapa - N\\u1eb1m gi\\u1eefa l\\u00f2ng Sapa\",\"description_en\":\"Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a traditional ink wash painting. It is truly breathtaking to watch the clouds dance around the peaks as cable cars glide silently toward Fansipan, offering a sense of standing at the roof of Indochina with all of Sa Pa at your feet. Beyond the views, our prime location puts the vibrant Northwest culture of Sa Pa\\u2019s center\\u2014where heaven meets earth\\u2014just a few steps away. Let KK Sapa Hotel cherish every moment of your stay, providing a peaceful sanctuary to fully embrace the beauty of Sa Pa.\",\"description_vi\":\"N\\u1eb1m tr\\u00ean cao, kh\\u00e1ch s\\u1ea1n KK Sapa l\\u00e0 m\\u1ed9t vi\\u00ean ng\\u1ecdc \\u1ea9n m\\u00ecnh gi\\u1eefa l\\u00f2ng Sa Pa. T\\u1eeb ban c\\u00f4ng ri\\u00eang, d\\u00e3y n\\u00fai Ho\\u00e0ng Li\\u00ean S\\u01a1n h\\u00f9ng v\\u0129 tr\\u1ea3i d\\u00e0i nh\\u01b0 m\\u1ed9t b\\u1ee9c tranh th\\u1ee7y m\\u1eb7c truy\\u1ec1n th\\u1ed1ng. Th\\u1eadt ngo\\u1ea1n m\\u1ee5c khi ng\\u1eafm nh\\u00ecn nh\\u1eefng \\u0111\\u00e1m m\\u00e2y nh\\u1ea3y m\\u00faa quanh c\\u00e1c \\u0111\\u1ec9nh n\\u00fai khi c\\u00e1p treo l\\u1eb7ng l\\u1ebd l\\u01b0\\u1edbt xu\\u1ed1ng Fansipan, mang \\u0111\\u1ebfn c\\u1ea3m gi\\u00e1c nh\\u01b0 \\u0111ang \\u0111\\u1ee9ng tr\\u00ean n\\u00f3c nh\\u00e0 c\\u1ee7a \\u0110\\u00f4ng D\\u01b0\\u01a1ng v\\u1edbi to\\u00e0n c\\u1ea3nh Sa Pa d\\u01b0\\u1edbi ch\\u00e2n. Kh\\u00f4ng ch\\u1ec9 c\\u00f3 t\\u1ea7m nh\\u00ecn tuy\\u1ec7t \\u0111\\u1eb9p, v\\u1ecb tr\\u00ed \\u0111\\u1eafc \\u0111\\u1ecba c\\u1ee7a ch\\u00fang t\\u00f4i c\\u00f2n gi\\u00fap b\\u1ea1n d\\u1ec5 d\\u00e0ng ti\\u1ebfp c\\u1eadn n\\u1ec1n v\\u0103n h\\u00f3a T\\u00e2y B\\u1eafc s\\u00f4i \\u0111\\u1ed9ng c\\u1ee7a trung t\\u00e2m Sa Pa \\u2013 n\\u01a1i giao thoa gi\\u1eefa tr\\u1eddi v\\u00e0 \\u0111\\u1ea5t \\u2013 ch\\u1ec9 c\\u00e1ch v\\u00e0i b\\u01b0\\u1edbc ch\\u00e2n. H\\u00e3y \\u0111\\u1ec3 kh\\u00e1ch s\\u1ea1n KK Sapa tr\\u00e2n tr\\u1ecdng t\\u1eebng kho\\u1ea3nh kh\\u1eafc trong k\\u1ef3 ngh\\u1ec9 c\\u1ee7a b\\u1ea1n, mang \\u0111\\u1ebfn m\\u1ed9t ch\\u1ed1n ngh\\u1ec9 d\\u01b0\\u1ee1ng y\\u00ean b\\u00ecnh \\u0111\\u1ec3 b\\u1ea1n ho\\u00e0n to\\u00e0n \\u0111\\u1eafm ch\\u00ecm trong v\\u1ebb \\u0111\\u1eb9p c\\u1ee7a Sa Pa.\",\"button_text_en\":\"ABOUT US\",\"button_text_vi\":\"ABOUT US\",\"button_url_en\":\"\\/\",\"button_url_vi\":\"\\/\"}', NULL, 'basic', '', '2020-10-27 12:51:20', '2026-03-24 03:03:47'),
(26, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Navigating the Job Market: Tips for Job Seekers\",\"category\":\"Seeker Tips\",\"description_nic\":\"Retirement planning is essential for ensuring financial security and peace of mind in your golden years. In this blog post, we discuss key retirement planning strategies, including setting retirement goals, estimating retirement expenses, maximizing retirement savings accounts, and creating a sustainable withdrawal plan. Whether you\'re decades away from retirement or nearing your retirement age, this guide will help you take proactive steps towards a financially secure future.<br \\/><br \\/>\\r\\n<h5>From setting clear retirement goals to estimating your future expenses and income needs<\\/h5>\\r\\n<div>we\'ll guide you through the process of creating a solid retirement plan tailored to your unique circumstances. Whether you\'re decades away from retirement or nearing your retirement age, this guide offers valuable insights to help you make informed decisions and take proactive steps towards achieving your retirement objectives.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n\\r\\n<blockquote style=\\\"font-style:italic;text-align:center;padding:20px;background:#f1f1f1;font-weight:500;font-size:18px;border-left:4px solid #0f53ff;\\\">Aenean metus lectus at id. Morbi aliquet commodo a sodales eget. Eu justo ante nibh et a turpis, aliquam phasellus hymenaeos, imperdiet eget cras sociosqu, tincidunt a amet. Faucibus urna luctus, arcu ni<\\/blockquote>\\r\\n\\r\\n\\r\\n<h5>Planning for retirement doesn\'t end with accumulating savings<\\/h5>\\r\\n<div>It also involves developing a sustainable withdrawal strategy to ensure your funds last throughout your retirement years. We\'ll discuss key factors to consider when creating a withdrawal plan, such as your expected lifespan, inflation, and investment returns, to help you strike the right balance between enjoying your retirement lifestyle and preserving your financial security.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n<h5>Planning before starting<\\/h5>\\r\\n<div>Whether you\'re just starting your career, mid-career, or approaching retirement age, it\'s never too early or too late to begin planning for your future. Join us as we empower you with the knowledge and tools you need to take control of your retirement destiny and embark on the path towards a financially secure and fulfilling retirement.<br \\/><\\/div>\",\"image\":\"67f75ea7011c21744264871.webp\"}', NULL, 'basic', 'navigating-the-job-market-tips-for-job-seekers', '2020-10-23 00:57:19', '2025-07-20 04:43:03'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Discover More Than 500+ Jobs\",\"subheading\":\"It is an excellent platform for the job seeker searching for new career heights and passionate about startups.\",\"search_heading\":\"Popular Searches: UI Designer, Ux Researcher, Android, Admin\",\"image_one\":\"67f0d343bfe361743835971.webp\",\"image_two\":\"67f0d343c798e1743835971.webp\",\"image_three\":\"67f0d343c8f901743835971.webp\",\"image_four\":\"67f0d343ca2361743835971.webp\",\"image_five\":\"67f0d343cb7e11743835971.webp\",\"image_six\":\"67f0d343cc8d61743835971.webp\"}', NULL, 'basic', '', '2021-05-01 18:09:30', '2025-07-20 03:26:38'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div><h4 class=\\\"mb-2\\\">What information do we collect?<\\/h4><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How do we protect your information?<\\/h4><p>All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h4><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h4><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h4><p>We will post those changes on this page if we decide to change our privacy policy.<\\/p><p><br><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How long we retain your information?<\\/h4><p>At the point when you register for our site, we cycle and keep the information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h4><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promotion of their items or administrations.<\\/p><\\/div>\",\"status\":1}', NULL, 'basic', NULL, '2020-07-04 23:42:52', '2025-04-05 05:44:25'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div><h4 class=\\\"mb-2\\\">What information do we collect?<\\/h4><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How do we protect your information?<\\/h4><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h4><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h4><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h4><p>We will post those changes on this page if we decide to change our privacy policy.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How long we retain your information?<\\/h4><p>At the point when you register for our site, we cycle and keep the information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h4><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promotion of their items or administrations.<\\/p><\\/div>\"}', NULL, 'basic', 'privacy-policy', '2021-06-09 08:50:42', '2025-04-05 05:49:42'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div><h4 class=\\\"mb-2\\\">What information do we collect?<\\/h4><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How do we protect your information?<\\/h4><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h4><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h4><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h4><p>We will post those changes on this page if we decide to change our privacy policy.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How long we retain your information?<\\/h4><p>At the point when you register for our site, we cycle and keep the information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h4><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promotion of their items or administrations.<\\/p><\\/div>\"}', NULL, 'basic', 'terms-of-service', '2021-06-09 08:51:18', '2025-04-05 05:49:50'),
(44, 'maintenance.data', '{\"description\":\"<h2 align=\\\"center\\\">We\'re just tuning up a few things.<\\/h2><p align=\\\"center\\\">We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<\\/p>\",\"image\":\"67f0c5e9b803d1743832553.webp\"}', NULL, 'basic', NULL, '2020-07-04 23:42:52', '2025-04-04 23:55:53'),
(46, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"How to Create an Impressive Job Application\",\"category\":\"Interview Strategies\",\"description_nic\":\"Retirement planning is essential for ensuring financial security and peace of mind in your golden years. In this blog post, we discuss key retirement planning strategies, including setting retirement goals, estimating retirement expenses, maximizing retirement savings accounts, and creating a sustainable withdrawal plan. Whether you\'re decades away from retirement or nearing your retirement age, this guide will help you take proactive steps towards a financially secure future.<br \\/><br \\/>\\r\\n<h5>From setting clear retirement goals to estimating your future expenses and income needs<\\/h5>\\r\\n<div>we\'ll guide you through the process of creating a solid retirement plan tailored to your unique circumstances. Whether you\'re decades away from retirement or nearing your retirement age, this guide offers valuable insights to help you make informed decisions and take proactive steps towards achieving your retirement objectives.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n\\r\\n<blockquote style=\\\"font-style:italic;text-align:center;padding:20px;background:#f1f1f1;font-weight:500;font-size:18px;border-left:4px solid #0f53ff;\\\">Aenean metus lectus at id. Morbi aliquet commodo a sodales eget. Eu justo ante nibh et a turpis, aliquam phasellus hymenaeos, imperdiet eget cras sociosqu, tincidunt a amet. Faucibus urna luctus, arcu ni<\\/blockquote>\\r\\n\\r\\n\\r\\n<h5>Planning for retirement doesn\'t end with accumulating savings<\\/h5>\\r\\n<div>It also involves developing a sustainable withdrawal strategy to ensure your funds last throughout your retirement years. We\'ll discuss key factors to consider when creating a withdrawal plan, such as your expected lifespan, inflation, and investment returns, to help you strike the right balance between enjoying your retirement lifestyle and preserving your financial security.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n<h5>Planning before starting<\\/h5>\\r\\n<div>Whether you\'re just starting your career, mid-career, or approaching retirement age, it\'s never too early or too late to begin planning for your future. Join us as we empower you with the knowledge and tools you need to take control of your retirement destiny and embark on the path towards a financially secure and fulfilling retirement.<br \\/><\\/div>\",\"image\":\"67f75e9175e9f1744264849.webp\"}', NULL, 'basic', 'how-to-create-an-impressive-job-application', '2022-11-24 04:46:38', '2025-07-20 04:42:58'),
(47, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Interview Preparation: Strategies for Success\",\"category\":\"Networking Insights\",\"description_nic\":\"Retirement planning is essential for ensuring financial security and peace of mind in your golden years. In this blog post, we discuss key retirement planning strategies, including setting retirement goals, estimating retirement expenses, maximizing retirement savings accounts, and creating a sustainable withdrawal plan. Whether you\'re decades away from retirement or nearing your retirement age, this guide will help you take proactive steps towards a financially secure future.<br \\/><br \\/>\\r\\n<h5>From setting clear retirement goals to estimating your future expenses and income needs<\\/h5>\\r\\n<div>we\'ll guide you through the process of creating a solid retirement plan tailored to your unique circumstances. Whether you\'re decades away from retirement or nearing your retirement age, this guide offers valuable insights to help you make informed decisions and take proactive steps towards achieving your retirement objectives.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n\\r\\n<blockquote style=\\\"font-style:italic;text-align:center;padding:20px;background:#f1f1f1;font-weight:500;font-size:18px;border-left:4px solid #0f53ff;\\\">Aenean metus lectus at id. Morbi aliquet commodo a sodales eget. Eu justo ante nibh et a turpis, aliquam phasellus hymenaeos, imperdiet eget cras sociosqu, tincidunt a amet. Faucibus urna luctus, arcu ni<\\/blockquote>\\r\\n\\r\\n\\r\\n<h5>Planning for retirement doesn\'t end with accumulating savings<\\/h5>\\r\\n<div>It also involves developing a sustainable withdrawal strategy to ensure your funds last throughout your retirement years. We\'ll discuss key factors to consider when creating a withdrawal plan, such as your expected lifespan, inflation, and investment returns, to help you strike the right balance between enjoying your retirement lifestyle and preserving your financial security.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n<h5>Planning before starting<\\/h5>\\r\\n<div>Whether you\'re just starting your career, mid-career, or approaching retirement age, it\'s never too early or too late to begin planning for your future. Join us as we empower you with the knowledge and tools you need to take control of your retirement destiny and embark on the path towards a financially secure and fulfilling retirement.<br \\/><\\/div>\",\"image\":\"67f75e70dcf161744264816.webp\"}', NULL, 'basic', 'interview-preparation-strategies-for-success', '2022-11-25 04:47:02', '2025-07-20 04:42:54'),
(49, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Importance of Networking in Your Job Search\",\"category\":\"Remote Work\",\"description_nic\":\"Retirement planning is essential for ensuring financial security and peace of mind in your golden years. In this blog post, we discuss key retirement planning strategies, including setting retirement goals, estimating retirement expenses, maximizing retirement savings accounts, and creating a sustainable withdrawal plan. Whether you\'re decades away from retirement or nearing your retirement age, this guide will help you take proactive steps towards a financially secure future.<br \\/><br \\/>\\r\\n<h5>From setting clear retirement goals to estimating your future expenses and income needs<\\/h5>\\r\\n<div>we\'ll guide you through the process of creating a solid retirement plan tailored to your unique circumstances. Whether you\'re decades away from retirement or nearing your retirement age, this guide offers valuable insights to help you make informed decisions and take proactive steps towards achieving your retirement objectives.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n\\r\\n<blockquote style=\\\"font-style:italic;text-align:center;padding:20px;background:#f1f1f1;font-weight:500;font-size:18px;border-left:4px solid #0f53ff;\\\">Aenean metus lectus at id. Morbi aliquet commodo a sodales eget. Eu justo ante nibh et a turpis, aliquam phasellus hymenaeos, imperdiet eget cras sociosqu, tincidunt a amet. Faucibus urna luctus, arcu ni<\\/blockquote>\\r\\n\\r\\n\\r\\n<h5>Planning for retirement doesn\'t end with accumulating savings<\\/h5>\\r\\n<div>It also involves developing a sustainable withdrawal strategy to ensure your funds last throughout your retirement years. We\'ll discuss key factors to consider when creating a withdrawal plan, such as your expected lifespan, inflation, and investment returns, to help you strike the right balance between enjoying your retirement lifestyle and preserving your financial security.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n<h5>Planning before starting<\\/h5>\\r\\n<div>Whether you\'re just starting your career, mid-career, or approaching retirement age, it\'s never too early or too late to begin planning for your future. Join us as we empower you with the knowledge and tools you need to take control of your retirement destiny and embark on the path towards a financially secure and fulfilling retirement.<br \\/><\\/div>\",\"image\":\"67f75e6533f151744264805.webp\"}', NULL, 'basic', 'the-importance-of-networking-in-your-job-search', '2022-11-26 04:56:04', '2025-07-20 04:42:49'),
(50, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Latest Trends in Remote Work for 2023\",\"category\":\"Career Development\",\"description_nic\":\"Retirement planning is essential for ensuring financial security and peace of mind in your golden years. In this blog post, we discuss key retirement planning strategies, including setting retirement goals, estimating retirement expenses, maximizing retirement savings accounts, and creating a sustainable withdrawal plan. Whether you\'re decades away from retirement or nearing your retirement age, this guide will help you take proactive steps towards a financially secure future.<br \\/><br \\/>\\r\\n<h5>From setting clear retirement goals to estimating your future expenses and income needs<\\/h5>\\r\\n<div>we\'ll guide you through the process of creating a solid retirement plan tailored to your unique circumstances. Whether you\'re decades away from retirement or nearing your retirement age, this guide offers valuable insights to help you make informed decisions and take proactive steps towards achieving your retirement objectives.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n\\r\\n<blockquote style=\\\"font-style:italic;text-align:center;padding:20px;background:#f1f1f1;font-weight:500;font-size:18px;border-left:4px solid #0f53ff;\\\">Aenean metus lectus at id. Morbi aliquet commodo a sodales eget. Eu justo ante nibh et a turpis, aliquam phasellus hymenaeos, imperdiet eget cras sociosqu, tincidunt a amet. Faucibus urna luctus, arcu ni<\\/blockquote>\\r\\n\\r\\n\\r\\n<h5>Planning for retirement doesn\'t end with accumulating savings<\\/h5>\\r\\n<div>It also involves developing a sustainable withdrawal strategy to ensure your funds last throughout your retirement years. We\'ll discuss key factors to consider when creating a withdrawal plan, such as your expected lifespan, inflation, and investment returns, to help you strike the right balance between enjoying your retirement lifestyle and preserving your financial security.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n<h5>Planning before starting<\\/h5>\\r\\n<div>Whether you\'re just starting your career, mid-career, or approaching retirement age, it\'s never too early or too late to begin planning for your future. Join us as we empower you with the knowledge and tools you need to take control of your retirement destiny and embark on the path towards a financially secure and fulfilling retirement.<br \\/><\\/div>\",\"image\":\"67f75e586b8ff1744264792.webp\"}', NULL, 'basic', 'latest-trends-in-remote-work-for-2023', '2022-11-27 04:56:30', '2025-07-20 04:42:44'),
(51, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Unlocking Career Opportunities through Continuous Learning\",\"category\":\"Industry News\",\"description_nic\":\"Retirement planning is essential for ensuring financial security and peace of mind in your golden years. In this blog post, we discuss key retirement planning strategies, including setting retirement goals, estimating retirement expenses, maximizing retirement savings accounts, and creating a sustainable withdrawal plan. Whether you\'re decades away from retirement or nearing your retirement age, this guide will help you take proactive steps towards a financially secure future.<br \\/><br \\/>\\r\\n<h5>From setting clear retirement goals to estimating your future expenses and income needs<\\/h5>\\r\\n<div>we\'ll guide you through the process of creating a solid retirement plan tailored to your unique circumstances. Whether you\'re decades away from retirement or nearing your retirement age, this guide offers valuable insights to help you make informed decisions and take proactive steps towards achieving your retirement objectives.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n\\r\\n<blockquote style=\\\"font-style:italic;text-align:center;padding:20px;background:#f1f1f1;font-weight:500;font-size:18px;border-left:4px solid #0f53ff;\\\">Aenean metus lectus at id. Morbi aliquet commodo a sodales eget. Eu justo ante nibh et a turpis, aliquam phasellus hymenaeos, imperdiet eget cras sociosqu, tincidunt a amet. Faucibus urna luctus, arcu ni<\\/blockquote>\\r\\n\\r\\n\\r\\n<h5>Planning for retirement doesn\'t end with accumulating savings<\\/h5>\\r\\n<div>It also involves developing a sustainable withdrawal strategy to ensure your funds last throughout your retirement years. We\'ll discuss key factors to consider when creating a withdrawal plan, such as your expected lifespan, inflation, and investment returns, to help you strike the right balance between enjoying your retirement lifestyle and preserving your financial security.<br \\/><\\/div>\\r\\n<div><br \\/><\\/div>\\r\\n<h5>Planning before starting<\\/h5>\\r\\n<div>Whether you\'re just starting your career, mid-career, or approaching retirement age, it\'s never too early or too late to begin planning for your future. Join us as we empower you with the knowledge and tools you need to take control of your retirement destiny and embark on the path towards a financially secure and fulfilling retirement.<br \\/><\\/div>\",\"image\":\"67f75e4ccf3281744264780.webp\"}', NULL, 'basic', 'unlocking-career-opportunities-through-continuous-learning', '2022-11-28 04:56:55', '2025-07-20 04:42:31'),
(71, 'footer.content', '{\"has_image\":\"1\",\"footer_info_en\":\"<h2><span style=\\\"white-space:pre-wrap;\\\">C\\u00d4NG TY C\\u1ed4 PH\\u1ea6N KK SAPA<\\/span><\\/h2>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i: 84 (0) 214.379.8888<\\/span><\\/p>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">Email: info@kksapahotel.com<\\/span><\\/p>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">\\u0110\\u1ecba ch\\u1ec9: C\\u1ee5m KT-XH T\\u00e2n Ti\\u1ebfn, X\\u00e3 V\\u0129nh H\\u01b0ng, t\\u1ec9nh Ph\\u00fa Th\\u1ecd<\\/span><\\/p>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">M\\u00e3 s\\u1ed1 thu\\u1ebf: 5300699349 do S\\u1edf K\\u1ebf ho\\u1ea1ch v\\u00e0 \\u0110\\u1ea7u t\\u01b0 T\\u1ec9nh V\\u0129nh Ph\\u00fac c\\u1ea5p ng\\u00e0y 14\\/09\\/2015<\\/span><\\/p>\",\"footer_info_vi\":\"<h2><span style=\\\"white-space:pre-wrap;\\\">C\\u00d4NG TY C\\u1ed4 PH\\u1ea6N KK SAPA<\\/span><\\/h2>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">S\\u1ed1 \\u0111i\\u1ec7n tho\\u1ea1i: 84 (0) 214.379.8888<\\/span><\\/p>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">Email: info@kksapahotel.com<\\/span><\\/p>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">\\u0110\\u1ecba ch\\u1ec9: C\\u1ee5m KT-XH T\\u00e2n Ti\\u1ebfn, X\\u00e3 V\\u0129nh H\\u01b0ng, t\\u1ec9nh Ph\\u00fa Th\\u1ecd<\\/span><\\/p>\\r\\n\\r\\n<p><span style=\\\"white-space:pre-wrap;\\\">M\\u00e3 s\\u1ed1 thu\\u1ebf: 5300699349 do S\\u1edf K\\u1ebf ho\\u1ea1ch v\\u00e0 \\u0110\\u1ea7u t\\u01b0 T\\u1ec9nh V\\u0129nh Ph\\u00fac c\\u1ea5p ng\\u00e0y 14\\/09\\/2015<\\/span><\\/p>\",\"copyright_en\":\"Copyright Web360\",\"copyright_vi\":\"Copyright Web360\",\"footer_logo\":\"69c634f0801f11774597360.webp\"}', NULL, 'basic', '', '2022-11-20 17:21:18', '2026-03-27 07:42:40'),
(82, 'policy_pages.element', '{\"title\":\"Security Information\",\"details\":\"<div><h4 class=\\\"mb-2\\\">What information do we collect?<\\/h4><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How do we protect your information?<\\/h4><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h4><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h4><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h4><p>We will post those changes on this page if we decide to change our privacy policy.<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">How long we retain your information?<\\/h4><p>At the point when you register for our site, we cycle and keep the information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h4 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h4><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promotion of their items or administrations.<\\/p><\\/div>\"}', NULL, 'basic', 'security-information', '2022-12-14 04:23:30', '2025-04-05 05:50:00'),
(105, 'sponsored_companies.element', '{\"has_image\":[\"1\"],\"company_name\":\"Logistics Expertise Ltd.\",\"short_description\":\"A logistics and transportation company dedicated to efficient supply chain services.\",\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"location\":\"Bavaria, Germany\",\"image\":\"67f7989200da91744279698.webp\"}', NULL, 'basic', '', '2025-01-04 19:47:43', '2025-04-10 04:08:18'),
(106, 'sponsored_companies.element', '{\"has_image\":[\"1\"],\"company_name\":\"Finance Focus Group\",\"short_description\":\"An advisory firm offering financial planning, investment management, and tax services.\",\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"location\":\"Texas, United States\",\"image\":\"67f7988ad23641744279690.webp\"}', NULL, 'basic', '', '2025-01-04 20:33:21', '2025-04-10 04:08:10'),
(107, 'sponsored_companies.element', '{\"has_image\":[\"1\"],\"company_name\":\"HealthCare Partners\",\"short_description\":\"Provides healthcare services and solutions to improve patient care and outcomes.\",\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"location\":\"California, USA\",\"image\":\"67f79880606381744279680.webp\"}', NULL, 'basic', '', '2025-01-04 20:38:06', '2025-04-10 04:08:00'),
(108, 'sponsored_companies.element', '{\"has_image\":[\"1\"],\"company_name\":\"Creative Minds Agency\",\"short_description\":\"A full-service advertising and design agency focusing on innovative brand strategies.\",\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"location\":\"Washington, USA\",\"image\":\"67f79879129781744279673.webp\"}', NULL, 'basic', '', '2025-01-04 20:41:44', '2025-04-10 04:07:53'),
(109, 'sponsored_companies.element', '{\"has_image\":[\"1\"],\"company_name\":\"Green Energy Solutions\",\"short_description\":\"Offers comprehensive renewable energy consulting and project management.\",\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"location\":\"California, USA\",\"image\":\"67f79870a5ec71744279664.webp\"}', NULL, 'basic', '', '2025-01-04 20:53:31', '2025-04-10 04:07:44'),
(110, 'sponsored_companies.element', '{\"has_image\":[\"1\"],\"company_name\":\"Tech Innovators Inc.\",\"short_description\":\"A leading technology company specializing in software and digital solutions.\",\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"location\":\"California, USA\",\"image\":\"67f798648538c1744279652.webp\"}', NULL, 'basic', '', '2025-01-04 21:15:50', '2025-04-10 04:07:33'),
(111, 'banner.element', '{\"has_image\":\"1\",\"image\":\"67a334651caf01738749029.png\"}', NULL, 'basic', '', '2025-02-04 21:50:29', '2025-02-04 21:50:29'),
(112, 'banner.element', '{\"has_image\":\"1\",\"image\":\"67a33478ebd791738749048.png\"}', NULL, 'basic', '', '2025-02-04 21:50:48', '2025-02-04 21:50:48'),
(114, 'social_links.element', '{\"has_image\":\"1\",\"name\":\"Facebook\",\"url\":\"#\",\"icon_image\":\"69b3be840662a1773387396.webp\"}', NULL, 'basic', '', '2026-03-13 07:36:36', '2026-03-13 07:36:40'),
(115, 'header.content', '{\"has_image\":\"1\",\"header_logo\":\"69c634de34f101774597342.webp\",\"header_logo_white_background\":\"69c66115275521774608661.webp\"}', NULL, 'basic', '', '2026-03-23 09:07:41', '2026-03-27 10:51:01'),
(117, 'fixed_social_links.element', '{\"has_image\":\"1\",\"name_en\":\"JivoChat\",\"name_vi\":\"JivoChat\",\"url_en\":\"#\",\"url_vi\":\"#\",\"icon_image\":\"69c636b3d348c1774597811.webp\"}', NULL, 'basic', '', '2026-03-23 09:23:06', '2026-03-27 07:50:11'),
(118, 'fixed_social_links.element', '{\"has_image\":\"1\",\"name_en\":\"Zalo\",\"name_vi\":\"Zalo\",\"url_en\":\"#\",\"url_vi\":\"#\",\"icon_image\":\"69c636a5d5b121774597797.webp\"}', NULL, 'basic', '', '2026-03-23 09:23:32', '2026-03-27 07:49:57'),
(119, 'fixed_social_links.element', '{\"has_image\":\"1\",\"name_en\":\"Message\",\"name_vi\":\"Message\",\"url_en\":\"#\",\"url_vi\":\"#\",\"icon_image\":\"69c63668ab9711774597736.webp\"}', NULL, 'basic', '', '2026-03-23 09:24:27', '2026-03-27 07:48:56'),
(120, 'fixed_social_links.element', '{\"has_image\":\"1\",\"name_en\":\"Whatsapp\",\"name_vi\":\"Whatsapp\",\"url_en\":\"#\",\"url_vi\":\"#\",\"icon_image\":\"69c6365b9c63b1774597723.webp\"}', NULL, 'basic', '', '2026-03-23 09:24:46', '2026-03-27 07:48:43'),
(121, 'hero_slider.element', '{\"has_image\":[\"1\"],\"title_en\":\"Relax into our luxury 2\",\"title_vi\":\"Relax into our luxury 2\",\"button_text_en\":\"Explore\",\"button_text_vi\":\"Explore\",\"button_link_en\":\"#\",\"button_link_vi\":\"#\",\"image\":\"69c639c3bbe621774598595.webp\"}', NULL, 'basic', '', '2026-03-24 01:39:50', '2026-03-27 08:03:18'),
(122, 'hero_slider.element', '{\"has_image\":[\"1\"],\"title_en\":\"Relax into our luxury\",\"title_vi\":\"Relax into our luxury\",\"button_text_en\":\"Explore\",\"button_text_vi\":\"Explore\",\"button_link_en\":\"#\",\"button_link_vi\":\"#\",\"image\":\"69c636e542cf51774597861.webp\"}', NULL, 'basic', '', '2026-03-24 01:42:07', '2026-03-27 11:07:45'),
(123, 'about.element', '{\"title_en\":\"Prime Central Location\",\"title_vi\":\"V\\u1ecb tr\\u00ed trung t\\u00e2m \\u0111\\u1eafc \\u0111\\u1ecba\",\"has_image\":[\"1\"],\"image\":\"69c635b6d2fe21774597558.webp\"}', NULL, 'basic', '', '2026-03-24 03:01:37', '2026-03-27 07:45:58'),
(124, 'about.element', '{\"title_en\":\"Majestic Mountain Views\",\"title_vi\":\"C\\u1ea3nh quan n\\u00fai non h\\u00f9ng v\\u0129\",\"has_image\":[\"1\"],\"image\":\"69c635a4be1051774597540.webp\"}', NULL, 'basic', '', '2026-03-24 03:02:14', '2026-03-27 07:45:40'),
(125, 'about.element', '{\"title_en\":\"Elegant Spacious Living\",\"title_vi\":\"S\\u1ed1ng r\\u1ed9ng r\\u00e3i thanh l\\u1ecbch\",\"has_image\":[\"1\"],\"image\":\"69c63568b2b701774597480.webp\"}', NULL, 'basic', '', '2026-03-24 03:02:44', '2026-03-27 07:44:40'),
(126, 'about.element', '{\"title_en\":\"Gourmet Breakfast Selection\",\"title_vi\":\"L\\u1ef1a ch\\u1ecdn b\\u1eefa s\\u00e1ng cao c\\u1ea5p\",\"has_image\":[\"1\"],\"image\":\"69c63553516401774597459.webp\"}', NULL, 'basic', '', '2026-03-24 03:03:01', '2026-03-27 07:44:19'),
(127, 'about.element', '{\"title_en\":\"Heartfelt Hospitality\",\"title_vi\":\"L\\u00f2ng hi\\u1ebfu kh\\u00e1ch ch\\u00e2n th\\u00e0nh\",\"has_image\":[\"1\"],\"image\":\"69c6350bf30fa1774597387.webp\"}', NULL, 'basic', '', '2026-03-24 03:03:18', '2026-03-27 07:43:08'),
(128, 'accommodation.content', '{\"heading\":\"ACCOMMODATION\",\"button_text\":\"VIEW ALL ROOM\",\"button_link\":\"room\"}', NULL, 'templates.basic.', NULL, '2026-03-24 03:57:19', '2026-03-24 03:57:19'),
(129, 'accommodation.content', '{\"heading_en\":\"Accommodation\",\"heading_vi\":\"H\\u1ea1ng ph\\u00f2ng\",\"button_text_en\":\"VIEW ALL ROOM\",\"button_text_vi\":\"Xem t\\u1ea5t c\\u1ea3 c\\u00e1c ph\\u00f2ng\",\"button_link_en\":\"#\",\"button_link_vi\":\"#\"}', NULL, 'basic', '', '2026-03-24 04:01:42', '2026-03-24 04:01:42'),
(130, 'special_offer.content', '{\"heading_en\":\"Special Offer\",\"heading_vi\":\"\\u01afu \\u0111\\u00e3i \\u0111\\u1eb7c bi\\u1ec7t\"}', NULL, 'basic', '', '2026-03-24 04:45:53', '2026-03-24 04:45:53'),
(131, 'explore_services.content', '{\"heading_en\":\"EXPLORE OUR SERVICES\",\"heading_vi\":\"KH\\u00c1M PH\\u00c1 D\\u1ecaCH V\\u1ee4 C\\u1ee6A CH\\u00daNG T\\u00d4I\"}', NULL, 'basic', '', '2026-03-24 07:27:48', '2026-03-24 07:28:03'),
(132, 'mice_events.content', '{\"heading_en\":\"meetings & events\",\"heading_vi\":\"meetings & events\"}', NULL, 'basic', '', '2026-03-24 08:20:33', '2026-03-24 08:20:33'),
(133, 'facilities.content', '{\"has_image\":\"1\",\"heading_en\":\"FACILITIES\",\"heading_vi\":\"Ti\\u1ec7n \\u00edch\",\"background_image\":\"69c255134c5dc1774343443.webp\"}', NULL, 'basic', '', '2026-03-24 09:10:43', '2026-03-24 09:10:44'),
(134, 'travel_guides.content', '{\"heading_en\":\"travel guides\",\"heading_vi\":\"travel guides\"}', NULL, 'basic', '', '2026-03-24 11:02:07', '2026-03-24 11:02:07'),
(135, 'newsletter.content', '{\"heading_en\":\"Newsletter Sign-Up\",\"heading_vi\":\"Newsletter Sign-Up\"}', NULL, 'basic', '', '2026-03-24 11:24:44', '2026-03-24 11:24:44'),
(136, 'social_links.element', '{\"has_image\":\"1\",\"name_en\":\"Titktok\",\"name_vi\":\"Titktok\",\"url_en\":\"#\",\"url_vi\":\"#\",\"icon_image\":\"69c2825e445791774355038.webp\"}', NULL, 'basic', '', '2026-03-24 12:23:58', '2026-03-24 12:23:58'),
(137, 'fixed_social_links.element', '{\"has_image\":\"1\",\"name_en\":\"Tripadvisor\",\"name_vi\":\"Tripadvisor\",\"url_en\":\"#\",\"url_vi\":\"#\",\"icon_image\":\"69c63640534fb1774597696.webp\"}', NULL, 'basic', '', '2026-03-25 02:26:15', '2026-03-27 07:48:16'),
(138, 'inner_slider.element', '{\"page_slug_en\":\"accommodation\",\"page_slug_vi\":\"accommodation\",\"has_image\":[\"1\"],\"title_en\":\"Accommodation\",\"title_vi\":\"H\\u1ea1ng ph\\u00f2ng\",\"image\":\"69c6361cef1521774597660.webp\"}', NULL, 'basic', '', '2026-03-25 04:53:47', '2026-03-27 07:47:43'),
(139, 'inner_slider.element', '{\"page_slug_en\":\"accommodation\",\"page_slug_vi\":\"accommodation\",\"has_image\":[\"1\"],\"title_en\":\"Accommodation 2\",\"title_vi\":\"Accommodation 2\",\"image\":\"69c636011f7061774597633.webp\"}', NULL, 'basic', '', '2026-03-25 04:54:13', '2026-03-27 07:47:15'),
(140, 'inner_slider.element', '{\"page_slug_en\":\"accommodation\",\"page_slug_vi\":\"accommodation\",\"has_image\":[\"1\"],\"title_en\":\"accommodation 3\",\"title_vi\":\"accommodation 3\",\"image\":\"69c635eee5b5d1774597614.webp\"}', NULL, 'basic', '', '2026-03-25 04:54:37', '2026-03-27 07:46:57'),
(141, 'feature_icons.element', '{\"has_image\":\"1\",\"title_en\":\"Complimentary WiFi\",\"title_vi\":\"Complimentary WiFi\",\"icon\":\"69c3cb9a8b3fc1774439322.webp\"}', NULL, 'basic', '', '2026-03-25 11:48:42', '2026-03-25 11:48:49'),
(142, 'feature_icons.element', '{\"has_image\":\"1\",\"title_en\":\"Exceptional value\",\"title_vi\":\"Exceptional value\",\"icon\":\"69c3cbb59eb5c1774439349.webp\"}', NULL, 'basic', '', '2026-03-25 11:49:09', '2026-03-25 11:49:09'),
(143, 'feature_icons.element', '{\"has_image\":\"1\",\"title_en\":\"Cozy elegance\",\"title_vi\":\"Cozy elegance\",\"icon\":\"69c3cbc59cc7f1774439365.webp\"}', NULL, 'basic', '', '2026-03-25 11:49:25', '2026-03-25 11:49:25'),
(144, 'inner_slider.element', '{\"page_slug_en\":\"special-offers\",\"page_slug_vi\":\"special-offers\",\"has_image\":[\"1\"],\"title_en\":\"Special Offers\",\"title_vi\":\"\\u01afu \\u0111\\u00e3i \\u0111\\u1eb7c bi\\u1ec7t\",\"image\":\"69c635dd7707e1774597597.webp\"}', NULL, 'basic', '', '2026-03-26 06:54:09', '2026-03-27 07:46:40'),
(145, 'inner_slider.element', '{\"page_slug_en\":\"metting-events\",\"page_slug_vi\":\"metting-events\",\"has_image\":[\"1\"],\"title_en\":\"Metting & Events\",\"title_vi\":\"G\\u1eb7p m\\u1eb7t & S\\u1ef1 ki\\u1ec7n\",\"image\":\"69c635cde8ecc1774597581.webp\"}', NULL, 'basic', '', '2026-03-26 08:24:44', '2026-03-27 07:46:24'),
(146, 'inner_slider.element', '{\"page_slug_en\":\"travel-guide\",\"page_slug_vi\":\"travel-guide\",\"has_image\":[\"1\"],\"title_en\":\"travel-guide\",\"title_vi\":\"travel-guide\",\"image\":\"69c6480b1bce81774602251.webp\"}', NULL, 'basic', '', '2026-03-27 09:04:11', '2026-03-27 09:04:12'),
(147, 'inner_slider.element', '{\"page_slug_en\":\"travel-guide\",\"page_slug_vi\":\"travel-guide\",\"has_image\":[\"1\"],\"title_en\":\"travel-guide\",\"title_vi\":\"travel-guide\",\"image\":\"69c648172b0161774602263.webp\"}', NULL, 'basic', '', '2026-03-27 09:04:23', '2026-03-27 09:04:24'),
(148, 'contact_form.content', '{\"title_en\":\"Contact Form\",\"title_vi\":\"Form li\\u00ean h\\u1ec7\",\"description_en\":\"\\u2068Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula.\",\"description_vi\":\"Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula.\",\"has_image\":\"1\",\"google_map_iframe\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d4454.683038059518!2d103.84208477592811!3d22.3305397417975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x36cd41eaf39867b1%3A0xa2c2f5d105454d63!2sKK%20Sapa%20Hotel!5e1!3m2!1svi!2s!4v1774607918518!5m2!1svi!2s\\\" width=\\\"600\\\" height=\\\"450\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\"><\\/iframe>\",\"banner\":\"69c65e3bb07f41774607931.webp\"}', NULL, 'basic', '', '2026-03-27 10:38:51', '2026-03-27 11:08:21'),
(149, 'inner_slider.element', '{\"page_slug_en\":\"contact\",\"page_slug_vi\":\"contact\",\"has_image\":[\"1\"],\"title_en\":\"Contact\",\"title_vi\":\"Li\\u00ean h\\u1ec7\",\"image\":\"69c66057c9b6d1774608471.webp\"}', NULL, 'basic', '', '2026-03-27 10:47:51', '2026-03-27 10:47:54'),
(150, 'inner_slider.element', '{\"page_slug_en\":\"contact\",\"page_slug_vi\":\"contact\",\"has_image\":[\"1\"],\"title_en\":\"Contact\",\"title_vi\":\"Li\\u00ean h\\u1ec7\",\"image\":\"69c66079975391774608505.webp\"}', NULL, 'basic', '', '2026-03-27 10:48:25', '2026-03-27 10:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firebase_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT '1',
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `employer_registration` tinyint(1) NOT NULL DEFAULT '0',
  `active_template` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socialite_credentials` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `system_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `paginate_number` int NOT NULL DEFAULT '0',
  `available_version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` int NOT NULL DEFAULT '0' COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `config_progress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_cron` datetime DEFAULT NULL,
  `cron_error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resume_percentage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fee_per_job_post` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `free_job_post_limit` int NOT NULL DEFAULT '0',
  `free_job_post` tinyint(1) NOT NULL DEFAULT '0',
  `job_post_payment` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `mail_config`, `sms_config`, `firebase_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `pn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `multi_language`, `registration`, `employer_registration`, `active_template`, `socialite_credentials`, `system_info`, `system_customized`, `paginate_number`, `available_version`, `currency_format`, `config_progress`, `last_cron`, `cron_error_message`, `resume_percentage`, `fee_per_job_post`, `free_job_post_limit`, `free_job_post`, `job_post_payment`, `created_at`, `updated_at`) VALUES
(1, 'KK Spa & Hotel', 'USD', '$', 'no-reply@viserlab.com', NULL, '<html>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>\n</title>\n<style type=\"text/css\">\n	.ReadMsgBody {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass {\n		width: 100%;\n		background-color: #ffffff;\n	}\n	.ExternalClass,\n	.ExternalClass p,\n	.ExternalClass span,\n	.ExternalClass font,\n	.ExternalClass td,\n	.ExternalClass div {\n		line-height: 100%;\n	}\n	html {\n		width: 100%;\n	}\n	body {\n		-webkit-text-size-adjust: none;\n		-ms-text-size-adjust: none;\n		margin: 0;\n		padding: 0;\n	}\n	table {\n		border-spacing: 0;\n		table-layout: fixed;\n		margin: 0 auto;\n		border-collapse: collapse;\n	}\n	table table table {\n		table-layout: auto;\n	}\n	.yshortcuts a {\n		border-bottom: none !important;\n	}\n	img:hover {\n		opacity: 0.9 !important;\n	}\n	a {\n		color: #0087ff;\n		text-decoration: none;\n	}\n	.textbutton a {\n		font-family: \"open sans\", arial, sans-serif !important;\n	}\n	.btn-link a {\n		color: #ffffff !important;\n	}\n	@media only screen and (max-width: 480px) {\n		body {\n			width: auto !important;\n		}\n		*[class=\"table-inner\"] {\n			width: 90% !important;\n			text-align: center !important;\n		}\n		*[class=\"table-full\"] {\n			width: 100% !important;\n			text-align: center !important;\n		} /* image */\n		img[class=\"img1\"] {\n			width: 100% !important;\n			height: auto !important;\n		}\n	}\n\n</style>\n<table bgcolor=\"#030442\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td height=\"50\">\n			</td>\n		</tr>\n		<tr>\n			<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n					<tbody>\n						<tr>\n							<td align=\"center\" width=\"600\">\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\n												<table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">\n															This is a System Generated Email</td>\n														</tr>\n														<tr>\n															<td height=\"20\">\n															</td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n								<table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n									<tbody>\n										<tr>\n											<td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"35\">\n															</td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"vertical-align:top;font-size:0;\">\n																<a href=\"#\">\n																	<img style=\"display:block; line-height:0px; font-size:0px; border:0px; width: 240px;\" width=\"240px\" src=\"https://viserlab.com/assets/images/logoIcon/logo-dark.png\" alt=\"img\">\n																</a>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"40\"></td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"font-family: Open Sans, Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">\n															Hello {{fullname}} ({{username}}) </td>\n														</tr>\n														<tr>\n															<td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n																<table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n																	<tbody>\n																		<tr>\n																			<td height=\"20\" style=\" border-bottom:3px solid #0087ff;\">\n																			</td>\n																		</tr>\n																	</tbody>\n																</table>\n															</td>\n														</tr>\n														<tr>\n															<td height=\"30\"></td>\n														</tr>\n														<tr>\n															<td align=\"left\" style=\"font-family: Open sans, Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">\n															{{message}}</td>\n														</tr>\n														<tr>\n															<td height=\"60\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n										<tr>\n											<td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\n												<table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n													<tbody>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n														<tr>\n															<td class=\"preference-link\" align=\"center\" style=\"font-family: Open sans, Arial, sans-serif; color:#95a5a6; font-size:14px;\">\n																© 2023 <a href=\"#\">{{site_name}}</a> &nbsp;. All Rights Reserved. </td>\n														</tr>\n														<tr>\n															<td height=\"10\"></td>\n														</tr>\n													</tbody>\n												</table>\n											</td>\n										</tr>\n									</tbody>\n								</table>\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n		<tr>\n			<td height=\"60\"></td>\n		</tr>\n	</tbody>\n</table>\n</html>\n', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', NULL, NULL, '1f2937', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\"apiKey\":\"--------\",\"authDomain\":\"----------\",\"projectId\":\"---------\",\"storageBucket\":\"--------\",\"messagingSenderId\":\"--------\",\"appId\":\"-----------\",\"measurementId\":\"-------\"}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 'basic', '{\"google\":{\"client_id\":\"-------------------\",\"client_secret\":\"-------------------\",\"status\":0},\"facebook\":{\"client_id\":\"-------------------\",\"client_secret\":\"-------------------\",\"status\":0},\"linkedin\":{\"client_id\":\"----------------\",\"client_secret\":\"---------------\",\"status\":0}}', '[]', 0, 20, '4.1', 2, '[\"general_setting\",\"logo_favicon\",\"seo\"]', '2025-07-20 08:37:32', NULL, '{\"email_verification\":\"5\",\"mobile_verification\":\"10\",\"preferred_location\":\"3\",\"resume\":\"10\",\"company_job_title\":\"10\",\"department\":\"10\",\"industry_type\":\"3\",\"photo_upload\":\"5\",\"education\":\"10\",\"language\":\"5\",\"summary\":\"8\",\"resume_headline\":\"8\",\"personal_detail\":\"5\",\"skill\":\"8\"}', '2.00000000', 2, 0, 0, NULL, '2026-03-25 04:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `job_keyword`
--

CREATE TABLE `job_keyword` (
  `id` bigint NOT NULL,
  `job_id` int NOT NULL DEFAULT '0',
  `keyword_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL COMMENT '1: category_post, 2: post, 3: category_room, 4: room, 5: category_restaurant, 6: restaurant',
  `key_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `slug`, `type`, `key_id`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 'test-danh-muc', 3, 1, 'en', '2026-03-12 08:42:22', '2026-03-12 08:42:22'),
(2, 'test-1', 3, 1, 'hi', '2026-03-12 08:42:22', '2026-03-26 03:21:19'),
(3, 'test-2', 3, 1, 'bn', '2026-03-12 08:42:22', '2026-03-26 03:21:19'),
(4, 'test', 3, 1, 'vi', '2026-03-12 08:42:22', '2026-03-12 08:42:22'),
(5, 'test-danh-muc22', 3, 2, 'en', '2026-03-12 08:57:39', '2026-03-12 08:57:39'),
(6, 'family-room', 4, 1, 'en', '2026-03-12 08:58:49', '2026-03-12 12:47:15'),
(12, 'sn-chi-restaurant', 6, 6, 'en', '2026-03-13 02:58:26', '2026-03-13 02:58:26'),
(13, 'hoa-mai-demo', 7, 1, 'en', '2026-03-23 03:24:55', '2026-03-27 04:38:52'),
(14, 'pool-demo', 8, 1, 'en', '2026-03-23 08:26:06', '2026-03-27 07:29:08'),
(15, 'demo-lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis', 2, 1, 'en', '2026-03-23 09:02:40', '2026-03-27 10:26:15'),
(16, 'nha-hang-sin-chai', 6, 6, 'vi', '2026-03-24 02:09:11', '2026-03-24 02:09:11'),
(17, 'hoa-mai', 7, 1, 'vi', '2026-03-24 02:12:13', '2026-03-24 02:12:13'),
(18, 'superior-room', 4, 2, 'en', '2026-03-24 03:39:46', '2026-03-24 03:39:46'),
(19, 'phng-superior', 4, 2, 'vi', '2026-03-24 03:39:46', '2026-03-24 03:39:46'),
(20, 'deluxe-room', 4, 3, 'en', '2026-03-24 03:42:02', '2026-03-24 03:42:02'),
(21, 'phng-deluxe', 4, 3, 'vi', '2026-03-24 03:42:02', '2026-03-24 03:42:02'),
(22, 'premier-room', 4, 4, 'en', '2026-03-24 03:45:16', '2026-03-24 03:45:16'),
(23, 'phng-cao-cp', 4, 4, 'vi', '2026-03-24 03:45:16', '2026-03-24 03:45:16'),
(24, 'grand-family', 4, 5, 'en', '2026-03-24 03:50:08', '2026-03-24 03:50:08'),
(25, 'dai-gia-dinh', 4, 5, 'vi', '2026-03-24 03:50:08', '2026-03-26 05:00:07'),
(26, 'phng-gia-nh', 4, 1, 'vi', '2026-03-24 03:56:06', '2026-03-24 03:56:06'),
(27, 't-phn-restaurant', 6, 7, 'en', '2026-03-24 07:02:25', '2026-03-24 07:02:25'),
(28, 'nh-hng-t-phn', 6, 7, 'vi', '2026-03-24 07:02:25', '2026-03-24 07:02:25'),
(29, 'bn-h-bar-1', 6, 8, 'en', '2026-03-24 07:03:47', '2026-03-26 03:21:19'),
(30, 'bn-h-bar', 6, 8, 'vi', '2026-03-24 07:03:47', '2026-03-24 07:03:47'),
(31, 'dao-spa-1', 6, 9, 'en', '2026-03-24 07:04:55', '2026-03-26 03:21:19'),
(32, 'dao-spa', 6, 9, 'vi', '2026-03-24 07:04:55', '2026-03-24 07:04:55'),
(33, 'shuttle-service', 6, 10, 'en', '2026-03-24 07:07:25', '2026-03-24 07:07:25'),
(34, 'dch-v-a-n', 6, 10, 'vi', '2026-03-24 07:07:25', '2026-03-24 07:07:25'),
(35, 'hoa-lan-1', 7, 2, 'en', '2026-03-24 08:18:59', '2026-03-26 03:21:19'),
(36, 'hoa-lan', 7, 2, 'vi', '2026-03-24 08:18:59', '2026-03-24 08:18:59'),
(37, 'hoa-ban-1', 7, 3, 'en', '2026-03-24 08:19:30', '2026-03-26 03:21:19'),
(38, 'hoa-ban', 7, 3, 'vi', '2026-03-24 08:19:30', '2026-03-24 08:19:30'),
(39, 'bar-vip-lounge-1', 8, 2, 'en', '2026-03-24 08:55:12', '2026-03-26 03:21:19'),
(40, 'bar-vip-lounge', 8, 2, 'vi', '2026-03-24 08:55:12', '2026-03-24 08:55:12'),
(41, 'pool', 8, 1, 'vi', '2026-03-24 08:55:27', '2026-03-24 08:55:27'),
(42, 'rose-garden-1', 8, 3, 'en', '2026-03-24 08:56:10', '2026-03-26 03:21:19'),
(43, 'rose-garden', 8, 3, 'vi', '2026-03-24 08:56:10', '2026-03-24 08:56:10'),
(44, 'kids-club-1', 8, 4, 'en', '2026-03-24 08:56:48', '2026-03-26 03:21:19'),
(45, 'kids-club', 8, 4, 'vi', '2026-03-24 08:56:48', '2026-03-24 08:56:48'),
(46, 'gym-yoga-1', 8, 5, 'en', '2026-03-24 08:57:21', '2026-03-26 03:21:19'),
(47, 'gym-yoga', 8, 5, 'vi', '2026-03-24 08:57:21', '2026-03-24 08:57:21'),
(50, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-3', 2, 4, 'en', '2026-03-24 10:56:27', '2026-03-24 10:56:27'),
(51, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-34', 2, 4, 'vi', '2026-03-24 10:56:27', '2026-03-24 10:56:27'),
(52, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin', 2, 1, 'vi', '2026-03-24 10:56:57', '2026-03-24 10:56:57'),
(53, 'the-creation-of-a-unique-project-a-wooden-bedroom-in-a-futuristic-style-took-the-woodtech-team-two-months-1', 2, 5, 'en', '2026-03-24 10:57:49', '2026-03-26 03:21:19'),
(54, 'the-creation-of-a-unique-project-a-wooden-bedroom-in-a-futuristic-style-took-the-woodtech-team-two-months', 2, 5, 'vi', '2026-03-24 10:57:49', '2026-03-24 10:57:49'),
(55, '/', 10, 1, 'vi', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(56, 'contact', 10, 5, 'vi', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(57, 'accommodation', 10, 26, 'vi', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(58, 'hanoi-sapa-all-inclusive-package', 9, 1, 'en', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(59, 'gi-du-lch-trn-gi-hanoi-sapa', 9, 1, 'vi', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(60, 'hanoi-sapa-all-inclusive-package-1', 9, 2, 'en', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(61, 'gi-du-lch-trn-gi-hanoi-sapa-1', 9, 2, 'vi', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(62, 'hanoi-sapa-all-inclusive-package-2', 9, 3, 'en', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(63, 'gi-du-lch-trn-gi-hanoi-sapa-2', 9, 3, 'vi', '2026-03-26 03:21:19', '2026-03-26 03:21:19'),
(64, 'special-offers', 10, 27, 'vi', '2026-03-26 06:46:00', '2026-03-26 06:46:00'),
(66, 'hanoi-sapa-all-inclusive-package-3', 9, 5, 'en', '2026-03-26 08:05:48', '2026-03-26 08:05:48'),
(67, 'hanoi-sapa-all-inclusive-package-4', 9, 5, 'vi', '2026-03-26 08:05:48', '2026-03-26 08:05:48'),
(68, 'metting-events', 10, 28, 'vi', '2026-03-26 08:23:11', '2026-03-26 08:23:11'),
(69, 'travel-guide', 10, 29, 'vi', '2026-03-27 09:02:55', '2026-03-27 09:02:55'),
(70, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-4', 2, 6, 'en', '2026-03-27 09:10:46', '2026-03-27 09:10:46'),
(71, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-456', 2, 6, 'vi', '2026-03-27 09:10:46', '2026-03-27 09:10:46'),
(72, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin3123123123', 2, 7, 'en', '2026-03-27 09:13:34', '2026-03-27 09:13:34'),
(73, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin23131231', 2, 7, 'vi', '2026-03-27 09:13:34', '2026-03-27 09:13:34'),
(74, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin23123444566', 2, 8, 'en', '2026-03-27 09:14:16', '2026-03-27 09:14:16'),
(75, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin231234445662', 2, 8, 'vi', '2026-03-27 09:14:16', '2026-03-27 09:14:16'),
(76, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin11111', 2, 9, 'en', '2026-03-27 09:20:17', '2026-03-27 09:20:17'),
(77, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin22222', 2, 9, 'vi', '2026-03-27 09:20:17', '2026-03-27 09:20:17'),
(78, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin444', 2, 10, 'en', '2026-03-27 09:24:34', '2026-03-27 09:24:34'),
(79, 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin6666', 2, 10, 'vi', '2026-03-27 09:24:34', '2026-03-27 09:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `image`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '67f0c58900cf71743832457.webp', '2020-07-06 03:47:55', '2026-03-24 03:08:20'),
(13, 'Việt Nam', 'vi', 0, '69a64dfcd8c161772506620.webp', '2026-03-02 19:57:00', '2026-03-24 03:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `name`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Menu header Trái', 'menu_header_left', 1, '2026-03-13 02:18:15', '2026-03-13 02:18:15'),
(2, 'Menu header Phải', 'menu_header_right', 1, '2026-03-13 02:18:33', '2026-03-13 02:18:33'),
(3, 'Footer About us menu', 'footer_about_us_menu', 1, '2026-03-13 02:19:05', '2026-03-13 02:19:05'),
(4, 'Footer accommodation', 'footer_accommodation', 1, '2026-03-24 11:37:14', '2026-03-24 11:37:14'),
(5, 'Footer DINING & BAR', 'footer_dining_bar', 1, '2026-03-24 11:42:53', '2026-03-24 11:42:53'),
(6, 'Footer meetings & events', 'footer_meetings_events', 1, '2026-03-24 11:43:29', '2026-03-24 11:43:29'),
(7, 'Footer FACILITIES', 'footer_facilities', 1, '2026-03-24 11:44:09', '2026-03-24 11:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_group_id` bigint UNSIGNED DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_group_id`, `parent_id`, `title`, `url`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'Home', '/', 1, 1, '2026-03-23 11:15:28', '2026-03-23 11:15:28'),
(2, 1, 0, 'Accommodation', '/accommodation', 2, 1, '2026-03-23 11:15:28', '2026-03-26 09:00:09'),
(3, 1, 0, 'Special Offer', '#', 3, 1, '2026-03-23 11:15:28', '2026-03-23 11:15:28'),
(4, 1, 0, 'DINING & BAR', '#', 4, 1, '2026-03-23 11:15:28', '2026-03-23 11:15:28'),
(5, 1, 0, 'dao spa', '#', 5, 1, '2026-03-23 11:15:28', '2026-03-23 11:15:28'),
(6, 2, 0, 'meetings & events', '#', 1, 1, '2026-03-23 11:15:28', '2026-03-23 11:15:28'),
(7, 2, 0, 'FACILITIES', '#', 2, 1, '2026-03-23 11:15:28', '2026-03-23 11:15:28'),
(8, 2, 0, 'Travel Guide', '#', 3, 1, '2026-03-23 11:15:29', '2026-03-23 11:15:29'),
(9, 2, 0, 'Contact us', '/contact', 4, 1, '2026-03-23 11:15:29', '2026-03-23 11:15:29'),
(10, 2, 6, 'HOA MAI BALLROOM', '#', 1, 1, '2026-03-23 11:21:56', '2026-03-23 11:21:56'),
(11, 2, 6, 'HOA LAN BALLROOM', '#', 2, 1, '2026-03-23 11:21:56', '2026-03-23 11:21:56'),
(12, 2, 6, 'HOA BAN BALLROOM', '#', 3, 1, '2026-03-23 11:21:56', '2026-03-23 11:21:56'),
(13, 1, 2, 'Superior Room', '/superior-room', 1, 1, '2026-03-23 12:01:13', '2026-03-26 09:00:56'),
(14, 1, 2, 'Deluxe Room', '/deluxe-room', 2, 1, '2026-03-23 12:01:32', '2026-03-26 09:01:25'),
(15, 1, 2, 'Premier Room', '/premier-room', 3, 1, '2026-03-23 12:01:53', '2026-03-26 09:01:49'),
(16, 1, 2, 'Family Room', '/family-room', 4, 1, '2026-03-23 12:02:13', '2026-03-26 09:02:21'),
(17, 1, 2, 'Grand Family Room', '#', 5, 1, '2026-03-23 12:02:31', '2026-03-23 12:02:31'),
(18, 1, 2, 'Mountain Suite', '#', 6, 1, '2026-03-23 12:02:52', '2026-03-23 12:02:52'),
(19, 1, 2, 'President Suite', '#', 7, 1, '2026-03-23 12:03:17', '2026-03-23 12:03:17'),
(20, 1, 4, 'SÍn chải RESTAURANT', '#', 1, 1, '2026-03-23 12:03:48', '2026-03-23 12:03:48'),
(21, 1, 4, 'Tả PHÌN RESTAURANT', '#', 2, 1, '2026-03-23 12:04:12', '2026-03-23 12:04:12'),
(22, 1, 4, 'BẢN HỒ BAR', '#', 3, 1, '2026-03-23 12:04:48', '2026-03-23 12:04:48'),
(23, 1, 4, 'BBQ', '#', 4, 1, '2026-03-23 12:05:26', '2026-03-23 12:05:26'),
(24, 2, 7, 'Gym - yoga', '#', 1, 1, '2026-03-23 12:05:48', '2026-03-23 12:05:48'),
(25, 2, 7, 'Bar - Vip Lounge', '#', 2, 1, '2026-03-23 12:06:05', '2026-03-23 12:06:05'),
(26, 2, 7, 'ALL-SEASON POOL', '#', 3, 1, '2026-03-23 12:08:11', '2026-03-23 12:08:11'),
(27, 2, 7, 'Rose Garden', '#', 4, 1, '2026-03-23 12:08:28', '2026-03-23 12:08:28'),
(28, 2, 7, 'Kid\'s Club', '#', 5, 1, '2026-03-23 12:08:47', '2026-03-23 12:08:47'),
(29, 3, 0, 'About us', '#', 1, 1, '2026-03-24 11:50:19', '2026-03-24 11:50:19'),
(30, 3, 0, 'Special Offer', '#', 2, 1, '2026-03-24 11:51:16', '2026-03-24 11:51:16'),
(31, 3, 0, 'Travel Guide', '#', 3, 1, '2026-03-24 11:51:45', '2026-03-24 11:51:45'),
(32, 3, 0, 'Contact us', '#', 4, 1, '2026-03-24 11:52:16', '2026-03-24 11:52:16'),
(33, 3, 0, 'dao spa', '#', 5, 1, '2026-03-24 11:52:41', '2026-03-24 11:52:41'),
(34, 4, 0, 'Superior Room', '#', 1, 1, '2026-03-24 11:53:14', '2026-03-24 11:53:14'),
(35, 4, 0, 'Deluxe Room', '#', 2, 1, '2026-03-24 11:53:44', '2026-03-24 11:53:44'),
(36, 4, 0, 'Premier Room', '#', 3, 1, '2026-03-24 11:54:06', '2026-03-24 11:54:06'),
(37, 4, 0, 'Family Room', '#', 4, 1, '2026-03-24 11:54:31', '2026-03-24 11:54:31'),
(38, 4, 0, 'Grand Family Room', '#', 5, 1, '2026-03-24 11:55:01', '2026-03-24 11:55:01'),
(39, 4, 0, 'Mountain Suite', '#', 6, 1, '2026-03-24 11:55:18', '2026-03-24 11:55:18'),
(40, 4, 0, 'President Suite', '#', 7, 1, '2026-03-24 11:55:41', '2026-03-24 11:55:41'),
(41, 5, 0, 'SÍn chải RESTAURANT', '#', 1, 1, '2026-03-24 11:56:14', '2026-03-24 11:56:14'),
(42, 5, 0, 'Tả PHÌN RESTAURAN', '#', 2, 1, '2026-03-24 11:56:31', '2026-03-24 11:56:31'),
(43, 5, 0, 'BẢN HỒ BAR', '#', 3, 1, '2026-03-24 11:56:51', '2026-03-24 11:56:51'),
(44, 5, 0, 'BBQ', '#', 4, 1, '2026-03-24 11:57:17', '2026-03-24 11:57:17'),
(45, 6, 0, 'HOA MAI BALLROOM', '#', 1, 1, '2026-03-24 11:57:53', '2026-03-24 11:57:53'),
(46, 6, 0, 'HOA LAN BALLROOM', '#', 2, 1, '2026-03-24 11:58:18', '2026-03-24 11:58:18'),
(47, 6, 0, 'HOA BAN BALLROOM', '#', 3, 1, '2026-03-24 12:02:53', '2026-03-24 12:02:53'),
(48, 7, 0, 'Gym - Yoga', '#', 1, 1, '2026-03-24 12:03:50', '2026-03-24 12:03:50'),
(49, 7, 0, 'Bar - Vip Lounge', '#', 2, 1, '2026-03-24 12:04:12', '2026-03-24 12:04:12'),
(50, 7, 0, 'ALL-SEASON POOL', '#', 3, 1, '2026-03-24 12:04:38', '2026-03-24 12:04:38'),
(51, 7, 0, 'Rose Garden', '#', 4, 1, '2026-03-24 12:05:10', '2026-03-24 12:05:10'),
(52, 7, 0, 'Kid\'s Club', '#', 5, 1, '2026-03-24 12:05:32', '2026-03-24 12:05:32');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_translations`
--

CREATE TABLE `menu_item_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_item_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_translations`
--

INSERT INTO `menu_item_translations` (`id`, `menu_item_id`, `lang_code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Home', '2026-03-24 11:38:20', '2026-03-24 11:38:20'),
(2, 1, 'vi', 'Trang chủ', '2026-03-24 11:38:20', '2026-03-24 11:38:20'),
(3, 29, 'en', 'About us', '2026-03-24 11:50:19', '2026-03-24 11:50:19'),
(4, 29, 'vi', 'About us', '2026-03-24 11:50:19', '2026-03-24 11:50:19'),
(5, 30, 'en', 'Special Offer', '2026-03-24 11:51:16', '2026-03-24 11:51:16'),
(6, 30, 'vi', 'Special Offer', '2026-03-24 11:51:16', '2026-03-24 11:51:16'),
(7, 31, 'en', 'Travel Guide', '2026-03-24 11:51:45', '2026-03-24 11:51:45'),
(8, 31, 'vi', 'Travel Guide', '2026-03-24 11:51:45', '2026-03-24 11:51:45'),
(9, 32, 'en', 'Contact us', '2026-03-24 11:52:16', '2026-03-24 11:52:16'),
(10, 32, 'vi', 'Contact us', '2026-03-24 11:52:16', '2026-03-24 11:52:16'),
(11, 33, 'en', 'dao spa', '2026-03-24 11:52:41', '2026-03-24 11:52:41'),
(12, 33, 'vi', 'dao spa', '2026-03-24 11:52:41', '2026-03-24 11:52:41'),
(13, 34, 'en', 'Superior Room', '2026-03-24 11:53:14', '2026-03-24 11:53:14'),
(14, 34, 'vi', 'Superior Room', '2026-03-24 11:53:14', '2026-03-24 11:53:14'),
(15, 35, 'en', 'Deluxe Room', '2026-03-24 11:53:44', '2026-03-24 11:53:44'),
(16, 35, 'vi', 'Deluxe Room', '2026-03-24 11:53:44', '2026-03-24 11:53:44'),
(17, 36, 'en', 'Premier Room', '2026-03-24 11:54:06', '2026-03-24 11:54:06'),
(18, 36, 'vi', 'Premier Room', '2026-03-24 11:54:06', '2026-03-24 11:54:06'),
(19, 37, 'en', 'Family Room', '2026-03-24 11:54:31', '2026-03-24 11:54:31'),
(20, 37, 'vi', 'Family Room', '2026-03-24 11:54:31', '2026-03-24 11:54:31'),
(21, 38, 'en', 'Grand Family Room', '2026-03-24 11:55:01', '2026-03-24 11:55:01'),
(22, 38, 'vi', 'Grand Family Room', '2026-03-24 11:55:01', '2026-03-24 11:55:01'),
(23, 39, 'en', 'Mountain Suite', '2026-03-24 11:55:18', '2026-03-24 11:55:18'),
(24, 39, 'vi', 'Mountain Suite', '2026-03-24 11:55:18', '2026-03-24 11:55:18'),
(25, 40, 'en', 'President Suite', '2026-03-24 11:55:41', '2026-03-24 11:55:41'),
(26, 40, 'vi', 'President Suite', '2026-03-24 11:55:41', '2026-03-24 11:55:41'),
(27, 41, 'en', 'SÍn chải RESTAURANT', '2026-03-24 11:56:14', '2026-03-24 11:56:14'),
(28, 41, 'vi', 'SÍn chải RESTAURANT', '2026-03-24 11:56:14', '2026-03-24 11:56:14'),
(29, 42, 'en', 'Tả PHÌN RESTAURAN', '2026-03-24 11:56:31', '2026-03-24 11:56:31'),
(30, 42, 'vi', 'Tả PHÌN RESTAURAN', '2026-03-24 11:56:31', '2026-03-24 11:56:31'),
(31, 43, 'en', 'BẢN HỒ BAR', '2026-03-24 11:56:52', '2026-03-24 11:56:52'),
(32, 43, 'vi', 'BẢN HỒ BAR', '2026-03-24 11:56:52', '2026-03-24 11:56:52'),
(33, 44, 'en', 'BBQ', '2026-03-24 11:57:17', '2026-03-24 11:57:17'),
(34, 44, 'vi', 'BBQ', '2026-03-24 11:57:17', '2026-03-24 11:57:17'),
(35, 45, 'en', 'HOA MAI BALLROOM', '2026-03-24 11:57:53', '2026-03-24 11:57:53'),
(36, 45, 'vi', 'HOA MAI BALLROOM', '2026-03-24 11:57:53', '2026-03-24 11:57:53'),
(37, 46, 'en', 'HOA LAN BALLROOM', '2026-03-24 11:58:18', '2026-03-24 11:58:18'),
(38, 46, 'vi', 'HOA LAN BALLROOM', '2026-03-24 11:58:18', '2026-03-24 11:58:18'),
(39, 47, 'en', 'HOA BAN BALLROOM', '2026-03-24 12:02:54', '2026-03-24 12:02:54'),
(40, 47, 'vi', 'HOA BAN BALLROOM', '2026-03-24 12:02:54', '2026-03-24 12:02:54'),
(41, 48, 'en', 'Gym - Yoga', '2026-03-24 12:03:50', '2026-03-24 12:03:50'),
(42, 48, 'vi', 'Gym - Yoga', '2026-03-24 12:03:50', '2026-03-24 12:03:50'),
(43, 49, 'en', 'Bar - Vip Lounge', '2026-03-24 12:04:12', '2026-03-24 12:04:12'),
(44, 49, 'vi', 'Bar - Vip Lounge', '2026-03-24 12:04:12', '2026-03-24 12:04:12'),
(45, 50, 'en', 'ALL-SEASON POOL', '2026-03-24 12:04:38', '2026-03-24 12:04:38'),
(46, 50, 'vi', 'ALL-SEASON POOL', '2026-03-24 12:04:38', '2026-03-24 12:04:38'),
(47, 51, 'en', 'Rose Garden', '2026-03-24 12:05:10', '2026-03-24 12:05:10'),
(48, 51, 'vi', 'Rose Garden', '2026-03-24 12:05:10', '2026-03-24 12:05:10'),
(49, 52, 'en', 'Kid\'s Club', '2026-03-24 12:05:32', '2026-03-24 12:05:32'),
(50, 52, 'vi', 'Kid\'s Club', '2026-03-24 12:05:32', '2026-03-24 12:05:32'),
(51, 2, 'en', 'Accommodation', '2026-03-26 09:00:09', '2026-03-26 09:00:09'),
(52, 2, 'vi', 'Hạng phòng', '2026-03-26 09:00:09', '2026-03-26 09:00:09'),
(53, 13, 'en', 'Superior Room', '2026-03-26 09:00:56', '2026-03-26 09:00:56'),
(54, 13, 'vi', 'Superior Room', '2026-03-26 09:00:56', '2026-03-26 09:00:56'),
(55, 14, 'en', 'Deluxe Room', '2026-03-26 09:01:25', '2026-03-26 09:01:25'),
(56, 14, 'vi', 'Deluxe Room', '2026-03-26 09:01:25', '2026-03-26 09:01:25'),
(57, 15, 'en', 'Premier Room', '2026-03-26 09:01:49', '2026-03-26 09:01:49'),
(58, 15, 'vi', 'Premier Room', '2026-03-26 09:01:49', '2026-03-26 09:01:49'),
(59, 16, 'en', 'Family Room', '2026-03-26 09:02:21', '2026-03-26 09:02:21'),
(60, 16, 'vi', 'Family Room', '2026-03-26 09:02:21', '2026-03-26 09:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `mice_events`
--

CREATE TABLE `mice_events` (
  `id` bigint UNSIGNED NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mice_events`
--

INSERT INTO `mice_events` (`id`, `avatar`, `is_featured`, `status`, `created_at`, `updated_at`, `sort_order`) VALUES
(1, '69bb54ffb2fcd1773884671.webp', 1, 1, '2026-03-19 01:44:37', '2026-03-19 01:44:37', 0),
(2, '69c248f3288421774340339.webp', 1, 1, '2026-03-24 08:18:59', '2026-03-24 08:18:59', 0),
(3, '69c249120baac1774340370.webp', 1, 1, '2026-03-24 08:19:30', '2026-03-24 08:19:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mice_event_images`
--

CREATE TABLE `mice_event_images` (
  `id` bigint UNSIGNED NOT NULL,
  `mice_event_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1: main gallery, 2: intro gallery',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mice_event_images`
--

INSERT INTO `mice_event_images` (`id`, `mice_event_id`, `image`, `type`, `created_at`, `updated_at`) VALUES
(14, 1, '69c6404c102a51774600268.webp', 2, '2026-03-27 08:31:09', '2026-03-27 08:31:09'),
(15, 1, '69c6404d60c0f1774600269.webp', 1, '2026-03-27 08:31:11', '2026-03-27 08:31:11'),
(16, 1, '69c6404f200101774600271.webp', 1, '2026-03-27 08:31:13', '2026-03-27 08:31:13'),
(17, 1, '69c640511fdc11774600273.webp', 1, '2026-03-27 08:31:14', '2026-03-27 08:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `mice_event_translations`
--

CREATE TABLE `mice_event_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `mice_event_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional_info` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mice_event_translations`
--

INSERT INTO `mice_event_translations` (`id`, `mice_event_id`, `lang_code`, `name`, `slug`, `card_content`, `content`, `short_description`, `additional_info`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Hoa Mai (Demo)', 'hoa-mai-demo', '<p><span style=\"white-space:pre-wrap;\">This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.</span></p>', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', '{\"1774236064073\":{\"icon\":\"69c0b281698121774236289.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774236134279\":{\"icon\":\"69c0b286deaa21774236294.webp\",\"text\":\"1 King Bed\"},\"1774236137561\":{\"icon\":\"69c0b286e2d951774236294.webp\",\"text\":\"Room size: 68 m2\"},\"1774236138384\":{\"icon\":\"69c0b286e76ea1774236294.webp\",\"text\":\"View: Neighboring or street view\"},\"1774236138978\":{\"icon\":\"69c0b286f06711774236294.webp\",\"text\":\"Wifi\"},\"1774236139871\":{\"icon\":\"69c0b287005451774236295.webp\",\"text\":\"No smoking\"},\"1774236140479\":{\"icon\":\"69c0b287110241774236295.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774236141158\":{\"icon\":\"69c0b28717fba1774236295.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-19 01:44:40', '2026-03-27 04:41:31'),
(2, 1, 'vi', 'Hoa Mai', 'hoa-mai', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\n<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis.</span></p>', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\n<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'Nằm trên cao, khách sạn KK Sapa là một viên ngọc ẩn mình giữa lòng Sa Pa. Từ ban công riêng của bạn, dãy núi Hoàng Liên Sơn hùng vĩ trải dài trước mắt.', '{\"1774236064073\":{\"icon\":\"69c0b281698121774236289.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774236134279\":{\"icon\":\"69c0b286deaa21774236294.webp\",\"text\":\"1 King Bed\"},\"1774236137561\":{\"icon\":\"69c0b286e2d951774236294.webp\",\"text\":\"Room size: 68 m2\"},\"1774236138384\":{\"icon\":\"69c0b286e76ea1774236294.webp\",\"text\":\"View: Neighboring or street view\"},\"1774236138978\":{\"icon\":\"69c0b286f06711774236294.webp\",\"text\":\"Wifi\"},\"1774236139871\":{\"icon\":\"69c0b287005451774236295.webp\",\"text\":\"No smoking\"},\"1774236140479\":{\"icon\":\"69c0b287110241774236295.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774236141158\":{\"icon\":\"69c0b28717fba1774236295.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 02:12:13', '2026-03-27 08:31:14'),
(3, 2, 'en', 'Hoa Lan', 'hoa-lan-1', '<p><span style=\"white-space:pre-wrap;\">This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.</span></p>', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\n<br />\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', '{\"1774236064073\":{\"icon\":\"69c0b281698121774236289.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774236134279\":{\"icon\":\"69c0b286deaa21774236294.webp\",\"text\":\"1 King Bed\"},\"1774236137561\":{\"icon\":\"69c0b286e2d951774236294.webp\",\"text\":\"Room size: 68 m2\"},\"1774236138384\":{\"icon\":\"69c0b286e76ea1774236294.webp\",\"text\":\"View: Neighboring or street view\"},\"1774236138978\":{\"icon\":\"69c0b286f06711774236294.webp\",\"text\":\"Wifi\"},\"1774236139871\":{\"icon\":\"69c0b287005451774236295.webp\",\"text\":\"No smoking\"},\"1774236140479\":{\"icon\":\"69c0b287110241774236295.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774236141158\":{\"icon\":\"69c0b28717fba1774236295.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:18:59', '2026-03-24 08:26:58'),
(4, 2, 'vi', 'Hoa Lan', 'hoa-lan', '<p><span style=\"white-space:pre-wrap;\">This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.</span></p>', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\n<br />\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', '{\"1774236064073\":{\"icon\":\"69c0b281698121774236289.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774236134279\":{\"icon\":\"69c0b286deaa21774236294.webp\",\"text\":\"1 King Bed\"},\"1774236137561\":{\"icon\":\"69c0b286e2d951774236294.webp\",\"text\":\"Room size: 68 m2\"},\"1774236138384\":{\"icon\":\"69c0b286e76ea1774236294.webp\",\"text\":\"View: Neighboring or street view\"},\"1774236138978\":{\"icon\":\"69c0b286f06711774236294.webp\",\"text\":\"Wifi\"},\"1774236139871\":{\"icon\":\"69c0b287005451774236295.webp\",\"text\":\"No smoking\"},\"1774236140479\":{\"icon\":\"69c0b287110241774236295.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774236141158\":{\"icon\":\"69c0b28717fba1774236295.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:18:59', '2026-03-24 08:18:59'),
(5, 3, 'en', 'Hoa ban', 'hoa-ban-1', '<p><span style=\"white-space:pre-wrap;\">This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.</span></p>', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\n<br />\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', '{\"1774236064073\":{\"icon\":\"69c0b281698121774236289.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774236134279\":{\"icon\":\"69c0b286deaa21774236294.webp\",\"text\":\"1 King Bed\"},\"1774236137561\":{\"icon\":\"69c0b286e2d951774236294.webp\",\"text\":\"Room size: 68 m2\"},\"1774236138384\":{\"icon\":\"69c0b286e76ea1774236294.webp\",\"text\":\"View: Neighboring or street view\"},\"1774236138978\":{\"icon\":\"69c0b286f06711774236294.webp\",\"text\":\"Wifi\"},\"1774236139871\":{\"icon\":\"69c0b287005451774236295.webp\",\"text\":\"No smoking\"},\"1774236140479\":{\"icon\":\"69c0b287110241774236295.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774236141158\":{\"icon\":\"69c0b28717fba1774236295.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:19:30', '2026-03-24 08:19:30'),
(6, 3, 'vi', 'Hoa Ban', 'hoa-ban', '<p><span style=\"white-space:pre-wrap;\">This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.</span></p>', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\n<br />\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', '{\"1774236064073\":{\"icon\":\"69c0b281698121774236289.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1774236134279\":{\"icon\":\"69c0b286deaa21774236294.webp\",\"text\":\"1 King Bed\"},\"1774236137561\":{\"icon\":\"69c0b286e2d951774236294.webp\",\"text\":\"Room size: 68 m2\"},\"1774236138384\":{\"icon\":\"69c0b286e76ea1774236294.webp\",\"text\":\"View: Neighboring or street view\"},\"1774236138978\":{\"icon\":\"69c0b286f06711774236294.webp\",\"text\":\"Wifi\"},\"1774236139871\":{\"icon\":\"69c0b287005451774236295.webp\",\"text\":\"No smoking\"},\"1774236140479\":{\"icon\":\"69c0b287110241774236295.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1774236141158\":{\"icon\":\"69c0b28717fba1774236295.webp\",\"text\":\"Mini bar\"}}', NULL, NULL, NULL, '2026-03-24 08:19:30', '2026-03-24 08:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_03_03_040850_add_listing_type_to_jobs_table', 1),
(2, '2026_03_03_043229_create_admin_roles_table', 2),
(3, '2026_03_03_043230_create_admin_permissions_table', 2),
(4, '2026_03_03_043231_add_role_id_to_admins_table', 2),
(5, '2026_03_03_140332_rename_employers_table_to_users_table', 3),
(6, '2026_03_23_100911_enhance_mice_events_table_v2', 4),
(7, '2026_03_23_102953_enhance_special_offers_table', 5),
(8, '2026_03_23_104535_enhance_rooms_table', 6),
(9, '2026_03_23_143726_enhance_restaurants_table', 7),
(10, '2026_03_23_151000_create_facilities_module', 8),
(11, '2026_03_23_154620_enhance_posts_module_v2', 9),
(12, '2026_03_23_155422_make_category_id_nullable_in_posts_table', 10),
(13, '2026_03_24_085533_create_menu_item_translations_table', 11),
(14, '2026_03_24_085533_create_page_translations_table', 11),
(15, '2026_03_24_140657_add_is_large_frame_to_restaurants_table', 12),
(16, '2026_03_24_141408_add_sort_order_to_main_tables', 13);

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sender` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `push_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `shortcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_sent_from_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent_from_address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_sent_from` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '{{site_name}} - Balance Added', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '{{site_name}} - Balance Subtracted', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Payment - Automated - Successful', 'Deposit Completed Successfully', '{{site_name}} - Deposit successful', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Payment - Manual - Approved', 'Your Deposit is Approved', '{{site_name}} - Deposit Request Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Payment - Manual - Rejected', 'Your Deposit Request is Rejected', '{{site_name}} - Deposit Request Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Payment - Manual - Requested', 'Deposit Request Submitted Successfully', NULL, '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '{{site_name}} Password Reset Code', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', NULL, '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', NULL, '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', NULL, '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '{{site_name}} - Support Ticket Replied', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', NULL, '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', NULL, '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', NULL, '{\"code\":\"Email verification code\"}', 1, NULL, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', NULL, '---', 'Your phone verification code is: {{code}}', NULL, '{\"code\":\"SMS Verification Code\"}', 0, NULL, NULL, 1, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', NULL, '{{message}}', '{{message}}', NULL, '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 0, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(18, 'JOB_APPLICATION_RECEIVED', 'Job application recived', 'Job application recived', NULL, '<div>{{company_name}} {{job_title}} has been subtracted from your account ', '<div>{{company_name}} {{job_title}} has been subtracted from your account ', NULL, '{\"company_name\":\"Company Name\",\"job_title\":\"Job Title\"}', 1, NULL, NULL, 1, NULL, 0, NULL, NULL),
(19, 'JOB_APPLICATION_REJECTED', 'Job applicatioin canceled', 'Job application canceled', NULL, '<div>Dears {{company_name}}</div><div>&nbsp;Your job {{job_title}}&nbsp; rejected.</div>', 'Dears {{company_name}}\r\n Your job {{job_title}}  rejected.', NULL, '{\"company_name\":\"Company Name\",\"job_title\":\"Job Title\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-12-13 03:52:08'),
(20, 'PLAN_EXPIRED', 'Plan Expired', 'plan expired', NULL, '<div>{{plan_name}} {{order_number}} has been subtracted from your account ', '{{plan_name}} {{order_number}} ', NULL, '{\"plan_name\":\"Plan Name\",\"order_number\":\"Order Number\"}', 1, NULL, NULL, 1, NULL, 0, NULL, NULL),
(21, 'JOB_LIMIT_OVER', 'Job limit over', 'job limit over', NULL, '<div>{{plan_name}} {{order_number}} has been subtracted from your account ', '{{plan_name}} {{order_number}} ', NULL, '{\"plan_name\":\"Plan Name\",\"order_number\":\"Order Number\"}', 1, NULL, NULL, 1, NULL, 0, NULL, NULL),
(22, 'CONTACT_WITH_COMPANY', 'Contact with compnay', 'Contact with compnay', NULL, 'A person is interested to contact you. Here are details<div><br></div><div>Name:{{name}},</div><div>Email:{{email}},</div><hr><div>Message</div><div>{{message}}<br></div>', 'A person is interested to contact you. Here are details\r\n\r\nName:{{name}},\r\nEmail:{{email}},\r\nMessage\r\n{{message}}', NULL, '{\"name\" : \"Candidate Name\",\"email\": \"Candidate Email\", \"message\": \"Message\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-12-14 07:14:40'),
(23, 'CONTACT_WITH_CANDIDATE', 'Contact with candidate', 'Contact with candiate', NULL, 'Name:&nbsp;{{name}}<div>Email:&nbsp;{{email}}</div><div>Message:&nbsp;{{message}}</div>', 'Name: {{name}}\r\nEmail: {{email}}\r\nMessage: {{message}}', NULL, '{\"name\" : \"Employer Name\",\"email\": \"Employer  Email\", \"message\": \"Message\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-12-28 10:02:48'),
(24, 'PLAN_SUBSCRIBE', 'Plan Subscribe', 'plan subscribe', NULL, 'Dear {{company_name}},<div>The {{plan_name}} subscribed successfully;</div><div>Here are subscribed details</div><div>Plan Name: {{plan_name}}</div><div>Order Number: {{order_number}},</div><div>Price: {{plan_price}} {{site_currency}},</div><div>Job Post: {{total_job_post}} times,</div><div>Duration : {{subscribe_duration}} month</div>', 'Dear {{company_name}},\r\nThe {{plan_name}} subscribed successfully;\r\nHere are subscribed details\r\nPlan Name: {{plan_name}}\r\nOrder Number: {{order_number}},\r\nPrice: {{plan_price}} {{site_currency}},\r\nJob Post: {{total_job_post}} times,\r\nDuration : {{subscribe_duration}} month', NULL, ' {\"plan_name\":\"Plan Name\",\"order_number\":\"Order Number\",\"company_name\":\"Compnay Name Of Employer\",\"plan_price\": \"Plan Price\",\"total_job_post\":\"Total job post under subscribe this plan\",\"subsribe_duration\":\"Duration of subscribe plan\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-12-03 10:31:45'),
(25, 'JOB_APPROVED', 'Job approved', 'Job Approved', NULL, 'Dear&nbsp;&nbsp;{{username}},<div>Congratulations, You created job&nbsp;{{title}} on&nbsp;{{created_at}} approved at {{approved_date}}.</div>', 'Dear  {{username}},\r\nCongratulations, You created job {{title}} on {{created_at}} approved at {{approved_date}}.', NULL, '{\"title\":\"Job Title\",\"username\":\"Username of Employer\",\"approved_date\":\"Approved Date & Time\",\"created_at\":\"Job Created Time\"}', 1, NULL, NULL, 1, NULL, 0, NULL, '2022-12-13 03:50:04'),
(26, 'JOB_APPLICATION', 'Applied on job', 'New Job Application', NULL, NULL, NULL, NULL, '{\"title\":\"Job Title\",\"fullname\":\"Full name of the applicant\",\"expected_salary\":\"Applicant expected salary for the job post\",\"created_at\":\"Application time\"}', 1, NULL, NULL, 1, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"hero_slider\",\"about\",\"accommodation\",\"special_offer\",\"explore_services\",\"mice_events\",\"facilities\",\"travel_guides\",\"newsletter\"]', 1, '2020-07-11 00:23:58', '2026-03-24 11:24:58'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-21 19:14:53', '2020-10-21 19:14:53'),
(26, 'Accommodation', 'accommodation', 'templates.basic.', '[\"inner_slider\"]', 0, '2026-03-25 04:34:50', '2026-03-25 04:56:10'),
(27, 'Special Offer', 'special-offers', 'templates.basic.', '[\"inner_slider\"]', 0, '2026-03-26 06:46:00', '2026-03-26 06:46:34'),
(28, 'Meeting & Events', 'metting-events', 'templates.basic.', '[\"inner_slider\"]', 0, '2026-03-26 08:23:11', '2026-03-26 08:23:29'),
(29, 'Travel Guide', 'travel-guide', 'templates.basic.', NULL, 0, '2026-03-27 09:02:55', '2026-03-27 09:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `page_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_content` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `lang_code`, `name`, `title`, `seo_content`, `created_at`, `updated_at`) VALUES
(1, 26, 'en', 'Accommodation', NULL, NULL, '2026-03-25 04:34:51', '2026-03-25 04:34:51'),
(2, 26, 'vi', 'Hạng phòng', NULL, NULL, '2026-03-25 04:34:51', '2026-03-25 04:34:51'),
(3, 27, 'en', 'Special Offer', NULL, NULL, '2026-03-26 06:46:00', '2026-03-26 06:46:00'),
(4, 27, 'vi', 'Ưu đãi đặc biệt', NULL, NULL, '2026-03-26 06:46:00', '2026-03-26 06:46:00'),
(5, 28, 'en', 'Meeting & Events', NULL, NULL, '2026-03-26 08:23:11', '2026-03-26 08:23:11'),
(6, 28, 'vi', 'Gặp mặt & Sự kiện', NULL, NULL, '2026-03-26 08:23:11', '2026-03-26 08:23:11'),
(7, 29, 'en', 'Travel Guide', NULL, NULL, '2026-03-27 09:02:55', '2026-03-27 09:02:55'),
(8, 29, 'vi', 'Travel Guide', NULL, NULL, '2026-03-27 09:02:55', '2026-03-27 09:02:55'),
(9, 5, 'en', 'Contact', NULL, NULL, '2026-03-27 10:40:28', '2026-03-27 10:40:28'),
(10, 5, 'vi', 'Contact', NULL, NULL, '2026-03-27 10:40:28', '2026-03-27 10:40:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hot` tinyint DEFAULT '0',
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `admin_id`, `image`, `is_hot`, `order`, `status`, `created_at`, `updated_at`, `sort_order`) VALUES
(1, NULL, 4, '69c101aca3f7b1774256556.webp', 1, 0, 1, '2026-03-23 09:02:37', '2026-03-27 09:15:55', 2),
(4, NULL, 4, '69c64b46189ac1774603078.webp', 0, 0, 1, '2026-03-24 10:56:27', '2026-03-27 09:17:58', 1),
(5, NULL, 4, '69c64b839b5651774603139.webp', 0, 0, 1, '2026-03-24 10:57:49', '2026-03-27 09:19:01', 3),
(6, NULL, 4, '69c64992ea4721774602642.webp', 1, 0, 1, '2026-03-27 09:10:43', '2026-03-27 09:15:03', 4),
(7, NULL, 4, '69c64a3b9c79c1774602811.webp', 1, 0, 1, '2026-03-27 09:13:34', '2026-03-27 09:15:11', 5),
(8, NULL, 4, '69c64a65e55fc1774602853.webp', 1, 0, 1, '2026-03-27 09:14:16', '2026-03-27 09:15:15', 6),
(9, NULL, 4, '69c64bcf41e781774603215.webp', 0, 0, 1, '2026-03-27 09:20:17', '2026-03-27 09:20:17', 7),
(10, NULL, 4, '69c64ccf8fbc11774603471.webp', 0, 0, 1, '2026-03-27 09:24:34', '2026-03-27 09:24:34', 8);

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

CREATE TABLE `post_images` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_images`
--

INSERT INTO `post_images` (`id`, `post_id`, `image`, `created_at`, `updated_at`) VALUES
(4, 6, '69c6499350ee51774602643.webp', '2026-03-27 09:10:44', '2026-03-27 09:10:44'),
(5, 6, '69c64994cd0911774602644.webp', '2026-03-27 09:10:46', '2026-03-27 09:10:46'),
(6, 1, '69c650be193281774604478.webp', '2026-03-27 09:41:20', '2026-03-27 09:41:20'),
(7, 1, '69c650c08b2001774604480.webp', '2026-03-27 09:41:22', '2026-03-27 09:41:22');

-- --------------------------------------------------------

--
-- Table structure for table `post_translations`
--

CREATE TABLE `post_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `toc` text COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_translations`
--

INSERT INTO `post_translations` (`id`, `post_id`, `lang_code`, `name`, `slug`, `description`, `content`, `toc`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '(Demo) Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis', 'demo-lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h2 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Nam lectus massa blandit pharetra proin</span></h2>\r\n\r\n<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://kk_spa_project.test/assets/images/ckeditor/ckeditor_69c65081159a0.png\" style=\"width: 1920px; height: 950px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 class=\"tieu-de-2\">Nam lectus massa blandit pharetra proin 2</h2>\r\n\r\n<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://kk_spa_project.test/assets/images/ckeditor/ckeditor_69c6509877fdc.png\" style=\"width: 1920px; height: 950px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2 class=\"tieu-de-3\"><span style=\"white-space:pre-wrap;\">Nam lectus massa blandit pharetra proin</span></h2>\r\n\r\n<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', '{\"1774256413220\":{\"title\":\"Nam lectus massa blandit pharetra proin\",\"target_id\":\"tieu-de-1\"},\"1774256492332\":{\"title\":\"Nam lectus massa blandit pharetra proin\",\"target_id\":\"tieu-de-2\"},\"1774256502189\":{\"title\":\"Nam lectus massa blandit pharetra proin\",\"target_id\":\"tieu-de-3\"}}', NULL, NULL, NULL, '2026-03-23 09:02:40', '2026-03-27 10:26:15'),
(4, 4, 'en', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin. 3', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-3', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-24 10:56:27', '2026-03-27 09:16:30'),
(5, 4, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin. 34', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-34', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-24 10:56:27', '2026-03-27 09:16:48'),
(6, 1, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-24 10:56:57', '2026-03-27 09:16:50'),
(7, 5, 'en', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', 'the-creation-of-a-unique-project-a-wooden-bedroom-in-a-futuristic-style-took-the-woodtech-team-two-months-1', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-24 10:57:49', '2026-03-27 09:16:51'),
(8, 5, 'vi', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', 'the-creation-of-a-unique-project-a-wooden-bedroom-in-a-futuristic-style-took-the-woodtech-team-two-months', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-24 10:57:49', '2026-03-27 09:16:53'),
(9, 6, 'en', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin. 4', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-4', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-27 09:10:46', '2026-03-27 09:16:55'),
(10, 6, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin. 456', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin-456', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-27 09:10:46', '2026-03-27 09:16:57'),
(11, 7, 'en', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.3123123123', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin3123123123', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-27 09:13:34', '2026-03-27 09:16:59'),
(12, 7, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.23131231', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin23131231', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-27 09:13:34', '2026-03-27 09:17:01'),
(13, 8, 'en', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.23123444566', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin23123444566', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-27 09:14:16', '2026-03-27 09:17:03'),
(14, 8, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.231234445662', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin231234445662', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', '<h1 class=\"tieu-de-1\"><span style=\"white-space:pre-wrap;\">Ti&ecirc;u đề 1</span></h1>', NULL, NULL, NULL, NULL, '2026-03-27 09:14:16', '2026-03-27 09:17:06'),
(15, 9, 'en', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.11111', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin11111', NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27 09:20:17', '2026-03-27 09:20:17'),
(16, 9, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.22222', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin22222', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', NULL, NULL, NULL, NULL, NULL, '2026-03-27 09:20:17', '2026-03-27 09:20:17'),
(17, 10, 'en', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.444', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin444', NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-27 09:24:34', '2026-03-27 09:24:34'),
(18, 10, 'vi', 'Lorem ipsum dolor sit amet consectetur. Sapien proin risus mollis commodo proin.6666', 'lorem-ipsum-dolor-sit-amet-consectetur-sapien-proin-risus-mollis-commodo-proin6666', 'The creation of a unique project - a wooden bedroom in a futuristic style took the Woodtech team two months.', NULL, NULL, NULL, NULL, NULL, '2026-03-27 09:24:34', '2026-03-27 09:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `gso_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `status`, `gso_id`, `created_at`, `updated_at`) VALUES
(1, 'Tỉnh An Giang', 1, '', '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(2, 'Tỉnh Bắc Ninh', 1, '', '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(3, 'Tỉnh Cà Mau', 1, '', '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(4, 'Thành Phố Cần Thơ', 1, '', '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(5, 'Tỉnh Cao Bằng', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(6, 'Tỉnh Đắk Lắk', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(7, 'Thành Phố Đà Nẵng', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(8, 'Tỉnh Điện Biên', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(9, 'Tỉnh Đồng Nai', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(10, 'Tỉnh Đồng Tháp', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(11, 'Tỉnh Gia Lai', 1, '', '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(12, 'Thành Phố Hải Phòng', 1, '', '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(13, 'Thủ Đô Hà Nội', 1, '', '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(14, 'Tỉnh Hà Tĩnh', 1, '', '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(15, 'Thành Phố Huế', 1, '', '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(16, 'Tỉnh Hưng Yên', 1, '', '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(17, 'Tỉnh Khánh Hòa', 1, '', '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(18, 'Tỉnh Lai Châu', 1, '', '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(19, 'Tỉnh Lâm Đồng', 1, '', '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(20, 'Tỉnh Lạng Sơn', 1, '', '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(21, 'Tỉnh Lào Cai', 1, '', '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(22, 'Tỉnh Nghệ An', 1, '', '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(23, 'Tỉnh Ninh Bình', 1, '', '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(24, 'Tỉnh Phú Thọ', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(25, 'Tỉnh Quảng Ngãi', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(26, 'Tỉnh Quảng Ninh', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(27, 'Tỉnh Quảng Trị', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(28, 'Tỉnh Sơn La', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(29, 'Tỉnh Tây Ninh', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(30, 'Tỉnh Thái Nguyên', 1, '', '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(31, 'Tỉnh Thanh Hóa', 1, '', '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(32, 'Thành Phố Hồ Chí Minh', 1, '', '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(33, 'Tỉnh Tuyên Quang', 1, '', '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(34, 'Tỉnh Vĩnh Long', 1, '', '2026-03-02 16:22:52', '2026-03-02 16:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hot` tinyint DEFAULT '0',
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `opening_time` time DEFAULT NULL,
  `last_order_time` time DEFAULT NULL,
  `hotline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_large_frame` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `category_id`, `admin_id`, `image`, `is_hot`, `order`, `status`, `opening_time`, `last_order_time`, `hotline`, `email`, `created_at`, `updated_at`, `is_large_frame`, `sort_order`) VALUES
(6, NULL, 4, '69c23f25a13e81774337829.webp', 0, 0, 1, '11:30:00', '22:30:00', '84 (0) 214.379.8888', 'info@kksapahotel.com', '2026-03-13 02:58:25', '2026-03-27 05:02:21', 0, 1),
(7, NULL, 4, '69c236fb6d69b1774335739.webp', 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-24 07:02:25', '2026-03-27 05:02:20', 0, 2),
(8, NULL, 4, '69c23752916251774335826.webp', 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-24 07:03:47', '2026-03-27 05:02:21', 0, 3),
(9, NULL, 4, '69c23796707871774335894.webp', 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-24 07:04:55', '2026-03-27 05:02:21', 1, 4),
(10, NULL, 4, '69c2382d4cbd11774336045.webp', 0, 0, 1, NULL, NULL, NULL, NULL, '2026-03-24 07:07:25', '2026-03-27 05:02:21', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_chefs`
--

CREATE TABLE `restaurant_chefs` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `awards` tinyint DEFAULT '0',
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_chefs`
--

INSERT INTO `restaurant_chefs` (`id`, `restaurant_id`, `image`, `awards`, `order`, `status`, `created_at`, `updated_at`) VALUES
(4, 6, '69b37d5201d5a1773370706.webp', 5, 0, 1, '2026-03-13 02:58:26', '2026-03-27 05:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_chef_translations`
--

CREATE TABLE `restaurant_chef_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_chef_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_chef_translations`
--

INSERT INTO `restaurant_chef_translations` (`id`, `restaurant_chef_id`, `lang_code`, `name`, `intro`, `created_at`, `updated_at`) VALUES
(4, 4, 'en', 'Michael', 'Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.\r\n\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.', '2026-03-13 02:58:26', '2026-03-13 02:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_images`
--

CREATE TABLE `restaurant_images` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_images`
--

INSERT INTO `restaurant_images` (`id`, `restaurant_id`, `type`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(5, 6, 1, '69b37d523d64d1773370706.webp', NULL, '2026-03-13 02:58:27', '2026-03-27 06:53:31'),
(6, 6, 1, '69b37d534db291773370707.webp', NULL, '2026-03-13 02:58:27', '2026-03-27 06:53:31'),
(7, 6, 1, '69b37d54007d71773370708.webp', NULL, '2026-03-13 02:58:28', '2026-03-27 06:53:32'),
(9, 6, 2, '69c0f0b88b7e21774252216.webp', NULL, '2026-03-23 07:50:22', '2026-03-27 06:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_menus`
--

CREATE TABLE `restaurant_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `price` decimal(15,2) DEFAULT '0.00',
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_menus`
--

INSERT INTO `restaurant_menus` (`id`, `restaurant_id`, `price`, `order`, `status`, `created_at`, `updated_at`) VALUES
(4, 6, '20.00', 0, 1, '2026-03-13 02:58:26', '2026-03-13 02:58:26'),
(5, 6, '90.00', 0, 1, '2026-03-13 03:00:13', '2026-03-13 03:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_menu_translations`
--

CREATE TABLE `restaurant_menu_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_menu_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_menu_translations`
--

INSERT INTO `restaurant_menu_translations` (`id`, `restaurant_menu_id`, `lang_code`, `name`, `item_name`, `description`, `created_at`, `updated_at`) VALUES
(2, 4, 'en', 'Test', '', 'Test', '2026-03-13 02:58:26', '2026-03-13 02:58:26'),
(3, 5, 'en', 'Test 2', '', 'Test 2', '2026-03-13 03:00:13', '2026-03-13 03:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_translations`
--

CREATE TABLE `restaurant_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_translations`
--

INSERT INTO `restaurant_translations` (`id`, `restaurant_id`, `lang_code`, `name`, `slug`, `description`, `content`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`) VALUES
(6, 6, 'en', 'Sín Chải Restaurant', 'sn-chi-restaurant', 'The essence of Asian and European cuisine.', '<p>sdasds</p>', NULL, NULL, NULL, '2026-03-13 02:58:25', '2026-03-24 07:01:20'),
(7, 6, 'vi', 'Nhà hàng Sín Chải', 'nha-hang-sin-chai', 'Tinh túy của ẩm thực Á Đông và Âu.', '<p>dxcqwcwqc</p>', NULL, NULL, NULL, '2026-03-24 02:09:11', '2026-03-24 07:01:21'),
(8, 7, 'en', 'Tả PHÌN RESTAURANT', 't-phn-restaurant', 'Breakfast buffet is served daily.', NULL, NULL, NULL, NULL, '2026-03-24 07:02:25', '2026-03-24 07:02:25'),
(9, 7, 'vi', 'NHÀ HÀNG Tả PHÌN', 'nh-hng-t-phn', 'Bữa sáng tự chọn được phục vụ hàng ngày.', NULL, NULL, NULL, NULL, '2026-03-24 07:02:25', '2026-03-24 07:02:25'),
(10, 8, 'en', 'BẢN HỒ BAR', 'bn-h-bar-1', 'Relax with drinks, snacks, and afternoon tea.', NULL, NULL, NULL, NULL, '2026-03-24 07:03:47', '2026-03-26 03:28:45'),
(11, 8, 'vi', 'BẢN HỒ BAR', 'bn-h-bar', 'Thư giãn với đồ uống, đồ ăn nhẹ và trà chiều.', NULL, NULL, NULL, NULL, '2026-03-24 07:03:47', '2026-03-24 07:03:47'),
(12, 9, 'en', 'dao spa', 'dao-spa-1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', NULL, NULL, NULL, NULL, '2026-03-24 07:04:55', '2026-03-26 03:28:45'),
(13, 9, 'vi', 'dao spa', 'dao-spa', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', NULL, NULL, NULL, NULL, '2026-03-24 07:04:55', '2026-03-24 07:04:55'),
(14, 10, 'en', 'SHUTTLE SERVICE', 'shuttle-service', 'Cherish the most peaceful moments in your heart.', NULL, NULL, NULL, NULL, '2026-03-24 07:07:25', '2026-03-24 07:07:25'),
(15, 10, 'vi', 'DỊCH VỤ ĐƯA ĐÓN', 'dch-v-a-n', 'Cherish the most peaceful moments in your heart.', NULL, NULL, NULL, NULL, '2026-03-24 07:07:25', '2026-03-24 07:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_old` decimal(15,2) DEFAULT '0.00',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amenities` json DEFAULT NULL,
  `featured_video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hot` tinyint DEFAULT '0',
  `order` int DEFAULT '0',
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `category_id`, `admin_id`, `price`, `price_old`, `image`, `amenities`, `featured_video_link`, `featured_image`, `is_hot`, `order`, `status`, `created_at`, `updated_at`, `sort_order`) VALUES
(1, NULL, 4, '90.00', '0.00', '69b2b5cb12f051773319627.webp', '[\"pool\", \"massage\", \"bar\", \"gym\", \"wifi\"]', 'https://www.youtube.com/watch?v=0b0SsFV0Q5A', '69b2b5d1e81081773319633.webp', 1, 1, 1, '2026-03-12 08:58:49', '2026-03-27 07:14:55', 1),
(2, NULL, 4, '390.00', '0.00', '69c2078173a131774323585.webp', NULL, NULL, NULL, 1, 2, 1, '2026-03-24 03:39:46', '2026-03-27 05:02:06', 2),
(3, NULL, 4, '390.00', '0.00', '69c20809586361774323721.webp', NULL, NULL, NULL, 1, 3, 1, '2026-03-24 03:42:02', '2026-03-27 05:02:06', 3),
(4, NULL, 4, '390.00', '0.00', '69c208cbe91711774323915.webp', NULL, NULL, NULL, 1, 4, 1, '2026-03-24 03:45:16', '2026-03-27 05:02:06', 4),
(5, NULL, 4, '500.00', '0.00', '69c209eff0e8b1774324207.webp', NULL, NULL, NULL, 1, 5, 1, '2026-03-24 03:50:08', '2026-03-27 05:02:06', 5);

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`id`, `room_id`, `type`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(8, 1, 2, '69c4aed07ff201774497488.webp', NULL, '2026-03-26 03:58:14', '2026-03-27 05:02:07'),
(9, 1, 2, '69c4aed6ac2a71774497494.webp', NULL, '2026-03-26 03:58:17', '2026-03-27 05:02:08'),
(10, 1, 2, '69c4aed95860a1774497497.webp', NULL, '2026-03-26 03:58:19', '2026-03-27 05:02:09'),
(11, 1, 1, '69c4af96215751774497686.webp', NULL, '2026-03-26 04:01:28', '2026-03-27 05:02:09'),
(12, 1, 1, '69c4af9804be91774497688.webp', NULL, '2026-03-26 04:01:30', '2026-03-27 05:02:10'),
(13, 1, 1, '69c4af9a02aa21774497690.webp', NULL, '2026-03-26 04:01:31', '2026-03-27 05:02:11'),
(14, 2, 2, '69c4bd1f236c61774501151.webp', NULL, '2026-03-26 04:59:11', '2026-03-27 05:02:11'),
(15, 2, 2, '69c4bd1f95f401774501151.webp', NULL, '2026-03-26 04:59:11', '2026-03-27 05:02:12'),
(16, 2, 2, '69c4bd1fea57a1774501151.webp', NULL, '2026-03-26 04:59:12', '2026-03-27 05:02:12'),
(17, 3, 2, '69c4bd34100dc1774501172.webp', NULL, '2026-03-26 04:59:32', '2026-03-27 05:02:12'),
(18, 3, 2, '69c4bd34803ac1774501172.webp', NULL, '2026-03-26 04:59:32', '2026-03-27 05:02:12'),
(19, 3, 2, '69c4bd34924131774501172.webp', NULL, '2026-03-26 04:59:32', '2026-03-27 05:02:12'),
(20, 4, 2, '69c4bd471340c1774501191.webp', NULL, '2026-03-26 04:59:51', '2026-03-27 05:02:12'),
(21, 4, 2, '69c4bd477dd411774501191.webp', NULL, '2026-03-26 04:59:51', '2026-03-27 05:02:12'),
(22, 4, 2, '69c4bd478e9011774501191.webp', NULL, '2026-03-26 04:59:51', '2026-03-27 05:02:12'),
(24, 5, 2, '69c4bd589553f1774501208.webp', NULL, '2026-03-26 05:00:09', '2026-03-27 05:02:13'),
(25, 5, 2, '69c4bd591779a1774501209.webp', NULL, '2026-03-26 05:00:09', '2026-03-27 05:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `room_translations`
--

CREATE TABLE `room_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `room_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `featured_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_description` text COLLATE utf8mb4_unicode_ci,
  `suite_highlights` text COLLATE utf8mb4_unicode_ci,
  `technology` text COLLATE utf8mb4_unicode_ci,
  `bed_bath` text COLLATE utf8mb4_unicode_ci,
  `others` text COLLATE utf8mb4_unicode_ci,
  `acreage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bathroom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `additional_info` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_translations`
--

INSERT INTO `room_translations` (`id`, `room_id`, `lang_code`, `name`, `slug`, `description`, `content`, `featured_title`, `featured_description`, `suite_highlights`, `technology`, `bed_bath`, `others`, `acreage`, `direction`, `bed`, `capacity`, `bathroom`, `seo_title`, `seo_description`, `seo_keywords`, `created_at`, `updated_at`, `additional_info`) VALUES
(1, 1, 'en', 'Family Room', 'family-room', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', 'FEATURED OFFER', 'Lorem ipsum dolor sit amet consectetur. Massa amet morbi commodo feugiat feugiat eget. In metus vitae id purus commodo ultrices lectus. Viverra tellus aliquam ut nunc sit fringilla a amet. Etiam pulvinar eget amet ac. Et pharetra platea lobortis in tempor tortor. Tempus est justo convallis auctor vivamus. \r\n\r\nVolutpat diam vitae ut arcu eget convallis sed egestas. Viverra sollicitudin maecenas tortor metus adipiscing. Vitae vehicula ipsum sed pharetra in maecenas nisl fames. Non nisl lectus nunc et. Neque diam feugiat enim blandit integer.\r\n\r\nEt non justo amet quis pharetra morbi vestibulum. Potenti interdum congue sapien augue pellentesque venenatis porttitor. Phasellus amet laoreet blandit in proin neque nisl velit nisl est.', 'Spacious balcony & city view\r\nDaily complimentary full hot breakfast\r\nDaily housekeeping & turndown service\r\nElectronic safe deposit box\r\nCoffee Maker', '43’’ flat screen Internet TV\r\nIDD telephone\r\nFREE Highspeed Wireless internet access\r\nRefrigerator & Minibar\r\nCentral air-conditioning with Digital individual climate control\r\nElectrical adaptor', '1 King bed or 02 single beds\r\nSeparate toilet, washbasin and standing shower and Bathtub.\r\nBathrobe\r\nIron & ironing board\r\nWeighing scale\r\nHair dryer\r\nShaver outlet (220 volts)\r\nDeluxe toiletries\r\nMake up/shaving mirror', 'Welcome drinks\r\nOrientation map\r\nCoffe table & chair\r\nTea bags & coffee making facilities\r\nPets not allowed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-12 08:58:49', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(2, 2, 'en', 'SUPERIOR room', 'superior-room', 'The presidential suite is uniquely designed with high-end and luxurious furnishings.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:39:46', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(3, 2, 'vi', 'phòng Superior', 'phng-superior', 'Phòng tổng thống được thiết kế độc đáo với nội thất cao cấp và sang trọng.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:39:46', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(4, 3, 'en', 'Deluxe Room', 'deluxe-room', 'This is a large room with one double bed and two single beds, suitable for a family of four adults and two children under six years old.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:42:02', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(5, 3, 'vi', 'Phòng Deluxe', 'phng-deluxe', 'Đây là một phòng rộng rãi với một giường đôi và hai giường đơn, phù hợp cho một gia đình gồm bốn người lớn và hai trẻ em dưới sáu tuổi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:42:02', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(6, 4, 'en', 'PREMIER ROOM', 'premier-room', 'Designed with two spacious bedrooms, suitable for a family of four adults and two children under six years old.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:45:16', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(7, 4, 'vi', 'PHÒNG CAO CẤP', 'phng-cao-cp', 'Được thiết kế với hai phòng ngủ rộng rãi, phù hợp cho một gia đình gồm bốn người lớn và hai trẻ em dưới sáu tuổi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:45:16', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(8, 5, 'en', 'grand family', 'grand-family', 'Premier rooms are located on the higher floors, offering better mountain views.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:50:08', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(9, 5, 'vi', 'đại gia đình', 'dai-gia-dinh', 'Các phòng hạng nhất nằm ở các tầng cao hơn, mang đến tầm nhìn đẹp hơn ra dãy núi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:50:08', '2026-03-27 06:53:52', '{\"1773802068726\":{\"icon\":\"69ba1335a9dce1773802293.webp\",\"text\":\"Max occupancy: 4 pax\"},\"1773802145729\":{\"icon\":\"69c504ee2ec501774519534.webp\",\"text\":\"Wifi\"},\"1773802146387\":{\"icon\":\"69c504f0600c21774519536.webp\",\"text\":\"1 King Bed\"},\"1773802146628\":{\"icon\":\"69c504f06416e1774519536.webp\",\"text\":\"No smoking\"},\"1773802146774\":{\"icon\":\"69c504f069c5b1774519536.webp\",\"text\":\"Room size: 68 m2\"},\"1773802147165\":{\"icon\":\"69c504f06ded21774519536.webp\",\"text\":\"Bathroom: Toilet, washbasin and stand up shower\"},\"1773802244469\":{\"icon\":\"69c504f0716f61774519536.webp\",\"text\":\"View: Neighboring or street view\"},\"1773802245072\":{\"icon\":\"69ba133a91e741773802298.webp\",\"text\":\"Mini bar\"}}'),
(10, 1, 'vi', 'Phòng gia đình', 'phng-gia-nh', 'Đây là một phòng rộng rãi với một giường đôi và hai giường đơn, phù hợp cho một gia đình gồm bốn người lớn và hai trẻ em dưới sáu tuổi.', '<p><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Diam amet urna eget phasellus nunc. Ultrices id viverra odio ornare vehicula. Quam dolor id sapien enim. Morbi sit nibh leo enim amet quis vel lacus. Semper lobortis eget scelerisque nec nullam cursus convallis massa morbi. Sollicitudin risus diam in magna mus risus libero.<br />\r\n<br />\r\nAccumsan porta quam erat semper etiam lobortis quam. Donec adipiscing fringilla praesent mus purus. Non vel lectus nisl felis dictum mauris. Nisl maecenas ut urna enim molestie arcu. Nibh et ullamcorper pharetra vitae mauris et lobortis. Egestas tortor suscipit semper elementum. Dui vivamus nullam a blandit. Aliquam purus ante nunc dignissim vel. At a pulvinar luctus faucibus rhoncus sagittis volutpat vitae ultrices. Mus odio aliquet urna in faucibus mi egestas egestas. Ut tempus ornare nibh augue. Eget consequat bibendum sit turpis. Duis quam in venenatis eleifend eu. Tortor nulla auctor malesuada nisi morbi donec. Vitae nisi nec tincidunt donec sed.</span></p>', NULL, NULL, 'Ban công rộng rãi và tầm nhìn ra thành phố\r\nBữa sáng nóng đầy đủ miễn phí hàng ngày\r\nDịch vụ dọn phòng và chuẩn bị giường ngủ hàng ngày\r\nKét sắt điện tử\r\nMáy pha cà phê', 'Tivi màn hình phẳng 43 inch có kết nối Internet\r\nĐiện thoại gọi quốc tế\r\nTruy cập internet không dây tốc độ cao MIỄN PHÍ\r\nTủ lạnh & Minibar\r\nMáy điều hòa trung tâm với điều khiển nhiệt độ riêng biệt kỹ thuật số\r\nBộ chuyển đổi điện', '1 giường cỡ King hoặc 2 giường đơn\r\nPhòng vệ sinh, bồn rửa mặt, vòi sen đứng và bồn tắm riêng biệt.\r\nÁo choàng tắm\r\nBàn ủi và bàn là\r\nCân\r\nMáy sấy tóc\r\nỔ cắm điện cho máy cạo râu (220 volt)\r\nĐồ dùng vệ sinh cao cấp\r\nGương trang điểm/cạo râu', 'Đồ uống chào mừng\r\nBản đồ chỉ dẫn\r\nBàn cà phê và ghế\r\nTúi trà và dụng cụ pha cà phê\r\nKhông cho phép thú cưng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 03:56:06', '2026-03-27 06:53:54', '{\"1774324328143\":{\"icon\":\"69c20b56b37331774324566.webp\",\"text\":\"S\\u1ee9c ch\\u1ee9a t\\u1ed1i \\u0111a: 4 ng\\u01b0\\u1eddi\"},\"1774324337057\":{\"icon\":\"69c504f07f7c11774519536.webp\",\"text\":\"Wifi\"},\"1774324338146\":{\"icon\":\"69c504f082b791774519536.webp\",\"text\":\"1 gi\\u01b0\\u1eddng King\"},\"1774324338235\":{\"icon\":\"69c504f0870bf1774519536.webp\",\"text\":\"C\\u1ea5m h\\u00fat thu\\u1ed1c l\\u00e1\"},\"1774324338500\":{\"icon\":\"69c504f08b67d1774519536.webp\",\"text\":\"K\\u00edch c\\u1ee1: 68m2\"},\"1774324338949\":{\"icon\":\"69c504f08fe191774519536.webp\",\"text\":\"Ph\\u00f2ng t\\u1eafm: Toilet, b\\u1ed3n r\\u1eeda m\\u1eb7t v\\u00e0 v\\u00f2i sen \\u0111\\u1ee9ng\"},\"1774324342542\":{\"icon\":\"69c504f0937821774519536.webp\",\"text\":\"T\\u1ea7m nh\\u00ecn: khu d\\u00e2n c\\u01b0 ho\\u1eb7c \\u0111\\u01b0\\u1eddng ph\\u1ed1\"},\"1774324414540\":{\"icon\":\"69c20b56dee9f1774324566.webp\",\"text\":\"Minibar\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `special_offers`
--

CREATE TABLE `special_offers` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotline_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotline_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `admin_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_offers`
--

INSERT INTO `special_offers` (`id`, `image`, `hotline_1`, `hotline_2`, `hotline`, `email`, `status`, `admin_id`, `created_at`, `updated_at`, `sort_order`) VALUES
(1, '69ba77bd226c01773828029.webp', '+84 912.887.101', '+84 (0) 214.379.8888', '84 (0) 214.379.8888', 'info@kksapahotel.com', 1, 4, '2026-03-13 10:10:09', '2026-03-26 06:55:17', 1),
(2, '69c216746f31b1774327412.webp', NULL, NULL, NULL, NULL, 1, 4, '2026-03-24 04:43:33', '2026-03-26 06:55:28', 2),
(3, '69c216e526f081774327525.webp', NULL, NULL, NULL, NULL, 1, 4, '2026-03-24 04:45:25', '2026-03-26 06:55:36', 3),
(5, '69c4e8dc7a90c1774512348.webp', NULL, NULL, NULL, NULL, 1, 4, '2026-03-26 08:05:48', '2026-03-26 08:07:58', 4);

-- --------------------------------------------------------

--
-- Table structure for table `special_offer_images`
--

CREATE TABLE `special_offer_images` (
  `id` bigint UNSIGNED NOT NULL,
  `special_offer_id` bigint UNSIGNED NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_offer_images`
--

INSERT INTO `special_offer_images` (`id`, `special_offer_id`, `type`, `image`, `created_at`, `updated_at`) VALUES
(10, 1, 2, '69c0b5e0088f01774237152.webp', '2026-03-23 03:39:12', '2026-03-23 03:39:12'),
(11, 1, 2, '69c0b5e0e83e91774237152.webp', '2026-03-23 03:39:14', '2026-03-23 03:39:14'),
(13, 1, 2, '69c0b5e3bc62e1774237155.webp', '2026-03-23 03:39:16', '2026-03-23 03:39:16'),
(14, 2, 2, '69c216750cd511774327413.webp', '2026-03-24 04:43:33', '2026-03-24 04:43:33'),
(15, 2, 2, '69c2167531e371774327413.webp', '2026-03-24 04:43:33', '2026-03-24 04:43:33'),
(16, 2, 2, '69c21675866ed1774327413.webp', '2026-03-24 04:43:33', '2026-03-24 04:43:33'),
(17, 2, 2, '69c21675e410c1774327413.webp', '2026-03-24 04:43:34', '2026-03-24 04:43:34'),
(18, 3, 2, '69c216e5b2c7a1774327525.webp', '2026-03-24 04:45:25', '2026-03-24 04:45:25'),
(19, 3, 2, '69c216e5dda461774327525.webp', '2026-03-24 04:45:26', '2026-03-24 04:45:26'),
(20, 3, 2, '69c216e61046e1774327526.webp', '2026-03-24 04:45:26', '2026-03-24 04:45:26'),
(21, 3, 2, '69c216e6708e31774327526.webp', '2026-03-24 04:45:26', '2026-03-24 04:45:26'),
(22, 1, 1, '69c4e3eba912b1774511083.webp', '2026-03-26 07:44:45', '2026-03-26 07:44:45'),
(23, 1, 1, '69c4e3ed60fdb1774511085.webp', '2026-03-26 07:44:47', '2026-03-26 07:44:47'),
(24, 1, 1, '69c4e3ef1a3321774511087.webp', '2026-03-26 07:44:49', '2026-03-26 07:44:49'),
(25, 5, 2, '69c4e8dc9d25b1774512348.webp', '2026-03-26 08:05:50', '2026-03-26 08:05:50'),
(26, 5, 2, '69c4e8decc0191774512350.webp', '2026-03-26 08:05:52', '2026-03-26 08:05:52'),
(27, 5, 2, '69c4e8e0bb8a71774512352.webp', '2026-03-26 08:05:54', '2026-03-26 08:05:54'),
(28, 5, 1, '69c4e8e2c40291774512354.webp', '2026-03-26 08:05:56', '2026-03-26 08:05:56'),
(29, 5, 1, '69c4e8e4897e61774512356.webp', '2026-03-26 08:05:58', '2026-03-26 08:05:58'),
(30, 5, 1, '69c4e8e61fc7d1774512358.webp', '2026-03-26 08:06:00', '2026-03-26 08:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `special_offer_translations`
--

CREATE TABLE `special_offer_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `special_offer_id` bigint UNSIGNED NOT NULL,
  `lang_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `price_content` longtext COLLATE utf8mb4_unicode_ci,
  `terms_content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_offer_translations`
--

INSERT INTO `special_offer_translations` (`id`, `special_offer_id`, `lang_code`, `name`, `slug`, `text_price`, `short_description`, `content`, `price_content`, `terms_content`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'HANOI - SAPA ALL-INCLUSIVE PACKAGE', 'hanoi-sapa-all-inclusive-package', 'Available from <strong> VND 8,199,000 per person </strong>', 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.\r\nAdipiscing laoreet velit donec sed sociis id in justo. Eget mollis mi neque molestie vivamus consectetur eget dictum. Sollicitudin lectus sit massa sit lectus. Commodo aenean tempor vitae varius etiam elementum. Tristique placerat eget sed malesuada etiam viverra orci turpis. Fusce at aliquet euismod donec tellus.', '<p>Lorem ipsum dolor sit amet consectetur. Non at nec ut arcu sit. Tellus odio morbi a ornare. Id ac mauris diam iaculis a vel. Convallis vivamus arcu habitasse amet in amet pretium integer. Imperdiet odio egestas nisl mi. Massa tellus non eu scelerisque. Vel urna magna convallis ut ac arcu egestas quis tellus. Amet senectus ac nisi euismod at. Et quis aliquam quis sodales. Arcu amet lorem ut sagittis praesent. Dolor sit velit ultrices nulla suscipit. Nulla scelerisque tellus nibh magna nunc etiam dignissim ornare nisl.<br />\r\nAdipiscing laoreet velit donec sed sociis id in justo. Eget mollis mi neque molestie vivamus consectetur eget dictum. Sollicitudin lectus sit massa sit lectus. Commodo aenean tempor vitae varius etiam elementum. Tristique placerat eget sed malesuada etiam viverra orci turpis. Fusce at aliquet euismod donec tellus.</p>', '<h2><span style=\"white-space:pre-wrap;\">Price from VND8,199,000 per person</span></h2>\r\n\r\n<ul>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n</ul>', '<h2><span style=\"white-space:pre-wrap;\">Terms &amp; condition:</span></h2>\r\n\r\n<ul>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n	<li><span style=\"white-space:pre-wrap;\">Lorem ipsum dolor sit amet consectetur. Enim neque arcu pharetra ornare diam suspendisse eu odio. Dictumst vitae volutpat in egestas. Tellus viverra lacus mattis amet in.</span></li>\r\n</ul>', '2026-03-13 10:10:09', '2026-03-26 07:49:56'),
(2, 1, 'vi', 'GÓI DU LỊCH TRỌN GÓI HANOI - SAPA', 'gi-du-lch-trn-gi-hanoi-sapa', 'Giá từ <strong> 8,199,000 VND  / người </strong>', 'Nằm trên cao, Khách sạn KK Sapa như một viên ngọc ẩn giữa lòng Sa Pa. Từ ban công riêng, dãy Hoàng Liên Sơn hùng vĩ hiện ra như một.\r\nAdipiscing laoreet velit donec sed sociis id in justo. Eget mollis mi neque molestie vivamus consectetur eget dictum. Sollicitudin lectus ngồi massa ngồi lectus. Commodo aenean tempor vitae varius etiam elementum. Tristique placerat eget sed malesuada etiam viverra orci turpis. Fusce và aliquet euismod donec Tellus.', '<p>Lorem ipsum dolor sit amet consectetur. Non at nec ut arcu sit. Tellus odio morbi a ornare. Id ac mauris diam iaculis a vel. Convallis vivamus arcu habitasse amet in amet pretium integer. Imperdiet odio egestas nisl mi. Massa tellus non eu scelerisque. Vel urna magna convallis ut ac arcu egestas quis tellus. Amet senectus ac nisi euismod at. Et quis aliquam quis sodales. Arcu amet lorem ut sagittis praesent. Dolor sit velit ultrices nulla suscipit. Nulla scelerisque tellus nibh magna nunc etiam dignissim ornare nisl.<br />\r\nAdipiscing laoreet velit donec sed sociis id in justo. Eget mollis mi neque molestie vivamus consectetur eget dictum. Sollicitudin lectus sit massa sit lectus. Commodo aenean tempor vitae varius etiam elementum. Tristique placerat eget sed malesuada etiam viverra orci turpis. Fusce at aliquet euismod donec tellus.</p>\r\n\r\n<p>&nbsp;</p>', '<p>Lorem ipsum dolor sit amet consectetur. Non at nec ut arcu sit. Tellus odio morbi a ornare. Id ac mauris diam iaculis a vel. Convallis vivamus arcu habitasse amet in amet pretium integer. Imperdiet odio egestas nisl mi. Massa tellus non eu scelerisque. Vel urna magna convallis ut ac arcu egestas quis tellus. Amet senectus ac nisi euismod at. Et quis aliquam quis sodales. Arcu amet lorem ut sagittis praesent. Dolor sit velit ultrices nulla suscipit. Nulla scelerisque tellus nibh magna nunc etiam dignissim ornare nisl.<br />\r\nAdipiscing laoreet velit donec sed sociis id in justo. Eget mollis mi neque molestie vivamus consectetur eget dictum. Sollicitudin lectus sit massa sit lectus. Commodo aenean tempor vitae varius etiam elementum. Tristique placerat eget sed malesuada etiam viverra orci turpis. Fusce at aliquet euismod donec tellus.</p>\r\n\r\n<p>&nbsp;</p>', '<p>Lorem ipsum dolor sit amet consectetur. Non at nec ut arcu sit. Tellus odio morbi a ornare. Id ac mauris diam iaculis a vel. Convallis vivamus arcu habitasse amet in amet pretium integer. Imperdiet odio egestas nisl mi. Massa tellus non eu scelerisque. Vel urna magna convallis ut ac arcu egestas quis tellus. Amet senectus ac nisi euismod at. Et quis aliquam quis sodales. Arcu amet lorem ut sagittis praesent. Dolor sit velit ultrices nulla suscipit. Nulla scelerisque tellus nibh magna nunc etiam dignissim ornare nisl.<br />\r\nAdipiscing laoreet velit donec sed sociis id in justo. Eget mollis mi neque molestie vivamus consectetur eget dictum. Sollicitudin lectus sit massa sit lectus. Commodo aenean tempor vitae varius etiam elementum. Tristique placerat eget sed malesuada etiam viverra orci turpis. Fusce at aliquet euismod donec tellus.</p>\r\n\r\n<p>&nbsp;</p>', '2026-03-24 04:42:07', '2026-03-26 07:35:33'),
(3, 2, 'en', 'HANOI - SAPA ALL-INCLUSIVE PACKAGE', 'hanoi-sapa-all-inclusive-package-1', NULL, 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', NULL, NULL, NULL, '2026-03-24 04:43:33', '2026-03-24 04:43:33'),
(4, 2, 'vi', 'GÓI DU LỊCH TRỌN GÓI HANOI - SAPA', 'gi-du-lch-trn-gi-hanoi-sapa-1', NULL, NULL, NULL, NULL, NULL, '2026-03-24 04:43:33', '2026-03-24 04:43:33'),
(5, 3, 'en', 'HANOI - SAPA ALL-INCLUSIVE PACKAGE', 'hanoi-sapa-all-inclusive-package-2', NULL, 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', NULL, NULL, NULL, '2026-03-24 04:45:25', '2026-03-24 04:45:25'),
(6, 3, 'vi', 'GÓI DU LỊCH TRỌN GÓI HANOI - SAPA', 'gi-du-lch-trn-gi-hanoi-sapa-2', NULL, 'Nằm trên cao, khách sạn KK Sapa là một viên ngọc ẩn mình giữa lòng Sa Pa. Từ ban công riêng của bạn, dãy núi Hoàng Liên Sơn hùng vĩ trải dài trước mắt.', NULL, NULL, NULL, '2026-03-24 04:45:25', '2026-03-24 04:45:25'),
(8, 5, 'en', 'HANOI - SAPA ALL-INCLUSIVE PACKAGE', 'hanoi-sapa-all-inclusive-package-3', NULL, 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', NULL, NULL, NULL, '2026-03-26 08:05:48', '2026-03-26 08:05:48'),
(9, 5, 'vi', 'HANOI - SAPA ALL-INCLUSIVE PACKAGE', 'hanoi-sapa-all-inclusive-package-4', NULL, 'Perched high above, KK Sapa Hotel is a hidden gem in the heart of Sa Pa. From your private balcony, the majestic Hoang Lien Son mountain range unfolds like a.', NULL, NULL, NULL, '2026-03-26 08:05:48', '2026-03-26 08:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry_id` int UNSIGNED DEFAULT '0',
  `number_of_employees_id` int DEFAULT '0',
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `founding_date` date DEFAULT NULL,
  `ceo_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dial_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `country_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `social_media` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_post_count` int NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'banned : 0, active : 1',
  `ev` tinyint NOT NULL DEFAULT '0' COMMENT 'Email Unverified : 0, Email Verified : 1',
  `sv` tinyint NOT NULL DEFAULT '0' COMMENT 'SMS Unverified : 0, SMS Verified : 1',
  `ver_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Stores verification Code',
  `ver_code_send_at` datetime DEFAULT NULL,
  `ts` tinyint NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint NOT NULL DEFAULT '1' COMMENT '2fa unverified : 0 , 2fa verified : 1',
  `tsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `map` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_job_post_limit` int NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `plan_id` int UNSIGNED NOT NULL DEFAULT '0',
  `expired_date` datetime DEFAULT NULL,
  `subscription_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=approved,2=pending,2=expired ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `industry_id`, `number_of_employees_id`, `company_name`, `founding_date`, `ceo_name`, `username`, `email`, `balance`, `country_code`, `dial_code`, `country_name`, `state`, `city`, `zip`, `mobile`, `fax`, `password`, `website`, `image`, `address`, `social_media`, `description`, `job_post_count`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `profile_complete`, `provider`, `provider_id`, `remember_token`, `ban_reason`, `map`, `slug`, `free_job_post_limit`, `is_featured`, `plan_id`, `expired_date`, `subscription_status`, `created_at`, `updated_at`) VALUES
(1, 'cong', 'nguyen', 0, 0, NULL, NULL, NULL, NULL, 'conguyen6262@gmail.com', '0.00000000', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$ls0JishAh8GorNRUyFcxN.2xID7IaBr5kRpn.oTWD9najo.HXV6mm', NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, '', NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, NULL, 0, '2026-03-02 20:49:26', '2026-03-02 20:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 0, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2026-03-02 20:49:27', '2026-03-02 20:49:27'),
(2, 1, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2026-03-03 06:42:53', '2026-03-03 06:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint UNSIGNED NOT NULL,
  `job_id` int UNSIGNED NOT NULL DEFAULT '0',
  `count` int UNSIGNED NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `gso_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` bigint UNSIGNED DEFAULT NULL,
  `province_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `name`, `status`, `gso_id`, `district_id`, `province_id`, `created_at`, `updated_at`) VALUES
(1, 'An Biên', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(2, 'An Châu', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(3, 'An Cư', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(4, 'An Minh', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(5, 'An Phú', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(6, 'Ba Chúc', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(7, 'Bình An', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(8, 'Bình Đức', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(9, 'Bình Giang', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(10, 'Bình Hòa', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(11, 'Bình Mỹ', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(12, 'Bình Sơn', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(13, 'Bình Thạnh Đông', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(14, 'Cần Đăng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(15, 'Châu Đốc', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(16, 'Châu Phong', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(17, 'Châu Phú', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(18, 'Châu Thành', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(19, 'Chi Lăng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(20, 'Chợ Mới', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(21, 'Chợ Vàm', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(22, 'Cô Tô', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(23, 'Cù Lao Giêng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(24, 'Định Hòa', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(25, 'Định Mỹ', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(26, 'Đông Hòa', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(27, 'Đông Hưng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(28, 'Đông Thái', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(29, 'Giang Thành', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(30, 'Giồng Riềng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(31, 'Gò Quao', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(32, 'Hà Tiên', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(33, 'Hòa Điền', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(34, 'Hòa Hưng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(35, 'Hòa Lạc', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(36, 'Hòa Thuận', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(37, 'Hội An', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(38, 'Hòn Đất', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(39, 'Hòn Nghệ', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(40, 'Khánh Bình', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(41, 'Kiên Hải', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(42, 'Kiên Lương', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(43, 'Long Điền', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(44, 'Long Kiến', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(45, 'Long Phú', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(46, 'Long Thạnh', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(47, 'Long Xuyên', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(48, 'Mỹ Đức', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(49, 'Mỹ Hòa Hưng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(50, 'Mỹ Thới', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(51, 'Mỹ Thuận', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(52, 'Ngọc Chúc', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(53, 'Nhơn Hội', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(54, 'Nhơn Mỹ', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(55, 'Núi Cấm', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(56, 'Ô Lâm', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(57, 'Óc Eo', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(58, 'Phú An', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(59, 'Phú Hòa', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(60, 'Phú Hữu', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(61, 'Phú Lâm', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(62, 'Phú Quốc', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(63, 'Phú Tân', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(64, 'Rạch Giá', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(65, 'Sơn Hải', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(66, 'Sơn Kiên', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(67, 'Tân An', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(68, 'Tân Châu', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(69, 'Tân Hiệp', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(70, 'Tân Hội', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(71, 'Tân Thạnh', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(72, 'Tây Phú', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(73, 'Tây Yên', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(74, 'Thạnh Đông', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(75, 'Thạnh Hưng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(76, 'Thạnh Lộc', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(77, 'Thạnh Mỹ Tây', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(78, 'Thổ Châu', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(79, 'Thoại Sơn', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(80, 'Thới Sơn', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(81, 'Tiên Hải', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(82, 'Tịnh Biên', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(83, 'Tô Châu', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(84, 'Tri Tôn', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(85, 'U Minh Thượng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(86, 'Vân Khánh', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(87, 'Vĩnh An', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(88, 'Vĩnh Bình', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(89, 'Vĩnh Điều', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(90, 'Vĩnh Gia', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(91, 'Vĩnh Hanh', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(92, 'Vĩnh Hậu', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(93, 'Vĩnh Hòa', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(94, 'Vĩnh Hòa Hưng', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(95, 'Vĩnh Phong', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(96, 'Vĩnh Tế', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(97, 'Vĩnh Thạnh Trung', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(98, 'Vĩnh Thông', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(99, 'Vĩnh Thuận', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(100, 'Vĩnh Trạch', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(101, 'Vĩnh Tuy', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(102, 'Vĩnh Xương', 1, NULL, NULL, 1, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(103, 'An Lạc', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(104, 'Bắc Giang', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(105, 'Bắc Lũng', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(106, 'Bảo Đài', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(107, 'Biển Động', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(108, 'Biên Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(109, 'Bố Hạ', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(110, 'Bồng Lai', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(111, 'Cẩm Lý', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(112, 'Cảnh Thụy', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(113, 'Cao Đức', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(114, 'Chi Lăng', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(115, 'Chũ', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(116, 'Đa Mai', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(117, 'Đại Đồng', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(118, 'Đại Lai', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(119, 'Đại Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(120, 'Đào Viên', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(121, 'Đèo Gia', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(122, 'Đông Cứu', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(123, 'Đồng Kỳ', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(124, 'Đồng Nguyên', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(125, 'Đông Phú', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(126, 'Đồng Việt', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(127, 'Dương Hưu', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(128, 'Gia Bình', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(129, 'Hạp Lĩnh', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(130, 'Hiệp Hòa', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(131, 'Hoàng Vân', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(132, 'Hợp Thịnh', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(133, 'Kép', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(134, 'Kiên Lao', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(135, 'Kinh Bắc', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(136, 'Lâm Thao', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(137, 'Lạng Giang', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(138, 'Liên Bão', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(139, 'Lục Nam', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(140, 'Lục Ngạn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(141, 'Lục Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(142, 'Lương Tài', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(143, 'Mão Điền', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(144, 'Mỹ Thái', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(145, 'Nam Dương', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(146, 'Nam Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(147, 'Nếnh', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(148, 'Nghĩa Phương', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(149, 'Ngọc Thiện', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(150, 'Nhã Nam', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(151, 'Nhân Hòa', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(152, 'Nhân Thắng', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(153, 'Ninh Xá', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(154, 'Phật Tích', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(155, 'Phù Khê', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(156, 'Phù Lãng', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(157, 'Phúc Hoà', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(158, 'Phương Liễu', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(159, 'Phượng Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(160, 'Quang Trung', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(161, 'Quế Võ', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(162, 'Sa Lý', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(163, 'Sơn Động', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(164, 'Sơn Hải', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(165, 'Song Liễu', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(166, 'Tam Đa', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(167, 'Tam Giang', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(168, 'Tam Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(169, 'Tam Tiến', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(170, 'Tân An', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(171, 'Tân Chi', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(172, 'Tân Dĩnh', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(173, 'Tân Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(174, 'Tân Tiến', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(175, 'Tân Yên', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(176, 'Tây Yên Tử', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(177, 'Thuận Thành', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(178, 'Tiên Du', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(179, 'Tiên Lục', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(180, 'Tiền Phong', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(181, 'Trạm Lộ', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(182, 'Trí Quả', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(183, 'Trung Chính', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(184, 'Trung Kênh', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(185, 'Trường Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(186, 'Tự Lạn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(187, 'Từ Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(188, 'Tuấn Đạo', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(189, 'Vân Hà', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(190, 'Văn Môn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(191, 'Vân Sơn', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(192, 'Việt Yên', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(193, 'Võ Cường', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(194, 'Vũ Ninh', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(195, 'Xuân Cẩm', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(196, 'Xuân Lương', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(197, 'Yên Định', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(198, 'Yên Dũng', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(199, 'Yên Phong', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(200, 'Yên Thế', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(201, 'Yên Trung', 1, NULL, NULL, 2, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(202, 'An Trạch', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(203, 'An Xuyên', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(204, 'Bạc Liêu', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(205, 'Biển Bạch', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(206, 'Cái Đôi Vàm', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(207, 'Cái Nước', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(208, 'Châu Thới', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(209, 'Đá Bạc', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(210, 'Đầm Dơi', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(211, 'Đất Mới', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(212, 'Đất Mũi', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(213, 'Định Thành', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(214, 'Đông Hải', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(215, 'Gành Hào', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(216, 'Giá Rai', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(217, 'Hiệp Thành', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(218, 'Hồ Thị Kỷ', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(219, 'Hoà Bình', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(220, 'Hoà Thành', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(221, 'Hồng Dân', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(222, 'Hưng Hội', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(223, 'Hưng Mỹ', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(224, 'Khánh An', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(225, 'Khánh Bình', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(226, 'Khánh Hưng', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(227, 'Khánh Lâm', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(228, 'Láng Tròn', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(229, 'Long Điền', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(230, 'Lương Thế Trân', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(231, 'Lý Văn Lâm', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(232, 'Năm Căn', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(233, 'Nguyễn Phích', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(234, 'Nguyễn Việt Khái', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(235, 'Ninh Quới', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(236, 'Ninh Thạnh Lợi', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(237, 'Phan Ngọc Hiển', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(238, 'Phong Hiệp', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(239, 'Phong Thạnh', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(240, 'Phú Mỹ', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(241, 'Phú Tân', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(242, 'Phước Long', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(243, 'Quách Phẩm', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(244, 'Sông Đốc', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(245, 'Tạ An Khương', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(246, 'Tam Giang', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(247, 'Tân Ân', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(248, 'Tân Hưng', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(249, 'Tân Lộc', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(250, 'Tân Thành', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(251, 'Tân Thuận', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(252, 'Tân Tiến', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(253, 'Thanh Tùng', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(254, 'Thới Bình', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(255, 'Trần Phán', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(256, 'Trần Văn Thời', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(257, 'Trí Phải', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(258, 'U Minh', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(259, 'Vĩnh Hậu', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(260, 'Vĩnh Lộc', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(261, 'Vĩnh Lợi', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(262, 'Vĩnh Mỹ', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(263, 'Vĩnh Phước', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(264, 'Vĩnh Thanh', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(265, 'Vĩnh Trạch', 1, NULL, NULL, 3, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(266, 'An Bình', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(267, 'An Lạc Thôn', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(268, 'An Ninh', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(269, 'An Thạnh', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(270, 'Bình Thủy', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(271, 'Cái Khế', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(272, 'Cái Răng', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(273, 'Châu Thành', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(274, 'Cờ Đỏ', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(275, 'Cù Lao Dung', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(276, 'Đại Hải', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(277, 'Đại Ngãi', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(278, 'Đại Thành', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(279, 'Đông Hiệp', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(280, 'Đông Phước', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(281, 'Đông Thuận', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(282, 'Gia Hòa', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(283, 'Hiệp Hưng', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(284, 'Hồ Đắc Kiện', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(285, 'Hòa An', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(286, 'Hỏa Lựu', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(287, 'Hòa Tú', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(288, 'Hưng Phú', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(289, 'Kế Sách', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(290, 'Khánh Hòa', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(291, 'Lai Hòa', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(292, 'Lâm Tân', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(293, 'Lịch Hội Thượng', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(294, 'Liêu Tú', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(295, 'Long Bình', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(296, 'Long Hưng', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(297, 'Long Mỹ', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(298, 'Long Phú', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(299, 'Long Phú 1', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(300, 'Long Tuyền', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(301, 'Lương Tâm', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(302, 'Mỹ Hương', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(303, 'Mỹ Phước', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(304, 'Mỹ Quới', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(305, 'Mỹ Tú', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(306, 'Mỹ Xuyên', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(307, 'Ngã Bảy', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(308, 'Ngã Năm', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(309, 'Ngọc Tố', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(310, 'Nhơn Ái', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(311, 'Nhơn Mỹ', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(312, 'Nhu Gia', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(313, 'Ninh Kiều', 1, NULL, NULL, 4, '2026-03-02 16:22:47', '2026-03-02 16:22:47'),
(314, 'Ô Môn', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(315, 'Phong Điền', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(316, 'Phong Nẫm', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(317, 'Phú Hữu', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(318, 'Phú Lộc', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(319, 'Phú Lợi', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(320, 'Phú Tâm', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(321, 'Phụng Hiệp', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(322, 'Phước Thới', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(323, 'Phương Bình', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(324, 'Sóc Trăng', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(325, 'Tài Văn', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(326, 'Tân An', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(327, 'Tân Bình', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(328, 'Tân Hòa', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(329, 'Tân Lộc', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(330, 'Tân Long', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(331, 'Tân Phước Hưng', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(332, 'Tân Thạnh', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(333, 'Thạnh An', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(334, 'Thạnh Hòa', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(335, 'Thạnh Phú', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(336, 'Thạnh Quới', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(337, 'Thạnh Thới An', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(338, 'Thạnh Xuân', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(339, 'Thới An Đông', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(340, 'Thới An Hội', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(341, 'Thới Hưng', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(342, 'Thới Lai', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(343, 'Thới Long', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(344, 'Thốt Nốt', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(345, 'Thuận Hòa', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(346, 'Thuận Hưng', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(347, 'Trần Đề', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(348, 'Trung Hưng', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(349, 'Trung Nhứt', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(350, 'Trường Khánh', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(351, 'Trường Long', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(352, 'Trường Long Tây', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(353, 'Trường Thành', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(354, 'Trường Xuân', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(355, 'Vị Tân', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(356, 'Vị Thanh', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(357, 'Vị Thanh 1', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(358, 'Vị Thủy', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(359, 'Vĩnh Châu', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(360, 'Vĩnh Hải', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(361, 'Vĩnh Lợi', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(362, 'Vĩnh Phước', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(363, 'Vĩnh Thạnh', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(364, 'Vĩnh Thuận Đông', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(365, 'Vĩnh Trinh', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(366, 'Vĩnh Tường', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(367, 'Vĩnh Viễn', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(368, 'Xà Phiên', 1, NULL, NULL, 4, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(369, 'Bạch Đặng', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(370, 'Bảo Lạc', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(371, 'Bảo Lâm', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(372, 'Bế Văn Đàn', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(373, 'Ca Thành', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(374, 'Cần Yên', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(375, 'Canh Tân', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(376, 'Cô Ba', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(377, 'Cốc Pàng', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(378, 'Đàm Thủy', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(379, 'Đình Phong', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(380, 'Đoài Dương', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(381, 'Độc Lập', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(382, 'Đông Khê', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(383, 'Đức Long', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(384, 'Hạ Lang', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(385, 'Hà Quảng', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(386, 'Hạnh Phúc', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(387, 'Hòa An', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(388, 'Hưng Đạo', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(389, 'Huy Giáp', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(390, 'Khánh Xuân', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(391, 'Kim Đồng', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(392, 'Lũng Nặm', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(393, 'Lý Bôn', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(394, 'Lý Quốc', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(395, 'Minh Khai', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(396, 'Minh Tâm', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(397, 'Nam Quang', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(398, 'Nam Tuấn', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(399, 'Nguyên Bình', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(400, 'Nguyễn Huệ', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(401, 'Nùng Trí Cao', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(402, 'Phan Thanh', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(403, 'Phục Hòa', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(404, 'Quang Hán', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(405, 'Quảng Lâm', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(406, 'Quang Long', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(407, 'Quang Trung', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(408, 'Quảng Uyên', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(409, 'Sơn Lộ', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(410, 'Tam Kim', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(411, 'Tân Giang', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(412, 'Thạch An', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(413, 'Thành Công', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(414, 'Thanh Long', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(415, 'Thông Nông', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(416, 'Thục Phán', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(417, 'Tĩnh Túc', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(418, 'Tổng Cọt', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(419, 'Trà Lĩnh', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(420, 'Trùng Khánh', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(421, 'Trường Hà', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(422, 'Vinh Quý', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(423, 'Xuân Trường', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(424, 'Yên Thổ', 1, NULL, NULL, 5, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(425, 'Bình Kiến', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(426, 'Buôn Đôn', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(427, 'Buôn Hồ', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(428, 'Buôn Ma Thuột', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(429, 'Cư Bao', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(430, 'Cư M’gar', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(431, 'Cư M’ta', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(432, 'Cư Pơng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(433, 'Cư Prao', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(434, 'Cư Pui', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(435, 'Cư Yang', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(436, 'Cuôr Đăng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(437, 'Đắk Liêng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(438, 'Đắk Phơi', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(439, 'Dang Kang', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(440, 'Dliê Ya', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(441, 'Đông Hòa', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(442, 'Đồng Xuân', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(443, 'Dray Bhăng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(444, 'Đức Bình', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(445, 'Dur Kmăl', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(446, 'Ea Bá', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(447, 'Ea Bung', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(448, 'Ea Drăng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(449, 'Ea Drông', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(450, 'Ea H’leo', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(451, 'Ea Hiao', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(452, 'Ea Kao', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(453, 'Ea Kar', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(454, 'Ea Khăl', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(455, 'Ea Kiết', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(456, 'Ea Kly', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(457, 'Ea Knốp', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(458, 'Ea Knuếc', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(459, 'Ea Ktur', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(460, 'Ea Ly', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(461, 'Ea M’droh', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(462, 'Ea Na', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(463, 'Ea Ning', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(464, 'Ea Nuôl', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(465, 'Ea Ô', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(466, 'Ea Păl', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(467, 'Ea Phê', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(468, 'Ea Riêng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(469, 'Ea Rốk', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(470, 'Ea Súp', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(471, 'Ea Trang', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(472, 'Ea Tul', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(473, 'Ea Wer', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(474, 'Ea Wy', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(475, 'Hòa Hiệp', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(476, 'Hòa Mỹ', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(477, 'Hòa Phú', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(478, 'Hòa Sơn', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(479, 'Hòa Thịnh', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(480, 'Hòa Xuân', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(481, 'Ia Lốp', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(482, 'Ia Rvê', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(483, 'Krông Á', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(484, 'Krông Ana', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(485, 'Krông Bông', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(486, 'Krông Búk', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(487, 'Krông Năng', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(488, 'Krông Nô', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(489, 'Krông Pắc', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(490, 'Liên Sơn Lắk', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(491, 'M’drắk', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(492, 'Nam Ka', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(493, 'Ô Loan', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(494, 'Phú Hòa 1', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(495, 'Phú Hòa 2', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(496, 'Phú Mỡ', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(497, 'Phú Xuân', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(498, 'Phú Yên', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(499, 'Pơng Drang', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(500, 'Quảng Phú', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(501, 'Sơn Hòa', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(502, 'Sơn Thành', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(503, 'Sông Cầu', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(504, 'Sông Hinh', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(505, 'Suối Trai', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(506, 'Tam Giang', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(507, 'Tân An', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(508, 'Tân Lập', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(509, 'Tân Tiến', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(510, 'Tây Hòa', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(511, 'Tây Sơn', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(512, 'Thành Nhất', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(513, 'Tuy An Bắc', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(514, 'Tuy An Đông', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(515, 'Tuy An Nam', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(516, 'Tuy An Tây', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(517, 'Tuy Hòa', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(518, 'Vân Hòa', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(519, 'Vụ Bổn', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(520, 'Xuân Cảnh', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(521, 'Xuân Đài', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(522, 'Xuân Lãnh', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(523, 'Xuân Lộc', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(524, 'Xuân Phước', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(525, 'Xuân Thọ', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(526, 'Yang Mao', 1, NULL, NULL, 6, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(527, 'An Hải', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(528, 'An Khê', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(529, 'An Thắng', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(530, 'Avương', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(531, 'Bà Nà', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(532, 'Bàn Thạch', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(533, 'Bến Giằng', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(534, 'Bến Hiên', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(535, 'Cẩm Lệ', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(536, 'Chiên Đàn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(537, 'Đắc Pring', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(538, 'Đại Lộc', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(539, 'Điện Bàn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(540, 'Điện Bàn Bắc', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(541, 'Điện Bàn Đông', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(542, 'Điện Bàn Tây', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(543, 'Đồng Dương', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(544, 'Đông Giang', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(545, 'Đức Phú', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(546, 'Duy Nghĩa', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(547, 'Duy Xuyên', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(548, 'Gò Nổi', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(549, 'Hà Nha', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(550, 'Hải Châu', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(551, 'Hải Vân', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(552, 'Hiệp Đức', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(553, 'Hòa Cường', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(554, 'Hòa Khánh', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(555, 'Hòa Tiến', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(556, 'Hòa Vang', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(557, 'Hòa Xuân', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(558, 'Hoàng Sa', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(559, 'Hội An', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(560, 'Hội An Đông', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(561, 'Hội An Tây', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(562, 'Hùng Sơn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(563, 'Hương Trà', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(564, 'Khâm Đức', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(565, 'La Dêê', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(566, 'La Êê', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(567, 'Lãnh Ngọc', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(568, 'Liên Chiểu', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(569, 'Nam Giang', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(570, 'Nam Phước', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(571, 'Nam Trà My', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(572, 'Ngũ Hành Sơn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(573, 'Nông Sơn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(574, 'Núi Thành', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(575, 'Phú Ninh', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(576, 'Phú Thuận', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(577, 'Phước Chánh', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(578, 'Phước Hiệp', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(579, 'Phước Năng', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(580, 'Phước Thành', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(581, 'Phước Trà', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(582, 'Quảng Phú', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(583, 'Quế Phước', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(584, 'Quế Sơn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(585, 'Quế Sơn Trung', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(586, 'Sơn Cẩm Hà', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(587, 'Sơn Trà', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(588, 'Sông Kôn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(589, 'Sông Vàng', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(590, 'Tam Anh', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(591, 'Tam Hải', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(592, 'Tam Kỳ', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(593, 'Tam Mỹ', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(594, 'Tam Xuân', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(595, 'Tân Hiệp', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(596, 'Tây Giang', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(597, 'Tây Hồ', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(598, 'Thăng An', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(599, 'Thăng Bình', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(600, 'Thăng Điền', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(601, 'Thăng Phú', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(602, 'Thăng Trường', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(603, 'Thạnh Bình', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(604, 'Thanh Khê', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(605, 'Thạnh Mỹ', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(606, 'Thu Bồn', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(607, 'Thượng Đức', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(608, 'Tiên Phước', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(609, 'Trà Đốc', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(610, 'Trà Giáp', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(611, 'Trà Leng', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(612, 'Trà Liên', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(613, 'Trà Linh', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(614, 'Trà My', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48');
INSERT INTO `wards` (`id`, `name`, `status`, `gso_id`, `district_id`, `province_id`, `created_at`, `updated_at`) VALUES
(615, 'Trà Tân', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(616, 'Trà Tập', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(617, 'Trà Vân', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(618, 'Việt An', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(619, 'Vu Gia', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(620, 'Xuân Phú', 1, NULL, NULL, 7, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(621, 'Búng Lao', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(622, 'Chà Tở', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(623, 'Chiềng Sinh', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(624, 'Điện Biên Phủ', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(625, 'Mường Ảng', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(626, 'Mường Chà', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(627, 'Mường Lạn', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(628, 'Mường Lay', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(629, 'Mường Luân', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(630, 'Mường Mùn', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(631, 'Mường Nhà', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(632, 'Mường Nhé', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(633, 'Mường Phăng', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(634, 'Mường Pồn', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(635, 'Mường Thanh', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(636, 'Mường Toong', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(637, 'Mường Tùng', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(638, 'Nà Bủng', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(639, 'Nà Hỳ', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(640, 'Na Sang', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(641, 'Na Son', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(642, 'Nà Tấu', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(643, 'Nậm Kè', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(644, 'Nậm Nèn', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(645, 'Núa Ngam', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(646, 'Pa Ham', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(647, 'Phình Giàng', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(648, 'Pu Nhi', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(649, 'Pú Nhung', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(650, 'Quài Tở', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(651, 'Quảng Lâm', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(652, 'Sam Mứn', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(653, 'Sáng Nhè', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(654, 'Si Pa Phìn', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(655, 'Sín Chải', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(656, 'Sín Thầu', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(657, 'Sính Phình', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(658, 'Thanh An', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(659, 'Thanh Nưa', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(660, 'Thanh Yên', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(661, 'Tìa Dình', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(662, 'Tủa Chùa', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(663, 'Tủa Thàng', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(664, 'Tuần Giáo', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(665, 'Xa Dung', 1, NULL, NULL, 8, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(666, 'An Lộc', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(667, 'An Phước', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(668, 'An Viễn', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(669, 'Bảo Vinh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(670, 'Bàu Hàm', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(671, 'Biên Hòa', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(672, 'Bình An', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(673, 'Bình Lộc', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(674, 'Bình Long', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(675, 'Bình Minh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(676, 'Bình Phước', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(677, 'Bình Tân', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(678, 'Bom Bo', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(679, 'Bù Đăng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(680, 'Bù Gia Mập', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(681, 'Cẩm Mỹ', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(682, 'Chơn Thành', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(683, 'Đa Kia', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(684, 'Đại Phước', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(685, 'Đak Lua', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(686, 'Đak Nhau', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(687, 'Đăk Ơ', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(688, 'Dầu Giây', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(689, 'Định Quán', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(690, 'Đồng Phú', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(691, 'Đồng Tâm', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(692, 'Đồng Xoài', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(693, 'Gia Kiệm', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(694, 'Hàng Gòn', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(695, 'Hố Nai', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(696, 'Hưng Phước', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(697, 'Hưng Thịnh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(698, 'La Ngà', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(699, 'Lộc Hưng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(700, 'Lộc Ninh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(701, 'Lộc Quang', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(702, 'Lộc Tấn', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(703, 'Lộc Thành', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(704, 'Lộc Thạnh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(705, 'Long Bình', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(706, 'Long Hà', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(707, 'Long Hưng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(708, 'Long Khánh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(709, 'Long Phước', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(710, 'Long Thành', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(711, 'Minh Đức', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(712, 'Minh Hưng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(713, 'Nam Cát Tiên', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(714, 'Nghĩa Trung', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(715, 'Nha Bích', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(716, 'Nhơn Trạch', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(717, 'Phú Hòa', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(718, 'Phú Lâm', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(719, 'Phú Lý', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(720, 'Phú Nghĩa', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(721, 'Phú Riềng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(722, 'Phú Trung', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(723, 'Phú Vinh', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(724, 'Phước An', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(725, 'Phước Bình', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(726, 'Phước Long', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(727, 'Phước Sơn', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(728, 'Phước Tân', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(729, 'Phước Thái', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(730, 'Sông Ray', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(731, 'Tà Lài', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(732, 'Tam Hiệp', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(733, 'Tam Phước', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(734, 'Tân An', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(735, 'Tân Hưng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(736, 'Tân Khai', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(737, 'Tân Lợi', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(738, 'Tân Phú', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(739, 'Tân Quan', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(740, 'Tân Tiến', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(741, 'Tân Triều', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(742, 'Thanh Sơn', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(743, 'Thiện Hưng', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(744, 'Thọ Sơn', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(745, 'Thống Nhất', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(746, 'Thuận Lợi', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(747, 'Trấn Biên', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(748, 'Trảng Bom', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(749, 'Trảng Dài', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(750, 'Trị An', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(751, 'Xuân Bắc', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(752, 'Xuân Định', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(753, 'Xuân Đông', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(754, 'Xuân Đường', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(755, 'Xuân Hòa', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(756, 'Xuân Lập', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(757, 'Xuân Lộc', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(758, 'Xuân Phú', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(759, 'Xuân Quế', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(760, 'Xuân Thành', 1, NULL, NULL, 9, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(761, 'An Bình', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(762, 'An Hòa', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(763, 'An Hữu', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(764, 'An Long', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(765, 'An Phước', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(766, 'An Thạnh Thủy', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(767, 'Ba Sao', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(768, 'Bình Hàng Trung', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(769, 'Bình Ninh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(770, 'Bình Phú', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(771, 'Bình Thành', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(772, 'Bình Trưng', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(773, 'Bình Xuân', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(774, 'Cái Bè', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(775, 'Cai Lậy', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(776, 'Cao Lãnh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(777, 'Châu Thành', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(778, 'Chợ Gạo', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(779, 'Đạo Thạnh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(780, 'Đốc Binh Kiều', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(781, 'Đồng Sơn', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(782, 'Gia Thuận', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(783, 'Gò Công', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(784, 'Gò Công Đông', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(785, 'Hậu Mỹ', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(786, 'Hiệp Đức', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(787, 'Hòa Long', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(788, 'Hội Cư', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(789, 'Hồng Ngự', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(790, 'Hưng Thạnh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(791, 'Kim Sơn', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(792, 'Lai Vung', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(793, 'Lấp Vò', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(794, 'Long Bình', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(795, 'Long Định', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(796, 'Long Hưng', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(797, 'Long Khánh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(798, 'Long Phú Thuận', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(799, 'Long Thuận', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(800, 'Long Tiên', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(801, 'Lương Hòa Lạc', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(802, 'Mỹ An Hưng', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(803, 'Mỹ Đức Tây', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(804, 'Mỹ Hiệp', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(805, 'Mỹ Lợi', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(806, 'Mỹ Ngãi', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(807, 'Mỹ Phong', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(808, 'Mỹ Phước Tây', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(809, 'Mỹ Quí', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(810, 'Mỹ Thành', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(811, 'Mỹ Thiện', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(812, 'Mỹ Tho', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(813, 'Mỹ Thọ', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(814, 'Mỹ Tịnh An', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(815, 'Mỹ Trà', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(816, 'Ngũ Hiệp', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(817, 'Nhị Quý', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(818, 'Phong Hòa', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(819, 'Phong Mỹ', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(820, 'Phú Cường', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(821, 'Phú Hựu', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(822, 'Phú Thành', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(823, 'Phú Thọ', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(824, 'Phương Thịnh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(825, 'Sa Đéc', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(826, 'Sơn Qui', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(827, 'Tam Nông', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(828, 'Tân Điền', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(829, 'Tân Đông', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(830, 'Tân Dương', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(831, 'Tân Hộ Cơ', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(832, 'Tân Hòa', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(833, 'Tân Hồng', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(834, 'Tân Hương', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(835, 'Tân Khánh Trung', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(836, 'Tân Long', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(837, 'Tân Nhuận Đông', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(838, 'Tân Phú', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(839, 'Tân Phú Đông', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(840, 'Tân Phú Trung', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(841, 'Tân Phước 1', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(842, 'Tân Phước 2', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(843, 'Tân Phước 3', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(844, 'Tân Thành', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(845, 'Tân Thạnh', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(846, 'Tân Thới', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(847, 'Tân Thuận Bình', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(848, 'Thanh Bình', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(849, 'Thanh Hòa', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(850, 'Thanh Hưng', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(851, 'Thanh Mỹ', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(852, 'Thạnh Phú', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(853, 'Tháp Mười', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(854, 'Thới Sơn', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(855, 'Thường Lạc', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(856, 'Thường Phước', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(857, 'Tràm Chim', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(858, 'Trung An', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(859, 'Trường Xuân', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(860, 'Vĩnh Bình', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(861, 'Vĩnh Hựu', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(862, 'Vĩnh Kim', 1, NULL, NULL, 10, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(863, 'Al Bá', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(864, 'An Bình', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(865, 'Ân Hảo', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(866, 'An Hòa', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(867, 'An Khê', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(868, 'An Lão', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(869, 'An Lương', 1, NULL, NULL, 11, '2026-03-02 16:22:48', '2026-03-02 16:22:48'),
(870, 'An Nhơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(871, 'An Nhơn Bắc', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(872, 'An Nhơn Đông', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(873, 'An Nhơn Nam', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(874, 'An Nhơn Tây', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(875, 'An Phú', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(876, 'An Toàn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(877, 'Ân Tường', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(878, 'An Vinh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(879, 'Ayun', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(880, 'Ayun Pa', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(881, 'Bàu Cạn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(882, 'Biển Hồ', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(883, 'Bình An', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(884, 'Bình Định', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(885, 'Bình Dương', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(886, 'Bình Hiệp', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(887, 'Bình Khê', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(888, 'Bình Phú', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(889, 'Bờ Ngoong', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(890, 'Bồng Sơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(891, 'Canh Liên', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(892, 'Canh Vinh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(893, 'Cát Tiến', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(894, 'Chơ Long', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(895, 'Chư A Thai', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(896, 'Chư Krey', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(897, 'Chư Păh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(898, 'Chư Prông', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(899, 'Chư Pưh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(900, 'Chư Sê', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(901, 'Cửu An', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(902, 'Đak Đoa', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(903, 'Đak Pơ', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(904, 'Đak Rong', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(905, 'Đak Sơmei', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(906, 'Đăk Song', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(907, 'Đề Gi', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(908, 'Diên Hồng', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(909, 'Đức Cơ', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(910, 'Gào', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(911, 'Hòa Hội', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(912, 'Hoài Ân', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(913, 'Hoài Nhơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(914, 'Hoài Nhơn Bắc', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(915, 'Hoài Nhơn Đông', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(916, 'Hoài Nhơn Nam', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(917, 'Hoài Nhơn Tây', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(918, 'Hội Phú', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(919, 'Hội Sơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(920, 'Hra', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(921, 'Ia Băng', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(922, 'Ia Boòng', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(923, 'Ia Chia', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(924, 'Ia Dơk', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(925, 'Ia Dom', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(926, 'Ia Dreh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(927, 'Ia Grai', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(928, 'Ia Hiao', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(929, 'Ia Hrú', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(930, 'Ia Hrung', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(931, 'Ia Khươl', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(932, 'Ia Ko', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(933, 'Ia Krái', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(934, 'Ia Krêl', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(935, 'Ia Lâu', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(936, 'Ia Le', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(937, 'Ia Ly', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(938, 'Ia Mơ', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(939, 'Ia Nan', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(940, 'Ia O', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(941, 'Ia Pa', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(942, 'Ia Phí', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(943, 'Ia Pia', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(944, 'Ia Pnôn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(945, 'Ia Púch', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(946, 'Ia Rbol', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(947, 'Ia Rsai', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(948, 'Ia Sao', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(949, 'Ia Tôr', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(950, 'Ia Tul', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(951, 'Kbang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(952, 'Kdang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(953, 'Kim Sơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(954, 'Kon Chiêng', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(955, 'Kon Gang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(956, 'Kông Bơ La', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(957, 'Kông Chro', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(958, 'Krong', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(959, 'Lơ Pang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(960, 'Mang Yang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(961, 'Ngô Mây', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(962, 'Nhơn Châu', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(963, 'Phù Cát', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(964, 'Phù Mỹ', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(965, 'Phù Mỹ Bắc', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(966, 'Phù Mỹ Đông', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(967, 'Phù Mỹ Nam', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(968, 'Phù Mỹ Tây', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(969, 'Phú Thiện', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(970, 'Phú Túc', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(971, 'Pleiku', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(972, 'Pờ Tó', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(973, 'Quy Nhơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(974, 'Quy Nhơn Bắc', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(975, 'Quy Nhơn Đông', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(976, 'Quy Nhơn Nam', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(977, 'Quy Nhơn Tây', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(978, 'Sơn Lang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(979, 'Sró', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(980, 'Tam Quan', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(981, 'Tây Sơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(982, 'Thống Nhất', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(983, 'Tơ Tung', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(984, 'Tuy Phước', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(985, 'Tuy Phước Bắc', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(986, 'Tuy Phước Đông', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(987, 'Tuy Phước Tây', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(988, 'Uar', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(989, 'Vân Canh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(990, 'Vạn Đức', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(991, 'Vĩnh Quang', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(992, 'Vĩnh Sơn', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(993, 'Vĩnh Thạnh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(994, 'Vĩnh Thịnh', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(995, 'Xuân An', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(996, 'Ya Hội', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(997, 'Ya Ma', 1, NULL, NULL, 11, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(998, 'Ái Quốc', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(999, 'An Biên', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1000, 'An Dương', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1001, 'An Hải', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1002, 'An Hưng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1003, 'An Khánh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1004, 'An Lão', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1005, 'An Phong', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1006, 'An Phú', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1007, 'An Quang', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1008, 'An Thành', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1009, 'An Trường', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1010, 'Bắc An Phụ', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1011, 'Bắc Thanh Miện', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1012, 'Bạch Đằng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1013, 'Bạch Long Vĩ', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1014, 'Bình Giang', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1015, 'Cẩm Giang', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1016, 'Cẩm Giàng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1017, 'Cát Hải', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1018, 'Chấn Hưng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1019, 'Chí Linh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1020, 'Chí Minh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1021, 'Chu Văn An', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1022, 'Đại Sơn', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1023, 'Đồ Sơn', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1024, 'Đông Hải', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1025, 'Đường An', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1026, 'Dương Kinh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1027, 'Gia Lộc', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1028, 'Gia Phúc', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1029, 'Gia Viên', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1030, 'Hà Bắc', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1031, 'Hà Đông', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1032, 'Hà Nam', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1033, 'Hà Tây', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1034, 'Hải An', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1035, 'Hải Dương', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1036, 'Hải Hưng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1037, 'Hòa Bình', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1038, 'Hồng An', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1039, 'Hồng Bàng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1040, 'Hồng Châu', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1041, 'Hợp Tiến', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1042, 'Hưng Đạo', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1043, 'Hùng Thắng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1044, 'Kẻ Sặt', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1045, 'Khúc Thừa Dụ', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1046, 'Kiến An', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1047, 'Kiến Hải', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1048, 'Kiến Hưng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1049, 'Kiến Minh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1050, 'Kiến Thụy', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1051, 'Kim Thành', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1052, 'Kinh Môn', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1053, 'Lạc Phượng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1054, 'Lai Khê', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1055, 'Lê Chân', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1056, 'Lê Đại Hành', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1057, 'Lê Ích Mộc', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1058, 'Lê Thanh Nghị', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1059, 'Lưu Kiếm', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1060, 'Mao Điền', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1061, 'Nam An Phụ', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1062, 'Nam Đồ Sơn', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1063, 'Nam Đồng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1064, 'Nam Sách', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1065, 'Nam Thanh Miện', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1066, 'Nam Triệu', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1067, 'Nghi Dương', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1068, 'Ngô Quyền', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1069, 'Nguyễn Bỉnh Khiêm', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1070, 'Nguyễn Đại Năng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1071, 'Nguyên Giáp', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1072, 'Nguyễn Lương Bằng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1073, 'Nguyễn Trãi', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1074, 'Nhị Chiểu', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1075, 'Ninh Giang', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1076, 'Phạm Sư Mạnh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1077, 'Phù Liễn', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1078, 'Phú Thái', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1079, 'Quyết Thắng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1080, 'Tân An', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1081, 'Tân Hưng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1082, 'Tân Kỳ', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1083, 'Tân Minh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1084, 'Thạch Khôi', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1085, 'Thái Tân', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1086, 'Thành Đông', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1087, 'Thanh Hà', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1088, 'Thanh Miện', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1089, 'Thiên Hương', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1090, 'Thượng Hồng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1091, 'Thủy Nguyên', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1092, 'Tiên Lãng', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1093, 'Tiên Minh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1094, 'Trần Hưng Đạo', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1095, 'Trần Liễu', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1096, 'Trần Nhân Tông', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1097, 'Trần Phú', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1098, 'Trường Tân', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1099, 'Tứ Kỳ', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1100, 'Tứ Minh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1101, 'Tuệ Tĩnh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1102, 'Việt Hòa', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1103, 'Việt Khê', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1104, 'Vĩnh Am', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1105, 'Vĩnh Bảo', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1106, 'Vĩnh Hải', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1107, 'Vĩnh Hòa', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1108, 'Vĩnh Lại', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1109, 'Vĩnh Thịnh', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1110, 'Vĩnh Thuận', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1111, 'Yết Kiêu', 1, NULL, NULL, 12, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1112, 'An Khánh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1113, 'Ba Đình', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1114, 'Ba Vì', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1115, 'Bạch Mai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1116, 'Bất Bạt', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1117, 'Bát Tràng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1118, 'Bình Minh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1119, 'Bồ Đề', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1120, 'Cầu Giấy', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1121, 'Chương Dương', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1122, 'Chương Mỹ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1123, 'Chuyên Mỹ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1124, 'Cổ Đô', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1125, 'Cửa Nam', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1126, 'Đa Phúc', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1127, 'Đại Mỗ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1128, 'Đại Thanh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1129, 'Đại Xuyên', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1130, 'Dân Hòa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1131, 'Đan Phượng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1132, 'Định Công', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1133, 'Đoài Phương', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1134, 'Đông Anh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1135, 'Đống Đa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1136, 'Đông Ngạc', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1137, 'Dương Hòa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1138, 'Dương Nội', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1139, 'Gia Lâm', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1140, 'Giảng Võ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1141, 'Hạ Bằng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1142, 'Hà Đông', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1143, 'Hai Bà Trưng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1144, 'Hát Môn', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1145, 'Hòa Lạc', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1146, 'Hòa Phú', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1147, 'Hòa Xá', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1148, 'Hoài Đức', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1149, 'Hoàn Kiếm', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1150, 'Hoàng Liệt', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1151, 'Hoàng Mai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1152, 'Hồng Hà', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1153, 'Hồng Sơn', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1154, 'Hồng Vân', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1155, 'Hưng Đạo', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1156, 'Hương Sơn', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1157, 'Khương Đình', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1158, 'Kiến Hưng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1159, 'Kiều Phú', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1160, 'Kim Anh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1161, 'Kim Liên', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1162, 'Láng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1163, 'Liên Minh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1164, 'Lĩnh Nam', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1165, 'Long Biên', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1166, 'Mê Linh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1167, 'Minh Châu', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1168, 'Mỹ Đức', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1169, 'Nam Phù', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1170, 'Nghĩa Đô', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1171, 'Ngọc Hà', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1172, 'Ngọc Hồi', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1173, 'Nội Bài', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1174, 'Ô Chợ Dừa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1175, 'Ô Diên', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1176, 'Phú Cát', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1177, 'Phú Diễn', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1178, 'Phù Đổng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1179, 'Phú Lương', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1180, 'Phú Nghĩa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1181, 'Phú Thượng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1182, 'Phú Xuyên', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1183, 'Phúc Lộc', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1184, 'Phúc Lợi', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1185, 'Phúc Sơn', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1186, 'Phúc Thịnh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1187, 'Phúc Thọ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1188, 'Phượng Dực', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1189, 'Phương Liệt', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1190, 'Quảng Bị', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1191, 'Quang Minh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1192, 'Quảng Oai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1193, 'Quốc Oai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1194, 'Sóc Sơn', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1195, 'Sơn Đồng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1196, 'Sơn Tây', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1197, 'Suối Hai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1198, 'Tam Hưng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1199, 'Tây Hồ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1200, 'Tây Mỗ', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1201, 'Tây Phương', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1202, 'Tây Tựu', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1203, 'Thạch Thất', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1204, 'Thanh Liệt', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1205, 'Thanh Oai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1206, 'Thanh Trì', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1207, 'Thanh Xuân', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1208, 'Thiên Lộc', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1209, 'Thư Lâm', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1210, 'Thuận An', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1211, 'Thượng Cát', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1212, 'Thượng Phúc', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1213, 'Thường Tín', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1214, 'Tiến Thắng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1215, 'Trần Phú', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1216, 'Trung Giã', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1217, 'Từ Liêm', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1218, 'Tùng Thiện', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49');
INSERT INTO `wards` (`id`, `name`, `status`, `gso_id`, `district_id`, `province_id`, `created_at`, `updated_at`) VALUES
(1219, 'Tương Mai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1220, 'Ứng Hòa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1221, 'Ứng Thiên', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1222, 'Vân Đình', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1223, 'Văn Miếu - Quốc Tử Giám', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1224, 'Vật Lại', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1225, 'Việt Hưng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1226, 'Vĩnh Hưng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1227, 'Vĩnh Thanh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1228, 'Vĩnh Tuy', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1229, 'Xuân Đỉnh', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1230, 'Xuân Mai', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1231, 'Xuân Phương', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1232, 'Yên Bài', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1233, 'Yên Hòa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1234, 'Yên Lãng', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1235, 'Yên Nghĩa', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1236, 'Yên Sở', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1237, 'Yên Xuân', 1, NULL, NULL, 13, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1238, 'Bắc Hồng Lĩnh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1239, 'Cẩm Bình', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1240, 'Cẩm Duệ', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1241, 'Cẩm Hưng', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1242, 'Cẩm Lạc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1243, 'Cẩm Trung', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1244, 'Cẩm Xuyên', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1245, 'Can Lộc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1246, 'Cổ Đạm', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1247, 'Đan Hải', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1248, 'Đông Kinh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1249, 'Đồng Lộc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1250, 'Đồng Tiến', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1251, 'Đức Đồng', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1252, 'Đức Minh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1253, 'Đức Quang', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1254, 'Đức Thịnh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1255, 'Đức Thọ', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1256, 'Gia Hanh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1257, 'Hà Huy Tập', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1258, 'Hà Linh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1259, 'Hải Ninh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1260, 'Hoành Sơn', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1261, 'Hồng Lộc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1262, 'Hương Bình', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1263, 'Hương Đô', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1264, 'Hương Khê', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1265, 'Hương Phố', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1266, 'Hương Sơn', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1267, 'Hương Xuân', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1268, 'Kim Hoa', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1269, 'Kỳ Anh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1270, 'Kỳ Hoa', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1271, 'Kỳ Khang', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1272, 'Kỳ Lạc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1273, 'Kỳ Thượng', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1274, 'Kỳ Văn', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1275, 'Kỳ Xuân', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1276, 'Lộc Hà', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1277, 'Mai Hoa', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1278, 'Mai Phụ', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1279, 'Nam Hồng Lĩnh', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1280, 'Nghi Xuân', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1281, 'Phúc Trạch', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1282, 'Sơn Giang', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1283, 'Sơn Hồng', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1284, 'Sơn Kim 1', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1285, 'Sơn Kim 2', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1286, 'Sơn Tây', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1287, 'Sơn Tiến', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1288, 'Sông Trí', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1289, 'Thạch Hà', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1290, 'Thạch Khê', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1291, 'Thạch Lạc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1292, 'Thạch Xuân', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1293, 'Thành Sen', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1294, 'Thiên Cầm', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1295, 'Thượng Đức', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1296, 'Tiên Điền', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1297, 'Toàn Lưu', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1298, 'Trần Phú', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1299, 'Trường Lưu', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1300, 'Tứ Mỹ', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1301, 'Tùng Lộc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1302, 'Việt Xuyên', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1303, 'Vũ Quang', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1304, 'Vũng Áng', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1305, 'Xuân Lộc', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1306, 'Yên Hòa', 1, NULL, NULL, 14, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1307, 'A Lưới 1', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1308, 'A Lưới 2', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1309, 'A Lưới 3', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1310, 'A Lưới 4', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1311, 'A Lưới 5', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1312, 'An Cựu', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1313, 'Bình Điền', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1314, 'Chân Mây - Lăng Cô', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1315, 'Đan Điền', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1316, 'Dương Nỗ', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1317, 'Hóa Châu', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1318, 'Hưng Lộc', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1319, 'Hương An', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1320, 'Hương Thủy', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1321, 'Hương Trà', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1322, 'Khe Tre', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1323, 'Kim Long', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1324, 'Kim Trà', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1325, 'Lộc An', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1326, 'Long Quảng', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1327, 'Mỹ Thượng', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1328, 'Nam Đông', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1329, 'Phong Điền', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1330, 'Phong Dinh', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1331, 'Phong Phú', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1332, 'Phong Quảng', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1333, 'Phong Thái', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1334, 'Phú Bài', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1335, 'Phú Hồ', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1336, 'Phú Lộc', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1337, 'Phú Vang', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1338, 'Phú Vinh', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1339, 'Phú Xuân', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1340, 'Quảng Điền', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1341, 'Thanh Thủy', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1342, 'Thuận An', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1343, 'Thuận Hóa', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1344, 'Thủy Xuân', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1345, 'Vinh Lộc', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1346, 'Vỹ Dạ', 1, NULL, NULL, 15, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1347, 'A Sào', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1348, 'Ái Quốc', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1349, 'Ân Thi', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1350, 'Bắc Đông Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1351, 'Bắc Đông Quan', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1352, 'Bắc Thái Ninh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1353, 'Bắc Thụy Anh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1354, 'Bắc Tiên Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1355, 'Bình Định', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1356, 'Bình Nguyên', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1357, 'Bình Thanh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1358, 'Châu Ninh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1359, 'Chí Minh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1360, 'Đại Đồng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1361, 'Diên Hà', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1362, 'Đoàn Đào', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1363, 'Đồng Bằng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1364, 'Đồng Châu', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1365, 'Đông Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1366, 'Đông Quan', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1367, 'Đông Thái Ninh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1368, 'Đông Thụy Anh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1369, 'Đông Tiền Hải', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1370, 'Đông Tiên Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1371, 'Đức Hợp', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1372, 'Đường Hào', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1373, 'Hiệp Cường', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1374, 'Hoàn Long', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1375, 'Hoàng Hoa Thám', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1376, 'Hồng Châu', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1377, 'Hồng Minh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1378, 'Hồng Quang', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1379, 'Hồng Vũ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1380, 'Hưng Hà', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1381, 'Hưng Phú', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1382, 'Khoái Châu', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1383, 'Kiến Xương', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1384, 'Lạc Đạo', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1385, 'Lê Lợi', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1386, 'Lê Quý Đôn', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1387, 'Long Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1388, 'Lương Bằng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1389, 'Mễ Sở', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1390, 'Minh Thọ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1391, 'Mỹ Hào', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1392, 'Nam Cường', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1393, 'Nam Đông Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1394, 'Nam Thái Ninh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1395, 'Nam Thụy Anh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1396, 'Nam Tiền Hải', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1397, 'Nam Tiên Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1398, 'Nghĩa Dân', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1399, 'Nghĩa Trụ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1400, 'Ngọc Lâm', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1401, 'Ngự Thiên', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1402, 'Nguyễn Du', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1403, 'Nguyễn Trãi', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1404, 'Nguyễn Văn Linh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1405, 'Như Quỳnh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1406, 'Phạm Ngũ Lão', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1407, 'Phố Hiến', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1408, 'Phụ Dực', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1409, 'Phụng Công', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1410, 'Quang Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1411, 'Quang Lịch', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1412, 'Quỳnh An', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1413, 'Quỳnh Phụ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1414, 'Sơn Nam', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1415, 'Tân Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1416, 'Tân Thuận', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1417, 'Tân Tiến', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1418, 'Tây Thái Ninh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1419, 'Tây Thụy Anh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1420, 'Tây Tiền Hải', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1421, 'Thái Bình', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1422, 'Thái Ninh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1423, 'Thái Thụy', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1424, 'Thần Khê', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1425, 'Thư Trì', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1426, 'Thư Vũ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1427, 'Thượng Hồng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1428, 'Thụy Anh', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1429, 'Tiền Hải', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1430, 'Tiên Hoa', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1431, 'Tiên Hưng', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1432, 'Tiên La', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1433, 'Tiên Lữ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1434, 'Tiên Tiến', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1435, 'Tống Trân', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1436, 'Trà Giang', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1437, 'Trà Lý', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1438, 'Trần Hưng Đạo', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1439, 'Trần Lãm', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1440, 'Triệu Việt Vương', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1441, 'Văn Giang', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1442, 'Vạn Xuân', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1443, 'Việt Tiến', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1444, 'Việt Yên', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1445, 'Vũ Phúc', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1446, 'Vũ Quý', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1447, 'Vũ Thư', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1448, 'Vũ Tiên', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1449, 'Xuân Trúc', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1450, 'Yên Mỹ', 1, NULL, NULL, 16, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1451, 'Anh Dũng', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1452, 'Ba Ngòi', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1453, 'Bác Ái', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1454, 'Bác Ái Đông', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1455, 'Bác Ái Tây', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1456, 'Bắc Cam Ranh', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1457, 'Bắc Khánh Vĩnh', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1458, 'Bắc Nha Trang', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1459, 'Bắc Ninh Hòa', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1460, 'Bảo An', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1461, 'Cà Ná', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1462, 'Cam An', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1463, 'Cam Hiệp', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1464, 'Cam Lâm', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1465, 'Cam Linh', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1466, 'Cam Ranh', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1467, 'Công Hải', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1468, 'Đại Lãnh', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1469, 'Diên Điền', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1470, 'Diên Khánh', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1471, 'Diên Lạc', 1, NULL, NULL, 17, '2026-03-02 16:22:49', '2026-03-02 16:22:49'),
(1472, 'Diên Lâm', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1473, 'Diên Thọ', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1474, 'Đô Vinh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1475, 'Đông Hải', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1476, 'Đông Khánh Sơn', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1477, 'Đông Ninh Hòa', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1478, 'Hòa Thắng', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1479, 'Hòa Trí', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1480, 'Khánh Sơn', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1481, 'Khánh Vĩnh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1482, 'Lâm Sơn', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1483, 'Mỹ Sơn', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1484, 'Nam Cam Ranh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1485, 'Nam Khánh Vĩnh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1486, 'Nam Nha Trang', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1487, 'Nam Ninh Hòa', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1488, 'Nha Trang', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1489, 'Ninh Chử', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1490, 'Ninh Hải', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1491, 'Ninh Hòa', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1492, 'Ninh Phước', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1493, 'Ninh Sơn', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1494, 'Phan Rang', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1495, 'Phước Dinh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1496, 'Phước Hà', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1497, 'Phước Hậu', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1498, 'Phước Hữu', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1499, 'Suối Dầu', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1500, 'Suối Hiệp', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1501, 'Tân Định', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1502, 'Tây Khánh Sơn', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1503, 'Tây Khánh Vĩnh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1504, 'Tây Nha Trang', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1505, 'Tây Ninh Hòa', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1506, 'Thuận Bắc', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1507, 'Thuận Nam', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1508, 'Trung Khánh Vĩnh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1509, 'Trường Sa', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1510, 'Tu Bông', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1511, 'Vạn Hưng', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1512, 'Vạn Ninh', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1513, 'Vạn Thắng', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1514, 'Vĩnh Hải', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1515, 'Xuân Hải', 1, NULL, NULL, 17, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1516, 'Bản Bo', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1517, 'Bình Lư', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1518, 'Bum Nưa', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1519, 'Bum Tở', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1520, 'Dào San', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1521, 'Đoàn Kết', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1522, 'Hồng Thu', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1523, 'Hua Bum', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1524, 'Khoen On', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1525, 'Khổng Lào', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1526, 'Khun Há', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1527, 'Lê Lợi', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1528, 'Mù Cả', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1529, 'Mường Khoa', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1530, 'Mường Kim', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1531, 'Mường Mô', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1532, 'Mường Tè', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1533, 'Mường Than', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1534, 'Nậm Cuổi', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1535, 'Nậm Hàng', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1536, 'Nậm Mạ', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1537, 'Nậm Sỏ', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1538, 'Nậm Tăm', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1539, 'Pa Tần', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1540, 'Pa Ủ', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1541, 'Pắc Ta', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1542, 'Phong Thổ', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1543, 'Pu Sam Cáp', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1544, 'Sì Lở Lầu', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1545, 'Sìn Hồ', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1546, 'Sin Suối Hồ', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1547, 'Tả Lèng', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1548, 'Tà Tổng', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1549, 'Tân Phong', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1550, 'Tân Uyên', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1551, 'Than Uyên', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1552, 'Thu Lũm', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1553, 'Tủa Sín Chải', 1, NULL, NULL, 18, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1554, '1 Bảo Lộc', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1555, '2 Bảo Lộc', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1556, '3 Bảo Lộc', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1557, 'B’lao', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1558, 'Bắc Bình', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1559, 'Bắc Gia Nghĩa', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1560, 'Bắc Ruộng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1561, 'Bảo Lâm 1', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1562, 'Bảo Lâm 2', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1563, 'Bảo Lâm 3', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1564, 'Bảo Lâm 4', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1565, 'Bảo Lâm 5', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1566, 'Bảo Thuận', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1567, 'Bình Thuận', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1568, 'Cam Ly - Đà Lạt', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1569, 'Cát Tiên', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1570, 'Cát Tiên 2', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1571, 'Cát Tiên 3', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1572, 'Cư Jút', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1573, 'D’ran', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1574, 'Đạ Huoai', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1575, 'Đạ Huoai 2', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1576, 'Đạ Huoai 3', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1577, 'Đạ Tẻh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1578, 'Đạ Tẻh 2', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1579, 'Đạ Tẻh 3', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1580, 'Đắk Mil', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1581, 'Đắk Sắk', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1582, 'Đắk Song', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1583, 'Đắk Wil', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1584, 'Đam Rông 1', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1585, 'Đam Rông 2', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1586, 'Đam Rông 3', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1587, 'Đam Rông 4', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1588, 'Di Linh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1589, 'Đinh Trang Thượng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1590, 'Đinh Văn Lâm Hà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1591, 'Đơn Dương', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1592, 'Đông Gia Nghĩa', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1593, 'Đông Giang', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1594, 'Đồng Kho', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1595, 'Đức An', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1596, 'Đức Lập', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1597, 'Đức Linh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1598, 'Đức Trọng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1599, 'Gia Hiệp', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1600, 'Hải Ninh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1601, 'Hàm Kiệm', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1602, 'Hàm Liêm', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1603, 'Hàm Tân', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1604, 'Hàm Thắng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1605, 'Hàm Thạnh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1606, 'Hàm Thuận', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1607, 'Hàm Thuận Bắc', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1608, 'Hàm Thuận Nam', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1609, 'Hiệp Thạnh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1610, 'Hòa Bắc', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1611, 'Hòa Ninh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1612, 'Hòa Thắng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1613, 'Hoài Đức', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1614, 'Hồng Sơn', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1615, 'Hồng Thái', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1616, 'Ka Đô', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1617, 'Kiến Đức', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1618, 'Krông Nô', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1619, 'La Dạ', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1620, 'La Gi', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1621, 'Lạc Dương', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1622, 'Lâm Viên - Đà Lạt', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1623, 'Lang Biang - Đà Lạt', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1624, 'Liên Hương', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1625, 'Lương Sơn', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1626, 'Mũi Né', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1627, 'Nam Ban Lâm Hà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1628, 'Nam Đà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1629, 'Nam Dong', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1630, 'Nam Gia Nghĩa', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1631, 'Nam Hà Lâm Hà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1632, 'Nâm Nung', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1633, 'Nam Thành', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1634, 'Nghị Đức', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1635, 'Nhân Cơ', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1636, 'Ninh Gia', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1637, 'Phan Rí Cửa', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1638, 'Phan Sơn', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1639, 'Phan Thiết', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1640, 'Phú Quý', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1641, 'Phú Sơn Lâm Hà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1642, 'Phú Thủy', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1643, 'Phúc Thọ Lâm Hà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1644, 'Phước Hội', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1645, 'Quảng Hòa', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1646, 'Quảng Khê', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1647, 'Quảng Lập', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1648, 'Quảng Phú', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1649, 'Quảng Sơn', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1650, 'Quảng Tân', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1651, 'Quảng Tín', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1652, 'Quảng Trực', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1653, 'Sơn Điền', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1654, 'Sơn Mỹ', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1655, 'Sông Lũy', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1656, 'Suối Kiết', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1657, 'Tà Đùng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1658, 'Tà Hine', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1659, 'Tà Năng', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1660, 'Tân Hà Lâm Hà', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1661, 'Tân Hải', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1662, 'Tân Hội', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1663, 'Tân Lập', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1664, 'Tân Minh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1665, 'Tân Thành', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1666, 'Tánh Linh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1667, 'Thuận An', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1668, 'Thuận Hạnh', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1669, 'Tiến Thành', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1670, 'Trà Tân', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1671, 'Trường Xuân', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1672, 'Tuy Đức', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1673, 'Tuy Phong', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1674, 'Tuyên Quang', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1675, 'Vĩnh Hảo', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1676, 'Xuân Hương - Đà Lạt', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1677, 'Xuân Trường - Đà Lạt', 1, NULL, NULL, 19, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1678, 'Ba Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1679, 'Bắc Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1680, 'Bằng Mạc', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1681, 'Bình Gia', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1682, 'Cai Kinh', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1683, 'Cao Lộc', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1684, 'Châu Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1685, 'Chi Lăng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1686, 'Chiến Thắng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1687, 'Công Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1688, 'Điềm He', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1689, 'Đình Lập', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1690, 'Đoàn Kết', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1691, 'Đồng Đăng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1692, 'Đông Kinh', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1693, 'Hoa Thám', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1694, 'Hoàng Văn Thụ', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1695, 'Hội Hoan', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1696, 'Hồng Phong', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1697, 'Hưng Vũ', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1698, 'Hữu Liên', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1699, 'Hữu Lũng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1700, 'Kháng Chiến', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1701, 'Khánh Khê', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1702, 'Khuất Xá', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1703, 'Kiên Mộc', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1704, 'Kỳ Lừa', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1705, 'Lộc Bình', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1706, 'Lợi Bác', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1707, 'Lương Văn Tri', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1708, 'Mẫu Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1709, 'Na Dương', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1710, 'Na Sầm', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1711, 'Nhân Lý', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1712, 'Nhất Hòa', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1713, 'Quan Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1714, 'Quốc Khánh', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1715, 'Quốc Việt', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1716, 'Quý Hòa', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1717, 'Tam Thanh', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1718, 'Tân Đoàn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1719, 'Tân Thành', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1720, 'Tân Tiến', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1721, 'Tân Tri', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1722, 'Tân Văn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1723, 'Thái Bình', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1724, 'Thất Khê', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1725, 'Thiện Hòa', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1726, 'Thiện Long', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1727, 'Thiện Tân', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1728, 'Thiện Thuật', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1729, 'Thống Nhất', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1730, 'Thụy Hùng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1731, 'Tràng Định', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1732, 'Tri Lễ', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1733, 'Tuấn Sơn', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1734, 'Văn Lãng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1735, 'Vạn Linh', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1736, 'Vân Nham', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1737, 'Văn Quan', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1738, 'Vũ Lăng', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1739, 'Vũ Lễ', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1740, 'Xuân Dương', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1741, 'Yên Bình', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1742, 'Yên Phúc', 1, NULL, NULL, 20, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1743, 'A Mú Sung', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1744, 'Âu Lâu', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1745, 'Bắc Hà', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1746, 'Bản Hồ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1747, 'Bản Lầu', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1748, 'Bản Liền', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1749, 'Bản Xèo', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1750, 'Bảo Ái', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1751, 'Bảo Hà', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1752, 'Bảo Nhai', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1753, 'Bảo Thắng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1754, 'Bảo Yên', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1755, 'Bát Xát', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1756, 'Cam Đường', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1757, 'Cảm Nhân', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1758, 'Cao Sơn', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1759, 'Cát Thịnh', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1760, 'Cầu Thia', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1761, 'Chấn Thịnh', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1762, 'Châu Quế', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1763, 'Chế Tạo', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1764, 'Chiềng Ken', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1765, 'Cốc Lầu', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1766, 'Cốc San', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1767, 'Dền Sáng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1768, 'Đông Cuông', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1769, 'Dương Quỳ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1770, 'Gia Hội', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1771, 'Gia Phú', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1772, 'Hạnh Phúc', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1773, 'Hợp Thành', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1774, 'Hưng Khánh', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1775, 'Khánh Hòa', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1776, 'Khánh Yên', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1777, 'Khao Mang', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1778, 'Lâm Giang', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1779, 'Lâm Thượng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1780, 'Lào Cai', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1781, 'Lao Chải', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1782, 'Liên Sơn', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1783, 'Lục Yên', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1784, 'Lùng Phình', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1785, 'Lương Thịnh', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1786, 'Mậu A', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1787, 'Minh Lương', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1788, 'Mỏ Vàng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1789, 'Mù Cang Chải', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1790, 'Mường Bo', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1791, 'Mường Hum', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1792, 'Mường Khương', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1793, 'Mường Lai', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1794, 'Nậm Chày', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1795, 'Nậm Có', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1796, 'Nam Cường', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1797, 'Nậm Xé', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1798, 'Nghĩa Đô', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1799, 'Nghĩa Lộ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1800, 'Nghĩa Tâm', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1801, 'Ngũ Chỉ Sơn', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1802, 'Pha Long', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1803, 'Phình Hồ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1804, 'Phong Dụ Hạ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1805, 'Phong Dụ Thượng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1806, 'Phong Hải', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1807, 'Phúc Khánh', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1808, 'Phúc Lợi', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1809, 'Púng Luông', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1810, 'Quy Mông', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1811, 'Sa Pa', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1812, 'Si Ma Cai', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1813, 'Sín Chéng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50');
INSERT INTO `wards` (`id`, `name`, `status`, `gso_id`, `district_id`, `province_id`, `created_at`, `updated_at`) VALUES
(1814, 'Sơn Lương', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1815, 'Tả Củ Tỷ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1816, 'Tả Phìn', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1817, 'Tả Van', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1818, 'Tà Xi Láng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1819, 'Tân Hợp', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1820, 'Tân Lĩnh', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1821, 'Tằng Loỏng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1822, 'Thác Bà', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1823, 'Thượng Bằng La', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1824, 'Thượng Hà', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1825, 'Trạm Tấu', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1826, 'Trấn Yên', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1827, 'Trịnh Tường', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1828, 'Trung Tâm', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1829, 'Tú Lệ', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1830, 'Văn Bàn', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1831, 'Văn Chấn', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1832, 'Văn Phú', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1833, 'Việt Hồng', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1834, 'Võ Lao', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1835, 'Xuân Ái', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1836, 'Xuân Hòa', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1837, 'Xuân Quang', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1838, 'Y Tý', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1839, 'Yên Bái', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1840, 'Yên Bình', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1841, 'Yên Thành', 1, NULL, NULL, 21, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1842, 'An Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1843, 'Anh Sơn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1844, 'Anh Sơn Đông', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1845, 'Bắc Lý', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1846, 'Bạch Hà', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1847, 'Bạch Ngọc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1848, 'Bích Hào', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1849, 'Bình Chuẩn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1850, 'Bình Minh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1851, 'Cam Phục', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1852, 'Cát Ngạn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1853, 'Châu Bình', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1854, 'Châu Hồng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1855, 'Châu Khê', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1856, 'Châu Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1857, 'Châu Tiến', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1858, 'Chiêu Lưu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1859, 'Con Cuông', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1860, 'Cửa Lò', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1861, 'Đại Đồng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1862, 'Đại Huệ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1863, 'Diễn Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1864, 'Đô Lương', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1865, 'Đông Hiếu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1866, 'Đông Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1867, 'Đông Thành', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1868, 'Đức Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1869, 'Giai Lạc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1870, 'Giai Xuân', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1871, 'Hải Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1872, 'Hải Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1873, 'Hạnh Lâm', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1874, 'Hoa Quân', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1875, 'Hoàng Mai', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1876, 'Hợp Minh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1877, 'Hùng Chân', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1878, 'Hùng Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1879, 'Hưng Nguyên', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1880, 'Hưng Nguyên Nam', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1881, 'Huồi Tụ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1882, 'Hữu Khuông', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1883, 'Hữu Kiệm', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1884, 'Keng Đu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1885, 'Kim Bảng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1886, 'Kim Liên', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1887, 'Lam Thành', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1888, 'Lượng Minh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1889, 'Lương Sơn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1890, 'Mậu Thạch', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1891, 'Minh Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1892, 'Minh Hợp', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1893, 'Môn Sơn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1894, 'Mường Chọng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1895, 'Mường Ham', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1896, 'Mường Lống', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1897, 'Mường Quàng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1898, 'Mường Típ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1899, 'Mường Xén', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1900, 'Mỹ Lý', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1901, 'Na Loi', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1902, 'Na Ngoi', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1903, 'Nậm Cắn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1904, 'Nam Đàn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1905, 'Nga My', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1906, 'Nghi Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1907, 'Nghĩa Đàn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1908, 'Nghĩa Đồng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1909, 'Nghĩa Hành', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1910, 'Nghĩa Hưng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1911, 'Nghĩa Khánh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1912, 'Nghĩa Lâm', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1913, 'Nghĩa Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1914, 'Nghĩa Mai', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1915, 'Nghĩa Thọ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1916, 'Nhân Hòa', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1917, 'Nhôn Mai', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1918, 'Phúc Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1919, 'Quan Thành', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1920, 'Quảng Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1921, 'Quang Đồng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1922, 'Quế Phong', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1923, 'Quỳ Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1924, 'Quỳ Hợp', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1925, 'Quỳnh Anh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1926, 'Quỳnh Lưu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1927, 'Quỳnh Mai', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1928, 'Quỳnh Phú', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1929, 'Quỳnh Sơn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1930, 'Quỳnh Tam', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1931, 'Quỳnh Thắng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1932, 'Quỳnh Văn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1933, 'Sơn Lâm', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1934, 'Tam Đồng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1935, 'Tam Hợp', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1936, 'Tam Quang', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1937, 'Tam Thái', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1938, 'Tân An', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1939, 'Tân Châu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1940, 'Tân Kỳ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1941, 'Tân Mai', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1942, 'Tân Phú', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1943, 'Tây Hiếu', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1944, 'Thái Hòa', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1945, 'Thần Lĩnh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1946, 'Thành Bình Thọ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1947, 'Thành Vinh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1948, 'Thiên Nhẫn', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1949, 'Thông Thụ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1950, 'Thuần Trung', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1951, 'Tiên Đồng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1952, 'Tiền Phong', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1953, 'Tri Lễ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1954, 'Trung Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1955, 'Trường Vinh', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1956, 'Tương Dương', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1957, 'Vạn An', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1958, 'Vân Du', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1959, 'Văn Hiến', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1960, 'Văn Kiều', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1961, 'Vân Tụ', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1962, 'Vinh Hưng', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1963, 'Vinh Lộc', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1964, 'Vinh Phú', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1965, 'Vĩnh Tường', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1966, 'Xuân Lâm', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1967, 'Yên Hòa', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1968, 'Yên Na', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1969, 'Yên Thành', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1970, 'Yên Trung', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1971, 'Yên Xuân', 1, NULL, NULL, 22, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1972, 'Bắc Lý', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1973, 'Bình An', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1974, 'Bình Giang', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1975, 'Bình Lục', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1976, 'Bình Minh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1977, 'Bình Mỹ', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1978, 'Bình Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1979, 'Cát Thành', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1980, 'Chất Bình', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1981, 'Châu Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1982, 'Cổ Lễ', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1983, 'Cúc Phương', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1984, 'Đại Hoàng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1985, 'Định Hóa', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1986, 'Đông A', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1987, 'Đông Hoa Lư', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1988, 'Đồng Thái', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1989, 'Đồng Thịnh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1990, 'Đồng Văn', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1991, 'Duy Hà', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1992, 'Duy Tân', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1993, 'Duy Tiên', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1994, 'Gia Hưng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1995, 'Gia Lâm', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1996, 'Gia Phong', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1997, 'Gia Trấn', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1998, 'Gia Tường', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(1999, 'Gia Vân', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2000, 'Gia Viễn', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2001, 'Giao Bình', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2002, 'Giao Hòa', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2003, 'Giao Hưng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2004, 'Giao Minh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2005, 'Giao Ninh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2006, 'Giao Phúc', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2007, 'Giao Thủy', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2008, 'Hà Nam', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2009, 'Hải An', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2010, 'Hải Anh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2011, 'Hải Hậu', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2012, 'Hải Hưng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2013, 'Hải Quang', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2014, 'Hải Thịnh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2015, 'Hải Tiến', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2016, 'Hải Xuân', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2017, 'Hiển Khánh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2018, 'Hoa Lư', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2019, 'Hồng Phong', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2020, 'Hồng Quang', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2021, 'Khánh Hội', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2022, 'Khánh Nhạc', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2023, 'Khánh Thiện', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2024, 'Khánh Trung', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2025, 'Kim Bảng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2026, 'Kim Đông', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2027, 'Kim Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2028, 'Kim Thanh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2029, 'Lai Thành', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2030, 'Lê Hồ', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2031, 'Liêm Hà', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2032, 'Liêm Tuyền', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2033, 'Liên Minh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2034, 'Lý Nhân', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2035, 'Lý Thường Kiệt', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2036, 'Minh Tân', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2037, 'Minh Thái', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2038, 'Mỹ Lộc', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2039, 'Nam Định', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2040, 'Nam Đồng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2041, 'Nam Hoa Lư', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2042, 'Nam Hồng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2043, 'Nam Lý', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2044, 'Nam Minh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2045, 'Nam Ninh', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2046, 'Nam Trực', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2047, 'Nam Xang', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2048, 'Nghĩa Hưng', 1, NULL, NULL, 23, '2026-03-02 16:22:50', '2026-03-02 16:22:50'),
(2049, 'Nghĩa Lâm', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2050, 'Nghĩa Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2051, 'Nguyễn Úy', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2052, 'Nhân Hà', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2053, 'Nho Quan', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2054, 'Ninh Cường', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2055, 'Ninh Giang', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2056, 'Phát Diệm', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2057, 'Phong Doanh', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2058, 'Phú Long', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2059, 'Phủ Lý', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2060, 'Phú Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2061, 'Phù Vân', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2062, 'Quang Hưng', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2063, 'Quang Thiện', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2064, 'Quỹ Nhất', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2065, 'Quỳnh Lưu', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2066, 'Rạng Đông', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2067, 'Tam Chúc', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2068, 'Tam Điệp', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2069, 'Tân Minh', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2070, 'Tân Thanh', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2071, 'Tây Hoa Lư', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2072, 'Thanh Bình', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2073, 'Thanh Lâm', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2074, 'Thanh Liêm', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2075, 'Thành Nam', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2076, 'Thanh Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2077, 'Thiên Trường', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2078, 'Tiên Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2079, 'Trần Thương', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2080, 'Trực Ninh', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2081, 'Trung Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2082, 'Trường Thi', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2083, 'Vạn Thắng', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2084, 'Vị Khê', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2085, 'Vĩnh Trụ', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2086, 'Vụ Bản', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2087, 'Vũ Dương', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2088, 'Xuân Giang', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2089, 'Xuân Hồng', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2090, 'Xuân Hưng', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2091, 'Xuân Trường', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2092, 'Ý Yên', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2093, 'Yên Cường', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2094, 'Yên Đồng', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2095, 'Yên Khánh', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2096, 'Yên Mạc', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2097, 'Yên Mô', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2098, 'Yên Sơn', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2099, 'Yên Thắng', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2100, 'Yên Từ', 1, NULL, NULL, 23, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2101, 'An Bình', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2102, 'An Nghĩa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2103, 'Âu Cơ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2104, 'Bản Nguyên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2105, 'Bằng Luân', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2106, 'Bao La', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2107, 'Bình Nguyên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2108, 'Bình Phú', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2109, 'Bình Tuyền', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2110, 'Bình Xuyên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2111, 'Cẩm Khê', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2112, 'Cao Dương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2113, 'Cao Phong', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2114, 'Cao Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2115, 'Chân Mộng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2116, 'Chí Đám', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2117, 'Chí Tiên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2118, 'Cự Đồng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2119, 'Đà Bắc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2120, 'Đại Đình', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2121, 'Đại Đồng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2122, 'Dân Chủ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2123, 'Đan Thượng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2124, 'Đạo Trù', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2125, 'Đào Xá', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2126, 'Đoan Hùng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2127, 'Đồng Lương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2128, 'Đông Thành', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2129, 'Đức Nhàn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2130, 'Dũng Tiến', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2131, 'Hạ Hòa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2132, 'Hải Lựu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2133, 'Hiền Lương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2134, 'Hiền Quan', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2135, 'Hòa Bình', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2136, 'Hoàng An', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2137, 'Hoàng Cương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2138, 'Hội Thịnh', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2139, 'Hợp Kim', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2140, 'Hợp Lý', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2141, 'Hùng Việt', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2142, 'Hương Cần', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2143, 'Hy Cương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2144, 'Khả Cửu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2145, 'Kim Bôi', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2146, 'Kỳ Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2147, 'Lạc Lương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2148, 'Lạc Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2149, 'Lạc Thủy', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2150, 'Lai Đồng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2151, 'Lâm Thao', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2152, 'Lập Thạch', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2153, 'Liên Châu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2154, 'Liên Hòa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2155, 'Liên Minh', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2156, 'Liên Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2157, 'Long Cốc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2158, 'Lương Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2159, 'Mai Châu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2160, 'Mai Hạ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2161, 'Minh Đài', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2162, 'Minh Hòa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2163, 'Mường Bi', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2164, 'Mường Động', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2165, 'Mường Hoa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2166, 'Mường Thàng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2167, 'Mường Vang', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2168, 'Nật Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2169, 'Ngọc Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2170, 'Nguyệt Đức', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2171, 'Nhân Nghĩa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2172, 'Nông Trang', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2173, 'Pà Cò', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2174, 'Phong Châu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2175, 'Phú Khê', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2176, 'Phú Mỹ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2177, 'Phù Ninh', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2178, 'Phú Thọ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2179, 'Phúc Yên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2180, 'Phùng Nguyên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2181, 'Quảng Yên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2182, 'Quy Đức', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2183, 'Quyết Thắng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2184, 'Sơn Đông', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2185, 'Sơn Lương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2186, 'Sông Lô', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2187, 'Tam Đảo', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2188, 'Tam Dương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2189, 'Tam Dương Bắc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2190, 'Tam Hồng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2191, 'Tam Nông', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2192, 'Tam Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2193, 'Tân Hòa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2194, 'Tân Lạc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2195, 'Tân Mai', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2196, 'Tân Pheo', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2197, 'Tân Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2198, 'Tây Cốc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2199, 'Tề Lỗ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2200, 'Thái Hòa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2201, 'Thanh Ba', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2202, 'Thanh Miếu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2203, 'Thanh Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2204, 'Thanh Thủy', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2205, 'Thịnh Minh', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2206, 'Thổ Tang', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2207, 'Thọ Văn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2208, 'Thống Nhất', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2209, 'Thu Cúc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2210, 'Thung Nai', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2211, 'Thượng Cốc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2212, 'Thượng Long', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2213, 'Tiên Lữ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2214, 'Tiên Lương', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2215, 'Tiền Phong', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2216, 'Toàn Thắng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2217, 'Trạm Thản', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2218, 'Trung Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2219, 'Tu Vũ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2220, 'Vân Bán', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2221, 'Văn Lang', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2222, 'Văn Miếu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2223, 'Vân Phú', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2224, 'Vân Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2225, 'Vạn Xuân', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2226, 'Việt Trì', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2227, 'Vĩnh An', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2228, 'Vĩnh Chân', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2229, 'Vĩnh Hưng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2230, 'Vĩnh Phú', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2231, 'Vĩnh Phúc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2232, 'Vĩnh Thành', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2233, 'Vĩnh Tường', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2234, 'Vĩnh Yên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2235, 'Võ Miếu', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2236, 'Xuân Đài', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2237, 'Xuân Hòa', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2238, 'Xuân Lãng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2239, 'Xuân Lũng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2240, 'Xuân Viên', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2241, 'Yên Kỳ', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2242, 'Yên Lạc', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2243, 'Yên Lãng', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2244, 'Yên Lập', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2245, 'Yên Phú', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2246, 'Yên Sơn', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2247, 'Yên Thủy', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2248, 'Yên Trị', 1, NULL, NULL, 24, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2249, 'An Phú', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2250, 'Ba Dinh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2251, 'Ba Động', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2252, 'Ba Gia', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2253, 'Ba Tô', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2254, 'Ba Tơ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2255, 'Ba Vì', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2256, 'Ba Vinh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2257, 'Ba Xa', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2258, 'Bình Chương', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2259, 'Bình Minh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2260, 'Bình Sơn', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2261, 'Bờ Y', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2262, 'Cà Đam', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2263, 'Cẩm Thành', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2264, 'Đăk Bla', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2265, 'Đăk Cấm', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2266, 'Đăk Hà', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2267, 'Đăk Kôi', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2268, 'Đăk Long', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2269, 'Đăk Mar', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2270, 'Đăk Môn', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2271, 'Đăk Pék', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2272, 'Đăk Plô', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2273, 'Đăk Pxi', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2274, 'Đăk Rơ Wa', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2275, 'Đăk Rve', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2276, 'Đăk Sao', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2277, 'Đăk Tô', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2278, 'Đăk Tờ Kan', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2279, 'Đăk Ui', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2280, 'Đặng Thùy Trâm', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2281, 'Đình Cương', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2282, 'Đông Sơn', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2283, 'Đông Trà Bồng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2284, 'Dục Nông', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2285, 'Đức Phổ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2286, 'Ia Chim', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2287, 'Ia Đal', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2288, 'Ia Tơi', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2289, 'Khánh Cường', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2290, 'Kon Braih', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2291, 'Kon Đào', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2292, 'Kon Plông', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2293, 'Kon Tum', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2294, 'Lân Phong', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2295, 'Long Phụng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2296, 'Lý Sơn', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2297, 'Măng Bút', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2298, 'Măng Đen', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2299, 'Măng Ri', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2300, 'Minh Long', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2301, 'Mỏ Cày', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2302, 'Mộ Đức', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2303, 'Mô Rai', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2304, 'Nghĩa Giang', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2305, 'Nghĩa Hành', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2306, 'Nghĩa Lộ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2307, 'Ngọc Linh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2308, 'Ngọk Bay', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2309, 'Ngọk Réo', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2310, 'Ngọk Tụ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2311, 'Nguyễn Nghiêm', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2312, 'Phước Giang', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2313, 'Rờ Kơi', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2314, 'Sa Bình', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2315, 'Sa Huỳnh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2316, 'Sa Loong', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2317, 'Sa Thầy', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2318, 'Sơn Hà', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2319, 'Sơn Hạ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2320, 'Sơn Kỳ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2321, 'Sơn Linh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2322, 'Sơn Mai', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2323, 'Sơn Tây', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2324, 'Sơn Tây Hạ', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2325, 'Sơn Tây Thượng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2326, 'Sơn Thủy', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2327, 'Sơn Tịnh', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2328, 'Tây Trà', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2329, 'Tây Trà Bồng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2330, 'Thanh Bồng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2331, 'Thiện Tín', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2332, 'Thọ Phong', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2333, 'Tịnh Khê', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2334, 'Trà Bồng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2335, 'Trà Câu', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2336, 'Trà Giang', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2337, 'Trường Giang', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2338, 'Trương Quang Trọng', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2339, 'Tu Mơ Rông', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2340, 'Tư Nghĩa', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2341, 'Vạn Tường', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2342, 'Vệ Giang', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2343, 'Xốp', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2344, 'Ya Ly', 1, NULL, NULL, 25, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2345, 'An Sinh', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2346, 'Ba Chẽ', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2347, 'Bãi Cháy', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2348, 'Bình Khê', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2349, 'Bình Liêu', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2350, 'Cái Chiên', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2351, 'Cẩm Phả', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2352, 'Cao Xanh', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2353, 'Cô Tô', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2354, 'Cửa Ông', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2355, 'Đầm Hà', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2356, 'Điền Xá', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2357, 'Đông Mai', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2358, 'Đông Ngũ', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2359, 'Đông Triều', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2360, 'Đường Hoa', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2361, 'Hà An', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2362, 'Hà Lầm', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2363, 'Hạ Long', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2364, 'Hà Tu', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2365, 'Hải Hòa', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2366, 'Hải Lạng', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2367, 'Hải Ninh', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2368, 'Hải Sơn', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2369, 'Hiệp Hòa', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2370, 'Hoàng Quế', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2371, 'Hoành Bồ', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2372, 'Hoành Mô', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2373, 'Hồng Gai', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2374, 'Kỳ Thượng', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2375, 'Liên Hòa', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2376, 'Lục Hồn', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2377, 'Lương Minh', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2378, 'Mạo Khê', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2379, 'Móng Cái 1', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2380, 'Móng Cái 2', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2381, 'Móng Cái 3', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2382, 'Mông Dương', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2383, 'Phong Cốc', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2384, 'Quảng Đức', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2385, 'Quảng Hà', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2386, 'Quang Hanh', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2387, 'Quảng La', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2388, 'Quảng Tân', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2389, 'Quảng Yên', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2390, 'Thống Nhất', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2391, 'Tiên Yên', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2392, 'Tuần Châu', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2393, 'Uông Bí', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2394, 'Vân Đồn', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2395, 'Vàng Danh', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2396, 'Việt Hưng', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2397, 'Vĩnh Thực', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2398, 'Yên Tử', 1, NULL, NULL, 26, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2399, 'A Dơi', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2400, 'Ái Tử', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2401, 'Ba Đồn', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2402, 'Ba Lòng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2403, 'Bắc Gianh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2404, 'Bắc Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2405, 'Bến Hải', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2406, 'Bến Quan', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2407, 'Bố Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2408, 'Cam Hồng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2409, 'Cam Lộ', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2410, 'Cồn Cỏ', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2411, 'Cồn Tiên', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2412, 'Cửa Tùng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51');
INSERT INTO `wards` (`id`, `name`, `status`, `gso_id`, `district_id`, `province_id`, `created_at`, `updated_at`) VALUES
(2413, 'Cửa Việt', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2414, 'Đakrông', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2415, 'Dân Hóa', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2416, 'Diên Sanh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2417, 'Đông Hà', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2418, 'Đồng Hới', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2419, 'Đồng Lê', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2420, 'Đồng Sơn', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2421, 'Đồng Thuận', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2422, 'Đông Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2423, 'Gio Linh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2424, 'Hải Lăng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2425, 'Hiếu Giang', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2426, 'Hòa Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2427, 'Hoàn Lão', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2428, 'Hướng Hiệp', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2429, 'Hướng Lập', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2430, 'Hướng Phùng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2431, 'Khe Sanh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2432, 'Kim Điền', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2433, 'Kim Ngân', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2434, 'Kim Phú', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2435, 'La Lay', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2436, 'Lao Bảo', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2437, 'Lệ Ninh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2438, 'Lệ Thủy', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2439, 'Lìa', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2440, 'Minh Hóa', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2441, 'Mỹ Thủy', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2442, 'Nam Ba Đồn', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2443, 'Nam Cửa Việt', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2444, 'Nam Đông Hà', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2445, 'Nam Gianh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2446, 'Nam Hải Lăng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2447, 'Nam Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2448, 'Ninh Châu', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2449, 'Phong Nha', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2450, 'Phú Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2451, 'Quảng Ninh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2452, 'Quảng Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2453, 'Quảng Trị', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2454, 'Sen Ngư', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2455, 'Tà Rụt', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2456, 'Tân Gianh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2457, 'Tân Lập', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2458, 'Tân Mỹ', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2459, 'Tân Thành', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2460, 'Thượng Trạch', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2461, 'Triệu Bình', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2462, 'Triệu Cơ', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2463, 'Triệu Phong', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2464, 'Trung Thuần', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2465, 'Trường Ninh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2466, 'Trường Phú', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2467, 'Trường Sơn', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2468, 'Tuyên Bình', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2469, 'Tuyên Hóa', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2470, 'Tuyên Lâm', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2471, 'Tuyên Phú', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2472, 'Tuyên Sơn', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2473, 'Vĩnh Định', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2474, 'Vĩnh Hoàng', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2475, 'Vĩnh Linh', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2476, 'Vĩnh Thủy', 1, NULL, NULL, 27, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2477, 'Bắc Yên', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2478, 'Bình Thuận', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2479, 'Bó Sinh', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2480, 'Chiềng An', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2481, 'Chiềng Cơi', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2482, 'Chiềng Hặc', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2483, 'Chiềng Hoa', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2484, 'Chiềng Khoong', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2485, 'Chiềng Khương', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2486, 'Chiềng La', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2487, 'Chiềng Lao', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2488, 'Chiềng Mai', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2489, 'Chiềng Mung', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2490, 'Chiềng Sại', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2491, 'Chiềng Sinh', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2492, 'Chiềng Sơ', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2493, 'Chiềng Sơn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2494, 'Chiềng Sung', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2495, 'Co Mạ', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2496, 'Đoàn Kết', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2497, 'Gia Phù', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2498, 'Huổi Một', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2499, 'Kim Bon', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2500, 'Long Hẹ', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2501, 'Lóng Phiêng', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2502, 'Lóng Sập', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2503, 'Mai Sơn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2504, 'Mộc Châu', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2505, 'Mộc Sơn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2506, 'Muổi Nọi', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2507, 'Mường Bám', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2508, 'Mường Bang', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2509, 'Mường Bú', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2510, 'Mường Chanh', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2511, 'Mường Chiên', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2512, 'Mường Cơi', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2513, 'Mường É', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2514, 'Mường Giôn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2515, 'Mường Hung', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2516, 'Mường Khiêng', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2517, 'Mường La', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2518, 'Mường Lầm', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2519, 'Mường Lạn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2520, 'Mường Lèo', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2521, 'Mường Sại', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2522, 'Nậm Lầu', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2523, 'Nậm Ty', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2524, 'Ngọc Chiến', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2525, 'Pắc Ngà', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2526, 'Phiêng Cằm', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2527, 'Phiêng Khoài', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2528, 'Phiêng Pằn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2529, 'Phù Yên', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2530, 'Púng Bánh', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2531, 'Quỳnh Nhai', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2532, 'Song Khủa', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2533, 'Sông Mã', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2534, 'Sốp Cộp', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2535, 'Suối Tọ', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2536, 'Tà Hộc', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2537, 'Tạ Khoa', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2538, 'Tà Xùa', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2539, 'Tân Phong', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2540, 'Tân Yên', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2541, 'Thảo Nguyên', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2542, 'Thuận Châu', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2543, 'Tô Hiệu', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2544, 'Tô Múa', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2545, 'Tường Hạ', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2546, 'Vân Hồ', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2547, 'Vân Sơn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2548, 'Xím Vàng', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2549, 'Xuân Nha', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2550, 'Yên Châu', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2551, 'Yên Sơn', 1, NULL, NULL, 28, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2552, 'An Lục Long', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2553, 'An Ninh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2554, 'An Tịnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2555, 'Bến Cầu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2556, 'Bến Lức', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2557, 'Bình Đức', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2558, 'Bình Hiệp', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2559, 'Bình Hòa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2560, 'Bình Minh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2561, 'Bình Thành', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2562, 'Cần Đước', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2563, 'Cần Giuộc', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2564, 'Cầu Khởi', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2565, 'Châu Thành', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2566, 'Đông Thành', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2567, 'Đức Hòa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2568, 'Đức Huệ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2569, 'Đức Lập', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2570, 'Dương Minh Châu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2571, 'Gia Lộc', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2572, 'Gò Dầu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2573, 'Hảo Đước', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2574, 'Hậu Nghĩa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2575, 'Hậu Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2576, 'Hiệp Hòa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2577, 'Hòa Hội', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2578, 'Hòa Khánh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2579, 'Hòa Thành', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2580, 'Hưng Điền', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2581, 'Hưng Thuận', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2582, 'Khánh Hậu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2583, 'Khánh Hưng', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2584, 'Kiến Tường', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2585, 'Lộc Ninh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2586, 'Long An', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2587, 'Long Cang', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2588, 'Long Chữ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2589, 'Long Hoa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2590, 'Long Hựu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2591, 'Long Thuận', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2592, 'Lương Hòa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2593, 'Mộc Hóa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2594, 'Mỹ An', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2595, 'Mỹ Hạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2596, 'Mỹ Lệ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2597, 'Mỹ Lộc', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2598, 'Mỹ Quý', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2599, 'Mỹ Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2600, 'Mỹ Yên', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2601, 'Nhơn Hòa Lập', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2602, 'Nhơn Ninh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2603, 'Nhựt Tảo', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2604, 'Ninh Điền', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2605, 'Ninh Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2606, 'Phước Chỉ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2607, 'Phước Lý', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2608, 'Phước Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2609, 'Phước Vinh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2610, 'Phước Vĩnh Tây', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2611, 'Rạch Kiến', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2612, 'Tầm Vu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2613, 'Tân An', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2614, 'Tân Biên', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2615, 'Tân Châu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2616, 'Tân Đông', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2617, 'Tân Hòa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2618, 'Tân Hội', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2619, 'Tân Hưng', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2620, 'Tân Lân', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2621, 'Tân Lập', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2622, 'Tân Long', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2623, 'Tân Ninh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2624, 'Tân Phú', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2625, 'Tân Tập', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2626, 'Tân Tây', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2627, 'Tân Thành', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2628, 'Tân Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2629, 'Tân Trụ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2630, 'Thạnh Bình', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2631, 'Thanh Điền', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2632, 'Thạnh Đức', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2633, 'Thạnh Hóa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2634, 'Thạnh Lợi', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2635, 'Thạnh Phước', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2636, 'Thủ Thừa', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2637, 'Thuận Mỹ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2638, 'Trà Vong', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2639, 'Trảng Bàng', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2640, 'Truông Mít', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2641, 'Tuyên Bình', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2642, 'Tuyên Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2643, 'Vàm Cỏ', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2644, 'Vĩnh Châu', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2645, 'Vĩnh Công', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2646, 'Vĩnh Hưng', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2647, 'Vĩnh Thạnh', 1, NULL, NULL, 29, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2648, 'An Khánh', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2649, 'Ba Bể', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2650, 'Bá Xuyên', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2651, 'Bắc Kạn', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2652, 'Bách Quang', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2653, 'Bạch Thông', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2654, 'Bằng Thành', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2655, 'Bằng Vân', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2656, 'Bình Thành', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2657, 'Bình Yên', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2658, 'Cẩm Giàng', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2659, 'Cao Minh', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2660, 'Chợ Đồn', 1, NULL, NULL, 30, '2026-03-02 16:22:51', '2026-03-02 16:22:51'),
(2661, 'Chợ Mới', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2662, 'Chợ Rã', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2663, 'Côn Minh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2664, 'Cường Lợi', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2665, 'Đại Phúc', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2666, 'Đại Từ', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2667, 'Dân Tiến', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2668, 'Điềm Thụy', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2669, 'Định Hóa', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2670, 'Đồng Hỷ', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2671, 'Đồng Phúc', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2672, 'Đức Lương', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2673, 'Đức Xuân', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2674, 'Gia Sàng', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2675, 'Hiệp Lực', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2676, 'Hợp Thành', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2677, 'Kha Sơn', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2678, 'Kim Phượng', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2679, 'La Bằng', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2680, 'La Hiên', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2681, 'Lam Vỹ', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2682, 'Linh Sơn', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2683, 'Nà Phặc', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2684, 'Na Rì', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2685, 'Nam Cường', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2686, 'Nam Hòa', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2687, 'Ngân Sơn', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2688, 'Nghĩa Tá', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2689, 'Nghiên Loan', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2690, 'Nghinh Tường', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2691, 'Phan Đình Phùng', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2692, 'Phổ Yên', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2693, 'Phong Quang', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2694, 'Phú Bình', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2695, 'Phú Đình', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2696, 'Phú Lạc', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2697, 'Phú Lương', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2698, 'Phú Thịnh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2699, 'Phủ Thông', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2700, 'Phú Xuyên', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2701, 'Phúc Lộc', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2702, 'Phúc Thuận', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2703, 'Phượng Tiến', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2704, 'Quân Chu', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2705, 'Quan Triều', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2706, 'Quảng Bạch', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2707, 'Quang Sơn', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2708, 'Quyết Thắng', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2709, 'Sảng Mộc', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2710, 'Sông Công', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2711, 'Tân Cương', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2712, 'Tân Khánh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2713, 'Tân Kỳ', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2714, 'Tân Thành', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2715, 'Thần Sa', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2716, 'Thành Công', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2717, 'Thanh Mai', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2718, 'Thanh Thịnh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2719, 'Thượng Minh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2720, 'Thượng Quan', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2721, 'Tích Lương', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2722, 'Trại Cau', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2723, 'Trần Phú', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2724, 'Tràng Xá', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2725, 'Trung Hội', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2726, 'Trung Thành', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2727, 'Văn Hán', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2728, 'Văn Lang', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2729, 'Văn Lăng', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2730, 'Vạn Phú', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2731, 'Vạn Xuân', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2732, 'Vĩnh Thông', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2733, 'Võ Nhai', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2734, 'Vô Tranh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2735, 'Xuân Dương', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2736, 'Yên Bình', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2737, 'Yên Phong', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2738, 'Yên Thịnh', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2739, 'Yên Trạch', 1, NULL, NULL, 30, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2740, 'An Nông', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2741, 'Ba Đình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2742, 'Bá Thước', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2743, 'Bát Mọt', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2744, 'Biện Thượng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2745, 'Bỉm Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2746, 'Các Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2747, 'Cẩm Tân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2748, 'Cẩm Thạch', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2749, 'Cẩm Thủy', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2750, 'Cẩm Tú', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2751, 'Cẩm Vân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2752, 'Cổ Lũng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2753, 'Công Chính', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2754, 'Đào Duy Từ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2755, 'Điền Lư', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2756, 'Điền Quang', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2757, 'Định Hòa', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2758, 'Định Tân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2759, 'Đồng Lương', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2760, 'Đông Quang', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2761, 'Đông Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2762, 'Đông Thành', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2763, 'Đông Tiến', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2764, 'Đồng Tiến', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2765, 'Giao An', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2766, 'Hà Long', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2767, 'Hà Trung', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2768, 'Hạc Thành', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2769, 'Hải Bình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2770, 'Hải Lĩnh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2771, 'Hàm Rồng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2772, 'Hậu Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2773, 'Hiền Kiệt', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2774, 'Hồ Vương', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2775, 'Hoa Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2776, 'Hóa Quỳ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2777, 'Hoằng Châu', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2778, 'Hoằng Giang', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2779, 'Hoằng Hóa', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2780, 'Hoằng Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2781, 'Hoằng Phú', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2782, 'Hoằng Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2783, 'Hoằng Thanh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2784, 'Hoằng Tiến', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2785, 'Hoạt Giang', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2786, 'Hồi Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2787, 'Hợp Tiến', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2788, 'Kiên Thọ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2789, 'Kim Tân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2790, 'Lam Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2791, 'Linh Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2792, 'Lĩnh Toại', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2793, 'Luận Thành', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2794, 'Lương Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2795, 'Lưu Vệ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2796, 'Mậu Lâm', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2797, 'Minh Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2798, 'Mường Chanh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2799, 'Mường Lát', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2800, 'Mường Lý', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2801, 'Mường Mìn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2802, 'Na Mèo', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2803, 'Nam Sầm Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2804, 'Nam Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2805, 'Nga An', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2806, 'Nga Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2807, 'Nga Thắng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2808, 'Nghi Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2809, 'Ngọc Lặc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2810, 'Ngọc Liên', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2811, 'Ngọc Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2812, 'Ngọc Trạo', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2813, 'Nguyệt Ấn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2814, 'Nguyệt Viên', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2815, 'Nhi Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2816, 'Như Thanh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2817, 'Như Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2818, 'Nông Cống', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2819, 'Phú Lệ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2820, 'Phú Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2821, 'Pù Luông', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2822, 'Pù Nhi', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2823, 'Quan Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2824, 'Quảng Bình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2825, 'Quang Chiểu', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2826, 'Quảng Chính', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2827, 'Quảng Ngọc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2828, 'Quảng Ninh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2829, 'Quảng Phú', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2830, 'Quang Trung', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2831, 'Quảng Yên', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2832, 'Quý Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2833, 'Quý Lương', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2834, 'Sầm Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2835, 'Sao Vàng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2836, 'Sơn Điện', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2837, 'Sơn Thủy', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2838, 'Tam Chung', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2839, 'Tam Lư', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2840, 'Tam Thanh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2841, 'Tân Dân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2842, 'Tân Ninh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2843, 'Tân Thành', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2844, 'Tân Tiến', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2845, 'Tây Đô', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2846, 'Thạch Bình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2847, 'Thạch Lập', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2848, 'Thạch Quảng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2849, 'Thăng Bình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2850, 'Thắng Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2851, 'Thắng Lợi', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2852, 'Thanh Kỳ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2853, 'Thanh Phong', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2854, 'Thanh Quân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2855, 'Thành Vinh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2856, 'Thiên Phủ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2857, 'Thiết Ống', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2858, 'Thiệu Hóa', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2859, 'Thiệu Quang', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2860, 'Thiệu Tiến', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2861, 'Thiệu Toán', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2862, 'Thiệu Trung', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2863, 'Thọ Bình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2864, 'Thọ Lập', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2865, 'Thọ Long', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2866, 'Thọ Ngọc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2867, 'Thọ Phú', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2868, 'Thọ Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2869, 'Thượng Ninh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2870, 'Thường Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2871, 'Tiên Trang', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2872, 'Tĩnh Gia', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2873, 'Tống Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2874, 'Triệu Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2875, 'Triệu Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2876, 'Trúc Lâm', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2877, 'Trung Chính', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2878, 'Trung Hạ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2879, 'Trung Lý', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2880, 'Trung Sơn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2881, 'Trung Thành', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2882, 'Trường Lâm', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2883, 'Trường Văn', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2884, 'Tượng Lĩnh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2885, 'Vân Du', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2886, 'Vạn Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2887, 'Văn Nho', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2888, 'Văn Phú', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2889, 'Vạn Xuân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2890, 'Vĩnh Lộc', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2891, 'Xuân Bình', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2892, 'Xuân Chinh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2893, 'Xuân Du', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2894, 'Xuân Hòa', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2895, 'Xuân Lập', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2896, 'Xuân Thái', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2897, 'Xuân Tín', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2898, 'Yên Định', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2899, 'Yên Khương', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2900, 'Yên Nhân', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2901, 'Yên Ninh', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2902, 'Yên Phú', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2903, 'Yên Thắng', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2904, 'Yên Thọ', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2905, 'Yên Trường', 1, NULL, NULL, 31, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2906, 'An Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2907, 'An Hội Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2908, 'An Hội Tây', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2909, 'An Khánh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2910, 'An Lạc', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2911, 'An Long', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2912, 'An Nhơn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2913, 'An Nhơn Tây', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2914, 'An Phú', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2915, 'An Phú Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2916, 'An Thới Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2917, 'Bà Điểm', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2918, 'Bà Rịa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2919, 'Bắc Tân Uyên', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2920, 'Bàn Cờ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2921, 'Bàu Bàng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2922, 'Bàu Lâm', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2923, 'Bảy Hiền', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2924, 'Bến Cát', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2925, 'Bến Thành', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2926, 'Bình Chánh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2927, 'Bình Châu', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2928, 'Bình Cơ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2929, 'Bình Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2930, 'Bình Dương', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2931, 'Bình Giã', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2932, 'Bình Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2933, 'Bình Hưng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2934, 'Bình Hưng Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2935, 'Bình Khánh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2936, 'Bình Lợi', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2937, 'Bình Lợi Trung', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2938, 'Bình Mỹ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2939, 'Bình Phú', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2940, 'Bình Quới', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2941, 'Bình Tân', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2942, 'Bình Tây', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2943, 'Bình Thạnh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2944, 'Bình Thới', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2945, 'Bình Tiên', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2946, 'Bình Trị Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2947, 'Bình Trưng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2948, 'Cần Giờ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2949, 'Cát Lái', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2950, 'Cầu Kiệu', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2951, 'Cầu Ông Lãnh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2952, 'Chánh Hiệp', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2953, 'Chánh Hưng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2954, 'Chánh Phú Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2955, 'Châu Đức', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2956, 'Châu Pha', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2957, 'Chợ Lớn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2958, 'Chợ Quán', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2959, 'Côn Đảo', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2960, 'Củ Chi', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2961, 'Đất Đỏ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2962, 'Dầu Tiếng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2963, 'Dĩ An', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2964, 'Diên Hồng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2965, 'Đông Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2966, 'Đông Hưng Thuận', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2967, 'Đông Thạnh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2968, 'Đức Nhuận', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2969, 'Gia Định', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2970, 'Gò Vấp', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2971, 'Hạnh Thông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2972, 'Hiệp Bình', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2973, 'Hiệp Phước', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2974, 'Hồ Tràm', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2975, 'Hòa Bình', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2976, 'Hòa Hiệp', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2977, 'Hòa Hội', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2978, 'Hòa Hưng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2979, 'Hòa Lợi', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2980, 'Hóc Môn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2981, 'Hưng Long', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2982, 'Khánh Hội', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2983, 'Kim Long', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2984, 'Lái Thiêu', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2985, 'Linh Xuân', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2986, 'Long Bình', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2987, 'Long Điền', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2988, 'Long Hải', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2989, 'Long Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2990, 'Long Hương', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2991, 'Long Nguyên', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2992, 'Long Phước', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2993, 'Long Sơn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2994, 'Long Trường', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2995, 'Minh Phụng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2996, 'Minh Thạnh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2997, 'Ngãi Giao', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2998, 'Nghĩa Thành', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(2999, 'Nhà Bè', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3000, 'Nhiêu Lộc', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3001, 'Nhuận Đức', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3002, 'Phú An', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3003, 'Phú Định', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3004, 'Phú Giáo', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3005, 'Phú Hòa Đông', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3006, 'Phú Lâm', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3007, 'Phú Lợi', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3008, 'Phú Mỹ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52');
INSERT INTO `wards` (`id`, `name`, `status`, `gso_id`, `district_id`, `province_id`, `created_at`, `updated_at`) VALUES
(3009, 'Phú Nhuận', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3010, 'Phú Thạnh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3011, 'Phú Thọ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3012, 'Phú Thọ Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3013, 'Phú Thuận', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3014, 'Phước Hải', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3015, 'Phước Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3016, 'Phước Long', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3017, 'Phước Thắng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3018, 'Phước Thành', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3019, 'Rạch Dừa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3020, 'Sài Gòn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3021, 'Tam Bình', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3022, 'Tam Long', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3023, 'Tam Thắng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3024, 'Tân An Hội', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3025, 'Tân Bình', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3026, 'Tân Định', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3027, 'Tân Đông Hiệp', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3028, 'Tân Hải', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3029, 'Tân Hiệp', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3030, 'Tân Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3031, 'Tân Hưng', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3032, 'Tân Khánh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3033, 'Tân Mỹ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3034, 'Tân Nhựt', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3035, 'Tân Phú', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3036, 'Tân Phước', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3037, 'Tân Sơn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3038, 'Tân Sơn Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3039, 'Tân Sơn Nhất', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3040, 'Tân Sơn Nhì', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3041, 'Tân Tạo', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3042, 'Tân Thành', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3043, 'Tân Thới Hiệp', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3044, 'Tân Thuận', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3045, 'Tân Uyên', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3046, 'Tân Vĩnh Lộc', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3047, 'Tăng Nhơn Phú', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3048, 'Tây Nam', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3049, 'Tây Thạnh', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3050, 'Thái Mỹ', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3051, 'Thanh An', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3052, 'Thạnh An', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3053, 'Thạnh Mỹ Tây', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3054, 'Thới An', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3055, 'Thới Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3056, 'Thông Tây Hội', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3057, 'Thủ Dầu Một', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3058, 'Thủ Đức', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3059, 'Thuận An', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3060, 'Thuận Giao', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3061, 'Thường Tân', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3062, 'Trừ Văn Thố', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3063, 'Trung Mỹ Tây', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3064, 'Vĩnh Hội', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3065, 'Vĩnh Lộc', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3066, 'Vĩnh Tân', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3067, 'Vũng Tàu', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3068, 'Vườn Lài', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3069, 'Xóm Chiếu', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3070, 'Xuân Hòa', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3071, 'Xuân Sơn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3072, 'Xuân Thới Sơn', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3073, 'Xuyên Mộc', 1, NULL, NULL, 32, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3074, 'An Tường', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3075, 'Bắc Mê', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3076, 'Bắc Quang', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3077, 'Bạch Đích', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3078, 'Bạch Ngọc', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3079, 'Bạch Xa', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3080, 'Bản Máy', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3081, 'Bằng Hành', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3082, 'Bằng Lang', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3083, 'Bình An', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3084, 'Bình Ca', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3085, 'Bình Thuận', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3086, 'Bình Xa', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3087, 'Cán Tỷ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3088, 'Cao Bồ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3089, 'Chiêm Hóa', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3090, 'Côn Lôn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3091, 'Đồng Tâm', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3092, 'Đông Thọ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3093, 'Đồng Văn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3094, 'Đồng Yên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3095, 'Du Già', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3096, 'Đường Hồng', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3097, 'Đường Thượng', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3098, 'Giáp Trung', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3099, 'Hà Giang 1', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3100, 'Hà Giang 2', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3101, 'Hàm Yên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3102, 'Hồ Thầu', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3103, 'Hòa An', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3104, 'Hoàng Su Phì', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3105, 'Hồng Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3106, 'Hồng Thái', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3107, 'Hùng An', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3108, 'Hùng Đức', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3109, 'Hùng Lợi', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3110, 'Khâu Vai', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3111, 'Khuôn Lùng', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3112, 'Kiên Đài', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3113, 'Kiến Thiết', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3114, 'Kim Bình', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3115, 'Lâm Bình', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3116, 'Lao Chải', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3117, 'Liên Hiệp', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3118, 'Linh Hồ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3119, 'Lực Hành', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3120, 'Lũng Cú', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3121, 'Lũng Phìn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3122, 'Lùng Tám', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3123, 'Mậu Duệ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3124, 'Mèo Vạc', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3125, 'Minh Ngọc', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3126, 'Minh Quang', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3127, 'Minh Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3128, 'Minh Tân', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3129, 'Minh Thanh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3130, 'Minh Xuân', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3131, 'Mỹ Lâm', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3132, 'Nà Hang', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3133, 'Nấm Dẩn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3134, 'Nậm Dịch', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3135, 'Nghĩa Thuận', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3136, 'Ngọc Đường', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3137, 'Ngọc Long', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3138, 'Nhữ Khê', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3139, 'Niêm Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3140, 'Nông Tiến', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3141, 'Pà Vầy Sủ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3142, 'Phố Bảng', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3143, 'Phú Linh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3144, 'Phú Lương', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3145, 'Phù Lưu', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3146, 'Pờ Ly Ngài', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3147, 'Quản Bạ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3148, 'Quang Bình', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3149, 'Quảng Nguyên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3150, 'Sà Phìn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3151, 'Sơn Dương', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3152, 'Sơn Thủy', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3153, 'Sơn Vĩ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3154, 'Sủng Máng', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3155, 'Tân An', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3156, 'Tân Long', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3157, 'Tân Mỹ', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3158, 'Tân Quang', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3159, 'Tân Thanh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3160, 'Tân Tiến', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3161, 'Tân Trào', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3162, 'Tân Trịnh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3163, 'Tát Ngà', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3164, 'Thái Bình', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3165, 'Thái Hòa', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3166, 'Thái Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3167, 'Thắng Mố', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3168, 'Thàng Tín', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3169, 'Thanh Thủy', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3170, 'Thông Nguyên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3171, 'Thuận Hòa', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3172, 'Thượng Lâm', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3173, 'Thượng Nông', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3174, 'Thượng Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3175, 'Tiên Nguyên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3176, 'Tiên Yên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3177, 'Tri Phú', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3178, 'Trung Hà', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3179, 'Trung Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3180, 'Trung Thịnh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3181, 'Trường Sinh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3182, 'Tùng Bá', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3183, 'Tùng Vài', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3184, 'Vị Xuyên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3185, 'Việt Lâm', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3186, 'Vĩnh Tuy', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3187, 'Xín Mần', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3188, 'Xuân Giang', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3189, 'Xuân Vân', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3190, 'Yên Cường', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3191, 'Yên Hoa', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3192, 'Yên Lập', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3193, 'Yên Minh', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3194, 'Yên Nguyên', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3195, 'Yên Phú', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3196, 'Yên Sơn', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3197, 'Yên Thành', 1, NULL, NULL, 33, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3198, 'An Bình', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3199, 'An Định', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3200, 'An Hiệp', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3201, 'An Hội', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3202, 'An Ngãi Trung', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3203, 'An Phú Tân', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3204, 'An Qui', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3205, 'An Trường', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3206, 'Ba Tri', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3207, 'Bảo Thạnh', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3208, 'Bến Tre', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3209, 'Bình Đại', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3210, 'Bình Minh', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3211, 'Bình Phú', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3212, 'Bình Phước', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3213, 'Cái Ngang', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3214, 'Cái Nhum', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3215, 'Cái Vồn', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3216, 'Càng Long', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3217, 'Cầu Kè', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3218, 'Cầu Ngang', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3219, 'Châu Hòa', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3220, 'Châu Hưng', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3221, 'Châu Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3222, 'Chợ Lách', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3223, 'Đại An', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3224, 'Đại Điền', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3225, 'Đôn Châu', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3226, 'Đông Hải', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3227, 'Đồng Khởi', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3228, 'Đông Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3229, 'Duyên Hải', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3230, 'Giao Long', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3231, 'Giồng Trôm', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3232, 'Hàm Giang', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3233, 'Hiệp Mỹ', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3234, 'Hiếu Phụng', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3235, 'Hiếu Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3236, 'Hòa Bình', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3237, 'Hòa Hiệp', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3238, 'Hòa Minh', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3239, 'Hoà Thuận', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3240, 'Hùng Hoà', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3241, 'Hưng Khánh Trung', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3242, 'Hưng Mỹ', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3243, 'Hưng Nhượng', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3244, 'Hương Mỹ', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3245, 'Lộc Thuận', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3246, 'Long Châu', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3247, 'Long Đức', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3248, 'Long Hiệp', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3249, 'Long Hồ', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3250, 'Long Hòa', 1, NULL, NULL, 34, '2026-03-02 16:22:52', '2026-03-02 16:22:52'),
(3251, 'Long Hữu', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3252, 'Long Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3253, 'Long Vĩnh', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3254, 'Lục Sĩ Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3255, 'Lương Hòa', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3256, 'Lương Phú', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3257, 'Lưu Nghiệp Anh', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3258, 'Mỏ Cày', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3259, 'Mỹ Chánh Hòa', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3260, 'Mỹ Long', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3261, 'Mỹ Thuận', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3262, 'Ngãi Tứ', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3263, 'Ngũ Lạc', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3264, 'Nguyệt Hoá', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3265, 'Nhị Long', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3266, 'Nhị Trường', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3267, 'Nhơn Phú', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3268, 'Nhuận Phú Tân', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3269, 'Phong Thạnh', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3270, 'Phú Khương', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3271, 'Phú Phụng', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3272, 'Phú Quới', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3273, 'Phú Tân', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3274, 'Phú Thuận', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3275, 'Phú Túc', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3276, 'Phước Hậu', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3277, 'Phước Long', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3278, 'Phước Mỹ Trung', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3279, 'Quới An', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3280, 'Quới Điền', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3281, 'Quới Thiện', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3282, 'Sơn Đông', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3283, 'Song Lộc', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3284, 'Song Phú', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3285, 'Tam Bình', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3286, 'Tam Ngãi', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3287, 'Tân An', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3288, 'Tân Hạnh', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3289, 'Tân Hào', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3290, 'Tân Hoà', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3291, 'Tân Long Hội', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3292, 'Tân Lược', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3293, 'Tân Ngãi', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3294, 'Tân Phú', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3295, 'Tân Quới', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3296, 'Tân Thành Bình', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3297, 'Tân Thủy', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3298, 'Tân Xuân', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3299, 'Tập Ngãi', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3300, 'Tập Sơn', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3301, 'Thanh Đức', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3302, 'Thạnh Hải', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3303, 'Thạnh Phong', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3304, 'Thạnh Phú', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3305, 'Thạnh Phước', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3306, 'Thành Thới', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3307, 'Thạnh Trị', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3308, 'Thới Thuận', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3309, 'Tiên Thủy', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3310, 'Tiểu Cần', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3311, 'Trà Côn', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3312, 'Trà Cú', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3313, 'Trà Ôn', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3314, 'Trà Vinh', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3315, 'Trung Hiệp', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3316, 'Trung Ngãi', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3317, 'Trung Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3318, 'Trường Long Hoà', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3319, 'Vinh Kim', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3320, 'Vĩnh Thành', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53'),
(3321, 'Vĩnh Xuân', 1, NULL, NULL, 34, '2026-03-02 16:22:53', '2026-03-02 16:22:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`,`username`) USING BTREE;

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `category_posts`
--
ALTER TABLE `category_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent` (`parent_id`);

--
-- Indexes for table `category_post_translations`
--
ALTER TABLE `category_post_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_cat_post_trans` (`category_post_id`);

--
-- Indexes for table `category_restaurants`
--
ALTER TABLE `category_restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent` (`parent_id`);

--
-- Indexes for table `category_restaurant_translations`
--
ALTER TABLE `category_restaurant_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_cat_rest_trans` (`category_restaurant_id`);

--
-- Indexes for table `category_rooms`
--
ALTER TABLE `category_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent` (`parent_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `category_room_translations`
--
ALTER TABLE `category_room_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_cat_room_trans` (`category_room_id`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_images`
--
ALTER TABLE `facility_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_images_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `facility_translations`
--
ALTER TABLE `facility_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_translations_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `job_keyword`
--
ALTER TABLE `job_keyword`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_slug_lang` (`slug`,`lang_code`),
  ADD KEY `idx_key_type` (`key_id`,`type`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location` (`location`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_group_id_foreign` (`menu_group_id`);

--
-- Indexes for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_item_translations_menu_item_id_lang_code_unique` (`menu_item_id`,`lang_code`);

--
-- Indexes for table `mice_events`
--
ALTER TABLE `mice_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mice_event_images`
--
ALTER TABLE `mice_event_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mice_event_images_event_id_foreign` (`mice_event_id`);

--
-- Indexes for table `mice_event_translations`
--
ALTER TABLE `mice_event_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mice_event_translations_event_id_foreign` (`mice_event_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_lang_code_unique` (`page_id`,`lang_code`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cat` (`category_id`);

--
-- Indexes for table `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_post_trans` (`post_id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cat` (`category_id`);

--
-- Indexes for table `restaurant_chefs`
--
ALTER TABLE `restaurant_chefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rest_chefs` (`restaurant_id`);

--
-- Indexes for table `restaurant_chef_translations`
--
ALTER TABLE `restaurant_chef_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_rest_chef_trans` (`restaurant_chef_id`);

--
-- Indexes for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rest_images` (`restaurant_id`);

--
-- Indexes for table `restaurant_menus`
--
ALTER TABLE `restaurant_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rest_menus` (`restaurant_id`);

--
-- Indexes for table `restaurant_menu_translations`
--
ALTER TABLE `restaurant_menu_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_rest_menu_trans` (`restaurant_menu_id`);

--
-- Indexes for table `restaurant_translations`
--
ALTER TABLE `restaurant_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_rest_trans` (`restaurant_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cat` (`category_id`),
  ADD KEY `idx_status_hot` (`status`,`is_hot`);

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_images` (`room_id`);

--
-- Indexes for table `room_translations`
--
ALTER TABLE `room_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lang` (`lang_code`),
  ADD KEY `fk_room_trans` (`room_id`);

--
-- Indexes for table `special_offers`
--
ALTER TABLE `special_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_offer_images`
--
ALTER TABLE `special_offer_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_offer_translations`
--
ALTER TABLE `special_offer_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `special_offer_translations_special_offer_id_foreign` (`special_offer_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`,`email`,`mobile`) USING BTREE;

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wards_district_id_foreign` (`district_id`) USING BTREE,
  ADD KEY `wards_province_id_index` (`province_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_posts`
--
ALTER TABLE `category_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_post_translations`
--
ALTER TABLE `category_post_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_restaurants`
--
ALTER TABLE `category_restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_restaurant_translations`
--
ALTER TABLE `category_restaurant_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_rooms`
--
ALTER TABLE `category_rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_room_translations`
--
ALTER TABLE `category_room_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `facility_images`
--
ALTER TABLE `facility_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `facility_translations`
--
ALTER TABLE `facility_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_keyword`
--
ALTER TABLE `job_keyword`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `mice_events`
--
ALTER TABLE `mice_events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mice_event_images`
--
ALTER TABLE `mice_event_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mice_event_translations`
--
ALTER TABLE `mice_event_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_translations`
--
ALTER TABLE `post_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `restaurant_chefs`
--
ALTER TABLE `restaurant_chefs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_chef_translations`
--
ALTER TABLE `restaurant_chef_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `restaurant_menus`
--
ALTER TABLE `restaurant_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant_menu_translations`
--
ALTER TABLE `restaurant_menu_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurant_translations`
--
ALTER TABLE `restaurant_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `room_translations`
--
ALTER TABLE `room_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `special_offers`
--
ALTER TABLE `special_offers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `special_offer_images`
--
ALTER TABLE `special_offer_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `special_offer_translations`
--
ALTER TABLE `special_offer_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3322;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_post_translations`
--
ALTER TABLE `category_post_translations`
  ADD CONSTRAINT `fk_cat_post_trans` FOREIGN KEY (`category_post_id`) REFERENCES `category_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_restaurant_translations`
--
ALTER TABLE `category_restaurant_translations`
  ADD CONSTRAINT `fk_cat_rest_trans` FOREIGN KEY (`category_restaurant_id`) REFERENCES `category_restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_room_translations`
--
ALTER TABLE `category_room_translations`
  ADD CONSTRAINT `fk_cat_room_trans` FOREIGN KEY (`category_room_id`) REFERENCES `category_rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `facility_images`
--
ALTER TABLE `facility_images`
  ADD CONSTRAINT `facility_images_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `facility_translations`
--
ALTER TABLE `facility_translations`
  ADD CONSTRAINT `facility_translations_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_group_id_foreign` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mice_event_images`
--
ALTER TABLE `mice_event_images`
  ADD CONSTRAINT `mice_event_images_event_id_foreign` FOREIGN KEY (`mice_event_id`) REFERENCES `mice_events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mice_event_translations`
--
ALTER TABLE `mice_event_translations`
  ADD CONSTRAINT `mice_event_translations_event_id_foreign` FOREIGN KEY (`mice_event_id`) REFERENCES `mice_events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_post_cat` FOREIGN KEY (`category_id`) REFERENCES `category_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD CONSTRAINT `fk_post_trans` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `fk_rest_cat` FOREIGN KEY (`category_id`) REFERENCES `category_restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_chefs`
--
ALTER TABLE `restaurant_chefs`
  ADD CONSTRAINT `fk_rest_chefs` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_chef_translations`
--
ALTER TABLE `restaurant_chef_translations`
  ADD CONSTRAINT `fk_rest_chef_trans` FOREIGN KEY (`restaurant_chef_id`) REFERENCES `restaurant_chefs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  ADD CONSTRAINT `fk_rest_images` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_menus`
--
ALTER TABLE `restaurant_menus`
  ADD CONSTRAINT `fk_rest_menus` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_menu_translations`
--
ALTER TABLE `restaurant_menu_translations`
  ADD CONSTRAINT `fk_rest_menu_trans` FOREIGN KEY (`restaurant_menu_id`) REFERENCES `restaurant_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_translations`
--
ALTER TABLE `restaurant_translations`
  ADD CONSTRAINT `fk_rest_trans` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_room_cat` FOREIGN KEY (`category_id`) REFERENCES `category_rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `fk_room_images` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_translations`
--
ALTER TABLE `room_translations`
  ADD CONSTRAINT `fk_room_trans` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `special_offer_translations`
--
ALTER TABLE `special_offer_translations`
  ADD CONSTRAINT `special_offer_translations_special_offer_id_foreign` FOREIGN KEY (`special_offer_id`) REFERENCES `special_offers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `wards_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
