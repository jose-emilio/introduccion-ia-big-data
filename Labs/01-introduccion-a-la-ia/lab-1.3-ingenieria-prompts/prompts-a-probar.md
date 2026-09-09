# Prompts a probar — Laboratorio 1.3

Copia y pega cada prompt tal cual en una conversación **nueva** del LLM. En todos los casos, sustituye el marcador `[PEGAR AQUÍ LAS 5 RESEÑAS]` por el texto completo de las 5 reseñas de [`resenas-de-ejemplo.md`](resenas-de-ejemplo.md) (numeradas del 1 al 5, tal como aparecen allí).

---

## Variante 1 — Pregunta directa, sin contexto

Componente del prompt presente: ninguno de los avanzados; solo la instrucción básica.

```
Clasifica estas reseñas.

[PEGAR AQUÍ LAS 5 RESEÑAS]
```

---

## Variante 2 — Con system prompt (rol e instrucciones)

Componente añadido: system prompt con rol, tarea explícita y restricciones de formato.

```
Eres un analista de experiencia de cliente de una tienda online de electrónica. Tu tarea es leer reseñas de clientes y, para cada una, indicar:
1. Su sentimiento: positiva, negativa o neutra.
2. El motivo principal de esa valoración, en una frase corta.

Responde reseña por reseña, numerándolas igual que en el texto original. Sé objetivo y basa la clasificación únicamente en lo que dice el texto, no en suposiciones.

Estas son las reseñas a clasificar:

[PEGAR AQUÍ LAS 5 RESEÑAS]
```

---

## Variante 3 — Con ejemplos (few-shot)

Componente añadido: 2-3 ejemplos resueltos que muestran el formato y el criterio de clasificación esperado, antes de las reseñas reales.

```
Eres un analista de experiencia de cliente de una tienda online de electrónica. Tu tarea es leer reseñas de clientes y clasificar cada una como positiva, negativa o neutra, indicando también el motivo principal.

Aquí tienes tres ejemplos de cómo debes responder:

Ejemplo A: "El cargador llegó roto y encima tardaron una semana en responder al ticket de soporte."
→ Sentimiento: negativa. Motivo principal: producto defectuoso y mala atención al cliente.

Ejemplo B: "Funciona como se describe, sin sorpresas, ni bien ni mal."
→ Sentimiento: neutra. Motivo principal: producto cumple lo prometido sin destacar en ningún aspecto.

Ejemplo C: "Superó mis expectativas, la batería dura muchísimo más de lo que pensaba y el envío fue rapidísimo."
→ Sentimiento: positiva. Motivo principal: duración de batería mejor de lo esperado y envío rápido.

Ahora clasifica, con el mismo formato, estas reseñas reales:

[PEGAR AQUÍ LAS 5 RESEÑAS]
```

---

## Variante 4 — Con razonamiento paso a paso (chain-of-thought)

Componente añadido: instrucción explícita de razonar antes de dar la respuesta final.

```
Eres un analista de experiencia de cliente de una tienda online de electrónica. Para cada una de las siguientes reseñas, sigue este proceso:

1. Primero, razona en voz alta: identifica qué aspectos positivos y qué aspectos negativos menciona el cliente, y si hay algún matiz o contradicción en el texto.
2. Después, decide el sentimiento global (positiva, negativa o neutra) teniendo en cuenta el peso relativo de esos aspectos.
3. Por último, resume el motivo principal en una frase.

Muestra tu razonamiento del paso 1 antes de dar la conclusión de los pasos 2 y 3, reseña por reseña.

Estas son las reseñas:

[PEGAR AQUÍ LAS 5 RESEÑAS]
```

---

## Variante 5 — Con salida estructurada (JSON)

Componente añadido: instrucción de devolver el resultado en un formato estructurado y parseable por otro programa.

```
Eres un sistema de análisis de reseñas de clientes. Vas a recibir 5 reseñas de una tienda online de electrónica. Para cada una, determina su sentimiento y el motivo principal.

Devuelve EXCLUSIVAMENTE un array JSON válido, sin texto adicional antes ni después, con este formato exacto para cada reseña:

[
  {
    "id": 1,
    "sentimiento": "positiva | negativa | neutra",
    "motivo_principal": "string breve"
  }
]

Estas son las reseñas:

[PEGAR AQUÍ LAS 5 RESEÑAS]
```
