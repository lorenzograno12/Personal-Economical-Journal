-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: personal_economical_bullet
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `Oid` int NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `OidPaymentType` int NOT NULL,
  `OidExpenseType` int NOT NULL,
  `OidFrequency` int NOT NULL,
  `Amount` double NOT NULL,
  `Quantity` int NOT NULL,
  `OidNation` int NOT NULL,
  KEY `Oid` (`Oid`),
  KEY `OidExpenseType_idx` (`OidPaymentType`),
  KEY `OidExpenseType` (`OidExpenseType`),
  KEY `OidNationExpense_idx` (`OidNation`),
  KEY `OidFrequencyExspence_idx` (`OidFrequency`),
  CONSTRAINT `OidExpenseType` FOREIGN KEY (`OidExpenseType`) REFERENCES `expensetype` (`Oid`),
  CONSTRAINT `OidFrequencyExspense` FOREIGN KEY (`OidFrequency`) REFERENCES `frequency` (`Oid`),
  CONSTRAINT `OidNationExpense` FOREIGN KEY (`OidNation`) REFERENCES `nation` (`Oid`),
  CONSTRAINT `OidPaymentTypeExpense` FOREIGN KEY (`OidPaymentType`) REFERENCES `paymenttype` (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensedepartment`
--

DROP TABLE IF EXISTS `expensedepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensedepartment` (
  `Oid` int NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Cod` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensedepartment`
--

LOCK TABLES `expensedepartment` WRITE;
/*!40000 ALTER TABLE `expensedepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `expensedepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensetype`
--

DROP TABLE IF EXISTS `expensetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensetype` (
  `Oid` int NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Cod` int NOT NULL,
  `OidExpenseDepartment` int NOT NULL,
  PRIMARY KEY (`Oid`),
  KEY `OidExpenseDepartment_idx` (`OidExpenseDepartment`),
  CONSTRAINT `OidExpenseDepartment` FOREIGN KEY (`OidExpenseDepartment`) REFERENCES `expensedepartment` (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensetype`
--

LOCK TABLES `expensetype` WRITE;
/*!40000 ALTER TABLE `expensetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `expensetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequency`
--

DROP TABLE IF EXISTS `frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequency` (
  `Oid` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Cod` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `Oid` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `Amount` double NOT NULL,
  `Quantity` int NOT NULL,
  `OidNation` int NOT NULL,
  `OidIncomeType` int NOT NULL,
  `OidPaymentType` int NOT NULL,
  `OidFrequency` int NOT NULL,
  PRIMARY KEY (`Oid`),
  KEY `OidPaymentType_idx` (`OidPaymentType`),
  KEY `OidNationIncome_idx` (`OidNation`),
  KEY `OidFrequencyIncome_idx` (`OidFrequency`),
  KEY `OidIncomeType_idx` (`OidIncomeType`),
  CONSTRAINT `OidFrequencyIncome` FOREIGN KEY (`OidFrequency`) REFERENCES `frequency` (`Oid`),
  CONSTRAINT `OidIncomeType` FOREIGN KEY (`OidIncomeType`) REFERENCES `incometype` (`Oid`),
  CONSTRAINT `OidNationIncome` FOREIGN KEY (`OidNation`) REFERENCES `nation` (`Oid`),
  CONSTRAINT `OidPaymentTypeIncome` FOREIGN KEY (`OidPaymentType`) REFERENCES `paymenttype` (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incometype`
--

DROP TABLE IF EXISTS `incometype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incometype` (
  `Oid` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Cod` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incometype`
--

LOCK TABLES `incometype` WRITE;
/*!40000 ALTER TABLE `incometype` DISABLE KEYS */;
/*!40000 ALTER TABLE `incometype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nation` (
  `Oid` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Cod` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttype`
--

DROP TABLE IF EXISTS `paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenttype` (
  `Oid` int NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `Cod` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`Oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttype`
--

LOCK TABLES `paymenttype` WRITE;
/*!40000 ALTER TABLE `paymenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'personal_economical_bullet'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 22:56:44
