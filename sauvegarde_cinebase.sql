/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cinebase_db
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',3,'add_permission'),
(6,'Can change permission',3,'change_permission'),
(7,'Can delete permission',3,'delete_permission'),
(8,'Can view permission',3,'view_permission'),
(9,'Can add group',2,'add_group'),
(10,'Can change group',2,'change_group'),
(11,'Can delete group',2,'delete_group'),
(12,'Can view group',2,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add Acteur',6,'add_acteur'),
(22,'Can change Acteur',6,'change_acteur'),
(23,'Can delete Acteur',6,'delete_acteur'),
(24,'Can view Acteur',6,'view_acteur'),
(25,'Can add Catégorie',8,'add_categorie'),
(26,'Can change Catégorie',8,'change_categorie'),
(27,'Can delete Catégorie',8,'delete_categorie'),
(28,'Can view Catégorie',8,'view_categorie'),
(29,'Can add Personne',11,'add_personne'),
(30,'Can change Personne',11,'change_personne'),
(31,'Can delete Personne',11,'delete_personne'),
(32,'Can view Personne',11,'view_personne'),
(33,'Can add Casting',7,'add_casting'),
(34,'Can change Casting',7,'change_casting'),
(35,'Can delete Casting',7,'delete_casting'),
(36,'Can view Casting',7,'view_casting'),
(37,'Can add Film',10,'add_film'),
(38,'Can change Film',10,'change_film'),
(39,'Can delete Film',10,'delete_film'),
(40,'Can view Film',10,'view_film'),
(41,'Can add Commentaire',9,'add_commentaire'),
(42,'Can change Commentaire',9,'change_commentaire'),
(43,'Can delete Commentaire',9,'delete_commentaire'),
(44,'Can view Commentaire',9,'view_commentaire');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_films_personne_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_films_personne_id` FOREIGN KEY (`user_id`) REFERENCES `films_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(2,'auth','group'),
(3,'auth','permission'),
(4,'contenttypes','contenttype'),
(6,'films','acteur'),
(7,'films','casting'),
(8,'films','categorie'),
(9,'films','commentaire'),
(10,'films','film'),
(11,'films','personne'),
(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-06-04 12:07:48.176878'),
(2,'contenttypes','0002_remove_content_type_name','2026-06-04 12:07:48.193903'),
(3,'auth','0001_initial','2026-06-04 12:07:48.238910'),
(4,'auth','0002_alter_permission_name_max_length','2026-06-04 12:07:48.246427'),
(5,'auth','0003_alter_user_email_max_length','2026-06-04 12:07:48.248725'),
(6,'auth','0004_alter_user_username_opts','2026-06-04 12:07:48.251024'),
(7,'auth','0005_alter_user_last_login_null','2026-06-04 12:07:48.254686'),
(8,'auth','0006_require_contenttypes_0002','2026-06-04 12:07:48.255857'),
(9,'auth','0007_alter_validators_add_error_messages','2026-06-04 12:07:48.257807'),
(10,'auth','0008_alter_user_username_max_length','2026-06-04 12:07:48.260010'),
(11,'auth','0009_alter_user_last_name_max_length','2026-06-04 12:07:48.261924'),
(12,'auth','0010_alter_group_name_max_length','2026-06-04 12:07:48.267680'),
(13,'auth','0011_update_proxy_permissions','2026-06-04 12:07:48.273961'),
(14,'auth','0012_alter_user_first_name_max_length','2026-06-04 12:07:48.278231'),
(15,'films','0001_initial','2026-06-04 12:07:48.393705'),
(16,'admin','0001_initial','2026-06-04 12:07:48.425961'),
(17,'admin','0002_logentry_remove_auto_add','2026-06-04 12:07:48.429524'),
(18,'admin','0003_logentry_add_action_flag_choices','2026-06-04 12:07:48.433356'),
(19,'sessions','0001_initial','2026-06-04 12:07:48.445814');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('ihhhfch7l1529pzkvl11m3xo3hthqx9i','.eJxVjMsOwiAQRf-FtSG8KS7d-w1kBgapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKc2ZlJodnpd0VID2o7yndot85Tb-syI98VftDBrz3T83K4fwcVRv3WyimdMgQTAIX0DqQyYISngog6WCuDm2QOAK54YXGypCBglgWpFAL2_gAjhDjt:1wV7Ki:UmhoIgfcbc1m-bYPTJgrKU6BygYUJzbfvuW9Nx49gP0','2026-06-18 12:38:00.388714');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_acteur`
--

DROP TABLE IF EXISTS `films_acteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_acteur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_acteur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_acteur` WRITE;
/*!40000 ALTER TABLE `films_acteur` DISABLE KEYS */;
INSERT INTO `films_acteur` VALUES
(1,'Star_1','Acteur',53,''),
(2,'Star_2','Acteur',37,''),
(3,'Star_3','Acteur',80,''),
(4,'Star_4','Acteur',78,''),
(5,'Star_5','Acteur',20,''),
(6,'Star_6','Acteur',76,''),
(7,'Star_7','Acteur',45,''),
(8,'Star_8','Acteur',44,''),
(9,'Star_9','Acteur',38,''),
(10,'Star_10','Acteur',80,''),
(11,'Star_11','Acteur',46,''),
(12,'Star_12','Acteur',51,''),
(13,'Star_13','Acteur',61,''),
(14,'Star_14','Acteur',30,''),
(15,'Star_15','Acteur',53,''),
(16,'Star_16','Acteur',46,''),
(17,'Star_17','Acteur',51,''),
(18,'Star_18','Acteur',33,''),
(19,'Star_19','Acteur',53,''),
(20,'Star_20','Acteur',63,''),
(21,'Star_21','Acteur',50,''),
(22,'Star_22','Acteur',22,''),
(23,'Star_23','Acteur',56,''),
(24,'Star_24','Acteur',57,''),
(25,'Star_25','Acteur',65,''),
(26,'Star_26','Acteur',57,''),
(27,'Star_27','Acteur',33,''),
(28,'Star_28','Acteur',36,''),
(29,'Star_29','Acteur',27,''),
(30,'Star_30','Acteur',62,''),
(31,'Star_31','Acteur',61,''),
(32,'Star_32','Acteur',29,''),
(33,'Star_33','Acteur',47,''),
(34,'Star_34','Acteur',49,''),
(35,'Star_35','Acteur',37,''),
(36,'Star_36','Acteur',80,''),
(37,'Star_37','Acteur',21,''),
(38,'Star_38','Acteur',57,''),
(39,'Star_39','Acteur',80,''),
(40,'Star_40','Acteur',51,''),
(41,'Star_41','Acteur',78,''),
(42,'Star_42','Acteur',22,''),
(43,'Star_43','Acteur',26,''),
(44,'Star_44','Acteur',51,''),
(45,'Star_45','Acteur',64,''),
(46,'Star_46','Acteur',30,''),
(47,'Star_47','Acteur',77,''),
(48,'Star_48','Acteur',52,''),
(49,'Star_49','Acteur',41,''),
(50,'Star_50','Acteur',66,'');
/*!40000 ALTER TABLE `films_acteur` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_casting`
--

DROP TABLE IF EXISTS `films_casting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_casting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acteur_id` bigint(20) NOT NULL,
  `film_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `films_casting_film_id_acteur_id_76e57ab5_uniq` (`film_id`,`acteur_id`),
  KEY `films_casting_acteur_id_2b426308_fk_films_acteur_id` (`acteur_id`),
  CONSTRAINT `films_casting_acteur_id_2b426308_fk_films_acteur_id` FOREIGN KEY (`acteur_id`) REFERENCES `films_acteur` (`id`),
  CONSTRAINT `films_casting_film_id_3a67a01d_fk_films_film_id` FOREIGN KEY (`film_id`) REFERENCES `films_film` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_casting`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_casting` WRITE;
/*!40000 ALTER TABLE `films_casting` DISABLE KEYS */;
INSERT INTO `films_casting` VALUES
(4,12,1),
(2,14,1),
(3,40,1),
(1,46,1),
(6,8,2),
(5,33,2),
(8,24,3),
(7,27,3),
(9,49,3),
(12,2,4),
(11,4,4),
(10,15,4),
(13,7,5),
(14,31,5),
(15,45,5),
(17,27,6),
(16,36,6),
(21,5,7),
(18,22,7),
(19,23,7),
(20,39,7),
(23,2,8),
(22,11,8),
(25,11,9),
(24,43,9),
(29,1,10),
(26,14,10),
(27,45,10),
(28,46,10),
(30,32,11),
(31,46,11),
(34,17,12),
(33,20,12),
(35,24,12),
(32,49,12),
(37,6,13),
(39,8,13),
(38,12,13),
(36,35,13),
(40,27,14),
(41,43,14),
(42,19,15),
(43,24,15),
(44,21,16),
(45,24,16),
(46,47,16),
(47,15,17),
(48,27,17),
(50,46,17),
(49,47,17),
(51,12,18),
(52,14,18),
(53,5,19),
(56,36,19),
(54,46,19),
(55,48,19),
(57,29,20),
(59,32,20),
(58,43,20),
(60,44,20),
(63,40,21),
(61,44,21),
(62,49,21),
(66,15,22),
(64,32,22),
(65,39,22),
(67,33,23),
(68,43,23),
(71,4,24),
(70,11,24),
(69,21,24),
(75,2,25),
(74,3,25),
(72,23,25),
(73,37,25),
(79,4,26),
(76,7,26),
(78,9,26),
(77,45,26),
(80,9,27),
(83,11,27),
(81,22,27),
(82,47,27),
(88,16,29),
(87,17,29),
(89,20,29),
(86,32,29),
(90,22,30),
(91,30,30),
(92,44,30),
(96,26,31),
(93,29,31),
(95,42,31),
(94,49,31),
(98,3,32),
(97,4,32),
(99,9,32),
(103,5,33),
(100,41,33),
(101,44,33),
(102,49,33),
(106,25,34),
(105,32,34),
(104,39,34),
(108,2,35),
(110,8,35),
(107,35,35),
(109,50,35),
(113,18,36),
(111,19,36),
(114,43,36),
(112,48,36),
(116,27,37),
(115,45,37),
(117,49,37),
(119,3,38),
(118,22,38),
(120,39,38),
(123,4,39),
(121,20,39),
(122,24,39),
(125,15,40),
(124,16,40),
(127,22,41),
(126,30,41),
(128,43,41),
(131,22,42),
(130,27,42),
(129,28,42),
(132,31,42),
(134,12,43),
(135,22,43),
(133,23,43),
(136,40,43),
(137,2,44),
(140,11,44),
(138,26,44),
(139,28,44),
(143,13,45),
(142,17,45),
(141,45,45),
(144,30,46),
(146,40,46),
(145,50,46),
(147,8,47),
(148,43,47),
(152,2,48),
(151,10,48),
(149,16,48),
(150,27,48),
(154,23,49),
(153,29,49),
(155,39,49),
(156,31,50),
(157,36,50),
(158,43,50),
(162,4,51),
(159,15,51),
(160,43,51),
(161,47,51),
(163,11,52),
(165,26,52),
(164,31,52),
(166,40,52),
(167,2,53),
(169,28,53),
(170,38,53),
(168,50,53),
(171,35,54),
(172,36,54),
(173,41,54),
(174,1,55),
(175,4,55),
(177,9,55),
(176,12,55),
(178,10,56),
(180,17,56),
(179,21,56),
(181,37,56),
(183,2,57),
(182,6,57),
(317,4,58),
(316,21,58),
(188,14,59),
(189,31,59),
(186,37,59),
(187,49,59),
(190,12,60),
(191,44,60),
(193,3,61),
(192,43,61),
(196,8,62),
(195,14,62),
(194,38,62),
(199,12,63),
(197,15,63),
(200,26,63),
(198,47,63),
(201,1,64),
(203,3,64),
(202,6,64),
(204,8,65),
(205,29,65),
(206,46,65),
(207,40,66),
(208,50,66),
(209,2,67),
(210,47,67),
(211,6,68),
(214,25,68),
(212,30,68),
(213,40,68),
(218,3,69),
(215,7,69),
(216,32,69),
(217,35,69),
(219,35,70),
(220,39,70),
(222,30,71),
(221,41,71),
(223,16,72),
(224,49,72),
(228,18,73),
(227,26,73),
(226,33,73),
(225,36,73),
(232,4,74),
(230,27,74),
(229,38,74),
(231,49,74),
(235,15,75),
(234,49,75),
(233,50,75),
(236,6,76),
(238,19,76),
(237,30,76),
(239,31,76),
(241,2,77),
(240,28,77),
(242,30,77),
(245,4,78),
(243,27,78),
(244,30,78),
(246,17,79),
(247,47,79),
(250,3,80),
(249,15,80),
(248,17,80),
(254,21,81),
(251,22,81),
(252,33,81),
(253,38,81),
(255,2,82),
(256,6,82),
(259,19,83),
(257,26,83),
(260,32,83),
(258,50,83),
(262,19,84),
(261,26,84),
(263,31,84),
(264,34,84),
(266,19,85),
(265,26,85),
(267,35,85),
(269,4,86),
(268,6,86),
(270,45,86),
(272,1,87),
(274,15,87),
(273,17,87),
(271,45,87),
(275,14,88),
(276,32,88),
(280,7,89),
(278,24,89),
(277,25,89),
(279,39,89),
(283,16,90),
(282,30,90),
(281,45,90),
(286,7,91),
(284,13,91),
(285,29,91),
(288,44,92),
(287,48,92),
(291,4,93),
(290,6,93),
(289,9,93),
(294,23,94),
(292,31,94),
(295,36,94),
(293,40,94),
(298,20,95),
(296,23,95),
(297,43,95),
(299,47,95),
(302,13,96),
(301,15,96),
(300,50,96),
(304,2,97),
(303,19,97),
(306,1,98),
(308,8,98),
(305,38,98),
(307,40,98),
(309,13,99),
(310,32,99),
(312,33,99),
(311,50,99),
(313,8,100),
(315,12,100),
(314,42,100);
/*!40000 ALTER TABLE `films_casting` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_categorie`
--

DROP TABLE IF EXISTS `films_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_categorie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `descriptif` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_categorie`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_categorie` WRITE;
/*!40000 ALTER TABLE `films_categorie` DISABLE KEYS */;
INSERT INTO `films_categorie` VALUES
(1,'Action','Retrouvez ici tous nos chefs-d\'œuvre du genre Action.'),
(2,'Aventure','Retrouvez ici tous nos chefs-d\'œuvre du genre Aventure.'),
(3,'Comédie','Retrouvez ici tous nos chefs-d\'œuvre du genre Comédie.'),
(4,'Drame','Retrouvez ici tous nos chefs-d\'œuvre du genre Drame.'),
(5,'Science-Fiction','Retrouvez ici tous nos chefs-d\'œuvre du genre Science-Fiction.'),
(6,'Horreur','Retrouvez ici tous nos chefs-d\'œuvre du genre Horreur.'),
(7,'Thriller','Retrouvez ici tous nos chefs-d\'œuvre du genre Thriller.'),
(8,'Romance','Retrouvez ici tous nos chefs-d\'œuvre du genre Romance.'),
(9,'Animation','Retrouvez ici tous nos chefs-d\'œuvre du genre Animation.'),
(10,'Documentaire','Retrouvez ici tous nos chefs-d\'œuvre du genre Documentaire.'),
(11,'Fantastique','Retrouvez ici tous nos chefs-d\'œuvre du genre Fantastique.'),
(12,'Mystère','Retrouvez ici tous nos chefs-d\'œuvre du genre Mystère.'),
(13,'Crime','Retrouvez ici tous nos chefs-d\'œuvre du genre Crime.'),
(14,'Guerre','Retrouvez ici tous nos chefs-d\'œuvre du genre Guerre.'),
(15,'Histoire','Retrouvez ici tous nos chefs-d\'œuvre du genre Histoire.'),
(16,'Western','Retrouvez ici tous nos chefs-d\'œuvre du genre Western.'),
(17,'Comédie musicale','Retrouvez ici tous nos chefs-d\'œuvre du genre Comédie musicale.'),
(18,'Biographie','Retrouvez ici tous nos chefs-d\'œuvre du genre Biographie.'),
(19,'Famille','Retrouvez ici tous nos chefs-d\'œuvre du genre Famille.'),
(20,'Sport','Retrouvez ici tous nos chefs-d\'œuvre du genre Sport.'),
(21,'Film Noir','Retrouvez ici tous nos chefs-d\'œuvre du genre Film Noir.'),
(22,'Court-métrage','Retrouvez ici tous nos chefs-d\'œuvre du genre Court-métrage.'),
(23,'Épique','Retrouvez ici tous nos chefs-d\'œuvre du genre Épique.'),
(24,'Espionnage','Retrouvez ici tous nos chefs-d\'œuvre du genre Espionnage.'),
(25,'Super-héros','Retrouvez ici tous nos chefs-d\'œuvre du genre Super-héros.'),
(26,'Post-apocalyptique','Retrouvez ici tous nos chefs-d\'œuvre du genre Post-apocalyptique.'),
(27,'Cyberpunk','Retrouvez ici tous nos chefs-d\'œuvre du genre Cyberpunk.'),
(28,'Steampunk','Retrouvez ici tous nos chefs-d\'œuvre du genre Steampunk.'),
(29,'Comédie romantique','Retrouvez ici tous nos chefs-d\'œuvre du genre Comédie romantique.'),
(30,'Slasher','Retrouvez ici tous nos chefs-d\'œuvre du genre Slasher.'),
(31,'Zombies','Retrouvez ici tous nos chefs-d\'œuvre du genre Zombies.'),
(32,'Vampires','Retrouvez ici tous nos chefs-d\'œuvre du genre Vampires.'),
(33,'Arts Martiaux','Retrouvez ici tous nos chefs-d\'œuvre du genre Arts Martiaux.'),
(34,'Catastrophe','Retrouvez ici tous nos chefs-d\'œuvre du genre Catastrophe.'),
(35,'Mockumentaire','Retrouvez ici tous nos chefs-d\'œuvre du genre Mockumentaire.'),
(36,'Expérimental','Retrouvez ici tous nos chefs-d\'œuvre du genre Expérimental.'),
(37,'Muet','Retrouvez ici tous nos chefs-d\'œuvre du genre Muet.'),
(38,'Road Movie','Retrouvez ici tous nos chefs-d\'œuvre du genre Road Movie.'),
(39,'Satire','Retrouvez ici tous nos chefs-d\'œuvre du genre Satire.'),
(40,'Space Opera','Retrouvez ici tous nos chefs-d\'œuvre du genre Space Opera.');
/*!40000 ALTER TABLE `films_categorie` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_commentaire`
--

DROP TABLE IF EXISTS `films_commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_commentaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `commentaire` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `personne_id` bigint(20) NOT NULL,
  `film_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `films_commentaire_personne_id_5d23adfc_fk_films_personne_id` (`personne_id`),
  KEY `films_commentaire_film_id_be015a5a_fk_films_film_id` (`film_id`),
  CONSTRAINT `films_commentaire_film_id_be015a5a_fk_films_film_id` FOREIGN KEY (`film_id`) REFERENCES `films_film` (`id`),
  CONSTRAINT `films_commentaire_personne_id_5d23adfc_fk_films_personne_id` FOREIGN KEY (`personne_id`) REFERENCES `films_personne` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_commentaire`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_commentaire` WRITE;
/*!40000 ALTER TABLE `films_commentaire` DISABLE KEYS */;
INSERT INTO `films_commentaire` VALUES
(1,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.189139',38,1),
(2,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.190244',37,1),
(3,5,'Une vraie claque visuelle !','2026-06-04 12:14:15.193251',73,1),
(4,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.194286',25,2),
(5,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.194804',38,2),
(6,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.195303',83,2),
(7,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.195892',85,2),
(8,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.196403',28,2),
(9,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.196903',59,2),
(10,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.197367',43,3),
(11,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.197881',36,3),
(12,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.198360',100,3),
(13,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.199460',66,3),
(14,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.200177',65,3),
(15,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.200869',99,3),
(16,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.201393',31,3),
(17,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.201821',18,4),
(18,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.202272',38,4),
(19,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.202765',15,4),
(20,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.203236',24,4),
(21,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.203731',38,4),
(22,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.204214',5,4),
(23,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.204695',6,4),
(24,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.205234',87,5),
(25,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.205693',77,5),
(26,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.206173',60,5),
(27,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.206636',23,5),
(28,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.207099',71,6),
(29,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.207564',92,6),
(30,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.208113',79,6),
(31,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.210873',34,6),
(32,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.212973',14,6),
(33,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.213417',3,6),
(34,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.213838',36,6),
(35,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.214275',60,7),
(36,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.214765',29,7),
(37,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.215181',15,7),
(38,1,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.215610',27,8),
(39,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.216041',77,8),
(40,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.216461',30,8),
(41,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.216898',58,8),
(42,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.217305',55,8),
(43,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.217693',36,8),
(44,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.218175',89,8),
(45,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.218583',71,8),
(46,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.219008',43,9),
(47,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.219617',9,9),
(48,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.220019',58,9),
(49,10,'Une vraie claque visuelle !','2026-06-04 12:14:15.220578',68,9),
(50,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.221028',17,9),
(51,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.221491',54,9),
(52,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.221959',2,9),
(53,7,'Une vraie claque visuelle !','2026-06-04 12:14:15.222426',41,10),
(54,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.222878',49,10),
(55,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.223354',32,10),
(56,2,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.223821',75,10),
(57,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.224349',23,10),
(58,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.224837',23,10),
(59,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.225309',28,10),
(60,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.225787',32,10),
(61,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.226262',14,11),
(62,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.226750',78,11),
(63,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.227218',81,11),
(64,10,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.228907',92,11),
(65,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.230095',39,11),
(66,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.230549',35,12),
(67,4,'Vraiment déçu par la fin...','2026-06-04 12:14:15.230982',13,12),
(68,4,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.231411',96,12),
(69,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.231866',41,12),
(70,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.234267',93,12),
(71,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.234747',56,12),
(72,7,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.235193',59,12),
(73,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.235642',35,12),
(74,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.236075',57,13),
(75,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.236500',20,13),
(76,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.236908',71,13),
(77,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.237307',97,13),
(78,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.237715',17,14),
(79,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.238167',91,14),
(80,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.238845',70,14),
(81,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.239309',18,15),
(82,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.239856',18,15),
(83,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.240302',79,15),
(84,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.240785',11,16),
(85,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.241243',12,16),
(86,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.241719',56,16),
(87,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.242185',89,16),
(88,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.242680',96,16),
(89,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.243184',89,16),
(90,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.243755',38,16),
(91,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.244213',96,16),
(92,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.244658',17,17),
(93,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.245086',24,17),
(94,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.245497',60,17),
(95,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.245915',64,18),
(96,5,'Une vraie claque visuelle !','2026-06-04 12:14:15.246326',65,18),
(97,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.246991',3,18),
(98,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.247412',24,19),
(99,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.247854',58,19),
(100,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.248266',25,19),
(101,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.248747',83,19),
(102,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.250928',39,19),
(103,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.251370',76,19),
(104,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.251837',62,19),
(105,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.252265',81,19),
(106,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.252699',41,20),
(107,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.253103',60,20),
(108,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.253531',60,20),
(109,8,'Une vraie claque visuelle !','2026-06-04 12:14:15.253928',17,20),
(110,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.254345',60,20),
(111,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.254797',76,20),
(112,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.255313',67,20),
(113,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.255790',70,20),
(114,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.256433',26,21),
(115,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.256898',67,21),
(116,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.257380',47,21),
(117,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.257831',47,21),
(118,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.258327',26,21),
(119,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.258800',14,21),
(120,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.259263',65,21),
(121,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.259751',92,22),
(122,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.260231',58,22),
(123,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.260751',51,22),
(124,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.261322',13,22),
(125,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.261797',76,22),
(126,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.262312',69,22),
(127,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.262787',37,22),
(128,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.263248',3,22),
(129,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.263737',63,23),
(130,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.264431',65,23),
(131,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.264931',48,23),
(132,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.265370',99,23),
(133,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.265795',66,23),
(134,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.266204',25,23),
(135,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.266605',79,23),
(136,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.267006',90,24),
(137,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.267486',11,24),
(138,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.267916',99,24),
(139,8,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.268322',81,24),
(140,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.268733',79,24),
(141,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.270121',68,24),
(142,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.270525',33,25),
(143,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.270967',22,25),
(144,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.271436',21,25),
(145,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.272827',95,25),
(146,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.273466',65,25),
(147,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.275119',60,25),
(148,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.277411',20,26),
(149,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.278672',42,26),
(150,9,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.279532',72,26),
(151,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.280419',76,26),
(152,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.280983',64,27),
(153,8,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.281450',87,27),
(154,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.281922',74,27),
(155,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.282400',85,27),
(156,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.282879',87,27),
(164,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.287058',100,29),
(165,9,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.287532',46,29),
(166,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.288969',11,29),
(167,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.289618',38,29),
(168,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.290459',22,29),
(169,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.290992',47,30),
(170,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.291426',13,30),
(171,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.291895',3,30),
(172,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.292405',56,30),
(173,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.293136',12,30),
(174,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.293622',31,30),
(175,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.294050',30,30),
(176,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.294453',62,30),
(177,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.295091',4,31),
(178,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.295855',24,31),
(179,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.296599',67,31),
(180,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.297095',50,31),
(181,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.297568',3,31),
(182,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.298058',86,32),
(183,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.298885',87,32),
(184,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.299556',86,32),
(185,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.300788',74,32),
(186,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.301424',83,32),
(187,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.302097',21,32),
(188,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.302799',35,32),
(189,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.304605',10,33),
(190,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.305486',10,33),
(191,8,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.306038',69,33),
(192,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.306519',17,33),
(193,4,'Vraiment déçu par la fin...','2026-06-04 12:14:15.307013',37,33),
(194,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.307463',40,33),
(195,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.307965',34,33),
(196,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.308486',30,33),
(197,1,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.309023',61,34),
(198,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.310605',96,34),
(199,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.312852',3,34),
(200,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.313529',26,34),
(201,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.314258',17,34),
(202,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.314921',72,35),
(203,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.315646',55,35),
(204,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.316759',16,35),
(205,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.317456',80,35),
(206,10,'Une vraie claque visuelle !','2026-06-04 12:14:15.318522',29,36),
(207,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.320908',82,36),
(208,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.321464',36,36),
(209,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.321953',83,36),
(210,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.322445',35,37),
(211,2,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.322951',67,37),
(212,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.323441',9,37),
(213,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.323958',21,37),
(214,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.324461',38,37),
(215,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.324970',3,37),
(216,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.325576',31,38),
(217,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.326058',71,38),
(218,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.326532',22,38),
(219,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.327021',9,38),
(220,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.327881',65,38),
(221,8,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.328443',60,38),
(222,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.329253',13,39),
(223,3,'Une vraie claque visuelle !','2026-06-04 12:14:15.329729',85,39),
(224,10,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.330222',15,39),
(225,8,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.330698',38,39),
(226,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.331180',52,40),
(227,7,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.331667',97,40),
(228,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.332197',77,40),
(229,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.333214',41,40),
(230,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.333950',43,40),
(231,10,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.334505',80,41),
(232,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.335018',63,41),
(233,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.335510',4,41),
(234,2,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.336168',73,41),
(235,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.338901',77,41),
(236,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.341960',62,41),
(237,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.342541',61,41),
(238,10,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.343045',88,42),
(239,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.343546',52,42),
(240,8,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.344095',20,42),
(241,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.344614',53,42),
(242,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.345099',83,42),
(243,10,'Une vraie claque visuelle !','2026-06-04 12:14:15.345591',4,43),
(244,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.346077',41,43),
(245,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.346708',31,43),
(246,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.348055',39,44),
(247,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.348731',29,44),
(248,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.349510',58,44),
(249,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.349992',55,44),
(250,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.350498',100,44),
(251,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.350997',6,44),
(252,1,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.353256',42,44),
(253,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.353988',24,45),
(254,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.354543',28,45),
(255,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.355098',33,45),
(256,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.355571',51,46),
(257,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.356107',42,46),
(258,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.356626',44,46),
(259,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.357404',65,46),
(260,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.357921',20,46),
(261,1,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.358400',48,46),
(262,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.358905',40,46),
(263,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.359488',79,47),
(264,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.359995',74,47),
(265,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.360478',14,47),
(266,8,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.361026',54,47),
(267,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.361588',77,47),
(268,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.362145',81,48),
(269,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.362701',43,48),
(270,5,'Une vraie claque visuelle !','2026-06-04 12:14:15.363261',48,48),
(271,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.364231',77,48),
(272,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.366200',8,48),
(273,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.368636',12,48),
(274,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.370080',26,48),
(275,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.371706',8,48),
(276,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.373293',60,49),
(277,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.374771',67,49),
(278,10,'Une vraie claque visuelle !','2026-06-04 12:14:15.375783',98,49),
(279,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.376813',90,49),
(280,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.378519',24,49),
(281,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.379875',89,49),
(282,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.381194',68,49),
(283,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.383408',2,50),
(284,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.384666',45,50),
(285,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.386090',100,50),
(286,2,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.387435',19,51),
(287,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.388744',61,51),
(288,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.389801',54,51),
(289,9,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.391094',46,51),
(290,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.392060',39,51),
(291,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.393059',66,51),
(292,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.394371',58,51),
(293,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.395803',89,52),
(294,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.396809',44,52),
(295,3,'Une vraie claque visuelle !','2026-06-04 12:14:15.397832',66,52),
(296,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.398786',34,53),
(297,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.400226',63,53),
(298,8,'Une vraie claque visuelle !','2026-06-04 12:14:15.401588',37,53),
(299,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.402599',17,53),
(300,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.403579',36,54),
(301,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.404637',28,54),
(302,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.405608',35,54),
(303,8,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.406576',5,54),
(304,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.407591',65,54),
(305,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.409027',95,54),
(306,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.410290',84,55),
(307,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.411822',81,55),
(308,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.412837',96,55),
(309,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.413798',100,55),
(310,9,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.414878',10,56),
(311,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.415981',68,56),
(312,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.417096',53,56),
(313,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.418141',75,56),
(314,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.419234',20,56),
(315,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.421190',87,56),
(316,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.422819',3,57),
(317,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.423780',47,57),
(318,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.424791',68,57),
(319,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.425843',92,57),
(320,7,'Une vraie claque visuelle !','2026-06-04 12:14:15.426795',75,57),
(321,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.427817',55,57),
(322,4,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.428942',16,58),
(323,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.430250',21,58),
(324,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.431471',27,58),
(325,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.432653',43,58),
(326,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.433637',69,59),
(327,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.435181',68,59),
(328,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.436278',58,59),
(329,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.437299',42,59),
(330,1,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.438276',33,59),
(331,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.439593',25,59),
(332,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.440793',93,59),
(333,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.441817',71,59),
(334,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.442800',42,60),
(335,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.444007',24,60),
(336,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.445142',61,60),
(337,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.446216',59,60),
(338,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.448300',50,61),
(339,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.449496',34,61),
(340,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.450550',65,61),
(341,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.451560',64,61),
(342,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.452641',100,61),
(343,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.453601',98,61),
(344,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.454607',26,61),
(345,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.455757',22,62),
(346,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.456858',12,62),
(347,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.457974',54,62),
(348,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.458958',15,62),
(349,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.459991',27,62),
(350,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.461609',92,62),
(351,6,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.462633',32,62),
(352,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.463666',89,62),
(353,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.464852',12,63),
(354,7,'Une vraie claque visuelle !','2026-06-04 12:14:15.465963',62,63),
(355,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.467005',27,63),
(356,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.468081',83,63),
(357,7,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.469201',14,63),
(358,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.470322',29,63),
(359,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.471344',9,63),
(360,8,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.472336',56,63),
(361,8,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.473262',43,64),
(362,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.474264',71,64),
(363,10,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.474866',99,64),
(364,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.475422',41,64),
(365,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.476030',22,64),
(366,2,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.476555',12,64),
(367,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.477010',92,65),
(368,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.477455',41,65),
(369,3,'Une vraie claque visuelle !','2026-06-04 12:14:15.477987',12,65),
(370,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.478629',65,65),
(371,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.479481',72,65),
(372,9,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.480477',78,66),
(373,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.481487',79,66),
(374,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.482153',21,66),
(375,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.482765',83,66),
(376,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.483410',79,66),
(377,4,'Vraiment déçu par la fin...','2026-06-04 12:14:15.483976',40,66),
(378,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.484420',99,67),
(379,4,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.485194',59,67),
(380,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.485614',31,67),
(381,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.486109',75,68),
(382,7,'Une vraie claque visuelle !','2026-06-04 12:14:15.486634',55,68),
(383,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.487052',76,68),
(384,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.487630',6,68),
(385,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.488420',16,68),
(386,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.489511',72,68),
(387,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.490248',14,68),
(388,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.490864',66,68),
(389,8,'Une vraie claque visuelle !','2026-06-04 12:14:15.491469',6,69),
(390,4,'Vraiment déçu par la fin...','2026-06-04 12:14:15.492042',85,69),
(391,8,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.492618',100,69),
(392,10,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.493152',64,69),
(393,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.493600',73,69),
(394,7,'Une vraie claque visuelle !','2026-06-04 12:14:15.494178',67,70),
(395,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.494803',78,70),
(396,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.496016',59,70),
(397,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.496709',70,71),
(398,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.497258',88,71),
(399,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.497785',68,71),
(400,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.498311',19,71),
(401,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.499200',9,71),
(402,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.499969',70,71),
(403,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.501111',54,71),
(404,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.501790',17,72),
(405,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.502315',43,72),
(406,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.502787',45,72),
(407,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.503235',66,72),
(408,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.503768',81,72),
(409,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.504207',36,73),
(410,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.505314',12,73),
(411,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.505933',15,73),
(412,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.506732',30,73),
(413,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.507298',90,74),
(414,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.507908',51,74),
(415,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.508733',42,74),
(416,5,'Une vraie claque visuelle !','2026-06-04 12:14:15.510257',23,74),
(417,4,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.511967',90,75),
(418,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.512675',69,75),
(419,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.513280',85,75),
(420,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.513833',79,75),
(421,3,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.514406',91,75),
(422,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.514965',57,75),
(423,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.515504',66,75),
(424,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.516057',45,75),
(425,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.516634',72,76),
(426,10,'Une vraie claque visuelle !','2026-06-04 12:14:15.517125',91,76),
(427,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.517666',41,76),
(428,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.518170',26,76),
(429,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.520325',9,77),
(430,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.521035',48,77),
(431,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.521616',78,77),
(432,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.522203',4,77),
(433,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.522895',53,78),
(434,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.524659',25,78),
(435,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.525206',49,78),
(436,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.525717',49,78),
(437,9,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.526232',24,78),
(438,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.526818',76,78),
(439,4,'Une vraie claque visuelle !','2026-06-04 12:14:15.527342',66,78),
(440,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.527943',62,78),
(441,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.528439',19,79),
(442,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.529719',61,79),
(443,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.530342',14,79),
(444,10,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.530965',68,79),
(445,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.531650',77,79),
(446,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.532557',16,80),
(447,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.533052',55,80),
(448,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.533576',14,80),
(449,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.534079',30,80),
(450,8,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.534526',76,81),
(451,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.535027',61,81),
(452,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.535613',19,81),
(453,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.536217',72,82),
(454,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.536721',30,82),
(455,9,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.537207',37,82),
(456,7,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.537748',94,83),
(457,1,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.538291',14,83),
(458,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.539133',23,83),
(459,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.539842',81,84),
(460,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.541377',51,84),
(461,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.543623',52,84),
(462,10,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.545819',53,84),
(463,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.547642',27,84),
(464,8,'Une vraie claque visuelle !','2026-06-04 12:14:15.549675',87,84),
(465,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.550785',84,85),
(466,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.552020',29,85),
(467,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.552996',27,85),
(468,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.553871',97,85),
(469,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.554888',26,85),
(470,7,'Une vraie claque visuelle !','2026-06-04 12:14:15.556142',82,85),
(471,8,'Une vraie claque visuelle !','2026-06-04 12:14:15.557067',47,86),
(472,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.557991',16,86),
(473,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.559018',92,86),
(474,3,'Une vraie claque visuelle !','2026-06-04 12:14:15.560161',10,86),
(475,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.561258',37,87),
(476,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.562751',9,87),
(477,8,'Une vraie claque visuelle !','2026-06-04 12:14:15.564010',95,87),
(478,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.564978',30,87),
(479,5,'Vraiment déçu par la fin...','2026-06-04 12:14:15.566611',81,87),
(480,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.567559',9,87),
(481,5,'Une vraie claque visuelle !','2026-06-04 12:14:15.568649',80,87),
(482,8,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.569636',24,87),
(483,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.570867',81,88),
(484,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.571949',62,88),
(485,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.573022',63,88),
(486,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.573906',60,88),
(487,7,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.574869',89,88),
(488,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.575823',7,88),
(489,6,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.576864',74,88),
(490,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.577817',30,89),
(491,10,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.578906',31,89),
(492,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.580203',25,89),
(493,7,'Vraiment déçu par la fin...','2026-06-04 12:14:15.581372',44,90),
(494,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.582358',73,90),
(495,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.583928',52,90),
(496,4,'Vraiment déçu par la fin...','2026-06-04 12:14:15.584947',76,91),
(497,6,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.585895',30,91),
(498,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.586818',65,91),
(499,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.587755',50,91),
(500,5,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.588895',20,92),
(501,1,'Une vraie claque visuelle !','2026-06-04 12:14:15.590080',97,92),
(502,2,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.591094',81,92),
(503,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.592070',1,92),
(504,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.593142',80,93),
(505,1,'Vraiment déçu par la fin...','2026-06-04 12:14:15.594352',29,93),
(506,5,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.595463',99,93),
(507,2,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.596461',4,93),
(508,7,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.597635',27,93),
(509,7,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.598606',50,93),
(510,8,'Vraiment déçu par la fin...','2026-06-04 12:14:15.599999',82,93),
(511,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.601081',96,94),
(512,9,'Vraiment déçu par la fin...','2026-06-04 12:14:15.602562',5,94),
(513,9,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.603648',60,94),
(514,6,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.604647',63,94),
(515,4,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.605630',11,94),
(516,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.606564',30,95),
(517,9,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.607490',46,95),
(518,2,'Une vraie claque visuelle !','2026-06-04 12:14:15.608799',14,95),
(519,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.609930',19,95),
(520,3,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.610902',47,95),
(521,7,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.611782',4,96),
(522,5,'Une vraie claque visuelle !','2026-06-04 12:14:15.612791',55,96),
(523,5,'Incroyable ! À voir absolument au cinéma.','2026-06-04 12:14:15.613726',17,96),
(524,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.614653',41,97),
(525,10,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.615528',83,97),
(526,3,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.616574',24,97),
(527,10,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.617492',13,97),
(528,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.618815',25,97),
(529,9,'Une vraie claque visuelle !','2026-06-04 12:14:15.620014',20,98),
(530,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.620989',29,98),
(531,10,'Vraiment déçu par la fin...','2026-06-04 12:14:15.622138',91,98),
(532,3,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.623172',80,98),
(533,4,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.624195',58,98),
(534,8,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.625503',91,98),
(535,1,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.626641',69,99),
(536,6,'Une vraie claque visuelle !','2026-06-04 12:14:15.627611',71,99),
(537,3,'Vraiment déçu par la fin...','2026-06-04 12:14:15.628875',30,99),
(538,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.629890',21,99),
(539,4,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.631087',14,99),
(540,2,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.632269',88,99),
(541,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.633325',14,100),
(542,6,'Vraiment déçu par la fin...','2026-06-04 12:14:15.634221',12,100),
(543,2,'Bof, j\'ai failli m\'endormir.','2026-06-04 12:14:15.635153',69,100),
(544,1,'Les acteurs jouent super bien, mais le scénario est moyen.','2026-06-04 12:14:15.636924',30,100),
(545,5,'Un chef-d\'œuvre absolu, je recommande !','2026-06-04 12:14:15.638607',22,100),
(546,2,'Vraiment déçu par la fin...','2026-06-04 12:14:15.639619',14,100);
/*!40000 ALTER TABLE `films_commentaire` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_film`
--

DROP TABLE IF EXISTS `films_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_film` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `annee_sortie` int(11) DEFAULT NULL,
  `affiche` varchar(100) DEFAULT NULL,
  `realisateur` varchar(100) NOT NULL,
  `categorie_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `films_film_categorie_id_5d721247_fk_films_categorie_id` (`categorie_id`),
  CONSTRAINT `films_film_categorie_id_5d721247_fk_films_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `films_categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_film`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_film` WRITE;
/*!40000 ALTER TABLE `films_film` DISABLE KEYS */;
INSERT INTO `films_film` VALUES
(1,'Projet Mystère n°1 - L\'Aventure',1980,'','Réalisateur 5',29),
(2,'Projet Mystère n°2 - L\'Aventure',2019,'','Réalisateur 6',14),
(3,'Projet Mystère n°3 - L\'Aventure',1984,'','Réalisateur 5',26),
(4,'Projet Mystère n°4 - L\'Aventure',1985,'','Réalisateur 16',29),
(5,'Projet Mystère n°5 - L\'Aventure',1993,'','Réalisateur 3',31),
(6,'Projet Mystère n°6 - L\'Aventure',2002,'','Réalisateur 10',37),
(7,'Projet Mystère n°7 - L\'Aventure',1986,'','Réalisateur 19',26),
(8,'Projet Mystère n°8 - L\'Aventure',1995,'','Réalisateur 16',18),
(9,'Projet Mystère n°9 - L\'Aventure',1996,'','Réalisateur 13',17),
(10,'Projet Mystère n°10 - L\'Aventure',2006,'','Réalisateur 7',33),
(11,'Projet Mystère n°11 - L\'Aventure',1998,'','Réalisateur 11',20),
(12,'Projet Mystère n°12 - L\'Aventure',2006,'','Réalisateur 19',24),
(13,'Projet Mystère n°13 - L\'Aventure',2002,'','Réalisateur 18',5),
(14,'Projet Mystère n°14 - L\'Aventure',2023,'','Réalisateur 7',30),
(15,'Projet Mystère n°15 - L\'Aventure',2023,'','Réalisateur 4',2),
(16,'Projet Mystère n°16 - L\'Aventure',2021,'','Réalisateur 9',3),
(17,'Projet Mystère n°17 - L\'Aventure',2009,'','Réalisateur 8',6),
(18,'Projet Mystère n°18 - L\'Aventure',1998,'','Réalisateur 18',20),
(19,'Projet Mystère n°19 - L\'Aventure',2017,'','Réalisateur 18',34),
(20,'Projet Mystère n°20 - L\'Aventure',2018,'','Réalisateur 7',4),
(21,'Projet Mystère n°21 - L\'Aventure',2020,'','Réalisateur 10',33),
(22,'Projet Mystère n°22 - L\'Aventure',2009,'','Réalisateur 8',9),
(23,'Projet Mystère n°23 - L\'Aventure',2020,'','Réalisateur 19',36),
(24,'Projet Mystère n°24 - L\'Aventure',1996,'','Réalisateur 11',32),
(25,'Projet Mystère n°25 - L\'Aventure',1993,'','Réalisateur 10',24),
(26,'Projet Mystère n°26 - L\'Aventure',1991,'','Réalisateur 19',21),
(27,'Projet Mystère n°27 - L\'Aventure',1991,'','Réalisateur 1',38),
(29,'Projet Mystère n°29 - L\'Aventure',2005,'','Réalisateur 20',15),
(30,'Projet Mystère n°30 - L\'Aventure',1997,'','Réalisateur 11',8),
(31,'Projet Mystère n°31 - L\'Aventure',1992,'','Réalisateur 19',23),
(32,'Projet Mystère n°32 - L\'Aventure',1983,'','Réalisateur 11',39),
(33,'Projet Mystère n°33 - L\'Aventure',2008,'','Réalisateur 12',15),
(34,'Projet Mystère n°34 - L\'Aventure',1983,'','Réalisateur 16',40),
(35,'Projet Mystère n°35 - L\'Aventure',1997,'','Réalisateur 5',15),
(36,'Projet Mystère n°36 - L\'Aventure',2011,'','Réalisateur 5',6),
(37,'Projet Mystère n°37 - L\'Aventure',1996,'','Réalisateur 19',39),
(38,'Projet Mystère n°38 - L\'Aventure',2007,'','Réalisateur 1',39),
(39,'Projet Mystère n°39 - L\'Aventure',1989,'','Réalisateur 4',37),
(40,'Projet Mystère n°40 - L\'Aventure',1999,'','Réalisateur 1',20),
(41,'Projet Mystère n°41 - L\'Aventure',1999,'','Réalisateur 13',11),
(42,'Projet Mystère n°42 - L\'Aventure',1980,'','Réalisateur 1',27),
(43,'Projet Mystère n°43 - L\'Aventure',1980,'','Réalisateur 8',40),
(44,'Projet Mystère n°44 - L\'Aventure',2016,'','Réalisateur 8',40),
(45,'Projet Mystère n°45 - L\'Aventure',2000,'','Réalisateur 15',21),
(46,'Projet Mystère n°46 - L\'Aventure',1989,'','Réalisateur 9',17),
(47,'Projet Mystère n°47 - L\'Aventure',1988,'','Réalisateur 16',1),
(48,'Projet Mystère n°48 - L\'Aventure',1987,'','Réalisateur 7',1),
(49,'Projet Mystère n°49 - L\'Aventure',2021,'','Réalisateur 10',34),
(50,'Projet Mystère n°50 - L\'Aventure',2021,'','Réalisateur 8',21),
(51,'Projet Mystère n°51 - L\'Aventure',2004,'','Réalisateur 8',4),
(52,'Projet Mystère n°52 - L\'Aventure',1984,'','Réalisateur 15',14),
(53,'Projet Mystère n°53 - L\'Aventure',1991,'','Réalisateur 18',5),
(54,'Projet Mystère n°54 - L\'Aventure',2015,'','Réalisateur 20',3),
(55,'Projet Mystère n°55 - L\'Aventure',1988,'','Réalisateur 16',25),
(56,'Projet Mystère n°56 - L\'Aventure',1988,'','Réalisateur 12',9),
(57,'Projet Mystère n°57 - L\'Aventure',1986,'','Réalisateur 1',10),
(58,'Projet Mystère n°58 - L\'Aventure',2024,'affiches/oeoeoe.jpg','Réalisateur 17',31),
(59,'Projet Mystère n°59 - L\'Aventure',2009,'','Réalisateur 10',19),
(60,'Projet Mystère n°60 - L\'Aventure',1980,'','Réalisateur 1',40),
(61,'Projet Mystère n°61 - L\'Aventure',1981,'','Réalisateur 18',5),
(62,'Projet Mystère n°62 - L\'Aventure',2006,'','Réalisateur 17',21),
(63,'Projet Mystère n°63 - L\'Aventure',2012,'','Réalisateur 4',32),
(64,'Projet Mystère n°64 - L\'Aventure',2003,'','Réalisateur 11',27),
(65,'Projet Mystère n°65 - L\'Aventure',2005,'','Réalisateur 9',14),
(66,'Projet Mystère n°66 - L\'Aventure',2003,'','Réalisateur 16',15),
(67,'Projet Mystère n°67 - L\'Aventure',2020,'','Réalisateur 12',11),
(68,'Projet Mystère n°68 - L\'Aventure',2003,'','Réalisateur 12',25),
(69,'Projet Mystère n°69 - L\'Aventure',1993,'','Réalisateur 17',1),
(70,'Projet Mystère n°70 - L\'Aventure',1987,'','Réalisateur 9',4),
(71,'Projet Mystère n°71 - L\'Aventure',1988,'','Réalisateur 1',27),
(72,'Projet Mystère n°72 - L\'Aventure',2000,'','Réalisateur 7',7),
(73,'Projet Mystère n°73 - L\'Aventure',2013,'','Réalisateur 16',33),
(74,'Projet Mystère n°74 - L\'Aventure',1992,'','Réalisateur 9',23),
(75,'Projet Mystère n°75 - L\'Aventure',2022,'','Réalisateur 14',31),
(76,'Projet Mystère n°76 - L\'Aventure',2012,'','Réalisateur 9',7),
(77,'Projet Mystère n°77 - L\'Aventure',2009,'','Réalisateur 7',27),
(78,'Projet Mystère n°78 - L\'Aventure',1996,'','Réalisateur 14',9),
(79,'Projet Mystère n°79 - L\'Aventure',2021,'','Réalisateur 9',21),
(80,'Projet Mystère n°80 - L\'Aventure',1983,'','Réalisateur 20',21),
(81,'Projet Mystère n°81 - L\'Aventure',2002,'','Réalisateur 11',12),
(82,'Projet Mystère n°82 - L\'Aventure',1985,'','Réalisateur 14',25),
(83,'Projet Mystère n°83 - L\'Aventure',2022,'','Réalisateur 3',20),
(84,'Projet Mystère n°84 - L\'Aventure',2001,'','Réalisateur 9',22),
(85,'Projet Mystère n°85 - L\'Aventure',2013,'','Réalisateur 1',15),
(86,'Projet Mystère n°86 - L\'Aventure',2023,'','Réalisateur 5',31),
(87,'Projet Mystère n°87 - L\'Aventure',1995,'','Réalisateur 18',35),
(88,'Projet Mystère n°88 - L\'Aventure',1991,'','Réalisateur 2',20),
(89,'Projet Mystère n°89 - L\'Aventure',1985,'','Réalisateur 14',39),
(90,'Projet Mystère n°90 - L\'Aventure',1986,'','Réalisateur 1',2),
(91,'Projet Mystère n°91 - L\'Aventure',1983,'','Réalisateur 18',21),
(92,'Projet Mystère n°92 - L\'Aventure',2018,'','Réalisateur 8',23),
(93,'Projet Mystère n°93 - L\'Aventure',2013,'','Réalisateur 17',26),
(94,'Projet Mystère n°94 - L\'Aventure',2002,'','Réalisateur 19',20),
(95,'Projet Mystère n°95 - L\'Aventure',2016,'','Réalisateur 5',26),
(96,'Projet Mystère n°96 - L\'Aventure',1980,'','Réalisateur 5',16),
(97,'Projet Mystère n°97 - L\'Aventure',2010,'','Réalisateur 18',2),
(98,'Projet Mystère n°98 - L\'Aventure',1995,'','Réalisateur 7',13),
(99,'Projet Mystère n°99 - L\'Aventure',1982,'','Réalisateur 12',35),
(100,'Projet Mystère n°100 - L\'Aventure',1994,'','Réalisateur 11',8);
/*!40000 ALTER TABLE `films_film` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_personne`
--

DROP TABLE IF EXISTS `films_personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_personne` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_personne`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_personne` WRITE;
/*!40000 ALTER TABLE `films_personne` DISABLE KEYS */;
INSERT INTO `films_personne` VALUES
(1,'pbkdf2_sha256$1200000$6P3lZaVtj8Q1LjzwMyRT1z$7BJuWd6m2ZQxLAVhYb07fdJC2rOyorrkSV3S+6Su4Co=',NULL,0,'Cinephile_1','','','cinephile1@test.fr',0,1,'2026-06-04 12:13:59.562354','professionnel'),
(2,'pbkdf2_sha256$1200000$2UPTWzsbRXCythvP018710$zoXI/55JHiaeyDYwgo2SXWOklTcWWlpIutkoeKH5wVg=',NULL,0,'Cinephile_2','','','cinephile2@test.fr',0,1,'2026-06-04 12:13:59.716274','amateur'),
(3,'pbkdf2_sha256$1200000$Qff7M2eU2lh2vQ0Kzi6KmC$stjNJB1C9dQb8cySXbavaL+3gw8XbHYd0dijhS61R/c=',NULL,0,'Cinephile_3','','','cinephile3@test.fr',0,1,'2026-06-04 12:13:59.852407','amateur'),
(4,'pbkdf2_sha256$1200000$u0jBsM4mkaN7xBbSqXvzKJ$iM5407OHRjKIghhhm6XaOHmpBd/YJbcmY1dmSsfQEmA=',NULL,0,'Cinephile_4','','','cinephile4@test.fr',0,1,'2026-06-04 12:13:59.989481','amateur'),
(5,'pbkdf2_sha256$1200000$nmtFZbqQeYUV76QgbRKdyr$NEN9wfc7EPHNjIeJHCi8SiIkLprUzWz5hrAtxvftSnc=',NULL,0,'Cinephile_5','','','cinephile5@test.fr',0,1,'2026-06-04 12:14:00.136710','amateur'),
(6,'pbkdf2_sha256$1200000$CpqanbDlvckOH2N6jv0SqW$Hi9MUvBdx3D5bioPs7AR54wt23CwSWfMcTt+FgRl+/o=',NULL,0,'Cinephile_6','','','cinephile6@test.fr',0,1,'2026-06-04 12:14:00.271545','professionnel'),
(7,'pbkdf2_sha256$1200000$Cu7EnbmQZRrOeArjH7Ljsw$Di2KvKf9w3bBq/13+daqdwLna7XTdC4s4ouvsmcPR1U=',NULL,0,'Cinephile_7','','','cinephile7@test.fr',0,1,'2026-06-04 12:14:00.407885','professionnel'),
(8,'pbkdf2_sha256$1200000$CurEFHpaHCkkmJu1dJ5efv$ZD0Vgl8LBrW5eF1OVSzei0qUFvm/sVIB76CosbL0wkY=',NULL,0,'Cinephile_8','','','cinephile8@test.fr',0,1,'2026-06-04 12:14:00.545038','amateur'),
(9,'pbkdf2_sha256$1200000$ashMnw8vdORCvqRlg2sl2Q$SyjQ93wY3w6jS1OioeGutHAAHsON+fOx5rQpn4WTp18=',NULL,0,'Cinephile_9','','','cinephile9@test.fr',0,1,'2026-06-04 12:14:00.687036','professionnel'),
(10,'pbkdf2_sha256$1200000$SLnxscojySi7gVY8O24Pdq$8vRbTRuVvSvfd+Rt72+CzaIueZtvno8xq58gjOj4+gw=',NULL,0,'Cinephile_10','','','cinephile10@test.fr',0,1,'2026-06-04 12:14:00.821492','amateur'),
(11,'pbkdf2_sha256$1200000$TCawcBtGsopkN6zWP8muo0$v2rwW2zX9nePdXdaWMUEWlk3vzsqr2YuDwRB+wD4/gQ=',NULL,0,'Cinephile_11','','','cinephile11@test.fr',0,1,'2026-06-04 12:14:00.956479','amateur'),
(12,'pbkdf2_sha256$1200000$PIoMBmr6dcK2MozpBrQd6a$E/mVakU+/mZFTUlimp6i9kYdxGEQ4UJxe+DntpLehDs=',NULL,0,'Cinephile_12','','','cinephile12@test.fr',0,1,'2026-06-04 12:14:01.099630','amateur'),
(13,'pbkdf2_sha256$1200000$Q6PsAcJ7tSlE19LzSuQHZo$RaGYXwAPrgLHmSYlHMe2J+Q8fZFR6LnW4FYsi66M4Fc=',NULL,0,'Cinephile_13','','','cinephile13@test.fr',0,1,'2026-06-04 12:14:01.236418','amateur'),
(14,'pbkdf2_sha256$1200000$Z24TyENG4MDqObWM3xVzx2$3Ary9x7OEBj79yIQ9sOEAWPmHbMlzlUg1im8aW7IhYg=',NULL,0,'Cinephile_14','','','cinephile14@test.fr',0,1,'2026-06-04 12:14:01.375219','professionnel'),
(15,'pbkdf2_sha256$1200000$onIyJZGhSo7EfpK9kGDP2t$+vkpOL1LAWlbkAKhftL0rTx96VxG4qAc50+GNdZL0q4=',NULL,0,'Cinephile_15','','','cinephile15@test.fr',0,1,'2026-06-04 12:14:01.510704','professionnel'),
(16,'pbkdf2_sha256$1200000$QxvXv4DCT32e7huKS6BZ3s$vwA0SrOW4TRZZ3nGLlmi+L9aWT/sv8A2HKPV41n4jBM=',NULL,0,'Cinephile_16','','','cinephile16@test.fr',0,1,'2026-06-04 12:14:01.647284','professionnel'),
(17,'pbkdf2_sha256$1200000$GuYzuxmjuBhah5ndeNXOcv$6TmzVFsfv1rS0yw1Lmq/vOFscT2zYZxSoFR9fY6EGHE=',NULL,0,'Cinephile_17','','','cinephile17@test.fr',0,1,'2026-06-04 12:14:01.781971','professionnel'),
(18,'pbkdf2_sha256$1200000$6qZ33oGLvBG7UxT8U8wfx3$rQ+o5O7syA3mmrOSHXoeDpX9/0S5nkJJaNEZOr2RjkI=',NULL,0,'Cinephile_18','','','cinephile18@test.fr',0,1,'2026-06-04 12:14:01.919079','amateur'),
(19,'pbkdf2_sha256$1200000$3GrbeVc9C88CSl6Wh7wIBM$rwmicxriLp4LaVIrYQkfQGtZZ7Gsys851mmyUh5me48=',NULL,0,'Cinephile_19','','','cinephile19@test.fr',0,1,'2026-06-04 12:14:02.057411','amateur'),
(20,'pbkdf2_sha256$1200000$xdFjOx2sM07awLurUlALQ8$DXGlbGhWesoR+kwcvD8pn/3RQHxTteHzb0XGsQPXhP4=',NULL,0,'Cinephile_20','','','cinephile20@test.fr',0,1,'2026-06-04 12:14:02.192305','professionnel'),
(21,'pbkdf2_sha256$1200000$quC5UgMtDShsZEIpnp5LyR$O8dCQQeS1iy2TbPCc0ujWaBCJxhJB72MLv9k5loj5PM=',NULL,0,'Cinephile_21','','','cinephile21@test.fr',0,1,'2026-06-04 12:14:02.329259','amateur'),
(22,'pbkdf2_sha256$1200000$9ELA7sbRZwn0pMvl6fGw61$N86mIuR9WBSpr7e/tV3JIvV9QXeIlTZ8Vz+IFCWIcyc=',NULL,0,'Cinephile_22','','','cinephile22@test.fr',0,1,'2026-06-04 12:14:02.469461','amateur'),
(23,'pbkdf2_sha256$1200000$7N1yzH1GGfUA6isNuBLRYk$siz1l7reLwPYObaT8NvDfGYlF4PzSbemb/U9NTI9QVg=',NULL,0,'Cinephile_23','','','cinephile23@test.fr',0,1,'2026-06-04 12:14:02.603972','professionnel'),
(24,'pbkdf2_sha256$1200000$RplOle7uPICMwKn86fSbL4$LQ/+bNGFBjYIVZ70guZKX1P0zk6w0EPV3FDQ0Xk8dlY=',NULL,0,'Cinephile_24','','','cinephile24@test.fr',0,1,'2026-06-04 12:14:02.744839','amateur'),
(25,'pbkdf2_sha256$1200000$wfXJLUGgJ1HqpH13ujzqs5$wHu1p9vi9c/U7uLERP+YBqhz0S7SJuexAX6hWRyv3l0=',NULL,0,'Cinephile_25','','','cinephile25@test.fr',0,1,'2026-06-04 12:14:02.888598','professionnel'),
(26,'pbkdf2_sha256$1200000$MNUWY14ychcFLJNFuoSuVo$WUtrndo3AjmuUSTp6XSdxT6b8Y269cvSintT3lmycX0=',NULL,0,'Cinephile_26','','','cinephile26@test.fr',0,1,'2026-06-04 12:14:03.029136','professionnel'),
(27,'pbkdf2_sha256$1200000$pWsOwrFaCkLI08eRAEre5Z$cFvA1T/CI1ZKUygHp1E4xE7ovzl6bFeC+76N5DcvFJ8=',NULL,0,'Cinephile_27','','','cinephile27@test.fr',0,1,'2026-06-04 12:14:03.172369','amateur'),
(28,'pbkdf2_sha256$1200000$TBBmwqQL2OplxRGA9QhEIt$X1ZcH4+567Ip1N3qgYDKCrp9k4V0VuWmYUFlmkE1zQE=',NULL,0,'Cinephile_28','','','cinephile28@test.fr',0,1,'2026-06-04 12:14:03.312172','amateur'),
(29,'pbkdf2_sha256$1200000$5h1Lhcz7lKHXfUoOu3K2FM$34P/mTsgQQgEvXIOoajmiZsBvTvA1wuWBHT4GXqTIeU=',NULL,0,'Cinephile_29','','','cinephile29@test.fr',0,1,'2026-06-04 12:14:03.452152','professionnel'),
(30,'pbkdf2_sha256$1200000$1yRyNVASifkbpjIXaPWwcI$ubokHEZF78vmsIE0vX6VYmUiQz1gk54TAjbLp1POjp4=',NULL,0,'Cinephile_30','','','cinephile30@test.fr',0,1,'2026-06-04 12:14:03.591184','amateur'),
(31,'pbkdf2_sha256$1200000$ucjSmoUFGe7EW3dnzyOgJn$hTy3qiPLzomuk+/6bmnCSROSaNcuz4CvtRecDkcvwCU=',NULL,0,'Cinephile_31','','','cinephile31@test.fr',0,1,'2026-06-04 12:14:03.728591','professionnel'),
(32,'pbkdf2_sha256$1200000$JJQdhdPdnfLqoXg8J9fcHb$WY5BSoUCmTVcx/CvQ/zEDmL4KJhchvFsuqf6Uu47fMI=',NULL,0,'Cinephile_32','','','cinephile32@test.fr',0,1,'2026-06-04 12:14:03.864164','professionnel'),
(33,'pbkdf2_sha256$1200000$T1bavOxDOXVa0P3gb7XfhB$xNQV36zdM0lEIJsrcUYzg+Pqne8jWmfrJZnI7a6Pf5Q=',NULL,0,'Cinephile_33','','','cinephile33@test.fr',0,1,'2026-06-04 12:14:04.001216','amateur'),
(34,'pbkdf2_sha256$1200000$dNfcORYEVouOTVSoSto5IS$dx0T2zkFC6n34GqvCJw9k1AyvFylY850azdm/6dA41Q=',NULL,0,'Cinephile_34','','','cinephile34@test.fr',0,1,'2026-06-04 12:14:04.139091','professionnel'),
(35,'pbkdf2_sha256$1200000$TlYclvd4TdGAUNlW9JLZfC$fZhzY076MCsS0b5Fk2iZjiq+CZ8bEsTz0MDe6+8jDYw=',NULL,0,'Cinephile_35','','','cinephile35@test.fr',0,1,'2026-06-04 12:14:04.278310','professionnel'),
(36,'pbkdf2_sha256$1200000$UogR9WjhJ4EYI76hiJv7SF$b6SNNKL6rad6W7nJ9nhMbMql8jF4vrELw9VY2CHnfck=',NULL,0,'Cinephile_36','','','cinephile36@test.fr',0,1,'2026-06-04 12:14:04.413379','professionnel'),
(37,'pbkdf2_sha256$1200000$uK5UNvnl9YDWwym9RFH9vN$yZF/ikrlx3FxqW1XxpkD9r57/BqCegVVqSMowLycf+Y=',NULL,0,'Cinephile_37','','','cinephile37@test.fr',0,1,'2026-06-04 12:14:04.548089','amateur'),
(38,'pbkdf2_sha256$1200000$IWhAyKo8UmgO2vIESuQUZr$QWyaeS/JXwAMxLrbmDZc9/bgwgvnHt0xCJ6KEhGXBbU=',NULL,0,'Cinephile_38','','','cinephile38@test.fr',0,1,'2026-06-04 12:14:04.686149','amateur'),
(39,'pbkdf2_sha256$1200000$jM3gYZQFvFXW93BpYET8Tu$xWnp3SiYyv5Pou1OL4g53eD1ph0a5k2+lTdaelkVd3I=',NULL,0,'Cinephile_39','','','cinephile39@test.fr',0,1,'2026-06-04 12:14:04.822320','amateur'),
(40,'pbkdf2_sha256$1200000$NrOKjwzdvRV8WU3b9Ygae9$O2WC6pv622Yh5WSI1iPxrQf8CL72I2y8yLxni65wfRc=',NULL,0,'Cinephile_40','','','cinephile40@test.fr',0,1,'2026-06-04 12:14:04.961178','professionnel'),
(41,'pbkdf2_sha256$1200000$1mr9GwJ5PFTdj8tC1xHlzW$p0l3Zj3xuMr8HiTxChZ5qdMD+/zE8mRF/dPuqXoROx0=',NULL,0,'Cinephile_41','','','cinephile41@test.fr',0,1,'2026-06-04 12:14:05.095920','professionnel'),
(42,'pbkdf2_sha256$1200000$NtGVAnP8OKZGqNJVwOs38K$aI40eCdV73HMqxpeFzSf+rEv3hG9KVq6hc67DB2Dwos=',NULL,0,'Cinephile_42','','','cinephile42@test.fr',0,1,'2026-06-04 12:14:05.230141','professionnel'),
(43,'pbkdf2_sha256$1200000$MHZsEkMWn5ZvllYtYjcUjl$ev2CevoaMvUS6RSuOYHbtQE5iyK+TWjNUBVKDfdXc/k=',NULL,0,'Cinephile_43','','','cinephile43@test.fr',0,1,'2026-06-04 12:14:05.367275','professionnel'),
(44,'pbkdf2_sha256$1200000$6iXUJ7w2PKZrSH6xBIY9Qc$JEpeL5npKyg4f1FdVY9tvfdaPPRD/i669Gh9ilCrUJU=',NULL,0,'Cinephile_44','','','cinephile44@test.fr',0,1,'2026-06-04 12:14:05.504660','amateur'),
(45,'pbkdf2_sha256$1200000$aQSFwOho5fUYGgvIrveAlv$CCINascx0LyhlJlEqatwdQIsZiqovzapRPiEu0rye9I=',NULL,0,'Cinephile_45','','','cinephile45@test.fr',0,1,'2026-06-04 12:14:05.641326','professionnel'),
(46,'pbkdf2_sha256$1200000$Ib6pc2HboIzPns4HX35ECI$taC3P+bxGGFRr+X3/v9i+HZNWSl5fnzY6E6bWUo2Mp0=',NULL,0,'Cinephile_46','','','cinephile46@test.fr',0,1,'2026-06-04 12:14:05.781382','amateur'),
(47,'pbkdf2_sha256$1200000$IZ0O0ld7WtCSyKMQC55gsQ$jLVYKCjTPPKKhTpFXoyJYrSAPlSLoMV2mNUJS+iKiMk=',NULL,0,'Cinephile_47','','','cinephile47@test.fr',0,1,'2026-06-04 12:14:05.919864','amateur'),
(48,'pbkdf2_sha256$1200000$5LRQY999eAJgovh5whALW0$K0forK8ERRJA/Y1XbZxD13AAb0lanHdx7aLV4ijVEtI=',NULL,0,'Cinephile_48','','','cinephile48@test.fr',0,1,'2026-06-04 12:14:06.067632','professionnel'),
(49,'pbkdf2_sha256$1200000$Nqpk5nIQ3HvEtK5qf9iNBL$mNKNJz4KWSyNvYfpC1FWC6T1SgJTyBbM7zdJ7W50Zn8=',NULL,0,'Cinephile_49','','','cinephile49@test.fr',0,1,'2026-06-04 12:14:06.210613','professionnel'),
(50,'pbkdf2_sha256$1200000$IS2QIGakBCDGxeH1P2fzlL$Aq/O3EPX/Oi0/RX2bhOjZV0kioBOSMDhmQ5eUF/PHgk=',NULL,0,'Cinephile_50','','','cinephile50@test.fr',0,1,'2026-06-04 12:14:06.350531','amateur'),
(51,'pbkdf2_sha256$1200000$htuEtbWGzQwkb0EHkDEHPj$cgxKKx49uTXECTj0zXxoOaVGInWM/Njh02YrFUOxNxE=',NULL,0,'Cinephile_51','','','cinephile51@test.fr',0,1,'2026-06-04 12:14:06.492122','professionnel'),
(52,'pbkdf2_sha256$1200000$t7LpTAEqAlS8d47eGfzysE$SlUZ3t5d2haDjKYDgOnpqN2GRxCKWw5WGsO59RDD+Qs=',NULL,0,'Cinephile_52','','','cinephile52@test.fr',0,1,'2026-06-04 12:14:06.664075','amateur'),
(53,'pbkdf2_sha256$1200000$hfyJHc0QvicueGgPk6QVlm$eK9FVSbw93/x8yOr8r9shUqSOx0EOBoJRv6BlAX5CPg=',NULL,0,'Cinephile_53','','','cinephile53@test.fr',0,1,'2026-06-04 12:14:06.823641','professionnel'),
(54,'pbkdf2_sha256$1200000$SD6HNKOLNxA4Oz4brSwGOY$YzGjvGonJS9xYaK8Pmte8s1toWRKCJ6VR+We3rIaBI0=',NULL,0,'Cinephile_54','','','cinephile54@test.fr',0,1,'2026-06-04 12:14:06.966391','professionnel'),
(55,'pbkdf2_sha256$1200000$rfi6k1l4PJo1lC4iN8t65Z$gSQ4hOiA9JaLSDzUDZI/bEimzmP2g2Le89pZ3giZezU=',NULL,0,'Cinephile_55','','','cinephile55@test.fr',0,1,'2026-06-04 12:14:07.110200','professionnel'),
(56,'pbkdf2_sha256$1200000$DT0o6wUGHHlWgUVA8FU1b7$/IioVMyEso1D9clsmhqys4ZWYn39sUJuGyveJ4i1yTc=',NULL,0,'Cinephile_56','','','cinephile56@test.fr',0,1,'2026-06-04 12:14:07.253775','professionnel'),
(57,'pbkdf2_sha256$1200000$YhZU8nHU9BCVBhfNHkA2EN$5mcaDVlYAx0mmxbPOBGkGvcUZELR/q2CZ5LjR7B1HkE=',NULL,0,'Cinephile_57','','','cinephile57@test.fr',0,1,'2026-06-04 12:14:07.419154','professionnel'),
(58,'pbkdf2_sha256$1200000$lytOqkSiaXqbxF4SBbIKuy$laU4qnVI+PpqbUQ3ksTigqUvJtdKlJAUc14tEiYHBG4=',NULL,0,'Cinephile_58','','','cinephile58@test.fr',0,1,'2026-06-04 12:14:07.566073','amateur'),
(59,'pbkdf2_sha256$1200000$vU8pKwBlsAN8xG77Flh2ST$lS+hlrHgf4Hq7FvwGJicJ8joU9Z0f5rr4VmsXaSXNHg=',NULL,0,'Cinephile_59','','','cinephile59@test.fr',0,1,'2026-06-04 12:14:07.709705','professionnel'),
(60,'pbkdf2_sha256$1200000$ziVBOSWQpl91tdCIKYRZFz$jugWjXr2MQP1E/XXxOqhvHP2DeW+h3AriPAk+zMRw0g=',NULL,0,'Cinephile_60','','','cinephile60@test.fr',0,1,'2026-06-04 12:14:07.853666','professionnel'),
(61,'pbkdf2_sha256$1200000$X3HTsZpryOTOB4sbH2Pj5i$RUBFiOhPFN+yPjU2A/fg5sx3+yi6CGoF8W9QWDMWRfA=',NULL,0,'Cinephile_61','','','cinephile61@test.fr',0,1,'2026-06-04 12:14:07.995944','professionnel'),
(62,'pbkdf2_sha256$1200000$BsYToPRDG4YcxlkHG8IkJh$OvFQC8TSqrIvpqrZ1cmkXiZMFEC2Pp28boXU+T7ykao=',NULL,0,'Cinephile_62','','','cinephile62@test.fr',0,1,'2026-06-04 12:14:08.182644','professionnel'),
(63,'pbkdf2_sha256$1200000$XwLsCHSOBT24dOOomRmClT$Led4DxFR1JdLtGecZDF8coQhCX/xu+pVDayvRYlmQJU=',NULL,0,'Cinephile_63','','','cinephile63@test.fr',0,1,'2026-06-04 12:14:08.327312','professionnel'),
(64,'pbkdf2_sha256$1200000$6yUADsmY7FnPsiFmigD6EP$0zIkT4VEizLtO/SJIzozC6itmoaMFkh6J0oW9gvn8vs=',NULL,0,'Cinephile_64','','','cinephile64@test.fr',0,1,'2026-06-04 12:14:08.486376','amateur'),
(65,'pbkdf2_sha256$1200000$Gr3NZgC8HbZXvlIvxXzSOp$lJX27GxgWsvaO7CETPy/eGsGdKn9Hm/bLk6C1MQtSxQ=',NULL,0,'Cinephile_65','','','cinephile65@test.fr',0,1,'2026-06-04 12:14:08.647869','amateur'),
(66,'pbkdf2_sha256$1200000$oelZrNNNa0tlHyFLXM8Ht1$6Gx3yFd0kolBxbVhYGCrBmE2zUSMu0nSBRvNb5iN9/c=',NULL,0,'Cinephile_66','','','cinephile66@test.fr',0,1,'2026-06-04 12:14:08.802317','professionnel'),
(67,'pbkdf2_sha256$1200000$4UiSzAznCuZi0dVUXqmwfS$S+/NaYyV3t9mY05RIfPdhceM/o0Gsynhfa9Mf08Tmz8=',NULL,0,'Cinephile_67','','','cinephile67@test.fr',0,1,'2026-06-04 12:14:08.955657','professionnel'),
(68,'pbkdf2_sha256$1200000$pLYQ03FADgXLcTfnFrzBHi$gX5K4h/WLHX7O/fl1+cCfK96BVafX0z+j4q9R+TiXto=',NULL,0,'Cinephile_68','','','cinephile68@test.fr',0,1,'2026-06-04 12:14:09.121203','amateur'),
(69,'pbkdf2_sha256$1200000$gqrckN7PvbFpKe69gEksi3$+sIwyKNg9e+MK1WD1wKHX/3f6aMLh7yISgjRd3OAeMQ=',NULL,0,'Cinephile_69','','','cinephile69@test.fr',0,1,'2026-06-04 12:14:09.279430','amateur'),
(70,'pbkdf2_sha256$1200000$DWYNScBrgkJwUeiWwotHvj$34JqLAH4bL8wygB7IgbH+VoFc45lks02CPcqJJ53zWw=',NULL,0,'Cinephile_70','','','cinephile70@test.fr',0,1,'2026-06-04 12:14:09.431526','amateur'),
(71,'pbkdf2_sha256$1200000$Crj3Q9WQbUnRJ9vUBmvHe8$zNhpY4PcktuHMyuEH7+KS5r6jO/EYfV81ZmYFifTcdw=',NULL,0,'Cinephile_71','','','cinephile71@test.fr',0,1,'2026-06-04 12:14:09.605315','amateur'),
(72,'pbkdf2_sha256$1200000$iX26ncOfDR4hn7XGNzqzQ4$aVYNYl80mRiu19QuZYfhf7cs3WY2j7LOWzfFcCNXWqA=',NULL,0,'Cinephile_72','','','cinephile72@test.fr',0,1,'2026-06-04 12:14:09.781956','amateur'),
(73,'pbkdf2_sha256$1200000$ZpMBRnl0WhsexfkhBd3xcN$u1cbBpjDZRP1Z+8hgL8kaW/WyPf+cE0yG6O4TpKbUic=',NULL,0,'Cinephile_73','','','cinephile73@test.fr',0,1,'2026-06-04 12:14:09.956372','amateur'),
(74,'pbkdf2_sha256$1200000$GnSnibuP9sWsEhToSrVjMG$Hgn1YmeSnLXiU+5Gu200A2DUir180SNsyidzJdHBriY=',NULL,0,'Cinephile_74','','','cinephile74@test.fr',0,1,'2026-06-04 12:14:10.139377','amateur'),
(75,'pbkdf2_sha256$1200000$BvAMAd4HwVdf3Cr1IRJHw8$E3MaBy4WIteGR+lnEhcM3CESUxvjH9J+Zknj+9IIlNQ=',NULL,0,'Cinephile_75','','','cinephile75@test.fr',0,1,'2026-06-04 12:14:10.323376','amateur'),
(76,'pbkdf2_sha256$1200000$V9vHLj1mThsgCbBaWRZ779$B/jRCOJ9dHoKfydpn8sREzk+6zoa5AeW47AO/D+0xc0=',NULL,0,'Cinephile_76','','','cinephile76@test.fr',0,1,'2026-06-04 12:14:10.503169','professionnel'),
(77,'pbkdf2_sha256$1200000$oWZBcRve2sCKwcZgx9tlWr$sf1O28KTEFG+H0GtmiD22/faO+5AQnKcDsnELuKfxyA=',NULL,0,'Cinephile_77','','','cinephile77@test.fr',0,1,'2026-06-04 12:14:10.702175','amateur'),
(78,'pbkdf2_sha256$1200000$XweufZikQPL3EPgUzCpZWu$+x1PNx1M/NA0hiEqlVmMpTxUm5bk2VJ3IyNo5E3mS0o=',NULL,0,'Cinephile_78','','','cinephile78@test.fr',0,1,'2026-06-04 12:14:10.891998','professionnel'),
(79,'pbkdf2_sha256$1200000$VONIcYbapVENTb9GDWCVpY$ZWPyWTADAwltKeCAvDRERmFBWtV+r5moaoCd9qz+GwM=',NULL,0,'Cinephile_79','','','cinephile79@test.fr',0,1,'2026-06-04 12:14:11.086793','professionnel'),
(80,'pbkdf2_sha256$1200000$QERuKf3Tm5L4zNUM4i0Dht$bdbv5WNTzmWq/+r7okna54Ht3ioHvU5fPDgs7c6XAeY=',NULL,0,'Cinephile_80','','','cinephile80@test.fr',0,1,'2026-06-04 12:14:11.268403','professionnel'),
(81,'pbkdf2_sha256$1200000$zuVjcWCzppRx0PW8wug3HA$2fZfXa/cg1gxzsCjY6HhEv2y0q2KHjUT38WPVCwGvas=',NULL,0,'Cinephile_81','','','cinephile81@test.fr',0,1,'2026-06-04 12:14:11.453460','amateur'),
(82,'pbkdf2_sha256$1200000$11mMLcuiNkqHMxkPIBBvWe$sSaXfsEQj9xSmhdAjEHm323y5OSEw2UstreyQU6ICxY=',NULL,0,'Cinephile_82','','','cinephile82@test.fr',0,1,'2026-06-04 12:14:11.634141','professionnel'),
(83,'pbkdf2_sha256$1200000$y8cc9MHgVaHiywBXf9fjw7$nSqKx6zkfEuZu/sRFKqbrxC3lUOMC3oM1dQIaLjeB1E=',NULL,0,'Cinephile_83','','','cinephile83@test.fr',0,1,'2026-06-04 12:14:11.820640','professionnel'),
(84,'pbkdf2_sha256$1200000$BeH8vsS0yHVEqANxhYQ2iM$yEWC8caVRKCjkMiButO/YzSdBLEy8OG94sX1f75LWjE=',NULL,0,'Cinephile_84','','','cinephile84@test.fr',0,1,'2026-06-04 12:14:12.000102','professionnel'),
(85,'pbkdf2_sha256$1200000$OeC0pJML31dNHqzx1qsBsZ$HzUPyBWsTcfKjW4KBWZzfgGYlC5hP8awRZLz7ZUztCY=',NULL,0,'Cinephile_85','','','cinephile85@test.fr',0,1,'2026-06-04 12:14:12.177177','amateur'),
(86,'pbkdf2_sha256$1200000$CaEnzhwkgbwY7zQtcVagbw$FO/ggNdkqIVho6shnP5Ki6fl7xcojmYipM05bKhpB/8=',NULL,0,'Cinephile_86','','','cinephile86@test.fr',0,1,'2026-06-04 12:14:12.344919','amateur'),
(87,'pbkdf2_sha256$1200000$CdGIMJdC4lB1sWDRxEbMdw$ExxtWguHN8xIAgohHauhzxhH2K+8+vDT28cw9z//x1k=',NULL,0,'Cinephile_87','','','cinephile87@test.fr',0,1,'2026-06-04 12:14:12.507115','professionnel'),
(88,'pbkdf2_sha256$1200000$ttEGSOVnShYHveXtQ31rjn$KlZh8GroXUogsJ8gaEOnbnwxI0mjSiVOR9SaINHDzQw=',NULL,0,'Cinephile_88','','','cinephile88@test.fr',0,1,'2026-06-04 12:14:12.673585','amateur'),
(89,'pbkdf2_sha256$1200000$RD6edutYCYnEa2T4eSwDeu$T4zWvCWnb3afM8PPmwprHtaecLmVUDr9VSzf/16c19Y=',NULL,0,'Cinephile_89','','','cinephile89@test.fr',0,1,'2026-06-04 12:14:12.844560','professionnel'),
(90,'pbkdf2_sha256$1200000$reX288N4v8hHYM2HsLBci6$5BJVTwlVeW/tf4CmTjcopev2w+vIX3IDXq+aDCHx7q8=',NULL,0,'Cinephile_90','','','cinephile90@test.fr',0,1,'2026-06-04 12:14:13.020184','professionnel'),
(91,'pbkdf2_sha256$1200000$0LAIfQy2tFa1goVXhPtOvA$S7oKPhSN3nHJ19F37SRjAWnVDtE9nDtQZ0QBYDDzwLM=',NULL,0,'Cinephile_91','','','cinephile91@test.fr',0,1,'2026-06-04 12:14:13.191925','professionnel'),
(92,'pbkdf2_sha256$1200000$RjeR93XNRVztoocyCZ1YwT$Wzg9OWBgAg93zOQYBLRir7FNCxYWbwlgI/uD2lcSISc=',NULL,0,'Cinephile_92','','','cinephile92@test.fr',0,1,'2026-06-04 12:14:13.363114','amateur'),
(93,'pbkdf2_sha256$1200000$SMb0P2LPoUi4VpkoJverVq$sJXzjwXFmY5FkNa6WsHsx7rLD27oqGQV7ggKtxT28Ko=',NULL,0,'Cinephile_93','','','cinephile93@test.fr',0,1,'2026-06-04 12:14:13.534863','amateur'),
(94,'pbkdf2_sha256$1200000$n956ygTn4jRWiUK0vMs7P0$Gv2EzkXMdl0EbeEAWQE3jJW09hGYMPu2M3vb6sQPhJU=',NULL,0,'Cinephile_94','','','cinephile94@test.fr',0,1,'2026-06-04 12:14:13.704461','amateur'),
(95,'pbkdf2_sha256$1200000$RzW2S6CWFEJYiCnBgAqWNL$vAf8GGkOrkklFNXinI57bjO5pQGKwevf4JJ0PsWYtag=',NULL,0,'Cinephile_95','','','cinephile95@test.fr',0,1,'2026-06-04 12:14:13.886460','professionnel'),
(96,'pbkdf2_sha256$1200000$mmsdsJyOBwrPQWrtbbOLV8$Rg0eYZ2tDj+be689MqJ0ap8TozIIAfk244/Md0o57K4=',NULL,0,'Cinephile_96','','','cinephile96@test.fr',0,1,'2026-06-04 12:14:14.065185','professionnel'),
(97,'pbkdf2_sha256$1200000$85yW9cx4Y7orVS2R5c9GRK$VS6QVNG/lZn8+biKR8xKjyt2RcLvJ05gS7fyGFSmsTs=',NULL,0,'Cinephile_97','','','cinephile97@test.fr',0,1,'2026-06-04 12:14:14.254566','professionnel'),
(98,'pbkdf2_sha256$1200000$obUED1iQk7YkYyDGbTkbJ6$+B95wGYMdTfevnfECQt++GU7HqqxOI2sfP3RyJWR2JM=',NULL,0,'Cinephile_98','','','cinephile98@test.fr',0,1,'2026-06-04 12:14:14.426540','amateur'),
(99,'pbkdf2_sha256$1200000$O2wmxFRjck1rq9izF7AxjW$Rgtoit9E0ygKsQa25sCRefNLky7jM90BV//mhzCtaB0=',NULL,0,'Cinephile_99','','','cinephile99@test.fr',0,1,'2026-06-04 12:14:14.592106','professionnel'),
(100,'pbkdf2_sha256$1200000$SboUIYLpdihdZ3WznH6uzh$wG2wvsw6op126GZwG4zfRwMeuUgjKEd5rYbP8lb+3hc=',NULL,0,'Cinephile_100','','','cinephile100@test.fr',0,1,'2026-06-04 12:14:14.735820','amateur'),
(101,'pbkdf2_sha256$1200000$Q90UAiGVzd9NtE1SAWziro$j+EqPZfdDRH4vj0+WsRRrap4KnsCe4A992BWvF5FJqA=','2026-06-04 12:15:39.102310',0,'COUCOU','zzz','zzz','oeoe@gmail.com',0,1,'2026-06-04 12:15:38.897903','amateur'),
(102,'pbkdf2_sha256$1200000$evACW4MlGJiOvl15w61C06$WZe0x4WWY2D2oVlb361acVusEur6hXwLHC8E8RpG3N0=','2026-06-04 12:36:29.146973',0,'OEOOEE','oeoe','eee','oeee@gmail.com',0,1,'2026-06-04 12:36:28.926367','professionnel'),
(103,'pbkdf2_sha256$1200000$PJQq3TUpKHdDrhsVxhHIYL$L4HWqIzkdhBWloYBVtg1qCC6BYGzQZ0CEHKbwjqSZN8=','2026-06-04 12:38:00.386849',1,'toto','','','',1,1,'2026-06-04 12:37:49.652659','amateur');
/*!40000 ALTER TABLE `films_personne` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_personne_groups`
--

DROP TABLE IF EXISTS `films_personne_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_personne_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personne_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `films_personne_groups_personne_id_group_id_1326fb96_uniq` (`personne_id`,`group_id`),
  KEY `films_personne_groups_group_id_faf4f37b_fk_auth_group_id` (`group_id`),
  CONSTRAINT `films_personne_groups_group_id_faf4f37b_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `films_personne_groups_personne_id_6927db1b_fk_films_personne_id` FOREIGN KEY (`personne_id`) REFERENCES `films_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_personne_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_personne_groups` WRITE;
/*!40000 ALTER TABLE `films_personne_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `films_personne_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `films_personne_user_permissions`
--

DROP TABLE IF EXISTS `films_personne_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_personne_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `personne_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `films_personne_user_perm_personne_id_permission_i_674fe64a_uniq` (`personne_id`,`permission_id`),
  KEY `films_personne_user__permission_id_bc68610a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `films_personne_user__permission_id_bc68610a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `films_personne_user__personne_id_f18df7fe_fk_films_per` FOREIGN KEY (`personne_id`) REFERENCES `films_personne` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_personne_user_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_personne_user_permissions` WRITE;
/*!40000 ALTER TABLE `films_personne_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `films_personne_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-04 15:00:36
