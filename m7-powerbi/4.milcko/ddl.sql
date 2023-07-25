/*
SQLyog Ultimate
MySQL - 8.0.20 : Database - milkco
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS; 
SET FOREIGN_KEY_CHECKS=0;  

/*Table structure for table `Branches` */

DROP TABLE IF EXISTS `Branches`;

CREATE TABLE `Branches` (
  `idBranch` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `monthlyCost` decimal(10,2) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `idCity` int DEFAULT NULL,
  `idManager` int DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBranch`),
  KEY `Branches_fk1_idx` (`idCity`),
  KEY `Branches_fk3_idx` (`idManager`),
  CONSTRAINT `Branches_fk1` FOREIGN KEY (`idCity`) REFERENCES `Cities` (`idCity`),
  CONSTRAINT `Branches_fk3` FOREIGN KEY (`idManager`) REFERENCES `Employees` (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Brands` */

DROP TABLE IF EXISTS `Brands`;

CREATE TABLE `Brands` (
  `idBrand` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Cities` */

DROP TABLE IF EXISTS `Cities`;

CREATE TABLE `Cities` (
  `idCity` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `idCountry` int NOT NULL,
  `population` int DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCity`),
  KEY `idx_fk_idCountry` (`idCountry`),
  CONSTRAINT `Cities_fk1` FOREIGN KEY (`idCountry`) REFERENCES `Countries` (`idCountry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Containers` */

DROP TABLE IF EXISTS `Containers`;

CREATE TABLE `Containers` (
  `idContainer` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `sizeOunce` decimal(10,2) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idContainer`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Countries` */

DROP TABLE IF EXISTS `Countries`;

CREATE TABLE `Countries` (
  `idCountry` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCountry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Customers` */

DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
  `idCustomer` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `idCity` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `isBusiness` tinyint DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `Customers_fk1_idx` (`idCity`),
  CONSTRAINT `Customers_fk1` FOREIGN KEY (`idCity`) REFERENCES `Cities` (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=27579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Employees` */

DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees` (
  `idEmployee` int NOT NULL AUTO_INCREMENT,
  `fullName` varchar(200) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `idBranch` int DEFAULT NULL,
  `idRole` int DEFAULT NULL,
  `enabled` tinyint DEFAULT '1',
  `idCity` int DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEmployee`),
  KEY `Employees_fk1_idx` (`idBranch`),
  KEY `Employees_fk2_idx` (`idRole`),
  KEY `Employees_fk3_idx` (`idCity`),
  CONSTRAINT `Employees_fk1` FOREIGN KEY (`idBranch`) REFERENCES `Branches` (`idBranch`),
  CONSTRAINT `Employees_fk2` FOREIGN KEY (`idRole`) REFERENCES `Roles` (`idRole`),
  CONSTRAINT `Employees_fk3` FOREIGN KEY (`idCity`) REFERENCES `Cities` (`idCity`)
) ENGINE=InnoDB AUTO_INCREMENT=7014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `InvoiceDetails` */

DROP TABLE IF EXISTS `InvoiceDetails`;

CREATE TABLE `InvoiceDetails` (
  `idInvoiceDetail` int NOT NULL AUTO_INCREMENT,
  `idInvoice` int DEFAULT NULL,
  `sku` int DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `refCode` varchar(50) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idInvoiceDetail`),
  KEY `InvoiceDetails_fk1_idx` (`sku`),
  KEY `InvoiceDetails_fk2_idx` (`idInvoice`),
  CONSTRAINT `InvoiceDetails_fk1` FOREIGN KEY (`sku`) REFERENCES `Skus` (`sku`),
  CONSTRAINT `InvoiceDetails_fk2` FOREIGN KEY (`idInvoice`) REFERENCES `Invoices` (`idInvoice`)
) ENGINE=InnoDB AUTO_INCREMENT=317840 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Invoices` */

DROP TABLE IF EXISTS `Invoices`;

CREATE TABLE `Invoices` (
  `idInvoice` int NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `idCustomer` int DEFAULT NULL,
  `idSeller` int DEFAULT NULL,
  `lastDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idInvoice`),
  KEY `Invoices_fk1_idx` (`idCustomer`),
  KEY `Invoices_fk2_idx` (`idSeller`),
  CONSTRAINT `Invoices_fk1` FOREIGN KEY (`idCustomer`) REFERENCES `Customers` (`idCustomer`),
  CONSTRAINT `Invoices_fk2` FOREIGN KEY (`idSeller`) REFERENCES `Employees` (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=187244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `ProductSubTypes` */

DROP TABLE IF EXISTS `ProductSubTypes`;

CREATE TABLE `ProductSubTypes` (
  `idProductSubType` int NOT NULL AUTO_INCREMENT,
  `idProductType` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unitName` varchar(45) DEFAULT NULL,
  `ProductTypes_idProductType` int NOT NULL,
  PRIMARY KEY (`idProductSubType`),
  KEY `fk_ProductSubTypes_ProductTypes1_idx` (`ProductTypes_idProductType`),
  CONSTRAINT `fk_ProductSubTypes_ProductTypes1` FOREIGN KEY (`ProductTypes_idProductType`) REFERENCES `ProductTypes` (`idProductType`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `ProductTypes` */

DROP TABLE IF EXISTS `ProductTypes`;

CREATE TABLE `ProductTypes` (
  `idProductType` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProductType`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Roles` */

DROP TABLE IF EXISTS `Roles`;

CREATE TABLE `Roles` (
  `idRole` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `monthlySalary` decimal(10,2) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Services` */

DROP TABLE IF EXISTS `Services`;

CREATE TABLE `Services` (
  `idService` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*Table structure for table `Skus` */

DROP TABLE IF EXISTS `Skus`;

CREATE TABLE `Skus` (
  `sku` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `minStock` int DEFAULT NULL,
  `isService` tinyint DEFAULT '0',
  `idProductSubType` int DEFAULT NULL,
  `idContainer` int DEFAULT NULL,
  `idBrand` int DEFAULT NULL,
  `idService` int DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `margin` decimal(10,2) DEFAULT '10.00',
  `lastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sku`),
  KEY `Skus_fk1_idx` (`idProductSubType`),
  KEY `Skus_fk2_idx` (`idContainer`),
  KEY `Skus_fk3_idx` (`idBrand`),
  KEY `Skus_fk4_idx` (`idService`),
  CONSTRAINT `Skus_fk1` FOREIGN KEY (`idProductSubType`) REFERENCES `ProductSubTypes` (`idProductSubType`),
  CONSTRAINT `Skus_fk2` FOREIGN KEY (`idContainer`) REFERENCES `Containers` (`idContainer`),
  CONSTRAINT `Skus_fk3` FOREIGN KEY (`idBrand`) REFERENCES `Brands` (`idBrand`),
  CONSTRAINT `Skus_fk4` FOREIGN KEY (`idService`) REFERENCES `Services` (`idService`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MIT License https://github.com/EFTEC/MilkCo-Database';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;