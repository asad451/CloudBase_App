-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: reminder
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assignment` (
  `idassignment` int(11) NOT NULL AUTO_INCREMENT,
  `modulecode` varchar(45) DEFAULT NULL,
  `moduletitle` varchar(45) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `assignmentdesc` varchar(200) DEFAULT NULL,
  `unam` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idassignment`),
  KEY `unam` (`unam`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`unam`) REFERENCES `user` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,'COM6519','Cloud Computing','2018-12-18','coding waghera','asad'),(3,'adssa','asd','2019-04-24','asd','aaa'),(4,'com3433','cloud','2019-04-25','assignment desccrioton','aaa'),(5,'asad','asad','2019-04-21','asad','abc'),(6,'com4506','graphics','2019-04-20','table lamp','aaa'),(7,'COM 6509','Machine Learning','2018-06-13','A lot of Maths','asad'),(8,'COM6516','Object Oriented','2018-06-12','aldkfjladfksj','ahmed'),(9,'com6516','xcv','2018-06-08','adfa','ahmed'),(10,'ASDAD','ASDAD','2018-06-09','ASDAD','ahmed'),(11,'COM234','Table','2019-04-18','ksjflkas','liyan'),(13,'COM345','Programming','2019-04-28','some thing','asad'),(14,'COM999','Project','2019-05-05','Hello World','asad');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `uname` varchar(25) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('','',''),('aaa','aaa','aaa'),('abc','abc','anc'),('adf','adsf','asdf'),('ahmed','ahmed','ahmed'),('asad','asad','asad'),('asdad','asdad','asdad'),('asdasasd','sadasd','assd'),('bob','bob','bob'),('Bran','Bran','Bran'),('dan','dan','dan'),('kkk','kkk','kkk'),('liting','liting','liting'),('liyan','liyan','liyan'),('ppp','ppp','ppp');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 14:46:45
