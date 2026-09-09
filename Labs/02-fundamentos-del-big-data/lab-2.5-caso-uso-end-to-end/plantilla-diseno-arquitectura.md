# Plantilla de diseño de arquitectura — Laboratorio 2.5

**Grupo:** _(nombres)_
**Caso de uso elegido:** _(fraude financiero / IoT industrial / salud y genómica / retail / energía)_

Completa cada etapa antes de pasar al diagrama. Las preguntas guía te ayudan a no dejarte nada importante, pero no hace falta responderlas todas literalmente — usa el espacio para razonar vuestras decisiones.

---

## 1. Fuentes

**Preguntas guía:** ¿Qué fuentes de datos concretas intervienen en este caso? ¿Qué volumen aproximado genera cada una? ¿Con qué frecuencia? ¿Qué formato tienen (estructurado, semiestructurado, no estructurado)?

- Fuente 1: _______
- Fuente 2: _______
- Fuente 3 (si aplica): _______

## 2. Ingestión

**Preguntas guía:** Para cada fuente anterior, ¿qué patrón de ingestión tiene sentido — batch, streaming, o ambos? ¿Qué latencia requiere realmente el caso de uso (no la máxima técnicamente posible, sino la mínima necesaria)?

- Fuente 1 → patrón de ingestión y justificación: _______
- Fuente 2 → patrón de ingestión y justificación: _______
- Fuente 3 → patrón de ingestión y justificación: _______

## 3. Almacenamiento

**Preguntas guía:** ¿Data warehouse, data lake o data lakehouse? ¿Por qué esta elección encaja con la variedad de formato y el patrón de consumo de este caso? Si hay data lake, ¿qué va en cada zona (Raw / Curated / Serving)?

- Tipo de almacenamiento elegido y justificación: _______
- Zona Raw — qué contiene: _______
- Zona Curated — qué transformación se aplica: _______
- Zona Serving — qué agregados o vistas expone: _______

## 4. Procesamiento

**Preguntas guía:** ¿Batch o streaming? ¿Con qué herramienta concreta (Spark batch, Spark Structured Streaming, un motor SQL, Kafka Streams...)? ¿Qué transformación principal se aplica a los datos en esta etapa?

- Patrón de procesamiento y herramienta: _______
- Transformación principal aplicada: _______

## 5. Gobierno y calidad

**Preguntas guía:** ¿Qué controles de calidad (schema checks, nulos, rangos, deduplicación) son especialmente relevantes en este caso? ¿Hay datos personales (PII) que requieran pseudonimización o control de acceso? ¿Qué necesitaría un catálogo de datos para este caso concreto?

- Controles de calidad relevantes: _______
- ¿Hay PII? ¿Cómo se protege?: _______
- Necesidades de catálogo / linaje: _______

## 6. Aplicación final

**Preguntas guía:** ¿Qué consume estos datos al final del flujo (modelo ML, dashboard, sistema de alertas, API)? ¿Qué decisión de negocio concreta habilita?

- Aplicación final: _______
- Decisión de negocio que habilita: _______

---

## Resumen para el diagrama

Antes de dibujar, comprobad que tenéis una frase corta para cada una de las seis etapas — eso es lo que irá anotado junto a cada bloque del diagrama.
