CREATE DATABASE  IF NOT EXISTS `libreria_club_lectura` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `libreria_club_lectura`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: libreria_club_lectura
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Jorge Luis','Borges'),(2,'Julio','Cortázar'),(3,'Mariana','Enríquez'),(4,'Gabriel','García Márquez'),(5,'Carlos','Ruiz Zafón'),(6,'Stephen','King'),(7,'Virginia','Woolf'),(8,'Ray','Bradbury'),(9,'Haruki','Murakami'),(10,'Albert','Camus'),(11,'Samanta','Schweblin'),(12,'Brandon','Sanderson'),(13,'Alice','Oseman'),(14,'Cixin','Liu'),(15,'George','Orwell'),(16,'Italo','Calvino'),(17,'Margaret','Atwood'),(18,'Clarice','Lispector'),(19,'Chimamanda','Ngozi Adichie'),(20,'Philip K.','Dick'),(21,'Isabel','Allende'),(22,'Neil','Gaiman'),(23,'Ursula K.','Le Guin'),(24,'Hernán','Casciari'),(25,'Alejandra','Pizarnik'),(26,'John','Green'),(27,'Oscar','Wilde'),(28,'Mario','Vargas Llosa'),(29,'Albert','Espinosa'),(30,'Sylvia','Plath'),(31,'Rosa','Montero'),(32,'Fernando','Aramburu'),(33,'Liliana','Bodoc'),(34,'Eduardo','Galeano'),(35,'Claudia','Piñeiro'),(36,'Sara','Gallardo'),(37,'Pablo','De Santis'),(38,'Selva','Almada'),(39,'Sergio','Bizzio'),(40,'María','Dueñas');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'27345678123','Sofía','Pérez','sofi.perez@yahoo.com','2025-02-16'),(2,'20123456789','Agustín','Fernández','agus.fer@gmail.com','2025-02-16'),(3,'20228889999','Santiago','Mendoza','santi.mendoza@gmail.com','2025-02-16'),(4,'20333444556','Tomás','Martínez','tomasmtz@gmail.com','2025-02-17'),(5,'27345678901','Valentina','López','valen.lopez@gmail.com','2025-02-17'),(6,'27211222333','Martina','Moreno','marti.moreno@gmail.com','2025-02-18'),(7,'27999111222','Delfina','Carrizo','d.carrizo@gmail.com','2025-02-19'),(8,'20222333445','Mateo','Romero','mateo.romero@gmail.com','2025-02-20'),(9,'27991234123','Isabela','Herrera','isa.herrera@gmail.com','2025-02-21'),(10,'20198765432','Thiago','Sánchez','thiago_san@gmail.com','2025-02-22'),(11,'27155667788','Camila','Torres','camitorres@gmail.com','2025-02-25'),(12,'27456789123','Lucía','González','l.gonza@hotmail.com','2025-02-26'),(13,'20999888777','Benjamín','Castro','benja.castro@gmail.com','2025-02-27'),(14,'20333444666','Bruno','Díaz','brunodiaz@gmail.com','2025-02-28'),(15,'27123444666','Lola','Paz','lolapaz@gmail.com','2025-03-01'),(16,'27111222333','Emma','Silva','emma.silva@yahoo.com','2025-03-03'),(17,'20222333555','Facundo','Rojas','facu.rojas@gmail.com','2025-03-04'),(18,'20876543210','Lucas','Vega','lucas.vega@gmail.com','2025-03-05'),(19,'27444555666','Catalina','Ruiz','cata.ruiz@gmail.com','2025-03-06'),(20,'27444333221','Jazmín','Cáceres','jazcaceres@gmail.com','2025-03-07'),(21,'27233445566','Francisco','Gómez','fran.gomez@hotmail.com','2025-03-08'),(22,'20344998877','Renata','Vargas','renata.vargas@gmail.com','2025-03-09'),(23,'20112233445','Tomás','Sosa','t.sosa@yahoo.com','2025-03-09'),(24,'20456788991','Camila','Suárez','camisuarez@gmail.com','2025-03-10'),(25,'20998877665','Joaquín','Rey','joaquin.rey@gmail.com','2025-03-10'),(26,'27889900112','Luciana','Delgado','luciana.delgado@yahoo.com','2025-03-11'),(27,'27321098765','Mía','Correa','mia.correa@gmail.com','2025-03-11'),(28,'20234567891','Felipe','Molina','felipe.molina@hotmail.com','2025-03-12'),(29,'27442123344','Valeria','Benítez','valebenitez@gmail.com','2025-03-12'),(30,'20456711223','Martín','Aguirre','martin.aguirre@gmail.com','2025-03-12'),(31,'20987654321','Lorenzo','Pereyra','lorenzo.pereyra@gmail.com','2025-03-13'),(32,'27233446677','Manuela','Bravo','manuela.bravo@hotmail.com','2025-03-13'),(33,'20111222334','Ignacio','Álvarez','ignacio.alvarez@gmail.com','2025-03-14'),(34,'20889977665','Julieta','García','juligarcia@yahoo.com','2025-03-14'),(35,'20222334455','Simón','Ortiz','simon.ortiz@gmail.com','2025-03-15'),(36,'27456788990','Daniela','Paredes','daniparedes@hotmail.com','2025-03-15'),(37,'20991234567','Ramiro','Quiroga','ramiro.quiroga@gmail.com','2025-03-16'),(38,'20876543219','Agustina','Ferreyra','agustina.f@hotmail.com','2025-03-16'),(39,'27345678001','Bruno','Escobar','bruno.escobar@gmail.com','2025-03-17'),(40,'20333444111','Margarita','Ibarra','marga.ibarra@yahoo.com','2025-03-17'),(41,'27455667788','Gabriel','Soria','gabrielsoria@gmail.com','2025-03-18'),(42,'27211098765','Clara','Méndez','clara.mendez@hotmail.com','2025-03-18'),(43,'20442233445','Benicio','Recalde','benicio.recalde@gmail.com','2025-03-19'),(44,'20778889900','Emilia','Zamora','emilia.zamora@hotmail.com','2025-03-19'),(45,'20344556677','Juan','Barros','juan.barros@gmail.com','2025-03-20'),(46,'20887766554','Isidora','Campos','isidora.campos@yahoo.com','2025-03-20'),(47,'20221098765','Esteban','Coronel','esteban.coronel@gmail.com','2025-03-21'),(48,'20987611223','Milagros','Vázquez','milavazquez@hotmail.com','2025-03-21'),(49,'20444333222','Vicente','Luna','vicente.luna@gmail.com','2025-03-22'),(50,'27111223344','Josefina','Reyes','josefina.reyes@hotmail.com','2025-03-22'),(51,'20111223344','Federico','Navarro','fede.navarro@gmail.com','2025-03-23'),(52,'20233445566','Amparo','Figueroa','amparo.f@hotmail.com','2025-03-23'),(53,'20355667788','Cristóbal','Ramos','cristobal.ramos@gmail.com','2025-03-24'),(54,'20466778899','Bautista','Oliva','bauti.oliva@hotmail.com','2025-03-24'),(55,'20577889900','Elena','Acosta','elena.acosta@gmail.com','2025-03-25'),(56,'20688990011','Nicolás','Ledesma','nico.ledesma@yahoo.com','2025-03-25'),(57,'20799001122','Malena','López','malena.lopez@gmail.com','2025-03-26'),(58,'20810111213','Faustino','Miranda','faustino.miranda@hotmail.com','2025-03-26'),(59,'20921222334','Bianca','Serrano','bianca.serrano@gmail.com','2025-03-27'),(60,'20132334455','Gaspar','Silvestre','gaspar.silvestre@gmail.com','2025-03-27');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `club_sesion`
--

