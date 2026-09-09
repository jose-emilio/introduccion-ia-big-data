-- ============================================================================
-- Laboratorio 3.2 — Consultas SQL sobre tienda.db
-- Solución de referencia: 10 consultas ya resueltas y verificadas.
--
-- Antes de mirar cada consulta, intentad escribirla vosotros mismos a partir
-- del enunciado.md. Usad este fichero como corrección y como red de
-- seguridad si os atascáis.
--
-- Esquema de la base de datos (4 tablas):
--   clientes(cliente_id PK, nombre, ciudad, region, fecha_alta)
--   productos(producto_id PK, nombre, categoria, precio_unitario)
--   pedidos(pedido_id PK, cliente_id FK -> clientes, fecha, canal, metodo_pago)
--   detalle_pedido(detalle_id PK, pedido_id FK -> pedidos, producto_id FK -> productos,
--                   cantidad, precio_unitario, importe, valoracion)
--
-- Todas las consultas han sido ejecutadas y verificadas contra tienda.db.
-- ============================================================================


-- Consulta 1: selección y filtrado simple.
-- ¿Qué clientes se dieron de alta y en qué fecha, en la región de Cataluña?
-- Muestra los 10 primeros por antigüedad (fecha de alta más temprana primero).
SELECT cliente_id, nombre, ciudad, region, fecha_alta
FROM clientes
WHERE region = 'Cataluña'
ORDER BY fecha_alta
LIMIT 10;


-- Consulta 2: filtrado + orden sobre una sola tabla.
-- Catálogo de productos de Electrónica, del más caro al más barato.
SELECT producto_id, nombre, categoria, precio_unitario
FROM productos
WHERE categoria = 'Electrónica'
ORDER BY precio_unitario DESC;


-- Consulta 3: GROUP BY simple sobre una sola tabla.
-- Número de productos y precio medio por categoría del catálogo.
SELECT categoria, COUNT(*) AS num_productos, ROUND(AVG(precio_unitario), 2) AS precio_medio
FROM productos
GROUP BY categoria
ORDER BY num_productos DESC;


-- Consulta 4: JOIN de 2 tablas.
-- Detalle completo de un pedido concreto (PED203930), incluyendo el nombre
-- y la categoría de cada producto comprado.
SELECT dp.pedido_id, dp.producto_id, p.nombre AS producto, p.categoria,
       dp.cantidad, dp.precio_unitario, dp.importe
FROM detalle_pedido dp
JOIN productos p ON dp.producto_id = p.producto_id
WHERE dp.pedido_id = 'PED203930';


-- Consulta 5: JOIN de 3 tablas + GROUP BY.
-- Gasto total y número de pedidos por cliente (los 10 clientes que más gastan).
-- Combina clientes -> pedidos -> detalle_pedido para llegar del cliente al importe.
SELECT c.cliente_id, c.nombre, c.region,
       ROUND(SUM(dp.importe), 2) AS gasto_total,
       COUNT(DISTINCT p.pedido_id) AS num_pedidos
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id
GROUP BY c.cliente_id, c.nombre, c.region
ORDER BY gasto_total DESC
LIMIT 10;


-- Consulta 6: JOIN + GROUP BY.
-- Ventas totales, importe medio por línea y número de líneas vendidas por
-- categoría de producto (equivalente SQL de la agregación por categoría del
-- laboratorio 3.1 en pandas).
SELECT p.categoria,
       ROUND(SUM(dp.importe), 2) AS importe_total,
       ROUND(AVG(dp.importe), 2) AS importe_medio,
       COUNT(*) AS num_lineas
FROM detalle_pedido dp
JOIN productos p ON dp.producto_id = p.producto_id
GROUP BY p.categoria
ORDER BY importe_total DESC;


-- Consulta 7: JOIN + GROUP BY + HAVING.
-- Regiones cuyo importe medio por línea de pedido supera los 150 euros.
-- HAVING filtra sobre el resultado ya agregado (a diferencia de WHERE, que
-- filtra filas antes de agregar).
SELECT c.region,
       ROUND(AVG(dp.importe), 2) AS importe_medio_linea,
       ROUND(SUM(dp.importe), 2) AS importe_total
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id
GROUP BY c.region
HAVING AVG(dp.importe) > 150
ORDER BY importe_medio_linea DESC;


-- Consulta 8: window function RANK().
-- Ranking global de clientes por gasto total. A diferencia de un GROUP BY con
-- ORDER BY + LIMIT, RANK() asigna un puesto a cada fila sin colapsar el
-- resultado, y empata correctamente a los clientes con el mismo gasto.
SELECT cliente_id, nombre, gasto_total,
       RANK() OVER (ORDER BY gasto_total DESC) AS ranking_gasto
FROM (
    SELECT c.cliente_id, c.nombre, ROUND(SUM(dp.importe), 2) AS gasto_total
    FROM clientes c
    JOIN pedidos p ON c.cliente_id = p.cliente_id
    JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id
    GROUP BY c.cliente_id, c.nombre
)
ORDER BY ranking_gasto
LIMIT 10;


-- Consulta 9: window function ROW_NUMBER() con PARTITION BY.
-- El cliente que más gasta dentro de cada región (un "top 1 por grupo"),
-- algo que un GROUP BY normal no puede expresar directamente.
SELECT *
FROM (
    SELECT c.cliente_id, c.nombre, c.region,
           ROUND(SUM(dp.importe), 2) AS gasto_total,
           ROW_NUMBER() OVER (PARTITION BY c.region ORDER BY SUM(dp.importe) DESC) AS puesto_en_region
    FROM clientes c
    JOIN pedidos p ON c.cliente_id = p.cliente_id
    JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id
    GROUP BY c.cliente_id, c.nombre, c.region
)
WHERE puesto_en_region = 1
ORDER BY gasto_total DESC;


-- Consulta 10: JOIN + GROUP BY con dos dimensiones.
-- Importe total y número de líneas vendidas por canal de venta y método de
-- pago, para ver qué combinación predomina.
SELECT p.canal, p.metodo_pago,
       COUNT(*) AS num_lineas,
       ROUND(SUM(dp.importe), 2) AS importe_total
FROM pedidos p
JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id
GROUP BY p.canal, p.metodo_pago
ORDER BY p.canal, importe_total DESC;
