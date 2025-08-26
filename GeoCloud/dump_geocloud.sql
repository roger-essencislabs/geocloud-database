CREATE DATABASE  IF NOT EXISTS `geocloudai` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `geocloudai`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: geocloudai
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `company` varchar(40) NOT NULL,
  `employees` varchar(10) NOT NULL,
  `acessMaxAttempts` int NOT NULL,
  `validityUserPassword` int NOT NULL,
  `validityInviteUser` int NOT NULL,
  `validityInviteProject` int NOT NULL,
  `guid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid_UNIQUE` (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Essencis Labs','Essencis Labs','6-10',5,30,10,10,'50b97e45-526c-4a8d-bddf-2d82e2f1b669'),(2,'Jpd Tech','Jpd Tech','1-5',5,30,15,15,'d9620a2c-f477-4050-8a6c-65dd230749f2'),(3,'Teste','teste','1-5',5,30,15,15,'996daa84-a6af-41fe-886c-3b7ebd679876'),(4,'GeoCloudAi','GeoCloudAI','10-50',5,30,15,15,'4e2e3188-f414-4460-b850-e03566ce84e8');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sampleId` int NOT NULL,
  `methodId` int NOT NULL,
  `statusId` int NOT NULL,
  `conclusion` date DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analysis_ibfk_1` (`sampleId`),
  KEY `analysis_ibfk_2` (`methodId`),
  KEY `analysis_ibfk_3` (`statusId`),
  KEY `analysis_ibfk_4` (`userId`),
  CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`sampleId`) REFERENCES `sample` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `analysis_ibfk_2` FOREIGN KEY (`methodId`) REFERENCES `analysismethod` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `analysis_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `analysisstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `analysis_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis`
--

LOCK TABLES `analysis` WRITE;
/*!40000 ALTER TABLE `analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysisassay`
--

DROP TABLE IF EXISTS `analysisassay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysisassay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `analysisId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `unitId` int NOT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  `error` decimal(10,0) DEFAULT NULL,
  `lowerLimit` decimal(10,0) DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `img` tinyint(1) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analysisAssay_ibfk_1` (`analysisId`),
  KEY `analysisAssay_ibfk_2` (`elementId`),
  KEY `analysisAssay_ibfk_3` (`unitId`),
  KEY `analysisAssay_ibfk_4` (`userId`),
  CONSTRAINT `analysisAssay_ibfk_1` FOREIGN KEY (`analysisId`) REFERENCES `analysis` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `analysisAssay_ibfk_2` FOREIGN KEY (`elementId`) REFERENCES `chemicalelement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `analysisAssay_ibfk_3` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `analysisAssay_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysisassay`
--

LOCK TABLES `analysisassay` WRITE;
/*!40000 ALTER TABLE `analysisassay` DISABLE KEYS */;
/*!40000 ALTER TABLE `analysisassay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysisassaytype`
--

DROP TABLE IF EXISTS `analysisassaytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysisassaytype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysisassaytype`
--

LOCK TABLES `analysisassaytype` WRITE;
/*!40000 ALTER TABLE `analysisassaytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `analysisassaytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysismethod`
--

DROP TABLE IF EXISTS `analysismethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysismethod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AnalysisMethod_ibfk_1` (`typeId`),
  CONSTRAINT `AnalysisMethod_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `analysistype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysismethod`
--

LOCK TABLES `analysismethod` WRITE;
/*!40000 ALTER TABLE `analysismethod` DISABLE KEYS */;
INSERT INTO `analysismethod` VALUES (1,9,'Wet Chemistry'),(2,9,'Portable X-ray Fluorescence (pXRF)'),(3,9,'Fire Assay '),(4,9,'Inductively Coupled Plasma (ICP-OES)'),(5,9,'Inductively Coupled Plasma MS (ICP-MS)'),(6,9,'X-ray Fluorescence (XRF)'),(7,9,'Neutron Activation Analysis (NAA)'),(8,2,'X-ray Diffraction (XRD)'),(9,2,'Optical Mineralogy'),(10,2,'Automated Mineralogy (SEM-EDS)'),(11,2,'Automated Mineralogy (Micro-XRF)'),(12,9,'Micro X-Ray Fluorescence (Micro-XRF)');
/*!40000 ALTER TABLE `analysismethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysisstatus`
--

DROP TABLE IF EXISTS `analysisstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysisstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AnalysisStatus_ibfk_1` (`accountId`),
  CONSTRAINT `AnalysisStatus_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysisstatus`
--

LOCK TABLES `analysisstatus` WRITE;
/*!40000 ALTER TABLE `analysisstatus` DISABLE KEYS */;
INSERT INTO `analysisstatus` VALUES (1,1,'Sample Received'),(2,1,'Sample Logged'),(3,1,'Pending'),(4,1,'In Progress'),(5,1,'Waiting for Results'),(6,1,'Under Review'),(7,1,'Verified'),(8,1,'Approved'),(9,1,'Completed'),(10,1,'Rejected'),(11,1,'Re-analysis Requested'),(12,1,'Canceled'),(13,1,'On Hold'),(14,1,'Reported'),(15,1,'Archived'),(16,1,'Expedited');
/*!40000 ALTER TABLE `analysisstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analysistype`
--

DROP TABLE IF EXISTS `analysistype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysistype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AnalysisType_ibfk_1` (`accountId`),
  CONSTRAINT `AnalysisType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysistype`
--

LOCK TABLES `analysistype` WRITE;
/*!40000 ALTER TABLE `analysistype` DISABLE KEYS */;
INSERT INTO `analysistype` VALUES (1,1,'Chemical Analysis'),(2,1,'Mineralogical Analysis'),(3,1,'Color Analysis'),(4,1,'Density (Specific Gravity) Analysis'),(5,1,'Particle Size Analysis'),(6,1,'Moisture Content Analysis'),(7,1,'Hardness Analysis'),(8,1,'Porosity and Permeability Analysis'),(9,1,'Geochemical Analysis'),(10,1,'Magnetic Susceptibility Analysis'),(11,1,'Structural Analysis');
/*!40000 ALTER TABLE `analysistype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chemicalelement`
--

DROP TABLE IF EXISTS `chemicalelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chemicalelement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `atomicNumber` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `symbol` varchar(2) NOT NULL,
  `atomicMass` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chemicalelement`
--

LOCK TABLES `chemicalelement` WRITE;
/*!40000 ALTER TABLE `chemicalelement` DISABLE KEYS */;
INSERT INTO `chemicalelement` VALUES (1,1,'Hydrogen','H',1),(2,2,'Helium','He',4),(3,3,'Lithium','Li',7),(4,4,'Beryllium','Be',9),(5,5,'Boron','B',11),(6,6,'Carbon','C',12),(7,7,'Nitrogen','N',14),(8,8,'Oxygen','O',16),(9,9,'Fluorine','F',19),(10,10,'Neon','Ne',20),(11,11,'Sodium','Na',23),(12,12,'Magnesium','Mg',24),(13,13,'Aluminum','Al',27),(14,14,'Silicon','Si',28),(15,15,'Phosphorus','P',31),(16,16,'Sulfur','S',32),(17,17,'Chlorine','Cl',35),(18,18,'Argon','Ar',40),(19,19,'Potassium','K',39),(20,20,'Calcium','Ca',40),(21,21,'Scandium','Sc',45),(22,22,'Titanium','Ti',48),(23,23,'Vanadium','V',51),(24,24,'Chromium','Cr',52),(25,25,'Manganese','Mn',55),(26,26,'Iron','Fe',56),(27,27,'Cobalt','Co',59),(28,28,'Nickel','Ni',59),(29,29,'Copper','Cu',64),(30,30,'Zinc','Zn',65),(31,31,'Gallium','Ga',70),(32,32,'Germanium','Ge',73),(33,33,'Arsenic','As',75),(34,34,'Selenium','Se',79),(35,35,'Bromine','Br',80),(36,36,'Krypton','Kr',84),(37,37,'Rubidium','Rb',85),(38,38,'Strontium','Sr',88),(39,39,'Yttrium','Y',89),(40,40,'Zirconium','Zr',91),(41,41,'Niobium','Nb',93),(42,42,'Molybdenum','Mo',96),(43,43,'Technetium','Tc',98),(44,44,'Ruthenium','Ru',101),(45,45,'Rhodium','Rh',103),(46,46,'Palladium','Pd',106),(47,47,'Silver','Ag',108),(48,48,'Cadmium','Cd',112),(49,49,'Indium','In',115),(50,50,'Tin','Sn',119),(51,51,'Antimony','Sb',122),(52,52,'Tellurium','Te',128),(53,53,'Iodine','I',127),(54,54,'Xenon','Xe',131),(55,55,'Cesium','Cs',133),(56,56,'Barium','Ba',137),(57,57,'Lanthanum','La',139),(58,58,'Cerium','Ce',140),(59,59,'Praseodymium','Pr',141),(60,60,'Neodymium','Nd',144),(61,61,'Promethium','Pm',145),(62,62,'Samarium','Sm',150),(63,63,'Europium','Eu',152),(64,64,'Gadolinium','Gd',157),(65,65,'Terbium','Tb',159),(66,66,'Dysprosium','Dy',163),(67,67,'Holmium','Ho',165),(68,68,'Erbium','Er',167),(69,69,'Thulium','Tm',169),(70,70,'Ytterbium','Yb',173),(71,71,'Lutetium','Lu',175),(72,72,'Hafnium','Hf',178),(73,73,'Tantalum','Ta',181),(74,74,'Tungsten','W',184),(75,75,'Rhenium','Re',186),(76,76,'Osmium','Os',190),(77,77,'Iridium','Ir',192),(78,78,'Platinum','Pt',195),(79,79,'Gold','Au',197),(80,80,'Mercury','Hg',201),(81,81,'Thallium','Tl',204),(82,82,'Lead','Pb',207),(83,83,'Bismuth','Bi',210),(84,84,'Polonium','Po',209),(85,85,'Astatine','At',210),(86,86,'Radon','Rn',222),(87,87,'Francium','Fr',223),(88,88,'Radium','Ra',226),(89,89,'Actinium','Ac',227),(90,90,'Thorium','Th',232),(91,91,'Protactinium','Pa',231),(92,92,'Uranium','U',238),(93,93,'Neptunium','Np',237),(94,94,'Plutonium','Pu',244),(95,95,'Americium','Am',243),(96,96,'Curium','Cm',247),(97,97,'Berkelium','Bk',247),(98,98,'Californium','Cf',251),(99,99,'Einsteinium','Es',252),(100,100,'Fermium','Fm',257),(101,101,'Mendelevium','Md',258),(102,102,'Nobelium','No',259),(103,103,'Lawrencium','Lr',262),(104,104,'Rutherfordium','Rf',267),(105,105,'Dubnium','Db',270),(106,106,'Seaborgium','Sg',271),(107,107,'Bohrium','Bh',270),(108,108,'Hassium','Hs',277),(109,109,'Meitnerium','Mt',278),(110,110,'Darmstadtium','Ds',281),(111,111,'Roentgenium','Rg',282),(112,112,'Copernicium','Cn',285),(113,113,'Nihonium','Nh',286),(114,114,'Flerovium','Fl',289),(115,115,'Moscovium','Mc',290),(116,116,'Livermorium','Lv',293),(117,117,'Tennessine','Ts',294),(118,118,'Oganesson','Og',294);
/*!40000 ALTER TABLE `chemicalelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `color_ibfk_1` (`accountId`),
  CONSTRAINT `color_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,1,'black'),(2,1,'white'),(3,1,'red'),(4,1,'blue'),(5,1,'green'),(6,1,'gray');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity`
--

DROP TABLE IF EXISTS `commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regionId` int NOT NULL,
  `depositId` int DEFAULT NULL,
  `mineId` int DEFAULT NULL,
  `mineAreaId` int DEFAULT NULL,
  `elementId` int NOT NULL,
  `value` decimal(10,0) DEFAULT NULL,
  `unitId` int DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `remarks` varchar(40) DEFAULT NULL,
  `resource` decimal(10,0) DEFAULT NULL,
  `reserve` decimal(10,0) DEFAULT NULL,
  `production` decimal(10,0) DEFAULT NULL,
  `rank_` int DEFAULT NULL,
  `grade` decimal(10,0) DEFAULT NULL,
  `gradeUnitId` int DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commodity_ibfk_1` (`regionId`),
  KEY `commodity_ibfk_2` (`depositId`),
  KEY `commodity_ibfk_3` (`mineId`),
  KEY `commodity_ibfk_4` (`mineAreaId`),
  KEY `commodity_ibfk_5` (`elementId`),
  KEY `commodity_ibfk_6` (`unitId`),
  KEY `commodity_ibfk_7` (`gradeUnitId`),
  KEY `commodity_ibfk_8` (`userId`),
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_2` FOREIGN KEY (`depositId`) REFERENCES `deposit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_3` FOREIGN KEY (`mineId`) REFERENCES `mine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_4` FOREIGN KEY (`mineAreaId`) REFERENCES `minearea` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_5` FOREIGN KEY (`elementId`) REFERENCES `chemicalelement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_6` FOREIGN KEY (`unitId`) REFERENCES `unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_7` FOREIGN KEY (`gradeUnitId`) REFERENCES `unit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commodity_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity`
--

LOCK TABLES `commodity` WRITE;
/*!40000 ALTER TABLE `commodity` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `imgTypeProfile` varchar(4) DEFAULT NULL,
  `imgTypeCover` varchar(4) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Company_ibfk_1` (`accountId`),
  KEY `Company_ibfk_2` (`typeId`),
  KEY `Company_ibfk_3` (`userId`),
  CONSTRAINT `Company_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Company_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `companytype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Company_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,1,'ABC Drilling',NULL,1,'jpg','jpg',1,'2024-04-18'),(2,1,'Geo New',NULL,2,'jpg','jpg',1,'2024-04-18'),(3,1,'Trans Rock',NULL,3,'jpg','png',1,'2024-04-18'),(4,2,'New Age',NULL,5,NULL,NULL,2,'2024-04-18');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companytype`
--

DROP TABLE IF EXISTS `companytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companytype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CompanyType_ibfk_1` (`accountId`),
  CONSTRAINT `CompanyType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companytype`
--

LOCK TABLES `companytype` WRITE;
/*!40000 ALTER TABLE `companytype` DISABLE KEYS */;
INSERT INTO `companytype` VALUES (1,1,'Drilling','png'),(2,1,'Geotechnical','png'),(3,1,'Mineral Exploration','png'),(4,2,'Drilling',NULL),(5,2,'Geology',NULL),(6,1,'Mining Equipment ','png');
/*!40000 ALTER TABLE `companytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coreshed`
--

DROP TABLE IF EXISTS `coreshed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coreshed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CoreShed_ibfk_1` (`accountId`),
  CONSTRAINT `CoreShed_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coreshed`
--

LOCK TABLES `coreshed` WRITE;
/*!40000 ALTER TABLE `coreshed` DISABLE KEYS */;
INSERT INTO `coreshed` VALUES (1,1,'Core Shed 1',NULL),(2,1,'Core Shed 2',NULL),(3,1,'Core Shed 3',NULL),(4,2,'Core Shed 4',NULL),(5,2,'Core Shed 5',NULL);
/*!40000 ALTER TABLE `coreshed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `acronym2` varchar(2) NOT NULL,
  `acronym3` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan','AF','AFG'),(2,'Aland Islands','AX','ALA'),(3,'Albania','AL','ALB'),(4,'Algeria','DZ','DZA'),(5,'American Samoa','AS','ASM'),(6,'Andorra','AD','AND'),(7,'Angola','AO','AGO'),(8,'Anguilla','AI','AIA'),(9,'Antarctica','AQ','ATA'),(10,'Antigua and Barbuda','AG','ATG'),(11,'Argentina','AR','ARG'),(12,'Armenia','AM','ARM'),(13,'Aruba','AW','ABW'),(14,'Australia','AU','AUS'),(15,'Austria','AT','AUT'),(16,'Azerbaijan','AZ','AZE'),(17,'Bahamas (the)','BS','BHS'),(18,'Bahrain','BH','BHR'),(19,'Bangladesh','BD','BGD'),(20,'Barbados','BB','BRB'),(21,'Belarus','BY','BLR'),(22,'Belgium','BE','BEL'),(23,'Belize','BZ','BLZ'),(24,'Benin','BJ','BEN'),(25,'Bermuda','BM','BMU'),(26,'Bhutan','BT','BTN'),(27,'Bolivia (Plurinational State of)','BO','BOL'),(28,'Bonaire, Sint Eustatius and Saba','BQ','BES'),(29,'Bosnia and Herzegovina','BA','BIH'),(30,'Botswana','BW','BWA'),(31,'Bouvet Island','BV','BVT'),(32,'Brazil','BR','BRA'),(33,'British Indian Ocean Territory (the)','IO','IOT'),(34,'Brunei Darussalam','BN','BRN'),(35,'Bulgaria','BG','BGR'),(36,'Burkina Faso','BF','BFA'),(37,'Burundi','BI','BDI'),(38,'Cabo Verde','CV','CPV'),(39,'Cambodia','KH','KHM'),(40,'Cameroon','CM','CMR'),(41,'Canada','CA','CAN'),(42,'Cayman Islands (the)','KY','CYM'),(43,'Central African Republic (the)','CF','CAF'),(44,'Chad','TD','TCD'),(45,'Chile','CL','CHL'),(46,'China','CN','CHN'),(47,'Christmas Island','CX','CXR'),(48,'Cocos (Keeling) Islands (the)','CC','CCK'),(49,'Colombia','CO','COL'),(50,'Comoros (the)','KM','COM'),(51,'Congo (the Democratic Republic of the)','CD','COD'),(52,'Congo (the)','CG','COG'),(53,'Cook Islands (the)','CK','COK'),(54,'Costa Rica','CR','CRI'),(55,'Côte d\'Ivoire','CI','CIV'),(56,'Croatia','HR','HRV'),(57,'Cuba','CU','CUB'),(58,'Curaçao','CW','CUW'),(59,'Cyprus','CY','CYP'),(60,'Czechia','CZ','CZE'),(61,'Denmark','DK','DNK'),(62,'Djibouti','DJ','DJI'),(63,'Dominica','DM','DMA'),(64,'Dominican Republic (the)','DO','DOM'),(65,'Ecuador','EC','ECU'),(66,'Egypt','EG','EGY'),(67,'El Salvador','SV','SLV'),(68,'Equatorial Guinea','GQ','GNQ'),(69,'Eritrea','ER','ERI'),(70,'Estonia','EE','EST'),(71,'Eswatini','SZ','SWZ'),(72,'Ethiopia','ET','ETH'),(73,'Falkland Islands (the) [Malvinas]','FK','FLK'),(74,'Faroe Islands (the)','FO','FRO'),(75,'Fiji','FJ','FJI'),(76,'Finland','FI','FIN'),(77,'France','FR','FRA'),(78,'French Guiana','GF','GUF'),(79,'French Polynesia','PF','PYF'),(80,'French Southern Territories (the)','TF','ATF'),(81,'Gabon','GA','GAB'),(82,'Gambia (the)','GM','GMB'),(83,'Georgia','GE','GEO'),(84,'Germany','DE','DEU'),(85,'Ghana','GH','GHA'),(86,'Gibraltar','GI','GIB'),(87,'Greece','GR','GRC'),(88,'Greenland','GL','GRL'),(89,'Grenada','GD','GRD'),(90,'Guadeloupe','GP','GLP'),(91,'Guam','GU','GUM'),(92,'Guatemala','GT','GTM'),(93,'Guernsey','GG','GGY'),(94,'Guinea','GN','GIN'),(95,'Guinea-Bissau','GW','GNB'),(96,'Guyana','GY','GUY'),(97,'Haiti','HT','HTI'),(98,'Heard Island and McDonald Islands','HM','HMD'),(99,'Holy See (the)','VA','VAT'),(100,'Honduras','HN','HND'),(101,'Hong Kong','HK','HKG'),(102,'Hungary','HU','HUN'),(103,'Iceland','IS','ISL'),(104,'India','IN','IND'),(105,'Indonesia','ID','IDN'),(106,'Iran (Islamic Republic of)','IR','IRN'),(107,'Iraq','IQ','IRQ'),(108,'Ireland','IE','IRL'),(109,'Isle of Man','IM','IMN'),(110,'Israel','IL','ISR'),(111,'Italy','IT','ITA'),(112,'Jamaica','JM','JAM'),(113,'Japan','JP','JPN'),(114,'Jersey','JE','JEY'),(115,'Jordan','JO','JOR'),(116,'Kazakhstan','KZ','KAZ'),(117,'Kenya','KE','KEN'),(118,'Kiribati','KI','KIR'),(119,'Korea (the Democratic People\'s Republic of)','KP','PRK'),(120,'Korea (the Republic of)','KR','KOR'),(121,'Kuwait','KW','KWT'),(122,'Kyrgyzstan','KG','KGZ'),(123,'Lao People\'s Democratic Republic (the)','LA','LAO'),(124,'Latvia','LV','LVA'),(125,'Lebanon','LB','LBN'),(126,'Lesotho','LS','LSO'),(127,'Liberia','LR','LBR'),(128,'Libya','LY','LBY'),(129,'Liechtenstein','LI','LIE'),(130,'Lithuania','LT','LTU'),(131,'Luxembourg','LU','LUX'),(132,'Macao','MO','MAC'),(133,'Madagascar','MG','MDG'),(134,'Malawi','MW','MWI'),(135,'Malaysia','MY','MYS'),(136,'Maldives','MV','MDV'),(137,'Mali','ML','MLI'),(138,'Malta','MT','MLT'),(139,'Marshall Islands (the)','MH','MHL'),(140,'Martinique','MQ','MTQ'),(141,'Mauritania','MR','MRT'),(142,'Mauritius','MU','MUS'),(143,'Mayotte','YT','MYT'),(144,'Mexico','MX','MEX'),(145,'Micronesia (Federated States of)','FM','FSM'),(146,'Moldova (the Republic of)','MD','MDA'),(147,'Monaco','MC','MCO'),(148,'Mongolia','MN','MNG'),(149,'Montenegro','ME','MNE'),(150,'Montserrat','MS','MSR'),(151,'Morocco','MA','MAR'),(152,'Mozambique','MZ','MOZ'),(153,'Myanmar','MM','MMR'),(154,'Namibia','NA','NAM'),(155,'Nauru','NR','NRU'),(156,'Nepal','NP','NPL'),(157,'Netherlands (the)','NL','NLD'),(158,'New Caledonia','NC','NCL'),(159,'New Zealand','NZ','NZL'),(160,'Nicaragua','NI','NIC'),(161,'Niger (the)','NE','NER'),(162,'Nigeria','NG','NGA'),(163,'Niue','NU','NIU'),(164,'Norfolk Island','NF','NFK'),(165,'Northern Mariana Islands (the)','MP','MNP'),(166,'Norway','NO','NOR'),(167,'Oman','OM','OMN'),(168,'Pakistan','PK','PAK'),(169,'Palau','PW','PLW'),(170,'Palestine, State of','PS','PSE'),(171,'Panama','PA','PAN'),(172,'Papua New Guinea','PG','PNG'),(173,'Paraguay','PY','PRY'),(174,'Peru','PE','PER'),(175,'Philippines (the)','PH','PHL'),(176,'Pitcairn','PN','PCN'),(177,'Poland','PL','POL'),(178,'Portugal','PT','PRT'),(179,'Puerto Rico','PR','PRI'),(180,'Qatar','QA','QAT'),(181,'Republic of North Macedonia','MK','MKD'),(182,'Réunion','RE','REU'),(183,'Romania','RO','ROU'),(184,'Russian Federation (the)','RU','RUS'),(185,'Rwanda','RW','RWA'),(186,'Saint Barthélemy','BL','BLM'),(187,'Saint Helena, Ascension and Tristan da Cunha','SH','SHN'),(188,'Saint Kitts and Nevis','KN','KNA'),(189,'Saint Lucia','LC','LCA'),(190,'Saint Martin (French part)','MF','MAF'),(191,'Saint Pierre and Miquelon','PM','SPM'),(192,'Saint Vincent and the Grenadines','VC','VCT'),(193,'Samoa','WS','WSM'),(194,'San Marino','SM','SMR'),(195,'Sao Tome and Principe','ST','STP'),(196,'Saudi Arabia','SA','SAU'),(197,'Senegal','SN','SEN'),(198,'Serbia','RS','SRB'),(199,'Seychelles','SC','SYC'),(200,'Sierra Leone','SL','SLE'),(201,'Singapore','SG','SGP'),(202,'Sint Maarten (Dutch part)','SX','SXM'),(203,'Slovakia','SK','SVK'),(204,'Slovenia','SI','SVN'),(205,'Solomon Islands','SB','SLB'),(206,'Somalia','SO','SOM'),(207,'South Africa','ZA','ZAF'),(208,'South Georgia and the South Sandwich Islands','GS','SGS'),(209,'South Sudan','SS','SSD'),(210,'Spain','ES','ESP'),(211,'Sri Lanka','LK','LKA'),(212,'Sudan (the)','SD','SDN'),(213,'Suriname','SR','SUR'),(214,'Svalbard and Jan Mayen','SJ','SJM'),(215,'Sweden','SE','SWE'),(216,'Switzerland','CH','CHE'),(217,'Syrian Arab Republic','SY','SYR'),(218,'Taiwan (Province of China)','TW','TWN'),(219,'Tajikistan','TJ','TJK'),(220,'Tanzania, United Republic of','TZ','TZA'),(221,'Thailand','TH','THA'),(222,'Timor-Leste','TL','TLS'),(223,'Togo','TG','TGO'),(224,'Tokelau','TK','TKL'),(225,'Tonga','TO','TON'),(226,'Trinidad and Tobago','TT','TTO'),(227,'Tunisia','TN','TUN'),(228,'Turkey','TR','TUR'),(229,'Turkmenistan','TM','TKM'),(230,'Turks and Caicos Islands (the)','TC','TCA'),(231,'Tuvalu','TV','TUV'),(232,'Uganda','UG','UGA'),(233,'Ukraine','UA','UKR'),(234,'United Arab Emirates (the)','AE','ARE'),(235,'United Kingdom of Great Britain and Northern Ireland (the)','GB','GBR'),(236,'United States Minor Outlying Islands (the)','UM','UMI'),(237,'United States of America (the)','US','USA'),(238,'Uruguay','UY','URY'),(239,'Uzbekistan','UZ','UZB'),(240,'Vanuatu','VU','VUT'),(241,'Venezuela (Bolivarian Republic of)','VE','VEN'),(242,'Viet Nam','VN','VNM'),(243,'Virgin Islands (British)','VG','VGB'),(244,'Virgin Islands (U.S.)','VI','VIR'),(245,'Wallis and Futuna','WF','WLF'),(246,'Western Sahara','EH','ESH'),(247,'Yemen','YE','YEM'),(248,'Zambia','ZM','ZMB'),(249,'Zimbabwe','ZW','ZWE');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regionId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `alternativeNames` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `geologicalDistrict` varchar(40) DEFAULT NULL,
  `discoveryBy` varchar(40) DEFAULT NULL,
  `discoveryYear` int DEFAULT NULL,
  `resource` int DEFAULT NULL,
  `reserve` int DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `depositTypeId` int DEFAULT NULL,
  `oreGeneticTypeId` int DEFAULT NULL,
  `oreGeneticTypeSubId` int DEFAULT NULL,
  `metalGroupId` int DEFAULT NULL,
  `metalGroupSubId` int DEFAULT NULL,
  `imgTypeProfile` varchar(4) DEFAULT NULL,
  `imgTypeCover` varchar(4) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deposit_ibfk_2` (`depositTypeId`),
  KEY `deposit_ibfk_3` (`oreGeneticTypeId`),
  KEY `deposit_ibfk_4` (`oreGeneticTypeSubId`),
  KEY `deposit_ibfk_5` (`metalGroupId`),
  KEY `deposit_ibfk_6` (`metalGroupSubId`),
  KEY `deposit_ibfk_7` (`userId`),
  KEY `deposit_ibfk_1` (`regionId`),
  CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`depositTypeId`) REFERENCES `deposittype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deposit_ibfk_3` FOREIGN KEY (`oreGeneticTypeId`) REFERENCES `oregenetictype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deposit_ibfk_4` FOREIGN KEY (`oreGeneticTypeSubId`) REFERENCES `oregenetictypesub` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deposit_ibfk_5` FOREIGN KEY (`metalGroupId`) REFERENCES `metalgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deposit_ibfk_6` FOREIGN KEY (`metalGroupSubId`) REFERENCES `metalgroupsub` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deposit_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposit`
--

LOCK TABLES `deposit` WRITE;
/*!40000 ALTER TABLE `deposit` DISABLE KEYS */;
INSERT INTO `deposit` VALUES (1,1,'Complexo de Itabira',NULL,'Minas Gerais','São José do Jacaré',-18.87307236,-43.06571666,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,'jpg','jpg',1,'2024-08-24'),(2,1,'Tapira ',NULL,'MInas Gerais','Tapira ',-18.65462146,-43.76814533,'Tapira ','Vale',NULL,NULL,NULL,NULL,3,6,5,NULL,NULL,'jpg','jpg',2,'2024-08-24'),(3,2,'Canaã dos Carajás',NULL,'Pará','Parauapebas',-6.82613080,-50.09100651,'Parauapebas','Vale',2001,7,10,NULL,1,1,1,2,3,'jpg','jpg',2,'2024-08-24'),(4,3,'Deposit 4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-08-24');
/*!40000 ALTER TABLE `deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposittype`
--

DROP TABLE IF EXISTS `deposittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposittype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DepositType_ibfk_1` (`accountId`),
  CONSTRAINT `DepositType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposittype`
--

LOCK TABLES `deposittype` WRITE;
/*!40000 ALTER TABLE `deposittype` DISABLE KEYS */;
INSERT INTO `deposittype` VALUES (1,1,'Magmatic ','png'),(2,1,'Hydrothermal ','png'),(3,1,'Sedimentary','png'),(4,2,'General',NULL),(5,1,'Placer','png'),(6,1,'Metamorphic','png'),(7,1,'Coal Seam','png'),(8,1,'Lateritic','png'),(9,1,'Volcanogenic Massive Sulfide','png'),(10,1,'Skarn','png'),(11,1,'Lateritic Nickel Deposits',NULL);
/*!40000 ALTER TABLE `deposittype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviation`
--

DROP TABLE IF EXISTS `deviation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deviation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillHoleId` int NOT NULL,
  `startDepth` decimal(10,0) NOT NULL,
  `endDepth` decimal(10,0) DEFAULT NULL,
  `dip` decimal(10,0) NOT NULL,
  `azimuth` decimal(10,0) NOT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deviation_ibfk_1` (`drillHoleId`),
  KEY `deviation_ibfk_2` (`userId`),
  CONSTRAINT `deviation_ibfk_1` FOREIGN KEY (`drillHoleId`) REFERENCES `drillhole` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `deviation_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviation`
