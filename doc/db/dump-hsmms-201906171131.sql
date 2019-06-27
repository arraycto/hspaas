-- MySQL dump 10.16  Distrib 10.3.9-MariaDB, for Win64 (AMD64)
--
-- Host: db.hspaas.cn    Database: hsmms
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
-- Table structure for table `mms_message_template`
--

DROP TABLE IF EXISTS `mms_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_message_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '作为用户在系统中的唯一标识',
  `model_id` varchar(64) NOT NULL COMMENT '模板ID',
  `user_id` int(11) NOT NULL COMMENT '归属用户',
  `name` varchar(32) DEFAULT NULL COMMENT '速记名（方便记住）',
  `title` varchar(128) DEFAULT NULL COMMENT '模板标题',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '0：待平台审核，1:平台处理中 2：平台审批通过，3：平台审核失败',
  `is_running` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:运行中，1：停用',
  `app_type` int(4) DEFAULT '1' COMMENT '操作方式，1:融合WEB平台,2:开发者平台,3:运营支撑系统',
  `notice_mode` int(4) DEFAULT '0' COMMENT '审核后短信通知类型,0:不需要通知，1：需要通知',
  `mobile` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '审核后通知的手机号码',
  `submit_interval` int(8) NOT NULL DEFAULT '30' COMMENT '短信提交时间间隔（同一号码）',
  `limit_times` int(8) DEFAULT '10' COMMENT '短信每天提交次数上限（同一号码）',
  `route_type` int(4) NOT NULL DEFAULT '0' COMMENT '模板路由类型',
  `priority` int(4) NOT NULL DEFAULT '5' COMMENT '优先级（越大越优先）',
  `ext_number` varchar(32) DEFAULT NULL COMMENT '扩展号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approve_user` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '审批账号',
  `approve_desc` varchar(100) DEFAULT NULL COMMENT '审批描述',
  `remark` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_template_model_id` (`model_id`),
  KEY `index_mms_message_template_user_id_status` (`user_id`,`status`,`priority`),
  KEY `idx_mms_template_status` (`status`),
  KEY `indx_mms_template_status_routetype` (`user_id`,`status`,`route_type`),
  KEY `indx_mms_template_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_message_template`
--

LOCK TABLES `mms_message_template` WRITE;
/*!40000 ALTER TABLE `mms_message_template` DISABLE KEYS */;
INSERT INTO `mms_message_template` VALUES (1,'2228165895610435589',90,'爱的色放','阿萨德饭是',0,0,2,0,NULL,30,10,0,5,NULL,'2019-04-05 03:30:48','2019-04-05 16:30:47',NULL,NULL,NULL,NULL),(5,'2228448803512387591',97,'测试1231','按时打',2,0,2,0,NULL,30,10,0,5,NULL,'2019-04-05 12:52:53','2019-04-06 01:52:52','2019-04-05 14:07:22',NULL,NULL,NULL),(6,'2232718347621894144',97,'深度认识 Sharding-JDBC：做最轻量级的数据库中间层','深度认识 Sharding-JDBC：做最轻量级的数据库中间层',0,0,2,0,NULL,30,10,0,5,NULL,'2019-04-11 10:15:43','2019-04-11 23:15:40',NULL,NULL,NULL,NULL),(7,'2233972666539182084',97,'测试呵呵','阿萨德看就按扣量啥的呵呵',0,0,2,0,NULL,30,10,0,5,NULL,'2019-04-13 03:47:49','2019-04-13 16:47:47',NULL,NULL,NULL,NULL),(8,'2233975406409549824',97,'测试呵呵','阿萨德看就按扣量啥的呵呵',2,0,2,0,NULL,30,10,0,5,NULL,'2019-04-13 03:53:16','2019-04-13 16:53:13','2019-04-13 04:18:23',NULL,NULL,NULL);
/*!40000 ALTER TABLE `mms_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_message_template_body`
--

DROP TABLE IF EXISTS `mms_message_template_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_message_template_body` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(20) NOT NULL COMMENT '模板ID',
  `media_name` varchar(100) NOT NULL COMMENT '文件名称',
  `media_type` varchar(32) NOT NULL COMMENT '多媒体类型，如text,image,video,audio',
  `content` varchar(500) NOT NULL COMMENT '内容，如文本内容，URL等',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '顺序，即第几桢',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `indx_message_body_template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_message_template_body`
--

LOCK TABLES `mms_message_template_body` WRITE;
/*!40000 ALTER TABLE `mms_message_template_body` DISABLE KEYS */;
INSERT INTO `mms_message_template_body` VALUES (1,1,'txt','text','custom_body_file/text/2228165891885893640',1,'2019-04-05 16:30:47','2019-04-05 16:30:47'),(2,1,'jpg','image','custom_body_file/image/2228165891919448069',2,'2019-04-05 16:30:47','2019-04-05 16:30:47'),(3,1,'txt','text','custom_body_file/text/2228165891919448065',3,'2019-04-05 16:30:47','2019-04-05 16:30:47'),(4,1,'txt','text','custom_body_file/text/2228165891919448065',4,'2019-04-05 16:30:47','2019-04-05 16:30:47'),(5,2,'txt','text','custom_body_file/text/2228427076573071360',1,'2019-04-06 01:09:46','2019-04-06 01:09:46'),(6,2,'jpg','image','custom_body_file/image/2228427076715677701',2,'2019-04-06 01:09:46','2019-04-06 01:09:46'),(7,2,'mp4','video','custom_body_file/video/2228427076992501766',3,'2019-04-06 01:09:46','2019-04-06 01:09:46'),(8,3,'txt','text','custom_body_file/text/2228427959323068425',1,'2019-04-06 01:11:30','2019-04-06 01:11:30'),(9,3,'jpg','image','custom_body_file/image/2228427959348234245',2,'2019-04-06 01:11:30','2019-04-06 01:11:30'),(10,3,'mp4','video','custom_body_file/video/2228427959541172227',3,'2019-04-06 01:11:30','2019-04-06 01:11:30'),(11,4,'txt','text','custom_body_file/text/2228430198938798088',1,'2019-04-06 01:15:55','2019-04-06 01:15:55'),(12,4,'jpg','image','custom_body_file/image/2228430198955575303',2,'2019-04-06 01:15:55','2019-04-06 01:15:55'),(13,5,'txt','text','custom_body_file/text/2228448784235366403',1,'2019-04-06 01:52:53','2019-04-06 01:52:53'),(14,5,'jpg','image','custom_body_file/image/aqwe.jpg',2,'2019-04-06 01:52:53','2019-04-06 01:52:53'),(15,5,'MP4','video','custom_body_file/image/5bfce94e9588d.mp4',3,'2019-04-06 01:52:53','2019-04-06 01:52:53'),(16,6,'txt','text','custom_body_file/text/2232718336515377152',1,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(17,6,'jpg','image','custom_body_file/image/2232718336775424009',2,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(18,6,'jpg','image','custom_body_file/image/2232718336842532867',3,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(19,6,'txt','text','custom_body_file/text/2232718336842532865',4,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(20,6,'mp3','audio','custom_body_file/audio/2232718336951584769',5,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(21,6,'mp4','video','custom_body_file/video/2232718337236797443',6,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(22,6,'txt','text','custom_body_file/text/2232718337236797441',7,'2019-04-11 23:15:40','2019-04-11 23:15:40'),(23,7,'mp4','video','custom_body_file/video/2233972661187250183',1,'2019-04-13 16:47:47','2019-04-13 16:47:47'),(24,7,'txt','text','custom_body_file/text/2233972661187250177',2,'2019-04-13 16:47:47','2019-04-13 16:47:47'),(25,7,'jpg','image','custom_body_file/image/2233972661187250177',3,'2019-04-13 16:47:47','2019-04-13 16:47:47'),(26,7,'txt','text','custom_body_file/text/2233972661187250177',4,'2019-04-13 16:47:47','2019-04-13 16:47:47'),(27,8,'mp4','video','custom_body_file/video/2233975401862924290',1,'2019-04-13 16:53:13','2019-04-13 16:53:13'),(28,8,'txt','text','custom_body_file/text/2233975401862924289',2,'2019-04-13 16:53:13','2019-04-13 16:53:13'),(29,8,'jpg','image','custom_body_file/image/2233975401888090113',3,'2019-04-13 16:53:13','2019-04-13 16:53:13'),(30,8,'txt','text','custom_body_file/text/2233975401896478724',4,'2019-04-13 16:53:13','2019-04-13 16:53:13');
/*!40000 ALTER TABLE `mms_message_template_body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mo_message_push`
--

DROP TABLE IF EXISTS `mms_mo_message_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mo_message_push` (
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '消息ID',
  `mobile` varchar(6000) CHARACTER SET utf8 NOT NULL COMMENT '手机号码',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推送内容',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态,0：成功，1：失败',
  `retry_times` int(4) DEFAULT '1' COMMENT '重试次数',
  `response_milliseconds` bigint(20) DEFAULT NULL COMMENT '推送相应时间',
  `response_content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '响应内容',
  `create_time` datetime NOT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mt下行短信t提交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mo_message_push`
--

LOCK TABLES `mms_mo_message_push` WRITE;
/*!40000 ALTER TABLE `mms_mo_message_push` DISABLE KEYS */;
/*!40000 ALTER TABLE `mms_mo_message_push` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mo_message_receive`
--

