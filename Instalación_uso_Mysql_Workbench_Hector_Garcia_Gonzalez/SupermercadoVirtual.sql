SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `SuperMercadoVirtual` ;
CREATE SCHEMA IF NOT EXISTS `SuperMercadoVirtual` DEFAULT CHARACTER SET utf8 ;
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `SuperMercadoVirtual` ;

-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Categoria_Productos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Categoria_Productos` (
  `Condiciones_Almacenamiento` VARCHAR(45) NULL DEFAULT NULL ,
  `Observaciones` VARCHAR(45) NULL DEFAULT NULL ,
  `NombreCategoria` VARCHAR(45) NULL DEFAULT NULL ,
  `ID_Categoria` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ID_Categoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Productos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Productos` (
  `ID_Productos` INT NOT NULL ,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `Marca` VARCHAR(45) NULL DEFAULT NULL ,
  `Origen` VARCHAR(45) NULL DEFAULT NULL ,
  `Dimensiones` VARCHAR(45) NULL DEFAULT NULL ,
  `Fotografia` VARCHAR(45) NULL DEFAULT NULL ,
  `NombreCategoria_FK` VARCHAR(45) NOT NULL ,
  `Unidades` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`ID_Productos`) ,
  CONSTRAINT `Nombre_Categoria`
    FOREIGN KEY (`NombreCategoria_FK` )
    REFERENCES `SuperMercadoVirtual`.`Categoria_Productos` (`ID_Categoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `Nombre_Categoria_idx` ON `SuperMercadoVirtual`.`Productos` (`NombreCategoria_FK` ASC) ;


-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Repartidor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Repartidor` (
  `Codigo_Repartidor` INT NOT NULL ,
  `Numero_repartidor` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`Codigo_Repartidor`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Linea_Pedido`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Linea_Pedido` (
  `Numero_linea` INT NOT NULL ,
  `Descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  `Cantidad` INT NOT NULL ,
  PRIMARY KEY (`Numero_linea`) )
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Cantidad_UNIQUE` ON `SuperMercadoVirtual`.`Linea_Pedido` (`Cantidad` ASC) ;


-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Clientes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Clientes` (
  `DNI` INT NOT NULL ,
  `Nombre` CHAR(30) NOT NULL ,
  `Dirección` VARCHAR(45) NOT NULL ,
  `Código_Postal` INT NOT NULL ,
  `Telefono` VARCHAR(45) NULL DEFAULT NULL ,
  `Email` VARCHAR(45) NULL DEFAULT NULL ,
  `Dirección` VARCHAR(45) NULL DEFAULT NULL ,
  `ID_Cliente` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`DNI`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Pedido`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Pedido` (
  `Codigo_Pedido` INT ZEROFILL NOT NULL ,
  `FechaPedido` VARCHAR(45) NULL DEFAULT NULL ,
  `ID_Cliente_FK` VARCHAR(45) NOT NULL ,
  `DireccionEntrega` VARCHAR(45) NULL DEFAULT NULL ,
  `ID_Productos_FK` VARCHAR(45) NOT NULL ,
  `ImportePago` INT NULL DEFAULT NULL ,
  `DatosPedidos` VARCHAR(45) NULL DEFAULT NULL ,
  `Numero_Repartidor_FK` INT NOT NULL ,
  `Numero_Linea` INT NOT NULL ,
  PRIMARY KEY (`Codigo_Pedido`) ,
  CONSTRAINT `ID_Cliente_FK`
    FOREIGN KEY (`ID_Cliente_FK` )
    REFERENCES `SuperMercadoVirtual`.`Clientes` (`ID_Cliente` )
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `ID_Productos_FK`
    FOREIGN KEY (`ID_Productos_FK` )
    REFERENCES `SuperMercadoVirtual`.`Productos` (`NombreCategoria_FK` )
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `Numero_repartidor_FK`
    FOREIGN KEY (`Codigo_Pedido` , `Numero_Repartidor_FK` )
    REFERENCES `SuperMercadoVirtual`.`Repartidor` (`Codigo_Repartidor` , `Codigo_Repartidor` )
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `Numero_Linea_FK`
    FOREIGN KEY (`Numero_Linea` )
    REFERENCES `SuperMercadoVirtual`.`Linea_Pedido` (`Numero_linea` )
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Numero_Linea_UNIQUE` ON `SuperMercadoVirtual`.`Pedido` (`Numero_Linea` ASC) ;

CREATE UNIQUE INDEX `Numero_Repartidor_UNIQUE` ON `SuperMercadoVirtual`.`Pedido` (`Numero_Repartidor_FK` ASC) ;

CREATE UNIQUE INDEX `ID_Productos_UNIQUE` ON `SuperMercadoVirtual`.`Pedido` (`ID_Productos_FK` ASC) ;

CREATE UNIQUE INDEX `ID_Cliente_UNIQUE` ON `SuperMercadoVirtual`.`Pedido` (`ID_Cliente_FK` ASC) ;

CREATE INDEX `Numero_repartidor_FK_idx` ON `SuperMercadoVirtual`.`Pedido` (`Codigo_Pedido` ASC, `Numero_Repartidor_FK` ASC) ;


-- -----------------------------------------------------
-- Table `SuperMercadoVirtual`.`Zona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `SuperMercadoVirtual`.`Zona` (
  `Id_Cliente_FK` INT NOT NULL ,
  `Nombre` VARCHAR(45) NOT NULL ,
  `Codigo_Postal` INT NULL DEFAULT NULL ,
  `Numero_repartidor_FK` INT NOT NULL ,
  PRIMARY KEY (`Nombre`) ,
  CONSTRAINT `ID_Cliente_FK`
    FOREIGN KEY (`Id_Cliente_FK` )
    REFERENCES `SuperMercadoVirtual`.`Clientes` (`DNI` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Numero_repartidor_FK`
    FOREIGN KEY (`Numero_repartidor_FK` )
    REFERENCES `SuperMercadoVirtual`.`Repartidor` (`Codigo_Repartidor` )
    ON DELETE CASCADE
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `ID_Cliente_FK` ON `SuperMercadoVirtual`.`Zona` (`Numero_repartidor_FK` ASC) ;

USE `mydb` ;
USE `SuperMercadoVirtual` ;
USE `mydb` ;

-- -----------------------------------------------------
-- procedure routine1
-- -----------------------------------------------------

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE `mydb`.`routine1` ()
BEGIN

END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
