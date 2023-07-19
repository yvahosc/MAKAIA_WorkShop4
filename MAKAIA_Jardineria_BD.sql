-- Creación y uso BD
create database jardineria;
use jardineria;

-- Creación tabla gama de productos
create table gama_producto (
	gama int auto_increment primary key,
    descripcion varchar(100) not null,
    imagen varchar(100) not null
);

-- Creación tabla inventario
create table inventario (
	codigo_producto int auto_increment primary key,
    nombre varchar(25) not null,
    gama int not null,
    dimensiones varchar(50) not null,
    proveedor varchar(25) not null,
    descripcion varchar(100) not null,
    imagen varchar(100) not null,
    foreign key (gama) references gama_producto (gama)
);

-- Creación tabla oficina
create table oficina (
	codigo_oficina int auto_increment primary key,
    ciudad varchar(25) not null,
    pais varchar(25) not null,
    region varchar(25) not null,
    codigo_postal int not null,
    telefono varchar(10) not null,
    direccion varchar(100) not null
);

-- Creación tabla jefe
create table jefe(
	codigo_jefe int auto_increment primary key,
    codigo_oficina int,
    foreign key (codigo_oficina) references oficina (codigo_oficina)
);

-- Creación tabla empleado
create table empleado(
	codigo_empleado int auto_increment primary key,
    nombre varchar(25) not null,
    apellido1 varchar(25) not null,
    apellido2 varchar(25) not null,
    extension int not null,
    email varchar(25) not null,
    codigo_jefe int,
    puesto varchar(25) not null,
    foreign key (codigo_jefe) references jefe (codigo_jefe)
);

-- Creación tabla cliente
create table cliente(
	codigo_cliente int auto_increment primary key,
    nombre_cliente varchar(25) not null,
    nombre_contacto varchar(25) not null,
    apellido_contacto varchar(25) not null,
    telefono varchar(10) not null,
    codigo_empleado int not null, 
    limite_credito int not null,
    foreign key (codigo_empleado) references empleado (codigo_empleado)
);

-- Creación tabla direccion
create table direccion(
	codigo_direccion int auto_increment primary key,
    direccion varchar(100) not null,
    ciudad varchar(25) not null,
    pais varchar(25) not null,
    region varchar(25) not null,
    codigo_postal int not null,
    codigo_cliente int not null,
    fax varchar(10) not null,
    foreign key (codigo_cliente) references cliente (codigo_cliente)
);

-- Creación tabla pago
create table pago (
	id_transaccion int auto_increment primary key,
    codigo_cliente int not null,
    forma_pago varchar(25) not null,
    fecha_pago date not null,
    total_pago double not null,
    foreign key (codigo_cliente) references cliente (codigo_cliente)
);

-- Creación tabla pedido
create table pedido (
	codigo_pedido int auto_increment primary key,
    fecha_pedido date not null,
    fecha_esperada date not null,
    fecha_entrega date,
    estado varchar(25) not null,
    comentarios varchar(100),
    codigo_cliente int not null,
    id_transaccion int not null,
    foreign key (codigo_cliente) references cliente (codigo_cliente),
    foreign key (id_transaccion) references pago (id_transaccion)
);

-- Creación tabla informacion_pedido
create table informacion_pedido (
	codigo_pedido int not null,
    codigo_producto int not null,
    cantidad int not null,
	precio_unitario double not null,
    foreign key (codigo_producto) references inventario (codigo_producto),
    foreign key (codigo_pedido) references pedido (codigo_pedido)
);

-- Inserción de datos tabla gama de productos
INSERT INTO gama_producto (descripcion, imagen) VALUES('Abonos y fertilizantes', '/Abonos_y_fertilizantes.png');
INSERT INTO gama_producto (descripcion, imagen) VALUES('Control de plagas y enfermedades', '/Control_de_plagas_y_enfermedades.png');
INSERT INTO gama_producto (descripcion, imagen) VALUES('Herramientas', '/Herramientas.png');
INSERT INTO gama_producto (descripcion, imagen) VALUES('Materas y soportes', '/Materas_y_soportes.png');
INSERT INTO gama_producto (descripcion, imagen) VALUES('Semillas', '/semillas.png');

