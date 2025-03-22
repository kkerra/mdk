CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Пушкин','Александр','Россия'),(2,'Гоголь','Николай','Украина'),(3,'Достоевский','Федор','Россия'),(4,'Тютчев','Федор','Россия'),(5,'Толстой','Лев','Россия'),(6,'Автор','Автор','США'),(7,'1','1',''),(8,'123','123','Страна'),(10,'ава1','qwer','Страна');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Книга','проза',10.00,0.200,123,2000,1),(2,'Книга2','другое',200.00,0.100,321,2020,2),(3,'Книга3','поэзия',120.00,0.123,123,2025,3),(4,'Книга4','другое',320.00,0.321,321,2004,4),(5,'Сумерки','поэзия',0.00,0.990,831,2025,6),(6,'Обезьяна','проза',1500.00,2.000,2,2000,5),(7,'компьютер','проза',10.00,2.000,393,1999,3),(8,'Книга','другое',120.00,0.100,123,2003,4),(9,'Книга','поэзия',120.00,0.123,123,2000,1),(10,'abc','другое',0.00,0.000,0,2000,2),(11,'123','проза',0.00,0.000,0,2000,1),(12,'linux','проза',0.00,1.000,452,2004,1),(13,'asdsda','другое',210.00,2.000,234,2000,1);
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
INSERT INTO `compound` VALUES (1,1,2),(1,2,5),(2,1,3),(2,2,6),(3,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'login','абв','клиент1','абвгд','123'),(2,'login2','abc','бибоп ','колушкина','4443'),(3,'login3','dddd','ступик','газики','11456'),(4,'logon','ddial','адидасик','kumar','05542'),(5,'logogo','абобочкин','абоба','румтурик',''),(6,'GGFG','АААА','ООО','ПКПК',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_event_table`
--

DROP TABLE IF EXISTS `my_event_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_event_table` (
  `my_event_table_id` int NOT NULL AUTO_INCREMENT,
  `event_time` datetime DEFAULT NULL,
  `event_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`my_event_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_event_table`
--

LOCK TABLES `my_event_table` WRITE;
/*!40000 ALTER TABLE `my_event_table` DISABLE KEYS */;
INSERT INTO `my_event_table` VALUES (1,'2025-03-22 11:00:12','event1'),(2,'2025-03-22 11:00:22','event1'),(3,'2025-03-22 11:00:32','event1'),(4,'2025-03-22 11:00:42','event1'),(5,'2025-03-22 11:00:52','event1'),(6,'2025-03-22 11:01:02','event1'),(7,'2025-03-22 11:01:12','event1'),(8,'2025-03-22 11:01:22','event1'),(9,'2025-03-22 11:01:32','event1'),(10,'2025-03-22 11:01:42','event1'),(11,'2025-03-22 11:01:52','event1'),(12,'2025-03-22 11:02:02','event1'),(13,'2025-03-22 11:02:12','event1'),(14,'2025-03-22 11:02:22','event1'),(15,'2025-03-22 11:02:32','event1'),(16,'2025-03-22 11:02:42','event1'),(17,'2025-03-22 11:02:52','event1'),(18,'2025-03-22 11:03:02','event1'),(19,'2025-03-22 11:03:12','event1'),(20,'2025-03-22 11:03:22','event1'),(21,'2025-03-22 11:03:32','event1'),(22,'2025-03-22 11:03:42','event1'),(23,'2025-03-22 11:03:52','event1'),(24,'2025-03-22 11:04:02','event1'),(25,'2025-03-22 11:04:12','event1'),(26,'2025-03-22 11:04:22','event1'),(27,'2025-03-22 11:04:32','event1'),(28,'2025-03-22 11:04:42','event1'),(29,'2025-03-22 11:04:52','event1'),(30,'2025-03-22 11:05:02','event1'),(31,'2025-03-22 11:05:12','event1'),(32,'2025-03-22 11:08:30','event2'),(33,'2025-03-22 11:11:00','event2'),(34,'2025-03-22 11:13:31','event2'),(35,'2025-03-22 11:16:00','event2'),(36,'2025-03-22 11:18:30','event2'),(37,'2025-03-22 11:21:00','event2'),(38,'2025-03-22 11:23:30','event2'),(39,'2025-03-22 11:26:00','event2'),(40,'2025-03-22 11:28:30','event2'),(41,'2025-03-22 11:31:00','event2'),(42,'2025-03-22 11:33:30','event2'),(43,'2025-03-22 11:36:00','event2'),(44,'2025-03-22 11:38:30','event2'),(45,'2025-03-22 11:41:00','event2'),(46,'2025-03-22 11:43:30','event2'),(47,'2025-03-22 11:46:00','event2'),(48,'2025-03-22 11:48:30','event2'),(49,'2025-03-22 11:51:00','event2'),(50,'2025-03-22 11:53:30','event2'),(51,'2025-03-22 11:56:00','event2'),(52,'2025-03-22 11:58:30','event2'),(53,'2025-03-22 12:01:00','event2'),(54,'2025-03-22 12:03:30','event2'),(55,'2025-03-22 12:06:00','event2'),(56,'2025-03-22 12:07:57','event3'),(57,'2025-03-22 12:08:30','event2'),(58,'2025-03-22 12:11:00','event2'),(59,'2025-03-22 12:13:30','event2'),(60,'2025-03-22 12:16:00','event2'),(61,'2025-03-22 12:18:30','event2'),(62,'2025-03-22 12:21:00','event2'),(63,'2025-03-22 12:23:30','event2');
/*!40000 ALTER TABLE `my_event_table` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2025-03-21 10:17:45',1),(2,'2025-03-21 10:17:45',2),(3,'2025-03-21 10:17:55',1),(4,'2025-03-21 10:17:55',2),(5,'2025-03-21 10:17:55',3),(6,'2025-03-21 10:17:55',2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_book`
--

DROP TABLE IF EXISTS `temp_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_book` (
  `temp_book_id` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`temp_book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_book`
--

LOCK TABLES `temp_book` WRITE;
/*!40000 ALTER TABLE `temp_book` DISABLE KEYS */;
INSERT INTO `temp_book` VALUES (16,'Пушкин','Александр','Книга',692.00),(17,'Гоголь','Николай','Книга2',200.00),(18,'Достоевский','Федор','Книга3',323.00),(19,'Тютчев','Федор','Книга4',521.00),(20,'Автор','Автор','Сумерки',300.00),(21,'Толстой','Лев','Обезьяна',1700.00),(22,'Достоевский','Федор','компьютер',350.00),(23,'Тютчев','Федор','Книга',323.00),(24,'Пушкин','Александр','Книга',1448.00),(25,'Гоголь','Николай','abc',324.00),(26,'Пушкин','Александр','123',692.00),(27,'Пушкин','Александр','linux',1052.00);
/*!40000 ALTER TABLE `temp_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-22 12:23:43
