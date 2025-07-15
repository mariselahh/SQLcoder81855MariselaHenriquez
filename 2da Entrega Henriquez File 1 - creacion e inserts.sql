
CREATE DATABASE Libreria_Club_Lectura;
USE Libreria_Club_Lectura;


CREATE TABLE Cliente (
  cliente_id INT PRIMARY KEY,
  cuit_cuil_cliente varchar (20) not null unique, 
  nombre_cliente VARCHAR(100),
  apellido_cliente VARCHAR(100),
  email_cliente VARCHAR(100) UNIQUE,
  fecha_alta DATE
);


CREATE TABLE Autor (
  autor_id INT PRIMARY KEY,
  nombre_autor VARCHAR(100),
  apellido_autor VARCHAR(100)
);


CREATE TABLE Genero (
  genero_id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion_genero VARCHAR(50)
);


CREATE TABLE Tipo_Libro (
tipo_libro_id INT PRIMARY KEY,
-- 'Físico', 'Digital'
tipo_libro VARCHAR(20),
-- Ej: 'PDF', 'EPUB', 'Tapa Blanda', 'Tapa Dura', 'Edicion Especial'
formato_libro VARCHAR(20)
);


CREATE TABLE Libro (
libro_id INT PRIMARY KEY,
titulo_libro VARCHAR(200),
autor_id INT,
genero_id INT,
tipo_libro_id INT,
precio DECIMAL(10,2),
stock INT DEFAULT NULL, -- Solo para libros físicos
enlace_descarga VARCHAR(255) DEFAULT NULL,
  FOREIGN KEY (autor_id) REFERENCES Autor(autor_id),
  FOREIGN KEY (genero_id) REFERENCES Genero(genero_id),
  FOREIGN KEY (tipo_libro_id) REFERENCES Tipo_Libro(tipo_libro_id)
);


CREATE TABLE Pedido (
  pedido_id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha_pedido DATE,
  total DECIMAL(20,2),
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);


CREATE TABLE Detalle_Pedido (
  detalle_id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  libro_id INT,
  cantidad INT,
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
  FOREIGN KEY (libro_id) REFERENCES Libro(libro_id)
);


CREATE TABLE Membresia_Club (
  membresia_id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha_inicio DATE,
  activa BOOLEAN,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);


CREATE TABLE Club_sesion (
  club_id INT PRIMARY KEY AUTO_INCREMENT,
  libro_id INT,
  fecha_encuentro DATE,
  tema_club VARCHAR(100),
  FOREIGN KEY (libro_id) REFERENCES Libro(libro_id)
);


CREATE TABLE Participacion_Club (
  participacion_id INT PRIMARY KEY AUTO_INCREMENT,
  membresia_id INT,
  club_id INT,
  asistencia BOOLEAN,
  FOREIGN KEY (membresia_id) REFERENCES Membresia_Club(membresia_id),
  FOREIGN KEY (club_id) REFERENCES Club_sesion(club_id)
);


CREATE TABLE Resena (
  resena_id INT PRIMARY KEY AUTO_INCREMENT,
  membresia_id INT,
  libro_id INT,
  calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
  comentario VARCHAR(500),
  FOREIGN KEY (membresia_id) REFERENCES Membresia_Club(membresia_id),
  FOREIGN KEY (libro_id) REFERENCES Libro(libro_id)
);


