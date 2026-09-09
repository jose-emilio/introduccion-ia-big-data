# Comparación SQL / Pandas — 3 consultas resueltas

Esta comparación ejemplifica lo que pide la actividad 2 del enunciado: para algunas de las consultas SQL, escribir también la línea (o pocas líneas) de pandas que produce el mismo resultado. Sirve de referencia; las tres comparaciones aquí ya han sido verificadas ejecutando ambas versiones y comprobando que los números coinciden exactamente.

Recordad la tabla de equivalencias del apunte [`02-sql-y-nosql.md`](../../../03-herramientas-y-tecnologias/02-sql-y-nosql.md): `WHERE` ≈ filtro booleano, `GROUP BY` ≈ `groupby().agg()`, `JOIN` ≈ `merge()`.

---

## Comparación 1 — Consulta 3 (GROUP BY simple)

**Pregunta de negocio:** ¿Cuántos productos hay por categoría y cuál es su precio medio?

**SQL:**
```sql
SELECT categoria, COUNT(*) AS num_productos, ROUND(AVG(precio_unitario), 2) AS precio_medio
FROM productos
GROUP BY categoria
ORDER BY num_productos DESC;
```

**Pandas equivalente** (partiendo de `productos = pd.read_sql("SELECT * FROM productos", con)`):
```python
productos.groupby("categoria").agg(
    num_productos=("producto_id", "count"),
    precio_medio=("precio_unitario", "mean"),
).round(2).sort_values("num_productos", ascending=False)
```

**Resultado (ambas versiones, verificado idéntico):**

| categoria | num_productos | precio_medio |
| --- | --- | --- |
| Electrónica | 8 | 103.36 |
| Deporte | 6 | 114.87 |
| Hogar | 6 | 74.08 |
| Papelería | 5 | 97.69 |
| Moda | 5 | 71.05 |

**Nota:** el `GROUP BY` de SQL y el `groupby().agg()` de pandas son prácticamente un calco conceptual: agrupar por una clave y aplicar funciones de agregación a otras columnas.

---

## Comparación 2 — Consulta 6 (JOIN + GROUP BY)

**Pregunta de negocio:** ¿Qué categoría genera más ingresos, y cuál es el importe medio por línea vendida? (Es la misma pregunta que resolvisteis con `groupby("categoria").agg(...)` directamente sobre `tienda_online_ventas.csv` en el laboratorio 3.1 — aquí partimos de tablas normalizadas, así que primero hace falta combinar `detalle_pedido` con `productos`.)

**SQL:**
```sql
SELECT p.categoria,
       ROUND(SUM(dp.importe), 2) AS importe_total,
       ROUND(AVG(dp.importe), 2) AS importe_medio,
       COUNT(*) AS num_lineas
FROM detalle_pedido dp
JOIN productos p ON dp.producto_id = p.producto_id
GROUP BY p.categoria
ORDER BY importe_total DESC;
```

**Pandas equivalente:**
```python
merged = detalle.merge(productos, on="producto_id")
merged.groupby("categoria").agg(
    importe_total=("importe", "sum"),
    importe_medio=("importe", "mean"),
    num_lineas=("importe", "count"),
).round(2).sort_values("importe_total", ascending=False)
```

**Resultado (ambas versiones, verificado idéntico):**

| categoria | importe_total | importe_medio | num_lineas |
| --- | --- | --- | --- |
| Electrónica | 824029.78 | 257.51 | 3200 |
| Deporte | 682886.96 | 281.37 | 2427 |
| Papelería | 485748.23 | 237.76 | 2043 |
| Hogar | 436042.83 | 186.34 | 2340 |
| Moda | 333535.40 | 167.61 | 1990 |

**Nota:** el `JOIN ON` de SQL equivale a `merge(..., on=...)` en pandas. Ambos combinan filas de dos tablas emparejando por una clave común; en este caso, `producto_id`.

---

## Comparación 3 — Consulta 5 (JOIN de 3 tablas + GROUP BY)

**Pregunta de negocio:** ¿Cuáles son los 10 clientes que más han gastado en total, y cuántos pedidos han hecho?

**SQL:**
```sql
SELECT c.cliente_id, c.nombre, c.region,
       ROUND(SUM(dp.importe), 2) AS gasto_total,
       COUNT(DISTINCT p.pedido_id) AS num_pedidos
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
JOIN detalle_pedido dp ON p.pedido_id = dp.pedido_id
GROUP BY c.cliente_id, c.nombre, c.region
ORDER BY gasto_total DESC
LIMIT 10;
```

**Pandas equivalente:**
```python
m2 = detalle.merge(pedidos, on="pedido_id").merge(clientes, on="cliente_id")
m2.groupby(["cliente_id", "nombre", "region"]).agg(
    gasto_total=("importe", "sum"),
    num_pedidos=("pedido_id", "nunique"),
).round(2).sort_values("gasto_total", ascending=False).head(10)
```

**Resultado (ambas versiones, verificado idéntico — primeras 3 filas):**

| cliente_id | nombre | region | gasto_total | num_pedidos |
| --- | --- | --- | --- | --- |
| C100164 | Cliente 0165 | Norte | 12165.81 | 37 |
| C100200 | Cliente 0201 | Andalucía | 12155.80 | 44 |
| C100241 | Cliente 0242 | Centro | 11698.08 | 37 |

**Nota:** un JOIN de 3 tablas en SQL se traduce en pandas en **dos `merge()` encadenados**: primero combinamos `detalle_pedido` con `pedidos` (para llegar del importe al cliente que hizo el pedido), y luego con `clientes` (para llegar al nombre y la región). El orden de los `merge` no importa siempre que la clave de unión sea correcta en cada paso; lo importante es que cada `merge` añade la información de una tabla más, igual que cada `JOIN` adicional en SQL.
