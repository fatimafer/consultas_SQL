-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ricos01
-- ------------------------------------------------------
-- Server version	8.0.32
DROP DATABASE IF EXISTS ricos01;
CREATE DATABASE ricos01 CHARACTER SET utf8mb4;
USE ricos01;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ricos`
--

DROP TABLE IF EXISTS `ricos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ricos` (
  `Rank` int DEFAULT NULL,
  `Name` text,
  `net_worth` double DEFAULT NULL,
  `Country` text,
  `Industry` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricos`
--

LOCK TABLES `ricos` WRITE;
/*!40000 ALTER TABLE `ricos` DISABLE KEYS */;
INSERT INTO `ricos` VALUES (1,'Jeff Bezos',188,'United States','Technology'),(2,'Elon Musk',170,'United States','Technology'),(3,'Bernard Arnault',155,'France','Consumer'),(4,'Bill Gates',144,'United States','Technology'),(5,'Mark Zuckerberg',114,'United States','Technology'),(6,'Warren Buffett',108,'United States','Diversified'),(7,'Larry Page',104,'United States','Technology'),(8,'Sergey Brin',101,'United States','Technology'),(9,'Larry Ellison',90.6,'United States','Technology'),(10,'Steve Ballmer',89.1,'United States','Technology'),(11,'Francoise Bettencourt Meyers',83.9,'France','Consumer'),(12,'Amancio Ortega',79.3,'Spain ','Retail'),(13,'Mukesh Ambani',74.1,'India','Energy'),(14,'Charles Koch',64.3,'United States','Industrial'),(15,'Julia Flesher Koch & Family',64.3,'United States','Industrial'),(16,'Zhong Shanshan',63.8,'China','Diversified'),(17,'Gautam Adani',62.8,'India','Industrial'),(18,'Jim Walton',62,'United States','Retail'),(19,'Rob Walton',61.5,'United States','Retail'),(20,'Alice Walton',60.1,'United States','Retail'),(21,'Ma Huateng',58.4,'China','Technology'),(22,'MacKenzie Scott',57,'United States','Technology'),(23,'Carlos Slim',56.5,'Mexico','Diversified'),(24,'Francois Pinault',53.7,'France','Consumer'),(25,'Phil Knight & Family',53.3,'United States','Consumer'),(26,'Michael Dell',50.4,'United States','Technology'),(27,'Jack Ma',49.6,'China','Technology'),(28,'Jacqueline Badger Mars',44.8,'United States','Food & Beverage'),(29,'John Mars',44.8,'United States','Food & Beverage'),(30,'Zhang Yiming',44.5,'China','Technology'),(31,'Colin Huang',44.3,'China','Technology'),(32,'Alain Wertheimer',43.8,'France','Consumer'),(33,'Gerard Wertheimer',43.8,'France','Consumer'),(34,'Tadashi Yanai',40.8,'Japan','Retail'),(35,'Len Blavatnik',39.8,'United States','Diversified'),(36,'Giovanni Ferrero & Family',35.1,'Italy','Food & Beverage'),(37,'Miriam Adelson',33.9,'United States','Entertainment'),(38,'Klaus-Michael Kuehne',33.8,'Germany','Industrial'),(39,'Masayoshi Son',33.8,'Japan','Technology'),(40,'William Ding',33.7,'China','Technology'),(41,'Vladimir Potanin',33.6,'Russia','Commodities'),(42,'Li Ka-shing',32.9,'Hong Kong','Real-Estate'),(43,'Zeng Yuqun',32.8,'Hong Kong','Industrial'),(44,'Yang Huiyan',31.9,'China','Real-Estate'),(45,'Azim Premji',31.4,'India','Technology'),(46,'He Xiangjian',31.3,'China','Consumer'),(47,'Gina Rinehart',31.2,'Australia','Commodities'),(48,'Leonard Lauder',30.6,'United States','Consumer'),(49,'Dan Gilbert',30.4,'United States','Real-Estate'),(50,'Qin Yinglin',29.8,'China','Food & Beverage'),(51,'James Dyson',29.5,'United Kingdom','Consumer'),(52,'Vladimir Lisin',29.2,'Russia','Industrial'),(53,'Jim Ratcliffe',29.1,'United Kingdom','Industrial'),(54,'Alexey Mordashov',28.9,'Russia','Industrial'),(55,'Leonid Mikhelson',28.2,'Russia','Energy'),(56,'Takemitsu Takizaki',27.9,'Japan','Technology'),(57,'Stephen Schwarzman',27.5,'United States','Finance'),(58,'Pallonji Mistry',27.4,'Ireland','Industrial'),(59,'Pang Kang',27.1,'China','Food & Beverage'),(60,'Leonardo Del Vecchio',27,'Italy','Consumer'),(61,'Dieter Schwarz',26.9,'Germany','Retail'),(62,'Abigail Johnson',26.5,'United States','Finance'),(63,'Jiang Rensheng',26,'China','Health Care'),(64,'Iris Fontbona & Family',25.7,'Chile','Commodities'),(65,'Jorge Paulo Lemann\'',25.6,'Brazil','Food & Beverage'),(66,'Susanne Klatten',25.5,'Germany','Industrial'),(67,'Zhang Zhidong',25.1,'China','Technology'),(68,'James Simons',25.1,'United States','Finance'),(69,'Stefan Persson',24.6,'Sweden','Retail'),(70,'Andrew Forrest',24.5,'Australia','Commodities'),(71,'Li Xiting',24.2,'Singapore','Health Care'),(72,'Lei Jun',24,'China','Technology'),(73,'Lee Shau Kee',23.7,'Hong Kong','Real-Estate'),(74,'Eric Schmidt',23.6,'United States','Technology'),(75,'Shiv Nadar',23.2,'India','Technology'),(76,'Henry Cheng',23.1,'Hong Kong','Retail'),(77,'Ken Griffin',22.6,'United States','Finance'),(78,'Carl Icahn',22.5,'United States','Diversified'),(79,'Elaine Marshall',22.1,'United States','Industrial'),(80,'Laurene Powell Jobs',21.9,'United States','Media & Telecom'),(81,'John Menard',21.7,'United States','Retail'),(82,'Goh Cheng Liang',21.7,'Singapore','Industrial'),(83,'Thomas Peterffy',21.5,'United States','Finance'),(84,'Stefan Quandt',21.4,'Germany','Industrial'),(86,'Alisher Usmanov',20.9,'Russia','Diversified'),(87,'Lakshmi Mittal',20.9,'India','Retail'),(88,'Robert Kuok',20.8,'Malaysia','Diversified'),(89,'Lukas Walton',20.5,'United States','Retail'),(90,'Ernesto Bertarelli & Family',20.3,'Switzerland','Diversified'),(91,'Hui Ka Yan',20.3,'China','Real-Estate'),(92,'Peter Woo',20,'Hong Kong','Real-Estate'),(93,'Donald Newhouse',20,'United States','Media & Telecom'),(94,'Chen Bang',20,'China','Health Care'),(95,'Xu Hang',20,'Hong Kong','Health Care'),(96,'Vagit Alekperov',20,'Russia','Energy'),(97,'Lui Che-Woo',19.6,'Hong Kong','Entertainment'),(98,'Roman Abramovich',19.2,'Russia','Diversified'),(99,'Thomas Frist',19.1,'United States','Health Care'),(100,'Gennady Timchenko',18.6,'Russia','Diversified'),(101,'Wang Xing',18.4,'China','Technology'),(102,'Dietrich Mateschitz',18.4,'Austria','Food & Beverage'),(103,'Wang Wei',18.3,'China','Services'),(104,'Dustin Moskovitz',18.2,'United States','Technology'),(105,'Lee Man Tat',17.6,'Hong Kong','Food & Beverage'),(106,'Charlene de Carvalho-Heineken',17.3,'Netherlands','Food & Beverage'),(107,'Andrey Melnichenko',17.2,'Russia','Industrial'),(108,'Viktor Vekselberg',17.1,'Russia','Industrial'),(109,'Ray Dalio',17,'United States','Finance'),(110,'Reinhold Wuerth',16.9,'Germany','Industrial'),(111,'Thomas Struengmann',16.9,'Germany','Health Care'),(112,'Andreas Struengmann',16.9,'Germany','Health Care'),(113,'Alwaleed Bin Talal',16.7,'Saudi Arabia','Diversified'),(114,'Eduardo Saverin',16.6,'Brazil','Technology'),(115,'Wu Yajun',16.6,'China','Real-Estate'),(116,'Zhong Huijuan',16.6,'China','Health Care'),(117,'Sun Piaoyang',16.5,'China','Health Care'),(118,'Gustaf Douglas & Family',16.5,'Sweden','Diversified'),(119,'Aliko Dangote',16.4,'Nigeria','Industrial'),(120,'Richard Liu',16.4,'China','Technology'),(121,'Li Shu Fu',16.4,'China','Industrial'),(122,'Cyrus Poonawalla',16.2,'India','Health Care'),(123,'Budi Hartono',16.2,'Indonesia','Diversified'),(124,'Hasso Plattner',16,'Germany','Technology'),(125,'Wang Wenyin',15.9,'China','Commodities'),(126,'Ernie Garcia',15.9,'United States','Consumer'),(127,'Ned Johnson III',15.7,'United States','Finance'),(128,'Charoen Sirivadhanabhakdi',15.7,'Thailand','Food & Beverage'),(129,'Donald Bren',15.7,'United States','Real-Estate'),(130,'Ricardo Salinas',15.5,'Mexico','Diversified'),(131,'Patrick Soon-Shiong',15.5,'United States','Health Care'),(132,'Philip Anschutz',15.4,'United States','Diversified'),(133,'Radhakishan Damani',15.4,'India','Retail'),(134,'Michael Hartono',15.2,'Indonesia','Diversified'),(135,'Ma Jianrong',15,'China','Consumer'),(136,'Jorge Moll & Family',15,'Brazil','Health Care'),(137,'Charles Ergen',14.8,'United States','Media & Telecom'),(138,'Dave Duffield',14.7,'United States','Technology'),(139,'Eric Yuan',14.7,'United States','Technology'),(140,'Uday Kotak',14.6,'India','Finance'),(141,'David Tepper',14.4,'United States','Finance'),(142,'Karl Albrecht Jr.',14.3,'Germany','Retail'),(143,'Beate Heister',14.3,'Germany','Retail'),(144,'Zuo Hui',14.2,'China','Real-Estate'),(145,'Jim Goodnight',14.2,'United States','Technology'),(146,'Patrick Drahi',14.2,'France','Media & Telecom'),(147,'Su Hua',14.1,'China','Technology'),(148,'Huang Shilin',14.1,'China','Industrial'),(149,'Scott Farquhar',13.8,'Australia','Technology'),(150,'Mike Cannon-Brookes',13.8,'Australia','Technology'),(151,'Mikhail Fridman',13.8,'Russia','Diversified'),(152,'Robin Li',13.7,'China','Technology'),(153,'Chen Zhiping',13.6,'China','Consumer'),(154,'Mikhail Prokhorov',13.6,'Russia','Diversified'),(155,'Jensen Huang',13.5,'United States','Technology'),(156,'Fan Hongwei',13.4,'China','Energy'),(157,'Jim Davis',13.3,'United States','Consumer'),(158,'Joseph Tsai',13.2,'Canada','Technology'),(159,'Hugh Grosvenor',13.2,'United Kingdom','Real-Estate'),(160,'Alejandro Santo Domingo & Family',13,'Colombia','Food & Beverage'),(161,'Cen Junda',12.9,'China','Health Care'),(162,'Jan Koum',12.9,'United States','Technology'),(163,'Wang Jianlin',12.8,'China','Real-Estate'),(164,'Zhou Qunfei',12.7,'China','Technology'),(165,'Victor Rashnikov',12.6,'Russia','Industrial'),(166,'Raymond Kwok',12.6,'Hong Kong','Real-Estate'),(167,'Forrest Li',12.6,'Singapore','Technology'),(168,'Sherry Brydson',12.6,'Canada','Media & Telecom'),(169,'Dang Yanbao',12.6,'China','Energy'),(170,'Lee Jae-Yong & Family',12.6,'Korea','Diversified'),(171,'Paolo Rocca  & Family',12.6,'Italy','Commodities'),(172,'Wu Shaoxun',12.5,'China','Food & Beverage'),(173,'Wang Chuan-Fu',12.5,'China','Consumer'),(174,'Carl Cook',12.5,'United States','Health Care'),(175,'Jack Dorsey',12.5,'United States','Technology'),(176,'Robert Pera',12.4,'United States','Technology'),(177,'Leng You-Bin',12.4,'China','Consumer'),(178,'Melker Schorling',12.2,'Sweden','Diversified'),(179,'Charles Schwab',12.2,'United States','Finance'),(180,'Brian Chesky',12.2,'United States','Services'),(181,'Marcel Telles',12.2,'Brazil','Food & Beverage'),(182,'Thomas Kwok',12.1,'Hong Kong','Real-Estate'),(183,'Dilip Shanghvi',12.1,'India','Health Care'),(184,'Pierre Omidyar',12.1,'United States','Technology'),(185,'Savitri Jindal',11.9,'India','Commodities'),(186,'Gong Hongjia',11.8,'China','Technology'),(187,'Brian Armstrong',11.7,'United States','Technology'),(188,'Liu Yongxing',11.6,'China','Industrial'),(189,'Patrick Collison',11.4,'Ireland','Technology'),(190,'John Collison',11.4,'Ireland','Technology'),(191,'Harry Triguboff',11.3,'Australia','Real-Estate'),(192,'Gordon Moore',11.3,'United States','Technology'),(193,'Micky Arison',11.2,'United States','Entertainment'),(194,'Cheng Yixiao',11.2,'China','Technology'),(195,'Marijke Mars',11.2,'United States','Food & Beverage'),(196,'Victoria Mars',11.2,'United States','Food & Beverage'),(197,'Pamela Mars-Wright',11.2,'United States','Food & Beverage'),(198,'Valerie Mars',11.2,'United States','Food & Beverage'),(199,'Eyal Ofer',11.1,'Israel','Services'),(200,'Stefano Pessina',11,'Monaco','Retail'),(201,'Heinrich Deichmann & Family',11,'Germany','Retail'),(202,'David Sun',11,'United States','Technology'),(203,'John Tu',11,'United States','Technology'),(204,'Anders Holch Povlsen & Family',11,'Denmark','Retail'),(205,'Bobby Murphy',10.9,'United States','Technology'),(206,'Graeme Hart',10.9,'New Zealand','Finance'),(207,'Leon Black',10.9,'United States','Finance'),(208,'David Geffen',10.8,'United States','Entertainment'),(209,'Steve Cohen',10.8,'United States','Finance'),(210,'Dmitry Rybolovlev',10.8,'Russia','Diversified'),(211,'Ding Shizhong',10.8,'China','Consumer'),(212,'Emmanuel Besnier',10.8,'France','Food & Beverage'),(213,'Liu Yonghao',10.8,'China','Diversified'),(214,'Wei Jianjun',10.7,'China','Consumer'),(215,'Reinhold Schmieding',10.7,'United States','Health Care'),(216,'Carlos Sicupira',10.6,'Brazil','Food & Beverage'),(217,'Frank Wang',10.6,'China','Technology'),(218,'Li Shuirong',10.6,'China','Energy'),(219,'Pham Nhat Vuong',10.5,'Viet Nam','Real-Estate'),(220,'Michael Kadoorie',10.5,'Hong Kong','Energy'),(221,'Ding Shijia',10.5,'China','Consumer'),(222,'Seo Jung-Jin',10.4,'Korea','Health Care'),(223,'Stan Druckenmiller',10.4,'United States','Finance'),(224,'Kumar Birla',10.4,'India','Industrial'),(225,'Kim Jung-Ju',10.4,'Korea','Technology'),(226,'Georg Schaeffler',10.3,'Germany','Industrial'),(227,'Rinat Akhmetov',10.3,'Ukraine','Industrial'),(228,'Blair Parry-Okeden',10.3,'United States','Media & Telecom'),(229,'Jim Kennedy',10.3,'United States','Media & Telecom'),(230,'Suleiman Kerimov',10.3,'Russia','Commodities'),(231,'Brian Kim',10.3,'Korea','Technology'),(232,'Shu Ping',10.3,'Singapore','Food & Beverage'),(233,'Evan Spiegel',10.3,'United States','Technology'),(234,'Michael Platt',10.2,'United Kingdom','Finance'),(235,'Qi Shi',10.2,'China','Finance'),(236,'Zhang Yong',10.2,'Singapore','Food & Beverage'),(237,'Jay Chaudhry',10.2,'United States','Technology'),(238,'Anthony Pratt',10.2,'Australia','Industrial'),(239,'Johann Graf',10.1,'Austria','Entertainment'),(240,'Dietmar Hopp',10.1,'Germany','Technology'),(241,'Michael Otto',10.1,'Germany','Retail'),(242,'Antonia Axson Johnson',10.1,'Sweden','Industrial'),(243,'George Roberts',10,'United States','Finance'),(244,'Nathan Blecharczyk',9.99,'United States','Services'),(245,'Joe Gebbia',9.97,'United States','Services'),(246,'Gianluigi Aponte',9.95,'Switzerland','Services'),(247,'John Fredriksen',9.91,'Cyprus','Industrial'),(248,'Yao Liangsong',9.86,'China','Retail'),(249,'Giorgio Armani',9.77,'Italy','Consumer'),(250,'Sarath Ratanavadi',9.77,'Thailand','Energy'),(251,'Henry Kravis',9.76,'United States','Finance'),(252,'Christy Walton',9.76,'United States','Retail'),(253,'Luis Sarmiento',9.75,'Colombia','Finance'),(254,'Cai Kui',9.74,'China','Real-Estate'),(255,'Stan Kroenke',9.72,'United States','Real-Estate'),(256,'Niels Louis-Hansen',9.68,'Denmark','Health Care'),(257,'Les Wexner',9.65,'United States','Retail'),(258,'Sunil Mittal',9.59,'India','Media & Telecom'),(259,'Tobi Lutke',9.57,'Canada','Technology'),(260,'Alberto Bailleres',9.57,'Mexico','Commodities'),(261,'Tito Beveridge',9.55,'United States','Consumer'),(262,'Anthony Bamford & Family',9.51,'United Kingdom','Industrial'),(263,'Tim Sweeney',9.47,'United States','Technology'),(264,'Zhao Yan',9.47,'China','Health Care'),(265,'Jorn Rausing',9.46,'Sweden','Services'),(266,'Zhang Bangxin',9.43,'China','Services'),(267,'August von Finck',9.42,'Germany','Diversified'),(268,'Andy Beal',9.4,'United States','Finance'),(269,'George Lucas',9.4,'United States','Entertainment'),(270,'German Khan',9.39,'Russia','Diversified'),(271,'Wee Cho Yaw',9.39,'Singapore','Finance'),(272,'Denise Coates',9.37,'United Kingdom','Entertainment'),(273,'Alexander Abramov',9.34,'Russia','Industrial'),(274,'Qian Dongqi',9.32,'China','Technology'),(275,'Harold Hamm',9.32,'United States','Energy'),(276,'Iskandar Makhmudov',9.31,'Russia','Commodities'),(277,'John Malone',9.29,'United States','Media & Telecom'),(278,'Hansjoerg Wyss',9.27,'Switzerland','Health Care'),(279,'Rupert Murdoch',9.2,'United States','Media & Telecom'),(280,'James Pattison',9.18,'Canada','Media & Telecom'),(281,'Jude Reyes',9.18,'United States','Consumer'),(282,'Chris Reyes',9.18,'United States','Consumer'),(283,'Tatyana Bakalchuk',9.14,'Russia','Technology'),(284,'Gabe Newell',9.06,'United States','Technology'),(285,'Andrew Currie',8.97,'United Kingdom','Industrial'),(286,'Johann Rupert & Family',8.94,'South Africa','Diversified'),(287,'Silvio Berlusconi',8.94,'Italy','Media & Telecom'),(288,'John Reece',8.91,'United Kingdom','Industrial'),(289,'Cheng Xue',8.9,'China','Food & Beverage'),(290,'Willi Liebherr',8.86,'Germany','Industrial'),(291,'Isolde Liebherr',8.86,'Germany','Industrial'),(292,'John Albert Sobrato',8.84,'United States','Real-Estate'),(293,'Marc Benioff',8.83,'United States','Technology'),(294,'Denis Sverdlov',8.8,'Russia','Technology'),(295,'Li Zhenguo',8.8,'China','Energy'),(296,'Sandra Ortega Mera',8.74,'Spain','Retail'),(297,'Hui Wing Mau',8.74,'Hong Kong','Real-Estate'),(298,'Liu Jincheng',8.71,'China','Industrial'),(299,'Theo Albrecht Jr.',8.71,'Germany','Retail'),(300,'Dennis Washington',8.69,'United States','Industrial'),(301,'Stephen Ross',8.69,'United States','Real-Estate'),(302,'Lin Bin',8.66,'United States','Technology'),(303,'Mohammed Al Amoudi',8.66,'Saudi Arabia','Energy'),(304,'Robert Smith',8.65,'United States','Finance'),(305,'Rocco Commisso',8.64,'United States','Media & Telecom'),(306,'Benu Bangur',8.61,'India','Commodities'),(307,'German Larrea',8.61,'Mexico','Commodities'),(308,'Anthony von Mandl',8.6,'Canda','Consumer'),(309,'Shigenobu Nagamori',8.6,'Japan','Industrial'),(310,'Lu Zhongfang',8.6,'China','Services'),(311,'Jerry Jones',8.56,'United States','Entertainment'),(312,'Pei Zhenhua',8.48,'China','Industrial'),(313,'Sun Hongbin',8.45,'United States','Real-Estate'),(314,'Ugur Sahin',8.45,'Germany','Health Care'),(315,'Joseph Lau',8.39,'Hong Kong','Real-Estate'),(316,'Xu Shihui',8.32,'China','Food & Beverage'),(317,'Li Ge',8.3,'United States','Health Care'),(318,'Ned Johnson IV',8.29,'United States','Finance'),(319,'Elizabeth Johnson',8.29,'United States','Finance'),(320,'Alexander Otto',8.28,'Germany','Real-Estate'),(321,'Ruan Xueping',8.28,'China','Industrial'),(322,'Ruan Liping',8.28,'China','Industrial'),(323,'Daniel Dines',8.27,'Romania','Technology'),(324,'Carl Bennet',8.25,'Sweden','Finance'),(325,'Izzy Englander',8.25,'United States','Finance'),(326,'Magdalena Martullo',8.24,'Switzerland','Industrial'),(327,'Laurent Dassault',8.19,'France','Diversified'),(328,'Marie-Helene Habert-Dassault',8.19,'France','Diversified'),(329,'Thierry Dassault',8.19,'France','Diversified'),(330,'Ralph Lauren',8.17,'United States','Consumer'),(331,'Richard Kinder',8.16,'United States','Energy'),(332,'Kei Hoi Pang',8.12,'China','Real-Estate'),(333,'Juan Beckmann Vidal & Family',8.11,'Mexico','Food & Beverage'),(334,'Shahid Khan',8.09,'United States','Consumer'),(335,'Yu Renrong',8.01,'China','Technology'),(336,'Mat Ishbia',8,'United States','Finance'),(337,'Rahel Blocher',7.99,'Switzerland','Industrial'),(338,'Ludwig Merckle',7.99,'Germany','Industrial'),(339,'Chen Jianhua',7.98,'China','Industrial'),(340,'Frank Lowy',7.93,'Australia','Real-Estate'),(341,'Nicky Oppenheimer',7.83,'South Africa','Diversified'),(342,'David Thomson',7.81,'Canada','Media & Telecom'),(343,'Taylor Thomson',7.81,'Canada','Media & Telecom'),(344,'Peter Thomson',7.81,'Canada','Media & Telecom'),(345,'Bob Rich',7.81,'United States','Food & Beverage'),(346,'Leonid Fedun',7.8,'Russia','Energy'),(347,'Nusli Wadia',7.76,'India','Diversified'),(348,'Geoffrey Kwok',7.73,'Hong Kong','Real-Estate'),(349,'Finn Rausing',7.66,'Sweden','Services'),(350,'Kirsten Rausing',7.66,'Sweden','Services'),(351,'George Soros',7.6,'United States','Finance'),(352,'Steven Spielberg',7.58,'United States','Entertainment'),(353,'Charles Cadogan',7.57,'United Kingdom','Real-Estate'),(354,'Liu Hanyuan',7.52,'China','Industrial'),(355,'Liz Mohn',7.52,'Germany','Media & Telecom'),(356,'Ronda Stryker',7.5,'United States','Health Care'),(357,'Yu Yong',7.49,'China','Finance'),(358,'Chase Coleman',7.47,'United States','Finance'),(359,'Andy Bechtolsheim',7.45,'Germany','Technology'),(360,'Hong Ra-hee',7.44,'Korea','Diversified'),(361,'Tammy Gustavson',7.43,'United States','Services'),(362,'Lin Jianhua',7.42,'China','Technology'),(363,'Martin Viessmann & Family',7.42,'Germany','Industrial'),(364,'Frederik Paulsen',7.41,'Sweden','Health Care'),(365,'Laurence Graff',7.4,'United Kingdom','Consumer'),(366,'Takahisa Takahara',7.39,'Japan','Consumer'),(367,'John Grayken',7.36,'Ireland','Finance'),(368,'Gang Ye',7.29,'Singapore','Technology'),(369,'Samuel Yin',7.28,'Taiwan','Diversified'),(370,'Wang Laisheng',7.27,'China','Industrial'),(371,'Sri Prakash Lohia',7.26,'Indonesia','Industrial'),(372,'Axel Oberwelland',7.24,'Germany','Food & Beverage'),(373,'Mohamed Al Jaber',7.2,'Saudi Arabia','Retail'),(374,'Gwendolyn Sontheim Meyer',7.17,'United States','Commodities'),(375,'Pauline Keinath',7.17,'United States','Commodities'),(376,'Tom Gores',7.17,'United States','Finance'),(377,'Hiroshi Mikitani',7.13,'Japan','Retail'),(378,'Jian Jun',7.13,'China','Consumer'),(379,'Teh Hong Piow',7.11,'Malaysia','Finance'),(380,'Terry Pegula',7.1,'United States','Energy'),(381,'Alexey Kuzmichev',7.08,'Russia','Diversified'),(382,'John Sall',7.08,'United States','Technology'),(383,'Antti Herlin',7.03,'Finland','Industrial'),(384,'Chris Hohn',7.02,'United Kingdom','Finance'),(385,'David Shaw',7.02,'United States','Finance'),(386,'Nassef Sawiris',7.01,'Egypt','Industrial'),(387,'Alain Merieux',7.01,'France','Health Care'),(388,'Natie Kirsh',7.01,'South Africa','Food & Beverage'),(389,'Kenneth Dart',6.98,'Cayman Islands','Finance'),(390,'Horst Pudwill',6.97,'Hong Kong','Consumer'),(391,'Shari Arison',6.97,'Israel','Diversified'),(392,'Nancy Laurie',6.97,'United States','Retail'),(393,'Wang Yusuo',6.96,'China','Energy'),(394,'Tan Kim Choo',6.95,'Singapore','Real-Estate'),(395,'Stef Wertheimer',6.88,'Israel','Diversified'),(396,'Pankaj Patel',6.86,'India','Health Care'),(397,'Kjeld Kirk Kristiansen',6.83,'Denmark','Consumer'),(398,'Ray Hunt',6.83,'United States','Energy'),(399,'Margaretta Taylor',6.81,'United States','Media & Telecom'),(400,'James Cox Chambers',6.81,'United States','Media & Telecom'),(401,'Katharine Rayner',6.81,'United States','Media & Telecom'),(402,'Fredrik Lundberg',6.78,'Sweden','Real-Estate'),(403,'Chu Mang Yee',6.78,'China','Real-Estate'),(405,'Ernest Garcia III',6.73,'United States','Consumer'),(406,'Bertil Hult',6.72,'Sweden','Diversified'),(407,'Eric Smidt',6.71,'United States','Retail'),(408,'Vincent Bollore',6.69,'France','Diversified'),(409,'Joe Lewis',6.68,'United Kingdom','Diversified'),(410,'Josh Harris',6.67,'United States','Finance'),(411,'J K Irving',6.67,'Canada','Commodities'),(412,'Ronald McAulay',6.66,'Hong Kong','Energy'),(413,'Jean-Michel Besnier',6.64,'France','Food & Beverage'),(414,'Randa Williams',6.63,'United States','Energy'),(415,'Dannine Avara',6.63,'United States','Energy'),(416,'Scott Duncan',6.63,'United States','Energy'),(417,'Milane Frantz',6.63,'United States','Energy'),(418,'Sofie Kirk Kristiansen',6.63,'Denmark','Consumer'),(419,'Agnete Kirk Thinggaard',6.63,'Denmark','Consumer'),(420,'Thomas Kirk Kristiansen',6.63,'Denmark','Consumer'),(421,'Wang Laichun',6.6,'China','Industrial'),(422,'Xavier Niel',6.6,'France','Technology'),(423,'Lynn Schusterman',6.58,'United States','Energy'),(424,'Lai Meisong',6.58,'China','Services'),(425,'Tom Morris',6.55,'United Kingdom','Retail'),(426,'Yasumitsu Shigeta',6.55,'Japan','Media & Telecom'),(427,'K P Singh',6.54,'India','Real-Estate'),(428,'Rahul Bajaj',6.53,'India','Diversified'),(429,'Simon Reuben',6.5,'United Kingdom','Diversified'),(430,'David Reuben',6.5,'United Kingdom','Diversified'),(431,'Leaf Hua Li',6.46,'China','Technology'),(432,'George Kaiser',6.42,'United States','Energy'),(433,'Bom Kim',6.39,'United States','Technology'),(434,'Andrey Guryev',6.38,'Russia','Industrial'),(435,'Chung Mong-Koo',6.37,'Korea','Industrial'),(436,'Jean-Pierre Cayard',6.35,'France','Food & Beverage'),(437,'Peter Thiel',6.31,'United States','Finance'),(438,'Jane Lauder',6.3,'United States','Consumer'),(439,'Udo Tschira',6.29,'Germany','Technology'),(440,'Harald Tschira',6.29,'Germany','Technology'),(441,'Lv Xiang-yang',6.26,'China','Consumer'),(442,'Bubba Cathy',6.25,'United States','Food & Beverage'),(443,'Ivan Glasenberg',6.24,'Australia','Commodities'),(444,'Dan Cathy',6.24,'United States','Food & Beverage'),(445,'Andre Hoffmann',6.23,'Switzerland','Health Care'),(446,'Philip Ng',6.23,'Singapore','Real-Estate'),(447,'Petr Aven',6.2,'Russia','Diversified'),(448,'Mark Shoen',6.16,'United States','Services'),(449,'Robert Ng',6.16,'Singapore','Real-Estate'),(450,'Tsai Eng-Meng',6.15,'Taiwan','Food & Beverage'),(451,'Isaac Perlmutter',6.14,'United States','Entertainment'),(452,'Linda Campbell',6.14,'Canada','Media & Telecom'),(453,'Gaye Farncombe',6.14,'Canada','Media & Telecom'),(454,'Michael Herz & Family',6.14,'Germany','Consumer'),(455,'Olav Thon',6.13,'Norway','Real-Estate'),(456,'Barry Lam',6.13,'Taiwan','Technology'),(457,'Robert Rowling',6.12,'United States','Energy'),(458,'Barry Diller',6.12,'United States','Technology'),(459,'Wolfgang Herz & Family',6.12,'Germany','Consumer'),(460,'Leonard Stern',6.1,'United States','Real-Estate'),(461,'Wang Wenjing',6.1,'China','Technology'),(462,'Manuel Villar',6.06,'Philippines','Diversified'),(463,'Charles Butt & Family',6.06,'United States','Retail'),(464,'Anthony Wood',6.04,'United States','Technology'),(465,'Peter-Alexander Wacker & Family',6.04,'Germany','Industrial'),(466,'Andreas Halvorsen',6.01,'Norway','Finance'),(467,'Terry Gou',5.99,'Taiwan','Industrial'),(468,'Robert Kraft',5.99,'United States','Entertainment'),(469,'Ann Kroenke',5.97,'United States','Retail'),(470,'Henry Samueli',5.96,'United States','Technology'),(471,'Frits Goldschmeding',5.96,'Netherlands','Retail'),(472,'Arthur Irving',5.95,'Canada','Energy'),(473,'Andrey Kozitsyn',5.93,'Russia','Industrial'),(474,'Vera Michalski-Hoffmann',5.92,'Switzerland','Health Care'),(475,'Maja Hoffmann',5.92,'Switzerland','Health Care'),(476,'Majid Al Futtaim',5.92,'United Arab Emirates','Real-Estate'),(477,'Edward Roski',5.9,'United States','Real-Estate'),(478,'Zhang Lei',5.9,'China','Finance'),(479,'Charles Johnson',5.89,'United States','Finance'),(480,'Richard Branson',5.88,'United Kingdom','Diversified'),(481,'Miuccia Prada',5.88,'Italy','Consumer'),(482,'Vivien Chen',5.88,'Hong Kong','Real-Estate'),(483,'Marcos Galperin',5.88,'Argentina','Technology'),(484,'Bidzina Ivanishvili',5.87,'Georgia','Diversified'),(485,'Guenther Fielmann',5.86,'Germany','Consumer'),(486,'Patrizio Bertelli',5.86,'Italy','Consumer'),(487,'Pat Stryker',5.84,'United States','Health Care'),(488,'Francis Choi',5.84,'Hong Kong','Real-Estate'),(489,'Jeffery Hildebrand',5.82,'United States','Energy'),(490,'Li Ping',5.81,'China','Industrial'),(491,'Chip Wilson',5.81,'Canada','Retail'),(492,'Marie Besnier Beauvalot',5.8,'France','Food & Beverage'),(493,'Clive Calder',5.78,'United Kingdom','Entertainment'),(494,'Kwon Hyuk-Bin',5.77,'Korea','Media & Telecom'),(495,'Mark Cuban',5.75,'United States','Technology'),(496,'Lino Saputo',5.75,'Canada','Food & Beverage'),(497,'Prajogo Pangestu',5.74,'Indonesia','Energy'),(498,'Charles Dolan & Family',5.74,'United States','Media & Telecom'),(499,'Vladimir Kim',5.72,'Kazakhstan','Commodities'),(500,'Odd Reitan',5.72,'Norway','Food & Beverage');
/*!40000 ALTER TABLE `ricos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-25 19:20:15