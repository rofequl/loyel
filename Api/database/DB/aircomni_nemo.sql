-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2021 at 04:00 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loyel`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Home, 1=Office',
  `default_shipping` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Default shipping address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `full_name`, `phone_number`, `region_id`, `city_id`, `area_id`, `address`, `address_type`, `default_shipping`) VALUES
(7, 23, 'Nayem Islam', '+8801966634890', 2, 1, 2, 'asfas', 0, 1),
(8, 25, 'anwar', '+8801683550221', 2, 1, 2, 'cgf', 0, 1),
(9, 26, 'anu', '+8801683550221', 2, 1, 2, 'ghn', 0, 1),
(10, 28, 'hredoy', '+8801225254225', 2, 1, 1, 'tujdj', 0, 1),
(11, 28, 'Hredoy Hassan', '+8801864314126', 2, 2, 4, 'hemayetpur', 0, 0),
(12, 29, 'mst Shanaz akter', '+8801846524244', 2, 17, 6, ' Rajfulbaria, panpara ', 0, 1),
(13, 31, 'anesa akter', '+8800000122231', 2, 2, 5, 'juuu', 0, 1),
(14, 24, 'anwar khan', '+8801775086266', 2, 17, 6, 'hemayetpur', 0, 1),
(15, 31, 'shakil', '+8801775268965', 1, 30, 7, 'barapara 159+df', 0, 0),
(16, 31, 'shakil', '+8801775268965', 1, 30, 7, 'barapara 159+df', 0, 0),
(17, 27, 'Md Imraan Hossain', '+8801567945439', 2, 1, 2, 'Mirpur, Dohs', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `region_id`, `city_id`, `shipping_cost`) VALUES
(1, 'Uttara', 2, 1, 0.00),
(2, 'Adabor', 2, 1, 45.00),
(3, 'Aftab Nagar', 2, 1, 45.00),
(5, 'Savar', 2, 2, 0.00),
(6, 'savar', 2, 17, 0.00),
(7, 'Amtali', 1, 30, 111.00),
(8, 'Bamna', 1, 30, 0.00),
(9, 'Barguna sadar', 1, 30, 0.00),
(10, 'Betagi', 1, 30, 0.00),
(11, 'Patharghata', 1, 30, 0.00),
(12, 'Taltali', 1, 30, 0.00),
(13, 'Agailjhara', 1, 23, 0.00),
(14, 'Babuganj', 1, 23, 0.00),
(15, 'Bakerganj', 1, 23, 0.00),
(16, 'Banari Para', 1, 23, 0.00),
(17, 'Guarnadi', 1, 23, 0.00),
(18, 'Hijla', 1, 23, 0.00),
(19, 'Barisal sadar (Kotwali)', 1, 23, 0.00),
(20, 'Mhendiganj', 1, 23, 0.00),
(21, 'Muladi', 1, 23, 0.00),
(22, 'Wazirpur', 1, 23, 0.00),
(23, 'Bhola Sadar', 1, 24, 0.00),
(24, 'Burhanuddin', 1, 24, 0.00),
(25, 'adamdighi', 6, 32, 0.00),
(26, 'Char Fasson', 1, 24, 0.00),
(27, 'Bogra Sadar', 6, 32, 0.00),
(28, 'Daulat Khan', 1, 24, 0.00),
(29, 'Lalmohan', 1, 24, 0.00),
(30, 'Dhunat', 6, 32, 0.00),
(31, 'Manpura', 1, 24, 0.00),
(32, 'Dhupchanchia', 6, 32, 0.00),
(33, 'Tazumuddin', 1, 24, 0.00),
(34, 'Gabtali', 6, 32, 0.00),
(35, 'Kahaloo', 6, 32, 0.00),
(36, 'Jhalokati sadar', 1, 20, 0.00),
(37, 'Nandigram', 6, 32, 0.00),
(38, 'Kanthalia', 1, 20, 0.00),
(39, 'Nalchity', 1, 20, 0.00),
(40, 'Sariakandi', 6, 32, 0.00),
(41, 'Rajapur', 1, 20, 0.00),
(42, 'Shajahanpur', 6, 32, 0.00),
(43, 'Bauphal', 1, 21, 0.00),
(44, 'Dashmina', 1, 21, 0.00),
(45, 'Sherpur', 6, 32, 0.00),
(46, 'Dumki', 1, 21, 0.00),
(47, 'Shibganj', 6, 32, 0.00),
(48, 'Galachipa', 1, 21, 0.00),
(49, 'Sonatola', 6, 32, 0.00),
(50, 'Kalapara', 1, 21, 0.00),
(51, 'Mirzaganj', 1, 21, 0.00),
(52, 'Patuakhali sadar', 1, 21, 0.00),
(53, 'Atgharia', 6, 10, 0.00),
(54, 'Rangabali', 1, 21, 0.00),
(55, 'Bera', 6, 10, 0.00),
(56, 'Adabor', 2, 17, 0.00),
(57, 'Badda', 2, 17, 0.00),
(58, 'Bhangura', 6, 10, 0.00),
(59, 'Bangshal', 2, 17, 0.00),
(60, 'Chatmohar', 6, 10, 0.00),
(61, 'Birampur', 8, 33, 0.00),
(62, 'Biman Bandar', 2, 17, 0.00),
(63, 'Birganj', 8, 33, 0.00),
(64, 'Faridpur', 6, 10, 0.00),
(65, 'Banani', 2, 17, 0.00),
(66, 'Ishwardi', 6, 10, 0.00),
(67, 'Bochaganj', 8, 33, 0.00),
(68, 'Cantonment', 2, 17, 0.00),
(69, 'Pabna sadar', 6, 10, 0.00),
(70, 'Chirirbandar', 8, 33, 0.00),
(71, 'Bhandaria', 1, 22, 0.00),
(72, 'Santhia', 6, 10, 0.00),
(73, 'Fulbari', 8, 33, 0.00),
(74, 'Chak Bazar', 2, 17, 0.00),
(75, 'Ghoraghat', 8, 33, 0.00),
(76, 'Sujanagar', 6, 10, 0.00),
(77, 'Hakimpur', 8, 33, 0.00),
(78, 'Bagha', 6, 11, 0.00),
(79, 'Dakshinkhan', 2, 17, 0.00),
(80, 'Kaharole', 8, 33, 0.00),
(81, 'Bagerha Sadar ', 3, 52, 0.00),
(82, 'Baghmara', 6, 11, 0.00),
(83, 'Chitalmari', 3, 52, 0.00),
(84, 'Darus Salam', 2, 17, 0.00),
(85, 'Kawkhali', 1, 22, 0.00),
(86, 'Boalia', 6, 11, 0.00),
(87, 'Demra', 2, 17, 0.00),
(88, 'Mathbaria', 1, 22, 0.00),
(89, 'Fakirhat', 3, 52, 0.00),
(90, 'Charghat', 6, 11, 0.00),
(91, 'Mollahat', 3, 52, 0.00),
(92, 'Nazirpur', 1, 22, 0.00),
(93, 'Khansama', 8, 33, 0.00),
(94, 'Durgapur', 6, 11, 0.00),
(95, 'Mongla', 3, 52, 0.00),
(96, 'Pirojpur sadar', 1, 22, 0.00),
(97, 'Godagari', 6, 11, 0.00),
(98, 'Dinajpur sadar', 8, 33, 0.00),
(99, 'Morrelganj ', 3, 52, 0.00),
(100, 'Dhamrai', 2, 17, 0.00),
(101, 'Matihar', 6, 11, 0.00),
(102, 'Nawabganj', 8, 33, 0.00),
(103, 'Rampal', 3, 52, 0.00),
(104, 'Dhanmondi', 2, 17, 0.00),
(105, 'Mohanpur', 6, 11, 0.00),
(106, 'Parbatipur', 8, 33, 0.00),
(107, 'Nesarabad (swarupkati)', 1, 22, 0.00),
(108, 'Dohar', 2, 17, 0.00),
(109, 'Paba', 6, 11, 0.00),
(110, 'Sarankhola', 3, 52, 0.00),
(111, 'Puthia', 6, 11, 0.00),
(112, 'Bhasan tek', 2, 17, 0.00),
(113, 'Zianagar', 1, 22, 0.00),
(114, 'Alamdanga', 3, 54, 0.00),
(115, 'Rajpara', 6, 11, 0.00),
(116, 'Bhatara', 2, 17, 0.00),
(117, 'Damurhuda', 3, 54, 0.00),
(118, 'Shah makhdum', 6, 11, 0.00),
(119, 'Gendaria', 2, 17, 0.00),
(120, 'Fulchhari', 8, 59, 0.00),
(121, 'Chuadanga sadar', 3, 54, 0.00),
(122, 'Tanore', 6, 11, 0.00),
(123, 'Gaibandha sadar', 8, 59, 0.00),
(124, 'Jiban nagar', 3, 54, 0.00),
(125, 'Gulshan', 2, 17, 0.00),
(126, 'Abhaynagar', 3, 13, 0.00),
(127, 'Hazaribagh', 2, 17, 0.00),
(128, 'Gobindaganj', 8, 59, 0.00),
(129, 'Jatrabari', 2, 17, 0.00),
(130, 'Palashbari', 8, 59, 0.00),
(131, 'Bagher para', 3, 13, 0.00),
(132, 'Kafrul', 2, 17, 0.00),
(133, 'Sadullapur', 8, 59, 0.00),
(134, 'Belkuchi', 6, 9, 0.00),
(135, 'Kadamtali', 2, 17, 0.00),
(136, 'Alikadam', 4, 8, 0.00),
(137, 'Chaugachha', 3, 13, 0.00),
(138, 'Saghata', 8, 59, 0.00),
(139, 'Chauhali', 6, 9, 0.00),
(140, 'Bandarban sadar', 4, 8, 0.00),
(141, 'Kalabagan', 2, 17, 0.00),
(142, 'Sundarganj', 8, 59, 0.00),
(143, 'Lama', 4, 8, 0.00),
(144, 'Jhikargachha', 3, 13, 0.00),
(145, 'Kamrangirchar', 2, 17, 0.00),
(146, 'Kamarkhanda', 6, 9, 0.00),
(147, 'Manirumpur', 3, 13, 0.00),
(148, 'Naikhongchhari', 4, 8, 0.00),
(149, 'Kazipur', 6, 9, 0.00),
(150, 'Khilgaon', 2, 17, 0.00),
(151, 'Bhurungamari', 8, 37, 0.00),
(152, 'Jessore Sadar', 3, 13, 0.00),
(153, 'Khilkhet', 2, 17, 0.00),
(154, 'Rowangchhari', 4, 8, 0.00),
(155, 'Royganj', 6, 9, 0.00),
(156, 'Char rajibpur', 8, 37, 0.00),
(157, 'Ruma', 4, 8, 0.00),
(158, 'Keraniganj', 2, 17, 0.00),
(159, 'Sharsha', 3, 13, 0.00),
(160, 'Kotwali', 2, 17, 0.00),
(161, 'Chilmari', 8, 37, 0.00),
(162, 'Shahjadpur', 6, 9, 0.00),
(163, 'Lalbagh', 2, 17, 0.00),
(164, 'Kashabpur', 3, 13, 0.00),
(165, 'Phulbari', 8, 37, 0.00),
(166, 'Thanchi', 4, 8, 0.00),
(167, 'Sirajganj Sadar', 6, 9, 0.00),
(168, 'Mirpur', 2, 17, 0.00),
(169, 'Kurigram sadar', 8, 37, 0.00),
(170, 'Tarash', 6, 9, 0.00),
(171, 'Harinakunda', 3, 55, 0.00),
(172, 'Mohammadpur', 2, 17, 0.00),
(173, 'Nageshwari', 8, 37, 0.00),
(174, 'Ullah para', 6, 9, 0.00),
(175, 'Matijheel', 2, 17, 0.00),
(176, 'Kaliganj', 3, 55, 0.00),
(177, 'Akhaura', 4, 60, 0.00),
(178, 'Mugdapara', 2, 17, 0.00),
(179, 'Banchharampur', 4, 60, 0.00),
(180, 'Rajarhat', 8, 37, 0.00),
(181, 'Kotchandpur', 3, 55, 0.00),
(182, 'Nawabganj', 2, 17, 0.00),
(183, 'Raumari', 8, 37, 0.00),
(184, 'Brahmanbaria sadar', 4, 60, 0.00),
(185, 'Ashuganj', 4, 60, 0.00),
(186, 'Ulipur', 8, 37, 0.00),
(187, 'New market', 2, 17, 0.00),
(188, 'Jhenaidah Sadar', 3, 55, 0.00),
(189, 'Pallabi', 2, 17, 0.00),
(190, 'Kasba', 4, 60, 0.00),
(191, 'Paltan', 2, 17, 0.00),
(192, 'Maheshpur', 3, 55, 0.00),
(193, 'Nabinagar', 4, 60, 0.00),
(194, 'Aditmari', 8, 39, 0.00),
(195, 'Nasirnagar', 4, 60, 0.00),
(196, 'Shailkupa', 3, 55, 0.00),
(197, 'Hatibandha', 8, 39, 0.00),
(198, 'Sarail', 4, 60, 0.00),
(199, 'Ramna', 2, 17, 0.00),
(200, 'Kaliganj', 8, 39, 0.00),
(201, 'Batiaghata', 3, 56, 0.00),
(202, 'Rampura', 2, 17, 0.00),
(203, 'Akkelpur', 6, 61, 0.00),
(204, 'Lalmonirhat sadar', 8, 39, 0.00),
(205, 'Sabujbagh', 2, 17, 0.00),
(206, 'Chandpur sadar', 4, 65, 0.00),
(207, 'Joypurhat sadar', 6, 61, 0.00),
(208, 'Patgram', 8, 39, 0.00),
(209, 'dacope', 3, 56, 0.00),
(210, 'Faridganj', 4, 65, 0.00),
(211, 'Rupnagar', 2, 17, 0.00),
(212, 'Kalai', 6, 61, 0.00),
(213, 'Dimla upazila', 8, 41, 0.00),
(214, 'Daulatpur', 3, 56, 0.00),
(215, 'Khetlal', 6, 61, 0.00),
(216, 'Haim char', 4, 65, 0.00),
(217, 'Dumuria', 3, 56, 0.00),
(218, 'Domar upazila', 8, 41, 0.00),
(219, 'Panchbibi', 6, 61, 0.00),
(220, 'Hajiganj', 4, 65, 0.00),
(221, 'Shahjahanpur', 2, 17, 0.00),
(222, 'Dighalia', 3, 56, 0.00),
(223, 'Jaldhaka upazila', 8, 41, 0.00),
(224, 'Kachua', 4, 65, 0.00),
(225, 'Shah ali', 2, 17, 0.00),
(226, 'Atraj', 6, 62, 0.00),
(227, 'Matlab Dakshin', 4, 65, 0.00),
(228, 'Khalishpur', 3, 56, 0.00),
(229, 'Shahbagh', 2, 17, 0.00),
(230, 'Badalgachhi', 6, 62, 0.00),
(231, 'Kishoreganj upazila', 8, 41, 0.00),
(232, 'Matlab Uttar', 4, 65, 0.00),
(233, 'Shyampur', 2, 17, 0.00),
(234, 'Khan Jahan ali', 3, 56, 0.00),
(235, 'Dhamoirhat', 6, 62, 0.00),
(236, 'Shahrasti', 4, 65, 0.00),
(237, 'Nilphamari sadar upazila', 8, 41, 0.00),
(238, 'Manda', 6, 62, 0.00),
(239, 'Sher-e-Bangla nagar', 2, 17, 0.00),
(240, 'Khulna Sadar', 3, 56, 0.00),
(241, 'Sutrapur', 2, 17, 0.00),
(242, 'Koyra', 3, 56, 0.00),
(243, 'Mahadebpur', 6, 62, 0.00),
(244, 'Saidpur upazila', 8, 41, 0.00),
(245, 'Anowara', 4, 66, 0.00),
(246, 'Paikgachha', 3, 56, 0.00),
(247, 'Naogaon sadar', 6, 62, 0.00),
(248, 'Bayejid Bostami', 4, 66, 0.00),
(249, 'Atwari', 8, 43, 0.00),
(250, 'Phultala', 3, 56, 0.00),
(251, 'Tejgaon', 2, 17, 0.00),
(252, 'Niamatpur', 6, 62, 0.00),
(253, 'Rupsa', 3, 56, 0.00),
(254, 'Banshkhali', 4, 66, 0.00),
(255, 'Boda', 8, 43, 0.00),
(256, 'Bakalia', 4, 66, 0.00),
(257, 'Sonadanga', 3, 56, 0.00),
(258, 'Debiganj', 8, 43, 0.00),
(259, 'Tejgaon ind. Area', 2, 17, 0.00),
(260, 'Terokkhada', 3, 56, 0.00),
(261, 'Boalkhali', 4, 66, 0.00),
(262, 'Turag', 2, 17, 0.00),
(263, 'Bheramara', 3, 18, 0.00),
(264, 'Daulatpur', 3, 18, 0.00),
(265, 'Uttara paschim', 2, 17, 0.00),
(266, 'Khoksa', 3, 18, 0.00),
(267, 'Uttara Purba', 2, 17, 0.00),
(268, 'Uttar khan', 2, 17, 0.00),
(269, 'Khumarkhali', 3, 18, 0.00),
(270, 'Wari', 2, 17, 0.00),
(271, 'Patnitala', 6, 62, 0.00),
(272, 'Chandanaish', 4, 66, 0.00),
(273, 'Porsha', 6, 62, 0.00),
(274, 'Kustia sadar', 3, 18, 0.00),
(275, 'Chandgaon', 4, 66, 0.00),
(276, 'Raninagar', 6, 62, 0.00),
(277, 'Mirpur', 3, 18, 0.00),
(278, 'Panchagarh sadar', 8, 43, 0.00),
(279, 'Chittagong port', 4, 66, 0.00),
(280, 'Sapahar', 6, 62, 0.00),
(281, 'Alfadanga', 2, 31, 0.00),
(282, 'Double mooring', 4, 66, 0.00),
(283, 'Tentulia', 8, 43, 0.00),
(284, 'Magura Sadar', 3, 57, 0.00),
(285, 'Fatikchhari', 4, 66, 0.00),
(286, 'Bhanga', 2, 31, 0.00),
(287, 'Bagatipara', 6, 63, 0.00),
(288, 'Mohammadpur', 3, 57, 0.00),
(289, 'Halishahar', 4, 66, 0.00),
(290, 'Badarganj', 8, 44, 0.00),
(291, 'Baraigram', 6, 63, 0.00),
(292, 'Boalmari', 2, 31, 0.00),
(293, 'Hathazari', 4, 66, 0.00),
(294, 'Shalikha', 3, 57, 0.00),
(295, 'Kotwali', 4, 66, 0.00),
(296, 'Char Bhadrashan', 2, 31, 0.00),
(297, 'Gangachara', 8, 44, 0.00),
(298, 'Sreepur', 3, 57, 0.00),
(299, 'Gurudaspur', 6, 63, 0.00),
(300, 'Khulshi', 4, 66, 0.00),
(301, 'Kaunia', 8, 44, 0.00),
(302, 'Faridpur Sadar', 2, 31, 0.00),
(303, 'Lalpur', 6, 63, 0.00),
(304, 'Lohagara', 4, 66, 0.00),
(305, 'Modhukhali', 2, 31, 0.00),
(306, 'Modhukhali', 2, 31, 0.00),
(307, 'Rangpur sadar', 8, 44, 0.00),
(308, 'Gangni', 3, 16, 0.00),
(309, 'Natore sadar', 6, 63, 0.00),
(310, 'Mirsharai', 4, 66, 0.00),
(311, 'Nagarkanda', 2, 31, 0.00),
(312, 'Pahartali', 4, 66, 0.00),
(313, 'Singra', 6, 63, 0.00),
(314, 'Mitha pukur', 8, 44, 0.00),
(315, 'Mujib Nagar', 3, 16, 0.00),
(316, 'Panchlaish', 4, 66, 0.00),
(317, 'Sadarpur', 2, 31, 0.00),
(318, 'Patiya', 4, 66, 0.00),
(319, 'Pirgachha', 8, 44, 0.00),
(320, 'Bholahat', 6, 64, 0.00),
(321, 'Saltha', 2, 31, 0.00),
(322, 'Patenga', 4, 66, 0.00),
(323, 'Pirganj', 8, 44, 0.00),
(325, 'Rangunia', 4, 66, 0.00),
(326, 'Gomastapur', 6, 64, 0.00),
(327, 'Raozan', 4, 66, 0.00),
(328, 'Gajipur sadar', 2, 15, 0.00),
(329, 'Taraganj', 8, 44, 0.00),
(330, 'Sandwip', 4, 66, 0.00),
(331, 'Nachole', 6, 64, 0.00),
(332, 'Satkania', 4, 66, 0.00),
(333, 'Meherpur Sadar', 3, 16, 0.00),
(334, 'Kaliakair', 2, 15, 0.00),
(335, 'Baliadangi', 8, 46, 0.00),
(336, 'Chapai nababganj sadar', 6, 64, 0.00),
(337, 'Sitakunda', 4, 66, 0.00),
(338, 'Kalia', 3, 58, 0.00),
(339, 'Haripur', 8, 46, 0.00),
(340, 'Kaliganj', 2, 15, 0.00),
(341, 'Pirganj', 8, 46, 0.00),
(342, 'Shibganj', 6, 64, 0.00),
(343, 'Lohagara', 3, 58, 0.00),
(344, 'Kapasia', 2, 15, 0.00),
(345, 'Ranisankail', 8, 46, 0.00),
(346, 'Narail sadar', 3, 58, 0.00),
(347, 'Barura', 4, 6, 0.00),
(348, 'Sreepur', 2, 15, 0.00),
(349, 'Takurgaon sadar', 8, 46, 0.00),
(350, 'Assasuni', 3, 14, 0.00),
(351, 'Brahman para', 4, 6, 0.00),
(352, 'Debhata', 3, 14, 0.00),
(353, 'Burichang', 4, 6, 0.00),
(354, 'Gopalganj sadar', 2, 34, 0.00),
(355, 'Chandina', 4, 6, 0.00),
(356, 'Kalaroa', 3, 14, 0.00),
(357, 'Ajmiriganj', 5, 48, 0.00),
(358, 'Kashiani', 2, 34, 0.00),
(359, 'Chauddagram', 4, 6, 0.00),
(360, 'Bahubal', 5, 48, 0.00),
(361, 'Kaligang', 3, 14, 0.00),
(362, 'Kotalipara', 2, 34, 0.00),
(363, 'Shatkhira sadar', 3, 14, 0.00),
(364, 'Muksudpur', 2, 34, 0.00),
(365, 'Comilla sadar dakshin', 4, 6, 0.00),
(366, 'Tungipara', 2, 34, 0.00),
(367, 'Daudkandi', 4, 6, 0.00),
(368, 'Shyamnagar ', 3, 14, 0.00),
(369, 'Bakshiganj', 2, 35, 0.00),
(370, 'Tala', 3, 14, 0.00),
(371, 'Debidwar', 4, 6, 0.00),
(372, 'Dewanganj', 2, 35, 0.00),
(373, 'Baniachong', 5, 48, 0.00),
(374, 'Homna', 4, 6, 0.00),
(375, 'Islampur', 2, 35, 0.00),
(376, 'Comilla adarsha sadar', 4, 6, 0.00),
(377, 'Chunarughat', 5, 48, 0.00),
(378, 'Laksam', 4, 6, 0.00),
(379, 'Jamalpur sadar', 2, 35, 0.00),
(380, 'Habiganj sadar', 5, 48, 0.00),
(381, 'Manoharganj', 4, 6, 0.00),
(382, 'Madarganj', 2, 35, 0.00),
(383, 'Lakhai', 5, 48, 0.00),
(384, 'Meghna', 4, 6, 0.00),
(385, 'Melandaha', 2, 35, 0.00),
(386, 'Muradnagar', 4, 6, 0.00),
(387, 'Madhabpur', 5, 48, 0.00),
(388, 'Nangalkot', 4, 6, 0.00),
(389, 'Titas', 4, 6, 0.00),
(390, 'Sarishabari Upazila', 2, 35, 0.00),
(391, 'Nabiganj', 5, 48, 0.00),
(392, 'Austagram', 2, 19, 0.00),
(394, 'Bajitpur', 2, 19, 0.00),
(395, 'Chakaria', 4, 68, 0.00),
(396, 'Bhairab', 2, 19, 0.00),
(397, 'Cox\'s bazar sadar', 4, 68, 0.00),
(398, 'Hossainpur', 2, 19, 0.00),
(399, 'Kutubdia', 4, 68, 0.00),
(400, 'Itna', 2, 19, 0.00),
(401, 'Maheshkhali', 4, 68, 0.00),
(402, 'Karimganj', 2, 19, 0.00),
(403, 'Pekua', 4, 68, 0.00),
(404, 'Katiadi', 2, 19, 0.00),
(405, 'Ramu', 4, 68, 0.00),
(406, 'Kishoreganj sadar', 2, 19, 0.00),
(407, 'Teknaf', 4, 68, 0.00),
(408, 'Ukhia', 4, 68, 0.00),
(409, 'Chhagalnaiya', 4, 7, 0.00),
(410, 'Kuliarchar', 2, 19, 0.00),
(411, 'Mithamain', 2, 19, 0.00),
(412, 'Daganbhuiyan', 4, 7, 0.00),
(413, 'Nikli', 2, 19, 0.00),
(414, 'Feni sadar', 4, 7, 0.00),
(415, 'Pakundia', 2, 19, 0.00),
(416, 'Fulgazi', 4, 7, 0.00),
(417, 'Barlekha', 5, 50, 0.00),
(418, 'Juri', 5, 50, 0.00),
(419, 'Kamalganj', 5, 50, 0.00),
(420, 'Tarail', 2, 19, 0.00),
(421, 'Parshuram', 4, 7, 0.00),
(422, 'Kulaura', 5, 50, 0.00),
(423, 'Sonagazi', 4, 7, 0.00),
(424, 'Kalkini', 2, 3, 0.00),
(425, 'Maulvibazar sadar', 5, 50, 0.00),
(426, 'Madaripur', 2, 3, 0.00),
(427, 'Rajnagar', 5, 50, 0.00),
(428, 'Rajoir', 2, 3, 0.00),
(429, 'Dighinala', 4, 69, 0.00),
(430, 'Sreemangal', 5, 50, 0.00),
(431, 'Shibchar', 2, 3, 0.00),
(432, 'Bishwambarpur', 5, 28, 0.00),
(433, 'Khagrachhari sadar', 4, 69, 0.00),
(434, 'Daulatpur', 2, 29, 0.00),
(435, 'Chhatak', 5, 28, 0.00),
(436, 'Lakshmichhari', 4, 69, 0.00),
(437, 'Ghior', 2, 29, 0.00),
(438, 'Mahalchhari', 4, 69, 0.00),
(439, 'Harirampur', 2, 29, 0.00),
(440, 'Daksin sunamganj', 5, 28, 0.00),
(441, 'Manikchhari', 4, 69, 0.00),
(442, 'Derai', 5, 28, 0.00),
(443, 'Matiranga', 4, 69, 0.00),
(444, 'Manikganj sadar', 2, 29, 0.00),
(445, 'Panchhari', 4, 69, 0.00),
(446, 'Dharampasha', 5, 28, 0.00),
(447, 'Saturia', 2, 29, 0.00),
(448, 'Ramgarh', 4, 69, 0.00),
(449, 'Shibalaya', 2, 29, 0.00),
(450, 'Dowarabazar', 5, 28, 0.00),
(451, 'Singair', 2, 29, 0.00),
(452, 'Jagannatpur', 5, 28, 0.00),
(453, 'Kamalnagar', 4, 70, 0.00),
(454, 'Jamalganj', 5, 28, 0.00),
(455, 'Lakshmipur sadar', 4, 70, 0.00),
(456, 'Bhaluka', 2, 40, 0.00),
(457, 'Roypur', 4, 70, 0.00),
(458, 'Sulla', 5, 28, 0.00),
(459, 'Ramganj', 4, 70, 0.00),
(460, 'Dhobaura', 2, 40, 0.00),
(461, 'Ramgati', 4, 70, 0.00),
(462, 'Sunamganj sadar', 5, 28, 0.00),
(463, 'Fulbaria', 2, 40, 0.00),
(464, 'Gaffarganj', 2, 40, 0.00),
(465, 'Tahirpur', 5, 28, 0.00),
(466, 'Begumganj', 4, 71, 0.00),
(467, 'Gauripur', 2, 40, 0.00),
(468, 'Chatkhil', 4, 71, 0.00),
(469, 'Balaganj', 5, 25, 0.00),
(470, 'Haluaghat', 2, 40, 0.00),
(471, 'Companiganj', 4, 71, 0.00),
(472, 'Beani bazar', 5, 25, 0.00),
(473, 'Hatiya', 4, 71, 0.00),
(474, 'Ishwarganj', 2, 40, 0.00),
(475, 'Kabirhat', 4, 71, 0.00),
(476, 'Mymensingh sadar', 2, 40, 0.00),
(477, 'Senbagh', 4, 71, 0.00),
(478, 'Bishwanath', 5, 25, 0.00),
(479, 'Sonaimuri', 4, 71, 0.00),
(480, 'Companiganj', 5, 25, 0.00),
(481, 'Muktagachha', 2, 40, 0.00),
(482, 'Nandail', 2, 40, 0.00),
(483, 'Subarnachar', 4, 71, 0.00),
(484, 'Noakhali sadar', 4, 71, 0.00),
(485, 'Dakshin surma', 5, 25, 0.00),
(486, 'Phulpur', 2, 40, 0.00),
(487, 'Trishal', 2, 40, 0.00),
(488, 'Fenchuganj', 5, 25, 0.00),
(489, 'Araihazar', 2, 4, 0.00),
(490, 'Golapganj', 5, 25, 0.00),
(491, 'Sonargaon', 2, 4, 0.00),
(492, 'Baghaichhari', 4, 72, 0.00),
(493, 'Gowainghat', 5, 25, 0.00),
(494, 'Bandar', 2, 4, 0.00),
(495, 'Barkel Upazila', 4, 72, 0.00),
(496, 'Jaintiapur', 5, 25, 0.00),
(497, 'Narayanganj sadar', 2, 4, 0.00),
(498, 'Kawkhali (Betbunia)', 4, 72, 0.00),
(499, 'Rupganj', 2, 4, 0.00),
(500, 'Kanaighat', 5, 25, 0.00),
(501, 'Belai chhari upazila', 4, 72, 0.00),
(502, 'Kaptai upazila', 4, 72, 0.00),
(503, 'Belabo', 2, 5, 0.00),
(504, 'Sylhet sadar', 5, 25, 0.00),
(505, 'Monohardi', 2, 5, 0.00),
(506, 'Jurai chhari upazila', 4, 72, 0.00),
(507, 'Narshingdi sadar', 2, 5, 0.00),
(508, 'Langadu upazila', 4, 72, 0.00),
(509, 'Palash', 2, 5, 0.00),
(510, 'Naniarchar upazila', 4, 72, 0.00),
(511, 'Roypura', 2, 5, 0.00),
(512, 'Shibpur', 2, 5, 0.00),
(513, 'Rajasthali upazila', 4, 72, 0.00),
(514, 'Atpara', 2, 45, 0.00),
(515, 'Rangamati sadar upazila', 4, 72, 0.00),
(516, 'Barhatta', 2, 45, 0.00),
(517, 'Durgapur', 2, 45, 0.00),
(518, 'Zakiganj', 5, 25, 0.00),
(519, 'Khaliajuri', 2, 45, 0.00),
(520, 'Kalmakanda', 2, 45, 0.00),
(521, 'Kendua', 2, 45, 0.00),
(522, 'Madan', 2, 45, 0.00),
(523, 'Mohanganj', 2, 45, 0.00),
(524, 'Netrakona  sadar', 2, 45, 0.00),
(525, 'Purbadhala', 2, 45, 0.00),
(526, 'Baliakandi', 2, 47, 0.00),
(527, 'Goalanda', 2, 47, 0.00),
(528, 'Kalukhali', 2, 47, 0.00),
(529, 'Pangsha', 2, 47, 0.00),
(530, 'Rajbari sadar', 2, 47, 0.00),
(531, 'Bhedarganj', 2, 49, 0.00),
(532, 'Damudya', 2, 49, 0.00),
(533, 'Goshairhat', 2, 49, 0.00),
(534, 'Naria', 2, 49, 0.00),
(535, 'Shariatpur sadar', 2, 49, 0.00),
(536, 'Zanjira', 2, 49, 0.00),
(537, 'Jhenaigati', 2, 51, 0.00),
(538, 'Nakla', 2, 51, 0.00),
(539, 'Nalitabari', 2, 51, 0.00),
(540, 'Sherpur sadar', 2, 51, 0.00),
(541, 'Sreebardi', 2, 51, 0.00),
(542, 'Basail', 2, 53, 0.00),
(543, 'Bhuapur', 2, 53, 0.00),
(544, 'Delduar', 2, 53, 0.00),
(545, 'Dhanbari', 2, 53, 0.00),
(546, 'Ghotail', 2, 53, 0.00),
(547, 'Gopalpur', 2, 53, 0.00),
(548, 'Kalihati', 2, 53, 0.00),
(549, 'Madhupur', 2, 53, 0.00),
(550, 'Mirzapur', 2, 53, 0.00),
(551, 'Nagarpur', 2, 53, 0.00),
(552, 'Shakipur ', 2, 53, 0.00),
(553, 'Tangail sadar', 2, 53, 0.00);

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
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
(17, 5, 27, NULL, '2', 'kg', '[\".5\",\"1\"]'),
(18, 26, NULL, NULL, '1', 'Ram', '[\"4GB\",\"8GB\"]'),
(19, 26, NULL, NULL, '1', 'Size', '[\"Small\",\"Medium\",\"Large\"]'),
(20, 26, NULL, NULL, '1', 'Storage', '[\"32GB\",\"64GB\"]'),
(21, 26, NULL, NULL, '1', 'dgfj', '[\"gj\",\"gfjf\"]'),
(24, 19, 91, 420, '3', 'Color', '[\"White\",\"Black, Blue, Pink\",\"pink\",\"yellow\",\"red\"]');

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
  `top` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `name_bd`, `logo`, `serial`, `top`, `slug`) VALUES
(1, 'Google', 'Google', 'upload/product/brand/mje2odyxnje1nji3otkz.png', 3, 2, 'google-mzk3'),
(2, 'Nike', 'নাইকি', 'upload/product/brand/ndq3mdyxnje1njm4mzg2.png', 2, NULL, 'nike-mjiz'),
(3, 'Intel', 'ইন্টেল', 'upload/product/brand/oty0otgxnje1njm4ndm3.png', 5, 3, 'intel-odg2'),
(4, 'Cisco', 'সিসকো', 'upload/product/brand/odewntqxnje1njm4nzc4.png', 7, 5, 'cisco-ntyw'),
(5, 'Facebook', 'ফেসবুক', 'upload/product/brand/ndy2mzkxnje1njm4otyz.png', 4, 1, 'facebook-odaw'),
(6, 'Samsung', 'স্যামসাং', 'upload/product/brand/ndu5mdmxnje1njm4otg4.png', 3, 4, 'samsung-mzez'),
(7, 'Toyota', 'টয়োটা', 'upload/product/brand/mzy2ndaxnje1njm5nza2.png', 6, 6, 'toyota-odcw'),
(8, 'grown', 'গাউন', 'upload/product/brand/otq3ntcxnjmxmdawmzgz.jpeg', NULL, NULL, 'grown-nzg5'),
(9, 'jeans ', 'জিন্স', 'upload/product/brand/ntczmtaxnjmxmdaynjg5.jpeg', NULL, NULL, 'jeans--ndg0'),
(10, 'T- shirt', 'টি-শার্ট', 'upload/product/brand/mjmyntyxnjmxmdazmtkw.jpeg', 8, NULL, 't--shirt-mti2'),
(11, 'Dresses & skirts', 'পোশাক এবং স্কার্ট', 'upload/product/brand/nzuwntmxnjmxmda1mze0.jpeg', 9, NULL, 'dresses--skirts-mjc0'),
(12, 'girls shoes', 'মেয়েদের জুতা', 'upload/product/brand/ode0ndexnjmxmda2ndq1.jpeg', 10, NULL, 'girls-shoes-ndu2'),
(13, 'sandals', 'স্যান্ডেল', 'upload/product/brand/njy2mdcxnjmxmdexmtg5.jpeg', 11, NULL, 'sandals-mtg0');

-- --------------------------------------------------------

--
-- Table structure for table `business_types`
--

CREATE TABLE `business_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_types`
--

INSERT INTO `business_types` (`id`, `name`) VALUES
(8, 'Distributors'),
(9, 'Retailers'),
(7, 'Wholesalers');

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
  `top` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_bd`, `banner`, `icon`, `serial`, `top`, `slug`) VALUES
(18, ' Clothing ', 'ক্লিথিং', 'upload/product/category/banner/nteynzyxnjmwmzeymzu1.jpeg', 'upload/product/category/icon/nzc4ntuxnjmwmzeymzu1.jpeg', 9, NULL, '-clothing--njgz'),
(19, 'WOMEN', 'ওমেন', 'upload/product/category/banner/mzk0nzexnjmwmzezmzux.jpeg', 'upload/product/category/icon/ndu5ntixnjmwmzezmzux.jpeg', 2, NULL, 'women-nju0'),
(21, 'BEAUTY', 'বিউটি', 'upload/product/category/banner/mzewotcxnjmwmzezndky.png', 'upload/product/category/icon/mti4ntuxnjmwmzezndkz.png', 3, NULL, 'beauty-mzmx'),
(22, 'BRANDS', 'ব্রান্ড', 'upload/product/category/banner/ode3mjaxnjmwmzezntew.png', 'upload/product/category/icon/ntixmjmxnjmwmzezntew.png', 8, NULL, 'brands-mte0'),
(23, 'SPORTS AND BOOK', 'খেলা এবং বই', 'upload/product/category/banner/ntyxotkxnjmwmzezmju2.jpeg', 'upload/product/category/icon/mjezntixnjmwmzezmju2.jpeg', 6, NULL, 'sports-otkz'),
(24, 'JEWELLERY', 'জুয়েলারি', 'upload/product/category/banner/ndu0mtqxnjmwmzezndy4.jpeg', 'upload/product/category/icon/otuymzuxnjmwmzezndy4.jpeg', 10, NULL, 'jewellery-mtuz'),
(25, 'FESTIVAl', 'ফেস্টিবাল', 'upload/product/category/banner/ota0mtkxnjmwmzezmjiy.jpeg', 'upload/product/category/icon/njmymtixnjmwmzezmjiy.png', 11, NULL, 'festiva-otqz'),
(26, 'Electronics Accessories', 'ইলেকট্রনিক্স আনুষাঙ্গিক', 'upload/product/category/banner/ndk2mdixnjmwmzeyota1.jpeg', 'upload/product/category/icon/odmwmtyxnjmwmzeyota1.jpeg', 4, NULL, 'electronics-accessories-mjcz'),
(27, 'Mens', 'পুরুষ', 'upload/product/category/banner/ntc3mdixnjmwotg3mji1.jpeg', 'upload/product/category/icon/mzcwnjmxnjmwotg3mji1.jpeg', 1, NULL, 'mens-otq3'),
(28, 'Baby&kids', ' বাচ্চা এবং বাচ্চারা', 'upload/product/category/banner/nta3mjmxnjmwotkwnzg0.jpeg', 'upload/product/category/icon/mti1ndexnjmwotkwnzg0.png', 7, NULL, 'babykids-mtq2'),
(29, 'HOME & FURNITURE', ' হোম এবং ফার্নিচার', 'upload/product/category/banner/mzk3nzkxnjmwotk0odgx.jpeg', 'upload/product/category/icon/nzu1nzmxnjmwotk0odgx.jpeg', 5, NULL, 'home--furniture-ndy1');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region_id`) VALUES
(1, 'Dhaka -North', 2),
(2, 'Dhaka - South', 2),
(3, 'Madaripur', 2),
(4, 'Narayanganj', 2),
(5, 'Norsingdi', 2),
(6, 'Comilla', 4),
(7, 'Feni', 4),
(8, 'Bandarban', 4),
(9, 'Shirajganj', 6),
(10, 'Pabna', 6),
(11, 'Rajshahi', 6),
(13, 'Joshore', 3),
(14, 'Satkhira', 3),
(15, 'Gazipur', 2),
(16, 'Meherpur', 3),
(17, 'Dhaka', 2),
(18, 'Kustia', 3),
(19, 'Kishoreganj', 2),
(20, 'Jhalokati', 1),
(21, 'Patuakhali', 1),
(22, 'Pirojpur', 1),
(23, 'Barishal', 1),
(24, 'Bhola', 1),
(25, 'Sylhet', 5),
(28, 'Sunamganj', 5),
(29, 'Manikganj', 2),
(30, 'Barguna', 1),
(31, 'Faridpur', 2),
(32, 'Bogra', 6),
(33, 'Dinajpur', 8),
(34, 'Gopalganj', 2),
(35, 'Jamalpur', 2),
(36, 'Gaibandha', 9),
(37, 'Kurigram', 8),
(38, 'Munshiganj', 2),
(39, 'Lalmonirhat', 8),
(40, 'Mymensingh', 2),
(41, 'Nilphamari zila', 8),
(42, 'Kishoregonj', 2),
(43, 'Panchagarh', 8),
(44, 'Rangpur', 8),
(45, 'Netrakona', 2),
(46, 'Thakurgaon', 8),
(47, 'Rajbari', 2),
(48, 'Habiganj', 5),
(49, 'Shariatpur', 2),
(50, 'Maulvibazar', 5),
(51, 'Sherpur', 2),
(52, 'bagerhat', 3),
(53, 'Tangail', 2),
(54, 'Chuadanga', 3),
(55, 'Jhenaidah', 3),
(56, 'Khulna', 3),
(57, 'Magura', 3),
(58, 'Narail', 3),
(59, 'Gaibandha', 8),
(60, 'Brahmanbaria', 4),
(61, 'Joypurhat', 6),
(62, 'Naogaon', 6),
(63, 'Natore', 6),
(64, 'Chapai Nababganj', 6),
(65, 'Chandpur', 4),
(66, 'Chittagong', 4),
(67, 'Comilla', 1),
(68, 'Cox\'s Bazar', 4),
(69, 'Khagrachhari', 4),
(70, 'Lakshmipur', 4),
(71, 'Noakhali', 4),
(72, 'Rangamati', 4);

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
  `percent_off` int(11) NOT NULL DEFAULT 1,
  `min_qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_variations`
--

INSERT INTO `discount_variations` (`id`, `product_id`, `percent_off`, `min_qty`) VALUES
(8, 17, 60, 5),
(9, 17, 65, 10),
(10, 17, 70, 20);

-- --------------------------------------------------------

--
-- Table structure for table `financials`
--

CREATE TABLE `financials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_type` tinyint(1) DEFAULT NULL COMMENT '1=Passport, 2=Driving, 3=Voter',
  `id_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_routing_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financials`
--

INSERT INTO `financials` (`id`, `user_id`, `id_type`, `id_code`, `bank_name`, `bank_branch_name`, `bank_account_name`, `bank_account_number`, `bank_routing_number`, `tin_number`) VALUES
(6, 19, 2, '57856858', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 24, 3, '284126449', 'bank asia', 'agent banking', 'anower hossen', '1083426036551', '12564', '12455657'),
(12, 27, 1, '219514555', 'Brac Bank', 'DOHS', 'UNITED IT SOLUTION', '01583263645', '526694525', '256642566'),
(13, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 29, 3, '249796545', 'shanaz', 'Agent Banking', 'tetuljhora UDC', '10834260336511', '12658000', '1255888888'),
(15, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT 0,
  `expired_date` date DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `banner`, `expired`, `expired_date`, `slug`, `status`) VALUES
(6, 'Best Wish Of The Month', 'upload/marketing/deal/njg5mzuxnjmxmda5mdmw.jpeg', 1, '2021-09-08', 'best-wish-of-the-year--ntk3', 1),
(7, 'Black Friday', 'upload/marketing/deal/ndkymtuxnjmxmdkxmjqz.jpeg', 1, '2021-09-11', 'black-friday-ntez', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Yes, 2=No',
  `discount_value` double(8,2) NOT NULL DEFAULT 1.00,
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_value`, `discount_type`) VALUES
(81, 7, 32, 2, 0.00, 'Percent'),
(82, 7, 7, 2, 0.00, 'Percent'),
(83, 7, 5, 1, 2.00, 'Flat'),
(84, 7, 18, 1, 2.50, 'Percent'),
(85, 7, 15, 2, 0.00, 'Percent'),
(86, 7, 17, 2, 0.00, 'Percent'),
(87, 7, 20, 1, 10.00, 'Percent'),
(88, 7, 133, 2, 0.00, 'Percent'),
(89, 7, 134, 2, 0.00, 'Percent'),
(90, 7, 135, 2, 0.00, 'Percent'),
(91, 7, 140, 2, 0.00, 'Percent'),
(92, 7, 52, 2, 0.00, 'Percent'),
(93, 7, 65, 2, 0.00, 'Percent'),
(94, 7, 30, 1, 70.00, 'Flat'),
(95, 7, 88, 1, 100.00, 'Flat'),
(96, 7, 129, 2, 0.00, 'Percent'),
(97, 6, 17, 1, 24.00, 'Percent'),
(98, 6, 39, 1, 15.00, 'Percent'),
(99, 6, 43, 1, 5.00, 'Percent'),
(100, 6, 37, 1, 7.00, 'Percent'),
(101, 6, 18, 1, 10.00, 'Percent'),
(102, 6, 20, 1, 5.00, 'Percent');

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
  `description` varchar(2500) COLLATE utf8mb4_unicode_ci DEFAULT 'Lorem ipsum dolor sit amet, consecrated advising elite, sed do emus tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.',
  `copyright` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '© 2020 Bongo Bazar All Rights reserved',
  `social` tinyint(1) NOT NULL DEFAULT 0,
  `facebook` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footers`
--

INSERT INTO `footers` (`id`, `address`, `phone`, `email`, `working`, `description`, `copyright`, `social`, `facebook`, `twitter`, `youtube`, `insta`) VALUES
(1, 'Raj Place,Padma Mor, Hemayetpur, Savar,Dhaka', '01775086266', 'info@loyel.com', 'Mon-Fri 8:00 to 19:00', '<p>Welcome to Loyel Shopping!</p><p>Loyel Online Shop is a B2C marketplace network for fashion and lifestyle buyers and sellers in categories including fashion, lifestyle, and health &amp; beauty to buy and sell effortlessly online. Browse the vast digital catalog with a huge in style selection at the most competitive prices from trusted sellers. Easily, enjoy our fast delivery services and benefit from flexible and secure online payments.</p>', '<p><span style=\"background-color: rgb(238, 238, 239); color: rgb(124, 126, 138);\">© Copyright Loyel Online Shop 2021</span></p>', 1, 'facebook.com', 'www.twiter.com', '//www.youtube.com/watch?v=8kxs6rQs4aY', 'www.instagram.com');

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
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Active, 1=Maintenance',
  `maintenance_date` datetime DEFAULT NULL,
  `bangla_language` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Inactive, 1=Active',
  `default_language` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=English, 2=Bangla',
  `favicon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/setup/logo_black.png',
  `shipping_method` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Product, 2=Cost, 3=Area',
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `seller_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Not Verify, 1=Verify Needed',
  `product_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Not Verify, 1=Verify Needed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generals`
--

INSERT INTO `generals` (`id`, `app_name`, `app_name_bd`, `logo_white`, `logo_black`, `site_url`, `maintenance_mode`, `maintenance_date`, `bangla_language`, `default_language`, `favicon`, `shipping_method`, `shipping_cost`, `seller_verify`, `product_verify`) VALUES
(1, 'Loyel', 'লয়েল', 'upload/general/njiznjexnjmwmziwmjyw.png', 'upload/general/nje3mtcxnjmxmdiynde4.png', NULL, 1, NULL, 1, 1, 'image/setup/logo_black.png', 3, 50.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `help_categories`
--

CREATE TABLE `help_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_categories`
--

INSERT INTO `help_categories` (`id`, `name`, `icon`, `slug`) VALUES
(2, 'Orders', 'upload/help/category/mjiymjexnji1mzu1mda0.png', 'orders-odq4'),
(3, 'Payments', 'upload/help/category/nda5mzexnji1ntmxndy0.png', 'payments-mjc5'),
(4, 'dCategories', 'upload/help/category/mjgxnzgxnji1ntmxndgy.png', 'dcategories-mze3'),
(5, 'Account Management', 'upload/help/category/odgwnjcxnji1ntmxntaw.png', 'account-management-nzkx');

-- --------------------------------------------------------

--
-- Table structure for table `help_questions`
--

CREATE TABLE `help_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Show Off, 1=Show On',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_questions`
--

INSERT INTO `help_questions` (`id`, `category_id`, `subcategory_id`, `question`, `answer`, `status`, `slug`) VALUES
(2, 2, 2, 'What kind of questions can I ask on IM?', '<p><strong>Do’s</strong></p><ul><li>Asking product-based queries</li><li>Asking queries pertaining to product’s warranty, installation, etc.</li></ul><p><strong>Dont\'s</strong></p><ul><li>Sharing contact details</li><li>Using indecent, impolite language</li><li>Asking irrelevant queries</li><li>Using IM for lodging complaints.</li></ul><p><br></p>', 1, 'what-kind-of-questions-can-i-ask-on-im-nzuw'),
(3, 5, 5, 'How to change Contact number?', '<p>In order to change your phone number please follow below mention steps,</p><p>1. Login to your Account.</p><p>2. Click on Setting.</p><p>3. Click on Account information.</p><p>4. Click on Change Mobile.</p><p>5. Verify through&nbsp;<strong>“Email”</strong>&nbsp;or&nbsp;<strong>\"SMS Code\"</strong>.</p><p>6. If you want to verify through Email kindly enter your existing email address, which is registered with your Daraz account.</p><p>7. If you want to verify through SMS, kindly enter your existing mobile number, which is registered with your Daraz account.</p><p>8. Press on&nbsp;<strong>“Send code”</strong>. After receiving the code via email or SMS, input the code and press&nbsp;<strong>“Verify Code”</strong>.</p><p>9. After that you are ready to enter your new mobile number.</p><p>Please check the gif for a better understanding.</p><p><img src=\"https://beebot-sg-knowledgecloud.oss-ap-southeast-1.aliyuncs.com/kc/kc-media/kc-oss-1586169857192-How%20to%20change%20Contact%20number%20cropped.gif\" height=\"500\" width=\"243\"></p>', 1, 'how-to-change-contact-number-odu4'),
(4, 5, 5, 'How can I change the password of my account?', '<p>Changing password is easy! Just follow the below steps:</p><p><strong>If you remember your old password you can follow these steps -</strong></p><p><strong>Step 1:&nbsp;</strong>Click on&nbsp;<strong>“Account”</strong>&nbsp;from the home page.</p><p><strong>Step 2:</strong>&nbsp;Go to&nbsp;<strong>\"Setting\"&nbsp;</strong>and press on&nbsp;<strong>\"Account Information\"</strong>.</p><p><strong>Step 3:</strong>&nbsp;Press on&nbsp;<strong>\"Change Password\"</strong>.</p><p><strong>Step 4:&nbsp;</strong>First input the&nbsp;<strong>\"Current password\"</strong>.</p><p><strong>Step 5:</strong>&nbsp;Then input the&nbsp;<strong>\"New password\"&nbsp;</strong>and&nbsp;<strong>Retype password\"</strong>.</p><p><strong>Step 6:&nbsp;</strong>Press on&nbsp;<strong>\"Change Password\"</strong>.</p><p>Now your password has been successfully changed.</p><p><strong>If you forget your password you can follow these steps -</strong></p><p><img src=\"https://lh5.googleusercontent.com/HuDGRgrAnDlI2PV3nfcP1lD0jznUkzgvvUdkAa-sV6ee4QkM0djHm-8Cm04BfpPzbx3R711vOVIAJjQhdCV3-xNSCkEyiO0IHR-9JlrRCbf3RvFWFcmurE94AWl9fIBHhgMWhDGJ\" height=\"525\" width=\"381\"></p><p><strong>Step 1:&nbsp;</strong>Click on&nbsp;<strong>“Forgot Password”</strong>&nbsp;from the login page.</p><p><strong>Step 2:</strong>&nbsp;Insert the mail address registered with your Daraz account.</p><p><strong>Step 3:</strong>&nbsp;Verify through the way which is convenient for you (Email / SMS)</p><p><strong>Step 4:&nbsp;</strong>Press&nbsp;<strong>“Send Code”</strong>&nbsp;to get the Verification Code on Email/SMS.</p><p><strong>Step 5:</strong>&nbsp;Click on&nbsp;<strong>“Verify Code”</strong>&nbsp;after inserting the code you received.</p><p><strong>Step 6:&nbsp;</strong>Enter&nbsp;<strong>“New Password”</strong>&nbsp;and then&nbsp;<strong>“Retype Password”</strong>.</p><p>Now your password has been successfully changed.</p>', 1, 'how-can-i-change-the-password-of-my-account-ndm1'),
(5, 5, 5, 'How can I add a new delivery address to my account?', '<p>You can easily add a new delivery address to your account by following the below steps-</p><p><img src=\"https://lh6.googleusercontent.com/CCA0_LmJmlBJkKtnPo_a-wYDAMXsmUWSJ09PnlXqyEHIOQg_Rgi-xLYA2POb5C_zuZ-PK9kS5iZPxVcHv90pvQhfqY-JtruHqIQyiVb6wiXA8A5qToQdi4RrQMUZ96XUKRduBmiX\" height=\"604\" width=\"428\"></p><p><strong>From App:</strong></p><ul><li>Login to your Account on the Daraz app.</li><li>Click on&nbsp;<strong>“Account”</strong>&nbsp;and press on the&nbsp;<strong>“Setting”</strong>&nbsp;icon on the top right corner of the page.</li><li>Click on&nbsp;<strong>“Address Book”</strong>&nbsp;&amp; fillup following fields:</li></ul><p>- Full Name</p><p>- Phone Number</p><p>- Region</p><p>- City</p><p>- Area ( If you can’t able to find the specific&nbsp;<strong>“Area”</strong>&nbsp;name. Kindly select the nearest one.)</p><p>- Address ( Share a detailed address with&nbsp;<strong>House number, Road number, Landmark etc</strong>. )</p><ul><li>Turn on the button beside the&nbsp;<strong>“Make default shipping address”</strong>&nbsp;option.</li></ul><p>After finishing all the process while you will try to place an order, from the checkout page you can find out your new added address as your delivery address.</p>', 1, 'how-can-i-add-a-new-delivery-address-to-my-account-nzu4');

-- --------------------------------------------------------

--
-- Table structure for table `help_subcategories`
--

CREATE TABLE `help_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_subcategories`
--

INSERT INTO `help_subcategories` (`id`, `name`, `category_id`, `slug`) VALUES
(1, 'Order Placement', 2, 'order-placement-ndqx'),
(2, 'Order Management', 2, 'order-management-mta5'),
(3, 'Covid-19 Measures', 2, 'covid-19-measures-mjmx'),
(5, 'My Account', 5, 'my-account-ntg5'),
(6, 'Easy Monthly Instalments (EMI)', 3, 'easy-monthly-instalments-emi-nzg4'),
(7, 'Payment Methods', 3, 'payment-methods-ndy0'),
(8, 'dMall', 4, 'dmall-mjyz'),
(9, 'dMart', 4, 'dmart-njix'),
(10, 'dSeller', 4, 'dseller-oda1'),
(11, 'Digital Goods', 4, 'digital-goods-mjux');

-- --------------------------------------------------------

--
-- Table structure for table `home_setups`
--

CREATE TABLE `home_setups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home_slider` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_brand` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Hide, 1=Show',
  `featured_seller` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Hide, 1=Show',
  `featured_seller_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_setups`
--

INSERT INTO `home_setups` (`id`, `home_slider`, `top_brand`, `featured_seller`, `featured_seller_list`) VALUES
(1, '[\"upload\\/home\\/slider\\/njq3otqxnje1njm0ntu0.jpeg\",\"upload\\/home\\/slider\\/nju2odgxnje1njm0ntu0.png\",\"upload\\/home\\/slider\\/nzu0ntaxnje1njm0ntu0.jpeg\",\"upload\\/home\\/slider\\/nde0njcxnje1njm0ntu0.jpeg\",\"upload\\/home\\/slider\\/oda0otqxnje1njm0ntu0.jpeg\",\"upload\\/home\\/slider\\/ntq2mzcxnje1njm0ntu0.jpeg\"]', 1, 1, NULL);

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
(30, '2021_02_24_065622_create_flash_deal_products_table', 11),
(31, '2021_02_27_193245_create_footers_table', 12),
(32, '2021_02_28_202322_create_pages_table', 13),
(35, '2021_03_02_201439_create_user_verifications_table', 14),
(41, '2021_04_18_073614_create_addresses_table', 18),
(44, '2021_04_22_061625_create_orders_table', 19),
(45, '2021_04_22_061715_create_order_products_table', 19),
(59, '2021_05_04_224209_create_shops_table', 20),
(60, '2021_05_04_224318_create_shop_addresses_table', 20),
(61, '2021_05_08_165609_create_financials_table', 20),
(63, '2021_05_06_121925_add_paid_to_generals_table', 21),
(64, '2021_05_11_221319_create_business_types_table', 22),
(65, '2021_05_16_234317_create_user_business_types_table', 23),
(66, '2021_06_16_134128_create_quotations_table', 24),
(67, '2021_06_28_221642_create_help_categories_table', 25),
(68, '2021_06_28_221736_create_help_subcategories_table', 25),
(69, '2021_06_28_221747_create_help_questions_table', 25),
(70, '2021_07_04_135900_create_staffs_table', 26),
(72, '2021_07_10_001252_create_notifications_table', 27),
(73, '2021_09_20_141246_create_roles_table', 27),
(76, '2021_09_20_141413_create_role_has_permissions_table', 29);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=Seen,0=Unseen',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_type`, `user_id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(2, 'admin', 1, 'customer account', 0, '2021-07-10 00:41:39', '2021-07-10 00:41:39'),
(3, 'admin', 1, 'Nayem Islam create a new customer account', 0, '2021-07-10 00:45:21', '2021-07-10 00:45:21'),
(8, 'admin', 1, 'Nayem Islam order a product. Customer Id: CUS329383', 0, '2021-07-11 15:55:50', '2021-07-11 15:55:50'),
(9, 'admin', 1, 'anwar khan upload a new product. Seller Id: SEL637634', 0, '2021-08-22 06:02:57', '2021-08-22 06:02:57'),
(10, 'seller', 24, 'Loyel published your product', 0, '2021-08-22 06:03:14', '2021-08-22 06:03:14'),
(11, 'admin', 1, 'Nayem Islam order a product. Customer Id: CUS329383', 0, '2021-08-27 17:59:03', '2021-08-27 17:59:03'),
(12, 'admin', 1, 'anu order a product. Customer Id: CUS321136', 0, '2021-08-30 08:36:34', '2021-08-30 08:36:34'),
(13, 'seller', 24, 'Loyel update your product as a featured product', 0, '2021-08-30 10:46:33', '2021-08-30 10:46:33'),
(14, 'admin', 1, 'MD IMRAAN create a new customer account', 0, '2021-09-04 09:34:31', '2021-09-04 09:34:31'),
(15, 'admin', 1, 'Hredoy Hassan create a new customer account', 0, '2021-09-06 15:09:40', '2021-09-06 15:09:40'),
(16, 'admin', 1, 'shanaz akter create a new customer account', 0, '2021-09-07 06:59:01', '2021-09-07 06:59:01'),
(17, 'admin', 1, 'shanaz akter order a product. Customer Id: CUS971418', 0, '2021-09-07 07:06:56', '2021-09-07 07:06:56'),
(18, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 07:53:56', '2021-09-07 07:53:56'),
(19, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 07:55:08', '2021-09-07 07:55:08'),
(20, 'seller', 29, 'Loyel update your product as a featured product', 0, '2021-09-07 07:55:09', '2021-09-07 07:55:09'),
(21, 'admin', 1, 'shakil ahmed create a new seller account', 0, '2021-09-07 08:05:00', '2021-09-07 08:05:00'),
(22, 'admin', 1, 'anesa akter create a new seller account', 0, '2021-09-07 08:09:47', '2021-09-07 08:09:47'),
(23, 'admin', 1, 'rocky create a new customer account', 0, '2021-09-07 08:18:17', '2021-09-07 08:18:17'),
(24, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 08:26:24', '2021-09-07 08:26:24'),
(25, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 08:26:51', '2021-09-07 08:26:51'),
(26, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 08:37:54', '2021-09-07 08:37:54'),
(27, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 08:41:16', '2021-09-07 08:41:16'),
(28, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 08:41:29', '2021-09-07 08:41:29'),
(29, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 08:46:39', '2021-09-07 08:46:39'),
(30, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 08:48:01', '2021-09-07 08:48:01'),
(31, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 08:50:21', '2021-09-07 08:50:21'),
(32, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 08:50:31', '2021-09-07 08:50:31'),
(33, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 08:52:23', '2021-09-07 08:52:23'),
(34, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 09:01:37', '2021-09-07 09:01:37'),
(35, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 09:01:43', '2021-09-07 09:01:43'),
(36, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 09:01:54', '2021-09-07 09:01:54'),
(37, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 09:09:28', '2021-09-07 09:09:28'),
(38, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 09:09:30', '2021-09-07 09:09:30'),
(39, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 09:10:23', '2021-09-07 09:10:23'),
(40, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 09:11:29', '2021-09-07 09:11:29'),
(41, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 09:15:22', '2021-09-07 09:15:22'),
(42, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 09:17:43', '2021-09-07 09:17:43'),
(43, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 09:17:50', '2021-09-07 09:17:50'),
(44, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 09:22:17', '2021-09-07 09:22:17'),
(45, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 09:22:47', '2021-09-07 09:22:47'),
(46, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 09:22:55', '2021-09-07 09:22:55'),
(47, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 09:24:45', '2021-09-07 09:24:45'),
(48, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 09:25:28', '2021-09-07 09:25:28'),
(49, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 09:28:43', '2021-09-07 09:28:43'),
(50, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 09:29:38', '2021-09-07 09:29:38'),
(51, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 09:30:36', '2021-09-07 09:30:36'),
(52, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 09:31:55', '2021-09-07 09:31:55'),
(53, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 09:33:54', '2021-09-07 09:33:54'),
(54, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 09:35:18', '2021-09-07 09:35:18'),
(55, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 09:36:17', '2021-09-07 09:36:17'),
(56, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 09:37:04', '2021-09-07 09:37:04'),
(57, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 09:42:08', '2021-09-07 09:42:08'),
(58, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:09', '2021-09-07 09:42:09'),
(59, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 09:42:10', '2021-09-07 09:42:10'),
(60, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:10', '2021-09-07 09:42:10'),
(61, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:12', '2021-09-07 09:42:12'),
(62, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 09:42:13', '2021-09-07 09:42:13'),
(63, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 09:42:14', '2021-09-07 09:42:14'),
(64, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:15', '2021-09-07 09:42:15'),
(65, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 09:42:16', '2021-09-07 09:42:16'),
(66, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:16', '2021-09-07 09:42:16'),
(67, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 09:42:18', '2021-09-07 09:42:18'),
(68, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:19', '2021-09-07 09:42:19'),
(69, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 09:42:21', '2021-09-07 09:42:21'),
(70, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:22', '2021-09-07 09:42:22'),
(71, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:23', '2021-09-07 09:42:23'),
(72, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 09:42:24', '2021-09-07 09:42:24'),
(73, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 09:42:25', '2021-09-07 09:42:25'),
(74, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 09:42:27', '2021-09-07 09:42:27'),
(75, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:27', '2021-09-07 09:42:27'),
(76, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:28', '2021-09-07 09:42:28'),
(77, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:29', '2021-09-07 09:42:29'),
(78, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:30', '2021-09-07 09:42:30'),
(79, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 09:42:31', '2021-09-07 09:42:31'),
(80, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 09:42:34', '2021-09-07 09:42:34'),
(81, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 09:42:34', '2021-09-07 09:42:34'),
(82, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:39', '2021-09-07 09:42:39'),
(83, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:40', '2021-09-07 09:42:40'),
(84, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 09:42:42', '2021-09-07 09:42:42'),
(85, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:44', '2021-09-07 09:42:44'),
(86, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 09:42:46', '2021-09-07 09:42:46'),
(87, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:46', '2021-09-07 09:42:46'),
(88, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 09:42:47', '2021-09-07 09:42:47'),
(89, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 09:42:48', '2021-09-07 09:42:48'),
(90, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 09:56:39', '2021-09-07 09:56:39'),
(91, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 10:02:28', '2021-09-07 10:02:28'),
(92, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 10:03:26', '2021-09-07 10:03:26'),
(93, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 10:05:53', '2021-09-07 10:05:53'),
(94, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 10:05:53', '2021-09-07 10:05:53'),
(95, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 10:05:54', '2021-09-07 10:05:54'),
(96, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:08:23', '2021-09-07 10:08:23'),
(97, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:08:28', '2021-09-07 10:08:28'),
(98, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:11:18', '2021-09-07 10:11:18'),
(99, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 10:11:46', '2021-09-07 10:11:46'),
(100, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 10:12:24', '2021-09-07 10:12:24'),
(101, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:14:17', '2021-09-07 10:14:17'),
(102, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:14:35', '2021-09-07 10:14:35'),
(103, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:17:23', '2021-09-07 10:17:23'),
(104, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 10:19:05', '2021-09-07 10:19:05'),
(105, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:20:08', '2021-09-07 10:20:08'),
(106, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:20:29', '2021-09-07 10:20:29'),
(107, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:22:32', '2021-09-07 10:22:32'),
(108, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:27:26', '2021-09-07 10:27:26'),
(109, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 10:27:51', '2021-09-07 10:27:51'),
(110, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:28:17', '2021-09-07 10:28:17'),
(111, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:33:01', '2021-09-07 10:33:01'),
(112, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:33:04', '2021-09-07 10:33:04'),
(113, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:34:08', '2021-09-07 10:34:08'),
(114, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:39:17', '2021-09-07 10:39:17'),
(115, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:39:19', '2021-09-07 10:39:19'),
(116, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:41:10', '2021-09-07 10:41:10'),
(117, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 10:43:51', '2021-09-07 10:43:51'),
(118, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 10:45:17', '2021-09-07 10:45:17'),
(119, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:46:22', '2021-09-07 10:46:22'),
(120, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:47:33', '2021-09-07 10:47:33'),
(121, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:48:32', '2021-09-07 10:48:32'),
(122, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 10:52:03', '2021-09-07 10:52:03'),
(123, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:52:34', '2021-09-07 10:52:34'),
(124, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:53:04', '2021-09-07 10:53:04'),
(125, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:53:45', '2021-09-07 10:53:45'),
(126, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 10:58:39', '2021-09-07 10:58:39'),
(127, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 10:58:45', '2021-09-07 10:58:45'),
(128, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 10:58:56', '2021-09-07 10:58:56'),
(129, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 10:59:01', '2021-09-07 10:59:01'),
(130, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 11:03:43', '2021-09-07 11:03:43'),
(131, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 11:03:50', '2021-09-07 11:03:50'),
(132, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 11:04:08', '2021-09-07 11:04:08'),
(133, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 11:05:27', '2021-09-07 11:05:27'),
(134, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 11:07:52', '2021-09-07 11:07:52'),
(135, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-07 11:08:49', '2021-09-07 11:08:49'),
(136, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 11:10:01', '2021-09-07 11:10:01'),
(137, 'admin', 1, 'Hredoy Hassan upload a new product. Seller Id: SEL896207', 0, '2021-09-07 11:10:08', '2021-09-07 11:10:08'),
(138, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 11:11:58', '2021-09-07 11:11:58'),
(139, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 11:13:09', '2021-09-07 11:13:09'),
(140, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:14:34', '2021-09-07 11:14:34'),
(141, 'seller', 31, 'Loyel unpublished your product', 0, '2021-09-07 11:14:34', '2021-09-07 11:14:34'),
(142, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:14:36', '2021-09-07 11:14:36'),
(143, 'seller', 31, 'Loyel unpublished your product', 0, '2021-09-07 11:14:36', '2021-09-07 11:14:36'),
(144, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:14:37', '2021-09-07 11:14:37'),
(145, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:14:39', '2021-09-07 11:14:39'),
(146, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:14:43', '2021-09-07 11:14:43'),
(147, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:14:44', '2021-09-07 11:14:44'),
(148, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:14:45', '2021-09-07 11:14:45'),
(149, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:14:46', '2021-09-07 11:14:46'),
(150, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:14:47', '2021-09-07 11:14:47'),
(151, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:14:49', '2021-09-07 11:14:49'),
(152, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:14:51', '2021-09-07 11:14:51'),
(153, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:14:52', '2021-09-07 11:14:52'),
(154, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:14:54', '2021-09-07 11:14:54'),
(155, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:14:56', '2021-09-07 11:14:56'),
(156, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:14:58', '2021-09-07 11:14:58'),
(157, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:00', '2021-09-07 11:15:00'),
(158, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:00', '2021-09-07 11:15:00'),
(159, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:02', '2021-09-07 11:15:02'),
(160, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:04', '2021-09-07 11:15:04'),
(161, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:15:06', '2021-09-07 11:15:06'),
(162, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:08', '2021-09-07 11:15:08'),
(163, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:09', '2021-09-07 11:15:09'),
(164, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:11', '2021-09-07 11:15:11'),
(165, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:15:12', '2021-09-07 11:15:12'),
(166, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:15:13', '2021-09-07 11:15:13'),
(167, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:15', '2021-09-07 11:15:15'),
(168, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:16', '2021-09-07 11:15:16'),
(169, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:18', '2021-09-07 11:15:18'),
(170, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:19', '2021-09-07 11:15:19'),
(171, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:21', '2021-09-07 11:15:21'),
(172, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:29', '2021-09-07 11:15:29'),
(173, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:29', '2021-09-07 11:15:29'),
(174, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:15:30', '2021-09-07 11:15:30'),
(175, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:32', '2021-09-07 11:15:32'),
(176, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:33', '2021-09-07 11:15:33'),
(177, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:36', '2021-09-07 11:15:36'),
(178, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:38', '2021-09-07 11:15:38'),
(179, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:15:46', '2021-09-07 11:15:46'),
(180, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:46', '2021-09-07 11:15:46'),
(181, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:48', '2021-09-07 11:15:48'),
(182, 'seller', 32, 'Loyel unpublished your product', 0, '2021-09-07 11:15:48', '2021-09-07 11:15:48'),
(183, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:50', '2021-09-07 11:15:50'),
(184, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:51', '2021-09-07 11:15:51'),
(185, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:15:52', '2021-09-07 11:15:52'),
(186, 'seller', 31, 'Loyel unpublished your product', 0, '2021-09-07 11:15:53', '2021-09-07 11:15:53'),
(187, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:15:53', '2021-09-07 11:15:53'),
(188, 'seller', 31, 'Loyel published your product', 0, '2021-09-07 11:15:54', '2021-09-07 11:15:54'),
(189, 'seller', 30, 'Loyel published your product', 0, '2021-09-07 11:15:56', '2021-09-07 11:15:56'),
(190, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:15:57', '2021-09-07 11:15:57'),
(191, 'seller', 28, 'Loyel published your product', 0, '2021-09-07 11:15:59', '2021-09-07 11:15:59'),
(192, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-07 11:16:44', '2021-09-07 11:16:44'),
(193, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-07 11:17:25', '2021-09-07 11:17:25'),
(194, 'seller', 29, 'Loyel published your product', 0, '2021-09-07 11:22:56', '2021-09-07 11:22:56'),
(195, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:22:57', '2021-09-07 11:22:57'),
(196, 'seller', 32, 'Loyel unpublished your product', 0, '2021-09-07 11:22:57', '2021-09-07 11:22:57'),
(197, 'seller', 32, 'Loyel published your product', 0, '2021-09-07 11:22:59', '2021-09-07 11:22:59'),
(198, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:21', '2021-09-07 11:23:21'),
(199, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:24', '2021-09-07 11:23:24'),
(200, 'seller', 28, 'Loyel remove your product as a featured product', 0, '2021-09-07 11:23:24', '2021-09-07 11:23:24'),
(201, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:28', '2021-09-07 11:23:28'),
(202, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:29', '2021-09-07 11:23:29'),
(203, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:32', '2021-09-07 11:23:32'),
(204, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:36', '2021-09-07 11:23:36'),
(205, 'seller', 32, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:36', '2021-09-07 11:23:36'),
(206, 'seller', 32, 'Loyel remove your product as a featured product', 0, '2021-09-07 11:23:37', '2021-09-07 11:23:37'),
(207, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:39', '2021-09-07 11:23:39'),
(208, 'seller', 29, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:42', '2021-09-07 11:23:42'),
(209, 'seller', 32, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:44', '2021-09-07 11:23:44'),
(210, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:45', '2021-09-07 11:23:45'),
(211, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:49', '2021-09-07 11:23:49'),
(212, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:51', '2021-09-07 11:23:51'),
(213, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:54', '2021-09-07 11:23:54'),
(214, 'seller', 32, 'Loyel update your product as a featured product', 0, '2021-09-07 11:23:57', '2021-09-07 11:23:57'),
(215, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:01', '2021-09-07 11:24:01'),
(216, 'seller', 32, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:04', '2021-09-07 11:24:04'),
(217, 'seller', 29, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:05', '2021-09-07 11:24:05'),
(218, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:08', '2021-09-07 11:24:08'),
(219, 'seller', 32, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:10', '2021-09-07 11:24:10'),
(220, 'seller', 30, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:12', '2021-09-07 11:24:12'),
(221, 'seller', 28, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:16', '2021-09-07 11:24:16'),
(222, 'seller', 29, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:18', '2021-09-07 11:24:18'),
(223, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-07 11:24:19', '2021-09-07 11:24:19'),
(224, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-07 11:29:27', '2021-09-07 11:29:27'),
(225, 'admin', 1, 'anesa akter order a product. Customer Id: CUS8901610', 0, '2021-09-07 12:37:59', '2021-09-07 12:37:59'),
(226, 'admin', 1, 'anesa akter order a product. Customer Id: CUS8901610', 0, '2021-09-07 12:38:31', '2021-09-07 12:38:31'),
(227, 'admin', 1, 'anesa akter order a product. Customer Id: CUS8901610', 0, '2021-09-07 13:25:43', '2021-09-07 13:25:43'),
(228, 'admin', 1, 'anesa akter order a product. Customer Id: CUS8901610', 0, '2021-09-07 13:27:44', '2021-09-07 13:27:44'),
(229, 'seller', 31, 'Loyel published your product', 0, '2021-09-08 03:43:51', '2021-09-08 03:43:51'),
(230, 'seller', 31, 'Loyel unpublished your product', 0, '2021-09-08 03:43:53', '2021-09-08 03:43:53'),
(231, 'seller', 31, 'Loyel published your product', 0, '2021-09-08 03:43:54', '2021-09-08 03:43:54'),
(232, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:43:56', '2021-09-08 03:43:56'),
(233, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:43:58', '2021-09-08 03:43:58'),
(234, 'seller', 31, 'Loyel remove your product as a featured product', 0, '2021-09-08 03:43:59', '2021-09-08 03:43:59'),
(235, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:00', '2021-09-08 03:44:00'),
(236, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:02', '2021-09-08 03:44:02'),
(237, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:08', '2021-09-08 03:44:08'),
(238, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:09', '2021-09-08 03:44:09'),
(239, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:17', '2021-09-08 03:44:17'),
(240, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:18', '2021-09-08 03:44:18'),
(241, 'seller', 31, 'Loyel remove your product as a featured product', 0, '2021-09-08 03:44:18', '2021-09-08 03:44:18'),
(242, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:20', '2021-09-08 03:44:20'),
(243, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:23', '2021-09-08 03:44:23'),
(244, 'seller', 31, 'Loyel update your product as a featured product', 0, '2021-09-08 03:44:23', '2021-09-08 03:44:23'),
(245, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 04:30:22', '2021-09-08 04:30:22'),
(246, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 04:47:25', '2021-09-08 04:47:25'),
(247, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 04:54:13', '2021-09-08 04:54:13'),
(248, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 04:55:01', '2021-09-08 04:55:01'),
(249, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 05:07:04', '2021-09-08 05:07:04'),
(250, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 05:24:16', '2021-09-08 05:24:16'),
(251, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 06:16:43', '2021-09-08 06:16:43'),
(252, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 06:25:11', '2021-09-08 06:25:11'),
(253, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 06:33:29', '2021-09-08 06:33:29'),
(254, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 06:39:23', '2021-09-08 06:39:23'),
(255, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 06:45:21', '2021-09-08 06:45:21'),
(256, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 06:47:19', '2021-09-08 06:47:19'),
(257, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 06:51:33', '2021-09-08 06:51:33'),
(258, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 06:54:35', '2021-09-08 06:54:35'),
(259, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:00:22', '2021-09-08 07:00:22'),
(260, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:01:35', '2021-09-08 07:01:35'),
(261, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 07:07:20', '2021-09-08 07:07:20'),
(262, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:07:36', '2021-09-08 07:07:36'),
(263, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:07:46', '2021-09-08 07:07:46'),
(264, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:12:22', '2021-09-08 07:12:22'),
(265, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:14:19', '2021-09-08 07:14:19'),
(266, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:17:04', '2021-09-08 07:17:04'),
(267, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 07:18:35', '2021-09-08 07:18:35'),
(268, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:23:03', '2021-09-08 07:23:03'),
(269, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:23:56', '2021-09-08 07:23:56'),
(270, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:29:53', '2021-09-08 07:29:53'),
(271, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:30:29', '2021-09-08 07:30:29'),
(272, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 07:32:46', '2021-09-08 07:32:46'),
(273, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 07:34:17', '2021-09-08 07:34:17'),
(274, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 07:36:29', '2021-09-08 07:36:29'),
(275, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:36:34', '2021-09-08 07:36:34'),
(276, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:37:56', '2021-09-08 07:37:56'),
(277, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:41:46', '2021-09-08 07:41:46'),
(278, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 07:43:29', '2021-09-08 07:43:29'),
(279, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 07:43:38', '2021-09-08 07:43:38'),
(280, 'admin', 1, 'shanaz akter upload a new product. Seller Id: SEL971418', 0, '2021-09-08 07:48:08', '2021-09-08 07:48:08'),
(281, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 07:51:14', '2021-09-08 07:51:14'),
(282, 'admin', 1, 'shakil ahmed upload a new product. Seller Id: SEL786669', 0, '2021-09-08 07:52:35', '2021-09-08 07:52:35'),
(283, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 07:54:07', '2021-09-08 07:54:07'),
(284, 'admin', 1, 'rocky upload a new product. Seller Id: SEL1529311', 0, '2021-09-08 08:03:19', '2021-09-08 08:03:19'),
(285, 'admin', 1, 'anesa akter order a product. Customer Id: CUS8901610', 0, '2021-09-08 09:09:02', '2021-09-08 09:09:02'),
(286, 'seller', 32, 'Loyel published your product', 0, '2021-09-08 13:30:04', '2021-09-08 13:30:04'),
(287, 'seller', 32, 'Loyel published your product', 0, '2021-09-08 13:30:08', '2021-09-08 13:30:08'),
(288, 'seller', 30, 'Loyel published your product', 0, '2021-09-08 13:30:11', '2021-09-08 13:30:11'),
(289, 'seller', 31, 'Loyel published your product', 0, '2021-09-08 13:30:12', '2021-09-08 13:30:12'),
(290, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 18:23:21', '2021-09-08 18:23:21'),
(291, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 18:29:35', '2021-09-08 18:29:35'),
(292, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 18:36:38', '2021-09-08 18:36:38'),
(293, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 18:46:35', '2021-09-08 18:46:35'),
(294, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 18:52:57', '2021-09-08 18:52:57'),
(295, 'admin', 1, 'anesa akter upload a new product. Seller Id: SEL8901610', 0, '2021-09-08 18:57:33', '2021-09-08 18:57:33'),
(296, 'admin', 1, 'MD IMRAAN order a product. Customer Id: CUS211326', 0, '2021-09-11 10:16:27', '2021-09-11 10:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `no_of_product` int(11) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `shipping` double(8,2) NOT NULL DEFAULT 0.00,
  `total` double(8,2) NOT NULL,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Unpaid 1 = Paid',
  `delivered_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Pending 1 = Confirmed 2 = On delivery 3 = Delivery 4 = Cancel',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_code`, `payment_type`, `address_id`, `no_of_product`, `subtotal`, `shipping`, `total`, `payment_status`, `delivered_status`, `status`, `created_at`, `updated_at`) VALUES
(7, 23, 'LYB00000001', 1, 7, 1, 117000.00, 0.00, 117000.00, 1, 3, 0, '2021-07-11 15:55:50', '2021-07-11 15:55:50'),
(8, 23, 'LYB00000008', 1, 7, 1, 189000.00, 0.00, 189000.00, 1, 3, 0, '2021-08-27 17:59:03', '2021-08-27 17:59:03'),
(9, 26, 'LYB00000009', 1, 9, 1, 200000.00, 0.00, 200000.00, 0, 1, 0, '2021-08-30 08:36:34', '2021-08-30 08:36:34'),
(10, 29, 'LYB00000010', 1, 12, 1, 180000.00, 0.00, 180000.00, 1, 3, 0, '2021-09-07 07:06:56', '2021-09-07 07:06:56'),
(11, 31, 'LYB00000011', 1, 13, 1, 170000.00, 0.00, 170000.00, 0, 0, 0, '2021-09-07 12:37:59', '2021-09-07 12:37:59'),
(12, 31, 'LYS00000012', 1, 13, 1, 1360.00, 0.00, 1360.00, 0, 0, 0, '2021-09-07 12:38:31', '2021-09-07 12:38:31'),
(13, 31, 'LYL00000013', 1, 13, 1, 280.00, 0.00, 280.00, 0, 0, 0, '2021-09-07 13:25:43', '2021-09-07 13:25:43'),
(14, 31, 'LYL00000014', 1, 13, 1, 850.00, 0.00, 850.00, 0, 0, 0, '2021-09-07 13:27:44', '2021-09-07 13:27:44'),
(15, 31, 'LYL00000015', 1, 13, 1, 600.00, 0.00, 600.00, 0, 0, 0, '2021-09-08 09:09:02', '2021-09-08 09:09:02'),
(16, 27, 'LYS00000016', 1, 17, 1, 9000.00, 0.00, 9000.00, 0, 0, 0, '2021-09-11 10:16:27', '2021-09-11 10:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `discount_price` double(8,2) NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Yes, 2=No',
  `discount_value` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Percent',
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Simple Product, 2=Variable Product, 3=Volume tier Pricing',
  `shipping` double(8,2) NOT NULL DEFAULT 0.00,
  `total` double(8,2) NOT NULL,
  `product_details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `qty`, `unit_price`, `discount_price`, `discount`, `discount_value`, `discount_type`, `price_type`, `shipping`, `total`, `product_details`, `sku`) VALUES
(11, 7, 7, 13, 10000.00, 9000.00, 1, 10.00, 'Percent', 2, 0.00, 117000.00, '{\"color\":\"Gold\",\"Ram\":\"8GB\",\"Storage\":\"32GB\"}', 'MTYXNTC0NTY5NDI1NJY'),
(12, 8, 7, 14, 15000.00, 13500.00, 1, 10.00, 'Percent', 2, 0.00, 189000.00, '{\"color\":\"Black\",\"Ram\":\"4GB\",\"Storage\":\"64GB\"}', 'MTYXNTC0NTY5NDYYOTE'),
(13, 9, 14, 20, 10000.00, 10000.00, 2, 0.00, 'Percent', 1, 0.00, 200000.00, '{\"color\":\"Black\",\"Storage\":\"32GB\",\"Size\":\"Large\",\"Ram\":\"8GB\"}', 'MTYYMZU1ODMXOTCZODA'),
(14, 10, 7, 10, 20000.00, 18000.00, 1, 10.00, 'Percent', 2, 0.00, 180000.00, '{\"color\":\"Red\",\"Ram\":\"8GB\",\"Storage\":\"64GB\"}', 'MTYXNTC0NTY5NDG0NJU'),
(15, 11, 39, 5, 40000.00, 34000.00, 1, 15.00, 'Percent', 1, 0.00, 170000.00, '', 'MTYZMTAWNJU2NZMWMTK'),
(16, 12, 55, 2, 850.00, 680.00, 1, 20.00, 'Percent', 1, 0.00, 1360.00, '', 'MTYZMTAWOTMWODE3MDM'),
(17, 13, 63, 1, 280.00, 280.00, 2, 0.00, 'Percent', 1, 0.00, 280.00, '', 'MTYZMTAXMDAWODU4NDC'),
(18, 14, 59, 1, 850.00, 850.00, 2, 0.00, 'Percent', 1, 0.00, 850.00, '', 'MTYZMTAWOTY1NZGXNTC'),
(19, 15, 99, 1, 600.00, 600.00, 2, 0.00, 'Percent', 1, 0.00, 600.00, '', 'MTYZMTAXMZQ0NTU5OTQ'),
(20, 16, 97, 5, 2000.00, 1800.00, 1, 10.00, 'Percent', 1, 0.00, 9000.00, '', 'MTYZMTAXMZE4OTQXMDK');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms_condition` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `terms_condition`, `privacy`, `about_us`) VALUES
(1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_variations`
--

CREATE TABLE `price_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 1.00,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `max_qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_variations`
--

INSERT INTO `price_variations` (`id`, `product_id`, `price`, `min_qty`, `max_qty`) VALUES
(4, 15, 5800.00, 1, 2),
(5, 15, 5200.00, 3, 5),
(6, 15, 4800.00, 6, 10),
(9, 17, 35000.00, 1, 5),
(10, 17, 32000.00, 6, 10),
(11, 17, 30000.00, 11, 15),
(12, 20, 147000.00, 1, 10),
(13, 20, 140000.00, 11, 30),
(14, 20, 130000.00, 31, 50),
(15, 22, 3000.00, 1, 30),
(16, 22, 2500.00, 31, 60),
(17, 29, 450.00, 1, 20),
(18, 29, 400.00, 21, 30),
(19, 29, 380.00, 31, 40),
(20, 29, 350.00, 41, 50),
(21, 37, 15000.00, 1, 30),
(22, 37, 14200.00, 31, 50),
(23, 56, 3000.00, 1, 20),
(24, 56, 2600.00, 21, 50),
(25, 56, 2200.00, 51, 100),
(26, 61, 100000.00, 1, 10),
(27, 61, 90000.00, 11, 30),
(28, 65, 70000.00, 1, 10),
(29, 65, 63000.00, 11, 30),
(30, 65, 57000.00, 31, 47),
(31, 73, 90000.00, 1, 40),
(32, 86, 1650.00, 1, 30),
(33, 86, 1500.00, 31, 80),
(34, 93, 6000.00, 1, 60),
(35, 95, 9500.00, 1, 20),
(36, 95, 8500.00, 21, 45),
(37, 112, 23000.00, 1, 50),
(38, 112, 21000.00, 51, 100),
(39, 140, 200.00, 1, 50),
(40, 140, 180.00, 51, 120);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_position` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `Refundable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=True, 2=False',
  `weight` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dimension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=New, 2=Used',
  `attribute` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Yes, 2=No',
  `attribute_option` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_image` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Yes, 2=No',
  `color` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_manage` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Yes, 2=No',
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `max_qty` int(11) NOT NULL DEFAULT 1,
  `price_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Simple Product, 2=Variable Product, 3=Volume tier Pricing',
  `stock_manage` tinyint(1) NOT NULL DEFAULT 2 COMMENT '2=Yes, 1=No',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double(8,2) NOT NULL DEFAULT 1.00,
  `discount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Yes, 2=No',
  `discount_value` double(8,2) NOT NULL DEFAULT 1.00,
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Percent',
  `discount_method` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Simple, 2=Variation',
  `warranty_type` tinyint(1) NOT NULL DEFAULT 0,
  `warranty_period` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Cost, 2=Free',
  `shipping_cost` double(8,2) NOT NULL DEFAULT 1.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `total_sell` int(11) NOT NULL DEFAULT 0,
  `total_view` bigint(20) NOT NULL DEFAULT 0,
  `wishlist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `cat_position`, `name`, `added_by`, `user_id`, `brand_id`, `unit_id`, `Refundable`, `weight`, `tags`, `dimension`, `product_type`, `attribute`, `attribute_option`, `photos`, `thumbnail_img`, `video_link`, `description`, `color_image`, `color`, `qty_manage`, `min_qty`, `max_qty`, `price_type`, `stock_manage`, `quantity`, `price`, `discount`, `discount_value`, `discount_type`, `discount_method`, `warranty_type`, `warranty_period`, `shipping`, `shipping_cost`, `status`, `slug`, `sku`, `featured`, `published`, `total_sell`, `total_view`, `wishlist`) VALUES
(5, 25, NULL, NULL, 1, 'Beetroot 500gm', 'admin', 1, NULL, 6, 2, '.5', '[]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mty0ndaxnje1njuzmzk1.jpeg\"]', 'upload/product/thumbnail/mtayntixnje1njuzmzk1.jpeg', '', '', 2, '[]', 2, 1, 1, 1, 2, 67, 50.00, 2, 1.00, 'Percent', 1, 0, '', 1, 0.00, 1, 'beetroot-500gm-ota2', 'MTYXNTY1MZM5NTG5MJA', 0, 1, 0, 0, '[]'),
(7, 26, NULL, NULL, 1, 'Original Second Hand Smartphones S7 edge S8 S9 plus Used Unlocked Mobile Phones', 'admin', 1, 6, 4, 1, '.58', '[\"Samsung\",\"Mobile\",\"Phone\"]', '150 X 200 X 32', 2, 1, '[{\"name\":\"Ram\",\"value\":[\"4GB\",\"8GB\"]},{\"name\":\"Storage\",\"value\":[\"32GB\",\"64GB\"]}]', '[\"upload\\/product\\/photos\\/mjqxnzyxnje1nzq1njkz.jpeg\",\"upload\\/product\\/photos\\/mtkzntuxnje1nzq1njkz.jpeg\",\"upload\\/product\\/photos\\/ndq1mtuxnje1nzq1njkz.png\",\"upload\\/product\\/photos\\/nje3otaxnje1nzq1njkz.png\",\"upload\\/product\\/photos\\/nzgwntkxnje1nzq1njk0.jpeg\",\"upload\\/product\\/photos\\/nji4ndyxnje1nzq1njk0.jpeg\",\"upload\\/product\\/photos\\/odu0otmxnje1nzq1njk0.png\"]', 'upload/product/thumbnail/otmwnjuxnje1nzq1njkz.jpeg', '', '<p><strong>Quick Details</strong></p><p>Condition:</p><p>Used original phone</p><p>Certification:</p><p>FCC, ce</p><p>RAM:</p><p>1g</p><p>CPU:</p><p>Dual Core</p><p>Cellular:</p><p>GSM/WCDMA/LTE</p><p>Design:</p><p>SLIDER</p><p>Screen:</p><p>4.0-4.9\"</p><p>Camera:</p><p>&gt; 7MP</p><p>Operation System:</p><p>IOS</p><p>Display Color:</p><p>Color</p><p>Brand Name:</p><p>Used Phones</p><p>Feature:</p><p>3G, wifi, 5G, GPS Navigation, MP3 Playback, Touch Screen, bluetooth, EMAIL, Dual SIM Card, FM Radio, Auto Focus, 4g, Qwerty Keyboard, Build in Flash, Waterproof, Sunscreen</p><p>Model Number:</p><p>1</p><p>Place of Origin:</p><p>Thailand</p><p>Screen Resolution:</p><p>1280x720</p><p>Display Type:</p><p>IPS</p><p>Product Name:</p><p>Used Phones</p><p><strong>Supply Ability</strong></p><p>Supply Ability:</p><p>100000 Piece/Pieces per Week</p><p><strong>Packaging &amp; Delivery</strong></p><p>Packaging Details</p><p>Buyer\'s request</p><p>Port</p><p>Bangkok</p><p>Lead Time&nbsp;:</p><p>Quantity(Pieces)1 - 100&gt;100Est. Time(days)10To be negotiated</p><p class=\"ql-align-center\"><strong>Fingerprint unlock smart phone 6.7 inch 4G used mobile phone smartphones support OEM / ODM for your brand&nbsp;</strong></p><p class=\"ql-align-center\"><strong>&nbsp;</strong></p><p><strong>Model No</strong>A70pro<strong>Platform</strong>MTK6595&nbsp;<strong>Standby</strong>Dual sim dual standby(A slot support SIM card,</p><p>another slot support SIM card or TF card)</p><p><strong>Screen</strong>6.7 HD+ Dewdrop 720*1560<strong>Speaker</strong>1511 Box Speaker<strong>Frequency</strong>GSM850/900/1800/1900MHz, 3G: WCDMA850/2100MHz,</p><p>4G LTE</p><p><strong>Vibration</strong>&nbsp;Support<strong>Colors</strong>&nbsp;Bright Black/Wine red/ Aurora blue<strong>Memory</strong>&nbsp;6GB RAM+128GB ROM<strong>Multi Media</strong>&nbsp;MP3/MP4/3GP/FM Radio/Bluetooth<strong>Camera</strong>6MP+18MP<strong>Multi Function</strong>Full screen, Face recognition, finger print, Dual SIM, Wifi,</p><p>GPS, Gravity Sensor, Alarm ,Calendar ,Calculator ,</p><p>Audio recorder ,Video recorder, WAP/MMS/GPR,</p><p>Image viewer,E-Book,World clock,</p><p>Tasks card rear flash IML rear cover</p><p><strong>Languages</strong>Multi-language support<strong>Others</strong>Android OS 9.1 System<strong>Battery</strong>3800Mah Lithium-ion battery</p>', 1, '[{\"name\":\"Red\",\"image\":\"upload\\/product\\/photos\\/mjcxotcxnje1nzq1njk0.jpeg\"},{\"name\":\"Gold\",\"image\":\"upload\\/product\\/photos\\/mtm4ntcxnje1nzq1njk0.png\"},{\"name\":\"Black\",\"image\":\"upload\\/product\\/photos\\/mjazmjgxnje1nzq1njk0.jpeg\"}]', 1, 10, 50, 2, 2, 1, 0.00, 1, 10.00, 'Percent', 1, 3, '6 Month', 2, 1.00, 1, 'original-second-hand-smartphones-s7-edge-s8-s9-plus-used-unlocked-mobile-phones-nty3', 'MTYXNTC0NTY5NDIXMZM', 0, 1, 0, 11, '[]'),
(15, 26, NULL, NULL, 1, 'processor core i5 4th gen', 'seller', 24, 4, 4, 1, '', '[\"i5\",\"corei5\",\"intel\",\"processor\",\"computer\",\"harddrive\",\"drive\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntq1mzexnji5njeymtc3.png\",\"upload\\/product\\/photos\\/ntcxndkxnji5njeymtc3.jpeg\",\"upload\\/product\\/photos\\/mtk5mtkxnji5njeymtc3.jpeg\",\"upload\\/product\\/photos\\/mza4nzcxnji5njeymtc3.jpeg\"]', 'upload/product/thumbnail/ota2mjixnji5njeymtc3.jpeg', 'https://www.youtube.com/embed/iXonBG98Atg', '<h2>Specification</h2><p><br></p><p><strong>Basic Information</strong></p><p>BrandIntelModeli5-10500Base Frequency3.10 GHzMaximum Turbo Frequency4.50 GHzCache12 MB SmartCacheCores6Threads12Default TDP65 W</p><p><strong>Memory Specifications</strong></p><p>Maximum Size128 GBMaximum Speed2666TypeDDR4Max Number of Channels2</p><p><strong>Graphics Specifications</strong></p><p>Processor GraphicsIntel UHD Graphics 630Base Frequency350 MHzMax Dynamic Frequency1.15 GHzMax Video Memory64 GBMax ResolutionMax Resolution (HDMI 1.4): 4096x2304@30Hz</p><p>Max Resolution (DP): 4096x2304@60Hz</p><p>Max Resolution (eDP - Integrated Flat Panel): 4096x2304@60HzCore Count6</p><p><strong>Warranty Information</strong></p><p>Manufacturing Warranty03 Years Warranty</p><h2>Description</h2><h2>Intel 4th Gen Core i5-4500 Processor&nbsp;</h2><p>This i5-10500 Processor comes with an Intel UHD Graphics 630 graphics. This new 10th gen Comet Lake microarchitecture is manufactured with the 14nm process that comes with six cores but lacks in HyperThreading. As this chip is updated to the latest BIOS revision, it nicely fits into any Intel 400-series motherboard. Focusing on this, all the major motherboard manufacturers have already started BIOS updates for their 400-series lineup. These Processors also support 64-bit computing on Intel architecture require an Intel 64 architecture-enabled BIOS.</p><h3>Core Benefits of the Processor</h3><p>Intel 10th Generation Core i5-10500 Processor having the base frequency of 3.10 GHz that can be reached as max turbo frequency at 4.50 GHz. It has the SmartCache of 12 MB containing 6 cores and 12 threads. With the bus speed of 8 GT/s DMI3, it has thermal design power (TDP) rating of 65W. This latest microchip has few expansion options such 3.0 PCI express revision having configured up to 1x16, 2x8, 1x8+2x4, and maximum 16 lanes. Considering the memory this processor has dual-channel of max 128GB of the size that supports up to DDR4-2666 bus speed.</p><h2>What is the price of Intel Core i5-4500 Processor in Bangladesh?</h2><p>The latest price of Intel Core i5-10500 Processor in Bangladesh is 17,700৳. You can buy the Intel Core i5-10500 Processor at best price from our website or visit any of our showrooms.</p>', 2, '[]', 2, 1, 1, 3, 2, 1, 0.00, 2, 1.00, 'Percent', 1, 1, '2 years', 1, 45.00, 1, 'processor-core-i5-4th-gen-ndkw', 'MTYYOTYXMJE3NZYYNDM', 1, 1, 0, 12, NULL),
(17, 19, 81, 257, 3, 'Dubai Green Lace Up Sequined Wedding Dresses 2020 Sweetheart Sexy Luxury Bridal Gowns YEWEN 66742 Custom Made', 'seller', 29, 8, 4, 2, '4', '[\"gown\",\"frog\",\"dress\",\"jama\",\"women\",\"marriedress\",\"widdingdress\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odqzmjgxnjmxmdaxmjm2.jpeg\",\"upload\\/product\\/photos\\/mjk3ndkxnjmxmdaxmjm2.jpeg\",\"upload\\/product\\/photos\\/odeyoduxnjmxmdaxmjm2.jpeg\",\"upload\\/product\\/photos\\/odkxmtaxnjmxmdaxmjm2.jpeg\"]', 'upload/product/thumbnail/ntyymtuxnjmxmdaxmjm2.jpeg', 'https://www.youtube.com/watch?v=MIpe_xb0x90', '<p>Item specifics</p><p><span style=\"color: rgb(153, 153, 153);\">Brand Name:</span></p><p>YEWEN</p><p><span style=\"color: rgb(153, 153, 153);\">Actual Images:</span></p><p>Yes</p><p><span style=\"color: rgb(153, 153, 153);\">Neckline:</span></p><p>Strapless</p><p><span style=\"color: rgb(153, 153, 153);\">Train:</span></p><p>Chapel Train</p><p><span style=\"color: rgb(153, 153, 153);\">Dresses Length:</span></p><p>Floor-Length</p><p><span style=\"color: rgb(153, 153, 153);\">Material:</span></p><p>Polyester</p><p><span style=\"color: rgb(153, 153, 153);\">Silhouette:</span></p><p>Ball Gown</p><p><span style=\"color: rgb(153, 153, 153);\">Occasion:</span></p><p>Christmas</p><p><span style=\"color: rgb(153, 153, 153);\">Item Type:</span></p><p>Evening Dresses</p><p><span style=\"color: rgb(153, 153, 153);\">Decoration:</span></p><p>Appliques</p><p><span style=\"color: rgb(153, 153, 153);\">Decoration:</span></p><p>Lace</p><p><span style=\"color: rgb(153, 153, 153);\">Sleeve Style:</span></p><p>Off the Shoulder</p><p><span style=\"color: rgb(153, 153, 153);\">Sleeve Length(cm):</span></p><p>Sleeveless</p><p><span style=\"color: rgb(153, 153, 153);\">Model Number:</span></p><p>YM20269</p><p><span style=\"color: rgb(153, 153, 153);\">Fabric Type:</span></p><p>Lace</p><p><span style=\"color: rgb(153, 153, 153);\">Built-in Bra:</span></p><p>Yes</p><p><span style=\"color: rgb(153, 153, 153);\">is_customized:</span></p><p>Yes</p><p><span style=\"color: rgb(153, 153, 153);\">Fashion Element:</span></p><p>Floral Print</p><p><span style=\"color: rgb(153, 153, 153);\">Waistline:</span></p><p>Natural Factors</p><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 50, 35000.00, 1, 60.00, 'Percent', 2, 3, '1 week', 1, 65.00, 1, 'dubai-green-lace-up-sequined-wedding-dresses-2020-sweetheart-sexy-luxury-bridal-gowns-yewen-66742-custom-made-mtyx', 'MTYZMTAWMTIZNJKWMZK', 1, 1, 0, 0, NULL),
(18, 26, 94, 262, 3, 'Xiaomi Redmi Note 7 Pro | 48 MP Camera', 'seller', 30, NULL, 4, 2, '0.2', '[\"mi\",\"xiaomi\",\"redmi\",\"redminote\",\"redminote7pro\"]', '7*3.5', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjm3ntcxnjmxmdazmtg0.png\",\"upload\\/product\\/photos\\/nty0otaxnjmxmdazmtg0.png\",\"upload\\/product\\/photos\\/mjg5mtuxnjmxmdazmtg0.jpeg\"]', 'upload/product/thumbnail/mjy0mtuxnjmxmdazmtgz.png', '', '<p><span style=\"background-color: rgb(251, 251, 251); color: rgb(51, 51, 51);\">Xiaomi is a privately owned company that designs, develops, and sells smartphones</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 2, 2, 20, 14500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'xiaomi-redmi-note-7-pro--48-mp-camera-mzg3', 'MTYZMTAWMZE4NDK3MZY', 0, 1, 0, 1, NULL),
(19, 23, 93, 294, 3, 'FOOTBALL', 'seller', 28, NULL, 4, 2, '.125', '[\"FOOTBALL\",\"FIFAFOOTBALL\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/njy0njyxnjmxmdazmjex.jpeg\",\"upload\\/product\\/photos\\/mze0ndixnjmxmdazmjex.jpeg\"]', 'upload/product/thumbnail/mzmzmzcxnjmxmdazmjex.jpeg', '', '', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 700.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'football-mzkx', 'MTYZMTAWMZIXMTQWMDG', 0, 1, 0, 0, NULL),
(20, 26, 126, 338, 3, 'ASUS ROG Strix HERO II GL504GV Core i7 8th Gen 6GB GDDR6 Graphics Gaming Laptop With Genuine Windows 10', 'seller', 30, NULL, 4, 2, '2.4', '[]', '1920*1080', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndk4mzkxnjmxmdazodc0.jpeg\",\"upload\\/product\\/photos\\/otuwntcxnjmxmdazodc0.jpeg\",\"upload\\/product\\/photos\\/mzmwmtgxnjmxmdazodc0.jpeg\"]', 'upload/product/thumbnail/njk2mzyxnjmxmdazodc0.jpeg', '', '<p><span style=\"color: rgb(144, 146, 151);\">ASUS ROG Strix HERO II GL504GV is built in Intel Core i7-8750H Processor (9M Cache,2.20 GHz up to 4.10 GHz) with NVIDIA GeForce RTX 2060 6GB GDDR6 VRAM Graphics. This Strix HERO II has 15.6-inch Non-glare Full HD (1920×1080) IPS-level panel, 3ms, 100% sRGB dispaly with windows Windows 10, boasts the world’s first 144Hz super-narrow-bezel display with an ultrafast 3ms gray-to-gray (GTG) response time for visuals with unmatched smoothness and response. For an added edge in the heat of battle, the exclusive HyperCool Pro cooling system allows to fully unleash the potential of the high-performance CPU and GPU, while ROG RangeBoost technology uses multi-antenna Wi-Fi to provide 30% more1 range, higher throughput, and fewer connection drops. In addition, the all-new Armoury Crate utility offers one-click access to system settings with Aura lighting effects. This laptop offers an unstoppable combination of high-performance graphics and ultrafast display in a compact design. In this gaming laptop , it has 16GB DDR4 RAM, 1TB HDD,8GB SSHD, 512G PCIE storage, 2 x 1W speaker with Smart AMP technology with Array Microphones. it supports Intel 802.11ac (2×2) Gigabit Wi-Fi and Bluetooth 5.0 version may vary as the OS upgrades with M.2 NVMe PCIE 512GB. This exclusive gaming laptop provides 02 years of warranty.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 50, 147000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 200.00, 1, 'asus-rog-strix-hero-ii-gl504gv-core-i7-8th-gen-6gb-gddr6-graphics-gaming-laptop-with-genuine-windows-10-mjk0', 'MTYZMTAWMZG3NDM4OTC', 0, 1, 0, 39, NULL),
(21, 27, 124, 705, 3, 'Runway Stainless Steel Quartz Watch', 'seller', 32, 9, 4, 2, '0.1', '[\"watch\",\"gori\",\"men\",\"fassion\",\"handwatch\",\"smartwatch\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjy5mtcxnjmxmda0mdc2.jpeg\",\"upload\\/product\\/photos\\/oty2odixnjmxmda0mdc2.jpeg\"]', 'upload/product/thumbnail/nzc5otaxnjmxmda0mdc2.jpeg', '', '<p>Product specifications</p><p>Watch Information</p><p>Brand, Seller, or Collection Name	Lacoste</p><p>Model number	2011010</p><p>Part Number	2011010</p><p>Item Shape	Round</p><p>Dial window material type﻿	Mineral</p><p>Display Type	Analog</p><p>Clasp	Buckle</p><p>Case material	TR90</p><p>Case diameter	42 millimeters</p><p>Case Thickness	11 millimeters</p><p>Band Material	Rubber</p><p>Band size	Mens Standard</p><p>Band width	19.5 millimeters</p><p>Band Color	Black</p><p>Dial color	Black</p><p>Bezel material	STAINLESS STEEL &amp; TR-90</p><p>Bezel function﻿	Stationary</p><p>Calendar﻿	No Calendar</p><p>Special features	Second hand</p><p>Item weight	1.6 Ounces</p><p>Movement﻿	Japanese Quartz</p><p>Water resistant depth	165 Feet</p><p>Warranty	Manufacturer’s warranty can be requested from customer service. Click here to make a request to customer service.</p>', 1, '[]', 2, 1, 1, 1, 2, 100, 1400.00, 1, 20.00, 'Percent', 1, 3, '1 month', 1, 50.00, 1, 'runway-stainless-steel-quartz-watch-mtu3', 'MTYZMTAWNDA3NJC1NTQ', 0, 1, 0, 0, NULL),
(22, 23, 95, 317, 3, 'Sporzon! Rubber Encased Hex Dumbbell in Pairs or Singles', 'seller', 28, NULL, 1, 2, '15', '[\"DUMMBELLS\",\"HANDDUMMBELLS\",\"SMALLDUMMBELLS\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjywotgxnjmxmda0mdg4.jpeg\",\"upload\\/product\\/photos\\/mtm5mzyxnjmxmda0mdg4.jpeg\",\"upload\\/product\\/photos\\/ndazmtixnjmxmda0mdg4.jpeg\"]', 'upload/product/thumbnail/mja0ndexnjmxmda0mdg4.jpeg', '', '<h1>Sporzon! Rubber Encased Hex Dumbbell in Pairs or Singles</h1><p><br></p>', 2, '[]', 2, 1, 1, 3, 2, 60, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 60.00, 1, 'sporzon-rubber-encased-hex-dumbbell-in-pairs-or-singles-mja4', 'MTYZMTAWNDA4OTG1NJQ', 0, 1, 0, 0, NULL),
(23, 19, 81, 358, 3, 'pretty women jeans', 'seller', 29, 9, 4, 2, '', '[\"ladies\",\"jeans\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mtizmtqxnjmxmda0mzk5.jpeg\",\"upload\\/product\\/photos\\/mjixodgxnjmxmda0mzk5.jpeg\",\"upload\\/product\\/photos\\/odczmjkxnjmxmda0mzk5.jpeg\",\"upload\\/product\\/photos\\/nzuxmtixnjmxmda0mzk5.jpeg\"]', 'upload/product/thumbnail/njexntaxnjmxmda0mzk5.jpeg', '', '<h3>Product Highlights</h3><p>Length</p><p>Regular</p><p>Distress</p><p>Mildly Distress</p><p>Waist Rise</p><p>Mid Rise</p><p>Fit</p><p>Relaxed</p><p>Wash</p><p>Light Wash</p><h3>Overview</h3><p><span style=\"color: rgb(0, 0, 0);\">Style: commuting</span></p><p><span style=\"color: rgb(0, 0, 0);\">Commuter: Korean pants</span></p><p><span style=\"color: rgb(0, 0, 0);\">Waist height: high waist</span></p><p><span style=\"color: rgb(0, 0, 0);\">Material composition: elastic denim</span></p><p><span style=\"color: rgb(0, 0, 0);\">Thickness: regular clothing</span></p><p><span style=\"color: rgb(0, 0, 0);\">Style details: buttons</span></p><p><span style=\"color: rgb(0, 0, 0);\">Length: trousers</span></p><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 40, 1000.00, 1, 10.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'pretty-women-jeans-nzmy', 'MTYZMTAWNDM5OTY5NJI', 0, 1, 0, 0, NULL),
(24, 26, 113, 304, 3, 'Original ROMOSS Polymos 5 5000mAh Dual USB Li-polymer Power Bank Mobile Power Charger', 'seller', 30, NULL, NULL, 2, '0.4', '[\"powerbank\",\"rommos\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mja5mdgxnjmxmda0ndgx.jpeg\",\"upload\\/product\\/photos\\/odk5mtixnjmxmda0ndgx.jpeg\",\"upload\\/product\\/photos\\/mjmwnzmxnjmxmda0ndgx.jpeg\"]', 'upload/product/thumbnail/nti0odmxnjmxmda0ndgx.jpeg', '', '<p><span style=\"color: rgb(0, 0, 0);\">You will never have to worry about going on empty battery again as you can now charge your mobile phone, tablet and other compatible gadgets even without a power outlet around with this ultra slim Romoss Polymos 5 Polymer 5000mAh Powerbank.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 1500.00, 2, 1.00, 'Percent', 1, 3, '1 week', 1, 40.00, 1, 'original-romoss-polymos-5-5000mah-dual-usb-li-polymer-power-bank-mobile-power-charger-njk3', 'MTYZMTAWNDQ4MTMYOTY', 0, 1, 0, 0, NULL),
(25, 23, 97, 344, 3, 'DAIRY MILK CHOCOLATE', 'seller', 28, NULL, 4, 2, '1', '[\"DAIRYMILK\",\"CHOCOLATE\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otq5njmxnjmxmda0njix.jpeg\",\"upload\\/product\\/photos\\/njqxmjqxnjmxmda0njix.jpeg\",\"upload\\/product\\/photos\\/nja5mzmxnjmxmda0njix.jpeg\"]', 'upload/product/thumbnail/mzi5ntqxnjmxmda0njix.jpeg', '', '<h4 class=\"ql-align-center\">Food for the soul in many a flavor: Ahead of World Chocolate Day this week, let’s have a look at some of the great ways to incorporate the luxurious ingredient into your diet</h4><p><br></p>', 2, '[]', 2, 1, 1, 1, 2, 100, 120.00, 2, 1.00, 'Percent', 1, 0, '', 1, 60.00, 1, 'dairy-milk-chocolate-njkz', 'MTYZMTAWNDYYMTQ1MZE', 0, 1, 0, 0, NULL),
(26, 28, 108, 334, 3, 'Kids Packaged Color Crewneck Short-Sleeve T-Shirt', 'seller', 31, 10, 4, 2, '1', '[\"t-shirt\",\"genji\",\"hafshirt\"]', '38', 1, 1, '[]', '[\"upload\\/product\\/photos\\/ndq4mjyxnjmxmda0njmx.jpeg\",\"upload\\/product\\/photos\\/ntg2mzqxnjmxmda0njmx.jpeg\"]', 'upload/product/thumbnail/mjgxndgxnjmxmda0njmx.jpeg', '', '<ul><li><span style=\"color: rgb(51, 51, 51);\">1. 160 GSM. 2 .Material-Classic, lightweight fabric comprising 100% cotton. 3. Fit-.Regular Fit. Not too tight, not too loose. 4. Wash care-Machine wash. Wash in cold water, use mild detergent, dry in shade, do not tumble dry. Dry on a flat surface as hanging may cause measurement variations. 5. Extra durable. Please Note: Colors may slightly vary depending on your screen brightness</span></li></ul>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 2, 2, 1, 0.00, 1, 5.00, 'Percent', 1, 3, '', 1, 60.00, 1, 'kids-packaged-color-crewneck-short-sleeve-t-shirt-nzux', 'MTYZMTAWNDYZMTKWODU', 0, 1, 0, 0, NULL),
(27, 27, 140, 579, 3, 'Jackets', 'seller', 32, 9, NULL, 2, '0.2', '[\"jackert\",\"suyeter\",\"siterjam\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/mjy0odyxnjmxmda0nzqz.jpeg\",\"upload\\/product\\/photos\\/njcxnjuxnjmxmda0nzqz.jpeg\"]', 'upload/product/thumbnail/odyyotixnjmxmda0nzqy.jpeg', '', '<p><em>A classic piece that will never go out of style, the custom bomber jacket is an iconic, fashionable look for men.</em></p><p>Design your own bomber jacket for yourself or as a special gift for a loved one and bring out their personality for the world to see. With 5 printable areas, 9 sizes and 3 fabric finish options, your personalized bomber jacket is the canvas for your creativity.</p>', 2, '[]', 2, 1, 1, 1, 2, 100, 1000.00, 2, 1.00, 'Percent', 1, 1, '1 month', 1, 50.00, 1, 'jackets-odkw', 'MTYZMTAWNDC0MZM3ODA', 0, 1, 0, 0, NULL),
(28, 19, 81, 366, 3, 'Long maxi skirt', 'seller', 29, NULL, 4, 2, '', '[\"skirts\",\"long\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mti2ndaxnjmxmda1mjk3.jpeg\",\"upload\\/product\\/photos\\/odm4mjuxnjmxmda1mjk3.jpeg\",\"upload\\/product\\/photos\\/mtu5nzexnjmxmda1mjk3.jpeg\",\"upload\\/product\\/photos\\/mjayodcxnjmxmda1mjk3.jpeg\",\"upload\\/product\\/photos\\/mzq3nzyxnjmxmda1mjk3.jpeg\"]', 'upload/product/thumbnail/oteznzaxnjmxmda1mjk3.jpeg', '', '<p><span style=\"color: rgb(34, 34, 34);\">Long and flowing cotton skirt.</span></p><p><span style=\"color: rgb(34, 34, 34);\">Classical look. Comfortable and adds touch of elegance.</span></p><p><span style=\"color: rgb(34, 34, 34);\">Could match with fitted tops or oversized ones.</span></p><p><span style=\"color: rgb(34, 34, 34);\">Made to measure.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 1500.00, 1, 10.00, 'Percent', 1, 3, '1 week', 1, 65.00, 1, 'long-maxi-skirt-mjiz', 'MTYZMTAWNTI5NZI1NTY', 0, 1, 0, 0, NULL),
(29, 23, 98, 373, 3, 'SYNERGY Raw Kombucha', 'seller', 28, NULL, 4, 2, '2', '[\"SYNERGY\",\"Raw\",\"Kombucha\",\"HEALTHDRINKS\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otc0njixnjmxmda1mzaz.jpeg\",\"upload\\/product\\/photos\\/otgxotmxnjmxmda1mzaz.jpeg\",\"upload\\/product\\/photos\\/ndaymtixnjmxmda1mzaz.png\"]', 'upload/product/thumbnail/mtg4ndcxnjmxmda1mzaz.png', '', '<p><span style=\"color: rgb(101, 111, 114);\">Kombucha, sports drinks, fruit juices. All of these beverages are thought of as healthy. All of these beverages contain sugar and have a low ph, making them acidic, and therefore harmful to your teeth.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 3, 1, 1, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 0.00, 1, 'synergy-raw-kombucha-nzc2', 'MTYZMTAWNTMWMZY3OTY', 0, 1, 0, 0, NULL),
(30, 26, 119, 319, 3, 'P8 Smart Watch Sports Smartwatch IPX7 Waterproof Clock Heart Rate Blood Pressure Monitor', 'seller', 30, NULL, 4, 2, '.2', '[\"smartwatch\",\"p8smart\",\"watch\",\"watchgray\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odg0njgxnjmxmda1mze0.jpeg\",\"upload\\/product\\/photos\\/njy4odexnjmxmda1mze0.jpeg\"]', 'upload/product/thumbnail/mja4ndixnjmxmda1mze0.jpeg', '', '<p><strong style=\"color: rgb(102, 102, 102);\">Specification:</strong></p><p><span style=\"color: rgb(102, 102, 102);\">● Model: P8</span></p><p><span style=\"color: rgb(102, 102, 102);\">● App: Dafit</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Display: 1.4-inch screen, 240 x 240</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Band Material: Silicone / Steel</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Operating modes: full touch</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Battery: 170mAh Battery</span></p><p><span style=\"color: rgb(102, 102, 102);\">● App Timing classroom reminder: Mute alarm clock / Reminder sedentary / Beverages reminder / Meetings reminder</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Power-saving screen: Lift the wrist brighten the screen</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Standby time: the longest standby time of 10-20 days, working time of 2-7 days</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Heart rate detection: motion real-time heart rate detection / continuous heart rate monitor</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Provided: stopwatch function, find a phone, DIP switch</span></p><p><span style=\"color: rgb(102, 102, 102);\">● Support system: iOS 8.0 above, Android 4.4 above</span></p><p><span style=\"color: rgb(102, 102, 102);\">● APP features: Custom screen saver, alarm clock, remote capture, trajectory, more reminders</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 5000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'p8-smart-watch-sports-smartwatch-ipx7-waterproof-clock-heart-rate-blood-pressure-monitor-nduz', 'MTYZMTAWNTMXNDQWMTA', 0, 1, 0, 0, NULL),
(31, 23, 99, 383, 3, 'academic books that changed the world', 'seller', 28, NULL, 4, 2, '', '[\"BOOK\",\"ACADEMICBOOK\"]', '11\"*8.5\"*2.5\"', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzizotyxnjmxmda1nzy4.jpeg\",\"upload\\/product\\/photos\\/mjy0mjixnjmxmda1nzy4.jpeg\"]', 'upload/product/thumbnail/ntg5ntixnjmxmda1nzy4.jpeg', '', '<h2>List voted for by leading academic booksellers, librarians and publishers revealed ahead of Academic Book Week</h2><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 1000, 250.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'academic-books-that-changed-the-world-njmw', 'MTYZMTAWNTC2ODE0MZC', 0, 1, 0, 0, NULL),
(32, 26, 131, 360, 3, 'HP Genius Gaming Mouse M280 6400 Dpi Adjustable Wired RGB Led Mice Million Colors Editing MACroS Ergonomic Gamer Mouse for PC', 'seller', 30, NULL, 4, 2, '.12', '[\"hp\",\"hpmouse\",\"gamingmouse\",\"hpgenius\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/oti1mdkxnjmxmda1nzcw.png\",\"upload\\/product\\/photos\\/mzg3otgxnjmxmda1nzcw.jpeg\",\"upload\\/product\\/photos\\/nzgxntixnjmxmda1nzcw.png\"]', 'upload/product/thumbnail/nza5njuxnjmxmda1nzcw.jpeg', '', '<p><span style=\"color: rgb(104, 108, 111);\">*Optical Gaming mouse</span></p><p><span style=\"color: rgb(104, 108, 111);\">* Sensor: SPCP A704E</span></p><p><span style=\"color: rgb(104, 108, 111);\">*Up to 2400 dpi</span></p><p><span style=\"color: rgb(104, 108, 111);\">*RGB backlight</span></p><p><span style=\"color: rgb(104, 108, 111);\">* Size :123 (L) x 65.5(W) x 33(H)±0.2mm</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 240, 380.00, 2, 1.00, 'Percent', 1, 3, '1 week', 1, 40.00, 1, 'hp-genius-gaming-mouse-m280-6400-dpi-adjustable-wired-rgb-led-mice-million-colors-editing-macros-ergonomic-gamer-mouse-for-pc-mtiw', 'MTYZMTAWNTC3MDIWOTG', 0, 1, 0, 0, NULL),
(33, 27, 134, 593, 3, 'bottom wear', 'seller', 32, NULL, NULL, 2, '0.250', '[\"jeans\",\"pant\",\"bottomwear\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/mjm1ndqxnjmxmda1odiz.jpeg\",\"upload\\/product\\/photos\\/mzmwodaxnjmxmda1odiz.jpeg\"]', 'upload/product/thumbnail/odu4mtqxnjmxmda1odiz.jpeg', '', '<p><strong>Online Shopping</strong>&nbsp;- Fashion &amp; Lifestyle Store for Men &amp; Women</p><p>Welcome to the world of crazy shoppers! Push your shopaholic boat out into the extreme ocean of fashion in just few clicks. Quench your fashion thirst by diving through the one stop solution in online shopping in India here at Yepme. With the desire to serve the fashionable you, Yepme has come up with its own fashion brand, putting across endless sections for men &amp; women with massive collection in apropos to latest trends and styles.</p><p><strong>Yepme.com:</strong>&nbsp;India’s First Online Fashion Shopping Brand</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 550.00, 1, 10.00, 'Percent', 1, 2, 'no', 1, 50.00, 1, 'bottom-wear-nti1', 'MTYZMTAWNTGYMZIXNJG', 0, 1, 0, 0, NULL),
(34, 28, 111, 354, 3, ' NEW GEN Baby Girl\'s Fit and flare Knee Length Dress', 'seller', 31, NULL, NULL, 2, '1', '[\"Dresses\",\"jama\"]', '40', 1, 1, '[]', '[\"upload\\/product\\/photos\\/otg1mzqxnjmxmda1odg5.jpeg\",\"upload\\/product\\/photos\\/mziwmtexnjmxmda1odg5.jpeg\",\"upload\\/product\\/photos\\/mtg1mzaxnjmxmda1odg5.jpeg\",\"upload\\/product\\/photos\\/ntcxnjmxnjmxmda1odg5.jpeg\"]', 'upload/product/thumbnail/ntuxnzyxnjmxmda1odg5.jpeg', '', '<p><br></p><p><span style=\"color: rgb(51, 51, 51);\">Dress your little girl with this Dress from NEW GEN available on Amazon. Pair it up with a cute hair accessory and closed shoes for her to shine at the best friend\'s birthday.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 2, 2, 1, 0.00, 1, 10.00, 'Percent', 1, 3, '', 1, 50.00, 1, '-new-gen-baby-girls-fit-and-flare-knee-length-dress-nzkx', 'MTYZMTAWNTG4OTU4MJY', 0, 1, 0, 0, NULL),
(35, 19, 91, 410, 3, ' High Heels', 'seller', 29, NULL, 4, 2, '', '[\"ladis\",\"heel\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzu3nzkxnjmxmda2mtix.jpeg\",\"upload\\/product\\/photos\\/mteyoduxnjmxmda2mtix.jpeg\",\"upload\\/product\\/photos\\/mtk5mjcxnjmxmda2mtix.jpeg\",\"upload\\/product\\/photos\\/mja2mdgxnjmxmda2mtiy.jpeg\",\"upload\\/product\\/photos\\/ndc0mzgxnjmxmda2mtiy.jpeg\"]', 'upload/product/thumbnail/mjmymdyxnjmxmda2mtix.jpeg', '', '<p><span style=\"color: rgb(34, 34, 34);\">You\'ll forever treasure these handmade sandals, showcasing timeless elegance with exquisite detail!</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">Hand crafted from luxurious pearlized PU white leather, they feature an opulent design encrusted with a mix of lustrous pearls for a subtle lustrous sheen. Finished with lightly padded insoles and pearl encrusted heels.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 2500.00, 1, 10.00, 'Percent', 1, 0, '', 1, 65.00, 1, '-high-heels-ntg1', 'MTYZMTAWNJEYMJC0NJQ', 0, 1, 0, 0, NULL),
(36, 23, 100, 405, 3, 'Imprinted Satin Pens', 'seller', 28, NULL, 4, 2, '', '[]', '4.5\"*0.60\"', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjmwmzqxnjmxmda2mjyy.jpeg\",\"upload\\/product\\/photos\\/ndkyodexnjmxmda2mjyy.jpeg\",\"upload\\/product\\/photos\\/odk5mtexnjmxmda2mjyy.jpeg\"]', 'upload/product/thumbnail/nzg5ntgxnjmxmda2mjyy.jpeg', '', '<p><span style=\"color: rgb(6, 40, 58);\">Don\'t let your pens fade into the background! With the Satin pen from Quality Logo Products</span><sup style=\"color: rgb(6, 40, 58);\">®</sup><span style=\"color: rgb(6, 40, 58);\">, your brand is sure to stand out from the crowd. The sleek design and colorful grip will have everyone reaching for it, making it the top-pick in your customer\'s office drawer.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 3000, 8.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'imprinted-satin-pens-otu3', 'MTYZMTAWNJI2MZKWNTY', 0, 1, 0, 0, NULL),
(37, 26, 133, 371, 3, 'Samsung T55 27 Inch FHD (1920x1080) LED Curved Monitor (HDMI, DP, VGA, Speaker) #C27T550FDW/LC27T550FDNXZA', 'seller', 30, 6, 4, 2, '3', '[\"samsungmonitor\",\"monitor\",\"computermonitor\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjexmtixnjmxmda2mjcw.jpeg\",\"upload\\/product\\/photos\\/odaxodexnjmxmda2mjcw.jpeg\"]', 'upload/product/thumbnail/mtg0ntexnjmxmda2mjcw.jpeg', '', '<p><span style=\"color: rgb(102, 102, 102);\">Introducing the boldest curve ever accomplished. This milestone, born from years of relentless innovation, changes the shape of visual display and pioneers the future of monitor technology. T55 received a high performance curved display (1000R) and eye comfort certificate for its superior 1000R curved display from TUV Rheinland; a leading international Testing , Inspection, and Certification body. Connect to all your favorite devices with a convenient HDMI, DP, and D-Sub triple interface. The built-in 5 Watt speakers make it even easier to get lost in your favorite movies or TV shows, without plugging in a speaker.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 50, 15000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 100.00, 1, 'samsung-t55-27-inch-fhd-1920x1080-led-curved-monitor-hdmi-dp-vga-speaker-c27t550fdwlc27t550fdnxza-ndk3', 'MTYZMTAWNJI3MDQYMTQ', 0, 1, 0, 0, NULL),
(38, 19, 149, 457, 3, 'leather handbags', 'seller', 29, NULL, 4, 2, '', '[\"bag\",\"parse\",\"hand\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntq4ntcxnjmxmda2ntm3.jpeg\",\"upload\\/product\\/photos\\/ndq3mzkxnjmxmda2ntm3.jpeg\",\"upload\\/product\\/photos\\/ntawmjkxnjmxmda2ntm3.jpeg\",\"upload\\/product\\/photos\\/mjaxmtkxnjmxmda2ntm3.jpeg\"]', 'upload/product/thumbnail/ntmxntqxnjmxmda2ntm3.jpeg', '', '<p>a small bag, pouch, or case for carrying money. anything resembling a purse in appearance, use, etc. a sum of money offered as a prize or reward. a sum of money collected as a present or the like. money, resources, or wealth.</p><p><strong style=\"color: rgb(104, 108, 111);\">Category:&nbsp;</strong><a href=\"https://www.mustdiscover.com/index.php/product-category/bags-and-luggage-making-materials/wallets-purses-and-handbags/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 62, 72);\"><strong>Wallets, Purses and Handbags</strong></a>&nbsp;<strong style=\"color: rgb(104, 108, 111);\">Tag:&nbsp;</strong><a href=\"https://www.mustdiscover.com/index.php/product-tag/leather-handbags-for-women/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 62, 72);\"><strong>Leather handbags for women</strong></a></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 60, 2000.00, 1, 15.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'leather-handbags-mza4', 'MTYZMTAWNJUZNZMZMTM', 0, 1, 0, 0, NULL),
(39, 26, 135, 377, 3, 'Apple iPad Air 2 review: Slimmer and faster, but a smaller battery', 'seller', 30, NULL, 4, 2, '.5', '[\"ipad\",\"appleipad\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ote0mjqxnjmxmda2nty3.jpeg\",\"upload\\/product\\/photos\\/ntq5ndixnjmxmda2nty3.jpeg\"]', 'upload/product/thumbnail/oti0mzixnjmxmda2nty3.jpeg', '', '<p><em style=\"color: rgb(8, 14, 20);\">The iPad Air 2, now available in gold, looks very similar to the 2013 iPad Air, but is 1.4mm thinner; other changes include Touch ID, a less reflective Retina HD screen and a faster processor</em></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 40000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 90.00, 1, 'apple-ipad-air-2-review-slimmer-and-faster-but-a-smaller-battery-nday', 'MTYZMTAWNJU2NZMWMTK', 0, 1, 0, 0, NULL),
(40, 27, 132, 629, 3, 'T-Shirt', 'seller', 32, 2, NULL, 2, '0.050', '[\"T-Shirt\",\"genji\",\"Shirt\",\"topwear\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/otq0otexnjmxmda2ntc0.jpeg\",\"upload\\/product\\/photos\\/mtgxmtkxnjmxmda2ntc0.jpeg\"]', 'upload/product/thumbnail/njc4mdmxnjmxmda2ntc0.jpeg', '', '<p>jigyisdio iiiogipoipo irueoeioureuii </p><p>eifu </p><p>oiyeyirti iojio</p><p>pogyufpgu</p><p>oryg0fuybb</p><p>dfhyuui</p>', 2, '[]', 2, 1, 1, 1, 2, 20, 400.00, 1, 30.00, 'Percent', 1, 0, '', 1, 50.00, 1, 't-shirt-ndew', 'MTYZMTAWNJU3NTE1MDM', 0, 1, 0, 0, NULL),
(41, 23, 101, 429, 3, 'CAR & BIKE CARE', 'seller', 28, NULL, 4, 2, '1', '[\"CAR\",\"&\",\"BIKE\",\"CARE\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjkxodixnjmxmda2njg1.jpeg\",\"upload\\/product\\/photos\\/njuzmjyxnjmxmda2njg1.jpeg\",\"upload\\/product\\/photos\\/njm2njaxnjmxmda2njg1.jpeg\"]', 'upload/product/thumbnail/mjuwnzmxnjmxmda2njg1.jpeg', '', '<p><span style=\"color: rgb(0, 0, 0);\">Your prized possession deserves the care and protection of Shield for showroom quality you can be proud of!</span></p><p><span style=\"color: rgb(0, 0, 0);\">Stock up on car detailing and cleaning supplies with our ultimate car cleaning kit range, offering you superior value for money on our premium range of car care products. Our car care kits have been professionally assembled to ensure that you get all the products and tools you need to successfully accomplish the task at hand, whether it be cleaning, detailing, polishing or restoring we have the kit thats right for you!</span></p><p><span style=\"color: rgb(0, 0, 0);\">These auto care kits also make great gifts for the motor enthusiast and are a great addition to any garage.</span></p><p><span style=\"color: rgb(0, 0, 0);\">Car Care Value</span></p>', 2, '[]', 2, 1, 1, 1, 2, 2000, 580.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'car--bike-care-mja1', 'MTYZMTAWNJY4NTM4NDU', 0, 1, 0, 0, NULL),
(42, 28, 121, 414, 3, 'NEOBABY Kids LED Light Shoes for Boys & Girls', 'seller', 31, NULL, NULL, 2, '3', '[\"shoes\",\"jota\",\"sport\"]', '9', 1, 1, '[]', '[\"upload\\/product\\/photos\\/ndc3ndexnjmxmda2nzi4.jpeg\",\"upload\\/product\\/photos\\/odm4ndcxnjmxmda2nzi4.jpeg\",\"upload\\/product\\/photos\\/mzy1mjixnjmxmda2nzi4.jpeg\"]', 'upload/product/thumbnail/mja0njqxnjmxmda2nzi4.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">This stylish Pair of causal Kids Shoes is a perfect choice for your little one. Attractive design and vibrant shade of this pair, makes it a must-have for your kids. Can be used as Party Wear, Sports &amp; Casual. Upper made of high quality Resin Leather Material. Paired with a beautiful outfit, the Shoes are sure to garner attention. Neobaby Lifestyle causal Shoes-Warm and cozy lining keeps your feet to be hugged and comfortable for all day. Perfect match for your various shirt, is fashion and charming. It is flexible and anti-slip out sole, perfect for daily wear and fit different occasions, such as party, vocation, daily and so on. Multicolor -Material - Resin Sole Material -Toe Shape: closed Toe Style: Fashion Gender: Boys &amp; Girls Pattern Solid Season: - suitable for all type weather Occasion - Party, Outdoor, Indoor, School, Daily Life, Camping,etc. Package Content:1Pair x Shoes.</span></p>', 2, '[]', 2, 1, 1, 1, 2, 0, 2000.00, 1, 5.00, 'Percent', 1, 3, '', 1, 40.00, 1, 'neobaby-kids-led-light-shoes-for-boys--girls-nzg3', 'MTYZMTAWNJCYODGZNJI', 1, 1, 0, 0, NULL),
(43, 26, 137, 394, 3, 'Samsung Water Resistant Pocket Bluetooth Speaker, Model Name/Number: Level Box Slim', 'seller', 30, 6, 4, 2, '2', '[\"speakers\",\"bluetooth\",\"samsungspeakers\",\"samsungbluetooth\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nze3odkxnjmxmda2otiz.jpeg\",\"upload\\/product\\/photos\\/oty5njuxnjmxmda2otiz.jpeg\",\"upload\\/product\\/photos\\/nzk0njqxnjmxmda2otiz.jpeg\"]', 'upload/product/thumbnail/njyxmdqxnjmxmda2otiz.jpeg', '', '<ul><li>BI-DIRECTIONAL SOUND Go wall to wall with a unique bi-directional design It delivers your music to a wider area for a room-filling sound experience</li><li>HIGH POWER 1500 WATTS Take your party to the next level with 1500 watts of high power audio Go ahead turn it up and keep your party going with massive sound</li><li>BUILT-IN WOOFER Energize the room with a 10-inch built-in woofer You won’t just hear it you’ll feel it</li><li>LED PARTY LIGHTS Light up the party with fun light modes including Party Ambient and Dance Set the lighting effect to match the rhythm and get dancing</li><li>KARAOKE MODE You and a friend can get the whole party singing with Karaoke Mode Belt out every word with two mic inputs</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 60, 10000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 90.00, 1, 'samsung-water-resistant-pocket-bluetooth-speaker-model-namenumber-level-box-slim-mjaz', 'MTYZMTAWNJKYMZKYMTK', 0, 1, 0, 1, NULL),
(44, 19, 150, 476, 3, 'fingegr  ring', 'seller', 29, NULL, 4, 2, '', '[\"ring\",\"angti\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndu3mjixnjmxmda2otc4.jpeg\",\"upload\\/product\\/photos\\/otg5ntexnjmxmda2otc4.jpeg\",\"upload\\/product\\/photos\\/ntizntgxnjmxmda2otc4.jpeg\",\"upload\\/product\\/photos\\/mtqzodyxnjmxmda2otc4.jpeg\"]', 'upload/product/thumbnail/ode3otqxnjmxmda2otc4.jpeg', '', '<ul><li>Finger Ring for Women - 17 Pieces Set.</li><li>Product Type: Finger Ring.</li><li>Material: Metal.</li><li>Quantity: 17 Pieces.</li><li>Beautiful and unique design.</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 550.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'fingegr--ring-oti3', 'MTYZMTAWNJK3ODI2OTM', 0, 1, 0, 0, NULL),
(45, 27, 141, 556, 3, 'kurta', 'seller', 32, 2, NULL, 2, '', '[\"panjabi\",\"kurta\",\"ethinicwear\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/ndkxmdkxnjmxmda3mdm2.jpeg\",\"upload\\/product\\/photos\\/mjyxndmxnjmxmda3mdm2.jpeg\"]', 'upload/product/thumbnail/ndc3mtcxnjmxmda3mdm2.jpeg', '', '<h1>Virat Kohli looks dashing as he launches festive campaign titled ‘India Ethnic Week’ by Manyavar</h1><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 2000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'kurta-nji5', 'MTYZMTAWNZAZNJGXMDQ', 0, 1, 0, 0, NULL),
(46, 23, 102, 446, 3, 'SAFETY PRODUCTS', 'seller', 28, NULL, 4, 2, '', '[\"SAFETYPRODUCTS\",\"SAFETYKITES\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mtuwnzmxnjmxmda3mte1.jpeg\",\"upload\\/product\\/photos\\/mzgxmtcxnjmxmda3mte1.jpeg\"]', 'upload/product/thumbnail/mjq0otmxnjmxmda3mte1.jpeg', '', '<p><span style=\"background-color: rgb(232, 237, 237); color: rgb(12, 13, 13);\">Close-up of hiker adjusting his harness on zip line cable in the forest</span></p>', 2, '[]', 2, 1, 1, 1, 2, 500, 1200.00, 2, 1.00, 'Percent', 1, 0, '', 1, 0.00, 1, 'safety-products-ndex', 'MTYZMTAWNZEXNTK4MTC', 0, 1, 0, 0, NULL),
(47, 26, 143, 407, 3, 'CANON EOS 250D 24.1MP WITH 18-55MM III KIT LENS FULL HD WI-FI DSLR CAMERA', 'seller', 30, NULL, 4, 2, '.9', '[\"dslr\",\"canoncamara\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otc0njkxnjmxmda3mjm0.jpeg\",\"upload\\/product\\/photos\\/otqznjmxnjmxmda3mjm0.jpeg\",\"upload\\/product\\/photos\\/ode3mjmxnjmxmda3mjm0.jpeg\",\"upload\\/product\\/photos\\/nzexmjqxnjmxmda3mjm0.jpeg\"]', 'upload/product/thumbnail/otq0ntkxnjmxmda3mjmz.jpeg', '', '<p><span style=\"color: rgb(0, 0, 0);\">The Canon EOS 250D is world\'s lightest DSLR with vari-angle screen. It has a classic feel and intuitive design. Its 24.1MP photos and 4K movies are clear, sharp, and packed with colour even in low light. This is thanks to an APS-C sensor, powerful autofocus and DIGIC 8 with Digital Lens Optimizer. The Vari-Angle touchscreen makes awkward angles and selfies easy. It’s easy to share images with friends and family as you can automatically send your images to your compatible smart device with Bluetooth and Wi-Fi connectivity. Whether you capture the moment at 5 fps with the optical viewfinder or use Dual Pixel CMOS AF Live View with Eye Auto Focus, you can enjoy pin-sharp results. 4K movie with Digital Image Stabilizer provides life-like detail for your 4K TV. 4K Frame Grab extracts photos from your movies, 4K time-lapse turn hours into seconds. A versatile standard zoom lens that won’t weigh you down - the ultra-portable EF-S 18-55mm f/4-5.6 IS STM from Canon lets you take your EOS camera to more places, delivering sharp punchy images even in low light thanks to a 4-stop Image Stabiliser. And it’s good for video recording too, thanks to the STM autofocus drive that enables smooth focus transitions.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 90000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 150.00, 1, 'canon-eos-250d-241mp-with-18-55mm-iii-kit-lens-full-hd-wi-fi-dslr-camera-ntg5', 'MTYZMTAWNZIZNDYYOTE', 0, 1, 0, 2, NULL),
(48, 19, 151, 503, 3, ' Digital LED Display Watch', 'seller', 29, NULL, 4, 2, '', '[\"watch\",\"ghori\",\"digitalwaa\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzkxmduxnjmxmda3mze4.jpeg\",\"upload\\/product\\/photos\\/otezodyxnjmxmda3mze4.jpeg\",\"upload\\/product\\/photos\\/mjq1mzixnjmxmda3mze4.jpeg\",\"upload\\/product\\/photos\\/njq0nzmxnjmxmda3mze4.jpeg\"]', 'upload/product/thumbnail/ntm0mzqxnjmxmda3mze4.jpeg', '', '<ul><li>Brand Name: DOOBO</li><li>Certification: None</li><li>Case Material: Alloy</li><li>Origin: CN(Origin)</li><li>Band Length: 24cm</li><li>Water Resistance Depth: No waterproof</li><li>Style: Fashion &amp; Casual</li><li>Movement: Digital</li><li>Clasp Type: Leather Deployment Bucket</li><li>Case Shape: Square</li><li>Band Width: 21mm</li><li>Case Thickness: 7mm</li><li>Dial Window Material Type: Glass</li><li>Feature: Stop Watch</li><li>Feature: LED Display</li><li>Feature: Auto Date</li><li>Feature: Complete Calendar</li><li>Model Number: men\'s watch</li><li>Boxes &amp; Cases Material: No package</li><li>Dial Diameter: 38mm</li><li>Band Material Type: Silicone</li><li>goods: watch</li><li>type: relogio digital</li><li>style: digital watch</li><li>gender: men\'s watches</li><li>products: electronic watch</li><li>item: men watch</li><li>product: watch men</li><li>item type: clock</li><li>gift: reloj</li><li>Gender: relogio</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 3550.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, '-digital-led-display-watch-ndu1', 'MTYZMTAWNZMXODQ0NTE', 0, 1, 0, 0, NULL),
(49, 23, 103, 453, 3, 'HOT WATER BAG', 'seller', 28, NULL, 4, 2, '5', '[\"HOTWATERBAG\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mti3nzcxnjmxmda3mzc3.jpeg\",\"upload\\/product\\/photos\\/nte0otaxnjmxmda3mzc3.jpeg\",\"upload\\/product\\/photos\\/odu5njkxnjmxmda3mzc3.jpeg\"]', 'upload/product/thumbnail/odk5ndcxnjmxmda3mzc3.jpeg', '', '<p><span style=\"background-color: rgb(242, 242, 242); color: rgb(65, 65, 65);\">We are leading supplier of Foley Catheters, Disposable Medical Masks, Surgical Tapes, Hot Water Bag, BP Monitors &amp; Equipment, Thermometers, Malaria &amp; Pregnancy Test Cards, Surgical Gloves, Disposable Face Mask &amp; Underpad etc.</span></p>', 2, '[]', 2, 1, 1, 1, 2, 200, 450.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'hot-water-bag-ndg5', 'MTYZMTAWNZM3NZCZMZE', 0, 1, 0, 0, NULL),
(50, 28, 108, 340, 3, 'AJ DEZINES Boy\'s Regular Fit Kurta', 'seller', 31, NULL, 4, 2, '1', '[\"kurta\",\"panjabi\"]', '42', 1, 1, '[]', '[\"upload\\/product\\/photos\\/ndkxnzixnjmxmda3ndi0.jpeg\",\"upload\\/product\\/photos\\/mzg3mjqxnjmxmda3ndi0.jpeg\",\"upload\\/product\\/photos\\/nzi5nzmxnjmxmda3ndi0.jpeg\"]', 'upload/product/thumbnail/mtc4mjyxnjmxmda3ndi0.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">Let your little prince be the new style ICON among his friends by wearing this party wear dhoti kurta set from AJ DEZINES. Fashioned using silk blend fabric, the dhoti kurta set ensures maximum ease and comfort to your kid. This Kids ethnic comprises a full sleeve shirt, a waistcoat with and a pair of dhoti. Kurta, has a round collar, long sleeves, straight hem. Waistcoat has Nehru collar, sleeveless, full button placket, a welt pocket. Dhoti pants has elasticated waistband. Make your kid team it up with a pair of mojaris to get the perfect traditional look. Truly an evergreen outfit, your kid can flaunt this at family functions, traditional occasions and other celebrations. This Kids dress is available in different colour blue, royal blue and Maroon. AJ DEZINES is a leading brand in Kids wear with wide range of Kids clothing which includes Kids ethnic wear, accessories and a lot more</span></p>', 2, '[]', 2, 1, 1, 1, 2, 20, 2500.00, 1, 40.00, 'Percent', 1, 3, '', 1, 65.00, 1, 'aj-dezines-boys-regular-fit-kurta-mjq2', 'MTYZMTAWNZQYNDEWMDK', 1, 1, 0, 0, NULL),
(51, 19, 153, 515, 3, 'Georgette Saree', 'seller', 29, NULL, 4, 2, '', '[\"saree\",\"jorjet\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nje1njaxnjmxmda4ntk5.jpeg\",\"upload\\/product\\/photos\\/ndaxnjgxnjmxmda4ntk5.jpeg\",\"upload\\/product\\/photos\\/mtk3ntqxnjmxmda4ntk5.jpeg\",\"upload\\/product\\/photos\\/nzaxndgxnjmxmda4ntk5.jpeg\",\"upload\\/product\\/photos\\/odeznzaxnjmxmda4ntk5.jpeg\",\"upload\\/product\\/photos\\/mzmxndyxnjmxmda4ntk5.jpeg\"]', 'upload/product/thumbnail/njm5mduxnjmxmda4ntk5.jpeg', '', '<p>Maroon And Black Georgette Saree is designed with zari floral thread work enhancing the embroidered patterns on the saree and patch border work. Comes with matching blouse.</p><p>Saree comes with unstitched&nbsp;blouse material. This can be stitched using the tailoring options select “<strong>Custom stitching</strong>” option with a step by step guide. If there are any design changes to be made you will be emailed from our stitching team stitching@omsara.co.uk&nbsp;subject to design limitations.</p><p>The blouse can be customised to fit sizes 32,34,36,38,40,42 14-15′ length blouse (Slight variation in colour, fabric &amp; embroidery work is possible. Model images are only representative.) Model accessories and latkans are not included.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><h5>ADDITIONAL INFORMATION</h5><p>FABRICGeorgette</p><p>COLOUR<a href=\"https://www.omsara.co.uk/colour/black/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 72, 98);\">Black</a>,&nbsp;<a href=\"https://www.omsara.co.uk/colour/maroon/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 72, 98);\">Maroon</a></p><p>OCCASION<a href=\"https://www.omsara.co.uk/occasion/festival/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 72, 98);\">Festival</a>,&nbsp;<a href=\"https://www.omsara.co.uk/occasion/sangeet/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 72, 98);\">Sangeet</a>,&nbsp;<a href=\"https://www.omsara.co.uk/occasion/wedding/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 72, 98);\">Wedding</a></p><p>SIZE<a href=\"https://www.omsara.co.uk/size/osfa/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(51, 72, 98);\">OSFA</a></p>', 2, '[]', 2, 1, 1, 1, 2, 25, 2490.00, 1, 5.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'georgette-saree-ntk3', 'MTYZMTAWODU5OTQZNDM', 1, 1, 0, 0, NULL);
INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `cat_position`, `name`, `added_by`, `user_id`, `brand_id`, `unit_id`, `Refundable`, `weight`, `tags`, `dimension`, `product_type`, `attribute`, `attribute_option`, `photos`, `thumbnail_img`, `video_link`, `description`, `color_image`, `color`, `qty_manage`, `min_qty`, `max_qty`, `price_type`, `stock_manage`, `quantity`, `price`, `discount`, `discount_value`, `discount_type`, `discount_method`, `warranty_type`, `warranty_period`, `shipping`, `shipping_cost`, `status`, `slug`, `sku`, `featured`, `published`, `total_sell`, `total_view`, `wishlist`) VALUES
(52, 28, 108, 343, 3, 'smooth semi-stitched lehenga', 'seller', 31, 11, NULL, 2, '', '[]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/otawmjqxnjmxmda4otq4.jpeg\",\"upload\\/product\\/photos\\/mtuzmtuxnjmxmda4otq4.jpeg\",\"upload\\/product\\/photos\\/mjm1mzcxnjmxmda4otq4.jpeg\"]', 'upload/product/thumbnail/mzg1nzyxnjmxmda4otq4.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">Ethnos Fashion is an online fashion clothing brand which believes in comfortable dressing for Indian Girls, kides, kid, baby and woman at home, work, and play. Designers of Ethnos Fashion consist of young Indian women, who were girls not so long ago, and who understands what young Indian girl needs. Ethnos Fashion brings to you this lehenga choli which is available in a shade of attractive colours and is made from taffeta satin silk. This lehenga cholis is semi-stitched, so you can make it according to your needs. The lehenga choli is a suitable choice when it comes to choosing an ethnic wear or a festive wear for your wardrobe. Our dresses are designed to be smooth and comfortable to wear for kids. We have Best Trending Stylish Collection for Girls. Composition Taffeta Satin Silk and Embroidery We Deal In Lehengas Ghagra Choli Chaniya Choli Lehenga Choli Kids dresses Ethnic Wear Traditional Wear Party Wear Gowns Frocks and Accessories for Girls and Baby Girls. Best suited for Occasions Like Birthday Weddings Festivals like Diwali Eid Navratri Holi and Christmas Special Demand We also customize orders for Bulk requirement. Hope you like our Trendy Kids wear collection and you enjoy shopping with us.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 2, 2, 1, 0.00, 1, 20.00, 'Percent', 1, 2, '', 1, 55.00, 1, 'smooth-semi-stitched-lehenga-mzm2', 'MTYZMTAWODK0ODG4NTY', 1, 1, 0, 0, NULL),
(53, 19, 153, 529, 3, 'Heavy Sequence Work Velvet Lehenga', 'seller', 29, NULL, 4, 2, '', '[\"lahenga\",\"wedding\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mziymdmxnjmxmda5mda2.jpeg\",\"upload\\/product\\/photos\\/mjk4nzaxnjmxmda5mda2.jpeg\",\"upload\\/product\\/photos\\/njeymjexnjmxmda5mda2.jpeg\",\"upload\\/product\\/photos\\/oty0ntixnjmxmda5mda2.jpeg\"]', 'upload/product/thumbnail/ntq4odaxnjmxmda5mda2.jpeg', '', '<ul><li>Velvet product lehenga</li><li>Heavy sequence work</li><li>Semi stitched suit</li><li>Unstitched blouse</li><li>COD all over Nepal</li><li>Easy to exchange/refund if item is damage or defect</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 4000.00, 1, 20.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'heavy-sequence-work-velvet-lehenga-nja1', 'MTYZMTAWOTAWNJG5NJA', 0, 1, 0, 0, NULL),
(54, 23, 171, 465, 3, 'music instruments', 'seller', 28, NULL, 4, 2, '4.80', '[\"musicinstruments\",\"music\",\"instruments\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mta5mzmxnjmxmda5mzaz.jpeg\",\"upload\\/product\\/photos\\/nziwndgxnjmxmda5mzaz.jpeg\",\"upload\\/product\\/photos\\/mzu1mdcxnjmxmda5mzaz.jpeg\",\"upload\\/product\\/photos\\/oduzmzixnjmxmda5mzaz.jpeg\",\"upload\\/product\\/photos\\/odcymtixnjmxmda5mzaz.jpeg\"]', 'upload/product/thumbnail/otewoduxnjmxmda5mzaz.jpeg', '', '<p><span style=\"color: rgb(33, 37, 41);\">Hearing music can make us dance, laugh, or cry; it has the power to excite us or give us goosebumps. Playing music, on the flipside, can make you smarter. Learning an instrument improves your brain’s executive function—the ability to manage resources and achieve goals. In doing so, being musical also strengthens your capacity to consider multiple concepts at once, a key facet of creative thinking. Instruments with baked-in teaching tools might be no replacement for an experienced human instructor, but they’re easy, at-home ways to help start the process. Bonus: They won’t get on your case about practicing your scales. 1. Strum the strings Fretlight FG-621 guitar’s ­translucent polymer fretboard show your fingers where to hold the strings to craft chords. Compatible smartphone apps, such as Guitar Tunes and MyJam, wirelessly send signals to those lights to guide you through fingerings, scales, and power chords. You can slow down or speed up the lessons to match your skill level. Once you’ve mastered the basics, turn off the lights and rock out on your legit ­electric ax until your fingers bleed from too much shredding.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 150, 2500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'music-instruments-otix', 'MTYZMTAWOTMWMZK1MZQ', 1, 1, 0, 0, NULL),
(55, 27, 127, 667, 3, 'sprts fasion shoes', 'seller', 32, 2, NULL, 2, '0.100', '[\"sporsshoes\",\"shoes\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/nde4mdyxnjmxmda5mza4.jpeg\",\"upload\\/product\\/photos\\/mjg2otyxnjmxmda5mza4.jpeg\"]', 'upload/product/thumbnail/njg3ndkxnjmxmda5mza4.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">Men Sport Shoes</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 850.00, 1, 20.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'sprts-fasion-shoes-otm2', 'MTYZMTAWOTMWODE3MDM', 0, 1, 0, 0, NULL),
(56, 26, 147, 425, 3, 'TP-LINK TL-WR940N', 'seller', 30, NULL, 4, 2, '.4', '[\"Router\",\"wifirouter\",\"tplinkrouter\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntc0otaxnjmxmda5ndc4.jpeg\",\"upload\\/product\\/photos\\/nzgynzyxnjmxmda5ndc4.jpeg\",\"upload\\/product\\/photos\\/odi2otkxnjmxmda5ndc4.jpeg\",\"upload\\/product\\/photos\\/ndkxodyxnjmxmda5ndc4.jpeg\"]', 'upload/product/thumbnail/nti4mdyxnjmxmda5ndc4.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">450Mbps Wireless N Router TL-WR940N is a combined wired/wireless network connection device designed specifically for small business and home office networking requirements. With MIMO Technology, TL-WR940N creates an exceptional and advanced wireless performance, making it ideal for streaming HD video, VoIP and online gaming. Also, WPS button on the sleek and fashionable exterior ensures WPA2 encryptions, preventing the network from outside intrusions.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 100, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 70.00, 1, 'tp-link-tl-wr940n-odez', 'MTYZMTAWOTQ3ODGYNZG', 1, 1, 0, 2, NULL),
(57, 19, 156, 548, 3, 'Free Size Plain Ladies Palazzo Pants', 'seller', 29, NULL, 4, 2, '', '[\"plazo\",\"salwer\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otmyotaxnjmxmda5nta1.jpeg\",\"upload\\/product\\/photos\\/ndiymdcxnjmxmda5nta2.jpeg\",\"upload\\/product\\/photos\\/ntm4nzgxnjmxmda5nta2.jpeg\",\"upload\\/product\\/photos\\/odq4mtixnjmxmda5nta2.jpeg\"]', 'upload/product/thumbnail/mjc0otmxnjmxmda5nta1.jpeg', '', '<ul><li>100% Rayon</li><li>Elastic with Drawstring closure</li><li>LadyLine USA offers Soft Rayon material plain palazzo pants with 2 pockets</li><li>Length = 36 inches / Inseam = 24 inches / Thighs = 24 inches ( Ready garment measures)</li><li>Elastic Wasit size- Relax = 21 inches, Full stretched = 42 inches.</li><li>FREE SIZE / ONE SIZE</li><li>Available in 5 basic colours.</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 15, 450.00, 1, 5.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'free-size-plain-ladies-palazzo-pants-odkw', 'MTYZMTAWOTUWNJQYNTK', 0, 1, 0, 0, NULL),
(58, 28, 111, 362, 3, 'kiddeo Kids Girls Full Sleeve t Shirts', 'seller', 31, 10, NULL, 2, '', '[]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/mzq2mjaxnjmxmda5ntq0.jpeg\",\"upload\\/product\\/photos\\/ndy2mdixnjmxmda5ntq0.jpeg\"]', 'upload/product/thumbnail/mtg0mzmxnjmxmda5ntq0.jpeg', '', '<p><br></p><p><span style=\"color: rgb(51, 51, 51);\">This super comfortable T-Shirt by Kiddeo is a must have for your little one. Pair it with a casual pair of jeans and comfortable shoes for a playdate.</span></p>', 1, '[{\"name\":\"Red\",\"image\":\"upload\\/product\\/photos\\/ote5odaxnjmxmda5ntq0.jpeg\"},{\"name\":\"Black\",\"image\":\"upload\\/product\\/photos\\/odg3odqxnjmxmda5ntq0.jpeg\"}]', 2, 1, 1, 1, 2, 50, 1400.00, 2, 1.00, 'Percent', 1, 0, '', 1, 45.00, 1, 'kiddeo-kids-girls-full-sleeve-t-shirts-nji1', 'MTYZMTAWOTU0NDQXNTM', 0, 1, 0, 0, NULL),
(59, 23, 105, 475, 3, 'Gaming Console', 'seller', 28, NULL, 4, 2, '', '[\"gamingconsole\",\"Console\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzkwnduxnjmxmda5nju3.jpeg\",\"upload\\/product\\/photos\\/mziyntmxnjmxmda5nju3.jpeg\",\"upload\\/product\\/photos\\/mjkxotkxnjmxmda5nju3.jpeg\"]', 'upload/product/thumbnail/mjc1mzaxnjmxmda5nju3.jpeg', '', '<p>GAME IN</p><p>Mass Gaming is a category which Mitashi has mastered like no one else. Right from the 8 bit range of hand held and TV connected gaming consoles to the ultra-modern Thunder series of android gaming consoles and tablets gamers have always expected miracles from Mitashi. GAMEin products have not only been spoken about in the gaming and tech media circle with high regard, but have been loved by gamers across the world for the past 17 years.</p><p>Its iconic brands Smarty, Junior, Champ, Infrazone, Thunder bolt have been reigning the Indian gaming industry for a little less than two decades now with continuous innovation to suit the changing needs of a gamer.</p><p>ABOUT MITASHI:</p><p>Mitashi, is a Market Leader in TV Video Games and India’s leading Premium Value Brand for Consumer Electronics Segment.</p><p>Starting its journey with Educational Computers and TV Video Games, Mitashi has diversified its Kids Portfolio with several brands under its umbrella, GameIn – High End TV Video Games, Skykidz – Kids Fun and Learn Products, Bang – Foam Bullet Guns and Dash – Stunt and Licensed RC Cars, ensuring it has an offering for the childs every need, Hobby Lobby – DIY (do-it-yourself) toys and Playsmart – covering variety of board games for complete family fun.</p><p>The company has also established itself as a provider for its High-Quality LED TV’s, DVD Player’s, Speaker Systems, Tablet’s and Mobile’s. After several years of RandD, Mitashi recently expanded its product portfolio, by adding Air Conditioners and Washing Machines</p><p>In India, the company has a strong foothold at pan-India level, covering huge number of trade and distribution partners, Large Format Store Partners, and E-Commerce. Over the last year, Mitashi has successfully expanded into several International markets across Europe and the Middle East with more aggressive plans to enter more countries in the coming years.</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 200, 850.00, 2, 1.00, 'Percent', 1, 2, '1 month', 1, 80.00, 1, 'gaming-console-odyx', 'MTYZMTAWOTY1NZGXNTC', 0, 1, 0, 0, NULL),
(60, 27, 127, 672, 3, 'casual shoes', 'seller', 32, NULL, NULL, 2, '0.100', '[\"shoes\",\"csualshoes\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nti1odyxnjmxmda5njc1.jpeg\",\"upload\\/product\\/photos\\/ndyynjgxnjmxmda5njc1.jpeg\"]', 'upload/product/thumbnail/otu1mtcxnjmxmda5njc1.jpeg', '', '<h1>Men Shoes 2020 Autumn Fashion High Quality Casual Walking Shoes Men New Leisure Footwear Male Brand Leather Men Casual Shoes</h1><p>Seller:&nbsp;DECARSDZ Store&nbsp;</p><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 200, 1350.00, 2, 1.00, 'Percent', 1, 1, '1 year', 1, 50.00, 1, 'casual-shoes-njmy', 'MTYZMTAWOTY3NTK2MZE', 1, 1, 0, 0, NULL),
(61, 26, 148, 436, 3, 'APPLE MACBOOK PRO 13\" WITH TOUCH BAR - SPACE GRAY (2018-HE)', 'seller', 30, NULL, 4, 2, '4', '[\"laptop\",\"appleproduct\",\"applelaptop\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzc5ntcxnjmxmda5odqz.jpeg\",\"upload\\/product\\/photos\\/ntg4mjuxnjmxmda5odqz.jpeg\",\"upload\\/product\\/photos\\/mjaymdixnjmxmda5odqz.jpeg\"]', 'upload/product/thumbnail/otgwndqxnjmxmda5odqz.jpeg', '', '<p><span style=\"color: rgb(65, 65, 65);\">MacBook Pro elevates the notebook to a whole new level of performance and portability. Wherever your ideas take you, you’ll get there faster than ever with high‑performance processors and memory, advanced graphics, blazing‑fast storage, and more. This model features the Apple Touch Bar.</span></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 30, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 180.00, 1, 'apple-macbook-pro-13-with-touch-bar---space-gray-2018-he-otgy', 'MTYZMTAWOTG0MZKZODM', 1, 1, 0, 1, NULL),
(62, 19, 156, 550, 3, 'Georgette Sharara', 'seller', 29, NULL, 4, 2, '', '[\"sarara\",\"garara\",\"leenga\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndcyodaxnjmxmda5otq1.jpeg\",\"upload\\/product\\/photos\\/nji0nzexnjmxmda5otq1.jpeg\",\"upload\\/product\\/photos\\/mtq1odixnjmxmda5otq1.jpeg\",\"upload\\/product\\/photos\\/mjywodcxnjmxmda5otq1.jpeg\"]', 'upload/product/thumbnail/nzi4ntmxnjmxmda5otq1.jpeg', '', '<ul><li>STYLE :- This suit is Ready to wear. Just select your size &amp; order. (3 pcs set)</li><li>Top Fabric : Faux Georgette || || Bottom Fabric : Faux Georgette|| Dupatta Fabric :Pure Net || Inner Fabric : Santoon</li><li>Extra Feature: This readymade Suit comes with added 1 inch allowance on each side to alter the size by simply removing the thread to extend the size.</li><li>Kameez Length (Top):- 45-46 inches.... if you want the length shorter, then please inform us within 24 hours after the order . If not Message received the maximum length will be kept as mentioned</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 2550.00, 1, 5.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'georgette-sharara-mti2', 'MTYZMTAWOTK0NTQ5NDU', 1, 1, 0, 0, NULL),
(63, 29, 176, 618, 3, 'Pans', 'seller', 28, NULL, 4, 2, '1.5', '[\"Pan\",\"Pans\",\"dishpan\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otg0mjaxnjmxmdewmda3.jpeg\",\"upload\\/product\\/photos\\/mje4nzmxnjmxmdewmda4.jpeg\",\"upload\\/product\\/photos\\/mjy3nzixnjmxmdewmda4.jpeg\",\"upload\\/product\\/photos\\/mtg3ntaxnjmxmdewmda4.jpeg\"]', 'upload/product/thumbnail/mjy3mzqxnjmxmdewmda3.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">Whether flash frying at very high temperatures or preparing delicate foods with little fat: with the large frying pan (28 cm diameter) from the Profi Resist range, juicy steaks have a crispy outer crust and fish fillets are opaque and shiny inside. The PermaDur non-stick coating and the sophisticated honeycomb structure on the frying surface make sure that no food burns onto the pan. And as the fat can distribute perfectly beneath the food, wonderfully even and precise frying results are not the exception, but rather the rule.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 3000, 280.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'pans-ndgz', 'MTYZMTAXMDAWODU4NDC', 0, 1, 0, 0, NULL),
(64, 27, 127, 685, 3, 'Eaglewood', 'seller', 32, NULL, NULL, 2, '0.300', '[\"farmalshoes\",\"shoes\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndi4njgxnjmxmdewmdi5.jpeg\",\"upload\\/product\\/photos\\/mjkynzaxnjmxmdewmdi5.jpeg\"]', 'upload/product/thumbnail/ntm0nzqxnjmxmdewmdi5.jpeg', '', '<p><span style=\"color: rgb(33, 33, 33);\">Men\'s Fashion Lace-Ups Shoes for Man Formal Dress Shoes for Man Oxford For Men&nbsp;&nbsp;(Bronze)</span></p>', 2, '[]', 2, 1, 1, 1, 2, 80, 1000.00, 2, 1.00, 'Percent', 1, 1, '6 month', 1, 50.00, 1, 'eaglewood-njky', 'MTYZMTAXMDAYOTGWODG', 1, 1, 0, 0, NULL),
(65, 26, 172, 481, 3, 'LG UHD 70 Series 50 inch 4K Smart TV', 'seller', 30, NULL, 4, 2, '12', '[\"tv\",\"lgtv\",\"lgtv50\"]', '50in', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odexodexnjmxmdewmtuy.jpeg\",\"upload\\/product\\/photos\\/ntg3nzexnjmxmdewmtuy.jpeg\"]', 'upload/product/thumbnail/otmznzexnjmxmdewmtuy.jpeg', '', '<p class=\"ql-align-center\">Put your entertainment on full display. Available in a variety of sizes, LG UHD TV (UN7000) is engineered with real 4K displays for four times the resolution of standard TV. Its processor enhances color, contrast, clarity and detail, while compatibility with smart assistants like Google home and Alexa allows for convenient voice control.</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 47, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 230.00, 1, 'lg-uhd-70-series-50-inch-4k-smart-tv-mzy4', 'MTYZMTAXMDE1MJQ4MZG', 0, 1, 0, 0, NULL),
(66, 26, 173, 498, 3, 'LG 9 kg 5 Star Semi-Automatic Top Loading Washing Machine (P9040RGAZ, Grey, Lint collector)', 'seller', 30, NULL, 4, 2, '6.5', '[\"washing\",\"washingmachine\",\"lgwashingmachine\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mtg0ndkxnjmxmdewndq2.jpeg\",\"upload\\/product\\/photos\\/mjq4nzqxnjmxmdewndq2.png\"]', 'upload/product/thumbnail/mtkwmzqxnjmxmdewndq2.jpeg', '', '<p><span style=\"color: rgb(15, 17, 17);\">No more fiber sticking to your washing machine’s pipe. Lint Collector accommodates all the fiber detached from the clothes while washing.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 12000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 120.00, 1, 'lg-9-kg-5-star-semi-automatic-top-loading-washing-machine-p9040rgaz-grey-lint-collector-njm2', 'MTYZMTAXMDQ0NJU4OTE', 1, 1, 0, 5, NULL),
(67, 28, 111, 367, 3, 'Girls Cotton Brief Panty Innerwear ', 'seller', 31, NULL, NULL, 2, '', '[\"Innerwear\",\"panty\",\"underwear\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/nzaznjmxnjmxmdewndcx.jpeg\",\"upload\\/product\\/photos\\/mjkzmdmxnjmxmdewndcx.jpeg\",\"upload\\/product\\/photos\\/ntk0mdgxnjmxmdewndcx.jpeg\"]', 'upload/product/thumbnail/odu0mtmxnjmxmdewndcx.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">Varsha Creation Baby Girl &amp; Boys Panties Set. 100% Cotton, Breathable &amp; Very Skin Friendly. Pack of 6 Panties. This Pantie promises utmost comfort and breathability for your little one all day long. It is ideal for Inner Wear. Suitable for Baby Girls. Good for all Seasons - summer, spring, winter or autumn. Perfect for playtime, fun time, nap time or anytime. Wash Care: Easy to Wash and Dry. Can be Hand Washed &amp; Machine Wash. Do not bleach or Wrin</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 500.00, 1, 1.00, 'Percent', 1, 0, '', 1, 30.00, 1, 'girls-cotton-brief-panty-innerwear--ntaw', 'MTYZMTAXMDQ3MTU2ODU', 0, 1, 0, 0, NULL),
(68, 27, 127, 695, 3, 'loafer', 'seller', 32, 2, NULL, 2, '0220', '[\"loafer\",\"shoes\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/oduwmjkxnjmxmdewndk2.png\",\"upload\\/product\\/photos\\/mzu3ntqxnjmxmdewndk3.jpeg\"]', 'upload/product/thumbnail/odi2njixnjmxmdewndk2.png', '', '<h2><strong>Product :</strong>Men Fashion Casual Shoes New Style Loafer Shoes Comfortable Slip On Men\'s Loafers&nbsp;<strong>Color :</strong>Grey/Blue/Black<strong>Size :</strong>39-44<strong>Material :</strong>Fabric+Rubber<strong>MOQ :</strong>10 Pairs<strong>Payment</strong>&nbsp;:Trade&nbsp;Assurance,&nbsp;Western&nbsp;union,&nbsp;T/T,&nbsp;Paypal,&nbsp;Escrow<strong>Delivery</strong>&nbsp;:DHL,&nbsp;FEDEX,&nbsp;UPS,&nbsp;EMS,&nbsp;TNT,&nbsp;China&nbsp;Post,&nbsp;etc.<strong>Remarks:</strong>Acceptable.OEM&nbsp;&amp;&nbsp;ODM&nbsp;<strong>Packing :</strong>1) 1pc/bag;&nbsp;2)According to your request to packing&nbsp;</h2>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 1200.00, 2, 1.00, 'Percent', 1, 1, '1 year', 1, 50.00, 1, 'loafer-mtqy', 'MTYZMTAXMDQ5NZU2MJM', 1, 1, 0, 0, NULL),
(69, 29, 179, 655, 3, 'Flasks', 'seller', 28, NULL, 4, 2, '', '[\"Flasks\",\"flask\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzy4mjmxnjmxmdewnzgw.jpeg\",\"upload\\/product\\/photos\\/njc1ntexnjmxmdewnzgw.jpeg\",\"upload\\/product\\/photos\\/mjy4ntmxnjmxmdewnzgw.jpeg\",\"upload\\/product\\/photos\\/ntkxnzyxnjmxmdewnzgw.jpeg\"]', 'upload/product/thumbnail/njy5otyxnjmxmdewnzgw.jpeg', '', '<p><br></p><p><span style=\"color: rgb(0, 0, 0);\">Supplied with a 50 year guarantee, this flask from Thermos features a generous 1.2 litre capacity and it is perfect for staying hydrated whilst on the go. Featuring THERMOS ® vacuum insulation technology suitable to keep contents hot for up to 24 hours or cold for 24 hours, this flask has been made with a durable stainless steel interior and exterior. Complete with an insulated stainless steel serving cup.</span></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 1000, 490.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'flasks-ndi4', 'MTYZMTAXMDC4MTQ3NZM', 0, 1, 0, 0, NULL),
(70, 26, 174, 507, 3, 'Samsung 2 Ton Split Air Conditioner AR24JC3HATP', 'seller', 30, 6, 4, 2, '12', '[\"InverterAc\",\"samsungac\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otewmtyxnjmxmdewnzgz.jpeg\",\"upload\\/product\\/photos\\/ntq2mdcxnjmxmdewnzgz.jpeg\",\"upload\\/product\\/photos\\/mzcxnzcxnjmxmdewnzgz.jpeg\"]', 'upload/product/thumbnail/mza2odaxnjmxmdewnzgz.jpeg', '', '<h3>Features:</h3><ul><li>Smart Saver&nbsp;System.</li><li>Energy saving model.</li><li>24000 BTU.</li><li>Samsung Multi jet&nbsp;technology.</li><li>Anti-Bacteria coating&nbsp;.</li><li>Turbo cool&nbsp;with temperature Wave.</li><li>Two Years Compressor, Parts and service warranty.</li></ul><h3>Detail Specification of&nbsp;Samsung 2 Ton&nbsp;</h3><p><br></p>', 2, '[]', 2, 1, 1, 1, 2, 30, 80000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 200.00, 1, 'samsung-2-ton-split-air-conditioner-ar24jc3hatp-ndc5', 'MTYZMTAXMDC4NDIWNZG', 0, 1, 0, 0, NULL),
(71, 27, 124, 708, 3, 'kids analog watch', 'seller', 32, NULL, NULL, 2, '0.100', '[\"watch\",\"anlogwatch\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ote3mzuxnjmxmdewodq4.jpeg\",\"upload\\/product\\/photos\\/odyxnzkxnjmxmdewodq4.jpeg\"]', 'upload/product/thumbnail/oty1mjaxnjmxmdewodq4.jpeg', '', '<p>Kids analog watch and Multi-color choices for boys and girls,simple and fashion design,special design for learnning time child.</p><p>For your kids as a gift or send friends’kids boys or girls all prefect ,the watch is a great choice.</p><p>Features and Functions :</p><p>High Quality Movement and Battery:Japanese-Quartz Movement,keeping time precise.</p><p>Soft Watch Band:Wear comfortable.</p><p>Stainless Steel Back Cover and Buckle:Shock resistant and durable.</p><p>All Kinds of Occasion:Perfect for both outdoor and indoor sports.</p><p>Specification:</p><p>Suitable age:5-13years</p><p>Dial Color: Black/Pink/Blue/Red/White</p><p>Dial Case Diameter: 34mm/1.33inch</p><p>Dial Case Thickness: 7mm/0.27inch</p><p>Band Length:23cm/9.06inch</p><p>Band Width: 14mm/0.55inch</p><p>Max Fit Wrist:21cm/8.27in</p><p>Min Fit Wrist :15.5cm/6.1in</p><p>Watch Weight: 26g / 0.91oz</p><p>Band Clasp Type: Buckle</p><p>Package Contents:</p><p>1 * watch (boys and girls) - children</p><p>1 * gift box</p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 400.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'kids-analog-watch-odu3', 'MTYZMTAXMDG0ODY5MTE', 0, 1, 0, 0, NULL),
(72, 29, 182, 670, 3, 'Beds', 'seller', 28, NULL, 4, 2, '200', '[\"Beds\",\"Bed\",\"Bedfurniture\"]', '6ft*3ft*2ft', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzq0mtexnjmxmdexmtu2.jpeg\",\"upload\\/product\\/photos\\/otq0njyxnjmxmdexmtu3.jpeg\",\"upload\\/product\\/photos\\/njazoduxnjmxmdexmtu3.jpeg\",\"upload\\/product\\/photos\\/odc2mzixnjmxmdexmtu3.jpeg\"]', 'upload/product/thumbnail/ndgzmzexnjmxmdexmtu2.jpeg', '', '<h1>Aarsun Royal Bed with Side Tables in Teak Wood, Bedroom Set, King-Size, Hand Carved, Light Walnut Finish, Brown</h1><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 130, 65000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 450.00, 1, 'beds-nzu0', 'MTYZMTAXMTE1NZYXNDC', 1, 1, 0, 0, NULL),
(73, 26, 175, 530, 3, 'SAMSUNG 600L FROST FREE FRENCH DOOR FRIDGE WITH TWIN COOLING PLUS – RF28R7351', 'seller', 30, 6, 4, 2, '', '[]', 'RF28R7351', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzuwndyxnjmxmdexmtu5.jpeg\",\"upload\\/product\\/photos\\/ntq2odkxnjmxmdexmtu5.jpeg\",\"upload\\/product\\/photos\\/ndgwntuxnjmxmdexmtu5.jpeg\"]', 'upload/product/thumbnail/odg2mtixnjmxmdexmtu5.png', '', '<p>Easily switch modes</p><p>FlexZone™ with a upgraded Smart Divider &amp; lock</p><p>Store different foods and drinks at an optimal temperature, so items stay fresh and tasty. The FlexZone™ has four settings that are ideal for preserving meat and fish, storing deli foods, chilling wine or cooling beverages. A Smart Divider can be locked in place to organise items efficiently.</p><p>Moist, fresh natural tasting food</p><p>Twin Cooling Plus</p><p>Ensure your food stays more moist and fresh for longer*. Twin Cooling Plus™ optimises the temperature and humidity in the fridge and freezer with independent cooling systems. It preserves food in the optimal conditions and protects its original flavour and aroma by preventing odours from mixing.</p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 40, 0.00, 1, 12.00, 'Percent', 1, 0, '', 1, 300.00, 1, 'samsung-600l-frost-free-french-door-fridge-with-twin-cooling-plus--rf28r7351-mza3', 'MTYZMTAXMTE1OTUZNDU', 1, 1, 0, 1, NULL),
(74, 27, 124, 715, 3, 'straps watch', 'seller', 32, NULL, NULL, 2, '0.080', '[\"watch\",\"strapswatch\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mti2ndkxnjmxmdexmjcw.jpeg\",\"upload\\/product\\/photos\\/mzm3mzuxnjmxmdexmjcw.jpeg\"]', 'upload/product/thumbnail/mzaxodyxnjmxmdexmjcw.jpeg', '', '<p><span style=\"color: rgb(29, 29, 29);\">The NATO-style watch strap has become more than an essential watch accessory — it’s practically a&nbsp;</span><em style=\"color: rgb(29, 29, 29);\">necessity</em><span style=\"color: rgb(29, 29, 29);\">&nbsp;if you love watches. And it’s not hard to see why: a NATO is cheap, it’s durable, it’s simple to swap in and out, it’s easy to clean and it’s&nbsp;</span><a href=\"https://www.gearpatrol.com/watches/a736984/further-details-nato-strap/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(29, 29, 29); background-color: rgb(255, 255, 255);\">military-inspired looks&nbsp;</a><span style=\"color: rgb(29, 29, 29);\">play into the whole tacti-cool trend that refuses to die. Point being, if you have a nice watch consider getting a decent NATO strap. Or a handful.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 300.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'straps-watch-odkw', 'MTYZMTAXMTI3MDG3MDQ', 0, 1, 0, 0, NULL),
(75, 28, 116, 399, 3, 'Boys Sandals Children Sandals', 'seller', 31, 12, NULL, 2, '', '[\"sandals\",\"jota\",\"shoes\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/nju1ntixnjmxmdexndmx.jpeg\",\"upload\\/product\\/photos\\/ndawndixnjmxmdexndmx.jpeg\",\"upload\\/product\\/photos\\/nde0mtkxnjmxmdexndmx.jpeg\"]', 'upload/product/thumbnail/mtg5odkxnjmxmdexndmx.jpeg', '', '<p>Upper Material: cotton</p><p>Outsole Material: Rubber</p><p>Heel Height: 2cm</p><p>Fashion Element: Platform</p><p>Season: Summer</p><p>Size		 Foot Length</p><p>26		17cm</p><p>27		17.5cm</p><p>28		18cm</p><p>29		18.6cm</p><p>30		19.2cm</p><p>31		19.8cm</p><p>32		20.4cm</p><p>33		21.5cm</p><p>34		22cm</p><p>35		22.5cm</p><p>36		23cm</p><p>37		23.5cm</p><p>38		24.2cm</p><p>39		24.7cm</p>', 2, '[]', 2, 1, 1, 1, 2, 45, 2500.00, 1, 5.00, 'Percent', 1, 0, '', 1, 70.00, 1, 'boys-sandals-children-sandals-mzix', 'MTYZMTAXMTQZMTC4NJM', 1, 1, 0, 0, NULL),
(76, 19, 159, 658, 3, 'perfume ', 'seller', 29, NULL, 5, 2, '', '[\"perfume\",\"sent\",\"ator\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mta5njixnjmxmdexnte3.jpeg\",\"upload\\/product\\/photos\\/nzgyotcxnjmxmdexnte3.jpeg\",\"upload\\/product\\/photos\\/oti2mzgxnjmxmdexnte3.jpeg\",\"upload\\/product\\/photos\\/njk5njcxnjmxmdexnte3.jpeg\"]', 'upload/product/thumbnail/ndy5mdyxnjmxmdexnte3.jpeg', '', '<p><strong>Brand  :     </strong>Versace</p><p><strong>Item Form  :   </strong>Spray </p><p><strong>Item Volume :    </strong>90 Milliliters</p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 750.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'perfume--odiz', 'MTYZMTAXMTUXNZE5NDK', 0, 1, 0, 0, NULL),
(77, 29, 183, 674, 3, 'Sofa', 'seller', 28, NULL, 4, 2, '60', '[\"Sofa\",\"Sofaset\",\"Sofachair\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/njc3mzkxnjmxmdexntgy.jpeg\",\"upload\\/product\\/photos\\/ntk5ndaxnjmxmdexntgy.jpeg\",\"upload\\/product\\/photos\\/njm5otyxnjmxmdexntgy.jpeg\",\"upload\\/product\\/photos\\/ndm3odcxnjmxmdexntgy.jpeg\"]', 'upload/product/thumbnail/mjgwntaxnjmxmdexntgx.jpeg', '', '<p><span style=\"color: rgba(0, 0, 0, 0.8);\">Welcome to Alshone Home.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 40, 12000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 350.00, 1, 'sofa-ntuw', 'MTYZMTAXMTU4MJU4MDC', 0, 1, 0, 0, NULL),
(78, 26, 177, 564, 3, 'Top 10 Best Sandwich Makers in 2021 Reviews', 'seller', 30, NULL, 4, 2, '', '[\"sandwich\",\"sandwichmaker\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/njq4mtcxnjmxmdexnjuz.jpeg\",\"upload\\/product\\/photos\\/ntyxmzixnjmxmdexnjuz.jpeg\",\"upload\\/product\\/photos\\/oti1njuxnjmxmdexnjuz.jpeg\"]', 'upload/product/thumbnail/ntiymzixnjmxmdexnjuz.jpeg', '', '<p>Convenient, quick and easy to use, there\'s so much you can do with the&nbsp;<strong style=\"background-color: transparent;\">white Kenwood Sandwich Maker SM650</strong>. From tasty cheese toasties, sandwich melts and panini, experiment with different fillings for your perfect toasted sandwich.</p><p>Grill vegetables and kebabs for healthy nutritious meals. Make sweet snacks and desserts such as waffles, pancakes and fruit turnovers. And for savoury snacks and meals try omelettes, calzones and crispy burritos.</p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 40, 13000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 120.00, 1, 'top-10-best-sandwich-makers-in-2021-reviews-mzax', 'MTYZMTAXMTY1MZE5MZM', 1, 1, 0, 0, NULL),
(79, 27, 130, 640, 3, 'AXE Extreme kit', 'seller', 32, NULL, NULL, 2, '0.150', '[\"deodorants\",\"grooming\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzq4ndyxnjmxmdexnzey.jpeg\",\"upload\\/product\\/photos\\/oty5ntuxnjmxmdexnzey.jpeg\"]', 'upload/product/thumbnail/nzkymjqxnjmxmdexnzey.jpeg', '', '<ul><li>Combo of 4 essentials including the Axe Signature Body Perfume Mysterious (122ml), Axe Dark Temptation Deodorant Body Spray Can (150ml), the Axe Signature Denim After Shave Lotion (50ml) and the Axe Signature Denim Shaving Cream (78g)</li><li>Free Travel Pouch</li><li>Keeps You Ready On The Go</li><li>Long Lasting fragrances to keep you refreshed all day long</li><li>Perfect combination of the Axe Signature Denim After Shave Lotion (50ml) and the Axe Signature Denim Shaving Cream (78g) for an ultimate smooth shaving experience</li><li>A compact and stylish pack design that fits in easily whether its your backpack or your luggage</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 200, 700.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'axe-extreme-kit-nzg3', 'MTYZMTAXMTCXMJU5MZC', 1, 1, 0, 0, NULL),
(80, 19, 168, 706, 3, 'Flora Nikrooz Women\'s Plus-Size Stella Gown', 'seller', 29, NULL, 4, 2, '', '[\"nighty\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjazodkxnjmxmdexotiy.jpeg\",\"upload\\/product\\/photos\\/ntcxmjqxnjmxmdexotiy.jpeg\",\"upload\\/product\\/photos\\/mtc5nzkxnjmxmdexotiy.jpeg\",\"upload\\/product\\/photos\\/nziwnzexnjmxmdexotiz.jpeg\",\"upload\\/product\\/photos\\/mtmyotyxnjmxmdexotiz.jpeg\"]', 'upload/product/thumbnail/mzqwmtuxnjmxmdexotiy.jpeg', '', '<ul><li>100% Polyester</li><li>Imported</li><li>Hand Wash</li><li>Midi-length satin nightgown featuring lace-trimmed neckline with dotted netting and high/low hemline</li><li>Adjustable straps</li><li>Dotted netting at back</li><li>Tie at waistband</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 750.00, 1, 10.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'flora-nikrooz-womens-plus-size-stella-gown-mzyz', 'MTYZMTAXMTKYMZC3MZA', 1, 1, 0, 0, NULL),
(81, 29, 184, 693, 3, 'Kids Room Furniture', 'seller', 28, NULL, 4, 2, '', '[\"KidsRoomFurniture\",\"kidsfurniture\",\"kidsroom\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nde4ntexnjmxmdexotu0.jpeg\",\"upload\\/product\\/photos\\/otaxmdkxnjmxmdexotu0.jpeg\",\"upload\\/product\\/photos\\/ode5mjyxnjmxmdexotu0.jpeg\",\"upload\\/product\\/photos\\/odq1njyxnjmxmdexotu0.jpeg\"]', 'upload/product/thumbnail/nduyodcxnjmxmdexotu0.jpeg', '', '<p>With précised understanding of clients’ variegated necessities, we are affianced in presenting a comprehensive gamut of&nbsp;<strong>Kids Room Furniture</strong>. Making use of finest techniques together with quality assured material; these products are developed beneath the command of assiduous personnel. More to this, the entire collection is thoroughly reviewed before final shipment.</p><p>&nbsp;</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 60000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 450.00, 1, 'kids-room-furniture-ndc0', 'MTYZMTAXMTK1NDEYOTI', 1, 1, 0, 0, NULL),
(82, 26, 177, 575, 3, 'GTC 12 Cup Coffee Maker, Black', 'seller', 30, NULL, 4, 2, '', '[\"coffeemakers\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mtkxntuxnjmxmdexotg0.jpeg\",\"upload\\/product\\/photos\\/nte2nzcxnjmxmdexotg0.jpeg\",\"upload\\/product\\/photos\\/mjawotixnjmxmdexotg0.jpeg\"]', 'upload/product/thumbnail/mzg2mjkxnjmxmdexotg0.jpeg', '', '<p><em style=\"color: rgb(112, 112, 112);\">Actual product packaging and materials may contain more or different information than that shown on our website. You should not rely solely on the information presented here. Always read labels, warnings and directions before using or consuming a product.</em></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 80, 5000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 100.00, 1, 'gtc-12-cup-coffee-maker-black-odq0', 'MTYZMTAXMTK4NDYYMJG', 0, 1, 0, 1, NULL),
(83, 27, 130, 644, 3, 'URBAN NIGHTS', 'seller', 32, NULL, NULL, 2, '', '[\"perfume\",\"seant\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjizntexnjmxmdeymdi1.jpeg\",\"upload\\/product\\/photos\\/ntkzntmxnjmxmdeymdi1.jpeg\"]', 'upload/product/thumbnail/odgyndcxnjmxmdeymdi1.jpeg', '', '<p>A man’s fragrance is as personal as his story. If you tell it right, the way people perceive you can change. Similarly, when you choose a scent that’s synonymous with your style and your true personality, everyone’s opinion of you, shifts for good.&nbsp;</p><p>It brings them closer to you. And that’s the kind of charm you’re looking for this party season, aren’t you?</p><p>However, what you’re not looking for, is a whiff that vanishes into the wind by the time you’ve reached your destination. So, here are five of the best long-lasting perfumes for men:&nbsp;&nbsp;&nbsp;&nbsp;</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 200, 800.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'urban-nights-odc2', 'MTYZMTAXMJAYNTY4ODM', 0, 1, 0, 0, NULL),
(84, 26, 191, 584, 3, 'Clothes iron', 'seller', 30, NULL, 4, 2, '2', '[\"irons\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ote3nduxnjmxmdeymze5.jpeg\",\"upload\\/product\\/photos\\/mzu3ndixnjmxmdeymze5.jpeg\"]', 'upload/product/thumbnail/mje0mtmxnjmxmdeymze5.jpeg', '', '<ul><li>A design that allows the iron to be set down, usually standing on its end, without the hot soleplate touching anything that could be damaged;</li><li>A&nbsp;<a href=\"https://en.wikipedia.org/wiki/Thermostat\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">thermostat</a>&nbsp;ensuring maintenance of a constant temperature;</li><li>A temperature control dial allowing the user to select the operating temperatures (usually marked with types of cloth rather than temperatures: \"<a href=\"https://en.wikipedia.org/wiki/Silk\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">silk</a>\", \"<a href=\"https://en.wikipedia.org/wiki/Wool\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">wool</a>\", \"<a href=\"https://en.wikipedia.org/wiki/Cotton\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">cotton</a>\", \"<a href=\"https://en.wikipedia.org/wiki/Linen\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">linen</a>\", etc.);</li><li>An electrical cord with heat-resistant&nbsp;<a href=\"https://en.wikipedia.org/wiki/Silicone_rubber\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">silicone rubber</a>&nbsp;insulation;</li><li>Injection of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Steam\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(6, 69, 173);\">steam</a>&nbsp;through the fabric during the ironing process;</li><li class=\"ql-indent-1\">A water reservoir inside the iron used for steam generation;</li><li class=\"ql-indent-1\">An indicator showing the amount of water left in the reservoir,</li><li class=\"ql-indent-1\">Constant steam: constantly sends steam through the hot part of the iron into the clothes;</li><li class=\"ql-indent-1\">Steam burst: sends a burst of steam through the clothes when the user presses a button;</li><li class=\"ql-indent-1\">(advanced feature) Dial controlling the amount of steam to emit as a constant stream;</li><li class=\"ql-indent-1\">(advanced feature) Anti-drip system;</li></ul><p><br></p>', 2, '[]', 2, 1, 1, 1, 2, 100, 5000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 80.00, 1, 'clothes-iron-odc2', 'MTYZMTAXMJMXOTQ5ODY', 1, 1, 0, 0, NULL),
(85, 27, 130, 657, 3, 'NEVIA MEN', 'seller', 32, NULL, NULL, 2, '', '[\"shaving\",\"aftershave\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntc4odgxnjmxmdeymzi1.jpeg\",\"upload\\/product\\/photos\\/odaxmjyxnjmxmdeymzi1.jpeg\"]', 'upload/product/thumbnail/nzm0ndkxnjmxmdeymzi1.jpeg', '', '<ul><li>The soothing formula for all skin types provides instant relief to just shaved skin.</li><li>Special moisturisers, Vitamins and Aloe Vera ensure your skin looks healthy and well cared-for.</li><li>Skin compatibility dermatologically approved.</li></ul><p>&nbsp;</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 200.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'nevia-men-nda5', 'MTYZMTAXMJMYNTQ1NTU', 0, 1, 0, 0, NULL),
(86, 29, 185, 697, 3, 'Bean Bags', 'seller', 28, NULL, 4, 2, '7', '[\"Bags\",\"BeanBags\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odqymzcxnjmxmdeymzm2.jpeg\",\"upload\\/product\\/photos\\/mjmyntkxnjmxmdeymzm2.jpeg\",\"upload\\/product\\/photos\\/mte5mdaxnjmxmdeymzm2.jpeg\"]', 'upload/product/thumbnail/mte5nzaxnjmxmdeymzm2.jpeg', '', '<ul><li>About this item.</li><li>MATERIAL: This faux fur will provide supper soft handfeel.NO sweat problem. all session comforts. machine washable also..</li><li>LUXURIOUS LIVING: best bean bag for living room for home for outdoor for balcony for girls room and adults. Its all about luxury and living space and standard of living..</li><li>QUALITY OF MAKING: It is stitched twice. The new technique is also done on the inside with piping stitching. So that its stitching does not come out..</li><li>DESIGNS SHAPE: bean bag is round and teardrop shape. Multiple shape seating. Which is looking very attractive and luxuries. (Dimensions : 25x25x45) in inches.</li><li>PLACE AND LOOK: If you keep this bean bag somewhere in your home or office, …</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 80, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 120.00, 1, 'bean-bags-ntaz', 'MTYZMTAXMJMZNJUYMJA', 1, 1, 0, 0, NULL),
(87, 21, 89, 307, 3, 'Superior Ultra-Slick Shaving Cream', 'seller', 29, NULL, NULL, 2, '', '[]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndexmzuxnjmxmdeymzqx.jpeg\",\"upload\\/product\\/photos\\/mta0odmxnjmxmdeymzqx.jpeg\",\"upload\\/product\\/photos\\/ndyymzcxnjmxmdeymzqx.jpeg\"]', 'upload/product/thumbnail/nzcynzyxnjmxmdeymzqx.jpeg', '', '<p>Cremo Shave Cream Our shave creams are made of super-slick molecules that provide a slippery interface between sharp blade and sensitive skin; you\'ll enjoy an effortlessly close shave with virtually no irritation. Each Cremo Shave Cream is formulated to make your grooming ritual quick, reliable and even enjoyable. Inspired by the latest insights of cosmetic science and a deep respect for tradition, Cremo promises no gimmicks and no fluff. That\'s the difference between shave cream and shave cream with soul.</p><p><br></p><p>Ingredients: Water (Aqua), Sodium Cocoyl Isethionate, Stearic Acid, Glycol Distearate, Cetearyl Alcohol, Macadamia Ternifolia Seed Oil, Polyether-1, Hydroxypropyl Guar Hydroxypropyltrimonium Chloride, Allantoin, Aloe Barbadensis Leaf Juice, Calendula Officinalis Flower extract, Xylitol, Citrus Medica Limonum (Lemon) Fruit and Carica Papaya Fruit Extract, Olea Europaea (Olive) Leaf Extract, Linalool, Limonene, BHT, Perfluoromethylcyclopentane, Phenoxyethanol, Ethylhexylglycerin, Titanium Dioxide, Citric Acid, Fragrance (Parfum).</p><p><br></p><p>Manufacturer‎Cremo Company, LLC (Beauty)Part Number‎4700Item Weight‎12 ouncesProduct Dimensions‎3 x 4 x 7.5 inchesCountry of Origin‎USAItem model number‎10858098007824Size‎6 Fl Oz (Pack of 2)Color‎Cremo Barber Grade Original Shave Cream, Astonishingly Superior Ultra-Slick Shaving Cream Fights Nicks, Cuts and Razor Burn, 6 Oz (2-Pack)Style‎OriginalVolume‎12 Fluid OuncesItem Package Quantity‎1Batteries Included?‎No</p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 350.00, 1, 5.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'superior-ultra-slick-shaving-cream-nja5', 'MTYZMTAXMJM0MTCWMJE', 0, 1, 0, 0, NULL),
(88, 26, 191, 589, 3, 'Clean Indoor and Outdoor 3-Blade Smart Ceiling Fan 54in Matte White with Remote Control', 'seller', 30, 6, 4, 2, '', '[\"fan\",\"samsungfan\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzg2mjyxnjmxmdeynjiz.jpeg\",\"upload\\/product\\/photos\\/mjk0nzixnjmxmdeynjiz.jpeg\"]', 'upload/product/thumbnail/ota5otaxnjmxmdeynjiz.jpeg', '', '<ul><li>WAC Smart Fans can be controlled from the WAC Smart Fan app, enabling smart features and full control of your fan from an iOS or Android device. Download the app to pair with the smart home tech you know and love, including Google Assistant, Amazon Alexa, Samsung Smart Things, Ecobee, Control4, and Josh AI. Coming Soon: Savant, Lutron Homeworks, and Nest.</li><li>The WAC Smart Fan iOS or Android app can sync with your ceiling fan to control fan speed, use smart features like breeze mode, adaptive learning, create groups, and reduce energy costs.</li><li>Battery operated Bluetooth remote control with wall cradle is included (Part # RC20-WT). An optional Bluetooth hardwired wall control is sold separately (Part# WC20-WT). Wall and remote control use Bluetooth for improved range and can control an unlimited amount of fans within range.</li><li>WAC Smart Fans are made with incredibly efficient and completely silent DC motors and are up to 70% more efficient than traditional fans. Every fan is factory-balanced and sound tested to ensure each fan will never wobble, rattle or click. Order Accordingly: model # F-003L includes a replaceable LED luminaire powered by WAC Lighting with smooth and continuous brightness control. Model # F-001 does not include the LED luminaire.</li></ul><p><br></p>', 2, '[]', 2, 1, 1, 1, 2, 70, 5500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 150.00, 1, 'clean-indoor-and-outdoor-3-blade-smart-ceiling-fan-54in-matte-white-with-remote-control-mjmw', 'MTYZMTAXMJYYMZQ4MZK', 1, 1, 0, 0, NULL),
(89, 29, 186, 704, 3, 'Bedsheets', 'seller', 28, NULL, 4, 2, '', '[\"Bedsheets\",\"Bedsheet\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otg1njmxnjmxmdeynjmw.jpeg\",\"upload\\/product\\/photos\\/mzc3njaxnjmxmdeynjmw.jpeg\",\"upload\\/product\\/photos\\/nde1mjixnjmxmdeynjmw.jpeg\",\"upload\\/product\\/photos\\/otgzndgxnjmxmdeynjmw.jpeg\"]', 'upload/product/thumbnail/njy3nzcxnjmxmdeynjmw.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">The material used for a sheet has a huge impact on its overall performance. The majority of sheets are made out of cotton. Cotton is popular because it is durable, lightweight, breathable, and washable. Almost all sheets are made from cotton, but there are some other potential choices. Silk is known for its luxurious texture and cooling feel. Those who want an eco-friendly fibre may choose Tencel, a material made from wood pulp, or a rayon material made from bamboo. Polyester is an affordable alternative to cotton. This synthetic material is not quite as breathable, but it is very sturdy.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 2000, 1250.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'bedsheets-ndqy', 'MTYZMTAXMJYZMDGXOTY', 1, 1, 0, 0, NULL),
(90, 27, 130, 649, 3, 'Shaving cream', 'seller', 32, NULL, NULL, 2, '', '[\"Shavingcream\",\"beardcare\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mtqzmzgxnjmxmdeynjq4.jpeg\",\"upload\\/product\\/photos\\/mtmzmdgxnjmxmdeynjq4.jpeg\"]', 'upload/product/thumbnail/njg4njuxnjmxmdeynjq4.jpeg', '', '<ul><li>【6 IN 1 Complete Shaving Kit, EXCELLENT QUALITY 】 - This luxury shaving kit is your one stop station wet shave set. This mens shaving kit includes everything one will need for a cleaner, smoother shave that protects against irritation and razor burn, clinically tested for sensitive skin. Safety razor kit include: exquisite Pre-Shave Oil, Shaving Cream, After-Shave Balm, Beard Scissors, Safety Razor+15 blades. 6 Shaving Essentials will bring you the most outstanding daily shaving experience.</li><li>【 GREAT VALUE SET】- The professional shaving products are combined at the best price in this amazing beard shaving kit. Pre-Shave Oil provids a protective barrier and improves razor glide. Shaving Cream, formulated with glycerin and generates a rich, warm lather. Safety razor for men ensures a Smooth, Precise and Clean Shave.After-shave balm revitalizes and soothes dry skin after shaving.</li><li>【ALL NATURAL INGREDIENTS】- YOOBEAUL shaving cream and aftershave balm &amp; Pre-Shave Oil are designed for you enjoying shaving your beard, leaving you with smooth shaved skin. All natural ingredients, NO Addtives or Harsh Chemicals. Natural Sandalwood scent, emitted from the jungle is the smell that every man wants. It makes you hormonally flooded and has unprecedented masculinity. She will feel that you charm her so much, everytime after your use.</li><li>【BUY WITH CONFIDENCE】- We are confident that you will like your new shaving kit. If you are not completely satisfied with your purchase for any reason, please contact us and we will serve you immediately.</li><li>【THE PERFECT GIFT】- Make any man extremely happy with YOOBEAUL luxury wet shave kit gift set for men. Great gift and stocking stuffers for Dads, husbands, sons Teens and Boys or mens gift on Valentine\'s day, Birthday, father\'s day and the anniversaries. Love them and give them the best.</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 300.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'shaving-cream-nje2', 'MTYZMTAXMJY0ODM1MDK', 0, 1, 0, 0, NULL);
INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `cat_position`, `name`, `added_by`, `user_id`, `brand_id`, `unit_id`, `Refundable`, `weight`, `tags`, `dimension`, `product_type`, `attribute`, `attribute_option`, `photos`, `thumbnail_img`, `video_link`, `description`, `color_image`, `color`, `qty_manage`, `min_qty`, `max_qty`, `price_type`, `stock_manage`, `quantity`, `price`, `discount`, `discount_value`, `discount_type`, `discount_method`, `warranty_type`, `warranty_period`, `shipping`, `shipping_cost`, `status`, `slug`, `sku`, `featured`, `published`, `total_sell`, `total_view`, `wishlist`) VALUES
(91, 21, 90, 301, 3, 'Natural Anti-Aging Face Wash with Antioxidants', 'seller', 29, NULL, 4, 2, '', '[\"mancream\",\"cream\",\"face\",\"clenser\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odm1mtaxnjmxmdeynzi3.jpeg\",\"upload\\/product\\/photos\\/mtc3nzgxnjmxmdeynzi3.jpeg\",\"upload\\/product\\/photos\\/mjy3ntixnjmxmdeynzi3.jpeg\"]', 'upload/product/thumbnail/ntqymjuxnjmxmdeynzi3.jpeg', '', '<p><strong>Ingredients</strong>Aloe Barbadensis (Organic Aloe) Leaf Juice, Cucumis Sativus (Cucumber) Fruit Water, Glycerin, Hamamelis Virginiana (Witch Hazel) Water, Citrullus lanatus (Watermelon) Fruit Extract, Salix Alba (Organic White Willow) Bark Extract, Phenoxyethanol, Melaleuca Alternifolia (Tea Tree) Leaf Oil.</p><p>Aloe Barbadensis (Organic Aloe) Leaf Juice, Cucumis Sativus (Cucumber) Fruit Water, Glycerin, Hamamelis Virginiana (Witch Hazel) Water, Citrullus lanatus (Watermelon) Fruit Extract, Salix…&nbsp;<span style=\"color: rgb(0, 113, 133);\">See more</span><strong>Brand</strong>Blue Sage<strong>Skin Type</strong>All<strong>Product Benefits</strong>Brightening,Brightens<strong>Item Form</strong>Spray</p><hr><h1>About this item</h1><ul><li>BRIGHTEN YOUR SKIN: This daily facial toner mist brightens your complexion and promotes cell regeneration, thanks to Watermelon Extract, that is rich in Vitamin C, antioxidants and amino acids.</li><li>CLARIFY + SMOOTH: This Skin toner Formulated with Cucumber Fresh Water, Witch Hazel, Tea Tree Oil and White Willow Bark Extract, this essence prepares skin to receive the full benefits of a carefully curated skin care routine, by maintaining moisture and promoting a smooth and even canvas.</li><li>SIMPLE + NATURAL INGREDIENTS: This refreshing facial toner has less than 10 ingredients, making it a gentle formula for all skin types. There are no fillers, phthalates, parabens, or synthetic fragrances.</li><li>DIRECTIONS: After cleansing, Face mist spray generously over face and neck. Can also be applied with traditional cotton pads if preferred. Complete with the remainder of your skin care regime including serums and moisturizers. Mist on as desired throughout the day to refresh and hydrate.</li><li>WHO IS BLUE SAGE: We’re here to bring cool and natural skin care products to Amazon, focused on formulating beauty products for modern day life to help protect your skin against pollution and environmental stressors. Our products are made in the USA &amp; are free of parabens and dyes, and are never cruel to animals.</li></ul><p><br></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'natural-anti-aging-face-wash-with-antioxidants-nji0', 'MTYZMTAXMJCYNZU3MDQ', 0, 1, 0, 0, NULL),
(92, 28, 160, NULL, 2, 'kidsd watches', 'seller', 31, NULL, NULL, 2, '', '[\"watches\",\"gori\",\"hand\",\"smartwatches\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/mza3ntgxnjmxmdeyodcy.jpeg\",\"upload\\/product\\/photos\\/ntgxndgxnjmxmdeyodcy.jpeg\",\"upload\\/product\\/photos\\/ntgwntuxnjmxmdeyodcy.jpeg\"]', 'upload/product/thumbnail/mzy2mdaxnjmxmdeyodcy.jpeg', '', '<p>KidiZoom® Smartwatch DX2 is the perfect tech for kids. It’s kid-friendly, reliable and lets kids take quality pictures and videos, play games and tell time right out of the box. Featuring a stylish design, the secure and durable watch is sized for kids’ wrists. Two cameras allow kids to capture photos, selfies and action videos that can be customized with funny filters in the Silly Me app and made into watch faces. Choose from 55 digital and analog watch faces that help kids learn to tell time. Includes high-tech games like Monster Detector, which uses the camera and AR to help kids find and capture monsters in the real world. Use the motion sensor for active play challenges or to track steps. Parents can safely share photos and videos at their discretion only by uploading them to a computer using the included micro-USB cable. Free games, watch faces and camera effects are available from Learning Lodge®. This multifunction smartwatch is like Mom and Dad’s, designed just for kids and is available in multiple colors (sold separately). Intended for ages 4+ years. Battery included. Only charge this device using the included Micro-USB cable connected to a computer. Do not charge using a third-party adapter.</p><p><br></p><hr><h2>Product information</h2><p>Color:<strong>Pink</strong>&nbsp;&nbsp;|&nbsp;Product Packaging:<strong>Standard Packaging</strong></p><p>Product Dimensions8.9 x 0.7 x 1.8 inchesItem Weight7.7 ouncesCountry of OriginChinaASINB071JQ6LCCItem model number80-193850Manufacturer recommended age4 - 12 yearsBatteries1 Lithium Polymer batteries required. (included)Best Sellers Rank#447 in Toys &amp; Games (<a href=\"https://www.amazon.com/gp/bestsellers/toys-and-games/ref=pd_zg_ts_toys-and-games\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Toys &amp; Games</a>)</p><p>#11 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/toys-and-games/166177011/ref=pd_zg_hrsr_toys-and-games\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Electronic Learning &amp; Education Toys</a></p><p>#13 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/toys-and-games/251929011/ref=pd_zg_hrsr_toys-and-games\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Preschool Learning Toys</a></p><p>Customer Reviews<em style=\"color: rgb(0, 113, 133);\">4.6 out of 5 stars</em></p><p><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/VTech-Kidizoom-Smartwatch-DX2-Pink/dp/B071JQ6LCC/ref=sr_1_6?dchild=1&amp;keywords=kids+watches&amp;qid=1631012775&amp;sr=8-6#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">14,322 ratings</a></p><p>4.6 out of 5 starsIs Discontinued By ManufacturerNoRelease dateApril 30, 2018Mfg Recommended age4 - 12 yearsManufacturerVtec</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 2, 2, 1, 0.00, 1, 20.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'kidsd-watches-mtk2', 'MTYZMTAXMJG3MJEWNJU', 0, 1, 0, 0, NULL),
(93, 26, 199, 637, 3, 'HUL Pureit Classic 23 L Water Purifier', 'seller', 30, NULL, 4, 2, '', '[\"waterpurifiers\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzuwnzexnjmxmdeyoti5.jpeg\",\"upload\\/product\\/photos\\/otc4ndkxnjmxmdeyoti5.jpeg\",\"upload\\/product\\/photos\\/otm2mtcxnjmxmdeyoti5.jpeg\"]', 'upload/product/thumbnail/ntuznzixnjmxmdeyoti5.jpeg', '', '<ul><li>Color: White and Blue</li><li>Type: Non-electric with storage</li><li>Warranty details: 6 months</li><li>Technology: Gravity based water purification</li><li>Capacity:23 litres</li><li>Includes: Water purifier, User manual, Warranty card and Service center details</li><li>Type of Tank: food grade plastic</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 60, 0.00, 1, 13.00, 'Percent', 1, 0, '', 1, 130.00, 1, 'hul-pureit-classic-23-l-water-purifier-otk5', 'MTYZMTAXMJKYOTC3MTE', 0, 1, 0, 0, NULL),
(94, 27, 127, 692, 3, 'havainas', 'seller', 32, NULL, NULL, 2, '', '[\"chendal\",\"flip-flop\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntgxnzgxnjmxmdezmdax.jpeg\",\"upload\\/product\\/photos\\/nzk4njqxnjmxmdezmdax.jpeg\"]', 'upload/product/thumbnail/otgymdyxnjmxmdezmdax.jpeg', '', '<p>Flip flop&nbsp;yle:&nbsp;<strong>HAVAIANAS&nbsp;SLIM SUMMER&nbsp;</strong>- Color:&nbsp;<strong>LEMON YELLOW</strong></p><p>Yellow&nbsp;<strong>flip flops&nbsp;</strong>with multicolor&nbsp;<strong>summer print.&nbsp;</strong>In rubber with&nbsp;ties with fuchsia&nbsp;logo.</p><p><br></p><p>Brand code:&nbsp;<strong>4122111</strong></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 120.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'havainas-mjqx', 'MTYZMTAXMZAWMTKYMTC', 0, 1, 0, 0, NULL),
(95, 29, 183, 681, 3, 'TV Units', 'seller', 28, NULL, 4, 2, '80', '[\"TVUnits\",\"TV\",\"units\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntc1mdkxnjmxmdezmda3.jpeg\",\"upload\\/product\\/photos\\/njy5njgxnjmxmdezmda3.jpeg\",\"upload\\/product\\/photos\\/mza0mzmxnjmxmdezmda4.jpeg\"]', 'upload/product/thumbnail/ndm0nzcxnjmxmdezmda3.jpeg', '', '<p><span style=\"color: rgb(67, 69, 75);\">Our Dome Home Furniture Mevsim TV Stand is produced in high quality according to the needs of the TV Stands sector. You can contact us for detailed information about the&nbsp;</span><strong style=\"color: rgb(67, 69, 75);\">Dome Home Furniture Mevsim TV Stand</strong><span style=\"color: rgb(67, 69, 75);\">. Our DOME MOBILYA LTD. STI. is fully specialized in the field of TV Stands and is under our guarantee.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 45, 0.00, 2, 1.00, 'Percent', 1, 0, '', 1, 375.00, 1, 'tv-units-njk4', 'MTYZMTAXMZAWODU4MJA', 1, 1, 0, 0, NULL),
(96, 21, 87, 261, 3, 'OGX Pink sea salt & rosewater gentle soothing body scrub', 'seller', 29, NULL, 5, 2, '', '[\"bodywash\",\"shampoo\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odu1mzexnjmxmdezmte4.jpeg\",\"upload\\/product\\/photos\\/nzc5ntmxnjmxmdezmte4.jpeg\",\"upload\\/product\\/photos\\/ntqwmzcxnjmxmdezmte4.jpeg\",\"upload\\/product\\/photos\\/ntgymdmxnjmxmdezmte4.jpeg\"]', 'upload/product/thumbnail/mze3mzuxnjmxmdezmte4.jpeg', '', '<p><strong>Brand</strong>OGX<strong>Ingredients</strong>Rosewater<strong>Scent</strong>Clean Scent<strong>Product Benefits</strong>Nourishing,Exfoliating<strong>Item Weight</strong>1.31 Pounds</p><hr><h1>About this item</h1><ul><li>Liquid luxury This liquid body soap is a lightweight scrub that foams into a rich lather and rinses to reveal softer, more supple skin. Cleanse your body and awaken your senses with OGX Rosewater &amp; Pink sea salt wash &amp; Scrub.</li><li>Light exfoliation gently exfoliate and nourish your skin with calming rosewater and lightly buffing sea salt. This liquid body wash cleanses, softens, and hydrates skin while it exfoliates.Paraben free</li><li>With rosewater and pink sea salt The rosewater-infused cleansing formula soften and hydrates with blends of rosewater, rose Quartz, and pink sea salt.</li><li>For all skin types especially kind to sensitive skin, This sulfate-free surfactants body soap features calming rosewater, rose Quartz, and gently exfoliating pink sea salt.</li><li>Sulfate free surfactants this rose water Body wash is proudly Made with all of the good stuff and no sulfated surfactants</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'ogx-pink-sea-salt--rosewater-gentle-soothing-body-scrub-ndyx', 'MTYZMTAXMZEXODKYOTG', 0, 1, 0, 0, NULL),
(97, 28, 154, NULL, 2, 'VTech KidiZoom Smartwatch DX2, Pink', 'seller', 31, NULL, NULL, 2, '', '[\"watches\",\"gori\",\"handwatches\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/nzg2otcxnjmxmdezmtg5.jpeg\",\"upload\\/product\\/photos\\/odq4oduxnjmxmdezmtg5.jpeg\",\"upload\\/product\\/photos\\/ntc2nzgxnjmxmdezmtg5.jpeg\"]', 'upload/product/thumbnail/mzc3mjmxnjmxmdezmtg5.jpeg', '', '<p>KidiZoom® Smartwatch DX2 is the perfect tech for kids. It’s kid-friendly, reliable and lets kids take quality pictures and videos, play games and tell time right out of the box. Featuring a stylish design, the secure and durable watch is sized for kids’ wrists. Two cameras allow kids to capture photos, selfies and action videos that can be customized with funny filters in the Silly Me app and made into watch faces. Choose from 55 digital and analog watch faces that help kids learn to tell time. Includes high-tech games like Monster Detector, which uses the camera and AR to help kids find and capture monsters in the real world. Use the motion sensor for active play challenges or to track steps. Parents can safely share photos and videos at their discretion only by uploading them to a computer using the included micro-USB cable. Free games, watch faces and camera effects are available from Learning Lodge®. This multifunction smartwatch is like Mom and Dad’s, designed just for kids and is available in multiple colors (sold separately). Intended for ages 4+ years. Battery included. Only charge this device using the included Micro-USB cable connected to a computer. Do not charge using a third-party adapter.</p><p><br></p><hr><h2>Product information</h2><p>Color:<strong>Pink</strong>&nbsp;&nbsp;|&nbsp;Product Packaging:<strong>Standard Packaging</strong></p><p>Product Dimensions8.9 x 0.7 x 1.8 inchesItem Weight7.7 ouncesCountry of OriginChinaASINB071JQ6LCCItem model number80-193850Manufacturer recommended age4 - 12 yearsBatteries1 Lithium Polymer batteries required. (included)Best Sellers Rank#447 in Toys &amp; Games (<a href=\"https://www.amazon.com/gp/bestsellers/toys-and-games/ref=pd_zg_ts_toys-and-games\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Toys &amp; Games</a>)</p><p>#11 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/toys-and-games/166177011/ref=pd_zg_hrsr_toys-and-games\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Electronic Learning &amp; Education Toys</a></p><p>#13 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/toys-and-games/251929011/ref=pd_zg_hrsr_toys-and-games\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Preschool Learning Toys</a></p><p>Customer Reviews<em style=\"color: rgb(0, 113, 133);\">4.6 out of 5 stars</em></p><p><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/VTech-Kidizoom-Smartwatch-DX2-Pink/dp/B071JQ6LCC/ref=sr_1_6?dchild=1&amp;keywords=kids+watches&amp;qid=1631012775&amp;sr=8-6#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">14,322 ratings</a></p><p>4.6 out of 5 starsIs Discontinued By ManufacturerNoRelease dateApril 30, 2018Mfg Recommended age4 - 12 yearsManufacturerVtech</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 2000.00, 1, 10.00, 'Percent', 1, 0, '', 1, 60.00, 1, 'vtech-kidizoom-smartwatch-dx2-pink-mzay', 'MTYZMTAXMZE4OTQXMDK', 1, 1, 0, 0, NULL),
(98, 27, 144, 516, 3, 'Bamboo cool', 'seller', 32, NULL, NULL, 2, '', '[\"Bamboocoll\",\"Breifs\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mju3mdaxnjmxmdeznda0.jpeg\",\"upload\\/product\\/photos\\/otk5mzexnjmxmdeznda0.jpeg\"]', 'upload/product/thumbnail/mtewotixnjmxmdeznda0.jpeg', '', '<ul><li>92% Bamboo Viscose + 8% Spandex</li><li>Machine Wash</li><li>PREMIUM MATERIAL: 92% Bamboo Viscose + 8% Spandex, light and soft texture, better skin-friendly than cotton material, bring a fresh touch to your skin.</li><li>COMFORTABLE FABRIC: Breath from nature, comfortable and breathable, moisture wicking , keep you refreshed all day, very suitable for home, exercise, travel and other daily activities.</li><li>ELASTIC STRETCHING: The waist is full of elasticity, not loose, and does not fall down. It fits gently on the waist skin and does not produce an uncomfortable gathering feeling.</li><li>INGENIOUS DESIGN: Seamless hips, seamless sides, and non-sensing labels printed on the outside, eliminating itchy sewing labels and avoiding the labels directly touching the skin to cause discomfort.</li><li>FEATURES: U convex bag design, more space, more freedom, fuller vision, more male charm.</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 150.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'bamboo-cool-mjy3', 'MTYZMTAXMZQWNDEZMJG', 0, 1, 0, 0, NULL),
(99, 21, 117, 318, 3, 'Tea Tree Special Shampoo, For All Hair Types', 'seller', 29, NULL, 4, 2, '', '[\"shampoo\",\"mansampoo\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzm4nzyxnjmxmdezndq0.jpeg\",\"upload\\/product\\/photos\\/ndm4njgxnjmxmdezndq0.jpeg\",\"upload\\/product\\/photos\\/nzc4nzixnjmxmdezndq0.jpeg\"]', 'upload/product/thumbnail/ndm3odexnjmxmdezndq0.jpeg', '', '<p><strong>Brand  </strong>Tea Tree</p><p><strong>Scent  </strong>Tea Tree, Peppermint and Lavender</p><p><strong>Hair Type  </strong>All</p><p><strong>Liquid Volume   </strong>33.8 Fluid Ounces</p><p><strong>Item Weight  </strong>2.4 Pounds</p><p><br></p><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 600.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'tea-tree-special-shampoo-for-all-hair-types-mjey', 'MTYZMTAXMZQ0NTU5OTQ', 0, 1, 0, 0, NULL),
(100, 28, 108, 343, 3, ' Boys\' Multi-Pack Knit Shorts', 'seller', 31, NULL, NULL, 2, '', '[\"shorts\",\"pan\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/ntgynzuxnjmxmde0mty3.jpeg\",\"upload\\/product\\/photos\\/otewndcxnjmxmde0mty3.jpeg\",\"upload\\/product\\/photos\\/njm1mzcxnjmxmde0mty3.jpeg\",\"upload\\/product\\/photos\\/mjy0nzuxnjmxmde0mty3.jpeg\"]', 'upload/product/thumbnail/ndi5njaxnjmxmde0mty3.jpeg', '', '<p>3- pack easy knit pull on shorts with elastic waistbands</p><hr><h2>Product details</h2><ul><li><strong>Department ‏ : ‎&nbsp;</strong>Baby-boys</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>April 26, 2021</li><li><strong>Manufacturer ‏ : ‎&nbsp;</strong>Carter\'s Simple Joys - Private Label</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B093GK6Y7</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 500.00, 1, 1.00, 'Percent', 1, 0, '', 1, 0.00, 1, '-boys-multi-pack-knit-shorts-mjyx', 'MTYZMTAXNDE2NZE0MZU', 1, 1, 0, 0, NULL),
(101, 27, 124, 710, 3, 'Cool Chronographs of Baselworld', 'seller', 32, NULL, NULL, 2, '', '[\"chronographwatche\",\"watch\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mti1mjgxnjmxmdc1ndiy.jpeg\",\"upload\\/product\\/photos\\/otyxnzexnjmxmdc1ndiy.jpeg\"]', 'upload/product/thumbnail/njm5njixnjmxmdc1ndiy.jpeg', '', '<p><span style=\"color: rgb(50, 50, 50);\">After our Top Ten countdown of&nbsp;</span><a href=\"https://monochrome-watches.com/10-best-dive-watches-introduced-baselworld-2018/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(113, 129, 147);\">the best Dive watches</a><span style=\"color: rgb(50, 50, 50);\">,&nbsp;</span><a href=\"https://monochrome-watches.com/buying-guide-best-gmt-travellers-watches-baselworld-2018/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(113, 129, 147);\">the best GMT watches</a><span style=\"color: rgb(50, 50, 50);\">&nbsp;and the&nbsp;</span><a href=\"https://monochrome-watches.com/buying-guide-10-best-tourbillon-watches-from-baselworld-2018/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(113, 129, 147);\">best Tourbillon watches</a><span style=\"color: rgb(50, 50, 50);\">&nbsp;of Baselworld 2018, it’s time to focus on one of the most important and popular categories:</span><a href=\"https://monochrome-watches.com/tag/chronographs/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(113, 129, 147);\">&nbsp;chronographs</a><span style=\"color: rgb(50, 50, 50);\">. This edition of the Basel Watch Fair proved, yet again, that the chronograph can be morphed into any style: elegant, sporty, modern, vintage, affordable, exclusive. So here is our eclectic selection of the Ten coolest chronographs introduced at Baselworld 2018.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 1500.00, 2, 1.00, 'Percent', 1, 1, '', 1, 50.00, 1, 'cool-chronographs-of-baselworld-njqw', 'MTYZMTA3NTQYMJG0NZC', 0, 0, 0, 0, NULL),
(102, 27, 127, 703, 3, 'Best sneakers', 'seller', 32, NULL, NULL, 2, '', '[\"shoes\",\"sneakers\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otmzodyxnjmxmdc2ndq1.jpeg\",\"upload\\/product\\/photos\\/mzy3njexnjmxmdc2ndq1.jpeg\"]', 'upload/product/thumbnail/mzewmjkxnjmxmdc2ndq1.jpeg', '', '<p><span style=\"color: rgb(0, 0, 0);\">Ladies got the footwear memo from the get-go: Their shoes make the outfit! Now, us guys don\'t always want to wear the flashiest shoes with our workwear or formal attire (I mean, James Bond had the statement car, not statement shoes), but sneakers are the perfect opportunity to play up your style. You can go bold, futuristic, or even colorful when sporting your kicks to the gym or around town. The sneaker-game opportunities are endless, but here are the top 11 coolest men\'s sneakers that\'ll take any look to the next level.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 120, 1200.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'best-sneakers-odu3', 'MTYZMTA3NJQ0NTY4MTI', 0, 0, 0, 0, NULL),
(103, 27, 127, 699, 3, 'Running Shoes', 'seller', 32, 2, NULL, 2, '', '[\"shoes\",\"runningshoes\",\"nikeshoes\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/njk0nzgxnjmxmdc2oduz.jpeg\",\"upload\\/product\\/photos\\/nta5ndaxnjmxmdc2oduz.jpeg\",\"upload\\/product\\/photos\\/oduwodgxnjmxmdc2oduz.jpeg\"]', 'upload/product/thumbnail/mte5nzuxnjmxmdc2oduz.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">Nike sports shoes</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 120, 1500.00, 1, 25.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'running-shoes-mtu0', 'MTYZMTA3NJG1MZEXODY', 0, 0, 0, 0, NULL),
(104, 19, 81, 353, 3, 'Casual Women Top', 'seller', 29, NULL, 4, 2, '', '[\"tops\",\"fotua\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzmxmdaxnjmxmdc2otax.jpeg\",\"upload\\/product\\/photos\\/ntq2njixnjmxmdc2otax.jpeg\",\"upload\\/product\\/photos\\/njg1odkxnjmxmdc2otax.jpeg\",\"upload\\/product\\/photos\\/ntk5nzaxnjmxmdc2otax.jpeg\",\"upload\\/product\\/photos\\/mze2ntqxnjmxmdc2otax.jpeg\",\"upload\\/product\\/photos\\/nzi1mdixnjmxmdc2otax.jpeg\",\"upload\\/product\\/photos\\/njg3mzcxnjmxmdc2otax.jpeg\"]', 'upload/product/thumbnail/odmxmtyxnjmxmdc2otax.jpeg', '', '<p>Product Details</p><p class=\"ql-align-center\"><span style=\"color: inherit;\"><img src=\"data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNCIgaGVpZ2h0PSIyIj48cGF0aCBmaWxsPSIjODc4Nzg3IiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0wIDJWMGgxNHYyeiIvPjwvc3ZnPg==\"></span></p><p>Neck</p><p>Mandarin Collar</p><p>Sleeve Style</p><p>Regular Sleeves</p><p>Sleeve Length</p><p>3/4 Sleeve</p><p>Fit</p><p>Regular</p><p>Fabric</p><p>Poly Georgette</p><p>Type</p><p>Ruffled Top</p><p>Pattern</p><p>Solid</p><p>Color</p><p>Pink</p><p>Pack of</p><p>1</p><p>Fabric Care</p><p>Hand Wash, Cold water wash only</p><p>Length</p><p>Hip Length</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 700.00, 1, 15.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'casual-women-top-mzmz', 'MTYZMTA3NJKWMTMWMJM', 0, 0, 0, 0, NULL),
(105, 19, 81, 370, 3, 'Women Jeggings', 'seller', 29, NULL, 4, 2, '', '[\"jaggins\",\"pent\",\"adypant\",\"ladispant\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odexmjqxnjmxmdc3nji0.jpeg\",\"upload\\/product\\/photos\\/oty4nzaxnjmxmdc3nji0.jpeg\",\"upload\\/product\\/photos\\/ntmznzexnjmxmdc3nji0.jpeg\",\"upload\\/product\\/photos\\/ndq1njaxnjmxmdc3nji0.jpeg\",\"upload\\/product\\/photos\\/nje2nzuxnjmxmdc3nji0.jpeg\",\"upload\\/product\\/photos\\/nty0njaxnjmxmdc3nji0.jpeg\"]', 'upload/product/thumbnail/ntqwndcxnjmxmdc3nji0.jpeg', '', '<p>Brand <span style=\"color: rgb(33, 33, 33);\">TWIST</span></p><p>Fabric/Material<span style=\"color: rgb(33, 33, 33);\">NR   ROMA</span>Fit<span style=\"color: rgb(33, 33, 33);\">SKINNY</span></p><p>Type   <span style=\"color: rgb(33, 33, 33);\">JEGGINGS</span></p><p>Trend  <span style=\"color: rgb(33, 33, 33);\">METAL</span></p><p>Length of Garment<span style=\"color: rgb(33, 33, 33);\">ANKLE LENGTH</span>No of Pieces<span style=\"color: rgb(33, 33, 33);\">1</span>Style</p><p> Code   <span style=\"color: rgb(33, 33, 33);\">439570</span></p><p>Washed Effect   <span style=\"color: rgb(33, 33, 33);\">NORMAL WASH</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 850.00, 1, 20.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'women-jeggings-ntkz', 'MTYZMTA3NZYYNDI2MDG', 0, 0, 0, 0, NULL),
(106, 19, 81, 384, 3, 'leather jacket  Women\'s Apparel online ', 'seller', 29, NULL, 4, 2, '', '[\"jeckets\",\"suiter\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndk1mtgxnjmxmdc4nju2.jpeg\",\"upload\\/product\\/photos\\/nzyzotaxnjmxmdc4nju2.jpeg\",\"upload\\/product\\/photos\\/mtg1ntyxnjmxmdc4nju2.jpeg\",\"upload\\/product\\/photos\\/ndiwmtcxnjmxmdc4nju2.jpeg\",\"upload\\/product\\/photos\\/mze3njixnjmxmdc4nju2.jpeg\"]', 'upload/product/thumbnail/njgxnjixnjmxmdc4nju2.jpeg', '', '<p>Country of Origin</p><p>Others</p><p>Material</p><p>Leather</p><p>Jacket Type</p><p>Others</p><p>Occasion</p><p>Casual</p><p>Outerwear Length</p><p>Medium</p><p>Petite</p><p>No</p><p>Pattern</p><p>Others</p><p>Plus Size</p><p>No</p><p>Stock</p><p>1227</p><p>Ships From</p><p>Benguet, North Luzon</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 2550.00, 1, 20.00, 'Percent', 1, 3, '1 week ', 1, 65.00, 1, 'leather-jacket--womens-apparel-online--mjq4', 'MTYZMTA3ODY1NJC5MZK', 0, 0, 0, 0, NULL),
(107, 19, 81, 374, 3, 'Women\'s Capris', 'seller', 29, NULL, 4, 2, '', '[\"capris\",\"tauser\",\"pant\",\"ladypant\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nje5ndgxnjmxmdgxoday.jpeg\",\"upload\\/product\\/photos\\/mzg3mdixnjmxmdgxoday.jpeg\",\"upload\\/product\\/photos\\/njg0njixnjmxmdgxodaz.jpeg\",\"upload\\/product\\/photos\\/mte3otexnjmxmdgxodaz.jpeg\",\"upload\\/product\\/photos\\/odc4ndkxnjmxmdgxodaz.jpeg\",\"upload\\/product\\/photos\\/mtkzodixnjmxmdgxodaz.jpeg\"]', 'upload/product/thumbnail/odkzmjmxnjmxmdgxoday.jpeg', '', '<ul><li>90% Polyester, 10% Spandex</li><li>Drawstring closure</li><li>Machine Wash</li><li>[Lightweight &amp; Stretch-woven fabric] - Made of Polyester and Spandex, our womens cargo pants are lightweight and stretchy, which will not bring burden or limit your movement. In addition, our hiking pants are also excellent in abrasion resistance, not easy to be scratched, especially suitable for outdoor activities.</li><li>[Water resistant &amp; Sun Protection] - Our climbing pants feature water-resistant capacity that helps resist light moisture. What’s more, the UPF 50+ cargo pants can block UV rays and provide protection for your skin under burning sun, enable you to cope with changing outdoor weather.</li><li>[Multifunctional Pockets &amp; Cord Lock] - The womens capri pants with four zip-closure security pockets provide great convenience. Adjustable cord lock around the cuffs to keep bugs out , and adjust the length of the pants,make the pants hem freely so that more convenient for sports.</li><li>[Quick-drying &amp; Adjustable Waistband] - Breathable and quick-dry fabric, this hiking pants keep you cool and fresh all-day.Elastic waist with drawstring provids the excellent fit.</li><li>[Multi-application] - Our camping pants are suitable for outdoor sports occasions, including hiking, running, climbing, camping, travelling, etc. suitable for spring, autumn and summer wearing.</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 1000.00, 1, 20.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'womens-capris-njq1', 'MTYZMTA4MTGWMZQ5MZU', 0, 0, 0, 0, NULL),
(108, 19, 81, 381, 3, 'Womens Summer Jumpsuits Casual Short Pant Romper with Pockets', 'seller', 29, NULL, 4, 2, '', '[\"jumpsuits\",\"skirt\",\"tops\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzgxnzkxnjmxmdgymzex.jpeg\",\"upload\\/product\\/photos\\/oduzmzuxnjmxmdgymzex.jpeg\",\"upload\\/product\\/photos\\/odaxotkxnjmxmdgymzex.jpeg\",\"upload\\/product\\/photos\\/mtexmdixnjmxmdgymzex.jpeg\"]', 'upload/product/thumbnail/mtg4njexnjmxmdgymzex.jpeg', '', '<p>* Item Style:Sweet/Cute/Casual/Stylish</p><p>* Item Sleeve: Sleeveless, Short Sleeve,Cami</p><p>* Item Season: Summer, Spring, Fall</p><p>* Item Length: Short pants</p><p>* Item Color : Solid Color, Floral Print, Stripes</p><p>* Item Drawstring: Not Adjustable Drawstring Waist</p><p>* Item Waist: Elastic Waist</p><p>* Item Pockets : Two Side Pockets</p><p>* Size：XS, S, M, L, XL, 2XL</p><p>* Gender: Women, Ladies, Girls,Teens, juniors</p><p>High quality fabrics, you will feel comfortable all day long,</p><p>Simple and fashion style makes you look youthful and elegant.</p><p>Two side pockets on the short pants, basic trendy jumpsuit always fits for all the occasions</p><p>Lightweight and soft, has plenty of stretch for the perfect fit, is an eye-catcher jumpsuit for this Summer</p><p>Cute one piece romper playsuit is very forgiving and stretchy, great shape for all body types</p><p>Summer fashion romper, short sleeve with two side pockets design, easy to wear it for a walk along the beach</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 40, 1000.00, 1, 10.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'womens-summer-jumpsuits-casual-short-pant-romper-with-pockets-mtcw', 'MTYZMTA4MJMXMTM3NDY', 0, 0, 0, 0, NULL),
(109, 19, 91, 417, 3, 'Mishansha Women\'s Running Walking Shoes Breathable Air Cushion Sneakers', 'seller', 29, NULL, 4, 2, '', '[\"shoe\",\"juta\",\"cades\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjcwotmxnjmxmdgyoda5.jpeg\",\"upload\\/product\\/photos\\/odg3mzgxnjmxmdgyoda5.jpeg\",\"upload\\/product\\/photos\\/njgyodqxnjmxmdgyoda5.jpeg\"]', 'upload/product/thumbnail/nzy2mzexnjmxmdgyoda5.jpeg', '', '<ul><li>Knitted fabric</li><li>Imported</li><li>Rubber sole</li><li>Breathable &amp; Comfortable Upper: The upper is made of breathable and lightweight knitted material, which has strong wrapping and won\'t be stuffy during long-time exercise, giving you a different comfortable experience.</li><li>Different Inner Lining: The soft sponge inner reduces the friction between feet and sneakers, and takes care of your skin. (Note: Every pair of these womens running shoes are equipped with a pair of arch support insoles, this is a gift), this arch support insole maintains the correct foot positioning, enhances comfort, and has excellent shock absorption and pain relief effects to provide moderate control and support.</li><li>Shock-Absorbing Air Cushion: The design of double air cushion increases the elasticity and plays the role of cushioning. Can protect the knees and feet to a greater extent.</li><li>Non-Slip &amp; Durable Sole: The rubber sole is wear-resistant and durable, and the sole is affixed with an Oxford patch to increase friction, and the anti-skid function is powerful.</li><li>Perfect For: running, walking, working, weight training, park, boating, cycling, jogging, garden, lawn, equestrian, basketball, rowing, athletics, tennis, volleyball, football, driving and yoga. Casual daily shoes which can bring more enjoy to your life.</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 2000.00, 1, 20.00, 'Percent', 1, 3, '1week', 1, 65.00, 1, 'mishansha-womens-running-walking-shoes-breathable-air-cushion-sneakers-mjg2', 'MTYZMTA4MJGWOTY0NZI', 0, 0, 0, 0, NULL),
(110, 19, 91, 406, 3, 'Ataiwee Women\'s Wide Width Flat Shoes,', 'seller', 29, NULL, 4, 2, '', '[\"ladyjuta\",\"slipers\",\"flats\",\"pumpy\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ota4mjexnjmxmdgzmtyz.jpeg\",\"upload\\/product\\/photos\\/otc0mjaxnjmxmdgzmtyz.jpeg\",\"upload\\/product\\/photos\\/ndqwotuxnjmxmdgzmtyz.jpeg\",\"upload\\/product\\/photos\\/mzqwmdqxnjmxmdgzmtyz.jpeg\"]', 'upload/product/thumbnail/mtu3ntixnjmxmdgzmtyz.jpeg', '', '<ul><li>Rubber sole</li><li>COMFORT AND DURABLE -The upper keeps this flats highly lightweight, air vent make your feet cool and dry while walking. Flexible construction gives you the freedom to move comfortably.</li><li>SOFT&nbsp;FOOTBED&nbsp;-&nbsp;Padded&nbsp;with&nbsp;thick&nbsp;smooth&nbsp;flexible&nbsp;EVA&nbsp;foam,&nbsp;good&nbsp;for&nbsp;your&nbsp;feet.&nbsp;Non-slip&nbsp;pattern&nbsp;out-sole&nbsp;enhances&nbsp;great&nbsp;stability.</li><li>VEGAN - We use high quality man-made environmental materials for all products.</li><li>CLASSIC FASHION -They are suitable for any occasion, go well with all outfits. Perfect for daily walking, working, casual, dress, shopping, travel, long time standing, driving, etc.</li><li>SERVICE GUARANTEE: If our flats could not conform with your expectation, just feel free to contact us by Amazon email, we will give you a satisfying reply. You can return this item for any reason.</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 850.00, 1, 15.00, 'Percent', 1, 3, '1 week', 1, 65.00, 1, 'ataiwee-womens-wide-width-flat-shoes-njiz', 'MTYZMTA4MZE2MZEZNZY', 0, 0, 0, 0, NULL),
(111, 19, 149, 456, 3, 'INICAT Small Crossbody Sling Bag Faux Leather Fanny Packs Purses for Women Teen Girls', 'seller', 29, NULL, 4, 2, '', '[\"bag\",\"ladybag\",\"handbag\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otuzotcxnjmxmdgzntix.jpeg\",\"upload\\/product\\/photos\\/mzqxotyxnjmxmdgzntix.jpeg\",\"upload\\/product\\/photos\\/mti2njkxnjmxmdgzntix.jpeg\"]', 'upload/product/thumbnail/nji3nzuxnjmxmdgzntix.jpeg', '', '<ul><li>【Animal Friendly Faux Leather】INICAT fanny purses for teen girls made with premium faux leather and odorless,small sling bag could fit any Brand cell phone,as long as the screen size under 7 in.</li><li>【Multi-functional】Fashion cell phone purse crossbody has two zip pocket,inside has CARD SLOTS design.Meaning you can storage credit cards, keys,cash and other small items in the front pocket. What\'s more,this sling bag for women allow you can put the cell phone in the big pocket to prevent from dropping and easy to answer your phone when outdoor activity</li><li>【Multi Cross Way】This crossbody sling bag could be as a small crossbody purse wear in your body,or as a sling bag or chest bag or small crossbody backpack shoulder bag.</li><li>【Life occasion】Women\'s fanny pack all at once keeping your hands free so you can enjoy more. Great for both indoor and outdoor use including business, hiking, travel, camping, school supplies, biking, sporting events,etc.Crossbody bag for teen girls just right for keeping your essential belongings close and safe</li><li>【Great Gift Option】Mini shoulder sling bag for women also a great idea as a special gifts/present for women teen girls for her birthday, New Year, Valentine’s Day, Easter, Mother’s Day,Halloween,Thanksgiving and Christmas gifts.All in all,INICAT fanny packs for women is a great gift choice</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 25, 1550.00, 1, 20.00, 'Percent', 1, 3, ' 1 week', 1, 65.00, 1, 'inicat-small-crossbody-sling-bag-faux-leather-fanny-packs-purses-for-women-teen-girls-oty5', 'MTYZMTA4MZUYMTE5NZQ', 0, 0, 0, 0, NULL),
(112, 26, 94, 264, 3, 'realme 8 Pro', 'seller', 30, NULL, 4, 2, '', '[\"realme8\",\"realme8pro\"]', '6.4in', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nze0ntcxnjmxmdgznjm5.jpeg\",\"upload\\/product\\/photos\\/mje3mtixnjmxmdgznjm5.jpeg\"]', 'upload/product/thumbnail/nzcxodmxnjmxmdgznjm5.jpeg', '', '<p><span style=\"color: rgb(85, 85, 85);\">The Realme 8 Pro in punk black color is a Dual SIM smartphone with 128GB storage and 8GB RAM, 6.4-inch AMOLED FHD+ screen, 108+8+2+2MP rear cameras and 16MP front camera, Qualcomm Snapdragon 720G processor and 4500mAh battery with 50W fast charge.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 100, 0.00, 1, 3.00, 'Percent', 1, 0, '', 1, 90.00, 1, 'realme-8-pro-ntgw', 'MTYZMTA4MZYZOTMZOTE', 0, 0, 0, 0, NULL),
(113, 19, 149, 463, 3, 'Sucipi Canvas Duffle Bag Weekender Bag for Women Travel', 'seller', 29, NULL, 4, 2, '.3', '[\"bag\",\"travelbag\",\"fita\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzm0mduxnjmxmdgzodkz.jpeg\",\"upload\\/product\\/photos\\/njcynjuxnjmxmdgzodkz.jpeg\",\"upload\\/product\\/photos\\/mtk0mdexnjmxmdgzodkz.jpeg\",\"upload\\/product\\/photos\\/nja2ndexnjmxmdgzodkz.jpeg\"]', 'upload/product/thumbnail/otayndcxnjmxmdgzodkz.jpeg', '', '<ul><li>【Multi-Pocket &amp; Large Capacity】Larger than normal travel bag, but great size for weekend or long trip. Unisex classic style perfect for men and women. Our large sized travel bags for women that can fit in 2-4 days of daily essentials such as clothes, shoes, tumblers and electronic devices. The main compartment also comes with an inner zipper pocket and 2 large outer pockets to hold your smart phone, IDs or passport.</li><li>【Cute Toiletry Bag + Shoe Compartment】The duffle bag for women also comes with a 15USD toiletries/make up bag that is convenient for the people who love travelling. The toiletries bag can be keep your essentials organize while you travel without messing up your travel stuffs. The shoe compartment is designed at the side of the carry on bags for airplanes to separate your shoes from other of your stuffs.</li><li>【Carry on Bag with Luggage Sleeve】21(length) x 12(height) x 9(width) inches; the carry on bags for airplanes can go with you straight onto your flight as it complies with the most stringent airline hand luggage restrictions (EasyJet, Ryanair etc.).Back side sleeve allows you to slide it over rolling suitcase/luggage/roller bag handle.</li><li>【Dry Wet Separated】The high density water resistant material can help you to separate dry items and wet items,if you have wet clothes or towel,you can put it in carry-on compliant bag.This travel bag comes with comfortable PU handles &amp; padded adjustable, removable shoulder strap. It has 3 carrying ways: hold on hand, carry on the shoulder or cross body.</li><li>【Multipurpose &amp; Perfect After service】A ideal duffle bags for travel. Could also be used as a womens weekend bag, carry on duffel bag, short journey bag, hospital bags for labor and delivery, business duffel, mommy bag, gym tote bag, carry-on luggage, just in case bag, etc.We guarantee 30 days return and money back, 1 year warranty and lifetime customer service for this travel bag organizer.. ORDER NOW WITH NO RISK!</li></ul><p><br></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 1550.00, 1, 15.00, 'Percent', 1, 3, '1 week', 1, 65.00, 1, 'sucipi-canvas-duffle-bag-weekender-bag-for-women-travel-otuy', 'MTYZMTA4MZG5MZCWODU', 0, 0, 0, 0, NULL),
(114, 26, 113, 313, 3, 'Samsung Mobile Charger', 'seller', 30, 6, 4, 2, '', '[\"samsung\",\"samsungcharger\",\"samsungmobilecharger\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzcxnjyxnjmxmdg0mdc1.jpeg\",\"upload\\/product\\/photos\\/ndgwntyxnjmxmdg0mdc1.jpeg\",\"upload\\/product\\/photos\\/ntc1mzqxnjmxmdg0mdc1.jpeg\",\"upload\\/product\\/photos\\/mty3mdkxnjmxmdg0mdc1.jpeg\"]', 'upload/product/thumbnail/ntq1ndgxnjmxmdg0mdc1.jpeg', '', '<ul><li>Samsung EU Plug Adaptive Fast Charger</li><li>Output: 5V / 2A 9V/1.67A</li><li>Fit For Samsung Galaxy A51/A71/A20 A20s A30 A30s A50 A50s A60 A70 A10 A10s</li></ul><p><br></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 45.00, 1, 'samsung-mobile-charger-mjaw', 'MTYZMTA4NDA3NTI0ODQ', 0, 0, 0, 0, NULL),
(115, 19, 150, 480, 3, 'Ross-Simons Diamond-Accented Love Knot Drop Earrings in Sterling Silver', 'seller', 29, NULL, 4, 2, '', '[\"earrings\",\"kanerdul\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzq2otgxnjmxmdg0ndiy.jpeg\",\"upload\\/product\\/photos\\/njm0njkxnjmxmdg0ndiy.jpeg\",\"upload\\/product\\/photos\\/mjc1mdcxnjmxmdg0ndiy.jpeg\",\"upload\\/product\\/photos\\/mjm5mtixnjmxmdg0ndiy.jpeg\"]', 'upload/product/thumbnail/nzmymjexnjmxmdg0ndiy.jpeg', '', '<ul><li>DIAMOND ACCENTS AND STERLING SILVER — Diamond accented love knot drop earrings in sterling silver. Round diamonds. Polished finish. 1 in. hanging length, 1/4 in. wide. Lever backings.</li><li>THE FINISHING TOUCH — With their symbolic design, these love knot diamond-accented drop earrings add a feminine accent to any style. Pair them with your casual or formal attire.</li><li>ROSS-SIMONS QUALITY — Treat yourself to the luxury of Ross-Simons fine jewelry. Whether your selection is made of 14kt gold, 18kt gold or gorgeous sterling silver, our jewelry always makes a lasting statement.</li><li>THE PERFECT GIFT FOR HER — These earrings are the ideal gift for your sister, daughter, mom, wife, niece, aunt, best friend, girlfriend — or yourself! Whether she prefers modern or traditional jewelry, Ross-Simons has a wide selection of bracelets, earrings, necklaces and rings to choose from.</li><li>GIFT BOX INCLUDED — Ross-Simons jewelry arrives beautifully packaged in a gift box, ready to delight for any occasion, including birthdays, Christmas, Mother’s Day, anniversaries, Valentine’s Day, weddings, graduations and much more! Due to the naturally occurring characteristics of diamonds, each is unique and may exhibit imperfections such as inclusions, blemishes and cloudiness, as well as color variations.</li></ul><p><br></p>', 2, '[]', 2, 1, 1, 1, 2, 15, 65000.00, 1, 20.00, 'Percent', 1, 4, '1.5 month', 1, 200.00, 1, 'ross-simons-diamond-accented-love-knot-drop-earrings-in-sterling-silver-nzuz', 'MTYZMTA4NDQYMJC5ODQ', 0, 0, 0, 0, NULL),
(116, 26, 119, 322, 3, 'The Best Smart Glasses and AR Specs of 2021', 'seller', 30, NULL, 4, 2, '', '[\"smartglasses\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjq3mtcxnjmxmdg0ndk1.jpeg\",\"upload\\/product\\/photos\\/otm5mjexnjmxmdg0ndk1.jpeg\"]', 'upload/product/thumbnail/otm2odexnjmxmdg0ndk1.jpeg', '', '<p>As humans, the ways we interact with new technology are constantly changing. There has been tremendous progress until today, and we adapted ourselves to various ways of communicAs humans, the ways we interact with new technology are constantly changing. There has been tremendous progress until today, and we adapted ourselves to various ways of communication, mostly assisting us in our daily tasks. Starting from push-button mobile telephones now we are in the period where augmented reality freed our hands off smartphones. Smart watches became quite popular as they enabled users an easier way of checking our notifications and other basic tasks we normally did on our smartphones, without digging into our bags and struggling to pick up the call on time. And yet another solution to this problation, mostly assisting us in our daily tasks. Starting from push-button mobile telephones now we are in the period where augmented reality freed our hands off smartphones. Smart watches became quite popular as they enabled users an easier way of checking our notifications and other basic tasks we normally did on our smartphones, without digging into our bags and struggling to pick up the call on time. And yet another solution to this problem is smart glasses.</p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 70, 6000.00, 1, 10.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'the-best-smart-glasses-and-ar-specs-of-2021-mzmz', 'MTYZMTA4NDQ5NTI3MJK', 0, 0, 0, 0, NULL),
(117, 28, 108, 346, 3, 'Boys Kids White Dress Shirt', 'seller', 31, NULL, NULL, 2, '', '[\"shirts\",\"jama\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/ndg0otmxnjmxmdg0odqw.jpeg\",\"upload\\/product\\/photos\\/mji2otyxnjmxmdg0odqw.jpeg\",\"upload\\/product\\/photos\\/mzcxntqxnjmxmdg0odqw.jpeg\"]', 'upload/product/thumbnail/njc5mzuxnjmxmdg0odm5.jpeg', '', '<h3>PRODUCT DETAILS</h3><p>Item specifics</p><p><span style=\"color: rgb(153, 153, 153);\">Brand Name:</span></p><p>Tommu Carino</p><p><span style=\"color: rgb(153, 153, 153);\">Style:</span></p><p>Fashion</p><p><span style=\"color: rgb(153, 153, 153);\">Material:</span></p><p>Polyester</p><p><span style=\"color: rgb(153, 153, 153);\">Material:</span></p><p>Spandex</p><p><span style=\"color: rgb(153, 153, 153);\">Material:</span></p><p>COTTON</p><p><span style=\"color: rgb(153, 153, 153);\">Fabric Type:</span></p><p>Sea lsland</p><p><span style=\"color: rgb(153, 153, 153);\">Item Type:</span></p><p>Shirts</p><p><span style=\"color: rgb(153, 153, 153);\">Gender:</span></p><p>Boys</p><p><span style=\"color: rgb(153, 153, 153);\">Sleeve Length(cm):</span></p><p>Full</p><p><span style=\"color: rgb(153, 153, 153);\">Pattern Type:</span></p><p>Patchwork</p><p><span style=\"color: rgb(153, 153, 153);\">Clothing Length:</span></p><p>Long</p><p><span style=\"color: rgb(153, 153, 153);\">Collar:</span></p><p>Square Collar</p><p><span style=\"color: rgb(153, 153, 153);\">Model Number:</span></p><p>TOMMYBOYSHiRTS</p><p><span style=\"color: rgb(153, 153, 153);\">Fit:</span></p><p>Fits true to size, take your normal size</p><p><br></p>', 1, '[]', 2, 1, 1, 1, 2, 1, 1600.00, 1, 5.00, 'Percent', 1, 3, '', 1, 65.00, 1, 'boys-kids-white-dress-shirt-odi5', 'MTYZMTA4NDG0MDGYNJC', 0, 0, 0, 0, NULL),
(118, 26, 123, 331, 3, 'Weighing Scale', 'seller', 30, NULL, 4, 2, '', '[\"Weighing\",\"weighingscals\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndi3mtyxnjmxmdg0odu1.jpeg\",\"upload\\/product\\/photos\\/ndi2njaxnjmxmdg0odu2.jpeg\",\"upload\\/product\\/photos\\/ote4odyxnjmxmdg0odu2.jpeg\",\"upload\\/product\\/photos\\/ndg1ntqxnjmxmdg0odu2.jpeg\"]', 'upload/product/thumbnail/mtgymjaxnjmxmdg0odu1.jpeg', '', '<p><span style=\"color: rgb(130, 130, 130);\">Weighing Scale (YY-768) Popular 30 KG</span></p><p><span style=\"color: rgb(130, 130, 130);\">Item code: 808166</span></p><p><span style=\"color: rgb(130, 130, 130);\">Brand: RFL Weighing Scale</span></p><p><span style=\"color: rgb(130, 130, 130);\">Table Top Scale</span></p><p><span style=\"color: rgb(130, 130, 130);\">Max Capacity: 30 kg</span></p><p><span style=\"color: rgb(130, 130, 130);\">ABS Body &amp; Stainless Steel Tray</span></p><p><span style=\"color: rgb(130, 130, 130);\">Dual Side Bright LED Display</span></p><p><span style=\"color: rgb(130, 130, 130);\">4V, 4A Lead Acid Battery</span></p><p><span style=\"color: rgb(130, 130, 130);\">Tray Size: 345x240 mm</span></p><p><span style=\"color: rgb(130, 130, 130);\">Charge Saving Scale</span></p><p><span style=\"color: rgb(130, 130, 130);\">Color: As given picture.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 60, 4500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 100.00, 1, 'weighing-scale-mzqw', 'MTYZMTA4NDG1NJGWNJC', 0, 0, 0, 0, NULL),
(119, 19, 150, 487, 3, 'Hadskiss Jewelry Set for Women, ', 'seller', 29, NULL, 4, 2, '', '[\"set\",\"neckless\",\"golar\",\"seet\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ode0nzcxnjmxmdg0ody2.jpeg\",\"upload\\/product\\/photos\\/mzm3ndyxnjmxmdg0ody2.jpeg\",\"upload\\/product\\/photos\\/ndg0mtuxnjmxmdg0ody2.jpeg\",\"upload\\/product\\/photos\\/mzmymzuxnjmxmdg0ody2.jpeg\"]', 'upload/product/thumbnail/nze5njuxnjmxmdg0ody2.jpeg', '', '<ul><li>★ High Quality Material ★ : This Women\'s Jewellery Set is made of 18K White Gold Plated &amp; Clear Cubic Zirconia. High Polished. Nickel-free, Hypoallergenic and Shiny Forever. Our Jewellery are suitable for almost all Of Sensitive Ears.</li><li>★ Jewellery Set Size ★ : Necklace Length : 44cm. Dangle Earrings Size : 1cm * 3.7cm. Bracelet Length : Adjustable in 17 - 19cm. Lightweight and Comfortable to Wear. Perfect Jewelry Set for Women Ladies.</li><li>★ Easy to Match ★ : The Necklace Earrings Bracelet Set is perfect for Any Occasion to Wear: Party, Ball, Wedding, Anniversary, Engagement, Graduation, Events or any other Special Occasions. Suitable for Matching Evening Dress, Wedding Dress.</li><li>★ Ideal Gift Choice ★ : Hadskiss Wedding Jewellery Set comes in Jewelry Gift Box. A good Birthday / Wedding / Graduation / Mother\'s Day / Thanksgiving Day / Christmas / New Year / Valentines Day Gift for Yourself, Mom. Aunt, Wife, Sister, Niece, Daughter Girlfriend,Women Friends.</li></ul><p><br></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 10, 2550.00, 1, 30.00, 'Percent', 1, 3, '1 week', 1, 65.00, 1, 'hadskiss-jewelry-set-for-women--nzy0', 'MTYZMTA4NDG2NJK0ODK', 0, 0, 0, 0, NULL);
INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `cat_position`, `name`, `added_by`, `user_id`, `brand_id`, `unit_id`, `Refundable`, `weight`, `tags`, `dimension`, `product_type`, `attribute`, `attribute_option`, `photos`, `thumbnail_img`, `video_link`, `description`, `color_image`, `color`, `qty_manage`, `min_qty`, `max_qty`, `price_type`, `stock_manage`, `quantity`, `price`, `discount`, `discount_value`, `discount_type`, `discount_method`, `warranty_type`, `warranty_period`, `shipping`, `shipping_cost`, `status`, `slug`, `sku`, `featured`, `published`, `total_sell`, `total_view`, `wishlist`) VALUES
(120, 26, 131, 357, 3, 'Laptop bag', 'seller', 30, NULL, 4, 2, '', '[\"laptopbags\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzezmjuxnjmxmdg1mtqy.jpeg\",\"upload\\/product\\/photos\\/mtq2mjkxnjmxmdg1mtqy.jpeg\"]', 'upload/product/thumbnail/ntk3ndgxnjmxmdg1mtqy.jpeg', '', '<p><span style=\"color: rgb(33, 37, 41);\">The Central collection Laptop bag was specially created for busy professionals and frequent travellers. It embodies sophistication and functionality, two defining features of our brand. Suitable for long distance travel and day to day activities, made from the finest quality materials, and with a range of features, you will always arrive fully prepared.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 70, 1300.00, 2, 1.00, 'Percent', 1, 0, '', 1, 70.00, 1, 'laptop-bag-nzez', 'MTYZMTA4NTE0MJQZMJM', 0, 0, 0, 1, NULL),
(121, 19, 151, 509, 3, 'CASE ELEGANCE Vegan Leather Travel Watch Case Roll Organizer Classic Black', 'seller', 29, NULL, 4, 2, '', '[\"watch\",\"case\",\"box\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndu1odgxnjmxmdg1mju5.jpeg\",\"upload\\/product\\/photos\\/mjiwmjuxnjmxmdg1mju5.jpeg\",\"upload\\/product\\/photos\\/mtkyodqxnjmxmdg1mju5.jpeg\",\"upload\\/product\\/photos\\/njywmjcxnjmxmdg1mju5.jpeg\"]', 'upload/product/thumbnail/ndcxnjexnjmxmdg1mju5.jpeg', '', '<p><strong>Color</strong>Black<strong>Material</strong>Faux Leather<strong>Brand</strong>CASE ELEGANCE<strong>Item Dimensions LxWxH</strong>7.92 x 1.75 x 3.75 inches<strong>Special Feature</strong>Vegan<strong>Inner Material</strong>Felt<strong>Shape</strong>Cylinder<strong>Closure Type</strong>Snap<strong>Item Weight</strong>0.5 Pounds<strong>Number of Compartments</strong>3</p><p><span style=\"color: rgb(0, 113, 133);\">See more</span></p><hr><h1>About this item</h1><ul><li>UPDATED - now includes two sets of watch pillows - one for larger watches and one for smaller watches</li><li>DON\'T BE FOOLED BY INFERIOR COMPETITORS - our case is created from a SOLID plastic mold (bottom part of roll) as opposed to solid cardboard like our competition. This thing can take a beating.</li><li>DIVIDERS keep watches and bracelets from sliding around. Buying a travel case without DIVIDERS is like putting your watches in a sock, just don\'t do it.</li><li>Fits men\'s and women\'s styles, including extra large watch faces</li><li>Each watch stays SECURE by being wrapped around an ultra-soft cushion that fits most sizes and styles of watches, large and small, men\'s and women\'s.</li></ul><p><br></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 550.00, 1, 10.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'case-elegance-vegan-leather-travel-watch-case-roll-organizer-classic-black-odc2', 'MTYZMTA4NTI1OTC5NJU', 0, 0, 0, 0, NULL),
(122, 26, 133, 369, 3, 'Printer Ink Cartridges', 'seller', 30, NULL, 4, 2, '', '[\"Printesink\",\"cartridges\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ode5nzqxnjmxmdg1ndi0.png\",\"upload\\/product\\/photos\\/otc4mjcxnjmxmdg1ndi0.jpeg\"]', 'upload/product/thumbnail/odi2nzgxnjmxmdg1ndi0.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">We are actively engaged in offering a qualitative range of&nbsp;</span><strong style=\"color: rgb(51, 51, 51);\">Printer Ink Cartridges</strong><span style=\"color: rgb(51, 51, 51);\">&nbsp;for catering the diversified requirements of our clients.</span></p>', 2, '[]', 2, 1, 1, 1, 2, 50, 5000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 100.00, 1, 'printer-ink-cartridges-ndy0', 'MTYZMTA4NTQYNDK0NJI', 0, 0, 0, 0, NULL),
(123, 28, 108, 348, 3, 'Fruit of the Loom Boys\' Tag Free Cotton Briefs', 'seller', 31, NULL, NULL, 2, '', '[\"Innerweare\",\"cotton\",\"briefs\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/nzcxntkxnjmxmdg1nte1.jpeg\",\"upload\\/product\\/photos\\/mte4mtyxnjmxmdg1nte1.jpeg\",\"upload\\/product\\/photos\\/nja0njmxnjmxmdg1nte1.jpeg\"]', 'upload/product/thumbnail/njayotuxnjmxmdg1nte1.jpeg', '', '<p>Fruit of the Loom Boys\' Briefs are the perfect pack to fill up his drawer. These briefs provide full coverage and are made tag free, providing him all day comfort. The soft cotton fabric wicks moisture, helping him stay cool and dry. The legs don\'t bind, preventing distracting adjustments throughout the day. These briefs were made with all day comfort in mind and will quickly become his favorite pair.</p><hr><h2>Product details</h2><ul><li><strong>Package Dimensions ‏ : ‎&nbsp;</strong>20 x 16 x 13 inches; 12.4 Pounds</li><li><strong>Item model number ‏ : ‎&nbsp;</strong>7P8BGAB</li><li><strong>Department ‏ : ‎&nbsp;</strong>Boys</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>June 16, 2021</li><li><strong>Manufacturer ‏ : ‎&nbsp;</strong>Fruit of the Loom</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B097C534N6</li><li><strong>Best Sellers Rank:&nbsp;</strong>#241 in Clothing, Shoes &amp; Jewelry (<a href=\"https://www.amazon.com/gp/bestsellers/fashion/ref=pd_zg_ts_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Clothing, Shoes &amp; Jewelry</a>)</li><li class=\"ql-indent-1\">#1 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/1046034/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Boys\' Briefs Underwear</a></li><li><strong>Customer Reviews:&nbsp;</strong><em style=\"color: rgb(0, 113, 133);\">4.7 out of 5 stars</em></li><li><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/Fruit-Loom-Cotton-Multipack-Assorted/dp/B0797NG1SW/ref=sr_1_1?dchild=1&amp;keywords=inner+wear+kids+boys&amp;qid=1631085143&amp;sr=8-1#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">12,626 ratings</a></li></ul><p><br></p>', 1, '[]', 2, 1, 1, 1, 2, 20, 700.00, 1, 5.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'fruit-of-the-loom-boys-tag-free-cotton-briefs-nzy1', 'MTYZMTA4NTUXNTQ2MTC', 0, 0, 0, 0, NULL),
(124, 26, 135, 379, 3, 'Tablets Capturing Less than 1.5% of TV Viewership', 'seller', 30, NULL, 4, 2, '', '[\"tablets\",\"tebletstv\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/njc5ndcxnjmxmdg1nzgz.jpeg\",\"upload\\/product\\/photos\\/mtq2mtaxnjmxmdg1nzgz.jpeg\"]', 'upload/product/thumbnail/nza2otyxnjmxmdg1nzgz.jpeg', '', '<p><span style=\"color: rgb(34, 34, 34);\">For those TV makers and program makers who are worried that tablets and phones are stealing viewers from the TV, we have good news: turns out the television set is still king. A recent study done by Thinkbox, marketing body for UK commercial TV revealed that the average viewer watches over 3 hours and 55 minutes of TV a day.</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 50000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 180.00, 1, 'tablets-capturing-less-than-15-of-tv-viewership-mzy1', 'MTYZMTA4NTC4MZE4OTU', 0, 0, 0, 0, NULL),
(125, 19, 151, 512, 3, 'BINLUN Replacement Watch Band Stainless Steel Ceramic Watch Bracelet Polished Strap', 'seller', 29, NULL, 4, 2, '.1', '[\"watchstrap\",\"ghorirfita\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/oduyodcxnjmxmdg1odm2.jpeg\",\"upload\\/product\\/photos\\/mtg5njixnjmxmdg1odm2.jpeg\",\"upload\\/product\\/photos\\/mtexntqxnjmxmdg1odm2.jpeg\",\"upload\\/product\\/photos\\/mju4odqxnjmxmdg1odm2.jpeg\"]', 'upload/product/thumbnail/mzkwntaxnjmxmdg1odm2.jpeg', '', '<ul><li>Unique Design:Premium ceramic in the middle and high quality polished stainless steel on both side, the shinny appearance give you a variety of dressy options,heavy duty and never get rusty, better breathability,safe and smooth to the sensitive skin.</li><li>Easy installation: 4 spring bars and 1 spring bar tools help you install and remove the watch strap.It is convenient to quick release and remove off the watch Bracelet with butterfly clasp.</li><li>Band Width: 12mm,14mm,16mm,18mm,20mm,22mm. The length of watch bands is 170-190mm;the thickness is 3.0-3.6mm.The length can be adjusted according to the circumference of your wrist. .</li><li>Color:Gold and White, Gold and Black,Silver and Black, Silver and White, Rose Gold and White,Rose Gold and Black. 6 sizes and 6 colors for choice, suitable for most brand automatic watch, quartz watch,or smart watch.</li><li>Package Included: 1 x Stainless steel Ceramic watchband; 1 x Link remover; 1 x Spring bar tool; 4 x Spring bars; 1 x Cleaning cloth.If you have any problem about the watch straps,please kindly contact us,we will try our best to solve your problem.</li><li><br></li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 590.00, 1, 30.00, 'Percent', 1, 3, '1 week', 1, 65.00, 1, 'binlun-replacement-watch-band-stainless-steel-ceramic-watch-bracelet-polished-strap-ote2', 'MTYZMTA4NTGZNJE0ODY', 0, 0, 0, 0, NULL),
(126, 26, 137, 387, 3, 'Samsung Home Theatre System', 'seller', 30, 6, 4, 2, '', '[\"samsung\",\"samsunghometheatre\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzkwmtkxnjmxmdg2mtkz.jpeg\",\"upload\\/product\\/photos\\/mzu4ndmxnjmxmdg2mtkz.jpeg\"]', 'upload/product/thumbnail/ntmxmtmxnjmxmdg2mtkz.jpeg', '', '<p><span style=\"color: rgb(51, 51, 51);\">In order to keep pace with the never-ending demands of customers, we are involved in offering a wide range of&nbsp;</span><strong style=\"color: rgb(51, 51, 51);\">loyel</strong></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 19000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 200.00, 1, 'samsung-home-theatre-system-mzq3', 'MTYZMTA4NJE5MZKWNDC', 0, 0, 0, 1, NULL),
(127, 19, 153, 531, 3, 'Women\'s Caterina Blouse', 'seller', 29, NULL, 4, 2, '', '[\"blouse\",\"tops\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntuxotuxnjmxmdg2mji4.jpeg\",\"upload\\/product\\/photos\\/njaznzuxnjmxmdg2mji5.jpeg\",\"upload\\/product\\/photos\\/oduymtkxnjmxmdg2mji5.jpeg\",\"upload\\/product\\/photos\\/mjkwmzexnjmxmdg2mji5.jpeg\"]', 'upload/product/thumbnail/ndkznzqxnjmxmdg2mji4.jpeg', '', '<p>Color:&nbsp;White</p><ul><li>100% Cotton</li><li>Imported</li><li>Button closure</li><li>Dry Clean Only</li><li>Shell: 100% cotton</li><li>Fabric: Mid-weight, non-stretch poplin</li><li>Dry clean</li><li>Plunging V neckline with tie accent, button placket, Puff sleeves with elastic cuffs, Ruffle eyelet trim</li><li>Length: 15.75in / 40cm, from shoulde</li></ul><p><br></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Red\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 550.00, 1, 20.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'womens-caterina-blouse-nzkz', 'MTYZMTA4NJIYOTEWNJU', 0, 0, 0, 0, NULL),
(128, 28, 112, 372, 3, ' Snapdeal Bad Boys 7 IN 1 Baba Suit Combo Set.', 'seller', 31, NULL, NULL, 2, '', '[\"combos\",\"sets\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/mjyxmdcxnjmxmdg2mzy2.jpeg\",\"upload\\/product\\/photos\\/mti3otuxnjmxmdg2mzy2.jpeg\"]', 'upload/product/thumbnail/ota0mtexnjmxmdg2mzy2.jpeg', '', '<ul><li class=\"ql-align-center\"><a href=\"http://www.fashionmarg.in/#tab-description\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 34, 34); background-color: rgb(242, 242, 242);\"><strong>DESCRIPTION</strong></a></li><li class=\"ql-align-center\">&nbsp;<a href=\"http://www.fashionmarg.in/#tab-review\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\"><strong>REVIEWS (0)</strong></a></li><li class=\"ql-align-center\">&nbsp;<a href=\"http://www.fashionmarg.in/#tab-contentshipping\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\"><strong>SHIPPING METHODS</strong></a></li><li class=\"ql-align-center\">&nbsp;<a href=\"http://www.fashionmarg.in/#tab-sizechart\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(34, 34, 34); background-color: rgb(255, 255, 255);\"><strong>SIZE CHART</strong></a></li></ul><h3>Product Description</h3><p><strong>Sales Package</strong></p><p>&nbsp;</p><p>1 Dress</p><p><strong>Brand</strong></p><p>&nbsp;</p><p>Zadmus</p><p><strong>Style Code</strong></p><p>&nbsp;</p><p>pp-5114</p><p><strong>Size</strong></p><p>&nbsp;</p><p>0 - 6 Months</p><p><strong>Brand Color</strong></p><p>&nbsp;</p><p>Blue</p><p><strong>Label Size</strong></p><p>&nbsp;</p><p>0</p><p><strong>Ideal For</strong></p><p>&nbsp;</p><p>Baby Boys &amp; Baby Girls</p><p><strong>Primary Product Type</strong></p><p>&nbsp;</p><p>T-shirt</p><p><strong>Secondary Product Type</strong></p><p>&nbsp;</p><p>Dungaree</p><p><strong>Primary Color</strong></p><p>&nbsp;</p><p>Blue</p><p><strong>Fabric</strong></p><p>&nbsp;</p><p>Cotton Blend</p><p><strong>Occasion</strong></p><p>&nbsp;</p><p>Party(Festive)</p><p><strong>Suitable For</strong></p><p>&nbsp;</p><p>Western Wear</p><p><strong>Fabric Care</strong></p><p>&nbsp;</p><p>Cold water wash only</p><p><strong>Pattern</strong></p><p>&nbsp;</p><p>Applique</p><p><strong>Fabric Details</strong></p><p>&nbsp;</p><p>Cotton</p><p>Designer Unisex Baby Cotton Stylish Dress &amp; Your Baby Is Very Comfortable To Wea</p>', 1, '[]', 2, 1, 1, 1, 2, 10, 800.00, 1, 5.00, 'Percent', 1, 0, '', 1, 65.00, 1, '-snapdeal-bad-boys-7-in-1-baba-suit-combo-set-nji4', 'MTYZMTA4NJM2NJCYMJM', 0, 0, 0, 0, NULL),
(129, 29, 187, 765, 3, 'Smart Door Locks', 'seller', 31, NULL, 4, 2, '1', '[\"SmartDoorLocks\",\"DoorLocks\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mzcwmjgxnjmxmdg2ndu3.jpeg\",\"upload\\/product\\/photos\\/nzq2mjkxnjmxmdg2ndu3.jpeg\",\"upload\\/product\\/photos\\/mte4mzyxnjmxmdg2ndu3.jpeg\"]', 'upload/product/thumbnail/nda4otexnjmxmdg2ndu3.jpeg', '', '<p><span style=\"color: rgb(41, 41, 41);\">A smart lock is arguably the most important part of a truly smart, connected home. Not only will it allow you to come and go as you please, it will also monitor who is entering and leaving your home while you\'re away. Some models simply let you use your phone to open and close doors. Some let you assign special privileges to friends, family members, or maintenance staff. Others can be activated using voice commands or triggers from other&nbsp;</span><a href=\"https://www.pcmag.com/news/the-best-smart-home-devices-for-2020\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: inherit;\">smart home devices</a><span style=\"color: rgb(41, 41, 41);\">&nbsp;and services. Here are a few things to consider when deciding on a smart lock, along with reviews of the top models we\'ve tested.</span></p><p><br></p><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 200, 6700.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'smart-door-locks-ntyw', 'MTYZMTA4NJQ1NZUWNZA', 0, 0, 0, 0, NULL),
(130, 27, 96, 769, 3, 'Blazer', 'seller', 32, NULL, NULL, 2, '', '[\"blazer\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndk4mdaxnjmxmdg2ntg5.jpeg\",\"upload\\/product\\/photos\\/njqznjexnjmxmdg2ntg5.jpeg\",\"upload\\/product\\/photos\\/nzizntyxnjmxmdg2ntg5.jpeg\"]', 'upload/product/thumbnail/ntc2nzaxnjmxmdg2ntg5.jpeg', '', '<h2>XJXKS hombres blazer primavera 2018 hombres # 39; s traje delgado traje de boda masculina de gran tamaño M-5XL traje chaqueta cool fashion blazer us349</h2><h2>Especificaciones</h2><ul><li><span style=\"color: rgb(153, 153, 153);\">Género:</span></li><li>Hombres</li><li><span style=\"color: rgb(153, 153, 153);\">Tipo3:</span></li><li>Chaqueta</li><li><span style=\"color: rgb(153, 153, 153);\">Collar:</span></li><li>traje de cuello</li><li><span style=\"color: rgb(153, 153, 153);\">Longitud de manga:</span></li><li>Manga Larga</li><li><span style=\"color: rgb(153, 153, 153);\">Material :</span></li><li>Relleno de material</li><li><span style=\"color: rgb(153, 153, 153);\">Décoration:</span></li><li>Sobrepuesto</li><li><span style=\"color: rgb(153, 153, 153);\">Tipo de Patrón:</span></li><li>Imprimir</li><li><span style=\"color: rgb(153, 153, 153);\">Tipo de cierre:</span></li><li>Solo botón</li><li><span style=\"color: rgb(153, 153, 153);\">Color:</span></li><li>El color natural</li><li><span style=\"color: rgb(153, 153, 153);\">Encapuchado:</span></li><li>Tipo de cierre</li><li><span style=\"color: rgb(153, 153, 153);\">Estilo delante:</span></li><li>plisado</li><li><span style=\"color: rgb(153, 153, 153);\">Tipo de cierre del pantalón:</span></li><li>mosca de la cremallera</li><li><span style=\"color: rgb(153, 153, 153);\">Tipo apto:</span></li><li>Derecho</li><li><span style=\"color: rgb(153, 153, 153);\">Tipo de tela:</span></li><li>Paño fino</li><li><span style=\"color: rgb(153, 153, 153);\">Longitud de la ropa:</span></li><li>Estilo De Manga Regular</li><li><span style=\"color: rgb(153, 153, 153);\">Código de artículo:</span></li><li>423732900</li><li><span style=\"color: rgb(153, 153, 153);\">Categoría:</span></li><li><a href=\"https://es.dhgate.com/wholesale/men-s-suits-blazers/c014030002.html\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 51, 153);\">Trajes &amp; Blazers Para Hombre</a></li><li><br></li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 3500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'blazer-nde4', 'MTYZMTA4NJU4OTEXNZC', 0, 0, 0, 0, NULL),
(131, 19, 153, 540, 3, '100% Pure Mulberry Silk Scarf 35\" Large Square Lightweight Headscarf –Women’s Hair Wraps-With Gift Packed', 'seller', 29, NULL, 4, 2, '', '[\"hijab\",\"dupatta\",\"orna\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ntmxndqxnjmxmdg2ntk0.jpeg\",\"upload\\/product\\/photos\\/nzg3oduxnjmxmdg2ntk0.jpeg\",\"upload\\/product\\/photos\\/nje2mzqxnjmxmdg2ntk0.jpeg\",\"upload\\/product\\/photos\\/odczndmxnjmxmdg2ntk0.jpeg\"]', 'upload/product/thumbnail/njg3ntgxnjmxmdg2ntk0.jpeg', '', '<ul><li>100% Silk</li><li>SPECIFICATION-Size:35*35 inches (90*90cm). Weight: 1.76 OZ.</li><li>MATERIAL - 100% mulberry silk of high quality, close to skin and breathable, soft and smooth as satin, healthy and eco-friendly without pollution or peculiar smell.</li><li>We guarantee that the items we sell on this product page is made of 100% silk(with SGS test report on below product description).</li><li>This scarf is extremely cozy and good for wearing all year round, providing you warmth in spring and autumn, also bringing you coolness in hot summer.</li><li>DESIGN - Various ingenious designed and elaborately printed patterns available (single-side printed), colorful and gorgeous, delicate and beautiful- Fits for women in all ages. You will be the distinctive one in the crowd.</li><li>VERSATILE -The scarf could be wrapped around your head, neck, waist, wrist, or use as headband, bandana, belt accessories, tops, as well as putting on your hat, hair, purse or handbag by different knotting and wearing ways. It is a great addition to compliment your total looks and outfit for any occasions.</li><li>EXQUISITE GIFT BOX PACKED - An ideal and thoughtful gift for your beloved and special ones in celebration of Birthday, Anniversary, Christmas, New Year, Valentine\'s Day, Mother\'s Day, Graduation or other special days.</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 500.00, 1, 10.00, 'Percent', 1, 3, ' 1 week', 1, 65.00, 1, '100-pure-mulberry-silk-scarf-35-large-square-lightweight-headscarf-womens-hair-wraps-with-gift-packed-ndc1', 'MTYZMTA4NJU5NDK1NDE', 0, 0, 0, 0, NULL),
(132, 26, 143, 411, 3, 'SONY Cyber-shot DSC-HX60B Superzoom Compact Camera – Black', 'seller', 30, NULL, 4, 2, '', '[\"sony\",\"sonycamera\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mjewmzaxnjmxmdg2njc2.jpeg\",\"upload\\/product\\/photos\\/mta1mjixnjmxmdg2njc2.jpeg\"]', 'upload/product/thumbnail/nti0mdqxnjmxmdg2njc2.jpeg', '', '<p><span style=\"color: rgb(34, 34, 34);\">Beautiful high-resolution images with CMOS sensor&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">- Get closer to the action with the 30x optical zoom&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">- Shoot home movies in Full HD&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(34, 34, 34);\">- Turn your smartphone into a remote with the built-in NFC&nbsp;</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 60, 80000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 200.00, 1, 'sony-cyber-shot-dsc-hx60b-superzoom-compact-camera--black-mza1', 'MTYZMTA4NJY3NJG0NDI', 0, 0, 0, 1, NULL),
(133, 19, 156, 557, 3, 'SharvgunTM womens Baggy', 'seller', 29, NULL, 4, 2, '', '[\"dhuti\",\"panta\",\"salwer\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/mtm1ntcxnjmxmdg2ota2.jpeg\",\"upload\\/product\\/photos\\/otgxmzkxnjmxmdg2ota2.jpeg\",\"upload\\/product\\/photos\\/nduxntmxnjmxmdg2ota2.jpeg\",\"upload\\/product\\/photos\\/mza2mdmxnjmxmdg2ota2.jpeg\"]', 'upload/product/thumbnail/odu1ntmxnjmxmdg2ota2.jpeg', '', '<ul><li>Drawstring closure</li><li>Fabric : Viscose Lycra Salwar</li><li>Salwar Size: Length 40\" inches, Drawstring fitted Waist up to 51\" Inches (Free Waist)</li><li>Pack OF 1 Patiala Salwar | Color- Brown</li><li>Occasions: Casual wear, home wear, sleep wear, going out, yoga, vacation or beach wear, You can wear it in any season for different use.</li><li>Note:- Colors on the actual product may slightly vary from image shown depending on your monitor settings</li></ul><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 1000.00, 1, 20.00, 'Percent', 1, 3, '1 week', 1, 65.00, 1, 'sharvguntm-womens-baggy-ndc2', 'MTYZMTA4NJKWNJQ0NJU', 0, 0, 0, 0, NULL),
(134, 27, 96, 771, 3, 'suits', 'seller', 32, NULL, NULL, 2, '', '[\"suits\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzk5ndixnjmxmdg3mda5.jpeg\",\"upload\\/product\\/photos\\/nze3otuxnjmxmdg3mda5.jpeg\",\"upload\\/product\\/photos\\/mzu2mzmxnjmxmdg3mda5.jpeg\"]', 'upload/product/thumbnail/otu4otixnjmxmdg3mda5.jpeg', '', '<p><span style=\"color: rgb(53, 53, 53);\">Nothing fits or looks better than custom apparel tailor made to your measurements and personal style. Since 1993 Morroni Custom has been delivering just that.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 120, 2000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'suits-ntu2', 'MTYZMTA4NZAWOTKWMJG', 0, 0, 0, 0, NULL),
(135, 29, 188, 777, 3, 'Bathroom & Kitchen Fittings', 'seller', 31, NULL, 4, 2, '', '[\"Bathroom&KitchenFittings\",\"BathroomFittings\",\"KitchenFittings\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odg3otixnjmxmdg3mde4.jpeg\",\"upload\\/product\\/photos\\/mzc0ndcxnjmxmdg3mde4.jpeg\",\"upload\\/product\\/photos\\/otu0mdcxnjmxmdg3mde4.jpeg\"]', 'upload/product/thumbnail/mju5ntaxnjmxmdg3mde4.jpeg', '', '<p>Bathroom &amp; Kitchen Fittings...</p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 50, 2560.00, 2, 1.00, 'Percent', 1, 0, '', 1, 256.00, 1, 'bathroom--kitchen-fittings-nzk3', 'MTYZMTA4NZAXODG0NJY', 0, 0, 0, 0, NULL),
(136, 19, 159, 646, 3, 'Moroccanoil Moisture Repair Conditioner', 'seller', 29, NULL, 5, 2, '', '[\"conditioner\",\"hair\",\"oil\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ota1mjkxnjmxmdg3mjg4.jpeg\",\"upload\\/product\\/photos\\/otk3otyxnjmxmdg3mjg4.jpeg\",\"upload\\/product\\/photos\\/njgxmjkxnjmxmdg3mjg4.jpeg\"]', 'upload/product/thumbnail/mjk3odqxnjmxmdg3mjg4.jpeg', '', '<p><strong>Brand</strong>Moroccanoil<strong>Scent</strong>Fragrance Originale<strong>Hair Type</strong>Damaged<strong>Liquid Volume</strong>8.5 Fluid Ounces<strong>Ingredients</strong>AQUA/WATER/EAU, BEHENTRIMONIUM CHLORIDE, CETEARYL ALCOHOL, STEARAMIDOPROPYL DIMETHYLAMINE, PPG-3 BENZYL ETHER MYRISTATE, PEG-40 CASTOR OIL, GLYCERIN, ISOPROPYL ALCOHOL, CETRIMONIUM CHLORIDE, HYDROLYZED VEGETABLE PROTEIN PG-PROPYL SILANETRIOL, ARGANIA SPINOSA (ARGAN) KERNEL OIL, SIMMONDSIA CHINENSIS (JOJOBA) SEED OIL, PERSEA GRATISSIMA (AVOCADO) OIL, KERATIN AMINO ACIDS, HYDROLYZED KERATIN, SODIUM PCA, SILK AMINO ACIDS, ROSMARINUS OFFICINALIS (ROSEMARY) LEAF EXTRACT, LAVANDULA ANGUSTIFOLIA (LAVENDER) FLOWER EXTRACT, CHAMOMILLA RECUTITA (MATRICARIA) FLOWER EXTRACT, AMODIMETHICONE, TRIDECETH-12, C11-15 PARETH-7, LAURETH-9, PANTHENOL, PROPYLENE GLYCOL DICAPRYLATE/DICAPRATE, PPG-1 TRIDECETH-6, HYDROXYPROPYL GUAR HYDROXYPROPYLTRIMONIUM CHLORIDE, POLYQUATERNIUM-37, PROPYLENE GLYCOL, CINNAMIDOPROPYLTRIMONIUM CHLORIDE, DISODIUM EDTA, PARFUM/FRAGRANCE, PHENOXYETHANOL, ETHYLHEXYLGLYCERIN, CITRIC ACID, CI 19140 (YELLOW 5), CI 17200 (RED 33), SODIUM BENZOATE, POTASSIUM SORBATE, BUTYLPHENYL METHYLPROPIONAL, HYDROXYISOHEXYL 3-CYCLOHEXENE CARBOXALDEHYDE, LINALOOL, ALPHA- ISOMETHYL IONONE. MOMRC01</p><p>AQUA/WATER/EAU, BEHENTRIMONIUM CHLORIDE, CETEARYL ALCOHOL, STEARAMIDOPROPYL DIMETHYLAMINE…&nbsp;<span style=\"color: rgb(0, 113, 133);\">See more</span></p><p><a href=\"https://www.amazon.com/gp/offer-listing/B002N5MKM6/ref=dp_olp_NEW_mbc?ie=UTF8&amp;condition=NEW\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">New (5) from&nbsp;</a><a href=\"https://www.amazon.com/gp/offer-listing/B002N5MKM6/ref=dp_olp_NEW_mbc?ie=UTF8&amp;condition=NEW\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(177, 39, 4);\">$24.00</a></p>', 2, '[{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 20, 700.00, 2, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'moroccanoil-moisture-repair-conditioner-nzkx', 'MTYZMTA4NZI4ODQ5NDY', 0, 0, 0, 0, NULL),
(137, 29, 190, 786, 3, 'Paintings', 'seller', 31, NULL, 4, 2, '', '[\"Paintings\",\"Painting\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/odcyodcxnjmxmdg3ndc0.jpeg\",\"upload\\/product\\/photos\\/njexntyxnjmxmdg3ndc0.png\",\"upload\\/product\\/photos\\/ntyyoduxnjmxmdg3ndc0.jpeg\"]', 'upload/product/thumbnail/otk1mtixnjmxmdg3ndc0.jpeg', '', '<p><span style=\"color: rgb(0, 0, 0);\">On a larger scale, Pollot’s portfolio makes us think about an artwork’s place throughout time. “I think that my body of work has challenged the idea that any single piece of artwork is without a place, especially if it can be retrofitted to reflect a more culturally relevant set of ideas,” he says. “It’s also questioned the idea of who (generationally and otherwise) can claim ownership of the pop culture of a given time period—it’s sought to introduce a younger audience to older artistic styles and a potentially older audience to a broader set of pop culture.”</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 100, 3300.00, 2, 1.00, 'Percent', 1, 0, '', 1, 120.00, 1, 'paintings-otc3', 'MTYZMTA4NZQ3NDM1NDA', 0, 1, 0, 0, NULL),
(138, 26, 146, 422, 3, 'Camera lens afbeeldingen', 'seller', 30, NULL, 4, 2, '', '[]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/nzi0mtcxnjmxmdg3ntu1.jpeg\",\"upload\\/product\\/photos\\/nze2nzcxnjmxmdg3ntu1.jpeg\",\"upload\\/product\\/photos\\/otcwmdcxnjmxmdg3ntu1.png\"]', 'upload/product/thumbnail/ndqwmzcxnjmxmdg3ntu1.jpeg', '', '<p><span style=\"color: rgba(12, 18, 28, 0.6);\">516.330camera lens stockfoto‘s, vectoren en illustraties zijn rechtenvrij beschikbaar</span></p>', 2, '[{\"name\":\"Black\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 30, 20000.00, 2, 1.00, 'Percent', 1, 0, '', 1, 120.00, 1, 'camera-lens-afbeeldingen-ntaw', 'MTYZMTA4NZU1NTK4NJC', 0, 1, 0, 0, NULL),
(139, 27, 96, 773, 3, 'Sweaters', 'seller', 32, NULL, NULL, 2, '', '[\"sweaters\",\"clothingseaters\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/otg1mdixnjmxmdg3njq3.jpeg\",\"upload\\/product\\/photos\\/otaznzixnjmxmdg3njq3.jpeg\"]', 'upload/product/thumbnail/mtc0njuxnjmxmdg3njq3.jpeg', '', '<p><span style=\"color: rgb(26, 26, 26);\">The ability to properly wash and care for your sweater collection could very well add many years to the lifespan of each sweater you own.</span></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 1, 2, 60, 300.00, 2, 1.00, 'Percent', 1, 1, '1 month', 1, 50.00, 1, 'sweaters-mjcy', 'MTYZMTA4NZY0NZCWMZY', 0, 1, 0, 0, NULL),
(140, 27, 96, 736, 3, 'polos t-shirts', 'seller', 32, NULL, NULL, 2, '', '[\"t-shirtpolos\"]', '', 1, 2, '[]', '[\"upload\\/product\\/photos\\/ndqyotyxnjmxmdg4mtk5.jpeg\",\"upload\\/product\\/photos\\/mzq5mdkxnjmxmdg4mtk5.jpeg\"]', 'upload/product/thumbnail/otu4ntaxnjmxmdg4mtk5.jpeg', '', '<h1>5Pieces Men\'s T-shirt Polos Tops Business Casual 5 Color Combination Fashion T-shirt Men Embroidery Simple Men Slim Polo Shirt High Quality</h1><p><br></p>', 2, '[{\"name\":\"Red\",\"image\":\"\"},{\"name\":\"Black\",\"image\":\"\"},{\"name\":\"Gold\",\"image\":\"\"}]', 2, 1, 1, 3, 2, 120, 200.00, 2, 1.00, 'Percent', 1, 0, '', 1, 50.00, 1, 'polos-t-shirts-nzq5', 'MTYZMTA4ODE5OTQ1MDE', 0, 1, 0, 0, NULL),
(141, 28, 205, 766, 3, ' Boy\'s Fleece Sweatshirts, Hoodies, Sweatpants & Joggers', 'seller', 31, NULL, NULL, 2, '', '[\"sweatshirts\",\"hoodies\",\"sweatpant\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/odk5otqxnjmxmti1ndax.jpeg\",\"upload\\/product\\/photos\\/mtq4ndixnjmxmti1ndax.jpeg\",\"upload\\/product\\/photos\\/mzuxmzgxnjmxmti1ndax.jpeg\",\"upload\\/product\\/photos\\/njc1mtyxnjmxmti1ndax.jpeg\"]', 'upload/product/thumbnail/ndu0njyxnjmxmti1ndax.jpeg', '', '<p>The Fruit of the Loom boys’ fleece combines comfort and durability to provide your child with endless hours of wear and tear. Our boys’ fleece is perfect for outdoor adventures or classroom activities. This sleeveless full zip jacket is new spin on a classic piece. He’ll love layering his favorite long sleeve with this great jacket. This full zip jacket comes in great, essential colors. Shop the rest of the boys’ fleece to find coordinating styles</p><hr><h2>Product details</h2><ul><li><strong>Package Dimensions ‏ : ‎&nbsp;</strong>10.9 x 9 x 1.6 inches; 12.8 Ounces</li><li><strong>Item model number ‏ : ‎&nbsp;</strong>12000B</li><li><strong>Department ‏ : ‎&nbsp;</strong>Boys</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>June 4, 2019</li><li><strong>Manufacturer ‏ : ‎&nbsp;</strong>Fruit of the Loom</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B00GRQIO90</li><li><strong>Best Sellers Rank:&nbsp;</strong>#184 in Clothing, Shoes &amp; Jewelry (<a href=\"https://www.amazon.com/gp/bestsellers/fashion/ref=pd_zg_ts_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Clothing, Shoes &amp; Jewelry</a>)</li><li class=\"ql-indent-1\">#1 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/5604815011/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Boys\' Fashion Hoodies &amp; Sweatshirts</a></li><li class=\"ql-indent-1\">#1 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/2422526011/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Boys\' Outerwear Vests</a></li><li><strong>Customer Reviews:&nbsp;</strong><em style=\"color: rgb(0, 113, 133);\">4.6 out of 5 stars</em></li><li><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/Fruit-Loom-Sweatshirt-Charcoal-Heather/dp/B00KX3L68O/ref=sr_1_3?dchild=1&amp;keywords=boys%2Bsweatshirts&amp;qid=1631125026&amp;sr=8-3&amp;th=1#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">5,763 ratings</a></li></ul><p><br></p>', 1, '[]', 2, 1, 1, 1, 2, 10, 1500.00, 1, 1.00, 'Percent', 1, 3, '', 1, 65.00, 1, '-boys-fleece-sweatshirts-hoodies-sweatpants--joggers-ote5', 'MTYZMTEYNTQWMTMYODU', 0, 0, 0, 0, NULL),
(142, 28, 205, 768, 3, ' Carhartt Boys\' Active Jac Quilt Lined Jacket Coat', 'seller', 31, NULL, NULL, 2, '', '[\"jacket\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/njezmzuxnjmxmti1nzc0.jpeg\",\"upload\\/product\\/photos\\/nzi3otixnjmxmti1nzc0.jpeg\",\"upload\\/product\\/photos\\/mjeyotexnjmxmti1nzc0.jpeg\"]', 'upload/product/thumbnail/mjkxotuxnjmxmti1nzc0.jpeg', '', '<p>The Active Jac has been a favorite on American ranches, farms, and factory floors since its release in the \'70s. This kids\' cold-weather versiost like n is made of durable cotton duck that looks just like the adult version but feels broken-in from the start. The flannel lining ensures kids stay warm whether they\'re running around the park or the orchard.</p><hr><h2>Product details</h2><ul><li><strong>Product Dimensions ‏ : ‎&nbsp;</strong>5 x 5 x 0.7 inches; 1.3 Pounds</li><li><strong>Item model number ‏ : ‎&nbsp;</strong>CP8430-210</li><li><strong>Department ‏ : ‎&nbsp;</strong>Boys</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>November 4, 2010</li><li><strong>Manufacturer ‏ : ‎&nbsp;</strong>Carhartt Children\'s Apparel</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B003KTMODO</li><li><strong>Best Sellers Rank:&nbsp;</strong>#10,253 in Clothing, Shoes &amp; Jewelry (<a href=\"https://www.amazon.com/gp/bestsellers/fashion/ref=pd_zg_ts_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Clothing, Shoes &amp; Jewelry</a>)</li><li class=\"ql-indent-1\">#2 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/7132397011/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Boys\' Outerwear Jackets</a></li><li><strong>Customer Reviews:&nbsp;</strong><em style=\"color: rgb(0, 113, 133);\">4.8 out of 5 stars</em></li><li><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/Carhartt-Little-Toddler-Active-Jacket/dp/B00LW90VMU/ref=sr_1_16?dchild=1&amp;keywords=boys%2Bjacket&amp;qid=1631125443&amp;sr=8-16&amp;th=1#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">5,914 ratings</a></li></ul><p><br></p>', 1, '[]', 2, 1, 1, 2, 2, 1, 0.00, 1, 10.00, 'Percent', 1, 2, '', 1, 65.00, 1, '-carhartt-boys-active-jac-quilt-lined-jacket-coat-mty4', 'MTYZMTEYNTC3NDGXNTG', 0, 0, 0, 0, NULL),
(143, 28, 162, 472, 3, 'Girls Tops Casual Long Sleeve Shirts', 'seller', 31, NULL, NULL, 2, '', '[\"sweatshirts\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/njywmjqxnjmxmti2mtk4.jpeg\",\"upload\\/product\\/photos\\/ntc2mtcxnjmxmti2mtk4.jpeg\",\"upload\\/product\\/photos\\/mjq2mtqxnjmxmti2mtk4.jpeg\",\"upload\\/product\\/photos\\/ody2mjexnjmxmti2mtk4.jpeg\",\"upload\\/product\\/photos\\/otmxmduxnjmxmti2mtk4.jpeg\"]', 'upload/product/thumbnail/ntiynjkxnjmxmti2mtk4.jpeg', '', '<p class=\"ql-align-center\"><img src=\"https://m.media-amazon.com/images/S/aplus-media-library-service-media/59b493c1-afc9-403e-8e26-83fc09d0ecb0.__CR0,0,600,180_PT0_SX600_V1___.jpg\" alt=\"storeofbaby\"></p><h3>storeofbaby Kids Girls Tunic Shirts Basic Solid Tops Comfy Fit Leopard Color Block Tshirts for 4-13 Years</h3><p><img src=\"https://m.media-amazon.com/images/S/aplus-media-library-service-media/7a5a73b4-7386-4d31-82d2-8878c31a1e17.__CR0,0,970,600_PT0_SX970_V1___.jpg\" alt=\"girls long sleeve shirts\"><strong>About storeofbaby Girls Winter Tops:</strong></p><p><strong>Item Type:&nbsp;</strong>Girls Long Sleeve Shirts</p><p><strong>Material:&nbsp;</strong>High quality fabric for a comfortable fit</p><p><strong>Color: S</strong>olid, leopard print, stripe, color block. Available in 13 different colors</p><p><strong>Season:&nbsp;</strong>Fall, winter, spring</p><p><strong>Occasion:&nbsp;</strong>Great for daily wear, school, going out, party, birthday, traveling, sports, outdoor activities, and more</p><p><strong>Style Fit:&nbsp;</strong>Easily pair it with jeans, shorts, leggings, skirts for a casual everyday look</p><p><img src=\"https://m.media-amazon.com/images/S/aplus-media-library-service-media/00c68760-9437-4e59-8c3c-e333cb409c52.__CR0,0,970,600_PT0_SX970_V1___.jpg\" alt=\"pocket shirts for girls\">This style of girl round neck shirt<strong>&nbsp;</strong>it\'s easy to put on or take off, which can give your sweet girl a light and simple dressing experience</p><p>The fabric is soft and lightweight to make relaxing as comfortable as possible</p><p>Girls casual tops is basic but stylish, your little girls will love to wear this tops everyday</p><p><img src=\"https://m.media-amazon.com/images/S/aplus-media-library-service-media/530854d0-9ee4-4ad9-ae77-57c4e5b1a7f1.__CR0,0,970,600_PT0_SX970_V1___.jpg\" alt=\"girls tunic tops\"><strong>Q&amp;A Part:</strong></p><p><strong>Q1：Does the long sleeve tops look exactly like the picture?</strong></p><p>A1: Looks exactly as pictured</p><p><strong>Q2：Is this a lightweight top?</strong></p><p>A2: It is a lightweight top, very comfortable and soft</p><p><strong>Q3：Does the girls tunic tops true to size?</strong></p><p>A3：True to size</p>', 1, '[]', 2, 1, 1, 2, 2, 1, 0.00, 1, 5.00, 'Percent', 1, 3, '', 1, 65.00, 1, 'girls-tops-casual-long-sleeve-shirts-mzm1', 'MTYZMTEYNJE5ODMXNTY', 0, 0, 0, 0, NULL),
(144, 28, 162, 477, 3, 'Girls\' Lightweight Water-Resistant Packable Hooded Puffer Jacket', 'seller', 31, NULL, NULL, 2, '', '[\"putter\",\"jacket\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/njyyndgxnjmxmti2nzk1.jpeg\",\"upload\\/product\\/photos\\/otuxnzyxnjmxmti2nzk1.jpeg\",\"upload\\/product\\/photos\\/nzgzntixnjmxmti2nzk1.jpeg\",\"upload\\/product\\/photos\\/mzg0otcxnjmxmti2nzk1.jpeg\"]', 'upload/product/thumbnail/mzk3ntmxnjmxmti2nzk1.jpeg', '', '<p>An Amazon brand - This water resistant puffer jacket is perfect for keeping you warm during winter, and it\'s adventure-ready no matter the weather</p><p>Amazon Essentials has what you need to outfit your little ones in affordable, high-quality, and long-lasting everyday clothing. Our line of kids\' must-haves includes cozy fleeces and oh-so warm puffer jackets to keep them bundled up when the temperatures drop, as well as school uniform-ready pants and polo shirts. Consistent sizing takes the guesswork out of shopping, and each piece is put to the test to maintain parent-approved standards in quality and comfort.</p><hr><h2>Product details</h2><ul><li><strong>Package Dimensions ‏ : ‎&nbsp;</strong>1 x 1 x 1 inches; 8 Ounces</li><li><strong>Item model number ‏ : ‎&nbsp;</strong>G-S17AE10003</li><li><strong>Department ‏ : ‎&nbsp;</strong>Girls</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>December 23, 2020</li><li><strong>Manufacturer ‏ : ‎&nbsp;</strong>Amazon Essentials</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B08R851CZT</li><li><strong>Best Sellers Rank:&nbsp;</strong>#3,719 in Sports &amp; Outdoors (<a href=\"https://www.amazon.com/gp/bestsellers/sporting-goods/ref=pd_zg_ts_sporting-goods\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Sports &amp; Outdoors</a>)</li><li class=\"ql-indent-1\">#1 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/2412723011/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Girls\' Down Jackets &amp; Coats</a></li><li class=\"ql-indent-1\">#2 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/sporting-goods/11444050011/ref=pd_zg_hrsr_sporting-goods\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Girls\' Outdoor Recreation Jackets</a></li><li class=\"ql-indent-1\">#2 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/7132382011/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Girls\' Outerwear Jackets</a></li><li><strong>Customer Reviews:&nbsp;</strong><em style=\"color: rgb(0, 113, 133);\">4.6 out of 5 stars</em></li><li><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/Amazon-Essentials-Lightweight-Water-Resistant-Packable/dp/B0862KN6GG/ref=sxin_13_slsr_d_i_fs4star_fa_0_B08SXGHSN3?cv_ct_cx=girls%2Bjackets&amp;dchild=1&amp;keywords=girls%2Bjackets&amp;pd_rd_i=B08SXGHSN3&amp;pd_rd_r=449fb143-1ed0-47bc-a341-46f830918719&amp;pd_rd_w=5xjZK&amp;pd_rd_wg=gwk9W&amp;pf_rd_p=138e0b64-9b42-43d1-bd18-83662d1fd0d4&amp;pf_rd_r=PW6XHBV2Y6TQZCTTA3X0&amp;qid=1631126415&amp;sr=1-1-1157f02f-9108-4e24-9b1c-597d53863e82&amp;th=1&amp;psc=1#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">3,916 ratings</a></li></ul><p><br></p>', 1, '[]', 2, 1, 1, 1, 2, 20, 2000.00, 1, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, 'girls-lightweight-water-resistant-packable-hooded-puffer-jacket-mjq2', 'MTYZMTEYNJC5NTQ3NTQ', 0, 0, 0, 0, NULL),
(145, 28, 162, 486, 3, ' Winter Coats Cute Newborn Infant Jumpsuit Snowsuit Bodysuits', 'seller', 31, NULL, NULL, 2, '', '[\"jumpsuit\",\"snowsuit\",\"bodysuits\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/otm3njcxnjmxmti3mtc3.jpeg\",\"upload\\/product\\/photos\\/nzc1odgxnjmxmti3mtc3.jpeg\",\"upload\\/product\\/photos\\/mjiyoduxnjmxmti3mtc3.jpeg\",\"upload\\/product\\/photos\\/mtu4mzcxnjmxmti3mtc3.jpeg\"]', 'upload/product/thumbnail/mjm2otyxnjmxmti3mtc3.jpeg', '', '<h2>Product details</h2><ul><li><strong>Product Dimensions ‏ : ‎&nbsp;</strong>3.94 x 3.94 x 1.97 inches; 14.39 Ounces</li><li><strong>Item model number ‏ : ‎&nbsp;</strong>ICECHO146-GREY-59</li><li><strong>Department ‏ : ‎&nbsp;</strong>Baby-girls</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>August 21, 2019</li><li><strong>Manufacturer ‏ : ‎&nbsp;</strong>XMWEALTHY</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B07WGT3NLQ</li><li><strong>Best Sellers Rank:&nbsp;</strong>#9,677 in Clothing, Shoes &amp; Jewelry (<a href=\"https://www.amazon.com/gp/bestsellers/fashion/ref=pd_zg_ts_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Clothing, Shoes &amp; Jewelry</a>)</li><li class=\"ql-indent-1\">#2 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/3526417011/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Baby Boys\' Snow Wear</a></li><li class=\"ql-indent-1\">#218 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/fashion/1044512/ref=pd_zg_hrsr_fashion\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Baby Girls\' Clothing</a></li><li><strong>Customer Reviews:&nbsp;</strong><em style=\"color: rgb(0, 113, 133);\">4.5 out of 5 stars</em></li><li><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/XMWEALTHY-Newborn-Jumpsuit-Snowsuit-Bodysuits/dp/B07WGT3MXJ/ref=sr_1_2?dchild=1&amp;keywords=Infant%2Bwinter%2Bwear%2Bgirls&amp;qid=1631126851&amp;sr=8-2&amp;th=1#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">3,398 ratings</a></li></ul><p><br></p>', 1, '[]', 2, 1, 1, 1, 2, 20, 800.00, 1, 1.00, 'Percent', 1, 0, '', 1, 65.00, 1, '-winter-coats-cute-newborn-infant-jumpsuit-snowsuit-bodysuits-odqz', 'MTYZMTEYNZE3NZM5NZY', 0, 0, 0, 0, NULL),
(146, 28, 162, 492, 3, 'Sweet & Sassy Girl\'s 2-Pack Thermal Warm Underwear Top and Pant Set', 'seller', 31, NULL, NULL, 2, '', '[\"pack\",\"thermal\",\"warm\",\"underwear\",\"top\",\"pant\"]', '', 1, 1, '[]', '[\"upload\\/product\\/photos\\/mjg4odgxnjmxmti3nduz.jpeg\",\"upload\\/product\\/photos\\/oti3mzmxnjmxmti3nduz.jpeg\"]', 'upload/product/thumbnail/nzeymtyxnjmxmti3nduz.jpeg', '', '<p><strong>Sweet &amp; Sassy is a Fantastic Choice</strong>&nbsp;when you are searching for super fashionable and crazy comfortable children clothing.</p><p>Determined to provide the absolute best apparels on prices that cannot be beaten, we present our warm and cozy thermal underwear that will hold your loved ones warm and happy all day long</p><ul><li><strong>Bundle up and layer up</strong>&nbsp;for any occasion ahead, with a set that&nbsp;<strong>can be used on multiple instances</strong>, whether that is in the chilly morning, during play in the afternoon or simply at night as pajamas. They&nbsp;<strong>retain heat and resist shrinkage</strong></li><li><strong>Extra soft thermal knit</strong>&nbsp;that&nbsp;<strong>can stretch</strong>&nbsp;with you as you move, it will provide complete freedom of movement</li><li><strong>Convenient Packaging&nbsp;</strong>with Two Full Sets in Each Pack</li><li>Made with&nbsp;<strong>safe dyes</strong>, perfect for sensitive skins because they&nbsp;<strong>contain no harsh chemicals</strong>&nbsp;and are made with&nbsp;<strong>super-soft cotton fabric</strong></li><li><strong>Wicks away moisture</strong>&nbsp;to keep your precious ones&nbsp;<strong>dry and comfortable</strong>, providing&nbsp;<strong>insulation and warmth</strong></li></ul><p><strong>Sweet &amp; Sassy Offers a Premium Selection of kids clothing at Affordable Prices</strong>&nbsp;because we value every customer that visits our listings!&nbsp;<strong>Stop by Our Storefront to See the Rest of Our Great Deals,</strong>&nbsp;we’re confident you’re going to find clothing for kids and toddlers that you will absolutely love and adore!</p><hr><h2>Product details</h2><ul><li><strong>Product Dimensions ‏ : ‎&nbsp;</strong>8 x 8 x 1 inches; 2.4 Ounces</li><li><strong>Department ‏ : ‎&nbsp;</strong>Girls</li><li><strong>Date First Available ‏ : ‎&nbsp;</strong>October 27, 2020</li><li><strong>ASIN ‏ : ‎&nbsp;</strong>B08LZR69YD</li><li><strong>Best Sellers Rank:&nbsp;</strong>#96,008 in Sports &amp; Outdoors (<a href=\"https://www.amazon.com/gp/bestsellers/sporting-goods/ref=pd_zg_ts_sporting-goods\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">See Top 100 in Sports &amp; Outdoors</a>)</li><li class=\"ql-indent-1\">#19 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/sporting-goods/2419396011/ref=pd_zg_hrsr_sporting-goods\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Girls\' Boxing Clothing</a></li><li class=\"ql-indent-1\">#20 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/sporting-goods/2419405011/ref=pd_zg_hrsr_sporting-goods\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Girls\' Rugby Clothing</a></li><li class=\"ql-indent-1\">#39 in&nbsp;<a href=\"https://www.amazon.com/gp/bestsellers/sporting-goods/2419398011/ref=pd_zg_hrsr_sporting-goods\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">Girls\' Cycling Clothing</a></li><li><strong>Customer Reviews:&nbsp;</strong><em style=\"color: rgb(0, 113, 133);\">4.1 out of 5 stars</em></li><li><span style=\"color: rgb(0, 113, 133);\">&nbsp;</span>&nbsp;&nbsp;&nbsp;<a href=\"https://www.amazon.com/Sweet-Sassy-Thermal-Underwear-Set-Grey/dp/B08LZR69YD/ref=sr_1_8?dchild=1&amp;keywords=thermal%2Bgirls&amp;qid=1631127214&amp;sr=8-8&amp;th=1#customerReviews\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(0, 113, 133);\">773 ratings</a></li></ul><p><br></p>', 1, '[]', 2, 1, 1, 1, 2, 30, 2500.00, 1, 10.00, 'Percent', 1, 3, '', 1, 65.00, 1, 'sweet--sassy-girls-2-pack-thermal-warm-underwear-top-and-pant-set-otqz', 'MTYZMTEYNZQ1MZE4NDK', 0, 0, 0, 0, NULL),
(147, 19, 91, 420, 3, 'Nike Jordan Air ', 'admin', 1, 2, 4, 1, '600', '[]', '', 1, 1, '[{\"name\":\"Color\",\"value\":[\"White\",\"pink\",\"yellow\",\"red\",\"Black, Blue, Pink\"]}]', '[\"upload\\/product\\/photos\\/mjuwnduxnjmxmzuxotu5.jpeg\"]', 'upload/product/thumbnail/njm4odexnjmxmzuxotu5.jpeg', '', '', 2, '[]', 2, 1, 1, 2, 2, 500, 500.00, 2, 1.00, 'Percent', 1, 0, '', 1, 32.00, 1, 'nike-jordan-air--odm0', 'MTYZMTM1MTK1OTYXOTY', 1, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 1.00,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`) VALUES
(1, 7, '[\"Red\",\"4GB\",\"32GB\"]', 'MTYXNTC0NTY5NDKXMDK', 15000.00, 360),
(2, 7, '[\"Red\",\"4GB\",\"64GB\"]', 'MTYXNTC0NTY5NDKXNDE', 17000.00, 540),
(3, 7, '[\"Red\",\"8GB\",\"32GB\"]', 'MTYXNTC0NTY5NDQ3ODE', 8000.00, 207),
(4, 7, '[\"Red\",\"8GB\",\"64GB\"]', 'MTYXNTC0NTY5NDG0NJU', 20000.00, 105),
(5, 7, '[\"Gold\",\"4GB\",\"32GB\"]', 'MTYXNTC0NTY5NDQZMDE', 34000.00, 138),
(6, 7, '[\"Gold\",\"4GB\",\"64GB\"]', 'MTYXNTC0NTY5NDQ0NDE', 11000.00, 166),
(7, 7, '[\"Gold\",\"8GB\",\"32GB\"]', 'MTYXNTC0NTY5NDI1NJY', 10000.00, 154),
(8, 7, '[\"Gold\",\"8GB\",\"64GB\"]', 'MTYXNTC0NTY5NDUWOTK', 28000.00, 134),
(9, 7, '[\"Black\",\"4GB\",\"32GB\"]', 'MTYXNTC0NTY5NDK2MJK', 25500.00, 646),
(10, 7, '[\"Black\",\"4GB\",\"64GB\"]', 'MTYXNTC0NTY5NDYYOTE', 15000.00, 256),
(11, 7, '[\"Black\",\"8GB\",\"32GB\"]', 'MTYXNTC0NTY5NDQ3NJK', 12000.00, 123),
(12, 7, '[\"Black\",\"8GB\",\"64GB\"]', 'MTYXNTC0NTY5NDU4MZI', 27000.00, 745),
(13, 18, '[\"Black\"]', 'MTYZMTAWMZE4NDY3NJI', 14500.00, 20),
(14, 26, '[\"Black\"]', 'MTYZMTAWNDYZMTE1NTI', 1400.00, 20),
(15, 26, '[\"Red\"]', 'MTYZMTAWNDYZMTC5MZI', 1300.00, 10),
(16, 26, '[\"Gold\"]', 'MTYZMTAWNDYZMTKZMZY', 1000.00, 5),
(17, 34, '[\"Black\"]', 'MTYZMTAWNTG4OTKWNJE', 1600.00, 10),
(18, 34, '[\"Red\"]', 'MTYZMTAWNTG4OTC3MDU', 1500.00, 5),
(19, 34, '[\"Gold\"]', 'MTYZMTAWNTG4OTCYMZE', 1200.00, 5),
(20, 52, '[\"Red\"]', 'MTYZMTAWODK0ODUXMJA', 5000.00, 5),
(21, 52, '[\"Black\"]', 'MTYZMTAWODK0ODG3NDK', 5500.00, 5),
(22, 52, '[\"Gold\"]', 'MTYZMTAWODK0ODEZMTG', 6000.00, 5),
(23, 92, '[\"Red\"]', 'MTYZMTAXMJG3MJI2NZU', 1500.00, 10),
(24, 92, '[\"Black\"]', 'MTYZMTAXMJG3MJQZMJM', 25000.00, 15),
(25, 142, '[\"Red\"]', 'MTYZMTEYNTC3NDM0MDY', 2000.00, 5),
(26, 142, '[\"Black\"]', 'MTYZMTEYNTC3NDI2NZC', 1500.00, 10),
(27, 142, '[\"Gold\"]', 'MTYZMTEYNTC3NDQWNDE', 2500.00, 10),
(28, 143, '[\"Red\"]', 'MTYZMTEYNJE5ODE2MJE', 2000.00, 10),
(29, 143, '[\"Black\"]', 'MTYZMTEYNJE5ODGYMTG', 1500.00, 15),
(30, 147, '[\"White\"]', 'MTYZMTM1MTK1OTEYNTU', 500.00, 100),
(31, 147, '[\"pink\"]', 'MTYZMTM1MTK1OTC5MJI', 600.00, 100),
(32, 147, '[\"yellow\"]', 'MTYZMTM1MTK1OTQXNDQ', 900.00, 100),
(33, 147, '[\"red\"]', 'MTYZMTM1MTK1OTCXNTG', 200.00, 100),
(34, 147, '[\"Black\",\" Blue\",\" Pink\"]', 'MTYZMTM1MTK1OTE2NDQ', 1000.00, 100);

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `product`, `email`, `quantity`, `unit_id`, `status`) VALUES
(4, 'Iphone X', 'nayem@gmail.com', '100', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`) VALUES
(1, 'Barishal'),
(2, 'Dhaka'),
(3, 'Khulna'),
(4, 'Chittagong'),
(5, 'Sylhet'),
(6, 'Rajshahi'),
(7, 'Mymensingh'),
(8, 'Rangpur'),
(9, 'Rongpur');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Super Admins'),
(2, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`id`, `role_id`, `permission_id`) VALUES
(7, 1, 1),
(8, 1, 2),
(9, 1, 3),
(10, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'XYZ',
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social` tinyint(1) NOT NULL DEFAULT 0,
  `facebook` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insta` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vacation` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Off, 1=On'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `shop_name`, `category_id`, `user_id`, `shop_description`, `shop_logo`, `shop_banner`, `phone`, `social`, `facebook`, `twitter`, `youtube`, `insta`, `vacation`) VALUES
(6, 'Manik Miya', NULL, 19, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(7, 'anwar khan', 26, 24, 'dhaka whole seller', 'upload/user/store/mzyymzexnji5njexndk4.jpeg', '[\"upload\\/user\\/store\\/nju4otkxnji5njexndk4.jpeg\",\"upload\\/user\\/store\\/oty0mjmxnji5njexndk4.jpeg\"]', '01775026866', 1, 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.youtube.com/', 'https://www.instagram.com/', 0),
(8, 'Nayem Islam', NULL, 23, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(9, 'MD IMRAAN', 21, 27, 'Best Ecommerce Solution', 'upload/user/store/mjuwnzkxnjmwnzq4mji2.jpeg', '[\"upload\\/user\\/store\\/ndq1otgxnjmwnzq4mji2.jpeg\"]', '01567945439', 1, 'facebook.com', 'twitter.com', 'youtube.com', 'instagram.com', 0),
(10, 'anu', NULL, 26, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(11, 'anu', NULL, 26, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(12, 'anu', NULL, 26, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(13, 'anu', NULL, 26, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(14, 'anu', NULL, 26, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(15, 'anu', NULL, 26, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(16, 'shanaz akter', 19, 29, 'r purpose at Cents of Style is to empower women to lead bold and full lives. We believe that if yo', 'upload/user/store/mjk5mjkxnjmwotk5ntyw.png', '[\"upload\\/user\\/store\\/mzg1nzcxnjmwotk5ntyx.jpeg\",\"upload\\/user\\/store\\/nje1mdixnjmwotk5ntyx.jpeg\"]', '01846524244', 0, NULL, NULL, NULL, NULL, 0),
(17, 'Hredoy Hassan', NULL, 28, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(18, 'shakil ahmed', NULL, 30, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(19, 'anesa akter', NULL, 31, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0),
(20, 'rocky', NULL, 32, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_addresses`
--

CREATE TABLE `shop_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_addresses`
--

INSERT INTO `shop_addresses` (`id`, `user_id`, `region_id`, `city_id`, `area_id`, `address`) VALUES
(6, 19, NULL, NULL, NULL, NULL),
(7, 24, 2, 1, 2, 'mohamdpur'),
(8, 23, NULL, NULL, NULL, NULL),
(9, 27, 2, 1, 1, 'Sector 8, College Road'),
(10, 26, NULL, NULL, NULL, NULL),
(11, 26, NULL, NULL, NULL, NULL),
(12, 26, NULL, NULL, NULL, NULL),
(13, 26, NULL, NULL, NULL, NULL),
(14, 26, NULL, NULL, NULL, NULL),
(15, 26, NULL, NULL, NULL, NULL),
(16, 29, 2, 17, 6, 'rajfulbaria'),
(17, 28, NULL, NULL, NULL, NULL),
(18, 30, NULL, NULL, NULL, NULL),
(19, 31, NULL, NULL, NULL, NULL),
(20, 32, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/user/user.png',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `photo`, `name`, `email`, `mobile`, `address`, `designation`) VALUES
(2, 'image/user/user.png', 'kemon', '', '', '', NULL),
(3, 'upload/staff/mzayodkxnji1ndi5ndgz.jpeg', 'Mamun Miya', 'mamun@gmail.com', '01923456786', 'kazipara', 'Director of eCommerce'),
(4, 'upload/staff/odq2nzkxnjmwmziwmdmy.png', 'anwar khan', 'anwarkhan0678@gmail.com', '01775086266', 'savar', 'IT Technician'),
(5, 'upload/staff/ndg2mjgxnjmwnjy1mdqx.png', 'ATIQUL MILON', '', '01812000055', 'savar, dhaka', 'Digital Marketing Manager');

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
(4, 'nayem@gmail.com'),
(5, 'anwarkhan0678@gmail.com'),
(6, 'anower.upwork@gmail.com');

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
(81, 'CLOTHING', 'ক্লথিং', 19, 1, 'clothing-odky'),
(87, 'Bath  And Boby', 'স্নান এবং শরীর', 21, 4, 'bath--and-boby-mje2'),
(89, 'Mens Grooming', 'পুরুষদের গ্রুমিং', 21, 3, 'mens-grooming-ody3'),
(90, 'Skin care', ' ত্বকের যত্ন', 21, 5, 'skin-care-odgx'),
(91, 'Shoes', 'জুতা', 19, 2, 'shoes-odky'),
(93, 'SPORTS', ' খেলাধুলা', 23, 6, 'sports-otux'),
(94, 'Mobiles', ' মোবাইল', 26, NULL, 'mobiles-nzmy'),
(95, 'EXERCIZE FITNESS', 'ফিটনেস এক্সারজাইজ করুন', 23, 7, 'exercize-fitness-otg1'),
(96, 'Clothing', 'পোশাক', 27, NULL, 'clothing-mtiy'),
(97, 'FOOD ESSENTIALS', ' খাদ্য প্রয়োজনীয়তা', 23, 8, 'food-essentials-ntew'),
(98, 'HEALTH & NUTRITION', ' স্বাস্থ্য ও পুষ্টি', 23, 9, 'health--nutrition-mzk4'),
(99, 'BOOKS', ' বই', 23, 10, 'books-ndg2'),
(100, 'STATIONERY', ' স্টেশনারি', 23, 11, 'stationery-mtqw'),
(101, 'AUTO ACCESSORIES', ' অটো অ্যাকসেসরিজ', 23, 12, 'auto-accessories-otu2'),
(102, 'INDUSTRIAL & SCIENTIFIC TOOLS', ' শিল্প ও বৈজ্ঞানিক সরঞ্জাম', 23, 13, 'industrial--scientific-tools-ntez'),
(103, 'MEDICAL SUPLIES', ' চিকিৎসা সরঞ্জাম', 23, 14, 'medical-suplies-ntex'),
(104, 'Muslim Wear', 'মুসলিম পরিধান', 27, NULL, 'muslim-wear-otk5'),
(105, 'GAMING', ' গেমিং', 23, 15, 'gaming-ntyx'),
(106, 'Kids Clothing', 'বাচ্চাদের পোশাক', 28, 1, 'kids-clothing-nta4'),
(107, 'GROCERY ( ONLY IN SELECT CITIES)', 'গ্রোসারি (শুধুমাত্র সিলেক্ট সিটিতে)', 23, 16, 'grocery--only-in-select-cities-mzi1'),
(108, 'Boys\' Clothing', ' ছেলেদের পোশাক', 28, 2, 'boys-clothing-nte4'),
(109, 'Shoe Care and Accessories', 'জুতা যত্ন এবং আনুষাঙ্গিক', 27, NULL, 'shoe-care-and-accessories-njyy'),
(110, 'Bags', 'ব্যাগ', 27, NULL, 'bags-mjg4'),
(111, 'Girls\'Clothing', ' মেয়েদের পোশাক', 28, 3, 'girlsclothing-ntm0'),
(112, 'Baby Boy\'s Clothing', 'বাচ্চা ছেলের পোশাক', 28, 4, 'baby-boys-clothing-ndq4'),
(113, 'Mobile Accessories', 'মোবাইল আনুষাঙ্গিক', 26, NULL, 'mobile-accessories-njkw'),
(114, 'Baby Girls\'Clothing', 'বাচ্চা মেয়েদের পোশাক', 28, 5, 'baby-girlsclothing-nzaw'),
(115, 'kids\' Footwear', 'বাচ্চাদের পাদুকা', 28, 6, 'kids-footwear-otuz'),
(116, 'Boys\' Footwear', 'ছেলেদের পাদুকা', 28, 7, 'boys-footwear-ndc3'),
(117, 'Hair Care', 'চুলের যত্ন', 21, NULL, 'hair-care-njg1'),
(118, 'Accessories', 'আনুষাঙ্গিক', 27, NULL, 'accessories-mtm1'),
(119, 'Smart Wearable Tech', 'স্মার্ট পরিধানযোগ্য প্রযুক্তি', 26, NULL, 'smart-wearable-tech-nti3'),
(120, 'Infant Shoes', ' শিশু জুতা', 28, 8, 'infant-shoes-njgw'),
(121, 'Girls Shoes', 'মেয়েদের জুতা', 28, 9, 'girls-shoes-njgw'),
(122, 'Shoes', 'জুতা', 27, NULL, 'shoes-otc3'),
(123, 'Health Care Appliances', 'স্বাস্থ্যসেবা সরঞ্জাম', 26, NULL, 'health-care-appliances-nti4'),
(124, 'Watches', 'ঘড়ি', 27, NULL, 'watches-nda1'),
(125, 'Character Shoes ', 'চরিত্রের জুতা', 28, 10, 'character-shoes--ndgy'),
(126, 'Laptop', 'ল্যাপটপ', 26, NULL, 'laptop-nzy2'),
(127, 'Footwear', 'পাদুকা', 27, NULL, 'footwear-otm1'),
(128, 'Desktop PCs', ' ডেস্কটপ পিসি', 26, NULL, 'desktop-pcs-odc2'),
(129, 'Gaming & Accessories', 'গেমিং এবং আনুষাঙ্গিক', 26, NULL, 'gaming--accessories-njc1'),
(130, 'Men\'s Grooming', 'পুরুষদের সাজগোজ', 27, NULL, 'mens-grooming-mjey'),
(131, 'Computer Accessories', 'কম্পিউটারের যন্ত্রপাতি', 26, NULL, 'computer-accessories-odq5'),
(132, 'Top wear', 'শীর্ষ পরিধান', 27, NULL, 'top-wear-njgz'),
(133, 'Computer Peripherals', 'কম্পিউটার যন্ত্রানুষঙ্গ', 26, NULL, 'computer-peripherals-njuw'),
(134, 'Bottom wear', 'নিচের পরিধান', 27, NULL, 'bottom-wear-mjkx'),
(135, 'Tablets', ' ট্যাবলেট', 26, NULL, 'tablets-mza1'),
(136, 'Suits,Blazers and Waistcoats', 'স্যুট, ব্লেজার এবং কোমরকোট', 27, NULL, 'suitsblazers-and-waistcoats-mzc0'),
(137, 'Speakers', 'বক্তারা', 26, NULL, 'speakers-mtk3'),
(138, 'Ties,Socks,Caps and more', 'টাই, মোজা, ক্যাপ এবং আরও অনেক কিছু', 27, NULL, 'tiessockscaps-and-more-odex'),
(139, 'Fabrics', 'কাপড়', 27, NULL, 'fabrics-ntu5'),
(140, 'Winter Wear', 'শীতের পোশাক', 27, NULL, 'winter-wear-njq5'),
(141, 'Ethinic wear', 'এথিনিক পরিধান', 27, NULL, 'ethinic-wear-ote2'),
(142, 'Smart Home Automation', 'স্মার্ট হোম অটোমেশন', 26, NULL, 'smart-home-automation-njgx'),
(143, 'Camera', 'ক্যামেরা', 26, NULL, 'camera-mzix'),
(144, 'innerwear and Loungewear', 'অভ্যন্তরীণ পোশাক এবং লাউঞ্জওয়্যার', 27, NULL, 'innerwear-and-loungewear-mtc2'),
(145, 'Raincoats and Windcheaters Watches', 'রেইনকোট এবং উইন্ডচিটার ঘড়ি', 27, NULL, 'raincoats-and-windcheaters-watches-odyy'),
(146, ' Camera Accessories', ' ক্যামেরা আনুষাঙ্গিক', 26, NULL, '-camera-accessories-ndqx'),
(147, 'Nerwork Components', 'Nerwork উপাদান', 26, NULL, 'nerwork-components-otez'),
(148, 'Featured', 'বৈশিষ্ট্যযুক্ত', 26, NULL, 'featured-mja4'),
(149, 'Bags & Wallets', 'ব্যাগ ও মানিব্যাগ', 19, NULL, 'bags--wallets-ndcy'),
(150, 'Jewellery', 'জহরত', 19, NULL, 'jewellery-odew'),
(151, 'Watches', 'ঘড়ি', 19, NULL, 'watches-nty0'),
(152, 'Sports and Fitness Store', 'ক্রীড়া এবং ফিটনেস স্টোর', 27, NULL, 'sports-and-fitness-store-mjg4'),
(153, 'Ethnic Wear', 'জাতিগত পরিধান', 19, NULL, 'ethnic-wear-mti1'),
(154, 'kids\' Watches', 'বাচ্চাদের ঘড়ি', 28, 11, 'kids-watches-mtgx'),
(155, 'Smart Watches', 'স্মার্ট ঘড়ি', 27, NULL, 'smart-watches-njc3'),
(156, 'Ethnic Bottoms', 'জাতিগত নীচে', 19, NULL, 'ethnic-bottoms-mzyz'),
(157, 'Featured', 'বৈশিষ্ট্যযুক্ত', 19, NULL, 'featured-mza3'),
(158, 'Personal Care', 'ব্যক্তিগত যত্ন', 27, NULL, 'personal-care-otex'),
(159, 'Beauty & Grooming', 'সৌন্দর্য ও সাজগোজ', 19, NULL, 'beauty--grooming-otuz'),
(160, 'kids\' Winter Wear', 'বাচ্চাদের শীতের পোশাক', 28, 12, 'kids-winter-wear-mtmz'),
(161, 'Appliances', 'যন্ত্রপাতি', 27, NULL, 'appliances-mzc3'),
(162, 'Girls\' Winter Wear', 'মেয়েদের শীতের পোশাক', 28, 13, 'girls-winter-wear-ode0'),
(163, 'Toys', 'খেলনা', 28, 14, 'toys-nzy5'),
(164, 'Featurered', 'বৈশিষ্ট্যযুক্ত', 27, NULL, 'featurered-mtmw'),
(165, 'School Supplies', 'স্কুল সরবরাহ', 28, 15, 'school-supplies-mza5'),
(166, 'Baby Care', 'শিশুর যত্ন', 28, 16, 'baby-care-mtk2'),
(167, 'Accessories', 'আনুষাঙ্গিক', 19, NULL, 'accessories-nzm2'),
(168, 'Lingerie & Sleepers', 'অন্তর্বাস ও স্লিপার্স', 19, NULL, 'lingerie--sleepers-mjiw'),
(169, 'Featured Brands', 'বৈশিষ্ট্যযুক্ত ব্র্যান্ড', 28, 17, 'featured-brands-nje4'),
(170, 'Babies & Toddlers', 'বাচ্চা এবং বাচ্চারা', 28, 18, 'babies--toddlers-mze4'),
(171, 'Musical Instrument', ' বাদ্র্যযন্ত্র', 23, 17, 'musical-instrument-oty5'),
(172, 'Top Brands Tv', 'শীর্ষ ব্র্যান্ড টিভি', 26, NULL, 'top-brands-tv-njm0'),
(173, 'Washing Machine', 'ধৌতকারী যন্ত্র', 26, NULL, 'washing-machine-ntc3'),
(174, 'Air Conditioners', 'বাতাস নিয়ন্ত্রণ যন্ত্র', 26, NULL, 'air-conditioners-ndq1'),
(175, 'Refrigerators', 'রেফ্রিজারেটর', 26, NULL, 'refrigerators-mje3'),
(176, 'Kitchen, Cookware & Serveware', 'রান্নাঘর, রান্নার সরঞ্জাম এবং পরিবেশন সামগ্রী', 29, NULL, 'kitchen-cookware--serveware-mzgx'),
(177, 'Kitchen Appliances', ' রান্নাঘর যন্ত্রপাতি', 26, NULL, 'kitchen-appliances-ndi4'),
(178, 'Tableware & Dinnerware', 'টেবিলওয়্যার এবং ডিনারওয়্যার', 29, NULL, 'tableware--dinnerware-odyx'),
(179, 'Kitchen Storage', ' রান্নাঘর সংগ্রহস্থল', 29, NULL, 'kitchen-storage-mtu1'),
(180, 'Cleaning Supplies', 'পরিস্কার সরবরাহ', 29, NULL, 'cleaning-supplies-ndu3'),
(181, 'Furniture Top Offers', 'আসবাবপত্র শীর্ষ অফার', 29, NULL, 'furniture-top-offers-mjg3'),
(182, 'Bed Room Furniture', 'শোবার ঘরের আসবাবপত্র', 29, NULL, 'bed-room-furniture-nji1'),
(183, 'Living Room Furniture', ' লিভিং রুম আসবাবপত্র', 29, NULL, 'living-room-furniture-mjgw'),
(184, 'Office & Study Furniture', ' অফিস ও স্টাডি ফার্নিচার', 29, NULL, 'office--study-furniture-ody2'),
(185, 'DIY  Furniture', ' DIY আসবাবপত্র', 29, NULL, 'diy--furniture-oty2'),
(186, 'Furnishing', ' সাজসজ্জা', 29, NULL, 'furnishing-mty3'),
(187, 'Smart Home Automation', ' স্মার্ট হোম অটোমেশন', 29, NULL, 'smart-home-automation-nji2'),
(188, 'Home  Improvement', ' হোম উন্নতি', 29, NULL, 'home--improvement-mtu2'),
(189, 'Healthy Living Appliances', 'স্বাস্থ্যকর জীবন্ত যন্ত্রপাতি', 26, NULL, 'healthy-living-appliances-ndg4'),
(190, 'Home Decor', ' ঘর সজ্জা', 29, NULL, 'home-decor-njy5'),
(191, 'Small Home Appliances', ' ছোট গৃহস্থালী যন্ত্রপাতি', 26, NULL, 'small-home-appliances-njkw'),
(192, 'Home Lighting', ' বাড়ির আলো', 29, NULL, 'home-lighting-mzu3'),
(193, 'Festive Decor & Gifts pets supplies', ' উৎসব সজ্জা এবং উপহার পোষা প্রাণী সরবরাহ', 29, NULL, 'festive-decor--gifts-pets-supplies-ndk3'),
(194, 'Durability Certified Furniture', 'স্থায়িত্ব প্রত্যয়িত আসবাবপত্র', 29, NULL, 'durability-certified-furniture-otk1'),
(195, 'Featured', ' বৈশিষ্ট্যযুক্ত', 29, NULL, 'featured-oti1'),
(196, 'Christmas Store', ' বড়দিনের দোকান', 29, NULL, 'christmas-store-njg3'),
(197, 'Top Brands', ' শীর্ষ ব্র্যান্ড', 26, NULL, 'top-brands-otyz'),
(198, 'Perfect Home Store', ' পারফেক্ট হোম স্টোর', 29, NULL, 'perfect-home-store-nzgy'),
(199, 'Buying Guides', 'গাইড কেনা', 26, NULL, 'buying-guides-mjkz'),
(200, 'New Launches', ' নতুন লঞ্চ', 26, NULL, 'new-launches-nzq5'),
(203, 'Girls', 'মেয়েরা', 28, NULL, 'girls-mtyx'),
(204, 'Boys', 'ছেলেরা', 28, NULL, 'boys-nzu0'),
(205, 'Boys\' Winter Wear', 'ছেলেদের শীতের পোশাক', 28, NULL, 'boys-winter-wear-mza4');

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
(255, 'Bath Olis', 'স্নান তেল', 21, 87, 'bath-olis-nti2', NULL),
(256, 'Bath Salts', 'স্নান লবণ', 21, 87, 'bath-salts-ntq2', NULL),
(257, 'Western Dresses', ' পশ্চিমা পোশাক', 19, 81, 'western-dresses-nju2', NULL),
(258, 'Dresses', ' পোশাকগুলো', 19, 81, 'dresses-ndm4', NULL),
(259, 'body bars', 'শরীরের বার', 21, 87, 'body-bars-oti1', NULL),
(260, 'body scrub', 'শরীরের মাজা', 21, 87, 'body-scrub-odi5', NULL),
(261, 'body wash', 'শরীর পরিষ্কার করা', 21, 87, 'body-wash-mtk1', NULL),
(262, 'Mi', ' এমআই', 26, 94, 'mi-ntc1', NULL),
(263, 'enhancement &treatments', 'বর্ধন এবং চিকিত্সা', 21, 87, 'enhancement-treatments-ndy0', NULL),
(264, 'Realme', ' রিয়েলমি', 26, 94, 'realme-odaw', NULL),
(265, 'face wash', 'মুখমন্ডল পরিষ্কারক', 21, 87, 'face-wash-mja1', NULL),
(266, 'Samsung', ' স্যামসাং', 26, 94, 'samsung-ndg5', NULL),
(267, 'fragrances', 'সুগন্ধি', 21, 87, 'fragrances-njk0', NULL),
(268, 'Infinix', ' ইনফিনিক্স', 26, 94, 'infinix-ode1', NULL),
(269, 'masks', 'মুখোশ', 21, 87, 'masks-mzm2', NULL),
(270, 'OPPO', 'Oppo', 26, 94, 'oppo-ndez', NULL),
(271, 'Apple', 'আপেল', 26, 94, 'apple-otq0', NULL),
(272, 'moisturizers', 'ময়েশ্চারাইজার', 21, 87, 'moisturizers-otey', NULL),
(273, 'Vivo', 'ভিভো', 26, 94, 'vivo-ntgw', NULL),
(274, 'personal care', 'ব্যক্তিগত যত্ন', 21, 87, 'personal-care-mze5', NULL),
(275, 'Honor', 'Honor', 26, 94, 'honor-nzg5', NULL),
(276, 'telcom powder', 'সুগন্ধিত পাউডার', 21, 87, 'telcom-powder-mty3', NULL),
(277, 'Asus', 'আসুস', 26, 94, 'asus-nzyy', NULL),
(278, 'Poco X2', 'পোকো এক্স 2', 26, 94, 'poco-x2-ntuw', NULL),
(279, 'Toner & Cleanser', 'টোনার এবং ক্লিনজার', 21, 87, 'toner--cleanser-oty2', NULL),
(280, 'Realme Narzo 10', 'Realme Narzo 10', 26, 94, 'realme-narzo-10-oty4', NULL),
(281, 'Infinix Hot 9', 'Infinix Hot 9', 26, 94, 'infinix-hot-9-mjmx', NULL),
(282, 'Iqoo 3', 'Iqoo 3', 26, 94, 'iqoo-3-mjy4', NULL),
(283, 'iphone se', 'iphone se', 26, 94, 'iphone-se-mja2', NULL),
(284, 'Tools', 'সরঞ্জাম', 21, 87, 'tools-otcx', NULL),
(285, 'Motorola razr', 'মটোরোলা রেজার', 26, 94, 'motorola-razr-mtcz', NULL),
(286, 'Anti-aging', 'বিরোধী পক্বতা', 21, 90, 'anti-aging-odg5', NULL),
(287, 'CRICKET', ' ক্রিকেট', 23, 93, 'cricket-ndc1', 1),
(288, 'Realme Narzo 10A', 'Realme Narzo 10A', 26, 94, 'realme-narzo-10a-mzuz', NULL),
(289, 'Others', 'অন্যান্য', 21, 90, 'others-mtq0', NULL),
(290, 'BADMINTON', ' ব্যাডমিনটন', 23, 93, 'badminton-odc3', 2),
(291, 'Motorola g8 Power lite', 'Motorola g8 Power lite', 26, 94, 'motorola-g8-power-lite-mjix', NULL),
(292, 'serum &Treatment', 'সিরাম এবং চিকিত্সা', 21, 90, 'serum-treatment-mjy5', NULL),
(293, 'CYCLING', ' সাইক্লিং', 23, 93, 'cycling-mzi1', 3),
(294, 'FOOTBALL', ' ফুটবল', 23, 93, 'football-otc1', 4),
(295, 'Suncare', 'সানকেয়ার', 21, 90, 'suncare-mtu3', NULL),
(296, 'SKATING', ' স্কেটিং', 23, 93, 'skating-mjm5', 5),
(297, 'Uneven skintone', 'অসম স্কিনটোন', 21, 90, 'uneven-skintone-mjgz', NULL),
(298, 'CAMPING & HIKING', ' ক্যাম্পিং ও হাইকিং', 23, 93, 'camping--hiking-nzc0', 6),
(299, 'Mobile Cases', ' মোবাইল কেস', 26, 113, 'mobile-cases-mzc3', NULL),
(300, 'SWIMMING', ' সাঁতার কাটা', 23, 93, 'swimming-mzq4', 7),
(301, 'Whitening & Brightening', 'ঝকঝকে এবং উজ্জ্বল করা', 21, 90, 'whitening--brightening-nte1', NULL),
(302, 'Headphones & Headsets', 'হেডফোন এবং হেডসেট', 26, 113, 'headphones--headsets-mzyy', NULL),
(303, 'hair', 'চুল', 21, 89, 'hair-oduz', NULL),
(304, 'Power Bank', 'পাওয়ার ব্যাংক', 26, 113, 'power-bank-ntm5', NULL),
(305, 'Screenguards', 'স্ক্রিনগার্ড', 26, 113, 'screenguards-mjgx', NULL),
(306, 'Memory Cards', 'মেমরি কার্ড', 26, 113, 'memory-cards-nzyw', NULL),
(307, 'Shaving', 'শেভ করা', 21, 89, 'shaving-nzkx', NULL),
(308, 'CARDIO EQUIPMENT', 'কার্ডিও সরঞ্জাম', 23, 95, 'cardio-equipment-nju4', 1),
(309, 'Smart Headphones', ' স্মার্ট হেডফোন', 26, 113, 'smart-headphones-nta4', NULL),
(310, 'Skin care', 'ত্বকের যত্ন', 21, 89, 'skin-care-mtm1', NULL),
(311, 'Mobile Cables', 'মোবাইল ক্যাবল', 26, 113, 'mobile-cables-mtg4', NULL),
(312, 'HOME GYMS', ' হোম জিমস', 23, 95, 'home-gyms-mjc4', 2),
(313, 'Mobile Chargers', 'মোবাইল চার্জার', 26, 113, 'mobile-chargers-njaw', NULL),
(314, 'SUPPORT', ' সাপোর্ট', 23, 95, 'support-otyw', 3),
(315, 'Mobile Holders', 'মোবাইল হোল্ডার', 26, 113, 'mobile-holders-ndgy', NULL),
(316, 'Brushes', 'ব্রাশ', 21, 117, 'brushes-mtk0', NULL),
(317, 'DUMBBELLS', ' ডাম্বেলস', 23, 95, 'dumbbells-mji2', 4),
(318, 'Shampoos & Conditioners', 'শ্যাম্পু ও কন্ডিশনার', 21, 117, 'shampoos--conditioners-odiw', NULL),
(319, 'Smart Watches', 'স্মার্ট ঘড়ি', 26, 119, 'smart-watches-njiz', NULL),
(320, 'AB EXERCISERS', ' এবি এক্সারসার্স', 23, 95, 'ab-exercisers-ndc5', 5),
(321, 'Styling', 'স্টাইলিং', 21, 117, 'styling-mtu5', NULL),
(322, 'Smart Glasses', 'স্মার্ট চশমা', 26, 119, 'smart-glasses-njgx', NULL),
(323, 'Smart Bands', ' স্মার্ট ব্যান্ড', 26, 119, 'smart-bands-oti4', NULL),
(324, 'SHAKERS & SIPPERS', ' ঝাঁকুনি ও চুমুক', 23, 95, 'shakers--sippers-mzyz', 6),
(325, 'Treatment', 'চিকিৎসা', 21, 117, 'treatment-mzq5', NULL),
(326, 'Makeup', 'মেকআপ', 21, 117, 'makeup-ndkw', NULL),
(327, 'YOGA MAT', ' যোগব্যায়াম মাদুর', 23, 95, 'yoga-mat-njgy', 7),
(328, 'Bp Monitors', ' বিপি মনিটর', 26, 123, 'bp-monitors-nde1', NULL),
(329, 'Applicators', 'আবেদনকারীরা', 21, 117, 'applicators-njgw', NULL),
(330, 'Body', 'শরীর', 21, 117, 'body-nju1', NULL),
(331, 'Weighing Scale', ' ওজন স্কেল', 26, 123, 'weighing-scale-nze4', NULL),
(332, 'GYM GLOVES', 'GYM GLOVES', 23, 95, 'gym-gloves-ntcx', 8),
(333, 'Eyes', 'চোখ', 21, 117, 'eyes-otu2', NULL),
(334, 'T-Shirts', 'টি-শার্ট', 28, 108, 't-shirts-mzax', 1),
(335, 'Faces', 'মুখ', 21, 117, 'faces-nzu3', NULL),
(336, 'NUTS & DRY FRUITS', 'NUTS & DRY FRUITS', 23, 97, 'nuts--dry-fruits-mty2', 9),
(337, 'Lips', 'ঠোঁট', 21, 117, 'lips-nta0', NULL),
(338, 'Gaming Laptop', ' গেমিং ল্যাপটপ', 26, 126, 'gaming-laptop-nzc1', NULL),
(339, 'Nails', 'নখ', 21, 117, 'nails-njiw', NULL),
(340, 'Ethnic Wear', 'জাতিগত পরিধান', 28, 108, 'ethnic-wear-odq3', NULL),
(341, 'TEA,COFFEE & BEVERAGES', ' চা, কফি এবং পানীয়', 23, 97, 'teacoffee--beverages-ode3', NULL),
(342, 'Set & Plette', 'সেট এবং প্যালেট', 21, 117, 'set--plette-ndkz', NULL),
(343, 'Shorts', 'হাফপ্যান্ট', 28, 108, 'shorts-nti2', NULL),
(344, 'CHOCOLATES', ' চকলেট', 23, 97, 'chocolates-ote3', NULL),
(345, 'SNACKS CORNER', ' স্ন্যাকস কর্নার', 23, 97, 'snacks-corner-nzk0', NULL),
(346, 'Shirts', 'শার্ট', 28, 108, 'shirts-mtiz', NULL),
(347, 'GIFTING COMBOS', ' উপহার কম্বোস', 23, 97, 'gifting-combos-nda5', NULL),
(348, 'Innerwear', 'অভ্যন্তরীণ পোশাক', 28, 108, 'innerwear-mtq5', NULL),
(349, 'External Hard Disks', ' বাহ্যিক হার্ড ডিস্ক', 26, 131, 'external-hard-disks-njk1', NULL),
(350, 'Wear', 'পরেন', 19, 81, 'wear-mjm1', NULL),
(351, 'SWEETS STORE', ' মিষ্টির দোকান', 23, 97, 'sweets-store-ndg4', NULL),
(352, 'Pandrives', ' প্যান্ড্রাইভ', 26, 131, 'pandrives-otqw', NULL),
(353, 'Topwear', 'টপওয়্যার', 19, 81, 'topwear-nzc4', NULL),
(354, 'Dresses & Skirts', 'পোশাক এবং স্কার্ট', 28, 111, 'dresses--skirts-nty1', NULL),
(355, 'Laptop Skins & Decals', 'ল্যাপটপ স্কিনস এবং ডিকালস', 26, 131, 'laptop-skins--decals-mzyz', NULL),
(356, 'JAMS,SPREADS AND HONEY', ' জ্যামস, স্প্রেডস এবং হনি', 23, 97, 'jamsspreads-and-honey-ntcw', NULL),
(357, 'Laptop Bags', ' ল্যাপটপ ব্যাগ', 26, 131, 'laptop-bags-ndy3', NULL),
(358, 'Jeans', 'জিন্স', 19, 81, 'jeans-ntgy', NULL),
(359, 'Ethnic Wear', 'জাতিগত পরিধান', 28, 111, 'ethnic-wear-mta4', NULL),
(360, 'Mouse', 'মাউস', 26, 131, 'mouse-ntmz', NULL),
(361, 'BREAKFAST ITEMS', ' ব্রেকফাস্ট আইটেম', 23, 97, 'breakfast-items-ntg5', NULL),
(362, 'T-shirts& Tops', 'টি-শার্ট ও টপস', 28, 111, 't-shirts-tops-mtaw', NULL),
(363, 'ALL SUPPLEMENTS', ' সমস্ত সাপ্লিমেন্ট', 23, 98, 'all-supplements-otc3', NULL),
(364, 'Shorts', 'হাফপ্যান্ট', 19, 81, 'shorts-odm3', NULL),
(365, 'PROTEIN SUPPLEMENTS', ' প্রোটিন সাপ্লিমেন্টস', 23, 98, 'protein-supplements-odiz', NULL),
(366, 'Skirts', 'স্কার্ট', 19, 81, 'skirts-odc3', NULL),
(367, 'Innerwear', 'টি-শার্ট ও টপস', 28, 111, 'innerwear-nja5', NULL),
(368, 'VITAMIN SUPPLEMENTS', ' ভিটামিন সাপ্লিমেন্টস', 23, 98, 'vitamin-supplements-njgz', NULL),
(369, 'Printers & Ink Cartridges', 'প্রিন্টার এবং কালি কার্তুজ', 26, 133, 'printers--ink-cartridges-mzaw', NULL),
(370, 'Jeggings & Tights', 'জেগিংস এবং আঁটসাঁট পোশাক', 19, 81, 'jeggings--tights-ndq0', NULL),
(371, 'Monitors', ' মনিটর', 26, 133, 'monitors-ndu0', NULL),
(372, 'Combos Sets', 'কম্বোস সেট', 28, 112, 'combos-sets-nji4', NULL),
(373, 'HEALTH DRINKS', ' স্বাস্থ্য পানীয়', 23, 98, 'health-drinks-mjcx', NULL),
(374, 'Trousers & Capris', 'ট্রাউজার্স এবং ক্যাপ্রিস', 19, 81, 'trousers--capris-ote2', NULL),
(375, 'T-shirts', 'টি-শার্ট', 28, 112, 't-shirts-mzgy', NULL),
(376, 'AYURVEDIC SUPPLEMENTS', ' আয়ুর্বেদিক সাপ্লিমেন্টস', 23, 98, 'ayurvedic-supplements-mzuy', NULL),
(377, 'Apple iPads', 'অ্যাপল আইপ্যাড', 26, 135, 'apple-ipads-nje1', NULL),
(378, 'Innerwear', 'অভ্যন্তরীণ পোশাক', 28, 112, 'innerwear-mzyx', NULL),
(379, 'Televisions', ' টেলিভিশন', 26, 135, 'televisions-mjyw', NULL),
(380, 'ENTRANCE EXAMS', ' প্রবেশিকা পরীক্ষা', 23, 99, 'entrance-exams-odg5', NULL),
(381, 'Jump Suits', 'জাম্প স্যুট', 19, 81, 'jump-suits-otg3', NULL),
(382, 'Combos Sets', 'কম্বোস সেট', 28, 114, 'combos-sets-mzuz', NULL),
(383, 'ACADEMICS', ' একাডেমিকস', 23, 99, 'academics-otky', NULL),
(384, 'Jackets', 'জ্যাকেট', 19, 81, 'jackets-mjc5', NULL),
(385, 'Home Audio Speakers', 'হোম অডিও স্পিকার', 26, 137, 'home-audio-speakers-njm1', NULL),
(386, 'LITERATURE & FICTION', ' লিটারেচার এবং ফিকশন', 23, 99, 'literature--fiction-mtk5', NULL),
(387, 'Home Theatres', 'হোম থিয়েটার', 26, 137, 'home-theatres-nzm4', NULL),
(388, 'Dresses & Gowns', 'পোশাক এবং গাউন', 28, 114, 'dresses--gowns-ndm0', NULL),
(389, 'Tees & Shirts', 'টিজ এবং শার্ট', 19, 81, 'tees--shirts-odc2', NULL),
(390, 'NON FICTION', ' প্রকৃত তথ্যভিত্তিক সাহিত্য', 23, 99, 'non-fiction-nte4', NULL),
(391, 'Soundbars', ' সাউন্ডবার', 26, 137, 'soundbars-mzm5', NULL),
(392, 'Innerwear', 'অভ্যন্তরীণ পোশাক', 28, 114, 'innerwear-odex', NULL),
(393, 'YOUNG READERS', ' তরুণ পাঠক', 23, 99, 'young-readers-njyy', NULL),
(394, 'Bluetooth Speakers', ' ব্লুটুথ স্পিকার', 26, 137, 'bluetooth-speakers-odg3', NULL),
(395, 'swimwear', 'সাঁতারের পোশাক', 19, 81, 'swimwear-mtu2', NULL),
(396, 'SELF HELP', ' স্বয়ং সাহায্য', 23, 99, 'self-help-nzix', NULL),
(397, 'DTH Set Top Box', 'ডিটিএইচ সেট টপ বক্স', 26, 137, 'dth-set-top-box-ndmz', NULL),
(398, 'laggings', 'লেগিংস', 19, 81, 'laggings-nzm4', NULL),
(399, 'Sandais', 'সান্দাইস', 28, 116, 'sandais-ndmw', NULL),
(400, 'E-LEARNING', ' ই-লার্নিং', 23, 99, 'e-learning-otu0', NULL),
(401, 'Google Nest', ' গুগল নেস্ট', 26, 142, 'google-nest-nzc5', NULL),
(402, 'PREORDERS', ' অগ্রদূত', 23, 99, 'preorders-nzi5', NULL),
(403, 'Sandals & Slippers', 'স্যান্ডেল এবং চপ্পল', 19, 91, 'sandals--slippers-njq0', NULL),
(404, 'Sport Shoes', 'খেলার জুতা', 28, 116, 'sport-shoes-ntk1', NULL),
(405, 'PENS', ' কলম', 23, 100, 'pens-ndc1', NULL),
(406, 'Flats', 'ফ্ল্যাট', 19, 91, 'flats-mtqw', NULL),
(407, 'DSLR & Mirrorless', 'ডিএসএলআর এবং আয়নাহীন', 26, 143, 'dslr--mirrorless-ntq4', NULL),
(408, 'DIARIES', ' ডায়রিজ', 23, 100, 'diaries-ndi5', NULL),
(409, 'Flats & Bellies', 'ফ্ল্যাট ও বেলি', 28, 121, 'flats--bellies-otm5', NULL),
(410, 'Heels', 'হিল', 19, 91, 'heels-ndgw', NULL),
(411, 'Compact & Bridge Cameras', 'কম্প্যাক্ট এবং ব্রিজ ক্যামেরা', 26, 143, 'compact--bridge-cameras-ndk4', NULL),
(412, 'CARD HOLDERS', ' কার্ড হোল্ডার', 23, 100, 'card-holders-mtmy', NULL),
(413, 'Boots', 'বুট', 19, 91, 'boots-otex', NULL),
(414, 'Sport Shoes', 'খেলার জুতা', 28, 121, 'sport-shoes-mtux', NULL),
(415, 'Sports & Action', 'খেলাধুলা ও কর্ম', 26, 143, 'sports--action-mzq2', NULL),
(416, 'DESK ORGANIZERS', ' ডেস্ক অর্গানাইজার', 23, 100, 'desk-organizers-mzi5', NULL),
(417, 'Sports Shoes', 'ক্রীড়া জুতা', 19, 91, 'sports-shoes-nte2', NULL),
(418, 'CALCULATORS', ' ক্যালকুলেটর', 23, 100, 'calculators-ndy1', NULL),
(420, 'Casual Shoes', 'নৈমিত্তিক জুতা', 19, 91, 'casual-shoes-mze5', NULL),
(421, 'KEY CHAINS', ' কী চেইন', 23, 100, 'key-chains-mje0', NULL),
(422, 'Lens', ' লেন্স', 26, 146, 'lens-mtqz', NULL),
(423, 'Tripods', 'ট্রাইপড', 26, 146, 'tripods-nja3', NULL),
(424, 'HELMETS & RIDING GEARS', 'হেলমেটস এবং রাইডিং গিয়ার্স', 23, 101, 'helmets--riding-gears-ota3', NULL),
(425, 'Routers', ' রাউটার', 26, 147, 'routers-nta2', NULL),
(426, 'CAR AUDIO/ VIDEO', ' কার অডিও/ ভিডিও', 23, 101, 'car-audio-video-nzc4', NULL),
(427, 'Google Assistant Store', 'গুগল অ্যাসিস্ট্যান্ট স্টোর', 26, 148, 'google-assistant-store-otc4', NULL),
(428, 'CAR MOBILE ACCESSORIES', 'কার মোবাইল অ্যাকসেসরিজ', 23, 101, 'car-mobile-accessories-njg3', NULL),
(429, 'CAR & BIKE CARE', ' গাড়ী এবং বাইক কেয়ার', 23, 101, 'car--bike-care-odcw', NULL),
(430, 'Laptop on Buyback Guarantee', 'বাইব্যাক গ্যারান্টিতে ল্যাপটপ', 26, 148, 'laptop-on-buyback-guarantee-njyx', NULL),
(431, 'Flipkart smartBuy', 'ফ্লিপকার্ট স্মার্ট বাই', 26, 148, 'flipkart-smartbuy-mjez', NULL),
(432, 'VEHICAL LUBRICANTS', ' যানবাহন লুব্রিকেন্টস', 23, 101, 'vehical-lubricants-ndez', NULL),
(433, 'Li-Polymer Power Banks', ' লি-পলিমার পাওয়ার ব্যাংক', 26, 148, 'li-polymer-power-banks-mjyw', NULL),
(434, 'Sony Ps4 Pro & slim', ' সনি পিএস 4 প্রো এবং স্লিম', 26, 148, 'sony-ps4-pro--slim-nzmx', NULL),
(435, 'INDUSTRIAL MEASUREMENT DEVICES', ' শিল্প পরিমাপ ডিভাইস', 23, 102, 'industrial-measurement-devices-nti4', NULL),
(436, 'Apple Products', 'আপেল পণ্য', 26, 148, 'apple-products-mzq4', NULL),
(437, 'Microsoft Store', ' মাইক্রোসফট স্টোর', 26, 148, 'microsoft-store-ntu1', NULL),
(438, 'INDUSTRIAL TESTING DEVICES', 'ইন্ডাস্ট্রিয়াল টেস্টিং ডিভাইস', 23, 102, 'industrial-testing-devices-mju5', NULL),
(439, 'Lenovo Phab Series', ' লেনোভো ফ্যাব সিরিজ', 26, 148, 'lenovo-phab-series-mzi1', NULL),
(440, 'JBL Speakers', ' জেবিএল স্পিকার', 26, 148, 'jbl-speakers-njy3', NULL),
(441, 'LAB & SCIENTIFIC PRODUCTS', ' ল্যাব এবং বৈজ্ঞানিক পণ্য', 23, 102, 'lab--scientific-products-mjm1', NULL),
(442, 'Smartphones On Buyback Guarantee', 'বাইব্যাক গ্যারান্টিতে স্মার্টফোন', 26, 148, 'smartphones-on-buyback-guarantee-nzmx', NULL),
(443, 'PACKAGING & SHIPPING PRODUCTS', ' প্যাকেজিং এবং শিপিং পণ্য', 23, 102, 'packaging--shipping-products-ntm5', NULL),
(444, 'Philips', ' ফিলিপস', 26, 148, 'philips-otqy', NULL),
(445, 'Dr. Morepen', 'Dr. Morepen', 26, 148, 'dr-morepen-nte2', NULL),
(446, 'Safety Products', ' নিরাপত্তা পণ্য', 23, 102, 'safety-products-mjgz', NULL),
(447, 'Complete Mobile Protection', ' সম্পূর্ণ মোবাইল সুরক্ষা', 26, 148, 'complete-mobile-protection-nja3', NULL),
(448, 'Mobiles No Cost EMI', 'মোবাইল নো কস্ট ইএমআই', 26, 148, 'mobiles-no-cost-emi-otiw', NULL),
(449, 'Watches Store', 'ঘড়ির দোকান', 27, 164, 'watches-store-mjuw', NULL),
(450, 'Huawei Watch Gt 2e Smart Watch', ' হুয়াওয়ে ওয়াচ জিটি 2 ই স্মার্ট ওয়াচ', 26, 148, 'huawei-watch-gt-2e-smart-watch-odc0', NULL),
(451, 'Footwear Club', 'পাদুকা ক্লাব', 27, 164, 'footwear-club-nte1', NULL),
(452, 'Pregnancy and Fertility', 'গর্ভাবস্থা এবং উর্বরতা', 23, 103, 'pregnancy-and-fertility-ntuw', NULL),
(453, 'Hot Water Bag', ' গরম পানির ব্যাগ', 23, 103, 'hot-water-bag-njq0', NULL),
(454, 'Bags and Wallet', 'ব্যাগ এবং মানিব্যাগ', 27, 164, 'bags-and-wallet-njc0', NULL),
(455, 'T-Shirt Store', 'টি-শার্টের দোকান', 27, 164, 't-shirt-store-nju2', NULL),
(456, 'Sling Bags', 'স্লিং ব্যাগ', 19, 149, 'sling-bags-ndg2', NULL),
(457, 'Hand Bags', 'হাত ব্যাগ', 19, 149, 'hand-bags-nte1', NULL),
(458, 'Adidas', 'অ্যাডিডাস', 27, 164, 'adidas-nja2', NULL),
(459, 'Beardo', 'বেয়ারডো', 27, 164, 'beardo-otm0', NULL),
(460, 'Wallets & Clutches', 'মানিব্যাগ এবং খপ্পর', 19, 149, 'wallets--clutches-nda0', NULL),
(461, 'Reebok', 'রিবক', 27, 164, 'reebok-ndy0', NULL),
(462, 'Backpacks', 'ব্যাকপ্যাক', 19, 149, 'backpacks-mzcw', NULL),
(463, 'Messenger Bag', 'মেসেঞ্জার ব্যাগ', 19, 149, 'messenger-bag-mta3', NULL),
(464, 'Mi', 'Mi', 26, 172, 'mi-nduz', NULL),
(465, 'Music', ' সঙ্গীত', 23, 171, 'music-otey', NULL),
(466, 'Vu', 'Vu', 26, 172, 'vu-ntk0', NULL),
(467, 'Thomson', ' থমসন', 26, 172, 'thomson-mjgy', NULL),
(468, 'Duffle Bag', 'মোটা খসখসে পশমের কাপড় ব্যাগ', 19, 149, 'duffle-bag-nzux', NULL),
(469, 'Skechers', 'Skechers', 27, 164, 'skechers-odgx', NULL),
(470, 'Samsung', ' স্যামসাং', 26, 172, 'samsung-ody1', NULL),
(471, 'Movies & TV Shows', ' সিনেমা ও টিভি শো', 23, 171, 'movies--tv-shows-mjez', NULL),
(472, 'Girls\' Sweatshirts', 'মেয়েদের সোয়েটশার্ট', 28, 162, 'girls-sweatshirts-nje4', NULL),
(473, 'Nike', 'নাইকি', 27, 164, 'nike-otgw', NULL),
(474, 'iFFOLCON by TCL', 'iFFOLCON by TCL', 26, 172, 'iffolcon-by-tcl-nzi1', NULL),
(475, 'Gaming Consoles', ' গেমিং কনসোল', 23, 105, 'gaming-consoles-nzy0', NULL),
(476, ' Finger Rings', 'আঙুলের রিং', 19, 150, '-finger-rings-nzcx', NULL),
(477, 'Girls\' Jackets', 'মেয়েদের জ্যাকেট', 28, 162, 'girls-jackets-nda1', NULL),
(478, 'Nokia', 'নকিয়া', 26, 172, 'nokia-oti1', NULL),
(479, 'Gaming Accessories', ' গেমিং আনুষাঙ্গিক', 23, 105, 'gaming-accessories-otu4', NULL),
(480, 'Earrings', 'কানের দুল', 19, 150, 'earrings-ndcx', NULL),
(481, 'LG', 'LG', 26, 172, 'lg-nzc1', NULL),
(482, 'Trimmers', 'ছাঁটা', 27, 161, 'trimmers-nda0', NULL),
(483, 'PS4 Games', ' PS4 গেমস', 23, 105, 'ps4-games-njky', NULL),
(484, 'Realme', ' রিয়েলমি', 26, 172, 'realme-mti3', NULL),
(485, 'Shavers', 'শেভার', 27, 161, 'shavers-nti2', NULL),
(486, 'Infant Winter Wear', 'শিশু শীতের পোশাক', 28, 162, 'infant-winter-wear-nty2', NULL),
(487, 'Jewellery Sets', 'গহনা সেট', 19, 150, 'jewellery-sets-nju1', NULL),
(488, 'Motorola', ' মটোরোলা', 26, 172, 'motorola-mza0', NULL),
(489, 'Smart Glasses(VR)', ' স্মার্ট চশমা (ভিআর)', 23, 105, 'smart-glassesvr-ndg3', NULL),
(490, 'Grooming Kits', 'গ্রুমিং কিটস', 27, 161, 'grooming-kits-ote1', NULL),
(491, 'Bangels & Bracelets', 'চুড়ি ও ব্রেসলেট', 19, 150, 'bangels--bracelets-nte3', NULL),
(492, 'Thermals', 'তাপীয়', 28, 162, 'thermals-nzkx', NULL),
(493, 'Fine Jewllery', 'সূক্ষ্ম গয়না', 19, 150, 'fine-jewllery-odyy', NULL),
(494, 'Fully Automatic Front Load', 'সম্পূর্ণ স্বয়ংক্রিয় ফ্রন্ট লোড', 26, 173, 'fully-automatic-front-load-otyy', NULL),
(495, 'Fastrack', 'ফাস্ট্র্যাক', 27, 145, 'fastrack-ndc1', NULL),
(496, 'Remote Control Toys', 'রিমোট কন্ট্রোল খেলনা', 28, 163, 'remote-control-toys-otuy', NULL),
(497, 'More Jewellery', 'আরো গয়না', 19, 150, 'more-jewellery-mji2', NULL),
(498, 'Semi Automatic Top Load', 'সেমি অটোমেটিক টপ লোড', 26, 173, 'semi-automatic-top-load-njuw', NULL),
(499, 'Casio', 'কেসিয়ো', 27, 145, 'casio-ntu5', NULL),
(500, 'Analog', 'এনালগ', 19, 151, 'analog-nje0', NULL),
(501, 'Educational Toys', 'শিক্ষাগত খেলনা', 28, 163, 'educational-toys-mtc4', NULL),
(502, 'Fully Automatic Top Load', 'সম্পূর্ণ স্বয়ংক্রিয় শীর্ষ লোড', 26, 173, 'fully-automatic-top-load-njm2', NULL),
(503, 'Digital', 'ডিজিটাল', 19, 151, 'digital-ndi2', NULL),
(504, 'Soft Toys', 'নরম খেলনা', 28, 163, 'soft-toys-ndy3', NULL),
(505, 'Titan', 'টাইটান', 27, 145, 'titan-mjky', NULL),
(506, 'Chornographs', 'চর্নোগ্রাফ', 19, 151, 'chornographs-nzqy', NULL),
(507, 'Inverter Ac', 'বৈদ্যুতিন সংকেতের মেরু বদল এসি', 26, 174, 'inverter-ac-ntg2', NULL),
(508, 'Fossil', 'জীবাশ্ম', 27, 145, 'fossil-njq5', NULL),
(509, 'Watch Cases', 'কেস দেখুন', 19, 151, 'watch-cases-mte3', NULL),
(510, 'Split ACs', 'Split ACs', 26, 174, 'split-acs-otq4', NULL),
(511, 'Sonata', 'সোনাটা', 27, 145, 'sonata-odg0', NULL),
(512, 'Watch Straps', 'ঘড়ির ফিতা', 19, 151, 'watch-straps-njc0', NULL),
(513, 'Outdoor Toys', 'বহিরঙ্গন খেলনা', 28, 163, 'outdoor-toys-ntg2', NULL),
(514, 'Windows ACs', 'Windows ACs', 26, 174, 'windows-acs-ndk5', NULL),
(515, 'Sarees', 'শাড়ি', 19, 153, 'sarees-nzkw', NULL),
(516, 'Briefs and Trunks', 'সংক্ষিপ্ত বিবরণ এবং কাণ্ড', 27, 144, 'briefs-and-trunks-nzuy', NULL),
(517, 'Brand', 'Brand', 26, 174, 'brand-ndc2', NULL),
(518, 'Board Games', 'বোর্ড গেম', 28, 163, 'board-games-ntg0', NULL),
(519, 'LG', 'LG', 26, 174, 'lg-mzq4', NULL),
(520, 'Vests', 'Vests', 27, 144, 'vests-odq5', NULL),
(521, 'Kurtas & Kurtis', 'কুর্তাস ও কুর্তিস', 19, 153, 'kurtas--kurtis-mte0', NULL),
(522, 'Hitachi', 'হিটাচি', 26, 174, 'hitachi-mzuw', NULL),
(523, 'Musical Toys', 'বাদ্যযন্ত্র খেলনা', 28, 163, 'musical-toys-ote5', NULL),
(524, 'Carrier', 'Carrier', 26, 174, 'carrier-oty0', NULL),
(525, 'Boxers', 'বক্সার', 27, 144, 'boxers-nziy', NULL),
(526, 'Dress Material', 'পোষাক উপাদান', 19, 153, 'dress-material-ndk3', NULL),
(527, 'Dolls & Doll Houses', 'পুতুল ও পুতুল ঘর', 28, 163, 'dolls--doll-houses-ntkw', NULL),
(528, 'Single Door', ' একক দরজা', 26, 175, 'single-door-mzu2', NULL),
(529, 'Lehenga', 'লেহেঙ্গা', 19, 153, 'lehenga-mtc3', NULL),
(530, 'Double Door', 'ডাবল ডোর', 26, 175, 'double-door-mtyy', NULL),
(531, 'Blouse', 'ব্লাউজ', 19, 153, 'blouse-njuy', NULL),
(532, 'Triple Door', ' ট্রিপল ডোর', 26, 175, 'triple-door-mjk0', NULL),
(533, 'Pyjamas and Lounge Pants', 'পাজামা এবং লাউঞ্জ প্যান্ট', 27, 144, 'pyjamas-and-lounge-pants-mjg1', NULL),
(534, 'Side by side', ' পাশাপাশি', 26, 175, 'side-by-side-mjcw', NULL),
(535, 'S.T.E. M Toys', 'S.T.E. এম খেলনা', 28, 163, 'ste-m-toys-ota0', NULL),
(536, 'Convertible', 'রূপান্তরযোগ্য', 26, 175, 'convertible-mtaw', NULL),
(537, 'Kurta Sets & Salwar Suits', 'কুর্তা সেট এবং সালোয়ার স্যুট', 19, 153, 'kurta-sets--salwar-suits-mty5', NULL),
(538, 'Toy Guns', 'খেলনা বন্দুক', 28, 163, 'toy-guns-mtg0', NULL),
(539, 'Gowns', 'গাউন', 19, 153, 'gowns-mzqz', NULL),
(540, 'Dupattas', 'দুপত্তাস', 19, 153, 'dupattas-mtk2', NULL),
(541, 'Microwave Ovens', ' মাইক্রোওয়েভ ওভেন', 26, 177, 'microwave-ovens-otu1', NULL),
(542, 'Party Supplies', 'পার্টি সরবরাহ', 28, 163, 'party-supplies-oti3', NULL),
(543, 'Thermals', 'তাপীয়', 27, 144, 'thermals-odu4', NULL),
(544, 'Oven Toaster Grills (OTG)', 'ওভেন টোস্টার গ্রিলস (ওটিজি)', 26, 177, 'oven-toaster-grills-otg-njex', NULL),
(545, 'School Bags', 'স্কুল ব্যাগ', 28, 165, 'school-bags-ndq5', NULL),
(546, 'Leggings & Churidars', 'লেগিংস ও চুড়িদার', 19, 156, 'leggings--churidars-ntgx', NULL),
(547, 'Juicer/Mixer/Grinder', ' জুসার/মিক্সার/গ্রাইন্ডার', 26, 177, 'juicermixergrinder-mzc0', NULL),
(548, 'Palazzos', 'পালাজোস', 19, 156, 'palazzos-nzyz', NULL),
(549, 'School Combo Sets', 'স্কুল কম্বো সেট', 28, 165, 'school-combo-sets-ndi1', NULL),
(550, 'Shararas ', 'শাররস', 19, 156, 'shararas--oda3', NULL),
(551, 'Night Suits', 'নাইট স্যুট', 27, 144, 'night-suits-ndk0', NULL),
(552, 'Electric Kettle', 'বৈদ্যুতিক কেটলি', 26, 177, 'electric-kettle-ndm1', NULL),
(553, 'Lunch Box', 'দুপুরের খাবারের পাত্র', 28, 165, 'lunch-box-mjg5', NULL),
(554, 'Salwars & Patiala', 'Salwars & Patiala', 19, 156, 'salwars--patiala-ntm1', NULL),
(555, 'Induction Cooktops', ' আবেশন কুকটপ', 26, 177, 'induction-cooktops-odgw', NULL),
(556, 'Kurta', 'কুর্তা', 27, 141, 'kurta-mtu1', NULL),
(557, 'Dhoti Pants', 'ধুতি প্যান্ট', 19, 156, 'dhoti-pants-mta2', NULL),
(558, 'Diapers', ' ডায়াপার', 28, 166, 'diapers-mjg1', NULL),
(559, 'Chimneys', ' চিমনি', 26, 177, 'chimneys-mza3', NULL),
(560, 'Hand Blenders', ' হ্যান্ড ব্লেন্ডার', 26, 177, 'hand-blenders-nji0', NULL),
(561, 'Ethinic Tousers', 'জাতিগত ট্রাউজার্স', 19, 156, 'ethinic-tousers-mza3', NULL),
(562, 'Ethnic Sets', 'জাতিগত সেট', 27, 141, 'ethnic-sets-nzyy', NULL),
(564, 'Sandwich Makers', ' স্যান্ডউইচ মেকার্স', 26, 177, 'sandwich-makers-mza4', NULL),
(565, 'Sherwanis', 'শেরওয়ানিস', 27, 141, 'sherwanis-nzqz', NULL),
(566, 'Top Up Toasters', ' টপ আপ টোস্টার', 26, 177, 'top-up-toasters-nzc4', NULL),
(568, 'Electric Cookers', ' বৈদ্যুতিক কুকার', 26, 177, 'electric-cookers-mzew', NULL),
(569, 'Ethnic Pyjama', 'জাতিগত পায়জামা', 27, 141, 'ethnic-pyjama-mjcz', NULL),
(570, 'Saree Shapewear & Petticoats', 'শাড়ি শেপওয়্যার এবং পেটিকোট', 19, 156, 'saree-shapewear--petticoats-ntcw', NULL),
(572, 'Wet Grinders', ' ভেজা গ্রাইন্ডার', 26, 177, 'wet-grinders-nza2', NULL),
(573, 'Food Processors', ' ফুড প্রসেসর', 26, 177, 'food-processors-nda5', NULL),
(574, 'Forever 21', 'চিরকাল ২ 1', 19, 157, 'forever-21-mzyy', NULL),
(575, 'Coffee Makers', ' কফি মেকার্স', 26, 177, 'coffee-makers-nzi1', NULL),
(576, 'Sweatshirts', 'সোয়েটশার্ট', 27, 140, 'sweatshirts-otq4', NULL),
(577, 'Dishwashers', 'ডিশওয়াশার', 26, 177, 'dishwashers-mtmw', NULL),
(578, 'Accessories', 'আনুষাঙ্গিক', 19, 157, 'accessories-nzm2', NULL),
(579, 'Jackets', 'জ্যাকেট', 27, 140, 'jackets-ndq1', NULL),
(580, 'Baby Bath, Hair & Skin Care', 'শিশুর স্নান, চুল ও ত্বকের যত্ন', 28, 166, 'baby-bath-hair--skin-care-otuw', NULL),
(581, 'Sweater', 'সোয়েটার', 27, 140, 'sweater-mjkx', NULL),
(582, 'Pantaloons', 'প্যান্টালুন', 19, 157, 'pantaloons-nze0', NULL),
(583, 'Baby Grooming', 'বেবি গ্রুমিং', 28, 166, 'baby-grooming-mzy5', NULL),
(584, 'Irons', 'আয়রন', 26, 191, 'irons-njc4', NULL),
(585, 'Chemistry', 'রসায়ন', 19, 157, 'chemistry-odk0', NULL),
(586, 'Tracksuits', 'ট্র্যাকসুট', 27, 140, 'tracksuits-ntm0', NULL),
(587, 'Water Purifiers', 'ওয়াটার পিউরিফায়ার', 26, 191, 'water-purifiers-mtu4', NULL),
(588, 'Lakme', 'ল্যাকমে', 19, 157, 'lakme-mzm5', NULL),
(589, 'Fans', 'ফ্যান', 26, 191, 'fans-nta3', NULL),
(590, 'Baby Bathing Accessories', 'শিশুর স্নানের জিনিসপত্র', 28, 166, 'baby-bathing-accessories-otqw', NULL),
(591, 'Air Coolers', ' এয়ার কুলার', 26, 191, 'air-coolers-mzc0', NULL),
(592, 'Nivea', 'নিভিয়া', 19, 157, 'nivea-mtqy', NULL),
(593, 'Jeans', 'জিন্স', 27, 134, 'jeans-nzq4', NULL),
(594, 'Inverters', ' ইনভার্টার', 26, 191, 'inverters-nzky', NULL),
(595, 'Baby Gift Sets & Combo', 'শিশুর উপহার সেট এবং কম্বো', 28, 166, 'baby-gift-sets--combo-nziw', NULL),
(596, 'Catwalk', 'ক্যাটওয়াক', 19, 157, 'catwalk-njg2', NULL),
(597, 'Vacuum Cleaners', ' ভ্যাকুয়াম ক্লিনার', 26, 191, 'vacuum-cleaners-mjkz', NULL),
(598, 'Sewing Machines', ' সেলাই মেশিন', 26, 191, 'sewing-machines-odi3', NULL),
(599, 'Baby oral Care', 'শিশুর মৌখিক যত্ন', 28, 166, 'baby-oral-care-mtkx', NULL),
(600, 'Titan-Raga', 'টাইটান-রাগ', 19, 157, 'titan-raga-nje0', NULL),
(601, 'Casual Trousers', 'নৈমিত্তিক ট্রাউজার্স', 27, 134, 'casual-trousers-ntax', NULL),
(602, 'Votage Stabilizers', ' ভোট স্থিতিশীল', 26, 191, 'votage-stabilizers-otc1', NULL),
(603, 'Baby Food', 'শিশু খাদ্য', 28, 166, 'baby-food-nze0', NULL),
(604, 'Fastrack', 'ফাস্ট্র্যাক', 19, 157, 'fastrack-odaw', NULL),
(605, 'Water Geysers', ' ওয়াটার গিজার', 26, 191, 'water-geysers-odcx', NULL),
(606, 'Formal trousers', 'আনুষ্ঠানিক ট্রাউজার্স', 27, 134, 'formal-trousers-njqx', NULL),
(607, 'Immersion Rods', ' নিমজ্জন রড', 26, 191, 'immersion-rods-mjuz', NULL),
(608, 'Divastri', 'দিবাস্ত্রী', 19, 157, 'divastri-otqz', NULL),
(609, 'Baby Feeding Bottle & Accessories', 'শিশুর খাওয়ানোর বোতল ও আনুষাঙ্গিক', 28, 166, 'baby-feeding-bottle--accessories-otg0', NULL),
(610, 'Track pants', 'ট্র্যাক প্যান্ট', 27, 134, 'track-pants-mtgy', NULL),
(611, 'Rare Roots', 'বিরল শিকড়', 19, 157, 'rare-roots-ntqy', NULL),
(612, 'Livpure', 'Livpure', 26, 197, 'livpure-ndq4', NULL),
(613, 'Baby Bedding', 'শিশুর বিছানা', 28, 166, 'baby-bedding-ntg2', NULL),
(614, 'Shorts', 'হাফপ্যান্ট', 27, 134, 'shorts-nje5', NULL),
(615, 'Philips', ' ফিলিপস', 26, 197, 'philips-ntu0', NULL),
(616, 'Coins & Bars', 'কয়েন এবং বার', 19, 157, 'coins--bars-mtew', NULL),
(617, 'Bajaj', ' বাজাজ', 26, 197, 'bajaj-otcy', NULL),
(618, 'Pans', ' প্যান', 29, 176, 'pans-ndqy', NULL),
(619, 'Cargos', 'চার্জ', 27, 134, 'cargos-njq1', NULL),
(620, 'IFB', 'IFB', 26, 197, 'ifb-mzi0', NULL),
(621, 'Crocs', 'ক্রোকস', 19, 157, 'crocs-odi1', NULL),
(622, 'Baby Gear', 'বাচ্চাদের জিনিস', 28, 166, 'baby-gear-nzkx', NULL),
(623, 'Tawas', ' তাওয়াস', 29, 176, 'tawas-nzq3', NULL),
(624, 'Eureka Forbes', 'Eureka Forbes', 26, 197, 'eureka-forbes-ndu4', NULL),
(625, 'Kaff', 'Kaff', 26, 197, 'kaff-ntuz', NULL),
(626, 'Three Fourths', 'চার ভাগের তিন অংশ', 27, 134, 'three-fourths-mza0', NULL),
(627, 'Baby Medical & Health Care', 'শিশুর চিকিৎসা ও স্বাস্থ্যসেবা', 28, 166, 'baby-medical--health-care-mja1', NULL),
(628, 'Pressure Cookers', ' প্রেসার কুকার', 29, 176, 'pressure-cookers-nduy', NULL),
(629, 'T-Shirts', 'টি-শার্ট', 27, 132, 't-shirts-nte5', NULL),
(630, 'Kitchen Tools', ' রান্নাঘরের সরঞ্জাম', 29, 176, 'kitchen-tools-ndcx', NULL),
(631, 'Baby Proofing & Safety', 'শিশুর প্রমাণ ও নিরাপত্তা', 28, 166, 'baby-proofing--safety-mze1', NULL),
(632, 'Formal Trousers', 'আনুষ্ঠানিক ট্রাউজার্স', 27, 132, 'formal-trousers-ote0', NULL),
(633, 'Gas Stoves', ' গ্যাসের চুলা', 29, 176, 'gas-stoves-njy3', NULL),
(634, 'Baby Cleaners & Detergents', ' বেবি ক্লিনার এবং ডিটারজেন্ট', 28, 166, 'baby-cleaners--detergents-nty3', NULL),
(635, 'Makeup', 'মেকআপ', 19, 159, 'makeup-nzux', NULL),
(636, 'Casual Shirts', 'নৈমিত্তিক শার্ট', 27, 132, 'casual-shirts-mjew', NULL),
(637, 'Water Purifiers', ' ওয়াটার পিউরিফায়ার', 26, 199, 'water-purifiers-mtq0', NULL),
(638, 'Coffee Mugs', ' কফি মগ', 29, 178, 'coffee-mugs-mtm2', NULL),
(639, 'Miss & Chief', 'মিস অ্যান্ড চিফ', 28, 169, 'miss--chief-mzi1', NULL),
(640, 'Deodorants', 'ডিওডোরেন্ট', 27, 130, 'deodorants-nje1', NULL),
(641, 'Barbie', 'বার্বি', 28, 169, 'barbie-njaw', NULL),
(642, 'Skin Care', 'ত্বকের যত্ন', 19, 159, 'skin-care-mti4', NULL),
(643, 'Dinner Set', ' রাতের খাবারের বাসন পত্র', 29, 178, 'dinner-set-otm5', NULL),
(644, 'Perfumes', 'সুগন্ধি', 27, 130, 'perfumes-nty2', NULL),
(645, 'Disney', 'ডিজনি', 28, 169, 'disney-odm3', NULL),
(646, 'Hair Care', 'চুলের যত্ন', 19, 159, 'hair-care-mtc3', NULL),
(647, 'Coocaa Smatr TVs', 'Coocaa Smatr টিভি', 26, 200, 'coocaa-smatr-tvs-mtiz', NULL),
(648, 'Water Bottles', ' জলের বোতল', 29, 179, 'water-bottles-mjg4', NULL),
(649, 'Beard Care and Aftershave', 'দাড়ি যত্ন এবং আফটারশেভ', 27, 130, 'beard-care-and-aftershave-mtay', NULL),
(650, 'US Polo', 'মার্কিন পোলো', 28, 169, 'us-polo-odg2', NULL),
(651, 'Bath & Spa', 'স্নান ও স্পা', 19, 159, 'bath--spa-ntk5', NULL),
(652, 'Nokia (55) 4k Android Tv', ' নোকিয়া (55) 4k অ্যান্ড্রয়েড টিভি', 26, 200, 'nokia-55-4k-android-tv-oty4', NULL),
(653, 'Lunch Boxes', ' দুপুরের খাবারের বাক্স', 29, 179, 'lunch-boxes-mjcy', NULL),
(654, 'Flying Machine', 'উড়ন্ত যন্ত্র', 28, 169, 'flying-machine-njmx', NULL),
(655, 'Flasks', ' ফ্লাস্ক', 29, 179, 'flasks-mjy5', NULL),
(656, 'Mi (32) 4A Pro Android Tv', 'Mi (32) 4A Pro Android Tv', 26, 200, 'mi-32-4a-pro-android-tv-nzaw', NULL),
(657, 'Shaving and Aftershave', 'শেভিং এবং আফটারশেভ', 27, 130, 'shaving-and-aftershave-nzq5', NULL),
(658, 'Deodorents & Perfumes', 'ডিওডোরেন্টস এবং পারফিউম', 19, 159, 'deodorents--perfumes-nzgz', NULL),
(659, 'Casseroles', 'Casseroles', 29, 179, 'casseroles-nzc0', NULL),
(660, 'Crocs', 'ক্রোকস', 28, 169, 'crocs-njqx', NULL),
(661, 'MarQ (43) FHD Smart TV', ' MarQ (43) FHD স্মার্ট টিভি', 26, 200, 'marq-43-fhd-smart-tv-nzu5', NULL),
(662, 'Sexual Wellness', 'যৌন সুস্থতা', 27, 130, 'sexual-wellness-mty4', NULL),
(663, 'Handbags', 'হাতের ব্যাগ', 19, 167, 'handbags-ntqy', NULL),
(664, 'LG Refrigerators', ' এলজি রেফ্রিজারেটর', 26, 200, 'lg-refrigerators-ntcx', NULL),
(665, 'Puma', 'পুমা', 28, 169, 'puma-otg2', NULL),
(666, 'Kitchen Containers', ' রান্নাঘরের পাত্রে', 29, 179, 'kitchen-containers-mjk5', NULL),
(667, 'Sports Shoes', 'ক্রীড়া জুতা', 27, 127, 'sports-shoes-otq4', NULL),
(668, 'Thomson (40)  4k Smart TV', ' থমসন (40) 4k স্মার্ট টিভি', 26, 200, 'thomson-40--4k-smart-tv-ode2', NULL),
(669, 'Funskool', 'ফানস্কুল', 28, 169, 'funskool-nde4', NULL),
(670, 'Beds', ' শয্যা', 29, 182, 'beds-odax', NULL),
(671, 'lego', 'লেগো', 28, 169, 'lego-nde2', NULL),
(672, 'Casual Shoes', 'নৈমিত্তিক জুতা', 27, 127, 'casual-shoes-ndm5', NULL),
(673, 'Whirlpool Refrigerators', ' ঘূর্ণি রেফ্রিজারেটর', 26, 200, 'whirlpool-refrigerators-njq4', NULL),
(674, 'Sofa', ' সোফা', 29, 183, 'sofa-odq4', NULL),
(675, 'Shoulder Bags', 'কাধের থলে', 19, 167, 'shoulder-bags-njg4', NULL),
(676, 'Totes', 'টোটস', 19, 167, 'totes-mza4', NULL),
(677, 'Sofa Beds', ' সোফা বেডস', 29, 183, 'sofa-beds-ndiy', NULL),
(679, 'Kodak (22)/(32) LED TVs', 'কোডাক (22)/(32) LED টিভি', 26, 200, 'kodak-2232-led-tvs-ndy0', NULL),
(680, 'Sling Bags', 'স্লিং ব্যাগ', 19, 167, 'sling-bags-mte2', NULL),
(681, 'TV Units', ' টিভি ইউনিট', 29, 183, 'tv-units-nzq2', NULL),
(682, 'United Colors of Benetton', 'বেনেটনের ইউনাইটেড কালারস', 28, 169, 'united-colors-of-benetton-mja0', NULL),
(683, 'Clutches', 'খপ্পর', 19, 167, 'clutches-nte4', NULL),
(684, 'Dining Tables & Chair', ' ডাইনিং টেবিল ও চেয়ার', 29, 183, 'dining-tables--chair-nzgz', NULL),
(685, 'Formal Shoes', 'আনুষ্ঠানিক জুতা', 27, 127, 'formal-shoes-nzc4', NULL),
(686, 'Wallets & Belts', 'মানিব্যাগ এবং বেল্ট', 19, 167, 'wallets--belts-ota5', NULL),
(687, 'Coffee Tables', ' কফি টেবিল', 29, 183, 'coffee-tables-njix', NULL),
(688, 'Sandals and Floaters', 'স্যান্ডেল এবং ফ্লোটার', 27, 127, 'sandals-and-floaters-odi2', NULL),
(689, 'Luggage & Travel', 'লাগেজ এবং ভ্রমণ', 19, 167, 'luggage--travel-ntq5', NULL),
(690, 'Shoe Racks', ' জুতার আলনা', 29, 183, 'shoe-racks-nzg4', NULL),
(691, 'Sunglasses', 'সানগ্লাস', 19, 167, 'sunglasses-njux', NULL),
(692, 'Flip-Flops', 'ফ্লিপ-ফ্লপ', 27, 127, 'flip-flops-mjy3', NULL),
(693, 'Kids Room Furniture', ' বাচ্চাদের রুমের আসবাবপত্র', 29, 184, 'kids-room-furniture-njc0', NULL),
(694, 'Frames', 'ফ্রেম', 19, 167, 'frames-ntm3', NULL),
(695, 'Loafers', 'লোফার', 27, 127, 'loafers-ndg3', NULL),
(696, 'Bras', ' ব্রা', 19, 168, 'bras-oty5', NULL),
(697, 'Bean Bags', ' শিম ব্যাগ', 29, 185, 'bean-bags-nzez', NULL),
(698, 'Boots', 'বুট', 27, 127, 'boots-nzyy', NULL),
(699, 'Running Shoes', 'চলমান জুতা', 27, 127, 'running-shoes-ntmy', NULL),
(700, 'Panties ', ' প্যান্টি', 19, 168, 'panties--ndgy', NULL),
(701, 'Collapsible Wardrobes', ' পতনশীল ওয়ার্ড্রোবস', 29, 185, 'collapsible-wardrobes-ntk2', NULL),
(702, 'Lingerie sets ', 'অন্তর্বাস সেট', 19, 168, 'lingerie-sets--otew', NULL),
(703, 'Sneakers', 'স্নিকার্স', 27, 127, 'sneakers-nda0', NULL),
(704, 'Bedsheets', ' বিছানার চাদর', 29, 186, 'bedsheets-mtgx', NULL),
(705, 'Digital', ' ডিজিটাল', 27, 124, 'digital-odiy', NULL),
(706, 'Night Dresses & Nighties', 'রাতের পোশাক এবং নাইটিজ', 19, 168, 'night-dresses--nighties-ntg5', NULL),
(707, 'Curtains', ' পর্দা', 29, 186, 'curtains-mjcw', NULL),
(708, 'Analog', 'এনালগ', 27, 124, 'analog-ndg4', NULL),
(709, 'Shapewear', 'শেপওয়্যার', 19, 168, 'shapewear-otuw', NULL),
(710, 'Chronographs', 'ক্রনোগ্রাফ', 27, 124, 'chronographs-ntk2', NULL),
(711, 'Cushions & Pillows', ' কুশন ও বালিশ', 29, 186, 'cushions--pillows-njc5', NULL),
(712, 'Tops', ' টপস', 28, 203, 'tops-mzkx', NULL),
(713, 'Camisoles & Slips', 'ক্যামিসোলস এবং স্লিপ', 19, 168, 'camisoles--slips-ndy0', NULL),
(714, 'Blankets', ' কম্বল', 29, 186, 'blankets-ndc1', NULL),
(715, 'Watch Straps', 'ঘড়ির ফিতা', 27, 124, 'watch-straps-nte5', NULL),
(716, 'Bottoms', 'নীচে', 28, 203, 'bottoms-mzyx', NULL),
(717, 'Dresses', 'পোশাকগুলো', 28, 203, 'dresses-odgx', NULL),
(718, 'Sets', 'সেট করে', 28, 203, 'sets-ntu3', NULL),
(719, 'Jackets', 'জ্যাকেট', 28, 203, 'jackets-otm4', NULL),
(720, 'Footwear', 'পাদুকা', 28, 203, 'footwear-mzg4', NULL),
(721, 'Accessories', 'আনুষাঙ্গিক', 28, 203, 'accessories-mtk2', NULL),
(722, 'Nightsuits', ' নাইটসুট', 28, 203, 'nightsuits-nzy3', NULL),
(723, 'Swimwear', ' Swimwear সাঁতারের পোশাক', 28, 203, 'swimwear-oda2', NULL),
(724, ' T-shirts', ' টি-শার্ট', 28, 108, '-t-shirts-mtiz', NULL),
(725, 'Onesies', 'Onesies', 28, 170, 'onesies-mtu3', NULL),
(726, 'tops', 'শীর্ষ', 28, 170, 'tops-ndg2', NULL),
(727, 'Bottoms', 'নীচে', 28, 170, 'bottoms-odqz', NULL),
(728, 'sets', 'সেট', 28, 170, 'sets-nzy4', NULL),
(729, 'Dresses', 'পোশাকগুলো', 28, 170, 'dresses-mtkx', NULL),
(730, 'Accessories', 'আনুষাঙ্গিক', 28, 170, 'accessories-mjiz', NULL),
(731, 'Nightsuits', 'নাইটসুট', 28, 170, 'nightsuits-nze5', NULL),
(732, 'Caps', 'ক্যাপস', 28, 170, 'caps-nza5', NULL),
(733, 'Footwear', 'পাদুকা', 28, 170, 'footwear-njkx', NULL),
(734, 'Jackets', 'জ্যাকেট', 28, 170, 'jackets-nzy0', NULL),
(735, 'Innerwear', 'অভ্যন্তরীণ পোশাক', 28, 203, 'innerwear-njay', NULL),
(736, 'T-Shirts and polos', 'টি-শার্ট এবং পোলো', 27, 96, 't-shirts-and-polos-nzuw', NULL),
(737, 'Caps', 'ক্যাপস', 28, 203, 'caps-ndy2', NULL),
(738, 'Formal Shirts', 'আনুষ্ঠানিক শার্ট', 27, 96, 'formal-shirts-mje5', NULL),
(739, 'Bags', 'ব্যাগ', 28, 203, 'bags-mjg1', NULL),
(740, 'Dungarees', 'ডুঙ্গারিস', 28, 203, 'dungarees-ndu1', NULL),
(741, 'Casual Shirts', 'নৈমিত্তিক শার্ট', 27, 96, 'casual-shirts-odyw', NULL),
(742, 'tops', 'শীর্ষ', 28, 204, 'tops-ndax', NULL),
(743, 'Formal Trousers', 'আনুষ্ঠানিক ট্রাউজার্স', 27, 96, 'formal-trousers-ode5', NULL),
(744, 'Bottoms', 'নীচে', 28, 204, 'bottoms-mjqx', NULL),
(745, 'sets', 'সেট', 28, 204, 'sets-otcy', NULL),
(746, 'Sports and 3/4ths', 'খেলাধুলা এবং 3/4 র্থ', 27, 96, 'sports-and-34ths-njk0', NULL),
(747, 'Jackets', 'জ্যাকেট', 28, 204, 'jackets-ody4', NULL),
(748, 'Jeans', 'জিন্স', 27, 96, 'jeans-ntk2', NULL),
(749, 'Footwear', 'পাদুকা', 28, 204, 'footwear-nzux', NULL),
(750, 'Accessories', 'আনুষাঙ্গিক', 28, 204, 'accessories-nze3', NULL),
(751, 'Nightsuits', 'নাইটসুট', 28, 204, 'nightsuits-mji0', NULL),
(752, 'Bath towels', ' গামছা', 29, 186, 'bath-towels-nze3', NULL),
(753, 'Casual Trousers and Chinos', 'নৈমিত্তিক ট্রাউজার্স এবং চিনো', 27, 96, 'casual-trousers-and-chinos-ndmy', NULL),
(754, 'Swimwear', 'সাঁতারের পোশাক', 28, 204, 'swimwear-otc0', NULL),
(755, 'Jackets', 'জ্যাকেট', 27, 96, 'jackets-mjix', NULL),
(756, 'Innerwear', 'অভ্যন্তরীণ পোশাক', 28, 204, 'innerwear-njk3', NULL),
(757, 'Kitchen & Table Linen', 'রান্নাঘর এবং টেবিল লিনেন', 29, 186, 'kitchen--table-linen-mjq3', NULL),
(758, 'Caps', 'ক্যাপস', 28, 204, 'caps-nte1', NULL),
(759, 'Sweatshirts', 'সোয়েটশার্ট', 27, 96, 'sweatshirts-nzi4', NULL),
(760, 'Flor covarings', 'Flor covarings', 29, 186, 'flor-covarings-mzqx', NULL),
(761, 'Bags', 'ব্যাগ', 28, 204, 'bags-mjc5', NULL),
(762, 'Sports Wear', 'ক্রীড়া পরিধান', 27, 96, 'sports-wear-nzky', NULL),
(763, 'Smart Security System', 'স্মার্ট সিকিউরিটি সিস্টেম', 29, 187, 'smart-security-system-ndaz', NULL),
(764, 'Beachwear/Swimwear', 'সৈকত পোশাক/সাঁতারের পোশাক', 27, 96, 'beachwearswimwear-nza2', NULL),
(765, 'Smart Door Locks', 'স্মার্ট ডোর লক', 29, 187, 'smart-door-locks-nta5', NULL),
(766, 'Boys\' Sweatshirts', 'ছেলেদের সোয়েটশার্ট', 28, 205, 'boys-sweatshirts-odix', NULL),
(767, 'Innerwear', 'অভ্যন্তরীণ পোশাক', 27, 96, 'innerwear-nji5', NULL),
(768, 'Boys\' Jacket', 'ছেলেদের জ্যাকেট', 28, 205, 'boys-jacket-ntyz', NULL),
(769, 'Blazers', 'ব্লেজার', 27, 96, 'blazers-odk5', NULL),
(770, 'Tools & Meausering', 'সরঞ্জাম এবং পরিমাপ', 29, 188, 'tools--meausering-ntg3', NULL),
(771, 'Suits', 'স্যুট', 27, 96, 'suits-nty4', NULL),
(772, 'Home Utilities  Organaiger', ' হোম ইউটিলিটি অর্গানাইগার', 29, 188, 'home-utilities--organaiger-nzux', NULL),
(773, 'Sweaters', 'সোয়েটার', 27, 96, 'sweaters-otky', NULL),
(774, 'Koko', 'কোকো', 27, 104, 'koko-mjc4', NULL),
(775, 'Lawn & gardening', 'লন এবং বাগান', 29, 188, 'lawn--gardening-njm4', NULL),
(776, 'Sholat Equipment', 'শোল্ট সরঞ্জাম', 27, 104, 'sholat-equipment-nzg5', NULL),
(777, 'Bathroom & kitchen Fittings', 'বাথরুম এবং রান্নাঘরের জিনিসপত্র', 29, 188, 'bathroom--kitchen-fittings-odiw', NULL),
(778, 'Inserts', 'সন্নিবেশ', 27, 109, 'inserts-ntqw', NULL),
(779, 'Polishes and Cleaners', 'পলিশ এবং ক্লিনার', 27, 109, 'polishes-and-cleaners-oda5', NULL),
(780, 'Shoe Laces', 'জুতার জরি', 27, 109, 'shoe-laces-mzq5', NULL),
(781, 'Shoe Tree and Shoe Horn', 'জুতার গাছ এবং জুতার হর্ন', 27, 109, 'shoe-tree-and-shoe-horn-mtuz', NULL),
(782, 'Messenger Bags', 'মেসেনজার ব্যাগ', 27, 110, 'messenger-bags-mza1', NULL),
(783, 'Backpacks', 'ব্যাকপ্যাক', 27, 110, 'backpacks-mtmy', NULL),
(784, 'Duffle Bags', 'ডফল ব্যাগ', 27, 110, 'duffle-bags-mtu3', NULL),
(785, 'Belts', 'বেল্ট', 27, 118, 'belts-mtqx', NULL),
(786, 'Paintings', ' পেইন্টিং', 29, 190, 'paintings-odg0', NULL),
(787, 'Wallets', 'মানিব্যাগ', 27, 118, 'wallets-mta2', NULL),
(788, 'Clocks', ' ঘড়ি', 29, 190, 'clocks-ntg4', NULL),
(789, 'Wall Shelves', 'ওয়াল তাক', 29, 190, 'wall-shelves-mjg4', NULL),
(790, 'Hats and Caps', 'টুপি এবং ক্যাপ', 27, 118, 'hats-and-caps-ntax', NULL),
(791, 'Ties', 'বন্ধন', 27, 118, 'ties-nzy0', NULL),
(792, 'Stickers', ' স্টিকার', 29, 190, 'stickers-mzq5', NULL),
(793, 'Suspenders', 'সাসপেন্ডার', 27, 118, 'suspenders-odi4', NULL),
(794, 'Pens', 'কলম', 27, 118, 'pens-nta1', NULL),
(795, 'Showpieces & Figurines', 'শোপিস এবং মূর্তি', 29, 190, 'showpieces--figurines-mzg0', NULL),
(796, 'Bulbs', 'বাল্ব', 29, 192, 'bulbs-mze0', NULL),
(797, 'Pocket Squares', 'পকেট স্কোয়ার', 27, 118, 'pocket-squares-ndm3', NULL),
(798, 'Cufflinks', 'কফলিঙ্ক', 27, 118, 'cufflinks-mzq5', NULL),
(799, 'Braclets', 'ব্রেসলেট', 27, 118, 'braclets-ntk3', NULL),
(800, 'Wall lamp', 'দেয়াল বাতি', 29, 192, 'wall-lamp-ndy4', NULL),
(801, 'Necklaces', 'নেকলেস', 27, 118, 'necklaces-ote2', NULL),
(802, 'Table lamp', 'টেবিল ল্যাম্প', 29, 192, 'table-lamp-ndg3', NULL),
(803, 'Earrings', ' কানের দুল', 27, 118, 'earrings-njyz', NULL),
(804, 'Ceiling lamp', 'ছাদ বাতি', 29, 192, 'ceiling-lamp-mjcx', NULL),
(805, 'Rings', 'রিং', 27, 118, 'rings-otc4', NULL),
(806, 'Emergency Lights', 'Emergency Lights', 29, 192, 'emergency-lights-nje3', NULL),
(807, 'Handkerchiefs', 'রুমাল', 27, 118, 'handkerchiefs-ndc5', NULL),
(808, 'Dogs', ' কুকুর', 29, 193, 'dogs-mzyx', NULL),
(809, 'Socks', ' মোজা', 27, 118, 'socks-nja1', NULL),
(810, 'Cats', ' বিড়াল', 29, 193, 'cats-njg4', NULL),
(811, 'Sports Accessories', 'ক্রীড়া আনুষাঙ্গিক', 27, 118, 'sports-accessories-oty5', NULL),
(812, 'Fish & Aquatics', 'মাছ এবং জলজ', 29, 193, 'fish--aquatics-nda4', NULL),
(813, 'Sunglasses', 'সানগ্লাস', 27, 118, 'sunglasses-ntg3', NULL),
(814, 'Mugs store', ' মগের দোকান', 29, 196, 'mugs-store-njy5', NULL),
(815, 'Casual Shoes', 'নৈমিত্তিক জুতা', 27, 122, 'casual-shoes-mzk5', NULL),
(816, 'Gardening store', 'বাগানের দোকান', 29, 196, 'gardening-store-mjm2', NULL),
(817, 'Formal shoes', 'আনুষ্ঠানিক জুতা', 27, 122, 'formal-shoes-mtey', NULL),
(818, 'Stainless Stone Store', 'স্টেইনলেস স্টোন স্টোর', 29, 196, 'stainless-stone-store-nzu0', NULL),
(819, 'Milton', ' মিল্টন', 29, 196, 'milton-odg1', NULL),
(820, 'Bombay Dyeing', 'বোম্বে ডাইং', 29, 196, 'bombay-dyeing-njkz', NULL),
(821, '@ Home', '@ বাড়ি', 29, 196, '-home-ntm1', NULL),
(822, 'Hometown', 'নিজ শহর', 29, 196, 'hometown-oda0', NULL),
(823, 'Sports shoes', 'ক্রীড়া জুতা', 27, 122, 'sports-shoes-mzmx', NULL),
(824, 'Ajanta', 'অজন্তা', 29, 196, 'ajanta-otiw', NULL),
(825, 'Sandals and Slippers', 'স্যান্ডেল এবং চপ্পল', 27, 122, 'sandals-and-slippers-otg3', NULL),
(826, 'Spaces by Welspun', 'Welspun দ্বারা স্পেস', 29, 196, 'spaces-by-welspun-odaw', NULL),
(827, 'Prestige', 'প্রতিপত্তি', 29, 196, 'prestige-odk2', NULL),
(828, 'Boots', 'বুট', 27, 122, 'boots-njq0', NULL);

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
  `user_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Customer, 1=Admin, 2=Seller, 3=Both',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=URl generate, 1=Full url',
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image/user/user.png',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Block',
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seller_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Unverified, 1=Verify',
  `mobile_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Unverified, 1=Verify',
  `seller_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Unverified, 1=Verify'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `name`, `photo_type`, `photo`, `username`, `email`, `mobile`, `role_id`, `password`, `birthday`, `gender`, `status`, `ip_address`, `created_at`, `updated_at`, `seller_id`, `customer_id`, `email_verify`, `mobile_verify`, `seller_verify`) VALUES
(1, 1, 'Rofequl Islam', 0, 'upload/user/profile/mtawnzqxnjmyntm4njqx.jpeg', NULL, 'admin@gmail.com', '0123456789', 1, '$2y$10$BIAz6cE15ZJ6GzXIwYGBD.kVsDAd01rtMoWFxmQTyk2QqpHFCJD3a', '2021-09-01', 'male', 1, NULL, '2021-02-16 08:16:46', '2021-09-25 02:57:21', NULL, NULL, 0, 0, 0),
(19, 3, 'Manik Miya', 0, 'upload/user/profile/odu5otexnji1ntixnji4.jpeg', 'manikmiyanzywmje', 'manik@gmail.com', '+8801523456789', NULL, '$2y$10$es4AjHxwJzeVtkepK.DZ4.dG/fq1yermaqxvvS3eXrA1ewfWEjvW6', '2021-07-02', 'male', 1, NULL, '2021-06-20 20:37:22', '2021-07-05 21:47:08', 'SEL941754', 'CUS941754', 0, 0, 1),
(23, 3, 'Nayem Islam', 0, 'image/user/user.png', 'nayemislammjc3ode', 'rofequlislamnayem@gmail.com', '+8801966634890', NULL, '$2y$10$LekSqhuko4IkKNKYXwGrcukk3g2UkSq2d94k5I5bc.Rffxr1J6xQW', NULL, NULL, 1, NULL, '2021-07-10 00:45:21', '2021-08-27 18:00:56', 'SEL329383', 'CUS329383', 1, 0, 1),
(24, 3, 'anwar khan', 0, 'image/user/user.png', 'anwarkhannzu1mze', 'anwarkhan0678@gmail.com', '+8801775026866', NULL, '$2y$10$82ZaFNteRBxTrWj0gqdXf.ycRtS/Fjskq0cZSA831GQ8D7PiGeSaG', NULL, NULL, 1, NULL, '2021-08-22 05:46:00', '2021-08-22 05:47:54', 'SEL637634', 'CUS637634', 0, 0, 1),
(25, 0, 'anwar khan', 0, 'image/user/user.png', 'anwarkhanntc1nti', 'anu@gmail.com', '+8801775086266', NULL, '$2y$10$kRUhmE1JmwkkocQkg5ggCuyOgEGOQYHxbdS13iSFLhjllYtdF4fh2', NULL, NULL, 1, NULL, '2021-08-22 05:47:39', '2021-08-22 06:16:51', 'SEL717685', 'CUS717685', 0, 1, 0),
(26, 3, 'anu', 0, 'upload/user/profile/mzk2otgxnjmwmzixmzm5.png', 'anunzy4ntc', 'anwarkhan06789@gmail.com', '+8801775086263', NULL, '$2y$10$n8W165yqa3vaYdQdAR4DiOn3a4WFs7n67inFzYOSD.VfXCNiuO1Gy', NULL, NULL, 1, NULL, '2021-08-30 08:04:38', '2021-09-06 09:58:50', 'SEL321136', 'CUS321136', 0, 0, 1),
(27, 3, 'MD IMRAAN', 0, 'upload/user/profile/otm1mtmxnjmxmzuzmdcx.jpeg', 'mdimraanndeznjm', 'md.imraanhossan1@gmail.com', '+8801567945439', NULL, '$2y$10$0yX5muulznh/lnriQHrl0OXmbGY0DWHrFYp5B.zxuQEdX8ZPDyf9C', '2021-09-15', 'male', 1, NULL, '2021-09-04 09:34:31', '2021-09-11 09:37:51', 'SEL211326', 'CUS211326', 1, 0, 1),
(28, 3, 'Hredoy Hassan', 0, 'upload/user/profile/njm0mdqxnjmwotg4nday.jpeg', 'hredoyhassannjm2mdu', 'hredoyhassanfuad@gmail.com', '+8801864314126', NULL, '$2y$10$qgOwFyXCi8jC14NL2KQ9iOHh5ccXC6S8Ubfw/Djxq1T8YkpJ3i.2K', '1996-12-10', 'male', 1, NULL, '2021-09-06 15:09:40', '2021-09-07 08:01:24', 'SEL896207', 'CUS896207', 1, 0, 1),
(29, 3, 'shanaz akter', 0, 'upload/user/profile/otuwndmxnjmwotk4mdiy.png', 'shanazakterotk3ndi', 'msshanaz76@gmail.com', '+8801846524244', NULL, '$2y$10$saY9bkHOLZvpjJ3hDAybQuZ.U3G1TpZQPc9EXDc6BLGSmw7Jphxbu', '1997-12-17', 'women', 1, NULL, '2021-09-07 06:59:01', '2021-09-07 07:19:02', 'SEL971418', 'CUS971418', 1, 0, 1),
(30, 3, 'shakil ahmed', 0, 'upload/user/profile/odqzmtmxnjmxmdaxotq4.jpeg', 'shakilahmedmzy3mzq', 'ahamedshakil246@gmail.com', '+8801626033773', NULL, '$2y$10$DIiCltv.LKnQ5gkDuRhPgOtTu5Fzcm/yw5gohs0Tve6pj30ZSEasu', '2021-09-07', 'male', 1, NULL, '2021-09-07 08:05:00', '2021-09-08 04:31:53', 'SEL786669', 'CUS786669', 1, 0, 1),
(31, 3, 'anesa akter', 0, 'image/user/user.png', 'anesaakterndm4ntk', 'akteranisa709@gmail.com', '+8801906430750', NULL, '$2y$10$Ld1DeTmT.XOdo8SbD1AeoOd8DbVvjE9FnYWbw8cwoXnb5TU2hXVHm', '2021-09-25', 'women', 1, NULL, '2021-09-07 08:09:47', '2021-09-07 12:36:58', 'SEL8901610', 'CUS8901610', 1, 0, 1),
(32, 3, 'rocky', 0, 'image/user/user.png', 'rockyotiznjy', 'rahmanshaheenur703@gmail.com', '+8801846977083', NULL, '$2y$10$vejWiY8SVN9ZwebIX2Q3BOQItPCBxmBumbCX9DOFrdidFs6hwTCYe', NULL, NULL, 1, NULL, '2021-09-07 08:18:17', '2021-09-07 08:22:49', 'SEL1529311', 'CUS1529311', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_business_types`
--

CREATE TABLE `user_business_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `business_type_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_business_types`
--

INSERT INTO `user_business_types` (`id`, `user_id`, `business_type_id`) VALUES
(12, 15, 8),
(13, 15, 9),
(14, 15, 7),
(15, 24, 7),
(16, 27, 8),
(17, 27, 9),
(18, 27, 7),
(19, 29, 9),
(20, 29, 7);

-- --------------------------------------------------------

--
-- Table structure for table `user_verifications`
--

CREATE TABLE `user_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Unverified, 1=verified',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_verifications`
--

INSERT INTO `user_verifications` (`id`, `account_details`, `code`, `is_verified`, `created_at`, `updated_at`) VALUES
(13, '+8801966634890', 824988, 0, '2021-05-07 23:27:52', '2021-05-11 00:15:27'),
(24, '+8801775026866', 879952, 0, '2021-08-22 05:48:35', '2021-08-22 05:48:35'),
(26, '+8801683550221', 297888, 0, '2021-08-22 06:18:09', '2021-08-22 06:18:09'),
(27, 'mdnayemislam890@gmail.com', 396909, 0, '2021-08-30 11:46:30', '2021-08-30 11:46:30'),
(28, 'warowo6478@enpaypal.com', 179939, 0, '2021-09-04 09:24:40', '2021-09-04 09:24:40'),
(29, 'md.imraanhossan1@gmail.com', 449428, 0, '2021-09-04 09:27:13', '2021-09-04 09:29:40'),
(31, 'hredoyhassanfuad1@gmail.com', 764970, 0, '2021-09-06 15:06:52', '2021-09-06 15:06:52'),
(36, 'shaheenurrahman703@gmail.com', 415254, 0, '2021-09-07 08:10:28', '2021-09-07 08:10:28'),
(38, 'anisaakter991@gmail.com', 730384, 0, '2021-09-08 17:47:04', '2021-09-08 18:04:14'),
(39, 'akteranisa709@gamil.com', 829435, 0, '2021-09-08 17:50:30', '2021-09-08 17:57:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `business_types`
--
ALTER TABLE `business_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `business_types_name_unique` (`name`);

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
-- Indexes for table `financials`
--
ALTER TABLE `financials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financials_user_id_foreign` (`user_id`);

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
-- Indexes for table `help_categories`
--
ALTER TABLE `help_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_categories_name_unique` (`name`),
  ADD UNIQUE KEY `help_categories_slug_unique` (`slug`);

--
-- Indexes for table `help_questions`
--
ALTER TABLE `help_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_questions_slug_unique` (`slug`),
  ADD KEY `help_questions_category_id_foreign` (`category_id`),
  ADD KEY `help_questions_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `help_subcategories`
--
ALTER TABLE `help_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `help_subcategories_name_unique` (`name`),
  ADD UNIQUE KEY `help_subcategories_slug_unique` (`slug`),
  ADD KEY `help_subcategories_category_id_foreign` (`category_id`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
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
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_category_id_foreign` (`category_id`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Indexes for table `shop_addresses`
--
ALTER TABLE `shop_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
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
  ADD UNIQUE KEY `users_seller_id_unique` (`seller_id`),
  ADD UNIQUE KEY `users_customer_id_unique` (`customer_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_business_types`
--
ALTER TABLE `user_business_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_verifications`
--
ALTER TABLE `user_verifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=554;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `business_types`
--
ALTER TABLE `business_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discount_variations`
--
ALTER TABLE `discount_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `financials`
--
ALTER TABLE `financials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

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
-- AUTO_INCREMENT for table `help_categories`
--
ALTER TABLE `help_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `help_questions`
--
ALTER TABLE `help_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `help_subcategories`
--
ALTER TABLE `help_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `home_setups`
--
ALTER TABLE `home_setups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `price_variations`
--
ALTER TABLE `price_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shop_addresses`
--
ALTER TABLE `shop_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=829;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_business_types`
--
ALTER TABLE `user_business_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_verifications`
--
ALTER TABLE `user_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `financials`
--
ALTER TABLE `financials`
  ADD CONSTRAINT `financials_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD CONSTRAINT `flash_deal_products_flash_deal_id_foreign` FOREIGN KEY (`flash_deal_id`) REFERENCES `flash_deals` (`id`),
  ADD CONSTRAINT `flash_deal_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `help_questions`
--
ALTER TABLE `help_questions`
  ADD CONSTRAINT `help_questions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `help_categories` (`id`),
  ADD CONSTRAINT `help_questions_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `help_subcategories` (`id`);

--
-- Constraints for table `help_subcategories`
--
ALTER TABLE `help_subcategories`
  ADD CONSTRAINT `help_subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `help_categories` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `shop_addresses`
--
ALTER TABLE `shop_addresses`
  ADD CONSTRAINT `shop_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
