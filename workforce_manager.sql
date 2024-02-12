-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: workforce_manager
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_employee` (`employee_id`),
  CONSTRAINT `fk_address_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES
(1,'Wilmington',1,'Delaware','123 Mifflin Lane',19720),
(2,'Middletown',2,'Delaware','555 Harbor Street',19722),
(3,'New Castle',3,'Pennsylvania','111 Long Road',77322);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `fk_attendance_employee` (`employee_id`),
  CONSTRAINT `fk_attendance_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES
(1,'2024-02-01',1,'08:00:00','17:00:00'),
(2,'2024-02-01',2,'08:00:00','17:00:00'),
(3,'2024-02-01',3,'08:14:34','17:00:00');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information`
--

DROP TABLE IF EXISTS `contact_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_information` (
  `contact_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_phone` varchar(255) DEFAULT NULL,
  `employee_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `fk_contact_information_employee` (`employee_id`),
  CONSTRAINT `fk_contact_information_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information`
--

LOCK TABLES `contact_information` WRITE;
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
INSERT INTO `contact_information` VALUES
(1,1,'555-0001','john.doe@email.com'),
(2,2,'555-0002','dean@deanwalls.com'),
(3,3,'555-0003','nastya@email.com');
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_head_id` int(11) DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  KEY `fk_department_head_employee` (`department_head_id`),
  CONSTRAINT `fk_department_head_employee` FOREIGN KEY (`department_head_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES
(1,2,'Human Resources'),
(2,1,'Engineering'),
(3,3,'Marketing');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_department` (`department_id`),
  KEY `fk_employee_manager` (`manager_id`),
  CONSTRAINT `fk_employee_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `fk_employee_manager` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES
(1,'John','Doe','1985-01-15','Male','2015-06-23',NULL,'Senior Developer',130000.00,NULL),
(2,'Dean','Walls','1999-09-09','Male','2022-01-23',NULL,'Junior Developer',90000.00,1),
(3,'Anastasia','Bezrabotnyy','2010-01-15','Female','2024-01-19',NULL,'Junior Developer',90000.00,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_management`
--

DROP TABLE IF EXISTS `leave_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_management` (
  `leave_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `leave_type` enum('personal','sick','vacation') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `fk_leave_management_employee` (`employee_id`),
  CONSTRAINT `fk_leave_management_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_management`
--

LOCK TABLES `leave_management` WRITE;
/*!40000 ALTER TABLE `leave_management` DISABLE KEYS */;
INSERT INTO `leave_management` VALUES
(1,1,'2024-02-08','vacation','2024-02-03'),
(2,2,'2024-02-10','personal','2024-02-09'),
(3,3,'2024-02-12','sick','2024-02-11'),
(4,3,'2024-02-15','vacation','2024-02-14');
/*!40000 ALTER TABLE `leave_management` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-12 12:48:34
