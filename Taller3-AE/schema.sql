CREATE DATABASE  IF NOT EXISTS `taller3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `taller3`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: taller3
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `capacidad`
--

DROP TABLE IF EXISTS `capacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capacidad` (
  `idCapacidad` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `idTipo_Capacidad` int DEFAULT NULL,
  PRIMARY KEY (`idCapacidad`),
  KEY `idTipo_Capacidad_idx` (`idTipo_Capacidad`),
  CONSTRAINT `idTipo_Capacidad` FOREIGN KEY (`idTipo_Capacidad`) REFERENCES `tipo_capacidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `componente_de_informacion`
--

DROP TABLE IF EXISTS `componente_de_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_de_informacion` (
  `idComponente_Informacion` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `idTipo_Informacion` int NOT NULL,
  `idNodo` int NOT NULL,
  `idHardware` int DEFAULT NULL,
  PRIMARY KEY (`idComponente_Informacion`),
  KEY `tipoInformacion_idx` (`idTipo_Informacion`),
  KEY `nodo_idx` (`idNodo`),
  KEY `hardware_idx` (`idHardware`),
  CONSTRAINT `HardwareInfra` FOREIGN KEY (`idHardware`) REFERENCES `hardware` (`idHardware`),
  CONSTRAINT `NodoInfra` FOREIGN KEY (`idNodo`) REFERENCES `nodo` (`idNodo`),
  CONSTRAINT `tipoInformacion` FOREIGN KEY (`idTipo_Informacion`) REFERENCES `tipo_informacion` (`idTipo_Informacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `componente_de_software`
--

DROP TABLE IF EXISTS `componente_de_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_de_software` (
  `idComponente_Software` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `idTipo_Software` int NOT NULL,
  `idHardware` int DEFAULT NULL,
  `idNodo` int NOT NULL,
  PRIMARY KEY (`idComponente_Software`),
  KEY `Hardware_idx` (`idHardware`),
  KEY `Nodo_idx` (`idNodo`),
  KEY `idTipo_Software_idx` (`idTipo_Software`),
  CONSTRAINT `hardware` FOREIGN KEY (`idHardware`) REFERENCES `hardware` (`idHardware`),
  CONSTRAINT `idNodo` FOREIGN KEY (`idNodo`) REFERENCES `nodo` (`idNodo`),
  CONSTRAINT `idTipo_Software` FOREIGN KEY (`idTipo_Software`) REFERENCES `tipo_software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `componente_informacion_concepto`
--

DROP TABLE IF EXISTS `componente_informacion_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_informacion_concepto` (
  `idComponente_Informacion` int NOT NULL,
  `idConcepto` int NOT NULL,
  PRIMARY KEY (`idComponente_Informacion`,`idConcepto`),
  KEY `concepto_idx` (`idConcepto`),
  CONSTRAINT `compInformacion` FOREIGN KEY (`idComponente_Informacion`) REFERENCES `componente_de_informacion` (`idComponente_Informacion`),
  CONSTRAINT `concepto` FOREIGN KEY (`idConcepto`) REFERENCES `concepto` (`idConcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `componente_software_concepto`
--

DROP TABLE IF EXISTS `componente_software_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_software_concepto` (
  `idComponente_Software` int NOT NULL,
  `id_Concepto` int NOT NULL,
  PRIMARY KEY (`idComponente_Software`,`id_Concepto`),
  KEY `idSoftware_idx` (`idComponente_Software`),
  KEY `idConcepto_idx` (`id_Concepto`),
  CONSTRAINT `idConcepto` FOREIGN KEY (`id_Concepto`) REFERENCES `concepto` (`idConcepto`),
  CONSTRAINT `idSoftware` FOREIGN KEY (`idComponente_Software`) REFERENCES `componente_de_software` (`idComponente_Software`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `componente_software_informacion`
--

DROP TABLE IF EXISTS `componente_software_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_software_informacion` (
  `idComponente_Software` int NOT NULL,
  `idComponente_Informacion` int NOT NULL,
  KEY `compInfo_idx` (`idComponente_Informacion`),
  KEY `compSoft_idx` (`idComponente_Software`),
  CONSTRAINT `compInfo` FOREIGN KEY (`idComponente_Informacion`) REFERENCES `componente_de_informacion` (`idComponente_Informacion`),
  CONSTRAINT `compSoft` FOREIGN KEY (`idComponente_Software`) REFERENCES `componente_de_software` (`idComponente_Software`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concepto`
--

DROP TABLE IF EXISTS `concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concepto` (
  `idConcepto` int NOT NULL,
  `nombreConcepto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idConcepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conector`
--

DROP TABLE IF EXISTS `conector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conector` (
  `idConector` int NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `idServicio_Software` int NOT NULL,
  KEY `servicio_idx` (`idServicio_Software`),
  CONSTRAINT `servicio` FOREIGN KEY (`idServicio_Software`) REFERENCES `servicio_de_software` (`idServicio_de_Software`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hardware`
--

DROP TABLE IF EXISTS `hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hardware` (
  `idHardware` int NOT NULL,
  `nombreHardware` varchar(250) DEFAULT NULL,
  `almacenamientoInterno` varchar(45) DEFAULT NULL,
  `idNodo` int DEFAULT NULL,
  PRIMARY KEY (`idHardware`),
  KEY `nodo_idx` (`idNodo`),
  CONSTRAINT `nodo` FOREIGN KEY (`idNodo`) REFERENCES `nodo` (`idNodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `herramienta`
--

DROP TABLE IF EXISTS `herramienta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `herramienta` (
  `idHerramienta` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `fabricante` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nodo`
--

DROP TABLE IF EXISTS `nodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nodo` (
  `idNodo` int NOT NULL,
  `nombreNodo` varchar(250) DEFAULT NULL,
  `idTipo_Localizacion` int NOT NULL,
  `idTipoCanal_Conexion` int NOT NULL,
  `idTipo_Servidor` int DEFAULT NULL,
  PRIMARY KEY (`idNodo`),
  KEY `localizacion_idx` (`idTipo_Localizacion`),
  KEY `canal_idx` (`idTipoCanal_Conexion`),
  KEY `servidor_idx` (`idTipo_Servidor`),
  CONSTRAINT `canal` FOREIGN KEY (`idTipoCanal_Conexion`) REFERENCES `tipo_canal_conexion` (`id`),
  CONSTRAINT `localizacion` FOREIGN KEY (`idTipo_Localizacion`) REFERENCES `tipo_localizacion` (`id`),
  CONSTRAINT `servidor` FOREIGN KEY (`idTipo_Servidor`) REFERENCES `tipo_servidor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizacion`
--

DROP TABLE IF EXISTS `organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizacion` (
  `idOrganizacion` int NOT NULL,
  `nombre_Organizacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idOrganizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requerimiento_funcional`
--

DROP TABLE IF EXISTS `requerimiento_funcional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimiento_funcional` (
  `idRequerimiento_Funcional` int NOT NULL,
  `funcionalidad` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idRequerimiento_Funcional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requerimiento_nofuncional`
--

DROP TABLE IF EXISTS `requerimiento_nofuncional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimiento_nofuncional` (
  `idRequerimiento_NoFuncional` int NOT NULL,
  `requerimiento_NoFuncionalcol` varchar(300) DEFAULT NULL,
  `justificacion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idRequerimiento_NoFuncional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicio_de_informacion`
--

DROP TABLE IF EXISTS `servicio_de_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_de_informacion` (
  `idServicio_de_informacion` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `idComponente_Informacion` int NOT NULL,
  `tipo_Informacion` int NOT NULL,
  PRIMARY KEY (`idServicio_de_informacion`),
  KEY `componenteInfo_idx` (`idComponente_Informacion`),
  CONSTRAINT `componenteInfo` FOREIGN KEY (`idComponente_Informacion`) REFERENCES `componente_de_informacion` (`idComponente_Informacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicio_de_software`
--

DROP TABLE IF EXISTS `servicio_de_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_de_software` (
  `idServicio_de_Software` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `idComponente_Software` int DEFAULT NULL,
  `idSistema_Externo` int DEFAULT NULL,
  PRIMARY KEY (`idServicio_de_Software`),
  KEY `ComponenteSoftware_idx` (`idComponente_Software`),
  KEY `SistemaExterno_idx` (`idSistema_Externo`),
  CONSTRAINT `ComponenteSoftware` FOREIGN KEY (`idComponente_Software`) REFERENCES `componente_de_software` (`idComponente_Software`),
  CONSTRAINT `SistemaExterno` FOREIGN KEY (`idSistema_Externo`) REFERENCES `sistema_externo` (`idSistema_Externo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sistema_externo`
--

DROP TABLE IF EXISTS `sistema_externo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema_externo` (
  `idSistema_Externo` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `idOrganizacion` int NOT NULL,
  PRIMARY KEY (`idSistema_Externo`),
  KEY `organizacion_idx` (`idOrganizacion`),
  CONSTRAINT `organizacion` FOREIGN KEY (`idOrganizacion`) REFERENCES `organizacion` (`idOrganizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `software_base`
--

DROP TABLE IF EXISTS `software_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software_base` (
  `idSoftware_Base` int NOT NULL,
  `nombreSoftware_Base` varchar(250) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `idTipo_Software_Base` int DEFAULT NULL,
  `idHardware` int DEFAULT NULL,
  `idNodo` int DEFAULT NULL,
  PRIMARY KEY (`idSoftware_Base`),
  KEY `tipoSoftwareBase_idx` (`idTipo_Software_Base`),
  KEY `hardware_idx` (`idHardware`),
  KEY `nodo_idx` (`idNodo`),
  CONSTRAINT `id_Nodo` FOREIGN KEY (`idNodo`) REFERENCES `nodo` (`idNodo`),
  CONSTRAINT `idHardware` FOREIGN KEY (`idHardware`) REFERENCES `hardware` (`idHardware`),
  CONSTRAINT `idTipoSoftwareBase` FOREIGN KEY (`idTipo_Software_Base`) REFERENCES `tipo_software_base` (`idTipo_Software_Base`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_canal_conexion`
--

DROP TABLE IF EXISTS `tipo_canal_conexion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_canal_conexion` (
  `id` int NOT NULL,
  `nombreCanal_Conexion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_capacidad`
--

DROP TABLE IF EXISTS `tipo_capacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_capacidad` (
  `id` int NOT NULL,
  `nombreTipoCapacidad` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_informacion`
--

DROP TABLE IF EXISTS `tipo_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_informacion` (
  `idTipo_Informacion` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Informacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_localizacion`
--

DROP TABLE IF EXISTS `tipo_localizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_localizacion` (
  `id` int NOT NULL,
  `nombreTipo_Localizacion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_servidor`
--

DROP TABLE IF EXISTS `tipo_servidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servidor` (
  `id` int NOT NULL,
  `nombreTipo_Servidor` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_software`
--

DROP TABLE IF EXISTS `tipo_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_software` (
  `id` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_software_base`
--

DROP TABLE IF EXISTS `tipo_software_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_software_base` (
  `idTipo_Software_Base` int NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Software_Base`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06  1:13:58
