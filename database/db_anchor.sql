/*
SQLyog Job Agent v12.09 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.6.38 : Database - db_anchor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_anchor` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_anchor`;

/*Table structure for table `tb_account` */

DROP TABLE IF EXISTS `tb_account`;

CREATE TABLE `tb_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(30) DEFAULT '' COMMENT '账号',
  `cid` int(10) unsigned DEFAULT NULL COMMENT '所属公司',
  `role` varchar(18) DEFAULT '' COMMENT '角色',
  `lastactivetime` datetime DEFAULT NULL COMMENT '最后活跃时间',
  `status` enum('normal','stop') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `fk_company_account` (`cid`),
  CONSTRAINT `fk_company_account` FOREIGN KEY (`cid`) REFERENCES `tb_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tb_account` */

insert  into `tb_account` values (7,'一个萝卜',2,'管理者','2018-04-18 17:07:21','normal');

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

/*Data for the table `tb_admin` */

insert  into `tb_admin` values (1,'admin','Admin','075eaec83636846f51c152f29b98a2fd','s4f3','/assets/img/avatar.png','admin@fastadmin.net',0,1524790596,1492186163,1524790596,'90865854-5585-4f1a-af46-755c6e917370','normal'),(2,'admin2','admin2','9a28ce07ce875fbd14172a9ca5357d3c','2dHDmj','/assets/img/avatar.png','admin2@fastadmin.net',0,1524640175,1492186163,1524640184,'','normal'),(3,'admin3','admin3','1c11f945dfcd808a130a8c2a8753fe62','WOKJEn','/assets/img/avatar.png','admin3@fastadmin.net',0,1501980868,1492186201,1501982377,'','normal'),(4,'admin22','admin22','1c1a0aa0c3c56a8c1a908aab94519648','Aybcn5','/assets/img/avatar.png','admin22@fastadmin.net',0,0,1492186240,1492186240,'','normal'),(5,'admin32','admin32','ade94d5d7a7033afa7d84ac3066d0a02','FvYK0u','/assets/img/avatar.png','admin32@fastadmin.net',0,0,1492186263,1492186263,'','normal');

/*Table structure for table `tb_admin_log` */

DROP TABLE IF EXISTS `tb_admin_log`;

CREATE TABLE `tb_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

/*Data for the table `tb_admin_log` */

