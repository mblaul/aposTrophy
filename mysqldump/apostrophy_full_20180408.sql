CREATE DATABASE  IF NOT EXISTS `apostrophy` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `apostrophy`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: apostrophy
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `OPTION_ID` int(1) NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  `OPTION_TEXT` varchar(500) NOT NULL,
  `IS_CORRECT` int(1) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`,`OPTION_ID`),
  CONSTRAINT `OPTIONS_ibfk_1` FOREIGN KEY (`QUESTION_ID`) REFERENCES `question` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'One character argues with another character\r\nwho intrudes on her home.',0),(2,1,'One character receives a surprising request from\r\nanother character.',1),(3,1,'One character reminisces about choices she has\r\nmade over the years.',0),(4,1,'One character criticizes another character for\r\npursuing an unexpected course of action.',0),(1,2,'A careful analysis of a traditional practice',0),(2,2,'A detailed depiction of a meaningful encounter',1),(3,2,'A definitive response to a series of questions',0),(4,2,'A cheerful recounting of an amusing anecdote',0),(1,3,'frankly.',0),(2,3,'confidently.',0),(3,3,'without mediation',1),(4,3,'with precision.',0),(1,4,'She will consider his proposal inappropriate.',1),(2,4,'She will mistake his earnestness for immaturity.',0),(3,4,'She will consider his unscheduled visit an imposition.',0),(4,4,'She will underestimate the sincerity of his emotions.',0),(1,5,'Line 33 (“His voice... refined”)',0),(2,5,'Lines 49-51 (“You... mind”)',0),(3,5,'Lines 63-64 (“Please... proposal”)',1),(4,5,'Lines 71-72 (“Eager... face”)',0),(1,6,'affection but not genuine love.',0),(2,6,'objectivity but not complete impartiality.',0),(3,6,'amusement but not mocking disparagement.',0),(4,6,'respect but not utter deference.',1),(1,7,'describe a culture.',0),(2,7,'criticize a tradition',0),(3,7,'question a suggestion.',0),(4,7,'analyze a reaction.',1),(1,8,'appearance.',0),(2,8,'custom.',1),(3,8,'structure.',0),(4,8,'nature.',0),(1,9,'He fears that his own parents will disapprove of Naomi.',0),(2,9,'He worries that Naomi will reject him and marry someone else.',0),(3,9,'He has been offered an attractive job in another country.',1),(4,9,'He knows that Chie is unaware of his feelings for Naomi.',0),(1,10,'NO CHANGE',0),(2,10,'Hawaii,',1),(3,10,'Hawaii, being',0),(4,10,'Hawaii, it is',0),(1,11,'NO CHANGE',0),(2,11,'As a result,',0),(3,11,'In addition,',0),(4,11,'However,',1),(1,12,'NO CHANGE',0),(2,12,'athletics and welcomed their',1),(3,12,'athletics, and welcomed there,',0),(4,12,'athletics and, welcomed there',0),(1,13,'emphasize how difficult the race truly is. ',1),(2,13,'mourn how few athletes are able to visit Hawaii in order to compete in the race. ',0),(3,13,'highlight that most athletes prefer the run to the swimming or biking components of the race. ',0),(4,13,'suggest that women are not truly competitive in the race.',0),(1,14,'Twelve other people also finished the race that day.',0),(2,14,'There were points in the race when Haller thought he couldn\'t possibly finish. ',0),(3,14,'No women raced this year, but that was soon to change. ',0),(4,14,'Haller\'s amazing physical strength had enabled him to do what no one else in the past had accomplished.',1),(1,15,'where it is now.',0),(2,15,'before the word in. ',0),(3,15,'before the word amusing (changing an to a).',1),(4,15,'before the word way.',0),(1,16,'NO CHANGE',1),(2,16,'verified',0),(3,16,'justified',0),(4,16,'certified',0),(1,17,'NO CHANGE',0),(2,17,'become',0),(3,17,'became',1),(4,17,'becamed',0),(1,18,'The individuals',0),(2,18,'That',1),(3,18,'The athletes',0),(4,18,'The people',0),(1,19,'discusses the level of interest the race attracts in the present day. ',1),(2,19,'describes the way the current race is different from the race that Haller ran in 1978. ',0),(3,19,'describes how the victors respond when they cross the finish line. ',0),(4,19,'explains why 1,500 people would be willing to compete in such a difficult race.',0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paragraph`