INSERT INTO Cliente (cliente_id, cuit_cuil_cliente, nombre_cliente, apellido_cliente, email_cliente, fecha_alta) VALUES
('1','27345678123','Sofía','Pérez','sofi.perez@yahoo.com','2025-02-16'),
('2','20123456789','Agustín','Fernández','agus.fer@gmail.com','2025-02-16'),
('3','20228889999','Santiago','Mendoza','santi.mendoza@gmail.com','2025-02-16'),
('4','20333444556','Tomás','Martínez','tomasmtz@gmail.com','2025-02-17'),
('5','27345678901','Valentina','López','valen.lopez@gmail.com','2025-02-17'),
('6','27211222333','Martina','Moreno','marti.moreno@gmail.com','2025-02-18'),
('7','27999111222','Delfina','Carrizo','d.carrizo@gmail.com','2025-02-19'),
('8','20222333445','Mateo','Romero','mateo.romero@gmail.com','2025-02-20'),
('9','27991234123','Isabela','Herrera','isa.herrera@gmail.com','2025-02-21'),
('10','20198765432','Thiago','Sánchez','thiago_san@gmail.com','2025-02-22'),
('11','27155667788','Camila','Torres','camitorres@gmail.com','2025-02-25'),
('12','27456789123','Lucía','González','l.gonza@hotmail.com','2025-02-26'),
('13','20999888777','Benjamín','Castro','benja.castro@gmail.com','2025-02-27'),
('14','20333444666','Bruno','Díaz','brunodiaz@gmail.com','2025-02-28'),
('15','27123444666','Lola','Paz','lolapaz@gmail.com','2025-03-01'),
('16','27111222333','Emma','Silva','emma.silva@yahoo.com','2025-03-03'),
('17','20222333555','Facundo','Rojas','facu.rojas@gmail.com','2025-03-04'),
('18','20876543210','Lucas','Vega','lucas.vega@gmail.com','2025-03-05'),
('19','27444555666','Catalina','Ruiz','cata.ruiz@gmail.com','2025-03-06'),
('20','27444333221','Jazmín','Cáceres','jazcaceres@gmail.com','2025-03-07');


INSERT INTO Autor (autor_id, nombre_autor, apellido_autor) VALUES
('1' , 'Jorge Luis', 'Borges'),
('2', 'Julio', 'Cortázar'),
('3', 'Mariana', 'Enríquez'),
('4', 'Gabriel', 'García Márquez'),
('5', 'Carlos', 'Ruiz Zafón'),
('6', 'Stephen', 'King'),
('7', 'Virginia', 'Woolf'),
('8', 'Ray', 'Bradbury'),
('9', 'Haruki', 'Murakami'),
('10', 'Albert', 'Camus'),
('11', 'Samanta', 'Schweblin'),
('12', 'Brandon', 'Sanderson'),
('13', 'Alice', 'Oseman'),
('14', 'Cixin', 'Liu'),
('15', 'George', 'Orwell'),
('16', 'Italo', 'Calvino'),
('17', 'Margaret', 'Atwood'),
('18', 'Clarice', 'Lispector'),
('19', 'Chimamanda', 'Ngozi Adichie'),
('20', 'Philip K.', 'Dick'),
('21', 'Isabel', 'Allende'),
('22', 'Neil', 'Gaiman'),
('23', 'Ursula K.', 'Le Guin'),
('24', 'Hernán', 'Casciari'),
('25', 'Alejandra', 'Pizarnik'),
('26', 'John', 'Green'),
('27', 'Oscar', 'Wilde'),
('28', 'Mario', 'Vargas Llosa'),
('29', 'Albert', 'Espinosa'),
('30', 'Sylvia', 'Plath');


INSERT INTO Genero (descripcion_genero) VALUES
('Ficción'),
('No ficción'),
('Fantasía'),
('Terror'),
('Romance'),
('Ciencia ficción'),
('Ensayo'),
('Cuento'),
('Novela gráfica'),
('Infantil'),
('Policial'),
('Clásico'),
('Poesía'),
('Autobiografía'),
('Distopía'),
('Realismo mágico'),
('Aventura'),
('Drama'),
('Juvenil'),
('Misterio');

INSERT INTO Tipo_Libro (tipo_libro_id, tipo_libro, formato_libro) VALUES
('1', 'Físico', 'Tapa Blanda'),
('2', 'Físico', 'Tapa Dura'),
('3', 'Físico', 'Edición Especial'),
('4', 'Físico', 'Libro de Bolsillo'),
('5', 'Físico', 'Ilustrado'),
('6', 'Digital', 'PDF'),
('7', 'Digital', 'EPUB'),
('8', 'Digital', 'Kindle Edition');

