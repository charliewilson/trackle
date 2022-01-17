-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 17, 2022 at 09:43 PM
-- Server version: 8.0.27-0ubuntu0.21.10.1
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackle`
--
CREATE DATABASE IF NOT EXISTS `trackle` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `trackle`;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `puzzle_no` int NOT NULL,
  `guesses_no` text NOT NULL,
  `guess_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `user_id`, `puzzle_no`, `guesses_no`, `guess_data`) VALUES
(1, 1, 204, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XGXYY\";i:2;s:5:\"XGGXG\";i:3;s:5:\"GGGGG\";}'),
(2, 1, 205, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"YYXXX\";i:2;s:5:\"XXYYX\";i:3;s:5:\"GGGGG\";}'),
(3, 1, 206, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XYXXX\";i:2;s:5:\"YYYXX\";i:3;s:5:\"GGGGG\";}'),
(4, 1, 207, '5', 'a:5:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XXXXG\";i:2;s:5:\"XXXGG\";i:3;s:5:\"YGXGG\";i:4;s:5:\"GGGGG\";}'),
(5, 1, 208, '2', 'a:2:{i:0;s:5:\"GXGGX\";i:1;s:5:\"GGGGG\";}'),
(6, 1, 209, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGGXX\";i:3;s:5:\"XGGYX\";i:4;s:5:\"GGGGG\";}'),
(7, 1, 210, '2', 'a:2:{i:0;s:5:\"XYYYX\";i:1;s:5:\"GGGGG\";}'),
(8, 1, 211, '3', 'a:3:{i:0;s:5:\"GXXYX\";i:1;s:5:\"GXYYX\";i:2;s:5:\"GGGGG\";}'),
(9, 1, 202, '5', 'a:5:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXXGX\";i:2;s:5:\"XXYGY\";i:3;s:5:\"GGGGX\";i:4;s:5:\"GGGGG\";}'),
(10, 1, 203, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXXY\";i:2;s:5:\"GGGGG\";}'),
(12, 1, 212, '4', 'a:4:{i:0;s:5:\"GXYYX\";i:1;s:5:\"GXXYY\";i:2;s:5:\"GYYYX\";i:3;s:5:\"GGGGG\";}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(249) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `verified` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `resettable` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `roles_mask` int UNSIGNED NOT NULL DEFAULT '0',
  `registered` int UNSIGNED NOT NULL,
  `last_login` int UNSIGNED DEFAULT NULL,
  `force_logout` mediumint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `status`, `verified`, `resettable`, `roles_mask`, `registered`, `last_login`, `force_logout`) VALUES
(1, 'me@charliewilson.co.uk', '$2y$10$7b/XFHyai8gWxoDLfcPAe..GcARkFFzIDpqkstrKLIjMAZRD/lSgW', 'charlie', 0, 1, 1, 0, 1585749826, 1642454689, 112);

-- --------------------------------------------------------

--
-- Table structure for table `users_confirmations`
--

CREATE TABLE `users_confirmations` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `email` varchar(249) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `selector` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_data`
--

CREATE TABLE `users_data` (
  `id` int NOT NULL,
  `email` text NOT NULL,
  `name` text NOT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_data`
--

INSERT INTO `users_data` (`id`, `email`, `name`, `data`) VALUES
(1, 'admin@ledge.club', 'Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `friendcode` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users_remembered`
--

CREATE TABLE `users_remembered` (
  `id` bigint UNSIGNED NOT NULL,
  `user` int UNSIGNED NOT NULL,
  `selector` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_resets`
--

CREATE TABLE `users_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `user` int UNSIGNED NOT NULL,
  `selector` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_throttling`
--

CREATE TABLE `users_throttling` (
  `bucket` varchar(44) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `tokens` float UNSIGNED NOT NULL,
  `replenished_at` int UNSIGNED NOT NULL,
  `expires_at` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_throttling`
--

INSERT INTO `users_throttling` (`bucket`, `tokens`, `replenished_at`, `expires_at`) VALUES
('ejWtPDKvxt-q7LZ3mFjzUoIWKJYzu47igC8Jd9mffFk', 73.8697, 1641915292, 1642455292),
('CUeQSH1MUnRpuE3Wqv_fI3nADvMpK_cg6VpYK37vgIw', 0.0262106, 1586215397, 1586647397),
('Jjl8HEbTSJpZBWoyXOajJXqciuUdngUbah061jwhliE', 18.0978, 1597337951, 1597373951),
('BpOOksi_R8S0isSN8M_Cuxq0NgzWMKFixbgP5tOUODU', 498.775, 1585756942, 1585929742),
('pm9DIO1-R3HkbKMpWAz6tiQ6qB0y0POpZni3nxK7uuM', 0.601122, 1585821820, 1585994620),
('XuJEDcv8ukwLqu1x6P90iBxBKvNDWdPR0Gu8IJfwp5U', 2, 1585769883, 1586288283),
('gaLyvd3WHMr5C1tE6VQEztZCcggy5piG3uEiX1VUYJ0', 498.418, 1642370432, 1642543232),
('frEiNi6jWleJtwFU3Zq5RcVwKk7HH7fLXLkEsas61eU', 72.2319, 1585995953, 1586535953),
('QduM75nGblH2CDKFyk0QeukPOwuEVDAUFE54ITnHM38', 49.6811, 1642371996, 1642911996),
('QDBtgOYcwUC_eln7BwKxS9_sS9sVvaRwhrvakKRwAtE', 67.3974, 1597357693, 1597897693),
('zDSuZfHkqf3IFfjKRdJgoUPSiDl9KPzSyXgyNuvuGXk', 19, 1585995946, 1586031946),
('2X063fuVjbUg4UeSmRXAC530SCE_QUW5Djet1KqnKMg', 9.0717, 1586215367, 1586244166),
('OMhkmdh1HUEdNPRi-Pe4279tbL5SQ-WMYf551VVvH8U', 17.2723, 1642370432, 1642406432),
('PZ3qJtO_NLbJfRIP-8b4ME4WA3xxc6n9nbCORSffyQ0', 4, 1642371242, 1642803242),
('3VrMU354Y_uVX22KD-pensoGyl9P8xi0fs5YhJZGrOk', 11, 1597332438, 1597361237),
('jYZVmDIUv4zK1lpk-7mKnoxglk4fFexvfIcI6WS9piE', 18.0056, 1597355085, 1597391085),
('d7vQpH5zB20WwobZFgmcyObT4wLprPi8dUTA_YomDC0', 499, 1642359428, 1642532228);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_confirmations`
--
ALTER TABLE `users_confirmations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `selector` (`selector`),
  ADD KEY `email_expires` (`email`,`expires`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_remembered`
--
ALTER TABLE `users_remembered`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_confirmations`
--
ALTER TABLE `users_confirmations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_remembered`
--
ALTER TABLE `users_remembered`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
