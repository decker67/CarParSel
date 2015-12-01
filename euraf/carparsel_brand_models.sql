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
-- Table structure for table `brand_models`
--

DROP TABLE IF EXISTS `brand_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_brand_models_on_name_and_brand_id` (`name`,`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_models`
--

LOCK TABLES `brand_models` WRITE;
/*!40000 ALTER TABLE `brand_models` DISABLE KEYS */;
INSERT INTO `brand_models` VALUES (2,'735',1,'2014-06-15 12:59:41','2014-06-15 12:59:41'),(3,'Astra 1,6i',6,'2014-07-10 18:19:32','2014-08-04 16:49:37'),(4,'Sorento 2.5 CRDi',7,'2014-07-29 10:22:51','2014-07-29 10:55:45'),(5,'Micra 1,2 16v',8,'2014-08-02 09:59:28','2014-08-02 10:25:12'),(6,'MB-Teile',5,'2014-08-06 14:21:05','2014-08-27 07:59:19'),(7,'TO-Teile',10,'2014-08-07 09:41:09','2014-08-27 07:59:27'),(8,'Cordoba 1,8l',11,'2014-08-07 14:47:08','2014-08-07 15:32:37'),(9,'VECTRA Caravan 1,6i 16v',6,'2014-08-11 10:38:23','2014-08-11 11:02:29'),(10,'FO-Teile',4,'2014-08-27 07:58:11','2014-08-27 07:59:34'),(11,'VW-Teile',3,'2014-08-27 08:09:05','2014-08-27 08:09:05'),(12,'OP-Teile',6,'2014-08-28 14:37:52','2014-08-28 14:37:52'),(13,'206 Schrägheck 1.4 i',2,'2014-09-02 12:24:42','2014-09-02 12:24:42'),(14,'Lupo 1,4 16v',3,'2014-09-15 13:21:06','2014-09-15 13:22:06'),(15,'9-5 Kombi 2,3 t',12,'2014-10-14 14:08:19','2014-10-14 14:08:19');
/*!40000 ALTER TABLE `brand_models` ENABLE KEYS */;
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
