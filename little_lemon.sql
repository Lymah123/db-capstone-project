-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Littlelemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Littlelemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Littlelemon` DEFAULT CHARACTER SET utf8 ;
USE `Littlelemon` ;

-- -----------------------------------------------------
-- Table `Littlelemon`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`Customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `TableNo` INT NOT NULL,
  `CustomerID` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Littlelemon`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`Menus` (
  `MenusID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `cutomer_id_fk_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `cutomer_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Littlelemon`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menus_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Littlelemon`.`Menus` (`MenusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`Roles` (
  `RoleID` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`Staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Salary` INT NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `roles_id_fk_idx` (`RoleID` ASC) VISIBLE,
  CONSTRAINT `roles_id_fk`
    FOREIGN KEY (`RoleID`)
    REFERENCES `Littlelemon`.`Roles` (`RoleID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`ContactDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`ContactDetails` (
  `ContactID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Littlelemon`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Littlelemon`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`OrderDeliveryStatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Status` VARCHAR(45) NULL,
  `OrderID` INT NULL,
  `StaffID` INT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `order_id_fk_idx` (`OrderID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Littlelemon`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Littlelemon`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`MenusItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`MenusItem` (
  `MenuItemID` INT NOT NULL AUTO_INCREMENT,
  `Course` VARCHAR(45) NOT NULL,
  `Starter` VARCHAR(45) NOT NULL,
  `Dessert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon`.`MenuContents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon`.`MenuContents` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuItemID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menucontent_id_fk_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `menucontent_id_fk`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `Littlelemon`.`MenusItem` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menuconten_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Littlelemon`.`Menus` (`MenusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
