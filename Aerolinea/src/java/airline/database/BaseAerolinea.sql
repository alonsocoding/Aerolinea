-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BaseAerolinea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BaseAerolinea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BaseAerolinea` DEFAULT CHARACTER SET utf8 ;
USE `BaseAerolinea` ;

-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Usuario` (
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `direccion` TinyText NOT NULL,
  `telefono` INT NOT NULL,
  `celular` INT NOT NULL,
  `tipo` INT NOT NULL,
  PRIMARY KEY (`nombreUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Ciudad` (
  `codigo` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Vuelo` (
  `numeroVuelo` INT NOT NULL AUTO_INCREMENT,
  `ciudadOrigen` VARCHAR(45) NOT NULL,
  `ciudadDestino` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `precio` INT NOT NULL,
  `duracion` INT NOT NULL,
  `hora` INT NOT NULL,
  `oferta` TINYINT(1) NOT NULL,
  `imagen` TEXT NULL,
  `dia` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`numeroVuelo`),
  INDEX `ciudadOrigen_idx` (`ciudadOrigen` ASC),
  INDEX `ciudadDestino_idx` (`ciudadDestino` ASC),
  CONSTRAINT `ciudadOrigen`
    FOREIGN KEY (`ciudadOrigen`)
    REFERENCES `BaseAerolinea`.`Ciudad` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ciudadDestino`
    FOREIGN KEY (`ciudadDestino`)
    REFERENCES `BaseAerolinea`.`Ciudad` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Avion` (
  `placa` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `annio` VARCHAR(45) NOT NULL,
  `cant_pasajeros` INT NOT NULL,
  `cant_filas` INT NOT NULL,
  `cant_asientos_por_fila` INT NOT NULL,
  PRIMARY KEY (`placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Viaje` (
  `numeroviaje` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `placa_avion` VARCHAR(45) NOT NULL,
  `numero_vuelo` INT NOT NULL,
  `horaLlegada` INT NOT NULL,
  PRIMARY KEY (`numeroviaje`),
  INDEX `placa_avion_idx` (`placa_avion` ASC),
  INDEX `numero_vuelo_idx` (`numero_vuelo` ASC),
  CONSTRAINT `placa_avion`
    FOREIGN KEY (`placa_avion`)
    REFERENCES `BaseAerolinea`.`Avion` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_vuelo`
    FOREIGN KEY (`numero_vuelo`)
    REFERENCES `BaseAerolinea`.`Vuelo` (`numeroVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Asiento` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `numero_viaje` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `numero_viaje_idx` (`numero_viaje` ASC),
  CONSTRAINT `numero_viaje`
    FOREIGN KEY (`numero_viaje`)
    REFERENCES `BaseAerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Tiquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Tiquete` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `cedula_pasajero` INT NOT NULL,
  `nombre_pasajero` VARCHAR(45) NOT NULL,
  `pasaporte` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `nombre_usuario_idx` (`nombre_usuario` ASC),
  CONSTRAINT `nombre_usuario`
    FOREIGN KEY (`nombre_usuario`)
    REFERENCES `BaseAerolinea`.`Usuario` (`nombreUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseAerolinea`.`Reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseAerolinea`.`Reservacion` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `numero_viaje1` INT NOT NULL,
  `numero_viaje2` INT NULL,
  `codigo_asiento` INT NOT NULL,
  `codigo_asiento2` INT NULL,
  `codigo_tiquete` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `numero_viaje1_idx` (`numero_viaje1` ASC),
  INDEX `numero_viaje2_idx` (`numero_viaje2` ASC),
  INDEX `codigo_asiento_idx` (`codigo_asiento` ASC),
  INDEX `codigo_tiquete_idx` (`codigo_tiquete` ASC),
  INDEX `codigo_asiento2_idx` (`codigo_asiento2` ASC),
  CONSTRAINT `numero_viaje1`
    FOREIGN KEY (`numero_viaje1`)
    REFERENCES `BaseAerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `numero_viaje2`
    FOREIGN KEY (`numero_viaje2`)
    REFERENCES `BaseAerolinea`.`Viaje` (`numeroviaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_asiento`
    FOREIGN KEY (`codigo_asiento`)
    REFERENCES `BaseAerolinea`.`Asiento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_tiquete`
    FOREIGN KEY (`codigo_tiquete`)
    REFERENCES `BaseAerolinea`.`Tiquete` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_asiento2`
    FOREIGN KEY (`codigo_asiento2`)
    REFERENCES `BaseAerolinea`.`Asiento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/*INSERT DE CIUDADES------------------------------*/
insert into ciudad values("SJO","Costa Rica","San Jose");
insert into ciudad values("MIA","USA","Miami");
insert into ciudad values("CAN","Mexico","Cancun");
insert into ciudad values("MAD","Espana","Madrid");
insert into ciudad values("VIE","Austria","Viena");
insert into ciudad values("ROM","Italia","Roma");

/*INSERT DE VUELOS--------------------------------*/
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("SJO","MIA", true, 300,230,0800,true,"NADA YET","Monday");
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("MIA","CAN", true, 200,120,0930,true,"NADA YET","Tuesday");
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("MAD","ROM", true, 500,800,1200,true,"NADA YET","Wednesday");
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("SJO","MAD", true, 450,1000,0420,true,"NADA YET","Saturday");
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("MIA","SJO", true, 200,220,1450,true,"NADA YET","Friday");
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("VIE","MAD", true, 100,600,1200,true,"NADA YET","Thurday");

insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("SJO","MIA", true, 200,120,820,false,"NADA YET","Wednesday");
insert into vuelo (ciudadOrigen, ciudadDestino,estado, precio, duracion,hora,oferta,imagen,dia)
values ("MIA","SJO", true, 500,300,1500,false,"NADA YET","Saturday");




/*INSERTS DE AVIONES-------------------------*/
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-BGV","Boeing","737-300","2002",144,24,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV506","Boeing","737-400","2001",168,28,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("N527VL","Boeing","737-500","2000",132,22,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-CRLA","Boeing","737-900","2008",186,31,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV123","Boeing","747-400","2010",315,35,9);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-BGV57","Boeing","767-300","2006",270,30,9);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("TI-BGV98","Airbus","318-100","2002",120,20,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV654","Airbus","319-200","2001",144,24,6);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NV888","Airbus","330-200","2004",270,30,9);
insert into Avion (placa, modelo, marca, annio, cant_pasajeros, cant_filas, cant_asientos_por_fila) 
values ("NVCR0314","Airbus","380-800","2012",450,50,9);
/*INSERTS DE VIAJES-------------------------*/

insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-05',"TI-BGV",1);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-07-07',"TI-CRLA",5);

insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-14',"TI-BGV",7,16);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-10',"NV123",8,13);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-12',"TI-BGV98",1,14);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-07-14',"NV888",5,21);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-21',"NV654",7,18);
insert into Viaje (fecha, placa_avion, numero_vuelo)
values('2017-06-17',"NV888",8,12);


insert into Usuario(nombreUsuario,contrasena,nombre,apellidos,correo,fechaNacimiento,
direccion,telefono,celular,tipo) values ("p001","123","andrey","chaverri","andrey5757@hotmail.com",'1996-11-14',
"alajuela",8888888,88888888,1);
insert into Usuario(nombreUsuario,contrasena,nombre,apellidos,correo,fechaNacimiento,
direccion,telefono,celular,tipo) values ("p002","000","andrey","chaverri","andrey5757@hotmail.com",'1996-11-14',
"alajuela",8888888,88888888,2);





