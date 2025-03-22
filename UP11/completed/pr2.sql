-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table2` (
)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`author` (
  `author_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `country` VARCHAR(30) NOT NULL DEFAULT 'Россия',
  PRIMARY KEY (`author_id`),
  UNIQUE INDEX `surname_name_author_UNIQUE` (`surname` ASC, `name` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book` (
  `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `genre` ENUM('проза', 'поэзия', 'другое') NOT NULL DEFAULT 'проза',
  `price` DECIMAL(6,2) NOT NULL DEFAULT 0,
  `weight` DECIMAL(4,3) NOT NULL DEFAULT 0,
  `pages` SMALLINT NOT NULL DEFAULT 0,
  `issue_year` YEAR NULL,
  `author_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_book_author_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_author`
    FOREIGN KEY (`author_id`)
    REFERENCES `mydb`.`author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `telephone` VARCHAR(20) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `surname_name_customer_UNIQUE` (`surname` ASC, `name` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_time_order` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mydb`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`compound`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compound` (
  `book_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  `quantity` TINYTEXT NOT NULL DEFAULT '1',
  PRIMARY KEY (`book_id`, `order_id`),
  INDEX `fk_book_has_order_order1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_book_has_order_book1_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_has_order_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_has_order_order1`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
	CONSTRAINT `quantity` CHECK(`quantity` > 0 AND `quantity` <= 100)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
