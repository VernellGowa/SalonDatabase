-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Mar 12, 2022 at 12:14 PM
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
-- Database: `saloon`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` varchar(30) DEFAULT NULL,
  `open` time DEFAULT '00:00:00',
  `close` time DEFAULT '00:00:00',
  `privacy` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `name`, `password`, `email`, `number`, `open`, `close`, `privacy`) VALUES
(10, 'Sapientiae', 'pass', 'test@gmail.com', '07391044472', '06:30:00', '21:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `city` varchar(250) NOT NULL,
  `postcode` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `town` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `city`, `postcode`, `country`, `address`, `latitude`, `longitude`, `town`) VALUES
(1, 'London', 'SW16 5DL', 'England', '6 Rochester Close', 51.421341, -0.12265, 'Streatham');

-- --------------------------------------------------------

--
-- Table structure for table `address_jnct`
--

CREATE TABLE `address_jnct` (
  `jnct_id` int(11) NOT NULL,
  `account_fk` int(11) NOT NULL,
  `address_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address_jnct`
--

INSERT INTO `address_jnct` (`jnct_id`, `account_fk`, `address_fk`) VALUES
(2, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `account_fk` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `style_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_fk`, `account_fk`, `start`, `end`, `style_fk`) VALUES
(1, 4, 10, '2022-02-28 18:00:00', '2022-02-28 23:30:00', 23);

-- --------------------------------------------------------

--
-- Table structure for table `breaks`
--

CREATE TABLE `breaks` (
  `break_id` int(11) NOT NULL,
  `break_start` datetime NOT NULL,
  `break_end` datetime NOT NULL,
  `account_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `breaks`
--

