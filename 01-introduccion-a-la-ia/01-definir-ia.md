# Definir IA

> Módulo 1 · Introducción a la Inteligencia Artificial
>
> **Práctica relacionada:** [Laboratorio 1.1 — Cartografía de la IA a tu alrededor](../Labs/01-introduccion-a-la-ia/lab-1.1-cartografia-ia/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-1) · ⟵ [Anterior: Introducción y objetivos](00-introduccion-y-objetivos.md) · [Siguiente: Machine Learning y Deep Learning →](02-machine-learning-y-deep-learning.md)

### ¿Qué es la Inteligencia Artificial?

La IA es el campo de la informática dedicado a construir sistemas capaces de realizar tareas asociadas a capacidades que consideramos inteligentes cuando las realiza un ser humano. Estas capacidades pueden agruparse en seis grandes categorías:

- **Percepción**: visión, audio, sensores.
- **Aprendizaje**: patrones a partir de datos.
- **Razonamiento**: inferencia y lógica.
- **Planificación**: secuencias de acciones.
- **Generación**: texto, imagen, código.
- **Decisión**: selección de acciones óptimas.

---

### El concepto de inteligencia en máquinas

Cuando decimos que un sistema "es inteligente", hablamos de comportamiento observable, no de inteligencia general humana. Un sistema puede ser extraordinariamente capaz en una tarea sin poseer ninguna comprensión del mundo.

**Lo que un sistema puede mostrar**
- Capacidad: resolver una tarea específica con alta precisión.
- Rendimiento: superar referencias humanas en dominios concretos.
- Adaptación: ajustarse a variaciones en los datos de entrada.
- Generalización: funcionar en ejemplos no vistos durante el entrenamiento.

**Lo que un sistema no implica**
- Autonomía: operar sin intervención humana constante.
- Comprensión semántica genuina del mundo.
- Capacidad de transferir habilidades a dominios radicalmente distintos.
- Conciencia, intencionalidad o motivación propia.
- Razonamiento causal robusto fuera de la distribución de entrenamiento.

El comportamiento inteligente no implica inteligencia general.

---

### IA: sistema, modelo y aplicación

Un modelo de IA es solo un componente dentro de un sistema mayor. Confundir el modelo con el sistema completo lleva a subestimar los requisitos de implementación real. El sistema se organiza en capas:

- **Tiempo de ejecución**: infraestructura de serving.
- **Modelo**: entrenamiento e inferencia.
- **Núcleo: Datos**: fuentes y calidad.

La infraestructura y el gobierno son dimensiones transversales que afectan a todas las capas del sistema.

---

### IA estrecha, general y superinteligencia

La taxonomía de alcance distingue lo que existe hoy de lo que es especulativo. La mayoría de los sistemas actuales son ANI (Artificial Narrow Intelligence): especializados y altamente eficaces en un dominio concreto.

1. **ANI — IA estrecha**: estado actual. Sistemas especializados: reconocimiento de imagen, traducción, recomendación.
2. **AGI — IA general**: hipotética. Capacidad de generalizar entre dominios como lo haría un ser humano.
3. **ASI — Superinteligencia**: especulativa. Sistema que superaría la capacidad cognitiva humana en todos los ámbitos.

---

### IA débil frente a IA fuerte

Esta distinción filosófica clásica no se refiere a la potencia computacional, sino a la naturaleza de la inteligencia subyacente al sistema.

| Dimensión | IA débil (Weak AI) | IA fuerte (Strong AI) |
| --- | --- | --- |
| Alcance | Una tarea o dominio específico | Cualquier tarea cognitiva humana |
| Comprensión | Simulada, basada en patrones | Genuina (hipotética) |
| Estado actual | Todos los sistemas existentes | No existe; concepto teórico |
| Relación con AGI | Equivalente a ANI | Equivalente a AGI o superior |
| Ejemplo | GPT-5, Claude, Gemini | Ninguno en producción (¿GPT-6 Astra?) |

---

### IA simbólica y sistemas basados en reglas

El paradigma simbólico codifica el conocimiento humano de forma explícita mediante reglas lógicas. Aunque históricamente fue el enfoque dominante, sigue siendo relevante hoy en dominios donde la auditabilidad y el determinismo son críticos.

**Cómo funciona**
- Base de conocimiento: hechos y reglas definidos por expertos.
- Motor de inferencia: aplica reglas IF-THEN sobre los hechos.
- Los sistemas expertos de los años 80 fueron el pico de este paradigma. Hoy se usan en motores de reglas de negocio y compliance.
- Conclusión: resultado determinista y trazable.

**Cuándo es adecuado**
- Dominio bien definido y estable.
- Requisitos de auditabilidad o regulación estricta.
- Escasez de datos etiquetados.
- Necesidad de explicar cada decisión paso a paso.

---

### IA basada en datos

Machine Learning (ML) invierte el paradigma simbólico: en lugar de codificar reglas, el sistema aprende patrones directamente a partir de ejemplos. El conocimiento está implícito en los parámetros del modelo.

- Datos
- Algoritmo
- Modelo
- Inferencia

La calidad y cantidad de los datos de entrenamiento determinan en gran medida el rendimiento del modelo resultante.

---

### IA híbrida

Las soluciones de producción más robustas raramente son "puro ML" o "puras reglas". Combinan múltiples paradigmas según las necesidades de cada componente del sistema.

- **Reglas de negocio**: restricciones deterministas, compliance, límites regulatorios.
- **Machine Learning**: predicción, clasificación, detección de patrones en datos.
- **Conocimiento estructurado**: ontologías, grafos de conocimiento, bases de datos semánticas.
- **Supervisión humana**: revisión, corrección y validación en decisiones de alto impacto.
