-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: gz-cdb-8am065k1.sql.tencentcdb.com    Database: redbag
-- ------------------------------------------------------
-- Server version	5.7.18-txsql-log

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='a82fc2ea-b4ca-11e8-9611-6c92bf48246b:1-186739';

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
  `bg_share` varchar(128) DEFAULT NULL COMMENT '模板分享的图片',
  `bg_layout` varchar(1024) DEFAULT NULL COMMENT '背景的式样布局',
  `bg_index` int(11) DEFAULT NULL COMMENT '排序位置',
  `bg_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可用状态',
  PRIMARY KEY (`bg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_red_background`
--

LOCK TABLES `bas_red_background` WRITE;
/*!40000 ALTER TABLE `bas_red_background` DISABLE KEYS */;
INSERT INTO `bas_red_background` VALUES (2,'大话西游',1,'redbag/background/music/37216410-4cea-49d6-8742-982c853997ea.mp3',NULL,NULL,3,1),(3,'猪年红包',0,'redbag/background/image/74ccc098-a6a6-4c0f-a3b5-4d141c07d94c.jpeg',NULL,'{\r\nhot:{point:[354,278]}\r\nbless:{\r\n      point:[300,400],\r\n      font:{size:16rpx,color:#fff}\r\n}\r\n}',5,1),(4,'猪年大红包',0,'redbag/background/image/ce08e57f-3008-4e6a-8e4c-c1662f60e627.jpeg',NULL,NULL,3,1),(5,'猴年大红包',0,'redbag/background/image/4ac26d4d-0ac7-4c5a-a423-ee5076cd7549.jpeg',NULL,NULL,2,1),(6,'猪年背景1',0,'redbag/background/image/5ae5dae3-c05a-4a50-9e36-0f069ccd5e37.jpeg',NULL,NULL,NULL,1),(7,'猴年背景1',0,'redbag/background/image/20894473-dc23-4b15-9a08-ef2e8e5f04f6.jpeg',NULL,NULL,NULL,1),(8,'猪年背景2',0,'redbag/background/image/fd8b0035-d3b0-4f52-968e-1c6dfd1cf55e.jpeg',NULL,NULL,NULL,1),(9,'模板1',0,'redbag/background/image/0f1835af-c4db-479e-8246-ed6938365982.png',NULL,'{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding: 270rpx 80rpx 0;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;margin-bottom: 56rpx;\",\"topic\":\"color: #fff;font-size: 48rpx;padding-bottom: 50rpx;\",\"bless\":\"color: #fff;font-size: 30rpx;line-height: 44rpx;\",\"button\":\"width: 200rpx;height: 200rpx;border-radius: 50%;position: absolute;left: 50%;top: 716rpx;transform: translateX(-100rpx);\"}',108,1),(10,'模板2',0,'redbag/background/image/3d992833-388b-42e4-a28b-b7a0695f230d.png',NULL,'{\"wrap\":\"padding: 300rpx 100rpx 0 296rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;position: absolute;left: 128rpx;top: 300rpx;\",\"topic\":\"color: #fff;font-size: 34rpx;padding-bottom: 20rpx;\",\"bless\":\"color: #FFA3A3;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 166rpx;height: 166rpx;border-radius: 50%;position: absolute;left: 50%;transform: translateX(-83rpx);top: 938rpx;\"}',109,1),(11,'模板3',0,'redbag/background/image/acde9ec7-6d99-4cff-9cdc-9326537a4245.png',NULL,'{\"wrap\":\"padding: 250rpx 150rpx 0;display: flex;flex-direction: column;align-items: center;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 320rpx;\",\"topic\":\"color: #fff;font-size: 36rpx;font-weight: bold;padding-bottom: 30rpx;\",\"bless\":\"color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 150rpx;height: 150rpx;border-radius: 50%;position: absolute;right: 108rpx;top: 874rpx;\"}',110,1);
/*!40000 ALTER TABLE `bas_red_background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bas_red_music`
--

DROP TABLE IF EXISTS `bas_red_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_red_music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '音乐id',
  `music_title` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '音乐标题',
  `music_file` varchar(255) DEFAULT NULL COMMENT '背景文件',
  `music_index` int(11) DEFAULT NULL COMMENT '排序位置',
  `music_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可用状态',
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_red_music`
--

LOCK TABLES `bas_red_music` WRITE;
/*!40000 ALTER TABLE `bas_red_music` DISABLE KEYS */;
INSERT INTO `bas_red_music` VALUES (10,'大话西游','redbag/background/music/74b14511-d1e1-4be6-b98d-9be1796e7dab.mp3',3,1);
/*!40000 ALTER TABLE `bas_red_music` ENABLE KEYS */;
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
INSERT INTO `bas_wechat_publicinfo` VALUES ('wx1073a2ae2e60ce7e','广州哆咪科技','7b140d54791efb3d896512f9eca6ee74',NULL,NULL,NULL),('wx376d6fb043fbec43','弯弓在道公众号','ca26668d89a2df91688f6f86dd5d868f',NULL,NULL,NULL),('wx718e3695c5f79f4b','轻码微信服务号','9537ce94838f8d683bb8a6c4d3297bd3',NULL,NULL,NULL),('wxef31174b9f28d7d3','芝麻点友','f320eb210bd1cab252f5e19eeec40c75','1464858302','LiteCODER20161227HYaK166ZwehaPPy','apiclient_cert.p12'),('wxfa7d7a155dcef5a2','芝麻友','b68edcc4f30d62d061bf8f66d20ce9e8','1512804351','WeiShangLitecoder20180905HCOURSE','apiclient_cert.p12');
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
  `red_logo` varchar(128) DEFAULT NULL COMMENT '红包形象LOGO(默认用户的头像）',
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
  `force_follow_app` tinyint(2) NOT NULL DEFAULT '0' COMMENT '强制关注公众号',
  `app_id` varchar(20) DEFAULT NULL COMMENT '领取此红包需要关注的公众号',
  `app_name` varchar(64) DEFAULT NULL COMMENT '公众号的名称',
  `red_ispublic` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否放置于广场\n            0:不放置广场\n            1：放置在红包广场',
  `red_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包是否允许分享',
  `red_shareimage` varchar(128) DEFAULT NULL COMMENT '活动的分享图',
  `red_cleared` tinyint(2) DEFAULT '0' COMMENT '红包数据已清理',
  PRIMARY KEY (`red_id`),
  KEY `userIndex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag`
--

LOCK TABLES `bus_redbag` WRITE;
/*!40000 ALTER TABLE `bus_redbag` DISABLE KEYS */;
INSERT INTO `bus_redbag` VALUES (96,'第一个红包（不拼+关注）','redbag/background/image/bdb00e42-ab6a-4d14-bcd2-0c1e5464395b.jpeg','新年大吉 恭喜发财','osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-21 11:51:26','redbag/background/image/3d992833-388b-42e4-a28b-b7a0695f230d.png','redbag/background/music/0a182a8e-d38a-41dc-b882-4b1528424906.mp3','{\"wrap\":\"padding: 300rpx 100rpx 0 296rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;position: absolute;left: 128rpx;top: 300rpx;\",\"topic\":\"color: #fff;font-size: 34rpx;padding-bottom: 20rpx;\",\"bless\":\"color: #FFA3A3;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 166rpx;height: 166rpx;border-radius: 50%;position: absolute;left: 50%;transform: translateX(-83rpx);top: 938rpx;\"}',0,2,20.00,5,0,NULL,NULL,0,1,'2019-01-21 00:00:00','redbag/qrcode/20190121/4227e74a-3c33-4d32-8f19-4ee400f3ec02.png',1,'wx1073a2ae2e60ce7e','广州哆咪科技',0,0,'',0),(97,'微软中国给全国人民拜年','redbag/background/image/c784cf8a-211e-4c5e-98ac-e2023c2f5092.jpeg','猪年来临，祝愿全国人民猪年吉祥，家庭幸福','osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-21 17:51:12','redbag/background/image/3d992833-388b-42e4-a28b-b7a0695f230d.png','','{\"wrap\":\"padding: 300rpx 100rpx 0 296rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;position: absolute;left: 128rpx;top: 300rpx;\",\"topic\":\"color: #fff;font-size: 34rpx;padding-bottom: 20rpx;\",\"bless\":\"color: #FFA3A3;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 166rpx;height: 166rpx;border-radius: 50%;position: absolute;left: 50%;transform: translateX(-83rpx);top: 938rpx;\"}',0,2,1000.00,40,0,NULL,NULL,0,1,'2019-01-21 00:00:00','redbag/qrcode/20190121/05b55e75-4fac-4af1-8814-9a57488a1be2.png',0,'','',0,1,'redbag/background/image/23a9b145-c550-4d22-a21a-a0c514408e60.jpeg',0),(98,'微商课程表祝福大家新年快乐','redbag/background/image/811ebbfb-66e2-42ae-8d4e-efb5a4e5be59.png','恭喜发财 猪年大吉','osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 17:56:29','redbag/background/image/acde9ec7-6d99-4cff-9cdc-9326537a4245.png','','{\"wrap\":\"padding: 250rpx 150rpx 0;display: flex;flex-direction: column;align-items: center;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 320rpx;\",\"topic\":\"color: #fff;font-size: 36rpx;font-weight: bold;padding-bottom: 30rpx;\",\"bless\":\"color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 150rpx;height: 150rpx;border-radius: 50%;position: absolute;right: 108rpx;top: 874rpx;\"}',0,4,100.00,20,0,NULL,NULL,0,1,'2019-01-21 00:00:00','redbag/qrcode/20190121/162efe2b-f942-4b0b-aaa2-1edadbd203de.png',0,'','',0,1,'',0);
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
INSERT INTO `bus_redbag_alloc` VALUES (96,'osDAK4-b6jbKQ4sLBILt1e83p7Ec',4.50,'2019-01-21 11:55:46'),(96,'osDAK42fDN8gBMR8Qjd05eJeq9mQ',2.47,'2019-01-21 12:00:33'),(97,'osDAK4-b6jbKQ4sLBILt1e83p7Ec',24.01,'2019-01-21 17:52:07');
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
  `order_update_date` datetime DEFAULT NULL COMMENT '订单更新日期',
  `order_memo` varchar(128) DEFAULT NULL COMMENT '订单备注',
  `order_image` varchar(255) DEFAULT NULL COMMENT '线下支付截图',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `txnoIndex` (`order_tx_no`),
  UNIQUE KEY `fk_order_ref_redbag` (`red_id`),
  CONSTRAINT `fk_order_ref_redbag` FOREIGN KEY (`red_id`) REFERENCES `bus_redbag` (`red_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag_order`
--

LOCK TABLES `bus_redbag_order` WRITE;
/*!40000 ALTER TABLE `bus_redbag_order` DISABLE KEYS */;
INSERT INTO `bus_redbag_order` VALUES ('15fef796-1d62-11e9-8b8a-6c92bf48246b','2019-01-21 17:51:12','B-1548064272',1,97,1000.00,20.00,1020.00,1,'2019-01-21 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 17:51:25','','redbag/orderimage/15809741-942c-4758-867b-2155e94cc34a.jpeg'),('d31f7210-1d62-11e9-8b8a-6c92bf48246b','2019-01-21 17:56:29','B-1548064589',1,98,100.00,2.00,102.00,1,'2019-01-21 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 17:56:39','','redbag/orderimage/29c7173e-19e8-47c7-9f6a-2b59f535fb1d.jpeg'),('d3aeccf3-1d2f-11e9-8b8a-6c92bf48246b','2019-01-21 11:51:26','B-1548042686',1,96,20.00,0.05,20.05,1,'2019-01-21 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 11:51:36','','redbag/orderimage/0950c0d2-4718-44ce-b1ec-531a77108226.jpg');
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
  `user_city` varchar(64) DEFAULT NULL COMMENT '所在城市',
  `user_birthday` datetime DEFAULT NULL COMMENT '用户生日',
  `user_credit` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `user_balance` decimal(8,2) DEFAULT NULL COMMENT '用户当前余额',
  `user_total_balance` decimal(8,2) DEFAULT NULL COMMENT '用户累计收取红包',
  `user_total_provider` decimal(8,2) DEFAULT NULL COMMENT '用户累计发放的红包',
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
INSERT INTO `crm_user` VALUES ('osDAK4-b6jbKQ4sLBILt1e83p7Ec',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec',NULL,'古惑狼?','https://wx.qlogo.cn/mmopen/vi_32/ouw2pZaGhwW88ochya9ExCoT94bYKTHqcclVZDrNPBcTxbwqxAqpVgz7QRym2QblGicGPpvKvhxKoXlLZKdzGBQ/132',1,'Shaoyang',NULL,0,85.15,92.15,1328.00,'2019-01-15 14:07:09',121,NULL,NULL,NULL),('osDAK400eifBzPPrT1yTsDwIrTAY',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY',NULL,'L','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqPlIKp8iaPxf8Vj6JWgsMEfre2LqXricoXxqAmKRUlZMTTxtM0nu2UFNiaicJYKNKMAvAAicKltnLygPw/132',1,'Guangzhou',NULL,0,34.31,34.31,36.00,'2019-01-18 16:51:43',21,NULL,NULL,NULL),('osDAK42DiM0NtB8VqVove-gQ3Wzg',NULL,'osDAK42DiM0NtB8VqVove-gQ3Wzg',NULL,'佩琪','https://wx.qlogo.cn/mmopen/vi_32/Z3AsrdliaNury5T5W9hw6QSrO8JnQicOpBqHWHZiaTicVXmN8RrZmRP4icRgke6WhwW3uLWnmGjiaC9OfkE7gKVJ821g/132',2,'Kirkland',NULL,0,24.59,24.59,40.00,'2019-01-15 22:05:32',22,NULL,NULL,NULL),('osDAK42fDN8gBMR8Qjd05eJeq9mQ',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ',NULL,'刘盼。','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLsThiaOiaRYUOempQNW0tRo2sCzn2TiaxWnicWYsFInvWNlEaMwNWeIcBBrXthymHmSrVQ3aOfQGO5BA/132',1,'Guangzhou',NULL,0,263.96,271.06,880.00,'2019-01-15 11:56:08',744,NULL,NULL,NULL),('osDAK433U9RX1TnQe5xl-Xy7A-zc',NULL,'osDAK433U9RX1TnQe5xl-Xy7A-zc',NULL,'刘洁','https://wx.qlogo.cn/mmopen/vi_32/0YRSb7hiaGZfyp9nGSP3FySVL1tMibWymicuaZOCITPc9QRBiaGGaRyAaQIeztDIV9Ju6m68vtvib0mkzwvFUjZWS4g/132',2,'Guangzhou',NULL,0,41.55,41.55,80.00,'2019-01-15 21:56:44',16,NULL,NULL,NULL),('osDAK4w9B1eJRORKjlfvGFd1xowU',NULL,'osDAK4w9B1eJRORKjlfvGFd1xowU',NULL,'枫','https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJH2c2yVJicw1AEvNwnFEVAiaeGIQau3nlGPvVqnbj8LtWFwbMTOoHfwfLMXDZbKr14CYyTicFGsiao7A/132',1,'',NULL,0,NULL,NULL,NULL,'2019-01-21 12:12:37',399,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo',NULL,'古惑狼','https://wx.qlogo.cn/mmopen/vi_32/1lXNro8YYpkg398JnEUicgXzEelk8neOSyvI98bcxvJYcWpfAZ3g4HlODK6knwgeG2d8lL7ATkibdX7arw7MicYtQ/132',1,NULL,NULL,0,9.78,NULL,370.00,'2018-12-31 20:38:19',4,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo1',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo1',NULL,'申佩怡','https://wx.qlogo.cn/mmopen/vi_32/1lXNro8YYpkg398JnEUicgXzEelk8neOSyvI98bcxvJYcWpfAZ3g4HlODK6knwgeG2d8lL7ATkibdX7arw7MicYtQ/132',1,NULL,NULL,0,47.71,NULL,NULL,'2018-12-31 20:38:19',2,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo2',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo2',NULL,'申佩怡1','https://wx.qlogo.cn/mmopen/vi_32/1lXNro8YYpkg398JnEUicgXzEelk8neOSyvI98bcxvJYcWpfAZ3g4HlODK6knwgeG2d8lL7ATkibdX7arw7MicYtQ/132',1,NULL,NULL,0,80.48,NULL,NULL,'2018-12-31 20:38:19',2,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo3',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo3',NULL,'申佩怡2','https://wx.qlogo.cn/mmopen/vi_32/WZ2Wvthj3YDhqS7njjicDrTfAfxOQ50AMBnucocaribQncYW03lhKcC7eMGgT1BSsMJib90fZj3zSicaYibvqeogmPQ/132',1,NULL,NULL,0,22.15,NULL,1000.00,'2018-12-31 20:38:19',2,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo4',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo4',NULL,'申佩怡3','https://wx.qlogo.cn/mmopen/vi_32/WZ2Wvthj3YDhqS7njjicDrTfAfxOQ50AMBnucocaribQncYW03lhKcC7eMGgT1BSsMJib90fZj3zSicaYibvqeogmPQ/132',1,NULL,NULL,0,36.20,NULL,NULL,'2018-12-31 20:38:19',3,NULL,NULL,NULL),('oXaLv0AQExFgABKejkm-rwdJHjYo5',NULL,'oXaLv0AQExFgABKejkm-rwdJHjYo5',NULL,'申佩怡4','https://wx.qlogo.cn/mmopen/vi_32/WZ2Wvthj3YDhqS7njjicDrTfAfxOQ50AMBnucocaribQncYW03lhKcC7eMGgT1BSsMJib90fZj3zSicaYibvqeogmPQ/132',1,NULL,NULL,0,NULL,NULL,NULL,'2018-12-31 20:38:19',1,NULL,NULL,NULL);
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
  `data_id` char(36) DEFAULT NULL COMMENT '相关红包活动id',
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
INSERT INTO `crm_user_balance` VALUES ('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-15 18:50:48',1,51,'40',0.12),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-15 18:51:40',1,51,'39',11.16),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-15 18:53:27',1,51,'38',5.36),('osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-15 21:57:11',1,51,'42',1.57),('osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-15 21:58:25',1,51,'41',3.92),('osDAK42DiM0NtB8VqVove-gQ3Wzg','2019-01-15 22:06:15',1,51,'41',15.77),('osDAK42DiM0NtB8VqVove-gQ3Wzg','2019-01-15 22:11:41',1,51,'42',0.35),('osDAK42DiM0NtB8VqVove-gQ3Wzg','2019-01-15 22:18:17',1,51,'38',0.73),('osDAK42DiM0NtB8VqVove-gQ3Wzg','2019-01-15 22:46:35',1,51,'43',2.66),('osDAK42DiM0NtB8VqVove-gQ3Wzg','2019-01-15 22:47:37',1,51,'37',4.62),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-15 22:56:19',1,51,'44',6.79),('osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-15 22:57:24',1,51,'44',22.75),('osDAK42DiM0NtB8VqVove-gQ3Wzg','2019-01-15 22:59:32',1,51,'44',0.46),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-15 23:20:01',1,51,'45',3.61),('osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-15 23:21:45',1,51,'45',2.79),('osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-15 23:23:10',1,51,'46',3.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-16 16:17:06',1,51,'47',0.73),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-17 18:03:39',1,51,'55',121.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-17 19:06:14',1,51,'58',5.04),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:11:15',1,51,'58',18.96),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 11:29:27',1,51,'59',3.86),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 15:10:02',1,51,'61',17.78),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:56:03',1,51,'62',21.51),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-18 16:56:06',1,51,'62',2.49),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 11:30:51',1,51,'74',9.10),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 11:30:51',1,51,'74',14.90),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 12:05:03',1,51,'76',22.96),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 12:05:03',1,51,'76',1.04),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 12:53:30',1,51,'77',9.13),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 12:53:30',1,51,'77',2.87),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 13:10:34',1,51,'78',5.35),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 14:07:22',1,51,'79',0.37),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 14:07:22',1,51,'79',23.63),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 15:12:12',0,1,'b545e141-1c82-11e9-8b8a-6c92bf48246b',1.00),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 15:13:35',0,1,'e6ecfea4-1c82-11e9-8b8a-6c92bf48246b',1.50),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 15:14:19',0,1,'011cafae-1c83-11e9-8b8a-6c92bf48246b',1.50),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 15:15:02',0,1,'1acbceac-1c83-11e9-8b8a-6c92bf48246b',1.50),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 15:18:51',0,1,'a30eb41a-1c83-11e9-8b8a-6c92bf48246b',1.50),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 15:59:56',0,1,'6053d6c4-1c89-11e9-8b8a-6c92bf48246b',1.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 16:00:04',0,1,'65064344-1c89-11e9-8b8a-6c92bf48246b',1.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 17:30:04',0,1,'f8162a54-1c95-11e9-8b8a-6c92bf48246b',1.00),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 18:49:33',1,51,'82',9.45),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 18:52:16',1,51,'82',2.82),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 19:03:49',1,51,'84',5.73),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 19:03:49',1,51,'84',0.75),('osDAK433U9RX1TnQe5xl-Xy7A-zc','2019-01-20 19:03:49',1,51,'84',7.52),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 19:06:45',1,51,'85',1.57),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 19:06:45',1,51,'85',0.43),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 19:06:45',1,51,'85',3.52),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 19:12:37',1,51,'87',0.17),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 19:12:37',1,51,'87',0.40),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 19:12:37',1,51,'87',1.85),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 19:17:51',1,51,'90',1.31),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 19:17:51',1,51,'90',5.43),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 19:17:51',1,51,'90',3.26),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 19:28:57',1,51,'94',3.33),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 19:29:16',1,51,'94',3.33),('osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 19:29:33',1,51,'94',3.33),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 21:30:33',0,1,'906a63fe-1cb7-11e9-8b8a-6c92bf48246b',1.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 21:30:36',0,1,'91e27718-1cb7-11e9-8b8a-6c92bf48246b',1.00),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 23:02:52',1,51,'95',10.00),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-21 11:55:46',1,51,'96',4.50),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 12:00:33',1,51,'96',2.47),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 14:59:10',0,1,'0da17cda-1d4a-11e9-8b8a-6c92bf48246b',1.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 14:59:10',1,52,'0da17cda-1d4a-11e9-8b8a-6c92bf48246b',1.00),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 14:59:16',0,1,'1117cda7-1d4a-11e9-8b8a-6c92bf48246b',1.10),('osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 14:59:16',1,52,'1117cda7-1d4a-11e9-8b8a-6c92bf48246b',1.10),('osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-21 17:52:07',1,51,'97',24.01);
/*!40000 ALTER TABLE `crm_user_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_date`
--

DROP TABLE IF EXISTS `fw_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date_UNIQUE` (`date`),
  KEY `indexDate` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=3289 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_date`
