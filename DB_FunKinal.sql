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
    estado varchar(64) default "Activo"
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
    precioUnitario decimal(10,2) default 0.00,
    estado varchar(64) default ("Sin Pagar"),
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

DELIMITER $$

CREATE TRIGGER trg_cambiar_rol_usuario1
before INSERT ON Usuarios
FOR EACH ROW
BEGIN
    IF NEW.idUsuario = 1 THEN
        SET NEW.rol = 'Admin';
    ELSE
        SET NEW.rol = 'Usuario'; -- o deja el valor que venga si quieres
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_actualizar_estado_detalle AFTER UPDATE ON compras
FOR EACH ROW
BEGIN
    IF NEW.estado <> OLD.estado THEN
        UPDATE detalleCompras
        SET estado = NEW.estado
        WHERE idCompra = NEW.idCompra;
    END IF;
END $$

DELIMITER ;


DELIMITER //

CREATE TRIGGER before_insert_detalle_compra
BEFORE INSERT ON detalleCompras
FOR EACH ROW
BEGIN
    DECLARE precio DECIMAL(10,2);

    -- Obtener el precio del producto desde la tabla productos
    SELECT p.precio INTO precio
    FROM productos p
    WHERE p.idProducto = NEW.idProducto;

    -- Asignar ese precio al campo precioUnitario del nuevo registro
    SET NEW.precioUnitario = precio;
END;
//

DELIMITER ;

select * from Usuarios;

DELIMITER $$

CREATE TRIGGER trg_rebajar_stock
AFTER INSERT ON detalleCompras
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock - NEW.cantidad
    WHERE idProducto = NEW.idProducto;
END $$

DELIMITER ;
Insert into categorias(nombre, descripcion)values 
("Star Wars","Personajes de la saga de peliculas Star Wars"),
("TOY STORY","Juguetes de la nsaga de peliculas animadas Toy Story"),
("Spider-man","Personajes de la serie de peliculas e historietas del Hombre Araña"),
("Transformers","Personajes de la serie animada y saga de peliculas de Michael Bay"),
("Harry Potter","Personajes de la serie de libros y peliculas de Harry Potter"),
("Pokemon","Personajes animados de la serie animada de Pokemon Go");

-- Star Wars (idCategoria = 2)
INSERT INTO productos (idCategoria, nombre, precio, descripcion, stock, estado) VALUES 
(1, 'Mandalorian', 19.99, 'Figura de Star Wars', 100, 'Existencias'),
(1, 'Darth Vader', 19.99, 'Figura de Star Wars', 100, 'Existencias'),
(1, 'Kylo Ren', 19.99, 'Figura de Star Wars', 100, 'Existencias'),
(1, 'Admiral Ackbar', 19.99, 'Figura de Star Wars', 100, 'Existencias'),
(1, 'Yoda', 19.99, 'Figura de Star Wars', 100, 'Existencias');

-- Toy Story (idCategoria = 1)
INSERT INTO productos (idCategoria, nombre, precio, descripcion, stock, estado) VALUES 
(2, 'Chicken Suit', 19.99, 'Figura de Toy Story', 100, 'Existencias'),
(2, 'Woody', 19.99, 'Figura de Toy Story', 100, 'Existencias'),
(2, 'Buzz Lightyear', 19.99, 'Figura de Toy Story', 100, 'Existencias'),
(2, 'Sid', 19.99, 'Figura de Toy Story', 100, 'Existencias'),
(2, 'Alien', 19.99, 'Figura de Toy Story', 100, 'Existencias');

-- Spider Man (idCategoria = 3)
INSERT INTO productos (idCategoria, nombre, precio, descripcion, stock, estado) VALUES 
(3, 'Spider Man (Friendly Neighborhood)', 19.99, 'Figura de Spider Man', 100, 'Existencias'),
(3, 'Duende Verde (Green Goblin)', 19.99, 'Figura de Spider Man', 100, 'Existencias'),
(3, 'Doctor Octopus', 19.99, 'Figura de Spider Man', 100, 'Existencias'),
(3, 'Venom', 19.99, 'Figura de Spider Man', 100, 'Existencias'),
(3, 'Sandman', 19.99, 'Figura de Spider Man', 100, 'Existencias');

