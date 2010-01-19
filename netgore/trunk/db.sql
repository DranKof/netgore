-- MySQL dump 10.13  Distrib 5.1.38, for Win64 (unknown)
--
-- Host: localhost    Database: demogame
-- ------------------------------------------------------
-- Server version	5.1.38-community

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL COMMENT 'The account ID.',
  `name` varchar(30) NOT NULL COMMENT 'The account name.',
  `password` varchar(40) NOT NULL COMMENT 'The account password.',
  `email` varchar(60) NOT NULL COMMENT 'The email address.',
  `time_created` datetime NOT NULL COMMENT 'The DateTime of when the account was created.',
  `time_last_login` datetime NOT NULL COMMENT 'The DateTime that the account was last logged in to.',
  `creator_ip` int(10) unsigned NOT NULL COMMENT 'The IP address that created the account.',
  `current_ip` int(10) unsigned DEFAULT NULL COMMENT 'IP address currently logged in to the account, or null if nobody is logged in.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Spodi','3fc0a7acf087f549ac2b266baf94b8b1','spodi@vbgore.com','2009-09-07 15:43:16','2010-01-18 02:04:53',16777343,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_ips`
--

DROP TABLE IF EXISTS `account_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_ips` (
  `account_id` int(11) NOT NULL COMMENT 'The ID of the account.',
  `ip` int(10) unsigned NOT NULL COMMENT 'The IP that logged into the account.',
  `time` datetime NOT NULL COMMENT 'When this IP last logged into this account.',
  PRIMARY KEY (`account_id`,`time`),
  KEY `account_id` (`account_id`,`ip`),
  CONSTRAINT `account_ips_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_ips`
--

LOCK TABLES `account_ips` WRITE;
/*!40000 ALTER TABLE `account_ips` DISABLE KEYS */;
INSERT INTO `account_ips` VALUES (1,16777343,'2010-01-07 09:56:47'),(1,16777343,'2010-01-07 10:07:26'),(1,16777343,'2010-01-07 12:48:29'),(1,16777343,'2010-01-07 12:54:25'),(1,16777343,'2010-01-07 12:55:43'),(1,16777343,'2010-01-07 12:57:52'),(1,16777343,'2010-01-07 13:10:33'),(1,16777343,'2010-01-07 13:18:55'),(1,16777343,'2010-01-07 13:33:47'),(1,16777343,'2010-01-07 13:35:42'),(1,16777343,'2010-01-07 13:50:43'),(1,16777343,'2010-01-07 21:17:13'),(1,16777343,'2010-01-08 15:44:00'),(1,16777343,'2010-01-09 13:34:23'),(1,16777343,'2010-01-11 09:48:59'),(1,16777343,'2010-01-11 10:43:24'),(1,16777343,'2010-01-11 21:20:21'),(1,16777343,'2010-01-11 21:20:50'),(1,16777343,'2010-01-11 21:21:31'),(1,16777343,'2010-01-11 21:22:37'),(1,16777343,'2010-01-11 21:23:57'),(1,16777343,'2010-01-11 21:24:42'),(1,16777343,'2010-01-11 21:28:29'),(1,16777343,'2010-01-11 22:00:48'),(1,16777343,'2010-01-11 22:02:12'),(1,16777343,'2010-01-11 22:08:53'),(1,16777343,'2010-01-11 22:09:44'),(1,16777343,'2010-01-11 22:10:07'),(1,16777343,'2010-01-11 22:11:56'),(1,16777343,'2010-01-11 22:16:50'),(1,16777343,'2010-01-11 22:20:31'),(1,16777343,'2010-01-11 22:26:27'),(1,16777343,'2010-01-11 22:31:24'),(1,16777343,'2010-01-11 22:32:38'),(1,16777343,'2010-01-11 22:33:44'),(1,16777343,'2010-01-11 22:44:05'),(1,16777343,'2010-01-12 00:24:48'),(1,16777343,'2010-01-12 00:25:29'),(1,16777343,'2010-01-12 00:45:32'),(1,16777343,'2010-01-12 00:52:11'),(1,16777343,'2010-01-13 15:16:15'),(1,16777343,'2010-01-14 12:56:06'),(1,16777343,'2010-01-14 13:09:55'),(1,16777343,'2010-01-14 13:09:56'),(1,16777343,'2010-01-14 13:09:58'),(1,16777343,'2010-01-14 14:36:49'),(1,16777343,'2010-01-14 14:44:59'),(1,16777343,'2010-01-14 16:18:31'),(1,16777343,'2010-01-14 16:26:53'),(1,16777343,'2010-01-14 17:27:08'),(1,16777343,'2010-01-15 19:34:53'),(1,16777343,'2010-01-15 21:27:15'),(1,16777343,'2010-01-16 01:05:44'),(1,16777343,'2010-01-16 02:21:47'),(1,16777343,'2010-01-16 02:31:14'),(1,16777343,'2010-01-16 02:36:47'),(1,16777343,'2010-01-16 03:14:23'),(1,16777343,'2010-01-16 03:16:44'),(1,16777343,'2010-01-16 03:19:58'),(1,16777343,'2010-01-16 21:02:21'),(1,16777343,'2010-01-16 21:10:15'),(1,16777343,'2010-01-16 21:20:30'),(1,16777343,'2010-01-17 02:33:47'),(1,16777343,'2010-01-17 02:34:18'),(1,16777343,'2010-01-17 02:39:53'),(1,16777343,'2010-01-17 12:24:50'),(1,16777343,'2010-01-17 12:29:09'),(1,16777343,'2010-01-17 12:29:13'),(1,16777343,'2010-01-17 12:29:18'),(1,16777343,'2010-01-17 12:29:37'),(1,16777343,'2010-01-17 12:37:16'),(1,16777343,'2010-01-17 12:47:27'),(1,16777343,'2010-01-17 15:54:17'),(1,16777343,'2010-01-17 15:55:09'),(1,16777343,'2010-01-17 15:55:43'),(1,16777343,'2010-01-17 16:12:28'),(1,16777343,'2010-01-17 17:08:43'),(1,16777343,'2010-01-17 17:26:33'),(1,16777343,'2010-01-17 21:56:24'),(1,16777343,'2010-01-18 02:04:53');
/*!40000 ALTER TABLE `account_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alliance`
--

DROP TABLE IF EXISTS `alliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alliance` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alliance`
--

