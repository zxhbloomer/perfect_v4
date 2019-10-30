-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: perfect-fs
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appkey` varchar(255) DEFAULT NULL,
  `available` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` VALUES (1,'password','1','test1','test1'),(2,'password','1','test2','test2'),(3,'password','1','test3','test3'),(4,'password','1','test4','test4');
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dailyreport`
--

DROP TABLE IF EXISTS `dailyreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dailyreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `curdate` varchar(255) DEFAULT NULL,
  `files` int(11) NOT NULL,
  `groups` int(11) NOT NULL,
  `spaces` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dailyreport`
--

LOCK TABLES `dailyreport` WRITE;
/*!40000 ALTER TABLE `dailyreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dailyreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diskfile`
--

DROP TABLE IF EXISTS `diskfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diskfile` (
  `fileid` varchar(255) NOT NULL,
  `appid` int(11) NOT NULL,
  `dfs_group_name` varchar(255) DEFAULT NULL,
  `download_num` int(11) NOT NULL,
  `download_pwd` varchar(255) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `extra3` varchar(255) DEFAULT NULL,
  `extra4` varchar(255) DEFAULT NULL,
  `extra5` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_flag` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` decimal(19,2) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `filesource` varchar(255) DEFAULT NULL,
  `form_id` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `ispublic` varchar(255) DEFAULT NULL,
  `upload_date` datetime DEFAULT NULL,
  `upload_user` varchar(255) DEFAULT NULL,
  `urlalioss` varchar(255) DEFAULT NULL,
  `urlbfs` varchar(255) DEFAULT NULL,
  `urlcfs` varchar(255) DEFAULT NULL,
  `urldisk` varchar(255) DEFAULT NULL,
  `urlfastdfs` varchar(255) DEFAULT NULL,
  `urlmongodb` varchar(255) DEFAULT NULL,
  `urlpaxossurlre` varchar(255) DEFAULT NULL,
  `urlqiniu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diskfile`
--

LOCK TABLES `diskfile` WRITE;
/*!40000 ALTER TABLE `diskfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `diskfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diskgroup`
--

DROP TABLE IF EXISTS `diskgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diskgroup` (
  `group_id` varchar(50) NOT NULL,
  `administrator` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `extra3` varchar(255) DEFAULT NULL,
  `extra4` varchar(255) DEFAULT NULL,
  `extra5` varchar(255) DEFAULT NULL,
  `father_group_id` varchar(255) DEFAULT NULL,
  `group_cn_name` varchar(255) DEFAULT NULL,
  `group_creator` varchar(255) DEFAULT NULL,
  `group_flag` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `group_type` varchar(255) DEFAULT NULL,
  `is_public` varchar(255) DEFAULT NULL,
  `max_num` int(11) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diskgroup`
--

LOCK TABLES `diskgroup` WRITE;
/*!40000 ALTER TABLE `diskgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `diskgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diskuser`
--

DROP TABLE IF EXISTS `diskuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diskuser` (
  `user_name` varchar(255) NOT NULL,
  `app_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `extra3` varchar(255) DEFAULT NULL,
  `extra4` varchar(255) DEFAULT NULL,
  `extra5` varchar(255) DEFAULT NULL,
  `first_date` datetime DEFAULT NULL,
  `is_admin` varchar(255) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `max_space` decimal(19,2) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `used_space` decimal(19,2) DEFAULT NULL,
  `user_cn_name` varchar(255) DEFAULT NULL,
  `user_flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diskuser`
--

LOCK TABLES `diskuser` WRITE;
/*!40000 ALTER TABLE `diskuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `diskuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupuser`
--

DROP TABLE IF EXISTS `groupuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupuser`
--

LOCK TABLES `groupuser` WRITE;
/*!40000 ALTER TABLE `groupuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id` bigint(20) NOT NULL,
  `extra1` varchar(255) DEFAULT NULL,
  `extra2` varchar(255) DEFAULT NULL,
  `extra3` varchar(255) DEFAULT NULL,
  `extra4` varchar(255) DEFAULT NULL,
  `extra5` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_file_repository`
--

DROP TABLE IF EXISTS `s_file_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_file_repository` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_uuid` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件的uuid',
  `file_name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件名',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `relative_path` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路径',
  `create_dt` datetime DEFAULT NULL COMMENT '生成日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_file_repository`
--

LOCK TABLES `s_file_repository` WRITE;
/*!40000 ALTER TABLE `s_file_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_file_repository` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-28 11:47:24
