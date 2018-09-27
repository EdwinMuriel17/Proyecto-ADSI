create database ParkingCeet;

use ParkingCeet;

create table VEHICULO (
    VehPlaca char (6) primary key not null,
    VehTipo enum ('MOTO','CARRO'),
    VehNovedades text not null);

create table CLIENTE (
    CliNombre varchar (50) not null,
    CliIdentificacion char (10) primary key not null,
    CliApellidos varchar (50) not null,
    CliTipo enum ('exporadico','fijo'),
    CliVehiculo char (6) not null,
    foreign key (CliVehiculo) references VEHICULO (VehPlaca) );

create table ENCARGADO(
    EncIdentificacion char (10) primary key not null,
    EncNombre varchar (50) not null,
    EncApellido varchar (50) not null,
    EncPerfil enum ('ADMINISTRADOR','EMPLEADO'));


create table TICKET(
    Ticketid Int primary key auto_increment,
    TicEncargado Char (10) not null,
    foreign key (TicEncargado) references ENCARGADO (EncIdentificacion),
    TicPlaca char (6) not null,
    foreign key (TicPlaca) references VEHICULO (VehPlaca),
    TicFechaIngreso date not null,
    TicHoraIngreso Time not null);


create table FACTURA (
    Facturaid int primary key auto_increment,
    FacFecha date not null,
    FacHoraingreso time not null,
    FacHorasalida time not null,
    FacPlaca char(6) not null,
    foreign key (facPlaca) references VEHICULO (VehPlaca),
    FacTicket int not null,
    foreign key (FacTicket) references TICKET (Ticketid));
    
alter table VEHICULO add foreign key (VehCliente) references CLIENTE (CliIdentificacion);

alter table VEHICULO add VehCliente char(10);

insert into vehiculo (VehPlaca, VehTipo, VehNovedades) values
	('NQS87E', 'MOTO', 'sin novedades');

insert into cliente (CliNombre, CliIdentificacion, CliApellidos, CliTipo, CliVehiculo) values
    ('Stiven', 12345678, 'Burgos Moreno', 'exporadico', 'NQS87E');

insert into encargado (EncIdentificacion, EncNombre, EncApellido, EncPerfil) values
    (21346587, 'Joan David', 'Rojas Zapata', 'ADMINISTRADOR');
		
insert into ticket (TicEncargado, TicPlaca, TicFechaIngreso, TicHoraIngreso) values
    -> (21346587, 'NQS87E', '18-09-17', '12:05:54.0000000');		
