# Fuentes y tipos de datos

> Módulo 2 · Fundamentos del Big Data

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-2) · ⟵ [Anterior: Las 5 Vs](01-las-5-vs.md) · [Siguiente: Arquitectura Big Data →](03-arquitectura-big-data.md)

### Fuentes de datos empresariales

Una plataforma Big Data real integra datos procedentes de múltiples sistemas operacionales y fuentes externas. Conocer el origen de cada flujo es esencial para diseñar la ingestión y garantizar la calidad.

- **Sistemas internos** — ERP, CRM, bases de datos transaccionales, sistemas de punto de venta.
- **IoT y sensores** — Dispositivos físicos que emiten métricas en tiempo real: maquinaria, logística, edificios.
- **APIs y web** — Datos de terceros, redes sociales, marketplaces y fuentes públicas consumidos mediante APIs.
- **Partners y externos** — Ficheros intercambiados con proveedores, partners o entidades reguladoras mediante SFTP, EDI u otros protocolos.

---

### Datos estructurados

Los datos estructurados se organizan en tablas con esquemas explícitos, relaciones entre entidades y restricciones de integridad. Son el dominio natural de los sistemas relacionales y del lenguaje SQL.

**Características principales**
- Filas y columnas con tipos definidos.
- Claves primarias y foráneas (keys & constraints).
- Integridad referencial entre tablas.
- Consultas declarativas con SQL estándar.
- Optimizados para OLTP y OLAP clásico.

**Ejemplos típicos**
- Tabla de clientes con ID, nombre, fecha de alta.
- Tabla de pedidos relacionada con productos.
- Transacciones financieras con importe y cuenta.
- Inventario de productos con stock y precio.

---

### Datos semiestructurados

Los datos semiestructurados tienen una estructura interna reconocible pero no necesariamente encajan en un esquema tabular fijo. Permiten campos opcionales, arrays anidados y estructuras jerárquicas que los sistemas relacionales gestionan con dificultad.

- **JSON** — Formato ligero basado en pares clave-valor y arrays. Estándar de facto para APIs REST y eventos de aplicación.
- **XML** — Formato jerárquico con etiquetas y atributos. Muy utilizado en integraciones empresariales (EDI, SOAP) y documentos.
- **Event records** — Registros de eventos con campos fijos y payload variable. Típicos en sistemas de mensajería como Kafka o Kinesis.
- **Logs** — Líneas de texto con estructura parseable: timestamp, nivel, servicio, mensaje. Fuente principal de observabilidad.

---

### Datos no estructurados

El texto libre, las imágenes, el audio y el vídeo representan la mayor parte del volumen de datos generado en el mundo. No poseen un esquema tabular nativo y requieren técnicas específicas de procesamiento para extraer información.

- **Texto libre** — Emails, contratos, artículos, reseñas. Procesados con técnicas de NLP (Natural Language Processing).
- **Imágenes** — Fotografías, escaneados, imágenes médicas. Analizadas mediante visión por computador (Computer Vision).
- **Audio** — Grabaciones de llamadas, podcasts, señales acústicas industriales. Transcritos y analizados con modelos de voz.
- **Vídeo** — Cámaras de seguridad, vídeos de usuario, grabaciones de procesos. Almacenamiento intensivo y procesamiento frame a frame.

---

### Big Data vs análisis tradicional

La diferencia entre ambos enfoques no es únicamente de escala. Cambian la arquitectura, los patrones de acceso, los formatos y el modelo de procesamiento.

| Dimensión | Análisis tradicional | Big Data |
| --- | --- | --- |
| Escala | GB – pocos TB | TB – PB – EB |
| Infraestructura | Servidor único o SMP (Symmetric Multi-Processing) | Clúster distribuido / cloud |
| Variedad | Datos relacionales | Estructurado + semi + no estructurado |
| Procesamiento | Batch periódico | Batch, micro-batch, streaming |
| Esquema | Schema-on-write | Schema-on-read / flexible |
| Coste | Licencias tradicionales | Commodity hardware / pay-per-use cloud |