-- Inserción de datos tabla inventario
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Cascarilla de arroz', 1, '1 kg', 'Tierragro', 'Producto del proceso de trillado de arroz; sirve como nedio de cultivo y anclaje', '/cascarilla_de_arroz.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Fertilizante 15-15-15', 1, '1 kg', 'Tierragro', 'Fertilizante de propósito general compuesto de N, P, K', '/fertilizante-15-15-15.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Adngreen', 2, '250 cc', 'Tierragro', 'Insecticida orgánico para el control de varias plagas en cultivos', '/adngreen.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Permost', 2, '30 ml', 'Tierragro', 'Insecticida para control de malaria', '/permost.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Regadera plástica', 3, '4.5 l', 'Tierragro', 'Recipiente portátil para esparcir líquidos', '/regadera.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Tijeras', 3, '8 in', 'Tierragro', 'Herramienta que sirve para cortar tallos', '/tijeras.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Bandeja Germinadora', 4, '128 cavidades', 'Tierragro', 'Conjunto de cavidades para cultivar plantas', '/bandeja_germinadora.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Maceta', 4, '50 cm', 'Tierragro', 'Recipiente de barro para cultivar plantas', '/maceta.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Lavanda', 5, '0.3 gr', 'Tierragro', 'Semillas de lavanda', '/lavanda.png');
INSERT INTO inventario (nombre, gama, dimensiones, proveedor, descripcion, imagen) VALUES ('Girasol', 5, '0.3 gr', 'Tierragro', 'Semillas de girasol', '/girasol.png');

-- Inserción de datos tabla oficina
INSERT INTO oficina (ciudad, pais, region, codigo_postal, telefono, direccion) VALUES ('Barranquilla', 'Colombia', 'Caribe', 131077, '(881) 9291', '7 Vahlen Road');
INSERT INTO oficina (ciudad, pais, region, codigo_postal, telefono, direccion) VALUES ('Getafe', 'Spain', 'Comunidad de Madrid', 28904, '(997) 1690', '0 Milwaukee Court');
INSERT INTO oficina (ciudad, pais, region, codigo_postal, telefono, direccion) VALUES ('Madrid', 'Spain', 'Comunidad de Madrid', 762027, '(190) 1841', '654 Cottonwood Court');
INSERT INTO oficina (ciudad, pais, region, codigo_postal, telefono, direccion) VALUES ('Bogotá', 'Colombia', 'Andina', 411067, '(538) 3287', '398 Pleasure Road');
INSERT INTO oficina (ciudad, pais, region, codigo_postal, telefono, direccion) VALUES ('Cali', 'Colombia', 'Pacífico', 684058, '(643) 2184', '4 Forster Parkway');

-- Inserción de datos tabla jefe
INSERT INTO jefe (codigo_oficina) VALUES (null);
INSERT INTO jefe (codigo_oficina) VALUES (null);
INSERT INTO jefe (codigo_oficina) VALUES (1);
INSERT INTO jefe (codigo_oficina) VALUES (2);
INSERT INTO jefe (codigo_oficina) VALUES (3);
INSERT INTO jefe (codigo_oficina) VALUES (4);
INSERT INTO jefe (codigo_oficina) VALUES (5);

