/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 5.5.62 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `admin_table` */

DROP TABLE IF EXISTS `admin_table`;

CREATE TABLE `admin_table` (
  `a_id` int(2) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobileno` decimal(10,0) NOT NULL,
  `password` varchar(30) NOT NULL,
  `confirmpassword` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `isActive` int(1) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin_table` */

insert  into `admin_table`(`a_id`,`firstname`,`lastname`,`photo`,`address`,`mobileno`,`password`,`confirmpassword`,`email`,`isActive`) values 
(1,'Krishna','Makwana','IMG_20190727_231318_337.jpg','Baherampura, Ahmedabad',9106673798,'Qwe09qWe87qwE654','Qwe09qWe87qwE654','krishnarmakwana7312@gmail.com',1);

/*Table structure for table `area_table` */

DROP TABLE IF EXISTS `area_table`;

CREATE TABLE `area_table` (
  `area_id` int(3) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(30) NOT NULL,
  `city_id` int(3) NOT NULL,
  `state_id` int(3) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`area_id`),
  KEY `city_id` (`city_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `area_table_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city_table` (`city_id`),
  CONSTRAINT `area_table_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `state_table` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `area_table` */

insert  into `area_table`(`area_id`,`area_name`,`city_id`,`state_id`,`isActive`) values 
(2,'Baherampura',5,3,1),
(3,'Anjali',4,2,1),
(4,'Chandkheda',4,2,1),
(5,'Manek baug',4,2,1),
(6,'Maninagar',4,2,1),
(7,'Kalupur',4,2,1);

/*Table structure for table `cart_table` */

DROP TABLE IF EXISTS `cart_table`;

CREATE TABLE `cart_table` (
  `cart_id` int(3) NOT NULL AUTO_INCREMENT,
  `productid` int(3) NOT NULL,
  `qty` int(3) NOT NULL,
  `email` varchar(256) NOT NULL,
  `user_id` int(3) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `productid` (`productid`),
  KEY `user_id` (`email`),
  KEY `user_id_2` (`user_id`),
  CONSTRAINT `cart_table_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product_table` (`productid`),
  CONSTRAINT `cart_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `cart_table` */

insert  into `cart_table`(`cart_id`,`productid`,`qty`,`email`,`user_id`,`isActive`,`doi`,`dou`) values 
(19,106,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(20,106,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(21,110,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16');

/*Table structure for table `city_table` */

DROP TABLE IF EXISTS `city_table`;

CREATE TABLE `city_table` (
  `city_id` int(3) NOT NULL AUTO_INCREMENT,
  `state_id` int(3) NOT NULL,
  `city_name` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `city_table_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state_table` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `city_table` */

insert  into `city_table`(`city_id`,`state_id`,`city_name`,`isActive`) values 
(4,2,'Ahmedabad',1),
(5,2,'Amareli',1);

/*Table structure for table `contactus_table` */

DROP TABLE IF EXISTS `contactus_table`;

CREATE TABLE `contactus_table` (
  `contact_us_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `message` varchar(500) NOT NULL,
  `is_Active` int(1) DEFAULT NULL,
  `doi` datetime DEFAULT NULL,
  `dou` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contactus_table` */

/*Table structure for table `custom_list_table` */

DROP TABLE IF EXISTS `custom_list_table`;

CREATE TABLE `custom_list_table` (
  `list_id` int(3) NOT NULL AUTO_INCREMENT,
  `customizeprodid` int(3) NOT NULL,
  `qty` int(2) NOT NULL,
  `email` varchar(256) NOT NULL,
  `user_id` int(3) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  PRIMARY KEY (`list_id`),
  KEY `customizeprodid` (`customizeprodid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `custom_list_table_ibfk_1` FOREIGN KEY (`customizeprodid`) REFERENCES `customizeproduct_table` (`customizeprodid`),
  CONSTRAINT `custom_list_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `custom_list_table` */

insert  into `custom_list_table`(`list_id`,`customizeprodid`,`qty`,`email`,`user_id`,`isActive`,`doi`,`dou`) values 
(7,2,2,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(8,3,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(9,4,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(10,6,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(11,8,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(12,10,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(13,2,2,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(19,2,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(20,4,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(21,6,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(22,8,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16'),
(23,10,1,'krishnarmakwana7312@gmail.com',5,0,'2020-08-16','2020-08-16');

/*Table structure for table `custom_op_status` */

DROP TABLE IF EXISTS `custom_op_status`;

CREATE TABLE `custom_op_status` (
  `status_id` int(3) NOT NULL AUTO_INCREMENT,
  `cust_op_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `customizeprodid` int(3) NOT NULL,
  `status` varchar(60) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `cust_op_id` (`cust_op_id`),
  KEY `customizeprodid` (`customizeprodid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `custom_op_status_ibfk_1` FOREIGN KEY (`cust_op_id`) REFERENCES `custom_op_table` (`cust_op_id`),
  CONSTRAINT `custom_op_status_ibfk_2` FOREIGN KEY (`customizeprodid`) REFERENCES `customizeproduct_table` (`customizeprodid`),
  CONSTRAINT `custom_op_status_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `custom_op_status` */

/*Table structure for table `custom_op_table` */

DROP TABLE IF EXISTS `custom_op_table`;

CREATE TABLE `custom_op_table` (
  `cust_op_id` int(3) NOT NULL AUTO_INCREMENT,
  `custom_order_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `pcname` varchar(30) NOT NULL,
  `customizeprodid` int(3) NOT NULL,
  `userorderid` varchar(10) NOT NULL,
  `orderplacedate` date DEFAULT NULL,
  `price` float NOT NULL,
  `paymenttype` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`cust_op_id`),
  KEY `custom_order_id` (`custom_order_id`),
  KEY `user_id` (`user_id`),
  KEY `customizeprodid` (`customizeprodid`),
  CONSTRAINT `custom_op_table_ibfk_4` FOREIGN KEY (`custom_order_id`) REFERENCES `customize_order_table` (`custom_order_id`),
  CONSTRAINT `custom_op_table_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `custom_op_table_ibfk_6` FOREIGN KEY (`customizeprodid`) REFERENCES `customizeproduct_table` (`customizeprodid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `custom_op_table` */

insert  into `custom_op_table`(`cust_op_id`,`custom_order_id`,`user_id`,`pcname`,`customizeprodid`,`userorderid`,`orderplacedate`,`price`,`paymenttype`,`isActive`) values 
(1,17,5,'My PC',10,'ISWHPW','2020-08-16',62500,'Cash On Delivery',0);

/*Table structure for table `customcancelorder_table` */

DROP TABLE IF EXISTS `customcancelorder_table`;

CREATE TABLE `customcancelorder_table` (
  `custcancelorder_id` int(3) NOT NULL AUTO_INCREMENT,
  `cust_op_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `customizeprodid` int(3) NOT NULL,
  `userorderid` varchar(10) NOT NULL,
  `pcname` varchar(30) NOT NULL,
  `reason` varchar(30) NOT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`custcancelorder_id`),
  KEY `cust_op_id` (`cust_op_id`),
  KEY `user_id` (`user_id`),
  KEY `customizeprodid` (`customizeprodid`),
  CONSTRAINT `customcancelorder_table_ibfk_1` FOREIGN KEY (`cust_op_id`) REFERENCES `custom_op_table` (`cust_op_id`),
  CONSTRAINT `customcancelorder_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `customcancelorder_table_ibfk_3` FOREIGN KEY (`customizeprodid`) REFERENCES `customizeproduct_table` (`customizeprodid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `customcancelorder_table` */

insert  into `customcancelorder_table`(`custcancelorder_id`,`cust_op_id`,`user_id`,`customizeprodid`,`userorderid`,`pcname`,`reason`,`doi`,`dou`,`isActive`) values 
(1,1,5,10,'ISWHPW','My PC','Price is too high','2020-08-16','2020-08-16',1);

/*Table structure for table `customize_order_table` */

DROP TABLE IF EXISTS `customize_order_table`;

CREATE TABLE `customize_order_table` (
  `custom_order_id` int(3) NOT NULL AUTO_INCREMENT,
  `list_id` int(3) NOT NULL,
  `customizeprodid` int(3) NOT NULL,
  `pcname` varchar(30) NOT NULL,
  `custprodprice` float NOT NULL,
  `custproqty` int(2) NOT NULL,
  `total_amt` float NOT NULL,
  `book_date` date NOT NULL,
  `user_id` int(3) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `address` varchar(200) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  PRIMARY KEY (`custom_order_id`),
  KEY `list_id` (`list_id`),
  KEY `customizeprodid` (`customizeprodid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customize_order_table_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `custom_list_table` (`list_id`),
  CONSTRAINT `customize_order_table_ibfk_2` FOREIGN KEY (`customizeprodid`) REFERENCES `customizeproduct_table` (`customizeprodid`),
  CONSTRAINT `customize_order_table_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `customize_order_table` */

insert  into `customize_order_table`(`custom_order_id`,`list_id`,`customizeprodid`,`pcname`,`custprodprice`,`custproqty`,`total_amt`,`book_date`,`user_id`,`user_name`,`email`,`mobile_no`,`address`,`isActive`,`doi`,`dou`) values 
(13,19,2,'My PC',27000,1,62500,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16'),
(14,20,4,'My PC',9000,1,62500,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16'),
(15,21,6,'My PC',5100,1,62500,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16'),
(16,22,8,'My PC',5700,1,62500,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16'),
(17,23,10,'My PC',15700,1,62500,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16');

/*Table structure for table `customizecategory_table` */

DROP TABLE IF EXISTS `customizecategory_table`;

CREATE TABLE `customizecategory_table` (
  `custmaincatid` int(3) NOT NULL AUTO_INCREMENT,
  `custcatname` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`custmaincatid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `customizecategory_table` */

insert  into `customizecategory_table`(`custmaincatid`,`custcatname`,`isActive`) values 
(1,'Processor',1),
(2,'MotherBoard',1),
(3,'RAM',1),
(4,'Storage',1),
(5,'Graphics Card',1),
(6,'Case',1);

/*Table structure for table `customizeproduct_table` */

DROP TABLE IF EXISTS `customizeproduct_table`;

CREATE TABLE `customizeproduct_table` (
  `customizeprodid` int(3) NOT NULL AUTO_INCREMENT,
  `custmaincatid` int(3) NOT NULL,
  `customizeprodname` varchar(30) NOT NULL,
  `custprodphoto1` varchar(150) NOT NULL,
  `custprodphoto2` varchar(150) DEFAULT NULL,
  `custprodphoto3` varchar(150) DEFAULT NULL,
  `custprodphoto4` varchar(150) DEFAULT NULL,
  `custprodprice` float NOT NULL,
  `custprodqty` int(3) NOT NULL,
  `custprodspecification` varchar(200) NOT NULL,
  `custproddescription` varchar(2500) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`customizeprodid`),
  KEY `custmaincatid` (`custmaincatid`),
  CONSTRAINT `customizeproduct_table_ibfk_1` FOREIGN KEY (`custmaincatid`) REFERENCES `customizecategory_table` (`custmaincatid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `customizeproduct_table` */

insert  into `customizeproduct_table`(`customizeprodid`,`custmaincatid`,`customizeprodname`,`custprodphoto1`,`custprodphoto2`,`custprodphoto3`,`custprodphoto4`,`custprodprice`,`custprodqty`,`custprodspecification`,`custproddescription`,`isActive`) values 
(2,1,'Intel Core i5-9400FF','0070110_0.jpeg','Screenshot (119).png','Screenshot (120).png','Screenshot (121).png',27000,10,'Intel Core i5-9400F 2.9GHz 4.1GHz Turbo CPU','Introducing the NEW 9th Gen Intel® Core? desktop processors - the most powerful generation of Intel® Core? desktop processors. Whether you are a gamer looking for a fantastic in-game experience with the performance headroom for smooth live streaming and seamless highlights recording or you are a creator that is ready to do more creating and sharing, less time waiting, this new generation of processors is ready to take you to that new level.NOTE: This product does not have integrated graphics processors. Dedicated graphics card is needed for display.',1),
(3,1,'Intel Core i7-9700K','0057925_0.jpeg','Screenshot (115).png','Screenshot (116).png','Screenshot (118).png',49000,10,'3.6Ghz 9th Gen CPU','Introducing the unlocked 9th Gen Intel Core i7 desktop processor, the best in class of Intel\'s most powerful family of mainstream Intel Core desktop processors.',1),
(4,2,'MSI H310M PRO-M2 PLUS mATX','0066941_0.jpeg','0066943_0.jpeg','0066945_0.jpeg','Screenshot (122).png',9000,10,'8th Gen Intel Core/ Pentium gold/ Celeron Processors for LGA 1151 socket','Supports 8th Gen Intel Core/ Pentium gold/ Celeron Processors for LGA 1151 socket\r\nSupports DDR4 Memory, up to 2666MHz\r\nDDR4 Boost: advanced technology to deliver pure data signals for the best gaming performance and stability\r\nAudio Boost: reward your ears with studio grade sound quality\r\nM.2 and NVMe support, up to 20 GB/s Using PCI-Express Gen2 x4',1),
(5,2,'Gigabyte B365M GAMING HD mATX','0068846_0.jpeg','Screenshot (124).png','Screenshot (125).png','Screenshot (126).png',12000,10,'Intel B365 Gaming motherboard','Intel B365 Gaming motherboard with GIGABYTE 8118 Gaming LAN, PCIe Gen3 x4 M.2, Anti-Sulfur Resistor, Smart Fan 5, CEC 2019 ready, Supports 9th and 8th Gen Intel Core Processors, New Hybrid Digital PWM Design, High Quality Audio Capacitors and Audio Noise Guard with LED Trace Path Lighting, Ultra Durable 15KV Surge LAN Protection, Intel® Optane Memory Ready',1),
(6,3,'Gigabyte C16 Desktop RAM','0074255_0.jpeg','0074257_0.jpeg','0074259_0.jpeg','Screenshot (129).png',5100,10,'8GB (1x8GB) DDR4 2666MHz','Memory Size: 8GB, Frequency:DDR4-2666 MHz, Timing:16-16-16-35, Voltage:1.2V, 100% Sorted & Tested, High efficient classic black heat spreaders, Profile: XMP 2.0, User friendly design, Comply with industrial standard JEDEC DDR4\r\n8GB 2666MHz Heatsinks',1),
(7,3,'Kingston HyperX Fury RGB ','0075274_0.jpeg','Screenshot (130).png','Screenshot (131).png','Screenshot (133).png',7200,10,'8GB (1x8GB) 3000Mhz DDR4 RAM','HyperX HX430C15FB3A/8 is a 1G x 64-bit (8GB) DDR4-3000 CL15 SDRAM (Synchronous DRAM) 1Rx8, memory module, based on eight 1G x 8-bit FBGA components per module.\r\n3000Mhz DDR4 RAM 8GB',1),
(8,4,'Gigabyte 120GB 2.5\" SSD','0067808_0.jpeg','0067810_0.jpeg','0067811_0.jpeg','Screenshot (127).png',5700,10,'2.5-inch internal SSD','Form Factor: 2.5-inch internal SSD, Interface: SATA 6.0Gb/s, Total Capacity: 120GB, Warranty: Limited 3-years, Sequential Read speed : up to 500 MB/s, Sequential Write speed : up to 380 MB/s, TRIM & S.M.A.R.T supported\r\n120GB Shock resistant SATA 6.0Gb/s\r\n',1),
(9,4,'Western Digital Caviar Blue ','0052005_0.jpeg','0026452_0.jpeg','0026451_0.jpeg','Screenshot (128).png',5170,10,'1TB 3.5\" Internal Hard Drive - WD10EZEX','1TB HDD 3.5\" Reliable',1),
(10,5,'Gigabyte Radeon RX 570','0063528_0.jpeg','0071130_0.jpeg','0071133_0.jpeg','Screenshot (137).png',15700,10,'Gaming 4GB Graphics Card (Rev 2.0)','Powered by Radeon ? RX 570\r\nWINDFORCE 2X with 90mm Blade Fan Design\r\nUltra Durable Materials\r\nIntuitive AORUS Engine\r\nOC mode: up to 1255 MHz, Gaming mode: up to 1244 MHz',1),
(11,5,'Gigabyte GeForce GTX 1650','0062716_0.jpeg','0062718_0.jpeg','0062720_0.jpeg','Screenshot (136).png',21000,10,'GTX 1650 MINI ITX OC 4G Graphics Card','GIGABYTE GV-N1650IXOC-4GD graphics card integrated with 4GB GDDR5 128bit memory interface & 80mm unique blade fan.\r\n4GB GDDR5 128-bit Compact GTX 1650\r\n',1),
(12,6,'Gigabyte C200 RGB','0069429_0.jpeg','0069425_0.jpeg','0069428_0.jpeg','Screenshot (134).png',7099,10,'Tempered Glass Mid-Tower ATX Case','Stylish RGB Light on Black Tempered Glass Front panel\r\nWith RGB LED Switch and 2 USB 3.0 on I/O Panel\r\nFull-Size Black Tempered Glass Side Panel\r\nPSU Shroud Design\r\nDetachable Dust Filter\r\nLiquid Cooling Compatible\r\nMid-Tower RGB Tempered Glass',1),
(13,6,'Cooler Master MasterBox','0053782_0.jpeg','0053784_0.jpeg','0053785_0.jpeg','Screenshot (135).png',5300,10,'MasterBox Lite 3 Windows mATX Case\r\n','COOLER MASTER MASTERBOX LITE 3 mATX WINDOW\r\nLite 3 Windows mATX\r\n',1);

/*Table structure for table `dealer_register_table` */

DROP TABLE IF EXISTS `dealer_register_table`;

CREATE TABLE `dealer_register_table` (
  `dealerid` int(3) NOT NULL AUTO_INCREMENT,
  `dealernm` varchar(30) NOT NULL,
  `mail` varchar(256) NOT NULL,
  `contactno` decimal(10,0) NOT NULL,
  `address` varchar(200) NOT NULL,
  `password` varchar(20) NOT NULL,
  `confimpassword` varchar(20) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`dealerid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `dealer_register_table` */

insert  into `dealer_register_table`(`dealerid`,`dealernm`,`mail`,`contactno`,`address`,`password`,`confimpassword`,`photo`,`isActive`) values 
(4,'Bhumi Makwana','makwanabhumir@gmail.com',9924013397,'Maninagar, Ahmedabad','WIXDOAQ','WIXDOAQ','IMG_20191029_165436.jpg',1);

/*Table structure for table `dealerstock_table` */

DROP TABLE IF EXISTS `dealerstock_table`;

CREATE TABLE `dealerstock_table` (
  `ds_id` int(2) NOT NULL AUTO_INCREMENT,
  `dealer_id` int(3) NOT NULL,
  `product_id` int(3) NOT NULL,
  `dealer_nm` varchar(30) NOT NULL,
  `dealer_mail` varchar(256) NOT NULL,
  `dealer_contact_no` decimal(10,0) DEFAULT NULL,
  `stock_qty` int(3) DEFAULT NULL,
  `is_Active` int(2) DEFAULT NULL,
  PRIMARY KEY (`ds_id`),
  KEY `dealer_id` (`dealer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `dealerstock_table_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `dealer_register_table` (`dealerid`),
  CONSTRAINT `dealerstock_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `dealerstock_table` */

insert  into `dealerstock_table`(`ds_id`,`dealer_id`,`product_id`,`dealer_nm`,`dealer_mail`,`dealer_contact_no`,`stock_qty`,`is_Active`) values 
(1,4,18,'Bhumi Makwana','makwanabhumir@gmail.com',9924013397,4,0),
(3,4,17,'Bhumi Makwana','makwanabhumir@gmail.com',9924013397,5,1);

/*Table structure for table `feedback_table` */

DROP TABLE IF EXISTS `feedback_table`;

CREATE TABLE `feedback_table` (
  `feedback_id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `satisfaction` varchar(30) NOT NULL,
  `topic` varchar(90) NOT NULL,
  `message` varchar(300) NOT NULL,
  `is_Active` int(1) NOT NULL,
  `doi` datetime DEFAULT NULL,
  `dou` datetime DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  UNIQUE KEY `UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback_table` */

/*Table structure for table `maincategory_table` */

DROP TABLE IF EXISTS `maincategory_table`;

CREATE TABLE `maincategory_table` (
  `maincatid` int(3) NOT NULL AUTO_INCREMENT,
  `maincatname` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`maincatid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `maincategory_table` */

insert  into `maincategory_table`(`maincatid`,`maincatname`,`isActive`) values 
(1,'Laptop',1),
(2,'Keyboard & Mouse',1),
(3,'Mouse',0),
(4,'CCTV_Camera',1),
(5,'Printer',1),
(6,'Keyboard-Mouse Combo',0),
(7,'Accessories',1);

/*Table structure for table `notification_table` */

DROP TABLE IF EXISTS `notification_table`;

CREATE TABLE `notification_table` (
  `not_id` varchar(2) NOT NULL,
  `not_description` varchar(100) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  `date1` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification_table` */

insert  into `notification_table`(`not_id`,`not_description`,`isActive`,`date1`) values 
('1','Order - \nYou have an order',0,'2020-08-16'),
('1','Order - \nYou have an order',0,'2020-08-16'),
('4','Cancel Order - \nOrder I\'d AB4K0Cis cancelled',0,'2020-08-16'),
('1','Order - \nYou have an order',0,'2020-08-16'),
('4','Cancel Order - \nOrder I\'d UHSPBDis cancelled',0,'2020-08-16'),
('4','Cancel Order - \nOrder I\'d P5OPE0is cancelled',0,'2020-08-16'),
('1','Order - \nYou have an order',0,'2020-08-16'),
('1','Order - \nYou have an order',0,'2020-08-16'),
('4','Cancel Order - \nOrder I\'d CAR8VFis cancelled',0,'2020-08-16'),
('4','Cancel Order - \nOrder I\'d CAR8VFis cancelled',0,'2020-08-16'),
('1','Order - \nYou have an order',0,'2020-08-16'),
('3','Customize Order - \nYou have customize PC order',0,'2020-08-16'),
('6','Customize Cancel Order - \nOrder I\'d ISWHPW is cancelled',0,'2020-08-16');

/*Table structure for table `op_table` */

DROP TABLE IF EXISTS `op_table`;

CREATE TABLE `op_table` (
  `op_id` int(3) NOT NULL AUTO_INCREMENT,
  `order_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `productid` int(3) NOT NULL,
  `userorder_id` varchar(10) DEFAULT NULL,
  `orderplacedate` date NOT NULL,
  `qty` int(3) NOT NULL,
  `productprice` float NOT NULL,
  `totalamt` float NOT NULL,
  `paymenttype` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`op_id`),
  KEY `user_id` (`user_id`),
  KEY `productid` (`productid`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `op_table_ibfk_4` FOREIGN KEY (`productid`) REFERENCES `product_table` (`productid`),
  CONSTRAINT `op_table_ibfk_5` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`),
  CONSTRAINT `op_table_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `op_table` */

insert  into `op_table`(`op_id`,`order_id`,`user_id`,`productid`,`userorder_id`,`orderplacedate`,`qty`,`productprice`,`totalamt`,`paymenttype`,`isActive`) values 
(19,19,5,106,'CAR8VF','2020-08-16',1,1465,1465,'Cash On Delivery',0),
(20,20,5,106,'55T5TE','2020-08-16',1,1465,1465,'Cash On Delivery',1),
(21,21,5,110,'2X4816','2020-08-16',1,12000,12000,'Cash On Delivery',1);

/*Table structure for table `opstatus_table` */

DROP TABLE IF EXISTS `opstatus_table`;

CREATE TABLE `opstatus_table` (
  `status_id` int(3) NOT NULL AUTO_INCREMENT,
  `op_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `product_id` int(3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `op_id` (`op_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `opstatus_table_ibfk_1` FOREIGN KEY (`op_id`) REFERENCES `op_table` (`op_id`),
  CONSTRAINT `opstatus_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `opstatus_table_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `opstatus_table` */

insert  into `opstatus_table`(`status_id`,`op_id`,`user_id`,`product_id`,`status`,`isActive`) values 
(2,20,5,106,'Delivered',1),
(3,21,5,110,'Shipped',1);

/*Table structure for table `order_table` */

DROP TABLE IF EXISTS `order_table`;

CREATE TABLE `order_table` (
  `order_id` int(3) NOT NULL AUTO_INCREMENT,
  `cart_id` int(3) NOT NULL,
  `productid` int(3) NOT NULL,
  `productprice` float NOT NULL,
  `proqty` int(2) NOT NULL,
  `totalamt` float DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `user_id` int(3) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `address` varchar(200) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `productid` (`productid`),
  KEY `cart_id` (`cart_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `order_table_ibfk_4` FOREIGN KEY (`productid`) REFERENCES `product_table` (`productid`),
  CONSTRAINT `order_table_ibfk_5` FOREIGN KEY (`cart_id`) REFERENCES `cart_table` (`cart_id`),
  CONSTRAINT `order_table_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `order_table` */

insert  into `order_table`(`order_id`,`cart_id`,`productid`,`productprice`,`proqty`,`totalamt`,`book_date`,`user_id`,`user_name`,`email`,`mobile_no`,`address`,`isActive`,`doi`,`dou`) values 
(19,19,106,1465,1,1465,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16'),
(20,20,106,1465,1,1465,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16'),
(21,21,110,12000,1,12000,'2020-08-16',5,'Krishna Makwana','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',0,'2020-08-16','2020-08-16');

/*Table structure for table `ordercancel_table` */

DROP TABLE IF EXISTS `ordercancel_table`;

CREATE TABLE `ordercancel_table` (
  `cancelorder_id` int(3) NOT NULL AUTO_INCREMENT,
  `op_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `productid` int(3) DEFAULT NULL,
  `userorderid` varchar(10) NOT NULL,
  `reason` varchar(30) NOT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`cancelorder_id`),
  KEY `op_id` (`op_id`),
  KEY `user_id` (`user_id`),
  KEY `productid` (`productid`),
  CONSTRAINT `ordercancel_table_ibfk_1` FOREIGN KEY (`op_id`) REFERENCES `op_table` (`op_id`),
  CONSTRAINT `ordercancel_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `ordercancel_table_ibfk_3` FOREIGN KEY (`productid`) REFERENCES `product_table` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `ordercancel_table` */

insert  into `ordercancel_table`(`cancelorder_id`,`op_id`,`user_id`,`productid`,`userorderid`,`reason`,`doi`,`dou`,`isActive`) values 
(2,19,5,106,'CAR8VF','Wrong shipping address','2020-08-16','2020-08-16',1);

/*Table structure for table `orp_table` */

DROP TABLE IF EXISTS `orp_table`;

CREATE TABLE `orp_table` (
  `orp_id` int(3) NOT NULL AUTO_INCREMENT,
  `rentorder_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `rentprodid` int(3) NOT NULL,
  `urorder_id` varchar(10) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `price` float NOT NULL,
  `qty` int(3) NOT NULL,
  `duration` int(2) NOT NULL,
  `total` float DEFAULT NULL,
  `paymenttype` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`orp_id`),
  KEY `user_id` (`user_id`),
  KEY `rentprodid` (`rentprodid`),
  KEY `rentorder_id` (`rentorder_id`),
  CONSTRAINT `orp_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `orp_table_ibfk_3` FOREIGN KEY (`rentprodid`) REFERENCES `rentproduct_table` (`rentprodid`),
  CONSTRAINT `orp_table_ibfk_4` FOREIGN KEY (`rentorder_id`) REFERENCES `rentorder_table` (`rentorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orp_table` */

/*Table structure for table `orpstatus_table` */

DROP TABLE IF EXISTS `orpstatus_table`;

CREATE TABLE `orpstatus_table` (
  `status_id` int(3) NOT NULL AUTO_INCREMENT,
  `orp_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `rentprodid` int(3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  KEY `op_id` (`orp_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`rentprodid`),
  CONSTRAINT `orpstatus_table_ibfk_1` FOREIGN KEY (`orp_id`) REFERENCES `orp_table` (`orp_id`),
  CONSTRAINT `orpstatus_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `orpstatus_table_ibfk_3` FOREIGN KEY (`rentprodid`) REFERENCES `rentproduct_table` (`rentprodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orpstatus_table` */

/*Table structure for table `product_table` */

DROP TABLE IF EXISTS `product_table`;

CREATE TABLE `product_table` (
  `productid` int(3) NOT NULL AUTO_INCREMENT,
  `maincatid` int(3) NOT NULL,
  `subcatid` int(3) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `productphoto1` varchar(150) NOT NULL,
  `productphoto2` varchar(150) DEFAULT NULL,
  `productphoto3` varchar(150) DEFAULT NULL,
  `productphoto4` varchar(150) DEFAULT NULL,
  `productprice` float NOT NULL,
  `productqty` int(2) NOT NULL,
  `productspecification` varchar(200) NOT NULL,
  `productdescription` varchar(2500) NOT NULL,
  `processor` varchar(30) DEFAULT NULL,
  `ram` varchar(30) DEFAULT NULL,
  `hdd` varchar(30) DEFAULT NULL,
  `ssd` varchar(30) DEFAULT NULL,
  `graphicscard` varchar(30) DEFAULT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `maincatid` (`maincatid`),
  KEY `subcatid` (`subcatid`),
  CONSTRAINT `product_table_ibfk_1` FOREIGN KEY (`maincatid`) REFERENCES `maincategory_table` (`maincatid`),
  CONSTRAINT `product_table_ibfk_2` FOREIGN KEY (`subcatid`) REFERENCES `subcategory_table` (`subcatid`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

/*Data for the table `product_table` */

insert  into `product_table`(`productid`,`maincatid`,`subcatid`,`productname`,`productphoto1`,`productphoto2`,`productphoto3`,`productphoto4`,`productprice`,`productqty`,`productspecification`,`productdescription`,`processor`,`ram`,`hdd`,`ssd`,`graphicscard`,`isActive`) values 
(17,1,1,'Acer Aspire 3','acer-na-laptop-original-imaf66s7wba7dxvc.jpeg','acer-na-laptop-original-imaf66s72vw3pvet.jpeg','acer-na-laptop-original-imaf66s7cjzgzh4m.jpeg','acer-na-laptop-original-imaf66s7rmdvr7ds.jpeg',29000,0,'i3 7th Gen-(4GB/1TB HDD)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.7 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 12 GB\r\n->Graphic Processor           : Intel Integrated HD620\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 2.0, 1 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : SD Card Reader\r\n->Disk Drive                        : Not Available\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(18,1,1,'Acer Aspire Core 3','acer-na-laptop-original-imaetzpb4ufrbhsz.jpeg','acer-na-laptop-original-imaetp7ybfpn4apd.jpeg','acer-es-15-notebook-original-imaer2fqqtpvmhhz.jpeg','acer-e-15-notebook-original-imaetp7kjj2rxwky.jpeg',45000,10,'i3 6th Gen-(4GB/1TB HDD/2GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->NVIDIA Geforce 940MX for High Graphics Performance\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 6th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Graphic Memory Type     : GDDR5\r\n->Graphic Memory              : 2 GB\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 2.0, 1 x USB Type C\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : SD Card Reader\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ','2 GB',1),
(19,1,2,'Asus VivoBook Gaming','asus-na-gaming-laptop-original-imafnf96vnrexbnd.jpeg','asus-na-gaming-laptop-original-imafngzwzwm2uqyd.jpeg','asus-na-gaming-laptop-original-imafnwejuv39ygyd.jpeg','asus-na-gaming-laptop-original-imafnwejgrcpj6jr.jpeg',80000,10,'i5 9th Gen-(8GB+32GB Optane/512GB SSD/4GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.7 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 12 GB\r\n->Graphic Processor           : Intel Integrated HD 620\r\n->Operating System            : Linux\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB',' ','512 GB SSD','4 GB',1),
(20,1,3,'Dell XPS 13','dell-na-thin-and-light-laptop-original-imaf4gnyuemdhqgy.jpeg','dell-na-thin-and-light-laptop-original-imaf4gnyatqdpwf8.jpeg','dell-na-thin-and-light-laptop-original-imaf4gnymhv2uzhn.jpeg','dell-na-thin-and-light-laptop-original-imaf4gnyujd8kbqb.jpeg',125000,10,'i5 8th Gen-(8GB/256GB SSD/With MS Office) ','Highlights\r\n->Stylish & Portable Thin and Light Laptop\r\n->13 inch Full HD LED Backlit Infinity Edge Anti-glare Display\r\n->Light Laptop without Optical Disk Drive\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR3\r\n->SSD Capacity                   : 256 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System            : Windows 10 Home 64 bit\r\n->USB Port                          : 1 x USB 3.1 Type C, 2 x Thunderbolt 3 with Powershare and DC-in\r\n->Multi Card Slot                 : Micro SD Card Reader\r\n->included Software            : Microsoft Office Home and Student 2016\r\n->Antivirus                           : McAfee LiveSafe (12 Months Subscription)\r\n->Warranty Summary          : 1 Year Limited International Hardware Warranty\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage \r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB',' ','256 GB SSD',' ',1),
(21,1,4,'HP  Pavilion','hp-pavilion-notebook-original-imaer5htmhhgxpaj.jpeg','hp-pavilion-notebook-original-imaenf9sxef9rgge.jpeg','hp-pavilion-notebook-original-imaemb8yxdzgevaf.jpeg','hp-pavilion-notebook-original-imaemb8fhgf8edtf.jpeg',70000,10,'i5 7th Gen-(16 GB/2 TB HDD/4 GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->NVIDIA Geforce 940MX for High Graphics Performance\r\n->15.6 inch HD LED Backlit Widescreen BrightView Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 2 TB\r\n->Clock Speed                     : 2.5 GHz with Turbo Boost Upto 3.1 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 16 GB\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Graphic Memory Type      : DDR3\r\n->Graphic Memory              : 4 GB\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 2.0\r\n->HDMI Port                        : Yes, v1.4\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','16 GB','2 TB HDD',' ','4 GB',1),
(22,1,5,'Lenovo ideapad 330','lenovo-80xh0214in-laptop-original-imaf6zm9sygjhjpw.jpeg','320-15ikb-d-b-ideapad-320-15ikb-d-y-lenovo-original-imaf6zm8z35nzzgy.jpeg','lenovo-ideapad-330-laptop-original-imaf6d3sdrqqaqmb.jpeg','lenovo-80xh0214in-laptop-original-imaf6d3rhecsytua.jpeg',45000,10,'i3 8th Gen-(4 GB/1TB HDD/512MB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->15.6 inch\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.7 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory              : 512 MB\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 2.0, 1 x USB Type C\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : SD Card Reader\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(23,1,1,'Acer Predator Helios 300','Acer1.jpg','Acer2.jpg','71H0JdW3DjL._AC_SL1500_.jpg','6140CZ8FLyL._AC_SL1500_.jpg',165000,10,'i7 9th Gen-(8GB RAM,512GB SSD,6GB Graphic) ','Highlights\r\n->9th Generation Intel Core i7-9750H 6-Core Processor (Up to 4.5GHz)\r\n->NVIDIA GeForce GTX 1660 Ti Graphics with 6GB of dedicated GDDR6 VRAM\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 512GB\r\n->Clock Speed                     : 4.5 GHz\r\n->Graphic Processor           : NVIDIA GeForce GTX 1660Ti\r\n->Graphic Memory Type      : GDDR6 VRAM\r\n->Graphic Memory               : 6 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : No Optical Drive\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3. 1 Gen 1 Ports, 1 x USB 3. 1 Gen 2 Port (with Power-off Charging)\r\n->HDMI Port                        : 1 x HDMI 2.0 Port\r\n->Keyboard                         : 4-Zone RGB Backlit Keyboard\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','8 GB',' ','512 GB SSD','6 GB',1),
(24,1,1,'Acer Aspire 5','acer-na-laptop-original-imaffvzuk5zwsyka.jpeg','acer-na-laptop-original-imaffvnhpsh52hgy.jpeg','acer-na-laptop-original-imaffvzuazxqzevj.jpeg','acer-na-laptop-original-imaffvnzrntzs2jt.jpeg',35000,10,'i3 8th Gen-(4GB/1TB HDD/Windows 10 Home) ','\r\n\r\nHighlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->NVIDIA Geforce 940MX for High Graphics Performance\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.1 GHz with Turbo Boost Upto 3.9 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Graphic Processor           : Intel Integrated HD 620\r\n->Graphic Memory Type      : GDDR5\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 2.0, 1 x USB 3.0, 1 x USB Type C\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(25,1,1,'Acer Swift 3','acer-na-thin-and-light-laptop-original-imafgb6msje4zrh6.jpeg','acer-na-thin-and-light-laptop-original-imafgb6mq2znn9hz.jpeg','acer-na-thin-and-light-laptop-original-imafgb6mafvjmphg.jpeg','acer-na-thin-and-light-laptop-original-imafgb6nn7abjfga.jpeg',55000,10,'i3 8th Gen-(4GB/256GB SSD/Windows 10 Home)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->NVIDIA Geforce 940MX for High Graphics Performance\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->SSD Capacity                   : 256 GB\r\n->Clock Speed                     : 2.2 GHz with Turbo Boost Upto 3.4 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Finger Print Sensor          : Yes\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 2.0, 1 x USB 3.0, 1 x USB Type C\r\n->HDMI Port                         : 1 x HDMI Port\r\n->Multi Card Slot                 : SD Card Reader\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary         : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type    : Onsite\r\n->Covered in Warranty       : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB',' ','256 GB SSD',' ',1),
(26,1,1,'Acer Spin 3','acer-na-2-in-1-laptop-original-imaf2rf65tvqgpce.jpeg','acer-na-2-in-1-laptop-original-imaf2rfametmwhw9.jpeg','acer-na-2-in-1-laptop-original-imaf2re95yewaejq.jpeg','acer-na-2-in-1-laptop-original-imaf2rfgj6gakz2d.jpeg',37000,10,'i3 6th Gen-(4GB/500GB HDD/Windows 10 Home)','Highlights\r\n->Carry It Along 2 in 1 Laptop\r\n->15.6 inch HD LED Backlit Display\r\n->Light Laptop without Optical Disk Drive\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 6th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 500 GB\r\n->Clock Speed                     : 2 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Graphic Processor           : Intel Integrated HD520\r\n->Operating System            : Windows 10 Home 64 bit\r\n->USB Port                          : 2 x USB 2.0, 1 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : 2-in-1 Card Reader (SD, SDXC)\r\n->Pointer Device                 : Multi Gesture Touchpad\r\n->Included Software            : Microsoft Office Home and Student 2016\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : 2 in 1 Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','500 GB HDD',' ',' ',1),
(27,1,2,'Asus ROG Strix G','asus-na-gaming-laptop-original-imafggytk5twybmv.jpeg','asus-na-gaming-laptop-original-imafkgzhtu6gwtgs.jpeg','asus-na-gaming-laptop-original-imafkgzhucxxgdhz.jpeg','asus-na-gaming-laptop-original-imafjtxcjzzgftgn.jpeg',68000,10,'i5 9th Gen-(8GB/1TB HDD/256GB SSD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce GTX 1650 for Desktop Level Performance\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display (With 60 Hz Refresh Rate)\r\n->Light Laptop without Optical Disk Drive\r\n->Pre-installed Genuine Windows 10 OS\r\n\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity          	    : 1 TB\r\n->SSD Capacity                   : 256GB\r\n->Clock Speed                     : 2.4 GHz with Turbo Boost Upto 4.1 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Graphic Processor           : NVIDIA Geforce GTX 1650\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 3 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v2.0)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD','256 GB SSD','4 GB',1),
(28,1,2,'Asus Vivobook Max','asus-a541uv-dm977-a541uv-laptop-original-imaez5bs68fbvanx.jpeg','asus-a541uv-dm977-a541uv-laptop-original-imaez5bs44cffqd2.jpeg','asus-a541uv-dm977-a541uv-laptop-original-imaez5btqyqg4etz.jpeg','asus-a541uv-dm977-a541uv-laptop-original-imaez5azjruvhce7.jpeg',35000,10,'i3 7th Gen-(4GB/1TB HDD/2GB Graphics)','Highlights \r\n->Pre-installed Genuine Windows 10 OS\r\n->NVIDIA Geforce 920MX for High Graphics Performance\r\n->15.6 inch Full HD LED Backlit AntiGlare Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR2\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.40 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 12 GB\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Graphic Memory Type      : DDR3\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 3.1, 1 x USB 3.0, 1 x USB 2.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : 5-in-1 Card Reader\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ','2 GB',1),
(29,1,2,'Asus X540','asus-na-laptop-original-imafj3527b4w79gz.jpeg','asus-na-laptop-original-imafkgzmxymwjh7h.jpeg','asus-na-laptop-original-imafkgzk52bwtghf.jpeg','asus-na-laptop-original-imafkgyjbnzjhmkz.jpeg',32000,10,'i3 8th Gen-(4GB/1TB HDD/Windows 10 Home)\r\n','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->15.6 inch HD LCD Anti-glare Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.2 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory              : 2 GB\r\n->Operating System            : Windows 10 Home 64 bit\r\n->USB Port                          : 2 x USB 2.0, 1 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v1.4)\r\n->Multi Card Slot                 : Micro SD\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(30,1,3,'Dell Inspiron 15','81YA8OyZEaL._SL1500_.jpg','716KlhR8SKL._SL1500_.jpg','81epc87bcEL._SL1500_.jpg','71J9dzmByeL._SL1500_.jpg',39000,10,'i3 7th Gen-(8GB/1TB HDD/Windows 10+MS Office H&S )','Highlights\r\n->Operating System: Pre-loaded Windows 10 with MS Office H&S\r\n->15.6-inch FHD (1920 x 1080) Anti-Glare LED-Backlit\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.30 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 12 GB\r\n->Graphic Processor           : Intel Integrated HD 620\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 2.0, 1 x USB 2.0\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','8 GB','1 TB HDD',' ',' ',1),
(31,1,2,'Asus APU ','asus-na-laptop-original-imaf5h69pz9fexc4.jpeg','asus-na-laptop-original-imaf5h69j7makbzp.jpeg','asus-na-laptop-original-imaf5h695syx9zkg.jpeg','asus-na-laptop-original-imafkgyezfwusrua.jpeg',18000,10,'Dual Core E1-(4GB/500GB HDD/Windows 10 Home) ','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->15.6 inch HD LCD Anti-glare Display\r\n\r\n->Processor Name              : AMD\r\n->Processor Generation      : APU Dual Core E1\r\n->RAM                                 : 4 GB DDR3\r\n->HDD Capacity                  : 500 GB\r\n->Clock Speed                     : 1.3 GHz\r\n->Expandable Memory        : Upto 12 GB\r\n->Graphic Processor           : AMD Radeon R2\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 2.0, 1 x USB 3.0, 1 x USB 3.1 Type C (1st Gen)\r\n->HDMI Port                        : 1 x HDMI Port (v1.4)\r\n->Multi Card Slot                 : SDXC Card Reader\r\n->Disk Drive                        : CD/DVD Writer\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','AMD','4 GB','500 GB HDD',' ',' ',1),
(32,1,3,'Dell 14 Inspiron 43481','dell-na-laptop-original-imafghfndqdm4rjt.jpeg','dell-na-laptop-original-imafnfesazzybgcz.jpeg','dell-na-laptop-original-imafnfesqp3f7mes.jpeg','dell-na-laptop-original-imafnfeshyrb9zhv.jpeg',25500,10,'i3 7th Gen-(4GB/1TB HDD/Linux) ','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->15.6 inch HD LED Backlit TFT Display\r\n\r\n\r\n->Processor Name                    : Core i3\r\n->Processor Generation            : 7th Gen\r\n->RAM                                      : 4 GB DDR4\r\n->HDD Capacity                       : 1 TB\r\n->Clock Speed                          : 2.7 GHz\r\n->Memory Slots                       : 2 Slots\r\n->Expandable Memory            : Upto 12 GB\r\n->Graphic Processor                : Intel Integrated HD 620\r\n->Operating System                : Linux\r\n->RJ45                                     : Yes\r\n->USB Port                               : 1 x USB 2.0, 2 x USB 3.1\r\n->HDMI Port                            : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                     : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary              : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type         : Onsite\r\n->Covered in Warranty            : Manufacturing Defects\r\n->Not Covered in Warranty     : Physical Damage\r\n->Domestic Warranty              : 1 Year\r\n->International Warranty         : 1 Year\r\n->Sales Package                      : Laptop, Battery, Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(55,1,3,'Dell Inspiron 15  ','dell-na-laptop-original-imaf4gnt5qssfcfj.jpeg','dell-na-laptop-original-imaf4gntajxckygf.jpeg','dell-na-laptop-original-imaf4gntytrfuyte.jpeg','dell-na-laptop-original-imaf4gntz5zh3ge2.jpeg',51990,10,'i5 8th Gen-(8GB/2TB HDD/2 GB Graphics) ','Highlights\r\n->15.6 inch Full HD LED Backlit Anti-glare Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : AMD Radeon 530\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : No Optical Drive\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.1, 1 x USB 3.1 Type C (1st Gen)\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','2 TB HDD',' ','2 GB',1),
(56,1,3,'Dell Inspiron 15 7570','dell-na-laptop-original-imafy2gcfhqkvmha.jpeg','dell-na-laptop-original-imafy2gcyf7rafwt.jpeg','dell-na-laptop-original-imafy2gcfhy.jpeg','dell-na-laptop-original-imafy2gc.jpeg',73000,10,'i5 8th Gen-(8GB/1TB HDD/128GB SSD/4GB Graphics) ','Highlights\r\n->NVIDIA Geforce 940MX\r\n->15.6 inch Full HD LED Backlit IPS Display\r\n->Microsoft Office Home and Student 2016\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->SSD Capacity                   : 128 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : No Optical Drive\r\n->HDMI Port                        : 1 x HDMI Port (v2.0)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD','128 GB SSD','4 GB',1),
(57,1,3,'Dell Vostro 3581','dell-na-laptop-original-imafnfeshyhykwwp.jpeg','dell-na-laptop-original-imafnfesmhnrt4mf.jpeg','dell-na-laptop-original-imafnfesxtxef9pc.jpeg','dell-na-laptop-original-imafnfeshfpuas5u.jpeg',28000,10,'i3 7th Gen-(4 GB/1 TB HDD/With MS Office)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Preloaded MS Office Home and Student 2016\r\n->15.6 inch HD LED Backlit Anti-glare Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.3 GHz\r\n->Graphic Processor           : Intel Integrated HD 620\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : Yes\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3 ','4 GB','1 TB HDD',' ',' ',1),
(58,1,3,'Dell Inspiron 5482','dell-na-2-in-1-laptop-original-imafnfeszyzpanuz.jpeg','dell-na-2-in-1-laptop-original-imafnfeseyyyhqza.jpeg','dell-na-2-in-1-laptop-original-imafnfesk9sqhsuf (1).jpeg','dell-na-2-in-1-laptop-original-imafnfeszhxzupx6.jpeg',47000,10,'i3 8th Gen-(8GB/1TB HDD/2GB Graphics) ','Highlights\r\n->2 in 1 Laptop with Microsoft Office Home and Student 2016\r\n->14 inch Full HD LED Backlit IPS Touch Display (Supports Active Pen)\r\n->NVIDIA Geforce for Incredible Performance and Unmatched Efficiency\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.1 GHz with Turbo Boost Upto 3.9 GHz\r\n->Graphic Processor           : NVIDIA Geforce MX130\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.1, 1 x USB 3.1 Type C\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','8 GB','1 TB HDD',' ','2 GB',1),
(59,1,4,'HP 15 15-bs675TX','hp-na-laptop-original-imaf6ek4zmdywudg.jpeg','hp-na-laptop-original-imaf6ek4zhgnwmhq.jpeg','hp-na-laptop-original-imaf6ek4wkezwqgw.jpeg','hp-na-laptop-original-imaf6ek4vshn5tdf.jpeg',32000,10,'i3 7th Gen-(4GB/1TB HDD/2GB Graphics)','Highlights\r\n->15.6 inch HD LED Backlit Widescreen BrightView Display\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.3 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 16 GB\r\n->Graphic Processor           : AMD Radeon 520\r\n->Graphic Memory Type      : GDDR3\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : YES\r\n->RJ45                                 : Yes\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ','2 GB',1),
(60,1,4,'HP Probook 440 G6','hp-probook-440-g6-business-laptop-original-imafzd92pkftxvff.jpeg','hp-probook-440-g6-business-laptop-origin.jpeg','hp-probook-440-g6-business-laptop-original-imafzd92kzktfqkm.jpeg','hp-probook-440-g6-business-laptop-original-imafzd92fsdmhkdq.jpeg',62100,10,'i3 8th Gen-(4GB/1TB HDD/Windows 10 Pro)','Highlights\r\n->14 inch , Business Laptop\r\n->Light Laptop without Optical Disk Drive\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.3 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 16 GB\r\n->Graphic Processor           : Intel Integrated Intel® UHD Graphics 620\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : YES\r\n->RJ45                                 : Yes\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : YES\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(61,1,4,'Hp 15q','hp-na-laptop-original-imaf9zypyntytqex.jpeg','hp-na-laptop-original-imaf9zypsheuqbbv.jpeg','hp-na-laptop-original-imaf9zyphdjtyumz.jpeg','hp-na-laptop-original-imaf9zypp56gppxd.jpeg',31000,10,'i3 7th Gen-(8GB/1TB HDD/DOS)','Highlights\r\n->15.6 inch HD LED Backlit BrightView Display','i3','8 GB','1 TB HDD',' ',' ',1),
(62,1,4,'HP 240 G5','hp-notebook-original-imaerpqafszz63nh.jpeg','hp-notebook-original-imaerpqnq3ych4bu.jpeg','hp-notebook-original-imaerpqp75jccynt.jpeg','hp-notebook-original-imaerpqnq3ych4bu.jpeg',45000,10,'i3 6th Gen-(4GB/500GB HDD)','Highlights\r\n->14 inch HD LED Backlit Display\r\n','i3','4 GB','500 GB HDD',' ',' ',1),
(63,1,5,'Lenovo Ideapad 330-15IKB','lenovo-na-laptop-original-imaf8cjapzwy6xfh.jpeg','lenovo-na-laptop-original-imaf8cjarmqdhmf3.jpeg','lenovo-na-laptop-original-imaf8cjazwafj8gw.jpeg','lenovo-na-laptop-original-imaf8cjaejtuf3cj.jpeg',36000,10,'i3 7th Gen-(4GB/1TB HDD/2GB Graphics)','Highlights\r\n->14 inch HD LED Backlit Display\r\n->Business laptop\r\n\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.3 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 8 GB\r\n->Graphic Processor           : AMD Radeon 530\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 3.0 Type C\r\n->HDMI Port                        : 1 x HDMI Port \r\n->Multi Card Slot                 : 4-in-1 Card Reader (SD, SDHC, SDXC, MMC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ','2 GB',1),
(64,1,5,'Lenovo Ideapad 130-15IKB','lenovo-na-laptop-original-imafjyfzyzy3zvec.jpeg','lenovo-na-laptop-original-imafjyfzrfzvujhx.jpeg','lenovo-na-laptop-original-imafjyfzjejmxurt.jpeg','lenovo-na-laptop-original-imafjyfzeetdxpjy.jpeg',25999,10,'i3 7th Gen-(4GB/1TB HDD/DOS) ','Highlights\r\n->15.6 inch HD LED Backlit Anti-glare TN Display\r\n->DOS Operating System\r\n\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.3 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 8 GB\r\n->Graphic Processor           : Intel Integrated HD 620\r\n->Operating System             : DOS\r\n->Optical Drive                     : YES\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port \r\n->Multi Card Slot                 : 4-in-1 Card Reader (SD, SDHC, SDXC, MMC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','1 TB HDD',' ',' ',1),
(65,1,5,'Lenovo Thinpad E480','lenovo-thinkpad-laptop-original-imafkyqjetncnmtf.jpeg','lenovo-thinkpad-laptop-original-imafkyqjhjsx8pmw.jpeg','lenovo-thinkpad-laptop-original-imafkyqj7ywgzphx.jpeg','lenovo-thinkpad-laptop-original-imafkyqjghdbnacx.jpeg',56000,10,'i3 7th Gen-(4GB/500GB HDD/512 MB Graphics) ','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->14 inch\r\n\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 500 GB\r\n->Clock Speed                     : 2.3 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 8 GB\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Graphic Processor           : Intel Integrated\r\n->Graphic Memory               : 512 MB\r\n->Optical Drive                     : NO\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port \r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','4 GB','500 GB HDD',' ',' ',1),
(66,1,5,'Lenovo Ideapad C340','lenovo-na-thin-and-light-laptop-original-imafzby9asygdjgz.jpeg','lenovo-na-thin-and-light-laptop-original-imafzby9q4jfu8ku.jpeg','lenovo-ideapad-c340-14iml-2-in-1-laptop-original-imafj79wfe42xxgf.jpeg','lenovo-ideapad-c340-14iml-2-in-1-laptop-original-imafe8jysadg5hj3.jpeg',53000,10,'i3 10th Gen-(8GB/512GB SSD)','Highlights\r\n->Stylish & Portable Thin and Light Laptop\r\n->14 inch Full HD LED Backlit Glare IPS Display (250 nits Brightness)\r\n->Finger Print Sensor for Faster System Access\r\n->Including Microsoft Office Home and Student 2019\r\n\r\n\r\n->Processor Name              : Core i3\r\n->Processor Generation      : 	0th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 512GB\r\n->Clock Speed                     : 2.1 GHz with Turbo Boost Upto 4.1 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 12 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Graphic Processor           : Intel Integrated UHD\r\n->Optical Drive                     : NO\r\n->RJ45                                 : No\r\n->USB Port                          : 2 x USB 3.1, 1 x USB 3.1 Type C\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 4-in-1 Card Reader (SD, SDHC, SDXC, MMC) \r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i3','8 GB',' ','512 GB SSD',' ',1),
(67,1,1,'Acer Predator Helios 300','acer-na-gaming-laptop-original-imafmy4wdhs4gnyg.jpeg','acer-na-gaming-laptop-original-imafmy4wtdzryjqs.jpeg','acer-na-gaming-laptop-original-imafmy4wjxhv2kgc.jpeg','acer-na-gaming-laptop-original-imafmy4wtnbgjtsz (2).jpeg',99999,10,'i5 9th Gen-(16GB/1TB HDD/256GB SSD/6GB Graphics)','Highlights\r\n->Thin and Light Laptop\r\n->14 inch Full HD LED Backlit IPS Display\r\n->Finger Print Sensor\r\n->NVIDIA Geforce for Incredible Performance and Unmatched Efficiency\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 512 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.9 GH\r\n->Graphic Processor           : NVIDIA Geforce MX250\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : NO\r\n->USB Port                          : 2 x USB 3.0, 1 x USB Type C\r\n->HDMI Port                        : 1 x HDMI Port  \r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','16 GB','1 TB HDD','256 GB SSD','6 GB',1),
(68,1,1,'Acer Swift 3','acer-na-thin-and-light-laptop-original-imafhnvjgbjc5pd8.jpeg','acer-na-thin-and-light-laptop-original-imafkvh5kwxvgm7y.jpeg','acer-na-thin-and-light-laptop-original-imafhnvjgwsuygaz.jpeg','acer-na-thin-and-light-laptop-original-imafhnvkmzrz584p.jpeg',55900,10,'i5 8th Gen-(8GB/512GB SSD/2GB Graphics)','Highlights\r\n->Thin and Light Laptop\r\n->14 inch Full HD LED Backlit IPS Display\r\n->Finger Print Sensor\r\n->NVIDIA Geforce for Incredible Performance and Unmatched Efficiency','i5','8 GB',' ','512 GB SSD','2 GB',1),
(69,1,1,'Acer Nitro 5','windows-10-home-9th-gen-nh-q59si-014-nh-q59si-023-d-8-gb-core-i5-original-imafhz48hp9dbtd3.jpeg','windows-10-home-9th-gen-nh-q59si-014-nh-q59si-023-d-8-gb-core-i5-original-imafkvh5zkjefhsg.jpeg','windows-10-home-9th-gen-nh-q59si-014-nh-q59si-023-d-8-gb-core-i5-original-imafhz48r8cgdqya.jpeg','windows-10-home-9th-gen-nh-q59si-014-nh-q59si-023-d-8-gb-core-i5-original-imafhz48uztwgzwp.jpeg',63000,10,'i5 9th Gen-(8GB/1TB HDD/256GB SSD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce GTX 1650\r\n->15.6 inch Full HD LED Backlit IPS Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 256 GB\r\n->HDD Capacity                  : 1 TB\r\n->Expandable Memory        : Upto 32 GB\r\n->Graphic Processor           : NVIDIA Geforce GTX 1650\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : YES\r\n->USB Port                          : 1 x USB 3.1 Type C, 2 x USB 3.1, 1 x USB 2.0\r\n->HDMI Port                        : 1 x HDMI Port  \r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD','256 GB SSD','4 GB',1),
(70,1,2,'Asus R540UB-DM1197T','asus-na-laptop-original-imafkgzmyb2t7ggu.jpeg','asus-na-laptop-original-imafkgzkn47ththn.jpeg','asus-na-laptop-original-imafkgykknjgxqbq.jpeg','asus-na-laptop-original-imafhp5f5p8k2hsb.jpeg',42500,10,'i5 8th Gen-(8GB/1TB HDD/2GB Graphics)','Highlights\r\n->NVIDIA Geforce MX110\r\n->15.6 inch Full HD LCD Anti-glare Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Expandable Memory        : Upto 12 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : NVIDIA Geforce MX110\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : YES\r\n->RJ45                                 : NO\r\n->USB Port                          : 2 x USB 2.0, 1 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v1.4) \r\n->Multi Card Slot                 : Micro SD\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD',' ','2 GB',1),
(71,1,2,'Asus ROG Strix G','asus-na-gaming-laptop-original-imafkgzhtu6gwtgs.jpeg','asus-na-gaming-laptop-original-imafh4mezh2qbght.jpeg','asus-na-gaming-laptop-original-imafkgzhucxxgdhz.jpeg','asus-na-gaming-laptop-original-imafjtxcdkdfqbhh.jpeg',52999,10,'i5 9th Gen-(8GB/1TB HDD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce GTX 1050\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display (With 60 Hz Refresh Rate)\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Expandable Memory        : Upto 32 GB\r\n->Clock Speed                     : 2.4 GHz with Turbo Boost Upto 4.1 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1050\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : YES\r\n->USB Port                          : 3 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v2.0) \r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD',' ','4 GB',1),
(74,1,3,'Dell Vostro 3480','dell-na-gaming-laptop-original-imaf7dv2s7z9dmzd.jpeg','dell-na-gaming-laptop-original-imaf7dvfapwaheeu.jpeg','dell-na-gaming-laptop-original-imaf7dv2szcmtukb.jpeg','dell-na-gaming-laptop-original-imaf7dvfa7tgzrtq.webp',41000,10,'i5 8th Gen-(8GB/1TB HDD)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->14 inch HD LED Backlit Anti-glare Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.9 GHz\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : YES\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.1\r\n->HDMI Port                        : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD',' ',' ',1),
(75,1,3,'Dell G3 3579','dell-na-gaming-laptop-original-imaf7dv2s7z9dmzd.jpeg','dell-na-gaming-laptop-original-imaf7dv2pgdfxwrg.jpeg','dell-na-gaming-laptop-original-imaf7dv2szcmtukb.jpeg','dell-na-gaming-laptop-original-imaf7dvfa7tgzrtq.webp',58000,10,'i5 8th Gen-(8GB/1TB HDD/128GB SSD/4GB Graphics) ','Highlights\r\n->NVIDIA Geforce GTX 1050\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display\r\n->Including Microsoft Office Home and Student 2016\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->SSD Capacity                   : 128 GB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 2.3 GHz with Turbo Boost Upto 4 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1050\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : YES\r\n->USB Port                          : 2 x USB 3.1, 1 x USB 3.1 (1st Gen)\r\n->HDMI Port                        : 1 x HDMI Port (v2.0)\r\n->Multi Card Slot                 : 2-in-1 Card Reader (SD, Micro Media)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD','128 GB SSD','4 GB',1),
(76,1,3,'Dell Vosto 3478','dell-na-laptop-original-imaf4payng7z8g4f.jpeg','dell-na-laptop-original-imaf4pax5gmzqmq7.jpeg','dell-na-laptop-original-imaf4pavrhnebyhk.jpeg','dell-na-laptop-original-imaf4pav9u4ckwyu.jpeg',39000,10,'i5 8th Gen-(8GB/1TB HDD/Ubuntu)','Highlights\r\n->14 inch HD LED Backlit Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->SSD Capacity                   : 128 GB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System             : Ubuntu\r\n->Optical Drive                     : NO\r\n->RJ45                                 : YES\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port \r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD',' ',' ',1),
(77,1,3,'Dell Inspiron 14','dell-na-2-in-1-laptop-original-imafy2gczxsbef2f.jpeg','dell-na-2-in-1-laptop-original-imafy2gcmghjcghd.jpeg','dell-na-2-in-1-laptop-original-imafy2gcfgfmxpbc.jpeg','dell-na-2-in-1-laptop-original-imafy2gcveajdext.jpeg',69000,10,'i5 8th Gen-(8GB/256GB SSD)','Highlights\r\n->2 in 1 Laptop\r\n->13.3 inch Full HD LED Backlit Anti-glare IPS Touch Display\r\n->Including Microsoft Office Home and Student 2016\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 256 GB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : NO\r\n->HDMI Port                        : 1 x HDMI Port (v2.0)\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB',' ','256 GB SSD',' ',1),
(78,1,4,'HP  Pavilion 15','hp-na-notebook-original-imaetf6utcztr4ta.jpeg','hp-pavilion-notebook-original-imaerafbxh7na2rv.jpeg','hp-pavilion-original-imaeqyf9s8zxeyyf.jpeg','hp-pavilion-original-imaeqyf9zcuf3sej.jpeg',51400,10,'i5 7th Gen-(4GB/1TB HDD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce 940MX\r\n->15.6 inch Full HD LED Backlit IPS UWVA Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Expandable Memory        : Upto 4 GB\r\n->Clock Speed                     : 2.5 GHz with Turbo Boost Upto 3.1 GHz\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->USB Port                          : 2 x USB 3.1, 1 x USB 2.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','4 GB','1 TB HDD',' ','4 GB',1),
(79,1,4,'HP 15-au113TX','hp-pavilion-notebook-original-imaenf9sxef9rgge.jpeg','hp-pavilion-notebook-original-imaenf9sxef9rgge (1).jpeg','hp-pavilion-notebook-original-imaemb8yacsuhjfg.jpeg','hp-pavilion-notebook-original-imaemb8yxdzgevaf.jpeg',67000,10,'i5 7th Gen-(16GB/2TB HDD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce 940MX\r\n->15.6 inch HD LED Backlit Widescreen BrightView Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->HDD Capacity                  : 2 TB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 2.5 GHz with Turbo Boost Upto 3.1 GHz\r\n->Graphic Processor           : NVIDIA Geforce 940MX\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 2.0\r\n->HDMI Port                        : Yes, v1.4\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','16 GB','2 TB HDD',' ','4 GB',1),
(80,1,4,'HP 240 G5','hp-notebook-original-imaerpqpqbz5eqfu.jpeg','hp-notebook-original-imaerpqgvgyj4xn4.jpeg','hp-notebook-original-imaerpqufgpue6bg.jpeg','91tAzsVkViL._SL1500_.jpg',44000,10,'i5 6th Gen-(4GB/500GB HDD/DOS)','Highlights\r\n->14 inch HD LED Backlit Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 6th Gen\r\n->RAM                                 : 4 GB DDR4\r\n->HDD Capacity                  : 500 GB\r\n->Clock Speed                     : 2.3 GHz with Turbo Boost Upto 2.8 GHz\r\n->Graphic Processor           : Intel Integrated HD520\r\n->Operating System             : DOS\r\n->RJ45                                 : YES\r\n->Optical Drive                     : YES\r\n->USB Port                          : 1 x USB 3.0, 2 x USB 2.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','4 GB','500 GB HDD',' ',' ',1),
(81,1,4,'HP 15 15Q','hp-15q-ds0027tu-laptop-original-imafckhu8zcrpext.jpeg','hp-15q-ds0027tu-laptop-original-imafckhudy6qwkre.jpeg','hp-15q-ds0027tu-laptop-original-imafckhugpb5hcpq.jpeg','hp-15q-ds0027tu-laptop-original-imafckhumu9tgbrq.jpeg',46900,10,'i5 8th Gen-(8GB/256GB SSD)','Highlights\r\n->Thin and Light Laptop\r\n->15.6 inch 15.6-inch FUll HD SVA Anti-Glare WLED Display (1920 x 1080), 220 nits Brightness\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 256GB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 1.6 GHz base processor speed, Up to 3.4 GHz\r\n->Graphic Processor           : Intel Integrated HD Graphics 620\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->Optical Drive                     : YES\r\n->USB Port                          : 2 USB 3.1 Gen 1 (Data transfer only); 1 USB 2.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB',' ','256 GB SSD',' ',1),
(82,1,5,'Lenovo Ideapad 130-15IKB','lenovo-na-laptop-original-imafjyfzyzy3zvec.jpeg','lenovo-na-laptop-original-imafjyfzjejmxurt.jpeg','lenovo-na-laptop-original-imafjyfpyr926uye.jpeg','lenovo-na-laptop-original-imafjyfzrfzvujhx.jpeg',39999,10,'i5 8th Gen-(8GB/1TB HDD/2GB Graphics)','Highlights\r\n->NVIDIA Geforce MX110\r\n->15.6 inch HD LED Backlit Anti-glare TN Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Expandable Memory        : Upto 12 GB\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.4 GHz\r\n->Graphic Processor           : NVIDIA Geforce MX110\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->Optical Drive                     : YES\r\n->USB Port                          : 2 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port\r\n->Multi Card Slot                 : 4-in-1 Card Reader (SD, SDHC, SDXC, MMC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD',' ','2 GB',1),
(83,1,5,'Lenovo Ideapad L340','lenovo-na-gaming-laptop-original-imafjjj54auhethm.jpeg','lenovo-na-gaming-laptop-original-imafjjj5egfaj97x.jpeg','lenovo-na-gaming-laptop-original-imafjjj54auhethm.jpeg','lenovo-na-gaming-laptop-original-imafjjj5bfbmdre8.jpeg',60000,10,'i5 9th Gen-(8GB/1TB HDD/128GB SSD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce GTX 1650\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->SSD Capacity                   : 128GB\r\n->Expandable Memory        : Upto 16 GB\r\n->Clock Speed                     : 2.4 GHz with Turbo Boost Upto 4.1 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1650\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->Optical Drive                     : YES\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 3.1 Type C\r\n->HDMI Port                        : 1 x HDMI Port (v2.0)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD','128 GB SSD','4 GB',1),
(84,1,5,'Lenovo Yoga 730','lenovo-yoga-730-2-in-1-laptop-original-imafj6b9pgkhtkdx.jpeg','lenovo-yoga-730-2-in-1-laptop-original-imafj57fq4bzs6yn.jpeg','lenovo-yoga-730-2-in-1-laptop-original-imafj6b8j2zhgyer.jpeg','lenovo-yoga-730-2-in-1-laptop-original-imafj6bbhhq4wpcy.jpeg',125000,10,'i5 7th Gen-(8GB/256GB SSD) ','Highlights\r\n->Carry It Along 2 in 1 Laptop\r\n->13.3 inch\r\n->Light Laptop without Optical Disk Drive\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 256GB\r\n->Graphic Processor           : Intel Integrated\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : NO\r\n->Optical Drive                     : NO\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB',' ','256 GB SSD',' ',1),
(85,1,5,'Lenovo Legion Y530','lenovo-na-original-imafntyzkgk4ajzg.jpeg','lenovo-na-original-imafntyzhhthpyhd.jpeg','lenovo-na-original-imafntyz6wjzkksg.jpeg','lenovo-na-original-imafntyz7gayjwvq.jpeg',56900,10,'i5 8th Gen-(8GB/512GB SSD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce GTX 1050 for Desktop Level Performance\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display (60 Hz Refresh Rate, 250 nits \r\n  Brightness, 45% NTSC, 16:9 Aspect Ratio)\r\n->Light Laptop without Optical Disk Drive\r\n->Pre-installed Genuine Windows 10 OS\r\n->Preloaded MS Office Home and Student 2016\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 512GB\r\n->Clock Speed                     : 2.3 GHz with Turbo Boost Upto 4 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1050\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->Optical Drive                     : NO\r\n->USB Port                          : 3 x USB 3.1 (1st Gen), 1 x USB 3.1 Type C (1st Gen)\r\n->HDMI Port                         : 1 x HDMI Port (v2.0)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB',' ','512 GB SSD','4 GB',1),
(86,1,5,'Lenovo Ideapad S145','lenovo-na-laptop-original-imafmf4ft39tngge.jpeg','lenovo-na-laptop-original-imafmf4fhagnhtkc.jpeg','lenovo-na-laptop-original-imafmf4fhcacmbjj.jpeg','lenovo-na-laptop-original-imafmf4fkbt5vgyp.jpeg',49999,10,'i5 8th Gen-(8GB/1TB HDD/256GB SSD)','Highlights\r\n->Stylish & Portable Thin and Light Laptop\r\n->15.6 inch Full HD LED Backlit Anti-glare TN Display (220 nits Brightness)\r\n->Light Laptop without Optical Disk Drive\r\n\r\n->Processor Name              : Core i5\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 256GB\r\n->HDD Capacity                  : 1 TB\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 1.6 GHz with Turbo Boost Upto 3.9 GHz\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : NO\r\n->Optical Drive                     : NO\r\n->USB Port                          : 1 x USB 2.0, 2 x USB 3.1 (1st Gen)\r\n->HDMI Port                         : 1 x HDMI Port (v1.4b)\r\n->Multi Card Slot                 : 4-in-1 Card Reader (SD, SDHC, SDXC, MMC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i5','8 GB','1 TB HDD','256 GB SSD',' ',1),
(87,1,1,'Acer 2020 Predator Helios 300','61bE1yYu0+L._AC_SL1000_.jpg','61d3gjPLsOL._AC_SL1000_.jpg','51Y1hrZhwrL._AC_SL1000_.jpg','61csCYO5sVL._AC_SL1000_.jpg',112000,10,'i7 9th Gen-(32GB RAM/512GBSSD/1TB HDD)','Highlights\r\n->15.6 Inch diagonal FHD IPS micro-edge WLED-backlit display with Corning Gorilla Glass \r\n  NBT (1920 x 1080).\r\n->Windows 10 Home\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 32 GB DDR4\r\n->SSD Capacity                   : 512GB PCIe SSD \r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 2.6 GHz base frequency, up to 4.5 GHz\r\n->Graphic Processor           : NVIDIA GeForce GTX 1660Ti\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : NO\r\n->Optical Drive                     : NO\r\n->USB Port                          : 1 x USB 3.0,2 x USB 3.0,1 x USB-C 3.1 Gen 1\r\n->HDMI Port                         : 1 x HDMI Port \r\n->Multi Card Slot                 : SD Card reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','32 GB','1 TB HDD','512 GB SSD',' ',1),
(88,1,1,'Acer Predator Helios ','710gWd1K1TL._AC_SL1000_.jpg','71BxnYlbfqL._AC_SL1500_.jpg','61RC+hLwE0L._AC_SL1000_.jpg','71aRZ-C6NhL._AC_SL1500_.jpg',104000,10,'i7 9th Gen-(32GB RAM/512GB SSD/1TB HDD)','Highlights\r\n->15.6 Full HD (1920 x 1080) Widescreen LED-backlit IPS Display\r\n->NVIDIA GeForce GTX 1660 Ti Graphics with 6GB of dedicated GDDR6 VRAM\r\n->FHD IPS Display Gaming Laptop\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 32 GB DDR4\r\n->SSD Capacity                   : 512 GB SSD \r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : Up to 4.5GHz\r\n->Graphic Processor           : NVIDIA GeForce GTX 1660 Ti\r\n->Graphic Memory Type      : GDDR6 VRAM\r\n->Graphic Memory               : 6 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->Optical Drive                     : NO\r\n->USB Port                          : 1 x USB 3.1 (Type-C) Port, 1 x USB 3.0 Port 2 x USB 2.0, 1\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','32 GB','1 TB HDD','512 GB SSD','6 GB',1),
(89,1,2,'Asus ROG Strix Scar II','asus-na-gaming-laptop-original-imafe7ewk6eed4zy.jpeg','asus-na-gaming-laptop-original-imafe7eyvcccpgeu.jpeg','asus-na-gaming-laptop-original-imafe7ew6t4aejt5.jpeg','asus-na-gaming-laptop-original-imafe7exqvpymhbv.jpeg',209000,10,'i7 8th Gen-(16GB/1TB HDD/512GB SSD/8GB Graphics)','Highlights\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display (with 144 Hz Refresh Rate)\r\n->Suitable For Gaming, Processing & Multitasking\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->SSD Capacity                   : 512 GB SSD \r\n->HDD Capacity                  : 1 TB\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 2.2 GHz with Turbo Boost Upto 4.1 GHz\r\n->Graphic Processor           : NVIDIA Geforce RTX 2070\r\n->Graphic Memory Type      : GDDR6 VRAM\r\n->Graphic Memory               : 8 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->RJ45                                 : YES\r\n->Optical Drive                     : NO\r\n->USB Port                          : 3 x USB 3.1, 1 x USB 3.1 Type C\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','16 GB','1 TB HDD','512 GB SSD','8 GB',1),
(90,1,2,'Asus ZenBook Pro Duo','asus-na-laptop-original-imafhb5d8yyxdnnd.jpeg','asus-na-laptop-original-imafhb5ezwj5rpgu.jpeg','asus-na-laptop-original-imafhb5d5r9hukau.jpeg','asus-na-original-imafh4jzsdznhh6g.jpeg',209000,10,'i7 9th Gen-(32GB/1TB SSD/6 GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->15.6 inch Ultra HD OLED Backlit Glare IPS Touch NanoEdge Display (With 100% DCI-P3)\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 32 GB DDR4\r\n->SSD Capacity                   : 1 GB SSD \r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 2.6 GHz with Turbo Boost Upto 4.5 GHz\r\n->Graphic Processor           : NVIDIA Geforce RTX 2060\r\n->Graphic Memory Type      : GDDR6 VRAM\r\n->Graphic Memory               : 6 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 2 x USB 3.1, 1 x USB 3.1 Type C with Thunderbolt\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','32 GB',' ','1 TB SSD','6 GB',1),
(91,1,3,'Dell G7 7588','dell-na-gaming-laptop-original-imaf7dv3jhjzwbjh.jpeg','dell-na-gaming-laptop-original-imaf7dv3mbcx8tx7.jpeg','dell-na-gaming-laptop-original-imaf7dv3semthgkh.jpeg','dell-na-gaming-laptop-original-imaf7dv3yvubnfjm.jpeg',129990,10,'i7 8th Gen-(16GB/1TB HDD/128GB SSD/6GB Graphics) ','Highlights\r\n->NVIDIA Geforce GTX 1060\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->SSD Capacity                   : 128 GB SSD \r\n->HDD Capacity                  : 1 TB\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 2.2 GHz with Turbo Boost Upto 4.1 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1060\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 6 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 3 x USB 3.1 (1st Gen) Type A, 1 x USB 3.1 (2nd Gen) Type C\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','16 GB','1 TB HDD','128 GB SSD','6 GB',1),
(92,1,3,'Dell XPS 13 9370','dell-na-thin-and-light-laptop-original-imaf7fy97d4j2z9a.jpeg','dell-na-thin-and-light-laptop-original-imaf7fy9sf7kyjsj.jpeg','dell-na-thin-and-light-laptop-original-imaf7fy963rsv7ps.jpeg','dell-na-thin-and-light-laptop-original-imaf7fy9vbhc7b9t.jpeg',187990,10,'i7 8th Gen-(16GB/512GB SSD)','Highlights\r\n->Thin and Light Laptop\r\n->13.3 inch Full HD LED Backlit InfinityEdge Display\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->SSD Capacity                   : 512 GB SSD \r\n->Clock Speed                     : 1.8 GHz with Turbo Boost Upto 4 GHz\r\n->Graphic Processor           : Intel Integrated UHD620\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 2 x Thunderbolt 3, 1 x USB 3.1 Type C\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','16 GB',' ','512 GB SSD',' ',1),
(93,1,4,'HP Omen 15','hp-na-original-imafhukft7ed6n8g.jpeg','hp-na-original-imafhuk2vypeugrm.jpeg','hp-na-original-imafhuk2hc9dstem.jpeg','hp-na-original-imafhuk2mjwaz99q.jpeg',105900,10,'i7 9th Gen-(8 GB/1TB HDD/256GB SSD/4GB Graphics)','Highlights\r\n->NVIDIA Geforce GTX 1650\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Micro Edge Display (With 60 Hz Refresh Rate)\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->SSD Capacity                   : 256 GB SSD \r\n->HDD Capacity                  : 1 TB\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 32 GB\r\n->Clock Speed                     : 2.6 GHz with Turbo Boost Upto 4.5 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1650\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 3 x USB 3.0, 2 x USB 3.1 Type C\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','8 GB','1 TB HDD','256 GB SSD','4 GB',1),
(94,1,4,'HP Spectre x360','hp-na-2-in-1-laptop-original-imaf2jkzh26dr6yc.jpeg','hp-na-2-in-1-laptop-original-imaf2jkzhj3feass.jpeg','hp-na-2-in-1-laptop-original-imaf2jkzgjg4thuk.jpeg','hp-na-2-in-1-laptop-original-imaf2jkzdktzmh45.jpeg',149499,10,'i7 8th Gen-(16GB/512GB SSD)','Highlights\r\n->2 in 1 Laptop\r\n->13.3 inch Full HD LED Backlit Widescreen Multitouch-enabled Flush Glass Anti-glare Display \r\n  (Direct Bonding Touch with Corning Gorilla Glass NBT, HP SureView Integrated Privacy Screen\r\n  ,72% Colour Gamut, Active Stylus Writing Support)\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->SSD Capacity                   : 512 GB SSD \r\n->Clock Speed                     : 1.8 GHz with Turbo Boost Upto 4 GHz\r\n->Graphic Processor           : Intel Integrated UHD 620\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : NO\r\n->USB Port                          : 2 x USB 3.1 (2nd Gen) Type C with Thunderbolt (3rd Gen), 1 x USB 3.1 (1st Gen) Type A\r\n->HDMI Port                         : 1 x HDMI Port 2.0\r\n->Multi Card Slot                 : 3-in-1 Card Reader (SD, SDHC, SDXC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','16 GB',' ','512 GB SSD',' ',1),
(95,1,5,'Lenovo ThinkPad X1','lenovo-na-laptop-original-imafkr34htjxsfs4.jpeg','lenovo-na-laptop-original-imafkr34h67bgdvp.jpeg','lenovo-original-imafkzrnrqmfu4qh.jpeg','lenovo-na-laptop-original-imafkr34hwhwmmgz.jpeg',52990,10,'i7 8th Gen-(8GB/1TB HDD/2GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->NVIDIA Geforce MX230 for High Graphics Performance\r\n->Light Laptop without Optical Disk Drive\r\n->15.6 inch Full HD LED Backlit Anti-glare Display\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 8 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->Clock Speed                     : 1.8 GHz with Turbo Boost Upto 4.6 GHz\r\n->Graphic Processor           : NVIDIA Geforce MX230\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 2 GB\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0, 1 x USB Type C\r\n->HDMI Port                         : 1 x HDMI Port \r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','8 GB','1 TB HDD',' ',' ',1),
(96,1,5,'Lenovo Legion Y520','lenovo-na-gaming-laptop-original-imaf9gh68d4s66eq.jpeg','lenovo-na-gaming-laptop-original-imaf9gh63syqjfjs.jpeg','lenovo-na-gaming-laptop-original-imaf9gh69hjzyngm.jpeg','lenovo-na-gaming-laptop-original-imaf9gh6vqvph5j8.jpeg',99999,10,'i7 7th Gen-(16GB/1TB HDD/128GB SSD/4GB Graphics) ','Highlights\r\n->NVIDIA Geforce GTX 1050Ti\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display\r\n\r\n->Processor Name              : Core i7\r\n->Processor Generation      : 7th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->SSD Capacity                   : 512GB\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 2.8 GHz with Turbo Boost Upto 3.8 GHz\r\n->Graphic Processor           : NVIDIA Geforce GTX 1050Ti\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 4 GB\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 x USB 3.0, 1 x USB 2.0, 1 x USB 3.0 Type C\r\n->HDMI Port                         : 1 x HDMI Port \r\n->Multi Card Slot                 : 4-in-1 Card Reader (SD, SDHC, SDXC, MMC)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i7','16 GB','1 TB HDD','128 GB SSD','4 GB',1),
(97,1,1,'Acer Predator Helios 500','71XG205vPNL._AC_SL1500_.jpg','71WXeYJJ6gL._AC_SL1500_.jpg','71-arqGyn6L._AC_SL1500_.jpg','61mhia5KOCL._AC_SL1500_.jpg',189000,10,'i9 8th Gen-(16GB/2TB HDD/512GB SSD/8GB Graphics) ','Highlights\r\n->NVIDIA Geforce GTX 1050Ti\r\n->15.6 inch Full HD LED Backlit Anti-glare IPS Display\r\n\r\n->Processor Name              : Core i9\r\n->Processor Generation      : 8th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->HDD Capacity                  : 2 TB\r\n->SSD Capacity                   : 512GB PCle NVMe\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : Overclock Capable Processor (Up to 4.8GHz)\r\n->Graphic Processor           : NVIDIA GeForce GTX 1070\r\n->Graphic Memory Type      : GDDR5\r\n->Graphic Memory               : 8 GB\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : Yes\r\n->USB Port                          : 2 - Thunderbolt 3 (Full USB 3.1 Type C) Port\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i9','16 GB','2 TB HDD','512 GB SSD','8 GB',1),
(98,1,1,'Asus ZenBook Pro Duo','asus-na-laptop-original-imafhb5ezwj5rpgu.jpeg','asus-na-laptop-original-imafhb5d5r9hukau.jpeg','asus-na-original-imafh4jzsdznhh6g.jpeg','asus-na-original-imafh4jz3hedfazs.jpeg',249990,10,'i9 9th Gen-(32GB/1TB SSD/6GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Light Laptop without Optical Disk Drive\r\n->15.6 inch Ultra HD OLED Backlit Glare IPS Touch NanoEdge Display (With 100% DCI-P3)\r\n\r\n->Processor Name              : Core i9\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 32 GB DDR4\r\n->SSD Capacity                   : 1 TB SSD\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 2.4 GHz with Turbo Boost Upto 5 GHz\r\n->Graphic Processor           : NVIDIA Geforce RTX 2060\r\n->Graphic Memory Type      : GDDR6\r\n->Graphic Memory               : 6 GB\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : NO\r\n->USB Port                          : 2 x USB 3.1, 1 x USB 3.1 Type C with Thunderbolt\r\n->HDMI Port                        : 1 x HDMI Port (v2.0)\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i9','32 GB',' ','1 TB SSD','6 GB',1),
(99,1,2,'Asus ROG ','asus-na-gaming-laptop-original-imafggyug3anykzs.jpeg','asus-na-gaming-laptop-original-imafggyu8xfgpx7a.jpeg','asus-na-gaming-laptop-original-imafggyugg4scnnr.jpeg','asus-na-gaming-laptop-original-imafggyuwkh2jvhx.jpeg',399990,10,'i9 9th Gen-(32GB/1TB HDD/1TB SSD/8GB Graphics) ','Highlights\r\n->17.3 inch Full HD LED Backlit Anti-glare IPS Display \r\n(Support 144 Hz Refresh Rate with G-sync Enabled)\r\n\r\n->Processor Name              : Core i9\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 32 GB DDR4\r\n->HDD Capacity                  : 1 TB\r\n->SSD Capacity                   : 1 TB\r\n->Clock Speed                     : 2.4 GHz with Turbo Boost Upto 5 GHz\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 64 GB\r\n->Graphic Processor           : NVIDIA Geforce RTX 2080\r\n->Operating System            : Windows 10 Home 64 bit\r\n->RJ45                                 : Yes\r\n->USB Port                          : 3 x USB 3.1, 1 x USB 3.1 Type C Thunderbolt 3\r\n->HDMI Port                         : 1 x HDMI Port (v2.0)\r\n->Multi Card Slot                 : SD Card Reader\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Power Adaptor, Laptop Bag, Gaming Headset, Gaming Mouse, User Guide, Warranty Documents','i9','32 GB','1 TB HDD','1 TB SSD','8 GB',1),
(100,1,3,'Dell Alienware M15 R2','61FjdoHidqL._SL1000_.jpg','61QRp42tSVL._SL1000_.jpg','5173+mBeEFL._SL1000_.jpg','71r402INYtL._SL1500_.jpg',201990,10,'i9 9th Gen-(16GB/1TB SSD/8GB Graphics)','Highlights\r\n->Windows 10 + MS Office\r\n->10 hours battery life\r\n\r\n->Processor Name              : Core i9\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->SSD Capacity                   : 1 TB SSD\r\n->Memory Slots                   : 2 Slots\r\n->Expandable Memory        : Upto 64 GB\r\n->Clock Speed                     : 2.4 GHz with Turbo Boost Upto 5 GHz\r\n->Graphic Processor           : NVIDIA 2080\r\n->Graphic Memory               : 8 GB\r\n->Operating System             : Windows 10 Home 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : Yes\r\n->USB Port                          : 3 x USB 3.0\r\n->HDMI Port                        : 1 x HDMI Port \r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i9','16 GB',' ','1 TB SSD','8 GB',1),
(101,1,4,'HP Omen x 2S','91iEWdpsSBL._SL1500_.jpg','81cytfdBBfL._SL1500_.jpg','81YLwDHpA6L._SL1500_.jpg','81brXYjBxZL._SL1500_.jpg',218000,10,'i9 9th Gen-(16GB/2TB SSD/8GB Graphics)','Highlights\r\n->Pre-installed Genuine Windows 10 OS\r\n->Gaming Laptop\r\n\r\n->Processor Name              : Core i9\r\n->Processor Generation      : 9th Gen\r\n->RAM                                 : 16 GB DDR4\r\n->SSD Capacity                   : 2 TB SSD\r\n->Memory Slots                   : 2 Slots\r\n->Clock Speed                     : 2.60 GHz\r\n->Graphic Processor           : NVIDIA RTX 2080\r\n->Graphic Memory               : 8 GB\r\n->Operating System             : Windows 10 Pro 64 bit\r\n->Optical Drive                     : NO\r\n->RJ45                                 : NO\r\n->Warranty Summary          : 1 Year International Travelers Warranty (ITW)\r\n->Warranty Service Type     : Onsite\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage and Accesories\r\n->Domestic Warranty          : 1 Year\r\n->International Warranty     : 1 Year\r\n->Sales Package                : Laptop, Battery, Power Adaptor, User Guide, Warranty Documents','i9','16 GB',' ','2 TB SSD','8 GB',1),
(102,6,14,'HP Slim Wireless Keyboard & Mouse Combo','u-multimedia-slim-wireless-keyboard-mouse-combo-hp-original-imaffkamsdrsgemr.jpeg','u-multimedia-slim-wireless-keyboard-mouse-combo-hp-original-imaffkamyscw4kwj.jpeg','u-multimedia-slim-wireless-keyboard-mouse-combo-hp-original-imaffkamr6e4prqj.jpeg','u-multimedia-slim-wireless-keyboard-mouse-combo-hp-original-imaffkamsdrsgemr.jpeg',1300,10,'Multimedia Slim Wireless Combo','Highlights\r\n->Case Material: Plastic\r\n->Size: Standard\r\n->Interface: Wireless\r\n\r\nStylish Ultra-Slim design Keyboard & Mouse, Sealed membrane for overall protection, Brush metal finish, Advanced controls 2.4G wireless technology with 10m working range and nano-receiver, Energy saving design standby function Multimedia Keyboard 104 keys + 8 hot keys, High-Quality soft and silent keys, Easy cleaning flat-square design keys, Ultra-durable UV-ink printed keys Professional Optical sensor with direct DPI switch 800/1200/1600 dpi, High quality switches for over 2 million clicks supported Smooth responsive cursor control with easy scrolling, Designed for professional or gaming use\r\n\r\n->Warranty Summary          : 1 Year Limited Warranty (Return to HP/Dealer - Standard \r\n                                              Bench Repair & Phone-in Assistance)\r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage ',' ',' ',' ',' ',' ',1),
(103,3,13,'HP M100 Wired Gaming Mouse','hp-m100-original-imaf5xmxcgwzydzn.jpeg','hp-m100-original-imaf3gy9bt5pqu2h.jpeg','hp-m100-original-imaf3gy95zcc5mqu.jpeg','hp-m100-original-imaf3gyajnfpxzsb.jpeg',450,10,'Optical Gaming Mouse (USB 2.0, Black)','Highlights\r\n->Wired\r\n->For Gaming\r\n->Interface: USB 2.0\r\n->Optical Mouse\r\n->3-buttons, scroll wheel (acts as the third button)\r\n->The high-definition optical sensor gives smooth, responsive cursor control Plug in the cord into your computer\'s USB port and you\'re ready to Game\r\n\r\nOptimum performance: High-end optical engine adds precise targeting, pinpoint aracy and consistent response to your gaming arsenal, Control your game: Adust your DPI setting(1,000 and 1,600 DPI) for more precise targeting, increased maneuverability or maximumspeed, Built to last: Gaming buttons rated up to 5 million clicks.Quality matters: Strict HP standards and guidelines ensure., Long-lasting quality\r\n\r\n->Warranty Summary          : 1 Year',' ',' ',' ',' ',' ',1),
(104,2,13,'HP Omen Sequencer ','hp-omen-sequencer-original-imafd4g846nvf4sg.jpeg','hp-omen-sequencer-original-imafd4g8ddhg5nyr.jpeg','hp-omen-sequencer-original-imafd4g88vmfhevx.jpeg','hp-omen-sequencer-original-imafd4g8hhmapf5z.jpeg',7200,10,'Wired USB Gaming Keyboard  (Black)','Highlights\r\n->Case Material: Anodized Aluminium\r\n->Size: Standard\r\n->Interface: Wired USB\r\n->Optical-Mechanical Blue Switches With 50G Actuation Force\r\n->Enables A 0.2 Ms Response Time-10 Times Faster Than Traditional Mechanical Switches\r\n->Customizable Keys: Gain An Edge By Customizing 5 Dedicated Macro Keys\r\n->Cast Your Perfect Aura: Individually Backlit Keys Offer Up To 16.8 Million Rgb Colors To ->Choose From With Unique Effects\r\n->Concentrate On The Win: Gaming Mode Blocks Interruptions From Your System So You \r\n    Can Focus On Victory\r\n\r\n->Warranty Summary          : 1 Year Limited Warranty \r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damage',' ',' ',' ',' ',' ',1),
(105,3,13,'HP Omen Reactor','hp-omen-reactor-original-imafgc68ygnqqx4k.jpeg','hp-omen-reactor-original-imafgc68jzwzqzap.jpeg','hp-omen-reactor-original-imafe5ch7dtsttkm.jpeg','hp-omen-reactor-original-imafgc68ydy4gcuc.jpeg',3700,10,'Wired Gaming Mouse(USB 3.0,USB 2.0,Black)','Highlights\r\nWired\r\n->For Gaming\r\n->Interface: USB 3.0, USB 2.0\r\n->Optical Mouse\r\n\r\n\r\nLight Beam Detection, Click Response Time: 0.2 ms, Click Lifetime: 50 Million, Six Customizable Mouse Buttons, On-the-fly DPI Control,Customizable Comfort, Cutting-edge Metal Cable, Long-lasting Durability, Up to 16.8 Million Color Options\r\n\r\n->Warranty Summary          : 1 Year Limited Warranty \r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damag\r\n',' ',' ',' ',' ',' ',1),
(106,3,13,'Dragon War ELE-G9 Mouse','dragon-war-ele-g9-thor-bluetrack-with-marco-funtion-mouse-original-imaeg2pyzpbu5jpp.jpeg','dragon-war-ele-g9-thor-bluetrack-with-marco-funtion-mouse-original-imaeg2pwzz2gasgs.jpeg','dragon-war-ele-g9-thor-bluetrack-with-marco-funtion-mouse-original-imaeg2pykwvhnq8m.jpeg','dragon-war-ele-g9-thor-bluetrack-with-marco-funtion-mouse-original-imaeg2q2hzamyfzt.jpeg',1465,10,'Dragon war Thor Wired Gaming Mouse ','Highlights\r\n->Wired\r\n->For Gaming\r\n->Interface: USB\r\n->Resolution: 800/ 1600/ 2400/ 3200 dpi\r\n\r\n\r\nHigh-speed USB, Suitable for Almost Every Surface, Special Gaming Sensor with Revolutionary 3200 dpi, 4 Speed DPI, Power Source USB, Gold Plated Connector for a Reliable Transmission Integrity, Uses Revolutionary Avago 5050 Chipset, In-buit Memory to Save Profiles, Free Mouse Mat Size: 340 x 250 x 3 mm, 512 k in Store Memory with Macro Function can Use in different Computers, LED Light\r\n\r\n->Warranty Summary          : 1 Year Limited Warranty \r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damag',' ',' ',' ',' ',' ',1),
(107,3,14,'Offbeat Ripjaw Mouse','offbeat-ripjaw-original-imaf8fsy2mznn32w.jpeg','offbeat-ripjaw-original-imaf8fsykyajhdzd.jpeg','offbeat-ripjaw-original-imaf8fsym6vdzadn.jpeg','offbeat-ripjaw-original-imaf8fsytznbupuw.jpeg',1300,10,'Wireless Laser Gaming Mouse (2.4GHz Wireless)','Highlights\r\n->Wireless\r\n->For Gaming\r\n->Interface: 2.4GHz Wireless\r\n->Laser Mouse\r\n\r\nIt\'s easy to be passionate about winning, but with Offbeat, our passion is in the science that makes winning possible. We have built a highly precise gaming mouse - Ripjaw. We have advanced our technology & sciences so gamers can reach new levels of speed, precision, reliability and comfort. Science is our philosophy, our methodology for creating jaw dropping performing devices. With Ripjaw we did the same and are proud to present our sheer performing beast for high level of gamers & designers. Let your thoughts and actions be bind together in matter of 1ms, feel the most advanced gaming experience or witness the atmost precision of movement with its Static coefficient of friction - Mu (s): .143 and advanced optical laser technology for the graphic designers.\r\n\r\n->Warranty Summary          : 1 Year Limited Warranty \r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damag',' ',' ',' ',' ',' ',1),
(108,2,14,'Alienware Wired/Wireless Gaming Mouse','71PUKsqAIbL._SL1500_.jpg','71As6LgjIgL._SL1500_.jpg','71u65w5IiEL._SL1500_.jpg','71ag-sV+jsL._SL1500_.jpg',8249,10,'Gaming Mouse,Rechargeable Battery Life','highlights\r\n->High-performing polling rate of 1000hz in both wired or wireless mode\r\n->Industry-leading battery life of up to 350 hours in one single charge\r\n->Latest generation custom Alienware native 16,000 DPI sensor\r\n->Custom adjustable scroll wheel with a wide toggle setting between 12 and 24 steps per \r\n    scroll wheel revolution\r\n->Pre-loaded tension on main mouse buttons for a controlled, crisp, tactile click feel\r\n->Seven fully programmable mouse buttons via Alienware Command Center\r\n->Customizable 16.8m AlienFX RGB Lighting\r\n->Signature Alienware ergonomic design\r\n\r\n->Warranty Summary          : 1 Year Limited Warranty \r\n->Covered in Warranty        : Manufacturing Defects\r\n->Not Covered in Warranty : Physical Damag',' ',' ',' ',' ',' ',1),
(109,4,6,'CP PLUS 1 Megapixel HD ','61AJyFJxPHL._SL1500_.jpg','61AJyFJxPHL._SL1500_.jpg','61AJyFJxPHL._SL1500_.jpg','61AJyFJxPHL._SL1500_.jpg',1200,10,'Indoor Dome CCTV Security Surveillance Camera','->This camera is only for All in one 4K/1MP/HD or AHD Technology support DVR so before \r\n    purchase must check this camera is compatible with your DVR or not.\r\n->Day/Night(ICR), AWB, AGC, BLC,Plug-n-Play HD/SD Camera\r\n->3.6mm Lens (2.8mm, 6mm Optional),1MP HD Color Image Sensor,25/30fps@720P\r\n->Equipped with fine IR LEDs for clearer night vision\r\n->R Range of 20 Mtr.Compatible with HDCVI, HDTVI, AHD and CVBS Formats\r\n->Warranty Details: 2 Year',' ',' ',' ',' ',' ',1),
(110,4,6,'CP Plus Combo','41cBSJrHLWL.jpg','31CFywGAzDL.jpg','41Zt+Gvc43L._SL1000_.jpg','51-vdCCzO9L._SL1000_.jpg',12000,9,'Full 2.4 MP 2 Cam CCTV Kit','->Amazing cp plus combo pack provided \r\n->Dvr cp plus 4ch video 4 audio (0404e1-ts) with 1 tb seagate skyhawk hard disk\r\n->Product customization option available ask for\r\n->Full set complete cctv kit quality',' ',' ',' ',' ',' ',1),
(111,4,6,'CP Plus (CP-E21)','31GuLcevRbL.jpg','31GuLcevRbL (1).jpg','31GuLcevRbL.jpg','31GuLcevRbL (1).jpg',3600,10,'2MP CMOS Image Sensor','->2MP CMOS Image Sensor 3.6mm Lens\r\n->H.264 High Profile Video Compression Wi-Fi Support\r\n->Max 15fps@1080P IR Distance of 15 Mtr.\r\n->Warranty Details: 1 YEAR WARRANTY',' ',' ',' ',' ',' ',1),
(112,4,7,'Dahua HDCVI Bullet Camera','6189RT+yrhL._SL1375_.jpg','6189RT+yrhL._SL1375_.jpg','6189RT+yrhL._SL1375_.jpg','6189RT+yrhL._SL1375_.jpg',1700,10,'Bullet Camera DH-HAC-HFW1220SP-0360B','HDCVI Bullet outdoor weather proof camera,Night Vision, High quality HD image with IR Distance 30 Meter,1/2.9\" 2Megapixel , High speed, long distance real-time transmission, HD and SD switchable, 3.6mm fixed lens, Built-in 2/1 alarm in/out.\r\n\r\n->1 Year Service Warranty',' ',' ',' ',' ',' ',1),
(113,4,7,'Dahua 2MP 1080P','71C1++5JyHL._SL1500_.jpg','71C1++5JyHL._SL1500_.jpg','71C1++5JyHL._SL1500_.jpg','71C1++5JyHL._SL1500_.jpg',1590,10,' Turbo HD Night Vision Indoor Dome.','->Dahua DH-HAC-HDW1220RP 2MP (1080P) Night Vision Plastic Body Dome Camera \r\n    1Pcs with 2BNC and 1DC Connectors and 2pcs of Free Safesky Stickers.\r\n->Camera Description: 2Megapixel High-performance CMOS, Analog HD output, up to \r\n    1080P resolution, True Day/Night, Smart IR, Up to 20m IR distance.\r\n->Effective Pixels- 1920 (H) x 1080 (V), Min. illumination- 0.01 Lux @ (F1.2, AGC ON), 0 \r\n    Lux with IR. Signal System-PAL/NTSC, IP66 Weatherproof.\r\n->It can be used with Dahua 2MP or above HD DVR for clear and better vision. Free  \r\n    Mobile View (Android and Windows Phone), Can Be Watched Online, High Quality \r\n    Branded Product, Installation is not included.\r\n->2 Years Manufacturer Warranty of Camera. (Physical Damage & Burning are not \r\n    covering in Warranty). Before purchasing this product, please make sure that your DVR \r\n    is supported to this camera.',' ',' ',' ',' ',' ',1),
(114,4,7,'Dahua Combo','21VbmZH-R4L.jpg','31TvWZv+jEL.jpg','41+sCG0oXqL.jpg','51fZK6PtY0L._SL1000_.jpg',16700,10,'5MP 4Ch Combo,3Dome,1Bullet Cameras','->DAHUA 4CH Penta-brid 4K Digital Video Recorder 1Pcs ( H.265+/H.265 dual-stream \r\n    video compression, Smart Search and intelligent video Search )\r\n->Dahua 5mp dome camera 3, Dahua 5mp bullet camera 1 pcs.1TB Seagate/WD Purple \r\n    Surveillance Hard Drive 1Pcs, CCTV Copper Cable 1 Bundle, 4CH Power Supply 1Pcs   \r\n    Bnc 8 Pcs, Dc 4Pcs,\r\n->This Combo Kit suitable for buyers who are looking for cctv surveillance for their shops, \r\n    warehouses, office, schools, tuition, classrooms, retail stores and for home security \r\n    Purpose.\r\n->2 Years Warranty on Dahua Products, (Adapter, Mouse, Cable, Accessories, Physical \r\nDamaged & Burning products are Not Cover In Warranty) # Company can change their model number and product look without giving any notice so maybe if the model number and product look is changed you will receive upgraded model but the products specifications are same or updated # Installation is not included.',' ',' ',' ',' ',' ',1),
(115,4,7,'Dahua Bullet CCTV Camera','31MuZOvMveL.jpg','21ppwrQ892L.jpg','31MuZOvMveL.jpg','21ppwrQ892L.jpg',1590,10,'Bullet CCTV Camera ','->1/2.7\", 2 Megapixel CMOS.25/30 fps @ 1080p\r\n->2 years national, All india Warranty\r\n->Day/Night(ICR), AWB, AGC, BLC, 2D-DNR\r\n->Max. IR LEDs length 20 m, Smart IR\r\n->Supported DVR: Dahua xvr4108 or xvr4116 or xvr4104',' ',' ',' ',' ',' ',1),
(116,4,8,'Hikvision CCTV','41Z9xEoVuGL.jpg','41Z9xEoVuGL.jpg','41Z9xEoVuGL.jpg','41Z9xEoVuGL.jpg',9000,10,'Set 4 Channel DVR & 4 Bullet IR Camera','->CCTV Camera\r\n->Frame Composition :Aluminium\r\n->Wall Mount : Yes\r\n->1 Year Warranty For Manufacturing Defects.',' ',' ',' ',' ',' ',1),
(117,4,8,'Hikvision CCTV 2MP','31Yq70iNS4L.jpg','31N+XiLAIUL.jpg','31Yq70iNS4L.jpg','31N+XiLAIUL.jpg',1900,10,'Full HD Metal 2MP Bullet Camera','->2 MP high performance CMOS. 1920 × 1080 resolution\r\n->2.8 mm, 3.6 mm fixed focal lens\r\n->PIR detection, visual alarm\r\n->EXIR 2.0, smart IR, up to 20 m IR distance\r\n->IP67. Up the coax (HIKVISION-C)',' ',' ',' ',' ',' ',1),
(118,4,8,'HIKVISION Ezviz EZ360','51B0FsAmikL._SL1001_.jpg','51pGGQJ+GqL._SL1000_.jpg','61YKhV1ah+L._SL1500_.jpg','51B0FsAmikL._SL1001_.jpg',2800,10,'720P Wi-Fi Internet Wireless Camera','->2 Years Manufacturer Warranty \r\n->Easy installation:Download free Ezviz app, scan bar code on the product to add device \r\n    to mobile for live monitoring\r\n->Smart panramic pan tilt: Expansive field of view coverage with 340&#8304; horizontal, 105&#8304; \r\n    vertical upward and 15&#8304; downward rotations',' ',' ',' ',' ',' ',1),
(119,4,9,'MI 360° ','71C20l1qIrL._SL1500_.jpg','71XG+vBTvBL._SL1500_.jpg','61hY9McQP4L._SL1500_.jpg','51y20nVZJwL._SL1500_.jpg',2800,10,'1080p Full HD WiFi Smart Security Camera','->AI motion detection alert. The camera angle is 110 degree and the connectivity is Wi-Fi IEEE 802.11 b/g/n 2.4 GHz\r\n->Input Power: 5V ; Working temperature: -10&#8451; ~ 50&#8451;; Support Devices : Android 4.4 \r\n    above or IOS 9.0 above\r\n->Infrared Night Vision\r\n->Talkback Feature\r\n->The Mi Camera 360° has perfect picture quality. With Mi Camera\'s 20 megapixels, \r\n     1080p\r\n ->resolution and wide dynamic range, even distant backgrounds are clear and detailed\r\n->Inverted installation (optional)\r\n->Up to 64GB SD card storage\r\n->Customer Care Detail : 1800 103 6286',' ',' ',' ',' ',' ',1),
(120,4,9,'Mi Full HD Security Camera ','71NcFHbuw0L._SL1500_.jpg','41ozvlVpA9L._SL1000_.jpg','41fyAjzMQ1L._SL1000_.jpg','41ozvlVpA9L._SL1000_.jpg',1869,10,'Ultra-Wide Angle Lens , Two-Way Audio','->Works with Alexa: This security camera can \'work with Alexa\'. For eg., You can use Echo ->Show as an input for control functionality of this product\r\n->Mi home security camera basic 1080p is capable of recording 1080p full HD video\r\n->Equipped with a 130 degree ultra wide angle lens, 10m ranged infrared night vision\r\n->Ultra-wide 130 degree Angle Lens ; Power Consumption: 5 W ; Wi-Fi modes: 2.4GHz, 5GHz\r\n->Advanced AI motion detector reduces false alarm\r\n->Two-way voice communication and Intelligent detection\r\n->Contact_us on: [ 1800 103 6286 ] Service hours: 09:00-23:00',' ',' ',' ',' ',' ',1),
(121,6,14,'Dell KM117 Combo','dell-km117-original-imafmktgbfwxy8bp.jpeg','dell-km117-original-imafmktgg5dyeybk.jpeg','dell-km117-original-imafmktgtpfzdby7.jpeg','dell-km117-original-imafmktgbfwxy8bp.jpeg',1358,10,'Wireless Keyboard & Mouse ','Highlights\r\n->For Desktop, Tablet, Laptop\r\n->Size: Standard\r\n->Interface: Wireless\r\n->Multimedia Keys\r\n\r\n->Give a boost to your productivity in front of your personal computer with the Dell \r\n    KM117 Wireless Laptop Keyboard and Mouse combo. Go wireless and clutter-free with \r\n    this computer accessory combo that you can connect to your PC by plugging-in the \r\n    2.4GHz RF nano dongle into a USB port.\r\n->Designed to Enhance Productivity\r\n->This is a full-sized keyboard with chiclet keys, and it features a 3-section layout along \r\n    with multimedia and hot keys. Using the optical mouse that navigates easily, \r\n    accomplish various tasks daily.\r\n->Sleek and Compact\r\n->This keyboard and mouse combo is sleek and compact that you can easily integrate \r\n     into your desktop setup.\r\n->Long Battery Life\r\n->The battery life of both the keyboard and mouse is up to 12 months. Also, these \r\n    accessories have low-battery life indicators to let you know when to change the \r\n    batteries.',' ',' ',' ',' ',' ',1),
(122,2,13,'Zebronics Zeb-K25','Zeb Keyboard.png','zebronics-zeb-k25-original-imaf9uzubmzkq2hn.jpeg','zebronics-zeb-k25-original-imaf9v2cgvfdtwxx.jpeg','zebronics-zeb-k25-original-imaf97seddgzzthn.jpeg',379,10,'Wired USB Keyboard  (Black)','Highlights\r\n->Size: Standard\r\n->Interface: Wired USB\r\n\r\n\r\nZEB-K25 is a standard USB keyboard with 105 keys. It has a silent switch tactile feeling and comes with a copper cable and uv coated keys. Features: Standard keyboard, super slim design, spill-proof Comfortable and silent switch tactile feeling More than 1 million times of typing operations specification: Interface USB Installation Plug & Play Total keys 105 nos Compatible with Windows XP/Vista/7/8/10 Cable length 1.2m Dimension 410 × 118 × 21 mm Net. weight 346 g',' ',' ',' ',' ',' ',1),
(123,2,14,'HP K2500 Keyboard','HP.png','hp-k2500-wireless-keyboard-original-imafdb78x3dqzbm4.jpeg','HP.png','hp-k2500-wireless-keyboard-original-imafdb78x3dqzbm4.jpeg',899,10,'Wireless Keyboard(Black)','Highlights\r\n->Size: Standard\r\n->Interface: Wireless\r\n\r\n\r\nFull-sized performance with a full-sized wireless keyboard - HPs Keyboard K2500. Includes a full number pad, Windows 10 compatibility, and dedicated function keys. The basics you need, enhanced!',' ',' ',' ',' ',' ',1),
(124,2,13,'Dell KB 216 Keyboard','DellKB.png','Dellkb21d.png','DellKB.png','Dellkb21d.png',569,10,'Wired USB Keyboard(Black)','Highlights\r\n->Size: Standard\r\n->Interface: Wired USB\r\n->Multimedia Keys\r\n\r\n->Type fast and accomplish a number of tasks on your personal computer with the Dell \r\n    KB 216 Wired USB Desktop Keyboard. The full layout of this keyboard features chiclet- \r\n    style keys for comfortable and efficient typing.\r\n->Multimedia Keys for Quick Actions and Commands\r\n->The multimedia keys of this keyboard allow easy access to various functions, such as   \r\n    play, pause, rewind, fast-forward, and volume control.\r\n->Desk-centric Design\r\n->This is a compact full-size keyboard that features a number pad, and it is ideal for your \r\n    home and workplace. This is a durable computer accessory that is comfortable for \r\n    everyday use.\r\n',' ',' ',' ',' ',' ',1),
(125,5,12,'HP DeskJet 2131','61edE07ql-L._SL1500_.jpg','61qVpd8GcLL._SL1500_.jpg','61d78mD4zSL._SL1500_.jpg','printerinkjet.jpg',7800,10,'All-in-1 Inkjet Colour Printer&Black Ink Cartridge','HP DeskJet 2131 All-in-One Inkjet Colour Printer\r\nMake your everyday printing, scanning, and copying easy with an HP DeskJet all-in-one that simply works-right out of the box. Save money with optional high-yield ink cartridges. Plus, save space with an all-in-one designed to fit where you need it. Features Just what you need-right away Count on easy versatility. Print, scan, and copy what you need quickly with a reliable all-in-one. Easy from the start Get started in fewer steps. Easily set up this all-in-one to print, scan, and copy with simple controls. Save your space with a compact all-in-one designed to fit on your desk, on a shelf, or anywhere you need it. Tackle more tasks for less cash Print more for less, using the world\'s No. 1 printer brand plus Original HP ink cartridges. Full of value-print up to twice as many pages with Original HP high-yield ink cartridges. Reduce your impact Conserve resources-without sacrificing performance-using an all-in-one that\'s ENERGY STAR certified. Reduce your environmental impact. Count on easy, free cartridge recycling through HP Planet Partners.\r\n\r\nHP 803 Small Ink Cartridge (Black)\r\nHP 803 Black small Genuine cartridge',' ',' ',' ',' ',' ',1),
(126,5,12,'HP DeskJet 3835','71NDIx4M2ZL._SL1500_.jpg','715vyYVjD5L._SL1500_.jpg','71CsfhlxOEL._SL1500_.jpg','71huNZJ-71L._SL1500_.jpg',11000,10,'All-in-1 Ink Advantage Wireless Colour Printer ','Printer type - Ink Advantage; Functionality - All-in-One (print, scan, copy, fax); Printer Output - Colour\r\nConnectivity - Wi-Fi, USB, App; Display - 2.2 inch touch mono display; Mobile printing capability: HP ePrint, Apple airprint\r\nPages per minute - 8.5 (Black and White), 6 (Colour) , Cost per page - Rs 1.4 (Black and White). Rs 4.5 (Colour) - As per ISO standards\r\nIdeal usage - Home & Small Office, Regular usage (100-300 pages per month), Paper handling input standard - 60 sheet input tray\r\nPage size supported - A4, A6, B5, DL envelope; Duplex Print - Manual; 35-page Automatic Document Feeder; Print resolution - Up to 1200 x 1200 rendered DPI (Black and White), Up to 4800 x 1200 optimized DPI (Colour)\r\nCompatible Ink Cartridge - HP 680 Tri-Color & Black Original Ink Cartridges ; Page Yield - ~480 pages (Black & White), 150 pages (Colour) - ISO standards, Get 1 black & 1 tri-color basis cartridge with the printer\r\nDuty Cycle (Maximum monthly recommended prints) - Up to 1000 pages per month',' ',' ',' ',' ',' ',1),
(127,5,12,'HP Laserjet M1005','81hbr7TRyWL._SL1500_.jpg','71TjDb9A8bL._SL1500_.jpg','817TW1tPNuL._SL1500_.jpg','71N13skdNkL._SL1500_.jpg',11000,10,'Multifunction Monochrome Laser Printer&HP 12X Toner','Printer type - LaserJet; Functionality - Multi-Function (Print, Scan, Copy), Scanner type - Flatbed; Printer Output - Black & White only\r\nConnectivity - USB ; 2 inch LCD display\r\nPages per minute - 14 ; Cost per page - Rs 1.4 - As per ISO standards\r\nIdeal usage - Enterprise/Business, Frequent users (for fast, high quality printing)\r\nPage size supported - A4, A5, B5, C5, C6, DL, postcard ; Duplex Print - Manual ; Print resolution - Up to 600 x 600 DPI\r\nCompatible Laser Toner - HP 12A Black Original LaserJet Toner Cartridge, Page Yield - 2000 pages\r\nDuty Cycle (Maximum monthly recommended prints) - Up to 5,000 pages per month\r\nWarranty - 1 year from the date of purchase ; For any product related queries, kindly contact HP brand customer care on : [1800-2000-047]\r\nPower Input voltage: 110 to 127 VAC (+/- 10%), 50/60 Hz (+/- 2 Hz), 2.9 amp; 220 to 240 VAC (+/- 10%), 50/60 Hz (+/- 2 Hz), 2.5 amp, Power consumption (standby): 7 watts, Power consumption (active): 230 watts ; Operating Humidity range: 20 % - 70 % RH %',' ',' ',' ',' ',' ',1),
(128,5,12,'HP Deskjet 2621','71fUXW7ohCL._SL1500_.jpg','71EdTT6CB8L._SL1500_.jpg','81mtHhJkMkL._SL1500_.jpg','71dMOlJQXJL._SL1500_.jpg',12000,10,'All-in-1 Wireless Colour Printer with Voice-Activated Printing ','Printer Type - Inkjet; Functionality - All-in-One (Print, Scan, Copy); Printer Output - Colour\r\nVoice-Activated, Hands Free Printing- This printer has voice-activated printing feature which works with Alexa & Google Assistant. From shopping lists to crossword puzzles, use this HP printer to print with Alexa or Google Home\r\nPages per minute - 5.5 pages ; Cost per page - &#8377;4.8 (Black & White). &#8377;6.6 (Colour) - As per ISO standards\r\nIdeal usage - Home / Small Office, Low users (Less than 100 pages per month)\r\nPage size supported - A4, B5, A6, DL envelope ; Duplex Print - Manual ; Print resolution - Up to 1200 x 1200 rendered DPI (Black & White), Up to 4800 x 1200 optimised DPI (Colour)\r\nCompatible Ink Cartridge - HP 803 Tri-Color & Black Original Ink Cartridges ; Page Yield - ~190 pages (Black & White), 165 pages (Colour) - ISO standards, Get 1 black & 1 tri-color basis cartridge with the printer\r\nDuty Cycle (Maximum monthly recommended prints) - Up to 1,000 pages per month',' ',' ',' ',' ',' ',1),
(129,5,10,'Canon MG2570S','71RUKTgBGIL._SL1500_.jpg','61I4l3LyQ1L._SL1458_.jpg','616QAphXlfL._SL1340_.jpg','41TViuPd91L.jpg',11000,10,'All-in-1 Inkjet Colour Printer with Ink Cartridge','Printer Type - Inkjet; Functionality - All-in-One (Print, Scan, Copy), Scanner type - Flatbed ; Printer Output - Colour\r\nCompatibility (OS)- Windows XP, Windows Vista, Windows 7, Windows 8, Mac OS X v10.6.8 and later\r\nPages per minute - 8 pages (Black), 4 pages (Colour) ; Cost per page - Rs 5.3 (Black & White), Rs 7.8 (Colour) - As per ISO standards\r\nIdeal usage - Home & Small Office, Low usage ( less than 100 pages per month)\r\nPage size supported - 4.0\"x6.0\" till A4 / Letter / Legal ; Duplex Print - Manual ; Print resolution - 4800x600\r\nCompatible ink cartridge- PG 745s (Black)- 100 pages & CL 746s (Color)-100 pages, PG 745 (Black)- 180 pages & CL 746 (Color)-180 pages, PG 745XL (Black)- 300 pages & CL 746XL (Color)-300 pages (Yield mentioned as per ISO/IEC 24711. Values obtained by continuous printing mixed text and graphics on A4 plain paper. Includes 1 PG 745s (Black) & CL 746s (Color)\r\nWarranty - 1 year from the date of purchase',' ',' ',' ',' ',' ',1),
(130,5,10,'Canon Pixma G2012','71xhahrl1LL._SL1500_.jpg','61e7KTK0ygL._SL1500_.jpg','61wG2bgr-7L._SL1500_.jpg','81MdP-RbvJL._SL1500_.jpg',12000,10,'All-in-One Ink Tank Colour Printer','Printer Type - Ink Tank; Functionality - All-in-One (Print, Scan, Copy); Printer Output - Colour\r\nConnectivity - USB ; Display - LCD (1.2 inch segment mono) ; Compatibility - Windows 10, Windows 8.1, Windows 7 SP1. Note:Mac OS is not supported\r\n1.2 inch LCD diplay on printer(mono)\r\nPages per minute - 8.8 ipm (Black & White), 5 ipm (Colour), Cost per page - 9 paise (Black & White), 23 paise (Colour) - As per ISO standards\r\nIdeal usage - Home and Small office, Regular / Heavy usage (more than 300 pages per month)\r\nPage size supported - 4.0\"x6.0\" till A4 / Letter / Legal / A5 / B5 ; Duplex Print - No ; Print resolution - 4800 x 1200\r\nCompatible Ink Bottle - GI-790 (Black), GI-790 (Cyan, Magenta, Yellow); Page Yield - 7000 pages ; Comes with 2 extra bottles of GI790 ink (black) in the box, in addition to 1 each of cyan, yellow, magenta and black',' ',' ',' ',' ',' ',1),
(131,5,10,'Canon imageCLASS LBP2900B','61vqsui8a3L._SL1500_.jpg','61k-FLcySIL._SL1500_.jpg','61yzjYydS7L._SL1457_.jpg','61vqsui8a3L._SL1500_.jpg',10000,10,'Single Function Laser Monochrome Printer','Printer Type - Laser; Functionality - Single Function (Print only); Printer Output - Monochrome\r\nConnectivity - USB ; Operating system(s): Windows 10 (64-bit), 8.1 (64-bit), 8 (64-bit), 7 (64-bit), Vista (64-bit), XP (64-bit), Server 2008 (64-bit), Server 2008 R2 (64-bit), Server 2012 (64-bit), Server 2012 R2 (64-bit), Server 2016 (64-bit)\r\nPages per minute - 12 pages ; Cost per page - Rs 2.80\r\nIdeal usage - Home and Small office, Regular / Heavy usage, Recommended Monthly Print Volume: 200 - 800 pages\r\nPage size supported - A4, Letter ; Duplex Print - Manual ; Print resolution - 2400 x 600 dpi\r\nCompatible Toner - Cartridge 303, Page Yield - 2000 pages\r\nWarranty - 1 year from the date of purchase',' ',' ',' ',' ',' ',1),
(132,5,10,'Canon E410','71NaSuThPcL._SL1500_.jpg','61Et1sIa5OL._SL1500_ (1).jpg','51Pm-9RLQdL._SL1458_.jpg','61Et1sIa5OL._SL1500_.jpg',10000,10,'All-in-1 Inkjet Colour Printer with Ink Cartridge','Canon Pixma E410 All in One Inkjet Printer (Black)\r\nPIXMA E410 Affordable All-In-One Printer - Print, Scan, Copy - ISO Standard print speed (A4): up to 4.0ipm (colour) / 8.0ipm (mono) - Maximum Printing Resolution: 4800 (horizontal)*1 x 600 (vertical) dpi - Paper Size: A4, A5, B5, Letter, Legal, 4 x 6\", 5 x 7\", Envelopes (DL, COM10), Custom size (width 101.6 - 215.9mm, length 152.4 - 676mm) - Scanner Type: Flatbed - Scanning Method: CIS (Contact Image Sensor) COPY: - Maximum Document Size: A4 / Letter (216 x 297mm) - Image Quality: Plain Paper: Draft, Standard - Copy Speed: Document: Colour: Simplex: Approx.: 30sec, - Multiple Copy: Black / Colour: 1 - 21 pages SIZE: Dimension (W x D x H): Approx. 426 x 306 x 145mm Weight: Approx. 3.4kg\r\n\r\nCanon CL57s Ink Cartridge\r\nCanon CL57s Ink Cartridge designed to work with a range of Canon PIXMA E400 E410 E417 E460 E470 E477 E480 E3170 E3177 Printers\r\n\r\nCanon PG-47 Ink Cartridge (Black)\r\ncanon black ink cartridge use in e 400 printe',' ',' ',' ',' ',' ',1),
(133,5,11,'Epson EcoTank L3150','51pk5I2MPBL._SL1000_.jpg','51w1bMz2sqL._SL1000_.jpg','61eMGsAfAWL._SL1134_.jpg','71CxG4PhcTL._SL1500_.jpg',10000,10,'Wi-Fi All-in-One Ink Tank Printer','Printer Type - Ink Tank; Functionality - All-in-One (Print, Scan, Copy) , Scanner type - Flatbed; Printer Output - Colour\r\nConnectivity - Wi-Fi, USB, App\r\nPages per minute - 33 pages (Black & White), 15 pages (Colour) ; Cost per page - 7 paise (Black & White), 18 paise (Colour) - As per ISO standards\r\nIdeal usage - Home and Small office, Regular / Heavy usage (more than 300 pages per month)\r\nPage size supported - A4, A5, A6, B5, C6, DL ; Duplex Print - Manual ; Print resolution - 5760 x 1440\r\nCompatible Ink Bottle - T003 (Black), T003 (Cyan), T003 (Magenta), T003 (Yellow) ; Page Yield - 4500 pages (Black & White), 7500 pages (Colour) ; Comes with 4 original Epson Ink Bottle (one of each colour - Bk, C, M, Y) inside the box\r\nWarranty - 1 year or 30,000 pages whichever is earlier on-site warranty from the date of purchase',' ',' ',' ',' ',' ',1),
(134,5,11,'Epson L130','71FDAbUf9VL._SL1500_.jpg','81fvXVcVdXL._SL1500_.jpg','81g7Fx9uo9L._SL1500_.jpg','71qFFLVkuWL._SL1500_.jpg',10000,10,'Single-Function Ink Tank Colour Printer','Printer Type - Ink Tank; Functionality - Single Function (Print only); Printer Output - Colour\r\nConnectivity Standard -USB - Compatible with the USB 2.0 Specification ; Hassle-free and Easy to Use: The L130 allows for easy, mess-free refills. It is equipped with special tubes inside to ensure smooth and reliable ink flow at all times\r\nPages per minute - 27 pages (Black & White), 15 pages (Colour) ; Cost per page - 7 paise (Black & White), 18 paise (Colour) - As per ISO standards\r\nPrint speed up to 4.5 ipm for colour and 8.5 ipm for black-and-white, Impressive Print Speed\r\nPage size supported - A4, A5, A6, B5, C6, DL ; Duplex Print - Manual ; Print resolution - 5760 x 1440 and Ideal usage - Home and Small office, Regular / Heavy usage (more than 300 pages per month)\r\nCompatible Ink Bottle - T6641 (Black), T6642 (Cyan), T6643 (Magenta), T6644 (Yellow) , Page Yield - 4500 pages (Black & White), 7500 pages (Colour) , Comes with 4*70 ml original Epson Ink Bottle (one of each colour - Bk, C, M, Y) inside the box\r\nWarranty - 1 year or 15,000 pages whichever is earlier on-site warranty from the date of purchase',' ',' ',' ',' ',' ',1),
(135,5,11,'Epson L805','71Nd2lLIrrL._SL1500_.jpg','717zuMgs8IL._SL1500_.jpg','71VXp8BE5AL._SL1500_.jpg','81XVM59j7VL._SL1500_.jpg',10000,10,'Single-Function Wireless Ink Tank Colour Photo Printer','Printer Type - InkTank; Functionality - Single Function (Print only); Printer Output - Colour, Borderless Printing\r\nConnectivity - Wi-Fi, USB, Epson iPrint App ; Noise Level:- PC Printing / PGPP Best Photo: 5.1 B(A), 36 dB(A), PC Printing / Plain Paper Default *3: 6.0 B(A), 48 dB(A) ; Supported OS: Windows XP / Vista / 7 / 8 / 8.1 / 10, Mac OS X 10.6.8 or later\r\nCompatible Ink Bottle - T673 (Black, Cyan, Magenta, Yellow, Light Magenta, Light Cyan) ; Page Yield - 1800 R4 photos - As per ISO standards\r\nWarranty - 1 year from the date of purchase\r\nPages per minute - 5 ; Cost per page - 2 Rs per photo (Colour) - As per ISO standards\r\nPage size supported - A4, A5, A6, B5, Letter, Legal, DL, Envelopes ; Duplex Print - Manual ; Print resolution - 5,760 x 1,440 dpi\r\nIdeal usage - Photo printing, regular usage\r\nWarranty Details: 1 year manufacturer warranty from the date of purchase',' ',' ',' ',' ',' ',1),
(136,5,11,'Epson L4160 ','51YphVmEMsL._SL1000_.jpg','41Jkg2rfRQL.jpg','61IDpHzZvWL._SL1200_.jpg','31ZqMnbFqGL.jpg',10000,10,'Wi-Fi Duplex All-in-One Ink Tank Printer','Print, scan, and copy - do all your printing tasks in a jiffy with this Epson multi-function printer. With an impressive range of features like Low-cost Printing and its Seamless Connectivity, this printer will help you print letters, reports, and photos with excellent quality. With a cost of 12 paise (black) and 20 paise (color) per print, this printer will help you save money with each printout. You can also print on both sides, saving paper and ink cost, thanks to the Auto-duplex mode. With a Micro Piezo printhead, this printer delivers up to 33 pages per minute. To top it off, it can print up to 7500 pages (black) and 6000 pages (color) per refill. Its wifi connectivity will help you with mobile and shared printings, while the Wifi Direct lets you print from up to four devices without a router. It also features iPrint, Email Print Driver, Remote Print Driver and Scan to Cloud, adding to its convenience.',' ',' ',' ',' ',' ',1),
(137,7,15,'SanDisk Ultra Pen Drive','51MB+hgqK3L._SL1120_.jpg','61aAwZ1S4fL._SL1500_.jpg','61mMqVUNjYL._SL1500_.jpg','61nOAc7VSwL._SL1500_.jpg',630,10,'Dual 32GB USB 3.0 OTG ','The SanDisk Ultra Dual Drive m3.0 makes it easy to transfer content from your phone to your computer. With a micro-USB connector on one end and a USB 3.0 connector on the other, the drive lets you move content easily between your devices-from your AndroidTM smartphone or tablet to your laptop, PC or Mac computer1. The USB 3.0 connector is high-performance and backward-compatible with USB 2.0 ports. The SanDisk Memory Zone app2 for Android (available on Google Play) helps you manage your device\'s memory.\r\nTechnical Specification:\r\n\r\nInterface: Interface: micro-USB and USB 3.0 connectors.\r\nRetractable design with dual micro-USB and USB 3.0 connectors\r\nHigh-speed USB 3.0 performance with up to 130mbps file transfer from drive to computer\r\n5 years limited warranty',' ',' ',' ',' ',' ',1),
(138,7,15,' HP x740w Pendrive','717MaBw+wuL._SL1500_.jpg','71EOwSt6f6L._SL1500_.jpg','717MaBw+wuL._SL1500_ (1).jpg','81Gqak8QlvL._SL1500_.jpg',520,10,'32 GB USB Flash Drive (Gray)','Featuring a cap-less design with metal housing, the HP USB 3.0 Flash Drive x740w offers intelligent storage in a sleek and a stylish design. Store all of your documents, pictures, video clips, MP3 files and more. Take it with you everywhere, wherever you go.\r\n\r\nSumple&robust metal mechanism provide great protection against scratches\r\n\r\nWarranty Details: 2 years warranty.',' ',' ',' ',' ',' ',1),
(139,7,15,'SanDisk Cruzer Blade Pendrive','61PVIzk6ALL._SL1104_.jpg','61tHDpsfGUL._SL1200_.jpg','61PVIzk6ALL._SL1104_ (1).jpg','51L2-bdRNRL.jpg',320,10,'SDCZ50-016G-135 16GB USB 2.0 Pen Drive','Product description The SanDisk 16GB Cruzer Blade USB Flash Drive from SanDisk is a compact, portable USB flash drive. It allows you to carry and transfer files on the go like photos, videos or music files to share with family and friends. Easily share files between computers with this convenient USB flash drive. From the Manufacturer Generous Capacity with Compact and Upscale Design SanDisk Cruzer Blade 16GB USB 2.0 flash drive boasts a classy compact design featuring a large data storage capacity. Now you can conveniently backup, transfer, share and carry your favourite media like movies, music, video clips or pictures with you everywhere you go. The pocket-size design of the SanDisk 16GB pendrive facilitates easy and comfortable portability letting you carry your personal data with you to school or work, while its built-in SanDisk Secure Access software keeps any unauthorised access of your personal data at bay by enabling you to store your files in a password-protected folder. SanDisk Cruzer Blade is an excellent choice for users looking for a storage option to carry their important data with them even while on the move. Just Drag-and-Drop to Backup Your Data We all love to carry our stuff with us everywhere we go. From our favourite music to an important office presentation, portability of data is a necessity in today\'s fast-moving world. With the SanDisk Cruzer Blade Flash Drive, transferring data onto it is a breeze. The SanDisk 16GB flash drive comes with a simple Drag-and-Drop feature, which lets you drag-and-drop files into your drive conveniently after plugging it into the USB port of your laptop or desktop. After a quick, one-time driver download, you can easily store, share and transfer your personal data in a flash. Capacity: 16GB Interface: USB v2.0 Security: Password protected folder, 128-bit AES Encryption\r\n\r\nStore more with capacities up to 16gb 5-year limited warranty. Opening Mechanism: Capless',' ',' ',' ',' ',' ',1),
(140,7,15,'HP HPFD302M','717bk0oyWfL._SL1500_.jpg','71zZGNt9pZL._SL1500_.jpg','71zSa2hT9WL._SL1500_.jpg','61N1hERkftL._SL1500_.jpg',1299,10,'64GB OTG Flash Drive (Sliver)','Steel design\r\nStore, share and transfer music, videos and more\r\nOTG flash drive easily transfer between phones and computers\r\nDurable casing free space for your phones\r\nInterface: USB 3.1',' ',' ',' ',' ',' ',1),
(141,7,15,'Strontium Ammo Pendrive','51-8hRfZcDL._SL1000_.jpg','41-1Q5oq1HL.jpg','51is0nij6bL._SL1000_.jpg','51505PzL+hL.jpg',430,10,'32GB 2.0 USB Pen Drive (Silver)','Strontium AMMO USB Flash Drive is a true beauty clad in a robust body with shiny metal finishing. With its sleek and lightweight body, it provides extreme convenience to users as they carry their music, photos, videos and other data around with ease. Furthermore, every AMMO Silver USB comes with a free metal key chain. Crafted with extreme care and excellent workmanship, this unique USB flash drive is certainly an object of desire for all users.\r\n\r\nHigh Speed Data Transfer Performance\r\nUltra-Thin and Sleek Form Factor\r\nHighest Quality Flash Memory Component for Maximum Reliability and Fast Data Transmission\r\nCompatibility: USB 3.1 (backward compatible with USB 3.0 & 2.0) ; Opening Mechanism: Capless ; Supported OS: Windows, Mac OS X, Linux\r\nSupport plug and play',' ',' ',' ',' ',' ',1),
(142,7,16,'Time Office Biometric Machine','71+EguQyTLL._SL1500_.jpg','71RjdgDjIcL._SL1500_.jpg','71qSxQdzpYL._SL1500_.jpg','716fks91nBL._SL1500_.jpg',2899,10,'Fingerprint and Card Based Biometric Attendance System with Excel Report from Device(Black)','1000 Fingerprint/Card/Password Capacity\r\n600 DPI Fingerprint Sensor\r\nDirect Excel Report from device\r\n2.4\" TFT Color Display with LED and Voice Indication\r\nUSB Port\r\nItem model number: Z69\r\nASIN: B0839LSH47',' ',' ',' ',' ',' ',1),
(143,7,15,'Sony USM64GR 64GB','81-h289zZSL._SL1500_.jpg','81-h289zZSL._SL1500_ (1).jpg','81R7jLDCAHL._SL1500_ (1).jpg','81R7jLDCAHL._SL1500_.jpg',730,10,'64GB Classic Pen Drive (Black)','Easy Use- simple plug, drag and drop functionality\r\nCompact and stylish design with a retractable connector\r\nLarge strap hole\r\nCapacity- 64GB, Black Color\r\nCompatible with laptop, computer and Tablet\r\nFree software downloads: Recover damaged files with File Rescue',' ',' ',' ',' ',' ',1),
(144,7,15,'Strontium Nitro Pendrive','5174bRU0zHL._SL1000_.jpg','51-aYtWgblL._SL1000_.jpg','51NJ6cJ0yML._SL1000_.jpg','61hwR2iZTFL._SL1000_.jpg',390,10,'16Gb One OTG 3.1 150 MBPS (Grey)','Dual interface support - Micro USB (Type B) ports on smartphones and tablets, USB 3.1 (Type A) ports on computers and laptops, backwards compatible with standard USB 3.0 2.0 ports\r\nUp To 100MB/s transfer rate, greatly reduces your waiting time when moving large sized files\r\nProtective cap with bead chain included for the Micro USB connector, keep it safe and clean\r\nPeace of mind ? Strontium 5 years warranty',' ',' ',' ',' ',' ',1),
(145,7,15,'SanDisk SDDD3-032G-I35GW','81YWBcTx14L._SL1500_ (1).jpg','711vo2Oe4qL._SL1500_.jpg','81YWBcTx14L._SL1500_.jpg','51mJtNP4LOL.jpg',590,10,'Ultra Dual 32GB USB 3.0 OTG Pen Drive (Gold)','Free up space on your OTG-enabled Android phone\r\nBack up your mobile photos, videos and contacts. Storage temperature- 50° - 158° F (-10° ? 70° C). Operational temperature-32° - 113° F (0° ? 45° C)\r\nRetractable design with dual micro-USB and USB 3.0 connectors\r\nHigh-speed USB 3.0 performance with up to 130mbps file transfer from drive to computer\r\nSanDisk Memory Zone application (available on Google Play) lets you easily manage your photos and videos\r\n\r\n5 Year Warranty',' ',' ',' ',' ',' ',1),
(146,7,16,'ZKTeco Biometric','91ZjbqSUSNL._SL1500_.jpg','810CmtW4TYL._SL1500_.jpg','814qtXY5n7L._SL1500_.jpg','81s6gQNwYiL._SL1500_.jpg',7800,10,'Fingerprint Recorder Employee Attendance Time Clock + ID Card Reader + TCP/IP + USB','With SilkID fingerprint reader and innovative fingerprint verification algorithm, SilkFP-100TA is able to precisely identify wet, dry and rough fingers, and operate under strong light source. Infrared sensation technology enables accurate sensing of fingerprint to be activated to save power. New hardware platform, human-computer interface, and trendy UI design provide new yet simple and friendly experience.\r\n\r\nProduct features\r\n\r\n&#9733;USB client & host\r\n&#9733;Stable operation under strong light source\r\n&#9733;Quick recognition of dry, wet and rough fingers\r\n&#9733;Intuitive and stunning UI designed with the most popular and internationalized factor\r\n&#9733;Faster matching speed: Less than 1 second\r\n&#9733;Build-in SSR Excel software, Shift and Report management\r\n\r\nspecification\r\n*Fingerprint capacity:3000\r\n*Record Capacity:100000\r\n*Display:2.8-inch TFT Screen\r\n*Communication:TCP/IP, USB(Host and Client)\r\n*Operating Temp:0 °C- 45 °C\r\n*Dimensions:180.0 x132x 32(W x H x D mm)\r\n*Standard Function:Webserver, Work Code, SMS, DST, Scheduled-bell,\r\nSelf-Service Query Automatic Status Switch',' ',' ',' ',' ',' ',1),
(147,7,16,'e-Time office Biometric','41wgoeJQUoL.jpg','51-gtl-b0DL._SL1280_.jpg','61CvsSLr74L._SL1280_.jpg','61fTyGQUb8L._SL1280_.jpg',8900,10,'Face Attendance Machine Z500v2 with 10 RFID Cards Use with Face, Finger, Card, Password','FACE RECOGNISATION\r\nFINGER RECOGNISATION\r\nBATTERY BACKUP 1 HOUR\r\nSOFTWARE SUPPORT\r\n3,00,000 TRANSACTION DATA\r\n\r\nWarranty Details: \r\nATTENDACE MACHINE WARRANTY 1 YEAR, CHARGER OR POWER CABLE 6 MONTHS ,WRONG INSTALLATION DOES NOT COVER WARRANTY.',' ',' ',' ',' ',' ',1),
(148,7,16,'MME Biometrics','41IFgt05csL.jpg','41ybI7VAinL.jpg','31TcvuYSTqL.jpg','51YEQMoITZL._SL1071_.jpg',5700,10,'Watchman USB Biometric Fingerprint Attendance Machine (Report Through Excel or Software)','Strictly follow the national security product standard. Suitable for the entrances and exits of office, factory, hotel, school\r\nEasy to learn, once enroll the fingerprint, you can share it on other 5YA01 terminals\r\nColor Screen Fingerprint Time Attendance Authentication method Fingerprint\r\nAdopting the Energy-saving fingerprint sensor and power management function, makes the product perfect',' ',' ',' ',' ',' ',1),
(149,7,16,'ZKTeco Biometric','91yY4L2jmML._SL1500_.jpg','814kVgIBi0L._SL1500_.jpg','913J5hVIfCL._SL1500_.jpg','91ZmKrr5FnL._SL1500_.jpg',2700,10,'Fingerprint Time Attendance Clock Employee Checking-in Recorder with Build-in SSR Excel Software (Silver)','Fingerprint Reader?New generation fingerprint sensor,T9 input,especially with 2.8 inches TFT display, vivid interface for fingerprint imagequality and verification result ect\r\nTime Clock Capacity?User Capacity:500;Fingerprint Capacity:500; Transaction:50000;Dimension(W*H*T):180*132*32mm? Time Clock Capacity?User Capacity:500;Fingerprint Capacity:500; Transaction:50000;Dimension(W*H*T):180*132*32mm\r\nSSR Function?Self-Service-Recorder stored (SSR report) in the time clock, which is applicable to small chainstores,small business ect.Employee\' s information can be redacted in excel format\r\nUSB Host/Client?You can download and upload report with USB Host/Client\r\nEasy to Set?With simple and customizable features, you can easily set up the LX50 Electronic Time attendance to meet your business needs.Please know that it can not be set overnight shift ,any problems please feel free to contact us',' ',' ',' ',' ',' ',1),
(150,7,16,'ESSL Biometrics','51muZqMus4L._SL1000_ (2).jpg','51muZqMus4L._SL1000_ (3).jpg','51muZqMus4L._SL1000_.jpg','51muZqMus4L._SL1000_ (1).jpg',9700,10,'Standalone Biometric Fingerprint Time and Attendance System','Attendance management\r\nAccess control\r\nCard based attendance\r\nDoor lock system\r\nPush data',' ',' ',' ',' ',' ',1),
(151,7,16,'ZKTeco Fingerprint Biometrics','61uHNh1P40L._SL1000_.jpg','41S3C8BeLfL.jpg','71WTDj7vOxL._SL1500_.jpg','81GCqt4iDXL._SL1500_.jpg',4899,10,'Fingerprint Attendance Machine Biometric Time Clock for Employee','&#12304;Stable operation of the fingerprint sensor&#12305;&#65306; Bio ID fingerprint Sensor ensures stable operation under strong light source and infrared auto-turning on function. It can also support quick recognition of dry, wet and rough fingers\r\n&#12304;Build-in SSR Excel software&#12305;: No other complicated software needed and extra long-term license fee.It has built-in software which enables you to set shift /upload users? information/download report via USB flash drive in excel format\r\n&#12304;USB client & host Communication Method&#12305;:This ultra-thin design attendance machine supports to download the report by inserting USB-Disks and finish the downloading in less than 8 seconds\r\n&#12304;Important Notes&#12305;:With simple and customized features, you can easily set up the Time Clock to meet your business needs.Please be informed that it can?t support overnight shift or two breaks in a working day,any problems please feel free to contact us customer service',' ',' ',' ',' ',' ',1),
(152,7,16,'Realtime Eco Biometrics','71zd43Nc+6L._SL1100_ (1).jpg','61SoqGPestL._SL1100_.jpg','71zd43Nc+6L._SL1100_.jpg','61SoqGPestL._SL1100_ (1).jpg',3400,10,'Biometric Attendance Systems with USB Excel (Black)','Package Contains : 1 Pcs. BioMetric attendance Machine\r\nScreen : 2.4 inches (Color Display) Fingerprint Users: 1,000 X Card User: 1,000 X Password User: 1,000 X Attendance Records:100,000\r\nFingerprint Verification Mode: 1:1, 1: N Fingerprint Sensor\r\nAuthentication Methods - Fingerprint, Password, RF Card Password\r\nOperation - offline',' ',' ',' ',' ',' ',1);

/*Table structure for table `rating_table` */

DROP TABLE IF EXISTS `rating_table`;

CREATE TABLE `rating_table` (
  `rate_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(3) NOT NULL,
  `op_id` int(3) NOT NULL,
  `userorder_id` varchar(30) NOT NULL,
  `product_id` int(3) NOT NULL,
  `rating` int(5) NOT NULL,
  `isActive` int(1) NOT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `op_id` (`op_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rating_table_ibfk_1` FOREIGN KEY (`op_id`) REFERENCES `op_table` (`op_id`),
  CONSTRAINT `rating_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`productid`),
  CONSTRAINT `rating_table_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `rating_table` */

insert  into `rating_table`(`rate_id`,`user_id`,`op_id`,`userorder_id`,`product_id`,`rating`,`isActive`) values 
(5,5,20,'55T5TE',106,4,1);

/*Table structure for table `rentorder_table` */

DROP TABLE IF EXISTS `rentorder_table`;

CREATE TABLE `rentorder_table` (
  `rentorder_id` int(3) NOT NULL AUTO_INCREMENT,
  `rentprodid` int(3) NOT NULL,
  `rate_per_day` float NOT NULL,
  `quantity` int(3) NOT NULL,
  `duration` int(2) NOT NULL,
  `totalamt` float NOT NULL,
  `deposite` float NOT NULL,
  `book_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` int(3) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `address` varchar(200) NOT NULL,
  `isActive` int(1) NOT NULL,
  PRIMARY KEY (`rentorder_id`),
  KEY `rentprodid` (`rentprodid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rentorder_table_ibfk_1` FOREIGN KEY (`rentprodid`) REFERENCES `rentproduct_table` (`rentprodid`),
  CONSTRAINT `rentorder_table_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rentorder_table` */

/*Table structure for table `rentordercancel_table` */

DROP TABLE IF EXISTS `rentordercancel_table`;

CREATE TABLE `rentordercancel_table` (
  `roc_id` int(3) NOT NULL AUTO_INCREMENT,
  `orp_id` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `rentprodid` int(3) NOT NULL,
  `urorder_id` varchar(30) NOT NULL,
  `reason` varchar(30) NOT NULL,
  `doi` date DEFAULT NULL,
  `dou` date DEFAULT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`roc_id`),
  KEY `orp_id` (`orp_id`),
  KEY `user_id` (`user_id`),
  KEY `rentprodid` (`rentprodid`),
  CONSTRAINT `rentordercancel_table_ibfk_1` FOREIGN KEY (`orp_id`) REFERENCES `orp_table` (`orp_id`),
  CONSTRAINT `rentordercancel_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`),
  CONSTRAINT `rentordercancel_table_ibfk_3` FOREIGN KEY (`rentprodid`) REFERENCES `rentproduct_table` (`rentprodid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rentordercancel_table` */

/*Table structure for table `rentproduct_table` */

DROP TABLE IF EXISTS `rentproduct_table`;

CREATE TABLE `rentproduct_table` (
  `rentprodid` int(3) NOT NULL AUTO_INCREMENT,
  `rentprodname` varchar(50) NOT NULL,
  `rentprodphoto1` varchar(150) NOT NULL,
  `rentprodphoto2` varchar(150) DEFAULT NULL,
  `rentprodprice` float NOT NULL,
  `rentprodqty` int(3) NOT NULL,
  `rentprodspecification` varchar(200) NOT NULL,
  `rentproddescription` varchar(2500) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`rentprodid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `rentproduct_table` */

insert  into `rentproduct_table`(`rentprodid`,`rentprodname`,`rentprodphoto1`,`rentprodphoto2`,`rentprodprice`,`rentprodqty`,`rentprodspecification`,`rentproddescription`,`isActive`) values 
(3,'DELL LATIUDE E5430','laptop-.jpg','laptop-on-rent.jpg',1300,10,'Intel Core i5 (3rd Gen) ','2.6 GHz\r\n4GB RAM\r\n3200 GB Hard Disk\r\nMicrosoft Windows 7 Professional 64-bit Edition\r\n\r\nMinimum Order Quantity	1 laptop',1),
(4,'HP ZBook 17','hp-zbook-17-high.jpg','hp-zbook-17-high-rental-lapto.jpg',4150,10,'Intel Core i7-7820HQ (7th Gen)','2.9 GHz\r\n16 GB RAM\r\n1 TB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows \r\n\r\nMinimum Order Quantity	1 laptop',1),
(5,'Asus Gaming','gaming-laptop-rent.jpg','gaming-laptop-rent.jpg',3950,10,'Core I7 HQ Series','16 GB RAM1 TB Hard DiskScreen Size: 15.6',1),
(6,'Dell Latitude E7440','dell-latitude-e7440-.jpg','dell-latitude-e7440-.jpg',2150,10,'Core i5','4 GB RAM\r\n256 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 8\r\n\r\nMinimum Order Quantity	1 laptop',1),
(7,'Lenovo Legion','graphic-laptop-on-re.jpg','graphic-laptop-on-re.jpg',4760,10,'I7 Performance Series','16 GB RAM\r\n500 GB HDD\r\n256 GB SSD\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 10\r\nNext Generation Processor / Dedicated Graphic Engine / Superfast storage / Harman speaker\r\n\r\nMinimum Order Quantity	1 laptop',1),
(8,'Acer ','laptop-rental-triv.jpg','laptop-rental-triv.jpg',1200,10,'Core i3','4 GB RAM\r\n256 GB Hard Disk\r\nScreen Size: 15.\"\r\nMicrosoft Windows 8\r\n\r\nMinimum Order Quantity	1 laptop',1),
(9,'Dell Alienware','graphic-laptop-on-.jpg','graphic-laptop-on-.jpg',9500,10,'Intel i7','32 GB RAM\r\n1 TB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 8\r\n\r\nMinimum Order Quantity	1 laptop',1),
(10,'Dell Latitude ','laptop-hiring-renta.jpg','laptop-hiring-renta.jpg',1600,10,'Core i3','4 GB RAM\r\n256 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 10\r\n\r\nMinimum Order Quantity	1 laptop',1),
(11,'HP Pavalion','lapto.jpg','img-20180215-wa000.jpg',1570,10,'i5','4 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 8\r\n\r\nMinimum Order Quantity	1 laptop',1),
(12,'Dell ','laptop-on-rent-2.jpg','download-500.jpg',1900,10,'Core i5','4 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 12\"\r\nMicrosoft Windows 8\r\n\r\nMinimum Order Quantity	1 laptop',1),
(13,'Dell Optiplex','desktop-rental-servx500.jpg','desktop-rental-servx500.jpg',1200,10,'Core i3','4 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 18\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 laptop',1),
(14,'Lenovo All-in-One','desktop-rental-allinon0.jpg','desktop-rental-allin0.jpeg',1600,10,'Core i5','4 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 10\r\n\r\nMinimum Order Quantity	1 laptop',1),
(15,'Dell Computer','desktops-rental-servic0.jpg','desktops-rental-servic0.jpg',1400,10,'Core i5','4 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 18.6\"\r\nMicrosoft Windows 10\r\n\r\nMinimum Order Quantity	1 PC',1),
(16,'Desktop ','desktop-rental-ser0.jpg','desktop-rental-ser0.jpg',1000,10,'Core i3','2 GB RAM\r\n160 GB Hard Disk\r\nScreen Size: 16\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 PC',1),
(17,'Dell Desktop','1-20.jpg','1-20.jpg',1200,10,'Core i3','2 GB RAM\r\n320 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 PC',1),
(18,'Lenovo Desktop','lenovo-4.jpg','lenovo-4.jpg',1300,10,'Core i3','2 GB RAM\r\n160 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 PC',1),
(19,'Lenovo PC M82','1544218612.94-thumb.jpg','1544218612.94-thumb.jpg',1300,10,'Core i3','2 GB RAM\r\n320 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 PC',1),
(20,'HP Elitedesk 800 G1','hp-800g1-desk.jpg','hp-800g1-desk.jpg',1500,10,'Core i3','4 GB RAM\r\n500 GB Hard Disk\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 PC',1),
(21,'Lenovo Desktop','desktop-rental-250x250.jpg','desktop-rental-250x250.jpg',1200,10,'Core i3','2 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 15.6\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 pc',1),
(22,'HP Desktop','desktop-on-ren0.jpeg','desktop-on-ren0.jpeg',1800,10,'Core i5','4 GB RAM\r\n500 GB Hard Disk\r\nScreen Size: 18.5\"\r\nMicrosoft Windows 7\r\n\r\nMinimum Order Quantity	1 PC',1);

/*Table structure for table `state_table` */

DROP TABLE IF EXISTS `state_table`;

CREATE TABLE `state_table` (
  `state_id` int(3) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(30) NOT NULL,
  `isActive` int(1) NOT NULL,
  `doi` datetime DEFAULT NULL,
  `dou` datetime DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `state_table` */

insert  into `state_table`(`state_id`,`state_name`,`isActive`,`doi`,`dou`) values 
(2,'Gujarat',1,'2020-03-03 16:18:07','2020-03-03 16:18:07'),
(3,'Mumbai',0,'2020-03-15 22:16:38','2020-03-15 22:16:38'),
(4,'Goa',1,'2020-03-17 17:26:29','2020-03-17 17:26:29');

/*Table structure for table `subcategory_table` */

DROP TABLE IF EXISTS `subcategory_table`;

CREATE TABLE `subcategory_table` (
  `subcatid` int(3) NOT NULL AUTO_INCREMENT,
  `maincatid` int(3) NOT NULL,
  `subcatname` varchar(30) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  PRIMARY KEY (`subcatid`),
  KEY `maincatid` (`maincatid`),
  CONSTRAINT `subcategory_table_ibfk_1` FOREIGN KEY (`maincatid`) REFERENCES `maincategory_table` (`maincatid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `subcategory_table` */

insert  into `subcategory_table`(`subcatid`,`maincatid`,`subcatname`,`isActive`) values 
(1,1,'ACER',1),
(2,1,'ASUS',1),
(3,1,'DELL',1),
(4,1,'HP',1),
(5,1,'LENOVO',1),
(6,4,'CP PLUS',1),
(7,4,'DAHUA',1),
(8,4,'HIKVISION',1),
(9,4,'MI',1),
(10,5,'CANON',1),
(11,5,'EPSON',1),
(12,5,'HP',1),
(13,2,'Wired',1),
(14,2,'Wireless',1),
(15,7,'Pendrive',1),
(16,7,'Biometrics',1);

/*Table structure for table `user_table` */

DROP TABLE IF EXISTS `user_table`;

CREATE TABLE `user_table` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `cpassword` varchar(20) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `address` varchar(200) NOT NULL,
  `area` int(3) NOT NULL,
  `city` int(3) NOT NULL,
  `state` int(3) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `isActive` int(1) DEFAULT NULL,
  `doi` datetime DEFAULT NULL,
  `dou` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `area` (`area`),
  KEY `city` (`city`),
  KEY `state` (`state`),
  CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`area`) REFERENCES `area_table` (`area_id`),
  CONSTRAINT `user_table_ibfk_2` FOREIGN KEY (`city`) REFERENCES `city_table` (`city_id`),
  CONSTRAINT `user_table_ibfk_3` FOREIGN KEY (`state`) REFERENCES `state_table` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `user_table` */

insert  into `user_table`(`user_id`,`user_name`,`password`,`cpassword`,`email`,`mobile_no`,`address`,`area`,`city`,`state`,`photo`,`isActive`,`doi`,`dou`) values 
(3,'Akshit Mokani','SAQ1JUJR','SAQ1JUJR','mokaniakshit@gmail.com',7383736871,'Jivraj, Ahmedabad',3,4,2,'IMG_3182.JPG',1,'2020-03-12 00:00:00','2020-03-12 00:00:00'),
(4,'Ruhi  Vora','kxio8109','kxio8109','ruhivohra3012@gmail.com',9870033085,'Maninagar',3,4,2,'IMG-20190413-WA0039.jpg',1,'2020-07-08 15:25:00','2020-07-08 15:25:00'),
(5,'Krishna Makwana','akolifq098','akolifq098','krishnarmakwana7312@gmail.com',9106673798,'Baherampura, Ahmedabad-22',2,4,2,'Capture.PNG',1,'2020-07-08 18:22:13','2020-07-08 18:22:13');

/*Table structure for table `wishlist_table` */

DROP TABLE IF EXISTS `wishlist_table`;

CREATE TABLE `wishlist_table` (
  `wishlist_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_id` int(3) DEFAULT NULL,
  `productid` int(3) NOT NULL,
  `is_Active` int(1) DEFAULT NULL,
  `doi` datetime DEFAULT NULL,
  `dou` datetime DEFAULT NULL,
  PRIMARY KEY (`wishlist_id`),
  KEY `productid` (`productid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wishlist_table_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product_table` (`productid`),
  CONSTRAINT `wishlist_table_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wishlist_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