--

LOCK TABLES `fw_date` WRITE;
/*!40000 ALTER TABLE `fw_date` DISABLE KEYS */;
INSERT INTO `fw_date` VALUES (1104,'2019-01-08'),(1105,'2019-01-09'),(1106,'2019-01-10'),(1107,'2019-01-11'),(1108,'2019-01-12'),(1109,'2019-01-13'),(1110,'2019-01-14'),(1111,'2019-01-15'),(1112,'2019-01-16'),(1113,'2019-01-17'),(1114,'2019-01-18'),(1115,'2019-01-19'),(1116,'2019-01-20'),(1117,'2019-01-21'),(1118,'2019-01-22'),(1119,'2019-01-23'),(1120,'2019-01-24'),(1121,'2019-01-25'),(1122,'2019-01-26'),(1123,'2019-01-27'),(1124,'2019-01-28'),(1125,'2019-01-29'),(1126,'2019-01-30'),(1127,'2019-01-31'),(1128,'2019-02-01'),(1129,'2019-02-02'),(1130,'2019-02-03'),(1131,'2019-02-04'),(1132,'2019-02-05'),(1133,'2019-02-06'),(1134,'2019-02-07'),(1135,'2019-02-08'),(1136,'2019-02-09'),(1137,'2019-02-10'),(1138,'2019-02-11'),(1139,'2019-02-12'),(1140,'2019-02-13'),(1141,'2019-02-14'),(1142,'2019-02-15'),(1143,'2019-02-16'),(1144,'2019-02-17'),(1145,'2019-02-18'),(1146,'2019-02-19'),(1147,'2019-02-20'),(1148,'2019-02-21'),(1149,'2019-02-22'),(1150,'2019-02-23'),(1151,'2019-02-24'),(1152,'2019-02-25'),(1153,'2019-02-26'),(1154,'2019-02-27'),(1155,'2019-02-28'),(1156,'2019-03-01'),(1157,'2019-03-02'),(1158,'2019-03-03'),(1159,'2019-03-04'),(1160,'2019-03-05'),(1161,'2019-03-06'),(1162,'2019-03-07'),(1163,'2019-03-08'),(1164,'2019-03-09'),(1165,'2019-03-10'),(1166,'2019-03-11'),(1167,'2019-03-12'),(1168,'2019-03-13'),(1169,'2019-03-14'),(1170,'2019-03-15'),(1171,'2019-03-16'),(1172,'2019-03-17'),(1173,'2019-03-18'),(1174,'2019-03-19'),(1175,'2019-03-20'),(1176,'2019-03-21'),(1177,'2019-03-22'),(1178,'2019-03-23'),(1179,'2019-03-24'),(1180,'2019-03-25'),(1181,'2019-03-26'),(1182,'2019-03-27'),(1183,'2019-03-28'),(1184,'2019-03-29'),(1185,'2019-03-30'),(1186,'2019-03-31'),(1187,'2019-04-01'),(1188,'2019-04-02'),(1189,'2019-04-03'),(1190,'2019-04-04'),(1191,'2019-04-05'),(1192,'2019-04-06'),(1193,'2019-04-07'),(1194,'2019-04-08'),(1195,'2019-04-09'),(1196,'2019-04-10'),(1197,'2019-04-11'),(1198,'2019-04-12'),(1199,'2019-04-13'),(1200,'2019-04-14'),(1201,'2019-04-15'),(1202,'2019-04-16'),(1203,'2019-04-17'),(1204,'2019-04-18'),(1205,'2019-04-19'),(1206,'2019-04-20'),(1207,'2019-04-21'),(1208,'2019-04-22'),(1209,'2019-04-23'),(1210,'2019-04-24'),(1211,'2019-04-25'),(1212,'2019-04-26'),(1213,'2019-04-27'),(1214,'2019-04-28'),(1215,'2019-04-29'),(1216,'2019-04-30'),(1217,'2019-05-01'),(1218,'2019-05-02'),(1219,'2019-05-03'),(1220,'2019-05-04'),(1221,'2019-05-05'),(1222,'2019-05-06'),(1223,'2019-05-07'),(1224,'2019-05-08'),(1225,'2019-05-09'),(1226,'2019-05-10'),(1227,'2019-05-11'),(1228,'2019-05-12'),(1229,'2019-05-13'),(1230,'2019-05-14'),(1231,'2019-05-15'),(1232,'2019-05-16'),(1233,'2019-05-17'),(1234,'2019-05-18'),(1235,'2019-05-19'),(1236,'2019-05-20'),(1237,'2019-05-21'),(1238,'2019-05-22'),(1239,'2019-05-23'),(1240,'2019-05-24'),(1241,'2019-05-25'),(1242,'2019-05-26'),(1243,'2019-05-27'),(1244,'2019-05-28'),(1245,'2019-05-29'),(1246,'2019-05-30'),(1247,'2019-05-31'),(1248,'2019-06-01'),(1249,'2019-06-02'),(1250,'2019-06-03'),(1251,'2019-06-04'),(1252,'2019-06-05'),(1253,'2019-06-06'),(1254,'2019-06-07'),(1255,'2019-06-08'),(1256,'2019-06-09'),(1257,'2019-06-10'),(1258,'2019-06-11'),(1259,'2019-06-12'),(1260,'2019-06-13'),(1261,'2019-06-14'),(1262,'2019-06-15'),(1263,'2019-06-16'),(1264,'2019-06-17'),(1265,'2019-06-18'),(1266,'2019-06-19'),(1267,'2019-06-20'),(1268,'2019-06-21'),(1269,'2019-06-22'),(1270,'2019-06-23'),(1271,'2019-06-24'),(1272,'2019-06-25'),(1273,'2019-06-26'),(1274,'2019-06-27'),(1275,'2019-06-28'),(1276,'2019-06-29'),(1277,'2019-06-30'),(1278,'2019-07-01'),(1279,'2019-07-02'),(1280,'2019-07-03'),(1281,'2019-07-04'),(1282,'2019-07-05'),(1283,'2019-07-06'),(1284,'2019-07-07'),(1285,'2019-07-08'),(1286,'2019-07-09'),(1287,'2019-07-10'),(1288,'2019-07-11'),(1289,'2019-07-12'),(1290,'2019-07-13'),(1291,'2019-07-14'),(1292,'2019-07-15'),(1293,'2019-07-16'),(1294,'2019-07-17'),(1295,'2019-07-18'),(1296,'2019-07-19'),(1297,'2019-07-20'),(1298,'2019-07-21'),(1299,'2019-07-22'),(1300,'2019-07-23'),(1301,'2019-07-24'),(1302,'2019-07-25'),(1303,'2019-07-26'),(1304,'2019-07-27'),(1305,'2019-07-28'),(1306,'2019-07-29'),(1307,'2019-07-30'),(1308,'2019-07-31'),(1309,'2019-08-01'),(1310,'2019-08-02'),(1311,'2019-08-03'),(1312,'2019-08-04'),(1313,'2019-08-05'),(1314,'2019-08-06'),(1315,'2019-08-07'),(1316,'2019-08-08'),(1317,'2019-08-09'),(1318,'2019-08-10'),(1319,'2019-08-11'),(1320,'2019-08-12'),(1321,'2019-08-13'),(1322,'2019-08-14'),(1323,'2019-08-15'),(1324,'2019-08-16'),(1325,'2019-08-17'),(1326,'2019-08-18'),(1327,'2019-08-19'),(1328,'2019-08-20'),(1329,'2019-08-21'),(1330,'2019-08-22'),(1331,'2019-08-23'),(1332,'2019-08-24'),(1333,'2019-08-25'),(1334,'2019-08-26'),(1335,'2019-08-27'),(1336,'2019-08-28'),(1337,'2019-08-29'),(1338,'2019-08-30'),(1339,'2019-08-31'),(1340,'2019-09-01'),(1341,'2019-09-02'),(1342,'2019-09-03'),(1343,'2019-09-04'),(1344,'2019-09-05'),(1345,'2019-09-06'),(1346,'2019-09-07'),(1347,'2019-09-08'),(1348,'2019-09-09'),(1349,'2019-09-10'),(1350,'2019-09-11'),(1351,'2019-09-12'),(1352,'2019-09-13'),(1353,'2019-09-14'),(1354,'2019-09-15'),(1355,'2019-09-16'),(1356,'2019-09-17'),(1357,'2019-09-18'),(1358,'2019-09-19'),(1359,'2019-09-20'),(1360,'2019-09-21'),(1361,'2019-09-22'),(1362,'2019-09-23'),(1363,'2019-09-24'),(1364,'2019-09-25'),(1365,'2019-09-26'),(1366,'2019-09-27'),(1367,'2019-09-28'),(1368,'2019-09-29'),(1369,'2019-09-30'),(1370,'2019-10-01'),(1371,'2019-10-02'),(1372,'2019-10-03'),(1373,'2019-10-04'),(1374,'2019-10-05'),(1375,'2019-10-06'),(1376,'2019-10-07'),(1377,'2019-10-08'),(1378,'2019-10-09'),(1379,'2019-10-10'),(1380,'2019-10-11'),(1381,'2019-10-12'),(1382,'2019-10-13'),(1383,'2019-10-14'),(1384,'2019-10-15'),(1385,'2019-10-16'),(1386,'2019-10-17'),(1387,'2019-10-18'),(1388,'2019-10-19'),(1389,'2019-10-20'),(1390,'2019-10-21'),(1391,'2019-10-22'),(1392,'2019-10-23'),(1393,'2019-10-24'),(1394,'2019-10-25'),(1395,'2019-10-26'),(1396,'2019-10-27'),(1397,'2019-10-28'),(1398,'2019-10-29'),(1399,'2019-10-30'),(1400,'2019-10-31'),(1401,'2019-11-01'),(1402,'2019-11-02'),(1403,'2019-11-03'),(1404,'2019-11-04'),(1405,'2019-11-05'),(1406,'2019-11-06'),(1407,'2019-11-07'),(1408,'2019-11-08'),(1409,'2019-11-09'),(1410,'2019-11-10'),(1411,'2019-11-11'),(1412,'2019-11-12'),(1413,'2019-11-13'),(1414,'2019-11-14'),(1415,'2019-11-15'),(1416,'2019-11-16'),(1417,'2019-11-17'),(1418,'2019-11-18'),(1419,'2019-11-19'),(1420,'2019-11-20'),(1421,'2019-11-21'),(1422,'2019-11-22'),(1423,'2019-11-23'),(1424,'2019-11-24'),(1425,'2019-11-25'),(1426,'2019-11-26'),(1427,'2019-11-27'),(1428,'2019-11-28'),(1429,'2019-11-29'),(1430,'2019-11-30'),(1431,'2019-12-01'),(1432,'2019-12-02'),(1433,'2019-12-03'),(1434,'2019-12-04'),(1435,'2019-12-05'),(1436,'2019-12-06'),(1437,'2019-12-07'),(1438,'2019-12-08'),(1439,'2019-12-09'),(1440,'2019-12-10'),(1441,'2019-12-11'),(1442,'2019-12-12'),(1443,'2019-12-13'),(1444,'2019-12-14'),(1445,'2019-12-15'),(1446,'2019-12-16'),(1447,'2019-12-17'),(1448,'2019-12-18'),(1449,'2019-12-19'),(1450,'2019-12-20'),(1451,'2019-12-21'),(1452,'2019-12-22'),(1453,'2019-12-23'),(1454,'2019-12-24'),(1455,'2019-12-25'),(1456,'2019-12-26'),(1457,'2019-12-27'),(1458,'2019-12-28'),(1459,'2019-12-29'),(1460,'2019-12-30'),(1461,'2019-12-31'),(1462,'2020-01-01'),(1463,'2020-01-02'),(1464,'2020-01-03'),(1465,'2020-01-04'),(1466,'2020-01-05'),(1467,'2020-01-06'),(1468,'2020-01-07'),(1469,'2020-01-08'),(1470,'2020-01-09'),(1471,'2020-01-10'),(1472,'2020-01-11'),(1473,'2020-01-12'),(1474,'2020-01-13'),(1475,'2020-01-14'),(1476,'2020-01-15'),(1477,'2020-01-16'),(1478,'2020-01-17'),(1479,'2020-01-18'),(1480,'2020-01-19'),(1481,'2020-01-20'),(1482,'2020-01-21'),(1483,'2020-01-22'),(1484,'2020-01-23'),(1485,'2020-01-24'),(1486,'2020-01-25'),(1487,'2020-01-26'),(1488,'2020-01-27'),(1489,'2020-01-28'),(1490,'2020-01-29'),(1491,'2020-01-30'),(1492,'2020-01-31'),(1493,'2020-02-01'),(1494,'2020-02-02'),(1495,'2020-02-03'),(1496,'2020-02-04'),(1497,'2020-02-05'),(1498,'2020-02-06'),(1499,'2020-02-07'),(1500,'2020-02-08'),(1501,'2020-02-09'),(1502,'2020-02-10'),(1503,'2020-02-11'),(1504,'2020-02-12'),(1505,'2020-02-13'),(1506,'2020-02-14'),(1507,'2020-02-15'),(1508,'2020-02-16'),(1509,'2020-02-17'),(1510,'2020-02-18'),(1511,'2020-02-19'),(1512,'2020-02-20'),(1513,'2020-02-21'),(1514,'2020-02-22'),(1515,'2020-02-23'),(1516,'2020-02-24'),(1517,'2020-02-25'),(1518,'2020-02-26'),(1519,'2020-02-27'),(1520,'2020-02-28'),(1521,'2020-02-29'),(1522,'2020-03-01'),(1523,'2020-03-02'),(1524,'2020-03-03'),(1525,'2020-03-04'),(1526,'2020-03-05'),(1527,'2020-03-06'),(1528,'2020-03-07'),(1529,'2020-03-08'),(1530,'2020-03-09'),(1531,'2020-03-10'),(1532,'2020-03-11'),(1533,'2020-03-12'),(1534,'2020-03-13'),(1535,'2020-03-14'),(1536,'2020-03-15'),(1537,'2020-03-16'),(1538,'2020-03-17'),(1539,'2020-03-18'),(1540,'2020-03-19'),(1541,'2020-03-20'),(1542,'2020-03-21'),(1543,'2020-03-22'),(1544,'2020-03-23'),(1545,'2020-03-24'),(1546,'2020-03-25'),(1547,'2020-03-26'),(1548,'2020-03-27'),(1549,'2020-03-28'),(1550,'2020-03-29'),(1551,'2020-03-30'),(1552,'2020-03-31'),(1553,'2020-04-01'),(1554,'2020-04-02'),(1555,'2020-04-03'),(1556,'2020-04-04'),(1557,'2020-04-05'),(1558,'2020-04-06'),(1559,'2020-04-07'),(1560,'2020-04-08'),(1561,'2020-04-09'),(1562,'2020-04-10'),(1563,'2020-04-11'),(1564,'2020-04-12'),(1565,'2020-04-13'),(1566,'2020-04-14'),(1567,'2020-04-15'),(1568,'2020-04-16'),(1569,'2020-04-17'),(1570,'2020-04-18'),(1571,'2020-04-19'),(1572,'2020-04-20'),(1573,'2020-04-21'),(1574,'2020-04-22'),(1575,'2020-04-23'),(1576,'2020-04-24'),(1577,'2020-04-25'),(1578,'2020-04-26'),(1579,'2020-04-27'),(1580,'2020-04-28'),(1581,'2020-04-29'),(1582,'2020-04-30'),(1583,'2020-05-01'),(1584,'2020-05-02'),(1585,'2020-05-03'),(1586,'2020-05-04'),(1587,'2020-05-05'),(1588,'2020-05-06'),(1589,'2020-05-07'),(1590,'2020-05-08'),(1591,'2020-05-09'),(1592,'2020-05-10'),(1593,'2020-05-11'),(1594,'2020-05-12'),(1595,'2020-05-13'),(1596,'2020-05-14'),(1597,'2020-05-15'),(1598,'2020-05-16'),(1599,'2020-05-17'),(1600,'2020-05-18'),(1601,'2020-05-19'),(1602,'2020-05-20'),(1603,'2020-05-21'),(1604,'2020-05-22'),(1605,'2020-05-23'),(1606,'2020-05-24'),(1607,'2020-05-25'),(1608,'2020-05-26'),(1609,'2020-05-27'),(1610,'2020-05-28'),(1611,'2020-05-29'),(1612,'2020-05-30'),(1613,'2020-05-31'),(1614,'2020-06-01'),(1615,'2020-06-02'),(1616,'2020-06-03'),(1617,'2020-06-04'),(1618,'2020-06-05'),(1619,'2020-06-06'),(1620,'2020-06-07'),(1621,'2020-06-08'),(1622,'2020-06-09'),(1623,'2020-06-10'),(1624,'2020-06-11'),(1625,'2020-06-12'),(1626,'2020-06-13'),(1627,'2020-06-14'),(1628,'2020-06-15'),(1629,'2020-06-16'),(1630,'2020-06-17'),(1631,'2020-06-18'),(1632,'2020-06-19'),(1633,'2020-06-20'),(1634,'2020-06-21'),(1635,'2020-06-22'),(1636,'2020-06-23'),(1637,'2020-06-24'),(1638,'2020-06-25'),(1639,'2020-06-26'),(1640,'2020-06-27'),(1641,'2020-06-28'),(1642,'2020-06-29'),(1643,'2020-06-30'),(1644,'2020-07-01'),(1645,'2020-07-02'),(1646,'2020-07-03'),(1647,'2020-07-04'),(1648,'2020-07-05'),(1649,'2020-07-06'),(1650,'2020-07-07'),(1651,'2020-07-08'),(1652,'2020-07-09'),(1653,'2020-07-10'),(1654,'2020-07-11'),(1655,'2020-07-12'),(1656,'2020-07-13'),(1657,'2020-07-14'),(1658,'2020-07-15'),(1659,'2020-07-16'),(1660,'2020-07-17'),(1661,'2020-07-18'),(1662,'2020-07-19'),(1663,'2020-07-20'),(1664,'2020-07-21'),(1665,'2020-07-22'),(1666,'2020-07-23'),(1667,'2020-07-24'),(1668,'2020-07-25'),(1669,'2020-07-26'),(1670,'2020-07-27'),(1671,'2020-07-28'),(1672,'2020-07-29'),(1673,'2020-07-30'),(1674,'2020-07-31'),(1675,'2020-08-01'),(1676,'2020-08-02'),(1677,'2020-08-03'),(1678,'2020-08-04'),(1679,'2020-08-05'),(1680,'2020-08-06'),(1681,'2020-08-07'),(1682,'2020-08-08'),(1683,'2020-08-09'),(1684,'2020-08-10'),(1685,'2020-08-11'),(1686,'2020-08-12'),(1687,'2020-08-13'),(1688,'2020-08-14'),(1689,'2020-08-15'),(1690,'2020-08-16'),(1691,'2020-08-17'),(1692,'2020-08-18'),(1693,'2020-08-19'),(1694,'2020-08-20'),(1695,'2020-08-21'),(1696,'2020-08-22'),(1697,'2020-08-23'),(1698,'2020-08-24'),(1699,'2020-08-25'),(1700,'2020-08-26'),(1701,'2020-08-27'),(1702,'2020-08-28'),(1703,'2020-08-29'),(1704,'2020-08-30'),(1705,'2020-08-31'),(1706,'2020-09-01'),(1707,'2020-09-02'),(1708,'2020-09-03'),(1709,'2020-09-04'),(1710,'2020-09-05'),(1711,'2020-09-06'),(1712,'2020-09-07'),(1713,'2020-09-08'),(1714,'2020-09-09'),(1715,'2020-09-10'),(1716,'2020-09-11'),(1717,'2020-09-12'),(1718,'2020-09-13'),(1719,'2020-09-14'),(1720,'2020-09-15'),(1721,'2020-09-16'),(1722,'2020-09-17'),(1723,'2020-09-18'),(1724,'2020-09-19'),(1725,'2020-09-20'),(1726,'2020-09-21'),(1727,'2020-09-22'),(1728,'2020-09-23'),(1729,'2020-09-24'),(1730,'2020-09-25'),(1731,'2020-09-26'),(1732,'2020-09-27'),(1733,'2020-09-28'),(1734,'2020-09-29'),(1735,'2020-09-30'),(1736,'2020-10-01'),(1737,'2020-10-02'),(1738,'2020-10-03'),(1739,'2020-10-04'),(1740,'2020-10-05'),(1741,'2020-10-06'),(1742,'2020-10-07'),(1743,'2020-10-08'),(1744,'2020-10-09'),(1745,'2020-10-10'),(1746,'2020-10-11'),(1747,'2020-10-12'),(1748,'2020-10-13'),(1749,'2020-10-14'),(1750,'2020-10-15'),(1751,'2020-10-16'),(1752,'2020-10-17'),(1753,'2020-10-18'),(1754,'2020-10-19'),(1755,'2020-10-20'),(1756,'2020-10-21'),(1757,'2020-10-22'),(1758,'2020-10-23'),(1759,'2020-10-24'),(1760,'2020-10-25'),(1761,'2020-10-26'),(1762,'2020-10-27'),(1763,'2020-10-28'),(1764,'2020-10-29'),(1765,'2020-10-30'),(1766,'2020-10-31'),(1767,'2020-11-01'),(1768,'2020-11-02'),(1769,'2020-11-03'),(1770,'2020-11-04'),(1771,'2020-11-05'),(1772,'2020-11-06'),(1773,'2020-11-07'),(1774,'2020-11-08'),(1775,'2020-11-09'),(1776,'2020-11-10'),(1777,'2020-11-11'),(1778,'2020-11-12'),(1779,'2020-11-13'),(1780,'2020-11-14'),(1781,'2020-11-15'),(1782,'2020-11-16'),(1783,'2020-11-17'),(1784,'2020-11-18'),(1785,'2020-11-19'),(1786,'2020-11-20'),(1787,'2020-11-21'),(1788,'2020-11-22'),(1789,'2020-11-23'),(1790,'2020-11-24'),(1791,'2020-11-25'),(1792,'2020-11-26'),(1793,'2020-11-27'),(1794,'2020-11-28'),(1795,'2020-11-29'),(1796,'2020-11-30'),(1797,'2020-12-01'),(1798,'2020-12-02'),(1799,'2020-12-03'),(1800,'2020-12-04'),(1801,'2020-12-05'),(1802,'2020-12-06'),(1803,'2020-12-07'),(1804,'2020-12-08'),(1805,'2020-12-09'),(1806,'2020-12-10'),(1807,'2020-12-11'),(1808,'2020-12-12'),(1809,'2020-12-13'),(1810,'2020-12-14'),(1811,'2020-12-15'),(1812,'2020-12-16'),(1813,'2020-12-17'),(1814,'2020-12-18'),(1815,'2020-12-19'),(1816,'2020-12-20'),(1817,'2020-12-21'),(1818,'2020-12-22'),(1819,'2020-12-23'),(1820,'2020-12-24'),(1821,'2020-12-25'),(1822,'2020-12-26'),(1823,'2020-12-27'),(1824,'2020-12-28'),(1825,'2020-12-29'),(1826,'2020-12-30'),(1827,'2020-12-31'),(1828,'2021-01-01'),(1829,'2021-01-02'),(1830,'2021-01-03'),(1831,'2021-01-04'),(1832,'2021-01-05'),(1833,'2021-01-06'),(1834,'2021-01-07'),(1835,'2021-01-08'),(1836,'2021-01-09'),(1837,'2021-01-10'),(1838,'2021-01-11'),(1839,'2021-01-12'),(1840,'2021-01-13'),(1841,'2021-01-14'),(1842,'2021-01-15'),(1843,'2021-01-16'),(1844,'2021-01-17'),(1845,'2021-01-18'),(1846,'2021-01-19'),(1847,'2021-01-20'),(1848,'2021-01-21'),(1849,'2021-01-22'),(1850,'2021-01-23'),(1851,'2021-01-24'),(1852,'2021-01-25'),(1853,'2021-01-26'),(1854,'2021-01-27'),(1855,'2021-01-28'),(1856,'2021-01-29'),(1857,'2021-01-30'),(1858,'2021-01-31'),(1859,'2021-02-01'),(1860,'2021-02-02'),(1861,'2021-02-03'),(1862,'2021-02-04'),(1863,'2021-02-05'),(1864,'2021-02-06'),(1865,'2021-02-07'),(1866,'2021-02-08'),(1867,'2021-02-09'),(1868,'2021-02-10'),(1869,'2021-02-11'),(1870,'2021-02-12'),(1871,'2021-02-13'),(1872,'2021-02-14'),(1873,'2021-02-15'),(1874,'2021-02-16'),(1875,'2021-02-17'),(1876,'2021-02-18'),(1877,'2021-02-19'),(1878,'2021-02-20'),(1879,'2021-02-21'),(1880,'2021-02-22'),(1881,'2021-02-23'),(1882,'2021-02-24'),(1883,'2021-02-25'),(1884,'2021-02-26'),(1885,'2021-02-27'),(1886,'2021-02-28'),(1887,'2021-03-01'),(1888,'2021-03-02'),(1889,'2021-03-03'),(1890,'2021-03-04'),(1891,'2021-03-05'),(1892,'2021-03-06'),(1893,'2021-03-07'),(1894,'2021-03-08'),(1895,'2021-03-09'),(1896,'2021-03-10'),(1897,'2021-03-11'),(1898,'2021-03-12'),(1899,'2021-03-13'),(1900,'2021-03-14'),(1901,'2021-03-15'),(1902,'2021-03-16'),(1903,'2021-03-17'),(1904,'2021-03-18'),(1905,'2021-03-19'),(1906,'2021-03-20'),(1907,'2021-03-21'),(1908,'2021-03-22'),(1909,'2021-03-23'),(1910,'2021-03-24'),(1911,'2021-03-25'),(1912,'2021-03-26'),(1913,'2021-03-27'),(1914,'2021-03-28'),(1915,'2021-03-29'),(1916,'2021-03-30'),(1917,'2021-03-31'),(1918,'2021-04-01'),(1919,'2021-04-02'),(1920,'2021-04-03'),(1921,'2021-04-04'),(1922,'2021-04-05'),(1923,'2021-04-06'),(1924,'2021-04-07'),(1925,'2021-04-08'),(1926,'2021-04-09'),(1927,'2021-04-10'),(1928,'2021-04-11'),(1929,'2021-04-12'),(1930,'2021-04-13'),(1931,'2021-04-14'),(1932,'2021-04-15'),(1933,'2021-04-16'),(1934,'2021-04-17'),(1935,'2021-04-18'),(1936,'2021-04-19'),(1937,'2021-04-20'),(1938,'2021-04-21'),(1939,'2021-04-22'),(1940,'2021-04-23'),(1941,'2021-04-24'),(1942,'2021-04-25'),(1943,'2021-04-26'),(1944,'2021-04-27'),(1945,'2021-04-28'),(1946,'2021-04-29'),(1947,'2021-04-30'),(1948,'2021-05-01'),(1949,'2021-05-02'),(1950,'2021-05-03'),(1951,'2021-05-04'),(1952,'2021-05-05'),(1953,'2021-05-06'),(1954,'2021-05-07'),(1955,'2021-05-08'),(1956,'2021-05-09'),(1957,'2021-05-10'),(1958,'2021-05-11'),(1959,'2021-05-12'),(1960,'2021-05-13'),(1961,'2021-05-14'),(1962,'2021-05-15'),(1963,'2021-05-16'),(1964,'2021-05-17'),(1965,'2021-05-18'),(1966,'2021-05-19'),(1967,'2021-05-20'),(1968,'2021-05-21'),(1969,'2021-05-22'),(1970,'2021-05-23'),(1971,'2021-05-24'),(1972,'2021-05-25'),(1973,'2021-05-26'),(1974,'2021-05-27'),(1975,'2021-05-28'),(1976,'2021-05-29'),(1977,'2021-05-30'),(1978,'2021-05-31'),(1979,'2021-06-01'),(1980,'2021-06-02'),(1981,'2021-06-03'),(1982,'2021-06-04'),(1983,'2021-06-05'),(1984,'2021-06-06'),(1985,'2021-06-07'),(1986,'2021-06-08'),(1987,'2021-06-09'),(1988,'2021-06-10'),(1989,'2021-06-11'),(1990,'2021-06-12'),(1991,'2021-06-13'),(1992,'2021-06-14'),(1993,'2021-06-15'),(1994,'2021-06-16'),(1995,'2021-06-17'),(1996,'2021-06-18'),(1997,'2021-06-19'),(1998,'2021-06-20'),(1999,'2021-06-21'),(2000,'2021-06-22'),(2001,'2021-06-23'),(2002,'2021-06-24'),(2003,'2021-06-25'),(2004,'2021-06-26'),(2005,'2021-06-27'),(2006,'2021-06-28'),(2007,'2021-06-29'),(2008,'2021-06-30'),(2009,'2021-07-01'),(2010,'2021-07-02'),(2011,'2021-07-03'),(2012,'2021-07-04'),(2013,'2021-07-05'),(2014,'2021-07-06'),(2015,'2021-07-07'),(2016,'2021-07-08'),(2017,'2021-07-09'),(2018,'2021-07-10'),(2019,'2021-07-11'),(2020,'2021-07-12'),(2021,'2021-07-13'),(2022,'2021-07-14'),(2023,'2021-07-15'),(2024,'2021-07-16'),(2025,'2021-07-17'),(2026,'2021-07-18'),(2027,'2021-07-19'),(2028,'2021-07-20'),(2029,'2021-07-21'),(2030,'2021-07-22'),(2031,'2021-07-23'),(2032,'2021-07-24'),(2033,'2021-07-25'),(2034,'2021-07-26'),(2035,'2021-07-27'),(2036,'2021-07-28'),(2037,'2021-07-29'),(2038,'2021-07-30'),(2039,'2021-07-31'),(2040,'2021-08-01'),(2041,'2021-08-02'),(2042,'2021-08-03'),(2043,'2021-08-04'),(2044,'2021-08-05'),(2045,'2021-08-06'),(2046,'2021-08-07'),(2047,'2021-08-08'),(2048,'2021-08-09'),(2049,'2021-08-10'),(2050,'2021-08-11'),(2051,'2021-08-12'),(2052,'2021-08-13'),(2053,'2021-08-14'),(2054,'2021-08-15'),(2055,'2021-08-16'),(2056,'2021-08-17'),(2057,'2021-08-18'),(2058,'2021-08-19'),(2059,'2021-08-20'),(2060,'2021-08-21'),(2061,'2021-08-22'),(2062,'2021-08-23'),(2063,'2021-08-24'),(2064,'2021-08-25'),(2065,'2021-08-26'),(2066,'2021-08-27'),(2067,'2021-08-28'),(2068,'2021-08-29'),(2069,'2021-08-30'),(2070,'2021-08-31'),(2071,'2021-09-01'),(2072,'2021-09-02'),(2073,'2021-09-03'),(2074,'2021-09-04'),(2075,'2021-09-05'),(2076,'2021-09-06'),(2077,'2021-09-07'),(2078,'2021-09-08'),(2079,'2021-09-09'),(2080,'2021-09-10'),(2081,'2021-09-11'),(2082,'2021-09-12'),(2083,'2021-09-13'),(2084,'2021-09-14'),(2085,'2021-09-15'),(2086,'2021-09-16'),(2087,'2021-09-17'),(2088,'2021-09-18'),(2089,'2021-09-19'),(2090,'2021-09-20'),(2091,'2021-09-21'),(2092,'2021-09-22'),(2093,'2021-09-23'),(2094,'2021-09-24'),(2095,'2021-09-25'),(2096,'2021-09-26'),(2097,'2021-09-27'),(2098,'2021-09-28'),(2099,'2021-09-29'),(2100,'2021-09-30'),(2101,'2021-10-01'),(2102,'2021-10-02'),(2103,'2021-10-03'),(2104,'2021-10-04'),(2105,'2021-10-05'),(2106,'2021-10-06'),(2107,'2021-10-07'),(2108,'2021-10-08'),(2109,'2021-10-09'),(2110,'2021-10-10'),(2111,'2021-10-11'),(2112,'2021-10-12'),(2113,'2021-10-13'),(2114,'2021-10-14'),(2115,'2021-10-15'),(2116,'2021-10-16'),(2117,'2021-10-17'),(2118,'2021-10-18'),(2119,'2021-10-19'),(2120,'2021-10-20'),(2121,'2021-10-21'),(2122,'2021-10-22'),(2123,'2021-10-23'),(2124,'2021-10-24'),(2125,'2021-10-25'),(2126,'2021-10-26'),(2127,'2021-10-27'),(2128,'2021-10-28'),(2129,'2021-10-29'),(2130,'2021-10-30'),(2131,'2021-10-31'),(2132,'2021-11-01'),(2133,'2021-11-02'),(2134,'2021-11-03'),(2135,'2021-11-04'),(2136,'2021-11-05'),(2137,'2021-11-06'),(2138,'2021-11-07'),(2139,'2021-11-08'),(2140,'2021-11-09'),(2141,'2021-11-10'),(2142,'2021-11-11'),(2143,'2021-11-12'),(2144,'2021-11-13'),(2145,'2021-11-14'),(2146,'2021-11-15'),(2147,'2021-11-16'),(2148,'2021-11-17'),(2149,'2021-11-18'),(2150,'2021-11-19'),(2151,'2021-11-20'),(2152,'2021-11-21'),(2153,'2021-11-22'),(2154,'2021-11-23'),(2155,'2021-11-24'),(2156,'2021-11-25'),(2157,'2021-11-26'),(2158,'2021-11-27'),(2159,'2021-11-28'),(2160,'2021-11-29'),(2161,'2021-11-30'),(2162,'2021-12-01'),(2163,'2021-12-02'),(2164,'2021-12-03'),(2165,'2021-12-04'),(2166,'2021-12-05'),(2167,'2021-12-06'),(2168,'2021-12-07'),(2169,'2021-12-08'),(2170,'2021-12-09'),(2171,'2021-12-10'),(2172,'2021-12-11'),(2173,'2021-12-12'),(2174,'2021-12-13'),(2175,'2021-12-14'),(2176,'2021-12-15'),(2177,'2021-12-16'),(2178,'2021-12-17'),(2179,'2021-12-18'),(2180,'2021-12-19'),(2181,'2021-12-20'),(2182,'2021-12-21'),(2183,'2021-12-22'),(2184,'2021-12-23'),(2185,'2021-12-24'),(2186,'2021-12-25'),(2187,'2021-12-26'),(2188,'2021-12-27'),(2189,'2021-12-28'),(2190,'2021-12-29'),(2191,'2021-12-30'),(2192,'2021-12-31'),(2193,'2022-01-01'),(2194,'2022-01-02'),(2195,'2022-01-03'),(2196,'2022-01-04'),(2197,'2022-01-05'),(2198,'2022-01-06'),(2199,'2022-01-07'),(2200,'2022-01-08'),(2201,'2022-01-09'),(2202,'2022-01-10'),(2203,'2022-01-11'),(2204,'2022-01-12'),(2205,'2022-01-13'),(2206,'2022-01-14'),(2207,'2022-01-15'),(2208,'2022-01-16'),(2209,'2022-01-17'),(2210,'2022-01-18'),(2211,'2022-01-19'),(2212,'2022-01-20'),(2213,'2022-01-21'),(2214,'2022-01-22'),(2215,'2022-01-23'),(2216,'2022-01-24'),(2217,'2022-01-25'),(2218,'2022-01-26'),(2219,'2022-01-27'),(2220,'2022-01-28'),(2221,'2022-01-29'),(2222,'2022-01-30'),(2223,'2022-01-31'),(2224,'2022-02-01'),(2225,'2022-02-02'),(2226,'2022-02-03'),(2227,'2022-02-04'),(2228,'2022-02-05'),(2229,'2022-02-06'),(2230,'2022-02-07'),(2231,'2022-02-08'),(2232,'2022-02-09'),(2233,'2022-02-10'),(2234,'2022-02-11'),(2235,'2022-02-12'),(2236,'2022-02-13'),(2237,'2022-02-14'),(2238,'2022-02-15'),(2239,'2022-02-16'),(2240,'2022-02-17'),(2241,'2022-02-18'),(2242,'2022-02-19'),(2243,'2022-02-20'),(2244,'2022-02-21'),(2245,'2022-02-22'),(2246,'2022-02-23'),(2247,'2022-02-24'),(2248,'2022-02-25'),(2249,'2022-02-26'),(2250,'2022-02-27'),(2251,'2022-02-28'),(2252,'2022-03-01'),(2253,'2022-03-02'),(2254,'2022-03-03'),(2255,'2022-03-04'),(2256,'2022-03-05'),(2257,'2022-03-06'),(2258,'2022-03-07'),(2259,'2022-03-08'),(2260,'2022-03-09'),(2261,'2022-03-10'),(2262,'2022-03-11'),(2263,'2022-03-12'),(2264,'2022-03-13'),(2265,'2022-03-14'),(2266,'2022-03-15'),(2267,'2022-03-16'),(2268,'2022-03-17'),(2269,'2022-03-18'),(2270,'2022-03-19'),(2271,'2022-03-20'),(2272,'2022-03-21'),(2273,'2022-03-22'),(2274,'2022-03-23'),(2275,'2022-03-24'),(2276,'2022-03-25'),(2277,'2022-03-26'),(2278,'2022-03-27'),(2279,'2022-03-28'),(2280,'2022-03-29'),(2281,'2022-03-30'),(2282,'2022-03-31'),(2283,'2022-04-01'),(2284,'2022-04-02'),(2285,'2022-04-03'),(2286,'2022-04-04'),(2287,'2022-04-05'),(2288,'2022-04-06'),(2289,'2022-04-07'),(2290,'2022-04-08'),(2291,'2022-04-09'),(2292,'2022-04-10'),(2293,'2022-04-11'),(2294,'2022-04-12'),(2295,'2022-04-13'),(2296,'2022-04-14'),(2297,'2022-04-15'),(2298,'2022-04-16'),(2299,'2022-04-17'),(2300,'2022-04-18'),(2301,'2022-04-19'),(2302,'2022-04-20'),(2303,'2022-04-21'),(2304,'2022-04-22'),(2305,'2022-04-23'),(2306,'2022-04-24'),(2307,'2022-04-25'),(2308,'2022-04-26'),(2309,'2022-04-27'),(2310,'2022-04-28'),(2311,'2022-04-29'),(2312,'2022-04-30'),(2313,'2022-05-01'),(2314,'2022-05-02'),(2315,'2022-05-03'),(2316,'2022-05-04'),(2317,'2022-05-05'),(2318,'2022-05-06'),(2319,'2022-05-07'),(2320,'2022-05-08'),(2321,'2022-05-09'),(2322,'2022-05-10'),(2323,'2022-05-11'),(2324,'2022-05-12'),(2325,'2022-05-13'),(2326,'2022-05-14'),(2327,'2022-05-15'),(2328,'2022-05-16'),(2329,'2022-05-17'),(2330,'2022-05-18'),(2331,'2022-05-19'),(2332,'2022-05-20'),(2333,'2022-05-21'),(2334,'2022-05-22'),(2335,'2022-05-23'),(2336,'2022-05-24'),(2337,'2022-05-25'),(2338,'2022-05-26'),(2339,'2022-05-27'),(2340,'2022-05-28'),(2341,'2022-05-29'),(2342,'2022-05-30'),(2343,'2022-05-31'),(2344,'2022-06-01'),(2345,'2022-06-02'),(2346,'2022-06-03'),(2347,'2022-06-04'),(2348,'2022-06-05'),(2349,'2022-06-06'),(2350,'2022-06-07'),(2351,'2022-06-08'),(2352,'2022-06-09'),(2353,'2022-06-10'),(2354,'2022-06-11'),(2355,'2022-06-12'),(2356,'2022-06-13'),(2357,'2022-06-14'),(2358,'2022-06-15'),(2359,'2022-06-16'),(2360,'2022-06-17'),(2361,'2022-06-18'),(2362,'2022-06-19'),(2363,'2022-06-20'),(2364,'2022-06-21'),(2365,'2022-06-22'),(2366,'2022-06-23'),(2367,'2022-06-24'),(2368,'2022-06-25'),(2369,'2022-06-26'),(2370,'2022-06-27'),(2371,'2022-06-28'),(2372,'2022-06-29'),(2373,'2022-06-30'),(2374,'2022-07-01'),(2375,'2022-07-02'),(2376,'2022-07-03'),(2377,'2022-07-04'),(2378,'2022-07-05'),(2379,'2022-07-06'),(2380,'2022-07-07'),(2381,'2022-07-08'),(2382,'2022-07-09'),(2383,'2022-07-10'),(2384,'2022-07-11'),(2385,'2022-07-12'),(2386,'2022-07-13'),(2387,'2022-07-14'),(2388,'2022-07-15'),(2389,'2022-07-16'),(2390,'2022-07-17'),(2391,'2022-07-18'),(2392,'2022-07-19'),(2393,'2022-07-20'),(2394,'2022-07-21'),(2395,'2022-07-22'),(2396,'2022-07-23'),(2397,'2022-07-24'),(2398,'2022-07-25'),(2399,'2022-07-26'),(2400,'2022-07-27'),(2401,'2022-07-28'),(2402,'2022-07-29'),(2403,'2022-07-30'),(2404,'2022-07-31'),(2405,'2022-08-01'),(2406,'2022-08-02'),(2407,'2022-08-03'),(2408,'2022-08-04'),(2409,'2022-08-05'),(2410,'2022-08-06'),(2411,'2022-08-07'),(2412,'2022-08-08'),(2413,'2022-08-09'),(2414,'2022-08-10'),(2415,'2022-08-11'),(2416,'2022-08-12'),(2417,'2022-08-13'),(2418,'2022-08-14'),(2419,'2022-08-15'),(2420,'2022-08-16'),(2421,'2022-08-17'),(2422,'2022-08-18'),(2423,'2022-08-19'),(2424,'2022-08-20'),(2425,'2022-08-21'),(2426,'2022-08-22'),(2427,'2022-08-23'),(2428,'2022-08-24'),(2429,'2022-08-25'),(2430,'2022-08-26'),(2431,'2022-08-27'),(2432,'2022-08-28'),(2433,'2022-08-29'),(2434,'2022-08-30'),(2435,'2022-08-31'),(2436,'2022-09-01'),(2437,'2022-09-02'),(2438,'2022-09-03'),(2439,'2022-09-04'),(2440,'2022-09-05'),(2441,'2022-09-06'),(2442,'2022-09-07'),(2443,'2022-09-08'),(2444,'2022-09-09'),(2445,'2022-09-10'),(2446,'2022-09-11'),(2447,'2022-09-12'),(2448,'2022-09-13'),(2449,'2022-09-14'),(2450,'2022-09-15'),(2451,'2022-09-16'),(2452,'2022-09-17'),(2453,'2022-09-18'),(2454,'2022-09-19'),(2455,'2022-09-20'),(2456,'2022-09-21'),(2457,'2022-09-22'),(2458,'2022-09-23'),(2459,'2022-09-24'),(2460,'2022-09-25'),(2461,'2022-09-26'),(2462,'2022-09-27'),(2463,'2022-09-28'),(2464,'2022-09-29'),(2465,'2022-09-30'),(2466,'2022-10-01'),(2467,'2022-10-02'),(2468,'2022-10-03'),(2469,'2022-10-04'),(2470,'2022-10-05'),(2471,'2022-10-06'),(2472,'2022-10-07'),(2473,'2022-10-08'),(2474,'2022-10-09'),(2475,'2022-10-10'),(2476,'2022-10-11'),(2477,'2022-10-12'),(2478,'2022-10-13'),(2479,'2022-10-14'),(2480,'2022-10-15'),(2481,'2022-10-16'),(2482,'2022-10-17'),(2483,'2022-10-18'),(2484,'2022-10-19'),(2485,'2022-10-20'),(2486,'2022-10-21'),(2487,'2022-10-22'),(2488,'2022-10-23'),(2489,'2022-10-24'),(2490,'2022-10-25'),(2491,'2022-10-26'),(2492,'2022-10-27'),(2493,'2022-10-28'),(2494,'2022-10-29'),(2495,'2022-10-30'),(2496,'2022-10-31'),(2497,'2022-11-01'),(2498,'2022-11-02'),(2499,'2022-11-03'),(2500,'2022-11-04'),(2501,'2022-11-05'),(2502,'2022-11-06'),(2503,'2022-11-07'),(2504,'2022-11-08'),(2505,'2022-11-09'),(2506,'2022-11-10'),(2507,'2022-11-11'),(2508,'2022-11-12'),(2509,'2022-11-13'),(2510,'2022-11-14'),(2511,'2022-11-15'),(2512,'2022-11-16'),(2513,'2022-11-17'),(2514,'2022-11-18'),(2515,'2022-11-19'),(2516,'2022-11-20'),(2517,'2022-11-21'),(2518,'2022-11-22'),(2519,'2022-11-23'),(2520,'2022-11-24'),(2521,'2022-11-25'),(2522,'2022-11-26'),(2523,'2022-11-27'),(2524,'2022-11-28'),(2525,'2022-11-29'),(2526,'2022-11-30'),(2527,'2022-12-01'),(2528,'2022-12-02'),(2529,'2022-12-03'),(2530,'2022-12-04'),(2531,'2022-12-05'),(2532,'2022-12-06'),(2533,'2022-12-07'),(2534,'2022-12-08'),(2535,'2022-12-09'),(2536,'2022-12-10'),(2537,'2022-12-11'),(2538,'2022-12-12'),(2539,'2022-12-13'),(2540,'2022-12-14'),(2541,'2022-12-15'),(2542,'2022-12-16'),(2543,'2022-12-17'),(2544,'2022-12-18'),(2545,'2022-12-19'),(2546,'2022-12-20'),(2547,'2022-12-21'),(2548,'2022-12-22'),(2549,'2022-12-23'),(2550,'2022-12-24'),(2551,'2022-12-25'),(2552,'2022-12-26'),(2553,'2022-12-27'),(2554,'2022-12-28'),(2555,'2022-12-29'),(2556,'2022-12-30'),(2557,'2022-12-31'),(2558,'2023-01-01'),(2559,'2023-01-02'),(2560,'2023-01-03'),(2561,'2023-01-04'),(2562,'2023-01-05'),(2563,'2023-01-06'),(2564,'2023-01-07'),(2565,'2023-01-08'),(2566,'2023-01-09'),(2567,'2023-01-10'),(2568,'2023-01-11'),(2569,'2023-01-12'),(2570,'2023-01-13'),(2571,'2023-01-14'),(2572,'2023-01-15'),(2573,'2023-01-16'),(2574,'2023-01-17'),(2575,'2023-01-18'),(2576,'2023-01-19'),(2577,'2023-01-20'),(2578,'2023-01-21'),(2579,'2023-01-22'),(2580,'2023-01-23'),(2581,'2023-01-24'),(2582,'2023-01-25'),(2583,'2023-01-26'),(2584,'2023-01-27'),(2585,'2023-01-28'),(2586,'2023-01-29'),(2587,'2023-01-30'),(2588,'2023-01-31'),(2589,'2023-02-01'),(2590,'2023-02-02'),(2591,'2023-02-03'),(2592,'2023-02-04'),(2593,'2023-02-05'),(2594,'2023-02-06'),(2595,'2023-02-07'),(2596,'2023-02-08'),(2597,'2023-02-09'),(2598,'2023-02-10'),(2599,'2023-02-11'),(2600,'2023-02-12'),(2601,'2023-02-13'),(2602,'2023-02-14'),(2603,'2023-02-15'),(2604,'2023-02-16'),(2605,'2023-02-17'),(2606,'2023-02-18'),(2607,'2023-02-19'),(2608,'2023-02-20'),(2609,'2023-02-21'),(2610,'2023-02-22'),(2611,'2023-02-23'),(2612,'2023-02-24'),(2613,'2023-02-25'),(2614,'2023-02-26'),(2615,'2023-02-27'),(2616,'2023-02-28'),(2617,'2023-03-01'),(2618,'2023-03-02'),(2619,'2023-03-03'),(2620,'2023-03-04'),(2621,'2023-03-05'),(2622,'2023-03-06'),(2623,'2023-03-07'),(2624,'2023-03-08'),(2625,'2023-03-09'),(2626,'2023-03-10'),(2627,'2023-03-11'),(2628,'2023-03-12'),(2629,'2023-03-13'),(2630,'2023-03-14'),(2631,'2023-03-15'),(2632,'2023-03-16'),(2633,'2023-03-17'),(2634,'2023-03-18'),(2635,'2023-03-19'),(2636,'2023-03-20'),(2637,'2023-03-21'),(2638,'2023-03-22'),(2639,'2023-03-23'),(2640,'2023-03-24'),(2641,'2023-03-25'),(2642,'2023-03-26'),(2643,'2023-03-27'),(2644,'2023-03-28'),(2645,'2023-03-29'),(2646,'2023-03-30'),(2647,'2023-03-31'),(2648,'2023-04-01'),(2649,'2023-04-02'),(2650,'2023-04-03'),(2651,'2023-04-04'),(2652,'2023-04-05'),(2653,'2023-04-06'),(2654,'2023-04-07'),(2655,'2023-04-08'),(2656,'2023-04-09'),(2657,'2023-04-10'),(2658,'2023-04-11'),(2659,'2023-04-12'),(2660,'2023-04-13'),(2661,'2023-04-14'),(2662,'2023-04-15'),(2663,'2023-04-16'),(2664,'2023-04-17'),(2665,'2023-04-18'),(2666,'2023-04-19'),(2667,'2023-04-20'),(2668,'2023-04-21'),(2669,'2023-04-22'),(2670,'2023-04-23'),(2671,'2023-04-24'),(2672,'2023-04-25'),(2673,'2023-04-26'),(2674,'2023-04-27'),(2675,'2023-04-28'),(2676,'2023-04-29'),(2677,'2023-04-30'),(2678,'2023-05-01'),(2679,'2023-05-02'),(2680,'2023-05-03'),(2681,'2023-05-04'),(2682,'2023-05-05'),(2683,'2023-05-06'),(2684,'2023-05-07'),(2685,'2023-05-08'),(2686,'2023-05-09'),(2687,'2023-05-10'),(2688,'2023-05-11'),(2689,'2023-05-12'),(2690,'2023-05-13'),(2691,'2023-05-14'),(2692,'2023-05-15'),(2693,'2023-05-16'),(2694,'2023-05-17'),(2695,'2023-05-18'),(2696,'2023-05-19'),(2697,'2023-05-20'),(2698,'2023-05-21'),(2699,'2023-05-22'),(2700,'2023-05-23'),(2701,'2023-05-24'),(2702,'2023-05-25'),(2703,'2023-05-26'),(2704,'2023-05-27'),(2705,'2023-05-28'),(2706,'2023-05-29'),(2707,'2023-05-30'),(2708,'2023-05-31'),(2709,'2023-06-01'),(2710,'2023-06-02'),(2711,'2023-06-03'),(2712,'2023-06-04'),(2713,'2023-06-05'),(2714,'2023-06-06'),(2715,'2023-06-07'),(2716,'2023-06-08'),(2717,'2023-06-09'),(2718,'2023-06-10'),(2719,'2023-06-11'),(2720,'2023-06-12'),(2721,'2023-06-13'),(2722,'2023-06-14'),(2723,'2023-06-15'),(2724,'2023-06-16'),(2725,'2023-06-17'),(2726,'2023-06-18'),(2727,'2023-06-19'),(2728,'2023-06-20'),(2729,'2023-06-21'),(2730,'2023-06-22'),(2731,'2023-06-23'),(2732,'2023-06-24'),(2733,'2023-06-25'),(2734,'2023-06-26'),(2735,'2023-06-27'),(2736,'2023-06-28'),(2737,'2023-06-29'),(2738,'2023-06-30'),(2739,'2023-07-01'),(2740,'2023-07-02'),(2741,'2023-07-03'),(2742,'2023-07-04'),(2743,'2023-07-05'),(2744,'2023-07-06'),(2745,'2023-07-07'),(2746,'2023-07-08'),(2747,'2023-07-09'),(2748,'2023-07-10'),(2749,'2023-07-11'),(2750,'2023-07-12'),(2751,'2023-07-13'),(2752,'2023-07-14'),(2753,'2023-07-15'),(2754,'2023-07-16'),(2755,'2023-07-17'),(2756,'2023-07-18'),(2757,'2023-07-19'),(2758,'2023-07-20'),(2759,'2023-07-21'),(2760,'2023-07-22'),(2761,'2023-07-23'),(2762,'2023-07-24'),(2763,'2023-07-25'),(2764,'2023-07-26'),(2765,'2023-07-27'),(2766,'2023-07-28'),(2767,'2023-07-29'),(2768,'2023-07-30'),(2769,'2023-07-31'),(2770,'2023-08-01'),(2771,'2023-08-02'),(2772,'2023-08-03'),(2773,'2023-08-04'),(2774,'2023-08-05'),(2775,'2023-08-06'),(2776,'2023-08-07'),(2777,'2023-08-08'),(2778,'2023-08-09'),(2779,'2023-08-10'),(2780,'2023-08-11'),(2781,'2023-08-12'),(2782,'2023-08-13'),(2783,'2023-08-14'),(2784,'2023-08-15'),(2785,'2023-08-16'),(2786,'2023-08-17'),(2787,'2023-08-18'),(2788,'2023-08-19'),(2789,'2023-08-20'),(2790,'2023-08-21'),(2791,'2023-08-22'),(2792,'2023-08-23'),(2793,'2023-08-24'),(2794,'2023-08-25'),(2795,'2023-08-26'),(2796,'2023-08-27'),(2797,'2023-08-28'),(2798,'2023-08-29'),(2799,'2023-08-30'),(2800,'2023-08-31'),(2801,'2023-09-01'),(2802,'2023-09-02'),(2803,'2023-09-03'),(2804,'2023-09-04'),(2805,'2023-09-05'),(2806,'2023-09-06'),(2807,'2023-09-07'),(2808,'2023-09-08'),(2809,'2023-09-09'),(2810,'2023-09-10'),(2811,'2023-09-11'),(2812,'2023-09-12'),(2813,'2023-09-13'),(2814,'2023-09-14'),(2815,'2023-09-15'),(2816,'2023-09-16'),(2817,'2023-09-17'),(2818,'2023-09-18'),(2819,'2023-09-19'),(2820,'2023-09-20'),(2821,'2023-09-21'),(2822,'2023-09-22'),(2823,'2023-09-23'),(2824,'2023-09-24'),(2825,'2023-09-25'),(2826,'2023-09-26'),(2827,'2023-09-27'),(2828,'2023-09-28'),(2829,'2023-09-29'),(2830,'2023-09-30'),(2831,'2023-10-01'),(2832,'2023-10-02'),(2833,'2023-10-03'),(2834,'2023-10-04'),(2835,'2023-10-05'),(2836,'2023-10-06'),(2837,'2023-10-07'),(2838,'2023-10-08'),(2839,'2023-10-09'),(2840,'2023-10-10'),(2841,'2023-10-11'),(2842,'2023-10-12'),(2843,'2023-10-13'),(2844,'2023-10-14'),(2845,'2023-10-15'),(2846,'2023-10-16'),(2847,'2023-10-17'),(2848,'2023-10-18'),(2849,'2023-10-19'),(2850,'2023-10-20'),(2851,'2023-10-21'),(2852,'2023-10-22'),(2853,'2023-10-23'),(2854,'2023-10-24'),(2855,'2023-10-25'),(2856,'2023-10-26'),(2857,'2023-10-27'),(2858,'2023-10-28'),(2859,'2023-10-29'),(2860,'2023-10-30'),(2861,'2023-10-31'),(2862,'2023-11-01'),(2863,'2023-11-02'),(2864,'2023-11-03'),(2865,'2023-11-04'),(2866,'2023-11-05'),(2867,'2023-11-06'),(2868,'2023-11-07'),(2869,'2023-11-08'),(2870,'2023-11-09'),(2871,'2023-11-10'),(2872,'2023-11-11'),(2873,'2023-11-12'),(2874,'2023-11-13'),(2875,'2023-11-14'),(2876,'2023-11-15'),(2877,'2023-11-16'),(2878,'2023-11-17'),(2879,'2023-11-18'),(2880,'2023-11-19'),(2881,'2023-11-20'),(2882,'2023-11-21'),(2883,'2023-11-22'),(2884,'2023-11-23'),(2885,'2023-11-24'),(2886,'2023-11-25'),(2887,'2023-11-26'),(2888,'2023-11-27'),(2889,'2023-11-28'),(2890,'2023-11-29'),(2891,'2023-11-30'),(2892,'2023-12-01'),(2893,'2023-12-02'),(2894,'2023-12-03'),(2895,'2023-12-04'),(2896,'2023-12-05'),(2897,'2023-12-06'),(2898,'2023-12-07'),(2899,'2023-12-08'),(2900,'2023-12-09'),(2901,'2023-12-10'),(2902,'2023-12-11'),(2903,'2023-12-12'),(2904,'2023-12-13'),(2905,'2023-12-14'),(2906,'2023-12-15'),(2907,'2023-12-16'),(2908,'2023-12-17'),(2909,'2023-12-18'),(2910,'2023-12-19'),(2911,'2023-12-20'),(2912,'2023-12-21'),(2913,'2023-12-22'),(2914,'2023-12-23'),(2915,'2023-12-24'),(2916,'2023-12-25'),(2917,'2023-12-26'),(2918,'2023-12-27'),(2919,'2023-12-28'),(2920,'2023-12-29'),(2921,'2023-12-30'),(2922,'2023-12-31'),(2923,'2024-01-01'),(2924,'2024-01-02'),(2925,'2024-01-03'),(2926,'2024-01-04'),(2927,'2024-01-05'),(2928,'2024-01-06'),(2929,'2024-01-07'),(2930,'2024-01-08'),(2931,'2024-01-09'),(2932,'2024-01-10'),(2933,'2024-01-11'),(2934,'2024-01-12'),(2935,'2024-01-13'),(2936,'2024-01-14'),(2937,'2024-01-15'),(2938,'2024-01-16'),(2939,'2024-01-17'),(2940,'2024-01-18'),(2941,'2024-01-19'),(2942,'2024-01-20'),(2943,'2024-01-21'),(2944,'2024-01-22'),(2945,'2024-01-23'),(2946,'2024-01-24'),(2947,'2024-01-25'),(2948,'2024-01-26'),(2949,'2024-01-27'),(2950,'2024-01-28'),(2951,'2024-01-29'),(2952,'2024-01-30'),(2953,'2024-01-31'),(2954,'2024-02-01'),(2955,'2024-02-02'),(2956,'2024-02-03'),(2957,'2024-02-04'),(2958,'2024-02-05'),(2959,'2024-02-06'),(2960,'2024-02-07'),(2961,'2024-02-08'),(2962,'2024-02-09'),(2963,'2024-02-10'),(2964,'2024-02-11'),(2965,'2024-02-12'),(2966,'2024-02-13'),(2967,'2024-02-14'),(2968,'2024-02-15'),(2969,'2024-02-16'),(2970,'2024-02-17'),(2971,'2024-02-18'),(2972,'2024-02-19'),(2973,'2024-02-20'),(2974,'2024-02-21'),(2975,'2024-02-22'),(2976,'2024-02-23'),(2977,'2024-02-24'),(2978,'2024-02-25'),(2979,'2024-02-26'),(2980,'2024-02-27'),(2981,'2024-02-28'),(2982,'2024-02-29'),(2983,'2024-03-01'),(2984,'2024-03-02'),(2985,'2024-03-03'),(2986,'2024-03-04'),(2987,'2024-03-05'),(2988,'2024-03-06'),(2989,'2024-03-07'),(2990,'2024-03-08'),(2991,'2024-03-09'),(2992,'2024-03-10'),(2993,'2024-03-11'),(2994,'2024-03-12'),(2995,'2024-03-13'),(2996,'2024-03-14'),(2997,'2024-03-15'),(2998,'2024-03-16'),(2999,'2024-03-17'),(3000,'2024-03-18'),(3001,'2024-03-19'),(3002,'2024-03-20'),(3003,'2024-03-21'),(3004,'2024-03-22'),(3005,'2024-03-23'),(3006,'2024-03-24'),(3007,'2024-03-25'),(3008,'2024-03-26'),(3009,'2024-03-27'),(3010,'2024-03-28'),(3011,'2024-03-29'),(3012,'2024-03-30'),(3013,'2024-03-31'),(3014,'2024-04-01'),(3015,'2024-04-02'),(3016,'2024-04-03'),(3017,'2024-04-04'),(3018,'2024-04-05'),(3019,'2024-04-06'),(3020,'2024-04-07'),(3021,'2024-04-08'),(3022,'2024-04-09'),(3023,'2024-04-10'),(3024,'2024-04-11'),(3025,'2024-04-12'),(3026,'2024-04-13'),(3027,'2024-04-14'),(3028,'2024-04-15'),(3029,'2024-04-16'),(3030,'2024-04-17'),(3031,'2024-04-18'),(3032,'2024-04-19'),(3033,'2024-04-20'),(3034,'2024-04-21'),(3035,'2024-04-22'),(3036,'2024-04-23'),(3037,'2024-04-24'),(3038,'2024-04-25'),(3039,'2024-04-26'),(3040,'2024-04-27'),(3041,'2024-04-28'),(3042,'2024-04-29'),(3043,'2024-04-30'),(3044,'2024-05-01'),(3045,'2024-05-02'),(3046,'2024-05-03'),(3047,'2024-05-04'),(3048,'2024-05-05'),(3049,'2024-05-06'),(3050,'2024-05-07'),(3051,'2024-05-08'),(3052,'2024-05-09'),(3053,'2024-05-10'),(3054,'2024-05-11'),(3055,'2024-05-12'),(3056,'2024-05-13'),(3057,'2024-05-14'),(3058,'2024-05-15'),(3059,'2024-05-16'),(3060,'2024-05-17'),(3061,'2024-05-18'),(3062,'2024-05-19'),(3063,'2024-05-20'),(3064,'2024-05-21'),(3065,'2024-05-22'),(3066,'2024-05-23'),(3067,'2024-05-24'),(3068,'2024-05-25'),(3069,'2024-05-26'),(3070,'2024-05-27'),(3071,'2024-05-28'),(3072,'2024-05-29'),(3073,'2024-05-30'),(3074,'2024-05-31'),(3075,'2024-06-01'),(3076,'2024-06-02'),(3077,'2024-06-03'),(3078,'2024-06-04'),(3079,'2024-06-05'),(3080,'2024-06-06'),(3081,'2024-06-07'),(3082,'2024-06-08'),(3083,'2024-06-09'),(3084,'2024-06-10'),(3085,'2024-06-11'),(3086,'2024-06-12'),(3087,'2024-06-13'),(3088,'2024-06-14'),(3089,'2024-06-15'),(3090,'2024-06-16'),(3091,'2024-06-17'),(3092,'2024-06-18'),(3093,'2024-06-19'),(3094,'2024-06-20'),(3095,'2024-06-21'),(3096,'2024-06-22'),(3097,'2024-06-23'),(3098,'2024-06-24'),(3099,'2024-06-25'),(3100,'2024-06-26'),(3101,'2024-06-27'),(3102,'2024-06-28'),(3103,'2024-06-29'),(3104,'2024-06-30'),(3105,'2024-07-01'),(3106,'2024-07-02'),(3107,'2024-07-03'),(3108,'2024-07-04'),(3109,'2024-07-05'),(3110,'2024-07-06'),(3111,'2024-07-07'),(3112,'2024-07-08'),(3113,'2024-07-09'),(3114,'2024-07-10'),(3115,'2024-07-11'),(3116,'2024-07-12'),(3117,'2024-07-13'),(3118,'2024-07-14'),(3119,'2024-07-15'),(3120,'2024-07-16'),(3121,'2024-07-17'),(3122,'2024-07-18'),(3123,'2024-07-19'),(3124,'2024-07-20'),(3125,'2024-07-21'),(3126,'2024-07-22'),(3127,'2024-07-23'),(3128,'2024-07-24'),(3129,'2024-07-25'),(3130,'2024-07-26'),(3131,'2024-07-27'),(3132,'2024-07-28'),(3133,'2024-07-29'),(3134,'2024-07-30'),(3135,'2024-07-31'),(3136,'2024-08-01'),(3137,'2024-08-02'),(3138,'2024-08-03'),(3139,'2024-08-04'),(3140,'2024-08-05'),(3141,'2024-08-06'),(3142,'2024-08-07'),(3143,'2024-08-08'),(3144,'2024-08-09'),(3145,'2024-08-10'),(3146,'2024-08-11'),(3147,'2024-08-12'),(3148,'2024-08-13'),(3149,'2024-08-14'),(3150,'2024-08-15'),(3151,'2024-08-16'),(3152,'2024-08-17'),(3153,'2024-08-18'),(3154,'2024-08-19'),(3155,'2024-08-20'),(3156,'2024-08-21'),(3157,'2024-08-22'),(3158,'2024-08-23'),(3159,'2024-08-24'),(3160,'2024-08-25'),(3161,'2024-08-26'),(3162,'2024-08-27'),(3163,'2024-08-28'),(3164,'2024-08-29'),(3165,'2024-08-30'),(3166,'2024-08-31'),(3167,'2024-09-01'),(3168,'2024-09-02'),(3169,'2024-09-03'),(3170,'2024-09-04'),(3171,'2024-09-05'),(3172,'2024-09-06'),(3173,'2024-09-07'),(3174,'2024-09-08'),(3175,'2024-09-09'),(3176,'2024-09-10'),(3177,'2024-09-11'),(3178,'2024-09-12'),(3179,'2024-09-13'),(3180,'2024-09-14'),(3181,'2024-09-15'),(3182,'2024-09-16'),(3183,'2024-09-17'),(3184,'2024-09-18'),(3185,'2024-09-19'),(3186,'2024-09-20'),(3187,'2024-09-21'),(3188,'2024-09-22'),(3189,'2024-09-23'),(3190,'2024-09-24'),(3191,'2024-09-25'),(3192,'2024-09-26'),(3193,'2024-09-27'),(3194,'2024-09-28'),(3195,'2024-09-29'),(3196,'2024-09-30'),(3197,'2024-10-01'),(3198,'2024-10-02'),(3199,'2024-10-03'),(3200,'2024-10-04'),(3201,'2024-10-05'),(3202,'2024-10-06'),(3203,'2024-10-07'),(3204,'2024-10-08'),(3205,'2024-10-09'),(3206,'2024-10-10'),(3207,'2024-10-11'),(3208,'2024-10-12'),(3209,'2024-10-13'),(3210,'2024-10-14'),(3211,'2024-10-15'),(3212,'2024-10-16'),(3213,'2024-10-17'),(3214,'2024-10-18'),(3215,'2024-10-19'),(3216,'2024-10-20'),(3217,'2024-10-21'),(3218,'2024-10-22'),(3219,'2024-10-23'),(3220,'2024-10-24'),(3221,'2024-10-25'),(3222,'2024-10-26'),(3223,'2024-10-27'),(3224,'2024-10-28'),(3225,'2024-10-29'),(3226,'2024-10-30'),(3227,'2024-10-31'),(3228,'2024-11-01'),(3229,'2024-11-02'),(3230,'2024-11-03'),(3231,'2024-11-04'),(3232,'2024-11-05'),(3233,'2024-11-06'),(3234,'2024-11-07'),(3235,'2024-11-08'),(3236,'2024-11-09'),(3237,'2024-11-10'),(3238,'2024-11-11'),(3239,'2024-11-12'),(3240,'2024-11-13'),(3241,'2024-11-14'),(3242,'2024-11-15'),(3243,'2024-11-16'),(3244,'2024-11-17'),(3245,'2024-11-18'),(3246,'2024-11-19'),(3247,'2024-11-20'),(3248,'2024-11-21'),(3249,'2024-11-22'),(3250,'2024-11-23'),(3251,'2024-11-24'),(3252,'2024-11-25'),(3253,'2024-11-26'),(3254,'2024-11-27'),(3255,'2024-11-28'),(3256,'2024-11-29'),(3257,'2024-11-30'),(3258,'2024-12-01'),(3259,'2024-12-02'),(3260,'2024-12-03'),(3261,'2024-12-04'),(3262,'2024-12-05'),(3263,'2024-12-06'),(3264,'2024-12-07'),(3265,'2024-12-08'),(3266,'2024-12-09'),(3267,'2024-12-10'),(3268,'2024-12-11'),(3269,'2024-12-12'),(3270,'2024-12-13'),(3271,'2024-12-14'),(3272,'2024-12-15'),(3273,'2024-12-16'),(3274,'2024-12-17'),(3275,'2024-12-18'),(3276,'2024-12-19'),(3277,'2024-12-20'),(3278,'2024-12-21'),(3279,'2024-12-22'),(3280,'2024-12-23'),(3281,'2024-12-24'),(3282,'2024-12-25'),(3283,'2024-12-26'),(3284,'2024-12-27'),(3285,'2024-12-28'),(3286,'2024-12-29'),(3287,'2024-12-30'),(3288,'2024-12-31');
/*!40000 ALTER TABLE `fw_date` ENABLE KEYS */;
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
INSERT INTO `fw_function` VALUES ('113e5cf2-e90b-453d-a555-e5c701ef1043',NULL,'收支','speech/framework/menuicon/finance.png',80,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 12:42:48','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:03',0),('20f8f9f0-2c97-4d5b-a21b-cd92da1ed303','113e5cf2-e90b-453d-a555-e5c701ef1043','平台收支',NULL,10,0,'/redbag/incomelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 06:17:48','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 06:17:48',0),('25d92094-58de-4abd-b220-ea1b642eca03','113e5cf2-e90b-453d-a555-e5c701ef1043','红包提现',NULL,40,0,'/redbag/withdrawlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 11:33:33','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 11:33:33',0),('2a906f7f-9d1d-4cd2-afb4-04587ab171fa',NULL,'哒伴','menuicon/user2.png',40,0,NULL,1,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:10:15','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:30:20',1),('3ffaf59e-017b-11e7-acd2-f0def107233a','e7ae03fb-f8d2-11e6-8e70-f0def107233a','功能菜单',NULL,100,0,'admin/sysmenutree',0,0,'3ffaf638-017b-11e7-acd2-f0def107233a','2017-03-05 16:10:45','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:19',0),('52c08d5d-3375-42ca-8c9b-b5c993d53c7e','cfd13eae-f9e5-485b-8666-5e3f1aa40763','参数设置',NULL,100,0,'/admin/settingblank',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 05:35:14','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 05:36:13',0),('6c4c80cd-d129-4288-8295-bf18929f319c','e7ae03fb-f8d2-11e6-8e70-f0def107233a','字典维护',NULL,4,0,'/admin/dictionarylist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-03-07 02:18:56','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-25 11:28:49',1),('72f9aac1-f8d3-11e6-8e70-f0def107233a','e7ae03fb-f8d2-11e6-8e70-f0def107233a','组织架构管理',NULL,30,0,'/admin/userlist',0,0,'72f9aaff-f8d3-11e6-8e70-f0def107233a','2017-02-22 15:49:33','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:52:56',0),('78a192c6-8346-4acb-8cc6-576b250b0f6c','f9a71679-54a3-43ca-824f-3773d45ee60f','应用反馈',NULL,80,0,'/admin/feedbacklist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-05 06:08:37','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-05 06:08:37',1),('b27d1f25-e065-4d6a-89f4-8200f776b570','cfd13eae-f9e5-485b-8666-5e3f1aa40763','用户',NULL,10,0,'/crm/memberlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-22 03:16:05','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-02 12:02:15',0),('c0d3c818-27e1-4951-8e22-f79c72b045bf','cfd13eae-f9e5-485b-8666-5e3f1aa40763','主题音乐',NULL,40,0,'/redbag/musiclist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-17 11:41:19','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-17 11:41:19',0),('cfd13eae-f9e5-485b-8666-5e3f1aa40763',NULL,'红包','redbag/menuicon/redbag.png',30,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:33:32','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-17 03:51:10',0),('e6a18e35-c077-4e89-b7a8-ee4619b1d089','e7ae03fb-f8d2-11e6-8e70-f0def107233a','系统角色',NULL,40,0,'admin/rolelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:10:19','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:05',0),('e7ae03fb-f8d2-11e6-8e70-f0def107233a',NULL,'系统','speech/framework/menuicon/computer.png',1000,0,NULL,0,0,'e7ae0439-f8d2-11e6-8e70-f0def107233a','2017-02-22 15:45:39','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:24',0),('f6644b8b-f9e0-43d6-aa2d-80207e15d609','cfd13eae-f9e5-485b-8666-5e3f1aa40763','主题背景',NULL,50,0,'/redbag/backgroundlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:34:58','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-04 12:00:24',0),('f9040a15-eb67-4d0c-847d-5d3576886078','e7ae03fb-f8d2-11e6-8e70-f0def107233a','分享配置',NULL,20,0,'/admin/sharelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-08 01:20:43','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-08 01:20:43',0),('f9a71679-54a3-43ca-824f-3773d45ee60f',NULL,'平台','speech/framework/menuicon/setting.png',90,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-07 12:00:12','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:15',1),('fa808258-5892-4d60-9881-50467c644a00','f9a71679-54a3-43ca-824f-3773d45ee60f','平台参数',NULL,5,0,'/admin/settingblank',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:03:36','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 09:39:36',1),('fb25a880-1205-4227-b249-760f0f405b41','cfd13eae-f9e5-485b-8666-5e3f1aa40763','芝麻包',NULL,20,0,'/redbag/redbaglist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-22 03:16:26','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-15 11:22:58',0);
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
-- Table structure for table `fw_setting`
--

