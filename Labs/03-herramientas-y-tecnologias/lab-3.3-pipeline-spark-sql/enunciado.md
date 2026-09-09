# Laboratorio 3.3 — Tu primer pipeline distribuido con Spark SQL

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.2): Consultas SQL sobre una base de datos de ejemplo](../lab-3.2-consultas-sql/enunciado.md) · [Laboratorio siguiente (3.4): Clasificación con scikit-learn: de los datos a las métricas](../lab-3.4-clasificacion-scikit-learn/enunciado.md) ⟶

**Laboratorios relacionados:** [3.2 — Consultas SQL sobre una base de datos de ejemplo](../lab-3.2-consultas-sql/enunciado.md) (repite exactamente las mismas consultas, aquí en Spark SQL en vez de SQL tradicional).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Importante: este laboratorio requiere Google Colab (con conexión a internet)](#importante-este-laboratorio-requiere-google-colab-con-conexion-a-internet)
- [Dataset](#dataset)
- [Actividades paso a paso](#actividades-paso-a-paso)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Cierre](#cierre)
- [Solución propuesta](#solucion-propuesta)

---

**Bloque temático:** [`03-spark-y-procesamiento-distribuido.md`](../../../03-herramientas-y-tecnologias/03-spark-y-procesamiento-distribuido.md)
**Duración orientativa:** 90 minutos
**Modalidad:** individual
**Herramientas:** Google Colab + PySpark

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Repetir las consultas del laboratorio 3.2 sobre Spark SQL y observar las diferencias de sintaxis y de plan de ejecución frente a SQL/pandas tradicional, prestando especial atención al concepto de shuffle y a la distinción entre transformaciones narrow y wide.

<a id="contexto"></a>
## Contexto

El apunte del bloque 3 presenta Apache Spark como el motor de referencia para procesar datos que no caben en una sola máquina, mediante particiones distribuidas, evaluación perezosa (lazy evaluation) y un motor SQL integrado (Spark SQL) que permite consultar DataFrames registrados como vistas temporales con sintaxis SQL estándar.

Este laboratorio replica el ejercicio del laboratorio 3.2, pero a través de Spark en lugar de SQLite. Vais a usar `tienda_online_ventas.csv` — el mismo CSV desnormalizado del laboratorio 3.1, no las tablas separadas de `tienda.db` — así que muchas de las consultas que en 3.2 necesitaban `JOIN` aquí se resuelven directamente sobre una única tabla. El objetivo no es tanto la sintaxis (que es casi idéntica a SQL estándar) como entender **qué ocurre por debajo**: cómo Spark construye un plan de ejecución (DAG), cuándo necesita redistribuir datos entre particiones (shuffle) y cómo diferenciar transformaciones narrow (resolubles dentro de cada partición) de wide (que requieren shuffle).

<a id="importante-este-laboratorio-requiere-google-colab-con-conexion-a-internet"></a>
## Importante: este laboratorio requiere Google Colab (con conexión a internet)

El notebook `notebook_3.3.ipynb` de esta carpeta contiene todo el código ya escrito. La primera celda instala PySpark con `!pip install pyspark`, lo cual solo funciona con conexión a internet — Google Colab la tiene por defecto, así que abrid el notebook allí. Cada resultado del notebook ha sido verificado de antemano calculando el mismo número con pandas sobre el mismo CSV, para garantizar que las consultas SQL son correctas incluso antes de ejecutarse en Spark.

<a id="dataset"></a>
## Dataset

`tienda_online_ventas.csv` (en esta misma carpeta), el mismo dataset de 12.000 pedidos que en los laboratorios 3.1 y 3.5.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

1. **Instalar PySpark y arrancar una SparkSession** (10 min). La primera celda del notebook instala la librería y crea una sesión de Spark en modo local (`local[*]`, usando todos los núcleos disponibles de la máquina de Colab como si fuera un mini-clúster).
2. **Cargar el CSV en un DataFrame de Spark** (10 min). Con `spark.read.csv(..., header=True, inferSchema=True)`. Observad cuántas particiones tiene el DataFrame resultante.
3. **Registrar la vista temporal y repetir 5 consultas** (30 min). Con `df.createOrReplaceTempView("ventas")` y `spark.sql("...")`, repetid en Spark SQL 5 de las consultas del laboratorio 3.2, adaptadas al esquema desnormalizado: ventas por categoría, top 10 clientes por gasto, ventas por región y canal, regiones con importe medio alto (`HAVING`) y ranking de clientes (`RANK()`).
4. **Repetir una consulta con la API de DataFrame** (10 min). Traducid la consulta de ventas por categoría a `.groupBy()`/`.agg()` en vez de SQL, y comparad ambos estilos en una celda Markdown.
5. **Observar el plan de ejecución con `.explain()`** (15 min). Comparad el plan de una transformación *wide* (`groupBy`) con el de una *narrow* (`filter`), buscando la palabra `"Exchange"` (señal de shuffle) en la salida.

<a id="entregable"></a>
## Entregable

El notebook ejecutado de principio a fin en Google Colab, con las consultas replicadas en Spark SQL y una nota de una línea sobre cuál de las transformaciones generó shuffle y por qué.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. Si tuvierais que ejecutar en Spark SQL una consulta con `JOIN` como las del laboratorio 3.2 (clientes + pedidos + detalle_pedido), ¿qué tabla sería buena candidata para un *broadcast join* (apunte)? Fijaos en el tamaño relativo de cada tabla.
2. ¿Por qué `spark.read.csv(...)` no dispara ninguna acción real, mientras que `.count()` sí? Relacionadlo con la evaluación perezosa (*lazy evaluation*).
3. Si este dataset tuviera 500 millones de filas en lugar de 12.000, ¿cambiaría el número de particiones que os convendría tener?

<a id="cierre"></a>
## Cierre

Este laboratorio cierra el bloque de herramientas de procesamiento de datos del módulo (Python/pandas → SQL → Spark SQL), mostrando cómo un mismo conjunto de preguntas de negocio se puede resolver en tres capas tecnológicas distintas, cada una adecuada a una escala de datos diferente.

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Este notebook requiere Google Colab con conexión a internet (instala PySpark con `!pip install pyspark`), así que no se ha podido ejecutar en este entorno sin red. Sin embargo, cada una de sus consultas Spark SQL ya estaba verificada dentro del propio `notebook_3.3.ipynb` contra el cálculo equivalente en pandas sobre `tienda_online_ventas.csv`; esos mismos números se han recalculado aquí de nuevo con pandas para confirmarlos, y coinciden exactamente con los que obtendréis al ejecutar el notebook en Colab:

| Consulta Spark SQL | Resultado esperado (verificado con pandas) |
| --- | --- |
| 1. Ventas por categoría (`GROUP BY categoria`) | Electrónica 824.029,78 € / 257,51 € medio / 3.200 pedidos (categoría líder); Moda, la última, 333.535,40 € |
| 2. Top 10 clientes por gasto (`GROUP BY cliente_id, cliente_nombre` + `ORDER BY` + `LIMIT`) | Encabeza C100164 (Cliente 0165) con 12.165,81 € |
| 3. Ventas por región y canal (`GROUP BY region, canal`) | La combinación Levante + Web encabeza con 434.205,96 € en 1.929 pedidos |
| 4. Regiones con importe medio > 200 € (`HAVING`) | Las 5 regiones superan el umbral; Cataluña tiene el importe medio más alto (238,71 €) |
| 5. Ranking de clientes (`RANK() OVER (ORDER BY gasto_total DESC)`) | Mismo top 10 que la Consulta 2, con la columna `ranking_gasto` añadida (1 a 10) |
| Consulta 1 repetida con API de DataFrame (`.groupBy().agg()`) | Resultado idéntico, fila a fila, a la Consulta 1 en SQL — ambos estilos compilan al mismo plan de ejecución interno |

**`.explain()` — shuffle sí / no:** la transformación que **sí genera shuffle** es la Consulta 1 repetida con la API de DataFrame (`.groupBy("categoria").agg(...)`): es una transformación *wide*, y su plan físico debe mostrar la línea `Exchange hashpartitioning` porque Spark necesita redistribuir las filas entre particiones para que todas las filas de una misma categoría acaben juntas antes de poder sumarlas. La transformación que **no genera shuffle** es el `filter(F.col("categoria") == "Electrónica")` del mismo paso: es una transformación *narrow* que cada partición puede resolver de forma completamente local (basta con mirar el valor de `categoria` de cada fila, sin necesitar datos de otras particiones), por lo que su plan no contiene ningún `Exchange`. Esta es precisamente la distinción que motiva el laboratorio: las operaciones que agregan o cruzan datos (`groupBy`, `join`, `orderBy` global) son intrínsecamente más costosas en un sistema distribuido que las que solo transforman o filtran fila a fila.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.2): Consultas SQL sobre una base de datos de ejemplo](../lab-3.2-consultas-sql/enunciado.md) · [Laboratorio siguiente (3.4): Clasificación con scikit-learn: de los datos a las métricas](../lab-3.4-clasificacion-scikit-learn/enunciado.md) ⟶
