-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2016 at 08:20 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_prefix`
--

CREATE TABLE `tbl_contact_prefix` (
  `prefix_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `prefix` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact_prefix`
--

INSERT INTO `tbl_contact_prefix` (`prefix_id`, `contact_id`, `prefix`) VALUES
(1, 2, '0813'),
(2, 2, '0900'),
(3, 2, '0907'),
(4, 2, '0908'),
(5, 2, '0909'),
(6, 2, '0910'),
(7, 2, '0911'),
(8, 2, '0912'),
(9, 2, '0913'),
(10, 2, '0914'),
(11, 2, '0918'),
(12, 2, '0919'),
(13, 2, '0920'),
(14, 2, '0921'),
(15, 2, '0928'),
(16, 2, '0929'),
(17, 2, '0930'),
(18, 2, '0938'),
(19, 2, '0939'),
(20, 2, '0940'),
(21, 2, '0946'),
(22, 2, '0947'),
(23, 2, '0948'),
(24, 2, '0949'),
(25, 2, '0950'),
(26, 2, '0989'),
(27, 2, '0998'),
(28, 2, '0999'),
(29, 3, '0817'),
(30, 3, '0905'),
(31, 3, '0906'),
(32, 3, '0915'),
(33, 3, '0916'),
(34, 3, '0917'),
(35, 3, '0926'),
(36, 3, '0927'),
(37, 3, '0935'),
(38, 3, '0936'),
(39, 3, '0945'),
(40, 3, '0975'),
(41, 3, '0994'),
(42, 3, '0995'),
(43, 3, '0996'),
(44, 3, '0997'),
(45, 3, '0976'),
(46, 3, '0977'),
(47, 3, '0978'),
(48, 3, '0979'),
(49, 3, '0937'),
(50, 4, '0922'),
(51, 4, '0923'),
(52, 4, '0924'),
(53, 4, '0925'),
(54, 4, '0931'),
(55, 4, '0932'),
(56, 4, '0933'),
(57, 4, '0934'),
(58, 4, '0942'),
(59, 4, '0943'),
(60, 4, '0944'),
(61, 1, '02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_address`
--

