# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.33)
# Database: lp_rpg
# Generation Time: 2014-07-29 01:11:13 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `question`)
VALUES
	(1,'Have you ever worked together informally with someone or some group to solve a problem in the community where you live?'),
	(2,'Have you worked as a canvasser – having gone door to door for a political or social group or candidate?'),
	(3,'In the past 12 months, did you contribute money to a candidate, a political party, or any organization that supported candidates?'),
	(4,'Did you vote in the presidential election in 2008 (John McCain versus Barack Obama?)'),
	(5,'Have you done any  volunteer activities through or for an organization?'),
	(6,'Have you attend any public meetings in which there was a discussion of community affairs?'),
	(7,'Have you worked with other people in your neighborhood to fix a problem or improve a condition in your community or elsewhere?'),
	(8,'Have you ever contacted elected officials or the news media about any issue important to you?'),
	(9,'Have you ever tried to persuade friends about an issue important to you?'),
	(10,'Have you ever tried to change local policies in a place like a school, workplace, college or neighborhood?'),
	(11,'How often have you used the Internet to gather information about politics, a social issue, or a community problem?'),
	(12,'Are you a member of any nonprofit broad or committee that has a budget?'),
	(13,'Have you allowed a relative to live in your home for a period of time because they needed a place to live?'),
	(14,'Have you gave food or money to someone who isn’t a relative?'),
	(15,'Have you submitted a letter or article for a magazine, newspaper or online publication?'),
	(16,'Do you follow what’s going on in government and public affairs?'),
	(17,'Do you happen to know what job or political office is now held by Joe Biden?');

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `key`, `value`, `description`)
VALUES
	(1,'questions_per_round','5','Questions per round');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table token_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `token_values`;

CREATE TABLE `token_values` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `token_id` int(11) DEFAULT NULL,
  `yes_points` int(11) DEFAULT NULL,
  `no_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

LOCK TABLES `token_values` WRITE;
/*!40000 ALTER TABLE `token_values` DISABLE KEYS */;

INSERT INTO `token_values` (`id`, `question_id`, `token_id`, `yes_points`, `no_points`)
VALUES
	(1,1,1,5,-3),
	(2,1,2,3,-4),
	(3,1,3,2,-5),
	(4,1,4,3,-1),
	(5,1,5,-3,4),
	(6,1,6,0,0),
	(7,2,1,4,0),
	(8,2,2,2,1),
	(9,2,3,-2,-4),
	(10,2,4,2,-4),
	(11,2,5,-4,1),
	(12,2,6,-3,0),
	(13,3,1,-1,-3),
	(14,3,2,2,-1),
	(15,3,3,-3,-2),
	(16,3,4,0,0),
	(17,3,5,2,2),
	(18,3,6,-3,0),
	(19,4,1,-3,-4),
	(20,4,2,3,0),
	(21,4,3,3,-3),
	(22,4,4,2,-2),
	(23,4,5,-3,1),
	(24,4,6,0,2),
	(25,5,1,0,0),
	(26,5,2,-1,0),
	(27,5,3,0,0),
	(28,5,4,2,4),
	(29,5,5,-4,0),
	(30,5,6,2,-1),
	(31,6,1,-3,0),
	(32,6,2,0,0),
	(33,6,3,-4,-1),
	(34,6,4,0,-2),
	(35,6,5,-2,-1),
	(36,6,6,1,-1),
	(37,7,1,-4,-3),
	(38,7,2,-1,-3),
	(39,7,3,0,-4),
	(40,7,4,0,0),
	(41,7,5,0,-2),
	(42,7,6,0,0),
	(43,8,1,1,0),
	(44,8,2,0,1),
	(45,8,3,-1,-2),
	(46,8,4,-4,0),
	(47,8,5,0,4),
	(48,8,6,-3,-4),
	(49,9,1,-2,1),
	(50,9,2,-4,2),
	(51,9,3,3,0),
	(52,9,4,2,3),
	(53,9,5,-1,0),
	(54,9,6,-2,0),
	(55,10,1,1,-4),
	(56,10,2,-2,4),
	(57,10,3,3,-4),
	(58,10,4,3,1),
	(59,10,5,3,1),
	(60,10,6,1,1),
	(61,11,1,-1,3),
	(62,11,2,1,4),
	(63,11,3,0,0),
	(64,11,4,-1,-1),
	(65,11,5,1,-1),
	(66,11,6,-3,0),
	(67,12,1,-3,0),
	(68,12,2,4,-1),
	(69,12,3,1,4),
	(70,12,4,-3,-4),
	(71,12,5,-3,-2),
	(72,12,6,0,-3),
	(73,13,1,2,2),
	(74,13,2,4,-1),
	(75,13,3,2,3),
	(76,13,4,-2,-1),
	(77,13,5,1,-4),
	(78,13,6,1,0),
	(79,14,1,0,-2),
	(80,14,2,0,3),
	(81,14,3,0,-4),
	(82,14,4,-2,2),
	(83,14,5,1,4),
	(84,14,6,2,-1),
	(85,15,1,3,-4),
	(86,15,2,0,3),
	(87,15,3,2,-4),
	(88,15,4,2,-1),
	(89,15,5,3,4),
	(90,15,6,-2,0),
	(91,16,1,0,3),
	(92,16,2,4,-4),
	(93,16,3,-3,-2),
	(94,16,4,0,-1),
	(95,16,5,-3,2),
	(96,16,6,1,-2),
	(97,17,1,0,4),
	(98,17,2,-1,4),
	(99,17,3,-4,2),
	(100,17,4,-2,0),
	(101,17,5,-4,4),
	(102,17,6,4,-1);

/*!40000 ALTER TABLE `token_values` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;

INSERT INTO `tokens` (`id`, `name`)
VALUES
	(1,'Income tax'),
	(2,'Education level'),
	(3,'Public health'),
	(4,'Entrepreneurship'),
	(5,'Community art'),
	(6,'Immigration');

/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
