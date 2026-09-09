# Módulo 2 — Fundamentos del Big Data: laboratorios

**Navegación:** [Índice general de Labs](../README.md) · ⟵ [Módulo 1 — Introducción a la Inteligencia Artificial](../01-introduccion-a-la-ia/README.md) · [Módulo 3 — Herramientas y Tecnologías para IA y Big Data](../03-herramientas-y-tecnologias/README.md) ⟶

## Índice

- [Secuencia recomendada](#secuencia-recomendada)
- [Dataset compartido](#dataset-compartido)

---

Cinco laboratorios que acompañan el temario del módulo 2 ([`02-fundamentos-del-big-data/`](../../02-fundamentos-del-big-data/)), de la exploración conceptual de las 5 Vs hasta el diseño integrador de una arquitectura end-to-end.

| Lab | Título | Duración | Modalidad | Enunciado |
| --- | --- | --- | --- | --- |
| 2.1 | Diagnóstico de las 5 Vs en un dataset real | 60–90 min | Individual o parejas | [`lab-2.1-diagnostico-5vs/enunciado.md`](lab-2.1-diagnostico-5vs/enunciado.md) |
| 2.2 | De CSV a Data Lake: diseña la arquitectura | 90 min | Grupos de 3-4, sin código | [`lab-2.2-arquitectura-data-lake/enunciado.md`](lab-2.2-arquitectura-data-lake/enunciado.md) |
| 2.3 | Primeros pasos con PySpark | 90–120 min | Individual, notebook guiado | [`lab-2.3-primeros-pasos-pyspark/enunciado.md`](lab-2.3-primeros-pasos-pyspark/enunciado.md) |
| 2.4 | Calidad y gobierno de datos: limpia y documenta un dataset | 60–90 min | Individual o parejas | [`lab-2.4-calidad-gobierno-datos/enunciado.md`](lab-2.4-calidad-gobierno-datos/enunciado.md) |
| 2.5 | Caso de uso end-to-end (integrador) | 90–120 min | Grupos de 3-4, cierre de módulo | [`lab-2.5-caso-uso-end-to-end/enunciado.md`](lab-2.5-caso-uso-end-to-end/enunciado.md) |

<a id="secuencia-recomendada"></a>
## Secuencia recomendada

Los laboratorios están pensados para trabajarse en orden: 2.1 y 2.2 sientan las bases (diagnóstico de datos y diseño de arquitectura), 2.3 y 2.4 dan práctica hands-on con procesamiento y calidad sobre el mismo dataset de ventas, y 2.5 cierra el módulo integrando arquitectura, procesamiento y gobierno en un caso de uso completo.

<a id="dataset-compartido"></a>
## Dataset compartido

Los laboratorios 2.1, 2.3 y 2.4 comparten el mismo dataset base — ventas de una tienda online ficticia — para que la comparación entre herramientas (Sheets/pandas en 2.1, PySpark en 2.3, limpieza de datos en 2.4) sea directa:

- `lab-2.1-diagnostico-5vs/tienda_online_ventas.csv` y `lab-2.3-primeros-pasos-pyspark/tienda_online_ventas.csv` — el mismo fichero limpio (12.000 filas).
- `lab-2.4-calidad-gobierno-datos/tienda_online_ventas_dirty.csv` — la misma base de datos con errores de calidad introducidos deliberadamente (12.360 filas), para practicar detección y limpieza.

Los laboratorios 2.2 y 2.5 no usan dataset: son ejercicios de diseño de arquitectura sin código, en grupo.

---

**Navegación:** [Índice general de Labs](../README.md) · ⟵ [Módulo 1 — Introducción a la Inteligencia Artificial](../01-introduccion-a-la-ia/README.md) · [Módulo 3 — Herramientas y Tecnologías para IA y Big Data](../03-herramientas-y-tecnologias/README.md) ⟶
