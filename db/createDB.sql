SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8 ;
USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`customers` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  `surname` VARCHAR(15) NOT NULL,
  `middlename` VARCHAR(15) NOT NULL,
  `number_card` VARCHAR(20) NOT NULL,
  `type_card` VARCHAR(15) NOT NULL,
  `bonus_card` INT(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotel`.`type_room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`type_room` (
  `id` INT(15) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotel`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`rooms` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(20) NOT NULL,
  `type_room_id` INT(11) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  INDEX `FK_rooms_type_room` (`type_room_id` ASC),
  CONSTRAINT `FK_rooms_type_room`
    FOREIGN KEY (`type_room_id`)
    REFERENCES `hotel`.`type_room` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotel`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`orders` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(15) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `middlename` VARCHAR(15) NOT NULL,
  `date_arrival` DATE NOT NULL,
  `date_departure` DATE NOT NULL,
  `date_order` DATE NOT NULL,
  `customer_id` INT(10) NULL DEFAULT NULL,
  `id_room` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_orders_customers` (`customer_id` ASC),
  INDEX `FK_orders_rooms` (`id_room` ASC),
  CONSTRAINT `FK_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `hotel`.`customers` (`id`),
  CONSTRAINT `FK_orders_rooms`
    FOREIGN KEY (`id_room`)
    REFERENCES `hotel`.`rooms` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotel`.`service_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`service_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `price` INT(11) NULL DEFAULT NULL,
  `type_count` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hotel`.`orders_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`orders_service` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_orders` INT(11) NOT NULL DEFAULT '0',
  `id_service` INT(11) NOT NULL DEFAULT '0',
  `price_service` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  `count` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `FK_orders_service_orders` (`id_orders` ASC),
  INDEX `FK_orders_service_service_type` (`id_service` ASC),
  CONSTRAINT `FK_orders_service_service_type`
    FOREIGN KEY (`id_service`)
    REFERENCES `hotel`.`service_type` (`id`),
  CONSTRAINT `FK_orders_service_orders`
    FOREIGN KEY (`id_orders`)
    REFERENCES `hotel`.`orders` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
