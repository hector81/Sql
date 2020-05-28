--
-- TABLA DEPARTAMENTOS
--

CREATE TABLE departamentos (
 dept_no  TINYINT NOT NULL,
 dnombre  VARCHAR(15), 
 loc      VARCHAR(15)
);

INSERT INTO departamentos VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO departamentos VALUES (20,'INVESTIGACIÓN','MADRID');
INSERT INTO departamentos VALUES (30,'VENTAS','BARCELONA');
INSERT INTO departamentos VALUES (40,'PRODUCCIÓN','BILBAO');

--
-- TABLA EMPLEADOS
--

CREATE TABLE empleados (
 emp_no    SMALLINT NOT NULL,
 apellido  VARCHAR(10),
 oficio    VARCHAR(10),
 dir       SMALLINT,
 fecha_alt DATE      ,
 salario   FLOAT,
 comision  FLOAT,
 dept_no   TINYINT NOT NULL
);

INSERT INTO empleados VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);
INSERT INTO empleados VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO empleados VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO empleados VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO empleados VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO empleados VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO empleados VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                        2885,NULL,10);
INSERT INTO empleados VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO empleados VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO empleados VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO empleados VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO empleados VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO empleados VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO empleados VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);



-- ---------------------------------------------------
--  TABLAS PERSONAL, PROFESORES, CENTROS  -----------
-- ---------------------------------------------------


-- TABLA PERSONAL 

CREATE TABLE personal (
 cod_centro   SMALLINT NOT NULL,
 dni          INT,
 apellidos    VARCHAR(30),
 funcion      VARCHAR(15),
 salario      FLOAT 
);

INSERT INTO personal VALUES (10,4123005, 'Gómez Bueno, Elisa', 'LIMPIADORA', 1200.00);
INSERT INTO personal VALUES (10,4122025, 'García García, Sabina', 'LIMPIADORA', 1200.00);
INSERT INTO personal VALUES (10,4480099, 'Ruano Cerezo, Manuel','ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (15,1002345, 'Albarrán Serrano, Alicia', 'ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (15,7002660, 'Muñoz Rey, Felicia', 'ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (22,5502678, 'Marín Marín, Pedro', 'ADMINISTRATIVO', 1800.00);
INSERT INTO personal VALUES (22,6600980, 'Peinado Gil, Elena','CONSERJE', 1750.00);
INSERT INTO personal VALUES (45,4163222, 'Sarro Molina, Carmen','CONSERJE', 1750.00);
INSERT INTO personal VALUES (22,1112345, 'Flores Pérez, Fernando','CONSERJE', 1300.00);


-- TABLA PROFESORES

CREATE TABLE profesores (
 cod_centro   SMALLINT NOT NULL,
 dni          INT,
 apellidos    VARCHAR(30),
 especialidad VARCHAR(16) 
) ;


INSERT INTO profesores VALUES (10,1112345,'Martínez Salas, Fernando',  'INFORMÁTICA');
INSERT INTO profesores VALUES (10,4123005,'Bueno Zarco, Elisa', 'MATEMÁTICAS');
INSERT INTO profesores VALUES (10,4122025,'Montes García, M.Pilar', 'MATEMÁTICAS');
INSERT INTO profesores VALUES (15,9800990, 'Ramos Ruiz, Luis', 	'LENGUA');
INSERT INTO profesores VALUES (15,1112345,'Rivera Silvestre, Ana', 'DIBUJO');
INSERT INTO profesores VALUES (15,8660990, 'De Lucas Fdez, M.Angel',  'LENGUA');
INSERT INTO profesores VALUES (22,7650000, 'Ruiz Lafuente, Manuel',  'MATEMÁTICAS');
INSERT INTO profesores VALUES (45,43526789, 'Serrano Laguía, María','INFORMÁTICA');

-- TABLA CENTROS

CREATE TABLE centros (
 cod_centro   SMALLINT NOT NULL,
 tipo_centro  CHAR(1),
 nombre       VARCHAR(30),
 direccion    VARCHAR(26),
 telefono     VARCHAR(10),
 num_plazas   SMALLINT 
 ) ;


INSERT INTO centros VALUES (10,'S','IES El Quijote','Avda. Los Molinos 25', '965-887654',538);
INSERT INTO centros VALUES (15,'P','CP Los Danzantes', 'C/Las Musas s/n','985-112322',250);
INSERT INTO centros VALUES (22,'S', 'IES Planeta Tierra', 'C/Mina 45','925-443400',300);
INSERT INTO centros VALUES (45,'P', 'CP Manuel Hidalgo', 'C/Granada 5','926-202310',220);
INSERT INTO centros VALUES (50,'S', 'IES Antoñete 1', 'C/Los Toreros 21','989-406090',310);
INSERT INTO centros VALUES (60,'P', 'CP Antoñete 2', 'C/Los Toreros 22','989-406092',300);



-- ******** FIN ***********************

