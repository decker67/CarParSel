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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_identifier` varchar(255) DEFAULT NULL,
  `car_brand_id` varchar(255) DEFAULT NULL,
  `engine_code` varchar(255) DEFAULT NULL,
  `gearing_code` varchar(255) DEFAULT NULL,
  `color_code` varchar(255) DEFAULT NULL,
  `model_type_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `date_of_construction` date DEFAULT NULL,
  `cylinder_capacity` int(11) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `gearing` int(11) DEFAULT NULL,
  `key_number2` varchar(255) DEFAULT NULL,
  `key_number3` varchar(255) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `ebay_url_all_parts` varchar(255) DEFAULT NULL,
  `name_ebay_url_all_parts` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cars_on_car_identifier` (`car_identifier`),
  KEY `index_cars_on_model_type_id` (`model_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (2,'BMW735E6501','','N62B36A','GA6HP26Z','M482 - Toledoblau',2,3000,200,'2002-03-21',3600,0,0,'0005','723',225000,2,'http://autohalle24.de/ebay/BMW_E65/spenderfahrzeug_e65.jpg','http://stores.ebay.de/autohalle24de/7er-Reihe-735i-E65-Bj-2002-/_i.html?_fsub=8267616013&amp;_sid=1194913183&amp;_trksid=p4634.c0.m322','BMW 7\'er Reihe\r\n735i E65 Bj. 2002','2014-06-15 13:14:28','2014-06-23 16:09:10'),(3,'OPEL16ASTRAF01','W0L000058V2132885','X16SZR','','',3,100,55,'1997-05-28',1598,0,1,'0039','863',152000,3,'http://autohalle24.de/ebay/Opel/Astra/F/K1600_SpenderfahrzeugAstraF.JPG','http://stores.ebay.de/autohalle24de/Astra-F-CC-1-6-i-Bj-1997-/_i.html?_fsub=8883875013','OPEL Astraf F CC\r\n1,6 i  Bj. 1997','2014-07-10 18:18:26','2014-07-15 17:39:26'),(4,'KIA25SORENTOJC01','KNEJC521535159674','D4CB','','',4,1500,103,'2003-07-23',2497,1,1,'8253','343',301567,4,'http://autohalle24.de/ebay/KIA/Sorento/JC/Spenderfahrzeug_Kia_Sorento.jpg','http://stores.ebay.de/autohalle24de/KIA-Sorento-2-5-CRDi-Bj-2003-/_i.html?_fsub=8973296013','KIA Sorento\r\n2.5 CRDi JC Bj. 2003','2014-07-29 10:33:03','2014-07-29 16:57:21'),(5,'NISSAN12MICRAK1201','','CR12','','',5,800,48,'2006-09-28',1240,0,1,'3144','AAM',77000,5,'http://autohalle24.de/ebay/MICRA_K12/spenderfahrzeug_K12.jpg','http://stores.ebay.de/autohalle24de/Micra-III-K12-1-2-16V-Bj-2006-/_i.html?_fsub=8173673013','Nissan Micra 1,2 16v\r\nK12 Bj. 2006','2014-08-02 10:02:14','2014-08-02 10:24:37'),(7,'MERCEDESTEILE','asFwfsdfgEFwqef','','','sadf',6,NULL,23,'2001-01-01',1234,0,1,'','',NULL,5,'','','','2014-08-06 14:22:25','2014-08-06 14:45:42'),(8,'TOYOTATEILE','SDEGF','','','<ysd',7,1,34,'2001-01-01',1234,0,1,'','',NULL,5,'http://autohalle24.de/ebay/Toyota/PRIUS_PLUS.png','','','2014-08-07 09:40:38','2014-08-07 10:33:28'),(9,'SEAT18CORDOBA6K101','','1F 256700','','',8,150,66,'1997-05-01',1781,0,1,'','',176000,5,'','','','2014-08-07 15:39:18','2014-08-07 15:40:39'),(10,'OPEL16VECTRAB01','W0L0JBF35W1338105','X16XEL','','',9,100,74,'1998-12-29',1598,0,1,'0039','961',NULL,5,'http://autohalle24.de/ebay/Opel/Vectra/B/spenderfahrzeug_vectra_B.png','','Opel Vectra B Caravan\r\n1,6i 16v Bj. 1998','2014-08-11 10:59:55','2014-08-12 09:16:54'),(11,'FORDTEILE','jhg654654654','kjhg','','',10,NULL,55,'2000-01-01',2121,0,1,'2154','754',221421,5,'','','','2014-08-27 07:54:03','2014-08-27 08:06:46'),(12,'VWTEILE','sdf23454576','agfg','','',11,NULL,34,'2000-01-01',1212,0,1,'1234','123',123456,5,'','','','2014-08-27 08:10:16','2014-08-27 08:10:16'),(13,'OPELTEILE','kjh5645646546','','12345','',12,NULL,44,'2000-01-01',1234,0,1,'1234','567',123456,5,'','','','2014-08-28 14:39:13','2014-08-28 14:39:13'),(14,'PEUGEOT1420601','VF32CKFXF41054853','TU3JP ','','',13,500,55,'2000-09-06',1360,0,1,'3003','864',161000,6,'http://autohalle24.de/ebay/PEUGEOT/206/2A-C/Spenderfahrzeug_peugeot_206.jpg','http://stores.ebay.de/autohalle24de/Peugeot-206-1-4-i-Bj-2000-/_i.html?_fsub=9158271013','PEUGEOT 206 Schrägheck\r\n1,4 i - 2A/C - Bj. 2000','2014-09-02 12:45:26','2014-09-02 12:58:58'),(15,'VW14LUPO01','WVWZZZ6XZYW021390','APE','','',14,300,55,'1999-09-21',1390,0,1,'0603','451',194339,6,'http://autohalle24.de/ebay/VW/LUPO/6X1-6E1/Spenderfahrzeug_VW_LUPO.jpg','http://stores.ebay.de/autohalle24de/Lupo-1-4-16v-Bj-1999-/_i.html?_fsub=9209081013','VW Lupo \r\n1,4i 16v Bj. 1999','2014-09-15 13:28:25','2014-09-15 14:02:41'),(16,'SAAB23T9-5YS3E01','YS3EB55E633013879','B235E','','',15,750,136,'2002-10-23',2290,0,1,'9116','411',287905,6,'http://autohalle24.de/ebay/SAAB/9-5/YS3E/Spenderfahrzeug_Saab.jpg','http://stores.ebay.de/autohalle24de/9-5-Kombi-2-3-turbo-/_i.html?_fsub=9362673013','Saab 9-5 Kombi\r\n2,3 turbo Bj. 2002','2014-10-14 14:18:51','2014-10-14 14:40:37');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
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
