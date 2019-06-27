-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for Win64 (AMD64)
--
-- Host: db.hspaas.cn    Database: hsboss
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `hsboss_menu`
--

DROP TABLE IF EXISTS `hsboss_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsboss_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_code` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '-1',
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_position` int(11) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsboss_menu`
--

LOCK TABLES `hsboss_menu` WRITE;
/*!40000 ALTER TABLE `hsboss_menu` DISABLE KEYS */;
INSERT INTO `hsboss_menu` VALUES (1,'基础信息','1000',-1,NULL,1,'fa-user'),(2,'客户信息','1001',1,NULL,1,'fa-user'),(3,'客户基础信息','1001001',2,'/base/customer',1,NULL),(4,'余额','1001001003',3,NULL,1,NULL),(5,'参数配置管理','1001002',2,'/base/system_config',2,NULL),(6,'公告管理','1002',1,NULL,2,'fa-comment'),(7,'公告管理','1002001',6,'/base/notification',1,NULL),(8,'站内消息','1002002',6,'/base/notification_message',2,NULL),(9,'套餐管理','1003',1,NULL,3,'fa-shopping-cart'),(10,'套餐管理','1003001',9,'/base/combo',1,NULL),(11,'套餐购买充值记录','1003002',9,'/base/combo_record',2,NULL),(12,'产品管理','1003003',9,'/base/product',3,NULL),(13,'通道模板配置','1004',1,NULL,4,NULL),(14,'通道模板配置','1004001',13,'/base/passage_template',1,NULL),(15,'短信','2000',-1,NULL,2,'fa-envelope'),(16,'短信记录查询','2001',15,NULL,1,'fa-table'),(17,'待处理短信任务','2001001',16,'/sms/record/under_way_list',1,NULL),(18,'短信发送记录','2001002',16,'/sms/record/send_record_list',2,NULL),(19,'已完成短信任务','2001003',16,'/sms/record/completed_list',3,NULL),(20,'短信上行接收记录','2001004',16,'/sms/record/up_revice_list',4,NULL),(21,'短信调用失败记录','2001005',16,'/sms/record/invoke_fail_list',5,NULL),(22,'短信处理失败记录','2001006',16,'/sms/record/disponse_fail_list',6,NULL),(23,'模板管理','2002',15,'/sms/message_template',2,'fa-file'),(24,'通道管理','2003',15,NULL,3,'fa-retweet'),(25,'通道管理','2003001',24,'/sms/passage',1,NULL),(26,'通道组管理','2003002',24,'/sms/passage_group',2,NULL),(27,'用户运行中通道管理','2003004',24,'/sms/passage_access',3,NULL),(28,'通道轮训控制管理','2003005',24,'/sms/passage_control',4,NULL),(29,'通道短信模板管理','2003006',24,'/sms/passage_message_template',5,NULL),(30,'黑白名单管理','2004',15,NULL,4,'fa-wrench'),(31,'黑名单管理','2004001',30,'/sms/black_list',1,NULL),(32,'白名单管理','2004002',30,'/sms/white_list',2,NULL),(33,'敏感词管理','2004003',30,'/sms/forbidden_word',3,NULL),(34,'服务器IP白名单','2004004',30,'/sms/host_white',4,NULL),(35,'优先级词库','2004005',30,'/sms/priority_words',5,NULL),(36,'签名扩展管理','2005',15,'/sms/signature_extno',5,'fa-crosshairs'),(37,'流量','3000',0,NULL,-1,'fa-plane'),(38,'接入商管理','3001',37,'/customer/index',1,'fa-sliders'),(39,'通道管理','3002',37,NULL,2,'fa-ban'),(40,'通道管理','3002001',39,'/customer/add',1,NULL),(41,'通道组管理','3002002',39,'/customer/add',2,NULL),(42,'流量充值记录','3003',37,NULL,3,'fa-table'),(43,'处理中的记录','3003001',42,'/feelog/index',1,NULL),(44,'已完成的记录','3003002',42,'/feelog/index',2,NULL),(45,'流量包管理','3004',37,'/feelog/index',4,'fa-magnet'),(46,'语音','4000',0,NULL,-1,'fa-volume-up'),(47,'接入商管理','4001',46,'/customer/index',1,'fa-sliders'),(48,'通道管理','4002',46,NULL,2,'fa-retweet'),(49,'通道管理','4002001',48,'/customer/add',1,NULL),(50,'通道组管理','4002002',48,'/customer/add',2,NULL),(51,'语音发送记录','4003',46,NULL,3,'fa-table'),(52,'处理中的记录','4003001',51,'/feelog/index',1,NULL),(53,'已完成的记录','4003002',51,'/feelog/index',2,NULL),(54,'报表','5000',-1,NULL,5,'fa-th'),(55,'短信统计','5001',54,NULL,1,'fa-envelope'),(56,'客户通道发送统计','5001001',55,'/report/sms/user_passage_send_report',1,NULL),(57,'客户发送统计','5001002',55,'/report/sms/user_send_report',2,NULL),(58,'通道发送统计','5001003',55,'/report/sms/passage_send_report',3,NULL),(59,'通道发送统计','5001004',55,'/report/sms/province_send_report',4,NULL),(60,'流量消费统计','5002',54,NULL,2,'fa-plane'),(61,'客户消费统计','5002001',60,'/customer/add',1,NULL),(62,'上家统计','5002002',60,'/customer/add',2,NULL),(63,'账单统计','5002003',60,'/customer/add',3,NULL),(64,'套餐统计','5003',54,'/feelog/index',3,'fa-tty'),(65,'系统','6000',-1,NULL,6,'fa-cog'),(66,'用户管理','6001',65,'/boss/user',1,'fa-users'),(67,'角色管理','6002',65,'/boss/role',2,'fa-check'),(68,'日志管理','6003',65,'/boss/log',3,'fa-book'),(69,'密码管理','6004',65,'/boss/password',4,'fa-lock'),(70,'财务','7000',-1,NULL,7,'fa-usd'),(71,'发票管理','7001',70,'/base/invoice',1,'fa-euro'),(72,'用户账户余额管理','7002',70,'/base/user_balance',2,'fa-gbp'),(73,'监控中心','8000',-1,NULL,8,'fa-bell'),(74,'通道监控中心','8001',73,NULL,1,'fa-exclamation-circle'),(75,'通道自取报告','8001001',74,'/monitor/inviteIndex',1,NULL),(76,'通道状态监控','8001002',74,'/monitor/inviteIndex',2,NULL),(77,'通道告警查询','8002',73,NULL,2,'fa-gears'),(78,'回执率失标查询','8002001',77,'/monitor/inviteIndex',1,NULL),(79,'短信通道监控设置','8003',73,'/monitor/reachrateSettings',3,'fa-comments'),(80,'彩信','10000',-1,NULL,3,'fa-photo'),(81,'彩信记录查询','10001',80,NULL,1,'fa-table'),(82,'待处理彩信任务','10001001',81,'/mms/record/under_way_list',1,NULL),(83,'彩信发送记录','10001002',81,'/mms/record/send_record_list',2,NULL),(84,'已完成彩信任务','10001003',81,'/mms/record/completed_list',3,NULL),(85,'彩信上行接收记录','10001004',81,'/mms/record/up_revice_list',4,NULL),(86,'彩信模板管理','10002',80,'/mms/message_template',2,'fa-file'),(87,'通道管理','10003',80,NULL,3,'fa-retweet'),(88,'通道管理','10003001',87,'/mms/passage',1,NULL),(89,'通道组管理','10003002',87,'/mms/passage_group',2,NULL),(90,'用户运行中通道管理','10003003',87,'/mms/passage_access',3,NULL);
/*!40000 ALTER TABLE `hsboss_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsboss_oper`
--

DROP TABLE IF EXISTS `hsboss_oper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsboss_oper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oper_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `oper_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsboss_oper`
--

LOCK TABLES `hsboss_oper` WRITE;
/*!40000 ALTER TABLE `hsboss_oper` DISABLE KEYS */;
INSERT INTO `hsboss_oper` VALUES (1,'新增客户','1001001001',3),(2,'编辑','1001001002',3),(3,'余额','1001001003001',4),(4,'告警设置','1001001003002',4),(5,'禁止告警','1001001003003',4),(6,'冲扣值日志','1001001003004',4),(7,'模板','1001001004',3),(8,'禁用','1001001005',3),(9,'编辑','1001002001',5),(10,'发布公告','1002001001',7),(11,'编辑','1002001002',7),(12,'禁用','1002001003',7),(13,'删除','1002001004',7),(14,'发送站内消息','1002002001',8),(15,'编辑','1002002002',8),(16,'删除','1002002003',8),(17,'套餐管理操作','1003001001',10),(18,'新增','1003001002',10),(19,'编辑','1003001003',10),(20,'删除','1003001004',10),(21,'下线/启用','1003001005',10),(22,'套餐购买充值记录操作','1003002001',11),(23,'产品管理','1003003001',12),(24,'新增','1003003002',12),(25,'编辑','1003003003',12),(26,'删除','1003003004',12),(27,'禁用','1003003005',12),(28,'添加','1004001001',14),(29,'编辑','1004001002',14),(30,'删除','1004001003',14),(31,'审核通过','2001001001',17),(32,'同内容批放','2001001002',17),(33,'驳回','2001001003',17),(34,'同内容驳回','2001001004',17),(35,'切换通道','2001001005',17),(36,'重新分包','2001001006',17),(37,'修改内容','2001001007',17),(38,'子任务','2001001008',17),(39,'模板报备','2001001009',17),(40,'敏感词导白','2001001010',17),(41,'短信发送记录','2001002001',18),(42,'子任务','2001003001',19),(43,'发送记录','2001003002',19),(44,'模板','2001003003',19),(45,'短信发送记录','2001004001',20),(46,'短信调用失败记录','2001005001',21),(47,'短信调用失败记录','2001006001',22),(48,'重载redis','2002001',23),(49,'添加模板','2002002',23),(50,'编辑','2002003',23),(51,'删除','2002004',23),(52,'测试','2002005',23),(53,'审批','2002006',23),(54,'添加','2003001001',25),(55,'编辑','2003001002',25),(56,'删除','2003001003',25),(57,'禁用','2003001004',25),(58,'断连接','2003001005',25),(59,'测试','2003001006',25),(60,'添加通道组','2003002001',26),(61,'编辑','2003002002',26),(62,'重载redis','2003004001',27),(63,'编辑','2003004002',27),(64,'添加轮询控制','2003005001',28),(65,'编辑','2003005002',28),(66,'启用|停用','2003005003',28),(67,'删除','2003005004',28),(68,'添加模板','2003006001',29),(69,'编辑','2003006002',29),(70,'删除','2003006003',29),(71,'测试','2003006004',29),(72,'重载redis','2004001001',31),(73,'新增黑名单','2004001002',31),(74,'删除','2004001003',31),(75,'新增白名单','2004002001',32),(76,'删除','2004002002',32),(77,'重载redis','2004003001',33),(78,'新增敏感词','2004003002',33),(79,'编辑','2004003003',33),(80,'删除','2004003004',33),(81,'重载redis','2004004001',34),(82,'新增白名单','2004004002',34),(83,'删除','2004004003',34),(84,'新增优先级词库','2004005001',35),(85,'编辑','2004005002',35),(86,'关闭','2004005003',35),(87,'删除','2004005004',35),(88,'重载redis','2005001',36),(89,'添加签名','2005002',36),(90,'编辑','2005003',36),(91,'删除','2005004',36),(92,'接入商管理操作','3001001',38),(93,'通道管理操作','3002001001',40),(94,'通道组管理操作','3002002001',41),(95,'处理中的记录操作','3003001001',43),(96,'已完成的记录操作','3003002001',44),(97,'流量包管理操作','3004001',45),(98,'接入商管理操作','4001001',47),(99,'通道管理操作','4002001001',49),(100,'通道组管理操作','4002002001',50),(101,'处理中的记录操作','4003001001',52),(102,'已完成的记录操作','4003002001',53),(103,'图表','5001001001',56),(104,'图表','5001002001',57),(105,'图表','5001003001',58),(106,'图表','5001004001',59),(107,'客户消费统计操作','5002001001',61),(108,'上家统计操作','5002002001',62),(109,'账单统计操作','5002003001',63),(110,'套餐统计操作','5003001',64),(111,'新增用户','6001001',66),(112,'编辑','6001002',66),(113,'删除','6001003',66),(114,'新增角色','6002001',67),(115,'编辑','6002002',67),(116,'删除','6002003',67),(117,'设置权限','6002004',67),(118,'日志管理操作','6003001',68),(119,'密码管理操作','6004001',69),(120,'新增发票','7001001',71),(121,'处理','7001002',71),(122,'查看','7001003',71),(123,'冲扣值','7002001',72),(124,'告警设置','7002002',72),(125,'禁止告警','7002003',72),(126,'冲扣值日志','7002004',72),(127,'通道自取报告','8001001001',75),(128,'通道状态监控','8001002001',76),(129,'回执率失标查询','8002001001',78),(130,'添加通道监控设置','8003001',79),(131,'编辑','8003002',79),(132,'启用|停用','8003003',79),(133,'审核通过','10001001001',82),(134,'同内容批放','10001001002',82),(135,'驳回','10001001003',82),(136,'同内容驳回','10001001004',82),(137,'切换通道','10001001005',82),(138,'重新分包','10001001006',82),(139,'修改内容','10001001007',82),(140,'子任务','10001001008',82),(141,'彩信发送记录','10001002001',83),(142,'子任务','10001003001',84),(143,'发送记录','10001003002',84),(144,'彩信发送记录','10001004001',85),(145,'编辑','10002001',86),(146,'审批','10002002',86),(147,'预览','10002003',86),(148,'报备','10002004',86),(149,'添加','10003001001',88),(150,'编辑','10003001002',88),(151,'删除','10003001003',88),(152,'禁用','10003001004',88),(153,'添加通道组','10003002001',89),(154,'编辑','10003002002',89),(155,'重载redis','10003003001',90),(156,'编辑','10003003002',90);
/*!40000 ALTER TABLE `hsboss_oper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsboss_role`
--

DROP TABLE IF EXISTS `hsboss_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsboss_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `memo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsboss_role`
--

LOCK TABLES `hsboss_role` WRITE;
/*!40000 ALTER TABLE `hsboss_role` DISABLE KEYS */;
INSERT INTO `hsboss_role` VALUES (6,'管理员',NULL,'2018-09-03 01:53:29','admin'),(7,'基础信息测试','2','2018-11-01 21:33:26','admin'),(8,'短信员','啊啊大','2018-11-10 01:02:08','admin'),(9,'客服','测试','2018-11-10 01:08:07','admin');
/*!40000 ALTER TABLE `hsboss_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsboss_role_oper_ref`
--

DROP TABLE IF EXISTS `hsboss_role_oper_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsboss_role_oper_ref` (
  `role_id` int(11) DEFAULT NULL,
  `oper_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsboss_role_oper_ref`
--

LOCK TABLES `hsboss_role_oper_ref` WRITE;
/*!40000 ALTER TABLE `hsboss_role_oper_ref` DISABLE KEYS */;
INSERT INTO `hsboss_role_oper_ref` VALUES (7,10),(7,11),(7,12),(7,121),(7,13),(7,14),(7,15),(7,123),(7,126),(7,16),(7,17),(7,127),(7,128),(7,18),(7,19),(7,20),(7,21),(7,22),(7,23),(7,29),(7,30),(7,34),(7,35),(7,36),(7,40),(7,41),(7,46),(7,48),(7,51),(7,53),(7,54),(7,57),(7,58),(7,61),(7,62),(7,64),(7,66),(7,67),(7,68),(7,70),(7,71),(7,73),(7,74),(7,75),(7,76),(7,78),(7,79),(7,92),(7,111),(7,112),(7,113),(7,114),(7,115),(7,117),(7,119),(7,120),(9,3),(9,1),(9,7),(9,9),(9,10),(9,11),(9,12),(9,121),(9,13),(9,14),(9,122),(9,15),(9,123),(9,124),(9,125),(9,126),(9,16),(9,17),(9,127),(9,128),(9,129),(9,130),(9,18),(9,19),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,132),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(9,35),(9,36),(9,37),(9,38),(9,131),(9,39),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(9,47),(9,48),(9,49),(9,50),(9,51),(9,52),(9,53),(9,54),(9,55),(9,56),(9,57),(9,58),(9,59),(9,60),(9,61),(9,62),(9,63),(9,64),(9,65),(9,66),(9,67),(9,68),(9,69),(9,70),(9,71),(9,72),(9,73),(9,74),(9,75),(9,76),(9,77),(9,78),(9,79);
/*!40000 ALTER TABLE `hsboss_role_oper_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsboss_user`
--

DROP TABLE IF EXISTS `hsboss_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsboss_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `real_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `disabled_flag` tinyint(2) DEFAULT '0',
  `delete_flag` tinyint(2) DEFAULT '0',
  `super_flag` tinyint(2) DEFAULT '0',
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `mfa` varchar(32) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsboss_user`
--

LOCK TABLES `hsboss_user` WRITE;
/*!40000 ALTER TABLE `hsboss_user` DISABLE KEYS */;
INSERT INTO `hsboss_user` VALUES (1,'admin','超级管理员','96E79218965EB72C92A549DD5A330112',NULL,0,0,1,NULL,'3E37KTPUFANG57KG','2019-06-11 00:58:08','0:0:0:0:0:0:0:1','2016-06-22 17:50:26',NULL),(10,'zhengying','郑营','2e35b3c6530b443d5aea5fc6c29e436d','15868193450',0,0,0,NULL,'FR4XV4X2JJRZQQ2K','2018-11-01 21:34:38','0:0:0:0:0:0:0:1','2018-10-31 21:59:57','admin'),(11,'lizheng','李政','2e35b3c6530b443d5aea5fc6c29e436d','15858264179',0,0,0,NULL,'ANIMWQHCZB2Y364K','2018-11-03 12:23:46','0:0:0:0:0:0:0:1','2018-11-03 06:57:27','admin'),(12,'kefu','任','2e35b3c6530b443d5aea5fc6c29e436d','18368031231',0,0,0,NULL,'AAP4AYABT5FCGBSZ','2018-11-10 01:26:45','192.168.1.105','2018-11-10 01:08:48','admin');
/*!40000 ALTER TABLE `hsboss_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsboss_user_role_ref`
--

DROP TABLE IF EXISTS `hsboss_user_role_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsboss_user_role_ref` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsboss_user_role_ref`
--

LOCK TABLES `hsboss_user_role_ref` WRITE;
/*!40000 ALTER TABLE `hsboss_user_role_ref` DISABLE KEYS */;
INSERT INTO `hsboss_user_role_ref` VALUES (10,7),(11,7),(12,9);
/*!40000 ALTER TABLE `hsboss_user_role_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hsboss'
--
