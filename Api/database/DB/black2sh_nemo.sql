-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 11, 2021 at 09:59 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `black2sh_nemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_position` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `cat_position`, `name`, `value`) VALUES
(1, 2, 3, NULL, '2', 'Cover', '[\"Large\",\"77\",\"HJ\",\"KK\"]'),
(2, 2, 3, NULL, '2', 'Photo', '[]'),
(4, 2, 2, 2, '3', 'RAM', '[\"2GB\",\"4GB\",\"8GB\",\"12GB\"]'),
(10, 2, 2, 2, '3', 'Storage', '[\"4GB\",\"6GB\",\"8GB\",\"12GB\",\"16GB\"]'),
(11, 2, 2, 2, '3', 'Model', '[]'),
(13, 2, 2, 3, '3', 'Ram', '[\"4GB\",\"8GB\",\"12GB\"]'),
(14, 1, 4, NULL, '2', 'Size', '[\"7\",\"8\",\"9\",\"12\"]'),
(15, 11, NULL, NULL, '1', 'Ram', '[\"4GB\",\"8GB\"]'),
(16, 11, NULL, NULL, '1', 'Storage', '[\"32GB\",\"64GB\"]'),
(17, 5, 27, NULL, '2', 'kg', '[\".5\",\"1\"]');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_bd`, `banner`, `icon`, `serial`, `slug`) VALUES
(18, ' Clothing ', ' Clothing ', 'upload/product/category/banner/ody5ntcxnje1mzk4ota4.jpeg', 'upload/product/category/icon/otmwnjaxnje1mzk4ota5.jpeg', NULL, '-clothing--njgz'),
(19, 'WOMEN', 'WOMEN', 'upload/product/category/banner/mzm5nzixnje1mzk5mjm5.jpeg', 'upload/product/category/icon/odu5odaxnje1mzk5mjm5.jpeg', NULL, 'women-nju0'),
(20, 'LIFE STYLE', 'LIFE STYLE', 'upload/product/category/banner/otk3mtcxnje1mzk5mjkw.jpeg', 'upload/product/category/icon/nzaymtixnje1mzk5mjkw.jpeg', NULL, 'life-style-njg1'),
(21, 'BEAUTY', 'BEAUTY', 'upload/product/category/banner/otg1njuxnje1mzk5mziy.jpeg', 'upload/product/category/icon/mjaynzkxnje1mzk5mziy.jpeg', NULL, 'beauty-mzmx'),
(22, 'BRANDS', 'BRANDS', 'upload/product/category/banner/nte0ntcxnje1mzk5mzcw.jpeg', 'upload/product/category/icon/ndizotmxnje1mzk5mzcw.jpeg', NULL, 'brands-mte0'),
(23, 'SPORTS', 'SPORTS', 'upload/product/category/banner/ndawnjcxnje1mzk5mzk4.jpeg', 'upload/product/category/icon/mji3mdqxnje1mzk5mzk4.jpeg', NULL, 'sports-otkz'),
(24, 'JEWELLERY', 'JEWELLERY', 'upload/product/category/banner/mtizntexnje1mzk5ndmx.jpeg', 'upload/product/category/icon/mje0mdyxnje1mzk5ndmx.jpeg', NULL, 'jewellery-mtuz'),
(25, 'FESTIVA', 'FESTIVA', 'upload/product/category/banner/ndc0njuxnje1mzk5ndgw.jpeg', 'upload/product/category/icon/otc4nzqxnje1mzk5ndgx.jpeg', NULL, 'festiva-otqz');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`) VALUES
(3, 'Red', '547657'),
(4, 'Black', '333333'),
(5, 'Gold', '#33333');

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `percent_off` int(11) NOT NULL DEFAULT '1',
  `min_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_variations`
--

INSERT INTO `discount_variations` (`id`, `product_id`, `percent_off`, `min_qty`) VALUES
(1, 1, 5, 15),
(2, 1, 10, 20),
(3, 1, 20, 30),
(4, 1, 35, 100),
(5, 2, 10, 5),
(6, 2, 20, 50),
(7, 3, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `expired_date` date DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `banner`, `expired`, `expired_date`, `slug`, `status`) VALUES
(5, 'ttt', 'upload/marketing/deal/mza5njyxnje1mzkwote1.jpeg', 2, NULL, 'ttt-odc2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `discount_value` double(8,2) NOT NULL DEFAULT '1.00',
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footers`
--

CREATE TABLE `footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chromium Co , 25 Silicon Road, London D04 89GR',
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+2734662455-198',
  `email` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'example@example.com',
  `working` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Mon-Fri 8:00 to 19:00',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Lorem ipsum dolor sit amet, consecrated advising elite, sed do emus tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.',
  `copyright` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '© 2020 Bongo Bazar All Rights reserved',
  `social` tinyint(1) NOT NULL DEFAULT '0',
  `facebook` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `address`, `phone`, `email`, `working`, `description`, `copyright`, `social`, `facebook`, `twitter`, `youtube`, `insta`) VALUES