insert  into `tb_admin_log` values (1,0,'Unknown','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"b6e9b49af8d05fea2ee522c83ab1229d\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1523962637),(2,0,'Unknown','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"1c2f565253bc2051bee0dd8f51fa4ed0\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1523962642),(3,0,'Unknown','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"89a48b275590fee856689b661c78e914\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1523962647),(4,1,'admin','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"49fa446a33b10c053237d69b1dfe6659\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1523962650),(5,1,'admin','/admin/public/index.php/admin/index/login?url=%2Fadmin%2Fpublic%2Findex.php%2Fadmin%2Fgeneral%2Fconfig%3Fref%3Daddtabs','登录','{\"url\":\"\\/admin\\/public\\/index.php\\/admin\\/general\\/config?ref=addtabs\",\"__token__\":\"4624c1d679ec6cd143a89580a4004d81\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524012759),(6,1,'admin','/admin/public/index.php/admin/index/login?url=%2Fadmin%2Fpublic%2Findex.php%2Fadmin%2Fauth%2Fadmin%3Faddtabs%3D1','登录','{\"url\":\"\\/admin\\/public\\/index.php\\/admin\\/auth\\/admin?addtabs=1\",\"__token__\":\"ee428b8a192cac7b23340d4d6dd15b65\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524015852),(7,0,'Unknown','/admin/public/index.php/admin/index/login','','{\"__token__\":\"6e5676a6e326c2027911cd36010f1e27\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524016277),(8,1,'admin','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"dd53a5430acba643e74eb08ac55995ef\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524016286),(9,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e38\\u8fbe\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"0\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:01:17\",\"manager\":\"\\u5f20\\u4e09\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524027705),(10,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e38\\u8fbe\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"0\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:01:17\",\"manager\":\"\\u5f20\\u4e09\",\"status\":\"1\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524027710),(11,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e38\\u8fbe\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"1243\",\"grade\":\"1242134\",\"expired\":\"2018-04-18 13:01:17\",\"manager\":\"\\u5f20\\u4e09\",\"status\":\"1\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524027744),(12,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e38\\u8fbe\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"1243\",\"grade\":\"1242134\",\"expired\":\"2018-04-18 13:01:17\",\"manager\":\"\\u5f20\\u4e09\",\"status\":\"1\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524027781),(13,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u758f\\u901a\\u8d39\\u5fae\\u8f6f\",\"anchornum\":\"0\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:03:11\",\"manager\":\"\\u65e0\\u6c61\\u67d3\\u53f0\\u6e7e\\u513f\\u7ae5\",\"status\":\"\\u95ee\\u95ee\\u4ed6\\u8ba4\\u4e3a\\u4ed6\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524027799),(14,1,'admin','/admin/public/index.php/admin/company/company/del/ids/1','公司管理 公司管理 删除','{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524027816),(15,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e38\\u8fbe\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"12358\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:16:16\",\"manager\":\"\\u97e9\\u6885\\u6885\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028597),(16,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/1?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e38\\u8fbe\\u7f51\\u7edc\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"12358\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:16:16\",\"manager\":\"\\u97e9\\u6885\\u6885\",\"status\":\"\\u5c01\\u7981\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028617),(17,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u6e2f\\u7389\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028656),(18,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/2?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u8f89\\u70e8\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028671),(19,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u96e8\\u5fb7\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"0\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:54\",\"manager\":\"\\u718a\\u718a\",\"status\":\"\\u5c01\\u7981\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028710),(20,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u82f9\\u679c\",\"belong\":\"\\u4e0a\\u6d77\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"role\":\"\\u795e\",\"lastactivetime\":\"2018-04-18 13:18:37\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028749),(21,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d772345\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"3435\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:19:29\",\"manager\":\"\\u6b66\\u677e\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028803),(22,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5357\\u4eac\\u53cc\\u661f\\u5851\\u6599\\u6a21\\u5177\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"34646\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:20:18\",\"manager\":\"\\u5b8b\\u6c5f\",\"status\":\"\\u5ba1\\u6838\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028872),(23,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5bbf\\u5dde\\u4e09\\u5341\\u4e00\\u6559\\u80b2\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028911),(24,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5408\\u80a5\\u4e2d\\u56fd\\u79d1\\u6280\\u5927\\u5b66\",\"anchornum\":\"35645\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:21:58\",\"manager\":\"\\u667a\\u591a\\u661f\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524028948),(25,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u68a8\",\"belong\":\"\\u864e\\u8dc3\\u516c\\u53f8\",\"role\":\"\\u7ecf\\u7406\",\"lastactivetime\":\"2018-04-18 13:22:44\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524029019),(26,1,'admin','/admin/public/index.php/admin/data/platform/add?dialog=1','数据管理 直播平台管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u6309\\u7279\\u8272\\u6211\\u8ba9\\u4ed6\",\"status\":\"wyerqewirqe\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524031337),(27,1,'admin','/admin/public/index.php/admin/data/platform/add?dialog=1','数据管理 直播平台管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u6309\\u7279\\u8272\\u6211\\u8ba9\\u4ed6\",\"status\":\"wyerqewirqe\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524031337),(28,1,'admin','/admin/public/index.php/admin/data/platform/del/ids/1','数据管理 直播平台管理 删除','{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524031340),(29,1,'admin','/admin/public/index.php/admin/data/platform/del/ids/2','数据管理 直播平台管理 删除','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524031350),(30,1,'admin','/admin/public/index.php/admin/category/edit/ids/13?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"test\",\"pid\":\"0\",\"name\":\"\\u6d4b\\u8bd52\",\"nickname\":\"test2\",\"flag\":[\"recommend\"],\"image\":\"\\/assets\\/img\\/qrcode.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"13\",\"status\":\"hidden\"},\"ids\":\"13\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524032174),(31,1,'admin','/admin/public/index.php/admin/category/edit/ids/13?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"test\",\"pid\":\"0\",\"name\":\"\\u6d4b\\u8bd52\",\"nickname\":\"test2\",\"flag\":[\"recommend\"],\"image\":\"\\/assets\\/img\\/qrcode.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"13\",\"status\":\"normal\"},\"ids\":\"13\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524032180),(32,1,'admin','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"b4ed1f9ad81c5c0bd5b46352f47d9b41\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524032692),(33,1,'admin','/admin/public/index.php/admin/company/account/del/ids/2,1','公司管理 公司账号 删除','{\"action\":\"del\",\"ids\":\"2,1\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524035350),(34,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u5c14\\u7279\\u6211\\u8ba9\\u4ed6\",\"cid\":\"15\",\"role\":\"\\u5c14\\u7279\\u6211\\u8ba9\\u4ed6\",\"lastactivetime\":\"2018-04-18 16:02:01\",\"status\":\"\\u5c14\\u7279\\u6211\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524038543),(35,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"werewolf\",\"cid\":\"3\",\"role\":\"\\u5c14\\u7279\\u6211\",\"lastactivetime\":\"2018-04-18 16:02:35\",\"status\":\"\\u53bb\\u73a9\\u513f\\u7fa4\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524038563),(36,1,'admin','/admin/public/index.php/admin/company/account/del/ids/4','公司管理 公司账号 删除','{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524038570),(37,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/6?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u5316\\u5de5\\u5b66\\u9662\",\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041381),(38,1,'admin','/admin/public/index.php/admin/data/session/add?dialog=1','数据管理 场次数据 添加','{\"dialog\":\"1\",\"row\":{\"begintime\":\"2018-04-18 16:50:45\",\"endtime\":\"2018-04-18 16:50:45\",\"pid\":\"\",\"aid\":\"\",\"livetime\":\"2018-04-18 16:50:45\",\"giftvalue\":\"0.00\",\"sendgift\":\"0\",\"barrage\":\"0\",\"barragepeople\":\"0\",\"subscribe\":\"0\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041453),(39,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u4fa6\\u6d4b\\u516c\\u53f8\",\"anchornum\":\"234\",\"grade\":\"1\",\"expired\":\"2018-04-18 16:52:03\",\"manager\":\"\\u676d\\u4e1c\",\"status\":\"\\u6b63\\u5e38\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041563),(40,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u7532\\u9aa8\\u6587\\u516c\\u53f8\",\"anchornum\":\"3453\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:52:47\",\"manager\":\"\\u9547\\u9b42\",\"status\":\"\\u5c01\\u505c\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041607),(41,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5357\\u4eac\\u534e\\u5b50\\u516c\\u53f8\",\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"\\u5f85\\u5ba1\\u6838\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041655),(42,1,'admin','/admin/public/index.php/admin/company/company/add?dialog=1','公司管理 公司管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041711),(43,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041735),(44,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/3?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u96e8\\u5fb7\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"787234\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:54\",\"manager\":\"\\u718a\\u718a\",\"status\":\"\\u5c01\\u7981\"},\"ids\":\"3\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041921),(45,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u73a9\\u513f\\u7fc1\",\"cid\":\"-4\",\"role\":\"\\u57c3\\u5c14\\u6587\\u82e5\",\"lastactivetime\":\"2018-04-18 16:58:59\",\"status\":\"\\u4e8c\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041952),(46,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u73a9\\u513f\\u7fc1\",\"cid\":\"1254135\",\"role\":\"\\u57c3\\u5c14\\u6587\\u82e5\",\"lastactivetime\":\"2018-04-18 16:58:59\",\"status\":\"\\u4e8c\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041962),(47,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u73a9\\u513f\\u7fc1\",\"cid\":\"1\",\"role\":\"\\u57c3\\u5c14\\u6587\\u82e5\",\"lastactivetime\":\"2018-04-18 16:58:59\",\"status\":\"\\u4e8c\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041972),(48,1,'admin','/admin/public/index.php/admin/company/account/del/ids/6','公司管理 公司账号 删除','{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524041982),(49,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"\",\"cid\":\"-27\",\"role\":\"\",\"lastactivetime\":\"2018-04-18 17:02:12\",\"status\":\"\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042142),(50,1,'admin','/admin/public/index.php/admin/company/account/add?dialog=1','公司管理 公司账号 添加','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042452),(51,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"wait\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042465),(52,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"forbidden\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042482),(53,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042491),(54,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"hidden\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042508),(55,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"hidden\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042521),(56,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042528),(57,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"stop\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042710),(58,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042715),(59,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042833),(60,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"normal\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042892),(61,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/8?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u4fa6\\u6d4b\\u516c\\u53f8\",\"anchornum\":\"234\",\"grade\":\"1\",\"expired\":\"2018-04-18 16:52:03\",\"manager\":\"\\u676d\\u4e1c\",\"status\":\"normal\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042928),(62,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/7?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5408\\u80a5\\u4e2d\\u56fd\\u79d1\\u6280\\u5927\\u5b66\",\"anchornum\":\"35645\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:21:58\",\"manager\":\"\\u667a\\u591a\\u661f\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042934),(63,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/6?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u5316\\u5de5\\u5b66\\u9662\",\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"normal\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042939),(64,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/3?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u96e8\\u5fb7\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"787234\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:54\",\"manager\":\"\\u718a\\u718a\",\"status\":\"stop\"},\"ids\":\"3\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042953),(65,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/3?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u96e8\\u5fb7\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"787234\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:54\",\"manager\":\"\\u718a\\u718a\",\"status\":\"\\u5c01\\u505c\"},\"ids\":\"3\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042960),(66,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/4?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d772345\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"3435\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:19:29\",\"manager\":\"\\u6b66\\u677e\",\"status\":\"normal\"},\"ids\":\"4\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042967),(67,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/2?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u8f89\\u70e8\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"normal\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524042975),(68,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"stop\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524043186),(69,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"wait\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524043370),(70,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"stop\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524043416),(71,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5317\\u4eac\\u539f\\u5b50\\u516c\\u53f8\",\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:54:34\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"wait\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524043786),(72,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 17:55:17\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"wait\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524045140),(73,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"67467\",\"grade\":\"2\",\"expired\":\"2018-04-18 17:55:17\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"wait\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524046342),(74,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"67468\",\"grade\":\"2\",\"expired\":\"2018-04-18 17:55:17\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"wait\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524046665),(75,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/11?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"67468\",\"grade\":\"6\",\"expired\":\"2018-04-18 17:55:17\",\"manager\":\"\\u738b\\u4e94\",\"status\":\"wait\"},\"ids\":\"11\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524046672),(76,1,'admin','/admin/public/index.php/admin/index/login?url=%2Fadmin%2Fpublic%2Findex.php%2Fadmin%2Fcompany%2Faccount%3Fref%3Daddtabs','登录','{\"url\":\"\\/admin\\/public\\/index.php\\/admin\\/company\\/account?ref=addtabs\",\"__token__\":\"8859979de093eacbd46992c92b502cd6\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524098694),(77,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','{\"row\":{\"name\":\"FastAdmin\",\"beian\":\"\",\"cdnurl\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{\\\"backend\\\":\\\"zh-cn\\\",\\\"frontend\\\":\\\"zh-cn\\\"}\",\"fixedpage\":\"dashboard\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524099482),(78,1,'admin','/admin/public/index.php/admin/company/company/del/ids/11','公司管理 公司管理 删除','{\"action\":\"del\",\"ids\":\"11\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524107733),(79,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/4?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"3435\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:19:29\",\"manager\":\"\\u6b66\\u677e\",\"status\":\"normal\"},\"ids\":\"4\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524109096),(80,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/2?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"normal\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524109122),(81,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/2?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"normal\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524109137),(82,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/6?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"normal\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524109177),(83,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/6?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"normal\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524109179),(84,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/6?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"srtret\",\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"normal\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524109247),(85,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/7?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 13:21:58\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524111128),(86,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 16:53:48\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114302),(87,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 16:53:48\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114310),(88,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/8?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"234\",\"grade\":\"1\",\"expired\":\"2018-04-18 16:52:03\",\"manager\":\"niyha \",\"status\":\"normal\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114322),(89,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/8?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"234\",\"grade\":\"1\",\"expired\":\"2018-04-18 16:52:03\",\"manager\":\"\\u97e9\\u6885\\u6885\",\"status\":\"normal\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114331),(90,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/8?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\\u90fd\\u70ed\\u817e\\u817e\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 16:52:03\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114591),(91,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/4?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-19 17:55:17\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"4\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114659),(92,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/10?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"\\u5c01\\u505c\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524114797),(93,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','{\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.qq.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"10000\",\"mail_smtp_pass\":\"password\",\"mail_verify_type\":\"2\",\"mail_from\":\"10000@qq.com\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524115892),(94,1,'admin','/admin/public/index.php/admin/general/config/emailtest','','{\"receiver\":\"10000@qq.com\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524116659),(95,1,'admin','/admin/public/index.php/admin/general/config/emailtest','','{\"receiver\":\"znlccy0603@163.com\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524116714),(96,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 16:53:48\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524119666),(97,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/8?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\\u4ffa\\u5e08\\u82e5\\u7fc1\\u989d\\u6211\\u786e\\u8ba4\\u4e14\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\",\"expired\":\"2018-04-18 16:52:03\",\"status\":\"\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524122888),(98,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/5?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\\u963f\\u8428\\u5fb7\\u996d\\u8428\\u6cd5\\u8fd9\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 13:20:18\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524123231),(99,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/10?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"normal\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126206),(100,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/9?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"3453\",\"grade\":\"2\",\"expired\":\"2018-04-18 16:52:47\",\"manager\":\"\\u9547\\u9b42\",\"status\":\"stop\"},\"ids\":\"9\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126212),(101,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/8?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"234\",\"grade\":\"1\",\"expired\":\"2018-04-18 16:52:03\",\"manager\":\"\\u97e9\\u6885\\u6885\",\"status\":\"wait\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126220),(102,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/7?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"35645\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:21:58\",\"manager\":\"\\u667a\\u591a\\u661f\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126234),(103,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/6?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"normal\'\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126239),(104,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/6?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"normal\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126241),(105,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/5?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"34646\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:20:18\",\"manager\":\"\\u5b8b\\u6c5f\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126247),(106,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/4?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"3435\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:19:29\",\"manager\":\"\\u6b66\\u677e\",\"status\":\"stop\"},\"ids\":\"4\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126253),(107,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/3?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"787234\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:54\",\"manager\":\"\\u718a\\u718a\",\"status\":\"wait\"},\"ids\":\"3\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126259),(108,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/2?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126264),(109,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/1?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"12358\",\"grade\":\"1\",\"expired\":\"2018-04-18 13:16:16\",\"manager\":\"\\u97e9\\u6885\\u6885\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126270),(110,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"stop\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126342),(111,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"ewrtewt\",\"cid\":\"2\",\"role\":\"erewrtert\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126348),(112,1,'admin','/admin/public/index.php/admin/company/account/multi/ids/7','公司管理 公司账号 批量更新','{\"ids\":\"7\",\"params\":\"status=normal\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524126360),(113,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127124),(114,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127193),(115,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127242),(116,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127348),(117,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127598),(118,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127651),(119,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/6?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"575754\",\"grade\":\"3\",\"expired\":\"2018-04-18 13:21:19\",\"manager\":\"\\u674e\\u9035\",\"status\":\"stop\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127945),(120,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/7?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"35645\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:21:58\",\"manager\":\"\\u667a\\u591a\\u661f\",\"status\":\"stop\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127967),(121,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/7?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"35645\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:21:58\",\"manager\":\"\\u667a\\u591a\\u661f\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524127969),(122,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/7?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"35645\",\"grade\":\"2\",\"expired\":\"2018-04-12 13:21:58\",\"manager\":\"\\u667a\\u591a\\u661f\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524128187),(123,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 16:53:48\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524128702),(124,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/4?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 13:19:29\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"4\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524129089),(125,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/5?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 13:20:18\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524129149),(126,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/1?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"75655445@qq.com\",\"manager\":\"\\u65e0\",\"password\":\"qwerqewrqerqw\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 13:16:16\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524129299),(127,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/1?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"link\":\"75655445@qq.com\",\"manager\":\"\\u65e0\",\"password\":\"\",\"grade\":\"\\u514d\\u8d39\\u7248\",\"expired\":\"2018-04-18 13:16:16\",\"status\":\"\\u6b63\\u5e38\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524129316),(128,1,'admin','/admin/public/index.php/admin/company/company/edit/ids/8?dialog=1','公司管理 公司管理 编辑','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"234\",\"grade\":\"3\",\"expired\":\"2018-04-18 16:52:03\",\"manager\":\"\\u97e9\\u6885\\u6885\",\"status\":\"wait\"},\"ids\":\"8\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524129779),(129,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524130061),(130,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524130136),(131,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524130174),(132,1,'admin','/admin/public/index.php/admin/company/account/edit/ids/7?dialog=1','公司管理 公司账号 编辑','{\"dialog\":\"1\",\"row\":{\"account\":\"\\u4e00\\u4e2a\\u841d\\u535c\",\"cid\":\"2\",\"role\":\"\\u7ba1\\u7406\\u8005\",\"lastactivetime\":\"2018-04-18 17:07:21\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524130460),(133,1,'admin','/admin/public/index.php/admin/data/platform/add?dialog=1','数据管理 直播平台管理 添加','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524130753),(134,1,'admin','/admin/public/index.php/admin/data/platform/edit/ids/1?dialog=1','数据管理 直播平台管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"stop\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524130778),(135,1,'admin','/admin/public/index.php/admin/data/platform/config/ids/1?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"stop\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524131867),(136,1,'admin','/admin/public/index.php/admin/data/platform/config/ids/1?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"\\u800c\\u5a01\\u5c14\\u7279\\u52a1r\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524131870),(137,1,'admin','/admin/public/index.php/admin/data/platform/config/ids/1?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"stop\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524131871),(138,1,'admin','/admin/public/index.php/admin/data/platform/config/ids/company/company/add','','{\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"stop\"},\"ids\":\"company\",\"company\":\"add\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524131920),(139,1,'admin','/admin/public/index.php/admin/data/platform/config/ids/company/company/info','','{\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"stop\"},\"ids\":\"company\",\"company\":\"info\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524131985),(140,1,'admin','/admin/public/index.php/admin/data/session/add?dialog=1','数据管理 场次数据 添加','{\"dialog\":\"1\",\"row\":{\"begintime\":\"2018-04-19 18:55:38\",\"endtime\":\"2018-04-20 18:55:38\",\"pid\":\"1\",\"aid\":\"1\",\"livetime\":\"2018-04-19 18:55:38\",\"giftvalue\":\"0.00\",\"sendgift\":\"0\",\"barrage\":\"0\",\"barragepeople\":\"0\",\"subscribe\":\"0\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524135356),(141,1,'admin','/admin/public/index.php/admin/index/login?url=%2Fadmin%2Fpublic%2Findex.php%2Fadmin%2Fdata%2Fsession%2FcaculateLiveTime','登录','{\"url\":\"\\/admin\\/public\\/index.php\\/admin\\/data\\/session\\/caculateLiveTime\",\"__token__\":\"4b0aa2189df34975a2cca0504fd38a48\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524136004),(142,1,'admin','/admin/public/index.php/admin/index/login.html','登录','{\"__token__\":\"1f10721519de9ae48e1fd74716c0cad5\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524451553),(143,1,'admin','/admin/public/index.php/admin/data/platform/edit/ids/1?dialog=1','数据管理 直播平台管理 编辑','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524468558),(144,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524478160),(145,1,'admin','/admin/public/index.php/admin/anchor/add?dialog=1','主播管理 添加','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"signed\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524481054),(146,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"nosign\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524483842),(147,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"signed\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524483851),(148,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"nosign\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524483863),(149,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"signed\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524484004),(150,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"signed\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"stop\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524484702),(151,1,'admin','/admin/public/index.php/admin/index/login?url=%2Fadmin%2Fpublic%2Findex.php%2Fadmin%2Fgeneral%2Fconfig%3Fref%3Daddtabs','登录','{\"url\":\"\\/admin\\/public\\/index.php\\/admin\\/general\\/config?ref=addtabs\",\"__token__\":\"5917c8cff48fffd43c848687b25742aa\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524532450),(152,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"nosign\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524537184),(153,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524538283),(154,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"nosign\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"stop\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524542537),(155,1,'admin','/admin/public/index.php/admin/data/giftconfig/add?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7405\\u740a\\u699c\",\"icon\":\"\\/assets\\/img\\/wolf.png\",\"platformprice\":\"0.84\",\"realprice\":\"45.86\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524557639),(156,1,'admin','/admin/public/index.php/admin/data/giftconfig/edit/ids/4?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u7405\\u740a\\u68d2\",\"icon\":\"\\/assets\\/img\\/wolf.png\",\"platformprice\":\"0.84\",\"realprice\":\"45.86\",\"status\":\"normal\"},\"ids\":\"4\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524557650),(157,1,'admin','/admin/public/index.php/admin/data/giftconfig/del/ids/4','','{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524557898),(158,1,'admin','/admin/public/index.php/admin/data/giftconfig/add?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u718a\\u7259\",\"icon\":\"shuifeir\\/wheiqheiwr\\/wehhwieirf\",\"platformprice\":\"1245.54\",\"realprice\":\"7821.58\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558069),(159,1,'admin','/admin/public/index.php/admin/data/giftconfig/del/ids/5','','{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558073),(160,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"\\u793c\\u7269\\u914d\\u7f6e.csv\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558636),(161,1,'admin','/admin/public/index.php/admin/data/giftconfig','','{\"file\":\"\\/uploads\\/20180424\\/dfd62fd9e1605940579b9821b37f8b4f.csv\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558636),(162,1,'admin','/admin/public/index.php/admin/data/giftconfig/del/ids/3','','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558647),(163,1,'admin','/admin/public/index.php/admin/data/giftconfig/del/ids/2','','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558649),(164,1,'admin','/admin/public/index.php/admin/data/giftconfig/del/ids/1','','{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558651),(165,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"tableExport.csv\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558658),(166,1,'admin','/admin/public/index.php/admin/data/giftconfig','','{\"file\":\"\\/uploads\\/20180424\\/0ef7e9067afb2e457467949ab9937edc.csv\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558659),(167,1,'admin','/admin/public/index.php/admin/data/giftconfig/add?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u8840\\u6ef4\\u5b50\",\"icon\":\"\",\"platformprice\":\"0.00\",\"realprice\":\"0.00\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558667),(168,1,'admin','/admin/public/index.php/admin/data/giftconfig/edit/ids/6?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u8840\\u6ef4\\u5b50\",\"icon\":\"\\/assets\\/img\\/wolf.png\",\"platformprice\":\"0.26\",\"realprice\":\"12.87\",\"status\":\"normal\"},\"ids\":\"6\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524558684),(169,1,'admin','/admin/public/index.php/admin/anchor/edit/ids/1?dialog=1','主播管理 编辑','{\"dialog\":\"1\",\"row\":{\"pid\":\"1\",\"aid\":\"1\",\"roomid\":\"45874110\",\"liveurl\":\"http:\\/\\/www.baidu.com\",\"livestatus\":\"normal\",\"sign\":\"signed\",\"account\":\"weuiruewruiwer23142341\",\"status\":\"normal\"},\"ids\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559105),(170,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"Desert.jpg\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559186),(171,1,'admin','/admin/public/index.php/admin/category/edit/ids/13?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"test\",\"pid\":\"0\",\"name\":\"\\u6d4b\\u8bd52\",\"nickname\":\"test2\",\"flag\":[\"recommend\"],\"image\":\"\\/uploads\\/20180424\\/ba45c8f60456a672e003a875e469d0eb.jpg\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"13\",\"status\":\"normal\"},\"ids\":\"13\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559189),(172,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"Chrysanthemum.jpg\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559207),(173,1,'admin','/admin/public/index.php/admin/category/edit/ids/12?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"test\",\"pid\":\"0\",\"name\":\"\\u6d4b\\u8bd51\",\"nickname\":\"test1\",\"flag\":[\"recommend\"],\"image\":\"\\/uploads\\/20180424\\/076e3caed758a1c18c91a0e9cae3368f.jpg\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"12\",\"status\":\"normal\"},\"ids\":\"12\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559209),(174,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"Desert.jpg\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559218),(175,1,'admin','/admin/public/index.php/admin/category/edit/ids/5?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"page\",\"pid\":\"0\",\"name\":\"\\u8f6f\\u4ef6\\u4ea7\\u54c1\",\"nickname\":\"software\",\"flag\":[\"recommend\"],\"image\":\"\\/uploads\\/20180424\\/ba45c8f60456a672e003a875e469d0eb.jpg\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"5\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559220),(176,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"Hydrangeas.jpg\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559228),(177,1,'admin','/admin/public/index.php/admin/category/edit/ids/5?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"page\",\"pid\":\"0\",\"name\":\"\\u8f6f\\u4ef6\\u4ea7\\u54c1\",\"nickname\":\"software\",\"flag\":[\"recommend\"],\"image\":\"\\/uploads\\/20180424\\/bdf3bf1da3405725be763540d6601144.jpg\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"5\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559230),(178,1,'admin','/admin/public/index.php/admin/ajax/upload','','{\"name\":\"Lighthouse.jpg\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559268),(179,1,'admin','/admin/public/index.php/admin/category/edit/ids/7?dialog=1','分类管理 编辑','{\"dialog\":\"1\",\"row\":{\"type\":\"page\",\"pid\":\"0\",\"name\":\"\\u4f01\\u4e1a\\u7ba1\\u7406\\u8f6f\\u4ef6\",\"nickname\":\"company\",\"flag\":[\"index\"],\"image\":\"\\/uploads\\/20180424\\/8969288f4245120e7c3870287cce0ff3.jpg\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"7\",\"status\":\"normal\"},\"ids\":\"7\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559296),(180,1,'admin','/admin/public/index.php/admin/index/login.html','登录','{\"__token__\":\"3cbb3bd03e0e05a5f79cdec3970777bc\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524559660),(181,1,'admin','/admin/public/index.php/admin/auth/group/roletree','','{\"pid\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524568924),(182,1,'admin','/admin/public/index.php/admin/auth/group/roletree','','{\"pid\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524568961),(183,1,'admin','/admin/public/index.php/admin/general.config/edit','常规管理 系统配置 编辑','[]','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524570669),(184,1,'admin','/admin/public/index.php/admin/data/giftconfig/add?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e0a\\u6d77\\u5982\\u5f71\\u4fe1\\u606f\\u6280\\u672f\\u6709\\u9650\\u516c\\u53f8\",\"icon\":\"\\/assets\\/img\\/wolf.png\",\"platformprice\":\"12.584\",\"realprice\":\"2878.24\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524570715),(185,1,'admin','/admin/public/index.php/admin/data/giftconfig/edit/ids/2?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u72fc\\u7259\",\"icon\":\"\\/assets\\/img\\/wolf.png\",\"platformprice\":\"12.58\",\"realprice\":\"2878.24\",\"status\":\"normal\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524570733),(186,1,'admin','/admin/public/index.php/admin/data/giftconfig/add?dialog=1','','{\"dialog\":\"1\",\"row\":{\"name\":\"\\u864e\\u7259\",\"icon\":\"\\/assets\\/img\\/wolf.png\",\"platformprice\":\"0.08\",\"realprice\":\"12.58\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524570747),(187,1,'admin','/admin/public/index.php/admin/auth/group/roletree','','{\"pid\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524571061),(188,1,'admin','/admin/public/index.php/admin/auth/group/roletree','','{\"pid\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524571075),(189,1,'admin','/admin/public/index.php/admin/auth/group/add?dialog=1','权限管理 角色组 添加','{\"dialog\":\"1\",\"row\":{\"rules\":\"85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148\",\"pid\":\"1\",\"name\":\"\\u56db\\u7ea7\\u7ba1\\u7406\\u7ec4\",\"status\":\"normal\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524571097),(190,1,'admin','/admin/public/index.php/admin/auth/group/del/ids/6','权限管理 角色组 删除','{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524571106),(191,1,'admin','/admin/public/index.php/admin/auth/group/roletree','','{\"pid\":\"1\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524571108),(192,1,'admin','/admin/public/index.php/admin/auth/group/roletree','','{\"pid\":\"3\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524571111),(193,1,'admin','/admin/public/index.php/admin/index/login.html','登录','{\"__token__\":\"67ccb1c09b4817f9736e61e6d574fd37\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524618367),(194,2,'admin2','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"5f996653e578590ccc403bfb75a5946d\",\"username\":\"admin2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524640175),(195,1,'admin','/admin/public/index.php/admin/index/login','登录','{\"__token__\":\"389a56b56f70c9e9a43baca0d00bfc32\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524640192),(196,1,'admin','/admin/public/index.php/admin/index/login.html','登录','{\"__token__\":\"be4822fbcff130f14574acccea8e862c\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524704361),(197,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524709626),(198,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524709888),(199,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524710383),(200,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524710544),(201,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524710897),(202,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524710898),(203,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524710901),(204,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524710939),(205,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524711052),(206,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524711097),(207,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524711131),(208,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524711144),(209,1,'admin','/admin/public/index.php/admin/company/company/detail?ids=2','公司管理 公司管理 获取公司详情','{\"ids\":\"2\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524711296),(210,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"normal\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524711356),(211,1,'admin','/admin/public/index.php/admin/company/companyanchor/add?dialog=1','公司管理 主播管理 添加','{\"dialog\":\"1\",\"row\":{\"cid\":\"\",\"aid\":\"\",\"pid\":\"\",\"roomid\":\"\",\"roomurl\":\"\",\"status\":\"stop\",\"gid\":\"1\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524731066),(212,1,'admin','/admin/public/index.php/admin/company/companyanchor/add?dialog=1','公司管理 主播管理 添加','{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"aid\":\"1\",\"pid\":\"1\",\"roomid\":\"1\",\"roomurl\":\"http:\\/\\/www.baidu.com\",\"status\":\"default\",\"gid\":\"1\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524731085),(213,1,'admin','/admin/public/index.php/admin/company/companygroup/add?dialog=1','公司管理 分组管理 添加','{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"name\":\"A\\u7ec4\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524731133),(214,1,'admin','/admin/public/index.php/admin/company/companyanchor/add?dialog=1','公司管理 主播管理 添加','{\"dialog\":\"1\",\"row\":{\"cid\":\"1\",\"aid\":\"1\",\"pid\":\"1\",\"roomid\":\"1\",\"roomurl\":\"http:\\/\\/www.baidu.com\",\"status\":\"default\",\"gid\":\"1\"}}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524731157),(215,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/5?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"34646\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:20:18\",\"manager\":\"\\u5b8b\\u6c5f\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734471),(216,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/5?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"34646\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:20:18\",\"manager\":\"\\u5b8b\\u6c5f\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734472),(217,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/5?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"34646\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:20:18\",\"manager\":\"\\u5b8b\\u6c5f\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734473),(218,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/5?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"34646\",\"grade\":\"2\",\"expired\":\"2018-04-18 13:20:18\",\"manager\":\"\\u5b8b\\u6c5f\",\"status\":\"normal\"},\"ids\":\"5\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734474),(219,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/2?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734596),(220,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/2?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"anchornum\":\"24535\",\"grade\":\"0\",\"expired\":\"2018-04-18 13:17:03\",\"manager\":\"\\u6b66\\u94a2\",\"status\":\"wait\"},\"ids\":\"2\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734597),(221,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"normal\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734810),(222,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"normal\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734812),(223,1,'admin','/admin/public/index.php/admin/company/company/detail/ids/10?dialog=1','公司管理 公司管理 获取公司详情','{\"dialog\":\"1\",\"row\":{\"introduce\":\"\",\"anchornum\":\"5568\",\"grade\":\"4\",\"expired\":\"2018-04-18 16:53:48\",\"manager\":\"\\u5e08\\u5085\",\"status\":\"normal\"},\"ids\":\"10\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524734814),(224,1,'admin','/admin/public/index.php/admin/index/login.html','登录','{\"__token__\":\"4e37d66b537c8774e0963ee25271d7a3\",\"username\":\"admin\"}','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.162 Safari/537.36',1524790596);

/*Table structure for table `tb_anchor` */

DROP TABLE IF EXISTS `tb_anchor`;

CREATE TABLE `tb_anchor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned DEFAULT '0' COMMENT '平台',
  `cid` int(10) unsigned DEFAULT '0' COMMENT '所属公司',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(23) DEFAULT '' COMMENT '手机号码',
  `password` varchar(60) DEFAULT '' COMMENT '密码',
  `category` varchar(50) DEFAULT '' COMMENT '分类',
  `link` varchar(20) DEFAULT '' COMMENT '联系方式',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `roomid` int(10) unsigned DEFAULT '0' COMMENT '房间ID',
  `liveurl` varchar(50) DEFAULT '' COMMENT '直播间地址',
  `livestatus` enum('normal','stop') DEFAULT NULL COMMENT '直播状态',
  `sign` enum('signed','nosign') DEFAULT NULL COMMENT '签约工会',
  `account` varchar(50) DEFAULT '' COMMENT '账号',
  `status` enum('normal','stop') DEFAULT NULL COMMENT '状态',
  `remark` longtext COMMENT '备注',
  `group` varchar(30) DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`),
  KEY `fk_anchor_platform` (`pid`),
  KEY `fk_anchor_company` (`cid`),
  CONSTRAINT `fk_anchor_company` FOREIGN KEY (`cid`) REFERENCES `tb_company` (`id`),
  CONSTRAINT `fk_anchor_platform` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_anchor` */

insert  into `tb_anchor` values (1,1,1,'一个穷人','15900785383','e10adc3949ba59abbe56e057f20f883e','','','',45874110,'http://www.baidu.com','normal','signed','weuiruewruiwer23142341','normal',NULL,'');

/*Table structure for table `tb_anchor_group` */

DROP TABLE IF EXISTS `tb_anchor_group`;

CREATE TABLE `tb_anchor_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `name` varchar(50) COLLATE utf8_czech_ci DEFAULT '' COMMENT '分组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

/*Data for the table `tb_anchor_group` */

/*Table structure for table `tb_attachment` */

DROP TABLE IF EXISTS `tb_attachment`;

CREATE TABLE `tb_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

/*Data for the table `tb_attachment` */

insert  into `tb_attachment` values (1,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),(2,'/uploads/20180424/dfd62fd9e1605940579b9821b37f8b4f.csv','','','csv',0,208,'application/vnd.ms-excel','',1524558636,1524558636,1524558635,'local','0f4f6e88baf32fb18e4200fd6dac3c3c4f41d7f1'),(3,'/uploads/20180424/0ef7e9067afb2e457467949ab9937edc.csv','','','csv',0,208,'application/vnd.ms-excel','',1524558658,1524558658,1524558658,'local','4bc6d66146cafeedda13b3b793345888f01e7d13'),(4,'/uploads/20180424/ba45c8f60456a672e003a875e469d0eb.jpg','1024','768','jpg',0,845941,'image/jpeg','',1524559186,1524559186,1524559186,'local','30420d1a9afb2bcb60335812569af4435a59ce17'),(5,'/uploads/20180424/076e3caed758a1c18c91a0e9cae3368f.jpg','1024','768','jpg',0,879394,'image/jpeg','',1524559207,1524559207,1524559207,'local','f5f8ad26819a471318d24631fa5055036712a87e'),(6,'/uploads/20180424/ba45c8f60456a672e003a875e469d0eb.jpg','1024','768','jpg',0,845941,'image/jpeg','',1524559218,1524559218,1524559218,'local','30420d1a9afb2bcb60335812569af4435a59ce17'),(7,'/uploads/20180424/bdf3bf1da3405725be763540d6601144.jpg','1024','768','jpg',0,595284,'image/jpeg','',1524559228,1524559228,1524559228,'local','d997e1c37edc05ad87d03603e32ad495ee2cfce1'),(8,'/uploads/20180424/8969288f4245120e7c3870287cce0ff3.jpg','1024','768','jpg',0,561276,'image/jpeg','',1524559268,1524559268,1524559268,'local','1b4605b0e20ceccf91aa278d10e81fad64e24e27');

/*Table structure for table `tb_auth_group` */

DROP TABLE IF EXISTS `tb_auth_group`;

CREATE TABLE `tb_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

/*Data for the table `tb_auth_group` */

insert  into `tb_auth_group` values (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');

/*Table structure for table `tb_auth_group_access` */

DROP TABLE IF EXISTS `tb_auth_group_access`;

CREATE TABLE `tb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

/*Data for the table `tb_auth_group_access` */

insert  into `tb_auth_group_access` values (1,1),(2,2),(3,3),(4,5),(5,5);

/*Table structure for table `tb_auth_rule` */

DROP TABLE IF EXISTS `tb_auth_rule`;

CREATE TABLE `tb_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

/*Data for the table `tb_auth_rule` */

insert  into `tb_auth_rule` values (2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-list','','Category tips',1,1497429920,1497429920,119,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(85,'file',0,'company','company','fa fa-list','','',1,1523962732,1523962732,0,'normal'),(86,'file',85,'company/company','Company','fa fa-circle-o','','',1,1523962732,1523962732,0,'normal'),(87,'file',86,'company/company/import','导入','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(88,'file',86,'company/company/index','查看页面','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(89,'file',86,'company/company/detail','获取公司详情','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(90,'file',86,'company/company/add','添加','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(91,'file',86,'company/company/edit','编辑','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(92,'file',86,'company/company/del','删除','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(93,'file',86,'company/company/multi','批量更新','fa fa-circle-o','','',0,1523962732,1523962732,0,'normal'),(94,'file',85,'company/account','Account','fa fa-circle-o','','',1,1523962746,1523962746,0,'normal'),(95,'file',94,'company/account/index','查看','fa fa-circle-o','','',0,1523962746,1523962746,0,'normal'),(96,'file',94,'company/account/add','添加','fa fa-circle-o','','',0,1523962746,1523962746,0,'normal'),(97,'file',94,'company/account/edit','编辑','fa fa-circle-o','','',0,1523962746,1523962746,0,'normal'),(98,'file',94,'company/account/del','删除','fa fa-circle-o','','',0,1523962746,1523962746,0,'normal'),(99,'file',94,'company/account/multi','批量更新','fa fa-circle-o','','',0,1523962746,1523962746,0,'normal'),(100,'file',0,'data','data','fa fa-list','','',1,1523962768,1523962768,0,'normal'),(101,'file',100,'data/platform','Platform','fa fa-circle-o','','',1,1523962768,1523962768,0,'normal'),(102,'file',101,'data/platform/index','查看','fa fa-circle-o','','',0,1523962769,1523962769,0,'normal'),(103,'file',101,'data/platform/add','添加','fa fa-circle-o','','',0,1523962769,1523962769,0,'normal'),(104,'file',101,'data/platform/edit','编辑','fa fa-circle-o','','',0,1523962769,1523962769,0,'normal'),(105,'file',101,'data/platform/del','删除','fa fa-circle-o','','',0,1523962769,1523962769,0,'normal'),(106,'file',101,'data/platform/multi','批量更新','fa fa-circle-o','','',0,1523962769,1523962769,0,'normal'),(107,'file',100,'data/gift','Gift','fa fa-circle-o','','',1,1523962806,1523962806,0,'normal'),(108,'file',107,'data/gift/index','查看','fa fa-circle-o','','',0,1523962806,1523962806,0,'normal'),(109,'file',107,'data/gift/add','添加','fa fa-circle-o','','',0,1523962806,1523962806,0,'normal'),(110,'file',107,'data/gift/edit','编辑','fa fa-circle-o','','',0,1523962806,1523962806,0,'normal'),(111,'file',107,'data/gift/del','删除','fa fa-circle-o','','',0,1523962806,1523962806,0,'normal'),(112,'file',107,'data/gift/multi','批量更新','fa fa-circle-o','','',0,1523962806,1523962806,0,'normal'),(113,'file',100,'data/detail','Detail','fa fa-circle-o','','',1,1523962810,1523962810,0,'normal'),(114,'file',113,'data/detail/index','查看','fa fa-circle-o','','',0,1523962810,1523962810,0,'normal'),(115,'file',113,'data/detail/add','添加','fa fa-circle-o','','',0,1523962810,1523962810,0,'normal'),(116,'file',113,'data/detail/edit','编辑','fa fa-circle-o','','',0,1523962810,1523962810,0,'normal'),(117,'file',113,'data/detail/del','删除','fa fa-circle-o','','',0,1523962810,1523962810,0,'normal'),(118,'file',113,'data/detail/multi','批量更新','fa fa-circle-o','','',0,1523962810,1523962810,0,'normal'),(119,'file',100,'data/speak','Speak','fa fa-circle-o','','',1,1523962830,1523962830,0,'normal'),(120,'file',119,'data/speak/index','查看','fa fa-circle-o','','',0,1523962830,1523962830,0,'normal'),(121,'file',119,'data/speak/add','添加','fa fa-circle-o','','',0,1523962830,1523962830,0,'normal'),(122,'file',119,'data/speak/edit','编辑','fa fa-circle-o','','',0,1523962830,1523962830,0,'normal'),(123,'file',119,'data/speak/del','删除','fa fa-circle-o','','',0,1523962830,1523962830,0,'normal'),(124,'file',119,'data/speak/multi','批量更新','fa fa-circle-o','','',0,1523962830,1523962830,0,'normal'),(125,'file',100,'data/popular','Popular','fa fa-circle-o','','',1,1523962835,1523962835,0,'normal'),(126,'file',125,'data/popular/index','查看','fa fa-circle-o','','',0,1523962835,1523962835,0,'normal'),(127,'file',125,'data/popular/add','添加','fa fa-circle-o','','',0,1523962835,1523962835,0,'normal'),(128,'file',125,'data/popular/edit','编辑','fa fa-circle-o','','',0,1523962835,1523962835,0,'normal'),(129,'file',125,'data/popular/del','删除','fa fa-circle-o','','',0,1523962835,1523962835,0,'normal'),(130,'file',125,'data/popular/multi','批量更新','fa fa-circle-o','','',0,1523962835,1523962835,0,'normal'),(131,'file',100,'data/duration','Duration','fa fa-circle-o','','',1,1523962840,1523962840,0,'normal'),(132,'file',131,'data/duration/index','查看','fa fa-circle-o','','',0,1523962840,1523962840,0,'normal'),(133,'file',131,'data/duration/add','添加','fa fa-circle-o','','',0,1523962840,1523962840,0,'normal'),(134,'file',131,'data/duration/edit','编辑','fa fa-circle-o','','',0,1523962840,1523962840,0,'normal'),(135,'file',131,'data/duration/del','删除','fa fa-circle-o','','',0,1523962840,1523962840,0,'normal'),(136,'file',131,'data/duration/multi','批量更新','fa fa-circle-o','','',0,1523962840,1523962840,0,'normal'),(137,'file',100,'data/session','Session','fa fa-circle-o','','',1,1523962843,1523962843,0,'normal'),(138,'file',137,'data/session/index','查看','fa fa-circle-o','','',0,1523962844,1523962844,0,'normal'),(139,'file',137,'data/session/add','添加','fa fa-circle-o','','',0,1523962844,1523962844,0,'normal'),(140,'file',137,'data/session/edit','编辑','fa fa-circle-o','','',0,1523962844,1523962844,0,'normal'),(141,'file',137,'data/session/del','删除','fa fa-circle-o','','',0,1523962844,1523962844,0,'normal'),(142,'file',137,'data/session/multi','批量更新','fa fa-circle-o','','',0,1523962844,1523962844,0,'normal'),(185,'file',0,'anchor','anchor','fa fa-list','','',1,1524736136,1524736136,0,'normal'),(186,'file',185,'anchor/anchor','Anchor','fa fa-anchor','','',1,1524736136,1524736136,0,'normal'),(187,'file',186,'anchor/anchor/index','查看','fa fa-circle-o','','',0,1524736136,1524736136,0,'normal'),(188,'file',186,'anchor/anchor/add','添加','fa fa-circle-o','','',0,1524736136,1524736136,0,'normal'),(189,'file',186,'anchor/anchor/edit','编辑','fa fa-circle-o','','',0,1524736136,1524736136,0,'normal'),(190,'file',186,'anchor/anchor/del','删除','fa fa-circle-o','','',0,1524736136,1524736136,0,'normal'),(191,'file',186,'anchor/anchor/multi','批量更新','fa fa-circle-o','','',0,1524736136,1524736136,0,'normal');

/*Table structure for table `tb_brush_log` */

DROP TABLE IF EXISTS `tb_brush_log`;

CREATE TABLE `tb_brush_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `createtime` datetime DEFAULT NULL COMMENT '日期',
  `account` varchar(60) DEFAULT '' COMMENT '账号',
  `money` decimal(12,2) DEFAULT '0.00' COMMENT '金额',
  `picture` varchar(255) DEFAULT '' COMMENT '截图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_brush_log` */

/*Table structure for table `tb_category` */

DROP TABLE IF EXISTS `tb_category`;

CREATE TABLE `tb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

/*Data for the table `tb_category` */

insert  into `tb_category` values (1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1495262190,1495262190,1,'normal'),(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1495262244,1495262244,2,'normal'),(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1495262288,1495262288,3,'normal'),(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1495262317,1495262317,4,'normal'),(5,0,'page','软件产品','software','recommend','/uploads/20180424/bdf3bf1da3405725be763540d6601144.jpg','','','software',1495262336,1524559230,5,'normal'),(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1495262357,1495262357,6,'normal'),(7,0,'page','企业管理软件','company','index','/uploads/20180424/8969288f4245120e7c3870287cce0ff3.jpg','','','company',1495262391,1524559296,7,'normal'),(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1495262424,1495262424,8,'normal'),(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1495262456,1495262456,9,'normal'),(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1495262487,1495262487,10,'normal'),(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1495262515,1495262515,11,'normal'),(12,0,'test','测试1','test1','recommend','/uploads/20180424/076e3caed758a1c18c91a0e9cae3368f.jpg','','','test1',1497015727,1524559208,12,'normal'),(13,0,'test','测试2','test2','recommend','/uploads/20180424/ba45c8f60456a672e003a875e469d0eb.jpg','','','test2',1497015738,1524559188,13,'normal');

/*Table structure for table `tb_company` */

DROP TABLE IF EXISTS `tb_company`;

CREATE TABLE `tb_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT '' COMMENT '公司名称',
  `anchornum` int(30) DEFAULT '0' COMMENT '主播数量',
  `grade` int(18) DEFAULT '0' COMMENT '账号等级',
  `expired` datetime DEFAULT NULL COMMENT '过期时间',
  `status` enum('wait','normal','stop') DEFAULT NULL,
  `manager` varchar(30) DEFAULT '' COMMENT '商务经理',
  `cellphone` varchar(11) DEFAULT '' COMMENT '手机号',
  `introduce` varchar(500) DEFAULT '' COMMENT '公司介绍',
  `link` varchar(60) DEFAULT '' COMMENT '联系方式',
  `password` varchar(30) DEFAULT '' COMMENT '密码',
  `group` varchar(30) DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tb_company` */

insert  into `tb_company` values (1,'上海游达网络科技有限公司',12358,1,'2018-04-18 13:16:16','normal','韩梅梅','15927871581','','75655445@qq.com','',''),(2,'上海辉烨科技有限公司',24535,0,'2018-04-18 13:17:03','wait','武钢','14581554564','','','',''),(3,'上海雨德科技有限公司',787234,0,'2018-04-18 13:17:54','wait','熊熊','54879852212','','','',''),(4,'上海2345科技有限公司',3435,1,'2018-04-18 13:19:29','stop','武松','13578814441','','','',''),(5,'南京双星塑料模具有限公司',34646,2,'2018-04-18 13:20:18','normal','宋江','17845451155','','','',''),(6,'上海化工学院',575754,3,'2018-04-18 13:21:19','normal','李逵','18254545454','','','',''),(7,'合肥中国科技大学',35645,2,'2018-04-12 13:21:58','normal','智多星','45487154812','','','',''),(8,'上海侦测公司',234,3,'2018-04-18 16:52:03','wait','韩梅梅','13878454578','','','',''),(9,'上海甲骨文公司',3453,2,'2018-04-18 16:52:47','stop','镇魂','15378777872','','wuehrqw@163.com','',''),(10,'南京华子公司',5568,4,'2018-04-18 16:53:48','normal','师傅','15845325645','','','','');

/*Table structure for table `tb_company_anchor` */

DROP TABLE IF EXISTS `tb_company_anchor`;

CREATE TABLE `tb_company_anchor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播ID',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台ID',
  `roomid` varchar(38) DEFAULT '' COMMENT '房间ID',
  `roomurl` varchar(50) DEFAULT '' COMMENT '房间地址',
  `status` enum('default','normal','stop') DEFAULT NULL COMMENT '状态',
  `gid` int(10) unsigned DEFAULT NULL COMMENT '隶属分组',
  PRIMARY KEY (`id`),
  KEY `fk_company_anchor` (`aid`),
  KEY `fk_company_platform` (`pid`),
  KEY `fk_company_company` (`cid`),
  KEY `fk_company_group` (`gid`),
  CONSTRAINT `fk_company_anchor` FOREIGN KEY (`aid`) REFERENCES `tb_anchor` (`id`),
  CONSTRAINT `fk_company_company` FOREIGN KEY (`cid`) REFERENCES `tb_company` (`id`),
  CONSTRAINT `fk_company_group` FOREIGN KEY (`gid`) REFERENCES `tb_company_group` (`id`),
  CONSTRAINT `fk_company_platform` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_company_anchor` */

insert  into `tb_company_anchor` values (3,1,1,1,'1','http://www.baidu.com','default',1);

/*Table structure for table `tb_company_group` */

DROP TABLE IF EXISTS `tb_company_group`;

CREATE TABLE `tb_company_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(10) unsigned DEFAULT NULL COMMENT '公司主键',
  `name` varchar(60) DEFAULT '' COMMENT '分组名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_company_group` */

insert  into `tb_company_group` values (1,1,'A组');

/*Table structure for table `tb_config` */

DROP TABLE IF EXISTS `tb_config`;

CREATE TABLE `tb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

/*Data for the table `tb_config` */

insert  into `tb_config` values (1,'name','basic','Site name','请填写站点名称','string','FastAdmin','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');

/*Table structure for table `tb_detail` */

DROP TABLE IF EXISTS `tb_detail`;

CREATE TABLE `tb_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播',
  `username` varchar(30) DEFAULT '' COMMENT '用户名',
  `content` text COMMENT '内容',
  `platformprice` decimal(12,2) DEFAULT '0.00' COMMENT '平台价格',
  `realprice` decimal(12,2) DEFAULT '0.00' COMMENT '实际价格',
  PRIMARY KEY (`id`),
  KEY `fk_platform_detail` (`pid`),
  KEY `fk_user_detail` (`aid`),
  CONSTRAINT `fk_platform_detail` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`),
  CONSTRAINT `fk_user_detail` FOREIGN KEY (`aid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_detail` */

/*Table structure for table `tb_duration` */

DROP TABLE IF EXISTS `tb_duration`;

CREATE TABLE `tb_duration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `date` date DEFAULT NULL COMMENT '日期',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播',
  `livetime` varchar(38) DEFAULT '' COMMENT '直播时长',
  PRIMARY KEY (`id`),
  KEY `fk_platform_duration` (`pid`),
  KEY `fk_user_duration` (`aid`),
  CONSTRAINT `fk_platform_duration` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`),
  CONSTRAINT `fk_user_duration` FOREIGN KEY (`aid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_duration` */

insert  into `tb_duration` values (1,'2018-04-23',1,1,'2');

/*Table structure for table `tb_ems` */

DROP TABLE IF EXISTS `tb_ems`;

CREATE TABLE `tb_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

/*Data for the table `tb_ems` */

/*Table structure for table `tb_gift` */

DROP TABLE IF EXISTS `tb_gift`;

CREATE TABLE `tb_gift` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `date` date DEFAULT NULL COMMENT '日期',
  `hour` time DEFAULT NULL COMMENT '小时',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播',
  `sendgift` int(18) DEFAULT '0' COMMENT '送礼人数',
  `giftnum` int(20) DEFAULT '0' COMMENT '礼物个数',
  `giftvalue` decimal(12,2) DEFAULT '0.00' COMMENT '礼物价值',
  `maxgift` decimal(12,2) DEFAULT '0.00' COMMENT '最高礼物',
  `realprice` decimal(12,2) DEFAULT '0.00' COMMENT '实际价格',
  PRIMARY KEY (`id`),
  KEY `fk_platform_gift` (`pid`),
  KEY `fk_user_gift` (`aid`),
  CONSTRAINT `fk_platform_gift` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`),
  CONSTRAINT `fk_user_gift` FOREIGN KEY (`aid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_gift` */

/*Table structure for table `tb_gift_config` */

DROP TABLE IF EXISTS `tb_gift_config`;

CREATE TABLE `tb_gift_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) DEFAULT '' COMMENT '名称',
  `icon` varchar(255) DEFAULT '' COMMENT '图标',
  `platformprice` decimal(12,2) DEFAULT '0.00' COMMENT '平台价格',
  `realprice` decimal(12,2) DEFAULT '0.00' COMMENT '实际价格',
  `status` enum('normal','stop') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_gift_config` */

insert  into `tb_gift_config` values (1,'血滴子','/assets/img/wolf.png','0.26','12.87','normal'),(2,'狼牙','/assets/img/wolf.png','12.58','2878.24','normal'),(3,'虎牙','/assets/img/wolf.png','0.08','12.58','normal');

/*Table structure for table `tb_platform` */

DROP TABLE IF EXISTS `tb_platform`;

CREATE TABLE `tb_platform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(30) DEFAULT '' COMMENT '平台名称',
  `status` enum('normal','stop') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_platform` */

insert  into `tb_platform` values (1,'虎牙','normal');

/*Table structure for table `tb_popular` */

DROP TABLE IF EXISTS `tb_popular`;

CREATE TABLE `tb_popular` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `date` date DEFAULT NULL COMMENT '日期',
  `hour` time DEFAULT NULL COMMENT '小时',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播',
  `subscribe` int(24) DEFAULT '0' COMMENT '订阅数',
  `onlinenum` int(23) DEFAULT '0' COMMENT '在线数',
  PRIMARY KEY (`id`),
  KEY `fk_platform_popular` (`pid`),
  KEY `fk_user_popular` (`aid`),
  CONSTRAINT `fk_platform_popular` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`),
  CONSTRAINT `fk_user_popular` FOREIGN KEY (`aid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_popular` */

/*Table structure for table `tb_session` */

DROP TABLE IF EXISTS `tb_session`;

CREATE TABLE `tb_session` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `begintime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播',
  `livetime` varchar(41) DEFAULT '' COMMENT '直播时长',
  `giftvalue` decimal(12,2) DEFAULT '0.00' COMMENT '礼物价值',
  `sendgift` int(25) DEFAULT '0' COMMENT '送礼人数',
  `barrage` int(56) DEFAULT '0' COMMENT '弹幕数',
  `barragepeople` int(46) DEFAULT '0' COMMENT '弹幕人数',
  `subscribe` int(48) DEFAULT '0' COMMENT '订阅量',
  PRIMARY KEY (`id`),
  KEY `fk_platform_session` (`pid`),
  KEY `fk_user_session` (`aid`),
  CONSTRAINT `fk_platform_session` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`),
  CONSTRAINT `fk_user_session` FOREIGN KEY (`aid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_session` */

insert  into `tb_session` values (1,'2018-04-19 18:55:38','2018-04-20 18:55:38',1,1,'1524135338','0.00',0,0,0,0);

/*Table structure for table `tb_sms` */

DROP TABLE IF EXISTS `tb_sms`;

CREATE TABLE `tb_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

/*Data for the table `tb_sms` */

/*Table structure for table `tb_speak` */

DROP TABLE IF EXISTS `tb_speak`;

CREATE TABLE `tb_speak` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `date` date DEFAULT NULL COMMENT '日期',
  `hour` time DEFAULT NULL COMMENT '小时',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '平台',
  `aid` int(10) unsigned DEFAULT NULL COMMENT '主播',
  `barragepeople` int(42) DEFAULT '0' COMMENT '弹幕人数',
  `barragenum` int(35) DEFAULT '0' COMMENT '弹幕数量',
  PRIMARY KEY (`id`),
  KEY `fk_platform_speak` (`pid`),
  KEY `fk_user_speak` (`aid`),
  CONSTRAINT `fk_platform_speak` FOREIGN KEY (`pid`) REFERENCES `tb_platform` (`id`),
  CONSTRAINT `fk_user_speak` FOREIGN KEY (`aid`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_speak` */

/*Table structure for table `tb_test` */

DROP TABLE IF EXISTS `tb_test`;

CREATE TABLE `tb_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

/*Data for the table `tb_test` */

insert  into `tb_test` values (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,0,1,'normal','1');

/*Table structure for table `tb_trace_log` */

DROP TABLE IF EXISTS `tb_trace_log`;

CREATE TABLE `tb_trace_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `author` varchar(60) DEFAULT '' COMMENT '记录人',
  `content` varchar(255) DEFAULT '' COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_trace_log` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) NOT NULL DEFAULT '' COMMENT '格言',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上次登录时间',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

/*Data for the table `tb_user` */

insert  into `tb_user` values (1,1,'admin','admin','c13f62012fd6a8fdf06b3452a94430e5','rpR6Bv','admin@163.com','13888888888','/assets/img/avatar.png',0,0,'2017-04-15','',0,1,1,1516170492,1516171614,'127.0.0.1',0,'127.0.0.1',1491461418,0,1516171614,'','normal','');

/*Table structure for table `tb_user_group` */

DROP TABLE IF EXISTS `tb_user_group`;

CREATE TABLE `tb_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员组表';

/*Data for the table `tb_user_group` */

insert  into `tb_user_group` values (1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');

/*Table structure for table `tb_user_rule` */

DROP TABLE IF EXISTS `tb_user_rule`;

CREATE TABLE `tb_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='会员规则表';

/*Data for the table `tb_user_rule` */

insert  into `tb_user_rule` values (1,0,'index','前台','',1,1516168079,1516168079,1,'normal'),(2,0,'api','API接口','',1,1516168062,1516168062,2,'normal'),(3,1,'user','会员模块','',1,1515386221,1516168103,12,'normal'),(4,2,'user','会员模块','',1,1515386221,1516168092,11,'normal'),(5,3,'index/user/login','登录','',0,1515386247,1515386247,5,'normal'),(6,3,'index/user/register','注册','',0,1515386262,1516015236,7,'normal'),(7,3,'index/user/index','会员中心','',0,1516015012,1516015012,9,'normal'),(8,3,'index/user/profile','个人资料','',0,1516015012,1516015012,4,'normal'),(9,4,'api/user/login','登录','',0,1515386247,1515386247,6,'normal'),(10,4,'api/user/register','注册','',0,1515386262,1516015236,8,'normal'),(11,4,'api/user/index','会员中心','',0,1516015012,1516015012,10,'normal'),(12,4,'api/user/profile','个人资料','',0,1516015012,1516015012,3,'normal');

/*Table structure for table `tb_user_score_log` */

DROP TABLE IF EXISTS `tb_user_score_log`;

CREATE TABLE `tb_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分变动表';

/*Data for the table `tb_user_score_log` */

/*Table structure for table `tb_user_token` */

DROP TABLE IF EXISTS `tb_user_token`;

CREATE TABLE `tb_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expiretime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员Token表';

/*Data for the table `tb_user_token` */

/*Table structure for table `tb_version` */

DROP TABLE IF EXISTS `tb_version`;

CREATE TABLE `tb_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

/*Data for the table `tb_version` */

insert  into `tb_version` values (1,'1.1.1,2','1.2.1','20M','更新内容','https://www.fastadmin.net/download.html',1,1520425318,0,0,'normal');

/* Procedure structure for procedure `proc_adder` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_adder` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_adder`(IN a int, IN b int, OUT sum int)
BEGIN
    #Routine body goes here...
    DECLARE c int;
    if a is null then set a = 0; 
    end if;
  
    if b is null then set b = 0;
    end if;
    set sum  = a + b;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
