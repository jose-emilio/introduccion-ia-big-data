# Laboratorio 3.2 — Consultas SQL sobre una base de datos de ejemplo

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.1): Limpieza y exploración de datos con Pandas](../lab-3.1-limpieza-exploracion-pandas/enunciado.md) · [Laboratorio siguiente (3.3): Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) ⟶

**Laboratorios relacionados:** [3.1 — Limpieza y exploración de datos con Pandas](../lab-3.1-limpieza-exploracion-pandas/enunciado.md) (mismo dataset de ventas, resuelto con pandas); [3.3 — Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) (repite exactamente estas mismas consultas en Spark SQL).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Esquema de la base de datos](#esquema-de-la-base-de-datos)
- [Cómo usar sqliteonline.com (sin instalación)](#como-usar-sqliteonlinecom-sin-instalacion)
- [Actividades paso a paso](#actividades-paso-a-paso)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)

---

**Bloque temático:** [`02-sql-y-nosql.md`](../../../03-herramientas-y-tecnologias/02-sql-y-nosql.md)
**Duración orientativa:** 90 minutos
**Modalidad:** individual
**Herramientas:** SQLite en el navegador (recomendado: [sqliteonline.com](https://sqliteonline.com)) o cualquier cliente SQLite instalado (DB Browser for SQLite, la extensión SQLite de VS Code, etc.) — no hace falta instalar nada si usáis la opción en el navegador.

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Practicar `SELECT`/`WHERE`/`JOIN`/`GROUP BY` y window functions sobre una base de datos relacional real, y relacionar cada consulta con su equivalente en pandas del laboratorio 3.1.

<a id="contexto"></a>
## Contexto

El apunte del bloque 2 presenta SQL como el lenguaje estándar para consultar datos estructurados, y dedica un apartado completo a mostrar que SQL y pandas son dos formas de expresar las mismas operaciones analíticas: `SELECT` ≈ selección de columnas, `WHERE` ≈ filtro booleano, `GROUP BY` ≈ `groupby().agg()`, `JOIN` ≈ `merge()`.

En el laboratorio 3.1 trabajasteis con `tienda_online_ventas.csv`, un único fichero "desnormalizado" donde cada fila repite el nombre del cliente, el nombre del producto, etc. En bases de datos reales, esta información casi nunca vive en una sola tabla: se **normaliza** en varias tablas relacionadas por claves, para evitar duplicar datos y garantizar consistencia. `tienda.db` es justamente esa versión normalizada del mismo dataset de la tienda online, repartida en 4 tablas. Este laboratorio os obliga a recomponer con `JOIN` la información que en pandas teníais ya unida en un único DataFrame — una experiencia muy representativa de cómo se trabaja con datos en la mayoría de empresas.

<a id="esquema-de-la-base-de-datos"></a>
## Esquema de la base de datos

`tienda.db` contiene 4 tablas:

- **`clientes`** (350 filas): `cliente_id` (PK), `nombre`, `ciudad`, `region`, `fecha_alta`.
- **`productos`** (30 filas): `producto_id` (PK), `nombre`, `categoria`, `precio_unitario`.
- **`pedidos`** (12.000 filas): `pedido_id` (PK), `cliente_id` (FK → `clientes.cliente_id`), `fecha`, `canal`, `metodo_pago`.
- **`detalle_pedido`** (12.000 filas): `detalle_id` (PK), `pedido_id` (FK → `pedidos.pedido_id`), `producto_id` (FK → `productos.producto_id`), `cantidad`, `precio_unitario`, `importe`, `valoracion`.

Relación entre tablas: un cliente puede tener varios pedidos (`clientes` 1—N `pedidos`); en este dataset, cada pedido tiene una única línea de detalle asociada (`pedidos` 1—1 `detalle_pedido`), y cada línea de detalle referencia un producto del catálogo (`detalle_pedido` N—1 `productos`).

<a id="como-usar-sqliteonlinecom-sin-instalacion"></a>
## Cómo usar sqliteonline.com (sin instalación)

1. Entrad en [https://sqliteonline.com](https://sqliteonline.com).
2. En el menú superior, buscad la opción **"Open DB"** (o el icono de carpeta/subir archivo) y seleccionad el fichero `tienda.db` de esta carpeta.
3. La herramienta cargará las 4 tablas; podéis comprobarlo en el panel lateral izquierdo, donde aparecerán listadas.
4. Escribid vuestras consultas SQL en el panel principal y ejecutadlas con el botón **"Run"** (o `Ctrl+Enter`).
5. Los resultados aparecen en una tabla debajo del editor. Podéis ejecutar varias consultas seguidas (separadas por `;`) o una a una.

Si preferís un cliente instalado, cualquier herramienta que abra ficheros `.db` de SQLite (DB Browser for SQLite, la extensión SQLite Viewer de VS Code, `sqlite3` por línea de comandos) funciona igual de bien.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

1. **Familiarizaros con el esquema** (10 min). Abrid `tienda.db` y ejecutad un `SELECT * FROM tabla LIMIT 5` sobre cada una de las 4 tablas para ver su contenido real.
2. **Resolver la batería de 10 consultas progresivas** (60 min). El fichero `consultas-resueltas.sql` de esta carpeta contiene 10 consultas ya escritas y verificadas, numeradas y comentadas, que cubren: selección y filtrado simple, `ORDER BY`/`LIMIT`, `GROUP BY` sobre una tabla, `JOIN` de 2 y de 3 tablas, `GROUP BY` + `HAVING`, y dos window functions (`RANK()` y `ROW_NUMBER() OVER (PARTITION BY ...)`). Antes de mirar cada consulta resuelta, intentad escribirla vosotros mismos a partir de la descripción que la precede (`-- Consulta N: ...`); usad la solución para corregiros o para desatascaros.
3. **Comparar 3 consultas con su equivalente en pandas** (20 min). El fichero `comparacion-sql-pandas.md` contiene, ya resueltas, la comparación SQL/pandas de las consultas 3, 5 y 6. Estudiadlas y comprobad que entendéis por qué cada línea de pandas produce el mismo resultado que la consulta SQL correspondiente.

<a id="entregable"></a>
## Entregable

Un fichero (puede ser el propio `consultas-resueltas.sql` copiado y adaptado, o vuestras propias consultas si preferís escribirlas desde cero) con las 10 consultas SQL resueltas, más la comparación pandas/SQL de 3 de ellas.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. En la Consulta 5 hicisteis un `JOIN` de 3 tablas para llegar del cliente al importe gastado. ¿Por qué no basta con un `JOIN` de `clientes` con `detalle_pedido` directamente? (Pista: fijaos en qué tablas comparten una clave común).
2. La Consulta 8 usa `RANK()` y la Consulta 5 usa `ORDER BY ... LIMIT 10` para obtener, en la práctica, un resultado parecido (los clientes que más gastan). ¿Qué información adicional os da `RANK()` que no os da un simple `ORDER BY` + `LIMIT`?
3. ¿En qué situación real usaríais `ROW_NUMBER() OVER (PARTITION BY región ...)` (Consulta 9) en lugar de un `GROUP BY región` normal?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

Las 10 consultas completas y comentadas están en [`consultas-resueltas.sql`](./consultas-resueltas.sql); ejecutadas de nuevo contra `tienda.db`, producen los siguientes resultados reales:

| # | Consulta | Resultado real (resumen) |
| --- | --- | --- |
| 1 | Clientes de Cataluña, 10 primeros por antigüedad | 10 filas; el más antiguo: C100312 (Cliente 0313, Barcelona), alta el 2023-02-01 |
| 2 | Catálogo de Electrónica, por precio descendente | 8 productos; el más caro: Monitor 24" (P008) a 145,07 €; el más barato: Cargador USB-C (P002) a 35,80 € |
| 3 | Nº de productos y precio medio por categoría | 5 filas; Electrónica tiene más referencias (8, precio medio 103,36 €), Deporte el precio medio más alto (114,87 €) |
| 4 | Detalle del pedido PED203930 (JOIN 2 tablas) | 1 fila: Cargador USB-C, Electrónica, 4 unidades a 33,08 €, importe 132,32 € |
| 5 | Top 10 clientes por gasto total (JOIN 3 tablas) | Encabeza C100164 (Cliente 0165, Norte) con 12.165,81 € en 37 pedidos |
| 6 | Ventas por categoría (JOIN + GROUP BY) | Coincide exactamente con el groupby de pandas del laboratorio 3.1: Electrónica 824.029,78 € / 257,51 € medio / 3.200 líneas |
| 7 | Regiones con importe medio de línea > 150 € (HAVING) | Las 5 regiones superan el umbral; Cataluña tiene el importe medio más alto (238,71 €) aunque no el total más alto |
| 8 | Ranking `RANK()` de clientes por gasto | Mismo top 10 que la Consulta 5, con columna `ranking_gasto` añadida (1 a 10, sin huecos ni empates en este caso) |
| 9 | `ROW_NUMBER() OVER (PARTITION BY region ...)`, top 1 por región | 5 filas (una por región); en Norte gana C100164 con 12.165,81 €, en Cataluña gana C100051 con 10.990,84 € |
| 10 | Importe y líneas por canal y método de pago | 12 combinaciones; la de mayor importe es Web + Tarjeta con 813.609,52 € en 3.621 líneas |

Dos verificaciones de consistencia que confirman que las consultas son correctas: el resultado de la Consulta 6 (ventas por categoría) coincide cifra a cifra con el `groupby("categoria").agg(...)` del laboratorio 3.1 sobre el CSV desnormalizado, y el top 10 de gasto de las Consultas 5 y 8 es idéntico salvo por la columna de ranking añadida — exactamente lo que cabía esperar, ya que ambas consultas responden a la misma pregunta de negocio con herramientas SQL distintas.

Para la comparación de las consultas 3, 5 y 6 con su equivalente en pandas, ved [`comparacion-sql-pandas.md`](./comparacion-sql-pandas.md) (ya resuelto). El fichero [`consultas-resueltas.sql`](./consultas-resueltas.sql) es la solución completa y ejecutable: podéis copiarlo en `sqliteonline.com` (o en cualquier cliente SQLite) y ejecutarlo directamente contra `tienda.db` para reproducir estos mismos resultados.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.1): Limpieza y exploración de datos con Pandas](../lab-3.1-limpieza-exploracion-pandas/enunciado.md) · [Laboratorio siguiente (3.3): Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) ⟶
