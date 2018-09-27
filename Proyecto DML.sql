create database ParkingCeet;

use ParkingCeet;

desc cliente;

desc vehiculo;

desc encargado;

desc ticket;

desc factura;


select * from cliente;


update vehiculo
    -> set VehCliente = '12345678'
    -> where VehPlaca = 'NQS87E';
		
delete from vehiculo
    -> where VehPlaca = ' ';
	
select * from vehiculo;

Select* from encargado;

select * from ticket;

SELECT CliNombre
FROM CLIENTE
INNER JOIN VEHICULO ON VehPlaca = CliVehiculo;
	