DROP TABLE IF EXISTS `fw_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_setting` (
  `app_id` varchar(20) NOT NULL COMMENT '绑定的商户应用id	',
  `setting_json` varchar(2048) DEFAULT NULL COMMENT '系统设置内容',
  PRIMARY KEY (`app_id`),
  KEY `AppIdIndex` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_setting`
--

LOCK TABLES `fw_setting` WRITE;
/*!40000 ALTER TABLE `fw_setting` DISABLE KEYS */;
INSERT INTO `fw_setting` VALUES ('wxef31174b9f28d7d3','{\"auditimage\":\"redbag/poster/6abe5103-2af1-44ad-8ade-9d612be93423.jpeg\",\"servicerate\":\"2.00\",\"withdraw\":\"2.00\"}');
/*!40000 ALTER TABLE `fw_setting` ENABLE KEYS */;
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
-- Table structure for table `pf_share`
--

DROP TABLE IF EXISTS `pf_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_share` (
  `share_id` char(36) NOT NULL COMMENT '分享id(主键）',
  `parent_id` char(36) DEFAULT NULL COMMENT '分享id(主键）',
  `user_id` char(36) NOT NULL COMMENT '用户ID（主键）',
  `share_date` datetime NOT NULL COMMENT '分享日期',
  `share_url` varchar(255) NOT NULL COMMENT '分享链接',
  `share_target` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分享位置\n            0:微信好友\n            1:朋友圈',
  `share_scene` varchar(32) DEFAULT NULL COMMENT '二维码的sence',
  `share_param` varchar(1024) NOT NULL COMMENT '分享链接中包含的参数',
  PRIMARY KEY (`share_id`),
  KEY `userIndex` (`user_id`),
  KEY `FK_share_ref_share` (`parent_id`),
  CONSTRAINT `FK_share_ref_share` FOREIGN KEY (`parent_id`) REFERENCES `pf_share` (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_share`
--

LOCK TABLES `pf_share` WRITE;
/*!40000 ALTER TABLE `pf_share` DISABLE KEYS */;
INSERT INTO `pf_share` VALUES ('009f5115-7230-4f21-b879-a736dc3fdcdf',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:29:27','page/index/index?id=57&groupid=1547741964426&shareid=009f5115-7230-4f21-b879-a736dc3fdcdf',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"page/index/index?id=57&groupid=1547741964426&shareid=009f5115-7230-4f21-b879-a736dc3fdcdf\"}'),('027006df-6029-4cbf-8d89-9ac82b478716',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 10:57:13','pages/index/index?id=68&groupid=1547809687411&shareid=027006df-6029-4cbf-8d89-9ac82b478716',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547809687411\",\"url\":\"pages/index/index?id=68&groupid=1547809687411&shareid=027006df-6029-4cbf-8d89-9ac82b478716\"}'),('0684ab3a-83da-4a74-b118-aba863512efb',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:26:27','pages/index/index?id=57&shareid=0684ab3a-83da-4a74-b118-aba863512efb',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"pages/index/index?id=57&shareid=0684ab3a-83da-4a74-b118-aba863512efb\"}'),('0a6d3bf0-25ba-4e85-9e07-e592bf8d82a0',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-18 19:00:17','pages/index/index?id=67&groupid=1547809039953&shareid=0a6d3bf0-25ba-4e85-9e07-e592bf8d82a0',0,NULL,'{\"groupid\":\"&groupid=1547809039953\",\"id\":\"67\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=0a6d3bf0-25ba-4e85-9e07-e592bf8d82a0\"}'),('0ec53f1d-551e-43f9-afe5-5df6d43317fa',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:59:56','pages/index/index?id=67&groupid=1547809039953&shareid=0ec53f1d-551e-43f9-afe5-5df6d43317fa',0,NULL,'{\"id\":\"67\",\"groupid\":\"&groupid=1547809039953\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=0ec53f1d-551e-43f9-afe5-5df6d43317fa\"}'),('128615f8-25fe-4970-aaf8-aa23c87a4e1f',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-18 18:58:13','pages/index/index?id=67&groupid=1547809090509&shareid=128615f8-25fe-4970-aaf8-aa23c87a4e1f',0,NULL,'{\"id\":\"67\",\"groupid\":\"&groupid=1547809090509\",\"url\":\"pages/index/index?id=67&groupid=1547809090509&shareid=128615f8-25fe-4970-aaf8-aa23c87a4e1f\"}'),('193b504d-83e9-4bab-b868-64c538281873',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 18:47:54','page/index/index?id=64&groupid=1547808464744&shareid=193b504d-83e9-4bab-b868-64c538281873',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547808464744\",\"url\":\"page/index/index?id=64&groupid=1547808464744&shareid=193b504d-83e9-4bab-b868-64c538281873\"}'),('206bfff3-8087-4de7-aec4-9498962b78de',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:07:03','pages/index/index?id=58&shareid=206bfff3-8087-4de7-aec4-9498962b78de',0,NULL,'{\"groupid\":\"&groupid=undefined\",\"url\":\"pages/index/index?id=58&shareid=206bfff3-8087-4de7-aec4-9498962b78de\"}'),('21a97962-161a-411c-9978-3e6af9a50ec1',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:47:55','page/index/index?id=64&groupid=1547802655940&shareid=21a97962-161a-411c-9978-3e6af9a50ec1',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=64&groupid=1547802655940&shareid=21a97962-161a-411c-9978-3e6af9a50ec1\"}'),('224f0665-b9e7-4389-8802-e38301f638f5',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 14:07:10','pages/index/index?id=79&groupid=1547964425980&shareid=224f0665-b9e7-4389-8802-e38301f638f5',0,NULL,'{\"id\":\"79\",\"groupid\":\"&groupid=1547964425980\",\"url\":\"pages/index/index?id=79&groupid=1547964425980&shareid=224f0665-b9e7-4389-8802-e38301f638f5\"}'),('23b9c12b-1b3f-46bb-86b6-c64572ded38f',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-17 22:39:45','pages/index/index?id=58&shareid=23b9c12b-1b3f-46bb-86b6-c64572ded38f',0,NULL,'{\"url\":\"pages/index/index?id=58&shareid=23b9c12b-1b3f-46bb-86b6-c64572ded38f\"}'),('2660eae2-30aa-487c-97f1-605e13416caf',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:29:39','page/index/index?id=57&groupid=1547741964426&shareid=2660eae2-30aa-487c-97f1-605e13416caf',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"page/index/index?id=57&groupid=1547741964426&shareid=2660eae2-30aa-487c-97f1-605e13416caf\"}'),('27c2b5c4-7dff-4d26-909e-e0682192d4c6',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 17:12:15','page/index/index?id=&groupid=1547802655940&shareid=27c2b5c4-7dff-4d26-909e-e0682192d4c6',0,NULL,'{\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=&groupid=1547802655940&shareid=27c2b5c4-7dff-4d26-909e-e0682192d4c6\"}'),('2f6b51ff-89b5-417b-85d7-a2793b172caf',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 10:58:20','pages/index/index?id=68&groupid=1547952744782&shareid=2f6b51ff-89b5-417b-85d7-a2793b172caf',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547952744782\",\"url\":\"pages/index/index?id=68&groupid=1547952744782&shareid=2f6b51ff-89b5-417b-85d7-a2793b172caf\"}'),('348ead38-0d44-4802-b16d-5e32ae64bcfa',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 12:02:29','pages/index/index?id=76&groupid=1547956933888&shareid=348ead38-0d44-4802-b16d-5e32ae64bcfa',0,NULL,'{\"id\":\"76\",\"groupid\":\"&groupid=1547956933888\",\"url\":\"pages/index/index?id=76&groupid=1547956933888&shareid=348ead38-0d44-4802-b16d-5e32ae64bcfa\"}'),('35c0b764-0338-4598-bbda-32a600e0283f',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:52:37','page/index/index?id=&groupid=1547799891481&shareid=35c0b764-0338-4598-bbda-32a600e0283f',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=35c0b764-0338-4598-bbda-32a600e0283f\"}'),('398858eb-e066-4c8d-9bbf-4ff2b5ba31f6',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:47:28','page/index/index?id=64&groupid=1547802655940&shareid=398858eb-e066-4c8d-9bbf-4ff2b5ba31f6',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=64&groupid=1547802655940&shareid=398858eb-e066-4c8d-9bbf-4ff2b5ba31f6\"}'),('444180f6-3c51-4ee6-ac0c-3985f644d6a1',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 11:42:15','pages/index/index?id=75&groupid=undefined&shareid=444180f6-3c51-4ee6-ac0c-3985f644d6a1',0,NULL,'{\"groupid\":\"&groupid=undefined\",\"id\":\"75\",\"url\":\"pages/index/index?id=75&groupid=undefined&shareid=444180f6-3c51-4ee6-ac0c-3985f644d6a1\"}'),('445934f9-b46e-41ce-93a5-a5125a26c5aa',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:59:28','pages/index/index?id=67&groupid=1547809039953&shareid=445934f9-b46e-41ce-93a5-a5125a26c5aa',0,NULL,'{\"id\":\"67\",\"groupid\":\"&groupid=1547809039953\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=445934f9-b46e-41ce-93a5-a5125a26c5aa\"}'),('4618413d-9214-4599-a1f7-7d19b6d5804e',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-20 12:52:24','pages/index/index?id=77&groupid=1547959935041&shareid=4618413d-9214-4599-a1f7-7d19b6d5804e',0,NULL,'{\"id\":\"77\",\"groupid\":\"&groupid=1547959935041\",\"url\":\"pages/index/index?id=77&groupid=1547959935041&shareid=4618413d-9214-4599-a1f7-7d19b6d5804e\"}'),('48264c4a-93b1-4c8e-8b84-9b78c412834d',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 19:08:20','pages/index/index?id=68&groupid=1547809687411&shareid=48264c4a-93b1-4c8e-8b84-9b78c412834d',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547809687411\",\"url\":\"pages/index/index?id=68&groupid=1547809687411&shareid=48264c4a-93b1-4c8e-8b84-9b78c412834d\"}'),('4927c927-8535-460b-8e0d-a1ecb5f31303',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 11:30:41','pages/index/index?id=74&groupid=1547955036795&shareid=4927c927-8535-460b-8e0d-a1ecb5f31303',0,NULL,'{\"id\":\"74\",\"groupid\":\"&groupid=1547955036795\",\"url\":\"pages/index/index?id=74&groupid=1547955036795&shareid=4927c927-8535-460b-8e0d-a1ecb5f31303\"}'),('4d18c48f-cb01-4fa1-b4b8-652e08ec2aff',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:49:18','pages/index/index?id=64&groupid=1547802655940&shareid=4d18c48f-cb01-4fa1-b4b8-652e08ec2aff',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547802655940\",\"url\":\"pages/index/index?id=64&groupid=1547802655940&shareid=4d18c48f-cb01-4fa1-b4b8-652e08ec2aff\"}'),('4d4bb357-802a-4296-a8ee-5a4a2074adfc',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:07:38','pages/index/index?id=58&shareid=4d4bb357-802a-4296-a8ee-5a4a2074adfc',0,NULL,'{\"groupid\":\"&groupid=undefined\",\"url\":\"pages/index/index?id=58&shareid=4d4bb357-802a-4296-a8ee-5a4a2074adfc\"}'),('5aa527a6-7ace-4f01-a852-bbbc4764f934',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-17 22:48:49','pages/index/index?id=58&shareid=5aa527a6-7ace-4f01-a852-bbbc4764f934',0,NULL,'{\"url\":\"pages/index/index?id=58&shareid=5aa527a6-7ace-4f01-a852-bbbc4764f934\"}'),('613b942e-fb24-4e94-8c7e-df1e0a923d0b',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 10:51:38','pages/index/index?id=68&groupid=1547809687411&shareid=613b942e-fb24-4e94-8c7e-df1e0a923d0b',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547809687411\",\"url\":\"pages/index/index?id=68&groupid=1547809687411&shareid=613b942e-fb24-4e94-8c7e-df1e0a923d0b\"}'),('62a4faf7-41b3-4314-9481-e215cfb0a244',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 12:04:33','pages/index/index?id=76&groupid=1547956933888&shareid=62a4faf7-41b3-4314-9481-e215cfb0a244',0,NULL,'{\"id\":\"76\",\"groupid\":\"&groupid=1547956933888\",\"url\":\"pages/index/index?id=76&groupid=1547956933888&shareid=62a4faf7-41b3-4314-9481-e215cfb0a244\"}'),('7a9a2a93-8b9c-4626-93c6-cf5fa10c857d',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:18:44','pages/index/index?id=57&shareid=7a9a2a93-8b9c-4626-93c6-cf5fa10c857d',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=undefined\",\"url\":\"pages/index/index?id=57&shareid=7a9a2a93-8b9c-4626-93c6-cf5fa10c857d\"}'),('7bed0047-c04d-4bb2-a9f3-ce338853ba79',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:50:22','page/index/index?id=&groupid=1547799891481&shareid=7bed0047-c04d-4bb2-a9f3-ce338853ba79',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=7bed0047-c04d-4bb2-a9f3-ce338853ba79\"}'),('86e1fa09-e7c1-4d9b-a4c2-cdf41d5af9d8',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:50:39','page/index/index?id=&groupid=1547799891481&shareid=86e1fa09-e7c1-4d9b-a4c2-cdf41d5af9d8',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=86e1fa09-e7c1-4d9b-a4c2-cdf41d5af9d8\"}'),('880705bc-c736-42a8-bb37-3c2893f335f3',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:46:41','page/index/index?id=64&groupid=1547802655940&shareid=880705bc-c736-42a8-bb37-3c2893f335f3',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=64&groupid=1547802655940&shareid=880705bc-c736-42a8-bb37-3c2893f335f3\"}'),('88af163d-104a-488c-8a5f-1298f87a8cf5',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:53:47','page/index/index?id=&groupid=1547799891481&shareid=88af163d-104a-488c-8a5f-1298f87a8cf5',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=88af163d-104a-488c-8a5f-1298f87a8cf5\"}'),('88fceb01-0100-4da5-9eb8-7239a95f0010',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:49:43','pages/index/index?id=64&groupid=1547802655940&shareid=88fceb01-0100-4da5-9eb8-7239a95f0010',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547802655940\",\"url\":\"pages/index/index?id=64&groupid=1547802655940&shareid=88fceb01-0100-4da5-9eb8-7239a95f0010\"}'),('8e1b3c7c-74a2-42c0-b8e3-632104b21883',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:12:22','pages/index/index?id=57&shareid=8e1b3c7c-74a2-42c0-b8e3-632104b21883',0,NULL,'{\"groupid\":\"&groupid=undefined\",\"url\":\"pages/index/index?id=57&shareid=8e1b3c7c-74a2-42c0-b8e3-632104b21883\"}'),('9073724c-0887-4926-88dd-73400d7502fc',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:52:29','pages/index/index?id=66&groupid=1547808746717&shareid=9073724c-0887-4926-88dd-73400d7502fc',0,NULL,'{\"id\":\"66\",\"groupid\":\"&groupid=1547808746717\",\"url\":\"pages/index/index?id=66&groupid=1547808746717&shareid=9073724c-0887-4926-88dd-73400d7502fc\"}'),('9832395f-6442-4c04-8c5f-b9d6f7b9a50e',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:19:27','pages/index/index?id=57&shareid=9832395f-6442-4c04-8c5f-b9d6f7b9a50e',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"pages/index/index?id=57&shareid=9832395f-6442-4c04-8c5f-b9d6f7b9a50e\"}'),('9ebd536d-e50f-4ba1-9cb4-47074e110d70',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 11:26:49','pages/index/index?id=73&groupid=1547954785388&shareid=9ebd536d-e50f-4ba1-9cb4-47074e110d70',0,NULL,'{\"id\":\"73\",\"groupid\":\"&groupid=1547954785388\",\"url\":\"pages/index/index?id=73&groupid=1547954785388&shareid=9ebd536d-e50f-4ba1-9cb4-47074e110d70\"}'),('9edb5264-1875-4ec5-9c8b-1cafb8690d14',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:50:28','page/index/index?id=&groupid=1547799891481&shareid=9edb5264-1875-4ec5-9c8b-1cafb8690d14',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=9edb5264-1875-4ec5-9c8b-1cafb8690d14\"}'),('a139b22b-afd9-406b-9ebb-4bff4b158b16',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 17:16:42','page/index/index?id=&groupid=1547802655940&shareid=a139b22b-afd9-406b-9ebb-4bff4b158b16',0,NULL,'{\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=&groupid=1547802655940&shareid=a139b22b-afd9-406b-9ebb-4bff4b158b16\"}'),('a5ea573d-4987-4328-af62-36c94479eed6',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 17:29:17','page/index/index?id=&groupid=1547802655940&shareid=a5ea573d-4987-4328-af62-36c94479eed6',0,NULL,'{\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=&groupid=1547802655940&shareid=a5ea573d-4987-4328-af62-36c94479eed6\"}'),('a7ebfda0-e856-4f26-b37c-c52ebdb0f5f5',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:58:04','pages/index/index?id=66&groupid=1547808746717&shareid=a7ebfda0-e856-4f26-b37c-c52ebdb0f5f5',0,NULL,'{\"id\":\"66\",\"groupid\":\"&groupid=1547808746717\",\"url\":\"pages/index/index?id=66&groupid=1547808746717&shareid=a7ebfda0-e856-4f26-b37c-c52ebdb0f5f5\"}'),('b41525b6-e9c8-481c-a3ff-352c31972999',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:52:34','page/index/index?id=&groupid=1547799891481&shareid=b41525b6-e9c8-481c-a3ff-352c31972999',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=b41525b6-e9c8-481c-a3ff-352c31972999\"}'),('b4187507-6c76-4f60-a155-6f8eac0246cd',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:48:53','page/index/index?id=64&groupid=1547802655940&shareid=b4187507-6c76-4f60-a155-6f8eac0246cd',0,NULL,'{\"id\":\"64\",\"groupid\":\"&groupid=1547802655940\",\"url\":\"page/index/index?id=64&groupid=1547802655940&shareid=b4187507-6c76-4f60-a155-6f8eac0246cd\"}'),('b4d96a9d-9534-4b74-8461-70909dcd160a',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 19:02:27','pages/index/index?id=67&groupid=1547809333944&shareid=b4d96a9d-9534-4b74-8461-70909dcd160a',0,NULL,'{\"id\":\"67\",\"groupid\":\"&groupid=1547809333944\",\"url\":\"pages/index/index?id=67&groupid=1547809333944&shareid=b4d96a9d-9534-4b74-8461-70909dcd160a\"}'),('b56b25e1-b6c0-4c54-885b-1e6e72c077a5',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 12:03:46','pages/index/index?id=76&groupid=1547956933888&shareid=b56b25e1-b6c0-4c54-885b-1e6e72c077a5',0,NULL,'{\"id\":\"76\",\"groupid\":\"&groupid=1547956933888\",\"url\":\"pages/index/index?id=76&groupid=1547956933888&shareid=b56b25e1-b6c0-4c54-885b-1e6e72c077a5\"}'),('c07029ec-2248-43af-81af-8e6413515940',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:50:54','page/index/index?id=&groupid=1547799891481&shareid=c07029ec-2248-43af-81af-8e6413515940',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=c07029ec-2248-43af-81af-8e6413515940\"}'),('c2af189e-65d9-4412-b5fe-51a458d3fd40',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-17 22:46:28','pages/index/index?id=58&shareid=c2af189e-65d9-4412-b5fe-51a458d3fd40',0,NULL,'{\"url\":\"pages/index/index?id=58&shareid=c2af189e-65d9-4412-b5fe-51a458d3fd40\"}'),('c9351c8b-9412-4520-a04c-67e644244bae',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 18:57:22','pages/index/index?id=67&groupid=1547809039953&shareid=c9351c8b-9412-4520-a04c-67e644244bae',0,NULL,'{\"id\":\"67\",\"groupid\":\"&groupid=1547809039953\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=c9351c8b-9412-4520-a04c-67e644244bae\"}'),('c96b53a9-4f80-4b61-b9a2-0b5df2e4d6ad',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-20 10:42:38','pages/index/index?id=68&groupid=1547809687411&shareid=c96b53a9-4f80-4b61-b9a2-0b5df2e4d6ad',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547809687411\",\"url\":\"pages/index/index?id=68&groupid=1547809687411&shareid=c96b53a9-4f80-4b61-b9a2-0b5df2e4d6ad\"}'),('cd49022f-4e02-469a-a555-ae2a9c48415f',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-18 19:00:25','pages/index/index?id=67&groupid=1547809039953&shareid=cd49022f-4e02-469a-a555-ae2a9c48415f',0,NULL,'{\"groupid\":\"&groupid=1547809039953\",\"id\":\"67\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=cd49022f-4e02-469a-a555-ae2a9c48415f\"}'),('d4fbd738-f20f-4552-afbe-560e1f7b145e',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 10:56:12','pages/index/index?id=68&groupid=1547809687411&shareid=d4fbd738-f20f-4552-afbe-560e1f7b145e',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547809687411\",\"url\":\"pages/index/index?id=68&groupid=1547809687411&shareid=d4fbd738-f20f-4552-afbe-560e1f7b145e\"}'),('d6439fa1-c5ea-46c0-ba94-5241c2b6807c',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-18 19:00:32','pages/index/index?id=67&groupid=1547809039953&shareid=d6439fa1-c5ea-46c0-ba94-5241c2b6807c',0,NULL,'{\"groupid\":\"&groupid=1547809039953\",\"id\":\"67\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=d6439fa1-c5ea-46c0-ba94-5241c2b6807c\"}'),('e2ceb04b-af42-495a-8bcc-4e43fe8c41ca',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:25:18','pages/index/index?id=57&shareid=e2ceb04b-af42-495a-8bcc-4e43fe8c41ca',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"pages/index/index?id=57&shareid=e2ceb04b-af42-495a-8bcc-4e43fe8c41ca\"}'),('e96d362d-08d1-48d8-a47e-3a5b1769592a',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:19:18','pages/index/index?id=57&shareid=e96d362d-08d1-48d8-a47e-3a5b1769592a',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=undefined\",\"url\":\"pages/index/index?id=57&shareid=e96d362d-08d1-48d8-a47e-3a5b1769592a\"}'),('edf50c96-4345-4dd8-b252-b46aa3bb6f27',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 10:58:00','pages/index/index?id=68&groupid=1547809687411&shareid=edf50c96-4345-4dd8-b252-b46aa3bb6f27',0,NULL,'{\"id\":\"68\",\"groupid\":\"&groupid=1547809687411\",\"url\":\"pages/index/index?id=68&groupid=1547809687411&shareid=edf50c96-4345-4dd8-b252-b46aa3bb6f27\"}'),('ef425187-4525-407c-9775-a6abddc58fcb',NULL,'osDAK400eifBzPPrT1yTsDwIrTAY','2019-01-18 16:52:59','page/index/index?id=&groupid=1547801515915&shareid=ef425187-4525-407c-9775-a6abddc58fcb',0,NULL,'{\"groupid\":\"&groupid=1547801515915\",\"url\":\"page/index/index?id=&groupid=1547801515915&shareid=ef425187-4525-407c-9775-a6abddc58fcb\"}'),('f18ea7b7-35de-4bff-b713-c5f0a2d68938',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:29:48','page/index/index?id=57&groupid=1547741964426&shareid=f18ea7b7-35de-4bff-b713-c5f0a2d68938',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"page/index/index?id=57&groupid=1547741964426&shareid=f18ea7b7-35de-4bff-b713-c5f0a2d68938\"}'),('f7528f0b-e238-46fe-9eb3-042cd4c7e5a0',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 10:17:07','page/index/index?id=&groupid=1547722082645&shareid=f7528f0b-e238-46fe-9eb3-042cd4c7e5a0',0,NULL,'{\"groupid\":\"&groupid=1547722082645\",\"url\":\"page/index/index?id=&groupid=1547722082645&shareid=f7528f0b-e238-46fe-9eb3-042cd4c7e5a0\"}'),('f7c992ef-0503-40f1-a86b-0d6674589342',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 19:03:26','pages/index/index?id=67&groupid=1547809039953&shareid=f7c992ef-0503-40f1-a86b-0d6674589342',0,NULL,'{\"id\":\"67\",\"groupid\":\"&groupid=1547809039953\",\"url\":\"pages/index/index?id=67&groupid=1547809039953&shareid=f7c992ef-0503-40f1-a86b-0d6674589342\"}'),('fc122ceb-79f4-44ab-8e07-625b848f9e37',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:19:38','pages/index/index?id=57&shareid=fc122ceb-79f4-44ab-8e07-625b848f9e37',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"pages/index/index?id=57&shareid=fc122ceb-79f4-44ab-8e07-625b848f9e37\"}'),('fcd88ce4-f825-47b2-a905-61b8621b9794',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-17 22:46:59','pages/index/index?id=58&shareid=fcd88ce4-f825-47b2-a905-61b8621b9794',0,NULL,'{\"url\":\"pages/index/index?id=58&shareid=fcd88ce4-f825-47b2-a905-61b8621b9794\"}'),('fd6ad3e5-80ec-46c1-a0d3-abcf1e12c20c',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec','2019-01-18 00:30:07','page/index/index?id=57&groupid=1547741964426&shareid=fd6ad3e5-80ec-46c1-a0d3-abcf1e12c20c',0,NULL,'{\"id\":\"57\",\"groupid\":\"&groupid=1547741964426\",\"url\":\"page/index/index?id=57&groupid=1547741964426&shareid=fd6ad3e5-80ec-46c1-a0d3-abcf1e12c20c\"}'),('fe300ddf-f392-4d75-b853-4e55745360c0',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-18 16:54:04','page/index/index?id=&groupid=1547799891481&shareid=fe300ddf-f392-4d75-b853-4e55745360c0',0,NULL,'{\"groupid\":\"&groupid=1547799891481\",\"url\":\"page/index/index?id=&groupid=1547799891481&shareid=fe300ddf-f392-4d75-b853-4e55745360c0\"}'),('ff948bb6-b980-412a-8399-cc568fc922f5',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-20 14:04:49','pages/index/index?id=75&groupid=1547955765282&shareid=ff948bb6-b980-412a-8399-cc568fc922f5',0,NULL,'{\"id\":\"75\",\"groupid\":\"&groupid=1547955765282\",\"url\":\"pages/index/index?id=75&groupid=1547955765282&shareid=ff948bb6-b980-412a-8399-cc568fc922f5\"}');
/*!40000 ALTER TABLE `pf_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_share_config`
--

DROP TABLE IF EXISTS `pf_share_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_share_config` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `share_name` varchar(50) DEFAULT NULL COMMENT '分享主题',
  `share_route` varchar(128) NOT NULL COMMENT '分享页面路由',
  `share_image` varchar(255) DEFAULT NULL COMMENT '分享图片',
  `share_title` varchar(128) NOT NULL COMMENT '分享标题',
  `share_disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '明确规定该route不能进行分享',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分享出去的链接地址',
  PRIMARY KEY (`share_id`),
  UNIQUE KEY `routeIndex` (`share_route`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_share_config`
--

LOCK TABLES `pf_share_config` WRITE;
/*!40000 ALTER TABLE `pf_share_config` DISABLE KEYS */;
INSERT INTO `pf_share_config` VALUES (2,'红包活动','pages/index/index',NULL,'红包活动',0,'pages/index/index?id={id}&groupid={groupid}');
/*!40000 ALTER TABLE `pf_share_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pf_withdraw`
--

DROP TABLE IF EXISTS `pf_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pf_withdraw` (
  `draw_id` char(36) NOT NULL COMMENT '提现记录id',
  `open_id` varchar(36) NOT NULL COMMENT '提现的用户的openid',
  `order_no` varchar(20) NOT NULL COMMENT '订单编号',
  `user_id` char(36) NOT NULL COMMENT '用户ID（主键）',
  `draw_date` datetime NOT NULL COMMENT '提现日期',
  `draw_money` decimal(8,2) NOT NULL COMMENT '提现金额',
  `transfer_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '转账状态\n            0:提交申请，等待转账\n            1：转账完毕，提现成功\n            100：转账失败，退回余额',
  `transfer_date` datetime DEFAULT NULL COMMENT '转账日期',
  `ext_field1` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  `ext_field2` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`draw_id`),
  UNIQUE KEY `orderIndex` (`order_no`),
  KEY `userIndex` (`user_id`),
  KEY `dateIndex` (`draw_date`),
  CONSTRAINT `fk_draw_ref_user` FOREIGN KEY (`user_id`) REFERENCES `crm_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_withdraw`
--

LOCK TABLES `pf_withdraw` WRITE;
/*!40000 ALTER TABLE `pf_withdraw` DISABLE KEYS */;
INSERT INTO `pf_withdraw` VALUES ('0da17cda-1d4a-11e9-8b8a-6c92bf48246b','osDAK42fDN8gBMR8Qjd05eJeq9mQ','W1548053950','osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 14:59:10',1.00,100,'2019-01-21 14:59:10','PARAM_ERROR',NULL),('1117cda7-1d4a-11e9-8b8a-6c92bf48246b','osDAK42fDN8gBMR8Qjd05eJeq9mQ','W1548053956','osDAK42fDN8gBMR8Qjd05eJeq9mQ','2019-01-21 14:59:16',1.10,100,'2019-01-21 14:59:16','PARAM_ERROR',NULL);
/*!40000 ALTER TABLE `pf_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_income`
--

DROP TABLE IF EXISTS `vw_income`;
/*!50001 DROP VIEW IF EXISTS `vw_income`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_income` AS SELECT 
 1 AS `id`,
 1 AS `topic`,
 1 AS `userid`,
 1 AS `username`,
 1 AS `userlogo`,
 1 AS `orderid`,
 1 AS `createdate`,
 1 AS `paytype`,
 1 AS `paydate`,
 1 AS `service`,
 1 AS `ordertotal`,
 1 AS `type`,
 1 AS `amount`,
 1 AS `total`,
 1 AS `operator`,
 1 AS `gotamount`*/;
SET character_set_client = @saved_cs_client;

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
 1 AS `logo`,
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
 1 AS `share`,
 1 AS `clear`*/;
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
 1 AS `city`,
 1 AS `balance`,
 1 AS `createdate`,
 1 AS `logintimes`,
 1 AS `totalred`,
 1 AS `redprovider`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_withdraw`
--

DROP TABLE IF EXISTS `vw_withdraw`;
/*!50001 DROP VIEW IF EXISTS `vw_withdraw`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_withdraw` AS SELECT 
 1 AS `id`,
 1 AS `openid`,
 1 AS `orderno`,
 1 AS `uid`,
 1 AS `username`,
 1 AS `ulogo`,
 1 AS `date`,
 1 AS `money`,
 1 AS `status`,
 1 AS `tdate`*/;
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
endDay	 datetime
) RETURNS int(11)
BEGIN
	#set startDay = ifnull(startDay,DATE_sub(whichDay,INTERVAL 1 DAY));
    #set endDay = ifnull(endDay,DATE_ADD(whichDay,INTERVAL 1 DAY));
    #如果开始时间和结束时间都为空，则活动正常
    if startDay is null and endDay is null then return 0; end if;
    
    #如果开始时间为空
    if startDay is null  then
		#但结束时间早于whichDay,则表示已经结束,返回 -2
		if TIMESTAMPDIFF(SECOND,endDay,whichDay) > 0 then return -2; end if;
        return 0;
	else
		#判断是否到达开始时间
		if TIMESTAMPDIFF(SECOND,startDay,whichDay) >= 0 then 
			if endDay is null then return 0; end if;
			#开始时间满足，如果结束时间也满足，则有效
            if TIMESTAMPDIFF(SECOND,whichDay,endDay) > 0 then 
				return 0; 
			end if;
            #活动已经结束
            return -2;
        end if;
        #活动尚未开始
        return -1;
    end if;
    return 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fun_getappsetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fun_getappsetting`(
#获取某个应用的某项设置
appid varchar(20),
keyparam varchar(20),
defaultValue varchar(20)
) RETURNS varchar(50) CHARSET utf8mb4
BEGIN
	declare param varchar(512);
    declare retValue varchar(50);
	
    select setting_json
    into param
    from fw_setting
    where app_id = appid limit 1;
    
    if param is null then 
		RETURN defaultValue;
	end if;
	
    set keyparam = concat('$.',keyparam);
    select replace(json_extract(param,keyparam),'"','')
	into retValue;
    return ifnull(retValue,defaultValue);
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_app_dataanalysis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_app_dataanalysis`(
	#数据分析
)
BEGIN

	/****统计用户数据******/

	select 
    count(1) 					as usercount,		 	#平台总用户量
    count(if(isnew=0,true,null)) 	as todayuser  		#今日新增用户
   
    from vw_users ;
    
    /****最佳红包主和最佳抢手*****/
    (select 
		0 						as `type`,
		user_id 				as id,
        user_name 				as username,
        user_logo				as userlogo,
		user_total_provider 	as total
	from crm_user
    where user_total_provider>0 
    order by user_total_provider desc limit 1)
    
    union all
	(select 
		1 						as `type`,
		user_id 				as id,
        user_name 				as username,
        user_logo				as userlogo,
		user_total_balance		as total
	from crm_user
    where user_total_balance>0 order by user_total_balance desc limit 1)
    ;
    
	/****红包的统计****/
    
    select
		 count(1) 			as red_activity,
         sum(red_amount) 	as red_amount,
         sum(red_total) 	as red_total
	from bus_redbag
    where red_status>0;
    
    /****红包分配统计****/
    select
		 count(1) 			as red_gotcount,
         sum(seq_price) 	as red_gotamount
	from bus_redbag_alloc;

	/****红包抢夺******/
    
    /****最近10天的红包发放及抢夺数据 *****/
    select 
		`date`,
        ifnull(redamount,0) as redamount,
        ifnull(redalloc,0) as redalloc,
        ifnull(joincount,0) as joincount
    from fw_date
    left join
    (
		select
			date(got_date) as gotdate,
			sum(seq_price) as redalloc
		from 
        bus_redbag_alloc
        group by date(got_date)
    ) a on fw_date.`date` = a.gotdate
    left join
    (
		select
			date(red_opendate) as opendate,
			sum(red_amount) as redamount
		from 
        bus_redbag where red_status>0
        group by date(red_opendate)
    ) b on fw_date.`date` = b.opendate
    left join(
		select date(rec_create_date) as joindate,
        count(1) as joincount
        from 
        crm_user 
        group by date(rec_create_date)
    ) u on fw_date.`date` = u.joindate
    where timestampdiff(day,`date`,now())<=10 and timestampdiff(day,`date`,now())>=0
    order by `date`;

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
            1：红包提现
            
            51~100：全部属于收入类型
            51： 获取红包
			52:  提现失败退回

*/
redid	char(36),		#红包活动id或相关字段id
money	decimal(8,2)	#流水金额
)
BEGIN
	#增加钱包流水记录
	insert into crm_user_balance(
		user_id,
        rec_date,
        io_type,
        bus_type,
        data_id,
        rec_total)
	values(
		userid,
        now(),
        iotype,
        bustype,
        redid,
        money);
    #修改用户的钱包余额
    update crm_user set user_balance = ifnull(user_balance,0)+if(iotype=0,-1,1)*money,
						user_total_balance = ifnull(user_total_balance,0)+if(iotype=0,0,1)*money  #累计红包
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
    userlogo varchar(255),
    gender	tinyint,
    city	varchar(64)
)
BEGIN
  #Routine body goes here...
	update crm_user set 
		user_name 	= username,
		user_logo	= userlogo,
        user_sex 	= ifnull(gender,1),
        user_city	= city,
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
		bg_id 		as id,
        bg_title	as title,
        bg_file		as `file`,
        bg_layout	as layout
	from bas_red_background
    where 
		bg_enabled=1
	order by bg_index desc;
	#背景音乐类的
	select 
		bg_id 		as id,
        bg_title	as title,
        bg_file		as `file`
	from bas_red_music
    where 
		bg_enabled=1
	order by music_index desc;
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
logo		varchar(128),		#红包的LOGO
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
follow		tinyint,			#是否强制关注公众号才能领红包
appid		varchar(20),		#关注公众号appid
appname		varchar(64),		#公众号的名称
public		tinyint,			#活动是否公开在广场
allowshare	tinyint,			#活动是否支持分享
shareimage 	varchar(128)		#活动的分享图片
)
BEGIN
	declare redid int default 0;
    declare orderid char(36) default uuid();
    declare txno varchar(20) default concat('B-',unix_timestamp(now()));
    declare servicerate decimal(5,2) default cast(fun_getappsetting('wxef31174b9f28d7d3','servicerate','1') as decimal(5,2));
    #发红包的服务费用
    declare servicetotal decimal(8,2);
    set servicetotal = (amount * servicerate)/ 100;
	insert into bus_redbag (
		red_topic,
        red_logo,
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
        force_follow_app,
        app_id,
        app_name,
        red_ispublic,
        red_share,
        red_shareimage
        )
	values(
		topic ,
        logo,
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
        follow,
        appid,
        appname,
		public,
        allowshare,
        shareimage
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
		bus_redbag.red_id	as id,
        red_topic	as topic,
        red_bgp		as redcover,
        red_amount	as amount,
		red_total	as total,
        red_qr		as qrimage,
        red_status	as `status`,
        fun_dayindays(now(),red_start,red_end) as startstatus,
        red_ispublic	as ispublic,
        ifnull(gotmoney,0) as gotmoney,
        ifnull(gotcount,0) as gotcount,
        
        date_format(red_create_date,'%Y.%m.%d %H:%i') as createdate
    from bus_redbag 
    left join(
		select 
			red_id,
			sum(seq_price) as gotmoney,
            count(1) as gotcount
		from bus_redbag_alloc 
        group by red_id
    )alloc on bus_redbag.red_id = alloc.red_id
	where user_id = userid
	ORDER BY red_create_date DESC 
    LIMIT startpage,pagerows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_getorderinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_getorderinfo`(
#获取红包的支付订单信息
redid	int				#红包活动id
)
BEGIN
	select 
		order_id		as orderid,
        order_date		as orderdate,
        order_tx_no		as txno,
        order_paytype	as paytype,
        red_id			as redid,
        red_amount		as amount,
        service_total	as service,
        order_total		as ordertotal,
        order_status	as `status`,
        pay_date		as paydate,
        order_updator	as updator,
        cu.user_name	as updatorname,
        order_update_date	as updatedate,
        order_image		as image,
        order_memo		as memo
	from bus_redbag_order o
		
	left join crm_user cu on o.order_updator = cu.user_id
    where red_id = redid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_grabbyuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_grabbyuser`(
#获取用户抢到的红包记录
userid		char(36),
startpage 	int,
pagerows 	int
)
BEGIN
	set startpage=(startpage-1)*pagerows;
    
    select 
		ba.red_id 		as id,
        ba.seq_price	as money,
        date_format(ba.got_date,'%Y.%m%d %H:%i') as `date`,
        br.red_logo		as logo,
        br.red_topic	as topic
    from bus_redbag_alloc ba
    inner join bus_redbag br on ba.red_id = br.red_id
    
	where ba.user_id = userid
	ORDER BY got_date DESC 
    LIMIT startpage,pagerows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_offlinepay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_offlinepay`(
#后台进行确认支付红包
redid	int,in				#红包活动id
paydate datetime,			#红包支付日期
servicefee	decimal(8,2),	#红包的手续费
payimage varchar(255),		#支付截图凭据
qrcode	varchar(255),		#红包的二维码
checker	char(36),			#执行线下支付的用户
memo	varchar(128)		#支付备注
)
BEGIN
	declare orderid char(36);	#对应的订单id
    declare userid	char(36);	#红包发放的用户id
    declare amount 	decimal(8,2);	#用户发放的红包金额
    select 
		order_id,r.user_id,o.red_amount
        into orderid,userid,amount
	from 
		bus_redbag_order o
	inner join bus_redbag r on r.red_id = o.red_id
	where o.red_id = redid and order_status=0;
    
    if orderid is not null then
		#更新红包的二维码
        update bus_redbag
			set red_qr = qrcode,
				red_status  = 1,
                red_opendate = paydate
		where red_id=redid;
		#更新一下微信支付的订单
		update bus_redbag_order
			set order_paytype = 1,		#线下支付方式
				service_total = servicefee,
                order_status  = 1,
                order_total   = red_amount+servicefee,
                pay_date	  = paydate,
                order_updator = checker,
                order_image	  = payimage,
                order_update_date	=	now(),
                order_memo	  = memo
		where order_id=orderid;
        
        #累计用户发放红包的总量
        update crm_user set user_total_provider = ifnull(user_total_provider,0) +amount where user_id=userid;
        
    end if;
     select if(orderid is null,1,0) as result,
			redid,
            orderid,
            red_amount as amount,
            red_total as total,
            red_alloc as alloctype
	from bus_redbag where red_id= redid;
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
    declare userid		char(36);		#红包的分配方式
    select 
		order_id,o.red_id,r.red_amount,r.red_total,r.red_alloc,r.user_id
		into orderid,redid,redamount,redtotal,alloctype,userid
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
                red_qr	   = qrcode,
                red_opendate = now()
		where red_id=redid;        
        
        #修改用户的发放金额
        update crm_user set user_total_provider = 
			ifnull(user_total_provider,0)+redamount where user_id=userid;
        
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

)
BEGIN

    select 
		br.red_id		as id,
        red_topic	as topic,
        red_bless	as bless,
        red_logo	as logo,
        red_type	as `type`,
        red_alloc	as alloc,
        red_bgp		as image,
        red_amount	as amount,
		red_total	as total,
        ifnull(gotamount,0) as gotamount,
        ifnull(gotcount,0) as gotcount,
        fun_dayindays(now(),red_start,red_end) as startstatus,
        TIMESTAMPDIFF(SECOND,now(),red_start) as startsecond,
        TIMESTAMPDIFF(SECOND,now(),red_end) as endsecond
    from bus_redbag br
    left join 
    (
		select 
        red_id,
        sum(seq_price) as gotamount,
        count(1) as gotcount
        from 
        bus_redbag_alloc bra
        group by red_id
	) alloc on br.red_id = alloc.red_id
    where 
		red_status = 1 and red_cleared=0
	ORDER BY br.red_id DESC ;
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
logo		varchar(128),		#红包的logo
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
follow		tinyint,			#是否需要强制关注公众号
appid		varchar(20),		#公众号appid
appname		varchar(64),		#公众号的名称
public		tinyint,			#活动是否公开在广场
allowshare	tinyint,			#是否允许分享
shareimage	varchar(128)		#活动分享图
)
BEGIN
	declare redid int default 0;
    declare orderid char(36) default uuid();
    declare txno varchar(20) default concat('B-',unix_timestamp(now()));
	declare servicerate decimal(5,2) default cast(fun_getappsetting('wxef31174b9f28d7d3','servicerate','1') as decimal(5,2));
    #发红包的服务费用
    declare servicetotal decimal(8,2);
    set servicetotal = (amount * servicerate)/ 1000;
	update bus_redbag 
		set 
		red_topic 	= topic,
        red_logo	= logo,
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
        force_follow_app	= follow,
        app_id		= appid,
        app_name	= appname,
        red_ispublic= public,
        red_share	= allowshare,
        red_shareimage = shareimage
	where red_id = id;
    
    #同时修改红包的支付订单（已经支付过的订单不能再修改）
    update bus_redbag_order 
		set 
			red_amount 		= amount,
            order_tx_no		= txno,
            service_total 	= servicetotal,
            order_total		= amount+servicetotal
	where red_id = id and order_status=0;
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_system_getsharesetting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_system_getsharesetting`(
	#根据路由获取分享的设置
	route varchar(255)
)
BEGIN
	select 1 as type, share_image,share_disabled,share_url,share_title from pf_share_config 
	where 
		share_route=route
	union
    #如果没有配置路由，则使用应用下是否具备通配符的路由配置
	select 0 as type,share_image,share_disabled,share_url,share_title from pf_share_config 
	where 
			share_route='*'
    order by type desc
    limit 1;
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_user_getbalance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_user_getbalance`(
#获取用户抢到的红包记录
userid		char(36)
)
BEGIN
    select 
		ifnull(user_balance,0) as balance
    from crm_user 
    where user_id = userid
    limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_user_getprofiledata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_user_getprofiledata`(
	#获取我的数据
	userid char(36)
)
BEGIN
	#个人基本信息（头像、名称、会员级别）
    select 
		 user_name	as name
		,user_logo	as logo
        ,ifnull(user_balance,0)	as balance   #用户的钱包余额
	from 
		crm_user
	where user_id=userid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_user_getredbagtotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_user_getredbagtotal`(
#获取用户红包的汇总
userid	char(36),
datatype tinyint)
BEGIN
	if datatype= 0 then   #发红包的汇总
		select 
			ifnull(sum(seq_price),0) as totalmoney,
            ifnull(count(1),0) as totalcount
		from bus_redbag_alloc
        where red_id in (select red_id from bus_redbag where user_id = userid);
    else				  #领红包的汇总
		select 
			ifnull(sum(seq_price),0) as totalmoney,
            ifnull(count(1),0) as totalcount
		from bus_redbag_alloc where user_id=userid;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_wallet_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_wallet_list`(
	#用户钱包的流水记录
    userid char(36),
     startpage int,
    pagerows int
)
BEGIN
	set startpage=(startpage-1)*pagerows;
	select 
			io_type	as 'io',
			 case bus_type 
				when 1 then '提现' 
				when 51 then '领取红包'
				when 52 then '提现失败退回'
			end as typename,
			date_format(rec_date,'%Y年%m月%d日 %h:%i') as `date`,
            rec_total as money
	from crm_user_balance
    where user_id=userid
    ORDER BY rec_date DESC LIMIT startpage,pagerows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_wallet_widthdrawover` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_wallet_widthdrawover`(
	#更新收益的转账记录状态
    orderno varchar(20),
    successed tinyint,
    errorcode varchar(32)
)
BEGIN
	declare userid char(36);
    declare appmoney decimal(8,2);
    declare orderid char(36);
    #防止重复调用
    if exists(select 1 from pf_withdraw where order_no=orderno and  transfer_state=0) then
    
		if successed=1 then	  #提现转账成功
			#修改记录
			update pf_withdraw 
				set transfer_state=1,
					transfer_date=now() 
			where order_no=orderno;

		else     # 提现转账失败

			#修改记录
			update pf_withdraw 
				set transfer_state=100,
					transfer_date=now(),
					ext_field1=errorcode
			where order_no=orderno;
			#失败需要将申请的金额转入用户的收益余额
			select draw_id,user_id,draw_money into orderid,userid,appmoney
			from pf_withdraw where order_no=orderno;
            
			call proc_balance_record(userid,1,52,orderid,appmoney);
		end if;

	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_wallet_withdraw` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_wallet_withdraw`(
	#红包提现
	userid char(36),    #申请的用户
	money decimal(8,2),  #提现的金额
	openid varchar(36)  #申请用户的openid
)
BEGIN

	declare result int default 99;
	declare orderno varchar(20);
    declare msg varchar(64) default '余额不足';

    declare orderid char(36) default uuid();

    

    DECLARE t_error INTEGER DEFAULT 0;  

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET t_error=1;

    #判定用户的余额是否足够提现金额

    if exists(select 1 from crm_user where ifnull(user_balance,0)>=money and user_id=userid) then

		set orderno = concat('W',unix_timestamp(now())); #生成提现的订单号 #fun_generate_orderno(-1);  

        START TRANSACTION;  #启动事务保护

        #插入提现记录申请
		

        insert into pf_withdraw(draw_id,order_no,user_id,draw_date,draw_money,open_id)

        values(orderid,orderno,userid,now(),money,openid);

        IF t_error = 0 THEN 
			#记录余额流水
			#扣减用户的余额
            call proc_balance_record(userid,0,1,orderid,money);
		end if;
        set result=t_error;
        #提交事务
        IF t_error = 1 THEN
			set msg = '提现失败,数据库错误';
			ROLLBACK;  
		ELSE  
			set msg = null;
			COMMIT;  
		END IF;
    end if;

    select result,orderno,orderid,msg;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_income`
--

/*!50001 DROP VIEW IF EXISTS `vw_income`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_income` AS select `rb`.`red_id` AS `id`,`rb`.`red_topic` AS `topic`,`cu`.`user_id` AS `userid`,`cu`.`user_name` AS `username`,`cu`.`user_logo` AS `userlogo`,`ro`.`order_id` AS `orderid`,`rb`.`red_create_date` AS `createdate`,`ro`.`order_paytype` AS `paytype`,`ro`.`pay_date` AS `paydate`,`ro`.`service_total` AS `service`,`ro`.`order_total` AS `ordertotal`,`rb`.`red_type` AS `type`,`rb`.`red_amount` AS `amount`,`rb`.`red_total` AS `total`,`fu`.`user_name` AS `operator`,ifnull(`alloc`.`gotamount`,0) AS `gotamount` from ((((`redbag`.`bus_redbag` `rb` join `redbag`.`crm_user` `cu` on((`rb`.`user_id` = `cu`.`user_id`))) join `redbag`.`bus_redbag_order` `ro` on((`ro`.`red_id` = `rb`.`red_id`))) left join (select `redbag`.`bus_redbag_alloc`.`red_id` AS `red_id`,count(1) AS `gottotal`,sum(`redbag`.`bus_redbag_alloc`.`seq_price`) AS `gotamount` from `redbag`.`bus_redbag_alloc` group by `redbag`.`bus_redbag_alloc`.`red_id`) `alloc` on((`rb`.`red_id` = `alloc`.`red_id`))) left join `redbag`.`fw_users` `fu` on((`ro`.`order_updator` = `fu`.`user_id`))) where (`ro`.`order_status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `vw_redbag` AS select `rb`.`red_id` AS `id`,`rb`.`red_topic` AS `topic`,`rb`.`red_logo` AS `logo`,`rb`.`red_bless` AS `bless`,`cu`.`user_id` AS `userid`,`cu`.`user_name` AS `username`,`cu`.`user_logo` AS `userlogo`,`ro`.`order_paytype` AS `paytype`,`ro`.`order_id` AS `orderid`,`rb`.`red_create_date` AS `createdate`,`rb`.`red_bgp` AS `bgimage`,`rb`.`red_bgm` AS `bgmusic`,`rb`.`red_type` AS `type`,`rb`.`red_group` AS `groupmin`,`rb`.`red_amount` AS `amount`,`rb`.`red_total` AS `total`,`alloc`.`gotamount` AS `gotamount`,ifnull(`alloc`.`gottotal`,0) AS `gottotal`,`rb`.`red_alloc` AS `alloc`,`rb`.`red_start` AS `startdate`,`rb`.`red_end` AS `enddate`,`rb`.`red_status` AS `status`,`rb`.`red_qr` AS `qrcode`,`rb`.`app_id` AS `appid`,`rb`.`app_name` AS `appname`,`rb`.`red_ispublic` AS `public`,`rb`.`red_share` AS `share`,`rb`.`red_cleared` AS `clear` from (((`redbag`.`bus_redbag` `rb` join `redbag`.`crm_user` `cu` on((`rb`.`user_id` = `cu`.`user_id`))) left join `redbag`.`bus_redbag_order` `ro` on((`ro`.`red_id` = `rb`.`red_id`))) left join (select `redbag`.`bus_redbag_alloc`.`red_id` AS `red_id`,count(1) AS `gottotal`,sum(`redbag`.`bus_redbag_alloc`.`seq_price`) AS `gotamount` from `redbag`.`bus_redbag_alloc` group by `redbag`.`bus_redbag_alloc`.`red_id`) `alloc` on((`rb`.`red_id` = `alloc`.`red_id`))) */;
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
/*!50001 VIEW `vw_users` AS select (to_days(curdate()) - to_days(`cu`.`rec_create_date`)) AS `isnew`,`cu`.`user_id` AS `id`,`cu`.`user_name` AS `name`,`cu`.`user_logo` AS `logo`,`cu`.`user_sex` AS `sex`,`cu`.`user_city` AS `city`,`cu`.`user_balance` AS `balance`,`cu`.`rec_create_date` AS `createdate`,`cu`.`login_times` AS `logintimes`,ifnull(`cu`.`user_total_balance`,0) AS `totalred`,ifnull(`cu`.`user_total_provider`,0) AS `redprovider` from `crm_user` `cu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_withdraw`
--

/*!50001 DROP VIEW IF EXISTS `vw_withdraw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_withdraw` AS select `d`.`draw_id` AS `id`,`d`.`open_id` AS `openid`,`d`.`order_no` AS `orderno`,`d`.`user_id` AS `uid`,`u`.`user_name` AS `username`,`u`.`user_logo` AS `ulogo`,date_format(`d`.`draw_date`,'%Y年%m月%d日 %H:%i') AS `date`,`d`.`draw_money` AS `money`,`d`.`transfer_state` AS `status`,date_format(`d`.`transfer_date`,'%Y年%m月%d日 %i:%h') AS `tdate` from (`pf_withdraw` `d` join `crm_user` `u` on((`d`.`user_id` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21 19:18:12