-- Inserción de datos tabla empleado
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Tamiko', 'Geraudel', 'Berggren', 586, 'tgb@slate.com', null, 'Gerente Colombia');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Kristian', 'Cumberlidge', 'Spurett', 879, 'kcs@slate.com', null, 'Gerente España');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Roi', 'Posselwhite', 'Caddy', 703, 'rcaddy0@usda.gov', 1, 'Jefe de oficina');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Micah', 'Dominighi', 'Dowry', 259, 'mdowry1@posterous.com', 1, 'Jefe de oficina');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Kristian', 'De Caroli', 'Heinonen', 164, 'kheinonen2@baidu.com', 1, 'Jefe de oficina');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Estel', 'Wimmer', 'Cannicott', 864, 'ecannicott3@market.com', 2, 'Jefe de oficina');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Tamiko', 'O''Hickee', 'MacParland', 788, 'tmacpar@slate.com', 2, 'Jefe de oficina');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Wilmette', 'Geraudel', 'Spurett', 573, 'wspurett5@github.io', 3, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Barbabas', 'Cham', 'Wonter', 707, 'bwonter6@network.org', 4, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Coop', 'Gussie', 'Marciskewski', 502, 'cmarcis@technorati.com', 5, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Rosina', 'Skurm', 'Antao', 642, 'rantao8@phpbb.com', 6, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Court', 'Cumberlidge', 'Rhoddie', 679, 'crhoddie9@shop-pro.jp', 7, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Christine', 'Iacoviello', 'Terren', 136, 'cterrena@bluehost.com', 7, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Berty', 'Mountney', 'Dixson', 308, 'bdixsonb@prlog.org', 4, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Bill', 'Cholmondeley', 'Berggren', 858, 'bberggrenc@ow.ly', 6, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Romeo', 'Coppock.', 'Woodger', 367, 'rwoodgerd@reverb.com', 4, 'Representante de ventas');
insert into empleado (nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto) values ('Abbott', 'Spragg', 'Deighton', 900, 'adeightone@webeden.co.uk', 3, 'Representante de ventas');
 
-- Inserción de datos tabla cliente
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Latz', 'Matthaeus', 'Popplestone', '(884) 7496', 15, 3891626);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Innotype', 'Meggi', 'Ganniclifft', '(972) 4367', 10, 4580203);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Shuffletag', 'Ingram', 'Lathey', '(882) 3732', 9, 4511624);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Skinte', 'Alyosha', 'Applegate', '(767) 7417', 15, 3625925);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Wordtune', 'Glory', 'Issatt', '(465) 9269', 9, 2861773);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Centidel', 'Riley', 'Donaway', '(106) 6204', 10, 4745821);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Browsezoom', 'Drusie', 'Brackstone', '(587) 8856', 9, 2437850);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Zooxo', 'Emalia', 'Stimpson', '(812) 1260', 15, 1662588);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Eazzy', 'Meggy', 'Strelitz', '(736) 4937', 12, 4518806);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Skyble', 'Almire', 'Theobold', '(596) 8578', 15, 4453915);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Edgeify', 'Kristal', 'Isabell', '(673) 8523', 10, 4653999);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Kare', 'Reuben', 'Franca', '(786) 2889', 13, 3066963);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Quimba', 'Rosmunda', 'Davinet', '(380) 3839', 15, 4514905);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Zazio', 'Bendix', 'Struys', '(109) 8886', 16, 2957178);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Agivu', 'Donielle', 'Cracknall', '(669) 2062', 10, 2997971);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Mynte', 'Jaquenette', 'Hicks', '(920) 9183', 8, 4150445);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Trudeo', 'Pietro', 'McKeevers', '(376) 2037', 15, 4550378);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Zoombox', 'Cherie', 'Charters', '(691) 1017', 9, 3591742);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Pixonyx', 'Alaine', 'D''Errico', '(977) 8114', 10, 4594473);
insert into cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, codigo_empleado, limite_credito) values ('Topicblab', 'Kippie', 'Filippi', '(409) 6824', 14, 1752385);

