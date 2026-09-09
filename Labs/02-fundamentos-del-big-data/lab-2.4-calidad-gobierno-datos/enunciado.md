# Laboratorio 2.4 — Calidad y gobierno de datos: limpia y documenta un dataset

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.3): Primeros pasos con PySpark](../lab-2.3-primeros-pasos-pyspark/enunciado.md) · [Laboratorio siguiente (2.5): Caso de uso end-to-end (integrador)](../lab-2.5-caso-uso-end-to-end/enunciado.md) ⟶

**Laboratorios relacionados:** [2.1 — Diagnóstico de las 5 Vs en un dataset real](../lab-2.1-diagnostico-5vs/enunciado.md) (usa la variante "sucia" del dataset diagnosticado en ese laboratorio).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [El dataset](#el-dataset)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [1. Exploración libre — encuentra los problemas por ti mismo (25–30 min)](#1-exploracion-libre-encuentra-los-problemas-por-ti-mismo-2530-min)
  - [2. Confirmación y limpieza con el notebook de apoyo (25–35 min)](#2-confirmacion-y-limpieza-con-el-notebook-de-apoyo-2535-min)
  - [3. Ficha de catálogo (15–20 min)](#3-ficha-de-catalogo-1520-min)
  - [4. Reglas de calidad automatizables (10 min)](#4-reglas-de-calidad-automatizables-10-min)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)
  - [Resumen de la limpieza aplicada](#resumen-de-la-limpieza-aplicada)
  - [Ficha de catálogo modelo (ejemplo resuelto)](#ficha-de-catalogo-modelo-ejemplo-resuelto)

---

> **Bloque temático:** [`05-governance-y-calidad-de-datos.md`](../../../02-fundamentos-del-big-data/05-governance-y-calidad-de-datos.md)
> **Duración orientativa:** 60–90 minutos
> **Modalidad:** individual o en parejas
> **Herramientas:** Google Sheets **o** Colab + pandas

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Aplicar comprobaciones de calidad de datos — validación de esquema, nulos, duplicados y rangos — sobre un dataset con errores reales, y elaborar una ficha mínima de catálogo de datos que documente el resultado limpio.

<a id="contexto"></a>
## Contexto

El apunte de governance describe la calidad de datos como un **proceso continuo**, con controles en cada etapa del pipeline (schema checks, null checks, range validation, deduplication), y el data catalog como el inventario que documenta qué contiene cada dataset, quién es su propietario y si contiene datos personales (PII). Este laboratorio te pone en el lado práctico de ambas ideas: vas a recibir un dataset con problemas reales, vas a tener que encontrarlos tú mismo antes de que nadie te diga cuáles son, y vas a documentar el resultado como lo haría un equipo de datos responsable.

<a id="el-dataset"></a>
## El dataset

Fichero: `tienda_online_ventas_dirty.csv` (12.360 filas) — una versión del dataset del laboratorio 2.1, con el mismo esquema de columnas, pero con errores de calidad introducidos deliberadamente. No se te dice de antemano cuántos tipos de error hay ni dónde están: es parte del ejercicio encontrarlos.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="1-exploracion-libre-encuentra-los-problemas-por-ti-mismo-2530-min"></a>
### Exploración libre — encuentra los problemas por ti mismo (25–30 min)

**Antes de tocar el notebook de apoyo**, abre el CSV en Google Sheets (o cárgalo con pandas si prefieres esa vía, pero sin ejecutar todavía el notebook completo) y dedica este primer bloque a buscar problemas de calidad por tu cuenta, con tus propias herramientas:

- Comprueba si hay **filas duplicadas**.
- Cuenta **valores nulos** en cada columna y decide cuáles son un problema (a diferencia del laboratorio 2.1, aquí varias columnas tienen nulos que no deberían tenerlos).
- Revisa los valores únicos de `categoria` y `canal` — ¿están escritos de forma consistente?
- Mira los valores mínimo y máximo de `cantidad` y de `precio_unitario` — ¿hay algo que no tenga sentido de negocio?
- Comprueba si `importe` es siempre igual a `cantidad × precio_unitario` en todas las filas.
- Revisa el rango de fechas en la columna `fecha` — ¿hay alguna fecha que no debería existir?
- Fíjate en la columna `cliente_id` — ¿todos los valores tienen el mismo formato?

Anota en un borrador (papel, un documento aparte, o directamente en `ficha-catalogo-plantilla.md`) cuántos tipos distintos de problema crees haber encontrado, sin mirar todavía el notebook de apoyo ni la sección siguiente. Este paso es el que de verdad entrena tu ojo para detectar problemas de calidad — si vas directo al notebook con la limpieza ya hecha, te lo pierdes.

<a id="2-confirmacion-y-limpieza-con-el-notebook-de-apoyo-2535-min"></a>
### Confirmación y limpieza con el notebook de apoyo (25–35 min)

Abre `notebook_2.4_apoyo_pandas.ipynb` en Colab (sube también el CSV a la sesión). El notebook detecta y corrige, con código ya escrito y explicado, seis tipos de problema:

1. Filas duplicadas exactas.
2. Nulos en columnas que no deberían tenerlos (`producto_nombre`, `ciudad`, `categoria`, `metodo_pago`).
3. Inconsistencias de casing en `categoria` y `canal` (mezcla de MAYÚSCULAS/minúsculas).
4. Valores fuera de rango en `cantidad`, `precio_unitario` (incluyendo negativos y ceros) y `fecha` (fechas futuras imposibles).
5. Filas donde `importe` no coincide con `cantidad × precio_unitario`.
6. Espacios extra al principio o final de `cliente_id`.

Ejecuta las celdas en orden. Cada detección imprime cuántos casos ha encontrado — compáralos con lo que tú habías anotado en el paso 1. ¿Coinciden? Si encontraste menos tipos de problema de los que detecta el notebook, revisa las celdas de detección que te hayas saltado y entiende por qué se te pasaron.

Al final, el notebook guarda el resultado limpio como `tienda_online_ventas_limpio.csv` en esta misma carpeta.

<a id="3-ficha-de-catalogo-1520-min"></a>
### Ficha de catálogo (15–20 min)

Con el dataset ya limpio, rellena `ficha-catalogo-plantilla.md`:

- **Propietario:** a quién correspondería este dataset en una organización real (por ejemplo, el equipo de e-commerce o ventas online).
- **Descripción:** una o dos frases que expliquen qué contiene el dataset y para qué sirve.
- **Glosario de 3-4 campos clave:** elige las columnas que consideres que más necesitan una definición de negocio explícita (no las más obvias) y explica qué significan.
- **Clasificación de privacidad:** ¿contiene PII (información personal identificable)? Este dataset sí — `cliente_nombre` identifica directamente a una persona, y `ciudad` es un dato indirectamente identificativo cuando se combina con otros campos. Justifica tu respuesta.

<a id="4-reglas-de-calidad-automatizables-10-min"></a>
### Reglas de calidad automatizables (10 min)

El apunte de governance describe la calidad como controles que se aplican en cada etapa del pipeline (schema checks, null checks, range validation, deduplication). Se te da un ejemplo ya resuelto:

> La columna `cantidad` debe estar entre 1 y 20.

Redacta **dos reglas más** de calidad, tan concretas y verificables por código como la de ejemplo, que se podrían automatizar en un pipeline real para detectar automáticamente los tipos de problema que has encontrado en este dataset (o para prevenir que vuelvan a aparecer).

<a id="entregable"></a>
## Entregable

Tres ficheros: el dataset limpio (`tienda_online_ventas_limpio.csv`, generado por el notebook), la ficha de catálogo completada (`ficha-catalogo-plantilla.md`) y las tres reglas de calidad (pueden ir en la propia ficha de catálogo, en la sección correspondiente).

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

- De los seis tipos de problema, ¿cuál te resultó más difícil de detectar a simple vista en el paso 1, y por qué crees que pasa desapercibido fácilmente?
- Si este dataset llegara así de "sucio" a un modelo de predicción de ventas sin pasar por ninguna de estas comprobaciones, ¿qué tipo de error concreto en las predicciones podría causar cada uno de los seis problemas?

---

*Nota: si trabajas en Google Sheets en el paso 1 y 3, puedes seguir sin necesidad de ejecutar el notebook — pero necesitarás ejecutarlo igualmente (o pedirle a un compañero que lo ejecute) para obtener el `tienda_online_ventas_limpio.csv` del entregable, ya que producirlo a mano en Sheets para 12.360 filas con seis tipos de corrección distintos no es práctico.*

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Estas son las cifras reales obtenidas al ejecutar `notebook_2.4_apoyo_pandas.ipynb` sobre `tienda_online_ventas_dirty.csv` (12.360 filas iniciales, 15 columnas).

<a id="resumen-de-la-limpieza-aplicada"></a>
### Resumen de la limpieza aplicada

| Tipo de problema | Nº de casos detectados | Acción aplicada |
| --- | --- | --- |
| Filas duplicadas | 210 exactas antes de normalizar texto; 307 al detectarlas **después** de normalizar casing y espacios (al normalizar "aparecen" 97 duplicados que antes parecían filas distintas solo por una diferencia de mayúsculas) | Eliminadas con `drop_duplicates()` tras normalizar texto — 12.360 → 12.053 filas |
| Nulos inesperados | `producto_nombre`: 247 · `ciudad`: 185 · `categoria`: 247 · `metodo_pago`: 123 | Sustituidos por la etiqueta explícita `"Desconocido"` (no se descarta la fila; el resto de columnas sigue siendo información válida) |
| Inconsistencias de casing | `categoria`: 1.201 filas en formato no canónico (p. ej. `ELECTRÓNICA`) · `canal`: 1.236 filas (p. ej. `web`, `app móvil`) | Normalizadas a los valores canónicos (`Electrónica`, `Hogar`, `Deporte`, `Moda`, `Papelería` / `Web`, `App móvil`, `Marketplace`) |
| Valores fuera de rango | `cantidad`: 25 filas (fuera de 1-20; se observaron valores de hasta 890 unidades) · `precio_unitario`: 25 filas (negativo o cero; mínimo observado -160,75 €) · `fecha` futura imposible (`2027-01-15`): 12 filas | Filas descartadas — no hay forma fiable de reconstruir cuál era el valor correcto |
| `importe` inconsistente con `cantidad × precio_unitario` | 295 filas detectadas sobre el dataset completo; 245 de ellas seguían presentes tras eliminar duplicados, fechas futuras y rangos inválidos | Recalculado como `cantidad × precio_unitario` — es un campo derivado, así que se corrige con confianza en vez de descartar la fila |
| Espacios extra en `cliente_id` | 8 filas | Normalizados con `.strip()` |

**Resultado final:** de 12.360 filas iniciales quedan **11.991 filas limpias** (se eliminaron 369 en total: 307 duplicados + 12 fechas futuras + 25 cantidades inválidas + 25 precios inválidos). `valoracion` conserva sus 1.779 nulos sin modificar, porque — igual que en el laboratorio 2.1 — son una ausencia legítima, no un error de calidad.

**Detalle que no debe sorprender: la verificación final marca `Duplicados restantes: 10`, no 0.** No es un fallo del notebook, sino un efecto real de los datos: hay 5 pedidos duplicados dos veces cada uno (mismo `pedido_id`) cuyo `importe` estaba corrompido de forma *distinta* en cada copia, así que en el paso 2.3 (`drop_duplicates()`, antes de corregir `importe`) todavía no eran filas idénticas y no se eliminaron. Al llegar al paso 2.6 y recalcular `importe = cantidad × precio_unitario`, ambas copias quedan con el mismo valor correcto y se vuelven duplicados perfectos — pero eso ocurre *después* de la deduplicación, así que las 10 filas permanecen en el resultado final. El propio notebook lo explica con una celda dedicada justo después de la verificación (incluyendo cómo localizarlas con `df[df.duplicated(keep=False)]` y cómo eliminarlas con una segunda pasada de `drop_duplicates()` si se quisiera un resultado con cero duplicados). Es un buen ejemplo de que la limpieza de datos rara vez es una única pasada: corregir un problema puede revelar otro que estaba oculto detrás.

<a id="ficha-de-catalogo-modelo-ejemplo-resuelto"></a>
### Ficha de catálogo modelo (ejemplo resuelto)

**Propietario:** Equipo de E-commerce / Analítica de Ventas — sería el responsable de mantener el dataset y de resolver dudas sobre su contenido.

**Descripción:** Dataset transaccional con el detalle de pedidos de la tienda online (una fila por línea de pedido), ya limpio y validado. Se usa como fuente para reporting de ventas, segmentación de clientes y como base para modelos predictivos de demanda o de abandono (churn).

**Glosario de campos clave:**

| Campo | Definición de negocio |
| --- | --- |
| `importe` | Importe facturado de la línea de pedido. Es un campo **derivado** (`cantidad × precio_unitario`); si no coincide con ese cálculo se considera un error de calidad y se recalcula — nunca se acepta el valor original sin verificar. |
| `valoracion` | Puntuación 1-5 dejada voluntariamente por el cliente tras la compra. Un valor nulo **no** es un error: significa que el cliente no valoró su pedido. |
| `canal` | Vía por la que se realizó el pedido (Web, App móvil, Marketplace). Normalizado a estos tres valores canónicos; cualquier variante de mayúsculas/minúsculas se considera el mismo canal. |
| `metodo_pago` | Forma de pago usada (Tarjeta, PayPal, Transferencia, Contra reembolso). A diferencia de `valoracion`, un nulo aquí **sí** es un problema de calidad — el pedido tuvo que pagarse de alguna forma. |

**Clasificación de privacidad (PII):** Sí, contiene PII.

- `cliente_nombre`: PII directa — identifica a una persona física por su nombre.
- `cliente_id`: cuasi-identificador — no es PII por sí solo, pero permite reidentificar a un cliente concreto al cruzarlo con otros pedidos o sistemas.
- `ciudad`: PII indirecta — combinada con otros campos (fecha, producto, importe) puede ayudar a reidentificar a un individuo, especialmente en ciudades pequeñas con pocos clientes.

**Reglas de calidad automatizables:**

1. La columna `cantidad` debe estar entre 1 y 20. *(ejemplo ya dado en el enunciado)*
2. La columna `precio_unitario` debe ser estrictamente mayor que 0 — cualquier valor negativo o cero se rechaza antes de cargar la fila en el almacén de analítica (detecta exactamente el problema real encontrado: 25 filas con precios negativos o cero, mínimo -160,75 €).
3. La columna `fecha` no puede contener valores posteriores a la fecha de carga del dato (no se permiten fechas futuras) — detecta exactamente el problema real encontrado: 12 filas con fecha `2027-01-15`, imposible en el momento de la carga.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.3): Primeros pasos con PySpark](../lab-2.3-primeros-pasos-pyspark/enunciado.md) · [Laboratorio siguiente (2.5): Caso de uso end-to-end (integrador)](../lab-2.5-caso-uso-end-to-end/enunciado.md) ⟶
