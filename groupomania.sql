-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2022 at 10:11 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `groupomania`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `txt` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `txt`, `createdAt`, `updatedAt`, `userId`, `postId`) VALUES
(1, 'J\'attend de récupérer ma carte SD !', '2022-03-22 09:01:11', '2022-03-22 09:01:11', 1, 1),
(2, 'Tu es allée ou ?', '2022-03-22 09:09:55', '2022-03-22 09:09:55', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `txt` text NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `txt`, `likes`, `dislikes`, `imageUrl`, `createdAt`, `updatedAt`, `userId`) VALUES
(1, 'Mes vacances de la Toussaint', 'C\'était trop bien je vous envoi des photos bientôt !', 1, 1, '', '2022-03-22 09:00:36', '2022-03-22 09:07:08', 1),
(2, 'Mon pseudo', 'Pour ceux qui n\'ont pas la ref, la princesse Zelda c\'est elle :)', 1, 0, '1647940130092.jpeg', '2022-03-22 09:08:50', '2022-03-22 09:08:57', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(10) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `role` enum('admin','moderator','simple') DEFAULT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `description` varchar(155) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `pwd`, `role`, `first_name`, `last_name`, `description`, `email`, `createdAt`, `updatedAt`) VALUES
(1, 'Link', '$2b$10$Mc9M8C/JOuHQ8jOZdMvETehkzgVbK1BgBnz6Ie.v3KECBMNrNgQuW', NULL, 'Jean', 'Dupont', NULL, 'jean@dupont.com', '2022-03-22 08:59:24', '2022-03-22 08:59:24'),
(2, 'Zelda', '$2b$10$s.TYJy4GFM9gIDxyB2TQYuLEeFKi572x0g8ZSDd.HXejBxrKqTfLK', NULL, 'Charlotte', 'Aufraises', NULL, 'chacha@hotmail.com', '2022-03-22 09:03:57', '2022-03-22 09:03:57');

-- --------------------------------------------------------

--
-- Table structure for table `usersdislikes`
--

CREATE TABLE `usersdislikes` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usersdislikes`
--

INSERT INTO `usersdislikes` (`id`, `userId`, `postId`, `createdAt`, `updatedAt`) VALUES
(1, 2, 1, '2022-03-22 09:07:08', '2022-03-22 09:07:08');

-- --------------------------------------------------------

--
-- Table structure for table `userslikes`
--

CREATE TABLE `userslikes` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userslikes`
--

INSERT INTO `userslikes` (`id`, `userId`, `postId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2022-03-22 09:01:31', '2022-03-22 09:01:31'),
(2, 2, 2, '2022-03-22 09:08:57', '2022-03-22 09:08:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usersdislikes`
--
ALTER TABLE `usersdislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `userslikes`
--
ALTER TABLE `userslikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `postId` (`postId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usersdislikes`
--
ALTER TABLE `usersdislikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userslikes`
--
ALTER TABLE `userslikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usersdislikes`
--
ALTER TABLE `usersdislikes`
  ADD CONSTRAINT `usersdislikes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usersdislikes_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userslikes`
--
ALTER TABLE `userslikes`
  ADD CONSTRAINT `userslikes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userslikes_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
