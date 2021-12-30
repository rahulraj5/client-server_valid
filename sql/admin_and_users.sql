-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2021 at 06:36 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indocliq`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `txn_password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `image` int(11) NOT NULL,
  `wallet_amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `txn_password`, `first_name`, `last_name`, `image`, `wallet_amount`, `status`, `create_date`, `modify_date`) VALUES
(1, 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'admin', 0, 410000, 1, '2019-03-12 00:00:00', '2021-08-19 12:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `area_id` int(11) NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_zipcode` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`area_id`, `area_name`, `area_zipcode`, `status`, `create_date`) VALUES
(1, 'Palacia', 452001, 1, '2019-10-23 12:01:35'),
(2, 'sdfdf', 452001, 3, '2019-10-23 12:04:07'),
(3, 'mahu nakka', 452001, 1, '2019-10-23 12:05:10'),
(4, 'futikoti', 452001, 1, '2019-10-23 12:34:31'),
(5, 'sindhi colony', 0, 1, '2020-07-20 17:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `brand_logo`
--

CREATE TABLE `brand_logo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(250) NOT NULL,
  `staus` tinyint(4) NOT NULL DEFAULT '1',
  `create_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand_logo`
--

INSERT INTO `brand_logo` (`id`, `name`, `image`, `staus`, `create_date`) VALUES
(4, 'Ra', 'b1.jpg', 0, 2020),
(5, 'chanel', 'b2.jpg', 0, 2020),
(6, 'prada', 'b3.jpg', 0, 2020),
(7, 'lacosta', 'b4.jpg', 0, 2020),
(8, 'fendi', 'b5.jpg', 0, 2020),
(9, 'burberry', 'b6.jpg', 0, 2020),
(10, 'luice vitton', 'b7.jpg', 0, 2020),
(11, 'dada', 'b21.jpg', 0, 2020),
(12, 'abs', 'b11.jpg', 0, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_percentage` int(11) NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `parent_sub_category_id` int(11) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `category_name`, `category_percentage`, `parent_category_id`, `parent_sub_category_id`, `category_image`, `status`, `create_date`, `modify_date`) VALUES
(2, 'ELECTRONICS', 12, 0, 0, '4.png', 1, '2021-08-19 14:50:33', '2021-07-01 15:06:18'),
(3, 'MEN', 0, 0, 0, '1.jpg', 3, '2021-07-01 05:43:53', '2021-08-11 15:35:45'),
(6, 'WOMEN', 0, 0, 0, '10.jpg', 3, '2021-07-28 12:30:05', '2021-07-28 17:00:05'),
(222, 'TV', 0, 2, 1, '43.png', 1, '2021-08-19 15:00:28', '2021-08-19 18:30:28'),
(223, 'SPORTS', 1, 0, 0, '811.png', 1, '2021-08-19 20:26:08', '2021-08-19 23:56:08'),
(224, 'LUDO', 0, 223, 1, '111.jpg', 1, '2021-08-20 05:01:33', '2021-08-20 08:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `categories_percentage`
--

CREATE TABLE `categories_percentage` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `percentage` float NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_percentage`
--

INSERT INTO `categories_percentage` (`id`, `category`, `percentage`, `status`) VALUES
(1, 'Auto Accessories', 12, 0),
(2, 'Bags and Luggage', 6, 0),
(3, 'Beauty Products', 4, 0),
(4, 'Books (upto 1000)', 6, 0),
(5, 'Books (1000+)', 11, 0),
(6, 'Cameras', 4, 0),
(7, 'Camera lenses', 6, 0),
(8, 'Camera Accessories', 10.5, 0),
(9, 'Apparel (upto 500)', 11.5, 0),
(10, 'Apparel ( 500+)', 14.5, 0),
(11, 'Apparel Accessories', 14.5, 0),
(12, 'Apparel Innerwear', 10.5, 0),
(13, 'Computer & Electronic Accessories & components', 14.5, 0),
(14, 'Computer projector & presenter', 6, 0),
(15, 'Computers & laptop', 4, 0),
(16, 'Electronics', 6, 0),
(17, 'Extended Warrenty Service', 20, 0),
(18, 'Fashion Accessories', 18, 0),
(19, 'Decor', 20, 0),
(20, 'Fashion Jwellery', 25, 0),
(21, 'Fragrance', 11, 0),
(22, 'Furniture', 13, 0),
(23, 'Gaming', 12, 0),
(24, 'Gifts', 15, 0),
(25, 'Gold & Diamond Jwelley', 10, 0),
(26, 'Gold & Silver Coins', 5, 0),
(27, 'Grocery', 10, 0),
(28, 'Hard Drives', 10, 0),
(29, 'Health & Nutritions', 15, 0),
(30, 'Home and Kitchen', 18, 0),
(31, 'Home Appliances', 8, 0),
(32, 'Kids Apparel', 15, 0),
(33, 'Mobile & Tablets', 6, 0),
(34, 'Mobile Accessories', 22, 0),
(35, 'Moniters', 6, 0),
(36, 'Movies & Musics', 15, 0),
(37, 'Networking Communication', 6, 0),
(38, 'Pendrives & Memory Cards', 4, 0),
(39, 'Pet Supplies', 12, 0),
(40, 'Printers and Scanners', 6, 0),
(41, 'Footwear', 15, 0),
(42, 'Sports & Health', 17, 0),
(43, 'Toys', 12, 0),
(44, 'Watches', 22, 0),
(45, 'Women Ethnic Wear', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `common_setting`
--

CREATE TABLE `common_setting` (
  `id` int(11) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `common_setting`
--

INSERT INTO `common_setting` (`id`, `option_name`, `option_value`, `status`) VALUES
(1, 'backedn_login_background_image', 'parraback.jpg', 1),
(2, 'site_title', 'TEST ', 1),
(3, 'backlogo', 'Webp_net-resizeimage_(2)1.png', 1),
(4, 'front_logo', 'Webp_net-resizeimage_(2).png', 1),
(5, 'facebook_url', 'facebook.com', 1),
(6, 'linkedin_url', 'https://in.linkedin.com/', 1),
(7, 'instagram_url', 'https://www.facebook.com/', 1),
(8, 'twitter_url', 'https://www.facebook.com/', 1),
(11, 'email', 'admin@gmail.com', 1),
(12, 'address', '\r\nAddress\r\nPlot No. 91, Scheme No. 53, Ratnalok Colony,\r\nNear BSNL Office,\r\nVijay Nagar, Indore - 452010\r\nINDIA', 1),
(13, 'mobile_no', '09827641480', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `number`, `message`, `create_date`) VALUES
(13, 'des', 'as@ds.com', 798789797, 'sdfsdf', '0000-00-00 00:00:00'),
(14, 'dsf', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(15, 'dsf', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(16, 'dsf', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(17, 'dsf', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(18, 'dsf', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(19, 'dsf', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(20, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(21, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, 'dsf', '0000-00-00 00:00:00'),
(22, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, '', '0000-00-00 00:00:00'),
(23, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, '', '0000-00-00 00:00:00'),
(24, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, '', '0000-00-00 00:00:00'),
(25, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, ' bf', '0000-00-00 00:00:00'),
(26, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, ' bf', '0000-00-00 00:00:00'),
(27, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, ' bf', '0000-00-00 00:00:00'),
(28, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, '', '0000-00-00 00:00:00'),
(29, 'Imperfect', 'shruti.jain590@gmail.com', 2147483647, 'sdf', '0000-00-00 00:00:00'),
(30, 'shruti jain', 'shruti.jain590@gmail.com', 2147483647, 'sdf', '0000-00-00 00:00:00'),
(31, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, 'sdf', '0000-00-00 00:00:00'),
(32, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, 'sdf', '0000-00-00 00:00:00'),
(33, 'nirbhay gander', 'nirbhay.itspark@gmail.com', 2147483647, 'sdf', '0000-00-00 00:00:00'),
(34, 'nirbhay', 'nirbhay.espsofttech@gmail.com', 2147483647, 'dfg', '0000-00-00 00:00:00'),
(35, 'sdsd', 'sd', 0, 'sd', '0000-00-00 00:00:00'),
(36, 'wewewe', 'eas@sdfsd', 2147483647, 'sdsd', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_status`
--

CREATE TABLE `delivery_status` (
  `ds_id` int(11) NOT NULL,
  `delivery_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_status`
--

INSERT INTO `delivery_status` (`ds_id`, `delivery_status_name`) VALUES
(1, 'pending'),
(2, 'Accept by delivery boy'),
(3, 'Dispatch by shop'),
(4, 'completed'),
(5, 'cancel'),
(6, 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `id_proof_type`
--

CREATE TABLE `id_proof_type` (
  `id` int(11) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `option_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `id_proof_type`
--

INSERT INTO `id_proof_type` (`id`, `option_name`, `option_value`) VALUES
(1, 'adhar_card', 'adhar card'),
(2, 'pan_card', 'pan card'),
(3, 'voter_id', 'voter id'),
(4, 'driving_licence', 'driving licence');

-- --------------------------------------------------------

--
-- Table structure for table `login_otp`
--

CREATE TABLE `login_otp` (
  `id` int(11) NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `otp` varchar(8) NOT NULL,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_otp`
--

INSERT INTO `login_otp` (`id`, `mobile_no`, `otp`, `create_date`) VALUES
(1, '8962327488', '174644', '2020-08-21 13:18:53'),
(2, '7974419521', '813108', '2020-08-21 15:19:05'),
(3, '9424891320', '495530', '2020-07-20 06:53:07'),
(4, '9589163694', '471600', '2020-07-20 13:24:51'),
(5, '8770151892', '370042', '2020-07-24 12:53:40'),
(6, '7067585899', '166379', '2020-08-18 03:36:09'),
(7, '8463828662', '508212', '2020-08-18 03:46:28'),
(8, '8770722257', '462362', '2020-08-20 06:49:31'),
(9, '8770372358', '473166', '2020-08-24 07:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `multiple_address`
--

CREATE TABLE `multiple_address` (
  `add_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `multiple_address`
--

INSERT INTO `multiple_address` (`add_id`, `user_id`, `name`, `email`, `phone`, `address`, `zipcode`, `latitude`, `longitude`, `status`) VALUES
(1, 14, '', '', '', 'Chandani Chowk , New Delhi', 32131, 'f2113', '131', 1),
(2, 14, '', '', '', 'Teacher colony , indore', 4546511, '4654.464.', '4464.64', 0),
(8, 4, 'Nirbhay Nirbhay', 'ng@gmail.com', '78979879', 'indore', 452001, '22.87878787', '78.55555', 0),
(9, 4, ' Nirbhay', 'ng@gmail.com', '741258963', 'Ratlam', 741258, '7412589632', '741258963', 0),
(10, 16, '', '', '', 'teachers quarters iet davv khandwa road indore', 452001, '', '', 1),
(11, 16, '', '', '', '123 colony', 452020, '', '', 0),
(12, 4, 'Nirbhay', 'ng@gmail.com', '741258963', '155,vijay nagar indore', 452001, '456112222', '7878787878', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(20) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deliveryboy_id` int(11) NOT NULL,
  `shipping_address` text NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `shipping_charge` float NOT NULL,
  `grand_total` float NOT NULL,
  `delivery_status` int(11) NOT NULL,
  `coupon_discount` float NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `confirm_delivery_date` datetime NOT NULL,
  `deliveryboy_accept_date` datetime NOT NULL,
  `order_receive_otp` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prduct_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice_no`, `seller_id`, `user_id`, `deliveryboy_id`, `shipping_address`, `payment_type`, `payment_status`, `shipping_charge`, `grand_total`, `delivery_status`, `coupon_discount`, `coupon_code`, `create_date`, `confirm_delivery_date`, `deliveryboy_accept_date`, `order_receive_otp`, `status`, `modify_date`, `prduct_details`) VALUES
(1, 'INC2020I1', 4, 3, 3, '{\"name\":\"Nirbhay \",\"email\":\"nirbhay.espsofttech@gmail.com\",\"address\":\"155,vijay nagar indore, 155,vijay nagar indore\",\"postal_code\":\"452001\",\"phone\":\"452001\"}', 'cash_on_delivery', 'unpaid', 0, 900, 4, 0, '0000-00-00 00:00:00', '2020-01-09 04:20:36', '2020-02-25 08:21:06', '2020-02-25 08:19:11', '', 1, '2020-01-09 08:50:36', '[{\"id\":\"4\",\"name\":\"nirbhay gander\",\"color\":\"#F08080\",\"choice_0\":\"L\",\"quantity\":\"1\",\"main_image\":\"3914_1575635327.jpeg\",\"mrp_price\":\"1000.00\",\"price\":900,\"discount\":\"10\",\"discount_type\":\"1\",\"subtotal_price\":900,\"shop_id\":\"4\"}]'),
(2, 'INC2020I2', 4, 3, 3, '{\"name\":\"Nirbhay \",\"email\":\"nirbhay.espsofttech@gmail.com\",\"address\":\"155,vijay nagar indore, 155,vijay nagar indore\",\"postal_code\":\"452001\",\"phone\":\"452001\"}', 'cash_on_delivery', 'paid', 0, 900, 4, 0, '0000-00-00 00:00:00', '2020-07-09 06:47:34', '2020-07-09 06:47:34', '2020-07-09 06:47:13', '', 1, '2020-01-09 09:08:23', '[{\"id\":\"4\",\"name\":\"nirbhay gander\",\"color\":\"#F08080\",\"choice_0\":\"L\",\"quantity\":\"1\",\"main_image\":\"3914_1575635327.jpeg\",\"mrp_price\":\"1000.00\",\"price\":900,\"discount\":\"10\",\"discount_type\":\"1\",\"subtotal_price\":900,\"shop_id\":\"4\"}]'),
(26, 'INC2020I26', 10, 14, 0, '{\"name\":\"rahul solanki\",\"email\":\"rahul@gmail.com\",\"postal_code\":\"452001\",\"phone\":\"452001\",\"address\":\"indoree\",\"latitude\":\"\",\"longitude\":\"\"}', 'cash', 'unpaid', 0, 1.96, 1, 0, '0000-00-00 00:00:00', '2020-07-20 16:58:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, '2020-07-20 16:58:53', '[{\"id\":\"16\",\"name\":\"Asbash\",\"variations\":\"[]\",\"quantity\":\"1\",\"main_image\":\"17375_1592900607.jpg\",\"mrp_price\":\"2.00\",\"price\":1.96,\"discount\":\"2\",\"discount_type\":\"1\",\"discount_amount\":0.04,\"subtotal_price\":1.96,\"shop_id\":\"10\"}]'),
(33, 'INC2020I33', 12, 14, 0, '{\"name\":\"rahul solanki\",\"email\":\"rahul@gmail.com\",\"postal_code\":\"452001\",\"phone\":\"452001\",\"address\":\"indoree\",\"latitude\":\"\",\"longitude\":\"\"}', 'cash', 'unpaid', 0, 9.9, 1, 0, '0000-00-00 00:00:00', '2020-07-22 13:23:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, '2020-07-22 13:23:58', '[{\"id\":\"25\",\"name\":\"Almond\",\"variations\":\"[]\",\"quantity\":\"1\",\"main_image\":\"16379_1594017235.jpg\",\"mrp_price\":\"10.00\",\"price\":9.9,\"discount\":\"1\",\"discount_type\":\"1\",\"discount_amount\":0.1,\"subtotal_price\":9.9,\"shop_id\":\"12\"}]'),
(54, 'INC2020I54', 12, 14, 0, '{\"name\":\"rahul solanki\",\"email\":\"rahul@gmail.com\",\"postal_code\":\"452001\",\"phone\":\"452001\",\"address\":\"indore\",\"latitude\":\"\",\"longitude\":\"\"}', 'cash', 'unpaid', 0, 9.9, 1, 0, '', '2020-07-26 05:37:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1, '2020-07-26 05:37:19', '[{\"id\":\"25\",\"name\":\"Almond\",\"variations\":\"[]\",\"quantity\":\"1\",\"main_image\":\"16379_1594017235.jpg\",\"mrp_price\":\"10.00\",\"price\":9.9,\"discount\":\"1\",\"discount_type\":\"1\",\"discount_amount\":0.1,\"subtotal_price\":9.9,\"shop_id\":\"12\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_reg_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `shop_id` int(11) NOT NULL COMMENT 'it a shop user id',
  `categories_id` int(11) NOT NULL,
  `sub_categories_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float(10,2) NOT NULL,
  `discount` float NOT NULL,
  `discount_type` enum('1','2') COLLATE utf8_unicode_ci NOT NULL COMMENT '1="Percentage" 2="Flat"',
  `colors` text COLLATE utf8_unicode_ci NOT NULL,
  `choice_options` text COLLATE utf8_unicode_ci NOT NULL,
  `variations` text COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `return_policy` text COLLATE utf8_unicode_ci NOT NULL,
  `product_images` text COLLATE utf8_unicode_ci NOT NULL,
  `main_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num_of_sale` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1="active" 0="Deactive" 3="Delete"',
  `featured_status` int(11) NOT NULL,
  `clearance_status` int(11) NOT NULL COMMENT '1="Under Product Clearence"',
  `create_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
PARTITION BY HASH (product_id)
PARTITIONS 5;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_reg_id`, `shop_id`, `categories_id`, `sub_categories_id`, `name`, `description`, `quantity`, `unit_price`, `discount`, `discount_type`, `colors`, `choice_options`, `variations`, `unit`, `return_policy`, `product_images`, `main_image`, `tags`, `meta_title`, `meta_description`, `meta_image`, `num_of_sale`, `status`, `featured_status`, `clearance_status`, `create_date`) VALUES
(32, 'P0032', 65, 6, 90, 'THE PAJAMA FACTORY Womens OFFWHITE Printed Kurti with Elegent Palazzo', 'Care Instructions: Machine WashThis kurti comes with printed palazzofit: straight fit, 40length, 3/4 length sleevespalazzo pant: double elastic palazzo pant, flared palazzoThis kurti has front slit for your palazzo to flow as and when you walk.wash care: machine wash, hand wash. Do not bleach', 100, 1000.00, 900, '1', '[]', '[]', '[]', '', 'Care Instructions: Machine WashThis kurti comes with printed palazzofit: straight fit, 40length, 3/4 length sleevespalazzo pant: double elastic palazzo pant, flared palazzoThis kurti has front slit for your palazzo to flow as and when you walk.wash care: machine wash, hand wash. Do not bleach  ', '[]', '54741_1598266311.jpg', 'pajama', 'THE PAJAMA FACTORY Womens OFFWHITE Printed Kurti with Elegent Palazzo', 'THE PAJAMA FACTORY Womens OFFWHITE Printed Kurti with Elegent Palazzo', '89101_1598266311.jpg', 0, 0, 0, 0, '2020-08-24 10:51:51'),
(33, 'P0033', 5, 2, 222, 'SAMSUNG ', 'TV Set', 1, 10000.00, 2, '1', '[]', '[]', '[]', '', '  ', '[\"33430_1629379699.png\"]', '33430_1629379699.png', 'LED', 'samsug tv', 'samsug tv', '33430_1629379699.png', 0, 1, 1, 0, '2021-08-19 15:28:19'),
(34, 'P0034', 66, 223, 224, 'LUDO', 'Ludo', 1, 10.00, 1, '1', '[]', '[]', '[]', '', '  ', '[]', '18743_1629428551.jpg', 'ludo', 'ludo', 'ludo', '', 0, 1, 1, 0, '2021-08-20 05:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `productreviewrating`
--

CREATE TABLE `productreviewrating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `review` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productreviewrating`
--

INSERT INTO `productreviewrating` (`id`, `user_id`, `product_id`, `order_id`, `rating`, `title`, `review`, `create_date`, `status`) VALUES
(1, 1, 4, 11, 1, 'Excellent', 'I have purchased shirts from Minimalism a few times and am never disappointed. The quality is excellent and the shipping is amazing. It seems like it\'s at your front door the minute you get off your pc.\r\n', '2020-02-14 08:59:12', 1),
(2, 2, 4, 10, 3, 'Amazing', 'Minimalism is the online !', '2020-02-14 11:18:23', 1),
(3, 3, 4, 12, 4, 'Nicely', 'Unbeatable service and selection. This store has the best business model I have seen on the net. They are true to their word, and go the extra mile for their customers.', '2020-02-14 13:33:08', 1),
(4, 5, 4, 15, 4, 'Awesome', 'I felt like a purchasing partner more than a customer. You have a lifetime client in me.', '2020-03-17 14:05:10', 1),
(5, 6, 10, 21, 3, 'asad', 'asdasdasdasd asdasd', '2020-07-04 00:00:00', 1),
(6, 7, 10, 22, 1, 'asad', 'asdasdasdasd asdasd', '2020-07-04 00:00:00', 1),
(7, 4, 4, 15, 5, '', '', '2020-07-09 06:48:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shopreviewrating`
--

CREATE TABLE `shopreviewrating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `attachement` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shopreviewrating`
--

INSERT INTO `shopreviewrating` (`id`, `user_id`, `shop_id`, `order_id`, `rating`, `comment`, `attachement`, `create_date`, `status`) VALUES
(1, 4, 8, 11, 3, '', '', '2020-02-14 08:49:47', 1),
(2, 4, 8, 10, 4, '', '', '2020-02-14 11:18:30', 1),
(3, 4, 4, 12, 3, '', '', '2020-02-14 13:32:54', 1),
(4, 4, 4, 15, 3, '', '', '2020-03-17 14:04:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `shop_id` int(11) NOT NULL,
  `shop_reg_id` varchar(50) NOT NULL,
  `shop_registration_no` varchar(100) NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  `mobile_no` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `shop_logo` text NOT NULL,
  `shop_image_desktop` text NOT NULL,
  `shop_image_mobile` text NOT NULL,
  `gst_number` varchar(20) NOT NULL,
  `pan_no` varchar(15) NOT NULL,
  `adhar_no` varchar(15) NOT NULL,
  `pan_image` varchar(255) NOT NULL,
  `adhar_image` varchar(255) NOT NULL,
  `owner_image` text NOT NULL,
  `gumasta_image` varchar(255) NOT NULL,
  `shop_address` text NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `shop_pincode` int(11) NOT NULL,
  `shop_latitude` varchar(50) NOT NULL,
  `shop_longitude` varchar(100) NOT NULL,
  `shopping_categories` varchar(255) NOT NULL,
  `shopping_specialized` varchar(255) NOT NULL,
  `shop_type_id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `bank_acc_no` varchar(100) NOT NULL,
  `bank_ifsc_code` varchar(100) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `gst_image` varchar(255) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `cancel_check_image` varchar(255) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_sales` int(11) NOT NULL,
  `meta_tags` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `featured_status` tinyint(1) NOT NULL,
  `order_counts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shop_id`, `shop_reg_id`, `shop_registration_no`, `owner_name`, `mobile_no`, `email`, `password`, `shop_name`, `shop_logo`, `shop_image_desktop`, `shop_image_mobile`, `gst_number`, `pan_no`, `adhar_no`, `pan_image`, `adhar_image`, `owner_image`, `gumasta_image`, `shop_address`, `city_name`, `state_name`, `company`, `country`, `shop_pincode`, `shop_latitude`, `shop_longitude`, `shopping_categories`, `shopping_specialized`, `shop_type_id`, `bank_name`, `bank_acc_no`, `bank_ifsc_code`, `bank_branch`, `gst_image`, `account_holder_name`, `cancel_check_image`, `last_login`, `total_sales`, `meta_tags`, `create_date`, `modify_date`, `status`, `featured_status`, `order_counts`) VALUES
(1, 'MHJ0OMHLP', 'dsfdf', 'Rahul Solanki', 'OTgyNzY0MTQ4MA==', 'rahul@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'shop_so', 'l3.png', 'l31.png', 'l31.png', 'MTIzNDU2Nzg5NQ==', 'TkRnME5UUTFORFU', 'NTQ0NTY0NjQ2NDY', '', 'l3.png', 'l3.png', '', 'Indore Railway Station, Chhoti Gwaltoli, Indore, Madhya Pradesh, India', '', '', '', '', 0, '23.334169', '75.037636', 'Mens Tshirt,Jwellery', 'Mens Tshirt,Jwellery', 1, '', '', '', '', '', '', '', '2021-08-19 17:01:59', 0, '', '2019-11-06 07:16:44', '2019-11-06 11:46:44', 1, 1, 0),
(2, 'J2N5RST8', '123456', 'rahul', '7974419521', 'rahul.itspark@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'rahul', 'Your uploaded image file is blank.', '17375_1592900607.jpg', '17375_1592900607.jpg', 'MTIzNDU2Nzg5', 'VmpGamVFMUZOVmh', '', '', '', '17375_1592900607.jpg', '', 'Indore Railway Station, Chhoti Gwaltoli, Indore, Madhya Pradesh, India', '', '', '', '', 0, '22.71720790', '75.86841130', 'Jwellery,Gift,Kids', '', 1, 'sbi', '123456798', '123465', 'abcd', '', 'rahul', '', '2021-08-19 16:57:08', 0, '', '2020-06-19 17:53:57', '2020-06-19 10:53:57', 1, 0, 0),
(81, '07913394', '900647', 'asdasd', 'Nzg5NDU2MTIzMA==', 'asd@sdf', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-20 12:08:56', 0, '', '0000-00-00 00:00:00', '2021-08-20 12:08:56', 1, 0, 0),
(82, '54730351', '211114', 'raar', 'MTIzNDU2Nzg5MA==', 'sadf@d', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-20 12:10:42', 0, '', '0000-00-00 00:00:00', '2021-08-20 12:10:42', 1, 0, 0),
(83, '82556625', '024613', 'select', 'Nzk3NDQxOTUyMQ==', 'sdf@sdf', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-20 13:23:00', 0, '', '0000-00-00 00:00:00', '2021-08-20 13:23:00', 1, 0, 0),
(84, '60077537', '044358', 'aman', 'MTIzNDU2Nzg5OQ==', 'aman@gmail.conm', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-21 04:34:32', 0, '', '0000-00-00 00:00:00', '2021-08-21 04:34:32', 1, 0, 0),
(85, '14043322', '616921', 'varun', 'OTkyNzc3NDgwOQ==', 'varun@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-24 05:08:30', 0, '', '0000-00-00 00:00:00', '2021-08-24 05:08:30', 1, 0, 0),
(86, '63281963', '902848', 'chandan', 'OTgyNzMyOTY1NA==', 'chandan@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-24 05:34:22', 0, '', '0000-00-00 00:00:00', '2021-08-24 05:34:22', 1, 0, 0),
(87, '54359772', '604579', 'rahul', 'OTgyNzY0MTQ4MQ==', 'rahul@yahoo.com', '839d74fabe26787580102075d1d5fa08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-27 09:07:10', 0, '', '0000-00-00 00:00:00', '2021-08-27 09:07:10', 1, 0, 0),
(88, '39243530', '934770', 'ertgd', 'MzQ1MjM0MjM0NA==', 'zsddf@gmail.in', '839d74fabe26787580102075d1d5fa08', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '', '', '', '', '', '2021-08-27 10:08:38', 0, '', '0000-00-00 00:00:00', '2021-08-27 10:08:38', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_types`
--

CREATE TABLE `shop_types` (
  `shop_type_id` int(11) NOT NULL,
  `shop_type_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_types`
--

INSERT INTO `shop_types` (`shop_type_id`, `shop_type_name`) VALUES
(1, 'Individual'),
(2, 'Registerd Shop');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `reg_id` varchar(250) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `show_password` varchar(250) NOT NULL,
  `mobile_no` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `house_no` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `country_isd_code` int(11) NOT NULL DEFAULT '91',
  `zipcode` int(11) NOT NULL,
  `latitude` varchar(250) NOT NULL,
  `longitude` varchar(250) NOT NULL,
  `device_id` varchar(250) NOT NULL COMMENT '1="android" 2="ios"',
  `device_type` varchar(250) NOT NULL,
  `fcm_token` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0="Deactive" 1="Active" 3="Delete"',
  `create_date` datetime NOT NULL,
  `modify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `reg_id`, `first_name`, `last_name`, `email`, `password`, `show_password`, `mobile_no`, `image`, `house_no`, `address`, `country_isd_code`, `zipcode`, `latitude`, `longitude`, `device_id`, `device_type`, `fcm_token`, `status`, `create_date`, `modify_date`, `area_id`) VALUES
(4, 'M6GM9LLI', 'Rahul', 'Solanki', 'rahul@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '9827641480', 'imgpsh_fullsize_anim_(1).png', '', 'vijay nagar indore', 91, 452001, '22.71720790', '75.86841130', '', '', '', 1, '2019-10-29 14:06:33', '2019-10-29 13:06:33', 0),
(16, '66828168', '9827641480', '', '23423asd3#rwer', 'e10adc3949ba59abbe56e057f20f883e', '', 'asdas', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 16:07:52', 0),
(17, '39852775', 'rahulraj solanki', '', 'rahulraj@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '7974419521', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 17:51:31', 0),
(18, '04532810', 'vivek chouhan', '', 'vivek@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448090', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 17:54:54', 0),
(19, '00491856', 'ravi', '', 'ravi@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448091', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:02:36', 0),
(20, '20308565', 'ravi', '', 'ravi@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448092', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:04:28', 0),
(21, '36785273', 'rajatraj', '', 'rajat@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448094', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:07:35', 0),
(22, '23671419', 'boron', '', 'boron@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448095', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:09:49', 0),
(23, '18417456', 'fooler', '', 'fooler@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924480904', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:14:39', 0),
(24, '52041027', 'vikram', '', 'vikram@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924480907', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:24:36', 0),
(25, '31907237', 'gorav', '', 'gorav@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448099', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:31:39', 0),
(26, '61210039', 'tarun', '', 'tarun@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448097', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:39:51', 0),
(27, '91753757', 'rahuil', '', 'rasd@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9924448190', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:45:52', 0),
(28, '44784968', 'jagan', '', 'sdf@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '7568445612', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:50:43', 0),
(29, '53000979', 'huad', '', 'hasdfz@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9923338090', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-23 18:54:39', 0),
(30, '74732512', 'asdf', '', 'rajat@gmail.com', '839d74fabe26787580102075d1d5fa08', '', '9827641481', '', '', '', 91, 0, '', '', '', '', '', 1, '0000-00-00 00:00:00', '2021-08-27 10:14:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`area_id`);

--
-- Indexes for table `brand_logo`
--
ALTER TABLE `brand_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `categories_percentage`
--
ALTER TABLE `categories_percentage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `common_setting`
--
ALTER TABLE `common_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_status`
--
ALTER TABLE `delivery_status`
  ADD PRIMARY KEY (`ds_id`);

--
-- Indexes for table `id_proof_type`
--
ALTER TABLE `id_proof_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_otp`
--
ALTER TABLE `login_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiple_address`
--
ALTER TABLE `multiple_address`
  ADD PRIMARY KEY (`add_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_idx` (`product_id`);

--
-- Indexes for table `productreviewrating`
--
ALTER TABLE `productreviewrating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shopreviewrating`
--
ALTER TABLE `shopreviewrating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`shop_id`),
  ADD UNIQUE KEY `shop_registration_no` (`shop_registration_no`),
  ADD KEY `shop_idx` (`shop_id`);

--
-- Indexes for table `shop_types`
--
ALTER TABLE `shop_types`
  ADD PRIMARY KEY (`shop_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reg_id` (`reg_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `area_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brand_logo`
--
ALTER TABLE `brand_logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `categories_percentage`
--
ALTER TABLE `categories_percentage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `common_setting`
--
ALTER TABLE `common_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `delivery_status`
--
ALTER TABLE `delivery_status`
  MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `id_proof_type`
--
ALTER TABLE `id_proof_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login_otp`
--
ALTER TABLE `login_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `multiple_address`
--
ALTER TABLE `multiple_address`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `productreviewrating`
--
ALTER TABLE `productreviewrating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shopreviewrating`
--
ALTER TABLE `shopreviewrating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `shop_types`
--
ALTER TABLE `shop_types`
  MODIFY `shop_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
