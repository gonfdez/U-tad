-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: BD_bloc_de_notas
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adjunto`
--

DROP TABLE IF EXISTS `adjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjunto` (
  `id_adj` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_modificacion` datetime DEFAULT NULL,
  `ruta` varchar(100) DEFAULT NULL,
  `id_nota_adjunta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_adj`),
  KEY `adjunto_FK` (`id_nota_adjunta`),
  CONSTRAINT `adjunto_FK` FOREIGN KEY (`id_nota_adjunta`) REFERENCES `nota` (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjunto`
--

LOCK TABLES `adjunto` WRITE;
/*!40000 ALTER TABLE `adjunto` DISABLE KEYS */;
INSERT INTO `adjunto` VALUES (1,'2020-03-18 20:36:09','/home/bbdd/adjuntos/1',9),(2,NULL,'/home/bbdd/adjuntos/2',1),(3,'2020-03-23 12:09:21','/home/bbdd/adjuntos/3',4),(4,NULL,'/home/bbdd/adjuntos/4',3),(5,NULL,'/home/bbdd/adjuntos/5',5);
/*!40000 ALTER TABLE `adjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloc`
--

DROP TABLE IF EXISTS `bloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloc` (
  `id_bloc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bloc` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usr_bloc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bloc`),
  KEY `bloc_FK` (`id_usr_bloc`),
  CONSTRAINT `bloc_FK` FOREIGN KEY (`id_usr_bloc`) REFERENCES `usuario` (`id_usr`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloc`
--

LOCK TABLES `bloc` WRITE;
/*!40000 ALTER TABLE `bloc` DISABLE KEYS */;
INSERT INTO `bloc` VALUES (1,'NombresProfes','2020-03-01 00:00:00',2),(2,'NombresAsignaturas','2020-02-22 00:00:00',3),(3,'DondeEstanLasCosas','2020-03-15 00:00:00',3),(4,'CuandoSonLosExamenes','2020-03-17 00:00:00',4),(5,'DondeSonLasClases','2020-02-27 00:00:00',5),(6,'Calificaciones','2020-03-10 00:00:00',1),(7,'Practicas','2020-03-10 00:00:00',1),(8,'EnQueGrupoEstoy','2020-03-07 00:00:00',3),(9,'NombresDeAlumnos','2020-03-25 12:45:30',6),(10,'AtencionAlAlumno','2020-03-15 23:42:02',3),(11,'ComoSeUsaElBlocDeNotas','2020-03-27 14:13:50',4);
/*!40000 ALTER TABLE `bloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modificacion`
--

DROP TABLE IF EXISTS `modificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modificacion` (
  `id_mod` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_modificacion` datetime NOT NULL,
  `id_usr_mod` int(11) DEFAULT NULL,
  `id_nota_mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mod`),
  KEY `modificacion_FK` (`id_usr_mod`),
  KEY `modificacion_FK_1` (`id_nota_mod`),
  CONSTRAINT `modificacion_FK` FOREIGN KEY (`id_usr_mod`) REFERENCES `usuario` (`id_usr`),
  CONSTRAINT `modificacion_FK_1` FOREIGN KEY (`id_nota_mod`) REFERENCES `nota` (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modificacion`
--

LOCK TABLES `modificacion` WRITE;
/*!40000 ALTER TABLE `modificacion` DISABLE KEYS */;
INSERT INTO `modificacion` VALUES (1,'2020-03-05 12:00:46',2,1),(2,'2020-03-05 22:15:26',1,3),(3,'2020-03-02 15:22:02',1,4),(4,'2020-03-20 18:16:39',3,6),(5,'2020-03-22 09:05:45',4,7),(6,'2020-03-04 14:22:05',5,10),(7,'2020-03-06 11:06:11',3,3);
/*!40000 ALTER TABLE `modificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `texto` mediumtext DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `id_bloc_nota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `nota_FK` (`id_bloc_nota`),
  CONSTRAINT `nota_FK` FOREIGN KEY (`id_bloc_nota`) REFERENCES `bloc` (`id_bloc`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (1,'La profe de Bases de Datos es Elena Garcia','2020-03-02','2020-03-05 12:00:46',1),(2,'El profe de prog2 se llama Alfonso Castro','2020-03-03',NULL,1),(3,'El grupo INSO1A esta en el aula 204','2020-03-01','2020-03-05 22:15:26',5),(4,'El grupo INSO1B esta en el aula 203','2020-02-27','2020-03-02 15:22:02',5),(5,'Hay practicas de LabBBDD el finde del 27 de Marzo','2020-03-25',NULL,7),(6,'Practicas de prog dentro de dos dias','2020-03-18','2020-03-20 18:16:39',7),(7,'Practicas de Algebra se cancelaron, se le olvido a la profe','2020-03-19','2020-03-22 09:05:45',7),(8,'Me llamo Gonzalo Fdez ¿Alguien sabe mi grupo?','2020-03-10',NULL,8),(9,'¿Donde esta nuestra universidad?','2020-03-16',NULL,3),(10,'El grupo INSO1A tiene prog2,LabBBDD y Algebra','2020-03-01','2020-03-04 14:22:05',2);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `texto_tag` varchar(100) DEFAULT NULL,
  `id_usr_tag` int(11) DEFAULT NULL,
  `id_nota_tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_FK` (`id_usr_tag`),
  KEY `tag_FK_1` (`id_nota_tag`),
  CONSTRAINT `tag_FK` FOREIGN KEY (`id_usr_tag`) REFERENCES `usuario` (`id_usr`),
  CONSTRAINT `tag_FK_1` FOREIGN KEY (`id_nota_tag`) REFERENCES `nota` (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Faltan asignaturas',3,10),(2,'Es correcto',5,1),(3,'Es cierto',5,2),(4,'Sera la practica 1.1',6,5),(5,'Tu grupo es INSO1A, soy compi tuyo',2,8),(6,'La UTAD esta en las rozas, parque empresarial Europa',4,9),(7,'Menos mal, nadie la habia hecho',2,7),(8,'Hay que saber compilar programas en C',1,6),(9,'Se han movido a el aula 214',4,3),(10,'Estan en el aula 213',1,4);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usr` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `nombre_user` varchar(100) DEFAULT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usr`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'España','Madrid','2017-02-25','guacamole3','xXGerardoXx','Gerardo Martinez'),(2,'Francia','Paris','2018-04-22','lavilledelamur','Karim04','Karim Voltaire'),(3,'España','Barcelona','2019-05-02','arrozalacubana','marialafea','Maria Perez'),(4,'Alemania','Berlin','2019-06-20','franfurt001','otto0987','Abel Elies'),(5,'Polonia','Varsovia','2020-01-15','estrudelforgen77','AtomicGirl','Marie Curie'),(6,'Holanda','Amsterdam','2020-03-18','weedaweeda','SandwichChesse','Yani Manfred');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BD_bloc_de_notas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-29 15:28:10
