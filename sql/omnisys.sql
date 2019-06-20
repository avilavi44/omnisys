-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 18, 2019 at 11:59 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omnisys`
--

-- --------------------------------------------------------

--
-- Table structure for table `entityTypesTable`
--

CREATE TABLE `entityTypesTable` (
  `entityTypeId` int(11) NOT NULL,
  `iconId` int(11) NOT NULL,
  `entityName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `groupId` int(11) NOT NULL,
  `systemId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entityTypesTable`
--

INSERT INTO `entityTypesTable` (`entityTypeId`, `iconId`, `entityName`, `groupId`, `systemId`) VALUES
(2, 11, 'GenericRadar12', 1, 1),
(3, 12, 'GreenRadar', 1, 1),
(4, 33, 'AOI', 2, 1),
(5, 34, 'Missile13', 2, 1),
(2, 11, 'GenericRadar11', 3, 2),
(5, 34, 'Missile', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `iconTable`
--

CREATE TABLE `iconTable` (
  `iconId` int(11) NOT NULL,
  `iconName` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iconTable`
--

INSERT INTO `iconTable` (`iconId`, `iconName`) VALUES
(11, 'radars/GSensor.png'),
(12, 'radars/GreenRadar.png'),
(33, 'targets/AOI.png'),
(34, 'targets/RedMissile.png');

-- --------------------------------------------------------

--
-- Table structure for table `MainTable`
--

CREATE TABLE `MainTable` (
  `groupId` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `systemId` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MainTable`
--

INSERT INTO `MainTable` (`groupId`, `name`, `systemId`, `visible`) VALUES
(1, 'Radars', 1, 1),
(2, 'Targets', 1, 1),
(3, 'mixed', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entityTypesTable`
--
ALTER TABLE `entityTypesTable`
  ADD KEY `groupId` (`groupId`),
  ADD KEY `iconId` (`iconId`),
  ADD KEY `systemId` (`systemId`),
  ADD KEY `systemId_2` (`systemId`);

--
-- Indexes for table `iconTable`
--
ALTER TABLE `iconTable`
  ADD PRIMARY KEY (`iconId`);

--
-- Indexes for table `MainTable`
--
ALTER TABLE `MainTable`
  ADD PRIMARY KEY (`groupId`),
  ADD KEY `systemId` (`systemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `MainTable`
--
ALTER TABLE `MainTable`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `entityTypesTable`
--
ALTER TABLE `entityTypesTable`
  ADD CONSTRAINT `entitytypestable_ibfk_2` FOREIGN KEY (`iconId`) REFERENCES `iconTable` (`iconId`),
  ADD CONSTRAINT `entitytypestable_ibfk_3` FOREIGN KEY (`groupId`) REFERENCES `MainTable` (`groupId`),
  ADD CONSTRAINT `entitytypestable_ibfk_4` FOREIGN KEY (`systemId`) REFERENCES `MainTable` (`systemId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
