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
-- Table structure for table `model_types`
--

DROP TABLE IF EXISTS `model_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_model_id` int(11) DEFAULT NULL,
  `model_type` varchar(255) DEFAULT NULL,
  `month_of_construction_period_from` int(11) DEFAULT NULL,
  `year_of_construction_period_from` int(11) DEFAULT NULL,
  `month_of_construction_period_to` int(11) DEFAULT NULL,
  `year_of_construction_period_to` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_model_types_on_model_type_and_brand_model_id` (`model_type`,`brand_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_types`
--

LOCK TABLES `model_types` WRITE;
/*!40000 ALTER TABLE `model_types` DISABLE KEYS */;
INSERT INTO `model_types` VALUES (2,2,'E65',11,2001,NULL,NULL,'2014-06-15 13:00:35','2014-06-15 13:00:35'),(3,3,'F',9,1991,1,1998,'2014-07-10 18:20:20','2014-07-10 18:20:20'),(4,4,'JC',8,2002,11,2009,'2014-07-29 10:25:03','2014-07-29 10:56:31'),(5,5,'K12',1,2003,6,2010,'2014-08-02 10:00:24','2014-08-02 10:02:32'),(6,6,'MB-Sonstige',1,1900,1,1900,'2014-08-06 14:21:33','2014-08-07 09:42:36'),(7,7,'TO-Sonstige',1,1900,1,1900,'2014-08-07 09:42:26','2014-08-07 09:43:25'),(8,8,'6K1 / 6K2',2,1993,6,1999,'2014-08-07 15:36:30','2014-08-07 15:36:30'),(9,9,'B',11,1996,7,2002,'2014-08-11 10:41:20','2014-08-11 10:41:20'),(10,10,'FO-Sonstige',2,1904,5,1916,'2014-08-27 08:00:00','2014-08-27 08:00:00'),(11,11,'VW-Sonstige',4,1904,6,1916,'2014-08-27 08:09:25','2014-08-27 08:09:25'),(12,12,'OP-Sonstige',5,1906,7,1914,'2014-08-28 14:38:19','2014-08-28 14:38:19'),(13,13,'2A/C',9,1998,NULL,NULL,'2014-09-02 12:29:27','2014-09-02 12:29:27'),(14,14,'6X1 / 6E1',9,1998,7,2005,'2014-09-15 13:22:57','2014-09-15 13:22:57'),(15,15,'YS3E',1,2001,NULL,NULL,'2014-10-14 14:08:54','2014-10-14 14:08:54');
/*!40000 ALTER TABLE `model_types` ENABLE KEYS */;
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
