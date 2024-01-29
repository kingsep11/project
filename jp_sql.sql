/*
SQLyog Trial v12.2.2 (64 bit)
MySQL - 5.7.12-log : Database - jp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jp`;

/*Table structure for table `map_cat_skill` */

DROP TABLE IF EXISTS `map_cat_skill`;

CREATE TABLE `map_cat_skill` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cat_id` int(4) NOT NULL,
  `skill_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `map_cat_skill` */

/*Table structure for table `map_cat_subcat` */

DROP TABLE IF EXISTS `map_cat_subcat`;

CREATE TABLE `map_cat_subcat` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cat_id` int(4) NOT NULL,
  `subcat_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `map_cat_subcat` */

/*Table structure for table `map_work_skillset` */

DROP TABLE IF EXISTS `map_work_skillset`;

CREATE TABLE `map_work_skillset` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `work_id` int(10) NOT NULL COMMENT 'work_id from work master',
  `skillset_id` int(15) NOT NULL COMMENT 'skillset_id from skill master',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `map_work_skillset` */

insert  into `map_work_skillset`(`id`,`work_id`,`skillset_id`) values 
(1,1,1),
(2,1,3),
(3,1,4),
(4,1,11),
(5,2,1),
(6,2,2),
(7,3,5),
(8,3,1),
(9,3,2),
(10,3,4),
(11,3,7);

/*Table structure for table `matr_subcat` */

DROP TABLE IF EXISTS `matr_subcat`;

