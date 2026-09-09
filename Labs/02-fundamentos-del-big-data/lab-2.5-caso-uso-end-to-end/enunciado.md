# Laboratorio 2.5 — Caso de uso end-to-end (integrador de módulo)

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.4): Calidad y gobierno de datos](../lab-2.4-calidad-gobierno-datos/enunciado.md) · [Laboratorio siguiente (3.1): Limpieza y exploración de datos con Pandas](../../03-herramientas-y-tecnologias/lab-3.1-limpieza-exploracion-pandas/enunciado.md) ⟶

**Laboratorios relacionados:** [2.1 — Diagnóstico de las 5 Vs en un dataset real](../lab-2.1-diagnostico-5vs/enunciado.md) (5 Vs); [2.2 — De CSV a Data Lake: diseña la arquitectura](../lab-2.2-arquitectura-data-lake/enunciado.md) (arquitectura); [2.3 — Primeros pasos con PySpark](../lab-2.3-primeros-pasos-pyspark/enunciado.md) (procesamiento distribuido); [2.4 — Calidad y gobierno de datos](../lab-2.4-calidad-gobierno-datos/enunciado.md) (calidad de datos).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Los cinco casos de uso](#los-cinco-casos-de-uso)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [1. Elección del caso y reparto de roles (10 min)](#1-eleccion-del-caso-y-reparto-de-roles-10-min)
  - [2. Diseñar el flujo completo, etapa por etapa (50–60 min)](#2-disenar-el-flujo-completo-etapa-por-etapa-5060-min)
  - [3. Dibujar el diagrama de arquitectura (20–30 min)](#3-dibujar-el-diagrama-de-arquitectura-2030-min)
  - [4. Presentación de 5 minutos por grupo (según nº de grupos)](#4-presentacion-de-5-minutos-por-grupo-segun-no-de-grupos)
- [Entregable](#entregable)
- [Cierre de módulo](#cierre-de-modulo)
- [Solución propuesta](#solucion-propuesta)
  - [Caso elegido: IoT industrial — mantenimiento predictivo en planta](#caso-elegido-iot-industrial-mantenimiento-predictivo-en-planta)
  - [1. Fuentes](#1-fuentes)
  - [2. Ingestión](#2-ingestion)
  - [3. Almacenamiento](#3-almacenamiento)
  - [4. Procesamiento](#4-procesamiento)
  - [5. Gobierno y calidad](#5-gobierno-y-calidad)
  - [6. Aplicación final](#6-aplicacion-final)
  - [Nota sobre el nivel de detalle esperado](#nota-sobre-el-nivel-de-detalle-esperado)

---

> **Bloque temático:** [`06-casos-de-uso.md`](../../../02-fundamentos-del-big-data/06-casos-de-uso.md)
> **Duración orientativa:** 90–120 minutos
> **Modalidad:** grupos de 3-4 personas, cierre de módulo
> **Herramientas:** Draw.io/Excalidraw, y lo elaborado en los laboratorios anteriores del módulo

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Integrar en un único diseño los tres bloques trabajados por separado en este módulo — arquitectura (lab 2.2), procesamiento (lab 2.3) y gobierno/calidad de datos (lab 2.4) — esbozando la solución completa para uno de los cinco casos de uso reales vistos en el bloque teórico de cierre.

<a id="contexto"></a>
## Contexto

Los laboratorios anteriores del módulo os han hecho practicar cada pieza por separado: diseñar una arquitectura de ingestión y almacenamiento (2.2), manipular datos con Spark (2.3), y aplicar controles de calidad y catalogación (2.4). Este laboratorio final os pide juntar esas tres piezas en un único flujo coherente, aplicado a uno de los cinco casos de uso que cierran el módulo: fraude financiero, IoT industrial, salud y genómica, retail, o energía.

No se trata de repetir el ejercicio del laboratorio 2.2 con otro nombre — aquí además de decidir ingestión y almacenamiento, tenéis que especificar **qué procesamiento (batch o streaming, con qué herramienta) se aplica** y **qué controles de gobierno y calidad harían falta**, cerrando el círculo completo desde la fuente hasta la aplicación de negocio final.

<a id="los-cinco-casos-de-uso"></a>
## Los cinco casos de uso

Elegid uno como grupo. Aquí tenéis un resumen de cada uno — si necesitáis más detalle, el apunte completo está en [`06-casos-de-uso.md`](../../../02-fundamentos-del-big-data/06-casos-de-uso.md).

**1. Fraude financiero.** Cada transacción de pago debe evaluarse en milisegundos para bloquear operaciones sospechosas sin interrumpir la experiencia del cliente legítimo. Los datos de entrada son eventos de transacción en tiempo real, enriquecidos con velocidad de gasto, geolocalización e historial del cliente, y se procesan con streaming (Kafka + Spark Structured Streaming) para alimentar un modelo de scoring de fraude. El reto de negocio es calibrar el umbral entre falsos positivos (clientes legítimos bloqueados) y falsos negativos (fraude no detectado).

**2. IoT industrial.** Una planta con miles de sensores y PLCs emite lecturas cada segundo (temperatura, vibración, consumo). Los datos se ingieren a escala vía Kafka/IoT Hub, con parte del procesamiento en el propio borde (edge processing) para filtrar y agregar antes de enviar a la nube, y se almacenan como series temporales en un data lake. El caso de uso de mayor retorno es el mantenimiento predictivo: anticipar fallos de maquinaria con modelos de detección de anomalías, reduciendo paradas no planificadas.

**3. Salud y genómica.** Combina volúmenes enormes (un genoma humano ocupa ~200 GB en crudo), alta variedad (historias clínicas semiestructuradas, imágenes DICOM) y requisitos de gobierno extremadamente estrictos (RGPD, HIPAA, pseudonimización obligatoria). El análisis comparativo de genomas de miles de pacientes requiere computación distribuida masiva; las historias clínicas alimentan modelos de predicción clínica y epidemiología; las imágenes médicas se procesan con modelos de visión para diagnóstico asistido.

**4. Retail y recomendación.** El retail digital combina clickstream (navegación, búsquedas), transacciones, catálogo de producto y CRM para construir una visión de cliente unificada (Customer 360). Con esos datos se construyen sistemas de recomendación colaborativa, segmentación RFM, pricing dinámico y modelos de predicción de churn. Es el caso de uso más cercano al dataset que ya conocéis de los laboratorios 2.1, 2.3 y 2.4 — podéis apoyaros en esa familiaridad si lo elegís.

**5. Energía y medio ambiente.** Las redes eléctricas combinan IoT a gran escala (sensores en turbinas, paneles solares, subestaciones emitiendo potencia, tensión y frecuencia en tiempo real) con datos meteorológicos externos, para previsión de demanda (load forecasting), detección de anomalías en la red y optimización del balanceo entre generación y consumo.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="1-eleccion-del-caso-y-reparto-de-roles-10-min"></a>
### Elección del caso y reparto de roles (10 min)

Formad grupos de 3-4 personas y elegid uno de los cinco casos. Si el grupo no consigue decidirse rápido, elegid el que tenga menos solapamiento con lo que ya habéis trabajado en el laboratorio 2.2 (RetailCorp), para practicar sobre un dominio distinto.

<a id="2-disenar-el-flujo-completo-etapa-por-etapa-5060-min"></a>
### Diseñar el flujo completo, etapa por etapa (50–60 min)

Usad `plantilla-diseno-arquitectura.md` para completar, de forma estructurada, las cinco etapas del flujo end-to-end para vuestro caso elegido:

1. **Fuentes** — qué fuentes de datos concretas intervienen, con su volumen y frecuencia aproximados.
2. **Ingestión** — qué patrón (batch, streaming, o ambos) para cada fuente, y por qué.
3. **Almacenamiento** — data warehouse, data lake o lakehouse, con zonas si aplica.
4. **Procesamiento** — batch o streaming, y con qué herramienta concreta del ecosistema (Spark, Structured Streaming, motor SQL...).
5. **Gobierno y calidad** — qué controles (catálogo, linaje, calidad, seguridad/PII) harían falta específicamente para este caso, y por qué son especialmente relevantes aquí.
6. **Aplicación final** — qué consume esos datos al final del flujo (modelo ML, dashboard, sistema de alertas...) y qué decisión de negocio habilita.

<a id="3-dibujar-el-diagrama-de-arquitectura-2030-min"></a>
### Dibujar el diagrama de arquitectura (20–30 min)

Trasladad el diseño de la plantilla a un diagrama visual (Draw.io, Excalidraw, o papel) que muestre el flujo completo de las cinco etapas de forma gráfica, con las decisiones clave anotadas — apoyaos en el formato de diagrama que ya practicasteis en el laboratorio 2.2.

<a id="4-presentacion-de-5-minutos-por-grupo-segun-no-de-grupos"></a>
### Presentación de 5 minutos por grupo (según nº de grupos)

Cada grupo presenta su diagrama y sus decisiones al resto de la clase en 5 minutos: qué caso elegisteis, las decisiones clave de cada etapa, y por qué. El resto de la clase puede usar `rubrica-evaluacion.md` para dar feedback estructurado.

<a id="entregable"></a>
## Entregable

Un diagrama de arquitectura completo del caso elegido (fuentes → ingestión → almacenamiento → procesamiento → gobierno y calidad → aplicación final), acompañado de la plantilla de diseño (`plantilla-diseno-arquitectura.md`) completada con las decisiones justificadas por escrito.

<a id="cierre-de-modulo"></a>
## Cierre de módulo

Este laboratorio cierra el módulo 2. Si el grupo docente lo decide, puede usarse como entrega evaluable de cierre — consultad `rubrica-evaluacion.md` para conocer los criterios. El módulo 3 retoma exactamente esta arquitectura para profundizar en las herramientas concretas (Python, SQL, Spark, Kafka, dbt, plataformas cloud) que la hacen posible.

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Este es solo **un ejemplo posible**, desarrollado sobre el caso de **IoT industrial**, con el nivel de detalle que se espera en las seis etapas de `plantilla-diseno-arquitectura.md`. De los cinco casos de uso, cada grupo puede elegir cualquiera de los otros cuatro (fraude financiero, salud y genómica, retail, energía) — lo importante no es que el caso coincida con este, sino el nivel de concreción y de justificación de cada decisión.

<a id="caso-elegido-iot-industrial-mantenimiento-predictivo-en-planta"></a>
### Caso elegido: IoT industrial — mantenimiento predictivo en planta

<a id="1-fuentes"></a>
### Fuentes

- **Fuente 1 — sensores de planta:** miles de sensores y PLCs (temperatura, vibración, consumo eléctrico) emitiendo una lectura por segundo cada uno. A escala de una planta mediana (sensores del orden de miles), esto supone decenas de miles de eventos por segundo en conjunto. Formato: eventos semiestructurados (JSON/Avro) con timestamp, id de sensor y valor.
- **Fuente 2 — órdenes de mantenimiento e histórico de averías (ERP/CMMS):** registros estructurados de cuándo se produjo cada avería y qué mantenimiento se aplicó. Volumen bajo (decenas-cientos de registros al día), frecuencia batch (el sistema de mantenimiento se actualiza cuando ocurre un evento, no en continuo).
- **Fuente 3 — metadatos de máquina (catálogo de activos):** ficha técnica de cada máquina (modelo, fecha de instalación, umbrales de fabricante). Volumen muy bajo, cambia rara vez — es dimensión de referencia, no un flujo de eventos.

<a id="2-ingestion"></a>
### Ingestión

- **Fuente 1 (sensores) → streaming.** El objetivo de negocio es anticipar fallos antes de que ocurran; una anomalía de vibración o temperatura debe poder detectarse en segundos o minutos, no al día siguiente. Un patrón batch perdería la ventana de reacción que justifica el propio caso de uso (mantenimiento predictivo, no solo análisis histórico). Se ingiere vía un broker de mensajería (Kafka / IoT Hub), con parte del filtrado y agregación ya en el propio borde (edge processing) para no saturar la red con cada lectura individual sin procesar.
- **Fuente 2 (órdenes de mantenimiento) → batch diario.** Es el ritmo natural del propio sistema ERP/CMMS; no hay ninguna ventaja en ingerir estos datos con mayor frecuencia, ya que una orden de mantenimiento no cambia varias veces al día.
- **Fuente 3 (catálogo de activos) → batch, con carga inicial + actualización esporádica.** Cambia tan poco que tratarlo como streaming sería sobre-ingeniería; basta con sincronizarlo cuando se da de alta una máquina nueva o se revisan sus umbrales.

<a id="3-almacenamiento"></a>
### Almacenamiento

- **Tipo elegido: data lake** para los datos de sensores (alto volumen, formato semiestructurado, necesidad de conservar el histórico crudo para reentrenar modelos) combinado con un **modelo dimensional** (warehouse o zona Serving de un lakehouse) para los datos de mantenimiento y de activos, que son estructurados y de bajo volumen y se benefician de un esquema fijo y consultas SQL directas.
- **Zona Raw:** lecturas de sensores tal cual llegan del broker (JSON con timestamp, id de sensor, valor), sin filtrar ni tipar.
- **Zona Curated:** lecturas tipadas, con el id de sensor resuelto contra el catálogo de activos (fuente 3), outliers evidentes descartados (p. ej. lecturas negativas de temperatura donde es físicamente imposible) y series temporales re-muestreadas a un intervalo estándar (p. ej. agregados por minuto) para que el volumen sea manejable en los análisis posteriores.
- **Zona Serving:** tablas de features ya calculadas por máquina y ventana de tiempo (medias, desviaciones, tendencias) listas para alimentar el modelo de detección de anomalías, más las vistas que alimentan el dashboard de planta.

<a id="4-procesamiento"></a>
### Procesamiento

- **Ruta caliente (streaming):** Spark Structured Streaming (o equivalente) consumiendo directamente del broker, calculando agregaciones en ventanas deslizantes (media y desviación de vibración/temperatura en los últimos N minutos por sensor) y comparándolas contra umbrales — si se supera el umbral, se dispara una alerta sin esperar a que el dato pase por el lake.
- **Ruta fría (batch):** un job periódico (horario o diario) sobre la zona Curated del lake recalcula features más complejas sobre ventanas largas (tendencias semanales, comparación con el histórico de averías de la fuente 2) para reentrenar periódicamente el modelo de detección de anomalías — este reentrenamiento no necesita ser en tiempo real, el valor está en que mejore con el tiempo.
- Transformación principal: paso de lecturas individuales de sensor a features agregadas por ventana de tiempo y máquina — es el mismo patrón de `groupBy` + agregación practicado en el laboratorio 2.3, aplicado aquí sobre datos que en producción real serían mucho mayores y llegarían en continuo.

<a id="5-gobierno-y-calidad"></a>
### Gobierno y calidad

- **Controles de calidad relevantes:** validación de rango por tipo de sensor (una lectura de temperatura de -200°C o de vibración negativa es un sensor averiado, no un dato real — el mismo tipo de comprobación de rangos practicada en el laboratorio 2.4), detección de sensores "silenciosos" (ausencia de lecturas durante un periodo, que es en sí misma una señal de alerta, no solo un hueco de datos) y deduplicación de eventos reenviados por fallos de red en el broker.
- **¿Hay PII? Cómo se protege:** en este caso concreto, prácticamente no hay PII directa en los datos de sensores (son lecturas de máquina), pero si el sistema registra qué operario estaba de turno o gestionó cada orden de mantenimiento (fuente 2), ese campo sí sería PII y debería tratarse con control de acceso por rol, igual que se razonó con `cliente_nombre` en el laboratorio 2.4.
- **Necesidades de catálogo / linaje:** el catálogo debe documentar, por cada sensor, su ubicación física, el rango de valores esperado (umbral de fabricante) y su propietario (equipo de mantenimiento de esa línea); el linaje es especialmente importante aquí porque, si el modelo de detección de anomalías da una alerta equivocada, hay que poder trazar exactamente qué lecturas y qué transformaciones la generaron antes de decidir si se para una máquina en producción — un coste de parada no planificada que una mala trazabilidad haría mucho más caro de diagnosticar.

<a id="6-aplicacion-final"></a>
### Aplicación final

- **Aplicación final:** un modelo de detección de anomalías (alimentado por las features de la zona Serving) que alimenta un sistema de alertas para el equipo de mantenimiento, más un dashboard de estado de planta para supervisión.
- **Decisión de negocio que habilita:** programar el mantenimiento de una máquina concreta *antes* de que falle (mantenimiento predictivo), en lugar de esperar a una avería (mantenimiento correctivo) o a un calendario fijo sin relación con el estado real de la máquina (mantenimiento preventivo genérico) — reduciendo paradas no planificadas, que es el retorno de mayor impacto económico de este caso de uso.

<a id="nota-sobre-el-nivel-de-detalle-esperado"></a>
### Nota sobre el nivel de detalle esperado

Fíjate en que cada decisión de esta solución modelo está justificada con un criterio concreto (latencia necesaria, volumen, variedad de formato, coste operativo) y no con una afirmación genérica como "streaming porque es más moderno". Esa es la diferencia principal entre una respuesta de nivel 2 y una de nivel 3-4 en la rúbrica de `rubrica-evaluacion.md` — y es exactamente lo que cualquier grupo, elija el caso que elija, debería reproducir en su propio diseño.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.4): Calidad y gobierno de datos](../lab-2.4-calidad-gobierno-datos/enunciado.md) · [Laboratorio siguiente (3.1): Limpieza y exploración de datos con Pandas](../../03-herramientas-y-tecnologias/lab-3.1-limpieza-exploracion-pandas/enunciado.md) ⟶