-- Transformers (idCategoria = 4)
INSERT INTO productos (idCategoria, nombre, precio, descripcion, stock, estado) VALUES 
(4, 'Optimus Prime', 19.99, 'Figura de Transformers', 100, 'Existencias'),
(4, 'Megatron', 19.99, 'Figura de Transformers', 100, 'Existencias'),
(4, 'Cyclonus', 19.99, 'Figura de Transformers', 100, 'Existencias'),
(4, 'Super Omega (Omega Supreme)', 19.99, 'Figura de Transformers', 100, 'Existencias'),
(4, 'Arcee', 19.99, 'Figura de Transformers', 100, 'Existencias');

-- Harry Potter (idCategoria = 5)
INSERT INTO productos (idCategoria, nombre, precio, descripcion, stock, estado) VALUES 
(5, 'Harry', 19.99, 'Figura de Harry Potter', 100, 'Existencias'),
(5, 'Hermione', 19.99, 'Figura de Harry Potter', 100, 'Existencias'),
(5, 'Dark Mark', 19.99, 'Figura de Harry Potter', 100, 'Existencias'),
(5, 'Luna Lovegood', 19.99, 'Figura de Harry Potter', 100, 'Existencias'),
(5, 'Pukin Pastille Girl', 19.99, 'Figura de Harry Potter', 100, 'Existencias');

-- Pokémon (idCategoria = 6)
INSERT INTO productos (idCategoria, nombre, precio, descripcion, stock, estado) VALUES 
(6, 'Charizard', 19.99, 'Figura de Pokémon', 100, 'Existencias'),
(6, 'Lucario', 19.99, 'Figura de Pokémon', 100, 'Existencias'),
(6, 'Umbreon', 19.99, 'Figura de Pokémon', 100, 'Existencias'),
(6, 'Pikachu', 19.99, 'Figura de Pokémon', 100, 'Existencias'),
(6, 'Eevee', 19.99, 'Figura de Pokémon', 100, 'Existencias');

SELECT 
    c.idCompra,
    c.idUsuario,
    p.idProducto,
    p.nombre AS nombreProducto,
    dc.cantidad,
    dc.precioUnitario,
    (dc.cantidad * dc.precioUnitario) AS subtotal
FROM compras c
JOIN detalleCompras dc ON c.idCompra = dc.idCompra
JOIN productos p ON dc.idProducto = p.idProducto
WHERE c.estado = 'Sin pagar' 
-- Opcional: filtrar por usuario, por ejemplo idUsuario=1
-- AND c.idUsuario = 1
ORDER BY c.fechaCompra DESC;

SELECT 
    c.idCompra,
    c.idUsuario,
    p.idProducto,
    p.nombre AS nombreProducto,
    dc.cantidad,
    dc.precioUnitario,
    (dc.cantidad * dc.precioUnitario) AS subtotal
FROM compras c
JOIN detalleCompras dc ON c.idCompra = dc.idCompra
JOIN productos p ON dc.idProducto = p.idProducto
WHERE c.estado = 'Pagado' 
-- Opcional: filtrar por usuario, por ejemplo idUsuario=1
-- AND c.idUsuario = 1
ORDER BY c.fechaCompra DESC;


select * from productos ;
select * from compras ;
select * from detalleCompras ;

DELIMITER $$

CREATE PROCEDURE sp_actualizar_rol_admin(
    IN p_idUsuario INT
)
BEGIN
    UPDATE usuarios
    SET rol = 'Admin'
    WHERE idUsuario = p_idUsuario;
END $$

DELIMITER ;

CALL sp_actualizar_rol_admin(1);






