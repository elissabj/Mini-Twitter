-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: Observatorio
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `Nombre` varchar(64) NOT NULL,
  `ApePa` varchar(32) NOT NULL,
  `ApeMa` varchar(32) NOT NULL,
  `idpersona` varchar(128) NOT NULL,
  PRIMARY KEY (`idpersona`,`Nombre`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('Elisa','Ramos','Prueba','2015090493'),('Elias','Muñoz','Primero','2015021066');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idComentario` int(128) NOT NULL,
  `Contenido` varchar(1024) NOT NULL,
  `idForo` int(128) DEFAULT NULL,
  `idpersona` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idpersona` (`idpersona`),
  KEY `idForo` (`idForo`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`idForo`) REFERENCES `forodiscusion` (`idForo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (3,'Contenido Cambiado',1,'2015090493'),(4,'Comentario 1',1,'2015090493'),(6,'Comentario 1',1,'2015090493');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `Nombre` varchar(64) NOT NULL,
  `ApePa` varchar(32) NOT NULL,
  `ApeMa` varchar(32) NOT NULL,
  `NumSeguidos` int(128) NOT NULL,
  `NumSeguidores` int(128) NOT NULL,
  `idpersona` varchar(128) NOT NULL,
  PRIMARY KEY (`idpersona`,`Nombre`),
  CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('Ana Isabel','','',2,0,'2015090030'),('Empresa1','S.A...','C.V..',2,3,'2015020110'),('Empresa2','S.A.','C.V',2,3,'2015020123');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `idEncuesta` int(128) NOT NULL,
  `Titulo` varchar(128) NOT NULL,
  `Hipervinculo` varchar(512) NOT NULL,
  `idUsuario` varchar(128) DEFAULT NULL,
  `NombreUsr` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idEncuesta`),
  KEY `idUsuario` (`idUsuario`,`NombreUsr`),
  CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `empresa` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'Encuesta 1','Quien fue primero el huevo o la gallina','2015020110','Empresa1'),(6,'Teoria de Conjuntos','https://drive.google.com/open?id=1adEBvtV2DPIUdgrLaqjBu894rt4TmI4-MgItS7eu45c','2015020123','Empresa2');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forodiscusion`
--

DROP TABLE IF EXISTS `forodiscusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forodiscusion` (
  `idForo` int(128) NOT NULL,
  `Titulo` varchar(128) NOT NULL,
  `Contenido` varchar(2048) NOT NULL,
  `idUsuario` varchar(128) DEFAULT NULL,
  `NombreUsr` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idForo`),
  KEY `idUsuario` (`idUsuario`,`NombreUsr`),
  CONSTRAINT `forodiscusion_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `empresa` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forodiscusion`
--