INSERT INTO Libro (libro_id, titulo_libro, autor_id, genero_id, tipo_libro_id, precio, stock, enlace_descarga) Values
('1', 'El Aleph', 1, 12, 1, 6200.00, 15, NULL),
('2', 'El Aleph', 1, 12, 2, 8900.00, 5, NULL),
('3', 'El Aleph', 1, 12, 6, 4500.00, NULL, 'https://libreriaclublectura.ar/descargas/el_aleph.pdf'),
('4', 'Rayuela', 2, 1, 2, 8700.00, 10, NULL),
('5', 'Rayuela', 2, 1, 3, 11200.00, 3, NULL),
('6', 'Rayuela', 2, 1, 7, 4900.00, NULL, 'https://libreriaclublectura.ar/descargas/rayuela.epub'),
('7', 'Nuestra parte de noche', 3, 4, 1, 7200.00, 12, NULL),
('8', 'Nuestra parte de noche', 3, 4, 7, 4300.00, NULL, 'https://libreriaclublectura.ar/descargas/nuestra_parte_de_noche.epub'),
('9', 'Cien años de soledad', 4, 16, 1, 9500.00, 7, NULL),
('10', 'Cien años de soledad', 4, 16, 2, 12000.00, 2, NULL),
('11', 'Cien años de soledad', 4, 16, 6, 4800.00, NULL, 'https://libreriaclublectura.ar/descargas/cien_anos.pdf'),
('12', 'La sombra del viento', 5, 20, 1, 7400.00, 9, NULL),
('13', 'La sombra del viento', 5, 20, 2, 9500.00, 4, NULL),
('14', 'La sombra del viento', 5, 20, 7, 5200.00, NULL, 'https://libreriaclublectura.ar/descargas/sombra_del_viento.epub'),
('15', 'It', 6, 4, 3, 13500.00, 2, NULL),
('16', 'It', 6, 4, 8, 5100.00, NULL, 'https://libreriaclublectura.ar/descargas/it_kindle.epub'),
('17', 'La señora Dalloway', 7, 18, 1, 6100.00, 10, NULL),
('18', 'La señora Dalloway', 7, 18, 6, 4000.00, NULL, 'https://libreriaclublectura.ar/descargas/dalloway.pdf'),
('19', 'Fahrenheit 451', 8, 6, 2, 8800.00, 8, NULL),
('20', 'Fahrenheit 451', 8, 6, 7, 4800.00, NULL, 'https://libreriaclublectura.ar/descargas/fahrenheit.epub'),
('21', 'Kafka en la orilla', 9, 18, 1, 7800.00, 6, NULL),
('22', 'Kafka en la orilla', 9, 18, 6, 4700.00, NULL, 'https://libreriaclublectura.ar/descargas/kafka.pdf'),
('23', 'Los peligros de fumar en la cama', 3, 4, 1, 5900.00, 10, NULL),
('24', 'El imperio final', 12, 3, 2, 9700.00, 5, NULL),
('25', 'El imperio final', 12, 3, 7, 5600.00, NULL, 'https://libreriaclublectura.ar/descargas/imperio_final.epub'),
('26', 'Heartstopper Vol.1', 13, 9, 5, 8200.00, 20, NULL),
('27', 'Heartstopper Vol.2', 13, 9, 5, 8200.00, 20, NULL),
('28', 'Heartstopper Vol.1', 13, 9, 8, 4300.00, NULL, 'https://libreriaclublectura.ar/descargas/heartstopper1.epub'),
('29', 'El problema de los tres cuerpos', 14, 6, 2, 9400.00, 6, NULL),
('30', 'El problema de los tres cuerpos', 14, 6, 6, 5300.00, NULL, 'https://libreriaclublectura.ar/descargas'),
('31', '1984', 15, 15, 1, 6800.00, 10, NULL),
('32', '1984', 15, 15, 2, 9700.00, 3, NULL),
('33', '1984', 15, 15, 8, 4900.00, NULL, 'https://libreriaclublectura.ar/descargas/1984.epub'),
('34', 'Todos deberíamos ser feministas', 19, 7, 1, 5100.00, 25, NULL),
('35', 'Todos deberíamos ser feministas', 19, 7, 6, 3900.00, NULL, 'https://libreriaclublectura.ar/descargas/feministas.pdf'),
('36', 'Las ciudades invisibles', 16, 1, 2, 8900.00, 6, NULL),
('37', 'Las ciudades invisibles', 16, 1, 6, 4800.00, NULL, 'https://libreriaclublectura.ar/descargas/ciudades_invisibles.pdf');

