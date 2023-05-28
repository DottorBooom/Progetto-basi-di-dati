-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: associazione
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `abito`
--

DROP TABLE IF EXISTS `abito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abito` (
  `Codice` char(6) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `PrezzoGiornaliero` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  UNIQUE KEY `idx_Abito_Codice` (`Codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `affitto`
--

DROP TABLE IF EXISTS `affitto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affitto` (
  `NumeroRicevuta` varchar(25) NOT NULL,
  `DataInizio` date DEFAULT NULL,
  `DataFine` date DEFAULT NULL,
  `Ammontare` decimal(10,2) DEFAULT NULL,
  `CodiceTesserato` int DEFAULT NULL,
  `CodiceAbito` char(6) DEFAULT NULL,
  PRIMARY KEY (`NumeroRicevuta`),
  KEY `idx_Affitto_CodiceTesserato` (`CodiceTesserato`),
  KEY `idx_Affitto_CodiceAbito` (`CodiceAbito`),
  CONSTRAINT `affitto_ibfk_1` FOREIGN KEY (`CodiceTesserato`) REFERENCES `tesserato` (`Codice`) ON DELETE SET NULL,
  CONSTRAINT `affitto_ibfk_2` FOREIGN KEY (`CodiceAbito`) REFERENCES `abito` (`Codice`) ON DELETE CASCADE,
  CONSTRAINT `CK_Affitto_Date` CHECK ((`DataInizio` <= `DataFine`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ceto`
--

DROP TABLE IF EXISTS `ceto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ceto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ceto` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Via` varchar(40) DEFAULT NULL,
  `Citta` varchar(20) DEFAULT NULL,
  `CAP` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gruppo`
--

DROP TABLE IF EXISTS `gruppo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gruppo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NomeGruppo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mascotte`
--

DROP TABLE IF EXISTS `mascotte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotte` (
  `CodiceAbito` char(6) DEFAULT NULL,
  `Nome` varchar(25) DEFAULT NULL,
  `IDGruppo` int DEFAULT NULL,
  KEY `CodiceAbito` (`CodiceAbito`),
  KEY `IDGruppo` (`IDGruppo`),
  CONSTRAINT `mascotte_ibfk_1` FOREIGN KEY (`CodiceAbito`) REFERENCES `abito` (`Codice`) ON DELETE CASCADE,
  CONSTRAINT `mascotte_ibfk_2` FOREIGN KEY (`IDGruppo`) REFERENCES `gruppo` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medioevale`
--

DROP TABLE IF EXISTS `medioevale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medioevale` (
  `CodiceAbito` char(6) DEFAULT NULL,
  `IDCeto` int DEFAULT NULL,
  KEY `CodiceAbito` (`CodiceAbito`),
  KEY `IDCeto` (`IDCeto`),
  CONSTRAINT `medioevale_ibfk_1` FOREIGN KEY (`CodiceAbito`) REFERENCES `abito` (`Codice`) ON DELETE CASCADE,
  CONSTRAINT `medioevale_ibfk_2` FOREIGN KEY (`IDCeto`) REFERENCES `ceto` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occupazione`
--

DROP TABLE IF EXISTS `occupazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupazione` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Specializzazione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizzazione`
--

DROP TABLE IF EXISTS `organizzazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizzazione` (
  `CodiceTesserato` int DEFAULT NULL,
  `IDEvento` int DEFAULT NULL,
  KEY `CodiceTesserato` (`CodiceTesserato`),
  KEY `IDEvento` (`IDEvento`),
  CONSTRAINT `organizzazione_ibfk_1` FOREIGN KEY (`CodiceTesserato`) REFERENCES `tesserato` (`Codice`) ON DELETE CASCADE,
  CONSTRAINT `organizzazione_ibfk_2` FOREIGN KEY (`IDEvento`) REFERENCES `evento` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partecipazione`
--

DROP TABLE IF EXISTS `partecipazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partecipazione` (
  `CodiceTesserato` int DEFAULT NULL,
  `IDEvento` int DEFAULT NULL,
  KEY `CodiceTesserato` (`CodiceTesserato`),
  KEY `IDEvento` (`IDEvento`),
  CONSTRAINT `partecipazione_ibfk_1` FOREIGN KEY (`CodiceTesserato`) REFERENCES `tesserato` (`Codice`) ON DELETE CASCADE,
  CONSTRAINT `partecipazione_ibfk_2` FOREIGN KEY (`IDEvento`) REFERENCES `evento` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rammendo`
--

DROP TABLE IF EXISTS `rammendo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rammendo` (
  `Ricevuta` varchar(25) DEFAULT NULL,
  `Ammontare` decimal(10,2) DEFAULT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `CodiceAbito` char(6) DEFAULT NULL,
  `IDSarto` int DEFAULT NULL,
  KEY `IDSarto` (`IDSarto`),
  KEY `idx_Rammendo_CodiceAbito` (`CodiceAbito`),
  CONSTRAINT `rammendo_ibfk_1` FOREIGN KEY (`CodiceAbito`) REFERENCES `abito` (`Codice`) ON DELETE SET NULL,
  CONSTRAINT `rammendo_ibfk_2` FOREIGN KEY (`IDSarto`) REFERENCES `sarto` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referente`
--

DROP TABLE IF EXISTS `referente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referente` (
  `NomeEnte` varchar(20) NOT NULL,
  `CodiceTesserato` int DEFAULT NULL,
  PRIMARY KEY (`NomeEnte`),
  KEY `CodiceTesserato` (`CodiceTesserato`),
  CONSTRAINT `referente_ibfk_1` FOREIGN KEY (`CodiceTesserato`) REFERENCES `tesserato` (`Codice`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sarto`
--

DROP TABLE IF EXISTS `sarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `IDOccupazione` int DEFAULT NULL,
  `IDSartoria` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDOccupazione` (`IDOccupazione`),
  KEY `IDSartoria` (`IDSartoria`),
  KEY `idx_Sarto_ID` (`ID`),
  CONSTRAINT `sarto_ibfk_1` FOREIGN KEY (`IDOccupazione`) REFERENCES `occupazione` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `sarto_ibfk_2` FOREIGN KEY (`IDSartoria`) REFERENCES `sartoria` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sartoria`
--

DROP TABLE IF EXISTS `sartoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sartoria` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Telefono` int DEFAULT NULL,
  `via` varchar(30) DEFAULT NULL,
  `Citta` varchar(20) DEFAULT NULL,
  `CAP` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spese`
--

DROP TABLE IF EXISTS `spese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spese` (
  `Ricevuta` varchar(25) NOT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `Ammontare` decimal(10,2) DEFAULT NULL,
  `CodiceTesserato` int DEFAULT NULL,
  `IDEvento` int DEFAULT NULL,
  PRIMARY KEY (`Ricevuta`),
  KEY `idx_Spese_IDEvento` (`IDEvento`),
  KEY `idx_Spese_CodiceTesserato` (`CodiceTesserato`),
  CONSTRAINT `spese_ibfk_1` FOREIGN KEY (`CodiceTesserato`) REFERENCES `tesserato` (`Codice`) ON DELETE SET NULL,
  CONSTRAINT `spese_ibfk_2` FOREIGN KEY (`IDEvento`) REFERENCES `evento` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sposa`
--

DROP TABLE IF EXISTS `sposa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sposa` (
  `CodiceAbito` char(6) DEFAULT NULL,
  `Anno` int DEFAULT NULL,
  KEY `CodiceAbito` (`CodiceAbito`),
  CONSTRAINT `sposa_ibfk_1` FOREIGN KEY (`CodiceAbito`) REFERENCES `abito` (`Codice`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tesserato`
--

DROP TABLE IF EXISTS `tesserato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tesserato` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(20) DEFAULT NULL,
  `Cognome` varchar(20) DEFAULT NULL,
  `DataNascita` date DEFAULT NULL,
  `LuogoNascita` varchar(20) DEFAULT NULL,
  `Sesso` varchar(1) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Telefono` varchar(11) DEFAULT NULL,
  `Eta` int DEFAULT NULL,
  `CodiceFiscale` varchar(16) DEFAULT NULL,
  `CheckValue` tinyint(1) DEFAULT NULL,
  `DataScadenza` date DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  UNIQUE KEY `idx_Tesserato_Codice` (`Codice`),
  CONSTRAINT `Maggiorenne` CHECK ((`Eta` >= 18))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-28 22:54:38
