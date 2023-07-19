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