(1, 'Chromium Co , 25 Silicon Road, London D04 89GR', '+2734662455-198', 'example@example.com', 'Mon-Fri 8:00 to 19:00', '', '<p>© 2021 Loyel All Rights reserved team</p>', 1, 'https://www.facebook.com/loyel/', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `generals`
--

CREATE TABLE `generals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bongo Bazar',
  `app_name_bd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'বঙ্গ বাজার',
  `logo_white` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/setup/logo_white.png',
  `logo_black` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/setup/logo_black.png',
  `site_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Active, 1=Maintenance',
  `maintenance_date` datetime DEFAULT NULL,
  `bangla_language` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Inactive, 1=Active',
  `default_language` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=English, 2=Bangla',
  `favicon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/setup/logo_black.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `app_name`, `app_name_bd`, `logo_white`, `logo_black`, `site_url`, `maintenance_mode`, `maintenance_date`, `bangla_language`, `default_language`, `favicon`) VALUES
(1, 'Loyel', 'বঙ্গ বাজার', 'upload/general/ndkwntcxnje1mdyzmze5.png', 'upload/general/ndg2ntkxnje1mdyzmze5.png', NULL, 0, NULL, 1, 1, 'image/setup/logo_black.png');

-- --------------------------------------------------------

--
-- Table structure for table `home_setups`
--

CREATE TABLE `home_setups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home_slider` text COLLATE utf8mb4_unicode_ci,
  `top_brand` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Hide, 1=Show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_setups`
--

INSERT INTO `home_setups` (`id`, `home_slider`, `top_brand`) VALUES
(1, '[\"upload\\/home\\/slider\\/njewnzaxnje0mdewodez.jpeg\",\"upload\\/home\\/slider\\/odq4oduxnje0mdewodez.jpeg\",\"upload\\/home\\/slider\\/odiyntmxnje0mdewodez.jpeg\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_02_16_074741_create_users_table', 1),
(2, '2021_02_16_121633_create_generals_table', 2),
(6, '2021_02_17_191202_create_regions_table', 3),
(7, '2021_02_17_191257_create_cities_table', 3),
(8, '2021_02_17_191309_create_areas_table', 3),
(9, '2021_02_17_200111_create_brands_table', 4),
(10, '2021_02_17_200130_create_categories_table', 4),
(11, '2021_02_17_200147_create_sub_categories_table', 4),
(12, '2021_02_17_200157_create_sub_sub_categories_table', 4),
(14, '2021_02_18_085856_create_units_table', 5),
(15, '2021_02_18_085908_create_colors_table', 5),
(18, '2021_02_18_085804_create_attributes_table', 6),
(21, '2021_02_22_082638_create_product_stocks_table', 7),
(22, '2021_02_22_082658_create_price_variations_table', 7),
(23, '2021_02_22_082714_create_discount_variations_table', 7),
(24, '2021_02_22_160528_create_home_setups_table', 8),
(25, '2021_02_22_215847_create_subscribers_table', 9),
(28, '2021_02_22_074121_create_products_table', 10),
(29, '2021_02_24_065335_create_flash_deals_table', 11),
(30, '2021_02_24_065622_create_flash_deal_products_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms_condition` longtext COLLATE utf8mb4_unicode_ci,
  `privacy` longtext COLLATE utf8mb4_unicode_ci,
  `about_us` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `terms_condition`, `privacy`, `about_us`) VALUES
(1, '<h1><br></h1>', '<h1><br></h1>', '<h1 class=\"ql-align-center\"><br></h1>');

-- --------------------------------------------------------

--
-- Table structure for table `price_variations`
--