-- Inserción de datos tabla direccion
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('94388 Ilene Hill', 'Uppsala', 'Sweden', 'Uppsala', 75381, 1, '8084987638');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('5 Debra Street', 'Motrico', 'Philippines', 'Region 1', 2826, 1, '1677151623');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('68 Nova Trail', 'Xianju', 'China', 'Region 1', 97845, 2, '7922573025');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('3 Lighthouse Bay Parkway', 'Górki', 'Poland', 'Region 1', 39306, 2, '3099955302');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('75 Hanover Junction', 'Värnamo', 'Sweden', 'Jönköping', 33154, 3, '5666357150');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('656 Heath Plaza', 'Karlskoga', 'Sweden', 'Örebro', 69178, 3, '4214988170');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('73087 Grayhawk Way', 'Mapiri', 'Bolivia', 'Region 1', 41725, 4, '3059530675');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('666 Crescent Oaks Way', 'Puerto Esperanza', 'Argentina', 'Region 1', 3378, 4, '2198642190');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('46 Monterey Junction', 'San Marcelino', 'Philippines', 'Region 1', 2207, 5, '4961405817');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('15877 Susan Place', 'Yerevan', 'Armenia', 'Region 1', 5469, 5, '9863361481');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('74153 Hoepker Drive', 'Sukasenang', 'Indonesia', 'Region 1', 85236, 6, '9722226458');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('687 Waywood Way', 'Dula’er Ewenke Minzu', 'China', 'Region 1', 1457, 6, '5665534883');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('236 Basil Terrace', 'Zavoronezhskoye', 'Russia', 'Region 1', 393025, 7, '3982291616');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('08 Fuller Trail', 'Bodø', 'Norway', 'Nordland', 8010, 7, '1042920669');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('458 East Court', 'Alor Setar', 'Malaysia', 'Kedah', 05590, 8, '2179648431');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('3 Fair Oaks Junction', 'Savonlinna', 'Finland', 'Region 1', 57810, 8, '6633541648');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('1 Lighthouse Bay Pass', 'Barrosas', 'Portugal', 'Porto', 650127, 9, '5982170771');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('6367 Karstens Lane', 'Polomolok', 'Philippines', 'Region 1', 9504, 9, '9918767321');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('96739 Transport Avenue', 'Guotan', 'China', 'Region 1', 14756, 10, '9688817282');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('39 Hallows Circle', 'Aráchova', 'Greece', 'Region 1', 1236, 10, '7998988552');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('76959 Forest Dale Way', 'Amassoma', 'Nigeria', 'Region 1', 1456, 11, '5779415015');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('1624 Victoria Alley', 'Maulavi Bāzār', 'Bangladesh', 'Region 1', 3253, 11, '3518236237');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('2281 Columbus Avenue', 'Ramos', 'Philippines', 'Region 1', 2311, 12, '1814567801');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('73 Cottonwood Avenue', 'Mosal’sk', 'Russia', 'Region 1', 249930, 12, '1688347511');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('76 Troy Hill', 'Mýki', 'Greece', 'Region 1', 63954, 13, '8871857005');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('35100 Blackbird Circle', 'Umuahia', 'Nigeria', 'Region 1', 85213, 13, '8683592336');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('883 Kim Drive', 'Jiangchang', 'China', 'Region 1', 12387, 14, '9108694995');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('08796 Autumn Leaf Alley', 'Sohag', 'Egypt', 'Region 1', 36985, 14, '7484186821');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('176 Bunting Street', 'Skrzydlna', 'Poland', 'Region 1', 34625, 15, '3073575228');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('064 Hermina Way', 'Valuyki', 'Russia', 'Region 1', 309999, 15, '5551641948');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('32 Mcguire Terrace', 'Arlington', 'United States', 'Virginia', 22205, 16, '7031664898');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('2468 Truax Drive', 'Hwange', 'Zimbabwe', 'Region 1', 45789, 16, '6915094700');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('6 Stone Corner Place', 'Mubi', 'Nigeria', 'Region 1', 3659, 17, '7976906188');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('7620 Bluestem Place', 'Tunzhai', 'China', 'Region 1', 3695, 17, '4292220826');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('39 Annamark Circle', 'Suqiaoxiang', 'China', 'Region 1', 12789, 18, '3005152073');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('59002 Almo Park', 'Emiliano Zapata', 'Mexico', 'Tamaulipas', 88759, 18, '3359877571');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('29568 Doe Crossing Crossing', 'Izobil’nyy', 'Russia', 'Region 1', 347674, 19, '9776116441');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('420 Comanche Park', 'Lugait', 'Philippines', 'Region 1', 9025, 19, '1854649700');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('99 Raven Avenue', 'La Mesa', 'Mexico', 'Mexico', 51462, 20, '3141484525');
insert into direccion (direccion, ciudad, pais, region, codigo_postal, codigo_cliente, fax) values ('0349 Golf Parkway', 'Zhuyang', 'China', 'Region 1', 5641, 20, '3763900094');