INSERT INTO Pedido (cliente_id, fecha_pedido, total) VALUES
(1, '2025-02-16', 4900.00),
(2, '2025-02-16', 8900.00),
(3, '2025-02-16', 6200.00),
(4, '2025-02-17', 14600.00),
(5, '2025-02-17', 16400.00),
(6, '2025-02-18', 5600.00),
(7, '2025-02-19', 4300.00),
(2, '2025-02-20', 11200.00),
(8, '2025-02-20', 6100.00),
(9, '2025-02-21', 4800.00),
(6, '2025-02-21', 9700.00),
(10, '2025-02-22', 8200.00),
(11, '2025-02-25', 9500.00),
(1, '2025-02-25', 4800.00),
(12, '2025-02-26', 5100.00),
(7, '2025-02-26', 3900.00),
(13, '2025-02-27', 5900.00),
(14, '2025-02-28', 24500.00),
(15, '2025-03-01', 4900.00),
(16, '2025-03-03', 4300.00),
(17, '2025-03-04', 9400.00),
(18, '2025-03-05', 31200.00),
(19, '2025-03-06', 3900.00),
(20, '2025-03-07', 7800.00),
(8, '2025-03-07', 6800.00),
(3, '2025-03-07', 12000.00),
(12, '2025-03-07', 7200.00);

INSERT INTO Detalle_Pedido (pedido_id, libro_id, cantidad) VALUES
(1, 6, 1),
(2, 36, 1),
(3, 1, 1),
(4, 21, 1),
(4, 31, 1),
(5, 26, 1),
(5, 27, 1),
(6, 25, 1),
(7, 8, 1),
(8, 5, 1),
(9, 17, 1),
(10, 11, 1),
(11, 24, 1),
(12, 26, 1),
(13, 13, 1),
(14, 20, 1),
(15, 16, 1),
(16, 35, 1),
(17, 23, 1),
(18, 2, 1),
(18, 9, 1),
(18, 17, 1),
(19, 33, 1),
(20, 8, 1),
(21, 29, 1),
(22, 15, 1),
(22, 19, 1),
(22, 36, 1),
(23, 35, 1),
(24, 21, 1),
(25, 31, 1),
(26, 10, 1),
(27, 7, 1);

INSERT INTO Pedido (cliente_id, fecha_pedido, total) VALUES
(1, '2025-03-08', 6100.00),
(2, '2025-03-08', 6100.00),
(3, '2025-03-08', 6100.00),
(5, '2025-03-08', 6100.00),
(6, '2025-03-08', 4000.00),
(9, '2025-03-08', 6100.00),
(11, '2025-03-08', 6100.00),
(13, '2025-03-08', 4000.00);

INSERT INTO Detalle_Pedido (pedido_id, libro_id, cantidad) VALUES
(28, 17, 1),
(29, 17, 1),
(30, 17, 1),
(31, 17, 1),
(32, 18, 1),
(33, 17, 1),
(34, 17, 1),
(35, 18, 1);

INSERT INTO Membresia_Club (cliente_id, fecha_inicio, activa)VALUES
(1, '2025-03-08', TRUE),
(2, '2025-03-08', TRUE),
(3, '2025-03-08', TRUE),
(5, '2025-03-08', TRUE),
(6, '2025-03-08', TRUE),
(9, '2025-03-08', TRUE),
(11, '2025-03-08', TRUE),
(13, '2025-03-08', TRUE);

INSERT INTO Club_sesion (libro_id, fecha_encuentro, tema_club) VALUES
(17, '2025-03-08', 'Primera sesión: introducción y lectura del capítulo 1'),
(17, '2025-03-15', 'Lectura parcial: capítulos 2 a 6 y exploración de Clarissa');

INSERT INTO Participacion_Club (membresia_id, club_id, asistencia) VALUES
(1, 1, TRUE),
(2, 1, TRUE),
(3, 1, TRUE),
(4, 1, TRUE),
(5, 1, TRUE),
(6, 1, TRUE),
(7, 1, TRUE),
(8, 1, TRUE);

INSERT INTO Resena (membresia_id, libro_id, calificacion, comentario) VALUES
(1, 17, 5, 'Una lectura cautivadora. Me atrapó el inicio de Clarissa en Londres.'),
(2, 17, 4, 'El estilo de Woolf es único. Me costó un poco seguir, pero vale la pena.'),
(3, 17, 5, 'Me gustó cómo se mezcla lo cotidiano con lo profundo desde el primer capítulo.'),
(4, 17, 3, 'No estoy tan convencido aún, pero el contexto histórico me interesa.'),
(5, 17, 4, 'Muy buena introducción. La perspectiva femenina me parece valiosa.'),
(6, 17, 5, 'Clarissa es un personaje complejo desde el primer momento. Excelente inicio.'),
(7, 17, 3, 'Requiere atención pero se siente literariamente poderoso.'),
(8, 17, 4, 'Buen primer capítulo, abre muchas posibilidades para el debate.');

