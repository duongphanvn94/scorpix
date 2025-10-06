-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: scorpix
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `role` tinyint NOT NULL DEFAULT '0' COMMENT '0:admin 1:staff',
  `shop_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  KEY `admins_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admin','adminmaster@gmail.com','$2y$12$Wpf3e6hUt9/J1UvT/cub9eHJUxxoxmFGYaLIwp6cxVacwsNGiZPwa',1,0,NULL,NULL,NULL,0.00,'HcaOXvFAtxCZA3CefUJCmJymHdK5s3sZsW9xtbymhTWRBS1cObEWVeyleUNg',NULL,'2025-07-30 13:33:20',NULL,NULL,NULL,NULL),(10,'Admin Test','admin@test.com','$2y$12$JTGWC2lnYJe4FlEKEs1erOClHmcuMKkYMCKwB9jaaeXPPOVHhS9FW',1,1,'7',NULL,'/storage/avatars/avatar_10_1757661300.png',6500.00,'7ALI96exZakavVqb7c5WdxSqppJM3yDuo4ZYgmFkHVoJ1st3n3qYSAcpHUl2','2025-08-29 15:45:46','2025-09-14 14:25:00',NULL,NULL,NULL,NULL),(11,'Shop1','shop1@gmail.com','$2y$12$6TGfHIAbYYPsLTlrC9xKN.Vbwzfsj9qJsQrhtDt8XXDyg96akhAoW',1,1,'8',NULL,NULL,0.00,NULL,'2025-09-05 08:45:44','2025-09-05 08:45:44',NULL,NULL,NULL,NULL),(12,'Shop Demo','shopdemo@gmail.com','$2y$12$wDTgbUQVOUlt/xqDJRCHj.5yssUqNEBe16/aNF3Zzdx.wdnHDURlu',1,1,'9',NULL,NULL,500.00,NULL,'2025-09-07 05:10:51','2025-09-08 07:55:56',NULL,NULL,NULL,NULL),(13,'Demo Shop','demoshop@gmail.com','$2y$12$WnQ23E.mwVvtXtm10voeE.M./W7f4jxNSd5T216ovFBkj3/bmiooK',1,1,'10',NULL,NULL,500.00,'39Zd6h2yhg4SChOI5wWLgzHAOalm6HqG50Jwd6wuPwpXTUVZXhK9z6wTWNo0','2025-09-07 05:16:37','2025-09-07 05:18:59',NULL,NULL,NULL,NULL),(14,'Shop Name','shopname@gmail.com','$2y$12$QYcIbzzmWyxgV2ndg0g0J.SRC/pXYhrvAYhuiyaL./4.vJVTFFB9a',1,1,'11',NULL,NULL,1000.00,NULL,'2025-09-08 07:49:17','2025-09-08 07:56:08',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `parent_id` bigint unsigned DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_subscriptions`
--

DROP TABLE IF EXISTS `current_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_subscription_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_subscriptions`
--

