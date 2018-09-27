create database LABORATORIOSQL;


 use LABORATORIOSQL;

 create table profesor (
     doc_prof varchar (11) primary key not null,
     nom_prof varchar (30) not null,
     ape_prof varchar (30) not null,
     cate_prof int not null,
     sal_prof int not null);

describe profesor;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| doc_prof  | varchar(11) | NO   | PRI | NULL    |       |
| nom_prof  | varchar(30) | NO   |     | NULL    |       |
| ape_prof  | varchar(30) | NO   |     | NULL    |       |
| cate_prof | int(11)     | NO   |     | NULL    |       |
| sal_prof  | int(11)     | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+


create table curso(
    cod_cur int primary key auto_increment,
    nom_curs varchar (100) not null,
    horas_cur int not null,
    valor_cur int not null);

describe curso;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| cod_cur   | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom_curs  | varchar(100) | NO   |     | NULL    |                |
| horas_cur | int(11)      | NO   |     | NULL    |                |
| valor_cur | int(11)      | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+


 create table estudiante(
    doc_est varchar (11) primary key not null,
    nom_est varchar (25) not null,
    ape_est varchar (25) not null,
    edad_est int not null);


describe estudiante;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| doc_est  | varchar(11) | NO   | PRI | NULL    |       |
| nom_est  | varchar(25) | NO   |     | NULL    |       |
| ape_est  | varchar(25) | NO   |     | NULL    |       |
| edad_est | int(11)     | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+



 create table estudiantexcurso(
    cod_cur_estcur int(11),
    doc_est_estcur varchar (11),
    fec_ini_estcur date,
    foreign key (cod_cur_estcur) references curso (cod_cur),
    foreign key (doc_est_estcur) references estudiante (doc_est));
describe estudiantexcurso;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| cod_cur_estcur | int(11)     | YES  | MUL | NULL    |       |
| doc_est_estcur | varchar(11) | YES  | MUL | NULL    |       |
| fec_ini_estcur | date        | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+


create table cliente(
    id_cli varchar (11) primary key not null,
    nom_cli varchar (25) not null,
    ape_cli varchar (25) not null,
    dir_cli varchar (50) not null,
    dep_cli varchar (20) not null,
    mes_cum_cli varchar (10) not null);
describe cliente;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id_cli      | varchar(11) | NO   | PRI | NULL    |       |
| nom_cli     | varchar(25) | NO   |     | NULL    |       |
| ape_cli     | varchar(25) | NO   |     | NULL    |       |
| dir_cli     | varchar(50) | NO   |     | NULL    |       |
| dep_cli     | varchar(20) | NO   |     | NULL    |       |
| mes_cum_cli | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+


 create table articulo(
    id_art int primary key auto_increment,
    tit_art varchar (50) not null,
    aut_art varchar (50) not null,
    edi_art varchar (100) not null,
    prec_art int not null);
describe articulo;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id_art   | int(11)      | NO   | PRI | NULL    | auto_increment |
| tit_art  | varchar(50)  | NO   |     | NULL    |                |
| aut_art  | varchar(50)  | NO   |     | NULL    |                |
| edi_art  | varchar(100) | NO   |     | NULL    |                |
| prec_art | int(11)      | NO   |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+

 create table pedido(
    id_ped int primary key auto_increment,
    id_cli_ped varchar (11) not null,
    fec_ped date not null,
    val_ped int not null,
    foreign key (id_cli_ped) references cliente (id_cli));
 describe pedido;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id_ped     | int(11)     | NO   | PRI | NULL    | auto_increment |
| id_cli_ped | varchar(11) | NO   | MUL | NULL    |                |
| fec_ped    | date        | NO   |     | NULL    |                |
| val_ped    | int(11)     | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

create table articuloxpedido(
    id_ped_artped int (11),
    id_art_artped int (11),
    can_art_artped int (11) not null,
    val_cen_art_artped int (11) not null,
    foreign key (id_ped_artped) references pedido (id_ped),
    foreign key (id_art_artped) references articulo (id_art));
 describe articuloxpedido;
+--------------------+---------+------+-----+---------+-------+
| Field              | Type    | Null | Key | Default | Extra |
+--------------------+---------+------+-----+---------+-------+
| id_ped_artped      | int(11) | YES  | MUL | NULL    |       |
| id_art_artped      | int(11) | YES  | MUL | NULL    |       |
| can_art_artped     | int(11) | NO   |     | NULL    |       |
| val_cen_art_artped | int(11) | NO   |     | NULL    |       |
+--------------------+---------+------+-----+---------+-------+

