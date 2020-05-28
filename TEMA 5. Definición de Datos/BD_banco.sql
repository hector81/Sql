CREATE DATABASE banco;
Use banco;
CREATE TABLE cliente (
	codigo_ciente integer NOT NULL UNIQUE,
	dni integer NOT NULL PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	apellido1 varchar(20) NOT NULL,
	apellido2 varchar(20),
	direccion varchar(50),
	CONSTRAINT uc_codigo_ciente UNIQUE (codigo_ciente)
	);
INSERT INTO Cliente VALUES (1,117,'Alberto','Hernandez',NULL,NULL);
INSERT INTO Cliente VALUES (111,262,'ddd','dd','dd','dd');

CREATE TABLE cuenta (
	tipo varchar(1),
	fecha_creacion date,
	saldo integer,
	cod_cuenta integer PRIMARY KEY,
	CONSTRAINT uc_cod_cuenta UNIQUE (cod_cuenta)
	);
INSERT INTO cuenta	VALUES (1,'2010-01-11',2333,0);
INSERT INTO cuenta	VALUES (1,'2010-01-11',4000,1);
INSERT INTO cuenta	VALUES (1,'2010-01-11',6000,2);
INSERT INTO cuenta	VALUES (1,'2010-01-11',10700,3);
INSERT INTO cuenta	VALUES (1,'2010-11-03',11700,4);
INSERT INTO cuenta	VALUES (1,'2010-11-03',13000,5);
INSERT INTO cuenta	VALUES (1,'2010-11-03',13200,6);
INSERT INTO cuenta	VALUES (1,'2010-11-03',13000,7);

CREATE TABLE movimiento (
	fecha datetime,
	cantidad decimal(4,0),
	dni integer,
	cod_cuenta integer,
	id_movimiento integer PRIMARY KEY,
	CONSTRAINT uc_mov_cuenta UNIQUE(fecha,dni,cod_cuenta),
	CONSTRAINT fk_dni_mov FOREIGN KEY (dni) REFERENCES Cliente (dni) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_cod_cue_mov FOREIGN KEY (cod_cuenta) REFERENCES cuenta (cod_cuenta) ON UPDATE CASCADE ON DELETE CASCADE,
	);
INSERT INTO movimiento VALUES ('2012-05-08 00:00:00.000',100,117,5,0);
INSERT INTO movimiento VALUES ('2012-05-08 00:00:00.000',320,117,6,1);
INSERT INTO movimiento VALUES ('2012-05-08 00:00:00.000',100,117,3,3);
INSERT INTO movimiento VALUES ('2012-05-08 00:00:00.000',100,117,2,4);
INSERT INTO movimiento VALUES ('2012-05-08 00:00:00.000',100,117,1,5);
INSERT INTO movimiento VALUES ('2012-05-03 00:00:00.000',200,117,4,6);

CREATE TABLE tiene (
	dni integer,
	cod_cuenta integer,
	CONSTRAINT fk_dni_tie FOREIGN KEY (dni) REFERENCES Cliente (dni),
	CONSTRAINT fk_cod_cue_tie FOREIGN KEY (cod_cuenta) REFERENCES cuenta (cod_cuenta)
	);
INSERT INTO tiene VALUES (117,1);
INSERT INTO tiene VALUES (117,2);
INSERT INTO tiene VALUES (117,3);
INSERT INTO tiene VALUES (117,4);
INSERT INTO tiene VALUES (117,5);
INSERT INTO tiene VALUES (117,6);
INSERT INTO tiene VALUES (262,0);
INSERT INTO tiene VALUES (262,7);