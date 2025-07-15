-- VISTAS -- 
-- 1 - 
CREATE VIEW Stock_Libros AS
SELECT 
  l.libro_id,
  l.titulo_libro,
  CONCAT(a.nombre_autor, ' ', a.apellido_autor) AS autor,
  g.descripcion_genero AS genero,
  tl.formato_libro,
  l.stock,
  CASE
    WHEN l.stock IS NULL THEN 'Versión digital'
    WHEN l.stock >= 8 THEN 'Stock suficiente'
    WHEN l.stock BETWEEN 1 AND 7 THEN 'Bajo stock'
    WHEN l.stock = 0 THEN 'Sin stock'
  END AS estado_stock
FROM Libro l
JOIN Autor a ON l.autor_id = a.autor_id
JOIN Genero g ON l.genero_id = g.genero_id
JOIN Tipo_Libro tl ON l.tipo_libro_id = tl.tipo_libro_id
WHERE l.stock IS NOT NULL
order by l.stock asc;


-- 2 
CREATE VIEW Ventas_Por_Formato AS
SELECT 
  tl.tipo_libro,
  tl.formato_libro,
  COUNT(DISTINCT dp.libro_id) AS titulos_vendidos,
  SUM(dp.cantidad) AS unidades_vendidas,
  SUM(dp.cantidad * l.precio) AS total_recaudado
FROM Detalle_Pedido dp
JOIN Libro l ON dp.libro_id = l.libro_id
JOIN Tipo_Libro tl ON l.tipo_libro_id = tl.tipo_libro_id
GROUP BY tl.tipo_libro, tl.formato_libro
ORDER BY total_recaudado DESC;

-- 3 
CREATE VIEW Libros_Mas_Vendidos_ultimos_Meses AS
SELECT 
  l.libro_id,
  l.titulo_libro,
  CONCAT(a.nombre_autor, ' ', a.apellido_autor) AS autor,
  tl.formato_libro,
  DATE_FORMAT(p.fecha_pedido, '%Y-%m') AS mes_venta,
  SUM(dp.cantidad) AS unidades_vendidas,
  SUM(dp.cantidad * l.precio) AS total_recaudado
FROM Detalle_Pedido dp
JOIN Pedido p ON dp.pedido_id = p.pedido_id
JOIN Libro l ON dp.libro_id = l.libro_id
JOIN Autor a ON l.autor_id = a.autor_id
JOIN Tipo_Libro tl ON l.tipo_libro_id = tl.tipo_libro_id
WHERE p.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 160 DAY)
GROUP BY  l.titulo_libro, autor, tl.formato_libro, l.libro_id, mes_venta
HAVING unidades_vendidas >=3
ORDER BY  unidades_vendidas DESC, titulo_libro desc;

-- 4
CREATE VIEW Engagement_Club_Lectura AS
SELECT 
  mc.membresia_id,
  CONCAT(c.nombre_cliente, ' ', c.apellido_cliente) AS miembro,
  COUNT(DISTINCT pc.club_id) AS sesiones_asistidas,
  COUNT(DISTINCT r.resena_id) AS cantidad_resenas,
  ROUND(AVG(r.calificacion), 2) AS promedio_calificacion
FROM Membresia_Club mc
JOIN Cliente c ON mc.cliente_id = c.cliente_id
LEFT JOIN Participacion_Club pc ON mc.membresia_id = pc.membresia_id AND pc.asistencia = TRUE
LEFT JOIN Resena r ON mc.membresia_id = r.membresia_id
WHERE mc.activa = TRUE
GROUP BY mc.membresia_id, miembro;

