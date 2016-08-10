-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: lab1
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Current Database: `lab1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lab1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lab1`;

--
-- Table structure for table `Funding`
--

DROP TABLE IF EXISTS `Funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Funding` (
  `vineyardID` int(11) DEFAULT NULL,
  `futureID` int(11) DEFAULT NULL,
  `fundingMetadata` blob,
  UNIQUE KEY `pkFunding` (`vineyardID`,`futureID`),
  KEY `futureID` (`futureID`),
  CONSTRAINT `Funding_ibfk_1` FOREIGN KEY (`vineyardID`) REFERENCES `Vineyard` (`vineyardID`),
  CONSTRAINT `Funding_ibfk_2` FOREIGN KEY (`futureID`) REFERENCES `Future` (`futureID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funding`
--

LOCK TABLES `Funding` WRITE;
/*!40000 ALTER TABLE `Funding` DISABLE KEYS */;
INSERT INTO `Funding` VALUES (1,2,'101101010010011'),(1,3,'111010100101101'),(2,4,'101110101011010');
/*!40000 ALTER TABLE `Funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Future`
--

DROP TABLE IF EXISTS `Future`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Future` (
  `futureID` int(11) NOT NULL AUTO_INCREMENT,
  `futureName` varchar(55) DEFAULT NULL,
  `futureDescription` varchar(255) DEFAULT NULL,
  `futureExpireDate` date DEFAULT NULL,
  PRIMARY KEY (`futureID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Future`
--

LOCK TABLES `Future` WRITE;
/*!40000 ALTER TABLE `Future` DISABLE KEYS */;
INSERT INTO `Future` VALUES (1,'BARCLAYS 10152015 CHARDONNAY $128','Lorem ipsum dolor sit amet, consectetur adipiscing elit','2015-10-15'),(2,'FERGUSON 12012015 RIOJA $650','Duis aute irure dolor in reprehenderit in voluptate','2015-12-01'),(3,'DIMITRI 09172015 RIOJA $800',' Excepteur sint occaecat cupidatat non proident','2015-09-17'),(4,'CITI 09272015 CABERNET $80','Ut enim ad minim veniam, quis nostrud exercitation ullamco ','2015-09-27');
/*!40000 ALTER TABLE `Future` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vineyard`
--

DROP TABLE IF EXISTS `Vineyard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vineyard` (
  `vineyardID` int(11) NOT NULL AUTO_INCREMENT,
  `vineyardName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`vineyardID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vineyard`
--

LOCK TABLES `Vineyard` WRITE;
/*!40000 ALTER TABLE `Vineyard` DISABLE KEYS */;
INSERT INTO `Vineyard` VALUES (1,'Vina Real'),(2,'yellow tail');
/*!40000 ALTER TABLE `Vineyard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine`
--

DROP TABLE IF EXISTS `wine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine` (
  `wineID` int(11) NOT NULL AUTO_INCREMENT,
  `wineName` varchar(25) DEFAULT NULL,
  `wineDescription` varchar(255) DEFAULT NULL,
  `vineyardID` int(11) DEFAULT NULL,
  PRIMARY KEY (`wineID`),
  KEY `vineyardID` (`vineyardID`),
  CONSTRAINT `wine_ibfk_1` FOREIGN KEY (`vineyardID`) REFERENCES `Vineyard` (`vineyardID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine`
--

LOCK TABLES `wine` WRITE;
/*!40000 ALTER TABLE `wine` DISABLE KEYS */;
INSERT INTO `wine` VALUES (4,'Gran Reserva','Rioja',1),(5,'Reserva','Rioja',1),(6,'Big Bold Red','Piss water',2);
/*!40000 ALTER TABLE `wine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-03 15:44:35