CREATE TABLE `tbl_user_address` (
  `address_id` int(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `barangay` varchar(50) NOT NULL,
  `house_number` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_contact`
--

CREATE TABLE `tbl_user_contact` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prefix_id` int(11) NOT NULL,
  `contact_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_contact`
--

INSERT INTO `tbl_user_contact` (`id`, `user_id`, `prefix_id`, `contact_number`) VALUES
(1, 1, 8, '4959139'),
(2, 1, 61, '6960668');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_contact_type`
--

CREATE TABLE `tbl_user_contact_type` (
  `contact_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_contact_type`
--

INSERT INTO `tbl_user_contact_type` (`contact_id`, `type`) VALUES
(1, 'landline'),
(2, 'smart / tnt'),
(3, 'globe / tm'),
(4, 'sun cellular');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_department`
--

CREATE TABLE `tbl_user_department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_department`
--

INSERT INTO `tbl_user_department` (`dep_id`, `dep_name`) VALUES
(1, 'administration'),
(2, 'human resource'),
(3, 'panasonic'),
(4, 'uniqlo'),
(5, 'web integration'),
(6, 'ecommerce'),
(7, 'finances');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_gender`
--

CREATE TABLE `tbl_user_gender` (
  `gender_id` int(11) NOT NULL,
  `gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_gender`
--

INSERT INTO `tbl_user_gender` (`gender_id`, `gender`) VALUES
(1, 'male'),
(2, 'female');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_info`
--

CREATE TABLE `tbl_user_info` (
  `user_id` int(11) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '2',
  `gender_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `profile_pic` varchar(50) NOT NULL,
  `attempt` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_info`
--

INSERT INTO `tbl_user_info` (`user_id`, `pos_id`, `dep_id`, `status_id`, `gender_id`, `first_name`, `middle_name`, `last_name`, `email`, `user_name`, `user_password`, `profile_pic`, `attempt`, `date_created`) VALUES
(1, 1, 1, 1, 1, 'jegger', 'plaza', 'saren', 'jeggersaren@yahoo.com', 'jegger06', '21232f297a57a5a743894a0e4a801fc3', '/uploads/img/2df87007b5.jpg', 1, '2016-11-02 07:21:01'),
(2, 2, 2, 1, 0, 'josie', '', 'dapin', 'petsie_bruidan@yahoo.com', 'josie29', '051156338f4f684383c1ce7baa66c386', '', 1, '2016-10-21 01:51:05'),
(3, 4, 4, 2, 0, 'john rey', '', 'baylen', 'johnrey.baylen@transcosmos.com.ph', 'jRey', 'c7ce449fd951972dd99ff0a642f48103', '', 6, '2016-10-21 01:39:02'),
(4, 4, 5, 2, 0, 'doms', '', 'sanchez', 'dominick.sanchez@transcosmos.com.ph', 'doms', '21232f297a57a5a743894a0e4a801fc3 ', '', 6, '2016-10-26 08:39:17'),
(5, 3, 2, 2, 0, 'john mark', '', 'abarientos', 'john_mark.abarientos@transcosmos.com.ph', 'jmark', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 6, '2016-10-21 01:39:19'),
(6, 3, 1, 2, 0, 'jemuel', '', 'elimanco', 'jemuel.elimanco@transcosmos.com.ph', 'dudes', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 6, '2016-10-21 01:07:52'),
(7, 4, 6, 2, 0, 'john raphael', '', 'dizon', 'john_raphael.dizon@transcosmos.com.ph', 'peng', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 6, '2016-10-21 01:07:57'),
(8, 3, 6, 2, 0, 'lhoraine', '', 'marinas', 'lhoraine.marinas@transcosmos.com.ph', 'lhori', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 1, '2016-10-21 06:47:25'),
(9, 4, 5, 2, 0, 'julius', '', 'mateo', 'julius.mateo@transcosmos.com.ph', 'juls', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 0, '2016-10-21 01:53:15'),
(10, 2, 1, 2, 0, 'bon geomar', '', 'barriatos', 'bon_geomar.barriatos@transcosmos.com.ph', 'bon2', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 0, '2016-10-20 08:44:24'),
(11, 4, 3, 1, 0, 'antonio', '', 'aduna', 'antonio.aduna@transcosmos.com.ph', 'tonton', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 1, '2016-10-21 06:48:56'),
(12, 4, 4, 2, 0, 'sammeer', '', 'khatib', 'sammeer.khatib@transcosmos.com.ph', 'sam', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 1, '2016-10-21 06:47:20'),
(13, 4, 3, 2, 0, 'julian cris', '', 'alvarez', 'julian_cris.alvarez@transcosmos.com.ph', 'jc', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 0, '2016-10-12 02:07:19'),
(14, 2, 1, 2, 0, 'phillip carlo', '', 'ventura', 'phillip_carlo.ventura@transcomos.com.ph', 'carlo', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 0, '2016-10-12 02:08:24'),
(15, 4, 2, 2, 0, 'jumar', '', 'ochinang', 'jumar.ochinang@transcomos.com.ph', 'jumar', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 6, '2016-10-21 01:08:04'),
(16, 3, 4, 2, 0, 'prince justine', '', 'bartolome', 'prince_justine.bartolome@transcosmos.com.ph', 'prince', '7e869809dee47d7ba8aa3cdf21b55ef4', '', 0, '2016-10-20 06:53:32'),
(17, 3, 5, 2, 0, 'maria cristina', '', 'olid', 'maria_cristina.olid@transcosmos.com.ph', 'tina', 'e190ce81d0cd323e95c02eb5a39c3d79', '', 1, '2016-10-21 06:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_position`
--

CREATE TABLE `tbl_user_position` (
  `pos_id` int(11) NOT NULL,
  `pos_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_position`
--

INSERT INTO `tbl_user_position` (`pos_id`, `pos_name`) VALUES
(1, 'president'),
(2, 'senior manager'),
(3, 'manager'),
(4, 'associate'),
(5, 'team lead'),
(6, 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_status`
--

CREATE TABLE `tbl_user_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_status`
--

INSERT INTO `tbl_user_status` (`status_id`, `status_name`) VALUES
(1, 'active'),
(2, 'inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_contact_prefix`
--
ALTER TABLE `tbl_contact_prefix`
  ADD PRIMARY KEY (`prefix_id`);

--
-- Indexes for table `tbl_user_address`
--
ALTER TABLE `tbl_user_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `tbl_user_contact`
--
ALTER TABLE `tbl_user_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_contact_type`
--
ALTER TABLE `tbl_user_contact_type`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_user_department`
--
ALTER TABLE `tbl_user_department`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `tbl_user_gender`
--
ALTER TABLE `tbl_user_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `tbl_user_info`
--
ALTER TABLE `tbl_user_info`
  ADD PRIMARY KEY (`user_id`);
ALTER TABLE `tbl_user_info` ADD FULLTEXT KEY `first_name` (`first_name`,`last_name`,`user_name`,`email`);

--
-- Indexes for table `tbl_user_position`
--
ALTER TABLE `tbl_user_position`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `tbl_user_status`
--
ALTER TABLE `tbl_user_status`
  ADD PRIMARY KEY (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_contact_prefix`
--
ALTER TABLE `tbl_contact_prefix`
  MODIFY `prefix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `tbl_user_address`
--
ALTER TABLE `tbl_user_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user_contact`
--
ALTER TABLE `tbl_user_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_user_contact_type`
--
ALTER TABLE `tbl_user_contact_type`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_user_department`
--
ALTER TABLE `tbl_user_department`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_user_gender`
--
ALTER TABLE `tbl_user_gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_user_info`
--
ALTER TABLE `tbl_user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tbl_user_position`
--
ALTER TABLE `tbl_user_position`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_user_status`
--
ALTER TABLE `tbl_user_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
