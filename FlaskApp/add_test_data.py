from FlaskApp.core.models import db

# Taken from the SQL dumps

# Paragraphs
db.engine.execute('''INSERT INTO `paragraph` VALUES (1,'Akira came directly, breaking all tradition. Was\nthat it? Had he followed form—had he asked his\nmother to speak to his father to approach a\ngo-between—would Chie have been more receptive?\nHe came on a winter’s eve. He pounded on the\ndoor while a cold rain beat on the shuttered veranda,\nso at first Chie thought him only the wind. The maid\nknew better. Chie heard her soft scuttling footsteps,\nthe creak of the door. Then the maid brought a\ncalling card to the drawing room, for Chie.\nChie was reluctant to go to her guest; perhaps she\nwas feeling too cozy. She and Naomi were reading at\na low table set atop a charcoal brazier. A thick quilt\nspread over the sides of the table so their legs were\ntucked inside with the heat.\n“Who is it at this hour, in this weather?” Chie\nquestioned as she picked the name card off the\nmaid’s lacquer tray.\n“Shinoda, Akira. Kobe Dental College,” she read.\nNaomi recognized the name. Chie heard a soft\nintake of air.\n“I think you should go,” said Naomi.\nAkira was waiting in the entry. He was in his early\ntwenties, slim and serious, wearing the black\nmilitary-style uniform of a student. As he\nbowed—his hands hanging straight down, a\nblack cap in one, a yellow oil-paper umbrella in the\nother—Chie glanced beyond him. In the glistening\nsurface of the courtyard’s rain-drenched paving\nstones, she saw his reflection like a dark double.\n“Madame,” said Akira, “forgive my disruption,\nbut I come with a matter of urgency.”\nHis voice was soft, refined. He straightened and\nstole a deferential peek at her face.\nIn the dim light his eyes shone with sincerity.\nChie felt herself starting to like him.\n“Come inside, get out of this nasty night. Surely\nyour business can wait for a moment or two.”\n“I don’t want to trouble you. Normally I would\napproach you more properly but I’ve received word\nof a position. I’ve an opportunity to go to America, as\ndentist for Seattle’s Japanese community.”\n“Congratulations,” Chie said with amusement.\n“That is an opportunity, I’m sure. But how am I\ninvolved?”\nEven noting Naomi’s breathless reaction to the\nname card, Chie had no idea. Akira’s message,\ndelivered like a formal speech, filled her with\nmaternal amusement. You know how children speak\nso earnestly, so hurriedly, so endearingly about\nthings that have no importance in an adult’s mind?\nThat’s how she viewed him, as a child.\nIt was how she viewed Naomi. Even though\nNaomi was eighteen and training endlessly in the arts\nneeded to make a good marriage, Chie had made no\neffort to find her a husband.\nAkira blushed.\n“Depending on your response, I may stay in\nJapan. I’ve come to ask for Naomi’s hand.”\nSuddenly Chie felt the dampness of the night.\n“Does Naomi know anything of your...\nambitions?”\n“We have an understanding. Please don’t judge\nmy candidacy by the unseemliness of this proposal. I\nask directly because the use of a go-between takes\nmuch time. Either method comes down to the same\nthing: a matter of parental approval. If you give your\nconsent, I become Naomi’s yoshi.* We’ll live in the\nHouse of Fuji. Without your consent, I must go to\nAmerica, to secure a new home for my bride.”\nEager to make his point, he’d been looking her full\nin the face. Abruptly, his voice turned gentle. “I see\nI’ve startled you. My humble apologies. I’ll take no\nmore of your evening. My address is on my card. If\nyou don’t wish to contact me, I’ll reapproach you in\ntwo weeks’ time. Until then, good night.”\nHe bowed and left. Taking her ease, with effortless\ngrace, like a cat making off with a fish.\n“Mother?” Chie heard Naomi’s low voice and\nturned from the door. “He has asked you?”\nThe sight of Naomi’s clear eyes, her dark brows\ngave Chie strength. Maybe his hopes were\npreposterous.\n“Where did you meet such a fellow? Imagine! He\nthinks he can marry the Fuji heir and take her to\nAmerica all in the snap of his fingers!”\nChie waited for Naomi’s ripe laughter.\nNaomi was silent. She stood a full half minute\nlooking straight into Chie’s eyes. Finally, she spoke.\n“I met him at my literary meeting.”\nNaomi turned to go back into the house, then\nstopped.\n“Mother.”\n“Yes?”\n“I mean to have him.”\n* a man who marries a woman of higher status and takes her\nfamily’s name'),(2,'The term \"Iron Man\" has many connotations, including references to a song, a comic book icon, even a movie. Yet only one definition of the term truly lives up to its name: the Ironman Triathlon held annually in Hawaii a picturesque setting for a challenging race. This grueling race demands amazing physical prowess and the ability to swim, bike, and run a marathon, all in less than 12 hours with no break. Very few individuals are up to the task.Otherwise, Gordon Haller is a notable exception. Growing up in the 1950s, Haller developed an interest in many sports categorized as endurance athletics, and welcomed their grueling physical demands. As he pursued a degree in physics he drove a taxi to pay the bills, but competitive training proved his passion. So when he heard about the race in 1978, the first year it was held, he immediately signed up.\n\nThe race somewhat originated in an amusing way. The members of two popular sports clubs, the Mid-Pacific Road Runners of Honolulu, and the Waikiki Swim Club of Oahu, had a long-standing and good-natured debate going over who made better athletes: runners or swimmers. However, some local bikers thought both clubs were wrong, while claiming that they, in fact, deserved the title. Wanting to settle the dispute once and for all, when they decided to combine three separate races already held annually on the island into one massive test of endurance. Thus, the Waikiki Roughwater Swim of 2.4 miles, the Around-Oahu Bike race of 112 miles, and the Honolulu Marathon of 26.2 miles were all combined to form the Ironman Triathlon.\n\nHaller was one of only fifteen competitors to show up that February morning to start the race. He quickly scanned the few pages of rules and instructions, and while reading those pages on the last page he discovered a sentence that would become the race\\'s famous slogan: \"Swim 2.4 miles! Bike 112 miles! Run 26.2 miles! Brag for the rest of your life!\" Haller took that to heart, and at the end of the day, he had became the first Ironman champion in history.\n\n\n\n\nIn the approximately thirty years since that very first race, the Ironman has become a tradition in Hawaii and now boasts approximately 1,500 entrants every year. The competitors14 who complete the race don\\'t have to be the first across the finish line to claim success: just finishing is a victory unto itself.\n');''')

