/*Activar BD Banco*/
use Banco
BEGIN TRANSACTION 
BEGIN TRY

/* Aumentar el saldo de la cuenta 3 un 10% (usar un valor concreto pe 300€) */

UPDATE Cuenta SET saldo = saldo + 1170 WHERE cod_cuenta = 3

/* Registramos el movimiento */

INSERT INTO Movimiento VALUES (GETDATE(), - 1070, 117, 3, 10)

/* Descontar el importe correspondiente de la cuenta 4 */

UPDATE Cuenta SET saldo = saldo - 1070 WHERE cod_cuenta = 4

/* Registramos el movimiento */

INSERT INTO Movimiento VALUES (GETDATE(), -1170, 117, 4, 9)



/* Confirmamos la transaccion*/ 
COMMIT TRANSACTION 
END TRY


BEGIN CATCH
/* Hay un error, deshacemos los cambios*/ 
ROLLBACK TRANSACTION
PRINT 'Se ha producido un error!'
END CATCH

/*DURANTE LA TRANSACCIÓN ANTERIOR (ANTES DE SU CONFIRMACIÓN), 
¿QUÉ INFORMACIÓN VEN LOS USUARIOS QUE CONSULTEN LAS CUENTAS AFECTADAS?, 
¿ESTÁ ACTUALIZADA?, EXPLÍCALO.*/

--Los usuarios antes de su confirmacion, no pueden ver nada ya que se queda en ejecucion la consulta.
--Hasta que no se ejecute el COMMIT no podran ver los cambios realizados.