DROP TABLE IF EXISTS `mms_mo_message_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mo_message_receive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT '0' COMMENT '用户编号',
  `passage_id` int(11) DEFAULT '0' COMMENT '通道标识',
  `msg_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信标识',
  `mobile` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户手机号',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
  `destnation_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '服务号长号码',
  `need_push` tinyint(1) DEFAULT '0' COMMENT '是否需要推送，0：不需要，1：需要',
  `push_url` varchar(128) DEFAULT NULL COMMENT '推送地址',
  `receive_time` varchar(64) DEFAULT NULL COMMENT '收到信息的时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_unixtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mo_msgid` (`msg_id`,`mobile`),
  KEY `idx_mo_create_unixtime` (`mobile`,`create_unixtime`),
  KEY `idx_mo_msgid_pass` (`passage_id`,`msg_id`,`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mo_message_receive`
--

LOCK TABLES `mms_mo_message_receive` WRITE;
/*!40000 ALTER TABLE `mms_mo_message_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `mms_mo_message_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mt_message_deliver`
--

DROP TABLE IF EXISTS `mms_mt_message_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mt_message_deliver` (
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '消息ID',
  `cmcp` int(4) NOT NULL COMMENT '运营商',
  `mobile` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '用户手机号',
  `status_code` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '状态码',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态,0:成功，1：失败',
  `deliver_time` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信提供商回复的时间，可为空',
  `create_time` datetime NOT NULL COMMENT '插入数据时间',
  `remark` varchar(4096) CHARACTER SET utf8 DEFAULT NULL COMMENT '用于存储返回值数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_message_deliver_unique` (`msg_id`,`mobile`),
  KEY `idx_deliver_status` (`status`),
  KEY `idx_receive_time` (`create_time`),
  KEY `idx_message_deliver_only_msgid` (`msg_id`),
  KEY `idx_message_deliver_only_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='mt下行短信回执';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mt_message_deliver`
--

LOCK TABLES `mms_mt_message_deliver` WRITE;
/*!40000 ALTER TABLE `mms_mt_message_deliver` DISABLE KEYS */;
INSERT INTO `mms_mt_message_deliver` VALUES (1,'2228406770596841479',1,'18368031231','S0099',1,'2019-04-06 00:39:06','2019-04-05 11:39:07','S0099'),(2,'2228406781644638214',1,'18368031231','S0099',1,'2019-04-06 00:51:40','2019-04-05 11:51:41','S0099'),(3,'2228406795804608512',1,'18368031231','S0099',1,'2019-04-06 00:54:19','2019-04-05 11:54:19','S0099'),(4,'2228418979737634819',1,'18368031231','S0099',1,'2019-04-06 01:00:16','2019-04-05 12:00:16','S0099'),(5,'2228422357813299207',1,'18368031231','S0099',1,'2019-04-06 01:01:20','2019-04-05 12:01:21','S0099'),(6,'2228499495677593604',1,'18368031231','S0099',1,'2019-04-06 03:33:40','2019-04-05 14:33:41','S0099'),(7,'2228502677468219401',1,'18368031231','S0099',1,'2019-04-06 03:39:58','2019-04-05 14:39:59','S0099'),(8,'2228504988278065158',1,'18368031231','S0099',1,'2019-04-06 03:44:34','2019-04-05 14:44:35','S0099'),(9,'2228505607709657088',1,'18368031231','S0099',1,'2019-04-06 03:47:26','2019-04-05 14:47:26','S0099'),(10,'2228508875684841480',1,'18368031231','S0099',1,'2019-04-06 03:53:59','2019-04-05 14:53:59','S0099'),(11,'2228422383297890307',1,'18368031231','REJECT',1,'2019-04-13 16:24:55','2019-04-13 03:24:55','REJECT'),(12,'771068',1,'18365720203','DELIVRD',0,'2019-04-08 09:47:57','2019-04-13 08:50:02','taskid : 771068, mobile : 18365720203, status_code : DELIVRD'),(13,'771068',1,'18768158605','DELIVRD',0,'2019-04-08 09:47:57','2019-04-13 08:50:02','taskid : 771068, mobile : 18768158605, status_code : DELIVRD'),(14,'771072',1,'18365720203','DELIVRD',0,'2019-04-08 09:48:17','2019-04-13 08:50:02','taskid : 771072, mobile : 18365720203, status_code : DELIVRD'),(15,'771072',1,'18768158605','DELIVRD',0,'2019-04-08 09:48:17','2019-04-13 08:50:02','taskid : 771072, mobile : 18768158605, status_code : DELIVRD'),(16,'775724',1,'18768158605','System Rejected--6608',1,'2019-04-10 14:28:26','2019-04-13 08:50:02','taskid : 775724, mobile : 18768158605, status_code : System Rejected--6608'),(17,'775725',1,'18768158605','DELIVRD',0,'2019-04-10 14:31:53','2019-04-13 08:50:02','taskid : 775725, mobile : 18768158605, status_code : DELIVRD'),(18,'781754',1,'13601188982','DELIVRD',0,'2019-04-12 09:54:01','2019-04-13 08:50:02','taskid : 781754, mobile : 13601188982, status_code : DELIVRD'),(19,'781874',1,'13627891586','DELIVRD',0,'2019-04-12 10:48:20','2019-04-13 08:50:02','taskid : 781874, mobile : 13627891586, status_code : DELIVRD'),(20,'781874',1,'18768158605','DELIVRD',0,'2019-04-12 10:48:20','2019-04-13 08:50:02','taskid : 781874, mobile : 18768158605, status_code : DELIVRD'),(21,'782094',1,'18377358695','DELIVRD',0,'2019-04-12 13:26:58','2019-04-13 08:50:02','taskid : 782094, mobile : 18377358695, status_code : DELIVRD'),(22,'783418',1,'18368031231','DELIVRD',0,'2019-04-12 17:30:31','2019-04-13 08:50:02','taskid : 783418, mobile : 18368031231, status_code : DELIVRD'),(23,'787683',1,'18368031231','DELIVRD',0,'2019-04-13 16:36:40','2019-04-13 08:50:02','taskid : 787683, mobile : 18368031231, status_code : DELIVRD'),(28,'2234167363102574592',1,'18368031231','REJECT',1,'2019-04-13 23:14:53','2019-04-13 10:14:53','REJECT'),(29,'2234169626860718088',1,'18368031231','REJECT',1,'2019-04-13 23:19:17','2019-04-13 10:19:17','REJECT'),(30,'2234172967657408513',1,'18368031231','REJECT',1,'2019-04-13 23:26:01','2019-04-13 10:26:01','REJECT'),(31,'2234176372819888130',1,'18368031231','S0099',1,'2019-04-13 23:32:44','2019-04-13 10:32:44','S0099'),(32,'824898',1,'13953332116','DELIVRD',0,'2019-04-23 10:08:39','2019-04-26 11:36:32','taskid : 824898, mobile : 13953332116, status_code : DELIVRD'),(33,'824898',1,'18768158605','DELIVRD',0,'2019-04-23 10:08:39','2019-04-26 11:36:32','taskid : 824898, mobile : 18768158605, status_code : DELIVRD'),(34,'828469',1,'15965539923','DELIVRD',0,'2019-04-24 10:56:23','2019-04-26 11:36:32','taskid : 828469, mobile : 15965539923, status_code : DELIVRD'),(35,'828469',1,'18768158605','DELIVRD',0,'2019-04-24 10:56:23','2019-04-26 11:36:32','taskid : 828469, mobile : 18768158605, status_code : DELIVRD'),(36,'828741',2,'18987262633','DELIVRD',0,'2019-04-24 14:34:16','2019-04-26 11:36:32','taskid : 828741, mobile : 18987262633, status_code : DELIVRD'),(37,'828741',2,'18987168875','DELIVRD',0,'2019-04-24 14:34:16','2019-04-26 11:36:32','taskid : 828741, mobile : 18987168875, status_code : DELIVRD'),(38,'828789',2,'13385819856','DELIVRD',0,'2019-04-24 15:13:18','2019-04-26 11:36:32','taskid : 828789, mobile : 13385819856, status_code : DELIVRD'),(39,'828791',2,'18930634151','DELIVRD',0,'2019-04-24 15:16:49','2019-04-26 11:36:32','taskid : 828791, mobile : 18930634151, status_code : DELIVRD'),(40,'828789',2,'18987168875','DeliveryImpossible',1,'2019-04-24 15:19:49','2019-04-26 11:36:32','taskid : 828789, mobile : 18987168875, status_code : DeliveryImpossible'),(41,'828801',2,'18987262633','DeliveryImpossible',1,'2019-04-24 15:22:49','2019-04-26 11:36:32','taskid : 828801, mobile : 18987262633, status_code : DeliveryImpossible'),(42,'828804',2,'18987262633','DeliveryImpossible',1,'2019-04-24 15:29:19','2019-04-26 11:36:32','taskid : 828804, mobile : 18987262633, status_code : DeliveryImpossible'),(43,'828812',2,'18987262633','DELIVRD',0,'2019-04-24 15:39:50','2019-04-26 11:36:32','taskid : 828812, mobile : 18987262633, status_code : DELIVRD'),(44,'829206',2,'18987262633','DELIVRD',0,'2019-04-24 19:33:47','2019-04-26 11:36:32','taskid : 829206, mobile : 18987262633, status_code : DELIVRD'),(45,'155654327316607644',1,'18368031231','2',0,'2019-04-29 21:08:12','2019-04-29 08:08:44','{\"sign\":\"7d5ba2f57f90856def059eb99d2b9cfb\",\"report\":\'[{\"sendId\":155654327316607644,\"mobile\":\"18368031231\",\"reportStatus\":\"DELIVRD\",\"status\":2,\"sendTime\":\"2019-04-29 21:08:12\"}]\'}');
/*!40000 ALTER TABLE `mms_mt_message_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mt_message_push`
--

DROP TABLE IF EXISTS `mms_mt_message_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mt_message_push` (
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '消息ID',
  `mobile` varchar(6000) CHARACTER SET utf8 NOT NULL COMMENT '手机号码',
  `content` varchar(256) DEFAULT NULL COMMENT '推送内容',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态,0：成功，1：失败',
  `retry_times` int(4) DEFAULT '1' COMMENT '重试次数',
  `response_milliseconds` bigint(20) DEFAULT NULL COMMENT '推送相应时间',
  `response_content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '响应内容',
  `create_time` datetime NOT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`),
  KEY `idx_message_deliver_push_msgid` (`msg_id`),
  KEY `idx_message_push_only_mobile` (`mobile`(255))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='mt下行短信t提交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mt_message_push`
--

LOCK TABLES `mms_mt_message_push` WRITE;
/*!40000 ALTER TABLE `mms_mt_message_push` DISABLE KEYS */;
INSERT INTO `mms_mt_message_push` VALUES (1,'2234169626860718088','18368031231','{\"receiveTime\":\"2019-04-13 23:19:17\",\"mobile\":\"18368031231\",\"sid\":\"2234169626860718088\",\"status\":\"REJECT\",\"errorMsg\":\"REJECT\"}',1,2,1,'257161855943230','2019-04-13 10:31:49'),(2,'2234172967657408513','18368031231','{\"receiveTime\":\"2019-04-13 23:26:01\",\"mobile\":\"18368031231\",\"sid\":\"2234172967657408513\",\"status\":\"REJECT\",\"errorMsg\":\"REJECT\"}',1,2,1,'257161877431335','2019-04-13 10:31:49'),(3,'2234176372819888130','18368031231','{\"receiveTime\":\"2019-04-13 23:32:44\",\"mobile\":\"18368031231\",\"sid\":\"2234176372819888130\",\"status\":\"S0099\",\"errorMsg\":\"S0099\"}',0,1,87,'257217579837126','2019-04-13 10:32:45');
/*!40000 ALTER TABLE `mms_mt_message_push` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mt_message_submit`
--

DROP TABLE IF EXISTS `mms_mt_message_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mt_message_submit` (
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `sid` bigint(20) NOT NULL COMMENT '消息ID',
  `mobile` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '手机号码',
  `province_code` int(4) DEFAULT NULL COMMENT '省份代码',
  `cmcp` int(4) DEFAULT NULL COMMENT '运营商',
  `template_id` bigint(20) DEFAULT NULL COMMENT '彩信模板ID',
  `title` varchar(200) DEFAULT NULL COMMENT '彩信模板标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '短信内容',
  `attach` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '自定义内容',
  `passage_id` int(11) unsigned NOT NULL COMMENT '通道ID',
  `need_push` tinyint(1) DEFAULT '0' COMMENT '是否需要推送，0：不需要，1：需要',
  `push_url` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '推送地址',
  `create_time` datetime NOT NULL COMMENT '提交时间',
  `create_unixtime` bigint(20) DEFAULT NULL COMMENT '提交毫秒值',
  `destnation_no` varchar(32) DEFAULT NULL COMMENT '扩展号码',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态,0:处理成功，1：处理失败',
  `remark` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '发送失败，存放接口调用错误信息，如错误码',
  `msg_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '调用接口回执ID，默认与SID一致',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_message_submit_msgid` (`msg_id`,`mobile`),
  KEY `idx_passage_id` (`passage_id`),
  KEY `idx_message_submit_sid` (`sid`),
  KEY `idx_message_submit_createtime` (`create_unixtime`),
  KEY `idx_message_submit_only_mobile` (`mobile`),
  KEY `idx_message_submit_only_userid` (`user_id`),
  KEY `idx_message_submit_province_cmcp` (`province_code`,`cmcp`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='mt下行短信t提交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mt_message_submit`
--

LOCK TABLES `mms_mt_message_submit` WRITE;
/*!40000 ALTER TABLE `mms_mt_message_submit` DISABLE KEYS */;
INSERT INTO `mms_mt_message_submit` VALUES (1,97,2228406770596841479,'18368031231',0,1,NULL,'123123','custom_body/2228406769825089539',NULL,4,0,NULL,'2019-04-05 11:39:07',1554482346669,NULL,1,'S0099','2228406770596841479'),(2,97,2228406781644638214,'18368031231',0,1,NULL,'123123','custom_body/2228406780931606530',NULL,4,1,NULL,'2019-04-05 11:51:41',1554483100823,NULL,1,'S0099','2228406781644638214'),(3,97,2228406795804608512,'18368031231',0,1,NULL,'123123','custom_body/2228406794865084417',NULL,4,1,NULL,'2019-04-05 11:54:19',1554483258979,NULL,1,'S0099','2228406795804608512'),(4,97,2228418979737634819,'18368031231',0,1,NULL,'asdz啥地方','custom_body/2228418978856830985',NULL,4,1,NULL,'2019-04-05 12:00:16',1554483616067,NULL,1,'S0099','2228418979737634819'),(5,97,2228422357813299207,'18368031231',0,1,NULL,'asdz啥地方','custom_body/2228422357007992837',NULL,4,1,NULL,'2019-04-05 12:01:21',1554483680804,NULL,1,'S0099','2228422357813299207'),(6,97,2228422374397577223,'18368031231',33,1,NULL,'asdz啥地方','custom_body/2228422373483218948',NULL,4,1,NULL,'2019-04-05 12:07:03',1554484022629,'222',0,'-871528:767950','767950'),(7,97,2228499495677593604,'18368031231',0,1,NULL,NULL,NULL,NULL,4,1,NULL,'2019-04-05 14:33:40',1554492820435,NULL,1,'S0099','2228499495677593604'),(8,97,2228502677468219401,'18368031231',0,1,NULL,NULL,NULL,NULL,5,1,NULL,'2019-04-05 14:39:58',1554493198338,NULL,1,'S0099','2228502677468219401'),(9,97,2228504988278065158,'18368031231',0,1,5,NULL,NULL,NULL,5,1,NULL,'2019-04-05 14:44:35',1554493474540,NULL,1,'S0099','2228504988278065158'),(10,97,2228505607709657088,'18368031231',0,1,5,NULL,NULL,NULL,5,1,NULL,'2019-04-05 14:47:26',1554493646139,NULL,1,'S0099','2228505607709657088'),(11,97,2228508875684841480,'18368031231',0,1,5,NULL,NULL,NULL,5,1,NULL,'2019-04-05 14:53:59',1554494039146,NULL,1,'S0099','2228508875684841480'),(12,97,2228511633565550597,'18368031231',33,1,5,NULL,NULL,NULL,5,1,NULL,'2019-04-05 14:58:06',1554494286248,'222',0,'{\"sendId\":\"155449428115081042\",\"mobile\":\"18368031231\",\"respCode\":0}','155449428115081042'),(13,97,2228422383297890307,'18368031231',0,1,NULL,'asdz啥地方','custom_body/2228422382190594051',NULL,0,0,NULL,'2019-04-13 03:24:55',1555143894797,NULL,0,'REJECT','2228422383297890307'),(14,97,2233964939507140609,'18368031231',33,1,NULL,'你好','custom_body/2233964938475341833',NULL,4,1,NULL,'2019-04-13 03:33:13',1555144392582,'222',0,'-871540:787683','787683'),(15,97,2233988394977855492,'18368031231',33,1,8,'阿萨德看就按扣量啥的呵呵',NULL,NULL,5,1,NULL,'2019-04-13 04:19:06',1555147145516,'222',0,'{\"sendId\":\"155514714316514945\",\"mobile\":\"18368031231\",\"respCode\":0}','155514714316514945'),(16,97,2234014129113270273,'18368031231',33,1,8,'阿萨德看就按扣量啥的呵呵',NULL,NULL,5,1,NULL,'2019-04-13 05:10:13',1555150212834,'222',0,'{\"sendId\":\"155515021016782145\",\"mobile\":\"18368031231\",\"respCode\":0}','155515021016782145'),(17,97,2234139906693662721,'18368031231',33,1,8,'阿萨德看就按扣量啥的呵呵',NULL,NULL,5,1,NULL,'2019-04-13 09:20:08',1555165208244,'222',0,'{\"sendId\":\"155516520616787046\",\"mobile\":\"18368031231\",\"respCode\":0}','155516520616787046'),(18,97,2234140559453194246,'18368031231',33,1,8,'阿萨德看就按扣量啥的呵呵',NULL,NULL,5,1,NULL,'2019-04-13 09:21:39',1555165299380,'222',0,'{\"sendId\":\"155516529716787240\",\"mobile\":\"18368031231\",\"respCode\":0}','155516529716787240'),(19,97,2234141660399273988,'18368031231',33,1,8,'阿萨德看就按扣量啥的呵呵',NULL,NULL,5,1,NULL,'2019-04-13 09:23:37',1555165416575,'222',0,'{\"sendId\":\"155516541416787442\",\"mobile\":\"18368031231\",\"respCode\":0}','155516541416787442'),(20,97,2234167363102574592,'18368031231',0,1,NULL,'阿达','custom_body/2234167360971868167',NULL,0,0,NULL,'2019-04-13 10:14:53',1555168492721,NULL,0,'REJECT','2234167363102574592'),(21,97,2234169626860718088,'18368031231',0,1,NULL,'阿达','custom_body/2234169625887639553',NULL,0,1,'qweqwe','2019-04-13 10:19:17',1555168756973,NULL,0,'REJECT','2234169626860718088'),(22,97,2234172967657408513,'18368031231',0,1,NULL,'阿达','custom_body/2234172966457837572',NULL,0,1,'qweqwe','2019-04-13 10:26:01',1555169160650,NULL,0,'REJECT','2234172967657408513'),(23,97,2234176372819888130,'18368031231',0,1,NULL,'阿达','custom_body/2234176371720980486',NULL,5,1,'http://192.168.1.112:31119/mt','2019-04-13 10:32:44',1555169563907,NULL,1,'S0099','2234176372819888130');
/*!40000 ALTER TABLE `mms_mt_message_submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mt_task`
--

DROP TABLE IF EXISTS `mms_mt_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mt_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `sid` bigint(20) NOT NULL COMMENT '消息ID',
  `app_type` tinyint(2) NOT NULL DEFAULT '2' COMMENT '调用类型 1:融合WEB平台,2:开发者平台,3:运营支撑系统',
  `send_type` int(2) NOT NULL DEFAULT '1' COMMENT '发送类型 1：报备模板发送，2：自定义内容发送',
  `mobile` longtext CHARACTER SET utf8 NOT NULL COMMENT '手机号',
  `model_id` varchar(32) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '模板标题',
  `body` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext_number` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '拓展号码',
  `attach` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '自定义内容',
  `callback` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '回调URL（选填）',
  `fee` int(8) NOT NULL COMMENT '计费条数',
  `return_fee` int(4) DEFAULT '0' COMMENT '返还条数',
  `ip` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '提交IP',
  `process_status` int(4) DEFAULT NULL COMMENT '分包状态,0:正在分包，1：分包完成，待发送，2:分包异常，待处理，3:分包失败，终止',
  `approve_status` int(4) DEFAULT NULL COMMENT '0：待审核，1：自动通过，2：手动通过，3：审核未通过',
  `error_mobiles` text CHARACTER SET utf8 COMMENT '错号手机号码',
  `repeat_mobiles` text COMMENT '重复手机号码',
  `black_mobiles` text COMMENT '黑名单手机号码',
  `final_body` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `process_time` datetime DEFAULT NULL COMMENT '分包完成时间',
  `force_actions` varchar(32) CHARACTER SET utf8 DEFAULT '000' COMMENT '异常分包情况下允许的操作，如000,010，第一位:未报备模板，第二位：敏感词，第三位：通道不可用',
  `remark` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_unixtime` bigint(20) DEFAULT NULL COMMENT '创建毫秒值',
  PRIMARY KEY (`id`),
  KEY `idx_dst_sid_mobile` (`sid`,`mobile`(255)),
  KEY `idx_create_time` (`create_unixtime`),
  KEY `idx_approve_status` (`approve_status`),
  KEY `idx_task_title` (`title`,`approve_status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='mt下行失败短信';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mt_task`
--

LOCK TABLES `mms_mt_task` WRITE;
/*!40000 ALTER TABLE `mms_mt_task` DISABLE KEYS */;
INSERT INTO `mms_mt_task` VALUES (1,97,2228350018073397251,2,1,'18368031231',NULL,'123123','custom_body/2228350016940935174',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,'custom_body/2228350016940935174','2019-04-05 09:36:38','000','','2019-04-05 09:36:37',1554474997182),(2,97,2228351885285263367,2,1,'18368031231',NULL,'123123','custom_body/2228351884219910150',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,'custom_body/2228351884219910150','2019-04-05 09:40:21','000','','2019-04-05 09:40:20',1554475219771),(3,97,2228379302410323970,2,1,'18368031231',NULL,'123asd阿萨德','custom_body/2228379301034592257',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,'custom_body/2228379301034592257','2019-04-05 10:35:47','000','','2019-04-05 10:34:48',1554478488148),(4,97,2228388757193623555,2,1,'18368031231',NULL,'asda123阿萨德群','custom_body/2228388756254099457',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228388756254099457','2019-04-05 10:53:44','000','1)自定义彩信发送审核;','2019-04-05 10:53:35',1554479615245),(5,97,2228405106481563655,2,1,'18368031231',NULL,'123123123','custom_body/2228405105701423108',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228405105701423108','2019-04-05 11:26:05','000','1)自定义彩信发送审核;','2019-04-05 11:26:04',1554481564232),(6,97,2228405946927810568,2,1,'18368031231',NULL,'123qa','custom_body/2228405946181224452',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228405946181224452','2019-04-05 11:27:45','000','1)自定义彩信发送审核;','2019-04-05 11:27:44',1554481664421),(7,97,2228406745976277001,2,1,'18368031231',NULL,'123123','custom_body/2228406745179359240',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228406745179359240','2019-04-05 11:29:20','000','1)自定义彩信发送审核;','2019-04-05 11:29:20',1554481759676),(8,97,2228406756998907911,2,1,'18368031231',NULL,'123123','custom_body/2228406756327819270',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228406756327819270','2019-04-05 11:29:22','000','1)自定义彩信发送审核;','2019-04-05 11:29:21',1554481760989),(9,97,2228406770596841479,2,1,'18368031231',NULL,'123123','custom_body/2228406769825089539',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228406769825089539','2019-04-05 11:29:23','000','1)自定义彩信发送审核;','2019-04-05 11:29:23',1554481762610),(10,97,2228406781644638214,2,1,'18368031231',NULL,'123123','custom_body/2228406780931606530',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228406780931606530','2019-04-05 11:29:24','000','1)自定义彩信发送审核;','2019-04-05 11:29:24',1554481763927),(11,97,2228406795804608512,2,1,'18368031231',NULL,'123123','custom_body/2228406794865084417',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228406794865084417','2019-04-05 11:29:26','000','1)自定义彩信发送审核;','2019-04-05 11:29:26',1554481765615),(12,97,2228418979737634819,2,1,'18368031231',NULL,'asdz啥地方','custom_body/2228418978856830985',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228418978856830985','2019-04-05 11:53:39','000','1)自定义彩信发送审核;','2019-04-05 11:53:38',1554483218053),(13,97,2228422357813299207,2,1,'18368031231',NULL,'asdz啥地方','custom_body/2228422357007992837',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228422357007992837','2019-04-05 12:00:21','000','1)自定义彩信发送审核;','2019-04-05 12:00:21',1554483620751),(14,97,2228422374397577223,2,1,'18368031231',NULL,'asdz啥地方','custom_body/2228422373483218948',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2228422373483218948','2019-04-05 12:00:23','000','1)自定义彩信发送审核;','2019-04-05 12:00:23',1554483622730),(15,97,2228422383297890307,2,1,'18368031231',NULL,'asdz啥地方','custom_body/2228422382190594051',NULL,NULL,NULL,1,0,'127.0.0.1',2,3,'','',NULL,'custom_body/2228422382190594051','2019-04-05 12:00:24','000','1)自定义彩信发送审核;','2019-04-05 12:00:24',1554483623789),(16,97,2228499495677593604,2,1,'18368031231',NULL,NULL,'2228448803512387591',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-05 14:33:40','000','','2019-04-05 14:33:36',1554492816319),(17,97,2228502677468219401,2,1,'18368031231',NULL,NULL,'2228448803512387591',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-05 14:39:57','000','','2019-04-05 14:39:56',1554493195600),(18,97,2228504988278065158,2,1,'18368031231',NULL,NULL,'2228448803512387591',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-05 14:44:32','000','','2019-04-05 14:44:31',1554493471070),(19,97,2228505607709657088,2,1,'18368031231',NULL,NULL,'2228448803512387591',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-05 14:45:46','000','','2019-04-05 14:45:45',1554493544912),(20,97,2228508875684841480,2,1,'18368031231',NULL,NULL,'2228448803512387591',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-05 14:52:19','000','','2019-04-05 14:52:14',1554493934485),(21,97,2228511633565550597,2,1,'18368031231',NULL,NULL,'2228448803512387591',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-05 14:57:44','000','','2019-04-05 14:57:43',1554494263250),(22,97,2233964939507140609,2,1,'18368031231',NULL,'你好','custom_body/2233964938475341833',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2233964938475341833','2019-04-13 03:32:29','000','1)自定义彩信发送审核;','2019-04-13 03:32:28',1555144347977),(23,97,2233988394977855492,2,1,'18368031231',NULL,'阿萨德看就按扣量啥的呵呵','2233975406409549824',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-13 04:19:05','000','','2019-04-13 04:19:04',1555147144088),(24,97,2234014129113270273,2,1,'18368031231',NULL,'阿萨德看就按扣量啥的呵呵','2233975406409549824',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-13 05:10:12','000','','2019-04-13 05:10:12',1555150211836),(25,97,2234139906693662721,2,1,'18368031231',NULL,'阿萨德看就按扣量啥的呵呵','2233975406409549824',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-13 09:20:07','000','','2019-04-13 09:20:06',1555165205701),(26,97,2234140559453194246,2,1,'18368031231',NULL,'阿萨德看就按扣量啥的呵呵','2233975406409549824',NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-13 09:21:24','000','','2019-04-13 09:21:24',1555165283506),(27,97,2234141660399273988,2,1,'18368031231','2233975406409549824','阿萨德看就按扣量啥的呵呵',NULL,NULL,NULL,NULL,1,0,'127.0.0.1',1,1,'','',NULL,NULL,'2019-04-13 09:23:36','000','','2019-04-13 09:23:35',1555165414749),(28,97,2234167363102574592,2,1,'18368031231',NULL,'阿达','custom_body/2234167360971868167',NULL,NULL,NULL,1,0,'127.0.0.1',2,3,'','',NULL,'custom_body/2234167360971868167','2019-04-13 10:14:40','000','1)自定义彩信发送审核;','2019-04-13 10:14:39',1555168478751),(29,97,2234169626860718088,2,1,'18368031231',NULL,'阿达','custom_body/2234169625887639553',NULL,NULL,NULL,1,0,'127.0.0.1',2,3,'','',NULL,'custom_body/2234169625887639553','2019-04-13 10:19:09','000','1)自定义彩信发送审核;','2019-04-13 10:19:09',1555168748623),(30,97,2234172967657408513,2,1,'18368031231',NULL,'阿达','custom_body/2234172966457837572',NULL,NULL,NULL,1,0,'127.0.0.1',2,3,'','',NULL,'custom_body/2234172966457837572','2019-04-13 10:25:48','000','1)自定义彩信发送审核;','2019-04-13 10:25:47',1555169146865),(31,97,2234176372819888130,2,1,'18368031231',NULL,'阿达','custom_body/2234176371720980486',NULL,NULL,NULL,1,0,'127.0.0.1',2,2,'','',NULL,'custom_body/2234176371720980486','2019-04-13 10:32:34','000','1)自定义彩信发送审核;','2019-04-13 10:32:33',1555169552792);
/*!40000 ALTER TABLE `mms_mt_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_mt_task_packets`
--

DROP TABLE IF EXISTS `mms_mt_task_packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_mt_task_packets` (
  `id` bigint(30) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` bigint(20) NOT NULL COMMENT '消息ID',
  `province_code` int(4) DEFAULT NULL COMMENT '省份代码',
  `cmcp` int(4) DEFAULT NULL COMMENT '运营商',
  `mobile` longtext NOT NULL COMMENT '手机号码（批量时为多个）',
  `model_id` varchar(32) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `body` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_size` int(10) DEFAULT NULL COMMENT '号码总个数',
  `passage_id` int(11) DEFAULT NULL COMMENT '通道ID',
  `final_passage_id` int(11) DEFAULT NULL COMMENT '最终使用的通道ID',
  `passage_protocol` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '协议类型',
  `passage_url` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '通道URL',
  `passage_parameter` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '参数信息',
  `result_format` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '结果模板',
  `success_code` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '成功码',
  `position` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '定位',
  `priority` int(10) DEFAULT '1' COMMENT '优先级',
  `force_actions` varchar(32) CHARACTER SET utf8 DEFAULT '000' COMMENT '异常分包情况下允许的操作，如000,010，第一位:未报备模板，第二位：敏感词，第三位：通道不可用',
  `remark` varchar(6000) CHARACTER SET utf8 DEFAULT NULL COMMENT '分包失败原因（针对单个子任务）',
  `retry_times` int(11) DEFAULT '0' COMMENT '调用上家重试次数',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态,0：待处理，1：自动处理，2：手动处理',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_passage_id` (`passage_id`),
  KEY `idx_task_sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='mt下行短信t提交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_mt_task_packets`
--

LOCK TABLES `mms_mt_task_packets` WRITE;
/*!40000 ALTER TABLE `mms_mt_task_packets` DISABLE KEYS */;
INSERT INTO `mms_mt_task_packets` VALUES (1,2228351885285263367,0,1,'18368031231',NULL,'123123','custom_body/2228351884219910150',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','',0,0,'2019-04-05 09:40:21',NULL),(2,2228379302410323970,0,1,'18368031231',NULL,'123asd阿萨德','custom_body/2228379301034592257',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','',0,0,'2019-04-05 10:35:14',NULL),(3,2228388757193623555,0,1,'18368031231',NULL,'asda123阿萨德群','custom_body/2228388756254099457',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 10:53:41',NULL),(4,2228405106481563655,0,1,'18368031231',NULL,'123123123','custom_body/2228405105701423108',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:26:05',NULL),(5,2228405946927810568,0,1,'18368031231',NULL,'123qa','custom_body/2228405946181224452',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:27:45',NULL),(6,2228406745976277001,0,1,'18368031231',NULL,'123123','custom_body/2228406745179359240',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:29:20',NULL),(7,2228406756998907911,0,1,'18368031231',NULL,'123123','custom_body/2228406756327819270',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:29:22',NULL),(8,2228406770596841479,0,1,'18368031231',NULL,'123123','custom_body/2228406769825089539',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:29:23',NULL),(9,2228406781644638214,0,1,'18368031231',NULL,'123123','custom_body/2228406780931606530',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:29:24',NULL),(10,2228406795804608512,0,1,'18368031231',NULL,'123123','custom_body/2228406794865084417',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:29:26',NULL),(11,2228418979737634819,0,1,'18368031231',NULL,'asdz啥地方','custom_body/2228418978856830985',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 11:53:39',NULL),(12,2228422357813299207,0,1,'18368031231',NULL,'asdz啥地方','custom_body/2228422357007992837',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 12:00:21',NULL),(13,2228422374397577223,0,1,'18368031231',NULL,'asdz啥地方','custom_body/2228422373483218948',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-05 12:00:23',NULL),(14,2228422383297890307,0,1,'18368031231',NULL,'asdz啥地方','custom_body/2228422382190594051',1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,3,'2019-04-05 12:00:24',NULL),(15,2228499495677593604,0,1,'18368031231','2228448803512387591',NULL,NULL,1,4,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-05 14:33:40',NULL),(16,2228502677468219401,0,1,'18368031231','2228448803512387591',NULL,NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-05 14:39:57',NULL),(17,2228504988278065158,0,1,'18368031231','2228448803512387591',NULL,NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-05 14:44:32',NULL),(18,2228505607709657088,0,1,'18368031231','2228448803512387591',NULL,NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-05 14:45:46',NULL),(19,2228508875684841480,0,1,'18368031231','2228448803512387591',NULL,NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-05 14:52:19',NULL),(20,2228511633565550597,0,1,'18368031231','2228448803512387591',NULL,NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-05 14:57:44',NULL),(21,2233964939507140609,0,1,'18368031231',NULL,'你好','custom_body/2233964938475341833',1,5,4,'HTTP','http://182.92.224.167:8888/sendmms.aspx','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-13 03:32:29',NULL),(22,2233988394977855492,0,1,'18368031231','2233975406409549824','阿萨德看就按扣量啥的呵呵',NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-13 04:19:05',NULL),(23,2234014129113270273,0,1,'18368031231','2233975406409549824','阿萨德看就按扣量啥的呵呵',NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-13 05:10:12',NULL),(24,2234139906693662721,0,1,'18368031231','2233975406409549824','阿萨德看就按扣量啥的呵呵',NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-13 09:20:07',NULL),(25,2234140559453194246,0,1,'18368031231','2233975406409549824','阿萨德看就按扣量啥的呵呵',NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-13 09:21:24',NULL),(26,2234141660399273988,0,1,'18368031231','2233975406409549824','阿萨德看就按扣量啥的呵呵',NULL,1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','',0,1,'2019-04-13 09:23:36',NULL),(27,2234167363102574592,0,1,'18368031231',NULL,'阿达','custom_body/2234167360971868167',1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,3,'2019-04-13 10:14:40',NULL),(28,2234169626860718088,0,1,'18368031231',NULL,'阿达','custom_body/2234169625887639553',1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,3,'2019-04-13 10:19:09',NULL),(29,2234172967657408513,0,1,'18368031231',NULL,'阿达','custom_body/2234172966457837572',1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,3,'2019-04-13 10:25:48',NULL),(30,2234176372819888130,0,1,'18368031231',NULL,'阿达','custom_body/2234176371720980486',1,5,5,'HTTP','http://send.supermms.cn/mt.php','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',NULL,'000','1)自定义彩信发送审核;',0,2,'2019-04-13 10:32:34',NULL);
/*!40000 ALTER TABLE `mms_mt_task_packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage`
--

DROP TABLE IF EXISTS `mms_passage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '通道名称',
  `code` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '通道字母编码',
  `cmcp` int(4) NOT NULL COMMENT '运营商',
  `hspaas_template_id` int(11) DEFAULT NULL COMMENT '通道模板协议',
  `priority` tinyint(4) DEFAULT NULL COMMENT '优先级',
  `status` tinyint(4) DEFAULT '0' COMMENT '是否启用(0:启用1:停用，2:异常停用)',
  `remark` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `access_code` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '10690接入号，需与params表接入号一致',
  `account` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '接入账号(上家提供的用户账号)',
  `pay_type` tinyint(4) DEFAULT '1' COMMENT '付费方式(1预付2后付)',
  `balance` int(10) DEFAULT NULL COMMENT '剩余条数',
  `mobile_size` int(10) DEFAULT NULL COMMENT '手机号码分包数',
  `packets_size` int(10) DEFAULT NULL COMMENT '1秒钟允许提交的网络包数量',
  `connection_size` int(10) DEFAULT NULL COMMENT '最大连接数',
  `read_timeout` int(10) DEFAULT NULL COMMENT '超时时间（毫秒）',
  `ext_number` int(10) DEFAULT '0' COMMENT '拓展号长度,0表示不允许拓展',
  `born_term` int(10) DEFAULT '72' COMMENT '统计落地时限（小时）',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_passage_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='通道管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage`
--

LOCK TABLES `mms_passage` WRITE;
/*!40000 ALTER TABLE `mms_passage` DISABLE KEYS */;
INSERT INTO `mms_passage` VALUES (3,'555666','324',1,37,4,0,'a324554','444444','343422222',2,NULL,10,304,12,5000,2,NULL,'2019-03-24 05:39:55','2019-03-24 06:15:10'),(4,'迈远测试','mycscx',4,38,5,0,NULL,'111','111',1,NULL,4000,111,1,5000,-1,NULL,'2019-04-05 05:35:09','2019-04-05 05:35:23'),(5,'三体测试彩信','asdasd',1,39,5,0,NULL,'1111','111',1,NULL,111,111,1,5000,-1,NULL,'2019-04-05 12:57:45',NULL);
/*!40000 ALTER TABLE `mms_passage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage_access`
--

DROP TABLE IF EXISTS `mms_passage_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `group_id` int(11) NOT NULL COMMENT '通道组id',
  `route_type` int(4) NOT NULL COMMENT '路由类型',
  `cmcp` int(2) NOT NULL COMMENT '运营商',
  `province_code` int(11) DEFAULT '0' COMMENT '省份',
  `passage_id` int(11) NOT NULL COMMENT '通道ID',
  `passage_code` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '通道代码',
  `protocol` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '协议类型',
  `call_type` tinyint(4) NOT NULL COMMENT '1-发送2-下行推送 3-下行自取 4-上行推送 5-上行自取',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `params_definition` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '定义，直接取模板里的值',
  `params` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '具体的参数值，取模板中的key作为KEY，如{"username":"test", "password":"123456"}',
  `result_format` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `success_code` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '成功码',
  `position` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '返回值的具体位置，json存储',
  `mobile_size` int(10) DEFAULT NULL COMMENT '手机号码分包数',
  `packets_size` int(10) DEFAULT NULL COMMENT '1秒钟允许提交的网络包数量',
  `connection_size` int(10) DEFAULT NULL COMMENT '最大连接数',
  `read_timeout` int(10) DEFAULT NULL COMMENT '超时时间（毫秒）',
  `access_code` varchar(32) DEFAULT NULL COMMENT '接入号码（10690...）',
  `ext_number` int(10) DEFAULT '0' COMMENT '拓展号长度,0表示不允许拓展',
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：0：有效，1：不可用',
  PRIMARY KEY (`id`),
  KEY `idx_sms_passage_access_url` (`call_type`,`url`),
  KEY `idx_sms_passage_access_userid` (`user_id`,`route_type`,`province_code`,`cmcp`),
  KEY `idx_sms_passage_access_passageid` (`passage_id`),
  KEY `idx_sms_passage_access_userid_calltype` (`user_id`,`call_type`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage_access`
--

LOCK TABLES `mms_passage_access` WRITE;
/*!40000 ALTER TABLE `mms_passage_access` DISABLE KEYS */;
INSERT INTO `mms_passage_access` VALUES (113,97,1,0,1,0,5,'asdasd','HTTP',1,'http://send.supermms.cn/mt.php','[{\"requestName\":\"appId\",\"showName\":\"用户编号\",\"defaultValue\":\"10606\"},{\"requestName\":\"appKey\",\"showName\":\"用户密码\",\"defaultValue\":\"4c34ef5f3c\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',111,111,NULL,NULL,'1111',0,'2019-04-13 10:32:22',0),(114,97,1,0,1,0,5,'asdasd','HTTP',2,'trioly','[{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"custom\":\"trioly\"}',NULL,'2','{}',111,111,NULL,NULL,'1111',0,'2019-04-13 10:32:22',0),(115,97,1,0,1,0,5,'asdasd','HTTP',4,'trioly','[{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"custom\":\"trioly\"}',NULL,NULL,'{}',111,111,NULL,NULL,'1111',0,'2019-04-13 10:32:23',0),(116,97,1,0,1,0,5,'asdasd','HTTP',6,'http://op.supermms.cn/api/vsmsMode/addMode','[{\"requestName\":\"appId\",\"showName\":\"用户编号\",\"defaultValue\":\"10606\"},{\"requestName\":\"appKey\",\"showName\":\"用户密码\",\"defaultValue\":\"4c34ef5f3c\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}',111,111,NULL,NULL,'1111',0,'2019-04-13 10:32:23',0),(117,97,1,0,2,0,4,'mycscx','HTTP',3,'http://182.92.224.167:8888/mmsStatusApi.aspx','[{\"requestName\":\"userid\",\"showName\":\"用户编号\",\"defaultValue\":\"355\"},{\"requestName\":\"account\",\"showName\":\"用户账号\",\"defaultValue\":\"renchensheng\"},{\"requestName\":\"password\",\"showName\":\"用户密码\",\"defaultValue\":\"renchensheng58\"},{\"requestName\":\"interval\",\"showName\":\"扫描间隔\",\"defaultValue\":\"20000\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"maiyuan\"}]','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"interval\":\"20000\",\"userid\":\"355\",\"account\":\"renchensheng\"}',NULL,'10','{}',4000,111,NULL,NULL,'111',0,'2019-04-13 10:32:24',0),(118,97,1,0,2,0,4,'mycscx','HTTP',1,'http://182.92.224.167:8888/sendmms.aspx','[{\"requestName\":\"userId\",\"showName\":\"用户编号\",\"defaultValue\":\"355\"},{\"requestName\":\"account\",\"showName\":\"用户账号\",\"defaultValue\":\"renchensheng\"},{\"requestName\":\"password\",\"showName\":\"用户密码\",\"defaultValue\":\"renchensheng58\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"maiyuan\"}]','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',4000,111,NULL,NULL,'111',0,'2019-04-13 10:32:24',0),(119,97,1,0,3,0,4,'mycscx','HTTP',3,'http://182.92.224.167:8888/mmsStatusApi.aspx','[{\"requestName\":\"userid\",\"showName\":\"用户编号\",\"defaultValue\":\"355\"},{\"requestName\":\"account\",\"showName\":\"用户账号\",\"defaultValue\":\"renchensheng\"},{\"requestName\":\"password\",\"showName\":\"用户密码\",\"defaultValue\":\"renchensheng58\"},{\"requestName\":\"interval\",\"showName\":\"扫描间隔\",\"defaultValue\":\"20000\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"maiyuan\"}]','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"interval\":\"20000\",\"userid\":\"355\",\"account\":\"renchensheng\"}',NULL,'10','{}',4000,111,NULL,NULL,'111',0,'2019-04-13 10:32:24',0),(120,97,1,0,3,0,4,'mycscx','HTTP',1,'http://182.92.224.167:8888/sendmms.aspx','[{\"requestName\":\"userId\",\"showName\":\"用户编号\",\"defaultValue\":\"355\"},{\"requestName\":\"account\",\"showName\":\"用户账号\",\"defaultValue\":\"renchensheng\"},{\"requestName\":\"password\",\"showName\":\"用户密码\",\"defaultValue\":\"renchensheng58\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"maiyuan\"}]','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}',4000,111,NULL,NULL,'111',0,'2019-04-13 10:32:24',0);
/*!40000 ALTER TABLE `mms_passage_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage_group`
--

DROP TABLE IF EXISTS `mms_passage_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage_group` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `passage_group_name` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '通道组名称',
  `comments` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通道组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage_group`
--

LOCK TABLES `mms_passage_group` WRITE;
/*!40000 ALTER TABLE `mms_passage_group` DISABLE KEYS */;
INSERT INTO `mms_passage_group` VALUES (1,'彩信测试',NULL),(2,'视频彩信',NULL);
/*!40000 ALTER TABLE `mms_passage_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage_group_detail`
--

DROP TABLE IF EXISTS `mms_passage_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage_group_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '通道组id',
  `passage_id` int(11) NOT NULL COMMENT '通道id',
  `province_code` int(11) DEFAULT '0' COMMENT '通道代码',
  `route_type` tinyint(4) DEFAULT NULL COMMENT '路由类型，0默认路由，1验证码路由,2即时通知路由，3批量通知路由，4高风险投诉路由',
  `priority` int(4) DEFAULT NULL COMMENT '优先级',
  `cmcp` int(4) DEFAULT NULL COMMENT '运营商1-移动 2-联通 3-电信',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='通道组内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage_group_detail`
--

LOCK TABLES `mms_passage_group_detail` WRITE;
/*!40000 ALTER TABLE `mms_passage_group_detail` DISABLE KEYS */;
INSERT INTO `mms_passage_group_detail` VALUES (4,1,5,0,0,1,1),(5,1,4,0,0,2,2),(6,1,4,0,0,3,3),(7,2,5,0,0,1,1);
/*!40000 ALTER TABLE `mms_passage_group_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage_message_template`
--

DROP TABLE IF EXISTS `mms_passage_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage_message_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `template_id` bigint(11) NOT NULL COMMENT '通道模板ID（通道方提供）',
  `passage_id` int(11) NOT NULL COMMENT '通道ID',
  `passage_model_id` varchar(64) DEFAULT NULL COMMENT '通道模板ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:报备中，待审核，1：审核通过，2：审核失败',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `indx_passage_message_template_id` (`template_id`),
  KEY `indx_passage_message_passage_id` (`passage_id`),
  KEY `indx_passage_message_template_passage_id` (`template_id`,`passage_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage_message_template`
--

LOCK TABLES `mms_passage_message_template` WRITE;
/*!40000 ALTER TABLE `mms_passage_message_template` DISABLE KEYS */;
INSERT INTO `mms_passage_message_template` VALUES (6,5,5,'1258079',1,'2019-04-05 13:34:34','2019-04-05 14:06:59','阿达'),(7,8,5,'1258079',1,'2019-04-13 03:55:47','2019-04-13 04:07:39',NULL),(8,8,4,NULL,0,'2019-04-13 03:59:58','2019-04-13 03:59:58',NULL);
/*!40000 ALTER TABLE `mms_passage_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage_parameter`
--

DROP TABLE IF EXISTS `mms_passage_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passage_id` int(11) NOT NULL COMMENT '通道ID',
  `protocol` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '协议类型',
  `call_type` tinyint(4) NOT NULL COMMENT '1-发送 2-状态回执推送 3-状态回执自取 4-上行推送 5-上行自取 6-余额查询',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `params_definition` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '定义，直接取模板里的值',
  `params` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '具体的参数值，取模板中的key作为KEY，如{"username":"test", "password":"123456"}',
  `result_format` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `success_code` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `position` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '返回值的具体位置，json存储',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inx_passage_parameter_pid` (`passage_id`,`url`),
  KEY `inx_passage_parameter_url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage_parameter`
--

LOCK TABLES `mms_passage_parameter` WRITE;
/*!40000 ALTER TABLE `mms_passage_parameter` DISABLE KEYS */;
INSERT INTO `mms_passage_parameter` VALUES (5,3,'HTTP',6,'http://localhost:8080/mms/model/apply','[{\"requestName\":\"appId\",\"showName\":\"授权ID\",\"defaultValue\":\"2323eee\"},{\"requestName\":\"appKey\",\"showName\":\"授权KEY\",\"defaultValue\":\"23ert\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"appId\":\"2323eee\",\"custom\":\"trioly\",\"appKey\":\"23ert\"}',NULL,'0','{}','2019-03-24 06:15:10'),(6,3,'HTTP',1,'http://localhost:8080/mms/model/send','[{\"requestName\":\"appId\",\"showName\":\"授权ID\",\"defaultValue\":\"33\"},{\"requestName\":\"appKey\",\"showName\":\"授权KEY\",\"defaultValue\":\"33qqr\"},{\"requestName\":\"code\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"code\":\"trioly\",\"appId\":\"33\",\"appKey\":\"33qqr\"}','33','0','{}','2019-03-24 06:15:10'),(9,4,'HTTP',3,'http://182.92.224.167:8888/mmsStatusApi.aspx','[{\"requestName\":\"userid\",\"showName\":\"用户编号\",\"defaultValue\":\"355\"},{\"requestName\":\"account\",\"showName\":\"用户账号\",\"defaultValue\":\"renchensheng\"},{\"requestName\":\"password\",\"showName\":\"用户密码\",\"defaultValue\":\"renchensheng58\"},{\"requestName\":\"interval\",\"showName\":\"扫描间隔\",\"defaultValue\":\"20000\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"maiyuan\"}]','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"interval\":\"20000\",\"userid\":\"355\",\"account\":\"renchensheng\"}',NULL,'10','{}','2019-04-05 05:35:23'),(10,4,'HTTP',1,'http://182.92.224.167:8888/sendmms.aspx','[{\"requestName\":\"userId\",\"showName\":\"用户编号\",\"defaultValue\":\"355\"},{\"requestName\":\"account\",\"showName\":\"用户账号\",\"defaultValue\":\"renchensheng\"},{\"requestName\":\"password\",\"showName\":\"用户密码\",\"defaultValue\":\"renchensheng58\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"maiyuan\"}]','{\"password\":\"renchensheng58\",\"custom\":\"maiyuan\",\"userId\":\"355\",\"account\":\"renchensheng\"}',NULL,'0','{}','2019-04-05 05:35:23'),(11,5,'HTTP',1,'http://send.supermms.cn/mt.php','[{\"requestName\":\"appId\",\"showName\":\"用户编号\",\"defaultValue\":\"10606\"},{\"requestName\":\"appKey\",\"showName\":\"用户密码\",\"defaultValue\":\"4c34ef5f3c\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}','2019-04-05 12:57:45'),(12,5,'HTTP',2,'trioly','[{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"custom\":\"trioly\"}',NULL,'2','{}','2019-04-05 12:57:45'),(13,5,'HTTP',4,'trioly','[{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"custom\":\"trioly\"}',NULL,NULL,'{}','2019-04-05 12:57:45'),(14,5,'HTTP',6,'http://op.supermms.cn/api/vsmsMode/addMode','[{\"requestName\":\"appId\",\"showName\":\"用户编号\",\"defaultValue\":\"10606\"},{\"requestName\":\"appKey\",\"showName\":\"用户密码\",\"defaultValue\":\"4c34ef5f3c\"},{\"requestName\":\"custom\",\"showName\":\"通道简码\",\"defaultValue\":\"trioly\"}]','{\"appId\":\"10606\",\"custom\":\"trioly\",\"appKey\":\"4c34ef5f3c\"}',NULL,'0','{}','2019-04-05 12:57:45');
/*!40000 ALTER TABLE `mms_passage_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mms_passage_province`
--

DROP TABLE IF EXISTS `mms_passage_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mms_passage_province` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `passage_id` int(11) NOT NULL COMMENT '通道ID',
  `province_code` int(11) DEFAULT NULL COMMENT '省份代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_passage_province`
--

LOCK TABLES `mms_passage_province` WRITE;
/*!40000 ALTER TABLE `mms_passage_province` DISABLE KEYS */;
INSERT INTO `mms_passage_province` VALUES (166,3,46),(167,3,15),(168,3,50),(169,3,54),(170,3,42),(171,3,63),(172,3,13),(173,3,61),(174,3,32),(175,3,36),(176,3,41),(177,3,62),(178,3,33),(179,3,22),(180,3,64),(181,3,11),(182,3,14),(183,3,43),(184,3,34),(185,3,45),(186,3,53),(187,3,12),(188,3,37),(189,3,44),(190,3,65),(191,3,52),(192,3,35),(193,3,51),(194,3,21),(195,3,23),(196,3,31),(197,3,0),(198,3,21),(199,3,42),(200,3,32),(201,3,65),(202,3,44),(203,3,52),(204,3,51),(205,3,22),(206,3,63),(207,3,36),(208,3,12),(209,3,50),(210,3,11),(211,3,43),(212,3,41),(213,3,14),(214,3,54),(215,3,23),(216,3,15),(217,3,45),(218,3,34),(219,3,62),(220,3,33),(221,3,35),(222,3,37),(223,3,53),(224,3,46),(225,3,13),(226,3,61),(227,3,64),(228,3,31),(229,3,0),(230,3,22),(231,3,65),(232,3,13),(233,3,34),(234,3,43),(235,3,35),(236,3,21),(237,3,36),(238,3,64),(239,3,15),(240,3,42),(241,3,33),(242,3,51),(243,3,12),(244,3,44),(245,3,52),(246,3,46),(247,3,62),(248,3,11),(249,3,45),(250,3,14),(251,3,37),(252,3,53),(253,3,63),(254,3,41),(255,3,32),(256,3,54),(257,3,50),(258,3,23),(259,3,31),(260,3,61),(261,3,0),(262,4,0),(263,4,0),(264,5,0);
/*!40000 ALTER TABLE `mms_passage_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hsmms'
--
