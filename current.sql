-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 18, 2022 at 09:54 PM
-- Server version: 5.7.36-0ubuntu0.18.04.1
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
(118, 7, 202, '5', 'a:5:{i:0;s:5:\"XXYXY\";i:1;s:5:\"GXXYX\";i:2;s:5:\"GGXXX\";i:3;s:5:\"GGGXX\";i:4;s:5:\"GGGGG\";}');

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
(1, 'me@charliewilson.co.uk', '$2y$10$7b/XFHyai8gWxoDLfcPAe..GcARkFFzIDpqkstrKLIjMAZRD/lSgW', 'charlie', 0, 1, 1, 0, 1585749826, 1642542027, 112),
(4, 'bradleygeorgemerle@gmail.com', '$2y$10$K9yQKjw9kNyWYX2Q7fhbWOIxC.d3NgvOkav8HK/DXjKxXjIDHZBES', 'TerryGtoTheD', 0, 1, 1, 0, 1642458668, 1642525930, 0),
(5, 'newleaf@mailmasker.com', '$2y$10$DzArXgeSiUXfGGk/aeQJNOLJ2tHoorL9oMsfCyDK1Mkp7XNjgw6nG', 'alana', 0, 1, 1, 0, 1642459322, 1642539037, 0),
(6, 'dogfish_gym.0i@icloud.com', '$2y$10$jNBE8CzdSlE74JW3c.0oHOUFec2UPuOQMRb2/E2mIK6Ag1XgQ1qRe', 'FoxboroHT', 0, 1, 1, 0, 1642462341, 1642542308, 0),
(7, 'robinson.james@yahoo.com', '$2y$10$iv5JKL0.WluZObP4bnoT9.2IgUaIPs2oxt/gmIMLDtrN7G6pw7uFK', 'James', 0, 1, 1, 0, 1642490310, 1642540592, 0),
(8, 'husj.wln@gmail.com', '$2y$10$Y88aF.L9jUfYd2HM861To.3k0C/CcRh7fTbOaXtIhi4P4UdunfBoi', 'josh', 0, 1, 1, 0, 1642496886, 1642496886, 0),
(9, 'ap95@hotmail.co.uk', '$2y$10$Usr1QSoXdLAXHE.TCrEHvuyDXmBleKKRfZoiO1nT4girQ2hYQ2Qyu', 'Luvalle', 0, 1, 1, 0, 1642503272, 1642505424, 0),
(10, 'bsalau93@gmail.com', '$2y$10$KzALWhJsh/jJsX1tmr9gwO5P0fdLcty.WYuVGo9A.XnorwLOewATq', 'franco', 0, 1, 1, 0, 1642523235, 1642523235, 0);

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
(19, 7, '1g1VBeohB5AfkwearKT9FOIO', '$2y$10$YIYHIX2aO1YUUebN7P2auOHvZIh.SmY8aDerM04e7MM5m98K1I2km', 1674098192);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
