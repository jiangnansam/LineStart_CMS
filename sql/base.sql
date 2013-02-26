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
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `author` varchar(20) NOT NULL DEFAULT '',
  `col_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `creatime` datetime NOT NULL,
  `content` text NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `is_top` tinyint(1) NOT NULL DEFAULT '0',
  `creator` smallint(5) unsigned NOT NULL,
  `ordercnt` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `column_id` (`col_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_column`
--

DROP TABLE IF EXISTS `cms_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_column` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `col_name` varchar(20) NOT NULL DEFAULT '',
  `html_path` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `col_type` tinyint(3) NOT NULL DEFAULT '0',
  `index_template` varchar(150) NOT NULL,
  `list_template` varchar(150) NOT NULL,
  `article_template` varchar(150) NOT NULL,
  `col_intro` varchar(255) NOT NULL,
  `seo_title` varchar(50) NOT NULL,
  `seo_keywords` varchar(255) NOT NULL,
  `seo_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_column`
--

LOCK TABLES `cms_column` WRITE;
/*!40000 ALTER TABLE `cms_column` DISABLE KEYS */;
INSERT INTO `cms_column` VALUES (1,0,'首页','','/index.html',1,'template/51javacms/index.jsp','','','','','','');
/*!40000 ALTER TABLE `cms_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_department`
--

DROP TABLE IF EXISTS `cms_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dep_name` varchar(50) NOT NULL COMMENT '部门名称',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_department`
--

LOCK TABLES `cms_department` WRITE;
/*!40000 ALTER TABLE `cms_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_fragment`
--

DROP TABLE IF EXISTS `cms_fragment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_fragment` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `column_id` smallint(6) NOT NULL DEFAULT '-1',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_fragment`
--

LOCK TABLES `cms_fragment` WRITE;
/*!40000 ALTER TABLE `cms_fragment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_fragment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_role`
--

DROP TABLE IF EXISTS `cms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL,
  `column_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_role`
--

LOCK TABLES `cms_role` WRITE;
/*!40000 ALTER TABLE `cms_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user`
--

DROP TABLE IF EXISTS `cms_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'no',
  `name` varchar(20) NOT NULL COMMENT 'no',
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `dep_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '外键部门id',
  `password` char(32) NOT NULL DEFAULT '90ffc9deb3683f9d18914b6e42dc3e89' COMMENT '密码：默认：51javacms',
  `last_login` datetime NOT NULL COMMENT '最后登录时间',
  `current_login` datetime NOT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_article_role` tinyint(1) NOT NULL DEFAULT '0',
  `is_ad_role` tinyint(1) NOT NULL DEFAULT '0',
  `is_publish_role` tinyint(1) NOT NULL DEFAULT '0',
  `is_column_role` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='no';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user`
--

LOCK TABLES `cms_user` WRITE;
/*!40000 ALTER TABLE `cms_user` DISABLE KEYS */;
INSERT INTO `cms_user` VALUES (1,'admin','系统管理员',0,'90ffc9deb3683f9d18914b6e42dc3e89','2012-07-10 09:40:10','2012-07-10 09:46:51','2011-09-26 00:46:41',0,0,0,0,0),(2,'chief_editor','总编辑',2,'90ffc9deb3683f9d18914b6e42dc3e89','2012-07-10 09:39:13','2012-07-10 09:39:47','2011-09-26 00:46:41',0,0,0,0,0);
/*!40000 ALTER TABLE `cms_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_feeling`
--

DROP TABLE IF EXISTS `plugin_feeling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_feeling` (
  `article_id` int(10) unsigned NOT NULL,
  `face1_cnt` int(10) unsigned NOT NULL,
  `face2_cnt` int(10) unsigned NOT NULL,
  `face3_cnt` int(10) unsigned NOT NULL,
  `face4_cnt` int(10) unsigned NOT NULL,
  `face5_cnt` int(10) unsigned NOT NULL,
  `face6_cnt` int(10) unsigned NOT NULL,
  `last_ip` varchar(30) NOT NULL,
  `browse_cnt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_feeling`
--

LOCK TABLES `plugin_feeling` WRITE;
/*!40000 ALTER TABLE `plugin_feeling` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_feeling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_message`
--

DROP TABLE IF EXISTS `plugin_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `message` varchar(255) NOT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `creatime` datetime NOT NULL,
  `ip` varchar(30) NOT NULL,
  `replytime` datetime DEFAULT NULL,
  `replyer` smallint(5) unsigned DEFAULT NULL,
  `is_replied` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_message`
--

LOCK TABLES `plugin_message` WRITE;
/*!40000 ALTER TABLE `plugin_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-10  9:48:03
