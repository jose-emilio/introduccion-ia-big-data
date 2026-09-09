# Laboratorio 1.3 — Ingeniería de prompts con un LLM

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.2): Entrena tu primer modelo de Machine Learning](../lab-1.2-primer-modelo-ml/enunciado.md) · [Laboratorio siguiente (1.4): Auditoría de sesgo y riesgo de un caso real](../lab-1.4-auditoria-sesgo/enunciado.md) ⟶

## Índice

- [Cabecera](#cabecera)
- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [La tarea fija](#la-tarea-fija)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [Fase 0 — Preparación (5 min)](#fase-0-preparacion-5-min)
  - [Fase 1 — Cinco variantes de prompt (40 min, ~8 min por variante)](#fase-1-cinco-variantes-de-prompt-40-min-8-min-por-variante)
  - [Fase 2 — Comparación y puesta en común (15 min)](#fase-2-comparacion-y-puesta-en-comun-15-min)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)
  - [Variante 1 — Pregunta directa](#variante-1-pregunta-directa)
  - [Variante 2 — Con system prompt](#variante-2-con-system-prompt)
  - [Variante 3 — Con ejemplos (few-shot)](#variante-3-con-ejemplos-few-shot)
  - [Variante 4 — Con razonamiento paso a paso (chain-of-thought)](#variante-4-con-razonamiento-paso-a-paso-chain-of-thought)
  - [Variante 5 — Con salida estructurada (JSON)](#variante-5-con-salida-estructurada-json)
  - [Valoración comparativa de ejemplo](#valoracion-comparativa-de-ejemplo)

---

<a id="cabecera"></a>
## Cabecera

- **Bloque temático**: [`03-ia-generativa-y-llm.md`](../../../01-introduccion-a-la-ia/03-ia-generativa-y-llm.md) (en particular, el bloque "Prompting y context engineering").
- **Duración estimada**: 60 minutos.
- **Modalidad**: individual o en parejas.
- **Herramientas necesarias**: un navegador con acceso a un LLM conversacional gratuito (ChatGPT, Claude.ai o Gemini, en su versión gratuita). No se necesita cuenta de pago ni acceso a ninguna API.

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Al terminar este laboratorio, el alumnado será capaz de identificar y aplicar los componentes de un prompt (system prompt, contexto, ejemplos, restricciones) y dos técnicas avanzadas — few-shot y chain-of-thought — comparando de forma sistemática cómo cambia la calidad, consistencia y formato de las respuestas de un LLM al enriquecer progresivamente el prompt de una misma tarea.

<a id="contexto"></a>
## Contexto

En el apunte se presentan los componentes que estructuran un prompt bien diseñado (system prompt, contexto, ejemplos, restricciones y structured output) y dos técnicas avanzadas: chain-of-thought (pedir razonamiento paso a paso) y few-shot (incluir ejemplos que guíen formato y estilo). La idea central es que "el prompt no es solo una pregunta: es la arquitectura de la interacción" — la misma tarea, planteada con distinto nivel de estructura, puede producir respuestas de calidad muy diferente.

Este laboratorio pone a prueba esa idea de forma empírica: vas a lanzar la **misma tarea de clasificación de texto** a un LLM cinco veces, cada vez con un prompt más elaborado que el anterior, y vas a registrar y comparar lo que obtienes. No necesitas saber programar ni entender cómo funciona el modelo por dentro (eso ya se cubrió en el apunte): el laboratorio se centra exclusivamente en el lado del prompt, que es la parte que tú controlas como usuario.

<a id="la-tarea-fija"></a>
## La tarea fija

Todo el grupo trabaja sobre la misma tarea: **clasificar 5 reseñas de clientes como positiva, negativa o neutra, y extraer el motivo principal de cada una**. Las 5 reseñas están ya escritas en [`resenas-de-ejemplo.md`](resenas-de-ejemplo.md) — no hace falta inventar ninguna. Han sido diseñadas deliberadamente con distintos grados de dificultad: alguna es claramente positiva o negativa, alguna es neutra/mixta, y alguna es ambigua a propósito (para que se note la diferencia entre las variantes de prompt).

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="fase-0-preparacion-5-min"></a>
### Fase 0 — Preparación (5 min)

1. Abre un LLM conversacional gratuito en el navegador (ChatGPT, Claude.ai o Gemini).
2. Abre también [`plantilla-registro-respuestas.md`](plantilla-registro-respuestas.md) en un documento propio, para ir copiando las respuestas que obtengas.

<a id="fase-1-cinco-variantes-de-prompt-40-min-8-min-por-variante"></a>
### Fase 1 — Cinco variantes de prompt (40 min, ~8 min por variante)

3. Abre [`prompts-a-probar.md`](prompts-a-probar.md). Contiene el texto exacto de 5 prompts, listos para copiar y pegar, cada uno más elaborado que el anterior:
   - **Variante 1**: pregunta directa, sin contexto.
   - **Variante 2**: con system prompt (rol e instrucciones).
   - **Variante 3**: con 2-3 ejemplos añadidos (few-shot).
   - **Variante 4**: pidiendo razonamiento paso a paso antes de la respuesta final (chain-of-thought).
   - **Variante 5**: pidiendo salida en JSON estructurado.
4. Para cada variante, en una conversación **nueva** del LLM (no reutilices el historial de la variante anterior, para que cada prueba sea independiente):
   - Copia el prompt de la variante, sustituye el marcador `[PEGAR AQUÍ LAS 5 RESEÑAS]` por el contenido completo de `resenas-de-ejemplo.md`, y envíalo.
   - Copia la respuesta completa del modelo en la fila correspondiente de `plantilla-registro-respuestas.md`.
   - Valora la respuesta en tres dimensiones (escala 1-5 sugerida en la plantilla): **consistencia** (¿clasifica igual las reseñas menos ambiguas en todas las variantes?), **formato** (¿es fácil de leer o de procesar automáticamente?) y **calidad del razonamiento** (¿el motivo principal extraído es acertado y bien justificado?).
5. Repite el proceso para las 5 variantes.

<a id="fase-2-comparacion-y-puesta-en-comun-15-min"></a>
### Fase 2 — Comparación y puesta en común (15 min)

6. Rellena la fila de "valoración comparativa" al final de `plantilla-registro-respuestas.md`: ¿qué variante dio el mejor resultado? ¿en qué variante cambió la clasificación de la reseña ambigua?
7. Si trabajas en pareja, compara tus resultados con los de otra pareja que haya usado un LLM distinto (por ejemplo, tú con ChatGPT y ellos con Claude): ¿el patrón de mejora entre variantes es parecido, aunque el modelo sea distinto?
8. Puesta en común en grupo grande: el facilitador recoge en la pizarra qué variante funcionó mejor para cada pareja y abre un debate corto sobre por qué el formato estructurado (variante 5) suele ser más útil cuando el resultado se va a usar en otro sistema (por ejemplo, para automatizar la extracción de motivos de reseñas a escala).

<a id="entregable"></a>
## Entregable

`plantilla-registro-respuestas.md` completada con las 5 respuestas obtenidas, sus valoraciones y la comparación final.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. ¿En qué variante cambió la clasificación de la reseña que consideras más ambigua? ¿Qué elemento del prompt crees que causó ese cambio?
2. La variante 4 (chain-of-thought) suele producir respuestas más largas y lentas de leer. ¿En qué situaciones reales merece la pena ese coste adicional, y en cuáles no?
3. Si tuvieras que montar un sistema automático que clasificase miles de reseñas de clientes cada día (piensa en el apunte, en el bloque "Clasificación de Texto" dentro de NLP), ¿qué variante de las cinco usarías como base, y qué cambiarías todavía para producción?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

La respuesta exacta de un LLM real varía cada vez que se ejecuta el prompt (y entre modelos), así que no existe una única "respuesta correcta" que copiar. Lo que sigue es un ejemplo plausible y representativo de cómo suele evolucionar la respuesta de un LLM conversacional típico a medida que el prompt se enriquece de la variante 1 a la 5 — útil para comparar el *patrón* de mejora, no para verificar literalmente cada palabra.

La reseña con mayor grado de ambigüedad a propósito es la **5** (el robot de cocina): tiene una queja real (el amasado) pero cierra con una valoración explícitamente positiva ("contenta con la compra"). Es un buen caso para observar cómo cambia la clasificación entre variantes.

<a id="variante-1-pregunta-directa"></a>
### Variante 1 — Pregunta directa

Respuesta típica: correcta en el fondo pero con formato libre e inconsistente (a veces frase completa, a veces solo una etiqueta, sin separar siempre sentimiento y motivo):

> 1. Es una reseña positiva, le gustó el sonido y llegó rápido.
> 2. Negativa, se queja de que tarda mucho y de la atención.
> 3. Esta es más bien neutral, el televisor cumple pero el mando no es gran cosa.
> 4. Muy negativa — producto roto y devolución denegada.
> 5. Mixta, tiene cosas buenas y malas, yo diría que neutral.

La reseña 5 queda clasificada como **neutra** — la queja sobre el amasado pesa en la lectura superficial del modelo tanto como el cierre positivo del cliente.

<a id="variante-2-con-system-prompt"></a>
### Variante 2 — Con system prompt

Mismo contenido, pero ya numerado de forma homogénea y separando sentimiento/motivo en cada línea, gracias al rol y las instrucciones de formato del system prompt:

> 1. Positiva – sonido de alta calidad y entrega rápida; el tamaño del estuche es un detalle menor.
> 2. Negativa – retraso notable en la entrega y soporte poco efectivo.
> 3. Neutra – producto funcional sin destacar, mando a distancia básico.
> 4. Negativa – producto defectuoso y devolución denegada por un margen de días.
> 5. Neutra – cumple en parte lo esperado, pero el programa de amasado decepciona.

La reseña 5 sigue en **neutra**: el formato mejora mucho, pero el criterio de fondo todavía no distingue bien un matiz de una neutralidad real.

<a id="variante-3-con-ejemplos-few-shot"></a>
### Variante 3 — Con ejemplos (few-shot)

El formato ahora replica exactamente el de los ejemplos ("→ Sentimiento: ... Motivo principal: ..."), con una consistencia más alta entre reseñas similares:

> 1 → Sentimiento: positiva. Motivo principal: buena calidad de sonido y envío rápido.
> 2 → Sentimiento: negativa. Motivo principal: retraso en la entrega y soporte deficiente.
> 3 → Sentimiento: neutra. Motivo principal: producto cumple su función sin destacar.
> 4 → Sentimiento: negativa. Motivo principal: producto defectuoso y devolución denegada injustamente.
> 5 → Sentimiento: neutra. Motivo principal: cumple en parte las expectativas, pero el amasado no funciona bien.

La reseña 5 **sigue en neutra**: el ejemplo B del few-shot ("funciona, ni bien ni mal") ancla al modelo hacia leer cualquier mezcla de pros y contras como neutralidad, en vez de distinguir "neutro" de "positivo con reservas".

<a id="variante-4-con-razonamiento-paso-a-paso-chain-of-thought"></a>
### Variante 4 — Con razonamiento paso a paso (chain-of-thought)

Aquí es donde suele cambiar la clasificación de la reseña ambigua. Razonamiento típico para la reseña 5:

> *Aspectos positivos mencionados: sustituye a varios aparatos (en parte), diseño bonito y compacto. Aspectos negativos: el programa de amasado no funciona bien y ha tenido que rehacer masas a mano. Matiz: el cliente cierra explícitamente con "contenta con la compra", lo que indica que, sopesando todo, su valoración global es positiva aunque con una reserva importante — no es una valoración neutra de "ni bien ni mal", sino positiva con matices.*
> → Sentimiento: **positiva** (con matices). Motivo principal: sustituye varios aparatos y tiene buen diseño, aunque el amasado decepciona.

Las reseñas 1-4 mantienen su clasificación (el razonamiento explícito no cambia casos ya claros), pero la 5 **pasa de "neutra" a "positiva con matices"**: obligar al modelo a pesar explícitamente los aspectos antes de decidir corrige la lectura superficial de las variantes 1-3.

<a id="variante-5-con-salida-estructurada-json"></a>
### Variante 5 — Con salida estructurada (JSON)

El resultado consolida la lectura ya corregida en la variante 4, ahora en un formato 100 % parseable y sin texto adicional:

```json
[
  {"id": 1, "sentimiento": "positiva", "motivo_principal": "Sonido de alta calidad y entrega rápida"},
  {"id": 2, "sentimiento": "negativa", "motivo_principal": "Retraso en la entrega y soporte al cliente inefectivo"},
  {"id": 3, "sentimiento": "neutra", "motivo_principal": "Producto funcional sin destacar, mando a distancia básico"},
  {"id": 4, "sentimiento": "negativa", "motivo_principal": "Producto defectuoso y devolución denegada por plazo"},
  {"id": 5, "sentimiento": "positiva", "motivo_principal": "Sustituye varios aparatos con buen diseño, aunque el amasado decepciona"}
]
```

<a id="valoracion-comparativa-de-ejemplo"></a>
### Valoración comparativa de ejemplo

La variante 4 (chain-of-thought) fue la que más mejoró el resultado en sustancia, porque obligó al modelo a ponderar explícitamente los aspectos positivos y negativos antes de decidir, corrigiendo la clasificación de la reseña 5 de "neutra" a "positiva con matices" — un matiz que las variantes 1 a 3 no captaban por limitarse a una lectura superficial o anclada al patrón de los ejemplos. La variante 5 no cambió la clasificación de fondo (ya resuelta en la 4), pero fue la que más valor aportó de cara a producción, al garantizar un formato homogéneo y 100 % parseable por otro sistema sin depender de que el modelo "decida" cómo presentar la respuesta cada vez.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.2): Entrena tu primer modelo de Machine Learning](../lab-1.2-primer-modelo-ml/enunciado.md) · [Laboratorio siguiente (1.4): Auditoría de sesgo y riesgo de un caso real](../lab-1.4-auditoria-sesgo/enunciado.md) ⟶
