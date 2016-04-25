CREATE DATABASE  IF NOT EXISTS `laboratorio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `laboratorio`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: laboratorio
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `canes`
--

DROP TABLE IF EXISTS `canes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_can` varchar(20) NOT NULL,
  `Tipo_sangre` varchar(5) NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  `Imagen_can` longblob NOT NULL,
  `Vacunas` text NOT NULL,
  `Nombre_raza` varchar(20) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canes`
--

LOCK TABLES `canes` WRITE;
/*!40000 ALTER TABLE `canes` DISABLE KEYS */;
/*!40000 ALTER TABLE `canes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_info`
--

DROP TABLE IF EXISTS `exa_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exa_info` (
  `Numero` int(8) NOT NULL,
  `cod_exa` int(11) NOT NULL,
  `Informacion` text NOT NULL,
  `Img1_procedimiento` longblob NOT NULL,
  `Img2_procedimiento` longblob NOT NULL,
  `Img3_procedimiento` longblob NOT NULL,
  `Img4_procedimiento` longblob NOT NULL,
  `Video_procedimiento` longblob NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `Numero_idx` (`cod_exa`),
  CONSTRAINT `Numero` FOREIGN KEY (`cod_exa`) REFERENCES `examen` (`cod_exa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_info`
--

LOCK TABLES `exa_info` WRITE;
/*!40000 ALTER TABLE `exa_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `exa_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exacod`
--

DROP TABLE IF EXISTS `exacod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exacod` (
  `registro` int(8) NOT NULL AUTO_INCREMENT,
  `cod_exa` int(11) NOT NULL,
  `sub_exa` varchar(50) NOT NULL,
  `unidad` varchar(30) NOT NULL,
  `rango_neg` varchar(10) NOT NULL,
  `rango_pos` varchar(10) NOT NULL,
  `nombre_raza` varchar(20) NOT NULL,
  PRIMARY KEY (`registro`),
  KEY `cod_exa` (`cod_exa`),
  CONSTRAINT `cod_exa` FOREIGN KEY (`cod_exa`) REFERENCES `examen` (`cod_exa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exacod`
--

LOCK TABLES `exacod` WRITE;
/*!40000 ALTER TABLE `exacod` DISABLE KEYS */;
/*!40000 ALTER TABLE `exacod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examen` (
  `cod_exa` int(11) NOT NULL AUTO_INCREMENT,
  `nom_exa` varchar(60) NOT NULL,
  `valor_exa` int(11) NOT NULL,
  `muestra_exa` varchar(20) NOT NULL,
  `mues_img` blob NOT NULL,
  `fecha_examen` date NOT NULL,
  `video_examen` blob NOT NULL,
  PRIMARY KEY (`cod_exa`),
  KEY `cod_exa` (`cod_exa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula_Med` int(20) NOT NULL,
  `Nombre_Med` varchar(30) NOT NULL,
  `Apellidos_Med` varchar(30) NOT NULL,
  `Direccion_Med` varchar(45) NOT NULL,
  `Telefono_Med` int(20) NOT NULL,
  `Celular_Med` int(20) NOT NULL,
  `Ciudad` varchar(30) NOT NULL,
  `Img_Med` longblob NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `Cedula_PT` int(20) NOT NULL AUTO_INCREMENT,
  `Nombre_PT` varchar(30) NOT NULL,
  `Apellido_PT` varchar(30) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Caso` int(10) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Celular` int(20) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Ciudad` varchar(45) NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Codigo_can` int(11) NOT NULL,
  PRIMARY KEY (`Cedula_PT`),
  KEY `Codigo_canes_idx` (`Codigo_can`),
  CONSTRAINT `Codigo_canes` FOREIGN KEY (`Codigo_can`) REFERENCES `canes` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_informe`
--

DROP TABLE IF EXISTS `resultado_informe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultado_informe` (
  `Numero` int(10) NOT NULL AUTO_INCREMENT,
  `Codigo_exa` int(11) NOT NULL,
  `Sub_exam` varchar(50) NOT NULL,
  `Nombre_examen` varchar(60) NOT NULL,
  `Resultado` varchar(30) NOT NULL,
  `FechaControl` date NOT NULL,
  `Rango_neg` varchar(8) NOT NULL,
  `Rango_pos` varchar(8) NOT NULL,
  `Registro` int(8) NOT NULL,
  `Imagen_resultado` blob NOT NULL,
  `Img2_res` blob NOT NULL,
  `Img3_res` blob NOT NULL,
  `Video_res` longblob NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `Numero2_idx` (`Codigo_exa`),
  CONSTRAINT `Numero2` FOREIGN KEY (`Codigo_exa`) REFERENCES `exacod` (`cod_exa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Numero3` FOREIGN KEY (`Codigo_exa`) REFERENCES `exa_info` (`cod_exa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_informe`
--

LOCK TABLES `resultado_informe` WRITE;
/*!40000 ALTER TABLE `resultado_informe` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_informe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultados` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_examen` varchar(60) NOT NULL,
  `Valor_examen` int(20) NOT NULL,
  `Fecha` date NOT NULL,
  `Caso` int(10) NOT NULL,
  `Cod_exa_num` int(10) NOT NULL,
  `Cod_Med` int(10) NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `Caso_idx` (`Caso`),
  KEY `Cod_exa_num_idx` (`Cod_exa_num`),
  KEY `Cod_med_idx` (`Cod_Med`),
  CONSTRAINT `Caso` FOREIGN KEY (`Caso`) REFERENCES `paciente` (`Cedula_PT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Cod_exa_num` FOREIGN KEY (`Cod_exa_num`) REFERENCES `resultado_informe` (`Numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Cod_med` FOREIGN KEY (`Cod_Med`) REFERENCES `medicos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados`
--

LOCK TABLES `resultados` WRITE;
/*!40000 ALTER TABLE `resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-09 13:16:44
