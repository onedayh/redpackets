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

SET @@GLOBAL.GTID_PURGED='a82fc2ea-b4ca-11e8-9611-6c92bf48246b:1-193172';

--
-- Table structure for table `bas_app_diversion`
--

DROP TABLE IF EXISTS `bas_app_diversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_app_diversion` (
  `app_id` varchar(20) NOT NULL COMMENT '引流目标app',
  `red_id` int(11) NOT NULL COMMENT '引导跳转的活动',
  `user_id` char(36) NOT NULL COMMENT '用户id',
  `open_id` varchar(32) DEFAULT NULL COMMENT '对方公众号的用户openid',
  `gotime` datetime NOT NULL COMMENT '跳转的时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_app_diversion`
--

LOCK TABLES `bas_app_diversion` WRITE;
/*!40000 ALTER TABLE `bas_app_diversion` DISABLE KEYS */;
INSERT INTO `bas_app_diversion` VALUES ('wx397e43d8e81d7ed3',245,'oyDfX5eYyLCts6wAStZu4NabD3TM',NULL,'2019-01-28 20:30:33'),('wx397e43d8e81d7ed3',248,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',NULL,'2019-01-28 21:12:08'),('wx397e43d8e81d7ed3',248,'oyDfX5eYyLCts6wAStZu4NabD3TM',NULL,'2019-01-28 21:13:16'),('wx397e43d8e81d7ed3',248,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',NULL,'2019-01-28 21:17:41'),('wx397e43d8e81d7ed3',248,'oyDfX5eYyLCts6wAStZu4NabD3TM',NULL,'2019-01-28 21:40:50');
/*!40000 ALTER TABLE `bas_app_diversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bas_red_background`
--

DROP TABLE IF EXISTS `bas_red_background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_red_background` (
  `bg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '背景id',
  `bg_title` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '背景标题',
  `bg_file` varchar(255) DEFAULT NULL COMMENT '背景文件',
  `bg_share` varchar(128) DEFAULT NULL COMMENT '模板分享的图片',
  `bg_layout` varchar(1024) DEFAULT NULL COMMENT '背景的式样布局',
  `bg_poster` varchar(1024) DEFAULT NULL COMMENT '生成海报的定义',
  `bg_index` int(11) DEFAULT NULL COMMENT '排序位置',
  `bg_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可用状态',
  `bg_default` tinyint(2) NOT NULL DEFAULT '0' COMMENT '默认背景',
  PRIMARY KEY (`bg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_red_background`
--

LOCK TABLES `bas_red_background` WRITE;
/*!40000 ALTER TABLE `bas_red_background` DISABLE KEYS */;
INSERT INTO `bas_red_background` VALUES (9,'2019主题','redbag/background/image/7f10e94b-2333-42a6-b53e-c42be0382686.jpg','redbag/background/image/05568e08-f621-4590-bffe-21adc6be4966.jpg','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;margin-bottom: 50rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 30rpx;line-height: 44rpx;\",\"button\":\"width: 208rpx;height: 208rpx;position: absolute;left: 50%;transform: translateX(-104rpx);\",\"wrapT\":\"310\",\"btnT\":\"710\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":480,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":30,\"blessMax\":18,\"blessMt\":30},\"logo\":{\"width\":120,\"top\":310,\"align\":\"center\"},\"qr\":{\"width\":208,\"top\":710,\"align\":\"center\"}}',108,1,0),(10,'猪年吉祥','redbag/background/image/03059ca8-219d-4aaf-a92e-b11ab8c1102d.jpg','redbag/background/image/1a746dde-de6c-43d6-a362-5e7db9a4a1bb.jpg','{\"wrap\":\"padding-left: 128rpx;padding-right: 100rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;float: left\",\"topic\":\"color: #fff;font-size: 34rpx;padding-bottom: 20rpx;padding-left: 30rpx;float: left;width: 400rpx\",\"bless\":\"color: #FFA3A3;font-size: 24rpx;line-height: 40rpx; padding-left: 30rpx;float: left; width: 400rpx\",\"button\":\"width: 208rpx;height: 208rpx;position: absolute;left: 50%;transform: translateX(-104rpx);\",\"wrapT\":\"300\",\"btnT\":\"925\"}','{\"font\":{\"align\":\"left\",\"left\":296,\"topicMax\":10,\"topicTop\":300,\"topicSize\":34,\"topicColor\":\"#fff\",\"blessColor\":\"#FFA3A3\",\"blessSize\":24,\"blessMax\":14,\"blessMt\":30},\"logo\":{\"width\":120,\"top\":300,\"align\":\"left\",\"left\":128},\"qr\":{\"width\":208,\"top\":925,\"align\":\"center\"}}',109,1,0),(11,'新年快乐','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',110,1,0),(12,'回家过年','redbag/background/image/c3154345-eaa9-4973-97d4-0aa47719806b.jpg','redbag/background/image/f084edc9-dc31-44c0-b934-c52cd34dd762.jpg','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 140rpx;\",\"topic\":\"text-align: center;color: #E3544E;font-size: 36rpx;padding-bottom: 24rpx;\",\"bless\":\"text-align: center;color: #E3544E;font-size: 30rpx;line-height: 40rpx;\",\"button\":\"width: 148rpx;height: 148rpx;position: absolute;left: 50%;transform: translateX(-74rpx);\",\"wrapT\":\"332\",\"btnT\":\"854\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":572,\"topicSize\":36,\"topicColor\":\"#E3544E\",\"blessColor\":\"#E3544E\",\"blessSize\":30,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":336,\"align\":\"center\"},\"qr\":{\"width\":128,\"top\":864,\"align\":\"center\"}}',107,1,0),(13,'陪你过大年','redbag/background/image/aec58499-5371-4e28-80e2-492c6da1ae7f.jpg','redbag/background/image/c1e093e9-f38f-4cef-9674-e4407d7b9690.jpg','{\"wrap\":\"padding-left: 108rpx;padding-right: 100rpx;\",\"logo\":\"width: 96rpx;height: 96rpx;border-radius: 50%;float: left\",\"topic\":\"color: #EFC7A5;font-size: 36rpx;padding-bottom: 16rpx;padding-left: 30rpx;float: left;width: 420rpx\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx; padding-left: 30rpx;float: left; width: 420rpx\",\"button\":\"width: 172rpx;height: 172rpx;position: absolute;left: 50%;transform: translateX(-86rpx);\",\"wrapT\":\"700\",\"btnT\":\"876\"}','{\"font\":{\"align\":\"left\",\"left\":236,\"topicMax\":10,\"topicTop\":680,\"topicSize\":36,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":15,\"blessMt\":10},\"logo\":{\"width\":96,\"top\":680,\"align\":\"left\",\"left\":108},\"qr\":{\"width\":152,\"top\":886,\"align\":\"center\"}}',106,1,1),(14,'团圆饭','redbag/background/image/ed4624e8-68db-4bf2-8731-61afa7ef3728.jpg','redbag/background/image/2264941f-e067-4c0a-81cc-f1c07e12f76f.jpg','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 34rpx;\",\"topic\":\"color: #EFC7A5;font-size: 40rpx;padding-bottom: 24rpx;text-align: center;\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx;text-align: center;\",\"button\":\"width: 180rpx;height: 180rpx;position: absolute;left: 50%;transform: translateX(-90rpx);\",\"wrapT\":\"420\",\"btnT\":\"866\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":560,\"topicSize\":40,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":422,\"align\":\"center\"},\"qr\":{\"width\":160,\"top\":878,\"align\":\"center\"}}',105,1,0),(15,'诸事大顺','redbag/background/image/175d0e92-0cfd-4ec4-8783-bf2fea926492.jpg','redbag/background/image/f2abf608-0fb3-483d-936d-15f983322f59.jpg','{\"wrap\":\"padding-left: 108rpx;padding-right: 100rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;margin-bottom: 62rpx;\",\"topic\":\"color: #A74942;font-size: 36rpx;padding-bottom: 26rpx;width: 320rpx\",\"bless\":\"color: #D2807A;font-size: 24rpx;line-height: 40rpx;width: 320\",\"button\":\"width: 234rpx;height: 330rpx;position: absolute;left: 80rpx\",\"wrapT\":\"500\",\"btnT\":\"890\"}','{\"font\":{\"align\":\"left\",\"left\":110,\"topicMax\":10,\"topicTop\":680,\"topicSize\":36,\"topicColor\":\"#A74942\",\"blessColor\":\"#D2807A\",\"blessSize\":24,\"blessMax\":12,\"blessMt\":24},\"logo\":{\"width\":120,\"top\":500,\"align\":\"left\",\"left\":108},\"qr\":{\"width\":166,\"top\":966,\"align\":\"left\",\"left\":110}}',104,1,0);
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
  `music_default` tinyint(2) NOT NULL DEFAULT '0' COMMENT '默认背景音乐',
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_red_music`
--

LOCK TABLES `bas_red_music` WRITE;
/*!40000 ALTER TABLE `bas_red_music` DISABLE KEYS */;
INSERT INTO `bas_red_music` VALUES (29,'吃年饭了','redbag/background/music/0413bf21-2d0a-4a16-9d38-8db20181f2ec.mp3',NULL,1,0),(30,'春节嗨爆喜庆','redbag/background/music/87b4b5dd-8475-4068-bd44-9c4e5aca1766.mp3',NULL,1,0),(31,'过年啦','redbag/background/music/209ccb58-2945-4b00-b6fe-f356309568f5.mp3',NULL,1,1),(32,'贺新春','redbag/background/music/82bb3fb4-59d4-45a1-9f1e-b68f0b04221a.mp3',NULL,1,0),(33,'欢欢喜喜过大年','redbag/background/music/c9dbdcc1-9132-4e6a-8927-c0cc1ed023a5.mp3',NULL,1,0),(34,'吉祥如意','redbag/background/music/82acba0a-3548-45ab-9a3d-98ccfd081198.mp3',NULL,1,0),(35,'锣鼓喧天','redbag/background/music/231f130a-995f-47fb-91cb-53352a84f66d.mp3',NULL,1,0),(36,'美满幸福','redbag/background/music/84eb628b-16d9-4922-a6a5-0b348503715f.mp3',NULL,1,0),(37,'热闹喜庆年','redbag/background/music/03b27bd5-6097-4571-afea-3d56b4f61304.mp3',NULL,1,0),(38,'五福临门','redbag/background/music/a96a9483-6197-4bca-86df-0bfafb07a0ff.mp3',NULL,1,0),(39,'喜庆春节','redbag/background/music/56319d57-c078-49ed-87e1-2c76411ec09e.mp3',NULL,1,0),(40,'新年大吉','redbag/background/music/8f3cb020-f409-4ba0-a2d5-df4e26d7c707.mp3',NULL,1,0),(41,'元宵佳节','redbag/background/music/9ae9d0f3-9f66-4aaf-8008-1adf067995d5.mp3',NULL,1,0);
/*!40000 ALTER TABLE `bas_red_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bas_red_topic`
--

DROP TABLE IF EXISTS `bas_red_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_red_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文字id',
  `typeid` char(36) NOT NULL COMMENT '类型',
  `topic_title` varchar(32) DEFAULT NULL COMMENT '主题标题',
  `topic_content` varchar(128) DEFAULT NULL COMMENT '文字内容',
  `topic_default` varchar(255) DEFAULT '0' COMMENT '默认',
  `topic_index` int(11) DEFAULT NULL COMMENT '排序位置',
  `topic_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可用状态',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bas_red_topic`
--

LOCK TABLES `bas_red_topic` WRITE;
/*!40000 ALTER TABLE `bas_red_topic` DISABLE KEYS */;
INSERT INTO `bas_red_topic` VALUES (1,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'猪年大吉 恭喜发财 身体健康 阖家欢乐','0',5,1),(2,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'祝君新年快乐，幸福开心，年年有福，岁岁平安！','0',NULL,1),(3,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'大地回暖春节来，福星财神相对拜。新年快乐，恭喜发财！','0',NULL,1),(4,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'鸿运滚滚来，四季都发财。猪年好事多，幸福喜颜开。步步再高升，事事顺着来！','0',NULL,1),(6,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'春节来到祝福到，吃好喝好心情好；锻炼身体很重要，祝你春节快乐身体好！','0',NULL,1),(7,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'新的一年开启新的希望，新的空白承载新的梦想！','0',NULL,1),(8,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'带着开心贺新岁，愿你春花开富贵，生活幸福、家庭和睦；恭祝新年好！','0',NULL,1),(9,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'愿您新春欢乐，万事如意，阖家欢乐，百事顺心，吉星高照，幸福美满！','1',NULL,1),(10,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'春节来到，祝福敲门：恭喜发财，过年好！','0',NULL,1),(11,'d0b61681-260d-4b14-95cc-af161030c1f9',NULL,'愿一个问候带给你一个新的心情，愿一个祝福带给你一个新的起点！','0',NULL,1),(12,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'舞龙灯，踩高跷，合家欢乐步步高！人人开心齐欢笑，提前祝你春节好，猪年祝福我最早！','0',NULL,1),(13,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'新年新气象，喜事成双全。金猪叩门携好运，日子蜜蜜甜！','0',NULL,1),(14,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'春风初度到猪年，欢歌声声震云天。千家万户乐翩翩，迎福纳财笑开颜！','0',NULL,1),(15,'3c8abe08-9d31-422a-88e4-7d09accfe98d',NULL,'春节到处乐洋洋，祝福语先到身旁，心意情意都献上，愿您春节安康！','0',NULL,1);
/*!40000 ALTER TABLE `bas_red_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bas_wechat_publicinfo`
--

DROP TABLE IF EXISTS `bas_wechat_publicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bas_wechat_publicinfo` (
  `app_id` varchar(20) NOT NULL COMMENT '公众号/小程序id',
  `app_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '应用类型\n0:公众号\n1：小程序',
  `app_name` varchar(64) DEFAULT NULL COMMENT '公众号名称',
  `app_path` varchar(64) DEFAULT NULL COMMENT '跳转过去的页面url	',
  `app_param` varchar(255) DEFAULT NULL COMMENT '跳转过去传递的参数',
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
INSERT INTO `bas_wechat_publicinfo` VALUES ('wx1073a2ae2e60ce7e',0,'广州哆咪科技',NULL,NULL,'7b140d54791efb3d896512f9eca6ee74',NULL,NULL,NULL),('wx376d6fb043fbec43',0,'弯弓在道公众号',NULL,NULL,'ca26668d89a2df91688f6f86dd5d868f',NULL,NULL,NULL),('wx397e43d8e81d7ed3',1,'微商课程表','pages/home/home',NULL,'67a8fa704454a64de79d0120540a1d62','1512804351','WeiShangLitecoder20180905HCOURSE',NULL),('wx718e3695c5f79f4b',0,'轻码微信服务号',NULL,NULL,'9537ce94838f8d683bb8a6c4d3297bd3',NULL,NULL,NULL),('wxa72cca37afe01e58',0,'光学镜博士',NULL,NULL,'62a589f217cc633dd8574686e422a4c0',NULL,NULL,NULL),('wxef31174b9f28d7d3',1,'芝麻点友',NULL,NULL,'f320eb210bd1cab252f5e19eeec40c75','1523877891','DOomISoftJesSicaPpShenYingLiujIE','apiclient_cert.p12'),('wxfa7d7a155dcef5a2',1,'芝麻友',NULL,NULL,'b68edcc4f30d62d061bf8f66d20ce9e8','1512804351','WeiShangLitecoder20180905HCOURSE','apiclient_cert.p12');
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
  `red_topic` varchar(128) NOT NULL COMMENT '主题名称',
  `red_logo` varchar(128) DEFAULT NULL COMMENT '红包形象LOGO(默认用户的头像）',
  `red_bless` varchar(64) DEFAULT NULL COMMENT '祝福语',
  `user_id` char(36) NOT NULL COMMENT '创建用户',
  `red_create_date` datetime NOT NULL COMMENT '创建日期',
  `red_bgp` varchar(255) DEFAULT NULL COMMENT '背景图片',
  `red_bgm` varchar(255) DEFAULT NULL COMMENT '背景音频',
  `red_layout` varchar(1024) DEFAULT NULL COMMENT '布局样式',
  `red_poster` varchar(1024) DEFAULT NULL COMMENT '红包的海报生成定义',
  `red_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '红包玩法\n            0：直接拆\n            1：拼包拆',
  `red_group` tinyint(4) DEFAULT NULL COMMENT '拼包人数',
  `red_amount` decimal(11,2) NOT NULL COMMENT '红包总额',
  `red_total` int(11) NOT NULL COMMENT '红包个数',
  `red_actual_amount` decimal(11,2) DEFAULT NULL COMMENT '红包生成的时候实际发放的金额',
  `red_actual_total` int(11) DEFAULT NULL COMMENT '红包实际发放的数量',
  `red_alloc` tinyint(4) NOT NULL COMMENT '红包分配方式\n            0:随机分配\n            1:均分',
  `red_minimal` decimal(8,2) DEFAULT NULL COMMENT '每个红包的最小金额',
  `red_maximum` decimal(8,2) DEFAULT NULL COMMENT '每个红包的最大值',
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
  `red_rollback` tinyint(2) NOT NULL DEFAULT '0' COMMENT '红包被红包主撤回状态',
  `red_rollback_date` datetime DEFAULT NULL COMMENT '红包撤回时间',
  PRIMARY KEY (`red_id`),
  KEY `userIndex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag`
--

LOCK TABLES `bus_redbag` WRITE;
/*!40000 ALTER TABLE `bus_redbag` DISABLE KEYS */;
INSERT INTO `bus_redbag` VALUES (228,'广州哆咪科技给您拜年了','redbag/logo/de9c277e-f4e4-4133-9b0d-c1e87c6b0894.jpg','恭祝大家新年快乐 身体健康 猪年行大运 ???','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 12:20:16','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/67a3d6c7-8d6b-4596-bda5-484198188c23.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,50.00,20,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 12:20:24','redbag/qrcode/20190126/57e828e9-4499-4093-8669-f17a202af6da.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(229,'孔剑华给您拜年了','redbag/logo/fc83055a-14c5-48f0-ba2d-422eaf12a4af','大吉大利 猪年快乐','oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:12:57','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,10.00,10,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:13:04','redbag/qrcode/20190126/787d3628-0171-42a1-97f0-adbde2e6ce91.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(230,'ppliujie给您拜年了','redbag/logo/fc8898cf-a383-4091-b8be-6d7ef2ecf018','大吉大利 猪年快乐','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:15:09','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,10.00,5,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:15:18','redbag/qrcode/20190126/fb83b1db-a109-4c54-802b-d549690a29b0.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(231,'ppliujie给您拜年了','redbag/logo/d6cbdf0f-42f3-46cd-b636-48f5c13533f3','大吉大利 猪年快乐','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:21:06','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,10.00,8,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:21:15','redbag/qrcode/20190126/6147d782-cb47-4ee1-9111-a609e7f1f2d1.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(232,'200元现金大红包','redbag/logo/d09fc7e0-c4e5-4514-a3a1-46a2d00fae29','大吉大利 猪年快乐','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:24:33','redbag/background/image/a568fc40-8e00-45e3-ad12-6614288c9600.jpg','redbag/background/music/3db5b562-3f41-452e-8d7e-546942fcfb0b.mp3','{\"wrap\":\"padding-left: 108rpx;padding-right: 100rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;margin-bottom: 62rpx;\",\"topic\":\"color: #A74942;font-size: 36rpx;padding-bottom: 26rpx;width: 320rpx\",\"bless\":\"color: #D2807A;font-size: 24rpx;line-height: 40rpx;width: 320\",\"button\":\"width: 234rpx;height: 330rpx;position: absolute;left: 80rpx\",\"wrapT\":\"500\",\"btnT\":\"890\"}','{\"font\":{\"align\":\"left\",\"left\":110,\"topicMax\":10,\"topicTop\":680,\"topicSize\":36,\"topicColor\":\"#A74942\",\"blessColor\":\"#D2807A\",\"blessSize\":24,\"blessMax\":12,\"blessMt\":24},\"logo\":{\"width\":120,\"top\":500,\"align\":\"left\",\"left\":108},\"qr\":{\"width\":166,\"top\":966,\"align\":\"left\",\"left\":110}}',0,2,4.00,4,NULL,NULL,1,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:24:41','redbag/qrcode/20190126/3e3ccf75-247d-4e2d-a639-d2e03d8be916.png',0,NULL,NULL,1,1,'redbag/background/image/25817677-65ec-4326-9457-d019f75ee525.jpg',0,0,NULL),(233,'小聚粉丝团','redbag/logo/0527c99e-dd0a-4c58-b30c-185c04e00bc5','你猜有多少?','oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:29:09','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,1.00,5,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:29:28','redbag/qrcode/20190126/5fb622d1-fddb-4641-b46d-7b1761e4bc3d.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(234,'哆咪陪你过大年','redbag/logo/50cc5fd1-8096-40e9-bb71-3ac91fc3eb7b','万事顺利','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:29:23','redbag/background/image/c3154345-eaa9-4973-97d4-0aa47719806b.jpg','redbag/background/music/9f44d8ed-588f-46c6-87b1-04cb17ec345f.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 140rpx;\",\"topic\":\"text-align: center;color: #E3544E;font-size: 36rpx;padding-bottom: 24rpx;\",\"bless\":\"text-align: center;color: #E3544E;font-size: 30rpx;line-height: 40rpx;\",\"button\":\"width: 148rpx;height: 148rpx;position: absolute;left: 50%;transform: translateX(-74rpx);\",\"wrapT\":\"332\",\"btnT\":\"854\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":572,\"topicSize\":36,\"topicColor\":\"#E3544E\",\"blessColor\":\"#E3544E\",\"blessSize\":30,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":336,\"align\":\"center\"},\"qr\":{\"width\":128,\"top\":864,\"align\":\"center\"}}',0,2,10.00,8,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:29:31','redbag/qrcode/20190126/8242d00a-935b-46e3-8191-c3b0eebe59da.png',0,'','',1,1,'redbag/background/image/f084edc9-dc31-44c0-b934-c52cd34dd762.jpg',0,0,NULL),(235,'Kevin给您拜年了','redbag/logo/eac2f8b1-40dc-40a0-9683-89b3286c2aa1','大吉大利 猪年快乐','oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:34:58','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,10.00,6,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:35:06','redbag/qrcode/20190126/211a1ebd-e5c7-47d2-99e7-f5b2ad7d1c99.png',0,NULL,NULL,0,0,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(236,'L给您拜年了','redbag/logo/cce45c1c-dbcd-4303-a90b-1a620671bb72','大吉大利 猪年快乐','oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 13:43:41','redbag/background/image/f3ed059c-e305-4863-b320-7c3c2e0a6db4.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 34rpx;\",\"topic\":\"color: #EFC7A5;font-size: 40rpx;padding-bottom: 24rpx;text-align: center;\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx;text-align: center;\",\"button\":\"width: 180rpx;height: 180rpx;position: absolute;left: 50%;transform: translateX(-90rpx);\",\"wrapT\":\"420\",\"btnT\":\"866\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":560,\"topicSize\":40,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":422,\"align\":\"center\"},\"qr\":{\"width\":160,\"top\":878,\"align\":\"center\"}}',0,2,1.00,3,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:44:14','redbag/qrcode/20190126/2ff98dc0-e3bc-48fa-a6e0-faeebe140b72.png',0,NULL,NULL,1,1,'redbag/background/image/2264941f-e067-4c0a-81cc-f1c07e12f76f.jpg',0,0,NULL),(237,'领红包了哦！','redbag/logo/b55def81-846f-4fe6-83f9-58f46978765c','大吉大利 猪年快乐','oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:47:05','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,2.00,4,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:47:15','redbag/qrcode/20190126/c32fc5de-5775-4bef-9f0f-d1cc5257a0ac.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(238,'微商课程表','redbag/logo/aa36261a-657e-4bed-857d-7984cb5fc3e9.png','大吉大利 猪年快乐','oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:53:45','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',1,2,100.00,50,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 13:53:54','redbag/qrcode/20190126/92fd329e-806a-4ef1-8147-92f55b063839.png',0,NULL,NULL,1,1,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(239,'广州哆咪给您拜大年','redbag/logo/c5d7cc6f-6341-434b-9da8-85f324c8a0e7.jpg','祝王总新年快乐??','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 14:09:06','redbag/background/image/f3ed059c-e305-4863-b320-7c3c2e0a6db4.jpg','redbag/background/music/67a3d6c7-8d6b-4596-bda5-484198188c23.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 34rpx;\",\"topic\":\"color: #EFC7A5;font-size: 40rpx;padding-bottom: 24rpx;text-align: center;\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx;text-align: center;\",\"button\":\"width: 180rpx;height: 180rpx;position: absolute;left: 50%;transform: translateX(-90rpx);\",\"wrapT\":\"420\",\"btnT\":\"866\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":560,\"topicSize\":40,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":422,\"align\":\"center\"},\"qr\":{\"width\":160,\"top\":878,\"align\":\"center\"}}',0,2,1.00,5,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 14:09:15','redbag/qrcode/20190126/66f4a81e-db25-4ef1-b7f2-a297347a54b5.png',1,'wx1073a2ae2e60ce7e','广州哆咪科技',0,1,'redbag/background/image/2264941f-e067-4c0a-81cc-f1c07e12f76f.jpg',0,0,NULL),(240,'刘洁祝福大家','redbag/logo/f03cd124-ccd6-41b7-8b16-de0d1a1fe090','大吉大利 猪年快乐','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 14:20:47','redbag/background/image/aec58499-5371-4e28-80e2-492c6da1ae7f.jpg','redbag/background/music/03a588f3-8f45-4e0c-8d28-26151e8cc2ca.mp3','{\"wrap\":\"padding-left: 108rpx;padding-right: 100rpx;\",\"logo\":\"width: 96rpx;height: 96rpx;border-radius: 50%;float: left\",\"topic\":\"color: #EFC7A5;font-size: 36rpx;padding-bottom: 16rpx;padding-left: 30rpx;float: left;width: 420rpx\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx; padding-left: 30rpx;float: left; width: 420rpx\",\"button\":\"width: 172rpx;height: 172rpx;position: absolute;left: 50%;transform: translateX(-86rpx);\",\"wrapT\":\"700\",\"btnT\":\"876\"}','{\"font\":{\"align\":\"left\",\"left\":236,\"topicMax\":10,\"topicTop\":680,\"topicSize\":36,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":15,\"blessMt\":10},\"logo\":{\"width\":96,\"top\":680,\"align\":\"left\",\"left\":108},\"qr\":{\"width\":152,\"top\":886,\"align\":\"center\"}}',0,2,28.00,18,NULL,NULL,0,NULL,NULL,NULL,NULL,0,100,'2019-01-26 14:21:40','redbag/qrcode/20190126/79cec89a-d035-4f54-b679-be86b0d3dfba.png',0,NULL,NULL,0,0,'redbag/background/image/c1e093e9-f38f-4cef-9674-e4407d7b9690.jpg',1,1,'2019-01-29 17:35:45'),(241,'刘沛给您拜年了','redbag/logo/af48f7b1-8378-451b-a832-2ad5aee4f5ea','大吉大利 猪年快乐','oyDfX5Wwcdqv2_XhMKAczV9m3N50','2019-01-26 17:52:46','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,1.00,3,NULL,NULL,0,NULL,NULL,NULL,NULL,0,1,'2019-01-26 17:52:53','redbag/qrcode/20190126/3ab1128d-1df9-4da8-aace-07e8b9d41f91.png',0,NULL,NULL,0,0,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(242,'水煮鱿鱼给您拜年了','redbag/logo/b95aa10a-2b52-4baa-aaff-49b9e783c655','大吉大利 猪年快乐','oyDfX5VBnWvmQ0E8H9U1JSSIJn90','2019-01-26 18:09:32','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,1.00,5,NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,NULL,0,0,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(243,'测试微商课程表跳转','redbag/background/image/6b0b81b4-e174-4249-83e5-97c2143bceac.jpeg','测试微商课程表跳转','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 11:39:39','redbag/background/image/f3ed059c-e305-4863-b320-7c3c2e0a6db4.jpg',NULL,'{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 34rpx;\",\"topic\":\"color: #EFC7A5;font-size: 40rpx;padding-bottom: 24rpx;text-align: center;\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx;text-align: center;\",\"button\":\"width: 180rpx;height: 180rpx;position: absolute;left: 50%;transform: translateX(-90rpx);\",\"wrapT\":\"420\",\"btnT\":\"866\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":560,\"topicSize\":40,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":422,\"align\":\"center\"},\"qr\":{\"width\":160,\"top\":878,\"align\":\"center\"}}',0,2,1.00,5,NULL,NULL,0,NULL,NULL,NULL,NULL,0,100,'2019-01-28 00:00:00','redbag/qrcode/20190128/f3137334-4646-40e0-a5a0-6ce35c0964e1.png',1,'wx3d818156c6bc5439','微商课程表',0,1,'redbag/background/image/2264941f-e067-4c0a-81cc-f1c07e12f76f.jpg',1,1,'2019-01-28 15:54:24'),(244,'测试关注镜博士','','新年快乐 恭喜发财','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 16:00:56','redbag/background/image/aec58499-5371-4e28-80e2-492c6da1ae7f.jpg',NULL,'{\"wrap\":\"padding-left: 108rpx;padding-right: 100rpx;\",\"logo\":\"width: 96rpx;height: 96rpx;border-radius: 50%;float: left\",\"topic\":\"color: #EFC7A5;font-size: 36rpx;padding-bottom: 16rpx;padding-left: 30rpx;float: left;width: 420rpx\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx; padding-left: 30rpx;float: left; width: 420rpx\",\"button\":\"width: 172rpx;height: 172rpx;position: absolute;left: 50%;transform: translateX(-86rpx);\",\"wrapT\":\"700\",\"btnT\":\"876\"}','{\"font\":{\"align\":\"left\",\"left\":236,\"topicMax\":10,\"topicTop\":680,\"topicSize\":36,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":15,\"blessMt\":10},\"logo\":{\"width\":96,\"top\":680,\"align\":\"left\",\"left\":108},\"qr\":{\"width\":152,\"top\":886,\"align\":\"center\"}}',0,2,1.00,8,NULL,NULL,0,NULL,NULL,'2019-01-28 16:10:00','2019-02-05 16:00:00',0,1,'2019-01-28 00:00:00','redbag/qrcode/20190128/87c443ff-c0f4-4c18-a689-68c443cabf4d.png',1,'wxa72cca37afe01e58','光学镜博士',0,1,'redbag/background/image/c1e093e9-f38f-4cef-9674-e4407d7b9690.jpg',0,0,NULL),(245,'测试','redbag/background/image/86437122-22c7-45c1-8118-7140fe67ddf8.png','新年快乐 恭喜发财','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 18:38:26','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg',NULL,'{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,2.00,5,2.00,5,0,NULL,NULL,NULL,NULL,0,1,'2019-01-28 00:00:00','redbag/qrcode/20190128/16e7264b-9784-48c5-84f3-098447d2e0e0.png',0,'','',0,0,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(246,'测试2','redbag/background/image/c675d2f2-be5d-4417-884e-47c69a815477.jpg','新年快乐 恭喜发财','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 18:58:49','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg',NULL,'{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,2.00,8,1.94,8,0,0.18,0.30,NULL,NULL,0,1,'2019-01-28 00:00:00','redbag/qrcode/20190128/23d0fa5d-c908-47d9-97d1-8cbf1215ab34.png',0,'','',0,0,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',0,0,NULL),(247,'L给您拜年了','redbag/logo/c63bae13-15de-4e74-bea9-4ae7c75371ef','大吉大利 猪年快乐','oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-28 19:11:23','redbag/background/image/865e09c1-0205-4405-b802-99234dfe2c52.jpg','redbag/background/music/2fc9731b-61bb-42d6-9bc9-d25a0b4ee2ae.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 120rpx;padding-right: 120rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 250rpx;\",\"topic\":\"text-align: center;color: #fff;font-size: 36rpx;padding-bottom: 30rpx;\",\"bless\":\"text-align: center;color: #fff;font-size: 24rpx;line-height: 40rpx;\",\"button\":\"width: 168rpx;height: 168rpx;position: absolute;right: 130rpx;\",\"wrapT\":\"324\",\"btnT\":\"836\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":660,\"topicSize\":36,\"topicColor\":\"#fff\",\"blessColor\":\"#fff\",\"blessSize\":24,\"blessMax\":24,\"blessMt\":30},\"logo\":{\"width\":100,\"top\":324,\"align\":\"center\"},\"qr\":{\"width\":168,\"top\":836,\"align\":\"left\",\"left\":450}}',0,2,1.00,1,1.00,1,0,NULL,NULL,NULL,NULL,0,100,'2019-01-28 19:11:30','redbag/qrcode/20190128/b2122683-31e1-45db-abb3-dc1982136e93.png',0,NULL,NULL,0,0,'redbag/background/image/fc283762-1956-40e0-8577-ca0183db52cd.jpg',1,1,'2019-01-28 19:48:33'),(248,'跳转小程序测试','redbag/logo/94dbf370-1ff2-4f5e-b74c-fb65a83de148','新年快乐 恭喜发财','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 20:59:07','redbag/background/image/03059ca8-219d-4aaf-a92e-b11ab8c1102d.jpg',NULL,'{\"wrap\":\"padding-left: 128rpx;padding-right: 100rpx;\",\"logo\":\"width: 120rpx;height: 120rpx;border-radius: 50%;float: left\",\"topic\":\"color: #fff;font-size: 34rpx;padding-bottom: 20rpx;padding-left: 30rpx;float: left;width: 400rpx\",\"bless\":\"color: #FFA3A3;font-size: 24rpx;line-height: 40rpx; padding-left: 30rpx;float: left; width: 400rpx\",\"button\":\"width: 208rpx;height: 208rpx;position: absolute;left: 50%;transform: translateX(-104rpx);\",\"wrapT\":\"300\",\"btnT\":\"925\"}','{\"font\":{\"align\":\"left\",\"left\":296,\"topicMax\":10,\"topicTop\":300,\"topicSize\":34,\"topicColor\":\"#fff\",\"blessColor\":\"#FFA3A3\",\"blessSize\":24,\"blessMax\":14,\"blessMt\":30},\"logo\":{\"width\":120,\"top\":300,\"align\":\"left\",\"left\":128},\"qr\":{\"width\":208,\"top\":925,\"align\":\"center\"}}',0,2,1.00,2,1.00,2,0,NULL,NULL,NULL,NULL,0,1,'2019-01-28 00:00:00','redbag/qrcode/20190128/0b5bf057-873d-43ed-bb59-501b91989776.png',1,'wx397e43d8e81d7ed3','微商课程表',0,0,'redbag/background/image/1a746dde-de6c-43d6-a362-5e7db9a4a1bb.jpg',0,0,NULL),(249,'过年了','redbag/logo/7a75e3ca-16f1-4750-8708-4385655bf49f','猪年大吉 恭喜发财 身体健康 阖家欢乐','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:24:13','redbag/background/image/aec58499-5371-4e28-80e2-492c6da1ae7f.jpg','redbag/logo/cd263598-e14b-44ba-af16-995504fdff8c.m4a','{\"wrap\":\"padding-left: 108rpx;padding-right: 100rpx;\",\"logo\":\"width: 96rpx;height: 96rpx;border-radius: 50%;float: left\",\"topic\":\"color: #EFC7A5;font-size: 36rpx;padding-bottom: 16rpx;padding-left: 30rpx;float: left;width: 420rpx\",\"bless\":\"color: #EFC7A5;font-size: 24rpx;line-height: 40rpx; padding-left: 30rpx;float: left; width: 420rpx\",\"button\":\"width: 172rpx;height: 172rpx;position: absolute;left: 50%;transform: translateX(-86rpx);\",\"wrapT\":\"700\",\"btnT\":\"876\"}','{\"font\":{\"align\":\"left\",\"left\":236,\"topicMax\":10,\"topicTop\":680,\"topicSize\":36,\"topicColor\":\"#EFC7A5\",\"blessColor\":\"#EFC7A5\",\"blessSize\":24,\"blessMax\":15,\"blessMt\":10},\"logo\":{\"width\":96,\"top\":680,\"align\":\"left\",\"left\":108},\"qr\":{\"width\":152,\"top\":886,\"align\":\"center\"}}',0,2,1.00,5,1.00,5,0,NULL,NULL,NULL,NULL,0,1,'2019-01-29 17:24:20','redbag/qrcode/20190129/67e03c5b-661f-49e5-bf9b-67cb6eee4391.png',0,NULL,NULL,1,1,'redbag/background/image/c1e093e9-f38f-4cef-9674-e4407d7b9690.jpg',0,0,NULL),(250,'哆咪开年大发','redbag/logo/c89cf2aa-0866-4958-a02e-011010dc46d1.jpg','春节来到，祝福敲门：恭喜发财，过年好！','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:27:20','redbag/background/image/c3154345-eaa9-4973-97d4-0aa47719806b.jpg','redbag/background/music/82bb3fb4-59d4-45a1-9f1e-b68f0b04221a.mp3','{\"wrap\":\"display: flex;flex-direction: column;align-items: center;padding-left: 100rpx;padding-right: 100rpx;\",\"logo\":\"width: 100rpx;height: 100rpx;border-radius: 50%;margin-bottom: 140rpx;\",\"topic\":\"text-align: center;color: #E3544E;font-size: 36rpx;padding-bottom: 24rpx;\",\"bless\":\"text-align: center;color: #E3544E;font-size: 30rpx;line-height: 40rpx;\",\"button\":\"width: 148rpx;height: 148rpx;position: absolute;left: 50%;transform: translateX(-74rpx);\",\"wrapT\":\"332\",\"btnT\":\"854\"}','{\"font\":{\"align\":\"center\",\"topicMax\":15,\"topicTop\":572,\"topicSize\":36,\"topicColor\":\"#E3544E\",\"blessColor\":\"#E3544E\",\"blessSize\":30,\"blessMax\":20,\"blessMt\":20},\"logo\":{\"width\":100,\"top\":336,\"align\":\"center\"},\"qr\":{\"width\":128,\"top\":864,\"align\":\"center\"}}',0,2,2.00,5,2.00,5,0,NULL,NULL,NULL,NULL,0,1,'2019-01-29 17:27:35','redbag/qrcode/20190129/56fb6874-0294-4e56-b4ae-84c3970c67d4.png',0,NULL,NULL,0,0,'redbag/background/image/f084edc9-dc31-44c0-b934-c52cd34dd762.jpg',0,0,NULL);
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
INSERT INTO `bus_redbag_alloc` VALUES (228,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',4.22,'2019-01-26 12:21:57'),(228,'oyDfX5eYyLCts6wAStZu4NabD3TM',1.15,'2019-01-26 12:41:20'),(228,'oyDfX5UNiq30f4u9uMk_e2DYuOeI',3.92,'2019-01-26 12:49:39'),(228,'oyDfX5fB7INZsJOHuZgQi_gLqTlE',3.93,'2019-01-26 12:50:35'),(228,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',0.51,'2019-01-26 12:57:51'),(228,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',2.64,'2019-01-26 13:09:30'),(229,'oyDfX5X4MLLvhNYnKRmIVUag1ask',0.21,'2019-01-26 13:14:37'),(228,'oyDfX5X4MLLvhNYnKRmIVUag1ask',3.97,'2019-01-26 13:14:43'),(229,'oyDfX5eYyLCts6wAStZu4NabD3TM',0.24,'2019-01-26 13:14:49'),(229,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',0.40,'2019-01-26 13:15:12'),(229,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.39,'2019-01-26 13:15:17'),(230,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',2.72,'2019-01-26 13:15:29'),(230,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',3.32,'2019-01-26 13:15:46'),(228,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',4.40,'2019-01-26 13:16:27'),(230,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',1.20,'2019-01-26 13:16:44'),(229,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',1.77,'2019-01-26 13:16:57'),(230,'oyDfX5X4MLLvhNYnKRmIVUag1ask',1.11,'2019-01-26 13:17:34'),(230,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',1.65,'2019-01-26 13:18:05'),(229,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',0.39,'2019-01-26 13:18:35'),(229,'oyDfX5Wm-S14LKRg0bpodvtlPMtE',2.52,'2019-01-26 13:21:25'),(231,'oyDfX5X4MLLvhNYnKRmIVUag1ask',0.12,'2019-01-26 13:21:27'),(229,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',0.20,'2019-01-26 13:21:43'),(231,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',0.02,'2019-01-26 13:21:51'),(231,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.91,'2019-01-26 13:21:55'),(228,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',1.21,'2019-01-26 13:21:58'),(231,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',0.60,'2019-01-26 13:22:05'),(232,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',1.00,'2019-01-26 13:25:02'),(232,'oyDfX5eYyLCts6wAStZu4NabD3TM',1.00,'2019-01-26 13:25:30'),(232,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',1.00,'2019-01-26 13:25:48'),(232,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',1.00,'2019-01-26 13:25:50'),(233,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',0.38,'2019-01-26 13:29:54'),(234,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',2.18,'2019-01-26 13:30:34'),(233,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.04,'2019-01-26 13:30:43'),(234,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',1.31,'2019-01-26 13:30:47'),(228,'oyDfX5VVkkemoWwG8uB1qURXuKCc',1.51,'2019-01-26 13:32:25'),(234,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',1.42,'2019-01-26 13:32:29'),(233,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',0.22,'2019-01-26 13:32:36'),(233,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',0.24,'2019-01-26 13:33:26'),(231,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',0.31,'2019-01-26 13:33:43'),(234,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',2.00,'2019-01-26 13:34:12'),(234,'oyDfX5UNiq30f4u9uMk_e2DYuOeI',1.15,'2019-01-26 13:35:11'),(234,'oyDfX5fB7INZsJOHuZgQi_gLqTlE',1.17,'2019-01-26 13:35:32'),(235,'oyDfX5eYyLCts6wAStZu4NabD3TM',1.54,'2019-01-26 13:35:37'),(229,'oyDfX5fB7INZsJOHuZgQi_gLqTlE',0.31,'2019-01-26 13:36:51'),(229,'oyDfX5VVkkemoWwG8uB1qURXuKCc',3.57,'2019-01-26 13:38:12'),(233,'oyDfX5X4MLLvhNYnKRmIVUag1ask',0.12,'2019-01-26 13:39:41'),(228,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8',3.05,'2019-01-26 13:43:34'),(236,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ',0.19,'2019-01-26 13:44:32'),(236,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.09,'2019-01-26 13:45:00'),(236,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',0.72,'2019-01-26 13:45:00'),(235,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',1.45,'2019-01-26 13:45:38'),(234,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',0.34,'2019-01-26 13:45:46'),(231,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',3.23,'2019-01-26 13:45:59'),(237,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',0.06,'2019-01-26 13:47:35'),(237,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.29,'2019-01-26 13:47:49'),(237,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',0.27,'2019-01-26 13:48:09'),(231,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8',2.15,'2019-01-26 13:49:59'),(237,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8',1.38,'2019-01-26 13:50:16'),(228,'oyDfX5TQG4pXXvF9VhkjQc1QCts0',4.20,'2019-01-26 13:50:31'),(228,'oyDfX5ZtticYhKu9SaurhvxMQ6gc',0.91,'2019-01-26 13:50:35'),(234,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8',0.43,'2019-01-26 13:50:51'),(228,'oyDfX5XkfBcbeDePPRxBMLfVpd7E',3.89,'2019-01-26 13:51:54'),(228,'oyDfX5cOmNaS6GoW7kn8zVeCMsWY',3.36,'2019-01-26 13:53:52'),(228,'oyDfX5fQDvK0ypGQynW58gfEKtM4',0.83,'2019-01-26 13:54:29'),(228,'oyDfX5ZNHQ3HHmaSoe7ze9xXmdTw',0.21,'2019-01-26 13:54:39'),(238,'oyDfX5eYyLCts6wAStZu4NabD3TM',3.57,'2019-01-26 13:55:28'),(238,'oyDfX5X4MLLvhNYnKRmIVUag1ask',1.75,'2019-01-26 13:55:28'),(231,'oyDfX5eXQ_DEdY9hSXikalLCaFDo',2.66,'2019-01-26 13:56:14'),(228,'oyDfX5eXQ_DEdY9hSXikalLCaFDo',1.27,'2019-01-26 13:56:44'),(238,'oyDfX5dIu2f4d6hFU2kJ6kpu4YmM',2.57,'2019-01-26 13:56:52'),(238,'oyDfX5fpdUM_PaPyAvbnwcqkMibA',1.40,'2019-01-26 13:56:52'),(228,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0',4.02,'2019-01-26 13:58:52'),(228,'oyDfX5YN6XS95-BvFSBAaKbIFOyA',0.80,'2019-01-26 14:01:02'),(238,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',3.88,'2019-01-26 14:02:14'),(238,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',2.17,'2019-01-26 14:02:14'),(238,'oyDfX5eKWm6GwZqa51qzoOstKc6k',0.44,'2019-01-26 14:02:18'),(238,'oyDfX5VTceO2h9aCcXoRpMLVgE6Y',2.94,'2019-01-26 14:02:18'),(238,'oyDfX5SvyYczqfIlSIlGQ2EYtHuQ',0.08,'2019-01-26 14:06:50'),(238,'oyDfX5TrqskZgnKxH05HHogcPJYw',2.07,'2019-01-26 14:06:50'),(238,'oyDfX5SVgYHynM7S3G3DLyVY6a6w',2.48,'2019-01-26 14:10:17'),(238,'oyDfX5cCVQzoGvWLB4-R8lErGqvQ',1.95,'2019-01-26 14:10:17'),(239,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.22,'2019-01-26 14:11:49'),(239,'oyDfX5eYyLCts6wAStZu4NabD3TM',0.23,'2019-01-26 14:14:28'),(238,'oyDfX5afT824em9JybnRAmjHkMtI',1.73,'2019-01-26 14:15:24'),(238,'oyDfX5V2Af_uREWzMK3gqesbVum4',2.39,'2019-01-26 14:15:24'),(238,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ',2.81,'2019-01-26 14:18:02'),(238,'oyDfX5XTol1TvWbw2zyz2VupQ-4E',2.83,'2019-01-26 14:18:02'),(238,'oyDfX5bXeLUabBzhTkw2TcB6O69g',3.60,'2019-01-26 14:23:00'),(238,'oyDfX5RM2NXOVu7sOdBP-1dcPD0Y',0.16,'2019-01-26 14:23:00'),(240,'oyDfX5cfgLsLSM4_zYnPcMPifB3A',1.91,'2019-01-26 14:23:12'),(240,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',0.83,'2019-01-26 14:23:41'),(238,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',1.98,'2019-01-26 14:27:43'),(238,'oyDfX5UNiq30f4u9uMk_e2DYuOeI',3.49,'2019-01-26 14:27:43'),(240,'oyDfX5b-CeE7mo6pR9-GJdJZwMfU',2.02,'2019-01-26 14:34:49'),(238,'oyDfX5fEd-sVl30oGT5PmaTm7Xok',1.49,'2019-01-26 14:43:05'),(238,'oyDfX5U-ttE7YioegM36yPZCV9K0',1.85,'2019-01-26 14:43:05'),(235,'oyDfX5XLN-qQeFuv8RK7vRQBeAUo',0.20,'2019-01-26 14:49:52'),(238,'oyDfX5aqOeGI7dnuER3v4XCCQozs',3.57,'2019-01-26 14:51:28'),(238,'oyDfX5cpTzO9KUoEJ6QEQhy4ZLiA',0.98,'2019-01-26 14:51:28'),(238,'oyDfX5YuuV-mI4BJcsACr2RqGCHU',3.60,'2019-01-26 14:53:29'),(238,'oyDfX5S5ruxJEtRWTIq1xRU7FkWY',2.33,'2019-01-26 14:53:29'),(240,'oyDfX5XM2UE-bh4RaSSgeG9pxZ_I',3.03,'2019-01-26 15:04:47'),(238,'oyDfX5TEyupNwD3a2nuuIO0bGMQE',0.84,'2019-01-26 15:31:24'),(238,'oyDfX5SWCOXRTNs2JU6gvJ4DDQs0',2.58,'2019-01-26 15:31:24'),(238,'oyDfX5ZM7mPiujg09jcRnxoF9ogY',0.88,'2019-01-26 15:35:48'),(238,'oyDfX5SsSJUki9JZeSuDyMDQp6HQ',2.84,'2019-01-26 15:35:48'),(238,'oyDfX5b4J-XqvmJ5QR_69rqC48gE',0.94,'2019-01-26 15:50:48'),(238,'oyDfX5f68NrJwDN9uo9ks9w0VWjs',0.77,'2019-01-26 15:50:48'),(240,'oyDfX5dj1yFNeetopkspvllGtx7I',0.28,'2019-01-26 16:19:28'),(240,'oyDfX5eCI4y-rDcNYaB7U3fwgRhU',0.74,'2019-01-26 16:20:47'),(240,'oyDfX5YX7Ozh6_u2qS7szTYCb9VY',2.15,'2019-01-26 16:37:04'),(240,'oyDfX5cSfj9lm4dA8igH5WXH9x0c',3.01,'2019-01-26 16:46:48'),(240,'oyDfX5d83HiFcJ004mfhp97Qg7y8',1.40,'2019-01-26 16:53:53'),(235,'oyDfX5eogADCmR8x4GEHI8SMcEtE',3.91,'2019-01-26 17:35:30'),(241,'oyDfX5Wwcdqv2_XhMKAczV9m3N50',0.11,'2019-01-26 17:53:27'),(241,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.20,'2019-01-26 17:53:35'),(241,'oyDfX5VBnWvmQ0E8H9U1JSSIJn90',0.69,'2019-01-26 18:07:55'),(240,'oyDfX5VJ0-UoDbsxCgGdeTkApPAM',0.55,'2019-01-26 21:06:52'),(240,'oyDfX5dGLyyJu_BNg4_YdbJjw90w',1.99,'2019-01-27 12:01:46'),(244,'oyDfX5eYyLCts6wAStZu4NabD3TM',0.21,'2019-01-28 16:34:47'),(240,'oyDfX5ZhIo8mEnb-alfByewjYjrw',1.94,'2019-01-28 19:53:18'),(248,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.53,'2019-01-28 20:59:40'),(248,'oyDfX5eYyLCts6wAStZu4NabD3TM',0.47,'2019-01-28 21:12:33'),(249,'oyDfX5X4MLLvhNYnKRmIVUag1ask',0.32,'2019-01-29 17:25:15'),(250,'oyDfX5X4MLLvhNYnKRmIVUag1ask',0.30,'2019-01-29 17:28:00'),(249,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.26,'2019-01-29 17:36:01'),(250,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',0.71,'2019-01-29 17:36:24'),(249,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ',0.09,'2019-01-29 17:44:10'),(250,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ',0.38,'2019-01-29 17:44:27');
/*!40000 ALTER TABLE `bus_redbag_alloc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_redbag_join`
--

DROP TABLE IF EXISTS `bus_redbag_join`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_redbag_join` (
  `red_id` int(11) NOT NULL COMMENT '红包id',
  `user_id` char(36) CHARACTER SET utf8mb4 NOT NULL COMMENT '抢到红包的用户',
  `join_date` datetime NOT NULL COMMENT '参与日期',
  `param` varchar(512) DEFAULT NULL COMMENT '参数',
  UNIQUE KEY `uniqueIndex` (`red_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_redbag_join`
--

LOCK TABLES `bus_redbag_join` WRITE;
/*!40000 ALTER TABLE `bus_redbag_join` DISABLE KEYS */;
INSERT INTO `bus_redbag_join` VALUES (228,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 12:21:57','{\"id\":\"228\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":4.22}'),(228,'oyDfX5cOmNaS6GoW7kn8zVeCMsWY','2019-01-26 13:53:52','{\"id\":\"228\",\"userid\":\"oyDfX5cOmNaS6GoW7kn8zVeCMsWY\",\"money\":3.36}'),(228,'oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:44','{\"id\":\"228\",\"userid\":\"oyDfX5eXQ_DEdY9hSXikalLCaFDo\",\"money\":1.27}'),(228,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 12:41:20','{\"id\":\"228\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":1.15}'),(228,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:43:34','{\"id\":\"228\",\"userid\":\"oyDfX5eYZMMc1Sy6Q7e0kWPZVio8\",\"money\":3.05}'),(228,'oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 12:50:35','{\"id\":\"228\",\"userid\":\"oyDfX5fB7INZsJOHuZgQi_gLqTlE\",\"money\":3.93}'),(228,'oyDfX5fQDvK0ypGQynW58gfEKtM4','2019-01-26 13:54:29','{\"id\":\"228\",\"userid\":\"oyDfX5fQDvK0ypGQynW58gfEKtM4\",\"money\":0.83}'),(228,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 12:57:51','{\"id\":\"228\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"money\":0.51}'),(228,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:21:58','{\"id\":\"228\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":1.21}'),(228,'oyDfX5TQG4pXXvF9VhkjQc1QCts0','2019-01-26 13:50:31','{\"id\":\"228\",\"userid\":\"oyDfX5TQG4pXXvF9VhkjQc1QCts0\",\"money\":4.2}'),(228,'oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 12:49:39','{\"id\":\"228\",\"userid\":\"oyDfX5UNiq30f4u9uMk_e2DYuOeI\",\"money\":3.92}'),(228,'oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:32:25','{\"id\":\"228\",\"userid\":\"oyDfX5VVkkemoWwG8uB1qURXuKCc\",\"money\":1.51}'),(228,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:58:52','{\"id\":\"228\",\"userid\":\"oyDfX5W1K1ZNqaq9eqtHgWLtm7D0\",\"money\":4.02}'),(228,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:14:43','{\"id\":\"228\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":3.97}'),(228,'oyDfX5XkfBcbeDePPRxBMLfVpd7E','2019-01-26 13:51:54','{\"id\":\"228\",\"userid\":\"oyDfX5XkfBcbeDePPRxBMLfVpd7E\",\"money\":3.89}'),(228,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:09:30','{\"id\":\"228\",\"userid\":\"oyDfX5YMZmLk8j4AkbzGqpsK1tlg\",\"money\":2.64}'),(228,'oyDfX5YN6XS95-BvFSBAaKbIFOyA','2019-01-26 14:01:02','{\"id\":\"228\",\"userid\":\"oyDfX5YN6XS95-BvFSBAaKbIFOyA\",\"money\":0.8}'),(228,'oyDfX5ZNHQ3HHmaSoe7ze9xXmdTw','2019-01-26 13:54:39','{\"id\":\"228\",\"userid\":\"oyDfX5ZNHQ3HHmaSoe7ze9xXmdTw\",\"money\":0.21}'),(228,'oyDfX5ZtticYhKu9SaurhvxMQ6gc','2019-01-26 13:50:35','{\"id\":\"228\",\"userid\":\"oyDfX5ZtticYhKu9SaurhvxMQ6gc\",\"money\":0.91}'),(228,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:16:27','{\"id\":\"228\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":4.4}'),(229,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:15:17','{\"id\":\"229\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.39}'),(229,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:14:49','{\"id\":\"229\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":0.24}'),(229,'oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 13:36:51','{\"id\":\"229\",\"userid\":\"oyDfX5fB7INZsJOHuZgQi_gLqTlE\",\"money\":0.31}'),(229,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:18:35','{\"id\":\"229\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"money\":0.39}'),(229,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:21:43','{\"id\":\"229\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":0.2}'),(229,'oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:38:12','{\"id\":\"229\",\"userid\":\"oyDfX5VVkkemoWwG8uB1qURXuKCc\",\"money\":3.57}'),(229,'oyDfX5Wm-S14LKRg0bpodvtlPMtE','2019-01-26 13:21:25','{\"id\":\"229\",\"userid\":\"oyDfX5Wm-S14LKRg0bpodvtlPMtE\",\"money\":2.52}'),(229,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:14:37','{\"id\":\"229\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":0.21}'),(229,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:15:12','{\"id\":\"229\",\"userid\":\"oyDfX5YMZmLk8j4AkbzGqpsK1tlg\",\"money\":0.4}'),(229,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:16:57','{\"id\":\"229\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":1.77}'),(230,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:15:29','{\"id\":\"230\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":2.72}'),(230,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:18:05','{\"id\":\"230\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"money\":1.65}'),(230,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:17:34','{\"id\":\"230\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":1.11}'),(230,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:15:46','{\"id\":\"230\",\"userid\":\"oyDfX5YMZmLk8j4AkbzGqpsK1tlg\",\"money\":3.32}'),(230,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:16:44','{\"id\":\"230\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":1.2}'),(231,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:21:55','{\"id\":\"231\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.91}'),(231,'oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:14','{\"id\":\"231\",\"userid\":\"oyDfX5eXQ_DEdY9hSXikalLCaFDo\",\"money\":2.66}'),(231,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:49:59','{\"id\":\"231\",\"userid\":\"oyDfX5eYZMMc1Sy6Q7e0kWPZVio8\",\"money\":2.15}'),(231,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:33:43','{\"id\":\"231\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"money\":0.31}'),(231,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:21:51','{\"id\":\"231\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":0.02}'),(231,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:21:27','{\"id\":\"231\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":0.12}'),(231,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:45:59','{\"id\":\"231\",\"userid\":\"oyDfX5YMZmLk8j4AkbzGqpsK1tlg\",\"money\":3.23}'),(231,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:22:05','{\"id\":\"231\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":0.6}'),(232,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:25:48','{\"id\":\"232\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":1}'),(232,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:25:30','{\"id\":\"232\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":1}'),(232,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:25:50','{\"id\":\"232\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":1}'),(232,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:25:02','{\"id\":\"232\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":1}'),(233,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:30:43','{\"id\":\"233\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.04}'),(233,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:33:26','{\"id\":\"233\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"money\":0.24}'),(233,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:32:36','{\"id\":\"233\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":0.22}'),(233,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:39:41','{\"id\":\"233\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":0.12}'),(233,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:29:54','{\"id\":\"233\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":0.38}'),(234,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:30:34','{\"id\":\"234\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":2.18}'),(234,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:50:51','{\"id\":\"234\",\"userid\":\"oyDfX5eYZMMc1Sy6Q7e0kWPZVio8\",\"money\":0.43}'),(234,'oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 13:35:32','{\"id\":\"234\",\"userid\":\"oyDfX5fB7INZsJOHuZgQi_gLqTlE\",\"money\":1.17}'),(234,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:34:12','{\"id\":\"234\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"money\":2}'),(234,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:32:29','{\"id\":\"234\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":1.42}'),(234,'oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 13:35:11','{\"id\":\"234\",\"userid\":\"oyDfX5UNiq30f4u9uMk_e2DYuOeI\",\"money\":1.15}'),(234,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:45:46','{\"id\":\"234\",\"userid\":\"oyDfX5YMZmLk8j4AkbzGqpsK1tlg\",\"money\":0.34}'),(234,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:30:47','{\"id\":\"234\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":1.31}'),(235,'oyDfX5eogADCmR8x4GEHI8SMcEtE','2019-01-26 17:35:30','{\"id\":\"235\",\"userid\":\"oyDfX5eogADCmR8x4GEHI8SMcEtE\",\"money\":3.91}'),(235,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:35:37','{\"id\":\"235\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":1.54}'),(235,'oyDfX5XLN-qQeFuv8RK7vRQBeAUo','2019-01-26 14:49:52','{\"id\":\"235\",\"userid\":\"oyDfX5XLN-qQeFuv8RK7vRQBeAUo\",\"money\":0.2}'),(235,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:45:38','{\"id\":\"235\",\"userid\":\"oyDfX5YMZmLk8j4AkbzGqpsK1tlg\",\"money\":1.45}'),(236,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:45:00','{\"id\":\"236\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.09}'),(236,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:45:00','{\"id\":\"236\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":0.72}'),(236,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 13:44:32','{\"id\":\"236\",\"userid\":\"oyDfX5WdxP2lBmxy1jw-l0gr0PEQ\",\"money\":0.19}'),(237,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:47:49','{\"id\":\"237\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.29}'),(237,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:50:16','{\"id\":\"237\",\"userid\":\"oyDfX5eYZMMc1Sy6Q7e0kWPZVio8\",\"money\":1.38}'),(237,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:47:35','{\"id\":\"237\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":0.06}'),(237,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:48:09','{\"id\":\"237\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"money\":0.27}'),(238,'oyDfX5afT824em9JybnRAmjHkMtI','2019-01-26 14:12:06','{\"id\":\"238\",\"userid\":\"oyDfX5afT824em9JybnRAmjHkMtI\",\"groupid\":\"1548483126365\",\"money\":1.73}'),(238,'oyDfX5aqOeGI7dnuER3v4XCCQozs','2019-01-26 14:48:57','{\"id\":\"238\",\"userid\":\"oyDfX5aqOeGI7dnuER3v4XCCQozs\",\"groupid\":\"1548485338057\",\"money\":3.57}'),(238,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:01:29','{\"id\":\"238\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"groupid\":\"1548482489202\",\"money\":3.88}'),(238,'oyDfX5b4J-XqvmJ5QR_69rqC48gE','2019-01-26 14:43:48','{\"id\":\"238\",\"userid\":\"oyDfX5b4J-XqvmJ5QR_69rqC48gE\",\"groupid\":\"1548485028950\",\"money\":0.94}'),(238,'oyDfX5bXeLUabBzhTkw2TcB6O69g','2019-01-26 14:17:10','{\"id\":\"238\",\"userid\":\"oyDfX5bXeLUabBzhTkw2TcB6O69g\",\"groupid\":\"1548483430184\",\"money\":3.6}'),(238,'oyDfX5b_znA1RYiZoEYbtMy0bMtU','2019-01-26 14:20:06','{\"id\":\"238\",\"userid\":\"oyDfX5b_znA1RYiZoEYbtMy0bMtU\",\"groupid\":\"1548483606254\",\"money\":1.88}'),(238,'oyDfX5cCVQzoGvWLB4-R8lErGqvQ','2019-01-26 14:10:17','{\"id\":\"238\",\"userid\":\"oyDfX5cCVQzoGvWLB4-R8lErGqvQ\",\"groupid\":\"1548482790787\",\"money\":1.95}'),(238,'oyDfX5cpTzO9KUoEJ6QEQhy4ZLiA','2019-01-26 14:51:28','{\"id\":\"238\",\"userid\":\"oyDfX5cpTzO9KUoEJ6QEQhy4ZLiA\",\"groupid\":\"1548485338057\",\"money\":0.98}'),(238,'oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','2019-01-26 13:56:03','{\"id\":\"238\",\"userid\":\"oyDfX5dIu2f4d6hFU2kJ6kpu4YmM\",\"groupid\":\"1548482163929\",\"money\":2.57}'),(238,'oyDfX5eKWm6GwZqa51qzoOstKc6k','2019-01-26 14:01:57','{\"id\":\"238\",\"userid\":\"oyDfX5eKWm6GwZqa51qzoOstKc6k\",\"groupid\":\"1548482517842\",\"money\":0.44}'),(238,'oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:55:47','{\"id\":\"238\",\"userid\":\"oyDfX5eXQ_DEdY9hSXikalLCaFDo\",\"groupid\":\"1548482147949\",\"money\":0.92}'),(238,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:55:02','{\"id\":\"238\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"groupid\":\"1548482102181\",\"money\":3.57}'),(238,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:58:57','{\"id\":\"238\",\"userid\":\"oyDfX5eYZMMc1Sy6Q7e0kWPZVio8\",\"groupid\":\"1548482337882\",\"money\":1.19}'),(238,'oyDfX5f68NrJwDN9uo9ks9w0VWjs','2019-01-26 15:50:48','{\"id\":\"238\",\"userid\":\"oyDfX5f68NrJwDN9uo9ks9w0VWjs\",\"groupid\":\"1548485028950\",\"money\":0.77}'),(238,'oyDfX5fEd-sVl30oGT5PmaTm7Xok','2019-01-26 14:42:18','{\"id\":\"238\",\"userid\":\"oyDfX5fEd-sVl30oGT5PmaTm7Xok\",\"groupid\":\"1548484939067\",\"money\":1.49}'),(238,'oyDfX5fpdUM_PaPyAvbnwcqkMibA','2019-01-26 13:56:52','{\"id\":\"238\",\"userid\":\"oyDfX5fpdUM_PaPyAvbnwcqkMibA\",\"groupid\":\"1548482163929\",\"money\":1.4}'),(238,'oyDfX5fQDvK0ypGQynW58gfEKtM4','2019-01-26 14:00:30','{\"id\":\"238\",\"userid\":\"oyDfX5fQDvK0ypGQynW58gfEKtM4\",\"groupid\":\"1548482430097\",\"money\":3.67}'),(238,'oyDfX5fSoDQas5aWB_VzQX4TFaTE','2019-01-26 14:47:47','{\"id\":\"238\",\"userid\":\"oyDfX5fSoDQas5aWB_VzQX4TFaTE\",\"groupid\":\"1548485268100\",\"money\":0.3}'),(238,'oyDfX5QiHvIFwIpTQDzQjg_oL4Ks','2019-01-26 13:57:39','{\"id\":\"238\",\"userid\":\"oyDfX5QiHvIFwIpTQDzQjg_oL4Ks\",\"groupid\":\"1548482259167\",\"money\":2.25}'),(238,'oyDfX5QpxQZo79CDGaBLNI-7Owz0','2019-01-26 14:32:12','{\"id\":\"238\",\"userid\":\"oyDfX5QpxQZo79CDGaBLNI-7Owz0\",\"groupid\":\"1548484332666\",\"money\":2.05}'),(238,'oyDfX5RM2NXOVu7sOdBP-1dcPD0Y','2019-01-26 14:23:00','{\"id\":\"238\",\"userid\":\"oyDfX5RM2NXOVu7sOdBP-1dcPD0Y\",\"groupid\":\"1548483430184\",\"money\":0.16}'),(238,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 15:20:03','{\"id\":\"238\",\"userid\":\"oyDfX5Rx8iXZBkxQB8OmplkzhyDQ\",\"groupid\":\"1548487203947\",\"money\":2.72}'),(238,'oyDfX5S5ruxJEtRWTIq1xRU7FkWY','2019-01-26 14:53:29','{\"id\":\"238\",\"userid\":\"oyDfX5S5ruxJEtRWTIq1xRU7FkWY\",\"groupid\":\"1548484000406\",\"money\":2.33}'),(238,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:58:48','{\"id\":\"238\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"groupid\":\"1548482328457\",\"money\":1.98}'),(238,'oyDfX5SeacO13l9O4VflSzi2LG9U','2019-01-26 14:51:37','{\"id\":\"238\",\"userid\":\"oyDfX5SeacO13l9O4VflSzi2LG9U\",\"groupid\":\"1548485497305\",\"money\":3.21}'),(238,'oyDfX5SQq6oXFqT5Z2zpb_QYE1a8','2019-01-26 14:02:36','{\"id\":\"238\",\"userid\":\"oyDfX5SQq6oXFqT5Z2zpb_QYE1a8\",\"groupid\":\"1548482556739\",\"money\":1.37}'),(238,'oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:35:48','{\"id\":\"238\",\"userid\":\"oyDfX5SsSJUki9JZeSuDyMDQp6HQ\",\"groupid\":\"1548488088248\",\"money\":2.84}'),(238,'oyDfX5SVgYHynM7S3G3DLyVY6a6w','2019-01-26 14:06:30','{\"id\":\"238\",\"userid\":\"oyDfX5SVgYHynM7S3G3DLyVY6a6w\",\"groupid\":\"1548482790787\",\"money\":2.48}'),(238,'oyDfX5SvyYczqfIlSIlGQ2EYtHuQ','2019-01-26 14:05:01','{\"id\":\"238\",\"userid\":\"oyDfX5SvyYczqfIlSIlGQ2EYtHuQ\",\"groupid\":\"1548482701115\",\"money\":0.08}'),(238,'oyDfX5SWCOXRTNs2JU6gvJ4DDQs0','2019-01-26 15:31:24','{\"id\":\"238\",\"userid\":\"oyDfX5SWCOXRTNs2JU6gvJ4DDQs0\",\"groupid\":\"1548486367361\",\"money\":2.58}'),(238,'oyDfX5TD1Fcv_5H_icTzE_N2JpYw','2019-01-26 14:23:06','{\"id\":\"238\",\"userid\":\"oyDfX5TD1Fcv_5H_icTzE_N2JpYw\",\"groupid\":\"1548483786326\",\"money\":0.39}'),(238,'oyDfX5TEyupNwD3a2nuuIO0bGMQE','2019-01-26 15:06:07','{\"id\":\"238\",\"userid\":\"oyDfX5TEyupNwD3a2nuuIO0bGMQE\",\"groupid\":\"1548486367361\",\"money\":0.84}'),(238,'oyDfX5TOzphREg9175rNm15SVCiM','2019-01-26 13:56:26','{\"id\":\"238\",\"userid\":\"oyDfX5TOzphREg9175rNm15SVCiM\",\"groupid\":\"1548482186939\",\"money\":1.34}'),(238,'oyDfX5TQG4pXXvF9VhkjQc1QCts0','2019-01-26 14:16:01','{\"id\":\"238\",\"userid\":\"oyDfX5TQG4pXXvF9VhkjQc1QCts0\",\"groupid\":\"1548483361222\",\"money\":2.32}'),(238,'oyDfX5TrqskZgnKxH05HHogcPJYw','2019-01-26 14:06:50','{\"id\":\"238\",\"userid\":\"oyDfX5TrqskZgnKxH05HHogcPJYw\",\"groupid\":\"1548482701115\",\"money\":2.07}'),(238,'oyDfX5U-ttE7YioegM36yPZCV9K0','2019-01-26 14:43:05','{\"id\":\"238\",\"userid\":\"oyDfX5U-ttE7YioegM36yPZCV9K0\",\"groupid\":\"1548484939067\",\"money\":1.85}'),(238,'oyDfX5U2PlrB9AypXREDyAoMNLXs','2019-01-26 14:24:50','{\"id\":\"238\",\"userid\":\"oyDfX5U2PlrB9AypXREDyAoMNLXs\",\"groupid\":\"1548483890606\",\"money\":0.62}'),(238,'oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 14:27:43','{\"id\":\"238\",\"userid\":\"oyDfX5UNiq30f4u9uMk_e2DYuOeI\",\"groupid\":\"1548482328457\",\"money\":3.49}'),(238,'oyDfX5V2Af_uREWzMK3gqesbVum4','2019-01-26 14:15:24','{\"id\":\"238\",\"userid\":\"oyDfX5V2Af_uREWzMK3gqesbVum4\",\"groupid\":\"1548483126365\",\"money\":2.39}'),(238,'oyDfX5VTceO2h9aCcXoRpMLVgE6Y','2019-01-26 14:02:18','{\"id\":\"238\",\"userid\":\"oyDfX5VTceO2h9aCcXoRpMLVgE6Y\",\"groupid\":\"1548482517842\",\"money\":2.94}'),(238,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:59:40','{\"id\":\"238\",\"userid\":\"oyDfX5W1K1ZNqaq9eqtHgWLtm7D0\",\"groupid\":\"1548482380770\",\"money\":2.71}'),(238,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:14:54','{\"id\":\"238\",\"userid\":\"oyDfX5WdxP2lBmxy1jw-l0gr0PEQ\",\"groupid\":\"1548483294937\",\"money\":2.81}'),(238,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:55:28','{\"id\":\"238\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"groupid\":\"1548482102181\",\"money\":1.75}'),(238,'oyDfX5X6eD_fIPIUMa9J_tne0BUE','2019-01-26 13:57:49','{\"id\":\"238\",\"userid\":\"oyDfX5X6eD_fIPIUMa9J_tne0BUE\",\"groupid\":\"1548482269421\",\"money\":2.93}'),(238,'oyDfX5XkfBcbeDePPRxBMLfVpd7E','2019-01-26 13:54:56','{\"id\":\"238\",\"userid\":\"oyDfX5XkfBcbeDePPRxBMLfVpd7E\",\"groupid\":\"1548482096243\",\"money\":0.29}'),(238,'oyDfX5XLN-qQeFuv8RK7vRQBeAUo','2019-01-26 14:50:36','{\"id\":\"238\",\"userid\":\"oyDfX5XLN-qQeFuv8RK7vRQBeAUo\",\"groupid\":\"1548485436778\",\"money\":2.88}'),(238,'oyDfX5XTol1TvWbw2zyz2VupQ-4E','2019-01-26 14:18:02','{\"id\":\"238\",\"userid\":\"oyDfX5XTol1TvWbw2zyz2VupQ-4E\",\"groupid\":\"1548483294937\",\"money\":2.83}'),(238,'oyDfX5YuuV-mI4BJcsACr2RqGCHU','2019-01-26 14:26:40','{\"id\":\"238\",\"userid\":\"oyDfX5YuuV-mI4BJcsACr2RqGCHU\",\"groupid\":\"1548484000406\",\"money\":3.6}'),(238,'oyDfX5ZM7mPiujg09jcRnxoF9ogY','2019-01-26 15:34:48','{\"id\":\"238\",\"userid\":\"oyDfX5ZM7mPiujg09jcRnxoF9ogY\",\"groupid\":\"1548488088248\",\"money\":0.88}'),(238,'oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 14:02:14','{\"id\":\"238\",\"userid\":\"oyDfX5ZXQllBEVavtpXkmkgk9a1k\",\"groupid\":\"1548482489202\",\"money\":2.17}'),(239,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:11:49','{\"id\":\"239\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.22}'),(239,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 14:14:28','{\"id\":\"239\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":0.23}'),(240,'oyDfX5b-CeE7mo6pR9-GJdJZwMfU','2019-01-26 14:34:49','{\"id\":\"240\",\"userid\":\"oyDfX5b-CeE7mo6pR9-GJdJZwMfU\",\"money\":2.02}'),(240,'oyDfX5cfgLsLSM4_zYnPcMPifB3A','2019-01-26 14:23:12','{\"id\":\"240\",\"userid\":\"oyDfX5cfgLsLSM4_zYnPcMPifB3A\",\"money\":1.91}'),(240,'oyDfX5cSfj9lm4dA8igH5WXH9x0c','2019-01-26 16:46:48','{\"id\":\"240\",\"userid\":\"oyDfX5cSfj9lm4dA8igH5WXH9x0c\",\"money\":3.01}'),(240,'oyDfX5d83HiFcJ004mfhp97Qg7y8','2019-01-26 16:53:53','{\"id\":\"240\",\"userid\":\"oyDfX5d83HiFcJ004mfhp97Qg7y8\",\"money\":1.4}'),(240,'oyDfX5dGLyyJu_BNg4_YdbJjw90w','2019-01-27 12:01:46','{\"id\":\"240\",\"userid\":\"oyDfX5dGLyyJu_BNg4_YdbJjw90w\",\"money\":1.99}'),(240,'oyDfX5dj1yFNeetopkspvllGtx7I','2019-01-26 16:19:28','{\"id\":\"240\",\"userid\":\"oyDfX5dj1yFNeetopkspvllGtx7I\",\"money\":0.28}'),(240,'oyDfX5eCI4y-rDcNYaB7U3fwgRhU','2019-01-26 16:20:47','{\"id\":\"240\",\"userid\":\"oyDfX5eCI4y-rDcNYaB7U3fwgRhU\",\"money\":0.74}'),(240,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 14:23:41','{\"id\":\"240\",\"userid\":\"oyDfX5ScZoPcCxACBiDg4EBbNk_w\",\"money\":0.83}'),(240,'oyDfX5VJ0-UoDbsxCgGdeTkApPAM','2019-01-26 21:06:52','{\"id\":\"240\",\"userid\":\"oyDfX5VJ0-UoDbsxCgGdeTkApPAM\",\"money\":0.55}'),(240,'oyDfX5XM2UE-bh4RaSSgeG9pxZ_I','2019-01-26 15:04:47','{\"id\":\"240\",\"userid\":\"oyDfX5XM2UE-bh4RaSSgeG9pxZ_I\",\"money\":3.03}'),(240,'oyDfX5YX7Ozh6_u2qS7szTYCb9VY','2019-01-26 16:37:04','{\"id\":\"240\",\"userid\":\"oyDfX5YX7Ozh6_u2qS7szTYCb9VY\",\"money\":2.15}'),(240,'oyDfX5ZhIo8mEnb-alfByewjYjrw','2019-01-28 19:53:18','{\"id\":\"240\",\"userid\":\"oyDfX5ZhIo8mEnb-alfByewjYjrw\",\"money\":1.94}'),(241,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 17:53:35','{\"id\":\"241\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.2}'),(241,'oyDfX5VBnWvmQ0E8H9U1JSSIJn90','2019-01-26 18:07:55','{\"id\":\"241\",\"userid\":\"oyDfX5VBnWvmQ0E8H9U1JSSIJn90\",\"money\":0.69}'),(241,'oyDfX5Wwcdqv2_XhMKAczV9m3N50','2019-01-26 17:53:27','{\"id\":\"241\",\"userid\":\"oyDfX5Wwcdqv2_XhMKAczV9m3N50\",\"money\":0.11}'),(243,'o5FAJ4_jUTxneMnTBDPrIIckQbc4','2019-01-28 11:57:28','{\"id\":\"243\",\"userid\":\"o5FAJ4_jUTxneMnTBDPrIIckQbc4\",\"money\":0.14}'),(243,'o5FAJ4_nbRwUYN0NkKfYA61M7ZfM','2019-01-28 12:02:02','{\"id\":\"243\",\"userid\":\"o5FAJ4_nbRwUYN0NkKfYA61M7ZfM\",\"money\":0.07}'),(243,'o5FAJ4_vZcvoe3Im1-8Ni3Iz-Vsc','2019-01-28 11:55:34','{\"id\":\"243\",\"userid\":\"o5FAJ4_vZcvoe3Im1-8Ni3Iz-Vsc\",\"money\":0.34}'),(244,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 16:34:47','{\"id\":\"244\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":0.21}'),(246,'o5FAJ4_nbRwUYN0NkKfYA61M7ZfM','2019-01-28 19:00:15','{\"id\":\"246\",\"userid\":\"o5FAJ4_nbRwUYN0NkKfYA61M7ZfM\",\"money\":0.29}'),(248,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-28 20:59:40','{\"id\":\"248\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.53}'),(248,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 21:12:33','{\"id\":\"248\",\"userid\":\"oyDfX5eYyLCts6wAStZu4NabD3TM\",\"money\":0.47}'),(249,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 17:36:01','{\"id\":\"249\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.26}'),(249,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-29 17:44:10','{\"id\":\"249\",\"userid\":\"oyDfX5WdxP2lBmxy1jw-l0gr0PEQ\",\"money\":0.09}'),(249,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:25:15','{\"id\":\"249\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":0.32}'),(250,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 17:36:24','{\"id\":\"250\",\"userid\":\"oyDfX5b0SSyHlVzF5lwnTtKqYkx0\",\"money\":0.71}'),(250,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-29 17:44:27','{\"id\":\"250\",\"userid\":\"oyDfX5WdxP2lBmxy1jw-l0gr0PEQ\",\"money\":0.38}'),(250,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:28:00','{\"id\":\"250\",\"userid\":\"oyDfX5X4MLLvhNYnKRmIVUag1ask\",\"money\":0.3}');
/*!40000 ALTER TABLE `bus_redbag_join` ENABLE KEYS */;
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
INSERT INTO `bus_redbag_order` VALUES ('0b5f2e4d-2129-11e9-8b8a-6c92bf48246b','2019-01-26 13:12:57','B-1548479577',0,229,10.00,0.20,10.20,1,'2019-01-26 13:13:04',NULL,NULL,NULL,NULL),('13af3454-23a8-11e9-8b8a-6c92bf48246b','2019-01-29 17:27:20','B-1548754047',0,250,2.00,0.04,2.04,1,'2019-01-29 17:27:35',NULL,NULL,NULL,NULL),('1e423f0d-212c-11e9-8b8a-6c92bf48246b','2019-01-26 13:34:58','B-1548480898',0,235,10.00,0.20,10.20,1,'2019-01-26 13:35:06',NULL,NULL,NULL,NULL),('224c497c-2150-11e9-8b8a-6c92bf48246b','2019-01-26 17:52:46','B-1548496366',0,241,1.00,0.02,1.02,1,'2019-01-26 17:52:53',NULL,NULL,NULL,NULL),('2e57c508-212a-11e9-8b8a-6c92bf48246b','2019-01-26 13:21:06','B-1548480066',0,231,10.00,0.20,10.20,1,'2019-01-26 13:21:15',NULL,NULL,NULL,NULL),('4e85cf61-212b-11e9-8b8a-6c92bf48246b','2019-01-26 13:29:09','B-1548480549',0,233,1.00,0.02,1.02,1,'2019-01-26 13:29:28',NULL,NULL,NULL,NULL),('566b10e1-212d-11e9-8b8a-6c92bf48246b','2019-01-26 13:43:41','B-1548481448',0,236,1.00,0.02,1.02,1,'2019-01-26 13:44:14',NULL,NULL,NULL,NULL),('56d9ad6c-212b-11e9-8b8a-6c92bf48246b','2019-01-26 13:29:23','B-1548480563',0,234,10.00,0.20,10.20,1,'2019-01-26 13:29:31',NULL,NULL,NULL,NULL),('577abeee-22ae-11e9-8b8a-6c92bf48246b','2019-01-28 11:39:39','B-1548646779',1,243,1.00,0.02,1.02,1,'2019-01-28 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 11:41:47','','redbag/orderimage/951c35d2-db03-4a56-a005-3100d615ec7f.png'),('5982891b-2129-11e9-8b8a-6c92bf48246b','2019-01-26 13:15:09','B-1548479709',0,230,10.00,0.20,10.20,1,'2019-01-26 13:15:18',NULL,NULL,NULL,NULL),('727233b2-22ed-11e9-8b8a-6c92bf48246b','2019-01-28 19:11:23','B-1548673883',0,247,1.00,0.02,1.02,1,'2019-01-28 19:11:30',NULL,NULL,NULL,NULL),('79b1e469-2152-11e9-8b8a-6c92bf48246b','2019-01-26 18:09:32','B-1548497372',0,242,1.00,0.02,1.02,0,NULL,NULL,NULL,NULL,NULL),('7fa15afb-22fc-11e9-8b8a-6c92bf48246b','2019-01-28 20:59:07','B-1548680347',1,248,1.00,0.02,1.02,1,'2019-01-28 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 20:59:17','','redbag/orderimage/c02cd63e-8ca4-4108-afb8-97b400e039d2.jpg'),('85230e00-2132-11e9-8b8a-6c92bf48246b','2019-01-26 14:20:47','B-1548483692',0,240,28.00,0.56,28.56,1,'2019-01-26 14:21:40',NULL,NULL,NULL,NULL),('a43edfa2-23a7-11e9-8b8a-6c92bf48246b','2019-01-29 17:24:13','B-1548753853',0,249,1.00,0.02,1.02,1,'2019-01-29 17:24:20',NULL,NULL,NULL,NULL),('a9cbd1c6-212a-11e9-8b8a-6c92bf48246b','2019-01-26 13:24:33','B-1548480273',0,232,4.00,0.08,4.08,1,'2019-01-26 13:24:41',NULL,NULL,NULL,NULL),('af38ea6e-2121-11e9-8b8a-6c92bf48246b','2019-01-26 12:20:16','B-1548476416',0,228,50.00,1.00,51.00,1,'2019-01-26 12:20:24',NULL,NULL,NULL,NULL),('b0e6f820-22eb-11e9-8b8a-6c92bf48246b','2019-01-28 18:58:49','B-1548673129',1,246,2.00,0.04,2.04,1,'2019-01-28 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 18:59:21','','redbag/orderimage/92e85314-0f50-4a6c-82c6-03093434c0e5.png'),('be3f4c8f-212e-11e9-8b8a-6c92bf48246b','2019-01-26 13:53:45','B-1548482025',0,238,100.00,2.00,102.00,1,'2019-01-26 13:53:54',NULL,NULL,NULL,NULL),('cfc5f9eb-212d-11e9-8b8a-6c92bf48246b','2019-01-26 13:47:05','B-1548481625',0,237,2.00,0.04,2.04,1,'2019-01-26 13:47:15',NULL,NULL,NULL,NULL),('d7a8d498-22d2-11e9-8b8a-6c92bf48246b','2019-01-28 16:00:56','B-1548662456',1,244,1.00,0.02,1.02,1,'2019-01-28 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 16:01:08','','redbag/orderimage/a486813a-b0eb-4ce8-81ac-ae149d0f5c52.png'),('d8577f8a-22e8-11e9-8b8a-6c92bf48246b','2019-01-28 18:38:26','B-1548671906',1,245,2.00,0.04,2.04,1,'2019-01-28 00:00:00','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 18:39:01','','redbag/orderimage/cfe232a5-82bf-4f9d-9252-1efa251f00c9.png'),('e358f26f-2130-11e9-8b8a-6c92bf48246b','2019-01-26 14:09:06','B-1548482946',0,239,1.00,0.02,1.02,1,'2019-01-26 14:09:15',NULL,NULL,NULL,NULL);
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
INSERT INTO `crm_user` VALUES ('osDAK4-b6jbKQ4sLBILt1e83p7Ec',NULL,'osDAK4-b6jbKQ4sLBILt1e83p7Ec',NULL,NULL,NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-24 12:56:02',2,NULL,NULL,NULL),('osDAK42fDN8gBMR8Qjd05eJeq9mQ',NULL,'osDAK42fDN8gBMR8Qjd05eJeq9mQ',NULL,'刘盼。','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLsThiaOiaRYUOempQNW0tRo2sCzn2TiaxWnicWYsFInvWNlEaMwNWeIcBBn4Mm46ddaMicXs5hcTyNDCA/132',1,'Guangzhou',NULL,0,0.00,0.00,0.00,'2019-01-22 21:23:34',6,NULL,NULL,NULL),('osDAK4w9B1eJRORKjlfvGFd1xowU',NULL,'osDAK4w9B1eJRORKjlfvGFd1xowU',NULL,'用户B',NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-23 00:15:23',2,NULL,NULL,NULL),('oyDfX5a2SSJzTBl3kCu9pSlPcMbI',NULL,'oyDfX5a2SSJzTBl3kCu9pSlPcMbI',NULL,'凡俄','https://wx.qlogo.cn/mmopen/vi_32/UDytZNHRFZQYlLjvYw56ibqicc8EXUjxFy9iaulVVj1TLRlsBw4qr1puQj9XiaQlbCKPiaobKYRVic7087xibCfwIu5VA/132',2,'Dongguan',NULL,0,NULL,NULL,NULL,'2019-01-27 11:45:12',3,NULL,NULL,NULL),('oyDfX5afT824em9JybnRAmjHkMtI',NULL,'oyDfX5afT824em9JybnRAmjHkMtI',NULL,'莴苣','https://wx.qlogo.cn/mmopen/vi_32/7iawy1AvvotMCRvUJQPzmy9hnpg3KianHicrMQLbXthMWzHzGGXYZXY3nm4XZ8lkyCEXv5tvxRhaXfqWygAPwMIIQ/132',1,'',NULL,0,0.00,1.73,NULL,'2019-01-26 14:11:29',3,NULL,NULL,NULL),('oyDfX5aievlZKOjidnp2B0qhJtvA',NULL,'oyDfX5aievlZKOjidnp2B0qhJtvA',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:18:38',1,NULL,NULL,NULL),('oyDfX5aO7IMyUCceE_gW8ToME_iw',NULL,'oyDfX5aO7IMyUCceE_gW8ToME_iw',NULL,'A段某','https://wx.qlogo.cn/mmopen/vi_32/QasqUicA5VjYqIXOKribTs6f2tNC1P3SfW261rwV0LSDAMOkKb9icuW6FGGNH9ZyzHC9CBHibyHpBbciaeU96qELJ8Q/132',1,'Shenzhen',NULL,0,NULL,NULL,NULL,'2019-01-26 15:28:11',2,NULL,NULL,NULL),('oyDfX5aqOeGI7dnuER3v4XCCQozs',NULL,'oyDfX5aqOeGI7dnuER3v4XCCQozs',NULL,'徐萍','https://wx.qlogo.cn/mmopen/vi_32/AGfqVSNctLibhIkS1LlNLX7p4LHtYprQwwrDKSgPRpxYONgab0oFhqU4UjBicXnXFNKDnZP6BEnndnBNg83hxO7w/132',0,'',NULL,0,0.00,3.57,NULL,'2019-01-26 14:48:53',4,NULL,NULL,NULL),('oyDfX5axP8BTx_8WBe2FVbpnb1JQ',NULL,'oyDfX5axP8BTx_8WBe2FVbpnb1JQ',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 19:47:41',1,NULL,NULL,NULL),('oyDfX5aYMlQAGPgGcdOpHRqIblPA',NULL,'oyDfX5aYMlQAGPgGcdOpHRqIblPA',NULL,'金一旅游 | 余华','https://wx.qlogo.cn/mmopen/vi_32/eDuuDHZDh9SibtibMWleSFVJ9Lz0EeWcvRMw7bMSaRicChyKFYnyswOicfmXU2S8o9R8ojbuwGImJCMZV792DTAE7g/132',1,'Shenzhen',NULL,0,NULL,NULL,NULL,'2019-01-26 21:32:28',2,NULL,NULL,NULL),('oyDfX5b-CeE7mo6pR9-GJdJZwMfU',NULL,'oyDfX5b-CeE7mo6pR9-GJdJZwMfU',NULL,'老兔哥','https://wx.qlogo.cn/mmopen/vi_32/atSeLy8M7ib5Z7XvOrR8zw4ds3NyugSKuvGslVltj4AQibOXyMjicsaHReVpfC4c9OQH4g2OyMTZ5jvFxwAVFPW3w/132',1,'',NULL,0,0.00,2.02,NULL,'2019-01-26 14:34:37',2,NULL,NULL,NULL),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0',NULL,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0',NULL,'刘盼。','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLMVWHkmYwC945JFD38N0UazCgumbY10GUf1UmJhGYBicwaqTqvl2rVxu0hhjbJcJCQ8bFVppqyVzA/132',1,'Guangzhou',NULL,0,0.00,17.64,4.00,'2019-01-22 18:19:18',1095,NULL,NULL,NULL),('oyDfX5b4J-XqvmJ5QR_69rqC48gE',NULL,'oyDfX5b4J-XqvmJ5QR_69rqC48gE',NULL,'小芋?','https://wx.qlogo.cn/mmopen/vi_32/iaiatMOZb1OjpPr5YRFqkwMJWmJ0ypOlTZjADmlpELhkUQDVzshIQkUuAmqjSCicL8VNYgUBM24IiaUv2FicgjlaaSQ/132',0,'',NULL,0,0.94,0.94,NULL,'2019-01-26 14:43:43',3,NULL,NULL,NULL),('oyDfX5bmIWtOG2lfxWm0S_tUiky4',NULL,'oyDfX5bmIWtOG2lfxWm0S_tUiky4',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:00:08',1,NULL,NULL,NULL),('oyDfX5bMRXzoc1i9EY4c9cJgjF0E',NULL,'oyDfX5bMRXzoc1i9EY4c9cJgjF0E',NULL,'曾新发','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLOXbJcxicpp0JUAaYTqlqOnp59cBhaibq16mMRcKQ5tF2yIaws6iaFzauOFica09AichsIibBicTrXueWibg/132',1,'Shaoyang',NULL,0,NULL,NULL,NULL,'2019-01-26 18:55:31',4,NULL,NULL,NULL),('oyDfX5bmuMlxPiglek-dEMvZccpg',NULL,'oyDfX5bmuMlxPiglek-dEMvZccpg',NULL,'何以话秋伤','https://wx.qlogo.cn/mmopen/vi_32/83cenYt3ON5LpT5bZuUIYeno81hibZEeoCtLUicGW2wVSDs6PGXic3aqK2xdDCGyp31UMWtdXAEOo6nUwBk0vfcYw/132',2,'Shaoyang',NULL,0,NULL,NULL,NULL,'2019-01-26 15:20:53',2,NULL,NULL,NULL),('oyDfX5bXeLUabBzhTkw2TcB6O69g',NULL,'oyDfX5bXeLUabBzhTkw2TcB6O69g',NULL,'葵籽','https://wx.qlogo.cn/mmopen/vi_32/Vyp4M6p2n0tZxqibClJwibyFicZeDaskpa1jmaAdJER7sIpCudiaPt4g8t7eTibGBFRbD0IAGzrEQ03yq3t3ZOUCc8g/132',1,'Fuzhou',NULL,0,0.00,3.60,NULL,'2019-01-26 14:16:33',3,NULL,NULL,NULL),('oyDfX5b_znA1RYiZoEYbtMy0bMtU',NULL,'oyDfX5b_znA1RYiZoEYbtMy0bMtU',NULL,'璐少【号满请加2223310】','https://wx.qlogo.cn/mmopen/vi_32/0JicKHelwfgbMwmwYDwuVACpgx7uhLSv53s3aC4fKiaiczaia20zPJDwu5nsR8Qw7UloOibj4CMicgqfbQf2mbz1EwRQ/132',1,'Yangyang',NULL,0,NULL,NULL,NULL,'2019-01-26 14:19:54',2,NULL,NULL,NULL),('oyDfX5c7Uktu8vRmSucVB8wpcNDg',NULL,'oyDfX5c7Uktu8vRmSucVB8wpcNDg',NULL,'Caolx','https://wx.qlogo.cn/mmopen/vi_32/NBu2Ln1hjFfiayIK3gZEAdOUJLuyicrwLCB9Xtvnd048vgIvJ6JO5UiatlhiawnapBzHqEu7jGWMJZx9LuxufFwjew/132',1,'Guangzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 18:06:20',2,NULL,NULL,NULL),('oyDfX5cCVQzoGvWLB4-R8lErGqvQ',NULL,'oyDfX5cCVQzoGvWLB4-R8lErGqvQ',NULL,'乐@女且','https://wx.qlogo.cn/mmopen/vi_32/x8Ve0VtmJ5icTEIz1zuibKMjiaR8fUibYn1KWkiaD7hMcMbOiaJvjNibt2dbKFGRK0tO6QgTobAzRwNtDjS4jCC8re3icA/132',2,'Fuzhou',NULL,0,0.00,1.95,NULL,'2019-01-26 14:10:04',2,NULL,NULL,NULL),('oyDfX5cfgLsLSM4_zYnPcMPifB3A',NULL,'oyDfX5cfgLsLSM4_zYnPcMPifB3A',NULL,'尾巴','https://wx.qlogo.cn/mmopen/vi_32/hBV3ichhl4jRhxbNm6bLtsl8XEDCPCjGiaGvicz1rBibC2IhKA4F0klAWHiayVNJfRww5fSx4SsVWk44ZD1ibFfnGhjg/132',1,'Wulong',NULL,0,0.00,1.91,NULL,'2019-01-26 14:23:01',2,NULL,NULL,NULL),('oyDfX5cGRGei85NTw9708bKAp8ZU',NULL,'oyDfX5cGRGei85NTw9708bKAp8ZU',NULL,NULL,NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-24 16:43:17',2,NULL,NULL,NULL),('oyDfX5cOmNaS6GoW7kn8zVeCMsWY',NULL,'oyDfX5cOmNaS6GoW7kn8zVeCMsWY',NULL,'Wei?Wei','https://wx.qlogo.cn/mmopen/vi_32/aLcKeoLJRECVKjs3Ujyia241iaQjlsmUNDIvPaYicSia0Yn10XeJ1DWo6ofbwtECx9NWU7abgYaYjtxOepd8ed5P7A/132',2,'Zhuzhou',NULL,0,0.00,3.36,NULL,'2019-01-26 13:53:44',2,NULL,NULL,NULL),('oyDfX5cpTzO9KUoEJ6QEQhy4ZLiA',NULL,'oyDfX5cpTzO9KUoEJ6QEQhy4ZLiA',NULL,'老司机','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erribc6icEaVYFuOz0Gl5KoiaVlYnN5QV6VF7ldX3oCoZibfmdbocK6eyQictYrYtl01RE6ZIDhct2IibGg/132',0,'',NULL,0,0.98,0.98,NULL,'2019-01-26 14:51:19',3,NULL,NULL,NULL),('oyDfX5cSfj9lm4dA8igH5WXH9x0c',NULL,'oyDfX5cSfj9lm4dA8igH5WXH9x0c',NULL,'?Cimen G?','https://wx.qlogo.cn/mmopen/vi_32/LcvMdDFY9v87Re5OpRSnibNGKzMdfAQBq7tOTdzGBXDZyxIFNEVSgqurv5q0tiaWP6iamj65QKcGPtDQTG9EjDaQQ/132',2,'Guangzhou',NULL,0,0.00,3.01,NULL,'2019-01-26 16:46:28',2,NULL,NULL,NULL),('oyDfX5cuLoUwFP2lRAYlGx0f9cwo',NULL,'oyDfX5cuLoUwFP2lRAYlGx0f9cwo',NULL,'邬玲玲【O.STYLE黑科技引爆】','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep36fGkiakENu4osPoHjDyx5CibHuuxsT8GPJic5YIESYtGNyu4y2mRUx4NoQeqzXZI2X6UoCovvYYRA/132',2,'Taizhou',NULL,0,NULL,NULL,NULL,'2019-01-29 13:57:05',2,NULL,NULL,NULL),('oyDfX5cvlK0Bz5rmZCRXI10nS8B8',NULL,'oyDfX5cvlK0Bz5rmZCRXI10nS8B8',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:32:52',2,NULL,NULL,NULL),('oyDfX5cxd9Mx0qB0roNxgcTqn_g0',NULL,'oyDfX5cxd9Mx0qB0roNxgcTqn_g0',NULL,'龚孙策@好实用新商业模式落地','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJOn4HL87I8TIv8dUGoxhtExT9z8daq4alWgvGTo9PdoaicOtNb1yZsHO3ZQuUsvhd6iaQE1ZjIjcOA/132',1,'Quanzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 16:57:27',2,NULL,NULL,NULL),('oyDfX5cyuFYDNyEs1wEN-JEsj1lA',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA',NULL,'林诗涵','https://wx.qlogo.cn/mmhead/CsicRlgnXvRMUj1OVU18UNS1icickfmWMgFrXu74xqmuRw/132',0,'',NULL,0,0.00,0.00,0.00,'2019-01-25 14:12:31',8,NULL,NULL,NULL),('oyDfX5cz30kK5UyCYFdVcVDAXmHA',NULL,'oyDfX5cz30kK5UyCYFdVcVDAXmHA',NULL,'吴宗林森林平台(华为营销手机)6','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJtYjViaC9SeF2QRNe2ldWqAtydEEJ5OgJUnmibl3UCNrP4Cib8mdgicibu5Ym69XQgu1XkT2gMneWV0OQ/132',1,'Fuzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 23:18:33',3,NULL,NULL,NULL),('oyDfX5d4RY0RZ7Ct0IrrJX8rI7CM',NULL,'oyDfX5d4RY0RZ7Ct0IrrJX8rI7CM',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 15:17:34',1,NULL,NULL,NULL),('oyDfX5d83HiFcJ004mfhp97Qg7y8',NULL,'oyDfX5d83HiFcJ004mfhp97Qg7y8',NULL,'yoyo','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJGV5THMoGPRV5icMJicyvaDdlAQSSicEVfDSTdIr3uh9bW9J1lGjnl4woDpeCmRdcwCtS0xbT8CTPAg/132',2,'',NULL,0,1.40,1.40,NULL,'2019-01-26 16:53:44',2,NULL,NULL,NULL),('oyDfX5dGJXt8DAqn7Bgf4wnlx7_s',NULL,'oyDfX5dGJXt8DAqn7Bgf4wnlx7_s',NULL,'猫说','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLNYS39bBw8kZVviaYaS19w8C9slkd5UO02Qmdw9DuCM2iccAtcXvM8IAp7hDCXm9RgPVpjXtnN3XLQ/132',0,'',NULL,0,NULL,NULL,NULL,'2019-01-26 14:03:18',2,NULL,NULL,NULL),('oyDfX5dGLyyJu_BNg4_YdbJjw90w',NULL,'oyDfX5dGLyyJu_BNg4_YdbJjw90w',NULL,'曦','https://wx.qlogo.cn/mmopen/vi_32/8N44zrIaqfr6sq8Rg9Cy1ia7Vt6Y73xsV1QZUmPPsv7RqY0l9U1GmT13a1JeM4GkXETjjiaMunvnzLZhMtzLk87g/132',0,'',NULL,0,1.99,1.99,NULL,'2019-01-27 12:01:32',2,NULL,NULL,NULL),('oyDfX5dIu2f4d6hFU2kJ6kpu4YmM',NULL,'oyDfX5dIu2f4d6hFU2kJ6kpu4YmM',NULL,'　　　　　货','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIPkl4OMrA69NvBVUkWyedWSZ9ia7GjKIcibok3yLEicpCvqeJS3ichCfjmvLpjqgarwlhsGdc5rAKEbA/132',2,'',NULL,0,0.00,2.57,NULL,'2019-01-26 13:55:54',2,NULL,NULL,NULL),('oyDfX5dj1yFNeetopkspvllGtx7I',NULL,'oyDfX5dj1yFNeetopkspvllGtx7I',NULL,'重庆杰鸥科技(智家人指纹锁)','https://wx.qlogo.cn/mmopen/vi_32/8icSiaknONYaE2m7GSozdibVzdqx2TLEF6kxElJIJicUbBWqPuAXiaV9nEicn9u4cI8IOnx0vV6QATy6SCx4ylZdicoKw/132',1,'South Bank',NULL,0,0.28,0.28,NULL,'2019-01-26 16:19:19',2,NULL,NULL,NULL),('oyDfX5dkIOv_O7F1eIu0NgUqCls0',NULL,'oyDfX5dkIOv_O7F1eIu0NgUqCls0',NULL,'心心','https://wx.qlogo.cn/mmopen/vi_32/xzaIew8zNic4xjFcYlInwBdibEtqib1iaRAlcgNSRNciafRAo8MHH6iaEnxagQIgic0E6ASvPSIRBwSWjJ4avHpibL65ibg/132',2,'Changsha',NULL,0,NULL,NULL,NULL,'2019-01-26 14:57:14',2,NULL,NULL,NULL),('oyDfX5dmLx1ZAgP-Er0g_n0GTbw0',NULL,'oyDfX5dmLx1ZAgP-Er0g_n0GTbw0',NULL,'刘俊辰-明盟教主','https://wx.qlogo.cn/mmopen/vi_32/62mQ8ibGZtvNn8PlhUnZqniaK9NLibg2GF4kqGb5xWScM8JRleoExiamL4JfNH12kpHhY4kufYRjGPky8zzPpA8cIA/132',1,'Guangzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 17:43:01',2,NULL,NULL,NULL),('oyDfX5dMTCNO1gSATbyLUTDPtRvQ',NULL,'oyDfX5dMTCNO1gSATbyLUTDPtRvQ',NULL,'chief','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eolCJZV3gELicnQUU7QRxJC2xlCleJlzbibU3mufe2k0gWxVQmiaY0YLb9DDr2CWUnjNVgrcxZ94oAPg/132',1,'Chaoyang',NULL,0,NULL,NULL,NULL,'2019-01-26 14:48:26',2,NULL,NULL,NULL),('oyDfX5dqwXoXeL3bh-Uu_KLqbGL8',NULL,'oyDfX5dqwXoXeL3bh-Uu_KLqbGL8',NULL,'Min','https://wx.qlogo.cn/mmopen/vi_32/kSKeGH3869WibjRXvsz73EicpQ6orJuMAFgh449ibE58d8GDj60nhjdZkQrJAial1rnGDJHky2suvklzTqOG59ArKw/132',1,'Shanwei',NULL,0,NULL,NULL,NULL,'2019-01-29 10:52:24',2,NULL,NULL,NULL),('oyDfX5dueYtDOZfLG1Qc1fwqI2hk',NULL,'oyDfX5dueYtDOZfLG1Qc1fwqI2hk',NULL,'友你友我','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJQB4nQpb8AhnT60hibxrQvCrhibDKRN93mxaQgLhiaIibiauQOOpwV6tuplzRZxoibgHwspSXkaruYYzoQ/132',1,'Zhanjiang',NULL,0,NULL,NULL,NULL,'2019-01-26 14:32:04',2,NULL,NULL,NULL),('oyDfX5eCI4y-rDcNYaB7U3fwgRhU',NULL,'oyDfX5eCI4y-rDcNYaB7U3fwgRhU',NULL,'pas','https://wx.qlogo.cn/mmopen/vi_32/gSLGbrBdhO7icP12kHRlDg2obswceXtEneYUFJtRjSSPxeibQUzmGtnXhgZcBgE28DQXpQSGrspqnW5qZF9oCLicw/132',2,'',NULL,0,0.74,0.74,NULL,'2019-01-26 16:20:37',2,NULL,NULL,NULL),('oyDfX5eGfFB0-CTEXwTtp4qETziw',NULL,'oyDfX5eGfFB0-CTEXwTtp4qETziw',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 13:05:41',1,NULL,NULL,NULL),('oyDfX5eh_5M0QNEg2ij4z4thtJYQ',NULL,'oyDfX5eh_5M0QNEg2ij4z4thtJYQ',NULL,'AA??旗记联创&高雪梅','https://wx.qlogo.cn/mmopen/vi_32/oA5Z0OKviaiamFlrPOQPLzAbPibq95n6hu55WlFPkVXeo1U0IBVoTPkkdx3b6uz07R3kFnDGonHMP0CCkxw2B4zTQ/132',2,'Xuzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 22:49:05',2,NULL,NULL,NULL),('oyDfX5eKWm6GwZqa51qzoOstKc6k',NULL,'oyDfX5eKWm6GwZqa51qzoOstKc6k',NULL,'沐沐','https://wx.qlogo.cn/mmopen/vi_32/hBV3ichhl4jRhxbNm6bLtsia2EISewqwfXLZPibMTaq41FuCDNWUJXffuV6A7ibEpfAvvDdol0ribB4LVtIoZX2Ss1g/132',0,'',NULL,0,0.44,0.44,NULL,'2019-01-26 14:01:41',2,NULL,NULL,NULL),('oyDfX5eogADCmR8x4GEHI8SMcEtE',NULL,'oyDfX5eogADCmR8x4GEHI8SMcEtE',NULL,'阿国','https://wx.qlogo.cn/mmopen/vi_32/7LeOtz6273bay6bSZ6Yu3DPeUkFekA1lrgkwf12Hicer34JMtxQFluHSztbMR0F2TgposCh3xFFicI62F8Jia8sKQ/132',1,'Guangzhou',NULL,0,0.00,3.91,NULL,'2019-01-26 17:35:21',2,NULL,NULL,NULL),('oyDfX5euBR-XawFBEdTU1mUrem6U',NULL,'oyDfX5euBR-XawFBEdTU1mUrem6U',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 17:07:44',1,NULL,NULL,NULL),('oyDfX5eXQ_DEdY9hSXikalLCaFDo',NULL,'oyDfX5eXQ_DEdY9hSXikalLCaFDo',NULL,'沸点天下合伙人小胖','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKaklLIZbibqXRJsqbLYYZMPQ4Oia4e9X6ibGhRBvZ7UnMpJQvibkXE6Jss1LyWRV21nh4Wkc5G16NowA/132',1,'Shenzhen',NULL,0,0.00,3.93,NULL,'2019-01-26 13:55:39',2,NULL,NULL,NULL),('oyDfX5eYyLCts6wAStZu4NabD3TM',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM',NULL,'古惑狼?','https://wx.qlogo.cn/mmopen/vi_32/PiauZcrbMRlO89coKIo23cLJmiaaLRQCOca1iafaE55VIFChZajqtojsk1uRj5Dtdthbic7yzMkMws6DnHFv6owqRg/132',1,'Shaoyang',NULL,0,1.91,8.41,58.00,'2019-01-22 21:25:31',457,NULL,NULL,NULL),('oyDfX5eYZMMc1Sy6Q7e0kWPZVio8',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8',NULL,'王易®','https://wx.qlogo.cn/mmopen/vi_32/ZFUicG8wzsaFmK0ggtvf4bnGpxAypLaNVUWWtZiao4veXVL3QHxaKWVia0tMFibXuoCGc0jicGkljib8HatTKGoZWicTA/132',1,'Guangzhou',NULL,0,7.01,7.01,100.00,'2019-01-26 13:43:23',5,NULL,NULL,NULL),('oyDfX5f1fMp6GiN5lUNGYYpm4h0M',NULL,'oyDfX5f1fMp6GiN5lUNGYYpm4h0M',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 16:05:46',2,NULL,NULL,NULL),('oyDfX5f3VzyOzwe6gX9XozrlPwBQ',NULL,'oyDfX5f3VzyOzwe6gX9XozrlPwBQ',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 23:53:54',2,NULL,NULL,NULL),('oyDfX5f68NrJwDN9uo9ks9w0VWjs',NULL,'oyDfX5f68NrJwDN9uo9ks9w0VWjs',NULL,'瞬间','https://wx.qlogo.cn/mmopen/vi_32/QgLib9z7O8ZWIB9jLPgZermEBpmOKjx8nEybFxacKem1oqbgTomKWyLRdSrX52yneWqWICR3AEnYQoIcTOgyB1w/132',0,'',NULL,0,0.77,0.77,NULL,'2019-01-26 15:50:41',2,NULL,NULL,NULL),('oyDfX5fB7INZsJOHuZgQi_gLqTlE',NULL,'oyDfX5fB7INZsJOHuZgQi_gLqTlE',NULL,'老根','https://wx.qlogo.cn/mmopen/vi_32/o6burK51W4pM9mgCWTSZzMuQ14MGq5eLULibaUSCoraiad69nuibCWiamHoPAwquw0VYibv6zlghSLt9jPh92OJRB3g/132',0,'',NULL,0,0.31,5.41,NULL,'2019-01-26 12:50:23',3,NULL,NULL,NULL),('oyDfX5fEd-sVl30oGT5PmaTm7Xok',NULL,'oyDfX5fEd-sVl30oGT5PmaTm7Xok',NULL,'哈哈','https://wx.qlogo.cn/mmopen/vi_32/Vm5JnFicdicfJhqcicgInmmZqylaM5vqPDamrr7eGkaFtibIzpmeicByQUUDBATu91m1G6gqz1iayBribP0ZtOCPWMybA/132',1,'Guangzhou',NULL,0,0.00,1.49,NULL,'2019-01-26 14:42:12',4,NULL,NULL,NULL),('oyDfX5fICPIXLtdsF4pC1ppA8vW4',NULL,'oyDfX5fICPIXLtdsF4pC1ppA8vW4',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 17:31:31',1,NULL,NULL,NULL),('oyDfX5fpdUM_PaPyAvbnwcqkMibA',NULL,'oyDfX5fpdUM_PaPyAvbnwcqkMibA',NULL,'杨柏溪','https://wx.qlogo.cn/mmopen/vi_32/dgpdLffLH7mZ7AjUCpjJm9icCAeCERCqJt47xnsqibUemk4W8vSqHU6IabSIsLda8oRVBZQLB03jk9HVicMpObdgQ/132',2,'Fuzhou',NULL,0,0.00,1.40,NULL,'2019-01-26 13:56:45',2,NULL,NULL,NULL),('oyDfX5fQDvK0ypGQynW58gfEKtM4',NULL,'oyDfX5fQDvK0ypGQynW58gfEKtM4',NULL,'珃','https://wx.qlogo.cn/mmopen/vi_32/j2F1qiaK3Bt5kMWMpLZzzzzH5kULwkrZnvO6GdCla4YxMvSjCxgmr5nnibCuxwyxwsTF1EW5sydm7M529m06K8gA/132',2,'',NULL,0,0.83,0.83,NULL,'2019-01-26 13:54:20',2,NULL,NULL,NULL),('oyDfX5fSGedbGYlw_voUKaREj4eE',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE',NULL,'徐姿妤','https://wx.qlogo.cn/mmhead/Ichib5hYyuKHqIJhbleK5N66aNUSFdgKxicyJgwVW1pz0/132',0,'',NULL,0,0.00,0.00,0.00,'2019-01-24 14:16:17',5,NULL,NULL,NULL),('oyDfX5fSoDQas5aWB_VzQX4TFaTE',NULL,'oyDfX5fSoDQas5aWB_VzQX4TFaTE',NULL,'方萍','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epOwcRW04Zc9lHmbhmGgcWg0XqEBDAZ3c3otvCibdIOnah8Drkc2QVpZ2eQiaIVHMOKUmLEczyynvog/132',0,'',NULL,0,NULL,NULL,NULL,'2019-01-26 14:47:23',3,NULL,NULL,NULL),('oyDfX5QBJ-fl9qAqeZbtey67GSys',NULL,'oyDfX5QBJ-fl9qAqeZbtey67GSys',NULL,'诚龙','https://wx.qlogo.cn/mmopen/vi_32/lq6qib3uz9buiarPicF2TEMloHNheCTgHeYic6DcykQ9hCUaj5GOvfyRJGmXmoSHcphkzLgu0icicSJQFtiarwuLbkIVQ/132',1,'Shantou',NULL,0,NULL,NULL,NULL,'2019-01-26 14:24:26',2,NULL,NULL,NULL),('oyDfX5QGaEyz5o1D9to-i5pkPK_A',NULL,'oyDfX5QGaEyz5o1D9to-i5pkPK_A',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 13:26:31',3,NULL,NULL,NULL),('oyDfX5QiHvIFwIpTQDzQjg_oL4Ks',NULL,'oyDfX5QiHvIFwIpTQDzQjg_oL4Ks',NULL,'Mr.叶','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erLmtswicfmSdlNnbiamv0ZrTeV79k7zrqThntJZ2wjpndic6ZHj089EdztLXZiaQhu4HmZiaOMthFgOBg/132',1,'Shenzhen',NULL,0,NULL,NULL,NULL,'2019-01-26 13:57:26',2,NULL,NULL,NULL),('oyDfX5QpxQZo79CDGaBLNI-7Owz0',NULL,'oyDfX5QpxQZo79CDGaBLNI-7Owz0',NULL,'微神·好几个亿新微商系统','https://wx.qlogo.cn/mmopen/vi_32/C3E6AG66Cg9UwGf3kfiad6K77aOo9RGBaoqRx7aFEzDKEVDluNMtJibmibG6CCcLFYftv5TqBAG3btwGicFiaib12k5A/132',1,'Zhongshan',NULL,0,NULL,NULL,NULL,'2019-01-26 14:32:02',2,NULL,NULL,NULL),('oyDfX5R1SCrP81OsPNbr7f7OTxwQ',NULL,'oyDfX5R1SCrP81OsPNbr7f7OTxwQ',NULL,'洋哥','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqHjfog74uRbCl6JIwibgQ3q1lyLIpvpwg69N6tcy44r5iaXn8Gd5zdalZRGxicM929wAiaHEJIgiaNbKQ/132',1,'Fuzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 16:37:07',2,NULL,NULL,NULL),('oyDfX5R7kgUoX4lkIhPdGhEKOTkY',NULL,'oyDfX5R7kgUoX4lkIhPdGhEKOTkY',NULL,'华哈哈','https://wx.qlogo.cn/mmopen/vi_32/LN8Wm1s7660jX9VjNox8KDseY1RyYTWkUwmgYB1hD1jFrLa1fBicjeUACecuxphm88uZsA0Rn0WiaIP6TD6gQUEw/132',0,'',NULL,0,NULL,NULL,NULL,'2019-01-26 15:30:54',2,NULL,NULL,NULL),('oyDfX5RIPZ5aE_vmbNvMfW2iknUk',NULL,'oyDfX5RIPZ5aE_vmbNvMfW2iknUk',NULL,'康','https://wx.qlogo.cn/mmopen/vi_32/2zs6B05cMHytYodZcZ6PwwCgpelHAeQvkwEcqmyXZdFNCicXulCvbHYH7QM6XmORzL4WblbANYZJicBbYatTUnYg/132',1,'Dongguan',NULL,0,NULL,NULL,NULL,'2019-01-26 14:23:38',2,NULL,NULL,NULL),('oyDfX5RM2NXOVu7sOdBP-1dcPD0Y',NULL,'oyDfX5RM2NXOVu7sOdBP-1dcPD0Y',NULL,'吶呐','https://wx.qlogo.cn/mmopen/vi_32/YObyXYyJrbictBL1CRbUKmbHAGJdAy0oUWxuvIGvlYObVVQqdhLdLFEgYiafXiaV16s3Z1eTmHqIe3cTN9dIs8Rkg/132',0,'',NULL,0,0.16,0.16,NULL,'2019-01-26 14:22:33',3,NULL,NULL,NULL),('oyDfX5RnhCKE3mk5Y11jQT-ABKMc',NULL,'oyDfX5RnhCKE3mk5Y11jQT-ABKMc',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:25:31',1,NULL,NULL,NULL),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',NULL,'oyDfX5Rx8iXZBkxQB8OmplkzhyDQ',NULL,'木易日月','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epQleficVAwJhwRXlGSkefCg2k4lgMBguD8Gh4wOFGKWohVNL6PC5cOCqP2P9We739K3eISUJib7JWA/132',1,'Changsha',NULL,0,0.00,5.10,NULL,'2019-01-26 12:56:49',6,NULL,NULL,NULL),('oyDfX5Rz9kmtkHhYXM0U5vC5xZ7U',NULL,'oyDfX5Rz9kmtkHhYXM0U5vC5xZ7U',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-27 13:35:44',1,NULL,NULL,NULL),('oyDfX5RzkA66rAskTi96noDXjrHw',NULL,'oyDfX5RzkA66rAskTi96noDXjrHw',NULL,NULL,NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-25 01:31:21',4,NULL,NULL,NULL),('oyDfX5S5ruxJEtRWTIq1xRU7FkWY',NULL,'oyDfX5S5ruxJEtRWTIq1xRU7FkWY',NULL,'杜斯','https://wx.qlogo.cn/mmopen/vi_32/gADIIoI3oMvID9EX8wcQ4lOonWGPev9sJ4h9qc8pFzSuW0E7MicfibRBvmOBStSmAd347fv837le1PNDqtDO2JqQ/132',1,'Fuzhou',NULL,0,0.00,2.33,NULL,'2019-01-26 14:45:23',3,NULL,NULL,NULL),('oyDfX5Sbv0uVdtTdWC5WV5ATIZXY',NULL,'oyDfX5Sbv0uVdtTdWC5WV5ATIZXY',NULL,'kelly?','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erZSxHIzYan10aMe1vWAOR2BCrGXdsNFfmUnJdhhhTiaensF0Xtg27KaPmKiasLTrEAc5tibJ72vTiaCw/132',2,'',NULL,0,NULL,NULL,NULL,'2019-01-26 17:32:06',2,NULL,NULL,NULL),('oyDfX5ScZoPcCxACBiDg4EBbNk_w',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w',NULL,'佩琦','https://wx.qlogo.cn/mmopen/vi_32/M5GEQzPFfNF3MlL0C4Ct3jWvmKILiaHstPTcpjhRib04zS7Hxdz1QJ1avK1nkXZpb0TZxyJodJCklS41aR3O1zHQ/132',2,'Kirkland',NULL,0,0.00,7.66,2.00,'2019-01-25 16:11:21',20,NULL,NULL,NULL),('oyDfX5SD2jEEETMux1DcbBRpSbcw',NULL,'oyDfX5SD2jEEETMux1DcbBRpSbcw',NULL,'陈','https://wx.qlogo.cn/mmopen/vi_32/gViawORFzicOroR7uia1OISSeia2ribRE7eAMVat9Uy7bN5AoERFjMtw8kLaAR7KU6lc0RVk1LZCANboMnWPCicnKd9A/132',1,'Hengyang',NULL,0,NULL,NULL,NULL,'2019-01-26 14:02:43',2,NULL,NULL,NULL),('oyDfX5SeacO13l9O4VflSzi2LG9U',NULL,'oyDfX5SeacO13l9O4VflSzi2LG9U',NULL,'阿荣','https://wx.qlogo.cn/mmopen/vi_32/JN8X67ozE8u0rDcVn6WhkxOKib8iaIZHS8LdUmW898JXzz9FBRETLiaApnC4llowTzjYEhYOpFAPl5YoicWIbQiaNdA/132',2,'Zhuzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 13:33:02',4,NULL,NULL,NULL),('oyDfX5SQq6oXFqT5Z2zpb_QYE1a8',NULL,'oyDfX5SQq6oXFqT5Z2zpb_QYE1a8',NULL,'赵绪波@时代珍传','https://wx.qlogo.cn/mmopen/vi_32/HFTNSboUOlfaRQ5yQfVvtM4uxLk733eE6xCorAY6jrhyxDL3XmCkVHr2t3pjOwdRdVU3icAHv6QqtEicVz54wiarA/132',1,'Wuhan',NULL,0,NULL,NULL,NULL,'2019-01-26 14:02:24',3,NULL,NULL,NULL),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ',NULL,'oyDfX5SsSJUki9JZeSuDyMDQp6HQ',NULL,'周家伟','https://wx.qlogo.cn/mmopen/vi_32/rpPzX9MM2yUoYMAqyK3vqS34iciaDbTrP3LM8FOJ2InUQiaaQcvm4FcCblmF6MymJllUEcYqgYt81VMGg4h8xOQ3w/132',1,'',NULL,0,2.84,2.84,NULL,'2019-01-26 15:35:43',3,NULL,NULL,NULL),('oyDfX5SVgYHynM7S3G3DLyVY6a6w',NULL,'oyDfX5SVgYHynM7S3G3DLyVY6a6w',NULL,'踏踏','https://wx.qlogo.cn/mmopen/vi_32/vdJAjiacxzNytTyK3ldlYCSexzfmIuZOh5DUgxI0GzlI0TVZ9cNe7uB9ibfczG1Oolxwib2IopIq8vPdciaVvkCyoQ/132',2,'Fuzhou',NULL,0,0.00,2.48,NULL,'2019-01-26 14:06:06',2,NULL,NULL,NULL),('oyDfX5SvyYczqfIlSIlGQ2EYtHuQ',NULL,'oyDfX5SvyYczqfIlSIlGQ2EYtHuQ',NULL,'刘洋','',0,'',NULL,0,0.08,0.08,NULL,'2019-01-26 14:04:43',2,NULL,NULL,NULL),('oyDfX5SWCOXRTNs2JU6gvJ4DDQs0',NULL,'oyDfX5SWCOXRTNs2JU6gvJ4DDQs0',NULL,'时光','https://wx.qlogo.cn/mmopen/vi_32/5htWfrIO3QpnXVVsIXE4Rv5e8BWkicssNwTv4p3ib6JqJ3mSy4rbILzsXx62r1RKfmsd9QqJc4jcFElTDkEbWPpg/132',2,'Guangzhou',NULL,0,2.58,2.58,NULL,'2019-01-26 15:31:16',2,NULL,NULL,NULL),('oyDfX5SXQtRRvvZnHnCu12rCihUI',NULL,'oyDfX5SXQtRRvvZnHnCu12rCihUI',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:42:12',1,NULL,NULL,NULL),('oyDfX5TBZmiIyRVFpIzL2E1odmvk',NULL,'oyDfX5TBZmiIyRVFpIzL2E1odmvk',NULL,'哈姆太郎･:*｡･:*≡(　_•ω•)_','https://wx.qlogo.cn/mmopen/vi_32/tMJfHY3JTmDAkn6zIx9uDWribibPpaSgHh9m0PoEpYblddOOYGxZm03lflBCFZvKfwa8RsCXVz9kEddvAd8icYsxQ/132',2,'Guangzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 14:02:23',2,NULL,NULL,NULL),('oyDfX5TD1Fcv_5H_icTzE_N2JpYw',NULL,'oyDfX5TD1Fcv_5H_icTzE_N2JpYw',NULL,'思思','https://wx.qlogo.cn/mmopen/vi_32/kUgXE9azak2DumYR7TibomaqlOqaodSyovraAJSAuibF55gyq4yF5kqIdlHSuyFyaKmwsNvQq7rh5sN6yQia6Iajw/132',2,'Guangzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 14:22:59',2,NULL,NULL,NULL),('oyDfX5TEcxAQsWz3YMMoqwFvM2vM',NULL,'oyDfX5TEcxAQsWz3YMMoqwFvM2vM',NULL,'文娟','https://wx.qlogo.cn/mmopen/vi_32/NFSKlpgxtABP8TxNm4XQe9GaDkJCmG44zxkOeVIQ1shQ8wMOwIHa0lcowqXoxiauQboVBCOCJ7czdFJ2zUDpvaA/132',2,'Changsha',NULL,0,NULL,NULL,NULL,'2019-01-28 07:45:59',2,NULL,NULL,NULL),('oyDfX5TEyupNwD3a2nuuIO0bGMQE',NULL,'oyDfX5TEyupNwD3a2nuuIO0bGMQE',NULL,'蓝莓','https://wx.qlogo.cn/mmopen/vi_32/G0eXicJU6272TRvAVsSWHmeemdHYXIGiaT1Rib7EVOvwnGicMOZy7yDEpZIAQlIVzUzZMjKROj1PwAx6jVIjk5sPvA/132',2,'Guangzhou',NULL,0,0.84,0.84,NULL,'2019-01-26 15:06:01',3,NULL,NULL,NULL),('oyDfX5TgPKgCUbBpLoVtrF6urexA',NULL,'oyDfX5TgPKgCUbBpLoVtrF6urexA',NULL,'凡小丁','https://wx.qlogo.cn/mmopen/vi_32/u5ibYyvsIJMfodyabficQCfvbnY5Uw6pX8Srdp9RBmLoDCj1kKYhgE0eL3UFZFqiaHFywicmB9REte847ecbTsQuEw/132',1,'',NULL,0,NULL,NULL,NULL,'2019-01-26 16:04:30',2,NULL,NULL,NULL),('oyDfX5TOzphREg9175rNm15SVCiM',NULL,'oyDfX5TOzphREg9175rNm15SVCiM',NULL,'柴公子（本人常用号）','https://wx.qlogo.cn/mmopen/vi_32/iaDOsDWZL7jbStNV8YQDv0oQyhsbLRaAcmqEmT2jtQWlRuuFeDYpQZUXib66OyysPnibLYnYTNyx4ic7f8YrIT8ZuA/132',1,'Guangzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 13:55:14',3,NULL,NULL,NULL),('oyDfX5TQG4pXXvF9VhkjQc1QCts0',NULL,'oyDfX5TQG4pXXvF9VhkjQc1QCts0',NULL,'隔壁老周','https://wx.qlogo.cn/mmopen/vi_32/VZ6xh29rCTZunrGBeicdd2zlEywfjdcOC1EGfjTx7D8qQLicAH3G3grlcB0gV6X0iama9cfrDus1Magrp82ktJOGw/132',1,'Zhuzhou',NULL,0,0.00,4.20,NULL,'2019-01-26 13:50:18',3,NULL,NULL,NULL),('oyDfX5TrqskZgnKxH05HHogcPJYw',NULL,'oyDfX5TrqskZgnKxH05HHogcPJYw',NULL,'曦惜','https://wx.qlogo.cn/mmopen/vi_32/I8Ep6jWbJOfSrjNquQuTGe8cVict9dW0AWOMpiafhFib834jmibye0rQYyibVvWl6T75YWxoa1MlsiaqNyBgztR814cw/132',2,'Fuzhou',NULL,0,0.00,2.07,NULL,'2019-01-26 14:06:34',2,NULL,NULL,NULL),('oyDfX5TWdOtw51RozYS9r-Cbw9mI',NULL,'oyDfX5TWdOtw51RozYS9r-Cbw9mI',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 15:20:06',1,NULL,NULL,NULL),('oyDfX5U-ttE7YioegM36yPZCV9K0',NULL,'oyDfX5U-ttE7YioegM36yPZCV9K0',NULL,'唯爱小?','https://wx.qlogo.cn/mmopen/vi_32/6vKuicKOEII3YDTU6w80C9BP0STOibnDtiaph5VZbUqPyVB5Q44WL0yvekrYvKbAhVSJgmZ6bhKXibsxRzpicfpUs8A/132',1,'Guangzhou',NULL,0,0.00,1.85,NULL,'2019-01-26 14:43:00',3,NULL,NULL,NULL),('oyDfX5U2PlrB9AypXREDyAoMNLXs',NULL,'oyDfX5U2PlrB9AypXREDyAoMNLXs',NULL,'痛言','https://wx.qlogo.cn/mmopen/vi_32/VIKKSXcAOtoyeg3h6ftXQoGIhWDVyDagk5hIncsVibN07bLG6xleIgOjjjDD9MMopIIsVh87u33VRA61B04K40Q/132',1,'',NULL,0,NULL,NULL,NULL,'2019-01-26 14:24:25',2,NULL,NULL,NULL),('oyDfX5UAO5K6P8HGs4IW4E5d2A5E',NULL,'oyDfX5UAO5K6P8HGs4IW4E5d2A5E',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:00:19',1,NULL,NULL,NULL),('oyDfX5UNiq30f4u9uMk_e2DYuOeI',NULL,'oyDfX5UNiq30f4u9uMk_e2DYuOeI',NULL,'刘宁文','https://wx.qlogo.cn/mmopen/vi_32/BGQFGkxw6osJxgtqeYgEvhOIP6XhO5P9S6CvrnKuJYhvfTd4e1ma7NC7mIK6HGDWTGiaGbeFKCz4hS4kSex8rwA/132',2,'Changsha',NULL,0,0.00,8.56,NULL,'2019-01-26 12:49:25',5,NULL,NULL,NULL),('oyDfX5V2Af_uREWzMK3gqesbVum4',NULL,'oyDfX5V2Af_uREWzMK3gqesbVum4',NULL,'吴夕','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJAXYKkGLmEak98OFBdSP1pBaXMIsLickUCV0dUkicElj3wXiaHxSBMW3kIAmBCFToqDiaN2zJYftceUg/132',1,'Fuzhou',NULL,0,0.00,2.39,NULL,'2019-01-26 14:14:53',4,NULL,NULL,NULL),('oyDfX5V2jLv_dba19ZNgkdR5pJNU',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU',NULL,NULL,NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-25 21:31:10',3,NULL,NULL,NULL),('oyDfX5V6B-KMp9GWdx31_RHmlONQ',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ',NULL,NULL,NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-25 23:27:40',2,NULL,NULL,NULL),('oyDfX5VBnWvmQ0E8H9U1JSSIJn90',NULL,'oyDfX5VBnWvmQ0E8H9U1JSSIJn90',NULL,'水煮鱿鱼','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eob1o42320JFhViaH9blDC29SHrib0tjtNbib9s3iaAcqYbNn7hw5x7R9q0xYw2fI2OFBIwlAGh6JpicAg/132',1,'Guangzhou',NULL,0,0.69,0.69,NULL,'2019-01-26 13:33:19',4,NULL,NULL,NULL),('oyDfX5VJ0-UoDbsxCgGdeTkApPAM',NULL,'oyDfX5VJ0-UoDbsxCgGdeTkApPAM',NULL,'在雨中','https://wx.qlogo.cn/mmopen/vi_32/cEPQLMV2d4XBTBv40RGywEwdooQRepibp1YwGqzApXdseAPCIMMRtaib0r1eHke83DvefyIdRBvYlhiaqX52kQ6Xw/132',1,'',NULL,0,0.55,0.55,NULL,'2019-01-26 21:06:38',2,NULL,NULL,NULL),('oyDfX5VTceO2h9aCcXoRpMLVgE6Y',NULL,'oyDfX5VTceO2h9aCcXoRpMLVgE6Y',NULL,'诺珍','https://wx.qlogo.cn/mmopen/vi_32/prLzD0w2ux17t4CpY9f68ogNtlyJ9qG5MVGJKn5zbLnIy7p3YrJOnjxFJDGCtCKqPJxSsBrJmyWJOu2SslKV0A/132',0,'',NULL,0,0.00,2.94,NULL,'2019-01-26 14:02:13',3,NULL,NULL,NULL),('oyDfX5VVkkemoWwG8uB1qURXuKCc',NULL,'oyDfX5VVkkemoWwG8uB1qURXuKCc',NULL,'Kevin','https://wx.qlogo.cn/mmopen/vi_32/9ZbIC7NmVzj63QvgfsHDFpm5FndZjMyTbN5CaMJqNamURsYCiazlm45bFoJPFR2BI0Nn07LGq2qKJBBibPEUpkow/132',1,'Guangzhou',NULL,0,3.57,5.08,10.00,'2019-01-26 13:32:13',2,NULL,NULL,NULL),('oyDfX5W-yRX76wbNsbKXEoGl6s0c',NULL,'oyDfX5W-yRX76wbNsbKXEoGl6s0c',NULL,'南烛叶总监ʚ王晨ɞ','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKDCWHRAKvs8icgq9O1Lg8v5v8ELYEPbzQgfHXt1LC639O18CjaLzBW3UISFcibZ1SYohibqB7rOXctA/132',2,'Rizhao',NULL,0,NULL,NULL,NULL,'2019-01-26 14:01:32',2,NULL,NULL,NULL),('oyDfX5W0kMgG_pqAIjZaOHBdbgEk',NULL,'oyDfX5W0kMgG_pqAIjZaOHBdbgEk',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 13:36:39',1,NULL,NULL,NULL),('oyDfX5W1K1ZNqaq9eqtHgWLtm7D0',NULL,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0',NULL,'余益','https://wx.qlogo.cn/mmopen/vi_32/cJdxuzY2jJaLMsibMNVDic9BbiabJdtvUMLZEOvGqVDKM8mKPiaclLVvPg5BhcKbH3CicZAAu7ZxUyRjXRfrgVYia4ug/132',1,'Changsha',NULL,0,0.00,4.02,NULL,'2019-01-26 13:58:46',2,NULL,NULL,NULL),('oyDfX5W7tb8ty37njzKEPJSa7AoY',NULL,'oyDfX5W7tb8ty37njzKEPJSa7AoY',NULL,'拾几','https://wx.qlogo.cn/mmopen/vi_32/28iat4Mu7W3kiaDwkFNfC73RJYGfSgBgT4cyQkO9uBLnbSLUoz8MN7LCUpABMOJV467Thy9e1iaLI782KJA8OHwpg/132',1,'Changsha',NULL,0,NULL,NULL,NULL,'2019-01-26 14:05:08',2,NULL,NULL,NULL),('oyDfX5WCa0RsLDhwYWe7T5PESl4I',NULL,'oyDfX5WCa0RsLDhwYWe7T5PESl4I',NULL,'罗斯','https://wx.qlogo.cn/mmopen/vi_32/PkO04eGtBttJZJ6iaPjt6zm8gL55uv9X5ereNTwUeHuBA5iaCUsib07EEfZ0mqV9T4q8MAsVz4T0AN0VJUjxVZ0eg/132',0,'',NULL,0,NULL,NULL,NULL,'2019-01-26 15:54:57',2,NULL,NULL,NULL),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ',NULL,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ',NULL,'L','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo741M6wKca93Lj9lXQAQW2pH85nrcwp1myWNvZCrKUIqVCP68E3PpvsDoKP0DGpQaUK08wzFSZug/132',1,'Guangzhou',NULL,0,0.00,3.47,2.00,'2019-01-22 18:41:59',163,NULL,NULL,NULL),('oyDfX5Weok_E8C-wILHCOj_6irPE',NULL,'oyDfX5Weok_E8C-wILHCOj_6irPE',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 18:26:24',1,NULL,NULL,NULL),('oyDfX5Wm-S14LKRg0bpodvtlPMtE',NULL,'oyDfX5Wm-S14LKRg0bpodvtlPMtE',NULL,'?Jasmine','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKAIN9XZSxDryaTG0xPSXOkibEro3X5BlpqGbPibf57p6nclMIPQIwjEckgdFLzEvH90GWqat5TeIibw/132',2,'',NULL,0,0.00,2.52,NULL,'2019-01-26 13:21:16',2,NULL,NULL,NULL),('oyDfX5Wu5bQ5f04GT_bkE11hZNeI',NULL,'oyDfX5Wu5bQ5f04GT_bkE11hZNeI',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:05:34',1,NULL,NULL,NULL),('oyDfX5Wwcdqv2_XhMKAczV9m3N50',NULL,'oyDfX5Wwcdqv2_XhMKAczV9m3N50',NULL,'刘沛','https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eohId0NwDO8ntpmytRI1wYE49CI4ywicwHNTWl4kwVItFiasOictMcice8rVS9ibNSdjOJYBIQV32ba9wg/132',1,'Guangzhou',NULL,0,0.11,0.11,1.00,'2019-01-26 17:00:08',5,NULL,NULL,NULL),('oyDfX5WYeYfiAsRPctfs1-t8OXKA',NULL,'oyDfX5WYeYfiAsRPctfs1-t8OXKA',NULL,NULL,NULL,1,NULL,NULL,0,0.00,0.00,0.00,'2019-01-24 16:43:31',1,NULL,NULL,NULL),('oyDfX5X-Tex7n-TFhF1bTar5DzUw',NULL,'oyDfX5X-Tex7n-TFhF1bTar5DzUw',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:07:21',1,NULL,NULL,NULL),('oyDfX5X4MLLvhNYnKRmIVUag1ask',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask',NULL,'ppliujie','https://wx.qlogo.cn/mmopen/vi_32/TBCSIicyvj6niadFvhsW6tBEclXl0lPKIDUvt8AiaydZTjhLcGsB5vnaCz18aRTkefskQic2V7UhdlMh8lRtdYp7PA/132',2,'Guangzhou',NULL,0,0.00,7.90,61.00,'2019-01-22 21:25:33',44,NULL,NULL,NULL),('oyDfX5X6eD_fIPIUMa9J_tne0BUE',NULL,'oyDfX5X6eD_fIPIUMa9J_tne0BUE',NULL,'朱浩鹏??点睛之笔','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKibqX2nPhYJDa7ibUu29jhicf4RWUQBu254gOu6xibHNCUjKDcFQPskyRjt2iay69bKlpmF7ricZeKr7Ag/132',1,'Fuzhou',NULL,0,NULL,NULL,NULL,'2019-01-26 13:57:39',2,NULL,NULL,NULL),('oyDfX5XAAvUDV_B-HcQeRclw1AhU',NULL,'oyDfX5XAAvUDV_B-HcQeRclw1AhU',NULL,'余先生的余太太','https://wx.qlogo.cn/mmopen/vi_32/tyCuC6Eok5U5FBUSlCa2icibdXXvyQiaMSYJa4qJicvDP9soYgG6iawLXXkx3O5dZs7PM4TQaxORibPS0rT1tuNC3ZMw/132',2,'Shaoyang',NULL,0,NULL,NULL,NULL,'2019-01-26 17:17:07',2,NULL,NULL,NULL),('oyDfX5XkfBcbeDePPRxBMLfVpd7E',NULL,'oyDfX5XkfBcbeDePPRxBMLfVpd7E',NULL,'尛二郎。','https://wx.qlogo.cn/mmopen/vi_32/TjEsP1siaib6o4Ltt4Rz13ODjwL4zMic8a8GBJBsa5xwbOJTgLnh2DNMicfbk75wdYia3AzDbWqwJR8YC6ia5O5Rv8CA/132',1,'Shaoyang',NULL,0,0.00,3.89,NULL,'2019-01-26 13:51:49',2,NULL,NULL,NULL),('oyDfX5XLN-qQeFuv8RK7vRQBeAUo',NULL,'oyDfX5XLN-qQeFuv8RK7vRQBeAUo',NULL,'Duncan','https://wx.qlogo.cn/mmopen/vi_32/HHVS54tXZgOLHHXEOSicnJaa2G1wdUPIaicf7V0t5nvWfMvibiamgsRXeTPf3mFSS08FReGT4DfeeHV4rcw4ZnNevA/132',1,'Guangzhou',NULL,0,0.20,0.20,NULL,'2019-01-26 14:49:43',2,NULL,NULL,NULL),('oyDfX5XM2UE-bh4RaSSgeG9pxZ_I',NULL,'oyDfX5XM2UE-bh4RaSSgeG9pxZ_I',NULL,'谭波','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIe33RmTTV4dZvpQ5kiaAcbgcQksLg2mibuib6gK8IOlILU4ygbIhbDmpNJSlUibks2zzU1MvN7NtFgSg/132',1,'South Bank',NULL,0,0.00,3.03,NULL,'2019-01-26 14:31:13',3,NULL,NULL,NULL),('oyDfX5XnQ6m5LdgPvnLXCZDGHEW8',NULL,'oyDfX5XnQ6m5LdgPvnLXCZDGHEW8',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 14:11:33',1,NULL,NULL,NULL),('oyDfX5Xqr4vejEXFUUepQeSixGco',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco',NULL,'陈克俐','https://wx.qlogo.cn/mmhead/vsKUvXtDOgbaTFuvAp951nJLwe05IPM4fZOVaFb3eRU/132',0,'',NULL,0,0.00,0.00,0.00,'2019-01-25 13:06:39',6,NULL,NULL,NULL),('oyDfX5XTol1TvWbw2zyz2VupQ-4E',NULL,'oyDfX5XTol1TvWbw2zyz2VupQ-4E',NULL,'芭芭','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJT6licQgMBOoESrWo4FY7m03gRibURib1mAaeFE8DJcuIp1mnSRzsEko82BZR3icCaXCWRrmOdm9Pp8g/132',2,'',NULL,0,0.00,2.83,NULL,'2019-01-26 14:17:54',3,NULL,NULL,NULL),('oyDfX5Y9-yRmMLt_vsPkhElPFYVg',NULL,'oyDfX5Y9-yRmMLt_vsPkhElPFYVg',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 19:53:01',1,NULL,NULL,NULL),('oyDfX5YjwbEsnyV4OayjiT8YfZG0',NULL,'oyDfX5YjwbEsnyV4OayjiT8YfZG0',NULL,'࿈加央拉姆࿈','https://wx.qlogo.cn/mmopen/vi_32/azYDtw0IkT7trKQbAZiaoIrfycA1n4ZgXpBwvzrEUIbGiatCtYWUTbUuRF1CibkDWf3pQ4ISI2zD1q5ofJRfoPRlw/132',2,'Shenzhen',NULL,0,NULL,NULL,NULL,'2019-01-26 17:34:41',2,NULL,NULL,NULL),('oyDfX5YMQw1iamBNIwNeC6i7N7ew',NULL,'oyDfX5YMQw1iamBNIwNeC6i7N7ew',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 18:29:11',8,NULL,NULL,NULL),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg',NULL,'oyDfX5YMZmLk8j4AkbzGqpsK1tlg',NULL,'孔剑华','https://wx.qlogo.cn/mmopen/vi_32/Bld652NUrTzKQW1KIf4QQOyj7DuG5wwyDEiaCl7kk2arIhibicHD75tlhE9Oia4QT5t2bTaCau9x3ibzUXRLoqe1hyg/132',1,'',NULL,0,0.00,11.38,10.00,'2019-01-26 13:09:19',8,NULL,NULL,NULL),('oyDfX5YN6XS95-BvFSBAaKbIFOyA',NULL,'oyDfX5YN6XS95-BvFSBAaKbIFOyA',NULL,'会撒娇的小猪猪','https://wx.qlogo.cn/mmopen/vi_32/KNE1MOg0EFaPsZibYNia8SB8DnAwjI9iaVTAqD4bqFiaoZUgRgic8YKEiav01OosHsEIfZgljwLqrwE1vvnGc5pRu90g/132',2,'Zhuzhou',NULL,0,0.80,0.80,NULL,'2019-01-26 14:00:56',2,NULL,NULL,NULL),('oyDfX5YuuV-mI4BJcsACr2RqGCHU',NULL,'oyDfX5YuuV-mI4BJcsACr2RqGCHU',NULL,'欧乐','https://wx.qlogo.cn/mmopen/vi_32/Vw0UBfn0Usjxu4ibPF2LU9Xc1slvGWdCLSB2mFcAiazUXZakdmcJrmTozFcTic6UmWvBIRS3m8ibwSfZNYFgbPPBqA/132',2,'Fuzhou',NULL,0,0.00,3.60,NULL,'2019-01-26 14:26:27',2,NULL,NULL,NULL),('oyDfX5YX7Ozh6_u2qS7szTYCb9VY',NULL,'oyDfX5YX7Ozh6_u2qS7szTYCb9VY',NULL,'时间飞逝','https://wx.qlogo.cn/mmopen/vi_32/EyffhicmMFx6gMzWluH1ST8vgFD1X5licQLAO5yic5YebibiaZhRNiahTlEsgpictgcZSFqQPWFw3NkD0qIzp2tnotIQQ/132',2,'Guangzhou',NULL,0,0.00,2.15,NULL,'2019-01-26 14:45:15',3,NULL,NULL,NULL),('oyDfX5YYQfEHNm9RoZ2nqEeYAvhw',NULL,'oyDfX5YYQfEHNm9RoZ2nqEeYAvhw',NULL,NULL,NULL,1,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 21:40:19',1,NULL,NULL,NULL),('oyDfX5Z9bHWnY5g6ojmPWkUZxaOw',NULL,'oyDfX5Z9bHWnY5g6ojmPWkUZxaOw',NULL,'Anne','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKnr4sqh30AKGo3SohKuufCc4yHETICvhMVaQW9wg3juCaRkba86ALicicXgDbIEJmGdfae70N00EIg/132',2,'Changsha',NULL,0,NULL,NULL,NULL,'2019-01-26 14:13:26',3,NULL,NULL,NULL),('oyDfX5ZhIo8mEnb-alfByewjYjrw',NULL,'oyDfX5ZhIo8mEnb-alfByewjYjrw',NULL,'?JoJo','https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICovRrJicUhXNb54CQcm71ABtpWEdEoBJmNvoXHdBJryjgJf3cteL6CibfiaSaUiam35ZX94qia4k6fNA/132',2,'Wulong',NULL,0,0.00,1.94,NULL,'2019-01-28 19:53:06',2,NULL,NULL,NULL),('oyDfX5ZLnRfzCkK11DjQGof3K99Y',NULL,'oyDfX5ZLnRfzCkK11DjQGof3K99Y',NULL,'锋哥','https://wx.qlogo.cn/mmopen/vi_32/ZRSVXKs2hboXJPYvsKOyNa5udSbQzsCicMoocDWprBuicLHodcS03CHjzK2rXCfibAC4nyaeLtI9jDibC6b6JMG4hg/132',0,'',NULL,0,NULL,NULL,NULL,'2019-01-26 16:51:04',2,NULL,NULL,NULL),('oyDfX5ZM7mPiujg09jcRnxoF9ogY',NULL,'oyDfX5ZM7mPiujg09jcRnxoF9ogY',NULL,'周家伟','https://wx.qlogo.cn/mmopen/vi_32/2wvBrU1no7A7Cr2X3ViavVOQAUf44SEFlj0NHvqD6Lsktdwerh4LicibGTH7QjITPjupjU4Oziam3jpmj027sia0Rbw/132',1,'Chengdu',NULL,0,0.88,0.88,NULL,'2019-01-26 15:34:38',3,NULL,NULL,NULL),('oyDfX5ZNHQ3HHmaSoe7ze9xXmdTw',NULL,'oyDfX5ZNHQ3HHmaSoe7ze9xXmdTw',NULL,'蓝尧【微信通起盘服务5年】','https://wx.qlogo.cn/mmopen/vi_32/dzPUPJ3RaiabCem8kfFKwYczuic57AAfgAJeib5FmnHOtleXialdkG4x6uTa8VCaUFvsXzsBAGAXjJdwewy1SFyfuQ/132',2,'Guangzhou',NULL,0,0.21,0.21,NULL,'2019-01-26 13:54:07',3,NULL,NULL,NULL),('oyDfX5ZtticYhKu9SaurhvxMQ6gc',NULL,'oyDfX5ZtticYhKu9SaurhvxMQ6gc',NULL,'李 龍¹⁵⁸⁸⁹⁷⁵⁵⁶⁹³','https://wx.qlogo.cn/mmopen/vi_32/Md0lcibDHQ6rdgImyQLCONKxWa39p3Npia3xs2A9OwpnFnDHS6e1Hem9QxgzicUKSjyYwfPph4zPCFibOrD60s9Pxg/132',1,'Guangzhou',NULL,0,0.91,0.91,NULL,'2019-01-26 13:50:20',4,NULL,NULL,NULL),('oyDfX5ZXQllBEVavtpXkmkgk9a1k',NULL,'oyDfX5ZXQllBEVavtpXkmkgk9a1k',NULL,'小周师兄','https://wx.qlogo.cn/mmopen/vi_32/YDH3ehzpSkDwPUC8ZPjog6avoBBnJKH3rLcnRicx5xxKKQR9E4lrurV76q0yfCNSfeibUXZxRKzyUKWahOGdmOEw/132',0,'',NULL,0,0.00,13.10,1.00,'2019-01-26 13:16:04',6,NULL,NULL,NULL);
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
INSERT INTO `crm_user_balance` VALUES ('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 12:21:57',1,51,'228',4.22),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 12:41:20',1,51,'228',1.15),('oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 12:49:39',1,51,'228',3.92),('oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 12:50:35',1,51,'228',3.93),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 12:54:56',0,1,'86f59c40-2126-11e9-8b8a-6c92bf48246b',1.15),('oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 12:56:06',0,1,'b09e8e46-2126-11e9-8b8a-6c92bf48246b',3.93),('oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 12:56:14',0,1,'b5070989-2126-11e9-8b8a-6c92bf48246b',3.92),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 12:57:51',1,51,'228',0.51),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:09:30',1,51,'228',2.64),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:09:43',0,1,'9766e8a6-2128-11e9-8b8a-6c92bf48246b',2.64),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:14:37',1,51,'229',0.21),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:14:43',1,51,'228',3.97),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:14:44',0,1,'4abfbba4-2129-11e9-8b8a-6c92bf48246b',4.22),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:14:49',1,51,'229',0.24),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:15:12',1,51,'229',0.40),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:15:17',1,51,'229',0.39),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:15:29',1,51,'230',2.72),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:15:46',1,51,'230',3.32),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:16:27',1,51,'228',4.40),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:16:44',1,51,'230',1.20),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:16:57',1,51,'229',1.77),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:17:20',0,1,'a7c56665-2129-11e9-8b8a-6c92bf48246b',7.37),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:17:34',1,51,'230',1.11),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:18:01',0,1,'c006c5ff-2129-11e9-8b8a-6c92bf48246b',3.11),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:18:05',1,51,'230',1.65),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:18:12',0,1,'c69339ae-2129-11e9-8b8a-6c92bf48246b',2.16),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:18:35',1,51,'229',0.39),('oyDfX5Wm-S14LKRg0bpodvtlPMtE','2019-01-26 13:21:25',1,51,'229',2.52),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:21:27',1,51,'231',0.12),('oyDfX5Wm-S14LKRg0bpodvtlPMtE','2019-01-26 13:21:38',0,1,'41a5af8f-212a-11e9-8b8a-6c92bf48246b',2.52),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:21:43',1,51,'229',0.20),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:21:51',1,51,'231',0.02),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:21:55',1,51,'231',0.91),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:21:58',1,51,'228',1.21),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:22:05',1,51,'231',0.60),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:25:02',1,51,'232',1.00),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:25:30',1,51,'232',1.00),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:25:48',1,51,'232',1.00),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:25:50',1,51,'232',1.00),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:29:54',1,51,'233',0.38),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:30:34',1,51,'234',2.18),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:30:43',1,51,'233',0.04),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:30:47',1,51,'234',1.31),('oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:32:25',1,51,'228',1.51),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:32:29',1,51,'234',1.42),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:32:36',1,51,'233',0.22),('oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:32:37',0,1,'ca3d2782-212b-11e9-8b8a-6c92bf48246b',1.51),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:33:26',1,51,'233',0.24),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:33:43',1,51,'231',0.31),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:34:12',1,51,'234',2.00),('oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:34:22',0,1,'0915cb57-212c-11e9-8b8a-6c92bf48246b',2.94),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:35:00',0,1,'1febfc15-212c-11e9-8b8a-6c92bf48246b',3.29),('oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 13:35:11',1,51,'234',1.15),('oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 13:35:24',0,1,'2e2db331-212c-11e9-8b8a-6c92bf48246b',1.15),('oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 13:35:32',1,51,'234',1.17),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:35:37',1,51,'235',1.54),('oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 13:35:51',0,1,'3e17d7fe-212c-11e9-8b8a-6c92bf48246b',1.17),('oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 13:36:51',1,51,'229',0.31),('oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:38:12',1,51,'229',3.57),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:39:41',1,51,'233',0.12),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:40:46',0,1,'edd818a9-212c-11e9-8b8a-6c92bf48246b',4.13),('oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:43:34',1,51,'228',3.05),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 13:44:32',1,51,'236',0.19),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:45:00',1,51,'236',0.09),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:45:00',1,51,'236',0.72),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:45:12',0,1,'8c34606a-212d-11e9-8b8a-6c92bf48246b',4.79),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:45:38',1,51,'235',1.45),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:45:46',1,51,'234',0.34),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:45:59',1,51,'231',3.23),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:47:35',1,51,'237',0.06),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:47:49',1,51,'237',0.29),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:48:09',1,51,'237',0.27),('oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:49:59',1,51,'231',2.15),('oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:50:16',1,51,'237',1.38),('oyDfX5TQG4pXXvF9VhkjQc1QCts0','2019-01-26 13:50:31',1,51,'228',4.20),('oyDfX5ZtticYhKu9SaurhvxMQ6gc','2019-01-26 13:50:35',1,51,'228',0.91),('oyDfX5TQG4pXXvF9VhkjQc1QCts0','2019-01-26 13:50:39',0,1,'4f26b35e-212e-11e9-8b8a-6c92bf48246b',4.20),('oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:50:51',1,51,'234',0.43),('oyDfX5XkfBcbeDePPRxBMLfVpd7E','2019-01-26 13:51:54',1,51,'228',3.89),('oyDfX5XkfBcbeDePPRxBMLfVpd7E','2019-01-26 13:52:04',0,1,'824f9ef8-212e-11e9-8b8a-6c92bf48246b',3.89),('oyDfX5cOmNaS6GoW7kn8zVeCMsWY','2019-01-26 13:53:52',1,51,'228',3.36),('oyDfX5cOmNaS6GoW7kn8zVeCMsWY','2019-01-26 13:54:00',0,1,'c7310930-212e-11e9-8b8a-6c92bf48246b',3.36),('oyDfX5fQDvK0ypGQynW58gfEKtM4','2019-01-26 13:54:29',1,51,'228',0.83),('oyDfX5ZNHQ3HHmaSoe7ze9xXmdTw','2019-01-26 13:54:39',1,51,'228',0.21),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:55:28',1,51,'238',3.57),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:55:28',1,51,'238',1.75),('oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:14',1,51,'231',2.66),('oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:25',0,1,'1d52a20b-212f-11e9-8b8a-6c92bf48246b',2.66),('oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:44',1,51,'228',1.27),('oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:48',0,1,'2b8a6010-212f-11e9-8b8a-6c92bf48246b',1.27),('oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','2019-01-26 13:56:52',1,51,'238',2.57),('oyDfX5fpdUM_PaPyAvbnwcqkMibA','2019-01-26 13:56:52',1,51,'238',1.40),('oyDfX5fpdUM_PaPyAvbnwcqkMibA','2019-01-26 13:57:01',0,1,'33005536-212f-11e9-8b8a-6c92bf48246b',1.40),('oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','2019-01-26 13:57:28',0,1,'42fb60b5-212f-11e9-8b8a-6c92bf48246b',2.57),('oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:58:52',1,51,'228',4.02),('oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:59:05',0,1,'7d20217c-212f-11e9-8b8a-6c92bf48246b',4.02),('oyDfX5YN6XS95-BvFSBAaKbIFOyA','2019-01-26 14:01:02',1,51,'228',0.80),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:02:14',1,51,'238',3.88),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 14:02:14',1,51,'238',2.17),('oyDfX5eKWm6GwZqa51qzoOstKc6k','2019-01-26 14:02:18',1,51,'238',0.44),('oyDfX5VTceO2h9aCcXoRpMLVgE6Y','2019-01-26 14:02:18',1,51,'238',2.94),('oyDfX5VTceO2h9aCcXoRpMLVgE6Y','2019-01-26 14:02:26',0,1,'f4e4bd22-212f-11e9-8b8a-6c92bf48246b',2.94),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 14:02:31',0,1,'f7de3744-212f-11e9-8b8a-6c92bf48246b',6.35),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:02:48',0,1,'01c8936f-2130-11e9-8b8a-6c92bf48246b',4.26),('oyDfX5SvyYczqfIlSIlGQ2EYtHuQ','2019-01-26 14:06:50',1,51,'238',0.08),('oyDfX5TrqskZgnKxH05HHogcPJYw','2019-01-26 14:06:50',1,51,'238',2.07),('oyDfX5TrqskZgnKxH05HHogcPJYw','2019-01-26 14:07:17',0,1,'a2357afc-2130-11e9-8b8a-6c92bf48246b',2.07),('oyDfX5SVgYHynM7S3G3DLyVY6a6w','2019-01-26 14:10:17',1,51,'238',2.48),('oyDfX5cCVQzoGvWLB4-R8lErGqvQ','2019-01-26 14:10:17',1,51,'238',1.95),('oyDfX5cCVQzoGvWLB4-R8lErGqvQ','2019-01-26 14:10:37',0,1,'199213b5-2131-11e9-8b8a-6c92bf48246b',1.95),('oyDfX5SVgYHynM7S3G3DLyVY6a6w','2019-01-26 14:11:18',0,1,'319e2e76-2131-11e9-8b8a-6c92bf48246b',2.48),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:11:49',1,51,'239',0.22),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 14:14:28',1,51,'239',0.23),('oyDfX5afT824em9JybnRAmjHkMtI','2019-01-26 14:15:24',1,51,'238',1.73),('oyDfX5V2Af_uREWzMK3gqesbVum4','2019-01-26 14:15:24',1,51,'238',2.39),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:18:02',1,51,'238',2.81),('oyDfX5XTol1TvWbw2zyz2VupQ-4E','2019-01-26 14:18:02',1,51,'238',2.83),('oyDfX5XTol1TvWbw2zyz2VupQ-4E','2019-01-26 14:18:12',0,1,'28c57b08-2132-11e9-8b8a-6c92bf48246b',2.83),('oyDfX5V2Af_uREWzMK3gqesbVum4','2019-01-26 14:18:29',0,1,'32e673be-2132-11e9-8b8a-6c92bf48246b',2.39),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:20:59',0,1,'8c6dec6a-2132-11e9-8b8a-6c92bf48246b',3.00),('oyDfX5afT824em9JybnRAmjHkMtI','2019-01-26 14:21:39',0,1,'a440ee32-2132-11e9-8b8a-6c92bf48246b',1.73),('oyDfX5bXeLUabBzhTkw2TcB6O69g','2019-01-26 14:23:00',1,51,'238',3.60),('oyDfX5RM2NXOVu7sOdBP-1dcPD0Y','2019-01-26 14:23:00',1,51,'238',0.16),('oyDfX5cfgLsLSM4_zYnPcMPifB3A','2019-01-26 14:23:12',1,51,'240',1.91),('oyDfX5cfgLsLSM4_zYnPcMPifB3A','2019-01-26 14:23:37',0,1,'ea4fcc89-2132-11e9-8b8a-6c92bf48246b',1.91),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 14:23:41',1,51,'240',0.83),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 14:27:43',1,51,'238',1.98),('oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 14:27:43',1,51,'238',3.49),('oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 14:27:55',0,1,'845a6dab-2133-11e9-8b8a-6c92bf48246b',3.49),('oyDfX5bXeLUabBzhTkw2TcB6O69g','2019-01-26 14:32:01',0,1,'16bf8c3a-2134-11e9-8b8a-6c92bf48246b',3.60),('oyDfX5b-CeE7mo6pR9-GJdJZwMfU','2019-01-26 14:34:49',1,51,'240',2.02),('oyDfX5b-CeE7mo6pR9-GJdJZwMfU','2019-01-26 14:34:58',0,1,'80278643-2134-11e9-8b8a-6c92bf48246b',2.02),('oyDfX5fEd-sVl30oGT5PmaTm7Xok','2019-01-26 14:43:05',1,51,'238',1.49),('oyDfX5U-ttE7YioegM36yPZCV9K0','2019-01-26 14:43:05',1,51,'238',1.85),('oyDfX5U-ttE7YioegM36yPZCV9K0','2019-01-26 14:43:12',0,1,'a6a82946-2135-11e9-8b8a-6c92bf48246b',1.85),('oyDfX5fEd-sVl30oGT5PmaTm7Xok','2019-01-26 14:43:50',0,1,'bd911222-2135-11e9-8b8a-6c92bf48246b',1.49),('oyDfX5XLN-qQeFuv8RK7vRQBeAUo','2019-01-26 14:49:52',1,51,'235',0.20),('oyDfX5aqOeGI7dnuER3v4XCCQozs','2019-01-26 14:51:28',1,51,'238',3.57),('oyDfX5cpTzO9KUoEJ6QEQhy4ZLiA','2019-01-26 14:51:28',1,51,'238',0.98),('oyDfX5YuuV-mI4BJcsACr2RqGCHU','2019-01-26 14:53:29',1,51,'238',3.60),('oyDfX5S5ruxJEtRWTIq1xRU7FkWY','2019-01-26 14:53:29',1,51,'238',2.33),('oyDfX5aqOeGI7dnuER3v4XCCQozs','2019-01-26 14:54:43',0,1,'425fd52b-2137-11e9-8b8a-6c92bf48246b',3.57),('oyDfX5YuuV-mI4BJcsACr2RqGCHU','2019-01-26 14:55:01',0,1,'4d456a67-2137-11e9-8b8a-6c92bf48246b',3.60),('oyDfX5S5ruxJEtRWTIq1xRU7FkWY','2019-01-26 14:55:50',0,1,'6a5093bf-2137-11e9-8b8a-6c92bf48246b',2.33),('oyDfX5XM2UE-bh4RaSSgeG9pxZ_I','2019-01-26 15:04:47',1,51,'240',3.03),('oyDfX5XM2UE-bh4RaSSgeG9pxZ_I','2019-01-26 15:04:58',0,1,'b0db8fa3-2138-11e9-8b8a-6c92bf48246b',3.03),('oyDfX5TEyupNwD3a2nuuIO0bGMQE','2019-01-26 15:31:24',1,51,'238',0.84),('oyDfX5SWCOXRTNs2JU6gvJ4DDQs0','2019-01-26 15:31:24',1,51,'238',2.58),('oyDfX5ZM7mPiujg09jcRnxoF9ogY','2019-01-26 15:35:48',1,51,'238',0.88),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:35:48',1,51,'238',2.84),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:01',0,1,'07748c9b-213d-11e9-8b8a-6c92bf48246b',2.84),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:01',1,52,'07748c9b-213d-11e9-8b8a-6c92bf48246b',2.84),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:04',0,1,'091b8005-213d-11e9-8b8a-6c92bf48246b',2.84),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:04',1,52,'091b8005-213d-11e9-8b8a-6c92bf48246b',2.84),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:13',0,1,'0ed41dfe-213d-11e9-8b8a-6c92bf48246b',2.00),('oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:14',1,52,'0ed41dfe-213d-11e9-8b8a-6c92bf48246b',2.00),('oyDfX5b4J-XqvmJ5QR_69rqC48gE','2019-01-26 15:50:48',1,51,'238',0.94),('oyDfX5f68NrJwDN9uo9ks9w0VWjs','2019-01-26 15:50:48',1,51,'238',0.77),('oyDfX5dj1yFNeetopkspvllGtx7I','2019-01-26 16:19:28',1,51,'240',0.28),('oyDfX5eCI4y-rDcNYaB7U3fwgRhU','2019-01-26 16:20:47',1,51,'240',0.74),('oyDfX5YX7Ozh6_u2qS7szTYCb9VY','2019-01-26 16:37:04',1,51,'240',2.15),('oyDfX5YX7Ozh6_u2qS7szTYCb9VY','2019-01-26 16:37:21',0,1,'98b5cac1-2145-11e9-8b8a-6c92bf48246b',2.15),('oyDfX5cSfj9lm4dA8igH5WXH9x0c','2019-01-26 16:46:48',1,51,'240',3.01),('oyDfX5cSfj9lm4dA8igH5WXH9x0c','2019-01-26 16:46:57',0,1,'f03fe75f-2146-11e9-8b8a-6c92bf48246b',3.01),('oyDfX5d83HiFcJ004mfhp97Qg7y8','2019-01-26 16:53:53',1,51,'240',1.40),('oyDfX5eogADCmR8x4GEHI8SMcEtE','2019-01-26 17:35:30',1,51,'235',3.91),('oyDfX5eogADCmR8x4GEHI8SMcEtE','2019-01-26 17:35:41',0,1,'bf50429e-214d-11e9-8b8a-6c92bf48246b',3.91),('oyDfX5Wwcdqv2_XhMKAczV9m3N50','2019-01-26 17:53:27',1,51,'241',0.11),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 17:53:35',1,51,'241',0.20),('oyDfX5VBnWvmQ0E8H9U1JSSIJn90','2019-01-26 18:07:55',1,51,'241',0.69),('oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 18:56:47',0,1,'139bc1ff-2159-11e9-8b8a-6c92bf48246b',2.87),('oyDfX5VJ0-UoDbsxCgGdeTkApPAM','2019-01-26 21:06:52',1,51,'240',0.55),('oyDfX5dGLyyJu_BNg4_YdbJjw90w','2019-01-27 12:01:46',1,51,'240',1.99),('oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-28 13:54:31',0,1,'2eb08979-22c1-11e9-8b8a-6c92bf48246b',8.74),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 15:54:24',1,53,'243',1.00),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 16:34:47',1,51,'244',0.21),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-28 19:48:33',1,53,'247',1.00),('oyDfX5ZhIo8mEnb-alfByewjYjrw','2019-01-28 19:53:18',1,51,'240',1.94),('oyDfX5ZhIo8mEnb-alfByewjYjrw','2019-01-28 19:53:28',0,1,'534be331-22f3-11e9-8b8a-6c92bf48246b',1.94),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-28 20:59:40',1,51,'248',0.53),('oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-28 21:12:33',1,51,'248',0.47),('oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-29 11:07:26',0,1,'0164feee-2373-11e9-8b8a-6c92bf48246b',2.44),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:25:15',1,51,'249',0.32),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:28:00',1,51,'250',0.30),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:35:29',0,1,'37858105-23a9-11e9-8b8a-6c92bf48246b',7.90),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:35:45',1,53,'240',8.15),('oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:35:59',0,1,'4916cb17-23a9-11e9-8b8a-6c92bf48246b',8.15),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 17:36:01',1,51,'249',0.26),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 17:36:24',1,51,'250',0.71),('oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 17:36:54',0,1,'69ccef86-23a9-11e9-8b8a-6c92bf48246b',1.92),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-29 17:44:10',1,51,'249',0.09),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-29 17:44:27',1,51,'250',0.38),('oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-29 17:44:53',0,1,'8768ca9d-23aa-11e9-8b8a-6c92bf48246b',1.47);
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
-- Table structure for table `fw_dict`
--

