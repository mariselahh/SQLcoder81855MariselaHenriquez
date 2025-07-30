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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autor_id` int NOT NULL,
  `nombre_autor` varchar(100) DEFAULT NULL,
  `apellido_autor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`autor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL,
  `cuit_cuil_cliente` varchar(20) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `apellido_cliente` varchar(100) DEFAULT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cuit_cuil_cliente` (`cuit_cuil_cliente`),
  UNIQUE KEY `email_cliente` (`email_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Formatear_Email_Cliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
  SET NEW.email_cliente = TRIM(LOWER(REPLACE(NEW.email_cliente,' ','')));
  IF INSTR(NEW.email_cliente, '@') = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo debe contener un símbolo "@".';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `clientes_frecuentes_detallada`
--

DROP TABLE IF EXISTS `clientes_frecuentes_detallada`;
/*!50001 DROP VIEW IF EXISTS `clientes_frecuentes_detallada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientes_frecuentes_detallada` AS SELECT 
 1 AS `cliente_id`,
 1 AS `nombre_completo`,
 1 AS `email_cliente`,
 1 AS `cantidad_pedidos`,
 1 AS `gasto_total`,
 1 AS `estado_club`,
 1 AS `sesiones_participadas`,
 1 AS `genero_favorito`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `club_sesion`
--

DROP TABLE IF EXISTS `club_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_sesion` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `libro_id` int DEFAULT NULL,
  `fecha_encuentro` date DEFAULT NULL,
  `tema_club` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`club_id`),
  KEY `libro_id` (`libro_id`),
  CONSTRAINT `club_sesion_ibfk_1` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int DEFAULT NULL,
  `libro_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `libro_id` (`libro_id`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `engagement_club_lectura`
--

DROP TABLE IF EXISTS `engagement_club_lectura`;
/*!50001 DROP VIEW IF EXISTS `engagement_club_lectura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `engagement_club_lectura` AS SELECT 
 1 AS `membresia_id`,
 1 AS `miembro`,
 1 AS `sesiones_asistidas`,
 1 AS `cantidad_resenas`,
 1 AS `promedio_calificacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `genero_id` int NOT NULL AUTO_INCREMENT,
  `descripcion_genero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`genero_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `libro_id` int NOT NULL,
  `titulo_libro` varchar(200) DEFAULT NULL,
  `autor_id` int DEFAULT NULL,
  `genero_id` int DEFAULT NULL,
  `tipo_libro_id` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `enlace_descarga` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`libro_id`),
  KEY `autor_id` (`autor_id`),
  KEY `genero_id` (`genero_id`),
  KEY `tipo_libro_id` (`tipo_libro_id`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`genero_id`),
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`tipo_libro_id`) REFERENCES `tipo_libro` (`tipo_libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Prevenir_Eliminacion_Libro_Con_Pedidos` BEFORE DELETE ON `libro` FOR EACH ROW BEGIN
  IF EXISTS (
    SELECT 1 FROM Detalle_Pedido
    WHERE libro_id = OLD.libro_id
  ) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro no puede eliminarse porque está vinculado a pedidos.';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `libros_mas_vendidos_ultimos_meses`
--

DROP TABLE IF EXISTS `libros_mas_vendidos_ultimos_meses`;
/*!50001 DROP VIEW IF EXISTS `libros_mas_vendidos_ultimos_meses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `libros_mas_vendidos_ultimos_meses` AS SELECT 
 1 AS `libro_id`,
 1 AS `titulo_libro`,
 1 AS `autor`,
 1 AS `formato_libro`,
 1 AS `mes_venta`,
 1 AS `unidades_vendidas`,
 1 AS `total_recaudado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membresia_club`
--

DROP TABLE IF EXISTS `membresia_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia_club` (
  `membresia_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`membresia_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `membresia_club_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `participacion_club`
--

DROP TABLE IF EXISTS `participacion_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participacion_club` (
  `participacion_id` int NOT NULL AUTO_INCREMENT,
  `membresia_id` int DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  `asistencia` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`participacion_id`),
  KEY `membresia_id` (`membresia_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `participacion_club_ibfk_1` FOREIGN KEY (`membresia_id`) REFERENCES `membresia_club` (`membresia_id`),
  CONSTRAINT `participacion_club_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `club_sesion` (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resena`
--

DROP TABLE IF EXISTS `resena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resena` (
  `resena_id` int NOT NULL AUTO_INCREMENT,
  `membresia_id` int DEFAULT NULL,
  `libro_id` int DEFAULT NULL,
  `calificacion` int DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`resena_id`),
  KEY `membresia_id` (`membresia_id`),
  KEY `libro_id` (`libro_id`),
  CONSTRAINT `resena_ibfk_1` FOREIGN KEY (`membresia_id`) REFERENCES `membresia_club` (`membresia_id`),
  CONSTRAINT `resena_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`),
  CONSTRAINT `resena_chk_1` CHECK ((`calificacion` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `stock_libros`
--

DROP TABLE IF EXISTS `stock_libros`;
/*!50001 DROP VIEW IF EXISTS `stock_libros`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stock_libros` AS SELECT 
 1 AS `libro_id`,
 1 AS `titulo_libro`,
 1 AS `autor`,
 1 AS `genero`,
 1 AS `formato_libro`,
 1 AS `stock`,
 1 AS `estado_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tipo_libro`
--

DROP TABLE IF EXISTS `tipo_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_libro` (
  `tipo_libro_id` int NOT NULL,
  `tipo_libro` varchar(20) DEFAULT NULL,
  `formato_libro` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tipo_libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `ventas_por_formato`
--

DROP TABLE IF EXISTS `ventas_por_formato`;
/*!50001 DROP VIEW IF EXISTS `ventas_por_formato`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_por_formato` AS SELECT 
 1 AS `tipo_libro`,
 1 AS `formato_libro`,
 1 AS `titulos_vendidos`,
 1 AS `unidades_vendidas`,
 1 AS `total_recaudado`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'libreria_club_lectura'
--

--
-- Dumping routines for database 'libreria_club_lectura'
--
/*!50003 DROP FUNCTION IF EXISTS `Proxima_Reposicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Proxima_Reposicion`(libro INT) RETURNS date
    DETERMINISTIC
BEGIN 
DECLARE frecuencia_dias INT; 
DECLARE ultima_venta DATE; 
DECLARE stock_actual INT; 

-- 1 obtener las veces que se ha vendido un libro
SELECT COUNT(*) INTO frecuencia_dias 
FROM Detalle_Pedido dp 
JOIN Pedido p ON dp.pedido_id = p.pedido_id 
WHERE dp.libro_id = libro; 

-- 2 obtener la fecha de la ultima venta del libro
SELECT MAX(p.fecha_pedido) INTO ultima_venta
FROM Detalle_Pedido dp JOIN Pedido p ON dp.pedido_id = p.pedido_id 
WHERE dp.libro_id = libro; 

-- 3 obtener el stock actual del libro
SELECT stock INTO stock_actual 
FROM Libro WHERE libro_id = libro; 

-- 4  Calcula y devuelve la fecha estimada de proxima reposición
-- La fórmula asume que cada unidad vendida representa 7 días de reposición promedio.
RETURN DATE_ADD(ultima_venta, INTERVAL (stock_actual * 7 / frecuencia_dias) DAY); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `resumen_cliente_por_cuit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `resumen_cliente_por_cuit`(cuit_cliente VARCHAR(20)) RETURNS varchar(500) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE id_cliente INT DEFAULT NULL;
DECLARE nombre VARCHAR(50) DEFAULT 'No encontrado';
DECLARE apellido VARCHAR(50) DEFAULT 'No encontrado';
DECLARE en_club VARCHAR(2) DEFAULT 'No';
DECLARE total_compras INT DEFAULT 0;
DECLARE genero_top VARCHAR(50) DEFAULT 'Sin datos';
DECLARE formato_top VARCHAR(50) DEFAULT 'Sin datos';
DECLARE resultado VARCHAR(500);

-- 1 busca el cliente por cuit y si no lo encuentra devuelve mensaje 
SELECT cliente_id, nombre_cliente, apellido_cliente
INTO id_cliente, nombre, apellido
FROM Cliente
WHERE cuit_cuil_cliente = cuit_cliente;
IF id_cliente IS NULL THEN
RETURN CONCAT('CUIT ', cuit_cliente, ' no registrado como cliente.');
END IF;

-- 2 verifica si es miembro del club
SELECT CASE 
WHEN COUNT(*) > 0 THEN 'Sí'
ELSE 'No'
END
INTO en_club
FROM Membresia_Club
WHERE cliente_id = id_cliente;

-- 3 cuenta la cantidad de compras que ha realizado
SELECT COUNT(*) 
INTO total_compras
FROM Pedido
WHERE cliente_id = id_cliente;

-- 4 determina el genero mas comprado por el cliente
SELECT G.descripcion_genero
INTO genero_top
FROM Pedido P
JOIN Detalle_Pedido DP ON P.pedido_id = DP.pedido_id
JOIN Libro L ON DP.libro_id = L.libro_id
JOIN Genero G ON L.genero_id = G.genero_id
WHERE P.cliente_id = id_cliente
GROUP BY G.descripcion_genero
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 5 determina el formato de libro que mas compra el cliente
SELECT F.tipo_libro
INTO formato_top
FROM Pedido P
JOIN Detalle_Pedido DP ON P.pedido_id = DP.pedido_id
JOIN tipo_libro F ON DP.libro_id = F.tipo_libro_id
WHERE P.cliente_id = id_cliente
GROUP BY F.tipo_libro
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 6 construye el resumen final 
SET resultado = CONCAT(
'Cliente: ', nombre, ' ', apellido,
' (ID ', id_cliente, ') — Parte del club: ', en_club,
', Compras: ', total_compras,
', Género favorito: ', genero_top,
', Formato preferido: ', formato_top
);
RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Stock_Libro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Stock_Libro`(
  IN libro_id_existente INT,
  IN cantidad_a_sumar INT
)
BEGIN
DECLARE nuevo_stock INT; 
DECLARE tipo_actual VARCHAR(20);

  -- Verifica que el libro exista o que no sea digital 
SELECT TL.tipo_libro INTO tipo_actual
FROM Libro L
JOIN Tipo_Libro TL ON L.tipo_libro_id = TL.tipo_libro_id
WHERE L.libro_id = libro_id_existente;
IF tipo_actual IS NULL THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro no existe.';
ELSEIF tipo_actual = 'Digital' THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro es digital y no maneja stock.';
END IF;

  -- Actualiza el stock
UPDATE Libro
SET stock = stock + cantidad_a_sumar
WHERE libro_id = libro_id_existente;

-- consulta el nuevo stock 
SELECT stock INTO nuevo_stock 
FROM libro 
WHERE libro_id = libro_id_existente;

  -- Confirmación opcional
  SELECT CONCAT('Stock actualizado correctamente para el libro ID ', libro_id_existente, ' -- NUEVO_STOCK: ', nuevo_stock) AS mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Registrar_Compra_Con_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Compra_Con_Cliente`(
  IN cuit_cliente VARCHAR(20),
  IN nombre_cliente VARCHAR(100),
  IN apellido_cliente VARCHAR(100),
  IN email_cliente VARCHAR(100), 
  IN libro_id INT,
  IN cantidad INT
)
BEGIN
  DECLARE id_cliente INT;
  DECLARE nuevo_id INT;
  DECLARE pedido_id INT;
  DECLARE libro_precio DECIMAL(10,2);
  DECLARE total_compra DECIMAL(10,2);


  -- 1 verifica que el cliente exista
  SELECT cliente_id INTO id_cliente
  FROM Cliente
  WHERE cuit_cuil_cliente = cuit_cliente;

  -- 2 - si no existe incluye la informacion del cliente
  IF id_cliente IS NULL THEN
    SELECT MAX(cliente_id) + 1 INTO nuevo_id FROM Cliente;
    INSERT INTO Cliente (cliente_id, cuit_cuil_cliente, nombre_cliente, apellido_cliente, email_cliente, fecha_alta)
    VALUES (nuevo_id, cuit_cliente, nombre_cliente, apellido_cliente, email_cliente, current_date());
    SET id_cliente = nuevo_id;
  END IF;

-- 3 determina el total valor del pedido 
  SELECT precio INTO libro_precio
  FROM Libro
  WHERE libro.libro_id = libro_id;
  SET total_compra = libro_precio * cantidad;

-- 4 - actualiza la tabla pedido
INSERT INTO Pedido (cliente_id, fecha_pedido, total)
  VALUES (id_cliente, current_date(), total_compra);
  
  SELECT LAST_INSERT_ID() INTO pedido_id;
-- 5 actualiza la tabla detalle de pedido
INSERT INTO Detalle_Pedido (pedido_id, libro_id, cantidad)
  VALUES (pedido_id, libro_id, cantidad);

-- 6 actualiza el stock 
  UPDATE Libro
  SET stock = stock - cantidad
  WHERE libro.libro_id = libro_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `clientes_frecuentes_detallada`
--

/*!50001 DROP VIEW IF EXISTS `clientes_frecuentes_detallada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_frecuentes_detallada` AS select `c`.`cliente_id` AS `cliente_id`,concat(`c`.`nombre_cliente`,' ',`c`.`apellido_cliente`) AS `nombre_completo`,`c`.`email_cliente` AS `email_cliente`,count(distinct `p`.`pedido_id`) AS `cantidad_pedidos`,sum(`p`.`total`) AS `gasto_total`,(case when (`mc`.`membresia_id` is not null) then 'Miembro activo' else 'No pertenece al club' end) AS `estado_club`,count(distinct `pc`.`club_id`) AS `sesiones_participadas`,(select `g`.`descripcion_genero` from (((`detalle_pedido` `dp2` join `pedido` `p2` on((`dp2`.`pedido_id` = `p2`.`pedido_id`))) join `libro` `l2` on((`dp2`.`libro_id` = `l2`.`libro_id`))) join `genero` `g` on((`l2`.`genero_id` = `g`.`genero_id`))) where (`p2`.`cliente_id` = `c`.`cliente_id`) group by `g`.`genero_id` order by sum(`dp2`.`cantidad`) desc limit 1) AS `genero_favorito` from (((`cliente` `c` left join `pedido` `p` on((`c`.`cliente_id` = `p`.`cliente_id`))) left join `membresia_club` `mc` on(((`c`.`cliente_id` = `mc`.`cliente_id`) and (`mc`.`activa` = true)))) left join `participacion_club` `pc` on(((`mc`.`membresia_id` = `pc`.`membresia_id`) and (`pc`.`asistencia` = true)))) group by `c`.`cliente_id`,`nombre_completo`,`c`.`email_cliente`,`estado_club` having (`cantidad_pedidos` >= 2) order by `gasto_total` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `engagement_club_lectura`
--

/*!50001 DROP VIEW IF EXISTS `engagement_club_lectura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engagement_club_lectura` AS select `mc`.`membresia_id` AS `membresia_id`,concat(`c`.`nombre_cliente`,' ',`c`.`apellido_cliente`) AS `miembro`,count(distinct `pc`.`club_id`) AS `sesiones_asistidas`,count(distinct `r`.`resena_id`) AS `cantidad_resenas`,round(avg(`r`.`calificacion`),2) AS `promedio_calificacion` from (((`membresia_club` `mc` join `cliente` `c` on((`mc`.`cliente_id` = `c`.`cliente_id`))) left join `participacion_club` `pc` on(((`mc`.`membresia_id` = `pc`.`membresia_id`) and (`pc`.`asistencia` = true)))) left join `resena` `r` on((`mc`.`membresia_id` = `r`.`membresia_id`))) where (`mc`.`activa` = true) group by `mc`.`membresia_id`,`miembro` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `libros_mas_vendidos_ultimos_meses`
--

/*!50001 DROP VIEW IF EXISTS `libros_mas_vendidos_ultimos_meses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `libros_mas_vendidos_ultimos_meses` AS select `l`.`libro_id` AS `libro_id`,`l`.`titulo_libro` AS `titulo_libro`,concat(`a`.`nombre_autor`,' ',`a`.`apellido_autor`) AS `autor`,`tl`.`formato_libro` AS `formato_libro`,date_format(`p`.`fecha_pedido`,'%Y-%m') AS `mes_venta`,sum(`dp`.`cantidad`) AS `unidades_vendidas`,sum((`dp`.`cantidad` * `l`.`precio`)) AS `total_recaudado` from ((((`detalle_pedido` `dp` join `pedido` `p` on((`dp`.`pedido_id` = `p`.`pedido_id`))) join `libro` `l` on((`dp`.`libro_id` = `l`.`libro_id`))) join `autor` `a` on((`l`.`autor_id` = `a`.`autor_id`))) join `tipo_libro` `tl` on((`l`.`tipo_libro_id` = `tl`.`tipo_libro_id`))) where (`p`.`fecha_pedido` >= (curdate() - interval 160 day)) group by `l`.`titulo_libro`,`autor`,`tl`.`formato_libro`,`l`.`libro_id`,`mes_venta` having (`unidades_vendidas` >= 3) order by `unidades_vendidas` desc,`l`.`titulo_libro` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_libros`
--

/*!50001 DROP VIEW IF EXISTS `stock_libros`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_libros` AS select `l`.`libro_id` AS `libro_id`,`l`.`titulo_libro` AS `titulo_libro`,concat(`a`.`nombre_autor`,' ',`a`.`apellido_autor`) AS `autor`,`g`.`descripcion_genero` AS `genero`,`tl`.`formato_libro` AS `formato_libro`,`l`.`stock` AS `stock`,(case when (`l`.`stock` is null) then 'Versión digital' when (`l`.`stock` >= 8) then 'Stock suficiente' when (`l`.`stock` between 1 and 7) then 'Bajo stock' when (`l`.`stock` = 0) then 'Sin stock' end) AS `estado_stock` from (((`libro` `l` join `autor` `a` on((`l`.`autor_id` = `a`.`autor_id`))) join `genero` `g` on((`l`.`genero_id` = `g`.`genero_id`))) join `tipo_libro` `tl` on((`l`.`tipo_libro_id` = `tl`.`tipo_libro_id`))) where (`l`.`stock` is not null) order by `l`.`stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ventas_por_formato`
--

/*!50001 DROP VIEW IF EXISTS `ventas_por_formato`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_por_formato` AS select `tl`.`tipo_libro` AS `tipo_libro`,`tl`.`formato_libro` AS `formato_libro`,count(distinct `dp`.`libro_id`) AS `titulos_vendidos`,sum(`dp`.`cantidad`) AS `unidades_vendidas`,sum((`dp`.`cantidad` * `l`.`precio`)) AS `total_recaudado` from ((`detalle_pedido` `dp` join `libro` `l` on((`dp`.`libro_id` = `l`.`libro_id`))) join `tipo_libro` `tl` on((`l`.`tipo_libro_id` = `tl`.`tipo_libro_id`))) group by `tl`.`tipo_libro`,`tl`.`formato_libro` order by `total_recaudado` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:51:16
