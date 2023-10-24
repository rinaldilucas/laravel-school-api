-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: school_database
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classrooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `responsible_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classrooms_school_id_foreign` (`school_id`),
  KEY `classrooms_responsible_id_foreign` (`responsible_id`),
  CONSTRAINT `classrooms_responsible_id_foreign` FOREIGN KEY (`responsible_id`) REFERENCES `users` (`id`),
  CONSTRAINT `classrooms_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,'31306',31,12,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(2,'82332',32,13,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(3,'73344',33,14,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(4,'1524',34,15,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(5,'94446',35,16,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(6,'80471',36,17,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(7,'92645',37,18,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(8,'72119',38,19,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(9,'23937',39,20,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(10,'27122',40,21,'2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(16,'1TAX',1,1,'2023-10-23 02:30:55','2023-10-23 02:30:58',NULL);
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classrooms_associations`
--

DROP TABLE IF EXISTS `classrooms_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classrooms_associations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `classroom_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classrooms_associations_classroom_id_foreign` (`classroom_id`),
  KEY `classrooms_associations_student_id_foreign` (`student_id`),
  CONSTRAINT `classrooms_associations_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  CONSTRAINT `classrooms_associations_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms_associations`
--

LOCK TABLES `classrooms_associations` WRITE;
/*!40000 ALTER TABLE `classrooms_associations` DISABLE KEYS */;
INSERT INTO `classrooms_associations` VALUES (7,16,1,'2023-10-23 02:30:55',NULL),(8,16,2,'2023-10-23 02:30:55',NULL),(9,16,3,'2023-10-23 02:30:55',NULL);
/*!40000 ALTER TABLE `classrooms_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (72,'2014_10_12_000000_create_users_table',1),(73,'2014_10_12_100000_create_password_reset_tokens_table',2),(74,'2019_08_19_000000_create_failed_jobs_table',3),(75,'2019_12_14_000001_create_personal_access_tokens_table',4),(76,'2023_10_19_172212_create_schools_table',5),(77,'2023_10_19_172222_add_school_column_to_users_table',6),(78,'2023_10_22_142337_make_school_id_nullable_in_users',7),(79,'2023_10_22_150616_create_schools_associations_table',8),(80,'2023_10_22_163556_insert_data_into_school_associations',9),(81,'2023_10_22_164456_remove_school_relation_from_users',10),(82,'2023_10_22_181710_create_students_table',11),(83,'2023_10_22_201010_create_classrooms_table',12),(84,'2023_10_22_211159_create_classrooms_associations_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (2,'App\\Models\\User',1,'mobile-token','56a814c91ee825d58b0963ef7b2501550eca5c21e8d1efba88bb9380614db23d','[\"*\"]','2023-10-23 02:31:00',NULL,'2023-10-23 02:30:31','2023-10-23 02:31:00');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_associations`
--

DROP TABLE IF EXISTS `school_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_associations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_associations_user_id_foreign` (`user_id`),
  KEY `school_associations_school_id_foreign` (`school_id`),
  CONSTRAINT `school_associations_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`),
  CONSTRAINT `school_associations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_associations`
--

LOCK TABLES `school_associations` WRITE;
/*!40000 ALTER TABLE `school_associations` DISABLE KEYS */;
INSERT INTO `school_associations` VALUES (1,1,1,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(2,2,11,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(3,3,12,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(4,4,13,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(5,5,14,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(6,6,15,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(7,7,16,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(8,8,17,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(9,9,18,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(10,10,19,'2023-10-23 02:30:04','2023-10-23 02:30:04'),(11,11,20,'2023-10-23 02:30:04','2023-10-23 02:30:04');
/*!40000 ALTER TABLE `school_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schools` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `inep` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schools_inep_unique` (`inep`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'61167000','Escola Valentina Eva Faro','CT','New Fabiano','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(2,'08211442','Escola Eric Delatorre','KY','Michaelton','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(3,'06050385','Escola Sr. Sergio Renato Mar├⌐s','TN','South Polianaview','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(4,'76439016','Escola Srta. Lav├¡nia Violeta Cordeiro','SC','North Gilbertofort','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(5,'89224544','Escola Marta Sales Filho','TX','Coronaside','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(6,'12212441','Escola Gisela Delgado Filho','LA','South ├ìtaloland','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(7,'66075853','Escola Natan Carmona','KS','Maiconborough','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(8,'65476676','Escola Dr. Bernardo Daniel Valentin Jr.','IL','Rochaport','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(9,'99581038','Escola Sr. Cl├⌐ber Hugo Casanova Sobrinho','WA','Raphaeltown','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(10,'52433886','Escola Dr. Afonso Mar├⌐s Sobrinho','CT','Francohaven','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(11,'92663321','Escola Dr. Dante Alcantara Flores Sobrinho','KS','Ben├¡cioborough','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(12,'37639619','Escola Jennifer Cola├ºo','UT','North Kevinview','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(13,'15313346','Escola Marcelo Alan Maia Sobrinho','NY','West Mayara','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(14,'03141567','Escola Sra. Carolina Valentin Bezerra','NY','Nelsonview','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(15,'18957288','Escola Srta. Gabriela Val├⌐ria Mendon├ºa','WA','Gusm├úoside','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(16,'56833561','Escola Natal Cruz ├üvila','CA','East Denis','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(17,'40153780','Escola Gael Vila Ferminiano Jr.','KY','Saitochester','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(18,'71592628','Escola Karina Kamila Benez','IL','North Ben├¡cio','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(19,'09813036','Escola Leandro de Oliveira Filho','KY','Gustavohaven','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(20,'78079428','Escola Helena Maldonado Paz Sobrinho','MO','das Nevesberg','2023-10-23 02:30:04','2023-10-23 02:30:04',NULL),(21,'15295661','Escola Srta. Jennifer Rosa Lovato','MD','Leonberg','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(22,'34424655','Escola Dr. Hernani Fernandes','NM','Port Auroraland','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(23,'17505155','Escola Sra. Fabiana Matias Martines','UT','East Micheletown','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(24,'44162960','Escola Maria Oliveira Fernandes Sobrinho','MO','Queir├│smouth','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(25,'75647076','Escola Dr. Cristian Bonilha','IA','West Maximianoland','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(26,'07110848','Escola Dr. Mauro Noel Bezerra','WV','Lake Carolineberg','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(27,'51232188','Escola Sr. Crist├│v├úo Flores Abreu Jr.','MI','North Antonella','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(28,'47308599','Escola Carolina Pacheco Neto','MS','New L├¡via','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(29,'85430700','Escola Anita Amanda Pacheco','IN','Souzaburgh','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(30,'29129994','Escola Gean Vila','UT','Maialand','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(31,'47956777','Escola Sr. Ant├┤nio Matias Beltr├úo','MA','Queir├│sland','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(32,'79308584','Escola Sr. Miguel Erik Santiago Filho','NY','North Lilianport','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(33,'83273496','Escola Jean Montenegro Filho','NH','Ang├⌐licastad','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(34,'57232219','Escola Thalissa Salazar','NV','North Lucio','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(35,'04225048','Escola Christian Perez Filho','MS','Cl├íudioville','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(36,'64733271','Escola Emily Rosa','AK','Daniloburgh','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(37,'75344252','Escola Gilberto Cl├⌐ber Santana Filho','TN','de Arrudafurt','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(38,'56087832','Escola Sr. Gael Serra Filho','MA','Salgadostad','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(39,'72033541','Escola Srta. Michele Suellen Balestero Filho','NH','Pachecoville','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(40,'95335420','Escola Dr. Gabriel Amaral Rios','AK','Marquesmouth','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `responsible_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_school_id_foreign` (`school_id`),
  CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,21,'Else Nikolaus MD','1988-06-30','Ricardo Treutel','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(2,22,'Darren Turcotte','2001-10-12','Jackeline Hoeger','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(3,23,'Ransom Tromp','2016-10-29','Mr. Alexandro Gusikowski IV','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(4,24,'Samanta Hettinger','1986-11-25','Maye Collins','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(5,25,'Kitty Macejkovic','2012-12-08','Diamond Quitzon','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(6,26,'Prof. Domenick Ondricka','2022-01-16','Prof. Izaiah Wintheiser DDS','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(7,27,'Mr. Wilfrid White','1989-06-13','Carmelo Dickinson','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(8,28,'Rashawn Wyman I','1971-05-27','Nia Carroll','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(9,29,'Ted Heathcote','1987-06-19','Marisa Windler','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(10,30,'Mr. Tre Nader IV','2010-02-12','Mr. William Baumbach Sr.','2023-10-23 02:30:05','2023-10-23 02:30:05',NULL),(25,1,'Miss Lorene Stracke','2023-10-22','Daryl Ward','2023-10-23 02:30:45','2023-10-23 02:30:48',NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@admin.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qVT6z1a3bf','2023-10-23 02:30:04','2023-10-23 02:30:04'),(2,'Lorenzo Ferraz','lorenzo.ferraz@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','tgJTy2nZ6d','2023-10-23 02:30:04','2023-10-23 02:30:04'),(3,'Noel├¡ Vila','noel├¡.vila@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','dlAM4yp3tD','2023-10-23 02:30:04','2023-10-23 02:30:04'),(4,'Evandro Bonilha','evandro.bonilha@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','nRpDJckd0P','2023-10-23 02:30:04','2023-10-23 02:30:04'),(5,'Noel├¡ Gon├ºalves','noel├¡.gon├ºalves@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XvG0fCRVSH','2023-10-23 02:30:04','2023-10-23 02:30:04'),(6,'Roberto Ferraz','roberto.ferraz@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rkZmGpXflf','2023-10-23 02:30:04','2023-10-23 02:30:04'),(7,'Christopher Benez','christopher.benez@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YWtkxbUiAt','2023-10-23 02:30:04','2023-10-23 02:30:04'),(8,'Ariana Galhardo','ariana.galhardo@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BP67OVY7Cr','2023-10-23 02:30:04','2023-10-23 02:30:04'),(9,'Sergio Pacheco','sergio.pacheco@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ne4cFIv3iL','2023-10-23 02:30:04','2023-10-23 02:30:04'),(10,'Isabella Furtado','isabella.furtado@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','RERZu7McBW','2023-10-23 02:30:04','2023-10-23 02:30:04'),(11,'Sheila Sep├║lveda','sheila.sep├║lveda@fake.com','2023-10-23 02:30:04','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','RSih4Hu2jx','2023-10-23 02:30:04','2023-10-23 02:30:04'),(12,'Franco Casanova','franco.casanova@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YgJmtdj1Pp','2023-10-23 02:30:05','2023-10-23 02:30:05'),(13,'Francisco Vale','francisco.vale@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','z3hCs9wufI','2023-10-23 02:30:05','2023-10-23 02:30:05'),(14,'Rebeca Paes','rebeca.paes@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','h9alvueVkg','2023-10-23 02:30:05','2023-10-23 02:30:05'),(15,'Eduardo Reis','eduardo.reis@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','IvvOCKeMkG','2023-10-23 02:30:05','2023-10-23 02:30:05'),(16,'Marco Ramos','marco.ramos@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','QQy9TOR4bJ','2023-10-23 02:30:05','2023-10-23 02:30:05'),(17,'Sheila Domingues','sheila.domingues@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bRxoMaGNAn','2023-10-23 02:30:05','2023-10-23 02:30:05'),(18,'Lucio Vega','lucio.vega@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lo2lVXx0rk','2023-10-23 02:30:05','2023-10-23 02:30:05'),(19,'F├ítima D\'├ívila','f├ítima.d\'├ívila@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lnQC7lXVJX','2023-10-23 02:30:05','2023-10-23 02:30:05'),(20,'Diana Domingues','diana.domingues@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GRE0vvEhHV','2023-10-23 02:30:05','2023-10-23 02:30:05'),(21,'Fabiano das Dores','fabiano.das dores@fake.com','2023-10-23 02:30:05','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ek4X6l8A6J','2023-10-23 02:30:05','2023-10-23 02:30:05');
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

-- Dump completed on 2023-10-22 20:31:51