INSERT INTO `breaks` (`break_id`, `break_start`, `break_end`, `account_fk`) VALUES
(24, '2022-01-18 00:30:00', '2022-01-18 02:00:00', 10),
(31, '2022-02-28 02:00:00', '2022-02-28 03:00:00', 10),
(32, '2022-02-27 02:00:00', '2022-02-27 03:00:00', 10),
(33, '2022-03-05 02:00:00', '2022-03-05 03:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `account_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`, `account_fk`) VALUES
(9, 'Men\'s Black Hair', 10),
(10, 'Women\'s Hair', 10);

-- --------------------------------------------------------

--
-- Table structure for table `category_jnct`
--

CREATE TABLE `category_jnct` (
  `jnct_id` int(11) NOT NULL,
  `category_fk` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_jnct`
--

INSERT INTO `category_jnct` (`jnct_id`, `category_fk`, `style_fk`) VALUES
(6, 9, 21),
(7, 9, 24),
(8, 9, 24);

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `filter_id` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `length` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`filter_id`, `style_fk`, `gender`, `length`) VALUES
(1, 23, 0, 1),
(2, 24, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `card_id` int(11) NOT NULL,
  `card_number` varchar(100) NOT NULL,
  `expiry` varchar(10) NOT NULL,
  `cvv` varchar(5) NOT NULL,
  `user_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL,
  `review` varchar(500) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `user_fk` int(11) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `style_fk`, `review`, `rating`, `user_fk`, `time`) VALUES
(1, 23, 'The Cornrows were Fab! She really ate!!!', 5, 4, '2022-02-21');

-- --------------------------------------------------------

--
-- Table structure for table `saloon_images`
--

CREATE TABLE `saloon_images` (
  `image_id` int(11) NOT NULL,
  `saloon_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saloon_images`
--

INSERT INTO `saloon_images` (`image_id`, `saloon_fk`) VALUES
(1, 10),
(2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `saloon_likes`
--

CREATE TABLE `saloon_likes` (
  `like_id` int(11) NOT NULL,
  `saloon_fk` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saloon_likes`
--

INSERT INTO `saloon_likes` (`like_id`, `saloon_fk`, `user_fk`) VALUES
(2, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `saloon_payment`
--

CREATE TABLE `saloon_payment` (
  `payment_id` int(11) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `expiry_date` varchar(20) NOT NULL,
  `saloon_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `saloon_reviews`
--

CREATE TABLE `saloon_reviews` (
  `review_id` int(11) NOT NULL,
  `review` varchar(500) NOT NULL,
  `rating` int(11) NOT NULL,
  `account_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `saved_locations`
--

CREATE TABLE `saved_locations` (
  `location_id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(500) NOT NULL,
  `postcode` varchar(500) NOT NULL,
  `country` varchar(500) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `chosen` tinyint(1) NOT NULL,
  `town` varchar(500) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saved_locations`
--

INSERT INTO `saved_locations` (`location_id`, `address`, `city`, `postcode`, `country`, `user_fk`, `chosen`, `town`, `latitude`, `longitude`) VALUES
(3, '6 Rochester Close', 'England', 'SW16 5DL', 'London', 4, 1, 'Streatham', 51.4153162, -0.1256216);

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `style_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `time` varchar(255) NOT NULL,
  `max_time` varchar(250) DEFAULT NULL,
  `info` varchar(255) NOT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`style_id`, `name`, `price`, `time`, `max_time`, `info`, `privacy`) VALUES
(15, 'Braids', '10.00', '30', '60', 'Beautiful braids!', 0),
(21, 'Low Fade', '15.00', '30', '', 'Fire Fade To Get The Hoes!', 0),
(23, 'Cornrows', '30.00', '30', '', 'Cornrows To Row Your Corn', 0),
(24, 'Taper Fade', '15.00', '30', NULL, 'Taper Fade To Tape Up', 0);

-- --------------------------------------------------------

--
-- Table structure for table `style_images`
--

CREATE TABLE `style_images` (
  `image_fk` int(11) NOT NULL,
  `style_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `style_images`
--

INSERT INTO `style_images` (`image_fk`, `style_id`) VALUES
(1, 24),
(3, 27);

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `styles_jnct`
--

CREATE TABLE `styles_jnct` (
  `jnct_id` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL,
  `account_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `styles_jnct`
--

INSERT INTO `styles_jnct` (`jnct_id`, `style_fk`, `account_fk`) VALUES
(12, 15, 10),
(18, 21, 10),
(20, 23, 10),
(21, 24, 10);

-- --------------------------------------------------------

--
-- Table structure for table `style_likes`
--

CREATE TABLE `style_likes` (
  `like_id` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `style_likes`
--

INSERT INTO `style_likes` (`like_id`, `style_fk`, `user_fk`) VALUES
(1, 23, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tag_jnct`
--

CREATE TABLE `tag_jnct` (
  `tag_id` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_jnct`
--

INSERT INTO `tag_jnct` (`tag_id`, `style_fk`, `tag`) VALUES
(7, 15, 'braids'),
(8, 15, 'black'),
(9, 15, 'hair');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `number` varchar(15) NOT NULL,
  `gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `number`, `gender`) VALUES
(4, 'test@gmail.com', 'pass', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `viewed`
--

CREATE TABLE `viewed` (
  `view_id` int(11) NOT NULL,
  `style_fk` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `view_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `address_jnct`
--
ALTER TABLE `address_jnct`
  ADD PRIMARY KEY (`jnct_id`),
  ADD KEY `account_fk` (`account_fk`),
  ADD KEY `address_fk` (`address_fk`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_fk` (`user_fk`),
  ADD KEY `account_fk` (`account_fk`),
  ADD KEY `time_fk` (`start`),
  ADD KEY `start` (`start`),
  ADD KEY `style_fk` (`style_fk`);

--
-- Indexes for table `breaks`
--
ALTER TABLE `breaks`
  ADD PRIMARY KEY (`break_id`),
  ADD KEY `account_fk` (`account_fk`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `account_fk` (`account_fk`);

--
-- Indexes for table `style_images`
--
ALTER TABLE `style_images`
  ADD PRIMARY KEY (`image_fk`),
  ADD KEY `sofk` (`style_id`);

--
-- Indexes for table `category_jnct`
--
ALTER TABLE `category_jnct`
  ADD PRIMARY KEY (`jnct_id`),
  ADD KEY `style_fk` (`style_fk`),
  ADD KEY `category_fk` (`category_fk`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`filter_id`),
  ADD KEY `style_fk` (`style_fk`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `style_fk` (`style_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `saloon_images`
--
ALTER TABLE `saloon_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `saloon_fk` (`saloon_fk`);

--
-- Indexes for table `saloon_likes`
--
ALTER TABLE `saloon_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `saloon_fk` (`saloon_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `saloon_payment`
--
ALTER TABLE `saloon_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `saloon_fk` (`saloon_fk`);

--
-- Indexes for table `saloon_reviews`
--
ALTER TABLE `saloon_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `account_fk` (`account_fk`);

--
-- Indexes for table `saved_locations`
--
ALTER TABLE `saved_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`style_id`);

--
-- Indexes for table `styles_jnct`
--
ALTER TABLE `styles_jnct`
  ADD PRIMARY KEY (`jnct_id`),
  ADD KEY `style_fk` (`style_fk`),
  ADD KEY `account_fk` (`account_fk`);

--
-- Indexes for table `style_likes`
--
ALTER TABLE `style_likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `style_fk` (`style_fk`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `tag_jnct`
--
ALTER TABLE `tag_jnct`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `style_fk` (`style_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `viewed`
--
ALTER TABLE `viewed`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `sym` (`style_fk`),
  ADD KEY `mhb` (`user_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `address_jnct`
--
ALTER TABLE `address_jnct`
  MODIFY `jnct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `style_images`
--
ALTER TABLE `style_images`
  MODIFY `image_fk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `breaks`
--
ALTER TABLE `breaks`
  MODIFY `break_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_jnct`
--
ALTER TABLE `category_jnct`
  MODIFY `jnct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saloon_images`
--
ALTER TABLE `saloon_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `saloon_likes`
--
ALTER TABLE `saloon_likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `saloon_payment`
--
ALTER TABLE `saloon_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saloon_reviews`
--
ALTER TABLE `saloon_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_locations`
--
ALTER TABLE `saved_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `style_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `styles_jnct`
--
ALTER TABLE `styles_jnct`
  MODIFY `jnct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `style_likes`
--
ALTER TABLE `style_likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tag_jnct`
--
ALTER TABLE `tag_jnct`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `viewed`
--
ALTER TABLE `viewed`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_jnct`
--
ALTER TABLE `address_jnct`
  ADD CONSTRAINT `ac_jn` FOREIGN KEY (`account_fk`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `ad_jn` FOREIGN KEY (`address_fk`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `accfs` FOREIGN KEY (`account_fk`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_jnct`
--
ALTER TABLE `category_jnct`
  ADD CONSTRAINT `catFk` FOREIGN KEY (`category_fk`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stFk` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `filters`
--
ALTER TABLE `filters`
  ADD CONSTRAINT `fifk` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `uke` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `klk` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rev` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saloon_images`
--
ALTER TABLE `saloon_images`
  ADD CONSTRAINT `img_sal` FOREIGN KEY (`saloon_fk`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `saloon_likes`
--
ALTER TABLE `saloon_likes`
  ADD CONSTRAINT `sal` FOREIGN KEY (`saloon_fk`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uses` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saloon_payment`
--
ALTER TABLE `saloon_payment`
  ADD CONSTRAINT `ddfd` FOREIGN KEY (`saloon_fk`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `saved_locations`
--
ALTER TABLE `saved_locations`
  ADD CONSTRAINT `loc_use` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `styles_jnct`
--
ALTER TABLE `styles_jnct`
  ADD CONSTRAINT `accer` FOREIGN KEY (`account_fk`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `st_jn` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `style_likes`
--
ALTER TABLE `style_likes`
  ADD CONSTRAINT `still` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `used` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag_jnct`
--
ALTER TABLE `tag_jnct`
  ADD CONSTRAINT `st` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `viewed`
--
ALTER TABLE `viewed`
  ADD CONSTRAINT `mhb` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sym` FOREIGN KEY (`style_fk`) REFERENCES `style` (`style_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
