-- MySQL dump 10.13  Distrib 5.7.41, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: softcart
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `softcartDimCategory`
--

DROP TABLE IF EXISTS `softcartDimCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softcartDimCategory` (
  `categoryid` int NOT NULL,
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softcartDimCategory`
--

LOCK TABLES `softcartDimCategory` WRITE;
/*!40000 ALTER TABLE `softcartDimCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `softcartDimCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softcartDimCountry`
--

DROP TABLE IF EXISTS `softcartDimCountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softcartDimCountry` (
  `countryid` int NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softcartDimCountry`
--

LOCK TABLES `softcartDimCountry` WRITE;
/*!40000 ALTER TABLE `softcartDimCountry` DISABLE KEYS */;
/*!40000 ALTER TABLE `softcartDimCountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softcartDimDate`
--

DROP TABLE IF EXISTS `softcartDimDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softcartDimDate` (
  `dateid` int NOT NULL,
  `date` date NOT NULL,
  `day` int NOT NULL,
  `month` int NOT NULL,
  `monthname` int NOT NULL,
  `year` int NOT NULL,
  `weekday` int NOT NULL,
  `weekdayname` varchar(10) NOT NULL,
  `quarter` int NOT NULL,
  `quatername` varchar(2) NOT NULL,
  PRIMARY KEY (`dateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softcartDimDate`
--

LOCK TABLES `softcartDimDate` WRITE;
/*!40000 ALTER TABLE `softcartDimDate` DISABLE KEYS */;
/*!40000 ALTER TABLE `softcartDimDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softcartDimItem`
--

DROP TABLE IF EXISTS `softcartDimItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softcartDimItem` (
  `itemid` int NOT NULL,
  `item` varchar(255) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softcartDimItem`
--

LOCK TABLES `softcartDimItem` WRITE;
/*!40000 ALTER TABLE `softcartDimItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `softcartDimItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softcartFactSales`
--

DROP TABLE IF EXISTS `softcartFactSales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `softcartFactSales` (
  `orderid` int NOT NULL,
  `price` int NOT NULL,
  `itemid` int NOT NULL,
  `countryid` int NOT NULL,
  `dateid` int NOT NULL,
  `categoryid` int NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `item` (`itemid`),
  KEY `date` (`dateid`),
  KEY `country` (`countryid`),
  KEY `category` (`categoryid`),
  CONSTRAINT `category` FOREIGN KEY (`categoryid`) REFERENCES `softcartDimCategory` (`categoryid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `country` FOREIGN KEY (`countryid`) REFERENCES `softcartDimCountry` (`countryid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `date` FOREIGN KEY (`dateid`) REFERENCES `softcartDimDate` (`dateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item` FOREIGN KEY (`itemid`) REFERENCES `softcartDimItem` (`itemid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softcartFactSales`
--

LOCK TABLES `softcartFactSales` WRITE;
/*!40000 ALTER TABLE `softcartFactSales` DISABLE KEYS */;
/*!40000 ALTER TABLE `softcartFactSales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26 14:35:16
