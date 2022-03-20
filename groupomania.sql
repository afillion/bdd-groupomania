-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2022 at 09:44 AM
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
(1, 'Lorem ipsum dolor sit amet', '2022-03-20 08:43:32', '2022-03-20 08:43:32', 1, 1),
(2, 'Lorem ipsum dolor sit amet', '2022-03-20 08:43:34', '2022-03-20 08:43:34', 1, 2),
(3, 'Lorem ipsum dolor sit amet', '2022-03-20 08:43:36', '2022-03-20 08:43:36', 2, 1),
(4, 'Lorem ipsum dolor sit amet', '2022-03-20 08:43:38', '2022-03-20 08:43:38', 2, 2);

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
(1, 'titre du post modifOne', 'ModifOne Lorem ipsum dolor sit amet', 0, 0, 'http://localhost:3000/images/modif-one', '2022-03-20 08:41:47', '2022-03-20 08:43:26', 1),
(2, 'titre du post', 'Lorem ipsum dolor sit amet', 0, 0, 'http://localhost:3000/images/', '2022-03-20 08:43:05', '2022-03-20 08:43:05', 2);

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
(1, 'L\'élu', '$2b$10$u6PbKzY3h2SLAbW9lwS43.wAUqzJiaTeu64CpltrLr2A7ZgZeKDC6', 'admin', 'Link', 'oot', 'Lorem ipsum dolor sit amet', 'test@test.com', '2022-03-20 08:40:50', '2022-03-20 08:40:50'),
(2, 'Princesse', '$2b$10$81Teg624peTejCd9IHbEPu.qo/cliY1in2Sp2UK3OiWLIb3KpHBce', 'admin', 'Zelda', 'oot', 'Lorem ipsum dolor sit amet', 'test2@test.com', '2022-03-20 08:41:10', '2022-03-20 08:41:10');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userslikes`
--
ALTER TABLE `userslikes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userslikes`
--
ALTER TABLE `userslikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