-- Inserción de datos tabla pago
insert into pago (codigo_cliente, forma_pago, fecha_pago, total_pago) values (1, 'Efectivo', '2009-09-10', 233000);
insert into pago (codigo_cliente, forma_pago, fecha_pago, total_pago) values (16, 'Tarjeta de credito', '2008-04-28', 36000);
insert into pago (codigo_cliente, forma_pago, fecha_pago, total_pago) values (11, 'Tarjeta debito', '2006-08-17', 43000);
insert into pago (codigo_cliente, forma_pago, fecha_pago, total_pago) values (9, 'Efectivo', '2007-11-23', 1500000);
insert into pago (codigo_cliente, forma_pago, fecha_pago, total_pago) values (17, 'Tarjeta debito', '2009-06-24', 1733000);

-- Inserción de datos tabla pedido
insert into pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, codigo_cliente, id_transaccion) values ('2009-09-10', '2009-09-15', '2009-09-12', 'Entregado', 1, 1);
insert into pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, codigo_cliente, id_transaccion) values ('2008-04-28', '2008-04-30', '2008-04-30', 'Entregado', 16, 2);
insert into pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, codigo_cliente, id_transaccion) values ('2006-08-17', '2006-08-23', '2006-08-23', 'Entregado', 11, 3);
insert into pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, codigo_cliente, id_transaccion) values ('2007-11-23', '2007-11-23', '2007-11-23', 'Entregado', 9, 4);
insert into pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, codigo_cliente, id_transaccion) values ('2009-06-24', '2009-06-26', '2009-06-27', 'Entregado', 17, 5);

-- Inserción de datos tabla informacion_pedido
-- pedido 1
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (1, 1, 2, 50000);
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (1, 2, 1, 25000);
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (1, 3, 3, 36000);

-- pedido 2
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (2, 3, 1, 36000);

-- pedido 3
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (3, 5, 1, 15000);
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (3, 6, 1, 28000);

-- pedido 4
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (4, 10, 10, 150000);

-- pedido 5
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (5, 1, 2, 50000);
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (5, 2, 1, 25000);
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (5, 3, 3, 36000);
insert into  informacion_pedido (codigo_pedido, codigo_producto, cantidad, precio_unitario) values (5, 10, 10, 150000);

-- Consultas
-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select codigo_oficina, ciudad from oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad, telefono from oficina where pais = 'Spain';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre, apellido1, apellido2, email from empleado where codigo_jefe = 7;

-- 4. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
select distinct codigo_cliente from pago where YEAR(fecha_pago) = 2008;
-- Utilizando la función DATE_FORMAT de MySQL.
select distinct codigo_cliente from pago where date_format(fecha_pago,"%Y") = 2008;

-- 5. ¿Cuántos empleados hay en la compañía?
select count(codigo_empleado) as 'Cantidad de empleados' from empleado;

