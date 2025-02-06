-- MySQL Script generated by MySQL Workbench
-- qui 06 fev 2025 02:02:11
-- Model: New Model    Version: 1.0
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET cp866 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(90) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `excluido` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` LONGTEXT NOT NULL,
  `local` VARCHAR(90) NULL,
  `data` DATE NULL,
  `hora` TIME NULL,
  `idCriador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_evento_1_idx` (`idCriador` ASC) VISIBLE,
  CONSTRAINT `fk_evento_1`
    FOREIGN KEY (`idCriador`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`evento_categoria` (
  `idEvento` INT NOT NULL,
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`idEvento`, `idCategoria`),
  INDEX `fk_evento_categoria_2_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_evento_categoria_1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `mydb`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_categoria_2`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `mydb`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`evento_tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`evento_tag` (
  `idEvento` INT NOT NULL,
  `idTag` INT NOT NULL,
  PRIMARY KEY (`idEvento`, `idTag`),
  INDEX `fk_evento_tag_2_idx` (`idTag` ASC) VISIBLE,
  CONSTRAINT `fk_evento_tag_1`
    FOREIGN KEY (`idEvento`)
    REFERENCES `mydb`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_tag_2`
    FOREIGN KEY (`idTag`)
    REFERENCES `mydb`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`favorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`favorito` (
  `idUsuario` INT NOT NULL,
  `idEvento` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `idEvento`),
  INDEX `fk_favorito_2_idx` (`idEvento` ASC) VISIBLE,
  CONSTRAINT `fk_favorito_1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorito_2`
    FOREIGN KEY (`idEvento`)
    REFERENCES `mydb`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
