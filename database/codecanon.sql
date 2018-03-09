-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2018 at 12:20 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codecanon`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_companyname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_street_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_street_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_companyname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_street_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_street_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `firstname`, `lastname`, `billing_firstname`, `billing_lastname`, `billing_companyname`, `billing_country`, `billing_street_1`, `billing_street_2`, `billing_city`, `billing_state`, `billing_zip`, `billing_phone`, `billing_email`, `shipping_firstname`, `shipping_lastname`, `shipping_companyname`, `shipping_country`, `shipping_street_1`, `shipping_street_2`, `shipping_city`, `shipping_state`, `shipping_zip`, `shipping_phone`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '', '', 'tesdddd', '1', '123', '123', '123333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333', '123', '123', '434343', '456464trte', '1234343434344444444444444444444444444444444444444444444444444444444444', '4343343aa@aaa.com', '123', '123', '123', '123', '123', '123', '123', '123', '123', '123', 2, '2017-10-12 02:59:53', '2017-10-16 17:32:46'),
(2, '', '', 'aksh', 'mishra', 'softthink technology', 'BAHRAIN', '99', 'fyffyfytfty', 'indore', 'madhya pradesh', '452010', '9977885566', 'aksh@gmail.com', 'aks', 'mishra', 'softthink technology', 'BAHAMAS', '99', 'skkff', 'indore', 'madhya pradesh', '452010', '9977885566', 13, '2017-12-22 06:38:17', '2017-12-23 06:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '{\"action\":\"uploaded\",\"itemName\":\"photo\",\"happenedAt\":1515755261225,\"items\":[{\"name\":\"TransLogo.png\",\"id\":2,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:07:40', '2018-01-12 11:07:40'),
(2, '{\"action\":\"uploaded\",\"itemName\":\"photo\",\"happenedAt\":1515755269855,\"items\":[{\"name\":\"logome ssscsssopy.png\",\"id\":3,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:07:49', '2018-01-12 11:07:49'),
(3, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515755381211,\"items\":[{\"name\":\"Logome ssscsssopy.png\",\"id\":3,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:09:40', '2018-01-12 11:09:40'),
(4, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515755393952,\"items\":[{\"name\":\"Logome ssscsssopy.png\",\"id\":3,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:09:53', '2018-01-12 11:09:53'),
(5, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515755402955,\"items\":[{\"name\":\"Logome ssscsssopy.png\",\"id\":3,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:10:02', '2018-01-12 11:10:02'),
(6, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515755406818,\"items\":[{\"name\":\"20171012_122655.jpg\",\"id\":4,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:10:06', '2018-01-12 11:10:06'),
(7, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515755419676,\"items\":[{\"name\":\"IMG_3430.JPG\",\"id\":1,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:10:19', '2018-01-12 11:10:19'),
(8, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515755430516,\"items\":[{\"name\":\"20171012_122655.jpg\",\"id\":4,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:10:31', '2018-01-12 11:10:31'),
(9, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515755433237,\"items\":[{\"name\":\"Logome ssscsssopy.png\",\"id\":3,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:10:32', '2018-01-12 11:10:32'),
(10, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515755441540,\"items\":[{\"name\":\"IMG_3430.JPG\",\"id\":1,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 11:10:41', '2018-01-12 11:10:41'),
(11, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1515770748315,\"items\":[{\"name\":\"Untitled Photo\",\"id\":5,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 15:25:48', '2018-01-12 15:25:48'),
(12, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515771436038,\"items\":[{\"name\":\"Untitled Photo\",\"id\":6,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 15:37:16', '2018-01-12 15:37:16'),
(13, '{\"action\":\"uploaded\",\"itemName\":\"photo\",\"happenedAt\":1515772453401,\"items\":[{\"name\":\"Cars.jpg\",\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 15:54:13', '2018-01-12 15:54:13'),
(14, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515772621339,\"items\":[{\"name\":\"Untitled Photo\",\"id\":5,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 15:57:01', '2018-01-12 15:57:01'),
(15, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515772847287,\"items\":[{\"name\":\"Untitled Photo\",\"id\":5,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 16:00:47', '2018-01-12 16:00:47'),
(16, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515772980928,\"items\":[{\"name\":\"Untitled Photo\",\"id\":5,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 16:03:01', '2018-01-12 16:03:01'),
(17, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515775161782,\"items\":[{\"name\":\"Untitled Photo\",\"id\":5,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 16:39:22', '2018-01-12 16:39:22'),
(18, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515782434494,\"items\":[{\"name\":\"Untitled Photo\",\"id\":6,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 18:40:35', '2018-01-12 18:40:35'),
(19, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1515791331980,\"items\":[{\"name\":\"Untitled Photo\",\"id\":8,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 21:08:52', '2018-01-12 21:08:52'),
(20, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515791485650,\"items\":[{\"name\":\"Untitled Photo\",\"id\":8,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 21:11:25', '2018-01-12 21:11:25'),
(21, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515793135225,\"items\":[{\"name\":\"Untitled Photo\",\"id\":5,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-12 21:38:55', '2018-01-12 21:38:55'),
(22, '{\"action\":\"uploaded\",\"itemName\":\"photo\",\"happenedAt\":1515834717762,\"items\":[{\"name\":\"20.jpg\",\"id\":9,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":3}', 3, '2018-01-13 09:11:58', '2018-01-13 09:11:58'),
(23, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1515834854310,\"items\":[{\"name\":\"20.jpg\",\"id\":9,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":3}', 3, '2018-01-13 09:14:14', '2018-01-13 09:14:14'),
(24, '{\"action\":\"uploaded\",\"itemName\":\"photo\",\"happenedAt\":1515834909045,\"items\":[{\"name\":\"201410080935142.jpg\",\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":9}', 3, '2018-01-13 09:15:09', '2018-01-13 09:15:09'),
(25, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515840708298,\"items\":[{\"name\":\"20.jpg\",\"id\":9,\"icon\":\"picture\"},{\"name\":\"201410080935142.jpg\",\"id\":10,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":3}', 1, '2018-01-13 10:51:48', '2018-01-13 10:51:48'),
(26, '{\"action\":\"deleted\",\"itemName\":\"photo\",\"happenedAt\":1515840717905,\"items\":[{\"name\":\"Untitled Photo\",\"id\":8,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-13 10:51:57', '2018-01-13 10:51:57'),
(27, '{\"action\":\"created\",\"itemName\":\"folder\",\"happenedAt\":1516272847942,\"items\":[{\"name\":\"Test\",\"id\":17,\"icon\":\"folder-empty\"}],\"user\":\"You\",\"folder_id\":17}', 1, '2018-01-18 05:24:08', '2018-01-18 05:24:08'),
(28, '{\"action\":\"created\",\"itemName\":\"folder\",\"happenedAt\":1516272855401,\"items\":[{\"name\":\"ddd\",\"id\":18,\"icon\":\"folder-empty\"}],\"user\":\"You\",\"folder_id\":18}', 1, '2018-01-18 05:24:15', '2018-01-18 05:24:15'),
(29, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517216216322,\"items\":[{\"name\":\"New\",\"id\":12,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 1, '2018-01-29 03:26:56', '2018-01-29 03:26:56'),
(30, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517216216262,\"items\":[{\"name\":\"New\",\"id\":11,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 1, '2018-01-29 03:26:56', '2018-01-29 03:26:56'),
(31, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517216447243,\"items\":[{\"name\":\"New\",\"id\":12,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 1, '2018-01-29 03:30:47', '2018-01-29 03:30:47'),
(32, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517216640410,\"items\":[{\"name\":\"New\",\"id\":13,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-29 03:34:00', '2018-01-29 03:34:00'),
(33, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517216783154,\"items\":[{\"name\":\"New\",\"id\":13,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-29 03:36:23', '2018-01-29 03:36:23'),
(34, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517216815570,\"items\":[{\"name\":\"New\",\"id\":13,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-29 03:36:55', '2018-01-29 03:36:55'),
(35, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517216829903,\"items\":[{\"name\":\"New\",\"id\":13,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-29 03:37:10', '2018-01-29 03:37:10'),
(36, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517220021520,\"items\":[{\"name\":\"New\",\"id\":13,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-29 04:30:21', '2018-01-29 04:30:21'),
(37, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517220470566,\"items\":[{\"name\":\"Other\",\"id\":14,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 04:37:50', '2018-01-29 04:37:50'),
(38, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517222891695,\"items\":[{\"name\":\"Untitled Photo\",\"id\":15,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 05:18:11', '2018-01-29 05:18:11'),
(39, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517230150880,\"items\":[{\"name\":\"Untitled Photo\",\"id\":15,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 07:19:11', '2018-01-29 07:19:11'),
(40, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517230153614,\"items\":[{\"name\":\"Untitled Photo\",\"id\":15,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 07:19:13', '2018-01-29 07:19:13'),
(41, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517230205389,\"items\":[{\"name\":\"Untitled Photo\",\"id\":15,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 07:20:05', '2018-01-29 07:20:05'),
(42, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517230224354,\"items\":[{\"name\":\"Untitled Photo\",\"id\":15,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 07:20:24', '2018-01-29 07:20:24'),
(43, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517230300418,\"items\":[{\"name\":\"Untitled Photo\",\"id\":15,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 07:21:40', '2018-01-29 07:21:40'),
(44, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517230459046,\"items\":[{\"name\":\"Untitled Photo\",\"id\":16,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-29 07:24:19', '2018-01-29 07:24:19'),
(45, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517395091445,\"items\":[{\"name\":\"Photo\",\"id\":17,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 05:08:11', '2018-01-31 05:08:11'),
(46, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517395326575,\"items\":[{\"name\":\"Untitled\",\"id\":18,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 05:12:06', '2018-01-31 05:12:06'),
(47, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517396239480,\"items\":[{\"name\":\"Untitled\",\"id\":18,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 05:27:19', '2018-01-31 05:27:19'),
(48, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517397804107,\"items\":[{\"name\":\"Untitled\",\"id\":18,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 05:53:32', '2018-01-31 05:53:32'),
(49, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517398353542,\"items\":[{\"name\":\"Untitled\",\"id\":18,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 06:02:33', '2018-01-31 06:02:33'),
(50, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517398366449,\"items\":[{\"name\":\"Untitled\",\"id\":18,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 06:02:46', '2018-01-31 06:02:46'),
(51, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517401009043,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":19,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 06:46:49', '2018-01-31 06:46:49'),
(52, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517401110411,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":19,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 06:48:30', '2018-01-31 06:48:30'),
(53, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517401422286,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":20,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-01-31 06:53:42', '2018-01-31 06:53:42'),
(54, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517402436091,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":21,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-31 07:10:36', '2018-01-31 07:10:36'),
(55, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517402460216,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":21,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-01-31 07:11:00', '2018-01-31 07:11:00'),
(56, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483508951,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":24,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:04', '2018-02-01 05:42:04'),
(57, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483507838,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":23,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:04', '2018-02-01 05:42:04'),
(58, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483507895,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":22,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:04', '2018-02-01 05:42:04'),
(59, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483508933,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":25,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:04', '2018-02-01 05:42:04'),
(60, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483514520,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":26,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:05', '2018-02-01 05:42:05'),
(61, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483522690,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":27,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:05', '2018-02-01 05:42:05'),
(62, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483565395,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":28,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:42:45', '2018-02-01 05:42:45'),
(63, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517483609796,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":29,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:43:30', '2018-02-01 05:43:30'),
(64, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517484369223,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":30,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 05:56:09', '2018-02-01 05:56:09'),
(65, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517484742922,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":31,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 06:02:23', '2018-02-01 06:02:23'),
(66, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517484850624,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":32,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 06:04:10', '2018-02-01 06:04:10'),
(67, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517485625755,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":33,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 06:17:06', '2018-02-01 06:17:06'),
(68, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517487880162,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":34,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-01 06:54:40', '2018-02-01 06:54:40'),
(69, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517567797855,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":35,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-02 05:06:38', '2018-02-02 05:06:38'),
(70, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517640699604,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":36,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-02-03 01:21:39', '2018-02-03 01:21:39'),
(71, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517815754187,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":37,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-02-05 01:59:14', '2018-02-05 01:59:14'),
(72, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517909661876,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":38,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-02-06 04:04:22', '2018-02-06 04:04:22'),
(73, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517909696163,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":39,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-02-06 04:04:56', '2018-02-06 04:04:56'),
(74, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517915528009,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":40,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-06 05:42:08', '2018-02-06 05:42:08'),
(75, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517915666228,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":41,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-06 05:44:26', '2018-02-06 05:44:26'),
(76, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517915667513,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":42,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-06 05:44:27', '2018-02-06 05:44:27'),
(77, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517915873315,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":43,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-06 05:47:53', '2018-02-06 05:47:53'),
(78, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517915965448,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":44,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":20}', 18, '2018-02-06 05:49:25', '2018-02-06 05:49:25'),
(79, '{\"action\":\"created\",\"itemName\":\"photo\",\"happenedAt\":1517923322432,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":45,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-02-06 07:52:02', '2018-02-06 07:52:02'),
(80, '{\"action\":\"edited\",\"itemName\":\"photo\",\"happenedAt\":1517924338964,\"items\":[{\"name\":\"Untitled Artwork\",\"id\":45,\"icon\":\"picture\"}],\"user\":\"You\",\"folder_id\":1}', 1, '2018-02-06 08:08:59', '2018-02-06 08:08:59');

-- --------------------------------------------------------

--
-- Table structure for table `dp_activity`
--

CREATE TABLE `dp_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dp_art_cart`
--

CREATE TABLE `dp_art_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_art_cart`
--

INSERT INTO `dp_art_cart` (`id`, `user_id`, `art_id`, `status`, `datetime`) VALUES
(9, 21, 2, 1, '2018-02-26 13:18:47'),
(10, 21, 1, 1, '2018-02-26 13:24:25'),
(11, 21, 1, 1, '2018-02-26 13:30:34'),
(12, 21, 2, 1, '2018-02-26 13:32:03'),
(13, 21, 1, 1, '2018-02-26 13:32:30'),
(14, 21, 1, 1, '2018-02-26 13:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `dp_billing_addresses`
--

CREATE TABLE `dp_billing_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_billing_addresses`
--

INSERT INTO `dp_billing_addresses` (`id`, `user_id`, `first_name`, `last_name`, `company`, `country`, `city`, `state`, `zip`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(4, 18, 'test', 'user', 'tset user', 'United States', 'plano', 'texas', '75203', '876545654', 'test@gmail.com', NULL, '0000-00-00 00:00:00', '2018-02-20 07:16:06'),
(5, 21, 'aksh', 'mishra', 'softthink technology', 'United States', 'indore', 'madhya pradesh', '452010', 'dfgh', 'fghdfgh', '99, skk', '0000-00-00 00:00:00', '2018-02-28 05:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `dp_blog_post`
--

CREATE TABLE `dp_blog_post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_blog_post`
--

INSERT INTO `dp_blog_post` (`id`, `user_id`, `image`, `title`, `description`, `datetime`) VALUES
(1, 0, 'blog.jpg', 'Blog ', 'THis is the test blog for innerartist', '2018-02-07 08:11:27'),
(2, 0, '', 'Blog1', 'This is also a test blog ', '2018-02-07 08:41:57'),
(3, 0, '', 'Blog2', 'This is again the test blog', '2018-02-07 08:42:57'),
(4, 0, 'blog.jpg', 'Blog3', 'This is also again a test blog ', '2018-02-07 12:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `dp_cart`
--

CREATE TABLE `dp_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `promotional_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_cart`
--

