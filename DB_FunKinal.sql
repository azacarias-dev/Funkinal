drop database FunKinal_DB;
create database FunKinal_DB;
use FunKinal_DB;

create table usuarios (
    idUsuario int auto_increment primary key,
    rol enum("Usuario","Admin") default ("Usuario"),
    nombre varchar(50),
    apellido varchar(50),
    correo varchar(100) unique,
    contrasena varchar(100),
    telefono varchar(20),
    estado varchar(64) default ("Activo")
);

create table categorias (
    idCategoria int auto_increment primary key,
    nombre varchar(100),
    descripcion text
);

create table productos (
    idProducto int auto_increment primary key,
    idCategoria int not null,
    nombre varchar(100),
    precio decimal(10,2),
    descripcion text,
    stock int,
    estado varchar (64) default ("Existencias"),
    constraint fk_productos_categoria foreign key (idCategoria)
		references Categorias (idCategoria)
);

create table compras (
    idCompra int auto_increment primary key,
    idUsuario int,
    fechaCompra datetime,
    total decimal(10,2),
    metodoPago enum ("Efectivo","Tarjeta"),
    estado varchar (64) default ("Sin pagar"),
    foreign key (idUsuario) references usuarios(idUsuario)
);

create table detalleCompras (
    idDetalleCompra int auto_increment primary key,
    idCompra int,
    idProducto int,
    cantidad int,
    precioUnitario decimal(10,2),
    foreign key (idCompra) references compras(idCompra),
    foreign key (idProducto) references productos(idProducto)
);

create table Recibos (
    idRecibo int auto_increment primary key,
    idCompra int,
    fechaEmision datetime,
    total decimal(10,2),
    metodoPago enum("Efectivo", "Tarjeta"),
    estado varchar(64) default "Emitido",
    foreign key (idCompra) references compras(idCompra)
);

create table detalleRecibo (
    idDetalleRecibo int auto_increment primary key,
    idRecibo int,
    idProducto int,
    idUsuario int,
    cantidad int,
    precioUnitario decimal(10,2),
    subtotal decimal(10,2),
    foreign key (idRecibo) references recibos(idRecibo),
    foreign key (idProducto) references productos(idProducto),
    foreign key (idUsuario) references usuarios(idUsuario)
);

select * from Usuarios;