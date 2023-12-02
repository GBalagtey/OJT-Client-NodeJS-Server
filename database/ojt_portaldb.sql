-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 02, 2023 at 03:41 AM
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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `companyID` int NOT NULL,
  `companyName` varchar(35) NOT NULL,
  `companyLocation` varchar(35) NOT NULL,
  `companyDescription` text NOT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyID`, `companyName`, `companyLocation`, `companyDescription`) VALUES
(1, 'ABC Corporation', 'Makati City', 'A leading technology company specializing in software development.'),
(2, 'XYZ Solutions', 'Taguig City', 'Provides innovative solutions for businesses in various industries.'),
(3, '123 Manufacturing', 'Quezon City', 'Specializes in manufacturing high-quality products for the local market.'),
(4, 'Super Logistics', 'Pasig City', 'Offers logistics and supply chain management services.'),
(5, 'Green Energy Solutions', 'Manila', 'A company committed to providing sustainable energy solutions.');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseID` int NOT NULL,
  `courseCode` int NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `programID` int NOT NULL,
  `courseNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `programID` (`programID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `courseCode`, `courseName`, `programID`, `courseNumber`) VALUES
(1, 9333, 'Practicum', 1, 'CS 331'),
(2, 9335, 'Practicum', 1, 'CS 331'),
(3, 9225, 'Practicum', 2, 'IT 331'),
(4, 9222, 'Practicum', 2, 'IT 331');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `departmentID` int NOT NULL,
  `departmentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departmentAcronym` varchar(20) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentID`, `departmentName`, `departmentAcronym`) VALUES
(1, 'School of Accountancy, Management, Computer, and Information Studies', 'SAMCIS'),
(2, 'School of Nursing, Allied Health and Biological Sciences', 'SONAHBS'),
(3, 'School of Engineering and Architecture', 'SEA'),
(4, 'School of Teacher Education and Liberal Arts', 'STELA');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `docID` int NOT NULL,
  `docName` varchar(20) NOT NULL,
  PRIMARY KEY (`docID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`docID`, `docName`) VALUES
(1, 'Medical Certificate');

-- --------------------------------------------------------

--
-- Table structure for table `document_submission`
--

DROP TABLE IF EXISTS `document_submission`;
CREATE TABLE IF NOT EXISTS `document_submission` (
  `submissionID` int NOT NULL,
  `studID` int NOT NULL,
  `documentID` int NOT NULL,
  `hasBeenSubmitted` tinyint(1) NOT NULL,
  PRIMARY KEY (`submissionID`),
  KEY `studID` (`studID`),
  KEY `documentID` (`documentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `document_submission`
--

INSERT INTO `document_submission` (`submissionID`, `studID`, `documentID`, `hasBeenSubmitted`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ojt_records`
--

DROP TABLE IF EXISTS `ojt_records`;
CREATE TABLE IF NOT EXISTS `ojt_records` (
  `recordID` int NOT NULL,
  `studID` int NOT NULL,
  `teacherID` int NOT NULL,
  `companyID` int NOT NULL,
  `renderedHours` int NOT NULL,
  `date` date NOT NULL,
  `workDescription` text NOT NULL,
  PRIMARY KEY (`recordID`),
  KEY `studID` (`studID`),
  KEY `teacherID` (`teacherID`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ojt_requirements`
--

DROP TABLE IF EXISTS `ojt_requirements`;
CREATE TABLE IF NOT EXISTS `ojt_requirements` (
  `requirementID` int NOT NULL,
  `requiredHours` time NOT NULL,
  PRIMARY KEY (`requirementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ojt_requirements`
--

INSERT INTO `ojt_requirements` (`requirementID`, `requiredHours`) VALUES
(1, '400:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `programID` int NOT NULL,
  `departmentID` int NOT NULL,
  `programName` varchar(10) NOT NULL,
  `programDescription` varchar(100) NOT NULL,
  PRIMARY KEY (`programID`),
  KEY `departmentID` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`programID`, `departmentID`, `programName`, `programDescription`) VALUES
(1, 1, 'BSCS', 'Bachelor of Science in Computer Science'),
(2, 1, 'BSIT', 'Bachelor of Science in Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studID` int NOT NULL,
  `studEmail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `programID` int NOT NULL,
  `teacherID` int NOT NULL,
  `companyID` int NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `supervisor` varchar(100) NOT NULL,
  `totalRenderedHours` time DEFAULT NULL,
  `demerit` time DEFAULT NULL,
  `middleInitial` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `suffix` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`studID`),
  KEY `studEmail` (`studEmail`),
  KEY `programID` (`programID`),
  KEY `teacherID` (`teacherID`),
  KEY `companyID` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studID`, `studEmail`, `programID`, `teacherID`, `companyID`, `firstName`, `lastName`, `supervisor`, `totalRenderedHours`, `demerit`, `middleInitial`, `suffix`) VALUES
(1, '2222613@slu.edu.ph', 1, 1, 1, 'Kaizer', 'Oman', 'Henry Cavill', '00:00:00', NULL, 'S', NULL),
(2, '2214027@slu.edu.ph', 1, 1, 2, 'Gregg', 'Balagtey', 'Axl Rose', '00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacherID` int NOT NULL,
  `teacherEmail` varchar(20) NOT NULL,
  `firstName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middleInitial` varchar(1) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`teacherID`),
  KEY `teacherEmail` (`teacherEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherID`, `teacherEmail`, `firstName`, `lastName`, `middleInitial`, `prefix`, `suffix`) VALUES
(1, 'lanadelray@slu.edu.p', 'Elizabeth', 'Grant', 'W', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(20) NOT NULL,
  `hashedPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userType` varchar(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `hashedPassword`, `userType`) VALUES
('2214027@slu.edu.ph', '$2b$10$BbCbatv6i1neu82eC.Aj7.gevFU16gJl6w/xa346p2eGMMfC2fbgS', 'student'),
('2222613@slu.edu.ph', '$2b$10$AASMjbqWSFKGl4IDpCG3gej2GnRF6k3g9o234Sna/sBwhLKI9fRrS', 'student'),
('lanadelray@slu.edu.p', '$2b$10$.NyqdKwIu6RAQUUgglxTqOAyZt7H7b/YnTU2kMqAawvonkP0E4WjS', 'teacher');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_programID` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`);

--
-- Constraints for table `document_submission`
--
ALTER TABLE `document_submission`
  ADD CONSTRAINT `document_submission_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  ADD CONSTRAINT `document_submission_ibfk_2` FOREIGN KEY (`documentID`) REFERENCES `document` (`docID`);

--
-- Constraints for table `ojt_records`
--
ALTER TABLE `ojt_records`
  ADD CONSTRAINT `ojt_records_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  ADD CONSTRAINT `ojt_records_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  ADD CONSTRAINT `ojt_records_ibfk_3` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`);

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`studEmail`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacherEmail`) REFERENCES `users` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