LOCK TABLES `forodiscusion` WRITE;
/*!40000 ALTER TABLE `forodiscusion` DISABLE KEYS */;
INSERT INTO `forodiscusion` VALUES (1,'Foro 1','Contenido 1','2015020123','Empresa2'),(4,'Foro 4','Contenido 1','2015020110','Empresa1');
/*!40000 ALTER TABLE `forodiscusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestionadministrador`
--

DROP TABLE IF EXISTS `gestionadministrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestionadministrador` (
  `IdRegistro` int(128) NOT NULL,
  `IdAdministrador` varchar(128) DEFAULT NULL,
  `NombreAdministrador` varchar(64) DEFAULT NULL,
  `IdPersonaModificada` varchar(128) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Descripcion` varchar(64) NOT NULL,
  PRIMARY KEY (`IdRegistro`),
  KEY `IdAdministrador` (`IdAdministrador`,`NombreAdministrador`),
  KEY `IdPersonaModificada` (`IdPersonaModificada`),
  CONSTRAINT `gestionadministrador_ibfk_1` FOREIGN KEY (`IdAdministrador`, `NombreAdministrador`) REFERENCES `administrador` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestionadministrador_ibfk_2` FOREIGN KEY (`IdPersonaModificada`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestionadministrador`
--

LOCK TABLES `gestionadministrador` WRITE;
/*!40000 ALTER TABLE `gestionadministrador` DISABLE KEYS */;
INSERT INTO `gestionadministrador` VALUES (2,'2015090493','Elias','2015020110','2019-05-21 06:55:13','Alta'),(3,'2015090493','Elias','2015020123','2019-05-21 07:53:05','Alta'),(4,'2015090493','Elias','2015020123','2019-05-21 07:53:28','Cambio'),(5,'2015090493','Elias','2015020123','2019-05-21 07:54:40','Cambio'),(6,'2015090493','Elias','2015020123','2019-05-21 07:54:43','Cambio'),(7,'2015090493','Elias','2015020123','2019-05-21 07:54:48','Cambio'),(8,'2015090493','Elias','2015020110','2019-05-21 07:56:43','Cambio'),(9,'2015090493','Elias','2015020110','2019-05-21 07:56:46','Cambio'),(10,'2015090493','Elias','2015020110','2019-05-21 07:56:58','Cambio'),(11,'2015090493','Elias','2015020110','2019-05-21 08:42:13','Cambio'),(12,'2015090493','Elias','2015020110','2019-05-21 08:42:30','Cambio'),(13,'2015090493','Elias','2015020110','2019-05-21 23:56:47','Cambio'),(14,'2015090493','Elias','2015020110','2019-05-21 23:56:50','Cambio'),(15,'2015090493','Elias','2015090520','2019-05-22 02:43:52','Alta'),(18,'2015090493','Elias','2015020110','2019-05-22 03:18:13','Cambio'),(19,'2015090493','Elias','2015090500','2019-05-22 03:20:18','Alta'),(20,'2015090493','Elias','2015090500','2019-05-22 03:20:48','Cambio'),(21,'2015090493','Elias','2015090500','2019-05-22 03:21:05','Cambio'),(22,'2015090493','Elias','2015090500','2019-05-22 03:21:20','Cambio'),(23,'2015090493','Elias','2015090500','2019-05-22 03:21:49','Cambio'),(24,'2015090491','Elisa','2015090001','2019-06-02 08:59:23','Alta'),(25,'2015090491','Elisa','2015090002','2019-06-02 09:01:32','Alta'),(26,'2015090491','Elisa','2015090003','2019-06-02 09:02:13','Alta'),(27,'2015090491','Elisa','2015090004','2019-06-02 09:03:32','Alta'),(28,'2015090491','Elisa','2015090006','2019-06-02 09:06:43','Alta'),(29,'2015090491','Elisa','2015090007','2019-06-02 09:08:19','Alta'),(30,'2015090491','Elisa','2015090009','2019-06-02 09:12:34','Alta'),(31,'2015090491','Elisa','2015090009','2019-06-02 09:23:16','Baja'),(32,'2015090491','Elisa','2015090004','2019-06-02 09:23:19','Baja'),(33,'2015090491','Elisa','2015090006','2019-06-02 09:23:20','Baja'),(34,'2015090491','Elisa','2015090007','2019-06-02 09:23:21','Baja'),(35,'2015090491','Elisa','2015090001','2019-06-02 09:23:22','Baja'),(36,'2015090491','Elisa','2015090002','2019-06-02 09:23:23','Baja'),(37,'2015090491','Elisa','2015090003','2019-06-02 09:23:24','Baja'),(38,'2015090491','Elisa','2015090030','2019-06-02 09:24:12','Alta');
/*!40000 ALTER TABLE `gestionadministrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `Nombre` varchar(64) NOT NULL,
  `ApePa` varchar(32) NOT NULL,
  `ApeMa` varchar(32) NOT NULL,
  `NumSeguidos` int(128) NOT NULL,
  `NumSeguidores` int(128) NOT NULL,
  `idpersona` varchar(128) NOT NULL,
  PRIMARY KEY (`idpersona`,`Nombre`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('Persona3','','',0,0,'2015020500'),('Persona1','','',0,0,'2015090520');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacion` (
  `idPublicacion` int(128) NOT NULL,
  `Titulo` varchar(128) NOT NULL,
  `Contenido` varchar(2048) NOT NULL,
  `Imagen` mediumblob,
  `idUsuario` varchar(128) DEFAULT NULL,
  `NombreUsr` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idPublicacion`),
  KEY `idUsuario` (`idUsuario`,`NombreUsr`),
  CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `empresa` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (2,'Publicacion 2','Contenido Equis','','2015020110','Empresa1'),(3,'Publicacion 1','Prueba de contenido','NULL','2015020123','Empresa2');
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidoresempresa`
--

DROP TABLE IF EXISTS `seguidoresempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidoresempresa` (
  `idUsuario` varchar(128) NOT NULL,
  `NombreUsr` varchar(64) NOT NULL,
  `idSeguidor` varchar(128) NOT NULL,
  PRIMARY KEY (`idUsuario`,`NombreUsr`,`idSeguidor`),
  KEY `idSeguidor` (`idSeguidor`),
  CONSTRAINT `seguidoresempresa_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `empresa` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seguidoresempresa_ibfk_2` FOREIGN KEY (`idSeguidor`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidoresempresa`
--

LOCK TABLES `seguidoresempresa` WRITE;
/*!40000 ALTER TABLE `seguidoresempresa` DISABLE KEYS */;
INSERT INTO `seguidoresempresa` VALUES ('2015020110','Empresa1','2015090030'),('2015020123','Empresa2','2015090030'),('2015020110','Empresa1','2015020110'),('2015020123','Empresa2','2015020110'),('2015020110','Empresa1','2015020123'),('2015020123','Empresa2','2015020123');
/*!40000 ALTER TABLE `seguidoresempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidorespersona`
--

DROP TABLE IF EXISTS `seguidorespersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidorespersona` (
  `idUsuario` varchar(128) NOT NULL,
  `NombreUsr` varchar(64) NOT NULL,
  `idSeguidor` varchar(128) NOT NULL,
  PRIMARY KEY (`idUsuario`,`NombreUsr`,`idSeguidor`),
  KEY `idSeguidor` (`idSeguidor`),
  CONSTRAINT `seguidorespersona_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `persona` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seguidorespersona_ibfk_2` FOREIGN KEY (`idSeguidor`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidorespersona`
--

LOCK TABLES `seguidorespersona` WRITE;
/*!40000 ALTER TABLE `seguidorespersona` DISABLE KEYS */;
INSERT INTO `seguidorespersona` VALUES ('2015090500','Persona3','2015020110'),('2015090520','Persona1','2015020123'),('2015090520','Persona1','2015090500'),('2015090500','Persona3','2015090520');
/*!40000 ALTER TABLE `seguidorespersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidosempresa`
--

DROP TABLE IF EXISTS `seguidosempresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidosempresa` (
  `idUsuario` varchar(128) NOT NULL,
  `NombreUsr` varchar(64) NOT NULL,
  `idSeguido` varchar(128) NOT NULL,
  PRIMARY KEY (`idUsuario`,`NombreUsr`,`idSeguido`),
  KEY `idSeguido` (`idSeguido`),
  CONSTRAINT `seguidosempresa_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `empresa` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seguidosempresa_ibfk_2` FOREIGN KEY (`idSeguido`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidosempresa`
--

LOCK TABLES `seguidosempresa` WRITE;
/*!40000 ALTER TABLE `seguidosempresa` DISABLE KEYS */;
INSERT INTO `seguidosempresa` VALUES ('2015090030','Ana Isabel','2015020110'),('2015020110','Empresa1','2015020110'),('2015020123','Empresa2','2015020110'),('2015090030','Ana Isabel','2015020123'),('2015020110','Empresa1','2015020123'),('2015020123','Empresa2','2015020123');
/*!40000 ALTER TABLE `seguidosempresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguidospersona`
--

DROP TABLE IF EXISTS `seguidospersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidospersona` (
  `idUsuario` varchar(128) NOT NULL,
  `NombreUsr` varchar(64) NOT NULL,
  `idSeguido` varchar(128) NOT NULL,
  PRIMARY KEY (`idUsuario`,`NombreUsr`,`idSeguido`),
  KEY `idSeguido` (`idSeguido`),
  CONSTRAINT `seguidospersona_ibfk_1` FOREIGN KEY (`idUsuario`, `NombreUsr`) REFERENCES `persona` (`idpersona`, `Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seguidospersona_ibfk_2` FOREIGN KEY (`idSeguido`) REFERENCES `usuario` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguidospersona`
--

LOCK TABLES `seguidospersona` WRITE;
/*!40000 ALTER TABLE `seguidospersona` DISABLE KEYS */;
INSERT INTO `seguidospersona` VALUES ('2015090520','Persona1','2015090500'),('2015090500','Persona3','2015090520');
/*!40000 ALTER TABLE `seguidospersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUSR` int(32) NOT NULL,
  `Descripcion` varchar(64) NOT NULL,
  PRIMARY KEY (`idTipoUSR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(2,'Empresa'),(3,'Usuario');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idpersona` varchar(128) NOT NULL,
  `USR` varchar(512) NOT NULL,
  `PSW` varchar(512) NOT NULL,
  `idTipoUSR` int(32) DEFAULT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `idTipoUSR` (`idTipoUSR`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idTipoUSR`) REFERENCES `tipousuario` (`idTipoUSR`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('2015090001','0','0',2),('2015090002','0','0',2),('2015090003','0','0',2),('2015090004','0','0',2),('2015090006','0','0',2),('2015090007','0','0',2),('2015090009','0','0',2),('2015090011','0','0',1),('2015090030','c570f4886c3908d90bae15e45175ecd2','40bd001563085fc35165329ea1ff5c5ecbdbbeef',2),('2015020110','2f627547f87235a2365fe8922f55a7e4','40bd001563085fc35165329ea1ff5c5ecbdbbeef',2),('2015020123','2e80a184267270fc8a50f3f9aef3902e','40bd001563085fc35165329ea1ff5c5ecbdbbeef',2),('2015090487','0','0',1),('2015090491','2e6a979fc1842b2fa9db94977c120c97','40bd001563085fc35165329ea1ff5c5ecbdbbeef',1),('2015090493','cfe6055d2e0503be378bb63449ec7ba6','7110eda4d09e062aa5e4a390b0a572ac0d2c0220',1),('2015090500','ad03fa176f62b65887fa91b6044e3f42','40bd001563085fc35165329ea1ff5c5ecbdbbeef',3),('2015090520','464e3912cc8d118beb4c2ffb6d12eb7c','40bd001563085fc35165329ea1ff5c5ecbdbbeef',3),('2015097846','0','0',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Observatorio'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaAdministrador`(in idPer nvarchar(128), in usur nvarchar(512), in pswd nvarchar(512),
									  in nom nvarchar(64), in apPa nvarchar(32), in apMa nvarchar(32))
begin
declare existe int;
declare msj nvarchar(64);
declare validaUsuario int;
declare validaAdministrador int;
declare validaCuenta int;
declare validaNomAdmon int;

set existe = (select count(*) from Usuario U where U.idpersona=idPer);

	if existe = 1 then		
        set validaCuenta = (select count(*) from Usuario U where U.idpersona=idPer and U.USR='0' and U.PSW='0');        
		if validaCuenta = 0 then
			set msj = 'Persona Existente';
		else
			set msj = 'Persona Bloqueada';
		end if;
	else
		set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
		if validaUsuario = 1 then
			set msj = 'Usuario Existente';
		else
			set validaAdministrador = (select count(*) from Administrador where Nombre=nom and ApePa=apPa and ApeMa=apMa);
			if validaAdministrador = 1 then
				set msj = 'Administrador Existente';
			else
				set validaNomAdmon = (select count(*) from Administrador where Nombre=nom);
                if validaNomAdmon = 1 then
					set msj = 'Administrador Existente';
                else
					insert into Usuario values(idPer,md5(usur),sha(pswd),1);
					insert into Administrador values(nom,apPa,apMa,idPer);
					set msj = 'Administrador Registrado';			
                end if;				
			end if;
		end if;		
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaComentario`(in contenid nvarchar(1024),in idFor int(128),
							 in idPer nvarchar(128))
begin
declare msj nvarchar(64);
declare idComen int;

	set idComen = (select ifnull(max(idComentario),0)+1 from Comentario);
	insert into Comentario
		values(idComen,contenid,idFor,idPer);
	set msj = 'Comentario Registrado';
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaEmpresa`(in idAdmon nvarchar(128), in nomAdmon nvarchar(64),
								in idPer nvarchar(128), in usur nvarchar(512), in pswd nvarchar(512),
								in nom nvarchar(64), in apPa nvarchar(32), in apMa nvarchar(32))
begin
declare existe int;
declare msj nvarchar(64);
declare idRegis int;
declare validaCuenta int;
declare validaUsuario int;
declare validaEmpresa int;
declare validaNomEmp int;

	set existe = (select count(*) from Usuario U where U.idpersona=idPer);
	
	if existe = 1 then
        set validaCuenta = (select count(*) from Usuario U where U.idpersona=idPer and U.USR='0' and U.PSW='0');        
		if validaCuenta = 0 then
			set msj = 'Persona Existente';
		else
			set msj = 'Persona Bloqueada';
		end if;
	else
		set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
        if validaUsuario = 1 then
			set msj = 'Usuario Existente';
        else
			set validaEmpresa = (select count(*) from Empresa where Nombre=nom and ApePa=apPa and ApeMa=apMa);
            if validaEmpresa = 1 then
				set msj = 'Empresa Existente';
            else
				set validaNomEmp = (select count(*) from Empresa where Nombre=nom);
                if validaNomEmp = 1 then
					set msj = 'Empresa Existente';
                else
					set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
					insert into Usuario values(idPer,md5(usur),sha(pswd),2);
					insert into Empresa values(nom,apPa,apMa,0,0,idPer);
					insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
						values(idRegis,idAdmon,nomAdmon,idPer,'Alta');
					set msj = 'Empresa Registrada';
                end if;
			end if;
        end if;			        
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaEncuesta`(in titul nvarchar(128),in hipervin nvarchar(512), 
							 in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
declare idEnc int;

	set existe = (select count(*) from Encuesta where Titulo=titul);
	if existe = 1 then
		set msj = 'Encuesta Existente';
	else
		set idEnc = (select ifnull(max(idEncuesta),0)+1 from Encuesta);
		insert into Encuesta
			values(idEnc,titul,hipervin,idPer,nom);
		set msj = 'Encuesta Registrada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaForo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaForo`(in titul nvarchar(128),in contenid nvarchar(2048), 
							 in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
declare idFor int;

	set existe = (select count(*) from ForoDiscusion where Titulo=titul);
	if existe = 1 then
		set msj = 'Foro Existente';
	else
		set idFor = (select ifnull(max(idForo),0)+1 from ForoDiscusion);
		insert into ForoDiscusion
			values(idFor,titul,contenid,idPer,nom);
		set msj = 'Foro Registrado';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaPersona`(in idAdmon nvarchar(128), in nomAdmon nvarchar(64),
								in idPer nvarchar(128), in usur nvarchar(512), in pswd nvarchar(512),
								in nom nvarchar(64), in apPa nvarchar(32), in apMa nvarchar(32))
begin
declare existe int;
declare msj nvarchar(64);
declare idRegis int;
declare validaCuenta int;
declare validaUsuario int;
declare validaPersona int;
declare validaNomPer int;

	set existe = (select count(*) from Usuario U where U.idpersona=idPer);
	
	if existe = 1 then
        set validaCuenta = (select count(*) from Usuario U where U.idpersona=idPer and U.USR='0' and U.PSW='0');        
		if validaCuenta = 0 then
			set msj = 'Persona Existente';
		else
			set msj = 'Persona Bloqueada';
		end if;
	else
		set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
        if validaUsuario = 1 then
			set msj = 'Usuario Existente';
        else
			set validaPersona = (select count(*) from Persona where Nombre=nom and ApePa=apPa and ApeMa=apMa);
            if validaPersona = 1 then
				set msj = 'Persona Existente';
            else
				set validaNomPer = (select count(*) from Persona where Nombre=nom);
                if validaNomPer = 1 then
					set msj = 'Nombre Persona Existente';
                else
					set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
					insert into Usuario values(idPer,md5(usur),sha(pswd),3);
					insert into Persona values(nom,apPa,apMa,0,0,idPer);
					insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
						values(idRegis,idAdmon,nomAdmon,idPer,'Alta');
					set msj = 'Persona Registrada';
                end if;
			end if;
        end if;			        
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaPublicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaPublicacion`(in titul nvarchar(128),in contenid nvarchar(2048),in Imagn MEDIUMBLOB,
							 in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
declare idPub int;

	set existe = (select count(*) from Publicacion where Titulo=titul);
	if existe = 1 then
		set msj = 'Publicacion Existente';
	else
		set idPub = (select ifnull(max(idPublicacion),0)+1 from Publicacion);
		insert into Publicacion
			values(idPub,titul,contenid,Imagn,idPer,nom);
		set msj = 'Publicacion Registrada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaSeguidoresPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaSeguidoresPersona`(in idPer nvarchar(128), in nom nvarchar(64), 
										  in idSegdor nvarchar(128), in nomSegdor nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
declare validaSeguidor int;
declare tipoSeguidor int(32);
declare validaRegistro int;

	set validaRegistro = (select count(*) from SeguidoresPersona where idUsuario=idPer and NombreUsr=nom and idSeguidor=idSegdor);
	
	if validaRegistro = 1 then
		set msj = 'Esta Persona ya te sigue';
	else
		set existe = (select count(*) from Persona where idpersona=idPer and Nombre=nom);
		if existe = 0 then
			set msj = 'Persona Inexistente';
		else
			set validaSeguidor = (select count(*) from Usuario where idpersona=idSegdor);
			if validaSeguidor = 0 then
				set msj = 'Seguidor Inexistente';
			else
				set tipoSeguidor = (select TP.idTipoUSR from TipoUsuario TP, Usuario U where U.idTipoUSR=TP.idTipoUSR and U.idpersona=idSegdor);
				if tipoSeguidor = 3 then
					insert into SeguidoresPersona 
						values(idPer,nom,idSegdor);
					insert into SeguidosPersona
						values(idSegdor,nomSegdor,idPer);
					set msj = 'Seguidor Registrado';
				else
					insert into SeguidoresPersona 
						values(idPer,nom,idSegdor);
					insert into SeguidosEmpresa
						values(idSegdor,nomSegdor,idPer);
					set msj = 'Seguidor Registrado';
				end if;
			end if;
		end if;
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AltaSeguidosEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AltaSeguidosEmpresa`(in idPer nvarchar(128), in nom nvarchar(64), 
								  		in idSegdo nvarchar(128), in nomSegdo nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
	
	set existe = (select count(*) from usuario where idpersona=idSegdo);
	if existe = 1 then
		insert into SeguidosEmpresa values(idPer,nom,idSegdo);
		insert into SeguidoresEmpresa values(idSegdo,nomSegdo,idPer);
		update empresa set NumSeguidos=NumSeguidos+1 where idpersona=idPer and Nombre=nom;
		update empresa set NumSeguidores=NumSeguidores+1 where idpersona=idSegdo and Nombre=nomSegdo;
		set msj = 'Seguidor Registrado';
	else
		set msj = 'Persona Inexistente';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaAdministrador`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);

set existe = (select count(*) from Administrador adm where adm.idpersona=idPer and adm.Nombre=nom);

	if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		update Usuario set USR='0', PSW='0' where idpersona=idPer;
        delete from Administrador where idpersona=idPer and Nombre=nom;		
		set msj = 'Administrador Eliminado';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaComentario`(in idComen int(128))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Comentario where idComentario=idComen);
	if existe = 0 then
		set msj = 'Comentario Inexistente';
	else
		delete from Comentario where idComentario=idComen;		
		set msj = 'Comentario Eliminado';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaEmpresa`(in idAdmon nvarchar(128), in nomAdmon nvarchar(64),
								in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
declare idRegis int;

	set existe = (select count(*) from Empresa Emp where Emp.idpersona=idPer and Emp.Nombre=nom);
	
	if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		update Usuario set USR='0', PSW='0' where idpersona=idPer;
		set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
		insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
			values(idRegis,idAdmon,nomAdmon,idPer,'Baja');
		delete from Empresa where idpersona=idPer and Nombre=nom;
		set msj = 'Empresa Eliminada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaEncuesta`(in idEnc int(128))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Encuesta where idEncuesta=idEnc);
	if existe = 0 then
		set msj = 'Encuesta Inexistente';
	else
		delete from Encuesta where idEncuesta=idEnc;
		set msj = 'Encuesta Eliminada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaForo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaForo`(in idFor int(128))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from ForoDiscusion where idForo=idFor);
	if existe = 0 then
		set msj = 'Foro Inexistente';
	else
		delete from ForoDiscusion where idForo=idFor;
		delete from Comentario where idForo=idFor;
		set msj = 'Foro Eliminado';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaPersona`(in idAdmon nvarchar(128), in nomAdmon nvarchar(64),
								in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
declare idRegis int;

	set existe = (select count(*) from Persona where idpersona=idPer and Nombre=nom);
	
	if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		update Usuario set USR='0', PSW='0' where idpersona=idPer;
		set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
		insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
			values(idRegis,idAdmon,nomAdmon,idPer,'Baja');
		delete from Persona where idpersona=idPer and Nombre=nom;
		set msj = 'Persona Eliminada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaPublicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaPublicacion`(in idPub int(128))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Publicacion where idPublicacion=idPub);
	if existe = 0 then
		set msj = 'Publicacion Inexistente';
	else
		delete from Publicacion where idPublicacion=idPub;
		set msj = 'Publicacion Eliminada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_BajaSeguidosEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_BajaSeguidosEmpresa`(in idPer nvarchar(128), in nom nvarchar(64), 
								  		in idSegdo nvarchar(128), in nomSegdo nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
	
	set existe = (select count(*) from usuario where idpersona=idSegdo);
	if existe = 1 then
		delete from SeguidosEmpresa where idUsuario=idPer and NombreUsr=nom and idSeguido=idSegdo;
		delete from SeguidoresEmpresa where idUsuario=idSegdo and NombreUsr=nomSegdo and idSeguidor=idPer;
		update empresa set NumSeguidos=NumSeguidos-1 where idpersona=idPer and Nombre=nom;
		update empresa set NumSeguidores=NumSeguidores-1 where idpersona=idSegdo and Nombre=nomSegdo;
		set msj = 'Seguidor Eliminado';
	else
		set msj = 'Persona Inexistente';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioAdministrador`(in idPerOld nvarchar(128), in nomOld nvarchar(64),
									in idPer nvarchar(128), in usur nvarchar(512), in pswd nvarchar(512),
									in nom nvarchar(64), in apPa nvarchar(32), in apMa nvarchar(32))
begin
declare existe int;
declare msj nvarchar(64);
declare validaUsuario int;
declare validaPersona int;
declare Conta int;
declare validaAdmon int;

set existe = (select count(*) from Administrador adm where adm.idpersona=idPerOld and adm.Nombre=nomOld);

	if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		set validaAdmon = (select count(*) from Administrador where Nombre=nom);
        if validaAdmon = 1 then
            if nomOld = nom then
				set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
				if validaUsuario = 1 then
					set Conta = (select count(*) from Usuario U where U.USR=md5(usur) and U.idpersona=idPerOld);
					if Conta = 1 then
						if idPerOld = idPer then
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set msj = 'Administrador Cambiado';
						else
							set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
							if validaPersona = 1 then
								set msj = 'Persona Existente';
							else		
								update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
									where idpersona=idPerOld;
								update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
									where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
								set msj = 'Administrador Cambiado';
							end if;
						end if;	
					else
						set msj = 'Usuario Existente';
					end if;
				else
					if idPerOld = idPer then
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set msj = 'Administrador Cambiado';
					else
						set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
						if validaPersona = 1 then
							set msj = 'Persona Existente';
						else		
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set msj = 'Administrador Cambiado';
						end if;
					end if;					
				end if;
            else
				set msj = 'Administrador Existente';
            end if;
        else
			set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
			if validaUsuario = 1 then
				set Conta = (select count(*) from Usuario U where U.USR=md5(usur) and U.idpersona=idPerOld);
				if Conta = 1 then
					if idPerOld = idPer then
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set msj = 'Administrador Cambiado';
					else
						set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
						if validaPersona = 1 then
							set msj = 'Persona Existente';
						else		
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set msj = 'Administrador Cambiado';
						end if;
					end if;	
				else
					set msj = 'Usuario Existente';
				end if;
			else
				if idPerOld = idPer then
					update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
						where idpersona=idPerOld;
					update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
						where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
					set msj = 'Administrador Cambiado';
				else
					set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
					if validaPersona = 1 then
						set msj = 'Persona Existente';
					else		
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Administrador set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set msj = 'Administrador Cambiado';
					end if;
				end if;					
			end if;
        end if;	
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioComentario`(in idComen int(128),in contenid nvarchar(1024))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Comentario where idComentario=idComen);
	if existe = 0 then
		set msj = 'Comentario Inexistente';
	else	
		update Comentario set Contenido=contenid where idComentario=idComen;
		set msj = 'Comentario Cambiado';		
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioEmpresa`(in idAdmon nvarchar(128), in nomAdmon nvarchar(64),
								in idPerOld nvarchar(128), in nomOld nvarchar(64),
								in idPer nvarchar(128), in usur nvarchar(512), in pswd nvarchar(512),
								in nom nvarchar(64), in apPa nvarchar(32), in apMa nvarchar(32))
begin
declare existe int;
declare msj nvarchar(64);
declare idRegis int;
declare validaUsuario int;
declare validaPersona int;
declare Conta int;
declare validaEmpresa int;

	set existe = (select count(*) from Empresa Emp where Emp.idpersona=idPerOld and Emp.Nombre=nomOld);

	if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		set validaEmpresa = (select count(*) from Empresa where Nombre=nom);
        if validaEmpresa = 1 then
			if nomOld = nom then
				set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
				if validaUsuario = 1 then
					set Conta = (select count(*) from Usuario U where U.USR=md5(usur) and U.idpersona=idPerOld);
					if Conta = 1 then
						if idPerOld = idPer then
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
							insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
								values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
							set msj = 'Empresa Cambiada';
						else
							set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
							if validaPersona = 1 then
								set msj = 'Persona Existente';
							else
								update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
									where idpersona=idPerOld;
								update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
									where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
								set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
								insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
									values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
								set msj = 'Empresa Cambiada';                
							end if;                                
						end if;
					else
						set msj = 'Usuario Existente';
					end if;
				else
					if idPerOld = idPer then
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
						insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
							values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
						set msj = 'Empresa Cambiada';
					else
						set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
						if validaPersona = 1 then
							set msj = 'Persona Existente';
						else
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
							insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
								values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
							set msj = 'Empresa Cambiada';                
						end if;                                
					end if;
				end if; 
            else
				set msj = 'Empresa Existente';
            end if;            
        else 
			set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
			if validaUsuario = 1 then
				set Conta = (select count(*) from Usuario U where U.USR=md5(usur) and U.idpersona=idPerOld);
				if Conta = 1 then
					if idPerOld = idPer then
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
						insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
							values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
						set msj = 'Empresa Cambiada';
					else
						set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
						if validaPersona = 1 then
							set msj = 'Persona Existente';
						else
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
							insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
								values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
							set msj = 'Empresa Cambiada';                
						end if;                                
					end if;
				else
					set msj = 'Usuario Existente';
				end if;
			else
				if idPerOld = idPer then
					update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
						where idpersona=idPerOld;
					update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
						where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
					set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
					insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
						values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
					set msj = 'Empresa Cambiada';
				else
					set validaPersona = (select count(*) from Usuario U where U.idpersona=idPer);
					if validaPersona = 1 then
						set msj = 'Persona Existente';
					else
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Empresa set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
						insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
							values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
						set msj = 'Empresa Cambiada';                
					end if;                                
				end if;
			end if; 
        end if;
        
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioEncuesta`(in idEnc int(128),in titul nvarchar(128),in hipervin nvarchar(512))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Encuesta where idEncuesta=idEnc);
	if existe = 0 then
		set msj = 'Encuesta Inexistente';
	else	
		update Encuesta set Titulo=titul, Hipervinculo=hipervin where idEncuesta=idEnc;
		set msj = 'Encuesta Cambiada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioForo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioForo`(in idFor int(128),in titul nvarchar(128),in contenid nvarchar(2048))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from ForoDiscusion where idForo=idFor);
	if existe = 0 then
		set msj = 'Foro Inexistente';
	else	
		update ForoDiscusion set Titulo=titul, Contenido=contenid where idForo=idFor;
		set msj = 'Foro Cambiado';		
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioPersona`(in idAdmon nvarchar(128), in nomAdmon nvarchar(64),
								in idPerOld nvarchar(128), in nomOld nvarchar(64),
								in idPer nvarchar(128), in usur nvarchar(512), in pswd nvarchar(512),
								in nom nvarchar(64), in apPa nvarchar(32), in apMa nvarchar(32))
begin
declare existe int;
declare msj nvarchar(64);
declare idRegis int;
declare validaUsuario int;
declare validaPersonaExis int;
declare Conta int;
declare validaPersona int;

	set existe = (select count(*) from Persona where idpersona=idPerOld and Nombre=nomOld);

	if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		set validaPersona = (select count(*) from Persona where Nombre=nom);
        if validaPersona = 1 then
			if nomOld = nom then
				set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
				if validaUsuario = 1 then
					set Conta = (select count(*) from Usuario U where U.USR=md5(usur) and U.idpersona=idPerOld);
					if Conta = 1 then
						if idPerOld = idPer then
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
							insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
								values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
							set msj = 'Persona Cambiada';
						else
							set validaPersonaExis = (select count(*) from Usuario U where U.idpersona=idPer);
							if validaPersonaExis = 1 then
								set msj = 'Persona Existente';
							else
								update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
									where idpersona=idPerOld;
								update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
									where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
								set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
								insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
									values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
								set msj = 'Persona Cambiada';                
							end if;                                
						end if;
					else
						set msj = 'Usuario Existente';
					end if;
				else
					if idPerOld = idPer then
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
						insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
							values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
						set msj = 'Persona Cambiada';
					else
						set validaPersonaExis = (select count(*) from Usuario U where U.idpersona=idPer);
						if validaPersonaExis = 1 then
							set msj = 'Persona Existente';
						else
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
							insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
								values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
							set msj = 'Persona Cambiada';                
						end if;                                
					end if;
				end if; 
            else
				set msj = 'Persona Existente';
            end if;            
        else 
			set validaUsuario = (select count(*) from Usuario U where U.USR=md5(usur));
			if validaUsuario = 1 then
				set Conta = (select count(*) from Usuario U where U.USR=md5(usur) and U.idpersona=idPerOld);
				if Conta = 1 then
					if idPerOld = idPer then
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
						insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
							values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
						set msj = 'Persona Cambiada';
					else
						set validaPersonaExis = (select count(*) from Usuario U where U.idpersona=idPer);
						if validaPersonaExis = 1 then
							set msj = 'Persona Existente';
						else
							update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
								where idpersona=idPerOld;
							update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
								where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
							set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
							insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
								values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
							set msj = 'Persona Cambiada';                
						end if;                                
					end if;
				else
					set msj = 'Usuario Existente';
				end if;
			else
				if idPerOld = idPer then
					update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
						where idpersona=idPerOld;
					update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
						where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
					set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
					insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
						values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
					set msj = 'Persona Cambiada';
				else
					set validaPersonaExis = (select count(*) from Usuario U where U.idpersona=idPer);
					if validaPersonaExis = 1 then
						set msj = 'Persona Existente';
					else
						update Usuario set idpersona=idPer, USR=md5(usur), PSW=sha(pswd)
							where idpersona=idPerOld;
						update Persona set Nombre=nom, ApePa=apPa, ApeMa=apMa
							where (idpersona=idPer and Nombre=nomOld); ##Aqui ya se actualizo el nuedo idPersona, por eso lo comparo con el que se ingresa como nuevo
						set idRegis = (select ifnull(max(IdRegistro),0)+1 from GestionAdministrador);
						insert into GestionAdministrador(IdRegistro,IdAdministrador,NombreAdministrador,IdPersonaModificada,Descripcion) 
							values(idRegis,idAdmon,nomAdmon,idPer,'Cambio');		
						set msj = 'Persona Cambiada';                
					end if;                                
				end if;
			end if; 
        end if;
        
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CambioPublicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CambioPublicacion`(in idPub int(128),in titul nvarchar(128),in contenid nvarchar(2048),
							   in Imagn MEDIUMBLOB)
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Publicacion where idPublicacion=idPub);
	if existe = 0 then
		set msj = 'Publicacion Inexistente';
	else	
		update Publicacion set Titulo=titul, Contenido=contenid, Imagen=Imagn where idPublicacion=idPub;
		set msj = 'Publicacion Cambiada';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaAdministrador`(in usur nvarchar(512), in pswd nvarchar(512))
begin
	select U.idpersona,admon.Nombre from Usuario U, Administrador Admon 
	where U.idpersona=admon.idpersona and U.USR=md5(usur) and U.PSW=sha(pswd);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaComentario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaComentario`(in idFor int(128))
begin
declare existe int;
declare msj nvarchar(64);
	
	set existe = (select count(*) from Comentario where idForo=idFor);
	if existe = 0 then
		set msj = 'Foro Inexistente';
		select msj as Respuesta;
	else
		select * from Comentario where idForo=idFor order by idComentario asc;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaComentarioPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaComentarioPersona`(in idFor int(128), in idPer nvarchar(128))
begin
declare existe int;
declare msj nvarchar(64);
	
	set existe = (select count(*) from Comentario where idForo=idFor and idpersona=idPer);
	if existe = 0 then
		set msj = 'Foro Inexistente';
		select msj as Respuesta;
	else
		select * from Comentario where idForo=idFor and idpersona=idPer order by idComentario asc;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaEmpresa`(in usur nvarchar(512), in pswd nvarchar(512))
begin
	select U.idpersona,emp.Nombre,emp.NumSeguidos,emp.NumSeguidores from Usuario U, Empresa emp 
	where U.idpersona=emp.idpersona and U.USR=md5(usur) and U.PSW=sha(pswd);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaEncuesta`()
begin
	select * from Encuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaEncuestaEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaEncuestaEmpresa`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Encuesta where idUsuario=idPer and NombreUsr=nom);
	if existe = 0 then
		set msj = 'Encuesta Inexistente';
		select msj as Respuesta;
	else
		select * from Encuesta where idUsuario=idPer and NombreUsr=nom;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaForo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaForo`()
begin
	select * from ForoDiscusion;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaForoEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaForoEmpresa`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from ForoDiscusion where idUsuario=idPer and NombreUsr=nom);
	if existe = 0 then
		set msj = 'Foro Inexistente';
        select msj as Respuesta;
	else
		select * from ForoDiscusion where idUsuario=idPer and NombreUsr=nom;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaPublicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaPublicacion`()
begin
	select * from Publicacion;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaPublicacionEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaPublicacionEmpresa`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from Publicacion where idUsuario=idPer and NombreUsr=nom);
	if existe = 0 then
		set msj = 'Publicacion Inexistente';
		select msj as Respuesta;
	else
		select * from Publicacion where idUsuario=idPer and NombreUsr=nom;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConsultaSegySedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ConsultaSegySedores`(in idPer nvarchar(128), in nom nvarchar(64))
begin 
	select NumSeguidos,NumSeguidores from empresa where Nombre=nom and idpersona=idPer;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EncuestasSeguidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EncuestasSeguidos`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
	set existe = (select count(*) from Encuesta where idUsuario=idPer and NombreUsr=nom);
	if existe = 0 then
		select null;
	else
		select idEncuesta,Titulo, Hipervinculo, idUsuario,NombreUsr from Encuesta where idUsuario=idPer and NombreUsr=nom;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ForosSeguidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ForosSeguidos`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
	set existe = (select count(*) from ForoDiscusion where idUsuario=idPer and NombreUsr=nom);
	if existe = 0 then
		select null;
	else
		select idForo, Titulo, Contenido, idUsuario,NombreUsr from ForoDiscusion where idUsuario=idPer and NombreUsr=nom;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Login`(in usur nvarchar(512) , in pswd nvarchar(512))
begin
declare existe int;
declare msj varchar(64);
set existe = (select count(*) from Usuario U where U.USR=md5(usur) and U.PSW=sha(pswd));
    if existe = 0 then
		set msj = 'Persona Inexistente';
	else
		if existe = 1 then			
            set msj = (select TP.Descripcion from TipoUsuario TP where TP.idTipoUSR=
						(select idTipoUSR from Usuario U where U.USR=md5(usur) and U.PSW=sha(pswd)));
		else
			set msj = 'Error u.u';
		end if;
	end if;
    select msj as Respuesta;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PublicacionesSeguidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_PublicacionesSeguidos`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
	set existe = (select count(*) from Publicacion where idUsuario=idPer and NombreUsr=nom);
	if existe = 0 then
		select null;
	else
		select idPublicacion,Titulo, Contenido, idUsuario,NombreUsr from Publicacion where idUsuario=idPer and NombreUsr=nom;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TraeAdmons` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_TraeAdmons`()
begin
	select adm.Nombre,adm.idPersona, U.USR, U.PSW from usuario U, Administrador adm
		where U.idpersona=adm.idpersona;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TraeEmpresas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_TraeEmpresas`()
begin
	select emp.Nombre,emp.NumSeguidos,emp.NumSeguidores,emp.idPersona, U.USR, U.PSW from usuario U, empresa emp
		where U.idpersona=emp.idpersona;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TraeSeguidosEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_TraeSeguidosEmpresa`(in idPer nvarchar(128), in nom nvarchar(64))
begin
declare existe int;
declare msj nvarchar(64);
	set existe = (select count(*) from usuario where idpersona=idPer);
	if existe = 1 then
		select idUsuario, NombreUsr from SeguidoresEmpresa where idSeguidor=idPer;
	else
		select null;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ValidaSeguidosEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ValidaSeguidosEmpresa`(in idPer nvarchar(128), in nom nvarchar(64), 
								  		  in idSegdo nvarchar(128))
begin
declare existe int;
declare msj nvarchar(64);
	
	set existe = (select count(*) from SeguidosEmpresa 
						where idUsuario=idPer and NombreUsr=nom and idSeguido=idSegdo);
	if existe = 1 then
		set msj = 'Seguido Actualmente';
	else 
		set msj = 'No Seguido';
	end if;
	select msj as Respuesta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_VerForo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_VerForo`(in idFor int(128))
begin
declare existe int;
declare msj nvarchar(64);

	set existe = (select count(*) from ForoDiscusion where idForo=idFor);
	if existe = 0 then
		select null;
	else
		select * from ForoDiscusion where idForo=idFor;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-02  5:02:35
