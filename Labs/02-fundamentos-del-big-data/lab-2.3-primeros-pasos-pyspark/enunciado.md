# Laboratorio 2.3 — Primeros pasos con PySpark

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.2): De CSV a Data Lake: diseña la arquitectura](../lab-2.2-arquitectura-data-lake/enunciado.md) · [Laboratorio siguiente (2.4): Calidad y gobierno de datos](../lab-2.4-calidad-gobierno-datos/enunciado.md) ⟶

**Laboratorios relacionados:** [2.1 — Diagnóstico de las 5 Vs en un dataset real](../lab-2.1-diagnostico-5vs/enunciado.md) (parte del mismo dataset y del mismo diagnóstico inicial de las 5 Vs).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Cómo trabajar](#como-trabajar)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [1. Arranque del entorno (10–15 min)](#1-arranque-del-entorno-1015-min)
  - [2. Cinco transformaciones básicas (40–50 min)](#2-cinco-transformaciones-basicas-4050-min)
  - [3. Lazy evaluation: el plan antes que la ejecución (15–20 min)](#3-lazy-evaluation-el-plan-antes-que-la-ejecucion-1520-min)
  - [4. Tabla comparativa Spark ↔ hoja de cálculo (10–15 min)](#4-tabla-comparativa-spark-hoja-de-calculo-1015-min)
- [Entregable](#entregable)
- [Cierre](#cierre)
- [Solución propuesta](#solucion-propuesta)
  - [Resultado esperado de cada transformación](#resultado-esperado-de-cada-transformacion)
  - [Tabla comparativa Spark ↔ Sheets/Excel completada](#tabla-comparativa-spark-sheetsexcel-completada)
  - [Qué muestra el `.explain()` y por qué](#que-muestra-el-explain-y-por-que)

---

> **Bloque temático:** [`04b-procesamiento-spark.md`](../../../02-fundamentos-del-big-data/04b-procesamiento-spark.md)
> **Duración orientativa:** 90–120 minutos
> **Modalidad:** individual, notebook guiado
> **Herramientas:** Google Colab + PySpark¹

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Perder el miedo a Apache Spark ejecutando transformaciones básicas de DataFrame — `select`, `filter`, `groupBy`, `join`, `orderBy` — sobre un dataset conocido, comparando en cada paso la sintaxis de Spark con la operación equivalente que ya conoces de una hoja de cálculo.

<a id="contexto"></a>
## Contexto

En el laboratorio 2.1 ya exploraste `tienda_online_ventas.csv` con pandas o Sheets. Ese mismo fichero está en esta carpeta, y lo vas a volver a explorar — pero esta vez con la API de DataFrames de Spark, el motor de procesamiento distribuido que viste en el bloque de procesamiento. La comparación es intencionada: quieres comprobar que, conceptualmente, filtrar, agrupar y ordenar filas es la misma operación tanto si la haces en Sheets, en pandas o en Spark. Lo que cambia es que Spark está diseñado para que esa misma operación funcione igual de bien sobre 12.000 filas que sobre 12.000 millones, porque el trabajo se reparte entre varios nodos.

En este laboratorio no vas a notar esa distribución (Colab te da un único nodo), pero sí vas a ver algo que sí es exclusivo de Spark frente a pandas: Spark no ejecuta cada operación al momento, sino que construye un plan de ejecución y lo optimiza antes de lanzarlo — es la llamada **lazy evaluation**, que veréis en la actividad 3.

<a id="como-trabajar"></a>
## Cómo trabajar

Abre `notebook_2.3_pyspark.ipynb` en Google Colab (súbelo desde tu ordenador o desde Google Drive) y sube también `tienda_online_ventas.csv` a la sesión de Colab. El notebook ya trae todo el código de las transformaciones escrito y lo único que tienes que hacer es **ejecutar las celdas en orden** y completar las pocas celdas Markdown marcadas con `✏️` donde se te pide una observación o comparación.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="1-arranque-del-entorno-1015-min"></a>
### Arranque del entorno (10–15 min)

La primera celda instala PySpark y crea una `SparkSession`, el punto de entrada a toda la API de Spark — el equivalente a abrir la aplicación antes de poder trabajar con una hoja de cálculo. Ejecútala y espera a que termine (la instalación puede tardar 1-2 minutos). A continuación, el notebook carga el CSV en un DataFrame de Spark.

<a id="2-cinco-transformaciones-basicas-4050-min"></a>
### Cinco transformaciones básicas (40–50 min)

El notebook recorre, una a una, cinco operaciones que ya conoces de trabajar con hojas de cálculo o con pandas, mostrando su equivalente en PySpark:

1. **Filtrar filas** — quedarte solo con los pedidos de la categoría "Electrónica" (equivalente a un filtro de columna en Sheets).
2. **Seleccionar columnas** — quedarte solo con un subconjunto de columnas (equivalente a ocultar u ocultar-no-mostrar columnas, o a un `SELECT` en SQL).
3. **Agrupar y agregar** — calcular el importe medio y el importe total por categoría (equivalente a una tabla dinámica agrupando por categoría con "Promedio" y "Suma" de importe).
4. **Ordenar resultados** — ordenar esas categorías de mayor a menor importe total (equivalente a ordenar una columna en Sheets).
5. **Combinar con `join`** — enriquecer los datos agregados por categoría con información adicional de un segundo DataFrame (equivalente a un `BUSCARV`/`VLOOKUP` o a combinar dos tablas dinámicas).

Ejecuta cada celda y observa el resultado antes de pasar a la siguiente.

<a id="3-lazy-evaluation-el-plan-antes-que-la-ejecucion-1520-min"></a>
### Lazy evaluation: el plan antes que la ejecución (15–20 min)

El notebook ejecuta `.explain()` sobre una de las consultas anteriores, lo que imprime el **plan de ejecución** que Spark ha construido — no el resultado, sino los pasos que Spark *va a* seguir para calcularlo. Lee la celda Markdown que sigue (ya escrita, con huecos para que completes tu propia observación) y responde ahí: ¿en qué se parece o se diferencia este plan de lo que harías tú mentalmente al resolver la misma consulta paso a paso?

Esto conecta con un concepto central de Spark: las transformaciones (`select`, `filter`, `groupBy`...) no se ejecutan al momento de escribirlas, sino que Spark las acumula en un plan lógico, lo optimiza con el motor Catalyst, y solo lo ejecuta de verdad cuando pides un resultado concreto (una acción como `.show()`, `.collect()` o `.count()`). A esto se le llama **evaluación perezosa (lazy evaluation)**.

<a id="4-tabla-comparativa-spark-hoja-de-calculo-1015-min"></a>
### Tabla comparativa Spark ↔ hoja de cálculo (10–15 min)

Al final del notebook hay una tabla Markdown con la columna "Operación en PySpark" ya rellena. Completa tú la columna "Equivalente en Sheets/Excel" para cada una de las 5 operaciones trabajadas.

<a id="entregable"></a>
## Entregable

El notebook `notebook_2.3_pyspark.ipynb` ejecutado de principio a fin (todas las celdas con su salida visible, sin errores), con las celdas Markdown `✏️` completadas y la tabla comparativa final rellena.

<a id="cierre"></a>
## Cierre

Spark no sustituye a pandas ni a Sheets para datasets pequeños como este — de hecho, para 12.000 filas pandas es más rápido y más simple. La razón de aprender Spark es que su API es prácticamente la misma cuando el dataset pasa a tener 12 millones o 12.000 millones de filas y ya no cabe en la memoria de un único ordenador. Lo que has practicado hoy con sintaxis (`select`, `filter`, `groupBy`, `join`) es exactamente lo que usarás cuando ese salto de escala sea real.

---

¹ *Este notebook usa PySpark, que se instala automáticamente en la primera celda (`!pip install pyspark`) — necesita conexión a internet, algo que Google Colab ya proporciona.*

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Los resultados de cada transformación (verificados recalculándolos con pandas sobre el mismo `tienda_online_ventas.csv`, ya que deben coincidir exactamente con lo que produce PySpark sobre los mismos datos) son los siguientes.

<a id="resultado-esperado-de-cada-transformacion"></a>
### Resultado esperado de cada transformación

**1. Filtrar — categoría "Electrónica":** 3.200 pedidos de los 12.000 totales (26,7%).

**2. Seleccionar columnas:** `df_resumen` contiene las mismas 12.000 filas, solo con las columnas `pedido_id`, `fecha`, `categoria`, `importe` — no cambia el número de filas, solo el de columnas (de 15 a 4).

**3. Agrupar y agregar — importe medio y total por categoría:**

| categoria | importe_medio | importe_total | num_pedidos |
| --- | --- | --- | --- |
| Electrónica | 257,51 | 824.029,78 | 3.200 |
| Deporte | 281,37 | 682.886,96 | 2.427 |
| Papelería | 237,76 | 485.748,23 | 2.043 |
| Hogar | 186,34 | 436.042,83 | 2.340 |
| Moda | 167,61 | 333.535,40 | 1.990 |

**4. Ordenar por `importe_total` descendente:** el orden de salida es exactamente el de la tabla anterior (Electrónica → Deporte → Papelería → Hogar → Moda) — nótese que no coincide con el orden por `importe_medio` (ahí Deporte sería primero), una buena comprobación de que se está ordenando por la columna correcta.

**5. Join con márgenes y beneficio estimado** (`importe_total × margen_pct / 100`), ordenado por beneficio descendente:

| categoria | importe_total | margen_pct | beneficio_estimado |
| --- | --- | --- | --- |
| Papelería | 485.748,23 | 28,0 | 136.009,50 |
| Deporte | 682.886,96 | 18,0 | 122.919,65 |
| Moda | 333.535,40 | 35,0 | 116.737,39 |
| Electrónica | 824.029,78 | 12,5 | 103.003,72 |
| Hogar | 436.042,83 | 22,0 | 95.929,42 |

Nótese el giro respecto a la tabla 3: Electrónica es la categoría con más importe facturado, pero no la de más beneficio estimado — tiene el margen porcentual más bajo (12,5%). Papelería, con mucho menos importe total, sale primera en beneficio por tener el margen más alto (28%). Es exactamente el tipo de matiz que un `join` permite descubrir y que no aparecería mirando solo el importe.

<a id="tabla-comparativa-spark-sheetsexcel-completada"></a>
### Tabla comparativa Spark ↔ Sheets/Excel completada

| Operación en PySpark | Equivalente en Sheets/Excel |
| --- | --- |
| `df.filter(F.col("categoria") == "Electrónica")` | Filtro de columna / autofiltro sobre `categoria`, mostrando solo las filas con valor "Electrónica" (o `=FILTRO(rango, columna_categoria="Electrónica")`) |
| `df.select("pedido_id", "fecha", "categoria", "importe")` | Ocultar el resto de columnas, o extraer esas cuatro columnas a una hoja nueva con `=FILTRO(...)` indicando solo esas columnas |
| `df.groupBy("categoria").agg(F.avg("importe"), F.sum("importe"))` | Tabla dinámica agrupando por `categoria`, con "Promedio" y "Suma" de `importe` como valores |
| `df.orderBy(F.desc("importe_total"))` | Ordenar la tabla dinámica (o el rango) por la columna de importe total, de mayor a menor (Datos → Ordenar rango) |
| `df_por_categoria.join(margenes, on="categoria", how="left")` | `BUSCARV`/`VLOOKUP` (o `XLOOKUP`) desde la tabla de categorías hacia una tabla auxiliar de márgenes, trayendo `margen_pct` por `categoria` |

<a id="que-muestra-el-explain-y-por-que"></a>
### Qué muestra el `.explain()` y por qué

El plan se lee de abajo hacia arriba: primero un `FileScan csv` (lectura del fichero), después un `HashAggregate` parcial que agrega dentro de cada partición, un `Exchange` — el *shuffle*: Spark tiene que redistribuir las filas entre particiones agrupándolas por `categoria` antes de poder agregar correctamente — y por último otro `HashAggregate` que combina los resultados parciales en el resultado final. Que `.explain()` imprima este plan sin que aparezca ningún resultado numérico es la prueba directa de la *lazy evaluation*: las transformaciones (`groupBy`, `agg`...) no se ejecutan al escribirlas, solo se registran en un plan lógico que Catalyst optimiza; ese plan solo se ejecuta de verdad cuando se invoca una acción (`.show()`, `.collect()`, `.count()`), y `.explain()` únicamente compila y muestra el plan, sin disparar esa ejecución.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.2): De CSV a Data Lake: diseña la arquitectura](../lab-2.2-arquitectura-data-lake/enunciado.md) · [Laboratorio siguiente (2.4): Calidad y gobierno de datos](../lab-2.4-calidad-gobierno-datos/enunciado.md) ⟶
