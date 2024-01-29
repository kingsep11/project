/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.7.12-log : Database - fish
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fish` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fish`;

/*Table structure for table `ad_images` */

DROP TABLE IF EXISTS `ad_images`;

CREATE TABLE `ad_images` (
  `img_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ad_id` bigint(20) NOT NULL,
  `image_file_name` varchar(100) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `ad_images` */

insert  into `ad_images`(`img_id`,`ad_id`,`image_file_name`) values 
(1,1,'2.jpg'),
(2,13,'1509338650803_t1.jpg'),
(3,14,'1509339214452_1.jpg'),
(4,15,'1509403801227_1.jpg'),
(5,16,'1509404826500_1.jpg'),
(6,17,'1509405085080_t1.jpg'),
(7,18,'1509405461210_1.jpg'),
(8,19,'1509406042348_1.jpg'),
(9,20,'1509406261311_1.jpg'),
(10,21,'1509563927719_t2.jpg'),
(11,22,'1509852074013_1.jpg');

/*Table structure for table `ad_listing` */

DROP TABLE IF EXISTS `ad_listing`;

CREATE TABLE `ad_listing` (
  `ad_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `ad_title` varchar(100) NOT NULL,
  `ad_descr` varchar(2500) DEFAULT NULL,
  `ad_sub_category_id` int(11) NOT NULL COMMENT 'fk from sub catagory',
  `user_id` bigint(10) NOT NULL,
  `ad_type_id` int(11) NOT NULL,
  `ad_price` double NOT NULL,
  `ad_active` varchar(1) NOT NULL,
  `ad_status` varchar(45) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `fk_ad_subcat_id_idx` (`ad_sub_category_id`),
  CONSTRAINT `fk_ad_subcat_id` FOREIGN KEY (`ad_sub_category_id`) REFERENCES `sub_catagory` (`sub_catagory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `ad_listing` */

insert  into `ad_listing`(`ad_id`,`ad_title`,`ad_descr`,`ad_sub_category_id`,`user_id`,`ad_type_id`,`ad_price`,`ad_active`,`ad_status`,`created_date`) values 
(1,'Test','Test',1,1,1,200,'Y','APPROVED','2017-08-24 17:20:54'),
(2,'Gold fish','Gold fish',1,1,1,200,'Y','APPROVED','2017-08-24 17:37:52'),
(3,'Test Fishing product','Test Fishing product',1,1,1,200,'Y','APPROVED','2017-09-12 15:46:00'),
(4,'cat fish for sale','cat fish for sale',1,1,1,200,'Y','APPROVED','2017-09-16 10:45:50'),
(5,'Tiger Shark','Tiger Shark',1,2,1,200,'Y','APPROVED','2017-09-16 11:09:10'),
(6,'zebra jelly fish','zebra jelly fish',1,2,1,200,'N','PENDING','2017-09-18 21:15:19'),
(7,'Golden Jelly Fish','Golden Jelly Fish',1,3,1,200,'N','PENDING','2017-09-18 21:16:30'),
(8,'Zebra Cat fish','Zebra Cat fish Zebra Cat fish Zebra Cat fish Zebra Cat fish',1,2,1,200,'N','PENDING','2017-09-30 17:28:04'),
(9,'Golden Tiger fish for sale','Golden Tiger fish for sale',1,2,1,3000,'N','PENDING','2017-10-01 15:38:07'),
(10,'White Tiger shark for sale','White Tiger shark for sale',1,2,1,3000,'Y','APPROVED','2017-10-07 22:13:49'),
(11,'Fish posted on 28 october','Fish posted on 28 october',1,2,1,300,'N','PENDING','2017-10-29 23:44:34'),
(12,'product fish added on 29 ht oct','product fish added on 29 ht oct',1,2,1,200,'N','PENDING','2017-10-30 00:18:59'),
(13,'test tiger fish added for sale','test tiger fish added for sale',1,2,1,100,'Y','APPROVED','2017-10-30 00:23:01'),
(14,'test new fish on fish auction 30 oct 2017','test new fish on fish auction 30 oct 2017',1,2,1,200,'Y','APPROVED','2017-10-30 10:22:47'),
(15,'test product auction on 31 st oct','test product auction on 31 st oct',1,2,1,200,'N','PENDING','2017-10-31 04:19:16'),
(16,'test new fish entry on fish auction 31 oct 2017','test new fish entry on fish auction 31 oct 2017',1,2,1,200,'N','PENDING','2017-10-31 04:36:50'),
(17,'first week fish auction 31 oct 2017','first week fish auction 31 oct 2017',1,2,1,200,'N','PENDING','2017-10-31 04:41:10'),
(18,'first week auction on oct 2017','first week auction on oct 2017',1,2,1,2000,'N','PENDING','2017-10-31 04:47:25'),
(19,'Test Fishing product-1','Test Fishing product-1',1,2,1,200,'N','PENDING','2017-10-31 04:57:13'),
(20,'Test Fishing product-2','Test Fishing product-2',1,2,1,2000,'N','PENDING','2017-10-31 05:00:52'),
(21,'Test Fishing product -1 ','Test Fishing product -1 ',1,2,1,200,'N','PENDING','2017-11-02 00:47:51'),
(22,'Tiget fishing Fish on 15 th Nov 2017 ','Tiget fishing Fish on 15 th Nov 2017',1,2,1,200,'Y','APPROVED','2017-11-05 08:48:13');

/*Table structure for table `ad_type_master` */

DROP TABLE IF EXISTS `ad_type_master`;

CREATE TABLE `ad_type_master` (
  `AD_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AD_TYPE_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`AD_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ad_type_master` */

insert  into `ad_type_master`(`AD_TYPE_ID`,`AD_TYPE_NAME`) values 
(1,'AUCTION');

/*Table structure for table `auction_reg_user` */

DROP TABLE IF EXISTS `auction_reg_user`;

CREATE TABLE `auction_reg_user` (
  `auction_reg_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `auction_id` bigint(15) NOT NULL,
  `user_id` bigint(15) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`auction_reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auction_reg_user` */

/*Table structure for table `category_master` */

DROP TABLE IF EXISTS `category_master`;

CREATE TABLE `category_master` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `active` varchar(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `category_master` */

insert  into `category_master`(`category_id`,`category_name`,`active`,`created_date`) values 
(1,'PETS','Y','2017-08-24 14:53:00');

/*Table structure for table `city_master` */

DROP TABLE IF EXISTS `city_master`;

CREATE TABLE `city_master` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `active` varchar(1) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `city_master` */

/*Table structure for table `sub_catagory` */

DROP TABLE IF EXISTS `sub_catagory`;

CREATE TABLE `sub_catagory` (
  `sub_catagory_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_catagory_name` varchar(45) NOT NULL,
  `sub_cat_parent_id` int(11) NOT NULL COMMENT 'parent of the sub category , which is from same sub cat table  - >  0 if  this is parent',
  `catagory_id` int(11) NOT NULL COMMENT 'fk from category master table',
  `active` varchar(1) NOT NULL COMMENT 'Y / N',
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`sub_catagory_id`),
  UNIQUE KEY `sub_catagory_name_UNIQUE` (`sub_catagory_name`),
  KEY `fk_catagory_id_idx` (`catagory_id`),
  CONSTRAINT `fk_catagory_id` FOREIGN KEY (`catagory_id`) REFERENCES `category_master` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sub_catagory` */

insert  into `sub_catagory`(`sub_catagory_id`,`sub_catagory_name`,`sub_cat_parent_id`,`catagory_id`,`active`,`created_date`) values 
(1,'FISH',0,1,'Y','2017-08-24 14:57:27');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` bigint(10) DEFAULT NULL,
  `user_type_id` int(11) NOT NULL,
  `active` varchar(1) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`user_name`),
  KEY `fk_user_type_id_idx` (`user_type_id`),
  CONSTRAINT `fk_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type_master` (`user_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`password`,`user_email`,`user_phone`,`user_type_id`,`active`,`created_date`) values 
(1,'saibaba','saibaba','saibaba@email.com',9952152965,1,'Y','2017-07-16 09:57:32'),
(2,'test','test','user@mail.com',123456,1,'Y','2017-09-12 09:49:34'),
(3,'testuse1','testuse1','testuse1@gmail.com',123456,1,'Y','2017-09-16 10:22:47'),
(4,'vidhya','abc123','vidhya.vida@gmail.com',9952152965,2,'Y','2017-09-30 13:12:24'),
(5,'vidhya1','123abc','vidhya1@gmail.com',333333333,1,'Y','2017-09-30 13:26:00');

/*Table structure for table `user_profile` */

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `profile_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(200) NOT NULL,
  `profile_address` varchar(500) DEFAULT NULL,
  `contact_phone` bigint(10) DEFAULT NULL,
  `user_id` bigint(10) NOT NULL,
  `created_date` datetime NOT NULL,
  `city` int(11) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_profile` */

/*Table structure for table `user_type_master` */

DROP TABLE IF EXISTS `user_type_master`;

CREATE TABLE `user_type_master` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) NOT NULL COMMENT 'M-Merchant /N-Induvidual / A- Admin / P- Premium Individual / PM - Premium Merchant',
  `active` varchar(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_type_id`),
  UNIQUE KEY `user_type_UNIQUE` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user_type_master` */

insert  into `user_type_master`(`user_type_id`,`user_type`,`active`,`created_date`,`updated_date`) values 
(1,'N','Y','2017-07-16 08:07:21',NULL),
(2,'A','Y','2017-10-01 13:55:18','2017-10-01 13:55:18');

/*Table structure for table `weekend_auction_ad_map` */

DROP TABLE IF EXISTS `weekend_auction_ad_map`;

CREATE TABLE `weekend_auction_ad_map` (
  `auction_ad_map_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `auction_id` bigint(15) NOT NULL,
  `ad_id` bigint(15) NOT NULL,
  `active` varchar(1) NOT NULL,
  `created_date` varchar(45) NOT NULL,
  PRIMARY KEY (`auction_ad_map_id`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `weekend_auction_ad_map` */

insert  into `weekend_auction_ad_map`(`auction_ad_map_id`,`auction_id`,`ad_id`,`active`,`created_date`) values 
(1,1,1,'Y','2017-08-31 00:51:20.29'),
(2,1,10,'Y','2017-10-07 22:21:13'),
(3,1,0,'Y','2017-10-29 23:44:35.559'),
(4,1,12,'Y','2017-10-30 00:19:00.163'),
(5,1,13,'Y','2017-10-30 00:23:01.451'),
(6,1,14,'Y','2017-10-30 10:22:48.182'),
(7,1,21,'Y','2017-11-02 00:49:44.457'),
(8,1,22,'Y','2017-11-05 08:55:15.79');

/*Table structure for table `weekend_auction_bid` */

DROP TABLE IF EXISTS `weekend_auction_bid`;

CREATE TABLE `weekend_auction_bid` (
  `bid_id` bigint(15) NOT NULL AUTO_INCREMENT,
  `auction_ad_id` bigint(15) NOT NULL,
  `bid_amount` double NOT NULL,
  `bid_user_id` bigint(15) NOT NULL,
  `bid_status` varchar(45) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`bid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `weekend_auction_bid` */

insert  into `weekend_auction_bid`(`bid_id`,`auction_ad_id`,`bid_amount`,`bid_user_id`,`bid_status`,`created_date`) values 
(1,1,200,1,'BIDDED','2017-09-26 16:49:30'),
(2,1,200,1,'BIDDED','2017-09-29 09:18:37'),
(3,1,210,1,'BIDDED','2017-09-29 09:48:04'),
(4,1,215,1,'BIDDED','2017-09-29 09:48:54'),
(5,1,300,2,'BIDDED','2017-10-07 22:10:07'),
(6,1,300,2,'BIDDED','2017-10-07 22:23:48'),
(7,2,3001,4,'BIDDED','2017-10-07 22:24:02'),
(8,1,301,4,'BIDDED','2017-10-07 22:27:39'),
(9,1,7000,4,'BIDDED','2017-10-07 22:27:56');

/*Table structure for table `weekend_auction_master` */

DROP TABLE IF EXISTS `weekend_auction_master`;

CREATE TABLE `weekend_auction_master` (
  `auction_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auction_name` varchar(200) NOT NULL,
  `auction_descr` varchar(500) DEFAULT NULL,
  `auction_st` datetime NOT NULL,
  `auction_end` datetime NOT NULL,
  `active` varchar(1) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`auction_id`),
  UNIQUE KEY `auction_name_UNIQUE` (`auction_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `weekend_auction_master` */

insert  into `weekend_auction_master`(`auction_id`,`auction_name`,`auction_descr`,`auction_st`,`auction_end`,`active`,`created_date`) values 
(1,'Test Auction','Test','2017-11-05 10:03:14','2017-11-05 10:03:14','Y','2017-08-26 15:56:43'),
(2,'Test Auction_1','Test_1','2017-08-26 15:57:44','2017-08-26 15:57:44','N','2017-08-26 15:57:44'),
(4,'Pooja Holiday Auction','Pooja Holiday Auction','2017-11-03 13:00:00','2017-11-03 17:00:00','N','2017-10-02 13:42:07'),
(5,'Pooja Holiday Auction -2017','Pooja Holiday Auction -2017','2017-10-03 13:00:00','2017-10-03 17:00:00','N','2017-10-02 13:47:28');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
