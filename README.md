# Apuntes del curso — IA y Big Data

Transcripción fiel en Markdown de las tres presentaciones del curso, organizada por bloques temáticos para facilitar su lectura y consulta por parte del alumnado de forma autónoma, sin necesidad de las diapositivas originales (que el profesorado proyecta en clase).

Cuando un bloque incluye un diagrama cuyo texto no era recuperable como texto plano (infografías con el texto integrado en la imagen), el contenido se ha transcrito igualmente a mano y además se ha incrustado la imagen original junto a la transcripción, dentro de la carpeta `imagenes/` de cada módulo.

Además de estos apuntes, este repositorio incluye en [`Labs/`](Labs/) 17 laboratorios prácticos (uno por bloque temático, organizados en los mismos 3 módulos), cada uno con su `enunciado.md` y, cuando aplica, un notebook con el código ya escrito y verificado. Empezad por [`Labs/README.md`](Labs/README.md) para el índice completo.

<a id="modulo-1"></a>
## Módulo 1 — Introducción a la Inteligencia Artificial

_8 bloques temáticos · carpeta [`01-introduccion-a-la-ia/`](01-introduccion-a-la-ia/)_

1. [Introducción y objetivos](01-introduccion-a-la-ia/00-introduccion-y-objetivos.md)
2. [Definir IA](01-introduccion-a-la-ia/01-definir-ia.md) — concepto, alcance y paradigmas (IA simbólica, basada en datos, híbrida)
3. [Machine Learning y Deep Learning](01-introduccion-a-la-ia/02-machine-learning-y-deep-learning.md) — tipos de ML, entrenamiento, redes neuronales, backpropagation
4. [IA Generativa y LLM](01-introduccion-a-la-ia/03-ia-generativa-y-llm.md) — hitos históricos, Transformer, modelos fundacionales, RAG, agentes
5. [Aplicaciones sectoriales](01-introduccion-a-la-ia/04-aplicaciones-sectoriales.md) — visión, NLP, robótica, salud, finanzas, industria, retail
6. [Riesgos y regulación](01-introduccion-a-la-ia/05-riesgos-y-regulacion.md) — sesgo, privacidad, explicabilidad, AI Act, propiedad intelectual
7. [Tendencias 2026](01-introduccion-a-la-ia/06-tendencias-2026.md) — adopción empresarial, capacidades y límites
8. [Casos conceptuales y cierre](01-introduccion-a-la-ia/07-casos-conceptuales-y-cierre.md) — mantenimiento predictivo, asistente RAG, mapa final, puente a Big Data

<a id="modulo-2"></a>
## Módulo 2 — Fundamentos del Big Data

_8 bloques temáticos · carpeta [`02-fundamentos-del-big-data/`](02-fundamentos-del-big-data/)_

1. [Introducción y objetivos](02-fundamentos-del-big-data/00-introduccion-y-objetivos.md)
2. [Las 5 Vs](02-fundamentos-del-big-data/01-las-5-vs.md) — volumen, velocidad, variedad, veracidad, valor, variabilidad
3. [Fuentes y tipos de datos](02-fundamentos-del-big-data/02-fuentes-y-tipos-de-datos.md) — estructurados, semiestructurados, no estructurados
4. [Arquitectura Big Data](02-fundamentos-del-big-data/03-arquitectura-big-data.md) — ingestión, warehouse, lake, lakehouse, data mesh
5. [Procesamiento — fundamentos y Hadoop](02-fundamentos-del-big-data/04a-procesamiento-fundamentos-y-hadoop.md) — distribución, HDFS, YARN, MapReduce
6. [Procesamiento — Apache Spark](02-fundamentos-del-big-data/04b-procesamiento-spark.md) — arquitectura Spark, streaming, MLlib, coste y FinOps
7. [Governance y calidad de datos](02-fundamentos-del-big-data/05-governance-y-calidad-de-datos.md) — catálogo, linaje, seguridad, privacidad, calidad, observabilidad
8. [Casos de uso](02-fundamentos-del-big-data/06-casos-de-uso.md) — fraude, IoT industrial, salud, retail, energía

<a id="modulo-3"></a>
## Módulo 3 — Herramientas y Tecnologías para IA y Big Data

_8 bloques temáticos · carpeta [`03-herramientas-y-tecnologias/`](03-herramientas-y-tecnologias/)_

1. [Introducción y objetivos](03-herramientas-y-tecnologias/00-introduccion-y-objetivos.md)
2. [Python y entornos](03-herramientas-y-tecnologias/01-python-y-entornos.md) — NumPy, Pandas, EDA, calidad de datos, feature engineering
3. [SQL y NoSQL](03-herramientas-y-tecnologias/02-sql-y-nosql.md) — SQL, familias NoSQL, criterios de elección
4. [Spark y procesamiento distribuido](03-herramientas-y-tecnologias/03-spark-y-procesamiento-distribuido.md) — Spark DataFrame API, particiones, joins distribuidos
5. [ML, DL y evaluación](03-herramientas-y-tecnologias/04-ml-dl-y-evaluacion.md) — TensorFlow/PyTorch, scikit-learn, métricas, pipelines
6. [BI y visualización](03-herramientas-y-tecnologias/05-bi-y-visualizacion.md) — principios de visualización, Power BI, Tableau
7. [Cloud y MLOps](03-herramientas-y-tecnologias/06-cloud-y-mlops.md) — AWS, Azure, GCP, MLOps, LLMOps, seguridad de apps de IA
8. [Casos conceptuales y cierre](03-herramientas-y-tecnologias/07-casos-conceptuales-y-cierre.md) — churn, telemetría, asistente GenAI, del prototipo a producción
