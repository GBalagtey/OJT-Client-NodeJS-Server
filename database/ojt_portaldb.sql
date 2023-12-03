-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ojt_portaldb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyID` int NOT NULL,
  `companyName` varchar(35) NOT NULL,
  `companyLocation` varchar(35) NOT NULL,
  `companyDescription` text NOT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'ABC Corporation','Makati City','A leading technology company specializing in software development.'),(2,'XYZ Solutions','Taguig City','Provides innovative solutions for businesses in various industries.'),(3,'123 Manufacturing','Quezon City','Specializes in manufacturing high-quality products for the local market.'),(4,'Super Logistics','Pasig City','Offers logistics and supply chain management services.'),(5,'Green Energy Solutions','Manila','A company committed to providing sustainable energy solutions.');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseID` int NOT NULL,
  `courseCode` int NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `programID` int NOT NULL,
  `courseNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `programID` (`programID`),
  CONSTRAINT `fk_programID` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,9333,'Practicum',1,'CS 331'),(2,9335,'Practicum',1,'CS 331'),(3,9225,'Practicum',2,'IT 331'),(4,9222,'Practicum',2,'IT 331');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL,
  `departmentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departmentAcronym` varchar(20) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'School of Accountancy, Management, Computer, and Information Studies','SAMCIS'),(2,'School of Nursing, Allied Health and Biological Sciences','SONAHBS'),(3,'School of Engineering and Architecture','SEA'),(4,'School of Teacher Education and Liberal Arts','STELA');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `docID` int NOT NULL,
  `docName` varchar(20) NOT NULL,
  PRIMARY KEY (`docID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (1,'Medical Certificate');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_submission`
--

DROP TABLE IF EXISTS `document_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_submission` (
  `submissionID` int NOT NULL,
  `studID` int NOT NULL,
  `documentID` int NOT NULL,
  `hasBeenSubmitted` tinyint(1) NOT NULL,
  PRIMARY KEY (`submissionID`),
  KEY `studID` (`studID`),
  KEY `documentID` (`documentID`),
  CONSTRAINT `document_submission_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  CONSTRAINT `document_submission_ibfk_2` FOREIGN KEY (`documentID`) REFERENCES `document` (`docID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_submission`
--

LOCK TABLES `document_submission` WRITE;
/*!40000 ALTER TABLE `document_submission` DISABLE KEYS */;
INSERT INTO `document_submission` VALUES (1,1,1,1),(2,2,1,1);
/*!40000 ALTER TABLE `document_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ojt_records`
--

DROP TABLE IF EXISTS `ojt_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ojt_records` (
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
  KEY `companyID` (`companyID`),
  CONSTRAINT `ojt_records_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  CONSTRAINT `ojt_records_ibfk_3` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`),
  CONSTRAINT `ojt_records_ibfk_4` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ojt_records`
--

LOCK TABLES `ojt_records` WRITE;
/*!40000 ALTER TABLE `ojt_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `ojt_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ojt_requirements`
--

DROP TABLE IF EXISTS `ojt_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ojt_requirements` (
  `requirementID` int NOT NULL,
  `requiredHours` time NOT NULL,
  PRIMARY KEY (`requirementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ojt_requirements`
--

LOCK TABLES `ojt_requirements` WRITE;
/*!40000 ALTER TABLE `ojt_requirements` DISABLE KEYS */;
INSERT INTO `ojt_requirements` VALUES (1,'400:00:00');
/*!40000 ALTER TABLE `ojt_requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `programID` int NOT NULL,
  `departmentID` int NOT NULL,
  `programName` varchar(10) NOT NULL,
  `programDescription` varchar(100) NOT NULL,
  PRIMARY KEY (`programID`),
  KEY `departmentID` (`departmentID`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,1,'BSCS','Bachelor of Science in Computer Science'),(2,1,'BSIT','Bachelor of Science in Information Technology');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studID` int NOT NULL,
  `studEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
  `phoneNumber` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`studID`),
  KEY `studEmail` (`studEmail`),
  KEY `programID` (`programID`),
  KEY `teacherID` (`teacherID`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`),
  CONSTRAINT `student_ibfk_4` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`),
  CONSTRAINT `student_ibfk_5` FOREIGN KEY (`studEmail`) REFERENCES `users` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_ibfk_6` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'2222613@slu.edu.ph',1,1,1,'Kaizer','Oman','Henry Cavill','00:00:00',NULL,'S',NULL,NULL,NULL,NULL),(2,'2214027@slu.edu.ph',1,1,2,'Gregg','Balagtey','Axl Rose','00:00:00',NULL,NULL,NULL,949619841,'2001-10-26','#74 Bakakeng Street, Baguio City');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacherID` int NOT NULL,
  `teacherEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middleInitial` varchar(1) DEFAULT NULL,
  `prefix` varchar(10) DEFAULT NULL,
  `suffix` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`teacherID`),
  KEY `teacherEmail` (`teacherEmail`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacherEmail`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'lanadelrey@slu.edu.ph','Elizabeth','Grant',NULL,NULL,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hashedPassword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userType` varchar(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('2214027@slu.edu.ph','$2b$10$BbCbatv6i1neu82eC.Aj7.gevFU16gJl6w/xa346p2eGMMfC2fbgS','student'),('2222613@slu.edu.ph','$2b$10$AASMjbqWSFKGl4IDpCG3gej2GnRF6k3g9o234Sna/sBwhLKI9fRrS','student'),('lanadelrey@slu.edu.ph','$2b$10$.NyqdKwIu6RAQUUgglxTqOAyZt7H7b/YnTU2kMqAawvonkP0E4WjS','teacher');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03 13:18:56
