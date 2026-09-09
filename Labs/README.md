# Labs — Curso IA y Big Data

**Navegación:** este es el índice general · [Módulo 1 — Introducción a la Inteligencia Artificial](01-introduccion-a-la-ia/README.md) · [Módulo 2 — Fundamentos del Big Data](02-fundamentos-del-big-data/README.md) · [Módulo 3 — Herramientas y Tecnologías para IA y Big Data](03-herramientas-y-tecnologias/README.md)

## Índice

- [Índice por módulo](#indice-por-modulo)
- [Los 17 laboratorios, en orden](#los-17-laboratorios-en-orden)
- [Datasets](#datasets)
- [Nota sobre la verificación de los notebooks](#nota-sobre-la-verificacion-de-los-notebooks)
- [Estructura de cada laboratorio](#estructura-de-cada-laboratorio)

---

Implementación completa de los 17 laboratorios prácticos propuestos para el curso, organizados por módulo y alineados con los [apuntes del curso](../README.md) del temario. Cada laboratorio incluye un `enunciado.md` detallado (objetivo, contexto, actividades paso a paso, entregable y preguntas de reflexión) y, cuando el laboratorio lo requiere, un notebook con **todo el código ya escrito y verificado**: el alumnado solo tiene que ejecutarlo (y, en algunos casos, cambiar algún parámetro señalado para experimentar), nunca escribirlo desde cero.

<a id="indice-por-modulo"></a>
## Índice por módulo

| Módulo | Labs | Carpeta |
| --- | --- | --- |
| 1 — Introducción a la Inteligencia Artificial | 5 (1.1 a 1.5) | [`01-introduccion-a-la-ia/`](01-introduccion-a-la-ia/) |
| 2 — Fundamentos del Big Data | 5 (2.1 a 2.5) | [`02-fundamentos-del-big-data/`](02-fundamentos-del-big-data/) |
| 3 — Herramientas y Tecnologías para IA y Big Data | 7 (3.1 a 3.7) | [`03-herramientas-y-tecnologias/`](03-herramientas-y-tecnologias/) |

Cada carpeta de módulo tiene su propio `README.md` con la tabla completa de laboratorios (título, duración, modalidad y enlace al enunciado) y notas sobre la secuencia recomendada.

<a id="los-17-laboratorios-en-orden"></a>
## Los 17 laboratorios, en orden

Lista completa en el orden en que están pensados para trabajarse (cada `enunciado.md` enlaza además al laboratorio anterior y siguiente, y a los laboratorios relacionados, para poder moverse por todo el curso sin volver aquí cada vez).

**Módulo 1 — Introducción a la Inteligencia Artificial**

- [1.1 — Cartografía de la IA a tu alrededor](01-introduccion-a-la-ia/lab-1.1-cartografia-ia/enunciado.md)
- [1.2 — Entrena tu primer modelo de Machine Learning](01-introduccion-a-la-ia/lab-1.2-primer-modelo-ml/enunciado.md)
- [1.3 — Ingeniería de prompts con un LLM](01-introduccion-a-la-ia/lab-1.3-ingenieria-prompts/enunciado.md)
- [1.4 — Auditoría de sesgo y riesgo de un caso real](01-introduccion-a-la-ia/lab-1.4-auditoria-sesgo/enunciado.md)
- [1.5 — Diseña un caso conceptual de IA (integrador)](01-introduccion-a-la-ia/lab-1.5-diseno-caso-conceptual/enunciado.md)

**Módulo 2 — Fundamentos del Big Data**

- [2.1 — Diagnóstico de las 5 Vs en un dataset real](02-fundamentos-del-big-data/lab-2.1-diagnostico-5vs/enunciado.md)
- [2.2 — De CSV a Data Lake: diseña la arquitectura](02-fundamentos-del-big-data/lab-2.2-arquitectura-data-lake/enunciado.md)
- [2.3 — Primeros pasos con PySpark](02-fundamentos-del-big-data/lab-2.3-primeros-pasos-pyspark/enunciado.md)
- [2.4 — Calidad y gobierno de datos](02-fundamentos-del-big-data/lab-2.4-calidad-gobierno-datos/enunciado.md)
- [2.5 — Caso de uso end-to-end (integrador)](02-fundamentos-del-big-data/lab-2.5-caso-uso-end-to-end/enunciado.md)

**Módulo 3 — Herramientas y Tecnologías para IA y Big Data**

- [3.1 — Limpieza y exploración de datos con Pandas](03-herramientas-y-tecnologias/lab-3.1-limpieza-exploracion-pandas/enunciado.md)
- [3.2 — Consultas SQL sobre una base de datos de ejemplo](03-herramientas-y-tecnologias/lab-3.2-consultas-sql/enunciado.md)
- [3.3 — Tu primer pipeline distribuido con Spark SQL](03-herramientas-y-tecnologias/lab-3.3-pipeline-spark-sql/enunciado.md)
- [3.4 — Clasificación con scikit-learn: de los datos a las métricas](03-herramientas-y-tecnologias/lab-3.4-clasificacion-scikit-learn/enunciado.md)
- [3.5 — Dashboard con Power BI / Looker Studio](03-herramientas-y-tecnologias/lab-3.5-dashboard-bi/enunciado.md)
- [3.6 — Despliega un modelo simple en la nube](03-herramientas-y-tecnologias/lab-3.6-despliegue-gradio/enunciado.md)
- [3.7 — Caso conceptual de principio a fin: predicción de churn (integrador)](03-herramientas-y-tecnologias/lab-3.7-caso-churn-integrador/enunciado.md)

<a id="datasets"></a>
## Datasets

Todos los datasets usados por los laboratorios son **sintéticos, reproducibles y sin dependencias externas** (no requieren conexión a internet ni registro en ningún servicio para descargarlos: ya están incluidos). Se han diseñado para que varios laboratorios compartan el mismo dataset base y así permitir comparar herramientas distintas (Sheets, pandas, SQL, Spark) sobre las mismas preguntas de negocio. Cada dataset está copiado directamente dentro de la carpeta del laboratorio que lo usa (no hace falta ir a buscarlo a otro sitio); además se conserva una copia centralizada de referencia en [`_datasets/`](_datasets/):

- **`tienda_online_ventas.csv`** (12.000 filas) — ventas de una tienda online ficticia (pedidos, clientes, productos, categorías, canales). Usado en los laboratorios 2.1, 2.3, 3.1, 3.3 y 3.5.
- **`tienda_online_ventas_dirty.csv`** (12.360 filas) — la misma base con errores de calidad inyectados deliberadamente (duplicados, nulos, outliers, incoherencias de formato, errores lógicos) para el laboratorio 2.4.
- **`tienda.db`** (SQLite) — versión normalizada del mismo dataset de ventas (tablas `clientes`, `productos`, `pedidos`, `detalle_pedido`), para el laboratorio 3.2.
- **`churn_telecom.csv`** (4.200 filas) — clientes de una operadora de telecomunicaciones ficticia, con correlaciones realistas entre antigüedad, tipo de contrato, incidencias de soporte y cancelación (`churn`). Usado en el laboratorio integrador 3.7.
- **`fraude_transacciones.csv`** (6.000 filas, ~1.7% de fraude) — transacciones con clase muy desbalanceada, pensado para el laboratorio 3.4 (clasificación) y reutilizado por el modelo desplegado en el laboratorio 3.6.
- **`caso_scoring_crediticio.csv`** (28 filas) — caso de scoring crediticio con un sesgo de variable proxy (barrio) deliberadamente incorporado en los datos, para el laboratorio 1.4.

<a id="nota-sobre-la-verificacion-de-los-notebooks"></a>
## Nota sobre la verificación de los notebooks

Todos los notebooks basados en pandas, scikit-learn y SQLite (laboratorios 1.2, 2.1, 2.4, 3.1, 3.2, 3.4 y 3.7) se han **ejecutado de principio a fin en este mismo entorno** (extrayendo el código de cada notebook y ejecutándolo como script) para confirmar que corren sin errores con los datos entregados.

Los laboratorios 2.3 y 3.3 usan PySpark, y el laboratorio 3.6 usa Gradio: estas dos herramientas requieren instalarse desde internet (`!pip install pyspark` / `!pip install gradio`), algo que Google Colab —el entorno en el que se espera que el alumnado trabaje— proporciona automáticamente en la primera celda de cada notebook, pero que no estaba disponible en el entorno donde se ha preparado este material. Para esos laboratorios, cada transformación se ha verificado primero calculando el mismo resultado con pandas/SQL sobre el mismo dataset (constatando que los números coinciden) antes de traducirla a la sintaxis de PySpark, y el modelo del laboratorio 3.6 se ha probado directamente con el pipeline de scikit-learn ya entrenado (sin pasar por Gradio) para confirmar que las predicciones son correctas antes de escribir la interfaz. Si al ejecutarlos en Colab se detectara cualquier detalle a pulir, es el único punto del material que no ha podido probarse de extremo a extremo tal y como lo verá el alumnado.

<a id="estructura-de-cada-laboratorio"></a>
## Estructura de cada laboratorio

Dentro de cada carpeta `lab-N.N-nombre/` se puede encontrar, según el tipo de laboratorio:

- `enunciado.md` — instrucciones completas para el alumnado.
- `notebook_*.ipynb` — notebook con el código ya escrito (cuando el laboratorio lo requiere).
- Plantillas en Markdown (`plantilla-*.md`, `ficha-*.md`, `rubrica-evaluacion.md`) para las actividades sin código.
- `notas-para-el-facilitador.md` — solución de referencia, presente solo en los laboratorios donde el profesorado se beneficia de tener una respuesta modelo para validar el trabajo de los grupos (no se entrega al alumnado).
- El o los datasets necesarios, ya copiados dentro de la propia carpeta.

---

**Navegación:** este es el índice general · [Módulo 1 — Introducción a la Inteligencia Artificial](01-introduccion-a-la-ia/README.md) · [Módulo 2 — Fundamentos del Big Data](02-fundamentos-del-big-data/README.md) · [Módulo 3 — Herramientas y Tecnologías para IA y Big Data](03-herramientas-y-tecnologias/README.md)
