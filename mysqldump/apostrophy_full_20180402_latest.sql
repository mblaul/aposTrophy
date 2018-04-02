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
INSERT INTO `options` VALUES (1,1,'One character argues with another character\r\nwho intrudes on her home.',0),(2,1,'One character receives a surprising request from\r\nanother character.',1),(3,1,'One character reminisces about choices she has\r\nmade over the years.',0),(4,1,'One character criticizes another character for\r\npursuing an unexpected course of action.',0),(1,2,'A careful analysis of a traditional practice',0),(2,2,'A detailed depiction of a meaningful encounter',1),(3,2,'A definitive response to a series of questions',0),(4,2,'A cheerful recounting of an amusing anecdote',0),(1,3,'frankly.',0),(2,3,'confidently.',0),(3,3,'without mediation',1),(4,3,'with precision.',0),(1,4,'She will consider his proposal inappropriate.',1),(2,4,'She will mistake his earnestness for immaturity.',0),(3,4,'She will consider his unscheduled visit an imposition.',0),(4,4,'She will underestimate the sincerity of his emotions.',0),(1,5,'Line 33 (“His voice... refined”)',0),(2,5,'Lines 49-51 (“You... mind”)',0),(3,5,'Lines 63-64 (“Please... proposal”)',1),(4,5,'Lines 71-72 (“Eager... face”)',0),(1,6,'affection but not genuine love.',0),(2,6,'objectivity but not complete impartiality.',0),(3,6,'amusement but not mocking disparagement.',0),(4,6,'respect but not utter deference.',1),(1,7,'describe a culture.',0),(2,7,'criticize a tradition',0),(3,7,'question a suggestion.',0),(4,7,'analyze a reaction.',1),(1,8,'appearance.',0),(2,8,'custom.',1),(3,8,'structure.',0),(4,8,'nature.',0),(1,9,'He fears that his own parents will disapprove of Naomi.',0),(2,9,'He worries that Naomi will reject him and marry someone else.',0),(3,9,'He has been offered an attractive job in another country.',1),(4,9,'He knows that Chie is unaware of his feelings for Naomi.',0),(1,10,'Line 39 (“I don’t... you”)',0),(2,10,'Lines 39-42 (“Normally... community”)',1),(3,10,' Lines 58-59 (“Depending... Japan”)',0),(4,10,'Lines 72-73 (“I see... you”)',0);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paragraph` (
  `PARAGRAPH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAGRAPH_TEXT` text NOT NULL,
  PRIMARY KEY (`PARAGRAPH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraph`
--

LOCK TABLES `paragraph` WRITE;
/*!40000 ALTER TABLE `paragraph` DISABLE KEYS */;
INSERT INTO `paragraph` VALUES (1,'Akira came directly, breaking all tradition. Was\nthat it? Had he followed form—had he asked his\nmother to speak to his father to approach a\ngo-between—would Chie have been more receptive?\nHe came on a winter’s eve. He pounded on the\ndoor while a cold rain beat on the shuttered veranda,\nso at first Chie thought him only the wind. The maid\nknew better. Chie heard her soft scuttling footsteps,\nthe creak of the door. Then the maid brought a\ncalling card to the drawing room, for Chie.\nChie was reluctant to go to her guest; perhaps she\nwas feeling too cozy. She and Naomi were reading at\na low table set atop a charcoal brazier. A thick quilt\nspread over the sides of the table so their legs were\ntucked inside with the heat.\n“Who is it at this hour, in this weather?” Chie\nquestioned as she picked the name card off the\nmaid’s lacquer tray.\n“Shinoda, Akira. Kobe Dental College,” she read.\nNaomi recognized the name. Chie heard a soft\nintake of air.\n“I think you should go,” said Naomi.\nAkira was waiting in the entry. He was in his early\ntwenties, slim and serious, wearing the black\nmilitary-style uniform of a student. As he\nbowed—his hands hanging straight down, a\nblack cap in one, a yellow oil-paper umbrella in the\nother—Chie glanced beyond him. In the glistening\nsurface of the courtyard’s rain-drenched paving\nstones, she saw his reflection like a dark double.\n“Madame,” said Akira, “forgive my disruption,\nbut I come with a matter of urgency.”\nHis voice was soft, refined. He straightened and\nstole a deferential peek at her face.\nIn the dim light his eyes shone with sincerity.\nChie felt herself starting to like him.\n“Come inside, get out of this nasty night. Surely\nyour business can wait for a moment or two.”\n“I don’t want to trouble you. Normally I would\napproach you more properly but I’ve received word\nof a position. I’ve an opportunity to go to America, as\ndentist for Seattle’s Japanese community.”\n“Congratulations,” Chie said with amusement.\n“That is an opportunity, I’m sure. But how am I\ninvolved?”\nEven noting Naomi’s breathless reaction to the\nname card, Chie had no idea. Akira’s message,\ndelivered like a formal speech, filled her with\nmaternal amusement. You know how children speak\nso earnestly, so hurriedly, so endearingly about\nthings that have no importance in an adult’s mind?\nThat’s how she viewed him, as a child.\nIt was how she viewed Naomi. Even though\nNaomi was eighteen and training endlessly in the arts\nneeded to make a good marriage, Chie had made no\neffort to find her a husband.\nAkira blushed.\n“Depending on your response, I may stay in\nJapan. I’ve come to ask for Naomi’s hand.”\nSuddenly Chie felt the dampness of the night.\n“Does Naomi know anything of your...\nambitions?”\n“We have an understanding. Please don’t judge\nmy candidacy by the unseemliness of this proposal. I\nask directly because the use of a go-between takes\nmuch time. Either method comes down to the same\nthing: a matter of parental approval. If you give your\nconsent, I become Naomi’s yoshi.* We’ll live in the\nHouse of Fuji. Without your consent, I must go to\nAmerica, to secure a new home for my bride.”\nEager to make his point, he’d been looking her full\nin the face. Abruptly, his voice turned gentle. “I see\nI’ve startled you. My humble apologies. I’ll take no\nmore of your evening. My address is on my card. If\nyou don’t wish to contact me, I’ll reapproach you in\ntwo weeks’ time. Until then, good night.”\nHe bowed and left. Taking her ease, with effortless\ngrace, like a cat making off with a fish.\n“Mother?” Chie heard Naomi’s low voice and\nturned from the door. “He has asked you?”\nThe sight of Naomi’s clear eyes, her dark brows\ngave Chie strength. Maybe his hopes were\npreposterous.\n“Where did you meet such a fellow? Imagine! He\nthinks he can marry the Fuji heir and take her to\nAmerica all in the snap of his fingers!”\nChie waited for Naomi’s ripe laughter.\nNaomi was silent. She stood a full half minute\nlooking straight into Chie’s eyes. Finally, she spoke.\n“I met him at my literary meeting.”\nNaomi turned to go back into the house, then\nstopped.\n“Mother.”\n“Yes?”\n“I mean to have him.”\n* a man who marries a woman of higher status and takes her\nfamily’s name');
/*!40000 ALTER TABLE `paragraph` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'Which choice best describes what happens in the\r\npassage?',1,'Comprehension'),(2,1,'Which choice best describes the developmental\r\npattern of the passage?',2,'Comprehension'),(3,1,'As used in line 1 and line 65, “directly” most\nnearly means',1,'Comprehension'),(4,1,'Which reaction does Akira most fear from Chie?',2,'Comprehension'),(5,1,'Which choice provides the best evidence for the answer to the previous question?',2,'Comprehension'),(6,1,'In the passage, Akira addresses Chie with',1,'Comprehension'),(7,1,'The main purpose of the first paragraph is to',3,'Comprehension'),(8,1,'As used in line 2, “form” most nearly means',1,'Comprehension'),(9,1,'Why does Akira say his meeting with Chie is',3,'Comprehension'),(10,1,'Which choice provides the best evidence for the',2,'Comprehension');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Table to store results from ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (4,1,'2018-03-31','SIM',NULL,NULL),(5,10,'2018-03-31','SIM',NULL,NULL),(6,10,'2018-03-31','SIM',NULL,NULL);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COMMENT='Table to match user option to a result line';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_line`
--