DROP TABLE IF EXISTS `fw_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_dict` (
  `dict_id` char(36) CHARACTER SET utf8 NOT NULL COMMENT '字典id',
  `dict_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '字典项名称',
  `dict_code` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '字典编码',
  `dict_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `dict_index` int(11) DEFAULT NULL COMMENT '排序索引',
  `rec_isdeleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态\n            0:正常\n            1:已删除',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `nameIndex` (`dict_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_dict`
--

LOCK TABLES `fw_dict` WRITE;
/*!40000 ALTER TABLE `fw_dict` DISABLE KEYS */;
INSERT INTO `fw_dict` VALUES ('1227536a-ad7d-483f-b616-db5cdd448323','祝福主题','topic',NULL,NULL,0);
/*!40000 ALTER TABLE `fw_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fw_dict_item`
--

DROP TABLE IF EXISTS `fw_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fw_dict_item` (
  `rec_id` char(36) NOT NULL COMMENT '记录id',
  `dict_id` char(36) NOT NULL COMMENT '字典id',
  `item_name` varchar(64) NOT NULL COMMENT '名称',
  `item_value` varchar(20) DEFAULT NULL,
  `ext_field1` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段1',
  `ext_field3` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段3',
  `ext_field2` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '扩展字段2',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fw_dict_item`
--

LOCK TABLES `fw_dict_item` WRITE;
/*!40000 ALTER TABLE `fw_dict_item` DISABLE KEYS */;
INSERT INTO `fw_dict_item` VALUES ('344500e8-525b-4e81-8e96-cb66901f1810','1227536a-ad7d-483f-b616-db5cdd448323','老人长辈','3',NULL,NULL,NULL),('3c8abe08-9d31-422a-88e4-7d09accfe98d','1227536a-ad7d-483f-b616-db5cdd448323','新年快乐','1',NULL,NULL,NULL),('cb641394-7921-4d51-9d42-f48a2a7d95c1','1227536a-ad7d-483f-b616-db5cdd448323','小朋友','4',NULL,NULL,NULL),('d0b61681-260d-4b14-95cc-af161030c1f9','1227536a-ad7d-483f-b616-db5cdd448323','节日祝福','2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `fw_dict_item` ENABLE KEYS */;
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
INSERT INTO `fw_function` VALUES ('113e5cf2-e90b-453d-a555-e5c701ef1043',NULL,'收支','redbag/menuicon/icon-income.png',80,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-19 12:42:48','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 08:14:47',0),('1d3b46d7-7566-4859-9b2a-c0aded20a9d3','cfd13eae-f9e5-485b-8666-5e3f1aa40763','主题文案',NULL,30,0,'/redbag/topiclist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-26 07:44:28','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-26 07:44:28',0),('20f8f9f0-2c97-4d5b-a21b-cd92da1ed303','113e5cf2-e90b-453d-a555-e5c701ef1043','平台收支',NULL,10,0,'/redbag/incomelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 06:17:48','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 06:17:48',0),('214e6319-a2ba-4952-81db-a42db2541e94','cfd13eae-f9e5-485b-8666-5e3f1aa40763','公众号',NULL,90,0,'/redbag/publiclist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-22 08:01:46','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-22 08:01:46',0),('25d92094-58de-4abd-b220-ea1b642eca03','113e5cf2-e90b-453d-a555-e5c701ef1043','红包提现',NULL,40,0,'/redbag/withdrawlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 11:33:33','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 11:33:33',0),('2a906f7f-9d1d-4cd2-afb4-04587ab171fa',NULL,'哒伴','menuicon/user2.png',40,0,NULL,1,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:10:15','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:30:20',1),('3ffaf59e-017b-11e7-acd2-f0def107233a','e7ae03fb-f8d2-11e6-8e70-f0def107233a','功能菜单',NULL,100,0,'admin/sysmenutree',0,0,'3ffaf638-017b-11e7-acd2-f0def107233a','2017-03-05 16:10:45','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:19',0),('52c08d5d-3375-42ca-8c9b-b5c993d53c7e','cfd13eae-f9e5-485b-8666-5e3f1aa40763','参数设置',NULL,100,0,'/admin/settingblank',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 05:35:14','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 05:36:13',0),('6c4c80cd-d129-4288-8295-bf18929f319c','e7ae03fb-f8d2-11e6-8e70-f0def107233a','字典维护',NULL,4,0,'/admin/dictionarylist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-03-07 02:18:56','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-25 11:28:49',1),('72f9aac1-f8d3-11e6-8e70-f0def107233a','e7ae03fb-f8d2-11e6-8e70-f0def107233a','组织架构管理',NULL,30,0,'/admin/userlist',0,0,'72f9aaff-f8d3-11e6-8e70-f0def107233a','2017-02-22 15:49:33','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:52:56',0),('78a192c6-8346-4acb-8cc6-576b250b0f6c','f9a71679-54a3-43ca-824f-3773d45ee60f','应用反馈',NULL,80,0,'/admin/feedbacklist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-05 06:08:37','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-05 06:08:37',1),('b27d1f25-e065-4d6a-89f4-8200f776b570','cfd13eae-f9e5-485b-8666-5e3f1aa40763','用户',NULL,10,0,'/crm/memberlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-22 03:16:05','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-26 12:04:29',0),('c0d3c818-27e1-4951-8e22-f79c72b045bf','cfd13eae-f9e5-485b-8666-5e3f1aa40763','主题音乐',NULL,40,0,'/redbag/musiclist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-17 11:41:19','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-17 11:41:19',0),('cfd13eae-f9e5-485b-8666-5e3f1aa40763',NULL,'红包','redbag/menuicon/redbag.png',30,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:33:32','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-17 03:51:10',0),('de740ae0-c82d-41db-9271-0694da4eee17','e7ae03fb-f8d2-11e6-8e70-f0def107233a','消息推送',NULL,10,0,'/admin/templatemessagelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 08:35:25','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-21 08:35:25',0),('e6a18e35-c077-4e89-b7a8-ee4619b1d089','e7ae03fb-f8d2-11e6-8e70-f0def107233a','系统角色',NULL,40,0,'admin/rolelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:10:19','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-01-30 10:53:05',0),('e7ae03fb-f8d2-11e6-8e70-f0def107233a',NULL,'系统','redbag/menuicon/SystemSetting.png',1000,0,NULL,0,0,'e7ae0439-f8d2-11e6-8e70-f0def107233a','2017-02-22 15:45:39','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-28 08:14:58',0),('f2505c80-dd37-43fe-ac16-0e7703a639b5','e7ae03fb-f8d2-11e6-8e70-f0def107233a','字典',NULL,100,0,'/admin/dictionarylist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-26 07:40:38','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-26 07:40:38',0),('f6644b8b-f9e0-43d6-aa2d-80207e15d609','cfd13eae-f9e5-485b-8666-5e3f1aa40763','主题背景',NULL,50,0,'/redbag/backgroundlist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-07 07:34:58','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-04 12:00:24',0),('f9040a15-eb67-4d0c-847d-5d3576886078','e7ae03fb-f8d2-11e6-8e70-f0def107233a','分享配置',NULL,20,0,'/admin/sharelist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-08 01:20:43','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-08 01:20:43',0),('f9a71679-54a3-43ca-824f-3773d45ee60f',NULL,'平台','speech/framework/menuicon/setting.png',90,0,NULL,0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-07 12:00:12','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:36:15',1),('fa808258-5892-4d60-9881-50467c644a00','f9a71679-54a3-43ca-824f-3773d45ee60f','平台参数',NULL,5,0,'/admin/settingblank',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2017-11-17 12:03:36','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-16 09:39:36',1),('fb25a880-1205-4227-b249-760f0f405b41','cfd13eae-f9e5-485b-8666-5e3f1aa40763','芝麻包',NULL,20,0,'/redbag/redbaglist',0,0,'8973d1a3-c78b-11e6-afbd-f0def107233a','2018-02-22 03:16:26','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-15 11:22:58',0);
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
INSERT INTO `fw_function_privilege` VALUES ('624b4ccf-211f-11e9-8b8a-6c92bf48246b','b27d1f25-e065-4d6a-89f4-8200f776b570',NULL,'96b28d84-211e-11e9-8b8a-6c92bf482a6b',0),('624b4ffc-211f-11e9-8b8a-6c92bf48246b','b27d1f25-e065-4d6a-89f4-8200f776b570',NULL,'dc09cce8-f285-11e6-ba7a-f0def107233a',0);
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
  `role_key` varchar(20) DEFAULT NULL COMMENT '角色键值',
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
INSERT INTO `fw_roles` VALUES ('96b28d84-211e-11e9-8b8a-6c92bf48246b','财务管理员','finance',0,NULL,'dc09cd54-f285-11e6-ba7a-f0def107233a','2017-02-14 15:19:01','8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:11:24',0),('96b28d84-211e-11e9-8b8a-6c92bf482a6b','运营人员','operator',0,NULL,'dc09cd54-f285-11e6-ba7a-f0def107233a','2017-02-14 15:19:01','8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:11:24',0),('dc09cce8-f285-11e6-ba7a-f0def107233a','系统管理员','admin',1,NULL,'dc09cd54-f285-11e6-ba7a-f0def107233a','2017-02-14 15:19:01','8973d1a3-c78b-11e6-afbd-f0def107233a','2017-04-24 04:11:24',0);
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
INSERT INTO `fw_setting` VALUES ('wxef31174b9f28d7d3','{\"auditimage\":\"redbag/poster/6abe5103-2af1-44ad-8ade-9d612be93423.jpeg\",\"servicerate\":\"2.00\",\"withdraw\":\"2.00\"}'),('wxfa7d7a155dcef5a2','{\"auditimage\":\"redbag/poster/a86897dc-5272-4a80-9211-0190d08a14dd.jpg\",\"servicerate\":\"2.00\",\"withdraw\":\"1.00\",\"topic\":\"{username}给您拜年了\",\"bless\":\"大吉大利 猪年快乐\"}');
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
INSERT INTO `fw_userrole` VALUES ('62e0f5b2-7c3b-4fcd-bbcc-f72d7c0dbcb7','96b28d84-211e-11e9-8b8a-6c92bf482a6b','183425c2-9290-48c9-8715-0756be72e436'),('d99defe1-008d-4253-b4ca-1a99e154ec54','dc09cce8-f285-11e6-ba7a-f0def107233a','8973d1a3-c78b-11e6-afbd-f0def107233a');
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
INSERT INTO `fw_users` VALUES ('183425c2-9290-48c9-8715-0756be72e436','test','dc483e80a7a0bd9ef71d8cf973673924','test',NULL,NULL,0,'\0',NULL,'2019-01-26 11:41:39','8973d1a3-c78b-11e6-afbd-f0def107233a','2019-01-26 11:41:39','8973d1a3-c78b-11e6-afbd-f0def107233a',0),('8973d1a3-c78b-11e6-afbd-f0def107233a','admin','dc483e80a7a0bd9ef71d8cf973673924','管理员',NULL,NULL,0,'',NULL,'2016-12-21 23:12:42','8973d1a3-c78b-11e6-afbd-f0def107233a','2018-03-02 03:37:48','8973d1a3-c78b-11e6-afbd-f0def107233a',0);
/*!40000 ALTER TABLE `fw_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mini_message_template`
--

DROP TABLE IF EXISTS `mini_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mini_message_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(20) NOT NULL COMMENT 'app_id',
  `message_key` varchar(30) NOT NULL COMMENT 'message_key',
  `message_id` varchar(64) NOT NULL COMMENT 'message_id',
  `message_content` varchar(512) DEFAULT NULL COMMENT '消息内容',
  `rec_isdeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`app_id`,`message_key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mini_message_template`
--

LOCK TABLES `mini_message_template` WRITE;
/*!40000 ALTER TABLE `mini_message_template` DISABLE KEYS */;
INSERT INTO `mini_message_template` VALUES (11,'wxef31174b9f28d7d3','bingo','x3SjdbJlLDZFGVPivWeIkmTz6pi2Sjw6S1mAfUQXFv0','redbag/message/20190121/bc61a625-1a6d-4750-8894-4538bf50827c.jpeg',0),(12,'wxfa7d7a155dcef5a2','bingo','vVLpqz7AMFzKIfV5__2o0ivIWDBFfbbHMI7jZ0WB8O8','redbag/message/20190122/f9421ed7-9321-4dab-8a71-167e66946829.jpeg',0),(13,'wxfa7d7a155dcef5a2','transfer','T8UBqwrotx3okKSu6QWEaQ7qtoF8FYxXGFMVlUkOgCQ','redbag/message/20190124/80cd90b4-c059-42bf-a6db-476bdd9d7d96.jpeg',0),(14,'wxfa7d7a155dcef5a2','waitpay','348VVKKTF5syyHRn96Jp-y1SAlF3gOae4OW6N0wEGkQ','redbag/message/20190124/eca128fc-35c6-457b-bc83-e45daaede494.jpeg',0);
/*!40000 ALTER TABLE `mini_message_template` ENABLE KEYS */;
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
INSERT INTO `pf_share` VALUES ('017bc7fe-2866-4955-8e46-285037652ccc',NULL,'oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:35:24','/pages/index/index?id=235&shareid=017bc7fe-2866-4955-8e46-285037652ccc',0,NULL,'{\"id\":\"235\",\"url\":\"/pages/index/index?id=235&shareid=017bc7fe-2866-4955-8e46-285037652ccc\"}'),('0236aadb-0264-4390-879f-aa8b66bb8c39',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:29','pages/square/square?shareid=0236aadb-0264-4390-879f-aa8b66bb8c39',0,NULL,'{\"url\":\"pages/square/square?shareid=0236aadb-0264-4390-879f-aa8b66bb8c39\"}'),('033da0d1-6449-4b18-b145-e083fde42210',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:11','pages/square/square?shareid=033da0d1-6449-4b18-b145-e083fde42210',0,NULL,'{\"url\":\"pages/square/square?shareid=033da0d1-6449-4b18-b145-e083fde42210\"}'),('03cf1ff1-a015-422c-88f4-b96d66c2b241',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:08','pages/index/index?id=&groupid=&shareid=03cf1ff1-a015-422c-88f4-b96d66c2b241',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=03cf1ff1-a015-422c-88f4-b96d66c2b241\"}'),('067205d0-0dfd-4d7a-9afb-b0520617c510',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:04','pages/index/index?id=&groupid=&shareid=067205d0-0dfd-4d7a-9afb-b0520617c510',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=067205d0-0dfd-4d7a-9afb-b0520617c510\"}'),('09f53666-0980-437d-937b-4613a615e20a',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:59:27','pages/index/index?id=238&groupid=1548482328457&shareid=09f53666-0980-437d-937b-4613a615e20a',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482328457\",\"url\":\"pages/index/index?id=238&groupid=1548482328457&shareid=09f53666-0980-437d-937b-4613a615e20a\"}'),('0ae6edca-24ca-4a0e-b870-b242804518b1',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:38','pages/square/square?shareid=0ae6edca-24ca-4a0e-b870-b242804518b1',0,NULL,'{\"url\":\"pages/square/square?shareid=0ae6edca-24ca-4a0e-b870-b242804518b1\"}'),('0c4b8d57-56f9-4918-a4ca-c568959d88d0',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 14:15:46','pages/index/index?id=238&groupid=1548482328457&shareid=0c4b8d57-56f9-4918-a4ca-c568959d88d0',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482328457\",\"url\":\"pages/index/index?id=238&groupid=1548482328457&shareid=0c4b8d57-56f9-4918-a4ca-c568959d88d0\"}'),('0ca971f0-99ee-4402-ab80-2a876c32a892',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:02:52','pages/square/square?shareid=0ca971f0-99ee-4402-ab80-2a876c32a892',0,NULL,'{\"url\":\"pages/square/square?shareid=0ca971f0-99ee-4402-ab80-2a876c32a892\"}'),('0e31b337-eb9f-48f8-92aa-a22156612b20',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:06:10','pages/index/index?id=234&groupid=&shareid=0e31b337-eb9f-48f8-92aa-a22156612b20',0,NULL,'{\"id\":\"234\",\"url\":\"pages/index/index?id=234&groupid=&shareid=0e31b337-eb9f-48f8-92aa-a22156612b20\"}'),('0e4600d5-df95-4196-95dc-4b8dcc90d5f4',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:30:07','/pages/index/index?id=234&shareid=0e4600d5-df95-4196-95dc-4b8dcc90d5f4',0,NULL,'{\"id\":\"234\",\"url\":\"/pages/index/index?id=234&shareid=0e4600d5-df95-4196-95dc-4b8dcc90d5f4\"}'),('0f33658b-d61e-4b73-87a4-57ec4f037915',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:02:57','pages/square/square?shareid=0f33658b-d61e-4b73-87a4-57ec4f037915',0,NULL,'{\"url\":\"pages/square/square?shareid=0f33658b-d61e-4b73-87a4-57ec4f037915\"}'),('11ce8af5-b204-492b-a7fa-600bb497bcdb',NULL,'oyDfX5U2PlrB9AypXREDyAoMNLXs','2019-01-26 14:24:59','pages/index/index?id=238&groupid=1548483890606&shareid=11ce8af5-b204-492b-a7fa-600bb497bcdb',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483890606\",\"url\":\"pages/index/index?id=238&groupid=1548483890606&shareid=11ce8af5-b204-492b-a7fa-600bb497bcdb\"}'),('1354872b-ba5b-4fc4-9154-67d9c7b31433',NULL,'oyDfX5SeacO13l9O4VflSzi2LG9U','2019-01-26 14:57:20','pages/index/index?id=238&groupid=1548485497305&shareid=1354872b-ba5b-4fc4-9154-67d9c7b31433',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485497305\",\"url\":\"pages/index/index?id=238&groupid=1548485497305&shareid=1354872b-ba5b-4fc4-9154-67d9c7b31433\"}'),('139454bb-e286-4805-ab83-baebbe786af8',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:45','pages/index/index?id=&groupid=&shareid=139454bb-e286-4805-ab83-baebbe786af8',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=139454bb-e286-4805-ab83-baebbe786af8\"}'),('144cc98e-918a-4ccc-bb2e-ba5e70bf00fc',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-29 14:41:40','pages/index/index?id=238&groupid=&shareid=144cc98e-918a-4ccc-bb2e-ba5e70bf00fc',0,NULL,'{\"id\":\"238\",\"url\":\"pages/index/index?id=238&groupid=&shareid=144cc98e-918a-4ccc-bb2e-ba5e70bf00fc\"}'),('155161b0-a586-4be2-812e-cfa9eefba288',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:15','pages/index/index?id=&groupid=&shareid=155161b0-a586-4be2-812e-cfa9eefba288',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=155161b0-a586-4be2-812e-cfa9eefba288\"}'),('15f7d6a8-fd8d-46e7-a974-2a7b1a987909',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:30','pages/square/square?shareid=15f7d6a8-fd8d-46e7-a974-2a7b1a987909',0,NULL,'{\"url\":\"pages/square/square?shareid=15f7d6a8-fd8d-46e7-a974-2a7b1a987909\"}'),('16f42880-517d-418c-a7a1-288a0e379a65',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:58:58','pages/index/index?id=&groupid=&shareid=16f42880-517d-418c-a7a1-288a0e379a65',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=16f42880-517d-418c-a7a1-288a0e379a65\"}'),('1717ce7c-56f3-4185-95a4-a1bf4ca7ae6d',NULL,'oyDfX5YMQw1iamBNIwNeC6i7N7ew','2019-01-26 21:33:34','pages/index/index?id=&groupid=&shareid=1717ce7c-56f3-4185-95a4-a1bf4ca7ae6d',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=1717ce7c-56f3-4185-95a4-a1bf4ca7ae6d\"}'),('18445d44-9d6c-4984-ae80-33bf23982e20',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:39','pages/square/square?shareid=18445d44-9d6c-4984-ae80-33bf23982e20',0,NULL,'{\"url\":\"pages/square/square?shareid=18445d44-9d6c-4984-ae80-33bf23982e20\"}'),('1b3a34f6-edd2-4f79-adec-38fc4c77625c',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:13','pages/index/index?id=&groupid=&shareid=1b3a34f6-edd2-4f79-adec-38fc4c77625c',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=1b3a34f6-edd2-4f79-adec-38fc4c77625c\"}'),('1c1cc660-9ff8-4284-9559-7f23f08f2566',NULL,'oyDfX5RzkA66rAskTi96noDXjrHw','2019-01-26 17:05:04','pages/square/square?shareid=1c1cc660-9ff8-4284-9559-7f23f08f2566',0,NULL,'{\"url\":\"pages/square/square?shareid=1c1cc660-9ff8-4284-9559-7f23f08f2566\"}'),('1c334bc4-7511-4a24-b118-19553b8dad37',NULL,'oyDfX5TD1Fcv_5H_icTzE_N2JpYw','2019-01-26 14:23:23','pages/index/index?id=238&groupid=1548483786326&shareid=1c334bc4-7511-4a24-b118-19553b8dad37',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483786326\",\"url\":\"pages/index/index?id=238&groupid=1548483786326&shareid=1c334bc4-7511-4a24-b118-19553b8dad37\"}'),('1ccbf1b3-3c75-4591-a265-d7ec4b993d76',NULL,'oyDfX5YuuV-mI4BJcsACr2RqGCHU','2019-01-26 14:26:45','pages/index/index?id=238&groupid=1548484000406&shareid=1ccbf1b3-3c75-4591-a265-d7ec4b993d76',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548484000406\",\"url\":\"pages/index/index?id=238&groupid=1548484000406&shareid=1ccbf1b3-3c75-4591-a265-d7ec4b993d76\"}'),('1da5f1b0-6774-45d9-b0d2-4cc40fbdc794',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:02:45','pages/square/square?shareid=1da5f1b0-6774-45d9-b0d2-4cc40fbdc794',0,NULL,'{\"url\":\"pages/square/square?shareid=1da5f1b0-6774-45d9-b0d2-4cc40fbdc794\"}'),('1eab0cd6-8819-4a4b-bf9e-558e990b74a9',NULL,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:59:49','pages/index/index?id=238&groupid=1548482380770&shareid=1eab0cd6-8819-4a4b-bf9e-558e990b74a9',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482380770\",\"url\":\"pages/index/index?id=238&groupid=1548482380770&shareid=1eab0cd6-8819-4a4b-bf9e-558e990b74a9\"}'),('1f2139f5-cf3a-4c85-9689-432d64dad084',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:17','pages/square/square?shareid=1f2139f5-cf3a-4c85-9689-432d64dad084',0,NULL,'{\"url\":\"pages/square/square?shareid=1f2139f5-cf3a-4c85-9689-432d64dad084\"}'),('1f3f1f3e-8419-4261-af22-8a01c61fdb7d',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:06:26','pages/square/square?shareid=1f3f1f3e-8419-4261-af22-8a01c61fdb7d',0,NULL,'{\"url\":\"pages/square/square?shareid=1f3f1f3e-8419-4261-af22-8a01c61fdb7d\"}'),('1f6a8b46-76ac-459e-a872-908f722887b9',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:21','pages/square/square?shareid=1f6a8b46-76ac-459e-a872-908f722887b9',0,NULL,'{\"url\":\"pages/square/square?shareid=1f6a8b46-76ac-459e-a872-908f722887b9\"}'),('20372f50-f47c-4768-9ed5-816b290bf901',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:25','pages/square/square?shareid=20372f50-f47c-4768-9ed5-816b290bf901',0,NULL,'{\"url\":\"pages/square/square?shareid=20372f50-f47c-4768-9ed5-816b290bf901\"}'),('26f6c8dc-b8f1-48e4-8ad0-385d07995026',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:59','pages/index/index?id=&groupid=&shareid=26f6c8dc-b8f1-48e4-8ad0-385d07995026',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=26f6c8dc-b8f1-48e4-8ad0-385d07995026\"}'),('2739b320-d4d3-4a91-b291-f9b4d1bfc3f0',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:33:03','pages/square/square?shareid=2739b320-d4d3-4a91-b291-f9b4d1bfc3f0',0,NULL,'{\"url\":\"pages/square/square?shareid=2739b320-d4d3-4a91-b291-f9b4d1bfc3f0\"}'),('2c539402-6ed5-41af-b588-0755c4373eeb',NULL,'oyDfX5Wwcdqv2_XhMKAczV9m3N50','2019-01-26 17:53:01','/pages/index/index?id=241&shareid=2c539402-6ed5-41af-b588-0755c4373eeb',0,NULL,'{\"id\":\"241\",\"url\":\"/pages/index/index?id=241&shareid=2c539402-6ed5-41af-b588-0755c4373eeb\"}'),('306fccf9-4b72-4071-8ea1-fd93135b676c',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:43','pages/index/index?id=&groupid=&shareid=306fccf9-4b72-4071-8ea1-fd93135b676c',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=306fccf9-4b72-4071-8ea1-fd93135b676c\"}'),('35f97eaa-71a6-403e-89c1-cf2d24c056ed',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:40','pages/index/index?id=&groupid=&shareid=35f97eaa-71a6-403e-89c1-cf2d24c056ed',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=35f97eaa-71a6-403e-89c1-cf2d24c056ed\"}'),('3642b3d5-9d5a-4e2c-bccc-62e641fa9167',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:06:00','pages/index/index?id=&groupid=&shareid=3642b3d5-9d5a-4e2c-bccc-62e641fa9167',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=3642b3d5-9d5a-4e2c-bccc-62e641fa9167\"}'),('3967ed10-ccb4-47dc-84df-280abaa4ebf7',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:00','pages/square/square?shareid=3967ed10-ccb4-47dc-84df-280abaa4ebf7',0,NULL,'{\"url\":\"pages/square/square?shareid=3967ed10-ccb4-47dc-84df-280abaa4ebf7\"}'),('3a94af00-2b40-4137-a8c5-e2bc0b3eeca1',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:16','pages/square/square?shareid=3a94af00-2b40-4137-a8c5-e2bc0b3eeca1',0,NULL,'{\"url\":\"pages/square/square?shareid=3a94af00-2b40-4137-a8c5-e2bc0b3eeca1\"}'),('3c36ea56-71bf-41ee-b244-ec392cb07c3b',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:59:06','pages/index/index?id=238&groupid=1548482337882&shareid=3c36ea56-71bf-41ee-b244-ec392cb07c3b',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482337882\",\"url\":\"pages/index/index?id=238&groupid=1548482337882&shareid=3c36ea56-71bf-41ee-b244-ec392cb07c3b\"}'),('3c9c0296-9fe4-44ec-8f97-4d099362ccf3',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:41','pages/index/index?id=&groupid=&shareid=3c9c0296-9fe4-44ec-8f97-4d099362ccf3',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=3c9c0296-9fe4-44ec-8f97-4d099362ccf3\"}'),('3d550186-4f7d-4ede-87e7-6829301f0f22',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:52','pages/index/index?id=&groupid=&shareid=3d550186-4f7d-4ede-87e7-6829301f0f22',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=3d550186-4f7d-4ede-87e7-6829301f0f22\"}'),('3d7afdc4-1c9b-4256-8719-ce1989de4a93',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:44','pages/square/square?shareid=3d7afdc4-1c9b-4256-8719-ce1989de4a93',0,NULL,'{\"url\":\"pages/square/square?shareid=3d7afdc4-1c9b-4256-8719-ce1989de4a93\"}'),('415b82fb-b914-4666-b07d-3b17db215f5c',NULL,'oyDfX5fSoDQas5aWB_VzQX4TFaTE','2019-01-26 14:47:52','pages/index/index?id=238&groupid=1548485268100&shareid=415b82fb-b914-4666-b07d-3b17db215f5c',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485268100\",\"url\":\"pages/index/index?id=238&groupid=1548485268100&shareid=415b82fb-b914-4666-b07d-3b17db215f5c\"}'),('418274d9-95e5-413f-9061-3acaf98b1add',NULL,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-28 19:12:45','/pages/index/index?id=247&shareid=418274d9-95e5-413f-9061-3acaf98b1add',0,NULL,'{\"id\":\"247\",\"url\":\"/pages/index/index?id=247&shareid=418274d9-95e5-413f-9061-3acaf98b1add\"}'),('41d00c78-ddc5-4cf1-9799-e78b3685e528',NULL,'oyDfX5SeacO13l9O4VflSzi2LG9U','2019-01-26 14:55:58','pages/index/index?id=238&groupid=1548485497305&shareid=41d00c78-ddc5-4cf1-9799-e78b3685e528',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485497305\",\"url\":\"pages/index/index?id=238&groupid=1548485497305&shareid=41d00c78-ddc5-4cf1-9799-e78b3685e528\"}'),('41fc27b4-9e36-4847-8580-e017b70dd26e',NULL,'oyDfX5b4J-XqvmJ5QR_69rqC48gE','2019-01-26 15:50:30','pages/index/index?id=238&groupid=1548485028950&shareid=41fc27b4-9e36-4847-8580-e017b70dd26e',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485028950\",\"url\":\"pages/index/index?id=238&groupid=1548485028950&shareid=41fc27b4-9e36-4847-8580-e017b70dd26e\"}'),('41ffe09e-e216-4c4b-a24a-f4f46b0b750b',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:07','pages/index/index?id=&groupid=&shareid=41ffe09e-e216-4c4b-a24a-f4f46b0b750b',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=41ffe09e-e216-4c4b-a24a-f4f46b0b750b\"}'),('4529a34f-696f-4f18-9756-1281a8f7fa34',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:17:52','pages/index/index?id=230&groupid=&shareid=4529a34f-696f-4f18-9756-1281a8f7fa34',0,NULL,'{\"id\":\"230\",\"url\":\"pages/index/index?id=230&groupid=&shareid=4529a34f-696f-4f18-9756-1281a8f7fa34\"}'),('46eef2e8-43ce-411d-99c4-83df5c27ba98',NULL,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 13:44:51','/pages/index/index?id=236&shareid=46eef2e8-43ce-411d-99c4-83df5c27ba98',0,NULL,'{\"id\":\"236\",\"url\":\"/pages/index/index?id=236&shareid=46eef2e8-43ce-411d-99c4-83df5c27ba98\"}'),('47128047-520a-4e0c-a599-acce8bd10ae9',NULL,'oyDfX5RzkA66rAskTi96noDXjrHw','2019-01-26 17:05:00','pages/square/square?shareid=47128047-520a-4e0c-a599-acce8bd10ae9',0,NULL,'{\"url\":\"pages/square/square?shareid=47128047-520a-4e0c-a599-acce8bd10ae9\"}'),('47c1eb0f-2b0f-4ad6-8e42-e893750db77e',NULL,'oyDfX5eKWm6GwZqa51qzoOstKc6k','2019-01-26 14:02:01','pages/index/index?id=238&groupid=1548482517842&shareid=47c1eb0f-2b0f-4ad6-8e42-e893750db77e',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482517842\",\"url\":\"pages/index/index?id=238&groupid=1548482517842&shareid=47c1eb0f-2b0f-4ad6-8e42-e893750db77e\"}'),('49809ad8-f111-41f8-9161-dc0a18bde97e',NULL,'oyDfX5TOzphREg9175rNm15SVCiM','2019-01-26 13:56:34','pages/index/index?id=238&groupid=1548482186939&shareid=49809ad8-f111-41f8-9161-dc0a18bde97e',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482186939\",\"url\":\"pages/index/index?id=238&groupid=1548482186939&shareid=49809ad8-f111-41f8-9161-dc0a18bde97e\"}'),('4989a7ca-796c-404b-b726-c005514acfc5',NULL,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:01:33','pages/index/index?id=238&groupid=1548482489202&shareid=4989a7ca-796c-404b-b726-c005514acfc5',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482489202\",\"url\":\"pages/index/index?id=238&groupid=1548482489202&shareid=4989a7ca-796c-404b-b726-c005514acfc5\"}'),('49b90c1b-df19-4abd-8883-1d398dc6a6be',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:56','pages/square/square?shareid=49b90c1b-df19-4abd-8883-1d398dc6a6be',0,NULL,'{\"url\":\"pages/square/square?shareid=49b90c1b-df19-4abd-8883-1d398dc6a6be\"}'),('4ae2dea4-41ca-4f1a-a433-8e4a60713bf4',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:45','pages/index/index?id=&groupid=&shareid=4ae2dea4-41ca-4f1a-a433-8e4a60713bf4',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=4ae2dea4-41ca-4f1a-a433-8e4a60713bf4\"}'),('4c4721cb-d195-4fe8-9351-ca8b773b8997',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:58:46','pages/square/square?shareid=4c4721cb-d195-4fe8-9351-ca8b773b8997',0,NULL,'{\"url\":\"pages/square/square?shareid=4c4721cb-d195-4fe8-9351-ca8b773b8997\"}'),('4dda31a5-e568-4f9d-bc90-4f64baa00ca1',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:11','pages/index/index?id=&groupid=&shareid=4dda31a5-e568-4f9d-bc90-4f64baa00ca1',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=4dda31a5-e568-4f9d-bc90-4f64baa00ca1\"}'),('4f727189-5fdb-4ecd-a0af-7e8b21b49659',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:00','pages/square/square?shareid=4f727189-5fdb-4ecd-a0af-7e8b21b49659',0,NULL,'{\"url\":\"pages/square/square?shareid=4f727189-5fdb-4ecd-a0af-7e8b21b49659\"}'),('501a1f2c-0511-4c31-8d85-8ef1157b5c2c',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:35','pages/square/square?shareid=501a1f2c-0511-4c31-8d85-8ef1157b5c2c',0,NULL,'{\"url\":\"pages/square/square?shareid=501a1f2c-0511-4c31-8d85-8ef1157b5c2c\"}'),('51b46bce-10ad-4504-9806-f2021f2b6465',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:51','pages/square/square?shareid=51b46bce-10ad-4504-9806-f2021f2b6465',0,NULL,'{\"url\":\"pages/square/square?shareid=51b46bce-10ad-4504-9806-f2021f2b6465\"}'),('52152ad7-a408-431f-90e7-fdbe7df7c393',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:30','pages/index/index?id=228&groupid=&shareid=52152ad7-a408-431f-90e7-fdbe7df7c393',0,NULL,'{\"id\":\"228\",\"url\":\"pages/index/index?id=228&groupid=&shareid=52152ad7-a408-431f-90e7-fdbe7df7c393\"}'),('532daecf-080e-4587-b712-542c2ab0a977',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:50','pages/index/index?id=228&groupid=&shareid=532daecf-080e-4587-b712-542c2ab0a977',0,NULL,'{\"id\":\"228\",\"url\":\"pages/index/index?id=228&groupid=&shareid=532daecf-080e-4587-b712-542c2ab0a977\"}'),('54d7a799-dc97-4995-9576-b9f192325d99',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:24','pages/square/square?shareid=54d7a799-dc97-4995-9576-b9f192325d99',0,NULL,'{\"url\":\"pages/square/square?shareid=54d7a799-dc97-4995-9576-b9f192325d99\"}'),('57bd4ce7-3a19-4022-95de-20b033e03530',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:06:14','pages/index/index?id=228&groupid=&shareid=57bd4ce7-3a19-4022-95de-20b033e03530',0,NULL,'{\"id\":\"228\",\"url\":\"pages/index/index?id=228&groupid=&shareid=57bd4ce7-3a19-4022-95de-20b033e03530\"}'),('58aad3f3-7a72-422c-914c-43a3953e9be6',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:58:42','pages/square/square?shareid=58aad3f3-7a72-422c-914c-43a3953e9be6',0,NULL,'{\"url\":\"pages/square/square?shareid=58aad3f3-7a72-422c-914c-43a3953e9be6\"}'),('58bacc68-8cc2-4eb7-9160-b72010f37d4f',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:04','pages/square/square?shareid=58bacc68-8cc2-4eb7-9160-b72010f37d4f',0,NULL,'{\"url\":\"pages/square/square?shareid=58bacc68-8cc2-4eb7-9160-b72010f37d4f\"}'),('59a119af-cbd5-48c9-a61d-3e52eb44a69e',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:49','pages/square/square?shareid=59a119af-cbd5-48c9-a61d-3e52eb44a69e',0,NULL,'{\"url\":\"pages/square/square?shareid=59a119af-cbd5-48c9-a61d-3e52eb44a69e\"}'),('5cf9ac33-7a02-4c50-8f83-8c2c7db3adf2',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:55:27','/pages/index/index?id=238&shareid=5cf9ac33-7a02-4c50-8f83-8c2c7db3adf2',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=5cf9ac33-7a02-4c50-8f83-8c2c7db3adf2\"}'),('5da9f352-a4ca-444c-8f4a-408f2683cc72',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:59:18','pages/index/index?id=238&groupid=1548482328457&shareid=5da9f352-a4ca-444c-8f4a-408f2683cc72',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482328457\",\"url\":\"pages/index/index?id=238&groupid=1548482328457&shareid=5da9f352-a4ca-444c-8f4a-408f2683cc72\"}'),('5e6faf8e-e7f1-4357-9f9d-dd75eff006ba',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:13','pages/square/square?shareid=5e6faf8e-e7f1-4357-9f9d-dd75eff006ba',0,NULL,'{\"url\":\"pages/square/square?shareid=5e6faf8e-e7f1-4357-9f9d-dd75eff006ba\"}'),('5fc01862-913e-4f31-8d9f-e4660ccbdf16',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:09','pages/index/index?id=&groupid=&shareid=5fc01862-913e-4f31-8d9f-e4660ccbdf16',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=5fc01862-913e-4f31-8d9f-e4660ccbdf16\"}'),('606440a5-3d88-49e8-b500-d3594ce22eaa',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:27','pages/square/square?shareid=606440a5-3d88-49e8-b500-d3594ce22eaa',0,NULL,'{\"url\":\"pages/square/square?shareid=606440a5-3d88-49e8-b500-d3594ce22eaa\"}'),('619ce865-4f4a-4402-b867-532a2002cae6',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:06','pages/square/square?shareid=619ce865-4f4a-4402-b867-532a2002cae6',0,NULL,'{\"url\":\"pages/square/square?shareid=619ce865-4f4a-4402-b867-532a2002cae6\"}'),('619d5d48-0796-4307-93ea-f1f351b68a36',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:55','pages/square/square?shareid=619d5d48-0796-4307-93ea-f1f351b68a36',0,NULL,'{\"url\":\"pages/square/square?shareid=619d5d48-0796-4307-93ea-f1f351b68a36\"}'),('61faf022-0280-4bb3-a767-82ef453dacf5',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:47','pages/index/index?id=&groupid=&shareid=61faf022-0280-4bb3-a767-82ef453dacf5',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=61faf022-0280-4bb3-a767-82ef453dacf5\"}'),('6210965f-4b5a-4e43-a48e-fd96be151c8e',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:31','pages/square/square?shareid=6210965f-4b5a-4e43-a48e-fd96be151c8e',0,NULL,'{\"url\":\"pages/square/square?shareid=6210965f-4b5a-4e43-a48e-fd96be151c8e\"}'),('624fe44e-f635-4842-bbb8-2cec405ec533',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:02:48','pages/square/square?shareid=624fe44e-f635-4842-bbb8-2cec405ec533',0,NULL,'{\"url\":\"pages/square/square?shareid=624fe44e-f635-4842-bbb8-2cec405ec533\"}'),('62bcb182-ca1c-48ef-86e5-291845798636',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:23','pages/square/square?shareid=62bcb182-ca1c-48ef-86e5-291845798636',0,NULL,'{\"url\":\"pages/square/square?shareid=62bcb182-ca1c-48ef-86e5-291845798636\"}'),('62c77941-82e2-4545-b986-992cbf4dccaf',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:35','pages/square/square?shareid=62c77941-82e2-4545-b986-992cbf4dccaf',0,NULL,'{\"url\":\"pages/square/square?shareid=62c77941-82e2-4545-b986-992cbf4dccaf\"}'),('6399bed3-3848-4bc3-b8ad-d98214e6f26d',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:57','pages/index/index?id=&groupid=&shareid=6399bed3-3848-4bc3-b8ad-d98214e6f26d',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=6399bed3-3848-4bc3-b8ad-d98214e6f26d\"}'),('63f0dfed-835a-4f74-a187-298543ae29dd',NULL,'oyDfX5RzkA66rAskTi96noDXjrHw','2019-01-26 16:40:56','pages/index/index?id=228&groupid=&shareid=63f0dfed-835a-4f74-a187-298543ae29dd',0,NULL,'{\"id\":\"228\",\"url\":\"pages/index/index?id=228&groupid=&shareid=63f0dfed-835a-4f74-a187-298543ae29dd\"}'),('640d2e5f-22e8-4cf2-bbb9-9b7c686f8081',NULL,'oyDfX5ZM7mPiujg09jcRnxoF9ogY','2019-01-26 15:34:57','pages/index/index?id=238&groupid=1548488088248&shareid=640d2e5f-22e8-4cf2-bbb9-9b7c686f8081',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548488088248\",\"url\":\"pages/index/index?id=238&groupid=1548488088248&shareid=640d2e5f-22e8-4cf2-bbb9-9b7c686f8081\"}'),('67cd9899-80c8-41d9-bebe-0f5fec4af3c3',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:51:54','pages/square/square?shareid=67cd9899-80c8-41d9-bebe-0f5fec4af3c3',0,NULL,'{\"url\":\"pages/square/square?shareid=67cd9899-80c8-41d9-bebe-0f5fec4af3c3\"}'),('694cdc99-c7cc-43ee-8acc-584f8cbf6dcb',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:09','pages/index/index?id=&groupid=&shareid=694cdc99-c7cc-43ee-8acc-584f8cbf6dcb',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=694cdc99-c7cc-43ee-8acc-584f8cbf6dcb\"}'),('6baf1911-d061-4f20-ac2a-4b2ce6f1336a',NULL,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:15:18','pages/index/index?id=238&groupid=1548483294937&shareid=6baf1911-d061-4f20-ac2a-4b2ce6f1336a',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483294937\",\"url\":\"pages/index/index?id=238&groupid=1548483294937&shareid=6baf1911-d061-4f20-ac2a-4b2ce6f1336a\"}'),('6d9074f5-880b-4491-acd2-7d49d2cb7285',NULL,'oyDfX5bXeLUabBzhTkw2TcB6O69g','2019-01-26 14:17:58','pages/index/index?id=238&groupid=1548483430184&shareid=6d9074f5-880b-4491-acd2-7d49d2cb7285',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483430184\",\"url\":\"pages/index/index?id=238&groupid=1548483430184&shareid=6d9074f5-880b-4491-acd2-7d49d2cb7285\"}'),('6ded1c45-4a52-4195-9baa-7d1c96518796',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:26','pages/index/index?id=&groupid=&shareid=6ded1c45-4a52-4195-9baa-7d1c96518796',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=6ded1c45-4a52-4195-9baa-7d1c96518796\"}'),('6eaa1931-de8b-499b-8db7-9efa7e1fd195',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:25','pages/square/square?shareid=6eaa1931-de8b-499b-8db7-9efa7e1fd195',0,NULL,'{\"url\":\"pages/square/square?shareid=6eaa1931-de8b-499b-8db7-9efa7e1fd195\"}'),('6fe4e590-baae-41cb-8412-86f07d87b3fa',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:19','pages/index/index?id=&groupid=&shareid=6fe4e590-baae-41cb-8412-86f07d87b3fa',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=6fe4e590-baae-41cb-8412-86f07d87b3fa\"}'),('714a35e6-10ff-4ee6-85b2-f7a4e616628a',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:36:35','/pages/index/index?id=250&shareid=714a35e6-10ff-4ee6-85b2-f7a4e616628a',0,NULL,'{\"id\":\"250\",\"url\":\"/pages/index/index?id=250&shareid=714a35e6-10ff-4ee6-85b2-f7a4e616628a\"}'),('769e68db-0e53-4260-b8a8-4d4e52b432ba',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:35','pages/square/square?shareid=769e68db-0e53-4260-b8a8-4d4e52b432ba',0,NULL,'{\"url\":\"pages/square/square?shareid=769e68db-0e53-4260-b8a8-4d4e52b432ba\"}'),('77e8665e-9864-4855-9136-7fe2e7ed721b',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:28','pages/index/index?id=&groupid=&shareid=77e8665e-9864-4855-9136-7fe2e7ed721b',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=77e8665e-9864-4855-9136-7fe2e7ed721b\"}'),('78203d2e-4c15-49a1-9181-8095f588827b',NULL,'oyDfX5SeacO13l9O4VflSzi2LG9U','2019-01-26 14:52:10','pages/index/index?id=238&groupid=1548485497305&shareid=78203d2e-4c15-49a1-9181-8095f588827b',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485497305\",\"url\":\"pages/index/index?id=238&groupid=1548485497305&shareid=78203d2e-4c15-49a1-9181-8095f588827b\"}'),('7947f6c4-642b-431d-ae34-0eafcb9872af',NULL,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:59:43','pages/index/index?id=238&groupid=1548482380770&shareid=7947f6c4-642b-431d-ae34-0eafcb9872af',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482380770\",\"url\":\"pages/index/index?id=238&groupid=1548482380770&shareid=7947f6c4-642b-431d-ae34-0eafcb9872af\"}'),('7949b6a8-8699-49df-8ed5-c40d7531f08a',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:04','pages/square/square?shareid=7949b6a8-8699-49df-8ed5-c40d7531f08a',0,NULL,'{\"url\":\"pages/square/square?shareid=7949b6a8-8699-49df-8ed5-c40d7531f08a\"}'),('7c2ff03e-0082-41df-b4e8-01d89ea9994e',NULL,'oyDfX5RzkA66rAskTi96noDXjrHw','2019-01-26 18:45:32','pages/index/index?id=234&groupid=&shareid=7c2ff03e-0082-41df-b4e8-01d89ea9994e',0,NULL,'{\"id\":\"234\",\"url\":\"pages/index/index?id=234&groupid=&shareid=7c2ff03e-0082-41df-b4e8-01d89ea9994e\"}'),('7d24c146-1633-4a07-8225-1aa83398cb85',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:55:43','/pages/index/index?id=238&shareid=7d24c146-1633-4a07-8225-1aa83398cb85',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=7d24c146-1633-4a07-8225-1aa83398cb85\"}'),('7d96328f-0ebb-4cda-aa75-95a54b39963c',NULL,'oyDfX5YuuV-mI4BJcsACr2RqGCHU','2019-01-26 14:33:41','pages/index/index?id=238&groupid=1548484000406&shareid=7d96328f-0ebb-4cda-aa75-95a54b39963c',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548484000406\",\"url\":\"pages/index/index?id=238&groupid=1548484000406&shareid=7d96328f-0ebb-4cda-aa75-95a54b39963c\"}'),('7dd34bc6-0989-4493-9942-f88db1d75c36',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:40','pages/square/square?shareid=7dd34bc6-0989-4493-9942-f88db1d75c36',0,NULL,'{\"url\":\"pages/square/square?shareid=7dd34bc6-0989-4493-9942-f88db1d75c36\"}'),('7e426cd4-12ae-4550-9c8f-d4ad929e43fc',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:26','pages/square/square?shareid=7e426cd4-12ae-4550-9c8f-d4ad929e43fc',0,NULL,'{\"url\":\"pages/square/square?shareid=7e426cd4-12ae-4550-9c8f-d4ad929e43fc\"}'),('7f79e27f-5dd3-4f0b-88b2-90b78166ffd5',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 13:15:27','/pages/index/index?id=230&shareid=7f79e27f-5dd3-4f0b-88b2-90b78166ffd5',0,NULL,'{\"id\":\"230\",\"url\":\"/pages/index/index?id=230&shareid=7f79e27f-5dd3-4f0b-88b2-90b78166ffd5\"}'),('83b51986-eea3-45da-9abe-072f0d0cd4cf',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:51:50','pages/square/square?shareid=83b51986-eea3-45da-9abe-072f0d0cd4cf',0,NULL,'{\"url\":\"pages/square/square?shareid=83b51986-eea3-45da-9abe-072f0d0cd4cf\"}'),('84babd1b-5088-4154-a9b7-a322ceee061d',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:14:36','pages/square/square?shareid=84babd1b-5088-4154-a9b7-a322ceee061d',0,NULL,'{\"url\":\"pages/square/square?shareid=84babd1b-5088-4154-a9b7-a322ceee061d\"}'),('85b7e501-fdfc-4791-a97d-496e55f028a5',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:54:11','/pages/index/index?id=238&shareid=85b7e501-fdfc-4791-a97d-496e55f028a5',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=85b7e501-fdfc-4791-a97d-496e55f028a5\"}'),('86e19d7e-4a44-4fc5-ad63-a516eceaa3b5',NULL,'oyDfX5SvyYczqfIlSIlGQ2EYtHuQ','2019-01-26 14:05:59','pages/index/index?id=238&groupid=1548482701115&shareid=86e19d7e-4a44-4fc5-ad63-a516eceaa3b5',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482701115\",\"url\":\"pages/index/index?id=238&groupid=1548482701115&shareid=86e19d7e-4a44-4fc5-ad63-a516eceaa3b5\"}'),('8a3230ec-c126-49d0-b225-b9d594543165',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:51:02','pages/square/square?shareid=8a3230ec-c126-49d0-b225-b9d594543165',0,NULL,'{\"url\":\"pages/square/square?shareid=8a3230ec-c126-49d0-b225-b9d594543165\"}'),('8aaaf211-ef59-4a71-9069-b36a8ea8c4df',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:54:01','/pages/index/index?id=238&shareid=8aaaf211-ef59-4a71-9069-b36a8ea8c4df',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=8aaaf211-ef59-4a71-9069-b36a8ea8c4df\"}'),('8b312e12-fbbd-4436-9d44-bf5e19c3db18',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:55:08','/pages/index/index?id=238&shareid=8b312e12-fbbd-4436-9d44-bf5e19c3db18',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=8b312e12-fbbd-4436-9d44-bf5e19c3db18\"}'),('8d2e621a-d952-4458-8ee8-f4dcec5ae55f',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:21','pages/square/square?shareid=8d2e621a-d952-4458-8ee8-f4dcec5ae55f',0,NULL,'{\"url\":\"pages/square/square?shareid=8d2e621a-d952-4458-8ee8-f4dcec5ae55f\"}'),('919ab949-09aa-4b83-876a-0c842d585005',NULL,'oyDfX5fEd-sVl30oGT5PmaTm7Xok','2019-01-26 14:42:29','pages/index/index?id=238&groupid=1548484939067&shareid=919ab949-09aa-4b83-876a-0c842d585005',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548484939067\",\"url\":\"pages/index/index?id=238&groupid=1548484939067&shareid=919ab949-09aa-4b83-876a-0c842d585005\"}'),('91a1417a-228a-46f4-8e78-f554e315c5f6',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 16:30:51','pages/square/square?shareid=91a1417a-228a-46f4-8e78-f554e315c5f6',0,NULL,'{\"url\":\"pages/square/square?shareid=91a1417a-228a-46f4-8e78-f554e315c5f6\"}'),('9321b3f2-8811-4d5b-8155-dfcee26a4d87',NULL,'oyDfX5SeacO13l9O4VflSzi2LG9U','2019-01-26 18:01:51','pages/index/index?id=238&groupid=1548485497305&shareid=9321b3f2-8811-4d5b-8155-dfcee26a4d87',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485497305\",\"url\":\"pages/index/index?id=238&groupid=1548485497305&shareid=9321b3f2-8811-4d5b-8155-dfcee26a4d87\"}'),('93aad659-37f0-46f4-b308-c0494cc084a8',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:58:52','pages/index/index?id=238&groupid=1548482328457&shareid=93aad659-37f0-46f4-b308-c0494cc084a8',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482328457\",\"url\":\"pages/index/index?id=238&groupid=1548482328457&shareid=93aad659-37f0-46f4-b308-c0494cc084a8\"}'),('9556b476-c521-414b-a32f-3632e14488c9',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:06:22','pages/index/index?id=&groupid=&shareid=9556b476-c521-414b-a32f-3632e14488c9',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=9556b476-c521-414b-a32f-3632e14488c9\"}'),('97e5fe07-ac15-4a73-a0e8-597b59a73c18',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:33:21','pages/square/square?shareid=97e5fe07-ac15-4a73-a0e8-597b59a73c18',0,NULL,'{\"url\":\"pages/square/square?shareid=97e5fe07-ac15-4a73-a0e8-597b59a73c18\"}'),('98ca1555-a353-49d4-9710-19c1ad85cd97',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:54:51','/pages/index/index?id=238&shareid=98ca1555-a353-49d4-9710-19c1ad85cd97',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=98ca1555-a353-49d4-9710-19c1ad85cd97\"}'),('98f68df0-9150-4d9f-9b44-ecd7673bd1a9',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:13','pages/index/index?id=&groupid=&shareid=98f68df0-9150-4d9f-9b44-ecd7673bd1a9',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=98f68df0-9150-4d9f-9b44-ecd7673bd1a9\"}'),('9a6eeb5e-d9cf-40f5-854c-daa720499553',NULL,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 10:51:47','pages/index/index?id=238&groupid=1548482489202&shareid=9a6eeb5e-d9cf-40f5-854c-daa720499553',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482489202\",\"url\":\"pages/index/index?id=238&groupid=1548482489202&shareid=9a6eeb5e-d9cf-40f5-854c-daa720499553\"}'),('9c42792c-e524-4f08-83a9-69431e10a05a',NULL,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:15:49','pages/index/index?id=238&groupid=1548483294937&shareid=9c42792c-e524-4f08-83a9-69431e10a05a',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483294937\",\"url\":\"pages/index/index?id=238&groupid=1548483294937&shareid=9c42792c-e524-4f08-83a9-69431e10a05a\"}'),('9c77971e-74bf-4ea2-a06a-e6cb4277ebc2',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:31','pages/index/index?id=&groupid=&shareid=9c77971e-74bf-4ea2-a06a-e6cb4277ebc2',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=9c77971e-74bf-4ea2-a06a-e6cb4277ebc2\"}'),('9effabb9-3e65-47b3-b96c-618f2f2b6438',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:27:39','/pages/index/index?id=250&shareid=9effabb9-3e65-47b3-b96c-618f2f2b6438',0,NULL,'{\"id\":\"250\",\"url\":\"/pages/index/index?id=250&shareid=9effabb9-3e65-47b3-b96c-618f2f2b6438\"}'),('9fb7862c-b69a-4c4e-b806-00578279c434',NULL,'oyDfX5b4J-XqvmJ5QR_69rqC48gE','2019-01-26 14:44:17','pages/index/index?id=238&groupid=1548485028950&shareid=9fb7862c-b69a-4c4e-b806-00578279c434',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485028950\",\"url\":\"pages/index/index?id=238&groupid=1548485028950&shareid=9fb7862c-b69a-4c4e-b806-00578279c434\"}'),('a41ce02b-9b3b-49e4-a187-331bff603a14',NULL,'oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','2019-01-26 13:56:09','pages/index/index?id=238&groupid=1548482163929&shareid=a41ce02b-9b3b-49e4-a187-331bff603a14',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482163929\",\"url\":\"pages/index/index?id=238&groupid=1548482163929&shareid=a41ce02b-9b3b-49e4-a187-331bff603a14\"}'),('a48aaa89-9639-4b64-8046-c147a4b0b19c',NULL,'oyDfX5TEyupNwD3a2nuuIO0bGMQE','2019-01-26 15:06:12','pages/index/index?id=238&groupid=1548486367361&shareid=a48aaa89-9639-4b64-8046-c147a4b0b19c',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548486367361\",\"url\":\"pages/index/index?id=238&groupid=1548486367361&shareid=a48aaa89-9639-4b64-8046-c147a4b0b19c\"}'),('a4e01232-7211-49be-aba5-b928133e4fd3',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:53','pages/square/square?shareid=a4e01232-7211-49be-aba5-b928133e4fd3',0,NULL,'{\"url\":\"pages/square/square?shareid=a4e01232-7211-49be-aba5-b928133e4fd3\"}'),('a5948698-d414-4862-8878-425049f6a97a',NULL,'oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:35:20','/pages/index/index?id=235&shareid=a5948698-d414-4862-8878-425049f6a97a',0,NULL,'{\"id\":\"235\",\"url\":\"/pages/index/index?id=235&shareid=a5948698-d414-4862-8878-425049f6a97a\"}'),('a63afa47-25b3-4b93-a222-2f13328fcaab',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:36','pages/index/index?id=&groupid=&shareid=a63afa47-25b3-4b93-a222-2f13328fcaab',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=a63afa47-25b3-4b93-a222-2f13328fcaab\"}'),('a68246d1-1f8d-4a7b-a457-d9f51940bd0d',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:05:19','pages/square/square?shareid=a68246d1-1f8d-4a7b-a457-d9f51940bd0d',0,NULL,'{\"url\":\"pages/square/square?shareid=a68246d1-1f8d-4a7b-a457-d9f51940bd0d\"}'),('a7e26508-b3c0-4ed1-a16a-149e325ddcc2',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:05','pages/index/index?id=&groupid=&shareid=a7e26508-b3c0-4ed1-a16a-149e325ddcc2',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=a7e26508-b3c0-4ed1-a16a-149e325ddcc2\"}'),('aa8360b6-819a-4d77-afe7-47b0b3747f0e',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:21','pages/square/square?shareid=aa8360b6-819a-4d77-afe7-47b0b3747f0e',0,NULL,'{\"url\":\"pages/square/square?shareid=aa8360b6-819a-4d77-afe7-47b0b3747f0e\"}'),('aaa3e96f-40f1-4b4b-ad18-fa4e803b5398',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:47','pages/index/index?id=238&groupid=&shareid=aaa3e96f-40f1-4b4b-ad18-fa4e803b5398',0,NULL,'{\"id\":\"238\",\"url\":\"pages/index/index?id=238&groupid=&shareid=aaa3e96f-40f1-4b4b-ad18-fa4e803b5398\"}'),('ac03e14f-c9d9-48bc-a884-a07adb6f196b',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:36','pages/index/index?id=&groupid=&shareid=ac03e14f-c9d9-48bc-a884-a07adb6f196b',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=ac03e14f-c9d9-48bc-a884-a07adb6f196b\"}'),('aea3ce40-2a90-4f3c-a83e-1f152c9e1cb8',NULL,'oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','2019-01-26 13:56:16','pages/index/index?id=238&groupid=1548482163929&shareid=aea3ce40-2a90-4f3c-a83e-1f152c9e1cb8',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482163929\",\"url\":\"pages/index/index?id=238&groupid=1548482163929&shareid=aea3ce40-2a90-4f3c-a83e-1f152c9e1cb8\"}'),('af4af04b-7d21-462a-8aaa-35d7609854b0',NULL,'oyDfX5fSoDQas5aWB_VzQX4TFaTE','2019-01-26 15:53:25','pages/index/index?id=238&groupid=1548485268100&shareid=af4af04b-7d21-462a-8aaa-35d7609854b0',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485268100\",\"url\":\"pages/index/index?id=238&groupid=1548485268100&shareid=af4af04b-7d21-462a-8aaa-35d7609854b0\"}'),('af4ea43e-0d54-4738-9900-4ab6657940de',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:01','pages/index/index?id=&groupid=&shareid=af4ea43e-0d54-4738-9900-4ab6657940de',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=af4ea43e-0d54-4738-9900-4ab6657940de\"}'),('b536d784-dee1-4974-927e-c5e261c2d9b3',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:11','pages/square/square?shareid=b536d784-dee1-4974-927e-c5e261c2d9b3',0,NULL,'{\"url\":\"pages/square/square?shareid=b536d784-dee1-4974-927e-c5e261c2d9b3\"}'),('b599fab0-e476-4f17-a817-c3898f432776',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 14:03:59','pages/index/index?id=238&groupid=1548482328457&shareid=b599fab0-e476-4f17-a817-c3898f432776',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482328457\",\"url\":\"pages/index/index?id=238&groupid=1548482328457&shareid=b599fab0-e476-4f17-a817-c3898f432776\"}'),('b7d533c4-c830-4686-a049-2563cec928bd',NULL,'oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:17:32','pages/index/index?id=238&groupid=1548483294937&shareid=b7d533c4-c830-4686-a049-2563cec928bd',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483294937\",\"url\":\"pages/index/index?id=238&groupid=1548483294937&shareid=b7d533c4-c830-4686-a049-2563cec928bd\"}'),('b8df1403-b2d1-485f-99aa-7c4eb2b010fd',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:54:59','/pages/index/index?id=238&shareid=b8df1403-b2d1-485f-99aa-7c4eb2b010fd',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=b8df1403-b2d1-485f-99aa-7c4eb2b010fd\"}'),('bc004205-7b29-408a-910a-fcd2d0b1e329',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:24:42','/pages/index/index?id=249&shareid=bc004205-7b29-408a-910a-fcd2d0b1e329',0,NULL,'{\"id\":\"249\",\"url\":\"/pages/index/index?id=249&shareid=bc004205-7b29-408a-910a-fcd2d0b1e329\"}'),('bc628707-560f-484c-a6c5-1bfca2a9f966',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:37','pages/square/square?shareid=bc628707-560f-484c-a6c5-1bfca2a9f966',0,NULL,'{\"url\":\"pages/square/square?shareid=bc628707-560f-484c-a6c5-1bfca2a9f966\"}'),('bde30f86-597f-4c1d-aa99-9815bb282532',NULL,'oyDfX5YMQw1iamBNIwNeC6i7N7ew','2019-01-26 18:29:21','pages/square/square?shareid=bde30f86-597f-4c1d-aa99-9815bb282532',0,NULL,'{\"url\":\"pages/square/square?shareid=bde30f86-597f-4c1d-aa99-9815bb282532\"}'),('be6d741d-7ba6-4537-a56c-2ecbe0658eb7',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:34','pages/index/index?id=&groupid=&shareid=be6d741d-7ba6-4537-a56c-2ecbe0658eb7',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=be6d741d-7ba6-4537-a56c-2ecbe0658eb7\"}'),('befaad16-be65-4afa-84ab-3c907b9f07d7',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:38','pages/square/square?shareid=befaad16-be65-4afa-84ab-3c907b9f07d7',0,NULL,'{\"url\":\"pages/square/square?shareid=befaad16-be65-4afa-84ab-3c907b9f07d7\"}'),('bf00d371-f837-4994-a64f-a7ab79c5d08c',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:51:57','pages/square/square?shareid=bf00d371-f837-4994-a64f-a7ab79c5d08c',0,NULL,'{\"url\":\"pages/square/square?shareid=bf00d371-f837-4994-a64f-a7ab79c5d08c\"}'),('bf79b9cc-5b2a-4e81-86d5-e60b119950ab',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:15:02','pages/index/index?id=229&groupid=&shareid=bf79b9cc-5b2a-4e81-86d5-e60b119950ab',0,NULL,'{\"id\":\"229\",\"url\":\"pages/index/index?id=229&groupid=&shareid=bf79b9cc-5b2a-4e81-86d5-e60b119950ab\"}'),('c0ed1302-ef19-49a9-a02b-a9f38fd85e2e',NULL,'oyDfX5YMQw1iamBNIwNeC6i7N7ew','2019-01-26 21:33:38','pages/index/index?id=&groupid=&shareid=c0ed1302-ef19-49a9-a02b-a9f38fd85e2e',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=c0ed1302-ef19-49a9-a02b-a9f38fd85e2e\"}'),('c1799517-13e2-47d2-aa00-195bd8486e90',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:17','pages/index/index?id=&groupid=&shareid=c1799517-13e2-47d2-aa00-195bd8486e90',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=c1799517-13e2-47d2-aa00-195bd8486e90\"}'),('c3d42d7a-57b2-4816-9aff-f5cc9645cdeb',NULL,'oyDfX5aqOeGI7dnuER3v4XCCQozs','2019-01-26 14:51:03','pages/index/index?id=238&groupid=1548485338057&shareid=c3d42d7a-57b2-4816-9aff-f5cc9645cdeb',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485338057\",\"url\":\"pages/index/index?id=238&groupid=1548485338057&shareid=c3d42d7a-57b2-4816-9aff-f5cc9645cdeb\"}'),('c4cf56a5-0f41-4181-9f1c-0e3dacf280c6',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:58:54','pages/index/index?id=&groupid=&shareid=c4cf56a5-0f41-4181-9f1c-0e3dacf280c6',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=c4cf56a5-0f41-4181-9f1c-0e3dacf280c6\"}'),('c540286f-f913-4d76-b7af-81d16beb92f1',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:32','pages/square/square?shareid=c540286f-f913-4d76-b7af-81d16beb92f1',0,NULL,'{\"url\":\"pages/square/square?shareid=c540286f-f913-4d76-b7af-81d16beb92f1\"}'),('c57a2072-664b-4076-a964-98d9328e7438',NULL,'oyDfX5fQDvK0ypGQynW58gfEKtM4','2019-01-26 14:01:28','pages/index/index?id=238&groupid=1548482430097&shareid=c57a2072-664b-4076-a964-98d9328e7438',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482430097\",\"url\":\"pages/index/index?id=238&groupid=1548482430097&shareid=c57a2072-664b-4076-a964-98d9328e7438\"}'),('c66c4645-92fb-4338-a52a-8425f159a572',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:31','pages/square/square?shareid=c66c4645-92fb-4338-a52a-8425f159a572',0,NULL,'{\"url\":\"pages/square/square?shareid=c66c4645-92fb-4338-a52a-8425f159a572\"}'),('c8942111-1afe-496c-b4c5-b9bc35693d6d',NULL,'oyDfX5SeacO13l9O4VflSzi2LG9U','2019-01-26 14:51:49','pages/index/index?id=238&groupid=1548485497305&shareid=c8942111-1afe-496c-b4c5-b9bc35693d6d',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548485497305\",\"url\":\"pages/index/index?id=238&groupid=1548485497305&shareid=c8942111-1afe-496c-b4c5-b9bc35693d6d\"}'),('ca307fd3-d96d-4a9c-b4aa-4bb483dd7f9a',NULL,'oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:25:06','/pages/index/index?id=232&shareid=ca307fd3-d96d-4a9c-b4aa-4bb483dd7f9a',0,NULL,'{\"id\":\"232\",\"url\":\"/pages/index/index?id=232&shareid=ca307fd3-d96d-4a9c-b4aa-4bb483dd7f9a\"}'),('cce5ed51-d930-4c83-b76c-3440d97c4168',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:25','pages/index/index?id=&groupid=&shareid=cce5ed51-d930-4c83-b76c-3440d97c4168',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=cce5ed51-d930-4c83-b76c-3440d97c4168\"}'),('cf314488-6229-48bb-83c5-2e3a11bab4af',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:15','pages/square/square?shareid=cf314488-6229-48bb-83c5-2e3a11bab4af',0,NULL,'{\"url\":\"pages/square/square?shareid=cf314488-6229-48bb-83c5-2e3a11bab4af\"}'),('d0a722f0-a43f-449e-8edf-d67edea214ff',NULL,'oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 14:00:37','pages/index/index?id=238&groupid=1548482380770&shareid=d0a722f0-a43f-449e-8edf-d67edea214ff',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482380770\",\"url\":\"pages/index/index?id=238&groupid=1548482380770&shareid=d0a722f0-a43f-449e-8edf-d67edea214ff\"}'),('d0d91cfc-3a43-4796-b51f-0dec5707d66f',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:20','pages/square/square?shareid=d0d91cfc-3a43-4796-b51f-0dec5707d66f',0,NULL,'{\"url\":\"pages/square/square?shareid=d0d91cfc-3a43-4796-b51f-0dec5707d66f\"}'),('d34a937a-47cf-4c34-857d-6325e0191b2d',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:29','pages/square/square?shareid=d34a937a-47cf-4c34-857d-6325e0191b2d',0,NULL,'{\"url\":\"pages/square/square?shareid=d34a937a-47cf-4c34-857d-6325e0191b2d\"}'),('d68f44c7-5f03-47a5-a390-0784781443c2',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:49:37','pages/index/index?id=228&groupid=&shareid=d68f44c7-5f03-47a5-a390-0784781443c2',0,NULL,'{\"id\":\"228\",\"url\":\"pages/index/index?id=228&groupid=&shareid=d68f44c7-5f03-47a5-a390-0784781443c2\"}'),('d723b533-935d-4366-89a2-7cf794a7a873',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:41','pages/square/square?shareid=d723b533-935d-4366-89a2-7cf794a7a873',0,NULL,'{\"url\":\"pages/square/square?shareid=d723b533-935d-4366-89a2-7cf794a7a873\"}'),('d7d1cc7f-9950-4dfd-8566-c07ee40c3b5c',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:15','pages/square/square?shareid=d7d1cc7f-9950-4dfd-8566-c07ee40c3b5c',0,NULL,'{\"url\":\"pages/square/square?shareid=d7d1cc7f-9950-4dfd-8566-c07ee40c3b5c\"}'),('da72f2e4-8bc5-4dfa-bd4a-c3f0ef54d9d5',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:54:43','/pages/index/index?id=238&shareid=da72f2e4-8bc5-4dfa-bd4a-c3f0ef54d9d5',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=da72f2e4-8bc5-4dfa-bd4a-c3f0ef54d9d5\"}'),('e0b08276-8c05-413c-990e-4e13b6f663ba',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:03:03','pages/index/index?id=&groupid=&shareid=e0b08276-8c05-413c-990e-4e13b6f663ba',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=e0b08276-8c05-413c-990e-4e13b6f663ba\"}'),('e3498cdc-451a-489d-b221-f783b4907447',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:06:42','pages/square/square?shareid=e3498cdc-451a-489d-b221-f783b4907447',0,NULL,'{\"url\":\"pages/square/square?shareid=e3498cdc-451a-489d-b221-f783b4907447\"}'),('e46e6599-db3e-42db-ba33-f4f87e85f8e5',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:45','pages/square/square?shareid=e46e6599-db3e-42db-ba33-f4f87e85f8e5',0,NULL,'{\"url\":\"pages/square/square?shareid=e46e6599-db3e-42db-ba33-f4f87e85f8e5\"}'),('e5e452e2-7062-4d13-9531-714b9b31309e',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:18:07','pages/index/index?id=229&groupid=&shareid=e5e452e2-7062-4d13-9531-714b9b31309e',0,NULL,'{\"id\":\"229\",\"url\":\"pages/index/index?id=229&groupid=&shareid=e5e452e2-7062-4d13-9531-714b9b31309e\"}'),('e61cd38a-fcac-4f3c-929f-78fe26d1e706',NULL,'oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-26 14:21:46','/pages/index/index?id=240&shareid=e61cd38a-fcac-4f3c-929f-78fe26d1e706',0,NULL,'{\"id\":\"240\",\"url\":\"/pages/index/index?id=240&shareid=e61cd38a-fcac-4f3c-929f-78fe26d1e706\"}'),('e6204267-41fa-4bb0-8a14-1a3292aeab9d',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:58:50','pages/square/square?shareid=e6204267-41fa-4bb0-8a14-1a3292aeab9d',0,NULL,'{\"url\":\"pages/square/square?shareid=e6204267-41fa-4bb0-8a14-1a3292aeab9d\"}'),('e9238ef7-2b5d-4e7e-9a9e-c0bee70e8149',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:09','pages/index/index?id=&groupid=&shareid=e9238ef7-2b5d-4e7e-9a9e-c0bee70e8149',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=e9238ef7-2b5d-4e7e-9a9e-c0bee70e8149\"}'),('e94b48c9-7812-4bc7-ae4d-d1807997c336',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:55:06','pages/index/index?id=238&groupid=1548482102181&shareid=e94b48c9-7812-4bc7-ae4d-d1807997c336',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482102181\",\"url\":\"pages/index/index?id=238&groupid=1548482102181&shareid=e94b48c9-7812-4bc7-ae4d-d1807997c336\"}'),('ea63eccf-8910-46ba-a809-a08a9d8f94f1',NULL,'oyDfX5V6B-KMp9GWdx31_RHmlONQ','2019-01-26 19:52:34','pages/index/index?id=&groupid=&shareid=ea63eccf-8910-46ba-a809-a08a9d8f94f1',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=ea63eccf-8910-46ba-a809-a08a9d8f94f1\"}'),('ebea038e-2dfd-42f4-8cd8-60ca3db95df5',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:01','pages/index/index?id=&groupid=&shareid=ebea038e-2dfd-42f4-8cd8-60ca3db95df5',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=ebea038e-2dfd-42f4-8cd8-60ca3db95df5\"}'),('ef7038c8-dda7-472e-a7d0-17cdab50ba06',NULL,'oyDfX5SVgYHynM7S3G3DLyVY6a6w','2019-01-26 14:07:25','pages/index/index?id=238&groupid=1548482790787&shareid=ef7038c8-dda7-472e-a7d0-17cdab50ba06',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482790787\",\"url\":\"pages/index/index?id=238&groupid=1548482790787&shareid=ef7038c8-dda7-472e-a7d0-17cdab50ba06\"}'),('ef822a28-0832-4f08-a6c0-be9a7cc04c12',NULL,'oyDfX5afT824em9JybnRAmjHkMtI','2019-01-26 14:13:13','pages/index/index?id=238&groupid=1548483126365&shareid=ef822a28-0832-4f08-a6c0-be9a7cc04c12',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548483126365\",\"url\":\"pages/index/index?id=238&groupid=1548483126365&shareid=ef822a28-0832-4f08-a6c0-be9a7cc04c12\"}'),('f392f05e-6d99-41a8-8d03-9353993283dd',NULL,'oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 13:05:25','pages/square/square?shareid=f392f05e-6d99-41a8-8d03-9353993283dd',0,NULL,'{\"url\":\"pages/square/square?shareid=f392f05e-6d99-41a8-8d03-9353993283dd\"}'),('f45bb040-cb64-46ff-adf0-7b0c923740ac',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-29 14:41:45','pages/index/index?id=&groupid=&shareid=f45bb040-cb64-46ff-adf0-7b0c923740ac',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=f45bb040-cb64-46ff-adf0-7b0c923740ac\"}'),('f489e078-3251-483a-baf7-9fa821708d80',NULL,'oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 14:16:50','pages/index/index?id=238&groupid=1548482328457&shareid=f489e078-3251-483a-baf7-9fa821708d80',0,NULL,'{\"id\":\"238\",\"groupid\":\"1548482328457\",\"url\":\"pages/index/index?id=238&groupid=1548482328457&shareid=f489e078-3251-483a-baf7-9fa821708d80\"}'),('f492d7fb-98de-4f34-a102-5d38028f195e',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:24','pages/index/index?id=&groupid=&shareid=f492d7fb-98de-4f34-a102-5d38028f195e',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=f492d7fb-98de-4f34-a102-5d38028f195e\"}'),('f523e6fe-d2b1-46d0-b068-b4cbecc74a66',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-27 15:02:31','pages/index/index?id=&groupid=&shareid=f523e6fe-d2b1-46d0-b068-b4cbecc74a66',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=f523e6fe-d2b1-46d0-b068-b4cbecc74a66\"}'),('f5422ab2-55fb-4419-b0e6-d8cc8d5d8c8f',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-28 13:07:28','pages/index/index?id=&groupid=&shareid=f5422ab2-55fb-4419-b0e6-d8cc8d5d8c8f',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=f5422ab2-55fb-4419-b0e6-d8cc8d5d8c8f\"}'),('f7e9f1b5-d42f-4b2c-accd-d32e59e309a5',NULL,'oyDfX5Xqr4vejEXFUUepQeSixGco','2019-01-26 22:03:00','pages/square/square?shareid=f7e9f1b5-d42f-4b2c-accd-d32e59e309a5',0,NULL,'{\"url\":\"pages/square/square?shareid=f7e9f1b5-d42f-4b2c-accd-d32e59e309a5\"}'),('fb84ddb4-ffbd-42b3-b272-e39f26cfa3bc',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:05:27','pages/index/index?id=228&groupid=&shareid=fb84ddb4-ffbd-42b3-b272-e39f26cfa3bc',0,NULL,'{\"id\":\"228\",\"url\":\"pages/index/index?id=228&groupid=&shareid=fb84ddb4-ffbd-42b3-b272-e39f26cfa3bc\"}'),('fc3c4b2e-9b0d-4cb4-9892-83685cecddab',NULL,'oyDfX5V2jLv_dba19ZNgkdR5pJNU','2019-01-27 22:59:05','pages/index/index?id=&groupid=&shareid=fc3c4b2e-9b0d-4cb4-9892-83685cecddab',0,NULL,'{\"url\":\"pages/index/index?id=&groupid=&shareid=fc3c4b2e-9b0d-4cb4-9892-83685cecddab\"}'),('fc68d472-a638-4061-97f8-b0d7bbbe0cf1',NULL,'oyDfX5cyuFYDNyEs1wEN-JEsj1lA','2019-01-29 15:06:18','pages/square/square?shareid=fc68d472-a638-4061-97f8-b0d7bbbe0cf1',0,NULL,'{\"url\":\"pages/square/square?shareid=fc68d472-a638-4061-97f8-b0d7bbbe0cf1\"}'),('fecf8a5d-49b4-43a5-b8e4-17c8cfd0b083',NULL,'oyDfX5eYZMMc1Sy6Q7e0kWPZVio8','2019-01-26 13:54:31','/pages/index/index?id=238&shareid=fecf8a5d-49b4-43a5-b8e4-17c8cfd0b083',0,NULL,'{\"id\":\"238\",\"url\":\"/pages/index/index?id=238&shareid=fecf8a5d-49b4-43a5-b8e4-17c8cfd0b083\"}'),('ff846081-72fd-468d-9fed-89d0779e36d0',NULL,'oyDfX5fSGedbGYlw_voUKaREj4eE','2019-01-28 15:06:00','pages/square/square?shareid=ff846081-72fd-468d-9fed-89d0779e36d0',0,NULL,'{\"url\":\"pages/square/square?shareid=ff846081-72fd-468d-9fed-89d0779e36d0\"}');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pf_share_config`
--

LOCK TABLES `pf_share_config` WRITE;
/*!40000 ALTER TABLE `pf_share_config` DISABLE KEYS */;
INSERT INTO `pf_share_config` VALUES (2,'红包活动','pages/index/index',NULL,'红包活动',0,'pages/index/index?id={id}&groupid={groupid}'),(5,'所有页面','*','redbag/config/share/a4509bed-6013-4ceb-afc7-57865716c6a0.jpg','发一个您的个性专属红包',0,'pages/square/square'),(6,'红包海报','pages/canvas/canvas',NULL,'红包海报',0,'/pages/index/index?id={id}');
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
INSERT INTO `pf_withdraw` VALUES ('0164feee-2373-11e9-8b8a-6c92bf48246b','oyDfX5ZXQllBEVavtpXkmkgk9a1k','W1548731246','oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-29 11:07:26',2.44,1,'2019-01-29 11:07:27',NULL,NULL),('01c8936f-2130-11e9-8b8a-6c92bf48246b','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','W1548482568','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 14:02:48',4.26,1,'2019-01-26 14:02:49',NULL,NULL),('07748c9b-213d-11e9-8b8a-6c92bf48246b','oyDfX5SsSJUki9JZeSuDyMDQp6HQ','W1548488161','oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:01',2.84,100,'2019-01-26 15:36:01','V2_ACCOUNT_SIMPLE_BAN',NULL),('0915cb57-212c-11e9-8b8a-6c92bf48246b','oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','W1548480862','oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:34:22',2.94,1,'2019-01-26 13:34:23',NULL,NULL),('091b8005-213d-11e9-8b8a-6c92bf48246b','oyDfX5SsSJUki9JZeSuDyMDQp6HQ','W1548488164','oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:04',2.84,100,'2019-01-26 15:36:04','V2_ACCOUNT_SIMPLE_BAN',NULL),('0ed41dfe-213d-11e9-8b8a-6c92bf48246b','oyDfX5SsSJUki9JZeSuDyMDQp6HQ','W1548488173','oyDfX5SsSJUki9JZeSuDyMDQp6HQ','2019-01-26 15:36:13',2.00,100,'2019-01-26 15:36:14','V2_ACCOUNT_SIMPLE_BAN',NULL),('139bc1ff-2159-11e9-8b8a-6c92bf48246b','oyDfX5ScZoPcCxACBiDg4EBbNk_w','W1548500207','oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 18:56:47',2.87,1,'2019-01-26 18:56:49',NULL,NULL),('16bf8c3a-2134-11e9-8b8a-6c92bf48246b','oyDfX5bXeLUabBzhTkw2TcB6O69g','W1548484321','oyDfX5bXeLUabBzhTkw2TcB6O69g','2019-01-26 14:32:01',3.60,1,'2019-01-26 14:32:02',NULL,NULL),('199213b5-2131-11e9-8b8a-6c92bf48246b','oyDfX5cCVQzoGvWLB4-R8lErGqvQ','W1548483037','oyDfX5cCVQzoGvWLB4-R8lErGqvQ','2019-01-26 14:10:37',1.95,1,'2019-01-26 14:10:39',NULL,NULL),('1d52a20b-212f-11e9-8b8a-6c92bf48246b','oyDfX5eXQ_DEdY9hSXikalLCaFDo','W1548482185','oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:25',2.66,1,'2019-01-26 13:56:26',NULL,NULL),('1febfc15-212c-11e9-8b8a-6c92bf48246b','oyDfX5ZXQllBEVavtpXkmkgk9a1k','W1548480900','oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:35:00',3.29,1,'2019-01-26 13:35:02',NULL,NULL),('28c57b08-2132-11e9-8b8a-6c92bf48246b','oyDfX5XTol1TvWbw2zyz2VupQ-4E','W1548483492','oyDfX5XTol1TvWbw2zyz2VupQ-4E','2019-01-26 14:18:12',2.83,1,'2019-01-26 14:18:14',NULL,NULL),('2b8a6010-212f-11e9-8b8a-6c92bf48246b','oyDfX5eXQ_DEdY9hSXikalLCaFDo','W1548482208','oyDfX5eXQ_DEdY9hSXikalLCaFDo','2019-01-26 13:56:48',1.27,1,'2019-01-26 13:56:50',NULL,NULL),('2e2db331-212c-11e9-8b8a-6c92bf48246b','oyDfX5UNiq30f4u9uMk_e2DYuOeI','W1548480924','oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 13:35:24',1.15,1,'2019-01-26 13:35:26',NULL,NULL),('2eb08979-22c1-11e9-8b8a-6c92bf48246b','oyDfX5YMZmLk8j4AkbzGqpsK1tlg','W1548654871','oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-28 13:54:31',8.74,1,'2019-01-28 13:54:33',NULL,NULL),('319e2e76-2131-11e9-8b8a-6c92bf48246b','oyDfX5SVgYHynM7S3G3DLyVY6a6w','W1548483078','oyDfX5SVgYHynM7S3G3DLyVY6a6w','2019-01-26 14:11:18',2.48,1,'2019-01-26 14:11:19',NULL,NULL),('32e673be-2132-11e9-8b8a-6c92bf48246b','oyDfX5V2Af_uREWzMK3gqesbVum4','W1548483509','oyDfX5V2Af_uREWzMK3gqesbVum4','2019-01-26 14:18:29',2.39,1,'2019-01-26 14:18:31',NULL,NULL),('33005536-212f-11e9-8b8a-6c92bf48246b','oyDfX5fpdUM_PaPyAvbnwcqkMibA','W1548482221','oyDfX5fpdUM_PaPyAvbnwcqkMibA','2019-01-26 13:57:01',1.40,1,'2019-01-26 13:57:02',NULL,NULL),('37858105-23a9-11e9-8b8a-6c92bf48246b','oyDfX5X4MLLvhNYnKRmIVUag1ask','W1548754529','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:35:29',7.90,1,'2019-01-29 17:35:31',NULL,NULL),('3e17d7fe-212c-11e9-8b8a-6c92bf48246b','oyDfX5fB7INZsJOHuZgQi_gLqTlE','W1548480951','oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 13:35:51',1.17,1,'2019-01-26 13:35:52',NULL,NULL),('41a5af8f-212a-11e9-8b8a-6c92bf48246b','oyDfX5Wm-S14LKRg0bpodvtlPMtE','W1548480098','oyDfX5Wm-S14LKRg0bpodvtlPMtE','2019-01-26 13:21:38',2.52,1,'2019-01-26 13:21:39',NULL,NULL),('425fd52b-2137-11e9-8b8a-6c92bf48246b','oyDfX5aqOeGI7dnuER3v4XCCQozs','W1548485683','oyDfX5aqOeGI7dnuER3v4XCCQozs','2019-01-26 14:54:43',3.57,1,'2019-01-26 14:54:44',NULL,NULL),('42fb60b5-212f-11e9-8b8a-6c92bf48246b','oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','W1548482248','oyDfX5dIu2f4d6hFU2kJ6kpu4YmM','2019-01-26 13:57:28',2.57,1,'2019-01-26 13:57:29',NULL,NULL),('4916cb17-23a9-11e9-8b8a-6c92bf48246b','oyDfX5X4MLLvhNYnKRmIVUag1ask','W1548754559','oyDfX5X4MLLvhNYnKRmIVUag1ask','2019-01-29 17:35:59',8.15,1,'2019-01-29 17:36:00',NULL,NULL),('4abfbba4-2129-11e9-8b8a-6c92bf48246b','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','W1548479684','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:14:44',4.22,1,'2019-01-26 13:14:45',NULL,NULL),('4d456a67-2137-11e9-8b8a-6c92bf48246b','oyDfX5YuuV-mI4BJcsACr2RqGCHU','W1548485701','oyDfX5YuuV-mI4BJcsACr2RqGCHU','2019-01-26 14:55:01',3.60,1,'2019-01-26 14:55:02',NULL,NULL),('4f26b35e-212e-11e9-8b8a-6c92bf48246b','oyDfX5TQG4pXXvF9VhkjQc1QCts0','W1548481839','oyDfX5TQG4pXXvF9VhkjQc1QCts0','2019-01-26 13:50:39',4.20,1,'2019-01-26 13:50:40',NULL,NULL),('534be331-22f3-11e9-8b8a-6c92bf48246b','oyDfX5ZhIo8mEnb-alfByewjYjrw','W1548676408','oyDfX5ZhIo8mEnb-alfByewjYjrw','2019-01-28 19:53:28',1.94,1,'2019-01-28 19:53:29',NULL,NULL),('69ccef86-23a9-11e9-8b8a-6c92bf48246b','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','W1548754614','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-29 17:36:54',1.92,1,'2019-01-29 17:36:55',NULL,NULL),('6a5093bf-2137-11e9-8b8a-6c92bf48246b','oyDfX5S5ruxJEtRWTIq1xRU7FkWY','W1548485750','oyDfX5S5ruxJEtRWTIq1xRU7FkWY','2019-01-26 14:55:50',2.33,1,'2019-01-26 14:55:51',NULL,NULL),('7d20217c-212f-11e9-8b8a-6c92bf48246b','oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','W1548482345','oyDfX5W1K1ZNqaq9eqtHgWLtm7D0','2019-01-26 13:59:05',4.02,1,'2019-01-26 13:59:07',NULL,NULL),('80278643-2134-11e9-8b8a-6c92bf48246b','oyDfX5b-CeE7mo6pR9-GJdJZwMfU','W1548484498','oyDfX5b-CeE7mo6pR9-GJdJZwMfU','2019-01-26 14:34:58',2.02,1,'2019-01-26 14:34:59',NULL,NULL),('824f9ef8-212e-11e9-8b8a-6c92bf48246b','oyDfX5XkfBcbeDePPRxBMLfVpd7E','W1548481924','oyDfX5XkfBcbeDePPRxBMLfVpd7E','2019-01-26 13:52:04',3.89,1,'2019-01-26 13:52:06',NULL,NULL),('845a6dab-2133-11e9-8b8a-6c92bf48246b','oyDfX5UNiq30f4u9uMk_e2DYuOeI','W1548484075','oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 14:27:55',3.49,1,'2019-01-26 14:27:57',NULL,NULL),('86f59c40-2126-11e9-8b8a-6c92bf48246b','oyDfX5eYyLCts6wAStZu4NabD3TM','W1548478496','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 12:54:56',1.15,1,'2019-01-26 12:54:58',NULL,NULL),('8768ca9d-23aa-11e9-8b8a-6c92bf48246b','oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','W1548755093','oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-29 17:44:53',1.47,1,'2019-01-29 17:44:54',NULL,NULL),('8c34606a-212d-11e9-8b8a-6c92bf48246b','oyDfX5ScZoPcCxACBiDg4EBbNk_w','W1548481512','oyDfX5ScZoPcCxACBiDg4EBbNk_w','2019-01-26 13:45:12',4.79,1,'2019-01-26 13:45:13',NULL,NULL),('8c6dec6a-2132-11e9-8b8a-6c92bf48246b','oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','W1548483659','oyDfX5WdxP2lBmxy1jw-l0gr0PEQ','2019-01-26 14:20:59',3.00,1,'2019-01-26 14:21:01',NULL,NULL),('9766e8a6-2128-11e9-8b8a-6c92bf48246b','oyDfX5YMZmLk8j4AkbzGqpsK1tlg','W1548479383','oyDfX5YMZmLk8j4AkbzGqpsK1tlg','2019-01-26 13:09:43',2.64,1,'2019-01-26 13:09:44',NULL,NULL),('98b5cac1-2145-11e9-8b8a-6c92bf48246b','oyDfX5YX7Ozh6_u2qS7szTYCb9VY','W1548491841','oyDfX5YX7Ozh6_u2qS7szTYCb9VY','2019-01-26 16:37:21',2.15,1,'2019-01-26 16:37:22',NULL,NULL),('a2357afc-2130-11e9-8b8a-6c92bf48246b','oyDfX5TrqskZgnKxH05HHogcPJYw','W1548482837','oyDfX5TrqskZgnKxH05HHogcPJYw','2019-01-26 14:07:17',2.07,1,'2019-01-26 14:07:19',NULL,NULL),('a440ee32-2132-11e9-8b8a-6c92bf48246b','oyDfX5afT824em9JybnRAmjHkMtI','W1548483699','oyDfX5afT824em9JybnRAmjHkMtI','2019-01-26 14:21:39',1.73,1,'2019-01-26 14:21:42',NULL,NULL),('a6a82946-2135-11e9-8b8a-6c92bf48246b','oyDfX5U-ttE7YioegM36yPZCV9K0','W1548484992','oyDfX5U-ttE7YioegM36yPZCV9K0','2019-01-26 14:43:12',1.85,1,'2019-01-26 14:43:13',NULL,NULL),('a7c56665-2129-11e9-8b8a-6c92bf48246b','oyDfX5ZXQllBEVavtpXkmkgk9a1k','W1548479840','oyDfX5ZXQllBEVavtpXkmkgk9a1k','2019-01-26 13:17:20',7.37,1,'2019-01-26 13:17:21',NULL,NULL),('b09e8e46-2126-11e9-8b8a-6c92bf48246b','oyDfX5fB7INZsJOHuZgQi_gLqTlE','W1548478566','oyDfX5fB7INZsJOHuZgQi_gLqTlE','2019-01-26 12:56:06',3.93,1,'2019-01-26 12:56:07',NULL,NULL),('b0db8fa3-2138-11e9-8b8a-6c92bf48246b','oyDfX5XM2UE-bh4RaSSgeG9pxZ_I','W1548486298','oyDfX5XM2UE-bh4RaSSgeG9pxZ_I','2019-01-26 15:04:58',3.03,1,'2019-01-26 15:04:59',NULL,NULL),('b5070989-2126-11e9-8b8a-6c92bf48246b','oyDfX5UNiq30f4u9uMk_e2DYuOeI','W1548478574','oyDfX5UNiq30f4u9uMk_e2DYuOeI','2019-01-26 12:56:14',3.92,1,'2019-01-26 12:56:15',NULL,NULL),('bd911222-2135-11e9-8b8a-6c92bf48246b','oyDfX5fEd-sVl30oGT5PmaTm7Xok','W1548485030','oyDfX5fEd-sVl30oGT5PmaTm7Xok','2019-01-26 14:43:50',1.49,1,'2019-01-26 14:43:52',NULL,NULL),('bf50429e-214d-11e9-8b8a-6c92bf48246b','oyDfX5eogADCmR8x4GEHI8SMcEtE','W1548495341','oyDfX5eogADCmR8x4GEHI8SMcEtE','2019-01-26 17:35:41',3.91,1,'2019-01-26 17:35:43',NULL,NULL),('c006c5ff-2129-11e9-8b8a-6c92bf48246b','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','W1548479881','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:18:01',3.11,1,'2019-01-26 13:18:02',NULL,NULL),('c69339ae-2129-11e9-8b8a-6c92bf48246b','oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','W1548479892','oyDfX5Rx8iXZBkxQB8OmplkzhyDQ','2019-01-26 13:18:12',2.16,1,'2019-01-26 13:18:13',NULL,NULL),('c7310930-212e-11e9-8b8a-6c92bf48246b','oyDfX5cOmNaS6GoW7kn8zVeCMsWY','W1548482040','oyDfX5cOmNaS6GoW7kn8zVeCMsWY','2019-01-26 13:54:00',3.36,1,'2019-01-26 13:54:02',NULL,NULL),('ca3d2782-212b-11e9-8b8a-6c92bf48246b','oyDfX5VVkkemoWwG8uB1qURXuKCc','W1548480757','oyDfX5VVkkemoWwG8uB1qURXuKCc','2019-01-26 13:32:37',1.51,1,'2019-01-26 13:32:38',NULL,NULL),('ea4fcc89-2132-11e9-8b8a-6c92bf48246b','oyDfX5cfgLsLSM4_zYnPcMPifB3A','W1548483817','oyDfX5cfgLsLSM4_zYnPcMPifB3A','2019-01-26 14:23:37',1.91,1,'2019-01-26 14:23:39',NULL,NULL),('edd818a9-212c-11e9-8b8a-6c92bf48246b','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','W1548481246','oyDfX5b0SSyHlVzF5lwnTtKqYkx0','2019-01-26 13:40:46',4.13,1,'2019-01-26 13:40:47',NULL,NULL),('f03fe75f-2146-11e9-8b8a-6c92bf48246b','oyDfX5cSfj9lm4dA8igH5WXH9x0c','W1548492417','oyDfX5cSfj9lm4dA8igH5WXH9x0c','2019-01-26 16:46:57',3.01,1,'2019-01-26 16:46:58',NULL,NULL),('f4e4bd22-212f-11e9-8b8a-6c92bf48246b','oyDfX5VTceO2h9aCcXoRpMLVgE6Y','W1548482546','oyDfX5VTceO2h9aCcXoRpMLVgE6Y','2019-01-26 14:02:26',2.94,1,'2019-01-26 14:02:28',NULL,NULL),('f7de3744-212f-11e9-8b8a-6c92bf48246b','oyDfX5eYyLCts6wAStZu4NabD3TM','W1548482551','oyDfX5eYyLCts6wAStZu4NabD3TM','2019-01-26 14:02:31',6.35,1,'2019-01-26 14:02:32',NULL,NULL);
/*!40000 ALTER TABLE `pf_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_diversion`
--

DROP TABLE IF EXISTS `vw_diversion`;
/*!50001 DROP VIEW IF EXISTS `vw_diversion`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_diversion` AS SELECT 
 1 AS `appid`,
 1 AS `topic`,
 1 AS `username`,
 1 AS `userlogo`,
 1 AS `gotime`*/;
SET character_set_client = @saved_cs_client;

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
 1 AS `rollback`,
 1 AS `gotamount`,
 1 AS `remainamount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_publicinfo`
--

DROP TABLE IF EXISTS `vw_publicinfo`;
/*!50001 DROP VIEW IF EXISTS `vw_publicinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_publicinfo` AS SELECT 
 1 AS `appid`,
 1 AS `appname`,
 1 AS `type`,
 1 AS `appkey`,
 1 AS `apppath`,
 1 AS `diversioncount`*/;
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
 1 AS `clear`,
 1 AS `rollback`,
 1 AS `rollbackdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sys_user`
--

DROP TABLE IF EXISTS `vw_sys_user`;
/*!50001 DROP VIEW IF EXISTS `vw_sys_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_sys_user` AS SELECT 
 1 AS `id`,
 1 AS `disabled`,
 1 AS `photo`,
 1 AS `name`,
 1 AS `account`,
 1 AS `roles`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_topic`
--

DROP TABLE IF EXISTS `vw_topic`;
/*!50001 DROP VIEW IF EXISTS `vw_topic`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_topic` AS SELECT 
 1 AS `id`,
 1 AS `typeid`,
 1 AS `typename`,
 1 AS `title`,
 1 AS `content`,
 1 AS `enabled`,
 1 AS `isdefault`*/;
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
/*!50003 DROP FUNCTION IF EXISTS `fun_getFunctionParentsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `fun_getFunctionParentsList`(nodeId char(36)) RETURNS varchar(3000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(1000);
	DECLARE currentId char(36);
    DECLARE parentId char(36);
	SET sTemp = nodeId; 
	SET currentId =nodeId; 
	
    SELECT fun_parent_id INTO currentId FROM fw_function where fun_id=currentId;
	
	WHILE IFNULL(currentId,'')<>'' DO 
		SET sTemp = concat(sTemp,',',currentId); 
		SELECT fun_parent_id INTO currentId FROM fw_function where fun_id=currentId;
	END WHILE; 
	
RETURN sTemp; 
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_app_diversion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_app_diversion`(
#应用引流记录
appid varchar(20),
userid char(36),
openid	varchar(32),
redid	int
)
BEGIN
	insert into bas_app_diversion(app_id,red_id,user_id,open_id,gotime)
    values(appid,redid,userid,openid,now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_background_get4cache` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_background_get4cache`(
#获取所有的背景资源文件，用于缓存文件
)
BEGIN
		#背景
        select 
			bg_id		as id,
			bg_title 	as title,
			bg_file		as `file`,
            bg_layout	as layout,
            bg_share	as `share`,
            bg_poster	as poster,
            bg_default	as isdefault
		 from bas_red_background
         where bg_enabled = 1
         order by bg_index desc;
		#音乐
         select 
			music_id	as id,
			music_title as title,
			music_file	as `file`,
            music_default	as isdefault
		 from bas_red_music
         where music_enabled = 1
         order by music_index desc;
		 #主题文字
         select 
			id,
            typename,
			title,
			content,
            isdefault
		 from vw_topic
         where enabled = 1;
     

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_background_setdefault` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_background_setdefault`(
#获取默认的红包主题背景和默认的主题音乐
bgtype tinyint,
id int
)
BEGIN
	if bgtype=0 then
		update bas_red_background set bg_default = if(bg_id=id,1,0) ;
        select 
			bg_title 	as title,
			bg_file		as `file`,
            bg_layout	as layout,
            bg_share	as `share`,
            bg_poster	as poster
		 from bas_red_background
         where bg_id = id limit 1;
            
    elseif bgtype=1 then  #音乐
		update bas_red_music set music_default = if(music_id=id,1,0) ;
         select 
			music_title as title,
			music_file	as `file`
		 from bas_red_music
         where music_id = id limit 1;
	else
		update bas_red_topic set topic_default = if(topic_id=id,1,0) ;
         select 
			topic_title as title,
			topic_content	as `file`
		 from bas_red_topic
         where topic_id = id limit 1;
    end if;

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
			53:	红包撤回
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
						user_total_balance = ifnull(user_total_balance,0)+if(bustype=51,1,0)*money  #累计红包
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
backtype tinyint	#背景的类型
#获取所有有效的背景类型
)
BEGIN
	#背景封面类的
    if backtype = 0 then
	select 
		bg_id 		as id,
		bg_title	as title,
		bg_file		as `file`,
		bg_layout	as layout,
        bg_poster	as poster,
        bg_share	as `share`,
        bg_default 	as isdefault
	from bas_red_background
    where 
		bg_enabled=1
	order by bg_index desc;
   else
		#背景音乐类的
		select 
			music_id 		as id,
			music_title	as title,
			music_file		as `file`,
            music_default 	as isdefault
		from bas_red_music
		where 
			music_enabled=1
		order by music_index desc;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_barrage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_barrage`(
#红包广场上的所有弹幕
)
BEGIN
	select
		0 as `type`,
		br.red_topic 	as topic,
        user_name		as username,
        user_logo		as userlogo,
        format(seq_price,2)	as money,
        got_date		as `date`
    from 
		bus_redbag_alloc bra
    inner join bus_redbag br on br.red_id= bra.red_id
    inner join crm_user cu on bra.user_id = cu.user_id
	union
    select
		1 as `type`,
		br.red_topic 	as topic,
        user_name		as username,
        user_logo		as userlogo,
        format(red_amount,2) as money,
        red_create_date		as `date`
        
    from 
		bus_redbag br
	inner join crm_user cu on br.user_id = cu.user_id
	where red_status = 1 and red_ispublic=1 and 
    timestampdiff(minute,red_create_date,now())<10
    
    order by `date` desc;
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
poster		varchar(1024),		#红包的海报生成定义
playtype 	tinyint,			#红包活动的玩法 0:直接开  1：多人拼红包
groupcount	tinyint,			#多人助力拼包的人数
amount		decimal(8,2),		#红包总金额
total		int,				#红包的总份数
paytype		tinyint,			#红包的支付方式
alloctype	tinyint,			#红包分配方式
minimal		decimal(8,2),		#红包分配的最小金额
maximum		decimal(8,2),		#红包分配的最大金额
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
        red_poster,
        red_type,
        red_group,
        red_amount,
        red_total,
        red_alloc,
        red_minimal,
        red_maximum,
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
        poster,
		playtype ,
		groupcount,
		amount,
		total,
		alloctype,
        minimal,
        maximum,
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
    select 0 as result,redid,userid,orderid,txno,paytype,topic,amount + servicetotal as cost;
    
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_getallocinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_getallocinfo`(
#获取某个红包活动的分配详情
id int,  #红包的id
startpage int,
pagerows int
)
BEGIN
	declare maxmoney decimal(8,2) default -1;
    declare alloctype tinyint default 0;  #如果是普通红包则没有手气最佳
    
    select red_alloc into alloctype from bus_redbag where red_id=id;
    
    #获取最佳手气的金额
    if alloctype=0 then
		select max(seq_price) into maxmoney from bus_redbag_alloc where red_id=id;
    end if;
	set startpage=(startpage-1)*pagerows;
	select 
		bra.user_id as userid,
        user_name 	as username,
        user_logo	as logo,
        seq_price	as money,
        if(seq_price=ifnull(maxmoney,0),1,0) as isbest,
        got_date	as `date`
	from bus_redbag_alloc bra
    inner join crm_user cu on bra.user_id = cu.user_id
    where red_id=id
    ORDER BY got_date 
    LIMIT startpage,pagerows;
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
        red_shareimage	as `share`,
        red_amount	as amount,
		red_total	as total,
        red_qr		as qrimage,
        red_status	as `status`,
        red_rollback	as `rollback`,
        fun_dayindays(now(),red_start,red_end) as startstatus,
        if(red_amount<=ifnull(gotmoney,0),1,0) as robbed,
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
        date_format(ba.got_date,'%Y.%m.%d %H:%i') as `date`,
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
	#declare minimal		decimal(8,2);	#红包分配的最小金额
    #declare maximum		decimal(8,2);	#红包分配的最大金额
    
    #red_minimal	= minimal,
    #red_maximum	= maximum,
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
            red_alloc as alloctype,
            red_minimal as minimal,
            red_maximum as maximum
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
    declare minimal		decimal(8,2);	#红包分配的最小金额
    declare maximum		decimal(8,2);	#红包分配的最大金额
    
    #red_minimal	= minimal,
    #red_maximum	= maximum,
    select 
		order_id,o.red_id,r.red_amount,r.red_total,r.red_alloc,r.user_id,r.red_minimal,r.red_maximum
		into orderid,redid,redamount,redtotal,alloctype,userid,minimal,maximum
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
    select if(redid is null,1,0) as result,redid,redamount as amount,redtotal as total,alloctype,minimal,maximum;
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
userid char(36)	#当前进入的用户
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
        if(brj.join_date is null,0,1) as joined,
        ifnull(gotamount,0) as gotamount,
        ifnull(gotcount,0) as gotcount,
        if(red_total=ifnull(gotcount,0),1,0) as robbed,
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
    left join bus_redbag_join brj on br.red_id=brj.red_id and brj.user_id=userid
    where 
		red_status = 1 
        and red_ispublic = 1
        and red_cleared=0
	ORDER BY br.red_id DESC ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_rollback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_rollback`(
#红包撤回
redid	int,  			#红包id
userid	char(36)		#用户的id (红包必须由所属的用户撤回）
)
BEGIN
	declare result int default 1;
     declare redamount decimal(8,2) default 0;	#红包发放的金额
    declare gotamount decimal(8,2) default 0;	#红包已领取的金额
    
    #如果红包是在后台进行撤回的，则需要拿到真正的红包主用户id
    if userid='admin' then
		select user_id 
        into userid 
        from bus_redbag
        where red_id = redid limit 1;
    end if;
    
   
    
    select red_id,red_amount into 
		redid,redamount
	from bus_redbag
	where red_id=redid and user_id= userid 
             and red_rollback=0 and red_status=1;
             
	#红包存在
	if redid is not null then
		select sum(seq_price) into gotamount
        from bus_redbag_alloc where red_id=redid;
        
        #仅当红包没有被发完的时候，才会设置撤回状态，退回余额给用户
        if redamount-ifnull(gotamount,0)>0 then
			update bus_redbag set
				red_rollback 		= 1,
				red_status			= 100,
				red_rollback_date	= now(),
				red_cleared			= 1
			where red_id = redid;
			#将剩余的钱返还给用户到余额
			#if redamount-ifnull(gotamount,0)>0 then
				call proc_balance_record(userid,1,53,redid,redamount-ifnull(gotamount,0));
			#end if;
		else  #否则仅作清理处理
			update bus_redbag set
				red_cleared			= 1
			where red_id = redid;
		end if;
        set result = 0;
	end if;
    select result,userid,ifnull(redamount,0)-ifnull(gotamount,0) as remainmoney;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_redbag_summaryinfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_redbag_summaryinfo`(
#获取某个红包的分配的汇总信息
id int  #红包的id
)
BEGIN
	select 
		br.red_id		as id,
        red_topic	as topic,
        red_logo		as logo,
        red_create_date	as createdate,
        red_amount	as amount,
        red_total	as total,
        ifnull(gotamount,0) as gotamount,
        ifnull(gottotal,0) as gottotal
	from bus_redbag br
	left join (
	select 
		red_id,
		ifnull(sum(seq_price),0) as gotamount,
		ifnull(count(1),0) as gottotal
	from bus_redbag_alloc 
	group by red_id
    ) alloc on br.red_id = alloc.red_id
    where br.red_id = id;
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
poster		varchar(1024),		#红包的海报生成定义
playtype 	tinyint,			#红包活动的玩法 0:直接开  1：多人拼红包
groupcount	tinyint,			#多人助力拼包的人数
amount		decimal(8,2),		#红包总金额
total		int,				#红包的总份数
paytype		tinyint,			#红包的支付方式
alloctype	tinyint,			#红包分配方式
minimal		decimal(8,2),		#红包分配的最小金额
maximum		decimal(8,2),		#红包分配的最大金额
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
        red_poster	=	poster,
        red_type	= playtype,
        red_group	= groupcount,
        red_amount	= amount,
        red_total	= total,
        red_alloc	= alloctype,
        red_minimal	= minimal,
        red_maximum	= maximum,
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_red_actualrecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `proc_red_actualrecord`(
#记录红包实际生成的结果
redid	int,
actualamount decimal(11,2),
actualtotal	int
)
BEGIN
	update 
		bus_redbag
	set red_actual_amount = actualamount,
		red_actual_total	= actualtotal
	where red_id = redid;
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
        #cast(fun_getappsetting('wxfa7d7a155dcef5a2','withdraw','1') as decimal(5,2)) as minwithdraw
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
				when 1 then '红包提现' 
				when 51 then '领取红包'
				when 52 then '提现失败退回'
                when 53 then '红包撤回金额'
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
-- Final view structure for view `vw_diversion`
--

/*!50001 DROP VIEW IF EXISTS `vw_diversion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_diversion` AS select `d`.`app_id` AS `appid`,`r`.`red_topic` AS `topic`,`u`.`user_name` AS `username`,`u`.`user_logo` AS `userlogo`,`d`.`gotime` AS `gotime` from ((`bas_app_diversion` `d` join `bus_redbag` `r` on((`d`.`red_id` = `r`.`red_id`))) join `crm_user` `u` on((`d`.`user_id` = `u`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `vw_income` AS select `rb`.`red_id` AS `id`,`rb`.`red_topic` AS `topic`,`cu`.`user_id` AS `userid`,`cu`.`user_name` AS `username`,`cu`.`user_logo` AS `userlogo`,`ro`.`order_id` AS `orderid`,`rb`.`red_create_date` AS `createdate`,`ro`.`order_paytype` AS `paytype`,`ro`.`pay_date` AS `paydate`,`ro`.`service_total` AS `service`,`ro`.`order_total` AS `ordertotal`,`rb`.`red_type` AS `type`,`rb`.`red_amount` AS `amount`,`rb`.`red_total` AS `total`,`fu`.`user_name` AS `operator`,`rb`.`red_rollback` AS `rollback`,ifnull(`alloc`.`gotamount`,0) AS `gotamount`,if((`rb`.`red_rollback` = 1),0,(`rb`.`red_amount` - ifnull(`alloc`.`gotamount`,0))) AS `remainamount` from ((((`redbag`.`bus_redbag` `rb` join `redbag`.`crm_user` `cu` on((`rb`.`user_id` = `cu`.`user_id`))) join `redbag`.`bus_redbag_order` `ro` on((`ro`.`red_id` = `rb`.`red_id`))) left join (select `redbag`.`bus_redbag_alloc`.`red_id` AS `red_id`,count(1) AS `gottotal`,sum(`redbag`.`bus_redbag_alloc`.`seq_price`) AS `gotamount` from `redbag`.`bus_redbag_alloc` group by `redbag`.`bus_redbag_alloc`.`red_id`) `alloc` on((`rb`.`red_id` = `alloc`.`red_id`))) left join `redbag`.`fw_users` `fu` on((`ro`.`order_updator` = `fu`.`user_id`))) where (`ro`.`order_status` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_publicinfo`
--

/*!50001 DROP VIEW IF EXISTS `vw_publicinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_publicinfo` AS select `pub`.`app_id` AS `appid`,`pub`.`app_name` AS `appname`,`pub`.`app_type` AS `type`,`pub`.`app_key` AS `appkey`,`pub`.`app_path` AS `apppath`,ifnull(`d`.`diversioncount`,0) AS `diversioncount` from (`redbag`.`bas_wechat_publicinfo` `pub` left join (select `redbag`.`bas_app_diversion`.`app_id` AS `app_id`,count(1) AS `diversioncount` from `redbag`.`bas_app_diversion` group by `redbag`.`bas_app_diversion`.`app_id`) `d` on((`pub`.`app_id` = `d`.`app_id`))) */;
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
/*!50001 VIEW `vw_redbag` AS select `rb`.`red_id` AS `id`,`rb`.`red_topic` AS `topic`,`rb`.`red_logo` AS `logo`,`rb`.`red_bless` AS `bless`,`cu`.`user_id` AS `userid`,`cu`.`user_name` AS `username`,`cu`.`user_logo` AS `userlogo`,`ro`.`order_paytype` AS `paytype`,`ro`.`order_id` AS `orderid`,`rb`.`red_create_date` AS `createdate`,`rb`.`red_bgp` AS `bgimage`,`rb`.`red_bgm` AS `bgmusic`,`rb`.`red_type` AS `type`,`rb`.`red_group` AS `groupmin`,`rb`.`red_amount` AS `amount`,`rb`.`red_total` AS `total`,`alloc`.`gotamount` AS `gotamount`,ifnull(`alloc`.`gottotal`,0) AS `gottotal`,`rb`.`red_alloc` AS `alloc`,`rb`.`red_start` AS `startdate`,`rb`.`red_end` AS `enddate`,`rb`.`red_status` AS `status`,`rb`.`red_qr` AS `qrcode`,`rb`.`app_id` AS `appid`,`rb`.`app_name` AS `appname`,`rb`.`red_ispublic` AS `public`,`rb`.`red_share` AS `share`,`rb`.`red_cleared` AS `clear`,`rb`.`red_rollback` AS `rollback`,`rb`.`red_rollback_date` AS `rollbackdate` from (((`redbag`.`bus_redbag` `rb` join `redbag`.`crm_user` `cu` on((`rb`.`user_id` = `cu`.`user_id`))) left join `redbag`.`bus_redbag_order` `ro` on((`ro`.`red_id` = `rb`.`red_id`))) left join (select `redbag`.`bus_redbag_alloc`.`red_id` AS `red_id`,count(1) AS `gottotal`,sum(`redbag`.`bus_redbag_alloc`.`seq_price`) AS `gotamount` from `redbag`.`bus_redbag_alloc` group by `redbag`.`bus_redbag_alloc`.`red_id`) `alloc` on((`rb`.`red_id` = `alloc`.`red_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sys_user`
--

/*!50001 DROP VIEW IF EXISTS `vw_sys_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sys_user` AS select `u`.`user_id` AS `id`,`u`.`user_disabled` AS `disabled`,`u`.`user_photo` AS `photo`,`u`.`user_name` AS `name`,`u`.`user_account` AS `account`,`userrole`.`roles` AS `roles` from (`redbag`.`fw_users` `u` left join (select `mur`.`user_id` AS `user_id`,group_concat(`mpr`.`role_name` order by `mpr`.`role_key` ASC separator ',') AS `roles` from (`redbag`.`fw_userrole` `mur` join `redbag`.`fw_roles` `mpr` on((`mur`.`role_id` = `mpr`.`role_id`))) where (`mpr`.`rec_isdeleted` = 0) group by `mur`.`user_id`) `userrole` on((`u`.`user_id` = `userrole`.`user_id`))) where (`u`.`rec_isdeleted` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_topic`
--

/*!50001 DROP VIEW IF EXISTS `vw_topic`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_topic` AS select `brt`.`topic_id` AS `id`,`brt`.`typeid` AS `typeid`,`tt`.`item_name` AS `typename`,`brt`.`topic_title` AS `title`,`brt`.`topic_content` AS `content`,`brt`.`topic_enabled` AS `enabled`,`brt`.`topic_default` AS `isdefault` from (`bas_red_topic` `brt` join `fw_dict_item` `tt` on((`brt`.`typeid` = `tt`.`rec_id`))) order by `tt`.`item_value`,`brt`.`topic_index` desc */;
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

-- Dump completed on 2019-01-29 18:18:48
