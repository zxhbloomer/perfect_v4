-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: business
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `m_address`
--

DROP TABLE IF EXISTS `m_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮编',
  `link_man` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '默认',
  `tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标签',
  `province_code` int(11) DEFAULT NULL COMMENT '省',
  `city_code` int(11) DEFAULT NULL COMMENT '市',
  `area_code` int(11) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `serial_id` bigint(20) DEFAULT NULL COMMENT '关联单号',
  `serial_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联单号类型',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_m_address_1` (`serial_id`,`serial_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='地址簿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_address`
--

LOCK TABLES `m_address` WRITE;
/*!40000 ALTER TABLE `m_address` DISABLE KEYS */;
INSERT INTO `m_address` VALUES (2,'123456','刘德华','021-123456',0,'0',31,3101,310117,'上海市 市辖区 松江区西路',NULL,NULL,0,1,25,'2019-11-07 08:38:33',25,'2019-11-07 08:38:33',0);
/*!40000 ALTER TABLE `m_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_company`
--

DROP TABLE IF EXISTS `m_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '社会信用代码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业全称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '企业简称',
  `address_id` bigint(20) DEFAULT NULL COMMENT '地址簿id',
  `juridical_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '法定代表人',
  `register_capital` decimal(20,4) DEFAULT NULL COMMENT '注册资本',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '=0,内资=1,国有全资=2,集体全资=3,股份合作=4,联营=5,国有联营=6,集体联营=7,国有与集体联营=8,其它联营=9,有限责任（公司）=10,国有独资（公司）=11,其它有限责任（公司）=12,股份有限（公司）=13,私有=14,私有独资=15,私有合伙=16,私营有限责任（公司）=17,个体经营=18,私营股份有限（公司）=19,其它私有=20,其它内资=21,内地与港、澳、台合作=22,内地与港、澳、台合资=23,港、澳、台投资=24,港、澳、台独资=25,港、澳、台投资股份有限（公司）=26,其他港、澳、台投资=27,外资=28,国外投资股份有限（公司）=29,其他国外投资=30,其他=31',
  `setup_date` date DEFAULT NULL COMMENT '成立日期',
  `end_date` date DEFAULT NULL COMMENT '营业有效期',
  `long_term` tinyint(1) DEFAULT NULL COMMENT '营业执照 长期flg',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='公司主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_company`
--

LOCK TABLES `m_company` WRITE;
/*!40000 ALTER TABLE `m_company` DISABLE KEYS */;
INSERT INTO `m_company` VALUES (1,'1','测试企业1','测试企业1',NULL,'1',1.0000,'3','2019-11-05','2019-11-27',0,'121',0,1,25,'2019-11-07 15:54:02',25,'2020-04-17 16:15:10',4),(2,'123','测试企业0','测试企业0',2,'测试企业0',0.0000,'1','2018-11-01','9999-01-01',0,'112',0,1,25,'2019-11-08 11:36:29',28,'2020-04-17 16:15:54',16),(3,'2','测试企业2','测试企业2',NULL,'2',3.0000,'3','2019-11-05','2019-11-27',0,'',0,1,25,'2019-12-02 16:33:08',25,'2020-04-17 09:35:56',3),(4,'123','测试企业0','测试企业0',2,'测试企业0',0.0000,'1','2018-11-01','9999-01-01',0,'1',1,1,25,'2019-12-26 09:44:02',25,'2019-12-26 09:44:02',1);
/*!40000 ALTER TABLE `m_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_dept`
--

DROP TABLE IF EXISTS `m_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '全称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简称',
  `handler_id` bigint(20) DEFAULT NULL COMMENT '部门主管',
  `sub_handler_id` bigint(20) DEFAULT NULL COMMENT '部门副主管',
  `leader_id` bigint(20) DEFAULT NULL COMMENT '上级主管领导',
  `response_leader_id` bigint(20) DEFAULT NULL COMMENT '上级分管领导',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='部门主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_dept`
--

LOCK TABLES `m_dept` WRITE;
/*!40000 ALTER TABLE `m_dept` DISABLE KEYS */;
INSERT INTO `m_dept` VALUES (1,'xx1','某部门','某部门22',NULL,NULL,NULL,NULL,'',0,1,29,'2019-11-25 11:07:20',29,'2019-11-25 11:07:20',9),(2,'DPT20191218AH002','xx','xx',NULL,NULL,NULL,NULL,'',0,1,29,'2019-12-18 14:41:07',29,'2019-12-18 14:41:07',0);
/*!40000 ALTER TABLE `m_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_group`
--

DROP TABLE IF EXISTS `m_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '集团编码',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '集团名称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='集团主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_group`
--

LOCK TABLES `m_group` WRITE;
/*!40000 ALTER TABLE `m_group` DISABLE KEYS */;
INSERT INTO `m_group` VALUES (4,'1','221','1','',0,1,25,'2019-10-30 14:14:51',28,'2020-04-17 17:00:50',8),(5,'2','1','2','',0,1,25,'2019-10-30 14:17:08',25,'2019-10-30 14:32:59',1),(6,'zjjt01','中建集团111a','中建集团','',0,1,25,'2019-11-18 10:07:45',25,'2019-11-18 10:07:45',3),(7,'zjjt01-01','中建子集团','中建子集团','',0,1,25,'2019-12-02 14:17:19',25,'2019-12-02 14:17:19',2),(8,'zjjt01-02','中建子集团aaxx','中建子集团aa','',0,1,25,'2019-12-02 16:49:24',25,'2019-12-02 16:49:24',12),(9,'GP20191218HK002','xx','xx','',0,1,25,'2019-12-18 14:09:35',25,'2019-12-18 14:09:35',2),(10,'GP20191218SO003','xx1','xx1','22',0,1,25,'2019-12-18 14:10:29',25,'2019-12-18 14:10:29',7),(11,'GP20200102OR001','cx','xxx','1',0,1,25,'2020-01-02 16:44:33',25,'2020-01-02 16:44:33',0),(19,'GP20200102OZ001','x1','x1','11',0,1,25,'2020-01-02 17:03:52',25,'2020-01-02 17:03:52',1),(20,'GP20200102FR001','x2','x2','',0,1,25,'2020-01-02 17:07:24',25,'2020-01-02 17:07:24',0),(21,'GP20200102WL001','x3','x3','',1,1,25,'2020-01-02 17:08:32',25,'2020-01-02 17:08:32',1),(22,'GP20200102DQ001','x4','x4','',1,1,25,'2020-01-02 17:10:09',25,'2020-01-02 17:10:09',9),(23,'GP20200107OW001','x4','x4','',0,1,25,'2020-01-07 14:37:44',25,'2020-01-07 14:37:44',0),(24,'GP20200107BN001','x5','x5','',0,1,25,'2020-01-07 14:37:54',25,'2020-01-07 14:37:54',0),(25,'GP20200107PS001','x6','x6','',0,1,25,'2020-01-07 14:38:02',25,'2020-01-07 14:38:02',0),(26,'GP20200107VO001','x7','x7','',0,1,25,'2020-01-07 15:47:34',25,'2020-01-07 15:47:34',0),(27,'GP20200107AP001','x82','x8','',0,1,25,'2020-01-07 16:01:34',28,'2020-04-17 17:00:56',1),(28,'GP20200107CD002','x9','x9','1',0,1,25,'2020-01-07 16:02:21',28,'2020-04-17 16:24:13',1);
/*!40000 ALTER TABLE `m_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_org`
--

DROP TABLE IF EXISTS `m_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级组织，null为根节点',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id，根节点',
  `serial_id` bigint(20) DEFAULT NULL COMMENT '关联单号',
  `serial_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联单号类型',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型：10（租户）、20（集团）、30（公司）、40（部门）、50（岗位）、60（人员）',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编号，00010001..',
  `son_count` int(3) DEFAULT NULL COMMENT '儿子个数',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_m_org_1` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_org`
--

LOCK TABLES `m_org` WRITE;
/*!40000 ALTER TABLE `m_org` DISABLE KEYS */;
INSERT INTO `m_org` VALUES (1,NULL,1,1,'s_tenant','10','0001',3,29,'2019-11-18 11:27:17',29,'2020-01-13 16:09:03',17),(23,1,1,6,'m_group','20','00010002',1,29,'2019-12-02 14:24:51',29,'2020-01-13 16:09:03',2),(24,1,1,8,'m_group','20','00010003',1,29,'2019-12-02 14:24:59',29,'2020-01-13 16:09:03',4),(26,23,1,1,'m_dept','40','000100020001',1,29,'2019-12-03 11:17:12',29,'2020-01-13 16:09:03',6),(27,1,1,2,'m_company','30','00010001',0,29,'2019-12-17 16:11:47',29,'2020-01-13 16:09:03',0),(28,24,1,5,'m_position','50','000100030001',0,29,'2019-12-19 09:05:01',29,'2020-01-13 16:09:03',0),(29,26,1,4,'m_position','50','0001000200010001',0,29,'2019-12-19 09:05:28',29,'2020-01-13 16:09:03',0);
/*!40000 ALTER TABLE `m_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_position`
--

DROP TABLE IF EXISTS `m_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '全称',
  `simple_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='岗位主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_position`
--

LOCK TABLES `m_position` WRITE;
/*!40000 ALTER TABLE `m_position` DISABLE KEYS */;
INSERT INTO `m_position` VALUES (4,'DEPT20191218IS001','x','x1','',0,1,29,'2019-12-18 14:56:57',29,'2019-12-18 14:56:57',1),(5,'DEPT20191219VG002','监事','监事','',0,1,29,'2019-12-19 08:55:41',29,'2019-12-19 08:55:41',0);
/*!40000 ALTER TABLE `m_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_staff`
--

DROP TABLE IF EXISTS `m_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `name_py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '全称拼音',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简称',
  `simple_name_py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '简称拼音',
  `sex` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '男=1,女=2',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱地址',
  `state` tinyint(1) DEFAULT NULL COMMENT '审核状态:未审核=0,已审核=1',
  `home_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家庭电话',
  `office_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '办公室电话',
  `mobile_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
  `mobile_phone_backup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备用手机号码',
  `email_backup` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备用电子邮件',
  `id_card` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号码',
  `passport` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '护照号码',
  `service` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否在职：在职=1,不在职=0,离职=2,离退休=3,返聘=4',
  `is_wed` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '婚否',
  `nation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名族',
  `degree` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学历',
  `user_id` bigint(20) DEFAULT NULL COMMENT '登陆用户id，关联id',
  `company_id` bigint(20) DEFAULT NULL COMMENT '所属公司',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '默认部门',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='员工信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_staff`
--

LOCK TABLES `m_staff` WRITE;
/*!40000 ALTER TABLE `m_staff` DISABLE KEYS */;
INSERT INTO `m_staff` VALUES (22,'负责人',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,24,NULL,NULL,0,1,1,'2019-11-12 11:19:48',1,'2019-11-12 11:19:48',1),(23,'副负责人',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,25,NULL,NULL,0,1,1,'2019-11-12 11:21:20',1,'2019-11-12 11:21:20',1),(24,'领导',NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,33,2,1,0,1,1,'2019-11-12 11:22:34',29,'2020-03-16 13:23:08',5),(25,'刘德华',NULL,NULL,NULL,'1',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','啊',NULL,29,2,NULL,0,1,1,'2019-11-12 11:22:34',29,'2020-03-24 15:17:44',15),(26,'领导1想',NULL,NULL,NULL,'1',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,34,2,NULL,0,1,29,'2019-11-12 11:22:34',29,'2020-03-16 14:01:11',4),(28,'123',NULL,'123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,'2019-12-16 14:25:08',NULL,'2019-12-16 14:25:08',1);
/*!40000 ALTER TABLE `m_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_staff_org`
--

DROP TABLE IF EXISTS `m_staff_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_staff_org` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) DEFAULT NULL COMMENT '员工主表id',
  `serial_id` bigint(20) DEFAULT NULL COMMENT '关联单号',
  `serial_type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联单号类型',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户组织机构关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_staff_org`
--

LOCK TABLES `m_staff_org` WRITE;
/*!40000 ALTER TABLE `m_staff_org` DISABLE KEYS */;
INSERT INTO `m_staff_org` VALUES (91,25,5,'m_position',1,29,'2020-03-05 16:52:18',29,'2020-03-05 16:52:18',0),(94,25,4,'m_position',1,29,'2020-03-25 16:53:56',29,'2020-03-25 16:53:56',0),(95,26,4,'m_position',1,29,'2020-03-25 16:56:05',29,'2020-03-25 16:56:05',0),(96,22,4,'m_position',1,29,'2020-03-25 17:02:31',29,'2020-03-25 17:02:31',0);
/*!40000 ALTER TABLE `m_staff_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user`
--

DROP TABLE IF EXISTS `m_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录模式：（10：手机号码；20：邮箱）',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登陆用户名',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '自我介绍',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码\n',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否是已经删除\n',
  `is_lock` tinyint(1) DEFAULT NULL COMMENT '是否锁定\n',
  `is_enable` tinyint(1) DEFAULT NULL COMMENT '是否禁用\n',
  `effective_date` datetime DEFAULT NULL COMMENT '生效时间\n',
  `invalidation_date` datetime DEFAULT NULL COMMENT '失效时间\n',
  `err_count` int(11) DEFAULT NULL COMMENT '登录错误次数\n',
  `group_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属用户组\n用户组织范围\n包含下级组织的组织范围\n',
  `staff_id` bigint(20) DEFAULT NULL,
  `locked_time` datetime DEFAULT NULL COMMENT '用户锁定时间',
  `is_biz_admin` tinyint(1) DEFAULT NULL COMMENT '是否为业务管理员',
  `is_changed_pwd` tinyint(1) DEFAULT NULL COMMENT '是否修改过密码',
  `login_author_way` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '传统认证方式=0,智能钥匙认证=1,动态密码锁=2,指纹认证方式=3',
  `pwd_his_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '历史密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像路径',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_name_UNIQUE` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user`
--

LOCK TABLES `m_user` WRITE;
/*!40000 ALTER TABLE `m_user` DISABLE KEYS */;
INSERT INTO `m_user` VALUES (1,NULL,'zxh1',NULL,NULL,'$2a$10$x66JhJCybrBiq..3Q1mfcerbPCI1064U0H20ziP0mHrwqIj15hX7e',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,0),(24,NULL,NULL,NULL,NULL,'',0,0,0,NULL,NULL,NULL,NULL,22,NULL,0,0,NULL,NULL,NULL,NULL,1,1,'2019-11-12 11:19:48',1,'2019-11-12 11:19:48',1),(25,NULL,NULL,NULL,NULL,'',0,0,0,NULL,NULL,NULL,NULL,23,NULL,0,0,NULL,NULL,NULL,NULL,1,1,'2019-11-12 11:21:20',1,'2019-11-12 11:21:20',1),(26,NULL,NULL,NULL,NULL,'',0,0,0,NULL,NULL,NULL,NULL,26,NULL,0,0,'0',NULL,NULL,NULL,1,1,'2019-11-12 11:22:34',29,'2020-03-10 15:39:16',4),(29,NULL,'zxh',NULL,NULL,'$2a$10$Jzk3mcGW.K36f65cnn9oWOfJhBiJFnmb.k5IkQGkwE4YGf2p60OYK',0,0,1,NULL,NULL,NULL,NULL,25,NULL,0,0,'0',NULL,NULL,NULL,1,1,'2019-11-14 16:55:00',29,'2020-03-24 15:17:44',8),(31,'10','13611806866','60',NULL,'$2a$10$gaatWx6cHePBO3Gxrxt2PuRl9G5f6px09Fe9F8Ce773VL2rLH8ldW',0,NULL,0,NULL,NULL,NULL,NULL,28,NULL,1,NULL,'0',NULL,NULL,NULL,1,NULL,'2019-12-16 14:25:08',NULL,'2019-12-16 14:25:08',0),(32,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,29,'2020-03-16 10:21:54',29,'2020-03-16 10:21:54',0),(33,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,29,'2020-03-16 13:23:08',29,'2020-03-16 13:23:08',0),(34,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,29,'2020-03-16 14:01:11',29,'2020-03-16 14:01:11',0),(35,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,29,'2020-03-24 09:29:06',29,'2020-03-24 09:29:06',0),(36,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,29,'2020-03-24 09:29:52',29,'2020-03-24 09:29:52',0),(37,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,29,'2020-03-24 09:38:23',29,'2020-03-24 09:38:23',0);
/*!40000 ALTER TABLE `m_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user_back`
--

DROP TABLE IF EXISTS `m_user_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user_back` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `login_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户实名',
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码\n',
  `isdel` tinyint(1) DEFAULT NULL COMMENT '是否是已经删除\n',
  `islock` tinyint(1) DEFAULT NULL COMMENT '是否锁定\n',
  `isenable` tinyint(1) DEFAULT NULL COMMENT '是否禁用\n',
  `effective_date` datetime DEFAULT NULL COMMENT '生效时间\n',
  `invalidation_date` datetime DEFAULT NULL COMMENT '失效时间\n',
  `err_count` int(11) DEFAULT NULL COMMENT '登录错误次数\n',
  `group_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '所属用户组\n用户组织范围\n包含下级组织的组织范围\n',
  `staff_id` bigint(20) DEFAULT NULL,
  `pwd_effective_date` datetime DEFAULT NULL COMMENT '密码生效日期\n',
  `locked_time` datetime DEFAULT NULL COMMENT '用户锁定时间',
  `is_biz_admin` tinyint(1) DEFAULT NULL COMMENT '是否为业务管理员',
  `is_changed_pwd` tinyint(1) DEFAULT NULL COMMENT '是否修改过密码',
  `login_author_way` tinyint(1) DEFAULT NULL COMMENT '传统认证方式=0,智能钥匙认证=1,动态密码锁=2,指纹认证方式=3',
  `pwd_his_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '历史密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `home_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '家庭电话',
  `office_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '办公室电话',
  `cell_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户名称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像路径',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user_back`
--

LOCK TABLES `m_user_back` WRITE;
/*!40000 ALTER TABLE `m_user_back` DISABLE KEYS */;
INSERT INTO `m_user_back` VALUES (1,'zxh',NULL,NULL,NULL,NULL,'$2a$10$x66JhJCybrBiq..3Q1mfcerbPCI1064U0H20ziP0mHrwqIj15hX7e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `m_user_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_user_lite`
--

DROP TABLE IF EXISTS `m_user_lite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_user_lite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码\n',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_name_UNIQUE` (`login_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表 简单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_user_lite`
--

LOCK TABLES `m_user_lite` WRITE;
/*!40000 ALTER TABLE `m_user_lite` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_user_lite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('PerfectScheduler','STATE_ACCESS'),('PerfectScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('PerfectScheduler','DESKTOP-FK3BIJC1572246839909',1572253626967,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_area_cities`
--

DROP TABLE IF EXISTS `s_area_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_area_cities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '市级编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市名称',
  `province_code` int(11) DEFAULT NULL COMMENT '省级编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_s_cities_1` (`code`) USING BTREE,
  KEY `idx_s_cities_2` (`province_code`) USING BTREE,
  KEY `idx_s_cities_3` (`code`,`province_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='市';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_area_cities`
--

LOCK TABLES `s_area_cities` WRITE;
/*!40000 ALTER TABLE `s_area_cities` DISABLE KEYS */;
INSERT INTO `s_area_cities` VALUES (1,1101,'市辖区',11),(2,1201,'市辖区',12),(3,1301,'石家庄市',13),(4,1302,'唐山市',13),(5,1303,'秦皇岛市',13),(6,1304,'邯郸市',13),(7,1305,'邢台市',13),(8,1306,'保定市',13),(9,1307,'张家口市',13),(10,1308,'承德市',13),(11,1309,'沧州市',13),(12,1310,'廊坊市',13),(13,1311,'衡水市',13),(14,1401,'太原市',14),(15,1402,'大同市',14),(16,1403,'阳泉市',14),(17,1404,'长治市',14),(18,1405,'晋城市',14),(19,1406,'朔州市',14),(20,1407,'晋中市',14),(21,1408,'运城市',14),(22,1409,'忻州市',14),(23,1410,'临汾市',14),(24,1411,'吕梁市',14),(25,1501,'呼和浩特市',15),(26,1502,'包头市',15),(27,1503,'乌海市',15),(28,1504,'赤峰市',15),(29,1505,'通辽市',15),(30,1506,'鄂尔多斯市',15),(31,1507,'呼伦贝尔市',15),(32,1508,'巴彦淖尔市',15),(33,1509,'乌兰察布市',15),(34,1522,'兴安盟',15),(35,1525,'锡林郭勒盟',15),(36,1529,'阿拉善盟',15),(37,2101,'沈阳市',21),(38,2102,'大连市',21),(39,2103,'鞍山市',21),(40,2104,'抚顺市',21),(41,2105,'本溪市',21),(42,2106,'丹东市',21),(43,2107,'锦州市',21),(44,2108,'营口市',21),(45,2109,'阜新市',21),(46,2110,'辽阳市',21),(47,2111,'盘锦市',21),(48,2112,'铁岭市',21),(49,2113,'朝阳市',21),(50,2114,'葫芦岛市',21),(51,2201,'长春市',22),(52,2202,'吉林市',22),(53,2203,'四平市',22),(54,2204,'辽源市',22),(55,2205,'通化市',22),(56,2206,'白山市',22),(57,2207,'松原市',22),(58,2208,'白城市',22),(59,2224,'延边朝鲜族自治州',22),(60,2301,'哈尔滨市',23),(61,2302,'齐齐哈尔市',23),(62,2303,'鸡西市',23),(63,2304,'鹤岗市',23),(64,2305,'双鸭山市',23),(65,2306,'大庆市',23),(66,2307,'伊春市',23),(67,2308,'佳木斯市',23),(68,2309,'七台河市',23),(69,2310,'牡丹江市',23),(70,2311,'黑河市',23),(71,2312,'绥化市',23),(72,2327,'大兴安岭地区',23),(73,3101,'市辖区',31),(74,3201,'南京市',32),(75,3202,'无锡市',32),(76,3203,'徐州市',32),(77,3204,'常州市',32),(78,3205,'苏州市',32),(79,3206,'南通市',32),(80,3207,'连云港市',32),(81,3208,'淮安市',32),(82,3209,'盐城市',32),(83,3210,'扬州市',32),(84,3211,'镇江市',32),(85,3212,'泰州市',32),(86,3213,'宿迁市',32),(87,3301,'杭州市',33),(88,3302,'宁波市',33),(89,3303,'温州市',33),(90,3304,'嘉兴市',33),(91,3305,'湖州市',33),(92,3306,'绍兴市',33),(93,3307,'金华市',33),(94,3308,'衢州市',33),(95,3309,'舟山市',33),(96,3310,'台州市',33),(97,3311,'丽水市',33),(98,3401,'合肥市',34),(99,3402,'芜湖市',34),(100,3403,'蚌埠市',34),(101,3404,'淮南市',34),(102,3405,'马鞍山市',34),(103,3406,'淮北市',34),(104,3407,'铜陵市',34),(105,3408,'安庆市',34),(106,3410,'黄山市',34),(107,3411,'滁州市',34),(108,3412,'阜阳市',34),(109,3413,'宿州市',34),(110,3415,'六安市',34),(111,3416,'亳州市',34),(112,3417,'池州市',34),(113,3418,'宣城市',34),(114,3501,'福州市',35),(115,3502,'厦门市',35),(116,3503,'莆田市',35),(117,3504,'三明市',35),(118,3505,'泉州市',35),(119,3506,'漳州市',35),(120,3507,'南平市',35),(121,3508,'龙岩市',35),(122,3509,'宁德市',35),(123,3601,'南昌市',36),(124,3602,'景德镇市',36),(125,3603,'萍乡市',36),(126,3604,'九江市',36),(127,3605,'新余市',36),(128,3606,'鹰潭市',36),(129,3607,'赣州市',36),(130,3608,'吉安市',36),(131,3609,'宜春市',36),(132,3610,'抚州市',36),(133,3611,'上饶市',36),(134,3701,'济南市',37),(135,3702,'青岛市',37),(136,3703,'淄博市',37),(137,3704,'枣庄市',37),(138,3705,'东营市',37),(139,3706,'烟台市',37),(140,3707,'潍坊市',37),(141,3708,'济宁市',37),(142,3709,'泰安市',37),(143,3710,'威海市',37),(144,3711,'日照市',37),(145,3712,'莱芜市',37),(146,3713,'临沂市',37),(147,3714,'德州市',37),(148,3715,'聊城市',37),(149,3716,'滨州市',37),(150,3717,'菏泽市',37),(151,4101,'郑州市',41),(152,4102,'开封市',41),(153,4103,'洛阳市',41),(154,4104,'平顶山市',41),(155,4105,'安阳市',41),(156,4106,'鹤壁市',41),(157,4107,'新乡市',41),(158,4108,'焦作市',41),(159,4109,'濮阳市',41),(160,4110,'许昌市',41),(161,4111,'漯河市',41),(162,4112,'三门峡市',41),(163,4113,'南阳市',41),(164,4114,'商丘市',41),(165,4115,'信阳市',41),(166,4116,'周口市',41),(167,4117,'驻马店市',41),(168,4190,'省直辖县级行政区划',41),(169,4201,'武汉市',42),(170,4202,'黄石市',42),(171,4203,'十堰市',42),(172,4205,'宜昌市',42),(173,4206,'襄阳市',42),(174,4207,'鄂州市',42),(175,4208,'荆门市',42),(176,4209,'孝感市',42),(177,4210,'荆州市',42),(178,4211,'黄冈市',42),(179,4212,'咸宁市',42),(180,4213,'随州市',42),(181,4228,'恩施土家族苗族自治州',42),(182,4290,'省直辖县级行政区划',42),(183,4301,'长沙市',43),(184,4302,'株洲市',43),(185,4303,'湘潭市',43),(186,4304,'衡阳市',43),(187,4305,'邵阳市',43),(188,4306,'岳阳市',43),(189,4307,'常德市',43),(190,4308,'张家界市',43),(191,4309,'益阳市',43),(192,4310,'郴州市',43),(193,4311,'永州市',43),(194,4312,'怀化市',43),(195,4313,'娄底市',43),(196,4331,'湘西土家族苗族自治州',43),(197,4401,'广州市',44),(198,4402,'韶关市',44),(199,4403,'深圳市',44),(200,4404,'珠海市',44),(201,4405,'汕头市',44),(202,4406,'佛山市',44),(203,4407,'江门市',44),(204,4408,'湛江市',44),(205,4409,'茂名市',44),(206,4412,'肇庆市',44),(207,4413,'惠州市',44),(208,4414,'梅州市',44),(209,4415,'汕尾市',44),(210,4416,'河源市',44),(211,4417,'阳江市',44),(212,4418,'清远市',44),(213,4419,'东莞市',44),(214,4420,'中山市',44),(215,4451,'潮州市',44),(216,4452,'揭阳市',44),(217,4453,'云浮市',44),(218,4501,'南宁市',45),(219,4502,'柳州市',45),(220,4503,'桂林市',45),(221,4504,'梧州市',45),(222,4505,'北海市',45),(223,4506,'防城港市',45),(224,4507,'钦州市',45),(225,4508,'贵港市',45),(226,4509,'玉林市',45),(227,4510,'百色市',45),(228,4511,'贺州市',45),(229,4512,'河池市',45),(230,4513,'来宾市',45),(231,4514,'崇左市',45),(232,4601,'海口市',46),(233,4602,'三亚市',46),(234,4603,'三沙市',46),(235,4604,'儋州市',46),(236,4690,'省直辖县级行政区划',46),(237,5001,'市辖区',50),(238,5002,'县',50),(239,5101,'成都市',51),(240,5103,'自贡市',51),(241,5104,'攀枝花市',51),(242,5105,'泸州市',51),(243,5106,'德阳市',51),(244,5107,'绵阳市',51),(245,5108,'广元市',51),(246,5109,'遂宁市',51),(247,5110,'内江市',51),(248,5111,'乐山市',51),(249,5113,'南充市',51),(250,5114,'眉山市',51),(251,5115,'宜宾市',51),(252,5116,'广安市',51),(253,5117,'达州市',51),(254,5118,'雅安市',51),(255,5119,'巴中市',51),(256,5120,'资阳市',51),(257,5132,'阿坝藏族羌族自治州',51),(258,5133,'甘孜藏族自治州',51),(259,5134,'凉山彝族自治州',51),(260,5201,'贵阳市',52),(261,5202,'六盘水市',52),(262,5203,'遵义市',52),(263,5204,'安顺市',52),(264,5205,'毕节市',52),(265,5206,'铜仁市',52),(266,5223,'黔西南布依族苗族自治州',52),(267,5226,'黔东南苗族侗族自治州',52),(268,5227,'黔南布依族苗族自治州',52),(269,5301,'昆明市',53),(270,5303,'曲靖市',53),(271,5304,'玉溪市',53),(272,5305,'保山市',53),(273,5306,'昭通市',53),(274,5307,'丽江市',53),(275,5308,'普洱市',53),(276,5309,'临沧市',53),(277,5323,'楚雄彝族自治州',53),(278,5325,'红河哈尼族彝族自治州',53),(279,5326,'文山壮族苗族自治州',53),(280,5328,'西双版纳傣族自治州',53),(281,5329,'大理白族自治州',53),(282,5331,'德宏傣族景颇族自治州',53),(283,5333,'怒江傈僳族自治州',53),(284,5334,'迪庆藏族自治州',53),(285,5401,'拉萨市',54),(286,5402,'日喀则市',54),(287,5403,'昌都市',54),(288,5404,'林芝市',54),(289,5405,'山南市',54),(290,5406,'那曲市',54),(291,5425,'阿里地区',54),(292,6101,'西安市',61),(293,6102,'铜川市',61),(294,6103,'宝鸡市',61),(295,6104,'咸阳市',61),(296,6105,'渭南市',61),(297,6106,'延安市',61),(298,6107,'汉中市',61),(299,6108,'榆林市',61),(300,6109,'安康市',61),(301,6110,'商洛市',61),(302,6201,'兰州市',62),(303,6202,'嘉峪关市',62),(304,6203,'金昌市',62),(305,6204,'白银市',62),(306,6205,'天水市',62),(307,6206,'武威市',62),(308,6207,'张掖市',62),(309,6208,'平凉市',62),(310,6209,'酒泉市',62),(311,6210,'庆阳市',62),(312,6211,'定西市',62),(313,6212,'陇南市',62),(314,6229,'临夏回族自治州',62),(315,6230,'甘南藏族自治州',62),(316,6301,'西宁市',63),(317,6302,'海东市',63),(318,6322,'海北藏族自治州',63),(319,6323,'黄南藏族自治州',63),(320,6325,'海南藏族自治州',63),(321,6326,'果洛藏族自治州',63),(322,6327,'玉树藏族自治州',63),(323,6328,'海西蒙古族藏族自治州',63),(324,6401,'银川市',64),(325,6402,'石嘴山市',64),(326,6403,'吴忠市',64),(327,6404,'固原市',64),(328,6405,'中卫市',64),(329,6501,'乌鲁木齐市',65),(330,6502,'克拉玛依市',65),(331,6504,'吐鲁番市',65),(332,6505,'哈密市',65),(333,6523,'昌吉回族自治州',65),(334,6527,'博尔塔拉蒙古自治州',65),(335,6528,'巴音郭楞蒙古自治州',65),(336,6529,'阿克苏地区',65),(337,6530,'克孜勒苏柯尔克孜自治州',65),(338,6531,'喀什地区',65),(339,6532,'和田地区',65),(340,6540,'伊犁哈萨克自治州',65),(341,6542,'塔城地区',65),(342,6543,'阿勒泰地区',65),(343,6590,'自治区直辖县级行政区划',65);
/*!40000 ALTER TABLE `s_area_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_area_provinces`
--

DROP TABLE IF EXISTS `s_area_provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_area_provinces` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '省份编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省份名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_s_provinces_1` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='省份';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_area_provinces`
--

LOCK TABLES `s_area_provinces` WRITE;
/*!40000 ALTER TABLE `s_area_provinces` DISABLE KEYS */;
INSERT INTO `s_area_provinces` VALUES (1,11,'北京市'),(2,12,'天津市'),(3,13,'河北省'),(4,14,'山西省'),(5,15,'内蒙古自治区'),(6,21,'辽宁省'),(7,22,'吉林省'),(8,23,'黑龙江省'),(9,31,'上海市'),(10,32,'江苏省'),(11,33,'浙江省'),(12,34,'安徽省'),(13,35,'福建省'),(14,36,'江西省'),(15,37,'山东省'),(16,41,'河南省'),(17,42,'湖北省'),(18,43,'湖南省'),(19,44,'广东省'),(20,45,'广西壮族自治区'),(21,46,'海南省'),(22,50,'重庆市'),(23,51,'四川省'),(24,52,'贵州省'),(25,53,'云南省'),(26,54,'西藏自治区'),(27,61,'陕西省'),(28,62,'甘肃省'),(29,63,'青海省'),(30,64,'宁夏回族自治区'),(31,65,'新疆维吾尔自治区');
/*!40000 ALTER TABLE `s_area_provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_areas`
--

DROP TABLE IF EXISTS `s_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_areas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '区编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地区名称',
  `city_code` int(11) DEFAULT NULL COMMENT '市级编号',
  `province_code` int(11) DEFAULT NULL COMMENT '省级编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_s_areas_1` (`code`) USING BTREE,
  KEY `idx_s_areas_2` (`city_code`) USING BTREE,
  KEY `idx_s_areas_3` (`province_code`) USING BTREE,
  KEY `idx_s_areas_4` (`city_code`,`province_code`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_areas`
--

LOCK TABLES `s_areas` WRITE;
/*!40000 ALTER TABLE `s_areas` DISABLE KEYS */;
INSERT INTO `s_areas` VALUES (1,110101,'东城区',1101,11),(2,110102,'西城区',1101,11),(3,110105,'朝阳区',1101,11),(4,110106,'丰台区',1101,11),(5,110107,'石景山区',1101,11),(6,110108,'海淀区',1101,11),(7,110109,'门头沟区',1101,11),(8,110111,'房山区',1101,11),(9,110112,'通州区',1101,11),(10,110113,'顺义区',1101,11),(11,110114,'昌平区',1101,11),(12,110115,'大兴区',1101,11),(13,110116,'怀柔区',1101,11),(14,110117,'平谷区',1101,11),(15,110118,'密云区',1101,11),(16,110119,'延庆区',1101,11),(17,120101,'和平区',1201,12),(18,120102,'河东区',1201,12),(19,120103,'河西区',1201,12),(20,120104,'南开区',1201,12),(21,120105,'河北区',1201,12),(22,120106,'红桥区',1201,12),(23,120110,'东丽区',1201,12),(24,120111,'西青区',1201,12),(25,120112,'津南区',1201,12),(26,120113,'北辰区',1201,12),(27,120114,'武清区',1201,12),(28,120115,'宝坻区',1201,12),(29,120116,'滨海新区',1201,12),(30,120117,'宁河区',1201,12),(31,120118,'静海区',1201,12),(32,120119,'蓟州区',1201,12),(33,130102,'长安区',1301,13),(34,130104,'桥西区',1301,13),(35,130105,'新华区',1301,13),(36,130107,'井陉矿区',1301,13),(37,130108,'裕华区',1301,13),(38,130109,'藁城区',1301,13),(39,130110,'鹿泉区',1301,13),(40,130111,'栾城区',1301,13),(41,130121,'井陉县',1301,13),(42,130123,'正定县',1301,13),(43,130125,'行唐县',1301,13),(44,130126,'灵寿县',1301,13),(45,130127,'高邑县',1301,13),(46,130128,'深泽县',1301,13),(47,130129,'赞皇县',1301,13),(48,130130,'无极县',1301,13),(49,130131,'平山县',1301,13),(50,130132,'元氏县',1301,13),(51,130133,'赵县',1301,13),(52,130171,'石家庄高新技术产业开发区',1301,13),(53,130172,'石家庄循环化工园区',1301,13),(54,130181,'辛集市',1301,13),(55,130183,'晋州市',1301,13),(56,130184,'新乐市',1301,13),(57,130202,'路南区',1302,13),(58,130203,'路北区',1302,13),(59,130204,'古冶区',1302,13),(60,130205,'开平区',1302,13),(61,130207,'丰南区',1302,13),(62,130208,'丰润区',1302,13),(63,130209,'曹妃甸区',1302,13),(64,130224,'滦南县',1302,13),(65,130225,'乐亭县',1302,13),(66,130227,'迁西县',1302,13),(67,130229,'玉田县',1302,13),(68,130271,'唐山市芦台经济技术开发区',1302,13),(69,130272,'唐山市汉沽管理区',1302,13),(70,130273,'唐山高新技术产业开发区',1302,13),(71,130274,'河北唐山海港经济开发区',1302,13),(72,130281,'遵化市',1302,13),(73,130283,'迁安市',1302,13),(74,130284,'滦州市',1302,13),(75,130302,'海港区',1303,13),(76,130303,'山海关区',1303,13),(77,130304,'北戴河区',1303,13),(78,130306,'抚宁区',1303,13),(79,130321,'青龙满族自治县',1303,13),(80,130322,'昌黎县',1303,13),(81,130324,'卢龙县',1303,13),(82,130371,'秦皇岛市经济技术开发区',1303,13),(83,130372,'北戴河新区',1303,13),(84,130402,'邯山区',1304,13),(85,130403,'丛台区',1304,13),(86,130404,'复兴区',1304,13),(87,130406,'峰峰矿区',1304,13),(88,130407,'肥乡区',1304,13),(89,130408,'永年区',1304,13),(90,130423,'临漳县',1304,13),(91,130424,'成安县',1304,13),(92,130425,'大名县',1304,13),(93,130426,'涉县',1304,13),(94,130427,'磁县',1304,13),(95,130430,'邱县',1304,13),(96,130431,'鸡泽县',1304,13),(97,130432,'广平县',1304,13),(98,130433,'馆陶县',1304,13),(99,130434,'魏县',1304,13),(100,130435,'曲周县',1304,13),(101,130471,'邯郸经济技术开发区',1304,13),(102,130473,'邯郸冀南新区',1304,13),(103,130481,'武安市',1304,13),(104,130502,'桥东区',1305,13),(105,130503,'桥西区',1305,13),(106,130521,'邢台县',1305,13),(107,130522,'临城县',1305,13),(108,130523,'内丘县',1305,13),(109,130524,'柏乡县',1305,13),(110,130525,'隆尧县',1305,13),(111,130526,'任县',1305,13),(112,130527,'南和县',1305,13),(113,130528,'宁晋县',1305,13),(114,130529,'巨鹿县',1305,13),(115,130530,'新河县',1305,13),(116,130531,'广宗县',1305,13),(117,130532,'平乡县',1305,13),(118,130533,'威县',1305,13),(119,130534,'清河县',1305,13),(120,130535,'临西县',1305,13),(121,130571,'河北邢台经济开发区',1305,13),(122,130581,'南宫市',1305,13),(123,130582,'沙河市',1305,13),(124,130602,'竞秀区',1306,13),(125,130606,'莲池区',1306,13),(126,130607,'满城区',1306,13),(127,130608,'清苑区',1306,13),(128,130609,'徐水区',1306,13),(129,130623,'涞水县',1306,13),(130,130624,'阜平县',1306,13),(131,130626,'定兴县',1306,13),(132,130627,'唐县',1306,13),(133,130628,'高阳县',1306,13),(134,130629,'容城县',1306,13),(135,130630,'涞源县',1306,13),(136,130631,'望都县',1306,13),(137,130632,'安新县',1306,13),(138,130633,'易县',1306,13),(139,130634,'曲阳县',1306,13),(140,130635,'蠡县',1306,13),(141,130636,'顺平县',1306,13),(142,130637,'博野县',1306,13),(143,130638,'雄县',1306,13),(144,130671,'保定高新技术产业开发区',1306,13),(145,130672,'保定白沟新城',1306,13),(146,130681,'涿州市',1306,13),(147,130682,'定州市',1306,13),(148,130683,'安国市',1306,13),(149,130684,'高碑店市',1306,13),(150,130702,'桥东区',1307,13),(151,130703,'桥西区',1307,13),(152,130705,'宣化区',1307,13),(153,130706,'下花园区',1307,13),(154,130708,'万全区',1307,13),(155,130709,'崇礼区',1307,13),(156,130722,'张北县',1307,13),(157,130723,'康保县',1307,13),(158,130724,'沽源县',1307,13),(159,130725,'尚义县',1307,13),(160,130726,'蔚县',1307,13),(161,130727,'阳原县',1307,13),(162,130728,'怀安县',1307,13),(163,130730,'怀来县',1307,13),(164,130731,'涿鹿县',1307,13),(165,130732,'赤城县',1307,13),(166,130771,'张家口市高新技术产业开发区',1307,13),(167,130772,'张家口市察北管理区',1307,13),(168,130773,'张家口市塞北管理区',1307,13),(169,130802,'双桥区',1308,13),(170,130803,'双滦区',1308,13),(171,130804,'鹰手营子矿区',1308,13),(172,130821,'承德县',1308,13),(173,130822,'兴隆县',1308,13),(174,130824,'滦平县',1308,13),(175,130825,'隆化县',1308,13),(176,130826,'丰宁满族自治县',1308,13),(177,130827,'宽城满族自治县',1308,13),(178,130828,'围场满族蒙古族自治县',1308,13),(179,130871,'承德高新技术产业开发区',1308,13),(180,130881,'平泉市',1308,13),(181,130902,'新华区',1309,13),(182,130903,'运河区',1309,13),(183,130921,'沧县',1309,13),(184,130922,'青县',1309,13),(185,130923,'东光县',1309,13),(186,130924,'海兴县',1309,13),(187,130925,'盐山县',1309,13),(188,130926,'肃宁县',1309,13),(189,130927,'南皮县',1309,13),(190,130928,'吴桥县',1309,13),(191,130929,'献县',1309,13),(192,130930,'孟村回族自治县',1309,13),(193,130971,'河北沧州经济开发区',1309,13),(194,130972,'沧州高新技术产业开发区',1309,13),(195,130973,'沧州渤海新区',1309,13),(196,130981,'泊头市',1309,13),(197,130982,'任丘市',1309,13),(198,130983,'黄骅市',1309,13),(199,130984,'河间市',1309,13),(200,131002,'安次区',1310,13),(201,131003,'广阳区',1310,13),(202,131022,'固安县',1310,13),(203,131023,'永清县',1310,13),(204,131024,'香河县',1310,13),(205,131025,'大城县',1310,13),(206,131026,'文安县',1310,13),(207,131028,'大厂回族自治县',1310,13),(208,131071,'廊坊经济技术开发区',1310,13),(209,131081,'霸州市',1310,13),(210,131082,'三河市',1310,13),(211,131102,'桃城区',1311,13),(212,131103,'冀州区',1311,13),(213,131121,'枣强县',1311,13),(214,131122,'武邑县',1311,13),(215,131123,'武强县',1311,13),(216,131124,'饶阳县',1311,13),(217,131125,'安平县',1311,13),(218,131126,'故城县',1311,13),(219,131127,'景县',1311,13),(220,131128,'阜城县',1311,13),(221,131171,'河北衡水高新技术产业开发区',1311,13),(222,131172,'衡水滨湖新区',1311,13),(223,131182,'深州市',1311,13),(224,140105,'小店区',1401,14),(225,140106,'迎泽区',1401,14),(226,140107,'杏花岭区',1401,14),(227,140108,'尖草坪区',1401,14),(228,140109,'万柏林区',1401,14),(229,140110,'晋源区',1401,14),(230,140121,'清徐县',1401,14),(231,140122,'阳曲县',1401,14),(232,140123,'娄烦县',1401,14),(233,140171,'山西转型综合改革示范区',1401,14),(234,140181,'古交市',1401,14),(235,140212,'新荣区',1402,14),(236,140213,'平城区',1402,14),(237,140214,'云冈区',1402,14),(238,140215,'云州区',1402,14),(239,140221,'阳高县',1402,14),(240,140222,'天镇县',1402,14),(241,140223,'广灵县',1402,14),(242,140224,'灵丘县',1402,14),(243,140225,'浑源县',1402,14),(244,140226,'左云县',1402,14),(245,140271,'山西大同经济开发区',1402,14),(246,140302,'城区',1403,14),(247,140303,'矿区',1403,14),(248,140311,'郊区',1403,14),(249,140321,'平定县',1403,14),(250,140322,'盂县',1403,14),(251,140403,'潞州区',1404,14),(252,140404,'上党区',1404,14),(253,140405,'屯留区',1404,14),(254,140406,'潞城区',1404,14),(255,140423,'襄垣县',1404,14),(256,140425,'平顺县',1404,14),(257,140426,'黎城县',1404,14),(258,140427,'壶关县',1404,14),(259,140428,'长子县',1404,14),(260,140429,'武乡县',1404,14),(261,140430,'沁县',1404,14),(262,140431,'沁源县',1404,14),(263,140471,'山西长治高新技术产业园区',1404,14),(264,140502,'城区',1405,14),(265,140521,'沁水县',1405,14),(266,140522,'阳城县',1405,14),(267,140524,'陵川县',1405,14),(268,140525,'泽州县',1405,14),(269,140581,'高平市',1405,14),(270,140602,'朔城区',1406,14),(271,140603,'平鲁区',1406,14),(272,140621,'山阴县',1406,14),(273,140622,'应县',1406,14),(274,140623,'右玉县',1406,14),(275,140671,'山西朔州经济开发区',1406,14),(276,140681,'怀仁市',1406,14),(277,140702,'榆次区',1407,14),(278,140721,'榆社县',1407,14),(279,140722,'左权县',1407,14),(280,140723,'和顺县',1407,14),(281,140724,'昔阳县',1407,14),(282,140725,'寿阳县',1407,14),(283,140726,'太谷县',1407,14),(284,140727,'祁县',1407,14),(285,140728,'平遥县',1407,14),(286,140729,'灵石县',1407,14),(287,140781,'介休市',1407,14),(288,140802,'盐湖区',1408,14),(289,140821,'临猗县',1408,14),(290,140822,'万荣县',1408,14),(291,140823,'闻喜县',1408,14),(292,140824,'稷山县',1408,14),(293,140825,'新绛县',1408,14),(294,140826,'绛县',1408,14),(295,140827,'垣曲县',1408,14),(296,140828,'夏县',1408,14),(297,140829,'平陆县',1408,14),(298,140830,'芮城县',1408,14),(299,140881,'永济市',1408,14),(300,140882,'河津市',1408,14),(301,140902,'忻府区',1409,14),(302,140921,'定襄县',1409,14),(303,140922,'五台县',1409,14),(304,140923,'代县',1409,14),(305,140924,'繁峙县',1409,14),(306,140925,'宁武县',1409,14),(307,140926,'静乐县',1409,14),(308,140927,'神池县',1409,14),(309,140928,'五寨县',1409,14),(310,140929,'岢岚县',1409,14),(311,140930,'河曲县',1409,14),(312,140931,'保德县',1409,14),(313,140932,'偏关县',1409,14),(314,140971,'五台山风景名胜区',1409,14),(315,140981,'原平市',1409,14),(316,141002,'尧都区',1410,14),(317,141021,'曲沃县',1410,14),(318,141022,'翼城县',1410,14),(319,141023,'襄汾县',1410,14),(320,141024,'洪洞县',1410,14),(321,141025,'古县',1410,14),(322,141026,'安泽县',1410,14),(323,141027,'浮山县',1410,14),(324,141028,'吉县',1410,14),(325,141029,'乡宁县',1410,14),(326,141030,'大宁县',1410,14),(327,141031,'隰县',1410,14),(328,141032,'永和县',1410,14),(329,141033,'蒲县',1410,14),(330,141034,'汾西县',1410,14),(331,141081,'侯马市',1410,14),(332,141082,'霍州市',1410,14),(333,141102,'离石区',1411,14),(334,141121,'文水县',1411,14),(335,141122,'交城县',1411,14),(336,141123,'兴县',1411,14),(337,141124,'临县',1411,14),(338,141125,'柳林县',1411,14),(339,141126,'石楼县',1411,14),(340,141127,'岚县',1411,14),(341,141128,'方山县',1411,14),(342,141129,'中阳县',1411,14),(343,141130,'交口县',1411,14),(344,141181,'孝义市',1411,14),(345,141182,'汾阳市',1411,14),(346,150102,'新城区',1501,15),(347,150103,'回民区',1501,15),(348,150104,'玉泉区',1501,15),(349,150105,'赛罕区',1501,15),(350,150121,'土默特左旗',1501,15),(351,150122,'托克托县',1501,15),(352,150123,'和林格尔县',1501,15),(353,150124,'清水河县',1501,15),(354,150125,'武川县',1501,15),(355,150171,'呼和浩特金海工业园区',1501,15),(356,150172,'呼和浩特经济技术开发区',1501,15),(357,150202,'东河区',1502,15),(358,150203,'昆都仑区',1502,15),(359,150204,'青山区',1502,15),(360,150205,'石拐区',1502,15),(361,150206,'白云鄂博矿区',1502,15),(362,150207,'九原区',1502,15),(363,150221,'土默特右旗',1502,15),(364,150222,'固阳县',1502,15),(365,150223,'达尔罕茂明安联合旗',1502,15),(366,150271,'包头稀土高新技术产业开发区',1502,15),(367,150302,'海勃湾区',1503,15),(368,150303,'海南区',1503,15),(369,150304,'乌达区',1503,15),(370,150402,'红山区',1504,15),(371,150403,'元宝山区',1504,15),(372,150404,'松山区',1504,15),(373,150421,'阿鲁科尔沁旗',1504,15),(374,150422,'巴林左旗',1504,15),(375,150423,'巴林右旗',1504,15),(376,150424,'林西县',1504,15),(377,150425,'克什克腾旗',1504,15),(378,150426,'翁牛特旗',1504,15),(379,150428,'喀喇沁旗',1504,15),(380,150429,'宁城县',1504,15),(381,150430,'敖汉旗',1504,15),(382,150502,'科尔沁区',1505,15),(383,150521,'科尔沁左翼中旗',1505,15),(384,150522,'科尔沁左翼后旗',1505,15),(385,150523,'开鲁县',1505,15),(386,150524,'库伦旗',1505,15),(387,150525,'奈曼旗',1505,15),(388,150526,'扎鲁特旗',1505,15),(389,150571,'通辽经济技术开发区',1505,15),(390,150581,'霍林郭勒市',1505,15),(391,150602,'东胜区',1506,15),(392,150603,'康巴什区',1506,15),(393,150621,'达拉特旗',1506,15),(394,150622,'准格尔旗',1506,15),(395,150623,'鄂托克前旗',1506,15),(396,150624,'鄂托克旗',1506,15),(397,150625,'杭锦旗',1506,15),(398,150626,'乌审旗',1506,15),(399,150627,'伊金霍洛旗',1506,15),(400,150702,'海拉尔区',1507,15),(401,150703,'扎赉诺尔区',1507,15),(402,150721,'阿荣旗',1507,15),(403,150722,'莫力达瓦达斡尔族自治旗',1507,15),(404,150723,'鄂伦春自治旗',1507,15),(405,150724,'鄂温克族自治旗',1507,15),(406,150725,'陈巴尔虎旗',1507,15),(407,150726,'新巴尔虎左旗',1507,15),(408,150727,'新巴尔虎右旗',1507,15),(409,150781,'满洲里市',1507,15),(410,150782,'牙克石市',1507,15),(411,150783,'扎兰屯市',1507,15),(412,150784,'额尔古纳市',1507,15),(413,150785,'根河市',1507,15),(414,150802,'临河区',1508,15),(415,150821,'五原县',1508,15),(416,150822,'磴口县',1508,15),(417,150823,'乌拉特前旗',1508,15),(418,150824,'乌拉特中旗',1508,15),(419,150825,'乌拉特后旗',1508,15),(420,150826,'杭锦后旗',1508,15),(421,150902,'集宁区',1509,15),(422,150921,'卓资县',1509,15),(423,150922,'化德县',1509,15),(424,150923,'商都县',1509,15),(425,150924,'兴和县',1509,15),(426,150925,'凉城县',1509,15),(427,150926,'察哈尔右翼前旗',1509,15),(428,150927,'察哈尔右翼中旗',1509,15),(429,150928,'察哈尔右翼后旗',1509,15),(430,150929,'四子王旗',1509,15),(431,150981,'丰镇市',1509,15),(432,152201,'乌兰浩特市',1522,15),(433,152202,'阿尔山市',1522,15),(434,152221,'科尔沁右翼前旗',1522,15),(435,152222,'科尔沁右翼中旗',1522,15),(436,152223,'扎赉特旗',1522,15),(437,152224,'突泉县',1522,15),(438,152501,'二连浩特市',1525,15),(439,152502,'锡林浩特市',1525,15),(440,152522,'阿巴嘎旗',1525,15),(441,152523,'苏尼特左旗',1525,15),(442,152524,'苏尼特右旗',1525,15),(443,152525,'东乌珠穆沁旗',1525,15),(444,152526,'西乌珠穆沁旗',1525,15),(445,152527,'太仆寺旗',1525,15),(446,152528,'镶黄旗',1525,15),(447,152529,'正镶白旗',1525,15),(448,152530,'正蓝旗',1525,15),(449,152531,'多伦县',1525,15),(450,152571,'乌拉盖管委会',1525,15),(451,152921,'阿拉善左旗',1529,15),(452,152922,'阿拉善右旗',1529,15),(453,152923,'额济纳旗',1529,15),(454,152971,'内蒙古阿拉善经济开发区',1529,15),(455,210102,'和平区',2101,21),(456,210103,'沈河区',2101,21),(457,210104,'大东区',2101,21),(458,210105,'皇姑区',2101,21),(459,210106,'铁西区',2101,21),(460,210111,'苏家屯区',2101,21),(461,210112,'浑南区',2101,21),(462,210113,'沈北新区',2101,21),(463,210114,'于洪区',2101,21),(464,210115,'辽中区',2101,21),(465,210123,'康平县',2101,21),(466,210124,'法库县',2101,21),(467,210181,'新民市',2101,21),(468,210202,'中山区',2102,21),(469,210203,'西岗区',2102,21),(470,210204,'沙河口区',2102,21),(471,210211,'甘井子区',2102,21),(472,210212,'旅顺口区',2102,21),(473,210213,'金州区',2102,21),(474,210214,'普兰店区',2102,21),(475,210224,'长海县',2102,21),(476,210281,'瓦房店市',2102,21),(477,210283,'庄河市',2102,21),(478,210302,'铁东区',2103,21),(479,210303,'铁西区',2103,21),(480,210304,'立山区',2103,21),(481,210311,'千山区',2103,21),(482,210321,'台安县',2103,21),(483,210323,'岫岩满族自治县',2103,21),(484,210381,'海城市',2103,21),(485,210402,'新抚区',2104,21),(486,210403,'东洲区',2104,21),(487,210404,'望花区',2104,21),(488,210411,'顺城区',2104,21),(489,210421,'抚顺县',2104,21),(490,210422,'新宾满族自治县',2104,21),(491,210423,'清原满族自治县',2104,21),(492,210502,'平山区',2105,21),(493,210503,'溪湖区',2105,21),(494,210504,'明山区',2105,21),(495,210505,'南芬区',2105,21),(496,210521,'本溪满族自治县',2105,21),(497,210522,'桓仁满族自治县',2105,21),(498,210602,'元宝区',2106,21),(499,210603,'振兴区',2106,21),(500,210604,'振安区',2106,21),(501,210624,'宽甸满族自治县',2106,21),(502,210681,'东港市',2106,21),(503,210682,'凤城市',2106,21),(504,210702,'古塔区',2107,21),(505,210703,'凌河区',2107,21),(506,210711,'太和区',2107,21),(507,210726,'黑山县',2107,21),(508,210727,'义县',2107,21),(509,210781,'凌海市',2107,21),(510,210782,'北镇市',2107,21),(511,210802,'站前区',2108,21),(512,210803,'西市区',2108,21),(513,210804,'鲅鱼圈区',2108,21),(514,210811,'老边区',2108,21),(515,210881,'盖州市',2108,21),(516,210882,'大石桥市',2108,21),(517,210902,'海州区',2109,21),(518,210903,'新邱区',2109,21),(519,210904,'太平区',2109,21),(520,210905,'清河门区',2109,21),(521,210911,'细河区',2109,21),(522,210921,'阜新蒙古族自治县',2109,21),(523,210922,'彰武县',2109,21),(524,211002,'白塔区',2110,21),(525,211003,'文圣区',2110,21),(526,211004,'宏伟区',2110,21),(527,211005,'弓长岭区',2110,21),(528,211011,'太子河区',2110,21),(529,211021,'辽阳县',2110,21),(530,211081,'灯塔市',2110,21),(531,211102,'双台子区',2111,21),(532,211103,'兴隆台区',2111,21),(533,211104,'大洼区',2111,21),(534,211122,'盘山县',2111,21),(535,211202,'银州区',2112,21),(536,211204,'清河区',2112,21),(537,211221,'铁岭县',2112,21),(538,211223,'西丰县',2112,21),(539,211224,'昌图县',2112,21),(540,211281,'调兵山市',2112,21),(541,211282,'开原市',2112,21),(542,211302,'双塔区',2113,21),(543,211303,'龙城区',2113,21),(544,211321,'朝阳县',2113,21),(545,211322,'建平县',2113,21),(546,211324,'喀喇沁左翼蒙古族自治县',2113,21),(547,211381,'北票市',2113,21),(548,211382,'凌源市',2113,21),(549,211402,'连山区',2114,21),(550,211403,'龙港区',2114,21),(551,211404,'南票区',2114,21),(552,211421,'绥中县',2114,21),(553,211422,'建昌县',2114,21),(554,211481,'兴城市',2114,21),(555,220102,'南关区',2201,22),(556,220103,'宽城区',2201,22),(557,220104,'朝阳区',2201,22),(558,220105,'二道区',2201,22),(559,220106,'绿园区',2201,22),(560,220112,'双阳区',2201,22),(561,220113,'九台区',2201,22),(562,220122,'农安县',2201,22),(563,220171,'长春经济技术开发区',2201,22),(564,220172,'长春净月高新技术产业开发区',2201,22),(565,220173,'长春高新技术产业开发区',2201,22),(566,220174,'长春汽车经济技术开发区',2201,22),(567,220182,'榆树市',2201,22),(568,220183,'德惠市',2201,22),(569,220202,'昌邑区',2202,22),(570,220203,'龙潭区',2202,22),(571,220204,'船营区',2202,22),(572,220211,'丰满区',2202,22),(573,220221,'永吉县',2202,22),(574,220271,'吉林经济开发区',2202,22),(575,220272,'吉林高新技术产业开发区',2202,22),(576,220273,'吉林中国新加坡食品区',2202,22),(577,220281,'蛟河市',2202,22),(578,220282,'桦甸市',2202,22),(579,220283,'舒兰市',2202,22),(580,220284,'磐石市',2202,22),(581,220302,'铁西区',2203,22),(582,220303,'铁东区',2203,22),(583,220322,'梨树县',2203,22),(584,220323,'伊通满族自治县',2203,22),(585,220381,'公主岭市',2203,22),(586,220382,'双辽市',2203,22),(587,220402,'龙山区',2204,22),(588,220403,'西安区',2204,22),(589,220421,'东丰县',2204,22),(590,220422,'东辽县',2204,22),(591,220502,'东昌区',2205,22),(592,220503,'二道江区',2205,22),(593,220521,'通化县',2205,22),(594,220523,'辉南县',2205,22),(595,220524,'柳河县',2205,22),(596,220581,'梅河口市',2205,22),(597,220582,'集安市',2205,22),(598,220602,'浑江区',2206,22),(599,220605,'江源区',2206,22),(600,220621,'抚松县',2206,22),(601,220622,'靖宇县',2206,22),(602,220623,'长白朝鲜族自治县',2206,22),(603,220681,'临江市',2206,22),(604,220702,'宁江区',2207,22),(605,220721,'前郭尔罗斯蒙古族自治县',2207,22),(606,220722,'长岭县',2207,22),(607,220723,'乾安县',2207,22),(608,220771,'吉林松原经济开发区',2207,22),(609,220781,'扶余市',2207,22),(610,220802,'洮北区',2208,22),(611,220821,'镇赉县',2208,22),(612,220822,'通榆县',2208,22),(613,220871,'吉林白城经济开发区',2208,22),(614,220881,'洮南市',2208,22),(615,220882,'大安市',2208,22),(616,222401,'延吉市',2224,22),(617,222402,'图们市',2224,22),(618,222403,'敦化市',2224,22),(619,222404,'珲春市',2224,22),(620,222405,'龙井市',2224,22),(621,222406,'和龙市',2224,22),(622,222424,'汪清县',2224,22),(623,222426,'安图县',2224,22),(624,230102,'道里区',2301,23),(625,230103,'南岗区',2301,23),(626,230104,'道外区',2301,23),(627,230108,'平房区',2301,23),(628,230109,'松北区',2301,23),(629,230110,'香坊区',2301,23),(630,230111,'呼兰区',2301,23),(631,230112,'阿城区',2301,23),(632,230113,'双城区',2301,23),(633,230123,'依兰县',2301,23),(634,230124,'方正县',2301,23),(635,230125,'宾县',2301,23),(636,230126,'巴彦县',2301,23),(637,230127,'木兰县',2301,23),(638,230128,'通河县',2301,23),(639,230129,'延寿县',2301,23),(640,230183,'尚志市',2301,23),(641,230184,'五常市',2301,23),(642,230202,'龙沙区',2302,23),(643,230203,'建华区',2302,23),(644,230204,'铁锋区',2302,23),(645,230205,'昂昂溪区',2302,23),(646,230206,'富拉尔基区',2302,23),(647,230207,'碾子山区',2302,23),(648,230208,'梅里斯达斡尔族区',2302,23),(649,230221,'龙江县',2302,23),(650,230223,'依安县',2302,23),(651,230224,'泰来县',2302,23),(652,230225,'甘南县',2302,23),(653,230227,'富裕县',2302,23),(654,230229,'克山县',2302,23),(655,230230,'克东县',2302,23),(656,230231,'拜泉县',2302,23),(657,230281,'讷河市',2302,23),(658,230302,'鸡冠区',2303,23),(659,230303,'恒山区',2303,23),(660,230304,'滴道区',2303,23),(661,230305,'梨树区',2303,23),(662,230306,'城子河区',2303,23),(663,230307,'麻山区',2303,23),(664,230321,'鸡东县',2303,23),(665,230381,'虎林市',2303,23),(666,230382,'密山市',2303,23),(667,230402,'向阳区',2304,23),(668,230403,'工农区',2304,23),(669,230404,'南山区',2304,23),(670,230405,'兴安区',2304,23),(671,230406,'东山区',2304,23),(672,230407,'兴山区',2304,23),(673,230421,'萝北县',2304,23),(674,230422,'绥滨县',2304,23),(675,230502,'尖山区',2305,23),(676,230503,'岭东区',2305,23),(677,230505,'四方台区',2305,23),(678,230506,'宝山区',2305,23),(679,230521,'集贤县',2305,23),(680,230522,'友谊县',2305,23),(681,230523,'宝清县',2305,23),(682,230524,'饶河县',2305,23),(683,230602,'萨尔图区',2306,23),(684,230603,'龙凤区',2306,23),(685,230604,'让胡路区',2306,23),(686,230605,'红岗区',2306,23),(687,230606,'大同区',2306,23),(688,230621,'肇州县',2306,23),(689,230622,'肇源县',2306,23),(690,230623,'林甸县',2306,23),(691,230624,'杜尔伯特蒙古族自治县',2306,23),(692,230671,'大庆高新技术产业开发区',2306,23),(693,230702,'伊春区',2307,23),(694,230703,'南岔区',2307,23),(695,230704,'友好区',2307,23),(696,230705,'西林区',2307,23),(697,230706,'翠峦区',2307,23),(698,230707,'新青区',2307,23),(699,230708,'美溪区',2307,23),(700,230709,'金山屯区',2307,23),(701,230710,'五营区',2307,23),(702,230711,'乌马河区',2307,23),(703,230712,'汤旺河区',2307,23),(704,230713,'带岭区',2307,23),(705,230714,'乌伊岭区',2307,23),(706,230715,'红星区',2307,23),(707,230716,'上甘岭区',2307,23),(708,230722,'嘉荫县',2307,23),(709,230781,'铁力市',2307,23),(710,230803,'向阳区',2308,23),(711,230804,'前进区',2308,23),(712,230805,'东风区',2308,23),(713,230811,'郊区',2308,23),(714,230822,'桦南县',2308,23),(715,230826,'桦川县',2308,23),(716,230828,'汤原县',2308,23),(717,230881,'同江市',2308,23),(718,230882,'富锦市',2308,23),(719,230883,'抚远市',2308,23),(720,230902,'新兴区',2309,23),(721,230903,'桃山区',2309,23),(722,230904,'茄子河区',2309,23),(723,230921,'勃利县',2309,23),(724,231002,'东安区',2310,23),(725,231003,'阳明区',2310,23),(726,231004,'爱民区',2310,23),(727,231005,'西安区',2310,23),(728,231025,'林口县',2310,23),(729,231071,'牡丹江经济技术开发区',2310,23),(730,231081,'绥芬河市',2310,23),(731,231083,'海林市',2310,23),(732,231084,'宁安市',2310,23),(733,231085,'穆棱市',2310,23),(734,231086,'东宁市',2310,23),(735,231102,'爱辉区',2311,23),(736,231121,'嫩江县',2311,23),(737,231123,'逊克县',2311,23),(738,231124,'孙吴县',2311,23),(739,231181,'北安市',2311,23),(740,231182,'五大连池市',2311,23),(741,231202,'北林区',2312,23),(742,231221,'望奎县',2312,23),(743,231222,'兰西县',2312,23),(744,231223,'青冈县',2312,23),(745,231224,'庆安县',2312,23),(746,231225,'明水县',2312,23),(747,231226,'绥棱县',2312,23),(748,231281,'安达市',2312,23),(749,231282,'肇东市',2312,23),(750,231283,'海伦市',2312,23),(751,232701,'漠河市',2327,23),(752,232721,'呼玛县',2327,23),(753,232722,'塔河县',2327,23),(754,232761,'加格达奇区',2327,23),(755,232762,'松岭区',2327,23),(756,232763,'新林区',2327,23),(757,232764,'呼中区',2327,23),(758,310101,'黄浦区',3101,31),(759,310104,'徐汇区',3101,31),(760,310105,'长宁区',3101,31),(761,310106,'静安区',3101,31),(762,310107,'普陀区',3101,31),(763,310109,'虹口区',3101,31),(764,310110,'杨浦区',3101,31),(765,310112,'闵行区',3101,31),(766,310113,'宝山区',3101,31),(767,310114,'嘉定区',3101,31),(768,310115,'浦东新区',3101,31),(769,310116,'金山区',3101,31),(770,310117,'松江区',3101,31),(771,310118,'青浦区',3101,31),(772,310120,'奉贤区',3101,31),(773,310151,'崇明区',3101,31),(774,320102,'玄武区',3201,32),(775,320104,'秦淮区',3201,32),(776,320105,'建邺区',3201,32),(777,320106,'鼓楼区',3201,32),(778,320111,'浦口区',3201,32),(779,320113,'栖霞区',3201,32),(780,320114,'雨花台区',3201,32),(781,320115,'江宁区',3201,32),(782,320116,'六合区',3201,32),(783,320117,'溧水区',3201,32),(784,320118,'高淳区',3201,32),(785,320205,'锡山区',3202,32),(786,320206,'惠山区',3202,32),(787,320211,'滨湖区',3202,32),(788,320213,'梁溪区',3202,32),(789,320214,'新吴区',3202,32),(790,320281,'江阴市',3202,32),(791,320282,'宜兴市',3202,32),(792,320302,'鼓楼区',3203,32),(793,320303,'云龙区',3203,32),(794,320305,'贾汪区',3203,32),(795,320311,'泉山区',3203,32),(796,320312,'铜山区',3203,32),(797,320321,'丰县',3203,32),(798,320322,'沛县',3203,32),(799,320324,'睢宁县',3203,32),(800,320371,'徐州经济技术开发区',3203,32),(801,320381,'新沂市',3203,32),(802,320382,'邳州市',3203,32),(803,320402,'天宁区',3204,32),(804,320404,'钟楼区',3204,32),(805,320411,'新北区',3204,32),(806,320412,'武进区',3204,32),(807,320413,'金坛区',3204,32),(808,320481,'溧阳市',3204,32),(809,320505,'虎丘区',3205,32),(810,320506,'吴中区',3205,32),(811,320507,'相城区',3205,32),(812,320508,'姑苏区',3205,32),(813,320509,'吴江区',3205,32),(814,320571,'苏州工业园区',3205,32),(815,320581,'常熟市',3205,32),(816,320582,'张家港市',3205,32),(817,320583,'昆山市',3205,32),(818,320585,'太仓市',3205,32),(819,320602,'崇川区',3206,32),(820,320611,'港闸区',3206,32),(821,320612,'通州区',3206,32),(822,320623,'如东县',3206,32),(823,320671,'南通经济技术开发区',3206,32),(824,320681,'启东市',3206,32),(825,320682,'如皋市',3206,32),(826,320684,'海门市',3206,32),(827,320685,'海安市',3206,32),(828,320703,'连云区',3207,32),(829,320706,'海州区',3207,32),(830,320707,'赣榆区',3207,32),(831,320722,'东海县',3207,32),(832,320723,'灌云县',3207,32),(833,320724,'灌南县',3207,32),(834,320771,'连云港经济技术开发区',3207,32),(835,320772,'连云港高新技术产业开发区',3207,32),(836,320803,'淮安区',3208,32),(837,320804,'淮阴区',3208,32),(838,320812,'清江浦区',3208,32),(839,320813,'洪泽区',3208,32),(840,320826,'涟水县',3208,32),(841,320830,'盱眙县',3208,32),(842,320831,'金湖县',3208,32),(843,320871,'淮安经济技术开发区',3208,32),(844,320902,'亭湖区',3209,32),(845,320903,'盐都区',3209,32),(846,320904,'大丰区',3209,32),(847,320921,'响水县',3209,32),(848,320922,'滨海县',3209,32),(849,320923,'阜宁县',3209,32),(850,320924,'射阳县',3209,32),(851,320925,'建湖县',3209,32),(852,320971,'盐城经济技术开发区',3209,32),(853,320981,'东台市',3209,32),(854,321002,'广陵区',3210,32),(855,321003,'邗江区',3210,32),(856,321012,'江都区',3210,32),(857,321023,'宝应县',3210,32),(858,321071,'扬州经济技术开发区',3210,32),(859,321081,'仪征市',3210,32),(860,321084,'高邮市',3210,32),(861,321102,'京口区',3211,32),(862,321111,'润州区',3211,32),(863,321112,'丹徒区',3211,32),(864,321171,'镇江新区',3211,32),(865,321181,'丹阳市',3211,32),(866,321182,'扬中市',3211,32),(867,321183,'句容市',3211,32),(868,321202,'海陵区',3212,32),(869,321203,'高港区',3212,32),(870,321204,'姜堰区',3212,32),(871,321271,'泰州医药高新技术产业开发区',3212,32),(872,321281,'兴化市',3212,32),(873,321282,'靖江市',3212,32),(874,321283,'泰兴市',3212,32),(875,321302,'宿城区',3213,32),(876,321311,'宿豫区',3213,32),(877,321322,'沭阳县',3213,32),(878,321323,'泗阳县',3213,32),(879,321324,'泗洪县',3213,32),(880,321371,'宿迁经济技术开发区',3213,32),(881,330102,'上城区',3301,33),(882,330103,'下城区',3301,33),(883,330104,'江干区',3301,33),(884,330105,'拱墅区',3301,33),(885,330106,'西湖区',3301,33),(886,330108,'滨江区',3301,33),(887,330109,'萧山区',3301,33),(888,330110,'余杭区',3301,33),(889,330111,'富阳区',3301,33),(890,330112,'临安区',3301,33),(891,330122,'桐庐县',3301,33),(892,330127,'淳安县',3301,33),(893,330182,'建德市',3301,33),(894,330203,'海曙区',3302,33),(895,330205,'江北区',3302,33),(896,330206,'北仑区',3302,33),(897,330211,'镇海区',3302,33),(898,330212,'鄞州区',3302,33),(899,330213,'奉化区',3302,33),(900,330225,'象山县',3302,33),(901,330226,'宁海县',3302,33),(902,330281,'余姚市',3302,33),(903,330282,'慈溪市',3302,33),(904,330302,'鹿城区',3303,33),(905,330303,'龙湾区',3303,33),(906,330304,'瓯海区',3303,33),(907,330305,'洞头区',3303,33),(908,330324,'永嘉县',3303,33),(909,330326,'平阳县',3303,33),(910,330327,'苍南县',3303,33),(911,330328,'文成县',3303,33),(912,330329,'泰顺县',3303,33),(913,330371,'温州经济技术开发区',3303,33),(914,330381,'瑞安市',3303,33),(915,330382,'乐清市',3303,33),(916,330402,'南湖区',3304,33),(917,330411,'秀洲区',3304,33),(918,330421,'嘉善县',3304,33),(919,330424,'海盐县',3304,33),(920,330481,'海宁市',3304,33),(921,330482,'平湖市',3304,33),(922,330483,'桐乡市',3304,33),(923,330502,'吴兴区',3305,33),(924,330503,'南浔区',3305,33),(925,330521,'德清县',3305,33),(926,330522,'长兴县',3305,33),(927,330523,'安吉县',3305,33),(928,330602,'越城区',3306,33),(929,330603,'柯桥区',3306,33),(930,330604,'上虞区',3306,33),(931,330624,'新昌县',3306,33),(932,330681,'诸暨市',3306,33),(933,330683,'嵊州市',3306,33),(934,330702,'婺城区',3307,33),(935,330703,'金东区',3307,33),(936,330723,'武义县',3307,33),(937,330726,'浦江县',3307,33),(938,330727,'磐安县',3307,33),(939,330781,'兰溪市',3307,33),(940,330782,'义乌市',3307,33),(941,330783,'东阳市',3307,33),(942,330784,'永康市',3307,33),(943,330802,'柯城区',3308,33),(944,330803,'衢江区',3308,33),(945,330822,'常山县',3308,33),(946,330824,'开化县',3308,33),(947,330825,'龙游县',3308,33),(948,330881,'江山市',3308,33),(949,330902,'定海区',3309,33),(950,330903,'普陀区',3309,33),(951,330921,'岱山县',3309,33),(952,330922,'嵊泗县',3309,33),(953,331002,'椒江区',3310,33),(954,331003,'黄岩区',3310,33),(955,331004,'路桥区',3310,33),(956,331022,'三门县',3310,33),(957,331023,'天台县',3310,33),(958,331024,'仙居县',3310,33),(959,331081,'温岭市',3310,33),(960,331082,'临海市',3310,33),(961,331083,'玉环市',3310,33),(962,331102,'莲都区',3311,33),(963,331121,'青田县',3311,33),(964,331122,'缙云县',3311,33),(965,331123,'遂昌县',3311,33),(966,331124,'松阳县',3311,33),(967,331125,'云和县',3311,33),(968,331126,'庆元县',3311,33),(969,331127,'景宁畲族自治县',3311,33),(970,331181,'龙泉市',3311,33),(971,340102,'瑶海区',3401,34),(972,340103,'庐阳区',3401,34),(973,340104,'蜀山区',3401,34),(974,340111,'包河区',3401,34),(975,340121,'长丰县',3401,34),(976,340122,'肥东县',3401,34),(977,340123,'肥西县',3401,34),(978,340124,'庐江县',3401,34),(979,340171,'合肥高新技术产业开发区',3401,34),(980,340172,'合肥经济技术开发区',3401,34),(981,340173,'合肥新站高新技术产业开发区',3401,34),(982,340181,'巢湖市',3401,34),(983,340202,'镜湖区',3402,34),(984,340203,'弋江区',3402,34),(985,340207,'鸠江区',3402,34),(986,340208,'三山区',3402,34),(987,340221,'芜湖县',3402,34),(988,340222,'繁昌县',3402,34),(989,340223,'南陵县',3402,34),(990,340225,'无为县',3402,34),(991,340271,'芜湖经济技术开发区',3402,34),(992,340272,'安徽芜湖长江大桥经济开发区',3402,34),(993,340302,'龙子湖区',3403,34),(994,340303,'蚌山区',3403,34),(995,340304,'禹会区',3403,34),(996,340311,'淮上区',3403,34),(997,340321,'怀远县',3403,34),(998,340322,'五河县',3403,34),(999,340323,'固镇县',3403,34),(1000,340371,'蚌埠市高新技术开发区',3403,34),(1001,340372,'蚌埠市经济开发区',3403,34),(1002,340402,'大通区',3404,34),(1003,340403,'田家庵区',3404,34),(1004,340404,'谢家集区',3404,34),(1005,340405,'八公山区',3404,34),(1006,340406,'潘集区',3404,34),(1007,340421,'凤台县',3404,34),(1008,340422,'寿县',3404,34),(1009,340503,'花山区',3405,34),(1010,340504,'雨山区',3405,34),(1011,340506,'博望区',3405,34),(1012,340521,'当涂县',3405,34),(1013,340522,'含山县',3405,34),(1014,340523,'和县',3405,34),(1015,340602,'杜集区',3406,34),(1016,340603,'相山区',3406,34),(1017,340604,'烈山区',3406,34),(1018,340621,'濉溪县',3406,34),(1019,340705,'铜官区',3407,34),(1020,340706,'义安区',3407,34),(1021,340711,'郊区',3407,34),(1022,340722,'枞阳县',3407,34),(1023,340802,'迎江区',3408,34),(1024,340803,'大观区',3408,34),(1025,340811,'宜秀区',3408,34),(1026,340822,'怀宁县',3408,34),(1027,340825,'太湖县',3408,34),(1028,340826,'宿松县',3408,34),(1029,340827,'望江县',3408,34),(1030,340828,'岳西县',3408,34),(1031,340871,'安徽安庆经济开发区',3408,34),(1032,340881,'桐城市',3408,34),(1033,340882,'潜山市',3408,34),(1034,341002,'屯溪区',3410,34),(1035,341003,'黄山区',3410,34),(1036,341004,'徽州区',3410,34),(1037,341021,'歙县',3410,34),(1038,341022,'休宁县',3410,34),(1039,341023,'黟县',3410,34),(1040,341024,'祁门县',3410,34),(1041,341102,'琅琊区',3411,34),(1042,341103,'南谯区',3411,34),(1043,341122,'来安县',3411,34),(1044,341124,'全椒县',3411,34),(1045,341125,'定远县',3411,34),(1046,341126,'凤阳县',3411,34),(1047,341171,'苏滁现代产业园',3411,34),(1048,341172,'滁州经济技术开发区',3411,34),(1049,341181,'天长市',3411,34),(1050,341182,'明光市',3411,34),(1051,341202,'颍州区',3412,34),(1052,341203,'颍东区',3412,34),(1053,341204,'颍泉区',3412,34),(1054,341221,'临泉县',3412,34),(1055,341222,'太和县',3412,34),(1056,341225,'阜南县',3412,34),(1057,341226,'颍上县',3412,34),(1058,341271,'阜阳合肥现代产业园区',3412,34),(1059,341272,'阜阳经济技术开发区',3412,34),(1060,341282,'界首市',3412,34),(1061,341302,'埇桥区',3413,34),(1062,341321,'砀山县',3413,34),(1063,341322,'萧县',3413,34),(1064,341323,'灵璧县',3413,34),(1065,341324,'泗县',3413,34),(1066,341371,'宿州马鞍山现代产业园区',3413,34),(1067,341372,'宿州经济技术开发区',3413,34),(1068,341502,'金安区',3415,34),(1069,341503,'裕安区',3415,34),(1070,341504,'叶集区',3415,34),(1071,341522,'霍邱县',3415,34),(1072,341523,'舒城县',3415,34),(1073,341524,'金寨县',3415,34),(1074,341525,'霍山县',3415,34),(1075,341602,'谯城区',3416,34),(1076,341621,'涡阳县',3416,34),(1077,341622,'蒙城县',3416,34),(1078,341623,'利辛县',3416,34),(1079,341702,'贵池区',3417,34),(1080,341721,'东至县',3417,34),(1081,341722,'石台县',3417,34),(1082,341723,'青阳县',3417,34),(1083,341802,'宣州区',3418,34),(1084,341821,'郎溪县',3418,34),(1085,341822,'广德县',3418,34),(1086,341823,'泾县',3418,34),(1087,341824,'绩溪县',3418,34),(1088,341825,'旌德县',3418,34),(1089,341871,'宣城市经济开发区',3418,34),(1090,341881,'宁国市',3418,34),(1091,350102,'鼓楼区',3501,35),(1092,350103,'台江区',3501,35),(1093,350104,'仓山区',3501,35),(1094,350105,'马尾区',3501,35),(1095,350111,'晋安区',3501,35),(1096,350112,'长乐区',3501,35),(1097,350121,'闽侯县',3501,35),(1098,350122,'连江县',3501,35),(1099,350123,'罗源县',3501,35),(1100,350124,'闽清县',3501,35),(1101,350125,'永泰县',3501,35),(1102,350128,'平潭县',3501,35),(1103,350181,'福清市',3501,35),(1104,350203,'思明区',3502,35),(1105,350205,'海沧区',3502,35),(1106,350206,'湖里区',3502,35),(1107,350211,'集美区',3502,35),(1108,350212,'同安区',3502,35),(1109,350213,'翔安区',3502,35),(1110,350302,'城厢区',3503,35),(1111,350303,'涵江区',3503,35),(1112,350304,'荔城区',3503,35),(1113,350305,'秀屿区',3503,35),(1114,350322,'仙游县',3503,35),(1115,350402,'梅列区',3504,35),(1116,350403,'三元区',3504,35),(1117,350421,'明溪县',3504,35),(1118,350423,'清流县',3504,35),(1119,350424,'宁化县',3504,35),(1120,350425,'大田县',3504,35),(1121,350426,'尤溪县',3504,35),(1122,350427,'沙县',3504,35),(1123,350428,'将乐县',3504,35),(1124,350429,'泰宁县',3504,35),(1125,350430,'建宁县',3504,35),(1126,350481,'永安市',3504,35),(1127,350502,'鲤城区',3505,35),(1128,350503,'丰泽区',3505,35),(1129,350504,'洛江区',3505,35),(1130,350505,'泉港区',3505,35),(1131,350521,'惠安县',3505,35),(1132,350524,'安溪县',3505,35),(1133,350525,'永春县',3505,35),(1134,350526,'德化县',3505,35),(1135,350527,'金门县',3505,35),(1136,350581,'石狮市',3505,35),(1137,350582,'晋江市',3505,35),(1138,350583,'南安市',3505,35),(1139,350602,'芗城区',3506,35),(1140,350603,'龙文区',3506,35),(1141,350622,'云霄县',3506,35),(1142,350623,'漳浦县',3506,35),(1143,350624,'诏安县',3506,35),(1144,350625,'长泰县',3506,35),(1145,350626,'东山县',3506,35),(1146,350627,'南靖县',3506,35),(1147,350628,'平和县',3506,35),(1148,350629,'华安县',3506,35),(1149,350681,'龙海市',3506,35),(1150,350702,'延平区',3507,35),(1151,350703,'建阳区',3507,35),(1152,350721,'顺昌县',3507,35),(1153,350722,'浦城县',3507,35),(1154,350723,'光泽县',3507,35),(1155,350724,'松溪县',3507,35),(1156,350725,'政和县',3507,35),(1157,350781,'邵武市',3507,35),(1158,350782,'武夷山市',3507,35),(1159,350783,'建瓯市',3507,35),(1160,350802,'新罗区',3508,35),(1161,350803,'永定区',3508,35),(1162,350821,'长汀县',3508,35),(1163,350823,'上杭县',3508,35),(1164,350824,'武平县',3508,35),(1165,350825,'连城县',3508,35),(1166,350881,'漳平市',3508,35),(1167,350902,'蕉城区',3509,35),(1168,350921,'霞浦县',3509,35),(1169,350922,'古田县',3509,35),(1170,350923,'屏南县',3509,35),(1171,350924,'寿宁县',3509,35),(1172,350925,'周宁县',3509,35),(1173,350926,'柘荣县',3509,35),(1174,350981,'福安市',3509,35),(1175,350982,'福鼎市',3509,35),(1176,360102,'东湖区',3601,36),(1177,360103,'西湖区',3601,36),(1178,360104,'青云谱区',3601,36),(1179,360105,'湾里区',3601,36),(1180,360111,'青山湖区',3601,36),(1181,360112,'新建区',3601,36),(1182,360121,'南昌县',3601,36),(1183,360123,'安义县',3601,36),(1184,360124,'进贤县',3601,36),(1185,360202,'昌江区',3602,36),(1186,360203,'珠山区',3602,36),(1187,360222,'浮梁县',3602,36),(1188,360281,'乐平市',3602,36),(1189,360302,'安源区',3603,36),(1190,360313,'湘东区',3603,36),(1191,360321,'莲花县',3603,36),(1192,360322,'上栗县',3603,36),(1193,360323,'芦溪县',3603,36),(1194,360402,'濂溪区',3604,36),(1195,360403,'浔阳区',3604,36),(1196,360404,'柴桑区',3604,36),(1197,360423,'武宁县',3604,36),(1198,360424,'修水县',3604,36),(1199,360425,'永修县',3604,36),(1200,360426,'德安县',3604,36),(1201,360428,'都昌县',3604,36),(1202,360429,'湖口县',3604,36),(1203,360430,'彭泽县',3604,36),(1204,360481,'瑞昌市',3604,36),(1205,360482,'共青城市',3604,36),(1206,360483,'庐山市',3604,36),(1207,360502,'渝水区',3605,36),(1208,360521,'分宜县',3605,36),(1209,360602,'月湖区',3606,36),(1210,360603,'余江区',3606,36),(1211,360681,'贵溪市',3606,36),(1212,360702,'章贡区',3607,36),(1213,360703,'南康区',3607,36),(1214,360704,'赣县区',3607,36),(1215,360722,'信丰县',3607,36),(1216,360723,'大余县',3607,36),(1217,360724,'上犹县',3607,36),(1218,360725,'崇义县',3607,36),(1219,360726,'安远县',3607,36),(1220,360727,'龙南县',3607,36),(1221,360728,'定南县',3607,36),(1222,360729,'全南县',3607,36),(1223,360730,'宁都县',3607,36),(1224,360731,'于都县',3607,36),(1225,360732,'兴国县',3607,36),(1226,360733,'会昌县',3607,36),(1227,360734,'寻乌县',3607,36),(1228,360735,'石城县',3607,36),(1229,360781,'瑞金市',3607,36),(1230,360802,'吉州区',3608,36),(1231,360803,'青原区',3608,36),(1232,360821,'吉安县',3608,36),(1233,360822,'吉水县',3608,36),(1234,360823,'峡江县',3608,36),(1235,360824,'新干县',3608,36),(1236,360825,'永丰县',3608,36),(1237,360826,'泰和县',3608,36),(1238,360827,'遂川县',3608,36),(1239,360828,'万安县',3608,36),(1240,360829,'安福县',3608,36),(1241,360830,'永新县',3608,36),(1242,360881,'井冈山市',3608,36),(1243,360902,'袁州区',3609,36),(1244,360921,'奉新县',3609,36),(1245,360922,'万载县',3609,36),(1246,360923,'上高县',3609,36),(1247,360924,'宜丰县',3609,36),(1248,360925,'靖安县',3609,36),(1249,360926,'铜鼓县',3609,36),(1250,360981,'丰城市',3609,36),(1251,360982,'樟树市',3609,36),(1252,360983,'高安市',3609,36),(1253,361002,'临川区',3610,36),(1254,361003,'东乡区',3610,36),(1255,361021,'南城县',3610,36),(1256,361022,'黎川县',3610,36),(1257,361023,'南丰县',3610,36),(1258,361024,'崇仁县',3610,36),(1259,361025,'乐安县',3610,36),(1260,361026,'宜黄县',3610,36),(1261,361027,'金溪县',3610,36),(1262,361028,'资溪县',3610,36),(1263,361030,'广昌县',3610,36),(1264,361102,'信州区',3611,36),(1265,361103,'广丰区',3611,36),(1266,361121,'上饶县',3611,36),(1267,361123,'玉山县',3611,36),(1268,361124,'铅山县',3611,36),(1269,361125,'横峰县',3611,36),(1270,361126,'弋阳县',3611,36),(1271,361127,'余干县',3611,36),(1272,361128,'鄱阳县',3611,36),(1273,361129,'万年县',3611,36),(1274,361130,'婺源县',3611,36),(1275,361181,'德兴市',3611,36),(1276,370102,'历下区',3701,37),(1277,370103,'市中区',3701,37),(1278,370104,'槐荫区',3701,37),(1279,370105,'天桥区',3701,37),(1280,370112,'历城区',3701,37),(1281,370113,'长清区',3701,37),(1282,370114,'章丘区',3701,37),(1283,370115,'济阳区',3701,37),(1284,370124,'平阴县',3701,37),(1285,370126,'商河县',3701,37),(1286,370171,'济南高新技术产业开发区',3701,37),(1287,370202,'市南区',3702,37),(1288,370203,'市北区',3702,37),(1289,370211,'黄岛区',3702,37),(1290,370212,'崂山区',3702,37),(1291,370213,'李沧区',3702,37),(1292,370214,'城阳区',3702,37),(1293,370215,'即墨区',3702,37),(1294,370271,'青岛高新技术产业开发区',3702,37),(1295,370281,'胶州市',3702,37),(1296,370283,'平度市',3702,37),(1297,370285,'莱西市',3702,37),(1298,370302,'淄川区',3703,37),(1299,370303,'张店区',3703,37),(1300,370304,'博山区',3703,37),(1301,370305,'临淄区',3703,37),(1302,370306,'周村区',3703,37),(1303,370321,'桓台县',3703,37),(1304,370322,'高青县',3703,37),(1305,370323,'沂源县',3703,37),(1306,370402,'市中区',3704,37),(1307,370403,'薛城区',3704,37),(1308,370404,'峄城区',3704,37),(1309,370405,'台儿庄区',3704,37),(1310,370406,'山亭区',3704,37),(1311,370481,'滕州市',3704,37),(1312,370502,'东营区',3705,37),(1313,370503,'河口区',3705,37),(1314,370505,'垦利区',3705,37),(1315,370522,'利津县',3705,37),(1316,370523,'广饶县',3705,37),(1317,370571,'东营经济技术开发区',3705,37),(1318,370572,'东营港经济开发区',3705,37),(1319,370602,'芝罘区',3706,37),(1320,370611,'福山区',3706,37),(1321,370612,'牟平区',3706,37),(1322,370613,'莱山区',3706,37),(1323,370634,'长岛县',3706,37),(1324,370671,'烟台高新技术产业开发区',3706,37),(1325,370672,'烟台经济技术开发区',3706,37),(1326,370681,'龙口市',3706,37),(1327,370682,'莱阳市',3706,37),(1328,370683,'莱州市',3706,37),(1329,370684,'蓬莱市',3706,37),(1330,370685,'招远市',3706,37),(1331,370686,'栖霞市',3706,37),(1332,370687,'海阳市',3706,37),(1333,370702,'潍城区',3707,37),(1334,370703,'寒亭区',3707,37),(1335,370704,'坊子区',3707,37),(1336,370705,'奎文区',3707,37),(1337,370724,'临朐县',3707,37),(1338,370725,'昌乐县',3707,37),(1339,370772,'潍坊滨海经济技术开发区',3707,37),(1340,370781,'青州市',3707,37),(1341,370782,'诸城市',3707,37),(1342,370783,'寿光市',3707,37),(1343,370784,'安丘市',3707,37),(1344,370785,'高密市',3707,37),(1345,370786,'昌邑市',3707,37),(1346,370811,'任城区',3708,37),(1347,370812,'兖州区',3708,37),(1348,370826,'微山县',3708,37),(1349,370827,'鱼台县',3708,37),(1350,370828,'金乡县',3708,37),(1351,370829,'嘉祥县',3708,37),(1352,370830,'汶上县',3708,37),(1353,370831,'泗水县',3708,37),(1354,370832,'梁山县',3708,37),(1355,370871,'济宁高新技术产业开发区',3708,37),(1356,370881,'曲阜市',3708,37),(1357,370883,'邹城市',3708,37),(1358,370902,'泰山区',3709,37),(1359,370911,'岱岳区',3709,37),(1360,370921,'宁阳县',3709,37),(1361,370923,'东平县',3709,37),(1362,370982,'新泰市',3709,37),(1363,370983,'肥城市',3709,37),(1364,371002,'环翠区',3710,37),(1365,371003,'文登区',3710,37),(1366,371071,'威海火炬高技术产业开发区',3710,37),(1367,371072,'威海经济技术开发区',3710,37),(1368,371073,'威海临港经济技术开发区',3710,37),(1369,371082,'荣成市',3710,37),(1370,371083,'乳山市',3710,37),(1371,371102,'东港区',3711,37),(1372,371103,'岚山区',3711,37),(1373,371121,'五莲县',3711,37),(1374,371122,'莒县',3711,37),(1375,371171,'日照经济技术开发区',3711,37),(1376,371202,'莱城区',3712,37),(1377,371203,'钢城区',3712,37),(1378,371302,'兰山区',3713,37),(1379,371311,'罗庄区',3713,37),(1380,371312,'河东区',3713,37),(1381,371321,'沂南县',3713,37),(1382,371322,'郯城县',3713,37),(1383,371323,'沂水县',3713,37),(1384,371324,'兰陵县',3713,37),(1385,371325,'费县',3713,37),(1386,371326,'平邑县',3713,37),(1387,371327,'莒南县',3713,37),(1388,371328,'蒙阴县',3713,37),(1389,371329,'临沭县',3713,37),(1390,371371,'临沂高新技术产业开发区',3713,37),(1391,371372,'临沂经济技术开发区',3713,37),(1392,371373,'临沂临港经济开发区',3713,37),(1393,371402,'德城区',3714,37),(1394,371403,'陵城区',3714,37),(1395,371422,'宁津县',3714,37),(1396,371423,'庆云县',3714,37),(1397,371424,'临邑县',3714,37),(1398,371425,'齐河县',3714,37),(1399,371426,'平原县',3714,37),(1400,371427,'夏津县',3714,37),(1401,371428,'武城县',3714,37),(1402,371471,'德州经济技术开发区',3714,37),(1403,371472,'德州运河经济开发区',3714,37),(1404,371481,'乐陵市',3714,37),(1405,371482,'禹城市',3714,37),(1406,371502,'东昌府区',3715,37),(1407,371521,'阳谷县',3715,37),(1408,371522,'莘县',3715,37),(1409,371523,'茌平县',3715,37),(1410,371524,'东阿县',3715,37),(1411,371525,'冠县',3715,37),(1412,371526,'高唐县',3715,37),(1413,371581,'临清市',3715,37),(1414,371602,'滨城区',3716,37),(1415,371603,'沾化区',3716,37),(1416,371621,'惠民县',3716,37),(1417,371622,'阳信县',3716,37),(1418,371623,'无棣县',3716,37),(1419,371625,'博兴县',3716,37),(1420,371681,'邹平市',3716,37),(1421,371702,'牡丹区',3717,37),(1422,371703,'定陶区',3717,37),(1423,371721,'曹县',3717,37),(1424,371722,'单县',3717,37),(1425,371723,'成武县',3717,37),(1426,371724,'巨野县',3717,37),(1427,371725,'郓城县',3717,37),(1428,371726,'鄄城县',3717,37),(1429,371728,'东明县',3717,37),(1430,371771,'菏泽经济技术开发区',3717,37),(1431,371772,'菏泽高新技术开发区',3717,37),(1432,410102,'中原区',4101,41),(1433,410103,'二七区',4101,41),(1434,410104,'管城回族区',4101,41),(1435,410105,'金水区',4101,41),(1436,410106,'上街区',4101,41),(1437,410108,'惠济区',4101,41),(1438,410122,'中牟县',4101,41),(1439,410171,'郑州经济技术开发区',4101,41),(1440,410172,'郑州高新技术产业开发区',4101,41),(1441,410173,'郑州航空港经济综合实验区',4101,41),(1442,410181,'巩义市',4101,41),(1443,410182,'荥阳市',4101,41),(1444,410183,'新密市',4101,41),(1445,410184,'新郑市',4101,41),(1446,410185,'登封市',4101,41),(1447,410202,'龙亭区',4102,41),(1448,410203,'顺河回族区',4102,41),(1449,410204,'鼓楼区',4102,41),(1450,410205,'禹王台区',4102,41),(1451,410212,'祥符区',4102,41),(1452,410221,'杞县',4102,41),(1453,410222,'通许县',4102,41),(1454,410223,'尉氏县',4102,41),(1455,410225,'兰考县',4102,41),(1456,410302,'老城区',4103,41),(1457,410303,'西工区',4103,41),(1458,410304,'瀍河回族区',4103,41),(1459,410305,'涧西区',4103,41),(1460,410306,'吉利区',4103,41),(1461,410311,'洛龙区',4103,41),(1462,410322,'孟津县',4103,41),(1463,410323,'新安县',4103,41),(1464,410324,'栾川县',4103,41),(1465,410325,'嵩县',4103,41),(1466,410326,'汝阳县',4103,41),(1467,410327,'宜阳县',4103,41),(1468,410328,'洛宁县',4103,41),(1469,410329,'伊川县',4103,41),(1470,410371,'洛阳高新技术产业开发区',4103,41),(1471,410381,'偃师市',4103,41),(1472,410402,'新华区',4104,41),(1473,410403,'卫东区',4104,41),(1474,410404,'石龙区',4104,41),(1475,410411,'湛河区',4104,41),(1476,410421,'宝丰县',4104,41),(1477,410422,'叶县',4104,41),(1478,410423,'鲁山县',4104,41),(1479,410425,'郏县',4104,41),(1480,410471,'平顶山高新技术产业开发区',4104,41),(1481,410472,'平顶山市新城区',4104,41),(1482,410481,'舞钢市',4104,41),(1483,410482,'汝州市',4104,41),(1484,410502,'文峰区',4105,41),(1485,410503,'北关区',4105,41),(1486,410505,'殷都区',4105,41),(1487,410506,'龙安区',4105,41),(1488,410522,'安阳县',4105,41),(1489,410523,'汤阴县',4105,41),(1490,410526,'滑县',4105,41),(1491,410527,'内黄县',4105,41),(1492,410571,'安阳高新技术产业开发区',4105,41),(1493,410581,'林州市',4105,41),(1494,410602,'鹤山区',4106,41),(1495,410603,'山城区',4106,41),(1496,410611,'淇滨区',4106,41),(1497,410621,'浚县',4106,41),(1498,410622,'淇县',4106,41),(1499,410671,'鹤壁经济技术开发区',4106,41),(1500,410702,'红旗区',4107,41),(1501,410703,'卫滨区',4107,41),(1502,410704,'凤泉区',4107,41),(1503,410711,'牧野区',4107,41),(1504,410721,'新乡县',4107,41),(1505,410724,'获嘉县',4107,41),(1506,410725,'原阳县',4107,41),(1507,410726,'延津县',4107,41),(1508,410727,'封丘县',4107,41),(1509,410728,'长垣县',4107,41),(1510,410771,'新乡高新技术产业开发区',4107,41),(1511,410772,'新乡经济技术开发区',4107,41),(1512,410773,'新乡市平原城乡一体化示范区',4107,41),(1513,410781,'卫辉市',4107,41),(1514,410782,'辉县市',4107,41),(1515,410802,'解放区',4108,41),(1516,410803,'中站区',4108,41),(1517,410804,'马村区',4108,41),(1518,410811,'山阳区',4108,41),(1519,410821,'修武县',4108,41),(1520,410822,'博爱县',4108,41),(1521,410823,'武陟县',4108,41),(1522,410825,'温县',4108,41),(1523,410871,'焦作城乡一体化示范区',4108,41),(1524,410882,'沁阳市',4108,41),(1525,410883,'孟州市',4108,41),(1526,410902,'华龙区',4109,41),(1527,410922,'清丰县',4109,41),(1528,410923,'南乐县',4109,41),(1529,410926,'范县',4109,41),(1530,410927,'台前县',4109,41),(1531,410928,'濮阳县',4109,41),(1532,410971,'河南濮阳工业园区',4109,41),(1533,410972,'濮阳经济技术开发区',4109,41),(1534,411002,'魏都区',4110,41),(1535,411003,'建安区',4110,41),(1536,411024,'鄢陵县',4110,41),(1537,411025,'襄城县',4110,41),(1538,411071,'许昌经济技术开发区',4110,41),(1539,411081,'禹州市',4110,41),(1540,411082,'长葛市',4110,41),(1541,411102,'源汇区',4111,41),(1542,411103,'郾城区',4111,41),(1543,411104,'召陵区',4111,41),(1544,411121,'舞阳县',4111,41),(1545,411122,'临颍县',4111,41),(1546,411171,'漯河经济技术开发区',4111,41),(1547,411202,'湖滨区',4112,41),(1548,411203,'陕州区',4112,41),(1549,411221,'渑池县',4112,41),(1550,411224,'卢氏县',4112,41),(1551,411271,'河南三门峡经济开发区',4112,41),(1552,411281,'义马市',4112,41),(1553,411282,'灵宝市',4112,41),(1554,411302,'宛城区',4113,41),(1555,411303,'卧龙区',4113,41),(1556,411321,'南召县',4113,41),(1557,411322,'方城县',4113,41),(1558,411323,'西峡县',4113,41),(1559,411324,'镇平县',4113,41),(1560,411325,'内乡县',4113,41),(1561,411326,'淅川县',4113,41),(1562,411327,'社旗县',4113,41),(1563,411328,'唐河县',4113,41),(1564,411329,'新野县',4113,41),(1565,411330,'桐柏县',4113,41),(1566,411371,'南阳高新技术产业开发区',4113,41),(1567,411372,'南阳市城乡一体化示范区',4113,41),(1568,411381,'邓州市',4113,41),(1569,411402,'梁园区',4114,41),(1570,411403,'睢阳区',4114,41),(1571,411421,'民权县',4114,41),(1572,411422,'睢县',4114,41),(1573,411423,'宁陵县',4114,41),(1574,411424,'柘城县',4114,41),(1575,411425,'虞城县',4114,41),(1576,411426,'夏邑县',4114,41),(1577,411471,'豫东综合物流产业聚集区',4114,41),(1578,411472,'河南商丘经济开发区',4114,41),(1579,411481,'永城市',4114,41),(1580,411502,'浉河区',4115,41),(1581,411503,'平桥区',4115,41),(1582,411521,'罗山县',4115,41),(1583,411522,'光山县',4115,41),(1584,411523,'新县',4115,41),(1585,411524,'商城县',4115,41),(1586,411525,'固始县',4115,41),(1587,411526,'潢川县',4115,41),(1588,411527,'淮滨县',4115,41),(1589,411528,'息县',4115,41),(1590,411571,'信阳高新技术产业开发区',4115,41),(1591,411602,'川汇区',4116,41),(1592,411621,'扶沟县',4116,41),(1593,411622,'西华县',4116,41),(1594,411623,'商水县',4116,41),(1595,411624,'沈丘县',4116,41),(1596,411625,'郸城县',4116,41),(1597,411626,'淮阳县',4116,41),(1598,411627,'太康县',4116,41),(1599,411628,'鹿邑县',4116,41),(1600,411671,'河南周口经济开发区',4116,41),(1601,411681,'项城市',4116,41),(1602,411702,'驿城区',4117,41),(1603,411721,'西平县',4117,41),(1604,411722,'上蔡县',4117,41),(1605,411723,'平舆县',4117,41),(1606,411724,'正阳县',4117,41),(1607,411725,'确山县',4117,41),(1608,411726,'泌阳县',4117,41),(1609,411727,'汝南县',4117,41),(1610,411728,'遂平县',4117,41),(1611,411729,'新蔡县',4117,41),(1612,411771,'河南驻马店经济开发区',4117,41),(1613,419001,'济源市',4190,41),(1614,420102,'江岸区',4201,42),(1615,420103,'江汉区',4201,42),(1616,420104,'硚口区',4201,42),(1617,420105,'汉阳区',4201,42),(1618,420106,'武昌区',4201,42),(1619,420107,'青山区',4201,42),(1620,420111,'洪山区',4201,42),(1621,420112,'东西湖区',4201,42),(1622,420113,'汉南区',4201,42),(1623,420114,'蔡甸区',4201,42),(1624,420115,'江夏区',4201,42),(1625,420116,'黄陂区',4201,42),(1626,420117,'新洲区',4201,42),(1627,420202,'黄石港区',4202,42),(1628,420203,'西塞山区',4202,42),(1629,420204,'下陆区',4202,42),(1630,420205,'铁山区',4202,42),(1631,420222,'阳新县',4202,42),(1632,420281,'大冶市',4202,42),(1633,420302,'茅箭区',4203,42),(1634,420303,'张湾区',4203,42),(1635,420304,'郧阳区',4203,42),(1636,420322,'郧西县',4203,42),(1637,420323,'竹山县',4203,42),(1638,420324,'竹溪县',4203,42),(1639,420325,'房县',4203,42),(1640,420381,'丹江口市',4203,42),(1641,420502,'西陵区',4205,42),(1642,420503,'伍家岗区',4205,42),(1643,420504,'点军区',4205,42),(1644,420505,'猇亭区',4205,42),(1645,420506,'夷陵区',4205,42),(1646,420525,'远安县',4205,42),(1647,420526,'兴山县',4205,42),(1648,420527,'秭归县',4205,42),(1649,420528,'长阳土家族自治县',4205,42),(1650,420529,'五峰土家族自治县',4205,42),(1651,420581,'宜都市',4205,42),(1652,420582,'当阳市',4205,42),(1653,420583,'枝江市',4205,42),(1654,420602,'襄城区',4206,42),(1655,420606,'樊城区',4206,42),(1656,420607,'襄州区',4206,42),(1657,420624,'南漳县',4206,42),(1658,420625,'谷城县',4206,42),(1659,420626,'保康县',4206,42),(1660,420682,'老河口市',4206,42),(1661,420683,'枣阳市',4206,42),(1662,420684,'宜城市',4206,42),(1663,420702,'梁子湖区',4207,42),(1664,420703,'华容区',4207,42),(1665,420704,'鄂城区',4207,42),(1666,420802,'东宝区',4208,42),(1667,420804,'掇刀区',4208,42),(1668,420822,'沙洋县',4208,42),(1669,420881,'钟祥市',4208,42),(1670,420882,'京山市',4208,42),(1671,420902,'孝南区',4209,42),(1672,420921,'孝昌县',4209,42),(1673,420922,'大悟县',4209,42),(1674,420923,'云梦县',4209,42),(1675,420981,'应城市',4209,42),(1676,420982,'安陆市',4209,42),(1677,420984,'汉川市',4209,42),(1678,421002,'沙市区',4210,42),(1679,421003,'荆州区',4210,42),(1680,421022,'公安县',4210,42),(1681,421023,'监利县',4210,42),(1682,421024,'江陵县',4210,42),(1683,421071,'荆州经济技术开发区',4210,42),(1684,421081,'石首市',4210,42),(1685,421083,'洪湖市',4210,42),(1686,421087,'松滋市',4210,42),(1687,421102,'黄州区',4211,42),(1688,421121,'团风县',4211,42),(1689,421122,'红安县',4211,42),(1690,421123,'罗田县',4211,42),(1691,421124,'英山县',4211,42),(1692,421125,'浠水县',4211,42),(1693,421126,'蕲春县',4211,42),(1694,421127,'黄梅县',4211,42),(1695,421171,'龙感湖管理区',4211,42),(1696,421181,'麻城市',4211,42),(1697,421182,'武穴市',4211,42),(1698,421202,'咸安区',4212,42),(1699,421221,'嘉鱼县',4212,42),(1700,421222,'通城县',4212,42),(1701,421223,'崇阳县',4212,42),(1702,421224,'通山县',4212,42),(1703,421281,'赤壁市',4212,42),(1704,421303,'曾都区',4213,42),(1705,421321,'随县',4213,42),(1706,421381,'广水市',4213,42),(1707,422801,'恩施市',4228,42),(1708,422802,'利川市',4228,42),(1709,422822,'建始县',4228,42),(1710,422823,'巴东县',4228,42),(1711,422825,'宣恩县',4228,42),(1712,422826,'咸丰县',4228,42),(1713,422827,'来凤县',4228,42),(1714,422828,'鹤峰县',4228,42),(1715,429004,'仙桃市',4290,42),(1716,429005,'潜江市',4290,42),(1717,429006,'天门市',4290,42),(1718,429021,'神农架林区',4290,42),(1719,430102,'芙蓉区',4301,43),(1720,430103,'天心区',4301,43),(1721,430104,'岳麓区',4301,43),(1722,430105,'开福区',4301,43),(1723,430111,'雨花区',4301,43),(1724,430112,'望城区',4301,43),(1725,430121,'长沙县',4301,43),(1726,430181,'浏阳市',4301,43),(1727,430182,'宁乡市',4301,43),(1728,430202,'荷塘区',4302,43),(1729,430203,'芦淞区',4302,43),(1730,430204,'石峰区',4302,43),(1731,430211,'天元区',4302,43),(1732,430212,'渌口区',4302,43),(1733,430223,'攸县',4302,43),(1734,430224,'茶陵县',4302,43),(1735,430225,'炎陵县',4302,43),(1736,430271,'云龙示范区',4302,43),(1737,430281,'醴陵市',4302,43),(1738,430302,'雨湖区',4303,43),(1739,430304,'岳塘区',4303,43),(1740,430321,'湘潭县',4303,43),(1741,430371,'湖南湘潭高新技术产业园区',4303,43),(1742,430372,'湘潭昭山示范区',4303,43),(1743,430373,'湘潭九华示范区',4303,43),(1744,430381,'湘乡市',4303,43),(1745,430382,'韶山市',4303,43),(1746,430405,'珠晖区',4304,43),(1747,430406,'雁峰区',4304,43),(1748,430407,'石鼓区',4304,43),(1749,430408,'蒸湘区',4304,43),(1750,430412,'南岳区',4304,43),(1751,430421,'衡阳县',4304,43),(1752,430422,'衡南县',4304,43),(1753,430423,'衡山县',4304,43),(1754,430424,'衡东县',4304,43),(1755,430426,'祁东县',4304,43),(1756,430471,'衡阳综合保税区',4304,43),(1757,430472,'湖南衡阳高新技术产业园区',4304,43),(1758,430473,'湖南衡阳松木经济开发区',4304,43),(1759,430481,'耒阳市',4304,43),(1760,430482,'常宁市',4304,43),(1761,430502,'双清区',4305,43),(1762,430503,'大祥区',4305,43),(1763,430511,'北塔区',4305,43),(1764,430521,'邵东县',4305,43),(1765,430522,'新邵县',4305,43),(1766,430523,'邵阳县',4305,43),(1767,430524,'隆回县',4305,43),(1768,430525,'洞口县',4305,43),(1769,430527,'绥宁县',4305,43),(1770,430528,'新宁县',4305,43),(1771,430529,'城步苗族自治县',4305,43),(1772,430581,'武冈市',4305,43),(1773,430602,'岳阳楼区',4306,43),(1774,430603,'云溪区',4306,43),(1775,430611,'君山区',4306,43),(1776,430621,'岳阳县',4306,43),(1777,430623,'华容县',4306,43),(1778,430624,'湘阴县',4306,43),(1779,430626,'平江县',4306,43),(1780,430671,'岳阳市屈原管理区',4306,43),(1781,430681,'汨罗市',4306,43),(1782,430682,'临湘市',4306,43),(1783,430702,'武陵区',4307,43),(1784,430703,'鼎城区',4307,43),(1785,430721,'安乡县',4307,43),(1786,430722,'汉寿县',4307,43),(1787,430723,'澧县',4307,43),(1788,430724,'临澧县',4307,43),(1789,430725,'桃源县',4307,43),(1790,430726,'石门县',4307,43),(1791,430771,'常德市西洞庭管理区',4307,43),(1792,430781,'津市市',4307,43),(1793,430802,'永定区',4308,43),(1794,430811,'武陵源区',4308,43),(1795,430821,'慈利县',4308,43),(1796,430822,'桑植县',4308,43),(1797,430902,'资阳区',4309,43),(1798,430903,'赫山区',4309,43),(1799,430921,'南县',4309,43),(1800,430922,'桃江县',4309,43),(1801,430923,'安化县',4309,43),(1802,430971,'益阳市大通湖管理区',4309,43),(1803,430972,'湖南益阳高新技术产业园区',4309,43),(1804,430981,'沅江市',4309,43),(1805,431002,'北湖区',4310,43),(1806,431003,'苏仙区',4310,43),(1807,431021,'桂阳县',4310,43),(1808,431022,'宜章县',4310,43),(1809,431023,'永兴县',4310,43),(1810,431024,'嘉禾县',4310,43),(1811,431025,'临武县',4310,43),(1812,431026,'汝城县',4310,43),(1813,431027,'桂东县',4310,43),(1814,431028,'安仁县',4310,43),(1815,431081,'资兴市',4310,43),(1816,431102,'零陵区',4311,43),(1817,431103,'冷水滩区',4311,43),(1818,431121,'祁阳县',4311,43),(1819,431122,'东安县',4311,43),(1820,431123,'双牌县',4311,43),(1821,431124,'道县',4311,43),(1822,431125,'江永县',4311,43),(1823,431126,'宁远县',4311,43),(1824,431127,'蓝山县',4311,43),(1825,431128,'新田县',4311,43),(1826,431129,'江华瑶族自治县',4311,43),(1827,431171,'永州经济技术开发区',4311,43),(1828,431172,'永州市金洞管理区',4311,43),(1829,431173,'永州市回龙圩管理区',4311,43),(1830,431202,'鹤城区',4312,43),(1831,431221,'中方县',4312,43),(1832,431222,'沅陵县',4312,43),(1833,431223,'辰溪县',4312,43),(1834,431224,'溆浦县',4312,43),(1835,431225,'会同县',4312,43),(1836,431226,'麻阳苗族自治县',4312,43),(1837,431227,'新晃侗族自治县',4312,43),(1838,431228,'芷江侗族自治县',4312,43),(1839,431229,'靖州苗族侗族自治县',4312,43),(1840,431230,'通道侗族自治县',4312,43),(1841,431271,'怀化市洪江管理区',4312,43),(1842,431281,'洪江市',4312,43),(1843,431302,'娄星区',4313,43),(1844,431321,'双峰县',4313,43),(1845,431322,'新化县',4313,43),(1846,431381,'冷水江市',4313,43),(1847,431382,'涟源市',4313,43),(1848,433101,'吉首市',4331,43),(1849,433122,'泸溪县',4331,43),(1850,433123,'凤凰县',4331,43),(1851,433124,'花垣县',4331,43),(1852,433125,'保靖县',4331,43),(1853,433126,'古丈县',4331,43),(1854,433127,'永顺县',4331,43),(1855,433130,'龙山县',4331,43),(1856,433172,'湖南吉首经济开发区',4331,43),(1857,433173,'湖南永顺经济开发区',4331,43),(1858,440103,'荔湾区',4401,44),(1859,440104,'越秀区',4401,44),(1860,440105,'海珠区',4401,44),(1861,440106,'天河区',4401,44),(1862,440111,'白云区',4401,44),(1863,440112,'黄埔区',4401,44),(1864,440113,'番禺区',4401,44),(1865,440114,'花都区',4401,44),(1866,440115,'南沙区',4401,44),(1867,440117,'从化区',4401,44),(1868,440118,'增城区',4401,44),(1869,440203,'武江区',4402,44),(1870,440204,'浈江区',4402,44),(1871,440205,'曲江区',4402,44),(1872,440222,'始兴县',4402,44),(1873,440224,'仁化县',4402,44),(1874,440229,'翁源县',4402,44),(1875,440232,'乳源瑶族自治县',4402,44),(1876,440233,'新丰县',4402,44),(1877,440281,'乐昌市',4402,44),(1878,440282,'南雄市',4402,44),(1879,440303,'罗湖区',4403,44),(1880,440304,'福田区',4403,44),(1881,440305,'南山区',4403,44),(1882,440306,'宝安区',4403,44),(1883,440307,'龙岗区',4403,44),(1884,440308,'盐田区',4403,44),(1885,440309,'龙华区',4403,44),(1886,440310,'坪山区',4403,44),(1887,440311,'光明区',4403,44),(1888,440402,'香洲区',4404,44),(1889,440403,'斗门区',4404,44),(1890,440404,'金湾区',4404,44),(1891,440507,'龙湖区',4405,44),(1892,440511,'金平区',4405,44),(1893,440512,'濠江区',4405,44),(1894,440513,'潮阳区',4405,44),(1895,440514,'潮南区',4405,44),(1896,440515,'澄海区',4405,44),(1897,440523,'南澳县',4405,44),(1898,440604,'禅城区',4406,44),(1899,440605,'南海区',4406,44),(1900,440606,'顺德区',4406,44),(1901,440607,'三水区',4406,44),(1902,440608,'高明区',4406,44),(1903,440703,'蓬江区',4407,44),(1904,440704,'江海区',4407,44),(1905,440705,'新会区',4407,44),(1906,440781,'台山市',4407,44),(1907,440783,'开平市',4407,44),(1908,440784,'鹤山市',4407,44),(1909,440785,'恩平市',4407,44),(1910,440802,'赤坎区',4408,44),(1911,440803,'霞山区',4408,44),(1912,440804,'坡头区',4408,44),(1913,440811,'麻章区',4408,44),(1914,440823,'遂溪县',4408,44),(1915,440825,'徐闻县',4408,44),(1916,440881,'廉江市',4408,44),(1917,440882,'雷州市',4408,44),(1918,440883,'吴川市',4408,44),(1919,440902,'茂南区',4409,44),(1920,440904,'电白区',4409,44),(1921,440981,'高州市',4409,44),(1922,440982,'化州市',4409,44),(1923,440983,'信宜市',4409,44),(1924,441202,'端州区',4412,44),(1925,441203,'鼎湖区',4412,44),(1926,441204,'高要区',4412,44),(1927,441223,'广宁县',4412,44),(1928,441224,'怀集县',4412,44),(1929,441225,'封开县',4412,44),(1930,441226,'德庆县',4412,44),(1931,441284,'四会市',4412,44),(1932,441302,'惠城区',4413,44),(1933,441303,'惠阳区',4413,44),(1934,441322,'博罗县',4413,44),(1935,441323,'惠东县',4413,44),(1936,441324,'龙门县',4413,44),(1937,441402,'梅江区',4414,44),(1938,441403,'梅县区',4414,44),(1939,441422,'大埔县',4414,44),(1940,441423,'丰顺县',4414,44),(1941,441424,'五华县',4414,44),(1942,441426,'平远县',4414,44),(1943,441427,'蕉岭县',4414,44),(1944,441481,'兴宁市',4414,44),(1945,441502,'城区',4415,44),(1946,441521,'海丰县',4415,44),(1947,441523,'陆河县',4415,44),(1948,441581,'陆丰市',4415,44),(1949,441602,'源城区',4416,44),(1950,441621,'紫金县',4416,44),(1951,441622,'龙川县',4416,44),(1952,441623,'连平县',4416,44),(1953,441624,'和平县',4416,44),(1954,441625,'东源县',4416,44),(1955,441702,'江城区',4417,44),(1956,441704,'阳东区',4417,44),(1957,441721,'阳西县',4417,44),(1958,441781,'阳春市',4417,44),(1959,441802,'清城区',4418,44),(1960,441803,'清新区',4418,44),(1961,441821,'佛冈县',4418,44),(1962,441823,'阳山县',4418,44),(1963,441825,'连山壮族瑶族自治县',4418,44),(1964,441826,'连南瑶族自治县',4418,44),(1965,441881,'英德市',4418,44),(1966,441882,'连州市',4418,44),(1967,441900,'东莞市',4419,44),(1968,442000,'中山市',4420,44),(1969,445102,'湘桥区',4451,44),(1970,445103,'潮安区',4451,44),(1971,445122,'饶平县',4451,44),(1972,445202,'榕城区',4452,44),(1973,445203,'揭东区',4452,44),(1974,445222,'揭西县',4452,44),(1975,445224,'惠来县',4452,44),(1976,445281,'普宁市',4452,44),(1977,445302,'云城区',4453,44),(1978,445303,'云安区',4453,44),(1979,445321,'新兴县',4453,44),(1980,445322,'郁南县',4453,44),(1981,445381,'罗定市',4453,44),(1982,450102,'兴宁区',4501,45),(1983,450103,'青秀区',4501,45),(1984,450105,'江南区',4501,45),(1985,450107,'西乡塘区',4501,45),(1986,450108,'良庆区',4501,45),(1987,450109,'邕宁区',4501,45),(1988,450110,'武鸣区',4501,45),(1989,450123,'隆安县',4501,45),(1990,450124,'马山县',4501,45),(1991,450125,'上林县',4501,45),(1992,450126,'宾阳县',4501,45),(1993,450127,'横县',4501,45),(1994,450202,'城中区',4502,45),(1995,450203,'鱼峰区',4502,45),(1996,450204,'柳南区',4502,45),(1997,450205,'柳北区',4502,45),(1998,450206,'柳江区',4502,45),(1999,450222,'柳城县',4502,45),(2000,450223,'鹿寨县',4502,45),(2001,450224,'融安县',4502,45),(2002,450225,'融水苗族自治县',4502,45),(2003,450226,'三江侗族自治县',4502,45),(2004,450302,'秀峰区',4503,45),(2005,450303,'叠彩区',4503,45),(2006,450304,'象山区',4503,45),(2007,450305,'七星区',4503,45),(2008,450311,'雁山区',4503,45),(2009,450312,'临桂区',4503,45),(2010,450321,'阳朔县',4503,45),(2011,450323,'灵川县',4503,45),(2012,450324,'全州县',4503,45),(2013,450325,'兴安县',4503,45),(2014,450326,'永福县',4503,45),(2015,450327,'灌阳县',4503,45),(2016,450328,'龙胜各族自治县',4503,45),(2017,450329,'资源县',4503,45),(2018,450330,'平乐县',4503,45),(2019,450332,'恭城瑶族自治县',4503,45),(2020,450381,'荔浦市',4503,45),(2021,450403,'万秀区',4504,45),(2022,450405,'长洲区',4504,45),(2023,450406,'龙圩区',4504,45),(2024,450421,'苍梧县',4504,45),(2025,450422,'藤县',4504,45),(2026,450423,'蒙山县',4504,45),(2027,450481,'岑溪市',4504,45),(2028,450502,'海城区',4505,45),(2029,450503,'银海区',4505,45),(2030,450512,'铁山港区',4505,45),(2031,450521,'合浦县',4505,45),(2032,450602,'港口区',4506,45),(2033,450603,'防城区',4506,45),(2034,450621,'上思县',4506,45),(2035,450681,'东兴市',4506,45),(2036,450702,'钦南区',4507,45),(2037,450703,'钦北区',4507,45),(2038,450721,'灵山县',4507,45),(2039,450722,'浦北县',4507,45),(2040,450802,'港北区',4508,45),(2041,450803,'港南区',4508,45),(2042,450804,'覃塘区',4508,45),(2043,450821,'平南县',4508,45),(2044,450881,'桂平市',4508,45),(2045,450902,'玉州区',4509,45),(2046,450903,'福绵区',4509,45),(2047,450921,'容县',4509,45),(2048,450922,'陆川县',4509,45),(2049,450923,'博白县',4509,45),(2050,450924,'兴业县',4509,45),(2051,450981,'北流市',4509,45),(2052,451002,'右江区',4510,45),(2053,451021,'田阳县',4510,45),(2054,451022,'田东县',4510,45),(2055,451023,'平果县',4510,45),(2056,451024,'德保县',4510,45),(2057,451026,'那坡县',4510,45),(2058,451027,'凌云县',4510,45),(2059,451028,'乐业县',4510,45),(2060,451029,'田林县',4510,45),(2061,451030,'西林县',4510,45),(2062,451031,'隆林各族自治县',4510,45),(2063,451081,'靖西市',4510,45),(2064,451102,'八步区',4511,45),(2065,451103,'平桂区',4511,45),(2066,451121,'昭平县',4511,45),(2067,451122,'钟山县',4511,45),(2068,451123,'富川瑶族自治县',4511,45),(2069,451202,'金城江区',4512,45),(2070,451203,'宜州区',4512,45),(2071,451221,'南丹县',4512,45),(2072,451222,'天峨县',4512,45),(2073,451223,'凤山县',4512,45),(2074,451224,'东兰县',4512,45),(2075,451225,'罗城仫佬族自治县',4512,45),(2076,451226,'环江毛南族自治县',4512,45),(2077,451227,'巴马瑶族自治县',4512,45),(2078,451228,'都安瑶族自治县',4512,45),(2079,451229,'大化瑶族自治县',4512,45),(2080,451302,'兴宾区',4513,45),(2081,451321,'忻城县',4513,45),(2082,451322,'象州县',4513,45),(2083,451323,'武宣县',4513,45),(2084,451324,'金秀瑶族自治县',4513,45),(2085,451381,'合山市',4513,45),(2086,451402,'江州区',4514,45),(2087,451421,'扶绥县',4514,45),(2088,451422,'宁明县',4514,45),(2089,451423,'龙州县',4514,45),(2090,451424,'大新县',4514,45),(2091,451425,'天等县',4514,45),(2092,451481,'凭祥市',4514,45),(2093,460105,'秀英区',4601,46),(2094,460106,'龙华区',4601,46),(2095,460107,'琼山区',4601,46),(2096,460108,'美兰区',4601,46),(2097,460202,'海棠区',4602,46),(2098,460203,'吉阳区',4602,46),(2099,460204,'天涯区',4602,46),(2100,460205,'崖州区',4602,46),(2101,460321,'西沙群岛',4603,46),(2102,460322,'南沙群岛',4603,46),(2103,460323,'中沙群岛的岛礁及其海域',4603,46),(2104,460400,'儋州市',4604,46),(2105,469001,'五指山市',4690,46),(2106,469002,'琼海市',4690,46),(2107,469005,'文昌市',4690,46),(2108,469006,'万宁市',4690,46),(2109,469007,'东方市',4690,46),(2110,469021,'定安县',4690,46),(2111,469022,'屯昌县',4690,46),(2112,469023,'澄迈县',4690,46),(2113,469024,'临高县',4690,46),(2114,469025,'白沙黎族自治县',4690,46),(2115,469026,'昌江黎族自治县',4690,46),(2116,469027,'乐东黎族自治县',4690,46),(2117,469028,'陵水黎族自治县',4690,46),(2118,469029,'保亭黎族苗族自治县',4690,46),(2119,469030,'琼中黎族苗族自治县',4690,46),(2120,500101,'万州区',5001,50),(2121,500102,'涪陵区',5001,50),(2122,500103,'渝中区',5001,50),(2123,500104,'大渡口区',5001,50),(2124,500105,'江北区',5001,50),(2125,500106,'沙坪坝区',5001,50),(2126,500107,'九龙坡区',5001,50),(2127,500108,'南岸区',5001,50),(2128,500109,'北碚区',5001,50),(2129,500110,'綦江区',5001,50),(2130,500111,'大足区',5001,50),(2131,500112,'渝北区',5001,50),(2132,500113,'巴南区',5001,50),(2133,500114,'黔江区',5001,50),(2134,500115,'长寿区',5001,50),(2135,500116,'江津区',5001,50),(2136,500117,'合川区',5001,50),(2137,500118,'永川区',5001,50),(2138,500119,'南川区',5001,50),(2139,500120,'璧山区',5001,50),(2140,500151,'铜梁区',5001,50),(2141,500152,'潼南区',5001,50),(2142,500153,'荣昌区',5001,50),(2143,500154,'开州区',5001,50),(2144,500155,'梁平区',5001,50),(2145,500156,'武隆区',5001,50),(2146,500229,'城口县',5002,50),(2147,500230,'丰都县',5002,50),(2148,500231,'垫江县',5002,50),(2149,500233,'忠县',5002,50),(2150,500235,'云阳县',5002,50),(2151,500236,'奉节县',5002,50),(2152,500237,'巫山县',5002,50),(2153,500238,'巫溪县',5002,50),(2154,500240,'石柱土家族自治县',5002,50),(2155,500241,'秀山土家族苗族自治县',5002,50),(2156,500242,'酉阳土家族苗族自治县',5002,50),(2157,500243,'彭水苗族土家族自治县',5002,50),(2158,510104,'锦江区',5101,51),(2159,510105,'青羊区',5101,51),(2160,510106,'金牛区',5101,51),(2161,510107,'武侯区',5101,51),(2162,510108,'成华区',5101,51),(2163,510112,'龙泉驿区',5101,51),(2164,510113,'青白江区',5101,51),(2165,510114,'新都区',5101,51),(2166,510115,'温江区',5101,51),(2167,510116,'双流区',5101,51),(2168,510117,'郫都区',5101,51),(2169,510121,'金堂县',5101,51),(2170,510129,'大邑县',5101,51),(2171,510131,'蒲江县',5101,51),(2172,510132,'新津县',5101,51),(2173,510181,'都江堰市',5101,51),(2174,510182,'彭州市',5101,51),(2175,510183,'邛崃市',5101,51),(2176,510184,'崇州市',5101,51),(2177,510185,'简阳市',5101,51),(2178,510302,'自流井区',5103,51),(2179,510303,'贡井区',5103,51),(2180,510304,'大安区',5103,51),(2181,510311,'沿滩区',5103,51),(2182,510321,'荣县',5103,51),(2183,510322,'富顺县',5103,51),(2184,510402,'东区',5104,51),(2185,510403,'西区',5104,51),(2186,510411,'仁和区',5104,51),(2187,510421,'米易县',5104,51),(2188,510422,'盐边县',5104,51),(2189,510502,'江阳区',5105,51),(2190,510503,'纳溪区',5105,51),(2191,510504,'龙马潭区',5105,51),(2192,510521,'泸县',5105,51),(2193,510522,'合江县',5105,51),(2194,510524,'叙永县',5105,51),(2195,510525,'古蔺县',5105,51),(2196,510603,'旌阳区',5106,51),(2197,510604,'罗江区',5106,51),(2198,510623,'中江县',5106,51),(2199,510681,'广汉市',5106,51),(2200,510682,'什邡市',5106,51),(2201,510683,'绵竹市',5106,51),(2202,510703,'涪城区',5107,51),(2203,510704,'游仙区',5107,51),(2204,510705,'安州区',5107,51),(2205,510722,'三台县',5107,51),(2206,510723,'盐亭县',5107,51),(2207,510725,'梓潼县',5107,51),(2208,510726,'北川羌族自治县',5107,51),(2209,510727,'平武县',5107,51),(2210,510781,'江油市',5107,51),(2211,510802,'利州区',5108,51),(2212,510811,'昭化区',5108,51),(2213,510812,'朝天区',5108,51),(2214,510821,'旺苍县',5108,51),(2215,510822,'青川县',5108,51),(2216,510823,'剑阁县',5108,51),(2217,510824,'苍溪县',5108,51),(2218,510903,'船山区',5109,51),(2219,510904,'安居区',5109,51),(2220,510921,'蓬溪县',5109,51),(2221,510922,'射洪县',5109,51),(2222,510923,'大英县',5109,51),(2223,511002,'市中区',5110,51),(2224,511011,'东兴区',5110,51),(2225,511024,'威远县',5110,51),(2226,511025,'资中县',5110,51),(2227,511071,'内江经济开发区',5110,51),(2228,511083,'隆昌市',5110,51),(2229,511102,'市中区',5111,51),(2230,511111,'沙湾区',5111,51),(2231,511112,'五通桥区',5111,51),(2232,511113,'金口河区',5111,51),(2233,511123,'犍为县',5111,51),(2234,511124,'井研县',5111,51),(2235,511126,'夹江县',5111,51),(2236,511129,'沐川县',5111,51),(2237,511132,'峨边彝族自治县',5111,51),(2238,511133,'马边彝族自治县',5111,51),(2239,511181,'峨眉山市',5111,51),(2240,511302,'顺庆区',5113,51),(2241,511303,'高坪区',5113,51),(2242,511304,'嘉陵区',5113,51),(2243,511321,'南部县',5113,51),(2244,511322,'营山县',5113,51),(2245,511323,'蓬安县',5113,51),(2246,511324,'仪陇县',5113,51),(2247,511325,'西充县',5113,51),(2248,511381,'阆中市',5113,51),(2249,511402,'东坡区',5114,51),(2250,511403,'彭山区',5114,51),(2251,511421,'仁寿县',5114,51),(2252,511423,'洪雅县',5114,51),(2253,511424,'丹棱县',5114,51),(2254,511425,'青神县',5114,51),(2255,511502,'翠屏区',5115,51),(2256,511503,'南溪区',5115,51),(2257,511504,'叙州区',5115,51),(2258,511523,'江安县',5115,51),(2259,511524,'长宁县',5115,51),(2260,511525,'高县',5115,51),(2261,511526,'珙县',5115,51),(2262,511527,'筠连县',5115,51),(2263,511528,'兴文县',5115,51),(2264,511529,'屏山县',5115,51),(2265,511602,'广安区',5116,51),(2266,511603,'前锋区',5116,51),(2267,511621,'岳池县',5116,51),(2268,511622,'武胜县',5116,51),(2269,511623,'邻水县',5116,51),(2270,511681,'华蓥市',5116,51),(2271,511702,'通川区',5117,51),(2272,511703,'达川区',5117,51),(2273,511722,'宣汉县',5117,51),(2274,511723,'开江县',5117,51),(2275,511724,'大竹县',5117,51),(2276,511725,'渠县',5117,51),(2277,511771,'达州经济开发区',5117,51),(2278,511781,'万源市',5117,51),(2279,511802,'雨城区',5118,51),(2280,511803,'名山区',5118,51),(2281,511822,'荥经县',5118,51),(2282,511823,'汉源县',5118,51),(2283,511824,'石棉县',5118,51),(2284,511825,'天全县',5118,51),(2285,511826,'芦山县',5118,51),(2286,511827,'宝兴县',5118,51),(2287,511902,'巴州区',5119,51),(2288,511903,'恩阳区',5119,51),(2289,511921,'通江县',5119,51),(2290,511922,'南江县',5119,51),(2291,511923,'平昌县',5119,51),(2292,511971,'巴中经济开发区',5119,51),(2293,512002,'雁江区',5120,51),(2294,512021,'安岳县',5120,51),(2295,512022,'乐至县',5120,51),(2296,513201,'马尔康市',5132,51),(2297,513221,'汶川县',5132,51),(2298,513222,'理县',5132,51),(2299,513223,'茂县',5132,51),(2300,513224,'松潘县',5132,51),(2301,513225,'九寨沟县',5132,51),(2302,513226,'金川县',5132,51),(2303,513227,'小金县',5132,51),(2304,513228,'黑水县',5132,51),(2305,513230,'壤塘县',5132,51),(2306,513231,'阿坝县',5132,51),(2307,513232,'若尔盖县',5132,51),(2308,513233,'红原县',5132,51),(2309,513301,'康定市',5133,51),(2310,513322,'泸定县',5133,51),(2311,513323,'丹巴县',5133,51),(2312,513324,'九龙县',5133,51),(2313,513325,'雅江县',5133,51),(2314,513326,'道孚县',5133,51),(2315,513327,'炉霍县',5133,51),(2316,513328,'甘孜县',5133,51),(2317,513329,'新龙县',5133,51),(2318,513330,'德格县',5133,51),(2319,513331,'白玉县',5133,51),(2320,513332,'石渠县',5133,51),(2321,513333,'色达县',5133,51),(2322,513334,'理塘县',5133,51),(2323,513335,'巴塘县',5133,51),(2324,513336,'乡城县',5133,51),(2325,513337,'稻城县',5133,51),(2326,513338,'得荣县',5133,51),(2327,513401,'西昌市',5134,51),(2328,513422,'木里藏族自治县',5134,51),(2329,513423,'盐源县',5134,51),(2330,513424,'德昌县',5134,51),(2331,513425,'会理县',5134,51),(2332,513426,'会东县',5134,51),(2333,513427,'宁南县',5134,51),(2334,513428,'普格县',5134,51),(2335,513429,'布拖县',5134,51),(2336,513430,'金阳县',5134,51),(2337,513431,'昭觉县',5134,51),(2338,513432,'喜德县',5134,51),(2339,513433,'冕宁县',5134,51),(2340,513434,'越西县',5134,51),(2341,513435,'甘洛县',5134,51),(2342,513436,'美姑县',5134,51),(2343,513437,'雷波县',5134,51),(2344,520102,'南明区',5201,52),(2345,520103,'云岩区',5201,52),(2346,520111,'花溪区',5201,52),(2347,520112,'乌当区',5201,52),(2348,520113,'白云区',5201,52),(2349,520115,'观山湖区',5201,52),(2350,520121,'开阳县',5201,52),(2351,520122,'息烽县',5201,52),(2352,520123,'修文县',5201,52),(2353,520181,'清镇市',5201,52),(2354,520201,'钟山区',5202,52),(2355,520203,'六枝特区',5202,52),(2356,520221,'水城县',5202,52),(2357,520281,'盘州市',5202,52),(2358,520302,'红花岗区',5203,52),(2359,520303,'汇川区',5203,52),(2360,520304,'播州区',5203,52),(2361,520322,'桐梓县',5203,52),(2362,520323,'绥阳县',5203,52),(2363,520324,'正安县',5203,52),(2364,520325,'道真仡佬族苗族自治县',5203,52),(2365,520326,'务川仡佬族苗族自治县',5203,52),(2366,520327,'凤冈县',5203,52),(2367,520328,'湄潭县',5203,52),(2368,520329,'余庆县',5203,52),(2369,520330,'习水县',5203,52),(2370,520381,'赤水市',5203,52),(2371,520382,'仁怀市',5203,52),(2372,520402,'西秀区',5204,52),(2373,520403,'平坝区',5204,52),(2374,520422,'普定县',5204,52),(2375,520423,'镇宁布依族苗族自治县',5204,52),(2376,520424,'关岭布依族苗族自治县',5204,52),(2377,520425,'紫云苗族布依族自治县',5204,52),(2378,520502,'七星关区',5205,52),(2379,520521,'大方县',5205,52),(2380,520522,'黔西县',5205,52),(2381,520523,'金沙县',5205,52),(2382,520524,'织金县',5205,52),(2383,520525,'纳雍县',5205,52),(2384,520526,'威宁彝族回族苗族自治县',5205,52),(2385,520527,'赫章县',5205,52),(2386,520602,'碧江区',5206,52),(2387,520603,'万山区',5206,52),(2388,520621,'江口县',5206,52),(2389,520622,'玉屏侗族自治县',5206,52),(2390,520623,'石阡县',5206,52),(2391,520624,'思南县',5206,52),(2392,520625,'印江土家族苗族自治县',5206,52),(2393,520626,'德江县',5206,52),(2394,520627,'沿河土家族自治县',5206,52),(2395,520628,'松桃苗族自治县',5206,52),(2396,522301,'兴义市',5223,52),(2397,522302,'兴仁市',5223,52),(2398,522323,'普安县',5223,52),(2399,522324,'晴隆县',5223,52),(2400,522325,'贞丰县',5223,52),(2401,522326,'望谟县',5223,52),(2402,522327,'册亨县',5223,52),(2403,522328,'安龙县',5223,52),(2404,522601,'凯里市',5226,52),(2405,522622,'黄平县',5226,52),(2406,522623,'施秉县',5226,52),(2407,522624,'三穗县',5226,52),(2408,522625,'镇远县',5226,52),(2409,522626,'岑巩县',5226,52),(2410,522627,'天柱县',5226,52),(2411,522628,'锦屏县',5226,52),(2412,522629,'剑河县',5226,52),(2413,522630,'台江县',5226,52),(2414,522631,'黎平县',5226,52),(2415,522632,'榕江县',5226,52),(2416,522633,'从江县',5226,52),(2417,522634,'雷山县',5226,52),(2418,522635,'麻江县',5226,52),(2419,522636,'丹寨县',5226,52),(2420,522701,'都匀市',5227,52),(2421,522702,'福泉市',5227,52),(2422,522722,'荔波县',5227,52),(2423,522723,'贵定县',5227,52),(2424,522725,'瓮安县',5227,52),(2425,522726,'独山县',5227,52),(2426,522727,'平塘县',5227,52),(2427,522728,'罗甸县',5227,52),(2428,522729,'长顺县',5227,52),(2429,522730,'龙里县',5227,52),(2430,522731,'惠水县',5227,52),(2431,522732,'三都水族自治县',5227,52),(2432,530102,'五华区',5301,53),(2433,530103,'盘龙区',5301,53),(2434,530111,'官渡区',5301,53),(2435,530112,'西山区',5301,53),(2436,530113,'东川区',5301,53),(2437,530114,'呈贡区',5301,53),(2438,530115,'晋宁区',5301,53),(2439,530124,'富民县',5301,53),(2440,530125,'宜良县',5301,53),(2441,530126,'石林彝族自治县',5301,53),(2442,530127,'嵩明县',5301,53),(2443,530128,'禄劝彝族苗族自治县',5301,53),(2444,530129,'寻甸回族彝族自治县',5301,53),(2445,530181,'安宁市',5301,53),(2446,530302,'麒麟区',5303,53),(2447,530303,'沾益区',5303,53),(2448,530304,'马龙区',5303,53),(2449,530322,'陆良县',5303,53),(2450,530323,'师宗县',5303,53),(2451,530324,'罗平县',5303,53),(2452,530325,'富源县',5303,53),(2453,530326,'会泽县',5303,53),(2454,530381,'宣威市',5303,53),(2455,530402,'红塔区',5304,53),(2456,530403,'江川区',5304,53),(2457,530422,'澄江县',5304,53),(2458,530423,'通海县',5304,53),(2459,530424,'华宁县',5304,53),(2460,530425,'易门县',5304,53),(2461,530426,'峨山彝族自治县',5304,53),(2462,530427,'新平彝族傣族自治县',5304,53),(2463,530428,'元江哈尼族彝族傣族自治县',5304,53),(2464,530502,'隆阳区',5305,53),(2465,530521,'施甸县',5305,53),(2466,530523,'龙陵县',5305,53),(2467,530524,'昌宁县',5305,53),(2468,530581,'腾冲市',5305,53),(2469,530602,'昭阳区',5306,53),(2470,530621,'鲁甸县',5306,53),(2471,530622,'巧家县',5306,53),(2472,530623,'盐津县',5306,53),(2473,530624,'大关县',5306,53),(2474,530625,'永善县',5306,53),(2475,530626,'绥江县',5306,53),(2476,530627,'镇雄县',5306,53),(2477,530628,'彝良县',5306,53),(2478,530629,'威信县',5306,53),(2479,530681,'水富市',5306,53),(2480,530702,'古城区',5307,53),(2481,530721,'玉龙纳西族自治县',5307,53),(2482,530722,'永胜县',5307,53),(2483,530723,'华坪县',5307,53),(2484,530724,'宁蒗彝族自治县',5307,53),(2485,530802,'思茅区',5308,53),(2486,530821,'宁洱哈尼族彝族自治县',5308,53),(2487,530822,'墨江哈尼族自治县',5308,53),(2488,530823,'景东彝族自治县',5308,53),(2489,530824,'景谷傣族彝族自治县',5308,53),(2490,530825,'镇沅彝族哈尼族拉祜族自治县',5308,53),(2491,530826,'江城哈尼族彝族自治县',5308,53),(2492,530827,'孟连傣族拉祜族佤族自治县',5308,53),(2493,530828,'澜沧拉祜族自治县',5308,53),(2494,530829,'西盟佤族自治县',5308,53),(2495,530902,'临翔区',5309,53),(2496,530921,'凤庆县',5309,53),(2497,530922,'云县',5309,53),(2498,530923,'永德县',5309,53),(2499,530924,'镇康县',5309,53),(2500,530925,'双江拉祜族佤族布朗族傣族自治县',5309,53),(2501,530926,'耿马傣族佤族自治县',5309,53),(2502,530927,'沧源佤族自治县',5309,53),(2503,532301,'楚雄市',5323,53),(2504,532322,'双柏县',5323,53),(2505,532323,'牟定县',5323,53),(2506,532324,'南华县',5323,53),(2507,532325,'姚安县',5323,53),(2508,532326,'大姚县',5323,53),(2509,532327,'永仁县',5323,53),(2510,532328,'元谋县',5323,53),(2511,532329,'武定县',5323,53),(2512,532331,'禄丰县',5323,53),(2513,532501,'个旧市',5325,53),(2514,532502,'开远市',5325,53),(2515,532503,'蒙自市',5325,53),(2516,532504,'弥勒市',5325,53),(2517,532523,'屏边苗族自治县',5325,53),(2518,532524,'建水县',5325,53),(2519,532525,'石屏县',5325,53),(2520,532527,'泸西县',5325,53),(2521,532528,'元阳县',5325,53),(2522,532529,'红河县',5325,53),(2523,532530,'金平苗族瑶族傣族自治县',5325,53),(2524,532531,'绿春县',5325,53),(2525,532532,'河口瑶族自治县',5325,53),(2526,532601,'文山市',5326,53),(2527,532622,'砚山县',5326,53),(2528,532623,'西畴县',5326,53),(2529,532624,'麻栗坡县',5326,53),(2530,532625,'马关县',5326,53),(2531,532626,'丘北县',5326,53),(2532,532627,'广南县',5326,53),(2533,532628,'富宁县',5326,53),(2534,532801,'景洪市',5328,53),(2535,532822,'勐海县',5328,53),(2536,532823,'勐腊县',5328,53),(2537,532901,'大理市',5329,53),(2538,532922,'漾濞彝族自治县',5329,53),(2539,532923,'祥云县',5329,53),(2540,532924,'宾川县',5329,53),(2541,532925,'弥渡县',5329,53),(2542,532926,'南涧彝族自治县',5329,53),(2543,532927,'巍山彝族回族自治县',5329,53),(2544,532928,'永平县',5329,53),(2545,532929,'云龙县',5329,53),(2546,532930,'洱源县',5329,53),(2547,532931,'剑川县',5329,53),(2548,532932,'鹤庆县',5329,53),(2549,533102,'瑞丽市',5331,53),(2550,533103,'芒市',5331,53),(2551,533122,'梁河县',5331,53),(2552,533123,'盈江县',5331,53),(2553,533124,'陇川县',5331,53),(2554,533301,'泸水市',5333,53),(2555,533323,'福贡县',5333,53),(2556,533324,'贡山独龙族怒族自治县',5333,53),(2557,533325,'兰坪白族普米族自治县',5333,53),(2558,533401,'香格里拉市',5334,53),(2559,533422,'德钦县',5334,53),(2560,533423,'维西傈僳族自治县',5334,53),(2561,540102,'城关区',5401,54),(2562,540103,'堆龙德庆区',5401,54),(2563,540104,'达孜区',5401,54),(2564,540121,'林周县',5401,54),(2565,540122,'当雄县',5401,54),(2566,540123,'尼木县',5401,54),(2567,540124,'曲水县',5401,54),(2568,540127,'墨竹工卡县',5401,54),(2569,540171,'格尔木藏青工业园区',5401,54),(2570,540172,'拉萨经济技术开发区',5401,54),(2571,540173,'西藏文化旅游创意园区',5401,54),(2572,540174,'达孜工业园区',5401,54),(2573,540202,'桑珠孜区',5402,54),(2574,540221,'南木林县',5402,54),(2575,540222,'江孜县',5402,54),(2576,540223,'定日县',5402,54),(2577,540224,'萨迦县',5402,54),(2578,540225,'拉孜县',5402,54),(2579,540226,'昂仁县',5402,54),(2580,540227,'谢通门县',5402,54),(2581,540228,'白朗县',5402,54),(2582,540229,'仁布县',5402,54),(2583,540230,'康马县',5402,54),(2584,540231,'定结县',5402,54),(2585,540232,'仲巴县',5402,54),(2586,540233,'亚东县',5402,54),(2587,540234,'吉隆县',5402,54),(2588,540235,'聂拉木县',5402,54),(2589,540236,'萨嘎县',5402,54),(2590,540237,'岗巴县',5402,54),(2591,540302,'卡若区',5403,54),(2592,540321,'江达县',5403,54),(2593,540322,'贡觉县',5403,54),(2594,540323,'类乌齐县',5403,54),(2595,540324,'丁青县',5403,54),(2596,540325,'察雅县',5403,54),(2597,540326,'八宿县',5403,54),(2598,540327,'左贡县',5403,54),(2599,540328,'芒康县',5403,54),(2600,540329,'洛隆县',5403,54),(2601,540330,'边坝县',5403,54),(2602,540402,'巴宜区',5404,54),(2603,540421,'工布江达县',5404,54),(2604,540422,'米林县',5404,54),(2605,540423,'墨脱县',5404,54),(2606,540424,'波密县',5404,54),(2607,540425,'察隅县',5404,54),(2608,540426,'朗县',5404,54),(2609,540502,'乃东区',5405,54),(2610,540521,'扎囊县',5405,54),(2611,540522,'贡嘎县',5405,54),(2612,540523,'桑日县',5405,54),(2613,540524,'琼结县',5405,54),(2614,540525,'曲松县',5405,54),(2615,540526,'措美县',5405,54),(2616,540527,'洛扎县',5405,54),(2617,540528,'加查县',5405,54),(2618,540529,'隆子县',5405,54),(2619,540530,'错那县',5405,54),(2620,540531,'浪卡子县',5405,54),(2621,540602,'色尼区',5406,54),(2622,540621,'嘉黎县',5406,54),(2623,540622,'比如县',5406,54),(2624,540623,'聂荣县',5406,54),(2625,540624,'安多县',5406,54),(2626,540625,'申扎县',5406,54),(2627,540626,'索县',5406,54),(2628,540627,'班戈县',5406,54),(2629,540628,'巴青县',5406,54),(2630,540629,'尼玛县',5406,54),(2631,540630,'双湖县',5406,54),(2632,542521,'普兰县',5425,54),(2633,542522,'札达县',5425,54),(2634,542523,'噶尔县',5425,54),(2635,542524,'日土县',5425,54),(2636,542525,'革吉县',5425,54),(2637,542526,'改则县',5425,54),(2638,542527,'措勤县',5425,54),(2639,610102,'新城区',6101,61),(2640,610103,'碑林区',6101,61),(2641,610104,'莲湖区',6101,61),(2642,610111,'灞桥区',6101,61),(2643,610112,'未央区',6101,61),(2644,610113,'雁塔区',6101,61),(2645,610114,'阎良区',6101,61),(2646,610115,'临潼区',6101,61),(2647,610116,'长安区',6101,61),(2648,610117,'高陵区',6101,61),(2649,610118,'鄠邑区',6101,61),(2650,610122,'蓝田县',6101,61),(2651,610124,'周至县',6101,61),(2652,610202,'王益区',6102,61),(2653,610203,'印台区',6102,61),(2654,610204,'耀州区',6102,61),(2655,610222,'宜君县',6102,61),(2656,610302,'渭滨区',6103,61),(2657,610303,'金台区',6103,61),(2658,610304,'陈仓区',6103,61),(2659,610322,'凤翔县',6103,61),(2660,610323,'岐山县',6103,61),(2661,610324,'扶风县',6103,61),(2662,610326,'眉县',6103,61),(2663,610327,'陇县',6103,61),(2664,610328,'千阳县',6103,61),(2665,610329,'麟游县',6103,61),(2666,610330,'凤县',6103,61),(2667,610331,'太白县',6103,61),(2668,610402,'秦都区',6104,61),(2669,610403,'杨陵区',6104,61),(2670,610404,'渭城区',6104,61),(2671,610422,'三原县',6104,61),(2672,610423,'泾阳县',6104,61),(2673,610424,'乾县',6104,61),(2674,610425,'礼泉县',6104,61),(2675,610426,'永寿县',6104,61),(2676,610428,'长武县',6104,61),(2677,610429,'旬邑县',6104,61),(2678,610430,'淳化县',6104,61),(2679,610431,'武功县',6104,61),(2680,610481,'兴平市',6104,61),(2681,610482,'彬州市',6104,61),(2682,610502,'临渭区',6105,61),(2683,610503,'华州区',6105,61),(2684,610522,'潼关县',6105,61),(2685,610523,'大荔县',6105,61),(2686,610524,'合阳县',6105,61),(2687,610525,'澄城县',6105,61),(2688,610526,'蒲城县',6105,61),(2689,610527,'白水县',6105,61),(2690,610528,'富平县',6105,61),(2691,610581,'韩城市',6105,61),(2692,610582,'华阴市',6105,61),(2693,610602,'宝塔区',6106,61),(2694,610603,'安塞区',6106,61),(2695,610621,'延长县',6106,61),(2696,610622,'延川县',6106,61),(2697,610623,'子长县',6106,61),(2698,610625,'志丹县',6106,61),(2699,610626,'吴起县',6106,61),(2700,610627,'甘泉县',6106,61),(2701,610628,'富县',6106,61),(2702,610629,'洛川县',6106,61),(2703,610630,'宜川县',6106,61),(2704,610631,'黄龙县',6106,61),(2705,610632,'黄陵县',6106,61),(2706,610702,'汉台区',6107,61),(2707,610703,'南郑区',6107,61),(2708,610722,'城固县',6107,61),(2709,610723,'洋县',6107,61),(2710,610724,'西乡县',6107,61),(2711,610725,'勉县',6107,61),(2712,610726,'宁强县',6107,61),(2713,610727,'略阳县',6107,61),(2714,610728,'镇巴县',6107,61),(2715,610729,'留坝县',6107,61),(2716,610730,'佛坪县',6107,61),(2717,610802,'榆阳区',6108,61),(2718,610803,'横山区',6108,61),(2719,610822,'府谷县',6108,61),(2720,610824,'靖边县',6108,61),(2721,610825,'定边县',6108,61),(2722,610826,'绥德县',6108,61),(2723,610827,'米脂县',6108,61),(2724,610828,'佳县',6108,61),(2725,610829,'吴堡县',6108,61),(2726,610830,'清涧县',6108,61),(2727,610831,'子洲县',6108,61),(2728,610881,'神木市',6108,61),(2729,610902,'汉滨区',6109,61),(2730,610921,'汉阴县',6109,61),(2731,610922,'石泉县',6109,61),(2732,610923,'宁陕县',6109,61),(2733,610924,'紫阳县',6109,61),(2734,610925,'岚皋县',6109,61),(2735,610926,'平利县',6109,61),(2736,610927,'镇坪县',6109,61),(2737,610928,'旬阳县',6109,61),(2738,610929,'白河县',6109,61),(2739,611002,'商州区',6110,61),(2740,611021,'洛南县',6110,61),(2741,611022,'丹凤县',6110,61),(2742,611023,'商南县',6110,61),(2743,611024,'山阳县',6110,61),(2744,611025,'镇安县',6110,61),(2745,611026,'柞水县',6110,61),(2746,620102,'城关区',6201,62),(2747,620103,'七里河区',6201,62),(2748,620104,'西固区',6201,62),(2749,620105,'安宁区',6201,62),(2750,620111,'红古区',6201,62),(2751,620121,'永登县',6201,62),(2752,620122,'皋兰县',6201,62),(2753,620123,'榆中县',6201,62),(2754,620171,'兰州新区',6201,62),(2755,620201,'嘉峪关市',6202,62),(2756,620302,'金川区',6203,62),(2757,620321,'永昌县',6203,62),(2758,620402,'白银区',6204,62),(2759,620403,'平川区',6204,62),(2760,620421,'靖远县',6204,62),(2761,620422,'会宁县',6204,62),(2762,620423,'景泰县',6204,62),(2763,620502,'秦州区',6205,62),(2764,620503,'麦积区',6205,62),(2765,620521,'清水县',6205,62),(2766,620522,'秦安县',6205,62),(2767,620523,'甘谷县',6205,62),(2768,620524,'武山县',6205,62),(2769,620525,'张家川回族自治县',6205,62),(2770,620602,'凉州区',6206,62),(2771,620621,'民勤县',6206,62),(2772,620622,'古浪县',6206,62),(2773,620623,'天祝藏族自治县',6206,62),(2774,620702,'甘州区',6207,62),(2775,620721,'肃南裕固族自治县',6207,62),(2776,620722,'民乐县',6207,62),(2777,620723,'临泽县',6207,62),(2778,620724,'高台县',6207,62),(2779,620725,'山丹县',6207,62),(2780,620802,'崆峒区',6208,62),(2781,620821,'泾川县',6208,62),(2782,620822,'灵台县',6208,62),(2783,620823,'崇信县',6208,62),(2784,620825,'庄浪县',6208,62),(2785,620826,'静宁县',6208,62),(2786,620881,'华亭市',6208,62),(2787,620902,'肃州区',6209,62),(2788,620921,'金塔县',6209,62),(2789,620922,'瓜州县',6209,62),(2790,620923,'肃北蒙古族自治县',6209,62),(2791,620924,'阿克塞哈萨克族自治县',6209,62),(2792,620981,'玉门市',6209,62),(2793,620982,'敦煌市',6209,62),(2794,621002,'西峰区',6210,62),(2795,621021,'庆城县',6210,62),(2796,621022,'环县',6210,62),(2797,621023,'华池县',6210,62),(2798,621024,'合水县',6210,62),(2799,621025,'正宁县',6210,62),(2800,621026,'宁县',6210,62),(2801,621027,'镇原县',6210,62),(2802,621102,'安定区',6211,62),(2803,621121,'通渭县',6211,62),(2804,621122,'陇西县',6211,62),(2805,621123,'渭源县',6211,62),(2806,621124,'临洮县',6211,62),(2807,621125,'漳县',6211,62),(2808,621126,'岷县',6211,62),(2809,621202,'武都区',6212,62),(2810,621221,'成县',6212,62),(2811,621222,'文县',6212,62),(2812,621223,'宕昌县',6212,62),(2813,621224,'康县',6212,62),(2814,621225,'西和县',6212,62),(2815,621226,'礼县',6212,62),(2816,621227,'徽县',6212,62),(2817,621228,'两当县',6212,62),(2818,622901,'临夏市',6229,62),(2819,622921,'临夏县',6229,62),(2820,622922,'康乐县',6229,62),(2821,622923,'永靖县',6229,62),(2822,622924,'广河县',6229,62),(2823,622925,'和政县',6229,62),(2824,622926,'东乡族自治县',6229,62),(2825,622927,'积石山保安族东乡族撒拉族自治县',6229,62),(2826,623001,'合作市',6230,62),(2827,623021,'临潭县',6230,62),(2828,623022,'卓尼县',6230,62),(2829,623023,'舟曲县',6230,62),(2830,623024,'迭部县',6230,62),(2831,623025,'玛曲县',6230,62),(2832,623026,'碌曲县',6230,62),(2833,623027,'夏河县',6230,62),(2834,630102,'城东区',6301,63),(2835,630103,'城中区',6301,63),(2836,630104,'城西区',6301,63),(2837,630105,'城北区',6301,63),(2838,630121,'大通回族土族自治县',6301,63),(2839,630122,'湟中县',6301,63),(2840,630123,'湟源县',6301,63),(2841,630202,'乐都区',6302,63),(2842,630203,'平安区',6302,63),(2843,630222,'民和回族土族自治县',6302,63),(2844,630223,'互助土族自治县',6302,63),(2845,630224,'化隆回族自治县',6302,63),(2846,630225,'循化撒拉族自治县',6302,63),(2847,632221,'门源回族自治县',6322,63),(2848,632222,'祁连县',6322,63),(2849,632223,'海晏县',6322,63),(2850,632224,'刚察县',6322,63),(2851,632321,'同仁县',6323,63),(2852,632322,'尖扎县',6323,63),(2853,632323,'泽库县',6323,63),(2854,632324,'河南蒙古族自治县',6323,63),(2855,632521,'共和县',6325,63),(2856,632522,'同德县',6325,63),(2857,632523,'贵德县',6325,63),(2858,632524,'兴海县',6325,63),(2859,632525,'贵南县',6325,63),(2860,632621,'玛沁县',6326,63),(2861,632622,'班玛县',6326,63),(2862,632623,'甘德县',6326,63),(2863,632624,'达日县',6326,63),(2864,632625,'久治县',6326,63),(2865,632626,'玛多县',6326,63),(2866,632701,'玉树市',6327,63),(2867,632722,'杂多县',6327,63),(2868,632723,'称多县',6327,63),(2869,632724,'治多县',6327,63),(2870,632725,'囊谦县',6327,63),(2871,632726,'曲麻莱县',6327,63),(2872,632801,'格尔木市',6328,63),(2873,632802,'德令哈市',6328,63),(2874,632803,'茫崖市',6328,63),(2875,632821,'乌兰县',6328,63),(2876,632822,'都兰县',6328,63),(2877,632823,'天峻县',6328,63),(2878,632857,'大柴旦行政委员会',6328,63),(2879,640104,'兴庆区',6401,64),(2880,640105,'西夏区',6401,64),(2881,640106,'金凤区',6401,64),(2882,640121,'永宁县',6401,64),(2883,640122,'贺兰县',6401,64),(2884,640181,'灵武市',6401,64),(2885,640202,'大武口区',6402,64),(2886,640205,'惠农区',6402,64),(2887,640221,'平罗县',6402,64),(2888,640302,'利通区',6403,64),(2889,640303,'红寺堡区',6403,64),(2890,640323,'盐池县',6403,64),(2891,640324,'同心县',6403,64),(2892,640381,'青铜峡市',6403,64),(2893,640402,'原州区',6404,64),(2894,640422,'西吉县',6404,64),(2895,640423,'隆德县',6404,64),(2896,640424,'泾源县',6404,64),(2897,640425,'彭阳县',6404,64),(2898,640502,'沙坡头区',6405,64),(2899,640521,'中宁县',6405,64),(2900,640522,'海原县',6405,64),(2901,650102,'天山区',6501,65),(2902,650103,'沙依巴克区',6501,65),(2903,650104,'新市区',6501,65),(2904,650105,'水磨沟区',6501,65),(2905,650106,'头屯河区',6501,65),(2906,650107,'达坂城区',6501,65),(2907,650109,'米东区',6501,65),(2908,650121,'乌鲁木齐县',6501,65),(2909,650171,'乌鲁木齐经济技术开发区',6501,65),(2910,650172,'乌鲁木齐高新技术产业开发区',6501,65),(2911,650202,'独山子区',6502,65),(2912,650203,'克拉玛依区',6502,65),(2913,650204,'白碱滩区',6502,65),(2914,650205,'乌尔禾区',6502,65),(2915,650402,'高昌区',6504,65),(2916,650421,'鄯善县',6504,65),(2917,650422,'托克逊县',6504,65),(2918,650502,'伊州区',6505,65),(2919,650521,'巴里坤哈萨克自治县',6505,65),(2920,650522,'伊吾县',6505,65),(2921,652301,'昌吉市',6523,65),(2922,652302,'阜康市',6523,65),(2923,652323,'呼图壁县',6523,65),(2924,652324,'玛纳斯县',6523,65),(2925,652325,'奇台县',6523,65),(2926,652327,'吉木萨尔县',6523,65),(2927,652328,'木垒哈萨克自治县',6523,65),(2928,652701,'博乐市',6527,65),(2929,652702,'阿拉山口市',6527,65),(2930,652722,'精河县',6527,65),(2931,652723,'温泉县',6527,65),(2932,652801,'库尔勒市',6528,65),(2933,652822,'轮台县',6528,65),(2934,652823,'尉犁县',6528,65),(2935,652824,'若羌县',6528,65),(2936,652825,'且末县',6528,65),(2937,652826,'焉耆回族自治县',6528,65),(2938,652827,'和静县',6528,65),(2939,652828,'和硕县',6528,65),(2940,652829,'博湖县',6528,65),(2941,652871,'库尔勒经济技术开发区',6528,65),(2942,652901,'阿克苏市',6529,65),(2943,652922,'温宿县',6529,65),(2944,652923,'库车县',6529,65),(2945,652924,'沙雅县',6529,65),(2946,652925,'新和县',6529,65),(2947,652926,'拜城县',6529,65),(2948,652927,'乌什县',6529,65),(2949,652928,'阿瓦提县',6529,65),(2950,652929,'柯坪县',6529,65),(2951,653001,'阿图什市',6530,65),(2952,653022,'阿克陶县',6530,65),(2953,653023,'阿合奇县',6530,65),(2954,653024,'乌恰县',6530,65),(2955,653101,'喀什市',6531,65),(2956,653121,'疏附县',6531,65),(2957,653122,'疏勒县',6531,65),(2958,653123,'英吉沙县',6531,65),(2959,653124,'泽普县',6531,65),(2960,653125,'莎车县',6531,65),(2961,653126,'叶城县',6531,65),(2962,653127,'麦盖提县',6531,65),(2963,653128,'岳普湖县',6531,65),(2964,653129,'伽师县',6531,65),(2965,653130,'巴楚县',6531,65),(2966,653131,'塔什库尔干塔吉克自治县',6531,65),(2967,653201,'和田市',6532,65),(2968,653221,'和田县',6532,65),(2969,653222,'墨玉县',6532,65),(2970,653223,'皮山县',6532,65),(2971,653224,'洛浦县',6532,65),(2972,653225,'策勒县',6532,65),(2973,653226,'于田县',6532,65),(2974,653227,'民丰县',6532,65),(2975,654002,'伊宁市',6540,65),(2976,654003,'奎屯市',6540,65),(2977,654004,'霍尔果斯市',6540,65),(2978,654021,'伊宁县',6540,65),(2979,654022,'察布查尔锡伯自治县',6540,65),(2980,654023,'霍城县',6540,65),(2981,654024,'巩留县',6540,65),(2982,654025,'新源县',6540,65),(2983,654026,'昭苏县',6540,65),(2984,654027,'特克斯县',6540,65),(2985,654028,'尼勒克县',6540,65),(2986,654201,'塔城市',6542,65),(2987,654202,'乌苏市',6542,65),(2988,654221,'额敏县',6542,65),(2989,654223,'沙湾县',6542,65),(2990,654224,'托里县',6542,65),(2991,654225,'裕民县',6542,65),(2992,654226,'和布克赛尔蒙古自治县',6542,65),(2993,654301,'阿勒泰市',6543,65),(2994,654321,'布尔津县',6543,65),(2995,654322,'富蕴县',6543,65),(2996,654323,'福海县',6543,65),(2997,654324,'哈巴河县',6543,65),(2998,654325,'青河县',6543,65),(2999,654326,'吉木乃县',6543,65),(3000,659001,'石河子市',6590,65),(3001,659002,'阿拉尔市',6590,65),(3002,659003,'图木舒克市',6590,65),(3003,659004,'五家渠市',6590,65),(3004,659006,'铁门关市',6590,65);
/*!40000 ALTER TABLE `s_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_code`
--

DROP TABLE IF EXISTS `s_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码类型',
  `rule` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码规则',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '当前编码',
  `auto_create` int(11) DEFAULT NULL COMMENT '代码增加序号',
  `prefex` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前缀',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_s_code_1` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='编码控制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_code`
--

LOCK TABLES `s_code` WRITE;
/*!40000 ALTER TABLE `s_code` DISABLE KEYS */;
INSERT INTO `s_code` VALUES (2,'s_tenant','10','ZH20191216NX001',1,'ZH',29,'2019-12-13 15:11:44',29,'2019-12-13 15:33:12',5),(4,'s_menu','10','M20191216KZ007',7,'M',29,'2019-12-16 15:48:54',29,'2019-12-16 15:48:54',6),(5,'m_group','10','GP20200107CD002',2,'GP',29,'2019-12-18 14:03:36',25,'2020-01-07 16:02:21',13),(6,'m_dept','10','DPT20191218AH002',2,'DPT',29,'2019-12-18 14:36:48',29,'2019-12-18 14:36:48',1),(8,'m_position','10','DEPT20191219VG002',2,'DEPT',29,'2019-12-18 14:54:04',29,'2019-12-18 14:54:04',3),(10,'s_vue_page_setting','11','P00000009',9,'P',29,'2020-04-08 16:18:43',25,'2020-04-09 15:28:19',9);
/*!40000 ALTER TABLE `s_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_config`
--

DROP TABLE IF EXISTS `s_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数键值',
  `isenable` tinyint(1) DEFAULT NULL COMMENT '是否禁用(1:true-未启用,0:false-已启用)\n\n',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户名称',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT NULL COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_config`
--

LOCK TABLES `s_config` WRITE;
/*!40000 ALTER TABLE `s_config` DISABLE KEYS */;
INSERT INTO `s_config` VALUES (6,'1','1','1',0,'1',NULL,NULL,1,'2019-09-30 01:16:50',1,'2019-09-30 01:16:50',0),(7,'12','12','12',0,NULL,NULL,NULL,1,'2019-09-30 01:17:02',1,'2019-09-30 01:17:02',0),(8,'123','123','123',0,'',NULL,NULL,1,'2019-09-30 01:17:12',1,'2019-09-30 01:17:12',0);
/*!40000 ALTER TABLE `s_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_dict_data`
--

DROP TABLE IF EXISTS `s_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_dict_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典编码',
  `dict_type_id` bigint(20) DEFAULT NULL COMMENT '字典类型表id主键',
  `sort` tinyint(4) DEFAULT NULL COMMENT '字典排序',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典键值',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `extra1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额外配置1',
  `extra2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额外配置2',
  `extra3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额外配置3',
  `extra4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额外配置4',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_dict_data`
--

LOCK TABLES `s_dict_data` WRITE;
/*!40000 ALTER TABLE `s_dict_data` DISABLE KEYS */;
INSERT INTO `s_dict_data` VALUES (1,NULL,1,0,'未删除','0','',NULL,NULL,NULL,NULL,0,1,'2019-09-03 01:56:58',1,'2019-09-26 07:51:27',60),(2,NULL,1,1,'已删除','1','1',NULL,NULL,NULL,NULL,0,1,'2019-09-02 18:13:52',1,'2019-09-26 07:51:27',61),(5,NULL,1,2,'全部','null','',NULL,NULL,NULL,NULL,0,1,'2019-09-03 07:53:30',1,'2019-09-26 07:51:28',60),(6,NULL,2,0,'目录','c','',NULL,NULL,NULL,NULL,0,1,'2019-10-31 11:31:13',1,'2019-10-31 11:31:13',0),(7,NULL,2,1,'菜单','m','',NULL,NULL,NULL,NULL,0,1,'2019-10-31 11:31:38',1,'2019-10-31 11:31:38',0),(8,NULL,2,2,'页面','p','',NULL,NULL,NULL,NULL,0,1,'2019-10-31 11:31:50',1,'2019-10-31 11:31:50',0),(9,NULL,3,0,'显示','0','',NULL,NULL,NULL,NULL,0,1,'2019-11-01 11:45:56',1,'2019-11-04 09:25:11',2),(10,NULL,3,1,'隐藏','1','',NULL,NULL,NULL,NULL,0,1,'2019-11-01 11:46:14',1,'2019-11-04 09:25:11',2),(11,NULL,3,2,'全部','null','',NULL,NULL,NULL,NULL,0,1,'2019-11-01 11:46:30',1,'2019-11-04 09:25:11',2),(12,NULL,4,0,'国有全资','1','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:00:28',1,'2019-11-05 11:00:28',0),(13,NULL,4,1,'集体全资','2','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:00:39',1,'2019-11-05 11:00:39',0),(14,NULL,4,2,'股份合作','3','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:00:47',1,'2019-11-05 11:00:47',0),(15,NULL,4,3,'联营','4','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:00:56',1,'2019-11-05 11:00:56',0),(16,NULL,4,4,'国有联营','5','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:02',1,'2019-11-05 11:01:02',0),(17,NULL,4,5,'集体联营','6','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:10',1,'2019-11-05 11:01:10',0),(18,NULL,4,6,'国有与集体联营','7','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:17',1,'2019-11-05 11:01:17',0),(19,NULL,4,7,'其它联营','8','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:25',1,'2019-11-05 11:01:25',0),(20,NULL,4,8,'有限责任（公司）','9','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:34',1,'2019-11-05 11:01:34',0),(21,NULL,4,9,'国有独资（公司）','10','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:44',1,'2019-11-05 11:01:44',0),(22,NULL,4,10,'其它有限责任（公司）','11','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:01:52',1,'2019-11-05 11:01:52',0),(23,NULL,4,11,'股份有限（公司）','12','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:01',1,'2019-11-05 11:02:01',0),(24,NULL,4,12,'私有','13','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:09',1,'2019-11-05 11:02:09',0),(25,NULL,4,13,'私有独资','14','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:16',1,'2019-11-05 11:02:16',0),(26,NULL,4,14,'私有合伙','15','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:23',1,'2019-11-05 11:02:23',0),(27,NULL,4,15,'私营有限责任（公司）','16','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:33',1,'2019-11-05 11:02:33',0),(28,NULL,4,16,'个体经营','17','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:40',1,'2019-11-05 11:02:40',0),(29,NULL,4,17,'私营股份有限（公司）','18','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:02:49',1,'2019-11-05 11:02:49',0),(32,NULL,4,18,'内地与港、澳、台合作','19','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:04:30',1,'2019-11-05 11:04:30',0),(33,NULL,4,19,'内地与港、澳、台合资','20','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:04:38',1,'2019-11-05 11:04:38',0),(34,NULL,4,20,'港、澳、台投资','21','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:04:46',1,'2019-11-05 11:04:46',0),(35,NULL,4,21,'港、澳、台独资','22','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:04:55',1,'2019-11-05 11:04:55',0),(36,NULL,4,22,'港、澳、台投资股份有限（公司）','23','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:05:03',1,'2019-11-05 11:05:03',0),(37,NULL,4,23,'其他港、澳、台投资','24','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:05:12',1,'2019-11-05 11:05:12',0),(38,NULL,4,24,'外资','25','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:05:21',1,'2019-11-05 11:05:21',0),(39,NULL,4,25,'国外投资股份有限（公司）','26','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:05:28',1,'2019-11-05 11:05:28',0),(40,NULL,4,26,'其他国外投资','27','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:05:38',1,'2019-11-05 11:05:38',0),(41,NULL,4,27,'其他','28','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:05:45',1,'2019-11-05 11:05:45',0),(42,NULL,5,0,'表：地址簿','m_company','',NULL,NULL,NULL,NULL,0,1,'2019-11-05 11:41:06',1,'2019-11-05 11:41:06',0),(43,NULL,6,0,'公司','0','',NULL,NULL,NULL,NULL,0,1,'2019-11-06 11:48:53',1,'2019-11-06 11:48:53',0),(44,NULL,6,1,'家庭','1','',NULL,NULL,NULL,NULL,0,1,'2019-11-06 11:49:01',1,'2019-11-06 11:49:01',0),(45,NULL,7,0,'男','1','男=1,女=2',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:09:29',1,'2019-11-08 10:09:29',0),(46,NULL,7,1,'女','2','男=1,女=2',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:10:03',1,'2019-11-08 10:10:03',0),(47,NULL,8,0,'在职','1','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:11:03',1,'2019-11-08 10:11:03',0),(48,NULL,8,1,'不在职','0','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:11:17',1,'2019-11-08 10:11:17',0),(49,NULL,8,2,'离职','2','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:11:26',1,'2019-11-08 10:11:26',0),(50,NULL,8,3,'离退休','3','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:11:34',1,'2019-11-08 10:11:34',0),(51,NULL,8,4,'返聘','4','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:11:41',1,'2019-11-08 10:11:41',0),(52,NULL,9,0,'博士','0','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:21:46',1,'2019-11-08 10:21:46',0),(53,NULL,9,1,'硕士','1','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:21:55',1,'2019-11-08 10:21:55',0),(54,NULL,9,2,'本科','2','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:22:04',1,'2019-11-08 10:22:04',0),(55,NULL,9,3,'大专','3','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:22:11',1,'2019-11-08 10:22:11',0),(56,NULL,9,4,'高中/中技/中专','4','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:22:22',1,'2019-11-08 10:22:22',0),(57,NULL,9,5,'初中及以下','5','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:22:29',1,'2019-11-08 10:22:29',0),(58,NULL,9,6,'其他','6','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 10:22:37',1,'2019-11-08 10:22:37',0),(59,NULL,10,0,'未婚','0','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 11:52:25',1,'2019-11-08 11:52:25',0),(60,NULL,10,1,'已婚','1','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 11:52:32',1,'2019-11-08 11:52:32',0),(61,NULL,11,0,'系统用户','10','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 16:52:04',1,'2019-11-08 16:52:04',0),(62,NULL,11,1,'职员','20','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 16:52:19',1,'2019-11-08 16:52:19',0),(63,NULL,11,2,'客户','30','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 16:52:28',1,'2019-11-08 16:52:28',0),(64,NULL,11,3,'供应商','40','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 16:52:37',1,'2019-11-08 16:52:37',0),(65,NULL,11,4,'其他','50','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 16:52:52',1,'2019-11-08 16:52:52',0),(66,NULL,11,5,'认证管理员','60','',NULL,NULL,NULL,NULL,0,1,'2019-11-08 16:53:13',1,'2019-11-08 16:53:13',0),(67,NULL,12,0,'租户','10','','','','','',0,29,'2019-11-18 10:05:44',29,'2019-11-18 10:05:44',5),(68,NULL,12,1,'集团','20','',NULL,NULL,NULL,NULL,0,29,'2019-11-18 10:06:02',29,'2019-11-18 10:06:02',0),(69,NULL,12,2,'企业','30','',NULL,NULL,NULL,NULL,0,29,'2019-11-18 10:06:10',29,'2019-11-18 10:06:10',0),(70,NULL,12,3,'部门','40','',NULL,NULL,NULL,NULL,0,29,'2019-11-18 10:06:19',29,'2019-11-18 10:06:19',0),(71,NULL,12,4,'岗位','50','',NULL,NULL,NULL,NULL,0,29,'2019-11-18 10:06:28',29,'2019-11-18 10:06:28',0),(72,NULL,12,5,'员工','60','',NULL,NULL,NULL,NULL,0,29,'2019-11-18 10:06:37',29,'2019-11-18 10:06:37',0),(73,NULL,13,0,'手机号码','10','',NULL,NULL,NULL,NULL,0,29,'2019-12-03 11:30:56',29,'2019-12-03 11:30:56',0),(74,NULL,13,1,'邮箱','20','',NULL,NULL,NULL,NULL,0,29,'2019-12-03 11:31:16',29,'2019-12-03 11:31:16',0),(77,NULL,14,0,'YYYYMMDD??999','10','',NULL,NULL,NULL,NULL,0,29,'2019-12-12 15:03:52',29,'2019-12-13 15:13:42',3),(78,NULL,15,0,'租户编码','s_tenant','',NULL,NULL,NULL,NULL,0,29,'2019-12-13 14:56:29',29,'2019-12-13 14:57:23',1),(80,NULL,15,1,'菜单组编号','s_menu','',NULL,NULL,NULL,NULL,0,29,'2019-12-16 15:46:14',29,'2019-12-16 15:46:14',0),(82,NULL,15,3,'部门编码','m_dept','',NULL,NULL,NULL,NULL,0,29,'2019-12-18 14:36:06',29,'2019-12-18 14:36:06',0),(83,NULL,15,4,'岗位编码','m_position','',NULL,NULL,NULL,NULL,0,29,'2019-12-18 14:45:07',29,'2019-12-18 14:45:07',0),(84,NULL,17,0,'仅显示未使用组织','10','',NULL,NULL,NULL,NULL,0,29,'2019-12-20 11:33:01',29,'2019-12-20 11:33:01',4),(85,NULL,17,1,'显示所有','null','',NULL,NULL,NULL,NULL,0,29,'2019-12-20 11:34:12',29,'2019-12-20 11:34:12',0),(86,NULL,15,5,'公司编码','m_company','',NULL,NULL,NULL,NULL,0,29,'2019-12-20 15:22:29',29,'2019-12-20 15:22:29',0),(87,NULL,18,1,'企业主表','m_company','','code','社会信用代码',NULL,NULL,0,29,'2020-01-01 13:25:43',29,'2020-01-01 13:25:43',13),(88,NULL,18,2,'企业主表','m_company','','name','企业全称',NULL,NULL,0,29,'2020-01-01 13:26:20',29,'2020-01-01 13:26:20',13),(89,NULL,18,3,'企业主表','m_company','','simple_name','企业简称',NULL,NULL,0,29,'2020-01-01 13:26:38',29,'2020-01-01 13:26:38',13),(90,NULL,18,4,'企业主表','m_company','','juridical_name','法定代表人',NULL,NULL,0,29,'2020-01-01 13:27:00',29,'2020-01-01 13:27:00',13),(91,NULL,18,5,'企业主表','m_company','','register_capital','注册资本',NULL,NULL,0,29,'2020-01-01 13:34:09',29,'2020-01-01 13:34:09',13),(92,NULL,18,6,'企业主表','m_company','','type','公司类型',NULL,NULL,0,29,'2020-01-01 13:36:59',29,'2020-01-01 13:36:59',13),(93,NULL,18,7,'企业主表','m_company','','setup_date','成立日期',NULL,NULL,0,29,'2020-01-01 13:37:14',29,'2020-01-01 13:37:14',13),(94,NULL,18,8,'企业主表','m_company','','end_date','营业有效期',NULL,NULL,0,29,'2020-01-01 13:37:29',29,'2020-01-01 13:37:29',13),(95,NULL,18,9,'企业主表','m_company','','long_term','营业执照 长期',NULL,NULL,0,29,'2020-01-01 13:37:48',29,'2020-01-01 13:37:48',13),(96,NULL,18,10,'企业主表','m_company','','descr','描述',NULL,NULL,0,29,'2020-01-01 13:38:03',29,'2020-01-01 13:38:03',13),(97,NULL,18,11,'企业主表','m_company','','is_del','是否删除',NULL,NULL,0,29,'2020-01-01 13:38:24',29,'2020-01-01 13:38:24',13),(98,NULL,18,12,'企业主表','m_company','','tenant_id','租户id','',NULL,0,29,'2020-01-01 13:38:43',29,'2020-01-01 13:38:43',13),(99,NULL,18,0,'企业主表','m_company','','id','主键',NULL,NULL,0,29,'2020-01-02 14:23:27',29,'2020-01-02 14:23:27',13),(100,NULL,18,13,'企业主表','m_company','','c_id','新增人id','',NULL,0,29,'2020-01-02 14:25:12',29,'2020-01-02 14:25:12',1),(101,NULL,18,14,'企业主表','m_company','','c_time','新增时间','',NULL,0,29,'2020-01-02 14:25:26',29,'2020-01-02 14:25:26',1),(102,NULL,18,15,'企业主表','m_company','','u_id','更新人id','',NULL,0,29,'2020-01-02 14:25:46',29,'2020-01-02 14:25:46',0),(103,NULL,18,16,'企业主表','m_company','','u_time','更新时间','',NULL,0,29,'2020-01-02 14:26:20',29,'2020-01-02 14:26:20',0),(104,NULL,18,17,'集团主表','m_group','','id','主键',NULL,NULL,0,29,'2020-01-02 14:32:29',29,'2020-01-02 14:32:29',0),(105,NULL,18,18,'集团主表','m_group','','code','集团编码',NULL,NULL,0,29,'2020-01-02 14:32:50',29,'2020-01-02 14:32:50',0),(106,NULL,18,19,'集团主表','m_group','','name','集团名称',NULL,NULL,0,29,'2020-01-02 14:32:59',29,'2020-01-02 14:32:59',0),(107,NULL,18,20,'集团主表','m_group','','simple_name','简称',NULL,NULL,0,29,'2020-01-02 14:33:11',29,'2020-01-02 14:33:11',0),(108,NULL,18,21,'集团主表','m_group','','descr','描述',NULL,NULL,0,29,'2020-01-02 14:33:22',29,'2020-01-02 14:33:22',0),(109,NULL,18,22,'集团主表','m_group','','is_del','是否删除',NULL,NULL,0,29,'2020-01-02 14:33:31',29,'2020-01-02 14:33:31',0),(110,NULL,18,23,'集团主表','m_group','','tenant_id','租户id',NULL,NULL,0,29,'2020-01-02 14:33:41',29,'2020-01-02 14:33:41',0),(111,NULL,18,24,'集团主表','m_group','','descr','描述',NULL,NULL,0,29,'2020-01-02 14:33:51',29,'2020-01-02 14:33:51',0),(112,NULL,18,25,'集团主表','m_group','','c_id','新增人id',NULL,NULL,0,29,'2020-01-02 14:34:15',29,'2020-01-02 14:34:15',0),(113,NULL,18,26,'集团主表','m_group','','c_time','新增时间',NULL,NULL,0,29,'2020-01-02 14:34:28',29,'2020-01-02 14:34:28',0),(114,NULL,18,27,'集团主表','m_group','','u_id','更新人id',NULL,NULL,0,29,'2020-01-02 14:34:41',29,'2020-01-02 14:34:41',0),(115,NULL,18,28,'集团主表','m_group','','u_time','更新时间',NULL,NULL,0,29,'2020-01-02 14:34:57',29,'2020-01-02 14:34:57',0),(116,NULL,15,6,'集团编码','m_group','',NULL,NULL,NULL,NULL,0,29,'2020-01-07 14:47:44',29,'2020-01-07 14:47:44',0),(117,NULL,18,29,'组织主表','m_org','','parent_id','上级组织',NULL,NULL,0,29,'2020-01-13 11:07:42',29,'2020-01-13 11:07:42',0),(118,NULL,18,30,'组织主表','m_org','','tenant_id','租户id',NULL,NULL,0,29,'2020-01-13 11:07:59',29,'2020-01-13 11:07:59',0),(119,NULL,18,31,'组织主表','m_org','','serial_id','关联单号',NULL,NULL,0,29,'2020-01-13 11:08:16',29,'2020-01-13 11:08:16',0),(120,NULL,18,32,'组织主表','m_org','','serial_type','关联单号类型',NULL,NULL,0,29,'2020-01-13 11:08:27',29,'2020-01-13 11:08:27',0),(121,NULL,18,33,'组织主表','m_org','','code','编号',NULL,NULL,0,29,'2020-01-13 11:08:38',29,'2020-01-13 11:08:38',0),(122,NULL,18,34,'组织主表','m_org','','type','类型',NULL,NULL,0,29,'2020-01-13 11:08:59',29,'2020-01-13 11:08:59',0),(123,NULL,18,35,'组织主表','m_org','','c_id','新增人id',NULL,NULL,0,29,'2020-01-13 11:09:35',29,'2020-01-13 11:09:35',0),(124,NULL,18,36,'组织主表','m_org','','c_time','新增时间',NULL,NULL,0,29,'2020-01-13 11:09:45',29,'2020-01-13 11:09:45',0),(125,NULL,18,37,'组织主表','m_org','','u_id','更新人id',NULL,NULL,0,29,'2020-01-13 11:09:54',29,'2020-01-13 11:09:54',0),(126,NULL,18,38,'组织主表','m_org','','u_time','更新时间',NULL,NULL,0,29,'2020-01-13 11:10:06',29,'2020-01-13 11:10:06',0),(127,NULL,14,1,'99999999','11','',NULL,NULL,NULL,NULL,0,29,'2020-04-07 11:02:58',29,'2020-04-08 16:08:47',1),(128,NULL,15,7,'vue页面配置表','s_vue_page_setting','',NULL,NULL,NULL,NULL,0,29,'2020-04-08 16:06:18',29,'2020-04-08 16:06:18',0),(129,NULL,19,0,'查询','01','','01','页面按钮',NULL,NULL,0,25,'2020-04-10 14:24:44',25,'2020-04-14 11:13:34',1),(130,NULL,19,1,'重置','02','','01','页面按钮','','',0,25,'2020-04-10 14:24:55',25,'2020-04-14 11:13:41',1),(131,NULL,19,2,'新增','03','','01','页面按钮','','',0,25,'2020-04-10 14:25:14',25,'2020-04-14 11:13:47',1),(132,NULL,19,3,'修改','04','','01','页面按钮','','',0,25,'2020-04-10 14:25:21',25,'2020-04-14 11:13:52',1),(133,NULL,19,4,'复制新增','05','','01','页面按钮','','',0,25,'2020-04-10 14:25:35',25,'2020-04-14 11:13:58',1),(134,NULL,19,5,'导出','06','','01','页面按钮','','',0,25,'2020-04-10 14:25:44',25,'2020-04-14 11:14:05',1),(135,NULL,19,6,'数据批量导入','07','','01','页面按钮','','',0,25,'2020-04-10 14:26:35',25,'2020-04-14 11:14:11',1),(136,NULL,19,7,'删除','08','','02','表格按钮','','',0,25,'2020-04-10 14:55:46',25,'2020-04-14 11:14:34',2),(137,NULL,19,8,'确定','09','','03','弹出框按钮','','',0,28,'2020-04-16 09:24:11',28,'2020-04-16 09:24:11',0);
/*!40000 ALTER TABLE `s_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_dict_type`
--

DROP TABLE IF EXISTS `s_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_dict_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典编号：唯一',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code_UNIQUE` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='字典类型表、字典主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_dict_type`
--

LOCK TABLES `s_dict_type` WRITE;
/*!40000 ALTER TABLE `s_dict_type` DISABLE KEYS */;
INSERT INTO `s_dict_type` VALUES (1,'删除类型','sys_delete_type','删除类型',0,1,'2019-09-11 01:12:39',1,'2019-09-11 09:12:58',1),(2,'模块类型','sys_module_type','m目录 c菜单 p页面',0,1,'2019-10-31 11:30:47',1,'2019-11-06 11:14:42',1),(3,'隐藏显示类型','sys_visible_type','隐藏显示类型： 0：显示 1：隐藏 null:全部',0,1,'2019-11-01 11:33:09',1,'2019-11-01 11:33:09',0),(4,'企业类型','sys_company_type','企业类型',0,1,'2019-11-05 10:57:51',1,'2019-11-05 10:58:00',1),(5,'关联表类型','sys_serial_type','关联表类型：关联表名',0,1,'2019-11-05 11:40:08',1,'2019-11-07 13:14:43',2),(6,'地址簿标签','sys_address_tag_type','地址簿标签：公司、家庭',0,1,'2019-11-06 11:14:20',1,'2019-11-07 13:14:18',1),(7,'性别类型','sys_sex_type','性别类型：男=1,女=2',0,1,'2019-11-08 10:08:40',1,'2019-11-08 10:09:37',1),(8,'在职状态','usr_service_type','是否在职：在职=1,不在职=0,离职=2,离退休=3,返聘=4',0,1,'2019-11-08 10:10:36',1,'2019-11-08 10:10:36',0),(9,'学历情况','usr_degree_type','学历情况',0,1,'2019-11-08 10:20:46',1,'2019-11-08 10:20:53',1),(10,'婚否','usr_wed_type','婚否：0：未婚；1：已婚',0,1,'2019-11-08 11:52:04',1,'2019-11-08 11:52:04',0),(11,'登录用户类型','usr_login_type','登录用户类型',0,1,'2019-11-08 16:51:29',1,'2019-11-08 16:51:29',0),(12,'组织机构类型','org_setting_type','租户、集团、企业、部门、岗位、员工',0,29,'2019-11-18 10:05:11',29,'2020-04-07 10:59:50',1),(13,'登录模式','sys_login_type','登录模式：（10：手机号码；20：邮箱）',0,29,'2019-12-03 11:30:31',29,'2019-12-03 11:30:31',0),(14,'自动编号规则','sys_coderule_type','YYYYMMDD??999：ZH20191212XA001',0,29,'2019-12-12 14:18:35',29,'2019-12-13 14:56:54',3),(15,'自动编号设置','sys_code_type','设置表中所启用的编号规则',0,29,'2019-12-13 14:49:34',29,'2020-04-07 11:01:18',1),(17,'组织架构中已被使用','org_used_type','组织架构中已被使用的类型',0,29,'2019-12-20 11:32:04',29,'2019-12-20 11:32:04',0),(18,'表字段名称类型','sys_table_type','为操作日志服务',0,29,'2020-01-01 09:46:29',29,'2020-01-01 09:46:29',0),(19,'按钮类型','sys_btn_type','按钮类型名称',0,25,'2020-04-10 13:55:36',25,'2020-04-10 13:55:36',0);
/*!40000 ALTER TABLE `s_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_job`
--

DROP TABLE IF EXISTS `s_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '定时任务调度表',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务名称',
  `job_group_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务组编号',
  `job_group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务组名',
  `job_serial_id` bigint(20) DEFAULT NULL COMMENT '关联编号',
  `job_serial_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关联表名字',
  `job_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务描述',
  `job_simple_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '任务简称',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Bean名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '方法名称',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表达式',
  `concurrent` tinyint(1) DEFAULT NULL COMMENT '是否并发执行（0允许 1禁止）',
  `is_cron` tinyint(1) DEFAULT NULL COMMENT '判断是否是cron表达式，还是simpletrigger',
  `misfire_policy` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否是已经删除\n',
  `is_effected` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `begin_date` datetime DEFAULT NULL COMMENT '执行开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '执行结束时间',
  `run_time` datetime DEFAULT NULL COMMENT '下次运行时间',
  `next_run_time` datetime DEFAULT NULL COMMENT '下次运行时间',
  `last_run_time` datetime DEFAULT NULL COMMENT '上次运行时间',
  `run_times` int(11) DEFAULT NULL COMMENT '运行次数',
  `msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行情况',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_job`
--

LOCK TABLES `s_job` WRITE;
/*!40000 ALTER TABLE `s_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_job_log`
--

DROP TABLE IF EXISTS `s_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_job_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '定时任务调度表',
  `job_id` bigint(20) DEFAULT NULL COMMENT '任务主键',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务组编号',
  `job_group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务组名',
  `job_serial_id` bigint(20) DEFAULT NULL COMMENT '关联编号',
  `job_serial_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表名字',
  `job_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务描述',
  `job_simple_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务简称',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Bean名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表达式',
  `concurrent` tinyint(1) DEFAULT NULL COMMENT '是否并发执行（0允许 1禁止）',
  `is_cron` tinyint(1) DEFAULT NULL COMMENT '判断是否是cron表达式，还是simpletrigger',
  `misfire_policy` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否是已经删除\n',
  `is_effected` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `begin_date` datetime DEFAULT NULL COMMENT '执行开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '执行结束时间',
  `run_time` datetime DEFAULT NULL COMMENT '下次运行时间',
  `next_run_time` datetime DEFAULT NULL COMMENT '下次运行时间',
  `last_run_time` datetime DEFAULT NULL COMMENT '上次运行时间',
  `run_times` int(11) DEFAULT NULL COMMENT '运行次数',
  `msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行情况',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_job_log`
--

LOCK TABLES `s_job_log` WRITE;
/*!40000 ALTER TABLE `s_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_log`
--

DROP TABLE IF EXISTS `s_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) DEFAULT NULL COMMENT '耗时（毫秒）',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `class_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'HTTP方法',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'url',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'IP地址',
  `c_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4973 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_log`
--

LOCK TABLES `s_log` WRITE;
/*!40000 ALTER TABLE `s_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_log_access`
--

DROP TABLE IF EXISTS `s_log_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_log_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '操作日志记录',
  `login_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '模块标题',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '方法名称',
  `browser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `os` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人员',
  `status` tinyint(1) DEFAULT NULL COMMENT '部门名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求URL',
  `access_time` datetime DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_log_access`
--

LOCK TABLES `s_log_access` WRITE;
/*!40000 ALTER TABLE `s_log_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_log_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_log_mq`
--

DROP TABLE IF EXISTS `s_log_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_log_mq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'mq的queue编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'mq的queue名称',
  `exchange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'mq的queue所对应的exchange名称',
  `routing_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'mq的queue所对应的routing_key名称',
  `mq_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'mq的消息体',
  `construct_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `producer_status` tinyint(1) DEFAULT NULL COMMENT '发送情况(0：未发送（false）、1：已发送（true）)',
  `consumer_status` tinyint(1) DEFAULT NULL COMMENT '执行情况(0：未接受（false）、1：已接受（true）)',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='消息队列日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_log_mq`
--

LOCK TABLES `s_log_mq` WRITE;
/*!40000 ALTER TABLE `s_log_mq` DISABLE KEYS */;
INSERT INTO `s_log_mq` VALUES (184,'1','通用队列，无回调','perfect-task-tenant-enable-exchange','perfect-task-tenant-enable.#','{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"768ca38a0bee4c6585f8141907b4120a\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STenantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tenant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":13,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-12-16T14:23:30\\\",\\\"params\\\":\\\"{\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-12-16T14:23:37\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"ZH20191216NX001\\\\\\\",\\\\\\\"dbversion\\\\\\\":0,\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-16T14:23:30\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-12-16T14:23:30\\\\\\\",\\\\\\\"id\\\\\\\":13,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"测试\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"根节点\\\\\\\",\\\\\\\"serial_no\\\\\\\":\\\\\\\"0001\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"测试\\\\\\\",\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-12-16T14:23:37\\\\\\\"}\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}','768ca38a0bee4c6585f8141907b4120a',1,0,NULL,'2019-12-16 14:25:08',NULL,'2019-12-16 14:25:08',0),(185,'1','通用队列，无回调','perfect-task-tenant-disable-exchange','perfect-task-tenant-disable.#','{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"4a78bf9980bb4a86839c7f510e34cefa\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STenantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tenant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":13,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-16T14:23:30\\\",\\\"params\\\":\\\"{\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-12-16T14:23:37\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"ZH20191216NX001\\\\\\\",\\\\\\\"dbversion\\\\\\\":0,\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-16T14:23:30\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-12-16T14:23:30\\\\\\\",\\\\\\\"id\\\\\\\":13,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"测试\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"根节点\\\\\\\",\\\\\\\"serial_no\\\\\\\":\\\\\\\"0001\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"测试\\\\\\\",\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-12-16T14:23:37\\\\\\\"}\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}','4a78bf9980bb4a86839c7f510e34cefa',1,0,NULL,'2019-12-16 14:25:08',NULL,'2019-12-16 14:25:08',0),(186,'1','通用队列，无回调','perfect-task-tenant-enable-exchange','perfect-task-tenant-enable.#','{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"ecdd331c85d54c4aba9768f568aca801\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STenantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tenant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":1,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-12-19T10:01:52\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-09T01:22:29\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"dbversion\\\\\\\":1,\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-12-18T10:01:52\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-12-19T10:01:52\\\\\\\",\\\\\\\"id\\\\\\\":1,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"中建\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"根节点\\\\\\\",\\\\\\\"serial_no\\\\\\\":\\\\\\\"0001\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"测试\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-09T01:22:29\\\\\\\"}\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}','ecdd331c85d54c4aba9768f568aca801',1,0,29,'2019-12-19 10:01:53',29,'2019-12-19 10:01:53',0),(187,'1','通用队列，无回调','perfect-task-tenant-disable-exchange','perfect-task-tenant-disable.#','{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"14cbd01510314cb998ae95777d93945c\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STenantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tenant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":1,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-12-18T10:01:52\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-09T01:22:29\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"dbversion\\\\\\\":1,\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-12-18T10:01:52\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-12-19T10:01:52\\\\\\\",\\\\\\\"id\\\\\\\":1,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"中建\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"根节点\\\\\\\",\\\\\\\"serial_no\\\\\\\":\\\\\\\"0001\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"测试\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-09T01:22:29\\\\\\\"}\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}','14cbd01510314cb998ae95777d93945c',1,0,29,'2019-12-19 10:01:54',29,'2019-12-19 10:01:54',0);
/*!40000 ALTER TABLE `s_log_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_log_oper`
--

DROP TABLE IF EXISTS `s_log_oper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_log_oper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '操作日志记录',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作业务名',
  `type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务类型（其它、新增、修改、逻辑删除、物理删除）',
  `platform` int(1) DEFAULT NULL COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人姓名',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_log_oper`
--

LOCK TABLES `s_log_oper` WRITE;
/*!40000 ALTER TABLE `s_log_oper` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_log_oper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_log_oper_detail`
--

DROP TABLE IF EXISTS `s_log_oper_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_log_oper_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '操作日志记录',
  `oper_id` bigint(20) DEFAULT NULL COMMENT '操作日志主表id',
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作业务名',
  `type` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务类型（其它、新增、修改、逻辑删除、物理删除）',
  `oper_info` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作描述',
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表名',
  `clm_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列英文名称',
  `clm_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列中文名称',
  `old_val` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '旧值',
  `new_val` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_log_oper_detail`
--

LOCK TABLES `s_log_oper_detail` WRITE;
/*!40000 ALTER TABLE `s_log_oper_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_log_oper_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_log_sys`
--

DROP TABLE IF EXISTS `s_log_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_log_sys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '异常"NG"，正常"OK"',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) DEFAULT NULL COMMENT '耗时（毫秒）',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `class_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'HTTP方法',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '参数',
  `session` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'session json',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'url',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'IP地址',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '异常信息',
  `c_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21613 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_log_sys`
--

LOCK TABLES `s_log_sys` WRITE;
/*!40000 ALTER TABLE `s_log_sys` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_log_sys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_menu`
--

DROP TABLE IF EXISTS `s_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `root_id` bigint(20) DEFAULT NULL COMMENT '根节点id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID',
  `son_count` int(3) DEFAULT NULL COMMENT '儿子个数',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` tinyint(1) DEFAULT NULL COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `module_id` bigint(20) DEFAULT NULL COMMENT '模块id',
  `path` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求地址',
  `route_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由名，需要唯一，很重要，且需要vue这里手工录入',
  `meta_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名',
  `meta_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单icon',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块',
  `affix` tinyint(1) DEFAULT NULL COMMENT '附在导航栏不可关闭',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_route_name_2` (`code`,`tenant_id`) USING BTREE,
  UNIQUE KEY `idx_route_name_1` (`root_id`,`route_name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_menu`
--

LOCK TABLES `s_menu` WRITE;
/*!40000 ALTER TABLE `s_menu` DISABLE KEYS */;
INSERT INTO `s_menu` VALUES (21,'M20191216CG002','租户主菜单',21,NULL,4,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',NULL,29,'2019-12-16 15:52:57',29,'2019-12-16 15:52:57',6),(24,'M20191216CG0020003','首页',21,21,0,0,'m',0,NULL,1,'/dashboard','P00000070','首页','dashboard','',0,'',NULL,29,'2019-12-16 16:42:39',29,'2019-12-16 16:42:39',0),(25,'M20191216CG0020004','系统管理',21,21,0,0,'c',0,NULL,2,'/sys','M00000010','系统管理','系统管理','/views/01_dashboard/index',0,'',NULL,29,'2019-12-16 16:42:56',29,'2019-12-16 16:42:56',0),(30,'M20191216KZ007','系统管理员',30,NULL,2,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,29,'2019-12-16 16:47:43',29,'2019-12-16 16:47:43',3),(32,'M20191216KZ0070001','首页',30,30,0,0,'m',0,NULL,1,'/dashboard','P00000070','首页','dashboard','',0,'',NULL,29,'2019-12-16 16:52:17',29,'2019-12-16 16:52:17',0),(33,'M20191216KZ0070002','系统管理',30,30,2,0,'c',0,NULL,2,'/sys','M00000010','系统管理','系统管理','/views/01_dashboard/index',0,'',NULL,29,'2019-12-16 16:52:43',29,'2019-12-16 16:52:43',2),(34,'M20191216KZ00700020001','字典管理',30,33,2,0,'c',0,NULL,5,'dic','M00000020','字典管理','字典管理',NULL,0,'',NULL,29,'2019-12-16 16:53:51',29,'2019-12-16 16:53:51',2),(35,'M20191216KZ007000200010001','字典类型',30,34,0,0,'m',0,NULL,6,'dicttype','P00000030','字典类型','字典类型','/views/00_system/dicttype/dicttype',0,'',NULL,29,'2019-12-16 16:54:14',29,'2019-12-16 16:54:14',0),(36,'M20191216KZ007000200010002','字典数据',30,34,0,0,'m',0,NULL,7,'dictdata','P00000050','字典数据','字典数据','/views/00_system/dictdata/dictdata',0,'',NULL,29,'2019-12-16 16:54:23',29,'2019-12-16 16:54:23',0),(38,'测试','测试',38,NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,25,'2020-04-09 16:03:33',25,'2020-04-09 16:41:46',2),(39,'测试0001','企业信息',38,38,0,0,'m',0,NULL,12,'company','P00000110','企业信息','企业信息','/views/10_master/company/company',0,'',NULL,25,'2020-04-09 16:41:46',25,'2020-04-09 16:41:46',0);
/*!40000 ALTER TABLE `s_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_module`
--

DROP TABLE IF EXISTS `s_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块编号',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型：（m目录 c菜单 p页面）',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模版id：资源文件中获取',
  `path` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求地址',
  `route_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由名，需要唯一，很重要，且需要vue这里手工录入',
  `meta_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名',
  `meta_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单icon',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块',
  `affix` tinyint(1) DEFAULT NULL COMMENT '附在导航栏不可关闭',
  `perms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='模块：目录、菜单、页面';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_module`
--

LOCK TABLES `s_module` WRITE;
/*!40000 ALTER TABLE `s_module` DISABLE KEYS */;
INSERT INTO `s_module` VALUES (1,'Dashboard','m','首页',NULL,'/dashboard','P00000070','首页','dashboard','',1,NULL,'',0,25,'2019-10-31 16:04:03',25,'2019-11-01 09:37:57',1),(2,'sys','c','系统管理',NULL,'/sys','M00000010','系统管理','系统管理','/views/01_dashboard/index',0,NULL,'',0,25,'2019-11-01 09:51:10',25,'2019-11-01 10:02:30',4),(3,'resource','m','资源管理',NULL,'resource','P00000020','资源管理','资源管理','/views/00_system/resource/resource',0,NULL,'',0,25,'2019-11-01 10:05:27',25,'2019-11-01 10:05:27',0),(4,'module','m','模块编辑',NULL,'module','P00000040','模块编辑','模块编辑','/views/00_system/module/module',0,NULL,'',0,25,'2019-11-01 10:06:05',25,'2019-11-01 10:06:05',0),(5,'dic','c','字典管理',NULL,'dic','M00000020','字典管理','字典管理',NULL,0,NULL,'',0,25,'2019-11-01 10:26:50',25,'2019-11-01 10:26:50',0),(6,'dicttype','m','字典类型',NULL,'dicttype','P00000030','字典类型','字典类型','/views/00_system/dicttype/dicttype',0,NULL,'',0,25,'2019-11-01 10:27:38',25,'2019-11-01 10:27:38',0),(7,'dictdata','m','字典数据',NULL,'dictdata','P00000050','字典数据','字典数据','/views/00_system/dictdata/dictdata',0,NULL,'',0,25,'2019-11-01 10:28:12',25,'2019-11-01 10:28:12',0),(8,'config','m','系统参数',NULL,'config','P00000060','系统参数','系统参数','/views/00_system/config/config',0,NULL,'',0,25,'2019-11-01 10:28:53',25,'2019-11-01 10:28:53',0),(9,'tenant','m','租户管理',NULL,'tenant','P00000080','租户管理','tenant','/views/00_system/tenant/tenant',0,NULL,'',0,25,'2019-11-01 10:29:23',25,'2019-11-01 10:29:23',0),(10,'org','c','组织架构',NULL,'org','M00000030','组织架构','组织架构',NULL,0,NULL,'',0,25,'2019-11-01 10:30:04',25,'2019-11-01 10:30:04',0),(11,'group','m','集团信息',NULL,'group','P00000100','集团信息','集团信息','/views/10_master/group/group',0,NULL,'',0,25,'2019-11-01 10:30:44',25,'2019-11-01 10:31:07',1),(12,'company','m','企业信息',NULL,'company','P00000110','企业信息','企业信息','/views/10_master/company/company',0,NULL,'',0,25,'2019-11-01 10:31:36',25,'2019-11-04 09:28:58',2);
/*!40000 ALTER TABLE `s_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_module_button`
--

DROP TABLE IF EXISTS `s_module_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_module_button` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮编号：字典表过来',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '按钮名称',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `perms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '页面id，',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='模块按钮信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_module_button`
--

LOCK TABLES `s_module_button` WRITE;
/*!40000 ALTER TABLE `s_module_button` DISABLE KEYS */;
INSERT INTO `s_module_button` VALUES (1,'01','查询',0,'P_COMPANY:PAGE:SEARCH',12,NULL,NULL,NULL,NULL,0),(2,'03','新增',1,'P_COMPANY:PAGE:ADD',12,NULL,NULL,NULL,NULL,0),(3,'04','修改',2,'P_COMPANY:PAGE:UPDATE',12,NULL,NULL,NULL,NULL,0),(4,'05','复制新增',3,'P_COMPANY:PAGE:COPY_INSERT',12,NULL,NULL,NULL,NULL,0),(5,'08','删除',4,'P_COMPANY:TABLE:DELETE',12,NULL,NULL,28,'2020-04-16 15:32:50',0);
/*!40000 ALTER TABLE `s_module_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_resource`
--

DROP TABLE IF EXISTS `s_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'excel导入模板文件：10，静态配置文件：20，静态图片文件：30，json\n',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源名称',
  `uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '相对路径',
  `base` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件系统的baseurl',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `extension` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文件扩展名',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户名称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'json配置信息',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_resource`
--

LOCK TABLES `s_resource` WRITE;
/*!40000 ALTER TABLE `s_resource` DISABLE KEYS */;
INSERT INTO `s_resource` VALUES (2,'10','字典类型上传模板','','',0,'','','','字典类型上传模板','{\"dataRows\": {\"dataCols\": [{\"name\": \"name\", \"index\": 0}, {\"name\": \"code\", \"index\": 1}, {\"name\": \"descr\", \"index\": 2}]}, \"titleRows\": [{\"cols\": [{\"title\": \"字典名称\", \"colSpan\": 1}, {\"title\": \"字典编号\", \"colSpan\": 1}, {\"title\": \"描述\", \"colSpan\": 1}]}]}',0,1,'2019-09-10 08:38:31',1,'2019-09-18 03:51:03',3);
/*!40000 ALTER TABLE `s_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_role`
--

DROP TABLE IF EXISTS `s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色类型',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简称',
  `isdel` tinyint(1) DEFAULT NULL COMMENT '是否是已经删除(1:true-已删除,0:false-未删除)\n',
  `isenable` tinyint(1) DEFAULT NULL COMMENT '是否禁用(1:true-未启用,0:false-已启用)\n\n',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户名称',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_role`
--

LOCK TABLES `s_role` WRITE;
/*!40000 ALTER TABLE `s_role` DISABLE KEYS */;
INSERT INTO `s_role` VALUES (1,'xx','xx','xx','','xx',0,0,NULL,NULL,29,'2019-12-02 09:21:10',29,'2019-12-02 09:21:10',0),(2,'1','xx1','xx1','','xx1',0,0,NULL,NULL,29,'2019-12-02 09:21:37',29,'2019-12-02 09:21:37',0);
/*!40000 ALTER TABLE `s_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_sms_code`
--

DROP TABLE IF EXISTS `s_sms_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_sms_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号码',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '验证码',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '0:未知/1:注册/2:忘记密码/3:修改绑定手机',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='短信验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_sms_code`
--

LOCK TABLES `s_sms_code` WRITE;
/*!40000 ALTER TABLE `s_sms_code` DISABLE KEYS */;
INSERT INTO `s_sms_code` VALUES (1,'13611745652','8272','1',NULL,'2019-12-10 16:14:12',NULL,'2019-12-10 16:14:12'),(2,'13611745652','3564','1',NULL,'2019-12-10 16:17:38',NULL,'2019-12-10 16:17:38'),(3,'13611745652','5837','1',NULL,'2019-12-10 16:18:09',NULL,'2019-12-10 16:18:09'),(4,'13611806866','8436','1',NULL,'2019-12-10 16:20:34',NULL,'2019-12-10 16:20:34'),(5,'13611806866','7386','1',NULL,'2019-12-10 16:23:59',NULL,'2019-12-10 16:23:59'),(6,'13611806866','6573','1',NULL,'2019-12-10 16:25:39',NULL,'2019-12-10 16:25:39'),(7,'13611806866','9781','1',NULL,'2019-12-10 16:28:55',NULL,'2019-12-10 16:28:55'),(8,'13611806866','3238','1',NULL,'2019-12-10 16:36:25',NULL,'2019-12-10 16:36:25'),(9,'13611806866','7141','1',NULL,'2019-12-10 16:37:49',NULL,'2019-12-10 16:37:49'),(10,'13611806866','2828','1',NULL,'2019-12-10 16:38:21',NULL,'2019-12-10 16:38:21'),(11,'13611806866','0485','1',NULL,'2019-12-10 16:45:56',NULL,'2019-12-10 16:45:56'),(12,'13611806866','0768','1',NULL,'2019-12-10 16:56:55',NULL,'2019-12-10 16:56:55'),(13,'13611806866','0165','1',NULL,'2019-12-11 09:11:01',NULL,'2019-12-11 09:11:01'),(14,'13611806866','6203','1',NULL,'2019-12-11 09:11:53',NULL,'2019-12-11 09:11:53'),(15,'13611806866','3864','1',NULL,'2019-12-11 09:12:52',NULL,'2019-12-11 09:12:52'),(16,'13611806866','9921','1',NULL,'2019-12-11 13:59:02',NULL,'2019-12-11 13:59:02'),(17,'13611806866','4905','1',NULL,'2019-12-11 13:59:19',NULL,'2019-12-11 13:59:19'),(18,'13611806866','3023','1',NULL,'2019-12-11 14:04:23',NULL,'2019-12-11 14:04:23'),(19,'13611806866','3712','1',NULL,'2019-12-11 16:14:59',NULL,'2019-12-11 16:14:59'),(20,'13611806866','2543','1',NULL,'2019-12-11 16:20:51',NULL,'2019-12-11 16:20:51'),(21,'13611806866','1549','1',NULL,'2019-12-11 16:22:54',NULL,'2019-12-11 16:22:54'),(22,'13611806866','8070','1',NULL,'2019-12-11 16:24:13',NULL,'2019-12-11 16:24:13'),(23,'13611806866','4503','1',NULL,'2019-12-11 16:24:39',NULL,'2019-12-11 16:24:39'),(24,'13611806866','5089','1',NULL,'2019-12-11 16:28:47',NULL,'2019-12-11 16:28:47'),(25,'13611806866','2488','1',NULL,'2019-12-11 16:29:15',NULL,'2019-12-11 16:29:15'),(26,'13611806866','9763','1',NULL,'2019-12-11 16:29:35',NULL,'2019-12-11 16:29:35'),(27,'13611806866','4889','1',NULL,'2019-12-11 16:35:04',NULL,'2019-12-11 16:35:04'),(28,'13611806866','5361','1',NULL,'2019-12-11 16:39:54',NULL,'2019-12-11 16:39:54'),(29,'13611806866','7045','1',NULL,'2019-12-11 16:39:59',NULL,'2019-12-11 16:39:59'),(30,'13611806866','0385','1',NULL,'2019-12-11 16:40:04',NULL,'2019-12-11 16:40:04'),(31,'13611806866','8996','1',NULL,'2019-12-11 16:40:08',NULL,'2019-12-11 16:40:08'),(32,'13611806866','7317','1',NULL,'2019-12-11 16:40:30',NULL,'2019-12-11 16:40:30'),(33,'13611806866','9579','1',NULL,'2019-12-11 16:41:05',NULL,'2019-12-11 16:41:05'),(34,'13611806866','2132','1',NULL,'2019-12-11 16:41:18',NULL,'2019-12-11 16:41:18'),(35,'13611806866','0760','1',NULL,'2019-12-11 16:41:38',NULL,'2019-12-11 16:41:38'),(36,'13611806866','5004','1',NULL,'2019-12-11 16:41:53',NULL,'2019-12-11 16:41:53'),(37,'13611806866','4411','1',NULL,'2019-12-11 16:42:00',NULL,'2019-12-11 16:42:00'),(38,'13611806866','4601','1',NULL,'2019-12-11 16:42:09',NULL,'2019-12-11 16:42:09'),(39,'13611806866','8991','1',NULL,'2019-12-11 16:42:16',NULL,'2019-12-11 16:42:16'),(40,'13611806866','0110','1',NULL,'2019-12-11 16:42:43',NULL,'2019-12-11 16:42:43'),(41,'13611806866','6230','1',NULL,'2019-12-11 16:42:59',NULL,'2019-12-11 16:42:59'),(42,'13611806866','2783','1',NULL,'2019-12-11 16:43:12',NULL,'2019-12-11 16:43:12'),(43,'13611806866','7426','1',NULL,'2019-12-11 16:44:37',NULL,'2019-12-11 16:44:37'),(44,'13611806866','4814','1',NULL,'2019-12-11 16:44:48',NULL,'2019-12-11 16:44:48'),(45,'13611806866','7684','1',NULL,'2019-12-11 16:44:54',NULL,'2019-12-11 16:44:54'),(46,'13611806866','5685','1',NULL,'2019-12-11 16:45:22',NULL,'2019-12-11 16:45:22'),(47,'13611806866','4741','1',NULL,'2019-12-11 16:45:25',NULL,'2019-12-11 16:45:25'),(48,'13611806866','5979','1',NULL,'2019-12-11 16:46:31',NULL,'2019-12-11 16:46:31'),(49,'13611806866','4143','1',NULL,'2019-12-11 16:46:41',NULL,'2019-12-11 16:46:41'),(50,'13611806866','8966','1',NULL,'2019-12-11 16:46:48',NULL,'2019-12-11 16:46:48'),(51,'13611806866','2450','1',NULL,'2019-12-11 16:46:51',NULL,'2019-12-11 16:46:51'),(52,'13611806866','1322','1',NULL,'2019-12-11 16:47:17',NULL,'2019-12-11 16:47:17'),(53,'13611806866','3454','1',NULL,'2019-12-11 16:47:31',NULL,'2019-12-11 16:47:31'),(54,'13611806866','2672','1',NULL,'2019-12-11 16:47:36',NULL,'2019-12-11 16:47:36'),(55,'13611806866','9352','1',NULL,'2019-12-11 16:47:39',NULL,'2019-12-11 16:47:39'),(56,'13611806866','3746','1',NULL,'2019-12-11 16:48:05',NULL,'2019-12-11 16:48:05'),(57,'13611806866','7517','1',NULL,'2019-12-11 16:48:11',NULL,'2019-12-11 16:48:11'),(58,'13611806866','1073','1',NULL,'2019-12-11 16:48:43',NULL,'2019-12-11 16:48:43'),(59,'13611806866','6871','1',NULL,'2019-12-11 16:50:44',NULL,'2019-12-11 16:50:44'),(60,'13611806866','5329','1',NULL,'2019-12-11 16:52:43',NULL,'2019-12-11 16:52:43'),(61,'13611806866','0461','1',NULL,'2019-12-11 16:54:18',NULL,'2019-12-11 16:54:18'),(62,'13611806866','9390','1',NULL,'2019-12-11 16:54:38',NULL,'2019-12-11 16:54:38'),(63,'13611806866','4035','1',NULL,'2019-12-11 16:59:31',NULL,'2019-12-11 16:59:31'),(64,'17109324121','3863','1',NULL,'2019-12-12 08:51:35',NULL,'2019-12-12 08:51:35'),(65,'17109324121','5561','1',NULL,'2019-12-12 08:52:28',NULL,'2019-12-12 08:52:28'),(66,'17109324122','5761','1',NULL,'2019-12-12 08:52:40',NULL,'2019-12-12 08:52:40'),(67,'17109324121','1343','1',NULL,'2019-12-12 08:55:15',NULL,'2019-12-12 08:55:15'),(68,'17109324122','6295','1',NULL,'2019-12-12 08:55:22',NULL,'2019-12-12 08:55:22'),(69,'13611806866','1538','1',NULL,'2019-12-12 09:19:35',NULL,'2019-12-12 09:19:35'),(70,'13611806866','1523','1',NULL,'2019-12-12 09:20:27',NULL,'2019-12-12 09:20:27'),(71,'13611806866','8160','1',NULL,'2019-12-12 09:22:09',NULL,'2019-12-12 09:22:09'),(72,'13611806866','6156','1',NULL,'2019-12-12 09:32:06',NULL,'2019-12-12 09:32:06'),(73,'13611806866','4283','1',NULL,'2019-12-12 09:37:08',NULL,'2019-12-12 09:37:08'),(74,'13611806866','4277','1',NULL,'2019-12-12 09:37:35',NULL,'2019-12-12 09:37:35'),(75,'13611806866','3846','1',NULL,'2019-12-12 09:37:57',NULL,'2019-12-12 09:37:57'),(76,'13611806866','6835','1',NULL,'2019-12-12 09:39:07',NULL,'2019-12-12 09:39:07'),(77,'13611806866','6702','1',NULL,'2019-12-12 09:40:25',NULL,'2019-12-12 09:40:25'),(78,'13611806866','9437','1',NULL,'2019-12-12 09:40:58',NULL,'2019-12-12 09:40:58'),(79,'13611806866','4815','1',NULL,'2019-12-12 09:46:57',NULL,'2019-12-12 09:46:57'),(80,'13611806866','3262','1',NULL,'2019-12-12 09:49:28',NULL,'2019-12-12 09:49:28'),(81,'13611806866','1044','1',NULL,'2019-12-12 09:53:40',NULL,'2019-12-12 09:53:40'),(82,'13611806866','3326','1',NULL,'2019-12-12 10:16:33',NULL,'2019-12-12 10:16:33'),(83,'13611806866','2369','1',NULL,'2019-12-12 10:23:05',NULL,'2019-12-12 10:23:05'),(84,'13611806866','7024','1',NULL,'2019-12-12 11:44:57',NULL,'2019-12-12 11:44:57'),(85,'13611806866','8685','1',NULL,'2019-12-12 11:47:26',NULL,'2019-12-12 11:47:26'),(86,'13611806866','4957','1',NULL,'2019-12-12 11:48:53',NULL,'2019-12-12 11:48:53'),(87,'13611806866','7513','1',NULL,'2019-12-12 11:51:35',NULL,'2019-12-12 11:51:35'),(88,'13611806866','5023','1',NULL,'2019-12-12 11:55:06',NULL,'2019-12-12 11:55:06'),(89,'13611806866','1294','1',NULL,'2019-12-12 13:10:24',NULL,'2019-12-12 13:10:24'),(90,'13611806866','3387','1',NULL,'2019-12-13 11:29:10',NULL,'2019-12-13 11:29:10'),(91,'13611806866','3563','1',NULL,'2019-12-13 16:48:06',NULL,'2019-12-13 16:48:06'),(92,'13611806866','3482','1',NULL,'2019-12-13 16:56:05',NULL,'2019-12-13 16:56:05'),(93,'13611806866','2558','1',NULL,'2019-12-13 16:57:00',NULL,'2019-12-13 16:57:00'),(94,'13611806866','9476','1',NULL,'2019-12-13 16:57:52',NULL,'2019-12-13 16:57:52'),(95,'13611806866','0434','1',NULL,'2019-12-13 17:01:01',NULL,'2019-12-13 17:01:01'),(96,'13611806866','2058','1',NULL,'2019-12-16 12:54:41',NULL,'2019-12-16 12:54:41'),(97,'13611806866','9953','1',NULL,'2019-12-16 12:56:07',NULL,'2019-12-16 12:56:07'),(98,'13611806866','6838','1',NULL,'2019-12-16 13:07:22',NULL,'2019-12-16 13:07:22'),(99,'13611806866','6540','1',NULL,'2019-12-16 13:08:32',NULL,'2019-12-16 13:08:32');
/*!40000 ALTER TABLE `s_sms_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_tenant`
--

DROP TABLE IF EXISTS `s_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `serial_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '系统编码',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简称',
  `is_enable` tinyint(1) DEFAULT NULL COMMENT '是否已启用',
  `enable_time` datetime DEFAULT NULL COMMENT '生效日期',
  `disable_time` datetime DEFAULT NULL COMMENT '失效日期',
  `is_freeze` tinyint(1) DEFAULT NULL COMMENT '是否冻结',
  `is_leaf` tinyint(1) DEFAULT NULL COMMENT '是否叶子节点',
  `level` tinyint(4) DEFAULT NULL COMMENT '级次',
  `sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT '0' COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='租户主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_tenant`
--

LOCK TABLES `s_tenant` WRITE;
/*!40000 ALTER TABLE `s_tenant` DISABLE KEYS */;
INSERT INTO `s_tenant` VALUES (1,NULL,'0001','1','中建','测试',1,'2019-12-19 10:01:52','2020-12-18 10:01:52',0,0,NULL,NULL,NULL,0,1,'2019-10-09 01:22:29',1,'2019-10-09 01:22:29',1),(13,NULL,'0001','ZH20191216NX001','测试','测试',0,'2019-12-16 14:23:30','2020-01-16 14:23:30',0,NULL,NULL,NULL,NULL,0,NULL,'2019-12-16 14:23:37',NULL,'2019-12-16 14:23:37',0);
/*!40000 ALTER TABLE `s_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_vue_page_setting`
--

DROP TABLE IF EXISTS `s_vue_page_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_vue_page_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'vue export default 的 name',
  `code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置vue export default  name时所使用的type：constants_program.P_VUE_SETTING',
  `component` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '模块地址：@/views/10_system/vuesetting/vue',
  `meta_title` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '页面的名称',
  `meta_icon` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单中显示的icon',
  `descr` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  `c_id` bigint(20) DEFAULT NULL,
  `c_time` datetime DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `u_time` datetime DEFAULT NULL,
  `dbversion` int(11) DEFAULT NULL COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_s_vue_page_setting_1` (`name`),
  UNIQUE KEY `idx_s_vue_page_setting_2` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='vue页面配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_vue_page_setting`
--

LOCK TABLES `s_vue_page_setting` WRITE;
/*!40000 ALTER TABLE `s_vue_page_setting` DISABLE KEYS */;
INSERT INTO `s_vue_page_setting` VALUES (13,'P00000170','P_ORG','@/views/20_master/org/org','组织机构管理','组织机构管理',NULL,25,'2020-04-09 15:37:10',25,'2020-04-09 15:37:10',0),(14,'P00000160','P_POSITION','@/views/20_master/position/position','岗位信息','position',NULL,25,'2020-04-09 15:38:43',25,'2020-04-09 15:38:43',0),(15,'P00000150','P_DEPT','@/views/20_master/dept/dept','部门信息','dept',NULL,25,'2020-04-09 15:40:18',25,'2020-04-09 15:40:18',0),(16,'P00000140','P_STAFF','@/views/20_master/staff/staff','员工管理','staff',NULL,25,'2020-04-09 15:41:51',25,'2020-04-09 15:41:51',0),(17,'P00000130','P_ADDRESS','@/views/20_master/address/address','地址簿','address',NULL,25,'2020-04-09 15:43:24',25,'2020-04-09 15:43:24',0),(18,'P00000110','P_COMPANY','@/views/20_master/company/company','企业信息','company',NULL,25,'2020-04-09 15:44:54',25,'2020-04-09 15:44:54',0),(19,'P00000100','P_GROUP','@/views/20_master/group/group','集团信息','group',NULL,25,'2020-04-09 15:45:40',25,'2020-04-09 15:47:04',1),(20,'P00000120','P_MENU','@/views/10_system/sysmenu/sysmenu','菜单管理','菜单',NULL,25,'2020-04-09 15:47:34',25,'2020-04-09 15:47:34',0),(21,'P00000080','P_TENANT','@/views/10_system/tenant/tenant','租户管理','tenant',NULL,25,'2020-04-09 15:48:18',25,'2020-04-09 15:48:18',0),(22,'P00000060','P_CONFIG','@/views/10_system/config/config','系统参数','系统参数',NULL,25,'2020-04-09 15:50:17',25,'2020-04-09 15:50:17',0),(23,'P00000041','P_BUTTON','@/views/10_system/modulebutton/modulebutton','模块按钮','button',NULL,25,'2020-04-09 15:53:21',25,'2020-04-09 15:53:21',0),(24,'P00000040','P_PAGE','@/views/10_system/module/module','模块编辑','page',NULL,25,'2020-04-09 15:53:47',25,'2020-04-09 15:53:47',0),(25,'P00000050','P_DICT_DATA','@/views/10_system/dictdata/dictdata','字典数据','dict',NULL,25,'2020-04-09 15:54:22',25,'2020-04-09 15:55:05',1),(26,'P00000030','P_DICT_TYPE','@/views/10_system/dicttype/dicttype','字典类型','type',NULL,25,'2020-04-09 15:57:29',25,'2020-04-09 15:57:29',0),(27,'P00000180','P_SYSCODE','@/views/00_platform/syscode/syscode','系统编码','syscode',NULL,25,'2020-04-09 15:57:58',25,'2020-04-09 15:57:58',0),(28,'P00000020','P_RESOURCE','@/views/10_system/resource/resource','资源管理','资源管理',NULL,25,'2020-04-09 15:58:22',25,'2020-04-09 15:58:22',0),(29,'P00000000','P_ROLE','@/views/10_system/role/role\'','角色管理','角色',NULL,25,'2020-04-09 15:59:06',25,'2020-04-09 15:59:06',0),(30,'P00000190','P_VUE_SETTING','@/views/10_system/vuesetting/vue','vue页面维护','vue',NULL,25,'2020-04-09 15:59:52',25,'2020-04-09 15:59:52',0);
/*!40000 ALTER TABLE `s_vue_page_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_areas_info`
--

DROP TABLE IF EXISTS `v_areas_info`;
/*!50001 DROP VIEW IF EXISTS `v_areas_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_areas_info` AS SELECT 
 1 AS `province_id`,
 1 AS `province_code`,
 1 AS `province_name`,
 1 AS `city_id`,
 1 AS `city_code`,
 1 AS `city_name`,
 1 AS `area_id`,
 1 AS `area_code`,
 1 AS `area_name`,
 1 AS `cascader_id`,
 1 AS `cascader_code`,
 1 AS `cascader_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_areas_tree`
--

DROP TABLE IF EXISTS `v_areas_tree`;
/*!50001 DROP VIEW IF EXISTS `v_areas_tree`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_areas_tree` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `parent_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dict_info`
--

DROP TABLE IF EXISTS `v_dict_info`;
/*!50001 DROP VIEW IF EXISTS `v_dict_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dict_info` AS SELECT 
 1 AS `name`,
 1 AS `label`,
 1 AS `code`,
 1 AS `dict_value`,
 1 AS `is_del`,
 1 AS `extra1`,
 1 AS `extra2`,
 1 AS `extra3`,
 1 AS `extra4`,
 1 AS `sort`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_org_relation`
--

DROP TABLE IF EXISTS `v_org_relation`;
/*!50001 DROP VIEW IF EXISTS `v_org_relation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_org_relation` AS SELECT 
 1 AS `parent_serial_id`,
 1 AS `parent_serial_type`,
 1 AS `parent_name`,
 1 AS `parent_simple_name`,
 1 AS `parent_type_text`,
 1 AS `id`,
 1 AS `parent_id`,
 1 AS `tenant_id`,
 1 AS `serial_id`,
 1 AS `serial_type`,
 1 AS `type`,
 1 AS `code`,
 1 AS `son_count`,
 1 AS `c_id`,
 1 AS `c_time`,
 1 AS `u_id`,
 1 AS `u_time`,
 1 AS `dbversion`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'business'
--

--
-- Final view structure for view `v_areas_info`
--

/*!50001 DROP VIEW IF EXISTS `v_areas_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_areas_info` AS select `t3`.`id` AS `province_id`,`t1`.`province_code` AS `province_code`,`t3`.`name` AS `province_name`,`t2`.`id` AS `city_id`,`t1`.`city_code` AS `city_code`,`t2`.`name` AS `city_name`,`t1`.`id` AS `area_id`,`t1`.`code` AS `area_code`,`t1`.`name` AS `area_name`,concat_ws(',',`t3`.`id`,`t2`.`id`,`t1`.`id`) AS `cascader_id`,concat_ws(',',`t3`.`code`,`t2`.`code`,`t1`.`code`) AS `cascader_code`,concat_ws(',',`t3`.`name`,`t2`.`name`,`t1`.`name`) AS `cascader_name` from ((`s_areas` `t1` left join `s_area_cities` `t2` on(((`t1`.`city_code` = `t2`.`code`) and (`t1`.`province_code` = `t2`.`province_code`)))) left join `s_area_provinces` `t3` on((`t1`.`province_code` = `t3`.`code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_areas_tree`
--

/*!50001 DROP VIEW IF EXISTS `v_areas_tree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_areas_tree` AS select `t1`.`code` AS `id`,`t1`.`name` AS `name`,`t1`.`province_code` AS `parent_id` from `s_area_cities` `t1` union all select `t2`.`code` AS `id`,`t2`.`name` AS `name`,NULL AS `parent_id` from `s_area_provinces` `t2` union all select `t3`.`code` AS `id`,`t3`.`name` AS `name`,`t3`.`city_code` AS `parent_id` from `s_areas` `t3` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dict_info`
--

/*!50001 DROP VIEW IF EXISTS `v_dict_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dict_info` AS select `t1`.`name` AS `name`,`t2`.`label` AS `label`,`t1`.`code` AS `code`,`t2`.`dict_value` AS `dict_value`,`t1`.`is_del` AS `is_del`,`t2`.`extra1` AS `extra1`,`t2`.`extra2` AS `extra2`,`t2`.`extra3` AS `extra3`,`t2`.`extra4` AS `extra4`,`t2`.`sort` AS `sort` from (`s_dict_type` `t1` join `s_dict_data` `t2` on((`t1`.`id` = `t2`.`dict_type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_org_relation`
--

/*!50001 DROP VIEW IF EXISTS `v_org_relation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_org_relation` AS select `t`.`parent_serial_id` AS `parent_serial_id`,`t`.`parent_serial_type` AS `parent_serial_type`,`t`.`parent_name` AS `parent_name`,`t`.`parent_simple_name` AS `parent_simple_name`,`t`.`parent_type_text` AS `parent_type_text`,`t`.`id` AS `id`,`t`.`parent_id` AS `parent_id`,`t`.`tenant_id` AS `tenant_id`,`t`.`serial_id` AS `serial_id`,`t`.`serial_type` AS `serial_type`,`t`.`type` AS `type`,`t`.`code` AS `code`,`t`.`son_count` AS `son_count`,`t`.`c_id` AS `c_id`,`t`.`c_time` AS `c_time`,`t`.`u_id` AS `u_id`,`t`.`u_time` AS `u_time`,`t`.`dbversion` AS `dbversion` from (select `subt2`.`serial_id` AS `parent_serial_id`,`subt2`.`serial_type` AS `parent_serial_type`,`subt3`.`name` AS `parent_name`,`subt3`.`simple_name` AS `parent_simple_name`,`subt4`.`label` AS `parent_type_text`,`subt1`.`id` AS `id`,`subt1`.`parent_id` AS `parent_id`,`subt1`.`tenant_id` AS `tenant_id`,`subt1`.`serial_id` AS `serial_id`,`subt1`.`serial_type` AS `serial_type`,`subt1`.`type` AS `type`,`subt1`.`code` AS `code`,`subt1`.`son_count` AS `son_count`,`subt1`.`c_id` AS `c_id`,`subt1`.`c_time` AS `c_time`,`subt1`.`u_id` AS `u_id`,`subt1`.`u_time` AS `u_time`,`subt1`.`dbversion` AS `dbversion` from (((`m_org` `subt1` left join `m_org` `subt2` on((`subt1`.`parent_id` = `subt2`.`id`))) left join (select `tab1`.`id` AS `serial_id`,`tab1`.`name` AS `name`,`tab1`.`simple_name` AS `simple_name`,'10' AS `type`,'s_tenant' AS `serial_type` from `s_tenant` `tab1` union all select `tab2`.`id` AS `serial_id`,`tab2`.`name` AS `name`,`tab2`.`simple_name` AS `simple_name`,'20' AS `type`,'m_group' AS `serial_type` from `m_group` `tab2` union all select `tab3`.`id` AS `serial_id`,`tab3`.`name` AS `name`,`tab3`.`simple_name` AS `simple_name`,'30' AS `type`,'m_company' AS `serial_type` from `m_company` `tab3` union all select `tab4`.`id` AS `serial_id`,`tab4`.`name` AS `name`,`tab4`.`simple_name` AS `simple_name`,'40' AS `type`,'m_dept' AS `serial_type` from `m_dept` `tab4` union all select `tab5`.`id` AS `serial_id`,`tab5`.`name` AS `name`,`tab5`.`simple_name` AS `simple_name`,'50' AS `type`,'m_position' AS `serial_type` from `m_position` `tab5` union all select `tab6`.`id` AS `serial_id`,`tab6`.`name` AS `name`,`tab6`.`simple_name` AS `simple_name`,'60' AS `type`,'m_staff' AS `serial_type` from `m_staff` `tab6`) `subt3` on(((`subt3`.`serial_type` = `subt2`.`serial_type`) and (`subt3`.`serial_id` = `subt2`.`serial_id`)))) left join `v_dict_info` `subt4` on(((`subt4`.`dict_value` = `subt2`.`type`) and (`subt4`.`code` = 'org_setting_type'))))) `t` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-17 17:18:09
