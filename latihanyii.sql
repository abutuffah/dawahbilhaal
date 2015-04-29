-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2015 at 01:34 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `latihanyii`
--

-- --------------------------------------------------------

--
-- Table structure for table `armada`
--

CREATE TABLE IF NOT EXISTS `armada` (
  `armada_id` int(11) NOT NULL AUTO_INCREMENT,
  `armada_nama` varchar(100) NOT NULL,
  `armada_keterangan` text,
  `status` enum('Tersedia','Tidak Tersedia') NOT NULL,
  PRIMARY KEY (`armada_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `armada`
--

INSERT INTO `armada` (`armada_id`, `armada_nama`, `armada_keterangan`, `status`) VALUES
(1, 'Satu', 'kalimas', 'Tersedia'),
(2, 'Dua', 'Kalimas', 'Tersedia'),
(3, 'Tiga', 'kalimas', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('super-admin', 1, NULL),
('user', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('form-call', 1, 'let the ordinary user to call the ambulance', NULL, NULL, NULL, NULL),
('manage-armada', 1, 'allow user to manage armada', NULL, NULL, NULL, NULL),
('manage-booking', 1, 'allow user to manage booking', NULL, NULL, NULL, NULL),
('manage-user', 1, NULL, NULL, NULL, NULL, NULL),
('operator', 1, 'operator', NULL, NULL, NULL, NULL),
('super-admin', 1, 'super admin', NULL, NULL, NULL, NULL),
('user', 1, 'user', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('user', 'form-call'),
('operator', 'manage-armada'),
('super-admin', 'manage-armada'),
('operator', 'manage-booking'),
('super-admin', 'manage-booking'),
('super-admin', 'manage-user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE IF NOT EXISTS `Country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`code`, `name`, `population`) VALUES
('AU', 'Australia', 18886000),
('BR', 'Brazil', 170115000),
('CA', 'Canada', 1147000),
('CN', 'China', 1277558000),
('DE', 'Germany', 82164700),
('FR', 'France', 59225700),
('GB', 'United Kingdom', 59623400),
('IN', 'India', 1013662000),
('RU', 'Russia', 146934000),
('US', 'United States', 278357000);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1429974504),
('m130524_201442_init', 1429974506);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notelp` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `firstname`, `lastname`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `notelp`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Abdullah', 'Hamba Allah', 'oxW0UX-wgl2xJeAfSfhJcT8GSH83lIPB', '$2y$13$r6o850HM6yYENXy7MaaZ6O2n8RkIWLG.0jxRTh3BLD355FfbB7S1C', NULL, 'admin@gmail.com', '0878652736', 10, 1430027083, 1430027083),
(10, 'ahmad', 'ahmad', 'baraja', 'AVdRujLDjF5ENz_bhY8jIsmMgyzzRlk7', '$2y$13$Um/FDmyGlvq1NGZMilPiEe83Wom1G5UiL8Se5/81ec8NpRyaPxx8y', NULL, 'ahmad@gmail.com', '123123121', 10, 1430129909, 1430129909);

-- --------------------------------------------------------

--
-- Table structure for table `user_booking`
--

CREATE TABLE IF NOT EXISTS `user_booking` (
  `ub_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `armada_id` int(11) NOT NULL,
  `alamat_penjemputan` text NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  PRIMARY KEY (`ub_id`),
  KEY `user_id` (`user_id`),
  KEY `armada_id` (`armada_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_booking`
--

INSERT INTO `user_booking` (`ub_id`, `user_id`, `armada_id`, `alamat_penjemputan`, `start_datetime`, `end_datetime`) VALUES
(1, 1, 1, '', '2015-04-26 07:04:06', '2015-04-26 14:49:12'),
(2, 10, 1, 'kalimas udik', '2015-04-28 15:04:10', '2015-04-29 05:04:10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_booking`
--
ALTER TABLE `user_booking`
  ADD CONSTRAINT `user_booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_booking_ibfk_2` FOREIGN KEY (`armada_id`) REFERENCES `armada` (`armada_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