-- 5
CREATE VIEW Clientes_Frecuentes_Detallada AS
SELECT 
  c.cliente_id,
  CONCAT(c.nombre_cliente, ' ', c.apellido_cliente) AS nombre_completo,
  c.email_cliente,
  COUNT(DISTINCT p.pedido_id) AS cantidad_pedidos,
  SUM(p.total) AS gasto_total,

  CASE
    WHEN mc.membresia_id IS NOT NULL THEN 'Miembro activo'
    ELSE 'No pertenece al club'
  END AS estado_club,

  COUNT(DISTINCT pc.club_id) AS sesiones_participadas,

  -- Género más comprado por cantidad total
  (SELECT g.descripcion_genero
   FROM Detalle_Pedido dp2
   JOIN Pedido p2 ON dp2.pedido_id = p2.pedido_id
   JOIN Libro l2 ON dp2.libro_id = l2.libro_id
   JOIN Genero g ON l2.genero_id = g.genero_id
   WHERE p2.cliente_id = c.cliente_id
   GROUP BY g.genero_id
   ORDER BY SUM(dp2.cantidad) DESC
   LIMIT 1) AS genero_favorito

FROM Cliente c
LEFT JOIN Pedido p ON c.cliente_id = p.cliente_id
LEFT JOIN Membresia_Club mc ON c.cliente_id = mc.cliente_id AND mc.activa = TRUE
LEFT JOIN Participacion_Club pc ON mc.membresia_id = pc.membresia_id AND pc.asistencia = TRUE

GROUP BY c.cliente_id, nombre_completo, c.email_cliente, estado_club
HAVING cantidad_pedidos >=2
ORDER BY gasto_total DESC;

-- funciones 
-- funcion 1 - determina cuando es la fecha ideal para reponer stock 

DELIMITER // 
CREATE FUNCTION Proxima_Reposicion(libro INT) 
RETURNS DATE 
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
END; //
delimiter ; 
 
-- ejemplo 1 SELECT libro_id, titulo_libro, stock, Proxima_Reposicion(libro_id) AS fecha_estimada_reposicion FROM Libro WHERE tipo_libro_id IN (1); 
-- ejemplo 2 Select Proxima_Reposicion(10);


-- funcion 2 - hace un resumen del cliente con informacion relevante

DELIMITER //
CREATE FUNCTION resumen_cliente_por_cuit(cuit_cliente VARCHAR(20))
RETURNS VARCHAR(500)
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
END; //
DELIMITER ;

-- ejemplo select resumen_cliente_por_cuit('20228889999');

-- Stored procedures
-- procedimiento actualizacion de stock 

DELIMITER //
CREATE PROCEDURE Actualizar_Stock_Libro (
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
END //
DELIMITER ;

-- ejemplo para verificar: CALL Actualizar_Stock_Libro(50,1);


-- stored 2 - registro de compras  

DELIMITER //

CREATE PROCEDURE Registrar_Compra_Con_Cliente (
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

END //
DELIMITER ;

-- ejemplo
-- CALL Registrar_Compra_Con_Cliente( '20132334455','gaspar','Silvestre','gaspar.silvestre@gmail.com', 40,1);

-- trigger 
-- Trigger 1 -- Convertir el email a minúsculas y elimina espacios en ambos extremos e internos

DELIMITER //
CREATE TRIGGER Formatear_Email_Cliente
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
  SET NEW.email_cliente = TRIM(LOWER(REPLACE(NEW.email_cliente,' ','')));
  IF INSTR(NEW.email_cliente, '@') = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo debe contener un símbolo "@".';
  END IF;
END;
//
DELIMITER ;


-- Trigger 2 - Verificar si el libro tiene actividad en Detalle_Pedido y previene eliminacion
DELIMITER //
CREATE TRIGGER Prevenir_Eliminacion_Libro_Con_Pedidos
BEFORE DELETE ON Libro
FOR EACH ROW
BEGIN
  IF EXISTS (
    SELECT 1 FROM Detalle_Pedido
    WHERE libro_id = OLD.libro_id
  ) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El libro no puede eliminarse porque está vinculado a pedidos.';
END IF;
END;
// DELIMITER ; 


