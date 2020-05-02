-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `AUTO_INSURANCE_POLICY`
--

DROP TABLE IF EXISTS `AUTO_INSURANCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTO_INSURANCE_POLICY` (
  `INSURANCE_POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT ' A/H represents Automobile/Home Insurance Policy.',
  `VEHICLE_QUANTITY` int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity of vehicle insured in this insurance policy.',
  `AUTO_INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`INSURANCE_POLICY_ID`),
  CONSTRAINT `AUTO_POLICY_POLICY_FK` FOREIGN KEY (`INSURANCE_POLICY_ID`) REFERENCES `INSURANCE_POLICY` (`INSURANCE_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTO_INSURANCE_POLICY`
--

LOCK TABLES `AUTO_INSURANCE_POLICY` WRITE;
/*!40000 ALTER TABLE `AUTO_INSURANCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTO_INSURANCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRIVER`
--

DROP TABLE IF EXISTS `DRIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVER` (
  `DRIVER_LICENSE_ID` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `DRIVER_FIRST_NAME` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DRIVER_LAST_NAME` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `DRIVER_BIRTHDATE` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`DRIVER_LICENSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRIVER`
--

LOCK TABLES `DRIVER` WRITE;
/*!40000 ALTER TABLE `DRIVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `DRIVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOME`
--

DROP TABLE IF EXISTS `HOME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOME` (
  `HOME_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOME_PURCHASE_DATE` datetime NOT NULL,
  `HOME_PURCHASE_VALUE` decimal(10,2) NOT NULL,
  `HOME_AREA` decimal(10,2) NOT NULL,
  `HOME_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT 'S for Single family.\n            M for Multi family.\n            C for Condominium.\n            T for town house.',
  `AUTO_FIRE_NOTIFICATION` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1/0 represents there is/isn''t automatic fire notification to the fire department. ',
  `HOME_SECURITY_SYSTEM` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1/0 represents the home security system is/isn''t installed and monitored.',
  `SWIMMING_POOL` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'U for Underground swimming pool.\n            O for Overground swimming pool.\n            I for Indoor swimming pool.\n            M for Multiple swimming pool.\n            null for No swimming pool.',
  `BASEMENT` decimal(1,0) NOT NULL DEFAULT '0' COMMENT '1/0 represents there is/isn''t a basement.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `INSURANCE_POLICY_ID` int(11) NOT NULL,
  `INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`HOME_ID`),
  KEY `HOME_HOME_POLICY_FK` (`INSURANCE_POLICY_ID`),
  CONSTRAINT `HOME_HOME_POLICY_FK` FOREIGN KEY (`INSURANCE_POLICY_ID`) REFERENCES `HOME_INSURANCE_POLICY` (`INSURANCE_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOME`
--

LOCK TABLES `HOME` WRITE;
/*!40000 ALTER TABLE `HOME` DISABLE KEYS */;
/*!40000 ALTER TABLE `HOME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOME_INSURANCE_POLICY`
--

DROP TABLE IF EXISTS `HOME_INSURANCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOME_INSURANCE_POLICY` (
  `INSURANCE_POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT ' A/H represents Automobile/Home Insurance Policy.',
  `HOME_QUANTITY` int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity of home insured in this insurance policy.',
  `HOME_INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`INSURANCE_POLICY_ID`),
  CONSTRAINT `HOME_POLICY_POLICY_FK` FOREIGN KEY (`INSURANCE_POLICY_ID`) REFERENCES `INSURANCE_POLICY` (`INSURANCE_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOME_INSURANCE_POLICY`
--

LOCK TABLES `HOME_INSURANCE_POLICY` WRITE;
/*!40000 ALTER TABLE `HOME_INSURANCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `HOME_INSURANCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSURANCE_POLICY`
--

DROP TABLE IF EXISTS `INSURANCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSURANCE_POLICY` (
  `INSURANCE_POLICY_ID` int(11) NOT NULL,
  `INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT ' A/H represents Automobile/Home Insurance Policy.',
  `INSURANCE_POLICY_START_DATE` datetime NOT NULL COMMENT 'Start date of this insurance policy.',
  `INSURANCE_POLICY_END_DATE` datetime NOT NULL COMMENT 'End date of this insurance policy.',
  `INSURANCE_POLICY_STATUS` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT ' C/P represents home insurance policy term is current/expired.',
  `INSURANCE_POLICY_PREMIUM` decimal(10,2) NOT NULL COMMENT 'Premium amount of this insurance policy.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`INSURANCE_POLICY_ID`),
  KEY `POLICY_USERS_FK_idx` (`id`),
  CONSTRAINT `POLICY_USERS_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSURANCE_POLICY`
--

LOCK TABLES `INSURANCE_POLICY` WRITE;
/*!40000 ALTER TABLE `INSURANCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSURANCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVOICE` (
  `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYMENT_DUE_DATE` datetime NOT NULL,
  `INVOICE_AMOUNT` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `INSURANCE_POLICY_ID` int(11) NOT NULL,
  `INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`INVOICE_ID`),
  KEY `INVOICE_POLICY_FK` (`INSURANCE_POLICY_ID`),
  CONSTRAINT `INVOICE_POLICY_FK` FOREIGN KEY (`INSURANCE_POLICY_ID`) REFERENCES `INSURANCE_POLICY` (`INSURANCE_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENT`
--

DROP TABLE IF EXISTS `PAYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAYMENT` (
  `PAYMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAYMENT_DATE` datetime NOT NULL,
  `PAYMENT_METHOD` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'WDS accepts payment either as PayPal, Credit, Debit, Check.',
  `PAYMENT_AMOUNT` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `INVOICE_ID` int(11) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `PAYMENT_INVOICE_FK` (`INVOICE_ID`),
  CONSTRAINT `PAYMENT_INVOICE_FK` FOREIGN KEY (`INVOICE_ID`) REFERENCES `INVOICE` (`INVOICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENT`
--

LOCK TABLES `PAYMENT` WRITE;
/*!40000 ALTER TABLE `PAYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICLE`
--

DROP TABLE IF EXISTS `VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VEHICLE` (
  `VEHICLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VEHICLE_VIN` varchar(20) COLLATE utf8mb4_bin NOT NULL COMMENT 'Vehicle identification number.',
  `VEHICLE_MAKE_MODEL_YEAR` datetime NOT NULL,
  `VEHICLE_STATUS` char(1) COLLATE utf8mb4_bin NOT NULL COMMENT ' L, F, or O represents Leased, Financed, and Owned',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `INSURANCE_POLICY_ID` int(11) NOT NULL,
  `INSURANCE_POLICY_TYPE` char(1) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`VEHICLE_ID`),
  KEY `VEHICLE_AUTO_POLICY_FK` (`INSURANCE_POLICY_ID`),
  CONSTRAINT `VEHICLE_AUTO_POLICY_FK` FOREIGN KEY (`INSURANCE_POLICY_ID`) REFERENCES `AUTO_INSURANCE_POLICY` (`INSURANCE_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICLE`
--

LOCK TABLES `VEHICLE` WRITE;
/*!40000 ALTER TABLE `VEHICLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICLE_DRIVER`
--

DROP TABLE IF EXISTS `VEHICLE_DRIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VEHICLE_DRIVER` (
  `DRIVER_LICENSE_ID` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `VEHICLE_ID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`DRIVER_LICENSE_ID`,`VEHICLE_ID`),
  KEY `VEHICLE_DRIVER_VEHICLE_FK` (`VEHICLE_ID`),
  CONSTRAINT `VEHICLE_DRIVER_DRIVER_FK` FOREIGN KEY (`DRIVER_LICENSE_ID`) REFERENCES `DRIVER` (`DRIVER_LICENSE_ID`),
  CONSTRAINT `VEHICLE_DRIVER_VEHICLE_FK` FOREIGN KEY (`VEHICLE_ID`) REFERENCES `VEHICLE` (`VEHICLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICLE_DRIVER`
--

LOCK TABLES `VEHICLE_DRIVER` WRITE;
/*!40000 ALTER TABLE `VEHICLE_DRIVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `VEHICLE_DRIVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Home','fa-bar-chart','/',NULL,NULL,'2020-05-02 03:42:20'),(2,0,3,'Admin','fa-tasks','',NULL,NULL,'2020-05-02 03:43:21'),(3,2,4,'Administrator','fa-users','auth/users',NULL,NULL,'2020-05-02 04:00:42'),(4,2,5,'Roles','fa-user','auth/roles',NULL,NULL,'2020-05-02 03:43:21'),(5,2,6,'Permission','fa-ban','auth/permissions',NULL,NULL,'2020-05-02 03:43:21'),(6,2,7,'Menu','fa-bars','auth/menu',NULL,NULL,'2020-05-02 03:43:21'),(7,2,8,'Operation log','fa-history','auth/logs',NULL,NULL,'2020-05-02 03:43:21'),(8,0,2,'User  Administration','fa-users','/users',NULL,'2020-05-02 03:40:15','2020-05-02 03:43:21');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin','GET','192.168.10.1','[]','2020-05-02 03:13:54','2020-05-02 03:13:54'),(2,1,'admin','GET','192.168.10.1','[]','2020-05-02 03:21:36','2020-05-02 03:21:36'),(3,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:28:46','2020-05-02 03:28:46'),(4,1,'admin','GET','192.168.10.1','[]','2020-05-02 03:28:54','2020-05-02 03:28:54'),(5,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:29:02','2020-05-02 03:29:02'),(6,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"User  Administration\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\"}','2020-05-02 03:40:15','2020-05-02 03:40:15'),(7,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-05-02 03:40:17','2020-05-02 03:40:17'),(8,1,'admin/auth/menu/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:42:06','2020-05-02 03:42:06'),(9,1,'admin/auth/menu/1','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"Home\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/homestead.test\\/admin\\/auth\\/menu\"}','2020-05-02 03:42:19','2020-05-02 03:42:19'),(10,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-05-02 03:42:21','2020-05-02 03:42:21'),(11,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-05-02 03:43:10','2020-05-02 03:43:10'),(12,1,'admin/auth/menu','POST','192.168.10.1','{\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2020-05-02 03:43:20','2020-05-02 03:43:20'),(13,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:43:21','2020-05-02 03:43:21'),(14,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-05-02 03:43:24','2020-05-02 03:43:24'),(15,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:43:29','2020-05-02 03:43:29'),(16,1,'admin/users','GET','192.168.10.1','[]','2020-05-02 03:47:54','2020-05-02 03:47:54'),(17,1,'admin/users','GET','192.168.10.1','[]','2020-05-02 03:49:19','2020-05-02 03:49:19'),(18,1,'admin/users','GET','192.168.10.1','[]','2020-05-02 03:49:57','2020-05-02 03:49:57'),(19,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:50:39','2020-05-02 03:50:39'),(20,1,'admin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:50:43','2020-05-02 03:50:43'),(21,1,'admin/auth/permissions/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:50:51','2020-05-02 03:50:51'),(22,1,'admin/auth/permissions','POST','192.168.10.1','{\"slug\":\"users\",\"name\":\"User Administration\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_previous_\":\"http:\\/\\/homestead.test\\/admin\\/auth\\/permissions\"}','2020-05-02 03:51:46','2020-05-02 03:51:46'),(23,1,'admin/auth/permissions','GET','192.168.10.1','[]','2020-05-02 03:51:48','2020-05-02 03:51:48'),(24,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:51:54','2020-05-02 03:51:54'),(25,1,'admin/auth/roles/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:52:05','2020-05-02 03:52:05'),(26,1,'admin/auth/roles','POST','192.168.10.1','{\"slug\":\"operation\",\"name\":\"Operation\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_previous_\":\"http:\\/\\/homestead.test\\/admin\\/auth\\/roles\"}','2020-05-02 03:53:15','2020-05-02 03:53:15'),(27,1,'admin/auth/roles','GET','192.168.10.1','[]','2020-05-02 03:53:17','2020-05-02 03:53:17'),(28,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:53:25','2020-05-02 03:53:25'),(29,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:53:28','2020-05-02 03:53:28'),(30,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:54:18','2020-05-02 03:54:18'),(31,1,'admin/auth/menu/3/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 03:54:22','2020-05-02 03:54:22'),(32,1,'admin/auth/menu/3','PUT','192.168.10.1','{\"parent_id\":\"2\",\"title\":\"Administrator\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/homestead.test\\/admin\\/auth\\/menu\"}','2020-05-02 04:00:42','2020-05-02 04:00:42'),(33,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-05-02 04:00:43','2020-05-02 04:00:43'),(34,1,'admin/auth/menu','POST','192.168.10.1','{\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2020-05-02 04:00:53','2020-05-02 04:00:53'),(35,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:00:54','2020-05-02 04:00:54'),(36,1,'admin/auth/menu','GET','192.168.10.1','[]','2020-05-02 04:00:57','2020-05-02 04:00:57'),(37,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:01:02','2020-05-02 04:01:02'),(38,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:01:26','2020-05-02 04:01:26'),(39,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:01:30','2020-05-02 04:01:30'),(40,1,'admin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:02:50','2020-05-02 04:02:50'),(41,1,'admin/auth/users/create','GET','192.168.10.1','[]','2020-05-02 04:03:16','2020-05-02 04:03:16'),(42,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:03:29','2020-05-02 04:03:29'),(43,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:04:44','2020-05-02 04:04:44'),(44,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:04:47','2020-05-02 04:04:47'),(45,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:04:50','2020-05-02 04:04:50'),(46,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:04:53','2020-05-02 04:04:53'),(47,1,'admin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:04:56','2020-05-02 04:04:56'),(48,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:06:19','2020-05-02 04:06:19'),(49,1,'admin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:06:24','2020-05-02 04:06:24'),(50,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:06:27','2020-05-02 04:06:27'),(51,1,'admin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:06:29','2020-05-02 04:06:29'),(52,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:07:50','2020-05-02 04:07:50'),(53,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:07:56','2020-05-02 04:07:56'),(54,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:07:59','2020-05-02 04:07:59'),(55,1,'admin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:08:02','2020-05-02 04:08:02'),(56,1,'admin/auth/users','POST','192.168.10.1','{\"username\":\"operator\",\"name\":\"Operator\",\"password\":\"operator\",\"password_confirmation\":\"operator\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"CHlWAtgezPHRYkOPyjpO7tQ6nBYMlkOdPMvROs77\",\"_previous_\":\"http:\\/\\/homestead.test\\/admin\\/auth\\/users\"}','2020-05-02 04:18:02','2020-05-02 04:18:02'),(57,1,'admin/auth/users','GET','192.168.10.1','[]','2020-05-02 04:18:04','2020-05-02 04:18:04'),(58,1,'admin/auth/users','GET','192.168.10.1','[]','2020-05-02 04:18:56','2020-05-02 04:18:56'),(59,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:19:03','2020-05-02 04:19:03'),(60,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:19:25','2020-05-02 04:19:25'),(61,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:20:00','2020-05-02 04:20:00'),(62,1,'admin/auth/roles/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:20:10','2020-05-02 04:20:10'),(63,1,'admin/auth/roles/2','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:20:20','2020-05-02 04:20:20'),(64,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:20:25','2020-05-02 04:20:25'),(65,1,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:20:34','2020-05-02 04:20:34'),(66,2,'admin','GET','192.168.10.1','[]','2020-05-02 04:20:48','2020-05-02 04:20:48'),(67,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:22:01','2020-05-02 04:22:01'),(68,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:22:03','2020-05-02 04:22:03'),(69,2,'admin/auth/setting','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:22:43','2020-05-02 04:22:43'),(70,2,'admin/auth/setting','PUT','192.168.10.1','{\"name\":\"Operator\",\"password\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"password_confirmation\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"_token\":\"O01yAFbeiZHzdXvTGnJ9oyFPOIMVNB48J7dVatEZ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/homestead.test\\/admin\\/users\"}','2020-05-02 04:24:57','2020-05-02 04:24:57'),(71,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 04:25:00','2020-05-02 04:25:00'),(72,2,'admin/auth/setting','PUT','192.168.10.1','{\"name\":\"Operator\",\"password\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"password_confirmation\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"_token\":\"O01yAFbeiZHzdXvTGnJ9oyFPOIMVNB48J7dVatEZ\",\"_method\":\"PUT\"}','2020-05-02 04:25:09','2020-05-02 04:25:09'),(73,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 04:25:10','2020-05-02 04:25:10'),(74,1,'admin','GET','192.168.10.1','[]','2020-05-02 04:53:56','2020-05-02 04:53:56'),(75,1,'admin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:54:18','2020-05-02 04:54:18'),(76,1,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:54:48','2020-05-02 04:54:48'),(77,2,'admin','GET','192.168.10.1','[]','2020-05-02 04:55:57','2020-05-02 04:55:57'),(78,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 04:56:13','2020-05-02 04:56:13'),(79,2,'admin','GET','192.168.10.1','[]','2020-05-02 04:58:18','2020-05-02 04:58:18'),(80,2,'admin','GET','192.168.10.1','[]','2020-05-02 04:58:32','2020-05-02 04:58:32'),(81,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:02:46','2020-05-02 05:02:46'),(82,2,'admin/auth/setting','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:02:51','2020-05-02 05:02:51'),(83,2,'admin/auth/setting','PUT','192.168.10.1','{\"name\":\"Operator\",\"password\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"password_confirmation\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"_token\":\"mzLOE3wXjubvK5o1Oj0ItBy90rxVzaERW9J21tMT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/insurance.test\\/admin\"}','2020-05-02 05:03:02','2020-05-02 05:03:02'),(84,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 05:03:03','2020-05-02 05:03:03'),(85,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 05:06:36','2020-05-02 05:06:36'),(86,2,'admin/auth/setting','PUT','192.168.10.1','{\"name\":\"Operator\",\"password\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"password_confirmation\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"_token\":\"mzLOE3wXjubvK5o1Oj0ItBy90rxVzaERW9J21tMT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/insurance.test\\/admin\"}','2020-05-02 05:06:46','2020-05-02 05:06:46'),(87,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 05:06:47','2020-05-02 05:06:47'),(88,2,'admin/auth/setting','PUT','192.168.10.1','{\"name\":\"Operator\",\"password\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"password_confirmation\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"_token\":\"mzLOE3wXjubvK5o1Oj0ItBy90rxVzaERW9J21tMT\",\"_method\":\"PUT\"}','2020-05-02 05:15:18','2020-05-02 05:15:18'),(89,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 05:15:19','2020-05-02 05:15:19'),(90,2,'admin/auth/setting','PUT','192.168.10.1','{\"name\":\"Operator\",\"password\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"password_confirmation\":\"$2y$10$NGvDkDC9izr5d\\/A8LHzyYuxeb\\/Xz1rKQemv7.tVs6yHPREnvSi206\",\"_token\":\"mzLOE3wXjubvK5o1Oj0ItBy90rxVzaERW9J21tMT\",\"_method\":\"PUT\"}','2020-05-02 05:19:43','2020-05-02 05:19:43'),(91,2,'admin/auth/setting','GET','192.168.10.1','[]','2020-05-02 05:19:44','2020-05-02 05:19:44'),(92,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:19:53','2020-05-02 05:19:53'),(93,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:20:15','2020-05-02 05:20:15'),(94,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:33:23','2020-05-02 05:33:23'),(95,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:39:34','2020-05-02 05:39:34'),(96,2,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:39:48','2020-05-02 05:39:48'),(97,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:40:08','2020-05-02 05:40:08'),(98,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:40:16','2020-05-02 05:40:16'),(99,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:40:53','2020-05-02 05:40:53'),(100,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:40:56','2020-05-02 05:40:56'),(101,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:03','2020-05-02 05:41:03'),(102,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:05','2020-05-02 05:41:05'),(103,2,'admin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:15','2020-05-02 05:41:15'),(104,1,'admin','GET','192.168.10.1','[]','2020-05-02 05:41:23','2020-05-02 05:41:23'),(105,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:28','2020-05-02 05:41:28'),(106,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:32','2020-05-02 05:41:32'),(107,1,'admin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:35','2020-05-02 05:41:35'),(108,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:37','2020-05-02 05:41:37'),(109,1,'admin/auth/roles/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:41:43','2020-05-02 05:41:43'),(110,1,'admin/auth/roles/2','PUT','192.168.10.1','{\"slug\":\"operation\",\"name\":\"Operation\",\"permissions\":[\"3\",\"4\",\"6\",null],\"_token\":\"rsLvQ40jDHV0BFIf4OgGBGJeVjFaB15j9ZpoKVsC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/insurance.test\\/admin\\/auth\\/roles\"}','2020-05-02 05:41:49','2020-05-02 05:41:49'),(111,1,'admin/auth/roles','GET','192.168.10.1','[]','2020-05-02 05:41:50','2020-05-02 05:41:50'),(112,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:42:11','2020-05-02 05:42:11'),(113,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:42:15','2020-05-02 05:42:15'),(114,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:42:16','2020-05-02 05:42:16'),(115,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:42:18','2020-05-02 05:42:18'),(116,1,'admin/auth/roles/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:42:29','2020-05-02 05:42:29'),(117,1,'admin/auth/roles/2','PUT','192.168.10.1','{\"slug\":\"operation\",\"name\":\"Operation\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"rsLvQ40jDHV0BFIf4OgGBGJeVjFaB15j9ZpoKVsC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/insurance.test\\/admin\\/auth\\/roles\"}','2020-05-02 05:42:36','2020-05-02 05:42:36'),(118,1,'admin/auth/roles','GET','192.168.10.1','[]','2020-05-02 05:42:37','2020-05-02 05:42:37'),(119,2,'admin/users','GET','192.168.10.1','[]','2020-05-02 05:42:41','2020-05-02 05:42:41'),(120,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:42:46','2020-05-02 05:42:46'),(121,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:42:55','2020-05-02 05:42:55'),(122,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:43:29','2020-05-02 05:43:29'),(123,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:45:08','2020-05-02 05:45:08'),(124,1,'admin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:45:14','2020-05-02 05:45:14'),(125,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:45:16','2020-05-02 05:45:16'),(126,1,'admin/auth/menu/8/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:45:29','2020-05-02 05:45:29'),(127,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:45:42','2020-05-02 05:45:42'),(128,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:46:31','2020-05-02 05:46:31'),(129,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:47:21','2020-05-02 05:47:21'),(130,2,'admin/users','GET','192.168.10.1','[]','2020-05-02 05:47:33','2020-05-02 05:47:33'),(131,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:47:46','2020-05-02 05:47:46'),(132,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:47:47','2020-05-02 05:47:47'),(133,1,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:51:28','2020-05-02 05:51:28'),(134,1,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:51:30','2020-05-02 05:51:30'),(135,2,'admin/users','GET','192.168.10.1','[]','2020-05-02 05:51:57','2020-05-02 05:51:57'),(136,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:52:29','2020-05-02 05:52:29'),(137,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:52:43','2020-05-02 05:52:43'),(138,1,'admin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:52:51','2020-05-02 05:52:51'),(139,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:54:49','2020-05-02 05:54:49'),(140,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:55:00','2020-05-02 05:55:00'),(141,2,'admin','GET','192.168.10.1','[]','2020-05-02 05:56:44','2020-05-02 05:56:44'),(142,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:56:51','2020-05-02 05:56:51'),(143,2,'admin/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:57:12','2020-05-02 05:57:12'),(144,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:57:15','2020-05-02 05:57:15'),(145,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 05:59:43','2020-05-02 05:59:43'),(146,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:02:19','2020-05-02 06:02:19'),(147,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:02:47','2020-05-02 06:02:47'),(148,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 06:02:59','2020-05-02 06:02:59'),(149,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:03:22','2020-05-02 06:03:22'),(150,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:03:55','2020-05-02 06:03:55'),(151,2,'admin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2020-05-02 06:04:01','2020-05-02 06:04:01'),(152,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:04:31','2020-05-02 06:04:31'),(153,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:04:49','2020-05-02 06:04:49'),(154,2,'admin','GET','192.168.10.1','[]','2020-05-02 06:05:11','2020-05-02 06:05:11');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'User Administration','users','','/users*','2020-05-02 03:51:47','2020-05-02 03:51:47');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,6,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2020-05-02 03:13:27','2020-05-02 03:13:27'),(2,'Operation','operation','2020-05-02 03:53:15','2020-05-02 03:53:15');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$n/scopsC3IayUP/8HE9SOuFJpw4JRu7YJunsfMxTQlYhka5KBA39.','Administrator',NULL,'4oDdOcI75Be7EmiTE2mI0BKsZn9F1VPgFeE0JQvcbpA0bHZyGveZvWhZBRWz','2020-05-02 03:13:27','2020-05-02 03:13:27'),(2,'operator','$2y$10$NGvDkDC9izr5d/A8LHzyYuxeb/Xz1rKQemv7.tVs6yHPREnvSi206','Operator','images/009-man.png','vK9nwhpLhs3nTDufAHFjMLfGTX8OMeDQO43VjZUiF8pwa5vG8A925C6K1u8V','2020-05-02 04:18:02','2020-05-02 05:06:46');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2016_01_04_173148_create_admin_tables',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'zdsfa','asd@sdf.com',NULL,'$2y$10$X77PljFgnEJdyYGGqECZGuEJMXpJFIFZ9wQLW.OXZn4hgiCc4hAhG',NULL,'2020-05-02 02:08:16','2020-05-02 02:08:16','asdf','1','M','1','1','1','11201','1234567890','1'),(2,'sda','dsad@sad.com',NULL,'$2y$10$rrwyQtn4OGOP2MX0AsTFLOEYVmgYNH0fnSBtQampNJ36S.r1keX/u',NULL,'2020-05-02 02:10:38','2020-05-02 02:10:38','lkjafdlk','dslakjld','M','NY','slkjd','salkdjaslkj','11201','1234567891','M'),(3,'dsadasd','fgffdhdfh@dasd.com',NULL,'$2y$10$AznUknX9edLsL.X3.z4kuO7xWn5huLJkIPYjX8woDBb8I7w2Bx.vm',NULL,'2020-05-02 02:20:55','2020-05-02 02:20:55','sda','dsad',NULL,'sadf','dsa','das','12345','1234567896','M'),(4,'dsadas','gfdkjh@ds.com',NULL,'$2y$10$lhsSinIVBLHj8ai5bB6Zber4/xbPYGkwvWEFQd6FHYJGimqmGb4Bu',NULL,'2020-05-02 02:23:34','2020-05-02 02:23:34','dkjsh','dksjah',NULL,'dsa','dslakjdlakj','dslakj','13245','1234567890','M'),(5,'sdad','gfdfjkg@sdad.com',NULL,'$2y$10$IOpnyV4Ntu2M8A1ky33GO./aFpU1Rka4/pVz0j2QUjXT7QojmcN.S',NULL,'2020-05-02 03:07:27','2020-05-02 03:07:27','dsa','saf',NULL,'fds','dsf','dfs','12345','1234567890','M');
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

-- Dump completed on 2020-05-02  2:24:40
