# Spark y Procesamiento Distribuido

> Módulo 3 · Herramientas y Tecnologías para IA y Big Data
>
> **Práctica relacionada:** [Laboratorio 3.3 — Tu primer pipeline distribuido con Spark SQL](../Labs/03-herramientas-y-tecnologias/lab-3.3-pipeline-spark-sql/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-3) · ⟵ [Anterior: SQL y NoSQL](02-sql-y-nosql.md) · [Siguiente: ML, DL y evaluación →](04-ml-dl-y-evaluacion.md)

### Procesamiento Distribuido: Vista del Desarrollador

El procesamiento distribuido permite escalar transformaciones a conjuntos de datos que no caben en una sola máquina. Desde el punto de vista del desarrollador, la clave es trabajar con abstracciones de alto nivel que ocultan la complejidad de la distribución.

- **Partitions**: división lógica en bloques paralelizables.
- **Tasks**: ejecución paralela en nodos del clúster.
- **Dataset**: datos cargados y particionados automáticamente.
- **Result**: agregación y retorno al driver.
- **Lazy evaluation**: las transformaciones se acumulan como un plan lógico (DAG) y solo se ejecutan cuando se requiere un resultado concreto (action). Esto permite al optimizador reordenar y fusionar operaciones.
- **Tolerancia a fallos**: los motores distribuidos detectan fallos de nodos y relanzan tareas automáticamente, garantizando la finalización del trabajo.
- **Abstracción, no gestión manual**: el desarrollador define qué transformar, no cómo distribuirlo. El motor decide cómo particionar, enviar tareas y gestionar fallos.

---

### Spark DataFrame API

Apache Spark es el motor de procesamiento distribuido más extendido en proyectos de Big Data. Su DataFrame API permite expresar transformaciones sobre datos distribuidos con una interfaz de alto nivel, muy similar a Pandas o SQL.

**Conceptos fundamentales**

- **DataFrame distribuido**: colección de filas distribuida en particiones a través del clúster. Inmutable: cada transformación genera un nuevo DataFrame.
- **Transformations**: operaciones lazy que construyen el plan de ejecución: `filter`, `select`, `groupBy`, `join`. No se ejecutan hasta un action.
- **Actions**: desencadenan la ejecución real: `show`, `count`, `write`, `collect`. Materializan el resultado.

**Spark SQL**

Spark integra un motor SQL que permite ejecutar consultas estándar directamente sobre DataFrames registrados como vistas temporales. Facilita la adopción por equipos con experiencia en SQL y la integración con herramientas de BI.

**Interfaces disponibles**

- **PySpark**: API Python, la más utilizada en proyectos de datos.
- **Scala API**: máximo rendimiento, usada en ingeniería de datos avanzada.
- **SQL directo**: consultas sobre vistas temporales o tablas del metastore.

---

### Particiones y Rendimiento en Spark

El rendimiento en Spark depende en gran medida de cómo se distribuyen los datos entre particiones y de cuántos datos se mueven entre nodos durante las operaciones. Entender estos conceptos es esencial para diseñar pipelines eficientes.

- **Partition**: unidad mínima de paralelismo. Cada partición es procesada por una tarea en un único núcleo. Pocas particiones infrautilizan el clúster; demasiadas generan overhead.
- **Task y Stage**: una task procesa una partición en un nodo. Las stages agrupan tasks que pueden ejecutarse sin intercambio de datos entre nodos.
- **Shuffle**: redistribución de datos entre nodos requerida por operaciones como `groupBy` o `join`. Es la operación más costosa: implica serialización, transferencia de red y E/S a disco.
- **DAG (Directed Acyclic Graph)**: plan de ejecución que Spark construye a partir de las transformaciones. El optimizador (Catalyst) reordena y fusiona operaciones para minimizar shuffles y lecturas de datos.

---

### Spark SQL y Joins Distribuidos

Los joins en entornos distribuidos son operaciones costosas porque pueden requerir redistribuir grandes volúmenes de datos entre nodos. Comprender los mecanismos de ejecución ayuda a diseñar pipelines con mejor rendimiento.

- **Shuffle join (Sort-Merge Join)**: ambos datasets se redistribuyen por la clave de join, garantizando que filas con la misma clave lleguen al mismo nodo. Necesario para datasets grandes. Genera I/O de red significativa (alta transferencia, bajo rendimiento).
- **Broadcast join**: cuando uno de los datasets es pequeño (típicamente <10 MB por defecto), Spark lo envía completo a cada nodo, eliminando el shuffle del lado grande. El optimizador puede aplicarlo automáticamente (baja transferencia, óptimo cuando cabe en memoria, alto rendimiento).

---