LOCK TABLES `alliance` WRITE;
/*!40000 ALTER TABLE `alliance` DISABLE KEYS */;
INSERT INTO `alliance` VALUES (0,'user'),(1,'monster');
/*!40000 ALTER TABLE `alliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alliance_attackable`
--

DROP TABLE IF EXISTS `alliance_attackable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alliance_attackable` (
  `alliance_id` tinyint(3) unsigned NOT NULL,
  `attackable_id` tinyint(3) unsigned NOT NULL,
  `placeholder` tinyint(3) unsigned DEFAULT NULL COMMENT 'Unused placeholder column - please do not remove',
  PRIMARY KEY (`alliance_id`,`attackable_id`),
  KEY `attackable_id` (`attackable_id`),
  KEY `alliance_id` (`alliance_id`),
  CONSTRAINT `alliance_attackable_ibfk_3` FOREIGN KEY (`attackable_id`) REFERENCES `alliance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alliance_attackable_ibfk_4` FOREIGN KEY (`alliance_id`) REFERENCES `alliance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alliance_attackable`
--

LOCK TABLES `alliance_attackable` WRITE;
/*!40000 ALTER TABLE `alliance_attackable` DISABLE KEYS */;
INSERT INTO `alliance_attackable` VALUES (0,1,NULL),(1,0,NULL);
/*!40000 ALTER TABLE `alliance_attackable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alliance_hostile`
--

DROP TABLE IF EXISTS `alliance_hostile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alliance_hostile` (
  `alliance_id` tinyint(3) unsigned NOT NULL,
  `hostile_id` tinyint(3) unsigned NOT NULL,
  `placeholder` tinyint(3) unsigned DEFAULT NULL COMMENT 'Unused placeholder column - please do not remove',
  PRIMARY KEY (`alliance_id`,`hostile_id`),
  KEY `hostile_id` (`hostile_id`),
  KEY `alliance_id` (`alliance_id`),
  CONSTRAINT `alliance_hostile_ibfk_3` FOREIGN KEY (`hostile_id`) REFERENCES `alliance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `alliance_hostile_ibfk_4` FOREIGN KEY (`alliance_id`) REFERENCES `alliance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alliance_hostile`
--

LOCK TABLES `alliance_hostile` WRITE;
/*!40000 ALTER TABLE `alliance_hostile` DISABLE KEYS */;
INSERT INTO `alliance_hostile` VALUES (0,1,0),(1,0,0);
/*!40000 ALTER TABLE `alliance_hostile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `character_template_id` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `map_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `shop_id` smallint(5) unsigned DEFAULT NULL,
  `chat_dialog` smallint(5) unsigned DEFAULT NULL,
  `ai_id` smallint(5) unsigned DEFAULT NULL,
  `x` float NOT NULL DEFAULT '100',
  `y` float NOT NULL DEFAULT '100',
  `respawn_map` smallint(5) unsigned DEFAULT NULL,
  `respawn_x` float NOT NULL DEFAULT '50',
  `respawn_y` float NOT NULL DEFAULT '50',
  `body_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `move_speed` smallint(5) unsigned NOT NULL DEFAULT '1800',
  `cash` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `exp` int(11) NOT NULL DEFAULT '0',
  `statpoints` int(11) NOT NULL DEFAULT '0',
  `hp` smallint(6) NOT NULL DEFAULT '50',
  `mp` smallint(6) NOT NULL DEFAULT '50',
  `stat_maxhp` smallint(6) NOT NULL DEFAULT '50',
  `stat_maxmp` smallint(6) NOT NULL DEFAULT '50',
  `stat_minhit` smallint(6) NOT NULL DEFAULT '1',
  `stat_maxhit` smallint(6) NOT NULL DEFAULT '1',
  `stat_defence` smallint(6) NOT NULL DEFAULT '1',
  `stat_agi` smallint(6) NOT NULL DEFAULT '1',
  `stat_int` smallint(6) NOT NULL DEFAULT '1',
  `stat_str` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `template_id` (`character_template_id`),
  KEY `respawn_map` (`respawn_map`),
  KEY `character_ibfk_2` (`map_id`),
  KEY `idx_name` (`name`) USING BTREE,
  KEY `account_id` (`account_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `character_ibfk_2` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `character_ibfk_3` FOREIGN KEY (`respawn_map`) REFERENCES `map` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `character_ibfk_4` FOREIGN KEY (`character_template_id`) REFERENCES `character_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_ibfk_6` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,1,NULL,'Spodi',1,NULL,NULL,NULL,663.6,158,1,500,200,1,1800,2436,99,2964,468,50,50,50,50,7,12,0,1,1,2),(2,NULL,1,'Test A',2,NULL,NULL,2,800,250,2,800,250,1,1800,3012,12,810,527,30,5,30,5,5,5,0,5,5,5),(3,NULL,1,'Test B',2,NULL,NULL,2,506,250,2,500,250,1,1800,3012,12,810,527,30,5,30,5,5,5,0,5,5,5),(4,NULL,NULL,'Talking Guy',2,NULL,0,NULL,800,530,2,800,530,1,1800,0,1,0,0,50,50,50,50,1,1,0,1,1,1),(5,NULL,NULL,'Shopkeeper',2,0,NULL,NULL,600,530,2,600,530,1,1800,0,1,0,0,50,50,50,50,1,1,0,1,1,1),(6,NULL,NULL,'Vending Machine',2,1,NULL,NULL,500,530,2,500,530,1,1800,0,1,0,0,50,50,50,50,1,1,0,1,1,1);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_equipped`
--

DROP TABLE IF EXISTS `character_equipped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_equipped` (
  `character_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `slot` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`character_id`,`slot`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `character_equipped_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_equipped_ibfk_4` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_equipped`
--

LOCK TABLES `character_equipped` WRITE;
/*!40000 ALTER TABLE `character_equipped` DISABLE KEYS */;
INSERT INTO `character_equipped` VALUES (2,132,0),(3,133,2),(2,134,2);
/*!40000 ALTER TABLE `character_equipped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_inventory`
--

DROP TABLE IF EXISTS `character_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_inventory` (
  `character_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `slot` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`character_id`,`slot`),
  KEY `item_id` (`item_id`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `character_inventory_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_inventory_ibfk_4` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_inventory`
--

LOCK TABLES `character_inventory` WRITE;
/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
INSERT INTO `character_inventory` VALUES (1,0,0),(1,14,1),(1,78,2),(1,84,4),(1,86,3),(2,100,0);
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_status_effect`
--

DROP TABLE IF EXISTS `character_status_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_status_effect` (
  `id` int(11) NOT NULL COMMENT 'Unique ID of the status effect instance.',
  `character_id` int(11) NOT NULL COMMENT 'ID of the Character that the status effect is on.',
  `status_effect_id` tinyint(3) unsigned NOT NULL COMMENT 'ID of the status effect that this effect is for. This corresponds to the StatusEffectType enum''s value.',
  `power` smallint(5) unsigned NOT NULL COMMENT 'The power of this status effect instance.',
  `time_left_secs` smallint(5) unsigned NOT NULL COMMENT 'The amount of time remaining for this status effect in seconds.',
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `character_status_effect_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_status_effect`
--

LOCK TABLES `character_status_effect` WRITE;
/*!40000 ALTER TABLE `character_status_effect` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_status_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_template`
--

DROP TABLE IF EXISTS `character_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_template` (
  `id` smallint(5) unsigned NOT NULL,
  `alliance_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT 'New NPC',
  `ai_id` smallint(5) unsigned DEFAULT NULL,
  `shop_id` smallint(5) unsigned DEFAULT NULL,
  `body_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `move_speed` smallint(5) unsigned NOT NULL DEFAULT '1800',
  `respawn` smallint(5) unsigned NOT NULL DEFAULT '5',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `exp` int(11) NOT NULL DEFAULT '0',
  `statpoints` int(11) NOT NULL DEFAULT '0',
  `give_exp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `give_cash` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stat_maxhp` smallint(6) NOT NULL DEFAULT '50',
  `stat_maxmp` smallint(6) NOT NULL DEFAULT '50',
  `stat_minhit` smallint(6) NOT NULL DEFAULT '1',
  `stat_maxhit` smallint(6) NOT NULL DEFAULT '1',
  `stat_defence` smallint(6) NOT NULL DEFAULT '1',
  `stat_agi` smallint(6) NOT NULL DEFAULT '1',
  `stat_int` smallint(6) NOT NULL DEFAULT '1',
  `stat_str` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `alliance_id` (`alliance_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `character_template_ibfk_2` FOREIGN KEY (`alliance_id`) REFERENCES `alliance` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_template_ibfk_3` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_template`
--

LOCK TABLES `character_template` WRITE;
/*!40000 ALTER TABLE `character_template` DISABLE KEYS */;
INSERT INTO `character_template` VALUES (0,0,'User Template',NULL,NULL,1,1800,5,1,0,0,0,0,50,50,1,2,0,1,1,1),(1,1,'A Test NPC',2,NULL,2,1800,2,0,0,0,5,5,30,5,0,0,0,1,1,1);
/*!40000 ALTER TABLE `character_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_template_equipped`
--

DROP TABLE IF EXISTS `character_template_equipped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_template_equipped` (
  `id` int(11) NOT NULL,
  `character_template_id` smallint(5) unsigned NOT NULL,
  `item_template_id` smallint(5) unsigned NOT NULL,
  `chance` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_template_id`),
  KEY `character_id` (`character_template_id`),
  CONSTRAINT `character_template_equipped_ibfk_1` FOREIGN KEY (`character_template_id`) REFERENCES `character_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_template_equipped_ibfk_2` FOREIGN KEY (`item_template_id`) REFERENCES `item_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_template_equipped`
--

LOCK TABLES `character_template_equipped` WRITE;
/*!40000 ALTER TABLE `character_template_equipped` DISABLE KEYS */;
INSERT INTO `character_template_equipped` VALUES (0,1,5,3000),(1,1,4,3000),(2,1,3,60000);
/*!40000 ALTER TABLE `character_template_equipped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_template_inventory`
--

DROP TABLE IF EXISTS `character_template_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_template_inventory` (
  `id` int(11) NOT NULL,
  `character_template_id` smallint(5) unsigned NOT NULL,
  `item_template_id` smallint(5) unsigned NOT NULL,
  `min` tinyint(3) unsigned NOT NULL,
  `max` tinyint(3) unsigned NOT NULL,
  `chance` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_template_id`),
  KEY `character_id` (`character_template_id`),
  CONSTRAINT `character_template_inventory_ibfk_1` FOREIGN KEY (`character_template_id`) REFERENCES `character_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `character_template_inventory_ibfk_2` FOREIGN KEY (`item_template_id`) REFERENCES `item_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_template_inventory`
--

LOCK TABLES `character_template_inventory` WRITE;
/*!40000 ALTER TABLE `character_template_inventory` DISABLE KEYS */;
INSERT INTO `character_template_inventory` VALUES (0,1,5,0,2,10000),(1,1,4,1,2,5000),(2,1,3,1,1,5000),(3,1,2,0,1,10000),(4,1,1,0,5,10000);
/*!40000 ALTER TABLE `character_template_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_constant`
--

DROP TABLE IF EXISTS `game_constant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_constant` (
  `max_characters_per_account` tinyint(3) unsigned NOT NULL,
  `min_account_name_length` tinyint(3) unsigned NOT NULL,
  `max_account_name_length` tinyint(3) unsigned NOT NULL,
  `min_account_password_length` tinyint(3) unsigned NOT NULL,
  `max_account_password_length` tinyint(3) unsigned NOT NULL,
  `min_character_name_length` tinyint(3) unsigned NOT NULL,
  `max_character_name_length` tinyint(3) unsigned NOT NULL,
  `max_shop_items` tinyint(3) unsigned NOT NULL,
  `max_inventory_size` tinyint(3) unsigned NOT NULL,
  `max_status_effect_power` smallint(5) unsigned NOT NULL,
  `screen_width` smallint(5) unsigned NOT NULL,
  `screen_height` smallint(5) unsigned NOT NULL,
  `server_ping_port` smallint(5) unsigned NOT NULL,
  `server_tcp_port` smallint(5) unsigned NOT NULL,
  `server_ip` varchar(15) NOT NULL,
  `world_physics_update_rate` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_constant`
--

LOCK TABLES `game_constant` WRITE;
/*!40000 ALTER TABLE `game_constant` DISABLE KEYS */;
INSERT INTO `game_constant` VALUES (10,3,30,3,30,3,15,36,36,500,1024,768,44446,44445,'127.0.0.1',20);
/*!40000 ALTER TABLE `game_constant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `width` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `height` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `graphic` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `hp` smallint(6) NOT NULL DEFAULT '0',
  `mp` smallint(6) NOT NULL DEFAULT '0',
  `stat_agi` smallint(6) NOT NULL DEFAULT '0',
  `stat_int` smallint(6) NOT NULL DEFAULT '0',
  `stat_str` smallint(6) NOT NULL DEFAULT '0',
  `stat_minhit` smallint(6) NOT NULL DEFAULT '0',
  `stat_maxhit` smallint(6) NOT NULL DEFAULT '0',
  `stat_maxhp` smallint(6) NOT NULL DEFAULT '0',
  `stat_maxmp` smallint(6) NOT NULL DEFAULT '0',
  `stat_defence` smallint(6) NOT NULL DEFAULT '0',
  `stat_req_agi` smallint(6) NOT NULL DEFAULT '0',
  `stat_req_int` smallint(6) NOT NULL DEFAULT '0',
  `stat_req_str` smallint(6) NOT NULL DEFAULT '0',
  `equipped_body` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (0,4,22,22,'Crystal Armor','Body armor made out of crystal',2,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(1,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(2,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(3,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(4,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(5,1,9,16,'Healing Potion','A healing potion',4,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(6,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(7,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(8,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(9,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(10,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(11,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(12,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(13,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(14,1,9,16,'Healing Potion','A healing potion',2,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(15,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(16,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(17,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(18,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(19,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(20,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(21,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(22,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(23,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(24,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(25,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(26,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(27,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(28,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(29,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(30,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(31,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(32,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(33,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(34,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(35,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(36,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(37,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(38,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(39,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(40,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(41,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(42,4,22,22,'Crystal Armor','Body armor made out of crystal',2,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(43,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(44,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(45,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(46,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(47,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(48,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(49,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(50,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(51,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(52,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(53,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(54,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(55,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(56,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(57,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(58,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(59,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(60,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(61,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(62,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(63,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(64,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(65,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(66,1,9,16,'Healing Potion','A healing potion',3,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(67,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(68,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(69,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(70,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(71,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(72,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(73,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(74,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(75,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(76,1,9,16,'Healing Potion','A healing potion',4,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(77,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(78,3,11,16,'Crystal Helmet','A helmet made out of crystal',2,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(79,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(80,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(81,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(82,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(83,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(84,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(85,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(86,1,9,16,'Mana Potion','A mana potion',2,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(87,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(88,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(89,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(90,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(91,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(92,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(93,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(94,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(95,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(96,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(97,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(98,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(99,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(100,4,22,22,'Crystal Armor','Body armor made out of crystal',2,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(101,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(102,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(103,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(104,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(105,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(106,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(107,1,9,16,'Healing Potion','A healing potion',2,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(108,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(109,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(110,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(111,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(112,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(113,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(114,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(115,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(116,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(117,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(118,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(119,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(120,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(121,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(122,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(123,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(124,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(125,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(126,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(127,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(128,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(129,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(130,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(131,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(132,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(133,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(134,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(135,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(136,1,9,16,'Healing Potion','A healing potion',3,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(137,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(138,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(139,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(140,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(141,4,22,22,'Crystal Armor','Body armor made out of crystal',2,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(142,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(143,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(144,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(145,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(146,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(147,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(148,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(149,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(150,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(151,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(152,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(153,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(154,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(155,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(156,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(157,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(158,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(159,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(160,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(161,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(162,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(163,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(164,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(165,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(166,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(167,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(168,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(169,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(170,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(171,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(172,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(173,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(174,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(175,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(176,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(177,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(178,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(179,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(180,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(181,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(182,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(183,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(184,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(185,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(186,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(187,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(188,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(189,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(190,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(191,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(192,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(193,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(194,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(195,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(196,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(197,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(198,1,9,16,'Healing Potion','A healing potion',4,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(199,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(200,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(201,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(202,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(203,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(204,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(205,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(206,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(207,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(208,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(209,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(210,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(211,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(212,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(213,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(214,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(215,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(216,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(217,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(218,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(219,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(220,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(221,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(222,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(223,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(224,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(225,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(226,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(227,3,11,16,'Crystal Helmet','A helmet made out of crystal',2,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(228,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(229,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(230,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(231,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(232,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(233,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(234,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(235,1,9,16,'Healing Potion','A healing potion',5,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(236,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(237,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(238,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(239,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(240,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(241,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(242,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(243,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(244,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(245,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(246,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(247,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(248,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(249,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(250,1,9,16,'Mana Potion','A mana potion',1,95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(251,1,9,16,'Healing Potion','A healing potion',1,94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(252,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(253,3,11,16,'Crystal Helmet','A helmet made out of crystal',1,97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet'),(254,4,22,22,'Crystal Armor','Body armor made out of crystal',1,99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(255,2,24,24,'Titanium Sword','A sword made out of titanium',1,96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_template` (
  `id` smallint(5) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `width` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `height` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `graphic` smallint(5) unsigned NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `hp` smallint(6) NOT NULL DEFAULT '0',
  `mp` smallint(6) NOT NULL DEFAULT '0',
  `stat_agi` smallint(6) NOT NULL DEFAULT '0',
  `stat_int` smallint(6) NOT NULL DEFAULT '0',
  `stat_str` smallint(6) NOT NULL DEFAULT '0',
  `stat_minhit` smallint(6) NOT NULL DEFAULT '0',
  `stat_maxhit` smallint(6) NOT NULL DEFAULT '0',
  `stat_maxhp` smallint(6) NOT NULL DEFAULT '0',
  `stat_maxmp` smallint(6) NOT NULL DEFAULT '0',
  `stat_defence` smallint(6) NOT NULL DEFAULT '0',
  `stat_req_agi` smallint(6) NOT NULL DEFAULT '0',
  `stat_req_int` smallint(6) NOT NULL DEFAULT '0',
  `stat_req_str` smallint(6) NOT NULL DEFAULT '0',
  `equipped_body` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_template`
--

LOCK TABLES `item_template` WRITE;
/*!40000 ALTER TABLE `item_template` DISABLE KEYS */;
INSERT INTO `item_template` VALUES (1,1,9,16,'Healing Potion','A healing potion',94,10,25,0,0,0,0,0,0,0,0,0,0,0,0,NULL),(2,1,9,16,'Mana Potion','A mana potion',95,10,0,25,0,0,0,0,0,0,0,0,0,0,0,NULL),(3,2,24,24,'Titanium Sword','A sword made out of titanium',96,100,0,0,0,0,0,5,10,0,0,0,0,0,0,NULL),(4,4,22,22,'Crystal Armor','Body armor made out of crystal',99,50,0,0,0,0,0,0,0,0,0,5,0,0,0,'crystal body'),(5,3,11,16,'Crystal Helmet','A helmet made out of crystal',97,50,0,0,0,0,0,0,0,0,0,2,0,0,0,'crystal helmet');
/*!40000 ALTER TABLE `item_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,'INSERT VALUE'),(2,'INSERT VALUE');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_spawn`
--

DROP TABLE IF EXISTS `map_spawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_spawn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` smallint(5) unsigned NOT NULL,
  `character_template_id` smallint(5) unsigned NOT NULL,
  `amount` tinyint(3) unsigned NOT NULL,
  `x` smallint(5) unsigned DEFAULT NULL,
  `y` smallint(5) unsigned DEFAULT NULL,
  `width` smallint(5) unsigned DEFAULT NULL,
  `height` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_template_id`),
  KEY `map_id` (`map_id`),
  CONSTRAINT `map_spawn_ibfk_1` FOREIGN KEY (`character_template_id`) REFERENCES `character_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `map_spawn_ibfk_2` FOREIGN KEY (`map_id`) REFERENCES `map` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_spawn`
--

LOCK TABLES `map_spawn` WRITE;
/*!40000 ALTER TABLE `map_spawn` DISABLE KEYS */;
INSERT INTO `map_spawn` VALUES (12,1,1,5,NULL,NULL,NULL,NULL),(13,1,1,1,NULL,NULL,NULL,NULL),(14,1,1,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `map_spawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `npc_character`
--

DROP TABLE IF EXISTS `npc_character`;
/*!50001 DROP VIEW IF EXISTS `npc_character`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `npc_character` (
  `id` int(11),
  `account_id` int(11),
  `character_template_id` smallint(5) unsigned,
  `name` varchar(30),
  `map_id` smallint(5) unsigned,
  `shop_id` smallint(5) unsigned,
  `chat_dialog` smallint(5) unsigned,
  `ai_id` smallint(5) unsigned,
  `x` float,
  `y` float,
  `respawn_map` smallint(5) unsigned,
  `respawn_x` float,
  `respawn_y` float,
  `body_id` smallint(5) unsigned,
  `cash` int(11),
  `level` tinyint(3) unsigned,
  `exp` int(11),
  `statpoints` int(11),
  `hp` smallint(6),
  `mp` smallint(6),
  `stat_maxhp` smallint(6),
  `stat_maxmp` smallint(6),
  `stat_minhit` smallint(6),
  `stat_maxhit` smallint(6),
  `stat_defence` smallint(6),
  `stat_agi` smallint(6),
  `stat_int` smallint(6),
  `stat_str` smallint(6)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `server_setting`
--

DROP TABLE IF EXISTS `server_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_setting` (
  `motd` varchar(250) NOT NULL DEFAULT '' COMMENT 'The message of the day.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_setting`
--

LOCK TABLES `server_setting` WRITE;
/*!40000 ALTER TABLE `server_setting` DISABLE KEYS */;
INSERT INTO `server_setting` VALUES ('Welcome to NetGore! Use the arrow keys to move, control to attack, alt to talk to NPCs and use world entities, and space to pick up items.');
/*!40000 ALTER TABLE `server_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_time`
--

DROP TABLE IF EXISTS `server_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_time` (
  `server_time` datetime NOT NULL,
  PRIMARY KEY (`server_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_time`
--

LOCK TABLES `server_time` WRITE;
/*!40000 ALTER TABLE `server_time` DISABLE KEYS */;
INSERT INTO `server_time` VALUES ('2010-01-18 16:22:58');
/*!40000 ALTER TABLE `server_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `can_buy` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (0,'Test Shop',1),(1,'Soda Vending Machine',0);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_item`
--

DROP TABLE IF EXISTS `shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_item` (
  `shop_id` smallint(5) unsigned NOT NULL,
  `item_template_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`shop_id`,`item_template_id`),
  KEY `item_template_id` (`item_template_id`),
  CONSTRAINT `shop_item_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shop_item_ibfk_2` FOREIGN KEY (`item_template_id`) REFERENCES `item_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_item`
--

LOCK TABLES `shop_item` WRITE;
/*!40000 ALTER TABLE `shop_item` DISABLE KEYS */;
INSERT INTO `shop_item` VALUES (0,1),(1,1),(0,2),(1,2),(0,3),(0,4),(0,5);
/*!40000 ALTER TABLE `shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user_character`
--

DROP TABLE IF EXISTS `user_character`;
/*!50001 DROP VIEW IF EXISTS `user_character`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user_character` (
  `id` int(11),
  `account_id` int(11),
  `character_template_id` smallint(5) unsigned,
  `name` varchar(30),
  `map_id` smallint(5) unsigned,
  `shop_id` smallint(5) unsigned,
  `chat_dialog` smallint(5) unsigned,
  `ai_id` smallint(5) unsigned,
  `x` float,
  `y` float,
  `respawn_map` smallint(5) unsigned,
  `respawn_x` float,
  `respawn_y` float,
  `body_id` smallint(5) unsigned,
  `cash` int(11),
  `level` tinyint(3) unsigned,
  `exp` int(11),
  `statpoints` int(11),
  `hp` smallint(6),
  `mp` smallint(6),
  `stat_maxhp` smallint(6),
  `stat_maxmp` smallint(6),
  `stat_minhit` smallint(6),
  `stat_maxhit` smallint(6),
  `stat_defence` smallint(6),
  `stat_agi` smallint(6),
  `stat_int` smallint(6),
  `stat_str` smallint(6)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'demogame'
--
/*!50003 DROP FUNCTION IF EXISTS `CreateUserOnAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `CreateUserOnAccount`(accountName VARCHAR(50), characterName VARCHAR(30), characterID INT) RETURNS varchar(100) CHARSET latin1
BEGIN 		 		DECLARE character_count INT DEFAULT 0; 		DECLARE max_character_count INT DEFAULT 3; 		DECLARE is_id_free INT DEFAULT 0; 		DECLARE is_name_free INT DEFAULT 0; 		DECLARE errorMsg VARCHAR(100) DEFAULT ""; 		DECLARE accountID INT DEFAULT NULL;  		SELECT `id` INTO accountID FROM `account` WHERE `name` = accountName;  		IF ISNULL(accountID) THEN 			SET errorMsg = "Account with the specified name does not exist."; 		ELSE 			SELECT COUNT(*) INTO character_count FROM `character` WHERE `account_id` = accountID; 			SELECT `max_characters_per_account` INTO max_character_count FROM `game_constant`;  			IF character_count > max_character_count THEN 				SET errorMsg = "No free character slots available in the account."; 			ELSE 				SELECT COUNT(*) INTO is_id_free FROM `character` WHERE `id` = characterID; 				 				IF is_id_free > 0 THEN 					SET errorMsg = "The specified CharacterID is not available for use."; 				ELSE 					SELECT COUNT(*) INTO is_name_free FROM `user_character` WHERE `name` = characterName; 						 					IF is_name_free > 0 THEN 						SET errorMsg = "The specified character name is not available for use."; 					ELSE 						INSERT INTO `character` SET `id` = characterID, `name`	= characterName, `account_id`= 	accountID; 					END IF; 				END IF; 			END IF; 		END IF; 				 		RETURN errorMsg;    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Rebuild_Views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Rebuild_Views`()
BEGIN 	 	CALL Rebuild_View_NPC_Character();      END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Rebuild_View_NPC_Character` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `Rebuild_View_NPC_Character`()
BEGIN
	
	DROP VIEW IF EXISTS `npc_character`;
	CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `npc_character` AS SELECT *FROM `character` WHERE `account_id` IS NULL;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `npc_character`
--

/*!50001 DROP TABLE IF EXISTS `npc_character`*/;
/*!50001 DROP VIEW IF EXISTS `npc_character`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `npc_character` AS select `character`.`id` AS `id`,`character`.`account_id` AS `account_id`,`character`.`character_template_id` AS `character_template_id`,`character`.`name` AS `name`,`character`.`map_id` AS `map_id`,`character`.`shop_id` AS `shop_id`,`character`.`chat_dialog` AS `chat_dialog`,`character`.`ai_id` AS `ai_id`,`character`.`x` AS `x`,`character`.`y` AS `y`,`character`.`respawn_map` AS `respawn_map`,`character`.`respawn_x` AS `respawn_x`,`character`.`respawn_y` AS `respawn_y`,`character`.`body_id` AS `body_id`,`character`.`cash` AS `cash`,`character`.`level` AS `level`,`character`.`exp` AS `exp`,`character`.`statpoints` AS `statpoints`,`character`.`hp` AS `hp`,`character`.`mp` AS `mp`,`character`.`stat_maxhp` AS `stat_maxhp`,`character`.`stat_maxmp` AS `stat_maxmp`,`character`.`stat_minhit` AS `stat_minhit`,`character`.`stat_maxhit` AS `stat_maxhit`,`character`.`stat_defence` AS `stat_defence`,`character`.`stat_agi` AS `stat_agi`,`character`.`stat_int` AS `stat_int`,`character`.`stat_str` AS `stat_str` from `character` where isnull(`character`.`account_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_character`
--

/*!50001 DROP TABLE IF EXISTS `user_character`*/;
/*!50001 DROP VIEW IF EXISTS `user_character`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_character` AS select `character`.`id` AS `id`,`character`.`account_id` AS `account_id`,`character`.`character_template_id` AS `character_template_id`,`character`.`name` AS `name`,`character`.`map_id` AS `map_id`,`character`.`shop_id` AS `shop_id`,`character`.`chat_dialog` AS `chat_dialog`,`character`.`ai_id` AS `ai_id`,`character`.`x` AS `x`,`character`.`y` AS `y`,`character`.`respawn_map` AS `respawn_map`,`character`.`respawn_x` AS `respawn_x`,`character`.`respawn_y` AS `respawn_y`,`character`.`body_id` AS `body_id`,`character`.`cash` AS `cash`,`character`.`level` AS `level`,`character`.`exp` AS `exp`,`character`.`statpoints` AS `statpoints`,`character`.`hp` AS `hp`,`character`.`mp` AS `mp`,`character`.`stat_maxhp` AS `stat_maxhp`,`character`.`stat_maxmp` AS `stat_maxmp`,`character`.`stat_minhit` AS `stat_minhit`,`character`.`stat_maxhit` AS `stat_maxhit`,`character`.`stat_defence` AS `stat_defence`,`character`.`stat_agi` AS `stat_agi`,`character`.`stat_int` AS `stat_int`,`character`.`stat_str` AS `stat_str` from `character` where (`character`.`account_id` is not null) */;
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

-- Dump completed on 2010-01-18 16:23:19
