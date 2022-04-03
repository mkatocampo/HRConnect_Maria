-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 03, 2022 at 12:44 AM
-- Server version: 5.7.36-log
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrconnect`
--
DROP DATABASE IF EXISTS `hrconnect`;
CREATE DATABASE IF NOT EXISTS `hrconnect` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hrconnect`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL,
  `deptName` varchar(100) NOT NULL,
  `deptManagerid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `deptName`, `deptManagerid`) VALUES
(1, 'Finance', 1),
(2, 'Human Resource', 2),
(3, 'Information Technology', 4);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(10) NOT NULL,
  `firstName` varchar(150) NOT NULL,
  `lastName` varchar(150) NOT NULL,
  `dob` date NOT NULL,
  `sin` int(9) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `streetAddress` varchar(255) NOT NULL,
  `postalCode` varchar(6) DEFAULT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `hiredDate` date NOT NULL,
  `terminatedDate` date DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `Userid` int(10) DEFAULT NULL,
  `Jobid` int(10) NOT NULL,
  `EmployeeTypeid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `firstName`, `lastName`, `dob`, `sin`, `gender`, `streetAddress`, `postalCode`, `province`, `city`, `country`, `email`, `phoneNumber`, `hiredDate`, `terminatedDate`, `isActive`, `salary`, `Userid`, `Jobid`, `EmployeeTypeid`) VALUES
(1, 'Maria', 'Ocampo', '2022-03-03', 111222333, 'Female', '111 Street', 'AAA111', 'NB', 'Moncton', 'Canada', 'mo@gmail.com', '+506111111', '1993-03-03', NULL, b'0', '4000.00', NULL, 1, 1),
(2, 'John', 'Doe', '2022-04-11', 222111333, 'Male', '43 Street', 'BBB222', 'NB', 'Moncton', 'Canada', 'jd@gmail.com',  '+506222222', '1950-05-26', NULL, b'0', '3200.00', NULL, 2, 1),
(3, 'May', 'Guzman', '2022-04-05', 333111222, 'Female', '103 Street', 'CCC333', 'NB', 'Saint John', 'Canada', 'mg@gmail.com', '+506333333', '1986-08-27', NULL, b'0', '5000.00', NULL, 3, 1),
(4, 'Peter', 'Jones', '2022-04-03', 444555666, 'Male', '26 Street', 'DDD444', 'NB', 'Fredericton', 'Canada', 'pj@gmail.com', '+506444444', '1990-01-04', NULL, b'0', '1000.00', NULL, 1, 2),
(5, 'Joseph', 'Tan', '2022-04-11', 555666444, 'Male', '18 Street', 'EEE555', 'NB', 'Saint John', 'Canada', 'jt@gmail.com', '+506555555', '1999-11-04', NULL, b'0', '2500.00', NULL, 2, 1),
(6, 'Rebecca', 'Andrews', '2022-04-04', 666444555, 'Female', '222 Street', 'FFF666', 'NB', 'Miramichi', 'Canada', 'ra@gmail.com', '+506666666', '2000-12-02', NULL, b'0', '2000.00', NULL, 2, 1),
(7, 'Tim', 'Horton', '2022-04-10', 777888999, 'Male', '451 Street', 'GGG777', 'NB', 'Moncton', 'Canada', 'th@gmail.com', '+506888888', '2002-04-06', NULL, b'0', '1000.00', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employeetype`
--

DROP TABLE IF EXISTS `employeetype`;
CREATE TABLE `employeetype` (
  `id` int(10) NOT NULL,
  `empType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeetype`
--

INSERT INTO `employeetype` (`id`, `empType`) VALUES
(1, 'Full-time'),
(2, 'Part-time');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(10) NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `Departmentid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `jobTitle`, `Departmentid`) VALUES
(1, 'Accounting Manager', 1),
(2, 'Accounting Associate', 1),
(3, 'HR Manager', 2),
(4, 'HR Associate', 2),
(5, 'IT Manager', 3),
(6, 'IT Associate', 3);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) NOT NULL,
  `roleName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `roleName`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` int(30) NOT NULL,
  `Roleid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `Roleid`) VALUES
(1, 'dev', 1234, 1),
(2, 'maria', 1234, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manages` (`deptManagerid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKEmployee400145` (`Userid`),
  ADD KEY `employed as` (`EmployeeTypeid`),
  ADD KEY `works as` (`Jobid`);

--
-- Indexes for table `employeetype`
--
ALTER TABLE `employeetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has many` (`Departmentid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `belongs to` (`Roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employeetype`
--
ALTER TABLE `employeetype`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `manages` FOREIGN KEY (`deptManagerid`) REFERENCES `employee` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FKEmployee400145` FOREIGN KEY (`Userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `employed as` FOREIGN KEY (`EmployeeTypeid`) REFERENCES `employeetype` (`id`),
  ADD CONSTRAINT `works as` FOREIGN KEY (`Jobid`) REFERENCES `job` (`id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `has many` FOREIGN KEY (`Departmentid`) REFERENCES `department` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `belongs to` FOREIGN KEY (`Roleid`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
