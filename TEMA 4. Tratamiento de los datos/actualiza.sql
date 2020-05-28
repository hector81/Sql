/* Práctica 5.1 
*  #1 Inserta una oficina con sede en Fuenlabrada 
*/
USE jardineria;
INSERT INTO Oficinas VALUES ('FUE-ES','Fuenlabrada','España','Madrid','28941','918837627','C/Las suertes, 27','Bajo A');

--#2
INSERT INTO Empleados (CodigoEmpleado, Nombre, Apellido1, Email, CodigoOficina, Puesto) 
VALUES (400,'Ismael','Sánchez','isanchez@jardineria.com','FUE-ES','Rep.Ventas');

--#3
INSERT INTO Clientes (CodigoCliente, NombreCliente, Telefono, CodigoEmpleadoRepVentas)
VALUES (288,'Riegos Pérez','918882763',400);

--#4
START TRANSACTION;
INSERT INTO Pedidos (CodigoPedido, FechaPedido, Estado, CodigoCliente)
	VALUES (1900,'2010-06-03','Pendiente',288);
INSERT INTO DetallePedidos (CodigoPedido, CodigoProducto, Cantidad, PrecioUnidad, NumeroLinea) 
	VALUES (1900,'OR-99',1,15.99,1);
INSERT INTO DetallePedidos (CodigoPedido, CodigoProducto, Cantidad, PrecioUnidad, NumeroLinea) 
	VALUES (1900,'OR-251',3,168,2);
COMMIT WORK;

--#5
UPDATE Clientes SET CodigoCliente=290 WHERE CodigoCliente=288;
--No permite la modificación, debería tener la FK con ON UPDATE CASCADE

--#6
DELETE FROM Clientes WHERE CodigoCliente=288;
--Tampoco permite el borrado, deberia tener la FK con ON DELETE CASCADE 