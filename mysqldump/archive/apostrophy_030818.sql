-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: apostrophy
-- ------------------------------------------------------
-- Server version	5.5.57-0ubuntu0.14.04.1

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
-- Table structure for table `OPTIONS`
--

DROP TABLE IF EXISTS `OPTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPTIONS` (
  `OPTION_ID` int(1) NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  `OPTION_TEXT` varchar(500) NOT NULL,
  `IS_CORRECT` int(1) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`,`OPTION_ID`),
  CONSTRAINT `OPTIONS_ibfk_1` FOREIGN KEY (`QUESTION_ID`) REFERENCES `QUESTION` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTIONS`
--

LOCK TABLES `OPTIONS` WRITE;
/*!40000 ALTER TABLE `OPTIONS` DISABLE KEYS */;
INSERT INTO `OPTIONS` VALUES (1,1,'One character argues with another character\r\nwho intrudes on her home.',0),(2,1,'One character receives a surprising request from\r\nanother character.',1),(3,1,'One character reminisces about choices she has\r\nmade over the years.',0),(4,1,'One character criticizes another character for\r\npursuing an unexpected course of action.',0),(1,2,'A careful analysis of a traditional practice',0),(2,2,'A detailed depiction of a meaningful encounter',1),(3,2,'A definitive response to a series of questions',0),(4,2,'A cheerful recounting of an amusing anecdote',0),(1,3,'frankly.',0),(2,3,'confidently.',0),(3,3,'without mediation',1),(4,3,'with precision.',0),(1,4,'She will consider his proposal inappropriate.',1),(2,4,'She will mistake his earnestness for immaturity.',0),(3,4,'She will consider his unscheduled visit an imposition.',0),(4,4,'She will underestimate the sincerity of his emotions.',0),(1,5,'Line 33 (“His voice... refined”)',0),(2,5,'Lines 49-51 (“You... mind”)',0),(3,5,'Lines 63-64 (“Please... proposal”)',1),(4,5,'Lines 71-72 (“Eager... face”)',0),(1,6,'affection but not genuine love.',0),(2,6,'objectivity but not complete impartiality.',0),(3,6,'amusement but not mocking disparagement.',0),(4,6,'respect but not utter deference.',1);
/*!40000 ALTER TABLE `OPTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PARAGRAPH`
--

DROP TABLE IF EXISTS `PARAGRAPH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARAGRAPH` (
  `PARAGRAPH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAGRAPH_TEXT` text NOT NULL,
  PRIMARY KEY (`PARAGRAPH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARAGRAPH`
--

LOCK TABLES `PARAGRAPH` WRITE;
/*!40000 ALTER TABLE `PARAGRAPH` DISABLE KEYS */;
INSERT INTO `PARAGRAPH` VALUES (1,'Akira came directly, breaking all tradition. Was\nthat it? Had he followed form—had he asked his\nmother to speak to his father to approach a\ngo-between—would Chie have been more receptive?\nHe came on a winter’s eve. He pounded on the\ndoor while a cold rain beat on the shuttered veranda,\nso at first Chie thought him only the wind. The maid\nknew better. Chie heard her soft scuttling footsteps,\nthe creak of the door. Then the maid brought a\ncalling card to the drawing room, for Chie.\nChie was reluctant to go to her guest; perhaps she\nwas feeling too cozy. She and Naomi were reading at\na low table set atop a charcoal brazier. A thick quilt\nspread over the sides of the table so their legs were\ntucked inside with the heat.\n“Who is it at this hour, in this weather?” Chie\nquestioned as she picked the name card off the\nmaid’s lacquer tray.\n“Shinoda, Akira. Kobe Dental College,” she read.\nNaomi recognized the name. Chie heard a soft\nintake of air.\n“I think you should go,” said Naomi.\nAkira was waiting in the entry. He was in his early\ntwenties, slim and serious, wearing the black\nmilitary-style uniform of a student. As he\nbowed—his hands hanging straight down, a\nblack cap in one, a yellow oil-paper umbrella in the\nother—Chie glanced beyond him. In the glistening\nsurface of the courtyard’s rain-drenched paving\nstones, she saw his reflection like a dark double.\n“Madame,” said Akira, “forgive my disruption,\nbut I come with a matter of urgency.”\nHis voice was soft, refined. He straightened and\nstole a deferential peek at her face.\nIn the dim light his eyes shone with sincerity.\nChie felt herself starting to like him.\n“Come inside, get out of this nasty night. Surely\nyour business can wait for a moment or two.”\n“I don’t want to trouble you. Normally I would\napproach you more properly but I’ve received word\nof a position. I’ve an opportunity to go to America, as\ndentist for Seattle’s Japanese community.”\n“Congratulations,” Chie said with amusement.\n“That is an opportunity, I’m sure. But how am I\ninvolved?”\nEven noting Naomi’s breathless reaction to the\nname card, Chie had no idea. Akira’s message,\ndelivered like a formal speech, filled her with\nmaternal amusement. You know how children speak\nso earnestly, so hurriedly, so endearingly about\nthings that have no importance in an adult’s mind?\nThat’s how she viewed him, as a child.\n1 1 .......................................................................................................................................................................................................\nLine\n5\n10\n15\n20\n25\n30\n35\n40\n45\n50\nUnauthorized copying or reuse of any part of this page is illegal. CONTINUE\n2\nIt was how she viewed Naomi. Even though\nNaomi was eighteen and training endlessly in the arts\nneeded to make a good marriage, Chie had made no\neffort to find her a husband.\nAkira blushed.\n“Depending on your response, I may stay in\nJapan. I’ve come to ask for Naomi’s hand.”\nSuddenly Chie felt the dampness of the night.\n“Does Naomi know anything of your...\nambitions?”\n“We have an understanding. Please don’t judge\nmy candidacy by the unseemliness of this proposal. I\nask directly because the use of a go-between takes\nmuch time. Either method comes down to the same\nthing: a matter of parental approval. If you give your\nconsent, I become Naomi’s yoshi.* We’ll live in the\nHouse of Fuji. Without your consent, I must go to\nAmerica, to secure a new home for my bride.”\nEager to make his point, he’d been looking her full\nin the face. Abruptly, his voice turned gentle. “I see\nI’ve startled you. My humble apologies. I’ll take no\nmore of your evening. My address is on my card. If\nyou don’t wish to contact me, I’ll reapproach you in\ntwo weeks’ time. Until then, good night.”\nHe bowed and left. Taking her ease, with effortless\ngrace, like a cat making off with a fish.\n“Mother?” Chie heard Naomi’s low voice and\nturned from the door. “He has asked you?”\nThe sight of Naomi’s clear eyes, her dark brows\ngave Chie strength. Maybe his hopes were\npreposterous.\n“Where did you meet such a fellow? Imagine! He\nthinks he can marry the Fuji heir and take her to\nAmerica all in the snap of his fingers!”\nChie waited for Naomi’s ripe laughter.\nNaomi was silent. She stood a full half minute\nlooking straight into Chie’s eyes. Finally, she spoke.\n“I met him at my literary meeting.”\nNaomi turned to go back into the house, then\nstopped.\n“Mother.”\n“Yes?”\n“I mean to have him.”\n* a man who marries a woman of higher status and takes her\nfamily’s name');
/*!40000 ALTER TABLE `PARAGRAPH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QUESTION`
--

DROP TABLE IF EXISTS `QUESTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QUESTION` (
  `QUESTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARAGRAPH_ID` int(11) NOT NULL,
  `QUESTION_TEXT` text NOT NULL,
  `SKILL_LVL` int(11) NOT NULL,
  `AREA` varchar(25) NOT NULL,
  PRIMARY KEY (`QUESTION_ID`),
  KEY `PARAGRAPH_ID` (`PARAGRAPH_ID`),
  CONSTRAINT `QUESTION_ibfk_1` FOREIGN KEY (`PARAGRAPH_ID`) REFERENCES `PARAGRAPH` (`PARAGRAPH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QUESTION`
--

LOCK TABLES `QUESTION` WRITE;
/*!40000 ALTER TABLE `QUESTION` DISABLE KEYS */;
INSERT INTO `QUESTION` VALUES (1,1,'Which choice best describes what happens in the\r\npassage?',1,'Comprehension'),(2,1,'Which choice best describes the developmental\r\npattern of the passage?',2,'Comprehension'),(3,1,'As used in line 1 and line 65, “directly” most\nnearly means',1,'Comprehension'),(4,1,'Which reaction does Akira most fear from Chie?',2,'Comprehension'),(5,1,'Which choice provides the best evidence for the answer to the previous question?',2,'Comprehension'),(6,1,'In the passage, Akira addresses Chie with',1,'Comprehension'),(7,1,'The main purpose of the first paragraph is to',3,'Comprehension');
/*!40000 ALTER TABLE `QUESTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESULT`
--

DROP TABLE IF EXISTS `RESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESULT` (
  `RESULT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `RESULT_LINE_ID` int(11) NOT NULL,
  `RESULT_DATE` date NOT NULL,
  `TEST_TYPE` varchar(15) NOT NULL,
  `TEST_SKILL_LVL` int(11) NOT NULL,
  `TEST_AREA` varchar(25) NOT NULL,
  PRIMARY KEY (`RESULT_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `RESULT_LINE_ID` (`RESULT_LINE_ID`),
  CONSTRAINT `RESULT_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `tbl_user` (`USER_ID`),
  CONSTRAINT `RESULT_ibfk_2` FOREIGN KEY (`RESULT_LINE_ID`) REFERENCES `RESULT_LINE` (`RESULT_LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to store results from ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESULT`
--

LOCK TABLES `RESULT` WRITE;
/*!40000 ALTER TABLE `RESULT` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESULT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESULT_LINE`
--

DROP TABLE IF EXISTS `RESULT_LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESULT_LINE` (
  `RESULT_LINE_ID` int(11) NOT NULL,
  `OPTION_ID` int(1) NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`RESULT_LINE_ID`),
  KEY `QUESTION_ID` (`QUESTION_ID`,`OPTION_ID`),
  CONSTRAINT `RESULT_LINE_ibfk_1` FOREIGN KEY (`QUESTION_ID`, `OPTION_ID`) REFERENCES `OPTIONS` (`QUESTION_ID`, `OPTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to match user option to a result line';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESULT_LINE`
--

LOCK TABLES `RESULT_LINE` WRITE;
/*!40000 ALTER TABLE `RESULT_LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESULT_LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(45) DEFAULT NULL,
  `user_lname` varchar(45) DEFAULT NULL,
  `user_username` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'Test','User','test@test.com','pbkdf2:sha256:50000$'),(2,'Matt','Ball','matt@ball.com','password123'),(3,'Janel','Yousif','janel@gmail.com','pbkdf2:sha256:50000$');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-09  0:08:50
