CREATE DATABASE  IF NOT EXISTS `carparsel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `carparsel`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: carparsel
-- ------------------------------------------------------
-- Server version	5.6.17-log

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
-- Table structure for table `postages`
--

DROP TABLE IF EXISTS `postages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `postage_germany` decimal(18,2) DEFAULT NULL,
  `postage_austria` decimal(18,2) DEFAULT NULL,
  `postage_swiss` decimal(18,2) DEFAULT NULL,
  `postage_europe_with_eu` decimal(18,2) DEFAULT NULL,
  `postage_europe_without_eu` decimal(18,2) DEFAULT NULL,
  `postage_world_wide` decimal(18,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postages`
--

LOCK TABLES `postages` WRITE;
/*!40000 ALTER TABLE `postages` DISABLE KEYS */;
INSERT INTO `postages` VALUES (1,'Päckchen Mini',0.00,4.90,9.90,4.90,9.90,NULL,'2014-07-01 21:20:55','2014-07-01 21:20:55'),(2,'Päckchen DE',0.00,10.99,24.99,10.99,24.99,NULL,'2014-07-01 21:21:30','2014-07-01 21:21:30'),(3,'Paket bis 10 kg',0.00,16.99,29.99,16.99,29.99,NULL,'2014-07-01 21:25:15','2014-07-01 21:25:15'),(4,'Versandtasche bis 500 g',0.00,2.99,2.99,2.99,2.99,2.99,'2014-07-01 21:29:44','2014-07-01 21:30:58'),(5,'Versandtasche bis 1000 g',5.99,5.99,5.99,5.99,5.99,5.99,'2014-07-01 21:30:07','2014-07-01 21:31:16');
/*!40000 ALTER TABLE `postages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-15  0:37:58
