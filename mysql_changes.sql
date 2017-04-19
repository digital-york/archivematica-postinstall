-- MySQL dump 10.13  Distrib 5.5.54-38.7, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: MCP
-- ------------------------------------------------------
-- Server version	5.5.54-38.7

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
-- Table structure for table `DashboardSettings`
--

DROP TABLE IF EXISTS `DashboardSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DashboardSettings` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lastModified` datetime NOT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DashboardSettings`
--

LOCK TABLES `DashboardSettings` WRITE;
/*!40000 ALTER TABLE `DashboardSettings` DISABLE KEYS */;
INSERT INTO `DashboardSettings` VALUES (1,'dip_upload_atom_url','http://localhost/atom','2016-12-13 14:39:06'),(2,'dip_upload_atom_email','demo@example.com','2016-12-13 14:39:06'),(3,'dip_upload_atom_password','demo','2016-12-13 14:39:06'),(4,'dip_upload_atom_version','2','2016-12-13 14:39:06'),(5,'checksum_type','sha256','2016-12-13 14:39:09'),(6,'dashboard_uuid','1e27fbce-b648-413e-a980-1863725b1eba','2016-12-13 14:57:45'),(7,'storage_service_apikey','c33478205b1f8d4ccc1024259488a748317636d7','2016-12-13 15:07:52'),(8,'storage_service_url','http://127.0.0.1:8000','2016-12-13 15:07:52'),(9,'storage_service_user','ss_robot','2016-12-13 15:07:52'),(10,'dashboard_administration_dspace_enabled','True','2016-12-16 12:46:12'),(11,'dashboard_administration_atom_dip_enabled','True','2016-12-16 12:46:12'),(12,'api_whitelist','127.0.0.1 192.168.10.11 192.168.10.10 10.0.2.2 localhost','2016-12-13 15:12:11');
/*!40000 ALTER TABLE `DashboardSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$Q5W0ioBkedz7$8BTysBqBd1mbB6SfSY7iHawGLOsXsVujFFtpwYwzsyE=','2017-04-06 13:48:39',1,'ferg','Fergus','McGlynn','fergus.a.mcglynn@york.ac.uk',1,1,'2016-12-13 14:57:45'),(2,'pbkdf2_sha256$20000$6B9gZ0YvX3Cc$VJzG0v5+wmZ6Caz0AqLiSOsqiUesKxo3BaBNGstJHDA=','2017-04-06 13:13:08',1,'am_robot','Archivematica','Robot','fergus.a.mcglynn@york.ac.uk',1,1,'2016-12-13 15:10:59');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastypie_apikey`
--

DROP TABLE IF EXISTS `tastypie_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_3c6e0b8a` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_ffeb4840e0b406b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastypie_apikey`
--

LOCK TABLES `tastypie_apikey` WRITE;
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
INSERT INTO `tastypie_apikey` VALUES (1,'ca5801b1f881c015da7f2aa55815dbf3fa28bad7','2016-12-13 14:57:45',1),(2,'b873788e67fd691ddc571fd74dc0d58b897a3d23','2016-12-13 15:10:59',2);
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Agents`
--

DROP TABLE IF EXISTS `Agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Agents` (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `agentIdentifierType` longtext COLLATE utf8_unicode_ci,
  `agentIdentifierValue` longtext COLLATE utf8_unicode_ci,
  `agentName` longtext COLLATE utf8_unicode_ci,
  `agentType` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Agents`
--

LOCK TABLES `Agents` WRITE;
/*!40000 ALTER TABLE `Agents` DISABLE KEYS */;
INSERT INTO `Agents` VALUES (1,'preservation system','Archivematica-1.6.0','Archivematica','software'),(2,'repository code','ORG','Your Organization Name Here','organization'),(3,'Archivematica user pk','1','username=\"ferg\", first_name=\"Fergus\", last_name=\"McGlynn\"','Archivematica user'),(4,'Archivematica user pk','2','username=\"am_robot\", first_name=\"Archivematica\", last_name=\"Robot\"','Archivematica user');
/*!40000 ALTER TABLE `Agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_userprofile`
--

DROP TABLE IF EXISTS `main_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_id` (`agent_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `main_userprofile_agent_id_7ff4bb0b0eda6716_fk_Agents_pk` FOREIGN KEY (`agent_id`) REFERENCES `Agents` (`pk`),
  CONSTRAINT `main_userprofile_user_id_75cd56861240b8f7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_userprofile`
--

LOCK TABLES `main_userprofile` WRITE;
/*!40000 ALTER TABLE `main_userprofile` DISABLE KEYS */;
INSERT INTO `main_userprofile` VALUES (1,3,1),(2,4,2);
/*!40000 ALTER TABLE `main_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-06 15:11:16
