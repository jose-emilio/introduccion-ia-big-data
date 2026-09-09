# Laboratorio 2.1 — Diagnóstico de las 5 Vs en un dataset real

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.5): Diseña un caso conceptual de IA (integrador)](../../01-introduccion-a-la-ia/lab-1.5-diseno-caso-conceptual/enunciado.md) · [Laboratorio siguiente (2.2): De CSV a Data Lake: diseña la arquitectura](../lab-2.2-arquitectura-data-lake/enunciado.md) ⟶

**Laboratorios relacionados:** [2.3 — Primeros pasos con PySpark](../lab-2.3-primeros-pasos-pyspark/enunciado.md) (usa el mismo dataset `tienda_online_ventas.csv` para repetir el diagnóstico con PySpark); [2.4 — Calidad y gobierno de datos](../lab-2.4-calidad-gobierno-datos/enunciado.md) (usa la variante con errores del mismo dataset).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [El dataset](#el-dataset)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [1. Preparación (5 min)](#1-preparacion-5-min)
  - [2. Volumen y Variedad (15–20 min)](#2-volumen-y-variedad-1520-min)
  - [3. Velocidad y Veracidad (20–25 min)](#3-velocidad-y-veracidad-2025-min)
  - [4. Valor y ficha de diagnóstico (15–20 min)](#4-valor-y-ficha-de-diagnostico-1520-min)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)
  - [1. Volumen](#1-volumen)
  - [2. Velocidad](#2-velocidad)
  - [3. Variedad](#3-variedad)
  - [4. Veracidad](#4-veracidad)
  - [5. Valor](#5-valor)
  - [Reflexión final (ejemplo de respuesta)](#reflexion-final-ejemplo-de-respuesta)

---

> **Bloque temático:** [`01-las-5-vs.md`](../../../02-fundamentos-del-big-data/01-las-5-vs.md)
> **Duración orientativa:** 60–90 minutos
> **Modalidad:** individual o en parejas
> **Herramientas:** Google Sheets **o** Google Colab + pandas (elige la vía según tu soltura; el resultado que se pide es el mismo)

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Identificar las cinco dimensiones del marco de las 5 Vs — Volumen, Velocidad, Variedad, Veracidad y Valor — en un conjunto de datos real, traduciendo el marco teórico visto en el bloque 1 a observaciones concretas y medibles sobre un dataset de ventas.

<a id="contexto"></a>
## Contexto

Las 5 Vs no son una checklist abstracta: son las preguntas que cualquier equipo de datos se hace al recibir un nuevo dataset antes de decidir cómo almacenarlo, procesarlo y explotarlo. En este laboratorio vas a aplicar ese marco a `tienda_online_ventas.csv`, un extracto de pedidos de una tienda online con 12.000 filas y 15 columnas que cubre 20 meses de actividad (enero de 2025 a agosto de 2026).

El CSV es una fotografía estática — un export puntual — pero el ejercicio te pide razonar también sobre cómo se comportaría este mismo tipo de datos en el sistema de producción del que procede: eso es lo que hace interesante la V de Velocidad, que no puedes medir directamente sobre el fichero.

<a id="el-dataset"></a>
## El dataset

Fichero: `tienda_online_ventas.csv` (ya está en esta carpeta).

Columnas:

| Columna | Descripción |
| --- | --- |
| `pedido_id` | Identificador único del pedido |
| `fecha` | Fecha del pedido (2025-01-01 a 2026-08-31) |
| `cliente_id`, `cliente_nombre` | Identificador y nombre del cliente |
| `ciudad`, `region` | Ubicación del cliente |
| `producto_id`, `producto_nombre` | Identificador y nombre del producto |
| `categoria` | Electrónica / Hogar / Deporte / Moda / Papelería |
| `cantidad` | Unidades compradas (1–5) |
| `precio_unitario` | Precio por unidad |
| `importe` | Importe total de la línea (`cantidad × precio_unitario`) |
| `canal` | Web / App móvil / Marketplace |
| `metodo_pago` | Tarjeta / PayPal / Transferencia / Contra reembolso |
| `valoracion` | Puntuación 1–5 dejada por el cliente (bastantes valores vacíos — es intencionado, ver actividad 3) |

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="1-preparacion-5-min"></a>
### Preparación (5 min)

Elige tu vía de trabajo:

- **Google Sheets:** importa `tienda_online_ventas.csv` (Archivo → Importar → Subir). Con 12.000 filas Sheets va sobrado, pero evita fórmulas de array pesadas sobre toda la columna si notas lentitud.
- **Colab + pandas:** abre `notebook_2.1_apoyo_pandas.ipynb` (en esta misma carpeta), súbelo a Colab junto con el CSV, y ejecuta las celdas en orden. El notebook ya calcula los datos que necesitas para las secciones 2 y 3 — tu trabajo es interpretarlos y responder las preguntas en las celdas Markdown.

En ambos casos, el resultado final es el mismo: la ficha de diagnóstico de la actividad 4.

<a id="2-volumen-y-variedad-1520-min"></a>
### Volumen y Variedad (15–20 min)

**Volumen** — Sobre el fichero (no sobre lo que "podría llegar a ser"):

- Número de filas y columnas.
- Tamaño del fichero en disco (en Sheets: mira las propiedades del fichero subido o el tamaño del CSV original; en pandas: `df.memory_usage(deep=True).sum()` te da el tamaño en memoria, que puedes comparar con el tamaño en disco del CSV).
- Con esos dos números, estima: si esta tienda tuviera 50 veces más pedidos (una operación de tamaño medio-grande), ¿de qué orden de magnitud estaríamos hablando — MB, GB, TB? Esa estimación es la que justifica (o no) necesitar herramientas de Big Data.

**Variedad** — Recorre las 15 columnas y clasifícalas por tipo de dato:

- Numéricas (continuas o discretas).
- Categóricas (un conjunto cerrado y pequeño de valores posibles).
- Texto libre (identificadores o nombres, sin un conjunto cerrado de valores).
- Fechas.

Anota cuántas columnas caen en cada grupo. Esta clasificación es la que usarías para decidir qué tipo de análisis o visualización tiene sentido para cada columna.

<a id="3-velocidad-y-veracidad-2025-min"></a>
### Velocidad y Veracidad (20–25 min)

**Velocidad** — Este apartado es conceptual: el CSV es una foto fija, no puedes medir velocidad sobre él directamente. Razona en su lugar:

- ¿Con qué frecuencia se generarían nuevos pedidos en el sistema real del que sale este export (una tienda online en producción)? Piensa en órdenes de magnitud: ¿pedidos por minuto, por hora?
- ¿Qué patrón de ingestión (batch, streaming o ambos) tendría sentido para mantener actualizado un panel de ventas con estos datos? Justifica en 2-3 líneas apoyándote en lo visto sobre batch vs. streaming en el bloque 1.

**Veracidad** — Aquí sí trabajas directamente sobre los datos. Busca:

- **Valores nulos** por columna (Sheets: `=CONTAR.BLANCO()` o filtros; pandas: `df.isnull().sum()`). Vas a encontrar que `valoracion` tiene muchos nulos — antes de marcarlo como "problema de calidad", pregúntate: ¿tiene sentido de negocio que falte este dato? (pista: no todo el mundo que compra deja una valoración). Distingue explícitamente en tu ficha entre un nulo **esperado** (ausencia legítima de dato) y un nulo que sería señal de un **problema real** de calidad.
- **Duplicados** — ¿hay filas exactamente repetidas? (Sheets: formato condicional para duplicados o una columna auxiliar con `CONTAR.SI`; pandas: `df.duplicated().sum()`).
- **Inconsistencias** — revisa los valores únicos de `categoria`, `canal` y `metodo_pago` (Sheets: tabla dinámica o `=ÚNICOS()`; pandas: `df['columna'].unique()`). ¿Están todos escritos de forma homogénea o hay variaciones de mayúsculas/minúsculas o de nombres?

<a id="4-valor-y-ficha-de-diagnostico-1520-min"></a>
### Valor y ficha de diagnóstico (15–20 min)

Con lo observado en los pasos 2 y 3, propón por escrito **una hipótesis de negocio concreta**: qué decisión podría tomar la tienda online a partir de este dataset. No vale "se podrían sacar insights" — tiene que ser una decisión accionable (por ejemplo, sobre qué categoría reforzar stock, qué canal potenciar, o a qué clientes dirigir una campaña). Justifica con al menos un dato observado en el propio CSV.

Rellena la plantilla `ficha-diagnostico-plantilla.md` con las cinco secciones completadas: copia el fichero, complétalo y guárdalo como tu entregable.

<a id="entregable"></a>
## Entregable

Una ficha de diagnóstico de una página (el fichero `ficha-diagnostico-plantilla.md` completado) con las 5 Vs — Volumen, Velocidad, Variedad, Veracidad y Valor — documentadas con los datos y razonamientos obtenidos en las actividades 2, 3 y 4.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

- De las 5 Vs, ¿cuál te ha costado más medir directamente sobre el CSV y por qué? ¿Qué información adicional necesitarías para medirla con precisión?
- Si tuvieras que priorizar una sola V para mejorar antes de usar este dataset en un modelo de predicción de ventas, ¿cuál elegirías y por qué?

---

*Nota: el notebook de apoyo en pandas (`notebook_2.1_apoyo_pandas.ipynb`) es opcional — solo lo necesitas si eliges la vía Colab. Si trabajas en Google Sheets puedes ignorarlo por completo.*

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

A continuación se muestra una ficha de diagnóstico modelo, completada con los datos reales obtenidos al ejecutar `notebook_2.1_apoyo_pandas.ipynb` sobre `tienda_online_ventas.csv`. En Velocidad y Valor hay razonamiento de negocio con más de una respuesta razonable — esta es una, no la única — pero sirve como referencia del nivel de detalle y precisión esperado.

<a id="1-volumen"></a>
### Volumen

- Número de filas: 12.000 · Número de columnas: 15.
- Tamaño en disco: 1.476.202 bytes (≈1,41 MB). Tamaño en memoria ya cargado con pandas: 9.454.302 bytes (≈9,02 MB) — es mayor porque pandas reserva más espacio por el overhead de los objetos Python en las columnas de texto del que ocupa el texto plano en el CSV.
- Estimación a escala 50x: ≈70,4 MB en disco (≈0,069 GB). Sigue siendo un volumen perfectamente manejable con herramientas convencionales (una hoja de cálculo empezaría a notarlo, pero pandas o una base de datos relacional no tendrían ningún problema). El Volumen, por sí solo, no justificaría todavía adoptar herramientas de Big Data a esta escala — haría falta un salto de varios órdenes de magnitud más (cientos de tiendas, o varios años de histórico) para que el argumento fuera sólido.

<a id="2-velocidad"></a>
### Velocidad

- Frecuencia estimada: 12.000 pedidos repartidos en 20 meses son del orden de 20 pedidos/día — un régimen de pedidos por hora, no por minuto ni por segundo.
- Patrón de ingestión recomendado: **batch**, con una cadencia diaria (o como mucho cada pocas horas), es más que suficiente para alimentar un panel de ventas. No hay ningún requisito de negocio (alertas en tiempo real, decisiones automáticas en milisegundos) que justifique streaming a este volumen y frecuencia — el coste operativo adicional de una infraestructura de streaming no estaría compensado por ningún beneficio real.

<a id="3-variedad"></a>
### Variedad

| Tipo de columna | Columnas | Cuántas |
| --- | --- | --- |
| Numéricas continuas | `precio_unitario`, `importe` | 2 |
| Numéricas discretas/acotadas | `cantidad`, `valoracion` | 2 |
| Categóricas | `categoria`, `canal`, `metodo_pago`, `region`, `ciudad` | 5 |
| Texto libre / identificadores | `pedido_id`, `cliente_id`, `cliente_nombre`, `producto_id`, `producto_nombre` | 5 |
| Fechas | `fecha` | 1 |

Pista para llegar a esta clasificación: las columnas con un `pct_unicos` cercano al 100% (`pedido_id` al 100%, `importe` al 84,7%, `precio_unitario` al 68,4%) son identificadores o valores casi continuos; las que tienen solo 3-5 valores únicos (`region`, `canal`, `metodo_pago`, `categoria`, `cantidad`, `valoracion`) son categóricas o numéricas acotadas.

<a id="4-veracidad"></a>
### Veracidad

- Nulos: solo `valoracion` tiene nulos — 1.775 de 12.000 filas (14,79%). Ninguna otra columna tiene ningún nulo.
- ¿`valoracion` nulo es problema real o ausencia legítima? **Ausencia legítima.** No todos los clientes dejan una valoración tras su compra; tratarlo como "dato roto" e imputarlo (por ejemplo, con la media) distorsionaría el análisis de satisfacción en lugar de corregirlo.
- Duplicados: 0 filas exactamente duplicadas (`df.duplicated().sum()` → 0).
- Inconsistencias de formato: ninguna. Los recuentos de `categoria` (Electrónica 3.200, Deporte 2.427, Hogar 2.340, Papelería 2.043, Moda 1.990), `canal` (Web 6.598, App móvil 3.572, Marketplace 1.830) y `metodo_pago` (Tarjeta 6.571, PayPal 3.072, Transferencia 1.403, Contra reembolso 954) no muestran variantes de mayúsculas/minúsculas ni nombres alternativos para el mismo valor. Este CSV está deliberadamente limpio en este aspecto — el laboratorio 2.4 trabajará sobre una versión con estos problemas introducidos a propósito.

<a id="5-valor"></a>
### Valor

- **Hipótesis de negocio:** el canal Web genera 1.512.573,61 € de los 2.762.243,20 € de importe total (el 54,8%), frente al 29,8% de App móvil y el 15,5% de Marketplace — pero el ticket medio por pedido es similar entre los tres canales (en torno a 230 € en los tres casos). Esto indica que la diferencia de ingresos entre canales se explica por el **volumen** de pedidos, no por el valor de cada pedido. Decisión accionable: priorizar la inversión en adquisición de clientes y en mejoras de conversión sobre el canal Web (optimizar el embudo de compra, campañas de captación específicas) tendría más impacto en el ingreso total que intentar subir el ticket medio en App móvil o Marketplace, donde el margen de mejora por pedido es más limitado.
- **Dato que la respalda:** importe total por canal — Web 1.512.573,61 €, App móvil 822.121,57 €, Marketplace 427.548,02 € (`df.groupby('canal')['importe'].sum()`).

<a id="reflexion-final-ejemplo-de-respuesta"></a>
### Reflexión final (ejemplo de respuesta)

- La V que más cuesta medir directamente sobre el CSV es **Velocidad**: el fichero es una fotografía estática de 20 meses, sin ninguna marca de cuándo llegó cada fila al sistema de origen, así que solo puede estimarse indirectamente (total de pedidos entre periodo cubierto). Medirla con precisión exigiría acceso al sistema de producción o, al menos, un timestamp de ingestión.
- Antes de usar este dataset en un modelo de predicción de ventas, la V a priorizar sería **Veracidad**: aunque este CSV en particular está limpio, cualquier pipeline real necesita validar de forma sistemática y recurrente que no se han introducido inconsistencias — un modelo entrenado con datos erróneos propaga ese error a sus predicciones de forma silenciosa.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.5): Diseña un caso conceptual de IA (integrador)](../../01-introduccion-a-la-ia/lab-1.5-diseno-caso-conceptual/enunciado.md) · [Laboratorio siguiente (2.2): De CSV a Data Lake: diseña la arquitectura](../lab-2.2-arquitectura-data-lake/enunciado.md) ⟶
