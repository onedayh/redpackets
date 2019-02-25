-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: redbag
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `bas_wechat_publicinfo`
--

DROP TABLE IF EXISTS `bas_wechat_publicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_wechat_publicinfo` (
  `app_id` varchar(20) NOT NULL COMMENT '公众号/小程序id',
  `app_name` varchar(64) DEFAULT NULL COMMENT '公众号名称',
  `app_key` char(32) DEFAULT NULL COMMENT '公众号key',
  `merchant_wxid` varchar(20) DEFAULT NULL COMMENT '商户Id (涉及支付)',
  `merchant_key` char(32) DEFAULT NULL COMMENT '微信商户key(涉及支付)',
  `merchant_cert` varchar(255) DEFAULT NULL COMMENT '微信支付证书（涉及支付）',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_wechat_publicinfo`
--

LOCK TABLES `bas_wechat_publicinfo` WRITE;
/*!40000 ALTER TABLE `bas_wechat_publicinfo` DISABLE KEYS */;
INSERT INTO `bas_wechat_publicinfo` VALUES ('wx376d6fb043fbec43','弯弓在道公众号','ca26668d89a2df91688f6f86dd5d868f',NULL,NULL,NULL),('wx718e3695c5f79f4b','轻码微信服务号','9537ce94838f8d683bb8a6c4d3297bd3',NULL,NULL,NULL),('wxc5b9d4dbb2653903','轻码商城','4d23a4d848a7ba5790041e22338cafba','1464858302','LiteCODER20161227HYaK166ZwehaPPy','apiclient_cert.p12');
/*!40000 ALTER TABLE `bas_wechat_publicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_redbag`
--

DROP TABLE IF EXISTS `bus_redbag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_redbag` (
  `red_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包id',
  `red_topic` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '主题名称',
  `user_id` char(36) NOT NULL COMMENT '创建用户',
  `red_create_date` datetime NOT NULL COMMENT '创建日期',
  `red_bgp` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `red_bgm` varchar(255) DEFAULT NULL COMMENT '背景音频',
  `red_layout` varchar(1024) NOT NULL COMMENT '布局样式',
  `red_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '红包玩法\n            0：直接拆\n            1：拼包拆',
  `red_group` tinyint(4) DEFAULT NULL COMMENT '拼包人数',
  `red_amount` decimal(11,2) NOT NULL COMMENT '红包总额',
  `red_total` int(11) NOT NULL COMMENT '红包个数',
  `red_alloc` tinyint(4) NOT NULL COMMENT '红包分配方式\n            0:随机分配\n            1:均分',
  `red_start` datetime DEFAULT NULL COMMENT '红包开抢时间',
  `red_end` datetime DEFAULT NULL COMMENT '红包结束时间',
  `red_user_limit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号限领\n            0:每用户限领一次\n            1：每用户每日限领一次',
  `red_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '红包状态\n            0: 待商家支付\n            1：开启\n	     2: 活动暂停',
  `red_opendate` datetime DEFAULT NULL COMMENT '红包开通日期',
  `red_qr` varchar(255) DEFAULT NULL COMMENT '红包二维码',
  `app_id` varchar(20) DEFAULT NULL COMMENT '领取此红包需要关注的公众号',
  `app_name` varchar(64) DEFAULT NULL COMMENT '公众号的名称',
  `red_ispublic` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否放置于广场\n            0:不放置广场\n            1：放置在红包广场',
  PRIMARY KEY (`red_id`),
  KEY `userIndex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag`
--

LOCK TABLES `bus_redbag` WRITE;
/*!40000 ALTER TABLE `bus_redbag` DISABLE KEYS */;
INSERT INTO `bus_redbag` VALUES (8,'哆咪科技创建,迎春酬宾大红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 12:54:54',NULL,NULL,'\"12113\"',0,0,20000.00,50000,0,'2019-01-30 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(9,'红包测试成功大红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 18:15:23',NULL,NULL,'\"12113\"',0,0,20000.00,50000,0,'2019-01-30 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(10,'马上测试发个成功大红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 18:16:25',NULL,NULL,'\"12113\"',0,0,20000.00,50000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(11,'马上测试发个成功大红包来转账','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 18:58:42',NULL,NULL,'\"12113\"',0,0,20000.00,20000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(12,'马上测试发个成功大红包来转账','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:11:06',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(13,'马上测试发个成功大红包来转账2','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:18:14',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(14,'马上测试发个成功大红包来转账3','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:21:26',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(15,'马上测试发个成功大红包来转账4','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:22:44',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(16,'马上测试发个成功大红包来转账5','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:23:18',NULL,NULL,'\"12113\"',0,0,20000.00,4000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(17,'马上测试发个成功大红包来转账6','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:29:11',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(18,'马上测试发个成功大红包来转账7','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:30:59',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(19,'马上测试发个成功大红包来转账8','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 19:32:36',NULL,NULL,'\"12113\"',0,0,2000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(20,'搞个拼红包的','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 20:51:08',NULL,NULL,'\"12113\"',1,0,2000.00,40,0,'2018-12-01 00:00:00',NULL,0,0,NULL,NULL,NULL,NULL,0),(21,'搞个拼红包的1','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 20:51:19',NULL,NULL,'\"12113\"',1,3,2000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(22,'申佩怡过生日发红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 22:38:06',NULL,NULL,'\"12113\"',1,3,20000.00,40000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(23,'申佩怡过生日发红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 22:51:48',NULL,NULL,'\"12113\"',1,3,20000.00,40000,0,'2018-12-01 00:00:00',NULL,0,0,NULL,NULL,NULL,NULL,0),(24,'申佩怡过生日发红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 22:51:56',NULL,NULL,'\"12113\"',0,3,20000.00,40000,0,'2018-12-01 00:00:00',NULL,0,0,NULL,NULL,NULL,NULL,0),(25,'申佩怡过生日发红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 22:52:06',NULL,NULL,'\"12113\"',0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(26,'发红包测试插入数据库(非拼模式）','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-27 14:13:43',NULL,NULL,'\"12113\"',0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(27,'发红包测试插入数据库(拼模式）','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-27 14:18:27',NULL,NULL,'\"12113\"',1,3,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0),(28,'关注公众号红包','oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-27 21:42:24',NULL,NULL,'\"12113\"',0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,'wx718e3695c5f79f4b','广州轻码',0);
/*!40000 ALTER TABLE `bus_redbag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_redbag_alloc`
--

DROP TABLE IF EXISTS `bus_redbag_alloc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_redbag_alloc` (
  `red_id` int(11) NOT NULL COMMENT '红包id',
  `user_id` char(36) NOT NULL COMMENT '抢到红包的用户',
  `seq_price` decimal(11,2) NOT NULL COMMENT '金额',
  `got_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '到账日期',
  KEY `redIndex` (`red_id`),
  KEY `userIndex` (`user_id`),
  CONSTRAINT `fk_alloc_ref_redbag` FOREIGN KEY (`red_id`) REFERENCES `bus_redbag` (`red_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag_alloc`
--

LOCK TABLES `bus_redbag_alloc` WRITE;
/*!40000 ALTER TABLE `bus_redbag_alloc` DISABLE KEYS */;
INSERT INTO `bus_redbag_alloc` VALUES (26,'oXaLv0AQExFgABKejkm-rwdJHjYo3',0.13,'2018-12-27 14:17:07'),(27,'oXaLv0AQExFgABKejkm-rwdJHjYo5',6.87,'2018-12-27 14:22:10'),(27,'oXaLv0AQExFgABKejkm-rwdJHjYo6',2.09,'2018-12-27 14:22:10'),(27,'oXaLv0AQExFgABKejkm-rwdJHjYo7',0.72,'2018-12-27 14:22:10');
/*!40000 ALTER TABLE `bus_redbag_alloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_redbag_order`
--

DROP TABLE IF EXISTS `bus_redbag_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_redbag_order` (
  `order_id` char(36) NOT NULL COMMENT '订单id',
  `order_date` datetime NOT NULL COMMENT '订单日期',
  `order_tx_no` varchar(20) NOT NULL COMMENT '微信支付流水号',
  `order_paytype` tinyint(4) NOT NULL COMMENT '支付方式\n            0: 线上微信支付\n            1：线下转账',
  `red_id` int(11) NOT NULL COMMENT '关联红包活动',
  `red_amount` decimal(11,2) NOT NULL COMMENT '红包金额',
  `service_total` decimal(11,2) NOT NULL COMMENT '服务费用',
  `order_total` decimal(11,2) NOT NULL COMMENT '支付金额',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态\n            0：订单待支付\n            1：订单已支付',
  `pay_date` datetime DEFAULT NULL COMMENT '支付日期',
  `order_updator` char(36) DEFAULT NULL COMMENT '线下支付操作人',
  `order_image` varchar(255) DEFAULT NULL COMMENT '线下支付截图',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `txnoIndex` (`order_tx_no`),
  KEY `fk_order_ref_redbag` (`red_id`),
  CONSTRAINT `fk_order_ref_redbag` FOREIGN KEY (`red_id`) REFERENCES `bus_redbag` (`red_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag_order`
--

LOCK TABLES `bus_redbag_order` WRITE;
/*!40000 ALTER TABLE `bus_redbag_order` DISABLE KEYS */;
INSERT INTO `bus_redbag_order` VALUES ('0ab11b8e-0834-11e9-a3dd-66ac2cd7b4fe','2018-12-25 18:58:42','B-1545735522',1,11,20000.00,200.00,20200.00,1,'2018-12-25 18:58:53',NULL,NULL),('22cf8576-082e-11e9-a3dd-66ac2cd7b4fe','2018-12-25 18:16:25','B-1545732985',1,10,20000.00,200.00,20200.00,1,'2018-12-25 18:16:34',NULL,NULL),('3798b654-0837-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:21:26','B-1545736886',1,14,200.00,2.00,202.00,1,'2018-12-25 19:21:36',NULL,NULL),('38149e80-0801-11e9-a3dd-66ac2cd7b4fe','2018-12-25 12:54:54','B-1545713694',1,8,20000.00,200.00,20200.00,1,'2018-12-25 13:31:07',NULL,NULL),('3968f8ea-099f-11e9-a3dd-66ac2cd7b4fe','2018-12-27 14:18:27','B-1545891507',1,27,200.00,2.00,202.00,1,'2018-12-27 14:18:35',NULL,NULL),('3dfe7cfc-09dd-11e9-a3dd-66ac2cd7b4fe','2018-12-27 21:42:24','B-1545918144',1,28,20.00,0.20,20.20,1,'2018-12-27 21:42:38',NULL,NULL),('4d266c36-0838-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:29:11','B-1545737351',1,17,200.00,2.00,202.00,1,'2018-12-25 19:29:19',NULL,NULL),('665479ba-0837-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:22:44','B-1545736964',1,15,200.00,2.00,202.00,1,'2018-12-25 19:22:51',NULL,NULL),('7a53982e-0837-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:23:18','B-1545736998',1,16,20000.00,200.00,20200.00,1,'2018-12-25 19:23:27',NULL,NULL),('8d6a960a-0838-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:30:59','B-1545737459',1,18,200.00,2.00,202.00,1,'2018-12-25 19:31:08',NULL,NULL),('901a406e-099e-11e9-a3dd-66ac2cd7b4fe','2018-12-27 14:13:43','B-1545891223',1,26,20.00,0.20,20.20,1,'2018-12-27 14:13:51',NULL,NULL),('9b3344fa-0854-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:51:48','B-1545749508',1,23,20000.00,200.00,20200.00,0,NULL,NULL,NULL),('a0118798-0854-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:51:56','B-1545749516',1,24,20000.00,200.00,20200.00,0,NULL,NULL,NULL),('a5eb1b3e-0854-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:52:06','B-1545749526',1,25,20.00,0.20,20.20,1,'2018-12-25 22:52:16',NULL,NULL),('b11f01de-0852-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:38:06','B-1545748686',1,22,20000.00,200.00,20200.00,1,'2018-12-25 22:38:19',NULL,NULL),('bfbc4008-0843-11e9-a3dd-66ac2cd7b4fe','2018-12-25 20:51:08','B-1545742268',1,20,2000.00,20.00,2020.00,0,NULL,NULL,NULL),('c5a27274-0836-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:18:14','B-1545736694',1,13,200.00,2.00,202.00,1,'2018-12-25 19:18:23',NULL,NULL),('c67b2098-0835-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:11:06','B-1545736266',1,12,200.00,2.00,202.00,1,'2018-12-25 19:11:17',NULL,NULL),('c689cd88-0843-11e9-a3dd-66ac2cd7b4fe','2018-12-25 20:51:19','B-1545742279',1,21,2000.00,20.00,2020.00,1,'2018-12-25 20:51:32',NULL,NULL),('c710af2a-0838-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:32:36','B-1545737556',1,19,2000.00,20.00,2020.00,1,'2018-12-25 19:32:43',NULL,NULL),('fdfb389e-082d-11e9-a3dd-66ac2cd7b4fe','2018-12-25 18:15:23','B-1545732923',1,9,20000.00,200.00,20200.00,1,'2018-12-25 18:15:34',NULL,NULL);
/*!40000 ALTER TABLE `bus_redbag_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_user`
--

DROP TABLE IF EXISTS `crm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_user` (
  `user_id` char(36) NOT NULL COMMENT '用户ID（主键）',
  `share_id` char(36) DEFAULT NULL COMMENT '进入小程序的shareid',
  `wx_unionid` char(36) NOT NULL COMMENT '微信唯一用户id',
  `user_mobile` varchar(64) DEFAULT NULL COMMENT '绑定手机',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `user_logo` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '性别\n            0：女\n            1：男',
  `user_birthday` datetime DEFAULT NULL COMMENT '用户生日',
  `user_credit` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `user_balance` decimal(8,2) DEFAULT NULL COMMENT '用户当前余额',
  `rec_create_date` datetime NOT NULL COMMENT '用户入驻日期',
  `login_times` int(11) DEFAULT '1' COMMENT '用户登录次数',
  `ext_field1` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段1',
  `ext_field2` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段2',
  `ext_field3` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unionidIndex` (`wx_unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_user`
--

LOCK TABLES `crm_user` WRITE;
/*!40000 ALTER TABLE `crm_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'redbag'
--
/*!50003 DROP FUNCTION IF EXISTS `func_randalloc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_randalloc`(
	#计算随机红包,以分为单位
	remainAmount int,
    remainPeople int
) RETURNS int(11)
BEGIN
	declare maxBouns int default 0;
    declare minBouns int default 0;
    declare Boundrange int;
    declare rand double default rand();
	if remainPeople = 1 then 
		return remainAmount;
	end if;
	set maxBouns = (remainAmount / remainPeople) * 2 - 1;
	set minBouns = 1;
	set Boundrange = maxBouns - minBouns;
	return minBouns + cast(rand * Boundrange as signed);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_member_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_member_register`(
	wxunionid char(36),
    shareid	char(36)
)
BEGIN
  #Routine body goes here...
    #declare userid char(36) default uuid();
    if not exists(select 1 from crm_user where wx_unionid=wxunionid) then
		insert into crm_user(
			user_id,wx_unionid,share_id,rec_create_date
		)
		values(
			wxunionid,wxunionid,shareid,NOW()
		);	
	else 
		update crm_user set 
			share_id = shareid,
			login_times = login_times+1
		where wx_unionid=wxunionid;
	end if;	
	
	select  
		user_id,
        wx_unionid,
        user_name, 
        user_logo
		from crm_user 
        where user_id=wxunionid;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_member_setinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_member_setinfo`(
#更新用户的头像和名称
	wxunionid char(36),
    username varchar(64),
    userlogo varchar(255)
)
BEGIN
  #Routine body goes here...
    #declare userid char(36) default uuid();
    if not exists(select 1 from crm_user where wx_unionid=wxunionid) then
		insert into crm_user(
			user_id,wx_unionid,rec_create_date,user_name,user_logo
		)
		values(
			wxunionid,wxunionid,NOW(),username,userlogo
		);	
	else 
		
			update crm_user set 
				user_name 	= username,
                user_logo	= userlogo,
                login_times = login_times+1
			where wx_unionid=wxunionid;
	end if;	
	
	select  
		user_id,
        wx_unionid,
        user_name, 
        user_logo
		from crm_user 
        where wx_unionid=wxunionid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_alloc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_alloc`(
#为需求分配红包
redid int,  #红包id
bonustotal decimal(8,2),    #红包总金额
bounscount int,      #红包数量
alloctype int			#分配方式
)
BEGIN
    declare remainTotal int;
    declare remainCnt int;
    declare bonus int ;
    declare bonusSql varchar(5000) default '';
    declare seqid	int default 1;
    declare avgamount int;
    
	if bonustotal>0 then
            set remainCnt	= bounscount;
			set remainTotal = bonustotal * 100;
            set avgamount 	= bonustotal * 100 / bounscount;
            
            repeat 
				set bonus 	= if(alloctype=0,func_randalloc(remainTotal,remainCnt),avgamount);
                set remainTotal = remainTotal-bonus;
                #select remainTotal;
                set bonusSql = concat_ws(',',bonusSql,  concat('(',redid,',',seqid,',',cast((bonus/100) as decimal(6,2)),')'));
				set remainCnt = remainCnt-1;
                set seqid=seqid+1;
                #到一定长度就需要执行
                if length(bonusSql)>3000 then 
					set bonusSql=substring(bonusSql,2);
					set @exeSql=concat("insert into bus_redbag_alloc(red_id,seq_id,seq_price) values ",bonusSql);  
						-- select @exeSql;  
						prepare stmt from @exeSql;  
						EXECUTE stmt;  
						deallocate prepare stmt;  
					set bonusSql='';
				end if;
			until remainCnt <=0
			end repeat;
		if length(bonusSql)>0 then 
			set bonusSql=substring(bonusSql,2);
			set @exeSql=concat("insert into bus_redbag_alloc(red_id,seq_id,seq_price) values ",bonusSql);  
				-- select @exeSql;  
				prepare stmt from @exeSql;  
				EXECUTE stmt;  
				deallocate prepare stmt;  
		end if;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_create`(
#创建红包活动
topic 		varchar(128),		#红包活动的主题
userid 		char(36),in			#创建红包的用户
layout		varchar(2048),		#红包的样式布局定义
playtype 	tinyint,			#红包活动的玩法 0:直接开  1：多人拼红包
groupcount	tinyint,			#多人助力拼包的人数
amount		decimal(8,2),		#红包总金额
total		int,				#红包的总份数
paytype		tinyint,			#红包的支付方式
alloctype	tinyint,			#红包分配方式
startdate	datetime,			#红包开抢日期
enddate		datetime,			#红包结束日期
userlimit	tinyint,			#用户领取红包限制		0：每用户一次   1：每用户每天限一次
appid		varchar(20),		#是否需要关注公众号
appname		varchar(64),		#公众号的名称
public		tinyint			#活动是否公开在广场
)
BEGIN
	declare redid int default 0;
    declare orderid char(36) default uuid();
    declare txno varchar(20) default concat('B-',unix_timestamp(now()));
    declare servicerate int default 10;
    #发红包的服务费用
    declare servicetotal decimal(8,2);
    set servicetotal = (amount * servicerate)/ 1000;
	insert into bus_redbag (
		red_topic,
        user_id,
        red_create_date,
        red_layout,
        red_type,
        red_group,
        red_amount,
        red_total,
        red_alloc,
        red_start,
        red_end,
        red_user_limit,
        app_id,
        app_name,
        red_ispublic
        )
	values(
		topic ,
		userid ,
        now(),
		layout,
		playtype ,
		groupcount,
		amount,
		total,
		alloctype,
		startdate,
		enddate	,
		userlimit,
        appid,
        appname,
		public
    );
	#获得红包活动的id
	select LAST_INSERT_ID()  into redid;
    
    #插入红包活动需要支付的订单
    insert into bus_redbag_order (
		order_id,
        order_date,
        order_tx_no,
        order_paytype,
        red_id,
        red_amount,
        service_total,
        order_total
        )
	values(
		orderid,
        now(),
		txno ,
		paytype,
        redid,
		amount,
		servicetotal,    #服务费暂定为0.01
        amount + servicetotal
    );
    
	#生成红包的订单用于前端支付	
	#call proc_redbag_alloc(redid,amount,total,alloctype);
    
    #select t_error as result,redid;
    select 0 as result,redid,orderid,txno,paytype,topic,amount + servicetotal as cost;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_createdbyuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_createdbyuser`(
#获取用户创建的红包活动
userid	char(36),
startpage int,
pagerows int
)
BEGIN
	set startpage=(startpage-1)*pagerows;
	select 
		r.red_id 		as id,
        red_topic		as topic,
        red_create_date	as createdate,
        red_type		as playtype,
        red_amount		as amount,
        red_total		as total,
        red_alloc		as alloctype,
        red_start		as startdate,
        red_end			as enddate,
        red_qr			as qr,
        red_status		as `status`,
        o.order_id		as orderid
	from bus_redbag r
	inner join bus_redbag_order o on r.red_id = o.red_id
    where r.user_id = userid
    ORDER BY red_create_date DESC 
    LIMIT startpage,pagerows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_editbyid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_editbyid`(
#编辑红包活动的布局和标题
redid	int,
userid	char(36)
)
BEGIN
	select
		redid 		as id,
		red_topic	as topic,
        red_layout	as layout,
        red_bgp		as background,
        red_bgm		as bgm
    from bus_redbag
    where 
		red_id 	= redid
	and user_id = userid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_orderpayed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_orderpayed`(
#红包支付完毕,正式生成红包
orderno varchar(20)	#红包订单的支付流水
)
BEGIN
	declare redid int;
    declare orderid char(36);
    declare redamount	decimal(8,2);   #需要发的红包总金额
    declare redtotal	int;			#红包总数量
    declare alloctype	tinyint;		#红包的分配方式
    select 
		order_id,o.red_id,r.red_amount,r.red_total,r.red_alloc
		into orderid,redid,redamount,redtotal,alloctype
    from 
		bus_redbag_order o
	inner join bus_redbag r on o.red_id = r.red_id
    where order_tx_no = orderno
    and  order_status = 0;
    
    #该订单确实未支付
    if orderid is not null and redid is not null then
		#修改订单状态为已支付
		update bus_redbag_order 
			set
			order_status 	= 1,
            pay_date		= now()
		where order_id		= orderid;
        
        #修改红包活动状态为可用
        update bus_redbag
			set 
				red_status = 1
		where red_id=redid;        
        #生成红包	
		#call proc_redbag_alloc(redid,redamount,redtotal,alloctype);
    end if;
    
    #返回记录
    select if(redid is null,1,0) as result,redid,redamount as amount,redtotal as total,alloctype;
    #把生成的红包信息也返回，插入到redis中
    /*if redid is not null then
		select 
			seq_id as id,
			seq_price as money 
		from bus_redbag_alloc 
        where 
			red_id=redid order by seq_id;
    end if;
    */
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_payredbag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_payredbag`(
#支付待支付的红包活动
redid	int
)
BEGIN
	declare orderid char(36);	#对应的订单id
    declare amount decimal(8,2);
    declare service	decimal(8,2);
	declare txno varchar(20) default concat('B-',unix_timestamp(now()));
    declare paytype tinyint;
    select 
		order_id,order_total,order_paytype
        into orderid,amount,paytype
	from 
		bus_redbag_order
	where red_id = redid and order_status=0;
    
    if orderid is not null then
    
		#更新一下微信支付的订单流水号
		update bus_redbag_order
			set order_tx_no = txno
		where order_id=orderid;
        
    end if;
     select if(orderid is null,1,0) as result,redid,orderid,txno,paytype,amount as cost;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_update`(
#更新红包基础信息
redid	int,
topic	varchar(128),
layout	varchar(2048),
userid	char(36)
)
BEGIN
	update bus_redbag
		set 
			red_topic 	= topic,
            red_layout	= layout
	where 
		red_id			= redid
	and user_id			= userid;
END ;;
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

-- Dump completed on 2018-12-27 22:15:47