-- 6. ¿Cuántos clientes tiene cada país?
select pais, count(codigo_cliente) as 'Cantidad de clientes' from direccion group by pais;

-- 7. ¿Cuál fue el pago medio en 2009?
select avg(total_pago) as 'Pago medio año 2009' from pago where YEAR(fecha_pago) = 2009;

-- 8. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select estado, count(codigo_pedido) as 'Número de pedidos' from pedido group by estado order by 'Número de pedidos' desc;

-- 9. Calcula el precio de venta del producto más caro y barato en una misma consulta.
(select codigo_producto, precio_unitario from informacion_pedido group by codigo_producto order by precio_unitario limit 1) union (select codigo_producto, precio_unitario from informacion_pedido group by codigo_producto order by precio_unitario desc limit 1);

-- 10. Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente from cliente where limite_credito = (select max(limite_credito) as Maximo from cliente);

-- 11. Devuelve el nombre del producto que tenga el precio de venta más caro.
select nombre as 'Producto más caro' from inventario where codigo_producto = (select codigo_producto from informacion_pedido group by codigo_producto order by precio_unitario desc limit 1);

-- 12. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
select nombre as 'Producto más vendido' from inventario where codigo_producto = (select codigo_producto from informacion_pedido group by codigo_producto order by sum(cantidad) desc limit 1);

-- 13. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
select * from (select nombre_cliente, limite_credito, total_pago from cliente, pago where cliente.codigo_cliente = pago.codigo_cliente) as a where limite_credito > total_pago;

-- 14. Devuelve el listado de clientes indicando el nombre del cliente y cuantos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
select cliente.nombre_cliente, resultado.cantidad_pedidos as 'Cantidad de pedidos' from cliente join (select codigo_cliente, count(codigo_cliente) as cantidad_pedidos from pago group by codigo_cliente) as resultado on cliente.codigo_cliente = resultado.codigo_cliente;

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.    
select e.nombre, e.apellido1, e.apellido2, e.puesto, oficina.telefono as telefono_oficina from (select emp.codigo_empleado, emp.nombre, emp.apellido1, emp.apellido2, emp.puesto, jefe.codigo_oficina from (select * from empleado where codigo_empleado not in (select distinct codigo_empleado from cliente)) as emp join jefe on emp.codigo_jefe = jefe.codigo_jefe where emp.puesto = 'Representante de ventas') as e join oficina on e.codigo_oficina = oficina.codigo_oficina;
    
-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales(Se cambia a gama 1).
select * from oficina where codigo_oficina not in (select codigo_oficina from jefe where codigo_jefe = (select codigo_jefe from empleado where codigo_empleado in (select distinct codigo_empleado from cliente where codigo_cliente in (select codigo_cliente from (select distinct codigo_cliente, gama from (select codigo_cliente, codigo_producto from (select cliente.codigo_cliente, pedido.codigo_pedido from cliente inner join pedido on cliente.codigo_cliente = pedido.codigo_cliente) as cliente_pedido join informacion_pedido on cliente_pedido.codigo_pedido = informacion_pedido.codigo_pedido) as cliente_info_pedido join inventario on cliente_info_pedido.codigo_producto = inventario.codigo_producto) as cliente_gama join gama_producto on  gama_producto.gama = cliente_gama.gama where descripcion = 'Abonos y fertilizantes'))));

-- 17. Devuelve el listado de clientes indicando el nombre del cliente y cuantos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
select nombre_cliente, pedidos as 'Número de pedidos' from cliente join (select codigo_cliente, count(*) as pedidos from pedido group by codigo_cliente) as pedidos_cliente on cliente.codigo_cliente = pedidos_cliente.codigo_cliente;

-- 18. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
select nombre_cliente, pagos as 'Total pagado' from cliente join (select codigo_cliente, sum(total_pago) as pagos from pago group by codigo_cliente) as pagos_cliente on cliente.codigo_cliente = pagos_cliente.codigo_cliente;