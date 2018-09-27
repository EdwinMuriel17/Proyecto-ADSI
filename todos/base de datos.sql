
Setting environment for using XAMPP for Windows.
SOPORTE@DESKTOP-L0GLE2A c:\xampp
# cd c:/xampp/mysql/bin

SOPORTE@DESKTOP-L0GLE2A c:\xampp\mysql\bin
# mysql -u root -h localhost -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 2
Server version: 10.1.34-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use ParkingCeet
Database changed
MariaDB [ParkingCeet]> create table VEHICULO (
    -> VehPlaca char (6) primary key not null,
    -> VehTipo enum ('MOTO','CARRO'),
    -> VehNovedades text not null);
Query OK, 0 rows affected (0.26 sec)

MariaDB [ParkingCeet]> create table CLIENTE (
    -> CliNombre varchar (50) not null,
    -> CliIdentificacion char (10) primary key not null,
    -> CliApellidos varchar (50) not null,
    -> CliTipo enum ('exporadico','fijo'),
    -> CliVehiculo char (6) not null,
    -> foreign key (CliVehiculo) references VEHICULO (VehPlaca) );
Query OK, 0 rows affected (0.11 sec)

MariaDB [ParkingCeet]> create table ENCARGADO(
    -> EncIdentificacion char (10) primary key not null,
    -> EncNombre varchar (50) not null,
    -> EncApellido varchar (50) not null,
    -> EncPerfil enum ('ADMINISTRADOR','EMPLEADO'));
Query OK, 0 rows affected (0.13 sec)

MariaDB [ParkingCeet]> desc ENCARGADO;
+-------------------+----------------------------------+------+-----+---------+-------+
| Field             | Type                             | Null | Key | Default | Extra |
+-------------------+----------------------------------+------+-----+---------+-------+
| EncIdentificacion | char(10)                         | NO   | PRI | NULL    |       |
| EncNombre         | varchar(50)                      | NO   |     | NULL    |       |
| EncApellido       | varchar(50)                      | NO   |     | NULL    |       |
| EncPerfil         | enum('ADMINISTRADOR','EMPLEADO') | YES  |     | NULL    |       |
+-------------------+----------------------------------+------+-----+---------+-------+
4 rows in set (0.02 sec)


MariaDB [ParkingCeet]> create table TICKET(
    -> Ticketid Int primary key auto_increment,
    -> TicEncargado Char (10) not null,
    -> foreign key (TicEncargado) references ENCARGADO (EncIdentificacion),
    -> TicPlaca char (6) not null,
    -> foreign key (TicPlaca) references VEHICULO (VehPlaca),
    -> TicFechaIngreso date not null,
    -> TicHoraIngreso Time not null);
Query OK, 0 rows affected (0.13 sec)

MariaDB [ParkingCeet]> create table FACTURA (
    -> Facturaid int primary key auto_increment,
    -> FacFecha date not null,
    -> FacHoraingreso time not null,
    -> FacHorasalida time not null,
    -> FacPlaca char(6) not null,
    -> foreign key (facPlaca) references VEHICULO (VehPlaca),
    -> FacTicket int not null,
    -> foreign key (FacTicket) references TICKET (Ticketid));
Query OK, 0 rows affected (0.10 sec)

MariaDB [ParkingCeet]> desc VEHICULO
    -> ;
+--------------+----------------------+------+-----+---------+-------+
| Field        | Type                 | Null | Key | Default | Extra |
+--------------+----------------------+------+-----+---------+-------+
| VehPlaca     | char(6)              | NO   | PRI | NULL    |       |
| VehTipo      | enum('MOTO','CARRO') | YES  |     | NULL    |       |
| VehNovedades | text                 | NO   |     | NULL    |       |
+--------------+----------------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

MariaDB [ParkingCeet]> alter table VEHICULO add VehCliente char(10);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ParkingCeet]> desc VEHICULO
    -> ;
+--------------+----------------------+------+-----+---------+-------+
| Field        | Type                 | Null | Key | Default | Extra |
+--------------+----------------------+------+-----+---------+-------+
| VehPlaca     | char(6)              | NO   | PRI | NULL    |       |
| VehTipo      | enum('MOTO','CARRO') | YES  |     | NULL    |       |
| VehNovedades | text                 | NO   |     | NULL    |       |
| VehCliente   | char(10)             | YES  |     | NULL    |       |
+--------------+----------------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

MariaDB [ParkingCeet]> alter table VEHICULO add foreign key (VehCliente) references CLIENTE (CliIdentificacion);
Query OK, 0 rows affected (0.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [ParkingCeet]> desc VEHICULO;
+--------------+----------------------+------+-----+---------+-------+
| Field        | Type                 | Null | Key | Default | Extra |
+--------------+----------------------+------+-----+---------+-------+
| VehPlaca     | char(6)              | NO   | PRI | NULL    |       |
| VehTipo      | enum('MOTO','CARRO') | YES  |     | NULL    |       |
| VehNovedades | text                 | NO   |     | NULL    |       |
| VehCliente   | char(10)             | YES  | MUL | NULL    |       |
+--------------+----------------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

MariaDB [ParkingCeet]> Bye
