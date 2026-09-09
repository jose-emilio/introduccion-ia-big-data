# Laboratorio 1.5 — Diseña un caso conceptual de IA

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.4): Auditoría de sesgo y riesgo de un caso real](../lab-1.4-auditoria-sesgo/enunciado.md) · [Laboratorio siguiente (2.1): Diagnóstico de las 5 Vs en un dataset real](../../02-fundamentos-del-big-data/lab-2.1-diagnostico-5vs/enunciado.md) ⟶

**Laboratorios relacionados:** [1.1 — Cartografía de la IA a tu alrededor](../lab-1.1-cartografia-ia/enunciado.md) (clasificación de sistemas de IA); [1.2 — Entrena tu primer modelo de Machine Learning](../lab-1.2-primer-modelo-ml/enunciado.md) (ciclo de ML); [1.3 — Ingeniería de prompts con un LLM](../lab-1.3-ingenieria-prompts/enunciado.md) (IA generativa); [1.4 — Auditoría de sesgo y riesgo de un caso real](../lab-1.4-auditoria-sesgo/enunciado.md) (riesgos y AI Act).

## Índice

- [Cabecera](#cabecera)
- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [Fase 1 — Elección del caso (10-15 min)](#fase-1-eleccion-del-caso-10-15-min)
  - [Fase 2 — Diseño del caso (50-70 min)](#fase-2-diseno-del-caso-50-70-min)
  - [Fase 3 — Preparación de la presentación (15-20 min)](#fase-3-preparacion-de-la-presentacion-15-20-min)
  - [Fase 4 — Presentaciones y feedback cruzado (según número de grupos, ~5-8 min por grupo)](#fase-4-presentaciones-y-feedback-cruzado-segun-numero-de-grupos-5-8-min-por-grupo)
- [Entregable](#entregable)
- [Preguntas de reflexión / cierre del módulo](#preguntas-de-reflexion-cierre-del-modulo)
- [Solución propuesta](#solucion-propuesta)
  - [Problema elegido](#problema-elegido)
  - [1. Tipo de sistema de IA](#1-tipo-de-sistema-de-ia)
  - [2. Datos](#2-datos)
  - [3. Modelo o enfoque](#3-modelo-o-enfoque)
  - [4. Riesgos a gestionar](#4-riesgos-a-gestionar)
  - [5. Nivel de supervisión humana](#5-nivel-de-supervision-humana)
  - [Comprobación con el "Mapa final de IA"](#comprobacion-con-el-mapa-final-de-ia)

---

<a id="cabecera"></a>
## Cabecera

- **Bloque temático**: [`07-casos-conceptuales-y-cierre.md`](../../../01-introduccion-a-la-ia/07-casos-conceptuales-y-cierre.md) (laboratorio integrador de cierre del módulo 1).
- **Duración estimada**: 90–120 minutos.
- **Modalidad**: grupos de 3-4 personas.
- **Herramientas necesarias**: la plantilla de diseño de este laboratorio, en papel o en una herramienta de diagramación gratuita (Excalidraw, draw.io/diagrams.net). No se requiere ningún conocimiento técnico adicional al del módulo.

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Al terminar este laboratorio, el alumnado será capaz de integrar los conceptos trabajados a lo largo de todo el módulo 1 —taxonomías de IA, tipos de Machine Learning, IA generativa, aplicaciones sectoriales y riesgos/regulación— diseñando de principio a fin un caso conceptual de aplicación de IA para un problema de negocio concreto, incluyendo la evaluación explícita de qué riesgos habría que gestionar y qué nivel de supervisión humana sería apropiado.

<a id="contexto"></a>
## Contexto

Este es el laboratorio de cierre del módulo. Su función no es introducir contenido nuevo, sino **conectar** todo lo trabajado hasta ahora en un único ejercicio de diseño, del mismo modo que el apunte [`07-casos-conceptuales-y-cierre.md`](../../../01-introduccion-a-la-ia/07-casos-conceptuales-y-cierre.md) cierra el módulo con dos casos conceptuales resueltos (mantenimiento predictivo y asistente documental con RAG) y con el "Mapa final de IA", que resume en diez ideas todo lo visto: IA como sistema, ML/DL, el Transformer, RAG y agentes, riesgos, regulación, adopción, frontera de capacidades, supervisión humana, y la conexión final con el Big Data.

Tu grupo va a diseñar un caso propio siguiendo esa misma estructura, pero para un sector y un problema de negocio elegidos por vosotros. No es necesario que el caso sea técnicamente perfecto ni viable a corto plazo: lo que se evalúa es que uséis correctamente el vocabulario y las taxonomías del módulo para justificar cada decisión de diseño.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="fase-1-eleccion-del-caso-10-15-min"></a>
### Fase 1 — Elección del caso (10-15 min)

1. Como grupo, elegid uno de los 8 problemas de negocio ya redactados en [`problemas-de-negocio-propuestos.md`](problemas-de-negocio-propuestos.md), o proponed uno propio si tenéis una idea clara (validadla brevemente con el facilitador antes de seguir, para aseguraros de que tiene suficiente sustancia para completar la plantilla).

<a id="fase-2-diseno-del-caso-50-70-min"></a>
### Fase 2 — Diseño del caso (50-70 min)

2. Rellenad [`plantilla-diseno-caso.md`](plantilla-diseno-caso.md), sección por sección. La plantilla resume, en una página, las cinco decisiones de diseño que definen cualquier caso conceptual de IA:
   - **Tipo de sistema**: paradigma (simbólico / basado en datos / híbrido), alcance (ANI/AGI/ASI) y naturaleza (débil/fuerte). En la inmensa mayoría de los casos reales de este ejercicio, el sistema será ANI e IA débil: lo interesante es justificar el paradigma.
   - **Datos**: qué datos necesitaría el sistema, de dónde saldrían, y si son datos etiquetados (aprendizaje supervisado), sin etiquetar (no supervisado) o de otro tipo.
   - **Modelo o enfoque**: qué tipo de modelo o técnica encajaría (clasificación, regresión, clustering, LLM/GenAI, RAG, visión por computador, sistema de reglas...), apoyándoos en los bloques 2, 3 y 4 del apunte según corresponda al sector elegido.
   - **Riesgos a gestionar**: qué riesgos concretos del apunte (sesgo, alucinaciones, deriva de distribución, errores adversarios, falta de robustez, fairness, privacidad, seguridad) aplicarían a vuestro caso, y por qué.
   - **Nivel de supervisión humana**: human-in-the-loop, human-on-the-loop o human-out-of-the-loop, justificado según el impacto de una decisión errónea del sistema.
3. Usad el "Mapa final de IA" como lista de comprobación final antes de dar por cerrado el diseño: repasad si vuestro caso conecta con al menos 5-6 de los diez puntos del mapa.

<a id="fase-3-preparacion-de-la-presentacion-15-20-min"></a>
### Fase 3 — Preparación de la presentación (15-20 min)

4. Preparad una presentación de 5 minutos (puede ser el propio documento de la plantilla, un póster en papel, o un tablero de Excalidraw/draw.io) para exponer al resto de la clase. No hace falta una presentación elaborada: el objetivo es comunicar con claridad las cinco decisiones de diseño y su justificación.

<a id="fase-4-presentaciones-y-feedback-cruzado-segun-numero-de-grupos-5-8-min-por-grupo"></a>
### Fase 4 — Presentaciones y feedback cruzado (según número de grupos, ~5-8 min por grupo)

5. Cada grupo presenta su caso en 5 minutos. Tras cada presentación, dos o tres compañeros de otros grupos dan feedback breve (1 min) usando como guía los criterios de [`rubrica-evaluacion.md`](rubrica-evaluacion.md).

<a id="entregable"></a>
## Entregable

Un póster o documento de una página con el diseño del caso (`plantilla-diseno-caso.md` completada), más la presentación oral de 5 minutos.

<a id="preguntas-de-reflexion-cierre-del-modulo"></a>
## Preguntas de reflexión / cierre del módulo

1. De las cinco decisiones de diseño (tipo de sistema, datos, modelo, riesgos, supervisión humana), ¿cuál os ha costado más justificar? ¿Por qué?
2. Si vuestro caso tuviera que clasificarse según el AI Act, ¿en qué nivel de riesgo caería, y os obligaría eso a cambiar alguna de vuestras decisiones de diseño?
3. Mirando atrás a todo el módulo 1: ¿qué concepto del "Mapa final de IA" os parece más importante tener presente cuando, más adelante en el curso, empecéis a trabajar con datos reales a gran escala en el módulo de Big Data?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Esto es **solo un ejemplo posible de solución**, desarrollado sobre uno de los 8 problemas de negocio de `problemas-de-negocio-propuestos.md` (el problema 3, Industria — inspección visual de calidad), distinto del que elija cada grupo. Su objetivo es servir de modelo de la **profundidad y el nivel de detalle** esperado al rellenar `plantilla-diseno-caso.md`, no de "la única respuesta correcta": con cualquiera de los 8 problemas hay varios diseños razonables, siempre que cada decisión esté bien justificada con el vocabulario del módulo.

<a id="problema-elegido"></a>
### Problema elegido

**Industria — Inspección visual de calidad en una línea de producción.** Una fábrica de piezas de automoción inspecciona manualmente cada pieza al final de la línea para detectar defectos superficiales (arañazos, grietas, deformaciones); el proceso es lento, depende de la fatiga del inspector, y algunos defectos pequeños se escapan al control final.

<a id="1-tipo-de-sistema-de-ia"></a>
### Tipo de sistema de IA

- **Paradigma**: basado en datos (Deep Learning, concretamente visión por computador). Los defectos superficiales tienen una variedad visual demasiado grande (forma, tamaño, iluminación, tipo de pieza) para codificarlos como reglas IF-THEN manuales; un modelo entrenado con ejemplos de piezas correctas y defectuosas aprende a reconocer patrones visuales que serían inviables de describir explícitamente.
- **Alcance**: ANI. El sistema resuelve una tarea muy concreta y acotada (clasificar/localizar defectos en un tipo de pieza determinado); no generaliza a otras tareas de fábrica ni a otros dominios.
- **Naturaleza**: IA débil. El sistema reconoce patrones visuales aprendidos de los datos de entrenamiento, sin ninguna comprensión real de qué es una "pieza defectuosa" más allá de la correlación estadística con los ejemplos etiquetados.

<a id="2-datos"></a>
### Datos

- **Fuentes de datos**: imágenes tomadas por cámaras industriales instaladas al final de la línea de montaje, bajo condiciones de iluminación controladas; idealmente un histórico de piezas ya inspeccionadas manualmente en los últimos meses, más las que se vayan capturando de forma continua tras el despliegue.
- **Tipo de aprendizaje**: aprendizaje supervisado. Cada imagen necesita una etiqueta asignada por el equipo de calidad (pieza correcta / defectuosa, e idealmente el tipo de defecto: arañazo, grieta, deformación) para que el modelo aprenda a distinguir ambas clases; sin etiquetas fiables, el sistema no puede aprender qué cuenta como "defecto" en este contexto concreto.
- **Mayor obstáculo anticipado**: el desequilibrio de clases (en una línea de producción bien gestionada, las piezas defectuosas son una minoría frente a las correctas), lo que exige técnicas específicas (sobremuestreo de la clase minoritaria, ponderación de la función de pérdida) para que el modelo no aprenda simplemente a predecir siempre "correcta". También la necesidad de volver a etiquetar y reentrenar cuando la fábrica introduzca nuevos modelos de pieza no vistos en el entrenamiento original.

<a id="3-modelo-o-enfoque"></a>
### Modelo o enfoque

- Una red neuronal convolucional (CNN) o un modelo de visión basado en Transformer, preentrenado en un gran conjunto de imágenes genérico y ajustado (fine-tuning) con las imágenes propias de la fábrica, para clasificación binaria (correcta/defectuosa) o, si se necesita además localizar el defecto en la pieza, un modelo de detección de objetos.
- Se descarta un sistema de reglas puro porque la variedad visual de los defectos es demasiado alta para codificarla a mano; se descarta un enfoque no supervisado (p. ej. clustering o detección de anomalías sin etiquetas) como solución principal porque el objetivo final es una decisión binaria accionable (aceptar/rechazar pieza) y el equipo de calidad ya dispone de criterio experto para etiquetar, lo que hace más eficiente aprovechar el aprendizaje supervisado antes que uno no supervisado más difícil de validar.
- En producción, el modelo se combina con una capa de reglas simple (híbrido a nivel de despliegue, aunque el modelo en sí sea basado en datos): un umbral de confianza por debajo del cual la pieza se envía automáticamente a revisión humana en vez de aceptarse o rechazarse de forma autónoma.

<a id="4-riesgos-a-gestionar"></a>
### Riesgos a gestionar

- [x] **Falta de robustez** — cambios de iluminación, suciedad en la cámara o pequeñas variaciones en el montaje de las cámaras pueden degradar la precisión del modelo sin que nadie lo note de inmediato.
- [x] **Deriva de distribución** — la introducción de un nuevo modelo de pieza o un cambio en el proceso de fabricación puede generar imágenes que el modelo no ha visto en entrenamiento, con un previsible aumento de errores hasta que se reentrene.
- [x] **Sesgo (de muestreo)** — si las imágenes de entrenamiento provienen solo de una línea de producción o de un turno concreto, el modelo puede rendir peor en otras líneas, turnos o condiciones de iluminación no representadas en los datos.
- [ ] Alucinaciones — no aplica (no es un sistema de IA generativa).
- [x] **Otro: impacto en seguridad del producto** — un falso negativo (pieza defectuosa clasificada como correcta) puede llegar a un vehículo en circulación, con implicaciones de seguridad para el usuario final; por eso el coste de los falsos negativos debe tratarse como muy superior al de los falsos positivos (piezas buenas enviadas a revisión adicional), de forma análoga al razonamiento sobre precision/recall del laboratorio 1.2.

<a id="5-nivel-de-supervision-humana"></a>
### Nivel de supervisión humana

**Human-on-the-loop**, con una salvedad: las piezas por debajo de un umbral de confianza pasan a revisión humana obligatoria (un matiz de human-in-the-loop focalizado en los casos dudosos). Justificación: dado que un error del sistema (un defecto no detectado) puede tener consecuencias de seguridad sobre el producto final, no es apropiado un despliegue human-out-of-the-loop desde el primer día. Tampoco es necesario revisar manualmente el 100 % de las piezas de alta confianza, porque eso anularía la ganancia de eficiencia que justifica el proyecto: el equipo de calidad supervisa el funcionamiento global del sistema (auditorías periódicas de una muestra de decisiones automáticas) e interviene directamente solo en los casos de baja confianza, pudiendo recuperar el control total si las métricas de calidad se degradan.

<a id="comprobacion-con-el-mapa-final-de-ia"></a>
### Comprobación con el "Mapa final de IA"

Este caso conecta claramente con los puntos 1 (IA como sistema: cámaras + modelo + umbral + revisión humana, no solo el modelo), 2 (Deep Learning aprendiendo representaciones visuales jerárquicas directamente de las imágenes), 5 (los riesgos —deriva de distribución, falta de robustez, sesgo de muestreo— son reales y gestionables con las mitigaciones propuestas), 9 (la IA no sustituye el juicio humano en una decisión de alto impacto como la seguridad del producto) y 10 (el sistema solo es viable si existe una infraestructura de datos capaz de capturar, almacenar y etiquetar de forma continua miles de imágenes — la conexión con Big Data que se trabajará más adelante en el curso).


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.4): Auditoría de sesgo y riesgo de un caso real](../lab-1.4-auditoria-sesgo/enunciado.md) · [Laboratorio siguiente (2.1): Diagnóstico de las 5 Vs en un dataset real](../../02-fundamentos-del-big-data/lab-2.1-diagnostico-5vs/enunciado.md) ⟶
