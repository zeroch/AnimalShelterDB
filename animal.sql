-- MySQL dump 10.13  Distrib 5.6.12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: animal
-- ------------------------------------------------------
-- Server version	5.6.12

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
-- Table structure for table `Donates`
--

DROP TABLE IF EXISTS `Donates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Donates` (
  `name` varchar(60) NOT NULL,
  `phone` int(10) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `d_date` date NOT NULL,
  PRIMARY KEY (`name`,`phone`,`d_date`,`amount`,`s_name`),
  KEY `s_name` (`s_name`),
  CONSTRAINT `Donates_fk` FOREIGN KEY (`name`, `phone`) REFERENCES `donor` (`name`, `phone`),
  CONSTRAINT `donates_ibfk_1` FOREIGN KEY (`s_name`) REFERENCES `shelter` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Donates`
--

LOCK TABLES `Donates` WRITE;
/*!40000 ALTER TABLE `Donates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Donates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoptee`
--

DROP TABLE IF EXISTS `adoptee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoptee` (
  `name` varchar(60) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `DoB` date NOT NULL,
  `incoming` int(11) NOT NULL,
  `employer` varchar(60) NOT NULL,
  PRIMARY KEY (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptee`
--

LOCK TABLES `adoptee` WRITE;
/*!40000 ALTER TABLE `adoptee` DISABLE KEYS */;
/*!40000 ALTER TABLE `adoptee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat`
--

DROP TABLE IF EXISTS `cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat` (
  `pet_id` int(11) NOT NULL,
  `shelter_name` varchar(60) NOT NULL,
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY (`pet_id`,`shelter_name`),
  KEY `shelter_name` (`shelter_name`),
  KEY `breed` (`breed`),
  CONSTRAINT `cat_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  CONSTRAINT `cat_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `pet` (`shelter_name`),
  CONSTRAINT `cat_ibfk_2` FOREIGN KEY (`breed`) REFERENCES `cat_breed` (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat`
--

LOCK TABLES `cat` WRITE;
/*!40000 ALTER TABLE `cat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_breed`
--

DROP TABLE IF EXISTS `cat_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_breed` (
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_breed`
--

LOCK TABLES `cat_breed` WRITE;
/*!40000 ALTER TABLE `cat_breed` DISABLE KEYS */;
INSERT INTO `cat_breed` VALUES ('x'),('y'),('z');
/*!40000 ALTER TABLE `cat_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days_open`
--

DROP TABLE IF EXISTS `days_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `days_open` (
  `shelter_name` varchar(60) NOT NULL,
  `days` varchar(40) NOT NULL,
  PRIMARY KEY (`shelter_name`),
  CONSTRAINT `fk` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days_open`
--

LOCK TABLES `days_open` WRITE;
/*!40000 ALTER TABLE `days_open` DISABLE KEYS */;
/*!40000 ALTER TABLE `days_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog` (
  `pet_id` int(11) NOT NULL,
  `shelter_name` varchar(60) NOT NULL,
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY (`pet_id`,`shelter_name`),
  KEY `shelter_name` (`shelter_name`),
  KEY `breed` (`breed`),
  CONSTRAINT `dog_fk` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`),
  CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`shelter_name`) REFERENCES `pet` (`shelter_name`),
  CONSTRAINT `dog_ibfk_2` FOREIGN KEY (`breed`) REFERENCES `dog_breed` (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog`
--

LOCK TABLES `dog` WRITE;
/*!40000 ALTER TABLE `dog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog_breed`
--

DROP TABLE IF EXISTS `dog_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog_breed` (
  `breed` varchar(50) NOT NULL,
  PRIMARY KEY (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog_breed`
--

LOCK TABLES `dog_breed` WRITE;
/*!40000 ALTER TABLE `dog_breed` DISABLE KEYS */;
INSERT INTO `dog_breed` VALUES ('a'),('b'),('c');
/*!40000 ALTER TABLE `dog_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `name` varchar(60) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Enum` int(11) NOT NULL AUTO_INCREMENT,
  `dir_enum` int(11) DEFAULT NULL,
  `shelter_name` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`Enum`,`shelter_name`),
  KEY `employee_fk` (`shelter_name`),
  KEY `employee_fk_Enum` (`dir_enum`),
  CONSTRAINT `employee_fk` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`),
  CONSTRAINT `employee_fk_Enum` FOREIGN KEY (`dir_enum`) REFERENCES `employee` (`Enum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,NULL,'chen','xyz'),(2,NULL,'ze','xy3z'),(3,NULL,'chen','xydfdz');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `s_name` varchar(60) NOT NULL,
  `e_date` date NOT NULL,
  `location` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `type` enum('Fundraising','Adoption') NOT NULL,
  PRIMARY KEY (`location`,`e_date`),
  KEY `event_FK` (`s_name`),
  CONSTRAINT `event_FK` FOREIGN KEY (`s_name`) REFERENCES `shelter` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fosterer`
--

DROP TABLE IF EXISTS `fosterer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosterer` (
  `name` varchar(60) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fosterer`
--

LOCK TABLES `fosterer` WRITE;
/*!40000 ALTER TABLE `fosterer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fosterer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet` (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT,
  `shelter_name` varchar(60) NOT NULL,
  `pet_name` varchar(60) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `age` int(11) NOT NULL,
  `assign_date` date DEFAULT NULL,
  `a_name` varchar(60) DEFAULT NULL,
  `a_phone` int(10) DEFAULT NULL,
  `a_date` date DEFAULT NULL,
  `f_name` varchar(60) DEFAULT NULL,
  `f_phone` int(10) DEFAULT NULL,
  `f_date` date DEFAULT NULL,
  `pet_type` enum('cat','dog') NOT NULL,
  `cat_breed` varchar(50) NOT NULL,
  `dog_breed` varchar(50) NOT NULL,
  PRIMARY KEY (`pet_id`,`shelter_name`),
  KEY `pet_fk` (`shelter_name`),
  KEY `a_name` (`a_name`,`a_phone`),
  KEY `f_name` (`f_name`,`f_phone`),
  KEY `cat_breed` (`cat_breed`),
  KEY `dog_breed` (`dog_breed`),
  CONSTRAINT `pet_fk` FOREIGN KEY (`shelter_name`) REFERENCES `shelter` (`name`),
  CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`a_name`, `a_phone`) REFERENCES `adoptee` (`name`, `phone`),
  CONSTRAINT `pet_ibfk_2` FOREIGN KEY (`f_name`, `f_phone`) REFERENCES `fosterer` (`name`, `phone`),
  CONSTRAINT `pet_ibfk_3` FOREIGN KEY (`cat_breed`) REFERENCES `cat_breed` (`breed`),
  CONSTRAINT `pet_ibfk_4` FOREIGN KEY (`dog_breed`) REFERENCES `dog_breed` (`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelter`
--

DROP TABLE IF EXISTS `shelter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shelter` (
  `name` varchar(60) NOT NULL,
  `phone` int(10) NOT NULL,
  `st_city_state` varchar(100) NOT NULL,
  `zipcode` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelter`
--

LOCK TABLES `shelter` WRITE;
/*!40000 ALTER TABLE `shelter` DISABLE KEYS */;
INSERT INTO `shelter` VALUES ('chen',305323320,'2111 NE 208 ST',33179),('ze',305331020,'3235 post woods dr',30339);
/*!40000 ALTER TABLE `shelter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-14 20:41:31
