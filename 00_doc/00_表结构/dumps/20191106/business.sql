/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100408
 Source Host           : localhost:33006
 Source Schema         : business

 Target Server Type    : MariaDB
 Target Server Version : 100408
 File Encoding         : 65001

 Date: 06/11/2019 17:20:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_address
-- ----------------------------
DROP TABLE IF EXISTS `m_address`;
CREATE TABLE `m_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `postal_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `link_man` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `is_default` tinyint(1) NULL DEFAULT NULL COMMENT '默认',
  `tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `province_code` int(11) NULL DEFAULT NULL COMMENT '省',
  `city_code` int(11) NULL DEFAULT NULL COMMENT '市',
  `area_code` int(11) NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `serial_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联单号',
  `serial_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联单号类型',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `tentant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_m_address_1`(`serial_no`, `serial_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_company
-- ----------------------------
DROP TABLE IF EXISTS `m_company`;
CREATE TABLE `m_company`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社会信用代码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业全称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业简称',
  `address_id` bigint(20) NULL DEFAULT NULL,
  `juridical_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法定代表人',
  `register_capital` decimal(20, 4) NULL DEFAULT NULL COMMENT '注册资本',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '=0,内资=1,国有全资=2,集体全资=3,股份合作=4,联营=5,国有联营=6,集体联营=7,国有与集体联营=8,其它联营=9,有限责任（公司）=10,国有独资（公司）=11,其它有限责任（公司）=12,股份有限（公司）=13,私有=14,私有独资=15,私有合伙=16,私营有限责任（公司）=17,个体经营=18,私营股份有限（公司）=19,其它私有=20,其它内资=21,内地与港、澳、台合作=22,内地与港、澳、台合资=23,港、澳、台投资=24,港、澳、台独资=25,港、澳、台投资股份有限（公司）=26,其他港、澳、台投资=27,外资=28,国外投资股份有限（公司）=29,其他国外投资=30,其他=31',
  `setup_date` date NULL DEFAULT NULL COMMENT '成立日期',
  `end_date` date NULL DEFAULT NULL COMMENT '营业有效期',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `tentant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公司主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_group
-- ----------------------------
DROP TABLE IF EXISTS `m_group`;
CREATE TABLE `m_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团名称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `tentant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集团主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_group
-- ----------------------------
INSERT INTO `m_group` VALUES (4, '1', '23', '1', '', 0, NULL, 1, '2019-10-30 14:14:51', 1, '2019-10-30 14:33:37', 4);
INSERT INTO `m_group` VALUES (5, '2', '1', '2', '', 0, NULL, 1, '2019-10-30 14:17:08', 1, '2019-10-30 14:32:59', 1);

-- ----------------------------
-- Table structure for m_staff
-- ----------------------------
DROP TABLE IF EXISTS `m_staff`;
CREATE TABLE `m_staff`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '用户',
  `deptid` bigint(20) NULL DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '编码',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `office_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `idcardno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `iswed` tinyint(1) NULL DEFAULT NULL COMMENT '婚否',
  `nation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名族',
  `service` tinyint(1) NULL DEFAULT NULL COMMENT '是否在职\n在职=1,不在职=0,离职=2,离退休=3,返聘=4',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '员工' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户实名',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码\n',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否是已经删除\n',
  `is_lock` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定\n',
  `is_enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用\n',
  `effective_date` datetime(0) NULL DEFAULT NULL COMMENT '生效时间\n',
  `invalidation_date` datetime(0) NULL DEFAULT NULL COMMENT '失效时间\n',
  `err_count` int(11) NULL DEFAULT NULL COMMENT '登录错误次数\n',
  `group_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属用户组\n用户组织范围\n包含下级组织的组织范围\n',
  `staff_id` bigint(20) NULL DEFAULT NULL,
  `pwd_effective_date` datetime(0) NULL DEFAULT NULL COMMENT '密码生效日期\n',
  `locked_time` datetime(0) NULL DEFAULT NULL COMMENT '用户锁定时间',
  `is_biz_admin` tinyint(1) NULL DEFAULT NULL COMMENT '是否为业务管理员',
  `is_changed_pwd` tinyint(1) NULL DEFAULT NULL COMMENT '是否修改过密码',
  `login_author_way` tinyint(1) NULL DEFAULT NULL COMMENT '传统认证方式=0,智能钥匙认证=1,动态密码锁=2,指纹认证方式=3',
  `pwd_his_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '历史密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `home_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭电话',
  `office_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办公室电话',
  `cell_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户名称',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像路径',
  `last_login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_UNIQUE`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, 'zxh', NULL, NULL, NULL, NULL, '$2a$10$x66JhJCybrBiq..3Q1mfcerbPCI1064U0H20ziP0mHrwqIj15hX7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for m_user_back
-- ----------------------------
DROP TABLE IF EXISTS `m_user_back`;
CREATE TABLE `m_user_back`  (
  `id` bigint(20) NOT NULL DEFAULT 0,
  `login_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户实名',
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码\n',
  `isdel` tinyint(1) NULL DEFAULT NULL COMMENT '是否是已经删除\n',
  `islock` tinyint(1) NULL DEFAULT NULL COMMENT '是否锁定\n',
  `isenable` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用\n',
  `effective_date` datetime(0) NULL DEFAULT NULL COMMENT '生效时间\n',
  `invalidation_date` datetime(0) NULL DEFAULT NULL COMMENT '失效时间\n',
  `err_count` int(11) NULL DEFAULT NULL COMMENT '登录错误次数\n',
  `group_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '所属用户组\n用户组织范围\n包含下级组织的组织范围\n',
  `staff_id` bigint(20) NULL DEFAULT NULL,
  `pwd_effective_date` datetime(0) NULL DEFAULT NULL COMMENT '密码生效日期\n',
  `locked_time` datetime(0) NULL DEFAULT NULL COMMENT '用户锁定时间',
  `is_biz_admin` tinyint(1) NULL DEFAULT NULL COMMENT '是否为业务管理员',
  `is_changed_pwd` tinyint(1) NULL DEFAULT NULL COMMENT '是否修改过密码',
  `login_author_way` tinyint(1) NULL DEFAULT NULL COMMENT '传统认证方式=0,智能钥匙认证=1,动态密码锁=2,指纹认证方式=3',
  `pwd_his_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '历史密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `home_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '家庭电话',
  `office_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '办公室电话',
  `cell_telno` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '手机号码',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户名称',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像路径',
  `last_login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user_back
-- ----------------------------
INSERT INTO `m_user_back` VALUES (1, 'zxh', NULL, NULL, NULL, NULL, '$2a$10$x66JhJCybrBiq..3Q1mfcerbPCI1064U0H20ziP0mHrwqIj15hX7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for m_user_lite
-- ----------------------------
DROP TABLE IF EXISTS `m_user_lite`;
CREATE TABLE `m_user_lite`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70',
  `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码\n',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_UNIQUE`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表 简单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blob_data` blob NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_data` blob NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('PerfectScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('PerfectScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('PerfectScheduler', 'DESKTOP-FK3BIJC1572246839909', 1572253626967, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_area_cities
-- ----------------------------
DROP TABLE IF EXISTS `s_area_cities`;
CREATE TABLE `s_area_cities`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) NULL DEFAULT NULL COMMENT '市级编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
  `province_code` int(11) NULL DEFAULT NULL COMMENT '省级编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_s_cities_1`(`code`) USING BTREE,
  INDEX `idx_s_cities_2`(`province_code`) USING BTREE,
  INDEX `idx_s_cities_3`(`code`, `province_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 344 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_area_cities
-- ----------------------------
INSERT INTO `s_area_cities` VALUES (1, 1101, '市辖区', 11);
INSERT INTO `s_area_cities` VALUES (2, 1201, '市辖区', 12);
INSERT INTO `s_area_cities` VALUES (3, 1301, '石家庄市', 13);
INSERT INTO `s_area_cities` VALUES (4, 1302, '唐山市', 13);
INSERT INTO `s_area_cities` VALUES (5, 1303, '秦皇岛市', 13);
INSERT INTO `s_area_cities` VALUES (6, 1304, '邯郸市', 13);
INSERT INTO `s_area_cities` VALUES (7, 1305, '邢台市', 13);
INSERT INTO `s_area_cities` VALUES (8, 1306, '保定市', 13);
INSERT INTO `s_area_cities` VALUES (9, 1307, '张家口市', 13);
INSERT INTO `s_area_cities` VALUES (10, 1308, '承德市', 13);
INSERT INTO `s_area_cities` VALUES (11, 1309, '沧州市', 13);
INSERT INTO `s_area_cities` VALUES (12, 1310, '廊坊市', 13);
INSERT INTO `s_area_cities` VALUES (13, 1311, '衡水市', 13);
INSERT INTO `s_area_cities` VALUES (14, 1401, '太原市', 14);
INSERT INTO `s_area_cities` VALUES (15, 1402, '大同市', 14);
INSERT INTO `s_area_cities` VALUES (16, 1403, '阳泉市', 14);
INSERT INTO `s_area_cities` VALUES (17, 1404, '长治市', 14);
INSERT INTO `s_area_cities` VALUES (18, 1405, '晋城市', 14);
INSERT INTO `s_area_cities` VALUES (19, 1406, '朔州市', 14);
INSERT INTO `s_area_cities` VALUES (20, 1407, '晋中市', 14);
INSERT INTO `s_area_cities` VALUES (21, 1408, '运城市', 14);
INSERT INTO `s_area_cities` VALUES (22, 1409, '忻州市', 14);
INSERT INTO `s_area_cities` VALUES (23, 1410, '临汾市', 14);
INSERT INTO `s_area_cities` VALUES (24, 1411, '吕梁市', 14);
INSERT INTO `s_area_cities` VALUES (25, 1501, '呼和浩特市', 15);
INSERT INTO `s_area_cities` VALUES (26, 1502, '包头市', 15);
INSERT INTO `s_area_cities` VALUES (27, 1503, '乌海市', 15);
INSERT INTO `s_area_cities` VALUES (28, 1504, '赤峰市', 15);
INSERT INTO `s_area_cities` VALUES (29, 1505, '通辽市', 15);
INSERT INTO `s_area_cities` VALUES (30, 1506, '鄂尔多斯市', 15);
INSERT INTO `s_area_cities` VALUES (31, 1507, '呼伦贝尔市', 15);
INSERT INTO `s_area_cities` VALUES (32, 1508, '巴彦淖尔市', 15);
INSERT INTO `s_area_cities` VALUES (33, 1509, '乌兰察布市', 15);
INSERT INTO `s_area_cities` VALUES (34, 1522, '兴安盟', 15);
INSERT INTO `s_area_cities` VALUES (35, 1525, '锡林郭勒盟', 15);
INSERT INTO `s_area_cities` VALUES (36, 1529, '阿拉善盟', 15);
INSERT INTO `s_area_cities` VALUES (37, 2101, '沈阳市', 21);
INSERT INTO `s_area_cities` VALUES (38, 2102, '大连市', 21);
INSERT INTO `s_area_cities` VALUES (39, 2103, '鞍山市', 21);
INSERT INTO `s_area_cities` VALUES (40, 2104, '抚顺市', 21);
INSERT INTO `s_area_cities` VALUES (41, 2105, '本溪市', 21);
INSERT INTO `s_area_cities` VALUES (42, 2106, '丹东市', 21);
INSERT INTO `s_area_cities` VALUES (43, 2107, '锦州市', 21);
INSERT INTO `s_area_cities` VALUES (44, 2108, '营口市', 21);
INSERT INTO `s_area_cities` VALUES (45, 2109, '阜新市', 21);
INSERT INTO `s_area_cities` VALUES (46, 2110, '辽阳市', 21);
INSERT INTO `s_area_cities` VALUES (47, 2111, '盘锦市', 21);
INSERT INTO `s_area_cities` VALUES (48, 2112, '铁岭市', 21);
INSERT INTO `s_area_cities` VALUES (49, 2113, '朝阳市', 21);
INSERT INTO `s_area_cities` VALUES (50, 2114, '葫芦岛市', 21);
INSERT INTO `s_area_cities` VALUES (51, 2201, '长春市', 22);
INSERT INTO `s_area_cities` VALUES (52, 2202, '吉林市', 22);
INSERT INTO `s_area_cities` VALUES (53, 2203, '四平市', 22);
INSERT INTO `s_area_cities` VALUES (54, 2204, '辽源市', 22);
INSERT INTO `s_area_cities` VALUES (55, 2205, '通化市', 22);
INSERT INTO `s_area_cities` VALUES (56, 2206, '白山市', 22);
INSERT INTO `s_area_cities` VALUES (57, 2207, '松原市', 22);
INSERT INTO `s_area_cities` VALUES (58, 2208, '白城市', 22);
INSERT INTO `s_area_cities` VALUES (59, 2224, '延边朝鲜族自治州', 22);
INSERT INTO `s_area_cities` VALUES (60, 2301, '哈尔滨市', 23);
INSERT INTO `s_area_cities` VALUES (61, 2302, '齐齐哈尔市', 23);
INSERT INTO `s_area_cities` VALUES (62, 2303, '鸡西市', 23);
INSERT INTO `s_area_cities` VALUES (63, 2304, '鹤岗市', 23);
INSERT INTO `s_area_cities` VALUES (64, 2305, '双鸭山市', 23);
INSERT INTO `s_area_cities` VALUES (65, 2306, '大庆市', 23);
INSERT INTO `s_area_cities` VALUES (66, 2307, '伊春市', 23);
INSERT INTO `s_area_cities` VALUES (67, 2308, '佳木斯市', 23);
INSERT INTO `s_area_cities` VALUES (68, 2309, '七台河市', 23);
INSERT INTO `s_area_cities` VALUES (69, 2310, '牡丹江市', 23);
INSERT INTO `s_area_cities` VALUES (70, 2311, '黑河市', 23);
INSERT INTO `s_area_cities` VALUES (71, 2312, '绥化市', 23);
INSERT INTO `s_area_cities` VALUES (72, 2327, '大兴安岭地区', 23);
INSERT INTO `s_area_cities` VALUES (73, 3101, '市辖区', 31);
INSERT INTO `s_area_cities` VALUES (74, 3201, '南京市', 32);
INSERT INTO `s_area_cities` VALUES (75, 3202, '无锡市', 32);
INSERT INTO `s_area_cities` VALUES (76, 3203, '徐州市', 32);
INSERT INTO `s_area_cities` VALUES (77, 3204, '常州市', 32);
INSERT INTO `s_area_cities` VALUES (78, 3205, '苏州市', 32);
INSERT INTO `s_area_cities` VALUES (79, 3206, '南通市', 32);
INSERT INTO `s_area_cities` VALUES (80, 3207, '连云港市', 32);
INSERT INTO `s_area_cities` VALUES (81, 3208, '淮安市', 32);
INSERT INTO `s_area_cities` VALUES (82, 3209, '盐城市', 32);
INSERT INTO `s_area_cities` VALUES (83, 3210, '扬州市', 32);
INSERT INTO `s_area_cities` VALUES (84, 3211, '镇江市', 32);
INSERT INTO `s_area_cities` VALUES (85, 3212, '泰州市', 32);
INSERT INTO `s_area_cities` VALUES (86, 3213, '宿迁市', 32);
INSERT INTO `s_area_cities` VALUES (87, 3301, '杭州市', 33);
INSERT INTO `s_area_cities` VALUES (88, 3302, '宁波市', 33);
INSERT INTO `s_area_cities` VALUES (89, 3303, '温州市', 33);
INSERT INTO `s_area_cities` VALUES (90, 3304, '嘉兴市', 33);
INSERT INTO `s_area_cities` VALUES (91, 3305, '湖州市', 33);
INSERT INTO `s_area_cities` VALUES (92, 3306, '绍兴市', 33);
INSERT INTO `s_area_cities` VALUES (93, 3307, '金华市', 33);
INSERT INTO `s_area_cities` VALUES (94, 3308, '衢州市', 33);
INSERT INTO `s_area_cities` VALUES (95, 3309, '舟山市', 33);
INSERT INTO `s_area_cities` VALUES (96, 3310, '台州市', 33);
INSERT INTO `s_area_cities` VALUES (97, 3311, '丽水市', 33);
INSERT INTO `s_area_cities` VALUES (98, 3401, '合肥市', 34);
INSERT INTO `s_area_cities` VALUES (99, 3402, '芜湖市', 34);
INSERT INTO `s_area_cities` VALUES (100, 3403, '蚌埠市', 34);
INSERT INTO `s_area_cities` VALUES (101, 3404, '淮南市', 34);
INSERT INTO `s_area_cities` VALUES (102, 3405, '马鞍山市', 34);
INSERT INTO `s_area_cities` VALUES (103, 3406, '淮北市', 34);
INSERT INTO `s_area_cities` VALUES (104, 3407, '铜陵市', 34);
INSERT INTO `s_area_cities` VALUES (105, 3408, '安庆市', 34);
INSERT INTO `s_area_cities` VALUES (106, 3410, '黄山市', 34);
INSERT INTO `s_area_cities` VALUES (107, 3411, '滁州市', 34);
INSERT INTO `s_area_cities` VALUES (108, 3412, '阜阳市', 34);
INSERT INTO `s_area_cities` VALUES (109, 3413, '宿州市', 34);
INSERT INTO `s_area_cities` VALUES (110, 3415, '六安市', 34);
INSERT INTO `s_area_cities` VALUES (111, 3416, '亳州市', 34);
INSERT INTO `s_area_cities` VALUES (112, 3417, '池州市', 34);
INSERT INTO `s_area_cities` VALUES (113, 3418, '宣城市', 34);
INSERT INTO `s_area_cities` VALUES (114, 3501, '福州市', 35);
INSERT INTO `s_area_cities` VALUES (115, 3502, '厦门市', 35);
INSERT INTO `s_area_cities` VALUES (116, 3503, '莆田市', 35);
INSERT INTO `s_area_cities` VALUES (117, 3504, '三明市', 35);
INSERT INTO `s_area_cities` VALUES (118, 3505, '泉州市', 35);
INSERT INTO `s_area_cities` VALUES (119, 3506, '漳州市', 35);
INSERT INTO `s_area_cities` VALUES (120, 3507, '南平市', 35);
INSERT INTO `s_area_cities` VALUES (121, 3508, '龙岩市', 35);
INSERT INTO `s_area_cities` VALUES (122, 3509, '宁德市', 35);
INSERT INTO `s_area_cities` VALUES (123, 3601, '南昌市', 36);
INSERT INTO `s_area_cities` VALUES (124, 3602, '景德镇市', 36);
INSERT INTO `s_area_cities` VALUES (125, 3603, '萍乡市', 36);
INSERT INTO `s_area_cities` VALUES (126, 3604, '九江市', 36);
INSERT INTO `s_area_cities` VALUES (127, 3605, '新余市', 36);
INSERT INTO `s_area_cities` VALUES (128, 3606, '鹰潭市', 36);
INSERT INTO `s_area_cities` VALUES (129, 3607, '赣州市', 36);
INSERT INTO `s_area_cities` VALUES (130, 3608, '吉安市', 36);
INSERT INTO `s_area_cities` VALUES (131, 3609, '宜春市', 36);
INSERT INTO `s_area_cities` VALUES (132, 3610, '抚州市', 36);
INSERT INTO `s_area_cities` VALUES (133, 3611, '上饶市', 36);
INSERT INTO `s_area_cities` VALUES (134, 3701, '济南市', 37);
INSERT INTO `s_area_cities` VALUES (135, 3702, '青岛市', 37);
INSERT INTO `s_area_cities` VALUES (136, 3703, '淄博市', 37);
INSERT INTO `s_area_cities` VALUES (137, 3704, '枣庄市', 37);
INSERT INTO `s_area_cities` VALUES (138, 3705, '东营市', 37);
INSERT INTO `s_area_cities` VALUES (139, 3706, '烟台市', 37);
INSERT INTO `s_area_cities` VALUES (140, 3707, '潍坊市', 37);
INSERT INTO `s_area_cities` VALUES (141, 3708, '济宁市', 37);
INSERT INTO `s_area_cities` VALUES (142, 3709, '泰安市', 37);
INSERT INTO `s_area_cities` VALUES (143, 3710, '威海市', 37);
INSERT INTO `s_area_cities` VALUES (144, 3711, '日照市', 37);
INSERT INTO `s_area_cities` VALUES (145, 3712, '莱芜市', 37);
INSERT INTO `s_area_cities` VALUES (146, 3713, '临沂市', 37);
INSERT INTO `s_area_cities` VALUES (147, 3714, '德州市', 37);
INSERT INTO `s_area_cities` VALUES (148, 3715, '聊城市', 37);
INSERT INTO `s_area_cities` VALUES (149, 3716, '滨州市', 37);
INSERT INTO `s_area_cities` VALUES (150, 3717, '菏泽市', 37);
INSERT INTO `s_area_cities` VALUES (151, 4101, '郑州市', 41);
INSERT INTO `s_area_cities` VALUES (152, 4102, '开封市', 41);
INSERT INTO `s_area_cities` VALUES (153, 4103, '洛阳市', 41);
INSERT INTO `s_area_cities` VALUES (154, 4104, '平顶山市', 41);
INSERT INTO `s_area_cities` VALUES (155, 4105, '安阳市', 41);
INSERT INTO `s_area_cities` VALUES (156, 4106, '鹤壁市', 41);
INSERT INTO `s_area_cities` VALUES (157, 4107, '新乡市', 41);
INSERT INTO `s_area_cities` VALUES (158, 4108, '焦作市', 41);
INSERT INTO `s_area_cities` VALUES (159, 4109, '濮阳市', 41);
INSERT INTO `s_area_cities` VALUES (160, 4110, '许昌市', 41);
INSERT INTO `s_area_cities` VALUES (161, 4111, '漯河市', 41);
INSERT INTO `s_area_cities` VALUES (162, 4112, '三门峡市', 41);
INSERT INTO `s_area_cities` VALUES (163, 4113, '南阳市', 41);
INSERT INTO `s_area_cities` VALUES (164, 4114, '商丘市', 41);
INSERT INTO `s_area_cities` VALUES (165, 4115, '信阳市', 41);
INSERT INTO `s_area_cities` VALUES (166, 4116, '周口市', 41);
INSERT INTO `s_area_cities` VALUES (167, 4117, '驻马店市', 41);
INSERT INTO `s_area_cities` VALUES (168, 4190, '省直辖县级行政区划', 41);
INSERT INTO `s_area_cities` VALUES (169, 4201, '武汉市', 42);
INSERT INTO `s_area_cities` VALUES (170, 4202, '黄石市', 42);
INSERT INTO `s_area_cities` VALUES (171, 4203, '十堰市', 42);
INSERT INTO `s_area_cities` VALUES (172, 4205, '宜昌市', 42);
INSERT INTO `s_area_cities` VALUES (173, 4206, '襄阳市', 42);
INSERT INTO `s_area_cities` VALUES (174, 4207, '鄂州市', 42);
INSERT INTO `s_area_cities` VALUES (175, 4208, '荆门市', 42);
INSERT INTO `s_area_cities` VALUES (176, 4209, '孝感市', 42);
INSERT INTO `s_area_cities` VALUES (177, 4210, '荆州市', 42);
INSERT INTO `s_area_cities` VALUES (178, 4211, '黄冈市', 42);
INSERT INTO `s_area_cities` VALUES (179, 4212, '咸宁市', 42);
INSERT INTO `s_area_cities` VALUES (180, 4213, '随州市', 42);
INSERT INTO `s_area_cities` VALUES (181, 4228, '恩施土家族苗族自治州', 42);
INSERT INTO `s_area_cities` VALUES (182, 4290, '省直辖县级行政区划', 42);
INSERT INTO `s_area_cities` VALUES (183, 4301, '长沙市', 43);
INSERT INTO `s_area_cities` VALUES (184, 4302, '株洲市', 43);
INSERT INTO `s_area_cities` VALUES (185, 4303, '湘潭市', 43);
INSERT INTO `s_area_cities` VALUES (186, 4304, '衡阳市', 43);
INSERT INTO `s_area_cities` VALUES (187, 4305, '邵阳市', 43);
INSERT INTO `s_area_cities` VALUES (188, 4306, '岳阳市', 43);
INSERT INTO `s_area_cities` VALUES (189, 4307, '常德市', 43);
INSERT INTO `s_area_cities` VALUES (190, 4308, '张家界市', 43);
INSERT INTO `s_area_cities` VALUES (191, 4309, '益阳市', 43);
INSERT INTO `s_area_cities` VALUES (192, 4310, '郴州市', 43);
INSERT INTO `s_area_cities` VALUES (193, 4311, '永州市', 43);
INSERT INTO `s_area_cities` VALUES (194, 4312, '怀化市', 43);
INSERT INTO `s_area_cities` VALUES (195, 4313, '娄底市', 43);
INSERT INTO `s_area_cities` VALUES (196, 4331, '湘西土家族苗族自治州', 43);
INSERT INTO `s_area_cities` VALUES (197, 4401, '广州市', 44);
INSERT INTO `s_area_cities` VALUES (198, 4402, '韶关市', 44);
INSERT INTO `s_area_cities` VALUES (199, 4403, '深圳市', 44);
INSERT INTO `s_area_cities` VALUES (200, 4404, '珠海市', 44);
INSERT INTO `s_area_cities` VALUES (201, 4405, '汕头市', 44);
INSERT INTO `s_area_cities` VALUES (202, 4406, '佛山市', 44);
INSERT INTO `s_area_cities` VALUES (203, 4407, '江门市', 44);
INSERT INTO `s_area_cities` VALUES (204, 4408, '湛江市', 44);
INSERT INTO `s_area_cities` VALUES (205, 4409, '茂名市', 44);
INSERT INTO `s_area_cities` VALUES (206, 4412, '肇庆市', 44);
INSERT INTO `s_area_cities` VALUES (207, 4413, '惠州市', 44);
INSERT INTO `s_area_cities` VALUES (208, 4414, '梅州市', 44);
INSERT INTO `s_area_cities` VALUES (209, 4415, '汕尾市', 44);
INSERT INTO `s_area_cities` VALUES (210, 4416, '河源市', 44);
INSERT INTO `s_area_cities` VALUES (211, 4417, '阳江市', 44);
INSERT INTO `s_area_cities` VALUES (212, 4418, '清远市', 44);
INSERT INTO `s_area_cities` VALUES (213, 4419, '东莞市', 44);
INSERT INTO `s_area_cities` VALUES (214, 4420, '中山市', 44);
INSERT INTO `s_area_cities` VALUES (215, 4451, '潮州市', 44);
INSERT INTO `s_area_cities` VALUES (216, 4452, '揭阳市', 44);
INSERT INTO `s_area_cities` VALUES (217, 4453, '云浮市', 44);
INSERT INTO `s_area_cities` VALUES (218, 4501, '南宁市', 45);
INSERT INTO `s_area_cities` VALUES (219, 4502, '柳州市', 45);
INSERT INTO `s_area_cities` VALUES (220, 4503, '桂林市', 45);
INSERT INTO `s_area_cities` VALUES (221, 4504, '梧州市', 45);
INSERT INTO `s_area_cities` VALUES (222, 4505, '北海市', 45);
INSERT INTO `s_area_cities` VALUES (223, 4506, '防城港市', 45);
INSERT INTO `s_area_cities` VALUES (224, 4507, '钦州市', 45);
INSERT INTO `s_area_cities` VALUES (225, 4508, '贵港市', 45);
INSERT INTO `s_area_cities` VALUES (226, 4509, '玉林市', 45);
INSERT INTO `s_area_cities` VALUES (227, 4510, '百色市', 45);
INSERT INTO `s_area_cities` VALUES (228, 4511, '贺州市', 45);
INSERT INTO `s_area_cities` VALUES (229, 4512, '河池市', 45);
INSERT INTO `s_area_cities` VALUES (230, 4513, '来宾市', 45);
INSERT INTO `s_area_cities` VALUES (231, 4514, '崇左市', 45);
INSERT INTO `s_area_cities` VALUES (232, 4601, '海口市', 46);
INSERT INTO `s_area_cities` VALUES (233, 4602, '三亚市', 46);
INSERT INTO `s_area_cities` VALUES (234, 4603, '三沙市', 46);
INSERT INTO `s_area_cities` VALUES (235, 4604, '儋州市', 46);
INSERT INTO `s_area_cities` VALUES (236, 4690, '省直辖县级行政区划', 46);
INSERT INTO `s_area_cities` VALUES (237, 5001, '市辖区', 50);
INSERT INTO `s_area_cities` VALUES (238, 5002, '县', 50);
INSERT INTO `s_area_cities` VALUES (239, 5101, '成都市', 51);
INSERT INTO `s_area_cities` VALUES (240, 5103, '自贡市', 51);
INSERT INTO `s_area_cities` VALUES (241, 5104, '攀枝花市', 51);
INSERT INTO `s_area_cities` VALUES (242, 5105, '泸州市', 51);
INSERT INTO `s_area_cities` VALUES (243, 5106, '德阳市', 51);
INSERT INTO `s_area_cities` VALUES (244, 5107, '绵阳市', 51);
INSERT INTO `s_area_cities` VALUES (245, 5108, '广元市', 51);
INSERT INTO `s_area_cities` VALUES (246, 5109, '遂宁市', 51);
INSERT INTO `s_area_cities` VALUES (247, 5110, '内江市', 51);
INSERT INTO `s_area_cities` VALUES (248, 5111, '乐山市', 51);
INSERT INTO `s_area_cities` VALUES (249, 5113, '南充市', 51);
INSERT INTO `s_area_cities` VALUES (250, 5114, '眉山市', 51);
INSERT INTO `s_area_cities` VALUES (251, 5115, '宜宾市', 51);
INSERT INTO `s_area_cities` VALUES (252, 5116, '广安市', 51);
INSERT INTO `s_area_cities` VALUES (253, 5117, '达州市', 51);
INSERT INTO `s_area_cities` VALUES (254, 5118, '雅安市', 51);
INSERT INTO `s_area_cities` VALUES (255, 5119, '巴中市', 51);
INSERT INTO `s_area_cities` VALUES (256, 5120, '资阳市', 51);
INSERT INTO `s_area_cities` VALUES (257, 5132, '阿坝藏族羌族自治州', 51);
INSERT INTO `s_area_cities` VALUES (258, 5133, '甘孜藏族自治州', 51);
INSERT INTO `s_area_cities` VALUES (259, 5134, '凉山彝族自治州', 51);
INSERT INTO `s_area_cities` VALUES (260, 5201, '贵阳市', 52);
INSERT INTO `s_area_cities` VALUES (261, 5202, '六盘水市', 52);
INSERT INTO `s_area_cities` VALUES (262, 5203, '遵义市', 52);
INSERT INTO `s_area_cities` VALUES (263, 5204, '安顺市', 52);
INSERT INTO `s_area_cities` VALUES (264, 5205, '毕节市', 52);
INSERT INTO `s_area_cities` VALUES (265, 5206, '铜仁市', 52);
INSERT INTO `s_area_cities` VALUES (266, 5223, '黔西南布依族苗族自治州', 52);
INSERT INTO `s_area_cities` VALUES (267, 5226, '黔东南苗族侗族自治州', 52);
INSERT INTO `s_area_cities` VALUES (268, 5227, '黔南布依族苗族自治州', 52);
INSERT INTO `s_area_cities` VALUES (269, 5301, '昆明市', 53);
INSERT INTO `s_area_cities` VALUES (270, 5303, '曲靖市', 53);
INSERT INTO `s_area_cities` VALUES (271, 5304, '玉溪市', 53);
INSERT INTO `s_area_cities` VALUES (272, 5305, '保山市', 53);
INSERT INTO `s_area_cities` VALUES (273, 5306, '昭通市', 53);
INSERT INTO `s_area_cities` VALUES (274, 5307, '丽江市', 53);
INSERT INTO `s_area_cities` VALUES (275, 5308, '普洱市', 53);
INSERT INTO `s_area_cities` VALUES (276, 5309, '临沧市', 53);
INSERT INTO `s_area_cities` VALUES (277, 5323, '楚雄彝族自治州', 53);
INSERT INTO `s_area_cities` VALUES (278, 5325, '红河哈尼族彝族自治州', 53);
INSERT INTO `s_area_cities` VALUES (279, 5326, '文山壮族苗族自治州', 53);
INSERT INTO `s_area_cities` VALUES (280, 5328, '西双版纳傣族自治州', 53);
INSERT INTO `s_area_cities` VALUES (281, 5329, '大理白族自治州', 53);
INSERT INTO `s_area_cities` VALUES (282, 5331, '德宏傣族景颇族自治州', 53);
INSERT INTO `s_area_cities` VALUES (283, 5333, '怒江傈僳族自治州', 53);
INSERT INTO `s_area_cities` VALUES (284, 5334, '迪庆藏族自治州', 53);
INSERT INTO `s_area_cities` VALUES (285, 5401, '拉萨市', 54);
INSERT INTO `s_area_cities` VALUES (286, 5402, '日喀则市', 54);
INSERT INTO `s_area_cities` VALUES (287, 5403, '昌都市', 54);
INSERT INTO `s_area_cities` VALUES (288, 5404, '林芝市', 54);
INSERT INTO `s_area_cities` VALUES (289, 5405, '山南市', 54);
INSERT INTO `s_area_cities` VALUES (290, 5406, '那曲市', 54);
INSERT INTO `s_area_cities` VALUES (291, 5425, '阿里地区', 54);
INSERT INTO `s_area_cities` VALUES (292, 6101, '西安市', 61);
INSERT INTO `s_area_cities` VALUES (293, 6102, '铜川市', 61);
INSERT INTO `s_area_cities` VALUES (294, 6103, '宝鸡市', 61);
INSERT INTO `s_area_cities` VALUES (295, 6104, '咸阳市', 61);
INSERT INTO `s_area_cities` VALUES (296, 6105, '渭南市', 61);
INSERT INTO `s_area_cities` VALUES (297, 6106, '延安市', 61);
INSERT INTO `s_area_cities` VALUES (298, 6107, '汉中市', 61);
INSERT INTO `s_area_cities` VALUES (299, 6108, '榆林市', 61);
INSERT INTO `s_area_cities` VALUES (300, 6109, '安康市', 61);
INSERT INTO `s_area_cities` VALUES (301, 6110, '商洛市', 61);
INSERT INTO `s_area_cities` VALUES (302, 6201, '兰州市', 62);
INSERT INTO `s_area_cities` VALUES (303, 6202, '嘉峪关市', 62);
INSERT INTO `s_area_cities` VALUES (304, 6203, '金昌市', 62);
INSERT INTO `s_area_cities` VALUES (305, 6204, '白银市', 62);
INSERT INTO `s_area_cities` VALUES (306, 6205, '天水市', 62);
INSERT INTO `s_area_cities` VALUES (307, 6206, '武威市', 62);
INSERT INTO `s_area_cities` VALUES (308, 6207, '张掖市', 62);
INSERT INTO `s_area_cities` VALUES (309, 6208, '平凉市', 62);
INSERT INTO `s_area_cities` VALUES (310, 6209, '酒泉市', 62);
INSERT INTO `s_area_cities` VALUES (311, 6210, '庆阳市', 62);
INSERT INTO `s_area_cities` VALUES (312, 6211, '定西市', 62);
INSERT INTO `s_area_cities` VALUES (313, 6212, '陇南市', 62);
INSERT INTO `s_area_cities` VALUES (314, 6229, '临夏回族自治州', 62);
INSERT INTO `s_area_cities` VALUES (315, 6230, '甘南藏族自治州', 62);
INSERT INTO `s_area_cities` VALUES (316, 6301, '西宁市', 63);
INSERT INTO `s_area_cities` VALUES (317, 6302, '海东市', 63);
INSERT INTO `s_area_cities` VALUES (318, 6322, '海北藏族自治州', 63);
INSERT INTO `s_area_cities` VALUES (319, 6323, '黄南藏族自治州', 63);
INSERT INTO `s_area_cities` VALUES (320, 6325, '海南藏族自治州', 63);
INSERT INTO `s_area_cities` VALUES (321, 6326, '果洛藏族自治州', 63);
INSERT INTO `s_area_cities` VALUES (322, 6327, '玉树藏族自治州', 63);
INSERT INTO `s_area_cities` VALUES (323, 6328, '海西蒙古族藏族自治州', 63);
INSERT INTO `s_area_cities` VALUES (324, 6401, '银川市', 64);
INSERT INTO `s_area_cities` VALUES (325, 6402, '石嘴山市', 64);
INSERT INTO `s_area_cities` VALUES (326, 6403, '吴忠市', 64);
INSERT INTO `s_area_cities` VALUES (327, 6404, '固原市', 64);
INSERT INTO `s_area_cities` VALUES (328, 6405, '中卫市', 64);
INSERT INTO `s_area_cities` VALUES (329, 6501, '乌鲁木齐市', 65);
INSERT INTO `s_area_cities` VALUES (330, 6502, '克拉玛依市', 65);
INSERT INTO `s_area_cities` VALUES (331, 6504, '吐鲁番市', 65);
INSERT INTO `s_area_cities` VALUES (332, 6505, '哈密市', 65);
INSERT INTO `s_area_cities` VALUES (333, 6523, '昌吉回族自治州', 65);
INSERT INTO `s_area_cities` VALUES (334, 6527, '博尔塔拉蒙古自治州', 65);
INSERT INTO `s_area_cities` VALUES (335, 6528, '巴音郭楞蒙古自治州', 65);
INSERT INTO `s_area_cities` VALUES (336, 6529, '阿克苏地区', 65);
INSERT INTO `s_area_cities` VALUES (337, 6530, '克孜勒苏柯尔克孜自治州', 65);
INSERT INTO `s_area_cities` VALUES (338, 6531, '喀什地区', 65);
INSERT INTO `s_area_cities` VALUES (339, 6532, '和田地区', 65);
INSERT INTO `s_area_cities` VALUES (340, 6540, '伊犁哈萨克自治州', 65);
INSERT INTO `s_area_cities` VALUES (341, 6542, '塔城地区', 65);
INSERT INTO `s_area_cities` VALUES (342, 6543, '阿勒泰地区', 65);
INSERT INTO `s_area_cities` VALUES (343, 6590, '自治区直辖县级行政区划', 65);

-- ----------------------------
-- Table structure for s_area_provinces
-- ----------------------------
DROP TABLE IF EXISTS `s_area_provinces`;
CREATE TABLE `s_area_provinces`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_s_provinces_1`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '省份' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_area_provinces
-- ----------------------------
INSERT INTO `s_area_provinces` VALUES (1, 11, '北京市');
INSERT INTO `s_area_provinces` VALUES (2, 12, '天津市');
INSERT INTO `s_area_provinces` VALUES (3, 13, '河北省');
INSERT INTO `s_area_provinces` VALUES (4, 14, '山西省');
INSERT INTO `s_area_provinces` VALUES (5, 15, '内蒙古自治区');
INSERT INTO `s_area_provinces` VALUES (6, 21, '辽宁省');
INSERT INTO `s_area_provinces` VALUES (7, 22, '吉林省');
INSERT INTO `s_area_provinces` VALUES (8, 23, '黑龙江省');
INSERT INTO `s_area_provinces` VALUES (9, 31, '上海市');
INSERT INTO `s_area_provinces` VALUES (10, 32, '江苏省');
INSERT INTO `s_area_provinces` VALUES (11, 33, '浙江省');
INSERT INTO `s_area_provinces` VALUES (12, 34, '安徽省');
INSERT INTO `s_area_provinces` VALUES (13, 35, '福建省');
INSERT INTO `s_area_provinces` VALUES (14, 36, '江西省');
INSERT INTO `s_area_provinces` VALUES (15, 37, '山东省');
INSERT INTO `s_area_provinces` VALUES (16, 41, '河南省');
INSERT INTO `s_area_provinces` VALUES (17, 42, '湖北省');
INSERT INTO `s_area_provinces` VALUES (18, 43, '湖南省');
INSERT INTO `s_area_provinces` VALUES (19, 44, '广东省');
INSERT INTO `s_area_provinces` VALUES (20, 45, '广西壮族自治区');
INSERT INTO `s_area_provinces` VALUES (21, 46, '海南省');
INSERT INTO `s_area_provinces` VALUES (22, 50, '重庆市');
INSERT INTO `s_area_provinces` VALUES (23, 51, '四川省');
INSERT INTO `s_area_provinces` VALUES (24, 52, '贵州省');
INSERT INTO `s_area_provinces` VALUES (25, 53, '云南省');
INSERT INTO `s_area_provinces` VALUES (26, 54, '西藏自治区');
INSERT INTO `s_area_provinces` VALUES (27, 61, '陕西省');
INSERT INTO `s_area_provinces` VALUES (28, 62, '甘肃省');
INSERT INTO `s_area_provinces` VALUES (29, 63, '青海省');
INSERT INTO `s_area_provinces` VALUES (30, 64, '宁夏回族自治区');
INSERT INTO `s_area_provinces` VALUES (31, 65, '新疆维吾尔自治区');

-- ----------------------------
-- Table structure for s_areas
-- ----------------------------
DROP TABLE IF EXISTS `s_areas`;
CREATE TABLE `s_areas`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` int(11) NULL DEFAULT NULL COMMENT '区编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区名称',
  `city_code` int(11) NULL DEFAULT NULL COMMENT '市级编号',
  `province_code` int(11) NULL DEFAULT NULL COMMENT '省级编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_s_areas_1`(`code`) USING BTREE,
  INDEX `idx_s_areas_2`(`city_code`) USING BTREE,
  INDEX `idx_s_areas_3`(`province_code`) USING BTREE,
  INDEX `idx_s_areas_4`(`city_code`, `province_code`, `code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_areas
-- ----------------------------
INSERT INTO `s_areas` VALUES (1, 110101, '东城区', 1101, 11);
INSERT INTO `s_areas` VALUES (2, 110102, '西城区', 1101, 11);
INSERT INTO `s_areas` VALUES (3, 110105, '朝阳区', 1101, 11);
INSERT INTO `s_areas` VALUES (4, 110106, '丰台区', 1101, 11);
INSERT INTO `s_areas` VALUES (5, 110107, '石景山区', 1101, 11);
INSERT INTO `s_areas` VALUES (6, 110108, '海淀区', 1101, 11);
INSERT INTO `s_areas` VALUES (7, 110109, '门头沟区', 1101, 11);
INSERT INTO `s_areas` VALUES (8, 110111, '房山区', 1101, 11);
INSERT INTO `s_areas` VALUES (9, 110112, '通州区', 1101, 11);
INSERT INTO `s_areas` VALUES (10, 110113, '顺义区', 1101, 11);
INSERT INTO `s_areas` VALUES (11, 110114, '昌平区', 1101, 11);
INSERT INTO `s_areas` VALUES (12, 110115, '大兴区', 1101, 11);
INSERT INTO `s_areas` VALUES (13, 110116, '怀柔区', 1101, 11);
INSERT INTO `s_areas` VALUES (14, 110117, '平谷区', 1101, 11);
INSERT INTO `s_areas` VALUES (15, 110118, '密云区', 1101, 11);
INSERT INTO `s_areas` VALUES (16, 110119, '延庆区', 1101, 11);
INSERT INTO `s_areas` VALUES (17, 120101, '和平区', 1201, 12);
INSERT INTO `s_areas` VALUES (18, 120102, '河东区', 1201, 12);
INSERT INTO `s_areas` VALUES (19, 120103, '河西区', 1201, 12);
INSERT INTO `s_areas` VALUES (20, 120104, '南开区', 1201, 12);
INSERT INTO `s_areas` VALUES (21, 120105, '河北区', 1201, 12);
INSERT INTO `s_areas` VALUES (22, 120106, '红桥区', 1201, 12);
INSERT INTO `s_areas` VALUES (23, 120110, '东丽区', 1201, 12);
INSERT INTO `s_areas` VALUES (24, 120111, '西青区', 1201, 12);
INSERT INTO `s_areas` VALUES (25, 120112, '津南区', 1201, 12);
INSERT INTO `s_areas` VALUES (26, 120113, '北辰区', 1201, 12);
INSERT INTO `s_areas` VALUES (27, 120114, '武清区', 1201, 12);
INSERT INTO `s_areas` VALUES (28, 120115, '宝坻区', 1201, 12);
INSERT INTO `s_areas` VALUES (29, 120116, '滨海新区', 1201, 12);
INSERT INTO `s_areas` VALUES (30, 120117, '宁河区', 1201, 12);
INSERT INTO `s_areas` VALUES (31, 120118, '静海区', 1201, 12);
INSERT INTO `s_areas` VALUES (32, 120119, '蓟州区', 1201, 12);
INSERT INTO `s_areas` VALUES (33, 130102, '长安区', 1301, 13);
INSERT INTO `s_areas` VALUES (34, 130104, '桥西区', 1301, 13);
INSERT INTO `s_areas` VALUES (35, 130105, '新华区', 1301, 13);
INSERT INTO `s_areas` VALUES (36, 130107, '井陉矿区', 1301, 13);
INSERT INTO `s_areas` VALUES (37, 130108, '裕华区', 1301, 13);
INSERT INTO `s_areas` VALUES (38, 130109, '藁城区', 1301, 13);
INSERT INTO `s_areas` VALUES (39, 130110, '鹿泉区', 1301, 13);
INSERT INTO `s_areas` VALUES (40, 130111, '栾城区', 1301, 13);
INSERT INTO `s_areas` VALUES (41, 130121, '井陉县', 1301, 13);
INSERT INTO `s_areas` VALUES (42, 130123, '正定县', 1301, 13);
INSERT INTO `s_areas` VALUES (43, 130125, '行唐县', 1301, 13);
INSERT INTO `s_areas` VALUES (44, 130126, '灵寿县', 1301, 13);
INSERT INTO `s_areas` VALUES (45, 130127, '高邑县', 1301, 13);
INSERT INTO `s_areas` VALUES (46, 130128, '深泽县', 1301, 13);
INSERT INTO `s_areas` VALUES (47, 130129, '赞皇县', 1301, 13);
INSERT INTO `s_areas` VALUES (48, 130130, '无极县', 1301, 13);
INSERT INTO `s_areas` VALUES (49, 130131, '平山县', 1301, 13);
INSERT INTO `s_areas` VALUES (50, 130132, '元氏县', 1301, 13);
INSERT INTO `s_areas` VALUES (51, 130133, '赵县', 1301, 13);
INSERT INTO `s_areas` VALUES (52, 130171, '石家庄高新技术产业开发区', 1301, 13);
INSERT INTO `s_areas` VALUES (53, 130172, '石家庄循环化工园区', 1301, 13);
INSERT INTO `s_areas` VALUES (54, 130181, '辛集市', 1301, 13);
INSERT INTO `s_areas` VALUES (55, 130183, '晋州市', 1301, 13);
INSERT INTO `s_areas` VALUES (56, 130184, '新乐市', 1301, 13);
INSERT INTO `s_areas` VALUES (57, 130202, '路南区', 1302, 13);
INSERT INTO `s_areas` VALUES (58, 130203, '路北区', 1302, 13);
INSERT INTO `s_areas` VALUES (59, 130204, '古冶区', 1302, 13);
INSERT INTO `s_areas` VALUES (60, 130205, '开平区', 1302, 13);
INSERT INTO `s_areas` VALUES (61, 130207, '丰南区', 1302, 13);
INSERT INTO `s_areas` VALUES (62, 130208, '丰润区', 1302, 13);
INSERT INTO `s_areas` VALUES (63, 130209, '曹妃甸区', 1302, 13);
INSERT INTO `s_areas` VALUES (64, 130224, '滦南县', 1302, 13);
INSERT INTO `s_areas` VALUES (65, 130225, '乐亭县', 1302, 13);
INSERT INTO `s_areas` VALUES (66, 130227, '迁西县', 1302, 13);
INSERT INTO `s_areas` VALUES (67, 130229, '玉田县', 1302, 13);
INSERT INTO `s_areas` VALUES (68, 130271, '唐山市芦台经济技术开发区', 1302, 13);
INSERT INTO `s_areas` VALUES (69, 130272, '唐山市汉沽管理区', 1302, 13);
INSERT INTO `s_areas` VALUES (70, 130273, '唐山高新技术产业开发区', 1302, 13);
INSERT INTO `s_areas` VALUES (71, 130274, '河北唐山海港经济开发区', 1302, 13);
INSERT INTO `s_areas` VALUES (72, 130281, '遵化市', 1302, 13);
INSERT INTO `s_areas` VALUES (73, 130283, '迁安市', 1302, 13);
INSERT INTO `s_areas` VALUES (74, 130284, '滦州市', 1302, 13);
INSERT INTO `s_areas` VALUES (75, 130302, '海港区', 1303, 13);
INSERT INTO `s_areas` VALUES (76, 130303, '山海关区', 1303, 13);
INSERT INTO `s_areas` VALUES (77, 130304, '北戴河区', 1303, 13);
INSERT INTO `s_areas` VALUES (78, 130306, '抚宁区', 1303, 13);
INSERT INTO `s_areas` VALUES (79, 130321, '青龙满族自治县', 1303, 13);
INSERT INTO `s_areas` VALUES (80, 130322, '昌黎县', 1303, 13);
INSERT INTO `s_areas` VALUES (81, 130324, '卢龙县', 1303, 13);
INSERT INTO `s_areas` VALUES (82, 130371, '秦皇岛市经济技术开发区', 1303, 13);
INSERT INTO `s_areas` VALUES (83, 130372, '北戴河新区', 1303, 13);
INSERT INTO `s_areas` VALUES (84, 130402, '邯山区', 1304, 13);
INSERT INTO `s_areas` VALUES (85, 130403, '丛台区', 1304, 13);
INSERT INTO `s_areas` VALUES (86, 130404, '复兴区', 1304, 13);
INSERT INTO `s_areas` VALUES (87, 130406, '峰峰矿区', 1304, 13);
INSERT INTO `s_areas` VALUES (88, 130407, '肥乡区', 1304, 13);
INSERT INTO `s_areas` VALUES (89, 130408, '永年区', 1304, 13);
INSERT INTO `s_areas` VALUES (90, 130423, '临漳县', 1304, 13);
INSERT INTO `s_areas` VALUES (91, 130424, '成安县', 1304, 13);
INSERT INTO `s_areas` VALUES (92, 130425, '大名县', 1304, 13);
INSERT INTO `s_areas` VALUES (93, 130426, '涉县', 1304, 13);
INSERT INTO `s_areas` VALUES (94, 130427, '磁县', 1304, 13);
INSERT INTO `s_areas` VALUES (95, 130430, '邱县', 1304, 13);
INSERT INTO `s_areas` VALUES (96, 130431, '鸡泽县', 1304, 13);
INSERT INTO `s_areas` VALUES (97, 130432, '广平县', 1304, 13);
INSERT INTO `s_areas` VALUES (98, 130433, '馆陶县', 1304, 13);
INSERT INTO `s_areas` VALUES (99, 130434, '魏县', 1304, 13);
INSERT INTO `s_areas` VALUES (100, 130435, '曲周县', 1304, 13);
INSERT INTO `s_areas` VALUES (101, 130471, '邯郸经济技术开发区', 1304, 13);
INSERT INTO `s_areas` VALUES (102, 130473, '邯郸冀南新区', 1304, 13);
INSERT INTO `s_areas` VALUES (103, 130481, '武安市', 1304, 13);
INSERT INTO `s_areas` VALUES (104, 130502, '桥东区', 1305, 13);
INSERT INTO `s_areas` VALUES (105, 130503, '桥西区', 1305, 13);
INSERT INTO `s_areas` VALUES (106, 130521, '邢台县', 1305, 13);
INSERT INTO `s_areas` VALUES (107, 130522, '临城县', 1305, 13);
INSERT INTO `s_areas` VALUES (108, 130523, '内丘县', 1305, 13);
INSERT INTO `s_areas` VALUES (109, 130524, '柏乡县', 1305, 13);
INSERT INTO `s_areas` VALUES (110, 130525, '隆尧县', 1305, 13);
INSERT INTO `s_areas` VALUES (111, 130526, '任县', 1305, 13);
INSERT INTO `s_areas` VALUES (112, 130527, '南和县', 1305, 13);
INSERT INTO `s_areas` VALUES (113, 130528, '宁晋县', 1305, 13);
INSERT INTO `s_areas` VALUES (114, 130529, '巨鹿县', 1305, 13);
INSERT INTO `s_areas` VALUES (115, 130530, '新河县', 1305, 13);
INSERT INTO `s_areas` VALUES (116, 130531, '广宗县', 1305, 13);
INSERT INTO `s_areas` VALUES (117, 130532, '平乡县', 1305, 13);
INSERT INTO `s_areas` VALUES (118, 130533, '威县', 1305, 13);
INSERT INTO `s_areas` VALUES (119, 130534, '清河县', 1305, 13);
INSERT INTO `s_areas` VALUES (120, 130535, '临西县', 1305, 13);
INSERT INTO `s_areas` VALUES (121, 130571, '河北邢台经济开发区', 1305, 13);
INSERT INTO `s_areas` VALUES (122, 130581, '南宫市', 1305, 13);
INSERT INTO `s_areas` VALUES (123, 130582, '沙河市', 1305, 13);
INSERT INTO `s_areas` VALUES (124, 130602, '竞秀区', 1306, 13);
INSERT INTO `s_areas` VALUES (125, 130606, '莲池区', 1306, 13);
INSERT INTO `s_areas` VALUES (126, 130607, '满城区', 1306, 13);
INSERT INTO `s_areas` VALUES (127, 130608, '清苑区', 1306, 13);
INSERT INTO `s_areas` VALUES (128, 130609, '徐水区', 1306, 13);
INSERT INTO `s_areas` VALUES (129, 130623, '涞水县', 1306, 13);
INSERT INTO `s_areas` VALUES (130, 130624, '阜平县', 1306, 13);
INSERT INTO `s_areas` VALUES (131, 130626, '定兴县', 1306, 13);
INSERT INTO `s_areas` VALUES (132, 130627, '唐县', 1306, 13);
INSERT INTO `s_areas` VALUES (133, 130628, '高阳县', 1306, 13);
INSERT INTO `s_areas` VALUES (134, 130629, '容城县', 1306, 13);
INSERT INTO `s_areas` VALUES (135, 130630, '涞源县', 1306, 13);
INSERT INTO `s_areas` VALUES (136, 130631, '望都县', 1306, 13);
INSERT INTO `s_areas` VALUES (137, 130632, '安新县', 1306, 13);
INSERT INTO `s_areas` VALUES (138, 130633, '易县', 1306, 13);
INSERT INTO `s_areas` VALUES (139, 130634, '曲阳县', 1306, 13);
INSERT INTO `s_areas` VALUES (140, 130635, '蠡县', 1306, 13);
INSERT INTO `s_areas` VALUES (141, 130636, '顺平县', 1306, 13);
INSERT INTO `s_areas` VALUES (142, 130637, '博野县', 1306, 13);
INSERT INTO `s_areas` VALUES (143, 130638, '雄县', 1306, 13);
INSERT INTO `s_areas` VALUES (144, 130671, '保定高新技术产业开发区', 1306, 13);
INSERT INTO `s_areas` VALUES (145, 130672, '保定白沟新城', 1306, 13);
INSERT INTO `s_areas` VALUES (146, 130681, '涿州市', 1306, 13);
INSERT INTO `s_areas` VALUES (147, 130682, '定州市', 1306, 13);
INSERT INTO `s_areas` VALUES (148, 130683, '安国市', 1306, 13);
INSERT INTO `s_areas` VALUES (149, 130684, '高碑店市', 1306, 13);
INSERT INTO `s_areas` VALUES (150, 130702, '桥东区', 1307, 13);
INSERT INTO `s_areas` VALUES (151, 130703, '桥西区', 1307, 13);
INSERT INTO `s_areas` VALUES (152, 130705, '宣化区', 1307, 13);
INSERT INTO `s_areas` VALUES (153, 130706, '下花园区', 1307, 13);
INSERT INTO `s_areas` VALUES (154, 130708, '万全区', 1307, 13);
INSERT INTO `s_areas` VALUES (155, 130709, '崇礼区', 1307, 13);
INSERT INTO `s_areas` VALUES (156, 130722, '张北县', 1307, 13);
INSERT INTO `s_areas` VALUES (157, 130723, '康保县', 1307, 13);
INSERT INTO `s_areas` VALUES (158, 130724, '沽源县', 1307, 13);
INSERT INTO `s_areas` VALUES (159, 130725, '尚义县', 1307, 13);
INSERT INTO `s_areas` VALUES (160, 130726, '蔚县', 1307, 13);
INSERT INTO `s_areas` VALUES (161, 130727, '阳原县', 1307, 13);
INSERT INTO `s_areas` VALUES (162, 130728, '怀安县', 1307, 13);
INSERT INTO `s_areas` VALUES (163, 130730, '怀来县', 1307, 13);
INSERT INTO `s_areas` VALUES (164, 130731, '涿鹿县', 1307, 13);
INSERT INTO `s_areas` VALUES (165, 130732, '赤城县', 1307, 13);
INSERT INTO `s_areas` VALUES (166, 130771, '张家口市高新技术产业开发区', 1307, 13);
INSERT INTO `s_areas` VALUES (167, 130772, '张家口市察北管理区', 1307, 13);
INSERT INTO `s_areas` VALUES (168, 130773, '张家口市塞北管理区', 1307, 13);
INSERT INTO `s_areas` VALUES (169, 130802, '双桥区', 1308, 13);
INSERT INTO `s_areas` VALUES (170, 130803, '双滦区', 1308, 13);
INSERT INTO `s_areas` VALUES (171, 130804, '鹰手营子矿区', 1308, 13);
INSERT INTO `s_areas` VALUES (172, 130821, '承德县', 1308, 13);
INSERT INTO `s_areas` VALUES (173, 130822, '兴隆县', 1308, 13);
INSERT INTO `s_areas` VALUES (174, 130824, '滦平县', 1308, 13);
INSERT INTO `s_areas` VALUES (175, 130825, '隆化县', 1308, 13);
INSERT INTO `s_areas` VALUES (176, 130826, '丰宁满族自治县', 1308, 13);
INSERT INTO `s_areas` VALUES (177, 130827, '宽城满族自治县', 1308, 13);
INSERT INTO `s_areas` VALUES (178, 130828, '围场满族蒙古族自治县', 1308, 13);
INSERT INTO `s_areas` VALUES (179, 130871, '承德高新技术产业开发区', 1308, 13);
INSERT INTO `s_areas` VALUES (180, 130881, '平泉市', 1308, 13);
INSERT INTO `s_areas` VALUES (181, 130902, '新华区', 1309, 13);
INSERT INTO `s_areas` VALUES (182, 130903, '运河区', 1309, 13);
INSERT INTO `s_areas` VALUES (183, 130921, '沧县', 1309, 13);
INSERT INTO `s_areas` VALUES (184, 130922, '青县', 1309, 13);
INSERT INTO `s_areas` VALUES (185, 130923, '东光县', 1309, 13);
INSERT INTO `s_areas` VALUES (186, 130924, '海兴县', 1309, 13);
INSERT INTO `s_areas` VALUES (187, 130925, '盐山县', 1309, 13);
INSERT INTO `s_areas` VALUES (188, 130926, '肃宁县', 1309, 13);
INSERT INTO `s_areas` VALUES (189, 130927, '南皮县', 1309, 13);
INSERT INTO `s_areas` VALUES (190, 130928, '吴桥县', 1309, 13);
INSERT INTO `s_areas` VALUES (191, 130929, '献县', 1309, 13);
INSERT INTO `s_areas` VALUES (192, 130930, '孟村回族自治县', 1309, 13);
INSERT INTO `s_areas` VALUES (193, 130971, '河北沧州经济开发区', 1309, 13);
INSERT INTO `s_areas` VALUES (194, 130972, '沧州高新技术产业开发区', 1309, 13);
INSERT INTO `s_areas` VALUES (195, 130973, '沧州渤海新区', 1309, 13);
INSERT INTO `s_areas` VALUES (196, 130981, '泊头市', 1309, 13);
INSERT INTO `s_areas` VALUES (197, 130982, '任丘市', 1309, 13);
INSERT INTO `s_areas` VALUES (198, 130983, '黄骅市', 1309, 13);
INSERT INTO `s_areas` VALUES (199, 130984, '河间市', 1309, 13);
INSERT INTO `s_areas` VALUES (200, 131002, '安次区', 1310, 13);
INSERT INTO `s_areas` VALUES (201, 131003, '广阳区', 1310, 13);
INSERT INTO `s_areas` VALUES (202, 131022, '固安县', 1310, 13);
INSERT INTO `s_areas` VALUES (203, 131023, '永清县', 1310, 13);
INSERT INTO `s_areas` VALUES (204, 131024, '香河县', 1310, 13);
INSERT INTO `s_areas` VALUES (205, 131025, '大城县', 1310, 13);
INSERT INTO `s_areas` VALUES (206, 131026, '文安县', 1310, 13);
INSERT INTO `s_areas` VALUES (207, 131028, '大厂回族自治县', 1310, 13);
INSERT INTO `s_areas` VALUES (208, 131071, '廊坊经济技术开发区', 1310, 13);
INSERT INTO `s_areas` VALUES (209, 131081, '霸州市', 1310, 13);
INSERT INTO `s_areas` VALUES (210, 131082, '三河市', 1310, 13);
INSERT INTO `s_areas` VALUES (211, 131102, '桃城区', 1311, 13);
INSERT INTO `s_areas` VALUES (212, 131103, '冀州区', 1311, 13);
INSERT INTO `s_areas` VALUES (213, 131121, '枣强县', 1311, 13);
INSERT INTO `s_areas` VALUES (214, 131122, '武邑县', 1311, 13);
INSERT INTO `s_areas` VALUES (215, 131123, '武强县', 1311, 13);
INSERT INTO `s_areas` VALUES (216, 131124, '饶阳县', 1311, 13);
INSERT INTO `s_areas` VALUES (217, 131125, '安平县', 1311, 13);
INSERT INTO `s_areas` VALUES (218, 131126, '故城县', 1311, 13);
INSERT INTO `s_areas` VALUES (219, 131127, '景县', 1311, 13);
INSERT INTO `s_areas` VALUES (220, 131128, '阜城县', 1311, 13);
INSERT INTO `s_areas` VALUES (221, 131171, '河北衡水高新技术产业开发区', 1311, 13);
INSERT INTO `s_areas` VALUES (222, 131172, '衡水滨湖新区', 1311, 13);
INSERT INTO `s_areas` VALUES (223, 131182, '深州市', 1311, 13);
INSERT INTO `s_areas` VALUES (224, 140105, '小店区', 1401, 14);
INSERT INTO `s_areas` VALUES (225, 140106, '迎泽区', 1401, 14);
INSERT INTO `s_areas` VALUES (226, 140107, '杏花岭区', 1401, 14);
INSERT INTO `s_areas` VALUES (227, 140108, '尖草坪区', 1401, 14);
INSERT INTO `s_areas` VALUES (228, 140109, '万柏林区', 1401, 14);
INSERT INTO `s_areas` VALUES (229, 140110, '晋源区', 1401, 14);
INSERT INTO `s_areas` VALUES (230, 140121, '清徐县', 1401, 14);
INSERT INTO `s_areas` VALUES (231, 140122, '阳曲县', 1401, 14);
INSERT INTO `s_areas` VALUES (232, 140123, '娄烦县', 1401, 14);
INSERT INTO `s_areas` VALUES (233, 140171, '山西转型综合改革示范区', 1401, 14);
INSERT INTO `s_areas` VALUES (234, 140181, '古交市', 1401, 14);
INSERT INTO `s_areas` VALUES (235, 140212, '新荣区', 1402, 14);
INSERT INTO `s_areas` VALUES (236, 140213, '平城区', 1402, 14);
INSERT INTO `s_areas` VALUES (237, 140214, '云冈区', 1402, 14);
INSERT INTO `s_areas` VALUES (238, 140215, '云州区', 1402, 14);
INSERT INTO `s_areas` VALUES (239, 140221, '阳高县', 1402, 14);
INSERT INTO `s_areas` VALUES (240, 140222, '天镇县', 1402, 14);
INSERT INTO `s_areas` VALUES (241, 140223, '广灵县', 1402, 14);
INSERT INTO `s_areas` VALUES (242, 140224, '灵丘县', 1402, 14);
INSERT INTO `s_areas` VALUES (243, 140225, '浑源县', 1402, 14);
INSERT INTO `s_areas` VALUES (244, 140226, '左云县', 1402, 14);
INSERT INTO `s_areas` VALUES (245, 140271, '山西大同经济开发区', 1402, 14);
INSERT INTO `s_areas` VALUES (246, 140302, '城区', 1403, 14);
INSERT INTO `s_areas` VALUES (247, 140303, '矿区', 1403, 14);
INSERT INTO `s_areas` VALUES (248, 140311, '郊区', 1403, 14);
INSERT INTO `s_areas` VALUES (249, 140321, '平定县', 1403, 14);
INSERT INTO `s_areas` VALUES (250, 140322, '盂县', 1403, 14);
INSERT INTO `s_areas` VALUES (251, 140403, '潞州区', 1404, 14);
INSERT INTO `s_areas` VALUES (252, 140404, '上党区', 1404, 14);
INSERT INTO `s_areas` VALUES (253, 140405, '屯留区', 1404, 14);
INSERT INTO `s_areas` VALUES (254, 140406, '潞城区', 1404, 14);
INSERT INTO `s_areas` VALUES (255, 140423, '襄垣县', 1404, 14);
INSERT INTO `s_areas` VALUES (256, 140425, '平顺县', 1404, 14);
INSERT INTO `s_areas` VALUES (257, 140426, '黎城县', 1404, 14);
INSERT INTO `s_areas` VALUES (258, 140427, '壶关县', 1404, 14);
INSERT INTO `s_areas` VALUES (259, 140428, '长子县', 1404, 14);
INSERT INTO `s_areas` VALUES (260, 140429, '武乡县', 1404, 14);
INSERT INTO `s_areas` VALUES (261, 140430, '沁县', 1404, 14);
INSERT INTO `s_areas` VALUES (262, 140431, '沁源县', 1404, 14);
INSERT INTO `s_areas` VALUES (263, 140471, '山西长治高新技术产业园区', 1404, 14);
INSERT INTO `s_areas` VALUES (264, 140502, '城区', 1405, 14);
INSERT INTO `s_areas` VALUES (265, 140521, '沁水县', 1405, 14);
INSERT INTO `s_areas` VALUES (266, 140522, '阳城县', 1405, 14);
INSERT INTO `s_areas` VALUES (267, 140524, '陵川县', 1405, 14);
INSERT INTO `s_areas` VALUES (268, 140525, '泽州县', 1405, 14);
INSERT INTO `s_areas` VALUES (269, 140581, '高平市', 1405, 14);
INSERT INTO `s_areas` VALUES (270, 140602, '朔城区', 1406, 14);
INSERT INTO `s_areas` VALUES (271, 140603, '平鲁区', 1406, 14);
INSERT INTO `s_areas` VALUES (272, 140621, '山阴县', 1406, 14);
INSERT INTO `s_areas` VALUES (273, 140622, '应县', 1406, 14);
INSERT INTO `s_areas` VALUES (274, 140623, '右玉县', 1406, 14);
INSERT INTO `s_areas` VALUES (275, 140671, '山西朔州经济开发区', 1406, 14);
INSERT INTO `s_areas` VALUES (276, 140681, '怀仁市', 1406, 14);
INSERT INTO `s_areas` VALUES (277, 140702, '榆次区', 1407, 14);
INSERT INTO `s_areas` VALUES (278, 140721, '榆社县', 1407, 14);
INSERT INTO `s_areas` VALUES (279, 140722, '左权县', 1407, 14);
INSERT INTO `s_areas` VALUES (280, 140723, '和顺县', 1407, 14);
INSERT INTO `s_areas` VALUES (281, 140724, '昔阳县', 1407, 14);
INSERT INTO `s_areas` VALUES (282, 140725, '寿阳县', 1407, 14);
INSERT INTO `s_areas` VALUES (283, 140726, '太谷县', 1407, 14);
INSERT INTO `s_areas` VALUES (284, 140727, '祁县', 1407, 14);
INSERT INTO `s_areas` VALUES (285, 140728, '平遥县', 1407, 14);
INSERT INTO `s_areas` VALUES (286, 140729, '灵石县', 1407, 14);
INSERT INTO `s_areas` VALUES (287, 140781, '介休市', 1407, 14);
INSERT INTO `s_areas` VALUES (288, 140802, '盐湖区', 1408, 14);
INSERT INTO `s_areas` VALUES (289, 140821, '临猗县', 1408, 14);
INSERT INTO `s_areas` VALUES (290, 140822, '万荣县', 1408, 14);
INSERT INTO `s_areas` VALUES (291, 140823, '闻喜县', 1408, 14);
INSERT INTO `s_areas` VALUES (292, 140824, '稷山县', 1408, 14);
INSERT INTO `s_areas` VALUES (293, 140825, '新绛县', 1408, 14);
INSERT INTO `s_areas` VALUES (294, 140826, '绛县', 1408, 14);
INSERT INTO `s_areas` VALUES (295, 140827, '垣曲县', 1408, 14);
INSERT INTO `s_areas` VALUES (296, 140828, '夏县', 1408, 14);
INSERT INTO `s_areas` VALUES (297, 140829, '平陆县', 1408, 14);
INSERT INTO `s_areas` VALUES (298, 140830, '芮城县', 1408, 14);
INSERT INTO `s_areas` VALUES (299, 140881, '永济市', 1408, 14);
INSERT INTO `s_areas` VALUES (300, 140882, '河津市', 1408, 14);
INSERT INTO `s_areas` VALUES (301, 140902, '忻府区', 1409, 14);
INSERT INTO `s_areas` VALUES (302, 140921, '定襄县', 1409, 14);
INSERT INTO `s_areas` VALUES (303, 140922, '五台县', 1409, 14);
INSERT INTO `s_areas` VALUES (304, 140923, '代县', 1409, 14);
INSERT INTO `s_areas` VALUES (305, 140924, '繁峙县', 1409, 14);
INSERT INTO `s_areas` VALUES (306, 140925, '宁武县', 1409, 14);
INSERT INTO `s_areas` VALUES (307, 140926, '静乐县', 1409, 14);
INSERT INTO `s_areas` VALUES (308, 140927, '神池县', 1409, 14);
INSERT INTO `s_areas` VALUES (309, 140928, '五寨县', 1409, 14);
INSERT INTO `s_areas` VALUES (310, 140929, '岢岚县', 1409, 14);
INSERT INTO `s_areas` VALUES (311, 140930, '河曲县', 1409, 14);
INSERT INTO `s_areas` VALUES (312, 140931, '保德县', 1409, 14);
INSERT INTO `s_areas` VALUES (313, 140932, '偏关县', 1409, 14);
INSERT INTO `s_areas` VALUES (314, 140971, '五台山风景名胜区', 1409, 14);
INSERT INTO `s_areas` VALUES (315, 140981, '原平市', 1409, 14);
INSERT INTO `s_areas` VALUES (316, 141002, '尧都区', 1410, 14);
INSERT INTO `s_areas` VALUES (317, 141021, '曲沃县', 1410, 14);
INSERT INTO `s_areas` VALUES (318, 141022, '翼城县', 1410, 14);
INSERT INTO `s_areas` VALUES (319, 141023, '襄汾县', 1410, 14);
INSERT INTO `s_areas` VALUES (320, 141024, '洪洞县', 1410, 14);
INSERT INTO `s_areas` VALUES (321, 141025, '古县', 1410, 14);
INSERT INTO `s_areas` VALUES (322, 141026, '安泽县', 1410, 14);
INSERT INTO `s_areas` VALUES (323, 141027, '浮山县', 1410, 14);
INSERT INTO `s_areas` VALUES (324, 141028, '吉县', 1410, 14);
INSERT INTO `s_areas` VALUES (325, 141029, '乡宁县', 1410, 14);
INSERT INTO `s_areas` VALUES (326, 141030, '大宁县', 1410, 14);
INSERT INTO `s_areas` VALUES (327, 141031, '隰县', 1410, 14);
INSERT INTO `s_areas` VALUES (328, 141032, '永和县', 1410, 14);
INSERT INTO `s_areas` VALUES (329, 141033, '蒲县', 1410, 14);
INSERT INTO `s_areas` VALUES (330, 141034, '汾西县', 1410, 14);
INSERT INTO `s_areas` VALUES (331, 141081, '侯马市', 1410, 14);
INSERT INTO `s_areas` VALUES (332, 141082, '霍州市', 1410, 14);
INSERT INTO `s_areas` VALUES (333, 141102, '离石区', 1411, 14);
INSERT INTO `s_areas` VALUES (334, 141121, '文水县', 1411, 14);
INSERT INTO `s_areas` VALUES (335, 141122, '交城县', 1411, 14);
INSERT INTO `s_areas` VALUES (336, 141123, '兴县', 1411, 14);
INSERT INTO `s_areas` VALUES (337, 141124, '临县', 1411, 14);
INSERT INTO `s_areas` VALUES (338, 141125, '柳林县', 1411, 14);
INSERT INTO `s_areas` VALUES (339, 141126, '石楼县', 1411, 14);
INSERT INTO `s_areas` VALUES (340, 141127, '岚县', 1411, 14);
INSERT INTO `s_areas` VALUES (341, 141128, '方山县', 1411, 14);
INSERT INTO `s_areas` VALUES (342, 141129, '中阳县', 1411, 14);
INSERT INTO `s_areas` VALUES (343, 141130, '交口县', 1411, 14);
INSERT INTO `s_areas` VALUES (344, 141181, '孝义市', 1411, 14);
INSERT INTO `s_areas` VALUES (345, 141182, '汾阳市', 1411, 14);
INSERT INTO `s_areas` VALUES (346, 150102, '新城区', 1501, 15);
INSERT INTO `s_areas` VALUES (347, 150103, '回民区', 1501, 15);
INSERT INTO `s_areas` VALUES (348, 150104, '玉泉区', 1501, 15);
INSERT INTO `s_areas` VALUES (349, 150105, '赛罕区', 1501, 15);
INSERT INTO `s_areas` VALUES (350, 150121, '土默特左旗', 1501, 15);
INSERT INTO `s_areas` VALUES (351, 150122, '托克托县', 1501, 15);
INSERT INTO `s_areas` VALUES (352, 150123, '和林格尔县', 1501, 15);
INSERT INTO `s_areas` VALUES (353, 150124, '清水河县', 1501, 15);
INSERT INTO `s_areas` VALUES (354, 150125, '武川县', 1501, 15);
INSERT INTO `s_areas` VALUES (355, 150171, '呼和浩特金海工业园区', 1501, 15);
INSERT INTO `s_areas` VALUES (356, 150172, '呼和浩特经济技术开发区', 1501, 15);
INSERT INTO `s_areas` VALUES (357, 150202, '东河区', 1502, 15);
INSERT INTO `s_areas` VALUES (358, 150203, '昆都仑区', 1502, 15);
INSERT INTO `s_areas` VALUES (359, 150204, '青山区', 1502, 15);
INSERT INTO `s_areas` VALUES (360, 150205, '石拐区', 1502, 15);
INSERT INTO `s_areas` VALUES (361, 150206, '白云鄂博矿区', 1502, 15);
INSERT INTO `s_areas` VALUES (362, 150207, '九原区', 1502, 15);
INSERT INTO `s_areas` VALUES (363, 150221, '土默特右旗', 1502, 15);
INSERT INTO `s_areas` VALUES (364, 150222, '固阳县', 1502, 15);
INSERT INTO `s_areas` VALUES (365, 150223, '达尔罕茂明安联合旗', 1502, 15);
INSERT INTO `s_areas` VALUES (366, 150271, '包头稀土高新技术产业开发区', 1502, 15);
INSERT INTO `s_areas` VALUES (367, 150302, '海勃湾区', 1503, 15);
INSERT INTO `s_areas` VALUES (368, 150303, '海南区', 1503, 15);
INSERT INTO `s_areas` VALUES (369, 150304, '乌达区', 1503, 15);
INSERT INTO `s_areas` VALUES (370, 150402, '红山区', 1504, 15);
INSERT INTO `s_areas` VALUES (371, 150403, '元宝山区', 1504, 15);
INSERT INTO `s_areas` VALUES (372, 150404, '松山区', 1504, 15);
INSERT INTO `s_areas` VALUES (373, 150421, '阿鲁科尔沁旗', 1504, 15);
INSERT INTO `s_areas` VALUES (374, 150422, '巴林左旗', 1504, 15);
INSERT INTO `s_areas` VALUES (375, 150423, '巴林右旗', 1504, 15);
INSERT INTO `s_areas` VALUES (376, 150424, '林西县', 1504, 15);
INSERT INTO `s_areas` VALUES (377, 150425, '克什克腾旗', 1504, 15);
INSERT INTO `s_areas` VALUES (378, 150426, '翁牛特旗', 1504, 15);
INSERT INTO `s_areas` VALUES (379, 150428, '喀喇沁旗', 1504, 15);
INSERT INTO `s_areas` VALUES (380, 150429, '宁城县', 1504, 15);
INSERT INTO `s_areas` VALUES (381, 150430, '敖汉旗', 1504, 15);
INSERT INTO `s_areas` VALUES (382, 150502, '科尔沁区', 1505, 15);
INSERT INTO `s_areas` VALUES (383, 150521, '科尔沁左翼中旗', 1505, 15);
INSERT INTO `s_areas` VALUES (384, 150522, '科尔沁左翼后旗', 1505, 15);
INSERT INTO `s_areas` VALUES (385, 150523, '开鲁县', 1505, 15);
INSERT INTO `s_areas` VALUES (386, 150524, '库伦旗', 1505, 15);
INSERT INTO `s_areas` VALUES (387, 150525, '奈曼旗', 1505, 15);
INSERT INTO `s_areas` VALUES (388, 150526, '扎鲁特旗', 1505, 15);
INSERT INTO `s_areas` VALUES (389, 150571, '通辽经济技术开发区', 1505, 15);
INSERT INTO `s_areas` VALUES (390, 150581, '霍林郭勒市', 1505, 15);
INSERT INTO `s_areas` VALUES (391, 150602, '东胜区', 1506, 15);
INSERT INTO `s_areas` VALUES (392, 150603, '康巴什区', 1506, 15);
INSERT INTO `s_areas` VALUES (393, 150621, '达拉特旗', 1506, 15);
INSERT INTO `s_areas` VALUES (394, 150622, '准格尔旗', 1506, 15);
INSERT INTO `s_areas` VALUES (395, 150623, '鄂托克前旗', 1506, 15);
INSERT INTO `s_areas` VALUES (396, 150624, '鄂托克旗', 1506, 15);
INSERT INTO `s_areas` VALUES (397, 150625, '杭锦旗', 1506, 15);
INSERT INTO `s_areas` VALUES (398, 150626, '乌审旗', 1506, 15);
INSERT INTO `s_areas` VALUES (399, 150627, '伊金霍洛旗', 1506, 15);
INSERT INTO `s_areas` VALUES (400, 150702, '海拉尔区', 1507, 15);
INSERT INTO `s_areas` VALUES (401, 150703, '扎赉诺尔区', 1507, 15);
INSERT INTO `s_areas` VALUES (402, 150721, '阿荣旗', 1507, 15);
INSERT INTO `s_areas` VALUES (403, 150722, '莫力达瓦达斡尔族自治旗', 1507, 15);
INSERT INTO `s_areas` VALUES (404, 150723, '鄂伦春自治旗', 1507, 15);
INSERT INTO `s_areas` VALUES (405, 150724, '鄂温克族自治旗', 1507, 15);
INSERT INTO `s_areas` VALUES (406, 150725, '陈巴尔虎旗', 1507, 15);
INSERT INTO `s_areas` VALUES (407, 150726, '新巴尔虎左旗', 1507, 15);
INSERT INTO `s_areas` VALUES (408, 150727, '新巴尔虎右旗', 1507, 15);
INSERT INTO `s_areas` VALUES (409, 150781, '满洲里市', 1507, 15);
INSERT INTO `s_areas` VALUES (410, 150782, '牙克石市', 1507, 15);
INSERT INTO `s_areas` VALUES (411, 150783, '扎兰屯市', 1507, 15);
INSERT INTO `s_areas` VALUES (412, 150784, '额尔古纳市', 1507, 15);
INSERT INTO `s_areas` VALUES (413, 150785, '根河市', 1507, 15);
INSERT INTO `s_areas` VALUES (414, 150802, '临河区', 1508, 15);
INSERT INTO `s_areas` VALUES (415, 150821, '五原县', 1508, 15);
INSERT INTO `s_areas` VALUES (416, 150822, '磴口县', 1508, 15);
INSERT INTO `s_areas` VALUES (417, 150823, '乌拉特前旗', 1508, 15);
INSERT INTO `s_areas` VALUES (418, 150824, '乌拉特中旗', 1508, 15);
INSERT INTO `s_areas` VALUES (419, 150825, '乌拉特后旗', 1508, 15);
INSERT INTO `s_areas` VALUES (420, 150826, '杭锦后旗', 1508, 15);
INSERT INTO `s_areas` VALUES (421, 150902, '集宁区', 1509, 15);
INSERT INTO `s_areas` VALUES (422, 150921, '卓资县', 1509, 15);
INSERT INTO `s_areas` VALUES (423, 150922, '化德县', 1509, 15);
INSERT INTO `s_areas` VALUES (424, 150923, '商都县', 1509, 15);
INSERT INTO `s_areas` VALUES (425, 150924, '兴和县', 1509, 15);
INSERT INTO `s_areas` VALUES (426, 150925, '凉城县', 1509, 15);
INSERT INTO `s_areas` VALUES (427, 150926, '察哈尔右翼前旗', 1509, 15);
INSERT INTO `s_areas` VALUES (428, 150927, '察哈尔右翼中旗', 1509, 15);
INSERT INTO `s_areas` VALUES (429, 150928, '察哈尔右翼后旗', 1509, 15);
INSERT INTO `s_areas` VALUES (430, 150929, '四子王旗', 1509, 15);
INSERT INTO `s_areas` VALUES (431, 150981, '丰镇市', 1509, 15);
INSERT INTO `s_areas` VALUES (432, 152201, '乌兰浩特市', 1522, 15);
INSERT INTO `s_areas` VALUES (433, 152202, '阿尔山市', 1522, 15);
INSERT INTO `s_areas` VALUES (434, 152221, '科尔沁右翼前旗', 1522, 15);
INSERT INTO `s_areas` VALUES (435, 152222, '科尔沁右翼中旗', 1522, 15);
INSERT INTO `s_areas` VALUES (436, 152223, '扎赉特旗', 1522, 15);
INSERT INTO `s_areas` VALUES (437, 152224, '突泉县', 1522, 15);
INSERT INTO `s_areas` VALUES (438, 152501, '二连浩特市', 1525, 15);
INSERT INTO `s_areas` VALUES (439, 152502, '锡林浩特市', 1525, 15);
INSERT INTO `s_areas` VALUES (440, 152522, '阿巴嘎旗', 1525, 15);
INSERT INTO `s_areas` VALUES (441, 152523, '苏尼特左旗', 1525, 15);
INSERT INTO `s_areas` VALUES (442, 152524, '苏尼特右旗', 1525, 15);
INSERT INTO `s_areas` VALUES (443, 152525, '东乌珠穆沁旗', 1525, 15);
INSERT INTO `s_areas` VALUES (444, 152526, '西乌珠穆沁旗', 1525, 15);
INSERT INTO `s_areas` VALUES (445, 152527, '太仆寺旗', 1525, 15);
INSERT INTO `s_areas` VALUES (446, 152528, '镶黄旗', 1525, 15);
INSERT INTO `s_areas` VALUES (447, 152529, '正镶白旗', 1525, 15);
INSERT INTO `s_areas` VALUES (448, 152530, '正蓝旗', 1525, 15);
INSERT INTO `s_areas` VALUES (449, 152531, '多伦县', 1525, 15);
INSERT INTO `s_areas` VALUES (450, 152571, '乌拉盖管委会', 1525, 15);
INSERT INTO `s_areas` VALUES (451, 152921, '阿拉善左旗', 1529, 15);
INSERT INTO `s_areas` VALUES (452, 152922, '阿拉善右旗', 1529, 15);
INSERT INTO `s_areas` VALUES (453, 152923, '额济纳旗', 1529, 15);
INSERT INTO `s_areas` VALUES (454, 152971, '内蒙古阿拉善经济开发区', 1529, 15);
INSERT INTO `s_areas` VALUES (455, 210102, '和平区', 2101, 21);
INSERT INTO `s_areas` VALUES (456, 210103, '沈河区', 2101, 21);
INSERT INTO `s_areas` VALUES (457, 210104, '大东区', 2101, 21);
INSERT INTO `s_areas` VALUES (458, 210105, '皇姑区', 2101, 21);
INSERT INTO `s_areas` VALUES (459, 210106, '铁西区', 2101, 21);
INSERT INTO `s_areas` VALUES (460, 210111, '苏家屯区', 2101, 21);
INSERT INTO `s_areas` VALUES (461, 210112, '浑南区', 2101, 21);
INSERT INTO `s_areas` VALUES (462, 210113, '沈北新区', 2101, 21);
INSERT INTO `s_areas` VALUES (463, 210114, '于洪区', 2101, 21);
INSERT INTO `s_areas` VALUES (464, 210115, '辽中区', 2101, 21);
INSERT INTO `s_areas` VALUES (465, 210123, '康平县', 2101, 21);
INSERT INTO `s_areas` VALUES (466, 210124, '法库县', 2101, 21);
INSERT INTO `s_areas` VALUES (467, 210181, '新民市', 2101, 21);
INSERT INTO `s_areas` VALUES (468, 210202, '中山区', 2102, 21);
INSERT INTO `s_areas` VALUES (469, 210203, '西岗区', 2102, 21);
INSERT INTO `s_areas` VALUES (470, 210204, '沙河口区', 2102, 21);
INSERT INTO `s_areas` VALUES (471, 210211, '甘井子区', 2102, 21);
INSERT INTO `s_areas` VALUES (472, 210212, '旅顺口区', 2102, 21);
INSERT INTO `s_areas` VALUES (473, 210213, '金州区', 2102, 21);
INSERT INTO `s_areas` VALUES (474, 210214, '普兰店区', 2102, 21);
INSERT INTO `s_areas` VALUES (475, 210224, '长海县', 2102, 21);
INSERT INTO `s_areas` VALUES (476, 210281, '瓦房店市', 2102, 21);
INSERT INTO `s_areas` VALUES (477, 210283, '庄河市', 2102, 21);
INSERT INTO `s_areas` VALUES (478, 210302, '铁东区', 2103, 21);
INSERT INTO `s_areas` VALUES (479, 210303, '铁西区', 2103, 21);
INSERT INTO `s_areas` VALUES (480, 210304, '立山区', 2103, 21);
INSERT INTO `s_areas` VALUES (481, 210311, '千山区', 2103, 21);
INSERT INTO `s_areas` VALUES (482, 210321, '台安县', 2103, 21);
INSERT INTO `s_areas` VALUES (483, 210323, '岫岩满族自治县', 2103, 21);
INSERT INTO `s_areas` VALUES (484, 210381, '海城市', 2103, 21);
INSERT INTO `s_areas` VALUES (485, 210402, '新抚区', 2104, 21);
INSERT INTO `s_areas` VALUES (486, 210403, '东洲区', 2104, 21);
INSERT INTO `s_areas` VALUES (487, 210404, '望花区', 2104, 21);
INSERT INTO `s_areas` VALUES (488, 210411, '顺城区', 2104, 21);
INSERT INTO `s_areas` VALUES (489, 210421, '抚顺县', 2104, 21);
INSERT INTO `s_areas` VALUES (490, 210422, '新宾满族自治县', 2104, 21);
INSERT INTO `s_areas` VALUES (491, 210423, '清原满族自治县', 2104, 21);
INSERT INTO `s_areas` VALUES (492, 210502, '平山区', 2105, 21);
INSERT INTO `s_areas` VALUES (493, 210503, '溪湖区', 2105, 21);
INSERT INTO `s_areas` VALUES (494, 210504, '明山区', 2105, 21);
INSERT INTO `s_areas` VALUES (495, 210505, '南芬区', 2105, 21);
INSERT INTO `s_areas` VALUES (496, 210521, '本溪满族自治县', 2105, 21);
INSERT INTO `s_areas` VALUES (497, 210522, '桓仁满族自治县', 2105, 21);
INSERT INTO `s_areas` VALUES (498, 210602, '元宝区', 2106, 21);
INSERT INTO `s_areas` VALUES (499, 210603, '振兴区', 2106, 21);
INSERT INTO `s_areas` VALUES (500, 210604, '振安区', 2106, 21);
INSERT INTO `s_areas` VALUES (501, 210624, '宽甸满族自治县', 2106, 21);
INSERT INTO `s_areas` VALUES (502, 210681, '东港市', 2106, 21);
INSERT INTO `s_areas` VALUES (503, 210682, '凤城市', 2106, 21);
INSERT INTO `s_areas` VALUES (504, 210702, '古塔区', 2107, 21);
INSERT INTO `s_areas` VALUES (505, 210703, '凌河区', 2107, 21);
INSERT INTO `s_areas` VALUES (506, 210711, '太和区', 2107, 21);
INSERT INTO `s_areas` VALUES (507, 210726, '黑山县', 2107, 21);
INSERT INTO `s_areas` VALUES (508, 210727, '义县', 2107, 21);
INSERT INTO `s_areas` VALUES (509, 210781, '凌海市', 2107, 21);
INSERT INTO `s_areas` VALUES (510, 210782, '北镇市', 2107, 21);
INSERT INTO `s_areas` VALUES (511, 210802, '站前区', 2108, 21);
INSERT INTO `s_areas` VALUES (512, 210803, '西市区', 2108, 21);
INSERT INTO `s_areas` VALUES (513, 210804, '鲅鱼圈区', 2108, 21);
INSERT INTO `s_areas` VALUES (514, 210811, '老边区', 2108, 21);
INSERT INTO `s_areas` VALUES (515, 210881, '盖州市', 2108, 21);
INSERT INTO `s_areas` VALUES (516, 210882, '大石桥市', 2108, 21);
INSERT INTO `s_areas` VALUES (517, 210902, '海州区', 2109, 21);
INSERT INTO `s_areas` VALUES (518, 210903, '新邱区', 2109, 21);
INSERT INTO `s_areas` VALUES (519, 210904, '太平区', 2109, 21);
INSERT INTO `s_areas` VALUES (520, 210905, '清河门区', 2109, 21);
INSERT INTO `s_areas` VALUES (521, 210911, '细河区', 2109, 21);
INSERT INTO `s_areas` VALUES (522, 210921, '阜新蒙古族自治县', 2109, 21);
INSERT INTO `s_areas` VALUES (523, 210922, '彰武县', 2109, 21);
INSERT INTO `s_areas` VALUES (524, 211002, '白塔区', 2110, 21);
INSERT INTO `s_areas` VALUES (525, 211003, '文圣区', 2110, 21);
INSERT INTO `s_areas` VALUES (526, 211004, '宏伟区', 2110, 21);
INSERT INTO `s_areas` VALUES (527, 211005, '弓长岭区', 2110, 21);
INSERT INTO `s_areas` VALUES (528, 211011, '太子河区', 2110, 21);
INSERT INTO `s_areas` VALUES (529, 211021, '辽阳县', 2110, 21);
INSERT INTO `s_areas` VALUES (530, 211081, '灯塔市', 2110, 21);
INSERT INTO `s_areas` VALUES (531, 211102, '双台子区', 2111, 21);
INSERT INTO `s_areas` VALUES (532, 211103, '兴隆台区', 2111, 21);
INSERT INTO `s_areas` VALUES (533, 211104, '大洼区', 2111, 21);
INSERT INTO `s_areas` VALUES (534, 211122, '盘山县', 2111, 21);
INSERT INTO `s_areas` VALUES (535, 211202, '银州区', 2112, 21);
INSERT INTO `s_areas` VALUES (536, 211204, '清河区', 2112, 21);
INSERT INTO `s_areas` VALUES (537, 211221, '铁岭县', 2112, 21);
INSERT INTO `s_areas` VALUES (538, 211223, '西丰县', 2112, 21);
INSERT INTO `s_areas` VALUES (539, 211224, '昌图县', 2112, 21);
INSERT INTO `s_areas` VALUES (540, 211281, '调兵山市', 2112, 21);
INSERT INTO `s_areas` VALUES (541, 211282, '开原市', 2112, 21);
INSERT INTO `s_areas` VALUES (542, 211302, '双塔区', 2113, 21);
INSERT INTO `s_areas` VALUES (543, 211303, '龙城区', 2113, 21);
INSERT INTO `s_areas` VALUES (544, 211321, '朝阳县', 2113, 21);
INSERT INTO `s_areas` VALUES (545, 211322, '建平县', 2113, 21);
INSERT INTO `s_areas` VALUES (546, 211324, '喀喇沁左翼蒙古族自治县', 2113, 21);
INSERT INTO `s_areas` VALUES (547, 211381, '北票市', 2113, 21);
INSERT INTO `s_areas` VALUES (548, 211382, '凌源市', 2113, 21);
INSERT INTO `s_areas` VALUES (549, 211402, '连山区', 2114, 21);
INSERT INTO `s_areas` VALUES (550, 211403, '龙港区', 2114, 21);
INSERT INTO `s_areas` VALUES (551, 211404, '南票区', 2114, 21);
INSERT INTO `s_areas` VALUES (552, 211421, '绥中县', 2114, 21);
INSERT INTO `s_areas` VALUES (553, 211422, '建昌县', 2114, 21);
INSERT INTO `s_areas` VALUES (554, 211481, '兴城市', 2114, 21);
INSERT INTO `s_areas` VALUES (555, 220102, '南关区', 2201, 22);
INSERT INTO `s_areas` VALUES (556, 220103, '宽城区', 2201, 22);
INSERT INTO `s_areas` VALUES (557, 220104, '朝阳区', 2201, 22);
INSERT INTO `s_areas` VALUES (558, 220105, '二道区', 2201, 22);
INSERT INTO `s_areas` VALUES (559, 220106, '绿园区', 2201, 22);
INSERT INTO `s_areas` VALUES (560, 220112, '双阳区', 2201, 22);
INSERT INTO `s_areas` VALUES (561, 220113, '九台区', 2201, 22);
INSERT INTO `s_areas` VALUES (562, 220122, '农安县', 2201, 22);
INSERT INTO `s_areas` VALUES (563, 220171, '长春经济技术开发区', 2201, 22);
INSERT INTO `s_areas` VALUES (564, 220172, '长春净月高新技术产业开发区', 2201, 22);
INSERT INTO `s_areas` VALUES (565, 220173, '长春高新技术产业开发区', 2201, 22);
INSERT INTO `s_areas` VALUES (566, 220174, '长春汽车经济技术开发区', 2201, 22);
INSERT INTO `s_areas` VALUES (567, 220182, '榆树市', 2201, 22);
INSERT INTO `s_areas` VALUES (568, 220183, '德惠市', 2201, 22);
INSERT INTO `s_areas` VALUES (569, 220202, '昌邑区', 2202, 22);
INSERT INTO `s_areas` VALUES (570, 220203, '龙潭区', 2202, 22);
INSERT INTO `s_areas` VALUES (571, 220204, '船营区', 2202, 22);
INSERT INTO `s_areas` VALUES (572, 220211, '丰满区', 2202, 22);
INSERT INTO `s_areas` VALUES (573, 220221, '永吉县', 2202, 22);
INSERT INTO `s_areas` VALUES (574, 220271, '吉林经济开发区', 2202, 22);
INSERT INTO `s_areas` VALUES (575, 220272, '吉林高新技术产业开发区', 2202, 22);
INSERT INTO `s_areas` VALUES (576, 220273, '吉林中国新加坡食品区', 2202, 22);
INSERT INTO `s_areas` VALUES (577, 220281, '蛟河市', 2202, 22);
INSERT INTO `s_areas` VALUES (578, 220282, '桦甸市', 2202, 22);
INSERT INTO `s_areas` VALUES (579, 220283, '舒兰市', 2202, 22);
INSERT INTO `s_areas` VALUES (580, 220284, '磐石市', 2202, 22);
INSERT INTO `s_areas` VALUES (581, 220302, '铁西区', 2203, 22);
INSERT INTO `s_areas` VALUES (582, 220303, '铁东区', 2203, 22);
INSERT INTO `s_areas` VALUES (583, 220322, '梨树县', 2203, 22);
INSERT INTO `s_areas` VALUES (584, 220323, '伊通满族自治县', 2203, 22);
INSERT INTO `s_areas` VALUES (585, 220381, '公主岭市', 2203, 22);
INSERT INTO `s_areas` VALUES (586, 220382, '双辽市', 2203, 22);
INSERT INTO `s_areas` VALUES (587, 220402, '龙山区', 2204, 22);
INSERT INTO `s_areas` VALUES (588, 220403, '西安区', 2204, 22);
INSERT INTO `s_areas` VALUES (589, 220421, '东丰县', 2204, 22);
INSERT INTO `s_areas` VALUES (590, 220422, '东辽县', 2204, 22);
INSERT INTO `s_areas` VALUES (591, 220502, '东昌区', 2205, 22);
INSERT INTO `s_areas` VALUES (592, 220503, '二道江区', 2205, 22);
INSERT INTO `s_areas` VALUES (593, 220521, '通化县', 2205, 22);
INSERT INTO `s_areas` VALUES (594, 220523, '辉南县', 2205, 22);
INSERT INTO `s_areas` VALUES (595, 220524, '柳河县', 2205, 22);
INSERT INTO `s_areas` VALUES (596, 220581, '梅河口市', 2205, 22);
INSERT INTO `s_areas` VALUES (597, 220582, '集安市', 2205, 22);
INSERT INTO `s_areas` VALUES (598, 220602, '浑江区', 2206, 22);
INSERT INTO `s_areas` VALUES (599, 220605, '江源区', 2206, 22);
INSERT INTO `s_areas` VALUES (600, 220621, '抚松县', 2206, 22);
INSERT INTO `s_areas` VALUES (601, 220622, '靖宇县', 2206, 22);
INSERT INTO `s_areas` VALUES (602, 220623, '长白朝鲜族自治县', 2206, 22);
INSERT INTO `s_areas` VALUES (603, 220681, '临江市', 2206, 22);
INSERT INTO `s_areas` VALUES (604, 220702, '宁江区', 2207, 22);
INSERT INTO `s_areas` VALUES (605, 220721, '前郭尔罗斯蒙古族自治县', 2207, 22);
INSERT INTO `s_areas` VALUES (606, 220722, '长岭县', 2207, 22);
INSERT INTO `s_areas` VALUES (607, 220723, '乾安县', 2207, 22);
INSERT INTO `s_areas` VALUES (608, 220771, '吉林松原经济开发区', 2207, 22);
INSERT INTO `s_areas` VALUES (609, 220781, '扶余市', 2207, 22);
INSERT INTO `s_areas` VALUES (610, 220802, '洮北区', 2208, 22);
INSERT INTO `s_areas` VALUES (611, 220821, '镇赉县', 2208, 22);
INSERT INTO `s_areas` VALUES (612, 220822, '通榆县', 2208, 22);
INSERT INTO `s_areas` VALUES (613, 220871, '吉林白城经济开发区', 2208, 22);
INSERT INTO `s_areas` VALUES (614, 220881, '洮南市', 2208, 22);
INSERT INTO `s_areas` VALUES (615, 220882, '大安市', 2208, 22);
INSERT INTO `s_areas` VALUES (616, 222401, '延吉市', 2224, 22);
INSERT INTO `s_areas` VALUES (617, 222402, '图们市', 2224, 22);
INSERT INTO `s_areas` VALUES (618, 222403, '敦化市', 2224, 22);
INSERT INTO `s_areas` VALUES (619, 222404, '珲春市', 2224, 22);
INSERT INTO `s_areas` VALUES (620, 222405, '龙井市', 2224, 22);
INSERT INTO `s_areas` VALUES (621, 222406, '和龙市', 2224, 22);
INSERT INTO `s_areas` VALUES (622, 222424, '汪清县', 2224, 22);
INSERT INTO `s_areas` VALUES (623, 222426, '安图县', 2224, 22);
INSERT INTO `s_areas` VALUES (624, 230102, '道里区', 2301, 23);
INSERT INTO `s_areas` VALUES (625, 230103, '南岗区', 2301, 23);
INSERT INTO `s_areas` VALUES (626, 230104, '道外区', 2301, 23);
INSERT INTO `s_areas` VALUES (627, 230108, '平房区', 2301, 23);
INSERT INTO `s_areas` VALUES (628, 230109, '松北区', 2301, 23);
INSERT INTO `s_areas` VALUES (629, 230110, '香坊区', 2301, 23);
INSERT INTO `s_areas` VALUES (630, 230111, '呼兰区', 2301, 23);
INSERT INTO `s_areas` VALUES (631, 230112, '阿城区', 2301, 23);
INSERT INTO `s_areas` VALUES (632, 230113, '双城区', 2301, 23);
INSERT INTO `s_areas` VALUES (633, 230123, '依兰县', 2301, 23);
INSERT INTO `s_areas` VALUES (634, 230124, '方正县', 2301, 23);
INSERT INTO `s_areas` VALUES (635, 230125, '宾县', 2301, 23);
INSERT INTO `s_areas` VALUES (636, 230126, '巴彦县', 2301, 23);
INSERT INTO `s_areas` VALUES (637, 230127, '木兰县', 2301, 23);
INSERT INTO `s_areas` VALUES (638, 230128, '通河县', 2301, 23);
INSERT INTO `s_areas` VALUES (639, 230129, '延寿县', 2301, 23);
INSERT INTO `s_areas` VALUES (640, 230183, '尚志市', 2301, 23);
INSERT INTO `s_areas` VALUES (641, 230184, '五常市', 2301, 23);
INSERT INTO `s_areas` VALUES (642, 230202, '龙沙区', 2302, 23);
INSERT INTO `s_areas` VALUES (643, 230203, '建华区', 2302, 23);
INSERT INTO `s_areas` VALUES (644, 230204, '铁锋区', 2302, 23);
INSERT INTO `s_areas` VALUES (645, 230205, '昂昂溪区', 2302, 23);
INSERT INTO `s_areas` VALUES (646, 230206, '富拉尔基区', 2302, 23);
INSERT INTO `s_areas` VALUES (647, 230207, '碾子山区', 2302, 23);
INSERT INTO `s_areas` VALUES (648, 230208, '梅里斯达斡尔族区', 2302, 23);
INSERT INTO `s_areas` VALUES (649, 230221, '龙江县', 2302, 23);
INSERT INTO `s_areas` VALUES (650, 230223, '依安县', 2302, 23);
INSERT INTO `s_areas` VALUES (651, 230224, '泰来县', 2302, 23);
INSERT INTO `s_areas` VALUES (652, 230225, '甘南县', 2302, 23);
INSERT INTO `s_areas` VALUES (653, 230227, '富裕县', 2302, 23);
INSERT INTO `s_areas` VALUES (654, 230229, '克山县', 2302, 23);
INSERT INTO `s_areas` VALUES (655, 230230, '克东县', 2302, 23);
INSERT INTO `s_areas` VALUES (656, 230231, '拜泉县', 2302, 23);
INSERT INTO `s_areas` VALUES (657, 230281, '讷河市', 2302, 23);
INSERT INTO `s_areas` VALUES (658, 230302, '鸡冠区', 2303, 23);
INSERT INTO `s_areas` VALUES (659, 230303, '恒山区', 2303, 23);
INSERT INTO `s_areas` VALUES (660, 230304, '滴道区', 2303, 23);
INSERT INTO `s_areas` VALUES (661, 230305, '梨树区', 2303, 23);
INSERT INTO `s_areas` VALUES (662, 230306, '城子河区', 2303, 23);
INSERT INTO `s_areas` VALUES (663, 230307, '麻山区', 2303, 23);
INSERT INTO `s_areas` VALUES (664, 230321, '鸡东县', 2303, 23);
INSERT INTO `s_areas` VALUES (665, 230381, '虎林市', 2303, 23);
INSERT INTO `s_areas` VALUES (666, 230382, '密山市', 2303, 23);
INSERT INTO `s_areas` VALUES (667, 230402, '向阳区', 2304, 23);
INSERT INTO `s_areas` VALUES (668, 230403, '工农区', 2304, 23);
INSERT INTO `s_areas` VALUES (669, 230404, '南山区', 2304, 23);
INSERT INTO `s_areas` VALUES (670, 230405, '兴安区', 2304, 23);
INSERT INTO `s_areas` VALUES (671, 230406, '东山区', 2304, 23);
INSERT INTO `s_areas` VALUES (672, 230407, '兴山区', 2304, 23);
INSERT INTO `s_areas` VALUES (673, 230421, '萝北县', 2304, 23);
INSERT INTO `s_areas` VALUES (674, 230422, '绥滨县', 2304, 23);
INSERT INTO `s_areas` VALUES (675, 230502, '尖山区', 2305, 23);
INSERT INTO `s_areas` VALUES (676, 230503, '岭东区', 2305, 23);
INSERT INTO `s_areas` VALUES (677, 230505, '四方台区', 2305, 23);
INSERT INTO `s_areas` VALUES (678, 230506, '宝山区', 2305, 23);
INSERT INTO `s_areas` VALUES (679, 230521, '集贤县', 2305, 23);
INSERT INTO `s_areas` VALUES (680, 230522, '友谊县', 2305, 23);
INSERT INTO `s_areas` VALUES (681, 230523, '宝清县', 2305, 23);
INSERT INTO `s_areas` VALUES (682, 230524, '饶河县', 2305, 23);
INSERT INTO `s_areas` VALUES (683, 230602, '萨尔图区', 2306, 23);
INSERT INTO `s_areas` VALUES (684, 230603, '龙凤区', 2306, 23);
INSERT INTO `s_areas` VALUES (685, 230604, '让胡路区', 2306, 23);
INSERT INTO `s_areas` VALUES (686, 230605, '红岗区', 2306, 23);
INSERT INTO `s_areas` VALUES (687, 230606, '大同区', 2306, 23);
INSERT INTO `s_areas` VALUES (688, 230621, '肇州县', 2306, 23);
INSERT INTO `s_areas` VALUES (689, 230622, '肇源县', 2306, 23);
INSERT INTO `s_areas` VALUES (690, 230623, '林甸县', 2306, 23);
INSERT INTO `s_areas` VALUES (691, 230624, '杜尔伯特蒙古族自治县', 2306, 23);
INSERT INTO `s_areas` VALUES (692, 230671, '大庆高新技术产业开发区', 2306, 23);
INSERT INTO `s_areas` VALUES (693, 230702, '伊春区', 2307, 23);
INSERT INTO `s_areas` VALUES (694, 230703, '南岔区', 2307, 23);
INSERT INTO `s_areas` VALUES (695, 230704, '友好区', 2307, 23);
INSERT INTO `s_areas` VALUES (696, 230705, '西林区', 2307, 23);
INSERT INTO `s_areas` VALUES (697, 230706, '翠峦区', 2307, 23);
INSERT INTO `s_areas` VALUES (698, 230707, '新青区', 2307, 23);
INSERT INTO `s_areas` VALUES (699, 230708, '美溪区', 2307, 23);
INSERT INTO `s_areas` VALUES (700, 230709, '金山屯区', 2307, 23);
INSERT INTO `s_areas` VALUES (701, 230710, '五营区', 2307, 23);
INSERT INTO `s_areas` VALUES (702, 230711, '乌马河区', 2307, 23);
INSERT INTO `s_areas` VALUES (703, 230712, '汤旺河区', 2307, 23);
INSERT INTO `s_areas` VALUES (704, 230713, '带岭区', 2307, 23);
INSERT INTO `s_areas` VALUES (705, 230714, '乌伊岭区', 2307, 23);
INSERT INTO `s_areas` VALUES (706, 230715, '红星区', 2307, 23);
INSERT INTO `s_areas` VALUES (707, 230716, '上甘岭区', 2307, 23);
INSERT INTO `s_areas` VALUES (708, 230722, '嘉荫县', 2307, 23);
INSERT INTO `s_areas` VALUES (709, 230781, '铁力市', 2307, 23);
INSERT INTO `s_areas` VALUES (710, 230803, '向阳区', 2308, 23);
INSERT INTO `s_areas` VALUES (711, 230804, '前进区', 2308, 23);
INSERT INTO `s_areas` VALUES (712, 230805, '东风区', 2308, 23);
INSERT INTO `s_areas` VALUES (713, 230811, '郊区', 2308, 23);
INSERT INTO `s_areas` VALUES (714, 230822, '桦南县', 2308, 23);
INSERT INTO `s_areas` VALUES (715, 230826, '桦川县', 2308, 23);
INSERT INTO `s_areas` VALUES (716, 230828, '汤原县', 2308, 23);
INSERT INTO `s_areas` VALUES (717, 230881, '同江市', 2308, 23);
INSERT INTO `s_areas` VALUES (718, 230882, '富锦市', 2308, 23);
INSERT INTO `s_areas` VALUES (719, 230883, '抚远市', 2308, 23);
INSERT INTO `s_areas` VALUES (720, 230902, '新兴区', 2309, 23);
INSERT INTO `s_areas` VALUES (721, 230903, '桃山区', 2309, 23);
INSERT INTO `s_areas` VALUES (722, 230904, '茄子河区', 2309, 23);
INSERT INTO `s_areas` VALUES (723, 230921, '勃利县', 2309, 23);
INSERT INTO `s_areas` VALUES (724, 231002, '东安区', 2310, 23);
INSERT INTO `s_areas` VALUES (725, 231003, '阳明区', 2310, 23);
INSERT INTO `s_areas` VALUES (726, 231004, '爱民区', 2310, 23);
INSERT INTO `s_areas` VALUES (727, 231005, '西安区', 2310, 23);
INSERT INTO `s_areas` VALUES (728, 231025, '林口县', 2310, 23);
INSERT INTO `s_areas` VALUES (729, 231071, '牡丹江经济技术开发区', 2310, 23);
INSERT INTO `s_areas` VALUES (730, 231081, '绥芬河市', 2310, 23);
INSERT INTO `s_areas` VALUES (731, 231083, '海林市', 2310, 23);
INSERT INTO `s_areas` VALUES (732, 231084, '宁安市', 2310, 23);
INSERT INTO `s_areas` VALUES (733, 231085, '穆棱市', 2310, 23);
INSERT INTO `s_areas` VALUES (734, 231086, '东宁市', 2310, 23);
INSERT INTO `s_areas` VALUES (735, 231102, '爱辉区', 2311, 23);
INSERT INTO `s_areas` VALUES (736, 231121, '嫩江县', 2311, 23);
INSERT INTO `s_areas` VALUES (737, 231123, '逊克县', 2311, 23);
INSERT INTO `s_areas` VALUES (738, 231124, '孙吴县', 2311, 23);
INSERT INTO `s_areas` VALUES (739, 231181, '北安市', 2311, 23);
INSERT INTO `s_areas` VALUES (740, 231182, '五大连池市', 2311, 23);
INSERT INTO `s_areas` VALUES (741, 231202, '北林区', 2312, 23);
INSERT INTO `s_areas` VALUES (742, 231221, '望奎县', 2312, 23);
INSERT INTO `s_areas` VALUES (743, 231222, '兰西县', 2312, 23);
INSERT INTO `s_areas` VALUES (744, 231223, '青冈县', 2312, 23);
INSERT INTO `s_areas` VALUES (745, 231224, '庆安县', 2312, 23);
INSERT INTO `s_areas` VALUES (746, 231225, '明水县', 2312, 23);
INSERT INTO `s_areas` VALUES (747, 231226, '绥棱县', 2312, 23);
INSERT INTO `s_areas` VALUES (748, 231281, '安达市', 2312, 23);
INSERT INTO `s_areas` VALUES (749, 231282, '肇东市', 2312, 23);
INSERT INTO `s_areas` VALUES (750, 231283, '海伦市', 2312, 23);
INSERT INTO `s_areas` VALUES (751, 232701, '漠河市', 2327, 23);
INSERT INTO `s_areas` VALUES (752, 232721, '呼玛县', 2327, 23);
INSERT INTO `s_areas` VALUES (753, 232722, '塔河县', 2327, 23);
INSERT INTO `s_areas` VALUES (754, 232761, '加格达奇区', 2327, 23);
INSERT INTO `s_areas` VALUES (755, 232762, '松岭区', 2327, 23);
INSERT INTO `s_areas` VALUES (756, 232763, '新林区', 2327, 23);
INSERT INTO `s_areas` VALUES (757, 232764, '呼中区', 2327, 23);
INSERT INTO `s_areas` VALUES (758, 310101, '黄浦区', 3101, 31);
INSERT INTO `s_areas` VALUES (759, 310104, '徐汇区', 3101, 31);
INSERT INTO `s_areas` VALUES (760, 310105, '长宁区', 3101, 31);
INSERT INTO `s_areas` VALUES (761, 310106, '静安区', 3101, 31);
INSERT INTO `s_areas` VALUES (762, 310107, '普陀区', 3101, 31);
INSERT INTO `s_areas` VALUES (763, 310109, '虹口区', 3101, 31);
INSERT INTO `s_areas` VALUES (764, 310110, '杨浦区', 3101, 31);
INSERT INTO `s_areas` VALUES (765, 310112, '闵行区', 3101, 31);
INSERT INTO `s_areas` VALUES (766, 310113, '宝山区', 3101, 31);
INSERT INTO `s_areas` VALUES (767, 310114, '嘉定区', 3101, 31);
INSERT INTO `s_areas` VALUES (768, 310115, '浦东新区', 3101, 31);
INSERT INTO `s_areas` VALUES (769, 310116, '金山区', 3101, 31);
INSERT INTO `s_areas` VALUES (770, 310117, '松江区', 3101, 31);
INSERT INTO `s_areas` VALUES (771, 310118, '青浦区', 3101, 31);
INSERT INTO `s_areas` VALUES (772, 310120, '奉贤区', 3101, 31);
INSERT INTO `s_areas` VALUES (773, 310151, '崇明区', 3101, 31);
INSERT INTO `s_areas` VALUES (774, 320102, '玄武区', 3201, 32);
INSERT INTO `s_areas` VALUES (775, 320104, '秦淮区', 3201, 32);
INSERT INTO `s_areas` VALUES (776, 320105, '建邺区', 3201, 32);
INSERT INTO `s_areas` VALUES (777, 320106, '鼓楼区', 3201, 32);
INSERT INTO `s_areas` VALUES (778, 320111, '浦口区', 3201, 32);
INSERT INTO `s_areas` VALUES (779, 320113, '栖霞区', 3201, 32);
INSERT INTO `s_areas` VALUES (780, 320114, '雨花台区', 3201, 32);
INSERT INTO `s_areas` VALUES (781, 320115, '江宁区', 3201, 32);
INSERT INTO `s_areas` VALUES (782, 320116, '六合区', 3201, 32);
INSERT INTO `s_areas` VALUES (783, 320117, '溧水区', 3201, 32);
INSERT INTO `s_areas` VALUES (784, 320118, '高淳区', 3201, 32);
INSERT INTO `s_areas` VALUES (785, 320205, '锡山区', 3202, 32);
INSERT INTO `s_areas` VALUES (786, 320206, '惠山区', 3202, 32);
INSERT INTO `s_areas` VALUES (787, 320211, '滨湖区', 3202, 32);
INSERT INTO `s_areas` VALUES (788, 320213, '梁溪区', 3202, 32);
INSERT INTO `s_areas` VALUES (789, 320214, '新吴区', 3202, 32);
INSERT INTO `s_areas` VALUES (790, 320281, '江阴市', 3202, 32);
INSERT INTO `s_areas` VALUES (791, 320282, '宜兴市', 3202, 32);
INSERT INTO `s_areas` VALUES (792, 320302, '鼓楼区', 3203, 32);
INSERT INTO `s_areas` VALUES (793, 320303, '云龙区', 3203, 32);
INSERT INTO `s_areas` VALUES (794, 320305, '贾汪区', 3203, 32);
INSERT INTO `s_areas` VALUES (795, 320311, '泉山区', 3203, 32);
INSERT INTO `s_areas` VALUES (796, 320312, '铜山区', 3203, 32);
INSERT INTO `s_areas` VALUES (797, 320321, '丰县', 3203, 32);
INSERT INTO `s_areas` VALUES (798, 320322, '沛县', 3203, 32);
INSERT INTO `s_areas` VALUES (799, 320324, '睢宁县', 3203, 32);
INSERT INTO `s_areas` VALUES (800, 320371, '徐州经济技术开发区', 3203, 32);
INSERT INTO `s_areas` VALUES (801, 320381, '新沂市', 3203, 32);
INSERT INTO `s_areas` VALUES (802, 320382, '邳州市', 3203, 32);
INSERT INTO `s_areas` VALUES (803, 320402, '天宁区', 3204, 32);
INSERT INTO `s_areas` VALUES (804, 320404, '钟楼区', 3204, 32);
INSERT INTO `s_areas` VALUES (805, 320411, '新北区', 3204, 32);
INSERT INTO `s_areas` VALUES (806, 320412, '武进区', 3204, 32);
INSERT INTO `s_areas` VALUES (807, 320413, '金坛区', 3204, 32);
INSERT INTO `s_areas` VALUES (808, 320481, '溧阳市', 3204, 32);
INSERT INTO `s_areas` VALUES (809, 320505, '虎丘区', 3205, 32);
INSERT INTO `s_areas` VALUES (810, 320506, '吴中区', 3205, 32);
INSERT INTO `s_areas` VALUES (811, 320507, '相城区', 3205, 32);
INSERT INTO `s_areas` VALUES (812, 320508, '姑苏区', 3205, 32);
INSERT INTO `s_areas` VALUES (813, 320509, '吴江区', 3205, 32);
INSERT INTO `s_areas` VALUES (814, 320571, '苏州工业园区', 3205, 32);
INSERT INTO `s_areas` VALUES (815, 320581, '常熟市', 3205, 32);
INSERT INTO `s_areas` VALUES (816, 320582, '张家港市', 3205, 32);
INSERT INTO `s_areas` VALUES (817, 320583, '昆山市', 3205, 32);
INSERT INTO `s_areas` VALUES (818, 320585, '太仓市', 3205, 32);
INSERT INTO `s_areas` VALUES (819, 320602, '崇川区', 3206, 32);
INSERT INTO `s_areas` VALUES (820, 320611, '港闸区', 3206, 32);
INSERT INTO `s_areas` VALUES (821, 320612, '通州区', 3206, 32);
INSERT INTO `s_areas` VALUES (822, 320623, '如东县', 3206, 32);
INSERT INTO `s_areas` VALUES (823, 320671, '南通经济技术开发区', 3206, 32);
INSERT INTO `s_areas` VALUES (824, 320681, '启东市', 3206, 32);
INSERT INTO `s_areas` VALUES (825, 320682, '如皋市', 3206, 32);
INSERT INTO `s_areas` VALUES (826, 320684, '海门市', 3206, 32);
INSERT INTO `s_areas` VALUES (827, 320685, '海安市', 3206, 32);
INSERT INTO `s_areas` VALUES (828, 320703, '连云区', 3207, 32);
INSERT INTO `s_areas` VALUES (829, 320706, '海州区', 3207, 32);
INSERT INTO `s_areas` VALUES (830, 320707, '赣榆区', 3207, 32);
INSERT INTO `s_areas` VALUES (831, 320722, '东海县', 3207, 32);
INSERT INTO `s_areas` VALUES (832, 320723, '灌云县', 3207, 32);
INSERT INTO `s_areas` VALUES (833, 320724, '灌南县', 3207, 32);
INSERT INTO `s_areas` VALUES (834, 320771, '连云港经济技术开发区', 3207, 32);
INSERT INTO `s_areas` VALUES (835, 320772, '连云港高新技术产业开发区', 3207, 32);
INSERT INTO `s_areas` VALUES (836, 320803, '淮安区', 3208, 32);
INSERT INTO `s_areas` VALUES (837, 320804, '淮阴区', 3208, 32);
INSERT INTO `s_areas` VALUES (838, 320812, '清江浦区', 3208, 32);
INSERT INTO `s_areas` VALUES (839, 320813, '洪泽区', 3208, 32);
INSERT INTO `s_areas` VALUES (840, 320826, '涟水县', 3208, 32);
INSERT INTO `s_areas` VALUES (841, 320830, '盱眙县', 3208, 32);
INSERT INTO `s_areas` VALUES (842, 320831, '金湖县', 3208, 32);
INSERT INTO `s_areas` VALUES (843, 320871, '淮安经济技术开发区', 3208, 32);
INSERT INTO `s_areas` VALUES (844, 320902, '亭湖区', 3209, 32);
INSERT INTO `s_areas` VALUES (845, 320903, '盐都区', 3209, 32);
INSERT INTO `s_areas` VALUES (846, 320904, '大丰区', 3209, 32);
INSERT INTO `s_areas` VALUES (847, 320921, '响水县', 3209, 32);
INSERT INTO `s_areas` VALUES (848, 320922, '滨海县', 3209, 32);
INSERT INTO `s_areas` VALUES (849, 320923, '阜宁县', 3209, 32);
INSERT INTO `s_areas` VALUES (850, 320924, '射阳县', 3209, 32);
INSERT INTO `s_areas` VALUES (851, 320925, '建湖县', 3209, 32);
INSERT INTO `s_areas` VALUES (852, 320971, '盐城经济技术开发区', 3209, 32);
INSERT INTO `s_areas` VALUES (853, 320981, '东台市', 3209, 32);
INSERT INTO `s_areas` VALUES (854, 321002, '广陵区', 3210, 32);
INSERT INTO `s_areas` VALUES (855, 321003, '邗江区', 3210, 32);
INSERT INTO `s_areas` VALUES (856, 321012, '江都区', 3210, 32);
INSERT INTO `s_areas` VALUES (857, 321023, '宝应县', 3210, 32);
INSERT INTO `s_areas` VALUES (858, 321071, '扬州经济技术开发区', 3210, 32);
INSERT INTO `s_areas` VALUES (859, 321081, '仪征市', 3210, 32);
INSERT INTO `s_areas` VALUES (860, 321084, '高邮市', 3210, 32);
INSERT INTO `s_areas` VALUES (861, 321102, '京口区', 3211, 32);
INSERT INTO `s_areas` VALUES (862, 321111, '润州区', 3211, 32);
INSERT INTO `s_areas` VALUES (863, 321112, '丹徒区', 3211, 32);
INSERT INTO `s_areas` VALUES (864, 321171, '镇江新区', 3211, 32);
INSERT INTO `s_areas` VALUES (865, 321181, '丹阳市', 3211, 32);
INSERT INTO `s_areas` VALUES (866, 321182, '扬中市', 3211, 32);
INSERT INTO `s_areas` VALUES (867, 321183, '句容市', 3211, 32);
INSERT INTO `s_areas` VALUES (868, 321202, '海陵区', 3212, 32);
INSERT INTO `s_areas` VALUES (869, 321203, '高港区', 3212, 32);
INSERT INTO `s_areas` VALUES (870, 321204, '姜堰区', 3212, 32);
INSERT INTO `s_areas` VALUES (871, 321271, '泰州医药高新技术产业开发区', 3212, 32);
INSERT INTO `s_areas` VALUES (872, 321281, '兴化市', 3212, 32);
INSERT INTO `s_areas` VALUES (873, 321282, '靖江市', 3212, 32);
INSERT INTO `s_areas` VALUES (874, 321283, '泰兴市', 3212, 32);
INSERT INTO `s_areas` VALUES (875, 321302, '宿城区', 3213, 32);
INSERT INTO `s_areas` VALUES (876, 321311, '宿豫区', 3213, 32);
INSERT INTO `s_areas` VALUES (877, 321322, '沭阳县', 3213, 32);
INSERT INTO `s_areas` VALUES (878, 321323, '泗阳县', 3213, 32);
INSERT INTO `s_areas` VALUES (879, 321324, '泗洪县', 3213, 32);
INSERT INTO `s_areas` VALUES (880, 321371, '宿迁经济技术开发区', 3213, 32);
INSERT INTO `s_areas` VALUES (881, 330102, '上城区', 3301, 33);
INSERT INTO `s_areas` VALUES (882, 330103, '下城区', 3301, 33);
INSERT INTO `s_areas` VALUES (883, 330104, '江干区', 3301, 33);
INSERT INTO `s_areas` VALUES (884, 330105, '拱墅区', 3301, 33);
INSERT INTO `s_areas` VALUES (885, 330106, '西湖区', 3301, 33);
INSERT INTO `s_areas` VALUES (886, 330108, '滨江区', 3301, 33);
INSERT INTO `s_areas` VALUES (887, 330109, '萧山区', 3301, 33);
INSERT INTO `s_areas` VALUES (888, 330110, '余杭区', 3301, 33);
INSERT INTO `s_areas` VALUES (889, 330111, '富阳区', 3301, 33);
INSERT INTO `s_areas` VALUES (890, 330112, '临安区', 3301, 33);
INSERT INTO `s_areas` VALUES (891, 330122, '桐庐县', 3301, 33);
INSERT INTO `s_areas` VALUES (892, 330127, '淳安县', 3301, 33);
INSERT INTO `s_areas` VALUES (893, 330182, '建德市', 3301, 33);
INSERT INTO `s_areas` VALUES (894, 330203, '海曙区', 3302, 33);
INSERT INTO `s_areas` VALUES (895, 330205, '江北区', 3302, 33);
INSERT INTO `s_areas` VALUES (896, 330206, '北仑区', 3302, 33);
INSERT INTO `s_areas` VALUES (897, 330211, '镇海区', 3302, 33);
INSERT INTO `s_areas` VALUES (898, 330212, '鄞州区', 3302, 33);
INSERT INTO `s_areas` VALUES (899, 330213, '奉化区', 3302, 33);
INSERT INTO `s_areas` VALUES (900, 330225, '象山县', 3302, 33);
INSERT INTO `s_areas` VALUES (901, 330226, '宁海县', 3302, 33);
INSERT INTO `s_areas` VALUES (902, 330281, '余姚市', 3302, 33);
INSERT INTO `s_areas` VALUES (903, 330282, '慈溪市', 3302, 33);
INSERT INTO `s_areas` VALUES (904, 330302, '鹿城区', 3303, 33);
INSERT INTO `s_areas` VALUES (905, 330303, '龙湾区', 3303, 33);
INSERT INTO `s_areas` VALUES (906, 330304, '瓯海区', 3303, 33);
INSERT INTO `s_areas` VALUES (907, 330305, '洞头区', 3303, 33);
INSERT INTO `s_areas` VALUES (908, 330324, '永嘉县', 3303, 33);
INSERT INTO `s_areas` VALUES (909, 330326, '平阳县', 3303, 33);
INSERT INTO `s_areas` VALUES (910, 330327, '苍南县', 3303, 33);
INSERT INTO `s_areas` VALUES (911, 330328, '文成县', 3303, 33);
INSERT INTO `s_areas` VALUES (912, 330329, '泰顺县', 3303, 33);
INSERT INTO `s_areas` VALUES (913, 330371, '温州经济技术开发区', 3303, 33);
INSERT INTO `s_areas` VALUES (914, 330381, '瑞安市', 3303, 33);
INSERT INTO `s_areas` VALUES (915, 330382, '乐清市', 3303, 33);
INSERT INTO `s_areas` VALUES (916, 330402, '南湖区', 3304, 33);
INSERT INTO `s_areas` VALUES (917, 330411, '秀洲区', 3304, 33);
INSERT INTO `s_areas` VALUES (918, 330421, '嘉善县', 3304, 33);
INSERT INTO `s_areas` VALUES (919, 330424, '海盐县', 3304, 33);
INSERT INTO `s_areas` VALUES (920, 330481, '海宁市', 3304, 33);
INSERT INTO `s_areas` VALUES (921, 330482, '平湖市', 3304, 33);
INSERT INTO `s_areas` VALUES (922, 330483, '桐乡市', 3304, 33);
INSERT INTO `s_areas` VALUES (923, 330502, '吴兴区', 3305, 33);
INSERT INTO `s_areas` VALUES (924, 330503, '南浔区', 3305, 33);
INSERT INTO `s_areas` VALUES (925, 330521, '德清县', 3305, 33);
INSERT INTO `s_areas` VALUES (926, 330522, '长兴县', 3305, 33);
INSERT INTO `s_areas` VALUES (927, 330523, '安吉县', 3305, 33);
INSERT INTO `s_areas` VALUES (928, 330602, '越城区', 3306, 33);
INSERT INTO `s_areas` VALUES (929, 330603, '柯桥区', 3306, 33);
INSERT INTO `s_areas` VALUES (930, 330604, '上虞区', 3306, 33);
INSERT INTO `s_areas` VALUES (931, 330624, '新昌县', 3306, 33);
INSERT INTO `s_areas` VALUES (932, 330681, '诸暨市', 3306, 33);
INSERT INTO `s_areas` VALUES (933, 330683, '嵊州市', 3306, 33);
INSERT INTO `s_areas` VALUES (934, 330702, '婺城区', 3307, 33);
INSERT INTO `s_areas` VALUES (935, 330703, '金东区', 3307, 33);
INSERT INTO `s_areas` VALUES (936, 330723, '武义县', 3307, 33);
INSERT INTO `s_areas` VALUES (937, 330726, '浦江县', 3307, 33);
INSERT INTO `s_areas` VALUES (938, 330727, '磐安县', 3307, 33);
INSERT INTO `s_areas` VALUES (939, 330781, '兰溪市', 3307, 33);
INSERT INTO `s_areas` VALUES (940, 330782, '义乌市', 3307, 33);
INSERT INTO `s_areas` VALUES (941, 330783, '东阳市', 3307, 33);
INSERT INTO `s_areas` VALUES (942, 330784, '永康市', 3307, 33);
INSERT INTO `s_areas` VALUES (943, 330802, '柯城区', 3308, 33);
INSERT INTO `s_areas` VALUES (944, 330803, '衢江区', 3308, 33);
INSERT INTO `s_areas` VALUES (945, 330822, '常山县', 3308, 33);
INSERT INTO `s_areas` VALUES (946, 330824, '开化县', 3308, 33);
INSERT INTO `s_areas` VALUES (947, 330825, '龙游县', 3308, 33);
INSERT INTO `s_areas` VALUES (948, 330881, '江山市', 3308, 33);
INSERT INTO `s_areas` VALUES (949, 330902, '定海区', 3309, 33);
INSERT INTO `s_areas` VALUES (950, 330903, '普陀区', 3309, 33);
INSERT INTO `s_areas` VALUES (951, 330921, '岱山县', 3309, 33);
INSERT INTO `s_areas` VALUES (952, 330922, '嵊泗县', 3309, 33);
INSERT INTO `s_areas` VALUES (953, 331002, '椒江区', 3310, 33);
INSERT INTO `s_areas` VALUES (954, 331003, '黄岩区', 3310, 33);
INSERT INTO `s_areas` VALUES (955, 331004, '路桥区', 3310, 33);
INSERT INTO `s_areas` VALUES (956, 331022, '三门县', 3310, 33);
INSERT INTO `s_areas` VALUES (957, 331023, '天台县', 3310, 33);
INSERT INTO `s_areas` VALUES (958, 331024, '仙居县', 3310, 33);
INSERT INTO `s_areas` VALUES (959, 331081, '温岭市', 3310, 33);
INSERT INTO `s_areas` VALUES (960, 331082, '临海市', 3310, 33);
INSERT INTO `s_areas` VALUES (961, 331083, '玉环市', 3310, 33);
INSERT INTO `s_areas` VALUES (962, 331102, '莲都区', 3311, 33);
INSERT INTO `s_areas` VALUES (963, 331121, '青田县', 3311, 33);
INSERT INTO `s_areas` VALUES (964, 331122, '缙云县', 3311, 33);
INSERT INTO `s_areas` VALUES (965, 331123, '遂昌县', 3311, 33);
INSERT INTO `s_areas` VALUES (966, 331124, '松阳县', 3311, 33);
INSERT INTO `s_areas` VALUES (967, 331125, '云和县', 3311, 33);
INSERT INTO `s_areas` VALUES (968, 331126, '庆元县', 3311, 33);
INSERT INTO `s_areas` VALUES (969, 331127, '景宁畲族自治县', 3311, 33);
INSERT INTO `s_areas` VALUES (970, 331181, '龙泉市', 3311, 33);
INSERT INTO `s_areas` VALUES (971, 340102, '瑶海区', 3401, 34);
INSERT INTO `s_areas` VALUES (972, 340103, '庐阳区', 3401, 34);
INSERT INTO `s_areas` VALUES (973, 340104, '蜀山区', 3401, 34);
INSERT INTO `s_areas` VALUES (974, 340111, '包河区', 3401, 34);
INSERT INTO `s_areas` VALUES (975, 340121, '长丰县', 3401, 34);
INSERT INTO `s_areas` VALUES (976, 340122, '肥东县', 3401, 34);
INSERT INTO `s_areas` VALUES (977, 340123, '肥西县', 3401, 34);
INSERT INTO `s_areas` VALUES (978, 340124, '庐江县', 3401, 34);
INSERT INTO `s_areas` VALUES (979, 340171, '合肥高新技术产业开发区', 3401, 34);
INSERT INTO `s_areas` VALUES (980, 340172, '合肥经济技术开发区', 3401, 34);
INSERT INTO `s_areas` VALUES (981, 340173, '合肥新站高新技术产业开发区', 3401, 34);
INSERT INTO `s_areas` VALUES (982, 340181, '巢湖市', 3401, 34);
INSERT INTO `s_areas` VALUES (983, 340202, '镜湖区', 3402, 34);
INSERT INTO `s_areas` VALUES (984, 340203, '弋江区', 3402, 34);
INSERT INTO `s_areas` VALUES (985, 340207, '鸠江区', 3402, 34);
INSERT INTO `s_areas` VALUES (986, 340208, '三山区', 3402, 34);
INSERT INTO `s_areas` VALUES (987, 340221, '芜湖县', 3402, 34);
INSERT INTO `s_areas` VALUES (988, 340222, '繁昌县', 3402, 34);
INSERT INTO `s_areas` VALUES (989, 340223, '南陵县', 3402, 34);
INSERT INTO `s_areas` VALUES (990, 340225, '无为县', 3402, 34);
INSERT INTO `s_areas` VALUES (991, 340271, '芜湖经济技术开发区', 3402, 34);
INSERT INTO `s_areas` VALUES (992, 340272, '安徽芜湖长江大桥经济开发区', 3402, 34);
INSERT INTO `s_areas` VALUES (993, 340302, '龙子湖区', 3403, 34);
INSERT INTO `s_areas` VALUES (994, 340303, '蚌山区', 3403, 34);
INSERT INTO `s_areas` VALUES (995, 340304, '禹会区', 3403, 34);
INSERT INTO `s_areas` VALUES (996, 340311, '淮上区', 3403, 34);
INSERT INTO `s_areas` VALUES (997, 340321, '怀远县', 3403, 34);
INSERT INTO `s_areas` VALUES (998, 340322, '五河县', 3403, 34);
INSERT INTO `s_areas` VALUES (999, 340323, '固镇县', 3403, 34);
INSERT INTO `s_areas` VALUES (1000, 340371, '蚌埠市高新技术开发区', 3403, 34);
INSERT INTO `s_areas` VALUES (1001, 340372, '蚌埠市经济开发区', 3403, 34);
INSERT INTO `s_areas` VALUES (1002, 340402, '大通区', 3404, 34);
INSERT INTO `s_areas` VALUES (1003, 340403, '田家庵区', 3404, 34);
INSERT INTO `s_areas` VALUES (1004, 340404, '谢家集区', 3404, 34);
INSERT INTO `s_areas` VALUES (1005, 340405, '八公山区', 3404, 34);
INSERT INTO `s_areas` VALUES (1006, 340406, '潘集区', 3404, 34);
INSERT INTO `s_areas` VALUES (1007, 340421, '凤台县', 3404, 34);
INSERT INTO `s_areas` VALUES (1008, 340422, '寿县', 3404, 34);
INSERT INTO `s_areas` VALUES (1009, 340503, '花山区', 3405, 34);
INSERT INTO `s_areas` VALUES (1010, 340504, '雨山区', 3405, 34);
INSERT INTO `s_areas` VALUES (1011, 340506, '博望区', 3405, 34);
INSERT INTO `s_areas` VALUES (1012, 340521, '当涂县', 3405, 34);
INSERT INTO `s_areas` VALUES (1013, 340522, '含山县', 3405, 34);
INSERT INTO `s_areas` VALUES (1014, 340523, '和县', 3405, 34);
INSERT INTO `s_areas` VALUES (1015, 340602, '杜集区', 3406, 34);
INSERT INTO `s_areas` VALUES (1016, 340603, '相山区', 3406, 34);
INSERT INTO `s_areas` VALUES (1017, 340604, '烈山区', 3406, 34);
INSERT INTO `s_areas` VALUES (1018, 340621, '濉溪县', 3406, 34);
INSERT INTO `s_areas` VALUES (1019, 340705, '铜官区', 3407, 34);
INSERT INTO `s_areas` VALUES (1020, 340706, '义安区', 3407, 34);
INSERT INTO `s_areas` VALUES (1021, 340711, '郊区', 3407, 34);
INSERT INTO `s_areas` VALUES (1022, 340722, '枞阳县', 3407, 34);
INSERT INTO `s_areas` VALUES (1023, 340802, '迎江区', 3408, 34);
INSERT INTO `s_areas` VALUES (1024, 340803, '大观区', 3408, 34);
INSERT INTO `s_areas` VALUES (1025, 340811, '宜秀区', 3408, 34);
INSERT INTO `s_areas` VALUES (1026, 340822, '怀宁县', 3408, 34);
INSERT INTO `s_areas` VALUES (1027, 340825, '太湖县', 3408, 34);
INSERT INTO `s_areas` VALUES (1028, 340826, '宿松县', 3408, 34);
INSERT INTO `s_areas` VALUES (1029, 340827, '望江县', 3408, 34);
INSERT INTO `s_areas` VALUES (1030, 340828, '岳西县', 3408, 34);
INSERT INTO `s_areas` VALUES (1031, 340871, '安徽安庆经济开发区', 3408, 34);
INSERT INTO `s_areas` VALUES (1032, 340881, '桐城市', 3408, 34);
INSERT INTO `s_areas` VALUES (1033, 340882, '潜山市', 3408, 34);
INSERT INTO `s_areas` VALUES (1034, 341002, '屯溪区', 3410, 34);
INSERT INTO `s_areas` VALUES (1035, 341003, '黄山区', 3410, 34);
INSERT INTO `s_areas` VALUES (1036, 341004, '徽州区', 3410, 34);
INSERT INTO `s_areas` VALUES (1037, 341021, '歙县', 3410, 34);
INSERT INTO `s_areas` VALUES (1038, 341022, '休宁县', 3410, 34);
INSERT INTO `s_areas` VALUES (1039, 341023, '黟县', 3410, 34);
INSERT INTO `s_areas` VALUES (1040, 341024, '祁门县', 3410, 34);
INSERT INTO `s_areas` VALUES (1041, 341102, '琅琊区', 3411, 34);
INSERT INTO `s_areas` VALUES (1042, 341103, '南谯区', 3411, 34);
INSERT INTO `s_areas` VALUES (1043, 341122, '来安县', 3411, 34);
INSERT INTO `s_areas` VALUES (1044, 341124, '全椒县', 3411, 34);
INSERT INTO `s_areas` VALUES (1045, 341125, '定远县', 3411, 34);
INSERT INTO `s_areas` VALUES (1046, 341126, '凤阳县', 3411, 34);
INSERT INTO `s_areas` VALUES (1047, 341171, '苏滁现代产业园', 3411, 34);
INSERT INTO `s_areas` VALUES (1048, 341172, '滁州经济技术开发区', 3411, 34);
INSERT INTO `s_areas` VALUES (1049, 341181, '天长市', 3411, 34);
INSERT INTO `s_areas` VALUES (1050, 341182, '明光市', 3411, 34);
INSERT INTO `s_areas` VALUES (1051, 341202, '颍州区', 3412, 34);
INSERT INTO `s_areas` VALUES (1052, 341203, '颍东区', 3412, 34);
INSERT INTO `s_areas` VALUES (1053, 341204, '颍泉区', 3412, 34);
INSERT INTO `s_areas` VALUES (1054, 341221, '临泉县', 3412, 34);
INSERT INTO `s_areas` VALUES (1055, 341222, '太和县', 3412, 34);
INSERT INTO `s_areas` VALUES (1056, 341225, '阜南县', 3412, 34);
INSERT INTO `s_areas` VALUES (1057, 341226, '颍上县', 3412, 34);
INSERT INTO `s_areas` VALUES (1058, 341271, '阜阳合肥现代产业园区', 3412, 34);
INSERT INTO `s_areas` VALUES (1059, 341272, '阜阳经济技术开发区', 3412, 34);
INSERT INTO `s_areas` VALUES (1060, 341282, '界首市', 3412, 34);
INSERT INTO `s_areas` VALUES (1061, 341302, '埇桥区', 3413, 34);
INSERT INTO `s_areas` VALUES (1062, 341321, '砀山县', 3413, 34);
INSERT INTO `s_areas` VALUES (1063, 341322, '萧县', 3413, 34);
INSERT INTO `s_areas` VALUES (1064, 341323, '灵璧县', 3413, 34);
INSERT INTO `s_areas` VALUES (1065, 341324, '泗县', 3413, 34);
INSERT INTO `s_areas` VALUES (1066, 341371, '宿州马鞍山现代产业园区', 3413, 34);
INSERT INTO `s_areas` VALUES (1067, 341372, '宿州经济技术开发区', 3413, 34);
INSERT INTO `s_areas` VALUES (1068, 341502, '金安区', 3415, 34);
INSERT INTO `s_areas` VALUES (1069, 341503, '裕安区', 3415, 34);
INSERT INTO `s_areas` VALUES (1070, 341504, '叶集区', 3415, 34);
INSERT INTO `s_areas` VALUES (1071, 341522, '霍邱县', 3415, 34);
INSERT INTO `s_areas` VALUES (1072, 341523, '舒城县', 3415, 34);
INSERT INTO `s_areas` VALUES (1073, 341524, '金寨县', 3415, 34);
INSERT INTO `s_areas` VALUES (1074, 341525, '霍山县', 3415, 34);
INSERT INTO `s_areas` VALUES (1075, 341602, '谯城区', 3416, 34);
INSERT INTO `s_areas` VALUES (1076, 341621, '涡阳县', 3416, 34);
INSERT INTO `s_areas` VALUES (1077, 341622, '蒙城县', 3416, 34);
INSERT INTO `s_areas` VALUES (1078, 341623, '利辛县', 3416, 34);
INSERT INTO `s_areas` VALUES (1079, 341702, '贵池区', 3417, 34);
INSERT INTO `s_areas` VALUES (1080, 341721, '东至县', 3417, 34);
INSERT INTO `s_areas` VALUES (1081, 341722, '石台县', 3417, 34);
INSERT INTO `s_areas` VALUES (1082, 341723, '青阳县', 3417, 34);
INSERT INTO `s_areas` VALUES (1083, 341802, '宣州区', 3418, 34);
INSERT INTO `s_areas` VALUES (1084, 341821, '郎溪县', 3418, 34);
INSERT INTO `s_areas` VALUES (1085, 341822, '广德县', 3418, 34);
INSERT INTO `s_areas` VALUES (1086, 341823, '泾县', 3418, 34);
INSERT INTO `s_areas` VALUES (1087, 341824, '绩溪县', 3418, 34);
INSERT INTO `s_areas` VALUES (1088, 341825, '旌德县', 3418, 34);
INSERT INTO `s_areas` VALUES (1089, 341871, '宣城市经济开发区', 3418, 34);
INSERT INTO `s_areas` VALUES (1090, 341881, '宁国市', 3418, 34);
INSERT INTO `s_areas` VALUES (1091, 350102, '鼓楼区', 3501, 35);
INSERT INTO `s_areas` VALUES (1092, 350103, '台江区', 3501, 35);
INSERT INTO `s_areas` VALUES (1093, 350104, '仓山区', 3501, 35);
INSERT INTO `s_areas` VALUES (1094, 350105, '马尾区', 3501, 35);
INSERT INTO `s_areas` VALUES (1095, 350111, '晋安区', 3501, 35);
INSERT INTO `s_areas` VALUES (1096, 350112, '长乐区', 3501, 35);
INSERT INTO `s_areas` VALUES (1097, 350121, '闽侯县', 3501, 35);
INSERT INTO `s_areas` VALUES (1098, 350122, '连江县', 3501, 35);
INSERT INTO `s_areas` VALUES (1099, 350123, '罗源县', 3501, 35);
INSERT INTO `s_areas` VALUES (1100, 350124, '闽清县', 3501, 35);
INSERT INTO `s_areas` VALUES (1101, 350125, '永泰县', 3501, 35);
INSERT INTO `s_areas` VALUES (1102, 350128, '平潭县', 3501, 35);
INSERT INTO `s_areas` VALUES (1103, 350181, '福清市', 3501, 35);
INSERT INTO `s_areas` VALUES (1104, 350203, '思明区', 3502, 35);
INSERT INTO `s_areas` VALUES (1105, 350205, '海沧区', 3502, 35);
INSERT INTO `s_areas` VALUES (1106, 350206, '湖里区', 3502, 35);
INSERT INTO `s_areas` VALUES (1107, 350211, '集美区', 3502, 35);
INSERT INTO `s_areas` VALUES (1108, 350212, '同安区', 3502, 35);
INSERT INTO `s_areas` VALUES (1109, 350213, '翔安区', 3502, 35);
INSERT INTO `s_areas` VALUES (1110, 350302, '城厢区', 3503, 35);
INSERT INTO `s_areas` VALUES (1111, 350303, '涵江区', 3503, 35);
INSERT INTO `s_areas` VALUES (1112, 350304, '荔城区', 3503, 35);
INSERT INTO `s_areas` VALUES (1113, 350305, '秀屿区', 3503, 35);
INSERT INTO `s_areas` VALUES (1114, 350322, '仙游县', 3503, 35);
INSERT INTO `s_areas` VALUES (1115, 350402, '梅列区', 3504, 35);
INSERT INTO `s_areas` VALUES (1116, 350403, '三元区', 3504, 35);
INSERT INTO `s_areas` VALUES (1117, 350421, '明溪县', 3504, 35);
INSERT INTO `s_areas` VALUES (1118, 350423, '清流县', 3504, 35);
INSERT INTO `s_areas` VALUES (1119, 350424, '宁化县', 3504, 35);
INSERT INTO `s_areas` VALUES (1120, 350425, '大田县', 3504, 35);
INSERT INTO `s_areas` VALUES (1121, 350426, '尤溪县', 3504, 35);
INSERT INTO `s_areas` VALUES (1122, 350427, '沙县', 3504, 35);
INSERT INTO `s_areas` VALUES (1123, 350428, '将乐县', 3504, 35);
INSERT INTO `s_areas` VALUES (1124, 350429, '泰宁县', 3504, 35);
INSERT INTO `s_areas` VALUES (1125, 350430, '建宁县', 3504, 35);
INSERT INTO `s_areas` VALUES (1126, 350481, '永安市', 3504, 35);
INSERT INTO `s_areas` VALUES (1127, 350502, '鲤城区', 3505, 35);
INSERT INTO `s_areas` VALUES (1128, 350503, '丰泽区', 3505, 35);
INSERT INTO `s_areas` VALUES (1129, 350504, '洛江区', 3505, 35);
INSERT INTO `s_areas` VALUES (1130, 350505, '泉港区', 3505, 35);
INSERT INTO `s_areas` VALUES (1131, 350521, '惠安县', 3505, 35);
INSERT INTO `s_areas` VALUES (1132, 350524, '安溪县', 3505, 35);
INSERT INTO `s_areas` VALUES (1133, 350525, '永春县', 3505, 35);
INSERT INTO `s_areas` VALUES (1134, 350526, '德化县', 3505, 35);
INSERT INTO `s_areas` VALUES (1135, 350527, '金门县', 3505, 35);
INSERT INTO `s_areas` VALUES (1136, 350581, '石狮市', 3505, 35);
INSERT INTO `s_areas` VALUES (1137, 350582, '晋江市', 3505, 35);
INSERT INTO `s_areas` VALUES (1138, 350583, '南安市', 3505, 35);
INSERT INTO `s_areas` VALUES (1139, 350602, '芗城区', 3506, 35);
INSERT INTO `s_areas` VALUES (1140, 350603, '龙文区', 3506, 35);
INSERT INTO `s_areas` VALUES (1141, 350622, '云霄县', 3506, 35);
INSERT INTO `s_areas` VALUES (1142, 350623, '漳浦县', 3506, 35);
INSERT INTO `s_areas` VALUES (1143, 350624, '诏安县', 3506, 35);
INSERT INTO `s_areas` VALUES (1144, 350625, '长泰县', 3506, 35);
INSERT INTO `s_areas` VALUES (1145, 350626, '东山县', 3506, 35);
INSERT INTO `s_areas` VALUES (1146, 350627, '南靖县', 3506, 35);
INSERT INTO `s_areas` VALUES (1147, 350628, '平和县', 3506, 35);
INSERT INTO `s_areas` VALUES (1148, 350629, '华安县', 3506, 35);
INSERT INTO `s_areas` VALUES (1149, 350681, '龙海市', 3506, 35);
INSERT INTO `s_areas` VALUES (1150, 350702, '延平区', 3507, 35);
INSERT INTO `s_areas` VALUES (1151, 350703, '建阳区', 3507, 35);
INSERT INTO `s_areas` VALUES (1152, 350721, '顺昌县', 3507, 35);
INSERT INTO `s_areas` VALUES (1153, 350722, '浦城县', 3507, 35);
INSERT INTO `s_areas` VALUES (1154, 350723, '光泽县', 3507, 35);
INSERT INTO `s_areas` VALUES (1155, 350724, '松溪县', 3507, 35);
INSERT INTO `s_areas` VALUES (1156, 350725, '政和县', 3507, 35);
INSERT INTO `s_areas` VALUES (1157, 350781, '邵武市', 3507, 35);
INSERT INTO `s_areas` VALUES (1158, 350782, '武夷山市', 3507, 35);
INSERT INTO `s_areas` VALUES (1159, 350783, '建瓯市', 3507, 35);
INSERT INTO `s_areas` VALUES (1160, 350802, '新罗区', 3508, 35);
INSERT INTO `s_areas` VALUES (1161, 350803, '永定区', 3508, 35);
INSERT INTO `s_areas` VALUES (1162, 350821, '长汀县', 3508, 35);
INSERT INTO `s_areas` VALUES (1163, 350823, '上杭县', 3508, 35);
INSERT INTO `s_areas` VALUES (1164, 350824, '武平县', 3508, 35);
INSERT INTO `s_areas` VALUES (1165, 350825, '连城县', 3508, 35);
INSERT INTO `s_areas` VALUES (1166, 350881, '漳平市', 3508, 35);
INSERT INTO `s_areas` VALUES (1167, 350902, '蕉城区', 3509, 35);
INSERT INTO `s_areas` VALUES (1168, 350921, '霞浦县', 3509, 35);
INSERT INTO `s_areas` VALUES (1169, 350922, '古田县', 3509, 35);
INSERT INTO `s_areas` VALUES (1170, 350923, '屏南县', 3509, 35);
INSERT INTO `s_areas` VALUES (1171, 350924, '寿宁县', 3509, 35);
INSERT INTO `s_areas` VALUES (1172, 350925, '周宁县', 3509, 35);
INSERT INTO `s_areas` VALUES (1173, 350926, '柘荣县', 3509, 35);
INSERT INTO `s_areas` VALUES (1174, 350981, '福安市', 3509, 35);
INSERT INTO `s_areas` VALUES (1175, 350982, '福鼎市', 3509, 35);
INSERT INTO `s_areas` VALUES (1176, 360102, '东湖区', 3601, 36);
INSERT INTO `s_areas` VALUES (1177, 360103, '西湖区', 3601, 36);
INSERT INTO `s_areas` VALUES (1178, 360104, '青云谱区', 3601, 36);
INSERT INTO `s_areas` VALUES (1179, 360105, '湾里区', 3601, 36);
INSERT INTO `s_areas` VALUES (1180, 360111, '青山湖区', 3601, 36);
INSERT INTO `s_areas` VALUES (1181, 360112, '新建区', 3601, 36);
INSERT INTO `s_areas` VALUES (1182, 360121, '南昌县', 3601, 36);
INSERT INTO `s_areas` VALUES (1183, 360123, '安义县', 3601, 36);
INSERT INTO `s_areas` VALUES (1184, 360124, '进贤县', 3601, 36);
INSERT INTO `s_areas` VALUES (1185, 360202, '昌江区', 3602, 36);
INSERT INTO `s_areas` VALUES (1186, 360203, '珠山区', 3602, 36);
INSERT INTO `s_areas` VALUES (1187, 360222, '浮梁县', 3602, 36);
INSERT INTO `s_areas` VALUES (1188, 360281, '乐平市', 3602, 36);
INSERT INTO `s_areas` VALUES (1189, 360302, '安源区', 3603, 36);
INSERT INTO `s_areas` VALUES (1190, 360313, '湘东区', 3603, 36);
INSERT INTO `s_areas` VALUES (1191, 360321, '莲花县', 3603, 36);
INSERT INTO `s_areas` VALUES (1192, 360322, '上栗县', 3603, 36);
INSERT INTO `s_areas` VALUES (1193, 360323, '芦溪县', 3603, 36);
INSERT INTO `s_areas` VALUES (1194, 360402, '濂溪区', 3604, 36);
INSERT INTO `s_areas` VALUES (1195, 360403, '浔阳区', 3604, 36);
INSERT INTO `s_areas` VALUES (1196, 360404, '柴桑区', 3604, 36);
INSERT INTO `s_areas` VALUES (1197, 360423, '武宁县', 3604, 36);
INSERT INTO `s_areas` VALUES (1198, 360424, '修水县', 3604, 36);
INSERT INTO `s_areas` VALUES (1199, 360425, '永修县', 3604, 36);
INSERT INTO `s_areas` VALUES (1200, 360426, '德安县', 3604, 36);
INSERT INTO `s_areas` VALUES (1201, 360428, '都昌县', 3604, 36);
INSERT INTO `s_areas` VALUES (1202, 360429, '湖口县', 3604, 36);
INSERT INTO `s_areas` VALUES (1203, 360430, '彭泽县', 3604, 36);
INSERT INTO `s_areas` VALUES (1204, 360481, '瑞昌市', 3604, 36);
INSERT INTO `s_areas` VALUES (1205, 360482, '共青城市', 3604, 36);
INSERT INTO `s_areas` VALUES (1206, 360483, '庐山市', 3604, 36);
INSERT INTO `s_areas` VALUES (1207, 360502, '渝水区', 3605, 36);
INSERT INTO `s_areas` VALUES (1208, 360521, '分宜县', 3605, 36);
INSERT INTO `s_areas` VALUES (1209, 360602, '月湖区', 3606, 36);
INSERT INTO `s_areas` VALUES (1210, 360603, '余江区', 3606, 36);
INSERT INTO `s_areas` VALUES (1211, 360681, '贵溪市', 3606, 36);
INSERT INTO `s_areas` VALUES (1212, 360702, '章贡区', 3607, 36);
INSERT INTO `s_areas` VALUES (1213, 360703, '南康区', 3607, 36);
INSERT INTO `s_areas` VALUES (1214, 360704, '赣县区', 3607, 36);
INSERT INTO `s_areas` VALUES (1215, 360722, '信丰县', 3607, 36);
INSERT INTO `s_areas` VALUES (1216, 360723, '大余县', 3607, 36);
INSERT INTO `s_areas` VALUES (1217, 360724, '上犹县', 3607, 36);
INSERT INTO `s_areas` VALUES (1218, 360725, '崇义县', 3607, 36);
INSERT INTO `s_areas` VALUES (1219, 360726, '安远县', 3607, 36);
INSERT INTO `s_areas` VALUES (1220, 360727, '龙南县', 3607, 36);
INSERT INTO `s_areas` VALUES (1221, 360728, '定南县', 3607, 36);
INSERT INTO `s_areas` VALUES (1222, 360729, '全南县', 3607, 36);
INSERT INTO `s_areas` VALUES (1223, 360730, '宁都县', 3607, 36);
INSERT INTO `s_areas` VALUES (1224, 360731, '于都县', 3607, 36);
INSERT INTO `s_areas` VALUES (1225, 360732, '兴国县', 3607, 36);
INSERT INTO `s_areas` VALUES (1226, 360733, '会昌县', 3607, 36);
INSERT INTO `s_areas` VALUES (1227, 360734, '寻乌县', 3607, 36);
INSERT INTO `s_areas` VALUES (1228, 360735, '石城县', 3607, 36);
INSERT INTO `s_areas` VALUES (1229, 360781, '瑞金市', 3607, 36);
INSERT INTO `s_areas` VALUES (1230, 360802, '吉州区', 3608, 36);
INSERT INTO `s_areas` VALUES (1231, 360803, '青原区', 3608, 36);
INSERT INTO `s_areas` VALUES (1232, 360821, '吉安县', 3608, 36);
INSERT INTO `s_areas` VALUES (1233, 360822, '吉水县', 3608, 36);
INSERT INTO `s_areas` VALUES (1234, 360823, '峡江县', 3608, 36);
INSERT INTO `s_areas` VALUES (1235, 360824, '新干县', 3608, 36);
INSERT INTO `s_areas` VALUES (1236, 360825, '永丰县', 3608, 36);
INSERT INTO `s_areas` VALUES (1237, 360826, '泰和县', 3608, 36);
INSERT INTO `s_areas` VALUES (1238, 360827, '遂川县', 3608, 36);
INSERT INTO `s_areas` VALUES (1239, 360828, '万安县', 3608, 36);
INSERT INTO `s_areas` VALUES (1240, 360829, '安福县', 3608, 36);
INSERT INTO `s_areas` VALUES (1241, 360830, '永新县', 3608, 36);
INSERT INTO `s_areas` VALUES (1242, 360881, '井冈山市', 3608, 36);
INSERT INTO `s_areas` VALUES (1243, 360902, '袁州区', 3609, 36);
INSERT INTO `s_areas` VALUES (1244, 360921, '奉新县', 3609, 36);
INSERT INTO `s_areas` VALUES (1245, 360922, '万载县', 3609, 36);
INSERT INTO `s_areas` VALUES (1246, 360923, '上高县', 3609, 36);
INSERT INTO `s_areas` VALUES (1247, 360924, '宜丰县', 3609, 36);
INSERT INTO `s_areas` VALUES (1248, 360925, '靖安县', 3609, 36);
INSERT INTO `s_areas` VALUES (1249, 360926, '铜鼓县', 3609, 36);
INSERT INTO `s_areas` VALUES (1250, 360981, '丰城市', 3609, 36);
INSERT INTO `s_areas` VALUES (1251, 360982, '樟树市', 3609, 36);
INSERT INTO `s_areas` VALUES (1252, 360983, '高安市', 3609, 36);
INSERT INTO `s_areas` VALUES (1253, 361002, '临川区', 3610, 36);
INSERT INTO `s_areas` VALUES (1254, 361003, '东乡区', 3610, 36);
INSERT INTO `s_areas` VALUES (1255, 361021, '南城县', 3610, 36);
INSERT INTO `s_areas` VALUES (1256, 361022, '黎川县', 3610, 36);
INSERT INTO `s_areas` VALUES (1257, 361023, '南丰县', 3610, 36);
INSERT INTO `s_areas` VALUES (1258, 361024, '崇仁县', 3610, 36);
INSERT INTO `s_areas` VALUES (1259, 361025, '乐安县', 3610, 36);
INSERT INTO `s_areas` VALUES (1260, 361026, '宜黄县', 3610, 36);
INSERT INTO `s_areas` VALUES (1261, 361027, '金溪县', 3610, 36);
INSERT INTO `s_areas` VALUES (1262, 361028, '资溪县', 3610, 36);
INSERT INTO `s_areas` VALUES (1263, 361030, '广昌县', 3610, 36);
INSERT INTO `s_areas` VALUES (1264, 361102, '信州区', 3611, 36);
INSERT INTO `s_areas` VALUES (1265, 361103, '广丰区', 3611, 36);
INSERT INTO `s_areas` VALUES (1266, 361121, '上饶县', 3611, 36);
INSERT INTO `s_areas` VALUES (1267, 361123, '玉山县', 3611, 36);
INSERT INTO `s_areas` VALUES (1268, 361124, '铅山县', 3611, 36);
INSERT INTO `s_areas` VALUES (1269, 361125, '横峰县', 3611, 36);
INSERT INTO `s_areas` VALUES (1270, 361126, '弋阳县', 3611, 36);
INSERT INTO `s_areas` VALUES (1271, 361127, '余干县', 3611, 36);
INSERT INTO `s_areas` VALUES (1272, 361128, '鄱阳县', 3611, 36);
INSERT INTO `s_areas` VALUES (1273, 361129, '万年县', 3611, 36);
INSERT INTO `s_areas` VALUES (1274, 361130, '婺源县', 3611, 36);
INSERT INTO `s_areas` VALUES (1275, 361181, '德兴市', 3611, 36);
INSERT INTO `s_areas` VALUES (1276, 370102, '历下区', 3701, 37);
INSERT INTO `s_areas` VALUES (1277, 370103, '市中区', 3701, 37);
INSERT INTO `s_areas` VALUES (1278, 370104, '槐荫区', 3701, 37);
INSERT INTO `s_areas` VALUES (1279, 370105, '天桥区', 3701, 37);
INSERT INTO `s_areas` VALUES (1280, 370112, '历城区', 3701, 37);
INSERT INTO `s_areas` VALUES (1281, 370113, '长清区', 3701, 37);
INSERT INTO `s_areas` VALUES (1282, 370114, '章丘区', 3701, 37);
INSERT INTO `s_areas` VALUES (1283, 370115, '济阳区', 3701, 37);
INSERT INTO `s_areas` VALUES (1284, 370124, '平阴县', 3701, 37);
INSERT INTO `s_areas` VALUES (1285, 370126, '商河县', 3701, 37);
INSERT INTO `s_areas` VALUES (1286, 370171, '济南高新技术产业开发区', 3701, 37);
INSERT INTO `s_areas` VALUES (1287, 370202, '市南区', 3702, 37);
INSERT INTO `s_areas` VALUES (1288, 370203, '市北区', 3702, 37);
INSERT INTO `s_areas` VALUES (1289, 370211, '黄岛区', 3702, 37);
INSERT INTO `s_areas` VALUES (1290, 370212, '崂山区', 3702, 37);
INSERT INTO `s_areas` VALUES (1291, 370213, '李沧区', 3702, 37);
INSERT INTO `s_areas` VALUES (1292, 370214, '城阳区', 3702, 37);
INSERT INTO `s_areas` VALUES (1293, 370215, '即墨区', 3702, 37);
INSERT INTO `s_areas` VALUES (1294, 370271, '青岛高新技术产业开发区', 3702, 37);
INSERT INTO `s_areas` VALUES (1295, 370281, '胶州市', 3702, 37);
INSERT INTO `s_areas` VALUES (1296, 370283, '平度市', 3702, 37);
INSERT INTO `s_areas` VALUES (1297, 370285, '莱西市', 3702, 37);
INSERT INTO `s_areas` VALUES (1298, 370302, '淄川区', 3703, 37);
INSERT INTO `s_areas` VALUES (1299, 370303, '张店区', 3703, 37);
INSERT INTO `s_areas` VALUES (1300, 370304, '博山区', 3703, 37);
INSERT INTO `s_areas` VALUES (1301, 370305, '临淄区', 3703, 37);
INSERT INTO `s_areas` VALUES (1302, 370306, '周村区', 3703, 37);
INSERT INTO `s_areas` VALUES (1303, 370321, '桓台县', 3703, 37);
INSERT INTO `s_areas` VALUES (1304, 370322, '高青县', 3703, 37);
INSERT INTO `s_areas` VALUES (1305, 370323, '沂源县', 3703, 37);
INSERT INTO `s_areas` VALUES (1306, 370402, '市中区', 3704, 37);
INSERT INTO `s_areas` VALUES (1307, 370403, '薛城区', 3704, 37);
INSERT INTO `s_areas` VALUES (1308, 370404, '峄城区', 3704, 37);
INSERT INTO `s_areas` VALUES (1309, 370405, '台儿庄区', 3704, 37);
INSERT INTO `s_areas` VALUES (1310, 370406, '山亭区', 3704, 37);
INSERT INTO `s_areas` VALUES (1311, 370481, '滕州市', 3704, 37);
INSERT INTO `s_areas` VALUES (1312, 370502, '东营区', 3705, 37);
INSERT INTO `s_areas` VALUES (1313, 370503, '河口区', 3705, 37);
INSERT INTO `s_areas` VALUES (1314, 370505, '垦利区', 3705, 37);
INSERT INTO `s_areas` VALUES (1315, 370522, '利津县', 3705, 37);
INSERT INTO `s_areas` VALUES (1316, 370523, '广饶县', 3705, 37);
INSERT INTO `s_areas` VALUES (1317, 370571, '东营经济技术开发区', 3705, 37);
INSERT INTO `s_areas` VALUES (1318, 370572, '东营港经济开发区', 3705, 37);
INSERT INTO `s_areas` VALUES (1319, 370602, '芝罘区', 3706, 37);
INSERT INTO `s_areas` VALUES (1320, 370611, '福山区', 3706, 37);
INSERT INTO `s_areas` VALUES (1321, 370612, '牟平区', 3706, 37);
INSERT INTO `s_areas` VALUES (1322, 370613, '莱山区', 3706, 37);
INSERT INTO `s_areas` VALUES (1323, 370634, '长岛县', 3706, 37);
INSERT INTO `s_areas` VALUES (1324, 370671, '烟台高新技术产业开发区', 3706, 37);
INSERT INTO `s_areas` VALUES (1325, 370672, '烟台经济技术开发区', 3706, 37);
INSERT INTO `s_areas` VALUES (1326, 370681, '龙口市', 3706, 37);
INSERT INTO `s_areas` VALUES (1327, 370682, '莱阳市', 3706, 37);
INSERT INTO `s_areas` VALUES (1328, 370683, '莱州市', 3706, 37);
INSERT INTO `s_areas` VALUES (1329, 370684, '蓬莱市', 3706, 37);
INSERT INTO `s_areas` VALUES (1330, 370685, '招远市', 3706, 37);
INSERT INTO `s_areas` VALUES (1331, 370686, '栖霞市', 3706, 37);
INSERT INTO `s_areas` VALUES (1332, 370687, '海阳市', 3706, 37);
INSERT INTO `s_areas` VALUES (1333, 370702, '潍城区', 3707, 37);
INSERT INTO `s_areas` VALUES (1334, 370703, '寒亭区', 3707, 37);
INSERT INTO `s_areas` VALUES (1335, 370704, '坊子区', 3707, 37);
INSERT INTO `s_areas` VALUES (1336, 370705, '奎文区', 3707, 37);
INSERT INTO `s_areas` VALUES (1337, 370724, '临朐县', 3707, 37);
INSERT INTO `s_areas` VALUES (1338, 370725, '昌乐县', 3707, 37);
INSERT INTO `s_areas` VALUES (1339, 370772, '潍坊滨海经济技术开发区', 3707, 37);
INSERT INTO `s_areas` VALUES (1340, 370781, '青州市', 3707, 37);
INSERT INTO `s_areas` VALUES (1341, 370782, '诸城市', 3707, 37);
INSERT INTO `s_areas` VALUES (1342, 370783, '寿光市', 3707, 37);
INSERT INTO `s_areas` VALUES (1343, 370784, '安丘市', 3707, 37);
INSERT INTO `s_areas` VALUES (1344, 370785, '高密市', 3707, 37);
INSERT INTO `s_areas` VALUES (1345, 370786, '昌邑市', 3707, 37);
INSERT INTO `s_areas` VALUES (1346, 370811, '任城区', 3708, 37);
INSERT INTO `s_areas` VALUES (1347, 370812, '兖州区', 3708, 37);
INSERT INTO `s_areas` VALUES (1348, 370826, '微山县', 3708, 37);
INSERT INTO `s_areas` VALUES (1349, 370827, '鱼台县', 3708, 37);
INSERT INTO `s_areas` VALUES (1350, 370828, '金乡县', 3708, 37);
INSERT INTO `s_areas` VALUES (1351, 370829, '嘉祥县', 3708, 37);
INSERT INTO `s_areas` VALUES (1352, 370830, '汶上县', 3708, 37);
INSERT INTO `s_areas` VALUES (1353, 370831, '泗水县', 3708, 37);
INSERT INTO `s_areas` VALUES (1354, 370832, '梁山县', 3708, 37);
INSERT INTO `s_areas` VALUES (1355, 370871, '济宁高新技术产业开发区', 3708, 37);
INSERT INTO `s_areas` VALUES (1356, 370881, '曲阜市', 3708, 37);
INSERT INTO `s_areas` VALUES (1357, 370883, '邹城市', 3708, 37);
INSERT INTO `s_areas` VALUES (1358, 370902, '泰山区', 3709, 37);
INSERT INTO `s_areas` VALUES (1359, 370911, '岱岳区', 3709, 37);
INSERT INTO `s_areas` VALUES (1360, 370921, '宁阳县', 3709, 37);
INSERT INTO `s_areas` VALUES (1361, 370923, '东平县', 3709, 37);
INSERT INTO `s_areas` VALUES (1362, 370982, '新泰市', 3709, 37);
INSERT INTO `s_areas` VALUES (1363, 370983, '肥城市', 3709, 37);
INSERT INTO `s_areas` VALUES (1364, 371002, '环翠区', 3710, 37);
INSERT INTO `s_areas` VALUES (1365, 371003, '文登区', 3710, 37);
INSERT INTO `s_areas` VALUES (1366, 371071, '威海火炬高技术产业开发区', 3710, 37);
INSERT INTO `s_areas` VALUES (1367, 371072, '威海经济技术开发区', 3710, 37);
INSERT INTO `s_areas` VALUES (1368, 371073, '威海临港经济技术开发区', 3710, 37);
INSERT INTO `s_areas` VALUES (1369, 371082, '荣成市', 3710, 37);
INSERT INTO `s_areas` VALUES (1370, 371083, '乳山市', 3710, 37);
INSERT INTO `s_areas` VALUES (1371, 371102, '东港区', 3711, 37);
INSERT INTO `s_areas` VALUES (1372, 371103, '岚山区', 3711, 37);
INSERT INTO `s_areas` VALUES (1373, 371121, '五莲县', 3711, 37);
INSERT INTO `s_areas` VALUES (1374, 371122, '莒县', 3711, 37);
INSERT INTO `s_areas` VALUES (1375, 371171, '日照经济技术开发区', 3711, 37);
INSERT INTO `s_areas` VALUES (1376, 371202, '莱城区', 3712, 37);
INSERT INTO `s_areas` VALUES (1377, 371203, '钢城区', 3712, 37);
INSERT INTO `s_areas` VALUES (1378, 371302, '兰山区', 3713, 37);
INSERT INTO `s_areas` VALUES (1379, 371311, '罗庄区', 3713, 37);
INSERT INTO `s_areas` VALUES (1380, 371312, '河东区', 3713, 37);
INSERT INTO `s_areas` VALUES (1381, 371321, '沂南县', 3713, 37);
INSERT INTO `s_areas` VALUES (1382, 371322, '郯城县', 3713, 37);
INSERT INTO `s_areas` VALUES (1383, 371323, '沂水县', 3713, 37);
INSERT INTO `s_areas` VALUES (1384, 371324, '兰陵县', 3713, 37);
INSERT INTO `s_areas` VALUES (1385, 371325, '费县', 3713, 37);
INSERT INTO `s_areas` VALUES (1386, 371326, '平邑县', 3713, 37);
INSERT INTO `s_areas` VALUES (1387, 371327, '莒南县', 3713, 37);
INSERT INTO `s_areas` VALUES (1388, 371328, '蒙阴县', 3713, 37);
INSERT INTO `s_areas` VALUES (1389, 371329, '临沭县', 3713, 37);
INSERT INTO `s_areas` VALUES (1390, 371371, '临沂高新技术产业开发区', 3713, 37);
INSERT INTO `s_areas` VALUES (1391, 371372, '临沂经济技术开发区', 3713, 37);
INSERT INTO `s_areas` VALUES (1392, 371373, '临沂临港经济开发区', 3713, 37);
INSERT INTO `s_areas` VALUES (1393, 371402, '德城区', 3714, 37);
INSERT INTO `s_areas` VALUES (1394, 371403, '陵城区', 3714, 37);
INSERT INTO `s_areas` VALUES (1395, 371422, '宁津县', 3714, 37);
INSERT INTO `s_areas` VALUES (1396, 371423, '庆云县', 3714, 37);
INSERT INTO `s_areas` VALUES (1397, 371424, '临邑县', 3714, 37);
INSERT INTO `s_areas` VALUES (1398, 371425, '齐河县', 3714, 37);
INSERT INTO `s_areas` VALUES (1399, 371426, '平原县', 3714, 37);
INSERT INTO `s_areas` VALUES (1400, 371427, '夏津县', 3714, 37);
INSERT INTO `s_areas` VALUES (1401, 371428, '武城县', 3714, 37);
INSERT INTO `s_areas` VALUES (1402, 371471, '德州经济技术开发区', 3714, 37);
INSERT INTO `s_areas` VALUES (1403, 371472, '德州运河经济开发区', 3714, 37);
INSERT INTO `s_areas` VALUES (1404, 371481, '乐陵市', 3714, 37);
INSERT INTO `s_areas` VALUES (1405, 371482, '禹城市', 3714, 37);
INSERT INTO `s_areas` VALUES (1406, 371502, '东昌府区', 3715, 37);
INSERT INTO `s_areas` VALUES (1407, 371521, '阳谷县', 3715, 37);
INSERT INTO `s_areas` VALUES (1408, 371522, '莘县', 3715, 37);
INSERT INTO `s_areas` VALUES (1409, 371523, '茌平县', 3715, 37);
INSERT INTO `s_areas` VALUES (1410, 371524, '东阿县', 3715, 37);
INSERT INTO `s_areas` VALUES (1411, 371525, '冠县', 3715, 37);
INSERT INTO `s_areas` VALUES (1412, 371526, '高唐县', 3715, 37);
INSERT INTO `s_areas` VALUES (1413, 371581, '临清市', 3715, 37);
INSERT INTO `s_areas` VALUES (1414, 371602, '滨城区', 3716, 37);
INSERT INTO `s_areas` VALUES (1415, 371603, '沾化区', 3716, 37);
INSERT INTO `s_areas` VALUES (1416, 371621, '惠民县', 3716, 37);
INSERT INTO `s_areas` VALUES (1417, 371622, '阳信县', 3716, 37);
INSERT INTO `s_areas` VALUES (1418, 371623, '无棣县', 3716, 37);
INSERT INTO `s_areas` VALUES (1419, 371625, '博兴县', 3716, 37);
INSERT INTO `s_areas` VALUES (1420, 371681, '邹平市', 3716, 37);
INSERT INTO `s_areas` VALUES (1421, 371702, '牡丹区', 3717, 37);
INSERT INTO `s_areas` VALUES (1422, 371703, '定陶区', 3717, 37);
INSERT INTO `s_areas` VALUES (1423, 371721, '曹县', 3717, 37);
INSERT INTO `s_areas` VALUES (1424, 371722, '单县', 3717, 37);
INSERT INTO `s_areas` VALUES (1425, 371723, '成武县', 3717, 37);
INSERT INTO `s_areas` VALUES (1426, 371724, '巨野县', 3717, 37);
INSERT INTO `s_areas` VALUES (1427, 371725, '郓城县', 3717, 37);
INSERT INTO `s_areas` VALUES (1428, 371726, '鄄城县', 3717, 37);
INSERT INTO `s_areas` VALUES (1429, 371728, '东明县', 3717, 37);
INSERT INTO `s_areas` VALUES (1430, 371771, '菏泽经济技术开发区', 3717, 37);
INSERT INTO `s_areas` VALUES (1431, 371772, '菏泽高新技术开发区', 3717, 37);
INSERT INTO `s_areas` VALUES (1432, 410102, '中原区', 4101, 41);
INSERT INTO `s_areas` VALUES (1433, 410103, '二七区', 4101, 41);
INSERT INTO `s_areas` VALUES (1434, 410104, '管城回族区', 4101, 41);
INSERT INTO `s_areas` VALUES (1435, 410105, '金水区', 4101, 41);
INSERT INTO `s_areas` VALUES (1436, 410106, '上街区', 4101, 41);
INSERT INTO `s_areas` VALUES (1437, 410108, '惠济区', 4101, 41);
INSERT INTO `s_areas` VALUES (1438, 410122, '中牟县', 4101, 41);
INSERT INTO `s_areas` VALUES (1439, 410171, '郑州经济技术开发区', 4101, 41);
INSERT INTO `s_areas` VALUES (1440, 410172, '郑州高新技术产业开发区', 4101, 41);
INSERT INTO `s_areas` VALUES (1441, 410173, '郑州航空港经济综合实验区', 4101, 41);
INSERT INTO `s_areas` VALUES (1442, 410181, '巩义市', 4101, 41);
INSERT INTO `s_areas` VALUES (1443, 410182, '荥阳市', 4101, 41);
INSERT INTO `s_areas` VALUES (1444, 410183, '新密市', 4101, 41);
INSERT INTO `s_areas` VALUES (1445, 410184, '新郑市', 4101, 41);
INSERT INTO `s_areas` VALUES (1446, 410185, '登封市', 4101, 41);
INSERT INTO `s_areas` VALUES (1447, 410202, '龙亭区', 4102, 41);
INSERT INTO `s_areas` VALUES (1448, 410203, '顺河回族区', 4102, 41);
INSERT INTO `s_areas` VALUES (1449, 410204, '鼓楼区', 4102, 41);
INSERT INTO `s_areas` VALUES (1450, 410205, '禹王台区', 4102, 41);
INSERT INTO `s_areas` VALUES (1451, 410212, '祥符区', 4102, 41);
INSERT INTO `s_areas` VALUES (1452, 410221, '杞县', 4102, 41);
INSERT INTO `s_areas` VALUES (1453, 410222, '通许县', 4102, 41);
INSERT INTO `s_areas` VALUES (1454, 410223, '尉氏县', 4102, 41);
INSERT INTO `s_areas` VALUES (1455, 410225, '兰考县', 4102, 41);
INSERT INTO `s_areas` VALUES (1456, 410302, '老城区', 4103, 41);
INSERT INTO `s_areas` VALUES (1457, 410303, '西工区', 4103, 41);
INSERT INTO `s_areas` VALUES (1458, 410304, '瀍河回族区', 4103, 41);
INSERT INTO `s_areas` VALUES (1459, 410305, '涧西区', 4103, 41);
INSERT INTO `s_areas` VALUES (1460, 410306, '吉利区', 4103, 41);
INSERT INTO `s_areas` VALUES (1461, 410311, '洛龙区', 4103, 41);
INSERT INTO `s_areas` VALUES (1462, 410322, '孟津县', 4103, 41);
INSERT INTO `s_areas` VALUES (1463, 410323, '新安县', 4103, 41);
INSERT INTO `s_areas` VALUES (1464, 410324, '栾川县', 4103, 41);
INSERT INTO `s_areas` VALUES (1465, 410325, '嵩县', 4103, 41);
INSERT INTO `s_areas` VALUES (1466, 410326, '汝阳县', 4103, 41);
INSERT INTO `s_areas` VALUES (1467, 410327, '宜阳县', 4103, 41);
INSERT INTO `s_areas` VALUES (1468, 410328, '洛宁县', 4103, 41);
INSERT INTO `s_areas` VALUES (1469, 410329, '伊川县', 4103, 41);
INSERT INTO `s_areas` VALUES (1470, 410371, '洛阳高新技术产业开发区', 4103, 41);
INSERT INTO `s_areas` VALUES (1471, 410381, '偃师市', 4103, 41);
INSERT INTO `s_areas` VALUES (1472, 410402, '新华区', 4104, 41);
INSERT INTO `s_areas` VALUES (1473, 410403, '卫东区', 4104, 41);
INSERT INTO `s_areas` VALUES (1474, 410404, '石龙区', 4104, 41);
INSERT INTO `s_areas` VALUES (1475, 410411, '湛河区', 4104, 41);
INSERT INTO `s_areas` VALUES (1476, 410421, '宝丰县', 4104, 41);
INSERT INTO `s_areas` VALUES (1477, 410422, '叶县', 4104, 41);
INSERT INTO `s_areas` VALUES (1478, 410423, '鲁山县', 4104, 41);
INSERT INTO `s_areas` VALUES (1479, 410425, '郏县', 4104, 41);
INSERT INTO `s_areas` VALUES (1480, 410471, '平顶山高新技术产业开发区', 4104, 41);
INSERT INTO `s_areas` VALUES (1481, 410472, '平顶山市新城区', 4104, 41);
INSERT INTO `s_areas` VALUES (1482, 410481, '舞钢市', 4104, 41);
INSERT INTO `s_areas` VALUES (1483, 410482, '汝州市', 4104, 41);
INSERT INTO `s_areas` VALUES (1484, 410502, '文峰区', 4105, 41);
INSERT INTO `s_areas` VALUES (1485, 410503, '北关区', 4105, 41);
INSERT INTO `s_areas` VALUES (1486, 410505, '殷都区', 4105, 41);
INSERT INTO `s_areas` VALUES (1487, 410506, '龙安区', 4105, 41);
INSERT INTO `s_areas` VALUES (1488, 410522, '安阳县', 4105, 41);
INSERT INTO `s_areas` VALUES (1489, 410523, '汤阴县', 4105, 41);
INSERT INTO `s_areas` VALUES (1490, 410526, '滑县', 4105, 41);
INSERT INTO `s_areas` VALUES (1491, 410527, '内黄县', 4105, 41);
INSERT INTO `s_areas` VALUES (1492, 410571, '安阳高新技术产业开发区', 4105, 41);
INSERT INTO `s_areas` VALUES (1493, 410581, '林州市', 4105, 41);
INSERT INTO `s_areas` VALUES (1494, 410602, '鹤山区', 4106, 41);
INSERT INTO `s_areas` VALUES (1495, 410603, '山城区', 4106, 41);
INSERT INTO `s_areas` VALUES (1496, 410611, '淇滨区', 4106, 41);
INSERT INTO `s_areas` VALUES (1497, 410621, '浚县', 4106, 41);
INSERT INTO `s_areas` VALUES (1498, 410622, '淇县', 4106, 41);
INSERT INTO `s_areas` VALUES (1499, 410671, '鹤壁经济技术开发区', 4106, 41);
INSERT INTO `s_areas` VALUES (1500, 410702, '红旗区', 4107, 41);
INSERT INTO `s_areas` VALUES (1501, 410703, '卫滨区', 4107, 41);
INSERT INTO `s_areas` VALUES (1502, 410704, '凤泉区', 4107, 41);
INSERT INTO `s_areas` VALUES (1503, 410711, '牧野区', 4107, 41);
INSERT INTO `s_areas` VALUES (1504, 410721, '新乡县', 4107, 41);
INSERT INTO `s_areas` VALUES (1505, 410724, '获嘉县', 4107, 41);
INSERT INTO `s_areas` VALUES (1506, 410725, '原阳县', 4107, 41);
INSERT INTO `s_areas` VALUES (1507, 410726, '延津县', 4107, 41);
INSERT INTO `s_areas` VALUES (1508, 410727, '封丘县', 4107, 41);
INSERT INTO `s_areas` VALUES (1509, 410728, '长垣县', 4107, 41);
INSERT INTO `s_areas` VALUES (1510, 410771, '新乡高新技术产业开发区', 4107, 41);
INSERT INTO `s_areas` VALUES (1511, 410772, '新乡经济技术开发区', 4107, 41);
INSERT INTO `s_areas` VALUES (1512, 410773, '新乡市平原城乡一体化示范区', 4107, 41);
INSERT INTO `s_areas` VALUES (1513, 410781, '卫辉市', 4107, 41);
INSERT INTO `s_areas` VALUES (1514, 410782, '辉县市', 4107, 41);
INSERT INTO `s_areas` VALUES (1515, 410802, '解放区', 4108, 41);
INSERT INTO `s_areas` VALUES (1516, 410803, '中站区', 4108, 41);
INSERT INTO `s_areas` VALUES (1517, 410804, '马村区', 4108, 41);
INSERT INTO `s_areas` VALUES (1518, 410811, '山阳区', 4108, 41);
INSERT INTO `s_areas` VALUES (1519, 410821, '修武县', 4108, 41);
INSERT INTO `s_areas` VALUES (1520, 410822, '博爱县', 4108, 41);
INSERT INTO `s_areas` VALUES (1521, 410823, '武陟县', 4108, 41);
INSERT INTO `s_areas` VALUES (1522, 410825, '温县', 4108, 41);
INSERT INTO `s_areas` VALUES (1523, 410871, '焦作城乡一体化示范区', 4108, 41);
INSERT INTO `s_areas` VALUES (1524, 410882, '沁阳市', 4108, 41);
INSERT INTO `s_areas` VALUES (1525, 410883, '孟州市', 4108, 41);
INSERT INTO `s_areas` VALUES (1526, 410902, '华龙区', 4109, 41);
INSERT INTO `s_areas` VALUES (1527, 410922, '清丰县', 4109, 41);
INSERT INTO `s_areas` VALUES (1528, 410923, '南乐县', 4109, 41);
INSERT INTO `s_areas` VALUES (1529, 410926, '范县', 4109, 41);
INSERT INTO `s_areas` VALUES (1530, 410927, '台前县', 4109, 41);
INSERT INTO `s_areas` VALUES (1531, 410928, '濮阳县', 4109, 41);
INSERT INTO `s_areas` VALUES (1532, 410971, '河南濮阳工业园区', 4109, 41);
INSERT INTO `s_areas` VALUES (1533, 410972, '濮阳经济技术开发区', 4109, 41);
INSERT INTO `s_areas` VALUES (1534, 411002, '魏都区', 4110, 41);
INSERT INTO `s_areas` VALUES (1535, 411003, '建安区', 4110, 41);
INSERT INTO `s_areas` VALUES (1536, 411024, '鄢陵县', 4110, 41);
INSERT INTO `s_areas` VALUES (1537, 411025, '襄城县', 4110, 41);
INSERT INTO `s_areas` VALUES (1538, 411071, '许昌经济技术开发区', 4110, 41);
INSERT INTO `s_areas` VALUES (1539, 411081, '禹州市', 4110, 41);
INSERT INTO `s_areas` VALUES (1540, 411082, '长葛市', 4110, 41);
INSERT INTO `s_areas` VALUES (1541, 411102, '源汇区', 4111, 41);
INSERT INTO `s_areas` VALUES (1542, 411103, '郾城区', 4111, 41);
INSERT INTO `s_areas` VALUES (1543, 411104, '召陵区', 4111, 41);
INSERT INTO `s_areas` VALUES (1544, 411121, '舞阳县', 4111, 41);
INSERT INTO `s_areas` VALUES (1545, 411122, '临颍县', 4111, 41);
INSERT INTO `s_areas` VALUES (1546, 411171, '漯河经济技术开发区', 4111, 41);
INSERT INTO `s_areas` VALUES (1547, 411202, '湖滨区', 4112, 41);
INSERT INTO `s_areas` VALUES (1548, 411203, '陕州区', 4112, 41);
INSERT INTO `s_areas` VALUES (1549, 411221, '渑池县', 4112, 41);
INSERT INTO `s_areas` VALUES (1550, 411224, '卢氏县', 4112, 41);
INSERT INTO `s_areas` VALUES (1551, 411271, '河南三门峡经济开发区', 4112, 41);
INSERT INTO `s_areas` VALUES (1552, 411281, '义马市', 4112, 41);
INSERT INTO `s_areas` VALUES (1553, 411282, '灵宝市', 4112, 41);
INSERT INTO `s_areas` VALUES (1554, 411302, '宛城区', 4113, 41);
INSERT INTO `s_areas` VALUES (1555, 411303, '卧龙区', 4113, 41);
INSERT INTO `s_areas` VALUES (1556, 411321, '南召县', 4113, 41);
INSERT INTO `s_areas` VALUES (1557, 411322, '方城县', 4113, 41);
INSERT INTO `s_areas` VALUES (1558, 411323, '西峡县', 4113, 41);
INSERT INTO `s_areas` VALUES (1559, 411324, '镇平县', 4113, 41);
INSERT INTO `s_areas` VALUES (1560, 411325, '内乡县', 4113, 41);
INSERT INTO `s_areas` VALUES (1561, 411326, '淅川县', 4113, 41);
INSERT INTO `s_areas` VALUES (1562, 411327, '社旗县', 4113, 41);
INSERT INTO `s_areas` VALUES (1563, 411328, '唐河县', 4113, 41);
INSERT INTO `s_areas` VALUES (1564, 411329, '新野县', 4113, 41);
INSERT INTO `s_areas` VALUES (1565, 411330, '桐柏县', 4113, 41);
INSERT INTO `s_areas` VALUES (1566, 411371, '南阳高新技术产业开发区', 4113, 41);
INSERT INTO `s_areas` VALUES (1567, 411372, '南阳市城乡一体化示范区', 4113, 41);
INSERT INTO `s_areas` VALUES (1568, 411381, '邓州市', 4113, 41);
INSERT INTO `s_areas` VALUES (1569, 411402, '梁园区', 4114, 41);
INSERT INTO `s_areas` VALUES (1570, 411403, '睢阳区', 4114, 41);
INSERT INTO `s_areas` VALUES (1571, 411421, '民权县', 4114, 41);
INSERT INTO `s_areas` VALUES (1572, 411422, '睢县', 4114, 41);
INSERT INTO `s_areas` VALUES (1573, 411423, '宁陵县', 4114, 41);
INSERT INTO `s_areas` VALUES (1574, 411424, '柘城县', 4114, 41);
INSERT INTO `s_areas` VALUES (1575, 411425, '虞城县', 4114, 41);
INSERT INTO `s_areas` VALUES (1576, 411426, '夏邑县', 4114, 41);
INSERT INTO `s_areas` VALUES (1577, 411471, '豫东综合物流产业聚集区', 4114, 41);
INSERT INTO `s_areas` VALUES (1578, 411472, '河南商丘经济开发区', 4114, 41);
INSERT INTO `s_areas` VALUES (1579, 411481, '永城市', 4114, 41);
INSERT INTO `s_areas` VALUES (1580, 411502, '浉河区', 4115, 41);
INSERT INTO `s_areas` VALUES (1581, 411503, '平桥区', 4115, 41);
INSERT INTO `s_areas` VALUES (1582, 411521, '罗山县', 4115, 41);
INSERT INTO `s_areas` VALUES (1583, 411522, '光山县', 4115, 41);
INSERT INTO `s_areas` VALUES (1584, 411523, '新县', 4115, 41);
INSERT INTO `s_areas` VALUES (1585, 411524, '商城县', 4115, 41);
INSERT INTO `s_areas` VALUES (1586, 411525, '固始县', 4115, 41);
INSERT INTO `s_areas` VALUES (1587, 411526, '潢川县', 4115, 41);
INSERT INTO `s_areas` VALUES (1588, 411527, '淮滨县', 4115, 41);
INSERT INTO `s_areas` VALUES (1589, 411528, '息县', 4115, 41);
INSERT INTO `s_areas` VALUES (1590, 411571, '信阳高新技术产业开发区', 4115, 41);
INSERT INTO `s_areas` VALUES (1591, 411602, '川汇区', 4116, 41);
INSERT INTO `s_areas` VALUES (1592, 411621, '扶沟县', 4116, 41);
INSERT INTO `s_areas` VALUES (1593, 411622, '西华县', 4116, 41);
INSERT INTO `s_areas` VALUES (1594, 411623, '商水县', 4116, 41);
INSERT INTO `s_areas` VALUES (1595, 411624, '沈丘县', 4116, 41);
INSERT INTO `s_areas` VALUES (1596, 411625, '郸城县', 4116, 41);
INSERT INTO `s_areas` VALUES (1597, 411626, '淮阳县', 4116, 41);
INSERT INTO `s_areas` VALUES (1598, 411627, '太康县', 4116, 41);
INSERT INTO `s_areas` VALUES (1599, 411628, '鹿邑县', 4116, 41);
INSERT INTO `s_areas` VALUES (1600, 411671, '河南周口经济开发区', 4116, 41);
INSERT INTO `s_areas` VALUES (1601, 411681, '项城市', 4116, 41);
INSERT INTO `s_areas` VALUES (1602, 411702, '驿城区', 4117, 41);
INSERT INTO `s_areas` VALUES (1603, 411721, '西平县', 4117, 41);
INSERT INTO `s_areas` VALUES (1604, 411722, '上蔡县', 4117, 41);
INSERT INTO `s_areas` VALUES (1605, 411723, '平舆县', 4117, 41);
INSERT INTO `s_areas` VALUES (1606, 411724, '正阳县', 4117, 41);
INSERT INTO `s_areas` VALUES (1607, 411725, '确山县', 4117, 41);
INSERT INTO `s_areas` VALUES (1608, 411726, '泌阳县', 4117, 41);
INSERT INTO `s_areas` VALUES (1609, 411727, '汝南县', 4117, 41);
INSERT INTO `s_areas` VALUES (1610, 411728, '遂平县', 4117, 41);
INSERT INTO `s_areas` VALUES (1611, 411729, '新蔡县', 4117, 41);
INSERT INTO `s_areas` VALUES (1612, 411771, '河南驻马店经济开发区', 4117, 41);
INSERT INTO `s_areas` VALUES (1613, 419001, '济源市', 4190, 41);
INSERT INTO `s_areas` VALUES (1614, 420102, '江岸区', 4201, 42);
INSERT INTO `s_areas` VALUES (1615, 420103, '江汉区', 4201, 42);
INSERT INTO `s_areas` VALUES (1616, 420104, '硚口区', 4201, 42);
INSERT INTO `s_areas` VALUES (1617, 420105, '汉阳区', 4201, 42);
INSERT INTO `s_areas` VALUES (1618, 420106, '武昌区', 4201, 42);
INSERT INTO `s_areas` VALUES (1619, 420107, '青山区', 4201, 42);
INSERT INTO `s_areas` VALUES (1620, 420111, '洪山区', 4201, 42);
INSERT INTO `s_areas` VALUES (1621, 420112, '东西湖区', 4201, 42);
INSERT INTO `s_areas` VALUES (1622, 420113, '汉南区', 4201, 42);
INSERT INTO `s_areas` VALUES (1623, 420114, '蔡甸区', 4201, 42);
INSERT INTO `s_areas` VALUES (1624, 420115, '江夏区', 4201, 42);
INSERT INTO `s_areas` VALUES (1625, 420116, '黄陂区', 4201, 42);
INSERT INTO `s_areas` VALUES (1626, 420117, '新洲区', 4201, 42);
INSERT INTO `s_areas` VALUES (1627, 420202, '黄石港区', 4202, 42);
INSERT INTO `s_areas` VALUES (1628, 420203, '西塞山区', 4202, 42);
INSERT INTO `s_areas` VALUES (1629, 420204, '下陆区', 4202, 42);
INSERT INTO `s_areas` VALUES (1630, 420205, '铁山区', 4202, 42);
INSERT INTO `s_areas` VALUES (1631, 420222, '阳新县', 4202, 42);
INSERT INTO `s_areas` VALUES (1632, 420281, '大冶市', 4202, 42);
INSERT INTO `s_areas` VALUES (1633, 420302, '茅箭区', 4203, 42);
INSERT INTO `s_areas` VALUES (1634, 420303, '张湾区', 4203, 42);
INSERT INTO `s_areas` VALUES (1635, 420304, '郧阳区', 4203, 42);
INSERT INTO `s_areas` VALUES (1636, 420322, '郧西县', 4203, 42);
INSERT INTO `s_areas` VALUES (1637, 420323, '竹山县', 4203, 42);
INSERT INTO `s_areas` VALUES (1638, 420324, '竹溪县', 4203, 42);
INSERT INTO `s_areas` VALUES (1639, 420325, '房县', 4203, 42);
INSERT INTO `s_areas` VALUES (1640, 420381, '丹江口市', 4203, 42);
INSERT INTO `s_areas` VALUES (1641, 420502, '西陵区', 4205, 42);
INSERT INTO `s_areas` VALUES (1642, 420503, '伍家岗区', 4205, 42);
INSERT INTO `s_areas` VALUES (1643, 420504, '点军区', 4205, 42);
INSERT INTO `s_areas` VALUES (1644, 420505, '猇亭区', 4205, 42);
INSERT INTO `s_areas` VALUES (1645, 420506, '夷陵区', 4205, 42);
INSERT INTO `s_areas` VALUES (1646, 420525, '远安县', 4205, 42);
INSERT INTO `s_areas` VALUES (1647, 420526, '兴山县', 4205, 42);
INSERT INTO `s_areas` VALUES (1648, 420527, '秭归县', 4205, 42);
INSERT INTO `s_areas` VALUES (1649, 420528, '长阳土家族自治县', 4205, 42);
INSERT INTO `s_areas` VALUES (1650, 420529, '五峰土家族自治县', 4205, 42);
INSERT INTO `s_areas` VALUES (1651, 420581, '宜都市', 4205, 42);
INSERT INTO `s_areas` VALUES (1652, 420582, '当阳市', 4205, 42);
INSERT INTO `s_areas` VALUES (1653, 420583, '枝江市', 4205, 42);
INSERT INTO `s_areas` VALUES (1654, 420602, '襄城区', 4206, 42);
INSERT INTO `s_areas` VALUES (1655, 420606, '樊城区', 4206, 42);
INSERT INTO `s_areas` VALUES (1656, 420607, '襄州区', 4206, 42);
INSERT INTO `s_areas` VALUES (1657, 420624, '南漳县', 4206, 42);
INSERT INTO `s_areas` VALUES (1658, 420625, '谷城县', 4206, 42);
INSERT INTO `s_areas` VALUES (1659, 420626, '保康县', 4206, 42);
INSERT INTO `s_areas` VALUES (1660, 420682, '老河口市', 4206, 42);
INSERT INTO `s_areas` VALUES (1661, 420683, '枣阳市', 4206, 42);
INSERT INTO `s_areas` VALUES (1662, 420684, '宜城市', 4206, 42);
INSERT INTO `s_areas` VALUES (1663, 420702, '梁子湖区', 4207, 42);
INSERT INTO `s_areas` VALUES (1664, 420703, '华容区', 4207, 42);
INSERT INTO `s_areas` VALUES (1665, 420704, '鄂城区', 4207, 42);
INSERT INTO `s_areas` VALUES (1666, 420802, '东宝区', 4208, 42);
INSERT INTO `s_areas` VALUES (1667, 420804, '掇刀区', 4208, 42);
INSERT INTO `s_areas` VALUES (1668, 420822, '沙洋县', 4208, 42);
INSERT INTO `s_areas` VALUES (1669, 420881, '钟祥市', 4208, 42);
INSERT INTO `s_areas` VALUES (1670, 420882, '京山市', 4208, 42);
INSERT INTO `s_areas` VALUES (1671, 420902, '孝南区', 4209, 42);
INSERT INTO `s_areas` VALUES (1672, 420921, '孝昌县', 4209, 42);
INSERT INTO `s_areas` VALUES (1673, 420922, '大悟县', 4209, 42);
INSERT INTO `s_areas` VALUES (1674, 420923, '云梦县', 4209, 42);
INSERT INTO `s_areas` VALUES (1675, 420981, '应城市', 4209, 42);
INSERT INTO `s_areas` VALUES (1676, 420982, '安陆市', 4209, 42);
INSERT INTO `s_areas` VALUES (1677, 420984, '汉川市', 4209, 42);
INSERT INTO `s_areas` VALUES (1678, 421002, '沙市区', 4210, 42);
INSERT INTO `s_areas` VALUES (1679, 421003, '荆州区', 4210, 42);
INSERT INTO `s_areas` VALUES (1680, 421022, '公安县', 4210, 42);
INSERT INTO `s_areas` VALUES (1681, 421023, '监利县', 4210, 42);
INSERT INTO `s_areas` VALUES (1682, 421024, '江陵县', 4210, 42);
INSERT INTO `s_areas` VALUES (1683, 421071, '荆州经济技术开发区', 4210, 42);
INSERT INTO `s_areas` VALUES (1684, 421081, '石首市', 4210, 42);
INSERT INTO `s_areas` VALUES (1685, 421083, '洪湖市', 4210, 42);
INSERT INTO `s_areas` VALUES (1686, 421087, '松滋市', 4210, 42);
INSERT INTO `s_areas` VALUES (1687, 421102, '黄州区', 4211, 42);
INSERT INTO `s_areas` VALUES (1688, 421121, '团风县', 4211, 42);
INSERT INTO `s_areas` VALUES (1689, 421122, '红安县', 4211, 42);
INSERT INTO `s_areas` VALUES (1690, 421123, '罗田县', 4211, 42);
INSERT INTO `s_areas` VALUES (1691, 421124, '英山县', 4211, 42);
INSERT INTO `s_areas` VALUES (1692, 421125, '浠水县', 4211, 42);
INSERT INTO `s_areas` VALUES (1693, 421126, '蕲春县', 4211, 42);
INSERT INTO `s_areas` VALUES (1694, 421127, '黄梅县', 4211, 42);
INSERT INTO `s_areas` VALUES (1695, 421171, '龙感湖管理区', 4211, 42);
INSERT INTO `s_areas` VALUES (1696, 421181, '麻城市', 4211, 42);
INSERT INTO `s_areas` VALUES (1697, 421182, '武穴市', 4211, 42);
INSERT INTO `s_areas` VALUES (1698, 421202, '咸安区', 4212, 42);
INSERT INTO `s_areas` VALUES (1699, 421221, '嘉鱼县', 4212, 42);
INSERT INTO `s_areas` VALUES (1700, 421222, '通城县', 4212, 42);
INSERT INTO `s_areas` VALUES (1701, 421223, '崇阳县', 4212, 42);
INSERT INTO `s_areas` VALUES (1702, 421224, '通山县', 4212, 42);
INSERT INTO `s_areas` VALUES (1703, 421281, '赤壁市', 4212, 42);
INSERT INTO `s_areas` VALUES (1704, 421303, '曾都区', 4213, 42);
INSERT INTO `s_areas` VALUES (1705, 421321, '随县', 4213, 42);
INSERT INTO `s_areas` VALUES (1706, 421381, '广水市', 4213, 42);
INSERT INTO `s_areas` VALUES (1707, 422801, '恩施市', 4228, 42);
INSERT INTO `s_areas` VALUES (1708, 422802, '利川市', 4228, 42);
INSERT INTO `s_areas` VALUES (1709, 422822, '建始县', 4228, 42);
INSERT INTO `s_areas` VALUES (1710, 422823, '巴东县', 4228, 42);
INSERT INTO `s_areas` VALUES (1711, 422825, '宣恩县', 4228, 42);
INSERT INTO `s_areas` VALUES (1712, 422826, '咸丰县', 4228, 42);
INSERT INTO `s_areas` VALUES (1713, 422827, '来凤县', 4228, 42);
INSERT INTO `s_areas` VALUES (1714, 422828, '鹤峰县', 4228, 42);
INSERT INTO `s_areas` VALUES (1715, 429004, '仙桃市', 4290, 42);
INSERT INTO `s_areas` VALUES (1716, 429005, '潜江市', 4290, 42);
INSERT INTO `s_areas` VALUES (1717, 429006, '天门市', 4290, 42);
INSERT INTO `s_areas` VALUES (1718, 429021, '神农架林区', 4290, 42);
INSERT INTO `s_areas` VALUES (1719, 430102, '芙蓉区', 4301, 43);
INSERT INTO `s_areas` VALUES (1720, 430103, '天心区', 4301, 43);
INSERT INTO `s_areas` VALUES (1721, 430104, '岳麓区', 4301, 43);
INSERT INTO `s_areas` VALUES (1722, 430105, '开福区', 4301, 43);
INSERT INTO `s_areas` VALUES (1723, 430111, '雨花区', 4301, 43);
INSERT INTO `s_areas` VALUES (1724, 430112, '望城区', 4301, 43);
INSERT INTO `s_areas` VALUES (1725, 430121, '长沙县', 4301, 43);
INSERT INTO `s_areas` VALUES (1726, 430181, '浏阳市', 4301, 43);
INSERT INTO `s_areas` VALUES (1727, 430182, '宁乡市', 4301, 43);
INSERT INTO `s_areas` VALUES (1728, 430202, '荷塘区', 4302, 43);
INSERT INTO `s_areas` VALUES (1729, 430203, '芦淞区', 4302, 43);
INSERT INTO `s_areas` VALUES (1730, 430204, '石峰区', 4302, 43);
INSERT INTO `s_areas` VALUES (1731, 430211, '天元区', 4302, 43);
INSERT INTO `s_areas` VALUES (1732, 430212, '渌口区', 4302, 43);
INSERT INTO `s_areas` VALUES (1733, 430223, '攸县', 4302, 43);
INSERT INTO `s_areas` VALUES (1734, 430224, '茶陵县', 4302, 43);
INSERT INTO `s_areas` VALUES (1735, 430225, '炎陵县', 4302, 43);
INSERT INTO `s_areas` VALUES (1736, 430271, '云龙示范区', 4302, 43);
INSERT INTO `s_areas` VALUES (1737, 430281, '醴陵市', 4302, 43);
INSERT INTO `s_areas` VALUES (1738, 430302, '雨湖区', 4303, 43);
INSERT INTO `s_areas` VALUES (1739, 430304, '岳塘区', 4303, 43);
INSERT INTO `s_areas` VALUES (1740, 430321, '湘潭县', 4303, 43);
INSERT INTO `s_areas` VALUES (1741, 430371, '湖南湘潭高新技术产业园区', 4303, 43);
INSERT INTO `s_areas` VALUES (1742, 430372, '湘潭昭山示范区', 4303, 43);
INSERT INTO `s_areas` VALUES (1743, 430373, '湘潭九华示范区', 4303, 43);
INSERT INTO `s_areas` VALUES (1744, 430381, '湘乡市', 4303, 43);
INSERT INTO `s_areas` VALUES (1745, 430382, '韶山市', 4303, 43);
INSERT INTO `s_areas` VALUES (1746, 430405, '珠晖区', 4304, 43);
INSERT INTO `s_areas` VALUES (1747, 430406, '雁峰区', 4304, 43);
INSERT INTO `s_areas` VALUES (1748, 430407, '石鼓区', 4304, 43);
INSERT INTO `s_areas` VALUES (1749, 430408, '蒸湘区', 4304, 43);
INSERT INTO `s_areas` VALUES (1750, 430412, '南岳区', 4304, 43);
INSERT INTO `s_areas` VALUES (1751, 430421, '衡阳县', 4304, 43);
INSERT INTO `s_areas` VALUES (1752, 430422, '衡南县', 4304, 43);
INSERT INTO `s_areas` VALUES (1753, 430423, '衡山县', 4304, 43);
INSERT INTO `s_areas` VALUES (1754, 430424, '衡东县', 4304, 43);
INSERT INTO `s_areas` VALUES (1755, 430426, '祁东县', 4304, 43);
INSERT INTO `s_areas` VALUES (1756, 430471, '衡阳综合保税区', 4304, 43);
INSERT INTO `s_areas` VALUES (1757, 430472, '湖南衡阳高新技术产业园区', 4304, 43);
INSERT INTO `s_areas` VALUES (1758, 430473, '湖南衡阳松木经济开发区', 4304, 43);
INSERT INTO `s_areas` VALUES (1759, 430481, '耒阳市', 4304, 43);
INSERT INTO `s_areas` VALUES (1760, 430482, '常宁市', 4304, 43);
INSERT INTO `s_areas` VALUES (1761, 430502, '双清区', 4305, 43);
INSERT INTO `s_areas` VALUES (1762, 430503, '大祥区', 4305, 43);
INSERT INTO `s_areas` VALUES (1763, 430511, '北塔区', 4305, 43);
INSERT INTO `s_areas` VALUES (1764, 430521, '邵东县', 4305, 43);
INSERT INTO `s_areas` VALUES (1765, 430522, '新邵县', 4305, 43);
INSERT INTO `s_areas` VALUES (1766, 430523, '邵阳县', 4305, 43);
INSERT INTO `s_areas` VALUES (1767, 430524, '隆回县', 4305, 43);
INSERT INTO `s_areas` VALUES (1768, 430525, '洞口县', 4305, 43);
INSERT INTO `s_areas` VALUES (1769, 430527, '绥宁县', 4305, 43);
INSERT INTO `s_areas` VALUES (1770, 430528, '新宁县', 4305, 43);
INSERT INTO `s_areas` VALUES (1771, 430529, '城步苗族自治县', 4305, 43);
INSERT INTO `s_areas` VALUES (1772, 430581, '武冈市', 4305, 43);
INSERT INTO `s_areas` VALUES (1773, 430602, '岳阳楼区', 4306, 43);
INSERT INTO `s_areas` VALUES (1774, 430603, '云溪区', 4306, 43);
INSERT INTO `s_areas` VALUES (1775, 430611, '君山区', 4306, 43);
INSERT INTO `s_areas` VALUES (1776, 430621, '岳阳县', 4306, 43);
INSERT INTO `s_areas` VALUES (1777, 430623, '华容县', 4306, 43);
INSERT INTO `s_areas` VALUES (1778, 430624, '湘阴县', 4306, 43);
INSERT INTO `s_areas` VALUES (1779, 430626, '平江县', 4306, 43);
INSERT INTO `s_areas` VALUES (1780, 430671, '岳阳市屈原管理区', 4306, 43);
INSERT INTO `s_areas` VALUES (1781, 430681, '汨罗市', 4306, 43);
INSERT INTO `s_areas` VALUES (1782, 430682, '临湘市', 4306, 43);
INSERT INTO `s_areas` VALUES (1783, 430702, '武陵区', 4307, 43);
INSERT INTO `s_areas` VALUES (1784, 430703, '鼎城区', 4307, 43);
INSERT INTO `s_areas` VALUES (1785, 430721, '安乡县', 4307, 43);
INSERT INTO `s_areas` VALUES (1786, 430722, '汉寿县', 4307, 43);
INSERT INTO `s_areas` VALUES (1787, 430723, '澧县', 4307, 43);
INSERT INTO `s_areas` VALUES (1788, 430724, '临澧县', 4307, 43);
INSERT INTO `s_areas` VALUES (1789, 430725, '桃源县', 4307, 43);
INSERT INTO `s_areas` VALUES (1790, 430726, '石门县', 4307, 43);
INSERT INTO `s_areas` VALUES (1791, 430771, '常德市西洞庭管理区', 4307, 43);
INSERT INTO `s_areas` VALUES (1792, 430781, '津市市', 4307, 43);
INSERT INTO `s_areas` VALUES (1793, 430802, '永定区', 4308, 43);
INSERT INTO `s_areas` VALUES (1794, 430811, '武陵源区', 4308, 43);
INSERT INTO `s_areas` VALUES (1795, 430821, '慈利县', 4308, 43);
INSERT INTO `s_areas` VALUES (1796, 430822, '桑植县', 4308, 43);
INSERT INTO `s_areas` VALUES (1797, 430902, '资阳区', 4309, 43);
INSERT INTO `s_areas` VALUES (1798, 430903, '赫山区', 4309, 43);
INSERT INTO `s_areas` VALUES (1799, 430921, '南县', 4309, 43);
INSERT INTO `s_areas` VALUES (1800, 430922, '桃江县', 4309, 43);
INSERT INTO `s_areas` VALUES (1801, 430923, '安化县', 4309, 43);
INSERT INTO `s_areas` VALUES (1802, 430971, '益阳市大通湖管理区', 4309, 43);
INSERT INTO `s_areas` VALUES (1803, 430972, '湖南益阳高新技术产业园区', 4309, 43);
INSERT INTO `s_areas` VALUES (1804, 430981, '沅江市', 4309, 43);
INSERT INTO `s_areas` VALUES (1805, 431002, '北湖区', 4310, 43);
INSERT INTO `s_areas` VALUES (1806, 431003, '苏仙区', 4310, 43);
INSERT INTO `s_areas` VALUES (1807, 431021, '桂阳县', 4310, 43);
INSERT INTO `s_areas` VALUES (1808, 431022, '宜章县', 4310, 43);
INSERT INTO `s_areas` VALUES (1809, 431023, '永兴县', 4310, 43);
INSERT INTO `s_areas` VALUES (1810, 431024, '嘉禾县', 4310, 43);
INSERT INTO `s_areas` VALUES (1811, 431025, '临武县', 4310, 43);
INSERT INTO `s_areas` VALUES (1812, 431026, '汝城县', 4310, 43);
INSERT INTO `s_areas` VALUES (1813, 431027, '桂东县', 4310, 43);
INSERT INTO `s_areas` VALUES (1814, 431028, '安仁县', 4310, 43);
INSERT INTO `s_areas` VALUES (1815, 431081, '资兴市', 4310, 43);
INSERT INTO `s_areas` VALUES (1816, 431102, '零陵区', 4311, 43);
INSERT INTO `s_areas` VALUES (1817, 431103, '冷水滩区', 4311, 43);
INSERT INTO `s_areas` VALUES (1818, 431121, '祁阳县', 4311, 43);
INSERT INTO `s_areas` VALUES (1819, 431122, '东安县', 4311, 43);
INSERT INTO `s_areas` VALUES (1820, 431123, '双牌县', 4311, 43);
INSERT INTO `s_areas` VALUES (1821, 431124, '道县', 4311, 43);
INSERT INTO `s_areas` VALUES (1822, 431125, '江永县', 4311, 43);
INSERT INTO `s_areas` VALUES (1823, 431126, '宁远县', 4311, 43);
INSERT INTO `s_areas` VALUES (1824, 431127, '蓝山县', 4311, 43);
INSERT INTO `s_areas` VALUES (1825, 431128, '新田县', 4311, 43);
INSERT INTO `s_areas` VALUES (1826, 431129, '江华瑶族自治县', 4311, 43);
INSERT INTO `s_areas` VALUES (1827, 431171, '永州经济技术开发区', 4311, 43);
INSERT INTO `s_areas` VALUES (1828, 431172, '永州市金洞管理区', 4311, 43);
INSERT INTO `s_areas` VALUES (1829, 431173, '永州市回龙圩管理区', 4311, 43);
INSERT INTO `s_areas` VALUES (1830, 431202, '鹤城区', 4312, 43);
INSERT INTO `s_areas` VALUES (1831, 431221, '中方县', 4312, 43);
INSERT INTO `s_areas` VALUES (1832, 431222, '沅陵县', 4312, 43);
INSERT INTO `s_areas` VALUES (1833, 431223, '辰溪县', 4312, 43);
INSERT INTO `s_areas` VALUES (1834, 431224, '溆浦县', 4312, 43);
INSERT INTO `s_areas` VALUES (1835, 431225, '会同县', 4312, 43);
INSERT INTO `s_areas` VALUES (1836, 431226, '麻阳苗族自治县', 4312, 43);
INSERT INTO `s_areas` VALUES (1837, 431227, '新晃侗族自治县', 4312, 43);
INSERT INTO `s_areas` VALUES (1838, 431228, '芷江侗族自治县', 4312, 43);
INSERT INTO `s_areas` VALUES (1839, 431229, '靖州苗族侗族自治县', 4312, 43);
INSERT INTO `s_areas` VALUES (1840, 431230, '通道侗族自治县', 4312, 43);
INSERT INTO `s_areas` VALUES (1841, 431271, '怀化市洪江管理区', 4312, 43);
INSERT INTO `s_areas` VALUES (1842, 431281, '洪江市', 4312, 43);
INSERT INTO `s_areas` VALUES (1843, 431302, '娄星区', 4313, 43);
INSERT INTO `s_areas` VALUES (1844, 431321, '双峰县', 4313, 43);
INSERT INTO `s_areas` VALUES (1845, 431322, '新化县', 4313, 43);
INSERT INTO `s_areas` VALUES (1846, 431381, '冷水江市', 4313, 43);
INSERT INTO `s_areas` VALUES (1847, 431382, '涟源市', 4313, 43);
INSERT INTO `s_areas` VALUES (1848, 433101, '吉首市', 4331, 43);
INSERT INTO `s_areas` VALUES (1849, 433122, '泸溪县', 4331, 43);
INSERT INTO `s_areas` VALUES (1850, 433123, '凤凰县', 4331, 43);
INSERT INTO `s_areas` VALUES (1851, 433124, '花垣县', 4331, 43);
INSERT INTO `s_areas` VALUES (1852, 433125, '保靖县', 4331, 43);
INSERT INTO `s_areas` VALUES (1853, 433126, '古丈县', 4331, 43);
INSERT INTO `s_areas` VALUES (1854, 433127, '永顺县', 4331, 43);
INSERT INTO `s_areas` VALUES (1855, 433130, '龙山县', 4331, 43);
INSERT INTO `s_areas` VALUES (1856, 433172, '湖南吉首经济开发区', 4331, 43);
INSERT INTO `s_areas` VALUES (1857, 433173, '湖南永顺经济开发区', 4331, 43);
INSERT INTO `s_areas` VALUES (1858, 440103, '荔湾区', 4401, 44);
INSERT INTO `s_areas` VALUES (1859, 440104, '越秀区', 4401, 44);
INSERT INTO `s_areas` VALUES (1860, 440105, '海珠区', 4401, 44);
INSERT INTO `s_areas` VALUES (1861, 440106, '天河区', 4401, 44);
INSERT INTO `s_areas` VALUES (1862, 440111, '白云区', 4401, 44);
INSERT INTO `s_areas` VALUES (1863, 440112, '黄埔区', 4401, 44);
INSERT INTO `s_areas` VALUES (1864, 440113, '番禺区', 4401, 44);
INSERT INTO `s_areas` VALUES (1865, 440114, '花都区', 4401, 44);
INSERT INTO `s_areas` VALUES (1866, 440115, '南沙区', 4401, 44);
INSERT INTO `s_areas` VALUES (1867, 440117, '从化区', 4401, 44);
INSERT INTO `s_areas` VALUES (1868, 440118, '增城区', 4401, 44);
INSERT INTO `s_areas` VALUES (1869, 440203, '武江区', 4402, 44);
INSERT INTO `s_areas` VALUES (1870, 440204, '浈江区', 4402, 44);
INSERT INTO `s_areas` VALUES (1871, 440205, '曲江区', 4402, 44);
INSERT INTO `s_areas` VALUES (1872, 440222, '始兴县', 4402, 44);
INSERT INTO `s_areas` VALUES (1873, 440224, '仁化县', 4402, 44);
INSERT INTO `s_areas` VALUES (1874, 440229, '翁源县', 4402, 44);
INSERT INTO `s_areas` VALUES (1875, 440232, '乳源瑶族自治县', 4402, 44);
INSERT INTO `s_areas` VALUES (1876, 440233, '新丰县', 4402, 44);
INSERT INTO `s_areas` VALUES (1877, 440281, '乐昌市', 4402, 44);
INSERT INTO `s_areas` VALUES (1878, 440282, '南雄市', 4402, 44);
INSERT INTO `s_areas` VALUES (1879, 440303, '罗湖区', 4403, 44);
INSERT INTO `s_areas` VALUES (1880, 440304, '福田区', 4403, 44);
INSERT INTO `s_areas` VALUES (1881, 440305, '南山区', 4403, 44);
INSERT INTO `s_areas` VALUES (1882, 440306, '宝安区', 4403, 44);
INSERT INTO `s_areas` VALUES (1883, 440307, '龙岗区', 4403, 44);
INSERT INTO `s_areas` VALUES (1884, 440308, '盐田区', 4403, 44);
INSERT INTO `s_areas` VALUES (1885, 440309, '龙华区', 4403, 44);
INSERT INTO `s_areas` VALUES (1886, 440310, '坪山区', 4403, 44);
INSERT INTO `s_areas` VALUES (1887, 440311, '光明区', 4403, 44);
INSERT INTO `s_areas` VALUES (1888, 440402, '香洲区', 4404, 44);
INSERT INTO `s_areas` VALUES (1889, 440403, '斗门区', 4404, 44);
INSERT INTO `s_areas` VALUES (1890, 440404, '金湾区', 4404, 44);
INSERT INTO `s_areas` VALUES (1891, 440507, '龙湖区', 4405, 44);
INSERT INTO `s_areas` VALUES (1892, 440511, '金平区', 4405, 44);
INSERT INTO `s_areas` VALUES (1893, 440512, '濠江区', 4405, 44);
INSERT INTO `s_areas` VALUES (1894, 440513, '潮阳区', 4405, 44);
INSERT INTO `s_areas` VALUES (1895, 440514, '潮南区', 4405, 44);
INSERT INTO `s_areas` VALUES (1896, 440515, '澄海区', 4405, 44);
INSERT INTO `s_areas` VALUES (1897, 440523, '南澳县', 4405, 44);
INSERT INTO `s_areas` VALUES (1898, 440604, '禅城区', 4406, 44);
INSERT INTO `s_areas` VALUES (1899, 440605, '南海区', 4406, 44);
INSERT INTO `s_areas` VALUES (1900, 440606, '顺德区', 4406, 44);
INSERT INTO `s_areas` VALUES (1901, 440607, '三水区', 4406, 44);
INSERT INTO `s_areas` VALUES (1902, 440608, '高明区', 4406, 44);
INSERT INTO `s_areas` VALUES (1903, 440703, '蓬江区', 4407, 44);
INSERT INTO `s_areas` VALUES (1904, 440704, '江海区', 4407, 44);
INSERT INTO `s_areas` VALUES (1905, 440705, '新会区', 4407, 44);
INSERT INTO `s_areas` VALUES (1906, 440781, '台山市', 4407, 44);
INSERT INTO `s_areas` VALUES (1907, 440783, '开平市', 4407, 44);
INSERT INTO `s_areas` VALUES (1908, 440784, '鹤山市', 4407, 44);
INSERT INTO `s_areas` VALUES (1909, 440785, '恩平市', 4407, 44);
INSERT INTO `s_areas` VALUES (1910, 440802, '赤坎区', 4408, 44);
INSERT INTO `s_areas` VALUES (1911, 440803, '霞山区', 4408, 44);
INSERT INTO `s_areas` VALUES (1912, 440804, '坡头区', 4408, 44);
INSERT INTO `s_areas` VALUES (1913, 440811, '麻章区', 4408, 44);
INSERT INTO `s_areas` VALUES (1914, 440823, '遂溪县', 4408, 44);
INSERT INTO `s_areas` VALUES (1915, 440825, '徐闻县', 4408, 44);
INSERT INTO `s_areas` VALUES (1916, 440881, '廉江市', 4408, 44);
INSERT INTO `s_areas` VALUES (1917, 440882, '雷州市', 4408, 44);
INSERT INTO `s_areas` VALUES (1918, 440883, '吴川市', 4408, 44);
INSERT INTO `s_areas` VALUES (1919, 440902, '茂南区', 4409, 44);
INSERT INTO `s_areas` VALUES (1920, 440904, '电白区', 4409, 44);
INSERT INTO `s_areas` VALUES (1921, 440981, '高州市', 4409, 44);
INSERT INTO `s_areas` VALUES (1922, 440982, '化州市', 4409, 44);
INSERT INTO `s_areas` VALUES (1923, 440983, '信宜市', 4409, 44);
INSERT INTO `s_areas` VALUES (1924, 441202, '端州区', 4412, 44);
INSERT INTO `s_areas` VALUES (1925, 441203, '鼎湖区', 4412, 44);
INSERT INTO `s_areas` VALUES (1926, 441204, '高要区', 4412, 44);
INSERT INTO `s_areas` VALUES (1927, 441223, '广宁县', 4412, 44);
INSERT INTO `s_areas` VALUES (1928, 441224, '怀集县', 4412, 44);
INSERT INTO `s_areas` VALUES (1929, 441225, '封开县', 4412, 44);
INSERT INTO `s_areas` VALUES (1930, 441226, '德庆县', 4412, 44);
INSERT INTO `s_areas` VALUES (1931, 441284, '四会市', 4412, 44);
INSERT INTO `s_areas` VALUES (1932, 441302, '惠城区', 4413, 44);
INSERT INTO `s_areas` VALUES (1933, 441303, '惠阳区', 4413, 44);
INSERT INTO `s_areas` VALUES (1934, 441322, '博罗县', 4413, 44);
INSERT INTO `s_areas` VALUES (1935, 441323, '惠东县', 4413, 44);
INSERT INTO `s_areas` VALUES (1936, 441324, '龙门县', 4413, 44);
INSERT INTO `s_areas` VALUES (1937, 441402, '梅江区', 4414, 44);
INSERT INTO `s_areas` VALUES (1938, 441403, '梅县区', 4414, 44);
INSERT INTO `s_areas` VALUES (1939, 441422, '大埔县', 4414, 44);
INSERT INTO `s_areas` VALUES (1940, 441423, '丰顺县', 4414, 44);
INSERT INTO `s_areas` VALUES (1941, 441424, '五华县', 4414, 44);
INSERT INTO `s_areas` VALUES (1942, 441426, '平远县', 4414, 44);
INSERT INTO `s_areas` VALUES (1943, 441427, '蕉岭县', 4414, 44);
INSERT INTO `s_areas` VALUES (1944, 441481, '兴宁市', 4414, 44);
INSERT INTO `s_areas` VALUES (1945, 441502, '城区', 4415, 44);
INSERT INTO `s_areas` VALUES (1946, 441521, '海丰县', 4415, 44);
INSERT INTO `s_areas` VALUES (1947, 441523, '陆河县', 4415, 44);
INSERT INTO `s_areas` VALUES (1948, 441581, '陆丰市', 4415, 44);
INSERT INTO `s_areas` VALUES (1949, 441602, '源城区', 4416, 44);
INSERT INTO `s_areas` VALUES (1950, 441621, '紫金县', 4416, 44);
INSERT INTO `s_areas` VALUES (1951, 441622, '龙川县', 4416, 44);
INSERT INTO `s_areas` VALUES (1952, 441623, '连平县', 4416, 44);
INSERT INTO `s_areas` VALUES (1953, 441624, '和平县', 4416, 44);
INSERT INTO `s_areas` VALUES (1954, 441625, '东源县', 4416, 44);
INSERT INTO `s_areas` VALUES (1955, 441702, '江城区', 4417, 44);
INSERT INTO `s_areas` VALUES (1956, 441704, '阳东区', 4417, 44);
INSERT INTO `s_areas` VALUES (1957, 441721, '阳西县', 4417, 44);
INSERT INTO `s_areas` VALUES (1958, 441781, '阳春市', 4417, 44);
INSERT INTO `s_areas` VALUES (1959, 441802, '清城区', 4418, 44);
INSERT INTO `s_areas` VALUES (1960, 441803, '清新区', 4418, 44);
INSERT INTO `s_areas` VALUES (1961, 441821, '佛冈县', 4418, 44);
INSERT INTO `s_areas` VALUES (1962, 441823, '阳山县', 4418, 44);
INSERT INTO `s_areas` VALUES (1963, 441825, '连山壮族瑶族自治县', 4418, 44);
INSERT INTO `s_areas` VALUES (1964, 441826, '连南瑶族自治县', 4418, 44);
INSERT INTO `s_areas` VALUES (1965, 441881, '英德市', 4418, 44);
INSERT INTO `s_areas` VALUES (1966, 441882, '连州市', 4418, 44);
INSERT INTO `s_areas` VALUES (1967, 441900, '东莞市', 4419, 44);
INSERT INTO `s_areas` VALUES (1968, 442000, '中山市', 4420, 44);
INSERT INTO `s_areas` VALUES (1969, 445102, '湘桥区', 4451, 44);
INSERT INTO `s_areas` VALUES (1970, 445103, '潮安区', 4451, 44);
INSERT INTO `s_areas` VALUES (1971, 445122, '饶平县', 4451, 44);
INSERT INTO `s_areas` VALUES (1972, 445202, '榕城区', 4452, 44);
INSERT INTO `s_areas` VALUES (1973, 445203, '揭东区', 4452, 44);
INSERT INTO `s_areas` VALUES (1974, 445222, '揭西县', 4452, 44);
INSERT INTO `s_areas` VALUES (1975, 445224, '惠来县', 4452, 44);
INSERT INTO `s_areas` VALUES (1976, 445281, '普宁市', 4452, 44);
INSERT INTO `s_areas` VALUES (1977, 445302, '云城区', 4453, 44);
INSERT INTO `s_areas` VALUES (1978, 445303, '云安区', 4453, 44);
INSERT INTO `s_areas` VALUES (1979, 445321, '新兴县', 4453, 44);
INSERT INTO `s_areas` VALUES (1980, 445322, '郁南县', 4453, 44);
INSERT INTO `s_areas` VALUES (1981, 445381, '罗定市', 4453, 44);
INSERT INTO `s_areas` VALUES (1982, 450102, '兴宁区', 4501, 45);
INSERT INTO `s_areas` VALUES (1983, 450103, '青秀区', 4501, 45);
INSERT INTO `s_areas` VALUES (1984, 450105, '江南区', 4501, 45);
INSERT INTO `s_areas` VALUES (1985, 450107, '西乡塘区', 4501, 45);
INSERT INTO `s_areas` VALUES (1986, 450108, '良庆区', 4501, 45);
INSERT INTO `s_areas` VALUES (1987, 450109, '邕宁区', 4501, 45);
INSERT INTO `s_areas` VALUES (1988, 450110, '武鸣区', 4501, 45);
INSERT INTO `s_areas` VALUES (1989, 450123, '隆安县', 4501, 45);
INSERT INTO `s_areas` VALUES (1990, 450124, '马山县', 4501, 45);
INSERT INTO `s_areas` VALUES (1991, 450125, '上林县', 4501, 45);
INSERT INTO `s_areas` VALUES (1992, 450126, '宾阳县', 4501, 45);
INSERT INTO `s_areas` VALUES (1993, 450127, '横县', 4501, 45);
INSERT INTO `s_areas` VALUES (1994, 450202, '城中区', 4502, 45);
INSERT INTO `s_areas` VALUES (1995, 450203, '鱼峰区', 4502, 45);
INSERT INTO `s_areas` VALUES (1996, 450204, '柳南区', 4502, 45);
INSERT INTO `s_areas` VALUES (1997, 450205, '柳北区', 4502, 45);
INSERT INTO `s_areas` VALUES (1998, 450206, '柳江区', 4502, 45);
INSERT INTO `s_areas` VALUES (1999, 450222, '柳城县', 4502, 45);
INSERT INTO `s_areas` VALUES (2000, 450223, '鹿寨县', 4502, 45);
INSERT INTO `s_areas` VALUES (2001, 450224, '融安县', 4502, 45);
INSERT INTO `s_areas` VALUES (2002, 450225, '融水苗族自治县', 4502, 45);
INSERT INTO `s_areas` VALUES (2003, 450226, '三江侗族自治县', 4502, 45);
INSERT INTO `s_areas` VALUES (2004, 450302, '秀峰区', 4503, 45);
INSERT INTO `s_areas` VALUES (2005, 450303, '叠彩区', 4503, 45);
INSERT INTO `s_areas` VALUES (2006, 450304, '象山区', 4503, 45);
INSERT INTO `s_areas` VALUES (2007, 450305, '七星区', 4503, 45);
INSERT INTO `s_areas` VALUES (2008, 450311, '雁山区', 4503, 45);
INSERT INTO `s_areas` VALUES (2009, 450312, '临桂区', 4503, 45);
INSERT INTO `s_areas` VALUES (2010, 450321, '阳朔县', 4503, 45);
INSERT INTO `s_areas` VALUES (2011, 450323, '灵川县', 4503, 45);
INSERT INTO `s_areas` VALUES (2012, 450324, '全州县', 4503, 45);
INSERT INTO `s_areas` VALUES (2013, 450325, '兴安县', 4503, 45);
INSERT INTO `s_areas` VALUES (2014, 450326, '永福县', 4503, 45);
INSERT INTO `s_areas` VALUES (2015, 450327, '灌阳县', 4503, 45);
INSERT INTO `s_areas` VALUES (2016, 450328, '龙胜各族自治县', 4503, 45);
INSERT INTO `s_areas` VALUES (2017, 450329, '资源县', 4503, 45);
INSERT INTO `s_areas` VALUES (2018, 450330, '平乐县', 4503, 45);
INSERT INTO `s_areas` VALUES (2019, 450332, '恭城瑶族自治县', 4503, 45);
INSERT INTO `s_areas` VALUES (2020, 450381, '荔浦市', 4503, 45);
INSERT INTO `s_areas` VALUES (2021, 450403, '万秀区', 4504, 45);
INSERT INTO `s_areas` VALUES (2022, 450405, '长洲区', 4504, 45);
INSERT INTO `s_areas` VALUES (2023, 450406, '龙圩区', 4504, 45);
INSERT INTO `s_areas` VALUES (2024, 450421, '苍梧县', 4504, 45);
INSERT INTO `s_areas` VALUES (2025, 450422, '藤县', 4504, 45);
INSERT INTO `s_areas` VALUES (2026, 450423, '蒙山县', 4504, 45);
INSERT INTO `s_areas` VALUES (2027, 450481, '岑溪市', 4504, 45);
INSERT INTO `s_areas` VALUES (2028, 450502, '海城区', 4505, 45);
INSERT INTO `s_areas` VALUES (2029, 450503, '银海区', 4505, 45);
INSERT INTO `s_areas` VALUES (2030, 450512, '铁山港区', 4505, 45);
INSERT INTO `s_areas` VALUES (2031, 450521, '合浦县', 4505, 45);
INSERT INTO `s_areas` VALUES (2032, 450602, '港口区', 4506, 45);
INSERT INTO `s_areas` VALUES (2033, 450603, '防城区', 4506, 45);
INSERT INTO `s_areas` VALUES (2034, 450621, '上思县', 4506, 45);
INSERT INTO `s_areas` VALUES (2035, 450681, '东兴市', 4506, 45);
INSERT INTO `s_areas` VALUES (2036, 450702, '钦南区', 4507, 45);
INSERT INTO `s_areas` VALUES (2037, 450703, '钦北区', 4507, 45);
INSERT INTO `s_areas` VALUES (2038, 450721, '灵山县', 4507, 45);
INSERT INTO `s_areas` VALUES (2039, 450722, '浦北县', 4507, 45);
INSERT INTO `s_areas` VALUES (2040, 450802, '港北区', 4508, 45);
INSERT INTO `s_areas` VALUES (2041, 450803, '港南区', 4508, 45);
INSERT INTO `s_areas` VALUES (2042, 450804, '覃塘区', 4508, 45);
INSERT INTO `s_areas` VALUES (2043, 450821, '平南县', 4508, 45);
INSERT INTO `s_areas` VALUES (2044, 450881, '桂平市', 4508, 45);
INSERT INTO `s_areas` VALUES (2045, 450902, '玉州区', 4509, 45);
INSERT INTO `s_areas` VALUES (2046, 450903, '福绵区', 4509, 45);
INSERT INTO `s_areas` VALUES (2047, 450921, '容县', 4509, 45);
INSERT INTO `s_areas` VALUES (2048, 450922, '陆川县', 4509, 45);
INSERT INTO `s_areas` VALUES (2049, 450923, '博白县', 4509, 45);
INSERT INTO `s_areas` VALUES (2050, 450924, '兴业县', 4509, 45);
INSERT INTO `s_areas` VALUES (2051, 450981, '北流市', 4509, 45);
INSERT INTO `s_areas` VALUES (2052, 451002, '右江区', 4510, 45);
INSERT INTO `s_areas` VALUES (2053, 451021, '田阳县', 4510, 45);
INSERT INTO `s_areas` VALUES (2054, 451022, '田东县', 4510, 45);
INSERT INTO `s_areas` VALUES (2055, 451023, '平果县', 4510, 45);
INSERT INTO `s_areas` VALUES (2056, 451024, '德保县', 4510, 45);
INSERT INTO `s_areas` VALUES (2057, 451026, '那坡县', 4510, 45);
INSERT INTO `s_areas` VALUES (2058, 451027, '凌云县', 4510, 45);
INSERT INTO `s_areas` VALUES (2059, 451028, '乐业县', 4510, 45);
INSERT INTO `s_areas` VALUES (2060, 451029, '田林县', 4510, 45);
INSERT INTO `s_areas` VALUES (2061, 451030, '西林县', 4510, 45);
INSERT INTO `s_areas` VALUES (2062, 451031, '隆林各族自治县', 4510, 45);
INSERT INTO `s_areas` VALUES (2063, 451081, '靖西市', 4510, 45);
INSERT INTO `s_areas` VALUES (2064, 451102, '八步区', 4511, 45);
INSERT INTO `s_areas` VALUES (2065, 451103, '平桂区', 4511, 45);
INSERT INTO `s_areas` VALUES (2066, 451121, '昭平县', 4511, 45);
INSERT INTO `s_areas` VALUES (2067, 451122, '钟山县', 4511, 45);
INSERT INTO `s_areas` VALUES (2068, 451123, '富川瑶族自治县', 4511, 45);
INSERT INTO `s_areas` VALUES (2069, 451202, '金城江区', 4512, 45);
INSERT INTO `s_areas` VALUES (2070, 451203, '宜州区', 4512, 45);
INSERT INTO `s_areas` VALUES (2071, 451221, '南丹县', 4512, 45);
INSERT INTO `s_areas` VALUES (2072, 451222, '天峨县', 4512, 45);
INSERT INTO `s_areas` VALUES (2073, 451223, '凤山县', 4512, 45);
INSERT INTO `s_areas` VALUES (2074, 451224, '东兰县', 4512, 45);
INSERT INTO `s_areas` VALUES (2075, 451225, '罗城仫佬族自治县', 4512, 45);
INSERT INTO `s_areas` VALUES (2076, 451226, '环江毛南族自治县', 4512, 45);
INSERT INTO `s_areas` VALUES (2077, 451227, '巴马瑶族自治县', 4512, 45);
INSERT INTO `s_areas` VALUES (2078, 451228, '都安瑶族自治县', 4512, 45);
INSERT INTO `s_areas` VALUES (2079, 451229, '大化瑶族自治县', 4512, 45);
INSERT INTO `s_areas` VALUES (2080, 451302, '兴宾区', 4513, 45);
INSERT INTO `s_areas` VALUES (2081, 451321, '忻城县', 4513, 45);
INSERT INTO `s_areas` VALUES (2082, 451322, '象州县', 4513, 45);
INSERT INTO `s_areas` VALUES (2083, 451323, '武宣县', 4513, 45);
INSERT INTO `s_areas` VALUES (2084, 451324, '金秀瑶族自治县', 4513, 45);
INSERT INTO `s_areas` VALUES (2085, 451381, '合山市', 4513, 45);
INSERT INTO `s_areas` VALUES (2086, 451402, '江州区', 4514, 45);
INSERT INTO `s_areas` VALUES (2087, 451421, '扶绥县', 4514, 45);
INSERT INTO `s_areas` VALUES (2088, 451422, '宁明县', 4514, 45);
INSERT INTO `s_areas` VALUES (2089, 451423, '龙州县', 4514, 45);
INSERT INTO `s_areas` VALUES (2090, 451424, '大新县', 4514, 45);
INSERT INTO `s_areas` VALUES (2091, 451425, '天等县', 4514, 45);
INSERT INTO `s_areas` VALUES (2092, 451481, '凭祥市', 4514, 45);
INSERT INTO `s_areas` VALUES (2093, 460105, '秀英区', 4601, 46);
INSERT INTO `s_areas` VALUES (2094, 460106, '龙华区', 4601, 46);
INSERT INTO `s_areas` VALUES (2095, 460107, '琼山区', 4601, 46);
INSERT INTO `s_areas` VALUES (2096, 460108, '美兰区', 4601, 46);
INSERT INTO `s_areas` VALUES (2097, 460202, '海棠区', 4602, 46);
INSERT INTO `s_areas` VALUES (2098, 460203, '吉阳区', 4602, 46);
INSERT INTO `s_areas` VALUES (2099, 460204, '天涯区', 4602, 46);
INSERT INTO `s_areas` VALUES (2100, 460205, '崖州区', 4602, 46);
INSERT INTO `s_areas` VALUES (2101, 460321, '西沙群岛', 4603, 46);
INSERT INTO `s_areas` VALUES (2102, 460322, '南沙群岛', 4603, 46);
INSERT INTO `s_areas` VALUES (2103, 460323, '中沙群岛的岛礁及其海域', 4603, 46);
INSERT INTO `s_areas` VALUES (2104, 460400, '儋州市', 4604, 46);
INSERT INTO `s_areas` VALUES (2105, 469001, '五指山市', 4690, 46);
INSERT INTO `s_areas` VALUES (2106, 469002, '琼海市', 4690, 46);
INSERT INTO `s_areas` VALUES (2107, 469005, '文昌市', 4690, 46);
INSERT INTO `s_areas` VALUES (2108, 469006, '万宁市', 4690, 46);
INSERT INTO `s_areas` VALUES (2109, 469007, '东方市', 4690, 46);
INSERT INTO `s_areas` VALUES (2110, 469021, '定安县', 4690, 46);
INSERT INTO `s_areas` VALUES (2111, 469022, '屯昌县', 4690, 46);
INSERT INTO `s_areas` VALUES (2112, 469023, '澄迈县', 4690, 46);
INSERT INTO `s_areas` VALUES (2113, 469024, '临高县', 4690, 46);
INSERT INTO `s_areas` VALUES (2114, 469025, '白沙黎族自治县', 4690, 46);
INSERT INTO `s_areas` VALUES (2115, 469026, '昌江黎族自治县', 4690, 46);
INSERT INTO `s_areas` VALUES (2116, 469027, '乐东黎族自治县', 4690, 46);
INSERT INTO `s_areas` VALUES (2117, 469028, '陵水黎族自治县', 4690, 46);
INSERT INTO `s_areas` VALUES (2118, 469029, '保亭黎族苗族自治县', 4690, 46);
INSERT INTO `s_areas` VALUES (2119, 469030, '琼中黎族苗族自治县', 4690, 46);
INSERT INTO `s_areas` VALUES (2120, 500101, '万州区', 5001, 50);
INSERT INTO `s_areas` VALUES (2121, 500102, '涪陵区', 5001, 50);
INSERT INTO `s_areas` VALUES (2122, 500103, '渝中区', 5001, 50);
INSERT INTO `s_areas` VALUES (2123, 500104, '大渡口区', 5001, 50);
INSERT INTO `s_areas` VALUES (2124, 500105, '江北区', 5001, 50);
INSERT INTO `s_areas` VALUES (2125, 500106, '沙坪坝区', 5001, 50);
INSERT INTO `s_areas` VALUES (2126, 500107, '九龙坡区', 5001, 50);
INSERT INTO `s_areas` VALUES (2127, 500108, '南岸区', 5001, 50);
INSERT INTO `s_areas` VALUES (2128, 500109, '北碚区', 5001, 50);
INSERT INTO `s_areas` VALUES (2129, 500110, '綦江区', 5001, 50);
INSERT INTO `s_areas` VALUES (2130, 500111, '大足区', 5001, 50);
INSERT INTO `s_areas` VALUES (2131, 500112, '渝北区', 5001, 50);
INSERT INTO `s_areas` VALUES (2132, 500113, '巴南区', 5001, 50);
INSERT INTO `s_areas` VALUES (2133, 500114, '黔江区', 5001, 50);
INSERT INTO `s_areas` VALUES (2134, 500115, '长寿区', 5001, 50);
INSERT INTO `s_areas` VALUES (2135, 500116, '江津区', 5001, 50);
INSERT INTO `s_areas` VALUES (2136, 500117, '合川区', 5001, 50);
INSERT INTO `s_areas` VALUES (2137, 500118, '永川区', 5001, 50);
INSERT INTO `s_areas` VALUES (2138, 500119, '南川区', 5001, 50);
INSERT INTO `s_areas` VALUES (2139, 500120, '璧山区', 5001, 50);
INSERT INTO `s_areas` VALUES (2140, 500151, '铜梁区', 5001, 50);
INSERT INTO `s_areas` VALUES (2141, 500152, '潼南区', 5001, 50);
INSERT INTO `s_areas` VALUES (2142, 500153, '荣昌区', 5001, 50);
INSERT INTO `s_areas` VALUES (2143, 500154, '开州区', 5001, 50);
INSERT INTO `s_areas` VALUES (2144, 500155, '梁平区', 5001, 50);
INSERT INTO `s_areas` VALUES (2145, 500156, '武隆区', 5001, 50);
INSERT INTO `s_areas` VALUES (2146, 500229, '城口县', 5002, 50);
INSERT INTO `s_areas` VALUES (2147, 500230, '丰都县', 5002, 50);
INSERT INTO `s_areas` VALUES (2148, 500231, '垫江县', 5002, 50);
INSERT INTO `s_areas` VALUES (2149, 500233, '忠县', 5002, 50);
INSERT INTO `s_areas` VALUES (2150, 500235, '云阳县', 5002, 50);
INSERT INTO `s_areas` VALUES (2151, 500236, '奉节县', 5002, 50);
INSERT INTO `s_areas` VALUES (2152, 500237, '巫山县', 5002, 50);
INSERT INTO `s_areas` VALUES (2153, 500238, '巫溪县', 5002, 50);
INSERT INTO `s_areas` VALUES (2154, 500240, '石柱土家族自治县', 5002, 50);
INSERT INTO `s_areas` VALUES (2155, 500241, '秀山土家族苗族自治县', 5002, 50);
INSERT INTO `s_areas` VALUES (2156, 500242, '酉阳土家族苗族自治县', 5002, 50);
INSERT INTO `s_areas` VALUES (2157, 500243, '彭水苗族土家族自治县', 5002, 50);
INSERT INTO `s_areas` VALUES (2158, 510104, '锦江区', 5101, 51);
INSERT INTO `s_areas` VALUES (2159, 510105, '青羊区', 5101, 51);
INSERT INTO `s_areas` VALUES (2160, 510106, '金牛区', 5101, 51);
INSERT INTO `s_areas` VALUES (2161, 510107, '武侯区', 5101, 51);
INSERT INTO `s_areas` VALUES (2162, 510108, '成华区', 5101, 51);
INSERT INTO `s_areas` VALUES (2163, 510112, '龙泉驿区', 5101, 51);
INSERT INTO `s_areas` VALUES (2164, 510113, '青白江区', 5101, 51);
INSERT INTO `s_areas` VALUES (2165, 510114, '新都区', 5101, 51);
INSERT INTO `s_areas` VALUES (2166, 510115, '温江区', 5101, 51);
INSERT INTO `s_areas` VALUES (2167, 510116, '双流区', 5101, 51);
INSERT INTO `s_areas` VALUES (2168, 510117, '郫都区', 5101, 51);
INSERT INTO `s_areas` VALUES (2169, 510121, '金堂县', 5101, 51);
INSERT INTO `s_areas` VALUES (2170, 510129, '大邑县', 5101, 51);
INSERT INTO `s_areas` VALUES (2171, 510131, '蒲江县', 5101, 51);
INSERT INTO `s_areas` VALUES (2172, 510132, '新津县', 5101, 51);
INSERT INTO `s_areas` VALUES (2173, 510181, '都江堰市', 5101, 51);
INSERT INTO `s_areas` VALUES (2174, 510182, '彭州市', 5101, 51);
INSERT INTO `s_areas` VALUES (2175, 510183, '邛崃市', 5101, 51);
INSERT INTO `s_areas` VALUES (2176, 510184, '崇州市', 5101, 51);
INSERT INTO `s_areas` VALUES (2177, 510185, '简阳市', 5101, 51);
INSERT INTO `s_areas` VALUES (2178, 510302, '自流井区', 5103, 51);
INSERT INTO `s_areas` VALUES (2179, 510303, '贡井区', 5103, 51);
INSERT INTO `s_areas` VALUES (2180, 510304, '大安区', 5103, 51);
INSERT INTO `s_areas` VALUES (2181, 510311, '沿滩区', 5103, 51);
INSERT INTO `s_areas` VALUES (2182, 510321, '荣县', 5103, 51);
INSERT INTO `s_areas` VALUES (2183, 510322, '富顺县', 5103, 51);
INSERT INTO `s_areas` VALUES (2184, 510402, '东区', 5104, 51);
INSERT INTO `s_areas` VALUES (2185, 510403, '西区', 5104, 51);
INSERT INTO `s_areas` VALUES (2186, 510411, '仁和区', 5104, 51);
INSERT INTO `s_areas` VALUES (2187, 510421, '米易县', 5104, 51);
INSERT INTO `s_areas` VALUES (2188, 510422, '盐边县', 5104, 51);
INSERT INTO `s_areas` VALUES (2189, 510502, '江阳区', 5105, 51);
INSERT INTO `s_areas` VALUES (2190, 510503, '纳溪区', 5105, 51);
INSERT INTO `s_areas` VALUES (2191, 510504, '龙马潭区', 5105, 51);
INSERT INTO `s_areas` VALUES (2192, 510521, '泸县', 5105, 51);
INSERT INTO `s_areas` VALUES (2193, 510522, '合江县', 5105, 51);
INSERT INTO `s_areas` VALUES (2194, 510524, '叙永县', 5105, 51);
INSERT INTO `s_areas` VALUES (2195, 510525, '古蔺县', 5105, 51);
INSERT INTO `s_areas` VALUES (2196, 510603, '旌阳区', 5106, 51);
INSERT INTO `s_areas` VALUES (2197, 510604, '罗江区', 5106, 51);
INSERT INTO `s_areas` VALUES (2198, 510623, '中江县', 5106, 51);
INSERT INTO `s_areas` VALUES (2199, 510681, '广汉市', 5106, 51);
INSERT INTO `s_areas` VALUES (2200, 510682, '什邡市', 5106, 51);
INSERT INTO `s_areas` VALUES (2201, 510683, '绵竹市', 5106, 51);
INSERT INTO `s_areas` VALUES (2202, 510703, '涪城区', 5107, 51);
INSERT INTO `s_areas` VALUES (2203, 510704, '游仙区', 5107, 51);
INSERT INTO `s_areas` VALUES (2204, 510705, '安州区', 5107, 51);
INSERT INTO `s_areas` VALUES (2205, 510722, '三台县', 5107, 51);
INSERT INTO `s_areas` VALUES (2206, 510723, '盐亭县', 5107, 51);
INSERT INTO `s_areas` VALUES (2207, 510725, '梓潼县', 5107, 51);
INSERT INTO `s_areas` VALUES (2208, 510726, '北川羌族自治县', 5107, 51);
INSERT INTO `s_areas` VALUES (2209, 510727, '平武县', 5107, 51);
INSERT INTO `s_areas` VALUES (2210, 510781, '江油市', 5107, 51);
INSERT INTO `s_areas` VALUES (2211, 510802, '利州区', 5108, 51);
INSERT INTO `s_areas` VALUES (2212, 510811, '昭化区', 5108, 51);
INSERT INTO `s_areas` VALUES (2213, 510812, '朝天区', 5108, 51);
INSERT INTO `s_areas` VALUES (2214, 510821, '旺苍县', 5108, 51);
INSERT INTO `s_areas` VALUES (2215, 510822, '青川县', 5108, 51);
INSERT INTO `s_areas` VALUES (2216, 510823, '剑阁县', 5108, 51);
INSERT INTO `s_areas` VALUES (2217, 510824, '苍溪县', 5108, 51);
INSERT INTO `s_areas` VALUES (2218, 510903, '船山区', 5109, 51);
INSERT INTO `s_areas` VALUES (2219, 510904, '安居区', 5109, 51);
INSERT INTO `s_areas` VALUES (2220, 510921, '蓬溪县', 5109, 51);
INSERT INTO `s_areas` VALUES (2221, 510922, '射洪县', 5109, 51);
INSERT INTO `s_areas` VALUES (2222, 510923, '大英县', 5109, 51);
INSERT INTO `s_areas` VALUES (2223, 511002, '市中区', 5110, 51);
INSERT INTO `s_areas` VALUES (2224, 511011, '东兴区', 5110, 51);
INSERT INTO `s_areas` VALUES (2225, 511024, '威远县', 5110, 51);
INSERT INTO `s_areas` VALUES (2226, 511025, '资中县', 5110, 51);
INSERT INTO `s_areas` VALUES (2227, 511071, '内江经济开发区', 5110, 51);
INSERT INTO `s_areas` VALUES (2228, 511083, '隆昌市', 5110, 51);
INSERT INTO `s_areas` VALUES (2229, 511102, '市中区', 5111, 51);
INSERT INTO `s_areas` VALUES (2230, 511111, '沙湾区', 5111, 51);
INSERT INTO `s_areas` VALUES (2231, 511112, '五通桥区', 5111, 51);
INSERT INTO `s_areas` VALUES (2232, 511113, '金口河区', 5111, 51);
INSERT INTO `s_areas` VALUES (2233, 511123, '犍为县', 5111, 51);
INSERT INTO `s_areas` VALUES (2234, 511124, '井研县', 5111, 51);
INSERT INTO `s_areas` VALUES (2235, 511126, '夹江县', 5111, 51);
INSERT INTO `s_areas` VALUES (2236, 511129, '沐川县', 5111, 51);
INSERT INTO `s_areas` VALUES (2237, 511132, '峨边彝族自治县', 5111, 51);
INSERT INTO `s_areas` VALUES (2238, 511133, '马边彝族自治县', 5111, 51);
INSERT INTO `s_areas` VALUES (2239, 511181, '峨眉山市', 5111, 51);
INSERT INTO `s_areas` VALUES (2240, 511302, '顺庆区', 5113, 51);
INSERT INTO `s_areas` VALUES (2241, 511303, '高坪区', 5113, 51);
INSERT INTO `s_areas` VALUES (2242, 511304, '嘉陵区', 5113, 51);
INSERT INTO `s_areas` VALUES (2243, 511321, '南部县', 5113, 51);
INSERT INTO `s_areas` VALUES (2244, 511322, '营山县', 5113, 51);
INSERT INTO `s_areas` VALUES (2245, 511323, '蓬安县', 5113, 51);
INSERT INTO `s_areas` VALUES (2246, 511324, '仪陇县', 5113, 51);
INSERT INTO `s_areas` VALUES (2247, 511325, '西充县', 5113, 51);
INSERT INTO `s_areas` VALUES (2248, 511381, '阆中市', 5113, 51);
INSERT INTO `s_areas` VALUES (2249, 511402, '东坡区', 5114, 51);
INSERT INTO `s_areas` VALUES (2250, 511403, '彭山区', 5114, 51);
INSERT INTO `s_areas` VALUES (2251, 511421, '仁寿县', 5114, 51);
INSERT INTO `s_areas` VALUES (2252, 511423, '洪雅县', 5114, 51);
INSERT INTO `s_areas` VALUES (2253, 511424, '丹棱县', 5114, 51);
INSERT INTO `s_areas` VALUES (2254, 511425, '青神县', 5114, 51);
INSERT INTO `s_areas` VALUES (2255, 511502, '翠屏区', 5115, 51);
INSERT INTO `s_areas` VALUES (2256, 511503, '南溪区', 5115, 51);
INSERT INTO `s_areas` VALUES (2257, 511504, '叙州区', 5115, 51);
INSERT INTO `s_areas` VALUES (2258, 511523, '江安县', 5115, 51);
INSERT INTO `s_areas` VALUES (2259, 511524, '长宁县', 5115, 51);
INSERT INTO `s_areas` VALUES (2260, 511525, '高县', 5115, 51);
INSERT INTO `s_areas` VALUES (2261, 511526, '珙县', 5115, 51);
INSERT INTO `s_areas` VALUES (2262, 511527, '筠连县', 5115, 51);
INSERT INTO `s_areas` VALUES (2263, 511528, '兴文县', 5115, 51);
INSERT INTO `s_areas` VALUES (2264, 511529, '屏山县', 5115, 51);
INSERT INTO `s_areas` VALUES (2265, 511602, '广安区', 5116, 51);
INSERT INTO `s_areas` VALUES (2266, 511603, '前锋区', 5116, 51);
INSERT INTO `s_areas` VALUES (2267, 511621, '岳池县', 5116, 51);
INSERT INTO `s_areas` VALUES (2268, 511622, '武胜县', 5116, 51);
INSERT INTO `s_areas` VALUES (2269, 511623, '邻水县', 5116, 51);
INSERT INTO `s_areas` VALUES (2270, 511681, '华蓥市', 5116, 51);
INSERT INTO `s_areas` VALUES (2271, 511702, '通川区', 5117, 51);
INSERT INTO `s_areas` VALUES (2272, 511703, '达川区', 5117, 51);
INSERT INTO `s_areas` VALUES (2273, 511722, '宣汉县', 5117, 51);
INSERT INTO `s_areas` VALUES (2274, 511723, '开江县', 5117, 51);
INSERT INTO `s_areas` VALUES (2275, 511724, '大竹县', 5117, 51);
INSERT INTO `s_areas` VALUES (2276, 511725, '渠县', 5117, 51);
INSERT INTO `s_areas` VALUES (2277, 511771, '达州经济开发区', 5117, 51);
INSERT INTO `s_areas` VALUES (2278, 511781, '万源市', 5117, 51);
INSERT INTO `s_areas` VALUES (2279, 511802, '雨城区', 5118, 51);
INSERT INTO `s_areas` VALUES (2280, 511803, '名山区', 5118, 51);
INSERT INTO `s_areas` VALUES (2281, 511822, '荥经县', 5118, 51);
INSERT INTO `s_areas` VALUES (2282, 511823, '汉源县', 5118, 51);
INSERT INTO `s_areas` VALUES (2283, 511824, '石棉县', 5118, 51);
INSERT INTO `s_areas` VALUES (2284, 511825, '天全县', 5118, 51);
INSERT INTO `s_areas` VALUES (2285, 511826, '芦山县', 5118, 51);
INSERT INTO `s_areas` VALUES (2286, 511827, '宝兴县', 5118, 51);
INSERT INTO `s_areas` VALUES (2287, 511902, '巴州区', 5119, 51);
INSERT INTO `s_areas` VALUES (2288, 511903, '恩阳区', 5119, 51);
INSERT INTO `s_areas` VALUES (2289, 511921, '通江县', 5119, 51);
INSERT INTO `s_areas` VALUES (2290, 511922, '南江县', 5119, 51);
INSERT INTO `s_areas` VALUES (2291, 511923, '平昌县', 5119, 51);
INSERT INTO `s_areas` VALUES (2292, 511971, '巴中经济开发区', 5119, 51);
INSERT INTO `s_areas` VALUES (2293, 512002, '雁江区', 5120, 51);
INSERT INTO `s_areas` VALUES (2294, 512021, '安岳县', 5120, 51);
INSERT INTO `s_areas` VALUES (2295, 512022, '乐至县', 5120, 51);
INSERT INTO `s_areas` VALUES (2296, 513201, '马尔康市', 5132, 51);
INSERT INTO `s_areas` VALUES (2297, 513221, '汶川县', 5132, 51);
INSERT INTO `s_areas` VALUES (2298, 513222, '理县', 5132, 51);
INSERT INTO `s_areas` VALUES (2299, 513223, '茂县', 5132, 51);
INSERT INTO `s_areas` VALUES (2300, 513224, '松潘县', 5132, 51);
INSERT INTO `s_areas` VALUES (2301, 513225, '九寨沟县', 5132, 51);
INSERT INTO `s_areas` VALUES (2302, 513226, '金川县', 5132, 51);
INSERT INTO `s_areas` VALUES (2303, 513227, '小金县', 5132, 51);
INSERT INTO `s_areas` VALUES (2304, 513228, '黑水县', 5132, 51);
INSERT INTO `s_areas` VALUES (2305, 513230, '壤塘县', 5132, 51);
INSERT INTO `s_areas` VALUES (2306, 513231, '阿坝县', 5132, 51);
INSERT INTO `s_areas` VALUES (2307, 513232, '若尔盖县', 5132, 51);
INSERT INTO `s_areas` VALUES (2308, 513233, '红原县', 5132, 51);
INSERT INTO `s_areas` VALUES (2309, 513301, '康定市', 5133, 51);
INSERT INTO `s_areas` VALUES (2310, 513322, '泸定县', 5133, 51);
INSERT INTO `s_areas` VALUES (2311, 513323, '丹巴县', 5133, 51);
INSERT INTO `s_areas` VALUES (2312, 513324, '九龙县', 5133, 51);
INSERT INTO `s_areas` VALUES (2313, 513325, '雅江县', 5133, 51);
INSERT INTO `s_areas` VALUES (2314, 513326, '道孚县', 5133, 51);
INSERT INTO `s_areas` VALUES (2315, 513327, '炉霍县', 5133, 51);
INSERT INTO `s_areas` VALUES (2316, 513328, '甘孜县', 5133, 51);
INSERT INTO `s_areas` VALUES (2317, 513329, '新龙县', 5133, 51);
INSERT INTO `s_areas` VALUES (2318, 513330, '德格县', 5133, 51);
INSERT INTO `s_areas` VALUES (2319, 513331, '白玉县', 5133, 51);
INSERT INTO `s_areas` VALUES (2320, 513332, '石渠县', 5133, 51);
INSERT INTO `s_areas` VALUES (2321, 513333, '色达县', 5133, 51);
INSERT INTO `s_areas` VALUES (2322, 513334, '理塘县', 5133, 51);
INSERT INTO `s_areas` VALUES (2323, 513335, '巴塘县', 5133, 51);
INSERT INTO `s_areas` VALUES (2324, 513336, '乡城县', 5133, 51);
INSERT INTO `s_areas` VALUES (2325, 513337, '稻城县', 5133, 51);
INSERT INTO `s_areas` VALUES (2326, 513338, '得荣县', 5133, 51);
INSERT INTO `s_areas` VALUES (2327, 513401, '西昌市', 5134, 51);
INSERT INTO `s_areas` VALUES (2328, 513422, '木里藏族自治县', 5134, 51);
INSERT INTO `s_areas` VALUES (2329, 513423, '盐源县', 5134, 51);
INSERT INTO `s_areas` VALUES (2330, 513424, '德昌县', 5134, 51);
INSERT INTO `s_areas` VALUES (2331, 513425, '会理县', 5134, 51);
INSERT INTO `s_areas` VALUES (2332, 513426, '会东县', 5134, 51);
INSERT INTO `s_areas` VALUES (2333, 513427, '宁南县', 5134, 51);
INSERT INTO `s_areas` VALUES (2334, 513428, '普格县', 5134, 51);
INSERT INTO `s_areas` VALUES (2335, 513429, '布拖县', 5134, 51);
INSERT INTO `s_areas` VALUES (2336, 513430, '金阳县', 5134, 51);
INSERT INTO `s_areas` VALUES (2337, 513431, '昭觉县', 5134, 51);
INSERT INTO `s_areas` VALUES (2338, 513432, '喜德县', 5134, 51);
INSERT INTO `s_areas` VALUES (2339, 513433, '冕宁县', 5134, 51);
INSERT INTO `s_areas` VALUES (2340, 513434, '越西县', 5134, 51);
INSERT INTO `s_areas` VALUES (2341, 513435, '甘洛县', 5134, 51);
INSERT INTO `s_areas` VALUES (2342, 513436, '美姑县', 5134, 51);
INSERT INTO `s_areas` VALUES (2343, 513437, '雷波县', 5134, 51);
INSERT INTO `s_areas` VALUES (2344, 520102, '南明区', 5201, 52);
INSERT INTO `s_areas` VALUES (2345, 520103, '云岩区', 5201, 52);
INSERT INTO `s_areas` VALUES (2346, 520111, '花溪区', 5201, 52);
INSERT INTO `s_areas` VALUES (2347, 520112, '乌当区', 5201, 52);
INSERT INTO `s_areas` VALUES (2348, 520113, '白云区', 5201, 52);
INSERT INTO `s_areas` VALUES (2349, 520115, '观山湖区', 5201, 52);
INSERT INTO `s_areas` VALUES (2350, 520121, '开阳县', 5201, 52);
INSERT INTO `s_areas` VALUES (2351, 520122, '息烽县', 5201, 52);
INSERT INTO `s_areas` VALUES (2352, 520123, '修文县', 5201, 52);
INSERT INTO `s_areas` VALUES (2353, 520181, '清镇市', 5201, 52);
INSERT INTO `s_areas` VALUES (2354, 520201, '钟山区', 5202, 52);
INSERT INTO `s_areas` VALUES (2355, 520203, '六枝特区', 5202, 52);
INSERT INTO `s_areas` VALUES (2356, 520221, '水城县', 5202, 52);
INSERT INTO `s_areas` VALUES (2357, 520281, '盘州市', 5202, 52);
INSERT INTO `s_areas` VALUES (2358, 520302, '红花岗区', 5203, 52);
INSERT INTO `s_areas` VALUES (2359, 520303, '汇川区', 5203, 52);
INSERT INTO `s_areas` VALUES (2360, 520304, '播州区', 5203, 52);
INSERT INTO `s_areas` VALUES (2361, 520322, '桐梓县', 5203, 52);
INSERT INTO `s_areas` VALUES (2362, 520323, '绥阳县', 5203, 52);
INSERT INTO `s_areas` VALUES (2363, 520324, '正安县', 5203, 52);
INSERT INTO `s_areas` VALUES (2364, 520325, '道真仡佬族苗族自治县', 5203, 52);
INSERT INTO `s_areas` VALUES (2365, 520326, '务川仡佬族苗族自治县', 5203, 52);
INSERT INTO `s_areas` VALUES (2366, 520327, '凤冈县', 5203, 52);
INSERT INTO `s_areas` VALUES (2367, 520328, '湄潭县', 5203, 52);
INSERT INTO `s_areas` VALUES (2368, 520329, '余庆县', 5203, 52);
INSERT INTO `s_areas` VALUES (2369, 520330, '习水县', 5203, 52);
INSERT INTO `s_areas` VALUES (2370, 520381, '赤水市', 5203, 52);
INSERT INTO `s_areas` VALUES (2371, 520382, '仁怀市', 5203, 52);
INSERT INTO `s_areas` VALUES (2372, 520402, '西秀区', 5204, 52);
INSERT INTO `s_areas` VALUES (2373, 520403, '平坝区', 5204, 52);
INSERT INTO `s_areas` VALUES (2374, 520422, '普定县', 5204, 52);
INSERT INTO `s_areas` VALUES (2375, 520423, '镇宁布依族苗族自治县', 5204, 52);
INSERT INTO `s_areas` VALUES (2376, 520424, '关岭布依族苗族自治县', 5204, 52);
INSERT INTO `s_areas` VALUES (2377, 520425, '紫云苗族布依族自治县', 5204, 52);
INSERT INTO `s_areas` VALUES (2378, 520502, '七星关区', 5205, 52);
INSERT INTO `s_areas` VALUES (2379, 520521, '大方县', 5205, 52);
INSERT INTO `s_areas` VALUES (2380, 520522, '黔西县', 5205, 52);
INSERT INTO `s_areas` VALUES (2381, 520523, '金沙县', 5205, 52);
INSERT INTO `s_areas` VALUES (2382, 520524, '织金县', 5205, 52);
INSERT INTO `s_areas` VALUES (2383, 520525, '纳雍县', 5205, 52);
INSERT INTO `s_areas` VALUES (2384, 520526, '威宁彝族回族苗族自治县', 5205, 52);
INSERT INTO `s_areas` VALUES (2385, 520527, '赫章县', 5205, 52);
INSERT INTO `s_areas` VALUES (2386, 520602, '碧江区', 5206, 52);
INSERT INTO `s_areas` VALUES (2387, 520603, '万山区', 5206, 52);
INSERT INTO `s_areas` VALUES (2388, 520621, '江口县', 5206, 52);
INSERT INTO `s_areas` VALUES (2389, 520622, '玉屏侗族自治县', 5206, 52);
INSERT INTO `s_areas` VALUES (2390, 520623, '石阡县', 5206, 52);
INSERT INTO `s_areas` VALUES (2391, 520624, '思南县', 5206, 52);
INSERT INTO `s_areas` VALUES (2392, 520625, '印江土家族苗族自治县', 5206, 52);
INSERT INTO `s_areas` VALUES (2393, 520626, '德江县', 5206, 52);
INSERT INTO `s_areas` VALUES (2394, 520627, '沿河土家族自治县', 5206, 52);
INSERT INTO `s_areas` VALUES (2395, 520628, '松桃苗族自治县', 5206, 52);
INSERT INTO `s_areas` VALUES (2396, 522301, '兴义市', 5223, 52);
INSERT INTO `s_areas` VALUES (2397, 522302, '兴仁市', 5223, 52);
INSERT INTO `s_areas` VALUES (2398, 522323, '普安县', 5223, 52);
INSERT INTO `s_areas` VALUES (2399, 522324, '晴隆县', 5223, 52);
INSERT INTO `s_areas` VALUES (2400, 522325, '贞丰县', 5223, 52);
INSERT INTO `s_areas` VALUES (2401, 522326, '望谟县', 5223, 52);
INSERT INTO `s_areas` VALUES (2402, 522327, '册亨县', 5223, 52);
INSERT INTO `s_areas` VALUES (2403, 522328, '安龙县', 5223, 52);
INSERT INTO `s_areas` VALUES (2404, 522601, '凯里市', 5226, 52);
INSERT INTO `s_areas` VALUES (2405, 522622, '黄平县', 5226, 52);
INSERT INTO `s_areas` VALUES (2406, 522623, '施秉县', 5226, 52);
INSERT INTO `s_areas` VALUES (2407, 522624, '三穗县', 5226, 52);
INSERT INTO `s_areas` VALUES (2408, 522625, '镇远县', 5226, 52);
INSERT INTO `s_areas` VALUES (2409, 522626, '岑巩县', 5226, 52);
INSERT INTO `s_areas` VALUES (2410, 522627, '天柱县', 5226, 52);
INSERT INTO `s_areas` VALUES (2411, 522628, '锦屏县', 5226, 52);
INSERT INTO `s_areas` VALUES (2412, 522629, '剑河县', 5226, 52);
INSERT INTO `s_areas` VALUES (2413, 522630, '台江县', 5226, 52);
INSERT INTO `s_areas` VALUES (2414, 522631, '黎平县', 5226, 52);
INSERT INTO `s_areas` VALUES (2415, 522632, '榕江县', 5226, 52);
INSERT INTO `s_areas` VALUES (2416, 522633, '从江县', 5226, 52);
INSERT INTO `s_areas` VALUES (2417, 522634, '雷山县', 5226, 52);
INSERT INTO `s_areas` VALUES (2418, 522635, '麻江县', 5226, 52);
INSERT INTO `s_areas` VALUES (2419, 522636, '丹寨县', 5226, 52);
INSERT INTO `s_areas` VALUES (2420, 522701, '都匀市', 5227, 52);
INSERT INTO `s_areas` VALUES (2421, 522702, '福泉市', 5227, 52);
INSERT INTO `s_areas` VALUES (2422, 522722, '荔波县', 5227, 52);
INSERT INTO `s_areas` VALUES (2423, 522723, '贵定县', 5227, 52);
INSERT INTO `s_areas` VALUES (2424, 522725, '瓮安县', 5227, 52);
INSERT INTO `s_areas` VALUES (2425, 522726, '独山县', 5227, 52);
INSERT INTO `s_areas` VALUES (2426, 522727, '平塘县', 5227, 52);
INSERT INTO `s_areas` VALUES (2427, 522728, '罗甸县', 5227, 52);
INSERT INTO `s_areas` VALUES (2428, 522729, '长顺县', 5227, 52);
INSERT INTO `s_areas` VALUES (2429, 522730, '龙里县', 5227, 52);
INSERT INTO `s_areas` VALUES (2430, 522731, '惠水县', 5227, 52);
INSERT INTO `s_areas` VALUES (2431, 522732, '三都水族自治县', 5227, 52);
INSERT INTO `s_areas` VALUES (2432, 530102, '五华区', 5301, 53);
INSERT INTO `s_areas` VALUES (2433, 530103, '盘龙区', 5301, 53);
INSERT INTO `s_areas` VALUES (2434, 530111, '官渡区', 5301, 53);
INSERT INTO `s_areas` VALUES (2435, 530112, '西山区', 5301, 53);
INSERT INTO `s_areas` VALUES (2436, 530113, '东川区', 5301, 53);
INSERT INTO `s_areas` VALUES (2437, 530114, '呈贡区', 5301, 53);
INSERT INTO `s_areas` VALUES (2438, 530115, '晋宁区', 5301, 53);
INSERT INTO `s_areas` VALUES (2439, 530124, '富民县', 5301, 53);
INSERT INTO `s_areas` VALUES (2440, 530125, '宜良县', 5301, 53);
INSERT INTO `s_areas` VALUES (2441, 530126, '石林彝族自治县', 5301, 53);
INSERT INTO `s_areas` VALUES (2442, 530127, '嵩明县', 5301, 53);
INSERT INTO `s_areas` VALUES (2443, 530128, '禄劝彝族苗族自治县', 5301, 53);
INSERT INTO `s_areas` VALUES (2444, 530129, '寻甸回族彝族自治县', 5301, 53);
INSERT INTO `s_areas` VALUES (2445, 530181, '安宁市', 5301, 53);
INSERT INTO `s_areas` VALUES (2446, 530302, '麒麟区', 5303, 53);
INSERT INTO `s_areas` VALUES (2447, 530303, '沾益区', 5303, 53);
INSERT INTO `s_areas` VALUES (2448, 530304, '马龙区', 5303, 53);
INSERT INTO `s_areas` VALUES (2449, 530322, '陆良县', 5303, 53);
INSERT INTO `s_areas` VALUES (2450, 530323, '师宗县', 5303, 53);
INSERT INTO `s_areas` VALUES (2451, 530324, '罗平县', 5303, 53);
INSERT INTO `s_areas` VALUES (2452, 530325, '富源县', 5303, 53);
INSERT INTO `s_areas` VALUES (2453, 530326, '会泽县', 5303, 53);
INSERT INTO `s_areas` VALUES (2454, 530381, '宣威市', 5303, 53);
INSERT INTO `s_areas` VALUES (2455, 530402, '红塔区', 5304, 53);
INSERT INTO `s_areas` VALUES (2456, 530403, '江川区', 5304, 53);
INSERT INTO `s_areas` VALUES (2457, 530422, '澄江县', 5304, 53);
INSERT INTO `s_areas` VALUES (2458, 530423, '通海县', 5304, 53);
INSERT INTO `s_areas` VALUES (2459, 530424, '华宁县', 5304, 53);
INSERT INTO `s_areas` VALUES (2460, 530425, '易门县', 5304, 53);
INSERT INTO `s_areas` VALUES (2461, 530426, '峨山彝族自治县', 5304, 53);
INSERT INTO `s_areas` VALUES (2462, 530427, '新平彝族傣族自治县', 5304, 53);
INSERT INTO `s_areas` VALUES (2463, 530428, '元江哈尼族彝族傣族自治县', 5304, 53);
INSERT INTO `s_areas` VALUES (2464, 530502, '隆阳区', 5305, 53);
INSERT INTO `s_areas` VALUES (2465, 530521, '施甸县', 5305, 53);
INSERT INTO `s_areas` VALUES (2466, 530523, '龙陵县', 5305, 53);
INSERT INTO `s_areas` VALUES (2467, 530524, '昌宁县', 5305, 53);
INSERT INTO `s_areas` VALUES (2468, 530581, '腾冲市', 5305, 53);
INSERT INTO `s_areas` VALUES (2469, 530602, '昭阳区', 5306, 53);
INSERT INTO `s_areas` VALUES (2470, 530621, '鲁甸县', 5306, 53);
INSERT INTO `s_areas` VALUES (2471, 530622, '巧家县', 5306, 53);
INSERT INTO `s_areas` VALUES (2472, 530623, '盐津县', 5306, 53);
INSERT INTO `s_areas` VALUES (2473, 530624, '大关县', 5306, 53);
INSERT INTO `s_areas` VALUES (2474, 530625, '永善县', 5306, 53);
INSERT INTO `s_areas` VALUES (2475, 530626, '绥江县', 5306, 53);
INSERT INTO `s_areas` VALUES (2476, 530627, '镇雄县', 5306, 53);
INSERT INTO `s_areas` VALUES (2477, 530628, '彝良县', 5306, 53);
INSERT INTO `s_areas` VALUES (2478, 530629, '威信县', 5306, 53);
INSERT INTO `s_areas` VALUES (2479, 530681, '水富市', 5306, 53);
INSERT INTO `s_areas` VALUES (2480, 530702, '古城区', 5307, 53);
INSERT INTO `s_areas` VALUES (2481, 530721, '玉龙纳西族自治县', 5307, 53);
INSERT INTO `s_areas` VALUES (2482, 530722, '永胜县', 5307, 53);
INSERT INTO `s_areas` VALUES (2483, 530723, '华坪县', 5307, 53);
INSERT INTO `s_areas` VALUES (2484, 530724, '宁蒗彝族自治县', 5307, 53);
INSERT INTO `s_areas` VALUES (2485, 530802, '思茅区', 5308, 53);
INSERT INTO `s_areas` VALUES (2486, 530821, '宁洱哈尼族彝族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2487, 530822, '墨江哈尼族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2488, 530823, '景东彝族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2489, 530824, '景谷傣族彝族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2490, 530825, '镇沅彝族哈尼族拉祜族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2491, 530826, '江城哈尼族彝族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2492, 530827, '孟连傣族拉祜族佤族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2493, 530828, '澜沧拉祜族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2494, 530829, '西盟佤族自治县', 5308, 53);
INSERT INTO `s_areas` VALUES (2495, 530902, '临翔区', 5309, 53);
INSERT INTO `s_areas` VALUES (2496, 530921, '凤庆县', 5309, 53);
INSERT INTO `s_areas` VALUES (2497, 530922, '云县', 5309, 53);
INSERT INTO `s_areas` VALUES (2498, 530923, '永德县', 5309, 53);
INSERT INTO `s_areas` VALUES (2499, 530924, '镇康县', 5309, 53);
INSERT INTO `s_areas` VALUES (2500, 530925, '双江拉祜族佤族布朗族傣族自治县', 5309, 53);
INSERT INTO `s_areas` VALUES (2501, 530926, '耿马傣族佤族自治县', 5309, 53);
INSERT INTO `s_areas` VALUES (2502, 530927, '沧源佤族自治县', 5309, 53);
INSERT INTO `s_areas` VALUES (2503, 532301, '楚雄市', 5323, 53);
INSERT INTO `s_areas` VALUES (2504, 532322, '双柏县', 5323, 53);
INSERT INTO `s_areas` VALUES (2505, 532323, '牟定县', 5323, 53);
INSERT INTO `s_areas` VALUES (2506, 532324, '南华县', 5323, 53);
INSERT INTO `s_areas` VALUES (2507, 532325, '姚安县', 5323, 53);
INSERT INTO `s_areas` VALUES (2508, 532326, '大姚县', 5323, 53);
INSERT INTO `s_areas` VALUES (2509, 532327, '永仁县', 5323, 53);
INSERT INTO `s_areas` VALUES (2510, 532328, '元谋县', 5323, 53);
INSERT INTO `s_areas` VALUES (2511, 532329, '武定县', 5323, 53);
INSERT INTO `s_areas` VALUES (2512, 532331, '禄丰县', 5323, 53);
INSERT INTO `s_areas` VALUES (2513, 532501, '个旧市', 5325, 53);
INSERT INTO `s_areas` VALUES (2514, 532502, '开远市', 5325, 53);
INSERT INTO `s_areas` VALUES (2515, 532503, '蒙自市', 5325, 53);
INSERT INTO `s_areas` VALUES (2516, 532504, '弥勒市', 5325, 53);
INSERT INTO `s_areas` VALUES (2517, 532523, '屏边苗族自治县', 5325, 53);
INSERT INTO `s_areas` VALUES (2518, 532524, '建水县', 5325, 53);
INSERT INTO `s_areas` VALUES (2519, 532525, '石屏县', 5325, 53);
INSERT INTO `s_areas` VALUES (2520, 532527, '泸西县', 5325, 53);
INSERT INTO `s_areas` VALUES (2521, 532528, '元阳县', 5325, 53);
INSERT INTO `s_areas` VALUES (2522, 532529, '红河县', 5325, 53);
INSERT INTO `s_areas` VALUES (2523, 532530, '金平苗族瑶族傣族自治县', 5325, 53);
INSERT INTO `s_areas` VALUES (2524, 532531, '绿春县', 5325, 53);
INSERT INTO `s_areas` VALUES (2525, 532532, '河口瑶族自治县', 5325, 53);
INSERT INTO `s_areas` VALUES (2526, 532601, '文山市', 5326, 53);
INSERT INTO `s_areas` VALUES (2527, 532622, '砚山县', 5326, 53);
INSERT INTO `s_areas` VALUES (2528, 532623, '西畴县', 5326, 53);
INSERT INTO `s_areas` VALUES (2529, 532624, '麻栗坡县', 5326, 53);
INSERT INTO `s_areas` VALUES (2530, 532625, '马关县', 5326, 53);
INSERT INTO `s_areas` VALUES (2531, 532626, '丘北县', 5326, 53);
INSERT INTO `s_areas` VALUES (2532, 532627, '广南县', 5326, 53);
INSERT INTO `s_areas` VALUES (2533, 532628, '富宁县', 5326, 53);
INSERT INTO `s_areas` VALUES (2534, 532801, '景洪市', 5328, 53);
INSERT INTO `s_areas` VALUES (2535, 532822, '勐海县', 5328, 53);
INSERT INTO `s_areas` VALUES (2536, 532823, '勐腊县', 5328, 53);
INSERT INTO `s_areas` VALUES (2537, 532901, '大理市', 5329, 53);
INSERT INTO `s_areas` VALUES (2538, 532922, '漾濞彝族自治县', 5329, 53);
INSERT INTO `s_areas` VALUES (2539, 532923, '祥云县', 5329, 53);
INSERT INTO `s_areas` VALUES (2540, 532924, '宾川县', 5329, 53);
INSERT INTO `s_areas` VALUES (2541, 532925, '弥渡县', 5329, 53);
INSERT INTO `s_areas` VALUES (2542, 532926, '南涧彝族自治县', 5329, 53);
INSERT INTO `s_areas` VALUES (2543, 532927, '巍山彝族回族自治县', 5329, 53);
INSERT INTO `s_areas` VALUES (2544, 532928, '永平县', 5329, 53);
INSERT INTO `s_areas` VALUES (2545, 532929, '云龙县', 5329, 53);
INSERT INTO `s_areas` VALUES (2546, 532930, '洱源县', 5329, 53);
INSERT INTO `s_areas` VALUES (2547, 532931, '剑川县', 5329, 53);
INSERT INTO `s_areas` VALUES (2548, 532932, '鹤庆县', 5329, 53);
INSERT INTO `s_areas` VALUES (2549, 533102, '瑞丽市', 5331, 53);
INSERT INTO `s_areas` VALUES (2550, 533103, '芒市', 5331, 53);
INSERT INTO `s_areas` VALUES (2551, 533122, '梁河县', 5331, 53);
INSERT INTO `s_areas` VALUES (2552, 533123, '盈江县', 5331, 53);
INSERT INTO `s_areas` VALUES (2553, 533124, '陇川县', 5331, 53);
INSERT INTO `s_areas` VALUES (2554, 533301, '泸水市', 5333, 53);
INSERT INTO `s_areas` VALUES (2555, 533323, '福贡县', 5333, 53);
INSERT INTO `s_areas` VALUES (2556, 533324, '贡山独龙族怒族自治县', 5333, 53);
INSERT INTO `s_areas` VALUES (2557, 533325, '兰坪白族普米族自治县', 5333, 53);
INSERT INTO `s_areas` VALUES (2558, 533401, '香格里拉市', 5334, 53);
INSERT INTO `s_areas` VALUES (2559, 533422, '德钦县', 5334, 53);
INSERT INTO `s_areas` VALUES (2560, 533423, '维西傈僳族自治县', 5334, 53);
INSERT INTO `s_areas` VALUES (2561, 540102, '城关区', 5401, 54);
INSERT INTO `s_areas` VALUES (2562, 540103, '堆龙德庆区', 5401, 54);
INSERT INTO `s_areas` VALUES (2563, 540104, '达孜区', 5401, 54);
INSERT INTO `s_areas` VALUES (2564, 540121, '林周县', 5401, 54);
INSERT INTO `s_areas` VALUES (2565, 540122, '当雄县', 5401, 54);
INSERT INTO `s_areas` VALUES (2566, 540123, '尼木县', 5401, 54);
INSERT INTO `s_areas` VALUES (2567, 540124, '曲水县', 5401, 54);
INSERT INTO `s_areas` VALUES (2568, 540127, '墨竹工卡县', 5401, 54);
INSERT INTO `s_areas` VALUES (2569, 540171, '格尔木藏青工业园区', 5401, 54);
INSERT INTO `s_areas` VALUES (2570, 540172, '拉萨经济技术开发区', 5401, 54);
INSERT INTO `s_areas` VALUES (2571, 540173, '西藏文化旅游创意园区', 5401, 54);
INSERT INTO `s_areas` VALUES (2572, 540174, '达孜工业园区', 5401, 54);
INSERT INTO `s_areas` VALUES (2573, 540202, '桑珠孜区', 5402, 54);
INSERT INTO `s_areas` VALUES (2574, 540221, '南木林县', 5402, 54);
INSERT INTO `s_areas` VALUES (2575, 540222, '江孜县', 5402, 54);
INSERT INTO `s_areas` VALUES (2576, 540223, '定日县', 5402, 54);
INSERT INTO `s_areas` VALUES (2577, 540224, '萨迦县', 5402, 54);
INSERT INTO `s_areas` VALUES (2578, 540225, '拉孜县', 5402, 54);
INSERT INTO `s_areas` VALUES (2579, 540226, '昂仁县', 5402, 54);
INSERT INTO `s_areas` VALUES (2580, 540227, '谢通门县', 5402, 54);
INSERT INTO `s_areas` VALUES (2581, 540228, '白朗县', 5402, 54);
INSERT INTO `s_areas` VALUES (2582, 540229, '仁布县', 5402, 54);
INSERT INTO `s_areas` VALUES (2583, 540230, '康马县', 5402, 54);
INSERT INTO `s_areas` VALUES (2584, 540231, '定结县', 5402, 54);
INSERT INTO `s_areas` VALUES (2585, 540232, '仲巴县', 5402, 54);
INSERT INTO `s_areas` VALUES (2586, 540233, '亚东县', 5402, 54);
INSERT INTO `s_areas` VALUES (2587, 540234, '吉隆县', 5402, 54);
INSERT INTO `s_areas` VALUES (2588, 540235, '聂拉木县', 5402, 54);
INSERT INTO `s_areas` VALUES (2589, 540236, '萨嘎县', 5402, 54);
INSERT INTO `s_areas` VALUES (2590, 540237, '岗巴县', 5402, 54);
INSERT INTO `s_areas` VALUES (2591, 540302, '卡若区', 5403, 54);
INSERT INTO `s_areas` VALUES (2592, 540321, '江达县', 5403, 54);
INSERT INTO `s_areas` VALUES (2593, 540322, '贡觉县', 5403, 54);
INSERT INTO `s_areas` VALUES (2594, 540323, '类乌齐县', 5403, 54);
INSERT INTO `s_areas` VALUES (2595, 540324, '丁青县', 5403, 54);
INSERT INTO `s_areas` VALUES (2596, 540325, '察雅县', 5403, 54);
INSERT INTO `s_areas` VALUES (2597, 540326, '八宿县', 5403, 54);
INSERT INTO `s_areas` VALUES (2598, 540327, '左贡县', 5403, 54);
INSERT INTO `s_areas` VALUES (2599, 540328, '芒康县', 5403, 54);
INSERT INTO `s_areas` VALUES (2600, 540329, '洛隆县', 5403, 54);
INSERT INTO `s_areas` VALUES (2601, 540330, '边坝县', 5403, 54);
INSERT INTO `s_areas` VALUES (2602, 540402, '巴宜区', 5404, 54);
INSERT INTO `s_areas` VALUES (2603, 540421, '工布江达县', 5404, 54);
INSERT INTO `s_areas` VALUES (2604, 540422, '米林县', 5404, 54);
INSERT INTO `s_areas` VALUES (2605, 540423, '墨脱县', 5404, 54);
INSERT INTO `s_areas` VALUES (2606, 540424, '波密县', 5404, 54);
INSERT INTO `s_areas` VALUES (2607, 540425, '察隅县', 5404, 54);
INSERT INTO `s_areas` VALUES (2608, 540426, '朗县', 5404, 54);
INSERT INTO `s_areas` VALUES (2609, 540502, '乃东区', 5405, 54);
INSERT INTO `s_areas` VALUES (2610, 540521, '扎囊县', 5405, 54);
INSERT INTO `s_areas` VALUES (2611, 540522, '贡嘎县', 5405, 54);
INSERT INTO `s_areas` VALUES (2612, 540523, '桑日县', 5405, 54);
INSERT INTO `s_areas` VALUES (2613, 540524, '琼结县', 5405, 54);
INSERT INTO `s_areas` VALUES (2614, 540525, '曲松县', 5405, 54);
INSERT INTO `s_areas` VALUES (2615, 540526, '措美县', 5405, 54);
INSERT INTO `s_areas` VALUES (2616, 540527, '洛扎县', 5405, 54);
INSERT INTO `s_areas` VALUES (2617, 540528, '加查县', 5405, 54);
INSERT INTO `s_areas` VALUES (2618, 540529, '隆子县', 5405, 54);
INSERT INTO `s_areas` VALUES (2619, 540530, '错那县', 5405, 54);
INSERT INTO `s_areas` VALUES (2620, 540531, '浪卡子县', 5405, 54);
INSERT INTO `s_areas` VALUES (2621, 540602, '色尼区', 5406, 54);
INSERT INTO `s_areas` VALUES (2622, 540621, '嘉黎县', 5406, 54);
INSERT INTO `s_areas` VALUES (2623, 540622, '比如县', 5406, 54);
INSERT INTO `s_areas` VALUES (2624, 540623, '聂荣县', 5406, 54);
INSERT INTO `s_areas` VALUES (2625, 540624, '安多县', 5406, 54);
INSERT INTO `s_areas` VALUES (2626, 540625, '申扎县', 5406, 54);
INSERT INTO `s_areas` VALUES (2627, 540626, '索县', 5406, 54);
INSERT INTO `s_areas` VALUES (2628, 540627, '班戈县', 5406, 54);
INSERT INTO `s_areas` VALUES (2629, 540628, '巴青县', 5406, 54);
INSERT INTO `s_areas` VALUES (2630, 540629, '尼玛县', 5406, 54);
INSERT INTO `s_areas` VALUES (2631, 540630, '双湖县', 5406, 54);
INSERT INTO `s_areas` VALUES (2632, 542521, '普兰县', 5425, 54);
INSERT INTO `s_areas` VALUES (2633, 542522, '札达县', 5425, 54);
INSERT INTO `s_areas` VALUES (2634, 542523, '噶尔县', 5425, 54);
INSERT INTO `s_areas` VALUES (2635, 542524, '日土县', 5425, 54);
INSERT INTO `s_areas` VALUES (2636, 542525, '革吉县', 5425, 54);
INSERT INTO `s_areas` VALUES (2637, 542526, '改则县', 5425, 54);
INSERT INTO `s_areas` VALUES (2638, 542527, '措勤县', 5425, 54);
INSERT INTO `s_areas` VALUES (2639, 610102, '新城区', 6101, 61);
INSERT INTO `s_areas` VALUES (2640, 610103, '碑林区', 6101, 61);
INSERT INTO `s_areas` VALUES (2641, 610104, '莲湖区', 6101, 61);
INSERT INTO `s_areas` VALUES (2642, 610111, '灞桥区', 6101, 61);
INSERT INTO `s_areas` VALUES (2643, 610112, '未央区', 6101, 61);
INSERT INTO `s_areas` VALUES (2644, 610113, '雁塔区', 6101, 61);
INSERT INTO `s_areas` VALUES (2645, 610114, '阎良区', 6101, 61);
INSERT INTO `s_areas` VALUES (2646, 610115, '临潼区', 6101, 61);
INSERT INTO `s_areas` VALUES (2647, 610116, '长安区', 6101, 61);
INSERT INTO `s_areas` VALUES (2648, 610117, '高陵区', 6101, 61);
INSERT INTO `s_areas` VALUES (2649, 610118, '鄠邑区', 6101, 61);
INSERT INTO `s_areas` VALUES (2650, 610122, '蓝田县', 6101, 61);
INSERT INTO `s_areas` VALUES (2651, 610124, '周至县', 6101, 61);
INSERT INTO `s_areas` VALUES (2652, 610202, '王益区', 6102, 61);
INSERT INTO `s_areas` VALUES (2653, 610203, '印台区', 6102, 61);
INSERT INTO `s_areas` VALUES (2654, 610204, '耀州区', 6102, 61);
INSERT INTO `s_areas` VALUES (2655, 610222, '宜君县', 6102, 61);
INSERT INTO `s_areas` VALUES (2656, 610302, '渭滨区', 6103, 61);
INSERT INTO `s_areas` VALUES (2657, 610303, '金台区', 6103, 61);
INSERT INTO `s_areas` VALUES (2658, 610304, '陈仓区', 6103, 61);
INSERT INTO `s_areas` VALUES (2659, 610322, '凤翔县', 6103, 61);
INSERT INTO `s_areas` VALUES (2660, 610323, '岐山县', 6103, 61);
INSERT INTO `s_areas` VALUES (2661, 610324, '扶风县', 6103, 61);
INSERT INTO `s_areas` VALUES (2662, 610326, '眉县', 6103, 61);
INSERT INTO `s_areas` VALUES (2663, 610327, '陇县', 6103, 61);
INSERT INTO `s_areas` VALUES (2664, 610328, '千阳县', 6103, 61);
INSERT INTO `s_areas` VALUES (2665, 610329, '麟游县', 6103, 61);
INSERT INTO `s_areas` VALUES (2666, 610330, '凤县', 6103, 61);
INSERT INTO `s_areas` VALUES (2667, 610331, '太白县', 6103, 61);
INSERT INTO `s_areas` VALUES (2668, 610402, '秦都区', 6104, 61);
INSERT INTO `s_areas` VALUES (2669, 610403, '杨陵区', 6104, 61);
INSERT INTO `s_areas` VALUES (2670, 610404, '渭城区', 6104, 61);
INSERT INTO `s_areas` VALUES (2671, 610422, '三原县', 6104, 61);
INSERT INTO `s_areas` VALUES (2672, 610423, '泾阳县', 6104, 61);
INSERT INTO `s_areas` VALUES (2673, 610424, '乾县', 6104, 61);
INSERT INTO `s_areas` VALUES (2674, 610425, '礼泉县', 6104, 61);
INSERT INTO `s_areas` VALUES (2675, 610426, '永寿县', 6104, 61);
INSERT INTO `s_areas` VALUES (2676, 610428, '长武县', 6104, 61);
INSERT INTO `s_areas` VALUES (2677, 610429, '旬邑县', 6104, 61);
INSERT INTO `s_areas` VALUES (2678, 610430, '淳化县', 6104, 61);
INSERT INTO `s_areas` VALUES (2679, 610431, '武功县', 6104, 61);
INSERT INTO `s_areas` VALUES (2680, 610481, '兴平市', 6104, 61);
INSERT INTO `s_areas` VALUES (2681, 610482, '彬州市', 6104, 61);
INSERT INTO `s_areas` VALUES (2682, 610502, '临渭区', 6105, 61);
INSERT INTO `s_areas` VALUES (2683, 610503, '华州区', 6105, 61);
INSERT INTO `s_areas` VALUES (2684, 610522, '潼关县', 6105, 61);
INSERT INTO `s_areas` VALUES (2685, 610523, '大荔县', 6105, 61);
INSERT INTO `s_areas` VALUES (2686, 610524, '合阳县', 6105, 61);
INSERT INTO `s_areas` VALUES (2687, 610525, '澄城县', 6105, 61);
INSERT INTO `s_areas` VALUES (2688, 610526, '蒲城县', 6105, 61);
INSERT INTO `s_areas` VALUES (2689, 610527, '白水县', 6105, 61);
INSERT INTO `s_areas` VALUES (2690, 610528, '富平县', 6105, 61);
INSERT INTO `s_areas` VALUES (2691, 610581, '韩城市', 6105, 61);
INSERT INTO `s_areas` VALUES (2692, 610582, '华阴市', 6105, 61);
INSERT INTO `s_areas` VALUES (2693, 610602, '宝塔区', 6106, 61);
INSERT INTO `s_areas` VALUES (2694, 610603, '安塞区', 6106, 61);
INSERT INTO `s_areas` VALUES (2695, 610621, '延长县', 6106, 61);
INSERT INTO `s_areas` VALUES (2696, 610622, '延川县', 6106, 61);
INSERT INTO `s_areas` VALUES (2697, 610623, '子长县', 6106, 61);
INSERT INTO `s_areas` VALUES (2698, 610625, '志丹县', 6106, 61);
INSERT INTO `s_areas` VALUES (2699, 610626, '吴起县', 6106, 61);
INSERT INTO `s_areas` VALUES (2700, 610627, '甘泉县', 6106, 61);
INSERT INTO `s_areas` VALUES (2701, 610628, '富县', 6106, 61);
INSERT INTO `s_areas` VALUES (2702, 610629, '洛川县', 6106, 61);
INSERT INTO `s_areas` VALUES (2703, 610630, '宜川县', 6106, 61);
INSERT INTO `s_areas` VALUES (2704, 610631, '黄龙县', 6106, 61);
INSERT INTO `s_areas` VALUES (2705, 610632, '黄陵县', 6106, 61);
INSERT INTO `s_areas` VALUES (2706, 610702, '汉台区', 6107, 61);
INSERT INTO `s_areas` VALUES (2707, 610703, '南郑区', 6107, 61);
INSERT INTO `s_areas` VALUES (2708, 610722, '城固县', 6107, 61);
INSERT INTO `s_areas` VALUES (2709, 610723, '洋县', 6107, 61);
INSERT INTO `s_areas` VALUES (2710, 610724, '西乡县', 6107, 61);
INSERT INTO `s_areas` VALUES (2711, 610725, '勉县', 6107, 61);
INSERT INTO `s_areas` VALUES (2712, 610726, '宁强县', 6107, 61);
INSERT INTO `s_areas` VALUES (2713, 610727, '略阳县', 6107, 61);
INSERT INTO `s_areas` VALUES (2714, 610728, '镇巴县', 6107, 61);
INSERT INTO `s_areas` VALUES (2715, 610729, '留坝县', 6107, 61);
INSERT INTO `s_areas` VALUES (2716, 610730, '佛坪县', 6107, 61);
INSERT INTO `s_areas` VALUES (2717, 610802, '榆阳区', 6108, 61);
INSERT INTO `s_areas` VALUES (2718, 610803, '横山区', 6108, 61);
INSERT INTO `s_areas` VALUES (2719, 610822, '府谷县', 6108, 61);
INSERT INTO `s_areas` VALUES (2720, 610824, '靖边县', 6108, 61);
INSERT INTO `s_areas` VALUES (2721, 610825, '定边县', 6108, 61);
INSERT INTO `s_areas` VALUES (2722, 610826, '绥德县', 6108, 61);
INSERT INTO `s_areas` VALUES (2723, 610827, '米脂县', 6108, 61);
INSERT INTO `s_areas` VALUES (2724, 610828, '佳县', 6108, 61);
INSERT INTO `s_areas` VALUES (2725, 610829, '吴堡县', 6108, 61);
INSERT INTO `s_areas` VALUES (2726, 610830, '清涧县', 6108, 61);
INSERT INTO `s_areas` VALUES (2727, 610831, '子洲县', 6108, 61);
INSERT INTO `s_areas` VALUES (2728, 610881, '神木市', 6108, 61);
INSERT INTO `s_areas` VALUES (2729, 610902, '汉滨区', 6109, 61);
INSERT INTO `s_areas` VALUES (2730, 610921, '汉阴县', 6109, 61);
INSERT INTO `s_areas` VALUES (2731, 610922, '石泉县', 6109, 61);
INSERT INTO `s_areas` VALUES (2732, 610923, '宁陕县', 6109, 61);
INSERT INTO `s_areas` VALUES (2733, 610924, '紫阳县', 6109, 61);
INSERT INTO `s_areas` VALUES (2734, 610925, '岚皋县', 6109, 61);
INSERT INTO `s_areas` VALUES (2735, 610926, '平利县', 6109, 61);
INSERT INTO `s_areas` VALUES (2736, 610927, '镇坪县', 6109, 61);
INSERT INTO `s_areas` VALUES (2737, 610928, '旬阳县', 6109, 61);
INSERT INTO `s_areas` VALUES (2738, 610929, '白河县', 6109, 61);
INSERT INTO `s_areas` VALUES (2739, 611002, '商州区', 6110, 61);
INSERT INTO `s_areas` VALUES (2740, 611021, '洛南县', 6110, 61);
INSERT INTO `s_areas` VALUES (2741, 611022, '丹凤县', 6110, 61);
INSERT INTO `s_areas` VALUES (2742, 611023, '商南县', 6110, 61);
INSERT INTO `s_areas` VALUES (2743, 611024, '山阳县', 6110, 61);
INSERT INTO `s_areas` VALUES (2744, 611025, '镇安县', 6110, 61);
INSERT INTO `s_areas` VALUES (2745, 611026, '柞水县', 6110, 61);
INSERT INTO `s_areas` VALUES (2746, 620102, '城关区', 6201, 62);
INSERT INTO `s_areas` VALUES (2747, 620103, '七里河区', 6201, 62);
INSERT INTO `s_areas` VALUES (2748, 620104, '西固区', 6201, 62);
INSERT INTO `s_areas` VALUES (2749, 620105, '安宁区', 6201, 62);
INSERT INTO `s_areas` VALUES (2750, 620111, '红古区', 6201, 62);
INSERT INTO `s_areas` VALUES (2751, 620121, '永登县', 6201, 62);
INSERT INTO `s_areas` VALUES (2752, 620122, '皋兰县', 6201, 62);
INSERT INTO `s_areas` VALUES (2753, 620123, '榆中县', 6201, 62);
INSERT INTO `s_areas` VALUES (2754, 620171, '兰州新区', 6201, 62);
INSERT INTO `s_areas` VALUES (2755, 620201, '嘉峪关市', 6202, 62);
INSERT INTO `s_areas` VALUES (2756, 620302, '金川区', 6203, 62);
INSERT INTO `s_areas` VALUES (2757, 620321, '永昌县', 6203, 62);
INSERT INTO `s_areas` VALUES (2758, 620402, '白银区', 6204, 62);
INSERT INTO `s_areas` VALUES (2759, 620403, '平川区', 6204, 62);
INSERT INTO `s_areas` VALUES (2760, 620421, '靖远县', 6204, 62);
INSERT INTO `s_areas` VALUES (2761, 620422, '会宁县', 6204, 62);
INSERT INTO `s_areas` VALUES (2762, 620423, '景泰县', 6204, 62);
INSERT INTO `s_areas` VALUES (2763, 620502, '秦州区', 6205, 62);
INSERT INTO `s_areas` VALUES (2764, 620503, '麦积区', 6205, 62);
INSERT INTO `s_areas` VALUES (2765, 620521, '清水县', 6205, 62);
INSERT INTO `s_areas` VALUES (2766, 620522, '秦安县', 6205, 62);
INSERT INTO `s_areas` VALUES (2767, 620523, '甘谷县', 6205, 62);
INSERT INTO `s_areas` VALUES (2768, 620524, '武山县', 6205, 62);
INSERT INTO `s_areas` VALUES (2769, 620525, '张家川回族自治县', 6205, 62);
INSERT INTO `s_areas` VALUES (2770, 620602, '凉州区', 6206, 62);
INSERT INTO `s_areas` VALUES (2771, 620621, '民勤县', 6206, 62);
INSERT INTO `s_areas` VALUES (2772, 620622, '古浪县', 6206, 62);
INSERT INTO `s_areas` VALUES (2773, 620623, '天祝藏族自治县', 6206, 62);
INSERT INTO `s_areas` VALUES (2774, 620702, '甘州区', 6207, 62);
INSERT INTO `s_areas` VALUES (2775, 620721, '肃南裕固族自治县', 6207, 62);
INSERT INTO `s_areas` VALUES (2776, 620722, '民乐县', 6207, 62);
INSERT INTO `s_areas` VALUES (2777, 620723, '临泽县', 6207, 62);
INSERT INTO `s_areas` VALUES (2778, 620724, '高台县', 6207, 62);
INSERT INTO `s_areas` VALUES (2779, 620725, '山丹县', 6207, 62);
INSERT INTO `s_areas` VALUES (2780, 620802, '崆峒区', 6208, 62);
INSERT INTO `s_areas` VALUES (2781, 620821, '泾川县', 6208, 62);
INSERT INTO `s_areas` VALUES (2782, 620822, '灵台县', 6208, 62);
INSERT INTO `s_areas` VALUES (2783, 620823, '崇信县', 6208, 62);
INSERT INTO `s_areas` VALUES (2784, 620825, '庄浪县', 6208, 62);
INSERT INTO `s_areas` VALUES (2785, 620826, '静宁县', 6208, 62);
INSERT INTO `s_areas` VALUES (2786, 620881, '华亭市', 6208, 62);
INSERT INTO `s_areas` VALUES (2787, 620902, '肃州区', 6209, 62);
INSERT INTO `s_areas` VALUES (2788, 620921, '金塔县', 6209, 62);
INSERT INTO `s_areas` VALUES (2789, 620922, '瓜州县', 6209, 62);
INSERT INTO `s_areas` VALUES (2790, 620923, '肃北蒙古族自治县', 6209, 62);
INSERT INTO `s_areas` VALUES (2791, 620924, '阿克塞哈萨克族自治县', 6209, 62);
INSERT INTO `s_areas` VALUES (2792, 620981, '玉门市', 6209, 62);
INSERT INTO `s_areas` VALUES (2793, 620982, '敦煌市', 6209, 62);
INSERT INTO `s_areas` VALUES (2794, 621002, '西峰区', 6210, 62);
INSERT INTO `s_areas` VALUES (2795, 621021, '庆城县', 6210, 62);
INSERT INTO `s_areas` VALUES (2796, 621022, '环县', 6210, 62);
INSERT INTO `s_areas` VALUES (2797, 621023, '华池县', 6210, 62);
INSERT INTO `s_areas` VALUES (2798, 621024, '合水县', 6210, 62);
INSERT INTO `s_areas` VALUES (2799, 621025, '正宁县', 6210, 62);
INSERT INTO `s_areas` VALUES (2800, 621026, '宁县', 6210, 62);
INSERT INTO `s_areas` VALUES (2801, 621027, '镇原县', 6210, 62);
INSERT INTO `s_areas` VALUES (2802, 621102, '安定区', 6211, 62);
INSERT INTO `s_areas` VALUES (2803, 621121, '通渭县', 6211, 62);
INSERT INTO `s_areas` VALUES (2804, 621122, '陇西县', 6211, 62);
INSERT INTO `s_areas` VALUES (2805, 621123, '渭源县', 6211, 62);
INSERT INTO `s_areas` VALUES (2806, 621124, '临洮县', 6211, 62);
INSERT INTO `s_areas` VALUES (2807, 621125, '漳县', 6211, 62);
INSERT INTO `s_areas` VALUES (2808, 621126, '岷县', 6211, 62);
INSERT INTO `s_areas` VALUES (2809, 621202, '武都区', 6212, 62);
INSERT INTO `s_areas` VALUES (2810, 621221, '成县', 6212, 62);
INSERT INTO `s_areas` VALUES (2811, 621222, '文县', 6212, 62);
INSERT INTO `s_areas` VALUES (2812, 621223, '宕昌县', 6212, 62);
INSERT INTO `s_areas` VALUES (2813, 621224, '康县', 6212, 62);
INSERT INTO `s_areas` VALUES (2814, 621225, '西和县', 6212, 62);
INSERT INTO `s_areas` VALUES (2815, 621226, '礼县', 6212, 62);
INSERT INTO `s_areas` VALUES (2816, 621227, '徽县', 6212, 62);
INSERT INTO `s_areas` VALUES (2817, 621228, '两当县', 6212, 62);
INSERT INTO `s_areas` VALUES (2818, 622901, '临夏市', 6229, 62);
INSERT INTO `s_areas` VALUES (2819, 622921, '临夏县', 6229, 62);
INSERT INTO `s_areas` VALUES (2820, 622922, '康乐县', 6229, 62);
INSERT INTO `s_areas` VALUES (2821, 622923, '永靖县', 6229, 62);
INSERT INTO `s_areas` VALUES (2822, 622924, '广河县', 6229, 62);
INSERT INTO `s_areas` VALUES (2823, 622925, '和政县', 6229, 62);
INSERT INTO `s_areas` VALUES (2824, 622926, '东乡族自治县', 6229, 62);
INSERT INTO `s_areas` VALUES (2825, 622927, '积石山保安族东乡族撒拉族自治县', 6229, 62);
INSERT INTO `s_areas` VALUES (2826, 623001, '合作市', 6230, 62);
INSERT INTO `s_areas` VALUES (2827, 623021, '临潭县', 6230, 62);
INSERT INTO `s_areas` VALUES (2828, 623022, '卓尼县', 6230, 62);
INSERT INTO `s_areas` VALUES (2829, 623023, '舟曲县', 6230, 62);
INSERT INTO `s_areas` VALUES (2830, 623024, '迭部县', 6230, 62);
INSERT INTO `s_areas` VALUES (2831, 623025, '玛曲县', 6230, 62);
INSERT INTO `s_areas` VALUES (2832, 623026, '碌曲县', 6230, 62);
INSERT INTO `s_areas` VALUES (2833, 623027, '夏河县', 6230, 62);
INSERT INTO `s_areas` VALUES (2834, 630102, '城东区', 6301, 63);
INSERT INTO `s_areas` VALUES (2835, 630103, '城中区', 6301, 63);
INSERT INTO `s_areas` VALUES (2836, 630104, '城西区', 6301, 63);
INSERT INTO `s_areas` VALUES (2837, 630105, '城北区', 6301, 63);
INSERT INTO `s_areas` VALUES (2838, 630121, '大通回族土族自治县', 6301, 63);
INSERT INTO `s_areas` VALUES (2839, 630122, '湟中县', 6301, 63);
INSERT INTO `s_areas` VALUES (2840, 630123, '湟源县', 6301, 63);
INSERT INTO `s_areas` VALUES (2841, 630202, '乐都区', 6302, 63);
INSERT INTO `s_areas` VALUES (2842, 630203, '平安区', 6302, 63);
INSERT INTO `s_areas` VALUES (2843, 630222, '民和回族土族自治县', 6302, 63);
INSERT INTO `s_areas` VALUES (2844, 630223, '互助土族自治县', 6302, 63);
INSERT INTO `s_areas` VALUES (2845, 630224, '化隆回族自治县', 6302, 63);
INSERT INTO `s_areas` VALUES (2846, 630225, '循化撒拉族自治县', 6302, 63);
INSERT INTO `s_areas` VALUES (2847, 632221, '门源回族自治县', 6322, 63);
INSERT INTO `s_areas` VALUES (2848, 632222, '祁连县', 6322, 63);
INSERT INTO `s_areas` VALUES (2849, 632223, '海晏县', 6322, 63);
INSERT INTO `s_areas` VALUES (2850, 632224, '刚察县', 6322, 63);
INSERT INTO `s_areas` VALUES (2851, 632321, '同仁县', 6323, 63);
INSERT INTO `s_areas` VALUES (2852, 632322, '尖扎县', 6323, 63);
INSERT INTO `s_areas` VALUES (2853, 632323, '泽库县', 6323, 63);
INSERT INTO `s_areas` VALUES (2854, 632324, '河南蒙古族自治县', 6323, 63);
INSERT INTO `s_areas` VALUES (2855, 632521, '共和县', 6325, 63);
INSERT INTO `s_areas` VALUES (2856, 632522, '同德县', 6325, 63);
INSERT INTO `s_areas` VALUES (2857, 632523, '贵德县', 6325, 63);
INSERT INTO `s_areas` VALUES (2858, 632524, '兴海县', 6325, 63);
INSERT INTO `s_areas` VALUES (2859, 632525, '贵南县', 6325, 63);
INSERT INTO `s_areas` VALUES (2860, 632621, '玛沁县', 6326, 63);
INSERT INTO `s_areas` VALUES (2861, 632622, '班玛县', 6326, 63);
INSERT INTO `s_areas` VALUES (2862, 632623, '甘德县', 6326, 63);
INSERT INTO `s_areas` VALUES (2863, 632624, '达日县', 6326, 63);
INSERT INTO `s_areas` VALUES (2864, 632625, '久治县', 6326, 63);
INSERT INTO `s_areas` VALUES (2865, 632626, '玛多县', 6326, 63);
INSERT INTO `s_areas` VALUES (2866, 632701, '玉树市', 6327, 63);
INSERT INTO `s_areas` VALUES (2867, 632722, '杂多县', 6327, 63);
INSERT INTO `s_areas` VALUES (2868, 632723, '称多县', 6327, 63);
INSERT INTO `s_areas` VALUES (2869, 632724, '治多县', 6327, 63);
INSERT INTO `s_areas` VALUES (2870, 632725, '囊谦县', 6327, 63);
INSERT INTO `s_areas` VALUES (2871, 632726, '曲麻莱县', 6327, 63);
INSERT INTO `s_areas` VALUES (2872, 632801, '格尔木市', 6328, 63);
INSERT INTO `s_areas` VALUES (2873, 632802, '德令哈市', 6328, 63);
INSERT INTO `s_areas` VALUES (2874, 632803, '茫崖市', 6328, 63);
INSERT INTO `s_areas` VALUES (2875, 632821, '乌兰县', 6328, 63);
INSERT INTO `s_areas` VALUES (2876, 632822, '都兰县', 6328, 63);
INSERT INTO `s_areas` VALUES (2877, 632823, '天峻县', 6328, 63);
INSERT INTO `s_areas` VALUES (2878, 632857, '大柴旦行政委员会', 6328, 63);
INSERT INTO `s_areas` VALUES (2879, 640104, '兴庆区', 6401, 64);
INSERT INTO `s_areas` VALUES (2880, 640105, '西夏区', 6401, 64);
INSERT INTO `s_areas` VALUES (2881, 640106, '金凤区', 6401, 64);
INSERT INTO `s_areas` VALUES (2882, 640121, '永宁县', 6401, 64);
INSERT INTO `s_areas` VALUES (2883, 640122, '贺兰县', 6401, 64);
INSERT INTO `s_areas` VALUES (2884, 640181, '灵武市', 6401, 64);
INSERT INTO `s_areas` VALUES (2885, 640202, '大武口区', 6402, 64);
INSERT INTO `s_areas` VALUES (2886, 640205, '惠农区', 6402, 64);
INSERT INTO `s_areas` VALUES (2887, 640221, '平罗县', 6402, 64);
INSERT INTO `s_areas` VALUES (2888, 640302, '利通区', 6403, 64);
INSERT INTO `s_areas` VALUES (2889, 640303, '红寺堡区', 6403, 64);
INSERT INTO `s_areas` VALUES (2890, 640323, '盐池县', 6403, 64);
INSERT INTO `s_areas` VALUES (2891, 640324, '同心县', 6403, 64);
INSERT INTO `s_areas` VALUES (2892, 640381, '青铜峡市', 6403, 64);
INSERT INTO `s_areas` VALUES (2893, 640402, '原州区', 6404, 64);
INSERT INTO `s_areas` VALUES (2894, 640422, '西吉县', 6404, 64);
INSERT INTO `s_areas` VALUES (2895, 640423, '隆德县', 6404, 64);
INSERT INTO `s_areas` VALUES (2896, 640424, '泾源县', 6404, 64);
INSERT INTO `s_areas` VALUES (2897, 640425, '彭阳县', 6404, 64);
INSERT INTO `s_areas` VALUES (2898, 640502, '沙坡头区', 6405, 64);
INSERT INTO `s_areas` VALUES (2899, 640521, '中宁县', 6405, 64);
INSERT INTO `s_areas` VALUES (2900, 640522, '海原县', 6405, 64);
INSERT INTO `s_areas` VALUES (2901, 650102, '天山区', 6501, 65);
INSERT INTO `s_areas` VALUES (2902, 650103, '沙依巴克区', 6501, 65);
INSERT INTO `s_areas` VALUES (2903, 650104, '新市区', 6501, 65);
INSERT INTO `s_areas` VALUES (2904, 650105, '水磨沟区', 6501, 65);
INSERT INTO `s_areas` VALUES (2905, 650106, '头屯河区', 6501, 65);
INSERT INTO `s_areas` VALUES (2906, 650107, '达坂城区', 6501, 65);
INSERT INTO `s_areas` VALUES (2907, 650109, '米东区', 6501, 65);
INSERT INTO `s_areas` VALUES (2908, 650121, '乌鲁木齐县', 6501, 65);
INSERT INTO `s_areas` VALUES (2909, 650171, '乌鲁木齐经济技术开发区', 6501, 65);
INSERT INTO `s_areas` VALUES (2910, 650172, '乌鲁木齐高新技术产业开发区', 6501, 65);
INSERT INTO `s_areas` VALUES (2911, 650202, '独山子区', 6502, 65);
INSERT INTO `s_areas` VALUES (2912, 650203, '克拉玛依区', 6502, 65);
INSERT INTO `s_areas` VALUES (2913, 650204, '白碱滩区', 6502, 65);
INSERT INTO `s_areas` VALUES (2914, 650205, '乌尔禾区', 6502, 65);
INSERT INTO `s_areas` VALUES (2915, 650402, '高昌区', 6504, 65);
INSERT INTO `s_areas` VALUES (2916, 650421, '鄯善县', 6504, 65);
INSERT INTO `s_areas` VALUES (2917, 650422, '托克逊县', 6504, 65);
INSERT INTO `s_areas` VALUES (2918, 650502, '伊州区', 6505, 65);
INSERT INTO `s_areas` VALUES (2919, 650521, '巴里坤哈萨克自治县', 6505, 65);
INSERT INTO `s_areas` VALUES (2920, 650522, '伊吾县', 6505, 65);
INSERT INTO `s_areas` VALUES (2921, 652301, '昌吉市', 6523, 65);
INSERT INTO `s_areas` VALUES (2922, 652302, '阜康市', 6523, 65);
INSERT INTO `s_areas` VALUES (2923, 652323, '呼图壁县', 6523, 65);
INSERT INTO `s_areas` VALUES (2924, 652324, '玛纳斯县', 6523, 65);
INSERT INTO `s_areas` VALUES (2925, 652325, '奇台县', 6523, 65);
INSERT INTO `s_areas` VALUES (2926, 652327, '吉木萨尔县', 6523, 65);
INSERT INTO `s_areas` VALUES (2927, 652328, '木垒哈萨克自治县', 6523, 65);
INSERT INTO `s_areas` VALUES (2928, 652701, '博乐市', 6527, 65);
INSERT INTO `s_areas` VALUES (2929, 652702, '阿拉山口市', 6527, 65);
INSERT INTO `s_areas` VALUES (2930, 652722, '精河县', 6527, 65);
INSERT INTO `s_areas` VALUES (2931, 652723, '温泉县', 6527, 65);
INSERT INTO `s_areas` VALUES (2932, 652801, '库尔勒市', 6528, 65);
INSERT INTO `s_areas` VALUES (2933, 652822, '轮台县', 6528, 65);
INSERT INTO `s_areas` VALUES (2934, 652823, '尉犁县', 6528, 65);
INSERT INTO `s_areas` VALUES (2935, 652824, '若羌县', 6528, 65);
INSERT INTO `s_areas` VALUES (2936, 652825, '且末县', 6528, 65);
INSERT INTO `s_areas` VALUES (2937, 652826, '焉耆回族自治县', 6528, 65);
INSERT INTO `s_areas` VALUES (2938, 652827, '和静县', 6528, 65);
INSERT INTO `s_areas` VALUES (2939, 652828, '和硕县', 6528, 65);
INSERT INTO `s_areas` VALUES (2940, 652829, '博湖县', 6528, 65);
INSERT INTO `s_areas` VALUES (2941, 652871, '库尔勒经济技术开发区', 6528, 65);
INSERT INTO `s_areas` VALUES (2942, 652901, '阿克苏市', 6529, 65);
INSERT INTO `s_areas` VALUES (2943, 652922, '温宿县', 6529, 65);
INSERT INTO `s_areas` VALUES (2944, 652923, '库车县', 6529, 65);
INSERT INTO `s_areas` VALUES (2945, 652924, '沙雅县', 6529, 65);
INSERT INTO `s_areas` VALUES (2946, 652925, '新和县', 6529, 65);
INSERT INTO `s_areas` VALUES (2947, 652926, '拜城县', 6529, 65);
INSERT INTO `s_areas` VALUES (2948, 652927, '乌什县', 6529, 65);
INSERT INTO `s_areas` VALUES (2949, 652928, '阿瓦提县', 6529, 65);
INSERT INTO `s_areas` VALUES (2950, 652929, '柯坪县', 6529, 65);
INSERT INTO `s_areas` VALUES (2951, 653001, '阿图什市', 6530, 65);
INSERT INTO `s_areas` VALUES (2952, 653022, '阿克陶县', 6530, 65);
INSERT INTO `s_areas` VALUES (2953, 653023, '阿合奇县', 6530, 65);
INSERT INTO `s_areas` VALUES (2954, 653024, '乌恰县', 6530, 65);
INSERT INTO `s_areas` VALUES (2955, 653101, '喀什市', 6531, 65);
INSERT INTO `s_areas` VALUES (2956, 653121, '疏附县', 6531, 65);
INSERT INTO `s_areas` VALUES (2957, 653122, '疏勒县', 6531, 65);
INSERT INTO `s_areas` VALUES (2958, 653123, '英吉沙县', 6531, 65);
INSERT INTO `s_areas` VALUES (2959, 653124, '泽普县', 6531, 65);
INSERT INTO `s_areas` VALUES (2960, 653125, '莎车县', 6531, 65);
INSERT INTO `s_areas` VALUES (2961, 653126, '叶城县', 6531, 65);
INSERT INTO `s_areas` VALUES (2962, 653127, '麦盖提县', 6531, 65);
INSERT INTO `s_areas` VALUES (2963, 653128, '岳普湖县', 6531, 65);
INSERT INTO `s_areas` VALUES (2964, 653129, '伽师县', 6531, 65);
INSERT INTO `s_areas` VALUES (2965, 653130, '巴楚县', 6531, 65);
INSERT INTO `s_areas` VALUES (2966, 653131, '塔什库尔干塔吉克自治县', 6531, 65);
INSERT INTO `s_areas` VALUES (2967, 653201, '和田市', 6532, 65);
INSERT INTO `s_areas` VALUES (2968, 653221, '和田县', 6532, 65);
INSERT INTO `s_areas` VALUES (2969, 653222, '墨玉县', 6532, 65);
INSERT INTO `s_areas` VALUES (2970, 653223, '皮山县', 6532, 65);
INSERT INTO `s_areas` VALUES (2971, 653224, '洛浦县', 6532, 65);
INSERT INTO `s_areas` VALUES (2972, 653225, '策勒县', 6532, 65);
INSERT INTO `s_areas` VALUES (2973, 653226, '于田县', 6532, 65);
INSERT INTO `s_areas` VALUES (2974, 653227, '民丰县', 6532, 65);
INSERT INTO `s_areas` VALUES (2975, 654002, '伊宁市', 6540, 65);
INSERT INTO `s_areas` VALUES (2976, 654003, '奎屯市', 6540, 65);
INSERT INTO `s_areas` VALUES (2977, 654004, '霍尔果斯市', 6540, 65);
INSERT INTO `s_areas` VALUES (2978, 654021, '伊宁县', 6540, 65);
INSERT INTO `s_areas` VALUES (2979, 654022, '察布查尔锡伯自治县', 6540, 65);
INSERT INTO `s_areas` VALUES (2980, 654023, '霍城县', 6540, 65);
INSERT INTO `s_areas` VALUES (2981, 654024, '巩留县', 6540, 65);
INSERT INTO `s_areas` VALUES (2982, 654025, '新源县', 6540, 65);
INSERT INTO `s_areas` VALUES (2983, 654026, '昭苏县', 6540, 65);
INSERT INTO `s_areas` VALUES (2984, 654027, '特克斯县', 6540, 65);
INSERT INTO `s_areas` VALUES (2985, 654028, '尼勒克县', 6540, 65);
INSERT INTO `s_areas` VALUES (2986, 654201, '塔城市', 6542, 65);
INSERT INTO `s_areas` VALUES (2987, 654202, '乌苏市', 6542, 65);
INSERT INTO `s_areas` VALUES (2988, 654221, '额敏县', 6542, 65);
INSERT INTO `s_areas` VALUES (2989, 654223, '沙湾县', 6542, 65);
INSERT INTO `s_areas` VALUES (2990, 654224, '托里县', 6542, 65);
INSERT INTO `s_areas` VALUES (2991, 654225, '裕民县', 6542, 65);
INSERT INTO `s_areas` VALUES (2992, 654226, '和布克赛尔蒙古自治县', 6542, 65);
INSERT INTO `s_areas` VALUES (2993, 654301, '阿勒泰市', 6543, 65);
INSERT INTO `s_areas` VALUES (2994, 654321, '布尔津县', 6543, 65);
INSERT INTO `s_areas` VALUES (2995, 654322, '富蕴县', 6543, 65);
INSERT INTO `s_areas` VALUES (2996, 654323, '福海县', 6543, 65);
INSERT INTO `s_areas` VALUES (2997, 654324, '哈巴河县', 6543, 65);
INSERT INTO `s_areas` VALUES (2998, 654325, '青河县', 6543, 65);
INSERT INTO `s_areas` VALUES (2999, 654326, '吉木乃县', 6543, 65);
INSERT INTO `s_areas` VALUES (3000, 659001, '石河子市', 6590, 65);
INSERT INTO `s_areas` VALUES (3001, 659002, '阿拉尔市', 6590, 65);
INSERT INTO `s_areas` VALUES (3002, 659003, '图木舒克市', 6590, 65);
INSERT INTO `s_areas` VALUES (3003, 659004, '五家渠市', 6590, 65);
INSERT INTO `s_areas` VALUES (3004, 659006, '铁门关市', 6590, 65);

-- ----------------------------
-- Table structure for s_config
-- ----------------------------
DROP TABLE IF EXISTS `s_config`;
CREATE TABLE `s_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '参数键名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '参数键值',
  `isenable` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用(1:true-未启用,0:false-已启用)\n\n',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户名称',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT NULL COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_config
-- ----------------------------
INSERT INTO `s_config` VALUES (6, '1', '1', '1', 0, '1', NULL, NULL, 1, '2019-09-30 01:16:50', 1, '2019-09-30 01:16:50', 0);
INSERT INTO `s_config` VALUES (7, '12', '12', '12', 0, NULL, NULL, NULL, 1, '2019-09-30 01:17:02', 1, '2019-09-30 01:17:02', 0);
INSERT INTO `s_config` VALUES (8, '123', '123', '123', 0, '', NULL, NULL, 1, '2019-09-30 01:17:12', 1, '2019-09-30 01:17:12', 0);

-- ----------------------------
-- Table structure for s_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `s_dict_data`;
CREATE TABLE `s_dict_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字典编码',
  `dict_type_id` bigint(20) NULL DEFAULT NULL COMMENT '字典类型表id主键',
  `sort` tinyint(4) NULL DEFAULT NULL COMMENT '字典排序',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字典键值',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_dict_data
-- ----------------------------
INSERT INTO `s_dict_data` VALUES (1, NULL, 1, 0, '未删除', '0', '', 0, 1, '2019-09-03 01:56:58', 1, '2019-09-26 07:51:27', 60);
INSERT INTO `s_dict_data` VALUES (2, NULL, 1, 1, '已删除', '1', '1', 0, 1, '2019-09-02 18:13:52', 1, '2019-09-26 07:51:27', 61);
INSERT INTO `s_dict_data` VALUES (5, NULL, 1, 2, '全部', 'null', '', 0, 1, '2019-09-03 07:53:30', 1, '2019-09-26 07:51:28', 60);
INSERT INTO `s_dict_data` VALUES (6, NULL, 2, 0, '目录', 'c', '', 0, 1, '2019-10-31 11:31:13', 1, '2019-10-31 11:31:13', 0);
INSERT INTO `s_dict_data` VALUES (7, NULL, 2, 1, '菜单', 'm', '', 0, 1, '2019-10-31 11:31:38', 1, '2019-10-31 11:31:38', 0);
INSERT INTO `s_dict_data` VALUES (8, NULL, 2, 2, '页面', 'p', '', 0, 1, '2019-10-31 11:31:50', 1, '2019-10-31 11:31:50', 0);
INSERT INTO `s_dict_data` VALUES (9, NULL, 3, 0, '显示', '0', '', 0, 1, '2019-11-01 11:45:56', 1, '2019-11-04 09:25:11', 2);
INSERT INTO `s_dict_data` VALUES (10, NULL, 3, 1, '隐藏', '1', '', 0, 1, '2019-11-01 11:46:14', 1, '2019-11-04 09:25:11', 2);
INSERT INTO `s_dict_data` VALUES (11, NULL, 3, 2, '全部', 'null', '', 0, 1, '2019-11-01 11:46:30', 1, '2019-11-04 09:25:11', 2);
INSERT INTO `s_dict_data` VALUES (12, NULL, 4, 0, '国有全资', '1', '', 0, 1, '2019-11-05 11:00:28', 1, '2019-11-05 11:00:28', 0);
INSERT INTO `s_dict_data` VALUES (13, NULL, 4, 1, '集体全资', '2', '', 0, 1, '2019-11-05 11:00:39', 1, '2019-11-05 11:00:39', 0);
INSERT INTO `s_dict_data` VALUES (14, NULL, 4, 2, '股份合作', '3', '', 0, 1, '2019-11-05 11:00:47', 1, '2019-11-05 11:00:47', 0);
INSERT INTO `s_dict_data` VALUES (15, NULL, 4, 3, '联营', '4', '', 0, 1, '2019-11-05 11:00:56', 1, '2019-11-05 11:00:56', 0);
INSERT INTO `s_dict_data` VALUES (16, NULL, 4, 4, '国有联营', '5', '', 0, 1, '2019-11-05 11:01:02', 1, '2019-11-05 11:01:02', 0);
INSERT INTO `s_dict_data` VALUES (17, NULL, 4, 5, '集体联营', '6', '', 0, 1, '2019-11-05 11:01:10', 1, '2019-11-05 11:01:10', 0);
INSERT INTO `s_dict_data` VALUES (18, NULL, 4, 6, '国有与集体联营', '7', '', 0, 1, '2019-11-05 11:01:17', 1, '2019-11-05 11:01:17', 0);
INSERT INTO `s_dict_data` VALUES (19, NULL, 4, 7, '其它联营', '8', '', 0, 1, '2019-11-05 11:01:25', 1, '2019-11-05 11:01:25', 0);
INSERT INTO `s_dict_data` VALUES (20, NULL, 4, 8, '有限责任（公司）', '9', '', 0, 1, '2019-11-05 11:01:34', 1, '2019-11-05 11:01:34', 0);
INSERT INTO `s_dict_data` VALUES (21, NULL, 4, 9, '国有独资（公司）', '10', '', 0, 1, '2019-11-05 11:01:44', 1, '2019-11-05 11:01:44', 0);
INSERT INTO `s_dict_data` VALUES (22, NULL, 4, 10, '其它有限责任（公司）', '11', '', 0, 1, '2019-11-05 11:01:52', 1, '2019-11-05 11:01:52', 0);
INSERT INTO `s_dict_data` VALUES (23, NULL, 4, 11, '股份有限（公司）', '12', '', 0, 1, '2019-11-05 11:02:01', 1, '2019-11-05 11:02:01', 0);
INSERT INTO `s_dict_data` VALUES (24, NULL, 4, 12, '私有', '13', '', 0, 1, '2019-11-05 11:02:09', 1, '2019-11-05 11:02:09', 0);
INSERT INTO `s_dict_data` VALUES (25, NULL, 4, 13, '私有独资', '14', '', 0, 1, '2019-11-05 11:02:16', 1, '2019-11-05 11:02:16', 0);
INSERT INTO `s_dict_data` VALUES (26, NULL, 4, 14, '私有合伙', '15', '', 0, 1, '2019-11-05 11:02:23', 1, '2019-11-05 11:02:23', 0);
INSERT INTO `s_dict_data` VALUES (27, NULL, 4, 15, '私营有限责任（公司）', '16', '', 0, 1, '2019-11-05 11:02:33', 1, '2019-11-05 11:02:33', 0);
INSERT INTO `s_dict_data` VALUES (28, NULL, 4, 16, '个体经营', '17', '', 0, 1, '2019-11-05 11:02:40', 1, '2019-11-05 11:02:40', 0);
INSERT INTO `s_dict_data` VALUES (29, NULL, 4, 17, '私营股份有限（公司）', '18', '', 0, 1, '2019-11-05 11:02:49', 1, '2019-11-05 11:02:49', 0);
INSERT INTO `s_dict_data` VALUES (32, NULL, 4, 18, '内地与港、澳、台合作', '19', '', 0, 1, '2019-11-05 11:04:30', 1, '2019-11-05 11:04:30', 0);
INSERT INTO `s_dict_data` VALUES (33, NULL, 4, 19, '内地与港、澳、台合资', '20', '', 0, 1, '2019-11-05 11:04:38', 1, '2019-11-05 11:04:38', 0);
INSERT INTO `s_dict_data` VALUES (34, NULL, 4, 20, '港、澳、台投资', '21', '', 0, 1, '2019-11-05 11:04:46', 1, '2019-11-05 11:04:46', 0);
INSERT INTO `s_dict_data` VALUES (35, NULL, 4, 21, '港、澳、台独资', '22', '', 0, 1, '2019-11-05 11:04:55', 1, '2019-11-05 11:04:55', 0);
INSERT INTO `s_dict_data` VALUES (36, NULL, 4, 22, '港、澳、台投资股份有限（公司）', '23', '', 0, 1, '2019-11-05 11:05:03', 1, '2019-11-05 11:05:03', 0);
INSERT INTO `s_dict_data` VALUES (37, NULL, 4, 23, '其他港、澳、台投资', '24', '', 0, 1, '2019-11-05 11:05:12', 1, '2019-11-05 11:05:12', 0);
INSERT INTO `s_dict_data` VALUES (38, NULL, 4, 24, '外资', '25', '', 0, 1, '2019-11-05 11:05:21', 1, '2019-11-05 11:05:21', 0);
INSERT INTO `s_dict_data` VALUES (39, NULL, 4, 25, '国外投资股份有限（公司）', '26', '', 0, 1, '2019-11-05 11:05:28', 1, '2019-11-05 11:05:28', 0);
INSERT INTO `s_dict_data` VALUES (40, NULL, 4, 26, '其他国外投资', '27', '', 0, 1, '2019-11-05 11:05:38', 1, '2019-11-05 11:05:38', 0);
INSERT INTO `s_dict_data` VALUES (41, NULL, 4, 27, '其他', '28', '', 0, 1, '2019-11-05 11:05:45', 1, '2019-11-05 11:05:45', 0);
INSERT INTO `s_dict_data` VALUES (42, NULL, 5, 0, '表：地址簿', 'm_company', '', 0, 1, '2019-11-05 11:41:06', 1, '2019-11-05 11:41:06', 0);
INSERT INTO `s_dict_data` VALUES (43, NULL, 6, 0, '公司', '0', '', 0, 1, '2019-11-06 11:48:53', 1, '2019-11-06 11:48:53', 0);
INSERT INTO `s_dict_data` VALUES (44, NULL, 6, 1, '家庭', '1', '', 0, 1, '2019-11-06 11:49:01', 1, '2019-11-06 11:49:01', 0);

-- ----------------------------
-- Table structure for s_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `s_dict_type`;
CREATE TABLE `s_dict_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字典名称',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '字典编号：唯一',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_UNIQUE`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '字典类型表、字典主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_dict_type
-- ----------------------------
INSERT INTO `s_dict_type` VALUES (1, '删除类型', 'sys_delete_type', '删除类型', 0, 1, '2019-09-11 01:12:39', 1, '2019-09-11 09:12:58', 1);
INSERT INTO `s_dict_type` VALUES (2, '模块类型', 'sys_module_type', 'm目录 c菜单 p页面', 0, 1, '2019-10-31 11:30:47', 1, '2019-11-06 11:14:42', 1);
INSERT INTO `s_dict_type` VALUES (3, '隐藏显示类型', 'sys_visible_type', '隐藏显示类型： 0：显示 1：隐藏 null:全部', 0, 1, '2019-11-01 11:33:09', 1, '2019-11-01 11:33:09', 0);
INSERT INTO `s_dict_type` VALUES (4, '企业类型', 'sys_company_type', '企业类型', 0, 1, '2019-11-05 10:57:51', 1, '2019-11-05 10:58:00', 1);
INSERT INTO `s_dict_type` VALUES (5, '关联表类型', 'sys_serial_type', '关联表类型', 0, 1, '2019-11-05 11:40:08', 1, '2019-11-05 11:40:17', 1);
INSERT INTO `s_dict_type` VALUES (6, '地址簿标签', 'sys_address_tag_type', '地址簿标签', 0, 1, '2019-11-06 11:14:20', 1, '2019-11-06 11:14:20', 0);

-- ----------------------------
-- Table structure for s_job
-- ----------------------------
DROP TABLE IF EXISTS `s_job`;
CREATE TABLE `s_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '定时任务调度表',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组编号',
  `job_group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务组名',
  `job_serial_id` bigint(20) NULL DEFAULT NULL COMMENT '关联编号',
  `job_serial_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '关联表名字',
  `job_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务描述',
  `job_simple_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '任务简称',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'Bean名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表达式',
  `concurrent` tinyint(1) NULL DEFAULT NULL COMMENT '是否并发执行（0允许 1禁止）',
  `is_cron` tinyint(1) NULL DEFAULT NULL COMMENT '判断是否是cron表达式，还是simpletrigger',
  `misfire_policy` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否是已经删除\n',
  `is_effected` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效',
  `begin_date` datetime(0) NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '执行结束时间',
  `run_time` datetime(0) NULL DEFAULT NULL COMMENT '下次运行时间',
  `next_run_time` datetime(0) NULL DEFAULT NULL COMMENT '下次运行时间',
  `last_run_time` datetime(0) NULL DEFAULT NULL COMMENT '上次运行时间',
  `run_times` int(11) NULL DEFAULT NULL COMMENT '运行次数',
  `msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '执行情况',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_job
-- ----------------------------
INSERT INTO `s_job` VALUES (10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":110,\"descr\":\"aq\",\"disable_time\":\"2019-10-28T15:26:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:25:09\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, NULL, '2019-10-28 15:26:04', 12, '租户定时任务：启用租户任务——执行成功', NULL, '2019-10-21 08:54:40', NULL, '2019-10-28 15:26:04');
INSERT INTO `s_job` VALUES (11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":110,\"descr\":\"aq\",\"disable_time\":\"2019-10-28T15:26:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:25:09\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, NULL, '2019-10-28 15:25:10', 13, '租户定时任务：启用租户任务——执行成功', NULL, '2019-10-20 08:58:38', NULL, '2019-10-28 15:25:10');

-- ----------------------------
-- Table structure for s_job_log
-- ----------------------------
DROP TABLE IF EXISTS `s_job_log`;
CREATE TABLE `s_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '定时任务调度表',
  `job_id` bigint(20) NULL DEFAULT NULL COMMENT '任务主键',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组编号',
  `job_group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `job_serial_id` bigint(20) NULL DEFAULT NULL COMMENT '关联编号',
  `job_serial_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联表名字',
  `job_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `job_simple_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务简称',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Bean名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表达式',
  `concurrent` tinyint(1) NULL DEFAULT NULL COMMENT '是否并发执行（0允许 1禁止）',
  `is_cron` tinyint(1) NULL DEFAULT NULL COMMENT '判断是否是cron表达式，还是simpletrigger',
  `misfire_policy` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否是已经删除\n',
  `is_effected` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效',
  `begin_date` datetime(0) NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '执行结束时间',
  `run_time` datetime(0) NULL DEFAULT NULL COMMENT '下次运行时间',
  `next_run_time` datetime(0) NULL DEFAULT NULL COMMENT '下次运行时间',
  `last_run_time` datetime(0) NULL DEFAULT NULL COMMENT '上次运行时间',
  `run_times` int(11) NULL DEFAULT NULL COMMENT '运行次数',
  `msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行情况',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_job_log
-- ----------------------------
INSERT INTO `s_job_log` VALUES (1, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":67,\"descr\":\"811qqaa\",\"disable_time\":\"2020-10-27T14:29:57\",\"enable_time\":\"2019-10-28T14:29:57\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:44:18\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 14:29:57', NULL, NULL, NULL, NULL, '2019-10-28 14:44:32', NULL, '2019-10-28 14:44:32');
INSERT INTO `s_job_log` VALUES (2, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":68,\"descr\":\"811qqaa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:47:21\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:47:38', NULL, '2019-10-28 14:47:38');
INSERT INTO `s_job_log` VALUES (3, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":68,\"descr\":\"811qqaa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:47:21\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:47:42', NULL, '2019-10-28 14:47:42');
INSERT INTO `s_job_log` VALUES (4, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":69,\"descr\":\"811qqaa2\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:50:25\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:50:35', NULL, '2019-10-28 14:50:35');
INSERT INTO `s_job_log` VALUES (5, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":69,\"descr\":\"811qqaa2\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:50:25\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:50:39', NULL, '2019-10-28 14:50:39');
INSERT INTO `s_job_log` VALUES (6, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":70,\"descr\":\"811qqaa2w\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:51:01\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:51:04', NULL, '2019-10-28 14:51:04');
INSERT INTO `s_job_log` VALUES (7, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":70,\"descr\":\"811qqaa2w\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:51:01\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:51:21', NULL, '2019-10-28 14:51:21');
INSERT INTO `s_job_log` VALUES (8, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":71,\"descr\":\"811qqaa2ws\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:51:36\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:52:29', NULL, '2019-10-28 14:52:29');
INSERT INTO `s_job_log` VALUES (9, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":71,\"descr\":\"811qqaa2ws\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:51:36\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:52:30', NULL, '2019-10-28 14:52:30');
INSERT INTO `s_job_log` VALUES (10, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":72,\"descr\":\"811qqaa2wsq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:54:47\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:55:14', NULL, '2019-10-28 14:55:14');
INSERT INTO `s_job_log` VALUES (11, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":72,\"descr\":\"811qqaa2wsq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:54:47\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:55:14', NULL, '2019-10-28 14:55:14');
INSERT INTO `s_job_log` VALUES (12, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":73,\"descr\":\"811qqaa2wsqs\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:57:02\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:57:14', NULL, '2019-10-28 14:57:14');
INSERT INTO `s_job_log` VALUES (13, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":73,\"descr\":\"811qqaa2wsqs\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T14:57:02\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 14:57:14', NULL, '2019-10-28 14:57:14');
INSERT INTO `s_job_log` VALUES (14, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":74,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:01:48\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:01:53', NULL, '2019-10-28 15:01:53');
INSERT INTO `s_job_log` VALUES (15, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":74,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:01:48\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:01:53', NULL, '2019-10-28 15:01:53');
INSERT INTO `s_job_log` VALUES (16, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":75,\"descr\":\"aa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:02:08\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:02:14', NULL, '2019-10-28 15:02:14');
INSERT INTO `s_job_log` VALUES (17, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":75,\"descr\":\"aa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:02:08\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:02:18', NULL, '2019-10-28 15:02:18');
INSERT INTO `s_job_log` VALUES (18, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":76,\"descr\":\"aaa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:02:30\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:02:52', NULL, '2019-10-28 15:02:52');
INSERT INTO `s_job_log` VALUES (19, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":76,\"descr\":\"aaa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:02:30\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:03:00', NULL, '2019-10-28 15:03:00');
INSERT INTO `s_job_log` VALUES (20, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":77,\"descr\":\"aaaa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:03:11\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:03:16', NULL, '2019-10-28 15:03:16');
INSERT INTO `s_job_log` VALUES (21, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":77,\"descr\":\"aaaa\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:03:11\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:08:11', NULL, '2019-10-28 15:08:11');
INSERT INTO `s_job_log` VALUES (22, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":78,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:09:52\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:10:00', NULL, '2019-10-28 15:10:00');
INSERT INTO `s_job_log` VALUES (23, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":78,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:09:52\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:10:03', NULL, '2019-10-28 15:10:03');
INSERT INTO `s_job_log` VALUES (24, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":79,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:09:59\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:10:37', NULL, '2019-10-28 15:10:37');
INSERT INTO `s_job_log` VALUES (25, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":79,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:09:59\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:09:59', 0, NULL, NULL, '2019-10-28 15:10:57', NULL, '2019-10-28 15:10:57');
INSERT INTO `s_job_log` VALUES (26, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":80,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:10:37\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:10:30', 1, NULL, NULL, '2019-10-28 15:11:30', NULL, '2019-10-28 15:11:30');
INSERT INTO `s_job_log` VALUES (27, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":80,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:10:37\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:11:39', NULL, '2019-10-28 15:11:39');
INSERT INTO `s_job_log` VALUES (28, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":81,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:11:28\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:11:51', NULL, '2019-10-28 15:11:51');
INSERT INTO `s_job_log` VALUES (29, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":81,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:11:28\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:11:28', 2, NULL, NULL, '2019-10-28 15:11:58', NULL, '2019-10-28 15:11:58');
INSERT INTO `s_job_log` VALUES (30, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":82,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:11:55\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:11:55', 3, NULL, NULL, '2019-10-28 15:12:54', NULL, '2019-10-28 15:12:54');
INSERT INTO `s_job_log` VALUES (31, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":82,\"descr\":\"a\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:11:55\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:13:34', NULL, '2019-10-28 15:13:34');
INSERT INTO `s_job_log` VALUES (32, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":84,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:05\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', NULL, NULL, NULL, NULL, '2019-10-28 15:15:13', NULL, '2019-10-28 15:15:13');
INSERT INTO `s_job_log` VALUES (33, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":84,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:05\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:12:50', 4, NULL, NULL, '2019-10-28 15:15:13', NULL, '2019-10-28 15:15:13');
INSERT INTO `s_job_log` VALUES (34, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":86,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:12\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:15:11', 5, NULL, NULL, '2019-10-28 15:15:32', NULL, '2019-10-28 15:15:32');
INSERT INTO `s_job_log` VALUES (35, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":86,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:12\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:15:12', 0, NULL, NULL, '2019-10-28 15:15:34', NULL, '2019-10-28 15:15:34');
INSERT INTO `s_job_log` VALUES (36, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":88,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:34\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:15:34', 1, NULL, NULL, '2019-10-28 15:15:49', NULL, '2019-10-28 15:15:49');
INSERT INTO `s_job_log` VALUES (37, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":88,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:34\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:15:32', 6, NULL, NULL, '2019-10-28 15:15:51', NULL, '2019-10-28 15:15:51');
INSERT INTO `s_job_log` VALUES (38, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":90,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:51\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:15:49', 2, NULL, NULL, '2019-10-28 15:16:55', NULL, '2019-10-28 15:16:55');
INSERT INTO `s_job_log` VALUES (39, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":90,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:15:51\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:15:51', 7, NULL, NULL, '2019-10-28 15:16:55', NULL, '2019-10-28 15:16:55');
INSERT INTO `s_job_log` VALUES (40, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":92,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:16:55\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:16:55', 3, NULL, NULL, '2019-10-28 15:17:22', NULL, '2019-10-28 15:17:22');
INSERT INTO `s_job_log` VALUES (41, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":92,\"descr\":\"aq\",\"disable_time\":\"2019-10-22T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:16:55\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-22 00:00:00', '2019-10-28 15:16:55', 8, NULL, NULL, '2019-10-28 15:17:22', NULL, '2019-10-28 15:17:22');
INSERT INTO `s_job_log` VALUES (42, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":95,\"descr\":\"aq\",\"disable_time\":\"2020-10-27T15:18:01\",\"enable_time\":\"2019-10-28T15:18:01\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:18:05\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:18:01', '2019-10-28 15:17:22', 4, NULL, NULL, '2019-10-28 15:18:09', NULL, '2019-10-28 15:18:09');
INSERT INTO `s_job_log` VALUES (43, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":97,\"descr\":\"aq\",\"disable_time\":\"2020-10-27T15:18:38\",\"enable_time\":\"2019-10-28T15:18:38\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:18:40\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:18:38', '2019-10-28 15:18:09', 5, NULL, NULL, '2019-10-28 15:18:41', NULL, '2019-10-28 15:18:41');
INSERT INTO `s_job_log` VALUES (44, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":98,\"descr\":\"aq\",\"disable_time\":\"2020-10-27T15:18:38\",\"enable_time\":\"2019-10-28T15:18:38\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:18:41\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:18:38', '2019-10-28 15:18:41', 6, NULL, NULL, '2019-10-28 15:19:39', NULL, '2019-10-28 15:19:39');
INSERT INTO `s_job_log` VALUES (45, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":99,\"descr\":\"aq\",\"disable_time\":\"2020-10-27T15:18:38\",\"enable_time\":\"2019-10-28T15:18:38\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:19:39\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:18:38', '2019-10-28 15:19:39', 7, NULL, NULL, '2019-10-28 15:20:41', NULL, '2019-10-28 15:20:41');
INSERT INTO `s_job_log` VALUES (46, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":100,\"descr\":\"aq\",\"disable_time\":\"2020-10-27T15:18:38\",\"enable_time\":\"2019-10-28T15:18:38\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:20:41\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:18:38', '2019-10-28 15:20:41', 8, NULL, NULL, '2019-10-28 15:22:21', NULL, '2019-10-28 15:22:21');
INSERT INTO `s_job_log` VALUES (47, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":102,\"descr\":\"aq\",\"disable_time\":\"2019-10-28T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:22:41\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:22:21', 9, NULL, NULL, '2019-10-28 15:22:44', NULL, '2019-10-28 15:22:44');
INSERT INTO `s_job_log` VALUES (48, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":102,\"descr\":\"aq\",\"disable_time\":\"2019-10-28T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:22:41\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 00:00:00', '2019-10-28 15:17:22', 9, NULL, NULL, '2019-10-28 15:23:02', NULL, '2019-10-28 15:23:02');
INSERT INTO `s_job_log` VALUES (49, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":105,\"descr\":\"aq\",\"disable_time\":\"2020-10-27T15:23:52\",\"enable_time\":\"2019-10-28T15:23:52\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:23:54\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:23:52', '2019-10-28 15:22:44', 10, NULL, NULL, '2019-10-28 15:24:04', NULL, '2019-10-28 15:24:04');
INSERT INTO `s_job_log` VALUES (50, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":107,\"descr\":\"aq\",\"disable_time\":\"2019-10-27T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:24:20\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:24:04', 11, NULL, NULL, '2019-10-28 15:24:24', NULL, '2019-10-28 15:24:24');
INSERT INTO `s_job_log` VALUES (51, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":107,\"descr\":\"aq\",\"disable_time\":\"2019-10-27T00:00:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":false,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:24:20\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-27 00:00:00', '2019-10-28 15:23:02', 10, NULL, NULL, '2019-10-28 15:24:32', NULL, '2019-10-28 15:24:32');
INSERT INTO `s_job_log` VALUES (52, 11, '租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_enable_task', '系统自动生产该项任务:租户定时任务，启用任务', '租户启用任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":110,\"descr\":\"aq\",\"disable_time\":\"2019-10-28T15:26:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:25:09\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-01 00:00:00', '2019-10-28 15:24:24', 12, NULL, NULL, '2019-10-28 15:25:10', NULL, '2019-10-28 15:25:10');
INSERT INTO `s_job_log` VALUES (53, 10, '租户定时任务：停止启用租户任务[8]', 'perfect_task_tentant', '租户定时任务', 8, 's_job_disable_task', '系统自动生产该项任务:租户定时任务，停止启用租户', '租户停止任务', 'com.perfect.bean.vo.sys.config.tenant.STentantVo', NULL, '{\"c_id\":1,\"c_time\":\"2019-09-24T23:49:26\",\"code\":\"aa\",\"dbversion\":110,\"descr\":\"aq\",\"disable_time\":\"2019-10-28T15:26:00\",\"enable_time\":\"2019-10-01T00:00:00\",\"id\":8,\"is_del\":false,\"is_enable\":true,\"is_freeze\":false,\"is_leaf\":false,\"name\":\"aaa1\",\"parent_name\":\"a\",\"parentid\":7,\"serial_no\":\"\",\"simple_name\":\"xx\",\"u_id\":1,\"u_time\":\"2019-10-28T15:25:09\"}', NULL, 0, 0, '0', 0, NULL, NULL, NULL, NULL, '2019-10-28 15:26:00', '2019-10-28 15:24:32', 11, NULL, NULL, '2019-10-28 15:26:04', NULL, '2019-10-28 15:26:04');

-- ----------------------------
-- Table structure for s_log
-- ----------------------------
DROP TABLE IF EXISTS `s_log`;
CREATE TABLE `s_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '耗时（毫秒）',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `class_method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'HTTP方法',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '参数',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'url',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'IP地址',
  `c_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5601 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_log_access
-- ----------------------------
DROP TABLE IF EXISTS `s_log_access`;
CREATE TABLE `s_log_access`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '操作日志记录',
  `login_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '模块标题',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '方法名称',
  `browser` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `os` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作人员',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '部门名称',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '请求URL',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_log_mq
-- ----------------------------
DROP TABLE IF EXISTS `s_log_mq`;
CREATE TABLE `s_log_mq`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'mq的queue编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'mq的queue名称',
  `exchange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'mq的queue所对应的exchange名称',
  `routing_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'mq的queue所对应的routing_key名称',
  `mq_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT 'mq的消息体',
  `construct_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `producer_status` tinyint(1) NULL DEFAULT NULL COMMENT '发送情况(0：未发送（false）、1：已发送（true）)',
  `consumer_status` tinyint(1) NULL DEFAULT NULL COMMENT '执行情况(0：未接受（false）、1：已接受（true）)',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '消息队列日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_log_mq
-- ----------------------------
INSERT INTO `s_log_mq` VALUES (1, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"000d3142fdda4915ba7f6cfaa6405647\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-08T07:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":4,\\\"descr\\\":\\\"aaaaa\\\",\\\"disable_time\\\":\\\"2019-10-18T07:29:34\\\",\\\"enable_time\\\":\\\"2020-10-17T07:29:34\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T07:29:37\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '000d3142fdda4915ba7f6cfaa6405647', 1, 0, 1, '2019-10-18 07:33:52', 1, '2019-10-18 07:33:52', 0);
INSERT INTO `s_log_mq` VALUES (2, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"e9846c4680794a84bba0a820c846bf5b\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":5,\\\"descr\\\":\\\"aaaaa1\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:04:18\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', 'e9846c4680794a84bba0a820c846bf5b', 1, 0, 1, '2019-10-18 08:04:28', 1, '2019-10-18 08:04:28', 0);
INSERT INTO `s_log_mq` VALUES (3, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"e42a46d5ff6e43e5a861aa6dafb6a53e\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":6,\\\"descr\\\":\\\"aaaaa1a\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:05:02\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', 'e42a46d5ff6e43e5a861aa6dafb6a53e', 1, 0, 1, '2019-10-18 08:05:02', 1, '2019-10-18 08:05:02', 0);
INSERT INTO `s_log_mq` VALUES (4, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"4a7663244bc4448a891f33ace8b91153\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":7,\\\"descr\\\":\\\"11\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:08:58\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '4a7663244bc4448a891f33ace8b91153', 1, 0, 1, '2019-10-18 08:08:58', 1, '2019-10-18 08:08:58', 0);
INSERT INTO `s_log_mq` VALUES (5, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"c09438c82eb24d0b8ec2d06ce80f22ba\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":8,\\\"descr\\\":\\\"11S\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:10:26\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', 'c09438c82eb24d0b8ec2d06ce80f22ba', 1, 0, 1, '2019-10-18 08:10:26', 1, '2019-10-18 08:10:26', 0);
INSERT INTO `s_log_mq` VALUES (6, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"74de2e8cd3e5402eae49da8c1682f399\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":9,\\\"descr\\\":\\\"11SA\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:11:44\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '74de2e8cd3e5402eae49da8c1682f399', 1, 0, 1, '2019-10-18 08:11:44', 1, '2019-10-18 08:11:44', 0);
INSERT INTO `s_log_mq` VALUES (7, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"add6efc0c26e46b6a1ba570c9fac5d05\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":10,\\\"descr\\\":\\\"11SA1\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:16:22\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', 'add6efc0c26e46b6a1ba570c9fac5d05', 1, 0, 1, '2019-10-18 08:16:22', 1, '2019-10-18 08:16:22', 0);
INSERT INTO `s_log_mq` VALUES (8, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"87fe3ec7f20c4375830a35532eae3362\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T23:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":11,\\\"descr\\\":\\\"11SA1a\\\",\\\"disable_time\\\":\\\"2019-10-18T08:04:15\\\",\\\"enable_time\\\":\\\"2020-10-17T08:04:15\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-18T08:23:03\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '87fe3ec7f20c4375830a35532eae3362', 1, 0, 1, '2019-10-18 08:23:03', 1, '2019-10-18 08:23:03', 0);
INSERT INTO `s_log_mq` VALUES (9, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"5ddf8ea1395a4d25a2dbba8e3152c123\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-07T15:49:26\\\",\\\"code\\\":\\\"aa\\\",\\\"dbversion\\\":12,\\\"descr\\\":\\\"11SA1aa\\\",\\\"disable_time\\\":\\\"2019-10-21T03:31:31\\\",\\\"enable_time\\\":\\\"2020-10-20T03:31:31\\\",\\\"id\\\":8,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"aa\\\",\\\"parent_name\\\":\\\"a\\\",\\\"parentid\\\":7,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"xx\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-21T03:32:45\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '5ddf8ea1395a4d25a2dbba8e3152c123', 1, 0, 1, '2019-10-21 03:33:30', 1, '2019-10-21 03:33:30', 0);
INSERT INTO `s_log_mq` VALUES (10, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"51091a5b2efb40b9aa5c8675d6d1e8e7\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-08T22:43:27\\\",\\\"code\\\":\\\"qq\\\",\\\"dbversion\\\":1,\\\"descr\\\":\\\"\\\",\\\"disable_time\\\":\\\"2020-04-18T08:55:05\\\",\\\"enable_time\\\":\\\"2019-10-21T08:55:05\\\",\\\"id\\\":6,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"qq\\\",\\\"parent_name\\\":\\\"q\\\",\\\"parentid\\\":5,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"aa\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-21T08:55:18\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '51091a5b2efb40b9aa5c8675d6d1e8e7', 1, 0, 1, '2019-10-21 08:55:18', 1, '2019-10-21 08:55:18', 0);
INSERT INTO `s_log_mq` VALUES (11, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"20654a20aa5340729b7288a564ac21c9\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"c_id\\\":1,\\\"c_time\\\":\\\"2019-10-08T15:42:11\\\",\\\"code\\\":\\\"a\\\",\\\"dbversion\\\":2,\\\"descr\\\":\\\"a\\\",\\\"disable_time\\\":\\\"2020-10-21T02:40:07\\\",\\\"enable_time\\\":\\\"2019-10-22T02:40:07\\\",\\\"id\\\":7,\\\"isdel\\\":false,\\\"isenable\\\":false,\\\"isfreeze\\\":false,\\\"isleaf\\\":false,\\\"name\\\":\\\"a\\\",\\\"parent_name\\\":\\\"q\\\",\\\"parentid\\\":5,\\\"serial_no\\\":\\\"\\\",\\\"simple_name\\\":\\\"aaaaa\\\",\\\"u_id\\\":1,\\\"u_time\\\":\\\"2019-10-22T02:40:13\\\"}\", \"messageBeanClass\": \"com.perfect.bean.vo.sys.config.tenant.STentantVo\"}}', '20654a20aa5340729b7288a564ac21c9', 1, 0, 1, '2019-10-22 02:40:13', 1, '2019-10-22 02:40:13', 0);
INSERT INTO `s_log_mq` VALUES (12, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"5833cd8979c14d29a4a87e6a0f2c1de7\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":7,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T05:45:49\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-08T07:42:11\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"dbversion\\\\\\\":3,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-19T05:45:49\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:45:49\\\\\\\",\\\\\\\"id\\\\\\\":7,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aaaaa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:45:51\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '5833cd8979c14d29a4a87e6a0f2c1de7', 1, 0, 1, '2019-10-22 05:45:52', 1, '2019-10-22 05:45:52', 0);
INSERT INTO `s_log_mq` VALUES (13, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"fa3924a8a92941f4864ce9fa6187e694\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":7,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-04-19T05:45:49\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-08T07:42:11\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"dbversion\\\\\\\":3,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-19T05:45:49\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:45:49\\\\\\\",\\\\\\\"id\\\\\\\":7,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aaaaa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:45:51\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'fa3924a8a92941f4864ce9fa6187e694', 1, 0, 1, '2019-10-22 05:45:52', 1, '2019-10-22 05:45:52', 0);
INSERT INTO `s_log_mq` VALUES (14, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"1462737320f94143a4b1d15e75260f7a\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":7,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T05:46:33\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-07T23:42:11\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"dbversion\\\\\\\":4,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-29T05:46:33\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:46:33\\\\\\\",\\\\\\\"id\\\\\\\":7,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aaaaa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:46:36\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '1462737320f94143a4b1d15e75260f7a', 1, 0, 1, '2019-10-22 05:47:32', 1, '2019-10-22 05:47:32', 0);
INSERT INTO `s_log_mq` VALUES (15, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"d628f5b9ea44445c8f136e386a8780de\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":7,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-29T05:46:33\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-07T23:42:11\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"dbversion\\\\\\\":4,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-29T05:46:33\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:46:33\\\\\\\",\\\\\\\"id\\\\\\\":7,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aaaaa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:46:36\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'd628f5b9ea44445c8f136e386a8780de', 1, 0, 1, '2019-10-22 05:47:45', 1, '2019-10-22 05:47:45', 0);
INSERT INTO `s_log_mq` VALUES (16, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"bd50a810b2d240a982ec83b0c15dffea\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":7,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T05:46:33\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-07T23:42:11\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"dbversion\\\\\\\":4,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-29T05:46:33\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:46:33\\\\\\\",\\\\\\\"id\\\\\\\":7,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aaaaa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:46:36\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'bd50a810b2d240a982ec83b0c15dffea', 1, 0, 1, '2019-10-22 05:48:13', 1, '2019-10-22 05:48:13', 0);
INSERT INTO `s_log_mq` VALUES (17, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"51d4745b53254a47809263a9d9940df8\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":7,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-29T05:46:33\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-07T23:42:11\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"dbversion\\\\\\\":4,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-29T05:46:33\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:46:33\\\\\\\",\\\\\\\"id\\\\\\\":7,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aaaaa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:46:36\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '51d4745b53254a47809263a9d9940df8', 1, 0, 1, '2019-10-22 05:48:23', 1, '2019-10-22 05:48:23', 0);
INSERT INTO `s_log_mq` VALUES (18, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"b2966cd3d036418faaab849a25b6f92d\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T05:49:32\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-07T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":13,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T05:49:32\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:49:32\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:49:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'b2966cd3d036418faaab849a25b6f92d', 1, 0, 1, '2019-10-22 05:49:37', 1, '2019-10-22 05:49:37', 0);
INSERT INTO `s_log_mq` VALUES (19, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"eb3b268ccf85430d9794e9f4c184bb2e\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T05:49:32\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-07T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":13,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T05:49:32\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:49:32\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:49:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'eb3b268ccf85430d9794e9f4c184bb2e', 1, 0, 1, '2019-10-22 05:50:00', 1, '2019-10-22 05:50:00', 0);
INSERT INTO `s_log_mq` VALUES (20, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"94a3982c7634419dbfbe142e5efbb922\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T05:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-06T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":14,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-20T05:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:50:46\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '94a3982c7634419dbfbe142e5efbb922', 1, 0, 1, '2019-10-22 05:50:49', 1, '2019-10-22 05:50:49', 0);
INSERT INTO `s_log_mq` VALUES (21, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"5f0c197fafa441c98162e56f9989d151\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-20T05:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-06T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":14,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-20T05:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T05:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:50:46\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '5f0c197fafa441c98162e56f9989d151', 1, 0, 1, '2019-10-22 05:51:03', 1, '2019-10-22 05:51:03', 0);
INSERT INTO `s_log_mq` VALUES (22, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"946e4136f6ae4d4a86a988a59bb95dbe\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-21T21:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-06T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":15,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-19T21:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T21:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:59:15\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '946e4136f6ae4d4a86a988a59bb95dbe', 1, 0, 1, '2019-10-22 05:59:15', 1, '2019-10-22 05:59:15', 0);
INSERT INTO `s_log_mq` VALUES (23, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"384a435c39e84cb183199bd710045cad\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-19T21:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-06T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":15,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-19T21:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T21:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T05:59:15\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '384a435c39e84cb183199bd710045cad', 1, 0, 1, '2019-10-22 05:59:16', 1, '2019-10-22 05:59:16', 0);
INSERT INTO `s_log_mq` VALUES (24, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"6b242800f56f48fb9cf60a1a229f559f\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-21T13:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-06T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":16,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-19T13:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T13:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:04:56\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '6b242800f56f48fb9cf60a1a229f559f', 1, 0, 1, '2019-10-22 06:04:56', 1, '2019-10-22 06:04:56', 0);
INSERT INTO `s_log_mq` VALUES (25, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"62b3412cc0f64add97906b91f1263003\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-19T13:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-06T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":16,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-19T13:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T13:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:04:56\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '62b3412cc0f64add97906b91f1263003', 1, 0, 1, '2019-10-22 06:05:15', 1, '2019-10-22 06:05:15', 0);
INSERT INTO `s_log_mq` VALUES (26, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"f5643b37471048148cf57ad04104f3b9\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-21T05:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-05T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":17,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1ax\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-19T05:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T05:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:06:26\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'f5643b37471048148cf57ad04104f3b9', 1, 0, 1, '2019-10-22 06:06:26', 1, '2019-10-22 06:06:26', 0);
INSERT INTO `s_log_mq` VALUES (27, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"946e8303df85447aa9fb25e51bfcd481\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-19T05:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-05T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":17,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1ax\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-19T05:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T05:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:06:26\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '946e8303df85447aa9fb25e51bfcd481', 1, 0, 1, '2019-10-22 06:06:37', 1, '2019-10-22 06:06:37', 0);
INSERT INTO `s_log_mq` VALUES (28, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"7f80bbd0b0ae4e3ba28e36349b6a0a61\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-20T21:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-05T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":18,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-18T21:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-20T21:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:13:09\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '7f80bbd0b0ae4e3ba28e36349b6a0a61', 1, 0, 1, '2019-10-22 06:13:09', 1, '2019-10-22 06:13:09', 0);
INSERT INTO `s_log_mq` VALUES (29, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"ffff412deec74b988decc4f1c1010380\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-18T21:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-05T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":18,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-18T21:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-20T21:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:13:09\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'ffff412deec74b988decc4f1c1010380', 1, 0, 1, '2019-10-22 06:13:13', 1, '2019-10-22 06:13:13', 0);
INSERT INTO `s_log_mq` VALUES (30, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"d4fda96d13ab478fa4b22ac05480f1c7\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-20T13:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-05T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":19,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-18T13:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-20T13:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:19:57\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'd4fda96d13ab478fa4b22ac05480f1c7', 1, 0, 1, '2019-10-22 06:19:57', 1, '2019-10-22 06:19:57', 0);
INSERT INTO `s_log_mq` VALUES (31, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"51aecd42945f472e83fd6c6c9e8a85ca\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-18T13:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-05T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":19,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-18T13:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-20T13:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:19:57\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '51aecd42945f472e83fd6c6c9e8a85ca', 1, 0, 1, '2019-10-22 06:20:31', 1, '2019-10-22 06:20:31', 0);
INSERT INTO `s_log_mq` VALUES (32, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"ec0dc731391241e7b1d54de68e4c41b3\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-20T05:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-04T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":20,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-18T05:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-20T05:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:23:20\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'ec0dc731391241e7b1d54de68e4c41b3', 1, 0, 1, '2019-10-22 06:23:20', 1, '2019-10-22 06:23:20', 0);
INSERT INTO `s_log_mq` VALUES (33, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"f4cc171f19af4ff7a531e4316dfbd3a5\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-18T05:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-04T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":20,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-18T05:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-20T05:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:23:20\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'f4cc171f19af4ff7a531e4316dfbd3a5', 1, 0, 1, '2019-10-22 06:23:52', 1, '2019-10-22 06:23:52', 0);
INSERT INTO `s_log_mq` VALUES (34, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"59f137cad79748adb19362d27e59fc5d\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":6,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-21T00:55:05\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-08T14:43:27\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"dbversion\\\\\\\":2,\\\\\\\"descr\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-18T00:55:05\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T00:55:05\\\\\\\",\\\\\\\"id\\\\\\\":6,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:26:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '59f137cad79748adb19362d27e59fc5d', 1, 0, 1, '2019-10-22 06:26:35', 1, '2019-10-22 06:26:35', 0);
INSERT INTO `s_log_mq` VALUES (35, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"d65639e907a845239aea777b0c9844ba\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":6,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-04-18T00:55:05\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-08T14:43:27\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"dbversion\\\\\\\":2,\\\\\\\"descr\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-18T00:55:05\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T00:55:05\\\\\\\",\\\\\\\"id\\\\\\\":6,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:26:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'd65639e907a845239aea777b0c9844ba', 1, 0, 1, '2019-10-22 06:26:41', 1, '2019-10-22 06:26:41', 0);
INSERT INTO `s_log_mq` VALUES (36, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"da96266cd6ed40ca92847213916bee7d\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":6,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-21T00:55:05\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-08T14:43:27\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"dbversion\\\\\\\":2,\\\\\\\"descr\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-18T00:55:05\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T00:55:05\\\\\\\",\\\\\\\"id\\\\\\\":6,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:26:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'da96266cd6ed40ca92847213916bee7d', 1, 0, 1, '2019-10-22 06:39:24', 1, '2019-10-22 06:39:24', 0);
INSERT INTO `s_log_mq` VALUES (37, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"e77fa0c7a8f747f089463b10f2afb0de\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":6,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-04-18T00:55:05\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-08T14:43:27\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"dbversion\\\\\\\":2,\\\\\\\"descr\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-18T00:55:05\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T00:55:05\\\\\\\",\\\\\\\"id\\\\\\\":6,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"qq\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"q\\\\\\\",\\\\\\\"parentid\\\\\\\":5,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:26:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'e77fa0c7a8f747f089463b10f2afb0de', 1, 0, 1, '2019-10-22 06:39:29', 1, '2019-10-22 06:39:29', 0);
INSERT INTO `s_log_mq` VALUES (38, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"0f9a6bef3b0c4ea3b7a974a205cb0b89\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-19T21:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-04T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":21,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-17T21:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-19T21:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:39:55\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '0f9a6bef3b0c4ea3b7a974a205cb0b89', 1, 0, 1, '2019-10-22 06:39:55', 1, '2019-10-22 06:39:55', 0);
INSERT INTO `s_log_mq` VALUES (39, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"2ab2049976a4454dad33d2bf67c5d0ce\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-01-17T21:50:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-04T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":21,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-01-17T21:50:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-19T21:50:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:39:55\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '2ab2049976a4454dad33d2bf67c5d0ce', 1, 0, 1, '2019-10-22 06:40:07', 1, '2019-10-22 06:40:07', 0);
INSERT INTO `s_log_mq` VALUES (40, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"bb4a2644c9ba49a4ab553688f7319ea3\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T06:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-04T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":22,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-21T06:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T06:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:46:50\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'bb4a2644c9ba49a4ab553688f7319ea3', 1, 0, 1, '2019-10-22 06:46:50', 1, '2019-10-22 06:46:50', 0);
INSERT INTO `s_log_mq` VALUES (41, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"ef80746dfe924e099f5c2754fb23b48c\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-21T06:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-04T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":22,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-21T06:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T06:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:46:50\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'ef80746dfe924e099f5c2754fb23b48c', 1, 0, 1, '2019-10-22 06:46:50', 1, '2019-10-22 06:46:50', 0);
INSERT INTO `s_log_mq` VALUES (42, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"ab0950ad17e44eff81b6574d862b95e1\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-21T22:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-03T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":23,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-20T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:47:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'ab0950ad17e44eff81b6574d862b95e1', 1, 0, 1, '2019-10-22 06:47:34', 1, '2019-10-22 06:47:34', 0);
INSERT INTO `s_log_mq` VALUES (43, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"a76442be348f48a5af64141e3c0bd4b7\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-20T22:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-03T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":23,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-20T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-21T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T06:47:34\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'a76442be348f48a5af64141e3c0bd4b7', 1, 0, 1, '2019-10-22 06:47:34', 1, '2019-10-22 06:47:34', 0);
INSERT INTO `s_log_mq` VALUES (44, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 06:54:51', 1, '2019-10-22 06:54:51', 0);
INSERT INTO `s_log_mq` VALUES (45, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 06:54:51', 1, '2019-10-22 06:54:51', 0);
INSERT INTO `s_log_mq` VALUES (46, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:15:08', 1, '2019-10-22 07:15:08', 0);
INSERT INTO `s_log_mq` VALUES (47, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:15:08', 1, '2019-10-22 07:15:08', 0);
INSERT INTO `s_log_mq` VALUES (48, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:19:23', 1, '2019-10-22 07:19:23', 0);
INSERT INTO `s_log_mq` VALUES (49, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:19:23', 1, '2019-10-22 07:19:23', 0);
INSERT INTO `s_log_mq` VALUES (50, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:25:41', 1, '2019-10-22 07:25:41', 0);
INSERT INTO `s_log_mq` VALUES (51, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:25:41', 1, '2019-10-22 07:25:41', 0);
INSERT INTO `s_log_mq` VALUES (52, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:28:15', 1, '2019-10-22 07:28:15', 0);
INSERT INTO `s_log_mq` VALUES (53, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:28:15', 1, '2019-10-22 07:28:15', 0);
INSERT INTO `s_log_mq` VALUES (54, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:38:49', 1, '2019-10-22 07:38:49', 0);
INSERT INTO `s_log_mq` VALUES (55, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:38:50', 1, '2019-10-22 07:38:50', 0);
INSERT INTO `s_log_mq` VALUES (56, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:42:45', 1, '2019-10-22 07:42:45', 0);
INSERT INTO `s_log_mq` VALUES (57, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:42:57', 1, '2019-10-22 07:42:57', 0);
INSERT INTO `s_log_mq` VALUES (58, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:45:40', 1, '2019-10-22 07:45:40', 0);
INSERT INTO `s_log_mq` VALUES (59, NULL, NULL, 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{}', NULL, 1, 0, 1, '2019-10-22 07:45:43', 1, '2019-10-22 07:45:43', 0);
INSERT INTO `s_log_mq` VALUES (60, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"10bc32ec5b1b4dd29801b72949aad137\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-19T14:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-01T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":30,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-18T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-19T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T07:48:24\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '10bc32ec5b1b4dd29801b72949aad137', 1, 0, 1, '2019-10-22 07:48:25', 1, '2019-10-22 07:48:25', 0);
INSERT INTO `s_log_mq` VALUES (61, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"1e0df098f0e2450983984baba779a75f\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-18T14:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-01T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":30,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-18T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-19T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T07:48:24\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '1e0df098f0e2450983984baba779a75f', 1, 0, 1, '2019-10-22 07:48:25', 1, '2019-10-22 07:48:25', 0);
INSERT INTO `s_log_mq` VALUES (62, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"d28c7d8a8e2c483987453fa4aadc4717\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-19T06:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-01T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":31,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-18T06:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-19T06:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:20:31\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'd28c7d8a8e2c483987453fa4aadc4717', 1, 0, 1, '2019-10-22 08:20:31', 1, '2019-10-22 08:20:31', 0);
INSERT INTO `s_log_mq` VALUES (63, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"9fea9677aeaa4cdd98887176d7c2e7cb\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-18T06:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-10-01T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":31,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-18T06:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-19T06:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:20:31\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '9fea9677aeaa4cdd98887176d7c2e7cb', 1, 0, 1, '2019-10-22 08:20:31', 1, '2019-10-22 08:20:31', 0);
INSERT INTO `s_log_mq` VALUES (64, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"c84c0926a84b414db4db4e756cd7e72c\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-18T22:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":32,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:48:10\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'c84c0926a84b414db4db4e756cd7e72c', 1, 0, 1, '2019-10-22 08:51:14', 1, '2019-10-22 08:51:14', 0);
INSERT INTO `s_log_mq` VALUES (65, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"c0152da907be47359abfaf3e973cd5bb\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-17T22:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":32,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:48:10\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'c0152da907be47359abfaf3e973cd5bb', 1, 0, 1, '2019-10-22 08:54:04', 1, '2019-10-22 08:54:04', 0);
INSERT INTO `s_log_mq` VALUES (66, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"48a6024c0b2b4319a392488a96bca34d\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:51:19\\\",\\\"concurrent\\\":false,\\\"id\\\":9,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":32,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:48:10\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:51:19\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '48a6024c0b2b4319a392488a96bca34d', 1, 0, 1, '2019-10-22 08:56:03', 1, '2019-10-22 08:56:03', 0);
INSERT INTO `s_log_mq` VALUES (67, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"530235474dc94034a86feba049fe56b7\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:51:19\\\",\\\"concurrent\\\":false,\\\"id\\\":9,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-17T22:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":32,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa11s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:48:10\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:51:19\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '530235474dc94034a86feba049fe56b7', 1, 0, 1, '2019-10-22 08:56:03', 1, '2019-10-22 08:56:03', 0);
INSERT INTO `s_log_mq` VALUES (68, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"5467b9effa294e078c440cfcc56b4329\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"concurrent\\\":false,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-18T14:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '5467b9effa294e078c440cfcc56b4329', 1, 0, 1, '2019-10-22 08:58:34', 1, '2019-10-22 08:58:34', 0);
INSERT INTO `s_log_mq` VALUES (69, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"dc1c7ddd561c432d96d540abf0cc4a6e\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-17T14:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'dc1c7ddd561c432d96d540abf0cc4a6e', 1, 0, 1, '2019-10-22 08:58:34', 1, '2019-10-22 08:58:34', 0);
INSERT INTO `s_log_mq` VALUES (70, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"a3e323cc358f4c418265d550f9831930\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:58:38\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'a3e323cc358f4c418265d550f9831930', 1, 0, 1, '2019-10-22 08:59:04', 1, '2019-10-22 08:59:04', 0);
INSERT INTO `s_log_mq` VALUES (71, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"47a468cdff474454b0514416fad975ef\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-17T06:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":34,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T06:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T06:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:59:01\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '47a468cdff474454b0514416fad975ef', 1, 0, 1, '2019-10-22 08:59:05', 1, '2019-10-22 08:59:05', 0);
INSERT INTO `s_log_mq` VALUES (72, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"3adfaf6be5ed4bcdb2d93dc5c7302bc4\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:58:38\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '3adfaf6be5ed4bcdb2d93dc5c7302bc4', 1, 0, 1, '2019-10-22 08:59:16', 1, '2019-10-22 08:59:16', 0);
INSERT INTO `s_log_mq` VALUES (73, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"e626eea5194748af8e0d0a6f3a9e1863\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-11-16T22:46:48\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-29T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":35,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-16T22:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-17T22:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:59:16\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'e626eea5194748af8e0d0a6f3a9e1863', 1, 0, 1, '2019-10-22 08:59:16', 1, '2019-10-22 08:59:16', 0);
INSERT INTO `s_log_mq` VALUES (74, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"efe68a7a43194f7987eb01f4253d05ef\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:58:38\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'efe68a7a43194f7987eb01f4253d05ef', 1, 0, 1, '2019-10-22 09:00:03', 1, '2019-10-22 09:00:03', 0);
INSERT INTO `s_log_mq` VALUES (75, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"51a57d29fe854be4b071af1692aa1a4c\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T08:59:56\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-29T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":36,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T08:59:56\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T08:59:56\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:00:03\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '51a57d29fe854be4b071af1692aa1a4c', 1, 0, 1, '2019-10-22 09:00:03', 1, '2019-10-22 09:00:03', 0);
INSERT INTO `s_log_mq` VALUES (76, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"1bd7ba9974fb40d4bf91d9a0c7209978\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T00:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:04:45\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '1bd7ba9974fb40d4bf91d9a0c7209978', 1, 0, 1, '2019-10-22 09:05:01', 1, '2019-10-22 09:05:01', 0);
INSERT INTO `s_log_mq` VALUES (77, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"05a064c91ef441c6a9c2adddecf11315\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T00:59:56\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-29T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":37,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqs\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T00:59:56\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T00:59:56\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:05:01\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '05a064c91ef441c6a9c2adddecf11315', 1, 0, 1, '2019-10-22 09:05:02', 1, '2019-10-22 09:05:02', 0);
INSERT INTO `s_log_mq` VALUES (78, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"20d111359f0d4b1488470936410cbcce\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T16:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:05:02\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '20d111359f0d4b1488470936410cbcce', 1, 0, 1, '2019-10-22 09:08:31', 1, '2019-10-22 09:08:31', 0);
INSERT INTO `s_log_mq` VALUES (79, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"b6782b0a7e9e40439110b70094799530\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T09:06:30\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-28T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":38,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T09:06:30\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T09:06:30\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:06:32\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'b6782b0a7e9e40439110b70094799530', 1, 0, 1, '2019-10-22 09:08:31', 1, '2019-10-22 09:08:31', 0);
INSERT INTO `s_log_mq` VALUES (80, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"309919917c4341c8832f1a6eadd106c6\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T16:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:05:02\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '309919917c4341c8832f1a6eadd106c6', 1, 0, 1, '2019-10-22 09:10:16', 1, '2019-10-22 09:10:16', 0);
INSERT INTO `s_log_mq` VALUES (81, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"cd3fa9a4ca3543e5895468883d225ed8\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T09:06:30\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-28T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":38,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T09:06:30\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T09:06:30\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:06:32\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'cd3fa9a4ca3543e5895468883d225ed8', 1, 0, 1, '2019-10-22 09:10:16', 1, '2019-10-22 09:10:16', 0);
INSERT INTO `s_log_mq` VALUES (82, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"65ba6807e0be4d47ac30b287e838c232\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T16:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:05:02\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '65ba6807e0be4d47ac30b287e838c232', 1, 0, 1, '2019-10-22 09:11:39', 1, '2019-10-22 09:11:39', 0);
INSERT INTO `s_log_mq` VALUES (83, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"39b1614034c944f49fcd5757209fbc80\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-04-19T09:11:37\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-28T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":39,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-04-19T09:11:37\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T09:11:37\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:11:39\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T08:54:40\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '39b1614034c944f49fcd5757209fbc80', 1, 0, 1, '2019-10-22 09:11:39', 1, '2019-10-22 09:11:39', 0);
INSERT INTO `s_log_mq` VALUES (84, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"6c9fd86ad3f948f9a0faa378086fc828\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:12:24\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '6c9fd86ad3f948f9a0faa378086fc828', 1, 0, 1, '2019-10-22 09:13:25', 1, '2019-10-22 09:13:25', 0);
INSERT INTO `s_log_mq` VALUES (85, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"25da2e82bf8440168f6ed295334b9b9f\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-22T00:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-29T09:12:45\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-28T07:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":40,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-29T09:12:45\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T09:12:45\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:12:46\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:12:24\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '25da2e82bf8440168f6ed295334b9b9f', 1, 0, 1, '2019-10-22 09:13:25', 1, '2019-10-22 09:13:25', 0);
INSERT INTO `s_log_mq` VALUES (86, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"cdccb108f60b4bf188546df8b0163d07\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T00:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:13:29\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'cdccb108f60b4bf188546df8b0163d07', 1, 0, 1, '2019-10-22 09:15:58', 1, '2019-10-22 09:15:58', 0);
INSERT INTO `s_log_mq` VALUES (87, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"5091195199864a0f9059cd59fa9ce6a1\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T16:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T09:15:51\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-27T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":41,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T09:15:51\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T09:15:51\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:15:53\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:13:32\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '5091195199864a0f9059cd59fa9ce6a1', 1, 0, 1, '2019-10-22 09:16:40', 1, '2019-10-22 09:16:40', 0);
INSERT INTO `s_log_mq` VALUES (88, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"22dec1f1ecc14e90a08c0d7531c1a1b3\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T16:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:16:11\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '22dec1f1ecc14e90a08c0d7531c1a1b3', 1, 0, 1, '2019-10-22 09:20:37', 1, '2019-10-22 09:20:37', 0);
INSERT INTO `s_log_mq` VALUES (90, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"10342747415547f594358d6c1b6abbb3\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:20:58\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '10342747415547f594358d6c1b6abbb3', 1, 0, 1, '2019-10-22 09:24:14', 1, '2019-10-22 09:24:14', 0);
INSERT INTO `s_log_mq` VALUES (91, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"ae3d2a3f14404f2f9bd5561d227ae98c\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-21T09:23:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-26T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":44,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsssqqsqa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-21T09:23:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-22T09:23:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T09:23:58\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:16:49\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'ae3d2a3f14404f2f9bd5561d227ae98c', 1, 0, 1, '2019-10-22 09:24:16', 1, '2019-10-22 09:24:16', 0);
INSERT INTO `s_log_mq` VALUES (92, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"eca72531656d4715b72b3e0494a7d060\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:20:58\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'eca72531656d4715b72b3e0494a7d060', 1, 0, 1, '2019-10-23 15:15:38', 1, '2019-10-23 15:15:38', 0);
INSERT INTO `s_log_mq` VALUES (93, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"ace4eeef56fe45e49b1cc1c75c1a4ca4\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-22T15:15:27\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":52,\\\\\\\"descr\\\\\\\":\\\\\\\"11\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-22T15:15:27\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-23T15:15:27\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-23T15:15:29\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-22T09:16:49\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'ace4eeef56fe45e49b1cc1c75c1a4ca4', 1, 0, 1, '2019-10-23 15:15:40', 1, '2019-10-23 15:15:40', 0);
INSERT INTO `s_log_mq` VALUES (94, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"58b675cfab1d496c990f38850fb782ed\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:37:33\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '58b675cfab1d496c990f38850fb782ed', 1, 0, 1, '2019-10-23 15:39:04', 1, '2019-10-23 15:39:04', 0);
INSERT INTO `s_log_mq` VALUES (95, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"43d4956c86934b16855c3f6e4cacdb32\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-22T15:15:27\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":53,\\\\\\\"descr\\\\\\\":\\\\\\\"11a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-22T15:15:27\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-23T15:15:27\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-23T15:39:01\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:19:10\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '43d4956c86934b16855c3f6e4cacdb32', 1, 0, 1, '2019-10-23 15:39:05', 1, '2019-10-23 15:39:05', 0);
INSERT INTO `s_log_mq` VALUES (96, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"f38c020a922942928ebe7a68e285a5e9\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:39:04\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'f38c020a922942928ebe7a68e285a5e9', 1, 0, 1, '2019-10-23 16:03:49', 1, '2019-10-23 16:03:49', 0);
INSERT INTO `s_log_mq` VALUES (97, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"760ef61fdbaa4499b48a6ddc0311823d\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-22T15:15:27\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":54,\\\\\\\"descr\\\\\\\":\\\\\\\"11a2\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-22T15:15:27\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-23T15:15:27\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-23T16:03:46\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:39:05\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '760ef61fdbaa4499b48a6ddc0311823d', 1, 0, 1, '2019-10-23 16:03:50', 1, '2019-10-23 16:03:50', 0);
INSERT INTO `s_log_mq` VALUES (98, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"d4a555c4d4714ad597377b4cfa1513bf\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:39:04\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'd4a555c4d4714ad597377b4cfa1513bf', 1, 0, 1, '2019-10-23 16:05:55', 1, '2019-10-23 16:05:55', 0);
INSERT INTO `s_log_mq` VALUES (99, '1', '通用队列，无回调', 'perfect-task-tentant-exchange', 'perfect-task-tentant.#', '{\"key\": \"38ee0a2c2a114f6aa27c4b0f703ab40a\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-22T15:15:27\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":55,\\\\\\\"descr\\\\\\\":\\\\\\\"11a2w\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-22T15:15:27\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-23T15:15:27\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-23T16:05:53\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:39:05\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '38ee0a2c2a114f6aa27c4b0f703ab40a', 1, 0, 1, '2019-10-23 16:05:56', 1, '2019-10-23 16:05:56', 0);
INSERT INTO `s_log_mq` VALUES (100, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"key\": \"20379bf3d4a14b4291cf17aaad2bdaed\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:39:04\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '20379bf3d4a14b4291cf17aaad2bdaed', 1, 0, 1, '2019-10-23 16:48:02', 1, '2019-10-23 16:48:02', 0);
INSERT INTO `s_log_mq` VALUES (101, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"key\": \"afaee42588d5452296f6db19cb2e6a55\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2018-11-04T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":56,\\\\\\\"descr\\\\\\\":\\\\\\\"11a2w\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2018-11-04T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2018-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-23T16:47:59\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T15:39:05\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'afaee42588d5452296f6db19cb2e6a55', 1, 0, 1, '2019-10-23 16:49:12', 1, '2019-10-23 16:49:12', 0);
INSERT INTO `s_log_mq` VALUES (102, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"key\": \"5f86495f9f41446690cd4e46ff4fd605\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-30T15:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":33,\\\\\\\"descr\\\\\\\":\\\\\\\"11SA1aaaa1axa1w1s1aa12dsss\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-11-17T14:46:48\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-18T14:46:48\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"isdel\\\\\\\":false,\\\\\\\"isenable\\\\\\\":false,\\\\\\\"isfreeze\\\\\\\":false,\\\\\\\"isleaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-22T08:58:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T16:48:04\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', '5f86495f9f41446690cd4e46ff4fd605', 1, 0, 1, '2019-10-23 16:49:54', 1, '2019-10-23 16:49:54', 0);
INSERT INTO `s_log_mq` VALUES (103, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"key\": \"d9c0097cddea4e3983ecb11025e07bdb\", \"name\": \"通用队列，无回调\", \"type\": \"1\", \"mqMessagePojo\": {\"parameterJson\": \"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2018-11-04T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":57,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2018-11-04T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2018-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-23T16:49:53\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T16:49:12\\\"}\", \"messageBeanClass\": \"com.perfect.bean.entity.quartz.SJobEntity\"}}', 'd9c0097cddea4e3983ecb11025e07bdb', 1, 0, 1, '2019-10-23 16:49:58', 1, '2019-10-23 16:49:58', 0);
INSERT INTO `s_log_mq` VALUES (104, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"550e2aa3e9f945d382c065d6ccbd3ea1\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T13:30:21\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":58,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T13:30:21\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T13:30:21\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T13:30:22\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T16:50:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '550e2aa3e9f945d382c065d6ccbd3ea1', 1, 0, 1, '2019-10-28 13:30:22', 1, '2019-10-28 13:30:22', 0);
INSERT INTO `s_log_mq` VALUES (105, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"e1fa29f94446443d943780ccba2cd187\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T13:30:21\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":58,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T13:30:21\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T13:30:21\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T13:30:22\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T16:50:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'e1fa29f94446443d943780ccba2cd187', 1, 0, 1, '2019-10-28 13:30:22', 1, '2019-10-28 13:30:22', 0);
INSERT INTO `s_log_mq` VALUES (106, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"ebb10b0fb62d4162a088266d442ec44e\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:26:55\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":59,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:26:55\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:26:55\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:27:07\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T16:50:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ebb10b0fb62d4162a088266d442ec44e', 1, 0, 1, '2019-10-28 14:27:14', 1, '2019-10-28 14:27:14', 0);
INSERT INTO `s_log_mq` VALUES (107, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"f58ac1936bfb4b48acdce39e7db9faef\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:26:55\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":59,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:26:55\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:26:55\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:27:07\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-23T16:50:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'f58ac1936bfb4b48acdce39e7db9faef', 1, 0, 1, '2019-10-28 14:27:14', 1, '2019-10-28 14:27:14', 0);
INSERT INTO `s_log_mq` VALUES (108, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"ba4c2f8cefec454ab2a9d361db8c4fdb\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:14\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":60,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:14\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:14\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:29:15\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:27:29\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ba4c2f8cefec454ab2a9d361db8c4fdb', 1, 0, 1, '2019-10-28 14:29:15', 1, '2019-10-28 14:29:15', 0);
INSERT INTO `s_log_mq` VALUES (109, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"47381eee976c497482d61d7c42b0960e\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:14\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":60,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:14\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:14\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:29:15\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:27:29\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '47381eee976c497482d61d7c42b0960e', 1, 0, 1, '2019-10-28 14:29:15', 1, '2019-10-28 14:29:15', 0);
INSERT INTO `s_log_mq` VALUES (110, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"20551e34c0314a5994ce55bbb99896ac\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":61,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:29:58\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:29:23\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '20551e34c0314a5994ce55bbb99896ac', 1, 0, 1, '2019-10-28 14:29:58', 1, '2019-10-28 14:29:58', 0);
INSERT INTO `s_log_mq` VALUES (111, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"f18c792b14ca4ef6a0d2a4c6428008ca\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":61,\\\\\\\"descr\\\\\\\":\\\\\\\"8\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:29:58\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:29:23\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'f18c792b14ca4ef6a0d2a4c6428008ca', 1, 0, 1, '2019-10-28 14:29:58', 1, '2019-10-28 14:29:58', 0);
INSERT INTO `s_log_mq` VALUES (112, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"ef361cb87e6c4007b2d89c93a7686961\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":62,\\\\\\\"descr\\\\\\\":\\\\\\\"81\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:30:19\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:29:58\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ef361cb87e6c4007b2d89c93a7686961', 1, 0, 1, '2019-10-28 14:30:19', 1, '2019-10-28 14:30:19', 0);
INSERT INTO `s_log_mq` VALUES (113, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"4b3d7ff8b4364fb8861405d8ed0b1104\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":62,\\\\\\\"descr\\\\\\\":\\\\\\\"81\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:30:19\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:29:58\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '4b3d7ff8b4364fb8861405d8ed0b1104', 1, 0, 1, '2019-10-28 14:30:19', 1, '2019-10-28 14:30:19', 0);
INSERT INTO `s_log_mq` VALUES (114, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"3a188976aa7c411591c34428190ebd34\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":63,\\\\\\\"descr\\\\\\\":\\\\\\\"811\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:31:04\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:30:19\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '3a188976aa7c411591c34428190ebd34', 1, 0, 1, '2019-10-28 14:31:04', 1, '2019-10-28 14:31:04', 0);
INSERT INTO `s_log_mq` VALUES (115, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"18c3b088e0c14ab8b24e2baed50892f0\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":63,\\\\\\\"descr\\\\\\\":\\\\\\\"811\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:31:04\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:30:19\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '18c3b088e0c14ab8b24e2baed50892f0', 1, 0, 1, '2019-10-28 14:31:04', 1, '2019-10-28 14:31:04', 0);
INSERT INTO `s_log_mq` VALUES (116, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"b258dc8cdc994d14b96f2b65c1b0740c\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":64,\\\\\\\"descr\\\\\\\":\\\\\\\"811q\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:33:19\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:31:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'b258dc8cdc994d14b96f2b65c1b0740c', 1, 0, 1, '2019-10-28 14:33:19', 1, '2019-10-28 14:33:19', 0);
INSERT INTO `s_log_mq` VALUES (117, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"ed74d7e8bef74fc39b8eba66b1e49475\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":64,\\\\\\\"descr\\\\\\\":\\\\\\\"811q\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:33:19\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:31:17\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ed74d7e8bef74fc39b8eba66b1e49475', 1, 0, 1, '2019-10-28 14:33:19', 1, '2019-10-28 14:33:19', 0);
INSERT INTO `s_log_mq` VALUES (118, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"628cd44053934ac0b1dc7b2058d872e6\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":65,\\\\\\\"descr\\\\\\\":\\\\\\\"811qq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:38:54\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:33:19\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '628cd44053934ac0b1dc7b2058d872e6', 1, 0, 1, '2019-10-28 14:38:54', 1, '2019-10-28 14:38:54', 0);
INSERT INTO `s_log_mq` VALUES (119, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"12ca701369114ed09f59faf789a2793e\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":65,\\\\\\\"descr\\\\\\\":\\\\\\\"811qq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:38:54\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:33:21\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '12ca701369114ed09f59faf789a2793e', 1, 0, 1, '2019-10-28 14:38:54', 1, '2019-10-28 14:38:54', 0);
INSERT INTO `s_log_mq` VALUES (120, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"83e1bf968fa54227b4f76c7f413a96d2\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":66,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:40:43\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:38:54\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '83e1bf968fa54227b4f76c7f413a96d2', 1, 0, 1, '2019-10-28 14:40:43', 1, '2019-10-28 14:40:43', 0);
INSERT INTO `s_log_mq` VALUES (121, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"1eafb92412f442cabc14bc679b307e03\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":66,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:40:43\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:38:54\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '1eafb92412f442cabc14bc679b307e03', 1, 0, 1, '2019-10-28 14:40:43', 1, '2019-10-28 14:40:43', 0);
INSERT INTO `s_log_mq` VALUES (122, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"a99b0af3685d425b8dfb163a4cb2e626\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":67,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:44:18\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:40:43\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'a99b0af3685d425b8dfb163a4cb2e626', 1, 0, 1, '2019-10-28 14:44:19', 1, '2019-10-28 14:44:19', 0);
INSERT INTO `s_log_mq` VALUES (123, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"2835b1bf3f0d41e884d0c397b49e94ba\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T14:29:57\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":67,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T14:29:57\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T14:29:57\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:44:18\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:40:43\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '2835b1bf3f0d41e884d0c397b49e94ba', 1, 0, 1, '2019-10-28 14:44:19', 1, '2019-10-28 14:44:19', 0);
INSERT INTO `s_log_mq` VALUES (124, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"cc85b5097794427091e3ca5fec745e8b\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":68,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:47:21\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:44:19\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'cc85b5097794427091e3ca5fec745e8b', 1, 0, 1, '2019-10-28 14:47:21', 1, '2019-10-28 14:47:21', 0);
INSERT INTO `s_log_mq` VALUES (125, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"b45b01f4719545b9bb66faac8f2a2ce2\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":68,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:47:21\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:44:19\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'b45b01f4719545b9bb66faac8f2a2ce2', 1, 0, 1, '2019-10-28 14:47:21', 1, '2019-10-28 14:47:21', 0);
INSERT INTO `s_log_mq` VALUES (126, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"77ed84188e084744a4a2432e041fb539\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":69,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:50:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:47:21\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '77ed84188e084744a4a2432e041fb539', 1, 0, 1, '2019-10-28 14:50:25', 1, '2019-10-28 14:50:25', 0);
INSERT INTO `s_log_mq` VALUES (127, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"6a3a506219f44467b89a2201bb477c8d\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":69,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:50:25\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:47:21\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '6a3a506219f44467b89a2201bb477c8d', 1, 0, 1, '2019-10-28 14:50:25', 1, '2019-10-28 14:50:25', 0);
INSERT INTO `s_log_mq` VALUES (128, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"b66a37b21f3e43a9ac58e90ea4822a9d\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":70,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2w\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:51:01\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:50:31\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'b66a37b21f3e43a9ac58e90ea4822a9d', 1, 0, 1, '2019-10-28 14:51:01', 1, '2019-10-28 14:51:01', 0);
INSERT INTO `s_log_mq` VALUES (129, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"afd66a406b744919ad95b5c0c9a7b3a0\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":70,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2w\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:51:01\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:50:31\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'afd66a406b744919ad95b5c0c9a7b3a0', 1, 0, 1, '2019-10-28 14:51:01', 1, '2019-10-28 14:51:01', 0);
INSERT INTO `s_log_mq` VALUES (130, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"f9e84e374e744367850b2fc23f7962ba\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":71,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2ws\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:51:36\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:51:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'f9e84e374e744367850b2fc23f7962ba', 1, 0, 1, '2019-10-28 14:51:36', 1, '2019-10-28 14:51:36', 0);
INSERT INTO `s_log_mq` VALUES (131, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"e743b29bc87046b8835f25a1aab061f5\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":71,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2ws\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:51:36\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:51:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'e743b29bc87046b8835f25a1aab061f5', 1, 0, 1, '2019-10-28 14:51:36', 1, '2019-10-28 14:51:36', 0);
INSERT INTO `s_log_mq` VALUES (132, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"3499a4802fe646da883facde842fa72c\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":72,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2wsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:54:47\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:51:42\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '3499a4802fe646da883facde842fa72c', 1, 0, 1, '2019-10-28 14:54:47', 1, '2019-10-28 14:54:47', 0);
INSERT INTO `s_log_mq` VALUES (133, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"ec598ca1d23e426198b6a82d02875b25\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":72,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2wsq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:54:47\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:51:42\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ec598ca1d23e426198b6a82d02875b25', 1, 0, 1, '2019-10-28 14:54:47', 1, '2019-10-28 14:54:47', 0);
INSERT INTO `s_log_mq` VALUES (134, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"86f6b08ae6054d829d39c5d3e401cbda\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":73,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2wsqs\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:57:02\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:54:52\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '86f6b08ae6054d829d39c5d3e401cbda', 1, 0, 1, '2019-10-28 14:57:02', 1, '2019-10-28 14:57:02', 0);
INSERT INTO `s_log_mq` VALUES (135, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"8a9694cdd0894ff795be606baff6db2f\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":73,\\\\\\\"descr\\\\\\\":\\\\\\\"811qqaa2wsqs\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T14:57:02\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:54:52\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '8a9694cdd0894ff795be606baff6db2f', 1, 0, 1, '2019-10-28 14:57:02', 1, '2019-10-28 14:57:02', 0);
INSERT INTO `s_log_mq` VALUES (136, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"faad7ecac4284c83942d690eeaae6f27\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":74,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:01:48\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:57:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'faad7ecac4284c83942d690eeaae6f27', 1, 0, 1, '2019-10-28 15:01:48', 1, '2019-10-28 15:01:48', 0);
INSERT INTO `s_log_mq` VALUES (137, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"29ef1a0af911408c89d72dac5d7fd8fe\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":74,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:01:48\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T14:57:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '29ef1a0af911408c89d72dac5d7fd8fe', 1, 0, 1, '2019-10-28 15:01:49', 1, '2019-10-28 15:01:49', 0);
INSERT INTO `s_log_mq` VALUES (138, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"8b406106974b4eb2a96df3ff3409a888\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":75,\\\\\\\"descr\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:02:08\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:01:52\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '8b406106974b4eb2a96df3ff3409a888', 1, 0, 1, '2019-10-28 15:02:09', 1, '2019-10-28 15:02:09', 0);
INSERT INTO `s_log_mq` VALUES (139, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"c6d3c20ad478403f980893b85cc3ed7d\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":75,\\\\\\\"descr\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:02:08\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:01:52\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'c6d3c20ad478403f980893b85cc3ed7d', 1, 0, 1, '2019-10-28 15:02:09', 1, '2019-10-28 15:02:09', 0);
INSERT INTO `s_log_mq` VALUES (140, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"2f819254f99845dbb205be24a93cfad5\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":76,\\\\\\\"descr\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:02:30\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:02:11\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '2f819254f99845dbb205be24a93cfad5', 1, 0, 1, '2019-10-28 15:02:30', 1, '2019-10-28 15:02:30', 0);
INSERT INTO `s_log_mq` VALUES (141, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"88d8ad3a0c6d4b7dba01e92d28d85add\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":76,\\\\\\\"descr\\\\\\\":\\\\\\\"aaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:02:30\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:02:11\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '88d8ad3a0c6d4b7dba01e92d28d85add', 1, 0, 1, '2019-10-28 15:02:30', 1, '2019-10-28 15:02:30', 0);
INSERT INTO `s_log_mq` VALUES (142, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"ee3b207301f74f33b5436c782b171800\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":77,\\\\\\\"descr\\\\\\\":\\\\\\\"aaaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:03:11\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:02:34\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ee3b207301f74f33b5436c782b171800', 1, 0, 1, '2019-10-28 15:03:11', 1, '2019-10-28 15:03:11', 0);
INSERT INTO `s_log_mq` VALUES (143, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"0d269e0bced04561a945b0c73e40e90d\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":77,\\\\\\\"descr\\\\\\\":\\\\\\\"aaaa\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:03:11\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:02:34\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '0d269e0bced04561a945b0c73e40e90d', 1, 0, 1, '2019-10-28 15:03:11', 1, '2019-10-28 15:03:11', 0);
INSERT INTO `s_log_mq` VALUES (144, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"daf261f3672c4a869bfd5b5efc4f4444\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":78,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:09:52\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:03:14\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'daf261f3672c4a869bfd5b5efc4f4444', 1, 0, 1, '2019-10-28 15:09:52', 1, '2019-10-28 15:09:52', 0);
INSERT INTO `s_log_mq` VALUES (145, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"021beafe2db14e0da14402e3909b16e3\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":78,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:09:52\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:03:14\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '021beafe2db14e0da14402e3909b16e3', 1, 0, 1, '2019-10-28 15:09:53', 1, '2019-10-28 15:09:53', 0);
INSERT INTO `s_log_mq` VALUES (146, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"57ecc7e7ae444578be0dd598c17cea65\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":79,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:09:59\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:09:56\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '57ecc7e7ae444578be0dd598c17cea65', 1, 0, 1, '2019-10-28 15:10:11', 1, '2019-10-28 15:10:11', 0);
INSERT INTO `s_log_mq` VALUES (147, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"b3c783ccd9be461499628625022df162\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:09:59\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":79,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:09:59\\\\\\\"}\\\",\\\"run_times\\\":0,\\\"u_time\\\":\\\"2019-10-28T15:09:59\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'b3c783ccd9be461499628625022df162', 1, 0, 1, '2019-10-28 15:10:11', 1, '2019-10-28 15:10:11', 0);
INSERT INTO `s_log_mq` VALUES (148, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"3121072b10d44a10a82edf958c472fbc\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":80,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:10:37\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:10:14\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '3121072b10d44a10a82edf958c472fbc', 1, 0, 1, '2019-10-28 15:11:18', 1, '2019-10-28 15:11:18', 0);
INSERT INTO `s_log_mq` VALUES (149, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"8a73a4032ba14be98e9ea56fe351fd02\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:10:30\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":80,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:10:37\\\\\\\"}\\\",\\\"run_times\\\":1,\\\"u_time\\\":\\\"2019-10-28T15:10:49\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '8a73a4032ba14be98e9ea56fe351fd02', 1, 0, 1, '2019-10-28 15:11:18', 1, '2019-10-28 15:11:18', 0);
INSERT INTO `s_log_mq` VALUES (150, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"c9649d18adef4ad18f3d2e905970119c\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":81,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:11:28\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:11:24\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'c9649d18adef4ad18f3d2e905970119c', 1, 0, 1, '2019-10-28 15:11:45', 1, '2019-10-28 15:11:45', 0);
INSERT INTO `s_log_mq` VALUES (151, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"831ddb2fcab44419aea02e7ff862bcfc\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:11:28\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":81,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:11:28\\\\\\\"}\\\",\\\"run_times\\\":2,\\\"u_time\\\":\\\"2019-10-28T15:11:28\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '831ddb2fcab44419aea02e7ff862bcfc', 1, 0, 1, '2019-10-28 15:11:45', 1, '2019-10-28 15:11:45', 0);
INSERT INTO `s_log_mq` VALUES (152, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"5a0a9279e8de48bc948fb214f072f9e1\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":82,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:11:55\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:11:47\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '5a0a9279e8de48bc948fb214f072f9e1', 1, 0, 1, '2019-10-28 15:12:06', 1, '2019-10-28 15:12:06', 0);
INSERT INTO `s_log_mq` VALUES (153, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"1a1d9a4d8b0045d98f60488a81364222\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:11:55\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":82,\\\\\\\"descr\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:11:55\\\\\\\"}\\\",\\\"run_times\\\":3,\\\"u_time\\\":\\\"2019-10-28T15:11:55\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '1a1d9a4d8b0045d98f60488a81364222', 1, 0, 1, '2019-10-28 15:12:06', 1, '2019-10-28 15:12:06', 0);
INSERT INTO `s_log_mq` VALUES (154, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"f95cf39f5e5044f0a96397a7169778bd\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":84,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:05\\\\\\\"}\\\",\\\"u_time\\\":\\\"2019-10-28T15:12:12\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'f95cf39f5e5044f0a96397a7169778bd', 1, 0, 1, '2019-10-28 15:15:05', 1, '2019-10-28 15:15:05', 0);
INSERT INTO `s_log_mq` VALUES (155, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"558f49960bd74654ba26c8072f4ee4d4\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:12:50\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":84,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:05\\\\\\\"}\\\",\\\"run_times\\\":4,\\\"u_time\\\":\\\"2019-10-28T15:12:50\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '558f49960bd74654ba26c8072f4ee4d4', 1, 0, 1, '2019-10-28 15:15:05', 1, '2019-10-28 15:15:05', 0);
INSERT INTO `s_log_mq` VALUES (156, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"5d8587286c4c48eb9810ede212a2d4d2\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:15:12\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":86,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:12\\\\\\\"}\\\",\\\"run_times\\\":0,\\\"u_time\\\":\\\"2019-10-28T15:15:12\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '5d8587286c4c48eb9810ede212a2d4d2', 1, 0, 1, '2019-10-28 15:15:21', 1, '2019-10-28 15:15:21', 0);
INSERT INTO `s_log_mq` VALUES (157, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"bbc4b5716f454fbfaab7e0deadcfde3f\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:15:11\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":86,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:12\\\\\\\"}\\\",\\\"run_times\\\":5,\\\"u_time\\\":\\\"2019-10-28T15:15:11\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'bbc4b5716f454fbfaab7e0deadcfde3f', 1, 0, 1, '2019-10-28 15:15:21', 1, '2019-10-28 15:15:21', 0);
INSERT INTO `s_log_mq` VALUES (158, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"55c7d3b642804b34b9b6450985462990\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:15:34\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":88,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:34\\\\\\\"}\\\",\\\"run_times\\\":1,\\\"u_time\\\":\\\"2019-10-28T15:15:34\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '55c7d3b642804b34b9b6450985462990', 1, 0, 1, '2019-10-28 15:15:41', 1, '2019-10-28 15:15:41', 0);
INSERT INTO `s_log_mq` VALUES (159, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"42c56464f6b1485787a3334935012183\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:15:32\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":88,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:34\\\\\\\"}\\\",\\\"run_times\\\":6,\\\"u_time\\\":\\\"2019-10-28T15:15:32\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '42c56464f6b1485787a3334935012183', 1, 0, 1, '2019-10-28 15:15:41', 1, '2019-10-28 15:15:41', 0);
INSERT INTO `s_log_mq` VALUES (160, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"f069f20267764e0e8e1ec38ad6d551c2\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:15:49\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":90,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:51\\\\\\\"}\\\",\\\"run_times\\\":2,\\\"u_time\\\":\\\"2019-10-28T15:15:49\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'f069f20267764e0e8e1ec38ad6d551c2', 1, 0, 1, '2019-10-28 15:16:50', 1, '2019-10-28 15:16:50', 0);
INSERT INTO `s_log_mq` VALUES (161, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"9ec08751d15e4bf4b41efb527340cbc0\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:15:51\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":90,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:15:51\\\\\\\"}\\\",\\\"run_times\\\":7,\\\"u_time\\\":\\\"2019-10-28T15:15:51\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '9ec08751d15e4bf4b41efb527340cbc0', 1, 0, 1, '2019-10-28 15:16:50', 1, '2019-10-28 15:16:50', 0);
INSERT INTO `s_log_mq` VALUES (162, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"01e6c1c29bd841a89f2560d281765703\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:16:55\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":92,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:16:55\\\\\\\"}\\\",\\\"run_times\\\":3,\\\"u_time\\\":\\\"2019-10-28T15:16:55\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '01e6c1c29bd841a89f2560d281765703', 1, 0, 1, '2019-10-28 15:17:19', 1, '2019-10-28 15:17:19', 0);
INSERT INTO `s_log_mq` VALUES (163, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"e5af6eb0d8d4431e82fafec13253af1f\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:16:55\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-22T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":92,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-22T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:16:55\\\\\\\"}\\\",\\\"run_times\\\":8,\\\"u_time\\\":\\\"2019-10-28T15:16:55\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'e5af6eb0d8d4431e82fafec13253af1f', 1, 0, 1, '2019-10-28 15:17:19', 1, '2019-10-28 15:17:19', 0);
INSERT INTO `s_log_mq` VALUES (164, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"5c16f880d4b34ab48a595c63aa160cac\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:18:01\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":95,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:01\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:01\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:18:05\\\\\\\"}\\\",\\\"run_times\\\":4,\\\"u_time\\\":\\\"2019-10-28T15:17:22\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '5c16f880d4b34ab48a595c63aa160cac', 1, 0, 1, '2019-10-28 15:18:05', 1, '2019-10-28 15:18:05', 0);
INSERT INTO `s_log_mq` VALUES (165, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"b7828d3433b448d9bacf66d771c98c76\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T15:18:01\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":95,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:01\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:01\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:18:05\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:17:22\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'b7828d3433b448d9bacf66d771c98c76', 1, 0, 1, '2019-10-28 15:18:05', 1, '2019-10-28 15:18:05', 0);
INSERT INTO `s_log_mq` VALUES (166, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"75da7c441bd94f978b6bae7e83b76c18\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:18:09\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":97,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:18:40\\\\\\\"}\\\",\\\"run_times\\\":5,\\\"u_time\\\":\\\"2019-10-28T15:18:09\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '75da7c441bd94f978b6bae7e83b76c18', 1, 0, 1, '2019-10-28 15:18:40', 1, '2019-10-28 15:18:40', 0);
INSERT INTO `s_log_mq` VALUES (167, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"cb5470dd5cd94ee68c1195ec546d8a7f\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":97,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:18:40\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:18:05\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'cb5470dd5cd94ee68c1195ec546d8a7f', 1, 0, 1, '2019-10-28 15:18:40', 1, '2019-10-28 15:18:40', 0);
INSERT INTO `s_log_mq` VALUES (168, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"c55c0dad441e42709ae0358c01ed4ac1\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:18:41\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":98,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:18:41\\\\\\\"}\\\",\\\"run_times\\\":6,\\\"u_time\\\":\\\"2019-10-28T15:18:41\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'c55c0dad441e42709ae0358c01ed4ac1', 1, 0, 1, '2019-10-28 15:19:38', 1, '2019-10-28 15:19:38', 0);
INSERT INTO `s_log_mq` VALUES (169, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"6c80f05cd1d54e9688fb0b01b9194da2\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":98,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:18:41\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:18:40\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '6c80f05cd1d54e9688fb0b01b9194da2', 1, 0, 1, '2019-10-28 15:19:39', 1, '2019-10-28 15:19:39', 0);
INSERT INTO `s_log_mq` VALUES (170, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"b5154c47819e4232a46d2b66ffdafbe6\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:19:39\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":99,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:19:39\\\\\\\"}\\\",\\\"run_times\\\":7,\\\"u_time\\\":\\\"2019-10-28T15:19:39\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'b5154c47819e4232a46d2b66ffdafbe6', 1, 0, 1, '2019-10-28 15:20:40', 1, '2019-10-28 15:20:40', 0);
INSERT INTO `s_log_mq` VALUES (171, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"32dfe7257bf3408aa25f38f1a827fda1\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":99,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:19:39\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:19:39\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '32dfe7257bf3408aa25f38f1a827fda1', 1, 0, 1, '2019-10-28 15:20:40', 1, '2019-10-28 15:20:40', 0);
INSERT INTO `s_log_mq` VALUES (172, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"1077268e8e054214930ac628595a0def\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:20:41\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":100,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:20:41\\\\\\\"}\\\",\\\"run_times\\\":8,\\\"u_time\\\":\\\"2019-10-28T15:20:41\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '1077268e8e054214930ac628595a0def', 1, 0, 1, '2019-10-28 15:22:17', 1, '2019-10-28 15:22:17', 0);
INSERT INTO `s_log_mq` VALUES (173, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"e855c40b84624f8ca29374353fbd8527\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T15:18:38\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":100,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:18:38\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:18:38\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:20:41\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:20:40\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'e855c40b84624f8ca29374353fbd8527', 1, 0, 1, '2019-10-28 15:22:17', 1, '2019-10-28 15:22:17', 0);
INSERT INTO `s_log_mq` VALUES (174, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"313c064f8cac44eb88c41b665fcef78c\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:22:21\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":102,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-28T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:22:41\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:22:21\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '313c064f8cac44eb88c41b665fcef78c', 1, 0, 1, '2019-10-28 15:22:41', 1, '2019-10-28 15:22:41', 0);
INSERT INTO `s_log_mq` VALUES (175, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"e219bd8d4be4410cb50690db22e93353\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:17:22\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":102,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-28T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:22:41\\\\\\\"}\\\",\\\"run_times\\\":9,\\\"u_time\\\":\\\"2019-10-28T15:22:19\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'e219bd8d4be4410cb50690db22e93353', 1, 0, 1, '2019-10-28 15:22:41', 1, '2019-10-28 15:22:41', 0);
INSERT INTO `s_log_mq` VALUES (176, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"a26edab4b2bd476a8705d03d005af1cb\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:22:44\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:23:52\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":105,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:23:52\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:23:52\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:23:54\\\\\\\"}\\\",\\\"run_times\\\":10,\\\"u_time\\\":\\\"2019-10-28T15:22:44\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'a26edab4b2bd476a8705d03d005af1cb', 1, 0, 1, '2019-10-28 15:23:54', 1, '2019-10-28 15:23:54', 0);
INSERT INTO `s_log_mq` VALUES (177, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"ad44dfe351974341917ecd8e9d0b8090\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:23:02\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2020-10-27T15:23:52\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":105,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2020-10-27T15:23:52\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-28T15:23:52\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:23:54\\\\\\\"}\\\",\\\"run_times\\\":10,\\\"u_time\\\":\\\"2019-10-28T15:23:02\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'ad44dfe351974341917ecd8e9d0b8090', 1, 0, 1, '2019-10-28 15:23:54', 1, '2019-10-28 15:23:54', 0);
INSERT INTO `s_log_mq` VALUES (178, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"e239d9a8333b4cf1aac69411c534df8b\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:24:04\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":107,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-27T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:24:20\\\\\\\"}\\\",\\\"run_times\\\":11,\\\"u_time\\\":\\\"2019-10-28T15:24:04\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', 'e239d9a8333b4cf1aac69411c534df8b', 1, 0, 1, '2019-10-28 15:24:20', 1, '2019-10-28 15:24:20', 0);
INSERT INTO `s_log_mq` VALUES (179, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"7f83f115522b416993abf1076ab819b6\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:23:02\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-27T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":107,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-27T00:00:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":false,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:24:20\\\\\\\"}\\\",\\\"run_times\\\":10,\\\"u_time\\\":\\\"2019-10-28T15:23:58\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '7f83f115522b416993abf1076ab819b6', 1, 0, 1, '2019-10-28 15:24:20', 1, '2019-10-28 15:24:20', 0);
INSERT INTO `s_log_mq` VALUES (180, '1', '通用队列，无回调', 'perfect-task-tentant-enable-exchange', 'perfect-task-tentant-enable.#', '{\"job_name\":\"租户定时任务：启用租户任务\",\"key\":\"2025f0ffd414441cb4fd41b66dce39e2\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-20T08:58:38\\\",\\\"concurrent\\\":false,\\\"id\\\":11,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，启用任务\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：启用租户任务[8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8][8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_enable_task\\\",\\\"job_simple_name\\\":\\\"租户启用任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:24:24\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-01T00:00:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":110,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-28T15:26:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:25:09\\\\\\\"}\\\",\\\"run_times\\\":12,\\\"u_time\\\":\\\"2019-10-28T15:24:24\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '2025f0ffd414441cb4fd41b66dce39e2', 1, 0, 1, '2019-10-28 15:25:10', 1, '2019-10-28 15:25:10', 0);
INSERT INTO `s_log_mq` VALUES (181, '1', '通用队列，无回调', 'perfect-task-tentant-disable-exchange', 'perfect-task-tentant-disable.#', '{\"job_name\":\"租户定时任务：停止启用租户任务\",\"key\":\"74d70b4d217b4fec971e5aa91885c5cb\",\"mqMessagePojo\":{\"messageBeanClass\":\"com.perfect.bean.entity.quartz.SJobEntity\",\"parameterJson\":\"{\\\"bean_name\\\":\\\"com.perfect.bean.vo.sys.config.tenant.STentantVo\\\",\\\"c_time\\\":\\\"2019-10-21T08:54:40\\\",\\\"concurrent\\\":false,\\\"id\\\":10,\\\"is_cron\\\":false,\\\"is_del\\\":false,\\\"job_desc\\\":\\\"系统自动生产该项任务:租户定时任务，停止启用租户\\\",\\\"job_group_code\\\":\\\"perfect_task_tentant\\\",\\\"job_group_name\\\":\\\"租户定时任务\\\",\\\"job_name\\\":\\\"租户定时任务：停止启用租户任务[8]\\\",\\\"job_serial_id\\\":8,\\\"job_serial_type\\\":\\\"s_job_disable_task\\\",\\\"job_simple_name\\\":\\\"租户停止任务\\\",\\\"last_run_time\\\":\\\"2019-10-28T15:24:32\\\",\\\"misfire_policy\\\":\\\"0\\\",\\\"next_run_time\\\":\\\"2019-10-28T15:26:00\\\",\\\"params\\\":\\\"{\\\\\\\"c_id\\\\\\\":1,\\\\\\\"c_time\\\\\\\":\\\\\\\"2019-09-24T23:49:26\\\\\\\",\\\\\\\"code\\\\\\\":\\\\\\\"aa\\\\\\\",\\\\\\\"dbversion\\\\\\\":110,\\\\\\\"descr\\\\\\\":\\\\\\\"aq\\\\\\\",\\\\\\\"disable_time\\\\\\\":\\\\\\\"2019-10-28T15:26:00\\\\\\\",\\\\\\\"enable_time\\\\\\\":\\\\\\\"2019-10-01T00:00:00\\\\\\\",\\\\\\\"id\\\\\\\":8,\\\\\\\"is_del\\\\\\\":false,\\\\\\\"is_enable\\\\\\\":true,\\\\\\\"is_freeze\\\\\\\":false,\\\\\\\"is_leaf\\\\\\\":false,\\\\\\\"name\\\\\\\":\\\\\\\"aaa1\\\\\\\",\\\\\\\"parent_name\\\\\\\":\\\\\\\"a\\\\\\\",\\\\\\\"parentid\\\\\\\":7,\\\\\\\"serial_no\\\\\\\":\\\\\\\"\\\\\\\",\\\\\\\"simple_name\\\\\\\":\\\\\\\"xx\\\\\\\",\\\\\\\"u_id\\\\\\\":1,\\\\\\\"u_time\\\\\\\":\\\\\\\"2019-10-28T15:25:09\\\\\\\"}\\\",\\\"run_times\\\":11,\\\"u_time\\\":\\\"2019-10-28T15:24:32\\\"}\"},\"name\":\"通用队列，无回调\",\"type\":\"1\"}', '74d70b4d217b4fec971e5aa91885c5cb', 1, 0, 1, '2019-10-28 15:25:10', 1, '2019-10-28 15:25:10', 0);

-- ----------------------------
-- Table structure for s_log_oper
-- ----------------------------
DROP TABLE IF EXISTS `s_log_oper`;
CREATE TABLE `s_log_oper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '操作日志记录',
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT NULL COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '方法名称',
  `operator_type` int(11) NULL DEFAULT NULL COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作人员',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '部门名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '请求URL',
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'ip',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作地点',
  `param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作状态（0正常 1异常）',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作时间',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE `s_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `root_id` bigint(20) NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID',
  `son_count` int(3) NULL DEFAULT NULL,
  `sort` int(3) NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` tinyint(1) NULL DEFAULT NULL COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `module_id` bigint(20) NULL DEFAULT NULL COMMENT '模块id',
  `path` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `route_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名，需要唯一，很重要，且需要vue这里手工录入',
  `meta_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `meta_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单icon',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `affix` tinyint(1) NULL DEFAULT NULL COMMENT '附在导航栏不可关闭',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `tentant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_route_name_1`(`route_name`) USING BTREE,
  UNIQUE INDEX `idx_route_name_2`(`code`, `tentant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_menu
-- ----------------------------
INSERT INTO `s_menu` VALUES (14, 'ce', '测试', 14, NULL, 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, '2019-11-05 10:46:34', 1, '2019-11-05 10:47:13', 3);
INSERT INTO `s_menu` VALUES (15, 'ce0001', '系统管理', 14, 14, 1, 0, 'c', 0, NULL, 2, '/sys', 'M00000010', '系统管理', '系统管理', '/views/01_dashboard/index', 0, '', NULL, 1, '2019-11-05 10:46:51', 1, '2019-11-05 10:47:24', 1);
INSERT INTO `s_menu` VALUES (16, 'ce0002', '字典管理', 14, 14, 2, 0, 'c', 0, NULL, 5, 'dic', 'M00000020', '字典管理', '字典管理', NULL, 0, '', NULL, 1, '2019-11-05 10:47:13', 1, '2019-11-05 10:47:44', 2);
INSERT INTO `s_menu` VALUES (17, 'ce00010001', '租户管理', 14, 15, 0, 0, 'm', 0, NULL, 9, 'tentant', 'P00000080', '租户管理', 'tentant', '/views/00_system/tentant/tentant', 0, '', NULL, 1, '2019-11-05 10:47:24', 1, '2019-11-05 10:47:24', 0);
INSERT INTO `s_menu` VALUES (18, 'ce00020001', '字典类型', 14, 16, 0, 0, 'm', 0, NULL, 6, 'dicttype', 'P00000030', '字典类型', '字典类型', '/views/00_system/dicttype/dicttype', 0, '', NULL, 1, '2019-11-05 10:47:35', 1, '2019-11-05 10:47:35', 0);
INSERT INTO `s_menu` VALUES (19, 'ce00020002', '字典数据', 14, 16, 0, 0, 'm', 0, NULL, 7, 'dictdata', 'P00000050', '字典数据', '字典数据', '/views/00_system/dictdata/dictdata', 0, '', NULL, 1, '2019-11-05 10:47:44', 1, '2019-11-05 10:47:44', 0);

-- ----------------------------
-- Table structure for s_module
-- ----------------------------
DROP TABLE IF EXISTS `s_module`;
CREATE TABLE `s_module`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块编号',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型：（m目录 c菜单 p页面）',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `template_id` bigint(20) NULL DEFAULT NULL COMMENT '模版id：资源文件中获取',
  `path` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `route_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由名，需要唯一，很重要，且需要vue这里手工录入',
  `meta_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `meta_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单icon',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `affix` tinyint(1) NULL DEFAULT NULL COMMENT '附在导航栏不可关闭',
  `perms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模块：目录、菜单、页面' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_module
-- ----------------------------
INSERT INTO `s_module` VALUES (1, 'Dashboard', 'm', '首页', NULL, '/dashboard', 'P00000070', '首页', 'dashboard', '', 1, NULL, '', 0, 1, '2019-10-31 16:04:03', 1, '2019-11-01 09:37:57', 1);
INSERT INTO `s_module` VALUES (2, 'sys', 'c', '系统管理', NULL, '/sys', 'M00000010', '系统管理', '系统管理', '/views/01_dashboard/index', 0, NULL, '', 0, 1, '2019-11-01 09:51:10', 1, '2019-11-01 10:02:30', 4);
INSERT INTO `s_module` VALUES (3, 'resource', 'm', '资源管理', NULL, 'resource', 'P00000020', '资源管理', '资源管理', '/views/00_system/resource/resource', 0, NULL, '', 0, 1, '2019-11-01 10:05:27', 1, '2019-11-01 10:05:27', 0);
INSERT INTO `s_module` VALUES (4, 'module', 'm', '模块编辑', NULL, 'module', 'P00000040', '模块编辑', '模块编辑', '/views/00_system/module/module', 0, NULL, '', 0, 1, '2019-11-01 10:06:05', 1, '2019-11-01 10:06:05', 0);
INSERT INTO `s_module` VALUES (5, 'dic', 'c', '字典管理', NULL, 'dic', 'M00000020', '字典管理', '字典管理', NULL, 0, NULL, '', 0, 1, '2019-11-01 10:26:50', 1, '2019-11-01 10:26:50', 0);
INSERT INTO `s_module` VALUES (6, 'dicttype', 'm', '字典类型', NULL, 'dicttype', 'P00000030', '字典类型', '字典类型', '/views/00_system/dicttype/dicttype', 0, NULL, '', 0, 1, '2019-11-01 10:27:38', 1, '2019-11-01 10:27:38', 0);
INSERT INTO `s_module` VALUES (7, 'dictdata', 'm', '字典数据', NULL, 'dictdata', 'P00000050', '字典数据', '字典数据', '/views/00_system/dictdata/dictdata', 0, NULL, '', 0, 1, '2019-11-01 10:28:12', 1, '2019-11-01 10:28:12', 0);
INSERT INTO `s_module` VALUES (8, 'config', 'm', '系统参数', NULL, 'config', 'P00000060', '系统参数', '系统参数', '/views/00_system/config/config', 0, NULL, '', 0, 1, '2019-11-01 10:28:53', 1, '2019-11-01 10:28:53', 0);
INSERT INTO `s_module` VALUES (9, 'tentant', 'm', '租户管理', NULL, 'tentant', 'P00000080', '租户管理', 'tentant', '/views/00_system/tentant/tentant', 0, NULL, '', 0, 1, '2019-11-01 10:29:23', 1, '2019-11-01 10:29:23', 0);
INSERT INTO `s_module` VALUES (10, 'org', 'c', '组织架构', NULL, 'org', 'M00000030', '组织架构', '组织架构', NULL, 0, NULL, '', 0, 1, '2019-11-01 10:30:04', 1, '2019-11-01 10:30:04', 0);
INSERT INTO `s_module` VALUES (11, 'group', 'm', '集团信息', NULL, 'group', 'P00000100', '集团信息', '集团信息', '/views/10_master/group/group', 0, NULL, '', 0, 1, '2019-11-01 10:30:44', 1, '2019-11-01 10:31:07', 1);
INSERT INTO `s_module` VALUES (12, 'company', 'm', '企业信息', NULL, 'company', 'P00000110', '企业信息', '企业信息', '/views/10_master/company/company', 0, NULL, '', 0, 1, '2019-11-01 10:31:36', 1, '2019-11-04 09:28:58', 2);

-- ----------------------------
-- Table structure for s_module_button
-- ----------------------------
DROP TABLE IF EXISTS `s_module_button`;
CREATE TABLE `s_module_button`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮编号：字典表过来',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮名称',
  `sort` int(2) NULL DEFAULT NULL COMMENT '排序',
  `perms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '页面id，',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '模块按钮信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_resource
-- ----------------------------
DROP TABLE IF EXISTS `s_resource`;
CREATE TABLE `s_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'excel导入模板文件：10，静态配置文件：20，静态图片文件：30，json\n',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '资源名称',
  `uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '相对路径',
  `base` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '文件系统的baseurl',
  `file_size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
  `extension` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '文件扩展名',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户名称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'json配置信息',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_resource
-- ----------------------------
INSERT INTO `s_resource` VALUES (2, '10', '字典类型上传模板', '', '', 0, '', '', '', '字典类型上传模板', '{\"dataRows\": {\"dataCols\": [{\"name\": \"name\", \"index\": 0}, {\"name\": \"code\", \"index\": 1}, {\"name\": \"descr\", \"index\": 2}]}, \"titleRows\": [{\"cols\": [{\"title\": \"字典名称\", \"colSpan\": 1}, {\"title\": \"字典编号\", \"colSpan\": 1}, {\"title\": \"描述\", \"colSpan\": 1}]}]}', 0, 1, '2019-09-10 08:38:31', 1, '2019-09-18 03:51:03', 3);

-- ----------------------------
-- Table structure for s_role
-- ----------------------------
DROP TABLE IF EXISTS `s_role`;
CREATE TABLE `s_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色类型',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色名称',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简称',
  `isdel` tinyint(1) NULL DEFAULT NULL COMMENT '是否是已经删除(1:true-已删除,0:false-未删除)\n',
  `isenable` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用(1:true-未启用,0:false-已启用)\n\n',
  `corp_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户代码',
  `corp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '租户名称',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_tenant
-- ----------------------------
DROP TABLE IF EXISTS `s_tenant`;
CREATE TABLE `s_tenant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父节点id',
  `serial_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统编码',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `simple_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '简称',
  `is_enable` tinyint(1) NULL DEFAULT NULL COMMENT '是否已启用',
  `enable_time` datetime(0) NULL DEFAULT NULL COMMENT '生效日期',
  `disable_time` datetime(0) NULL DEFAULT NULL COMMENT '失效日期',
  `is_freeze` tinyint(1) NULL DEFAULT NULL COMMENT '是否冻结',
  `is_leaf` tinyint(1) NULL DEFAULT NULL COMMENT '是否叶子节点',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '级次',
  `sort` tinyint(4) NULL DEFAULT NULL COMMENT '排序',
  `descr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '描述',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `c_id` bigint(20) NULL DEFAULT NULL,
  `c_time` datetime(0) NULL DEFAULT NULL,
  `u_id` bigint(20) NULL DEFAULT NULL,
  `u_time` datetime(0) NULL DEFAULT NULL,
  `dbversion` int(11) NULL DEFAULT 0 COMMENT '数据版本，乐观锁使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '租户主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_tenant
-- ----------------------------
INSERT INTO `s_tenant` VALUES (1, NULL, '0001', '1', '根目录', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-10-09 01:22:29', 1, '2019-10-09 01:22:29', 0);
INSERT INTO `s_tenant` VALUES (2, 1, '00010001', '2', '子目录1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `s_tenant` VALUES (3, 1, '00010002', '3', '子目录2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `s_tenant` VALUES (4, 2, NULL, '4', '4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-10-09 05:45:17', 1, '2019-10-09 05:45:17', 0);
INSERT INTO `s_tenant` VALUES (5, NULL, NULL, 'q', 'q', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2019-10-09 06:42:21', 1, '2019-10-09 06:42:21', 0);
INSERT INTO `s_tenant` VALUES (6, 5, '', 'qq', 'qq', 'aa', 0, '2019-10-22 07:38:47', '2020-10-21 07:38:47', 0, 0, NULL, NULL, '1', 0, 1, '2019-10-07 22:43:27', 1, '2019-10-22 07:38:49', 4);
INSERT INTO `s_tenant` VALUES (7, 5, '', 'a', 'a', 'aaaaa', 0, '2019-10-22 05:46:33', '2019-10-29 05:46:33', 0, 0, NULL, NULL, 'a', 0, 1, '2019-10-07 23:42:11', 1, '2019-10-22 05:46:36', 4);
INSERT INTO `s_tenant` VALUES (8, 7, '', 'aa', 'aaa1', 'xx', 1, '2019-10-01 00:00:00', '2019-10-28 15:26:00', 0, 0, NULL, NULL, 'aq', 0, 1, '2019-09-24 23:49:26', 1, '2019-10-28 15:26:04', 112);

-- ----------------------------
-- View structure for v_areas_info
-- ----------------------------
DROP VIEW IF EXISTS `v_areas_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_areas_info` AS SELECT
  t3.id as province_id,
	t1.province_code,
	t3.`name` province_name,
	t2.id as city_id,
	t1.city_code,
	t2.`name` AS city_name,
	t1.id as area_id,
	t1.`code` AS area_code,
	t1.NAME AS area_name,
	CONCAT_WS(',',t3.id,t2.id,t1.id) as cascader_id,
	CONCAT_WS(',',t3.code,t2.`code`,t1.`code`) as cascader_code,
	CONCAT_WS(',',t3.`name`,t2.`name`,t1.`name`) as cascader_name
from
	s_areas t1
	LEFT JOIN s_area_cities t2 ON t1.city_code = t2.`code` 	AND t1.province_code = t2.province_code
	LEFT JOIN s_area_provinces t3 ON t1.province_code = t3.`code` ;

-- ----------------------------
-- View structure for v_areas_tree
-- ----------------------------
DROP VIEW IF EXISTS `v_areas_tree`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_areas_tree` AS SELECT
	t1.`code` id,
	t1.`name`,
	t1.province_code  parent_id
FROM
	s_area_cities AS t1 
UNION ALL
SELECT
	t2.`code` id,
	t2.`name`, 
	null as parent_id 
FROM
	s_area_provinces AS t2 
union all
SELECT
	t3.`code` id,
	t3.`name`, 
	t3.city_code as parent_id 
FROM
	s_areas AS t3 ;

-- ----------------------------
-- View structure for v_dict_info
-- ----------------------------
DROP VIEW IF EXISTS `v_dict_info`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_dict_info` AS SELECT 
    t1.name, t2.label,t1.code,t2.dict_value,t1.is_del
FROM
    s_dict_type t1 
	INNER JOIN s_dict_data t2 ON t1.id = t2.dict_type_id ;

SET FOREIGN_KEY_CHECKS = 1;