--

DROP TABLE IF EXISTS `paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paragraph` (
  `PARAGRAPH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAGRAPH_TEXT` text NOT NULL,
  PRIMARY KEY (`PARAGRAPH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraph`
--

LOCK TABLES `paragraph` WRITE;
/*!40000 ALTER TABLE `paragraph` DISABLE KEYS */;
INSERT INTO `paragraph` VALUES (1,'Akira came directly, breaking all tradition. Was\nthat it? Had he followed form—had he asked his\nmother to speak to his father to approach a\ngo-between—would Chie have been more receptive?\nHe came on a winter’s eve. He pounded on the\ndoor while a cold rain beat on the shuttered veranda,\nso at first Chie thought him only the wind. The maid\nknew better. Chie heard her soft scuttling footsteps,\nthe creak of the door. Then the maid brought a\ncalling card to the drawing room, for Chie.\nChie was reluctant to go to her guest; perhaps she\nwas feeling too cozy. She and Naomi were reading at\na low table set atop a charcoal brazier. A thick quilt\nspread over the sides of the table so their legs were\ntucked inside with the heat.\n“Who is it at this hour, in this weather?” Chie\nquestioned as she picked the name card off the\nmaid’s lacquer tray.\n“Shinoda, Akira. Kobe Dental College,” she read.\nNaomi recognized the name. Chie heard a soft\nintake of air.\n“I think you should go,” said Naomi.\nAkira was waiting in the entry. He was in his early\ntwenties, slim and serious, wearing the black\nmilitary-style uniform of a student. As he\nbowed—his hands hanging straight down, a\nblack cap in one, a yellow oil-paper umbrella in the\nother—Chie glanced beyond him. In the glistening\nsurface of the courtyard’s rain-drenched paving\nstones, she saw his reflection like a dark double.\n“Madame,” said Akira, “forgive my disruption,\nbut I come with a matter of urgency.”\nHis voice was soft, refined. He straightened and\nstole a deferential peek at her face.\nIn the dim light his eyes shone with sincerity.\nChie felt herself starting to like him.\n“Come inside, get out of this nasty night. Surely\nyour business can wait for a moment or two.”\n“I don’t want to trouble you. Normally I would\napproach you more properly but I’ve received word\nof a position. I’ve an opportunity to go to America, as\ndentist for Seattle’s Japanese community.”\n“Congratulations,” Chie said with amusement.\n“That is an opportunity, I’m sure. But how am I\ninvolved?”\nEven noting Naomi’s breathless reaction to the\nname card, Chie had no idea. Akira’s message,\ndelivered like a formal speech, filled her with\nmaternal amusement. You know how children speak\nso earnestly, so hurriedly, so endearingly about\nthings that have no importance in an adult’s mind?\nThat’s how she viewed him, as a child.\nIt was how she viewed Naomi. Even though\nNaomi was eighteen and training endlessly in the arts\nneeded to make a good marriage, Chie had made no\neffort to find her a husband.\nAkira blushed.\n“Depending on your response, I may stay in\nJapan. I’ve come to ask for Naomi’s hand.”\nSuddenly Chie felt the dampness of the night.\n“Does Naomi know anything of your...\nambitions?”\n“We have an understanding. Please don’t judge\nmy candidacy by the unseemliness of this proposal. I\nask directly because the use of a go-between takes\nmuch time. Either method comes down to the same\nthing: a matter of parental approval. If you give your\nconsent, I become Naomi’s yoshi.* We’ll live in the\nHouse of Fuji. Without your consent, I must go to\nAmerica, to secure a new home for my bride.”\nEager to make his point, he’d been looking her full\nin the face. Abruptly, his voice turned gentle. “I see\nI’ve startled you. My humble apologies. I’ll take no\nmore of your evening. My address is on my card. If\nyou don’t wish to contact me, I’ll reapproach you in\ntwo weeks’ time. Until then, good night.”\nHe bowed and left. Taking her ease, with effortless\ngrace, like a cat making off with a fish.\n“Mother?” Chie heard Naomi’s low voice and\nturned from the door. “He has asked you?”\nThe sight of Naomi’s clear eyes, her dark brows\ngave Chie strength. Maybe his hopes were\npreposterous.\n“Where did you meet such a fellow? Imagine! He\nthinks he can marry the Fuji heir and take her to\nAmerica all in the snap of his fingers!”\nChie waited for Naomi’s ripe laughter.\nNaomi was silent. She stood a full half minute\nlooking straight into Chie’s eyes. Finally, she spoke.\n“I met him at my literary meeting.”\nNaomi turned to go back into the house, then\nstopped.\n“Mother.”\n“Yes?”\n“I mean to have him.”\n* a man who marries a woman of higher status and takes her\nfamily’s name'),(2,'The term \"Iron Man\" has many connotations, including references to a song, a comic book icon, even a movie. Yet only one definition of the term truly lives up to its name: the Ironman Triathlon held annually in Hawaii a picturesque setting for a challenging race. This grueling race demands amazing physical prowess and the ability to swim, bike, and run a marathon, all in less than 12 hours with no break. Very few individuals are up to the task.Otherwise, Gordon Haller is a notable exception. Growing up in the 1950s, Haller developed an interest in many sports categorized as endurance athletics, and welcomed their grueling physical demands. As he pursued a degree in physics he drove a taxi to pay the bills, but competitive training proved his passion. So when he heard about the race in 1978, the first year it was held, he immediately signed up.\n\nThe race somewhat originated in an amusing way. The members of two popular sports clubs, the Mid-Pacific Road Runners of Honolulu, and the Waikiki Swim Club of Oahu, had a long-standing and good-natured debate going over who made better athletes: runners or swimmers. However, some local bikers thought both clubs were wrong, while claiming that they, in fact, deserved the title. Wanting to settle the dispute once and for all, when they decided to combine three separate races already held annually on the island into one massive test of endurance. Thus, the Waikiki Roughwater Swim of 2.4 miles, the Around-Oahu Bike race of 112 miles, and the Honolulu Marathon of 26.2 miles were all combined to form the Ironman Triathlon.\n\nHaller was one of only fifteen competitors to show up that February morning to start the race. He quickly scanned the few pages of rules and instructions, and while reading those pages on the last page he discovered a sentence that would become the race\'s famous slogan: \"Swim 2.4 miles! Bike 112 miles! Run 26.2 miles! Brag for the rest of your life!\" Haller took that to heart, and at the end of the day, he had became the first Ironman champion in history.\n\n\n\n\nIn the approximately thirty years since that very first race, the Ironman has become a tradition in Hawaii and now boasts approximately 1,500 entrants every year. The competitors14 who complete the race don\'t have to be the first across the finish line to claim success: just finishing is a victory unto itself.\n');
/*!40000 ALTER TABLE `paragraph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `QUESTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAGRAPH_ID` int(11) NOT NULL,
  `QUESTION_TEXT` text NOT NULL,
  `SKILL_LVL` int(11) NOT NULL,
  `AREA` varchar(25) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`),
  KEY `PARAGRAPH_ID` (`PARAGRAPH_ID`),
  CONSTRAINT `QUESTION_ibfk_1` FOREIGN KEY (`PARAGRAPH_ID`) REFERENCES `paragraph` (`PARAGRAPH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'Which choice best describes what happens in the\r\npassage?',1,'Comprehension'),(2,1,'Which choice best describes the developmental\r\npattern of the passage?',2,'Comprehension'),(3,1,'As used in line 1 and line 65, “directly” most\nnearly means',1,'Comprehension'),(4,1,'Which reaction does Akira most fear from Chie?',2,'Comprehension'),(5,1,'Which choice provides the best evidence for the answer to the previous question?',2,'Comprehension'),(6,1,'In the passage, Akira addresses Chie with “a matter of urgency”?',1,'Comprehension'),(7,1,'The main purpose of the first paragraph is to',3,'Comprehension'),(8,1,'As used in line 2, “form” most nearly means',1,'Comprehension'),(9,1,'Why does Akira say his meeting with Chie is “a matter of urgency”?',3,'Comprehension'),(10,2,'What should be changed for “Hawaii” in, “the Ironman Triathlon held annually in Hawaii a picturesque setting for a challenging race”?',2,'Grammar'),(11,2,'What should be changed for “otherwise” in, “Otherwise, Gordon Haller is a notable exception.”?',1,'Grammar'),(12,2,'What should be changed for “athletics, and welcomed their”  in, “developed an interest in many sports categorized as endurance athletics, and welcomed their grueling physical demands”?',3,'Grammar'),(13,2,' If the writer were to delete Sentence 4, the essay would primarily lose details that:',2,'Grammar'),(14,2,'Which of the following true statements, if added here, would most effectively and specifically emphasize Haller\'s achievement as described in this essay?',2,'Grammar'),(15,2,'The best placement for the word “somewhat” in “the race somewhat originated in an amusing way,” would be:',3,'Grammar'),(16,2,'What should be changed for “proved”  in, “but competitive training proved his passion”?',1,'Grammar'),(17,2,'What should be changed for “had became” in, “and at the end of the day, he had became the first Ironman champion in history”?',1,'Grammar'),(18,2,'Which of the following alternatives to “the competitors” in “the competitors who complete the race don\'t have to be the first across the finish line to claim success” would be LEAST acceptable?',2,'Grammar'),(19,2,' If the writer were to delete the final paragraph of this essay, the essay would primarily lose information that:',3,'Grammar');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `RESULT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `RESULT_DATE` date NOT NULL,
  `TEST_TYPE` varchar(15) NOT NULL,
  `TEST_SKILL_LVL` int(11) DEFAULT NULL,
  `TEST_AREA` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RESULT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `RESULT_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `tbl_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COMMENT='Table to store results from ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (4,1,'2018-03-31','SIM',NULL,NULL),(5,10,'2018-03-31','SIM',NULL,NULL),(6,10,'2018-03-31','SIM',NULL,NULL),(7,10,'2018-04-04','SIM',NULL,NULL),(8,10,'2018-04-05','PRAC',1,'Grammar'),(9,10,'2018-04-05','SIM',NULL,NULL),(10,11,'2018-04-05','PRAC',2,'Grammar'),(11,11,'2018-04-05','SIM',NULL,'ALL'),(12,11,'2018-04-05','PRAC',2,'Grammar'),(13,11,'2018-04-05','SIM',NULL,'ALL'),(14,11,'2018-04-05','SIM',NULL,'ALL'),(15,11,'2018-04-05','SIM',NULL,'ALL'),(16,11,'2018-04-05','SIM',NULL,'ALL'),(17,11,'2018-04-05','SIM',NULL,'ALL'),(18,11,'2018-04-05','SIM',NULL,'ALL'),(19,11,'2018-04-05','PRAC',1,'Grammar'),(20,11,'2018-04-05','PRAC',3,'Grammar'),(21,11,'2018-04-05','PRAC',1,'Grammar'),(22,11,'2018-04-05','PRAC',2,'Comprehension'),(23,11,'2018-04-05','PRAC',2,'Grammar'),(24,11,'2018-04-05','PRAC',1,'Comprehension'),(25,11,'2018-04-05','SIM',NULL,'ALL'),(26,11,'2018-04-06','PRAC',1,'Grammar'),(27,11,'2018-04-06','SIM',NULL,'ALL');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_line`
--

DROP TABLE IF EXISTS `result_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_line` (
  `RESULT_LINE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(11) NOT NULL,
  `OPTION_ID` int(1) NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`RESULT_LINE_ID`),
  KEY `QUESTION_ID` (`QUESTION_ID`,`OPTION_ID`),
  KEY `RESULT_LINE_ibfk_2_idx` (`RESULT_ID`),
  CONSTRAINT `RESULT_LINE_ibfk_1` FOREIGN KEY (`QUESTION_ID`, `OPTION_ID`) REFERENCES `options` (`QUESTION_ID`, `OPTION_ID`),
  CONSTRAINT `RESULT_LINE_ibfk_2` FOREIGN KEY (`RESULT_ID`) REFERENCES `result` (`RESULT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1 COMMENT='Table to match user option to a result line';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_line`
--

LOCK TABLES `result_line` WRITE;
/*!40000 ALTER TABLE `result_line` DISABLE KEYS */;
INSERT INTO `result_line` VALUES (13,4,1,1),(14,4,2,2),(15,4,3,3),(16,4,3,4),(17,4,3,5),(18,4,2,6),(19,5,1,1),(20,5,2,2),(21,5,3,3),(22,5,3,4),(23,5,3,5),(24,5,2,6),(25,6,2,1),(26,6,1,2),(27,6,1,3),(28,6,1,4),(29,6,1,5),(30,6,2,6),(31,7,1,1),(32,7,1,2),(33,7,3,3),(34,7,3,4),(35,7,4,5),(36,7,1,6),(37,7,2,7),(38,7,2,8),(39,7,2,9),(40,7,4,10),(41,7,1,11),(42,7,2,12),(43,7,2,13),(44,7,3,14),(45,7,3,15),(46,7,3,16),(47,7,1,17),(48,7,2,18),(49,7,2,19),(50,8,2,11),(51,8,3,16),(52,8,1,17),(53,10,2,10),(54,10,2,13),(55,10,2,14),(56,10,1,18),(57,11,1,1),(58,11,2,2),(59,11,3,10),(60,12,2,10),(61,12,1,14),(62,12,2,18),(63,15,2,4),(64,16,3,3),(65,16,2,4),(66,16,2,6),(67,16,3,7),(68,16,2,8),(69,16,2,9),(70,16,1,10),(71,16,2,11),(72,16,3,12),(73,16,3,15),(74,16,2,16),(75,16,3,17),(76,16,2,18),(77,16,1,19),(78,17,3,1),(79,17,2,2),(80,18,1,1),(81,18,2,2),(82,18,3,3),(83,18,2,4),(84,18,3,7),(85,18,2,8),(86,19,1,11),(87,19,2,16),(88,19,2,17),(89,20,1,12),(90,20,2,15),(91,20,2,19),(92,21,2,11),(93,21,2,16),(94,21,2,17),(95,22,3,2),(96,22,2,4),(97,22,2,5),(98,23,1,10),(99,23,2,13),(100,23,3,14),(101,23,2,18),(102,24,2,1),(103,24,3,3),(104,24,4,6),(105,24,2,8),(106,26,1,11),(107,26,4,16),(108,26,2,17),(109,27,2,1),(110,27,2,2),(111,27,2,3),(112,27,2,4),(113,27,3,5),(114,27,2,6),(115,27,3,7),(116,27,3,8),(117,27,2,9),(118,27,3,10);
/*!40000 ALTER TABLE `result_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(255) DEFAULT NULL,
  `user_lname` varchar(255) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Test','User','test@test.com','pbkdf2:sha256:50000$',NULL),(2,'Matt','Ball','matt@ball.com','password123',NULL),(3,'Janel','Yousif','janel@gmail.com','pbkdf2:sha256:50000$',NULL),(4,'test','test','test@terst.com','123456',NULL),(5,'ben2','wyatt','testest@masidfas.com','123123123123',NULL),(8,'test222','teest','2131231@sdfsf.com','12312312313',NULL),(9,'test222222','teest','2131231@sdfsfsss.com','12312312313',NULL),(10,'matt','blaul','matt@blaul.com','123456',NULL),(11,'Matt','Blaul','matt@blaul2.com','pbkdf2:sha256:50000$WwtmScng$444d51bb6f4d707a6e3c1a46d9b785310088275de7184ee64e3719ba28ae7071',NULL),(12,'Test','User99','test@user99.com','pbkdf2:sha256:50000$PqNum1l8$249bc929a56f540e84b751a4e03886cb0b44bdd99386c756004158a84f81b6df','Hawkins High School');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'apostrophy'
--

--
-- Dumping routines for database 'apostrophy'
--
/*!50003 DROP FUNCTION IF EXISTS `func_checkOptionIsCorrect` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_checkOptionIsCorrect`(
		optid int
	) RETURNS int(11)
BEGIN
    RETURN IF((SELECT is_correct from options where option_id = optid) = 1, 1 ,0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_authenticateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_authenticateUser`(IN `p_username` VARCHAR(255), IN `p_password` VARCHAR(255))
BEGIN

IF ( select not exists (select * from tbl_user where user_username = p_username and user_password = p_password) ) THEN
	select 'Incorrect username or password';
        
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_fname VARCHAR(255),
    IN p_lname VARCHAR(255),
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    IN p_school VARCHAR (255)
)
BEGIN
    if ( select exists (select 1 from tbl_user where user_username = p_username) ) THEN
     
        select 'Username exists already!!';
     
    ELSE
 		insert into tbl_user
        (
            user_fname,
            user_lname,
            user_username,
            user_password,
            user_school
        )
        values
        (
            p_fname,
            p_lname,
            p_username,
            p_password,
            p_school
        );
     
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generateSimExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generateSimExam`()
    NO SQL
SELECT PARAGRAPH.PARAGRAPH_ID, PARAGRAPH.PARAGRAPH_TEXT, apostrophy.QUESTION.QUESTION_ID, apostrophy.QUESTION.QUESTION_TEXT, apostrophy.QUESTION.SKILL_LVL, apostrophy.QUESTION.AREA, apostrophy.OPTIONS.OPTION_ID, apostrophy.OPTIONS.OPTION_TEXT, apostrophy.OPTIONS.IS_CORRECT
FROM apostrophy.PARAGRAPH
RIGHT JOIN apostrophy.QUESTION ON QUESTION.PARAGRAPH_ID = PARAGRAPH.PARAGRAPH_ID
RIGHT JOIN apostrophy.OPTIONS ON OPTIONS.QUESTION_ID = QUESTION.QUESTION_ID
ORDER BY apostrophy.QUESTION.QUESTION_ID ASC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getResults`(IN uid VARCHAR(255))
BEGIN
	SELECT
	   result.result_date,
       result_line.result_id, 
       result.test_type,
       result.test_area,
       AVG(options.is_correct)
       
FROM   options 
       JOIN result_line 
         ON result_line.option_id = options.option_id 
            AND options.question_id = result_line.question_id 
       JOIN result 
         ON result_line.result_id = result.result_id
	   
       WHERE user_id = uid
GROUP  BY result_line.result_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserID`(IN `p_username` VARCHAR(255))
BEGIN
	SELECT USER_ID FROM tbl_user WHERE user_username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_newResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_newResult`(
	IN uid BIGINT(20),
    IN testtype VARCHAR(15),
    IN testskilllevel INT(11),
    IN testarea VARCHAR(25)
)
BEGIN
	insert into result
        (
			USER_ID,
			RESULT_DATE,
            TEST_TYPE,
            TEST_SKILL_LVL,
            TEST_AREA
        )
        values
        (
			uid,
            NOW(),
            testtype,
            testskilllevel,
            testarea
        );
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_newResultLine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_newResultLine`(
    IN optid VARCHAR(1),
    IN qid VARCHAR(11)
)
BEGIN
	insert into result_line
        (
			RESULT_ID,
			OPTION_ID,
            QUESTION_ID
            
        )
        values
        (
			(SELECT RESULT_ID FROM RESULT ORDER BY RESULT_ID DESC LIMIT 1),
            optid,
            qid
        );
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-08 14:18:56
