-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: lims
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
-- Table structure for table `equipment_maintenance`
--

DROP TABLE IF EXISTS `equipment_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_maintenance` (
  `equipment_maintenance_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique equipment maintenance table identifier',
  `assets_id` int unsigned NOT NULL COMMENT 'Foreign key to Assets table',
  `maintenance_frequency_id` int unsigned NOT NULL COMMENT 'Foreign key of the maintenance table. Can be (pending, completed, overdue, etc.)',
  `maintenance_status_id` int unsigned NOT NULL COMMENT 'Foreign key to the maintenance status table. Can be (pending, completed, overdue, etc.)',
  `callDate` date DEFAULT NULL COMMENT 'Maintenance call date',
  `executionDate` date DEFAULT NULL COMMENT 'Call Execution/Completion Date.This date, added to the periodicy will generates the new scheduled maintenance date (calculated field)',
  `maintenanceReason` varchar(100) DEFAULT NULL COMMENT 'Reason for maintenance to be performed on the equipment',
  PRIMARY KEY (`equipment_maintenance_id`,`assets_id`,`maintenance_frequency_id`,`maintenance_status_id`),
  KEY `fk_equipment_maintenance_assets_idx` (`assets_id`),
  KEY `fk_equipment_maintenance_maintenance_frequency_idx` (`maintenance_frequency_id`),
  KEY `fk_equipment_maintenance_maintenance_status_idx` (`maintenance_status_id`),
  CONSTRAINT `fk_equipment_maintenance_assets` FOREIGN KEY (`assets_id`) REFERENCES `assets` (`assets_id`),
  CONSTRAINT `fk_equipment_maintenance_maintenance_frequency` FOREIGN KEY (`maintenance_frequency_id`) REFERENCES `maintenance_frequency` (`maintenance_frequency_id`),
  CONSTRAINT `fk_equipment_maintenance_maintenance_status` FOREIGN KEY (`maintenance_status_id`) REFERENCES `maintenance_status` (`maintenance_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Table containing corrective and preventive maintenance of equipments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_maintenance`
--

LOCK TABLES `equipment_maintenance` WRITE;
/*!40000 ALTER TABLE `equipment_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_maintenance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-27 10:51:47