# Questions
db.engine.execute('''INSERT INTO `question` VALUES (1,1,'Which choice best describes what happens in the\r\npassage?',1,'Comprehension'),(2,1,'Which choice best describes the developmental\r\npattern of the passage?',2,'Comprehension'),(3,1,'As used in line 1 and line 65, “directly” most\nnearly means',1,'Comprehension'),(4,1,'Which reaction does Akira most fear from Chie?',2,'Comprehension'),(5,1,'Which choice provides the best evidence for the answer to the previous question?',2,'Comprehension'),(6,1,'In the passage, Akira addresses Chie with “a matter of urgency”?',1,'Comprehension'),(7,1,'The main purpose of the first paragraph is to',3,'Comprehension'),(8,1,'As used in line 2, “form” most nearly means',1,'Comprehension'),(9,1,'Why does Akira say his meeting with Chie is “a matter of urgency”?',3,'Comprehension'),(10,2,'What should be changed for “Hawaii” in, “the Ironman Triathlon held annually in Hawaii a picturesque setting for a challenging race”?',2,'Grammar'),(11,2,'What should be changed for “otherwise” in, “Otherwise, Gordon Haller is a notable exception.”?',1,'Grammar'),(12,2,'What should be changed for “athletics, and welcomed their”  in, “developed an interest in many sports categorized as endurance athletics, and welcomed their grueling physical demands”?',3,'Grammar'),(13,2,' If the writer were to delete Sentence 4, the essay would primarily lose details that:',2,'Grammar'),(14,2,'Which of the following true statements, if added here, would most effectively and specifically emphasize Haller\\'s achievement as described in this essay?',2,'Grammar'),(15,2,'The best placement for the word “somewhat” in “the race somewhat originated in an amusing way,” would be:',3,'Grammar'),(16,2,'What should be changed for “proved”  in, “but competitive training proved his passion”?',1,'Grammar'),(17,2,'What should be changed for “had became” in, “and at the end of the day, he had became the first Ironman champion in history”?',1,'Grammar'),(18,2,'Which of the following alternatives to “the competitors” in “the competitors who complete the race don\\'t have to be the first across the finish line to claim success” would be LEAST acceptable?',2,'Grammar'),(19,2,' If the writer were to delete the final paragraph of this essay, the essay would primarily lose information that:',3,'Grammar');''')

