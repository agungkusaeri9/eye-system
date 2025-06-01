-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 12:30 AM
-- Server version: 8.0.42-0ubuntu0.24.04.1
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eye_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'PT. Asmin Bara Bronang', 'Jalan Kapten Naseh Blk No 73', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(2, 'PT. Kalimantan Prima Persada', 'JAB ABB KM 62 , Kahukup', '2023-07-26 23:09:55', '2023-07-26 23:09:55'),
(3, 'PT. TEGAP MITRA NUSANTARA', 'MUARA TEWEH - BARITO UTARA', '2024-06-15 03:00:34', '2024-06-15 03:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Operation & Production', '2023-07-25 19:44:04', '2023-07-26 23:12:29'),
(5, 'IT (Information & Technology)', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(6, 'HRM & Engineering', '2023-07-26 23:10:27', '2023-07-26 23:10:27'),
(7, 'FATB', '2023-07-26 23:10:44', '2024-06-04 09:30:01'),
(9, 'HCGS', '2023-07-26 23:11:06', '2023-07-26 23:11:06'),
(10, 'PLANT', '2023-07-26 23:11:16', '2023-07-26 23:11:16'),
(11, 'SM', '2023-07-26 23:11:23', '2023-07-26 23:11:23'),
(12, 'SHE', '2023-07-26 23:11:34', '2023-07-26 23:11:34'),
(13, 'HCGS', '2024-06-15 03:00:52', '2024-06-15 03:00:52'),
(14, 'Plant & SM', '2025-05-07 21:16:27', '2025-05-07 21:16:27'),
(15, 'Project Management', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(16, 'HCGS & FAT', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(17, 'SHE Site', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(18, 'Opr Learning & Devlp', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(19, 'HCD', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(20, 'Plant Learning Devlp', '2025-05-07 21:16:38', '2025-05-07 21:16:38'),
(21, 'IT', '2025-05-07 21:47:24', '2025-05-07 21:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'ASTO', '2024-04-01 05:04:27', '2024-04-01 05:04:27'),
(4, 'Distrik 1', '2024-04-05 02:15:56', '2024-04-05 02:15:56'),
(5, 'PT. TMN', '2024-06-15 03:02:06', '2024-06-15 03:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `ehays`
--

CREATE TABLE `ehays` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint UNSIGNED DEFAULT NULL,
  `family_id` bigint UNSIGNED DEFAULT NULL,
  `glasses_price` bigint DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nominal_total` bigint NOT NULL DEFAULT '0',
  `nominal_approve` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ehay_cares`
--

CREATE TABLE `ehay_cares` (
  `id` bigint UNSIGNED NOT NULL,
  `ehay_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ehay_log_statuses`
--

CREATE TABLE `ehay_log_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `ehay_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_done` int NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ehay_treatments`
--

CREATE TABLE `ehay_treatments` (
  `id` bigint UNSIGNED NOT NULL,
  `ehay_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `nrp` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_handphone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_born` date NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `company_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `nrp`, `name`, `email`, `no_handphone`, `date_born`, `address`, `password`, `department_id`, `company_id`, `created_at`, `updated_at`, `user_id`) VALUES
(483, 'KA07048', 'MUHAMMAD ASFIANNOOR AMD', 'KA07048@mail.com', '-', '2025-05-08', '-', '$2y$10$emneAhpWf07vHrTIAUL3tOsOQPL2BORYRRSV.NzY9fZ5lTZjJXY/W', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2439),
(484, 'KA08009', 'MUHAMMAD RISWAN ARIADI', 'KA08009@mail.com', '-', '2025-05-08', '-', '$2y$10$70XUCD66ixX3y3AKF6RLvO1im4Z6JpkAItLk7AnoEGv7Td9HzBxcy', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2440),
(485, 'KA09020', 'SEPTIAN AFRIZAL', 'KA09020@mail.com', '-', '2025-05-08', '-', '$2y$10$RXabc57vgk6kUlhyROo0k.ewZ1nRzb8FZPA3vN6W5z7U2qgmgWRkW', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2441),
(486, 'KA12016', 'SUPRAPTO', 'KA12016@mail.com', '-', '2025-05-08', '-', '$2y$10$ePnLMeWW1GoQ/tLdd/5lFuURUNrFE8On4qeZTE9vfko5c1IdOPyvy', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2442),
(487, 'KA18003', 'REGNO KHRISTIE', 'KA18003@mail.com', '-', '2025-05-08', '-', '$2y$10$u6YWFjGN4a5tnjIuPIjy8.ujzo9EhACdikzSWBWRiQtc4XhhxG0qm', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2443),
(488, 'KA18004', 'MUCHLIS YULI PADELI', 'KA18004@mail.com', '-', '2025-05-08', '-', '$2y$10$YprVfPKIvlBI/3RkT16mceEAgfkY6GIpHQ3xgI7SKcZ20YsFnEgGe', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2444),
(489, 'KA19007', 'ABDURRAHMAN HAKIM NASUTION', 'KA19007@mail.com', '-', '2025-05-08', '-', '$2y$10$sQKnNrM/fquIGdVT/tHSJuIL8ljZ5alrG4MWfNTUfgpv4E6HFXVwm', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2445),
(490, 'KB08006', 'SEPTI AJI NUGROHO', 'KB08006@mail.com', '-', '2025-05-08', '-', '$2y$10$gf94TzO8QyD.21QWpL5dPelF1hvhckT.g8c6Uw7wpLj84eJxmHn7m', 15, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2446),
(491, 'KB09078', 'MOH. YASIN MUSTOFA', 'KB09078@mail.com', '-', '2025-05-08', '-', '$2y$10$EqxOImmbXjZ0sYfiBIyx5uJ1Spqeo4q3NfGT5lu8fFuLs.CnJckx2', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2447),
(492, 'KB09098', 'UBAIT BUDI SANTOSO', 'KB09098@mail.com', '-', '2025-05-08', '-', '$2y$10$5NOD1pO8zCvAQ/SvSL3.ce5t2Mn1QdUDFYqjiV61t4GxC0AieBzEO', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2448),
(493, 'KB11061', 'FENDI ARIFIANTO', 'KB11061@mail.com', '-', '2025-05-08', '-', '$2y$10$gmiUyN4XIiJQcskxhBUM6uupa.6x8kHz6tKIsdmpxOulB96sU31eu', 16, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2449),
(494, 'KB11206', 'PRIYANTO', 'KB11206@mail.com', '-', '2025-05-08', '-', '$2y$10$IEoZBYXTHAdT/xPr9nj1WOLzs8x25jxkttjl6igo4gpoCF9k3Fqq.', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2450),
(495, 'KB12113', 'HANIP STIYANTO', 'KB12113@mail.com', '-', '2025-05-08', '-', '$2y$10$NsoRMyuC/hC1ql1Fz02Hb./kfg9ABqNL7jIcif/Iv/0QfwAQ15Eme', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2451),
(496, 'KB12131', 'IMAM TEGUH WIBOWO', 'KB12131@mail.com', '-', '2025-05-08', '-', '$2y$10$o8yyhtPugbs4jeVY0cGDTu3IJ3FPYvveSK20J8UUPiNaNLHkfa5ZC', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2452),
(497, 'KB12153', 'IMAM NUROHMAN', 'KB12153@mail.com', '-', '2025-05-08', '-', '$2y$10$zNrUN9BOfPp.Jlzb/GUVi.ectbtZ6t82HVRR1sv2Wi.zqF1Xi.jqy', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2453),
(498, 'KB12198', 'RINGKO ALLANSI TENLIMA', 'KB12198@mail.com', '-', '2025-05-08', '-', '$2y$10$rhJsPBqzC6whjTelUgoaI.EtUA0azq6D0agu5aHxbMCRBAyAY20XK', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2454),
(499, 'KB12204', 'PURI MAWARDI', 'KB12204@mail.com', '-', '2025-05-08', '-', '$2y$10$FxAOZ1kU8wC2sbkpvgsByuZZy2JqQHosCyfDM4hl0.TEGKbrF1zxq', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2455),
(500, 'KB13283', 'ANDREAS WAHYU UTOMO', 'KB13283@mail.com', '-', '2025-05-08', '-', '$2y$10$/D8dLADriHi9by4QX98Ry.1ZvYa95gJ.iUiki0HYgLADfet8ArYFq', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2456),
(501, 'KB13289', 'AGOES TRI FITRA SAPUTRA', 'KB13289@mail.com', '-', '2025-05-08', '-', '$2y$10$TCNK7rKH3kJPYdwzGuMRfej3vTg16fXuZZ8uhxqIrD5GyAlDqfYXG', 6, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2457),
(502, 'KB15015', 'NINNO ZULKARNAIN', 'KB15015@mail.com', '-', '2025-05-08', '-', '$2y$10$nBLGimBHAJHxqCG0jnHka.vRwzHK6NPl06I4mDYaCdhvC2FoCnGeO', 14, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38', 2458),
(503, 'KB17020', 'ARI ANGGARA', 'KB17020@mail.com', '-', '2025-05-08', '-', '$2y$10$QbdyMn8ERrSmvzsERrfy0uGX6ehy50mXbSMs3agGPotA0YnjSWh/u', 17, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2459),
(504, 'KB17032', 'JAUHAR MUSTAFA AL FAUZI', 'KB17032@mail.com', '-', '2025-05-08', '-', '$2y$10$iMChwNpSLDWTQAknBzplb.pBx3QV5.XhOAuRPfN5FxPoDvu2PJQNO', 18, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2460),
(505, 'KB17046', 'AFRIZAL YURA PRATAMA', 'KB17046@mail.com', '-', '2025-05-08', '-', '$2y$10$2CTecrUkAY5kHfxkjXIbLe8iinC7HdTd0wkHyt/vcm3QkeRLNT3Uq', 16, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2461),
(506, 'KB17154', 'YUSUF AL KARIM', 'KB17154@mail.com', '-', '2025-05-08', '-', '$2y$10$CtV.cN.X0Ib2uSObAT/RmODmQyvIWm404RlBK6ixftqPe0K8uJ4.C', 17, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2462),
(507, 'KB18027', 'PURNOMO', 'KB18027@mail.com', '-', '2025-05-08', '-', '$2y$10$gSKL1/a3ZRqB2OTXxuwWUemJl4Uw/AFi3dInWS/nisrLh4xz/pYi.', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2463),
(508, 'KB18028', 'ABU SOFYAN ROMADHON', 'KB18028@mail.com', '-', '2025-05-08', '-', '$2y$10$1Pd/iWkjH/SYVkoOjkua3Ou3mURQAnWgmvOA2JVOUmHprFyEpPRl6', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2464),
(509, 'KB18029', 'AAN WAHYU PRASETIYO', 'KB18029@mail.com', '-', '2025-05-08', '-', '$2y$10$zWZ5SH6B2XHwbIGcUucKF.t61.DgLtgAkPC17IkPn.c9DPrgEZ906', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2465),
(510, 'KB18062', 'ADITYA ARGANATA PRIMADIKA', 'KB18062@mail.com', '-', '2025-05-08', '-', '$2y$10$z7z5w8F2un.x8123QAay0OS4oKwqtWQB3c/hp32ac1BccPgdJF2Ju', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2466),
(511, 'KB18068', 'YOGI APRILIANTA PUTRA', 'KB18068@mail.com', '-', '2025-05-08', '-', '$2y$10$dWof/RmF8KJwf3HdaM8qEuW16x41ZbfR73J/2//2QdCjj24HX0D1S', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2467),
(512, 'KB18084', 'FAWZI ADI NUGROHO', 'KB18084@mail.com', '-', '2025-05-08', '-', '$2y$10$mzxadzltTSTeetfXiUG1BeJgY2DNz4xb3uf3t9sZbH3et05PSmtWG', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2468),
(513, 'KB18092', 'ARIYO SUPRAPTOWO', 'KB18092@mail.com', '-', '2025-05-08', '-', '$2y$10$o0Cws14WJMx5trlWq8EpLe63/lEk68whQpo4vdfJaV2bdqfN/gYva', 18, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2469),
(514, 'KB19016', 'RIKHONO', 'KB19016@mail.com', '-', '2025-05-08', '-', '$2y$10$h52BBF/IXu0zk0cvIi66TOBuWQsRgBYJrahe2Yz4jAPwoTNAgiPKK', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2470),
(515, 'KB20001', 'REFANDI', 'KB20001@mail.com', '-', '2025-05-08', '-', '$2y$10$oZFomlCEQcBdfCTM3pgKRO.fb7rJtIKOFmRSoIjsGlQ8G3rDZiGoa', 6, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2471),
(516, 'KB21073', 'BACHTIAR FEBRIANTO', 'KB21073@mail.com', '-', '2025-05-08', '-', '$2y$10$5ICjU.l.9hxcQHYCCJKD3.5FIDUQhoYgmTJMrnOxRoiNb9/Crn8/6', 15, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2472),
(517, 'KB22001', 'HASNA ATHIYYA YUMNA', 'KB22001@mail.com', '-', '2025-05-08', '-', '$2y$10$2QYfKytRlP64Dt6j0STMBOoTeRXckbBZCRmDwkQKUZbboQ6MJZU0S', 17, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2473),
(518, 'KB22106', 'MUHAMAD IRFAN NAUFAL', 'KB22106@mail.com', '-', '2025-05-08', '-', '$2y$10$FjIp/621W9m8a1F90mZro.QT25xTO16uWq5PZNLNcOAMHngqAC0yq', 6, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2474),
(519, 'KB22109', 'DENI NABIL SULTHON', 'KB22109@mail.com', '-', '2025-05-08', '-', '$2y$10$2L2DcEkt1sjqqkWeJNPNJug6684Tlmbn8/WyuR5hrjY2kUax/uX02', 16, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2475),
(520, 'KB23040', 'NADER USMAN SHAHAB', 'KB23040@mail.com', '-', '2025-05-08', '-', '$2y$10$qH1frXr64dNjTJn0rCzYE.qJ5ZLkw6G.MOdY1gw1AtGki/gj6Zsri', 16, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2476),
(521, 'KB23055', 'YULAN SADEWO PUTRO', 'KB23055@mail.com', '-', '2025-05-08', '-', '$2y$10$37xNHy/E8717QgO8LdpGy.slXR9dJjMxAUGjINuGL/FNKtKBe8N5C', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2477),
(522, 'KB23067', 'MUHAMMAD SYAHRUL RAMADHAN', 'KB23067@mail.com', '-', '2025-05-08', '-', '$2y$10$iO4MrZy4pczepEiLi50cyezWnCdGNQnc4MDDXfChN.E0f3uXbppYy', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2478),
(523, 'KB23119', 'YUSUF NAUFAL FIKRI', 'KB23119@mail.com', '-', '2025-05-08', '-', '$2y$10$.enr2rsX0zdTeqcA6Um6/Ok/oJe.WsOFYJzBp6jRgqPPrGWJKZWIG', 19, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2479),
(524, 'KB23143', 'FIQIH RAHMAT TIYATNA', 'KB23143@mail.com', '-', '2025-05-08', '-', '$2y$10$r51/2Yz9HeBlAwfg5kJnL.KFr5pByM4Z0P4b6a03ow.e7VX9fnPb6', 14, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39', 2480),
(525, 'KB23144', 'LUTFI ALFAN KHOIZAAIN', 'KB23144@mail.com', '-', '2025-05-08', '-', '$2y$10$dMaG1eJC4HSpzc6vYELMcu.kLazENqX8ibur.kjHT0..upoIkREzu', 14, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2481),
(526, 'KB23151', 'M. RYAN REINALDI', 'KB23151@mail.com', '-', '2025-05-08', '-', '$2y$10$.zrblFjVJaowUnKhZqfATeH3YcYwWcT59MWHyZYxSbhEG4JPyrEb.', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2482),
(527, 'KB24002', 'SULTAN NAJMI AKBAR', 'KB24002@mail.com', '-', '2025-05-08', '-', '$2y$10$uoKZNvNGQiHQwuwKtGD0..eOOVJu..ci020jq1p8nW2ibK4SdcZWi', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2483),
(528, 'KB24012', 'DINDA AYU AMALIA', 'KB24012@mail.com', '-', '2025-05-08', '-', '$2y$10$sPTbVdYMMDOyjrZMLg.laOEPM7RWbazUXHVKfOo72y.V1sLA14rUG', 14, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2484),
(529, 'KB24027', 'FEBRIYAN NURMAS GAUTAMA', 'KB24027@mail.com', '-', '2025-05-08', '-', '$2y$10$XJ9SM15JBMtrcADTxpH7IOe14.DHGQnk7.NPUgQT6r0d09X2nAKDK', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2485),
(530, 'KB24033', 'ARIS WAHYU DARMAWAN', 'KB24033@mail.com', '-', '2025-05-08', '-', '$2y$10$aZWCO0PRytaT4LRF1qrV.OamJJO/eqbqXFecUf5.h39qrlVaFB5Ke', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2486),
(531, 'KB24059', 'AZKA FALIHAL HABIB', 'KB24059@mail.com', '-', '2025-05-08', '-', '$2y$10$x7la7tzo67zuq5AfvKC4QOwVot5KSNUXzrYrO7gvQQyhlh/climbS', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2487),
(532, 'KB24073', 'FANSA LINGGA KALIQSA', 'KB24073@mail.com', '-', '2025-05-08', '-', '$2y$10$5WLQkI0O1iUBX5V8NTziNuZR5wHI4jR5OvdXXhdysV2pzDNdbzB6.', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2488),
(533, 'KB24104', 'GHOZY TAQIUDIN AKMAL', 'KB24104@mail.com', '-', '2025-05-08', '-', '$2y$10$G7byyGFrk6YxgCuOgp4exe4e.KA.pX0a4mM2x0TeAs0utLmwk9s6a', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2489),
(534, 'KB24128', 'TUBAGUS PUTRA DHARMA', 'KB24128@mail.com', '-', '2025-05-08', '-', '$2y$10$9tj81VfdtnUieSVYzS8b9.ZUwXKfvFhOvh.l3uGjQBEqaoW1uELl.', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2490),
(535, 'KB24132', 'MUHAMMAD BAHRUL AMIQ', 'KB24132@mail.com', '-', '2025-05-08', '-', '$2y$10$BAKRoorEey21d1CbXkEIveDm9nDZPjeuxNc0i8vSHwURhBrd.pCjq', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2491),
(536, 'KB24183', 'FAKHRIZAL KRESNA QUSZANAH', 'KB24183@mail.com', '-', '2025-05-08', '-', '$2y$10$BRFYv6KzjCRWxpmo4bWaIufnm.hP3fM4FZ3uTx78uKjiQtY0UTH8G', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2492),
(537, 'KB24191', 'NABILAH ZAIDAH', 'KB24191@mail.com', '-', '2025-05-08', '-', '$2y$10$bTcvrMIkZefqrDXcqWQIheM162dNOMtGym3tROPs2A8MYGKWDrw4u', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2493),
(538, 'KB24218', 'RACHMA KARINA DEWI', 'KB24218@mail.com', '-', '2025-05-08', '-', '$2y$10$MXg6zA/UhhNo5Lb2D.lpxOFTiSFFv77ofOfepadK6sfKiDbJ3Pqvi', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2494),
(539, 'KB24224', 'RIO TOTY SAPUTRO', 'KB24224@mail.com', '-', '2025-05-08', '-', '$2y$10$vCZ6snENu/DiB9wq7xUOyuUOu//KtALc4oyGgjNNRBFBTTSXo5qTS', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2495),
(540, 'KB24310', 'DEWANGGA ADITIA', 'KB24310@mail.com', '-', '2025-05-08', '-', '$2y$10$LEPLgbfeqHqAC/tKZD/qNO5faUpByvgiv.JUKDy2JEHJfQPh/4GBW', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2496),
(541, 'KB24314', 'MOHAMMAD IBNU JAFARUDIN', 'KB24314@mail.com', '-', '2025-05-08', '-', '$2y$10$YBJuNOI5PKxoG04uyJKuyup4O/cPfQPsWpuW2s.CaLOXoEUuwS5GS', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2497),
(542, 'KB24345', 'DIAN RAMADHAN YUWONO', 'KB24345@mail.com', '-', '2025-05-08', '-', '$2y$10$tNfKtXgADzRVL4818Sz8/ea/KYJD7Ox2zGsUR1vNIg1lCiL2xjTUa', 19, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2498),
(543, 'KC10045', 'GULANG EKO CAHYONO', 'KC10045@mail.com', '-', '2025-05-08', '-', '$2y$10$HyBnrrmtzWnxFVcrJ07xRuQ1Oa2LhUrUi7g9MG00MqOyIp4nhvC5O', 14, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2499),
(544, 'KC11092', 'ANGGA FITRI APRIANTO', 'KC11092@mail.com', '-', '2025-05-08', '-', '$2y$10$5TX7QxHVsfiBnSWIU4je/OuaXFyOv5aBXfFf5CrSFtUO5G7ko5UGW', 14, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2500),
(545, 'KC11121', 'AKHMAD YANI', 'KC11121@mail.com', '-', '2025-05-08', '-', '$2y$10$wptA5yjaqyO1SQ/IZaIwTeRoSjWWhHgk4H6CqJLyioGiPAQeSUdEe', 6, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2501),
(546, 'KC12097', 'BAGUS ARIFIANTO', 'KC12097@mail.com', '-', '2025-05-08', '-', '$2y$10$YYh5s85XHQw5UxsZjdS9J.4B/EsIPJRq.DVoyDLmsrYqwCkqEgeAe', 14, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2502),
(547, 'KC13047', 'SANTOSO', 'KC13047@mail.com', '-', '2025-05-08', '-', '$2y$10$g6jRK1dQF8bVDkrWCyizFuVTGWkX8EKedsrbFed0DPRghSHFOeNTG', 14, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40', 2503),
(548, 'KC14018', 'AKHMAD YANI', 'KC14018@mail.com', '-', '2025-05-08', '-', '$2y$10$XqzQhIYnVN0vsi72eRqOjuno0QzXG.HI7fEKI/0omIgGXkiWQ2noO', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2504),
(549, 'KC15010', 'M. RAMADHAN NOOR', 'KC15010@mail.com', '-', '2025-05-08', '-', '$2y$10$z3d8A/0WhqzSZyI.bBNMBO0y3HC2uifJu7ae.1jAKsWwi4zCecmlu', 14, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2505),
(550, 'KC19001', 'MUHAMMAD RIFQI', 'KC19001@mail.com', '-', '2025-05-08', '-', '$2y$10$gw0mJLoFDwdCv3ooPh8AG.90fTFxAG9cycsK1KSy2oZUafm7z5DuO', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2506),
(551, 'KC19004', 'ZAINAL ARIFIN', 'KC19004@mail.com', '-', '2025-05-08', '-', '$2y$10$EPTmBsgKlUHvZuYhjLSx7eVRB11SOadgF3VALrdgZHL/vz7gItkL2', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2507),
(552, 'KC19010', 'SAIFUL DWI RIFA\'I', 'KC19010@mail.com', '-', '2025-05-08', '-', '$2y$10$H65KAOrAe30bgAdrjUg56u8UUYj8vMOg1FJlFpLhEBnPcaflxSMv6', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2508),
(553, 'KC19022', 'MUBARAK', 'KC19022@mail.com', '-', '2025-05-08', '-', '$2y$10$WRWekfqcmYjRJ.Z.uBSwfeiYs/7FGyYg8BSWFnsrujuV3qBQB4CqO', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2509),
(554, 'KC19034', 'MUHAMMAD RIDUAN', 'KC19034@mail.com', '-', '2025-05-08', '-', '$2y$10$wX4vZA9MClB4Bdy2m9Uxje9hCFpO3zX1Vumo5jz9e2WX.LCnHPdPu', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2510),
(555, 'KC19038', 'MUSA', 'KC19038@mail.com', '-', '2025-05-08', '-', '$2y$10$S.Dp5GQrTEbBjenTt7CsPOeNAxOteI3gzsKRPC49JDlkHVL1tepUu', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2511),
(556, 'KC19044', 'M. RIFKI NOVIYADI', 'KC19044@mail.com', '-', '2025-05-08', '-', '$2y$10$n7lkHFQh6RTfq0P/jtLNIOisbCGmJpS3Q1veVn3dsXcovDJLKuBqy', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2512),
(557, 'KC19045', 'IBNU RIYAN SAPUTRA', 'KC19045@mail.com', '-', '2025-05-08', '-', '$2y$10$68BrS083szdNWpL.LZIs/uk00NXaD8TRgYu3BusKDmYPxIaqrznY.', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2513),
(558, 'KC19051', 'MUHAMMAD RANDIANSYAH', 'KC19051@mail.com', '-', '2025-05-08', '-', '$2y$10$7V2IR3Qg75TrSAfQ1hml.eVZS9SP.IVO6qeNV.2W9HxIYUkHM7ASK', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2514),
(559, 'KC21001', 'NOOR SYAHDI', 'KC21001@mail.com', '-', '2025-05-08', '-', '$2y$10$/hMr3dPpwa997rxhJI.F1e3DgqSxMfB5RyEdZUflmfW0OdQsAvaA.', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2515),
(560, 'KC22049', 'MUHAMMAD ZULKIPLI', 'KC22049@mail.com', '-', '2025-05-08', '-', '$2y$10$M5zZmPngkZyvPgdgxNb1jOsmPHPaUC/qVotXuzVA7RMKIZ/yzVp8a', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2516),
(561, 'KC22050', 'RIFALDI HENDRIYAWAN PUTRA', 'KC22050@mail.com', '-', '2025-05-08', '-', '$2y$10$s6lyYR/sjk.5OzRKwdc8GObowJnWp8fwZ8/LFUF6Cc7MovuWYnxV6', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2517),
(562, 'KC22051', 'AHMAD RAAIDDIN', 'KC22051@mail.com', '-', '2025-05-08', '-', '$2y$10$PIOzTTblCqyTZlUq24.2qupCtJVzh2ADTtdn0SxE864wH7GjOKC86', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2518),
(563, 'KC22121', 'MUHAMAD YUSUF', 'KC22121@mail.com', '-', '2025-05-08', '-', '$2y$10$edozvFyQk9Ze0czAPrLFD.AeT.fW9988u1sXLhZyxuxV/rFXZzi8a', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2519),
(564, 'KC22126', 'MUHAMMAD TESAR', 'KC22126@mail.com', '-', '2025-05-08', '-', '$2y$10$2YSjdKQM9YekhXg6deg/SOOlkkKnsnSKdjbPIPvhdIBCbR4WEDTQ.', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2520),
(565, 'KC22127', 'MUHAMMAD BAGOES RIAD', 'KC22127@mail.com', '-', '2025-05-08', '-', '$2y$10$m/ncuDNUjYTeRWgRwlIMK.VFLoVfmPnhxMa0.8iSRUJDZIZbbIp4O', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2521),
(566, 'KC22128', 'RAHMAN ZAILANI', 'KC22128@mail.com', '-', '2025-05-08', '-', '$2y$10$y18JXWG2Zj6UOxWssktPOuvgRba73YVBVEt2oW7StVyNP3m/dIBOi', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2522),
(567, 'KD10011', 'HADI SUWITO', 'KD10011@mail.com', '-', '2025-05-08', '-', '$2y$10$SAu9UNUPXzLlQ1rDwRnPrOIx1SvloeCk42oc8ZykYLXwDfaqtS6oa', 14, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2523),
(568, 'KD10017', 'HERU PRASETYO', 'KD10017@mail.com', '-', '2025-05-08', '-', '$2y$10$RLn47VLfjKsh274AUT8n8../oaRj1V4ZbmS.JKgVlquoNruZ0rEpC', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2524),
(569, 'KD19009', 'MUHAMAD RYNO DIONANDA', 'KD19009@mail.com', '-', '2025-05-08', '-', '$2y$10$UihXqMLItYeX28Ipcv3gyOvSyzFEipf8CEWFv44J70vdAzrQ9Aumy', 6, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41', 2525),
(570, 'KD19010', 'ZAINI', 'KD19010@mail.com', '-', '2025-05-08', '-', '$2y$10$SUYptWGYO.XUeyuCGqvJn.tUWwKAXsYaKozmkmsEkKAfBtqx54MNK', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2526),
(571, 'KD19015', 'MAHRIAN', 'KD19015@mail.com', '-', '2025-05-08', '-', '$2y$10$bnwda.trFqicrNd.vpZbi.ARxjzB4txRZPUEp4CU0WmyTcNn4GOQm', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2527),
(572, 'KD22004', 'KASIYANTO', 'KD22004@mail.com', '-', '2025-05-08', '-', '$2y$10$kcQDaSBeocfSzvOxzQ2Ag.HnP50vyHJ6xx1j42X5kK4w6mazx6pue', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2528),
(573, 'KD22005', 'MUHAMMAD RHAYYAN AFWANDI', 'KD22005@mail.com', '-', '2025-05-08', '-', '$2y$10$g1pyopFS5YBX95bEprjWW.3MaRbqzl4HFkYgr76eKT84asnp5Ts12', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2529),
(574, 'KD22006', 'AGUS SAPUTRA', 'KD22006@mail.com', '-', '2025-05-08', '-', '$2y$10$.q7J9Da1B7HYBGq2YLGmIulnPM/NB5f8fyUiwuFcdC6zmmiqlucXy', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2530),
(575, 'KE13007', 'ADNAN LUQMAN SOLIKHIN', 'KE13007@mail.com', '-', '2025-05-08', '-', '$2y$10$6qCEIBmeV4.e5dYs6YS1FOcNBa/cxxEl.3nPxsOuf/dl4PPYBOhdm', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2531),
(576, 'KE13017', 'RUIS PREMONO', 'KE13017@mail.com', '-', '2025-05-08', '-', '$2y$10$NPyL3o4ZdWL8fTOQMVZFZOExWsqL56U5uVCJnhNvvSmrVY1VzO0Mq', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2532),
(577, 'KE13019', 'JEFRY MARJUKY', 'KE13019@mail.com', '-', '2025-05-08', '-', '$2y$10$R7Fl8jluh2T3yf5927UpeOOcK2k3XHqCqil2C/qMYEwedxZoJLFXy', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2533),
(578, 'KE17130', 'WAHYU PRIHATIN', 'KE17130@mail.com', '-', '2025-05-08', '-', '$2y$10$.ya4BWfghfO4F8RWJNHexOtHdSQD9wrflDYGeQ8idmigTJhdbbB7G', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2534),
(579, 'KE18053', 'MAMAD ROMADI', 'KE18053@mail.com', '-', '2025-05-08', '-', '$2y$10$AxlBFzKI4NgQLK9bSqDhNeceP4hW4LmlisfiDEgffha10OgLbK602', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2535),
(580, 'KE19007', 'AHMAD IRFAN ADI ASTOMO', 'KE19007@mail.com', '-', '2025-05-08', '-', '$2y$10$FaCBhgqtud5O17lmnemjNeTc6A75WGqrly/gE/0.m7v5EnjzdUfLC', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2536),
(581, 'KE19008', 'DEDY TRI SUTARDI', 'KE19008@mail.com', '-', '2025-05-08', '-', '$2y$10$j5HFOeJHIXsTwmTGgnBpb.LkpDcQI2F9BfLDPIXnmr9Z8bx/BVrv6', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2537),
(582, 'KE19044', 'FAJAR ELVAN RENALDY', 'KE19044@mail.com', '-', '2025-05-08', '-', '$2y$10$7HWwzbd5Ee9w1CCkkvu6D.4d/9fjAZRs1oFkjlIdKdcjMq6BN.jEi', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2538),
(583, 'KE19045', 'FRIZKY TEGAR JEFFRI PRATAMA', 'KE19045@mail.com', '-', '2025-05-08', '-', '$2y$10$CyMW7ANJCe7eb57f3zpF8OkE1E2kU2k7WYspa6pkfxumK4MKDh6pG', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2539),
(584, 'KE23036', 'DILI ARDI YANTO', 'KE23036@mail.com', '-', '2025-05-08', '-', '$2y$10$.g.mIXju8wCAQ3xkN0KIXOVb5U68WRZsKE2n8f6SPoXV8wOvGH0Oa', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2540),
(585, 'KE24055', 'MUHAMMAD ARDIANSYAH RAMDANI', 'KE24055@mail.com', '-', '2025-05-08', '-', '$2y$10$LOmtgDUw1RzO3AuELSPC..20LFxwriD0TUHXhDAtaYJ9pWBB8HoM6', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2541),
(586, 'KG21040', 'HERU ARI WIBOWO', 'KG21040@mail.com', '-', '2025-05-08', '-', '$2y$10$Pd6s16VsXrxaLhdBxTv/WOr8/iIOl/XMSFzh0r/gc5g.BPvvPRgVu', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2542),
(587, 'KG21054', 'ZUDHA FAHRUROZI', 'KG21054@mail.com', '-', '2025-05-08', '-', '$2y$10$HnbzDEgBxkju9vXL.UoTeefDtzsLHS6ZbR1a2uv4v5UWtugx9Gn4C', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2543),
(588, 'KK24078', 'ANDRI JEREMIA SIHOMBING', 'KK24078@mail.com', '-', '2025-05-08', '-', '$2y$10$NpzH720EInk/lHjB6GeTbOkzimHDbcs4RBFRYJqtOBv1RuMAKE0BC', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2544),
(589, 'KK24120', 'MUHAMMAD TAMRIN', 'KK24120@mail.com', '-', '2025-05-08', '-', '$2y$10$XXaSjCRjSzoF09qpsk7B/uaRlL0xn6nSXKwS9VYcKrdJBQ0JNVX7O', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2545),
(590, 'KL17192', 'MUHAMMAD SYAIFUL ANWAR HUBEIS', 'KL17192@mail.com', '-', '2025-05-08', '-', '$2y$10$HiX/bhe8d20C76PhHgwrXu3NOcM8vA/CsBHxjpzT.x2wkC2QrAIba', 14, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2546),
(591, 'KL17246', 'SLAMET BUDI RAHARJO', 'KL17246@mail.com', '-', '2025-05-08', '-', '$2y$10$5MYOCZEfbuEhxUUT0gyAw.uNqnpiffH9foyDV4Py4NNmOa9dPxvCK', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2547),
(592, 'KL18297', 'AHMAD SIHABUDDIN', 'KL18297@mail.com', '-', '2025-05-08', '-', '$2y$10$hfDOQRjAJkPhPtT0gqo/I.32CeH3gV3zzF7oGynQS5Nntj6ndopZu', 6, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42', 2548),
(593, 'KL22331', 'RIFAL DIANSYAH', 'KL22331@mail.com', '-', '2025-05-08', '-', '$2y$10$7EJkpe4NUWYrhU6BuTiyCebW73ZHU32T.qrycMRN4s5tBqxX5k5tC', 14, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2549),
(594, 'KL23100', 'DWI SURYANTO', 'KL23100@mail.com', '-', '2025-05-08', '-', '$2y$10$Uy5yTxsTW4Q7aYDNo9rRZOAfU99GhRsQURFq.Lxxx1FqYKQ0CuFwS', 14, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2550),
(595, 'KL23101', 'MUHAMMAD ABU MUTHOLIB', 'KL23101@mail.com', '-', '2025-05-08', '-', '$2y$10$VNy38coJy0NIybsRW/b0JeDzERc4Qpmc0TAoQXmL5XPDR.4Jjbxsm', 14, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2551),
(596, 'KL23123', 'SAHID ALMADANI', 'KL23123@mail.com', '-', '2025-05-08', '-', '$2y$10$L7Pu03cva51jMHLXK8l9a..2unFyeiU9iA.T9Ssu0LDQB91FJKoJi', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2552),
(597, 'KL23124', 'HARIYANTO', 'KL23124@mail.com', '-', '2025-05-08', '-', '$2y$10$x2EdJt2DRPi3L0Qgrs4A/esYHCkWNoqjvMjw98qFwLTnK2E2Vs5pm', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2553),
(598, 'KL23142', 'FAJAR JULIANTO', 'KL23142@mail.com', '-', '2025-05-08', '-', '$2y$10$gJbCmuuwxTo1YTkrJn/N.OenYDmuoVIFiQ63AdY.t9uhW72d0mWsW', 14, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2554),
(599, 'KL23374', 'MUHAMMAD DIVA RAHMAN', 'KL23374@mail.com', '-', '2025-05-08', '-', '$2y$10$tqQKftjzZEtHQWnEVf4VmOGOPLgHQTF5ZsumkqSoKNupfyDJfkL.G', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2555),
(600, 'KL23568', 'AHMAD HANIFUDIN ARRIZQI', 'KL23568@mail.com', '-', '2025-05-08', '-', '$2y$10$yJPd2hWqhe3GAqSslRzwZe.FXeH/KjoiaMA0iFTxq8qXCB5moQbpO', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2556),
(601, 'KL24012', 'RACHMAT IRAWAN', 'KL24012@mail.com', '-', '2025-05-08', '-', '$2y$10$2NGizXqNKZ9NXiIc/PQoje0gFd.scpe3vjQv21ZgyCnnE42hXvdsi', 19, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2557),
(602, 'KL24286', 'HENDRIK JONEDI', 'KL24286@mail.com', '-', '2025-05-08', '-', '$2y$10$.EGtYFAl0IE5Ad.TdQ7SzeFtRizWA//gvRZgwN1q6KzTISib9fJD6', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2558),
(603, 'KL24316', 'MUH HENDRAWAN KADIR', 'KL24316@mail.com', '-', '2025-05-08', '-', '$2y$10$a.aJNe8Cp9aRS7.fZ9ykEuBM6Hyv9e8/GQULinYlM/lS/3vFFjhIy', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2559),
(604, 'KL24350', 'MIKAEL PALILU', 'KL24350@mail.com', '-', '2025-05-08', '-', '$2y$10$TYwkiQigrtUfysb.E8pwPOeVSL3Jqo/gYWkGnyE0.N9a.28mPYmOS', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2560),
(605, 'KL24374', 'FRANSISKUS ARIANTO VALO', 'KL24374@mail.com', '-', '2025-05-08', '-', '$2y$10$ydm6ILzKM.3n8B1GCcw5oumjvk8ytg3Mn3v/mucmnD8X.JdaqkAFm', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2561),
(606, 'KL24377', 'ANDRY RAHMADANI', 'KL24377@mail.com', '-', '2025-05-08', '-', '$2y$10$KKEHLAm8poyA0fpm5S/wrOKAVy/mw3.8ZnoXExoP8oowSLmmlkmoi', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2562),
(607, 'KL24380', 'M SYAHIDIL MURSALIM', 'KL24380@mail.com', '-', '2025-05-08', '-', '$2y$10$rsIABAlxZ4of7cRIwUVpLeyiRc1OX1YHVZuLzoCTMRhr7Cqt0inQG', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2563),
(608, 'KL24382', 'ADI SURYANTO', 'KL24382@mail.com', '-', '2025-05-08', '-', '$2y$10$RUZ9J7lGwvZ2oKWjJKECV.WWTwnKM7tYAfj16qgekZxVTW9a8wid.', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2564),
(609, 'KL24393', 'ROMAN METSYU KADTABALUBUN', 'KL24393@mail.com', '-', '2025-05-08', '-', '$2y$10$DapQiefIovcCzN80QCih8uMCGokuN3.S2jr92bMcALot9BopR9Z.q', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2565),
(610, 'KL24483', 'JANRIANTO JANRIANTO', 'KL24483@mail.com', '-', '2025-05-08', '-', '$2y$10$yBj.0tv0QxlNATwafDadIe/mhWHfC6OB2fUjjcvcL2WUpdpfsQnWe', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2566),
(611, 'KL99001', 'HARTONO', 'KL99001@mail.com', '-', '2025-05-08', '-', '$2y$10$2twRPyuf4emIypurJpy7cuvyvu5pEWura/N618S/IDodgmkY439Fi', 18, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2567),
(612, 'KM19009', 'IVANA MAULIA RUZIQA', 'KM19009@mail.com', '-', '2025-05-08', '-', '$2y$10$tvbmuDU/t2dUWgTnKM9R/.OkRKctmRBU.qwg8C/yX0LOVrvXXHUli', 17, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2568),
(613, 'KR12002', 'YUZAK RABIN A.G', 'KR12002@mail.com', '-', '2025-05-08', '-', '$2y$10$bmhHW5iK9lQQVEF3tO.JqeCPb9wzI3WzdiNRsNKF./HLlWYhsSZEy', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2569),
(614, 'KR12004', 'JAGAU LONGOS', 'KR12004@mail.com', '-', '2025-05-08', '-', '$2y$10$ZhFgjoBE3OBMqOeoh5s/1uChe6ZeWAeQ3UyabUdB3zgwL.NIcOWne', 6, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43', 2570),
(615, 'KR13001', 'JUARNI', 'KR13001@mail.com', '-', '2025-05-08', '-', '$2y$10$zZPKGcLaUCyIYSIVgtOXt.8WIfMVbYixF.kvMLPcrLSek6y2kUJaG', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2571),
(616, 'KR13006', 'KARMINTO', 'KR13006@mail.com', '-', '2025-05-08', '-', '$2y$10$KlZ0jGGmeQsKPPCBFLjmtOsp6e.56x0uD6MJu6liHoQ4bpZ3du3Va', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2572),
(617, 'KR13007', 'PERIODE', 'KR13007@mail.com', '-', '2025-05-08', '-', '$2y$10$rlhaP3lxPBeGhXk2OSwwBuOUCpuYH8cgcfUqJvqEFX4OFR6YkgsDS', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2573),
(618, 'KR13010', 'HERRY GUNAWAN', 'KR13010@mail.com', '-', '2025-05-08', '-', '$2y$10$AMGDZEyqnsH.meUWSitigO84gXCOjJfry6iHKck6v0gGJebeitmi6', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2574),
(619, 'KR13011', 'DEBBISYAHRA', 'KR13011@mail.com', '-', '2025-05-08', '-', '$2y$10$DxBSggWi548zhshyomXODOqp.2NcttXw0I5zwpqQMg.rXcPGeYEEi', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2575),
(620, 'KR13018', 'YULIANUS', 'KR13018@mail.com', '-', '2025-05-08', '-', '$2y$10$VkmJ.D6HhBxuBxhMaLA3uuc1PNiNXXx62kk.vBvgnK5MCUMh71Vbe', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2576),
(621, 'KR13027', 'MIFTAHUDIN', 'KR13027@mail.com', '-', '2025-05-08', '-', '$2y$10$RcMJ5e13a/ed7VPs4bRRSeYbKPDR4iXdDS9739rWxEMNmTSyJo8x.', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2577),
(622, 'KR13029', 'RUSTAM', 'KR13029@mail.com', '-', '2025-05-08', '-', '$2y$10$eFp5KOyNCtJhKirDOFaxfOxNZ1faBrrmt5wdH5/H4BIcM4ExElxsK', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2578),
(623, 'KR13032', 'MUZAYIN ARIFIN', 'KR13032@mail.com', '-', '2025-05-08', '-', '$2y$10$OU7cf6K1gwU6WxhA92z2t.QNX14xlkG4Xm8YfHFJB875fNnFw/x72', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2579),
(624, 'KR13038', 'JOLIO', 'KR13038@mail.com', '-', '2025-05-08', '-', '$2y$10$kFCW7O6AxtA/Z/ArzqMwl.STc3ybWnsSivs/5pjcKIuQ2VEcDkh0i', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2580),
(625, 'KR13042', 'WALDI', 'KR13042@mail.com', '-', '2025-05-08', '-', '$2y$10$HlB7TcKVhrBKK.CBbfG/xu2pFaf3z9dkfEYHbyBLShA2wd2P0Nksy', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2581),
(626, 'KR13043', 'SURIAN EFENDI', 'KR13043@mail.com', '-', '2025-05-08', '-', '$2y$10$xdESgLbXkAAc7qz9S.WJAunsnRFiIyIYArSsJCpJwUtID6CBtATc6', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2582),
(627, 'KR13050', 'KHOIRI', 'KR13050@mail.com', '-', '2025-05-08', '-', '$2y$10$8juoQCCvxdMPdkA6Jfd3WeOlXIz6vXoIrST3sARw2AKRrPa7yJcVO', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2583),
(628, 'KR13052', 'INDRA SUSANTO', 'KR13052@mail.com', '-', '2025-05-08', '-', '$2y$10$n8em8002pgcwre7s8rafC.yYrA65PJMeD3gNXwb0XuM/XLyOnHrqy', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2584),
(629, 'KR13056', 'HITRAYADI', 'KR13056@mail.com', '-', '2025-05-08', '-', '$2y$10$6E04exXlN/UwPWf67a3mv.WeA..qSDiU8MwkVN45Pt6Ucvw39EtI2', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2585),
(630, 'KR13057', 'TOTO SURATMAN', 'KR13057@mail.com', '-', '2025-05-08', '-', '$2y$10$JSlUG4pKNYF65sIGEOjBxOdNe1mv6vOxGNieA4QmnoQANB2rJuKoW', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2586),
(631, 'KR15002', 'AGUS', 'KR15002@mail.com', '-', '2025-05-08', '-', '$2y$10$W1vdQpwhX3TkVLxj1de57OXR7dwG/y5us0sGi91hQy9M9s/mjZw3y', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2587),
(632, 'KR15003', 'AKHMAD GADAFI', 'KR15003@mail.com', '-', '2025-05-08', '-', '$2y$10$QfWX.Dadws8Pk/mUVERTze3VCnDoiISgwBHOsQJnAMKZY51nKLdbm', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2588),
(633, 'KR15005', 'FAHMI', 'KR15005@mail.com', '-', '2025-05-08', '-', '$2y$10$ktSUqNbhc3v5Rgq6fOT.c.Pe1y0u/jAIfrTulqb9VNrgrvzyHrlGG', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2589),
(634, 'KR15008', 'HERDIANTO', 'KR15008@mail.com', '-', '2025-05-08', '-', '$2y$10$0WlP5xsCdR1pOIuReRreFueLl1PjlhfIehaee1qZZAW1MUZmFXoIa', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2590),
(635, 'KR15009', 'JECSON VIKTOR', 'KR15009@mail.com', '-', '2025-05-08', '-', '$2y$10$xcpjrFVadAy4E/P66SSFJuarO89hje6OswS0kkk7x/D/fs00zixDq', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2591),
(636, 'KR15011', 'MARSELINUS LEBA BAI', 'KR15011@mail.com', '-', '2025-05-08', '-', '$2y$10$mvilTcFWRTPDcTGfbJ.HTuTsMWnbG7xAK9SdFQ3XvWKoqTGO.rAMe', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2592),
(637, 'KR15013', 'RAMLI', 'KR15013@mail.com', '-', '2025-05-08', '-', '$2y$10$YNVRrYoPH/9U6nwLJjKgr.woSxjM5DLdIL5WYy4UXgWrkXlwlySyq', 6, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44', 2593),
(638, 'KR15014', 'RANDA WARDANA', 'KR15014@mail.com', '-', '2025-05-08', '-', '$2y$10$a36dRXvPZ4qNgI2a5jA3TuZ3p9Chz5GisPshUXrcud8kYbHNaYs2u', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2594),
(639, 'KR15022', 'JAMIATUL RAHMAN', 'KR15022@mail.com', '-', '2025-05-08', '-', '$2y$10$jgrxSrykBMnjkGA2umAjNOlu5aX6Wtr5zB4CV4RnsJTeMurhFxX5m', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2595),
(640, 'KR15023', 'NIKO THOMAS', 'KR15023@mail.com', '-', '2025-05-08', '-', '$2y$10$f1QJ7A84/n7ntWNERbyilO27M7YTzYs05M5HUo3HrMUTO5t9FQg8C', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2596),
(641, 'KR15024', 'SARDI', 'KR15024@mail.com', '-', '2025-05-08', '-', '$2y$10$JOnEhN0NzgnLmj85EcgcfuNrmlsH7PV8tib9U01OMu35Kx2FRlGru', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2597),
(642, 'KR15027', 'ILHAM MAULANA', 'KR15027@mail.com', '-', '2025-05-08', '-', '$2y$10$eh/56ePOvB7nKaDE4LpWBuSv3UpQs.Q2vTu3UonIjzJMMsMUCNJmG', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2598),
(643, 'KR15028', 'JATMIKO NOPIANDI', 'KR15028@mail.com', '-', '2025-05-08', '-', '$2y$10$K9igVg9y1VSyaMS0oP3gEeAzRbWQfvJKPAC0BDOiCxHRBr3dvGOou', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2599),
(644, 'KR15030', 'KARLIANOR', 'KR15030@mail.com', '-', '2025-05-08', '-', '$2y$10$LIBympNtuIitY2EmIomWpeBEIEaW6ognK3C65bGjOzHWrVZeLiWAK', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2600),
(645, 'KR15032', 'YULIANDI', 'KR15032@mail.com', '-', '2025-05-08', '-', '$2y$10$Oe0JBrEeU0EBwXbyCUORFuD2BxKjsnpX/y3SofPCcekxytQjAV.U.', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2601),
(646, 'KR15033', 'BARTOLOMIUS WAHYU BAGUS', 'KR15033@mail.com', '-', '2025-05-08', '-', '$2y$10$Io31xuAJNrvcOVS1zMG2KOKrhUU6S4v4QsTcIKvZqQRjJKQPVqwNm', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2602),
(647, 'KR15036', 'ERICK SETIAWAN', 'KR15036@mail.com', '-', '2025-05-08', '-', '$2y$10$LRknWGTov7TLwI1SDBQxIeJO2wfvCM/x9xQEbk87x3fNf1SJ7wbAW', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2603),
(648, 'KR15038', 'AKHMAD KHAIRUDIN', 'KR15038@mail.com', '-', '2025-05-08', '-', '$2y$10$yoSB2KkT6Of3h7O5JtiZgO5mx4TOdrwH7ymxZNkR46T5gMPpenN0S', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2604),
(649, 'KR15041', 'JAMAL', 'KR15041@mail.com', '-', '2025-05-08', '-', '$2y$10$XQzIXR8.yWfTz20OkV8Pqu.IQ6sUdwH4i8Obdzyp0/KX4kY4vifdq', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2605),
(650, 'KR15042', 'RAHIMAN', 'KR15042@mail.com', '-', '2025-05-08', '-', '$2y$10$VLYfjmUax4po7/wo8Q.uj.KVGFIsMh3DX3n.UJod/RqYjfUfecP9q', 14, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2606),
(651, 'KR16005', 'ROLAND', 'KR16005@mail.com', '-', '2025-05-08', '-', '$2y$10$.zBOMdYaQGTQ1M0YqeQsWuRW3aHsazUIo5s.wrXZ1m8xRsTDBfIpG', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2607),
(652, 'KR16006', 'RUJIADI', 'KR16006@mail.com', '-', '2025-05-08', '-', '$2y$10$GdQUAYHaAhrSKPFzG0Vq2eI6ix4Fp.XHjq61tPUmZZST6VYYrlav6', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2608),
(653, 'KR16007', 'ANDI', 'KR16007@mail.com', '-', '2025-05-08', '-', '$2y$10$A9H3qeVj2T6kHRXIwdtaWOqz76aqD8afxQ.sCG2JvwORCNsLK1Q1O', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2609),
(654, 'KR17002', 'JOKO JOMINARNO', 'KR17002@mail.com', '-', '2025-05-08', '-', '$2y$10$02EbdB3HMm6TL4Hfj0U81.whon0sDYwgdBQKe3493tcHQGVHJLIcW', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2610),
(655, 'KR17003', 'MIKY', 'KR17003@mail.com', '-', '2025-05-08', '-', '$2y$10$Ej6l9Np/Ovkp3DPt.3YjiOzWNAqaT7ZKh/hD2Y66HSV8c9DeaxdES', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2611),
(656, 'KR17004', 'ALI TOPAN', 'KR17004@mail.com', '-', '2025-05-08', '-', '$2y$10$rAz4cEOoTOalHO.pwnX.uuJ43nlXI4MmcOTLlTtl4qlqDes6Ul0ou', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2612),
(657, 'KR17006', 'PARDIANOR', 'KR17006@mail.com', '-', '2025-05-08', '-', '$2y$10$bn9XyW/oL8UKrAzrUsaIweKDq7dkhNOkxntUOK9hbLl60tP3myzxC', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2613),
(658, 'KR17007', 'JUNAIDI', 'KR17007@mail.com', '-', '2025-05-08', '-', '$2y$10$37AHPlQrzUU8mvkfp/KWlO6.iSDVeCuJ8VZOYwKKS2D61j7pIF1pK', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2614),
(659, 'KR17008', 'RIAN KRISTIAN', 'KR17008@mail.com', '-', '2025-05-08', '-', '$2y$10$f/ss7zkr9UOW7ArDkgUN5OhRgEtlcAL3nElodsUdyQY2VJCEUUgQe', 6, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45', 2615),
(660, 'KR17009', 'FAZRI ANOOR', 'KR17009@mail.com', '-', '2025-05-08', '-', '$2y$10$ZRF57NpvQ8QMaHMPL1phX.6fklVNVB8flzHIQn811Ap8eQ.UPYw7.', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2616),
(661, 'KR17012', 'IGO WARJU', 'KR17012@mail.com', '-', '2025-05-08', '-', '$2y$10$v1hMP/bKAduBVFd8SUoOouNNM0B.Tj5IjIlwJyo5E5coT6GvEQx5e', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2617),
(662, 'KR17013', 'ORIMANTO', 'KR17013@mail.com', '-', '2025-05-08', '-', '$2y$10$zeOvXGXhJS13o8/XhFjgFe5kReEOhSEcoCjgxWYpUsd7/Knj1qps.', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2618),
(663, 'KR17014', 'M. RIZALDI', 'KR17014@mail.com', '-', '2025-05-08', '-', '$2y$10$cPBJcdsmf/4YPoCDuBer.O/7ybH/zzpMJ47aEMXecWNpcFrM7bA.y', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2619),
(664, 'KR17016', 'WIRO WIJOYO', 'KR17016@mail.com', '-', '2025-05-08', '-', '$2y$10$Zb8G2Y9J0/UMqvMdhxusc.joIMcIBEIN8Si2VGSfoqZ7r.r7AG/zu', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2620),
(665, 'KR17017', 'ADE KURNIAWAN', 'KR17017@mail.com', '-', '2025-05-08', '-', '$2y$10$Fam/2IkWQIZS8E9hnXblwe/ujw7ywZlORIKbTBulHVUZ//XAJQJrS', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2621),
(666, 'KR17018', 'AHMAD SUBKI', 'KR17018@mail.com', '-', '2025-05-08', '-', '$2y$10$tTZmwjaELphH1bk5X11BSuoiqgDx2qzGStouV6OzUrfmArxNZMpbi', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2622),
(667, 'KR17020', 'PRAMUDIA SANTOSO', 'KR17020@mail.com', '-', '2025-05-08', '-', '$2y$10$3XDs/Y6vn8AK57R/C4FiputlhjfIVFXCG58gS/2TBYEw5YZIRqyCa', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2623),
(668, 'KR17022', 'BENNY SASTRA', 'KR17022@mail.com', '-', '2025-05-08', '-', '$2y$10$HdU5z21ryAg/UetGS6iwGulUZptul9jkn8Kcet5JWiumsu5/.nieC', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2624),
(669, 'KR17023', 'DAYAT', 'KR17023@mail.com', '-', '2025-05-08', '-', '$2y$10$3H.DLu2TS0afcb9W578fx.OHgmAuIvC7WA65MngyLJDcgo7t.sFHC', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2625),
(670, 'KR17024', 'FAHRI GUNAWAN F', 'KR17024@mail.com', '-', '2025-05-08', '-', '$2y$10$scirwvsL5I70.uZJS7lLi.W95DuLDxgfNwI9cuVXfD1WB.L7EXKC.', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2626),
(671, 'KR17025', 'NADIO F. P', 'KR17025@mail.com', '-', '2025-05-08', '-', '$2y$10$QAUjNcxwBIkzOtDo/EDjmultEPz0vSSBTB5AOOJq1qigv6EaBqejS', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2627),
(672, 'KR18001', 'HUSIN', 'KR18001@mail.com', '-', '2025-05-08', '-', '$2y$10$aoJMVRUMOc3HmeImU0zziOzGGvFlXabsSOKsCvfSAxmyuwIdCNG3K', 14, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2628),
(673, 'KR18002', 'KHOIRUL AFANDI', 'KR18002@mail.com', '-', '2025-05-08', '-', '$2y$10$oUmWj6Dnaec4GrN.BiRoz.alsZTVxkRMFEsrkHg19URApUVUo1onG', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2629),
(674, 'KR18003', 'FUJI ISTIANTO', 'KR18003@mail.com', '-', '2025-05-08', '-', '$2y$10$bKsvO7jqmzRNb6oYtMzUaeg36ZiV8wRlIraOEDOilN0xlUpi2Tovm', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2630),
(675, 'KR18005', 'JHON EDIWARMAN HALOHO', 'KR18005@mail.com', '-', '2025-05-08', '-', '$2y$10$fRNwTZvRWEyoByZd6dglaubqBYrJYXSN.ZraCu6w532MURZoCH9O6', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2631),
(676, 'KR19001', 'DESI AULIA', 'KR19001@mail.com', '-', '2025-05-08', '-', '$2y$10$sBevTk12hJPXReYUeAdLb.rQCu/lAnLJ637qagJMGPKuRY3Ee.tKK', 16, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2632),
(677, 'KR21001', 'MARADONA', 'KR21001@mail.com', '-', '2025-05-08', '-', '$2y$10$QeY1Tbr8Rx..FmksqR4aB.OZA.I7EeMSeMr8rQTFN93WK7Ca3Na7.', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2633),
(678, 'KR21002', 'RACHMADIANTO', 'KR21002@mail.com', '-', '2025-05-08', '-', '$2y$10$gzLaWdTCw/EjmzR5p55Sie90LAdODo9qHzxPYXTUL19MzPsdWBjle', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2634),
(679, 'KR21003', 'ADITYA KRISTI', 'KR21003@mail.com', '-', '2025-05-08', '-', '$2y$10$duWl..jhN78KnVhuJZofWucIaieCkI1U8DyhE/ozuhlYzvZWbcP5a', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2635),
(680, 'KR21004', 'NORDIANSYAH', 'KR21004@mail.com', '-', '2025-05-08', '-', '$2y$10$leWahENHTzvjSF9MUgUEHee8BMFiTxXzBpVaIvpTqlmzL3J.PQk9W', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2636),
(681, 'KR21005', 'FAJAR BAGUS SATRIA', 'KR21005@mail.com', '-', '2025-05-08', '-', '$2y$10$2o7JU.lEaVtgC9fKgpqbEeJhrtU81KZl.Coj7gZjUv4pSp9d6bJqC', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2637),
(682, 'KR21006', 'INDO SAPUTRA', 'KR21006@mail.com', '-', '2025-05-08', '-', '$2y$10$6/pClsr85y0FuOpAvpkNLuzp2PZcC5lbd8PhYrPOi6.1zAibCv1n.', 6, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46', 2638),
(683, 'KR21007', 'HARMILO', 'KR21007@mail.com', '-', '2025-05-08', '-', '$2y$10$LMp4y2ekLDvTRWHWklfClOq.XtBLtOV6o77FVnO12RmG8sTYElVWi', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2639),
(684, 'KR21008', 'ALMININ', 'KR21008@mail.com', '-', '2025-05-08', '-', '$2y$10$AsXyqQd5y8rp0RpK3rncgezjm63/hGQeLUC2rfWW9xYT0ZSo9oABW', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2640),
(685, 'KR21010', 'SAPRUDIN', 'KR21010@mail.com', '-', '2025-05-08', '-', '$2y$10$R4y.Drxq10swH.G1lRW58uzUyc8IY0u.88gdVcMWU1AssAEnb6D2C', 14, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2641),
(686, 'KR21011', 'PANGKY SUWITO', 'KR21011@mail.com', '-', '2025-05-08', '-', '$2y$10$I4SuDJ7NAEjXCcI3HJcXNuDCQ3KSM2A.eH.k2Uaixu4MEWD486wr2', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2642),
(687, 'KR21012', 'SUPRIANSYAH', 'KR21012@mail.com', '-', '2025-05-08', '-', '$2y$10$lGBaD02g22d8oqAYVE4WkuRYQ46rA22bvyTwdG7FjNPBghOluCbzu', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2643),
(688, 'KR21013', 'ALDIANTO', 'KR21013@mail.com', '-', '2025-05-08', '-', '$2y$10$Og8iSSbVd/JNrM7xbdRf1Oja534.AYhYlnWoYi5.g9TX3XkoAjjTa', 14, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2644),
(689, 'KR21016', 'JAKA ROMANSYAH', 'KR21016@mail.com', '-', '2025-05-08', '-', '$2y$10$35g/8wFr8dRay/ARbvbNn.JI8Etc0J9SldY0X3nqZIg4dsYIIWaA2', 14, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2645),
(690, 'KR21017', 'BENY ARIANTORO', 'KR21017@mail.com', '-', '2025-05-08', '-', '$2y$10$oUv.VDnmkOLnji0QS4ty8.fv25FefYOxQRRKXiML9yJsCHT3r4ykS', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2646),
(691, 'KR21019', 'ERIK NOPIANTHO', 'KR21019@mail.com', '-', '2025-05-08', '-', '$2y$10$HY1Ti.leD4KIyk47/wbpy..d1BuQ.tfORDfnBvynCGO5iu.FyV03S', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2647),
(692, 'KR21020', 'WAIS ALKARNI', 'KR21020@mail.com', '-', '2025-05-08', '-', '$2y$10$foarfZX4vQQJDVV9ZLndh.zc06MLGTl7RE.mXyX20TOzIU7SZ8aP6', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2648),
(693, 'KR21022', 'HENDRI', 'KR21022@mail.com', '-', '2025-05-08', '-', '$2y$10$5P.peA4TxsUcXGHlx.mJVubOEqXVksrLaShz2S6lA9Ucgei23xDPu', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2649),
(694, 'KR21023', 'IWAN SETIAWAN', 'KR21023@mail.com', '-', '2025-05-08', '-', '$2y$10$58hETu.y20.JYceuOCPv2.Pvm1syxcDEChels5eXBSp1/yUNeUM4S', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2650),
(695, 'KR21024', 'NARKIO SUSANTO', 'KR21024@mail.com', '-', '2025-05-08', '-', '$2y$10$ksJ/rRWsgj5ulrkYVBgiQui8aX.RO78Y3twTJJvTuDmhnVEN9iCC.', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2651),
(696, 'KR21026', 'UJANG MASTUR', 'KR21026@mail.com', '-', '2025-05-08', '-', '$2y$10$MkhTcujDJT7TFU5t2R5DzOR5trlDtL902OgFL4A7zjf5jjNPTNgU6', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2652),
(697, 'KR21030', 'DOLI DEPIKA', 'KR21030@mail.com', '-', '2025-05-08', '-', '$2y$10$xoo8NbgwmVXWw97Frv4KIe1yFrbWzXsEl09E1T7sdxr99CLCP9YLG', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2653),
(698, 'KR22003', 'MUHAMMAD WAIT AL QANIRA', 'KR22003@mail.com', '-', '2025-05-08', '-', '$2y$10$pCp/bsc1AMeYddhisatudu8z//b4huJE1LvVeSPEoOsCcwX9IOJoi', 14, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2654),
(699, 'KR22004', 'MOHAMAD ABDUL RAHMAN', 'KR22004@mail.com', '-', '2025-05-08', '-', '$2y$10$AsmQd2apf3J/8tIxUIFcguAaoK3HcZIv9cPDG73ZjR3M9zBSJ6eqG', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2655),
(700, 'KR22007', 'KRISNA ARIADI', 'KR22007@mail.com', '-', '2025-05-08', '-', '$2y$10$Siw8gYtmvPtkLjq5.4/U6uqpezx/hd7Dm05x/zp.PFtQgVPk8.yDK', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2656),
(701, 'KR22008', 'RAHMAT TAUPIK', 'KR22008@mail.com', '-', '2025-05-08', '-', '$2y$10$O09vBTRXSvQjGY5zaOGwK.tWImydpUKvHws6mEVCXcVonqXYJruO2', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2657),
(702, 'KR23001', 'JAMALUDIN', 'KR23001@mail.com', '-', '2025-05-08', '-', '$2y$10$XnmgANXH7Mb/FzG9T0jbr.HFfAuSgrSnDdiFZ8QLauZTCIDh0aLWO', 16, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2658),
(703, 'KT13021', 'FERI KURNIAWAN', 'KT13021@mail.com', '-', '2025-05-08', '-', '$2y$10$p3LKWlODjI5tdHgXFLyrruEzVHk6BRFftCtWjhG7sjrsVjsBBZym.', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2659),
(704, 'KT13045', 'YUNI WIDONARKO', 'KT13045@mail.com', '-', '2025-05-08', '-', '$2y$10$WpY9NyGwzBeBmp/nQy9mfOD4nT4JZq4wdZoJYiWX7pQDfQwoj0bUe', 6, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47', 2660),
(705, 'KT13062', 'MUKODAM', 'KT13062@mail.com', '-', '2025-05-08', '-', '$2y$10$DD2qnpJW34TI87xROzlpH.Xx8fMOmDAEyPVGin2Kw1HGpIjaECtr6', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2661),
(706, 'KT13067', 'TAMAS B KARYADI', 'KT13067@mail.com', '-', '2025-05-08', '-', '$2y$10$9i4wx5qMnRgGj2/Be3q/LOob4AmQZlzn/rattnR8a4du9bPYbYJE6', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2662),
(707, 'KT13070', 'MOCHAMMAD MIRZAQ', 'KT13070@mail.com', '-', '2025-05-08', '-', '$2y$10$g02HZJ6Wb8GB3tMHWG6XPempFSLns5TzfJ4Q6ribczPU2eGmf8syq', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2663),
(708, 'KT13082', 'SINGGIH HIDAYAT', 'KT13082@mail.com', '-', '2025-05-08', '-', '$2y$10$pUvBd9Ym5MWRNmokYWESte5Ayiu/U3pHbASg/jQNUfDBx.8x6pjTu', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2664),
(709, 'KT13083', 'ARIF RAHMAN HAKIM', 'KT13083@mail.com', '-', '2025-05-08', '-', '$2y$10$ea.uTTHyU9m14z4gdtY6L.60ZPm/emj6/v1f2kHhuwtn93qm6rE8K', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2665),
(710, 'KT13084', 'ARIF SAEFUDIN', 'KT13084@mail.com', '-', '2025-05-08', '-', '$2y$10$BVKKGo0nHOC4Ltyx4/evtud2M/RY7BGhGvelm54/a7sk8VYrGkJsu', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2666),
(711, 'KT13096', 'MASUDI', 'KT13096@mail.com', '-', '2025-05-08', '-', '$2y$10$ZGerYssrcZ8yHT2OSl/jHO7i5fmehkiS3eEfPQAEwozsAHvy3amSe', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2667),
(712, 'KT13102', 'HARIYADI EKO WIYONO', 'KT13102@mail.com', '-', '2025-05-08', '-', '$2y$10$3KCVm6n8k22in0Ghf9COsOxKmDWFQaKpaJ8idS575wXof6sPZwg5i', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2668),
(713, 'KT13106', 'LATIF SUBEKTI', 'KT13106@mail.com', '-', '2025-05-08', '-', '$2y$10$4m2JeMAT3MrlCZs0mb31v.dtxney4Cgo6cfsq3JPJqi4UGWgYDvvu', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2669),
(714, 'KT13108', 'MUSLIH MUBAROQ', 'KT13108@mail.com', '-', '2025-05-08', '-', '$2y$10$CUDO1r6MYaEx8v1zpBOzguOpARp6ApZQqzztR4hUemqTzWT4/bESC', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2670),
(715, 'KT13118', 'NURUL HUDA', 'KT13118@mail.com', '-', '2025-05-08', '-', '$2y$10$JZ9sJqGJF.JrPM0W3GcCruNMAXOwWWi3lXxvlsxA.a.al9tTK.jGi', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2671),
(716, 'KT13121', 'MOH IHWANUDIN', 'KT13121@mail.com', '-', '2025-05-08', '-', '$2y$10$PlcAZpPaNjNPhMec8/OOp.r.URGGp4zehnRfgq7qyrr5RXkawG2ci', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2672),
(717, 'KT13134', 'RUDI NASIANTO', 'KT13134@mail.com', '-', '2025-05-08', '-', '$2y$10$.R0KR4eqdOnuAb9Zbx2eEurjmaBmNZ.AbICLPpf1F6G7wvc.12IKO', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2673),
(718, 'KT13135', 'INDRAYANA KUSUMA', 'KT13135@mail.com', '-', '2025-05-08', '-', '$2y$10$zguawoEIp1MYD9H2zsMpS.aKijlQwT9tpOL2KHRNqPOO5FPprXrMi', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2674),
(719, 'KT13137', 'MASHUDI', 'KT13137@mail.com', '-', '2025-05-08', '-', '$2y$10$WoGrwmF/t9yTrrytoWwfUeyP..ZdteDjvjRAsnh2b0efiG9NECSuO', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2675),
(720, 'KT13141', 'ARIF WICAKSONO', 'KT13141@mail.com', '-', '2025-05-08', '-', '$2y$10$0KjX9N6VMd1wIB2TQ2bope/nFmuKxHCWOBhB/nF2OxzyW/IcpbXlS', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2676),
(721, 'KT13148', 'HERI SUSANTO', 'KT13148@mail.com', '-', '2025-05-08', '-', '$2y$10$f6TP3/xZth4dXvmEukNrR.iGV6LJI7Wp0o2ajZZPUYDU6VZFQNMX2', 20, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2677),
(722, 'KT14006', 'AKFIAN DIMAS ARYUDA', 'KT14006@mail.com', '-', '2025-05-08', '-', '$2y$10$8QTVV7rGDcM49gXqvo2BteGaKO/ffUYtBkQf8CE/qZGrDhdj5WXtO', 14, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2678),
(723, 'KT14007', 'MOHAMMAD AKBAR RUDIN', 'KT14007@mail.com', '-', '2025-05-08', '-', '$2y$10$G88dRYebywIsUqE5Xzd/t.O0oINZDpAJEjGkKElc9QKpUbsZE2EcG', 14, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2679),
(724, 'KT14021', 'DONI PRASETYO', 'KT14021@mail.com', '-', '2025-05-08', '-', '$2y$10$gYSSz0EcyYn0w5UFHVvYoe340qARuGMYPuQ1xrFDnWqL6IbL9rH1S', 14, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2680),
(725, 'KT15001', 'EDWIN USMANANTO', 'KT15001@mail.com', '-', '2025-05-08', '-', '$2y$10$43gAr7unbpoZs95Qyh5s8e48BgaNVL1vf4TVFxdL9ebgzJrLtZsNK', 6, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2681),
(726, 'KT16005', 'DUWI FEKY ISTANTO', 'KT16005@mail.com', '-', '2025-05-08', '-', '$2y$10$umEBgXoGelceJzNT3/oqeuobbHhjr5WAWRQPRA2R8PSYj9ea.R5/y', 14, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2682);
INSERT INTO `employees` (`id`, `nrp`, `name`, `email`, `no_handphone`, `date_born`, `address`, `password`, `department_id`, `company_id`, `created_at`, `updated_at`, `user_id`) VALUES
(727, 'KT16007', 'RANDHITA DWI MARDHYANTORO', 'KT16007@mail.com', '-', '2025-05-08', '-', '$2y$10$Lsq5.7M7Zxcg/XeiFqydQOBLjs8PLYPQwh/8m3Z1zXhcoHw2oLwLy', 14, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48', 2683),
(728, 'KT16018', 'ARIF SETIYAWAN', 'KT16018@mail.com', '-', '2025-05-08', '-', '$2y$10$FmoawlFiZuzwiRuhNwnF5.dz8EwUzx5X8n7E3x6CBDBo.gykwUMUS', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2684),
(729, 'KT16023', 'MULYATUL HASAN', 'KT16023@mail.com', '-', '2025-05-08', '-', '$2y$10$gLc3Awn9r2YoebT4zwgTOOso64nDXqRJ0LNCtck9XFYpynrigDQoi', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2685),
(730, 'KT16026', 'JOKO SAPTONO', 'KT16026@mail.com', '-', '2025-05-08', '-', '$2y$10$DzcgKl0UxOEs8.apmgjPTOSyDHH9j2p5KZM0hJCbHZr2e6COI8A0e', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2686),
(731, 'KT16028', 'SAEFUL QIROM', 'KT16028@mail.com', '-', '2025-05-08', '-', '$2y$10$fcm1HVdNZ5U4rM/atesC1.sjj7uueSsohahOCA3ZPQuYMRuP0bxP2', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2687),
(732, 'KT16035', 'ARIZA ESTU PRASTIARIZKI', 'KT16035@mail.com', '-', '2025-05-08', '-', '$2y$10$b4mvOqsia9S4yyxn7dtkL.W6B4W.XliuPPD9bPf0yrrkJj/22p7FS', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2688),
(733, 'KT16036', 'AGUS SUWITO', 'KT16036@mail.com', '-', '2025-05-08', '-', '$2y$10$SJqz.hlMZqWqPYAXPnqmZO/m525i4FCokmD..dZWKsJVZyi.VDkF2', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2689),
(734, 'KT16042', 'IKHSANUDIN APRIYANTO', 'KT16042@mail.com', '-', '2025-05-08', '-', '$2y$10$GkWODsd2dbWP5v6dW9X90em8CSNfNrYymGC1IPPMz3dC63fY2J.4a', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2690),
(735, 'KT16043', 'TEGUH TRIYONO', 'KT16043@mail.com', '-', '2025-05-08', '-', '$2y$10$9TH0s9f2QwSjcZZRE9YB4u4IKJCW1/0b.zsDos3Dm8UOOY.JKxG0a', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2691),
(736, 'KT16046', 'MOH. DAVID FARID ZAUHARI', 'KT16046@mail.com', '-', '2025-05-08', '-', '$2y$10$OGRY9BzwpsNKTDPd5VfsU.1gHqFlXw7iCpeYqDSaC.uElvf5hljEG', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2692),
(737, 'KT16048', 'SUSILO ANDI', 'KT16048@mail.com', '-', '2025-05-08', '-', '$2y$10$H3bT6O80as125C81HHqo3et2hMzDfxBkWxSdXpCcqea4rUXXX67qK', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2693),
(738, 'KT16050', 'EDY SUTRIYO', 'KT16050@mail.com', '-', '2025-05-08', '-', '$2y$10$/08ivdDq9nLh5wa7xghJIuBtjrTk.NLMGQp/8cZ62tZAyy1OLzNEq', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2694),
(739, 'KT16051', 'NUR HAMID', 'KT16051@mail.com', '-', '2025-05-08', '-', '$2y$10$qwe.BEmuonaIDys16L362utFciu/IboOw6Tn/s2qTd5hTulxeTD8m', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2695),
(740, 'KT17001', 'ASEP RIZKI', 'KT17001@mail.com', '-', '2025-05-08', '-', '$2y$10$gqZFqt57V9McRRN8uS0LWefRqGcBSLLx.a9rIaqHqT79x9jeiv5Bm', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2696),
(741, 'KT17002', 'HERU SETIAWAN', 'KT17002@mail.com', '-', '2025-05-08', '-', '$2y$10$TpYfcTmQiRvlFctBwLbkFuzUCKJ99PzAmcdQo5aWAfzhB/qc/WR.W', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2697),
(742, 'KT17005', 'DWI AGUNG MAULANA', 'KT17005@mail.com', '-', '2025-05-08', '-', '$2y$10$tT.NUcuAV7rfw/I/lGrwmeDNUo.95IgJRfwyHjDjQd2tlGXr.Ts56', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2698),
(743, 'KT17011', 'DWI FATTUDIN', 'KT17011@mail.com', '-', '2025-05-08', '-', '$2y$10$BxfWrguQyF2c7eeDnTdKZOJVcPh/D3sqghQojNkpwUp5fefRzFa76', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2699),
(744, 'KT17017', 'M. WAHYUDI', 'KT17017@mail.com', '-', '2025-05-08', '-', '$2y$10$gQPU7R7LaHM1QE2ZMRrooOQRtCG0PwLpWSk4MrPwqBOK.SBW2/Ney', 14, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2700),
(745, 'KT17024', 'YOHANES ENDARTO', 'KT17024@mail.com', '-', '2025-05-08', '-', '$2y$10$Pv3.UY/pwN1zGJi1W9tnqOcVEPMEmx29fz8uR6uWYWh64L6hGkV/2', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2701),
(746, 'KT17060', 'BENY RAMADHAN', 'KT17060@mail.com', '-', '2025-05-08', '-', '$2y$10$6xJqCYH0MhnMNTfxgmlx0edGwtGKbjfRjeiyllgal.vIvWC7jfhJ2', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2702),
(747, 'KT17061', 'WAHYU ARDIANTO', 'KT17061@mail.com', '-', '2025-05-08', '-', '$2y$10$GwoAW1ck8GoQlQDVAUrXvu33ShJGFPXfv4edvOk2qHwCHGasY30pK', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2703),
(748, 'KT17066', 'MUH NUR AZIZ HAFITA', 'KT17066@mail.com', '-', '2025-05-08', '-', '$2y$10$7FevviHFiE2wyCujh11IFO/Jm8x9HYe.3o12BiTarohoQSxao2IK6', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2704),
(749, 'KT17067', 'YOGA PRATAMA PUTRA', 'KT17067@mail.com', '-', '2025-05-08', '-', '$2y$10$.dEyMWK0UEWFI9GRVuS.6Oqqp3be2Y5RsEje8za4wclUokDNgfZGW', 6, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49', 2705),
(750, 'KT17068', 'MOHAN PAWUGENG', 'KT17068@mail.com', '-', '2025-05-08', '-', '$2y$10$RbMFSzG/1Tn7yCPcXOUd3e75AY1sfzEztaO.3fxh.H3KPNDc2m6Lm', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2706),
(751, 'KT17071', 'BUDI PRASETYO', 'KT17071@mail.com', '-', '2025-05-08', '-', '$2y$10$m9fcFZx1buupeDW/8USG2e7Ui/3kBloLUymE.IR.jgEx31.I3Laj6', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2707),
(752, 'KT17074', 'JOKO SUPRIYANTO', 'KT17074@mail.com', '-', '2025-05-08', '-', '$2y$10$OAHX6LghoYG.fN14LnVWUuE3Mr3NAfa4ICwGU99ms4IuZKnBq6wky', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2708),
(753, 'KT17075', 'DUDUNG STYONO', 'KT17075@mail.com', '-', '2025-05-08', '-', '$2y$10$PKXUnJPUlJBbZQprYw89NuIw83s.8vSDU1N2OpVRtiqLGYNo89NrW', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2709),
(754, 'KT17081', 'MUHAMMAD KHOIRUL RIZQI', 'KT17081@mail.com', '-', '2025-05-08', '-', '$2y$10$U0pyOP9vXsMTPfYusuXbDu3.MU28c7d7FSKD2J5qNQcszpaztG1yC', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2710),
(755, 'KT17084', 'YULIANTO', 'KT17084@mail.com', '-', '2025-05-08', '-', '$2y$10$aiQpy4Wxc4FjgARC45tHMuLXMy61EbtVVrJYlnk1KB/VHdE3q2/VG', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2711),
(756, 'KT17104', 'DEDI IRAWAN', 'KT17104@mail.com', '-', '2025-05-08', '-', '$2y$10$tZtv0irzq3M8EFvyn83Hk./FX3R.Z0s3uJJZ4/brjiB6fx5Hy8cKW', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2712),
(757, 'KT17105', 'NURFAIZIN', 'KT17105@mail.com', '-', '2025-05-08', '-', '$2y$10$2/kWe/6tCOFYh6qJfU6MjeYixStqkPMBbPtStJF6oJyx.dekKc/Xq', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2713),
(758, 'KT17106', 'RAYUDI', 'KT17106@mail.com', '-', '2025-05-08', '-', '$2y$10$p/v841T.wxvMqDUvIoWAoOKv23eVhB6O/fTPoi0XNCQjuVl/phK.W', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2714),
(759, 'KT17109', 'DANANG CANDRIYO', 'KT17109@mail.com', '-', '2025-05-08', '-', '$2y$10$DpONoNSjtqXPgz8f/wgSfOqi9z1u0dmI1pu4.xN/XFPmr1FlWuKku', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2715),
(760, 'KT17111', 'ARIF HARYADI FEBRIANSYAH', 'KT17111@mail.com', '-', '2025-05-08', '-', '$2y$10$XgWp3CRufjUfrYfBLKnDzuPRA4CXqbOOiRDuTA3TxfIt2Rbwnfnm6', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2716),
(761, 'KT17112', 'SAYFUL PRASETYO', 'KT17112@mail.com', '-', '2025-05-08', '-', '$2y$10$VdmyQSbp827LoFCdoRgGu.uf.20wa6pWzaPmIT1g/Yf48f7pMYMay', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2717),
(762, 'KT17114', 'ADIAR FATURUSI', 'KT17114@mail.com', '-', '2025-05-08', '-', '$2y$10$LKvO8QCSYjtFw5b1NGswl.umRhTZNPdCjr97.oEzWkgFoTErZAAPW', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2718),
(763, 'KT17116', 'AGUS HIMAWAN', 'KT17116@mail.com', '-', '2025-05-08', '-', '$2y$10$25jxNtp69mg9Ng.ugoBZHuJeA0B28e.xzaE61Jmld5Kfwb/wMfHAu', 6, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2719),
(764, 'KT17118', 'MUHAMMAD RAGIL SAPUTRA', 'KT17118@mail.com', '-', '2025-05-08', '-', '$2y$10$65nTM6Tyd2Hct/Iu3z0ltOlUcGaOzATyIg/LdcPsXqM1kzS9DiFia', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2720),
(765, 'KT17119', 'MOHAMAD SAEFUL HIDAYAT', 'KT17119@mail.com', '-', '2025-05-08', '-', '$2y$10$43yZfVlcY5msDQ1AAXr0pe1mI3MPM80s8MCBwm93YE0LwyL3.tEeW', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2721),
(766, 'KT17121', 'BOGII CAHYANTO', 'KT17121@mail.com', '-', '2025-05-08', '-', '$2y$10$M6yCcEhFtqqr6L13dzJLZuagDVCKvOwCoYWzY1hquPGbfC084ieLK', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2722),
(767, 'KT17122', 'INDRAT TRI SETIAWAN', 'KT17122@mail.com', '-', '2025-05-08', '-', '$2y$10$FOi2.CVmc/7meVhA82Df6uMWLSW4.TQ4leplrFn2cvHki81h715qO', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2723),
(768, 'KT17123', 'MUHAMMAD MAKSUM ALIF NURRIFAI', 'KT17123@mail.com', '-', '2025-05-08', '-', '$2y$10$/beHmZurWdcSPmXne1eFMegiyNhss5WKjKf/rSl6/UD.crJcZQ9Cm', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2724),
(769, 'KT17127', 'AZIZ NURUSSOBAH', 'KT17127@mail.com', '-', '2025-05-08', '-', '$2y$10$Gv1besmMT3.co9MY5PpRNe2NxkJZn32UjXKjYeSEXwCt3immalh5a', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2725),
(770, 'KT17129', 'YULIANTO', 'KT17129@mail.com', '-', '2025-05-08', '-', '$2y$10$8hmJLeRKD/vgvQgKqqWUneHtNwioIQ2o0dUYJiy25AY2FF3C5ackm', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2726),
(771, 'KT17130', 'YULI HENDARTO', 'KT17130@mail.com', '-', '2025-05-08', '-', '$2y$10$GW48iLh3mgTQZct6NFdlt.dH3uAV27cvAAhR1Q51B4zcnhS0Uplk.', 14, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50', 2727),
(772, 'KT17131', 'SUWONO', 'KT17131@mail.com', '-', '2025-05-08', '-', '$2y$10$UphyNO.bNcO5CBJfB0lZ4.8MoyBRItz/sKqY.R63oGh2.UvCPRzq2', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2728),
(773, 'KT17135', 'SAMSUL IQRO', 'KT17135@mail.com', '-', '2025-05-08', '-', '$2y$10$br0ruf8QUp7zUdWGbFzx6eVBBGEyhFH6xrXpGI6QNJxIvreY9D3f2', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2729),
(774, 'KT17137', 'DONY KURNIAWAN', 'KT17137@mail.com', '-', '2025-05-08', '-', '$2y$10$o3l9ZATHjLEO24cuKlOa4OSt4ymWtq1jLIBoGRiBOzrnU9q6LZrOG', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2730),
(775, 'KT17139', 'MA\'RUF ANAS SODIKIN', 'KT17139@mail.com', '-', '2025-05-08', '-', '$2y$10$NHzIz/ci.0AA9oKioifqG.n1NZ09cyZa5X4enZFMtFUGIxW6nllt2', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2731),
(776, 'KT17143', 'MUHAMAD RAFLI AL AWWAB', 'KT17143@mail.com', '-', '2025-05-08', '-', '$2y$10$qPBNz2FX21PlLnqCf8nakuCc6d4oq8n/7owFP33870MZSeowwtVGy', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2732),
(777, 'KT17144', 'FAIK FAUZI', 'KT17144@mail.com', '-', '2025-05-08', '-', '$2y$10$0XzOqsb0xP5AC2Yqh6gXren1PLCr60F5P8O677b9nHsCzXfG.uc5S', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2733),
(778, 'KT17146', 'GILANG ADI SUSANTO', 'KT17146@mail.com', '-', '2025-05-08', '-', '$2y$10$vq8l3J7m2Xy/kaZ3atUayOY/95J4y5IZdT/52aNedG/gkQ37wUZES', 6, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2734),
(779, 'KT17147', 'MIFTAKHUL ANWAR', 'KT17147@mail.com', '-', '2025-05-08', '-', '$2y$10$JmKx6lAoaxpRxLzF80.IHOc9S1CeEqckhDsBKvLhRRVSCrWIX17ba', 6, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2735),
(780, 'KT17150', 'IRFAN KHOIRI', 'KT17150@mail.com', '-', '2025-05-08', '-', '$2y$10$ZjAP9vuWQ1mMqziRx51sTuJDS5bCz9XAabLfYFccN.3OQ1LE1urzm', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2736),
(781, 'KT17154', 'MUHAMMAD NURSAFAWI', 'KT17154@mail.com', '-', '2025-05-08', '-', '$2y$10$Mpr7Vy.ZJH4A8Ct0QpRwmewo9TIeEic0G4blYFsgOc.EqaX4lZg/.', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2737),
(782, 'KT17155', 'MARTA ANDINAWAN', 'KT17155@mail.com', '-', '2025-05-08', '-', '$2y$10$Kr8QC0TgpjaVC98QenSuseAlN3yEJigObSTlxETT.0s3c5PT3mrPe', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2738),
(783, 'KT17156', 'IKBAR SEPTIAWAN', 'KT17156@mail.com', '-', '2025-05-08', '-', '$2y$10$jwaTZK.ERq.5H9ghlAC4B.z6BD4oeTzHC9eg8X2eJdcoXrtVQMfRq', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2739),
(784, 'KT17157', 'ECHSAN USWANTO', 'KT17157@mail.com', '-', '2025-05-08', '-', '$2y$10$zqoUPPmn8htiOhpY8Hxw1.jN/swKEBf/tUzUFsaoEQXST4GO6CmW.', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2740),
(785, 'KT17158', 'ANDRI KURNIAWAN', 'KT17158@mail.com', '-', '2025-05-08', '-', '$2y$10$4T/wL0fYdcmayLtZhtUkWuiaZQSYQFWA43VsUbCMQNkEyBrrWGIaS', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2741),
(786, 'KT17159', 'IWAN HARYANTO', 'KT17159@mail.com', '-', '2025-05-08', '-', '$2y$10$7qRV/92qgsOK/ZfZgMO8dO0Wx9rVjC7e6rrztAMuBSDX.opSpLRpi', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2742),
(787, 'KT17160', 'MARZUKI', 'KT17160@mail.com', '-', '2025-05-08', '-', '$2y$10$IpnEcwyCJcdiKZYh8svClenytIKR99VFun98i2QQ7m.sWI9rybgVm', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2743),
(788, 'KT17161', 'NIRMALA FIRMANSYAH', 'KT17161@mail.com', '-', '2025-05-08', '-', '$2y$10$pw/7.F4swP.TJJJ4RnssgebQ6pdrjZfeTZfMOK42NuQbce5cIV9di', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2744),
(789, 'KT17162', 'PANGGIH ENDOTYA ARINGGALAKSANO', 'KT17162@mail.com', '-', '2025-05-08', '-', '$2y$10$zjW8ltX3ZIb7p9Nj7rLHGuq.C4Wf3af7fVduBow7WsiXHrMTh0ImG', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2745),
(790, 'KT17163', 'ABD ROHMAN YAHYA', 'KT17163@mail.com', '-', '2025-05-08', '-', '$2y$10$05aIInaYTlHjo.gdpk2ZEO8exqDGpVkYyYwR5iREOpTSi81F9RYrC', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2746),
(791, 'KT17164', 'ANDI RISTIAWAN', 'KT17164@mail.com', '-', '2025-05-08', '-', '$2y$10$Pv2HrDkCT2j4Zag9jXVVt.A.TNJqcPVvv5dW6CjcyWOELt6rb5QJm', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2747),
(792, 'KT17166', 'RIDO RIYANTO', 'KT17166@mail.com', '-', '2025-05-08', '-', '$2y$10$5u9gIVcs09mw5Jpns52Hlu5P0/ZB6V/uQ/RVk9fwgRxaFx1ALMOeK', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2748),
(793, 'KT17168', 'JOKO PRASETIYO', 'KT17168@mail.com', '-', '2025-05-08', '-', '$2y$10$YPjRV2c2Paf8z8FgmmPyW.PMpixD.eDayMvdk0k/8gPgRgyPAuAwq', 14, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2749),
(794, 'KT18002', 'WAHYU UTOMO', 'KT18002@mail.com', '-', '2025-05-08', '-', '$2y$10$TLKDYmJ.blmmHTtfgC5d2uitIR24n2LQNZf48gv2wdYmyBkJhFRiK', 6, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51', 2750),
(795, 'KT18005', 'FEBRI YOGI ARDANA', 'KT18005@mail.com', '-', '2025-05-08', '-', '$2y$10$YQ/RB4EtF3wLBldfgeACROh/0n4on/X6b750WqgupMfr3KEVjLNha', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2751),
(796, 'KT18006', 'DEDI SETYAWAN', 'KT18006@mail.com', '-', '2025-05-08', '-', '$2y$10$kmztGZgWGhlPU0QEnZ/Stefqds2HNqcrdmrffDi7xVUwW3c2f9PFO', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2752),
(797, 'KT18007', 'WAHID NUR MUSTAQIM', 'KT18007@mail.com', '-', '2025-05-08', '-', '$2y$10$yXPCakl3J/gP3QN0v7vHBepNB/QS915pTIoplBhfoZBL2aChIg9Fi', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2753),
(798, 'KT18008', 'BAYU ARIYANTO', 'KT18008@mail.com', '-', '2025-05-08', '-', '$2y$10$jOjE/RZCIa0LWunXoFiUtOPLxSXGRqZmRYpBiLzNt6795hH3eudXK', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2754),
(799, 'KT18009', 'GANETA HAMDANU ALFIRIANTO', 'KT18009@mail.com', '-', '2025-05-08', '-', '$2y$10$C1JHhKMEVUdbVTKzk.LR6uUTKvTVIkyClpLWhpgthCgoJ729BZgTG', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2755),
(800, 'KT18010', 'NURUL FAJRI', 'KT18010@mail.com', '-', '2025-05-08', '-', '$2y$10$Q75SyqwAKAuuU.ObeBV2BeR8k.Fozbw6v8jROfMhgaLS2Yo0PTpu2', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2756),
(801, 'KT18012', 'ALLEX WAHYU SADHODHO', 'KT18012@mail.com', '-', '2025-05-08', '-', '$2y$10$pyTq5sbgiyyzBkWkF9yslu5C3TklQrtwwavfSptMM0KmD4GnB2YCi', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2757),
(802, 'KT18013', 'DAMAR HIDAYAT', 'KT18013@mail.com', '-', '2025-05-08', '-', '$2y$10$yX8lx4LSgccR9eJbttE3LOVSCHBWtaZXHV93D0jXZyguSBtDBSrBq', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2758),
(803, 'KT18015', 'MUHAMMAD SANI PRASETYO', 'KT18015@mail.com', '-', '2025-05-08', '-', '$2y$10$EcE2dSwCCCyWTrJxm3bU1upefefwELWaDipNnW0r5tCDuKxpE8M3O', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2759),
(804, 'KT18017', 'YOGI MULYANTO', 'KT18017@mail.com', '-', '2025-05-08', '-', '$2y$10$HlP6UhyF4Kwh0TnILzN37OHH1j.qLSXC1Ud3.cFYTt9zCk6vWLe0K', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2760),
(805, 'KT18019', 'DANI IRAWAN', 'KT18019@mail.com', '-', '2025-05-08', '-', '$2y$10$yPaKpDwLa7YO05rQDhZAZO0PGOENPEEHzjsXjtC.15.g9FPKjUd6K', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2761),
(806, 'KT18020', 'MUHAMMAD ABDUL AFIF', 'KT18020@mail.com', '-', '2025-05-08', '-', '$2y$10$t6VaNCSa5jaYVAhIQ1C/Ees3UrkESf0/MPuhlImuPYD/JWnOHhBE2', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2762),
(807, 'KT18022', 'BAGAS FAHMI KHOIRUDI', 'KT18022@mail.com', '-', '2025-05-08', '-', '$2y$10$zIpa2RBI3RqOFaQBMiVL4.pFwhBe2XHuuouS/JvYZz8Rm1hscgfDu', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2763),
(808, 'KT18023', 'IRFAN NURUDIN', 'KT18023@mail.com', '-', '2025-05-08', '-', '$2y$10$wGaxP3i6zMpFB0GAIfIVFeH.htlWigKo0YoFN4.h13Pr9rqtx1L5u', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2764),
(809, 'KT18025', 'FERI MIFTAHUDIN', 'KT18025@mail.com', '-', '2025-05-08', '-', '$2y$10$UenSJ5VqF8AoJwwMA47DuecefxsvVcoQEgY/fVDliJ9yOhcxIba8a', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2765),
(810, 'KT18027', 'DEDI ISWANTO', 'KT18027@mail.com', '-', '2025-05-08', '-', '$2y$10$FuBN8CCA2l2kS3k9PFdG4.AT0CvrGQgjBTtoQjRHBXnPqZ7jxLsNG', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2766),
(811, 'KT18030', 'MOH. TOFIK NAWAWI', 'KT18030@mail.com', '-', '2025-05-08', '-', '$2y$10$W/UilDdCa98btrSVffyuVOXWZ6Aed6WHL/iialAKI00htSOpQhP8q', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2767),
(812, 'KT18032', 'DIRYANTO', 'KT18032@mail.com', '-', '2025-05-08', '-', '$2y$10$lvtb82DFV35.J7kKHhOoDO8Pz4XLxJjKVaLkeLVqzJzWB8D.OWge2', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2768),
(813, 'KT18034', 'FERYANDO SAPUTRO', 'KT18034@mail.com', '-', '2025-05-08', '-', '$2y$10$ml13Sbn.CEtRS/sgmvLuaux1WhtgK8g.frL4NZeMw4HfRjmN532Rq', 6, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2769),
(814, 'KT18035', 'RIZKI WISNU NUGROHO', 'KT18035@mail.com', '-', '2025-05-08', '-', '$2y$10$j7qGbr6bPZFghVTggwrnaerEM4.7zWCFNXYCT72tKYBSOwjC2aCNW', 14, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2770),
(815, 'KT18036', 'RENO NOPIYANSAH', 'KT18036@mail.com', '-', '2025-05-08', '-', '$2y$10$24ZOB7z6..etdgcrsavrAu7X03N.1ZL0EUT95G6DWmW7Q.Wqul4u6', 14, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2771),
(816, 'KT18037', 'PUJI RIYANTO', 'KT18037@mail.com', '-', '2025-05-08', '-', '$2y$10$EP54v/Dzj29X/PpPEGCbBuwRPBe1JuzGdJWEYEEaZPqG9Hjd4CnOW', 14, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52', 2772),
(817, 'KT18039', 'MUHAMMAD AHZAN FAUZI', 'KT18039@mail.com', '-', '2025-05-08', '-', '$2y$10$e1tYXGHRoBIT1rE7ZYe68uMW6F3tunG2343JQR8GbTFcw7qzwlnJW', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2773),
(818, 'KT18040', 'JOKO PRIHATIN', 'KT18040@mail.com', '-', '2025-05-08', '-', '$2y$10$rZKMVrUKmtoBfvEWMoe2heTJx6gNwUNuRalo0PKWcCb.MZGCilNKi', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2774),
(819, 'KT18041', 'DICKY FRIDAYANTO', 'KT18041@mail.com', '-', '2025-05-08', '-', '$2y$10$Z2Fin4qlWak/HdnVwZ9CS.DfzeqyF8IMl5KDlWVkhRkqs8.d66.uS', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2775),
(820, 'KT18042', 'ARIS PRIDANA KUSUMA', 'KT18042@mail.com', '-', '2025-05-08', '-', '$2y$10$XbVxIWRA5Ws.TvGs92OF0ur.GhT9zAaYyF2PC1VkH59/bh4AA3jgq', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2776),
(821, 'KT18043', 'RAHMAT ZULFIKAR', 'KT18043@mail.com', '-', '2025-05-08', '-', '$2y$10$G681tBLQm.gpdCw9Bp7WfuNT6rgfLD9atPBEjJqKClXRXSiT4/F/2', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2777),
(822, 'KT18044', 'AHMAD PUJI RIYANTO', 'KT18044@mail.com', '-', '2025-05-08', '-', '$2y$10$.lsBxhIRSFJXcpMlC3jw1e0l03wdqqOFHdWB2Iw2ThUYLscDH3Xk6', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2778),
(823, 'KT18046', 'BAYU PURNOMO', 'KT18046@mail.com', '-', '2025-05-08', '-', '$2y$10$QQT7YqgUH6C6QhLs4MxJIOswEPRPh3.Tu9LPIea8BBUonGBETIGyu', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2779),
(824, 'KT18049', 'MARETDY KASRUCHIK', 'KT18049@mail.com', '-', '2025-05-08', '-', '$2y$10$1ffDvM.bhrwZaEBBLitrNOWxCJ5ulIboPbsqovr2Of0w4qLc.Ezsu', 14, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2780),
(825, 'KT18051', 'SURONO', 'KT18051@mail.com', '-', '2025-05-08', '-', '$2y$10$2GA.S2t1a8JmnNBUjjnnteO/Efoi/.6a4JAVTUXcyXGYhoHB9whiS', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2781),
(826, 'KT18052', 'NUR SAJIDIN', 'KT18052@mail.com', '-', '2025-05-08', '-', '$2y$10$haodSP460.T5PXNeoi.3VOjIGdZmwor0DMSUBIs6Vyt9390L4nqhq', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2782),
(827, 'KT18054', 'SYARIF HIDAYAT', 'KT18054@mail.com', '-', '2025-05-08', '-', '$2y$10$kO5g7G/005CrG.cGu/3Cz.LdJL.hA9KV4htre7zCqHV1pcf6WQMKy', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2783),
(828, 'KT18055', 'WAWAN SETIAWAN', 'KT18055@mail.com', '-', '2025-05-08', '-', '$2y$10$0sYfis0mMJCVjinFtocCnuSjmNNVTmlZdYHryv/fd5ZBOfugzENh2', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2784),
(829, 'KT18056', 'KUSNOTO', 'KT18056@mail.com', '-', '2025-05-08', '-', '$2y$10$s8oQah2q1Y5Ij8wG7lrqVOZ6VWKfeCtMQxLKyqaO5e.m54QzjPfrO', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2785),
(830, 'KT18058', 'MUNAWAR SOLIH', 'KT18058@mail.com', '-', '2025-05-08', '-', '$2y$10$5TlEV309lHYB0EFl5jqfcOIYj421tousM3RnEgD9IG67edXa8vV9q', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2786),
(831, 'KT18059', 'IYON PRATIKNO', 'KT18059@mail.com', '-', '2025-05-08', '-', '$2y$10$pVjodPUoWg.gU2G7ufyvA.gNX3sM4nx8o420jc7nVLy9LQfoGnLRi', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2787),
(832, 'KT18060', 'MARIO ARIYO WIDODO', 'KT18060@mail.com', '-', '2025-05-08', '-', '$2y$10$hZOodjjRnLyW2DSzY.nAU.bbiRWCxfl1W/uTiKlrvhZGbq6aMWAEa', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2788),
(833, 'KT18062', 'ADETYA TRI UTAMA', 'KT18062@mail.com', '-', '2025-05-08', '-', '$2y$10$LsKKo5pM/fLd2RbxmH4JkegXI58cspJ6ZIRu/gBlLYcTXCSE/3K1.', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2789),
(834, 'KT18063', 'DIMAS OKHY DEVA PRATAMA', 'KT18063@mail.com', '-', '2025-05-08', '-', '$2y$10$RUul/H2ezTFGOhLo4/MgNegQI02huuRUJCZ2iUDn9NJZXafsz.QGq', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2790),
(835, 'KT18064', 'IKHSAN WAHYU TRI PURNOMO', 'KT18064@mail.com', '-', '2025-05-08', '-', '$2y$10$tJ5JXWO59JQyXUK.mfMD/eMg5EiHN05fmXMmpmydJEERytFDLQTwq', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2791),
(836, 'KT18065', 'IRWAN SETYAWAN', 'KT18065@mail.com', '-', '2025-05-08', '-', '$2y$10$E46gTUUzhR4rqaA97bTU6e63pkw9yQiltzWjyFSgEGx.n66W95jXG', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2792),
(837, 'KT18066', 'LEONARDO ALEXS NUR ALIM', 'KT18066@mail.com', '-', '2025-05-08', '-', '$2y$10$w4Aw3BdC65UeXEdqssA3KOjd71IEn7ucVvXD/.EAKJIaVYO7S5wPG', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2793),
(838, 'KT18067', 'NANDA ADI PRADANA', 'KT18067@mail.com', '-', '2025-05-08', '-', '$2y$10$uVPp2MU4rYPNUNFfG1bxueFUMXdJxD7F995yr3C0..4qEOevQ3MsS', 6, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53', 2794),
(839, 'KT18068', 'REINALDI FAHRI SETIYAWAN', 'KT18068@mail.com', '-', '2025-05-08', '-', '$2y$10$JKNckdDaUk/VQaSuW4t/je.x2vD/qY0HRYWDfUEXo1aSGTGTLTLLu', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2795),
(840, 'KT18069', 'SETYO BUDI UTOMO', 'KT18069@mail.com', '-', '2025-05-08', '-', '$2y$10$vPRhWjACg8oCrp59YtbgKeMV7wwovI75rFpkcuvuApw9YBJ0OisCu', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2796),
(841, 'KT18070', 'YUSUP PRAYOGO UTOMO', 'KT18070@mail.com', '-', '2025-05-08', '-', '$2y$10$U1ZppfsBMGEjTBQ94Ub2x.wl/MCGXKR.gP/YJPSLtq7d9LVBEOkL2', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2797),
(842, 'KT18072', 'FAIZAL ANAS AL AZIS', 'KT18072@mail.com', '-', '2025-05-08', '-', '$2y$10$bWfcIGNG1ae/SAjXy9Rfv.Td95IuwIfAhMemzMNRkZpStjJHQNG1e', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2798),
(843, 'KT18075', 'AGUNG KUNCORO', 'KT18075@mail.com', '-', '2025-05-08', '-', '$2y$10$r9SJGOoTvG4gjziYmgQ6N.TO0zcltjJtFXkS9LP5y5dKfGWSCOK6C', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2799),
(844, 'KT18076', 'ANDY PAMUNGKAS', 'KT18076@mail.com', '-', '2025-05-08', '-', '$2y$10$0FXMM1OCbH/lX7BybrbbLeQ7ODCdX6oyKw0N8arBX5abYk29o1HEG', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2800),
(845, 'KT18079', 'MOH YUSUP', 'KT18079@mail.com', '-', '2025-05-08', '-', '$2y$10$17oDgxZRmk5.im4pPFc8ruRo8j0gdn8rInaNn2/bLqWAHTJOyMzfS', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2801),
(846, 'KT18081', 'WELLDA ROY FERNANDO', 'KT18081@mail.com', '-', '2025-05-08', '-', '$2y$10$ie0euQcAg6uo2FiQoiY.MOecMAuRZeVM5GhfsJvKYbMD8oSivlE9a', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2802),
(847, 'KT19002', 'MUHAMMAD SHOLEH', 'KT19002@mail.com', '-', '2025-05-08', '-', '$2y$10$gfyquzN4aOfPorBc4M.WTeF.7kEIW83XV.l9S2bvees7EfrO09g8O', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2803),
(848, 'KT19004', 'MUHAMMAD APRIL LEA PRATAMA', 'KT19004@mail.com', '-', '2025-05-08', '-', '$2y$10$iqbSUBhUAtIDDvJf0Eo9p.Wvqh6C8YFWVSjeDC6M6.yBOjNj9Za2K', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2804),
(849, 'KT19005', 'RONAN FERDIAN', 'KT19005@mail.com', '-', '2025-05-08', '-', '$2y$10$./O8oD1rbx9GsF.EnZVMZ.iLfFDQlvRH6BDOW1v6I6kbUvU/NBuMi', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2805),
(850, 'KT21001', 'HARIS SETIAWAN', 'KT21001@mail.com', '-', '2025-05-08', '-', '$2y$10$KHXPZ8XywezBADXyh3e.beS1pUJZA2OQFSHH2naWP5v5J9essMmZ6', 14, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2806),
(851, 'KT21002', 'TUTUS BANGUN ARDIANTO', 'KT21002@mail.com', '-', '2025-05-08', '-', '$2y$10$2o5PH6WRHgqnnKudjsTUkugRncQ6Q7R0fhdfhj9zf2aL/22mY7Vae', 14, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2807),
(852, 'KT21003', 'ABD. ROHMAN DWI SANTOSO', 'KT21003@mail.com', '-', '2025-05-08', '-', '$2y$10$5MEFr1rAAs0iHIxZiOWNN.owspIz3H7rr16lk3YepqBWqJSIEABN2', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2808),
(853, 'KT21005', 'BAGUS CATUR FEBRIANTO', 'KT21005@mail.com', '-', '2025-05-08', '-', '$2y$10$Ki6nXMZF1a1jTRzNBXIQ2..gMmIzJx8wqSZNQov9xYczgdAqGE6Pu', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2809),
(854, 'KT21006', 'BAYU AGUSTIN GUNAWAN', 'KT21006@mail.com', '-', '2025-05-08', '-', '$2y$10$4Rc2Im2aHym3aN.3cZLt/eznu6YIVSr8G.h/46LPsWgx3JUkYoDKe', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2810),
(855, 'KT21007', 'MOHMAD PANCA SANDI PUTRA', 'KT21007@mail.com', '-', '2025-05-08', '-', '$2y$10$LE8WUlBKh7ShM3EHww0Syur7l544ciIi5SQEaxutOVXpqSOipWrEe', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2811),
(856, 'KT21008', 'RIFAI BAHARUDIN', 'KT21008@mail.com', '-', '2025-05-08', '-', '$2y$10$5BnpYf4HVWXy.a4NcYxZHudu583F40Qrsfj37sg6MNfngyoBJsGBW', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2812),
(857, 'KT21009', 'RIZQI PRAYOGO', 'KT21009@mail.com', '-', '2025-05-08', '-', '$2y$10$AjOR5mTKuP5Bb1rGzuh2IOdo3YxjJQIgrPFpY87rZHwCxrl2b7hsC', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2813),
(858, 'KT21010', 'SANDI ADI NUGROHO', 'KT21010@mail.com', '-', '2025-05-08', '-', '$2y$10$yX8y/oZpdrBz6K15JjZ71OfvTg/nr5mK/FMp.djXTW6x.JsKgTWWu', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2814),
(859, 'KT21011', 'SURYA DIRGANTARA', 'KT21011@mail.com', '-', '2025-05-08', '-', '$2y$10$rC6F8Tz5eIRk6xnBDJLfzOZoFfKkaGgu5OajcpTiado8H5vkzl07S', 6, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2815),
(860, 'KT21014', 'MUHAMMAD WAHYUDI', 'KT21014@mail.com', '-', '2025-05-08', '-', '$2y$10$aKUEpUBldkgVW0/k0NzzEe6/G/eMUA4b9Q.GjG4oyFrQRCHj9bzz6', 14, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54', 2816),
(861, 'KT21019', 'MUHAMMAD RIFKI ALWAN', 'KT21019@mail.com', '-', '2025-05-08', '-', '$2y$10$jeMH18EdzNqft25VpbTxaezMhxd2Rhaxy9p5mXps.5Zun6yj9vl0u', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2817),
(862, 'KT21021', 'NANANG ANDRIA', 'KT21021@mail.com', '-', '2025-05-08', '-', '$2y$10$UYOW2sKCmST1mkdnF7KNvepcnhbIfoF2urZLAHkurE2fmQvGmIHTi', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2818),
(863, 'KT21022', 'PANJI SAPUTRA', 'KT21022@mail.com', '-', '2025-05-08', '-', '$2y$10$9m6Tak804U87sW3z7Aaa4eq7uv7h43nsY/4LvkCAJJ.RoonZqfPom', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2819),
(864, 'KT21023', 'ARIF ADI PRASETIO', 'KT21023@mail.com', '-', '2025-05-08', '-', '$2y$10$crhK93ayHTzvVIjKfpMQrOZpZdDE6sSE8yZZTd1pdP.UBoj6E0d1a', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2820),
(865, 'KT21025', 'TRI SUWARNO', 'KT21025@mail.com', '-', '2025-05-08', '-', '$2y$10$4FhZKeuaeXq8tNTSuin6leTLaC5PDvsrulYpFOuauh1FaSUSgfNOG', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2821),
(866, 'KT21027', 'NUR KHOLIS SAPUTRA', 'KT21027@mail.com', '-', '2025-05-08', '-', '$2y$10$QHJGTn/dRThcJc1OOmBLS.BhrFEN7YyDHOVKCx9W6IjNnm9sJfAQS', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2822),
(867, 'KT21028', 'KEFIN GUNTUR PRASTYA', 'KT21028@mail.com', '-', '2025-05-08', '-', '$2y$10$Nk8H9zlTv4iRGVh6Swmf0en2I2kUu399XMA61T4.8lmETH4UGzWkG', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2823),
(868, 'KT21029', 'IMAM MUSTAQIM', 'KT21029@mail.com', '-', '2025-05-08', '-', '$2y$10$xze.QsYYnXOWSW2SVIpE2ujOwAcvTIZ8xCtBJn1QmzRaeJPgp/TXy', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2824),
(869, 'KT21030', 'MOH.AGUS SAFRUDIN', 'KT21030@mail.com', '-', '2025-05-08', '-', '$2y$10$4tCymA.yyyBmw13MluLBX.EoFkf4tMt75aJxwiGj57HpovWJSLFDO', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2825),
(870, 'KT21031', 'JOVAN ALI FATONI', 'KT21031@mail.com', '-', '2025-05-08', '-', '$2y$10$f0rleiLwvu1sLqmntwPJ0uDmGV694ZT4M.PktDw1lNz7qQF4K1blq', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2826),
(871, 'KT21032', 'ALI SUPRIYANTO', 'KT21032@mail.com', '-', '2025-05-08', '-', '$2y$10$MIi1d244odUyws0dQVOnnOkC/tOzI5SN5szO.mcX6OQJ4EJ759R8e', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2827),
(872, 'KT21034', 'ANTON ANDRIA PRIO UTOMO', 'KT21034@mail.com', '-', '2025-05-08', '-', '$2y$10$1CmXIUq2ma/xq.tCxrWhceDEMIRQH.Hdet8EMz22.EU3BoOPl/MV2', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2828),
(873, 'KT21035', 'ROFIANTO', 'KT21035@mail.com', '-', '2025-05-08', '-', '$2y$10$AA.jJo.PRPjDJ35SwtqEm.1eet9jYgihnPU.KjOOMQCQfHAafTOHK', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2829),
(874, 'KT21036', 'AGNESTI INDUL', 'KT21036@mail.com', '-', '2025-05-08', '-', '$2y$10$ls4A3/Rzt0htSlsm2EJeAu/K4va.m4MMrrJl4cc0ePYzaJcDzsswC', 16, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2830),
(875, 'KT21037', 'DJALU YUDHA PARASDYA', 'KT21037@mail.com', '-', '2025-05-08', '-', '$2y$10$jjwlgH15jTBJ8DMmx3Ecq.LwEptar0EcQXlue9N/r.57T9eBmrWq.', 14, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2831),
(876, 'KT22001', 'WAKHID NURYAHYA', 'KT22001@mail.com', '-', '2025-05-08', '-', '$2y$10$rOUo/mQybydtXImaaVcNJObYwlg.g3Fv9JWnsNnElAzgOQKViYici', 14, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2832),
(877, 'KT22002', 'AHMAD APRIYADI', 'KT22002@mail.com', '-', '2025-05-08', '-', '$2y$10$W.LWhnMaPE2mvgY3L/8FK.XWahwCRHuyCtHJDYEgZngbhZE043iQ.', 14, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2833),
(878, 'KT22021', 'SABAR PRIYANTO', 'KT22021@mail.com', '-', '2025-05-08', '-', '$2y$10$RzXjpuVLGh7PJwsVP7rZru/Cck7wXmd42HU8RCXtMWqna4WDbnVa2', 14, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2834),
(879, 'KT22025', 'ALIMANSYAH', 'KT22025@mail.com', '-', '2025-05-08', '-', '$2y$10$lygaTt4ZLgaLTzqFtb800ueT9s1iwu4FCxDlxuiNAadBjB965ccfa', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2835),
(880, 'KT22026', 'MUHAMMAD DWI SEPTIAWAN', 'KT22026@mail.com', '-', '2025-05-08', '-', '$2y$10$zANPaaLyDR5TP4fkSMDXyegSNAF9cIiQNrwrn5nWuNNrYlx.YJ902', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2836),
(881, 'KT22031', 'AGUNG SUGIYONO', 'KT22031@mail.com', '-', '2025-05-08', '-', '$2y$10$BE6VuJHr.dCd3WV/nVh2D.qw687D6uAW.ROgkCNGwdvQPwc2txGZu', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2837),
(882, 'KT22032', 'MIKA DWI SATYA K', 'KT22032@mail.com', '-', '2025-05-08', '-', '$2y$10$oL0Vma38Mi3AbKrSgzKdWO237.PJBSXbXnNTmXi/PuWgKQQF3.SVC', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2838),
(883, 'KT22033', 'ROBINSON SIAHAAN', 'KT22033@mail.com', '-', '2025-05-08', '-', '$2y$10$CoMw31XVtYV5CCyzKH3Hbe973qdZ0jOhjv7AYbtyqasWrfVN9PvAa', 6, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55', 2839),
(884, 'KT23002', 'FERI ANDI SETIAWAN', 'KT23002@mail.com', '-', '2025-05-08', '-', '$2y$10$LvjmyYwLidi8pHJik89yW.wiQ5CDnDrAA1pdlpygk40V.miizcnbe', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2840),
(885, 'KT23003', 'GUNTUR AJI', 'KT23003@mail.com', '-', '2025-05-08', '-', '$2y$10$G8aWo5NBphO.A022lmn9/eeO/b7qow6S4NBHARpF6miPil7IstVE2', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2841),
(886, 'KT23004', 'M. FAIZUL AMIN ARRAISI', 'KT23004@mail.com', '-', '2025-05-08', '-', '$2y$10$0..n8kWhriq82798YQCgbOgQCKTRrMS5v/iFb/CUUFwXWmHsp8I2K', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2842),
(887, 'KT23005', 'TINO ARIF MUNANDAR', 'KT23005@mail.com', '-', '2025-05-08', '-', '$2y$10$zNQVI1p5JKh3cSGqZIp.Eu1mjQ.nP/oxe31cjkSoyeE7EbzPdj0ya', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2843),
(888, 'KT23006', 'GERALDY  NAGUSKA WAFA', 'KT23006@mail.com', '-', '2025-05-08', '-', '$2y$10$aLEGwb7bXNfbR7Un1wbLO.iKE6qiD6USIZf3uKus6V8wBODWzik5i', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2844),
(889, 'KT23007', 'HERRY ISWANTO', 'KT23007@mail.com', '-', '2025-05-08', '-', '$2y$10$Nnx0bsEXgUJP.kbtnDd6P.j3lCV6aLPiOLfo5Go6NgdAzznL0WhbW', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2845),
(890, 'KT23013', 'THEOFANNY ABSYALOM', 'KT23013@mail.com', '-', '2025-05-08', '-', '$2y$10$PU.Zes3kMKxOhLPoyIoLWeocOK/5RL8nZTrtRFBuRSnHxMiJBhBFe', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2846),
(891, 'KT23014', 'M FAUZAN RIZKY ZAKARIA', 'KT23014@mail.com', '-', '2025-05-08', '-', '$2y$10$c8aMWw2SPft6wMO32ZbcDuvYVNJE0dDV5v.Dc.8jyw6bABZsqyVZm', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2847),
(892, 'KT23017', 'RIAN NURAHMAN', 'KT23017@mail.com', '-', '2025-05-08', '-', '$2y$10$cP3/TJi9V50IuO5uPw9MXeVcQuTjMb.hHSV77zRXfEBI1J6svRqSi', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2848),
(893, 'KT23023', 'JEREMY SAGALA', 'KT23023@mail.com', '-', '2025-05-08', '-', '$2y$10$AaeakusRZBE3sSe..NTzrOCVB432YWB6ZJdwGAL9V48ShaaE1CD02', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2849),
(894, 'KT23034', 'ARJUN WAHYUDI', 'KT23034@mail.com', '-', '2025-05-08', '-', '$2y$10$NtWb1BYOFwnI3WskjXWy..yIpriew7/CIq3RYaA2j6jMhquYutrFO', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2850),
(895, 'KT23035', 'AHMAT FAIZIN', 'KT23035@mail.com', '-', '2025-05-08', '-', '$2y$10$UKMWbzngadV3bavCbDt4Du4yDkNBs1AJABcsTn0hlgoL4yJgsDcWa', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2851),
(896, 'KT23043', 'ABDUL HARIS', 'KT23043@mail.com', '-', '2025-05-08', '-', '$2y$10$7.0PDi8FjrgY5oGx6H1A6eL6DyHGyBPzBiwGEiavLZcJIS14YnChK', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2852),
(897, 'KT23044', 'JUPEN PURBA', 'KT23044@mail.com', '-', '2025-05-08', '-', '$2y$10$xyj8ZpqDrOwJ/VvR6cNd..KuB3838IFc1.Xd4FhMMXFGAfS3063aC', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2853),
(898, 'KT23046', 'FAJAR FERDIANSYAH', 'KT23046@mail.com', '-', '2025-05-08', '-', '$2y$10$AyPaN4M65bjXXYW7C/Xi2OTQlre9EvqnTGPHSMLIy72jokQQvlMZ6', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2854),
(899, 'KT23047', 'DEO RIVALDI BAYU YUARISUNA', 'KT23047@mail.com', '-', '2025-05-08', '-', '$2y$10$wwG50P7tfAeyFKy0yGLRbucqO8FB6nnNo64FN07DTqP2Ax041drH2', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2855),
(900, 'KT23048', 'HANGGISA ALFA RISKI', 'KT23048@mail.com', '-', '2025-05-08', '-', '$2y$10$Bnr6TChPpz7gbZfLCvV4..kl7.j3u20m/0f57sspeP.qMMuc/Kqa.', 14, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2856),
(901, 'KT23050', 'SALFANA ROZIQA', 'KT23050@mail.com', '-', '2025-05-08', '-', '$2y$10$nAy3wTgYrftuOELQOuFo1eyS2RNlqiuG0sbO1u3FZQ1sNm8FkJ2hO', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2857),
(902, 'KT23053', 'MUHAMMAD HENDRY', 'KT23053@mail.com', '-', '2025-05-08', '-', '$2y$10$SPjZnvLyZwujxjRpBP91Ku2RmjnTYNY.PqbjHGgIcFGb69ppYAEWu', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2858),
(903, 'KT23054', 'RIGO ARIS SANDI', 'KT23054@mail.com', '-', '2025-05-08', '-', '$2y$10$ykdRiR2wed1ZLKw3okwsaucqhAyCYYX5mcrAyyl6IL9MFm4VWQsAK', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2859),
(904, 'KT23055', 'M TAKDIR ALI SAHBANI', 'KT23055@mail.com', '-', '2025-05-08', '-', '$2y$10$U1Xmaa6YoMt.43S4Vesih.fu6pW9V94A.EMac9SghuPGUtaEbhYmy', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2860),
(905, 'KT23063', 'IDFARQI PRAYUDA DWI TAMA', 'KT23063@mail.com', '-', '2025-05-08', '-', '$2y$10$drsvJKha.aWiTEwZ82enkegHlm3YmcGaymVNdHo.yM2QAD3VoH2pq', 6, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56', 2861),
(906, 'KT23070', 'MUHAMMAD SAIFUDIN', 'KT23070@mail.com', '-', '2025-05-08', '-', '$2y$10$o9lJt/8qafWpsYi30seLXer6HsBmnmUtBwQody88iqpraeY.iNAvW', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2862),
(907, 'KT23071', 'WAHYU AKBAR NUGROHO', 'KT23071@mail.com', '-', '2025-05-08', '-', '$2y$10$njNAurWSuckP/XDGJLDq7O8AtquxfPB2MEendeV0ZatzeysDNQjYO', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2863),
(908, 'KT23072', 'M NUR FAISAL ADHI SATRIA', 'KT23072@mail.com', '-', '2025-05-08', '-', '$2y$10$DmcWd3wN8IQKO8Io52aVx.G2G.250rC74YweNezDV2twgEqGpsYFe', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2864),
(909, 'KT23073', 'RONI ROMANSAH', 'KT23073@mail.com', '-', '2025-05-08', '-', '$2y$10$gT.iivdW5VWmXI/NdgdlgucFWwH22ZlHRTPzO5AZNsPQ/1SVEksuq', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2865),
(910, 'KT23078', 'DHONNY ADHYTYA PRADANA', 'KT23078@mail.com', '-', '2025-05-08', '-', '$2y$10$XT3RXLmzVvZ6kWwEa3cn9enFvP/oAHWXD3VXgn2fouGe8U8jt2wSC', 14, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2866),
(911, 'KT23079', 'FIQRI MALAKIANO', 'KT23079@mail.com', '-', '2025-05-08', '-', '$2y$10$pe0c3yT0lwBtte94gs0R0.Z.tnUpLjAahjJWBZI5O20ACJQn/E/wC', 14, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2867),
(912, 'KT23080', 'MUS MULYADI', 'KT23080@mail.com', '-', '2025-05-08', '-', '$2y$10$49tuWNZbpMBXqTjZTvDFKOTIZlvxIYNdatpFpH6s8ETCjckq0Vy9y', 14, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2868),
(913, 'KT23081', 'DODI SETIAWAN', 'KT23081@mail.com', '-', '2025-05-08', '-', '$2y$10$yem8oVc/OVnA7WMj1n5RZ.Qev2fgVoq5.is/ReJpvtPDvQLSjOgSm', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2869),
(914, 'KT23085', 'MUHAMAMD ILHAM KURNIAWAN', 'KT23085@mail.com', '-', '2025-05-08', '-', '$2y$10$25kivGNpiJZ0SmU3rKDbcurQuevcX3Hl.lbbqmUu4X5nUUngSLQ9K', 14, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2870),
(915, 'KT23086', 'OLAN', 'KT23086@mail.com', '-', '2025-05-08', '-', '$2y$10$MTHGEdbgzDp308OAV54Ry.u/74eU8qOKcH01gYZvoTd0tX51QqF.K', 14, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2871),
(916, 'KT23087', 'SABRANG AJI PANGESTU', 'KT23087@mail.com', '-', '2025-05-08', '-', '$2y$10$QUdGqhFWHWfBPBxZgbXlO.bQXHZQ2HiGg7zeUOiOIcPyRxG3Z1O/S', 14, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2872),
(917, 'KT23088', 'MUHAMMAD SALMAN ARIQ', 'KT23088@mail.com', '-', '2025-05-08', '-', '$2y$10$NqwqutVEqJBAu9Hg3Lsvzuh535buhsKpm4y9CRGIEEEE8R.OTwK/6', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2873),
(918, 'KT23089', 'AHMAD HIDAYAT', 'KT23089@mail.com', '-', '2025-05-08', '-', '$2y$10$4bJ7gz/OzWL6P0FWxhv4peJGJFWkJaHl02k/iAKkZjXAkeLFCXBsy', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2874),
(919, 'KT23090', 'AHMAD YUDHA', 'KT23090@mail.com', '-', '2025-05-08', '-', '$2y$10$anf/v3qvG1qLIi79HE/WverAm703U.iSpQHX7xYmyevxuwyptKTAG', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2875),
(920, 'KT23091', 'SELFANI MAULANA', 'KT23091@mail.com', '-', '2025-05-08', '-', '$2y$10$ECNUPlATAibcpZSC8PiiZu8qqNUw5C5zWhsLbNxYHXo2.4ftyvoMK', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2876),
(921, 'KT24003', 'RAIHAN', 'KT24003@mail.com', '-', '2025-05-08', '-', '$2y$10$HXKAv/K4WwJmJkTpM.M1sOYJKZoJqxeUXSIR2nDTOwykikNhpH9v2', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2877),
(922, 'KT24004', 'SURYANI', 'KT24004@mail.com', '-', '2025-05-08', '-', '$2y$10$BGSiaGrUOjhZSje0HdROSuT0paMFUZY5lG8KiczRJCeBE.0wTuvNu', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2878),
(923, 'KT24005', 'ARIFIN', 'KT24005@mail.com', '-', '2025-05-08', '-', '$2y$10$FkD2RrvdRrFI3vpC3u4jfuXPgkbyiwgKV9XTC/WsmqqlAERQrEo52', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2879),
(924, 'KT24006', 'M. NORFADILLAH', 'KT24006@mail.com', '-', '2025-05-08', '-', '$2y$10$UdBTzNEz6BLLS2Zy.9hpu.fD9Jp/4Wo68Z/eAiE1rMJchCsbEqkqm', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2880),
(925, 'KT24007', 'MUHAMMAD ARIEF', 'KT24007@mail.com', '-', '2025-05-08', '-', '$2y$10$ydjz0pzcwOSAOWbBmbLtpe5q.eWMs2h2TH4E9LIiD0hEyAziUIDa2', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2881),
(926, 'KT24008', 'A. FAKHRUL ULUM', 'KT24008@mail.com', '-', '2025-05-08', '-', '$2y$10$XReDeDRqE.uNA8zeBKUxE.yFI0LzKv9Ip./H4XbDpoqsgIXlDgBPu', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2882),
(927, 'KT24009', 'RAHMAT GAJALI', 'KT24009@mail.com', '-', '2025-05-08', '-', '$2y$10$WmWQSzyW2fELHEI1gWW5Oe2MlJ4qv.t14yypzLNMHn7LIyCRr4vM2', 6, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57', 2883),
(928, 'KT24010', 'BAYU SETIYAWAN', 'KT24010@mail.com', '-', '2025-05-08', '-', '$2y$10$N2.JziUOhDfNC5ZcuxOR.OZS.1ak/ZEST.gHZ27Mj8j9SQNIZzdXa', 14, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2884),
(929, 'KT24011', 'ALDI SAPUTRA', 'KT24011@mail.com', '-', '2025-05-08', '-', '$2y$10$D5urQX9FJX6I42xuwEQHV.MT1pncACgV3du.8zEO5OoW7VRSe1Zta', 14, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2885),
(930, 'KT24012', 'AGUSTIAWAN', 'KT24012@mail.com', '-', '2025-05-08', '-', '$2y$10$wDwOiZmWMxjS.Rbj4eltiOjXKU3uUqbTI3A2d3t4k3rk82glPP17q', 19, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2886),
(931, 'KT24016', 'MUHAMMAD DEDI ILHAM', 'KT24016@mail.com', '-', '2025-05-08', '-', '$2y$10$LoNPkbRQpHllFW5rs.i/I.hXSJlyyiveMLq83VTmq8DJ76Buaz/ey', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2887),
(932, 'KT24017', 'ERFAN NAVIRI', 'KT24017@mail.com', '-', '2025-05-08', '-', '$2y$10$RcZ0TcIcwpU05i1zxI5J0ep4fi8twPKjx0.I6dNLf8gpq4Fzf4SNS', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2888),
(933, 'KT24018', 'HERI SETIAWAN', 'KT24018@mail.com', '-', '2025-05-08', '-', '$2y$10$umI8w8g7UV38Tlvcs4yxuOcqcqGTdeYiOTs0c2BMIu/g/xQ6ZWYbi', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2889),
(934, 'KT24019', 'MUHAMMAD RIDTHA HUL AKBAR', 'KT24019@mail.com', '-', '2025-05-08', '-', '$2y$10$Ky48r7a0mRxigF5B.anEXekYhHTH.u1e3gLZds7KkoqNw5XKrMd72', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2890),
(935, 'KT24020', 'WINDY RIDANA', 'KT24020@mail.com', '-', '2025-05-08', '-', '$2y$10$zQjnDDJaSWphJcFtt8wCp./4xuaaBp8iiHUePRzlwuaTvAgea0Kui', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2891),
(936, 'KT24021', 'SETYA ANWAR SADAD', 'KT24021@mail.com', '-', '2025-05-08', '-', '$2y$10$6D5Xx8j0xNQCqqdqtRcIfO8Um8FDxBqjB7Wp446sJfnYq.nqte6KG', 19, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2892),
(937, 'KU15002', 'RIZKI WAHYU FADHLILLAH', 'KU15002@mail.com', '-', '2025-05-08', '-', '$2y$10$QthFJbF786Zb912C9ADZoOR2ZO2C7TxMDkCh1I01nOiPQt9p9kGrO', 16, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2893),
(938, 'TA20005', 'IMAM WAHYUDI', 'TA20005@mail.com', '-', '2025-05-08', '-', '$2y$10$E.Jno7eEuz4jVY0HWMmXJuAmzXYbWjx0SgH.1uhWwaLa8omekVoO.', 18, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2894),
(939, 'KT23012', 'ROIS PRASETYO FAJRI', 'KT23012@mail.com', '-', '2025-05-08', '-', '$2y$10$lyXUUnjmmOmThZlEevKBruNL.RQid4oFV1P5Bm5Oprj8KEENiQ9Q6', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2895),
(940, 'KT23064', 'KUKUH IMAM PAMUNGKAS', 'KT23064@mail.com', '-', '2025-05-08', '-', '$2y$10$tDhRWaWMSEiPhrhVIgOQPu7TIcU47ulmzbszjkGrctQuHLB5373WK', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2896),
(941, 'KT23083', 'MOHAMMAD NOOR FIRDAUS', 'KT23083@mail.com', '-', '2025-05-08', '-', '$2y$10$aT3.DoFaamQD4Mk2aIs4v.idHBZfgdZ0MaR8uvrycsSUKFGFtU4zW', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2897),
(942, 'KB10046', 'INDRAWAN DWI HARTANTO', 'KB10046@mail.com', '-', '2025-05-08', '-', '$2y$10$AyDcGhXSC..t0DELym03feNr/CahdR9IOXArD0fBHRgf4lqbeT6zm', 14, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2898),
(943, 'KT25007', 'VERLI DESTRIAWAN', 'KT25007@mail.com', '-', '2025-05-08', '-', '$2y$10$V/FzCfe5PymZGCyYmywBL.mr9C4ccndMf48yZI90J.YGDc0DcdrT6', 14, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2899),
(944, 'KT16085', 'PITRA HARDIANSYAH', 'KT16085@mail.com', '-', '2025-05-08', '-', '$2y$10$kqIjZ0gcHbxh3zY0NhBVLOu5H/.iT5oJD.aMGndUUrO8f3TYDR3D2', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2900),
(945, 'KT23082', 'M KAHFI', 'KT23082@mail.com', '-', '2025-05-08', '-', '$2y$10$W9PtHHjF6/NbNMtmsUKNkey1V9Km3FzbxGquEAST/FOtY7AMtCPzu', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2901),
(946, 'KB24169', 'LUKMAN AULIA RAHMAN', 'KB24169@mail.com', '-', '2025-05-08', '-', '$2y$10$em5F9JJS4ngNbNywknydIeqtgVjGYx6k6ysqt3kZOPpRaSQ/h5.bq', 19, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2902),
(947, 'KC23025', 'HERU DARMAWAN', 'KC23025@mail.com', '-', '2025-05-08', '-', '$2y$10$Sq5sug5i8tWTLh/5pkfFheA88MPjjzWUpp8guUpTiDtTOA/qliNPC', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2903),
(948, 'KT25006', 'PANJI SUSANTO', 'KT25006@mail.com', '-', '2025-05-08', '-', '$2y$10$bgaJXQtMzN5oKjJG7rwXm.jYTmyMWSbDa5.cCApItaniqP8OM3pmK', 14, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2904),
(949, 'KB11071', 'DANANG ARIFIANTO', 'KB11071@mail.com', '-', '2025-05-08', '-', '$2y$10$AWUExTyFbVuVdYQ9hwOa7.aH44G.iZtwdxTwre2JdV2W4hvN8SMOy', 6, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58', 2905),
(950, 'KT23019', 'SASTA MULYA DININGRAT', 'KT23019@mail.com', '-', '2025-05-08', '-', '$2y$10$EZ0ZnfpV3.kVYIXeSyyVJOJsXjGEbT1r8UBGzvi/P0TikalRZ6Q4C', 6, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2906),
(951, 'KT25009', 'WAHYU NUGRAHA', 'KT25009@mail.com', '-', '2025-05-08', '-', '$2y$10$9DEFlpSom8wifKf2WLZbEeXNPMTG.T6awtpwdfqSUm81oI3cbFWnm', 14, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2907),
(952, 'KT25001', 'ARIA YOGA PRATAMA', 'KT25001@mail.com', '-', '2025-05-08', '-', '$2y$10$6c2GJKntHWFmo93LsWnQRuWQyQT0jinMoAQiANeYfxNi0xNPUYbOi', 14, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2908),
(953, 'KT25008', 'ILHAM BAYU VERYANTO', 'KT25008@mail.com', '-', '2025-05-08', '-', '$2y$10$ypYRDS2h.NRr0IHlAjh4TO16GQcf7bSfTLfeePmglTSScREwZeX0q', 14, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2909),
(954, 'KT23020', 'M JAMALUDDIN DAI ROBBI', 'KT23020@mail.com', '-', '2025-05-08', '-', '$2y$10$BNmdo9uv1Q.Sh00IPA16HOcFpdFetXIv8DbUW7tmH21aWk9shp/IS', 6, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2910),
(955, 'KT18033', 'TRIYANTO', 'KT18033@mail.com', '-', '2025-05-08', '-', '$2y$10$Et8U9nKbGFCDxFEfh0HT3.3ZGWRzolIHdiiJCSOXICyKFn2Av3Fle', 6, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2911),
(956, 'KT25011', 'KELVIN SATRIA RANTELEMBANG', 'KT25011@mail.com', '-', '2025-05-08', '-', '$2y$10$ihhqW/1s2DAm7f95ojuZX.JsxWBxBV1L0UOtFvXTQu5xCbIcw0LJi', 14, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2912),
(957, 'KB23070', 'PUPUNG BORSALINO', 'KB23070@mail.com', '-', '2025-05-08', '-', '$2y$10$tnG33lD5YUwz0VQNC9gLP.OmJff5sez3DiaweL/hNqi1i94H7Dn5.', 6, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2913),
(958, 'KB12081', 'AKBAR KURNIAWAN', 'KB12081@mail.com', '-', '2025-05-08', '-', '$2y$10$w/DHg.UzctRxr0t/JarzgOxhNOWcVDe2iawlT/EtaMuIqRSN.isWC', 17, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2914),
(959, 'KT21012', 'DANIEL HERMAWAN', 'KT21012@mail.com', '-', '2025-05-08', '-', '$2y$10$SCL5Wy9SO6NpOCunfjlyUu7UOZO7Fxy9Ej4DZJSFyKa0sGuXCZKM6', 6, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2915),
(960, 'KT25010', 'TANRAJUNG HERMAN SIARA', 'KT25010@mail.com', '-', '2025-05-08', '-', '$2y$10$gycu4K2pUQNpoLUvua8mRe/fzE82CRBoNsLcKc1KoR9V8xx7IA1Ei', 14, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2916),
(961, 'KE23110', 'MUHAMMAD HUSAEIN', 'KE23110@mail.com', '-', '2025-05-08', '-', '$2y$10$SkubLG2hd8n9IEH9gDdVUuS/.KNqKepuqpDBmrXT8fwsGXSr6ylWK', 19, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2917),
(962, 'KB12050', 'YOGA RIFKI EFFENDI', 'KB12050@mail.com', '-', '2025-05-08', '-', '$2y$10$T3IA.zee6Bobq5rxBTzaKeDv1k4M5dqXxRmp.e7Vznaq7JAMSRcpa', 6, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59', 2918),
(963, '10001', 'Agung UF', '10001@mail.com', '08999', '2025-05-08', '-', '$2y$10$bibrAB4FaAT82PURbDQDDO9OxfGualoguHx6DAJTSKaSbeRKPoHdu', 21, 1, '2025-05-07 21:47:24', '2025-05-07 21:47:59', 2919);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED DEFAULT NULL,
  `relation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_06_22_034419_create_departments_table', 1),
(5, '2023_07_03_045825_create_companies_table', 1),
(6, '2023_07_03_045826_create_employees_table', 1),
(7, '2023_07_03_045827_create_work_orders_table', 1),
(8, '2023_07_06_110211_create_units_table', 1),
(9, '2023_07_06_110212_create_work_order_details_table', 1),
(10, '2023_07_18_160026_create_notifications_table', 1),
(11, '2024_04_01_000000_create_positions_table', 1),
(12, '2024_04_01_114839_create_districts_table', 1),
(13, '2024_04_01_115243_create_users_table', 1),
(14, '2024_04_02_090004_create_signs_table', 1),
(15, '2024_04_02_091031_create_sign_documents_table', 1),
(16, '2024_04_16_121759_create_signatures_table', 1),
(17, '2024_05_27_225940_create_sign_histories_table', 1),
(18, '2024_05_28_065209_create_sign_logs_table', 1),
(29, '2025_04_24_220849_create_ehays_table', 2),
(30, '2025_04_25_000851_create_ehay_log_statuses_table', 3),
(31, '2025_04_27_104407_add_nominal_from_ehays_table', 4),
(32, '2025_04_28_214913_add_uuid_from_ehays_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(98, 'App\\Models\\Employee', 4, 'MyApp', 'f093e14d01e90ec417b64667172bc33f18c6a4c2a279dd3372e9fe2569062149', '[\"employee\"]', '2023-07-31 21:11:55', NULL, '2023-07-31 21:11:00', '2023-07-31 21:11:55'),
(103, 'App\\Models\\Employee', 12, 'MyApp', '1edb84303eebd9e1c4f925d6944334db156a3399c66ce29007c8d6824089b89c', '[\"employee\"]', '2023-09-02 02:18:18', NULL, '2023-09-02 01:59:28', '2023-09-02 02:18:18'),
(104, 'App\\Models\\Employee', 12, 'MyApp', '723c3b66fb25de646c5b213deada1a734a642a965c52e6fcbcad79a1750f9552', '[\"employee\"]', '2023-09-02 02:36:24', NULL, '2023-09-02 02:31:03', '2023-09-02 02:36:24'),
(105, 'App\\Models\\Employee', 12, 'MyApp', '9f9bfa361a991acbdbf78b896d611fd32e9c81cbe90ecdffd0b661357292e2fc', '[\"employee\"]', NULL, NULL, '2023-09-02 03:04:54', '2023-09-02 03:04:54'),
(106, 'App\\Models\\Employee', 12, 'MyApp', '03617148e3a5775afc58b1ff13d168b21a4a56cf69f23aa13b32c53893bd613a', '[\"employee\"]', '2023-09-11 02:58:03', NULL, '2023-09-11 02:57:54', '2023-09-11 02:58:03'),
(107, 'App\\Models\\Employee', 4, 'MyApp', '9ec6884188385e68cb43bbf0b7a73eaca3e2d20346264b296b2e71ac62c71651', '[\"employee\"]', '2023-10-14 00:17:41', NULL, '2023-10-14 00:17:31', '2023-10-14 00:17:41'),
(114, 'App\\Models\\Employee', 8, 'MyApp', 'f7ce57c53b85c814d0aa910e9c8bd3e736a5f0b979fd7172fbe1d17e771b2dcc', '[\"employee\"]', '2023-10-17 19:55:33', NULL, '2023-10-17 19:55:28', '2023-10-17 19:55:33'),
(138, 'App\\Models\\Employee', 6, 'MyApp', '291ecab71e09ac45946a611aa79d50680078067d0ff43507589c65ff43cd00db', '[\"employee\"]', '2023-11-16 02:38:14', NULL, '2023-11-16 02:36:01', '2023-11-16 02:38:14'),
(168, 'App\\Models\\Employee', 1, 'MyApp', 'dd2e9c0fa026549b14b62bcca1c63ab64626180b19b0dec0aeddaa17e6d37e06', '[\"employee\"]', NULL, NULL, '2024-01-09 20:50:28', '2024-01-09 20:50:28'),
(169, 'App\\Models\\Employee', 1, 'MyApp', 'd92420e98cbc6a6c1f7673537fb1c52b663fc5b7a791203b72ab3f4e05ba24b0', '[\"employee\"]', NULL, NULL, '2024-01-09 20:51:42', '2024-01-09 20:51:42'),
(170, 'App\\Models\\Employee', 1, 'MyApp', 'a896a34f9fd595399919ef15221ca2257926ba4f8c1094226c8c241ffb9f3dc1', '[\"employee\"]', NULL, NULL, '2024-01-09 20:52:13', '2024-01-09 20:52:13'),
(171, 'App\\Models\\Employee', 1, 'MyApp', '6e3f8c6f1dcbaddbc9c32b2e55ec05799a91c4e5dc2320f07aba91bef1dced27', '[\"employee\"]', NULL, NULL, '2024-01-09 20:53:28', '2024-01-09 20:53:28'),
(172, 'App\\Models\\Employee', 1, 'MyApp', 'b769265bd62ff61a700344a0668cd4fddbfa62894b6cb3f41e9ff35ba42615c0', '[\"employee\"]', NULL, NULL, '2024-01-12 20:24:30', '2024-01-12 20:24:30'),
(173, 'App\\Models\\Employee', 1, 'MyApp', '6904b55cb1890d95bd067ef46584c38a48a7506406d9cfafd5bbc5e3c3f01d0c', '[\"employee\"]', NULL, NULL, '2024-01-12 20:25:40', '2024-01-12 20:25:40'),
(174, 'App\\Models\\Employee', 1, 'MyApp', 'ff8d452f1543b2b837106793a5a2ad1807d45e80685ee03c24643e7a1ca55ec7', '[\"employee\"]', NULL, NULL, '2024-01-12 20:26:09', '2024-01-12 20:26:09'),
(175, 'App\\Models\\Employee', 1, 'MyApp', '28fdaebee1be435e2d97ed3e2feac8383a5feeac6f1632cf0fdc9e09ebaa0806', '[\"employee\"]', NULL, NULL, '2024-01-12 20:27:18', '2024-01-12 20:27:18'),
(176, 'App\\Models\\Employee', 1, 'MyApp', '1bac3d2ecddf214bb745202d0082315ed549544161e231b5aeb857085100735e', '[\"employee\"]', NULL, NULL, '2024-01-19 20:15:23', '2024-01-19 20:15:23'),
(177, 'App\\Models\\Employee', 1, 'MyApp', '5c33038dc61c89edd9dc1b685e5761ed1bedcd0285e2c4b2ed1e0d9ec857c030', '[\"employee\"]', NULL, NULL, '2024-01-19 20:16:36', '2024-01-19 20:16:36'),
(178, 'App\\Models\\Employee', 1, 'MyApp', 'adc3fd077a8cbcc53b82dce9232bb78ba9c11a14448104022f96d03f8e68d648', '[\"employee\"]', NULL, NULL, '2024-01-19 20:17:06', '2024-01-19 20:17:06'),
(179, 'App\\Models\\Employee', 1, 'MyApp', '8df3e3b3e6224b6d3801723984754beb5f18a46e7fbe71de4176d18f5dc05c7f', '[\"employee\"]', NULL, NULL, '2024-01-19 20:18:21', '2024-01-19 20:18:21'),
(180, 'App\\Models\\Employee', 1, 'MyApp', '391f8e53d336ca2096e9fdc455f7ba84bf83193a14e9462736490fb58c35ee1b', '[\"employee\"]', '2024-01-19 20:18:43', NULL, '2024-01-19 20:18:37', '2024-01-19 20:18:43'),
(181, 'App\\Models\\Employee', 1, 'MyApp', '956b89ff1bafb768ec0af66bbb34c711bfe75fa429b23f8b647a0ac77e4291b5', '[\"employee\"]', NULL, NULL, '2024-01-26 20:14:45', '2024-01-26 20:14:45'),
(182, 'App\\Models\\Employee', 1, 'MyApp', 'f9a8660b3d9b44a8b312b1f26d1ce25fad0a6c5a73911efe8df633055d4ab3ee', '[\"employee\"]', NULL, NULL, '2024-01-26 20:15:16', '2024-01-26 20:15:16'),
(183, 'App\\Models\\Employee', 1, 'MyApp', '6d4894c30a40b3ee0a88de11b83dbf2f14e4cd7784a51155493a5fca9cbffaed', '[\"employee\"]', NULL, NULL, '2024-01-26 20:15:51', '2024-01-26 20:15:51'),
(184, 'App\\Models\\Employee', 1, 'MyApp', 'fc9902c0ab68a30567393958d0907d7671e3c36b952e93841615c6c1dc0f0656', '[\"employee\"]', NULL, NULL, '2024-01-26 20:16:21', '2024-01-26 20:16:21'),
(185, 'App\\Models\\Employee', 1, 'MyApp', '6bf7ef3590899261476a83dce73a9111710722eb24acc61505e38c2227884f71', '[\"employee\"]', NULL, NULL, '2024-01-26 20:17:34', '2024-01-26 20:17:34'),
(186, 'App\\Models\\Employee', 1, 'MyApp', '20addb1593629db70a1a28931cc3121c7d7998bf26bc395c1d1ee9b02d7eb3cb', '[\"employee\"]', NULL, NULL, '2024-01-26 20:18:04', '2024-01-26 20:18:04'),
(187, 'App\\Models\\Employee', 1, 'MyApp', 'd2dad6212aba51a41060f3da6ab477dfcf77ca7f5fc87d10a276793bae838451', '[\"employee\"]', NULL, NULL, '2024-01-27 02:39:43', '2024-01-27 02:39:43'),
(188, 'App\\Models\\Employee', 1, 'MyApp', '77bb9a1de9e1bbcc9f78ec2c6ac5be0cbe6c7188b89010d2b4392a8888d1eb3f', '[\"employee\"]', NULL, NULL, '2024-01-27 02:40:12', '2024-01-27 02:40:12'),
(189, 'App\\Models\\Employee', 1, 'MyApp', 'fe1cd17e11f95a7642668b1a3e24848571a10baa2e4fa48277487c03e0a5692a', '[\"employee\"]', NULL, NULL, '2024-01-27 02:40:46', '2024-01-27 02:40:46'),
(190, 'App\\Models\\Employee', 1, 'MyApp', 'b81d95b5451b579314f80c56cd939371d682a74931f1c6fa3fa82327f1716bfd', '[\"employee\"]', '2024-01-27 02:41:56', NULL, '2024-01-27 02:41:03', '2024-01-27 02:41:56'),
(191, 'App\\Models\\Employee', 1, 'MyApp', 'ee349d40ff79998094b4ab70a38900f7fe0bd9ab1ccb76eb9fc06c7f40f027b9', '[\"employee\"]', NULL, NULL, '2024-02-05 23:48:16', '2024-02-05 23:48:16'),
(192, 'App\\Models\\Employee', 1, 'MyApp', 'd5bf34fb087b0648b484b03113ff7ac1fcc556e0a51057b475108257601e6f5e', '[\"employee\"]', NULL, NULL, '2024-02-06 19:41:08', '2024-02-06 19:41:08'),
(193, 'App\\Models\\Employee', 1, 'MyApp', 'a50b7e8e1b9ba342c384cfeb3e7de5eaf88cf7dd75191bf5df4f91af52adbd14', '[\"employee\"]', NULL, NULL, '2024-02-06 19:42:17', '2024-02-06 19:42:17'),
(194, 'App\\Models\\Employee', 1, 'MyApp', '33a4355a3c04c92d493f356fbdc7cf3f0cd7374e5a5b7d1c33aa8ac75e51e456', '[\"employee\"]', NULL, NULL, '2024-02-06 19:42:18', '2024-02-06 19:42:18'),
(195, 'App\\Models\\Employee', 1, 'MyApp', 'd714dde664c50b270080e7ba3a92b722e5388118917e151228131a682e0a321e', '[\"employee\"]', NULL, NULL, '2024-02-06 19:43:29', '2024-02-06 19:43:29'),
(196, 'App\\Models\\Employee', 1, 'MyApp', '6c9bc5f8734cd60d354f8732a7840a4a301c2e201f1f1d497d148194757c65b6', '[\"employee\"]', NULL, NULL, '2024-02-06 19:43:29', '2024-02-06 19:43:29'),
(197, 'App\\Models\\Employee', 1, 'MyApp', '4fd29a08f6151ef28426f38abfb8dac881c84e3020f6f14a5b487ae376175265', '[\"employee\"]', NULL, NULL, '2024-02-06 19:44:38', '2024-02-06 19:44:38'),
(198, 'App\\Models\\Employee', 1, 'MyApp', 'fa403a7b749ec151211eed357f3c59d40a5b0a623c73978015f0cf90d6dc57bc', '[\"employee\"]', NULL, NULL, '2024-02-06 19:44:38', '2024-02-06 19:44:38'),
(199, 'App\\Models\\Employee', 1, 'MyApp', 'd1ecb8807c8084dde9478e0e4183afde4455ff4e59b36a2cc7b4df156c7c6c4a', '[\"employee\"]', NULL, NULL, '2024-02-06 19:45:07', '2024-02-06 19:45:07'),
(200, 'App\\Models\\Employee', 1, 'MyApp', '0121f7a1e37276526a4d192e66636225711089041b16065c4015bdad2ee12742', '[\"employee\"]', NULL, NULL, '2024-02-07 00:39:37', '2024-02-07 00:39:37'),
(201, 'App\\Models\\Employee', 1, 'MyApp', 'b3980257f0864f061e6f462f21bf5ae272beff83913d1fd5f5008e8f635c3bcb', '[\"employee\"]', NULL, NULL, '2024-02-07 00:40:08', '2024-02-07 00:40:08'),
(202, 'App\\Models\\Employee', 1, 'MyApp', 'c1d1bf2fef8131b54d2eaaf08aa8357a6774161676c26013d91d4d30c602e9aa', '[\"employee\"]', NULL, NULL, '2024-02-07 00:40:40', '2024-02-07 00:40:40'),
(203, 'App\\Models\\Employee', 1, 'MyApp', '925409c59892beebaf8f4bd0744e8576cb7c3e3ac58730f248341ea7d72d472b', '[\"employee\"]', '2024-02-07 00:42:15', NULL, '2024-02-07 00:40:58', '2024-02-07 00:42:15'),
(204, 'App\\Models\\Employee', 1, 'MyApp', 'df9ac59c6452e8f5c4b0cf67f84da700533b45fc1611d4558d493119385e4660', '[\"employee\"]', NULL, NULL, '2024-02-09 10:22:43', '2024-02-09 10:22:43'),
(205, 'App\\Models\\Employee', 1, 'MyApp', '068d33c91f1f59fc0a23b8006bb1edf75c3c314bc2f1753499272678cc37867a', '[\"employee\"]', NULL, NULL, '2024-02-09 10:23:13', '2024-02-09 10:23:13'),
(206, 'App\\Models\\Employee', 1, 'MyApp', '6d5f11d92aadcbb8723859fa3c25f644e7409231937cabbe82cf759c17641cbc', '[\"employee\"]', NULL, NULL, '2024-02-09 10:23:46', '2024-02-09 10:23:46'),
(207, 'App\\Models\\Employee', 1, 'MyApp', '1ec4093233c28456234d1b571a828f37ee87376c468786a16e9d39ba4f1062b3', '[\"employee\"]', NULL, NULL, '2024-02-09 10:24:17', '2024-02-09 10:24:17'),
(208, 'App\\Models\\Employee', 1, 'MyApp', 'fbb501849a33cd9ec61f88df04c0d2dc4db5742f190b3a535a35ec5f2c995aee', '[\"employee\"]', NULL, NULL, '2024-02-09 10:25:28', '2024-02-09 10:25:28'),
(209, 'App\\Models\\Employee', 5, 'MyApp', '8f3446bcad4fdd45fcdbc329dfceca9b9c671a54b0e5a399eb0b40f6434dcaf2', '[\"employee\"]', NULL, NULL, '2024-02-11 06:45:04', '2024-02-11 06:45:04'),
(210, 'App\\Models\\Employee', 1, 'MyApp', '7aeecdb31b0d22c2844c74254f23ea364da74bdb287b690702d38a776b8bbb3c', '[\"employee\"]', NULL, NULL, '2024-02-22 22:01:23', '2024-02-22 22:01:23'),
(211, 'App\\Models\\Employee', 1, 'MyApp', '38b9eecab5a6685659a3324ea40df29b7076f99a1ac7e32f1d4d0d900dd2a32f', '[\"employee\"]', NULL, NULL, '2024-02-22 23:18:05', '2024-02-22 23:18:05'),
(212, 'App\\Models\\Employee', 1, 'MyApp', 'a745e4768ca15011ba82356a2fcc1a7d0fa47f7c5383adc34a94f94a28c6b103', '[\"employee\"]', NULL, NULL, '2024-02-22 23:19:20', '2024-02-22 23:19:20'),
(213, 'App\\Models\\Employee', 1, 'MyApp', '447f5a01180252da5e8b90acef2684e02ff394301515f0f337ade7013b125af8', '[\"employee\"]', NULL, NULL, '2024-02-22 23:20:43', '2024-02-22 23:20:43'),
(214, 'App\\Models\\Employee', 1, 'MyApp', '89882aae31764998e09a3e79f14ef4a5e7c0b3c529f8f67365e8f79f82fb796d', '[\"employee\"]', '2024-02-22 23:21:39', NULL, '2024-02-22 23:21:24', '2024-02-22 23:21:39'),
(215, 'App\\Models\\Employee', 1, 'MyApp', '328d2f1043b13958b0788e63ca92948491d607de55def97b392992d795bdc363', '[\"employee\"]', NULL, NULL, '2024-02-23 00:17:10', '2024-02-23 00:17:10'),
(216, 'App\\Models\\Employee', 1, 'MyApp', 'bb1e27cf87d1b7ce64da00b0c12317418fba3bd37b87ffe884fb42ddf38d469a', '[\"employee\"]', '2024-02-23 00:20:41', NULL, '2024-02-23 00:17:19', '2024-02-23 00:20:41'),
(217, 'App\\Models\\Employee', 1, 'MyApp', 'a0a101b0922da16958a5635cc2301bd85f9fcc117597e4f509a054f21bd54d6d', '[\"employee\"]', NULL, NULL, '2024-03-08 08:44:49', '2024-03-08 08:44:49'),
(218, 'App\\Models\\Employee', 1, 'MyApp', 'c7fff98b2345b695277396879ef4ce3eddfd3f172afd670ffc94deeb2d4cb0fd', '[\"employee\"]', NULL, NULL, '2024-03-08 08:45:23', '2024-03-08 08:45:23'),
(219, 'App\\Models\\Employee', 1, 'MyApp', '720e9ff352d188c71789c61f7e95e029aea5be0fee8cd860a98395e9c1f7e663', '[\"employee\"]', NULL, NULL, '2024-03-08 08:45:55', '2024-03-08 08:45:55'),
(220, 'App\\Models\\Employee', 1, 'MyApp', 'a9b35b99d113b0c0a76d6a9617ccf7cfac7070d133aad39bd37ff99e47e6b155', '[\"employee\"]', NULL, NULL, '2024-03-08 08:46:26', '2024-03-08 08:46:26'),
(221, 'App\\Models\\Employee', 1, 'MyApp', '8285a9ee50fb043cc7f02afe79d0ccf515009ac9606639be91a255e6ae12308f', '[\"employee\"]', NULL, NULL, '2024-03-08 08:47:35', '2024-03-08 08:47:35'),
(222, 'App\\Models\\Employee', 1, 'MyApp', 'b180da9b2f2a690c8988c6b9fb86bb6c8e2f2469690fd57a327e5bd83384a5ef', '[\"employee\"]', NULL, NULL, '2024-03-08 08:48:04', '2024-03-08 08:48:04'),
(223, 'App\\Models\\Employee', 1, 'MyApp', '4db25d809f15c39ed64aa37efd921dee947acf0eb3b9b7d9e4954830f77667cd', '[\"employee\"]', NULL, NULL, '2024-03-14 18:07:35', '2024-03-14 18:07:35'),
(224, 'App\\Models\\Employee', 1, 'MyApp', '206b12f04e7747646d93b8ece0af98ce4b13ec446ae3e501fa5fad2d45eb5e80', '[\"employee\"]', NULL, NULL, '2024-03-14 18:08:05', '2024-03-14 18:08:05'),
(225, 'App\\Models\\Employee', 1, 'MyApp', '13328955e004d655baa286e3a90158d1f7378f951a821a12496320caff6fa925', '[\"employee\"]', NULL, NULL, '2024-03-14 18:08:33', '2024-03-14 18:08:33'),
(226, 'App\\Models\\Employee', 1, 'MyApp', 'fa1e19aa3667c6826b01229bbe569739c3bee37a9e1545a926f9a583734fcfb8', '[\"employee\"]', '2024-03-14 18:09:24', NULL, '2024-03-14 18:08:50', '2024-03-14 18:09:24'),
(227, 'App\\Models\\Employee', 1, 'MyApp', 'c87a6cc7211a73c469c0f1f7dcc82fe8c6c7b6e8c7d04717d3213c0141f33066', '[\"employee\"]', NULL, NULL, '2024-03-18 18:52:32', '2024-03-18 18:52:32'),
(228, 'App\\Models\\Employee', 1, 'MyApp', '8ba97efe99a66da5f7ba5ff0476a5bcdc93a8638c599f9c0a23a84594217a0ad', '[\"employee\"]', NULL, NULL, '2024-03-18 18:53:45', '2024-03-18 18:53:45'),
(229, 'App\\Models\\Employee', 1, 'MyApp', 'd833e1cc79956d8de296f3eb036ff8bbaa47e44d46b876fbd1fc9dbf2f43c1f4', '[\"employee\"]', NULL, NULL, '2024-03-18 18:54:15', '2024-03-18 18:54:15'),
(230, 'App\\Models\\Employee', 1, 'MyApp', '7a426d3b8945db5c48c3ff541aa607a300461c00d7feef32eb221685b66abf56', '[\"employee\"]', NULL, NULL, '2024-03-18 18:55:26', '2024-03-18 18:55:26'),
(231, 'App\\Models\\Employee', 1, 'MyApp', 'ee7e0536e63beaa7efc0077e1882620a35331266c173e9653f0e12b199189eb3', '[\"employee\"]', NULL, NULL, '2024-03-20 23:09:11', '2024-03-20 23:09:11'),
(232, 'App\\Models\\Employee', 1, 'MyApp', '6ebf377f54f6283c74667a79cd78dc9cb04ca93e1da6169e66e939d887fcffe6', '[\"employee\"]', NULL, NULL, '2024-03-20 23:10:20', '2024-03-20 23:10:20'),
(233, 'App\\Models\\Employee', 1, 'MyApp', '7aa3e798d0df2229b24363d433303a6fe3418635497f4cc951e9e3251d3199b9', '[\"employee\"]', NULL, NULL, '2024-03-20 23:11:29', '2024-03-20 23:11:29'),
(234, 'App\\Models\\Employee', 1, 'MyApp', 'd6d3372d458861d4bc7167140fdfedf0dbd7a24914f68ef5a874d2f997b5d9a7', '[\"employee\"]', NULL, NULL, '2024-03-20 23:12:43', '2024-03-20 23:12:43'),
(235, 'App\\Models\\Employee', 1, 'MyApp', 'a146746f306470badbc2a09560517faddfbea3cd8640bd4fa64d9a8252f1e310', '[\"employee\"]', NULL, NULL, '2024-03-26 00:30:38', '2024-03-26 00:30:38'),
(236, 'App\\Models\\Employee', 1, 'MyApp', 'ab399cbcc8c770a6e903f2d98ce06dade70ac65dcf360aa986a41d0f8060a5f3', '[\"employee\"]', NULL, NULL, '2024-03-26 00:31:09', '2024-03-26 00:31:09'),
(237, 'App\\Models\\Employee', 1, 'MyApp', '029a4b50cff0e0cbe3e846888dfde44d67f91a94c884d850d0f564a58ac8b8fc', '[\"employee\"]', NULL, NULL, '2024-03-26 00:31:42', '2024-03-26 00:31:42'),
(238, 'App\\Models\\Employee', 1, 'MyApp', '24c38d1bb36ab4b1559f6c3584849a060e6c71f47a40ad4023da364a36a49a01', '[\"employee\"]', NULL, NULL, '2024-03-26 00:32:11', '2024-03-26 00:32:11'),
(239, 'App\\Models\\Employee', 1, 'MyApp', 'de3d903d95547b1c9d3fa76bc7d141536202d17d8f28fa292cb15060ac116bae', '[\"employee\"]', NULL, NULL, '2024-03-26 00:33:25', '2024-03-26 00:33:25'),
(240, 'App\\Models\\Employee', 1, 'MyApp', 'e9e43af64c13659227c951ad7f13155916df6a9d6deb971eac307010e7efab4d', '[\"employee\"]', NULL, NULL, '2024-03-26 18:29:41', '2024-03-26 18:29:41'),
(241, 'App\\Models\\Employee', 1, 'MyApp', '54990d3f17916bedcd15da7231992a41ba68e29024c9d8846ae1d07b10aac2c9', '[\"employee\"]', NULL, NULL, '2024-03-26 18:30:13', '2024-03-26 18:30:13'),
(242, 'App\\Models\\Employee', 1, 'MyApp', 'f3c711181331f8d921df2cdc00153a28f3abcbaa19dec8cc1bdc21837cb6e285', '[\"employee\"]', NULL, NULL, '2024-03-26 18:30:47', '2024-03-26 18:30:47'),
(243, 'App\\Models\\Employee', 1, 'MyApp', 'a7d1271b79c8de3018d82e386ba5326a966223b5d372428402ae3f6cf4362b08', '[\"employee\"]', NULL, NULL, '2024-03-26 18:31:17', '2024-03-26 18:31:17'),
(244, 'App\\Models\\Employee', 1, 'MyApp', 'd0445a28203dd4cd4de88a39c502c68c6a78097728e1ef1b4ed1e75cab9a15a8', '[\"employee\"]', NULL, NULL, '2024-03-26 18:32:31', '2024-03-26 18:32:31'),
(245, 'App\\Models\\Employee', 1, 'MyApp', '217070d4273cd855c3b80026fa443370d59a6faae2d86676db179bf9ed7023ab', '[\"employee\"]', NULL, NULL, '2024-03-30 13:21:02', '2024-03-30 13:21:02'),
(246, 'App\\Models\\Employee', 1, 'MyApp', 'c947c183a8430d827e42374f7d8c3d182b1d8d9aa0dd765926ebe56f9cb0c48d', '[\"employee\"]', NULL, NULL, '2024-03-30 13:21:18', '2024-03-30 13:21:18'),
(247, 'App\\Models\\Employee', 1, 'MyApp', 'eca7769aecb4326ad5d7755dce0086567357531377450707a1409c09e4f95869', '[\"employee\"]', NULL, NULL, '2024-03-30 13:21:48', '2024-03-30 13:21:48'),
(248, 'App\\Models\\Employee', 1, 'MyApp', 'c7fdb7c884f2da070f143c5cb36229225bf84a2ffc6311a9e9c580dd8703ff28', '[\"employee\"]', NULL, NULL, '2024-03-30 13:22:21', '2024-03-30 13:22:21'),
(249, 'App\\Models\\Employee', 1, 'MyApp', '7afc852e31cb569e0e8419784684e5642f797c4067c01e030f5cf2282d4fffe1', '[\"employee\"]', NULL, NULL, '2024-03-30 13:23:38', '2024-03-30 13:23:38'),
(250, 'App\\Models\\Employee', 1, 'MyApp', '290566de9a4937e49e3a28e2155c64c22ab9f4dbb09bd1dc0deae31f2f573e2e', '[\"employee\"]', NULL, NULL, '2024-04-02 18:05:03', '2024-04-02 18:05:03'),
(251, 'App\\Models\\Employee', 1, 'MyApp', 'fd064649b551b9fa3e6bcf4589b00882fc1ecbf80f2d6e9bd2f604e655ec49d1', '[\"employee\"]', NULL, NULL, '2024-04-02 18:05:32', '2024-04-02 18:05:32'),
(252, 'App\\Models\\Employee', 1, 'MyApp', '623695d1c4e048bede32d556b0a37f3ea29a3121417999811894cb2c3be53872', '[\"employee\"]', NULL, NULL, '2024-04-02 18:06:39', '2024-04-02 18:06:39'),
(253, 'App\\Models\\Employee', 1, 'MyApp', 'c1df2868dd759e1fd02cfc78ca3e581849675a53204f0e157f13a60ccd5bfba8', '[\"employee\"]', NULL, NULL, '2024-04-02 18:07:07', '2024-04-02 18:07:07'),
(254, 'App\\Models\\Employee', 1, 'MyApp', 'e85012be16cb38b56d4242fe5aa40c9c0c8cd29bb67297b39d846b98e6ce630a', '[\"employee\"]', NULL, NULL, '2024-04-02 18:08:17', '2024-04-02 18:08:17'),
(255, 'App\\Models\\Employee', 1, 'MyApp', '9cc60610490680406ececd2606ae6190746c7c7f64751b93eb9752516d4ad5e2', '[\"employee\"]', NULL, NULL, '2024-04-06 08:32:11', '2024-04-06 08:32:11'),
(256, 'App\\Models\\Employee', 1, 'MyApp', '19d289d937a40cefdd4b309606f93bd1d08b3b76823a35b770963ff18e667b2b', '[\"employee\"]', NULL, NULL, '2024-04-06 08:33:22', '2024-04-06 08:33:22'),
(257, 'App\\Models\\Employee', 1, 'MyApp', 'af7d0b5ed9a95445e7bde83ed5229ab357e85f7b3dfec967219087715edb9e5f', '[\"employee\"]', '2024-04-06 08:35:14', NULL, '2024-04-06 08:33:36', '2024-04-06 08:35:14'),
(258, 'App\\Models\\Employee', 6, 'MyApp', '99bb8f7d4fa86b82ddccca5d6cea7dde0031312642fe9fe6b6b95e8529652594', '[\"employee\"]', '2024-04-18 18:01:52', NULL, '2024-04-18 18:00:24', '2024-04-18 18:01:52'),
(259, 'App\\Models\\Employee', 6, 'MyApp', '71863e8a396b309f1dc48f7c6a617166ebdfdcfe6eb4e982040dbceb0c451d7a', '[\"employee\"]', '2024-04-18 18:15:27', NULL, '2024-04-18 18:15:21', '2024-04-18 18:15:27'),
(260, 'App\\Models\\Employee', 4, 'MyApp', 'ed68ea10bbd5562e9fccceac3e537127a74f62ca4a954adb4db82798f353c60d', '[\"employee\"]', NULL, NULL, '2024-04-23 00:52:47', '2024-04-23 00:52:47'),
(261, 'App\\Models\\Employee', 1, 'MyApp', '1b377d0da94bebe6f17daa10fe1c549d8a853e90201a244e82943bd251d0d3b8', '[\"employee\"]', NULL, NULL, '2024-05-09 04:38:39', '2024-05-09 04:38:39'),
(262, 'App\\Models\\Employee', 1, 'MyApp', '55cbb75528538a261e4b82a9c3d7b08019e6a475dc2cad73a3dec0336303ed9e', '[\"employee\"]', '2024-05-09 04:41:43', NULL, '2024-05-09 04:38:54', '2024-05-09 04:41:43'),
(263, 'App\\Models\\Employee', 6, 'MyApp', '3fa723651743cb364ddf5c0cf229a5da9292a09959f3131a46cc50671a6f516e', '[\"employee\"]', '2024-06-07 07:11:41', NULL, '2024-06-07 07:10:53', '2024-06-07 07:11:41'),
(264, 'App\\Models\\Employee', 1, 'MyApp', '877c5ad65fc139bb2d826c6ddb44be150d169b6f68ba575628f779990f945261', '[\"employee\"]', NULL, NULL, '2024-06-10 11:24:07', '2024-06-10 11:24:07'),
(265, 'App\\Models\\Employee', 1, 'MyApp', 'b021dfb0056b397395ee7b9d22c3fb0386fddea41a8ee8d0d93e814f1573d644', '[\"employee\"]', '2024-06-10 11:25:56', NULL, '2024-06-10 11:24:25', '2024-06-10 11:25:56'),
(266, 'App\\Models\\Employee', 1, 'MyApp', '414bb134e32e24d024d4e4011b3dc2919afd1ed21d264a6ee4f06657a1694f0d', '[\"employee\"]', NULL, NULL, '2024-06-10 11:31:23', '2024-06-10 11:31:23'),
(267, 'App\\Models\\Employee', 1, 'MyApp', 'b1bcc7846c931b6e50ac8a08925f107033033de447f15be78cc2a68914cbe507', '[\"employee\"]', NULL, NULL, '2024-06-10 11:32:36', '2024-06-10 11:32:36'),
(268, 'App\\Models\\Employee', 1, 'MyApp', '9f2c0ded01d7d82c6d9e4f9173a4496f419b27e1d207220021f7350cf5dc1b12', '[\"employee\"]', '2024-06-10 11:33:08', NULL, '2024-06-10 11:32:51', '2024-06-10 11:33:08'),
(269, 'App\\Models\\Employee', 4, 'MyApp', '57fe9371b388935d3dcec0324f8c5e9b7281d7f29bf6520ea7b963fde9cde85f', '[\"employee\"]', NULL, NULL, '2024-07-03 08:26:02', '2024-07-03 08:26:02'),
(270, 'App\\Models\\Employee', 1, 'MyApp', '3603f667dd1c787b8d0d1afbc0a158510233408c0257a339bc7b58cab4058122', '[\"employee\"]', NULL, NULL, '2024-09-16 11:26:50', '2024-09-16 11:26:50'),
(271, 'App\\Models\\Employee', 1, 'MyApp', '909029c7992798db6eb2e901aa6a2c880030425626c61e39265412b6069ec3c0', '[\"employee\"]', '2024-09-16 11:27:12', NULL, '2024-09-16 11:27:05', '2024-09-16 11:27:12'),
(272, 'App\\Models\\Employee', 1, 'MyApp', '34c63c6821ff3cbeab9c43b8686de4789377e1e0830c4a91c6311801e930729c', '[\"employee\"]', '2024-10-22 11:40:26', NULL, '2024-10-22 11:40:23', '2024-10-22 11:40:26'),
(273, 'App\\Models\\Employee', 1, 'MyApp', 'c7b3840ac6c0f3ffa1ae51d219cd426887b0634e1175a0e17e6f4538ddcb3e7a', '[\"employee\"]', NULL, NULL, '2024-11-22 12:24:32', '2024-11-22 12:24:32'),
(274, 'App\\Models\\Employee', 1, 'MyApp', 'b3aaee7cb65feecc800ef0c4fe1fcbfadef8d294a744383a154acdbbf8d31e4f', '[\"employee\"]', '2024-11-22 12:25:57', NULL, '2024-11-22 12:24:48', '2024-11-22 12:25:57'),
(275, 'App\\Models\\Employee', 1, 'MyApp', '67cee2c5170ce7e3d2b8677d80a00bfa4e97bed0bc3b9236e9d32983eeae2fb2', '[\"employee\"]', '2024-11-22 12:51:01', NULL, '2024-11-22 12:48:53', '2024-11-22 12:51:01'),
(276, 'App\\Models\\Employee', 1, 'MyApp', '5e6cd8aff9b03b16c0cda4bf5f50b4c02d7431caed738452e34b5a75be15a8c7', '[\"employee\"]', NULL, NULL, '2024-11-23 13:00:20', '2024-11-23 13:00:20'),
(277, 'App\\Models\\Employee', 1, 'MyApp', '3f7bd116b29bb8669016db96ad3e9c96d7b1d19e4cb074552f5aa95d6e197d30', '[\"employee\"]', '2024-11-23 13:00:56', NULL, '2024-11-23 13:00:30', '2024-11-23 13:00:56'),
(278, 'App\\Models\\Employee', 1, 'MyApp', '67678f9f247a86eda781c61a0b91ca48dec8337ff28743ca3d8a02f689c187c0', '[\"employee\"]', NULL, NULL, '2025-02-21 12:20:56', '2025-02-21 12:20:56'),
(279, 'App\\Models\\Employee', 1, 'MyApp', 'b2bd57dba14ecf5a3d46674ab093c18261e72c8c15ffde2a81d249d92e2969cd', '[\"employee\"]', '2025-02-21 12:21:18', NULL, '2025-02-21 12:21:12', '2025-02-21 12:21:18'),
(280, 'App\\Models\\Employee', 1, 'MyApp', '788acdd6234a3a502fa7cbe985932c33954ac69b2acf48d429ef251791040ecf', '[\"employee\"]', NULL, NULL, '2025-03-31 13:36:18', '2025-03-31 13:36:18'),
(281, 'App\\Models\\Employee', 1, 'MyApp', '8f5769030978d5d9bf083712a0336076fff76547e754751d66f313f9b9f0935f', '[\"employee\"]', '2025-03-31 13:38:25', NULL, '2025-03-31 13:36:33', '2025-03-31 13:38:25');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Project Manager', '2024-04-01 05:09:58', '2024-04-01 05:09:58'),
(3, 'Dept. Head Plant-SM', '2024-04-01 05:10:17', '2024-06-04 08:44:04'),
(4, 'Developer', '2024-04-05 02:16:26', '2024-04-05 02:16:26'),
(5, 'KASIR', '2024-06-04 09:06:34', '2024-06-04 09:06:34'),
(6, 'FAT OFFICER', '2024-06-04 09:06:43', '2024-06-04 09:06:43'),
(7, 'FATB OFFICER', '2024-06-04 09:07:01', '2024-06-04 09:07:01'),
(8, 'FATB SECTION HEAD', '2024-06-04 09:07:15', '2024-06-04 09:07:15'),
(9, 'Manager PT. TMN', '2024-06-15 03:02:34', '2024-06-15 03:02:34'),
(10, 'PLANT & SM SITE DEPT. HEAD', '2025-05-07 21:16:27', '2025-05-07 21:16:27'),
(11, 'SSE GL', '2025-05-07 21:16:27', '2025-05-07 21:16:27'),
(12, 'A2B/TP OPERATOR', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(13, 'ROAD MAINTENANCE GL', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(14, 'HAULING GL', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(15, 'PLANT HAULING GL', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(16, 'INVENTORY & PURCHASING GL', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(17, 'HCGS & FAT DEPT. HEAD', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(18, 'PLANT ENGINEER', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(19, 'HRM SECT. HEAD', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(20, 'OPERATION SITE INSTRUCTOR', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(21, 'PLANT SITE INSTRUCTOR', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(22, 'SHE SITE LEADER', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(23, 'OPERATOR DEVELOPMENT OFFICER', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(24, 'FINANCE & TAXATION OFFICER', '2025-05-07 21:16:28', '2025-05-07 21:16:28'),
(25, 'PLANNER', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(26, 'TIRE GL', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(27, 'OPERATOR INSTRUCTOR', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(28, 'ICT OFFICER', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(29, 'DATA ANALYST', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(30, 'COMMUNITY DEVELOPMENT OFFICER', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(31, 'GENERAL SERVICES GL', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(32, 'FABRICATION GL', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(33, 'FUEL & OIL GL', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(34, 'TRAINEE OPERATION', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(35, 'TRAINEE SHE', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(36, 'TRAINEE PLANT', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(37, 'TRAINEE GS', '2025-05-07 21:16:29', '2025-05-07 21:16:29'),
(38, 'TRAINEE HC', '2025-05-07 21:16:30', '2025-05-07 21:16:30'),
(39, 'TRAINEE CPMD', '2025-05-07 21:16:30', '2025-05-07 21:16:30'),
(40, 'TRAINEE FAT', '2025-05-07 21:16:30', '2025-05-07 21:16:30'),
(41, 'TRAINEE ENGINEERING', '2025-05-07 21:16:30', '2025-05-07 21:16:30'),
(42, 'SSE MECHANIC', '2025-05-07 21:16:30', '2025-05-07 21:16:30'),
(43, 'PLANT HAULING MECHANIC', '2025-05-07 21:16:30', '2025-05-07 21:16:30'),
(44, 'ASST. SURVEYOR', '2025-05-07 21:16:31', '2025-05-07 21:16:31'),
(45, 'PURCHASER', '2025-05-07 21:16:35', '2025-05-07 21:16:35'),
(46, 'DATA PROCESSOR', '2025-05-07 21:16:35', '2025-05-07 21:16:35'),
(47, 'INVENTORY CONTROLLER', '2025-05-07 21:16:36', '2025-05-07 21:16:36'),
(48, 'CASHIER SITE', '2025-05-07 21:16:36', '2025-05-07 21:16:36'),
(49, 'COMMUNITY RELATION ASSISTANT', '2025-05-07 21:16:37', '2025-05-07 21:16:37'),
(50, 'PLANT ASSESSOR', '2025-05-07 21:16:38', '2025-05-07 21:16:38'),
(51, 'WAREHOUSE GL', '2025-05-07 21:16:40', '2025-05-07 21:16:40'),
(52, 'WHEEL TYPE MECHANIC', '2025-05-07 21:16:47', '2025-05-07 21:16:47'),
(53, 'HUMAN CAPITAL OFFICER', '2025-05-07 21:16:48', '2025-05-07 21:16:48'),
(54, 'OPERATION ADVISOR', '2025-05-07 21:16:48', '2025-05-07 21:16:48'),
(55, 'PLANT SITE SECT. HEAD', '2025-05-07 21:16:48', '2025-05-07 21:16:48'),
(56, 'HRM & ENGINEERING DEPT. HEAD', '2025-05-07 21:16:48', '2025-05-07 21:16:48'),
(57, 'MINE INFRASTRUCTURE ENGINEER', '2025-05-07 21:16:49', '2025-05-07 21:16:49'),
(58, 'SHE SITE SECT. HEAD', '2025-05-07 21:16:49', '2025-05-07 21:16:49'),
(59, 'MINE INFRASTRUCTURE & SURVEYOR SECT. HEA', '2025-05-07 21:16:49', '2025-05-07 21:16:49'),
(60, 'Manager', '2025-05-07 21:47:24', '2025-05-07 21:47:24');

-- --------------------------------------------------------

--
-- Table structure for table `signatures`
--

CREATE TABLE `signatures` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certified` tinyint(1) NOT NULL DEFAULT '0',
  `from_ips` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `signs`
--

CREATE TABLE `signs` (
  `id` bigint UNSIGNED NOT NULL,
  `sign_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_sign_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan_diterima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alasan_ditolak` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sign_documents`
--

CREATE TABLE `sign_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `sign_id` bigint UNSIGNED NOT NULL,
  `sign_document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sign_histories`
--

CREATE TABLE `sign_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `validator_id` bigint UNSIGNED NOT NULL,
  `sign_id` bigint UNSIGNED NOT NULL,
  `news_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sign_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_customer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_news_date` datetime DEFAULT NULL,
  `approved_sign_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sign_logs`
--

CREATE TABLE `sign_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `sign_id` bigint UNSIGNED NOT NULL,
  `log_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `unit` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `egi` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit`, `egi`, `type`, `created_at`, `updated_at`) VALUES
(1, 'CM0030', 'COMPRESOR', 'COMPRESOR', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(2, 'CM0059', 'COMPRESOR', 'COMPRESOR', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(3, 'CT0008', 'P380CB6X4', 'CRANE TRUCK', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(4, 'CT0017', 'P380CB6X4', 'CRANE TRUCK', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(5, 'CR0012', 'CRUSHER', 'CRUSHER', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(6, 'FR0601', 'FORKLIFT', 'FORKLIFT', '2023-07-25 19:44:04', '2023-07-25 19:44:04'),
(7, 'EX101', 'PW100', 'EXCAVATOR', '2023-07-28 01:37:09', '2023-07-28 01:37:09'),
(8, 'EX102', 'PW100', 'EXCAVATOR', '2023-07-28 23:34:45', '2023-07-28 23:34:45'),
(9, 'EX107', 'PW100', 'EXCAVATOR', '2023-07-28 23:35:04', '2023-07-28 23:35:04'),
(10, 'EX202', 'PC200', 'EXCAVATOR', '2023-07-28 23:35:21', '2023-07-28 23:35:21'),
(11, 'EX204', 'PC200', 'EXCAVATOR', '2023-07-28 23:35:47', '2023-07-28 23:35:47'),
(12, 'EX314', 'PC300', 'EXCAVATOR', '2023-07-28 23:36:04', '2023-07-28 23:36:04'),
(13, 'GR1022', 'GD705', 'GRADER', '2023-07-28 23:40:25', '2023-07-28 23:40:25'),
(14, 'GR1024', 'GD705', 'GRADER', '2023-07-28 23:40:39', '2023-07-28 23:40:39'),
(15, 'GR1032', 'GD705', 'GRADER', '2023-07-28 23:40:56', '2023-07-28 23:40:56'),
(16, 'GR1033', 'GD705', 'GRADER', '2023-07-28 23:41:21', '2023-07-28 23:41:21'),
(17, 'GR1034', 'GD705', 'GRADER', '2023-07-28 23:41:38', '2023-07-28 23:41:38'),
(18, 'GS0031', 'GENSET', 'GENSET', '2023-07-28 23:42:03', '2023-07-28 23:42:03'),
(19, 'GS0074', 'GENSET', 'GENSET', '2023-07-28 23:42:18', '2023-07-28 23:42:18'),
(20, 'GS0075', 'GENSET', 'GENSET', '2023-07-28 23:42:34', '2023-07-28 23:42:34'),
(21, 'GS0078', 'GENSET', 'GENSET', '2023-07-28 23:42:50', '2023-07-28 23:42:50'),
(22, 'GS0090', 'GENSET', 'GENSET', '2023-07-28 23:43:07', '2023-07-28 23:43:07'),
(23, 'GS0093', 'GENSET', 'GENSET', '2023-07-28 23:43:21', '2023-07-28 23:43:21'),
(24, 'GS0095', 'GENSET', 'GENSET', '2023-07-28 23:47:59', '2023-07-28 23:47:59'),
(25, 'LD0017', 'P380', 'DUMP TRUCK', '2023-07-28 23:49:01', '2023-07-28 23:49:01'),
(26, 'LD0052', 'P380', 'DUMP TRUCK', '2023-07-28 23:49:18', '2023-07-28 23:49:18'),
(27, 'LD0054', 'P380', 'DUMP TRUCK', '2023-07-28 23:50:08', '2023-07-28 23:50:08'),
(28, 'LD0061', 'P380', 'DUMP TRUCK', '2023-07-28 23:50:27', '2023-07-28 23:50:27'),
(29, 'LD0062', 'P380', 'DUMP TRUCK', '2023-07-28 23:50:45', '2023-07-28 23:50:45'),
(30, 'LD0067', 'P380', 'DUMP TRUCK', '2023-07-28 23:51:02', '2023-07-28 23:51:02'),
(31, 'TL0081', 'TOWERLAMP', 'TOWERLAMP', '2023-07-28 23:51:37', '2023-07-28 23:51:37'),
(32, 'TL0084', 'TOWERLAMP', 'TOWERLAMP', '2023-07-28 23:51:55', '2023-07-28 23:51:55'),
(33, 'TL0085', 'TOWERLAMP', 'TOWERLAMP', '2023-07-28 23:52:10', '2023-07-28 23:52:10'),
(34, 'TL0127', 'TOWERLAMP', 'TOWERLAMP', '2023-07-28 23:52:25', '2023-07-28 23:52:25'),
(35, 'GR1034', 'GD705', 'GRADER', '2023-10-18 23:27:06', '2023-10-18 23:27:06'),
(36, 'GR1024', 'GD705', 'GRADER', '2023-10-18 23:27:20', '2023-10-18 23:27:20'),
(37, 'GR1028', 'GD705', 'GRADER', '2023-10-18 23:27:44', '2023-10-18 23:27:44'),
(38, 'GR1032', 'GD705', 'GRADER', '2023-10-18 23:27:59', '2023-10-18 23:27:59'),
(39, 'GR1037', 'GD705', 'GRADER', '2023-10-18 23:28:17', '2023-10-18 23:28:17'),
(40, 'GR1033', 'GD705', 'GRADER', '2023-10-18 23:28:27', '2023-10-18 23:28:27'),
(41, 'PSCP532', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:28:42', '2023-10-18 23:28:42'),
(42, 'PSCP533', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:29:08', '2023-10-18 23:29:08'),
(43, 'PSCP537', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:29:24', '2023-10-18 23:29:24'),
(44, 'PSCP552', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:29:39', '2023-10-18 23:29:39'),
(45, 'PSCP553', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:29:54', '2023-10-18 23:29:54'),
(46, 'PSCP559', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:30:04', '2023-10-18 23:30:04'),
(47, 'PSCP538', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:30:21', '2023-10-18 23:30:21'),
(48, 'PSCP612', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:30:34', '2023-10-18 23:30:34'),
(49, 'PSCP614', 'SV525D-H', 'EXCAVATOR', '2023-10-18 23:31:12', '2023-10-18 23:31:12'),
(50, 'PSEX593', 'PC200', 'EXCAVATOR', '2023-10-18 23:31:32', '2023-10-18 23:31:32'),
(51, 'PSEX615', 'PC200', 'EXCAVATOR', '2023-10-18 23:31:45', '2023-10-18 23:31:45'),
(52, 'PSEX594', 'PC300', 'EXCAVATOR', '2023-10-18 23:31:58', '2023-10-18 23:31:58'),
(53, 'EX107', 'PW100', 'EXCAVATOR', '2023-10-18 23:32:07', '2023-10-18 23:32:07'),
(54, 'EX102', 'PW100', 'EXCAVATOR', '2023-10-18 23:32:20', '2023-10-18 23:32:20'),
(55, 'EX202', 'PC200', 'EXCAVATOR', '2023-10-18 23:32:33', '2023-10-18 23:32:33'),
(56, 'EX204', 'PC200', 'EXCAVATOR', '2023-10-18 23:32:44', '2023-10-18 23:32:44'),
(57, 'EX314', 'PC300', 'EXCAVATOR', '2023-10-18 23:33:01', '2023-10-18 23:33:01'),
(58, 'LD0115', 'P380', 'LD', '2023-10-18 23:33:32', '2023-10-18 23:33:32'),
(59, 'PM0002', 'P380', 'LD', '2023-10-18 23:34:00', '2023-10-18 23:34:00'),
(60, 'LD0103', 'P360', 'LD', '2023-10-18 23:34:23', '2023-10-18 23:34:23'),
(61, 'LD0107', 'P360', 'LD', '2023-10-18 23:34:37', '2023-10-18 23:34:37'),
(62, 'LD0067', 'P380', 'LD', '2023-10-18 23:34:56', '2023-10-18 23:34:56'),
(63, 'LD0101', 'P360', 'LD', '2023-10-18 23:35:07', '2023-10-18 23:35:07'),
(64, 'LD0140', 'P360', 'LD', '2023-10-18 23:35:27', '2023-10-18 23:35:27'),
(65, 'LD0192', 'P360', 'LD', '2023-10-18 23:35:43', '2023-10-18 23:35:43'),
(66, 'TL0081', 'TOWER LAMP', 'TOWER LAMP', '2023-10-18 23:36:03', '2023-10-18 23:36:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nrp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int DEFAULT NULL,
  `department` bigint UNSIGNED DEFAULT NULL,
  `position` bigint UNSIGNED DEFAULT NULL,
  `district` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `nrp`, `email`, `email_verified_at`, `password`, `no_hp`, `role`, `department`, `position`, `district`, `status`, `signature`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, 'superadmin@gmail.com', NULL, '$2y$10$if3PgJpH0O1nXPni8In.V.cBKalNFrcOAGCNnfr76JkOYU1ShaREi', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-28 06:27:07', '2024-05-28 06:27:07'),
(2, 'Validator ', '1234567890', 'validator@gmail.com', NULL, '$2y$10$if3PgJpH0O1nXPni8In.V.cBKalNFrcOAGCNnfr76JkOYU1ShaREi', NULL, 2, 7, 2, 2, 'Aktif', 'validator/signature/1716878334_ttd.jpg', NULL, '2024-05-28 06:38:54', '2024-05-28 06:38:54'),
(2439, 'MUHAMMAD ASFIANNOOR AMD', 'KA07048', 'KA07048@mail.com', NULL, '$2y$10$emneAhpWf07vHrTIAUL3tOsOQPL2BORYRRSV.NzY9fZ5lTZjJXY/W', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2440, 'MUHAMMAD RISWAN ARIADI', 'KA08009', 'KA08009@mail.com', NULL, '$2y$10$70XUCD66ixX3y3AKF6RLvO1im4Z6JpkAItLk7AnoEGv7Td9HzBxcy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2441, 'SEPTIAN AFRIZAL', 'KA09020', 'KA09020@mail.com', NULL, '$2y$10$RXabc57vgk6kUlhyROo0k.ewZ1nRzb8FZPA3vN6W5z7U2qgmgWRkW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2442, 'SUPRAPTO', 'KA12016', 'KA12016@mail.com', NULL, '$2y$10$ePnLMeWW1GoQ/tLdd/5lFuURUNrFE8On4qeZTE9vfko5c1IdOPyvy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2443, 'REGNO KHRISTIE', 'KA18003', 'KA18003@mail.com', NULL, '$2y$10$u6YWFjGN4a5tnjIuPIjy8.ujzo9EhACdikzSWBWRiQtc4XhhxG0qm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2444, 'MUCHLIS YULI PADELI', 'KA18004', 'KA18004@mail.com', NULL, '$2y$10$YprVfPKIvlBI/3RkT16mceEAgfkY6GIpHQ3xgI7SKcZ20YsFnEgGe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2445, 'ABDURRAHMAN HAKIM NASUTION', 'KA19007', 'KA19007@mail.com', NULL, '$2y$10$sQKnNrM/fquIGdVT/tHSJuIL8ljZ5alrG4MWfNTUfgpv4E6HFXVwm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2446, 'SEPTI AJI NUGROHO', 'KB08006', 'KB08006@mail.com', NULL, '$2y$10$gf94TzO8QyD.21QWpL5dPelF1hvhckT.g8c6Uw7wpLj84eJxmHn7m', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2447, 'MOH. YASIN MUSTOFA', 'KB09078', 'KB09078@mail.com', NULL, '$2y$10$EqxOImmbXjZ0sYfiBIyx5uJ1Spqeo4q3NfGT5lu8fFuLs.CnJckx2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2448, 'UBAIT BUDI SANTOSO', 'KB09098', 'KB09098@mail.com', NULL, '$2y$10$5NOD1pO8zCvAQ/SvSL3.ce5t2Mn1QdUDFYqjiV61t4GxC0AieBzEO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2449, 'FENDI ARIFIANTO', 'KB11061', 'KB11061@mail.com', NULL, '$2y$10$gmiUyN4XIiJQcskxhBUM6uupa.6x8kHz6tKIsdmpxOulB96sU31eu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2450, 'PRIYANTO', 'KB11206', 'KB11206@mail.com', NULL, '$2y$10$IEoZBYXTHAdT/xPr9nj1WOLzs8x25jxkttjl6igo4gpoCF9k3Fqq.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2451, 'HANIP STIYANTO', 'KB12113', 'KB12113@mail.com', NULL, '$2y$10$NsoRMyuC/hC1ql1Fz02Hb./kfg9ABqNL7jIcif/Iv/0QfwAQ15Eme', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2452, 'IMAM TEGUH WIBOWO', 'KB12131', 'KB12131@mail.com', NULL, '$2y$10$o8yyhtPugbs4jeVY0cGDTu3IJ3FPYvveSK20J8UUPiNaNLHkfa5ZC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2453, 'IMAM NUROHMAN', 'KB12153', 'KB12153@mail.com', NULL, '$2y$10$zNrUN9BOfPp.Jlzb/GUVi.ectbtZ6t82HVRR1sv2Wi.zqF1Xi.jqy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2454, 'RINGKO ALLANSI TENLIMA', 'KB12198', 'KB12198@mail.com', NULL, '$2y$10$rhJsPBqzC6whjTelUgoaI.EtUA0azq6D0agu5aHxbMCRBAyAY20XK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2455, 'PURI MAWARDI', 'KB12204', 'KB12204@mail.com', NULL, '$2y$10$FxAOZ1kU8wC2sbkpvgsByuZZy2JqQHosCyfDM4hl0.TEGKbrF1zxq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2456, 'ANDREAS WAHYU UTOMO', 'KB13283', 'KB13283@mail.com', NULL, '$2y$10$/D8dLADriHi9by4QX98Ry.1ZvYa95gJ.iUiki0HYgLADfet8ArYFq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2457, 'AGOES TRI FITRA SAPUTRA', 'KB13289', 'KB13289@mail.com', NULL, '$2y$10$TCNK7rKH3kJPYdwzGuMRfej3vTg16fXuZZ8uhxqIrD5GyAlDqfYXG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2458, 'NINNO ZULKARNAIN', 'KB15015', 'KB15015@mail.com', NULL, '$2y$10$nBLGimBHAJHxqCG0jnHka.vRwzHK6NPl06I4mDYaCdhvC2FoCnGeO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:38', '2025-05-07 21:36:38'),
(2459, 'ARI ANGGARA', 'KB17020', 'KB17020@mail.com', NULL, '$2y$10$QbdyMn8ERrSmvzsERrfy0uGX6ehy50mXbSMs3agGPotA0YnjSWh/u', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2460, 'JAUHAR MUSTAFA AL FAUZI', 'KB17032', 'KB17032@mail.com', NULL, '$2y$10$iMChwNpSLDWTQAknBzplb.pBx3QV5.XhOAuRPfN5FxPoDvu2PJQNO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2461, 'AFRIZAL YURA PRATAMA', 'KB17046', 'KB17046@mail.com', NULL, '$2y$10$2CTecrUkAY5kHfxkjXIbLe8iinC7HdTd0wkHyt/vcm3QkeRLNT3Uq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2462, 'YUSUF AL KARIM', 'KB17154', 'KB17154@mail.com', NULL, '$2y$10$CtV.cN.X0Ib2uSObAT/RmODmQyvIWm404RlBK6ixftqPe0K8uJ4.C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2463, 'PURNOMO', 'KB18027', 'KB18027@mail.com', NULL, '$2y$10$gSKL1/a3ZRqB2OTXxuwWUemJl4Uw/AFi3dInWS/nisrLh4xz/pYi.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2464, 'ABU SOFYAN ROMADHON', 'KB18028', 'KB18028@mail.com', NULL, '$2y$10$1Pd/iWkjH/SYVkoOjkua3Ou3mURQAnWgmvOA2JVOUmHprFyEpPRl6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2465, 'AAN WAHYU PRASETIYO', 'KB18029', 'KB18029@mail.com', NULL, '$2y$10$zWZ5SH6B2XHwbIGcUucKF.t61.DgLtgAkPC17IkPn.c9DPrgEZ906', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2466, 'ADITYA ARGANATA PRIMADIKA', 'KB18062', 'KB18062@mail.com', NULL, '$2y$10$z7z5w8F2un.x8123QAay0OS4oKwqtWQB3c/hp32ac1BccPgdJF2Ju', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2467, 'YOGI APRILIANTA PUTRA', 'KB18068', 'KB18068@mail.com', NULL, '$2y$10$dWof/RmF8KJwf3HdaM8qEuW16x41ZbfR73J/2//2QdCjj24HX0D1S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2468, 'FAWZI ADI NUGROHO', 'KB18084', 'KB18084@mail.com', NULL, '$2y$10$mzxadzltTSTeetfXiUG1BeJgY2DNz4xb3uf3t9sZbH3et05PSmtWG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2469, 'ARIYO SUPRAPTOWO', 'KB18092', 'KB18092@mail.com', NULL, '$2y$10$o0Cws14WJMx5trlWq8EpLe63/lEk68whQpo4vdfJaV2bdqfN/gYva', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2470, 'RIKHONO', 'KB19016', 'KB19016@mail.com', NULL, '$2y$10$h52BBF/IXu0zk0cvIi66TOBuWQsRgBYJrahe2Yz4jAPwoTNAgiPKK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2471, 'REFANDI', 'KB20001', 'KB20001@mail.com', NULL, '$2y$10$oZFomlCEQcBdfCTM3pgKRO.fb7rJtIKOFmRSoIjsGlQ8G3rDZiGoa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2472, 'BACHTIAR FEBRIANTO', 'KB21073', 'KB21073@mail.com', NULL, '$2y$10$5ICjU.l.9hxcQHYCCJKD3.5FIDUQhoYgmTJMrnOxRoiNb9/Crn8/6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2473, 'HASNA ATHIYYA YUMNA', 'KB22001', 'KB22001@mail.com', NULL, '$2y$10$2QYfKytRlP64Dt6j0STMBOoTeRXckbBZCRmDwkQKUZbboQ6MJZU0S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2474, 'MUHAMAD IRFAN NAUFAL', 'KB22106', 'KB22106@mail.com', NULL, '$2y$10$FjIp/621W9m8a1F90mZro.QT25xTO16uWq5PZNLNcOAMHngqAC0yq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2475, 'DENI NABIL SULTHON', 'KB22109', 'KB22109@mail.com', NULL, '$2y$10$2L2DcEkt1sjqqkWeJNPNJug6684Tlmbn8/WyuR5hrjY2kUax/uX02', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2476, 'NADER USMAN SHAHAB', 'KB23040', 'KB23040@mail.com', NULL, '$2y$10$qH1frXr64dNjTJn0rCzYE.qJ5ZLkw6G.MOdY1gw1AtGki/gj6Zsri', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2477, 'YULAN SADEWO PUTRO', 'KB23055', 'KB23055@mail.com', NULL, '$2y$10$37xNHy/E8717QgO8LdpGy.slXR9dJjMxAUGjINuGL/FNKtKBe8N5C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2478, 'MUHAMMAD SYAHRUL RAMADHAN', 'KB23067', 'KB23067@mail.com', NULL, '$2y$10$iO4MrZy4pczepEiLi50cyezWnCdGNQnc4MDDXfChN.E0f3uXbppYy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2479, 'YUSUF NAUFAL FIKRI', 'KB23119', 'KB23119@mail.com', NULL, '$2y$10$.enr2rsX0zdTeqcA6Um6/Ok/oJe.WsOFYJzBp6jRgqPPrGWJKZWIG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2480, 'FIQIH RAHMAT TIYATNA', 'KB23143', 'KB23143@mail.com', NULL, '$2y$10$r51/2Yz9HeBlAwfg5kJnL.KFr5pByM4Z0P4b6a03ow.e7VX9fnPb6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:39', '2025-05-07 21:36:39'),
(2481, 'LUTFI ALFAN KHOIZAAIN', 'KB23144', 'KB23144@mail.com', NULL, '$2y$10$dMaG1eJC4HSpzc6vYELMcu.kLazENqX8ibur.kjHT0..upoIkREzu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2482, 'M. RYAN REINALDI', 'KB23151', 'KB23151@mail.com', NULL, '$2y$10$.zrblFjVJaowUnKhZqfATeH3YcYwWcT59MWHyZYxSbhEG4JPyrEb.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2483, 'SULTAN NAJMI AKBAR', 'KB24002', 'KB24002@mail.com', NULL, '$2y$10$uoKZNvNGQiHQwuwKtGD0..eOOVJu..ci020jq1p8nW2ibK4SdcZWi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2484, 'DINDA AYU AMALIA', 'KB24012', 'KB24012@mail.com', NULL, '$2y$10$sPTbVdYMMDOyjrZMLg.laOEPM7RWbazUXHVKfOo72y.V1sLA14rUG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2485, 'FEBRIYAN NURMAS GAUTAMA', 'KB24027', 'KB24027@mail.com', NULL, '$2y$10$XJ9SM15JBMtrcADTxpH7IOe14.DHGQnk7.NPUgQT6r0d09X2nAKDK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2486, 'ARIS WAHYU DARMAWAN', 'KB24033', 'KB24033@mail.com', NULL, '$2y$10$aZWCO0PRytaT4LRF1qrV.OamJJO/eqbqXFecUf5.h39qrlVaFB5Ke', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2487, 'AZKA FALIHAL HABIB', 'KB24059', 'KB24059@mail.com', NULL, '$2y$10$x7la7tzo67zuq5AfvKC4QOwVot5KSNUXzrYrO7gvQQyhlh/climbS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2488, 'FANSA LINGGA KALIQSA', 'KB24073', 'KB24073@mail.com', NULL, '$2y$10$5WLQkI0O1iUBX5V8NTziNuZR5wHI4jR5OvdXXhdysV2pzDNdbzB6.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2489, 'GHOZY TAQIUDIN AKMAL', 'KB24104', 'KB24104@mail.com', NULL, '$2y$10$G7byyGFrk6YxgCuOgp4exe4e.KA.pX0a4mM2x0TeAs0utLmwk9s6a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2490, 'TUBAGUS PUTRA DHARMA', 'KB24128', 'KB24128@mail.com', NULL, '$2y$10$9tj81VfdtnUieSVYzS8b9.ZUwXKfvFhOvh.l3uGjQBEqaoW1uELl.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2491, 'MUHAMMAD BAHRUL AMIQ', 'KB24132', 'KB24132@mail.com', NULL, '$2y$10$BAKRoorEey21d1CbXkEIveDm9nDZPjeuxNc0i8vSHwURhBrd.pCjq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2492, 'FAKHRIZAL KRESNA QUSZANAH', 'KB24183', 'KB24183@mail.com', NULL, '$2y$10$BRFYv6KzjCRWxpmo4bWaIufnm.hP3fM4FZ3uTx78uKjiQtY0UTH8G', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2493, 'NABILAH ZAIDAH', 'KB24191', 'KB24191@mail.com', NULL, '$2y$10$bTcvrMIkZefqrDXcqWQIheM162dNOMtGym3tROPs2A8MYGKWDrw4u', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2494, 'RACHMA KARINA DEWI', 'KB24218', 'KB24218@mail.com', NULL, '$2y$10$MXg6zA/UhhNo5Lb2D.lpxOFTiSFFv77ofOfepadK6sfKiDbJ3Pqvi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2495, 'RIO TOTY SAPUTRO', 'KB24224', 'KB24224@mail.com', NULL, '$2y$10$vCZ6snENu/DiB9wq7xUOyuUOu//KtALc4oyGgjNNRBFBTTSXo5qTS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2496, 'DEWANGGA ADITIA', 'KB24310', 'KB24310@mail.com', NULL, '$2y$10$LEPLgbfeqHqAC/tKZD/qNO5faUpByvgiv.JUKDy2JEHJfQPh/4GBW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2497, 'MOHAMMAD IBNU JAFARUDIN', 'KB24314', 'KB24314@mail.com', NULL, '$2y$10$YBJuNOI5PKxoG04uyJKuyup4O/cPfQPsWpuW2s.CaLOXoEUuwS5GS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2498, 'DIAN RAMADHAN YUWONO', 'KB24345', 'KB24345@mail.com', NULL, '$2y$10$tNfKtXgADzRVL4818Sz8/ea/KYJD7Ox2zGsUR1vNIg1lCiL2xjTUa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2499, 'GULANG EKO CAHYONO', 'KC10045', 'KC10045@mail.com', NULL, '$2y$10$HyBnrrmtzWnxFVcrJ07xRuQ1Oa2LhUrUi7g9MG00MqOyIp4nhvC5O', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2500, 'ANGGA FITRI APRIANTO', 'KC11092', 'KC11092@mail.com', NULL, '$2y$10$5TX7QxHVsfiBnSWIU4je/OuaXFyOv5aBXfFf5CrSFtUO5G7ko5UGW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2501, 'AKHMAD YANI', 'KC11121', 'KC11121@mail.com', NULL, '$2y$10$wptA5yjaqyO1SQ/IZaIwTeRoSjWWhHgk4H6CqJLyioGiPAQeSUdEe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2502, 'BAGUS ARIFIANTO', 'KC12097', 'KC12097@mail.com', NULL, '$2y$10$YYh5s85XHQw5UxsZjdS9J.4B/EsIPJRq.DVoyDLmsrYqwCkqEgeAe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2503, 'SANTOSO', 'KC13047', 'KC13047@mail.com', NULL, '$2y$10$g6jRK1dQF8bVDkrWCyizFuVTGWkX8EKedsrbFed0DPRghSHFOeNTG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:40', '2025-05-07 21:36:40'),
(2504, 'AKHMAD YANI', 'KC14018', 'KC14018@mail.com', NULL, '$2y$10$XqzQhIYnVN0vsi72eRqOjuno0QzXG.HI7fEKI/0omIgGXkiWQ2noO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2505, 'M. RAMADHAN NOOR', 'KC15010', 'KC15010@mail.com', NULL, '$2y$10$z3d8A/0WhqzSZyI.bBNMBO0y3HC2uifJu7ae.1jAKsWwi4zCecmlu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2506, 'MUHAMMAD RIFQI', 'KC19001', 'KC19001@mail.com', NULL, '$2y$10$gw0mJLoFDwdCv3ooPh8AG.90fTFxAG9cycsK1KSy2oZUafm7z5DuO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2507, 'ZAINAL ARIFIN', 'KC19004', 'KC19004@mail.com', NULL, '$2y$10$EPTmBsgKlUHvZuYhjLSx7eVRB11SOadgF3VALrdgZHL/vz7gItkL2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2508, 'SAIFUL DWI RIFA\'I', 'KC19010', 'KC19010@mail.com', NULL, '$2y$10$H65KAOrAe30bgAdrjUg56u8UUYj8vMOg1FJlFpLhEBnPcaflxSMv6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2509, 'MUBARAK', 'KC19022', 'KC19022@mail.com', NULL, '$2y$10$WRWekfqcmYjRJ.Z.uBSwfeiYs/7FGyYg8BSWFnsrujuV3qBQB4CqO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2510, 'MUHAMMAD RIDUAN', 'KC19034', 'KC19034@mail.com', NULL, '$2y$10$wX4vZA9MClB4Bdy2m9Uxje9hCFpO3zX1Vumo5jz9e2WX.LCnHPdPu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2511, 'MUSA', 'KC19038', 'KC19038@mail.com', NULL, '$2y$10$S.Dp5GQrTEbBjenTt7CsPOeNAxOteI3gzsKRPC49JDlkHVL1tepUu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2512, 'M. RIFKI NOVIYADI', 'KC19044', 'KC19044@mail.com', NULL, '$2y$10$n7lkHFQh6RTfq0P/jtLNIOisbCGmJpS3Q1veVn3dsXcovDJLKuBqy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2513, 'IBNU RIYAN SAPUTRA', 'KC19045', 'KC19045@mail.com', NULL, '$2y$10$68BrS083szdNWpL.LZIs/uk00NXaD8TRgYu3BusKDmYPxIaqrznY.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2514, 'MUHAMMAD RANDIANSYAH', 'KC19051', 'KC19051@mail.com', NULL, '$2y$10$7V2IR3Qg75TrSAfQ1hml.eVZS9SP.IVO6qeNV.2W9HxIYUkHM7ASK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2515, 'NOOR SYAHDI', 'KC21001', 'KC21001@mail.com', NULL, '$2y$10$/hMr3dPpwa997rxhJI.F1e3DgqSxMfB5RyEdZUflmfW0OdQsAvaA.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2516, 'MUHAMMAD ZULKIPLI', 'KC22049', 'KC22049@mail.com', NULL, '$2y$10$M5zZmPngkZyvPgdgxNb1jOsmPHPaUC/qVotXuzVA7RMKIZ/yzVp8a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2517, 'RIFALDI HENDRIYAWAN PUTRA', 'KC22050', 'KC22050@mail.com', NULL, '$2y$10$s6lyYR/sjk.5OzRKwdc8GObowJnWp8fwZ8/LFUF6Cc7MovuWYnxV6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2518, 'AHMAD RAAIDDIN', 'KC22051', 'KC22051@mail.com', NULL, '$2y$10$PIOzTTblCqyTZlUq24.2qupCtJVzh2ADTtdn0SxE864wH7GjOKC86', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2519, 'MUHAMAD YUSUF', 'KC22121', 'KC22121@mail.com', NULL, '$2y$10$edozvFyQk9Ze0czAPrLFD.AeT.fW9988u1sXLhZyxuxV/rFXZzi8a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2520, 'MUHAMMAD TESAR', 'KC22126', 'KC22126@mail.com', NULL, '$2y$10$2YSjdKQM9YekhXg6deg/SOOlkkKnsnSKdjbPIPvhdIBCbR4WEDTQ.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2521, 'MUHAMMAD BAGOES RIAD', 'KC22127', 'KC22127@mail.com', NULL, '$2y$10$m/ncuDNUjYTeRWgRwlIMK.VFLoVfmPnhxMa0.8iSRUJDZIZbbIp4O', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2522, 'RAHMAN ZAILANI', 'KC22128', 'KC22128@mail.com', NULL, '$2y$10$y18JXWG2Zj6UOxWssktPOuvgRba73YVBVEt2oW7StVyNP3m/dIBOi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2523, 'HADI SUWITO', 'KD10011', 'KD10011@mail.com', NULL, '$2y$10$SAu9UNUPXzLlQ1rDwRnPrOIx1SvloeCk42oc8ZykYLXwDfaqtS6oa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2524, 'HERU PRASETYO', 'KD10017', 'KD10017@mail.com', NULL, '$2y$10$RLn47VLfjKsh274AUT8n8../oaRj1V4ZbmS.JKgVlquoNruZ0rEpC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2525, 'MUHAMAD RYNO DIONANDA', 'KD19009', 'KD19009@mail.com', NULL, '$2y$10$UihXqMLItYeX28Ipcv3gyOvSyzFEipf8CEWFv44J70vdAzrQ9Aumy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:41', '2025-05-07 21:36:41'),
(2526, 'ZAINI', 'KD19010', 'KD19010@mail.com', NULL, '$2y$10$SUYptWGYO.XUeyuCGqvJn.tUWwKAXsYaKozmkmsEkKAfBtqx54MNK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2527, 'MAHRIAN', 'KD19015', 'KD19015@mail.com', NULL, '$2y$10$bnwda.trFqicrNd.vpZbi.ARxjzB4txRZPUEp4CU0WmyTcNn4GOQm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2528, 'KASIYANTO', 'KD22004', 'KD22004@mail.com', NULL, '$2y$10$kcQDaSBeocfSzvOxzQ2Ag.HnP50vyHJ6xx1j42X5kK4w6mazx6pue', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2529, 'MUHAMMAD RHAYYAN AFWANDI', 'KD22005', 'KD22005@mail.com', NULL, '$2y$10$g1pyopFS5YBX95bEprjWW.3MaRbqzl4HFkYgr76eKT84asnp5Ts12', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2530, 'AGUS SAPUTRA', 'KD22006', 'KD22006@mail.com', NULL, '$2y$10$.q7J9Da1B7HYBGq2YLGmIulnPM/NB5f8fyUiwuFcdC6zmmiqlucXy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2531, 'ADNAN LUQMAN SOLIKHIN', 'KE13007', 'KE13007@mail.com', NULL, '$2y$10$6qCEIBmeV4.e5dYs6YS1FOcNBa/cxxEl.3nPxsOuf/dl4PPYBOhdm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2532, 'RUIS PREMONO', 'KE13017', 'KE13017@mail.com', NULL, '$2y$10$NPyL3o4ZdWL8fTOQMVZFZOExWsqL56U5uVCJnhNvvSmrVY1VzO0Mq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2533, 'JEFRY MARJUKY', 'KE13019', 'KE13019@mail.com', NULL, '$2y$10$R7Fl8jluh2T3yf5927UpeOOcK2k3XHqCqil2C/qMYEwedxZoJLFXy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2534, 'WAHYU PRIHATIN', 'KE17130', 'KE17130@mail.com', NULL, '$2y$10$.ya4BWfghfO4F8RWJNHexOtHdSQD9wrflDYGeQ8idmigTJhdbbB7G', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2535, 'MAMAD ROMADI', 'KE18053', 'KE18053@mail.com', NULL, '$2y$10$AxlBFzKI4NgQLK9bSqDhNeceP4hW4LmlisfiDEgffha10OgLbK602', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2536, 'AHMAD IRFAN ADI ASTOMO', 'KE19007', 'KE19007@mail.com', NULL, '$2y$10$FaCBhgqtud5O17lmnemjNeTc6A75WGqrly/gE/0.m7v5EnjzdUfLC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2537, 'DEDY TRI SUTARDI', 'KE19008', 'KE19008@mail.com', NULL, '$2y$10$j5HFOeJHIXsTwmTGgnBpb.LkpDcQI2F9BfLDPIXnmr9Z8bx/BVrv6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2538, 'FAJAR ELVAN RENALDY', 'KE19044', 'KE19044@mail.com', NULL, '$2y$10$7HWwzbd5Ee9w1CCkkvu6D.4d/9fjAZRs1oFkjlIdKdcjMq6BN.jEi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2539, 'FRIZKY TEGAR JEFFRI PRATAMA', 'KE19045', 'KE19045@mail.com', NULL, '$2y$10$CyMW7ANJCe7eb57f3zpF8OkE1E2kU2k7WYspa6pkfxumK4MKDh6pG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2540, 'DILI ARDI YANTO', 'KE23036', 'KE23036@mail.com', NULL, '$2y$10$.g.mIXju8wCAQ3xkN0KIXOVb5U68WRZsKE2n8f6SPoXV8wOvGH0Oa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2541, 'MUHAMMAD ARDIANSYAH RAMDANI', 'KE24055', 'KE24055@mail.com', NULL, '$2y$10$LOmtgDUw1RzO3AuELSPC..20LFxwriD0TUHXhDAtaYJ9pWBB8HoM6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2542, 'HERU ARI WIBOWO', 'KG21040', 'KG21040@mail.com', NULL, '$2y$10$Pd6s16VsXrxaLhdBxTv/WOr8/iIOl/XMSFzh0r/gc5g.BPvvPRgVu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2543, 'ZUDHA FAHRUROZI', 'KG21054', 'KG21054@mail.com', NULL, '$2y$10$HnbzDEgBxkju9vXL.UoTeefDtzsLHS6ZbR1a2uv4v5UWtugx9Gn4C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2544, 'ANDRI JEREMIA SIHOMBING', 'KK24078', 'KK24078@mail.com', NULL, '$2y$10$NpzH720EInk/lHjB6GeTbOkzimHDbcs4RBFRYJqtOBv1RuMAKE0BC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2545, 'MUHAMMAD TAMRIN', 'KK24120', 'KK24120@mail.com', NULL, '$2y$10$XXaSjCRjSzoF09qpsk7B/uaRlL0xn6nSXKwS9VYcKrdJBQ0JNVX7O', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2546, 'MUHAMMAD SYAIFUL ANWAR HUBEIS', 'KL17192', 'KL17192@mail.com', NULL, '$2y$10$HiX/bhe8d20C76PhHgwrXu3NOcM8vA/CsBHxjpzT.x2wkC2QrAIba', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2547, 'SLAMET BUDI RAHARJO', 'KL17246', 'KL17246@mail.com', NULL, '$2y$10$5MYOCZEfbuEhxUUT0gyAw.uNqnpiffH9foyDV4Py4NNmOa9dPxvCK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2548, 'AHMAD SIHABUDDIN', 'KL18297', 'KL18297@mail.com', NULL, '$2y$10$hfDOQRjAJkPhPtT0gqo/I.32CeH3gV3zzF7oGynQS5Nntj6ndopZu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:42', '2025-05-07 21:36:42'),
(2549, 'RIFAL DIANSYAH', 'KL22331', 'KL22331@mail.com', NULL, '$2y$10$7EJkpe4NUWYrhU6BuTiyCebW73ZHU32T.qrycMRN4s5tBqxX5k5tC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2550, 'DWI SURYANTO', 'KL23100', 'KL23100@mail.com', NULL, '$2y$10$Uy5yTxsTW4Q7aYDNo9rRZOAfU99GhRsQURFq.Lxxx1FqYKQ0CuFwS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2551, 'MUHAMMAD ABU MUTHOLIB', 'KL23101', 'KL23101@mail.com', NULL, '$2y$10$VNy38coJy0NIybsRW/b0JeDzERc4Qpmc0TAoQXmL5XPDR.4Jjbxsm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2552, 'SAHID ALMADANI', 'KL23123', 'KL23123@mail.com', NULL, '$2y$10$L7Pu03cva51jMHLXK8l9a..2unFyeiU9iA.T9Ssu0LDQB91FJKoJi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2553, 'HARIYANTO', 'KL23124', 'KL23124@mail.com', NULL, '$2y$10$x2EdJt2DRPi3L0Qgrs4A/esYHCkWNoqjvMjw98qFwLTnK2E2Vs5pm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2554, 'FAJAR JULIANTO', 'KL23142', 'KL23142@mail.com', NULL, '$2y$10$gJbCmuuwxTo1YTkrJn/N.OenYDmuoVIFiQ63AdY.t9uhW72d0mWsW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2555, 'MUHAMMAD DIVA RAHMAN', 'KL23374', 'KL23374@mail.com', NULL, '$2y$10$tqQKftjzZEtHQWnEVf4VmOGOPLgHQTF5ZsumkqSoKNupfyDJfkL.G', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2556, 'AHMAD HANIFUDIN ARRIZQI', 'KL23568', 'KL23568@mail.com', NULL, '$2y$10$yJPd2hWqhe3GAqSslRzwZe.FXeH/KjoiaMA0iFTxq8qXCB5moQbpO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2557, 'RACHMAT IRAWAN', 'KL24012', 'KL24012@mail.com', NULL, '$2y$10$2NGizXqNKZ9NXiIc/PQoje0gFd.scpe3vjQv21ZgyCnnE42hXvdsi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2558, 'HENDRIK JONEDI', 'KL24286', 'KL24286@mail.com', NULL, '$2y$10$.EGtYFAl0IE5Ad.TdQ7SzeFtRizWA//gvRZgwN1q6KzTISib9fJD6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2559, 'MUH HENDRAWAN KADIR', 'KL24316', 'KL24316@mail.com', NULL, '$2y$10$a.aJNe8Cp9aRS7.fZ9ykEuBM6Hyv9e8/GQULinYlM/lS/3vFFjhIy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2560, 'MIKAEL PALILU', 'KL24350', 'KL24350@mail.com', NULL, '$2y$10$TYwkiQigrtUfysb.E8pwPOeVSL3Jqo/gYWkGnyE0.N9a.28mPYmOS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2561, 'FRANSISKUS ARIANTO VALO', 'KL24374', 'KL24374@mail.com', NULL, '$2y$10$ydm6ILzKM.3n8B1GCcw5oumjvk8ytg3Mn3v/mucmnD8X.JdaqkAFm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2562, 'ANDRY RAHMADANI', 'KL24377', 'KL24377@mail.com', NULL, '$2y$10$KKEHLAm8poyA0fpm5S/wrOKAVy/mw3.8ZnoXExoP8oowSLmmlkmoi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2563, 'M SYAHIDIL MURSALIM', 'KL24380', 'KL24380@mail.com', NULL, '$2y$10$rsIABAlxZ4of7cRIwUVpLeyiRc1OX1YHVZuLzoCTMRhr7Cqt0inQG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2564, 'ADI SURYANTO', 'KL24382', 'KL24382@mail.com', NULL, '$2y$10$RUZ9J7lGwvZ2oKWjJKECV.WWTwnKM7tYAfj16qgekZxVTW9a8wid.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2565, 'ROMAN METSYU KADTABALUBUN', 'KL24393', 'KL24393@mail.com', NULL, '$2y$10$DapQiefIovcCzN80QCih8uMCGokuN3.S2jr92bMcALot9BopR9Z.q', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2566, 'JANRIANTO JANRIANTO', 'KL24483', 'KL24483@mail.com', NULL, '$2y$10$yBj.0tv0QxlNATwafDadIe/mhWHfC6OB2fUjjcvcL2WUpdpfsQnWe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2567, 'HARTONO', 'KL99001', 'KL99001@mail.com', NULL, '$2y$10$2twRPyuf4emIypurJpy7cuvyvu5pEWura/N618S/IDodgmkY439Fi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2568, 'IVANA MAULIA RUZIQA', 'KM19009', 'KM19009@mail.com', NULL, '$2y$10$tvbmuDU/t2dUWgTnKM9R/.OkRKctmRBU.qwg8C/yX0LOVrvXXHUli', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2569, 'YUZAK RABIN A.G', 'KR12002', 'KR12002@mail.com', NULL, '$2y$10$bmhHW5iK9lQQVEF3tO.JqeCPb9wzI3WzdiNRsNKF./HLlWYhsSZEy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2570, 'JAGAU LONGOS', 'KR12004', 'KR12004@mail.com', NULL, '$2y$10$ZhFgjoBE3OBMqOeoh5s/1uChe6ZeWAeQ3UyabUdB3zgwL.NIcOWne', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:43', '2025-05-07 21:36:43'),
(2571, 'JUARNI', 'KR13001', 'KR13001@mail.com', NULL, '$2y$10$zZPKGcLaUCyIYSIVgtOXt.8WIfMVbYixF.kvMLPcrLSek6y2kUJaG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2572, 'KARMINTO', 'KR13006', 'KR13006@mail.com', NULL, '$2y$10$KlZ0jGGmeQsKPPCBFLjmtOsp6e.56x0uD6MJu6liHoQ4bpZ3du3Va', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2573, 'PERIODE', 'KR13007', 'KR13007@mail.com', NULL, '$2y$10$rlhaP3lxPBeGhXk2OSwwBuOUCpuYH8cgcfUqJvqEFX4OFR6YkgsDS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2574, 'HERRY GUNAWAN', 'KR13010', 'KR13010@mail.com', NULL, '$2y$10$AMGDZEyqnsH.meUWSitigO84gXCOjJfry6iHKck6v0gGJebeitmi6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2575, 'DEBBISYAHRA', 'KR13011', 'KR13011@mail.com', NULL, '$2y$10$DxBSggWi548zhshyomXODOqp.2NcttXw0I5zwpqQMg.rXcPGeYEEi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2576, 'YULIANUS', 'KR13018', 'KR13018@mail.com', NULL, '$2y$10$VkmJ.D6HhBxuBxhMaLA3uuc1PNiNXXx62kk.vBvgnK5MCUMh71Vbe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2577, 'MIFTAHUDIN', 'KR13027', 'KR13027@mail.com', NULL, '$2y$10$RcMJ5e13a/ed7VPs4bRRSeYbKPDR4iXdDS9739rWxEMNmTSyJo8x.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2578, 'RUSTAM', 'KR13029', 'KR13029@mail.com', NULL, '$2y$10$eFp5KOyNCtJhKirDOFaxfOxNZ1faBrrmt5wdH5/H4BIcM4ExElxsK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2579, 'MUZAYIN ARIFIN', 'KR13032', 'KR13032@mail.com', NULL, '$2y$10$OU7cf6K1gwU6WxhA92z2t.QNX14xlkG4Xm8YfHFJB875fNnFw/x72', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2580, 'JOLIO', 'KR13038', 'KR13038@mail.com', NULL, '$2y$10$kFCW7O6AxtA/Z/ArzqMwl.STc3ybWnsSivs/5pjcKIuQ2VEcDkh0i', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2581, 'WALDI', 'KR13042', 'KR13042@mail.com', NULL, '$2y$10$HlB7TcKVhrBKK.CBbfG/xu2pFaf3z9dkfEYHbyBLShA2wd2P0Nksy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2582, 'SURIAN EFENDI', 'KR13043', 'KR13043@mail.com', NULL, '$2y$10$xdESgLbXkAAc7qz9S.WJAunsnRFiIyIYArSsJCpJwUtID6CBtATc6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2583, 'KHOIRI', 'KR13050', 'KR13050@mail.com', NULL, '$2y$10$8juoQCCvxdMPdkA6Jfd3WeOlXIz6vXoIrST3sARw2AKRrPa7yJcVO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2584, 'INDRA SUSANTO', 'KR13052', 'KR13052@mail.com', NULL, '$2y$10$n8em8002pgcwre7s8rafC.yYrA65PJMeD3gNXwb0XuM/XLyOnHrqy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2585, 'HITRAYADI', 'KR13056', 'KR13056@mail.com', NULL, '$2y$10$6E04exXlN/UwPWf67a3mv.WeA..qSDiU8MwkVN45Pt6Ucvw39EtI2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2586, 'TOTO SURATMAN', 'KR13057', 'KR13057@mail.com', NULL, '$2y$10$JSlUG4pKNYF65sIGEOjBxOdNe1mv6vOxGNieA4QmnoQANB2rJuKoW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2587, 'AGUS', 'KR15002', 'KR15002@mail.com', NULL, '$2y$10$W1vdQpwhX3TkVLxj1de57OXR7dwG/y5us0sGi91hQy9M9s/mjZw3y', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2588, 'AKHMAD GADAFI', 'KR15003', 'KR15003@mail.com', NULL, '$2y$10$QfWX.Dadws8Pk/mUVERTze3VCnDoiISgwBHOsQJnAMKZY51nKLdbm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2589, 'FAHMI', 'KR15005', 'KR15005@mail.com', NULL, '$2y$10$ktSUqNbhc3v5Rgq6fOT.c.Pe1y0u/jAIfrTulqb9VNrgrvzyHrlGG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2590, 'HERDIANTO', 'KR15008', 'KR15008@mail.com', NULL, '$2y$10$0WlP5xsCdR1pOIuReRreFueLl1PjlhfIehaee1qZZAW1MUZmFXoIa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2591, 'JECSON VIKTOR', 'KR15009', 'KR15009@mail.com', NULL, '$2y$10$xcpjrFVadAy4E/P66SSFJuarO89hje6OswS0kkk7x/D/fs00zixDq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2592, 'MARSELINUS LEBA BAI', 'KR15011', 'KR15011@mail.com', NULL, '$2y$10$mvilTcFWRTPDcTGfbJ.HTuTsMWnbG7xAK9SdFQ3XvWKoqTGO.rAMe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2593, 'RAMLI', 'KR15013', 'KR15013@mail.com', NULL, '$2y$10$YNVRrYoPH/9U6nwLJjKgr.woSxjM5DLdIL5WYy4UXgWrkXlwlySyq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:44', '2025-05-07 21:36:44'),
(2594, 'RANDA WARDANA', 'KR15014', 'KR15014@mail.com', NULL, '$2y$10$a36dRXvPZ4qNgI2a5jA3TuZ3p9Chz5GisPshUXrcud8kYbHNaYs2u', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2595, 'JAMIATUL RAHMAN', 'KR15022', 'KR15022@mail.com', NULL, '$2y$10$jgrxSrykBMnjkGA2umAjNOlu5aX6Wtr5zB4CV4RnsJTeMurhFxX5m', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2596, 'NIKO THOMAS', 'KR15023', 'KR15023@mail.com', NULL, '$2y$10$f1QJ7A84/n7ntWNERbyilO27M7YTzYs05M5HUo3HrMUTO5t9FQg8C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2597, 'SARDI', 'KR15024', 'KR15024@mail.com', NULL, '$2y$10$JOnEhN0NzgnLmj85EcgcfuNrmlsH7PV8tib9U01OMu35Kx2FRlGru', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2598, 'ILHAM MAULANA', 'KR15027', 'KR15027@mail.com', NULL, '$2y$10$eh/56ePOvB7nKaDE4LpWBuSv3UpQs.Q2vTu3UonIjzJMMsMUCNJmG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2599, 'JATMIKO NOPIANDI', 'KR15028', 'KR15028@mail.com', NULL, '$2y$10$K9igVg9y1VSyaMS0oP3gEeAzRbWQfvJKPAC0BDOiCxHRBr3dvGOou', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2600, 'KARLIANOR', 'KR15030', 'KR15030@mail.com', NULL, '$2y$10$LIBympNtuIitY2EmIomWpeBEIEaW6ognK3C65bGjOzHWrVZeLiWAK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2601, 'YULIANDI', 'KR15032', 'KR15032@mail.com', NULL, '$2y$10$Oe0JBrEeU0EBwXbyCUORFuD2BxKjsnpX/y3SofPCcekxytQjAV.U.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2602, 'BARTOLOMIUS WAHYU BAGUS', 'KR15033', 'KR15033@mail.com', NULL, '$2y$10$Io31xuAJNrvcOVS1zMG2KOKrhUU6S4v4QsTcIKvZqQRjJKQPVqwNm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2603, 'ERICK SETIAWAN', 'KR15036', 'KR15036@mail.com', NULL, '$2y$10$LRknWGTov7TLwI1SDBQxIeJO2wfvCM/x9xQEbk87x3fNf1SJ7wbAW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2604, 'AKHMAD KHAIRUDIN', 'KR15038', 'KR15038@mail.com', NULL, '$2y$10$yoSB2KkT6Of3h7O5JtiZgO5mx4TOdrwH7ymxZNkR46T5gMPpenN0S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2605, 'JAMAL', 'KR15041', 'KR15041@mail.com', NULL, '$2y$10$XQzIXR8.yWfTz20OkV8Pqu.IQ6sUdwH4i8Obdzyp0/KX4kY4vifdq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2606, 'RAHIMAN', 'KR15042', 'KR15042@mail.com', NULL, '$2y$10$VLYfjmUax4po7/wo8Q.uj.KVGFIsMh3DX3n.UJod/RqYjfUfecP9q', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2607, 'ROLAND', 'KR16005', 'KR16005@mail.com', NULL, '$2y$10$.zBOMdYaQGTQ1M0YqeQsWuRW3aHsazUIo5s.wrXZ1m8xRsTDBfIpG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2608, 'RUJIADI', 'KR16006', 'KR16006@mail.com', NULL, '$2y$10$GdQUAYHaAhrSKPFzG0Vq2eI6ix4Fp.XHjq61tPUmZZST6VYYrlav6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2609, 'ANDI', 'KR16007', 'KR16007@mail.com', NULL, '$2y$10$A9H3qeVj2T6kHRXIwdtaWOqz76aqD8afxQ.sCG2JvwORCNsLK1Q1O', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2610, 'JOKO JOMINARNO', 'KR17002', 'KR17002@mail.com', NULL, '$2y$10$02EbdB3HMm6TL4Hfj0U81.whon0sDYwgdBQKe3493tcHQGVHJLIcW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2611, 'MIKY', 'KR17003', 'KR17003@mail.com', NULL, '$2y$10$Ej6l9Np/Ovkp3DPt.3YjiOzWNAqaT7ZKh/hD2Y66HSV8c9DeaxdES', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2612, 'ALI TOPAN', 'KR17004', 'KR17004@mail.com', NULL, '$2y$10$rAz4cEOoTOalHO.pwnX.uuJ43nlXI4MmcOTLlTtl4qlqDes6Ul0ou', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2613, 'PARDIANOR', 'KR17006', 'KR17006@mail.com', NULL, '$2y$10$bn9XyW/oL8UKrAzrUsaIweKDq7dkhNOkxntUOK9hbLl60tP3myzxC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2614, 'JUNAIDI', 'KR17007', 'KR17007@mail.com', NULL, '$2y$10$37AHPlQrzUU8mvkfp/KWlO6.iSDVeCuJ8VZOYwKKS2D61j7pIF1pK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2615, 'RIAN KRISTIAN', 'KR17008', 'KR17008@mail.com', NULL, '$2y$10$f/ss7zkr9UOW7ArDkgUN5OhRgEtlcAL3nElodsUdyQY2VJCEUUgQe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:45', '2025-05-07 21:36:45'),
(2616, 'FAZRI ANOOR', 'KR17009', 'KR17009@mail.com', NULL, '$2y$10$ZRF57NpvQ8QMaHMPL1phX.6fklVNVB8flzHIQn811Ap8eQ.UPYw7.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2617, 'IGO WARJU', 'KR17012', 'KR17012@mail.com', NULL, '$2y$10$v1hMP/bKAduBVFd8SUoOouNNM0B.Tj5IjIlwJyo5E5coT6GvEQx5e', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2618, 'ORIMANTO', 'KR17013', 'KR17013@mail.com', NULL, '$2y$10$zeOvXGXhJS13o8/XhFjgFe5kReEOhSEcoCjgxWYpUsd7/Knj1qps.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2619, 'M. RIZALDI', 'KR17014', 'KR17014@mail.com', NULL, '$2y$10$cPBJcdsmf/4YPoCDuBer.O/7ybH/zzpMJ47aEMXecWNpcFrM7bA.y', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2620, 'WIRO WIJOYO', 'KR17016', 'KR17016@mail.com', NULL, '$2y$10$Zb8G2Y9J0/UMqvMdhxusc.joIMcIBEIN8Si2VGSfoqZ7r.r7AG/zu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2621, 'ADE KURNIAWAN', 'KR17017', 'KR17017@mail.com', NULL, '$2y$10$Fam/2IkWQIZS8E9hnXblwe/ujw7ywZlORIKbTBulHVUZ//XAJQJrS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2622, 'AHMAD SUBKI', 'KR17018', 'KR17018@mail.com', NULL, '$2y$10$tTZmwjaELphH1bk5X11BSuoiqgDx2qzGStouV6OzUrfmArxNZMpbi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2623, 'PRAMUDIA SANTOSO', 'KR17020', 'KR17020@mail.com', NULL, '$2y$10$3XDs/Y6vn8AK57R/C4FiputlhjfIVFXCG58gS/2TBYEw5YZIRqyCa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2624, 'BENNY SASTRA', 'KR17022', 'KR17022@mail.com', NULL, '$2y$10$HdU5z21ryAg/UetGS6iwGulUZptul9jkn8Kcet5JWiumsu5/.nieC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2625, 'DAYAT', 'KR17023', 'KR17023@mail.com', NULL, '$2y$10$3H.DLu2TS0afcb9W578fx.OHgmAuIvC7WA65MngyLJDcgo7t.sFHC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2626, 'FAHRI GUNAWAN F', 'KR17024', 'KR17024@mail.com', NULL, '$2y$10$scirwvsL5I70.uZJS7lLi.W95DuLDxgfNwI9cuVXfD1WB.L7EXKC.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2627, 'NADIO F. P', 'KR17025', 'KR17025@mail.com', NULL, '$2y$10$QAUjNcxwBIkzOtDo/EDjmultEPz0vSSBTB5AOOJq1qigv6EaBqejS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2628, 'HUSIN', 'KR18001', 'KR18001@mail.com', NULL, '$2y$10$aoJMVRUMOc3HmeImU0zziOzGGvFlXabsSOKsCvfSAxmyuwIdCNG3K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2629, 'KHOIRUL AFANDI', 'KR18002', 'KR18002@mail.com', NULL, '$2y$10$oUmWj6Dnaec4GrN.BiRoz.alsZTVxkRMFEsrkHg19URApUVUo1onG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2630, 'FUJI ISTIANTO', 'KR18003', 'KR18003@mail.com', NULL, '$2y$10$bKsvO7jqmzRNb6oYtMzUaeg36ZiV8wRlIraOEDOilN0xlUpi2Tovm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2631, 'JHON EDIWARMAN HALOHO', 'KR18005', 'KR18005@mail.com', NULL, '$2y$10$fRNwTZvRWEyoByZd6dglaubqBYrJYXSN.ZraCu6w532MURZoCH9O6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2632, 'DESI AULIA', 'KR19001', 'KR19001@mail.com', NULL, '$2y$10$sBevTk12hJPXReYUeAdLb.rQCu/lAnLJ637qagJMGPKuRY3Ee.tKK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2633, 'MARADONA', 'KR21001', 'KR21001@mail.com', NULL, '$2y$10$QeY1Tbr8Rx..FmksqR4aB.OZA.I7EeMSeMr8rQTFN93WK7Ca3Na7.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2634, 'RACHMADIANTO', 'KR21002', 'KR21002@mail.com', NULL, '$2y$10$gzLaWdTCw/EjmzR5p55Sie90LAdODo9qHzxPYXTUL19MzPsdWBjle', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2635, 'ADITYA KRISTI', 'KR21003', 'KR21003@mail.com', NULL, '$2y$10$duWl..jhN78KnVhuJZofWucIaieCkI1U8DyhE/ozuhlYzvZWbcP5a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2636, 'NORDIANSYAH', 'KR21004', 'KR21004@mail.com', NULL, '$2y$10$leWahENHTzvjSF9MUgUEHee8BMFiTxXzBpVaIvpTqlmzL3J.PQk9W', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2637, 'FAJAR BAGUS SATRIA', 'KR21005', 'KR21005@mail.com', NULL, '$2y$10$2o7JU.lEaVtgC9fKgpqbEeJhrtU81KZl.Coj7gZjUv4pSp9d6bJqC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2638, 'INDO SAPUTRA', 'KR21006', 'KR21006@mail.com', NULL, '$2y$10$6/pClsr85y0FuOpAvpkNLuzp2PZcC5lbd8PhYrPOi6.1zAibCv1n.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:46', '2025-05-07 21:36:46'),
(2639, 'HARMILO', 'KR21007', 'KR21007@mail.com', NULL, '$2y$10$LMp4y2ekLDvTRWHWklfClOq.XtBLtOV6o77FVnO12RmG8sTYElVWi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2640, 'ALMININ', 'KR21008', 'KR21008@mail.com', NULL, '$2y$10$AsXyqQd5y8rp0RpK3rncgezjm63/hGQeLUC2rfWW9xYT0ZSo9oABW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2641, 'SAPRUDIN', 'KR21010', 'KR21010@mail.com', NULL, '$2y$10$R4y.Drxq10swH.G1lRW58uzUyc8IY0u.88gdVcMWU1AssAEnb6D2C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2642, 'PANGKY SUWITO', 'KR21011', 'KR21011@mail.com', NULL, '$2y$10$I4SuDJ7NAEjXCcI3HJcXNuDCQ3KSM2A.eH.k2Uaixu4MEWD486wr2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2643, 'SUPRIANSYAH', 'KR21012', 'KR21012@mail.com', NULL, '$2y$10$lGBaD02g22d8oqAYVE4WkuRYQ46rA22bvyTwdG7FjNPBghOluCbzu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2644, 'ALDIANTO', 'KR21013', 'KR21013@mail.com', NULL, '$2y$10$Og8iSSbVd/JNrM7xbdRf1Oja534.AYhYlnWoYi5.g9TX3XkoAjjTa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2645, 'JAKA ROMANSYAH', 'KR21016', 'KR21016@mail.com', NULL, '$2y$10$35g/8wFr8dRay/ARbvbNn.JI8Etc0J9SldY0X3nqZIg4dsYIIWaA2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2646, 'BENY ARIANTORO', 'KR21017', 'KR21017@mail.com', NULL, '$2y$10$oUv.VDnmkOLnji0QS4ty8.fv25FefYOxQRRKXiML9yJsCHT3r4ykS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2647, 'ERIK NOPIANTHO', 'KR21019', 'KR21019@mail.com', NULL, '$2y$10$HY1Ti.leD4KIyk47/wbpy..d1BuQ.tfORDfnBvynCGO5iu.FyV03S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2648, 'WAIS ALKARNI', 'KR21020', 'KR21020@mail.com', NULL, '$2y$10$foarfZX4vQQJDVV9ZLndh.zc06MLGTl7RE.mXyX20TOzIU7SZ8aP6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2649, 'HENDRI', 'KR21022', 'KR21022@mail.com', NULL, '$2y$10$5P.peA4TxsUcXGHlx.mJVubOEqXVksrLaShz2S6lA9Ucgei23xDPu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2650, 'IWAN SETIAWAN', 'KR21023', 'KR21023@mail.com', NULL, '$2y$10$58hETu.y20.JYceuOCPv2.Pvm1syxcDEChels5eXBSp1/yUNeUM4S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2651, 'NARKIO SUSANTO', 'KR21024', 'KR21024@mail.com', NULL, '$2y$10$ksJ/rRWsgj5ulrkYVBgiQui8aX.RO78Y3twTJJvTuDmhnVEN9iCC.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2652, 'UJANG MASTUR', 'KR21026', 'KR21026@mail.com', NULL, '$2y$10$MkhTcujDJT7TFU5t2R5DzOR5trlDtL902OgFL4A7zjf5jjNPTNgU6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2653, 'DOLI DEPIKA', 'KR21030', 'KR21030@mail.com', NULL, '$2y$10$xoo8NbgwmVXWw97Frv4KIe1yFrbWzXsEl09E1T7sdxr99CLCP9YLG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2654, 'MUHAMMAD WAIT AL QANIRA', 'KR22003', 'KR22003@mail.com', NULL, '$2y$10$pCp/bsc1AMeYddhisatudu8z//b4huJE1LvVeSPEoOsCcwX9IOJoi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2655, 'MOHAMAD ABDUL RAHMAN', 'KR22004', 'KR22004@mail.com', NULL, '$2y$10$AsmQd2apf3J/8tIxUIFcguAaoK3HcZIv9cPDG73ZjR3M9zBSJ6eqG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2656, 'KRISNA ARIADI', 'KR22007', 'KR22007@mail.com', NULL, '$2y$10$Siw8gYtmvPtkLjq5.4/U6uqpezx/hd7Dm05x/zp.PFtQgVPk8.yDK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2657, 'RAHMAT TAUPIK', 'KR22008', 'KR22008@mail.com', NULL, '$2y$10$O09vBTRXSvQjGY5zaOGwK.tWImydpUKvHws6mEVCXcVonqXYJruO2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2658, 'JAMALUDIN', 'KR23001', 'KR23001@mail.com', NULL, '$2y$10$XnmgANXH7Mb/FzG9T0jbr.HFfAuSgrSnDdiFZ8QLauZTCIDh0aLWO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2659, 'FERI KURNIAWAN', 'KT13021', 'KT13021@mail.com', NULL, '$2y$10$p3LKWlODjI5tdHgXFLyrruEzVHk6BRFftCtWjhG7sjrsVjsBBZym.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2660, 'YUNI WIDONARKO', 'KT13045', 'KT13045@mail.com', NULL, '$2y$10$WpY9NyGwzBeBmp/nQy9mfOD4nT4JZq4wdZoJYiWX7pQDfQwoj0bUe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:47', '2025-05-07 21:36:47'),
(2661, 'MUKODAM', 'KT13062', 'KT13062@mail.com', NULL, '$2y$10$DD2qnpJW34TI87xROzlpH.Xx8fMOmDAEyPVGin2Kw1HGpIjaECtr6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2662, 'TAMAS B KARYADI', 'KT13067', 'KT13067@mail.com', NULL, '$2y$10$9i4wx5qMnRgGj2/Be3q/LOob4AmQZlzn/rattnR8a4du9bPYbYJE6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48');
INSERT INTO `users` (`id`, `name`, `nrp`, `email`, `email_verified_at`, `password`, `no_hp`, `role`, `department`, `position`, `district`, `status`, `signature`, `remember_token`, `created_at`, `updated_at`) VALUES
(2663, 'MOCHAMMAD MIRZAQ', 'KT13070', 'KT13070@mail.com', NULL, '$2y$10$g02HZJ6Wb8GB3tMHWG6XPempFSLns5TzfJ4Q6ribczPU2eGmf8syq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2664, 'SINGGIH HIDAYAT', 'KT13082', 'KT13082@mail.com', NULL, '$2y$10$pUvBd9Ym5MWRNmokYWESte5Ayiu/U3pHbASg/jQNUfDBx.8x6pjTu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2665, 'ARIF RAHMAN HAKIM', 'KT13083', 'KT13083@mail.com', NULL, '$2y$10$ea.uTTHyU9m14z4gdtY6L.60ZPm/emj6/v1f2kHhuwtn93qm6rE8K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2666, 'ARIF SAEFUDIN', 'KT13084', 'KT13084@mail.com', NULL, '$2y$10$BVKKGo0nHOC4Ltyx4/evtud2M/RY7BGhGvelm54/a7sk8VYrGkJsu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2667, 'MASUDI', 'KT13096', 'KT13096@mail.com', NULL, '$2y$10$ZGerYssrcZ8yHT2OSl/jHO7i5fmehkiS3eEfPQAEwozsAHvy3amSe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2668, 'HARIYADI EKO WIYONO', 'KT13102', 'KT13102@mail.com', NULL, '$2y$10$3KCVm6n8k22in0Ghf9COsOxKmDWFQaKpaJ8idS575wXof6sPZwg5i', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2669, 'LATIF SUBEKTI', 'KT13106', 'KT13106@mail.com', NULL, '$2y$10$4m2JeMAT3MrlCZs0mb31v.dtxney4Cgo6cfsq3JPJqi4UGWgYDvvu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2670, 'MUSLIH MUBAROQ', 'KT13108', 'KT13108@mail.com', NULL, '$2y$10$CUDO1r6MYaEx8v1zpBOzguOpARp6ApZQqzztR4hUemqTzWT4/bESC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2671, 'NURUL HUDA', 'KT13118', 'KT13118@mail.com', NULL, '$2y$10$JZ9sJqGJF.JrPM0W3GcCruNMAXOwWWi3lXxvlsxA.a.al9tTK.jGi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2672, 'MOH IHWANUDIN', 'KT13121', 'KT13121@mail.com', NULL, '$2y$10$PlcAZpPaNjNPhMec8/OOp.r.URGGp4zehnRfgq7qyrr5RXkawG2ci', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2673, 'RUDI NASIANTO', 'KT13134', 'KT13134@mail.com', NULL, '$2y$10$.R0KR4eqdOnuAb9Zbx2eEurjmaBmNZ.AbICLPpf1F6G7wvc.12IKO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2674, 'INDRAYANA KUSUMA', 'KT13135', 'KT13135@mail.com', NULL, '$2y$10$zguawoEIp1MYD9H2zsMpS.aKijlQwT9tpOL2KHRNqPOO5FPprXrMi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2675, 'MASHUDI', 'KT13137', 'KT13137@mail.com', NULL, '$2y$10$WoGrwmF/t9yTrrytoWwfUeyP..ZdteDjvjRAsnh2b0efiG9NECSuO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2676, 'ARIF WICAKSONO', 'KT13141', 'KT13141@mail.com', NULL, '$2y$10$0KjX9N6VMd1wIB2TQ2bope/nFmuKxHCWOBhB/nF2OxzyW/IcpbXlS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2677, 'HERI SUSANTO', 'KT13148', 'KT13148@mail.com', NULL, '$2y$10$f6TP3/xZth4dXvmEukNrR.iGV6LJI7Wp0o2ajZZPUYDU6VZFQNMX2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2678, 'AKFIAN DIMAS ARYUDA', 'KT14006', 'KT14006@mail.com', NULL, '$2y$10$8QTVV7rGDcM49gXqvo2BteGaKO/ffUYtBkQf8CE/qZGrDhdj5WXtO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2679, 'MOHAMMAD AKBAR RUDIN', 'KT14007', 'KT14007@mail.com', NULL, '$2y$10$G88dRYebywIsUqE5Xzd/t.O0oINZDpAJEjGkKElc9QKpUbsZE2EcG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2680, 'DONI PRASETYO', 'KT14021', 'KT14021@mail.com', NULL, '$2y$10$gYSSz0EcyYn0w5UFHVvYoe340qARuGMYPuQ1xrFDnWqL6IbL9rH1S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2681, 'EDWIN USMANANTO', 'KT15001', 'KT15001@mail.com', NULL, '$2y$10$43gAr7unbpoZs95Qyh5s8e48BgaNVL1vf4TVFxdL9ebgzJrLtZsNK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2682, 'DUWI FEKY ISTANTO', 'KT16005', 'KT16005@mail.com', NULL, '$2y$10$umEBgXoGelceJzNT3/oqeuobbHhjr5WAWRQPRA2R8PSYj9ea.R5/y', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2683, 'RANDHITA DWI MARDHYANTORO', 'KT16007', 'KT16007@mail.com', NULL, '$2y$10$Lsq5.7M7Zxcg/XeiFqydQOBLjs8PLYPQwh/8m3Z1zXhcoHw2oLwLy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:48', '2025-05-07 21:36:48'),
(2684, 'ARIF SETIYAWAN', 'KT16018', 'KT16018@mail.com', NULL, '$2y$10$FmoawlFiZuzwiRuhNwnF5.dz8EwUzx5X8n7E3x6CBDBo.gykwUMUS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2685, 'MULYATUL HASAN', 'KT16023', 'KT16023@mail.com', NULL, '$2y$10$gLc3Awn9r2YoebT4zwgTOOso64nDXqRJ0LNCtck9XFYpynrigDQoi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2686, 'JOKO SAPTONO', 'KT16026', 'KT16026@mail.com', NULL, '$2y$10$DzcgKl0UxOEs8.apmgjPTOSyDHH9j2p5KZM0hJCbHZr2e6COI8A0e', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2687, 'SAEFUL QIROM', 'KT16028', 'KT16028@mail.com', NULL, '$2y$10$fcm1HVdNZ5U4rM/atesC1.sjj7uueSsohahOCA3ZPQuYMRuP0bxP2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2688, 'ARIZA ESTU PRASTIARIZKI', 'KT16035', 'KT16035@mail.com', NULL, '$2y$10$b4mvOqsia9S4yyxn7dtkL.W6B4W.XliuPPD9bPf0yrrkJj/22p7FS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2689, 'AGUS SUWITO', 'KT16036', 'KT16036@mail.com', NULL, '$2y$10$SJqz.hlMZqWqPYAXPnqmZO/m525i4FCokmD..dZWKsJVZyi.VDkF2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2690, 'IKHSANUDIN APRIYANTO', 'KT16042', 'KT16042@mail.com', NULL, '$2y$10$GkWODsd2dbWP5v6dW9X90em8CSNfNrYymGC1IPPMz3dC63fY2J.4a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2691, 'TEGUH TRIYONO', 'KT16043', 'KT16043@mail.com', NULL, '$2y$10$9TH0s9f2QwSjcZZRE9YB4u4IKJCW1/0b.zsDos3Dm8UOOY.JKxG0a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2692, 'MOH. DAVID FARID ZAUHARI', 'KT16046', 'KT16046@mail.com', NULL, '$2y$10$OGRY9BzwpsNKTDPd5VfsU.1gHqFlXw7iCpeYqDSaC.uElvf5hljEG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2693, 'SUSILO ANDI', 'KT16048', 'KT16048@mail.com', NULL, '$2y$10$H3bT6O80as125C81HHqo3et2hMzDfxBkWxSdXpCcqea4rUXXX67qK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2694, 'EDY SUTRIYO', 'KT16050', 'KT16050@mail.com', NULL, '$2y$10$/08ivdDq9nLh5wa7xghJIuBtjrTk.NLMGQp/8cZ62tZAyy1OLzNEq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2695, 'NUR HAMID', 'KT16051', 'KT16051@mail.com', NULL, '$2y$10$qwe.BEmuonaIDys16L362utFciu/IboOw6Tn/s2qTd5hTulxeTD8m', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2696, 'ASEP RIZKI', 'KT17001', 'KT17001@mail.com', NULL, '$2y$10$gqZFqt57V9McRRN8uS0LWefRqGcBSLLx.a9rIaqHqT79x9jeiv5Bm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2697, 'HERU SETIAWAN', 'KT17002', 'KT17002@mail.com', NULL, '$2y$10$TpYfcTmQiRvlFctBwLbkFuzUCKJ99PzAmcdQo5aWAfzhB/qc/WR.W', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2698, 'DWI AGUNG MAULANA', 'KT17005', 'KT17005@mail.com', NULL, '$2y$10$tT.NUcuAV7rfw/I/lGrwmeDNUo.95IgJRfwyHjDjQd2tlGXr.Ts56', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2699, 'DWI FATTUDIN', 'KT17011', 'KT17011@mail.com', NULL, '$2y$10$BxfWrguQyF2c7eeDnTdKZOJVcPh/D3sqghQojNkpwUp5fefRzFa76', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2700, 'M. WAHYUDI', 'KT17017', 'KT17017@mail.com', NULL, '$2y$10$gQPU7R7LaHM1QE2ZMRrooOQRtCG0PwLpWSk4MrPwqBOK.SBW2/Ney', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2701, 'YOHANES ENDARTO', 'KT17024', 'KT17024@mail.com', NULL, '$2y$10$Pv3.UY/pwN1zGJi1W9tnqOcVEPMEmx29fz8uR6uWYWh64L6hGkV/2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2702, 'BENY RAMADHAN', 'KT17060', 'KT17060@mail.com', NULL, '$2y$10$6xJqCYH0MhnMNTfxgmlx0edGwtGKbjfRjeiyllgal.vIvWC7jfhJ2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2703, 'WAHYU ARDIANTO', 'KT17061', 'KT17061@mail.com', NULL, '$2y$10$GwoAW1ck8GoQlQDVAUrXvu33ShJGFPXfv4edvOk2qHwCHGasY30pK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2704, 'MUH NUR AZIZ HAFITA', 'KT17066', 'KT17066@mail.com', NULL, '$2y$10$7FevviHFiE2wyCujh11IFO/Jm8x9HYe.3o12BiTarohoQSxao2IK6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2705, 'YOGA PRATAMA PUTRA', 'KT17067', 'KT17067@mail.com', NULL, '$2y$10$.dEyMWK0UEWFI9GRVuS.6Oqqp3be2Y5RsEje8za4wclUokDNgfZGW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:49', '2025-05-07 21:36:49'),
(2706, 'MOHAN PAWUGENG', 'KT17068', 'KT17068@mail.com', NULL, '$2y$10$RbMFSzG/1Tn7yCPcXOUd3e75AY1sfzEztaO.3fxh.H3KPNDc2m6Lm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2707, 'BUDI PRASETYO', 'KT17071', 'KT17071@mail.com', NULL, '$2y$10$m9fcFZx1buupeDW/8USG2e7Ui/3kBloLUymE.IR.jgEx31.I3Laj6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2708, 'JOKO SUPRIYANTO', 'KT17074', 'KT17074@mail.com', NULL, '$2y$10$OAHX6LghoYG.fN14LnVWUuE3Mr3NAfa4ICwGU99ms4IuZKnBq6wky', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2709, 'DUDUNG STYONO', 'KT17075', 'KT17075@mail.com', NULL, '$2y$10$PKXUnJPUlJBbZQprYw89NuIw83s.8vSDU1N2OpVRtiqLGYNo89NrW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2710, 'MUHAMMAD KHOIRUL RIZQI', 'KT17081', 'KT17081@mail.com', NULL, '$2y$10$U0pyOP9vXsMTPfYusuXbDu3.MU28c7d7FSKD2J5qNQcszpaztG1yC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2711, 'YULIANTO', 'KT17084', 'KT17084@mail.com', NULL, '$2y$10$aiQpy4Wxc4FjgARC45tHMuLXMy61EbtVVrJYlnk1KB/VHdE3q2/VG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2712, 'DEDI IRAWAN', 'KT17104', 'KT17104@mail.com', NULL, '$2y$10$tZtv0irzq3M8EFvyn83Hk./FX3R.Z0s3uJJZ4/brjiB6fx5Hy8cKW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2713, 'NURFAIZIN', 'KT17105', 'KT17105@mail.com', NULL, '$2y$10$2/kWe/6tCOFYh6qJfU6MjeYixStqkPMBbPtStJF6oJyx.dekKc/Xq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2714, 'RAYUDI', 'KT17106', 'KT17106@mail.com', NULL, '$2y$10$p/v841T.wxvMqDUvIoWAoOKv23eVhB6O/fTPoi0XNCQjuVl/phK.W', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2715, 'DANANG CANDRIYO', 'KT17109', 'KT17109@mail.com', NULL, '$2y$10$DpONoNSjtqXPgz8f/wgSfOqi9z1u0dmI1pu4.xN/XFPmr1FlWuKku', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2716, 'ARIF HARYADI FEBRIANSYAH', 'KT17111', 'KT17111@mail.com', NULL, '$2y$10$XgWp3CRufjUfrYfBLKnDzuPRA4CXqbOOiRDuTA3TxfIt2Rbwnfnm6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2717, 'SAYFUL PRASETYO', 'KT17112', 'KT17112@mail.com', NULL, '$2y$10$VdmyQSbp827LoFCdoRgGu.uf.20wa6pWzaPmIT1g/Yf48f7pMYMay', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2718, 'ADIAR FATURUSI', 'KT17114', 'KT17114@mail.com', NULL, '$2y$10$LKvO8QCSYjtFw5b1NGswl.umRhTZNPdCjr97.oEzWkgFoTErZAAPW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2719, 'AGUS HIMAWAN', 'KT17116', 'KT17116@mail.com', NULL, '$2y$10$25jxNtp69mg9Ng.ugoBZHuJeA0B28e.xzaE61Jmld5Kfwb/wMfHAu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2720, 'MUHAMMAD RAGIL SAPUTRA', 'KT17118', 'KT17118@mail.com', NULL, '$2y$10$65nTM6Tyd2Hct/Iu3z0ltOlUcGaOzATyIg/LdcPsXqM1kzS9DiFia', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2721, 'MOHAMAD SAEFUL HIDAYAT', 'KT17119', 'KT17119@mail.com', NULL, '$2y$10$43yZfVlcY5msDQ1AAXr0pe1mI3MPM80s8MCBwm93YE0LwyL3.tEeW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2722, 'BOGII CAHYANTO', 'KT17121', 'KT17121@mail.com', NULL, '$2y$10$M6yCcEhFtqqr6L13dzJLZuagDVCKvOwCoYWzY1hquPGbfC084ieLK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2723, 'INDRAT TRI SETIAWAN', 'KT17122', 'KT17122@mail.com', NULL, '$2y$10$FOi2.CVmc/7meVhA82Df6uMWLSW4.TQ4leplrFn2cvHki81h715qO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2724, 'MUHAMMAD MAKSUM ALIF NURRIFAI', 'KT17123', 'KT17123@mail.com', NULL, '$2y$10$/beHmZurWdcSPmXne1eFMegiyNhss5WKjKf/rSl6/UD.crJcZQ9Cm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2725, 'AZIZ NURUSSOBAH', 'KT17127', 'KT17127@mail.com', NULL, '$2y$10$Gv1besmMT3.co9MY5PpRNe2NxkJZn32UjXKjYeSEXwCt3immalh5a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2726, 'YULIANTO', 'KT17129', 'KT17129@mail.com', NULL, '$2y$10$8hmJLeRKD/vgvQgKqqWUneHtNwioIQ2o0dUYJiy25AY2FF3C5ackm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2727, 'YULI HENDARTO', 'KT17130', 'KT17130@mail.com', NULL, '$2y$10$GW48iLh3mgTQZct6NFdlt.dH3uAV27cvAAhR1Q51B4zcnhS0Uplk.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:50', '2025-05-07 21:36:50'),
(2728, 'SUWONO', 'KT17131', 'KT17131@mail.com', NULL, '$2y$10$UphyNO.bNcO5CBJfB0lZ4.8MoyBRItz/sKqY.R63oGh2.UvCPRzq2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2729, 'SAMSUL IQRO', 'KT17135', 'KT17135@mail.com', NULL, '$2y$10$br0ruf8QUp7zUdWGbFzx6eVBBGEyhFH6xrXpGI6QNJxIvreY9D3f2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2730, 'DONY KURNIAWAN', 'KT17137', 'KT17137@mail.com', NULL, '$2y$10$o3l9ZATHjLEO24cuKlOa4OSt4ymWtq1jLIBoGRiBOzrnU9q6LZrOG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2731, 'MA\'RUF ANAS SODIKIN', 'KT17139', 'KT17139@mail.com', NULL, '$2y$10$NHzIz/ci.0AA9oKioifqG.n1NZ09cyZa5X4enZFMtFUGIxW6nllt2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2732, 'MUHAMAD RAFLI AL AWWAB', 'KT17143', 'KT17143@mail.com', NULL, '$2y$10$qPBNz2FX21PlLnqCf8nakuCc6d4oq8n/7owFP33870MZSeowwtVGy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2733, 'FAIK FAUZI', 'KT17144', 'KT17144@mail.com', NULL, '$2y$10$0XzOqsb0xP5AC2Yqh6gXren1PLCr60F5P8O677b9nHsCzXfG.uc5S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2734, 'GILANG ADI SUSANTO', 'KT17146', 'KT17146@mail.com', NULL, '$2y$10$vq8l3J7m2Xy/kaZ3atUayOY/95J4y5IZdT/52aNedG/gkQ37wUZES', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2735, 'MIFTAKHUL ANWAR', 'KT17147', 'KT17147@mail.com', NULL, '$2y$10$JmKx6lAoaxpRxLzF80.IHOc9S1CeEqckhDsBKvLhRRVSCrWIX17ba', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2736, 'IRFAN KHOIRI', 'KT17150', 'KT17150@mail.com', NULL, '$2y$10$ZjAP9vuWQ1mMqziRx51sTuJDS5bCz9XAabLfYFccN.3OQ1LE1urzm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2737, 'MUHAMMAD NURSAFAWI', 'KT17154', 'KT17154@mail.com', NULL, '$2y$10$Mpr7Vy.ZJH4A8Ct0QpRwmewo9TIeEic0G4blYFsgOc.EqaX4lZg/.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2738, 'MARTA ANDINAWAN', 'KT17155', 'KT17155@mail.com', NULL, '$2y$10$Kr8QC0TgpjaVC98QenSuseAlN3yEJigObSTlxETT.0s3c5PT3mrPe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2739, 'IKBAR SEPTIAWAN', 'KT17156', 'KT17156@mail.com', NULL, '$2y$10$jwaTZK.ERq.5H9ghlAC4B.z6BD4oeTzHC9eg8X2eJdcoXrtVQMfRq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2740, 'ECHSAN USWANTO', 'KT17157', 'KT17157@mail.com', NULL, '$2y$10$zqoUPPmn8htiOhpY8Hxw1.jN/swKEBf/tUzUFsaoEQXST4GO6CmW.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2741, 'ANDRI KURNIAWAN', 'KT17158', 'KT17158@mail.com', NULL, '$2y$10$4T/wL0fYdcmayLtZhtUkWuiaZQSYQFWA43VsUbCMQNkEyBrrWGIaS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2742, 'IWAN HARYANTO', 'KT17159', 'KT17159@mail.com', NULL, '$2y$10$7qRV/92qgsOK/ZfZgMO8dO0Wx9rVjC7e6rrztAMuBSDX.opSpLRpi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2743, 'MARZUKI', 'KT17160', 'KT17160@mail.com', NULL, '$2y$10$IpnEcwyCJcdiKZYh8svClenytIKR99VFun98i2QQ7m.sWI9rybgVm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2744, 'NIRMALA FIRMANSYAH', 'KT17161', 'KT17161@mail.com', NULL, '$2y$10$pw/7.F4swP.TJJJ4RnssgebQ6pdrjZfeTZfMOK42NuQbce5cIV9di', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2745, 'PANGGIH ENDOTYA ARINGGALAKSANO', 'KT17162', 'KT17162@mail.com', NULL, '$2y$10$zjW8ltX3ZIb7p9Nj7rLHGuq.C4Wf3af7fVduBow7WsiXHrMTh0ImG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2746, 'ABD ROHMAN YAHYA', 'KT17163', 'KT17163@mail.com', NULL, '$2y$10$05aIInaYTlHjo.gdpk2ZEO8exqDGpVkYyYwR5iREOpTSi81F9RYrC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2747, 'ANDI RISTIAWAN', 'KT17164', 'KT17164@mail.com', NULL, '$2y$10$Pv2HrDkCT2j4Zag9jXVVt.A.TNJqcPVvv5dW6CjcyWOELt6rb5QJm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2748, 'RIDO RIYANTO', 'KT17166', 'KT17166@mail.com', NULL, '$2y$10$5u9gIVcs09mw5Jpns52Hlu5P0/ZB6V/uQ/RVk9fwgRxaFx1ALMOeK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2749, 'JOKO PRASETIYO', 'KT17168', 'KT17168@mail.com', NULL, '$2y$10$YPjRV2c2Paf8z8FgmmPyW.PMpixD.eDayMvdk0k/8gPgRgyPAuAwq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2750, 'WAHYU UTOMO', 'KT18002', 'KT18002@mail.com', NULL, '$2y$10$TLKDYmJ.blmmHTtfgC5d2uitIR24n2LQNZf48gv2wdYmyBkJhFRiK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:51', '2025-05-07 21:36:51'),
(2751, 'FEBRI YOGI ARDANA', 'KT18005', 'KT18005@mail.com', NULL, '$2y$10$YQ/RB4EtF3wLBldfgeACROh/0n4on/X6b750WqgupMfr3KEVjLNha', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2752, 'DEDI SETYAWAN', 'KT18006', 'KT18006@mail.com', NULL, '$2y$10$kmztGZgWGhlPU0QEnZ/Stefqds2HNqcrdmrffDi7xVUwW3c2f9PFO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2753, 'WAHID NUR MUSTAQIM', 'KT18007', 'KT18007@mail.com', NULL, '$2y$10$yXPCakl3J/gP3QN0v7vHBepNB/QS915pTIoplBhfoZBL2aChIg9Fi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2754, 'BAYU ARIYANTO', 'KT18008', 'KT18008@mail.com', NULL, '$2y$10$jOjE/RZCIa0LWunXoFiUtOPLxSXGRqZmRYpBiLzNt6795hH3eudXK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2755, 'GANETA HAMDANU ALFIRIANTO', 'KT18009', 'KT18009@mail.com', NULL, '$2y$10$C1JHhKMEVUdbVTKzk.LR6uUTKvTVIkyClpLWhpgthCgoJ729BZgTG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2756, 'NURUL FAJRI', 'KT18010', 'KT18010@mail.com', NULL, '$2y$10$Q75SyqwAKAuuU.ObeBV2BeR8k.Fozbw6v8jROfMhgaLS2Yo0PTpu2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2757, 'ALLEX WAHYU SADHODHO', 'KT18012', 'KT18012@mail.com', NULL, '$2y$10$pyTq5sbgiyyzBkWkF9yslu5C3TklQrtwwavfSptMM0KmD4GnB2YCi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2758, 'DAMAR HIDAYAT', 'KT18013', 'KT18013@mail.com', NULL, '$2y$10$yX8lx4LSgccR9eJbttE3LOVSCHBWtaZXHV93D0jXZyguSBtDBSrBq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2759, 'MUHAMMAD SANI PRASETYO', 'KT18015', 'KT18015@mail.com', NULL, '$2y$10$EcE2dSwCCCyWTrJxm3bU1upefefwELWaDipNnW0r5tCDuKxpE8M3O', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2760, 'YOGI MULYANTO', 'KT18017', 'KT18017@mail.com', NULL, '$2y$10$HlP6UhyF4Kwh0TnILzN37OHH1j.qLSXC1Ud3.cFYTt9zCk6vWLe0K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2761, 'DANI IRAWAN', 'KT18019', 'KT18019@mail.com', NULL, '$2y$10$yPaKpDwLa7YO05rQDhZAZO0PGOENPEEHzjsXjtC.15.g9FPKjUd6K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2762, 'MUHAMMAD ABDUL AFIF', 'KT18020', 'KT18020@mail.com', NULL, '$2y$10$t6VaNCSa5jaYVAhIQ1C/Ees3UrkESf0/MPuhlImuPYD/JWnOHhBE2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2763, 'BAGAS FAHMI KHOIRUDI', 'KT18022', 'KT18022@mail.com', NULL, '$2y$10$zIpa2RBI3RqOFaQBMiVL4.pFwhBe2XHuuouS/JvYZz8Rm1hscgfDu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2764, 'IRFAN NURUDIN', 'KT18023', 'KT18023@mail.com', NULL, '$2y$10$wGaxP3i6zMpFB0GAIfIVFeH.htlWigKo0YoFN4.h13Pr9rqtx1L5u', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2765, 'FERI MIFTAHUDIN', 'KT18025', 'KT18025@mail.com', NULL, '$2y$10$UenSJ5VqF8AoJwwMA47DuecefxsvVcoQEgY/fVDliJ9yOhcxIba8a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2766, 'DEDI ISWANTO', 'KT18027', 'KT18027@mail.com', NULL, '$2y$10$FuBN8CCA2l2kS3k9PFdG4.AT0CvrGQgjBTtoQjRHBXnPqZ7jxLsNG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2767, 'MOH. TOFIK NAWAWI', 'KT18030', 'KT18030@mail.com', NULL, '$2y$10$W/UilDdCa98btrSVffyuVOXWZ6Aed6WHL/iialAKI00htSOpQhP8q', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2768, 'DIRYANTO', 'KT18032', 'KT18032@mail.com', NULL, '$2y$10$lvtb82DFV35.J7kKHhOoDO8Pz4XLxJjKVaLkeLVqzJzWB8D.OWge2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2769, 'FERYANDO SAPUTRO', 'KT18034', 'KT18034@mail.com', NULL, '$2y$10$ml13Sbn.CEtRS/sgmvLuaux1WhtgK8g.frL4NZeMw4HfRjmN532Rq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2770, 'RIZKI WISNU NUGROHO', 'KT18035', 'KT18035@mail.com', NULL, '$2y$10$j7qGbr6bPZFghVTggwrnaerEM4.7zWCFNXYCT72tKYBSOwjC2aCNW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2771, 'RENO NOPIYANSAH', 'KT18036', 'KT18036@mail.com', NULL, '$2y$10$24ZOB7z6..etdgcrsavrAu7X03N.1ZL0EUT95G6DWmW7Q.Wqul4u6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2772, 'PUJI RIYANTO', 'KT18037', 'KT18037@mail.com', NULL, '$2y$10$EP54v/Dzj29X/PpPEGCbBuwRPBe1JuzGdJWEYEEaZPqG9Hjd4CnOW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:52', '2025-05-07 21:36:52'),
(2773, 'MUHAMMAD AHZAN FAUZI', 'KT18039', 'KT18039@mail.com', NULL, '$2y$10$e1tYXGHRoBIT1rE7ZYe68uMW6F3tunG2343JQR8GbTFcw7qzwlnJW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2774, 'JOKO PRIHATIN', 'KT18040', 'KT18040@mail.com', NULL, '$2y$10$rZKMVrUKmtoBfvEWMoe2heTJx6gNwUNuRalo0PKWcCb.MZGCilNKi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2775, 'DICKY FRIDAYANTO', 'KT18041', 'KT18041@mail.com', NULL, '$2y$10$Z2Fin4qlWak/HdnVwZ9CS.DfzeqyF8IMl5KDlWVkhRkqs8.d66.uS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2776, 'ARIS PRIDANA KUSUMA', 'KT18042', 'KT18042@mail.com', NULL, '$2y$10$XbVxIWRA5Ws.TvGs92OF0ur.GhT9zAaYyF2PC1VkH59/bh4AA3jgq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2777, 'RAHMAT ZULFIKAR', 'KT18043', 'KT18043@mail.com', NULL, '$2y$10$G681tBLQm.gpdCw9Bp7WfuNT6rgfLD9atPBEjJqKClXRXSiT4/F/2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2778, 'AHMAD PUJI RIYANTO', 'KT18044', 'KT18044@mail.com', NULL, '$2y$10$.lsBxhIRSFJXcpMlC3jw1e0l03wdqqOFHdWB2Iw2ThUYLscDH3Xk6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2779, 'BAYU PURNOMO', 'KT18046', 'KT18046@mail.com', NULL, '$2y$10$QQT7YqgUH6C6QhLs4MxJIOswEPRPh3.Tu9LPIea8BBUonGBETIGyu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2780, 'MARETDY KASRUCHIK', 'KT18049', 'KT18049@mail.com', NULL, '$2y$10$1ffDvM.bhrwZaEBBLitrNOWxCJ5ulIboPbsqovr2Of0w4qLc.Ezsu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2781, 'SURONO', 'KT18051', 'KT18051@mail.com', NULL, '$2y$10$2GA.S2t1a8JmnNBUjjnnteO/Efoi/.6a4JAVTUXcyXGYhoHB9whiS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2782, 'NUR SAJIDIN', 'KT18052', 'KT18052@mail.com', NULL, '$2y$10$haodSP460.T5PXNeoi.3VOjIGdZmwor0DMSUBIs6Vyt9390L4nqhq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2783, 'SYARIF HIDAYAT', 'KT18054', 'KT18054@mail.com', NULL, '$2y$10$kO5g7G/005CrG.cGu/3Cz.LdJL.hA9KV4htre7zCqHV1pcf6WQMKy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2784, 'WAWAN SETIAWAN', 'KT18055', 'KT18055@mail.com', NULL, '$2y$10$0sYfis0mMJCVjinFtocCnuSjmNNVTmlZdYHryv/fd5ZBOfugzENh2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2785, 'KUSNOTO', 'KT18056', 'KT18056@mail.com', NULL, '$2y$10$s8oQah2q1Y5Ij8wG7lrqVOZ6VWKfeCtMQxLKyqaO5e.m54QzjPfrO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2786, 'MUNAWAR SOLIH', 'KT18058', 'KT18058@mail.com', NULL, '$2y$10$5TlEV309lHYB0EFl5jqfcOIYj421tousM3RnEgD9IG67edXa8vV9q', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2787, 'IYON PRATIKNO', 'KT18059', 'KT18059@mail.com', NULL, '$2y$10$pVjodPUoWg.gU2G7ufyvA.gNX3sM4nx8o420jc7nVLy9LQfoGnLRi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2788, 'MARIO ARIYO WIDODO', 'KT18060', 'KT18060@mail.com', NULL, '$2y$10$hZOodjjRnLyW2DSzY.nAU.bbiRWCxfl1W/uTiKlrvhZGbq6aMWAEa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2789, 'ADETYA TRI UTAMA', 'KT18062', 'KT18062@mail.com', NULL, '$2y$10$LsKKo5pM/fLd2RbxmH4JkegXI58cspJ6ZIRu/gBlLYcTXCSE/3K1.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2790, 'DIMAS OKHY DEVA PRATAMA', 'KT18063', 'KT18063@mail.com', NULL, '$2y$10$RUul/H2ezTFGOhLo4/MgNegQI02huuRUJCZ2iUDn9NJZXafsz.QGq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2791, 'IKHSAN WAHYU TRI PURNOMO', 'KT18064', 'KT18064@mail.com', NULL, '$2y$10$tJ5JXWO59JQyXUK.mfMD/eMg5EiHN05fmXMmpmydJEERytFDLQTwq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2792, 'IRWAN SETYAWAN', 'KT18065', 'KT18065@mail.com', NULL, '$2y$10$E46gTUUzhR4rqaA97bTU6e63pkw9yQiltzWjyFSgEGx.n66W95jXG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2793, 'LEONARDO ALEXS NUR ALIM', 'KT18066', 'KT18066@mail.com', NULL, '$2y$10$w4Aw3BdC65UeXEdqssA3KOjd71IEn7ucVvXD/.EAKJIaVYO7S5wPG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2794, 'NANDA ADI PRADANA', 'KT18067', 'KT18067@mail.com', NULL, '$2y$10$uVPp2MU4rYPNUNFfG1bxueFUMXdJxD7F995yr3C0..4qEOevQ3MsS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:53', '2025-05-07 21:36:53'),
(2795, 'REINALDI FAHRI SETIYAWAN', 'KT18068', 'KT18068@mail.com', NULL, '$2y$10$JKNckdDaUk/VQaSuW4t/je.x2vD/qY0HRYWDfUEXo1aSGTGTLTLLu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2796, 'SETYO BUDI UTOMO', 'KT18069', 'KT18069@mail.com', NULL, '$2y$10$vPRhWjACg8oCrp59YtbgKeMV7wwovI75rFpkcuvuApw9YBJ0OisCu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2797, 'YUSUP PRAYOGO UTOMO', 'KT18070', 'KT18070@mail.com', NULL, '$2y$10$U1ZppfsBMGEjTBQ94Ub2x.wl/MCGXKR.gP/YJPSLtq7d9LVBEOkL2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2798, 'FAIZAL ANAS AL AZIS', 'KT18072', 'KT18072@mail.com', NULL, '$2y$10$bWfcIGNG1ae/SAjXy9Rfv.Td95IuwIfAhMemzMNRkZpStjJHQNG1e', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2799, 'AGUNG KUNCORO', 'KT18075', 'KT18075@mail.com', NULL, '$2y$10$r9SJGOoTvG4gjziYmgQ6N.TO0zcltjJtFXkS9LP5y5dKfGWSCOK6C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2800, 'ANDY PAMUNGKAS', 'KT18076', 'KT18076@mail.com', NULL, '$2y$10$0FXMM1OCbH/lX7BybrbbLeQ7ODCdX6oyKw0N8arBX5abYk29o1HEG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2801, 'MOH YUSUP', 'KT18079', 'KT18079@mail.com', NULL, '$2y$10$17oDgxZRmk5.im4pPFc8ruRo8j0gdn8rInaNn2/bLqWAHTJOyMzfS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2802, 'WELLDA ROY FERNANDO', 'KT18081', 'KT18081@mail.com', NULL, '$2y$10$ie0euQcAg6uo2FiQoiY.MOecMAuRZeVM5GhfsJvKYbMD8oSivlE9a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2803, 'MUHAMMAD SHOLEH', 'KT19002', 'KT19002@mail.com', NULL, '$2y$10$gfyquzN4aOfPorBc4M.WTeF.7kEIW83XV.l9S2bvees7EfrO09g8O', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2804, 'MUHAMMAD APRIL LEA PRATAMA', 'KT19004', 'KT19004@mail.com', NULL, '$2y$10$iqbSUBhUAtIDDvJf0Eo9p.Wvqh6C8YFWVSjeDC6M6.yBOjNj9Za2K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2805, 'RONAN FERDIAN', 'KT19005', 'KT19005@mail.com', NULL, '$2y$10$./O8oD1rbx9GsF.EnZVMZ.iLfFDQlvRH6BDOW1v6I6kbUvU/NBuMi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2806, 'HARIS SETIAWAN', 'KT21001', 'KT21001@mail.com', NULL, '$2y$10$KHXPZ8XywezBADXyh3e.beS1pUJZA2OQFSHH2naWP5v5J9essMmZ6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2807, 'TUTUS BANGUN ARDIANTO', 'KT21002', 'KT21002@mail.com', NULL, '$2y$10$2o5PH6WRHgqnnKudjsTUkugRncQ6Q7R0fhdfhj9zf2aL/22mY7Vae', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2808, 'ABD. ROHMAN DWI SANTOSO', 'KT21003', 'KT21003@mail.com', NULL, '$2y$10$5MEFr1rAAs0iHIxZiOWNN.owspIz3H7rr16lk3YepqBWqJSIEABN2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2809, 'BAGUS CATUR FEBRIANTO', 'KT21005', 'KT21005@mail.com', NULL, '$2y$10$Ki6nXMZF1a1jTRzNBXIQ2..gMmIzJx8wqSZNQov9xYczgdAqGE6Pu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2810, 'BAYU AGUSTIN GUNAWAN', 'KT21006', 'KT21006@mail.com', NULL, '$2y$10$4Rc2Im2aHym3aN.3cZLt/eznu6YIVSr8G.h/46LPsWgx3JUkYoDKe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2811, 'MOHMAD PANCA SANDI PUTRA', 'KT21007', 'KT21007@mail.com', NULL, '$2y$10$LE8WUlBKh7ShM3EHww0Syur7l544ciIi5SQEaxutOVXpqSOipWrEe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2812, 'RIFAI BAHARUDIN', 'KT21008', 'KT21008@mail.com', NULL, '$2y$10$5BnpYf4HVWXy.a4NcYxZHudu583F40Qrsfj37sg6MNfngyoBJsGBW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2813, 'RIZQI PRAYOGO', 'KT21009', 'KT21009@mail.com', NULL, '$2y$10$AjOR5mTKuP5Bb1rGzuh2IOdo3YxjJQIgrPFpY87rZHwCxrl2b7hsC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2814, 'SANDI ADI NUGROHO', 'KT21010', 'KT21010@mail.com', NULL, '$2y$10$yX8y/oZpdrBz6K15JjZ71OfvTg/nr5mK/FMp.djXTW6x.JsKgTWWu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2815, 'SURYA DIRGANTARA', 'KT21011', 'KT21011@mail.com', NULL, '$2y$10$rC6F8Tz5eIRk6xnBDJLfzOZoFfKkaGgu5OajcpTiado8H5vkzl07S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2816, 'MUHAMMAD WAHYUDI', 'KT21014', 'KT21014@mail.com', NULL, '$2y$10$aKUEpUBldkgVW0/k0NzzEe6/G/eMUA4b9Q.GjG4oyFrQRCHj9bzz6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:54', '2025-05-07 21:36:54'),
(2817, 'MUHAMMAD RIFKI ALWAN', 'KT21019', 'KT21019@mail.com', NULL, '$2y$10$jeMH18EdzNqft25VpbTxaezMhxd2Rhaxy9p5mXps.5Zun6yj9vl0u', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2818, 'NANANG ANDRIA', 'KT21021', 'KT21021@mail.com', NULL, '$2y$10$UYOW2sKCmST1mkdnF7KNvepcnhbIfoF2urZLAHkurE2fmQvGmIHTi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2819, 'PANJI SAPUTRA', 'KT21022', 'KT21022@mail.com', NULL, '$2y$10$9m6Tak804U87sW3z7Aaa4eq7uv7h43nsY/4LvkCAJJ.RoonZqfPom', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2820, 'ARIF ADI PRASETIO', 'KT21023', 'KT21023@mail.com', NULL, '$2y$10$crhK93ayHTzvVIjKfpMQrOZpZdDE6sSE8yZZTd1pdP.UBoj6E0d1a', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2821, 'TRI SUWARNO', 'KT21025', 'KT21025@mail.com', NULL, '$2y$10$4FhZKeuaeXq8tNTSuin6leTLaC5PDvsrulYpFOuauh1FaSUSgfNOG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2822, 'NUR KHOLIS SAPUTRA', 'KT21027', 'KT21027@mail.com', NULL, '$2y$10$QHJGTn/dRThcJc1OOmBLS.BhrFEN7YyDHOVKCx9W6IjNnm9sJfAQS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2823, 'KEFIN GUNTUR PRASTYA', 'KT21028', 'KT21028@mail.com', NULL, '$2y$10$Nk8H9zlTv4iRGVh6Swmf0en2I2kUu399XMA61T4.8lmETH4UGzWkG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2824, 'IMAM MUSTAQIM', 'KT21029', 'KT21029@mail.com', NULL, '$2y$10$xze.QsYYnXOWSW2SVIpE2ujOwAcvTIZ8xCtBJn1QmzRaeJPgp/TXy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2825, 'MOH.AGUS SAFRUDIN', 'KT21030', 'KT21030@mail.com', NULL, '$2y$10$4tCymA.yyyBmw13MluLBX.EoFkf4tMt75aJxwiGj57HpovWJSLFDO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2826, 'JOVAN ALI FATONI', 'KT21031', 'KT21031@mail.com', NULL, '$2y$10$f0rleiLwvu1sLqmntwPJ0uDmGV694ZT4M.PktDw1lNz7qQF4K1blq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2827, 'ALI SUPRIYANTO', 'KT21032', 'KT21032@mail.com', NULL, '$2y$10$MIi1d244odUyws0dQVOnnOkC/tOzI5SN5szO.mcX6OQJ4EJ759R8e', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2828, 'ANTON ANDRIA PRIO UTOMO', 'KT21034', 'KT21034@mail.com', NULL, '$2y$10$1CmXIUq2ma/xq.tCxrWhceDEMIRQH.Hdet8EMz22.EU3BoOPl/MV2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2829, 'ROFIANTO', 'KT21035', 'KT21035@mail.com', NULL, '$2y$10$AA.jJo.PRPjDJ35SwtqEm.1eet9jYgihnPU.KjOOMQCQfHAafTOHK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2830, 'AGNESTI INDUL', 'KT21036', 'KT21036@mail.com', NULL, '$2y$10$ls4A3/Rzt0htSlsm2EJeAu/K4va.m4MMrrJl4cc0ePYzaJcDzsswC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2831, 'DJALU YUDHA PARASDYA', 'KT21037', 'KT21037@mail.com', NULL, '$2y$10$jjwlgH15jTBJ8DMmx3Ecq.LwEptar0EcQXlue9N/r.57T9eBmrWq.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2832, 'WAKHID NURYAHYA', 'KT22001', 'KT22001@mail.com', NULL, '$2y$10$rOUo/mQybydtXImaaVcNJObYwlg.g3Fv9JWnsNnElAzgOQKViYici', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2833, 'AHMAD APRIYADI', 'KT22002', 'KT22002@mail.com', NULL, '$2y$10$W.LWhnMaPE2mvgY3L/8FK.XWahwCRHuyCtHJDYEgZngbhZE043iQ.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2834, 'SABAR PRIYANTO', 'KT22021', 'KT22021@mail.com', NULL, '$2y$10$RzXjpuVLGh7PJwsVP7rZru/Cck7wXmd42HU8RCXtMWqna4WDbnVa2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2835, 'ALIMANSYAH', 'KT22025', 'KT22025@mail.com', NULL, '$2y$10$lygaTt4ZLgaLTzqFtb800ueT9s1iwu4FCxDlxuiNAadBjB965ccfa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2836, 'MUHAMMAD DWI SEPTIAWAN', 'KT22026', 'KT22026@mail.com', NULL, '$2y$10$zANPaaLyDR5TP4fkSMDXyegSNAF9cIiQNrwrn5nWuNNrYlx.YJ902', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2837, 'AGUNG SUGIYONO', 'KT22031', 'KT22031@mail.com', NULL, '$2y$10$BE6VuJHr.dCd3WV/nVh2D.qw687D6uAW.ROgkCNGwdvQPwc2txGZu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2838, 'MIKA DWI SATYA K', 'KT22032', 'KT22032@mail.com', NULL, '$2y$10$oL0Vma38Mi3AbKrSgzKdWO237.PJBSXbXnNTmXi/PuWgKQQF3.SVC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2839, 'ROBINSON SIAHAAN', 'KT22033', 'KT22033@mail.com', NULL, '$2y$10$CoMw31XVtYV5CCyzKH3Hbe973qdZ0jOhjv7AYbtyqasWrfVN9PvAa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:55', '2025-05-07 21:36:55'),
(2840, 'FERI ANDI SETIAWAN', 'KT23002', 'KT23002@mail.com', NULL, '$2y$10$LvjmyYwLidi8pHJik89yW.wiQ5CDnDrAA1pdlpygk40V.miizcnbe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2841, 'GUNTUR AJI', 'KT23003', 'KT23003@mail.com', NULL, '$2y$10$G8aWo5NBphO.A022lmn9/eeO/b7qow6S4NBHARpF6miPil7IstVE2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2842, 'M. FAIZUL AMIN ARRAISI', 'KT23004', 'KT23004@mail.com', NULL, '$2y$10$0..n8kWhriq82798YQCgbOgQCKTRrMS5v/iFb/CUUFwXWmHsp8I2K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2843, 'TINO ARIF MUNANDAR', 'KT23005', 'KT23005@mail.com', NULL, '$2y$10$zNQVI1p5JKh3cSGqZIp.Eu1mjQ.nP/oxe31cjkSoyeE7EbzPdj0ya', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2844, 'GERALDY  NAGUSKA WAFA', 'KT23006', 'KT23006@mail.com', NULL, '$2y$10$aLEGwb7bXNfbR7Un1wbLO.iKE6qiD6USIZf3uKus6V8wBODWzik5i', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2845, 'HERRY ISWANTO', 'KT23007', 'KT23007@mail.com', NULL, '$2y$10$Nnx0bsEXgUJP.kbtnDd6P.j3lCV6aLPiOLfo5Go6NgdAzznL0WhbW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2846, 'THEOFANNY ABSYALOM', 'KT23013', 'KT23013@mail.com', NULL, '$2y$10$PU.Zes3kMKxOhLPoyIoLWeocOK/5RL8nZTrtRFBuRSnHxMiJBhBFe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2847, 'M FAUZAN RIZKY ZAKARIA', 'KT23014', 'KT23014@mail.com', NULL, '$2y$10$c8aMWw2SPft6wMO32ZbcDuvYVNJE0dDV5v.Dc.8jyw6bABZsqyVZm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2848, 'RIAN NURAHMAN', 'KT23017', 'KT23017@mail.com', NULL, '$2y$10$cP3/TJi9V50IuO5uPw9MXeVcQuTjMb.hHSV77zRXfEBI1J6svRqSi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2849, 'JEREMY SAGALA', 'KT23023', 'KT23023@mail.com', NULL, '$2y$10$AaeakusRZBE3sSe..NTzrOCVB432YWB6ZJdwGAL9V48ShaaE1CD02', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2850, 'ARJUN WAHYUDI', 'KT23034', 'KT23034@mail.com', NULL, '$2y$10$NtWb1BYOFwnI3WskjXWy..yIpriew7/CIq3RYaA2j6jMhquYutrFO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2851, 'AHMAT FAIZIN', 'KT23035', 'KT23035@mail.com', NULL, '$2y$10$UKMWbzngadV3bavCbDt4Du4yDkNBs1AJABcsTn0hlgoL4yJgsDcWa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2852, 'ABDUL HARIS', 'KT23043', 'KT23043@mail.com', NULL, '$2y$10$7.0PDi8FjrgY5oGx6H1A6eL6DyHGyBPzBiwGEiavLZcJIS14YnChK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2853, 'JUPEN PURBA', 'KT23044', 'KT23044@mail.com', NULL, '$2y$10$xyj8ZpqDrOwJ/VvR6cNd..KuB3838IFc1.Xd4FhMMXFGAfS3063aC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2854, 'FAJAR FERDIANSYAH', 'KT23046', 'KT23046@mail.com', NULL, '$2y$10$AyPaN4M65bjXXYW7C/Xi2OTQlre9EvqnTGPHSMLIy72jokQQvlMZ6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2855, 'DEO RIVALDI BAYU YUARISUNA', 'KT23047', 'KT23047@mail.com', NULL, '$2y$10$wwG50P7tfAeyFKy0yGLRbucqO8FB6nnNo64FN07DTqP2Ax041drH2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2856, 'HANGGISA ALFA RISKI', 'KT23048', 'KT23048@mail.com', NULL, '$2y$10$Bnr6TChPpz7gbZfLCvV4..kl7.j3u20m/0f57sspeP.qMMuc/Kqa.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2857, 'SALFANA ROZIQA', 'KT23050', 'KT23050@mail.com', NULL, '$2y$10$nAy3wTgYrftuOELQOuFo1eyS2RNlqiuG0sbO1u3FZQ1sNm8FkJ2hO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2858, 'MUHAMMAD HENDRY', 'KT23053', 'KT23053@mail.com', NULL, '$2y$10$SPjZnvLyZwujxjRpBP91Ku2RmjnTYNY.PqbjHGgIcFGb69ppYAEWu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2859, 'RIGO ARIS SANDI', 'KT23054', 'KT23054@mail.com', NULL, '$2y$10$ykdRiR2wed1ZLKw3okwsaucqhAyCYYX5mcrAyyl6IL9MFm4VWQsAK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2860, 'M TAKDIR ALI SAHBANI', 'KT23055', 'KT23055@mail.com', NULL, '$2y$10$U1Xmaa6YoMt.43S4Vesih.fu6pW9V94A.EMac9SghuPGUtaEbhYmy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2861, 'IDFARQI PRAYUDA DWI TAMA', 'KT23063', 'KT23063@mail.com', NULL, '$2y$10$drsvJKha.aWiTEwZ82enkegHlm3YmcGaymVNdHo.yM2QAD3VoH2pq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:56', '2025-05-07 21:36:56'),
(2862, 'MUHAMMAD SAIFUDIN', 'KT23070', 'KT23070@mail.com', NULL, '$2y$10$o9lJt/8qafWpsYi30seLXer6HsBmnmUtBwQody88iqpraeY.iNAvW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2863, 'WAHYU AKBAR NUGROHO', 'KT23071', 'KT23071@mail.com', NULL, '$2y$10$njNAurWSuckP/XDGJLDq7O8AtquxfPB2MEendeV0ZatzeysDNQjYO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2864, 'M NUR FAISAL ADHI SATRIA', 'KT23072', 'KT23072@mail.com', NULL, '$2y$10$DmcWd3wN8IQKO8Io52aVx.G2G.250rC74YweNezDV2twgEqGpsYFe', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2865, 'RONI ROMANSAH', 'KT23073', 'KT23073@mail.com', NULL, '$2y$10$gT.iivdW5VWmXI/NdgdlgucFWwH22ZlHRTPzO5AZNsPQ/1SVEksuq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2866, 'DHONNY ADHYTYA PRADANA', 'KT23078', 'KT23078@mail.com', NULL, '$2y$10$XT3RXLmzVvZ6kWwEa3cn9enFvP/oAHWXD3VXgn2fouGe8U8jt2wSC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2867, 'FIQRI MALAKIANO', 'KT23079', 'KT23079@mail.com', NULL, '$2y$10$pe0c3yT0lwBtte94gs0R0.Z.tnUpLjAahjJWBZI5O20ACJQn/E/wC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2868, 'MUS MULYADI', 'KT23080', 'KT23080@mail.com', NULL, '$2y$10$49tuWNZbpMBXqTjZTvDFKOTIZlvxIYNdatpFpH6s8ETCjckq0Vy9y', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2869, 'DODI SETIAWAN', 'KT23081', 'KT23081@mail.com', NULL, '$2y$10$yem8oVc/OVnA7WMj1n5RZ.Qev2fgVoq5.is/ReJpvtPDvQLSjOgSm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2870, 'MUHAMAMD ILHAM KURNIAWAN', 'KT23085', 'KT23085@mail.com', NULL, '$2y$10$25kivGNpiJZ0SmU3rKDbcurQuevcX3Hl.lbbqmUu4X5nUUngSLQ9K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2871, 'OLAN', 'KT23086', 'KT23086@mail.com', NULL, '$2y$10$MTHGEdbgzDp308OAV54Ry.u/74eU8qOKcH01gYZvoTd0tX51QqF.K', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2872, 'SABRANG AJI PANGESTU', 'KT23087', 'KT23087@mail.com', NULL, '$2y$10$QUdGqhFWHWfBPBxZgbXlO.bQXHZQ2HiGg7zeUOiOIcPyRxG3Z1O/S', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2873, 'MUHAMMAD SALMAN ARIQ', 'KT23088', 'KT23088@mail.com', NULL, '$2y$10$NqwqutVEqJBAu9Hg3Lsvzuh535buhsKpm4y9CRGIEEEE8R.OTwK/6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2874, 'AHMAD HIDAYAT', 'KT23089', 'KT23089@mail.com', NULL, '$2y$10$4bJ7gz/OzWL6P0FWxhv4peJGJFWkJaHl02k/iAKkZjXAkeLFCXBsy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2875, 'AHMAD YUDHA', 'KT23090', 'KT23090@mail.com', NULL, '$2y$10$anf/v3qvG1qLIi79HE/WverAm703U.iSpQHX7xYmyevxuwyptKTAG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2876, 'SELFANI MAULANA', 'KT23091', 'KT23091@mail.com', NULL, '$2y$10$ECNUPlATAibcpZSC8PiiZu8qqNUw5C5zWhsLbNxYHXo2.4ftyvoMK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2877, 'RAIHAN', 'KT24003', 'KT24003@mail.com', NULL, '$2y$10$HXKAv/K4WwJmJkTpM.M1sOYJKZoJqxeUXSIR2nDTOwykikNhpH9v2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2878, 'SURYANI', 'KT24004', 'KT24004@mail.com', NULL, '$2y$10$BGSiaGrUOjhZSje0HdROSuT0paMFUZY5lG8KiczRJCeBE.0wTuvNu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2879, 'ARIFIN', 'KT24005', 'KT24005@mail.com', NULL, '$2y$10$FkD2RrvdRrFI3vpC3u4jfuXPgkbyiwgKV9XTC/WsmqqlAERQrEo52', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2880, 'M. NORFADILLAH', 'KT24006', 'KT24006@mail.com', NULL, '$2y$10$UdBTzNEz6BLLS2Zy.9hpu.fD9Jp/4Wo68Z/eAiE1rMJchCsbEqkqm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2881, 'MUHAMMAD ARIEF', 'KT24007', 'KT24007@mail.com', NULL, '$2y$10$ydjz0pzcwOSAOWbBmbLtpe5q.eWMs2h2TH4E9LIiD0hEyAziUIDa2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2882, 'A. FAKHRUL ULUM', 'KT24008', 'KT24008@mail.com', NULL, '$2y$10$XReDeDRqE.uNA8zeBKUxE.yFI0LzKv9Ip./H4XbDpoqsgIXlDgBPu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2883, 'RAHMAT GAJALI', 'KT24009', 'KT24009@mail.com', NULL, '$2y$10$WmWQSzyW2fELHEI1gWW5Oe2MlJ4qv.t14yypzLNMHn7LIyCRr4vM2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:57', '2025-05-07 21:36:57'),
(2884, 'BAYU SETIYAWAN', 'KT24010', 'KT24010@mail.com', NULL, '$2y$10$N2.JziUOhDfNC5ZcuxOR.OZS.1ak/ZEST.gHZ27Mj8j9SQNIZzdXa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2885, 'ALDI SAPUTRA', 'KT24011', 'KT24011@mail.com', NULL, '$2y$10$D5urQX9FJX6I42xuwEQHV.MT1pncACgV3du.8zEO5OoW7VRSe1Zta', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2886, 'AGUSTIAWAN', 'KT24012', 'KT24012@mail.com', NULL, '$2y$10$wDwOiZmWMxjS.Rbj4eltiOjXKU3uUqbTI3A2d3t4k3rk82glPP17q', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2887, 'MUHAMMAD DEDI ILHAM', 'KT24016', 'KT24016@mail.com', NULL, '$2y$10$LoNPkbRQpHllFW5rs.i/I.hXSJlyyiveMLq83VTmq8DJ76Buaz/ey', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58');
INSERT INTO `users` (`id`, `name`, `nrp`, `email`, `email_verified_at`, `password`, `no_hp`, `role`, `department`, `position`, `district`, `status`, `signature`, `remember_token`, `created_at`, `updated_at`) VALUES
(2888, 'ERFAN NAVIRI', 'KT24017', 'KT24017@mail.com', NULL, '$2y$10$RcZ0TcIcwpU05i1zxI5J0ep4fi8twPKjx0.I6dNLf8gpq4Fzf4SNS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2889, 'HERI SETIAWAN', 'KT24018', 'KT24018@mail.com', NULL, '$2y$10$umI8w8g7UV38Tlvcs4yxuOcqcqGTdeYiOTs0c2BMIu/g/xQ6ZWYbi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2890, 'MUHAMMAD RIDTHA HUL AKBAR', 'KT24019', 'KT24019@mail.com', NULL, '$2y$10$Ky48r7a0mRxigF5B.anEXekYhHTH.u1e3gLZds7KkoqNw5XKrMd72', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2891, 'WINDY RIDANA', 'KT24020', 'KT24020@mail.com', NULL, '$2y$10$zQjnDDJaSWphJcFtt8wCp./4xuaaBp8iiHUePRzlwuaTvAgea0Kui', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2892, 'SETYA ANWAR SADAD', 'KT24021', 'KT24021@mail.com', NULL, '$2y$10$6D5Xx8j0xNQCqqdqtRcIfO8Um8FDxBqjB7Wp446sJfnYq.nqte6KG', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2893, 'RIZKI WAHYU FADHLILLAH', 'KU15002', 'KU15002@mail.com', NULL, '$2y$10$QthFJbF786Zb912C9ADZoOR2ZO2C7TxMDkCh1I01nOiPQt9p9kGrO', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2894, 'IMAM WAHYUDI', 'TA20005', 'TA20005@mail.com', NULL, '$2y$10$E.Jno7eEuz4jVY0HWMmXJuAmzXYbWjx0SgH.1uhWwaLa8omekVoO.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2895, 'ROIS PRASETYO FAJRI', 'KT23012', 'KT23012@mail.com', NULL, '$2y$10$lyXUUnjmmOmThZlEevKBruNL.RQid4oFV1P5Bm5Oprj8KEENiQ9Q6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2896, 'KUKUH IMAM PAMUNGKAS', 'KT23064', 'KT23064@mail.com', NULL, '$2y$10$tDhRWaWMSEiPhrhVIgOQPu7TIcU47ulmzbszjkGrctQuHLB5373WK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2897, 'MOHAMMAD NOOR FIRDAUS', 'KT23083', 'KT23083@mail.com', NULL, '$2y$10$aT3.DoFaamQD4Mk2aIs4v.idHBZfgdZ0MaR8uvrycsSUKFGFtU4zW', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2898, 'INDRAWAN DWI HARTANTO', 'KB10046', 'KB10046@mail.com', NULL, '$2y$10$AyDcGhXSC..t0DELym03feNr/CahdR9IOXArD0fBHRgf4lqbeT6zm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2899, 'VERLI DESTRIAWAN', 'KT25007', 'KT25007@mail.com', NULL, '$2y$10$V/FzCfe5PymZGCyYmywBL.mr9C4ccndMf48yZI90J.YGDc0DcdrT6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2900, 'PITRA HARDIANSYAH', 'KT16085', 'KT16085@mail.com', NULL, '$2y$10$kqIjZ0gcHbxh3zY0NhBVLOu5H/.iT5oJD.aMGndUUrO8f3TYDR3D2', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2901, 'M KAHFI', 'KT23082', 'KT23082@mail.com', NULL, '$2y$10$W9PtHHjF6/NbNMtmsUKNkey1V9Km3FzbxGquEAST/FOtY7AMtCPzu', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2902, 'LUKMAN AULIA RAHMAN', 'KB24169', 'KB24169@mail.com', NULL, '$2y$10$em5F9JJS4ngNbNywknydIeqtgVjGYx6k6ysqt3kZOPpRaSQ/h5.bq', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2903, 'HERU DARMAWAN', 'KC23025', 'KC23025@mail.com', NULL, '$2y$10$Sq5sug5i8tWTLh/5pkfFheA88MPjjzWUpp8guUpTiDtTOA/qliNPC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2904, 'PANJI SUSANTO', 'KT25006', 'KT25006@mail.com', NULL, '$2y$10$bgaJXQtMzN5oKjJG7rwXm.jYTmyMWSbDa5.cCApItaniqP8OM3pmK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2905, 'DANANG ARIFIANTO', 'KB11071', 'KB11071@mail.com', NULL, '$2y$10$AWUExTyFbVuVdYQ9hwOa7.aH44G.iZtwdxTwre2JdV2W4hvN8SMOy', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:58', '2025-05-07 21:36:58'),
(2906, 'SASTA MULYA DININGRAT', 'KT23019', 'KT23019@mail.com', NULL, '$2y$10$EZ0ZnfpV3.kVYIXeSyyVJOJsXjGEbT1r8UBGzvi/P0TikalRZ6Q4C', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2907, 'WAHYU NUGRAHA', 'KT25009', 'KT25009@mail.com', NULL, '$2y$10$9DEFlpSom8wifKf2WLZbEeXNPMTG.T6awtpwdfqSUm81oI3cbFWnm', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2908, 'ARIA YOGA PRATAMA', 'KT25001', 'KT25001@mail.com', NULL, '$2y$10$6c2GJKntHWFmo93LsWnQRuWQyQT0jinMoAQiANeYfxNi0xNPUYbOi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2909, 'ILHAM BAYU VERYANTO', 'KT25008', 'KT25008@mail.com', NULL, '$2y$10$ypYRDS2h.NRr0IHlAjh4TO16GQcf7bSfTLfeePmglTSScREwZeX0q', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2910, 'M JAMALUDDIN DAI ROBBI', 'KT23020', 'KT23020@mail.com', NULL, '$2y$10$BNmdo9uv1Q.Sh00IPA16HOcFpdFetXIv8DbUW7tmH21aWk9shp/IS', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2911, 'TRIYANTO', 'KT18033', 'KT18033@mail.com', NULL, '$2y$10$Et8U9nKbGFCDxFEfh0HT3.3ZGWRzolIHdiiJCSOXICyKFn2Av3Fle', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2912, 'KELVIN SATRIA RANTELEMBANG', 'KT25011', 'KT25011@mail.com', NULL, '$2y$10$ihhqW/1s2DAm7f95ojuZX.JsxWBxBV1L0UOtFvXTQu5xCbIcw0LJi', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2913, 'PUPUNG BORSALINO', 'KB23070', 'KB23070@mail.com', NULL, '$2y$10$tnG33lD5YUwz0VQNC9gLP.OmJff5sez3DiaweL/hNqi1i94H7Dn5.', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2914, 'AKBAR KURNIAWAN', 'KB12081', 'KB12081@mail.com', NULL, '$2y$10$w/DHg.UzctRxr0t/JarzgOxhNOWcVDe2iawlT/EtaMuIqRSN.isWC', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2915, 'DANIEL HERMAWAN', 'KT21012', 'KT21012@mail.com', NULL, '$2y$10$SCL5Wy9SO6NpOCunfjlyUu7UOZO7Fxy9Ej4DZJSFyKa0sGuXCZKM6', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2916, 'TANRAJUNG HERMAN SIARA', 'KT25010', 'KT25010@mail.com', NULL, '$2y$10$gycu4K2pUQNpoLUvua8mRe/fzE82CRBoNsLcKc1KoR9V8xx7IA1Ei', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2917, 'MUHAMMAD HUSAEIN', 'KE23110', 'KE23110@mail.com', NULL, '$2y$10$SkubLG2hd8n9IEH9gDdVUuS/.KNqKepuqpDBmrXT8fwsGXSr6ylWK', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2918, 'YOGA RIFKI EFFENDI', 'KB12050', 'KB12050@mail.com', NULL, '$2y$10$T3IA.zee6Bobq5rxBTzaKeDv1k4M5dqXxRmp.e7Vznaq7JAMSRcpa', NULL, 3, NULL, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:36:59', '2025-05-07 21:36:59'),
(2919, 'Agung UF', '10001', '10001@mail.com', NULL, '$2y$10$bibrAB4FaAT82PURbDQDDO9OxfGualoguHx6DAJTSKaSbeRKPoHdu', NULL, 3, 21, NULL, NULL, 'Aktif', NULL, NULL, '2025-05-07 21:47:24', '2025-05-07 21:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `wo_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `company_id` bigint UNSIGNED DEFAULT NULL,
  `department_id` bigint UNSIGNED DEFAULT NULL,
  `employee_id` bigint UNSIGNED DEFAULT NULL,
  `request_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`id`, `wo_number`, `order_date`, `company_id`, `department_id`, `employee_id`, `request_description`, `start_date`, `end_date`, `description`, `status`, `created_at`, `updated_at`) VALUES
(52, '002/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Ampar Material Standarisasi Bahu Jalan KM 33', '2023-09-11 12:00:00', '2023-09-11 15:00:00', '-', 2, '2023-10-18 23:52:17', '2023-10-19 00:13:45'),
(53, '003/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Ampar Material Buat Standarisasi Bahu Jalan KM 33', '2023-09-22 12:00:00', '2023-09-22 14:00:00', '-', 2, '2023-10-18 23:53:23', '2023-10-19 03:16:39'),
(54, '004/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Ampar Material Standarisasi Bahu Jalan KM 33', '2023-09-15 12:00:00', '2023-09-15 14:00:00', '-', 2, '2023-10-18 23:54:37', '2023-10-19 03:16:49'),
(55, '005/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Evakuasi Pohon Rebah KM 55,5 JABB ABB11', '2023-09-11 12:00:00', '2023-09-11 13:30:00', '-', 2, '2023-10-19 00:10:55', '2023-10-19 03:16:59'),
(56, '006/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Daywork Maintenance Area Office ABB', '2023-09-13 12:00:00', '2023-09-13 13:00:00', '-', 2, '2023-10-19 00:13:31', '2023-10-19 03:17:06'),
(57, '007/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Daywork Maintenance Jalan Masyarakat arah SD Sakakarangan (MCIP)', '2023-09-14 09:00:00', '2023-09-13 12:00:00', '-', 2, '2023-10-19 00:15:47', '2023-10-19 03:17:13'),
(58, '008/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Maintenance Seputaran Washimgh Plan ABB', '2023-09-18 06:00:00', '2023-09-18 15:00:00', '-', 2, '2023-10-19 00:17:45', '2023-10-19 03:17:20'),
(59, '009/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Bahu Jalan KM 53', '2023-09-07 08:00:00', '2023-09-07 12:00:00', '-', 2, '2023-10-19 00:18:51', '2023-10-19 03:17:30'),
(60, '010/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area CPP', '2023-09-11 12:00:00', '2023-09-11 15:00:00', '-', 2, '2023-10-19 00:19:59', '2023-10-19 03:17:38'),
(61, '011/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area Office ABB', '2023-09-13 00:00:00', '2023-09-13 15:00:00', '-', 2, '2023-10-19 00:21:05', '2023-10-19 03:17:43'),
(62, '012/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area Office ABB', '2023-09-13 12:00:00', '2023-09-13 13:00:00', '-', 2, '2023-10-19 00:22:13', '2023-10-19 03:17:48'),
(63, '013/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area Jalan Masyarakat Arah SD Sakakarangan (MCIP', '2023-09-14 09:00:00', '2023-09-14 15:00:00', '-', 2, '2023-10-19 00:24:02', '2023-10-19 03:17:54'),
(64, '014/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area Jalan Masyarakat Arah SD Sakakarangan MCIP', '2023-09-16 09:00:00', '2023-09-16 11:00:00', '-', 2, '2023-10-19 00:25:22', '2023-10-19 03:18:00'),
(65, '015/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Bahu Jalan KM 33 (Standarisasi Bahu Jalan(', '2023-09-01 07:00:00', '2023-09-01 09:00:00', '-', 2, '2023-10-19 00:26:59', '2023-10-19 03:18:05'),
(66, '016/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Bahu Jalan KM 32,500 (Standarisasi Bahu Jalan)', '2023-09-02 01:00:00', '2023-09-02 15:00:00', '-', 2, '2023-10-19 00:28:10', '2023-10-19 03:18:10'),
(69, '018/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Standarisasi Bahu Jalan KM 33,5 -34', '2023-09-14 12:00:00', '2023-09-14 20:00:00', '-', 2, '2023-10-19 00:37:24', '2023-10-19 03:18:20'),
(70, '019/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Standarisasi Bahu Jalan KM 33,5-34', '2023-09-15 06:00:00', '2023-09-14 08:20:00', '-', 2, '2023-10-19 00:39:25', '2023-10-19 03:18:24'),
(71, '020/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Standarisasi Bahu Jalan KM 33', '2023-09-16 07:00:00', '2023-09-16 10:00:00', '-', 2, '2023-10-19 03:43:49', '2023-10-19 19:14:37'),
(72, '021/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Pelebaran Bahu Jalan KM 35', '2023-09-20 07:00:00', '2023-09-20 11:00:00', '-', 2, '2023-10-19 03:45:12', '2023-10-19 19:14:44'),
(73, '022/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Bahu Jalan KM 53', '2023-09-07 07:00:00', '2023-09-07 10:00:00', '-', 2, '2023-10-19 03:52:43', '2023-10-19 19:15:27'),
(74, '023/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area CPP', '2023-09-11 07:00:00', '2023-09-11 09:30:00', '-', 2, '2023-10-19 03:53:36', '2023-10-19 19:15:33'),
(75, '024/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Pelebaran Bahu Jalan KM 49', '2023-09-23 07:00:00', '2023-09-23 03:00:00', '-', 2, '2023-10-19 03:56:50', '2023-10-19 19:15:38'),
(76, '025/WO-KPP/VI/2023', '2023-10-19', 1, 6, 6, 'Compacting Area CPP ABB', '2023-09-25 07:00:00', '2023-09-25 13:00:00', '-', 2, '2023-10-19 03:58:06', '2023-10-19 19:15:43'),
(77, '026/WO-KPP/VI/2023', '2023-10-20', 1, 6, 6, 'Support Front Meta M1 (Front PSEX 615)', '2023-09-13 06:00:00', '2023-09-13 04:00:00', '-', 2, '2023-10-19 19:38:59', '2023-10-19 19:39:57'),
(78, '027/WO-KPP/VI/2023', '2023-10-20', 1, 6, 6, 'Support Front Meta M1 (Front PSEX 615)', '2023-09-14 06:00:00', '2023-09-14 04:00:00', '-', 2, '2023-10-19 20:33:13', '2023-10-19 20:39:23'),
(79, '028/WO-KPP/VI/2023', '2023-10-20', 1, 6, 6, 'Support Front Meta (Front PSEX 615)', '2023-09-15 06:00:00', '2023-09-15 04:00:00', '-', 2, '2023-10-19 20:35:59', '2023-10-19 20:39:14'),
(80, '029/WO-KPP/VI/2023', '2023-10-20', 1, 6, 6, 'Support Front Meta M1 (Front PSEX 615)', '2023-09-16 06:00:00', '2023-09-16 04:00:00', '-', 2, '2023-10-19 20:37:15', '2023-10-19 20:38:57'),
(97, '031/WO-KPP/VI/2023', '2023-11-16', 1, 6, 6, 'Compacting Material Lepas dijalan pemukiman', '2023-09-16 06:30:00', '2023-09-16 17:00:00', '-', 2, '2023-11-16 02:37:14', '2024-06-07 06:55:55'),
(98, '031/WO-KPP/VI/2023', '2023-11-16', 1, 6, 6, 'Compacting Material Lepas dijalan pemukiman', '2023-09-16 06:30:00', '2023-09-16 17:00:00', '-', 2, '2023-11-16 02:37:53', '2024-06-07 06:56:03'),
(99, '032/WO-KPP/VI/2024', '2024-06-07', 1, 6, 6, 'tes', '2024-05-05 15:11:00', '2024-05-06 14:11:00', '-', 2, '2024-06-07 07:11:32', '2024-06-07 07:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `work_order_details`
--

CREATE TABLE `work_order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `item` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `final_date` datetime DEFAULT NULL,
  `hours_use` int DEFAULT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `workorder_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `work_order_details`
--

INSERT INTO `work_order_details` (`id`, `item`, `qty`, `image`, `start_date`, `final_date`, `hours_use`, `unit_id`, `workorder_id`, `created_at`, `updated_at`) VALUES
(47, 'GRADER', 1, 'workorder/QLC4lFUqLTHC.png', '2023-09-11 12:00:00', '2023-10-26 15:43:00', 1083, 5, 52, '2023-10-18 23:52:17', '2023-10-26 01:43:59'),
(48, 'GRADER', 1, NULL, '2023-09-22 12:00:00', NULL, NULL, NULL, 53, '2023-10-18 23:53:23', '2023-10-18 23:53:23'),
(49, 'GRADER', 1, NULL, '2023-09-15 12:00:00', NULL, NULL, NULL, 54, '2023-10-18 23:54:37', '2023-10-18 23:54:37'),
(50, 'GRADER', 1, NULL, '2023-09-11 12:00:00', NULL, NULL, NULL, 55, '2023-10-19 00:10:55', '2023-10-19 00:10:55'),
(51, 'GRADER', 1, NULL, '2023-09-13 12:00:00', NULL, NULL, NULL, 56, '2023-10-19 00:13:31', '2023-10-19 00:13:31'),
(52, 'GRADER', 1, NULL, '2023-09-14 09:00:00', NULL, NULL, NULL, 57, '2023-10-19 00:15:47', '2023-10-19 00:15:47'),
(53, 'GRADER', 1, NULL, '2023-09-18 06:00:00', NULL, NULL, NULL, 58, '2023-10-19 00:17:45', '2023-10-19 00:17:45'),
(54, 'PC', 1, NULL, '2023-09-07 08:00:00', NULL, NULL, NULL, 59, '2023-10-19 00:18:51', '2023-10-19 00:18:51'),
(55, 'PC', 1, NULL, '2023-09-11 12:00:00', NULL, NULL, NULL, 60, '2023-10-19 00:19:59', '2023-10-19 00:19:59'),
(56, 'PC', 1, NULL, '2023-09-13 00:00:00', NULL, NULL, NULL, 61, '2023-10-19 00:21:05', '2023-10-19 00:21:05'),
(57, 'PC', 1, NULL, '2023-09-13 12:00:00', NULL, NULL, NULL, 62, '2023-10-19 00:22:13', '2023-10-19 00:22:13'),
(58, 'PC', 1, NULL, '2023-09-14 09:00:00', NULL, NULL, NULL, 63, '2023-10-19 00:24:02', '2023-10-19 00:24:02'),
(59, 'PC', 1, NULL, '2023-09-16 09:00:00', NULL, NULL, NULL, 64, '2023-10-19 00:25:22', '2023-10-19 00:25:22'),
(60, 'PC', 1, NULL, '2023-09-01 07:00:00', NULL, NULL, NULL, 65, '2023-10-19 00:26:59', '2023-10-19 00:26:59'),
(61, 'PC', 1, NULL, '2023-09-02 01:00:00', NULL, NULL, NULL, 66, '2023-10-19 00:28:10', '2023-10-19 00:28:10'),
(66, 'PC', 1, NULL, '2023-09-14 12:00:00', NULL, NULL, NULL, 69, '2023-10-19 00:37:24', '2023-10-19 00:37:24'),
(67, 'PC', 1, NULL, '2023-09-15 06:00:00', NULL, NULL, NULL, 70, '2023-10-19 00:39:25', '2023-10-19 00:39:25'),
(68, 'PC', 1, 'workorder/U9ZJLJ1MY9kX.png', '2023-09-16 07:00:00', '2023-10-27 15:37:00', 992, 1, 71, '2023-10-19 03:43:49', '2023-10-26 01:37:07'),
(69, 'PC', 1, NULL, '2023-09-20 07:00:00', NULL, NULL, NULL, 72, '2023-10-19 03:45:12', '2023-10-19 03:45:12'),
(70, 'PC', 1, NULL, '2023-09-07 07:00:00', NULL, NULL, NULL, 73, '2023-10-19 03:52:43', '2023-10-19 03:52:43'),
(71, 'PC', 1, NULL, '2023-09-11 07:00:00', NULL, NULL, NULL, 74, '2023-10-19 03:53:36', '2023-10-19 03:53:36'),
(72, 'PC', 1, NULL, '2023-09-23 07:00:00', NULL, NULL, NULL, 75, '2023-10-19 03:56:50', '2023-10-19 03:56:50'),
(73, 'PC', 1, NULL, '2023-09-25 07:00:00', NULL, NULL, NULL, 76, '2023-10-19 03:58:06', '2023-10-19 03:58:06'),
(74, 'WA', 1, 'workorder/N67tLPyfMlqu.jpg', '2023-09-13 06:00:00', '2023-09-13 16:00:00', 10, 66, 77, '2023-10-19 19:38:59', '2023-10-19 19:48:17'),
(75, 'SW', 1, NULL, '2023-09-14 06:00:00', NULL, NULL, NULL, 78, '2023-10-19 20:33:13', '2023-10-19 20:33:13'),
(76, 'SW', 1, NULL, '2023-09-15 06:00:00', NULL, NULL, NULL, 79, '2023-10-19 20:35:59', '2023-10-19 20:35:59'),
(77, 'SW', 1, 'workorder/l80nuOkE6lYj.jpg', '2023-09-16 06:00:00', '2024-05-27 13:54:00', 6103, 25, 80, '2023-10-19 20:37:15', '2024-06-07 06:54:43'),
(94, 'SW', 1, 'workorder/w3Wiq3Ki4Dl7.jpg', '2023-09-16 06:30:00', '2024-03-31 13:56:00', 4735, 26, 97, '2023-11-16 02:37:14', '2024-06-07 06:57:11'),
(95, 'GRADER', 1, NULL, '2023-09-16 06:30:00', NULL, NULL, NULL, 98, '2023-11-16 02:37:53', '2023-11-16 02:37:53'),
(96, 'LD', 1, 'workorder/yWlt1k9fbFjv.jpg', '2024-05-05 15:11:00', '2024-06-06 14:13:00', 767, 26, 99, '2024-06-07 07:11:32', '2024-06-07 07:13:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ehays`
--
ALTER TABLE `ehays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ehays_code_unique` (`code`),
  ADD UNIQUE KEY `ehays_uuid_unique` (`uuid`),
  ADD KEY `ehays_employee_id_foreign` (`employee_id`),
  ADD KEY `ehays_family_id_foreign` (`family_id`);

--
-- Indexes for table `ehay_cares`
--
ALTER TABLE `ehay_cares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ehay_cares_ehay_id_foreign` (`ehay_id`);

--
-- Indexes for table `ehay_log_statuses`
--
ALTER TABLE `ehay_log_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ehay_log_statuses_ehay_id_foreign` (`ehay_id`);

--
-- Indexes for table `ehay_treatments`
--
ALTER TABLE `ehay_treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ehay_treatments_ehay_id_foreign` (`ehay_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_company_id_foreign` (`company_id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`),
  ADD KEY `families_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signatures`
--
ALTER TABLE `signatures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signatures_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `signs`
--
ALTER TABLE `signs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `signs_sign_number_unique` (`sign_number`),
  ADD KEY `signs_from_id_foreign` (`from_id`);

--
-- Indexes for table `sign_documents`
--
ALTER TABLE `sign_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sign_documents_sign_id_foreign` (`sign_id`);

--
-- Indexes for table `sign_histories`
--
ALTER TABLE `sign_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sign_histories_validator_id_foreign` (`validator_id`),
  ADD KEY `sign_histories_sign_id_foreign` (`sign_id`);

--
-- Indexes for table `sign_logs`
--
ALTER TABLE `sign_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sign_logs_sign_id_foreign` (`sign_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_nip_unique` (`nrp`),
  ADD KEY `users_department_foreign` (`department`),
  ADD KEY `users_position_foreign` (`position`),
  ADD KEY `users_district_foreign` (`district`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_orders_company_id_foreign` (`company_id`),
  ADD KEY `work_orders_department_id_foreign` (`department_id`),
  ADD KEY `work_orders_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `work_order_details`
--
ALTER TABLE `work_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `work_order_details_unit_id_foreign` (`unit_id`),
  ADD KEY `work_order_details_workorder_id_foreign` (`workorder_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ehays`
--
ALTER TABLE `ehays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `ehay_cares`
--
ALTER TABLE `ehay_cares`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ehay_log_statuses`
--
ALTER TABLE `ehay_log_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ehay_treatments`
--
ALTER TABLE `ehay_treatments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=964;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `signatures`
--
ALTER TABLE `signatures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `signs`
--
ALTER TABLE `signs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `sign_documents`
--
ALTER TABLE `sign_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sign_histories`
--
ALTER TABLE `sign_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `sign_logs`
--
ALTER TABLE `sign_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2920;

--
-- AUTO_INCREMENT for table `work_orders`
--
ALTER TABLE `work_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `work_order_details`
--
ALTER TABLE `work_order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ehays`
--
ALTER TABLE `ehays`
  ADD CONSTRAINT `ehays_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `ehays_family_id_foreign` FOREIGN KEY (`family_id`) REFERENCES `families` (`id`);

--
-- Constraints for table `ehay_cares`
--
ALTER TABLE `ehay_cares`
  ADD CONSTRAINT `ehay_cares_ehay_id_foreign` FOREIGN KEY (`ehay_id`) REFERENCES `ehays` (`id`);

--
-- Constraints for table `ehay_log_statuses`
--
ALTER TABLE `ehay_log_statuses`
  ADD CONSTRAINT `ehay_log_statuses_ehay_id_foreign` FOREIGN KEY (`ehay_id`) REFERENCES `ehays` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ehay_treatments`
--
ALTER TABLE `ehay_treatments`
  ADD CONSTRAINT `ehay_treatments_ehay_id_foreign` FOREIGN KEY (`ehay_id`) REFERENCES `ehays` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `families`
--
ALTER TABLE `families`
  ADD CONSTRAINT `families_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `signs`
--
ALTER TABLE `signs`
  ADD CONSTRAINT `signs_from_id_foreign` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sign_documents`
--
ALTER TABLE `sign_documents`
  ADD CONSTRAINT `sign_documents_sign_id_foreign` FOREIGN KEY (`sign_id`) REFERENCES `signs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sign_histories`
--
ALTER TABLE `sign_histories`
  ADD CONSTRAINT `sign_histories_sign_id_foreign` FOREIGN KEY (`sign_id`) REFERENCES `signs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sign_histories_validator_id_foreign` FOREIGN KEY (`validator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sign_logs`
--
ALTER TABLE `sign_logs`
  ADD CONSTRAINT `sign_logs_sign_id_foreign` FOREIGN KEY (`sign_id`) REFERENCES `signs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_foreign` FOREIGN KEY (`department`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `users_district_foreign` FOREIGN KEY (`district`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `users_position_foreign` FOREIGN KEY (`position`) REFERENCES `positions` (`id`);

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `work_orders_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `work_orders_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `work_orders_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `work_order_details`
--
ALTER TABLE `work_order_details`
  ADD CONSTRAINT `work_order_details_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `work_order_details_workorder_id_foreign` FOREIGN KEY (`workorder_id`) REFERENCES `work_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
