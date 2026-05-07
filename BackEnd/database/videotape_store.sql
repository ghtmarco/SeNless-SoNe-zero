-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2024 at 03:00 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `videotape_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`) VALUES
(1, 'Action', '2024-12-05 04:10:11'),
(2, 'Comedy', '2024-12-05 04:10:11'),
(3, 'Drama', '2024-12-05 04:10:11'),
(4, 'Horror', '2024-12-05 04:10:11'),
(5, 'Sci-Fi', '2024-12-05 04:10:11'),
(6, 'Romance', '2024-12-05 04:10:11'),
(7, 'Documentary', '2024-12-05 04:10:11'),
(8, 'Animation', '2024-12-05 04:10:11'),
(9, 'Thriller', '2024-12-05 04:10:11'),
(10, 'Fantasy', '2024-12-05 04:10:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2a$10$zCHpr5OWMYBC5AlU3SxgHOc780ILwIRQLCQv9dd3dbrKMR2EPb6G.', 'admin', '2024-12-06 08:38:24'),
(2, 'User1', 'user@test.com', '$2a$10$BoOBi8QgB9.uaPpT3MMQie3ASTy9Bq./2v5CsJ6svrUaebIH9G/w2', 'customer', '2024-12-18 01:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `video_tapes`
--

CREATE TABLE `video_tapes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `stock_quantity` int(11) DEFAULT 0,
  `rating` decimal(3,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_tapes`
--

INSERT INTO `video_tapes` (`id`, `title`, `price`, `description`, `genre_id`, `level`, `stock_quantity`, `rating`, `created_at`) VALUES
(2, 'Green', 200.00, 'Its just about a cactus life', 10, 0, 10, 4.70, '2024-12-18 00:50:30'),
(3, 'Wreck it Ralph', 120.00, 'Ralph is tired of being the \"bad guy\" in his video game. Determined to prove he can be a hero, he embarks on an epic adventure across multiple game worlds. Along the way, he meets quirky characters, faces unexpected challenges, and learns the true meaning of friendship and self-acceptance. This heartwarming and funny story is a celebration of video game nostalgia and teamwork.', 2, 1, 10, 4.70, '2024-12-18 01:18:24'),
(4, 'Mad Max: Fury Road', 150.00, 'In a post-apocalyptic wasteland, a fierce warrior and a drifter team up to escape a tyrant\'s rule. High-speed chases, explosive action, and stunning visuals make this a thrilling masterpiece.', 1, 2, 12, 4.80, '2024-12-18 01:31:51'),
(5, 'The Hangover', 130.00, 'Three friends wake up in Las Vegas with no memory of the previous night and must retrace their steps to find the missing groom before the wedding. A hilarious rollercoaster of chaos and surprises.', 2, 3, 10, 4.50, '2024-12-18 01:33:11'),
(6, 'The Pursuit of Happyness', 140.00, 'Based on a true story, a father struggles with homelessness while pursuing a better life for himself and his young son. A touching tale of resilience, hope, and determination.', 3, 1, 15, 4.90, '2024-12-18 01:34:44'),
(7, 'The Conjuring', 120.00, 'A pair of paranormal investigators help a family terrorized by a dark presence in their home. This spine-chilling story is based on real-life events.', 4, 3, 8, 4.60, '2024-12-18 01:41:05'),
(8, 'Interstellar', 160.00, 'A group of explorers embark on a dangerous journey through space to find a new home for humanity as Earth faces extinction. A breathtaking adventure filled with emotion and wonder.', 5, 2, 14, 5.00, '2024-12-18 01:42:28'),
(9, 'Gone Girl', 140.00, 'When a wife mysteriously disappears, her husband becomes the prime suspect. Twists, secrets, and shocking revelations unravel in this gripping psychological thriller.', 6, 3, 11, 4.70, '2024-12-18 01:44:03'),
(10, 'La La Land', 150.00, 'Two dreamers chase their ambitions in Los Angeles while falling in love. A bittersweet story about passion, love, and the choices we make to follow our dreams.', 6, 2, 13, 4.80, '2024-12-18 01:45:24'),
(11, 'Free Solo', 110.00, 'This documentary follows climber Alex Honnold as he attempts to scale the 3,000-foot El Capitan wall without any ropes or safety equipment. A breathtaking and nerve-wracking achievement.', 7, 2, 9, 4.90, '2024-12-18 01:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `video_tape_images`
--

CREATE TABLE `video_tape_images` (
  `id` int(11) NOT NULL,
  `video_tape_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video_tape_images`
--

INSERT INTO `video_tape_images` (`id`, `video_tape_id`, `image_url`, `is_primary`, `created_at`) VALUES
(3, 3, '/uploads/ralph1.jpg', 1, '2024-12-18 01:18:24'),
(4, 3, '/uploads/ralph2.jpg', 0, '2024-12-18 01:18:24'),
(5, 4, '/uploads/MadMax1.jpg', 1, '2024-12-18 01:31:51'),
(6, 4, '/uploads/MadMax2.jpg', 0, '2024-12-18 01:31:51'),
(7, 4, '/uploads/MadMax3.jpg', 0, '2024-12-18 01:31:51'),
(8, 5, '/uploads/TheHangover1.jpg', 1, '2024-12-18 01:33:11'),
(9, 5, '/uploads/TheHangover2.jpg', 0, '2024-12-18 01:33:11'),
(10, 6, '/uploads/Happyness1.jpg', 1, '2024-12-18 01:34:44'),
(11, 6, '/uploads/Happyness2.jpg', 0, '2024-12-18 01:34:44'),
(12, 6, '/uploads/Happyness3.jpg', 0, '2024-12-18 01:34:44'),
(13, 7, '/uploads/Conjuring1.jpg', 1, '2024-12-18 01:41:05'),
(14, 7, '/uploads/Conjuring2.jpg', 0, '2024-12-18 01:41:05'),
(15, 8, '/uploads/Interstellar1.jpg', 1, '2024-12-18 01:42:28'),
(16, 8, '/uploads/Interstellar2.jpg', 0, '2024-12-18 01:42:28'),
(17, 8, '/uploads/Interstellar3.jpg', 0, '2024-12-18 01:42:28'),
(18, 9, '/uploads/GoneGirl1.jpg', 1, '2024-12-18 01:44:03'),
(19, 9, '/uploads/GoneGirl2.jpg', 0, '2024-12-18 01:44:03'),
(20, 9, '/uploads/GoneGirl3.jpg', 0, '2024-12-18 01:44:03'),
(29, 10, '/uploads/Lalaland1.jpg', 1, '2024-12-18 01:58:03'),
(30, 10, '/uploads/Lalaland2.jpg', 0, '2024-12-18 01:58:03'),
(31, 10, '/uploads/Lalaland3.jpg', 0, '2024-12-18 01:58:03'),
(32, 11, '/uploads/Solo1.jpg', 1, '2024-12-18 01:58:12'),
(33, 11, '/uploads/Solo2.jpg', 0, '2024-12-18 01:58:12'),
(34, 2, '/uploads/1734482998959.jpg', 1, '2024-12-18 01:58:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `video_tapes`
--
ALTER TABLE `video_tapes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `video_tape_images`
--
ALTER TABLE `video_tape_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_tape_id` (`video_tape_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `video_tapes`
--
ALTER TABLE `video_tapes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `video_tape_images`
--
ALTER TABLE `video_tape_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `video_tapes`
--
ALTER TABLE `video_tapes`
  ADD CONSTRAINT `video_tapes_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `video_tape_images`
--
ALTER TABLE `video_tape_images`
  ADD CONSTRAINT `video_tape_images_ibfk_1` FOREIGN KEY (`video_tape_id`) REFERENCES `video_tapes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