INSERT INTO Membresia_Club (cliente_id, fecha_inicio, activa) VALUES
(18, '2025-03-08', FALSE);

INSERT INTO Cliente (cliente_id, cuit_cuil_cliente, nombre_cliente, apellido_cliente, email_cliente, fecha_alta)VALUES
('21','27233445566','Francisco','Gómez','fran.gomez@hotmail.com','2025-03-08'),
('22','20344998877','Renata','Vargas','renata.vargas@gmail.com','2025-03-09'),
('23','20112233445','Tomás','Sosa','t.sosa@yahoo.com','2025-03-09'),
('24','20456788991','Camila','Suárez','camisuarez@gmail.com','2025-03-10'),
('25','20998877665','Joaquín','Rey','joaquin.rey@gmail.com','2025-03-10'),
('26','27889900112','Luciana','Delgado','luciana.delgado@yahoo.com','2025-03-11'),
('27','27321098765','Mía','Correa','mia.correa@gmail.com','2025-03-11'),
('28','20234567891','Felipe','Molina','felipe.molina@hotmail.com','2025-03-12'),
('29','27442123344','Valeria','Benítez','valebenitez@gmail.com','2025-03-12'),
('30','20456711223','Martín','Aguirre','martin.aguirre@gmail.com','2025-03-12'),
('31','20987654321','Lorenzo','Pereyra','lorenzo.pereyra@gmail.com','2025-03-13'),
('32','27233446677','Manuela','Bravo','manuela.bravo@hotmail.com','2025-03-13'),
('33','20111222334','Ignacio','Álvarez','ignacio.alvarez@gmail.com','2025-03-14'),
('34','20889977665','Julieta','García','juligarcia@yahoo.com','2025-03-14'),
('35','20222334455','Simón','Ortiz','simon.ortiz@gmail.com','2025-03-15'),
('36','27456788990','Daniela','Paredes','daniparedes@hotmail.com','2025-03-15'),
('37','20991234567','Ramiro','Quiroga','ramiro.quiroga@gmail.com','2025-03-16'),
('38','20876543219','Agustina','Ferreyra','agustina.f@hotmail.com','2025-03-16'),
('39','27345678001','Bruno','Escobar','bruno.escobar@gmail.com','2025-03-17'),
('40','20333444111','Margarita','Ibarra','marga.ibarra@yahoo.com','2025-03-17'),
('41','27455667788','Gabriel','Soria','gabrielsoria@gmail.com','2025-03-18'),
('42','27211098765','Clara','Méndez','clara.mendez@hotmail.com','2025-03-18'),
('43','20442233445','Benicio','Recalde','benicio.recalde@gmail.com','2025-03-19'),
('44','20778889900','Emilia','Zamora','emilia.zamora@hotmail.com','2025-03-19'),
('45','20344556677','Juan','Barros','juan.barros@gmail.com','2025-03-20'),
('46','20887766554','Isidora','Campos','isidora.campos@yahoo.com','2025-03-20'),
('47','20221098765','Esteban','Coronel','esteban.coronel@gmail.com','2025-03-21'),
('48','20987611223','Milagros','Vázquez','milavazquez@hotmail.com','2025-03-21'),
('49','20444333222','Vicente','Luna','vicente.luna@gmail.com','2025-03-22'),
('50','27111223344','Josefina','Reyes','josefina.reyes@hotmail.com','2025-03-22'),
('51','20111223344','Federico','Navarro','fede.navarro@gmail.com','2025-03-23'),
('52','20233445566','Amparo','Figueroa','amparo.f@hotmail.com','2025-03-23'),
('53','20355667788','Cristóbal','Ramos','cristobal.ramos@gmail.com','2025-03-24'),
('54','20466778899','Bautista','Oliva','bauti.oliva@hotmail.com','2025-03-24'),
('55','20577889900','Elena','Acosta','elena.acosta@gmail.com','2025-03-25'),
('56','20688990011','Nicolás','Ledesma','nico.ledesma@yahoo.com','2025-03-25'),
('57','20799001122','Malena','López','malena.lopez@gmail.com','2025-03-26'),
('58','20810111213','Faustino','Miranda','faustino.miranda@hotmail.com','2025-03-26'),
('59','20921222334','Bianca','Serrano','bianca.serrano@gmail.com','2025-03-27'),
('60','20132334455','Gaspar','Silvestre','gaspar.silvestre@gmail.com','2025-03-27');

