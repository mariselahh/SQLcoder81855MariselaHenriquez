
Create database Libreria_Club_de_Lectura;
Use Libreria_Club_de_Lectura;

Create table Clientes (
cliente_id int primary key auto_increment,
nombre varchar(100),
apellido varchar(100), 
email varchar(100) unique,
fecha_alta date);

Create table Tipo_Libro (
-- Fisico, Digital
tipo_libro varchar(10) primary key);

Create table Autor (
autor_id int primary key auto_increment,
nombre varchar(100),
apellido varchar(100));

Create table Genero (
genero varchar(50) primary key);

CREATE TABLE Libros (
libro_id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(200),
autor_id int, 
genero VARCHAR(50),
tipo_libro varchar(10),
precio DECIMAL(10,2),
-- Para libros digitales puede quedar NULL
stock INT DEFAULT NULL,
-- EPUB, PDF, MOBI (solo para digitales)
formato VARCHAR(20) DEFAULT NULL, 
-- Link de descarga (solo para digitales)
enlace_descarga VARCHAR(255) DEFAULT NULL,
FOREIGN KEY (autor_id) REFERENCES Autor(autor_id),
FOREIGN KEY (genero) REFERENCES Genero(genero),
FOREIGN KEY (tipo_libro) REFERENCES Tipo_Libro(tipo_libro)
);

Create table Pedidos(
pedido_id int primary key auto_increment,
cliente_id int,
fecha_pedido date,
total decimal (20,2),
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

Create table Detalle_pedido(
detalle_id int primary key auto_increment, 
pedido_id int,
libro_id int,
cantidad int,
FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
Foreign key (libro_id) References Libros(libro_id)
);

Create table Membresias_Club_Lectura(
membresia_id int primary key auto_increment,
cliente_id int,
fecha_inicio date, 
activa boolean,
foreign key (cliente_id) references Clientes(cliente_id)
);

Create table Club_Lectura(
club_id int primary key auto_increment, 
libro_id int, 
fecha_encuentro date, 
foreign key (libro_id) References Libros(libro_id)
);

Create table Participaciones_club(
participacion_id int primary key auto_increment,
membresia_id int, 
club_id int, 
asistencia boolean,
foreign key (membresia_id) references Membresias_Club_Lectura(membresia_id),
foreign key (club_id) references Club_Lectura(club_id)
);

Create table resenas(
resena_id int primary key auto_increment, 
membresia_id int,
libro_id int,
calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
comentario VARCHAR(500),
foreign key (membresia_id) references Membresias_Club_Lectura(membresia_id),
foreign key (libro_id) References Libros(libro_id)
);