CREATE TABLE `matr_subcat` (
  `sub_catid` int(4) NOT NULL AUTO_INCREMENT,
  `sub_catname` varchar(200) NOT NULL,
  PRIMARY KEY (`sub_catid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `matr_subcat` */

insert  into `matr_subcat`(`sub_catid`,`sub_catname`) values 
(1,'Build Website'),
(2,'Build Online Store'),
(3,'Get traffic to website'),
(4,'Write some Software'),
(5,'Convert Template to Website');

/*Table structure for table `mstr_budget_type` */

DROP TABLE IF EXISTS `mstr_budget_type`;

CREATE TABLE `mstr_budget_type` (
  `budget_id` int(4) NOT NULL AUTO_INCREMENT,
  `budget_name` varchar(200) NOT NULL,
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `mstr_budget_type` */

insert  into `mstr_budget_type`(`budget_id`,`budget_name`) values 
(1,'Fixed'),
(2,'Hourly');

/*Table structure for table `mstr_category` */

DROP TABLE IF EXISTS `mstr_category`;

CREATE TABLE `mstr_category` (
  `cat_id` int(4) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(200) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `mstr_category` */

insert  into `mstr_category`(`cat_id`,`cat_name`) values 
(1,'Website and Software');

/*Table structure for table `mstr_listing` */

DROP TABLE IF EXISTS `mstr_listing`;

CREATE TABLE `mstr_listing` (
  `list_type_id` int(4) NOT NULL AUTO_INCREMENT,
  `list_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`list_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mstr_listing` */

/*Table structure for table `mstr_skillset` */

DROP TABLE IF EXISTS `mstr_skillset`;

CREATE TABLE `mstr_skillset` (
  `skill_id` int(4) NOT NULL AUTO_INCREMENT,
  `skillset_name` varchar(200) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `mstr_skillset` */

insert  into `mstr_skillset`(`skill_id`,`skillset_name`) values 
(1,'HTML'),
(2,'PHP'),
(3,'Webdesign'),
(4,'Graphic Design'),
(5,'Shopping carts'),
(6,'Ecommerce'),
(7,'SEO'),
(8,'Link Building'),
(9,'Internet Marketting'),
(10,'Software Architecture'),
(11,'PSD to HTML');

/*Table structure for table `user_certification` */

DROP TABLE IF EXISTS `user_certification`;

CREATE TABLE `user_certification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT 'uid from user_credentials',
  `certification` varchar(200) DEFAULT NULL,
  `cert_org` varchar(100) DEFAULT NULL,
  `cert_descr` varchar(1000) DEFAULT NULL,
  `cert_year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_certification` */

/*Table structure for table `user_credentials` */

DROP TABLE IF EXISTS `user_credentials`;

CREATE TABLE `user_credentials` (
  `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'user id unique id',
  `user_name` varchar(50) NOT NULL COMMENT 'user name for login',
  `password` varchar(200) NOT NULL COMMENT 'user password',
  `active` varchar(1) NOT NULL DEFAULT 'Y' COMMENT 'user active status',
  `created_date` datetime NOT NULL COMMENT 'user created date',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_credentials` */

insert  into `user_credentials`(`uid`,`user_name`,`password`,`active`,`created_date`) values 
(1,'admin','admin','Y','2016-05-25 03:16:04');

/*Table structure for table `user_membership` */

DROP TABLE IF EXISTS `user_membership`;

CREATE TABLE `user_membership` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `uid` int(100) NOT NULL COMMENT 'uid from user_credentials table',
  `membership_type` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_membership` */

/*Table structure for table `user_professional_experience` */

DROP TABLE IF EXISTS `user_professional_experience`;

CREATE TABLE `user_professional_experience` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT 'uid from user_credentials table',
  `title` varchar(200) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `from` datetime DEFAULT NULL COMMENT 'start date of working',
  `toYear` datetime DEFAULT NULL,
  `isCurrentOrg` varchar(1) DEFAULT 'N',
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_professional_experience` */

/*Table structure for table `user_profile` */

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT 'uid field reference from user_credentials table',
  `user_fullname` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_mobile` varchar(15) NOT NULL,
  `user_country` varchar(50) NOT NULL,
  `profile_headline` varchar(250) NOT NULL,
  `profile_summary` varchar(1000) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_profile` */

/*Table structure for table `user_reviewid` */

DROP TABLE IF EXISTS `user_reviewid`;

CREATE TABLE `user_reviewid` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT 'uid from user_credentials table',
  `review_text` varchar(2000) DEFAULT NULL,
  `rating` int(1) DEFAULT NULL COMMENT 'rating between (1 to 5)',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_reviewid` */

/*Table structure for table `user_skillset` */

DROP TABLE IF EXISTS `user_skillset`;

CREATE TABLE `user_skillset` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT 'uid from user_credentials table',
  `skill_cat_id` int(10) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_skillset` */

/*Table structure for table `user_verification` */

DROP TABLE IF EXISTS `user_verification`;

CREATE TABLE `user_verification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT 'uid from user_credentials table',
  `email_verify` varchar(1) NOT NULL DEFAULT 'N',
  `phone_verify` varchar(1) NOT NULL DEFAULT 'N',
  `id_verify` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'user identification verify',
  `payment_verify` varchar(1) NOT NULL DEFAULT 'N',
  `created_date` datetime NOT NULL,
  `email_verified_date` datetime DEFAULT NULL,
  `phone_verified_date` datetime DEFAULT NULL,
  `payment_verified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_verification` */

/*Table structure for table `work_bid` */

DROP TABLE IF EXISTS `work_bid`;

CREATE TABLE `work_bid` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `work_id` int(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `bid_amount` decimal(10,0) NOT NULL,
  `delivery_days` int(3) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `work_bid` */

/*Table structure for table `work_budget` */

DROP TABLE IF EXISTS `work_budget`;

CREATE TABLE `work_budget` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `work_id` int(15) NOT NULL,
  `min_budget` decimal(10,0) NOT NULL,
  `max_budget` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `work_budget` */

insert  into `work_budget`(`id`,`work_id`,`min_budget`,`max_budget`) values 
(1,1,'600','1000'),
(2,2,'1200','2000'),
(3,3,'100','250');

/*Table structure for table `work_category` */

DROP TABLE IF EXISTS `work_category`;

CREATE TABLE `work_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `work_id` int(20) NOT NULL COMMENT 'work_id from work_master',
  `work_cat` int(2) NOT NULL COMMENT 'work category id from category master',
  `work_sub_cat` int(3) NOT NULL COMMENT 'work sub category from sub category table',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `work_category` */

insert  into `work_category`(`id`,`work_id`,`work_cat`,`work_sub_cat`,`created_date`) values 
(1,1,1,1,'2016-05-29 10:44:45'),
(2,2,1,1,'2016-05-29 10:44:45'),
(3,3,1,1,'2016-05-29 10:44:45');

/*Table structure for table `work_master` */

DROP TABLE IF EXISTS `work_master`;

CREATE TABLE `work_master` (
  `work_id` int(20) NOT NULL AUTO_INCREMENT,
  `work_title` varchar(200) NOT NULL,
  `work_desc` varchar(2000) NOT NULL,
  `budget_type` int(2) NOT NULL COMMENT 'budget typeid from budget type masters type',
  `list_type` int(2) NOT NULL COMMENT 'listing type (normal / gold / premium) from listing master',
  `work_owner` int(10) NOT NULL COMMENT 'uid from user_credentials table',
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `work_master` */

insert  into `work_master`(`work_id`,`work_title`,`work_desc`,`budget_type`,`list_type`,`work_owner`,`created_date`) values 
(1,'Build a Simple Website','Create a simple website using the design of an existing WordPress template website. (Download it here: http://ow. ly/JWH7 300pKVH (Remove Spaces)) This will be a new and nearly static web...',1,1,1,'2016-05-29 10:31:21'),
(2,'Convert a Template to a Website','I need someone to download this template: http://ow. ly/JWH7 300pKVH (Remove Spaces) and then contact me and put all the information I need into the template for my website! Thanks, Will ...',1,1,1,'2016-05-29 10:31:21'),
(3,'Virtual football league calculator','A software that will give us goals scores in a match day and that will Point us to a winning team.',1,1,1,'2016-05-29 10:31:21');

/*Table structure for table `work_list_vw` */

DROP TABLE IF EXISTS `work_list_vw`;

/*!50001 DROP VIEW IF EXISTS `work_list_vw` */;
/*!50001 DROP TABLE IF EXISTS `work_list_vw` */;

/*!50001 CREATE TABLE  `work_list_vw`(
 `work_id` int(10) ,
 `work_title` varchar(200) ,
 `work_desc` varchar(2000) ,
 `budget_type` int(2) ,
 `list_type` int(2) ,
 `work_owner` int(10) ,
 `created_date` datetime ,
 `skills` text ,
 `MIN_BUDGET` decimal(10,0) ,
 `MAX_BUDGET` decimal(10,0) 
)*/;

/*View structure for view work_list_vw */

/*!50001 DROP TABLE IF EXISTS `work_list_vw` */;
/*!50001 DROP VIEW IF EXISTS `work_list_vw` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `work_list_vw` AS (select `a`.`work_id` AS `work_id`,`c`.`work_title` AS `work_title`,`c`.`work_desc` AS `work_desc`,`c`.`budget_type` AS `budget_type`,`c`.`list_type` AS `list_type`,`c`.`work_owner` AS `work_owner`,`c`.`created_date` AS `created_date`,group_concat(`b`.`skillset_name` separator ', ') AS `skills`,`d`.`min_budget` AS `MIN_BUDGET`,`d`.`max_budget` AS `MAX_BUDGET` from (((`map_work_skillset` `a` join `mstr_skillset` `b`) join `work_master` `c`) join `work_budget` `d`) where ((`c`.`work_id` = `a`.`work_id`) and (`c`.`work_id` = `d`.`work_id`) and (`a`.`skillset_id` = `b`.`skill_id`)) group by `a`.`work_id`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
