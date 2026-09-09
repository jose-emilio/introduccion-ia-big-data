# SQL y NoSQL

> Módulo 3 · Herramientas y Tecnologías para IA y Big Data
>
> **Práctica relacionada:** [Laboratorio 3.2 — Consultas SQL sobre una base de datos de ejemplo](../Labs/03-herramientas-y-tecnologias/lab-3.2-consultas-sql/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-3) · ⟵ [Anterior: Python y entornos](01-python-y-entornos.md) · [Siguiente: Spark y procesamiento distribuido →](03-spark-y-procesamiento-distribuido.md)

### SQL: Lenguaje Fundamental

SQL (Structured Query Language) lleva décadas siendo el estándar para consultar y transformar datos estructurados. Su relevancia en proyectos de datos e IA sigue siendo total: los datos residen mayoritariamente en bases de datos relacionales o warehouses que exponen SQL como interfaz.

- **SELECT / FROM / WHERE**: núcleo del lenguaje. Permite proyectar columnas, filtrar filas y trabajar con una o varias tablas. Base de cualquier consulta analítica.
- **JOIN**: combina tablas relacionadas mediante claves. Tipos: INNER, LEFT, RIGHT, FULL OUTER. Fundamental para modelos de datos normalizados.
- **GROUP BY y agregaciones**: SUM, COUNT, AVG, MAX, MIN. Permiten calcular métricas agregadas por dimensión: ventas por región, errores por servicio.
- **Window functions**: calculan valores sobre una ventana de filas sin colapsar el resultado (p. ej. ROW_NUMBER, LAG, RANK, medias móviles). Muy usadas en analítica avanzada.

---

### SQL y Pandas: Paradigmas Equivalentes

SQL y Pandas permiten expresar las mismas operaciones analíticas con abstracciones diferentes. Conocer ambos enriquece el perfil técnico y permite elegir el entorno más adecuado para cada tarea.

| Operación | SQL | Pandas |
| --- | --- | --- |
| Seleccionar columnas | SELECT col1, col2 FROM t | df[['col1','col2']] |
| Filtrar filas | WHERE condición | df[df.condición] |
| Agrupar y agregar | GROUP BY col | df.groupby('col').agg() |
| Combinar tablas | JOIN ON clave | df.merge(df2, on='clave') |
| Ordenar | ORDER BY col DESC | df.sort_values('col', ascending=False) |
| Calcular nueva columna | SELECT expr AS nombre | df.assign(nombre=expr) |

En la práctica, SQL es preferido cuando los datos residen en bases de datos o warehouses y el equipo es mixto. Pandas es más flexible para exploración interactiva y transformaciones complejas en Python.

---

### NoSQL: Motivación y Familias

NoSQL surge para cubrir modelos de datos y patrones de acceso que las bases de datos relacionales gestionan con dificultad: documentos semiestructurados, pares clave-valor de alta velocidad, grafos de relaciones complejas o tablas de escala masiva.

- **Documental**: almacena documentos JSON/BSON anidados. Flexible para entidades con esquema variable. Ejemplos: MongoDB, CouchDB, Firestore.
- **Clave-valor (Key-Value)**: acceso ultrarrápido por clave. Ideal para caché, sesiones y configuraciones. Ejemplos: Redis, DynamoDB (también documental pero no intercambiable con MongoDB).
- **Wide-column**: columnas dinámicas agrupadas en familias. Diseñado para escrituras y lecturas masivas. Ejemplos: Apache Cassandra, HBase, Bigtable.
- **Grafo (Graph)**: nodos, aristas y propiedades. Óptimo para relaciones complejas (redes sociales, detección de fraude, knowledge graphs). Ejemplos: Neo4j, Amazon Neptune.

---

### SQL vs NoSQL: Criterios de Elección

La elección entre SQL y NoSQL no es ideológica sino técnica: depende del modelo de datos, los requisitos de consistencia, los patrones de consulta, la escala esperada y las necesidades del equipo.

| Criterio | SQL Relacional | NoSQL |
| --- | --- | --- |
| Modelo de datos | Tablas con esquema fijo y relaciones | Variable: documentos, grafos, KV, columnas |
| Consistencia | ACID por defecto | Eventual en la mayoría; algunos soportan ACID |
| Escalabilidad | Vertical principalmente; sharding complejo | Horizontal por diseño |
| Consultas | SQL expresivo, joins complejos | Optimizadas para patrones de acceso definidos |
| Casos típicos | ERP, OLAP, transacciones financieras | IoT, catálogos, redes sociales, caché |

Muchos proyectos modernos combinan ambos paradigmas: SQL para analítica y NoSQL para operación en tiempo real.

---
