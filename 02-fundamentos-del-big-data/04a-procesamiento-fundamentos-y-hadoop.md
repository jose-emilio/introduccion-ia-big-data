# Procesamiento distribuido: fundamentos y Apache Hadoop

> Módulo 2 · Fundamentos del Big Data

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-2) · ⟵ [Anterior: Arquitectura Big Data](03-arquitectura-big-data.md) · [Siguiente: Procesamiento — Apache Spark →](04b-procesamiento-spark.md)

### Almacenamiento distribuido

En un sistema distribuido, los datos se dividen en bloques o particiones que se reparten entre múltiples nodos. Este enfoque permite escalar más allá de los límites físicos de una sola máquina.

**Principios clave**
- Particionado: el archivo se divide en bloques (ej. 128 MB en HDFS).
- Distribución: cada bloque se asigna a nodos distintos.
- Replicación: cada bloque tiene 2-3 réplicas para tolerancia a fallos.
- Localidad: el cómputo se mueve a donde están los datos, no al revés.

El proceso se representa como: **Archivo → Particionado → Réplicas**.

---

### Escalabilidad vertical vs horizontal

Existen dos estrategias fundamentales para aumentar la capacidad de un sistema. En Big Data, el modelo dominante es el scale-out porque ofrece elasticidad y elimina el límite físico de una sola máquina.

**Scale-up (vertical)**
- Aumentar CPU, RAM o disco de un solo servidor.
- Límite físico: un servidor tiene un techo.
- Coste crece de forma no lineal con la potencia.
- Punto único de fallo.
- Apropiado para bases de datos OLTP tradicionales.

**Scale-out (horizontal)**
- Añadir nodos commodity al clúster.
- Sin límite teórico de capacidad.
- Coste lineal con el crecimiento.
- Alta disponibilidad por diseño.
- Base de Hadoop, Spark y cloud object storage.

---

### Procesamiento paralelo

El paralelismo permite dividir un trabajo en tareas independientes que se ejecutan simultáneamente sobre particiones de datos distribuidas entre los nodos del clúster, reduciendo drásticamente el tiempo total de ejecución.

- **Tasks** — Tareas paralelas por partición.
- **Stages** — Etapas dependientes secuenciales.
- **Job** — Trabajo completo a ejecutar.

Un DAG (Directed Acyclic Graph) representa las dependencias entre etapas. El motor de ejecución (Spark, Flink) optimiza el plan de ejecución para minimizar movimientos de datos y maximizar el paralelismo.

---

### Tolerancia a fallos

En un clúster con decenas o cientos de nodos, los fallos de hardware son un evento esperado, no excepcional. Los sistemas distribuidos están diseñados para recuperarse automáticamente sin pérdida de datos ni interrupción del servicio.

- **Replicación** — Múltiples copias de cada bloque en nodos distintos. Si un nodo falla, el dato sigue disponible en las réplicas.
- **Recomputación** — Spark puede recalcular particiones perdidas gracias al linaje del DAG, sin necesidad de almacenar resultados intermedios.
- **Checkpoints** — En streaming, los checkpoints guardan el estado del procesamiento periódicamente para reanudar desde el último punto consistente.

---

### Apache Hadoop: visión general

Apache Hadoop fue el framework que popularizó el procesamiento distribuido a gran escala sobre hardware commodity. Su arquitectura modular sentó las bases conceptuales del Big Data moderno y sigue siendo una referencia obligada.

- **HDFS** — Sistema de ficheros distribuido. Almacena datos en bloques replicados entre DataNodes.
- **YARN** — Gestor de recursos y planificador de trabajos distribuidos en el clúster.
- **MapReduce** — Modelo de programación para procesamiento paralelo en dos fases: map y reduce.
- **Common** — Utilidades y librerías compartidas por el resto de componentes del ecosistema.

---

### HDFS: Hadoop Distributed File System

HDFS divide los archivos en bloques de tamaño fijo (típicamente 128 MB) y los distribuye entre múltiples DataNodes, manteniendo un NameNode central que almacena el árbol de directorios y la localización de cada bloque.

- **NameNode** — Nodo maestro que gestiona el namespace del sistema de ficheros y el mapa de bloques. Punto crítico de disponibilidad.
- **DataNodes** — Nodos de almacenamiento que guardan físicamente los bloques y reportan su estado al NameNode periódicamente.
- **Replicación x3** — Cada bloque se replica en 2 DataNodes en el mismo rack, y una réplica adicional en otro rack para máxima resiliencia.

---

### YARN: gestión de recursos

YARN (Yet Another Resource Negotiator) desacopla la gestión de recursos del modelo de programación, permitiendo que múltiples motores (Spark, Flink, MapReduce) compartan el mismo clúster Hadoop de forma eficiente.

- **ResourceManager** — Asigna recursos globales del clúster.
- **NodeManagers** — Gestionan recursos y contenedores por nodo.
- **Containers** — Ejecutan tareas específicas del trabajo.
- **Application Master** — Orquesta trabajo y solicita containers.

Esta separación fue un avance fundamental: mientras MapReduce original mezclaba gestión de recursos y ejecución, YARN permite que cualquier motor distribuido solicite y devuelva recursos de forma dinámica.

---

### MapReduce: modelo de procesamiento

MapReduce es el modelo de programación histórico de Hadoop. Divide cualquier trabajo en dos fases fundamentales más una etapa intermedia de ordenación y agrupación: **Map → Shuffle → Reduce**.

MapReduce escribía resultados intermedios en disco tras cada etapa, lo que lo hacía robusto pero lento para algoritmos iterativos. Spark resolvió este problema manteniendo datos en memoria.

---

### Hadoop en arquitecturas modernas

Hadoop fue disruptivo, pero las arquitecturas actuales han evolucionado hacia plataformas más flexibles y gestionadas. Su influencia conceptual es innegable, aunque su despliegue directo es menos frecuente en nuevos proyectos.

**Hadoop clásico (legado)**
- HDFS como almacenamiento principal.
- MapReduce como motor de procesamiento.
- Clústeres on-premise gestionados manualmente.
- Alta complejidad operativa.

**Arquitecturas modernas**
- Object storage cloud (S3, ADLS, GCS) desacoplado del compute.
- Motores independientes: Spark, Flink, Trino.
- Servicios gestionados (managed compute).
- Elasticidad y pago por uso.

Los conceptos de distribución, replicación y procesamiento paralelo de Hadoop siguen siendo válidos y están presentes en todas las plataformas modernas, aunque implementados de forma diferente.