INSERT INTO Autor (autor_id, nombre_autor, apellido_autor) VALUES
('31', 'Rosa', 'Montero'),
('32', 'Fernando', 'Aramburu'),
('33', 'Liliana', 'Bodoc'),
('34', 'Eduardo', 'Galeano'),
('35', 'Claudia', 'Piñeiro'),
('36', 'Sara', 'Gallardo'),
('37', 'Pablo', 'De Santis'),
('38', 'Selva', 'Almada'),
('39', 'Sergio', 'Bizzio'),
('40', 'María', 'Dueñas');

INSERT INTO Libro (libro_id, titulo_libro, autor_id, genero_id, tipo_libro_id, precio, stock, enlace_descarga) VALUES
('38', 'La ridícula idea de no volver a verte', 31, 13, 1, 6900.00, 8, NULL),
('39', 'Patria', 32, 1, 2, 9900.00, 5, NULL),
('40', 'Patria', 32, 1, 6, 4900.00, NULL, 'https://libreriaclublectura.ar/descargas/patria.pdf'),
('41', 'Los días del venado', 33, 3, 2, 7800.00, 12, NULL),
('42', 'Los días del venado', 33, 3, 7, 4500.00, NULL, 'https://libreriaclublectura.ar/descargas/venado.epub'),
('43', 'El libro de los abrazos', 34, 7, 1, 7100.00, 10, NULL),
('44', 'El libro de los abrazos', 34, 7, 6, 4200.00, NULL, 'https://libreriaclublectura.ar/descargas/abrazos.pdf'),
('45', 'Elena sabe', 35, 4, 1, 6500.00, 9, NULL),
('46', 'Elena sabe', 35, 4, 8, 4300.00, NULL, 'https://libreriaclublectura.ar/descargas/elena.epub'),
('47', 'Los galgos, los galgos', 36, 18, 2, 8600.00, 6, NULL),
('48', 'Crímenes imperceptibles', 37, 11, 2, 8700.00, 4, NULL),
('49', 'Ladrilleros', 38, 18, 6, 4600.00, NULL, 'https://libreriaclublectura.ar/descargas/ladrilleros.pdf'),
('50', 'El escritor comido', 39, 12, 1, 6200.00, 5, NULL);

INSERT INTO Pedido (cliente_id, fecha_pedido, total) VALUES
(21, '2025-03-28', 6200.00),
(22, '2025-03-28', 9500.00),
(23, '2025-03-28', 4300.00),
(24, '2025-03-28', 7800.00),
(25, '2025-03-29', 4500.00),
(26, '2025-03-29', 7100.00),
(27, '2025-03-29', 3900.00),
(28, '2025-03-29', 6900.00),
(29, '2025-03-30', 8600.00),
(30, '2025-03-30', 6500.00),
(31, '2025-03-13', 6800.00),
(32, '2025-03-13', 6200.00),
(33, '2025-03-14', 4600.00),
(34, '2025-03-14', 6500.00),
(35, '2025-03-15', 8600.00),
(36, '2025-03-15', 8700.00),
(37, '2025-03-16', 4200.00),
(38, '2025-03-16', 7800.00),
(39, '2025-03-17', 4500.00),
(40, '2025-03-17', 4300.00),
(41, '2025-03-18', 6100.00),
(42, '2025-03-18', 7800.00),
(43, '2025-03-19', 4700.00),
(44, '2025-03-19', 4800.00),
(45, '2025-03-20', 8900.00),
(46, '2025-03-20', 6900.00),
(47, '2025-03-21', 7800.00),
(48, '2025-03-21', 4200.00),
(49, '2025-03-22', 6200.00),
(50, '2025-03-22', 4600.00),
(51, '2025-03-23', 9900.00),
(52, '2025-03-23', 4500.00),
(53, '2025-03-24', 11200.00),
(54, '2025-03-24', 5900.00),
(55, '2025-03-25', 4300.00),
(56, '2025-03-25', 8700.00),
(57, '2025-03-26', 4200.00),
(58, '2025-03-26', 8900.00),
(59, '2025-03-27', 6100.00),
(60, '2025-03-27', 7800.00),
(27, '2025-04-07', 6200.00),
(34, '2025-04-07', 4600.00),
(31, '2025-04-07', 9900.00),
(11, '2025-04-07', 4500.00),
(20, '2025-04-08', 11200.00),
(51, '2025-04-08', 5900.00);

