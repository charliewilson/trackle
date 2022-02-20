-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 19, 2022 at 11:53 AM
-- Server version: 5.7.37-0ubuntu0.18.04.1
-- PHP Version: 8.0.14

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

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `puzzle_no` int(11) NOT NULL,
  `guesses_no` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `guess_data` text COLLATE utf8mb4_unicode_ci NOT NULL
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
(16, 1, 212, '4', 'a:4:{i:0;s:5:\"GXYYX\";i:1;s:5:\"GXXYY\";i:2;s:5:\"GYYYX\";i:3;s:5:\"GGGGG\";}'),
(17, 4, 212, '5', 'a:5:{i:0;s:5:\"GXYXX\";i:1;s:5:\"GGYXX\";i:2;s:5:\"GGXXG\";i:3;s:5:\"GGGXG\";i:4;s:5:\"GGGGG\";}'),
(18, 5, 212, '3', 'a:3:{i:0;s:5:\"XXGXY\";i:1;s:5:\"GXGXG\";i:2;s:5:\"GGGGG\";}'),
(19, 7, 213, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"GGGXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(20, 7, 212, '3', 'a:3:{i:0;s:5:\"XYGXG\";i:1;s:5:\"XYGXG\";i:2;s:5:\"GGGGG\";}'),
(21, 7, 211, '3', 'a:3:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YGYXY\";i:2;s:5:\"GGGGG\";}'),
(22, 7, 210, '2', 'a:2:{i:0;s:5:\"XXYYX\";i:1;s:5:\"GGGGG\";}'),
(23, 4, 213, '3', 'a:3:{i:0;s:5:\"XXXYX\";i:1;s:5:\"GGGXX\";i:2;s:5:\"GGGGG\";}'),
(25, 8, 202, '4', 'a:4:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXYXY\";i:2;s:5:\"YXYXY\";i:3;s:5:\"GGGGG\";}'),
(26, 8, 203, '3', 'a:3:{i:0;s:5:\"GGXYX\";i:1;s:5:\"GGGXG\";i:2;s:5:\"GGGGG\";}'),
(27, 8, 204, '4', 'a:4:{i:0;s:5:\"XGXXG\";i:1;s:5:\"XGGXG\";i:2;s:5:\"XGGXG\";i:3;s:5:\"GGGGG\";}'),
(28, 8, 205, '5', 'a:5:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXXYY\";i:2;s:5:\"XYGXX\";i:3;s:5:\"XGXXY\";i:4;s:5:\"GGGGG\";}'),
(29, 8, 206, '3', 'a:3:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGGXY\";i:2;s:5:\"GGGGG\";}'),
(30, 8, 207, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"GYXXX\";i:2;s:5:\"XGXXG\";i:3;s:5:\"GGGGG\";}'),
(31, 8, 208, '5', 'a:5:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXXXY\";i:2;s:5:\"XYXXG\";i:3;s:5:\"YYYXG\";i:4;s:5:\"GGGGG\";}'),
(32, 8, 209, '5', 'a:5:{i:0;s:5:\"YXXXX\";i:1;s:5:\"XXGXG\";i:2;s:5:\"XGGXG\";i:3;s:5:\"XGXYG\";i:4;s:5:\"GGGGG\";}'),
(33, 8, 210, '3', 'a:3:{i:0;s:5:\"YXYXX\";i:1;s:5:\"YXXXX\";i:2;s:5:\"GGGGG\";}'),
(36, 8, 211, '5', 'a:5:{i:0;s:5:\"YYXYX\";i:1;s:5:\"YYYXX\";i:2;s:5:\"GXYYX\";i:3;s:5:\"GXYGX\";i:4;s:5:\"GGGGG\";}'),
(37, 8, 212, '', 'a:6:{i:0;s:5:\"XXGYG\";i:1;s:5:\"XYGXG\";i:2;s:5:\"GXGXG\";i:3;s:5:\"GXGXG\";i:4;s:5:\"GXGXG\";i:5;s:5:\"GXGXG\";}'),
(38, 8, 213, '5', 'a:5:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGGXX\";i:3;s:5:\"XGGXX\";i:4;s:5:\"GGGGG\";}'),
(48, 8, 201, '6', 'a:6:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XXXXX\";i:2;s:5:\"YGGXX\";i:3;s:5:\"XGGGG\";i:4;s:5:\"XGGXG\";i:5;s:5:\"GGGGG\";}'),
(49, 8, 200, '6', 'a:6:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XXXGG\";i:2;s:5:\"XXXGG\";i:3;s:5:\"XGXGG\";i:4;s:5:\"XGXGG\";i:5;s:5:\"GGGGG\";}'),
(50, 8, 198, '5', 'a:5:{i:0;s:5:\"XXXXY\";i:1;s:5:\"GGXXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGX\";i:4;s:5:\"GGGGG\";}'),
(51, 1, 213, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXYXX\";i:2;s:5:\"GYXXG\";i:3;s:5:\"GGGGG\";}'),
(52, 6, 212, '6', 'a:6:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXYY\";i:2;s:5:\"YXXYX\";i:3;s:5:\"XYGYX\";i:4;s:5:\"YXGGX\";i:5;s:5:\"GGGGG\";}'),
(53, 6, 211, '3', 'a:3:{i:0;s:5:\"XYXYX\";i:1;s:5:\"YXYYY\";i:2;s:5:\"GGGGG\";}'),
(54, 6, 210, '5', 'a:5:{i:0;s:5:\"YXYXX\";i:1;s:5:\"XXYGY\";i:2;s:5:\"YGXGX\";i:3;s:5:\"XGXGX\";i:4;s:5:\"GGGGG\";}'),
(55, 6, 209, '', 'a:6:{i:0;s:5:\"YXXXX\";i:1;s:5:\"XXXXX\";i:2;s:5:\"XGXYG\";i:3;s:5:\"XGYXG\";i:4;s:5:\"GGXXG\";i:5;s:5:\"GGXXG\";}'),
(56, 6, 208, '6', 'a:6:{i:0;s:5:\"XXXGX\";i:1;s:5:\"XXXGX\";i:2;s:5:\"XXXGG\";i:3;s:5:\"XXYYX\";i:4;s:5:\"XYYYY\";i:5;s:5:\"GGGGG\";}'),
(57, 6, 207, '6', 'a:6:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXYXX\";i:2;s:5:\"XYXXX\";i:3;s:5:\"YXXGG\";i:4;s:5:\"XGXGG\";i:5;s:5:\"GGGGG\";}'),
(58, 6, 206, '6', 'a:6:{i:0;s:5:\"XGGXX\";i:1;s:5:\"GGGXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGXX\";i:4;s:5:\"GGGXX\";i:5;s:5:\"GGGGG\";}'),
(59, 6, 205, '6', 'a:6:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYGXX\";i:2;s:5:\"YXGXG\";i:3;s:5:\"XYGXG\";i:4;s:5:\"YYXXG\";i:5;s:5:\"GGGGG\";}'),
(60, 6, 204, '', 'a:6:{i:0;s:5:\"XXYXX\";i:1;s:5:\"YGXXX\";i:2;s:5:\"XGGXX\";i:3;s:5:\"XGGYX\";i:4;s:5:\"XGGXG\";i:5;s:5:\"XGGXG\";}'),
(61, 6, 203, '6', 'a:6:{i:0;s:5:\"XXYXX\";i:1;s:5:\"YXXXX\";i:2;s:5:\"XYXGX\";i:3;s:5:\"XXGGX\";i:4;s:5:\"XGGGX\";i:5;s:5:\"GGGGG\";}'),
(62, 6, 202, '4', 'a:4:{i:0;s:5:\"XXXXY\";i:1;s:5:\"GGXXG\";i:2;s:5:\"GGGXG\";i:3;s:5:\"GGGGG\";}'),
(63, 6, 201, '4', 'a:4:{i:0;s:5:\"XGXYX\";i:1;s:5:\"YGGXX\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(64, 6, 213, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"YXXXG\";i:2;s:5:\"XXGYG\";i:3;s:5:\"XGGXX\";i:4;s:5:\"GGGGG\";}'),
(66, 4, 211, '3', 'a:3:{i:0;s:5:\"XYXGX\";i:1;s:5:\"XXXGG\";i:2;s:5:\"GGGGG\";}'),
(68, 4, 209, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXYG\";i:2;s:5:\"GGXXG\";i:3;s:5:\"GGGGG\";}'),
(69, 4, 208, '4', 'a:4:{i:0;s:5:\"XXYYX\";i:1;s:5:\"YXYXX\";i:2;s:5:\"XYXXY\";i:3;s:5:\"GGGGG\";}'),
(70, 4, 207, '5', 'a:5:{i:0;s:5:\"XYXYX\";i:1;s:5:\"YGXXY\";i:2;s:5:\"XGYGX\";i:3;s:5:\"YGXGG\";i:4;s:5:\"GGGGG\";}'),
(71, 4, 206, '4', 'a:4:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXXGY\";i:2;s:5:\"GXGGX\";i:3;s:5:\"GGGGG\";}'),
(72, 4, 205, '3', 'a:3:{i:0;s:5:\"XXGXX\";i:1;s:5:\"XYGXX\";i:2;s:5:\"GGGGG\";}'),
(73, 4, 204, '4', 'a:4:{i:0;s:5:\"XYYXX\";i:1;s:5:\"XYXXY\";i:2;s:5:\"YYXGX\";i:3;s:5:\"GGGGG\";}'),
(74, 4, 202, '4', 'a:4:{i:0;s:5:\"YXYXX\";i:1;s:5:\"YXYXY\";i:2;s:5:\"GGGGX\";i:3;s:5:\"GGGGG\";}'),
(75, 4, 201, '4', 'a:4:{i:0;s:5:\"YXYXX\";i:1;s:5:\"YXYXY\";i:2;s:5:\"GGGGX\";i:3;s:5:\"GGGGG\";}'),
(77, 9, 213, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"GGGXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(78, 4, 210, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"GGXGX\";i:2;s:5:\"GGGGG\";}'),
(79, 9, 203, '3', 'a:3:{i:0;s:5:\"XXGXX\";i:1;s:5:\"XGGGX\";i:2;s:5:\"GGGGG\";}'),
(80, 9, 204, '6', 'a:6:{i:0;s:5:\"XYYXX\";i:1;s:5:\"YGXYX\";i:2;s:5:\"XXGYX\";i:3;s:5:\"XGGXG\";i:4;s:5:\"XGGXG\";i:5;s:5:\"GGGGG\";}'),
(81, 9, 205, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXXY\";i:2;s:5:\"XYXGG\";i:3;s:5:\"XYXGG\";i:4;s:5:\"GGGGG\";}'),
(82, 9, 206, '3', 'a:3:{i:0;s:5:\"XXGXX\";i:1;s:5:\"XGGXX\";i:2;s:5:\"GGGGG\";}'),
(83, 9, 208, '6', 'a:6:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XYYXX\";i:2;s:5:\"XYXGX\";i:3;s:5:\"GXXGX\";i:4;s:5:\"XXXXG\";i:5;s:5:\"GGGGG\";}'),
(84, 9, 210, '3', 'a:3:{i:0;s:5:\"XXXYX\";i:1;s:5:\"GGYXX\";i:2;s:5:\"GGGGG\";}'),
(85, 9, 211, '3', 'a:3:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YGYYX\";i:2;s:5:\"GGGGG\";}'),
(86, 9, 212, '2', 'a:2:{i:0;s:5:\"XYYXX\";i:1;s:5:\"GGGGG\";}'),
(87, 10, 202, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGGGG\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(88, 10, 203, '5', 'a:5:{i:0;s:5:\"YXXXY\";i:1;s:5:\"XYYXX\";i:2;s:5:\"XGGGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(89, 10, 204, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XYYXG\";i:2;s:5:\"YGXXX\";i:3;s:5:\"XGGXG\";i:4;s:5:\"GGGGG\";}'),
(90, 10, 205, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XXYXX\";i:2;s:5:\"XYYXY\";i:3;s:5:\"GGGXY\";i:4;s:5:\"GGGGG\";}'),
(91, 10, 206, '4', 'a:4:{i:0;s:5:\"XXXGY\";i:1;s:5:\"GXYXX\";i:2;s:5:\"GYYXX\";i:3;s:5:\"GGGGG\";}'),
(92, 10, 207, '5', 'a:5:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YYXYX\";i:2;s:5:\"YXYYX\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(93, 10, 208, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXGX\";i:2;s:5:\"GXXGX\";i:3;s:5:\"GXXGX\";i:4;s:5:\"GGGGG\";}'),
(94, 10, 209, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"YYYXX\";i:2;s:5:\"YGXYY\";i:3;s:5:\"GGGGG\";}'),
(95, 10, 210, '3', 'a:3:{i:0;s:5:\"GYXXX\";i:1;s:5:\"YXYXY\";i:2;s:5:\"GGGGG\";}'),
(96, 10, 211, '4', 'a:4:{i:0;s:5:\"XXYXY\";i:1;s:5:\"YYXXX\";i:2;s:5:\"YYXGG\";i:3;s:5:\"GGGGG\";}'),
(97, 10, 212, '6', 'a:6:{i:0;s:5:\"XYXXG\";i:1;s:5:\"XYXXY\";i:2;s:5:\"YXGYG\";i:3;s:5:\"GXGGG\";i:4;s:5:\"GXGGG\";i:5;s:5:\"GGGGG\";}'),
(98, 10, 213, '6', 'a:6:{i:0;s:5:\"GXGXX\";i:1;s:5:\"GGGXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGXX\";i:4;s:5:\"XGXXX\";i:5;s:5:\"GGGGG\";}'),
(99, 5, 213, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGGYX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(100, 5, 211, '3', 'a:3:{i:0;s:5:\"YYXXY\";i:1;s:5:\"GYXXG\";i:2;s:5:\"GGGGG\";}'),
(101, 5, 210, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XXXXX\";i:2;s:5:\"GGYYX\";i:3;s:5:\"GGGGG\";}'),
(102, 5, 209, '3', 'a:3:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XGGXG\";i:2;s:5:\"GGGGG\";}'),
(103, 5, 208, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XYXXX\";i:2;s:5:\"XXXYX\";i:3;s:5:\"GGGGG\";}'),
(104, 5, 207, '5', 'a:5:{i:0;s:5:\"XXYXX\";i:1;s:5:\"YYXXX\";i:2;s:5:\"XXYYX\";i:3;s:5:\"XGXGG\";i:4;s:5:\"GGGGG\";}'),
(105, 5, 206, '2', 'a:2:{i:0;s:5:\"XGXXG\";i:1;s:5:\"GGGGG\";}'),
(106, 5, 205, '5', 'a:5:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXXYY\";i:2;s:5:\"XYGXX\";i:3;s:5:\"XXGGG\";i:4;s:5:\"GGGGG\";}'),
(107, 5, 204, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXXGG\";i:2;s:5:\"GGGGG\";}'),
(108, 5, 203, '5', 'a:5:{i:0;s:5:\"XXGYX\";i:1;s:5:\"XXGXY\";i:2;s:5:\"XGGGX\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(109, 5, 202, '3', 'a:3:{i:0;s:5:\"XXXYX\";i:1;s:5:\"GGXXX\";i:2;s:5:\"GGGGG\";}'),
(110, 5, 201, '3', 'a:3:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XGGXY\";i:2;s:5:\"GGGGG\";}'),
(111, 7, 209, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XGXXG\";i:2;s:5:\"XGGXG\";i:3;s:5:\"XGGXG\";i:4;s:5:\"GGGGG\";}'),
(112, 7, 208, '6', 'a:6:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XYXXX\";i:2;s:5:\"YXYYX\";i:3;s:5:\"XYGXY\";i:4;s:5:\"GXGGX\";i:5;s:5:\"GGGGG\";}'),
(113, 7, 207, '6', 'a:6:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XYXYG\";i:2;s:5:\"XGXGG\";i:3;s:5:\"XGXGG\";i:4;s:5:\"XGXGG\";i:5;s:5:\"GGGGG\";}'),
(114, 7, 206, '3', 'a:3:{i:0;s:5:\"YXXGY\";i:1;s:5:\"GGXYY\";i:2;s:5:\"GGGGG\";}'),
(115, 7, 205, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"YXYXX\";i:2;s:5:\"XXXYY\";i:3;s:5:\"XGYYX\";i:4;s:5:\"GGGGG\";}'),
(116, 7, 204, '', 'a:6:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XXXXX\";i:2;s:5:\"XYXXY\";i:3;s:5:\"YXXYY\";i:4;s:5:\"YYXYX\";i:5;s:5:\"XGXYY\";}'),
(117, 7, 203, '', 'a:6:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXGXX\";i:2;s:5:\"XXGGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"XGGGG\";i:5;s:5:\"XGGGG\";}'),
(118, 7, 202, '5', 'a:5:{i:0;s:5:\"XXYXY\";i:1;s:5:\"GXXYX\";i:2;s:5:\"GGXXX\";i:3;s:5:\"GGGXX\";i:4;s:5:\"GGGGG\";}'),
(119, 5, 214, '2', 'a:2:{i:0;s:5:\"YXXXX\";i:1;s:5:\"GGGGG\";}'),
(120, 8, 214, '2', 'a:2:{i:0;s:5:\"YGGXX\";i:1;s:5:\"GGGGG\";}'),
(121, 1, 214, '4', 'a:4:{i:0;s:5:\"XYGXX\";i:1;s:5:\"GXGGG\";i:2;s:5:\"GXGGG\";i:3;s:5:\"GGGGG\";}'),
(122, 7, 214, '5', 'a:5:{i:0;s:5:\"XXGGX\";i:1;s:5:\"YXGGX\";i:2;s:5:\"XXGGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(123, 6, 214, '5', 'a:5:{i:0;s:5:\"XXGXX\";i:1;s:5:\"YXGXX\";i:2;s:5:\"XXGGG\";i:3;s:5:\"GXGGG\";i:4;s:5:\"GGGGG\";}'),
(124, 9, 214, '3', 'a:3:{i:0;s:5:\"YXGXX\";i:1;s:5:\"XGGGX\";i:2;s:5:\"GGGGG\";}'),
(125, 10, 214, '3', 'a:3:{i:0;s:5:\"GYYXX\";i:1;s:5:\"GGXYX\";i:2;s:5:\"GGGGG\";}'),
(126, 4, 214, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"GXGXX\";i:2;s:5:\"GGGGG\";}'),
(127, 4, 215, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"GGXXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(128, 9, 215, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XGXYX\";i:2;s:5:\"YGXXX\";i:3;s:5:\"GGYGX\";i:4;s:5:\"GGGGG\";}'),
(129, 7, 215, '3', 'a:3:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XYYYG\";i:2;s:5:\"GGGGG\";}'),
(130, 5, 215, '4', 'a:4:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XXYYX\";i:2;s:5:\"YXYGY\";i:3;s:5:\"GGGGG\";}'),
(131, 8, 215, '5', 'a:5:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"GGXXX\";i:3;s:5:\"GGYGX\";i:4;s:5:\"GGGGG\";}'),
(132, 1, 215, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XGYYX\";i:2;s:5:\"GGYGX\";i:3;s:5:\"GGGGG\";}'),
(133, 6, 215, '3', 'a:3:{i:0;s:5:\"XGXXY\";i:1;s:5:\"GXXXX\";i:2;s:5:\"GGGGG\";}'),
(134, 10, 215, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XXYXY\";i:2;s:5:\"GGYGX\";i:3;s:5:\"GGGGG\";}'),
(135, 9, 216, '3', 'a:3:{i:0;s:5:\"XYXXG\";i:1;s:5:\"GGXXG\";i:2;s:5:\"GGGGG\";}'),
(136, 1, 216, '2', 'a:2:{i:0;s:5:\"GGGGX\";i:1;s:5:\"GGGGG\";}'),
(137, 8, 216, '2', 'a:2:{i:0;s:5:\"XXGXX\";i:1;s:5:\"GGGGG\";}'),
(138, 4, 216, '2', 'a:2:{i:0;s:5:\"XGGGG\";i:1;s:5:\"GGGGG\";}'),
(139, 5, 216, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"GGGGX\";i:2;s:5:\"GGGGX\";i:3;s:5:\"GGGGG\";}'),
(140, 10, 216, '3', 'a:3:{i:0;s:5:\"XXXXY\";i:1;s:5:\"GYXXX\";i:2;s:5:\"GGGGG\";}'),
(141, 6, 216, '3', 'a:3:{i:0;s:5:\"XGXGX\";i:1;s:5:\"XGXGG\";i:2;s:5:\"GGGGG\";}'),
(142, 10, 217, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGGYX\";i:3;s:5:\"XGGXG\";i:4;s:5:\"GGGGG\";}'),
(143, 6, 217, '4', 'a:4:{i:0;s:5:\"XXYXG\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XXYGG\";i:3;s:5:\"GGGGG\";}'),
(144, 8, 217, '4', 'a:4:{i:0;s:5:\"XXYXG\";i:1;s:5:\"XXXXX\";i:2;s:5:\"YGYXG\";i:3;s:5:\"GGGGG\";}'),
(145, 9, 217, '5', 'a:5:{i:0;s:5:\"XXXYY\";i:1;s:5:\"XXYYX\";i:2;s:5:\"XYYXG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(146, 5, 217, '4', 'a:4:{i:0;s:5:\"XXYXG\";i:1;s:5:\"YGXGG\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(147, 1, 217, '5', 'a:5:{i:0;s:5:\"XXYXG\";i:1;s:5:\"XGXXG\";i:2;s:5:\"XGXXG\";i:3;s:5:\"XGXXG\";i:4;s:5:\"GGGGG\";}'),
(148, 4, 217, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XXXXG\";i:2;s:5:\"XGGXG\";i:3;s:5:\"GGGGG\";}'),
(149, 7, 217, '6', 'a:6:{i:0;s:5:\"XXYYG\";i:1;s:5:\"XXXYY\";i:2;s:5:\"XGGXG\";i:3;s:5:\"XGGXG\";i:4;s:5:\"GGGXG\";i:5;s:5:\"GGGGG\";}'),
(150, 8, 218, '3', 'a:3:{i:0;s:5:\"XGGXX\";i:1;s:5:\"XXYXX\";i:2;s:5:\"GGGGG\";}'),
(151, 1, 218, '2', 'a:2:{i:0;s:5:\"GXGGX\";i:1;s:5:\"GGGGG\";}'),
(152, 5, 218, '3', 'a:3:{i:0;s:5:\"YXXYX\";i:1;s:5:\"GGXXX\";i:2;s:5:\"GGGGG\";}'),
(153, 6, 218, '4', 'a:4:{i:0;s:5:\"XXYYX\";i:1;s:5:\"YGXXX\";i:2;s:5:\"XGXYX\";i:3;s:5:\"GGGGG\";}'),
(154, 9, 218, '2', 'a:2:{i:0;s:5:\"XXGYX\";i:1;s:5:\"GGGGG\";}'),
(155, 10, 218, '4', 'a:4:{i:0;s:5:\"XXXXY\";i:1;s:5:\"YYXXX\";i:2;s:5:\"YGGYX\";i:3;s:5:\"GGGGG\";}'),
(156, 4, 218, '3', 'a:3:{i:0;s:5:\"XXYXX\";i:1;s:5:\"YXGXX\";i:2;s:5:\"GGGGG\";}'),
(157, 1, 219, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYGXX\";i:2;s:5:\"XXGXX\";i:3;s:5:\"GGGGG\";}'),
(158, 5, 219, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXYX\";i:2;s:5:\"XYXYX\";i:3;s:5:\"GGGGG\";}'),
(159, 6, 219, '5', 'a:5:{i:0;s:5:\"XXXXY\";i:1;s:5:\"YYXXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGXX\";i:4;s:5:\"GGGGG\";}'),
(160, 8, 219, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXGX\";i:2;s:5:\"XXGYX\";i:3;s:5:\"GGGGG\";}'),
(161, 4, 219, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYGYX\";i:2;s:5:\"GGGGG\";}'),
(162, 10, 219, '6', 'a:6:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXGXX\";i:2;s:5:\"XXGYX\";i:3;s:5:\"XYGYX\";i:4;s:5:\"XYGXY\";i:5;s:5:\"GGGGG\";}'),
(163, 1, 220, '3', 'a:3:{i:0;s:5:\"GXXYX\";i:1;s:5:\"GXXGG\";i:2;s:5:\"GGGGG\";}'),
(164, 5, 220, '3', 'a:3:{i:0;s:5:\"XXYYX\";i:1;s:5:\"YYXXY\";i:2;s:5:\"GGGGG\";}'),
(165, 4, 220, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYGYX\";i:2;s:5:\"GGGGG\";}'),
(166, 6, 220, '5', 'a:5:{i:0;s:5:\"YYXYX\";i:1;s:5:\"GYXXX\";i:2;s:5:\"GXYYX\";i:3;s:5:\"GXYXX\";i:4;s:5:\"GGGGG\";}'),
(167, 6, 221, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXGGX\";i:2;s:5:\"GGGGG\";}'),
(168, 7, 221, '6', 'a:6:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXGXX\";i:2;s:5:\"XXGGG\";i:3;s:5:\"XXGGG\";i:4;s:5:\"XXGGG\";i:5;s:5:\"GGGGG\";}'),
(169, 7, 220, '4', 'a:4:{i:0;s:5:\"YYXXX\";i:1;s:5:\"YXXYX\";i:2;s:5:\"YGXGX\";i:3;s:5:\"GGGGG\";}'),
(170, 5, 221, '4', 'a:4:{i:0;s:5:\"XXGXX\";i:1;s:5:\"XXGXX\";i:2;s:5:\"GXGXX\";i:3;s:5:\"GGGGG\";}'),
(171, 1, 221, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"YXXXX\";i:2;s:5:\"YGGXX\";i:3;s:5:\"GGGGG\";}'),
(172, 4, 221, '4', 'a:4:{i:0;s:5:\"YXXXX\";i:1;s:5:\"YXXXX\";i:2;s:5:\"XXGXX\";i:3;s:5:\"GGGGG\";}'),
(173, 9, 219, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXXX\";i:2;s:5:\"XYGXX\";i:3;s:5:\"GGGGG\";}'),
(174, 9, 221, '3', 'a:3:{i:0;s:5:\"XYXXY\";i:1;s:5:\"YXGXY\";i:2;s:5:\"GGGGG\";}'),
(175, 9, 220, '5', 'a:5:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXXY\";i:2;s:5:\"XGYXY\";i:3;s:5:\"GGXGX\";i:4;s:5:\"GGGGG\";}'),
(176, 8, 221, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXXXY\";i:2;s:5:\"YYXXX\";i:3;s:5:\"GGGGG\";}'),
(177, 6, 222, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXYXY\";i:2;s:5:\"GGYYX\";i:3;s:5:\"GGGGG\";}'),
(178, 1, 222, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXXGX\";i:2;s:5:\"XYXGX\";i:3;s:5:\"GGGGG\";}'),
(179, 5, 222, '3', 'a:3:{i:0;s:5:\"XXYYX\";i:1;s:5:\"GGGYX\";i:2;s:5:\"GGGGG\";}'),
(180, 8, 222, '4', 'a:4:{i:0;s:5:\"YGXXX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"XXXXX\";i:3;s:5:\"GGGGG\";}'),
(181, 7, 222, '5', 'a:5:{i:0;s:5:\"YXXGX\";i:1;s:5:\"XXGGG\";i:2;s:5:\"XXGGG\";i:3;s:5:\"XXGGG\";i:4;s:5:\"GGGGG\";}'),
(182, 9, 222, '6', 'a:6:{i:0;s:5:\"XXXYX\";i:1;s:5:\"YXYXX\";i:2;s:5:\"XGYXX\";i:3;s:5:\"XGGXG\";i:4;s:5:\"XGGGG\";i:5;s:5:\"GGGGG\";}'),
(183, 4, 222, '3', 'a:3:{i:0;s:5:\"GXYYX\";i:1;s:5:\"GGYYX\";i:2;s:5:\"GGGGG\";}'),
(184, 6, 223, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"GGGXG\";i:3;s:5:\"GGGXG\";i:4;s:5:\"GGGGG\";}'),
(185, 1, 223, '4', 'a:4:{i:0;s:5:\"XYXXY\";i:1;s:5:\"GXXYY\";i:2;s:5:\"GGGXG\";i:3;s:5:\"GGGGG\";}'),
(186, 5, 223, '3', 'a:3:{i:0;s:5:\"XYXYX\";i:1;s:5:\"YGXXX\";i:2;s:5:\"GGGGG\";}'),
(187, 7, 223, '3', 'a:3:{i:0;s:5:\"XYXXY\";i:1;s:5:\"YGXXX\";i:2;s:5:\"GGGGG\";}'),
(188, 8, 223, '4', 'a:4:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XGXXG\";i:2;s:5:\"XGGXG\";i:3;s:5:\"GGGGG\";}'),
(189, 4, 223, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"YGYXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGX\";i:4;s:5:\"GGGGG\";}'),
(190, 9, 223, '6', 'a:6:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXXXY\";i:2;s:5:\"XGGXX\";i:3;s:5:\"XGGXG\";i:4;s:5:\"XGGGG\";i:5;s:5:\"GGGGG\";}'),
(191, 1, 224, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XGGXX\";i:2;s:5:\"XGGXG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(192, 5, 224, '2', 'a:2:{i:0;s:5:\"XYYYG\";i:1;s:5:\"GGGGG\";}'),
(193, 8, 224, '4', 'a:4:{i:0;s:5:\"GXXXX\";i:1;s:5:\"GXGXX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(194, 6, 224, '4', 'a:4:{i:0;s:5:\"XXYYX\";i:1;s:5:\"YYYXX\";i:2;s:5:\"GYYYX\";i:3;s:5:\"GGGGG\";}'),
(195, 9, 224, '4', 'a:4:{i:0;s:5:\"XYXYX\";i:1;s:5:\"YYXYX\";i:2;s:5:\"GYGXX\";i:3;s:5:\"GGGGG\";}'),
(196, 9, 225, '5', 'a:5:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXGGX\";i:2;s:5:\"XGGGX\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(197, 1, 225, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXXGX\";i:2;s:5:\"GGXGG\";i:3;s:5:\"GGGGG\";}'),
(198, 5, 225, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XYXXX\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(199, 7, 225, '6', 'a:6:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGGGX\";i:2;s:5:\"XGGGX\";i:3;s:5:\"XGGGX\";i:4;s:5:\"XGGGG\";i:5;s:5:\"GGGGG\";}'),
(200, 8, 225, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XXGGX\";i:2;s:5:\"XGGGX\";i:3;s:5:\"GGGGG\";}'),
(201, 6, 225, '5', 'a:5:{i:0;s:5:\"YGXGX\";i:1;s:5:\"XGGGX\";i:2;s:5:\"XGGGX\";i:3;s:5:\"YGGGX\";i:4;s:5:\"GGGGG\";}'),
(202, 1, 226, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"GXYXX\";i:2;s:5:\"GGXXG\";i:3;s:5:\"GGGGG\";}'),
(203, 5, 226, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"YXYXX\";i:2;s:5:\"GGGGG\";}'),
(204, 8, 226, '3', 'a:3:{i:0;s:5:\"XXXXG\";i:1;s:5:\"YXYYG\";i:2;s:5:\"GGGGG\";}'),
(205, 6, 226, '5', 'a:5:{i:0;s:5:\"XXXXG\";i:1;s:5:\"XGGGG\";i:2;s:5:\"XGGGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(206, 7, 226, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"YYYXX\";i:2;s:5:\"YYXXX\";i:3;s:5:\"GGGGG\";}'),
(207, 9, 226, '4', 'a:4:{i:0;s:5:\"XXXXG\";i:1;s:5:\"XYXXG\";i:2;s:5:\"XYXXG\";i:3;s:5:\"GGGGG\";}'),
(208, 6, 227, '4', 'a:4:{i:0;s:5:\"XXXGG\";i:1;s:5:\"XYXGG\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(209, 5, 227, '3', 'a:3:{i:0;s:5:\"XXXGG\";i:1;s:5:\"GXXGG\";i:2;s:5:\"GGGGG\";}'),
(210, 8, 227, '2', 'a:2:{i:0;s:5:\"XYXGY\";i:1;s:5:\"GGGGG\";}'),
(211, 7, 227, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XXYXX\";i:2;s:5:\"XYYYY\";i:3;s:5:\"YYGXG\";i:4;s:5:\"GGGGG\";}'),
(212, 1, 227, '5', 'a:5:{i:0;s:5:\"YXXXG\";i:1;s:5:\"XXGXG\";i:2;s:5:\"YXGXG\";i:3;s:5:\"XXGGG\";i:4;s:5:\"GGGGG\";}'),
(213, 1, 228, '4', 'a:4:{i:0;s:5:\"YXGXX\";i:1;s:5:\"XGGGX\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(214, 5, 228, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"YXXXG\";i:2;s:5:\"XGYYG\";i:3;s:5:\"GGGGG\";}'),
(215, 8, 228, '3', 'a:3:{i:0;s:5:\"XXXGG\";i:1;s:5:\"XGGXX\";i:2;s:5:\"GGGGG\";}'),
(216, 6, 228, '4', 'a:4:{i:0;s:5:\"XGXXG\";i:1;s:5:\"XGXYX\";i:2;s:5:\"XGGXG\";i:3;s:5:\"GGGGG\";}'),
(217, 7, 228, '6', 'a:6:{i:0;s:5:\"XXGXX\";i:1;s:5:\"YXGXX\";i:2;s:5:\"YYGXX\";i:3;s:5:\"XXGGG\";i:4;s:5:\"XGGGG\";i:5;s:5:\"GGGGG\";}'),
(218, 9, 228, '3', 'a:3:{i:0;s:5:\"XXXXG\";i:1;s:5:\"YXGXG\";i:2;s:5:\"GGGGG\";}'),
(219, 11, 228, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGXXG\";i:3;s:5:\"GGGGG\";}'),
(220, 1, 229, '3', 'a:3:{i:0;s:5:\"GXXXX\";i:1;s:5:\"GXXXG\";i:2;s:5:\"GGGGG\";}'),
(221, 8, 229, '3', 'a:3:{i:0;s:5:\"YXGYX\";i:1;s:5:\"GXGGX\";i:2;s:5:\"GGGGG\";}'),
(222, 5, 229, '3', 'a:3:{i:0;s:5:\"GXYYX\";i:1;s:5:\"GGGGX\";i:2;s:5:\"GGGGG\";}'),
(223, 11, 229, '3', 'a:3:{i:0;s:5:\"YXXXX\";i:1;s:5:\"YYXYY\";i:2;s:5:\"GGGGG\";}'),
(224, 6, 229, '6', 'a:6:{i:0;s:5:\"XXYXX\";i:1;s:5:\"GXXYY\";i:2;s:5:\"GXYYX\";i:3;s:5:\"GXGGX\";i:4;s:5:\"GGGGX\";i:5;s:5:\"GGGGG\";}'),
(225, 9, 229, '2', 'a:2:{i:0;s:5:\"GXGGX\";i:1;s:5:\"GGGGG\";}'),
(226, 6, 230, '4', 'a:4:{i:0;s:5:\"XXGGG\";i:1;s:5:\"XXGGG\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(227, 1, 230, '4', 'a:4:{i:0;s:5:\"XYXYY\";i:1;s:5:\"YGYYX\";i:2;s:5:\"XGGGG\";i:3;s:5:\"GGGGG\";}'),
(228, 8, 230, '3', 'a:3:{i:0;s:5:\"XYYXG\";i:1;s:5:\"XXGGG\";i:2;s:5:\"GGGGG\";}'),
(229, 5, 230, '2', 'a:2:{i:0;s:5:\"XGGGX\";i:1;s:5:\"GGGGG\";}'),
(230, 7, 230, '4', 'a:4:{i:0;s:5:\"XXXXY\";i:1;s:5:\"YYYXX\";i:2;s:5:\"XYYYX\";i:3;s:5:\"GGGGG\";}'),
(231, 11, 230, '4', 'a:4:{i:0;s:5:\"YGXXY\";i:1;s:5:\"XGGGX\";i:2;s:5:\"GGGGX\";i:3;s:5:\"GGGGG\";}'),
(232, 9, 230, '3', 'a:3:{i:0;s:5:\"XYXXG\";i:1;s:5:\"XXYXG\";i:2;s:5:\"GGGGG\";}'),
(233, 9, 231, '5', 'a:5:{i:0;s:5:\"YXXYX\";i:1;s:5:\"XYYXX\";i:2;s:5:\"XXYXG\";i:3;s:5:\"GYGXG\";i:4;s:5:\"GGGGG\";}'),
(234, 8, 231, '4', 'a:4:{i:0;s:5:\"XXYXG\";i:1;s:5:\"XXXXY\";i:2;s:5:\"YGGYG\";i:3;s:5:\"GGGGG\";}'),
(235, 1, 231, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"GGGXX\";i:2;s:5:\"GGGXY\";i:3;s:5:\"GGGGG\";}'),
(236, 7, 231, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXGYG\";i:2;s:5:\"GXGXG\";i:3;s:5:\"GGGGG\";}'),
(237, 6, 231, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XGYXG\";i:2;s:5:\"XGGYG\";i:3;s:5:\"GGGGG\";}'),
(238, 11, 231, '2', 'a:2:{i:0;s:5:\"GGGXX\";i:1;s:5:\"GGGGG\";}'),
(239, 9, 232, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXGXY\";i:2;s:5:\"GXGXX\";i:3;s:5:\"GGGGG\";}'),
(240, 8, 232, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XXGXX\";i:2;s:5:\"GYGXY\";i:3;s:5:\"GGGGG\";}'),
(241, 7, 232, '4', 'a:4:{i:0;s:5:\"XXGXX\";i:1;s:5:\"GXGXY\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(242, 1, 232, '4', 'a:4:{i:0;s:5:\"GXXXY\";i:1;s:5:\"GXGYX\";i:2;s:5:\"GGGXX\";i:3;s:5:\"GGGGG\";}'),
(243, 6, 232, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"GXXXX\";i:2;s:5:\"GXXXX\";i:3;s:5:\"GGGXX\";i:4;s:5:\"GGGGG\";}'),
(244, 11, 232, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YYXXX\";i:2;s:5:\"GYYYX\";i:3;s:5:\"GGGGG\";}'),
(245, 5, 232, '3', 'a:3:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXGGY\";i:2;s:5:\"GGGGG\";}'),
(246, 5, 231, '5', 'a:5:{i:0;s:5:\"XYXYX\";i:1;s:5:\"YYXXX\";i:2;s:5:\"XGYXG\";i:3;s:5:\"GGXYG\";i:4;s:5:\"GGGGG\";}'),
(247, 7, 233, '5', 'a:5:{i:0;s:5:\"XYXXY\";i:1;s:5:\"XXXGG\";i:2;s:5:\"XXYGG\";i:3;s:5:\"XYGGG\";i:4;s:5:\"GGGGG\";}'),
(248, 1, 233, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGXXX\";i:3;s:5:\"GGGGG\";}'),
(249, 11, 233, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"YXXXX\";i:2;s:5:\"XYYXX\";i:3;s:5:\"GXXGG\";i:4;s:5:\"GGGGG\";}'),
(250, 8, 233, '5', 'a:5:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XXXXY\";i:2;s:5:\"XXXXX\";i:3;s:5:\"XGYGG\";i:4;s:5:\"GGGGG\";}'),
(251, 6, 233, '', 'a:6:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXXY\";i:2;s:5:\"YYXYX\";i:3;s:5:\"YYXYX\";i:4;s:5:\"XYYGY\";i:5;s:5:\"YXYGG\";}'),
(252, 9, 233, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"YYXYX\";i:2;s:5:\"YXXGG\";i:3;s:5:\"XGXGG\";i:4;s:5:\"GGGGG\";}'),
(253, 8, 234, '5', 'a:5:{i:0;s:5:\"YYGXX\";i:1;s:5:\"XGGXG\";i:2;s:5:\"XXXYX\";i:3;s:5:\"XGGXG\";i:4;s:5:\"GGGGG\";}'),
(254, 5, 234, '2', 'a:2:{i:0;s:5:\"YGXXG\";i:1;s:5:\"GGGGG\";}'),
(255, 1, 234, '2', 'a:2:{i:0;s:5:\"XXXYG\";i:1;s:5:\"GGGGG\";}'),
(256, 11, 234, '3', 'a:3:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXGGG\";i:2;s:5:\"GGGGG\";}'),
(257, 6, 234, '5', 'a:5:{i:0;s:5:\"XGXXG\";i:1;s:5:\"XGXGG\";i:2;s:5:\"XGGGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(258, 6, 235, '5', 'a:5:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YYYYX\";i:2;s:5:\"XGGGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(259, 9, 235, '3', 'a:3:{i:0;s:5:\"XYYYX\";i:1;s:5:\"GYYXX\";i:2;s:5:\"GGGGG\";}'),
(260, 7, 235, '5', 'a:5:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"YYYYX\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(261, 7, 234, '5', 'a:5:{i:0;s:5:\"XGXXG\";i:1;s:5:\"XGGXG\";i:2;s:5:\"XGGXG\";i:3;s:5:\"XGGXG\";i:4;s:5:\"GGGGG\";}'),
(262, 8, 235, '4', 'a:4:{i:0;s:5:\"YXXXX\";i:1;s:5:\"XYXXX\";i:2;s:5:\"XGGXX\";i:3;s:5:\"GGGGG\";}'),
(263, 5, 235, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XYYYX\";i:2;s:5:\"YYYXX\";i:3;s:5:\"GGGGG\";}'),
(264, 5, 233, '5', 'a:5:{i:0;s:5:\"XYXYX\";i:1;s:5:\"XYXGY\";i:2;s:5:\"YXGGX\";i:3;s:5:\"XXGGG\";i:4;s:5:\"GGGGG\";}'),
(265, 11, 235, '3', 'a:3:{i:0;s:5:\"XYYXX\";i:1;s:5:\"XYYYX\";i:2;s:5:\"GGGGG\";}'),
(266, 1, 235, '3', 'a:3:{i:0;s:5:\"XXXXG\";i:1;s:5:\"XGGGG\";i:2;s:5:\"GGGGG\";}'),
(267, 1, 236, '3', 'a:3:{i:0;s:5:\"YXXXG\";i:1;s:5:\"GXXGG\";i:2;s:5:\"GGGGG\";}'),
(268, 7, 236, '4', 'a:4:{i:0;s:5:\"YXXXG\";i:1;s:5:\"XGXYG\";i:2;s:5:\"YGGXG\";i:3;s:5:\"GGGGG\";}'),
(269, 11, 236, '3', 'a:3:{i:0;s:5:\"XXXYX\";i:1;s:5:\"YYYXG\";i:2;s:5:\"GGGGG\";}'),
(270, 9, 236, '4', 'a:4:{i:0;s:5:\"YXXYX\";i:1;s:5:\"XXGGX\";i:2;s:5:\"XXGGG\";i:3;s:5:\"GGGGG\";}'),
(271, 6, 236, '6', 'a:6:{i:0;s:5:\"XYYXX\";i:1;s:5:\"XXYYX\";i:2;s:5:\"GXYXG\";i:3;s:5:\"GGXXG\";i:4;s:5:\"GGXGG\";i:5;s:5:\"GGGGG\";}'),
(272, 8, 236, '4', 'a:4:{i:0;s:5:\"XXYXG\";i:1;s:5:\"YXXXX\";i:2;s:5:\"YYXXG\";i:3;s:5:\"GGGGG\";}'),
(273, 5, 236, '2', 'a:2:{i:0;s:5:\"GXXYY\";i:1;s:5:\"GGGGG\";}'),
(274, 6, 237, '6', 'a:6:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGYGX\";i:3;s:5:\"XGXGX\";i:4;s:5:\"GGXYX\";i:5;s:5:\"GGGGG\";}'),
(275, 7, 237, '', 'a:6:{i:0;s:5:\"GYXXY\";i:1;s:5:\"GXXGG\";i:2;s:5:\"GXXGG\";i:3;s:5:\"GXXGG\";i:4;s:5:\"GXXGG\";i:5;s:5:\"GXXGG\";}'),
(276, 1, 237, '5', 'a:5:{i:0;s:5:\"XXYXG\";i:1;s:5:\"XXXGG\";i:2;s:5:\"YXXGG\";i:3;s:5:\"XYYGG\";i:4;s:5:\"GGGGG\";}'),
(277, 8, 237, '3', 'a:3:{i:0;s:5:\"YYXXY\";i:1;s:5:\"XGXXX\";i:2;s:5:\"GGGGG\";}'),
(278, 11, 237, '3', 'a:3:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYXYX\";i:2;s:5:\"GGGGG\";}'),
(279, 9, 238, '5', 'a:5:{i:0;s:5:\"YYYXX\";i:1;s:5:\"XYYYX\";i:2;s:5:\"XYYYX\";i:3;s:5:\"YYGXX\";i:4;s:5:\"GGGGG\";}'),
(280, 8, 238, '4', 'a:4:{i:0;s:5:\"XYYXX\";i:1;s:5:\"XGXYX\";i:2;s:5:\"YGGXY\";i:3;s:5:\"GGGGG\";}'),
(281, 7, 238, '3', 'a:3:{i:0;s:5:\"GYXXX\";i:1;s:5:\"GXXYY\";i:2;s:5:\"GGGGG\";}'),
(282, 6, 238, '3', 'a:3:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XYGXY\";i:2;s:5:\"GGGGG\";}'),
(283, 11, 238, '4', 'a:4:{i:0;s:5:\"YGXXX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"XXYXG\";i:3;s:5:\"GGGGG\";}'),
(284, 8, 239, '4', 'a:4:{i:0;s:5:\"XYXYX\";i:1;s:5:\"XXYXX\";i:2;s:5:\"GGXGG\";i:3;s:5:\"GGGGG\";}'),
(285, 9, 239, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XYYXY\";i:2;s:5:\"XYYGG\";i:3;s:5:\"GGXGG\";i:4;s:5:\"GGGGG\";}'),
(286, 7, 239, '3', 'a:3:{i:0;s:5:\"XYYYX\";i:1;s:5:\"GYYXX\";i:2;s:5:\"GGGGG\";}'),
(287, 1, 239, '3', 'a:3:{i:0;s:5:\"XXXXY\";i:1;s:5:\"GGXYX\";i:2;s:5:\"GGGGG\";}'),
(288, 1, 238, '3', 'a:3:{i:0;s:5:\"YXYGX\";i:1;s:5:\"YXXGY\";i:2;s:5:\"GGGGG\";}'),
(289, 5, 239, '3', 'a:3:{i:0;s:5:\"XYYXX\";i:1;s:5:\"GYXXX\";i:2;s:5:\"GGGGG\";}'),
(290, 5, 238, '5', 'a:5:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XYYXX\";i:2;s:5:\"XGYGX\";i:3;s:5:\"XGXGG\";i:4;s:5:\"GGGGG\";}'),
(291, 5, 237, '4', 'a:4:{i:0;s:5:\"XYXXY\";i:1;s:5:\"YYXYX\";i:2;s:5:\"YXXGG\";i:3;s:5:\"GGGGG\";}'),
(292, 6, 239, '4', 'a:4:{i:0;s:5:\"XYYYX\";i:1;s:5:\"GYYXX\";i:2;s:5:\"GXYYX\";i:3;s:5:\"GGGGG\";}'),
(293, 11, 239, '3', 'a:3:{i:0;s:5:\"XXYYX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"GGGGG\";}'),
(294, 1, 240, '4', 'a:4:{i:0;s:5:\"GXXXX\";i:1;s:5:\"GXXYX\";i:2;s:5:\"GYGYX\";i:3;s:5:\"GGGGG\";}'),
(295, 7, 240, '4', 'a:4:{i:0;s:5:\"XXYYX\";i:1;s:5:\"XXXGY\";i:2;s:5:\"XXGGG\";i:3;s:5:\"GGGGG\";}'),
(296, 11, 240, '4', 'a:4:{i:0;s:5:\"XXXYX\";i:1;s:5:\"YYXXX\";i:2;s:5:\"XYGXY\";i:3;s:5:\"GGGGG\";}'),
(297, 8, 240, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXXXX\";i:2;s:5:\"XYGXY\";i:3;s:5:\"GGGGG\";}'),
(298, 9, 240, '4', 'a:4:{i:0;s:5:\"GXXYX\";i:1;s:5:\"GXGXX\";i:2;s:5:\"GYGYX\";i:3;s:5:\"GGGGG\";}'),
(299, 7, 241, '4', 'a:4:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"GGXYX\";i:3;s:5:\"GGGGG\";}'),
(300, 11, 241, '2', 'a:2:{i:0;s:5:\"GXGXX\";i:1;s:5:\"GGGGG\";}'),
(301, 6, 240, '', 'a:6:{i:0;s:5:\"XXXXY\";i:1;s:5:\"XXYXX\";i:2;s:5:\"XXYXX\";i:3;s:5:\"YXXXY\";i:4;s:5:\"XXXXX\";i:5;s:5:\"XXXXX\";}'),
(302, 6, 241, '5', 'a:5:{i:0;s:5:\"XGXXX\";i:1;s:5:\"XGXXX\";i:2;s:5:\"XGGXX\";i:3;s:5:\"XGGXY\";i:4;s:5:\"GGGGG\";}'),
(303, 1, 242, '3', 'a:3:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XXGGX\";i:2;s:5:\"GGGGG\";}'),
(304, 1, 241, '4', 'a:4:{i:0;s:5:\"GXXXX\";i:1;s:5:\"GYGXX\";i:2;s:5:\"GXGGX\";i:3;s:5:\"GGGGG\";}'),
(305, 5, 242, '5', 'a:5:{i:0;s:5:\"YXXXX\";i:1;s:5:\"XGGXX\";i:2;s:5:\"YGGXX\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(306, 5, 241, '4', 'a:4:{i:0;s:5:\"XXYYX\";i:1;s:5:\"XGYXX\";i:2;s:5:\"XGGYX\";i:3;s:5:\"GGGGG\";}'),
(307, 5, 240, '4', 'a:4:{i:0;s:5:\"XXYXX\";i:1;s:5:\"XXXGG\";i:2;s:5:\"XGXGG\";i:3;s:5:\"GGGGG\";}'),
(308, 11, 242, '5', 'a:5:{i:0;s:5:\"YYXXX\";i:1;s:5:\"XXYXY\";i:2;s:5:\"XGYXX\";i:3;s:5:\"XGGGX\";i:4;s:5:\"GGGGG\";}'),
(309, 6, 242, '5', 'a:5:{i:0;s:5:\"YXXXX\";i:1;s:5:\"XYXGX\";i:2;s:5:\"XGGGX\";i:3;s:5:\"XGGGX\";i:4;s:5:\"GGGGG\";}'),
(310, 7, 243, '3', 'a:3:{i:0;s:5:\"XXXXG\";i:1;s:5:\"XGXXG\";i:2;s:5:\"GGGGG\";}'),
(311, 11, 243, '5', 'a:5:{i:0;s:5:\"YXXXG\";i:1;s:5:\"XXGXG\";i:2;s:5:\"GXGXG\";i:3;s:5:\"GGGXG\";i:4;s:5:\"GGGGG\";}'),
(312, 8, 243, '4', 'a:4:{i:0;s:5:\"XYGYX\";i:1;s:5:\"XGGXG\";i:2;s:5:\"XXXXX\";i:3;s:5:\"GGGGG\";}'),
(313, 6, 243, '5', 'a:5:{i:0;s:5:\"XYYYX\";i:1;s:5:\"YXYXX\";i:2;s:5:\"XYGGX\";i:3;s:5:\"YXGXX\";i:4;s:5:\"GGGGG\";}'),
(314, 7, 244, '4', 'a:4:{i:0;s:5:\"XXXXG\";i:1;s:5:\"XXXXG\";i:2;s:5:\"XXXXG\";i:3;s:5:\"GGGGG\";}'),
(315, 1, 244, '4', 'a:4:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XGXXY\";i:2;s:5:\"GGXXX\";i:3;s:5:\"GGGGG\";}'),
(316, 1, 243, '5', 'a:5:{i:0;s:5:\"GXXXG\";i:1;s:5:\"GXGXG\";i:2;s:5:\"GGGXG\";i:3;s:5:\"GGGXG\";i:4;s:5:\"GGGGG\";}'),
(317, 11, 244, '4', 'a:4:{i:0;s:5:\"XXYXG\";i:1;s:5:\"XGXXG\";i:2;s:5:\"XGXXG\";i:3;s:5:\"GGGGG\";}'),
(318, 8, 244, '4', 'a:4:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YXYXX\";i:2;s:5:\"GXXXX\";i:3;s:5:\"GGGGG\";}'),
(319, 9, 244, '5', 'a:5:{i:0;s:5:\"XXXXX\";i:1;s:5:\"XXYXG\";i:2;s:5:\"XGXGG\";i:3;s:5:\"XGGGG\";i:4;s:5:\"GGGGG\";}'),
(320, 9, 243, '6', 'a:6:{i:0;s:5:\"XXGXG\";i:1;s:5:\"GXGXG\";i:2;s:5:\"GGGXG\";i:3;s:5:\"GGGXG\";i:4;s:5:\"GGGXG\";i:5;s:5:\"GGGGG\";}'),
(321, 9, 242, '5', 'a:5:{i:0;s:5:\"XYXYX\";i:1;s:5:\"XXGYG\";i:2;s:5:\"GXGXG\";i:3;s:5:\"GYGXG\";i:4;s:5:\"GGGGG\";}'),
(322, 9, 241, '4', 'a:4:{i:0;s:5:\"XGYXX\";i:1;s:5:\"XGXYX\";i:2;s:5:\"GGYYX\";i:3;s:5:\"GGGGG\";}'),
(323, 6, 244, '6', 'a:6:{i:0;s:5:\"XYXXX\";i:1;s:5:\"XGXXG\";i:2;s:5:\"XGXXG\";i:3;s:5:\"XGXXX\";i:4;s:5:\"XGGGG\";i:5;s:5:\"GGGGG\";}'),
(324, 8, 245, '5', 'a:5:{i:0;s:5:\"XXXYX\";i:1;s:5:\"XXXXG\";i:2;s:5:\"GXGGG\";i:3;s:5:\"GXGGG\";i:4;s:5:\"GGGGG\";}'),
(325, 1, 245, '5', 'a:5:{i:0;s:5:\"XXGXX\";i:1;s:5:\"XYGXX\";i:2;s:5:\"GYXXG\";i:3;s:5:\"GGGXG\";i:4;s:5:\"GGGGG\";}'),
(326, 7, 245, '4', 'a:4:{i:0;s:5:\"XXGXX\";i:1;s:5:\"GXGXX\";i:2;s:5:\"GXGGG\";i:3;s:5:\"GGGGG\";}'),
(327, 11, 245, '6', 'a:6:{i:0;s:5:\"XYXXX\";i:1;s:5:\"YYXXX\";i:2;s:5:\"XXGGY\";i:3;s:5:\"GXGGG\";i:4;s:5:\"GXGGG\";i:5;s:5:\"GGGGG\";}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `verified` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `resettable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `roles_mask` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registered` int(10) UNSIGNED NOT NULL,
  `last_login` int(10) UNSIGNED DEFAULT NULL,
  `force_logout` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `status`, `verified`, `resettable`, `roles_mask`, `registered`, `last_login`, `force_logout`) VALUES
(1, 'me@charliewilson.co.uk', '$2y$10$7b/XFHyai8gWxoDLfcPAe..GcARkFFzIDpqkstrKLIjMAZRD/lSgW', 'charlie', 0, 1, 1, 0, 1585749826, 1645271432, 112),
(4, 'bradleygeorgemerle@gmail.com', '$2y$10$K9yQKjw9kNyWYX2Q7fhbWOIxC.d3NgvOkav8HK/DXjKxXjIDHZBES', 'TerryGtoTheD', 0, 1, 1, 0, 1642458668, 1643808726, 0),
(5, 'newleaf@mailmasker.com', '$2y$10$DzArXgeSiUXfGGk/aeQJNOLJ2tHoorL9oMsfCyDK1Mkp7XNjgw6nG', 'alana', 0, 1, 1, 0, 1642459322, 1644997724, 0),
(6, 'dogfish_gym.0i@icloud.com', '$2y$10$jNBE8CzdSlE74JW3c.0oHOUFec2UPuOQMRb2/E2mIK6Ag1XgQ1qRe', 'FoxboroHT', 0, 1, 1, 0, 1642462341, 1645186446, 0),
(7, 'robinson.james@yahoo.com', '$2y$10$iv5JKL0.WluZObP4bnoT9.2IgUaIPs2oxt/gmIMLDtrN7G6pw7uFK', 'James', 0, 1, 1, 0, 1642490310, 1645256707, 0),
(8, 'husj.wln@gmail.com', '$2y$10$Y88aF.L9jUfYd2HM861To.3k0C/CcRh7fTbOaXtIhi4P4UdunfBoi', 'josh', 0, 1, 1, 0, 1642496886, 1645271223, 0),
(9, 'ap95@hotmail.co.uk', '$2y$10$Usr1QSoXdLAXHE.TCrEHvuyDXmBleKKRfZoiO1nT4girQ2hYQ2Qyu', 'Luvalle', 0, 1, 1, 0, 1642503272, 1645184742, 0),
(10, 'bsalau93@gmail.com', '$2y$10$KzALWhJsh/jJsX1tmr9gwO5P0fdLcty.WYuVGo9A.XnorwLOewATq', 'franco', 0, 1, 1, 0, 1642523235, 1643046964, 0),
(11, 'lovefromhannahe@gmail.com', '$2y$10$uZXUIxQp7jWMlJLunfqZE.uy6z7x91rzN/FxTwxO4pLhJSkyzaPQG', 'sourpatch', 0, 1, 1, 0, 1643801582, 1645264862, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_confirmations`
--

CREATE TABLE `users_confirmations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(249) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selector` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_data`
--

CREATE TABLE `users_data` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `friendcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_remembered`
--

CREATE TABLE `users_remembered` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `selector` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_remembered`
--

INSERT INTO `users_remembered` (`id`, `user`, `selector`, `token`, `expires`) VALUES
(4, 1, 'q703gbxxe9DucSQeRksy6M3D', '$2y$10$t53PR4ptL2sCurY/QBhA4OHZezF/uAQJrtm3RAYXO6/qlvvHDyeW.', 1674016100),
(5, 4, 'fJ_kD-8iJQLA3m6maSMVnLfc', '$2y$10$VsWqzgQtLhrY6jwyGN5IGeygpZOOU/HOMFfKfzRdKZsqTkaZv4/LO', 1674016327),
(7, 1, 'hkmGA_CC4ApFwDa7z8RCgv-Z', '$2y$10$5ig/1YND2LoEQzHSfHl1zu1qk1MeIAmvbPPBqfcB66rBv32gv6stG', 1674016450),
(9, 1, 'GAeHkteYKDgdtsK3UTjh3dql', '$2y$10$hrDrHWy9dOXP3Y2A5O1S2.IAvG3r/A4QlsGmtI/iICQToMfYbO1.2', 1674017034),
(15, 1, '8xuyPYV6BX8jiRjVIjq-gp1J', '$2y$10$k4GpAsmu9O8Pze.jeUxNHeUSckhn6fNowDvLtXm5mYlkvNgLif4yC', 1674078126),
(11, 1, '1GoQWL02fM9RYZRebxM6hun3', '$2y$10$TtiTGCJ221oS6kVjm8ex6.3tXtLUtuDmjqI8yFmSpPqr0hSeCoQzS', 1674056289),
(12, 6, 'bTZWeAXWd0w-QHhnpx_A0QLj', '$2y$10$XSILJRTE.h35Ghd7wX4HBO.np0yS7J.GT9eao2jRsQzav4Za8EaJu', 1674056660),
(13, 4, 'Ygu-uoPRLHlwfqILeyaqf1H6', '$2y$10$YYK.9rOlxj9Asb2D5Q/StOSuT4u6ddG3AfNglgeQU0J27DZ8sJFMW', 1674057793),
(14, 9, 'HQdnpqAyvzWwltI9R1i7YkYu', '$2y$10$Wz9KrN22LHJJjJWA/VZo2OtzQaDfxMyB/c20IoBV9VMQCwRejSayy', 1674061419),
(16, 1, 'IifCtGbbCrHpALxrMqhvtVIP', '$2y$10$cL3OPBLXE1u0vyFLmgkCTucotDk2olI4j7QFUzys/PmMdofOraEtO', 1674086187),
(17, 5, 'sdx4yXiqGCe68zOtvGdXAprR', '$2y$10$YopiZRD7Qi4sV8ROmZKAbupm7q5iLP23nFqE9.vetRfl0UOPM54U2', 1674096556),
(18, 5, '-HiSlsabsGmw31_IDngAX6Vr', '$2y$10$Y0IVFVM5tqYBEmo1KLDZQOXTA6QfHPyhro.P8zYohP1nPGPXrLOxO', 1674096637),
(19, 7, '1g1VBeohB5AfkwearKT9FOIO', '$2y$10$YIYHIX2aO1YUUebN7P2auOHvZIh.SmY8aDerM04e7MM5m98K1I2km', 1674098192),
(20, 5, '2Cuppzt0uKtYR7250sZDU8De', '$2y$10$aINA3pupznxVDzTwfM5Xiu.xsQnE5RwPggrEn1UfdZKzCQxAMJxce', 1674101871),
(21, 5, 'wkLVsDm0Mp7n2q43UqMzkGCp', '$2y$10$c1PN7NJXsr6dgV62HBHhrOFvDdu9uViqf3.Mn8G063YknRbvyVFkG', 1674134464),
(22, 8, 'FgdtbGwjuLhbGxogmxdvYXjz', '$2y$10$uvql/Z/dl3Q1fB954kRgiOitVZ2EWLRmxyasHRbYA.hB3gse990Gu', 1674136427),
(23, 10, 'riwJmhedHVeWp3tTII00NzSB', '$2y$10$TqmkDQfJoJQqEfxh2OyFH.syFSVwsb50iBJbwbgETgQY4IUFt8PtK', 1674147024),
(24, 5, '2J-p8OwYYaVyFb_2fyRzFISA', '$2y$10$mtdMS5nN4tlSJv2St49HU.SbFIiocSD11gdV7UTNiU5peEMrSpP/6', 1674221736),
(25, 5, '_ZGaRl4j0gcUITICAIRkGO2p', '$2y$10$BApvy0hzREI6kR4eBuRR2ORXF8tsMM7OKkpbX87M2Gfrj7bsA5Eky', 1674307027),
(26, 5, '5D9QhRYu3357DYKUCmRGOynD', '$2y$10$rZQbytwMGOufUlLrvg8Pvuvf4v4FKnnuDCd8SMprljN21Qmyranj6', 1674399496),
(27, 5, 'Aw6-gZ_FfRy38xgwwwrxJni-', '$2y$10$OkxiRBS9kmTKJcWzu6gwhOClwSRLmatR10/sgodCvhE1mP6.d1yZ2', 1674482817),
(28, 5, '-G-R54nPUcbFcX0lLvlpMyxb', '$2y$10$pzCMiZFuF4mI6RRVANn8PuT95clv6DSV0b0fz2vE5qRuCtdKhgr4O', 1674565882),
(29, 1, 'MWq8KvQcVMfRCKDPupJliwPN', '$2y$10$5RW2MsaZLgtE8whiQVLVCOerVVRnouLfGGHs.40wVcNTmWQjBtI2i', 1674617317),
(30, 5, '_dndJE8rIza-sZx-v6pSR-0l', '$2y$10$4T5ozSeyXv1qDFDtc7T18eaLp9zfaHxSzkKwFbeH8qTnbIvvXNrJS', 1674652209),
(31, 1, '07HhiYw_rmNfQoHDKoEUHqKf', '$2y$10$87Um/yJa2vmBDuHJP4vneO4PLGN/UjBMmALN5Lwn0lge/v9I/kFaC', 1674669786),
(32, 5, 'lVSinAtiBkMl4ta_6QyhSH-v', '$2y$10$Sie3feZ84wol/kqbUR.xFuXN6qoXl.dA3rozOo33dqzeOnkb.CuY2', 1674737852),
(33, 5, '0VqhU-0crfFQkcuDNIZtBNys', '$2y$10$zKVmSO2eO4ObZalsnCmzx.jhYqOM3Eie98jMJVTxPV8uOCoUxl66u', 1674824673),
(34, 5, 'GEtHHJ_fvMs2sRsfK8qwbrx1', '$2y$10$AU.NeynSKhGO5Al3xMKAROvoRN9hifO/9S2yQ6S.LSiGp.bSwWEtW', 1674914346),
(35, 5, 'IoKtZCQX0j-OWs63ioANp-AE', '$2y$10$pXy8uOjtBgdzuP6ouHZoxOXN9YXQ77wOEjRz7pwUz8FY34Ezk9Bwu', 1674997730),
(36, 5, 'oEVbTrdbhj6FEaJuPCwwcYNE', '$2y$10$Rt4Y3m3YRzhITj0H2JWVy.o1r8njYORnny.rCmNeyOK5b31g8OEQm', 1675085162),
(37, 5, 'A7_0GDlPVG51LHY4VMap2-jz', '$2y$10$gTGKhPWpcpaBohmnFvO3VecSZ9/g/Nj1IaR9QUWVwf3uZ.5JeTjfi', 1675171006),
(38, 5, 'tj2EPq5gEWs31vyGcj7_bgWX', '$2y$10$8YekAnVcan.77mRqWnyQ1uwPDCJ2BPjD29Gze34NBnRGrpEoS5mNe', 1675256113),
(39, 1, 'YrYQbu_Kt3WGPI8sR_vJhCln', '$2y$10$xatVW0.QPpcGmWKzEPOf.uPXDwjpmfhB0hgbWr35LkrSx2z/0hzCq', 1675284640),
(40, 5, 'qwGTiTysihjmztTOkxgD2W7u', '$2y$10$nMI..wz1mn46zbTWOeyQc.yzs/YD9PHNQQl5iEUp.DfpeVuMQhqH2', 1675343406),
(41, 11, 'yOmI7ZvttB0qOmogO4A_cFcO', '$2y$10$yD9eJIVyWiCquZOS2PsmXe4lj5ig2EjGpSpXF1Mf3k5G8w9DohWta', 1675380302),
(42, 5, '3cSfFludiK8LjMNBWkr6QQCq', '$2y$10$urGlI9WqysI2uslLlX4pKe81YojN1Qo2O2rSTO.Jw3VVyfXNSOy9.', 1675430841),
(43, 5, '8CioP2AXEPtKGVJ8h0HD_yuC', '$2y$10$WCGKdcN6E7YG8pHUgY0KwuU4k9yRcrd2xp7f23FK0KZiK//imCvDG', 1675517588),
(44, 11, 'l5xy2hZ4B6ydQKIA-uOrLrzy', '$2y$10$oweU4pOUgp9.5Nrv9rDAEO8hD.zFefzaTrk4/h/VIQXWG48TqS94O', 1675618992),
(45, 5, '1tkFfbV7URNz-qDaTXQXrz4F', '$2y$10$lLqdvDm6yDLvWtzAXDsYhuW43tYigm8pCCR1WAdV8F5rYxUGkocv6', 1675703191),
(46, 5, 'ViY_0PgBaX7qbg3vxfve9_gH', '$2y$10$Du8c4FZt0J.lX5Ed59Gt8uUClLQT1sGGkNJfcbw.WpfcXg/3H7L62', 1675861949),
(47, 5, 'i5fw3avr3gtAksIXZlW4sUZq', '$2y$10$vmBnMzzqQdZKTSzC1rhcTOwcFjMxkeucJOCebMm2VwsejN0v0um5W', 1675951224),
(48, 5, 'p92k6ltk9bjF4pLEGhcw0aqn', '$2y$10$xJaO3f26h4Cw1VkWpOZc5eXbecyAanGiL1j1C3ARNolqccmOjwmve', 1676070418),
(49, 5, 'WjMLReKnGcoHccgBTg5dpoUo', '$2y$10$YK1VLdTb.2TTrgvf2HaA8uTIZQWy0R1ixwPmS33Ow8PYgEm07AJy.', 1676298972),
(50, 5, 'uUa6pFlTbJtkKyRofQRDm3CB', '$2y$10$MgEn1yqW94opqWagcXVaJentgE.dnXMb7Rk9zESR3Tic.ORZyDnrK', 1676555324);

-- --------------------------------------------------------

--
-- Table structure for table `users_resets`
--

CREATE TABLE `users_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(10) UNSIGNED NOT NULL,
  `selector` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_throttling`
--

CREATE TABLE `users_throttling` (
  `bucket` varchar(44) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `tokens` float UNSIGNED NOT NULL,
  `replenished_at` int(10) UNSIGNED NOT NULL,
  `expires_at` int(10) UNSIGNED NOT NULL
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users_confirmations`
--
ALTER TABLE `users_confirmations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_data`
--
ALTER TABLE `users_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_remembered`
--
ALTER TABLE `users_remembered`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
