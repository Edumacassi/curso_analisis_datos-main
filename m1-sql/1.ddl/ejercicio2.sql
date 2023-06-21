-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_employees
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_employees` ;

-- -----------------------------------------------------
-- Schema db_employees
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_employees` DEFAULT CHARACTER SET utf8 ;
USE `db_employees` ;

-- -----------------------------------------------------
-- Table `db_employees`.`companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_employees`.`companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cif` VARCHAR(10) NULL,
  `foundation_year` YEAR NULL,
  `address` VARCHAR(200) NULL,
  `phone` VARCHAR(9) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `cif_UNIQUE` ON `db_employees`.`companies` (`cif` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_employees`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_employees`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nif` VARCHAR(9) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `available` BIT(1) NULL,
  `job_role` VARCHAR(45) NULL,
  `job_level` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `company_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_employees_companies`
    FOREIGN KEY (`company_id`)
    REFERENCES `db_employees`.`companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `nif_UNIQUE` ON `db_employees`.`employees` (`nif` ASC) VISIBLE;

CREATE INDEX `fk_employees_companies_idx` ON `db_employees`.`employees` (`company_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `db_employees`.`companies`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_employees`;
INSERT INTO `db_employees`.`companies` (`id`, `cif`, `foundation_year`, `address`, `phone`) VALUES (DEFAULT, 'B55776698', 1990, 'Calle falsa 123', '666555443');
INSERT INTO `db_employees`.`companies` (`id`, `cif`, `foundation_year`, `address`, `phone`) VALUES (DEFAULT, 'B33322112', 2020, 'Calle verdadera 2', '665432133');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_employees`.`employees`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_employees`;
INSERT INTO `db_employees`.`employees` (`id`, `nif`, `first_name`, `available`, `job_role`, `job_level`, `last_name`, `company_id`) VALUES (DEFAULT, '4321234T', 'Paco', 1, 'Developer', 'Senior', 'García', 1);
INSERT INTO `db_employees`.`employees` (`id`, `nif`, `first_name`, `available`, `job_role`, `job_level`, `last_name`, `company_id`) VALUES (DEFAULT, '3434354Y', 'Fran', 0, 'Marketer', 'Junior', 'Ambrosio', 1);
INSERT INTO `db_employees`.`employees` (`id`, `nif`, `first_name`, `available`, `job_role`, `job_level`, `last_name`, `company_id`) VALUES (DEFAULT, '4543543T', 'Alan', 1, 'Developer', 'Senior', 'García', 2);

COMMIT;

