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
  `courseCode` int NOT NULL,
  `courseName` varchar(100) NOT NULL,
  `programID` int NOT NULL,
  `courseNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`courseCode`),
  KEY `programID` (`programID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (9222,'Practicum',2,'IT 331'),(9225,'Practicum',2,'IT 331'),(9333,'Practicum',1,'CS 331'),(9335,'Practicum',1,'CS 331');
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
-- Table structure for table `document_sub`
--

DROP TABLE IF EXISTS `document_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_sub` (
  `submissionID` int NOT NULL,
  `docID` int NOT NULL,
  `studID` int NOT NULL,
  `hasBeenSubmitted` tinyint(1) NOT NULL,
  PRIMARY KEY (`submissionID`),
  KEY `docID` (`docID`,`studID`),
  KEY `studID` (`studID`),
  CONSTRAINT `document_sub_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  CONSTRAINT `document_sub_ibfk_2` FOREIGN KEY (`docID`) REFERENCES `document` (`docID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_sub`
--

LOCK TABLES `document_sub` WRITE;
/*!40000 ALTER TABLE `document_sub` DISABLE KEYS */;
INSERT INTO `document_sub` VALUES (1,1,2222613,1),(2,1,2214027,1);
/*!40000 ALTER TABLE `document_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `genderID` int NOT NULL,
  `genderDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`genderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Prefer not to say');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ojt_records`
--

DROP TABLE IF EXISTS `ojt_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ojt_records` (
  `recordID` int NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `ojt_records_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  CONSTRAINT `ojt_records_ibfk_3` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ojt_records`
--

LOCK TABLES `ojt_records` WRITE;
/*!40000 ALTER TABLE `ojt_records` DISABLE KEYS */;
INSERT INTO `ojt_records` VALUES (1,2214027,1,1,2,'2023-12-03','2'),(2,2214027,1,1,2,'2023-12-03','2'),(3,2214027,1,1,3,'2023-12-03','3'),(4,2214027,1,1,56,'2023-12-03','56'),(5,2214027,1,1,3,'2023-12-03','3'),(6,2214027,1,1,4,'2023-12-03','onemore');
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
  `studEmail` varchar(100) NOT NULL,
  `courseID` int NOT NULL,
  `companyID` int DEFAULT NULL,
  `teacherID` int NOT NULL,
  `genderID` int NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `middleInitial` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photo` blob,
  `birthDate` date NOT NULL,
  `totalRenderedHours` time NOT NULL,
  `demerit` time DEFAULT NULL,
  `phoneNumber` int DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `supervisor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`studID`),
  KEY `studEmail` (`studEmail`,`courseID`,`companyID`,`teacherID`,`genderID`),
  KEY `courseID` (`courseID`),
  KEY `teacherID` (`teacherID`),
  KEY `companyID` (`companyID`),
  KEY `genderID` (`genderID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseCode`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`),
  CONSTRAINT `student_ibfk_3` FOREIGN KEY (`studEmail`) REFERENCES `users` (`email`),
  CONSTRAINT `student_ibfk_4` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`),
  CONSTRAINT `student_ibfk_5` FOREIGN KEY (`genderID`) REFERENCES `gender` (`genderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2214027,'2214027@slu.edu.ph',9333,1,1,1,'Gregg','Balagtey',NULL,NULL,_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\âøICC_PROFILE\0\0\0\è\0\0\0\0\0\0\0mntrRGB XYZ \Ù\0\0\0\0$\0acsp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-\0\0\0\0)ø=Þ¯òU®xBú\äÊƒ9\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0D\0\0\0ybXYZ\0\0À\0\0\0bTRC\0\0\Ô\0\0dmdd\0\0	\à\0\0\0ˆgXYZ\0\0\nh\0\0\0gTRC\0\0\Ô\0\0lumi\0\0\n|\0\0\0meas\0\0\n\0\0\0$bkpt\0\0\n´\0\0\0rXYZ\0\0\n\È\0\0\0rTRC\0\0\Ô\0\0tech\0\0\n\Ü\0\0\0vued\0\0\n\è\0\0\0‡wtpt\0\0p\0\0\0cprt\0\0„\0\0\07chad\0\0¼\0\0\0,desc\0\0\0\0\0\0\0sRGB IEC61966-2-1 black scaled\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0\0†\0‹\0\0•\0š\0Ÿ\0¤\0©\0®\0²\0·\0¼\0Á\0\Æ\0\Ë\0\Ð\0\Õ\0\Û\0\à\0\å\0\ë\0ð\0ö\0û\r%+28>ELRY`gnu|ƒ‹’š¡©±¹Á\É\Ñ\Ù\á\éòú&/8AKT]gqz„Ž˜¢¬¶Á\Ë\Õ\à\ëõ\0!-8COZfr~Š–¢®º\Ç\Ó\à\ìù -;HUcq~Œš¨¶\Ä\Ó\áðþ\r+:IXgw†–¦µ\Å\Õ\åö\'7HYj{Œ¯À\Ñ\ãõ+=Oat†™¬¿\Ò\åø2FZn‚–ª¾\Ò\çû		%	:	O	d	y		¤	º	\Ï	\å	û\n\n\'\n=\nT\nj\n\n˜\n®\n\Å\n\Ü\nó\"9Qi€˜°\È\áù*C\\uŽ§À\Ùó\r\r\r&\r@\rZ\rt\rŽ\r©\r\Ã\r\Þ\rø.Id›¶\Ò\î	%A^z–³\Ï\ì	&Ca~›¹\×õ1OmŒª\É\è&Ed„£\Ã\ã#Ccƒ¤\Å\å\'Ij‹­\Îð4Vx›½\à&Il²\ÖúAe‰®\Ò÷@eŠ¯\Õú Ek‘·\Ý\Z\Z*\ZQ\Zw\Zž\Z\Å\Z\ì;cŠ²\Ú*R{£\ÌõGp™\Ã\ì@j”¾\é>i”¿\ê  A l ˜ \Ä ð!!H!u!¡!\Î!û\"\'\"U\"‚\"¯\"\Ý#\n#8#f#”#\Â#ð$$M$|$«$\Ú%	%8%h%—%\Ç%÷&\'&W&‡&·&\è\'\'I\'z\'«\'\Ü(\r(?(q(¢(\Ô))8)k))\Ð**5*h*›*\Ï++6+i++\Ñ,,9,n,¢,\×--A-v-«-\á..L.‚.·.\î/$/Z/‘/\Ç/þ050l0¤0\Û11J1‚1º1ò2*2c2›2\Ô3\r3F33¸3ñ4+4e4ž4\Ø55M5‡5\Â5ý676r6®6\é7$7`7œ7\×88P8Œ8\È99B99¼9ù:6:t:²:\ï;-;k;ª;\è<\'<e<¤<\ã=\"=a=¡=\à> >`> >\à?!?a?¢?\â@#@d@¦@\çA)AjA¬A\îB0BrBµB÷C:C}CÀDDGDŠD\ÎEEUEšE\ÞF\"FgF«FðG5G{GÀHHKH‘H\×IIcI©IðJ7J}J\ÄKKSKšK\âL*LrLºMMJM“M\ÜN%NnN·O\0OIO“O\ÝP\'PqP»QQPQ›Q\æR1R|R\ÇSS_SªSöTBTT\ÛU(UuU\ÂVV\\V©V÷WDW’W\àX/X}X\ËY\ZYiY¸ZZVZ¦Zõ[E[•[\å\\5\\†\\\Ö]\']x]\É^\Z^l^½__a_³``W`ª`üaOa¢aõbIbœbðcCc—c\ëd@d”d\ée=e’e\çf=f’f\èg=g“g\éh?h–h\ìiCišiñjHjŸj÷kOk§kÿlWl¯mm`m¹nnkn\Äooxo\Ñp+p†p\àq:q•qðrKr¦ss]s¸ttpt\Ìu(u…u\áv>v›vøwVw³xxnx\Ìy*y‰y\çzFz¥{{c{\Â|!||\á}A}¡~~b~\Â#„\å€G€¨\nkÍ‚0‚’‚ôƒWƒº„„€„\ã…G…«††r†×‡;‡ŸˆˆiˆÎ‰3‰™‰þŠdŠÊ‹0‹–‹üŒcŒÊ1˜ÿŽfŽÎ6žnÖ‘?‘¨’’z’\ã“M“¶” ”Š”ô•_•É–4–Ÿ—\n—u—\à˜L˜¸™$™™üšhšÕ›B›¯œœ‰œ÷dÒž@ž®ŸŸ‹Ÿú i Ø¡G¡¶¢&¢–££v£\æ¤V¤Ç¥8¥©¦\Z¦‹¦ý§n§\à¨R¨Ä©7©©ªª««u«\é¬\\¬Ð­D­¸®-®¡¯¯‹°\0°u°\ê±`±Ö²K²Â³8³®´%´œµµŠ¶¶y¶ð·h·\à¸Y¸Ñ¹J¹Âº;ºµ».»§¼!¼›½½¾\n¾„¾ÿ¿z¿õÀpÀ\ìÁgÁ\ã\Â_\Â\Û\ÃX\Ã\Ô\ÄQ\Ä\Î\ÅK\Å\È\ÆF\Æ\Ã\ÇAÇ¿\È=È¼\É:É¹\Ê8Ê·\Ë6Ë¶\Ì5Ìµ\Í5Íµ\Î6Î¶\Ï7Ï¸\Ð9Ðº\Ñ<Ñ¾\Ò?\ÒÁ\ÓD\Ó\Æ\ÔI\Ô\Ë\ÕN\Õ\Ñ\ÖU\Ö\Ø\×\\\×\à\Ød\Ø\è\Ùl\Ùñ\Úv\ÚûÛ€\ÜÜŠ\ÝÝ–\ÞÞ¢\ß)ß¯\à6\à½\áD\á\Ì\âS\â\Û\ãc\ã\ë\äs\äü\å„\æ\r\æ–\ç\ç©\è2\è¼\éF\é\Ð\ê[\ê\å\ëp\ëû\ì†\í\íœ\î(\î´\ï@\ï\ÌðXð\åñrñÿòŒóó§ô4ô\ÂõPõ\Þömöû÷Šøø¨ù8ù\ÇúWú\çûwüü˜ý)ýºþKþ\Üÿmÿÿdesc\0\0\0\0\0\0\0.IEC 61966-2-1 Default RGB Colour Space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0\0\0\0P\0\0\0\0\0\0meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0sig \0\0\0\0CRT desc\0\0\0\0\0\0\0-Reference Viewing Condition in IEC 61966-2-1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-text\0\0\0\0Copyright International Color Consortium, 2009\0\0sf32\0\0\0\0\0D\0\0\ßÿÿó&\0\0”\0\0ýÿÿû¡ÿÿý¢\0\0\Û\0\0Àuÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0CÿÀ\0\Þ\Ð\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0R\0	\0!1A\"Qa2qB‘¡#±Á\Ñ3Rbr\á$CSð4‚ƒ’ñc„\Ò%6DTs”5Ed“¢²\Â\âÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0/\0\0\0\0\0!1AQ\"a2qB¡Rb‘ð#\Ññÿ\Ú\0\0\0?\0\æ>W¥`C\Å²É´öWú\ár(¸u{\ë\'!=œb¼®3^Ž‹D¦#\Ü~5\"’=÷©a–	†RDo¡©D`Š\\š\ìdBb§ `úƒŠgc¬\ß\Û\Ãy*‘ØœŠ\0\Ä=1^zU¬µ\Øqž£t†qï±§üa§Oujðž\ì7\Î\Þ#Š\Â# Ê¹·ŽW\ìk,\ã\Ó:\ÄZ=òb¸Kº\Çõ¬I¤£dP\ÃÚ¹_‰*Œ\çñ\Åmª\ê6\Øhn%_£š\ÕdF«Ê—´_\ä\Ñ<\ÇËµ-º\Ð\×\Ä*S¯µ(´\ã\rV¸”z:\ÓH8\ÞÝˆ7–}þh\ÍZš4^DbS‡1r¡\'\éUó\Ã\Óx¼\Ç\\\×N·\â\r\íp&1ÿ\0˜¸©\Ò\Þ\Ær\ZŠBºÀÖŠdK9½¢}XÁ\ÄyÏµ/š\Ò\î7û\ÊG¥v{º\æ4ý)m\×\rø€1ˆg\éW†y<Xµ£œi\ÚÖ·¦°ð.\æP;smV\í#P·\";\È`ç¡¢nødrü˜4š\ë‡&\0!ÞµYIø´t\'\íGºNIY­\Øÿ\0xmV++\ë;µ\rou€ÿ\0u®!>…ql®Ý±PÁ£fI*ý\ÒEZ\Ès\Ï\Åhú\'EŒ/RA•”À~5\Åtþ3\×,,’Tvqš²\éŸh–Ï…¼£>«Ò­Iò\Å$]®ô»+\Þ ­ý\å\Ø\Ô1G¬\éÿ\0÷ö’1ÿ\0o0¡´þ!\Ó/”xˆI\ìN\r4YANe`Àú\Zz#k²m+Œn´»Ä¸¹µ–\Òeñ¢\ËùTº\Å\å·\\XÅ–ð©_O›\éŠ^Y f\Ò\íd%\ÑLNÌ‡¥\Å1ò\ZA\Zi¼56ž–\ï,\Ò\\¬:¶ )^†›pUÆŸy\Äöv—\Ë~\ï 6Á\Øþ\É\0\ß>˜\ëUd}Z\Ñp“-\Üc\î\È7ü\è\Ý3ˆcµ¹YdIlgS³\ãaø\Ôð.\Ñ\ßN&• \ÜZ\è\Ð-Ä²3º¬\Ò`s¹\'¾*µ\Ã?gD\ïZšK©\å§…\ÎS›ý*©¥qV¨\×V\Þ­\'Á#$q\Ù™;\×OÓ¸Š\ßRx¿«\ÐL¬Ü¯\ÎÜ¬§\éYTÕš®{]Zp­®›ªƒ¡\Û\r2&·e–\â#–f,9Fznrj\Ï,Xúš£^\Þq¤rµýŒ\Ö÷0¿­<´*\ä‘ÿ\0[Š¹O{´\É3d¾0¨2Xûµ2\äô\Ë\Ç(\î•w¯V‘–$–`A9]±Z\ËqNI£Fn˜k3k%¯W†\â½@\ÏW©g]\Ý\Ø\éR]\Ù\Ä%’2	Lu+<;{w}¥\Ç=õ¸·¸\É€\ì0{S­Y<—.#®1\Æ63\è¼@Ñ¤\æU‘\Ìùûø\ë“]CS\â]O\Ï\Ä]¯•¹_”d¡÷\Ìþ\Ñu›;]v-j\Ö#yo,<¡˜§}À>”*öc™ª\Ðë‡µýJþ\Ö\Ú95x\Úi\\\"1Â´y=ÿ\0½µXu\çÓµK˜t»J8£E,\ì¬2\Î6\Æz{\×’öRS6„\Ñ\Æ\ì»U›H\Ö	j<ºÆ™#4\Ö\ácVaÍƒ\Üg±\ïSu*£(J\Õ2\Ëöu¡Oo©M©¦©Õ’¼‘DªI\'|döJ\èIû\"•[A¸‹À1p\Î2™[¦ýý*\áo$$¨\éŽFÀ#¡svÎŒI(¢jUÄ‹\ÚE=\Ãr,3\r\ËÍˆ\éL\åu\Ü\áTdš£q\ç\é¶úc[Z\Üs_‡D\èT¦;ECt¬©´–\É~\Î/$¼»\Ô%iQ‡0\Ø/)\êpqVˆžóú\æX\ÙTÙˆU\ã~|œz\â:_]Yj‹smp\çšDSŒ\ï’µ_o>Ó´¨t“p-\ä‡-\ßno|ŽÔ”¯³(M(\ìm­q41\ëVºM¬­ñ\r#,ª v÷=;\ÕoŒ\Z{\è\ïo¬‘[Xª‡1æ‘³Œ¨ô®cÄœEq­kr\êDe“§„qŒl1\ïF\Ø\\^Þ¥µ­ýóA0æ·!GQŽõ\Ó\Ä\Âyg@\à½oR\ít\çI\Ô\Ýÿ\0f\î›c\Ôgµt\ÐNi7\ri’ZZ@g½[\áAm\ä1€Ê‡|g\éŠuYÍ«\ÑÕŠ--ž¯W«\Õ§«\Õ\êõ\0z…\Ô4ûKôT»&U$€Ý¨ªñ\ÜP\rYó—Ú„6Z7Z®m4[¶_\Æó!6v\Ïn•§\Û>¯\Ä\×\Ú\åóÁ<ñ¡»h|®G`=6®­ö›e¥\ØÆ¼K¨i\ê[©I¡‘ñ\ÍÍ²‘\Û þú\â/\Æ\Ìö¥\ÇzkóˆR\ê=¹b\'~~\çý+m\ÉR8¥\Ç\ßc]Kµ\ËI\Ò÷Nf³”&Na^n™S¶\Ýj‹Ç–Zû\ëW2\ëWQ\\]xks#¬Àƒ\Ïô\ï\í^\ãû¸´d\éz~¯§jD“\Ûü­‘œw\éUK˜5˜º\ÄþfOJ\\_÷Í©i\ZMr¼1W\Äf99\ê=\è\Û\ÍV\Ö+0\á\ê²sJeŽ8%-p\Ü\íË°¨WQ8`T.<À\ãµD\àš\\±º14——£¹(\ç\"\ÚO-‰HgSœ¤Ñ¶\ÓÁkj\å.z0\éDÛ“,±|L\è¬\ç\É\È|\Ø\íš\É>\Õ\Ý\í½‰ž\ÊHl–ök˜C«ðs¸\"”\Ä\è—E\å`Cœ“\ØW[L\à=G€om¯š{^%ŠNhÁ\Ý%\Ûô\ëU»ý7Ož\Í\àe‚%U\å ©ú‰Ih¿£÷.;-\ße\ÜA¥\\p«p\Ä!!¸»¿„\Í\åÉ‡R\núª@Z\'ü»w?™¾$û³Y¾Ð´{uc\ä¾@H\èpk\í¸\Ï7H?¹l\æk§\Û.*\rk×˜\àTj\Ù\'¡#f\É3Z“^v\ÅD_ji\äIšñ\Ã\ê Ù¬†©ÚŠb²B@Z­$qÚ¢w8\ëT¢&\Í\Ùý\ê2Ù­b²\Õu@nµ±Uu\Ãg}ñX€\ä`£¹\ï@¾\0ÂŒP–\Åy\Ø\ã\éQši	³,I¯f´fÞ°MQ6lMjZµ\Íc4ñ­Meˆ­I¦¬øK\ÂP1€kW³¶‘yd‰{Š<Ä¤mŠ\ÐC†8\ÎÞµó*Mtzô&“D±,Z1,\'\Õ¨±\Ô`\Ï\Ã\ê,Tv”fœòœ¶T€:{×—\åòÖ‹,½‹‚\Çq­G¼–\ÑL=T\â¥Mp\Ç\'‡scq\Ær\"™\èlVÀc9\Ü\Õó‹\í‹ôÀ£\Ö4\éN<`‡¸aŠ*)­eóG\"0ö5¤Ö¶ò’^\Ù>\ÔÒ¬\ÙVÝ¡#¡SŠ¤\à&¤†eQÀ\"¥ðb“6›,_\Ø^Î¾\Ä\æ·Hõty\ã±]\ê”W¦+W·Ûµj-¶;uö meS¬/\íŒQqjœ˜[¨\"~ðø\ËÐ­{2aÁ\å=EKš\ß)]>†§†\â\ÖQÌŽø\ïR•W\ÙqKœ\é\Úq±e²^H\Ë\èûŠoi\Æú‚.m¢•}@Á¤\r\äõ\Íe\"¡†þµ¢\Ì\Çr]2\ãm\Æ\ZT\ä-Õ´Ÿ^¢˜\Åw¡^¨ð®\ãz85Ï¥µV\Ü\Ô&6R~µ¤s¦?©?gM¼\Ò#š$1òºúƒš_7/‡ŽP\n¥\Û\Þ_\ÛmÌ«ôcLm8«W· 4‚U\ÏF«YS-f^\Ñ=÷\r)\Ä¥W5\â\ÞA\áBYI\ßÚ®v\Ücn\çV¸#©Z8jú-\è\\\È#>Œ+ESŽ,ˆ\æ	¦\Ý\Æ2œ\àûQv\Z®»bøŽ\â@c¸®‘ŽŸp¿²–6Ï¡4ü;	Ë…\éV²‘ý\"ezÃ/b!n\íÄƒ¹\Z²iœ_¤\ß:§ðòô\å\àõ¥—œq&a8 œ\ã\Û5Ÿöy©\ß\\\"X[¼\×–Œ®ŽÇ›¦>¸­c‘œ\Ù<D‹„ú¥²Dž‹$²H—=(žUrº©Ö†\Ò~Ë®\Ìñ¦«©A¦M\ÖA)\ä}½¾\ã~\Ô\Ñ4{H—ÀµÖš\áÇ™\Ý\ã\åò\äŒ’3·N\ÞÕ²—\É\Ë,UÐ¢[‰„¶ò=»…¢lõ­cN•%I|R‡*\êy\\Qs\\iÀ¬w\Å\È*¨<¼\Ätm\ÇCP!‚X\ÉV÷I\ëøR\æ…ô¥C{.:¼\Ï^\Ï¹l\È\Ç\Ê\ÄôÙ«¤p\èo¦xWšŽ$‚Bak§\Ë#³~b¸ý\îœ\Ò[)øW M\Øÿ\0*I4w6s’\Å\í¹R\ZRQ’¸»>”\×x\×AÒ¬¾$Ü›¢N-\Ç1?ÀUˆxž=Rv¾xyQ¢1D‡¬C9Osš\æk·\Ð/,\è$N\åOð©¿­-\ïXò]¤#­µa<Rþ\Ñ\ÎnGÑºis\é6\Ï-\Ôp\Ë\á¨x\Ø\îckú:ŒB,~5ó¶Ÿ\Ä-§\\{—`Ž ‰A\Î\r\Z\ÜYt÷12r÷\ï\\¯$¢\êQ5Žh\Ö\Î\Í}Åšs¤\Ð-½Äªr€„Ù†:\Õ\"~,¾\ÑdŽ=?Å\È	h\å9½w¥¶\ÚÜ—6R\0Ü³¨\ÈR1‘@\ëq\Îú+\\\\´q\\F	V\Î\rr’¸¡Ï„•§°_^»\Ô\æº7ö,³Jù‘”`LPzµ\í\Ûh\Öz]\ák¨ $Â‰\ÕAýô®¨žyrcdóKÎ¯=„†\â\Ûvº¿LT(\Éþ\×\Ù\ÊÝ»:\'\Ù~µ¤pÁ»ž\î\Ê\ãý\æ0²Œ\Øú\æ•ý¤qT|U47Z›uµr‘\å²\Åj«^JŠ@VñO0<\Ý}jOØª\Ä\ÎÀH¾mûÖœ\ä–\ØÝ­z:÷ñ¶‘Ár$“|D\È\ß\î\êWv\È\Ü\ìhûA»MnW›2[\ÊI0†ý\Ù\éTqo~–Pˆ\Õ\Ö0B(;\ä\Ò¹»K·\Ë‹¶Ç¥G\Ô\å\Ó\Z”©n¸ŸL‡BmO\ÇAû\"\é\ÌOaZùûŽø†M[_}maT”•\åA¸@>½*[-U\"Ò£’\æ^iJóš¤]½\Û\\\\\ÞG¼Jp\Ä| ž”ñ\äs)\ÎR[\ê3\Þ\Ý\Ëw\Ê\ÈÅŸ‘p\áE\\\êŽð$¯Ik\Ì\Îzýök¥^j|Em¥\Æ\Ëþö\Å_\Ä\Ø\0XþB¬?h3e$<\' C,×¶\×\Ý_1ò\ï\Õ¸8ü«gÝ²U\Ñ+\é\Z=—\ÚqÆ·4\áŠ\ÚF º·l\ïù\ÔZ-\ÜM,&ò/\ÞG\ÝsŠ«X\è:‹\ÎmU\" \Èœ€\ÏZ{¿Ç˜-õ¨òc÷@÷Ò”\ã%¦\'\Ù\Üt¾4\Ð-ô«8\înE»€!\äÝ¹p0	ö§\Ú~³c{vö°JŠ9€\Ï\Ì=E|\ãg¥\ê“J\Í/D\'!\Í\î+¥ýŒÊ§U½Š[|\Êš9sò¯B´FQj®\Ù\Ñ’´™\Õk\Õ\êõQ\Òz½^¯P«\Õ\êR\Õtý8fò\î(N2\ÈúP&ë³ÿ\0H\æ]&\ÒÝ®–g\çv^¥\Ýq\Ëøo_5Î²?ˆg\'½vï¶ž*³\×là´·¶1\ÇŒ\Þ;\ã-¶01\ÐWH¥¬\ãÄ‰[˜m[BiDó³.S´gE\ÑÑ®’I\Ó\0Ÿ”v£/Ušý\ì_\Ín\ÛY¾\Ô\Þ\Ö\ÆIma$ Ü¨\é@iº´÷\Ö\ÂK¨	b6 oš\Âs•\\ŠT–ˆµ++G†Y¦0K{\n¬|K\Å\"›h\Ãs®j¸]i“]\Ú”²,€³*§ÿ\0Qj¦@ña‰mŽv³\Ç8\Î.\ØÔ¥\Û#¹@eŒ ³”=§\ï…´\ã…E\ÑÀ,OOqL8oGKW{­Qâ™Šó\ëB^i©wr¥\Û\' =g<‘zO£)\ßlUq—\Ã?…,²Þ¹\ÎrzPL±Y\Û5­Á˜\Ìûã˜)\î¥ð\Zxðm\àyKgqC\Øø~+\ÜHÅ¶Â†—\Õ{o¢9K\äyýU\í_Iµ¬‘™ŒŠ\Äz½}ƒ§ž~$\Ô_û©\Zþ•ó\'ôr‚kÏ´»{™0Rr£¸Ú¾”\Ðd\çÔµYøü¿Ý…ò…x«Nø¬\ãoÆ„žl·Z–ò\ìqZñÑµ\ì–fÞ£-P\Èùnµ©q\ëTs\Öp·\Å\Ì+c(\Æ§B$v½B\ÏQ¼„žµ¡ji\nÉ¹¾µ·6\Ô7>û\n\Ü=0²Pvô­\ZfV\äUfõ=…iÍ¿ZÁ•sÉOµ ³vrk\Õ;×²)\Ñ6l\Çz\Æø¨\Ëõ¬\08\Í:¹>õ‚\ÛÖŒÕ¡ji#\r\ëBÕ«5kš`~qC{y\Ô\é·g4T:\î­1t\Ï\ì\ê\rF!-g\áÇ¦+\Éj/\Ñ\ï¼(>\'\Ô(_ð\"Œ‹‹þ\Ú\Èÿ\0\ájK\à.kQ\0\Î\rO\Ò\Æýô‹4\\O¦8Ä«4gü¹¢£\Öô‰p\Ú/ù†*¥ð`\ïš\ÔÙŒ¥OÐƒ\ÄË¼W’œEsgB\"¼¸Y\äz\æ¹÷\Ã\à\íR(š \n;©öcGô\ë\Ó\Ç\"úð?Š0|£¯½lb*7Z£Ç¨j1%\Ô\Ãñ\Í»ªŒ)¸=E\Ó\Ë\ä\Í\Â_¨(\àÖ¬€‚d{\Ò(õ\Û\á‚\ÑDÿ\0†(\ÄlÀ,¶@ðšŸ¥4\'\Ö0\ÈK\ån\ÅN*(­ï­”²Ü“Œœ\ÅmXcm2g®Ù©N§¥\Êp·%!–©}E\Ú!À\Ò+M7\ìH543\êH¤´q0>†¦‚{@‘]Å·Lš*(D±’ŽŒu \â¥\Ï\åu>Q\ËuG\èq‘E%Å»ù„¨A÷¡¨À\æL~T;\Ø[¹\Þ<döÚ§\ìa±™h™r¬½{\ZÀ@\Ô\"iP¬BÊ‡9c\ÓÚ·‚\Âø\0l\å2•8(\Þý)ÒºL\å®–ò\0\Ã\å\nY`;g½W8.¡˜Ce\â–ÀÀ\Æ\äŸA]\"\ËG¾¼Ck±FXffýœ¶w=q\Û†i…§\rð\ìZ]\Å\åâ¤²x*D±¹ý‰\Î\0\ÇrO~\Ùõ®¬8\å\È\ÎmQC\áž\ây\çH‹\Ë\ã%Ô©\ßþ¶®›e§&ƒlE\ÄójW‡†òÇ¹À\Î	\Üúõªj:DsAo¥^$Š	3\åÀ,£\Ó\Óž•›Ï€º3F÷S\Ãp\à“Ï‘ý\ÒMñ]‘Ç³’–‹¨¶³†\ÍJ\à\\\Ý<l«o‘\á†œœž3BqW‹kI¢”\ÅjR\à\"!\n¼£u8ùˆ$\Z\å\\Irm\îä±Žô\Ç\Î\Û9¹\\ö?ZSªñ/\ÅÚ½Œ·?\'‘¾nF\È¹ô\Ø~f¶¤c\Éû-pqŒ‚\à\Ï;]ñ\Ë))\ÆO›\âm½%\×/ƒ[\É}§e%„FO)S\Ý\ËPn¸‚\æhD\n_)9\Î\ÞÆ…¶\Ôe[f„\Ê\æ2wS\ëN‚\Ùn³\â‚Iø\Û3†;¸’\rX¸~ò\é\ÃAz-\Óv9\Øõ®d\×3Ë‚ªŽO\Ì\ëù\Ô\ÖwOl\Ã\Ä\×+¶\n‡hµ#\èM\Êi˜Æº¼\È	*²’;v\Æ\ßZ[\Åz.µh¢ö+C{wÃ›Z\æv|W{lˆ#¼\å\'`G\î8ÿ\0¯j°\è¿h\ÑL©vP\0q\â\Ã\×Ó§úTTŠ|^™¥Î¥\É$±\ÍoqªH*ñŸZˆ\Í€\ì\Ê{š¾izö‹®Û›}J\ã™óˆ\å†Sü©g\Zð•šY<ö\ÅÊ„ù\áMó\îK\ÉO£)â¥ ‡±þ­±\Ä24¢\"dõ\'µ\r¡%Õ§„Œ6\\\ÔRJù\ì\Ì)ÄŽ©°\Æþ”]µõ´úzøC$’6Þ¸[Ÿ;}3%û¶Z4^\ç\â²È±¹\'jk¬jos\ã–Eó\Ñvª“s\Z–IÁ8Á¦_v\é lx*7úV9\ÈZ\r:›\ËrX/)0\ÊZG\Ä¯$¨\Óc\ÄQ\Ê3\Ü\Ôwwöºk¥\È±\Éóœ\ç5Zž\ê}Ed’)O†e$)\ê˜\é[bƒ\åk¢dþC\ì\ã\Õb¹€r´‘·\ÊsÒŸ\êmob \Ç\Í !ò´—G¾x¡‡\Ç\04.J¶~lÔš\íððy\Ç2;Ÿ—c5«û¥ü\Z,ñ_^¥Œ7\æl4lwÇ­XøV-[† Ý¤ò\Ç8\Û\rž†¹\å½Ü‘<Róó[\É\ëý\ÓV=6Rö«\nYq\Í Þ¹¤\Ô%¢UÝ’q}´:%\ßÀ\Â9˜?2œ\ä0ªü_M},(\î\"\Ç;¨8{U¶þ\ßF{˜\î¥\Ë2 ºšW©)ðŒ±†N]\É{Ú”3«\ÑN>\Ç|\r|š\Ü\\\Í¸\Ô13`ÀÞ«\ïR¶©>;˜<Y‹óJz’Ç½U\ÍÄ·Ae…Yºg®h[ómªMozX	p\íZ9}E\Æú3Õ–ûMUþ2Hœ\æ^p\Ät\Çj\n\Òü\Þ^\Îc˜¯‡\ÔUa¨\Þ\Ü\Ít¢NUf)î½«M69m\îZB\à|À\ïWp[4:7k“\Ãt­¿3deûŠúƒ\ì-lôx$‚%Y\'A$­Ü’3\\\ì\å[æ¹ž\Ån-ò#&O\î÷\Åv­\'Š4›K3\Ò\Ç\0‰|Š[r¢¯4­¯c\Ç%l¶“\æ¯\næšŸÚ•«\Âñ\é¶\Í\ãäª³ü¿Z¬[ñ\ßC(’}EdUnn^Qƒ\í[\Æ½š?!\'¥gs¯W3ÿ\0µ(\ãxK™S<\Ü\Ý\rkwö›\á\çÃ¶ñ1úÿ\0*I•ýDK¿k¶:œ\×WS(9\åEr\Õ\Ãõ\Þ Sº•–i¤S¿4‡$Ÿ\å@\ëº\åÖ·ª\ÉqxÀ‚	U\ÆËšk9\á;~X\à¶i5Ni&s\ÐûS’‚‹\ì\Ç$\ïl£k3M\n\ÆP²s\r-kMA-ùQ?f}Nô\ÚÔ¤©\â]dyGJ[\Æi¤X¦UPz\Z\Â3­Eþ\à+{y\à‰\â˜½Aj+gþ®—\\!E#ó¬\ß\ê72 TF\Û:j\î\âò\êtH¡,\à\0yº}k,ŠS{öW\ZI\Z\ëQmm\îZ%,þÞ•?\r\ÃwkaqÈ¾\"‘…w\ß&¥‰l´\Ë_ü¡šCò¦\à\ni{¨Z[\é>%µ\ÄK\ZDXgnaX¹/Ø–~’Ke*\ê[Û«\å‰£ð\Ç+ž\Ä\Ó\è|[tŽGó0\É`w²\ÓQ·™€”bI¶ø\Ò-Z\ê\á\î¾.hÊŒž\Õ2‹rÖ‘\Ç8;\×\î¡ñ¥H.ZV\æÁô¥»_Mðù[\0•É¡Gž{±\Ê\ëœd\ïÖ™\è\íðx3¦%rz\ZÕ¥\Òì–’TŽ\Íý\ã	\Å\èÜŽm¤-ý\âk¼p\Ì\Ã\á¯f\'ûK‡?­p_è¹¨\ÍsVv\n>\Zß—#\ë]oF\Öm!\Ó#:ø²J\Þ^ýk»Ç„–?¸\é\Ä\é\ÅpX\Z(:c}j¨\Ùqj\Ía˜¸8,WV?c\ßkgXÈ‘\ß-X.qPx›\Ö›Ó °€\Õ\æ\åù»\ÔJó¸;E’fµf¨‹\â£g$\ÓHD\ê\Ù=kpÀw¡‘mŸSN€Ÿš½„U$\0­DlŠ\Ôa2y‰\'Ö•›ó×‹T<\Û\Öšª(m\ë\\€s\ë@\Ä•‚M\å«\Õ8¬gÞY¹z×˜Ö¥…`µ0³\à8\à\ëœ{\ÖZ,œ`Q±BÜµ±·ów¯Ï­\â\0 µj\Ö\Ë\Í\Ó\Å\íÊ¶Ù¬<,Ú‹ˆpùH\ëY6\ç¨\Í\ÈWlVÜ¬q‘Š|ƒ€­¡psÖ²#ln3L\Þ-\ÆÕ¨‡¥U‹€´D	ù?\Z\Ýa\0ü´\Ñmö¯4*»œ\Ó\äG\0Æ±\á\Ó\Z·OÊ½\àŒô§\È8\ÌC§‚¾´É¡\è+TzQ\ÈN	mÑ‡oÊ½\n›yÁÌ…À\åHú\Z9mÀ=+>O7\"·³\r‰x‘\ä–RU\äžfŒœ	b\ï\ìÃ±ÿ\0­è»›> ¶10R\Å \æŠU„²\È=\ïs[\èV\ßL\éb¯ü»¯\Í/¡\î¾õ\×>Ï¸bkvkMQa¿y¹Lv™\á\îÌ®p0õ\Û5p‚“\è\ç\ËÁ¾\Ïøz\ïQF:\Í\Ìv\È\É\Èa,\èF\Ä7aœt\ë\íµ=K-\ÏY’\Ò\Æ\æ(\Ø$“#2H\çpÜ9F\Ø¦<Ceªiš¼O¶Žž‹eF=ú’q¸>¦«¼[\Ä0YOo\r¸ºYùžUR®[§¸8#ñ­\ãŠ?òj7Z]­Ý¬7\à«y0«•S\Ø¿\îª\í\ß\é÷°K{o0\r	%º`m¹;š¯q)½··šx\íþ!\\óÈ‹\nW|¸#©\î»œ\ã\\\Ðõ‰\íd/ª-\Ìf?\Ûó\\c?um·e\Ö\Ú-\Zb\Õ\Ú)\å–<«£c\ÄuõÏµ6‚\Ú\ÛIue˜\\nþG~nb	8\\\ìz`ƒ\êjˆuh\Ò\è7o€\Æ	”•oR„\î>”\â\Ñ\ío•¥º2X¿\æ\È\ë\ïÞ¬wk\×[À«\\¨\åS\Ì1Œo\ÜŽ½\ÅU¦¹˜\ÎZ\â(\ß|\î\ê¤\ÔÕ¯ˆ4\Ë+k¸$¸M­\Ïö ž£9V\Þ½\Çj\n÷As˜3œ$ñ\ã\0öV=Túgo¥*¬šiŒvœ6%M\ëd\Ò\ìo=\ë;û\0@ú\ï^ŸE¾·r	ž7É¿SùW­P,€Ý«+–e\ê_\â)¯\È›yt\éq,‘0\ï\ä ®)¤2[\Þ\Æ\"‚“Ð†\ÉŸî¢®m\Z\î\Ì\Ä\î\'\0e\ïl÷Q–\ê\â\Êí‘­\âò¹\Ð\î(z\Ç7\Ö/‹è‰€œ-\Äc™O\Ôu\Å\åý»¤°4WV\Íò>y€ö\ÏP~µ5ž¹kqjmµdXÛ¸<\Ê?¸ö5¥\î‘5ø\í­Ý£ÿ\0iï·®;\ÝC¦ðÿ\0@nS\â\âž\Ñö*~žõ\Ô8{^.‚\æ\Îùn\â\Ç,±\Ô{\ã§\×\Ä,\îGˆ$¶^M·V\ê§Ð\â7«^¨S<FH\îŽh\Æ0ô¿\áù\ÖsŠf‘‘\Ò/¸wH\â7¸¸²wŽñ@/m4»\'\é‘ùW8\Ôô©´=`AwrŠ[.1\í\ëWZŠ\ãÁ“\Äø{¡„Yˆè­Ÿº}?uÅ˜%¤»\Ó\Ö\â\Ã?\Ú.\\¦zGL{~8®w\ì\'Žö-\Z\Î4ŽcnY›þ!;»UŸMŽ\Þ\ãN–\Ø`I \Û#µW¯x;Tkh5W·Ô´\ÒF\È\ß(ô9\ï\ìph{\ë\Ë^K	\ÚDHTy}ó\\Y|y]™Uv+\â\ëK¸%h!†IRÜ“ \îú\ÕZ\ÉoÊ™m™°#¨\íš\è:Æ©s=\Í\ÄP\0²Ìœ™†¥\ÚÌ¶š|ú}Å¢Fy¹¾ |\Êj\ßT \Ó\í¶ª\ÖŽX\íohß¯3.\Õ-­ýô\ë@§ß¾=(ùõ\ËxI)\È•v\Í4*#\â#ugo)\Øm¾Õ‹\Î\×H\ÍI³K[\ÞkY\æUl~\Ë4Ã… ¹ˆÎž+<n¼\Ì@ô\íU¸n\Z\ãS¶KJò˜\ÇZµE5\Å\Â\Ãhe\ÔFOF\"¹òF]¢Ò­‚\ê\ÓIq\Â²ùÀ¢\îõk˜\Ò\Ú\ÚBØŒ\Î\Û\Ò\Í3P¸½\Õ/‘\ÄfŒ0u#m¶È õMF\Î\Þ\æ)\ÝDSú™÷­cV†­Ù½\æ¯y§jj©Ìœ››\Ò»{­H\Éu+DKóR\\jm\"G\'<r>QBO=ð¸R|%#p+£R\Ý\n1\ÙjÔ§‚\Þù#3©\æ w\Å£\Ü|Šmù\ä™÷$ô¨\Ü(\ÚVñ<G\Û\ÔS\Ý\'¾\Ô<8\àñ#Luµ„¥ÁS\î‹G]\Ý\ßi\Â\ÒÈ´rƒ‰\Ü\Ñ3\Ú\êlù\ÔREPÜ¬1¾\Õtû7\á\Ó\Þ_\Ù\Û\Å\ãG‘c°8¬|¼&ˆ–\ÜsÉžf\Æõ\Ó\ã`œ¢\Ûÿ\0ðÖ’_q_Ôµ\Ï	ƒN\äH€½9½iMý\ÔZ„\îl­¼8“\åQÚ­Ú—\Ü\Ê\Ó\ÝK¨Ú·9\ÈUb¡Ñ´F\Òu\î.\Äens\"\Ì\Õ\Ñ\Æk\Ñ¦õ\èN-\Ô[Z¼ d`Vñ¤rK\'‘‚Á`:\Ñ\\Es\rý\ÜSX[m„‡	ŽÔ®+‹Ë¨\Þ\Ö\ÊWPX\ìFiI6\í\n+{Zi0\ê1Nb|\Ï(8\ëU»\Ø\ÖGµ™˜°\Ýi\ç^\ÜY\Èö—±y˜·ð£µ!¯µºñ\0\æyqU“\nq5PS\ì\çZ\æ£-´Á0u\ãi‘¢rs¿z\èügÁ’¼°¥¨V ‘\Ü\ÒmOƒÿ\0ª\ì­\ä†7k‡—=g|cTb“‹¢­r/.\'OA8\æŒQº|²\Ú\ÜbX‰3\Ì\à|Â¬\Úsh\ÒA{K¢\Û==*´÷cÄ–+‚c\n˜P§·½a“Z:\Z\Ð±eq¬L\"°ŠFŒ±Á\å\ÎhI\ì\ÏNas\Í,±œÚ¬6·Ri\Ð[Y\Í\à´M\Ì\ØØ‘Hu»w–\åqrQœ\Î\Ç=k%5)q~ˆ|WLO\â\Ã\Ô7°‹ r\0v\Åos·FD^aËþ*\Çð\ã,Q|ÿ\0U|ûô÷¥QJ\"°Œ+\"’¥‰\éV¸µh™;c41\Ï%\Ãr\ÌO,b—_\Êg» t¡©Yf1*\å”¼½M([Y¡ŒW\Ä“MG|™/¶\Î\ÉýH,ø’\ì¡A\Èg\é]‡þGˆ³¯ˆ¤;š¦}‚kW,9ZF\Æ\Ýö«wi·‚þ9°Xùr®Mz8\ßÚ¬\"´=³Šþ}V„\åŠ$20\Ü\ïÖ®^!\åÁz\ÕoDµÔ»\ÞÁl®=)\ß3ŸLVše%D\á«þõ\'©&‹@zÁ*§m‰\ëP†9\ØÖ¬K6yº{\Ñ`\Í\ïZsf¢Üš\ÙUE?•2@k%ý\ë9?¸\Çð¯x3‘?þšV`¿^R	÷­÷\ÈÏ·j\ËÁr~côC[Eaz\ç›\áeU\ÅS0$\âþ\Õ8\Ó/»[·\ã[U_ø8üE.k\ä8°S/j\Ô\ÈMýOz\á¨ÿ\0\Ä+#E¼?ò\Çþ*9\Ç\ä|À¼¹­‡Öš\n\ìõh‡\ãY?pz\Íü\èú‘ù\àN\\úš\×>¦ž½r£ÿ\0\rd\è1\í/\0ü\0þ4¾¤~C\é³\àt\\*\"!“\Óz\ØF¡³\ËS\Û\Ç\æ\Î+\Å>Æˆ™)$t¬ˆ\Ã(87¢¥U9òž•¬```L\\Aü$QY–\ß\0Z5P\Õ+E„\0\ïE‰\ÄT±\ç\î\ÖZc<»Ù¦\æ\"·ðp1N\Ä\ã\è¬\Öcn\\B@\îTÔ‹ýl\Ç(ð4ð£N	\Æký\ë¥A4xóòg5ð\"Æ ¹\Ì1g\Û4»S\Ö&°\åñ-\Ã¶\ÍVkø$–\ç\ëUN2±’\æ\ÊÝ¡9;šM.\Ãú¼’\Ò\Ñ5\Õ\ÞH\Ò#A““L\Äm	\Þ>l{\Õ{€\á–\ßS’Ýœ¡•\\\î-\äE\æ;ú\Ô\Ë\Z½.Q_rK­ZÁu\à\Í©øUª\ËC¸¾·K‹epŽ9•\Ýy1õ\Î\Ä{ƒøU_ZŽ\Ño£1,¶\Ì\ë’\Â5‘³\í“ü«­pm„YÁ,v\Ò\ÝK\È\0’\çtŒûŒù|Ö“‚7†Y´\Û7\à~\Ö\\=\í\ä–vö\Ç\0³y÷Ø©Ps¿o\Ý]F\Ú;~\Ò\ã0\ÝM3\à`\È|\Í\êrw\Í+IfŒˆ.§\ä¶Eþ\É\äo¹ô\ÛqøUO‹õù’\âX¦VI0¾\Z•þ\Í1€=kªIhós\å”Û²/\ãaqu¨\Âü‘\ÜH‹³\Èr¯ \æ+\ØnA>¸ªö•­Åªµ13!ðyf²™¹¹e\n\Ê\ã~™\Ø~=©f®¶úŠ_5\Ô\nn\0[•>QÍŸ6;0\Í(±±&^-DJ\í!Y\Ñ<¬¯\Ð\äzc=ñZ«9›C=j\é\"•`ŠGøyUT+d4y®:g®*­§[B.™\ï\Z9eˆFaƒ““‘·\ëFKpóYD®¼\ÏW-\ÜƒøPWfGnmå‰yO@F\Ø\"†%ð=Š\â\É\ãXv	”¿:\ì	#ò\Å.\Ò\É\Zk6t\0ù£ovSû\Å\"(¦a\"°óxk¸=öô­\Ö\î;œ\Å\Î	9Á\Æ\äoZ|¬N!ðÞ­þ‡w§\Ü*É$Œ1\Î\nô#ð\Èüh-ú\âÍŒ°ñ($l|Eu\èAýþ´5 øyO\ìÛ›É·Q\íü¨«kx¢\Ô\Ú/6I(\Û ÷¿J\nI©\Ç#$x¸ò”cÍ…\ê¾7\Ç|cÒ¶F <h ½ Ç‡8ü{ýiu\Ì0:|D$•Œò³§U9\î=(‹ñca‡œ©bõ§{{ \âK·XCX\Ü#y “x\Ü\ãq\ííŠ“T²\Z«I\n*\\\'X\åü=Áõ¯^Žoa\Ë?/*±\ï\ìOî¨¬\'š)„7ƒ\Ç\åG\èi©ˆ–\×J[µ‘\ìÿ\0e2yd·c\Ðÿ\0×®j-:\â{Â¶¥’Qó\ÛHq\Íþ_ju­\Ã47i¨\Ù\å$;6:7±÷¡õXõ‹5¹|;´^\Ùö?Àö£ðwrAp¢ö\ØøÑƒŽ\äzGi²#¯Ã—Ç‰ƒÁ\î¥(\Ò\î\Ë\É\ÊùK•<®Å±\ë\ïR]n\ê\èO‚[›o»\ê?q÷¤ö4[ô¾yc–+öÛ˜ªHv=U½Ò¢[\Ýw†îŠ\Í&›v?g0BÞ¬\ÊÝ­ovó@²¨<k‡\Ù\Ð÷>\Þÿ\0OJs¥\êr½½Í¥\ä)5”‡\Å\ÕqÙ€\ìq¨£D\ìuÁZ\éy\Ýô\Ö³Žk«%\Æ~1\Ðõ\Ý{ö«\îƒ&£fÚ¶˜`»y,\Ö,	û\é\ÆQ±®Es(,\á\Ó5hd·•\Öü\È\è\ß\'\ÐúzƒÓ­tý5\æ\Ôlù\Úr²FCJ#8%z	WÑ‡|uÞ¦H¾\Îu¬Z\ê\ÈòÚ³G\"UB<\Ë\ì\Ë\Ø\Ô3yx÷Ó‹˜„²<\\ª’ë©¿Xk7r\ß\Ëv\é\n³…~E˜\ã\ìr7ò7¡¯_…´\Ûÿ\0PŒ<ŒñF9±þ,z~u\Ïô¤\ïFR\Çvs\Î)‚\Ö\Ù`IJ™d\Þ^€æ¢¿\Õob–\Ý-Qc@¸nqÖ­WZw\ê\Ò\Ëo \Ù%G\æOÖ”kšL¶3\Ç%Ü©qj±\ãÕ–L2†\Ì%‰\Ãkb;#\Z^­µº2\Ç&\ä}\ìõ£µ^/™fai‹lþ\È\È<\ÈÇ¸ª\Ôò||©3Yøq¨#\Ë\ßÞ ¸C\É\"9<…†3\×4*ö‹Ciõ›Ÿ†\äJNÄ‰$|R¥i§›,\î\ì\ÝrsŠ\Ð\Å2¨-!`¤Žô\ÇA0Že<ù$Š\Ñ\ÔV‡³k¸¶š.X€üÁHI¢Vü\Ãm#˜‰“.yk]`sj©eC€1b~SSü%\ä°4q&6QYòm!6\ÏXxz	„k\rzœ\×Xû8’;i–\àBL²¿\'›Ò¹\ï	\ÛS·’kR\\\0\n‘€j\ï­,¶\Î$±f@±–R>é¤¢\ç4Ÿ¢ñ­\Û;\Ï\Ù\ë;M4B4ŠsJ¸ªE7%Ÿ71rv®#¢ñ·\è·\ÖVÚ‡\Å\åA\"ô\É\ÇZê–«ÅÊ¬ml\\?Šv+\Ð\ÃpNÙ¦y)»ŠÐ¾\î\ãŠc\Ó\Ú\æKFkuùŸ°¨®/\ï\Ö\Ò9.\á–81]^õ=V\ëT\Ñ%\Ónl\"ŽYWb”b•ñ~“}\Ä</k¥[F\Öò[\ÅÕ†IRNKnŒ\â\ÔzBm?S\Ò\àµv(Àùy–ŽƒR\Òö‰\"\íÔ@75½¢Gx\ì]\'¹õ¥¢Ê¥\ÒÓ”f mI\ãœU\Ù6¹RE”M¡\ØMñP¡\Ç9lgjÅ¯p\ä\ÎVõf-•ªµÞ•#\Û,Ÿ\å‚\át\Í\Ü\"ö–\Ðj#žW\äNõò¦\éšOH«\â\Æ\\Q¬\ËaªD‘\ÇÎ¯ŽRJU­ñ%\Ð\Õ-#‘a`›aN\ïµÞ¬:„\Ð\ÄU\0»\íUON\Ñ.x€´Z´q¤p\å7\ÌMw<Q\â¸\É_ÁÆ²\ÉI©E\×\É\Ï5Û•:‹\ßY\ÊY7L\Ð\í<\ét\Þ4™8cV-[‡\ã¶<w\Ë§ ±ª†©¤\Ç\"Hñ³,yÀ\å\ìk\çóBj_s ¶ö‡¶šŒqÁ\â<a¥m†\Ê*³ªX»\ê\r+Ý¶Ê§aBAw,j‘7<ƒ\Ä\å8\íE\ê\×B\Ò6™Ø—$\0§°¬”9iö5qtK©½å¾˜\Æ\ÖAûPnV#†a²–\Î@\È\Í¨\ë\Âxp6\Ø#­X8vK«‹\ã[b #\Ì\ÅzšèŒ¥Ž:4ƒil¯=Ì†\Ò‘‘d\æ%«\Ëj/#H\á&SŒŽõcÔ¾\\+Y\ÚlÁ†ÔŠ\Æ\éR¸‘\Ð •±Ú”2}N\ã÷h\îcV‘YýŸ¼W—a’\çH©œ\ïµvk98^(P$·’…\Ão\å\\Óƒ^\ê\ßC\Ðll¬\Ò\ì³ðvs\êk®\Çq¯†t;58\è¥z=E#H*:Ž€ƒkk\æþ‘­?®t%ù4\Û\çÿ\0\Ëÿ\0Z-\ïu\Õ:\r±ÿ\0\Åþ•	\Õ5‘Ó‡\"ÿ\0\Ôúi\Þ\Ëÿ\0½K.‡x\ßUQÿ\0ûV§ˆ¬€òð\íÁú”Æ¤mkV_›‡ ÿ\0\Öúj&\âõù¸vÿ\0«ÿ\0üÓ¯\ÇùþÁö™\ä\á™?J\Ôñ]À\Â\á>³¨þ\ã\Å+óð\ä_ÿ\0XôÖŸ\íd\ä÷eþzÿ\0ô\Ñ\ÇñþBÿ\0?\à\É\â½W³\á\Ûqõ¹ý5\â¾!ûšŠýnò­¿\Ú\É^\Ï\ÒdþUƒ\Å\Äu\á9?	ùQ_\í$m\Å\\U÷t4}ecQž)\ãùl4¥ú³Ÿ\ãS0ˆn\Ü\'qø2\Z\Ôñ¥¢õ\áK\ÏÀ!¢—úB\ßú›‰¸Ì\ÓHÿ\0:‰µ\î9–}-´ÿ\0\Z3ýµ\ÓO™¸Vø‘ÿ\0\ÃCük?\íÖ”£ÿ\0»:€ÿ\0\ÉO\çE/ô…¿õ›U\ã\Æÿ\0ø¥’–\ØTmy\Ço\×_…?\Ën´\Ìñ\îŽ>n\ÔGþBÿ\0:\Ôý \è#\æ\áýDò\ëü\é\ëý\"ÿ\0Ø¥ÛÛ¯¸ÿ\0,J?…B\Öü`ÿ\07Ýò€)\ÙûC\á±óhZÿ\0³\çXÿ\0´^t}@ò£ù\Ñk\à+ò m3‰¤þÓ‹µôsQ>¬¿öœSª7þiþucÿ\0´~\ï¥_þT:÷ý¤po}:÷ÿ\0\ÙÖŸ/À¸þJ³p­\Óüúþ¦\ßù§ù\ÔMÁh\ß\Újw\ÏõÕ»þÒ¸,u±»ü þuûM\à¡ÿ\0\à®ÿ\0ý”:9þ\äù \r€Jš\Ãœ\æµ#\ÍDD ¯¡¯fÑ—ˆc}ª4‰AùºQ|„¨­y@|b¨FcnÕ³G’yCŽÕ¸\' \Ò‡”\ç5 L\í\í[7jPƒ·j`\á\0\ã QI=…l\É\æTñ¯Ò»q\î(ù\ß%q\Í${n¦\ØtªÎ·û=\"6\å#j\é<\\\Ñª©­\Û3i7‹“z\'Ð°þôV¸VB\ÜMƒ±_Òº,¶\ÅÐª¯1®w¢Û‹}CL¹@yFrk«5¯‹Ëª¨\êMN6¤k\å\ãx\åL¥qŽŸ,q\ÙÊ¯/¸Ý²!š\é\\>O\nð¤WºˆI¯9‡6O3t~¤\Ò[ý*9\ìm„¤Ò‰™\Û\n¾¤\çBñ5\ç\Å]\ÙZB°IG”s©lc$wÀj\Ò1Ø§•¬i/eª~\'t1OxKLò(Âœ«€\Ã8\Éö®{\Æ\\G{¨\êS\Î\åVr¨\Ãp¹¶\Íu{ñ2´qx‚ò«‡\ÛÛ§J¬q%¼\Ó\ér\Þ\ÃÈŽd\È@s\å\Î?­\ëG{	þ¸–\åÂ…ðe³)\Ý\0Á\rþ%l\äzÐ³\Ý\rUœ’ñ\\\'‡*©\Æ3÷¨¨¬\Ñ~$Že¢û\ã“P\êDx0\Î\Ã*A\ßoCü\é±j7\r/€c%Tö\ëK“PX¦eÜ¡93[üLOf»†/(-¾ÞŸQùPfð\ÜÈ <0W\ÜúRliKMB6nNu(\àqD´Q\É)ñaU\rò•Ç”öÞ“\Çj&n ò²ùYO\Ýn¿‘§ztž:òL0H\ÆAªYhŠ[c\á³I\æ‡8<\Ý3\Û\éõ­¼VÐ·!f\È;õüýi…£¤’)bs\Û\×¡b\ÚÝµ”\Øøv\0\Æÿ\0\Ý\É\Ø}7§zdµ\í\nÙ¤³\Ô9\âÁ\æ\0O–OU>þõ#\Ã*\ËÕ‘+›±\èP\çu\"‰\Ô\íÔ¬¨\ë.?\"ugG‘dòòI/³õ\æöÈ§ø\å\ÎR\â$’\"¡\Ëò\ÈÀ\íõ¨\Ò\ìga.9sý‰¢#Af\ï’d–é¥\'½i\í5?\r#\Ê1\êOQCu±¥z\Z\ÚI+9´•r\ê7S÷‡·ð¡eŠk)¹\â\ËG\Ó¼\rH’›¤Ya¸Œ€~a\Å\'ƒsn3•,\Ça÷[¸¦ö„–\ÄZÝ²OÉ¨Ú’²\íÏžþ‡ø\Z’Ù…\æ˜9”,Šw\Ôtÿ\0¯zayo\à\ÄT‚g™}v\Ü×¥(·f‚wS¸oúýhRµcq§Av²œF„\ÈZ3Ê‘ºþ\ÛOŸ’%¹O1ŒòKž…O­$·T8ð[Äˆÿ\0t\Èü\èƒt\Ö\×\Ë$c1Î»®v\æ\î?Z¦J\\5º°‰òOª“¸aü©\×\r\ß\ÝZ©p²Eó&p$C\é\èj¦®¯µiR3‘Œû{v©t\Ûù~)\"$£\ÆpO\Ãóýõ³¤\ÝÝ‰\âæ´¹h\äxùÁÇ•\×l7\Ôt?¯JO\Ä\Ð\Éw¤ó\\¼Þ‡!¥F\0>\0ùÁ\è:o\ØûPš>¦\ÒJl˜,>+f9þ½ù[¡\çñ{p\\\Èö:¤E¡¹… h\È\È\Ü‰\î¥jnŠj\ÎJ÷ó\ÚÝ¼/=\Ü2†\åtqœ\ë½\\¸VMbÁ´K‹”bWö\ê|­I¸\ëH‹Oe†p¡•¹m\îò@–>\Ë 9!‡O¡qÒ»k4¶wËžh\äGÁ\å÷\n«DÚ¼\×m=¤\á\0V\åR›`æ¢µ\Ì÷‘%ÄŽ\Ñ\Ä9ØùU£Šn4\Ûù\ãY\íP	#W\ç6*k\r2ßš\î\àbLr”\Û\Ü\Ö\Æ\×\í0”Z\èá­Œ\ÇÃ‰£‘3‡\èE…‘|X’y\ÆZ>œ¿J\'úº\Ú\ì\Ëð—‹ròa¹X\à\ãÒƒµVK3\Çn+U\Æø¨qq\Ð=h64ð\ÒúdŽJrúUß‡xz+4¶\æg{˜ù•OE\éHôU[«xyùI\'d=ªÛª†‹]\Ñ,‘ð«l®pv\ëÒ£\Z¾Ë„Pf›ek\r\Ä\ã‘KsrºP\Ú\ìmˆ6\äðÈ©n\çkI.G\Î\Í/—Ú–\ß^Kq$‚DÀhŽÃ ­\ãVi%Hš-G\ã]\í\í$6±\Ãˆ\àl\ï]GG›S‘ï¡»Œ‘r\ï\ËÚª\Ú\'\Ø\é–-\å¯3ˆ\Æ\ã¾)½¯\Ú>”²l¶H®…*f2V’\Åg*\\G!‘˜¡9\È\ëL®®¹-\'iG„\ê§\Ëö‡¡ªó5³¯¸\ß\ç\è·vR‚\Ï\æB\"«öB…t\r¬q\Í\î…c-¥\Ìh\îÐˆæ“ªý=i\ëzŒ«%¬WEZ\áyP¹\Úüöò\èz|¹a¸>\Û\ÕSƒµ9\ÛU‰£Ln=*²5\r \Ç\'iCO\áŽ!“ÄŠ+¹;\ãj\â\Ç_±&\æ\î\í¦Š\rÊ‘FŽ\"½x\âh•a‘H\àš‹_\×n.4ùbŽ\Ï Œ3ƒ±4òd\ÃOJÍ±}NQnzµ\Öty%žö\ãI†\îP˜U”\íŸjZš–¨nšñøBø`À„2yù~˜\ëUùH´L^+Æ²Fq\Ô\ÒMBe\×ì®…\Ã,074£˜\ïSq¶i\äGePe£‹n[TR,tÏƒŸ ¼»RE\Ó\ï¬lI\Ô2¥ŠŽô\âmb\Â8\ä¸\Ó\â{†\å\ÈnÙ®¨ñ.¡+]|Y\08 !\í^t®Rit›\åT`¸ŒH\ÊˆþJQ¯ó|Q¬d\î\0\ëŠ3Ax\×B‚\ê\é\ä­\å©5Uº¹ŽW¸/\ÌsŒmŠ\æMFn\Í1\Óm1}•ª^:<’«[FAðÿ\0=\ÔxŠ(\"x`3ý˜(;ø\í¬m¦Ž8\Û-÷€\éU\ZY$eŽNri¬qò6úEñ±í–»#\É+J¡Ù†ù¥¼\×7$óöü\è42[³J\Ïs\ØQº3­Æ©k6KH¤þu\Õ1ƒÐ”iŸNp\äp™ôK[H\éèƒâŒƒÓ¦\Õ\Õ-­Ñ|7;ÿ\0š`y®i\Ã\'—‰-\0ÑŽ¨#·Œ}\ßz\èFóDe\Å\ï][z\â<\ãò®¦hÀ\Øk¤f×ˆ–OLòœþ•\ão\Å\è6¿þ±¯úRŸƒ¦o\Ù\Ý\Ífÿ\0\â¸ý(¨t{yl8™³Û–\àþ\ì\Òÿ\0½ÿ\0{y¸\Ê?»m&?ø_\È\Ô¬q\\[I¦Ú¿þ[\ãR6“\Ä\Ñ\ÛkRJ=\Ø\Þ*\'—m†\î“xþ\ê)~’\'\â]i?¶Ð­_\è\ì?x­Ú»€?k\Ã1òÎ¿\Åk\ÏÄœKoµÎ™k ÷W\\þú\Çû[7K®ýy%\ÄS\ãøÿ\0\"¿\É\ïöª\Óþ7L=Ô£W¿Ú\0\í/ß§\Òq­\Ú}\r¿\ï\\=w\îQ€üxk¼/ö‹ul\ÅŒ~ú)|0¿\Ê2\ÜMÁ\çûK;è¾¶\íü+Ë¯ð#\ì\×rD\Å\á[	¸&\çhõ¸ž\Îøý\â¶= \Ýkmf\ÖBzd?Æ‹_,)ü#AyÀ\Ó0e\×c_c!QúŠ&1\Â2ÿ\0g®ÚŸüõ¨‚|²ZHŸä¡§\àa“khÿ\0M©\ßû‚¿\Ú6\Znƒ/öZÅ»}%Cükq\Ã\Ö2g¨F\ßL\ãU‰þÏ£\ß\ZbŸòµ7¬{‹¤ÿ\0+\áO~¤\'_Ñ¸Q[å¹Œÿ\0à¨›„¤Ç–XO\ÕMQ¤\á9\">[F¤Œ+O\ê]F/\ìµýN?ü\æ§Sù\Çà»¿	\\v6\çþ¾•ð\ßh­\ÛñOø~\'‹û*\ÔùŸ5°¹\ãˆ\Ç\ìøšFÿ\0:ü)ÿ\0\ä\ØZd\á;\Ïÿ\0+üE\r/Þ‘ÿ\0rð«\çYûC‡¦±Ÿ\æ…•{ý¬ûEþ%Œ¿XE+ŸÀTOšqúQV‹“ô¨T»z~E¡> \ÏC^\ZgÜ¸„&r¨®WŒƒŠ\Ö\år\0\ïT\È]ƒ©c¶+dC\Åj\æ·@\Í\ëøQc\âJ±’ôR.*\ß¢\0 soÖš&VZ3Ï°Ú¥XŽ\ÛV\ë\"£s2\ç\ØÔ¿ò¢\ãµu\áióÿ\0¨E,\Öj\Ñ¸\Å&»±ilµñŒ\ÆH´\è\Ý\È\Ýs\Û†²™®¯g‚o—\Âb\0­$\Ð{L\å\å–>\Å\Ý\Ç<s.\ã]Š->Y­\ã!\n\àk…\ëalØ³Ì·<¸\'¶k¼\èú”·\Z5£\Ç\å\ÌKÊ£¶ÕŽKGo\ê\ä\ÓÆ¦Ÿ¢¼_.wf\ÍPV\îßŸ\Äiqÿ\0\r.\àû\Ø\íW^1º1ðš£\Ë\Ïsq0PŸ*§ø~uËˆ2O$H­å“›9\Æ\Ùÿ\0Þº¢y\í\è’\"–\Âú\ê\è§=»§$\Ê\ã\ÊW˜ùo½f\ækiCx<\Þ;!lq\åö;mŸ¡¥šƒGp†a\ÊUcŒlJ\ãõ¨´’V\Ò;Y|¥G+o¿/cøV‰™4qr%¶†\â£ÀÅ}›¯\ë¿\ãD¤QÉ†D\Å\ÎDtývüi}œ\Â9$‰\â^tb¬Ý“?­i\Ío‘Œ´B\ÊO\Ýõ¦€_O„Š\Øo2g\î¸\ê§\ëüi«F\Ïoñ,<ü½F2?/\ÝPFF\àœYrÀ°z7\îü\èûgI¡r€ò\È9¹@ù[þ—À\Âl\Ñ\â·I\Âad}¶4l 	b\å^Tp	Ç¸É¡ô¶ñ!Ž	6Â±Ç¶Š\ÊnbQ\æF.ŸCGj‡Ó²iaa€Á¼Ã­*´±Ê²žf‹§\ÓlQ\Ö‰dðŽv—?¿ð\ÜV·\"8/Yñ\åa‡\ì{Ô¢™\r©ø˜\Äs\ç\ÄD(\çû\ÊÂb¶ó²œ…‘@oA¾ÿ\0¯z>8\Ê\\dœ“±úžõÛ½Ô¯]Á\Æ{`f‡-_À\Ôwü„\çÄ€H\ÛÊƒ‘½Jöýô²K\ÉB\É\ÎyrŽ®?\Ð\Ñ\åL ¡žP]\É\ì:W’¿¬-\æ+ˆùy€b23õ¤\åhj4Á¼V÷\Ýpƒôÿ\0Z\Ä(\Í9¼¤Ž»ÎºöZø\á‹,3ÂŒyv\ÏOcU5\Ó\Z\Ú\á&‚7D›ög#\ïv5È®\'‰\Óh\Ú\Ûúj\ÌÀ\Ý\\¡…Vµ40Üœ¨\0u\ÇB?Ò¬|6\Ìu\à—û;˜\Ë\Øx‹³þ{Æ„\â+BTHªN	1\Øõ©S\ã&¾J” ¤½ar’©!¶9ô©C~\ÉÐû#Î ÷_ú\Ï\å@!<’F\í\çNþ£Ö·y\á)\"D©>\Çqû\ÍtY\Í[	—ÁwÁV#\å=Ó±­.¹\Öl\0\êyX\çs\èw\éB	¢†Û˜c›Vl\ä-ó\È\Þ]úJ\\‡E’\Þùe¶Ydò\å‚\È\Ã×¨j¶éš¤w–/d\nû\Æ\Ä\ã\Ê\à\à6}Ž\Ð\ÕL@U\â›\ÄCv]Á­O-Éµž@JH1*cf\Æ\ÇôÁ¨{-\"õwoi¬i761#d1–\n\Êq‘€H\å9Ç±ô5Ì®8G\\µ\ÔeI~\ám\æð§xgV(s\ÝN~\"ºG­¾©\rý®¡;\Æ\Ñh\î#“‘ùz\Ç|\ßÚŸ\Þðž•z\éªK}(‘-„fI#a¾•\Îq\ëz\ÎS\âiŽ\nMY\Æ~\ÐuX›[‰,\íÈŠR&uB0šSux\Ò\éá™›|¹ô§\\OÁ0\èNo&\â1%‹6­‘³\èNÀU\Ë\ìó\ì\ïE\â’\ãRÕ¯\â[Œ|$’\à•÷#øQ,ñ\Ç\ä\Ìò~\çjŽ]§_<‰á‘†c¸«î¨>¡¤‰ùI‡+7 VœUöWw£k6V×‰r°\à«ŽpFzv§ü9¢[\é–6qLü\Ç\Ä\r\é\íS/#\âL°\Ê0\ç\è…\á’ò\èÌ¦H\Õ¢¯º²[ñŒ™Ù fô¥\Ú´–÷…¼5\n}Gj#X™ÿ\0\Û\Ý:)”Ã‘}7¦‰‰\íE¤{™À?ñ\Î(!>)c’#þ4^ †)¤*Iæ”š\æ3gû€~µQ\ì©ô\"\âTži\Ö8YÑ£@	\ÏZN\×s\é\î­qc5\ë(ë€®‡«h|%\Íwª\Ëgy€\rE\é\ßf77¶Oe¨‰­\Øy·\æ¯3>6Ž\\55+†–²Ù±Qœô£#¶\Ôµ\Æ$y¦\0º½—\Ù,\ï3\Ýò?\ÊyF)¿	}—6xnþ[ŒŒ“\n9\Z9\ç	p®¯\Ä\Ñ\Å¦%K41–\Û&­–?e³\é|\Óil!\í!Úº½†Ð€0 AL5\Æ	¡¶û$qiø/‰\Ëd\ÛZŸ£ši¦p¶¾³D\'µ€E\ÌžrzWJ?\ÚCb‹„®sSÁ]Žý¾0\á85\ÍAp±\Ûø\']pEr8ôM8\ê\à\Éx\Ò\Æ•”}	¯@\Ó\é³\Å!¯Ÿ¯t]KK\Ô\ã!‘aRO665\Ï\ä\çž8\ë¢2}¿rD\Z\ÄVps­ºB¼\Ø\â¨:\æ˜\×Ó‰ ŒÈ¤\Ì:\n\êv\ÖZœp·\ÈTõ¡‹Cx\íYlV2Xý\î™\ïYÃŸ\î[2–96¤Žw£E/…\àM\"bS±]³Bêº„Ñ˜Ê¨\Ø\à6*\éªhzµœ\É\Ús\ÄÃ™q½Uõ¥·žõ\à•\Ô`)\Åd\ÕJ\äŠ\ä\Ò\Ú\Ü\Ï=\Å\à[‰\×\Ã\0\ÊzŠ\ÃC0Hƒ*œŒžµ‡²{o9Œ1\í\íZ\ÝbX,zU\ÕþÒ“ø\ë\á\Ú<\n¹¹KôWZ½\ÇY®p<e\ÉõÞ‚½…\Ø\ÌqÏ–«WÙ¬B^%\Ó\ã…AÄ¹f®¸ú\Ñô\Å<¼P\ëm­Ç¦:D\0\ælxž\Û\×K_ö¦\Þ!\ç²\ÔPw#þU\Ì89¬?®¯_PÑ§½A€%\îU\Ú\Ê-b“®\ÜiòöŽV+û\ëVR\n¼\Ô\â—Wá’½‹\Çÿ\0BƒaÁw[;Mf\ßüD#Ž\r1“ý¬²Ne{mRB ’?\nmkNf\ä\Ö8vH»\Æ3ü¨_¿\É\è¸~\ÒcÏ¤k\ëžÁ\'#÷\Z‘ô\Þ1´\Þ\ßT–e™•ÿ\0x¡>ƒµÿ\0v\Ô>S\Ñe§õ\Ç\ï¢‡5»e\ç\Òu©;˜\ãò9XQ«k<cgµÍ¼\ë\êð•ýF\Õ\âù\×\Ü9ž¦)\"+iµ>4\Ó6š%¹Q\ÞH?Š\Ð\ß\í¬Ny5n\Ïv‰ý§_øþBpœ£Z]\å¡=O„HúMn’ðM\æ\Ñj\ë»!\åÿ\0ü…º·\Þ\í4w,¾„øŒŠxw†õ!þ\á¬[K\Í÷X«\çE¥\í §ød‡…t«Á›MF\Îpz|§÷P7ŸgÍ¹H-Ÿü§”×®¾\Ï]|ð,O\èQŠ\Z]ˆ´\ß5½\æ«n£û²—–ô\Óo§bk\å<#©Àeü\ï\çø\ZÑ­8ž\Ìþ\Ë\\Õ£³±aúÔ±kü]m²jI8®-\Æ=¨¸¸çˆ¢\Ú\ëG²¹_X\ä*O\àsFý \×\È\ê¼iÉ­¤ž\ÒÀ§øT\ÉÅ¼m	óÅ¦\\ýP©ý\r0}§6Ú—\r]G\êUVAü\rIp\r\ÑÄ¥\í[ÿ\0‰¦?…/·\Úý0ûB\â¶¹\á\Èdü)ˆýõ/ý¥[cœ1x¾¤r·ð¦\ÃÁ÷\çý\ÏZ·\É\è\ëûJü\'«\Ím~Ž>™ýÔ¾Àû\Å+öÁ²÷:\êßž\×ù\Zš>\'û:¹\ëy$ÿ\0}k{ž\r¼ß”[\Ê?/\ßI\ï82\çrúR?ù@?º©%\êB·\íã—nö‡Zµ\ßÿ\0\æ@ýôBh:\ÆöÚ¢6»2µsû\Îˆ\âiNŸø\r,—…¬’Löþœ¤\ÕqŸ¦.QöŽ\Z¡z*µ\Za”•\Åo\áò·]\êeF$f¼$}\Ë$X\ÎA?Z\ÉNc¸úT‘‚\Î+8óUøC¶Õ‘.\ã•bNe##©õ©\ãÁLž´‹4Un§ \æ\ÅdÉµ`ŒdS%šL2„\ç;TQòsDDÀ£©ô¨.A\É\Ívø\ÏM\êÐ©Å’6=+M!„z\êgt+[1\ßÛµEhþ«oÌ€ó>3\é]\Ù\æÅœŸ\í\Ã]i­™\Ù\\>\\Ÿ ÷®\ÇÁ—	\'\n\Ù:/‘c\0\äõÇ©®[ö«[ñ£\"?*>\çnµ\Ð~\Ì¥\à\è\Ób\Ê\Åzô¬ ¨\é\Ï7;¿Á¯\\4±IeER«¿@_Ö¨Q\Ëþò\Ìr„ª\ç\Ó\0\â®ÿ\0hN\Ñ[ˆùË±\Ï0\0#·\å\\\ãSŸdJ‚H\'q·_­j™\ÎÑ½\×)ºž.R5³õ?ÀWˆeÒŽRDa›H\ßùP\ï7$6w.¼O‡b1E\Û0b$l«“õÿ\0^µf`³©”øÐ³+‚+±ôüóŠ.\Ò\è\Í±8\åe@ûmüX–Tfo.ù­M°Ã¨G$Áy9|6\É\ïŸ\äA¢À–>y\Ì0\Þ\Z)\Ôg§\ÓŠ%CÁsÑ’®\Ãñ;Òµx\Z+² \ÏnÉ·L©\Ûô\ÅMr­\à\Ã\"\ã\n\Ùô?\ëû\èz\Z[…’Ux†\0;\àúý)¸XüDdÁp™À6¤13~\Êd\Ï$ v\è{þ\êj\å\â™]9H‘y‡¡\ÛqIºv4­Q “ÁF¸L2õ\Îzgµoq‰\Ë:s\0¨\ØÛ˜v5ƒ2„<¿\á\ÅM¡\Ø>œƒéš™J¶\\#z5„™”°\Ëô£t`\í\â\02+.zKõ5Z„{o)\ë\×5<\á\â\×ennX\ÜG\ÆG\î\íR\Þÿ\0’\â©/À\ÓK²ño\êeo”÷c\Óð+mYE”*I´¸]óŒ\Æûc\éÒž[D¾pJ€;\ço\Ý^\×,\"¾´\Îyž\0\é¿ý}`²[:^-\ì.4±`¤\ÊF{`ŒKu©hŠŒÊ²rŒrVE8\Ï\æ(¾Ÿ—AŽ\Ö\àf\æÝŒE±œ\Ðþ#Mš¨º¹ƒüBP=›¯\ê\rd\äl£e\Z\Ò\Ö\â\ØJ\æ.Y¬\ç\à\rŠ8ó¯\ï#ð£u»L¡d!ÀÒŸßªÃ¬\Ä92·12>\ÝY7¡jŽK%ø\åŠ\ì·j‰\Î\Ë\Ç:8Þ¯\Ùj\ØQ\äq\å\ÛlzQ1Ú³C\Ì”€Þ•i\â\r\Ü\Â]2Dü\ë\ïÒ¶‡L\"\Ê<)óŸj\Ýy?j9ßŠ\Ü\ßÁWkF\n§*jm.É‹È§##ó«;é§ N£Ò¤µ\Ó\Ì!\ÈM\È\Û\Ø\ÒYô7\ãSZ\Û4\'1\ï\Ê\êAôõþ4\Ñ4”’×œ©‹ÉŽ§%G\ï£-lFGU\ÅY4k0÷Vj\0\äKˆ\É¸5q\ËÈ‰\â\âoÁšw\Â\Ø\0ñ$!¹†¡\0M©µö¡­Å·\ÊW\å9\îô\ÜþU\Ð4]\nÝ–\Õn#7‡\Ì\0\å\Ço\Äc§ó¨8\ß\ìzmOQ†\çAÔ£µ…\å\rq\å˜R„t­e‚ooÙ”sc‡g\'“H¶Ö •nP²H?´ÿ\07×­¬\Ü\ÞpoEqn¢e„q)>U9\ë]ûOû/\Z} …o\ànÌ˜ý\Õ\Ëÿ\0¤\'Ï¦ðt·‹~­LÄ«Ö°\Ç\â\Îr\ã%h\Û>l2†»+ü)¯^i§S¼e7Ø“>´®{‹‡â¶·–GŠPa\å+ØŠgý\ZøGO\â\Ý\'WŠ{™a»µ’6„†ò\àõ\È\ï]\ê\ç\ìË‡5\r\à¯y\ÅÚ¡T»]¤O§·µ,¾wÇ£›>X\åÂ¢»GŠ\å’\î4Wòð\Ã\ßÚ¤\×#Hø÷L-’\Æ\0{Q\\O\ÂÚ—\rk\Écr\ë<EA†T\ç_\àj> !xÿ\0Ni”«,€­1Á\Â\n,\Æj²ŽV#”‰ÊŽÔ³M%§»\é\Æzf‹\Ö\äwi]‰\ÞbW)dq»\ÜRç›”¸^¤U§²\Ùi‹…c\Õm\Ò\ê@c‘\Ðs)\îj÷ÁpÏ¢h\Â\ÞyŸ–<ò¨\ÜTˆu\Ûø#X\Ò\Î\áPU$v­\á\âmNKÿ\0†X¤U\èz\ÒsK²[H\êš®/V\0ø`\àd`\Ó>¸ýjµÂ¶÷\Ú¹\Îû\íV%U dU&\r\Åx3ŒVò\Ý)¡\ÕT.\ÛVYAG\åZ\"v	qpœ\Ä\äÖ©~€\ã$VnaS¿ð¥óÛ©\èø4¬\Z\Z|X‘qÍµ.\Õl ½¢™Ñº‚*(r§\Å™aó\n\Z°EU\à®Gñ´\Ö1\ã\îgj«\Íñ2Áw±\"©)‘\Ôýk°ºd0 \ïl\àºC\Ì)*QXp\ãûCŠôq÷\Õn%¸…e„‘\É<õ;>‘¨¿…}§\Â\Ý\ÙÀÁjÖ¸.g¸\Ò\Ô#±ž‡\éT«\ë9­õ\0·Q¼\';‚6\ÅK¦VµŽ\r\Ònÿ\0V]˜OR$9Z¬\ê\Ü)¨ÁlD©Ÿš#V+“p¬\ë	‰\Âú\Ööšž¡e§\Ì@U˜†¢— ¤r]j\Öò†·ž\ÝÐ¨\è\Ãhû(¶1ñ O”¡f„U\Â\×V°\Ô!/ªY\Å.\Ã]þ”\ç†ltañ\Ö6+o R;U\Æ\í\Ê?Cû3‡U’\âöm;U·LË½³I÷Á«V¢Ñ¨\å\â\Ûÿ\0\Ì[Š¥p Ñš\ÊV\Ôl\î\ídiO-\âg®‘?YZx\ÚMå¶¿i\Þ9s\ã\Ó5°-ZX\Ú3sð\ç42v†G#ô4Dú\Ø/.§¦A¨B>÷.øúŠ	\ç\á\íT Ô¬fÑ®\Ï]¼¹¦0\éšÝ”b]UpvR\Ü\ãò?Î{\à_ñ\Ü!¨K\Û9ô\ÙN\Çl¯\éüªXxe$7kj\ÝÀŽR§ô¬\Ü\êV\î|.!\ÐT7C,\rõ\ÅBœ?¢j\âhz¸ŠnÑ»qû>„Lóñ¾—³Iñù±‡ñÖŸ\×\Ó\\yuŽ¶¸\Ú†üó¬‘Æº1\Â\Ì÷P¯ü\Ð$ñÔ‰Å±?“ZÐ‡¼a¿CƒJ¿’\Þ7/.›)û“e@üöýk\Óp-µ\Êx–7–\×+ØƒƒùŠ*H¸G[^H/\Ö\ÞS\Ñ&òœýù\Ð<jL\Úl\ç\Ô5¼¥\r4ÿ\0 \×\àø{‰4±›K­Bò¦.¿•kqvžü’\ÜAr£\î\ÜE\Ê1Šój¼c£·+]\É*»u7\ëÖˆƒŽZ`cÖ¸}\'^\ï\è6¾P­zd±ñ\ÞG.©Ã‚A\Ý\à`\ãò\"¦N\"\àK\Ó\Ë:Kb\çþdL˜üFEz\rK5 ™¬$?vPc\Ç\çµM7Y^\Æd\Ó\ï\à¸SôaùŠŸ·\æŠû¿’Xtž\ÔFt\Ýj\ÏE+~j\Î•†Q­¦\ã¤z\Ý&[\àUñ÷¢;\ÒÅ±\Öô¶Åž©©Y‘÷Kœ~F­rô\ì—^\Ð\ËP\ài&M+›\Þ=ÿ\0u\'“†\ÞÑ³÷öl:r»-3·\âž4²\Æn­/”v–<øŠa\ÚU\Ú]W†ËŽ\í‡\äGñ¥rö‚—È‚Ž*³ÿ\0ºq5\Ù\î\Ë\ç­qÝ§\Î\Ö€z.R,SØ¸Ï/\Ï-\å»Ù¹\ë\âÀWõZ:\Õl5h	=\Î3ù\è¸>\ÐT—L¯Eö¡®Cµÿ\0\r£Ž\æHý\à\ÑQý©ðü\Þ]GD¼ƒÔ˜\Õ\Å6¸\à€\ë›k\Õ`zs\â)E\çj*,1L?\ÂE\n0}1\Ü\×hù¸\0H$\æ¦!v\å\ê*&#˜c¥J®+\Æ>\Õ\Ù*v$\Z‘‚úoZÅŽ}÷­”\Z¤C\ì†_2n£j\Ì8\å9­\ÎJŒfµ‰H\É$T”Õ‡)˜b\æR\ÌzÔ‰T\ßHtˆ°I§­\ÉÏ­Œ¶(\Ë}1eQ3O\nƒØ\ë«Å’M\Ù\äþ­\á…Ê™_Â†º-Ý»ÿ\0u\Ç\ï«$6Vy\åi\Ø\ã*\Ð÷k¦B9\Þ\Õ\ä \ì]ñ]NIž\"U\ÙÍ¾\ÜmŒ:ôA~\àb}*\Åö+1¹\Ðf®$$\Øô\Ú\Ü\æ\î\î\'¶\0°¼‡ ¨>\Â/gŠ\Þþ)Pø\ß\ã\Ûð¬£+m|¹1\Ö5+\í~\Ðm<\à\'ŽØ=@õ>ûæ¹Ÿª·1`ò¹\Ã\Óx\è\Ëpñ\Ü98Œ\â0N\ãþ¶®Y¬±G$\à•$|œÖ«³—Ñ¤÷		QŽ?˜5ªH\ÂF$œŽSžû\Z_#ó+BNL$dú€6©­\åg”€*\ä×½jd\Ã.\æ\å¸i†\Ë.	¶2üÿ\0}h \Ëh_¨]\Ï\Ômû«K•-\Z†™Ù˜}:\neib\Ö\ê€\Ï\n\É\Ç\Þ\ãHa\Ó\ÈŒY\ã=À\êö\Ø\n‚’¶\Ò\nvû§¨¿ð¨¡›7N[$ŒÀ\Zó\n\Ý	o*žV?†\ÔÛ°J†¶rxN¶\ÌFS\îAÈ£¬\ä2Ø wPP†_^»\È\ÒPH½L1o1?ÂŽµ}\ÑT\íƒ\ßj\ÎL¸¡›IÌ¥Ný¾˜¡m\ßÃ—ÇŒ•%Š?× 5%¹\r;!ÀlŸ­Ha *7i\0cØžµœ¥£xGc¹,¢¿\Ó\Õ%A‡a\×¿\Z\Ö\Þ{›\ë›k¯\í>Fqór¶\Ì> þ•d\ÐañPÛ—\é\è+}N\È\Ç\r\âl©!Iª¶\Çò8?s}Fv}$É¬¥•¸\êÁGSG©\ß Î£‚3\äµS}†cXòfüW@\Úl~y\Ç+\Çl®\Ùü±S\Ì&V÷(<ª\Z91\ÝNùüýkt^S\æ_sR†H¤\åL|t|¥\ä‚S\Ö9Aü7ô59\åe Š\Ë\"¸õ¯0\å¬ì´€\Þ\Ô?\Ýz\ÔÙ®v\è:mF¨\Ïj\Ü!\È€VÖ«B«sl§|wÈ¦%\0\ëŠ\Ç(\ê@¦™-\0\ÇoËµ9Ð¢å¹Á\Ï#gªœ\Ó\ëNxhÁÌ²Žç¨­ñ½˜\äZ:/‹ñ¬\î\â`Y¼X\\v\ÈúŒƒø\çÖº£‘\Z¤„3Ž`>oz\ç\Ú1‚\Öö9\ã`ðM\Ê\í¿ölŽaúõ«\Ür)…]X2°\È\"½¹.X\âxsÔ˜gŒ¤òö®{ö\ïÃ“k\ßgš¬ZZx—I8»€2@÷«\È<Àlg­Cs:D@B0:\ç½N4\ã-Ý£\å\è}q$Zö±\0\Èf¶Sƒ¶5õ _\Z5™[|n+…pWûx×­\í\á\"\Æú\Ô\Ý[\à`\0\Çuüjý¨qÝŽŠ¯o.>%|ž5´\ê¶úœ©!gÛŒ‹lº=\×.y¥h‰ô\èk™ñ]É—\í\"\Ö6Bq?\n\éjw‘j\Ü¦\êöª$x™_Bv5\Ê8’\æVûOµr¬ª«(0+‹+M\Úöl¢\ãi„\ê9hÀa\Û6\Ô×€´ßŠÖ¥.#\å*\â“\Ú\Ü.¡«Mkvh§`\äôw\Ñ4Ô‹\æ_7\\\Öº,¶^pý­\ÄagN^Q…\å;R+\ÞX\×ÇŠ\íü§8#µ?²“òH³EH\ìð2dŒŠ8Ë´D£\Ú\r\Ñ\æÓ£\Ó#@¸\Ç5JÚœüöò\0;\éM²4QW\Î7Þ¤v|±\Íh´5\Ý9œJ²æ¼šþ’\ã\0\Éø¡5¶*Îžn‡+\"†Œ`J´\"g\Ôô\Â3\âz†iôò9„ƒz‰­-_*\â\ÂÙŽñc>”.Oð¼_yj-´c˜Ë…\ìiUÞ™/ ”o\Ô\Ð\'NŽBs…¹\0\Ë4s\ÚH¿ÚŸ®+o\Ð<t\ÛÞ«†\Ñ\Ðró8_f¯Gk)B[\'¹4,ÀD\ÈGÖ—\êvZu\äe&X_>¤RÆ±`ù8ö\Î\Õö\Ì*MR\ÒcBW„’tÙ‡?d\' \ÕOX±¹¶—\áõc\Ï^Æº\r´7PÎ²¤ òö\"–ñ>…w­°”\\…eè§¥c(VÐœ=\Ä\ç6ñ\Èe°@FÖ¬œ+C¼±c¯zU\Ãú†œ²`yH;Q¼.¥Ü².6\Zœr—*fJRºh\ê<úÍ—,\Ö\É³jX—¶\È\çA\ßl?\Ô÷s«\è\×\×\Z&¢ü<¤¨&‡\àùt©´ø\Âi4›ð£\Í\å\ÓMM\á‘\Ö>%\ÒÇ‰÷/ _Ö»Qd·—\Ðb%\Ò\Öò>\×\rþµµŽ›gpÿ\0\Ãz»C/ü’Ü­ùw­-S²€Ë¥\\¦©§ž±9\É\Õ\Z®ƒ«>6“}\Ø6ËŸc@\\\ë\Z­û¾½¥¥\ä]<@¸8ý\Ô!²\áh\æ\Æ÷\à®\â9¼»ûT\Ó\\ñ&Šœ·(º—øü\Û{\Z\rÿ\0\ÙMoË–\Ò\îEyIúÐ„\Ù?\Ãñv„9­®^\æ\Üt\rûU\Ç\ï²ñE\Èðõ\Ý”ô2À9±ølj²\â|K£sk\Ô\0|D#\èw¸\âM&ûö|A¤øt3\Â2?˜¥ù1\Ðøw[Bt­N\"\çþG\áÖ‚—B\â=ó\Ø\\\ÝFƒþSó§þ“S\ÍÂº~§\Ä\èzŒÀ-†_\Än?\Z\Ýñw·+K3Ä¿r\á|E#Ùºþ´Ó¿Èšù$Œõ\ËQ\ájZ}¶ ƒc\Èß–\â¤]_‚õl-\Ü2\éSž\ärŒýF\Õ\å\ã*õ<=D\å\'c,#˜}}Eoþ\Ïhz\Ü|ú«g¬2n.¢–—\à{’Yx2\ÎúM¿·»Œ²AýE ¼\à\íKN\Þ;›r\Ïn\çøT—|«i’­Dð0ÿ\0‰l\ä~\êõ¯ñn–Üqôcª\\&ÿ\0PÞ«\îþI\×ðCo®q~šÜ±\ê†\åGü;”\æ?ŸZg\Ú%Ú¯&³\Ã\é2ô/gôjš>:\Ñ\îñ½ \É;D‹ü\è\Ø4þ\×:V«\Z\Èz\'8\Ïþ“½\'\ÇÚ¡\ï\Ó ƒˆxU<³Ÿ€”ö•{ýzQg…4«ôñ4­V9ô\Ã¥,\Õ8\ìbH.—Ó¡ýj«{\Ã3X\Ë\Î#º±}\è\É_\ÔSIÿ\0k¯\îEŸQ\àAA\Ä\\c¿\äj±¨ðŸ†O§K	þðR*{MkŒ4\Ì]i®PtK•úé½¯\Úf¯o\ä\Õô\çN\ïnøýi·%\Ú\n¦T\â²\Õ,:v±}lA\Ø	N)¥¿qöž5/Qz‰QXþ}j\Íp&«\ä\Ô-ž\ÊC±ñ¡\Æ?£b\á\Î\Õ\×\ÄÒµD$\ïˆ\æ\rúu¥p}¡Ô—Lùx\ï¼¹>P1[„P6$ý+I!¼c\íôKpq\éY’2\î	cµn†&ŒÖ¤*EQˆñ†\'¶*D*#Êœ\ï‚=+\Òrú\íPª¸\æemœ`ŠCoF\ìÜ™v<£“!Æ¡y	b\Ë\ËÚ¤B­Žn‚Ù£\È\Ù\'¢m\æaÀ~ó\0\ä\0\0­\íß3j\×\Çù\Ô\ã~=ü1’M•\'$ö¥š\Ë\æ\0\Ç\ãD†¡Cg&†\ÔWš\Ôz\×yóeŒG\Ä\éˆ\Ì\0Uk\ìrF¶\Öæ¹ò\èz\ì65d\â\áƒH„\Îy¹TóªõÀ5P\à]B)8\Ê9-ù’\r\Ô\nå©³\ÓmKwµgL\â\Â@dó\ã­rŽ1·{k\×\ÜòŒ6\Ã\×?Ê»\r\à%„g•†=ªö§½¸ŒdU*]³[N\\YÉ†?Q4Žy¦%\ÌÀŽ@7\îi¬ SÓ•p\n\Î\ÖKRD‹†2*€\Ãòýôl`òŒ…™rG¥l£)*{$ƒ—Â`\Æ>uüˆþiP\r«‚\Ø\ãcëƒ‘C\ÄcRvCŒ\ØÞ§‡$a,\Ä`þ•-\ìiA\Z(#òäž»/ý\Z…¥k˜]b\Ñ\à}TŠ™\ÚB†\å>.\ë\éBX—’\'v!Xr=ûQaAð·4\é!\ìpG¿Z2	€•H^\äÊ‰¿Ü\åóxƒ˜Ž\ÛVð?†U[#$`þ5,¤6‚S‘¾mŸ ÿ\0ÞœXòºº»ºýOþ\Õ_…m¶Á§ú\"1sœñ\îkŸ3¤uøñ¶[´r«	¾\ä\Ó(•d–A\Ù\Èö4«NB¨ALb79®{=%n^@ \î@52Ža½F=,W*7«»\è^ÁŸ\ËÖ‡$õ\Í3ø7nµ»éª©’Àz\ïK‹brHR³\0\Ûõ5#9\Æ1G5ŒH9™†=*&\'Wõ¥Á‡4in	^n\Õ.@9¬,\Ñ*h‹\ÈÔRj\Ê\Âe|v\ëQJ\äf´üQš–e_	_JHM‰\ïõq¸\ÎÃµ%½ã†µ˜G\æõ\ÇZÎ©hò\ÈÜ€ó6\Ýi}Ÿ\n%Ì‡\Æs¹ó{ûVø¸§l\Ã3mTN›öc\Ç,u#\Ê`Û€­±#\Ð\×_\â>7\Ó8jf²pK\Ì\0>Qš\á¼¤\Øh¦{«”w·Ž,°\Ï\åU/´¾.mFðH—<Á*\ä\î\0\í\â\Ë‰NLožÎ¥\Åÿ\0nRi\ÖS\Åj\Ê\ê9[?(®guöÓ«\ß2^<|­œø‡\'ð®ky$š™&BUS@O§\ÛAºL\Îz\Ô\Ë4›Ö„ ¢}Àÿ\0i\"\ïˆm\în5–@¼¥\äÁòžÙ¨ø\ÞI.x\Êòþþ\ï1bq\\L¼{ c$Q]Ÿ\ì\ß^\Óu›{}q˜À¤+\×Ï™Jq\ât`È±Ëÿ\0N\âùm4©49“ÅŠi£qŸ¸A õ›–Ÿ\í)\ã`Ê†ü«i‚\ï‰æ¾†0–¦~dü9Ú†\â)>‹|`#ˆAõ\Åe\\RŠs\ç7\"\ÑÁzz½¿ˆe¦»“—\è*ñ¦\Ã(\Æsïš«p+¡Øº)!\ã.\ÇÜœ\Õö\ÎLD\0@v\î)û%AS2¹R3^/M\êde*r£=ª€§RŒ|g­o\Å\Ðe#RøQœ«Û­\Åm#\ÆùAœ)¦ Ä¸D^nbB\r%<¿0Á %)\à?H\"Œ€/\Ã\"òöššbgŒ¸<¼Æ½ñ\ê+\Æ%>nõ«[#ô;\ÕX¨\ÒI†r\Ô,\Êó¢§{G\0\ä\Z‚k6#\'\'\ÐJÀ\Õ&\å<¦§7û‹\ï@5¤«2\rb\îcv\ÈúQaAì‘‘€£	¶ˆ|£…j\Z|l+\Ü\×\r#Þ‹m\Z’I\0\Ö\Z5f£\É8>h>Õ\Úr\ï\æx\Ã	z\Z¯q¬1ÛºBˆ!m©Ó‰ƒ‘\á¶=j½\Å\å¼8\ã\Éœ\n)X7¢\Ùi¦xzT]Á\Ñ}:ƒS[^\êzZxdFÇ¼Rn\Ê=©v›\Ä\Ía}‘t‹qnñŒó\íVYl\ã’?\Æ_{¯\Þ_¨ªLN.=ƒ\Ø+¹\rÖzöw}Z\Ù\Î5›«\Û;—6¼C`m§\è.l~´¦\î\Âœº‚u;:\í½o·qm´\âQwm\Ñf0üj¬‘ºA­\é1xúU\Ú\ß\Ù¸O:\ã\é\ÔP\ÏwÃº\ÃxZ…±\Ó.\Î\Ü\ày	¬\ÚZM\Z|j$}Z\î=ˆ¯I¨iz™6\Úõ‘²¹\é\ã\Æ6Ï¸¦\"T\Óø‡A_ˆ\Òo\rÍ¡\Ü\çB=\ÇoÂ¶\Zþ‰©~\Ç_Ó¾s·\Û>ý\Ç\ãQ¦­\èj.ô[\Ãshw\Âù”qYþ¸\Ðu\Ø\ë–rvñ\ãR… 5¹\áp/ø{PY\ÇUhd\åqùT1q?h\íðú¤ú!³,\ë\Êøú÷¯\\ðÖ§¦·\Ç\è\í$gpö\ï\Û\Üt5˜8\Æ\à/\Âq&–—‘Œˆ¸qõÊŽÿ\0#\ëðL/ø+]<“«\é7M×œr®~½(MG‚/!\ÅÆžR\î3º\Ëa\Ç\åD¾…\Ã|A>‰¨Æ’ž°K\Ô¡Þ”ü\'ð\ÄØ´’\æ=y\âoÂšOòMk®qVŠ\â#tÓ¢\í\àÝ¦õ¦±ñž‹|<. ÑšÙ¿\æ \ç_\Ìn*n;Šdq&Ž²¯O\ZŸ\Ð\ïùQ\Ñ\è\Ü5¯\Äd\Ñ5(ÃŸøLwPw¥¯zý\Ð5¨Ìš&«“¿!`\Øü:Š¯k<\r{	2?$„\î?-\ë\Z\Ç\ê6fKww[±\ÈüºTvM\ÅZI\ä[Á{\Zÿ\0Ãº\\Ÿý]j¾\ï\äN½\è\Ò÷‰´f\å±\Ö.Tÿ\0cp9\×ò4\ê\Ï\íS€õ½;˜û½¹Áÿ\0\Òv¢\á\ãQ.\"Ñž\Ñ\Î\ÆP¼\éõ\È\ÜQ‹\Ã\\?¬\ÄfÐµh\Û#<¡Ãøu¾\ßj‡¿LŠ\Û^\à\rp…•\Ö\Âv\í*˜Ž~½(‰ø*\Ò\ê/M\ÔRD=3†˜ªÞ·Àú”\\\Å\ì’\åÞÓ­V…\î™1{\Ë\Ë	er¿¥RM~\ÖK¯h´j\Ü¨F‰b³¯÷“\ÍU[¾\ZH$%RkiqE<\Óxßtõ/ƒªB¿ó\rùŠ{kö \Ýþ\Ã_Ñ§´~…Šs¯ó¡\Éÿ\0r\ZK\Ó>v2py@ôÞ‡s\\s3gÚ¡‚vy\Ûz\Ô\åCšñnÏ´®&\åÀ /J™ f XŒ{j\Ý<\Ç\n	¦K£\ÒH\á\ÎNÝ«*\ä©Þ§’\ÎÖ°-)$\Ó3ú‘\ä,\ç|EGùù³\×j‡·¸\ïYY¹ß·jE6\ßAw\ÃdŠ\0\ä0` );T\ì\Ìö¡—-“¾kqkD(NÀU\âiMžU\Ë“\ì\ß0¬+\Ìù\ïC]I„8O˜w4\Î\ßC\Ô\'Šˆ\×û\ÇaŠ2M\'E¶ˆ¶¥©¦GUC^$»>n0”ž‘\Íx†Í§\Ð\îg\r†ˆ•ü\Åsþ	vƒ^´<¤.q\ë]¯^›A:|\Ö:]\ÅÇˆ~cÐŸZ\ç\Ó\é·ñ\ßÛ­µ/…*¹\Ûlƒ\\\Îj\Ù\èCEh\ì\Ö\\9w{j\Î@Š#¹w8MûH\Ó\ÖmJ\Ûú«7Mr\Ì\Ë\Ó9§ò\êÚž©\Z\rBr‘\01gøÖž:D9bˆ/\ÐVy3)~/,n\ïg9\ã]!\"±‚ï“«\'0\ë\Ü\n«\ï\áHg9>›\åú\×JûDß‡$’\èùôÁÚ¹e\í\Èe![q0\Ï\å½o\ãÉ¸œß¨AG.ƒ\"|AF\Ømþµ*²‹˜ÀùTr\î{b—\Ú\Ë\âNe\åÝŽ@ô¢\ã\Èrr# \çþ»V¯³ˆ2b\å\ån`\n±\ß\ÓÖ¡\å\î\0Rsƒ\éÿ\0F¡yA\É\æ%€o~™©ùœ±c‚2=\éz-©>	V#,Mbä²²\ìvqµCþ\×\å]¨‡Vš\0ÀlNö\ëStRV6Ñ¡y%\'\ßj¸i\Öx!±ŽcJøf\ÍV\Ñ®\ì•[-aÂƒ½y\Ùòr•¾\\ iXð3µ]­f\Ý\0PMO$T€ü+¹Q¼B%vP:œÖ—\Zå¯‘Hfõ\'’\êp\Ü\Æ%Qž\ìqUmGO»¹`^\â@T^•¼0œ¥\è²\Þñf_)2\àz\nO¨ñ¬¨C\ÎO¾\âid\Z(Û˜É¿s¸©_†\Þl,‹:Vœ¢ŒZ“\ßñ¶¥1ð\á“˜O\çCG¬jR¶d¼cž ô4\éxN\Ö\"\\G–õ&±ýEo°úŠ—’>\ãŽ~\Ù\ëm^Vˆa\È\Î\Ç~Þ”TWL\î	|þ41\ÒyqLt\ë/0\Ï\è+\ì\Ù*C½,“p~¦‹À„ý+k|F;zT\Z\Ðða\åsµÃ†\æj3Nˆ\Øa}\ê›\ÄK›y\rŒ`\Ëq)G@¹\èI\è*]JÏ\í-\Úõ´«5„.Y¥&l^½½…o\ä¹z0žxAñö\\8þ\çú¿\ìúw\æ!\în£…Jõ \ÇøW	\Ô&/\'3.v«\ì—Z·p‰¶šbK)\ÞF\å\à\0g·_m\ëž\êñ{6\è¼\Ùük\Ñ\Ç«<\ì³\å&\Ð=\Åä¨™R@B\\I$’Ížõ±ns\ç$\íZ6s\Í\×Ö¬\É3hKFAÓ+R{YC	\nûŠK\Î@Á\è+1I\ÌÜ½\è`®Ï¡>ÌµYuXbNa!ˆÞ»\Z?4ßˆ·Ôµ]†\Ê~»U\ì‚il\í\Õ\Òe˜88GPk¥qÕ½þpO§]C·®N2s\ØÔ¶\Ó.¼keo¢ZC,…!PG\áN—ÁY3ŒSÔŠO§*:*DC\0S4\0û\Õ\Ñaª\àŸ+mô©cb[\ØP¿(\Ç(ûÔ±sn?: cþ!½E\'†\ì\Íõ¡rn\\¯~ø­a\Ì<¸\0lJ€Ñ•^Sµk *\äÈ	k\Ögšƒ‚J\\c½`8Ü€\Õ™‰\Â\îEJ)Û¥Q&\Þ\"\ãrÕ©*s¹¬¿Š£¢œÖ¼²…\æ\å \r<E““øTM,eð\Ü\Ãð¢Ÿûƒ¬¤Hˆm\Ô\Ð\ÞV\æ\0\â·%A[:s(n¾Ù¡Ý¤S°ýh\0Žs\Æ+RÍœŽ••À_3oô¬ò±ƒšˆˆbrz ý¡]Ikq‘¸WG?J\èez\çlW#û]¹ð˜•\É\Ü\ì(1\Äpk\Üel÷2Aiv„\Î\Øô÷®¥ip\âü\Ë\Ï‘ŒôþuòF¾²KÄšq³¤Š9\ÉZúE\âøôag­\ÄòGqý÷;¡\ìÚ‹HR¶tÁ5­ÿ\0–~[{Ž\Î>WúúPW¶RDL3 *{Á¨\Ç$$±ºKŒ£©\ÈaRG«|+%­Ê›ˆ$8\nF\ëô5V@´û›;ŠÒ§xe<™ÿ\0¬\Ó;n\"±¿\ÄV¢)¾Q:\ÄQò\Ú\Ç4F{ñc\î¿y~¢”\ß[[Ü¯‡r€Ÿº\Ã\æÀb,u]|v‡yñ¾Ì¤{Šñ\Ôt\rsö:¬Õ·­°•G‘!µ}_@Ï§N\ÒAœ²‘Gºÿ\0*mÿ\0ñ ð®\Ñt\ë\æû\ßq\Í;‰ô{‡œ\Ý\é7Lð\ÃDy‘¾¢¤N&Òµ0 \â=8C/O‰„møúT\rð´œö²m	ùOš6Â§[\î\â\Ù\ßEýU|\Ã\ßq \Ô89gŒ_\èWivƒu1¶~UÅšþŽÿ\0	¨Do\à]š9\×>‡½G{ \ë\\=?\Æé³¸ˆo\âBr¤{Š>Ó‹´ûøÅ·\ééž‚\æ!·\â:Š}ö ¸g\à\î#<ªÿ\0Õ·÷$ò‚q¥z\Ï_Z7\ÄÚƒ*\ÖX{\íE\ê\\k¨\Ûü^‡w\r\ÜGp¹\Ãñ¥z—ð\Ô\ÞS\ÈQNö÷\0²Ÿ§qøQ¿Aü’\é\ÜU\Äú;øM8¿…v1\\8œ\Ýi\Ô<U\ÂZ\Þ!Ö¬›M¸;s¸\Â\çü\ÃøÖ°ñ_\rk`A\Ä:À\\„\Ãt\'üÃ§\ãX\Ôø\Z;¨>\'G»†ò\Ü)`\"6¥¯\à{þI¯ø\"¸~#G¾†\æ&\0° þ\"©ÚŸ\r\Þ\é³øoqi*¥ˆ•ür+I,užº-i5Þ(=<§ð\èi\î—ö‘©Û ƒ]\Óc¾‡¡–†üT\ìj®K½‹LM\âþ,\Òp\Ôz”#\î\\¯›ÿ\0PÞŸ[}¢p\î¤C¤½£‹”\ç_\Ìn(›i8Š?\îWKet\Ýcc\á¶~‡cøP\Z\Ï\0Þ¢³[øwqõ\ØþT¾\×øÜ†‹\Ã|5®E\ãhZª);€ü:ŠC¬p­3r%\âz®\çòª¥\ï\ÜX\Üs\"\ÜYN§!”•4\ËK\ã1Ñ°¦\á5(nI\Æ[\æ\ëU÷¯È¾\Öpˆ\ÚwqÈ§”þB´¶|\äT\Ð\É%y}…zVfu\n§–¼u¬–vô•xŸ\Ñ6p¸\á}\èUŠUŸ•q\Ë\×sL‚ô\É8¦a“+ª$ef-^‰\0\Ç9÷¯11!p7¨\ÓCdw¤s\Û1u\nHpzúŠYyhñ!l\ì{Š`\ÓÆ’…\æ\Æ{T³•xˆ=¡\ì\Þe\n\0³!tö\ê\Ø5¬\×RÁ4o|yr2m1[Ì‡Ð—‘$\Ò\è\ÙT\ÛA\Íq¨Þ©Y\ï¦eþ\êùEb+(r¡\ä÷Þ½\Î`aA\È-¬…nTœ\0v\Å72V\Z_oG­Y\ZnF\0c ²F\' ÇŒµ< %Ï”\ç­z®&9aø\ÒmšB1n\Âdeˆ)Ajxx~.FIÚ†™·‹;ò.MOj„\às\Z›/\Ñ_\ãh¾3D¹]Àe\Ç|\Z\â\í(2H_`¹\'ný\ëºjª¿\éŒómZ\â\×z¯s¨\\X\éºu\ÝÜ¬\Ù+L\äÀl+«Æ—\Ú\Ñ\æ~§\îRF–srF~bq\ì3Ÿ\ÝF\Å.aR0\nŸOJ†^\â+¿¡\ê0\"\àe\á?™ü*{H¤r1s\Û\Ó5\Ñ\Í3\ÎX\å\í\Ï(Nø;þ?û\Ô\ï&6I “ô­\ÞE\æR¤\äqZHC,Š	$0\Å;´KT\Ì[–’NNˆoÐ­g\n‚«¿ðªžšM\Î\Û¸ü+ p|a\ÑHÿ\0­sg•#¯ÅŠl²ivÆ£*«N`‡\ï[Y\Åû1E¬Djó»g«Z!\Ï Ú£š]·\'5¼ëŒž”®ÛJi\Ñ\éG2|\Ã\ß;T\r‘Þ£ž\à %\Û\éU½kˆ]%§(\æ‘\ÎhŸ£6½–‰$¶K\ÈñÇ\ÎNÔ¶û‹4k%\ÃKÏŽ\Ê+”ñ:†X™\î%9Äò ª·Ç½ÌŒ.‹\È\ÜÀ†-\Ðw®˜x\î[“8²ù):Š;\Ç\Ú\r›\È\Â+f\Ç@[;þB·\Ñø¦-FnE‰“Ž`\ÙÁ÷qW²\Ö\ï€ô\é/lbg(J³\0O.N*·öƒ\Ãz}ž¡šDB\îaû8\ÆÎ½\Æk›Å„#i™øþTòNšŸ:Ž½i®›j\Øþ¢´±µg‚$~Œ ºž \âŸY[N‡ð®(\Äô$ýYC\å\ìioÚ™$@>SÖ¬VXS\Ê\0¨µ\ëS-²°+±5mZ>[\Ôu[\íC^–5P\ìgx\áX\Ó}\Ü\ã>ý7¯¥t\Ùd“H¶\Ó\îM+@°\Èä’ \Z¤\êv61j¦\ê]:º_øñ(W#\ê(ûln./œž©\âr\çò®¸ùK†^$¹rô^8£‡t^¹¹\Ð-¢_‡¶1\á1“—bH\ï¸5ò«©|E\ã3\ÆÁó`mšý\r\Ò4[\àkM$[F–\íhª”0\éøf¾2ûnû+×¸kZ»\Ô-¬e¸ÒŽ[\â#\\ªÿ\0›Ò½,¼²F2Š\ÕQ\â¹&÷g6ø\Ã V¦\à•\Å9Á¤\ß\n¹®g-D\Þ9>Z±pN‹.§ªÀ%`.1¨=Bš\îx\Ã)T\ÎX\×Q\à«%IÍº\'$i†\'‡z\ã\Í\äW\Û\ÏC\Æñy}\Ó\éþÐ‘.\Ì1s&Ÿ\Ê\È1¿.hóö¥H\Þ\ÍÂ±\ß!ŽÆ­üel\ÚE¼\ÖË”so\Ôæ¬–útj\áÂ…c\Ô\×Dd\â¨\áœTœ\ç‡tþ$\á.!†ñg’\ê\ÆA\àÊ‡\Í\å=þµ\Ô\â$x\"œò\ãz™mÁ\Ù9×¸©\Ò\Ò(”~\Ì)aŽ`rE7+\Z<’\ÜÈ®!¶ƒ#|‘“Š^mn#‘\Úvˆœ\ç!¶u¿‰Œb¸.¸\Æýk%bw\ä+\07\Ûs@e7Ü¨±¶wÙ«\ÒÐ£O\nòž›õ©ç°…%&`¤caZ\Íh9rŽ\\~\ê–0‹kˆä‡—W=ecO„;u \í¢qœ\0÷£#>¤R±…@§¯/\ëDòØ§j\Ò@2:T¡€1«DžKxŽ6p~µ3\Û#Œp*.g\È*r>µ<rHWÌ¸¦\"%³P7‘FlÁ\È\Z,ÉŒÖŒ{ƒ@\05“\Ç0\Ô\n‰\ì+úš>Ncœ5\Ò\\«\à a\ëHd\re ;Ë‘YXf_ýè„‘˜\ÊAô­–OQ@p«&A\ï\\\×\íƒµ\ÝR\çž\Ê‘s\Û\Õy\É\Û\ëQM!X³ŒLGÍ¯ÀºÔº\ÊkòE\ZAaû7ŒŸ1\"\ã?ˆš$oê»§…(¼ÀÂº\Í\Õ\ì¼;,òh\î.y6¹«¡\Ú*-¤h\Ëò ÇµD ¤\ì£\æÏ²®-\âýˆa\ÑÅ…\Å\æ™+r\Í¨ß±÷µ}r9\Þ)-\ã/¶z\ÆiŠ\Ú\Ú,†E‚5v\êB\ëbˆ>_)ö«LM	,\Zk{§ž“\ÌN\Ûôö>´\ád´Ô˜-À[[®\Í÷ù\Z-5W(y]Û›Ùi<e	ŽE\ÃÆ©2\Z¢k«Y­%)\"²ž\Ç\×ùÒKJ¶ºË \Ì{•¾¢\Ù\êb\Þ\í\rÍ·§\ÞO¡©®,HMÍŒŸp>eúŠ`Vô\ÝsY\Ð\ÃÜuh\áJrÿ\0S•³\á\î\'ˆÿ\0WH-/1æ·“lŸoô¨%]r\"ºª\Ý)=öŠU¼}=Û™NBg¿\å4ÀaüCÂ“øl¶\Ý\á”\åö=©”\r\ÃL\n\ÄF™~z\Äû>Ý,\Ñø\ÂX£ø\r~µùK2þ\Ñ>¾´u\ï\ézÅ¯\Çpõ\ÒJ½|>l2ÿ\0*,—ú·Ã—?e,°`\äIÊŸ¨¦v<m\ÌBÓŠ4Õ™:|DKœ{‘\×ò¥ú\ë\Ü=)´¿ˆ\ÞÚŒS|À{Nb¶\áŽ*B\Úd\â\Êô\î\ÐI¶O\ÓùPÿ\0!üº\áM3X¶7|?}\r\Ädg\Ãf\Î=½ª®\ÖZ\ç\rÝ—³š\â\ÆL\î£toÃ¡©µ\rX\á\ëÏˆ\æµpv–\å?_õ¦\Úw\È\"œO§%\Ô\'o%\Éú•þT÷üˆÍ‡\Ú<bÛŠ4¥š#±ž\Ï\âTÿ\0\n9¸s†¸Ž#q\ÃÚ”q\ÈFñ\ç8úŽ¢³/hzý»]p\î¡$d\ÄOOluL\ÖxsR\Ò.|cÖ²/\Ë4G¨¡µþIxƒƒ5+Z\æÈº“E¸ý:PšN½\Äú°Ô¤š °Ÿ\Ì?ô¦ú7ñ—\Ë ‰ª[\r‰a\Ë ^õa¶¿\à~,\Ø0\Ó\ï›\î¿\ì\Û?¸\Ñ~¤…_\0–i:]\â‹^\'\ÒZÝºy\Ó\ë\ê)¡\á®× 7:£\ÎøF?\ÔRM{€µ8£-k\"_A\ÔañT™´«>\ëž\Ý\îl.W¡RT\ÓQ}Å…üœ\ê\ßB…\É=Mn\\3ò\ïkd\n0Â°\é\ÊüÀ}k\Êh÷yY(F\æ\Ï(\0Žµ‚J©\ß&¤ˆ’ƒ­©M$(9F\Ä\ï\ëH¨®N‰¶1•aÍž¹¨d—8‹\ä\0aEFóºÀ»\æµi¢‘,#e\n\Û»Y	ó9t4U¬ò±#eGZŽ^b\0{T\Ë)›ƒ\Ê\Û\Z^\Í\íJ4\Æ`£G!\rœ®\àPR9!l*h1…X\×¡`‘j0T\ÂnŽ.9½…O” \ZƒP|\Î\0­c`Xj‰£\\o\í\Ô%\å‘7\Ç0\ÎEAy³r\ÈÁ\ï[j(\ß\r\rÛ ¨b’P¼®\Û\ÕDE:T²ˆ\Î\å©_\r\ÈA@x 0\å÷©\â\ç;v÷¤iTa¢I%Us\Í\ç~5t´\Ö4~\Ó>\Þ?šV]‹·rOST\è\Ö5pNI\ÕoŽ­¥i™‹1Œö¨œ¥£HcŽI¤Îƒ7ðî©˜’\æ7==*™®\éö:\ÜÚ„\Ï0Žû\ÒM\'KŠ}82ýj\'´¸·|E3ô\ÎE$\Ù!h\ÓRÓ \Î\nrw®j¥{jð\ÊIRÜ¹\Ç\åúW+}R\Òi%µi¦U\ã§ZŽò\Î;ûv…H—\0ú\Ð\×F<\Î.™\æfñ”¶Š}—@9HÁÁZ\è<\êA\ëœUNKŠE`¿8\ÉŒ:Š°ðÔ†)}³ŸÎ¯4”££?Œötûc¥ºÒ2p\Ñ(É¦Ñ·0J\á=£I\"\ç^ÆžÙ²p3M\ãU;D\Ål\ä€j’3‘B\Ö4½J\å¼;u\0¼j»«p5\ì\Ñ~\Öfc\Ø°ü+²\Ëj9psK®¬œd†9­¡ö»2’rTq\æû?ñ4¿†¸·r\ÝU\Ã)=ÿ\0ÒÑ¾Ì¼\Ñ5\Ò\\]@¬0€\æö>\Õ\Õ\îVõQ› æ’\ãV;s0J\Ùy\rz9Ÿ‹\ìb—w\ÐY¥¼\"\Þ\Â@ùˆ°ª\í­®Zh™\î\î\Üå¦—r~ž‚†š™›3J\Ç\Û4v“a‡W+\ßl\Öys\Î}šbññ\â\éôˆ^O\Ú\Ì|Í¹ö§1Dnµ\rª,Q¨\ïŠ$° `oRº4]› \ný(\Ñq\á¸Ê¸Á¨ ‹›\Ìz\Ññ \å›)+)\ÜC¥Œä¯™r:P\Z-œ1\Ý!eÁ\æ«öµd\'³\n2Wg\Ç\èj°¶\Þ\ÜÀ\â“tÉ­Q\Ø8.ÿ\0Ç²\äc˜Qô\Å:Ö­-/t‹›;¸RH\'’Ea±bªŸe\íÓ®\ä¸9\Ô/\åRý£ñ\"h\Ú,\Îv‘\ã\"\îI\ï^\ïŽ\×ÒŒ¥£Áò \Þg£\â¾$\à\Ø\×Wº‚\È\åb\Ð{¨b2\ÒxV\Þ\Ú5ñ3ž§i‚\Ù\Þv‘\Î]Ø“õ&˜­‘\\W…—4¦\Ý=\î?§[[XG d7\"ÝŒk´²)¯rÙ«Ÿ\èVz¦¥7\Ç!x\â…\Î$÷ª\Ç\Úüð\Øý¥\Åœ*‘\Û[\"ò¨À\ëš\Û\Ãñy\Í9\Þo•\Â1\ì\í§x?`™ó,+œÕŒ \Ú`\ïJø\Ò\ê\ãIµº{£%´);SÇŽ‹¯!N\íŠ\ë’\Û<\èôD­\ÌAGòƒ\éD¥²c8£`\Ña-‘2ªŽ»\Ôr\Çoo(R\n)\è\ç£QLv\"óÅ•89\Î\ÃzÀ‡#˜w\ïÞX¡‘³ÂŸ`k\ß\n¬\ì|eA4P¬H#‘—\×<±òFÀ7M5Š\'B\Ï\È;2\ÔrE\Æ]?¼\r10\\a‘[i•ù”v\"XX\Æb$úƒPJ’G&yOCP\ÆnY\Ó\ÜT\ÙÁ\ë½dÀHC2(\ÇD$1ô\ÅZbdg\0c85˜\æ‘—\'õ£‡VÎ²\Ã P?}1‰\í½hÒœœ\ì=Ej`\ät­”F\ã â˜y\Î2	5ƒ\"ž¤\æ¼\0¬”‰‡3RTy‰µwl‘R~\Ë8\ÏÒ¢•œ\0\Ç4€\ÂOO—¿­©]¢\Ø\\6:FO\éS,*\ã94&£i\ã\Ú\Ínp¡ô \nsþ\Ì\èð\äfk qø\æº,…ô\Çz\ç÷¶Üº–ƒ¦«)XØ“ø\n½\Ç\\ \Ól;”þõjÜ€ü\àV¤&w5£F‡ªµ £\ÌPgÎ·fY\ârAÀò\È:\çQIjŽ6\Ûð¨d`ˆ¿1\n£&…Y™m\Þa”ü¬:\ZN7öw\ÒM\Æ9\\t>\Äw®/qöð¼=ö‡u£j0ü^†Ç•\ÊüÐ·÷‡µvNž\ÛTÒ†©¥\ß%ýŒÇš9\ä¨ô>•i™µE‚),õS\È\ám/Oo¹\'\ÓÒ€½´–\ÖS\ÈU‡Oô5ˆ®»\î(»mM\Ò1m¨Fn­û7\ßO§¨ª›P³†ôaÀÀ•G˜}}i;\Ûjš$\âò\Òv@:OCþaW+\Ý,4kye7n~òõ\ÄP$\'—lõ\È?QLi\ÜY¦j\Ñ-Ÿ[$R‘…ºO—ñô¨µ\Þ‘_i’üD?2Kó/\åKµ\Þë™­¹m\å=Q¿³s\í\éA\éZ®·\Ã7^:.|\Öò\îŒ=¿Ò„Àu¤qŽ±¥¯\ÂkYY),?h£øÓ¡¥ð\ïÀ\Ó\èW‰ýZØƒ\èGZ†\ËS\á¾+\rÊ®›©ˆmƒcÞ‘ñ\n_\éW\æ2»¤ð’(_€\Õt\rSD¼ñ\ÐMg*Ÿ,\ÑƒøŠm¤ý \ê¨-x†\Éun†hÀ\çÔŽ†±¤q\Ýý’>\"µ\Z…¯C*¨\ç\Üw¦\ÒðöÄ¶\ÍyÃ—Ñ«‘“vÐŽ¢žŸbþ…x¦#q¡^¤3\ÌYÁ\ÝzŠ§ñ/\ê6Z{Rñƒ´±\î(ms‡õ-\Z\èI$3ZÊ§+4DŒý¦º\Ú·¦¢Ã«\Ûÿ\0YZt/Œ8Æ‹kòƒB½ˆø›‡Ê­¥é¹·û0üQW<\áu×ˆ¬~s·;Œ¦}˜n(˜ \àþ1ŒË¦\\­µ\Ù1ã•÷Sü*³Äœ¨Ø†2[˜?\æ \Ï\æ(¤ú\ÑÆ‘ƒ nÆ¦l0v¤úv ²ÆƒHØŠl’®3šó³\Û\ÉFD›\r\Åzy\â<\Ûb²n#Šs\ÎÁAõ©.™p_=­IqûZtšM\È÷¨|:\äg9©§‘”01ñBD\ï¹wUÏµ#¥[VŒ+º°\0g\0š\ß¤\ä\Óˆ\"û\ç;ššK…—Ž”“¯\à\ÒI9.y˜¨8[Ã¸pr\Ûæ¦f2\ï€IÚƒSûVdOSC4‚C+’K\ÆGBµ¬R\É=hwñ\Ë\'6qŒTñAû@\îvª}”©Ga²\Î^\ÕGB\r\n»\ÌÕº\Ò`t&¶šLsmž”\ØF–Œ \È~õ<*\Ä\áÚ Y9vA×­Lƒ—˜\Ð3n`	Û­C­\Ä×–\\¬|d{â§ˆ\å(­ùs±9nÔ¥@¥\ÅØ‹BQ›r£¬mU»ùg»‘¢F`\ÛU\ÊkqivÓ¨\Äù%\Ý=)¾ÓŽŸ|²\ã01\È#¥BVTšnþJõ¿4R«\ä\ç$v¦\Ü-h·RÝ¢\Ì9\àaž Õ‡P!¬9m£œc#½W4«9´­O\ãY‚õ\È\ÏQ[J¤rÞ¬:ûM!Ÿ<\ÄH§Ñ‡Z\Zoa\".¥:·\Ô!º˜\ÆH ô5›ˆo\Ó \Ö\rº¡\Å+\Øn•9TQ©Ýµ\È=I[€\á@}´¤6ûmY–öY\í\å\É\ëL­¥­V,\åÃ–.H=½)œ7 oõ«LÍ¢Â®¤g8­%{õ4¯\âJ\ØÖ¯x@\ëU\È\\BfIPi]\ä;ŒQB\á™kPŸ7Z\\Ø¸!R\ÚmÀ4\Ò\Ò\Ýc\ÆzŠž8\Ô.\àf½,SÞ\èôÓ¢.w\Ûj\Ö\Ú~g·Ò“\ÝN\Ò\\\Çz±i6ñˆ×˜ƒT‘A¶’\äqM\"tz{\Ò\ÖDŒsâ†–ü&AmÇ­_ ,v—‰2c}˜UoV·6—òÛ“’‡c\ê:ƒùT\Öc\Änô~µ<Wq\Ù\Ü!@†}\È\Ü\ÈÐ¶‰“¦]>\Î\áÎ–$•‚\Ã\ÎYÉ¡þ\Ð8fß‰\ï ’=J8Œk\Èã”¶W±õ6‰:\Úð\Ä0²d°õ\Í(š\Úx%ñl¥lžFcµyÿ\0©ù\Ù$\ã:\âp\â\Ê~\Ø_f\ZlLõ…Ë·´`\n$ýœ\Ú:\á/eT\ãN¿ÕŠ„t¶_r\Ä\Óx¥½ ¹‰\Ëxrò¼¥ý\çZ\ÊTô¾\Ôt»¦–\Ö\æ9c|dc#¥|÷ö\Çg\Ä6\\yuw©XMk²’§•€C_\\Es2‘ÿ\0\Úÿ\0@¯j\ÖzV½`l5\Û;]NØœòKC\ê=\ë\Ôý?õya\É\Ë.ýžN/ª¨\æa\Úö©©pBX´j\Æ)\â¶)ý\Ý\×Z\Ü\ÉºøhNQŠd\Zi\ÂücÁ\âú^gk+–ð\îs\àŸc\éE\Ý\\ŽvÁøWÓ¬\ÐÎ¾¤™\Ã8.2!\ÕU\Ç\Ä\Û\Â\Äºq½i\Äs	3-”O‘¶[ zŒP—ö.¸š%fN„c4\ÜÇ¹€ûŠ92©.u9žñ\î-@¬j6¡^\î\àu¸*N\Ì>µ$\èA\ÇJ\ÒA“\È\ÊG7sG+ƒ-/n<%…neeƒQia§nOCÖ””hŸ*\ÃnÂ¦Žr\è9\ÅK¿CA\ê\Òrs$¤\Óz\Ê\É1a\Ìy\È\ë½	U$*\ç;œQ\Ç!“™X®GJ[¬2DI˜\ïGøž oJB¼\ç!Žý†i†‘\'3a…3U`˜ü\Õ\"£\Ûñ D3Z‰\à\ÓÞµ Õ£\\ò°µh‡\Ý­™‰9ÀÚ²	 “Þ˜r?@Ei\áI¾*/†\çU\Í X’Jºd\Ôb/ƒ•£7\ë^*:Œ\Ñ@\Ö\ìÄœúÖ­n6õ¢Yù15ˆ§9$gmûTŒV4Kw\ÖQ$ø±‚\0\Î\Û\Ó ~†¤ä“—œ\î;7©Û—”€~”HûW\â«\Þ\áYu«[TºðHçŽ2+i?\Ò}D\å5M\Ö>\Í‚k\è^\'\áý+‰tYôU<[i\×½+‰q—ôz\á\r\'K¸Õ¬¯®\Ó\ÂR\â7`\ËôÞ…BišŸ\é)§Me¤NeVVMƒ­G}ööº–ƒxŸ\Õ/nþùÁ\ÅqmCO´ILv\Ë\È¦\Ô\ÄJ¶&\Þ2FOš© E_Qº’\îþ{©²\Ï+–$õÞ®_eiüAöª‰lei\ì$a\ã\Ú9\Ê8õ†ª—vRs\â5-ôÞ´M7Qo–\Êf\Ñ\r¤û>ó\à.0\áþ?\Ò£ \\*\Ü{78t=ö§!¹H Ž£Ò¾\ámW‰8[V‹T\Ò\rÕ¥\ÌG!”±\Å}öQö“i\Çz4CW‰t\í\\yôIMRd5E\Î\Úk›)¼k99ü\È~VúŠcX\êÄ¬x´½\ï+ûƒK\çŠH$ð\åR\èiVª÷	,~A\ã\Î\älTúŠ¡\rnm¥‚SÑ•a\Ô\Zx£š\â1<]•º¯\Ðö£,µra[}^6žafÎŸ_Z\ÞòÏ–1qm\"\Ïn\ÝGS\Ð]U¥´-s\Zœ•;HŸÎ‹\á\Þ4\Õtð\×cú\Æ\ÄlROG±\ïMðA	V\ë@jzmµ\îZEðfÿ\0œƒcþaüh\ì\ËcÃ¼W¸\ÑnRž­lA÷S\Õ4-KD¾ñ\â3Y\Ü)\Ê\ËÀ4¦ö\Æ÷L»Yù¤Á\Ìw0\â*×¡} 2Ä¶Ql·6\ç\Ê.rG\Ô*w]>‘öƒ4Q‹)±[¨N\ß\Zd\ãüKü©…\ï\nhú\í±¿\á›ø\ÆwðÁ\Êþ#¨¬j)§\êö†ÿ\0‡î£ž&\ä\æ\Èú{U*]?UÐ¯\Ì\ÖR\Ïcp§|l\Ôw¡/€þH5®\Ôt»®kˆd·•ND‘\íùMô´ Ñ‚Á¨ \Õ-Ä¶\Ò(ú÷üiÎö‡ñ?‹lW”\íñ¹Sõ¿\n7S\à\Ý?Tµøþ»Šh\Ød(lÀö¢\Ó\ì?ƒä”¼Da8ûÆžZ\ê	5§(òÉŠ®\0\å\Ü}k7)\ÌjSÖ¼ˆÉŸ[—d‚\æ;c‚½\ÍL—>\å#ò¡&¸\n	$Öˆ¡Px†=»\Ð\ßÀ(¦©„\Ý^J\Å2Àg­inr\åXûšy\Â`\"\å\êk4\×-±8\î{\nI¶\ÊqJ:\Ð\Ê3\Z;/6Iô¨ž\âW¸ªE@\îŠ\á|Aùša²dº—9qÖ¦y#r9òeŒÈ™-„ó´\à(\íC\ÝÀ\Ö\é\Ïñ¨lmR\\´K*^e#ƒ’Ò‹¼»\ç„F±P0\Ç;7\á\\\ë\ÈnT¶q\âòùN“¿À$w%\íÔ´´TöH\Î\Ç\'$\Ô0 ¸º\åŽ3\ÊN\Ë\èiœ(–\îUÁ6\Åu§g{j:DsDa@\Ù\ÃgaQH\îø2\ã -\Ã	Ð¿6N\0<c(w†ÊVÈ®®š\Ý9£ð\Ô\ãaµK¤1¸9•ú®A\Æ\Ä\ÕŠ\Ú\Þ0²Kw$,¿,`y^µ\Ñoµm\"š@\ÙBGoJj*\Ó}<š\Êâ“²\ß\Z¸B\å\n\ãz\Ý@››\'Ò¶[\Ëû\ÛL^ÌŒI„\\\nŒuù«Ÿûz:a\'\Çdl$%€`\Û?x:–\áLRD÷V¹\Ø\r\Þ?o¥L±•o9\ÉôOÁ\Î¸¶>\Ý}›\ëQÄ©eK±M¤z*O\áE{tœxdtþT\Ú\ï‡4›ˆwñ•rI©ô\ÍCNºœGqq]&\Ç#¯\ÓÖ¬*bdÀv\ëF\Ð=\î\'?›…-­dñ-\îd\æ]\ÆNÆ²ñø‘m™z\Õ\Â\î\Ý³\0ú\Õ^ü\Ç\r\Ë2GC½g.\ÉØµ|­\Í\Ç\åC—BEO:\æ³f–€bŠmºÒ•\È\Ïq\éD#•Ð…COˆ\ÈÁúW„¿OÊ€\ÇÒ¥V\ÏCC\nI\\\íµœ\ï\ÓÖ–\Ä\Û\íFBý7¦\è8>\Ù\Ïnô-\ãžSŠÙ˜\Z\ÖHò¤\n	biI„ø t4\î\ÃRŒB¬\Î\0¨Z\ÍZ#\Ì\Í ¼\Ñ.Õˆµ½dC÷H\Î>•iR3Nž\Ë§Ä–6p³\Ï:\0=MT_ŠÆ¡zc¶†f`J\ã5”\á\å\âC3úµ6³\Ó\í\áÁH\Ô0ö§_\"”‘>‹msr¦Y\Ã^€õ9§Ö¶ìˆ±eˆ\ï’Oz\ÓEŒ˜@À\ÇJ/‰\îcÒ¸sR\ÔIÁ´³’_\Ä!\Ç\ëŠ\Ñ+\è\ÂR¤ì²›¸®líœ\Ë$|™§cÚµYd©ªO\Ù=ä‡‚´©²^lú\Õ\Å\ÝI\Ê\×\ÎyNò\Ëù0‡A¶÷zô\Î\ÞS\"yIÞ\\9ø]¶¢´KÌŽC\\3Fˆ±Z\Ä\Ç-\0\êMm5\ÒBüŠÀžô‡S¾—\â!‚9\n(mÀ\ï[<ø>+d‘°µ‘T\ÙbMR;fUv#\Äò\àP7Ž‚\è „·6\êW|RY§g	9=ri\Ü\\\ÓÚ£\ÆÁ]v&½\Ñü‡\ßM½3ðûl\"\0\Z`Ê¿\æ¬†C#Œ‘“A?\Ù\Ì2s¾ZÙ¦d`ˆ¬P\ãÚ¾°\â<\É`s#\0[¡ô­R\Î\Î\ég\Ï\ÊG\Î:/µ`Bž!\Æ\ê¤\ä0­\ÒmˆÂ·\ÊOj(¿¨¢’\ì/Ä…N]ýMz\çFky9bW(1»w£a9\\£d‚2Tæ‹¹’N@²\r›\ï³l?\nªL,R\ÚR¢—b\ã#nZõ¥„L\çC§µ5¹Th\ÕU\ÙWf\èIž\Æ\Ú?2¨$õ=MBÀ®\Ñb€\èþâ±¦JZ\çÚ§š[IcÎ§#\ËÖ†yL7QJ7ŒžS·­M+À\ì¬@\Çj†8\ØV#‘;Vù:â¬“\n3\ë\Ù\nw?Jc<\ç=;VÊ²s2Œb˜\É\ïRd‘C¯2?)÷©<@[\0@‘\Õs‘“X·\\V\ÇµjHùyNô\ÄÜ¬2\ÄþƒR\Þb	\èj`õ\ß\ëYUN\n–€\Ù@ðÀSŒV¦!\Í\Í\ÍøV£¶S>n»\Ö\ÈÈ»g,6Þ“³xj¥™ºJ\æmZô#†%¶„¿4‡—8®•+7P7®=ý \Ú8à³…)bI\Å*w¡Ú£€\Þ\Â„‘B\Û\é\Ï{r°F:÷¦W\Ù.yE[¸#JŠM\íÀ\Üô´3= ð…¬*\ÒF\Î\ä‘L.t¸\àRöÊ »Š2\êý\Ãa«O‰\Ð0\ê*\Ñ¯^¤sFÙCˆ\ÇZyöurÁ<J0Cgm±K5TX\ä¨Àn¿ZmölB\ëF1‡Ç½ZÎ£\Ã\\ZmU4\Ýx4Ö¿*M÷£§—w\";\ÔX±qi(\Ìs§Cõ÷ª>£jEA¡\ë×º\Ç.<{B|ð¾\ã\ê=*,·¤(z\ÖÖ“\Üiò™mrŸž&ù\ZµÒ§³\Õ\ì~;J”H˜óÅŸ:¥g©Á\íTˆ\ZD¶Z²—±>\Ð{g=ý©tÑ´NRDda\Ô\Z\Z\â$\Ú`ÌŽ›†S¸¢¬8†\Öõ¶®CvK´ƒþ!LD£•*º7\ÍŒ©¤z†„²’úw•»\Û9\ëþSü*\×}§Kl¢T+,\rºÈ‡ Š^\è¯Zc)\Úuö¡¡^´ºuÄ¶S¡óÀÿ\0+~}\Ñø\ÛD\×\ã]?ˆ\íR\Î\è\ì$û„ûÔ«Pµ·¾ŒE”’e\ÚDü{­Uõ\æ\Î\"ª\ßY\ÍA\æ_¨\íCAeßˆø*E‰®t\æ[»f\ßrñªu£j\Ú\á¸Ò®¥¶4g\åo¨¬p\Ï\ë:cpn¬óæ·”\ç\ÛÒ¯\Ö:§ñ¤a‹G£l\ÙýÆ‹ù\n>A†c——\Ü\íEDaˆc›œã  <g”\ä±a\éR0ul±„w¯^\ß\ÈSN\Ò\ÊBjôq\ÈFFÀw4,n«ŸsR;;¿&Kg ©“üÈ‘ø\Ã,_>”\\\Ä5¯$•q¾*(¡U\0\ÈÀtš\Ý\'HÕ£qõ\ëM\"&\ÅÌ¾%‘\Â\ß,*xu©¯Q¥v&¨\ÛñšX\èê–­8“‘A\ÆqšA«Y^i²\É°Œg—9ù…cŸ”y4y¨55öö†úf©\rÀvøl”\ÎpH¢­õY­—Ÿ™#V j®šœ~!Tp¨©Œ½q©G$K\'0 Ž\ÇÖ¹±\á•\Ú<¬y\å\rÇ´t›fH\â´Fµ!˜ºJ\ÄscÒ¤ºÅ‰¤\æ\æ$\ç+¾k\é\ÒÏ«^G3\Ú\Â\n(U\å \ß\ëV­:w¶7ŒH”§cS(8O—‹Êœr}F\ìcio\â!iIT-\ÛÒ†Ô“Á¶y,X€®k-tò•E\È~\éÀÇ¥E¨´V\Ë\âJyS¹=«||\ç.i\ë\àö1\ä–kš•/\r\å¬zŒP\Ç~O0\æ\Þô«&•¦\éöšl@\Ê¨\Øc$\Z¨\ÜjQÏ©ˆ\ÑÐ³\0NÀúÕ†#†ë™¦p¡€üi\çR\Õ3Ïœ\å9rº\Û2T³r“\Ô¨›ownÇ¥yb³,SGr¬\0ó\ãzõ2«!•(!P~9\ï[bœ^“³ª>LR«±å°†y‰\å\ëF4Ê­\Ë\ØR®¼kˆÍ±•Š\ä÷÷¦\\€6Fs]z³\å\ç\×B%Ò…\ë%\ÔR˜,ù—bI\Ø~ú°\'\nqN—\Â\Ñj“\ê6³+D®ƒ•ƒM‘7ôñV_³¾³\Öõ/\ëJTø)H…\Ê\ä\ïò¯§Bs\éKþ\Ûx\æ\Ê-i­¤¶fM>5™REN7 9 ôg\Ë\Øsf»qx\Êq¹˜?*x¥Pg&Ö¸\ÛPŽim<IbI\Û\Ø\Õz\Ç_¾þ²ç»“š<§wÞªË¬\Íq©Hu\0±Â·lSA‚9”‚¦¸rb\á#\Ó\Åä¼‘¶ö_-\åWÁ¨£\Ñûdc½U4[\ÐÑ„vó/\ê*Á\êS®yÂŽ¨O’\Z#‚7\ë[‚6\Å¹#\"‰9p\0¬\Í(˜8NjxŸ;Pe°3Ú¼²…\ß$\Z\0kwTG`M(ŽpGZ.Ári‰Œ¼Q\Ìœ\Ô\Ñm‰¥‰!\æÈ¢\Ä\Ø\íA,e•ðùsŒw¨%Pz\ÐMrsÖ·Ä¦I(IªLÉ“nsÒ´‘ …ðó\"û\Õ_ˆ¸\Î8\Ø\Ãf@û¼\Ù\Æÿ\0Z«O«\ÉrI3’\äíƒ“N›5Ç…\É\ì\ë\r­\Ø\éq„NYyŽ[Ú«ÿ\0o:ü)öKwsfü¿\Ö+@]Û™¿E4‚\ÏJ\Ö5;i>>DU’l€\ÞÂ©Ÿnº„–ú^…\ÃO02F¯yr@\Í\åAù?tâ‹´qù\ÑX\Õ¿®m.¸oD’Äƒ	´Eõ\0f­d\ì\0\í_<ÿ\0Fmzs}s¡M1h\Ô	 S÷w\Ãb¾ƒß·zù¿;Å™Åœø\ä¥—\Þ\ß-„†ª4ÅŒRöf=ˆ¯7–\Ú7KG£¸kŽ \ä\áA4\Ý\ÒE›,|¸ÀN·\Ô\ÒÇ‰_\Æù\\€\r]¹ÄŠnmX\ÛE\É\È\Ã\ÄÏ½<\Ñ&(Û«\Z®\Ü8YN\r2°—”©\Î(S”$¦»@£\Ê-bO˜>yÁ¢a`ŒŸz\Änò[øˆ€ºõ\Ï\ÞªN.‘\åU\r³c¡¯¼ðüˆù”\Ñ\å\ä	Q²™œfVn .1[:F¡UO2‚¬h»‹`\é\Ì\×p3\åŸž\Ñ\ÙX>$\'#\æ8®º ˜Ú€À¬m\è\0\ï^Ž%D!\çñpÁ·¢\Ñ.%VP\ê9{¿jò\Æ\ÆÙ®$Eò©^b6>ôÐ\ØøQò\È\è\àv¨Y\ÄoûO9	\nGQI\Û[¸ŒH\'\Óda\ÑdŒ\íŸZ\Ê\êi ý³0*¹R\Ä.¥+@‘±+ªªq\ÊMi­«½ƒ`2•\ÜcÖŽV³––i\ãW;ª\ê¸I#’\'`X7.†O¥\Ìnl¡™[$¨\æÞŽ\Î\Ùú\Õ.\ßL|¶©5\Ä[–j±¦\r¸U>.q»3œš´&6L\í“Y\É\Æ)G ¬“\'¦Ô¨pÃ‘\Ü l÷­‘˜\îMûR6¸qX®\äÍŸr)ˆ;ž@\ÝA¯f\ïƒ@ó^3%Œ¥bYõþTŠOÒ€w$VC+l7õ¼^]…ó[†>€Ö­¨N®\à\ÏþHcU`A¥ka¹˜\0I \ßTœxHŸQYK\Ëw\É^qõZLp\n\ë†HÕ›]‚;G&»J\Þ\ÂG(`\nù\Û\íšðMÅ·X!‚.°}[HMÞ¥ \ä\ß\éW\é\Ý … Œòª\r\ê£Á	o\Þ\á†\È?Zs«]v\ß¬Œ7H|6ü\ê¨\æn \Ò]6þ\ÊK‘Ä’D	Àp2÷«d°1³hÜ«VzŠ\Ø4(¾QqhÀc dW¾\Ï\çð¸†5=\Æ+tPµ*\Ò%øN(„nz·\Ñg»PFqÚ\ê«µ>YD©\È\É—_G\×jÉ›\"•©kÚ¿\ÞÇ«i32o\ÚGŸ+B+®}Ÿq¾…Ç¶A­],õdµ¶cŒŸQ\\«Œl\ÅÆ™*•\ìk\Ãs£j‰y§\ÜIoqe]¦™.\'\Ú7(\ÑŽe\å#b\r$»¶[^{«Xƒ\ç\æOZ§}œý«iü_aƒ\Å-ž©\Ê p²z¹ŸG‘m¯\ä.û9:«Š«\"‚øwW¼¶ŒµºóÛ“ûKi:~”ù!²Õ¢iô·\å™´¶s†S\íIm–>^xñ†\ßj\Ë\Â\ÂUžhfO–D8\"˜^,ð’¾\ãf­i1ý¬E‘º¨\ïM-õk{\Î[]mD\é•¿\Í\éZ\ß\é\ÓÙ°%CFwW]ÁÀ­\êZ5•Ó™acu\ê?²sÿ\0ú\ÕkP±–\ÖnKÈž	†\é*÷> Š¾²†\" –%hŒ2Æ·±¿oòž\Ôò\\we‰H\Ð #ñ­”K3\ì\ïPA40¿4G\Äo~”B\É,ˆ\ì=y)T\ßÀd$l;o@*vf\0ryTú\nŠ8	!‚m¾jS*\"b%\Î:±¡‚vebu^`ÁFz±­Ä¥ˆý£^•g|\0[m\êkxq#n|\r\ÂôZ[ddu“±\Õõ+B\ã\Ã`K.6ü)F®d\ÔmšF”³7˜•\ßj²A¼P†C¸\ÙÕ‡\éA\ÜLöP\Émª\\cê˜¬%ä¶©n\\ñv\ëG9{Y£ºð\ÙY\r‰-M´\Û(e™¡k…´™C \ß?Z=Æ¡snl¥±µ1¹\çi[f\Èô4Ÿˆa¸’Ž&Š®Ñ¤d°Z—9½\'G™’\åj‡zt¶z\\1£¼.Jò¾cõ¨£º+xa,ªe@Fv¤œ1lJHŒ\à0X|ß?}\Zy­\Å\ÌR¦#\0*»a‰®yb©TÙ›À\ÓRaºN\Â\æ9\"nP\à£\çp}ªMnB–R1ŒL:#­6Ó¡X-\Ç\Æ g\È\æ\0\äf\ã$²k6\\\ÄK)PŠHö­\ÖHÁ\ÑØ¼˜ÁT=ˆôM\n\åÄ·W6\é\0U5;u\ïNnaž»H$¹³\Í ;S[Kµ¹\Ó\Â\ÍoF5Ilsz\Zý$šXZX¹™d‰:XG4¥6¦º9”øÛš\Ù%Öžò^Z¼’‘`–ÿ\0*›5ö¡§­å´ªYn$+N\êIû¦¯sIƒÀH–$O7SÌž\Ç4‡tH¯ui\î/N!”˜T.z\ëÁ.o’Z+”¦\íheÀ-s.˜^kŸU¹T\ßZ¹\ér\êzŒ6Q«#\0\ìƒtL\à¶ô¯J\Ó\ì´\Ø\Ê[C\á¨$‘õ\ë]Am3‡xuõ\ë\È\åñä‹žFE\Ë*ý\Ø\ÇøŽ\Þ^¹5\éxØœå¾‘s—Ó‡äµ½\'†´‘\Ã66ˆ\Ú0\Z;x\Ï3\' \ìZC\åú“Ú¾K\ã\Î6\Ôø‹ˆ\áÓ¯\í¡¶[2ñ„@¤\ç¶H\ÏA€qN>\Þx\îÿ\0RÔ¤´Žh„¦Q,òÁ\'8>TWûu9\'z\åš=Îº²»l31õ\'ÿ\0z\ï”ö¢Žx\Ç\Û-\n.Ub)\Ì\ÌqŒw¨oR\ãL¸ð­.YÂ2¶\ëŸjwg‹x^\ç\ï\0U=­,’&\æ,Û“\ßøÓ–5%L¥7£K-x\Ç ø„0¸û\Ãu5r\Ò5˜®T4R)\ÇPqTû»8\ÒŽ€\ÊÃ™¿\Â;\nY\nMgt\'³vG \è}«—/ˆš\Ñ×‡Ì”^\ÎÁmx\n\ã˜(\è\î\0kŸ\é\Z\ê\È\Â)e8do\áV;[ðË±Þ¼\É\âqt\Ïcx\ÍZ,K0#\ÍcŸ½-†\à6ù\íR¤\ß\â5“‰Ð¤†).01DG/AŸÂ–A\0\êXeö\Å*ch\å\ê:\Ü\Ü¹À;œš[¨ lz\ÔS\Ì_$0\Å:1“\'\ÕuieÜU1}¬ks2D\"\æ\0—< ~\âB9a\Ì\Îõ™u@Šˆôûµx\ÜSû‚.›\éœ\Ó+^\Üx˜9\å­vœ?¤iÉ˜\í\á\æQ	ÉªZ\ëò†‘9ö™\Ù_\ê7Œ#Ž.@F9›µo\Ê>‘Ö¼…û‹\Êjð¬ey—žŠ:“_.qý\äœE\Æ:Ž®íˆ¦—\îÆ£•G\ä\æk¬}©j‹\Ã|ê²³_\êlm£=9\Ã>õ\Âd¹šRÂº°«V\Ï\ÏÎ²N£\Ò-¿c—GOûJÒŒd”•\Ì/ô\"¾·‰³}+\ãß³7\Ñe—E\Úøšû$ ò‘^\ëQ¬‘f^;\Ó‡\Í>\Ô\r\ÙÄ”nžÁ\ÃG\Üt¡u$(N\Û\×\Ì\ÉÔ™ÜŠÆ·¦›«¦`Fù\ßF\×Å•ñ\ä‘\Ê\Ç\ïS;³–#0ñ\Ü\ÕT\ãK-\ÌnJ°l‚(ýÌ«ù,	/\Ä\Íû6\È\êO¥7ŽD@¤—\ï•Ç®¸ò]\Zòm=\ìI¢ n\ØS\ïU\ÍcµýF\é{£*Àˆ¢\Ø¯­v\áð2e\Û\Ò*1t}Ee$\å€ûs0\Øf„|k		\"ž\ØÞª\ÄÍ©pÅ­\Ða\æ_ˆ\ëVøõH\Õg\Z¾Û“\Ô\nú\ß\Å\Ç\ãc\ã\Ê\Í)J[!žnm\ÆDdù|\ÕnmÁð\"\ØX„‰…*™¡^\ê£‡twÞº™I<\Ò¾!ÕŽôc›ö´x’f17\â«ó¥¬“…‹¿.v8&›\é÷oj±\ÆÄ¨\Û##4\Ó\ãŽ\Ö;5·\ä+*Ž’wúú\Ò[ý&	\åH£~\æD\Ý\ê±\ÜI\ÉvK\Ë\ä”&\Ã\ÔP+©…·e.…‰#$vúP\Ú…óGoopª\Å_x\r¨‰$ˆa•<§½Aw\Êà¬‘’w$\Õ‘Ü ¬9G\\\nÍ´33Fq\r\Ë+*FÛ”l\Z{3E\æ*F\ÄõªÑ•…Â©\Ã;ƒÒž\Èß•yp:\n¨\ÈMJK1‘Zƒ\ÊXr‚OC\éZ\Ë\'1_`z\Ô-p\êÜ®ªsUaAjþUPÁMaZc\'#`ƒÐŠ_,ÇœaÉ©\àœ!\n\áõ\Í	…\ÄÀ\ÈÑ‡´J\0cƒC3\Â3\ÍH$‡=yi’LÙ’C\Ê@\ÆqŽnVíŠ•]0\nsÞ´`¤•?0\"U‘r²rºú‘R4jH<ü¤vƒ\äL±¨Ë‚Á™@\ÇBi’\æ4;*œœ\×\Êi“\Ë\Å7Ç¬~!¯¨5{³™s\"¿(O\é_%q=Ç¨\\IÍ’\ÒúÐ„ú,<\"<Iˆ\Ã9¥Ú¼\ä³\0O½3°ýŽ…t\Ê\ä\ÒVF(HÀ$\Õ$½–Fcƒ\Ëô5\Ð>\ÍõY/4æ°ºr\Ï\ÈOR¦¨M	$g9¦\Ü!{ð\\CgO)¨öYw¹_Iö5Z×žHocž1¸\Üz´k\ä%\È?\Þª¿+2£[Ç£¦Z´_´Cp\ÞI`št\ÜKcrŸ²Iú\×\r\Õb&Pzv¤\Æ\ïQ´›{‡\è	\Íd\â\ÍŽû¨ß¬ö’.AWÖ¥OŠ”°Æ´\ã\ÍF\Ù<+¨D‰Ðpi}\ïYI+J#l¶\ä\Z•eZ,\\5e­¨\ÅŠÉò»]Ë‡8šM\Þ-Šd{\í-°#œ\ï$>\äúWû&\Õ,/uö‰G#ò\åk¡ñ\Ã0NF\\u\Ï<®2£HÁIú\Ö\Ú§Ew§\Ü-å‹®RT\ßÞ¶=+\æ\ÎûG\Õøð‘®´·o\ÛZ¹\È\Çr=\ë\èŽ×´3\ÒVá»´“#2Û“\æŒý+«Ô•˜J<]K\ZH…]C\Ø\Ö\Ú~¡{¥)‰W\â\ì\Í\Ô„ÿ\0\n\Æ\ã \Æ\ÄzV:Ö„ŒÅ­¦¥nnô‰yÀù\ámÒ–ÈŒ¬UR:‚(H®\ê\ÎV·¸^Ž½ý¨§ºž¨V\×UE³¾;$£ä’•ñ2B#™ˆOnô\ÚÝ‡\"¬@žnô³•§E\åO«\Z>\Ù\ã„\0§\Ä*;t¯,úv\ì=-\Î\ä³\îk±E\Þv=‡AZ\Év÷\Îw\0\0aT`x‡ƒ½\r•vjÒ¼ŒL\nœx¢²ò\äüÀž\Ô!o\á_\Þh¸\"Ì‡—\ë\Ô\Ñ\ÆÉ›RM\Ïr	\ån¤¦¢¹h¥‰ró6\æµy¯^ø¨\ÑU¥ûmÞ³É‰K³—\'	\Ç\î5I?‡#a#\\¢–\ÆiýŽ—ssi5Å H°\âCóm\ÛÖ—\Û\ßsÙ¢¬0´‰¹c\Ê;SNmõ´rÖ–ö¼€\à¶ûc¾\ÕÁžSºHñ¼‰K“Q\èS\á\é\Þ\Ê	ôÈ\Ý:’\ê\0ýiu¿\Å\éõ¨Dn¤JŒy‚\íVIõŸõm\í\æ¯&\Ç=¨X\Û\\Y=¶©k\Þf¿Z\Ég”ª,\äYuÅ‘ZjwW1Á\Ç1|‚\ÝRœjP\Ã\Ë7‰\Z`\å›|\Ò9dÒ’io@E;Ö¿,±\0øªLžƒ½J_/”icu¥Ô#.ŠB¨=r}\è»wª’\Ê\èC vó7¦*¿²5¬®²†\çƒcó.™*Az\Ó2« ó\È9‚\ã\ÐWDñ¹G\íf’v¬¼¬-§K²&œ¤\æ•\év\×:}\Ðfd	º°ýÔ³W\Ôf€#[\É\Íže$\ãjÆ•u{s}oFe’rö\åv8=\èÀ³E\ÔYQ›GG\á+Xuk$¬‰kS+òø\'õ\Çzª}¼q•Ìuo§j‹+9<žpI+™U{ ùs¶w\ê*ù®òpAX¾:t)3ŽUŒ\É\'L£\Ì\é_,ý¡k6·\Ì ºiD!¢‚Es—b|\Ì\à\í\ëÛ©\ë_Sý8S\ì¦\Üå²‘\Ä\Å%Â¤E_\Ã@(ñXucRðr\æúI=­\'™‰;Ó®ò#?÷Ž*a¹š=\"\ë\02Â¹\Î:\çøT\ÑÛˆ\Ô\ÝÌ¹@pŠ~û{{VúT~\'\"¶\ÊwcŽƒÖŠ\Ô\Ýf`#ˆ«\Ë\ZuG©\ë]©±%\Ç\í±9f9j\Ö+@±½ÛŒ*|¾\æ¤1\ä\àw\éS\ß]|BG~X£\âh\ÐË¨šIZRNA\ÎGcEiº\åÝšÿ\0¼sIÛœuZ7\áL²,1(%JR†3ˆ\â\Þ4\ØœÇ¹¬2aR[4†YA\è´iz\Ô3¨h¤)\Ä‰ób¹R\Û\ÝC7=«²?ø{ýi–Ÿ\Ä3[·…z…Û™z~]«\Î\É\âµ\Ñ\ébóo÷1.3œ\Z\Ýnô\Û\ß5V\Óõx\çPRUa\ê\r6‚ð7\É(4wG*’F\ì\ÝO_SDy¹sŽ´º\Únfù¿\ngny‡Q\ïY4Q\r\Øc\Õµ\å0}é‚•A°²€¤\íøT…Yñ«ƒ…\ÍYt;t|Ç˜\íU»f2LT(Á£µ®\"µ\á\ë\0	&\îe\Â(\"÷cü+H§Ù‡‘’¡l\ä?mZ\ê\ë\\c,6òóY\é\Ëð°c¡ ù\ÛñlþB©q\ß\Öõ?‡¯ønò\êK.\Üþ\ÆT_¼}MWtŽŠ\â>fBk¶\ã\Å4yx¢ó®H«h·2\Ûk6W1+\ÈðÎŽª»’C_p\é\Ò5Æ™\r\×##<aŠ°Á\\Ž„W\Î\ßf\\%ag\Çúd\×–O&N\ÊÝ}\ÅvšÆ’†kg1>	-Ö¼O\Ö2§\ÇG^,.™¼a˜I\Û;\ÓKøÕ§‰\\vªV›\Ä\é\Ï\áj63B?¿Ëµ[tN\Ë+\á\ÜFñ7nn•ó9;³­\"»˜n\nHJœ\Ñ7q,þž\Õe¾\Òô\ë¿\Û™=\Å.K8\Ö\äEê´£1ñ8Ÿ\ÛV˜ú~³k©Æ„Eržû0\éTh\ä>q_E}¦ð\è\×x|\Úòs<nq\×jùña¸³¿—O¿¶–\Þh˜€$\È\ìk\èN\Ï\Ë|/|Y\Ü>\ÃKMÃ—\Í\äIö\×Ó­\à’W@²\æq½sO±x¤‡‡ƒ)\Ê\Ë+`c|Š\ëZ4’¤\êòˆ\Ür\ã$l+è°¯µ^w÷³T²”\ÚxG|d\n[%›\Ìòt\rÂ°?X\î¦/8*Tú†€º€]HdVðN@}\ëVŒlE-´»3J¦pwÚ›XM*Bñ mŒ\Ðw³\Û\Ã#E+~ïž¿J\ÂK4\ÖÁo-_\áv<ñü\Íø\ÒC%ºŸš\æF*õ=\élò¼ùuQ\îÞµ\rôÑ˜¼M\Þ2yD‰\Û\ëZX\Ç*Cû1·¾â¡Yd8\ë°8©Vb\ëó`zŠY\å\çðŸ•}p½j7\ÕXF£r*\nD\Ó\É»,²\Æ6©d•YÄ¡Xdv¥W¼¤;\Êr¤y{\Z²\ÙÈ³\"‚ª«\ÊJ¨¤&n\Ù@ò°_\ßZ\\\Ê\ÌT94\Æ\à*’4*A\"y\'™z\Õ=	\Z\ÂFY¶>•	¹˜1%ð­\Ë\âG€\Ì+?\æl8\è=E$˜3k{²Ár2;š).\Ã\Èvõ\Å \æ$bŒŠ$Có*ò\ïŠ\Õ	„\Æd\ØÖ½ ›¢Ç“õ¨%‘\Êù9$w\\Ÿ:\ç\ß4\É!‘\îc`YA\Æ\ØZÑ¤ù‹\à\ØQ2\Ï)`A>‚ƒ–x‰\ÌET÷½\0%\ã›\É-xVòY>vB\0ú\×\Í:Þ—¨\Å\à\Ý\ÜZÊLþG+±¯ª\î\â‚òxÄˆzón)v­§\Ø\Ëa,3\Û\Å$™T\å\è}i\áW#’\Æ%¢U\íC\Ï8M¶ô«^²#ø‡\0aCl*µ:«\Ì\ÅFý\ê\Ì\ØFG3Kb”E«\Ã6ùWa\ä <\ÝH\Û[Õ€Iƒ¿8¬\äZGR\×Igm8\ÜòŠ¯k‰\Íj¬7§·;\èvl{ ýÔ‹X\ÃXoA­¢g.\Ê\Íüy*v4žò;SÛ»\æ—\Ý&\\Ó’%{\Ëq\Ê\ÛR[ø\0LÕªö/+mHõñH¬\Ú4LeöLò\ÃÄ‹$C!WÎ»wN—\Í\Êø\èk–ý‰i\Þ>£qq\ÊHRº>·\0’\é–6\å\ÆÂ¸òÇ”¬\Þ‘G\â˜\Ú;\'6õQ\à¾1\×x7]]OD¼xdVó¦|’B*\åÆ¦Xl\Ù%\ßc½r\çb}\ë\\JˆÉ½q}”}©ð÷\ÚM’[¼‘\é\Úò/ž8oZ¹\Í°Jb™\n0¯\Ï\r>ò\ëN½Žò\Êy-ç‰¹’H\ÛM}Qö!öñe®E\rñ»¤7{$§`Ç°>†·³&¨\ì½kI¡Žd)\"†±¢\î¬\Þ\0²£‰`q”•7TJ™ªñ¥\ÝÄ­\ËÜ \å@-¹ds\Ê\çC\Æyc\\1ž¤×­•‰9\Î\ãrzWšÏ¢M\Ð\ÈH\Ê3\Üß\Z1P\ÌpRh2*ª¯œþ‚¦Ü“’ÀQC°‰$‘ÜŠ\Üó»w\ÍD±™·#¥JªÎ¡{z\n{%\É©P¼À \ï¶Âµ,\Ó(Il\ì@\ØQZu­³#‹›”zþ4{\ÛEƒÈƒ;`go­a—<1\êG>Lñ\Ç\Ø\ÜÁ\Ë4Q…R9\Ø`~½.<8¤žE3!\Ãiœ’*+&Ng*¹ýô²[+\Ù4ù\ÞØ¼¢Ù¹Šc%›Ú¢<r\èó2\äŒ\å¤i6¹m3\Çµc‹,ç«šS5þ¡;xO4\Í\Ï/>=…kwmum*\ÜKm\"³dV#¼š\ÞBaW*[d\Æs\íIaÇiR‚‹6ý„*\É8ð\á—q&<ÆŽ²tX¹\â¸\Ê}\Ñ\Ó\Ëô¥÷\Ò\Â\Î&u{u;…\ê3ô¡­Ù ¸K†\0\ÆÄ€¡r‚’¹*E†k\ãŠ8f*¹\æ\ä\Æ2=\ên0M©\Ê.%2LN\"_ºj¹{ª\ÇÒ¤$•NyMEe4\Ö\í”ó\Æ<\Ø\'§½%·‹*¦‹®±g<²=\Ã\ÜG\áCó©\í]“ú>ðõ…\íÜš\å\ìK<6ÁR×˜g$\ß±\ÐW\á+þ ¾]/EÁ,<¼I>\Ø\Íto´\Í;GÒ´M;EH—#\Í-\ÒI\á›x³‚\Ùa‰ª?\Ì{V¾‘\Û_ú4\Ç\Å>R)?\Ò\'‹\Û^\â\rN\ÓI–\Þ\Þ\Ê\Û6Ð†\æ>(\r—Á\ÎX\ßtzW\Ï7lÁ¹KœoœoV­oPÿ\0}š\ßÆ–X£\'ÀiGŸ—;sUFùŠ\Ä÷Þ»\á\Í*›³¢\\^\â¨\äÇ½<\Ò\ÃcÁF9;|¦“[\ìKô\ïKŠk‰T$l\Ë\ßm«|}™È¾h­\ÍjwÀ?1\ÏQ\è)Œt\Ä(\è2r6©–7—ºUÀ¢y­s\Ð•«\Ì\Z­Œú_‡`ùye8Á\á\ÇQ]±i˜1&­È¬b@J‰\Ï­/Q\á\ç${úÓ‹»v\rŒs1»\Ò\Ù\â*\ìv\È\ëIG7…\"\ZA\ç>ƒ\ÐP­9\Ø`úwÎµ.y°»/¡4]”‘¤œd\r\è»-h¶v~<‹ûiFc ªõÅ™bX®KÕ’\îSw)‘\ÉÀ\Ø\ØzTQZ‰y–1»·`(”T´EG\á.-ó-»¼{\ãnôe§^Û¸Žtñ÷—cNõU\ÎPaq„‹Iolyf\×-Î¹òaL\Ödº\éœUj\ä)“\Ã\'±«5–½€Ve?r\é¬;÷5¢ZH„w_¡\ÅrK\ÅLê‡—$v5\Öbq€\ãÒ¶¿¾[\rú\ÚøI\r‹H\"²Rø$(>¸®]¦]j6‘KW\ÐÎ¼²\ÆÍ³\à}\Åuß³k‰ø/S\à]N\àG-\Ì\\ö«>\í“u\å\'lžŽ\æµñ?MÇ–MNUðG‘ú–LqN1¿‘—O§j6±\ê\íã£œg\nÞ„T\Üs\Ã\é«[üuT¹’`y\×\Ôz\\³L›Yû7\×ü¤–M2\àòF\Äõ\n\ìšmýµÝœWvr •C#£\ÔW\\¼H\ã¼R3\çy¾û±e	\Ãm¦\ÏhJJÿ\0\rœ°ll~µ]\Ð\n*xl0T\àýk¢\ÚKq0\ä\n¤\æOR;\×>\ÕV~#¹[1‹yž?¡\ëú×\ä\ãp\Ñ\ë~Ÿ$¾ß‘\î›]f\ÆH·qù\×i–\îþ\Ìˆh\î,\ß8\æVô®AÁ2B8›N{–P‹&w\î{WG\Ô> _5Ý›,Ñ†$\ÄÇ¥|ÿ\0\ê2m$ue_yµÆ6¨K´KG \Å+¹\á\Ï\Íd>¡±N!›V½e\ÊøŽÙ¦\ÑA?„c\Ó5\â5B*Q\é:½»‚þ_¡\ÜSa\âHü“\Äü\ÝI]\ê\Õi¦º\'3\îÆ¥øv\Æ\è1õ¬\í1\Û9ö¡¨ñ\r“—–$•FødRv-\'Œü8®-†¥\ÄrŽŸC]N{ \ê\Ñ\ÉTô8\éT½wF[[\è\çps…o†n”}þK^¢¦‘¥[\Ù\ÙV\ÆHùsV-®’=\×({‘\Ð\Ò+k\Æðb\\\á¹FAiÝ¥\Ì\Él…(OL\î+\ïq\É8¦y2\ïa\â\ác\Ã4W_OZƒR’\ß\á{‹W2³\ÆzV‘j6ñ²’¯Íñ\ÐÔ—Z”H\"—q\×5­’Ð‚e’oNL9\Ê4™9¢\Ö\â[{Žf„`\àÚ¥Š\îyG€\ä;&ûŽ\Ô9´[—c7”\ç¢ô¤3Š)n!xKDyð3ø\ÒË‡F—1l¾‚ž­ƒ=±e\0§@\Ä\â—^[ø9ñ\"(q\ÜTI1¦	\ËmëšŽ\ê\02Ë‘\êAZ\ËrPg¨;÷¡\ä’)pJ\ç\Ðõ¨*Í˜\0ó\ç~ô\Â\ÎpW¶\Ü@ª0‹tB£\å&´‚w†\ëÌª\ëñB{‡ü‚DË¹;\í½A*˜v©,¤c\\œô\Íydvó\ãô­{ Õ¥ˆBG#‰pv¯C#žeõ9¨]@8glZ\É*@1\éN€\Ú[¢§\ÄT\'~Ýª®f˜ó +\Ìw\ÍK6Ð•?Ö†bDk\á©/œJb7\Ä\ÅGœ\'\Ô\Ö\Â)Û•VP©5\n\É(r²r¶þ˜\Ü…ô\Æô¡†E?6V²$Š\Ç)ºV\í#Q|ø\íÞ±r\n°aó\×ÀŽB¢* \Ü\ïÞ„\Öt\Ó\çd\ÃeùÞ|˜\É\È\Ø\Ð:Ñ‘t¹I\áw\ß +ª©ø·\\\ç\æ’,j\Ò\ÊI\Í>Ô‰7=iHŒ† g­j–Œ[\Ø\Ò7/—¦6ªæ¦„I\nŸ½%[n\â¡f;bª÷\Åä½·ò€¥\ë)š@\è\×\Ø]\Ïü¢\ê\ïþ\å‚6=é¶·/…¤Z\Ç\ß\0ŠEª\È~u­\"C\ìQ9”\nq—4L\ç%E\r)óš¦J\Þ/•¶¤šœ\î\ìjÁv!¤ºˆ\"«6Z.ÿ\0`‘2Gq8_)}ÿ\0*¶\ëq9¼i¢|d\Ô?bº|6œ8$ø€¿6?J—W\\9ò	\éš\ã–\änº)<}+µ™Y@\'\Z\æ¥:\×@\ãyY‘‘Q9v5¶5H™;`¬0k@\ÅNAÁ©¥5ŠÐ“¹}‡}¿_ð¤‘h\\PÏ¨h¬B«·™\à\ÄW\Ö:\\úf¹¥E¬h‘\Þ\ÙL¼À\Æ\Ù\"¿3®X†«÷\Ø\ïÚ¿}j©.Ÿ;O`\ì<{7o#Q\èi¦KÁc‚\"™„¤v+k…yqÓ°Jw\Î?SRC:ˆò}Ú¸Z=¤Ù´p,hg§­²$~Q\Ü÷5\n\Äd<\ÌN;“SF©!7\ëŠi\nS\ØEº\0 ¹\Æÿ\01°C\ÎYb n	\Æi}¤\\>P¹ÝY4\Ø\"ƒ€\àõ,:ý*2FN5Ÿ.MhU¨Y»D\Ó\Ç‡‘s\ÊNÆ•\Ûq\ß\Z\Âí˜ŒT)\ÇLŠ³jn\ÒEq\â\ÄcŠA…Q¾qÞ¨ú–‰%½\éÔ„¤Ø¶\ì\Ñù°}=«‘\às|e\èóòó›\Û\Ò-œòq©4±G\ä\Ær{S,\âŽ\â\Ö\â(G\\8À9\ëŸZ¬iI%Å±$oÍ°-€3\Ü\Ô\â\Þ\ËP»økÛp\É\Ê<û¸\ìi‹\Z‡C„R-·\ÐM«X´3Ü¯™\Âù›\é\\üO\àJ#´Šw1±VIFÿ\0\éWWWŠ\Æ\Â8£\ç„!»\â©:\Ê^†’H¬·\Ì\É]”˜5»\âôÅ–ž˜=õŒ\×w5Â„È±”ú\ZiG—\Ç\Þn\\P¼÷:rŽlŒ•“\'9\"‡7\Ñ\\\\G\Â7;õ=9q\ÐÐ ‰J+¢Y]ˆr\ÊUº.w¢RbR^uy™¾\çµBgK\à:‚rŒ>ð¢xz‰Ö£·–E\çvs\Ê{Ÿý·\éŠk.…ô\Ó\Ú;O\Øä¶–\\1y­j7Ð¬v£Ã’LV020rX’¹úT\ï¶{\á&Š©u},wzœ\Æ\âkh\ÆcQˆ\Õún£lc,k§q-Í–“eÃ«jŸi\Ç]\Çj–P	†-÷p\\‚~\îýk\ç´\Þ!ƒ\\Ô¦¾¶ñŒN«1ó\"§­zŠ+8¢b­\è¦j,©p7Bª\èr\r)º¼¤š*]º`P-–”\àošÅ› ‹NP\ã\Ë\Ìk¤p§ˆ–Šª‡}\È­R´K<H®\Ã-\Ûl\âºƒ$Ö 4r}{\×Vû2\È6x.R\Ñ\î$·\äˆ32cVe³õ(\äxe\ìÂŒe}Xzý{U†òòmNSoss3[C†u;‡~Àû´\ê¶I-•=\ÇJÝ«3ZÓµ˜\åŒ\Ù\Ý Š\åŽ¹ò¿°ô5‹\È\È\'9\Û\åõÿ\0[\Ðwv©p”õ\Ïz\Ú\Âù¬•­õi­ùp’d–\Ó>£Þ‹ô\Æ\r9\nLx\Ë§Ò¶‹ c?Vô£¦²\çQ$\\¦&\Ýp~a\ìil¥ l`‘\Ücz–†A€\0õ?ÆŒVT·ð\Ð\Î~ùþB”ÀÍ’\ï°þ\é?¾Œ‰¹\ÎGþŸJ¤\Ä\É\Z>v$\ä\ãý*=^\Ò(-#RGŒ]Xÿ\0‡qL‘V(m™ŽÀR»ðó\Ç/6I`q“\ÔúûPú5—I”ÿ\0dRU\ßu ¤³(À2‘õ¦H0\ÑÊ’8¢\æ^`%D™pO˜où\Öm\"¬F¶ø#>âŠˆ²2’\Æ:õü\é‹-” žY!|t\ê+I,$Ù£e•{b•\Ë>‹\Ä:}þœ\Ú7[\ë¼\í¼‰\èCu8ü\ê]>\Ò\ç.cx¯?­xJþNX/so!\è’º}ú­Sü6LŒ#\ÔS-/Vº°I`\\Kmp†+‹w\Þ9S+/ñ\íÚº¨sŠŽM\×O\Úÿ\0\ê0ú*2\å\r~=3ªG8NYó#\än©x\ÓE±¸\àû=kL·ö²>7$¿•Q¸/S1!°’C%¨ÿ\0»»˜\Çü¶?¸÷®ƒ\ÃÚŠ\Ã$úe\É\Ò\íd6\áX\ì\rqù8~¬5\Ù\Õ\ã\åúSL\ç\ÜGrö\ÚDsFÜŽ\\\0Ã·¸ t¿µn#\Ñ\ÝRoQvÄ£\r¨¯q¼w\ÚoÀÌ¬’EpT†8Áª¾g9\Üæ¼¨ø\Øòc\ã’6wyY_Ô¸³µ\Øý¼\Ú\Ç7|=*“×’`E9µþ:\Z&ú\èn\Þu¯›µiy\"\ä`ƒZÛ¼“2„r+ž_£ø²ôÿ\0\ä\Íy³\è\éÿ\0¤E”gÿ\0\Ü|¿þ¢\Öñÿ\0H\Ý€²\è\È=C)¯›šY<Ç˜/S\ëY0¯P6¨¢x\Óÿ\0‘ÿ\0U“\äú^?\é\Â\r\0\çµ\ÔÑ›±‹#ó§ü3\Ç<=\Æpök7:7+\Å \åq\ïŠùf]BFÐ“L0EÈ²c\Ì=¨\îÔ¥\Ð\ï§k‘0ò¡\ÎOJ…ú»…\Øß•\'\Ùöl‘,\Æ\Ãš˜5\ÎN@h±œgz¢ð\'\Ùjz<O¨xq\\R\Ùõ®ˆ«\ÖÀ\ÆF\ëA\ê+\Õ\à\á£I‚I/#*²0g;\n‘üh\Ç*°Øƒ[Lœ\é\á„-!\íR4l¼ª\Ì6õ¦\êkc\Î\êH+‚\ÉÞ‚\íeL}\è\rŠ2\nŸÒ£Ž9cc’À®Cc¥0\Z¤dI¤Œ[?!lC\ë’sb9zƒX³™b<³²¶6-\í\Ã-#À8\n9´ýY¼,y*Oj9ÀT\ê:t4\Ê\î•Œ\Ñ\ÌöÂF+’\0\rŸJ\Å\è´e.dÙ´GoQµlbUVh\Ó\rû\ë(\Ò0F\naQ;\Ì9„Y•#a©($+)©\\?)&Po.7&³¥OÅ¨whž@0w\Ü¥J\Ë8Gb\Ê+tfi#?osª\ÆH­B²¤\ãßµi<‡\nªW õ˜\ÙA#œ0#\ÐVñ\ä\ÓqQ¨”¹bü¸V®H“?žýi›œHË‚«ƒ¹\"Î°§œôÈ¨Y|¼¼˜;b·\çG”Ž»P³@G1\ïƒZG3É‚=ª¥a’€5*\Í/(#ÔƒLF$g¡[l\ïÒ•kl\Æ\Æá–ESŸzc\È\Ò19Ç¶(Yq§\Ü(\Ç\Ès@ŠL\ÉpI\Ð~%`W$©Š/\í€\Ç45\ä\Å\î\Ìiò\íZ\'ª2}€\ê0?†¹ŠúÁ#kyvñqV	\ßÅŒ©¯\éPi\Ö\Íq,|û¯=e4\ì\ÒD¼k”†\Ì)Á\n3Hu	\á“lƒNx\ÂOþ8r0«ŠC|YB§Q[D\Î@S\ï\"Š\Æ\íS1Ì¸5£\rŸZlH\ç\ä\"“k ­¿0§—c\ËHx€\âÜ€k6Z;\0j\Z}\×FP¨u@¤)Á”\ÈÁ§`$\Èr×¯ô\Äxa‘Œ/ó&uXc\âi\êÒŽ½\ë\n5½\Zq\Ûb~\\÷ª/SOøŠ\ån\ÜH¬H\"’òùjÒ¤K`s-\Ãz:U¡\nùˆ¦»¡\ç© ƒ™y†õ\ë\ègW$\Ä\àz\â¥\Óeo/#öŠ:‘Jw\Éôº(Q¹½j\ÝCº„q\Í\Øuüh\èt‰K¶c_Võ®Z=	d X\Äó²Æ€’:€6e²Ò¢#?,\Ü\ã \rñAÁ5½¢¬Q*ówoSMtvŽ\×PI\'PLyFwÞ©#žSo£ya\ä\ÌJ \ß‚ ƒVT\æQe8A´r2\ìOµ9¸\Ô,c¸–\Ý&g GZmJh^H\áµñ\0\Û\Ë\æ<\Þ\ÔR!	õ\É.f¶i\ÛQHv¢\îi†›ik{Ã‚\ÆB\ÑD\Ã\ÌGP}\è+Ø¤’\Ì\Ï?2KŸ™˜~ž—p\é\æ\æk°>dFðÞŽ(8[³\ÒÅ¦iú\\\Ú}³‘˜–v\äw¤v–WSL.¥ž	#?BÀ}=iÜš¦‰,‘\Çyç€T\î=ñL­´½\Z\Ê\Þy\Ä^N¼¬¿JRŠD8tz¦\æÛ“À2Y…\å¸ù=\éN¥£_XÀ\Ò\\:Nœ¾Rn\Õ·¨\\@ŸÕ‘\É\É^¬|£=³B\éW\Ò]C%µ\ÅÌ®2ýmYi™\ÉFZ*óE\Z9.H\Îø\';\Ö\Åq*Nfe\ê{Q¯oþüö‘±$t@½)]õÜ¶w9d\Þ#‚=*£\ßd¨+\ì>\Õ+ò\ÈS#¯µu²Ž6Kj\â5µ¶Ç·‰\ç”\ç\n\ØûÞ¹ŸX\êz\ßZ\éöqµÏˆ\Ê\ê~\ï×°÷\í_B\ë—húH¶¿W’-.5‘\Ò\Ö \Ë<øò $\Ë\Z\á6\ç\"»¼|_\Ü\Å9R¤R¾\Ñ8µ#\Ó/´Ô¹Ž]röb/š0†; \'²Œ/\àk\ê²s\Í\È	\åS€:b™q6¨ú–¯qzøF=!üB€3øRy\ÎAcÔœ\Õ\Ê\\‚1¤/°zV,\Ðs†;’kI›™\Î(»8ü*\"­—\è°h—pÄ¨Ö®e Eðžg<±‚23\ê~j³¢\Æä¨Ž\"I\Û\Ìp*Ý¦ü\ât<ª’2?SøŸÒ»ñªG<™¼±C\á\0y\Ç\Ì[\ï¹5ŠÁ‰ú÷¸@\ë\Óz	\É\r†Q\ß\Ó\ëZP%Œ\Í#¿/q\ïô¡ž5Ÿc³zú\Ñ\ì9Heóc¡¡š5sÌ£\ÏùRhvk+i’•’3%‘>tSºû¯ò£§†\Þ`³Á\Ê\á×˜;c\ëQœ2\0ÀRh{\×M½X§?\î3¶3\ì˜÷ú\Zž€Š[b18Ž6ÿ\0®õ\ZHKr®\Û\îsûªÉ©Ch\ØX<\ë×›±ÿ\0­©L–\\\Ãm”t\èqh,\Þ„6\Ø\\cS\\Bfcò–ô4,K,Ì…£ö£\Z\æ(m¹‹‹®\ã>æ˜m\Ò3K†B)\Î\ã \â¦?8\å\ÃmŠ\Z\ÆdºYL#”¯0\èsƒüMy¹²§§§jÌ¢.\\¬\Æ\n01±õ¢D¥†%E”c#Î·ð\àg!£g£\r¿:t\"r\å•A\êz\ÔrGo!ò9ŒžÇ§\çRI‘£¼\Ê{®\â…~\\\Û\Z‘ž†Y\ì¥)\ÆQ¸?Z¿\è\Z¬Zµ \nB\Ü\Æ7Rus†vP\0l¾ù©t\ë÷´»ŽxÉ\Ô\ç#¿\áB•	«/_l|C÷\r\é\ÖRY²Þ£\å\î@u\'Ö¹;Ê…²§;WP\Ô#\á\É|¢B9”» \íô5\Ê.#)+9NpG¥c}\Öi­\ê\ï\Î9€ bŒ\ÒSý\ÅXŒ\ï@\ß\ËøS[pN„ÿ\0„mX\Z\"\Ø\n\Û\É\é\íQ«¹S…\"¤†6c¿JO\\\èP\Í§\Û\ÎñKQx¬¬\n­\nX¤ˆPü§z\ìÿ\0az%ý®¡q2#¸•Uy—;b”t4¬¡ðV‹­jú¬P$3Ám\âÀÀ\ÛÒ¾©\Ó ø[aRYV0»ö¥¶\Ú\\\à%¼*\×aÒŸYiò4 ™$mP\ä\äöRŠ@\Ð\Êÿ\0\Î@@£”gb\ÔSrJ¼\î\ÄV·–6w]óŠ\Ú8‰·V8Ç¥!’C\0b\0c‚:ƒXKk\Z\\:”\\\0O_¥Mo¼ØŒ Û½O\Èm”‰2±\Ë0õ¦!=\â\\(U9˜\à{W¥‘„J$W\çNi\Ì\É‘Ÿ˜6<§Ò¡º€9¶\Û\íÖ€*÷r–œøy]·­¡ð\Û\ëƒ[\ÜCð\ï\æ\È\'r(V$4ƒ±Y´RaR…€vÚ²óø“6\éŠÄ—W2}©}\å\ÒÄ$™]¶Ú¤¡æ€ºcY‰c3†!\È\ê\r5\Ä›*ûU†ž«ù\ËI=».ú=\\þß›Ã‹\Ì\Ë\Ô]\èÉ›½ -…yOV¥-«\Æ	U\æ\ÇLQVÚ„\\|:¡G#l÷5­òJÀ7.7\ìqL\0†PI<\Ýðj¸-\Ì\ØŸj\ÜD\åœ*º2œü»V\Ï\âUBò\í\æÈ¤2$2ŒnA\ëZ´¥\n¬\Ç;š\ÑDÅ¤,@;[Áq\ÎB¸8>›S’%WÁW##-^r§¸Cdr¶k2,SG\ÌX”Q\Û$¾QH®;S\è\ï\ä”\Ôâ…½>43ad\0)\É#­\Å	‹³„\\¹\ë[Ì²l‘²õ\æ\êig&‡i\ÙBü²dý3D9Æ¢óG!ñÖ¶‘õ\Å\ä$r’\Ù\éV]–XUC\Æ$Nøõ«D1Æ—Jº.\ã¨i=•§ƒ©È aq]Qµµ‚\ÔÝ«©\Èª>©0‚\Î{’\0g\ÙjhvQõ™Œ\Ú\ÔäƒmKµ\Í\Î\ÇlQ—k‹†˜ý\í\Í-ùœ°\ì1ZÅ\ÈÌ„Ö²\Z\Ñ[>õ‰4\É\ÍUø’M¹A Õ–c\ÔúUC_s%\àZ†Z6Ñ£òƒF\Ü.`V4˜ùc¢Y>*JdR\ÙP²´S¦Ò´™v¡ˆ_(\Ø\Ô i\Õq\Ô\ÑSgM7ŠHòƒšt\rM³“NS<I&GqGC h±Î³‹x•»(m>TKtT`F3ÖŠ&y”‚=\r@\Æ\\9¢K3øvQx²\ã%ALµ\"\ãId}bW$ù–¨ý#[·\Ó,#K¶c:nò\ã%\é^³q«k²ø÷\êè½£S¹õ“i-vk|\ã~\Äowm¨\ê1›{‡\Ã<¸–\ÇsMm\î\âžûÀ¸·C0e=~Ô¢\ÏK¿\Zœ€\Ù­±”l\ïN.m,\á³Uu\nN\ÌCw\ïBw\ÙKHm¨h‘Ok.b‰\ä`7Z\"\r:e¸žfŒ\ä¹Á \ã\Õ4\ë~KxašB§¹\ÎÞ¢µž\ï,\Ïnnž¼ \ÒA$ºGGr¹\È\ÈÁZ\Ú\î\ÒöŒ/6\ÅNô_Áj7Qy¥’5?\Þù§\é6¶d63\'L\Í\ZB\äÊ¥Ù‹JŸâ¡µ\ÆB«m\ÊOJ\Ýgº\ÔakY\Ñ_\Ã`\ä\0y˜ú\n}©pô7?%Ä€“ºö5\á¥„lbÀln\ÇsXð“•·£\r»eCŠ§º¸Š8š\ÌG	\Æ\0½/….-™\\ŽNQŒ-8\â›\æhbðÔ°ñBŽÞ´º\íù¹Q³\ác<\ÝóD ý8}\Öñ&%¸ºŽ\'ø••LUn!{;½\ÕÜ°¯ˆIa+`ŸÂI\å$A#\"¦\à~ŸŠø\Ò\ÓNT1Û©<„ô@w\ß\Ô\ì+l0ûµ\ìQT\Û;Ø¦›o¡p„œE,E\ïg\Ä6ñ)Á—|\"\Ø3uúU?\í¯‰mg·‡E´šyn žI%º\ÝD\î\Ã\Î\Ýw\Üre\Ö\ãŠ+ya´¶hK\ÑU€\Ìd\Ç$\Ø\ß¼Š~oV¯ž¾\Ò5\Å\×x‚\âùâ¡V1D`6þ5è¿¶4Œ\×\Ý+)w²™3c˜\r\Ïs@\\¿*\\oD\ÊH\\g¹\Å.½|\áEb\ÍHb›jq§\Äƒúš]j›Oô\Ë~yQ2M^8\ìRe‡A·iQN|ŒyN\Ûò÷\Çî«‚\ÛÆ±f2\n\Ô—ð¤z$|‰\ÌT\àŒ/®O\ãN”°³9oQÒ»\à©\ì†Ut‰\èZ•–m²1\Óô4j²¸\å\ä\Ý\n\ç¯Ò…ž6CÍ‡cÚ›@€¥NL”¿.w\ãÚ¡b0|\Ã\Ðw£‹) ?N¸:hLm\ÍO \Øÿ\0­H\ÍHñSÿ\0£Pwö\âxZC\Z,¨Áe\'=\ÅN\"pžQûDQEX­õý2!¶“]…\ØH›ŒzûTo­ê“’-ô¶Lô/üiÝ£4RUÁ\éƒ\Óñõ¦B\Õfˆ\Ü[€<}\ÇúTño\Ø\í›\Ù8’hó$\â\Æ\Ë\Å#Ô¬\ïeNy§–Oó6\ÕÑ¦d\\r\îGO\çH\çµ\æŽXˆ\íô¬§ŽýH\Ó\ì\ê\í\ÓH–\ß\ÊÁ&$†\íVF{irmŽµU\àø\ÚJò\ÔÁÀ\Ï\î«1WR¤c¶ý\é\Çöƒì•­S(C®F\â  óG)ß­Ktu(\äoÒˆø•e\"h•‰ûÀUˆ\0»(\Ê\ìy±µ\rp\ê\ÊK¨{»\Ñ\Ò\Ç\áHú5.¹™=*Á\åR1Ñ¶¡Ž§j)¶$ö\Æ(y°rp7¨cC®Ô¾õc‘ˆŠ\\\ß\ßcøP_h:oÁ\ë/<cÜŽq·7\Þþ.Š\È\Ûz·_\Âu\Þ\Èó\\\Únž§§\â?u\'÷Fƒ§g0¹Va\Êw=)\ÌIˆ\ã*K\Õ9®P0\î\r7pH\\\×1©V8DkÊ‡5\èc,Åˆ\é[\Ìp¥@¦@ŽTj\ï?Ñ¼\É&•©C\Í\âût®	<J\ïÿ\0\Ñ}ZKZ\ÙfT\ç•q“¾1½D¶†Ž\Ãl¬„T†õ\Å.ˆZaúÖºF—wø‰£/?J:\â\Ö\è4EYP‡Ë¨\èE*(ro\Ìy¶+Ú·‚H‘\ÌR®;©ˆ¸šD	!:â„’PUš4\æ|\ï\ì)\0brgÉ¹=\Zµ¸½6¶ŒÒ¸<½v\Í*±–93òž‡aSÎ«+ó‡\åÀùN\à\Ð\0²\ë\nÇGp3,g\Ê)‚\Ý\Ú\Ïk„“\å\Æ{­.\æ&L\Ë\Ìz¡¬³\ÛZ9”Ê‘,{o\íEŒ\Ù\ìc7H\è\Ã`Cù¥š¥¼¶\ä¹*\0\èi…\é	‰yyöÂœRÛ·™KgaŠR\n¯„\æ,›¸\íQ\ÈÁÐ£ +\ïP€Ø•\\\ì+h³‚q\×›)0K\ëw·–+\Ëyn¿(\ÅZxjÿ\0\â\íŠI~\"Œó…\ëU÷„Ì¸`S#  ´Ë«½XH¦›6\Òùr\Ç÷ÖtL‹…Í¼³¹”\0NAQŠÌ“\\<`º’A—\È2²\ä\îž\Õ\'\0y‰8\ß\"´¢M£g“¹\ë\ëPÊ‘6@o61š\Õ“\å.¾õ4Ÿ³>mº\Zbøp2Š[$d’6&¢Ž\×(\ÜÄ‚=jgžg\É\nô­<g”dšÈ’\" p²ô\éYH‘a\å-–\'–£’\\?*(U\Îw¨y˜d•\É\Î\Ý\è\0ù¼’yF\àŠ‘\Z7‡™06Ú‚¶c\"0/·\Óz‚Fq(W‘‚)\èæž„Qø¼‹.)\ÊB¤«œúš\Ì2N\Ì\'µ”\Â\Ãe#¿Ö±ö±o˜b¼™š<~\\\Ð5ø\Þ0®\Ø*1Mô\Ë+G}q75\ÜÀG\Â÷ª—j\îV\Ö&ò/¥7\Õ5\äX<Œ3Š¢´\Íws,ÍœóRliÕR\Ð6w¤&_.ýI£uûœ…„\ZNœoÒ©t\'\Ù;0¨\Ýò3\íQ´›ÖŽùª±]¿,LIª¤\ÇÅ¾$ö4÷Wœ,%s\ÔR[TÌœÇ½C-\r-|‘\n.¥¨H÷\0\n3\ä\Í\rv\'µ)=}\êNÔ€m\ÛNŸµ\Üdu\"†c½K†1•`6 hz.Ÿ\Ä\å@\rºÔ¢\æHÔ‘\'7¢Š@—Afc\Ê:\ÖZþ4\0	\ÏJ‘„\\\É-\Ê\ÃjaLô}©´3!Q”lŽ›šA,w\ÖR¬¦\'R7U‰2>ô\Æ\Þ\æy\àñg…\íc9{\Ò\âr¼’®\Â\ï\íny ‡+\êOZ“•€\Ã\ÄYn\\æ¡´¸¶’2òJ\Ðûò\ì\r4†bˆ¬¯\âó\r¹:õ£‚­4.i,\á\r£Oº€6ö©Hyþ@3\ê7©\î-ÉŽY \Ç/SÍ¸\ÅA§\Ä^Wa\Û\rŽ”ž4\\s¿’ye‰JdŸÂµ”ÁóŽO®kIbI\Ä\Ì}sgoŒœ\Ç\îƒSÁ\"\Öy=$m*E*’§ò4šöÍ‹	\Ç\\S˜\Õc‹\ËÊ€zÖ·e”±Roe6\îÝ‰ùE=›H¸5b@\æ$f„•£Š&Œ\03@ý–\Ðc¸\Çc]\ìžÁt\ë­L,\Ë},\ëi\rÙ°U˜¶Ü œ\í\Ø\Z¬\è[j:­¬o‰\"‘hÁÁqý\Ñ\îzW@¿ž\Æ(nµmNh¡‡Nsn‘.#»(\Ê0½ú\Z\êñ¡ý\Æe\èE\ÇúÍ–¥\Ý\èš”\×w\Ù\ÅÃ†8w\'26þ§=+†j®¼«\Ð\ê\ß\Æ|Egª\ê’#ð\"Qˆ@Œ.÷ª=\ËYSZM\Û\"*…\×M€w\Î\r-o<¹ô¢¯$>¹¨ \0c\×Þ²}šZ£1\ïV}Ý¹²\Þb\ã”z\Üÿ\0ÆÙ©,X’v\0õs\Ð\í)?\Ë#œŒ÷ýut\âŽ\Ì\æ\Ëfšm§·XeP…G*\È6µf\ê	-d\å\å\Æ\Û`l\ÃÚ…ˆwô\ëüé\Ðø3/‰	\èQþ_\å]ˆÀ\Ý?~\ïó©<Tu\å—g\Ë&vüMaû=«#\Ç\Ýúû\Ò\Òù8e\çb3\×ù\Zû3<D#ËŽ£Ö¢ŽN¨Ã™O¯õ¢\"pÀE3yG\È\Ä|¿\éP\Ü\Ã\È\åŽ\ØÜû\Å@\È\ç€Ã‰WunÞ¾õnðÌ³GüEo –L2ž¸ýõ\r\ì?ü\Ã-n1Ò“5\äqJ>&\Üco:\ç¥kirð\Ê$°Ã¡õŸÎ‡†s˜`vÛ½I<B7ñóFÛúQ`{\ZO\Æ\Û\0?\æ \ì}½j·«¿„\Ëq\éó\ï/z}e;\Â\Ü\ãc¹\ê?…&\âõXd†xû¼¹tŽ”§Õ„{µµë‚¯9\ìA8þ\"­{2•‘y—·¯\çT\r*ñ’\â$)Ì‹ô\ëÒºh†\Ú\â#%´ŠÁ‡Éš•´6-6Áˆ1¸9Ï•¶5\ÂH\ÏLŽ¿\ZÑÜ­±\ß\Õ†@­†tÁ\ÜS LñòŒlqÞ‚’WV9ú\ÑW¨I$/)\0})yWFót\ç‘$R*ŽE\Ç\\ÿ\0Zó.ûW”\àú\Z†4D„ƒ\Ó\éV\Þ¸\ä–ksÿ\023\êþõV‘|\Äò¨§5\'‡v®rG)\Éü\r(ºckB.&²þ¬\â“\0\\E#ø‘ÿ\0•»~\"ˆ6\Ä\Êr§z±ñ…‚\êze®¥KVž\æ3\×ò8?W¢‘‘JÕ–Hñ‘Qv€;¨i[-Ž•$’;ŒTœ\í¹>\ÕŽ\ç\ÏQ_Fÿ\0G¾’]£•\îsŽ _;Ú«3ø`\å»W\Ö\ßbúl\\?Áö°\\F\É4Ñ‚\Í\Û\'z†\èh\è:M¾¬®\Ï%\Ä2¨P”\íL‚™YZX\Ê`nh;9¤,¸+·½wr\élAP¢ýi€%Ýª;sso\ëÚ’\Þ4Q\É\á+0`>`»Sk†²\ân|pù\\©Þ¼À\\Z8DB\ÊzEXY]q+HdŠ@\Æ‘‘ó\Z\ÄWK.\á\Z=Tÿ\0:u\r¼QÊª\nüý\éf­-µ\ÉKKv*Ky\äE\Ï(©¢ˆ¤·Vó0\0o¿¥<VšŒ‚+u,\èv\'§Öž.‡ip#I]\æ	Ð³\è—\ÐmDl.AÛ‘ƒE\n\Å·Ž8n<¤l­\Ø×®Um)pÝˆ¢‡B1¤“¸\ælæµ»°¾E\ç‚Uc\ÝqŸÆ†‡evþ\Æ\î\Ú`+’(r]c(9\íŽôI¼»\ÔŠ˜‘Tüœ\ÝMk=½\ÃBˆc\Ó42)\áH \çñ›˜úö…a«,\Ó_O\Ë	\å\n=j¨®f\r\Z±R1Ö£\áœ[k@[\ç^mý}h@\Ë\r¾5´¼ñLŠ¸\Û# ¢ù\Ò[S\Í\Z¼Ÿó\éP\É#¬ŠrJ\ã·JÐ¸\Ï0r¸íŠ»$ \Ë)V%‡^ \Z\ÅË‚€’\Ä\ÐÑ–Xøœ\äúö¬5\ÅÁÊ{Ó°£{™¹QV6\ÉA\É\Í\å~ýqR!^|œúV®ñ©<À)\ÆM!B€¥H=*)\Ã\É2\â0HSÖ¦‰£’2AŠ\Zy#`X°#£Sº°W1-¾õ)€y<\ÝKu¡ ’>eX\Ó!¶\æ=h„/QÛ—zB\â\r:-OJš\ÚTº;\×\ÏZÅ­Ö‘ª\ÉR…[•\Çñ¯¤c“\Å\ærvW<ûS\áßŠ‡ú\Î\ÕJ«\çP7\"¨Ì’y\Z\ÎÇ®+\Þ*[E#gm@\\\ß\Û+ª—\æm\éN¡©	²ª\ã—\ëJ€\Í\ÝÁ–V|š‰_~ôN„|ÀÖ†\á}E;4‚¡–~E,hv¸\Ø\ïJ5k\ç)Ø¨\ÅõÉ–\\‘[\Û\à`\n[,\Ù;\æšÙ§BzR\Â\Ù{…K,™8¡\ÚPJ\ÐËµ\"wn\Ô<¾+V”õncÖ›*óœo[:þÇ”/C¾Õ„e\Ïlö­Ë±<¤ýqHdE\à;u­\ZÌ¼\Êq\ëS¾AÙ¨\ä\Æv=°hôœ¾4‚)/ƒ\ÎF\Ê:}K\â\ÉP\Î\É2Mig§\Ø\Ãæ´…DøÁ\'?¥A4\ÖZlØ“œ\Ü1ù–\ëLó\Ý>µ\ë(¤º·wr|G\åU5\ë[\ÃcnöKK\Ì|\åf]9u)>*ò\âlŠ\ãzJ:\Ö\ÎHHki\Äp \Ù?Ö•\É5DN\×R\é¸Uòó`\ä\ç™j=>\Ås\\;1NU8\Ùh›ßˆv\n6\Þf\Ï_Â£‚[¤£Y¼F;±²ý)I\Ñx\ã)tAmg%œœ\Ò\\¼®{\Ó\ëS73ù‰\ë[(\ÂõŸÎ‚»ºKv‘ó±\Ø\ïÒ±“³²Q¹¸H\â-&žÆ’]\ê+…p£Ó½m#Mt\Ü\Îv\'a\éP<	\Ìv\Å+EP¾\êÿ\0%’‘\Ý{µ*\Ô\'¼¹À\ÃrºX%EI\n=\êN²]OTH\"$ó\Ê@ß”v\æ©C›¡KCn\áç±Š\ÓT€s_6V7b\n«ž»u\Â.\äú\íG}­\êVVü--¥Ÿ !ø{nxñ$Œ\ÄsH{\ï½Ya.4\Ù5—‰\í\í-c0\Úød$d}ö,GAŒ{\à\×\â¾!}~ø4°¬V–­˜”L‡§1\'¯Ò½\nPr~\éYR\â6È±‚Hû¤už\åö\0‚;\Z6þGž\í\ÖFò6yõ¥Z‹ò&3\Ðb±f\È[t\Üò`z\Ôö°± ‘CBÜ°&œi\ê\ë\Ë\Í#\Ô\Z\"­ƒ\Ð\ÃISi\ÈÇ†	úÖ­:­n‹ŒG™[|ú\Ò)U>\æ\çlº„ó\07þT]•è„ª\È(ö\é]xôÌ¥²ûkoöþ-—œ–€ü\Ë\î=hgRrÉ’\ät\Æ?u¥\ê–I\"—•\Ô\ìÀ\â¬“Up]ö;—\ë\èk§´et/³¼–\Ùù¢•†³{\ç^\Ô-\"•\rÍ¢’¤ù\ã\êPÿ\0\×z\Ò\åNW—•”ù\Ôö?õÚ¢†cxŠH\ÈÁ¾\ßJ–4¯’Wl÷÷ÿ\0Z\"|Eð€Gönÿ\0\Z\Öú4#Çˆ§°\ê\r	\ÎY}óÓ õ63y‡,˜ùG|ö>•-¼«$-\Ã\ËØžÆ³#‰¢.FeA\ç£±¥\åˆc“‘õýj[¬ÙŽS;v#½e*òøStnžÆ¢\ÌD\ÚDã¸¨ù:o\ÜT¡…¸d«mŒÿ\0\í\ïA\ë1üU„t\æ\ÜF(²ÿ\0« \é\íB»sl}qMõBEAc‘\ÔM–h\Ûq\èEMµª\Ú\ÊK4˜qÚ’1ª\ê»,£·­LaDpyA\ÇPGQÞ±§\è»i<Y\r\Êò]\Ê	#\0ˆ4\Ù\äŠhù\í\åY3\Û5J½\Ò\íË—ŒC¸ö Í­Í©o<±Œ\ì9¶£œ—aI—I¤`\åI1P1L±u\ëUe\ÕõvD\Ê\ì:\Ñö\ÚÝ´\ÞFo	‰\Ü0£šaÅŽ\Ú7\Ï#`Ð’Bñö©-®\Ï0p~‡j™_\'‚=\è`Œ1ƒ\ëM42\â\ä(Ç˜rþt4‘#6T\àŸÆ\Ñ`u»V\Û\0ö©c6\à½K\â´Ï‡˜å”˜¤R{ñ¥zœ-ms$-\È\ØÏ¨\íK\Å\Ë\è¼uu\Ëoq\'ˆ»m½>\âEI\ÌWC|ŽFü:RŸ\Ý\à#¦#ñ8\Ü\Ö\Ùô­d\É8\0-j.Õ¡iû3\Ò\×U\ã>Ñ—˜4ÁŸ=€\Ü\×\×Êª!\ÃðÓ¸\íŠù›ú9@.8\ì»øP\ß5õÈy\Ãrde€\ØTµl¤\é¶™\á\\\ï¾ôdZŠMp.t¥¬‘ó<£5º¯†©.\ß\0\ç4Ò ±õ\Å\ÄoY\0p7\\\Ö\r\äM Æ¥F\àš\Í\ã¸%FO)Áö©\æEg,‘Û–u\è¤c4\èV*»‚\á\Ó\Úxž«–dl–>\Ô^†\Ö\Ñ\ÛG˜Žb2\ÊË‚i…¤ið±‚\Ê	Ü…\è=ªf„€Xª·¦Fi44\É\Þ ¾!ÀQ\éZF„sŠPs³+¸\Ê\ã”¨;¶\Ô,bñ\Ñ\âž»Â°üiž\'†ò]\ÃG4Gœ0œv •5}S‡|&—\á§t\ÃH\ë\æ4\Æ¹/`V14Q‘žV\êÒ¥Fv~QŒv\Å!¬\ÛN’k+\ÛT/(òJÄŒQY‰\å$$’E\ä\è«V¿¦¦£lVxÈ‘	\ä9\éU±º±9‰\"tl©\'r*\Z)2ù£ŒH¼R°Á$li²\Ïnb¼…Ix‰ó¼)ì‘³\âg^€\Ð×«7‚ÆŠs¾Gj—¡E\ÒK§C:3I\âu+¸¸>•Æ‚Ø‰‡j×‡­\ßM˜¤o$%ò\íqLç·²ø1$\Èrj\Ä.r\ÈAÇ¯­f\Ú\äÌ¼¸\ä\0\ìMoq±\ä’>`TƒZ\ÜCm&T\Â09Á\ïHX?0$ŒûW¹C¦9\ÆN\Çj\Ö&V„J­\×|W™X\Å\Ï\ï\ÜS–P#\æ\'——cC:((ù}h‰Kò \'½lˆÁ†üÀm‘½0™$!G/!QžA\Û\ß5“pYù—šFQ¶N\ÔL‘\ã”b\n\ã\Í\×\é@\ÛB¹‘C\ça@‡_\0I\á´a\ÎHSœTW	mŠ\ÆG~ôW„\ÍT–<z/QP\ÄR)	‘¹\Æp¹\ìi¡S\í\ìþ)e{\Û5*/J\å7úÝ»2¸uÁ\Å}w«C–ejs±Sü+œqW&Kx]{b€>{’\Ê\áv\æ5·¸CóÎºv¡Ã¹v`\0¶)Dº\Z\Ë&Hô¦\"£m„|\äŠõÞšd\\ònZ\ÛM	²cj’-?\',(ˆ4ùWu±†\é\ÈqWi´Î¥éŠ…´\Õe\Ø\Ò™›\îš\Êø¤ùk:V\rD\Ú`wc\ê(\è\âs\×#\ëR,-06§_ \î¤\ÛWš\Ø™\r\ÅnUòv\'|VÌŽ\0\å\Üû\Ó5µ\Ær7\ÆÕ«\Â\Å0\Ø]û\Ð…\ÎHd\"¶h_\ny~”\Ç\á\ÆAÚ²\Ðg\'`\ÒÖ§²\Ö.9\Í\Í\àŠbBw#ð¦\ÚJ$v¢\'ç‘—¤\Ò`‘Z©”E0EðF0ï¿°¥\æ\ÚKh¹\å½I\îEfÂ¯¹K\äó96†·7Vöhf‘OM¾oô¥·Zª\ÉžhžÁ\ÙQºý*H¡¼p“^\Þ².ü\ß\éKø†\Õ\îLS (‘ùyFÀV9ò8E¸ö7	(9$Nš½±@¨\Îõ\É\Ü\Ñö÷¶¬ +\ìETdŒg”†\Û\ïZóK››(;Ž†¼g\äùwwü£y¹!ü«ûˆ£`\Ñ\à¿\î¤w7Ì’1x¹ò{µ­¥ú‡\ÃmS<\Ñ\\yPª\ã°\ÖØ¼\Øe|^™\èaò\á“]2¯\ÖI^5^P:m½c\Ã\ÊI\'m«\"\Õ#<\êYH\îZy\ÃV‘´\Â\âp	S˜\Ôþó]·\Å\\Ž‰O‚¶	g\Ãz­úh–;\æC\ÇG\r\ÛEcest¤K=\Ì\Þ;FÀÿ\0\Õ\×Úž\êú°[I-‹r\Í&Q?0=…\'\Òƒc\nÈ¼¢ü\Ù\å\ÇV#\×}¿\n\ëñW/¸\åY¥5²N?\ÔE\Ç‹\í´õÂ¤(¹$ƒ\'·z\ãº\í\Äq@R/*\0O½[¸\ãTk©–(ÝŠF:0\Æõ\ÎuN{«—e\áû\î+¢l¨!tm\ÎPË’rX\Z]©\ÊZLfºt„¨<ªGÖ”N\å\åÉ¬›5Al\ëNl$\Û’\Û\Í\ïÞš\Øe[§j¸\"Õ¦Æ­\nÉ’½O±ÿ\0QL Eò‚Tú:Q£\Þ\Å\Z4rŒ\äœ~#ùL¢¸!\åmˆ\Î\Õ\×\n1c\Í:\Â\Òx\ç¤‚\"\è\ÃlcµG•\É!sœ‚+\ZUÐŠ\î&\È ‚¤õ\Û\Æb“;£c¯½k\×DûüR_\Âñ‘.N\Î=½/™”’\Ãrv9\ìhC*ó#\r¹‡Z\Þ\à¼m\Î\àŽa\çô?\â›°\èž\ÖbŒA\È\ß7¿½E¨Dm\ä\æ‹\äaG§¥@fp¿\'n\ÔLs$°g9\ÈòOj†P\"\Êc`\ãp={ýkYAo2)ó/ñ	\æ»¿Ò¥‹xCn\éõô¨±Ñµ¼\Å_ “¶3Z]•ŠP\é¼o\éÖ£—*\Þ^ý½\ra\\:\Ø\ç=3\ØÒ°7ŽCVÀ¨õ¯\\8\'+òw\Å½\n¿ZÕœ‘\ËÛ°4Xj+’ŽJ\ÍL|\È20ß¥hÇ™\nŸÎ²4j\Øß£{ROc!—*I…B7\ì\å\é\ÜÔ³ö9õ¡ˆ\Ë{ô©cG¦¶\n9\Æ\èhIm#uó(ÞIZ=›t=Em<G${©\r!Š>H\Û0\Ê\è}MÎ¥7YG¾Æ]÷c^„,¤c¨vb=be?¶µo\Õw¦I¼\á\ÊMÍœü”4q©$`«)\ägš°Ð³øŠ\ßU\Ô xm¤ŽHN9\ÛbG¥8\Ò\ï¾7JðŽ\íË‘õ]\âý?•xÁ\Ê\ì}\ÅA\Ã:‡4j\Ç\É\Ì2)r|Ž•h°HÀ÷­N\çÒ¬\é°H9‚õ\ßj\ãM¶¬BW\rŒ¶FÀWò Î©øÓ†Î‘ýQe\ã\È2¡š\Ôò\ç¯^\ÕôF¨f·…`I–G8\r¸Ç¾\Ä8]4A\Äß˜\ç¹BŠ\n\ì\×g¶…­,\Ê\È]\Ï4‡b}\ëeLÇ bdH%Y$t>\\€kôñ¾\ZØ´—=Öˆ7\"E\r“’O@(wS%É’Lc8\Â\Ðkh UUBc›\ç­U%S9\Ïp\r+°ó7+ye^‡\ÔV·öÁ\ï\é®fŽD§j¤\Éhej¾4n\ÈJtõ5/„\ï:\Êf\Â\Ç(;\Z¬\Ý\Ï{m¨4‰+HZ0S \ài¹§4·Bz.0\r\ØU\r%k4‰žYŒDmZUqwfúœzy§Y°\æ\\}³Öµžv‘¹r\È k9Œr\Ê\Ë\Ê;•6P\å½\Ä\Z¢XX\Ü|8™yœ9\É\\v˜\ÉG¨¼—™q’{\Ô6s=ýô×—6\ë\Ñ\r0s•õ£\Ä`€\Ì7÷4\0É\Ä\ÑøÌ¼Ëœ\Í!º©\ZøÎ²CÍ»*\îX¥\ÙO6>¢ƒ½Š3d	%F:÷©c^µŒjmrò\ÈN\è\Ñ\ãõ¡\ï1s>\\Tr¼q\\rJ±­\îB\ÉlZ¹=\ÆÕ™Fü?¬5Å¬–2\í%¿”\àu\Ê\æ/›˜g>a­c‡\'²‡W’\ÎT\Þt\È=²=M8¾·µšÙ¡h\Î`ri\Ú#Ø‰..f^T^ŠGz2\ÚFr:\0ÁÈ¡,´ô°—™$eAŸ/Piº!TFv `~ŠÌˆyr23\ÐV\Ñ@ñ©g=z\àu¢\ÚB9X’G¥fá”Á\å=zšhL\rDœ\ã-\ëZ$wQLdBŒ¤o“½30Á­h\æ\'Ý‚6\ØÓ¡\ZK\Í4%\Ä\æh8T\Ä\å•YÇ­fð¡`©ŒŒQQC*ñ|À\rñŠ@Cl\Ñx\Ì\æŒö\Íiu\à9ŽWF~\í1eŽ\ê.c…$dsmCD\ÞU6\íNÂŒJñSÈŠ½ÙŽô¥kü\Ü\ÊH£V\â)y –v8Ú¼Bø<ÁG61Š@Põ](«I„½½\êµu§)“%~»WN\Ô`€möý*³}h\Ân_(Q\èi\ØY\ìcB‚qÜŽ”?\ÃrÉƒŒ\rŽEZ\î\íy@\åcJ®-\×\'\Ì	¦Sð\ä.U‡M»Pò@˜\ËD	mNa‚Dì¼‡­i%¾Fõ4˜	Å³;MÇ½\rul9eGAM\î-dC\ÍÍŽ\Ô+ª1\æpv¤1bÚžPB‘·F­^Ø·˜E½5ðþöO\åQ¼O\ÌpO®ô\0¡\ë\ä ô¡\ä€ŒoN$Œdo\Ôb„’9cË¶ùö¥`,6\èÀn;\ÔnŠ»r¶þ”\ÂP\Ù\Ù@\Õ\Í\Ê1õ\Î\â‹©\\_FS\á`F-\Ó\ÄS¾}j, R\Zgi$;ò7o­Ggjö\ìs8šc±u\í\ïF,x\' \ç\Ô÷¥,Ÿ>?\Z·\"Q`[9þ¯ƒ$\à{\íCOt¶Ã—,qÒžö[ \"BUGP++:øú$¾’Ëœ¢\ÄH¥÷ðº“*º\Ã4P”‚\ØÚ¤ð‚d}É¬\'‚2\ëG4ü<R\éQ_½´š%,‹\Êþ\Óô¥ñ\Þ<\r“\à\àU\Â\Ö\î\Î71\Ü[øð¶\Ç}\ÅG¨\èV\Û|}¤¼ñø\Ü{\\Y|Zv\Ï77,R\×@pÈ³Æ¼ù\àr¶{Õ†\Æo\ØG\à3ŒóuEV®\Ú\Þ\Ú\Õˆ0rÁNø§\Ü=\×3\ÚB«þõ¨H#†>\ê	ü«<ò–Y\Æ	ý¾Î¹JYZQY\è\×\\Gp‰a\0š\áÛ–Üœ\Z¨<\Î\nŸŒô\rg†ô•ôË†´a&\È+ôÀ\Ü~5ôl\Ú}ž¤\é\Ú„1BB‘@b o“\îj³Ç—–÷\nšL˜1N9}W½z¯\Ìxª1Z;!ãª£\â\ÍN\æ@\Ï9&I˜œž\ÃÚ©¶÷l“L[$°\'õÒ¾\Øô(8Šg²°˜\Éj\É\Ï\'û<ö5Ê¡-\ãž\Ä“]‘È¦”‘<x\éš^¾Ns\Ð~´¼Ÿ6h›¶;\ç½E\\\ÄgaGe ½92rG^ô\Ê/(”-Ê»mR	qÒ´Z%‡‰p6\ê}\è˜õUR\Ø`Òƒ.z’kR\ç\0Õ©\Ñ<Kž¦\âLót9Á4\å\ïa¹Ëœ¸\ß\ëTˆ\äl÷È¢c¸u ótýÕ¤rú%Àºx±˜\Ç(µox“X=¼¾r½7ª…\ÓrE1‚å¢“9Ò´S! ‰¼Kc\ÊAe\ì}>µ˜fó1ü=ýkQ0,\\\0AØ“Q\É!ñc$ \Üû})61•\Ä~4B\\y”a‡§½9±œ\ï\ë{[¸-ò‘ƒ\ß\"´œ…“\Ëò\Òyˆ’<Ž¿{´8%IÔ \Ï\Ý;\Z\ÒEß¨\Îw\ïI‰S\ÊsŸZ\ÒP9A\Æ\Ø\éS!\Ûö5 Œ©\Ç.6¤0Nb[\éû«d\Æz\×Á#a\×\é^Íƒ¸\ïI\Z\îG(\ßz‹”s`žµ)nV\ÆH\Ç_qX‘y†{~\ê@Fw~¦¤°”$†\Ý\ÎA;f°¤cl\à\ÔR\00ÀoIŒž\æ\Ø\Âr7B*„\åe\ÆrcÒ˜\ÙÌ“Fbõ õ\ZÊƒh`yX‚§ \Î(¨Š’\Ã\Ôf\Ï2\äw4Rl¬(]QV[\\\Ã\rT\Ø\ÓÀ\ÔYÀ\rµ\\®N\åsÂª:ŽSq‘úŠ‰Ž\'C¸\Ö\í\í\Ð&K0ÀÀ«Ge«A*\Ü$W‰\Ã)-ò)g\Û5@¿µº½¸‰\í×›\â!IX\ãe\'cú‚\Z»}œ@º_‹DdI0f`<\Çn‚¼¼\Ø\á\Ò\ìô¡žy\Zµ£\èmò{{{Ym3D\Û\Ô\Ö[\Ów³Ý’9³\Ê\èEs{Ë¨¢Ž\Êó‘\âCpU\Î\ÊÃµX8Sˆ\Ô\Ï4ºœsŽ§½<9dô\ÌòAv‹\ÄW$\nƒ¶6Úµ’+h\Â\È1ß­Vlµ»½D­Ÿ”°ùOaO$–6lFuÅ¦Œ\Zk°Õ¼dX(\r¿­O$\é#róÖ–H¶\ÒF\Å\Ðd\ç¸5£\Ü\ÃVi\×<¸óµD†\Ç:Cs0b\\’0OAP\\¹–L\Â\â7\ÇPz\ÖQ	\æVÜœ\æ¶Hbñ‰aœRlu¾ŠIŒó`\Ôw\Zƒ\Ä¿Á\Ìó1ÂŒl\Z6X£GW\çp¼…I\å÷¥7W³ß¢\és%\Ã[)!˜m“@]\Ùj3Û™ \"\Ú\å†s@\Ûj\Zý½\âX\Ì\ë$\Ü\Ø%\ãò\ã\Ô\Zk§\ê\×q$q\êVŒŒF\îA4tò\Û]ã‘÷\r\é€=Ôš¨ƒöV\Öò0ùˆ|V™\Ôfƒ’[h‘OøóQj\Z„\Ö\Í,!¡\'\êwQD\Ú_Aw0JË¾(X\Öt\ëˆ\Ç\Ä*p@=(VòÀ\ÒVMedøw\0±‹j®E2òx.•Žw\íY´Z;£0h\äea(<\ØÞ®v–÷\Ñb\æ\ínA.\n\Õ^úH\ÙcPz\á½)Î•=îž‡\Âx\Õ|¥±ÔŠq»cÅ†NÁ@\ÎhX/Ã³\Ç\á°+\ê*p±]°\Ì3Qˆ V,s¿­0<¥¥PH\Ý½)x\Ê\ásŽ\Ãø×º\á ±©Ÿ\rŒ›9\ïšhšRy‰P¥j|\ïû7 ó[l€\æaQÁ+°$¨L’7\ï@Œ”ÌŽw\ÏQ^Uu§@éžµ›•Q(f\\.=qŠÙž \Ùm\Ô.rh’1—¥sˆ’g\Ì6\ïQ\É$IÔ§nQ\éZ©\äbO0ô\È\é@\É\îò•†5l\ì\Ù=+U‡’5\å8#¯z‚)X;¯!<\Ç;Ô‹)\ÊgañL\å·I9Ë¸­$¿ŽfFR\Äz$€‚ª½¨²ø\ê00¹-Š@Qõ«ƒj¼ñ\Û—\×=*·s«¦7·+ô®‹5ºN9IW\ÉôÚ«šŸ\Û<Í•T¯/CUh—b¸¡[#‡UW\\¶â¡‚ß‘±ñ\Æ:\ã­9‡EK+7C1x\ß|œP	cÜ’1S¸\éH(\æ5m°w\ï@Î‚%!\ß\×4òhB&H-\ìGJkQ<g‘—\n24\Äñ7<V.¹>a\éPOŒ¤«ù»fuž\"	U\å¢b[,X`ô€Te.\Ì`gcšÔ¦\ÜÌ¤:cqL1\Î9s¿\\tühib˜I4†-“)cËƒBº°rUv4\Í\àW^I\Ôâ¡‘UFÛµ\0t—\Âôú\ÔóJ‘€_\ßQ\Ý\Ï,|Áœlµ*¸f¹<\Ì\ìF}v‰kf\×s	\ä%q\Ë\ÓzŠ)U\\c\è3X1ªG\È0\ÐVpBŒÂ’E7F\äóò®	©f\rx0Ž\Ë?p£<\Ô<¼ .;Ö¶\×rZ3\\$€?Eö©œ\ÔfY2(E¶{%­”\\“\ÎUý\0óR¦\â‹8.?«e,\ï‚Rq\Û\ïô¢u6º\Ì\Ã\Ì\Çs¾õ]›M»–ü,*\ÈÀ‘\Óó\\ÿ\0Q\Ílóeä¼h±iúzñ%\Ä\Ñ\Ú\Þ%œ\Öð¬²\Æ\ã#›\'+‘\ÛÞº\Ïôl\á\ë½WŒ›]½A$V‰\ËvPÀŠ\ã\Ü\'¦\ÝEª´V¤ø—øq\ÕI¯´~\Êxv>\á{~@·(yq¶Âº¼_‹›GVñW?´M#Už\ê=SIøH\î‘<2%‘”\È;\0Ep\æ\âr\Ã]Ô—Œí¥õºn¬v‘;=\r}#x¦\æùy€1\Ã\ç\ß×µ|÷ý.5\í9´\ë},\"\ä~t|\É\ë[eña\ÇF°\Ê\ïg\Íhz\íÆ«©]]³žg}¾•Ky\Ëzé¶¢\æDrM(m–ž5Q¢¥\Ùžgö*oZ(\0d\ëu$ô«B$\rŽ†³\ÌMa#\É2\ÆNûU\Z†\é½m\Ê\ßZ&4ÊŸ¥O¸cZ¥Xd›µ\Êôÿ\0Ú·š\ÔÆ¼\Ø\ØVˆJ8¥RT&\Éa‘Ð•\ßÒŽ‚b\Ã;\n\ã\æ\×\èM`?!Ø?}ZtHú\Ý\Ð\'_ÎŠ†\ë;gc\Ô\Õ_\ã@#¶\Ç\éD-ù\æ\Üâ«˜¸±\Í\Ú5¹3\ÄKC\Ý»\ïô©ceŒlúP–:œ_Ù¾\ÊAô¨¦Si\'4GšùO÷O¥&\ÅC4l÷\éú\nØ•+ô\Û\ê;PVó‡9\Û>˜©üL0\Ëo\ë\è(°%S‡ ä·¥b\àläŽ‚µ\Ï^\ç÷Ö³\å\Î\Ã0F>l\ãÖ¢#\'¡\Ûlú\Ö\Ñ6¶\ãÚ°7C·Ö\Íe^e\æ9\Ï|÷­ve#\Æ\ÔA\å*yþ˜¡s‰	;ö\ë@$d°\ë^l{~5‡\06v8\Ü\nÁ#·\áHf±HT\í’Â›Àñ\Þ@cN\ÄR\\\æÿ\0>Æˆ‚cóƒ\Ð\ï\ïBbhÙŒm¸µN„c>´\ÞUK«uq¾E)dhf(ûC@ŒJ\Ü\È¸Þ«šü8>()\Ï\áV\'2Žû\Ð\Z”BH»ƒQ%hh±ð\äwœ?3~\Ò\á~ª\ã¢j6AÌ¥K+“ýŸ\Ü\Ì.¥Ó¢A$“Ù¡\î\ãý+¡\Ûð\ïJ¡›L…3¾\æ¼ü\Ø\\§\É˜ò¥,´Á\Äˆ\Ã%	\î+7<HgE†\ÝA*:\çø\Ò(8WZožw\Ë\Z{¦ðM\å\ÒxR\Îv\æH—úš§/l¯©HuöSu&£\Å\Ë\Ë\'<P\ä\Ë \è[²Š\ì‹k+º°˜€[u©ü\Â\Ñh±¨‚.A\é\ëWpþò’NFk«\ZQTa&Û²’\í]€ó6\0a½ºr“þð‰<„¿L\Ñ0I,·lÿ\0”lyš±-\Ë\Æ\åZ\ÝÃ0\Û9ªd‘Y\Ã=°`QV,ùIlòûQ¶\Þ0 8=\Çzn£™AEcÝ…i+^I*µ‰+\'œ¿OÂ€\'\Öu+m:\Ù\Ã\ÈŽ\nˆ\ÇS@ðõý \ÓtŽMÄ‹Ñ‡½Föö\Ö-$·–òO\Ì\Ù2Ÿ0JAdfŠ\î%–QËœ\r\è\0‰µx\Ú\ÚOMp\É\ÐF:R•\×\Îbº\Òñ!\èñõZblbŽV{tðd#\æ>˜¬ÚªÈ¾5\Âb\ØGQ\ëE€%Ì¦\îXV{+£c\æÏ­\Z±\éð\â8­]y†y\ÎF½fd“›Ä¶›\Ø!m\Í#xr~a@h¢ž°\Êø\nwVÈª¬(›šX”ù\È\'¹¦z¥¿\Â\É\âA9U|–ŒT#M\Ô\Ù59m²m¹³\Ðú\â¥\Û\Z\ßŒr`ÍœzV\Ü!\'.¡=‰fÄºú~f¦ö—T,\è2¥&³ñÿ\0®m\ÚÜ˜\Ë69Ž\Øõ¤†ú-òA\ÈÌ§}¶¨…\\²Œô \Z2E’)A\'\ÄQ÷ŽÙªþ§w\"\Ï\'€c\0nÀ\ëD¬†\è2\ê9JV½ð2qQÃžBy¹×±\Îõ½¬ž-¬LX†a‚\Z±ò;\á@¾’\Ü%\æ\æÊ‹\ß\rµoiÇ—I“¡\æ9­&RòyI úTÑ˜\á\Î@!\Þ!¸QŒ\Ø\r’•-©hINRÉŽû\Ö\"µ…\çø€\Ä07Ú¥t\Ã\ã}\Æ=©ØŒ¬Ñ»•(F:mŒW°ól`ú\ÐSG79’=ó¶KV~\Ð$Ø°ÿ\0\Ô\0CB\æ&Ee\Ël	=\rC\n\É®eSƒ\ÔTR%Ë“7‹\Ø°¨Á“\ÃUf®w\ÈýiØ‚RñY	<Á—¹­\ÉÊ c\ÍÞƒº,\Ðò—l–5ªQƒ\á²Ô†,Vö\è\Ä\à9;ã ¥\×CpÜ¿tný\Ô\â\å™<D¬:\ÐQ\ÛE\àŸ¶0v4Mz±.!2Ç¾Ü¤\ÒiQV\ç\á\âòg>ž\Õf¹\Óc0‰]¾q“Kn-§G\æŽ1\Êw\éÖ€ ,[Ÿq¹¨n>Ÿ;#‘ß¡§Hñ\Ê9®{R\çŽ\çŠh\Ç_)QBy·tl\Èy—¸$_\ï$¶§‰	\Ê\ì^‡â†¶@ü\êÑªm±Ñ… ±H`á‚\Í\ÜA4²KW\Ô\Ó	­\â7%˜c”\äZJ¡o|»j\0Q20B\ÄmCH‰\ß)”§’\\Œ¸#¥p1\äF\É\ßz\0µ4R;—rb¥\r¿*\Æú\Ôkt¢&\å\í\Üô¨¬\îš\áY4…z°\'\ÐûV\rû4º2\Ö\\\çŽøþ\è\Íj\ÑreV@:ób·3\ê\ì¦3zöˆ:,(\0?ZY¬@\é\É%ý\Ì\î\Ç‘²1X¼²[\ã¯\å\Ï,âœšÿ\0&·üCs,I¾3Ö•\\\Þ\Ã\"\rœ²\äL\ÑW\r','2001-10-26','00:00:00',NULL,949619841,'#74 Bakakeng Street, Baguio City','Axl Rose'),(2222613,'2222613@slu.edu.ph',9333,2,1,1,'Kaizer','Oman',NULL,NULL,NULL,'2002-08-19','08:00:00',NULL,999999999,'#73 Bakakeng Street, Baguio City','Henry Cavill');
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
INSERT INTO `users` VALUES ('2214027@slu.edu.ph','$2b$10$spu8v43uLwNnpgH9FCg9EuQ/nO31MiKYkfyJmZf45CGxCpWBOqn5G','student'),('2222613@slu.edu.ph','$2b$10$AASMjbqWSFKGl4IDpCG3gej2GnRF6k3g9o234Sna/sBwhLKI9fRrS','student'),('lanadelrey@slu.edu.ph','$2b$10$.NyqdKwIu6RAQUUgglxTqOAyZt7H7b/YnTU2kMqAawvonkP0E4WjS','teacher');
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

-- Dump completed on 2023-12-03 19:30:27
