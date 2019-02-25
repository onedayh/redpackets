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
-- Table structure for table `bas_red_background`
--

DROP TABLE IF EXISTS `bas_red_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_red_background` (
  `bg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '背景id',
  `bg_title` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '背景标题',
  `bg_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '背景类型\n            0:背景图片\n            1：背景音乐',
  `bg_file` varchar(255) DEFAULT NULL COMMENT '背景文件',
  `bg_layout` varchar(1024) DEFAULT NULL COMMENT '背景的式样布局',
  `bg_index` int(11) DEFAULT NULL COMMENT '排序位置',
  `bg_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可用状态',
  PRIMARY KEY (`bg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_red_background`
--

LOCK TABLES `bas_red_background` WRITE;
/*!40000 ALTER TABLE `bas_red_background` DISABLE KEYS */;
INSERT INTO `bas_red_background` VALUES (2,'大话西游',1,'redbag/background/music/cb63ac7e-e5f1-45fd-b001-cda46de99713.mp3',NULL,3,1),(3,'猪年红包',0,'redbag/background/image/a9221225-c090-4686-94ad-e3d654fc5333.jpeg','{\r\nhot:{point:[354,278]}\r\nbless:{\r\n      point:[300,400],\r\n      font:{size:16rpx,color:#fff}\r\n}\r\n}',5,0);
/*!40000 ALTER TABLE `bas_red_background` ENABLE KEYS */;
UNLOCK TABLES;

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
  `red_bless` varchar(64) DEFAULT NULL COMMENT '祝福语',
  `user_id` char(36) NOT NULL COMMENT '创建用户',
  `red_create_date` datetime NOT NULL COMMENT '创建日期',
  `red_bgp` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `red_bgm` varchar(255) DEFAULT NULL COMMENT '背景音频',
  `red_layout` varchar(1024) DEFAULT NULL COMMENT '布局样式',
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
  `red_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包是否允许分享',
  PRIMARY KEY (`red_id`),
  KEY `userIndex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag`
--

LOCK TABLES `bus_redbag` WRITE;
/*!40000 ALTER TABLE `bus_redbag` DISABLE KEYS */;
INSERT INTO `bus_redbag` VALUES (8,'哆咪科技创建,迎春酬宾大红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo4','2018-12-25 12:54:54',NULL,NULL,NULL,0,2,20000.00,50000,0,'2019-01-30 00:00:00',NULL,0,1,NULL,NULL,'','',0,0),(9,'红包测试成功大红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 18:15:23',NULL,NULL,'\"12113\"',0,0,20000.00,50000,0,'2019-01-30 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(10,'马上测试发个成功大红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 18:16:25',NULL,NULL,'\"12113\"',0,0,20000.00,50000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(11,'马上测试发个成功大红包来转账',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 18:58:42',NULL,NULL,'\"12113\"',0,0,20000.00,20000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(12,'马上测试发个成功大红包来转账',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:11:06',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(13,'马上测试发个成功大红包来转账2',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:18:14',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(14,'马上测试发个成功大红包来转账3',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:21:26',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(15,'马上测试发个成功大红包来转账4',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:22:44',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(16,'马上测试发个成功大红包来转账5',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:23:18',NULL,NULL,'\"12113\"',0,0,20000.00,4000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(17,'马上测试发个成功大红包来转账6',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:29:11',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(18,'马上测试发个成功大红包来转账7',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:30:59',NULL,NULL,'\"12113\"',0,0,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(19,'马上测试发个成功大红包来转账8',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 19:32:36',NULL,NULL,'\"12113\"',0,0,2000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(20,'搞个拼红包的',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 20:51:08',NULL,NULL,'\"12113\"',1,0,2000.00,40,0,'2018-12-01 00:00:00',NULL,0,0,NULL,NULL,NULL,NULL,0,0),(21,'搞个拼红包的1',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 20:51:19',NULL,NULL,'\"12113\"',1,3,2000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(22,'申佩怡过生日发红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 22:38:06',NULL,NULL,'\"12113\"',1,3,20000.00,40000,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(23,'申佩怡过生日发红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 22:51:48',NULL,NULL,'\"12113\"',1,3,20000.00,40000,0,'2018-12-01 00:00:00',NULL,0,0,NULL,NULL,NULL,NULL,0,0),(24,'申佩怡过生日发红包',NULL,'oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-25 22:51:56','','',NULL,0,3,20000.00,40000,0,'2018-12-01 00:00:00',NULL,0,0,NULL,NULL,'','',0,0),(25,'申佩怡过生日发红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-25 22:52:06',NULL,NULL,'\"12113\"',0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(26,'发红包测试插入数据库(非拼模式）',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-27 14:13:43','redbag/background/image/299a5da4-faca-47d9-9a4c-6b242e5d94ec.jpeg','redbag/background/music/20390796-66c5-4b10-8daf-2237aff79ad2.mp3',NULL,0,3,4000.00,4,0,'2018-12-01 00:00:00','2019-01-31 00:33:00',0,1,NULL,NULL,'','',0,0),(27,'发红包测试插入数据库(拼模式）','大吉大利，恭喜发财','oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-27 14:18:27','redbag/background/image/5e65aba1-7a6c-4971-96cf-c3ece78032db.jpg','',NULL,1,3,200.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,'','',0,0),(28,'关注公众号红包',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-27 21:42:24',NULL,NULL,'\"12113\"',0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,'wx718e3695c5f79f4b','广州轻码',0,0),(29,'正式发红包1',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-28 00:12:46',NULL,NULL,'\"12113\"',0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,NULL,NULL,0,0),(30,'正式发红包1111',NULL,'oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-28 00:13:31',NULL,NULL,NULL,0,3,20.00,4,0,'2018-12-01 00:00:00',NULL,0,1,NULL,NULL,'','',0,0),(31,'2018年最后一次发红包11111',NULL,'oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-31 17:36:17',NULL,NULL,NULL,1,3,1000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,'redbag/qrcode/20181231/ef86adf8-75ec-491e-9abb-a67a3f18f456.png','','',0,0),(32,'2018年发红包11111',NULL,'oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-31 21:59:07',NULL,NULL,NULL,1,3,1000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,'redbag/qrcode/20181231/cf07b6f1-0008-40a2-aec6-b4bb4c8847ab.png','','',0,0),(33,'2018年发红包156',NULL,'oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-31 22:06:53',NULL,NULL,NULL,1,3,1000.00,40,0,'2018-12-01 00:00:00',NULL,0,1,NULL,'redbag/qrcode/20181231/423bf3c3-b087-49bb-900c-4165e8f64f59.png','','',0,0),(34,'2018年抢红包',NULL,'oXaLv0KyT2wRmdjHuG9yRPUp4l1M','2018-12-31 22:09:29',NULL,NULL,NULL,0,2,100.00,10,0,'2018-12-01 00:00:00',NULL,0,1,NULL,'redbag/qrcode/20181231/99620265-4f91-45e7-a1b3-ac71e4b486d7.png','','',0,0);
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
INSERT INTO `bus_redbag_alloc` VALUES (26,'oXaLv0AQExFgABKejkm-rwdJHjYo3',0.13,'2018-12-27 14:17:07'),(27,'oXaLv0AQExFgABKejkm-rwdJHjYo5',6.87,'2018-12-27 14:22:10'),(27,'oXaLv0AQExFgABKejkm-rwdJHjYo6',2.09,'2018-12-27 14:22:10'),(27,'oXaLv0AQExFgABKejkm-rwdJHjYo7',0.72,'2018-12-27 14:22:10'),(32,'oXaLv0AQExFgABKejkm-rwdJHjYo2',34.40,'2018-12-31 22:04:38'),(32,'oXaLv0AQExFgABKejkm-rwdJHjYo3',22.15,'2018-12-31 22:04:38'),(32,'oXaLv0AQExFgABKejkm-rwdJHjYo4',36.20,'2018-12-31 22:04:38'),(33,'oXaLv0AQExFgABKejkm-rwdJHjYo',1.76,'2018-12-31 22:07:58'),(33,'oXaLv0AQExFgABKejkm-rwdJHjYo1',44.60,'2018-12-31 22:07:58'),(33,'oXaLv0AQExFgABKejkm-rwdJHjYo2',36.32,'2018-12-31 22:07:58'),(34,'oXaLv0AQExFgABKejkm-rwdJHjYo',8.02,'2018-12-31 22:10:04'),(34,'oXaLv0AQExFgABKejkm-rwdJHjYo1',3.11,'2018-12-31 22:10:13'),(34,'oXaLv0AQExFgABKejkm-rwdJHjYo2',9.76,'2018-12-31 22:10:16');
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
INSERT INTO `bus_redbag_order` VALUES ('0ab11b8e-0834-11e9-a3dd-66ac2cd7b4fe','2018-12-25 18:58:42','B-1545735522',1,11,20000.00,200.00,20200.00,1,'2018-12-25 18:58:53',NULL,NULL),('22cf8576-082e-11e9-a3dd-66ac2cd7b4fe','2018-12-25 18:16:25','B-1545732985',1,10,20000.00,200.00,20200.00,1,'2018-12-25 18:16:34',NULL,NULL),('3798b654-0837-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:21:26','B-1545736886',1,14,200.00,2.00,202.00,1,'2018-12-25 19:21:36',NULL,NULL),('38149e80-0801-11e9-a3dd-66ac2cd7b4fe','2018-12-25 12:54:54','B-1546447882',1,8,20000.00,200.00,20200.00,1,'2018-12-25 13:31:07',NULL,NULL),('3968f8ea-099f-11e9-a3dd-66ac2cd7b4fe','2018-12-27 14:18:27','B-1546615047',1,27,200.00,2.00,202.00,1,'2018-12-27 14:18:35',NULL,NULL),('3d9fcdae-0d04-11e9-9211-d0821af995fc','2018-12-31 21:59:07','B-1546447267',1,32,1000.00,10.00,1010.00,1,'2018-12-31 21:59:26',NULL,NULL),('3dfe7cfc-09dd-11e9-a3dd-66ac2cd7b4fe','2018-12-27 21:42:24','B-1545918144',1,28,20.00,0.20,20.20,1,'2018-12-27 21:42:38',NULL,NULL),('3f547d3a-09f2-11e9-a3dd-66ac2cd7b4fe','2018-12-28 00:12:46','B-1545927166',1,29,20.00,0.20,20.20,1,'2018-12-28 00:13:03',NULL,NULL),('4d266c36-0838-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:29:11','B-1545737351',1,17,200.00,2.00,202.00,1,'2018-12-25 19:29:19',NULL,NULL),('532f7eac-0d05-11e9-9211-d0821af995fc','2018-12-31 22:06:53','B-1546447158',1,33,1000.00,10.00,1010.00,1,'2018-12-31 22:07:05',NULL,NULL),('5a1eeca4-09f2-11e9-a3dd-66ac2cd7b4fe','2018-12-28 00:13:31','B-1546447499',1,30,20.00,0.20,20.20,1,'2018-12-28 00:15:01',NULL,NULL),('665479ba-0837-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:22:44','B-1545736964',1,15,200.00,2.00,202.00,1,'2018-12-25 19:22:51',NULL,NULL),('7a53982e-0837-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:23:18','B-1545736998',1,16,20000.00,200.00,20200.00,1,'2018-12-25 19:23:27',NULL,NULL),('85f8ea6a-0cdf-11e9-9211-d0821af995fc','2018-12-31 17:36:17','B-1546447339',1,31,1000.00,10.00,1010.00,1,'2018-12-31 17:40:30',NULL,NULL),('8d6a960a-0838-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:30:59','B-1545737459',1,18,200.00,2.00,202.00,1,'2018-12-25 19:31:08',NULL,NULL),('901a406e-099e-11e9-a3dd-66ac2cd7b4fe','2018-12-27 14:13:43','B-1546533254',1,26,4000.00,40.00,4040.00,1,'2018-12-27 14:13:51',NULL,NULL),('9b3344fa-0854-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:51:48','B-1545749508',1,23,20000.00,200.00,20200.00,0,NULL,NULL,NULL),('a0118798-0854-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:51:56','B-1546534281',1,24,20000.00,200.00,20200.00,0,NULL,NULL,NULL),('a5eb1b3e-0854-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:52:06','B-1545749526',1,25,20.00,0.20,20.20,1,'2018-12-25 22:52:16',NULL,NULL),('b0509210-0d05-11e9-9211-d0821af995fc','2018-12-31 22:09:29','B-1546447149',1,34,100.00,1.00,101.00,1,'2018-12-31 22:09:40',NULL,NULL),('b11f01de-0852-11e9-a3dd-66ac2cd7b4fe','2018-12-25 22:38:06','B-1545748686',1,22,20000.00,200.00,20200.00,1,'2018-12-25 22:38:19',NULL,NULL),('bfbc4008-0843-11e9-a3dd-66ac2cd7b4fe','2018-12-25 20:51:08','B-1545742268',1,20,2000.00,20.00,2020.00,0,NULL,NULL,NULL),('c5a27274-0836-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:18:14','B-1545736694',1,13,200.00,2.00,202.00,1,'2018-12-25 19:18:23',NULL,NULL),('c67b2098-0835-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:11:06','B-1545736266',1,12,200.00,2.00,202.00,1,'2018-12-25 19:11:17',NULL,NULL),('c689cd88-0843-11e9-a3dd-66ac2cd7b4fe','2018-12-25 20:51:19','B-1545742279',1,21,2000.00,20.00,2020.00,1,'2018-12-25 20:51:32',NULL,NULL),('c710af2a-0838-11e9-a3dd-66ac2cd7b4fe','2018-12-25 19:32:36','B-1545737556',1,19,2000.00,20.00,2020.00,1,'2018-12-25 19:32:43',NULL,NULL),('fdfb389e-082d-11e9-a3dd-66ac2cd7b4fe','2018-12-25 18:15:23','B-1545732923',1,9,20000.00,200.00,20200.00,1,'2018-12-25 18:15:34',NULL,NULL);
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
INSERT INTO `crm_user` VALUES ('oXaLv0AQExFgABKejkm-rwdJHjYo',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo',NULL,'古惑狼','https://wx.qlogo.cn/mmopen/vi_32/1lXNro8YYpkg398JnEUicgXzEelk8neOSyvI98bcxvJYcWpfAZ3g4HlODK6knwgeG2d8lL7ATkibdX7arw7MicYtQ/132',1,NULL,0,9.78,'2018-12-31 20:38:19',4,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo1',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo1',NULL,'申佩怡','https://wx.qlogo.cn/mmopen/vi_32/1lXNro8YYpkg398JnEUicgXzEelk8neOSyvI98bcxvJYcWpfAZ3g4HlODK6knwgeG2d8lL7ATkibdX7arw7MicYtQ/132',1,NULL,0,47.71,'2018-12-31 20:38:19',2,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo2',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo2',NULL,'申佩怡1','https://wx.qlogo.cn/mmopen/vi_32/1lXNro8YYpkg398JnEUicgXzEelk8neOSyvI98bcxvJYcWpfAZ3g4HlODK6knwgeG2d8lL7ATkibdX7arw7MicYtQ/132',1,NULL,0,80.48,'2018-12-31 20:38:19',2,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo3',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo3',NULL,'申佩怡2','https://wx.qlogo.cn/mmopen/vi_32/WZ2Wvthj3YDhqS7njjicDrTfAfxOQ50AMBnucocaribQncYW03lhKcC7eMGgT1BSsMJib90fZj3zSicaYibvqeogmPQ/132',1,NULL,0,22.15,'2018-12-31 20:38:19',2,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo4',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo4',NULL,'申佩怡3','https://wx.qlogo.cn/mmopen/vi_32/WZ2Wvthj3YDhqS7njjicDrTfAfxOQ50AMBnucocaribQncYW03lhKcC7eMGgT1BSsMJib90fZj3zSicaYibvqeogmPQ/132',1,NULL,0,36.20,'2018-12-31 20:38:19',3,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo5',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo5',NULL,'申佩怡4','https://wx.qlogo.cn/mmopen/vi_32/WZ2Wvthj3YDhqS7njjicDrTfAfxOQ50AMBnucocaribQncYW03lhKcC7eMGgT1BSsMJib90fZj3zSicaYibvqeogmPQ/132',1,NULL,0,NULL,'2018-12-31 20:38:19',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `crm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_user_balance`
--

DROP TABLE IF EXISTS `crm_user_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_user_balance` (
  `user_id` char(36) NOT NULL COMMENT '用户ID（主键）',
  `rec_date` datetime NOT NULL COMMENT '记录日期',
  `io_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '出入项类型\n0:支出\n1:收入',
  `bus_type` tinyint(4) NOT NULL DEFAULT '51' COMMENT '1:提现支出\n 51:红包收入 52:提现失败退回',
  `red_id` int(11) DEFAULT NULL COMMENT '相关红包活动id',
  `rec_total` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '流水金额',
  KEY `userIndex` (`user_id`),
  CONSTRAINT `fk_balance_ref_user` FOREIGN KEY (`user_id`) REFERENCES `crm_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_user_balance`
--

LOCK TABLES `crm_user_balance` WRITE;
/*!40000 ALTER TABLE `crm_user_balance` DISABLE KEYS */;
INSERT INTO `crm_user_balance` VALUES ('oXaLv0AQExFgABKejkm-rwdJHjYo2','2018-12-31 22:04:38',1,51,32,34.40),('oXaLv0AQExFgABKejkm-rwdJHjYo3','2018-12-31 22:04:38',1,51,32,22.15),('oXaLv0AQExFgABKejkm-rwdJHjYo4','2018-12-31 22:04:38',1,51,32,36.20),('oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-31 22:07:58',1,51,33,1.76),('oXaLv0AQExFgABKejkm-rwdJHjYo1','2018-12-31 22:07:58',1,51,33,44.60),('oXaLv0AQExFgABKejkm-rwdJHjYo2','2018-12-31 22:07:58',1,51,33,36.32),('oXaLv0AQExFgABKejkm-rwdJHjYo','2018-12-31 22:10:04',1,51,34,8.02),('oXaLv0AQExFgABKejkm-rwdJHjYo1','2018-12-31 22:10:13',1,51,34,3.11),('oXaLv0AQExFgABKejkm-rwdJHjYo2','2018-12-31 22:10:16',1,51,34,9.76);
/*!40000 ALTER TABLE `crm_user_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_function`
--

DROP TABLE IF EXISTS `fw_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_function` (
  `fun_id` char(36) NOT NULL COMMENT '菜单UID',
  `fun_parent_id` char(36) DEFAULT NULL,
  `fun_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `fun_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `fun_index` int(11) DEFAULT NULL COMMENT '排序',
  `fun_type` tinyint(4) DEFAULT '0',
  `fun_url` varchar(255) DEFAULT NULL COMMENT '连接地址',
  `fun_disabled` tinyint(4) DEFAULT '0',
  `fun_open` tinyint(4) DEFAULT '0',
  `rec_creator` char(36) NOT NULL COMMENT '创建者',
  `rec_create_date` datetime NOT NULL COMMENT '记录创建',
  `rec_updator` char(36) NOT NULL COMMENT '修改者',
  `rec_update_date` datetime NOT NULL COMMENT '记录修改',
  `rec_isdeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fun_id`),
  KEY `fk_func_ref_self` (`fun_parent_id`),
  CONSTRAINT `fk_func_ref_self` FOREIGN KEY (`fun_parent_id`) REFERENCES `fw_function` (`fun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_function`
--

LOCK TABLES `fw_function` WRITE;
/*!40000 ALTER TABLE `fw_function` DISABLE KEYS */;
INSERT INTO `fw_function` VALUES ('015da735-5717-4e01-8019-04d754778a05','cfd13eae-f9e5-485b-8666-5e3f1aa40763','线下活动',NULL,70,0,'/activity/activitylist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-28 03:39:01','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-28 03:39:01',0),('0c282cd5-5a95-408e-9b59-4d23ff061c81','113e5cf2-e90b-453d-a555-e5c701ef1043','收益提现',NULL,100,0,'/finance/withdrawlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 03:47:42','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-01 10:17:42',0),('113e5cf2-e90b-453d-a555-e5c701ef1043',NULL,'收支','speech/framework/menuicon/finance.png',80,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 12:42:48','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:03',0),('2a906f7f-9d1d-4cd2-afb4-04587ab171fa',NULL,'哒伴','menuicon/user2.png',40,0,NULL,1,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:10:15','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:30:20',1),('35dfeaa1-606d-488a-81d5-e501b53e91e9','cfd13eae-f9e5-485b-8666-5e3f1aa40763','文章推广',NULL,100,0,'/course/articlelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-13 06:38:26','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-13 06:38:26',0),('392f1254-2c35-4e9f-a0c3-79ed3e28189d','f9a71679-54a3-43ca-824f-3773d45ee60f','消息推送',NULL,20,0,'/message/policylist',1,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-25 11:30:04','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-25 11:30:04',1),('3dd3006e-18bc-428a-a4e0-9dae116a939b','2a906f7f-9d1d-4cd2-afb4-04587ab171fa','哒伴聚',NULL,30,0,'/crm/eventlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 11:20:04','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 11:20:04',1),('3e3e3748-edc4-499c-8da1-3054e67f6871','e7ae03fb-f8d2-11e6-8e70-f0def107233a','消息推送',NULL,10,0,'/message/policylist',1,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:39','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:39',1),('3ffaf59e-017b-11e7-acd2-f0def107233a','e7ae03fb-f8d2-11e6-8e70-f0def107233a','功能菜单',NULL,100,0,'admin/sysmenutree',0,0,'3ffaf638-017b-11e7-acd2-f0def107233a','2017-03-05 16:10:45','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:19',0),('4b95b1a4-6aa8-421d-8b70-69e25ff3efad','2a906f7f-9d1d-4cd2-afb4-04587ab171fa','哒伴圈',NULL,20,0,'/crm/grouplist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 11:19:43','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 11:19:43',1),('59b577ea-0df0-4925-90de-b99eab083f63','2a906f7f-9d1d-4cd2-afb4-04587ab171fa','哒伴友',NULL,10,0,'/crm/memberlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:10:46','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 11:19:28',1),('6053388e-cc10-4147-920f-d5aadbfcce9e','e7ae03fb-f8d2-11e6-8e70-f0def107233a','分销返利设置',NULL,30,0,'/admin/rebatelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-10 02:58:36','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-10 02:58:36',0),('6c4c80cd-d129-4288-8295-bf18929f319c','e7ae03fb-f8d2-11e6-8e70-f0def107233a','字典维护',NULL,4,0,'/admin/dictionarylist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-03-07 02:18:56','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-25 11:28:49',0),('7134ce59-ffad-48d8-b52e-23ee214b60de','cfd13eae-f9e5-485b-8666-5e3f1aa40763','学习',NULL,100,0,'/daily/practicelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-17 01:30:05','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-13 10:59:02',0),('72f9aac1-f8d3-11e6-8e70-f0def107233a','e7ae03fb-f8d2-11e6-8e70-f0def107233a','组织架构管理',NULL,30,0,'/admin/userlist',0,0,'72f9aaff-f8d3-11e6-8e70-f0def107233a','2017-02-22 15:49:33','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:52:56',0),('78a192c6-8346-4acb-8cc6-576b250b0f6c','f9a71679-54a3-43ca-824f-3773d45ee60f','应用反馈',NULL,80,0,'/admin/feedbacklist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-05 06:08:37','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-05 06:08:37',0),('8df5bad7-8e58-4d54-b155-b5eebd75de9a','113e5cf2-e90b-453d-a555-e5c701ef1043','销售返利',NULL,50,0,'/finance/rebatelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 04:45:13','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 04:45:34',0),('a035aa86-d927-47dc-89a1-25839a22de38','cfd13eae-f9e5-485b-8666-5e3f1aa40763','推广文章',NULL,100,0,'/course/articlelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-13 04:43:27','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-13 04:43:27',1),('ac5393fc-77de-4c73-8786-ed28ba41e8a7','cfd13eae-f9e5-485b-8666-5e3f1aa40763','余歌商城',NULL,80,0,'/mall/productlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-29 06:25:38','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-29 06:25:38',0),('b27d1f25-e065-4d6a-89f4-8200f776b570','cfd13eae-f9e5-485b-8666-5e3f1aa40763','用户',NULL,10,0,'/crm/memberlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-22 03:16:05','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-02 12:02:15',0),('cfd13eae-f9e5-485b-8666-5e3f1aa40763',NULL,'红包','speech/framework/menuicon/speech.png',30,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:33:32','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-02 12:02:08',0),('e5bd90b0-5ecc-44cf-9662-6d491eb3d4d5','f9a71679-54a3-43ca-824f-3773d45ee60f','界面配置',NULL,3,0,'/ui/layouttree',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-12 04:07:32','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-01 10:17:53',0),('e6a18e35-c077-4e89-b7a8-ee4619b1d089','e7ae03fb-f8d2-11e6-8e70-f0def107233a','系统角色',NULL,40,0,'admin/rolelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:10:19','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:05',0),('e7ae03fb-f8d2-11e6-8e70-f0def107233a',NULL,'系统','speech/framework/menuicon/computer.png',1000,0,NULL,0,0,'e7ae0439-f8d2-11e6-8e70-f0def107233a','2017-02-22 15:45:39','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:24',0),('f551584d-1af4-4278-90a1-999326579cb1','113e5cf2-e90b-453d-a555-e5c701ef1043','销售记录',NULL,20,0,'/finance/orderlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 12:43:14','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 12:43:14',0),('f6644b8b-f9e0-43d6-aa2d-80207e15d609','cfd13eae-f9e5-485b-8666-5e3f1aa40763','主题背景',NULL,50,0,'/redbag/backgroundlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:34:58','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-04 12:00:24',0),('f9040a15-eb67-4d0c-847d-5d3576886078','e7ae03fb-f8d2-11e6-8e70-f0def107233a','分享配置',NULL,20,0,'/admin/sharelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-08 01:20:43','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-08 01:20:43',0),('f9a71679-54a3-43ca-824f-3773d45ee60f',NULL,'平台','speech/framework/menuicon/setting.png',90,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-07 12:00:12','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:15',0),('fa808258-5892-4d60-9881-50467c644a00','f9a71679-54a3-43ca-824f-3773d45ee60f','平台参数',NULL,5,0,'/admin/systemsetting?actiontype=edit&key=e10ec07c-0a19-11e7-aeb1-f0def107233a',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:03:36','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-25 11:28:23',0),('fb25a880-1205-4227-b249-760f0f405b41','cfd13eae-f9e5-485b-8666-5e3f1aa40763','小红包',NULL,20,0,'/redbag/redbaglist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-22 03:16:26','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-02 12:02:52',0);
/*!40000 ALTER TABLE `fw_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_function_privilege`
--

DROP TABLE IF EXISTS `fw_function_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_function_privilege` (
  `rec_id` char(36) NOT NULL COMMENT '记录UID',
  `fun_id` char(36) NOT NULL COMMENT '菜单UID',
  `user_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `right_data` int(11) NOT NULL COMMENT '权限明细项',
  PRIMARY KEY (`rec_id`),
  KEY `fun_index` (`fun_id`),
  CONSTRAINT `fk_menu_ref_right` FOREIGN KEY (`fun_id`) REFERENCES `fw_function` (`fun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_function_privilege`
--

LOCK TABLES `fw_function_privilege` WRITE;
/*!40000 ALTER TABLE `fw_function_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `fw_function_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_roles`
--

DROP TABLE IF EXISTS `fw_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_roles` (
  `role_id` char(36) NOT NULL COMMENT '角色ID',
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `role_admin` tinyint(4) DEFAULT '0',
  `ext_field1` varchar(255) DEFAULT NULL COMMENT '扩展字段1',
  `rec_creator` char(36) NOT NULL COMMENT '创建者',
  `rec_create_date` datetime NOT NULL COMMENT '记录创建',
  `rec_updator` char(36) NOT NULL COMMENT '修改者',
  `rec_update_date` datetime NOT NULL COMMENT '记录修改',
  `rec_isdeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_roles`
--

LOCK TABLES `fw_roles` WRITE;
/*!40000 ALTER TABLE `fw_roles` DISABLE KEYS */;
INSERT INTO `fw_roles` VALUES ('dc09cce8-f285-11e6-ba7a-f0def107233a','系统管理员（不要删除',1,NULL,'dc09cd54-f285-11e6-ba7a-f0def107233a','2017-02-14 15:19:01','8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:11:24',0);
/*!40000 ALTER TABLE `fw_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_userrole`
--

DROP TABLE IF EXISTS `fw_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_userrole` (
  `rec_id` char(36) NOT NULL COMMENT '记录UID',
  `role_id` char(36) NOT NULL COMMENT '角色ID',
  `user_id` char(36) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`rec_id`),
  KEY `userindex` (`user_id`),
  KEY `roleindex` (`role_id`),
  CONSTRAINT `FK_role_ref_user` FOREIGN KEY (`user_id`) REFERENCES `fw_users` (`user_id`),
  CONSTRAINT `FK_user_ref_role` FOREIGN KEY (`role_id`) REFERENCES `fw_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_userrole`
--

LOCK TABLES `fw_userrole` WRITE;
/*!40000 ALTER TABLE `fw_userrole` DISABLE KEYS */;
INSERT INTO `fw_userrole` VALUES ('446965b5-28c5-11e7-9ad3-7cd30abeb162','dc09cce8-f285-11e6-ba7a-f0def107233a','8973d1a3-c78b-11e6-afbd-f0def107233a');
/*!40000 ALTER TABLE `fw_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_users`
--

DROP TABLE IF EXISTS `fw_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_users` (
  `user_id` char(36) NOT NULL COMMENT '用户ID',
  `user_account` varchar(15) NOT NULL COMMENT '用户账号',
  `user_password` varchar(128) NOT NULL COMMENT '用户密码',
  `user_name` varchar(64) NOT NULL COMMENT '用户名称',
  `user_photo` varchar(255) DEFAULT NULL COMMENT '用户照片',
  `user_email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `user_disabled` tinyint(4) DEFAULT '0',
  `user_is_admin` bit(1) NOT NULL DEFAULT b'0' COMMENT '超级管理员\n            0:否\n            1:是',
  `user_im` varchar(40) DEFAULT NULL COMMENT '微信账号',
  `rec_create_date` datetime NOT NULL COMMENT '记录创建',
  `rec_creator` char(36) NOT NULL COMMENT '创建者',
  `rec_update_date` datetime NOT NULL COMMENT '记录修改',
  `rec_updator` char(36) NOT NULL COMMENT '修改者',
  `rec_isdeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `accountindex` (`user_account`),
  KEY `apindex` (`user_account`,`user_password`,`user_disabled`),
  KEY `deleteindex` (`rec_isdeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_users`
--

LOCK TABLES `fw_users` WRITE;
/*!40000 ALTER TABLE `fw_users` DISABLE KEYS */;
INSERT INTO `fw_users` VALUES ('8973d1a3-c78b-11e6-afbd-f0def107233a','admin','dc483e80a7a0bd9ef71d8cf973673924','管理员',NULL,NULL,0,'',NULL,'2016-12-21 23:12:42','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:37:48','8973d1a3-c78b-11e6-afbd-f0def107233a',0);
/*!40000 ALTER TABLE `fw_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_redbag`
--

DROP TABLE IF EXISTS `vw_redbag`;
/*!50001 DROP VIEW IF EXISTS `vw_redbag`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_redbag` AS SELECT 
 1 AS `id`,
 1 AS `topic`,
 1 AS `bless`,
 1 AS `userid`,
 1 AS `username`,
 1 AS `userlogo`,
 1 AS `paytype`,
 1 AS `orderid`,
 1 AS `createdate`,
 1 AS `bgimage`,
 1 AS `bgmusic`,
 1 AS `type`,
 1 AS `groupmin`,
 1 AS `amount`,
 1 AS `total`,
 1 AS `gotamount`,
 1 AS `gottotal`,
 1 AS `alloc`,
 1 AS `startdate`,
 1 AS `enddate`,
 1 AS `status`,
 1 AS `qrcode`,
 1 AS `appid`,
 1 AS `appname`,
 1 AS `public`,
 1 AS `share`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_users`
--

DROP TABLE IF EXISTS `vw_users`;
/*!50001 DROP VIEW IF EXISTS `vw_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_users` AS SELECT 
 1 AS `isnew`,
 1 AS `id`,
 1 AS `name`,
 1 AS `logo`,
 1 AS `sex`,
 1 AS `balance`,
 1 AS `createdate`,
 1 AS `logintimes`,
 1 AS `totalred`*/;
SET character_set_client = @saved_cs_client;

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
/*!50003 DROP FUNCTION IF EXISTS `fun_dayindays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fun_dayindays`(
#判断 whichDay 是否正好在 startDay 和 endDay之间
whichDay datetime,
startDay datetime,
endDay	 datetime,
compare	 varchar(20)
) RETURNS int(11)
BEGIN
	#set startDay = ifnull(startDay,DATE_sub(whichDay,INTERVAL 1 DAY));
    #set endDay = ifnull(endDay,DATE_ADD(whichDay,INTERVAL 1 DAY));
    if startDay is null or endDay is null then return -100; end if;
	#比较方式包括时间
	if compare = 'time' then	
		  if TIMESTAMPDIFF(SECOND,startDay,whichDay) < 0 then return -1; end if;
		  if TIMESTAMPDIFF(SECOND,endDay,whichDay) > 0 then return -2; end if;
		  return 1;
	else
		
		if datediff(whichDay,startDay) < 0 then return -1; end if;
		if datediff(whichDay,endDay) > 0 then return -2; end if;
		return 1;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_GetUserPrivelegeForMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fun_GetUserPrivelegeForMenu`(menuId char(36),userId char(36)) RETURNS varchar(11) CHARSET utf8
BEGIN

	DECLARE fullright INT default 0;
        
    
	DECLARE ptemp varchar(4000) default '#';
	DECLARE ctemp varchar(2000) default menuId;
    
	WHILE ctemp is not null DO
		SET ptemp = concat(ptemp,',',ctemp);
		SELECT group_concat(fun_parent_id) INTO ctemp FROM fw_function   
		WHERE FIND_IN_SET(fun_id,ctemp)>0; 
	END WHILE;   
	select 
    
    
    group_concat(right_data) into ctemp 
    from fw_function_privilege
    where find_in_set(fun_id,ptemp)>0 
    and (role_id in (select role_id from fw_userrole where user_id=userId) or user_id=userId);
    
    IF ctemp IS NOT NULL THEN
		SET @count=CHAR_LENGTH(ctemp)-CHAR_LENGTH(REPLACE(ctemp,',','')) + 1;
        
        SET @iIndex=1;
		WHILE @iIndex <= @count DO
			SET @tmpValue= SUBSTRING_INDEX(SUBSTRING_INDEX(ctemp,',',@iIndex),',',-1);
            SET fullright = fullright | @tmpValue;
            SET @iIndex=@iIndex+1;
		END WHILE;
    END IF;
	RETURN fullright;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_analysis_summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_analysis_summary`()
BEGIN
	/****统计用户数据******/
    # 平台用户总数，以及今日新增的用户数
	select 
		count(1) as user_count,
        count(if(datediff(rec_create_date,now())=0,true,null)) as todayuser
    from crm_user;
    
    /***红包数据统计****/
    select 
			count(1) as redbags,
            count(if(red_status=1,true,null)) as activitied,
            sum(red_amount) as totalamount,
            sum(red_total) as totalredbags
	
		from  
		
		bus_redbag
        where red_status<>0;
        
	 /***领取红包数据统计****/
    select 
			count(1) as got_redbags,
            sum(seq_price) as got_amount
	from  
			bus_redbag_alloc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_balance_record` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_balance_record`(
#记录余额流水
userid char(36),		#用户id
iotype	tinyint,		#收支类型   0 支出  1：收入
bustype	tinyint,		#业务类型    
/*
 1~ 50 : 全部属于支出类型
            1：钱包消费
            
            51~100：全部属于收入类型
            51： 余额充值
			52:  购物卡充值
            53:	 订单退款

*/
redid	int,			#红包活动id
money	decimal(8,2)	#流水金额
)
BEGIN
	#增加钱包流水记录
	insert into crm_user_balance(
		user_id,
        rec_date,
        io_type,
        bus_type,
        red_id,
        rec_total)
	values(
		userid,
        now(),
        iotype,
        bustype,
        redid,
        money);
    #修改用户的钱包余额
    update crm_user set user_balance = ifnull(user_balance,0)+if(iotype=0,-1,1)*money 
    where user_id=userid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_GetSecurityForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_GetSecurityForUser`(user_uid char(36))
BEGIN
	
	IF EXISTS(SELECT fu.role_id FROM fw_userrole as fu 
	INNER JOIN fw_roles as fr ON fu.role_id = fr.role_id
	WHERE fu.user_id=user_uid AND fr.role_admin=1) THEN
		SELECT secobj.obj_id,secobj.obj_url,secobj.obj_method,0 as call_able,0 as filter_type,
		'' as custom_filter,'' AS disabled_control,'' as unvisibled_control,'' as valid_control
		from fw_sec_object secobj where 1=0;
    ELSE
		SELECT secobj.obj_id,secobj.obj_url,secobj.obj_method,IFNULL(call_able,0) as call_able,IFNULL(filter_type,0) as filter_type,
		custom_filter,disabled_control,unvisibled_control,valid_control
		from fw_sec_object secobj
		left join 
		(
		select obj_id,call_able,filter_type,custom_filter,disabled_control,unvisibled_control,valid_control
		from fw_sec_setting 
		where user_id =user_uid
		or role_id in (select role_id from fw_userrole where user_id=user_uid)
		) setting on setting.obj_id = secobj.obj_id
		where  secobj.obj_disabled=0 and IFNULL(secobj.rec_isdeleted,0)=0
		order by secobj.obj_url;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_GetSystemFunctions4User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_GetSystemFunctions4User`(userId char(36),allDirectory tinyint)
BEGIN
	
	IF EXISTS(SELECT fu.role_id FROM fw_userrole as fu 
	INNER JOIN fw_roles as fr ON fu.role_id = fr.role_id
	WHERE fu.user_id=userId AND fr.role_admin=1) THEN
		select fun_id as id,fun_parent_id as pid,fun_name as 'name',fun_type as 'type',fun_open as 'target',fun_icon as icon,
        fun_url as url,fun_disabled as disabled,fun_index as findex,4294901760 AS privilege
        from fw_function where rec_isdeleted=0 and fun_disabled=0 order by fun_index;
	ELSE 
		
		 CREATE TEMPORARY TABLE TMPDIRTREE
		 (
			id char(36),
			pid char(36),
			name NVARCHAR(255),
			type TINYINT,
			target TINYINT,
			icon NVARCHAR(255),
			url NVARCHAR(255),
			disabled TINYINT,
			findex INT,
			privilege BIGINT
		 );
		 create temporary table TREEIDS
         (
			id char(36)
         );

		 IF allDirectory=0 then
			INSERT INTO TMPDIRTREE
			SELECT fun_id,fun_parent_id,fun_name,fun_type,fun_open,fun_icon,fun_url,fun_disabled,fun_index,privilege
            FROM (
				SELECT fun_id,fun_parent_id,fun_name,fun_type,fun_open,fun_icon,fun_url,
				fun_disabled,fun_index,fun_GetUserPrivelegeForMenu(fun_id,userId) privilege
				FROM  fw_function 
				WHERE rec_isdeleted=0  AND fun_disabled=0
			) TMP 
			WHERE (privilege & 0x01)=0 AND (privilege & 0x10000)>0;
            
            create temporary table TREEFLAG SELECT * FROM TMPDIRTREE;
            insert into TREEIDS SELECT id FROM TMPDIRTREE;
			
			INSERT INTO TMPDIRTREE
			SELECT fun_id,fun_parent_id,fun_name,fun_type,fun_open,
				   fun_icon,fun_url,fun_disabled,fun_index,0 AS privilege
			FROM fw_function WHERE fun_disabled=0 AND fun_id IN 
			(
				SELECT pid FROM TREEFLAG
				WHERE  pid NOT IN (SELECT id FROM  TREEIDS)
			);
		ELSE
			INSERT INTO TMPDIRTREE
			SELECT fun_id,fun_parent_id,fun_name,fun_type,fun_open,fun_icon,fun_url,
			fun_disabled,fun_index,fun_GetUserPrivelegeForMenu(fun_id,userId) privilege
			FROM  fw_function 
			WHERE rec_isdeleted=0  AND fun_disabled=0;
			
            insert into TREEIDS SELECT id FROM TMPDIRTREE;
            
			DELETE FROM TMPDIRTREE WHERE TMPDIRTREE.pid NOT IN (SELECT id FROM  TREEIDS);
		END IF;
			
		SELECT * FROM TMPDIRTREE ORDER BY findex;
        DROP TEMPORARY TABLE IF EXISTS TMPDIRTREE; 
		DROP TEMPORARY TABLE IF EXISTS TREEFLAG; 
		DROP TEMPORARY TABLE IF EXISTS TREEIDS; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_Login`(username varchar(20),pwd varchar(128))
label_pro:BEGIN
	
	DECLARE userid char(36);
    DECLARE userPassword varchar(128);
    declare result int default 0;
    select user_id,user_password into userid,userPassword
	from fw_users 
    where user_account=username
		
		and rec_isdeleted=0;
    
    IF userid is NULL THEN 
		SET result = 1;
        SELECT result;
		LEAVE label_pro;
	END if;
    
	IF userPassword!=pwd THEN
		SET result = 2;
        SELECT result;
		LEAVE label_pro;
    END if;
	SELECT result;
	
	select user_id,user_name,user_photo
	from fw_users where user_id=userid;
    
    call proc_GetSystemFunctions4User(userid,0);
    
    #call proc_GetSecurityForUser(userid);
    
    
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
	wxunionid char(36)
)
BEGIN
    if not exists(select 1 from crm_user where wx_unionid=wxunionid) then
		insert into crm_user(
			user_id,wx_unionid,rec_create_date
		)
		values(
			wxunionid,wxunionid,NOW()
		);	
	else 
		
			update crm_user set 
                login_times = login_times+1
			where wx_unionid=wxunionid;
	end if;	
	
	select  
		wxunionid as user_id,
        wxunionid as wx_unionid,
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
	update crm_user set 
		user_name 	= username,
		user_logo	= userlogo,
		login_times = login_times+1
	where wx_unionid=wxunionid;
	
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_background` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_background`(
#获取所有有效的背景类型
)
BEGIN
	#背景封面类的
	select 
		bg_id 	as id,
        bg_title	as title,
        bg_file	as `file`,
        bg_layout	as layout
	from bas_red_background
    where 
		bg_type = 0 and bg_enabled=1;
	#背景音乐类的
	select 
		bg_id 	as id,
        bg_title	as title,
        bg_file	as `file`
	from bas_red_background
    where 
		bg_type = 1 and bg_enabled=1;
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
bless		varchar(64),		#红包祝福语
userid 		char(36),in			#创建红包的用户
bgimage		varchar(255),		#背景封面
bgmusic		varchar(255),		#背景音乐
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
public		tinyint,			#活动是否公开在广场
allowshare	tinyint				#活动是否支持分享
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
        red_bless,
        user_id,
        red_create_date,
        red_bgp,
        red_bgm,
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
        red_ispublic,
        red_share
        )
	values(
		topic ,
        bless,
		userid ,
        now(),
        bgimage,
        bgmusic,
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
		public,
        allowshare
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_getbyowner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_getbyowner`(
#获取用户发布的红包活动
userid		char(36),
startpage 	int,
pagerows 	int
)
BEGIN
	set startpage=(startpage-1)*pagerows;
    
    select 
		red_id		as id,
        red_topic	as topic,
        red_bgp		as redcover,
        red_amount	as amount,
		red_total	as total,
        red_status	as `status`,
        fun_dayindays(now(),red_start,red_end,'time') as startstatus,
        red_ispublic	as ispublic
    from bus_redbag 
	where user_id = userid
	ORDER BY red_create_date DESC 
    LIMIT startpage,pagerows;
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
orderno varchar(20),	#红包订单的支付流水
qrcode	varchar(255)	#红包的二维码
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
				red_status = 1,
                red_qr	   = qrcode
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_public` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_public`(
#获取投放在广场上的红包活动
startpage int,
pagerows int
)
BEGIN
	set startpage=(startpage-1)*pagerows;
    
    select 
		red_id		as id,
        red_topic	as topic,
        red_bgp		as redcover,
        red_amount	as amount,
		red_total	as total,
        fun_dayindays(now(),red_start,red_end,'time') as startstatus
    from bus_redbag 
    where 
		red_status = 1
	ORDER BY red_opendate DESC 
    LIMIT startpage,pagerows;
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
#修改红包活动
id			int,				#红包的id
topic 		varchar(128),		#红包活动的主题
bless		varchar(64),		#红包祝福
userid 		char(36),in			#创建红包的用户
bgimage		varchar(255),		#背景封面
bgmusic		varchar(255),		#背景音乐
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
public		tinyint,			#活动是否公开在广场
allowshare	tinyint				#是否允许分享
)
BEGIN
	declare redid int default 0;
    declare orderid char(36) default uuid();
    declare txno varchar(20) default concat('B-',unix_timestamp(now()));
    declare servicerate int default 10;
    #发红包的服务费用
    declare servicetotal decimal(8,2);
    set servicetotal = (amount * servicerate)/ 1000;
	update bus_redbag 
		set 
		red_topic 	= topic,
        red_bless	= bless,
        user_id 	= userid,
        red_bgp		= bgimage,
        red_bgm		= bgmusic,
        red_layout	= layout,
        red_type	= playtype,
        red_group	= groupcount,
        red_amount	= amount,
        red_total	= total,
        red_alloc	= alloctype,
        red_start	= startdate,
        red_end		= enddate,
        red_user_limit = userlimit,
        app_id		= appid,
        app_name	= appname,
        red_ispublic= public,
        red_share	= allowshare
	where red_id = id;
    
    #同时修改红包的支付订单（已经支付过的订单不能再修改）
    update bus_redbag_order 
		set 
			red_amount 		= amount,
            order_tx_no		= txno,
            service_total 	= servicetotal,
            order_total		= amount+servicetotal
	where red_id = id;
	#生成红包的订单用于前端支付	
	#call proc_redbag_alloc(redid,amount,total,alloctype);
    
    #select t_error as result,redid;
    select 0 as result,id as redid,order_id as orderid,txno,paytype,topic,amount + servicetotal as cost
    from bus_redbag_order where red_id= id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_redbag`
--

/*!50001 DROP VIEW IF EXISTS `vw_redbag`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_redbag` AS select `rb`.`red_id` AS `id`,`rb`.`red_topic` AS `topic`,`rb`.`red_bless` AS `bless`,`cu`.`user_id` AS `userid`,`cu`.`user_name` AS `username`,`cu`.`user_logo` AS `userlogo`,`ro`.`order_paytype` AS `paytype`,`ro`.`order_id` AS `orderid`,`rb`.`red_create_date` AS `createdate`,`rb`.`red_bgp` AS `bgimage`,`rb`.`red_bgm` AS `bgmusic`,`rb`.`red_type` AS `type`,`rb`.`red_group` AS `groupmin`,`rb`.`red_amount` AS `amount`,`rb`.`red_total` AS `total`,`alloc`.`gotamount` AS `gotamount`,ifnull(`alloc`.`gottotal`,0) AS `gottotal`,`rb`.`red_alloc` AS `alloc`,`rb`.`red_start` AS `startdate`,`rb`.`red_end` AS `enddate`,`rb`.`red_status` AS `status`,`rb`.`red_qr` AS `qrcode`,`rb`.`app_id` AS `appid`,`rb`.`app_name` AS `appname`,`rb`.`red_ispublic` AS `public`,`rb`.`red_share` AS `share` from (((`redbag`.`bus_redbag` `rb` join `redbag`.`crm_user` `cu` on((`rb`.`user_id` = `cu`.`user_id`))) left join `redbag`.`bus_redbag_order` `ro` on((`ro`.`red_id` = `rb`.`red_id`))) left join (select `redbag`.`bus_redbag_alloc`.`red_id` AS `red_id`,count(1) AS `gottotal`,sum(`redbag`.`bus_redbag_alloc`.`seq_price`) AS `gotamount` from `redbag`.`bus_redbag_alloc` group by `redbag`.`bus_redbag_alloc`.`red_id`) `alloc` on((`rb`.`red_id` = `alloc`.`red_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_users`
--

/*!50001 DROP VIEW IF EXISTS `vw_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_users` AS select (to_days(curdate()) - to_days(`cu`.`rec_create_date`)) AS `isnew`,`cu`.`user_id` AS `id`,`cu`.`user_name` AS `name`,`cu`.`user_logo` AS `logo`,`cu`.`user_sex` AS `sex`,`cu`.`user_balance` AS `balance`,`cu`.`rec_create_date` AS `createdate`,`cu`.`login_times` AS `logintimes`,(select ifnull(sum(`bus_redbag_alloc`.`seq_price`),0) from `bus_redbag_alloc` where (`bus_redbag_alloc`.`user_id` = `cu`.`user_id`)) AS `totalred` from `crm_user` `cu` */;
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

-- Dump completed on 2019-01-13 17:57:17