--

LOCK TABLES `deviation` WRITE;
/*!40000 ALTER TABLE `deviation` DISABLE KEYS */;
INSERT INTO `deviation` VALUES (1,2,0,5,55,-25,NULL,1,'2024-09-07'),(2,1,0,10,-150,50,NULL,1,'2024-09-09');
/*!40000 ALTER TABLE `deviation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillbox`
--

DROP TABLE IF EXISTS `drillbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillbox` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillHoleId` int NOT NULL,
  `number` int NOT NULL,
  `amountCores` int DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `startDepth` decimal(10,0) DEFAULT NULL,
  `endDepth` decimal(10,0) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `materialId` int DEFAULT NULL,
  `coreShedId` int DEFAULT NULL,
  `shelves` varchar(40) DEFAULT NULL,
  `imgOriginal` tinyint(1) DEFAULT NULL,
  `imgEdited` tinyint(1) DEFAULT NULL,
  `imgBoxId` int DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillbox_ibfk_2` (`typeId`),
  KEY `drillbox_ibfk_3` (`statusId`),
  KEY `drillbox_ibfk_4` (`materialId`),
  KEY `drillbox_ibfk_5` (`coreShedId`),
  KEY `drillbox_ibfk_6` (`userId`),
  KEY `drillbox_ibfk_1` (`drillHoleId`),
  KEY `drillbox_ibfk_7_idx` (`imgBoxId`),
  CONSTRAINT `drillbox_ibfk_1` FOREIGN KEY (`drillHoleId`) REFERENCES `drillhole` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillbox_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `drillboxtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillbox_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `drillboxstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillbox_ibfk_4` FOREIGN KEY (`materialId`) REFERENCES `drillboxmaterial` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillbox_ibfk_5` FOREIGN KEY (`coreShedId`) REFERENCES `coreshed` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillbox_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillbox_ibfk_7` FOREIGN KEY (`imgBoxId`) REFERENCES `rect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillbox`
--

LOCK TABLES `drillbox` WRITE;
/*!40000 ALTER TABLE `drillbox` DISABLE KEYS */;
INSERT INTO `drillbox` VALUES (1,1,1,NULL,'Drill Box 1',NULL,0,4,NULL,NULL,1,1,1,1,'shelve 001.11',1,NULL,1,1,'2024-04-26'),(2,1,2,4,'Drill Box 2','teste_uuid',4,8,'string','string',1,1,1,1,'shelve 001.11',1,NULL,8,1,'2024-04-26'),(3,1,3,4,'Drill Box 3','teste_uuid',8,12,'string','string',1,1,1,1,'shelve 001.12',1,NULL,NULL,1,'2024-04-26'),(4,1,4,NULL,'Drill Box 4',NULL,12,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,'2024-03-26'),(5,1,5,NULL,'Drill Box 5',NULL,16,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,'2024-03-26'),(6,1,6,NULL,'Drill Box 6',NULL,20,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,2,'2024-03-26'),(7,9,1,NULL,'Drill Box 7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-03-26'),(8,9,2,NULL,'Drill Box 8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-03-26'),(9,9,3,NULL,'Drill Box 9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-03-26'),(10,9,4,NULL,'Drill Box 10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-03-26'),(11,6,1,NULL,'Drill Box 11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-05-03'),(12,1,7,NULL,'Drill Box 12',NULL,24,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,2,'2024-05-03'),(13,1,8,NULL,'Drill Box 13',NULL,28,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,2,'2024-05-03');
/*!40000 ALTER TABLE `drillbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillboxactivity`
--

DROP TABLE IF EXISTS `drillboxactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillboxactivity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillBoxId` int NOT NULL,
  `activityId` int NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillBoxActivity_ibfk_1` (`drillBoxId`),
  KEY `DrillBoxActivity_ibfk_2` (`activityId`),
  KEY `DrillBoxActivity_ibfk_3` (`userId`),
  CONSTRAINT `DrillBoxActivity_ibfk_1` FOREIGN KEY (`drillBoxId`) REFERENCES `drillbox` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `DrillBoxActivity_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `drillboxactivitytype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `DrillBoxActivity_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillboxactivity`
--

LOCK TABLES `drillboxactivity` WRITE;
/*!40000 ALTER TABLE `drillboxactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `drillboxactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillboxactivitytype`
--

DROP TABLE IF EXISTS `drillboxactivitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillboxactivitytype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillBoxActivityType_ibfk_1` (`accountId`),
  CONSTRAINT `DrillBoxActivityType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillboxactivitytype`
--

LOCK TABLES `drillboxactivitytype` WRITE;
/*!40000 ALTER TABLE `drillboxactivitytype` DISABLE KEYS */;
INSERT INTO `drillboxactivitytype` VALUES (1,1,'Drill Box Activity Type 1',NULL),(2,1,'Drill Box Activity Type 2',NULL),(3,1,'Drill Box Activity Type 3',NULL),(4,2,'Drill Box Activity Type 4',NULL),(5,2,'Drill Box Activity Type 5',NULL);
/*!40000 ALTER TABLE `drillboxactivitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillboxmaterial`
--

DROP TABLE IF EXISTS `drillboxmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillboxmaterial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillBoxMaterial_ibfk_1` (`accountId`),
  CONSTRAINT `DrillBoxMaterial_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillboxmaterial`
--

LOCK TABLES `drillboxmaterial` WRITE;
/*!40000 ALTER TABLE `drillboxmaterial` DISABLE KEYS */;
INSERT INTO `drillboxmaterial` VALUES (1,1,'Plastic'),(2,1,'Wood'),(3,1,'Waxed Cardboard'),(4,2,'Plastic'),(5,2,'Wood');
/*!40000 ALTER TABLE `drillboxmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillboxstatus`
--

DROP TABLE IF EXISTS `drillboxstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillboxstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillBoxStatus_ibfk_1` (`accountId`),
  CONSTRAINT `DrillBoxStatus_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillboxstatus`
--

LOCK TABLES `drillboxstatus` WRITE;
/*!40000 ALTER TABLE `drillboxstatus` DISABLE KEYS */;
INSERT INTO `drillboxstatus` VALUES (1,1,'Labeled',NULL),(2,1,'Unlabeled',NULL),(3,1,'Stored',NULL),(4,2,'Drill Box Status 4',NULL),(5,2,'Drill Box Status 5',NULL),(6,1,'Transported',NULL),(7,1,'Under Review',NULL),(8,1,'Logged',NULL),(9,1,'Unlogged',NULL),(10,1,'Marked for Cutting',NULL),(11,1,'Cutting in Progress',NULL),(12,1,'Sampled for Assay',NULL);
/*!40000 ALTER TABLE `drillboxstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillboxtype`
--

DROP TABLE IF EXISTS `drillboxtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillboxtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillBoxType_ibfk_1` (`accountId`),
  CONSTRAINT `DrillBoxType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillboxtype`
--

LOCK TABLES `drillboxtype` WRITE;
/*!40000 ALTER TABLE `drillboxtype` DISABLE KEYS */;
INSERT INTO `drillboxtype` VALUES (1,1,'BQ'),(2,1,'NQ'),(3,1,'HQ'),(4,2,'PQ'),(5,2,'BQ');
/*!40000 ALTER TABLE `drillboxtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillcore`
--

DROP TABLE IF EXISTS `drillcore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillcore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillBoxId` int NOT NULL,
  `number` int NOT NULL,
  `startDepth` decimal(10,0) DEFAULT NULL,
  `endDepth` decimal(10,0) DEFAULT NULL,
  `startRunId` int DEFAULT NULL,
  `endRunId` int DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `imgCoreId` int NOT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillcore_ibfk_1` (`drillBoxId`),
  KEY `drillcore_ibfk_4` (`imgCoreId`),
  KEY `drillcore_ibfk_5` (`userId`),
  KEY `drillcore_ibfk_2` (`startRunId`),
  KEY `drillcore_ibfk_3` (`endRunId`),
  CONSTRAINT `drillcore_ibfk_1` FOREIGN KEY (`drillBoxId`) REFERENCES `drillbox` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcore_ibfk_2` FOREIGN KEY (`startRunId`) REFERENCES `drillholerun` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcore_ibfk_3` FOREIGN KEY (`endRunId`) REFERENCES `drillholerun` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcore_ibfk_4` FOREIGN KEY (`imgCoreId`) REFERENCES `rect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcore_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillcore`
--

LOCK TABLES `drillcore` WRITE;
/*!40000 ALTER TABLE `drillcore` DISABLE KEYS */;
INSERT INTO `drillcore` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,2,1,'2025-02-18'),(2,1,2,NULL,NULL,NULL,NULL,NULL,3,1,'2025-02-18'),(3,2,1,NULL,NULL,NULL,NULL,NULL,9,1,'2025-02-18'),(4,2,3,NULL,NULL,NULL,NULL,NULL,12,1,'2025-02-18'),(5,2,4,NULL,NULL,NULL,NULL,NULL,13,1,'2025-02-18'),(6,2,2,NULL,NULL,NULL,NULL,NULL,15,1,'2025-02-18'),(7,1,1,128,128,NULL,NULL,NULL,16,1,'2025-04-18');
/*!40000 ALTER TABLE `drillcore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillcoreannotation`
--

DROP TABLE IF EXISTS `drillcoreannotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillcoreannotation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillCoreId` int NOT NULL,
  `annotation` varchar(40) NOT NULL,
  `imgRectId` int NOT NULL,
  `userId` int NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillcoreannotation_ibfk_1` (`drillCoreId`),
  KEY `drillcoredannotation_ibfk_2` (`imgRectId`),
  KEY `drillcoreannotation_ibfk_3` (`userId`),
  CONSTRAINT `drillcoreannotation_ibfk_1` FOREIGN KEY (`drillCoreId`) REFERENCES `drillcore` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcoreannotation_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcoredannotation_ibfk_2` FOREIGN KEY (`imgRectId`) REFERENCES `rect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillcoreannotation`
--

LOCK TABLES `drillcoreannotation` WRITE;
/*!40000 ALTER TABLE `drillcoreannotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `drillcoreannotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillcoredepth`
--

DROP TABLE IF EXISTS `drillcoredepth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillcoredepth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillCoreId` int NOT NULL,
  `depth` decimal(10,0) NOT NULL,
  `imgRectId` int NOT NULL,
  `userId` int NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillcoredepth_ibfk_1` (`drillCoreId`),
  KEY `drillcoredepth_ibfk_2` (`imgRectId`),
  KEY `drillcoredepth_ibfk_3` (`userId`),
  CONSTRAINT `drillcoredepth_ibfk_1` FOREIGN KEY (`drillCoreId`) REFERENCES `drillcore` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcoredepth_ibfk_2` FOREIGN KEY (`imgRectId`) REFERENCES `rect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcoredepth_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillcoredepth`
--

LOCK TABLES `drillcoredepth` WRITE;
/*!40000 ALTER TABLE `drillcoredepth` DISABLE KEYS */;
/*!40000 ALTER TABLE `drillcoredepth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillcorefracture`
--

DROP TABLE IF EXISTS `drillcorefracture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillcorefracture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillCoreId` int NOT NULL,
  `fractureId` int NOT NULL,
  `imgRectId` int NOT NULL,
  `userId` int NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillcorefracture_ibfk_1` (`drillCoreId`),
  KEY `drillcorefracture_ibfk_2` (`fractureId`),
  KEY `drillcorefracture_ibfk_3` (`imgRectId`),
  KEY `drillcorefracture_ibfk_4` (`userId`),
  CONSTRAINT `drillcorefracture_ibfk_1` FOREIGN KEY (`drillCoreId`) REFERENCES `drillcore` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcorefracture_ibfk_2` FOREIGN KEY (`fractureId`) REFERENCES `fracturetype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcorefracture_ibfk_3` FOREIGN KEY (`imgRectId`) REFERENCES `rect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcorefracture_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillcorefracture`
--

LOCK TABLES `drillcorefracture` WRITE;
/*!40000 ALTER TABLE `drillcorefracture` DISABLE KEYS */;
/*!40000 ALTER TABLE `drillcorefracture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillcorelithology`
--

DROP TABLE IF EXISTS `drillcorelithology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillcorelithology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillCoreId` int NOT NULL,
  `lithologyId` int NOT NULL,
  `imgRectId` int NOT NULL,
  `userId` int NOT NULL,
  `register` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillcorelithology_ibfk_1` (`drillCoreId`),
  KEY `drillcorelithology_ibfk_2` (`lithologyId`),
  KEY `drillcorelithology_ibfk_3` (`imgRectId`),
  KEY `drillcorelithology_ibfk_4` (`userId`),
  CONSTRAINT `drillcorelithology_ibfk_1` FOREIGN KEY (`drillCoreId`) REFERENCES `drillcore` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcorelithology_ibfk_2` FOREIGN KEY (`lithologyId`) REFERENCES `lithology` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcorelithology_ibfk_3` FOREIGN KEY (`imgRectId`) REFERENCES `rect` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillcorelithology_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillcorelithology`
--

LOCK TABLES `drillcorelithology` WRITE;
/*!40000 ALTER TABLE `drillcorelithology` DISABLE KEYS */;
INSERT INTO `drillcorelithology` VALUES (1,2,8,4,1,'2025-02-18 21:00:02'),(2,1,6,5,1,'2025-02-18 21:00:22'),(3,1,3,7,1,'2025-02-18 21:01:40'),(4,3,3,10,1,'2025-02-18 21:15:32'),(5,3,6,11,1,'2025-02-18 21:16:50'),(6,5,10,14,1,'2025-02-18 21:18:50'),(7,7,5,17,1,'2025-04-18 14:55:29');
/*!40000 ALTER TABLE `drillcorelithology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillhole`
--

DROP TABLE IF EXISTS `drillhole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillhole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regionId` int NOT NULL,
  `depositId` int DEFAULT NULL,
  `mineId` int DEFAULT NULL,
  `mineAreaId` int DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `elevation` decimal(10,0) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `drillingTypeId` int DEFAULT NULL,
  `contractorId` int DEFAULT NULL,
  `drillerId` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillhole_ibfk_1` (`regionId`),
  KEY `drillhole_ibfk_2` (`depositId`),
  KEY `drillhole_ibfk_3` (`mineId`),
  KEY `drillhole_ibfk_4` (`mineAreaId`),
  KEY `drillhole_ibfk_5` (`typeId`),
  KEY `drillhole_ibfk_6` (`drillingTypeId`),
  KEY `drillhole_ibfk_7` (`contractorId`),
  KEY `drillhole_ibfk_8` (`drillerId`),
  KEY `drillhole_ibfk_9` (`userId`),
  CONSTRAINT `drillhole_ibfk_1` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_2` FOREIGN KEY (`depositId`) REFERENCES `deposit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_3` FOREIGN KEY (`mineId`) REFERENCES `mine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_4` FOREIGN KEY (`mineAreaId`) REFERENCES `minearea` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_5` FOREIGN KEY (`typeId`) REFERENCES `drillholetype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_6` FOREIGN KEY (`drillingTypeId`) REFERENCES `drillingtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_7` FOREIGN KEY (`contractorId`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_8` FOREIGN KEY (`drillerId`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillhole_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillhole`
--

LOCK TABLES `drillhole` WRITE;
/*!40000 ALTER TABLE `drillhole` DISABLE KEYS */;
INSERT INTO `drillhole` VALUES (1,2,3,4,4,'Drill Hole 1',-6.32408538,-50.04710382,125,180,'Poço foi desenvolvido muito bem',1,1,1,2,'2024-05-21','2024-05-28',1,'2024-04-26'),(2,2,3,NULL,NULL,'Drill Hole 2',-6.88612350,-50.30503214,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-02-01','2024-03-01',1,'2024-04-26'),(3,2,3,4,NULL,'Drill Hole 3',-6.97337206,-49.83856603,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-04-26'),(4,2,3,4,5,'Drill Hole 4',-7.21867089,-49.43795396,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-04-26'),(5,2,3,4,5,'Drill Hole 5',-8.11511623,-49.33368507,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-04-26'),(6,3,NULL,NULL,NULL,'Drill Hole 6',-9.11511623,-39.33368507,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-26'),(7,3,4,5,NULL,'Drill Hole 7',-10.11511623,-22.33368507,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-26'),(8,3,4,5,6,'Drill Hole 8',-11.11511623,-23.33368507,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-26'),(9,3,4,5,6,'Drill Hole 9',-12.11511623,-39.33368507,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-26'),(10,1,2,3,3,'Drill Hole 10',-18.40983083,-43.59254015,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-03-05','2024-05-30',2,'2024-04-26'),(11,1,2,3,3,'Drill Hole 11',-18.44631120,-43.43888073,NULL,NULL,NULL,NULL,NULL,NULL,2,'2024-02-06',NULL,2,'2024-04-26'),(12,1,1,NULL,NULL,'Drill Hole Mine 1',NULL,-6.07606321,-50,NULL,NULL,1,5,1,1,'2024-09-04','2024-09-30',1,'2024-09-07');
/*!40000 ALTER TABLE `drillhole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillholerun`
--

DROP TABLE IF EXISTS `drillholerun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillholerun` (
  `id` int NOT NULL AUTO_INCREMENT,
  `drillHoleId` int NOT NULL,
  `startDepth` decimal(10,0) NOT NULL,
  `endDepth` decimal(10,0) DEFAULT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `drillholerun_ibfk_1` (`drillHoleId`),
  KEY `drillholerun_ibfk_2` (`userId`),
  CONSTRAINT `drillholerun_ibfk_1` FOREIGN KEY (`drillHoleId`) REFERENCES `drillhole` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `drillholerun_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillholerun`
--

LOCK TABLES `drillholerun` WRITE;
/*!40000 ALTER TABLE `drillholerun` DISABLE KEYS */;
INSERT INTO `drillholerun` VALUES (1,1,0,20,'2024-07-11 12:00:00','2024-07-11 21:50:00',NULL,1,'2024-07-19'),(2,1,20,40,'2024-07-15 11:10:00','2024-07-15 18:45:00',NULL,1,'2024-07-19'),(3,5,0,20,'2024-07-17 10:20:00','2024-07-17 20:44:00',NULL,1,'2024-07-19'),(4,5,20,40,'2024-07-18 12:12:00','2024-07-18 21:52:00',NULL,1,'2024-07-19'),(5,5,40,60,'2024-07-19 10:15:00','2024-07-19 19:50:00',NULL,1,'2024-07-19');
/*!40000 ALTER TABLE `drillholerun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillholetype`
--

DROP TABLE IF EXISTS `drillholetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillholetype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `diameter` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillHoleType_ibfk_1` (`accountId`),
  CONSTRAINT `DrillHoleType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillholetype`
--

LOCK TABLES `drillholetype` WRITE;
/*!40000 ALTER TABLE `drillholetype` DISABLE KEYS */;
INSERT INTO `drillholetype` VALUES (1,1,'BQ',48),(2,1,'NQ',55),(3,1,'HQ',69),(4,1,'PQ',92),(5,2,'BQ',48);
/*!40000 ALTER TABLE `drillholetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drillingtype`
--

DROP TABLE IF EXISTS `drillingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drillingtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DrillingType_ibfk_1` (`accountId`),
  CONSTRAINT `DrillingType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drillingtype`
--

LOCK TABLES `drillingtype` WRITE;
/*!40000 ALTER TABLE `drillingtype` DISABLE KEYS */;
INSERT INTO `drillingtype` VALUES (1,1,'Auger Drilling',NULL),(2,1,'Rotary Air Blasting',NULL),(3,1,'Aircore',NULL),(4,1,'Reverse Circulation Drilling',NULL),(5,1,'Diamond Core Drilling',NULL),(6,1,'Blast Hole Drilling',NULL),(7,2,'Auger Drilling',NULL),(8,2,'Rotary Air Blasting',NULL);
/*!40000 ALTER TABLE `drillingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `companyId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `roleId` int DEFAULT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Employee_ibfk_1` (`companyId`),
  KEY `Employee_ibfk_2` (`roleId`),
  KEY `Employee_ibfk_3` (`userId`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `employeerole` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Employee_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Maria Fernanda',1,'png',1,'2024-04-19'),(2,1,'Roberto Carlos',2,'png',1,'2024-04-19'),(3,2,'Fernando Ambrosio',4,'png',1,'2024-04-19'),(4,2,'Employee 4',3,'png',1,'2024-04-19'),(5,3,'Employee 5',2,'png',1,'2024-04-19'),(6,4,'Employee 6',5,NULL,2,'2024-04-19');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeerole`
--

DROP TABLE IF EXISTS `employeerole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeerole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EmployeeRole_ibfk_1` (`accountId`),
  CONSTRAINT `EmployeeRole_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeerole`
--

LOCK TABLES `employeerole` WRITE;
/*!40000 ALTER TABLE `employeerole` DISABLE KEYS */;
INSERT INTO `employeerole` VALUES (1,1,'Administrator',NULL),(2,1,'Geologist',NULL),(3,1,'Chemical',NULL),(4,1,'Driver',NULL),(5,2,'Administrator',NULL),(6,2,'Geologist',NULL);
/*!40000 ALTER TABLE `employeerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fracturetype`
--

DROP TABLE IF EXISTS `fracturetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fracturetype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FractureType_ibfk_1` (`accountId`),
  CONSTRAINT `FractureType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fracturetype`
--

LOCK TABLES `fracturetype` WRITE;
/*!40000 ALTER TABLE `fracturetype` DISABLE KEYS */;
INSERT INTO `fracturetype` VALUES (1,1,'Induced'),(2,1,'Natural');
/*!40000 ALTER TABLE `fracturetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functionality`
--

DROP TABLE IF EXISTS `functionality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functionality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Functionality_ibfk_1` (`typeId`),
  CONSTRAINT `Functionality_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `functionalitytype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functionality`
--

LOCK TABLES `functionality` WRITE;
/*!40000 ALTER TABLE `functionality` DISABLE KEYS */;
INSERT INTO `functionality` VALUES (1,1,'Account Add'),(2,1,'Account Update'),(3,1,'Account List'),(4,1,'Account Delete'),(5,2,'Region Add'),(6,2,'Region Update'),(7,2,'Region Delete'),(8,2,'Region List');
/*!40000 ALTER TABLE `functionality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functionalitytype`
--

DROP TABLE IF EXISTS `functionalitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functionalitytype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functionalitytype`
--

LOCK TABLES `functionalitytype` WRITE;
/*!40000 ALTER TABLE `functionalitytype` DISABLE KEYS */;
INSERT INTO `functionalitytype` VALUES (1,'Administrative'),(2,'Operational');
/*!40000 ALTER TABLE `functionalitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lithology`
--

DROP TABLE IF EXISTS `lithology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lithology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupsubId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `acronym` varchar(10) NOT NULL,
  `colorId` int DEFAULT NULL,
  `img` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lithology_ibfk_1` (`groupsubId`),
  CONSTRAINT `lithology_ibfk_1` FOREIGN KEY (`groupsubId`) REFERENCES `lithologygroupsub` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lithology`
--

LOCK TABLES `lithology` WRITE;
/*!40000 ALTER TABLE `lithology` DISABLE KEYS */;
INSERT INTO `lithology` VALUES (1,1,'Granite','GRN',5,1),(2,1,'Diorite','DIO',2,1),(3,1,'Gabbro','GBR',3,1),(4,1,'Granodiorite','GRD',NULL,NULL),(5,1,'Syenite','SYN',NULL,NULL),(6,1,'Anorthosite','ANT',NULL,NULL),(7,1,'Peridotite','PRD',4,NULL),(8,1,'Monzonite','MON',NULL,NULL),(9,1,'Tonallite','TON',NULL,NULL),(10,1,'Quartz Diorite','QDI',NULL,NULL),(11,1,'Nepheline Syenite','NSY',NULL,NULL),(12,1,'Pegmatite','PEG',NULL,NULL),(13,1,'Foidolite','FOI',NULL,NULL),(14,1,'Dunite','DUN',NULL,NULL),(15,1,'Pyroxenite','PYX',NULL,NULL),(16,1,'Norite','NOR',NULL,NULL),(17,1,'Troctolite','TRO',NULL,NULL),(18,1,'Hornblendite','HOR',NULL,NULL),(19,1,'Charno-enderbite','CHE',NULL,NULL),(20,1,'Quartz Monzonite','QMO',NULL,NULL),(21,1,'Ferrogabbro','FGB',NULL,NULL),(22,1,'Harzburgite','HRZ',NULL,NULL),(23,1,'Lherzolite','LHZ',NULL,NULL),(24,1,'Clinopyroxenite','CLP',NULL,NULL),(25,1,'Garnet Peridotite','GPR',NULL,NULL),(26,1,'Leucogranite','LGR',NULL,NULL),(27,1,'Aplite','APL',NULL,NULL),(28,1,'Gabbronorite','GNO',NULL,NULL),(29,1,'Biotite Granite','BGR',NULL,NULL),(30,1,'Mangerite','MAN',NULL,NULL),(31,1,'Quartz Syenite','QSY',NULL,NULL),(32,1,'Ijerite','IJE',NULL,NULL),(33,1,'Essexite','ESS',NULL,NULL),(34,1,'Jacobsite','JAC',NULL,NULL),(35,1,'Sannaites','SAN',NULL,NULL),(36,1,'Melanogabbro','MGB',NULL,NULL),(37,2,'Basalt','BAS',NULL,NULL),(38,2,'Rhyolite','RHY',NULL,NULL),(39,2,'Andesite','AND',NULL,NULL),(40,2,'Dacite','DAC',NULL,NULL),(41,2,'Obsidian','OBS',NULL,NULL),(42,2,'Pumice','PUM',NULL,NULL),(43,2,'Scoria','SCO',NULL,NULL),(44,2,'Tuff','TUF',NULL,NULL),(45,2,'Ignimbrite','IGN',NULL,NULL),(46,2,'Trachyte','TRA',NULL,NULL),(47,2,'Phonolite','PHO',NULL,NULL),(48,2,'Komatiite','KOM',NULL,NULL),(49,2,'Tephrite','TEP',NULL,NULL),(50,2,'Basanite','BASA',NULL,NULL),(51,2,'Rhyodacite','RHD',NULL,NULL),(52,2,'Latite','LAT',NULL,NULL),(53,2,'Hyaloclastite','HYA',NULL,NULL),(54,2,'Perlite','PER',NULL,NULL),(55,2,'Pitchstone','PIT',NULL,NULL),(56,2,'Welded Tuff','WTU',NULL,NULL),(57,2,'Ash','ASH',NULL,NULL),(58,2,'Lapilli','LAP',NULL,NULL),(59,2,'Volcanic Breccia','VBR',NULL,NULL),(60,6,'Basalt','BAS',NULL,NULL),(61,6,'Gabbro','GBR',NULL,NULL),(62,6,'Dolerite (Diabase)','DOL',NULL,NULL),(63,6,'Norite','NOR',NULL,NULL),(64,6,'Troctolite','TRO',NULL,NULL),(65,6,'Pyroxenite','PYX',NULL,NULL),(66,6,'Anorthosite','ANT',NULL,NULL),(67,6,'Harzburgite','HRZ',NULL,NULL),(68,6,'Lherzolite','LHZ',NULL,NULL),(69,6,'Peridotite','PRD',NULL,NULL),(70,6,'Ferrogabbro','FGB',NULL,NULL),(71,6,'Melanogabbro','MGB',NULL,NULL),(72,6,'Basanite','BASA',NULL,NULL),(73,6,'Komatiite','KOM',NULL,NULL),(74,7,'Peridotite','PRD',NULL,NULL),(75,7,'Dunite','DUN',NULL,NULL),(76,7,'Harzburgite','HRZ',NULL,NULL),(77,7,'Lherzolite','LHZ',NULL,NULL),(78,7,'Kimberlite','KMB',NULL,NULL),(79,7,'Komatiite','KOM',NULL,NULL),(80,7,'Pyroxenite','PYX',NULL,NULL),(81,7,'Wehrlite','WHR',NULL,NULL),(82,7,'Clinopyroxenite','CLP',NULL,NULL),(83,7,'Garnet Peridotite','GPR',NULL,NULL),(84,7,'Hornblendite','HOR',NULL,NULL),(85,7,'Lamproite','LMP',NULL,NULL),(86,7,'Iherzolite','IHL',NULL,NULL);
/*!40000 ALTER TABLE `lithology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lithologygroup`
--

DROP TABLE IF EXISTS `lithologygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lithologygroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lithologygroup_ibfk_1` (`accountId`),
  CONSTRAINT `lithologygroup_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lithologygroup`
--

LOCK TABLES `lithologygroup` WRITE;
/*!40000 ALTER TABLE `lithologygroup` DISABLE KEYS */;
INSERT INTO `lithologygroup` VALUES (1,1,'Igneous Rocks'),(2,1,'Sedimentary Rocks'),(3,1,'Organic-Rich Rocks'),(4,1,'Metamorphic Rocks'),(5,1,'Volcaniclastic Rocks'),(6,1,'Volcanic Rocks'),(7,1,'Evaporitic Rocks'),(8,1,'Carbonate Rocks'),(9,1,'Pyroclastic Rocks'),(10,1,'Organic-Rich Rocks');
/*!40000 ALTER TABLE `lithologygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lithologygroupsub`
--

DROP TABLE IF EXISTS `lithologygroupsub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lithologygroupsub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lithologygroupsub_ibfk_1` (`groupId`),
  CONSTRAINT `lithologygroupsub_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `lithologygroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lithologygroupsub`
--

LOCK TABLES `lithologygroupsub` WRITE;
/*!40000 ALTER TABLE `lithologygroupsub` DISABLE KEYS */;
INSERT INTO `lithologygroupsub` VALUES (1,1,'Intrusive (Plutonic)'),(2,1,'Extrusive (Volcanic)'),(3,1,'Hypabyssal'),(4,1,'Alkaline'),(5,1,'Felsic'),(6,1,'Mafic'),(7,1,'Ultramafic'),(8,1,'Pyroclastic'),(9,1,'Peralkaline'),(10,1,'Peraluminous'),(11,1,'Subvolcanic'),(12,1,'Intermediate'),(13,1,'Acidic'),(14,1,'Basic'),(15,1,'Ultramafic'),(16,2,'Chemical'),(17,2,'Biogenic'),(18,2,'Organic'),(19,2,'Evaporitic'),(20,2,'Carbonate'),(21,2,'Volcaniclastic'),(22,2,'Ferruginous'),(23,2,'Phosphatic'),(24,2,'Siliceous'),(25,2,'Argillaceous'),(26,2,'Pyroclastic'),(27,2,'Glacial'),(28,2,'Lacustrine'),(29,2,'Fluvial'),(30,2,'Eolian'),(31,2,'Deltaic'),(32,2,'Tidal'),(33,2,'Marine'),(34,2,'Alluvial'),(35,3,'Carbonaceous'),(36,3,'Peat-forming'),(37,3,'Coal'),(38,3,'Oil Shale'),(39,3,'Bituminous'),(40,3,'Lignite'),(41,3,'Anthracite'),(42,4,'Foliated'),(43,4,'Non-foliated'),(44,4,'Greenschist Facies'),(45,4,'Amphibolite Facies'),(46,4,'Granulite Facies'),(47,4,'Blueschist Facies'),(48,4,'Eclogitic'),(49,4,'Contact Metamorphic'),(50,4,'Regional Metamorphic'),(51,4,'Cataclastic'),(52,4,'Dynamic Metamorphism'),(53,4,'Migmatitic'),(54,4,'Retrograde Metamorphism'),(55,4,'Zeolite Facies'),(56,4,'Hornfels Facies'),(57,5,'Tuffaceous'),(58,5,'Pyroclastic'),(59,5,'Ignimbrite'),(60,5,'Tephra'),(61,5,'Volcanic Breccia'),(62,5,'Lapilli'),(63,5,'Lithic Tuff'),(64,5,'Welded Tuff'),(65,5,'Agglomerate'),(66,5,'Volcanic Sandstone'),(67,6,'Felsic'),(68,6,'Mafic'),(69,6,'Intermediate'),(70,6,'Ultramafic'),(71,6,'Alkaline'),(72,6,'Subvolcanic'),(73,6,'Pyroclastic'),(74,6,'Peralkaline'),(75,6,'Trachyte'),(76,6,'Basanitic'),(77,6,'Rhyolitic'),(78,6,'Andesitic'),(79,6,'Basaltic'),(80,7,'Saline'),(81,7,'Gypsiferous'),(82,7,'Halitic'),(83,7,'Carbonatitic'),(84,7,'Potassic'),(85,7,'Sulfatic'),(86,7,'Borate-rich'),(87,7,'Siliceous Evaporites'),(88,8,'Reefal'),(89,8,'Micritic'),(90,8,'Sparry'),(91,8,'Oolitic'),(92,8,'Dolomitic'),(93,8,'Travertine'),(94,8,'Recrystallized'),(95,8,'Peloidal'),(96,8,'Chalk'),(97,8,'Stromatolitic'),(98,8,'Intraclast'),(99,8,'Fossiliferous'),(100,9,'Tuff'),(101,9,'Ignimbrite'),(102,9,'Ash'),(103,9,'Lapilli'),(104,9,'Volcanic Breccia'),(105,9,'Pumice'),(106,9,'Scoria'),(107,9,'Pyroclastic Flow'),(108,9,'Volcanic Bomb'),(109,9,'Welded Tuff'),(110,9,'Agglomerate'),(111,10,'Peat-forming'),(112,10,'Lignite'),(113,10,'Bituminous'),(114,10,'Anthracite'),(115,10,'Oil Shale'),(116,10,'Sapropelic'),(117,10,'Humic'),(118,10,'Carbonaceous'),(119,2,'Clastic');
/*!40000 ALTER TABLE `lithologygroupsub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lithologymethod`
--

DROP TABLE IF EXISTS `lithologymethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lithologymethod` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lithologymethod_ibfk_1` (`accountId`),
  CONSTRAINT `lithologymethod_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lithologymethod`
--

LOCK TABLES `lithologymethod` WRITE;
/*!40000 ALTER TABLE `lithologymethod` DISABLE KEYS */;
INSERT INTO `lithologymethod` VALUES (1,1,'Geologist Visual Inspection'),(2,1,'Machine Learning by Chemical Analysis'),(3,2,'Lithology Method 3'),(4,1,'Mineralogy'),(5,1,'Petrographic Analysis'),(6,1,'Geologist Description');
/*!40000 ALTER TABLE `lithologymethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metalgroup`
--

DROP TABLE IF EXISTS `metalgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metalgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oreGeneticTypeId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MetalGroup_ibfk_1_idx` (`oreGeneticTypeId`),
  CONSTRAINT `MetalGroup_ibfk_1` FOREIGN KEY (`oreGeneticTypeId`) REFERENCES `oregenetictype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metalgroup`
--

LOCK TABLES `metalgroup` WRITE;
/*!40000 ALTER TABLE `metalgroup` DISABLE KEYS */;
INSERT INTO `metalgroup` VALUES (1,1,'Platinum Group Metals (PGM)	'),(2,1,'Iron-Titanium-Vanadium (Fe-Ti-V)	'),(3,1,'Nickel-Copper-Platinum Group (PGE)'),(4,4,'Lithium Group	'),(5,5,'Metal Group 5');
/*!40000 ALTER TABLE `metalgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metalgroupsub`
--

DROP TABLE IF EXISTS `metalgroupsub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metalgroupsub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metalgroupId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `metalgroupSub_ibfk_1` (`metalgroupId`),
  CONSTRAINT `metalgroupSub_ibfk_1` FOREIGN KEY (`metalgroupId`) REFERENCES `metalgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metalgroupsub`
--

LOCK TABLES `metalgroupsub` WRITE;
/*!40000 ALTER TABLE `metalgroupsub` DISABLE KEYS */;
INSERT INTO `metalgroupsub` VALUES (1,1,'Pt, Pd, Rh'),(2,3,'Ni, Cu, Pt'),(3,2,'Fe, Ti, V'),(4,5,'Metal Group Sub 4');
/*!40000 ALTER TABLE `metalgroupsub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mine`
--

DROP TABLE IF EXISTS `mine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `depositId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `startYear` int DEFAULT NULL,
  `endYear` int DEFAULT NULL,
  `resource` int DEFAULT NULL,
  `reserve` int DEFAULT NULL,
  `oreMined` int DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `sizeId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `statusPreviousId` int DEFAULT NULL,
  `imgTypeProfile` varchar(4) DEFAULT NULL,
  `imgTypeCover` varchar(4) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mine_ibfk_1` (`depositId`),
  KEY `mine_ibfk_2` (`sizeId`),
  KEY `mine_ibfk_3` (`statusId`),
  KEY `mine_ibfk_4` (`statusPreviousId`),
  KEY `mine_ibfk_5` (`userId`),
  CONSTRAINT `mine_ibfk_1` FOREIGN KEY (`depositId`) REFERENCES `deposit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_ibfk_2` FOREIGN KEY (`sizeId`) REFERENCES `minesize` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `minestatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_ibfk_4` FOREIGN KEY (`statusPreviousId`) REFERENCES `minestatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mine`
--

LOCK TABLES `mine` WRITE;
/*!40000 ALTER TABLE `mine` DISABLE KEYS */;
INSERT INTO `mine` VALUES (1,1,'Itabira Mine',-18.99257991,-42.99432301,2020,2022,NULL,NULL,NULL,NULL,1,1,NULL,'jpg','jpg',1,'2024-04-08'),(2,2,'Tapira Mine',-18.77948520,-43.88624997,2010,NULL,NULL,NULL,NULL,NULL,1,2,NULL,'jpg','jpg',1,'2024-04-08'),(3,2,'Alvorada Mine',-18.54529026,-43.67730742,2021,2024,NULL,NULL,NULL,NULL,2,1,8,'jpg','jpg',2,'2024-04-08'),(4,3,'Canaã Mine',-6.83158499,-49.74527281,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jpg','jpg',2,'2024-04-08'),(5,4,'Mine 5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-08'),(6,4,'Mine 6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-08');
/*!40000 ALTER TABLE `mine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minearea`
--

DROP TABLE IF EXISTS `minearea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minearea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mineId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `startYear` int DEFAULT NULL,
  `endYear` int DEFAULT NULL,
  `resource` int DEFAULT NULL,
  `reserve` int DEFAULT NULL,
  `oreMined` int DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `shapeId` int DEFAULT NULL,
  `imgTypeProfile` varchar(4) DEFAULT NULL,
  `imgTypeCover` varchar(4) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mineArea_ibfk_1` (`mineId`),
  KEY `mineArea_ibfk_2` (`typeId`),
  KEY `mineArea_ibfk_3` (`statusId`),
  KEY `mineArea_ibfk_4` (`shapeId`),
  KEY `mineArea_ibfk_5` (`userId`),
  CONSTRAINT `mineArea_ibfk_1` FOREIGN KEY (`mineId`) REFERENCES `mine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mineArea_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `mineareatype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mineArea_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `mineareastatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mineArea_ibfk_4` FOREIGN KEY (`shapeId`) REFERENCES `mineareashape` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mineArea_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minearea`
--

LOCK TABLES `minearea` WRITE;
/*!40000 ALTER TABLE `minearea` DISABLE KEYS */;
INSERT INTO `minearea` VALUES (1,1,'Mine Area 1',-19.09642985,-43.10958515,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'jpg','jpg',1,'2024-04-08'),(2,2,'Mine Area 2',-18.80028685,-44.03705491,NULL,NULL,NULL,NULL,NULL,NULL,1,2,2,'jpg','jpg',1,'2024-04-08'),(3,3,'Mine Area 3',-18.48799356,-43.54863746,NULL,NULL,NULL,NULL,NULL,NULL,2,2,2,'jpg','jpg',2,'2024-04-08'),(4,4,'Mine Area 4',-6.66247629,-49.48185665,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jpg','jpg',2,'2024-04-08'),(5,4,'Mine Area 5',-7.10421438,-49.44892963,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jpg','jpg',1,'2024-04-08'),(6,5,'Mine Area 6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-08'),(7,6,'Mine Area 7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-08'),(8,6,'Mine Area 8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-04-08');
/*!40000 ALTER TABLE `minearea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mineareashape`
--

DROP TABLE IF EXISTS `mineareashape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mineareashape` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mineareashape_ibfk_1` (`accountId`),
  CONSTRAINT `mineareashape_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mineareashape`
--

LOCK TABLES `mineareashape` WRITE;
/*!40000 ALTER TABLE `mineareashape` DISABLE KEYS */;
INSERT INTO `mineareashape` VALUES (1,1,'Vein ',NULL),(2,1,'Lens ',NULL),(3,2,'Mine Area Shape 3',NULL),(4,1,'Irregular ',NULL),(5,1,'Tabular ',NULL),(6,1,'Room and Pillar',NULL),(7,1,'Longwall ',NULL);
/*!40000 ALTER TABLE `mineareashape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mineareastatus`
--

DROP TABLE IF EXISTS `mineareastatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mineareastatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mineareastatus_ibfk_1` (`accountId`),
  CONSTRAINT `mineareastatus_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mineareastatus`
--

LOCK TABLES `mineareastatus` WRITE;
/*!40000 ALTER TABLE `mineareastatus` DISABLE KEYS */;
INSERT INTO `mineareastatus` VALUES (1,1,'Active',NULL),(2,1,'Inactive',NULL),(3,2,'Mine Area Status 3',NULL),(4,1,'Closed',NULL),(5,1,'Abandoned',NULL),(6,1,'Rehabilitated',NULL),(7,1,'Under Development',NULL),(8,1,'Exploration',NULL),(9,1,'Decommissioned',NULL),(10,1,'Feasibility Study',NULL);
/*!40000 ALTER TABLE `mineareastatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mineareatype`
--

DROP TABLE IF EXISTS `mineareatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mineareatype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mineareatype_ibfk_1` (`accountId`),
  CONSTRAINT `mineareatype_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mineareatype`
--

LOCK TABLES `mineareatype` WRITE;
/*!40000 ALTER TABLE `mineareatype` DISABLE KEYS */;
INSERT INTO `mineareatype` VALUES (1,1,'Open-pit Mine','png'),(2,1,'Underground Mine',NULL),(3,2,'Mine Area Type 3',NULL),(4,1,'Surface mining','jpg'),(5,1,'Placer Mining',NULL),(6,1,'Dredging',NULL),(7,1,'Quarry',NULL);
/*!40000 ALTER TABLE `mineareatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minesize`
--

DROP TABLE IF EXISTS `minesize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minesize` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `minesize_ibfk_1` (`accountId`),
  CONSTRAINT `minesize_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minesize`
--

LOCK TABLES `minesize` WRITE;
/*!40000 ALTER TABLE `minesize` DISABLE KEYS */;
INSERT INTO `minesize` VALUES (1,1,'Large',NULL),(2,1,'Small',NULL),(3,2,'Mine Size 3',NULL),(4,1,'Medium',NULL);
/*!40000 ALTER TABLE `minesize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minestatus`
--

DROP TABLE IF EXISTS `minestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minestatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `minestatus_ibfk_1` (`accountId`),
  CONSTRAINT `minestatus_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minestatus`
--

LOCK TABLES `minestatus` WRITE;
/*!40000 ALTER TABLE `minestatus` DISABLE KEYS */;
INSERT INTO `minestatus` VALUES (1,1,'Active','png'),(2,1,'Inactive','png'),(3,2,'Mine Status 3',NULL),(4,1,'Closed','png'),(5,1,'Exploration	',NULL),(6,1,'Development','png'),(7,1,'Maintenance',NULL),(8,1,'Suspended','png'),(9,1,'Recovery',NULL),(10,1,'Decommissioned',NULL);
/*!40000 ALTER TABLE `minestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oregenetictype`
--

DROP TABLE IF EXISTS `oregenetictype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oregenetictype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `depositTypeId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `OreGeneticType_ibfk_1` (`depositTypeId`),
  CONSTRAINT `OreGeneticType_ibfk_1` FOREIGN KEY (`depositTypeId`) REFERENCES `deposittype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oregenetictype`
--

LOCK TABLES `oregenetictype` WRITE;
/*!40000 ALTER TABLE `oregenetictype` DISABLE KEYS */;
INSERT INTO `oregenetictype` VALUES (1,1,'Layered Intrusions'),(2,1,'Cumulate Deposits	'),(3,1,'Anorthosite-related	'),(4,1,'Pegmatitic Deposits	'),(5,4,'Ore Genetic Type 5'),(6,3,'Banded Iron Formations (BIF)	'),(7,3,'Sedimentary Copper'),(8,3,'Manganese Nodules	'),(9,3,'Phosphorite Deposits'),(10,2,'Porphyry Deposits'),(11,2,'Vein-type'),(12,2,'Epithermal ');
/*!40000 ALTER TABLE `oregenetictype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oregenetictypesub`
--

DROP TABLE IF EXISTS `oregenetictypesub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oregenetictypesub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oreGeneticTypeId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `OreGeneticTypeSub_ibfk_1` (`oreGeneticTypeId`),
  CONSTRAINT `OreGeneticTypeSub_ibfk_1` FOREIGN KEY (`oreGeneticTypeId`) REFERENCES `oregenetictype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oregenetictypesub`
--

LOCK TABLES `oregenetictypesub` WRITE;
/*!40000 ALTER TABLE `oregenetictypesub` DISABLE KEYS */;
INSERT INTO `oregenetictypesub` VALUES (1,1,'Chromite, Magnetite'),(2,1,'Platinum-group elements (PGE)'),(3,10,'Copper, Molybdenum, Gold'),(4,12,'Gold, Silver, Lead, Zinc'),(5,6,'Hematite, Magnetite'),(6,5,'Ore Genetic Type Sub 6');
/*!40000 ALTER TABLE `oregenetictypesub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_ibfk_1` (`accountId`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,1,'Master User',NULL),(2,1,'Administrator',NULL),(3,1,'Standard User',NULL),(4,2,'Administrator',NULL),(5,1,'Read-Only User',NULL),(6,1,'Guest',NULL),(7,1,'Superuser',NULL),(8,3,'Administrator',NULL),(9,4,'Administrator',NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilerole`
--

DROP TABLE IF EXISTS `profilerole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profilerole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `roleId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profileRole_ibfk_1` (`profileId`),
  KEY `profileRole_ibfk_2` (`roleId`),
  CONSTRAINT `profileRole_ibfk_1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`),
  CONSTRAINT `profileRole_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilerole`
--

LOCK TABLES `profilerole` WRITE;
/*!40000 ALTER TABLE `profilerole` DISABLE KEYS */;
INSERT INTO `profilerole` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,4,4);
/*!40000 ALTER TABLE `profilerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `summary` varchar(40) DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  `statusId` int DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_ibfk_1` (`accountId`),
  KEY `project_ibfk_4` (`userId`),
  KEY `project_ibfk_2` (`typeId`),
  KEY `project_ibfk_3` (`statusId`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `projecttype` (`id`),
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`statusId`) REFERENCES `projectstatus` (`id`),
  CONSTRAINT `project_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'Project 1','2024-01-01','2024-01-31','test summary','test comments',1,1,1,'2024-01-01'),(2,1,'Project 2',NULL,NULL,NULL,NULL,2,1,1,'2024-01-10'),(3,1,'Project 3',NULL,NULL,NULL,NULL,3,4,2,'2024-01-12'),(4,2,'Project 4',NULL,NULL,NULL,NULL,NULL,NULL,3,'2024-01-21');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectstatus`
--

DROP TABLE IF EXISTS `projectstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectStatus_ibfk_1_idx` (`accountId`),
  CONSTRAINT `ProjectStatus_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectstatus`
--

LOCK TABLES `projectstatus` WRITE;
/*!40000 ALTER TABLE `projectstatus` DISABLE KEYS */;
INSERT INTO `projectstatus` VALUES (1,1,'Created',NULL),(2,1,'Started',NULL),(3,1,'Paused',NULL),(4,1,'Finished',NULL);
/*!40000 ALTER TABLE `projectstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projecttype`
--

DROP TABLE IF EXISTS `projecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projecttype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectType_ibfk_1` (`accountId`),
  CONSTRAINT `ProjectType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projecttype`
--

LOCK TABLES `projecttype` WRITE;
/*!40000 ALTER TABLE `projecttype` DISABLE KEYS */;
INSERT INTO `projecttype` VALUES (1,1,'Analysis',NULL),(2,1,'Extraction',NULL),(3,1,'Laboratory',NULL),(4,2,'Standard',NULL);
/*!40000 ALTER TABLE `projecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rect`
--

DROP TABLE IF EXISTS `rect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `left` int NOT NULL,
  `top` int NOT NULL,
  `right` int NOT NULL,
  `bottom` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rect`
--

LOCK TABLES `rect` WRITE;
/*!40000 ALTER TABLE `rect` DISABLE KEYS */;
INSERT INTO `rect` VALUES (1,140,814,5041,2434),(2,167,130,4703,341),(3,141,506,4596,720),(4,10,10,4445,204),(5,104,26,2529,162),(6,104,26,2529,162),(7,2603,30,4484,156),(8,103,811,4964,2408),(9,144,141,4532,327),(10,1071,13,1876,160),(11,3378,13,3650,163),(12,160,883,4523,1087),(13,199,1238,4580,1474),(14,10,10,4371,226),(15,154,493,4747,720),(16,232,879,4693,1090),(17,10,10,4451,201);
/*!40000 ALTER TABLE `rect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `countryId` int NOT NULL,
  `state` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `imgTypeProfile` varchar(4) DEFAULT NULL,
  `imgTypeCover` varchar(4) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_ibfk_1` (`accountId`),
  KEY `region_ibfk_2` (`countryId`),
  KEY `region_ibfk_3` (`userId`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `region_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `region_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,1,'Alvorada de Minas',32,'Minas Gerais','Alvorada de Minas',-18.73373700,-43.36455400,'Volcanic region','jpg','jpg',1,'2024-04-08'),(2,1,'Canaã dos Carajás',32,'Pará','Canaã dos Carajás',-6.52062100,-49.91759900,'Região com muito minério','jpg','jpeg',1,'2024-04-08'),(3,2,'Region 3',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2024-04-08');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `imgType` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Role_ibfk_1` (`accountId`),
  CONSTRAINT `Role_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,1,'Mine Manager ','png'),(2,1,'Geologist','png'),(3,1,'Mining Engineer ','png'),(4,2,'Role 4',NULL),(5,2,'Role 5',NULL),(6,1,'Geotechnical Engineer','png'),(7,1,'Data Analyst ','jpg');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeId` int NOT NULL,
  `code` varchar(40) NOT NULL,
  `sampledBy` varchar(40) DEFAULT NULL,
  `sampledDate` date DEFAULT NULL,
  `qualityCheck` tinyint(1) DEFAULT NULL,
  `uuid` varchar(40) DEFAULT NULL,
  `comments` varchar(40) DEFAULT NULL,
  `regionId` int DEFAULT NULL,
  `depositId` int DEFAULT NULL,
  `mineId` int DEFAULT NULL,
  `mineAreaId` int DEFAULT NULL,
  `drillHoleId` int DEFAULT NULL,
  `startDepth` decimal(10,0) DEFAULT NULL,
  `endDepth` decimal(10,0) DEFAULT NULL,
  `userId` int NOT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sample_ibfk_1` (`typeId`),
  KEY `sample_ibfk_2` (`regionId`),
  KEY `sample_ibfk_3` (`depositId`),
  KEY `sample_ibfk_4` (`mineId`),
  KEY `sample_ibfk_5` (`mineAreaId`),
  KEY `sample_ibfk_6` (`drillHoleId`),
  KEY `sample_ibfk_7` (`userId`),
  CONSTRAINT `sample_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `sampletype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sample_ibfk_2` FOREIGN KEY (`regionId`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sample_ibfk_3` FOREIGN KEY (`depositId`) REFERENCES `deposit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sample_ibfk_4` FOREIGN KEY (`mineId`) REFERENCES `mine` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sample_ibfk_5` FOREIGN KEY (`mineAreaId`) REFERENCES `minearea` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sample_ibfk_6` FOREIGN KEY (`drillHoleId`) REFERENCES `drillhole` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sample_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` VALUES (1,1,'718827','Nelson','2024-09-03',0,NULL,NULL,1,1,1,1,1,10,11,1,'2024-09-07');
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sampletype`
--

DROP TABLE IF EXISTS `sampletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sampletype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accountId` int NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SimpleType_ibfk_1` (`accountId`),
  CONSTRAINT `SimpleType_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sampletype`
--

LOCK TABLES `sampletype` WRITE;
/*!40000 ALTER TABLE `sampletype` DISABLE KEYS */;
INSERT INTO `sampletype` VALUES (1,1,'Powder'),(2,1,'Rocks'),(3,1,'Chips'),(4,1,'Drill Core '),(5,1,'Soil '),(6,1,'Sediment '),(7,1,'Thin Sections'),(8,1,'Liquid '),(9,1,'Press Pellet'),(10,1,'Fusion Bead'),(11,1,'Digested');
/*!40000 ALTER TABLE `sampletype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeId` int NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Unit_ibfk_1` (`typeId`),
  CONSTRAINT `Unit_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `unittype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,1,'km'),(2,1,'m'),(3,1,'cm'),(4,1,'mm'),(5,2,'kg'),(6,2,'g'),(7,2,'mg'),(8,3,'h'),(9,3,'min'),(10,3,'sec');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittype`
--

DROP TABLE IF EXISTS `unittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittype`
--

LOCK TABLES `unittype` WRITE;
/*!40000 ALTER TABLE `unittype` DISABLE KEYS */;
INSERT INTO `unittype` VALUES (1,'Length'),(2,'Massiness'),(3,'Time'),(4,'Temperature'),(5,'Electric Current'),(6,'Light Intensity');
/*!40000 ALTER TABLE `unittype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profileId` int NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(256) NOT NULL,
  `countryId` int NOT NULL,
  `state` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `access` date NOT NULL,
  `attempts` int NOT NULL,
  `blocked` tinyint(1) NOT NULL,
  `imgTypeProfile` varchar(4) DEFAULT NULL,
  `imgTypeCover` varchar(4) DEFAULT NULL,
  `register` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_ibfk_1_idx` (`profileId`),
  KEY `user_ibfk_2_idx` (`countryId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Luiz','DAmore','+55 11 98889-4623','luiz@luiz','b76457d5262d5cf4104c676db97f42112a2f6190cc23009b325d41295624aafb',32,'SP','S.Bernado do Campo','2024-02-22',0,0,'jpg','jpg','2024-02-22'),(2,2,'João','Fiori','+55 11 42223333','joao@joao','b0c68e92d8a399b8673c616427418986b7ba59e7e27cc10083996edd2d61684e',32,'SP','São Paulo','2024-02-27',0,0,'png','png','2024-02-27'),(3,4,'João Pedro','DAmore','+55 11 98888-7777','jpd@jpd','54650497a81ddd99292313750bd5947f9a9eb2dd062594a0e2465d3ca3350aa9',32,'SP','S.Bernado do Campo','2024-02-27',0,0,NULL,NULL,'2024-02-27'),(4,1,'Maria','Ferreira','11 34234324','maria.ferreira@uol.com','fd7f0b6437a98b403bd2f3ec6c8a3631dd96073ac6122597c060195a70186a72',16,'SP','Bangladesh','2024-09-03',0,0,'png','png','2024-09-03'),(5,2,'Pedro','Carreira','11 34234356','pedro.carreira@uol.com','fd7f0b6437a98b403bd2f3ec6c8a3631dd96073ac6122597c060195a70186a72',17,'SP','Sao Paulo','2024-09-03',0,0,'png','png','2024-09-03'),(6,8,'João ','Fiori','11968154130','joao.f@gmail.com','fd7f0b6437a98b403bd2f3ec6c8a3631dd96073ac6122597c060195a70186a72',32,'Sao Paulo','Sao Paulo','2024-09-09',0,0,NULL,NULL,'2024-09-09'),(7,9,'João ','Fiori','+ 55 11 97589-6633','joaof@geocloudai.com','fd7f0b6437a98b403bd2f3ec6c8a3631dd96073ac6122597c060195a70186a72',32,'São Paulo','São Paulo','2024-09-09',0,0,NULL,NULL,'2024-09-09');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-12 14:34:00
