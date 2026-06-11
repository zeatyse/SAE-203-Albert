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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_acteur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_acteur` WRITE;
/*!40000 ALTER TABLE `films_acteur` DISABLE KEYS */;
INSERT INTO `films_acteur` VALUES
(51,'DiCaprio','Leonardo',NULL,'acteurs/Leonardo_DiCaprio.jpg'),
(52,'Reeves','Keanu',NULL,''),
(53,'McConaughey','Matthew',NULL,'acteurs/matthew_mcconaughey.jpg'),
(54,'Winslet','Kate',NULL,''),
(55,'Bale','Christian',NULL,''),
(56,'Hardy','Tom',NULL,''),
(57,'Pitt','Brad',NULL,''),
(58,'Crowe','Russell',NULL,''),
(59,'Saldana','Zoe',NULL,''),
(60,'Travolta','John',NULL,''),
(61,'Hanks','Tom',NULL,'acteurs/tom_hanks.jpg'),
(62,'Wood','Elijah',NULL,''),
(63,'Holland','Tom',NULL,'acteurs/tom_holland.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_casting`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_casting` WRITE;
/*!40000 ALTER TABLE `films_casting` DISABLE KEYS */;
INSERT INTO `films_casting` VALUES
(318,51,101),
(323,56,101),
(319,52,102),
(320,53,103),
(321,54,104),
(326,59,105),
(322,55,106),
(327,60,107),
(328,61,108),
(325,58,109),
(324,57,110),
(329,62,111),
(330,63,112);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_film`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `films_film` WRITE;
/*!40000 ALTER TABLE `films_film` DISABLE KEYS */;
INSERT INTO `films_film` VALUES
(101,'Inception',2010,'affiches/inception.jpg','Christopher Nolan',5),
(102,'Matrix',1999,'','Lana & Lilly Wachowski',5),
(103,'Interstellar',2014,'affiches/interstellar.jpg','Christopher Nolan',5),
(104,'Titanic',1997,'affiches/titanic.jpg','James Cameron',8),
(105,'Avatar',2009,'affiches/avatar.jpg','James Cameron',5),
(106,'The Dark Knight',2008,'affiches/the_dark_knight.jpg','Christopher Nolan',1),
(107,'Pulp Fiction',1994,'affiches/pulp_fiction.jpg','Quentin Tarantino',13),
(108,'Forrest Gump',1994,'affiches/forrest_gump.jpg','Robert Zemeckis',4),
(109,'Gladiator',2000,'affiches/gladiator.jpg','Ridley Scott',1),
(110,'Fight Club',1999,'affiches/fight_club.jpg','David Fincher',4),
(111,'Le Seigneur des Anneaux',2001,'','Peter Jackson',11),
(112,'Spider-Man: No Way Home',2021,'affiches/spider-man_no_way_home.jpg','Jon Watts',25);
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

-- Dump completed on 2026-06-09 10:32:51
