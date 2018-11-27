-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: taxi24Api
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `names` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `status` varchar(8) NOT NULL,
  `availability` varchar(13) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_driver_location_id` (`location_id`),
  CONSTRAINT `fk_driver_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Niyonshuti Innocent','MALE','1990-07-24','ACTIVE','AVAILABLE',2),(2,'Mutoni Muvara Doreen','FEMALE','1993-02-10','ACTIVE','AVAILABLE',1),(3,'Teta Hope','FEMALE','1995-09-11','ACTIVE','AVAILABLE',3),(4,'Mukamana Chantal','FEMALE','1995-09-11','ACTIVE','NOT_AVAILABLE',3),(5,'Gaju Bruce','MALE','1989-01-01','ACTIVE','AVAILABLE',NULL);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'downtown'),(2,'muhima'),(3,'Kinamba');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_distance`
--

DROP TABLE IF EXISTS `location_distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_distance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_a_id` bigint(20) DEFAULT NULL,
  `location_b_id` bigint(20) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_location_distance_location_a_id` (`location_a_id`),
  KEY `ix_location_distance_location_b_id` (`location_b_id`),
  CONSTRAINT `fk_location_distance_location_a_id` FOREIGN KEY (`location_a_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_location_distance_location_b_id` FOREIGN KEY (`location_b_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_distance`
--

LOCK TABLES `location_distance` WRITE;
/*!40000 ALTER TABLE `location_distance` DISABLE KEYS */;
INSERT INTO `location_distance` VALUES (1,1,2,1.5),(2,1,3,4),(3,2,1,2.5),(4,2,3,6.2),(5,3,1,2.8),(6,3,2,7.2);
/*!40000 ALTER TABLE `location_distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rider`
--

DROP TABLE IF EXISTS `rider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `names` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_rider_location_id` (`location_id`),
  CONSTRAINT `fk_rider_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rider`
--

LOCK TABLES `rider` WRITE;
/*!40000 ALTER TABLE `rider` DISABLE KEYS */;
INSERT INTO `rider` VALUES (1,'Niyoyita Paul','MALE','1990-10-11',2),(2,'Rwabuhungu Eric','MALE','1982-09-21',1),(3,'Uwantege Oliver','FEMALE','1991-01-01',3);
/*!40000 ALTER TABLE `rider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trip_date` date DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `driver_id` bigint(20) DEFAULT NULL,
  `rider_id` bigint(20) DEFAULT NULL,
  `status` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_trip_location_id` (`location_id`),
  KEY `ix_trip_driver_id` (`driver_id`),
  KEY `ix_trip_rider_id` (`rider_id`),
  CONSTRAINT `fk_trip_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `fk_trip_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `fk_trip_rider_id` FOREIGN KEY (`rider_id`) REFERENCES `rider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,'2018-11-27',2,4,1,'REQUESTED'),(2,'2018-11-27',3,2,1,'REQUESTED');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-27 16:20:47
