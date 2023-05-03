-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2023 at 05:24 AM
-- Server version: 5.7.42
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kenosi_cometclips`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `message` varchar(750) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Mark Zuckerberg', 'mark.zuckerberg@facebook.com', '+27640204765', 'Hi, my name is Mark and I\'m the founder of Facebook; now know as Meta', '2023-05-02 17:45:26', '2023-05-02 17:45:26'),
(2, 'Elon Musk', 'elon.musk@spacex.com', '27721983243', 'Hi there fella, you know who this is, yeah you got that right, this is your boy Elon Must founding member or Telsa, Paypal, SpaceX, the list goes on and on and on hahaha', '2023-05-02 17:47:08', '2023-05-02 17:47:08'),
(3, 'Bill Gates', 'bill.gates@mircorsoft.com', '+27812047111', 'Yes! you guessed right... I am Bill Gates, but you can call me Mr Gates, the one and only. Co-founded Microsoft with my boy Steve Balmer... I miss those days, don\'t you! I bet you do lol', '2023-05-02 17:49:00', '2023-05-02 17:49:00'),
(4, 'Patrice Motsepe', 'patrice.motsepe@rainbow.com', '+27715515571', 'Say my name, I said say my name... yeah that\'s right... My name is Patrice Motsepe, I own a football club called Mamelodi Sundowns', '2023-05-02 17:51:04', '2023-05-02 17:51:04'),
(5, 'Obama', 'barack.obama@whitehouse.org', '+27610043456', 'Do I really have to introduce myself, like really... come on man, everybody knows who I am, but anyway... my name is Obarak Obama and I\'m the guy who got Mark to wear Jacket and Tie', '2023-05-02 18:51:30', '2023-05-02 17:53:07'),
(6, 'Mark Rutte', 'mark.rutte@dutch.org', '+27613323434', 'born 14 February 1967) is a Dutch politician who has served as Prime Minister of the Netherlands since 2010 and Leader of the People\'s Party for Freedom and Democracy (VVD) since 2006.', '2023-05-02 19:25:45', '2023-05-02 17:25:45'),
(7, 'Lionel Messi', 'lionel.messi@yahoo.com', '+27640204700', 'I\'m also known as Leo Messi, is an Argentine professional footballer who plays as a forward for Ligue 1 club Paris Saint-Germain and captains the Argentina national team', '2023-05-03 01:48:57', '2023-05-02 23:48:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