create table compañia(
    comnit varchar (11) primary key not null,
    comnombre varchar (25) not null,
    comañofun int not null,
    comreplegal varchar (50) not null );
 describe compañia;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| comnit      | varchar(11) | NO   | PRI | NULL    |       |
| comnombre   | varchar(25) | NO   |     | NULL    |       |
| comañofun   | int(11)     | NO   |     | NULL    |       |
| comreplegal | varchar(50) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+


create table tiposautomotores(
    aut_tipo int primary key not null);
describe tiposautomotores;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| auttipo | int(11) | NO   | PRI | NULL    |       |
+---------+---------+------+-----+---------+-------+

ALTER TABLE tiposautomotores ADD COLUMN autnombre varchar(30);
show tables;
+--------------------------+
| Tables_in_laboratoriosql |
+--------------------------+
| articulo                 |
| articuloxpedido          |
| cliente                  |
| compañia                 |
| curso                    |
| estudiante               |
| estudiantexcurso         |
| pedido                   |
| profesor                 |
| tiposautomotores         |
+--------------------------+


create table automotores(
    autplaca varchar (6) primary key not null,
    automarca varchar (25) not null,
    autotipo int not null,
    automodelo int not null,
    autonumpasajeros int not null,
    autocilindraje int not null,
    autonumchasis varchar (25) not null,
    foreign key (autotipo) references tiposautomotores (auttipo));

desc automotores;
+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| autplaca         | varchar(6)  | NO   | PRI | NULL    |       |
| automarca        | varchar(25) | NO   |     | NULL    |       |
| autotipo         | int(11)     | NO   | MUL | NULL    |       |
| automodelo       | int(11)     | NO   |     | NULL    |       |
| autonumpasajeros | int(11)     | NO   |     | NULL    |       |
| autocilindraje   | int(11)     | NO   |     | NULL    |       |
| autonumchasis    | varchar(25) | NO   |     | NULL    |       |
+------------------+-------------+------+-----+---------+-------+
create table aseguramientos(
    asecodigo int primary key auto_increment,
    asefechainicio date,
    asefechaexpiracion date,
    asevalorasegurado int (11),
    aseestado varchar(25) not null,
    asecosto int(11),
    aseplaca varchar(6),
    foreign key (aseplaca) references automotores (autplaca));

 desc aseguramientos;
+--------------------+-------------+------+-----+---------+----------------+
| Field              | Type        | Null | Key | Default | Extra          |
+--------------------+-------------+------+-----+---------+----------------+
| asecodigo          | int(11)     | NO   | PRI | NULL    | auto_increment |
| asefechainicio     | date        | YES  |     | NULL    |                |
| asefechaexpiracion | date        | YES  |     | NULL    |                |
| asevalorasegurado  | int(11)     | YES  |     | NULL    |                |
| aseestado          | varchar(25) | NO   |     | NULL    |                |
| asecosto           | int(11)     | YES  |     | NULL    |                |
| aseplaca           | varchar(6)  | YES  | MUL | NULL    |                |
+--------------------+-------------+------+-----+---------+----------------+

create table incidentes (
    inci_codigo int auto_increment primary key not null,
    inci_fecha date,
    inci_placa varchar(6),
    foreign key (inci_placa) references automotores (autplaca),
    inci_lugar varchar(40) not null,
    inci_cant_heridos int,
    inci_cant_fatalidades int not null,
    inci_cant_autosinvolucrados int not null );
    desc incidentes;
+-----------------------------+-------------+------+-----+---------+----------------+
| Field                       | Type        | Null | Key | Default | Extra          |
+-----------------------------+-------------+------+-----+---------+----------------+
| inci_codigo                 | int(11)     | NO   | PRI | NULL    | auto_increment |
| inci_fecha                  | date        | YES  |     | NULL    |                |
| inci_placa                  | varchar(6)  | YES  | MUL | NULL    |                |
| inci_lugar                  | varchar(40) | NO   |     | NULL    |                |
| inci_cant_heridos           | int(11)     | YES  |     | NULL    |                |
| inci_cant_fatalidades       | int(11)     | NO   |     | NULL    |                |
| inci_cant_autosinvolucrados | int(11)     | NO   |     | NULL    |                |
+-----------------------------+-------------+------+-----+---------+----------------+

show tables;
+--------------------------+
| Tables_in_laboratoriosql |
+--------------------------+
| articulo                 |
| articuloxpedido          |
| aseguramientos           |
| automotores              |
| cliente                  |
| compañia                 |
| curso                    |
| estudiante               |
| estudiantexcurso         |
| incidentes               |
| pedido                   |
| profesor                 |
| tiposautomotores         |
+--------------------------+

insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof) values
    (63502720, 'Martha', 'Rojas', 2, 690000),
    (13826789, 'Maritza', 'Angarita', 1, 550000),
    (91216904, 'Carlos', 'Pérez', 3, 950000),
    (1098765789, 'Alejandra', 'Torres', 4, 1100000);

insert into curso (cod_cur, nom_curs, horas_cur, valor_cur) values
(149842, 'Fundamentos de Base de Datos', 40, 500000),
(250067, 'Fundametos de SQL', 20, 700000),
(289011, 'Manejo de Mysql', 45, 550000),
(345671, 'Fundamentals of Oracle', 60, 3000000);

insert into estudiante (doc_est, nom_est, ape_est, edad_est) values
(63502720, 'María', 'Perez', 23),
(91245678, 'Carlos José', 'Lopez', 25),
(1098098097, 'Jonatan', 'Ardila', 17),
(1098765678, 'Carlos', 'Martinez', 19);

insert into estudiantexcurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur) values
(289011, 1098765678, '01-02-11'),
(250067, 63502720, '01-03-11'),
(289011, 1098098097, '01-02-11'),
(345671, 63502720, '01-04-11');
 
insert into cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli) values
(63502718, 'Maritza', 'Rojas', 'Calle 34 No.14-45', 'Santander', 'Abril'),
(13890234, 'Roger', 'Ariza', 'Cra 30 No.13-45', 'Antioquia', 'Junio'),
(77191956, 'Juan Carlos', 'Arenas', 'Diogonal 23 No.12-34 apto 101', 'Valle', 'Marzo'),
(1098765789, 'Catalina', 'Zapata', 'Av el libertador No.30-14', 'Cauca', 'Marzo');

insert into articulo (id_art, tit_art, aut_art, edi_art, prec_art) values
(1, 'Redes Cisco', 'Ernesto Arigasello', 'Alfaomega-Rama', 60000),
(2, 'Facebook y twitter para adultos', 'Veloso Claudio', 'Alfaomega', 52000),
(3, 'Creación de un portal con php y mysql', 'Jacobo Pavón Puertas', 'Alfaomega-Rama', 40000),
(4, 'Administración de sistemas operativos', 'Julio Goméz López', 'Alfaomega', 55000);

insert into pedido (id_ped, id_cli_ped, fec_ped, val_ped) values
(1, 63502718, '25-02-12', 120000),
(2, 77191956, '30-04-12', 55000),
(3, 63502718, '10-12-11', 260000),
(4, 1098765789, '25-02-12', 1800000);

insert into articuloxpedido (id_ped_artped, id_art_artped, can_art_artped ,val_cen_art_artped) values
(1, 3, 5, 40000),
(1, 4, 12, 55000),
(2, 1, 5, 65000),
(3, 2, 10, 55000),
(3, 3, 12, 45000),
(4, 1, 20, 65000);

insert into compañia (comnit, comnombre, comañofun , comreplegal) values
('800890890-2', 'Seguros Atlantida', 1998,'Carlos Lopez'),
('899999999-1', 'Aseguradora Rojas', 1991, 'Luis Fernando Rojas'),
('899999999-5', 'Seguros del Estadio', 2001, 'Maria Margarita Pérez');

insert into tiposautomotores (aut_tipo, autnombre) values
(1, 'Automoviles'),
(2, 'Camperos'),
(3, 'camiones');

insert into automotores (autplaca, automarca, autotipo, automodelo, autonumpasajeros, autocilindraje, autonumchasis) values
('FLL420', 'chevrolet corsa', 1, 2003, 5, 1400, 'wywzzz167kk009d25'),
('DKZ820', 'renault stepway', 1, 2008, 5, 1600, 'wywwzz157kk009d45'),
('KJQ920', 'kia sportage', 2, 2009, 7, 2000, 'wywzzz157kk009d25');

insert into aseguramientos (asecodigo, asefechainicio, asefechaexpiracion, asevalorasegurado, aseestado, asecosto) values
(1, '09-30-12', '09-30-13', 30000000, 'vigente', 500000),
(2, '09-27-12', '09-27-13', 35000000, 'vigente', 600000),
(3, '09-28-11', '09-28-12', 50000000, 'vigente', 800000);

insert into incidentes (inci_fecha, inci_lugar, inci_cant_heridos, inci_cant_fatalidades, inci_cant_autosinvolucrados) values
   ('09-30-12', 'Bucaramanga', 0, 0, 2),
   ('09-27-12', 'Giron', 1, 0, 1),
   ('09-28-11', 'Bucaramanga', 1, 0, 2);


SELECT sal_prof FROM profesor
    ORDER BY cate_prof;

 SELECT valor_cur FROM curso
    Where valor_cur > 500000;

SELECT edad_est FROM estudiante
    Where edad_est > 22 ;