LOCK TABLES `club_sesion` WRITE;
/*!40000 ALTER TABLE `club_sesion` DISABLE KEYS */;
INSERT INTO `club_sesion` VALUES (1,17,'2025-03-08','Primera sesión: introducción y lectura del capítulo 1'),(2,17,'2025-03-15','Lectura parcial: capítulos 2 a 6 y exploración de Clarissa'),(3,17,'2025-03-22','Tercera sesión: capítulos 7 a 10 y evolución de Clarissa'),(4,17,'2025-03-29','Cuarta sesión: últimos capítulos y análisis de cierre'),(5,17,'2025-04-05','Sesión final: debate libre y reseñas compartidas');
/*!40000 ALTER TABLE `club_sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,6,1),(2,2,36,1),(3,3,1,1),(4,4,21,1),(5,4,31,1),(6,5,26,1),(7,5,27,1),(8,6,25,1),(9,7,8,1),(10,8,5,1),(11,9,17,1),(12,10,11,1),(13,11,24,1),(14,12,26,1),(15,13,13,1),(16,14,20,1),(17,15,16,1),(18,16,35,1),(19,17,23,1),(20,18,2,1),(21,18,9,1),(22,18,17,1),(23,19,33,1),(24,20,8,1),(25,21,29,1),(26,22,15,1),(27,22,19,1),(28,22,36,1),(29,23,35,1),(30,24,21,1),(31,25,31,1),(32,26,10,1),(33,27,7,1),(34,28,17,1),(35,29,17,1),(36,30,17,1),(37,31,17,1),(38,32,18,1),(39,33,17,1),(40,34,17,1),(41,35,18,1),(42,36,1,1),(43,37,9,1),(44,38,46,1),(45,39,41,1),(46,40,42,1),(47,41,43,1),(48,42,35,1),(49,43,38,1),(50,44,47,1),(51,45,45,1),(52,46,31,1),(53,47,50,1),(54,48,49,1),(55,49,45,1),(56,50,47,1),(57,51,48,1),(58,52,44,1),(59,53,41,1),(60,54,42,1),(61,55,46,1),(62,56,17,1),(63,57,21,1),(64,58,22,1),(65,59,11,1),(66,60,36,1),(67,61,38,1),(68,62,41,1),(69,63,44,1),(70,64,50,1),(71,65,49,1),(72,66,39,1),(73,67,3,1),(74,68,5,1),(75,69,23,1),(76,70,46,1),(77,71,48,1),(78,72,44,1),(79,73,2,1),(80,74,17,1),(81,75,21,1),(82,76,50,1),(83,77,49,1),(84,78,39,1),(85,79,3,1),(86,80,5,1),(87,81,23,1);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ficción'),(2,'No ficción'),(3,'Fantasía'),(4,'Terror'),(5,'Romance'),(6,'Ciencia ficción'),(7,'Ensayo'),(8,'Cuento'),(9,'Novela gráfica'),(10,'Infantil'),(11,'Policial'),(12,'Clásico'),(13,'Poesía'),(14,'Autobiografía'),(15,'Distopía'),(16,'Realismo mágico'),(17,'Aventura'),(18,'Drama'),(19,'Juvenil'),(20,'Misterio');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'El Aleph',1,12,1,6200.00,15,NULL),(2,'El Aleph',1,12,2,8900.00,5,NULL),(3,'El Aleph',1,12,6,4500.00,NULL,'https://libreriaclublectura.ar/descargas/el_aleph.pdf'),(4,'Rayuela',2,1,2,8700.00,10,NULL),(5,'Rayuela',2,1,3,11200.00,3,NULL),(6,'Rayuela',2,1,7,4900.00,NULL,'https://libreriaclublectura.ar/descargas/rayuela.epub'),(7,'Nuestra parte de noche',3,4,1,7200.00,12,NULL),(8,'Nuestra parte de noche',3,4,7,4300.00,NULL,'https://libreriaclublectura.ar/descargas/nuestra_parte_de_noche.epub'),(9,'Cien años de soledad',4,16,1,9500.00,7,NULL),(10,'Cien años de soledad',4,16,2,12000.00,2,NULL),(11,'Cien años de soledad',4,16,6,4800.00,NULL,'https://libreriaclublectura.ar/descargas/cien_anos.pdf'),(12,'La sombra del viento',5,20,1,7400.00,9,NULL),(13,'La sombra del viento',5,20,2,9500.00,4,NULL),(14,'La sombra del viento',5,20,7,5200.00,NULL,'https://libreriaclublectura.ar/descargas/sombra_del_viento.epub'),(15,'It',6,4,3,13500.00,2,NULL),(16,'It',6,4,8,5100.00,NULL,'https://libreriaclublectura.ar/descargas/it_kindle.epub'),(17,'La señora Dalloway',7,18,1,6100.00,10,NULL),(18,'La señora Dalloway',7,18,6,4000.00,NULL,'https://libreriaclublectura.ar/descargas/dalloway.pdf'),(19,'Fahrenheit 451',8,6,2,8800.00,8,NULL),(20,'Fahrenheit 451',8,6,7,4800.00,NULL,'https://libreriaclublectura.ar/descargas/fahrenheit.epub'),(21,'Kafka en la orilla',9,18,1,7800.00,6,NULL),(22,'Kafka en la orilla',9,18,6,4700.00,NULL,'https://libreriaclublectura.ar/descargas/kafka.pdf'),(23,'Los peligros de fumar en la cama',3,4,1,5900.00,10,NULL),(24,'El imperio final',12,3,2,9700.00,5,NULL),(25,'El imperio final',12,3,7,5600.00,NULL,'https://libreriaclublectura.ar/descargas/imperio_final.epub'),(26,'Heartstopper Vol.1',13,9,5,8200.00,20,NULL),(27,'Heartstopper Vol.2',13,9,5,8200.00,20,NULL),(28,'Heartstopper Vol.1',13,9,8,4300.00,NULL,'https://libreriaclublectura.ar/descargas/heartstopper1.epub'),(29,'El problema de los tres cuerpos',14,6,2,9400.00,6,NULL),(30,'El problema de los tres cuerpos',14,6,6,5300.00,NULL,'https://libreriaclublectura.ar/descargas'),(31,'1984',15,15,1,6800.00,10,NULL),(32,'1984',15,15,2,9700.00,3,NULL),(33,'1984',15,15,8,4900.00,NULL,'https://libreriaclublectura.ar/descargas/1984.epub'),(34,'Todos deberíamos ser feministas',19,7,1,5100.00,25,NULL),(35,'Todos deberíamos ser feministas',19,7,6,3900.00,NULL,'https://libreriaclublectura.ar/descargas/feministas.pdf'),(36,'Las ciudades invisibles',16,1,2,8900.00,6,NULL),(37,'Las ciudades invisibles',16,1,6,4800.00,NULL,'https://libreriaclublectura.ar/descargas/ciudades_invisibles.pdf'),(38,'La ridícula idea de no volver a verte',31,13,1,6900.00,8,NULL),(39,'Patria',32,1,2,9900.00,5,NULL),(40,'Patria',32,1,6,4900.00,NULL,'https://libreriaclublectura.ar/descargas/patria.pdf'),(41,'Los días del venado',33,3,2,7800.00,12,NULL),(42,'Los días del venado',33,3,7,4500.00,NULL,'https://libreriaclublectura.ar/descargas/venado.epub'),(43,'El libro de los abrazos',34,7,1,7100.00,10,NULL),(44,'El libro de los abrazos',34,7,6,4200.00,NULL,'https://libreriaclublectura.ar/descargas/abrazos.pdf'),(45,'Elena sabe',35,4,1,6500.00,9,NULL),(46,'Elena sabe',35,4,8,4300.00,NULL,'https://libreriaclublectura.ar/descargas/elena.epub'),(47,'Los galgos, los galgos',36,18,2,8600.00,6,NULL),(48,'Crímenes imperceptibles',37,11,2,8700.00,4,NULL),(49,'Ladrilleros',38,18,6,4600.00,NULL,'https://libreriaclublectura.ar/descargas/ladrilleros.pdf'),(50,'El escritor comido',39,12,1,6200.00,5,NULL);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `membresia_club`
--

LOCK TABLES `membresia_club` WRITE;
/*!40000 ALTER TABLE `membresia_club` DISABLE KEYS */;
INSERT INTO `membresia_club` VALUES (1,1,'2025-03-08',1),(2,2,'2025-03-08',1),(3,3,'2025-03-08',1),(4,5,'2025-03-08',1),(5,6,'2025-03-08',1),(6,9,'2025-03-08',1),(7,11,'2025-03-08',1),(8,13,'2025-03-08',1),(9,18,'2025-03-08',0),(10,31,'2025-04-10',1),(11,32,'2025-04-10',1),(12,33,'2025-04-11',1),(13,34,'2025-04-11',1),(14,35,'2025-04-11',1),(15,36,'2025-04-12',1),(16,37,'2025-04-12',1),(17,38,'2025-04-13',1),(18,39,'2025-04-13',1),(19,40,'2025-04-14',1);
/*!40000 ALTER TABLE `membresia_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `participacion_club`
--

LOCK TABLES `participacion_club` WRITE;
/*!40000 ALTER TABLE `participacion_club` DISABLE KEYS */;
INSERT INTO `participacion_club` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,1,3,1),(10,2,3,1),(11,3,3,1),(12,4,3,1),(13,5,3,1),(14,6,3,1),(15,7,3,1),(16,8,3,1),(17,9,3,1),(18,10,3,1),(19,1,4,1),(20,2,4,1),(21,3,4,1),(22,4,4,1),(23,5,4,1),(24,6,4,1),(25,7,4,1),(26,8,4,1),(27,9,4,1),(28,10,4,1),(29,1,5,1),(30,2,5,1),(31,3,5,1),(32,4,5,1),(33,5,5,1),(34,6,5,1),(35,7,5,1),(36,8,5,1),(37,9,5,1),(38,10,5,1);
/*!40000 ALTER TABLE `participacion_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2025-02-16',4900.00),(2,2,'2025-02-16',8900.00),(3,3,'2025-02-16',6200.00),(4,4,'2025-02-17',14600.00),(5,5,'2025-02-17',16400.00),(6,6,'2025-02-18',5600.00),(7,7,'2025-02-19',4300.00),(8,2,'2025-02-20',11200.00),(9,8,'2025-02-20',6100.00),(10,9,'2025-02-21',4800.00),(11,6,'2025-02-21',9700.00),(12,10,'2025-02-22',8200.00),(13,11,'2025-02-25',9500.00),(14,1,'2025-02-25',4800.00),(15,12,'2025-02-26',5100.00),(16,7,'2025-02-26',3900.00),(17,13,'2025-02-27',5900.00),(18,14,'2025-02-28',24500.00),(19,15,'2025-03-01',4900.00),(20,16,'2025-03-03',4300.00),(21,17,'2025-03-04',9400.00),(22,18,'2025-03-05',31200.00),(23,19,'2025-03-06',3900.00),(24,20,'2025-03-07',7800.00),(25,8,'2025-03-07',6800.00),(26,3,'2025-03-07',12000.00),(27,12,'2025-03-07',7200.00),(28,1,'2025-03-08',6100.00),(29,2,'2025-03-08',6100.00),(30,3,'2025-03-08',6100.00),(31,5,'2025-03-08',6100.00),(32,6,'2025-03-08',4000.00),(33,9,'2025-03-08',6100.00),(34,11,'2025-03-08',6100.00),(35,13,'2025-03-08',4000.00),(36,21,'2025-03-28',6200.00),(37,22,'2025-03-28',9500.00),(38,23,'2025-03-28',4300.00),(39,24,'2025-03-28',7800.00),(40,25,'2025-03-29',4500.00),(41,26,'2025-03-29',7100.00),(42,27,'2025-03-29',3900.00),(43,28,'2025-03-29',6900.00),(44,29,'2025-03-30',8600.00),(45,30,'2025-03-30',6500.00),(46,31,'2025-03-13',6800.00),(47,32,'2025-03-13',6200.00),(48,33,'2025-03-14',4600.00),(49,34,'2025-03-14',6500.00),(50,35,'2025-03-15',8600.00),(51,36,'2025-03-15',8700.00),(52,37,'2025-03-16',4200.00),(53,38,'2025-03-16',7800.00),(54,39,'2025-03-17',4500.00),(55,40,'2025-03-17',4300.00),(56,41,'2025-03-18',6100.00),(57,42,'2025-03-18',7800.00),(58,43,'2025-03-19',4700.00),(59,44,'2025-03-19',4800.00),(60,45,'2025-03-20',8900.00),(61,46,'2025-03-20',6900.00),(62,47,'2025-03-21',7800.00),(63,48,'2025-03-21',4200.00),(64,49,'2025-03-22',6200.00),(65,50,'2025-03-22',4600.00),(66,51,'2025-03-23',9900.00),(67,52,'2025-03-23',4500.00),(68,53,'2025-03-24',11200.00),(69,54,'2025-03-24',5900.00),(70,55,'2025-03-25',4300.00),(71,56,'2025-03-25',8700.00),(72,57,'2025-03-26',4200.00),(73,58,'2025-03-26',8900.00),(74,59,'2025-03-27',6100.00),(75,60,'2025-03-27',7800.00),(76,27,'2025-04-07',6200.00),(77,34,'2025-04-07',4600.00),(78,31,'2025-04-07',9900.00),(79,11,'2025-04-07',4500.00),(80,20,'2025-04-08',11200.00),(81,51,'2025-04-08',5900.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `resena`
--

LOCK TABLES `resena` WRITE;
/*!40000 ALTER TABLE `resena` DISABLE KEYS */;
INSERT INTO `resena` VALUES (1,1,17,5,'Una lectura cautivadora. Me atrapó el inicio de Clarissa en Londres.'),(2,2,17,4,'El estilo de Woolf es único. Me costó un poco seguir, pero vale la pena.'),(3,3,17,5,'Me gustó cómo se mezcla lo cotidiano con lo profundo desde el primer capítulo.'),(4,4,17,3,'No estoy tan convencido aún, pero el contexto histórico me interesa.'),(5,5,17,4,'Muy buena introducción. La perspectiva femenina me parece valiosa.'),(6,6,17,5,'Clarissa es un personaje complejo desde el primer momento. Excelente inicio.'),(7,7,17,3,'Requiere atención pero se siente literariamente poderoso.'),(8,8,17,4,'Buen primer capítulo, abre muchas posibilidades para el debate.'),(9,1,17,5,'El cierre me pareció impecable. Clarissa brilla con una intensidad poética.'),(10,2,17,4,'La evolución emocional del personaje es profunda. El final me conmovió.'),(11,3,17,5,'La narrativa fragmentada terminó siendo perfecta. Una obra redonda.'),(12,4,17,3,'Aunque complejo, el último tramo me hizo reflexionar sobre la rutina.'),(13,5,17,4,'Excelente uso del tiempo interno. Final melancólico pero poderoso.'),(14,6,17,5,'Virginia Woolf logra que lo cotidiano se vuelva trascendental.'),(15,7,17,4,'No esperaba un desenlace tan reflexivo. Me gustó mucho.'),(16,8,17,5,'La sesión final fue reveladora. El personaje se vuelve inolvidable.'),(17,9,17,4,'Muy buena estructura. Lo subjetivo y lo social se cruzan con elegancia.'),(18,10,17,3,'Aprecié el estilo, aunque me costó seguir algunos pasajes finales.');
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_libro`
--

LOCK TABLES `tipo_libro` WRITE;
/*!40000 ALTER TABLE `tipo_libro` DISABLE KEYS */;
INSERT INTO `tipo_libro` VALUES (1,'Físico','Tapa Blanda'),(2,'Físico','Tapa Dura'),(3,'Físico','Edición Especial'),(4,'Físico','Libro de Bolsillo'),(5,'Físico','Ilustrado'),(6,'Digital','PDF'),(7,'Digital','EPUB'),(8,'Digital','Kindle Edition');
/*!40000 ALTER TABLE `tipo_libro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:51:37