INSERT INTO `dp_cart` (`id`, `user_id`, `product_id`, `product_type`, `promotional_code`, `quantity`, `status`, `updated_at`, `datetime`) VALUES
(2, 21, 1, '', '', 1, 1, '2018-02-28 11:18:48', '2018-02-28 11:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `dp_category`
--

CREATE TABLE `dp_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_category`
--

INSERT INTO `dp_category` (`id`, `category`, `status`, `datetime`) VALUES
(1, 'cups', 1, '2018-02-14 17:47:30'),
(2, 'Lamps', 1, '2018-02-15 06:44:04'),
(4, 'defdfdfd', 1, '2018-02-15 06:59:23'),
(6, 'dfffffffffffffffffff', 1, '2018-02-15 07:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `dp_contact_us`
--

CREATE TABLE `dp_contact_us` (
  `id` int(11) NOT NULL,
  `contact_for` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `tell_more` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_contact_us`
--

INSERT INTO `dp_contact_us` (`id`, `contact_for`, `name`, `email`, `subject`, `tell_more`, `image`, `datetime`) VALUES
(1, 'get help with an order I placed', 'a', 'aksh@gmail.com', 'a', 'a', '', '2018-02-06 11:49:31'),
(2, 'get help with placing a new order', 'ffghfg', 'fd@gmail.com', 'ghjfgj', 'fghfjgfgjf', '', '2018-02-25 14:39:16'),
(3, 'get help with an order I placed', 's', 'snm04@gmail.com', 'kjhkj', 'ytyutyu', '', '2018-02-25 14:40:18'),
(4, 'get help with an order I placed', 'uyjhfy', 'gf@gmail.com', 'dhfdhf', 'ghfghfj', '', '2018-02-25 14:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `dp_favourite`
--

CREATE TABLE `dp_favourite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artwork_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_favourite`
--

INSERT INTO `dp_favourite` (`id`, `user_id`, `artwork_id`, `type`, `status`, `datetime`) VALUES
(1, 1, 5, 'artwork', 1, '2018-02-16 12:24:16'),
(2, 18, 18, 'artwork', 1, '2018-02-16 12:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `dp_folders`
--

CREATE TABLE `dp_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `share_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_folders`
--

INSERT INTO `dp_folders` (`id`, `name`, `description`, `user_id`, `share_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 'root', NULL, 1, 'XAXw2e1UpN2aUgD', NULL, '2018-01-09 10:23:29', '2018-01-09 10:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `dp_labels`
--

CREATE TABLE `dp_labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_labels`
--

INSERT INTO `dp_labels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'favorite', '2018-01-09 10:23:00', '2018-01-09 10:23:00'),
(2, 'trashed', '2018-01-09 10:23:00', '2018-01-09 10:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `dp_migrations`
--

CREATE TABLE `dp_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_migrations`
--

INSERT INTO `dp_migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_04_127_156842_create_users_oauth_table', 1),
('2015_04_13_140047_create_photo_models_table', 1),
('2015_04_18_134312_create_folders_table', 1),
('2015_04_28_152847_create_activity_table', 1),
('2015_05_05_131439_create_labels_table', 1),
('2015_05_05_131450_create_photos_labels_table', 1),
('2015_05_29_131549_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_orders`
--

CREATE TABLE `dp_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `material_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `total_price` double(15,2) NOT NULL,
  `status` enum('on-cart','ordered','confirmed','delivered') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quantity` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `promo_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_note` text COLLATE utf8_unicode_ci NOT NULL,
  `approve_status` int(1) NOT NULL,
  `denial_reason` int(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;

--
-- Dumping data for table `dp_orders`
--

INSERT INTO `dp_orders` (`id`, `user_id`, `product_id`, `material_id`, `size_id`, `category_id`, `total_price`, `status`, `created_at`, `updated_at`, `quantity`, `shipping`, `shipping_address`, `shipping_state`, `shipping_zipcode`, `promo_code`, `order_note`, `approve_status`, `denial_reason`) VALUES
(1, 2, '5', 1, NULL, 4, 40.00, 'ordered', '2017-04-26 05:45:35', '2017-04-26 05:46:14', 1, 2, '', '', '', '', '', 0, 0),
(2, 2, '5', 1, NULL, 4, 30.00, 'ordered', '2017-04-26 07:32:42', '2017-04-26 07:33:13', 1, 6, '', '', '', '', '', 0, 0),
(14, 18, '9,8', NULL, NULL, NULL, 310.00, 'on-cart', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', '', '', '', '', 0, 0),
(15, 21, '1', NULL, NULL, NULL, 280.00, 'ordered', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 0, 'United States', 'sdfgs', 'dfgsdfg', '', 'dfgdsfgsdfgdfg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dp_password_resets`
--

CREATE TABLE `dp_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dp_photos`
--

CREATE TABLE `dp_photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `share_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attach_id` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `serialized_editor_state` mediumtext COLLATE utf8_unicode_ci,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dp_photos_labels`
--

CREATE TABLE `dp_photos_labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dp_products`
--

CREATE TABLE `dp_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `path_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top_layer_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bottom_layer_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `custom_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `canvas_height` smallint(6) DEFAULT NULL,
  `canvas_width` smallint(6) DEFAULT NULL,
  `crop_art_width` int(11) NOT NULL,
  `crop_art_height` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `base_cost` int(11) NOT NULL,
  `regular_price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `sale_end_date` datetime NOT NULL,
  `flat_rate` int(11) NOT NULL,
  `two_days_shipping` int(11) NOT NULL,
  `rush_delivery` int(11) NOT NULL,
  `is_sale` int(11) NOT NULL,
  `is_canvas_product` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL,
  `vendor_api_product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vendor_sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_products`
--

INSERT INTO `dp_products` (`id`, `title`, `path_image`, `top_layer_image`, `bottom_layer_image`, `custom_title`, `custom_description`, `canvas_height`, `canvas_width`, `crop_art_width`, `crop_art_height`, `price`, `base_cost`, `regular_price`, `sale_price`, `sale_end_date`, `flat_rate`, `two_days_shipping`, `rush_delivery`, `is_sale`, `is_canvas_product`, `status`, `category_id`, `vendor_api_product`, `vendor_sku`, `created_at`, `updated_at`) VALUES
(1, 't', NULL, 'http://localhost/innerartist/innerartist/assets/images/products/46uN52XW0k.png', 'http://localhost/innerartist/innerartist/assets/images/products/CK9T11FrcZ.png', 'g', 'r', NULL, NULL, 23, 23, 120, 0, 120, 344, '2018-02-28 00:00:00', 20, 56, 566, 0, 0, 1, 2, 'f', 'f', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dp_promo_code`
--

CREATE TABLE `dp_promo_code` (
  `id` int(11) NOT NULL,
  `code_name` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `total_cart_discount` int(11) NOT NULL,
  `usage_limit` varchar(255) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_promo_code`
--

INSERT INTO `dp_promo_code` (`id`, `code_name`, `coupon_code`, `total_cart_discount`, `usage_limit`, `expiration_date`, `status`, `updated_at`, `datetime`) VALUES
(1, 'gfhgh', 'tgyyut', 20, 'tuyjgyujg', '0000-00-00 00:00:00', 0, '2018-02-17 06:21:15', '2018-02-17 06:21:15'),
(2, 'j', 'j', 0, 'j', '2018-05-08 00:00:00', 0, '2018-02-21 08:42:27', '2018-02-21 08:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `dp_seller_setting`
--

CREATE TABLE `dp_seller_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paypal_account` varchar(255) NOT NULL,
  `paypal_threshold` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_seller_setting`
--

INSERT INTO `dp_seller_setting` (`id`, `user_id`, `paypal_account`, `paypal_threshold`, `status`, `datetime`) VALUES
(1, 21, 'akshita@paypal.com', '2500', 0, '2018-02-28 06:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `dp_settings`
--

CREATE TABLE `dp_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_settings`
--

INSERT INTO `dp_settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'homeTagline', 'Inner Artist. Changing the way art is created.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'homeByline', 'Drag and drop anywhere on the homepage to upload and host your images. 5MB Limit. Register or login to access your dashboard, image editor and other features..', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'homeButtonText', 'Register Now', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'homepage', 'landing', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'validExtensions', 'jpg, jpeg, png, gif', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'maxFileSize', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'maxUserSpace', '41943040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'enableRegistration', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'siteName', 'Inner Artist', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'enableHomeUpload', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'maxSimultUploads', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'enablePushState', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'dateLocale', 'en', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'pushStateRootUrl', '/', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'disqusShortname', 'pixie', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dp_shippping_addresses`
--

CREATE TABLE `dp_shippping_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `order_note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_shippping_addresses`
--

INSERT INTO `dp_shippping_addresses` (`id`, `user_id`, `first_name`, `last_name`, `company`, `country`, `city`, `state`, `zip`, `phone`, `email`, `address`, `order_note`, `created_at`, `updated_at`) VALUES
(2, 18, 'test', 'user', 'test users', 'United States', 'plano', 'texas', '75203', NULL, NULL, NULL, 'ghjgdfhjghjfvdghcg', '0000-00-00 00:00:00', '2018-02-20 07:07:36'),
(3, 21, 'aksh', 'mishra', 'softthink technology', 'United States', 'indore', 'madhya pradesh', '452010', NULL, NULL, '99, skk', '', '0000-00-00 00:00:00', '2018-02-28 05:43:36');

-- --------------------------------------------------------

--
-- Table structure for table `dp_users`
--

CREATE TABLE `dp_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dp_users`
--

INSERT INTO `dp_users` (`id`, `username`, `first_name`, `last_name`, `avatar_url`, `gender`, `permissions`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Development', 'Pradosh', NULL, NULL, NULL, '{\"admin\":1}', 'admin@gmail.com', '$2y$10$YbziGvNtF6/4cxQjV1kqSeQABGdUdPG5I/SJ6OdKCxkkjnVI8e/DW', '1pKpWyjp7JpeHoXA3XiA2NergtJTB2jMCZOGfU37pqJBWXk76nPxRIwruZRj', '2018-01-09 10:23:29', '2018-01-13 09:09:46'),
(2, NULL, 'Suresh', 'Ramesh', NULL, NULL, NULL, 'demo@gmail.com', '$2y$10$YbziGvNtF6/4cxQjV1kqSeQABGdUdPG5I/SJ6OdKCxkkjnVI8e/DW', 'HHlf6ROQPYra1CZo9cBNABPmyCoSjbmGFK3nHqB35DRIUHJCDHylJGremsaq', '2018-01-12 12:55:07', '2018-01-13 09:18:16'),
(3, NULL, 'Ramesh', NULL, NULL, NULL, NULL, 'kai@gmail.com', '$2y$10$VD3b6pB9.DSfDvLR8lIX.ubLIAvuhzzSxgpXYs8Hl0P4bw.xUu5y.', 'wNAW1D9W2iCN7qLdzKJY1dB2Lg8BNc3gv3zyqD8XY1IcDxGg0lk42Sy24vOy', '2018-01-13 09:10:14', '2018-01-13 09:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `dp_users_oauth`
--

CREATE TABLE `dp_users_oauth` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dp_vendor`
--

CREATE TABLE `dp_vendor` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `residential_street_add` varchar(255) NOT NULL,
  `residential_line2` varchar(255) NOT NULL,
  `residential_city` varchar(255) NOT NULL,
  `residential_zipcode` varchar(255) NOT NULL,
  `residential_state` varchar(255) NOT NULL,
  `residential_country` varchar(255) NOT NULL,
  `postal_street_add` varchar(255) NOT NULL,
  `postal_line2` varchar(255) NOT NULL,
  `postal_city` varchar(255) NOT NULL,
  `postal_zipcode` varchar(255) NOT NULL,
  `postal_state` varchar(255) NOT NULL,
  `postal_country` varchar(255) NOT NULL,
  `payment_currency` varchar(255) NOT NULL,
  `paypal_email` varchar(255) NOT NULL,
  `approval_status` int(1) NOT NULL,
  `denial_reason` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_vendor`
--

INSERT INTO `dp_vendor` (`id`, `user_id`, `type`, `image`, `first_name`, `last_name`, `email`, `password`, `address`, `residential_street_add`, `residential_line2`, `residential_city`, `residential_zipcode`, `residential_state`, `residential_country`, `postal_street_add`, `postal_line2`, `postal_city`, `postal_zipcode`, `postal_state`, `postal_country`, `payment_currency`, `paypal_email`, `approval_status`, `denial_reason`, `updated_at`, `datetime`) VALUES
(13, 21, '', '', '', '', '', '', '', '99', 'skk', 'indore', '452010', 'madhya pradesh', 'United States(US)', '99', 'skk', 'indore', '452010', 'madhya pradesh', 'United States', 'Paypal', 'akshita@gmail.com', 0, '', '2018-02-27 08:39:02', '2018-02-27 08:39:02');

-- --------------------------------------------------------

--
-- Table structure for table `dp_vendor_payment`
--

CREATE TABLE `dp_vendor_payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `is_payment_release` int(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dp_vendor_payment`
--

INSERT INTO `dp_vendor_payment` (`id`, `user_id`, `total`, `is_payment_release`, `updated_at`, `datetime`) VALUES
(1, 21, 6000, 1, '2018-02-28 08:36:37', '2018-02-28 08:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `share_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `description`, `user_id`, `share_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 'root', NULL, 1, 'wSaN3TM4RSST0ID', NULL, '2018-01-12 10:56:53', '2018-01-12 10:56:53'),
(2, 'root', NULL, 2, 'W2QUUqYQWpkqyN3', NULL, '2018-01-12 12:55:07', '2018-01-12 12:55:07'),
(3, 'root', NULL, 3, 'wAyfAE77kjTDofc', NULL, '2018-01-13 09:10:14', '2018-01-13 09:10:14'),
(4, 'root', NULL, 4, 'wv3TnzmQpx2gp8i', NULL, '2018-01-15 02:02:28', '2018-01-15 02:02:28'),
(5, 'root', NULL, 5, 'U5QlQ5KcWWqWpCJ', NULL, '2018-01-15 02:03:49', '2018-01-15 02:03:49'),
(6, 'root', NULL, 6, 'kTIDIXkEQpoA867', NULL, '2018-01-15 02:04:07', '2018-01-15 02:04:07'),
(7, 'root', NULL, 7, 'vbdWTOhDSCVp8ug', NULL, '2018-01-15 02:04:22', '2018-01-15 02:04:22'),
(8, 'root', NULL, 8, 'MJWIWJ4tr1SIfwz', NULL, '2018-01-15 02:04:37', '2018-01-15 02:04:37'),
(9, 'root', NULL, 9, 'ZZj5CaXJBJRwDsg', NULL, '2018-01-15 02:04:53', '2018-01-15 02:04:53'),
(10, 'root', NULL, 10, 'RKznILRv7UpgZh7', NULL, '2018-01-15 02:05:23', '2018-01-15 02:05:23'),
(11, 'root', NULL, 11, 'LfCAcPO1XqUFy0a', NULL, '2018-01-15 02:05:47', '2018-01-15 02:05:47'),
(12, 'root', NULL, 12, 'OALlWKcjL2CF2cX', NULL, '2018-01-15 02:06:03', '2018-01-15 02:06:03'),
(13, 'root', NULL, 13, 'reqOBMQ0muZaPkU', NULL, '2018-01-15 02:06:20', '2018-01-15 02:06:20'),
(14, 'root', NULL, 14, 'kcj0f3NLCQENt80', NULL, '2018-01-15 02:06:34', '2018-01-15 02:06:34'),
(15, 'root', NULL, 15, 'tHVOPG2CXDRLoYk', NULL, '2018-01-15 02:06:47', '2018-01-15 02:06:47'),
(16, 'root', NULL, 16, '8Qu8G7Q3zCma3R2', NULL, '2018-01-15 02:07:07', '2018-01-15 02:07:07'),
(20, 'root', NULL, 18, 'mBYjyuKNQbUGyrw', NULL, '2018-01-25 01:15:43', '2018-01-25 01:15:43'),
(19, 'root', NULL, 17, 'p3Sekqekkvds87a', NULL, '2018-01-19 13:08:13', '2018-01-19 13:08:13'),
(21, 'root', NULL, 19, 'pLyiNcRGvXYGgT4', NULL, '2018-01-31 08:29:13', '2018-01-31 08:29:13'),
(22, 'root', NULL, 20, 'kEpbScXFUdcS3mb', NULL, '2018-02-10 05:06:32', '2018-02-10 05:06:32'),
(24, 'detail', NULL, 18, 'pE6VQgrjDixuaPK', NULL, '2018-02-13 00:57:41', '2018-02-13 00:57:41'),
(25, 'new', NULL, 19, 'XAl6SdrzvbjUhAu', NULL, '2018-02-21 01:18:37', '2018-02-21 01:18:37'),
(26, 'root', NULL, 21, 'CKJbaYCmYRpScMr', NULL, '2018-02-25 09:31:33', '2018-02-25 09:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `image_sticker`
--

CREATE TABLE `image_sticker` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `darkbg` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image_sticker`
--

INSERT INTO `image_sticker` (`id`, `category`, `folder_name`, `image_name`, `darkbg`, `status`) VALUES
(1, 'animals', 'stickers/animals', '1.png', 0, 1),
(2, 'animals', 'stickers/animals', '10.png', 0, 1),
(3, 'animals', 'stickers/animals', '2.png', 0, 1),
(4, 'animals', 'stickers/animals', '3.png', 0, 1),
(5, 'animals', 'stickers/animals', '4.png', 0, 1),
(6, 'animals', 'stickers/animals', '5.png', 0, 1),
(7, 'animals', 'stickers/animals', '6.png', 0, 1),
(8, 'animals', 'stickers/animals', '7.png', 0, 1),
(9, 'animals', 'stickers/animals', '8.png', 0, 1),
(10, 'animals', 'stickers/animals', '9.png', 0, 1),
(11, 'clouds', 'stickers/clouds', '1.png', 1, 1),
(12, 'clouds', 'stickers/clouds', '10.png', 1, 1),
(13, 'clouds', 'stickers/clouds', '11.png', 1, 1),
(14, 'clouds', 'stickers/clouds', '12.png', 1, 1),
(15, 'clouds', 'stickers/clouds', '13.png', 1, 1),
(16, 'clouds', 'stickers/clouds', '14.png', 1, 1),
(17, 'clouds', 'stickers/clouds', '15.png', 1, 1),
(18, 'clouds', 'stickers/clouds', '2.png', 1, 1),
(19, 'clouds', 'stickers/clouds', '3.png', 1, 1),
(20, 'clouds', 'stickers/clouds', '4.png', 1, 1),
(21, 'clouds', 'stickers/clouds', '5.png', 1, 1),
(22, 'clouds', 'stickers/clouds', '6.png', 1, 1),
(23, 'clouds', 'stickers/clouds', '7.png', 1, 1),
(24, 'clouds', 'stickers/clouds', '8.png', 1, 1),
(25, 'clouds', 'stickers/clouds', '9.png', 1, 1),
(26, 'beach', 'stickers/beach', '1.svg', 0, 1),
(27, 'beach', 'stickers/beach', '10.svg', 0, 1),
(28, 'beach', 'stickers/beach', '11.svg', 0, 1),
(29, 'beach', 'stickers/beach', '12.svg', 0, 1),
(30, 'beach', 'stickers/beach', '13.svg', 0, 1),
(31, 'beach', 'stickers/beach', '14.svg', 0, 1),
(32, 'beach', 'stickers/beach', '15.svg', 0, 1),
(33, 'beach', 'stickers/beach', '16.svg', 0, 1),
(34, 'beach', 'stickers/beach', '17.svg', 0, 1),
(35, 'beach', 'stickers/beach', '18.svg', 0, 1),
(36, 'beach', 'stickers/beach', '19.svg', 0, 1),
(37, 'beach', 'stickers/beach', '2.svg', 0, 1),
(38, 'beach', 'stickers/beach', '20.svg', 0, 1),
(39, 'beach', 'stickers/beach', '21.svg', 0, 1),
(40, 'beach', 'stickers/beach', '22.svg', 0, 1),
(41, 'beach', 'stickers/beach', '3.svg', 0, 1),
(42, 'beach', 'stickers/beach', '4.svg', 0, 1),
(43, 'beach', 'stickers/beach', '5.svg', 0, 1),
(44, 'beach', 'stickers/beach', '6.svg', 0, 1),
(45, 'beach', 'stickers/beach', '7.svg', 0, 1),
(46, 'beach', 'stickers/beach', '8.svg', 0, 1),
(47, 'beach', 'stickers/beach', '9.svg', 0, 1),
(48, 'landmarks', 'stickers/landmarks', '1.svg', 0, 1),
(49, 'landmarks', 'stickers/landmarks', '10.svg', 0, 1),
(50, 'landmarks', 'stickers/landmarks', '100.svg', 0, 1),
(51, 'landmarks', 'stickers/landmarks', '11.svg', 0, 1),
(52, 'landmarks', 'stickers/landmarks', '12.svg', 0, 1),
(53, 'landmarks', 'stickers/landmarks', '13.svg', 0, 1),
(54, 'landmarks', 'stickers/landmarks', '14.svg', 0, 1),
(55, 'landmarks', 'stickers/landmarks', '15.svg', 0, 1),
(56, 'landmarks', 'stickers/landmarks', '16.svg', 0, 1),
(57, 'landmarks', 'stickers/landmarks', '17.svg', 0, 1),
(58, 'landmarks', 'stickers/landmarks', '18.svg', 0, 1),
(59, 'landmarks', 'stickers/landmarks', '19.svg', 0, 1),
(60, 'landmarks', 'stickers/landmarks', '2.svg', 0, 1),
(61, 'landmarks', 'stickers/landmarks', '20.svg', 0, 1),
(62, 'landmarks', 'stickers/landmarks', '21.svg', 0, 1),
(63, 'landmarks', 'stickers/landmarks', '22.svg', 0, 1),
(64, 'landmarks', 'stickers/landmarks', '23.svg', 0, 1),
(65, 'landmarks', 'stickers/landmarks', '24.svg', 0, 1),
(66, 'landmarks', 'stickers/landmarks', '25.svg', 0, 1),
(67, 'landmarks', 'stickers/landmarks', '26.svg', 0, 1),
(68, 'landmarks', 'stickers/landmarks', '27.svg', 0, 1),
(69, 'landmarks', 'stickers/landmarks', '28.svg', 0, 1),
(70, 'landmarks', 'stickers/landmarks', '29.svg', 0, 1),
(71, 'landmarks', 'stickers/landmarks', '3.svg', 0, 1),
(72, 'landmarks', 'stickers/landmarks', '30.svg', 0, 1),
(73, 'landmarks', 'stickers/landmarks', '31.svg', 0, 1),
(74, 'landmarks', 'stickers/landmarks', '32.svg', 0, 1),
(75, 'landmarks', 'stickers/landmarks', '33.svg', 0, 1),
(76, 'landmarks', 'stickers/landmarks', '34.svg', 0, 1),
(77, 'landmarks', 'stickers/landmarks', '35.svg', 0, 1),
(78, 'landmarks', 'stickers/landmarks', '36.svg', 0, 1),
(79, 'landmarks', 'stickers/landmarks', '37.svg', 0, 1),
(80, 'landmarks', 'stickers/landmarks', '38.svg', 0, 1),
(81, 'landmarks', 'stickers/landmarks', '39.svg', 0, 1),
(82, 'landmarks', 'stickers/landmarks', '4.svg', 0, 1),
(83, 'landmarks', 'stickers/landmarks', '40.svg', 0, 1),
(84, 'landmarks', 'stickers/landmarks', '41.svg', 0, 1),
(85, 'landmarks', 'stickers/landmarks', '42.svg', 0, 1),
(86, 'landmarks', 'stickers/landmarks', '43.svg', 0, 1),
(87, 'landmarks', 'stickers/landmarks', '44.svg', 0, 1),
(88, 'landmarks', 'stickers/landmarks', '45.svg', 0, 1),
(89, 'landmarks', 'stickers/landmarks', '46.svg', 0, 1),
(90, 'landmarks', 'stickers/landmarks', '47.svg', 0, 1),
(91, 'landmarks', 'stickers/landmarks', '48.svg', 0, 1),
(92, 'landmarks', 'stickers/landmarks', '49.svg', 0, 1),
(93, 'landmarks', 'stickers/landmarks', '5.svg', 0, 1),
(94, 'landmarks', 'stickers/landmarks', '50.svg', 0, 1),
(95, 'landmarks', 'stickers/landmarks', '51.svg', 0, 1),
(96, 'landmarks', 'stickers/landmarks', '52.svg', 0, 1),
(97, 'landmarks', 'stickers/landmarks', '53.svg', 0, 1),
(98, 'landmarks', 'stickers/landmarks', '54.svg', 0, 1),
(99, 'landmarks', 'stickers/landmarks', '55.svg', 0, 1),
(100, 'landmarks', 'stickers/landmarks', '56.svg', 0, 1),
(101, 'landmarks', 'stickers/landmarks', '57.svg', 0, 1),
(102, 'landmarks', 'stickers/landmarks', '58.svg', 0, 1),
(103, 'landmarks', 'stickers/landmarks', '59.svg', 0, 1),
(104, 'landmarks', 'stickers/landmarks', '6.svg', 0, 1),
(105, 'landmarks', 'stickers/landmarks', '60.svg', 0, 1),
(106, 'landmarks', 'stickers/landmarks', '61.svg', 0, 1),
(107, 'landmarks', 'stickers/landmarks', '62.svg', 0, 1),
(108, 'landmarks', 'stickers/landmarks', '63.svg', 0, 1),
(109, 'landmarks', 'stickers/landmarks', '64.svg', 0, 1),
(110, 'landmarks', 'stickers/landmarks', '65.svg', 0, 1),
(111, 'landmarks', 'stickers/landmarks', '66.svg', 0, 1),
(112, 'landmarks', 'stickers/landmarks', '67.svg', 0, 1),
(113, 'landmarks', 'stickers/landmarks', '68.svg', 0, 1),
(114, 'landmarks', 'stickers/landmarks', '69.svg', 0, 1),
(115, 'landmarks', 'stickers/landmarks', '7.svg', 0, 1),
(116, 'landmarks', 'stickers/landmarks', '70.svg', 0, 1),
(117, 'landmarks', 'stickers/landmarks', '71.svg', 0, 1),
(118, 'landmarks', 'stickers/landmarks', '72.svg', 0, 1),
(119, 'landmarks', 'stickers/landmarks', '73.svg', 0, 1),
(120, 'landmarks', 'stickers/landmarks', '74.svg', 0, 1),
(121, 'landmarks', 'stickers/landmarks', '75.svg', 0, 1),
(122, 'landmarks', 'stickers/landmarks', '76.svg', 0, 1),
(123, 'landmarks', 'stickers/landmarks', '77.svg', 0, 1),
(124, 'landmarks', 'stickers/landmarks', '78.svg', 0, 1),
(125, 'landmarks', 'stickers/landmarks', '79.svg', 0, 1),
(126, 'landmarks', 'stickers/landmarks', '8.svg', 0, 1),
(127, 'landmarks', 'stickers/landmarks', '80.svg', 0, 1),
(128, 'landmarks', 'stickers/landmarks', '81.svg', 0, 1),
(129, 'landmarks', 'stickers/landmarks', '82.svg', 0, 1),
(130, 'landmarks', 'stickers/landmarks', '83.svg', 0, 1),
(131, 'landmarks', 'stickers/landmarks', '84.svg', 0, 1),
(132, 'landmarks', 'stickers/landmarks', '85.svg', 0, 1),
(133, 'landmarks', 'stickers/landmarks', '86.svg', 0, 1),
(134, 'landmarks', 'stickers/landmarks', '87.svg', 0, 1),
(135, 'landmarks', 'stickers/landmarks', '88.svg', 0, 1),
(136, 'landmarks', 'stickers/landmarks', '89.svg', 0, 1),
(137, 'landmarks', 'stickers/landmarks', '9.svg', 0, 1),
(138, 'landmarks', 'stickers/landmarks', '90.svg', 0, 1),
(139, 'landmarks', 'stickers/landmarks', '91.svg', 0, 1),
(140, 'landmarks', 'stickers/landmarks', '92.svg', 0, 1),
(141, 'landmarks', 'stickers/landmarks', '93.svg', 0, 1),
(142, 'landmarks', 'stickers/landmarks', '94.svg', 0, 1),
(143, 'landmarks', 'stickers/landmarks', '95.svg', 0, 1),
(144, 'landmarks', 'stickers/landmarks', '96.svg', 0, 1),
(145, 'landmarks', 'stickers/landmarks', '97.svg', 0, 1),
(146, 'landmarks', 'stickers/landmarks', '98.svg', 0, 1),
(147, 'landmarks', 'stickers/landmarks', '99.svg', 0, 1),
(148, 'doodles', 'stickers/doodles', '1.svg', 0, 1),
(149, 'doodles', 'stickers/doodles', '10.svg', 0, 1),
(150, 'doodles', 'stickers/doodles', '100.svg', 0, 1),
(151, 'doodles', 'stickers/doodles', '11.svg', 0, 1),
(152, 'doodles', 'stickers/doodles', '12.svg', 0, 1),
(153, 'doodles', 'stickers/doodles', '13.svg', 0, 1),
(154, 'doodles', 'stickers/doodles', '14.svg', 0, 1),
(155, 'doodles', 'stickers/doodles', '15.svg', 0, 1),
(156, 'doodles', 'stickers/doodles', '16.svg', 0, 1),
(157, 'doodles', 'stickers/doodles', '17.svg', 0, 1),
(158, 'doodles', 'stickers/doodles', '18.svg', 0, 1),
(159, 'doodles', 'stickers/doodles', '19.svg', 0, 1),
(160, 'doodles', 'stickers/doodles', '2.svg', 0, 1),
(161, 'doodles', 'stickers/doodles', '20.svg', 0, 1),
(162, 'doodles', 'stickers/doodles', '21.svg', 0, 1),
(163, 'doodles', 'stickers/doodles', '22.svg', 0, 1),
(164, 'doodles', 'stickers/doodles', '23.svg', 0, 1),
(165, 'doodles', 'stickers/doodles', '24.svg', 0, 1),
(166, 'doodles', 'stickers/doodles', '25.svg', 0, 1),
(167, 'doodles', 'stickers/doodles', '26.svg', 0, 1),
(168, 'doodles', 'stickers/doodles', '27.svg', 0, 1),
(169, 'doodles', 'stickers/doodles', '28.svg', 0, 1),
(170, 'doodles', 'stickers/doodles', '29.svg', 0, 1),
(171, 'doodles', 'stickers/doodles', '3.svg', 0, 1),
(172, 'doodles', 'stickers/doodles', '30.svg', 0, 1),
(173, 'doodles', 'stickers/doodles', '31.svg', 0, 1),
(174, 'doodles', 'stickers/doodles', '32.svg', 0, 1),
(175, 'doodles', 'stickers/doodles', '33.svg', 0, 1),
(176, 'doodles', 'stickers/doodles', '34.svg', 0, 1),
(177, 'doodles', 'stickers/doodles', '35.svg', 0, 1),
(178, 'doodles', 'stickers/doodles', '36.svg', 0, 1),
(179, 'doodles', 'stickers/doodles', '37.svg', 0, 1),
(180, 'doodles', 'stickers/doodles', '38.svg', 0, 1),
(181, 'doodles', 'stickers/doodles', '39.svg', 0, 1),
(182, 'doodles', 'stickers/doodles', '4.svg', 0, 1),
(183, 'doodles', 'stickers/doodles', '40.svg', 0, 1),
(184, 'doodles', 'stickers/doodles', '41.svg', 0, 1),
(185, 'doodles', 'stickers/doodles', '42.svg', 0, 1),
(186, 'doodles', 'stickers/doodles', '43.svg', 0, 1),
(187, 'doodles', 'stickers/doodles', '44.svg', 0, 1),
(188, 'doodles', 'stickers/doodles', '45.svg', 0, 1),
(189, 'doodles', 'stickers/doodles', '46.svg', 0, 1),
(190, 'doodles', 'stickers/doodles', '47.svg', 0, 1),
(191, 'doodles', 'stickers/doodles', '48.svg', 0, 1),
(192, 'doodles', 'stickers/doodles', '49.svg', 0, 1),
(193, 'doodles', 'stickers/doodles', '5.svg', 0, 1),
(194, 'doodles', 'stickers/doodles', '50.svg', 0, 1),
(195, 'doodles', 'stickers/doodles', '51.svg', 0, 1),
(196, 'doodles', 'stickers/doodles', '52.svg', 0, 1),
(197, 'doodles', 'stickers/doodles', '53.svg', 0, 1),
(198, 'doodles', 'stickers/doodles', '54.svg', 0, 1),
(199, 'doodles', 'stickers/doodles', '55.svg', 0, 1),
(200, 'doodles', 'stickers/doodles', '56.svg', 0, 1),
(201, 'doodles', 'stickers/doodles', '57.svg', 0, 1),
(202, 'doodles', 'stickers/doodles', '58.svg', 0, 1),
(203, 'doodles', 'stickers/doodles', '59.svg', 0, 1),
(204, 'doodles', 'stickers/doodles', '6.svg', 0, 1),
(205, 'doodles', 'stickers/doodles', '60.svg', 0, 1),
(206, 'doodles', 'stickers/doodles', '61.svg', 0, 1),
(207, 'doodles', 'stickers/doodles', '62.svg', 0, 1),
(208, 'doodles', 'stickers/doodles', '63.svg', 0, 1),
(209, 'doodles', 'stickers/doodles', '64.svg', 0, 1),
(210, 'doodles', 'stickers/doodles', '65.svg', 0, 1),
(211, 'doodles', 'stickers/doodles', '66.svg', 0, 1),
(212, 'doodles', 'stickers/doodles', '67.svg', 0, 1),
(213, 'doodles', 'stickers/doodles', '68.svg', 0, 1),
(214, 'doodles', 'stickers/doodles', '69.svg', 0, 1),
(215, 'doodles', 'stickers/doodles', '7.svg', 0, 1),
(216, 'doodles', 'stickers/doodles', '70.svg', 0, 1),
(217, 'doodles', 'stickers/doodles', '71.svg', 0, 1),
(218, 'doodles', 'stickers/doodles', '72.svg', 0, 1),
(219, 'doodles', 'stickers/doodles', '73.svg', 0, 1),
(220, 'doodles', 'stickers/doodles', '74.svg', 0, 1),
(221, 'doodles', 'stickers/doodles', '75.svg', 0, 1),
(222, 'doodles', 'stickers/doodles', '76.svg', 0, 1),
(223, 'doodles', 'stickers/doodles', '77.svg', 0, 1),
(224, 'doodles', 'stickers/doodles', '78.svg', 0, 1),
(225, 'doodles', 'stickers/doodles', '79.svg', 0, 1),
(226, 'doodles', 'stickers/doodles', '8.svg', 0, 1),
(227, 'doodles', 'stickers/doodles', '80.svg', 0, 1),
(228, 'doodles', 'stickers/doodles', '81.svg', 0, 1),
(229, 'doodles', 'stickers/doodles', '82.svg', 0, 1),
(230, 'doodles', 'stickers/doodles', '83.svg', 0, 1),
(231, 'doodles', 'stickers/doodles', '84.svg', 0, 1),
(232, 'doodles', 'stickers/doodles', '85.svg', 0, 1),
(233, 'doodles', 'stickers/doodles', '86.svg', 0, 1),
(234, 'doodles', 'stickers/doodles', '87.svg', 0, 1),
(235, 'doodles', 'stickers/doodles', '88.svg', 0, 1),
(236, 'doodles', 'stickers/doodles', '89.svg', 0, 1),
(237, 'doodles', 'stickers/doodles', '9.svg', 0, 1),
(238, 'doodles', 'stickers/doodles', '90.svg', 0, 1),
(239, 'doodles', 'stickers/doodles', '91.svg', 0, 1),
(240, 'doodles', 'stickers/doodles', '92.svg', 0, 1),
(241, 'doodles', 'stickers/doodles', '93.svg', 0, 1),
(242, 'doodles', 'stickers/doodles', '94.svg', 0, 1),
(243, 'doodles', 'stickers/doodles', '95.svg', 0, 1),
(244, 'doodles', 'stickers/doodles', '96.svg', 0, 1),
(245, 'doodles', 'stickers/doodles', '97.svg', 0, 1),
(246, 'doodles', 'stickers/doodles', '98.svg', 0, 1),
(247, 'doodles', 'stickers/doodles', '99.svg', 0, 1),
(248, 'transportation', 'stickers/transportation', '1.svg', 0, 1),
(249, 'transportation', 'stickers/transportation', '10.svg', 0, 1),
(250, 'transportation', 'stickers/transportation', '11.svg', 0, 1),
(251, 'transportation', 'stickers/transportation', '12.svg', 0, 1),
(252, 'transportation', 'stickers/transportation', '13.svg', 0, 1),
(253, 'transportation', 'stickers/transportation', '14.svg', 0, 1),
(254, 'transportation', 'stickers/transportation', '15.svg', 0, 1),
(255, 'transportation', 'stickers/transportation', '16.svg', 0, 1),
(256, 'transportation', 'stickers/transportation', '17.svg', 0, 1),
(257, 'transportation', 'stickers/transportation', '18.svg', 0, 1),
(258, 'transportation', 'stickers/transportation', '19.svg', 0, 1),
(259, 'transportation', 'stickers/transportation', '2.svg', 0, 1),
(260, 'transportation', 'stickers/transportation', '20.svg', 0, 1),
(261, 'transportation', 'stickers/transportation', '21.svg', 0, 1),
(262, 'transportation', 'stickers/transportation', '22.svg', 0, 1),
(263, 'transportation', 'stickers/transportation', '3.svg', 0, 1),
(264, 'transportation', 'stickers/transportation', '4.svg', 0, 1),
(265, 'transportation', 'stickers/transportation', '5.svg', 0, 1),
(266, 'transportation', 'stickers/transportation', '6.svg', 0, 1),
(267, 'transportation', 'stickers/transportation', '7.svg', 0, 1),
(268, 'transportation', 'stickers/transportation', '8.svg', 0, 1),
(269, 'transportation', 'stickers/transportation', '9.svg', 0, 1),
(270, 'stars', 'stickers/stars', '1.png', 1, 1),
(271, 'stars', 'stickers/stars', '2.png', 1, 1),
(272, 'stars', 'stickers/stars', '3.png', 1, 1),
(273, 'stars', 'stickers/stars', '4.png', 1, 1),
(274, 'stars', 'stickers/stars', '5.png', 1, 1),
(275, 'stars', 'stickers/stars', '6.png', 1, 1),
(276, 'bubbles', 'stickers/bubbles', '1.png', 0, 1),
(277, 'bubbles', 'stickers/bubbles', '10.png', 0, 1),
(278, 'bubbles', 'stickers/bubbles', '100.png', 0, 1),
(279, 'bubbles', 'stickers/bubbles', '101.png', 0, 1),
(280, 'bubbles', 'stickers/bubbles', '102.png', 0, 1),
(281, 'bubbles', 'stickers/bubbles', '103.png', 0, 1),
(282, 'bubbles', 'stickers/bubbles', '104.png', 0, 1),
(284, 'bubbles', 'stickers/bubbles', '11.png', 0, 1),
(285, 'bubbles', 'stickers/bubbles', '12.png', 0, 1),
(286, 'bubbles', 'stickers/bubbles', '13.png', 0, 1),
(287, 'bubbles', 'stickers/bubbles', '14.png', 0, 1),
(288, 'bubbles', 'stickers/bubbles', '15.png', 0, 1),
(289, 'bubbles', 'stickers/bubbles', '16.png', 0, 1),
(290, 'bubbles', 'stickers/bubbles', '17.png', 0, 1),
(291, 'bubbles', 'stickers/bubbles', '18.png', 0, 1),
(292, 'bubbles', 'stickers/bubbles', '19.png', 0, 1),
(293, 'bubbles', 'stickers/bubbles', '2.png', 0, 1),
(294, 'bubbles', 'stickers/bubbles', '20.png', 0, 1),
(295, 'bubbles', 'stickers/bubbles', '21.png', 0, 1),
(296, 'bubbles', 'stickers/bubbles', '22.png', 0, 1),
(297, 'bubbles', 'stickers/bubbles', '23.png', 0, 1),
(298, 'bubbles', 'stickers/bubbles', '24.png', 0, 1),
(299, 'bubbles', 'stickers/bubbles', '25.png', 0, 1),
(300, 'bubbles', 'stickers/bubbles', '26.png', 0, 1),
(301, 'bubbles', 'stickers/bubbles', '27.png', 0, 1),
(302, 'bubbles', 'stickers/bubbles', '28.png', 0, 1),
(303, 'bubbles', 'stickers/bubbles', '29.png', 0, 1),
(304, 'bubbles', 'stickers/bubbles', '3.png', 0, 1),
(305, 'bubbles', 'stickers/bubbles', '30.png', 0, 1),
(306, 'bubbles', 'stickers/bubbles', '31.png', 0, 1),
(307, 'bubbles', 'stickers/bubbles', '32.png', 0, 1),
(308, 'bubbles', 'stickers/bubbles', '33.png', 0, 1),
(309, 'bubbles', 'stickers/bubbles', '34.png', 0, 1),
(310, 'bubbles', 'stickers/bubbles', '35.png', 0, 1),
(311, 'bubbles', 'stickers/bubbles', '36.png', 0, 1),
(312, 'bubbles', 'stickers/bubbles', '37.png', 0, 1),
(313, 'bubbles', 'stickers/bubbles', '38.png', 0, 1),
(314, 'bubbles', 'stickers/bubbles', '39.png', 0, 1),
(315, 'bubbles', 'stickers/bubbles', '4.png', 0, 1),
(316, 'bubbles', 'stickers/bubbles', '40.png', 0, 1),
(317, 'bubbles', 'stickers/bubbles', '41.png', 0, 1),
(318, 'bubbles', 'stickers/bubbles', '42.png', 0, 1),
(319, 'bubbles', 'stickers/bubbles', '43.png', 0, 1),
(320, 'bubbles', 'stickers/bubbles', '44.png', 0, 1),
(321, 'bubbles', 'stickers/bubbles', '45.png', 0, 1),
(322, 'bubbles', 'stickers/bubbles', '46.png', 0, 1),
(323, 'bubbles', 'stickers/bubbles', '47.png', 0, 1),
(324, 'bubbles', 'stickers/bubbles', '48.png', 0, 1),
(325, 'bubbles', 'stickers/bubbles', '49.png', 0, 1),
(326, 'bubbles', 'stickers/bubbles', '5.png', 0, 1),
(327, 'bubbles', 'stickers/bubbles', '50.png', 0, 1),
(328, 'bubbles', 'stickers/bubbles', '51.png', 0, 1),
(329, 'bubbles', 'stickers/bubbles', '52.png', 0, 1),
(330, 'bubbles', 'stickers/bubbles', '53.png', 0, 1),
(331, 'bubbles', 'stickers/bubbles', '54.png', 0, 1),
(332, 'bubbles', 'stickers/bubbles', '55.png', 0, 1),
(333, 'bubbles', 'stickers/bubbles', '56.png', 0, 1),
(334, 'bubbles', 'stickers/bubbles', '57.png', 0, 1),
(335, 'bubbles', 'stickers/bubbles', '58.png', 0, 1),
(336, 'bubbles', 'stickers/bubbles', '59.png', 0, 1),
(337, 'bubbles', 'stickers/bubbles', '6.png', 0, 1),
(338, 'bubbles', 'stickers/bubbles', '60.png', 0, 1),
(339, 'bubbles', 'stickers/bubbles', '61.png', 0, 1),
(340, 'bubbles', 'stickers/bubbles', '62.png', 0, 1),
(341, 'bubbles', 'stickers/bubbles', '63.png', 0, 1),
(342, 'bubbles', 'stickers/bubbles', '64.png', 0, 1),
(343, 'bubbles', 'stickers/bubbles', '65.png', 0, 1),
(344, 'bubbles', 'stickers/bubbles', '66.png', 0, 1),
(345, 'bubbles', 'stickers/bubbles', '67.png', 0, 1),
(346, 'bubbles', 'stickers/bubbles', '68.png', 0, 1),
(347, 'bubbles', 'stickers/bubbles', '69.png', 0, 1),
(348, 'bubbles', 'stickers/bubbles', '7.png', 0, 1),
(349, 'bubbles', 'stickers/bubbles', '70.png', 0, 1),
(350, 'bubbles', 'stickers/bubbles', '71.png', 0, 1),
(351, 'bubbles', 'stickers/bubbles', '72.png', 0, 1),
(352, 'bubbles', 'stickers/bubbles', '73.png', 0, 1),
(353, 'bubbles', 'stickers/bubbles', '74.png', 0, 1),
(354, 'bubbles', 'stickers/bubbles', '75.png', 0, 1),
(355, 'bubbles', 'stickers/bubbles', '76.png', 0, 1),
(356, 'bubbles', 'stickers/bubbles', '77.png', 0, 1),
(357, 'bubbles', 'stickers/bubbles', '78.png', 0, 1),
(358, 'bubbles', 'stickers/bubbles', '79.png', 0, 1),
(359, 'bubbles', 'stickers/bubbles', '8.png', 0, 1),
(360, 'bubbles', 'stickers/bubbles', '80.png', 0, 1),
(361, 'bubbles', 'stickers/bubbles', '81.png', 0, 1),
(362, 'bubbles', 'stickers/bubbles', '82.png', 0, 1),
(363, 'bubbles', 'stickers/bubbles', '83.png', 0, 1),
(364, 'bubbles', 'stickers/bubbles', '84.png', 0, 1),
(365, 'bubbles', 'stickers/bubbles', '85.png', 0, 1),
(366, 'bubbles', 'stickers/bubbles', '86.png', 0, 1),
(367, 'bubbles', 'stickers/bubbles', '87.png', 0, 1),
(368, 'bubbles', 'stickers/bubbles', '88.png', 0, 1),
(369, 'bubbles', 'stickers/bubbles', '89.png', 0, 1),
(370, 'bubbles', 'stickers/bubbles', '9.png', 0, 1),
(371, 'bubbles', 'stickers/bubbles', '90.png', 0, 1),
(372, 'bubbles', 'stickers/bubbles', '91.png', 0, 1),
(373, 'bubbles', 'stickers/bubbles', '92.png', 0, 1),
(374, 'bubbles', 'stickers/bubbles', '93.png', 0, 1),
(375, 'bubbles', 'stickers/bubbles', '94.png', 0, 1),
(376, 'bubbles', 'stickers/bubbles', '95.png', 0, 1),
(377, 'bubbles', 'stickers/bubbles', '96.png', 0, 1),
(378, 'bubbles', 'stickers/bubbles', '97.png', 0, 1),
(379, 'bubbles', 'stickers/bubbles', '98.png', 0, 1),
(380, 'bubbles', 'stickers/bubbles', '99.png', 0, 1),
(391, 'animals', 'stickers/animals', 'pONtrgZoFk.png', 0, 1),
(392, 'animals', 'stickers/animals', '9zac9nzPQl.png', 0, 1),
(393, 'animals', 'stickers/animals', 'xZYqLCm4J1.png', 0, 1),
(394, 'animals', 'stickers/animals', 'yfKfRcZRTi.png', 0, 1),
(395, 'animals', 'stickers/animals', '69na2n7SsE.png', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inner_account`
--

CREATE TABLE `inner_account` (
  `id` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_companyname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_street_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_street_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_companyname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_street_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_street_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inner_account`
--

INSERT INTO `inner_account` (`id`, `firstname`, `lastname`, `billing_firstname`, `billing_lastname`, `billing_companyname`, `billing_country`, `billing_street_1`, `billing_street_2`, `billing_city`, `billing_state`, `billing_zip`, `billing_phone`, `billing_email`, `shipping_firstname`, `shipping_lastname`, `shipping_companyname`, `shipping_country`, `shipping_street_1`, `shipping_street_2`, `shipping_city`, `shipping_state`, `shipping_zip`, `shipping_phone`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '', '', 'tesdddd', '1', '123', '123', '123333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333', '123', '123', '434343', '456464trte', '1234343434344444444444444444444444444444444444444444444444444444444444', '4343343aa@aaa.com', '123', '123', '123', '123', '123', '123', '123', '123', '123', '123', 2, '2017-10-12 02:59:53', '2017-10-16 17:32:46'),
(2, '', '', 'aksh', 'mishra', 'softthink technology', 'BAHRAIN', '99', 'fyffyfytfty', 'indore', 'madhya pradesh', '452010', '9977885566', 'aksh@gmail.com', 'aks', 'mishra', 'softthink technology', 'BAHAMAS', '99', 'skkff', 'indore', 'madhya pradesh', '452010', '9977885566', 13, '2017-12-22 06:38:17', '2017-12-23 06:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'favorite', '2018-01-10 13:18:44', '2018-01-10 13:18:44'),
(2, 'trashed', '2018-01-10 13:18:44', '2018-01-10 13:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_04_127_156842_create_users_oauth_table', 1),
('2015_04_13_140047_create_photo_models_table', 1),
('2015_04_18_134312_create_folders_table', 1),
('2015_04_28_152847_create_activity_table', 1),
('2015_05_05_131439_create_labels_table', 1),
('2015_05_05_131450_create_photos_labels_table', 1),
('2015_05_29_131549_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `share_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attach_id` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `serialized_editor_state` mediumtext COLLATE utf8_unicode_ci,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `approve_status` int(11) NOT NULL DEFAULT '0',
  `denial_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `name`, `description`, `file_name`, `share_id`, `attach_id`, `file_size`, `user_id`, `folder_id`, `serialized_editor_state`, `width`, `height`, `price`, `password`, `created_at`, `updated_at`, `deleted_at`, `approve_status`, `denial_reason`) VALUES
(1, 'Art', NULL, 'K6Tsdd3IDZUAYxB4.png', 'Mai00l2KqyBsJtEj', NULL, 23762, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":5414,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/1/original.K6Tsdd3IDZUAYxB4.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":1390.46,\"top\":440.61,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":7.66,\"scaleY\":7.66,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/15.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 5414, 0, NULL, '2018-02-25 09:37:12', '2018-02-25 09:40:18', NULL, 0, ''),
(2, 'choclatey chai', NULL, 'rrALsJhRI9gmwNRk.png', 'FAn6niwVjdoCzHfN', NULL, 21527, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":5414,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/2/original.rrALsJhRI9gmwNRk.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":278.75,\"top\":1574.49,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":2.96,\"scaleY\":2.96,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/15.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":2684.18,\"top\":1672.8,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":5.32,\"scaleY\":5.32,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/21.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"#ead6d6\",\"customActions\":{}}', 7200, 5414, 0, NULL, '2018-02-26 04:13:26', '2018-02-26 04:45:42', NULL, 0, ''),
(3, 'Untitled Artwork', NULL, 'AuV7SaLXbNHcnecx.png', 'aRtpSfMIRSDNk9Yi', NULL, 165365, 21, 26, NULL, 7200, 5414, 0, NULL, '2018-02-27 01:12:08', '2018-02-27 05:23:43', '2018-02-27 05:23:43', 0, ''),
(4, 'Untitled Artwork', NULL, 'ZdENv8DRkXDN58C1.png', 'BlNUDslalhsWS43u', NULL, 179161, 21, 26, NULL, 5760, 7200, 0, NULL, '2018-02-27 03:18:29', '2018-02-27 05:23:40', '2018-02-27 05:23:40', 0, ''),
(5, 'Pizza Party', NULL, 'zP2f12Xm9gYGvfrX.png', '2FJYDSsP10pBSN2m', NULL, 40256, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":4896,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/5/original.zP2f12Xm9gYGvfrX.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":710,\"top\":1533.61,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":4.85,\"scaleY\":4.85,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/23.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":3622.52,\"top\":1965.61,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":3.49,\"scaleY\":3.49,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/12.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 4896, 0, NULL, '2018-02-27 04:02:37', '2018-02-27 08:11:36', NULL, 1, ''),
(6, 'Untitled Artwork', NULL, 'a79Gbyrh4TegbYk6.png', '0Ok5GfxnPKunfwnE', NULL, 23127, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":4896,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/6/original.a79Gbyrh4TegbYk6.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":1829.48,\"top\":1417.48,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":5.26,\"scaleY\":5.26,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/18.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 4896, 0, NULL, '2018-02-27 04:21:34', '2018-02-27 04:23:04', NULL, 0, ''),
(7, 'Untitled Artwork', NULL, 'bIONoz6njjZwgMOP.png', 'M0adhsekB03QptbO', NULL, 40737, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":5414,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/7/original.bIONoz6njjZwgMOP.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":671.29,\"top\":1005.05,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":10.88,\"scaleY\":7.33,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/19.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 5414, 0, NULL, '2018-02-27 04:48:11', '2018-02-27 04:51:09', NULL, 0, ''),
(14, 'new', NULL, 'l7LNWkesZ2gsUfKY.png', 'xq48JtEo4X4w0yJS', NULL, 165365, 21, 26, NULL, 7200, 5414, 0, NULL, '2018-02-27 05:24:35', '2018-02-27 05:24:53', '2018-02-27 05:24:53', 21, ''),
(13, 'Untitled Artwork', NULL, 'zxB8tSQkRuWxGs0y.png', 'rJG1IF87qYQICgkM', NULL, 37072, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":5414,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/13/original.zxB8tSQkRuWxGs0y.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":773.89,\"top\":349.29,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":10.4,\"scaleY\":9.53,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/40.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 5414, 0, NULL, '2018-02-27 05:14:21', '2018-02-27 05:17:58', NULL, 21, ''),
(15, 'Untitled Artwork', NULL, 'FeeCL9ptrfI97JZI.png', 'Gvqg0YDa5UgpoCM9', NULL, 24814, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":4896,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/15/original.FeeCL9ptrfI97JZI.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":4370.39,\"top\":4246.39,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":27.2,\"scaleY\":27.2,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/15.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":1750.52,\"top\":437.35,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":7.08,\"scaleY\":7.08,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/15.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 4896, 0, NULL, '2018-02-27 05:33:23', '2018-02-27 05:34:38', NULL, 21, ''),
(16, 'Untitled Artwork', NULL, 'rbYpdcO0pmzR8mXD.png', 'Izp7p68KutCdHTUZ', NULL, 149545, 21, 26, NULL, 7200, 4896, 0, NULL, '2018-02-27 05:36:40', '2018-02-27 05:51:19', '2018-02-27 05:51:19', 21, ''),
(17, 'Untitled Artwork', NULL, 'MgLut2wIrisKFLa7.png', 'uf0IYu8yBgifBulM', NULL, 149545, 21, 26, NULL, 7200, 4896, 0, NULL, '2018-02-27 05:50:17', '2018-02-27 05:51:13', '2018-02-27 05:51:13', 21, ''),
(18, 'new', NULL, '5CbTlpTm8LSM8ZjI.png', 'bnEzTFIziuYxfPhZ', NULL, 165365, 21, 26, NULL, 7200, 5414, 0, NULL, '2018-02-27 05:58:48', '2018-02-27 06:02:08', '2018-02-27 06:02:08', 21, ''),
(19, 'new1', NULL, 'Helfcxt77y1I9Rey.png', '4cmxW6XdV7n4vbdK', NULL, 165365, 21, 26, NULL, 7200, 5414, 30, NULL, '2018-02-27 06:02:22', '2018-02-27 06:06:12', '2018-02-27 06:06:12', 21, ''),
(20, 'a', NULL, 'kwXNOmKDzTvPqFQz.png', 'Ruo8lHC0HD6vmQkG', NULL, 165365, 21, 26, NULL, 7200, 5414, 20, NULL, '2018-02-27 06:06:26', '2018-02-27 06:09:31', '2018-02-27 06:09:31', 21, ''),
(21, 'e', NULL, 'ZCRqpBxzwrV6BKJl.png', 'jd7unruuaHT33upD', NULL, 31275, 21, 26, '{\"objects\":[{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":0,\"top\":0,\"width\":7200,\"height\":4896,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":false,\"name\":\"BottomLayer\",\"src\":\"http://localhost/innerartist/innerartist/uploads/21/21/original.ZCRqpBxzwrV6BKJl.png\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"},{\"type\":\"image\",\"originX\":\"left\",\"originY\":\"top\",\"left\":1546.13,\"top\":548.84,\"width\":512,\"height\":512,\"fill\":\"rgb(0,0,0)\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeLineJoin\":\"miter\",\"strokeMiterLimit\":10,\"scaleX\":7.21,\"scaleY\":7.21,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"clipTo\":null,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"globalCompositeOperation\":\"source-over\",\"selectable\":true,\"name\":\"sticker\",\"src\":\"http://localhost/innerartist/innerartist/assets/images/stickers/doodles/43.svg\",\"filters\":[],\"crossOrigin\":\"\",\"alignX\":\"none\",\"alignY\":\"none\",\"meetOrSlice\":\"meet\"}],\"background\":\"\",\"customActions\":{}}', 7200, 4896, 50, NULL, '2018-02-27 06:07:15', '2018-02-27 06:41:37', NULL, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `photos_labels`
--

CREATE TABLE `photos_labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'homeTagline', 'Inner Artist. Changing the way art is created.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'homeByline', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'homeButtonText', 'Register Now', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'homepage', 'landing', '0000-00-00 00:00:00', '2018-02-17 03:52:01'),
(5, 'validExtensions', 'jpg, jpeg, png, gif', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'maxFileSize', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'maxUserSpace', '41943040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'enableRegistration', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'siteName', 'Inner Artist', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'enableHomeUpload', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'maxSimultUploads', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'enablePushState', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'dateLocale', 'en', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'pushStateRootUrl', '/', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'disqusShortname', 'pixie', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_vendor` int(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `avatar_url`, `gender`, `permissions`, `email`, `password`, `address`, `is_vendor`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Development', NULL, NULL, NULL, NULL, '{\"admin\":1}', 'admin@gmail.com', '$2y$10$YbziGvNtF6/4cxQjV1kqSeQABGdUdPG5I/SJ6OdKCxkkjnVI8e/DW', '', 0, 'o21yMYQKSllzxrGBkJfczdgG1U7nQ7kFnQqcOoqS02f3lieLhLDGvPCGpPiK', '2018-01-09 10:23:29', '2018-02-28 04:07:33'),
(21, 'test@gmail.com', 'test', 'user', NULL, 'female', NULL, 'test@gmail.com', '$2y$10$9.vqKrTFoclXl7jsYyXBIuZgoSbC87ZSa9DEob8tc.R7bD//dooyq', '', 1, 'NWeTOuPDfsJfexvjdKaR5IpaPm7MiwCpGACDNZ8MHPXXj81sgYqpkDiIHNBX', '2018-02-25 09:31:33', '2018-02-28 03:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `users_oauth`
--

CREATE TABLE `users_oauth` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inner_account_user_id_foreign` (`user_id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_user_id_index` (`user_id`);

--
-- Indexes for table `dp_activity`
--
ALTER TABLE `dp_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_user_id_index` (`user_id`);

--
-- Indexes for table `dp_art_cart`
--
ALTER TABLE `dp_art_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_billing_addresses`
--
ALTER TABLE `dp_billing_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cwa_user_billing_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `dp_blog_post`
--
ALTER TABLE `dp_blog_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_cart`
--
ALTER TABLE `dp_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_category`
--
ALTER TABLE `dp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_contact_us`
--
ALTER TABLE `dp_contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_favourite`
--
ALTER TABLE `dp_favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_folders`
--
ALTER TABLE `dp_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folders_user_id_index` (`user_id`),
  ADD KEY `folders_share_id_index` (`share_id`);

--
-- Indexes for table `dp_labels`
--
ALTER TABLE `dp_labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `labels_name_unique` (`name`);

--
-- Indexes for table `dp_orders`
--
ALTER TABLE `dp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_password_resets`
--
ALTER TABLE `dp_password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `dp_photos`
--
ALTER TABLE `dp_photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `photos_attach_id_unique` (`attach_id`),
  ADD KEY `photos_user_id_index` (`user_id`),
  ADD KEY `photos_share_id_index` (`share_id`),
  ADD KEY `photos_attach_id_index` (`attach_id`);

--
-- Indexes for table `dp_photos_labels`
--
ALTER TABLE `dp_photos_labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `photos_labels_photo_id_label_id_unique` (`photo_id`,`label_id`),
  ADD KEY `photos_labels_photo_id_index` (`photo_id`),
  ADD KEY `photos_labels_label_id_index` (`label_id`);

--
-- Indexes for table `dp_products`
--
ALTER TABLE `dp_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_promo_code`
--
ALTER TABLE `dp_promo_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_seller_setting`
--
ALTER TABLE `dp_seller_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_settings`
--
ALTER TABLE `dp_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `dp_shippping_addresses`
--
ALTER TABLE `dp_shippping_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cwa_user_shippping_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `dp_users`
--
ALTER TABLE `dp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `dp_users_oauth`
--
ALTER TABLE `dp_users_oauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_oauth_user_id_service_unique` (`user_id`,`service`),
  ADD UNIQUE KEY `users_oauth_token_unique` (`token`),
  ADD KEY `users_oauth_user_id_index` (`user_id`);

--
-- Indexes for table `dp_vendor`
--
ALTER TABLE `dp_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_vendor_payment`
--
ALTER TABLE `dp_vendor_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folders_user_id_index` (`user_id`),
  ADD KEY `folders_share_id_index` (`share_id`);

--
-- Indexes for table `image_sticker`
--
ALTER TABLE `image_sticker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inner_account`
--
ALTER TABLE `inner_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inner_account_user_id_foreign` (`user_id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `labels_name_unique` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `photos_attach_id_unique` (`attach_id`),
  ADD KEY `photos_user_id_index` (`user_id`),
  ADD KEY `photos_share_id_index` (`share_id`),
  ADD KEY `photos_attach_id_index` (`attach_id`);

--
-- Indexes for table `photos_labels`
--
ALTER TABLE `photos_labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `photos_labels_photo_id_label_id_unique` (`photo_id`,`label_id`),
  ADD KEY `photos_labels_photo_id_index` (`photo_id`),
  ADD KEY `photos_labels_label_id_index` (`label_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_oauth`
--
ALTER TABLE `users_oauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_oauth_user_id_service_unique` (`user_id`,`service`),
  ADD UNIQUE KEY `users_oauth_token_unique` (`token`),
  ADD KEY `users_oauth_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `dp_activity`
--
ALTER TABLE `dp_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dp_art_cart`
--
ALTER TABLE `dp_art_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `dp_billing_addresses`
--
ALTER TABLE `dp_billing_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dp_blog_post`
--
ALTER TABLE `dp_blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dp_cart`
--
ALTER TABLE `dp_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dp_category`
--
ALTER TABLE `dp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dp_contact_us`
--
ALTER TABLE `dp_contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dp_favourite`
--
ALTER TABLE `dp_favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dp_folders`
--
ALTER TABLE `dp_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dp_labels`
--
ALTER TABLE `dp_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dp_orders`
--
ALTER TABLE `dp_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `dp_photos`
--
ALTER TABLE `dp_photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dp_photos_labels`
--
ALTER TABLE `dp_photos_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dp_products`
--
ALTER TABLE `dp_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dp_promo_code`
--
ALTER TABLE `dp_promo_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dp_seller_setting`
--
ALTER TABLE `dp_seller_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dp_settings`
--
ALTER TABLE `dp_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `dp_shippping_addresses`
--
ALTER TABLE `dp_shippping_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dp_users`
--
ALTER TABLE `dp_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dp_users_oauth`
--
ALTER TABLE `dp_users_oauth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dp_vendor`
--
ALTER TABLE `dp_vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `dp_vendor_payment`
--
ALTER TABLE `dp_vendor_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `image_sticker`
--
ALTER TABLE `image_sticker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;
--
-- AUTO_INCREMENT for table `inner_account`
--
ALTER TABLE `inner_account`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `photos_labels`
--
ALTER TABLE `photos_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users_oauth`
--
ALTER TABLE `users_oauth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
