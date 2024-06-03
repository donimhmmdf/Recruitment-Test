/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - siperpus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`siperpus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `siperpus`;

/*Table structure for table `book_category` */

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_category_book_id_foreign` (`book_id`),
  KEY `book_category_category_id_foreign` (`category_id`),
  CONSTRAINT `book_category_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `book_category` */

insert  into `book_category`(`id`,`book_id`,`category_id`,`created_at`,`updated_at`) values 
(1,1,1,NULL,NULL),
(2,8,1,NULL,NULL),
(3,9,1,NULL,NULL),
(4,10,1,NULL,NULL),
(5,4,4,NULL,NULL),
(6,3,3,NULL,NULL),
(7,5,5,NULL,NULL),
(8,6,5,NULL,NULL),
(9,7,5,NULL,NULL),
(10,2,2,NULL,NULL);

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'in stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `books` */

insert  into `books`(`id`,`book_code`,`title`,`author`,`publisher`,`isbn`,`year`,`stock`,`status`,`created_at`,`updated_at`) values 
(1,'C-001','Comic 1','Author Comic 1','Publisher Comic 1','Isbn Comic 1','2001','2','in stock',NULL,NULL),
(2,'N-001','Novel 1','Author Novel 1','Publisher Novel 1','Isbn Novel 1','2023','10','in stock',NULL,NULL),
(3,'FN-001','Fantasy 01','Author Fantasy 01','Publisher Fantasy 01','Isbn Fantasy 01','2015','10','in stock',NULL,NULL),
(4,'FI-001','Fiction 01','Author Fiction 01','Publisher Fiction 01','Isbn Fiction 01','2014','20','in stock',NULL,NULL),
(5,'M-001','Mystery 01','Author Mystery 01','Publisher Mystery 01','Isbn Mystery 01','2023','15','in stock',NULL,NULL),
(6,'M-002','Mystery 02','Author Mystery 02','Publisher Mystery 02','Isbn Mystery 02','2021','40','in stock',NULL,NULL),
(7,'M-003','Mystery 03','Author Mystery 03','Publisher Mystery 03','Isbn Mystery 03','2021','20','in stock',NULL,NULL),
(8,'C-002','Comic 2','Author Comic 2','Publisher Comic 2','Isbn Comic 2','2023','30','in stock',NULL,NULL),
(9,'C-003','Comic 3','Author Comic 3','Publisher Comic 3','Isbn Comic 3','2020','15','in stock',NULL,NULL),
(10,'C-004','Comic 4','Author Comic 4','Publisher Comic 4','Isbn Comic 4','2017','15','in stock',NULL,NULL);

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'Comic',NULL,NULL),
(2,'Novel',NULL,NULL),
(3,'Fantasy',NULL,NULL),
(4,'Fiction',NULL,NULL),
(5,'Mystery',NULL,NULL);

/*Table structure for table `rent_logs` */

DROP TABLE IF EXISTS `rent_logs`;

CREATE TABLE `rent_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `rent_date` date NOT NULL,
  `return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rent_logs_book_id_foreign` (`book_id`),
  KEY `rent_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `rent_logs_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `rent_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rent_logs` */

insert  into `rent_logs`(`id`,`book_id`,`user_id`,`rent_date`,`return_date`,`actual_return_date`,`created_at`,`updated_at`) values 
(1,1,2,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(2,8,2,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(3,9,2,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(4,7,3,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(5,4,3,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(6,3,3,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(7,5,6,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(8,6,6,'2024-06-01','2024-06-02','2024-06-02',NULL,NULL),
(9,2,6,'2024-06-01','2024-06-02','2024-06-07',NULL,NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'admin',NULL,NULL),
(2,'client',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`name`,`address`,`no_ktp`,`phone`,`email`,`status`,`created_at`,`updated_at`,`role_id`) values 
(1,'admin','$2y$10$y.NTroZwJESlhNDQAdIjuezCKWMgxsCVWaABV3fPJMhaqgWvDVmvu','admin','Siperpus','3577024383910003','02124234','admin@gmail.com','active',NULL,NULL,1),
(2,'user1','$2y$10$y.NTroZwJESlhNDQAdIjuezCKWMgxsCVWaABV3fPJMhaqgWvDVmvu','Jhon Doe','Jl. Maju','3576014506910001','628583791898','jhon_doe@gmail.com','inactive',NULL,NULL,2),
(3,'user2','$2y$10$y.NTroZwJESlhNDQAdIjuezCKWMgxsCVWaABV3fPJMhaqgWvDVmvu','Sandi Malik','Jl. Kiri','3536012404910006','628709910039','sandi_amalik@gmail.com','active',NULL,NULL,2),
(6,'user3','$2y$10$y.NTroZwJESlhNDQAdIjuezCKWMgxsCVWaABV3fPJMhaqgWvDVmvu','Fredi Sandi','Jl. Mundur','3576014403910003','628667665553','fredi@gmai.com','inactive',NULL,NULL,2),
(7,'user4','$2y$10$y.NTroZwJESlhNDQAdIjuezCKWMgxsCVWaABV3fPJMhaqgWvDVmvu','Yandika','Jl. Mundur','3576014403910005','628953564690','dika@gmail.com','inactive',NULL,NULL,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
