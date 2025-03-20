CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL DEFAULT 'Россия',
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `surname_name_author_UNIQUE` (`surname`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Пушкин','Александр','Россия'),(2,'Гоголь','Николай','Украина'),(3,'Достоевский','Федор','Россия'),(4,'Тютчев','Федор','Россия'),(5,'Толстой','Лев','Россия');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `genre` enum('проза','поэзия','другое') NOT NULL DEFAULT 'проза',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(4,3) NOT NULL DEFAULT '0.000',
  `pages` smallint NOT NULL DEFAULT '0',
  `issue_year` year DEFAULT NULL,
  `author_id` int unsigned NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_book_author_idx` (`author_id`),
  CONSTRAINT `fk_book_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compound`
--

DROP TABLE IF EXISTS `compound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compound` (
  `book_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `quantity` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`book_id`,`order_id`),
  KEY `fk_book_has_order_order1_idx` (`order_id`),
  KEY `fk_book_has_order_book1_idx` (`book_id`),
  CONSTRAINT `fk_book_has_order_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_book_has_order_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `quantity` CHECK (((`quantity` > 0) and (`quantity` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compound`
--

LOCK TABLES `compound` WRITE;
/*!40000 ALTER TABLE `compound` DISABLE KEYS */;
/*!40000 ALTER TABLE `compound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `surname_name_customer_UNIQUE` (`surname`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_time_order` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20 12:09:14
