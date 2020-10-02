-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: socialite
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `requester_user_id` int NOT NULL,
  `requested_user_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `friends_users_id_fk` (`requested_user_id`),
  KEY `friends_users_id_fk_2` (`requester_user_id`),
  CONSTRAINT `friends_users_id_fk` FOREIGN KEY (`requested_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friends_users_id_fk_2` FOREIGN KEY (`requester_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,608,609,'2020-09-28 22:07:24','2020-09-28 22:07:24',NULL),(2,615,620,'2020-09-28 22:07:40','2020-09-28 22:07:40',_binary ''),(3,628,615,'2020-09-28 22:08:40','2020-09-28 22:08:40',_binary ''),(4,628,620,'2020-09-28 22:08:58','2020-09-28 22:08:58',NULL),(5,617,620,'2020-09-28 22:09:08','2020-09-28 22:09:08',NULL);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_addresses`
--

DROP TABLE IF EXISTS `location_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(3) NOT NULL,
  `zipcode` int NOT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `isClosed` bit(1) NOT NULL DEFAULT b'0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `location_addresses_ibfk_1` (`location_id`),
  CONSTRAINT `location_addresses_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_addresses`
--

LOCK TABLES `location_addresses` WRITE;
/*!40000 ALTER TABLE `location_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_categories`
--

DROP TABLE IF EXISTS `location_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `location_categories_ibfk_1` (`location_id`),
  CONSTRAINT `location_categories_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_categories`
--

LOCK TABLES `location_categories` WRITE;
/*!40000 ALTER TABLE `location_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `yelpUrl` text NOT NULL,
  `yelpID` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `imageUrl` text,
  `phone` varchar(10) DEFAULT NULL,
  `reviewCount` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Orci Consectetuer Euismod Institute','diam.Duis@diamPellentesquehabitant.com','18E33DA9-2526-676E-DBC8-0236B4F3722B',1,4,'In.scelerisque@Namacnulla.ca','6081234567',803863873,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(2,'Suspendisse Sagittis Nullam Industries','vitae.sodales@velconvallis.org','E532B0E7-50C5-F3C0-9AA8-46A25AC966D6',4,1,'tellus.sem@duiquis.org','1608019858',887452448,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(3,'Aenean Company','nec.quam.Curabitur@elitEtiam.net','A5F40D4D-71FF-A688-17EC-4495DA5572E0',1,2,'Donec@orcisemeget.com','6081234567',310952735,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(4,'Suspendisse Non LLC','ipsum.Donec@molestiesodalesMauris.org','4272D739-F8C0-DDE8-2CEB-D81B89F24E99',3,1,'nec.urna@rhoncusidmollis.edu','6081234567',924350214,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(5,'Morbi Vehicula Pellentesque LLP','sit@semmolestie.ca','865361CB-595A-26FC-A635-048F1543ED64',4,4,'posuere@semperrutrumFusce.org','6081234567',159507236,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(6,'Nunc Pulvinar Associates','aliquet.sem.ut@senectuset.com','DABF1F38-8001-5075-AAD9-0526FDED1169',1,1,'quis.diam.luctus@faucibus.net','6081234567',411443464,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(7,'Non Sollicitudin Associates','Donec.porttitor@Etiamimperdietdictum.com','23AAA3B6-2346-581D-0FFE-98965BAC5A3C',4,5,'odio.semper.cursus@pede.ca','6081234567',838359596,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(8,'Eu Turpis Nulla LLP','arcu.Vestibulum.ante@eueuismodac.co.uk','36A9CC2A-206B-C02A-0EA3-59149182A56D',4,1,'pede@est.edu','6081234567',566260025,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(9,'Sed Industries','malesuada.ut.sem@tempuseu.com','E16E7239-2E1F-BD68-1645-2C1DCFA5BDD3',1,2,'dui.semper.et@turpisAliquam.org','6081234567',141068223,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(10,'Parturient Montes Institute','vestibulum.massa@liberoet.org','5BFA372D-A3AE-2FA9-D08E-C94D88E585ED',3,1,'nonummy@Phaselluselitpede.org','6081234567',724494590,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(11,'Aliquet Consulting','Praesent.eu@aliquetodioEtiam.ca','BF593B8E-679C-746F-0052-8BB976CB87BF',1,3,'ac.mattis.semper@Nulla.com','6081234567',324015161,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(12,'Ut Erat Consulting','magna.a.tortor@turpisnec.com','99819365-0995-E43E-AC42-0CFAF654C02D',3,4,'porttitor@at.com','6081234567',186406089,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(13,'Imperdiet Ornare Limited','Proin@Quisque.co.uk','5D7DAA1B-CAD7-2829-34DE-EC6F3FA5CA95',1,3,'in.sodales@nisl.edu','6081234567',214856536,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(14,'Amet Orci Limited','ligula.Nullam.enim@maurisSuspendisse.com','F3CB6E05-AE51-B8D5-971F-53CFB1A4157D',4,1,'vitae.erat.vel@dignissim.edu','6081234567',70808064,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(15,'Vestibulum Ante Ipsum Consulting','primis@cursusa.edu','D61DF4F9-C93A-9DFE-3C7C-95F82ED9D3DE',2,1,'Etiam.imperdiet.dictum@Aeneansed.net','6081234567',707381923,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(16,'Quis Pede Consulting','rutrum.urna@risusodioauctor.com','52B48A6B-04B0-444C-B9EF-1DF08B8C89FA',2,1,'nascetur@aptenttaciti.com','6081234567',597575322,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(17,'Magna A LLP','cursus@eleifendnec.net','82AD4ADE-287C-0AB0-40DD-D9A0870D9A4E',4,5,'eget.varius.ultrices@anteMaecenasmi.org','6081234567',255048110,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(18,'Nibh Lacinia LLC','tincidunt@rhoncus.edu','106318D3-3311-B508-F73E-A75A0A39194A',3,1,'mauris@Inatpede.org','6081234567',354164743,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(19,'Quisque Purus Ltd','sapien.molestie@adipiscingnon.edu','5EA6ADB0-E09D-F200-2B96-227998913D22',3,3,'bibendum.sed.est@sagittis.edu','6081234567',408807277,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(20,'Semper Nam Tempor Company','sem.ut@diamvel.ca','2E1DA18A-2DB5-1A7F-A5FE-07C0B3F166B3',4,4,'metus.facilisis.lorem@sagittissemper.com','6081234567',972557936,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(21,'Dictum Mi Consulting','eu.enim@et.edu','FB72425C-DC01-C072-7489-D9414071E3F0',4,4,'Lorem.ipsum@metusAliquam.net','6081234567',650877978,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(22,'Vulputate Mauris Associates','nisi@tellusidnunc.com','F9234E85-4E0A-A2C9-A758-AE0A34ED5610',4,2,'vel@vitaerisus.ca','6081234567',658196722,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(23,'Magna A Tortor Corporation','in@vehicularisus.edu','B758C48F-475F-A7A5-C04D-A577627454DF',4,3,'lacus.Quisque.imperdiet@Aenean.ca','6081234567',999760523,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(24,'Laoreet Lectus Institute','mus.Proin.vel@luctusipsumleo.ca','552F5A5F-BE98-80C7-6ECF-9C7A78FDE92D',3,1,'non@aliquam.ca','6081234567',710538290,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(25,'Felis Corporation','dapibus.ligula@urnajustofaucibus.edu','20A5324E-0477-AE89-6243-F7652E8CDA4E',3,3,'id@duinectempus.co.uk','6081234567',883252499,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(26,'Magna Tellus Foundation','sodales@Cras.edu','CB3EBD5C-D25A-4DC3-849D-3A61DC0FF564',4,2,'arcu@Curabiturvel.net','6081234567',599552621,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(27,'Cras Dictum Institute','Sed@nequepellentesquemassa.org','9FBC5809-6B42-9449-5D6B-A9BF1CD6441E',2,3,'id.sapien.Cras@AeneanmassaInteger.co.uk','6081234567',58878810,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(28,'Blandit Congue In Industries','aliquet.magna@egestasblanditNam.edu','26334EFD-DD3C-FD58-C4E5-3996C4A12008',2,2,'sed@aodiosemper.ca','6081234567',241557671,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(29,'Proin PC','Nullam@nonummy.com','680BA2AE-4EEE-90BD-CD28-F7B9F8A6BD17',3,3,'fringilla.mi@commodo.com','6081234567',305175671,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(30,'Sed Molestie Associates','ornare.sagittis@luctus.net','D3AD3CC9-0D00-6598-7F89-24DD6A621765',3,5,'aliquet@dignissimpharetraNam.com','6081234567',175169152,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(31,'Et Nunc Quisque PC','pretium.aliquet@Aliquameratvolutpat.edu','8A77AD50-B51F-CB62-DFC9-8998A1170335',1,2,'cursus@hendreritaarcu.org','6081234567',648903910,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(32,'Velit Pellentesque Ultricies Associates','luctus.felis.purus@euelitNulla.ca','D3E267FE-ED76-14EE-A1FD-395C8676AA65',1,5,'augue@laoreetposuere.ca','6081234567',24786905,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(33,'Amet PC','lacus@egestas.co.uk','6D5474C7-108C-2FFF-4400-7199B9F4D217',1,2,'tincidunt.adipiscing@temporest.edu','6081234567',999016258,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(34,'Ornare Lectus Ante PC','Vestibulum.ut.eros@Curabiturutodio.co.uk','72ECF2D2-C416-481E-3037-AED12E24727D',2,5,'sit.amet@gravidaAliquam.co.uk','6081234567',457459589,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(35,'Bibendum Sed PC','Nulla@non.co.uk','17FE7CF7-4326-451F-F7BC-F0B2030D1B72',3,3,'Sed.pharetra@sapien.org','6081234567',446465092,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(36,'Nec Cursus Limited','vitae.erat.vel@velitjustonec.edu','1BEEFFF8-6805-C6E6-245C-46E5C17CAF23',4,2,'ut.cursus@accumsansedfacilisis.edu','6081234567',954389615,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(37,'Nam Ltd','commodo@eu.ca','73BB240D-66B7-0358-5784-E38358319A62',1,3,'pede@laoreetipsumCurabitur.org','6081234567',230163859,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(38,'Molestie Sed Id Incorporated','Sed@iaculisaliquet.ca','8653DC73-7B0B-464C-9201-DD89994B245D',2,4,'tellus@dictumeu.com','6081234567',380207706,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(39,'Lobortis Limited','odio.semper.cursus@mitemporlorem.net','6D67F7E4-F765-2A10-E14C-9A2E2D4C34C1',2,4,'eget@faucibus.com','6081234567',757882839,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(40,'Cras Associates','facilisis.facilisis.magna@cursusIntegermollis.ca','B873BF5A-8EE8-6FE7-EA36-DA8EB080E64F',1,1,'Sed@gravida.co.uk','6081234567',888280767,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(41,'Metus In Nec Associates','inceptos.hymenaeos@massaSuspendisse.co.uk','CEECD450-0DA3-5235-794D-259A5BB3EB00',1,1,'in.faucibus.orci@urnaetarcu.com','6081234567',809749689,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(42,'Donec Limited','amet.consectetuer@est.edu','82F28D61-655F-3D76-F9FB-9D4D4A75CCD6',4,5,'Donec.consectetuer.mauris@malesuadafringilla.net','6081234567',688748297,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(43,'Velit In LLP','sem.molestie@mattis.net','2A1B014B-8C79-4855-6105-5170F59A752D',2,3,'facilisis.vitae.orci@at.org','6081234567',236033046,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(44,'Aptent Taciti Sociosqu Corporation','commodo.hendrerit@nisinibhlacinia.ca','098A6E03-5AA6-ECFB-5BBF-08A46330F116',3,5,'urna@euismodurna.net','6081234567',443484183,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(45,'Faucibus Orci Luctus LLP','tortor.dictum.eu@bibendumfermentummetus.ca','1F64E4CA-83BF-7789-C4F9-68F63BBAA24B',1,3,'augue.eu.tempor@eu.org','6081234567',177407305,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(46,'Arcu Vel Corp.','interdum@duiCum.org','E576A243-C665-5512-58DC-E3E8238736B1',3,3,'urna.nec.luctus@placerateget.co.uk','6081234567',714591810,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(47,'Malesuada Integer LLP','mollis@a.org','CE250415-D6BE-2EC5-2E0F-1CAE31F5E18D',1,4,'placerat@Proin.net','6081234567',412638532,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(48,'Phasellus Vitae Mauris Industries','eros.Nam.consequat@inceptoshymenaeosMauris.ca','6B6C12E1-25BC-D0E5-FA93-1A1B02F5B395',4,1,'sed.dictum@varius.edu','6081234567',234387436,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(49,'Placerat Industries','dolor@justo.net','EDDC03C2-A2CB-D429-C4B3-7DFABA81B116',3,2,'dui@mattis.com','6081234567',404031576,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(50,'Quisque Ornare Ltd','faucibus.lectus.a@sem.edu','37CD0E36-8FD3-E5AA-1D74-4BD3282F50D2',3,4,'diam@facilisislorem.net','6081234567',243409816,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(51,'Quam Corp.','ac@aaliquet.com','4E61CC32-02D4-18E6-B660-187EFDC331F4',4,2,'Mauris.vel.turpis@eleifendnunc.org','6081234567',782087113,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(52,'Ipsum Inc.','felis.orci.adipiscing@eu.com','8640DF6A-9D63-AF73-BF86-05139D59E45C',4,2,'sed.sapien.Nunc@anteblanditviverra.org','6081234567',24762492,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(53,'Mus Proin Vel Institute','neque.sed.sem@Mauris.ca','5F27DD51-EA9E-6897-C3AF-84159C9A9402',1,4,'Curabitur.consequat.lectus@urnaUt.co.uk','6081234567',357243761,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(54,'Leo Morbi Corp.','mollis.dui@primisin.org','15CB843E-7003-1CDA-DF1E-208F7BBFB985',2,3,'Curabitur@in.ca','6081234567',55804241,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(55,'Nec Malesuada Ut Limited','nunc.ullamcorper@in.net','8FAE2E7D-C694-AF72-C7BB-F7FB94D89DE0',3,3,'nulla@sagittisNullam.net','6081234567',790760321,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(56,'Interdum Corp.','nulla@famesacturpis.org','B9411F2C-43A4-338F-E637-2A7A2BD44F6A',2,3,'auctor@aceleifend.com','6081234567',880726698,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(57,'Sed Corporation','in.dolor@Praesenteu.ca','A5CC3D71-68D1-7A97-9DE3-B02FD3F51241',3,1,'tellus.Aenean@dolor.edu','6081234567',37528576,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(58,'Nulla Facilisis LLP','Nullam.velit.dui@elementum.net','BE83FD74-38E8-679D-4145-CE5CC703E26F',2,1,'a@placeratCrasdictum.net','6081234567',453140643,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(59,'Nulla Interdum Institute','dis.parturient@Fuscedolor.com','FA5394DC-E4B9-B3FB-6A62-A86BFAD971F7',2,1,'ullamcorper.magna@netusetmalesuada.com','6081234567',782644019,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(60,'Consectetuer Foundation','neque.non.quam@Sed.org','B04BC9E9-5F16-0629-05E0-FCAC54AFA768',1,4,'ullamcorper@eu.co.uk','6081234567',514834107,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(61,'Eu Odio Phasellus Company','Duis.volutpat.nunc@semperNam.com','F663A094-A48B-EA5E-7D5D-F5D4BC0FF2F5',4,3,'Vestibulum.ut@cursusInteger.ca','6081234567',201681866,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(62,'Posuere Incorporated','amet.metus@tempusloremfringilla.com','1BE98C52-162F-D0F3-0F48-1F632F00E03B',2,5,'enim.Etiam@nisl.org','6081234567',502728500,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(63,'Eu Consulting','varius.orci@liberoDonec.co.uk','F925D3A8-2687-B189-35D1-361AFF3CA5D9',4,1,'dolor@penatibuset.net','6081234567',338082940,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(64,'Mollis Integer Tincidunt PC','a@nisl.edu','CFEA8D4E-1DAD-4858-1164-BA065948CFBF',4,3,'risus.Nulla.eget@doloregestas.org','6081234567',66121678,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(65,'Arcu PC','Suspendisse.commodo.tincidunt@Craseget.edu','098E4FBA-7F77-54CC-07CA-4F7EB753B4AD',3,3,'scelerisque.mollis.Phasellus@magnaSuspendissetristique.co.uk','6081234567',600986828,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(66,'Aliquet Vel Institute','Morbi@duiCras.org','41C3FFC8-67E6-1D0F-26E1-6A987F3DC6F5',4,2,'elementum.dui.quis@aliquet.ca','6081234567',563107963,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(67,'Phasellus Ltd','ac.feugiat.non@ametornare.com','44308CE7-C53A-2AD7-B583-C4CAD58480B7',3,1,'Quisque.ac.libero@luctus.com','6081234567',201757424,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(68,'Cubilia Curae Donec Corporation','hendrerit.Donec@cursus.com','7837211A-35DE-B8B0-28A7-86718F058DD6',2,5,'montes.nascetur@ametornarelectus.com','6081234567',457458665,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(69,'Ipsum Consulting','Nullam@eratin.ca','BF1BF7C5-94A2-DA38-04D9-100E495B3A48',1,3,'Morbi@etmagnaPraesent.co.uk','6081234567',408228056,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(70,'Ridiculus Foundation','sit.amet.dapibus@urnasuscipit.com','48F90EAE-3D71-374A-0FDF-61B96B544A55',2,2,'fermentum@eratvolutpat.ca','6081234567',990508884,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(71,'Lobortis Mauris LLC','dictum.cursus@magnaa.org','938AE019-3EEF-F149-BA35-46DB2E491A79',3,2,'Curabitur.sed@sed.net','6081234567',830794120,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(72,'Adipiscing Non PC','Morbi.vehicula@tortornibhsit.ca','14B6B34B-F914-7E0B-47CB-4A442C485A05',1,3,'Sed.nec@Morbi.net','6081234567',831555121,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(73,'Accumsan Convallis Ante PC','pretium.aliquet.metus@commodo.ca','D6BB0C8A-4E6C-8253-4688-6424AEF51F26',4,1,'Cras.dictum.ultricies@quis.net','6081234567',259398640,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(74,'Eleifend Industries','at.sem.molestie@magna.ca','A4E96EBE-07C9-6DC3-607F-8551214CE0C7',4,2,'In.scelerisque@CuraeDonectincidunt.net','6081234567',67117681,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(75,'Sed Malesuada Augue Corporation','auctor@egetodio.com','A03396B2-AF22-CA42-16D6-35B65C6A69F8',2,4,'augue@sitamet.org','6081234567',689239869,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(76,'Interdum Limited','lacus@consectetueradipiscingelit.com','B9618045-1D61-FA0F-7E8A-CAE572415AAD',4,2,'ornare.libero@Etiam.ca','6081234567',235306734,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(77,'Felis Ullamcorper Viverra Limited','lacus.Aliquam.rutrum@Nulla.co.uk','1E2AACB8-341B-A4E8-5D1C-4B3470394FDC',2,5,'quam@Nullafacilisis.edu','6081234567',639991752,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(78,'Convallis Ante Industries','dictum.eu.placerat@malesuadavel.org','61787D1D-0C8D-A3DF-8C31-D53F22FFD76A',2,3,'ac.tellus@Aenean.org','6081234567',576891505,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(79,'Consequat Purus Maecenas Industries','non.massa@Intinciduntcongue.org','C9421FD1-E01A-8717-1484-B8B21C29BFB7',1,4,'velit.eu@aliquam.edu','6081234567',681037766,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(80,'Molestie In Tempus Associates','sem@adipiscingenim.org','68E23BC0-4A6D-C463-8ED5-19B3E3EADDE5',3,1,'tellus.eu@estvitae.edu','6081234567',233561821,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(81,'Non Corp.','sed.dolor@etmagnisdis.com','DDE68417-756A-EC88-171C-D0150DB973DA',2,2,'consectetuer.euismod.est@nonfeugiatnec.ca','6081234567',319858274,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(82,'Lorem Ipsum PC','tellus@imperdiet.com','E3379BE8-6AE7-22BE-4BB2-F4AF26547936',2,3,'ac.feugiat.non@velitQuisque.edu','6081234567',965381374,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(83,'Eget LLC','tellus@posuereat.edu','DF43D5A2-4DAC-4203-27B3-A462461201FF',3,5,'Cras.lorem@tinciduntduiaugue.co.uk','6081234567',139873169,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(84,'Sem Consequat Corp.','accumsan.interdum@nascetur.co.uk','3338E91F-4B70-12E0-5C91-535ACDFE36AE',3,4,'adipiscing.lobortis.risus@faucibusut.co.uk','6081234567',492407076,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(85,'Tempus Foundation','sociosqu@Duis.ca','6D095659-45E3-F16A-D398-4FCC87D11353',1,3,'turpis.egestas.Aliquam@Nullasempertellus.ca','6081234567',178813527,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(86,'Duis Corporation','tristique.senectus.et@vulputateeu.org','9144E5A7-54E1-C760-592D-ADA435EA0DF3',1,1,'lectus.quis@vitae.ca','6081234567',961221683,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(87,'Mauris Company','Etiam@ornareliberoat.edu','7ED075D8-C7B9-DE42-2D85-1913DF5FEFF7',3,5,'Class.aptent.taciti@nullamagna.ca','6081234567',973300269,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(88,'Vivamus PC','pede.Nunc.sed@sitametnulla.co.uk','46DE70F8-181A-E060-920D-579D4375E570',4,4,'Proin.nisl.sem@vulputateposuerevulputate.ca','6081234567',372160423,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(89,'Senectus Et Netus Ltd','nisi.Mauris@molestie.org','FD74D280-BBB5-BB9F-4AF4-B7BD861E1F4A',2,2,'sit.amet.risus@ligulaAenean.co.uk','6081234567',600654825,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(90,'Semper Nam Inc.','magna.Nam.ligula@ante.net','C544516C-E27A-3770-4727-9E935FDDF073',4,2,'Donec.luctus@mauris.ca','6081234567',90293859,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(91,'Rutrum Magna Cras Ltd','ac@Suspendisse.co.uk','D466E8E3-37A8-DC7B-67DC-ADB5797A8AE3',4,3,'tempor.diam.dictum@ligula.org','6081234567',919360163,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(92,'Sit PC','nibh@sitamet.net','3CB19114-D1CE-3972-D7F5-6440700CA0A4',3,4,'elementum.purus@non.com','6081234567',292273648,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(93,'Nonummy Ac Feugiat Foundation','mauris.aliquam.eu@porttitorinterdumSed.edu','5CA130F1-1628-CC0F-9FA6-9BE0B31F9691',3,5,'semper.auctor@sit.ca','6081234567',60854944,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(94,'Purus Ac Inc.','consectetuer@Cumsociis.com','75CF9EE8-5ABF-AEC2-B085-D8406DFCCFBD',2,2,'Donec.nibh@primis.org','6081234567',799541829,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(95,'Dolor Dapibus Gravida Corp.','Sed.auctor@Integervitaenibh.edu','E9D16A45-1C1E-A25F-09D2-C9B9AD74C231',4,5,'velit@loremvehiculaet.net','6081234567',116990769,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(96,'Tincidunt Company','libero.Integer.in@neccursus.com','644E220B-9328-E96E-11D8-D5C9D9B10B46',2,2,'ut@luctusvulputatenisi.co.uk','6081234567',750311134,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(97,'Porttitor Corp.','urna.Nullam.lobortis@Crasegetnisi.edu','5319A019-6FCE-C946-D937-FA239BFCA2E8',2,4,'arcu.Vestibulum@nec.co.uk','6081234567',84255494,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(98,'Velit Justo Company','tincidunt.Donec.vitae@morbitristique.org','6CDA9205-889F-0B7B-A005-0E48F9FE4D4F',2,4,'erat.eget.ipsum@egestas.edu','6081234567',189524341,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(99,'Arcu Vel Quam Inc.','adipiscing.lobortis.risus@a.com','8F93B6AC-A161-13B0-84B5-A5EE439B2693',1,2,'magnis@euismodenimEtiam.com','6081234567',892930364,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(100,'Ipsum Curabitur Corp.','cubilia.Curae@Praesentluctus.co.uk','DA7D33B2-1600-32A4-E4F0-470E22E4B037',2,3,'primis@Proinvel.com','6081234567',875126428,'2020-09-27 15:59:07','2020-09-27 15:59:07'),(115,'Orci Consectetuer Euismod Institute','www.yelp.com','18E33DA9-2526-676E-DBC8-0236B4F3722B',1,4,'www.yelp.com/test','6081234567',803863873,'2020-09-29 21:33:36','2020-09-29 21:33:36');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `zipcode` int NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `searches_ibfk_1` (`user_id`),
  CONSTRAINT `searches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
INSERT INTO `searches` VALUES (1,608,53719,'Madison','wi','2020-09-28 21:16:42','2020-09-28 21:16:42'),(2,608,53719,'Madison','wi','2020-09-28 21:16:50','2020-09-28 21:16:50');
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_plan_invites`
--

DROP TABLE IF EXISTS `user_plan_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_plan_invites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_plan_id` int NOT NULL,
  `attending` bit(1) DEFAULT NULL,
  `closed` bit(1) NOT NULL DEFAULT b'0',
  `declineMessage` text,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_plan_invites_ibfk_1` (`user_plan_id`),
  KEY `user_plan_invites_ibfk_2` (`user_id`),
  CONSTRAINT `user_plan_invites_ibfk_1` FOREIGN KEY (`user_plan_id`) REFERENCES `user_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_plan_invites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_plan_invites`
--

LOCK TABLES `user_plan_invites` WRITE;
/*!40000 ALTER TABLE `user_plan_invites` DISABLE KEYS */;
INSERT INTO `user_plan_invites` VALUES (2,608,2,_binary '\0',_binary '\0','cant make it!','2020-09-28 20:37:25','2020-09-28 20:37:25'),(3,615,2,_binary '\0',_binary '\0','cant make it!','2020-09-28 20:41:22','2020-09-28 20:41:22'),(21,620,3,_binary '\0',_binary '\0','cant make it!','2020-09-29 21:33:39','2020-09-29 21:33:39');
/*!40000 ALTER TABLE `user_plan_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_plans`
--

DROP TABLE IF EXISTS `user_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `location_id` int NOT NULL,
  `removed` bit(1) NOT NULL DEFAULT b'0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_plans_ibfk_1` (`location_id`),
  KEY `user_plans_ibfk_2` (`user_id`),
  CONSTRAINT `user_plans_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_plans_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_plans`
--

LOCK TABLES `user_plans` WRITE;
/*!40000 ALTER TABLE `user_plans` DISABLE KEYS */;
INSERT INTO `user_plans` VALUES (2,608,1,_binary '\0','2020-09-29 21:33:38','2020-09-28 19:24:25'),(3,608,1,_binary '\0','2020-09-28 19:26:26','2020-09-28 19:26:26'),(20,608,1,_binary '\0','2020-09-29 21:33:39','2020-09-29 21:33:39');
/*!40000 ALTER TABLE `user_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=738 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (608,'fmanilove0','Edgepulse','Manilove','Fonz','fmanilove0@technorati.com',_binary '\0','2020-09-27 15:59:07','2020-09-27 15:59:07'),(609,'bbalm1','Feednation','Balm','Bil','bbalm1@theguardian.com',_binary '\0','2020-09-27 15:59:07','2020-09-27 15:59:07'),(610,'hgreneham2','Realmix','Greneham','Hadley','hgreneham2@squidoo.com',_binary '\0','2020-09-27 15:59:07','2020-09-27 15:59:07'),(611,'pdaunter3','Rhynoodle','Daunter','Papagena','pdaunter3@deliciousdays.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(612,'gshaughnessy4','Jazzy','Shaughnessy','Gnni','gshaughnessy4@studiopress.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(613,'ithorns5','Mymm','Thorns','Inga','ithorns5@twitpic.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(614,'jclemintoni6','Gabtype','Clemintoni','Joete','jclemintoni6@bloglovin.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(615,'dsilverlock7','Kwideo','Silverlock','Dorella','dsilverlock7@dell.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(616,'adoole8','Tavu','Doole','Artemis','adoole8@bing.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(617,'pheibel9','Chatterbridge','Heibel','Pennie','pheibel9@telegraph.co.uk',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(618,'pdebella','Realblab','De Bell','Piper','pdebella@csmonitor.com',_binary '\0','2020-09-27 15:59:08','2020-09-27 15:59:08'),(619,'ocarlsonb','JumpXS','Carlson','Odetta','ocarlsonb@guardian.co.uk',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(620,'mscamadinec','Talane','Scamadine','Marja','mscamadinec@altervista.org',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(621,'lsowrayd','Browseblab','Sowray','Loralee','lsowrayd@archive.org',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(622,'jbakee','Browsedrive','Bake','Jojo','jbakee@ehow.com',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(623,'mpechardf','BlogXS','Pechard','Major','mpechardf@ca.gov',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(624,'cstockleg','Kamba','Stockle','Corry','cstockleg@craigslist.org',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(625,'dmachanh','Skinix','Machan','Dalia','dmachanh@indiatimes.com',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(626,'destrellai','Browsecat','Estrella','Dagny','destrellai@intel.com',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(627,'afuscoj','Innotype','Fusco','Alexander','afuscoj@noaa.gov',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(628,'jabdonk','Skivee','Abdon','Joleen','jabdonk@histats.com',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(629,'leversonl','Mycat','Everson','Loydie','leversonl@samsung.com',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(630,'amontfordm','Skilith','Montford','Amata','amontfordm@intel.com',_binary '\0','2020-09-27 15:59:09','2020-09-27 15:59:09'),(631,'edrein','Eire','Drei','Edithe','edrein@dyndns.org',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(632,'cwiggamo','Voomm','Wiggam','Claudell','cwiggamo@mashable.com',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(633,'fsimmp','Oyoyo','Simm','Fergus','fsimmp@cnn.com',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(634,'khyndeq','Avamba','Hynde','Kala','khyndeq@slashdot.org',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(635,'gclowtonr','Browsebug','Clowton','Gerik','gclowtonr@lycos.com',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(636,'pramages','Kwinu','Ramage','Philippe','pramages@comsenz.com',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(637,'etilbrookt','Topdrive','Tilbrook','Eziechiele','etilbrookt@cyberchimps.com',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(638,'jmoneypennyu','Dabvine','Moneypenny','Jackqueline','jmoneypennyu@hexun.com',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(639,'repinev','Zoomlounge','Epine','Rodolphe','repinev@earthlink.net',_binary '\0','2020-09-27 15:59:10','2020-09-27 15:59:10'),(640,'psextyw','Muxo','Sexty','Philomena','psextyw@drupal.org',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(641,'nosheildsx','Zava','O\'Sheilds','Nicki','nosheildsx@spotify.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(642,'gdoberery','Feedmix','Doberer','Glendon','gdoberery@admin.ch',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(643,'ccrosoerz','Kwinu','Crosoer','Clemmy','ccrosoerz@theglobeandmail.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(644,'twincom10','Fatz','Wincom','Teador','twincom10@github.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(645,'njentzsch11','Midel','Jentzsch','Neilla','njentzsch11@vistaprint.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(646,'gbottini12','Zoomdog','Bottini','Gaile','gbottini12@tripadvisor.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(647,'canand13','Zoombeat','Anand','Cully','canand13@wikispaces.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(648,'bgresswell14','Skyvu','Gresswell','Bendicty','bgresswell14@mail.ru',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(649,'cline15','Skippad','Line','Chryste','cline15@furl.net',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(650,'dpolin16','Oyoloo','Polin','Dody','dpolin16@eventbrite.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(651,'ootridge17','InnoZ','Otridge','Orel','ootridge17@newsvine.com',_binary '\0','2020-09-27 15:59:11','2020-09-27 15:59:11'),(652,'gpritchitt18','Wikido','Pritchitt','Gawain','gpritchitt18@toplist.cz',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(653,'lsanpher19','Wordify','Sanpher','Laurent','lsanpher19@buzzfeed.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(654,'ifosdick1a','Oyoyo','Fosdick','Isabelita','ifosdick1a@spiegel.de',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(655,'abartelli1b','Browsebug','Bartelli','Almire','abartelli1b@csmonitor.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(656,'ccovely1c','Eimbee','Covely','Codi','ccovely1c@rediff.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(657,'klangtree1d','JumpXS','Langtree','Kimberlee','klangtree1d@discovery.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(658,'rgirodias1e','Lazzy','Girodias','Rollo','rgirodias1e@hugedomains.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(659,'achristy1f','Skidoo','Christy','Agace','achristy1f@nba.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(660,'dbaverstock1g','Jetwire','Baverstock','Davine','dbaverstock1g@columbia.edu',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(661,'oburrow1h','Meedoo','Burrow','Olivia','oburrow1h@chron.com',_binary '\0','2020-09-27 15:59:12','2020-09-27 15:59:12'),(662,'dayrton1i','Abata','Ayrton','Dionysus','dayrton1i@about.com',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(663,'kbewshea1j','Lazzy','Bewshea','Kinny','kbewshea1j@nps.gov',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(664,'mmildmott1k','Geba','Mildmott','Mel','mmildmott1k@gov.uk',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(665,'ehabergham1l','Tanoodle','Habergham','Estele','ehabergham1l@gravatar.com',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(666,'gaffleck1m','Voonte','Affleck','Georgina','gaffleck1m@mit.edu',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(667,'mdale1n','Wordify','Dale','Marysa','mdale1n@elpais.com',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(668,'qmunroe1o','Livepath','Munroe','Quintus','qmunroe1o@mapquest.com',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(669,'ocherryholme1p','Bubbletube','Cherry Holme','Otho','ocherryholme1p@zdnet.com',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(670,'rkeling1q','Jetwire','Keling','Reba','rkeling1q@about.com',_binary '\0','2020-09-27 15:59:13','2020-09-27 15:59:13'),(671,'dmuirhead1r','Podcat','Muirhead','Dorisa','dmuirhead1r@so-net.ne.jp',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(672,'hfranken1s','Izio','Franken','Hunter','hfranken1s@wufoo.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(673,'cmcentagart1t','Dabtype','McEntagart','Charlton','cmcentagart1t@wired.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(674,'lsnepp1u','Youtags','Snepp','Lulita','lsnepp1u@time.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(675,'atizard1v','Feedmix','Tizard','Anna-maria','atizard1v@fc2.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(676,'lzeal1w','Youspan','Zeal','Louisette','lzeal1w@webnode.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(677,'ehame1x','Ainyx','Hame','Emerson','ehame1x@multiply.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(678,'flivings1y','Tanoodle','Livings','Farra','flivings1y@google.de',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(679,'alake1z','Mydeo','Lake','Alex','alake1z@privacy.gov.au',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(680,'lmettricke20','Realpoint','Mettricke','Linet','lmettricke20@unc.edu',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(681,'kgiordano21','Skynoodle','Giordano','Kakalina','kgiordano21@businessinsider.com',_binary '\0','2020-09-27 15:59:14','2020-09-27 15:59:14'),(682,'scoggin22','Realfire','Coggin','Sammy','scoggin22@bravesites.com',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(683,'jabercromby23','Thoughtbridge','Abercromby','Jeanelle','jabercromby23@flickr.com',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(684,'lbowcher24','Jazzy','Bowcher','Laurel','lbowcher24@xinhuanet.com',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(685,'dgirardot25','JumpXS','Girardot','Damon','dgirardot25@utexas.edu',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(686,'bgianinotti26','Trudeo','Gianinotti','Briant','bgianinotti26@narod.ru',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(687,'alivingston27','Skimia','Livingston','Angelica','alivingston27@indiatimes.com',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(688,'mhumphris28','Tekfly','Humphris','Marco','mhumphris28@51.la',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(689,'cnijs29','Trunyx','Nijs','Conrade','cnijs29@ox.ac.uk',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(690,'bsainer2a','Yoveo','Sainer','Bernie','bsainer2a@shareasale.com',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(691,'fparell2b','Leenti','Parell','Feliks','fparell2b@wsj.com',_binary '\0','2020-09-27 15:59:15','2020-09-27 15:59:15'),(692,'csonier2c','Flashspan','Sonier','Cristin','csonier2c@scientificamerican.com',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(693,'keicke2d','Mymm','Eicke','Karlotte','keicke2d@slideshare.net',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(694,'ccayet2e','Eazzy','Cayet','Claudetta','ccayet2e@bravesites.com',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(695,'trosenboim2f','Tazzy','Rosenboim','Theresita','trosenboim2f@intel.com',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(696,'ttall2g','Digitube','Tall','Theadora','ttall2g@upenn.edu',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(697,'icopeman2h','Eare','Copeman','Issie','icopeman2h@artisteer.com',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(698,'cworswick2i','Browsebug','Worswick','Christean','cworswick2i@yahoo.com',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(699,'hredsall2j','Gabtype','Redsall','Huberto','hredsall2j@gnu.org',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(700,'epee2k','Skimia','Pee','Erick','epee2k@usda.gov',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(701,'gcurado2l','Quinu','Curado','Georgi','gcurado2l@oaic.gov.au',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(702,'jwelband2m','Edgepulse','Welband','Johan','jwelband2m@so-net.ne.jp',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(703,'wbreewood2n','Kare','Breewood','Winthrop','wbreewood2n@booking.com',_binary '\0','2020-09-27 15:59:16','2020-09-27 15:59:16'),(704,'kjime2o','Feedspan','Jime','Kayne','kjime2o@nymag.com',_binary '\0','2020-09-27 15:59:17','2020-09-27 15:59:17'),(705,'sdavitashvili2p','Jaxnation','Davitashvili','Sloan','sdavitashvili2p@webs.com',_binary '\0','2020-09-27 15:59:17','2020-09-27 15:59:17'),(706,'mstembridge2q','Trupe','Stembridge','Margarete','mstembridge2q@nba.com',_binary '\0','2020-09-27 15:59:17','2020-09-27 15:59:17'),(707,'skalb2r','Tagfeed','Kalb','Shandra','skalb2r@discuz.net',_binary '\0','2020-09-27 15:59:17','2020-09-27 15:59:17'),(737,'cruzang','test','cruz','angel','testInsert@madisoncollege.edu',_binary '','2020-09-29 21:33:39','2020-09-29 21:33:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-01 21:04:07