LOCK TABLES `current_subscriptions` WRITE;
/*!40000 ALTER TABLE `current_subscriptions` DISABLE KEYS */;
INSERT INTO `current_subscriptions` VALUES (1,2,1,3,'2025-07-31 03:53:54','2025-07-31 03:53:36','2025-07-31 03:53:54','admin_added1753934016','admin_added1753934016'),(2,2,1,3,'2025-07-31 15:22:42','2025-07-31 03:53:54','2025-07-31 15:22:42','admin_added1753934034','admin_added1753934034'),(3,2,1,3,'2025-09-03 10:40:41','2025-07-31 15:22:42','2025-09-03 10:40:41','admin_added1753975362','admin_added1753975362'),(4,10,7,7,'2025-08-30 08:12:43','2025-08-30 07:08:10','2025-08-30 08:12:43','admin_added1756537690','admin_added1756537690'),(5,10,7,7,'2025-08-30 08:15:46','2025-08-30 08:12:43','2025-08-30 08:15:46','admin_added1756541563','admin_added1756541563'),(6,10,7,9,NULL,'2025-08-30 08:15:46','2025-08-30 08:15:46','admin_added1756541746','admin_added1756541746'),(7,13,10,7,NULL,'2025-09-07 05:22:22','2025-09-07 05:22:22','admin_added1757222542','admin_added1757222542'),(8,14,11,7,NULL,'2025-09-08 07:53:24','2025-09-08 07:53:24','admin_added1757318004','admin_added1757318004');
/*!40000 ALTER TABLE `current_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demo_shops`
--

DROP TABLE IF EXISTS `demo_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demo_shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demo_shops_is_active_sort_order_index` (`is_active`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demo_shops`
--

LOCK TABLES `demo_shops` WRITE;
/*!40000 ALTER TABLE `demo_shops` DISABLE KEYS */;
INSERT INTO `demo_shops` VALUES (1,'ádasd','https://example.com',NULL,'ád',1,0,'2025-08-29 11:55:18','2025-08-29 11:55:25','2025-08-29 11:55:25');
/*!40000 ALTER TABLE `demo_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"ff54d9ce-9067-425c-bd95-2e527bba8b01\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7clCCALp4NhlAMZTyHBdk5\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1757944082;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RazmDCALp4NhlAME58mEwRZ\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750167733;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1757944081;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750167733;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SW1pEfLQhBIVIU\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RazmDCALp4NhlAM6CtaiZaH\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1757944081;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SW1p6huJV7BWSm\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750167734;s:18:\\\"current_period_end\\\";i:1758116533;s:20:\\\"current_period_start\\\";i:1755438133;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RazmDCALp4NhlAME58mEwRZ\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RazmDCALp4NhlAME58mEwRZ\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1Rx6rHCALp4NhlAMBfLC2Nyd\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750167733;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758116533;s:20:\\\"current_period_start\\\";i:1755438133;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1757944082,1757944082),(2,'default','{\"uuid\":\"dd35a668-fd00-4833-b272-677d319bfa9c\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7d20CALp4NhlAMu4xh31am\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1757945124;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RazqrCALp4NhlAMLk019NlJ\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750168021;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1757945124;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750168021;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SW1usMyCcwVkG7\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RazqqCALp4NhlAMPwwiWC5p\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1757945124;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SW1upvqXKfReRE\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750168022;s:18:\\\"current_period_end\\\";i:1758116821;s:20:\\\"current_period_start\\\";i:1755438421;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RazqrCALp4NhlAMLk019NlJ\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RazqrCALp4NhlAMLk019NlJ\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1Rx6wBCALp4NhlAMwdngWpTh\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750168021;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758116821;s:20:\\\"current_period_start\\\";i:1755438421;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1757945125,1757945125),(3,'default','{\"uuid\":\"80ec3aa7-bacb-4ebd-9eb2-6df86bdfe50e\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7d20CALp4NhlAMiVi1aAMR\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1757945124;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RazjuCALp4NhlAMMzpWs05E\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750167589;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1757945124;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750167589;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SW1ndb9ictI4ES\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RazjtCALp4NhlAMv7VHKPim\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1757945124;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SW1ngFKi6tEUb8\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750167590;s:18:\\\"current_period_end\\\";i:1758116389;s:20:\\\"current_period_start\\\";i:1755437989;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RazjuCALp4NhlAMMzpWs05E\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RazjuCALp4NhlAMMzpWs05E\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1Rx6oPCALp4NhlAMDs6CVEVh\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750167589;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758116389;s:20:\\\"current_period_start\\\";i:1755437989;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1757945125,1757945125),(4,'default','{\"uuid\":\"05aa52e1-ed05-4717-b294-a9947ecf2b97\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7d4yCALp4NhlAMkeVCfvke\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1757945308;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1Razn6CALp4NhlAMCrryYh4H\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750167788;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1757945308;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750167788;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SW1q9f3FpzuPHU\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1Razn5CALp4NhlAMAFdFX0e7\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1757945308;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SW1q1Kd546Fux9\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750167789;s:18:\\\"current_period_end\\\";i:1758116588;s:20:\\\"current_period_start\\\";i:1755438188;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1Razn6CALp4NhlAMCrryYh4H\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1Razn6CALp4NhlAMCrryYh4H\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1Rx6rrCALp4NhlAMYMD79K64\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750167788;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758116588;s:20:\\\"current_period_start\\\";i:1755438188;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1757945309,1757945309),(5,'default','{\"uuid\":\"73b0ec47-e400-450c-a95a-f38837ee54d8\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7pifCALp4NhlAMzxlZlQMO\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1757993897;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RbCecCALp4NhlAMMQVk8KdF\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750217234;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1757993897;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750217234;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWF8xRFYeK01lJ\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RbCebCALp4NhlAMc2sY5ZVC\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1757993897;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWF8ztK5A7jetH\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750217235;s:18:\\\"current_period_end\\\";i:1758166034;s:20:\\\"current_period_start\\\";i:1755487634;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RbCecCALp4NhlAMMQVk8KdF\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RbCecCALp4NhlAMMQVk8KdF\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxJjaCALp4NhlAMhpOD2O21\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750217234;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758166034;s:20:\\\"current_period_start\\\";i:1755487634;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1757993898,1757993898),(6,'default','{\"uuid\":\"ccece911-e3e2-48a0-b9e7-1de62af3b823\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7sgHCALp4NhlAMXVggo6pG\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758005281;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RbFaVCALp4NhlAMTAv5hh2p\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750228511;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758005280;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750228511;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWF8xRFYeK01lJ\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RbFaUCALp4NhlAMGyLUCBH5\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758005280;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWIABfnkJBAhzo\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750228512;s:18:\\\"current_period_end\\\";i:1758177311;s:20:\\\"current_period_start\\\";i:1755498911;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RbFaVCALp4NhlAMTAv5hh2p\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RbFaVCALp4NhlAMTAv5hh2p\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxMezCALp4NhlAM6YiLojCC\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750228511;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758177311;s:20:\\\"current_period_start\\\";i:1755498911;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758005281,1758005281),(7,'default','{\"uuid\":\"0b9abe41-095a-42be-bb68-e2a464903ab1\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7sx3CALp4NhlAMo957dOEh\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758006321;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RbFccCALp4NhlAMNlKkNwq1\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750228642;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758006321;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750228642;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWF8xRFYeK01lJ\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RbFcbCALp4NhlAMy66J3z88\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758006321;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWIDmanYWJwxQH\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750228642;s:18:\\\"current_period_end\\\";i:1758177442;s:20:\\\"current_period_start\\\";i:1755499042;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RbFccCALp4NhlAMNlKkNwq1\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RbFccCALp4NhlAMNlKkNwq1\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxMhwCALp4NhlAMvNP2650N\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750228642;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758177442;s:20:\\\"current_period_start\\\";i:1755499042;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758006322,1758006322),(8,'default','{\"uuid\":\"0dc2ccf0-819e-414a-b428-3ac1620de06a\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7v1cCALp4NhlAMNCjUTqpF\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758014292;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RbI2mCALp4NhlAMYhTwde1k\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750237952;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758014291;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750237952;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWF8xRFYeK01lJ\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RbI2lCALp4NhlAM773ohe0k\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758014291;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWKiasDTu1Oxyu\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750237952;s:18:\\\"current_period_end\\\";i:1758186752;s:20:\\\"current_period_start\\\";i:1755508352;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RbI2mCALp4NhlAMYhTwde1k\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RbI2mCALp4NhlAMYhTwde1k\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxP7RCALp4NhlAM8g1kIv6D\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750237952;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758186752;s:20:\\\"current_period_start\\\";i:1755508352;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758014292,1758014292),(9,'default','{\"uuid\":\"a185bc16-5673-41db-a707-02a45c3009a6\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S7v1dCALp4NhlAMP3HXRxR0\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758014293;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RbHs4CALp4NhlAMljWACEiT\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750237288;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758014292;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750237288;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWF8xRFYeK01lJ\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RbHs3CALp4NhlAM0Hu2FEmJ\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758014292;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWKXlmQnRp8izE\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750237288;s:18:\\\"current_period_end\\\";i:1758186088;s:20:\\\"current_period_start\\\";i:1755507688;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RbHs4CALp4NhlAMljWACEiT\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RbHs4CALp4NhlAMljWACEiT\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxOwqCALp4NhlAM5b7eJDdy\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750237288;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758186088;s:20:\\\"current_period_start\\\";i:1755507688;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758014293,1758014293),(10,'default','{\"uuid\":\"ec9113df-1849-41d1-9d54-943e5f2cac13\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S8NOsCALp4NhlAMJ1gGFg5d\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758123366;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1RbkFUCALp4NhlAMtw1pPUQ2\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750346372;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758123366;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750346372;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWnquU89G1CxDy\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1RbkFTCALp4NhlAM1FfM1TT2\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758123366;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWnrDZPyNM15SQ\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750346373;s:18:\\\"current_period_end\\\";i:1758295172;s:20:\\\"current_period_start\\\";i:1755616772;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1RbkFUCALp4NhlAMtw1pPUQ2\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1RbkFUCALp4NhlAMtw1pPUQ2\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxrKoCALp4NhlAM6guE2n1l\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750346372;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758295172;s:20:\\\"current_period_start\\\";i:1755616772;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758123367,1758123367),(11,'default','{\"uuid\":\"1a1a841e-bed5-435e-bc68-55a5dc77a71d\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S8OnxCALp4NhlAMAnb2cBfo\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758128765;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1Rbla4CALp4NhlAMLEPscGaB\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750351492;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758128764;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750351492;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWnquU89G1CxDy\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1Rbla3CALp4NhlAMcmFX7ja9\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758128764;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWpERTzoAXUmIv\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750351492;s:18:\\\"current_period_end\\\";i:1758300292;s:20:\\\"current_period_start\\\";i:1755621892;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1Rbla4CALp4NhlAMLEPscGaB\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1Rbla4CALp4NhlAMLEPscGaB\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxsfLCALp4NhlAMkgftkhBH\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750351492;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758300292;s:20:\\\"current_period_start\\\";i:1755621892;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758128765,1758128765),(12,'default','{\"uuid\":\"f35fd09e-0bc9-4967-ba97-1c99932798f6\",\"displayName\":\"App\\\\Listeners\\\\StripeListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:28:\\\"App\\\\Listeners\\\\StripeListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:38:\\\"Laravel\\\\Cashier\\\\Events\\\\WebhookReceived\\\":1:{s:7:\\\"payload\\\";a:9:{s:2:\\\"id\\\";s:28:\\\"evt_1S8PWGCALp4NhlAMae0MjO7c\\\";s:6:\\\"object\\\";s:5:\\\"event\\\";s:11:\\\"api_version\\\";s:10:\\\"2023-10-16\\\";s:7:\\\"created\\\";i:1758131512;s:4:\\\"data\\\";a:1:{s:6:\\\"object\\\";a:49:{s:2:\\\"id\\\";s:28:\\\"sub_1Rbm7OCALp4NhlAMUcvqUidT\\\";s:6:\\\"object\\\";s:12:\\\"subscription\\\";s:11:\\\"application\\\";N;s:23:\\\"application_fee_percent\\\";N;s:13:\\\"automatic_tax\\\";a:3:{s:15:\\\"disabled_reason\\\";N;s:7:\\\"enabled\\\";b:0;s:9:\\\"liability\\\";N;}s:20:\\\"billing_cycle_anchor\\\";i:1750353558;s:27:\\\"billing_cycle_anchor_config\\\";N;s:12:\\\"billing_mode\\\";a:1:{s:4:\\\"type\\\";s:7:\\\"classic\\\";}s:18:\\\"billing_thresholds\\\";N;s:9:\\\"cancel_at\\\";N;s:20:\\\"cancel_at_period_end\\\";b:0;s:11:\\\"canceled_at\\\";i:1758131512;s:20:\\\"cancellation_details\\\";a:3:{s:7:\\\"comment\\\";N;s:8:\\\"feedback\\\";N;s:6:\\\"reason\\\";s:22:\\\"cancellation_requested\\\";}s:17:\\\"collection_method\\\";s:20:\\\"charge_automatically\\\";s:7:\\\"created\\\";i:1750353558;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"customer\\\";s:18:\\\"cus_SWnquU89G1CxDy\\\";s:14:\\\"days_until_due\\\";N;s:22:\\\"default_payment_method\\\";s:27:\\\"pm_1Rbm7NCALp4NhlAM5ERNJt4B\\\";s:14:\\\"default_source\\\";N;s:17:\\\"default_tax_rates\\\";a:0:{}s:11:\\\"description\\\";N;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"ended_at\\\";i:1758131512;s:16:\\\"invoice_settings\\\";a:2:{s:15:\\\"account_tax_ids\\\";N;s:6:\\\"issuer\\\";a:1:{s:4:\\\"type\\\";s:4:\\\"self\\\";}}s:5:\\\"items\\\";a:5:{s:6:\\\"object\\\";s:4:\\\"list\\\";s:4:\\\"data\\\";a:1:{i:0;a:13:{s:2:\\\"id\\\";s:17:\\\"si_SWpmfDJHBLYs4B\\\";s:6:\\\"object\\\";s:17:\\\"subscription_item\\\";s:18:\\\"billing_thresholds\\\";N;s:7:\\\"created\\\";i:1750353559;s:18:\\\"current_period_end\\\";i:1758302358;s:20:\\\"current_period_start\\\";i:1755623958;s:9:\\\"discounts\\\";a:0:{}s:8:\\\"metadata\\\";a:0:{}s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:5:\\\"price\\\";a:19:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:5:\\\"price\\\";s:6:\\\"active\\\";b:1;s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:18:\\\"custom_unit_amount\\\";N;s:8:\\\"livemode\\\";b:0;s:10:\\\"lookup_key\\\";N;s:8:\\\"metadata\\\";a:0:{}s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:9:\\\"recurring\\\";a:6:{s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:5:\\\"meter\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:12:\\\"tax_behavior\\\";s:11:\\\"unspecified\\\";s:10:\\\"tiers_mode\\\";N;s:18:\\\"transform_quantity\\\";N;s:4:\\\"type\\\";s:9:\\\"recurring\\\";s:11:\\\"unit_amount\\\";i:1000;s:19:\\\"unit_amount_decimal\\\";s:4:\\\"1000\\\";}s:8:\\\"quantity\\\";i:1;s:12:\\\"subscription\\\";s:28:\\\"sub_1Rbm7OCALp4NhlAMUcvqUidT\\\";s:9:\\\"tax_rates\\\";a:0:{}}}s:8:\\\"has_more\\\";b:0;s:11:\\\"total_count\\\";i:1;s:3:\\\"url\\\";s:64:\\\"\\/v1\\/subscription_items?subscription=sub_1Rbm7OCALp4NhlAMUcvqUidT\\\";}s:14:\\\"latest_invoice\\\";s:27:\\\"in_1RxtCBCALp4NhlAM12T4yy9m\\\";s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:3:{s:22:\\\"is_on_session_checkout\\\";s:4:\\\"true\\\";s:4:\\\"type\\\";s:7:\\\"default\\\";s:4:\\\"name\\\";s:7:\\\"default\\\";}s:33:\\\"next_pending_invoice_item_invoice\\\";N;s:12:\\\"on_behalf_of\\\";N;s:16:\\\"pause_collection\\\";N;s:16:\\\"payment_settings\\\";a:3:{s:22:\\\"payment_method_options\\\";a:7:{s:10:\\\"acss_debit\\\";N;s:10:\\\"bancontact\\\";N;s:4:\\\"card\\\";a:2:{s:7:\\\"network\\\";N;s:22:\\\"request_three_d_secure\\\";s:9:\\\"automatic\\\";}s:16:\\\"customer_balance\\\";N;s:7:\\\"konbini\\\";N;s:10:\\\"sepa_debit\\\";N;s:15:\\\"us_bank_account\\\";N;}s:20:\\\"payment_method_types\\\";N;s:27:\\\"save_default_payment_method\\\";s:3:\\\"off\\\";}s:29:\\\"pending_invoice_item_interval\\\";N;s:20:\\\"pending_setup_intent\\\";N;s:14:\\\"pending_update\\\";N;s:4:\\\"plan\\\";a:20:{s:2:\\\"id\\\";s:30:\\\"price_1RZBNJCALp4NhlAMPL8AQ0dI\\\";s:6:\\\"object\\\";s:4:\\\"plan\\\";s:6:\\\"active\\\";b:1;s:6:\\\"amount\\\";i:1000;s:14:\\\"amount_decimal\\\";s:4:\\\"1000\\\";s:14:\\\"billing_scheme\\\";s:8:\\\"per_unit\\\";s:7:\\\"created\\\";i:1749735661;s:8:\\\"currency\\\";s:3:\\\"usd\\\";s:8:\\\"interval\\\";s:5:\\\"month\\\";s:14:\\\"interval_count\\\";i:1;s:8:\\\"livemode\\\";b:0;s:8:\\\"metadata\\\";a:0:{}s:5:\\\"meter\\\";N;s:8:\\\"nickname\\\";N;s:7:\\\"product\\\";s:19:\\\"prod_SU9gQA1PPnA8RN\\\";s:10:\\\"tiers_mode\\\";N;s:15:\\\"transform_usage\\\";N;s:17:\\\"trial_period_days\\\";N;s:10:\\\"usage_type\\\";s:8:\\\"licensed\\\";s:15:\\\"aggregate_usage\\\";N;}s:8:\\\"quantity\\\";i:1;s:8:\\\"schedule\\\";N;s:10:\\\"start_date\\\";i:1750353558;s:6:\\\"status\\\";s:8:\\\"canceled\\\";s:10:\\\"test_clock\\\";N;s:13:\\\"transfer_data\\\";N;s:9:\\\"trial_end\\\";N;s:14:\\\"trial_settings\\\";a:1:{s:12:\\\"end_behavior\\\";a:1:{s:22:\\\"missing_payment_method\\\";s:14:\\\"create_invoice\\\";}}s:11:\\\"trial_start\\\";N;s:18:\\\"current_period_end\\\";i:1758302358;s:20:\\\"current_period_start\\\";i:1755623958;s:8:\\\"discount\\\";N;}}s:8:\\\"livemode\\\";b:0;s:16:\\\"pending_webhooks\\\";i:1;s:7:\\\"request\\\";a:2:{s:2:\\\"id\\\";N;s:15:\\\"idempotency_key\\\";N;}s:4:\\\"type\\\";s:29:\\\"customer.subscription.deleted\\\";}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}',0,NULL,1758131513,1758131513);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_05_21_015140_create_categories_table',1),(5,'2025_05_21_015155_create_products_table',1),(6,'2025_05_21_015212_create_customers_table',1),(7,'2025_05_21_015222_create_orders_table',1),(8,'2025_05_21_015237_create_notifications_table',1),(9,'2025_05_21_015246_create_messages_table',1),(10,'2025_05_21_015300_create_rates_table',1),(11,'2025_05_21_015311_create_feedback_table',1),(12,'2025_05_21_015356_create_complaints_table',1),(13,'2025_05_21_015405_create_news_table',1),(14,'2025_05_21_015452_create_accounts_table',1),(15,'2025_05_21_131650_create_brands_table',1),(16,'2025_06_11_035949_create_admins_table',1),(17,'2025_06_11_141154_create_shops_table',1),(18,'2025_06_12_133233_create_customer_columns',1),(19,'2025_06_12_133234_create_subscriptions_table',1),(20,'2025_06_12_133235_create_subscription_items_table',1),(21,'2025_06_12_142154_modifile_products_table',1),(22,'2025_06_12_163703_create_subscriber_histories_table',1),(23,'2025_06_13_063857_modifile_products_table',1),(24,'2025_06_13_124920_create_settings_table',1),(25,'2025_06_13_133903_modifile_subscriber_histories_table',1),(26,'2025_06_13_135234_modifile_products_table',1),(27,'2025_06_13_161836_create_customer_columns',1),(28,'2025_06_13_171428_create_shop_frequencies_table',1),(29,'2025_06_14_082551_modifile_subscriber_history',1),(30,'2025_06_15_025413_modifile_settings_table',1),(31,'2025_06_15_041311_create_table_shop_token_stocks',1),(32,'2025_06_15_044228_modifile_products_table',1),(33,'2025_06_15_085115_modifile_shops_table',1),(34,'2025_06_15_091914_modifile_shop_frequencies_table',1),(35,'2025_06_17_062934_modifile_products_table',1),(36,'2025_06_17_144934_modifile_subscriber_histories_table',1),(37,'2025_06_18_083055_current_subscriptions',1),(38,'2025_06_19_174207_add_column_current_subscriptions_table',1),(39,'2025_06_20_034433_modifile_shops_table',1),(40,'2025_06_21_100448_modifile_shops_table',1),(41,'2025_06_21_120821_add_column_into_shops_table',1),(42,'2025_08_05_113040_create_payments_table',2),(43,'2025_08_05_113106_add_vietqr_fields_to_orders_table',3),(44,'2025_08_06_103454_add_google_fields_to_admins_table',3),(45,'2025_08_22_093658_create_personal_access_tokens_table',2),(46,'2025_08_22_101430_add_google_fields_to_admins_table',4),(47,'2025_08_22_113424_create_demo_shops_table',2),(48,'2025_08_22_122835_create_qas_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VND',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code_url` text COLLATE utf8mb4_unicode_ci,
  `vietqr_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `payment_confirmed_at` timestamp NULL DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'VND',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `gateway_response` json DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`),
  KEY `payments_transaction_id_status_index` (`transaction_id`,`status`),
  KEY `payments_order_id_status_index` (`order_id`,`status`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
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
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\Admin',10,'auth-token','df6b6d0e09114de55fed6548ba6d1ffdf744ed20130bf7b6dd97efae9a7c5cba','[\"*\"]',NULL,NULL,'2025-08-29 15:45:46','2025-08-29 15:45:46'),(2,'App\\Models\\Admin',11,'auth-token','ae5e96aa076248dc21b1e078f6ba1a0cc0626c032b642bacdda74958a1f413de','[\"*\"]',NULL,NULL,'2025-09-05 08:45:44','2025-09-05 08:45:44'),(3,'App\\Models\\Admin',12,'auth-token','ee8b50de06c9ea994051cbd8d6c44bb82d211d5010efe37320efb2f5c201afd9','[\"*\"]',NULL,NULL,'2025-09-07 05:10:51','2025-09-07 05:10:51'),(4,'App\\Models\\Admin',13,'auth-token','d1b9fd93733065340b8c3cc2e4ced0dab0a418c6be53174912ca8a243e2788bf','[\"*\"]',NULL,NULL,'2025-09-07 05:16:37','2025-09-07 05:16:37'),(5,'App\\Models\\Admin',14,'auth-token','0cb554aa5c471bde9562ed29296727ec09f4d6c6d6cbf397690b332fbeae71ca','[\"*\"]',NULL,NULL,'2025-09-08 07:49:17','2025-09-08 07:49:17');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` int NOT NULL,
  `image` json DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1',
  `stripe_price_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `token_qty` int NOT NULL DEFAULT '1000',
  `day_available` int NOT NULL DEFAULT '30' COMMENT 'only available for type One Time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_stripe_product_id_unique` (`stripe_price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'One Time-S','<p></p>',15,'[]','2025-07-30','2025-07-30 16:47:11','2025-08-29 15:24:22',1,'onetime-s',NULL,100,365),(3,'One Time-M',NULL,35,'[]','2025-08-27','2025-07-31 03:51:51','2025-09-03 09:48:29',1,'onetime-m',NULL,300,365),(4,'One Time-L',NULL,99,'[]','2025-08-29','2025-08-29 15:25:18','2025-08-29 15:25:18',1,'onetime-l',NULL,1000,365),(5,'One Time-XL',NULL,349,'[]','2025-08-29','2025-08-29 15:25:47','2025-08-29 15:25:47',1,'onetime-xl',NULL,5000,365),(6,'One Time-XXL',NULL,599,'[]','2025-08-29','2025-08-29 15:26:15','2025-08-29 15:26:15',1,'onetime-xxl',NULL,10000,365),(7,'Monthly-S',NULL,49,'[]','2025-08-29','2025-08-29 15:26:42','2025-08-29 15:26:42',3,'monthly-s',NULL,500,30),(8,'Monthly-M',NULL,89,'[]','2025-08-29','2025-08-29 15:27:02','2025-08-29 15:27:02',3,'monthly-m',NULL,1000,30),(9,'Monthly-L',NULL,159,'[]','2025-08-29','2025-08-29 15:28:06','2025-08-29 15:28:06',3,'monthly-l',NULL,2000,30),(10,'Monthly-XL',NULL,299,'[]','2025-08-29','2025-08-29 15:28:34','2025-08-29 15:28:34',3,'monthly-xl',NULL,5000,30),(11,'Monthly-XXL',NULL,499,'[]','2025-08-29','2025-08-29 15:28:59','2025-08-29 15:28:59',3,'monthly-xxl',NULL,10000,30),(14,'Yearly-S',NULL,479,'[]','2025-08-29','2025-08-29 15:30:41','2025-08-29 15:30:41',4,'yearly-s',NULL,6000,30),(15,'Yearly-M',NULL,839,'[]','2025-08-29','2025-08-29 15:31:12','2025-08-29 15:31:12',4,'yearly-m',NULL,12000,30),(16,'Yearly-L',NULL,1439,'[]','2025-08-29','2025-08-29 15:32:16','2025-08-29 15:32:16',4,'yearly-l',NULL,24000,30),(17,'Yearly-XL',NULL,2999,'[]','2025-08-29','2025-08-29 15:32:41','2025-08-29 15:32:41',4,'yearly-xl',NULL,60000,30),(18,'Yearly-XXL',NULL,4799,'[]','2025-08-29','2025-08-29 15:33:15','2025-08-29 15:33:15',4,'yearly-xxl',NULL,120000,30);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qas`
--

DROP TABLE IF EXISTS `qas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qas`
--

LOCK TABLES `qas` WRITE;
/*!40000 ALTER TABLE `qas` DISABLE KEYS */;
INSERT INTO `qas` VALUES (1,'What is Scorpix?','Scorpix is a comprehensive e-commerce platform that helps businesses manage their online stores efficiently.',1,'2025-08-29 11:06:14','2025-08-29 11:06:14'),(2,'How to get started?','You can get started by signing up for an account and following our setup guide.',1,'2025-08-29 11:06:14','2025-08-29 11:06:14'),(3,'Is there a free trial?','Yes, we offer a 14-day free trial for all new users.',1,'2025-08-29 11:06:14','2025-08-29 11:06:14'),(4,'test','test',1,'2025-08-29 11:17:26','2025-08-29 11:17:26'),(5,'test','test',1,'2025-08-29 11:29:14','2025-08-29 11:29:14'),(6,'Test question from terminal','Test answer from terminal',1,'2025-08-29 11:41:37','2025-08-29 11:41:37');
/*!40000 ALTER TABLE `qas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0gm9fX68OJQ6ALJGbuJ5DBWb1ZZlo6T14hQ8LrO6',NULL,'64.62.197.212','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1E4cXQ5Snpwbjc5Vm1mQ09HaExGVjRwSlJXRDFZRVY3M2t1a1diVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vOTEuOTguMTE3LjE2OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758337062),('3IFCtquH7PMYU4UWF9gOB3qNQVvIkh0N2IXG58ZK',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibDhOaUxFYWtGNm84TzJBVjg1ZkNWZ3RDM1ZKcDVEeVZzdUt6TFhkWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPWFkbWluJnVzZXJuYW1lPWFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758332593),('4AaVNpuVtIUqZ7o5DYIuQWT0kUXhuqjHhX77Z1Uf',NULL,'204.76.203.10','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnRxYjQ5MEZENnFtRVYzQkZGWVNZSGd1SXJ4OWZMU1E0RjZoeU43YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc2NvcnBpeC5jby9jZ2ktYmluL2x1Y2kvO3N0b2s9L2xvY2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758325944),('alRFnF84AyHJ2NocLtqciQx2eE51BrxQ4CuonYBN',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVZvbWRnWVdsT1NCbmpQYUhQYUt1SUVWeDFrVVNjUXVyMWRpN3IwaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPWFkbWluJnVzZXJuYW1lPWFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758330241),('AqqA4ayCnidzZ81V7pIWBWQtPztJ6EwSM8VVBTVg',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFJESjY4bzBEeDRWTHVnbW81VjVGZUZrcmJkYVBxQ1ZSUDBYbVJpViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPXRlbGVjb21hZG1pbiZ1c2VybmFtZT10ZWxlY29tYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758332592),('AySHoVNS1lbu0GfcFIC3mpeOWxkGzGHNQl1tQYnn',NULL,'64.62.197.216','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDc1dmptU0QxUEZuazZLckpiM0RmS2UxZTZqcUJoRktRNHlDUmJzWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vOTEuOTguMTE3LjE2OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758337624),('BzbXfWpmYBJKfZcKVjT3CbXeU8QN5pSjXDBflFgl',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVhDSFFuRlJXcWRob0htTHV2OE9KSkIzSEI2c3VwRThzRjQyQUhoOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPWZpYnJlJTQwZG0lMjFuJnVzZXJuYW1lPWF3bmZpYnJlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758332592),('cwWdN2cghjwSQg3tnlgFfYT4UsbxtnIhPKlLfK72',NULL,'64.62.197.212','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDVFNUZ4eEpST0RYYkNnZ25McVRwU041b05Vczdjazl6NlpzUkVnSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vOTEuOTguMTE3LjE2OC93ZWJ1aSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758337310),('dHilvyZJnFlrSzQ32Lgl2f4LXIwqx6JlE1fTkhvW',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2Z3TTZTSjZMaUxPSm9iYmxud0dabXVVY0pCTnVoQ2JXY3BOMzF2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPTEyMzQmdXNlcm5hbWU9YWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758332592),('dpdLKvN4ubqXxfWmEGeKSQZjcVsQHZFgjKXPDf6Q',NULL,'34.205.177.147','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVNsVjkzWUpUT05hcUZnN3lQMEE2TGVRNktpUjFZa09IajRwRW9LMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758325486),('Eaw4fK8t7gdzuKjJaqH1pqmWuRqiJdJnX1Ul8GgW',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicUFYOXVud3EweFR1UklkR2JkSEFXRThQT2tlRWlRQ25oTUpTSk9rRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPTEyMzQmdXNlcm5hbWU9YWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758330241),('eUDxjpGMkRQwwT26rLJW5JSdClOYuPth9JXqCJJn',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDFJRGhKNE9WS0Q2d2cyeFVQbGEzRmpCcVFqZVpxM3RzeTVpcEREbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758332592),('eyssC7oUcrfVdqQXzg8LPArB04ZkHB5Fx69SVAWe',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNG1TOFJnaWZmdHhSMDhiWjBpeHl3THR4NER4cDhFeldaeXpTczR3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758332592),('fOrAtXrBMfYrqx34zNYsGfZmSa5obA8Moqo3ot1L',NULL,'204.76.203.10','','YTozOntzOjY6Il90b2tlbiI7czo0MDoibkVVU3ZIMlRPcElmUVlFZ1VlSkFSYnFzUkFxNEF5WW1vc3VtR2w4OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc2NvcnBpeC5jby9jZ2ktYmluL2x1Y2kvO3N0b2s9L2xvY2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758338482),('gTo8CrrERv5ha3f7dMZSyFzzg02GOMQruKPSnSzV',NULL,'204.76.203.10','','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2hlWmRXb1JBTkREeldta0lnNFgyb1ppZUxYUWtLYVVzbVZYR29jVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc2NvcnBpeC5jby9jZ2ktYmluL2x1Y2kvO3N0b2s9L2xvY2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758330724),('hemVPqrkmP3Y8PJ8l4VKCC1KEIk9KnTDjYgL4qKa',NULL,'204.76.203.10','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUZMSHJKS0pjaXdPV2pFdWNITjdHQ0Yxb0NkRndZVzB5aDBmVVV2VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc2NvcnBpeC5jby9jZ2ktYmluL2x1Y2kvO3N0b2s9L2xvY2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758335319),('Id3dLKwDRL6apyHTcT50QLJuo27weUm3rhMDuUEM',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVdMVDhzempIaWg0Wnc5RVpXSU9MOXV3WFFrME52RlNPYWdhMXF5NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758334915),('iMUwBhZ9l3fU9PBCasNo5l6fzhtjULTCWqO6pveu',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMndEYlJzY013RFNoMmxZaTg2dUFjSXFEVTR0bnVMWWdJNk03b05EMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPXRlbGVjb21hZG1pbiZ1c2VybmFtZT10ZWxlY29tYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758334914),('j1EZBZScf1DAzUao9yslTtQGQTXoIqAyXs4gsbMb',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzhSWXBzamplbHhPd0Nad042alFacjVWVWlXcWhlczlHbmllSTZIMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758330241),('KLXnHfhLIdm4a2Av31V0ORNuViq36HVImeyW90VO',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0xTYUNMdXJIaHF5SFhHQ01SanFvTkFOT1lLR2QxUUxCczRDVXhHdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758334914),('Lc8GaKUiH2V7WCap0GYWw5q14dvfEKniTOFsingi',NULL,'35.203.210.84','Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0llWXkzVWhmTjVidEphcTlrc3dVVHZsYTVVSkt4eUw1Z244SW5ZVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHBzOi8vOTEuOTguMTE3LjE2OCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758330036),('lcYsZoo7CQgobaCSbGHDlFXm6mPkTWpODXeL8wtw',NULL,'64.62.197.212','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1BlekszMDhzaHZGUTlVekVRVXJHbGMwTlh2azdab3ZaRUl6UFBZdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vOTEuOTguMTE3LjE2OC9nZW9zZXJ2ZXIvd2ViIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758338378),('mStO1dw3BGreGqoHqFcZ6qRC4ADsbijfWDbeNK16',NULL,'65.49.1.234','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Safari/605.1.15','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTBHMlVnZGRTSG9Jd2JiS0FaVkFvZzJSTW1KY1dZanE2SkNzNHJBTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758326675),('Ny7k9V7hOK5soTeUrG37efrylYp920YtQSP0IHhd',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnZKWDNST1FTcThwZ1FpaXBYVTZoTlNaMDJlUXdIWXlpcUdtZDJTdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758330241),('o1XQyYtRVP5KQNg2aksWVTtxT80Vc1qdWUs1PgPJ',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGtuWU5lcU1zdVI3enJ0OUU3bUF0S3FQUUt6WEpSbkd1N0dHMXZ6UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPTEyMzQmdXNlcm5hbWU9YWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758334914),('O2VVz78wBw2Qs12XNhJgPVolOBAHBp6rJHscPWKs',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVZxNHYyRmZIQ2g5VHI0RGhXcnQwZzJkNWV6TFlwRmtsSVNqWUxueCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758330241),('Ofk9DydxNkVklcnNM7gkK2mztKudkX4rN2I3icgm',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXNpSnJIRUZ1V1B2em1kR3czOGxNWk05Sk5mVEJTTDM5eGpzMzdIYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPWZpYnJlJTQwZG0lMjFuJnVzZXJuYW1lPWF3bmZpYnJlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758334915),('OJCE2qCISjCyvfHZLq15vNz8Gnp5iX3m6YYjFzOh',NULL,'162.216.150.237','Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWlUUWVxY0gxR1dDVUthRFRLUnk4cGp1MGxpd1hDSVdEZjBOYTZ4ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758337931),('oqO1Ttc695XzZyLilQTB3VoPgRpdBgRHW64Azvc4',NULL,'182.42.104.32','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1ZLQU9HaGlJUlpyMWxHTkRTU20xcDhZYzJ2NzVwSjN5QlVHa0ZiaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758329116),('OSzIHv7BTGlsLkvjn7njf7jbhgUIyFFl27vFneeX',NULL,'204.76.203.10','','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWJZcmFYcDlNVkNiZm5kQTRRenczZ05tY29PQldPOU9ZS2tRaUFLaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc2NvcnBpeC5jby9jZ2ktYmluL2x1Y2kvO3N0b2s9L2xvY2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758328236),('pOlVJ74TxnjjfJKCzPcJI4NX14xYLKJ3GglPTp4R',NULL,'185.242.226.106','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2ROSUZPQW1GZGhBZXFuMEh6d0FPVzJNM01Sc3dWNkRJQURtbmI0QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758325779),('qRDOnJEk0r3s0zrdEmpegSm1belkBMT6isoSkUyi',NULL,'20.168.107.40','Mozilla/5.0 zgrab/0.x','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGhZM0xDcFJDaERpalJnOTlOR25JU0M4MjZWU3JQRW1qTEhLTXNNRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHBzOi8vOTEuOTguMTE3LjE2OC9kZXZlbG9wbWVudHNlcnZlci9tZXRhZGF0YXVwbG9hZGVyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758335696),('RtKU2v6NsNXkXKUZKkNEagoliEa7xoCdcBmUsSCu',NULL,'185.242.226.80','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/95.0.4638.69 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3JuazhxaWkwRUlnM1FrZ1JOU1gyOGdDQXk5eWxCdHVvdGtOcE9LcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758328358),('SfoaN7Fa8XLIn2u3xkNz7BTAReLygopSrczSRacR',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTRLN2JObE5HSzU1OU9NMEhIbnB6bkd2Sk55bVRydngyS3pIQ0tKaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPXRlbGVjb21hZG1pbiZ1c2VybmFtZT10ZWxlY29tYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758330241),('SxCggfoU08pPV6j9hJqflKt31z7RsPa0KX9VOY1G',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDR5UVFDRE90UXdZdlhiUDlZSElBQWVKekczQlJWTEVseDVkakFrZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758332593),('TsEy682T9HtRXELJIEgFlHpdkiPNK1VYkHjf5mXQ',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW5CUzdqSTR6S2NqekxYWURzSVJHT2xkSEFOdmJLUmxZeFRXdzczQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758332593),('U3BQCYtOglbgUhbnF2R8D161DUaPdOxQj38nEP7C',NULL,'14.191.161.112','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGVGWlJYY1VMSklaSzRXZDVSWTNqNDB1bktVOFo0dWtjSU5lYktnSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHBzOi8vc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758339283),('uwaIpKb30O8INdWCcjHtFMPYObhQpsbjdyhzs1PI',NULL,'3.228.0.184','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWhpNHRpa3RCcEVMZEUyQ0lFU0hITnhza0tEZGtaUjNyMldBRFJndiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vZGVtb3Nob3Auc2NvcnBpeC5jbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758329830),('VF2rQl7INrMZTQIRCSEW72tm4VApiBt8DjujafZU',NULL,'185.224.128.52','python-requests/2.25.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoia3d1QkFzM1ZpdDEybDNBQWNmRzVJM1lOS2Z1TXF2aGo2Mk95Y3RrSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vOTEuOTguMTE3LjE2OC9hc3NldHMvanMvdmlld3MvbG9naW4uanMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758338525),('WgtwlKlxAPqM6rnEAjUZCFyNhir0EIxJW0DK6xx4',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib25PSUNkSWtXeDB1VUVWaXZKNHNMRWNvUEZvckM4Z0Z5eHZNT2N1biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPWFkbWluJnVzZXJuYW1lPWFkbWluIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758334915),('WKeNCO6x3qv4Vk7qLQKihLmqf7d6eIqA84ql34LR',NULL,'204.76.203.10','','YTozOntzOjY6Il90b2tlbiI7czo0MDoicUVFZW1nMlVxbXFuMXdXWGdNSGRGcmdwMnFLVWxOMnpwcVVlRDByMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vc2NvcnBpeC5jby9jZ2ktYmluL2x1Y2kvO3N0b2s9L2xvY2FsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1758332283),('XNgdQOQ1jlZCULWC6ETPITf3zi0Uszsug2KvRovc',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUowbUlxSVQ5VXQ4UHhsOGFZcjREMGtHTFVhRFZjMWg2VTNJSkxvdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHBzOi8vc2NvcnBpeC5jby9sb2dpbi5jZ2k/cHNkPWZpYnJlJTQwZG0lMjFuJnVzZXJuYW1lPWF3bmZpYnJlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1758330241),('zsvnYwo020ivtTF76ekIzXcFbM6pV0eGt4TxQh40',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRThtRGEyNmpEeU1HNWlzWjBqdDlseHF3NHVXem9OampGSjVYNUxJTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758334915),('zSZ9Ab0ZIMfuj4lYLpYVEyStahYkk5bv2wJVPw8Y',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0d1bzQ0ZHpPWG9DTU96QTQ0S2NDRnFRZFJLdW1ueTVEWjg4TVNISyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758334915),('zWOiwKO0m4ltEEX9n2esP3NQ1vNhBb9jYJY4feuw',NULL,'204.76.203.211','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.6167.85 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEo1NndVaDlpcHFZNTU2MFhDcVp4Y0VCSmhKU0thYlVPb2I2WDgxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vc2NvcnBpeC5jby9yZWRpcmVjdExvZ2luR2V0Lmpzb24/dGltZVN0YW1wPTE3MTUwNzYzNzkyODYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1758330241);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `remaining` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mail_subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mail_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_frequencies`
--

DROP TABLE IF EXISTS `shop_frequencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_frequencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `daily_count` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_frequencies`
--

LOCK TABLES `shop_frequencies` WRITE;
/*!40000 ALTER TABLE `shop_frequencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_frequencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_token_stocks`
--

DROP TABLE IF EXISTS `shop_token_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_token_stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `token_qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_start_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_end_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_token_stocks`
--

LOCK TABLES `shop_token_stocks` WRITE;
/*!40000 ALTER TABLE `shop_token_stocks` DISABLE KEYS */;
INSERT INTO `shop_token_stocks` VALUES (1,1,3,'1000','2025-07-31 00:00:00','2025-08-31 23:59:59',1,'2025-07-31 03:53:36','2025-07-31 03:53:36'),(2,1,3,'1000','2025-07-31 00:00:00','2025-08-31 23:59:59',1,'2025-07-31 03:53:54','2025-07-31 03:53:54'),(3,1,3,'1000','2025-07-31 00:00:00','2025-08-31 23:59:59',1,'2025-07-31 15:22:42','2025-07-31 15:22:42'),(4,7,7,'500','2025-08-30 00:00:00','2025-09-30 23:59:59',1,'2025-08-30 07:08:10','2025-08-30 07:08:10'),(5,7,7,'500','2025-08-30 00:00:00','2025-09-30 23:59:59',1,'2025-08-30 08:12:43','2025-08-30 08:12:43'),(6,7,9,'2000','2025-08-30 00:00:00','2025-09-30 23:59:59',1,'2025-08-30 08:15:46','2025-08-30 08:15:46'),(7,10,7,'500','2025-09-07 00:00:00','2025-10-07 23:59:59',1,'2025-09-07 05:22:22','2025-09-07 05:22:22'),(8,11,7,'500','2025-09-08 00:00:00','2025-10-08 23:59:59',1,'2025-09-08 07:53:24','2025-09-08 07:53:24');
/*!40000 ALTER TABLE `shop_token_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint unsigned DEFAULT NULL,
  `subdomain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefecture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_key_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `current_token_qty` int DEFAULT '0',
  `token_expired_date` date DEFAULT NULL,
  `current_token_subscribe_qty` int DEFAULT NULL,
  `token_subscribe_expired_date` datetime DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shops_subdomain_unique` (`subdomain`),
  UNIQUE KEY `shops_api_key_unique` (`api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,2,NULL,'Tiep Dang',NULL,NULL,NULL,NULL,'0375299880','0',1,'84b815a8dc8f46e895e76f968bda8ab5bc6ad14e86ddd9089130a77697b2b5ac',NULL,NULL,NULL,NULL,3000,NULL,990,'2025-08-31 23:59:59','https://demoshop.scorpix.co'),(2,3,NULL,'Truong Lc',NULL,NULL,NULL,NULL,'0333337070','0',1,'sdfdfd',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'https://khanhtre.vn'),(3,4,NULL,'Chang Chang',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(4,5,NULL,'Lil Kɔnɟ',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(5,6,NULL,'Nguyen Hoang',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(6,7,NULL,'Hoàng Tấn Lộc',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(7,10,NULL,'Admin Test',NULL,NULL,NULL,NULL,'0375299867','0',1,'925b42ffc0ac478cb4aa06d1aa2125f199a561a4e288b893952c8d4ac49e225c',NULL,NULL,NULL,NULL,6500,NULL,1966,'2025-09-30 23:59:59','https://demoshop.scorpix.co:8443'),(8,11,NULL,'Shop1',NULL,NULL,NULL,NULL,NULL,NULL,1,'11Sho20250905084544',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,'https://shop1.vn'),(9,12,NULL,'Shop Demo',NULL,NULL,NULL,NULL,NULL,NULL,1,'12Sho20250907051051',NULL,NULL,NULL,NULL,500,NULL,NULL,NULL,'https://shopdemo.com'),(10,13,NULL,'Demo Shop',NULL,NULL,NULL,NULL,'0375299878','0',1,'13Dem20250907051637',NULL,NULL,NULL,NULL,500,NULL,500,'2025-10-07 23:59:59','https://demoshop.com'),(11,14,NULL,'Shop Name',NULL,NULL,NULL,NULL,'03752998679','0',1,'14Sho20250908074917',NULL,NULL,NULL,NULL,1000,NULL,500,'2025-10-08 23:59:59','https://shopname.com');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriber_histories`
--

DROP TABLE IF EXISTS `subscriber_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriber_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `shop_id` bigint unsigned NOT NULL,
  `price` int NOT NULL,
  `type` int NOT NULL DEFAULT '1',
  `payment_status` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_qty` int NOT NULL DEFAULT '1000',
  `payment_session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_price_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriber_histories_payment_session_id_unique` (`payment_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriber_histories`
--

LOCK TABLES `subscriber_histories` WRITE;
/*!40000 ALTER TABLE `subscriber_histories` DISABLE KEYS */;
INSERT INTO `subscriber_histories` VALUES (1,3,1,1212,3,1,NULL,'2025-07-31 03:53:36','2025-07-31 03:53:36','\"admin_added1753934016\"',1000,'admin_added1753934016','admin_added1753934016'),(2,3,1,1212,3,1,NULL,'2025-07-31 03:53:54','2025-07-31 03:53:54','\"admin_added1753934034\"',1000,'admin_added1753934034','admin_added1753934034'),(3,3,1,1212,3,1,NULL,'2025-07-31 15:22:42','2025-07-31 15:22:42','\"admin_added1753975362\"',1000,'admin_added1753975362','admin_added1753975362'),(4,1,1,15,1,3,NULL,'2025-08-29 15:35:17','2025-08-29 15:35:17','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68b1c8b5a78ad\",\"order_id\":\"SP2P1T1756481716R569b04\",\"amount_vnd\":394050,\"amount_usd\":15,\"content\":\"ScorpiX One Time-S SP2P1T1756481716R569b04\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-08-29T15:35:17.686727Z\",\"product_info\":{\"id\":1,\"name\":\"One Time-S\",\"description\":\"<p><\\/p>\",\"token_qty\":100,\"type\":\"One Time\"}}',100,'SP2P1T1756481716R569b04','onetime-s'),(5,7,7,49,3,1,NULL,'2025-08-29 15:59:19','2025-09-03 13:39:07','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68b1ce570e187\",\"order_id\":\"SP10P7T1756483157R70eef0\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP10P7T1756483157R70eef0\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-08-29T15:59:19.058087Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP10P7T1756483157R70eef0','monthly-s'),(6,7,7,49,3,1,NULL,'2025-08-30 07:08:10','2025-08-30 07:08:10','\"admin_added1756537690\"',500,'admin_added1756537690','admin_added1756537690'),(7,3,7,35,1,1,NULL,'2025-08-30 07:10:04','2025-08-30 07:18:18','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68b2a3cc99810\",\"order_id\":\"SP10P3T1756537803R77dbe8\",\"amount_vnd\":919450,\"amount_usd\":35,\"content\":\"ScorpiX One Time-M SP10P3T1756537803R77dbe8\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-08-30T07:10:04.629254Z\",\"product_info\":{\"id\":3,\"name\":\"One Time-M\",\"description\":null,\"token_qty\":1000,\"type\":\"One Time\"}}',1000,'SP10P3T1756537803R77dbe8','onetime-m'),(8,9,7,159,3,1,NULL,'2025-08-30 07:25:15','2025-08-30 07:27:21','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68b2a75b15faa\",\"order_id\":\"SP10P9T1756538711Re452aa\",\"amount_vnd\":4176930,\"amount_usd\":159,\"content\":\"ScorpiX Monthly-L SP10P9T1756538711Re452aa\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-08-30T07:25:15.090576Z\",\"product_info\":{\"id\":9,\"name\":\"Monthly-L\",\"description\":null,\"token_qty\":2000,\"type\":\"Monthly\"}}',2000,'SP10P9T1756538711Re452aa','monthly-l'),(9,7,7,49,3,1,NULL,'2025-08-30 08:12:43','2025-08-30 08:12:43','\"admin_added1756541563\"',500,'admin_added1756541563','admin_added1756541563'),(10,9,7,159,3,1,NULL,'2025-08-30 08:15:46','2025-08-30 08:15:46','\"admin_added1756541746\"',2000,'admin_added1756541746','admin_added1756541746'),(11,7,9,49,3,3,NULL,'2025-09-07 05:11:51','2025-09-08 07:55:57','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68bd141785eff\",\"order_id\":\"SP12P7T1757221905Ra363dc\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP12P7T1757221905Ra363dc\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-07T05:11:51.548883Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP12P7T1757221905Ra363dc','monthly-s'),(12,7,9,49,3,2,NULL,'2025-09-07 05:13:44','2025-09-08 07:55:48','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68bd14881efdd\",\"order_id\":\"SP12P7T1757222022R0e211f\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP12P7T1757222022R0e211f\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-07T05:13:44.127341Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP12P7T1757222022R0e211f','monthly-s'),(13,7,10,49,3,1,NULL,'2025-09-07 05:17:53','2025-09-07 05:18:59','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68bd158182992\",\"order_id\":\"SP13P7T1757222272Raa0a71\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP13P7T1757222272Raa0a71\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-07T05:17:53.535285Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP13P7T1757222272Raa0a71','monthly-s'),(14,7,10,49,3,1,NULL,'2025-09-07 05:22:22','2025-09-07 05:22:22','\"admin_added1757222542\"',500,'admin_added1757222542','admin_added1757222542'),(15,7,11,49,3,1,NULL,'2025-09-08 07:52:00','2025-09-08 07:53:08','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68be8b204fc33\",\"order_id\":\"SP14P7T1757317919R516bfc\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP14P7T1757317919R516bfc\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-08T07:52:00.327176Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP14P7T1757317919R516bfc','monthly-s'),(16,7,11,49,3,2,NULL,'2025-09-08 07:53:24','2025-09-08 07:56:25','\"admin_added1757318004\"',500,'admin_added1757318004','admin_added1757318004'),(17,7,7,49,3,3,NULL,'2025-09-14 08:17:51','2025-09-14 08:17:51','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68c67a2fa2973\",\"order_id\":\"SP10P7T1757837869Rdeb47f\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP10P7T1757837869Rdeb47f\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-14T08:17:51.666250Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP10P7T1757837869Rdeb47f','monthly-s'),(18,7,7,49,3,3,NULL,'2025-09-14 10:37:57','2025-09-14 10:37:57','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68c69b052dc2e\",\"order_id\":\"SP10P7T1757846275R816666\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP10P7T1757846275R816666\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-14T10:37:57.187898Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP10P7T1757846275R816666','monthly-s'),(19,7,7,49,3,3,NULL,'2025-09-14 14:25:00','2025-09-14 14:25:00','{\"payment_method\":\"vietqr\",\"transaction_id\":\"TEST_68c6d03c2dd90\",\"order_id\":\"SP10P7T1757859898R44ff2f\",\"amount_vnd\":1287230,\"amount_usd\":49,\"content\":\"ScorpiX Monthly-S SP10P7T1757859898R44ff2f\",\"bank_info\":{\"bankCode\":\"970423\",\"bankAccount\":\"01580400001\",\"accountName\":\"Cap la yeu thuong\"},\"payment_date\":\"2025-09-14T14:25:00.188168Z\",\"product_info\":{\"id\":7,\"name\":\"Monthly-S\",\"description\":null,\"token_qty\":500,\"type\":\"Monthly\"}}',500,'SP10P7T1757859898R44ff2f','monthly-s');
/*!40000 ALTER TABLE `subscriber_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`),
  KEY `subscription_items_subscription_id_stripe_price_index` (`subscription_id`,`stripe_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2025-09-20  3:40:15