CREATE TABLE `price_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '1.00',
  `min_qty` int(11) NOT NULL DEFAULT '1',
  `max_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_position` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `Refundable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=True, 2=False',
  `weight` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8mb4_unicode_ci,
  `dimension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=New, 2=Used',
  `attribute` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `attribute_option` mediumtext COLLATE utf8mb4_unicode_ci,
  `photos` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `color_image` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `color` mediumtext COLLATE utf8mb4_unicode_ci,
  `qty_manage` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `min_qty` int(11) NOT NULL DEFAULT '1',
  `max_qty` int(11) NOT NULL DEFAULT '1',
  `price_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Simple Product, 2=Variable Product, 3=Volume tier Pricing',
  `stock_manage` tinyint(1) NOT NULL DEFAULT '2' COMMENT '2=Yes, 1=No',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` double(8,2) NOT NULL DEFAULT '1.00',
  `discount` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `discount_value` double(8,2) NOT NULL DEFAULT '1.00',
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Percent',
  `discount_method` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Simple, 2=Variation',
  `warranty_type` tinyint(1) NOT NULL DEFAULT '0',
  `warranty_period` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=Cost, 2=Free',
  `shipping_cost` double(8,2) NOT NULL DEFAULT '1.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT '1.00',
  `qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`) VALUES
(1, 'nayem@gmail.com'),
(2, 'Barry5@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `serial` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `name_bd`, `category_id`, `serial`, `slug`) VALUES
(81, 'CLOTHING', 'CLOTHING', 19, NULL, 'clothing-odky'),
(82, 'fashion', 'fashion', 19, NULL, 'fashion-mje5'),
(83, 'beauty products', 'beauty products', 19, NULL, 'beauty-products-mtk0'),
(84, 'home & kitchen', 'home & kitchen', 19, NULL, 'home--kitchen-mtq1'),
(85, 'books & movies', 'books & movies', 19, NULL, 'books--movies-mtg0'),
(86, 'baby products', 'baby products', 19, NULL, 'baby-products-nje0');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bd` varchar(199) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `name`, `name_bd`, `category_id`, `subcategory_id`, `slug`, `serial`) VALUES
(251, 'toys & games', 'toys & games', 19, 86, 'toys--games-mtk3', NULL),
(252, 'baby products', 'baby products', 19, 86, 'baby-products-odg0', NULL),
(253, 'kids fashion', 'kids fashion', 19, 86, 'kids-fashion-nzg2', NULL),
(254, 'toy gifting store', 'toy gifting store', 19, 86, 'toy-gifting-store-mze2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'KG'),
(4, 'Piece'),
(5, 'ml'),
(6, 'gm'),
(7, 'pkt'),
(8, 'Bundle');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Normal User, 1=Admin',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=URl generate, 1=Full url',
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/user/user.png',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Block',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `is_admin`, `name`, `photo_type`, `photo`, `username`, `email`, `mobile`, `permission_id`, `password`, `birthday`, `gender`, `status`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 1, 'image/user/user.png', NULL, 'admin@gmail.com', NULL, NULL, '$2y$10$BIAz6cE15ZJ6GzXIwYGBD.kVsDAd01rtMoWFxmQTyk2QqpHFCJD3a', NULL, NULL, 1, NULL, '2021-02-16 08:16:46', '2021-02-16 08:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_verifications`
--

CREATE TABLE `user_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Unverified, 1=verified',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_region_id_foreign` (`region_id`),
  ADD KEY `areas_city_id_foreign` (`city_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attributes_category_id_foreign` (`category_id`),
  ADD KEY `attributes_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `attributes_sub_subcategory_id_foreign` (`sub_subcategory_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_region_id_foreign` (`region_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colors_name_unique` (`name`),
  ADD UNIQUE KEY `colors_code_unique` (`code`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_deal_products_flash_deal_id_foreign` (`flash_deal_id`),
  ADD KEY `flash_deal_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `footers`
--
ALTER TABLE `footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generals`
--
ALTER TABLE `generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_setups`
--
ALTER TABLE `home_setups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_variations`
--
ALTER TABLE `price_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `products_sub_subcategory_id_foreign` (`sub_subcategory_id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_verifications`
--
ALTER TABLE `user_verifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discount_variations`
--
ALTER TABLE `discount_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footers`
--
ALTER TABLE `footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `generals`
--
ALTER TABLE `generals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_setups`
--
ALTER TABLE `home_setups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `price_variations`
--
ALTER TABLE `price_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_verifications`
--
ALTER TABLE `user_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD CONSTRAINT `flash_deal_products_flash_deal_id_foreign` FOREIGN KEY (`flash_deal_id`) REFERENCES `flash_deals` (`id`),
  ADD CONSTRAINT `flash_deal_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_sub_subcategory_id_foreign` FOREIGN KEY (`sub_subcategory_id`) REFERENCES `sub_sub_categories` (`id`),
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_categories` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
