-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2023 at 01:42 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ojt_portaldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `announcementID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`announcementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `companyID` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(35) NOT NULL,
  `companyLocation` varchar(35) NOT NULL,
  `companyDescription` text NOT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseCode` int NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `programID` int NOT NULL,
  `courseNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`courseCode`),
  KEY `programID` (`programID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `departmentAcronym` varchar(20) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `docID` int NOT NULL AUTO_INCREMENT,
  `docName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `isOptional` tinyint(1) NOT NULL,
  PRIMARY KEY (`docID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_sub`
--

DROP TABLE IF EXISTS `document_sub`;
CREATE TABLE IF NOT EXISTS `document_sub` (
  `docID` int NOT NULL,
  `studID` int NOT NULL,
  PRIMARY KEY (`docID`,`studID`),
  KEY `document_sub_ibfk_1` (`studID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `genderID` int NOT NULL AUTO_INCREMENT,
  `genderDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`genderID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ojt_records`
--

DROP TABLE IF EXISTS `ojt_records`;
CREATE TABLE IF NOT EXISTS `ojt_records` (
  `recordID` int NOT NULL AUTO_INCREMENT,
  `studID` int NOT NULL,
  `companyID` int NOT NULL,
  `renderedHours` time NOT NULL,
  `date` date NOT NULL,
  `workDescription` text NOT NULL,
  PRIMARY KEY (`recordID`),
  KEY `studID` (`studID`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ojt_requirements`
--

DROP TABLE IF EXISTS `ojt_requirements`;
CREATE TABLE IF NOT EXISTS `ojt_requirements` (
  `requirementID` int NOT NULL AUTO_INCREMENT,
  `requiredHours` time NOT NULL,
  PRIMARY KEY (`requirementID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `programID` int NOT NULL AUTO_INCREMENT,
  `departmentID` int NOT NULL,
  `programName` varchar(10) NOT NULL,
  `programDescription` varchar(100) NOT NULL,
  PRIMARY KEY (`programID`),
  KEY `departmentID` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studID` int NOT NULL,
  `studEmail` varchar(100) NOT NULL,
  `courseID` int NOT NULL,
  `companyID` int DEFAULT NULL,
  `teacherID` int NOT NULL,
  `requirementID` int NOT NULL,
  `totalRenderedHours` time NOT NULL,
  `demerit` time NOT NULL,
  `supervisor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`studID`),
  KEY `studEmail` (`studEmail`,`courseID`,`companyID`,`teacherID`),
  KEY `courseID` (`courseID`),
  KEY `teacherID` (`teacherID`),
  KEY `companyID` (`companyID`),
  KEY `requirementID` (`requirementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherID` int NOT NULL AUTO_INCREMENT,
  `teacherEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `departmentID` int DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`teacherID`),
  KEY `teacherEmail` (`teacherEmail`,`departmentID`),
  KEY `departmentID` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hashedPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `userType` varchar(10) NOT NULL,
  `genderID` int NOT NULL,
  `photo` longblob,
  `firstName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `middleInitial` varchar(1) DEFAULT NULL,
  `suffix` varchar(5) DEFAULT NULL,
  `birthDate` date NOT NULL,
  `phoneNumber` int DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `genderID` (`genderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`);

--
-- Constraints for table `document_sub`
--
ALTER TABLE `document_sub`
  ADD CONSTRAINT `document_sub_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  ADD CONSTRAINT `document_sub_ibfk_2` FOREIGN KEY (`docID`) REFERENCES `document` (`docID`);

--
-- Constraints for table `ojt_records`
--
ALTER TABLE `ojt_records`
  ADD CONSTRAINT `ojt_records_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  ADD CONSTRAINT `ojt_records_ibfk_2` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`);

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseCode`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`studEmail`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`),
  ADD CONSTRAINT `student_ibfk_5` FOREIGN KEY (`requirementID`) REFERENCES `ojt_requirements` (`requirementID`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacherEmail`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`genderID`) REFERENCES `gender` (`genderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