# Options
db.engine.execute('''INSERT INTO `options` VALUES (1,1,'One character argues with another character\r\nwho intrudes on her home.',0),(2,1,'One character receives a surprising request from\r\nanother character.',1),(3,1,'One character reminisces about choices she has\r\nmade over the years.',0),(4,1,'One character criticizes another character for\r\npursuing an unexpected course of action.',0),(1,2,'A careful analysis of a traditional practice',0),(2,2,'A detailed depiction of a meaningful encounter',1),(3,2,'A definitive response to a series of questions',0),(4,2,'A cheerful recounting of an amusing anecdote',0),(1,3,'frankly.',0),(2,3,'confidently.',0),(3,3,'without mediation',1),(4,3,'with precision.',0),(1,4,'She will consider his proposal inappropriate.',1),(2,4,'She will mistake his earnestness for immaturity.',0),(3,4,'She will consider his unscheduled visit an imposition.',0),(4,4,'She will underestimate the sincerity of his emotions.',0),(1,5,'Line 33 (“His voice... refined”)',0),(2,5,'Lines 49-51 (“You... mind”)',0),(3,5,'Lines 63-64 (“Please... proposal”)',1),(4,5,'Lines 71-72 (“Eager... face”)',0),(1,6,'affection but not genuine love.',0),(2,6,'objectivity but not complete impartiality.',0),(3,6,'amusement but not mocking disparagement.',0),(4,6,'respect but not utter deference.',1),(1,7,'describe a culture.',0),(2,7,'criticize a tradition',0),(3,7,'question a suggestion.',0),(4,7,'analyze a reaction.',1),(1,8,'appearance.',0),(2,8,'custom.',1),(3,8,'structure.',0),(4,8,'nature.',0),(1,9,'He fears that his own parents will disapprove of Naomi.',0),(2,9,'He worries that Naomi will reject him and marry someone else.',0),(3,9,'He has been offered an attractive job in another country.',1),(4,9,'He knows that Chie is unaware of his feelings for Naomi.',0),(1,10,'NO CHANGE',0),(2,10,'Hawaii,',1),(3,10,'Hawaii, being',0),(4,10,'Hawaii, it is',0),(1,11,'NO CHANGE',0),(2,11,'As a result,',0),(3,11,'In addition,',0),(4,11,'However,',1),(1,12,'NO CHANGE',0),(2,12,'athletics and welcomed their',1),(3,12,'athletics, and welcomed there,',0),(4,12,'athletics and, welcomed there',0),(1,13,'emphasize how difficult the race truly is. ',1),(2,13,'mourn how few athletes are able to visit Hawaii in order to compete in the race. ',0),(3,13,'highlight that most athletes prefer the run to the swimming or biking components of the race. ',0),(4,13,'suggest that women are not truly competitive in the race.',0),(1,14,'Twelve other people also finished the race that day.',0),(2,14,'There were points in the race when Haller thought he couldn\\'t possibly finish. ',0),(3,14,'No women raced this year, but that was soon to change. ',0),(4,14,'Haller\\'s amazing physical strength had enabled him to do what no one else in the past had accomplished.',1),(1,15,'where it is now.',0),(2,15,'before the word in. ',0),(3,15,'before the word amusing (changing an to a).',1),(4,15,'before the word way.',0),(1,16,'NO CHANGE',1),(2,16,'verified',0),(3,16,'justified',0),(4,16,'certified',0),(1,17,'NO CHANGE',0),(2,17,'become',0),(3,17,'became',1),(4,17,'becamed',0),(1,18,'The individuals',0),(2,18,'That',1),(3,18,'The athletes',0),(4,18,'The people',0),(1,19,'discusses the level of interest the race attracts in the present day. ',1),(2,19,'describes the way the current race is different from the race that Haller ran in 1978. ',0),(3,19,'describes how the victors respond when they cross the finish line. ',0),(4,19,'explains why 1,500 people would be willing to compete in such a difficult race.',0);''')