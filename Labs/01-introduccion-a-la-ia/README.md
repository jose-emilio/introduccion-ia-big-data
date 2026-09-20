# Módulo 1 — Introducción a la Inteligencia Artificial · Labs

**Navegación:** [Índice general de Labs](../README.md) · [Módulo 2 — Fundamentos del Big Data](../02-fundamentos-del-big-data/README.md) ⟶

## Índice

- [Resumen de cada laboratorio](#resumen-de-cada-laboratorio)

---

Este módulo incluye 5 laboratorios prácticos, alineados con los bloques temáticos de los [Apuntes del módulo 1](../../01-introduccion-a-la-ia/). Cuatro de ellos son actividades sin código (individuales, en parejas o en grupo, con plantillas ya redactadas); el laboratorio 1.2 incluye un notebook con todo el código ya preparado y listo para ejecutar.

| Laboratorio | Título | Duración | Modalidad | Enunciado |
| --- | --- | --- | --- | --- |
| 1.1 | Cartografía de la IA a tu alrededor | 60–90 min | Individual / parejas | [lab-1.1-cartografia-ia/enunciado.md](lab-1.1-cartografia-ia/enunciado.md) |
| 1.2 | Entrena tu primer modelo de Machine Learning | 90–120 min | Individual (notebook) | [lab-1.2-primer-modelo-ml/enunciado.md](lab-1.2-primer-modelo-ml/enunciado.md) |
| 1.3 | Ingeniería de prompts con un LLM | 60 min | Individual / parejas | [lab-1.3-ingenieria-prompts/enunciado.md](lab-1.3-ingenieria-prompts/enunciado.md) |
| 1.4 | Auditoría de sesgo y riesgo de un caso real | 60–90 min | Grupos de 3-4 | [lab-1.4-auditoria-sesgo/enunciado.md](lab-1.4-auditoria-sesgo/enunciado.md) |
| 1.5 | Diseña un caso conceptual de IA (integrador) | 90–120 min | Grupos de 3-4 | [lab-1.5-diseno-caso-conceptual/enunciado.md](lab-1.5-diseno-caso-conceptual/enunciado.md) |

<a id="resumen-de-cada-laboratorio"></a>
## Resumen de cada laboratorio

**1.1 — Cartografía de la IA a tu alrededor.** Clasificar 12 sistemas de IA reales según tres taxonomías: alcance (ANI/AGI/ASI), naturaleza (débil/fuerte) y paradigma (simbólico/basado en datos/híbrido). Incluye `plantilla-clasificacion.md` con la tabla de clasificación.

**1.2 — Entrena tu primer modelo de Machine Learning.** Único laboratorio con notebook del módulo. Ciclo completo de aprendizaje supervisado (datos, features, entrenamiento, validación, inferencia) sobre el dataset "breast cancer" de scikit-learn, con experimentación guiada sobre `TEST_SIZE` y elección de algoritmo (árbol de decisión vs. regresión logística). Notebook verificado: se ejecuta de principio a fin sin errores.

**1.3 — Ingeniería de prompts con un LLM.** Comparación de 5 variantes progresivas de prompt (directo, system prompt, few-shot, chain-of-thought, salida JSON estructurada) sobre una tarea fija de clasificación de reseñas de clientes. Incluye las 5 reseñas de ejemplo y el texto exacto de los 5 prompts, listos para copiar y pegar.

**1.4 — Auditoría de sesgo y riesgo de un caso real.** Caso de estudio de la fintech ficticia "CrediFácil": el alumnado calcula la disparidad real de aprobación de crédito entre barrios a partir de [`caso_scoring_crediticio.csv`](lab-1.4-auditoria-sesgo/caso_scoring_crediticio.csv), identifica el tipo de sesgo (variable proxy), propone una métrica de fairness y clasifica el sistema según los niveles de riesgo del AI Act.

**1.5 — Diseña un caso conceptual de IA (integrador).** Laboratorio de cierre del módulo: cada grupo diseña un caso de aplicación de IA completo para un sector a elección (con 8 problemas de negocio ya redactados como punto de partida), definiendo tipo de sistema, datos, modelo, riesgos y nivel de supervisión humana. Incluye rúbrica de evaluación para la presentación final.

---

**Navegación:** [Índice general de Labs](../README.md) · [Módulo 2 — Fundamentos del Big Data](../02-fundamentos-del-big-data/README.md) ⟶
