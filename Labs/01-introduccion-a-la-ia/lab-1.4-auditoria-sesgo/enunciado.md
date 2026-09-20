# Laboratorio 1.4 — Auditoría de sesgo y riesgo de un caso real

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.3): Ingeniería de prompts con un LLM](../lab-1.3-ingenieria-prompts/enunciado.md) · [Laboratorio siguiente (1.5): Diseña un caso conceptual de IA (integrador)](../lab-1.5-diseno-caso-conceptual/enunciado.md) ⟶

## Índice

- [Cabecera](#cabecera)
- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [El caso: CrediFácil](#el-caso-credifacil)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [Fase 1 — Análisis cuantitativo de disparidad (20-25 min)](#fase-1-analisis-cuantitativo-de-disparidad-20-25-min)
  - [Fase 2 — Diagnóstico del tipo de sesgo (10-15 min)](#fase-2-diagnostico-del-tipo-de-sesgo-10-15-min)
  - [Fase 3 — Métrica de fairness (10-15 min)](#fase-3-metrica-de-fairness-10-15-min)
  - [Fase 4 — Clasificación de riesgo AI Act (10-15 min)](#fase-4-clasificacion-de-riesgo-ai-act-10-15-min)
  - [Fase 5 — Puesta en común (15-20 min)](#fase-5-puesta-en-comun-15-20-min)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)
  - [Fase 1 — Tasas de aprobación](#fase-1-tasas-de-aprobacion)
  - [Fase 2 — Tipo de sesgo](#fase-2-tipo-de-sesgo)
  - [Fase 3 — Métrica de fairness](#fase-3-metrica-de-fairness)
  - [Fase 4 — Clasificación de riesgo AI Act](#fase-4-clasificacion-de-riesgo-ai-act)

---

<a id="cabecera"></a>
## Cabecera

- **Bloque temático**: [`05-riesgos-y-regulacion.md`](../../../01-introduccion-a-la-ia/05-riesgos-y-regulacion.md) (en particular, los bloques "Sesgo y fairness" y "AI Act europeo: enfoque basado en riesgo").
- **Duración estimada**: 60–90 minutos.
- **Modalidad**: grupos de 3-4 personas.
- **Herramientas necesarias**: el fichero de datos [`caso_scoring_crediticio.csv`](caso_scoring_crediticio.csv), que ya está en esta carpeta. Puede trabajarse a mano (contando filas) o con una hoja de cálculo (Excel / Google Sheets) si el grupo tiene soltura; no se requiere programar.

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Al terminar este laboratorio, el alumnado será capaz de aplicar los conceptos de sesgo algorítmico, fairness, explicabilidad y el enfoque de riesgo del AI Act a un caso ficticio pero realista de scoring crediticio, incluyendo la detección cuantitativa de una disparidad entre grupos a partir de datos tabulares.

<a id="contexto"></a>
## Contexto

El apunte explica que el sesgo algorítmico surge cuando los datos, etiquetas o decisiones de diseño producen resultados sistemáticamente desiguales para distintos grupos de personas, y se distinguen tres tipos: sesgo de muestreo, sesgo de etiquetado y variables proxy (features correlacionadas con atributos protegidos). El apunte también presenta el enfoque de riesgo del AI Act europeo, que clasifica los sistemas de IA en cuatro niveles —prácticas prohibidas, alto riesgo, transparencia y riesgo mínimo— con obligaciones proporcionales a cada nivel; el scoring crediticio es uno de los ejemplos típicos de sistema de **alto riesgo** recogidos en el Anexo III del Reglamento.

Este laboratorio traslada esos conceptos a un caso concreto y a datos reales que tu grupo va a analizar con sus propias manos, sin necesidad de programar: basta con contar y comparar proporciones, exactamente el tipo de análisis exploratorio que cualquier equipo de negocio o de cumplimiento normativo haría antes de aprobar el despliegue de un sistema así.

<a id="el-caso-credifacil"></a>
## El caso: CrediFácil

CrediFácil es una fintech ficticia que concede microcréditos personales de forma 100% digital. Para agilizar las decisiones, el equipo de datos ha entrenado un sistema de scoring crediticio con el historial de solicitudes de los últimos meses: a partir de los ingresos, el historial crediticio previo y el barrio de residencia del solicitante, el modelo aprende a predecir si una solicitud debería aprobarse o no, replicando el patrón de las decisiones humanas pasadas que sirvieron de datos de entrenamiento.

El equipo de dirección de CrediFácil quiere lanzar el sistema el mes que viene, pero antes ha pedido a un equipo interno —tu grupo, en este ejercicio— que realice una auditoría de sesgo y de riesgo regulatorio sobre una muestra de los datos de entrenamiento, recogida en [`caso_scoring_crediticio.csv`](caso_scoring_crediticio.csv): 28 solicitudes históricas con las columnas `solicitante_id`, `barrio` (Barrio Norte, de renta alta, o Barrio Sur, de renta baja), `ingresos_mensuales_eur`, `historial_crediticio` (Bueno/Regular/Malo), `importe_solicitado_eur` y `aprobado` (1 = aprobada, 0 = denegada).

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="fase-1-analisis-cuantitativo-de-disparidad-20-25-min"></a>
### Fase 1 — Análisis cuantitativo de disparidad (20-25 min)

1. Abre el CSV (en una hoja de cálculo, o simplemente leyéndolo como texto/tabla) y calcula la **tasa de aprobación por barrio**: de todas las solicitudes de Barrio Norte, ¿qué porcentaje fue aprobado? Haz lo mismo para Barrio Sur.
   - Si usas Excel o Google Sheets, puedes calcularlo con una fórmula como `=PROMEDIO.SI(rango_barrio; "Barrio Norte (renta alta)"; rango_aprobado)` (en inglés, `AVERAGEIF`), que directamente te da la proporción de 1s (aprobados) para ese grupo. Otra opción es construir una tabla dinámica con `barrio` en filas y el promedio de `aprobado` como valor.
   - Si lo haces a mano, simplemente cuenta cuántas filas de cada barrio tienen `aprobado = 1` y divide entre el total de filas de ese barrio.
2. Repite el cálculo, pero esta vez **controlando por historial crediticio**: calcula la tasa de aprobación de Barrio Norte y de Barrio Sur únicamente entre las solicitudes con `historial_crediticio = "Bueno"`. Esto es clave: si la disparidad desaparece al comparar personas con el mismo historial, el problema podría no ser el barrio; si la disparidad se mantiene o incluso aumenta, es una señal mucho más fuerte de sesgo.
3. Anota ambos resultados en el apartado 1 de [`ficha-auditoria-plantilla.md`](ficha-auditoria-plantilla.md).

<a id="fase-2-diagnostico-del-tipo-de-sesgo-10-15-min"></a>
### Fase 2 — Diagnóstico del tipo de sesgo (10-15 min)

4. Con los números de la fase 1 delante, discutid en grupo: ¿la variable `barrio` está actuando como una variable proxy de otra característica (por ejemplo, nivel de renta) que el modelo no debería usar para decidir, ni de forma directa ni indirecta? Repasad los tres tipos de sesgo vistos en el apunte (muestreo, etiquetado, variable proxy) y decidid cuál encaja mejor con lo que observáis en los datos, justificando por qué descartáis los otros dos.
5. Proponed una acción de mitigación concreta y aplicable (por ejemplo: eliminar `barrio` como feature de entrada, auditar si hay otras variables correlacionadas con el barrio que reintroducirían el mismo problema, recalibrar el umbral de decisión por grupo, o revisar el proceso histórico de aprobación que generó las etiquetas de entrenamiento).

<a id="fase-3-metrica-de-fairness-10-15-min"></a>
### Fase 3 — Métrica de fairness (10-15 min)

6. Proponed una métrica de fairness razonable para este caso (por ejemplo, paridad de tasas de aprobación entre barrios, o igualdad de tasa de falsos negativos entre grupos) y discutid sus limitaciones: ¿qué se pierde o qué efecto secundario podría tener imponer esa métrica de forma estricta? (Pista: el apunte recuerda que existen más de 20 métricas de fairness matemáticamente incompatibles entre sí — no hay una respuesta única "correcta", sino una elección justificada según el contexto).

<a id="fase-4-clasificacion-de-riesgo-ai-act-10-15-min"></a>
### Fase 4 — Clasificación de riesgo AI Act (10-15 min)

7. Clasificad el sistema de CrediFácil según los cuatro niveles de riesgo del AI Act (prohibido / alto riesgo / riesgo limitado-transparencia / riesgo mínimo) y justificad qué obligaciones concretas le aplicarían según ese nivel.

<a id="fase-5-puesta-en-comun-15-20-min"></a>
### Fase 5 — Puesta en común (15-20 min)

8. Cada grupo presenta su ficha de auditoría al resto de la clase en 3-5 minutos, mostrando en particular las dos tasas de aprobación calculadas en la fase 1 y la clasificación de riesgo AI Act con su justificación.

<a id="entregable"></a>
## Entregable

`ficha-auditoria-plantilla.md` completada por cada grupo, más la presentación oral de 3-5 minutos.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. Si CrediFácil eliminase la columna `barrio` del modelo pero mantuviese el `código postal` como feature, ¿resolvería eso el problema? ¿Por qué sí o por qué no?
2. ¿Quién debería tener la última palabra sobre si este sistema se lanza o no: el equipo de datos, el equipo legal, la dirección, o un comité mixto? Conecta tu respuesta con el concepto de human-in-the-loop visto en el apunte.
3. ¿Cambiaría tu análisis si el `barrio` no estuviera en los datos, pero el modelo obtuviera el mismo patrón de disparidad usando solo `ingresos_mensuales_eur`? ¿Seguiría siendo un problema de sesgo?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

Los números de esta sección han sido recalculados directamente sobre `caso_scoring_crediticio.csv` (28 filas) para confirmarlos.

<a id="fase-1-tasas-de-aprobacion"></a>
### Fase 1 — Tasas de aprobación

| | Barrio Norte (renta alta) | Barrio Sur (renta baja) |
| --- | --- | --- |
| N.º de solicitudes | 14 | 14 |
| Tasa de aprobación global | **78,6 %** (11/14) | **28,6 %** (4/14) |
| Tasa de aprobación, solo historial "Bueno" | **88,9 %** (8/9) | **33,3 %** (3/9) |
| Tasa de aprobación, solo historial "Regular" | 75,0 % (3/4) | 25,0 % (1/4) |
| Tasa de aprobación, solo historial "Malo" | 0 % (0/1) | 0 % (0/1) |

Dato clave: la distribución de historial crediticio es **idéntica** entre ambos barrios (9 "Bueno", 4 "Regular", 1 "Malo" en cada uno), y los ingresos medios son parecidos (2.550 € en Norte frente a 2.265 € en Sur — una diferencia moderada, insuficiente por sí sola para explicar 50 puntos porcentuales de diferencia en aprobación). La disparidad se mantiene casi intacta incluso controlando por historial crediticio (de 88,9 % a 33,3 % entre solicitantes con historial "Bueno"): la disparidad **no se explica por el perfil de riesgo del solicitante, sino por el barrio en sí**.

#### Fórmulas de Excel / Google Sheets para reproducir estos cálculos

Si abres `caso_scoring_crediticio.csv` en Excel o Sheets, las columnas quedan así: **A** `solicitante_id`, **B** `barrio`, **C** `ingresos_mensuales_eur`, **D** `historial_crediticio`, **E** `importe_solicitado_eur`, **F** `aprobado`; la fila 1 es la cabecera y los 28 solicitantes ocupan las filas **2 a 29**. Como `aprobado` ya es 1 (aprobada) o 0 (denegada), promediar esa columna filtrada por grupo da directamente la tasa de aprobación — no hace falta dividir tú mismo aprobados entre total.

**Tasa de aprobación global por barrio** (una celda por barrio):

| Cálculo | Fórmula (Excel en español) | Equivalente en inglés (Google Sheets / Excel EN) | Resultado |
| --- | --- | --- | --- |
| Barrio Norte | `=PROMEDIO.SI(B2:B29;"Barrio Norte (renta alta)";F2:F29)` | `=AVERAGEIF(B2:B29,"Barrio Norte (renta alta)",F2:F29)` | 0,786 (78,6 %) |
| Barrio Sur | `=PROMEDIO.SI(B2:B29;"Barrio Sur (renta baja)";F2:F29)` | `=AVERAGEIF(B2:B29,"Barrio Sur (renta baja)",F2:F29)` | 0,286 (28,6 %) |

Formatea la celda como porcentaje (o multiplica por 100) para leerlo como 78,6 % / 28,6 %. Si prefieres verlo desglosado en aprobados y total en vez de un promedio directo:

| Cálculo | Fórmula (español) | Equivalente (inglés) |
| --- | --- | --- |
| N.º aprobadas, Barrio Norte | `=CONTAR.SI.CONJUNTO(B2:B29;"Barrio Norte (renta alta)";F2:F29;1)` | `=COUNTIFS(B2:B29,"Barrio Norte (renta alta)",F2:F29,1)` |
| N.º solicitudes, Barrio Norte | `=CONTAR.SI(B2:B29;"Barrio Norte (renta alta)")` | `=COUNTIF(B2:B29,"Barrio Norte (renta alta)")` |
| Tasa = aprobadas / total | `=CONTAR.SI.CONJUNTO(B2:B29;"Barrio Norte (renta alta)";F2:F29;1)/CONTAR.SI(B2:B29;"Barrio Norte (renta alta)")` | `=COUNTIFS(B2:B29,"Barrio Norte (renta alta)",F2:F29,1)/COUNTIF(B2:B29,"Barrio Norte (renta alta)")` |

(sustituye `"Barrio Norte (renta alta)"` por `"Barrio Sur (renta baja)"` para el segundo grupo).

**Tasa de aprobación controlando por historial crediticio** (dos condiciones a la vez → función con "S" al final / "S" de "IFS"):

| Cálculo | Fórmula (Excel en español) | Equivalente (inglés) | Resultado |
| --- | --- | --- | --- |
| Norte, historial "Bueno" | `=PROMEDIO.SI.CONJUNTO(F2:F29;B2:B29;"Barrio Norte (renta alta)";D2:D29;"Bueno")` | `=AVERAGEIFS(F2:F29,B2:B29,"Barrio Norte (renta alta)",D2:D29,"Bueno")` | 0,889 (88,9 %) |
| Sur, historial "Bueno" | `=PROMEDIO.SI.CONJUNTO(F2:F29;B2:B29;"Barrio Sur (renta baja)";D2:D29;"Bueno")` | `=AVERAGEIFS(F2:F29,B2:B29,"Barrio Sur (renta baja)",D2:D29,"Bueno")` | 0,333 (33,3 %) |
| Norte, historial "Regular" | `=PROMEDIO.SI.CONJUNTO(F2:F29;B2:B29;"Barrio Norte (renta alta)";D2:D29;"Regular")` | `=AVERAGEIFS(F2:F29,B2:B29,"Barrio Norte (renta alta)",D2:D29,"Regular")` | 0,75 (75,0 %) |
| Sur, historial "Regular" | `=PROMEDIO.SI.CONJUNTO(F2:F29;B2:B29;"Barrio Sur (renta baja)";D2:D29;"Regular")` | `=AVERAGEIFS(F2:F29,B2:B29,"Barrio Sur (renta baja)",D2:D29,"Regular")` | 0,25 (25,0 %) |
| Norte, historial "Malo" | `=PROMEDIO.SI.CONJUNTO(F2:F29;B2:B29;"Barrio Norte (renta alta)";D2:D29;"Malo")` | `=AVERAGEIFS(F2:F29,B2:B29,"Barrio Norte (renta alta)",D2:D29,"Malo")` | 0 (0 %) |
| Sur, historial "Malo" | `=PROMEDIO.SI.CONJUNTO(F2:F29;B2:B29;"Barrio Sur (renta baja)";D2:D29;"Malo")` | `=AVERAGEIFS(F2:F29,B2:B29,"Barrio Sur (renta baja)",D2:D29,"Malo")` | 0 (0 %) |

Nota: en `PROMEDIO.SI.CONJUNTO`/`AVERAGEIFS` el primer argumento es siempre el rango que se promedia (`F2:F29`, la columna `aprobado`) y después van los pares rango-criterio, al revés que en `PROMEDIO.SI`/`AVERAGEIF`, donde el rango a promediar va al final. Si tu Excel está en español pero configurado con punto y coma como separador de argumentos (`;`) y el tuyo usa coma (`,`), ajusta el separador según lo que te proponga el propio Excel al escribir la fórmula — el resto de la sintaxis es igual.

Como alternativa más visual a escribir fórmulas, una **tabla dinámica** con `barrio` en Filas, `historial_crediticio` en Columnas (o como segundo campo de Filas) y el **promedio** (no la suma) de `aprobado` como Valores reproduce toda la tabla de la Fase 1 de una sola vez, sin escribir ninguna fórmula.

<a id="fase-2-tipo-de-sesgo"></a>
### Fase 2 — Tipo de sesgo

**Variable proxy.** La columna `barrio` no es un atributo legalmente protegido, pero en este dataset actúa como proxy de nivel socioeconómico/renta (la propia etiqueta de la columna lo indica: "renta alta" / "renta baja"). El modelo, al aprender de datos históricos donde el barrio predice la aprobación incluso controlando por historial crediticio, replicará y perpetuará esa disparidad.

Por qué se descartan los otros dos tipos: **no es sesgo de muestreo** (la muestra tiene el mismo número de solicitudes y la misma distribución de historial crediticio en ambos barrios); **podría haber también sesgo de etiquetado subyacente** (las decisiones históricas de aprobación que generaron la columna `aprobado` podrían haber sido ya discriminatorias en origen) — es una causa raíz compatible con la variable proxy, no excluyente, y un grupo que combine ambas respuestas de forma argumentada da una respuesta completa.

Acciones de mitigación válidas: eliminar `barrio` como feature; auditar otras variables correlacionadas con el barrio (código postal, canal de captación...) que reintroducirían el mismo sesgo de forma indirecta; revisar el proceso histórico que generó las etiquetas de `aprobado` en vez de asumirlo como "verdad" a aprender; aplicar una restricción de fairness en el entrenamiento o recalibrar el umbral por grupo; e incorporar revisión humana (human-in-the-loop) para solicitudes cercanas al umbral, especialmente en Barrio Sur mientras se corrige el modelo.

<a id="fase-3-metrica-de-fairness"></a>
### Fase 3 — Métrica de fairness

No hay una única respuesta correcta (existen más de 20 métricas de fairness matemáticamente incompatibles entre sí). Ejemplos razonables:

- **Paridad de tasas de aprobación** entre Norte y Sur: fácil de calcular y comunicar, pero puede forzar a aprobar a solicitantes de mayor riesgo real en un grupo, o denegar a solicitantes de bajo riesgo en el otro, si el riesgo real de impago difiere genuinamente entre grupos.
- **Igualdad de oportunidad / igualdad de tasa de falsos negativos**: más matizada, pero requiere saber cuál es el resultado "correcto" de cada solicitud — algo difícil de establecer sin sesgo circular, porque el propio histórico de aprobaciones ya está sesgado.
- **Calibración por grupo**: técnica más avanzada y válida, pero conviene comprobar que se entiende bien la diferencia con la paridad simple.

Lo importante pedagógicamente es proponer **una** métrica bien justificada y **al menos una** limitación real, no memorizar la lista completa.

<a id="fase-4-clasificacion-de-riesgo-ai-act"></a>
### Fase 4 — Clasificación de riesgo AI Act

**Alto riesgo.** El scoring crediticio / evaluación de solvencia para el acceso a servicios financieros esenciales está explícitamente recogido en el **Anexo III** del AI Act como sistema de alto riesgo ("servicios esenciales privados y públicos").

- No es una práctica prohibida: no hace scoring social generalizado, manipulación subliminal ni biometría en tiempo real; es una evaluación crediticia sectorial legítima, aunque de alto impacto.
- Como sistema de alto riesgo le aplican requisitos estrictos: evaluación de conformidad antes del despliegue, registro en la base de datos de la UE de sistemas de alto riesgo, documentación técnica, sistema de gestión de riesgos y de calidad de los datos de entrenamiento, supervisión humana efectiva, y transparencia hacia los solicitantes afectados (derecho a explicación de la decisión).
- Dado el impacto del sistema, lo esperable es como mínimo un enfoque human-on-the-loop o human-in-the-loop, no una automatización completa sin supervisión.
- Nota de calendario: las obligaciones específicas para sistemas de alto riesgo del Anexo III tienen aplicación progresiva (prevista para agosto de 2026, prorrogada a diciembre de 2027 por el Digital Omnibus on AI); esto no cambia la clasificación de riesgo del sistema en sí.

**Errores frecuentes a corregir**: confundir "alto riesgo" con "prohibido" (el scoring crediticio no está prohibido, está sujeto a obligaciones reforzadas); concluir que basta con "quitar el barrio" sin auditar variables correlacionadas; y tratar la disparidad como un problema puramente técnico sin conectar con la obligación regulatoria de gestión de riesgo de sesgo.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.3): Ingeniería de prompts con un LLM](../lab-1.3-ingenieria-prompts/enunciado.md) · [Laboratorio siguiente (1.5): Diseña un caso conceptual de IA (integrador)](../lab-1.5-diseno-caso-conceptual/enunciado.md) ⟶
