# Módulo 3 — Herramientas y Tecnologías para IA y Big Data · Labs

**Navegación:** [Índice general de Labs](../README.md) · ⟵ [Módulo 2 — Fundamentos del Big Data](../02-fundamentos-del-big-data/README.md)

## Índice

- [Recorrido y dependencias entre laboratorios](#recorrido-y-dependencias-entre-laboratorios)
- [Bloques del temario cubiertos](#bloques-del-temario-cubiertos)

---

Siete laboratorios prácticos que recorren el stack tecnológico completo del módulo: Python/pandas, SQL, Spark, scikit-learn, BI, despliegue en la nube y un caso integrador de cierre. Cada carpeta contiene su `enunciado.md` con instrucciones detalladas y, cuando aplica, un notebook o los ficheros de código ya resueltos y verificados.

| # | Laboratorio | Duración | Enunciado |
| --- | --- | --- | --- |
| 3.1 | Limpieza y exploración de datos con Pandas | 120 min | [lab-3.1-limpieza-exploracion-pandas/enunciado.md](lab-3.1-limpieza-exploracion-pandas/enunciado.md) |
| 3.2 | Consultas SQL sobre una base de datos de ejemplo | 90 min | [lab-3.2-consultas-sql/enunciado.md](lab-3.2-consultas-sql/enunciado.md) |
| 3.3 | Tu primer pipeline distribuido con Spark SQL | 90 min | [lab-3.3-pipeline-spark-sql/enunciado.md](lab-3.3-pipeline-spark-sql/enunciado.md) |
| 3.4 | Clasificación con scikit-learn: de los datos a las métricas | 120–150 min | [lab-3.4-clasificacion-scikit-learn/enunciado.md](lab-3.4-clasificacion-scikit-learn/enunciado.md) |
| 3.5 | Dashboard con Power BI / Looker Studio | 90–120 min | [lab-3.5-dashboard-bi/enunciado.md](lab-3.5-dashboard-bi/enunciado.md) |
| 3.6 | Despliega un modelo simple en la nube (nivel gratuito) | 60–90 min | [lab-3.6-despliegue-gradio/enunciado.md](lab-3.6-despliegue-gradio/enunciado.md) |
| 3.7 | (Integrador) Caso conceptual de principio a fin: predicción de churn | 150 min | [lab-3.7-caso-churn-integrador/enunciado.md](lab-3.7-caso-churn-integrador/enunciado.md) |

<a id="recorrido-y-dependencias-entre-laboratorios"></a>
## Recorrido y dependencias entre laboratorios

- **3.1 → 3.2 → 3.3**: el mismo dataset de ventas de una tienda online (`tienda_online_ventas.csv`, o su versión normalizada en `tienda.db`) se analiza sucesivamente con pandas, SQL y Spark SQL, para comparar sintaxis y paradigmas sobre las mismas preguntas de negocio.
- **3.4 → 3.6**: el laboratorio 3.4 entrena y guarda `modelo_fraude.joblib`; el laboratorio 3.6 despliega ese mismo modelo como un mini-servicio web con Gradio. Es necesario completar 3.4 antes de 3.6.
- **3.5**: laboratorio independiente (sin código), sobre el mismo dataset de ventas que 3.1/3.3, centrado en visualización y BI.
- **3.7 (integrador)**: cierre del módulo, reutiliza la metodología de 3.1 (EDA) y 3.4 (modelado y evaluación) sobre un nuevo caso de negocio (churn de clientes de telecomunicaciones). Puede usarse como evaluación final del curso completo.

<a id="bloques-del-temario-cubiertos"></a>
## Bloques del temario cubiertos

Cada laboratorio referencia su apunte fuente correspondiente en `../../03-herramientas-y-tecnologias/`:

1. Python y Entornos (3.1)
2. SQL y NoSQL (3.2)
3. Spark y Procesamiento Distribuido (3.3)
4. ML, DL y Evaluación (3.4)
5. BI y Visualización (3.5)
6. Cloud y MLOps (3.6)
7. Casos Conceptuales y Cierre (3.7)

---

**Navegación:** [Índice general de Labs](../README.md) · ⟵ [Módulo 2 — Fundamentos del Big Data](../02-fundamentos-del-big-data/README.md)
