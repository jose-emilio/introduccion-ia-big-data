# Plantilla — Presentación de negocio: predicción de churn

Esta plantilla define la estructura de una presentación breve (3-5 diapositivas, o una página si preferís un formato documento) dirigida a una audiencia **no técnica** (dirección, equipo comercial), como cierre del laboratorio 3.7. Podéis convertir esta estructura en un documento de una página, unas diapositivas de PowerPoint/Google Slides, o incluso una sección final añadida al propio notebook — lo importante es el contenido y el orden, no el formato exacto.

Los tres gráficos que se referencian (`grafico_1_churn_por_contrato.png`, `grafico_2_importancia_variables.png`, `grafico_3_distribucion_probabilidad.png`) ya están generados en esta carpeta como resultado de ejecutar el notebook `notebook_3.7.ipynb`; reutilizadlos directamente.

---

## Diapositiva 1 — El problema

**Título:** ¿Por qué estamos perdiendo clientes?

**Contenido:**
- Uno de cada cinco clientes de la operadora cancela su contrato (tasa de churn: 20.4%).
- Cada cliente que se va representa una pérdida de ingresos recurrentes, y captar uno nuevo cuesta más que retener uno existente.
- Objetivo del proyecto: predecir **qué clientes tienen mayor riesgo de irse**, para poder actuar antes de que lo hagan.

*(Sin gráficos técnicos en esta diapositiva — solo el planteamiento del problema en lenguaje de negocio.)*

---

## Diapositiva 2 — Hallazgo clave 1: el tipo de contrato es el factor más determinante

**Título:** Los clientes sin permanencia se van 3 veces más

**Gráfico:** `grafico_1_churn_por_contrato.png`

**Mensaje (una frase):** los clientes con contrato "Mes a mes" cancelan a un ritmo muy superior (~28%) al de los clientes con contrato de dos años (~9%) — la falta de compromiso a largo plazo es la señal de riesgo más fuerte que tenemos.

**Implicación de negocio:** incentivar la migración de clientes mes a mes hacia contratos de permanencia (con descuentos u ofertas) podría reducir el churn de forma directa, sin necesidad de ningún modelo predictivo.

---

## Diapositiva 3 — Hallazgo clave 2: qué variables usa el modelo para predecir

**Título:** ¿En qué se fija el modelo para detectar el riesgo?

**Gráfico:** `grafico_2_importancia_variables.png`

**Mensaje (una frase):** además del tipo de contrato, el cargo mensual, la antigüedad del cliente y el número de incidencias de soporte son las señales que más pesan en la predicción — clientes recientes, que pagan caro y han tenido problemas de soporte son los de mayor riesgo.

**Implicación de negocio:** un cliente nuevo con una factura alta y que ya ha llamado a soporte técnico debería activar una alerta temprana en el equipo de retención, incluso antes de mirar el modelo.

---

## Diapositiva 4 — Hallazgo clave 3: qué tan bien distingue el modelo a quién se va

**Título:** El modelo separa razonablemente bien a quién se queda y a quién se va

**Gráfico:** `grafico_3_distribucion_probabilidad.png`

**Mensaje (una frase):** aunque no es perfecto (las dos distribuciones se solapan parcialmente), el modelo asigna probabilidades de churn claramente más altas a los clientes que efectivamente se fueron, lo que lo hace útil para priorizar a quién contactar primero.

**Implicación de negocio:** en lugar de contactar a toda la base de clientes por igual, el equipo comercial puede ordenar a los clientes por probabilidad de churn y dedicar el esfuerzo de retención a quienes más lo necesitan.

---

## Diapositiva 5 — Recomendación y próximos pasos

**Título:** ¿Qué hacemos con esto?

**Contenido:**
- Recomendamos generar mensualmente una lista de clientes con probabilidad de churn por encima de un umbral (en este proyecto, 0.45), para una campaña de retención proactiva.
- A ese umbral, el modelo detecta en torno al 70% de los clientes que realmente se van a ir, marcando en torno al 38% de la base como "en riesgo" — un volumen dirigido, no un contacto masivo indiscriminado.
- Justificación del umbral: para esta operadora, contactar innecesariamente a un cliente que no se iba a ir es barato (una llamada, una oferta de más); no detectar a un cliente que sí se va es caro (se pierde su ingreso recurrente futuro). Por eso priorizamos el recall sobre la precision, sin llevarlo al extremo.
- Próximo paso sugerido: pilotar la campaña de retención sobre el grupo de "alto riesgo" durante un trimestre y medir si la tasa de churn real baja frente a un grupo de control no contactado.

---

## Notas para quien presente

- Evitad tecnicismos como "F1-score", "ROC-AUC" o "ColumnTransformer" en la presentación — traducid siempre a impacto de negocio (número de clientes, ingresos, coste de una campaña).
- Cada gráfico debe responder a una única pregunta y llevar su mensaje en el título, no solo en el pie — así la diapositiva se entiende aunque nadie la explique en voz alta (principio de reducir ruido visual del laboratorio 3.5, aplicado aquí también).
- Si tenéis tiempo, añadid una diapositiva de "limitaciones": el dataset es una fotografía puntual, sin variables de comportamiento reciente (uso del servicio, interacciones con atención al cliente en el último mes) que probablemente mejorarían la predicción — conectando con la pregunta de reflexión 1 del notebook sobre features de ventana temporal.