LOCK TABLES `result_line` WRITE;
/*!40000 ALTER TABLE `result_line` DISABLE KEYS */;
INSERT INTO `result_line` VALUES (13,4,1,1),(14,4,2,2),(15,4,3,3),(16,4,3,4),(17,4,3,5),(18,4,2,6),(19,5,1,1),(20,5,2,2),(21,5,3,3),(22,5,3,4),(23,5,3,5),(24,5,2,6),(25,6,2,1),(26,6,1,2),(27,6,1,3),(28,6,1,4),(29,6,1,5),(30,6,2,6);
/*!40000 ALTER TABLE `result_line` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(255) DEFAULT NULL,
  `user_lname` varchar(255) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--
LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Test','User','test@test.com','pbkdf2:sha256:50000$'),(2,'Matt','Ball','matt@ball.com','password123'),(3,'Janel','Yousif','janel@gmail.com','pbkdf2:sha256:50000$'),(4,'test','test','test@terst.com','123456'),(5,'ben2','wyatt','testest@masidfas.com','123123123123'),(8,'test222','teest','2131231@sdfsf.com','12312312313'),(9,'test222222','teest','2131231@sdfsfsss.com','12312312313'),(10,'matt','blaul','matt@blaul.com','123456');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping events for database 'apostrophy'
--

--
-- Dumping routines for database 'apostrophy'
--
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
    IN p_password VARCHAR(255)
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
            user_password
        )
        values
        (
            p_fname,
            p_lname,
            p_username,
            p_password
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getResults`(IN `uid` VARCHAR(255))
BEGIN
	SELECT 	result.RESULT_ID, result_line.RESULT_LINE_ID, TEST_TYPE, TEST_SKILL_LVL, TEST_AREA, RESULT_LINE.QUESTION_ID, RESULT_LINE.OPTION_ID,
		OPTIONS.IS_CORRECT, SUM(OPTIONS.IS_CORRECT) as TOTAL_CORRECT
    FROM result
    LEFT JOIN result_line ON result_line.RESULT_ID = result.RESULT_ID
    LEFT JOIN options ON options.OPTION_ID = result_line.OPTION_ID 
    WHERE USER_ID = 10 
    GROUP BY RESULT_ID, RESULT_LINE_ID;
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

-- Dump completed on 2018-04-02 16:52:05
