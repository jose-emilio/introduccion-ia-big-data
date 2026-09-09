# Laboratorio 1.1 — Cartografía de la IA a tu alrededor

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · [Laboratorio siguiente (1.2): Entrena tu primer modelo de Machine Learning](../lab-1.2-primer-modelo-ml/enunciado.md) ⟶

## Índice

- [Cabecera](#cabecera)
- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [Fase 1 — Trabajo individual o en parejas (25–35 min)](#fase-1-trabajo-individual-o-en-parejas-2535-min)
  - [Fase 2 — Puesta en común en grupo grande (25–40 min)](#fase-2-puesta-en-comun-en-grupo-grande-2540-min)
  - [Rol del facilitador](#rol-del-facilitador)
- [Entregable](#entregable)
- [Preguntas de reflexión (cierre, 5-10 min)](#preguntas-de-reflexion-cierre-5-10-min)
- [Solución propuesta](#solucion-propuesta)

---

<a id="cabecera"></a>
## Cabecera

- **Bloque temático**: [`01-definir-ia.md`](../../../01-introduccion-a-la-ia/01-definir-ia.md).
- **Duración estimada**: 60–90 minutos.
- **Modalidad**: individual o en parejas.
- **Herramientas necesarias**: ninguna herramienta digital específica. Basta con papel y bolígrafo, o un documento de texto propio (Word, Google Docs, Notion...) donde copiar la plantilla de clasificación.

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Al terminar este laboratorio, el alumnado será capaz de distinguir en la práctica IA estrecha (ANI) frente a IA general o superinteligencia (AGI/ASI), IA débil frente a IA fuerte, e IA simbólica frente a IA basada en datos frente a IA híbrida, aplicando estas tres taxonomías a sistemas de IA que usa habitualmente en su vida cotidiana o profesional.

<a id="contexto"></a>
## Contexto

En el bloque `01-definir-ia.md` se han presentado tres ejes de clasificación distintos y complementarios para cualquier sistema de IA:

1. **Alcance**: ¿el sistema resuelve una tarea concreta (ANI, el estado actual de toda la IA real) o generaliza como un ser humano entre dominios (AGI, hipotética) o los supera en todos ellos (ASI, especulativa)?
2. **Naturaleza**: ¿el sistema simula comprensión mediante patrones (IA débil, que es lo único que existe hoy) o posee comprensión genuina del mundo (IA fuerte, un concepto puramente teórico)? Es importante no confundir esta distinción filosófica con la de "alcance": en la práctica, todo lo que es ANI es también IA débil.
3. **Paradigma**: ¿el sistema codifica el conocimiento explícitamente mediante reglas definidas por expertos (simbólico), lo aprende de datos (basado en datos / ML) o combina ambos enfoques con supervisión humana (híbrido)?

Estas tres taxonomías no son excluyentes entre sí: un mismo sistema se describe con una etiqueta de cada eje. Por ejemplo, un antivirus con reglas fijas es ANI + IA débil + simbólico, mientras que un gran modelo de lenguaje es ANI + IA débil + basado en datos (aunque, como se discutirá en la puesta en común, esta última etiqueta empieza a matizarse cuando el modelo usa herramientas externas).

El propósito de este laboratorio no es memorizar las definiciones, sino entrenar el criterio para aplicarlas a casos reales, incluyendo los casos ambiguos donde la clasificación exige justificar una elección razonada más que "acertar" una única respuesta correcta.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="fase-1-trabajo-individual-o-en-parejas-2535-min"></a>
### Fase 1 — Trabajo individual o en parejas (25–35 min)

1. El facilitador entrega o proyecta la lista de 12 sistemas de `plantilla-clasificacion.md`.
2. Cada alumno (o pareja) copia la tabla de esa plantilla a su propio documento o folio.
3. Para cada uno de los 12 sistemas, rellena las tres columnas de clasificación:
   - **Alcance**: ANI / AGI / ASI.
   - **Naturaleza**: IA débil / IA fuerte.
   - **Paradigma**: simbólico / basado en datos / híbrido.
4. En la columna **Justificación**, escribe una frase breve explicando por qué has elegido esa etiqueta, apoyándote en el apunte (bloques de Alcance, Naturaleza y Paradigma). No hay problema en dudar entre dos opciones: en ese caso, anota ambas y la razón de la duda — eso alimentará el debate de la fase 2.

Recomendación de ritmo: no dediques más de 2-3 minutos por sistema. El objetivo es una primera clasificación razonada, no una investigación exhaustiva de cada producto.

<a id="fase-2-puesta-en-comun-en-grupo-grande-2540-min"></a>
### Fase 2 — Puesta en común en grupo grande (25–40 min)

5. El facilitador recoge, sistema por sistema, las clasificaciones de varias parejas y anota en la pizarra los casos donde ha habido discrepancia.
6. Se abre un debate dirigido sobre los 3-4 casos más discutidos del grupo. Casos típicos que generan desacuerdo:
   - **ChatGPT / un LLM conversacional**: ¿es "solo" IA basada en datos, o cuando usa herramientas (búsqueda web, ejecución de código) empieza a comportarse como un sistema híbrido? (Conecta con el apunte, en el bloque "IA basada en herramientas", que se verá en detalle en el bloque 3 — aquí basta con introducir la idea).
   - **Un sistema experto de diagnóstico médico basado en reglas**: por qué sigue siendo relevante hoy pese a no usar ML (auditabilidad, determinismo, dominios regulados).
   - **Un coche con conducción autónoma de nivel 2**: por qué NO es AGI aunque combine visión, planificación y control — sigue siendo una tarea (conducir) por especializada que sea.
   - **AlphaFold**: por qué es ANI extremadamente potente en su dominio (predicción de estructura de proteínas) y no un ejemplo de AGI, aunque su rendimiento supere ampliamente a los expertos humanos en esa tarea concreta.
7. Cierre: el facilitador resume la idea clave del bloque — "ningún sistema real de hoy es AGI ni IA fuerte; la potencia observable de un sistema en su tarea no debe confundirse con inteligencia general" (ver el apunte, "El comportamiento inteligente no implica inteligencia general").

<a id="rol-del-facilitador"></a>
### Rol del facilitador

- Antes de la sesión: revisar `notas-para-el-facilitador.md`, que contiene una clasificación de referencia razonada para los 12 sistemas — úsala para validar respuestas y para preparar las preguntas del debate, pero no la repartas al alumnado antes de la puesta en común.
- Durante la fase 1: circular entre las parejas, sin dar la respuesta directamente; si preguntan por un caso dudoso, devolver la pregunta ("¿qué parte del apunte te ayudaría a decidir esto?").
- Durante la fase 2: priorizar el tiempo en los casos donde de verdad hay desacuerdo en el aula, aunque no coincidan exactamente con los sugeridos arriba — el valor pedagógico está en la discusión, no en la lista cerrada.
- Gestión del tiempo: si el grupo es grande (más de 15 parejas), seleccionar solo 3-4 sistemas para la puesta en común en lugar de repasar los 12 uno a uno.

<a id="entregable"></a>
## Entregable

La tabla de `plantilla-clasificacion.md` completada por cada alumno o pareja, con las tres columnas de clasificación y la justificación de cada uno de los 12 sistemas. No es necesario entregarla en un formato específico: puede quedar en el cuaderno del alumno o subirse como foto/documento al espacio del curso, según decida el centro.

<a id="preguntas-de-reflexion-cierre-5-10-min"></a>
## Preguntas de reflexión (cierre, 5-10 min)

1. De los 12 sistemas clasificados, ¿cuál te ha costado más encajar en una sola casilla? ¿Por qué crees que ocurre eso — es un problema de la taxonomía, o del propio sistema?
2. Piensa en dos sistemas de IA que uses en tu día a día y que no estén en la lista. ¿Cómo los clasificarías en los tres ejes?
3. ¿Crees que dentro de 5 años alguno de los 12 sistemas de la lista podría cambiar de categoría (por ejemplo, de "basado en datos" a "híbrido")? Justifica tu respuesta con un ejemplo concreto.

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Esta clasificación es razonada, no dogmática: en varios de los 12 casos una respuesta alternativa también es defendible si se justifica bien. El valor pedagógico está en la justificación, no en acertar la etiqueta exacta (ver los casos marcados como "con matices" o "de debate" más abajo).

| # | Sistema | Alcance | Naturaleza | Paradigma | Justificación de referencia |
| --- | --- | --- | --- | --- | --- |
| 1 | Recomendador de Netflix | ANI | IA débil | Basado en datos | Aprende patrones de visionado (filtrado colaborativo / embeddings) sin ninguna comprensión del contenido. Tarea única y específica. |
| 2 | GPS con tráfico en tiempo real | ANI | IA débil | Híbrido | Combina modelos de ML para predecir tiempos de trayecto con reglas de enrutamiento y restricciones de tráfico (sentidos únicos, cortes). Ejemplo directo de "reglas + ML". |
| 3 | ChatGPT / LLM conversacional | ANI | IA débil | Basado en datos (con matices) | Modelo fundacional entrenado en datos a escala: sigue siendo ANI (una tarea, "generar texto siguiendo instrucciones") pese a su versatilidad aparente. **Caso de debate**: cuando usa herramientas (búsqueda, ejecución de código) su comportamiento en producción se acerca a un sistema híbrido; ambas respuestas son válidas si están justificadas. |
| 4 | Sistema experto de diagnóstico basado en reglas fijas | ANI | IA débil | Simbólico | Base de conocimiento + motor de inferencia IF-THEN, determinista y trazable — por eso sigue siendo relevante en dominios auditables como el sanitario o el compliance. |
| 5 | AlphaFold | ANI | IA débil | Basado en datos | Extraordinariamente potente en una tarea muy concreta (predicción de estructura de proteínas): el ejemplo perfecto para discutir que un rendimiento sobrehumano en una tarea no implica AGI. |
| 6 | Chatbot de atención al cliente con árbol de reglas fijas | ANI | IA débil | Simbólico | Sin componente de aprendizaje: sigue rutas de conversación predefinidas por reglas. Contraste directo con el chatbot generativo (#3). |
| 7 | Antivirus con reglas y firmas | ANI | IA débil | Simbólico | Base de firmas conocidas + reglas de coincidencia. Los antivirus modernos incorporan también ML para detección heurística de malware desconocido — si se argumenta "híbrido", es una respuesta igualmente válida. |
| 8 | Filtro de spam de Gmail | ANI | IA débil | Basado en datos (con origen simbólico) | Los filtros de spam actuales son modelos de clasificación de texto entrenados con ejemplos (spam/no spam); los primeros filtros de los años 90-2000 eran mayoritariamente de reglas, así que la evolución del paradigma es parte de la respuesta. |
| 9 | Traductor automático tipo DeepL | ANI | IA débil | Basado en datos | Arquitectura Transformer entrenada en pares de frases en distintos idiomas; la traducción por reglas es historia, hoy es puramente basada en datos. |
| 10 | Recomendador de Spotify | ANI | IA débil | Basado en datos | Análogo al caso de Netflix (#1): filtrado colaborativo y embeddings de usuario-canción. |
| 11 | Coche con conducción autónoma nivel 2 | ANI | IA débil | Híbrido | Combina visión por computador (percepción) y ML de control con reglas de seguridad deterministas (límites de velocidad, distancias mínimas). Sigue siendo una tarea (conducir de forma asistida): por definición NO es AGI, ni siquiera en el nivel más alto de autonomía. |
| 12 | Calculadora | ANI | IA débil | Simbólico (y discutible si "es IA" en absoluto) | Caso extremo intencionado: una calculadora no aprende ni tiene ambigüedad, ejecuta reglas aritméticas fijas. Sirve para debatir dónde está el límite entre "programa determinista clásico" y "sistema de IA simbólico" — ambas respuestas ("simbólico" o "no es IA") son aceptables si se justifican. |

**Casos de debate prioritarios para la puesta en común** (fase 2): #3 (ChatGPT, el más rico — introduce la idea de "tool use"), #11 (coche nivel 2 — refuerza que "más capaz" no es sinónimo de "más general"), #7 vs. #6 (fija qué caracteriza al paradigma simbólico frente al híbrido) y #12 (cierre provocador sobre qué es lo mínimo para considerarse "IA").

**Errores frecuentes a corregir**: confundir "alcance" con "naturaleza" (pensar que un sistema muy potente como AlphaFold es automáticamente "IA fuerte" — todo sistema real de hoy es IA débil, sin excepción); etiquetar cualquier sistema con reglas visibles como puramente simbólico sin considerar que pueda tener un componente de ML por debajo; y usar "AGI" de forma coloquial para referirse a "un sistema muy bueno".

Esta tabla es un resumen adaptado de `notas-para-el-facilitador.md`, que el profesorado puede seguir consultando como guía completa para el debate (incluye además orientaciones de ritmo y gestión del tiempo de la sesión).


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · [Laboratorio siguiente (1.2): Entrena tu primer modelo de Machine Learning](../lab-1.2-primer-modelo-ml/enunciado.md) ⟶
