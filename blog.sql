-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2024 at 07:51 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `Categoryname` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) NOT NULL,
  `Postid` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Commenttext` text NOT NULL,
  `Createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(10) NOT NULL,
  `Userid` int(10) NOT NULL,
  `Massage` text NOT NULL,
  `Isread` tinyint(1) NOT NULL,
  `Createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(10) NOT NULL,
  `Tittle` varchar(225) NOT NULL,
  `Description` text NOT NULL,
  `Tags` text NOT NULL,
  `Categoryid` int(11) NOT NULL,
  `Authoried` int(1) NOT NULL,
  `Createdate` datetime NOT NULL,
  `Updatedate` datetime NOT NULL,
  `Upvote` int(11) NOT NULL,
  `Downvote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posttag`
--

CREATE TABLE `posttag` (
  `id` int(10) NOT NULL,
  `Postid` int(11) NOT NULL,
  `Tagid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(10) NOT NULL,
  `Userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(10) NOT NULL,
  `Tagname` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Username` varchar(225) NOT NULL,
  `Password` varchar(225) NOT NULL,
  `Role` varchar(225) NOT NULL,
  `Joindate` datetime NOT NULL,
  `Address` text NOT NULL,
  `points` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id` int(10) NOT NULL,
  `Postid` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Votetype` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Comment` (`Postid`),
  ADD KEY `test1` (`Userid`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification` (`Userid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post` (`Categoryid`);

--
-- Indexes for table `posttag`
--
ALTER TABLE `posttag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Posttag` (`Tagid`),
  ADD KEY `test3` (`Postid`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registiration` (`Userid`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Vote` (`Postid`),
  ADD KEY `test` (`Userid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `Comment` FOREIGN KEY (`Postid`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `test1` FOREIGN KEY (`Userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification` FOREIGN KEY (`Userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post` FOREIGN KEY (`Categoryid`) REFERENCES `category` (`id`);

--
-- Constraints for table `posttag`
--
ALTER TABLE `posttag`
  ADD CONSTRAINT `test3` FOREIGN KEY (`Postid`) REFERENCES `post` (`id`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registiration` FOREIGN KEY (`Userid`) REFERENCES `user` (`id`);

--
-- Constraints for table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `Vote` FOREIGN KEY (`Postid`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `test` FOREIGN KEY (`Userid`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