INSERT INTO Detalle_Pedido (pedido_id, libro_id, cantidad) VALUES
(36, 1, 1),
(37, 9, 1),
(38, 46, 1),
(39, 41, 1),
(40, 42, 1),
(41, 43, 1),
(42, 35, 1),
(43, 38, 1),
(44, 47, 1),
(45, 45, 1),
(46, 31, 1),
(47, 50, 1),
(48, 49, 1),
(49, 45, 1),
(50, 47, 1),
(51, 48, 1),
(52, 44, 1),
(53, 41, 1),
(54, 42, 1),
(55, 46, 1),
(56, 17, 1),
(57, 21, 1),
(58, 22, 1),
(59, 11, 1),
(60, 36, 1),
(61, 38, 1),
(62, 41, 1),
(63, 44, 1),
(64, 50, 1),
(65, 49, 1),
(66, 39, 1),
(67, 3, 1),
(68, 5, 1),
(69, 23, 1),
(70, 46, 1),
(71, 48, 1),
(72, 44, 1),
(73, 2, 1),
(74, 17, 1),
(75, 21, 1),
(76, 50, 1),
(77, 49, 1),
(78, 39, 1),
(79, 3, 1),
(80, 5, 1),
(81, 23, 1);

INSERT INTO Membresia_Club (cliente_id, fecha_inicio, activa) VALUES
(31, '2025-04-10', TRUE),
(32, '2025-04-10', TRUE),
(33, '2025-04-11', TRUE),
(34, '2025-04-11', TRUE),
(35, '2025-04-11', TRUE),
(36, '2025-04-12', TRUE),
(37, '2025-04-12', TRUE),
(38, '2025-04-13', TRUE),
(39, '2025-04-13', TRUE),
(40, '2025-04-14', TRUE);

INSERT INTO Club_sesion (libro_id, fecha_encuentro, tema_club) VALUES
(17, '2025-03-22', 'Tercera sesión: capítulos 7 a 10 y evolución de Clarissa'),
(17, '2025-03-29', 'Cuarta sesión: últimos capítulos y análisis de cierre'),
(17, '2025-04-05', 'Sesión final: debate libre y reseñas compartidas');

INSERT INTO Participacion_Club (membresia_id, club_id, asistencia) VALUES
(1, 3, TRUE),
(2, 3, TRUE),
(3, 3, TRUE),
(4, 3, TRUE),
(5, 3, TRUE),
(6, 3, TRUE),
(7, 3, TRUE),
(8, 3, TRUE),
(9, 3, TRUE),
(10, 3, TRUE),
(1, 4, TRUE),
(2, 4, TRUE),
(3, 4, TRUE),
(4, 4, TRUE),
(5, 4, TRUE),
(6, 4, TRUE),
(7, 4, TRUE),
(8, 4, TRUE),
(9, 4, TRUE),
(10, 4, TRUE),
(1, 5, TRUE),
(2, 5, TRUE),
(3, 5, TRUE),
(4, 5, TRUE),
(5, 5, TRUE),
(6, 5, TRUE),
(7, 5, TRUE),
(8, 5, TRUE),
(9, 5, TRUE),
(10, 5, TRUE);

INSERT INTO Resena (membresia_id, libro_id, calificacion, comentario) VALUES
(1, 17, 5, 'El cierre me pareció impecable. Clarissa brilla con una intensidad poética.'),
(2, 17, 4, 'La evolución emocional del personaje es profunda. El final me conmovió.'),
(3, 17, 5, 'La narrativa fragmentada terminó siendo perfecta. Una obra redonda.'),
(4, 17, 3, 'Aunque complejo, el último tramo me hizo reflexionar sobre la rutina.'),
(5, 17, 4, 'Excelente uso del tiempo interno. Final melancólico pero poderoso.'),
(6, 17, 5, 'Virginia Woolf logra que lo cotidiano se vuelva trascendental.'),
(7, 17, 4, 'No esperaba un desenlace tan reflexivo. Me gustó mucho.'),
(8, 17, 5, 'La sesión final fue reveladora. El personaje se vuelve inolvidable.'),
(9, 17, 4, 'Muy buena estructura. Lo subjetivo y lo social se cruzan con elegancia.'),
(10, 17, 3, 'Aprecié el estilo, aunque me costó seguir algunos pasajes finales.');
