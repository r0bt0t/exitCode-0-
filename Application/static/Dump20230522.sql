CREATE DATABASE  IF NOT EXISTS `exitcode0` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exitcode0`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: exitcode0
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jobs2`
--

DROP TABLE IF EXISTS `jobs2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs2` (
  `jobNo` int NOT NULL AUTO_INCREMENT,
  `visitdate` date DEFAULT NULL,
  `ampm` varchar(20) DEFAULT NULL,
  `accNum` int NOT NULL,
  `custFname` varchar(15) NOT NULL,
  `custSname` varchar(25) NOT NULL,
  `custAddress` varchar(50) NOT NULL,
  `custPcode` varchar(7) NOT NULL,
  `jobType` varchar(25) NOT NULL,
  `jobDesc` varchar(35) NOT NULL,
  `jobNotes` varchar(100) DEFAULT NULL,
  `jobDura` varchar(8) NOT NULL,
  `engalloc` varchar(50) DEFAULT NULL,
  `completed` varchar(20) DEFAULT NULL,
  `jobref` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jobNo`),
  UNIQUE KEY `accNum` (`accNum`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs2`
--

LOCK TABLES `jobs2` WRITE;
/*!40000 ALTER TABLE `jobs2` DISABLE KEYS */;
INSERT INTO `jobs2` VALUES (1,'2023-05-21','AM',1743876,'Miss Susan','Smith','17 Flamboyant Way, Chelmsford','CM11XB','Sky Q Install','INSTALL SKY Q 2TB, 2 Q MINI','Customer asked for engineer to walk the family spaniel','115 Mins','Q Multiskill','Yes','VR9000001'),(2,'2023-05-22','AM',1745342,'Mr Frank','Gammon','12 Cambridge Close, Sudbury','CO102SU','FTTP Installation','RELOCATE SKY HUB','Customer will be on school run from 9am - 10am','110 Mins','FTTP Upskill','Yes','VR9000002'),(3,'2023-05-22','AM',1745272,'Mr Larry','Dewilde','Applebee, Sawston','CB223BU','Sky Q Install','INSTALL SKY Q, Q MINI','','100 Mins','Q Multiskill','Yes','VR9000003'),(4,'2023-05-23','PM',1432432,'Mrs Dorothy','McBride','21 Meadow View Close, Sawston','CB223BZ','FTTP Installation','RELOCATE SKY HUB','Customer wont be available from 3-5pm','110 Mins','FTTP Upskill','No','VR9000004'),(5,'2023-05-23','PM',8364522,'Mr Mark','Rendall','The Manse, High Street, Long Melford','CO109JS','Sky Q Install','INSTALL SKY Q 1TB UHD','Customer has requested engineer brings beer','55 Mins','Q Multiskill','Yes','VR9000005'),(6,'2023-05-21','AM',1734645,'Mr Ryan','Parker','The Old Rectory, Great Waldingfield','CO100RS','Sky Q Install','INSTALL SKY Q 1TB, 2 Q MINI','I have white gates opposite a phone box, please honk twice for entrance','115 Mins','Q Multiskill','No','VR9000006'),(7,'2023-05-19','AM',9386232,'Mr Aaron','Gardiner','3 Biscay Close, Haverhill','CB98JQ','FTTP Installation','RELOCATE SKY HUB','','110 Mins','FTTP Upskill','Yes','VR9000007'),(8,'2023-05-22','PM',1893744,'Miss Karen','Hadley','47 Pavillion Court, Newmarket','CB80EF','Sky Q Install','INSTALL SKY Q 1TB, 2 Q MINI','Can the engineer bring ladders','115 Mins','Q Multiskill','No','VR9000008'),(9,'2023-05-21','PM',9864322,'Mrs Octavia','Higbee','Ye Old Farm, Steeple Bumpstead','CB97DT','FTTP Installation','RELOCATE SKY HUB','Customer is elderly, please give extra time at the door','110 Mins','FTTP Upskill','No','VR9000009'),(10,'2023-05-20','14:00-16:00',1957326,'Mr Dwayne','Chance','Cloverleaves, Ipswich','IP29BS','Broadband Service Visit','WIFI GUARANTEE','Please call 07777777777 if lost','115 Mins','BB','Yes','VR9000010'),(11,'2023-05-21','AM',9548967,'Mr Kevin','Bacon','7a High Street, Wickham St Paul','CO92PG','Sky Q Install','INSTALL SKY Q 2TB UHD, 2 Q MINI','','115 Mins','Q Multiskill','No','VR9000011'),(12,'2023-05-22','AM',8882563,'Mrs Lottie','Harris','1 The Street, Royston','S714DN','FTTP Installation','RELOCATE SKY HUB','','110 Mins','FTTP Upskill','No','VR9000012'),(13,'2023-05-22','AM',3217363,'Mr Jordan','Coles','12 Hall Street, Ely','CB63NN','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Dish and cable already installed by independant','115 Mins','Q Multiskill','No','VR9000013'),(14,'2023-05-20','AM',1108372,'Mr Robert','McCall','Ratatouie, Lens Lane, Sawbridge','CV238AT','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Customer would like to retain hd box to watch recordings','115 Mins','Q Multiskill','No','VR9000014'),(15,'2023-05-22','14:00-16:00',9785621,'Mrs Sarah','Borgess','The Hall, Hall Lane, Liston','CO107HS','Broadband Service Visit','WIFI GUARANTEE','Please allow an extra hour as customer mau not be home in time','115 Mins','BB','Yes','VR9000015'),(16,'2023-05-22','PM',1978442,'Miss Harriet','Johnson','Oak House, Flounder Road, Halstead','CO91NL','Sky Q Install','INSTALL SKY Q 1TB','Please call prior to visit','55 Mins','Q Multiskill','No','VR9000016'),(17,'2023-05-24','AM',8327863,'Mr Adrian','Byfield','34 East Street, Sudbury','CO102TP','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Escalated complaint. Customer would like dish attached to 15\' pole in garden','115 Mins','Q Multiskill','No','VR9000017'),(18,'2023-05-24','AM',1233412,'Mr Kieren','Letts','Acorns, Lavender Way, Bury St Edmunds','IP333UX','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Please see MHR','115 Mins','Q Multiskill','No','VR9000018'),(19,'2023-05-20','AM',1234522,'Miss Rebecca','Brown','788 Church Street, Mildenhall','IP287JU','Sky Q Install','INSTALL SKY Q 2TB UHD, 2 Q MINI','','115 Mins','Q Multiskill','No','VR9000019'),(20,'2023-05-24','PM',9898982,'Mrs Summer','Shellard','12 Reliant Way, Thetford','IP241EB','FTTP Installation','RELOCATE SKY HUB','Customers broadband is currently slow, please make sure FTTP is fast','110 Mins','FTTP Upskill','No','VR9000020'),(21,'2023-05-22','PM',8998211,'Mr Andy','Franks','Lazybones, Hall Lane, Preston','PR21BD','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Please call prior to visit','115 Mins','Q Multiskill','No','VR9000021'),(22,'2023-05-22','AM',8989231,'Miss Jenny','Newman','12 Lucky Lane, Finchingfield','CM74LS','Sky Q Install','INSTALL SKY Q 1TB','Property is hard to find and no signal in village. Please call if lost','55 Mins','Q Multiskill','No','VR9000022'),(23,'2023-05-21','AM',5721872,'Mrs Katy','Bailey','15 Shelford Avenue, Richmond','TW91DZ','Sky Q Install','INSTALL SKY Q 1TB','Customer has requested that she doesn\'t have same engineer as before as he seemed \'lazy\'','55 Mins','Q Multiskill','Yes','VR9000023'),(24,'2023-05-22','PM',1239812,'Mr Lawrence','Henderson','90 Fleet Road, Royston','SG89AW','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','','115 Mins','Q Multiskill','No','VR9000024'),(25,'2023-05-21','PM',2341457,'Mr Andrew','Alington','12 Flax Lane, Bury St Edmunds','IP332QZ','FTTP Installation','RELOCATE SKY HUB','Please make broadband very very fast','110 Mins','FTTP Upskill','No','VR9000025'),(26,'2023-05-22','AM',6153155,'Miss Gillian','Gappy','17 Mountbatten Road, Sudbury','CO101YY','Broadband Service Vist','WIFI GUARANTEE','Beware of children','115 Mins','BB','No','VR9000026'),(27,'2023-05-20','AM',5615615,'Mr Jeremiah','Smith','17 Lambert Avenue, Haverhill','CB97JR','FTTP Installation','RELOCATE SKY HUB','Customer in distress. Not completed from 120423','110 Mins','FTTP Upskill','No','VR9000027'),(28,'2023-05-22','PM',2345454,'Mr Fenwick','McWickee','Sausage House, High Street, Linton','CB214HS','Sky Q Install','INSTALL SKY Q 1TB, Q MINI','','100 Mins','Q Multiskill','No','VR9000028'),(29,'2023-05-21','PM',2752524,'Mrs Mariah','Carey','The Big House, Diva Lane, Beck Row','IP288NG','FTTP Installation','RELOCATE SKY HUB','Knock loudly, customer will be practicing her singing.','110 Mins','FTTP Upskill','No','VR9000029'),(30,'2023-05-20','14:00-16:00',1111125,'Mr Jacob','Fensayer','12 Church Road, Stanway, Colchester','CO38LT','Broadband Service Visit','WIFI GUARANTEE','Customer will be available after 3pm','55 Mins','BB','No','VR9000030'),(31,'2023-05-21','AM',4352435,'Mrs Alishia','Fenwright','Tower Hall, The Street, Kennet','CB87UA','Sky Q Install','INSTALL SKY Q 1TB, Q MINI','Customer warns of driving on lawn','105 Mins','Q Multiskill','No','VR9000031'),(32,'2023-05-22','AM',7892316,'Mr Bruce','Wayne','Gothem House, The Street, Ridgewell','CO94RT','FTTP Installation','RELOCATE SKY HUB','Customer will be on a school run until 5pm','110 Mins','FTTP Upskill','No','VR9000032'),(33,'2023-05-22','14:00-16:00',4352345,'Miss Sophie','Levitt','19 Old Court, Stowmarket','IP141HN','Broadband Service Visit','WIFI GUARANTEE','Only getting 410MB should be 450','50 Mins','BB','No','VR9000033'),(34,'2023-05-24','AM',9379653,'Mrs Jane','Maine','28 Eastcotts Street, High Street Sturmer','CB97XF','FTTP Installation','RELOCATE SKY HUB','5 Childreen need more internet!!','110 Mins','FTTP Upskill','No','VR9000034'),(35,'2023-05-22','PM',3454536,'Mr Nathan','Drake','12 Unchartered Lane, Bildeston','IP77EB','Sky Q Install','INSTALL SKY Q 1TB, Q MINI','May be wearing headphones when you arrive. If no answer please call','105 Mins','Q Multiskill','No','VR9000035'),(36,'2023-05-20','AM',9543537,'Mr Ricardo','Freeman','12 East Street, Sudbury','CO102TP','Sky Q Install','INSTALL SKY Q 1TB','No parking near property. Please park in pub carpark','55 Mins','Q Multiskill','No','VR9000036'),(37,'2023-05-23','AM',8345351,'Mrs Melissa','Trump','19 Lillies Avenue, Soham','CB75UF','FTTP Installation','RELOCATE SKY HUB','Please call 07675287265 before arrival','110 Mins','FTTP Upskill','No','VR9000037'),(38,'2023-05-22','14:00-16:00',3745637,'Mr James','May','12 Top House, Gear street, Belchamp St Paul','CO107BQ','Broadband Service Visit','WIFI GUARANTEE','Customer claims internet is terrible','115 Mins','BB','No','VR9000038'),(39,'2023-05-21','PM',4355345,'Mr Richard','Jackson','888 Flex Street, Hadleigh','IP75BH','Sky Q Install','INSTALL SKY Q 1TB UHD','Please Call','55 Mins','Q Multiskill','No','VR9000039'),(40,'2023-05-22','14:00-16:00',3453235,'Mrs Lisa','Bones','12 East Town Road, Haverhill','CB97UR','Broadband Service Visit','WIFI GUARANTEE','','55 Mins','BB','No','VR9000040'),(41,'2023-05-23','PM',4352783,'Miss Violet','Hues','67 Beatty Road, Sudbury','CO101PL','Sky Q Install','INSTALL SKY Q 2TB UHD','','55 Mins','Q Multiskill','No','VR9000041'),(42,'2023-05-22','AM',4423235,'Mr Jack','Jones','12 Lost Cemetary Lane, Sible Hedingham','CO93QH','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Please call and give accurate ETA','115 Mins','Q Multiskill','No','VR9000042'),(43,'2023-05-20','AM',3796345,'Mr Lesley','Ash','Flag House, Flox Street, Brent Eleigh','IP79PB','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','Customer would like to purchase additional mini','115 Mins','Q Multiskill','No','VR9000043'),(44,'2023-05-23','AM',3798374,'Miss Annie','Smith','321 Reach Way, Cambridge','CB13DF','Sky Q Install','INSTALL SKY Q 2TB UHD, 2 Q MINI','No parking around property or carparks. Please walk','115 Mins','Q Multiskill','No','VR9000044'),(45,'2023-05-23','PM',6935124,'Mrs Flynn','Feline','11 Cats Lane, Sudbury','CO100HP','FTTP Installation','RELOCATE SKY HUB','Openreach were refused entry due to muddy boots','110 Mins','FTTP Upskill','No','VR9000045'),(46,'2023-05-23','PM',7354653,'Mr Ned','Flanders','12 Doodle Lane, Elmswell','IP309UH','Sky Q Install','INSTALL SKY Q 1TB UHD, 2 Q MINI','No TV\'s at property','115 Mins','Q Multiskill','No','VR9000046'),(47,'2023-05-20','AM',9223123,'Miss Erica','Baddu','14 Barracks Road, Mildenhall','IP287DP','Sky Q Install','INSTALL SKY Q 1TB','Customer hasn\'t moved in but is expecting meys by 7pm','55 Mins','Q Multiskill','No','VR9000047'),(48,'2023-05-24','AM',6345283,'Mrs Steven','Knight','11 Shelly Way, Earls Colne','CO62PH','Sky Q Install','INSTALL SKY Q 1TB','Customer would like an updated ETA in the morning','55 Mins','Q Multiskill','No','VR9000048'),(49,'2023-05-21','AM',3453658,'Mr Jo','Flakey','12 Wrights Green, Ely','CB74HZ','Sky Q Install','INSTALL SKY Q 2TB UHD, 2 Q MINI','Train crossing is currently closed, please drive 17 mile diversion','115 Mins','Q Multiskill','No','VR9000049'),(50,'2023-05-20','PM',9776954,'Mr Patrick','Star','12 Pineapple Street, Dover','CT179DH','FTTP Installation','RELOCATE SKY HUB','','110 Mins','FTTP Upskill','No','VR9000050');
/*!40000 ALTER TABLE `jobs2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users2`
--

DROP TABLE IF EXISTS `users2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users2` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `Skills` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users2`
--

LOCK TABLES `users2` WRITE;
/*!40000 ALTER TABLE `users2` DISABLE KEYS */;
INSERT INTO `users2` VALUES (1,'Robert','Totton','email@email.com','abc','RTN-b18','BB'),(8,'John','Doe','john@doe.co.uk','123','JDE-50b','Q Multiskill'),(81,'John','Jones','jonesie@anotheremail.co.uk','Johnisback123!','JJS-4be','FTTP Upskill'),(82,'Sean','McGonnigal','maccyG@gonners.ei','1Rishman!','SML-5a7',NULL);
/*!40000 ALTER TABLE `users2` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `generate_user_name2` BEFORE INSERT ON `users2` FOR EACH ROW BEGIN
    DECLARE uuid CHAR(36);
    SET uuid = REPLACE(UUID(), '-', '');
    SET NEW.user_name = CONCAT(
        UPPER(SUBSTRING(NEW.first_name, 1, 1)),
        UPPER(SUBSTRING(NEW.last_name, 1, 1)),
        UPPER(SUBSTRING(NEW.last_name, -1)),
        '-',
        LEFT(uuid, 3)
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'exitcode0'
--

--
-- Dumping routines for database 'exitcode0'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 20:24:39
