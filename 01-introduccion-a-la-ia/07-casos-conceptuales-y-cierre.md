# Casos conceptuales y cierre

> Módulo 1 · Introducción a la Inteligencia Artificial
>
> **Práctica relacionada:** [Laboratorio 1.5 — Diseña un caso conceptual de IA (integrador)](../Labs/01-introduccion-a-la-ia/lab-1.5-diseno-caso-conceptual/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-1) · ⟵ [Anterior: Tendencias 2026](06-tendencias-2026.md) · [Siguiente: Introducción y objetivos →](../02-fundamentos-del-big-data/00-introduccion-y-objetivos.md)

### Caso conceptual: mantenimiento predictivo

Un sistema de mantenimiento predictivo integra IA clásica con datos industriales para anticipar fallos de maquinaria antes de que produzcan paradas no planificadas costosas. El pipeline sigue las etapas:

- Sensores IoT
- Ingesta de Datos
- Ingeniería de Features
- Modelo ML

**Valor del caso**

Esta arquitectura ilustra la integración completa del módulo: datos etiquetados, aprendizaje supervisado, features de ingeniería, inferencia en producción y supervisión humana en el bucle de decisión.

---

### Caso conceptual: asistente documental con RAG

Un asistente basado en RAG permite responder preguntas sobre documentación corporativa actualizada sin depender exclusivamente del conocimiento paramétrico del modelo, y citando las fuentes. El pipeline sigue las etapas:

- Documentos
- Chunking
- Consulta
- Recuperación

**Ventajas sobre LLM puro**
- Respuestas ancladas en fuentes verificables.
- Conocimiento actualizable sin reentrenamiento.
- Trazabilidad: el usuario puede verificar la fuente.

**Consideraciones de diseño**
- Calidad del chunking determina calidad del retrieval.
- El retrieval puede fallar si la pregunta es ambigua.
- Seguridad de acceso: el usuario solo debe ver documentos a los que tiene permiso.

---

### Mapa final de IA

La IA moderna es un sistema complejo e integrado. Estos diez conceptos clave sintetizan el módulo y proporcionan el vocabulario para seguir aprendiendo.

1. **IA = sistema, no solo modelo**. Datos, runtime, aplicación, infraestructura y gobierno son parte del sistema.
2. **ML aprende de datos; DL aprende representaciones jerárquicas**. IA ⊃ ML ⊃ DL es una simplificación válida y útil.
3. **El Transformer cambió el campo**. Todos los LLM y modelos fundacionales modernos derivan de esta arquitectura.
4. **RAG + Agentes = IA con acción y conocimiento**. La IA generativa gana fiabilidad y alcance al conectarse con el mundo real.
5. **Limitaciones y riesgos son reales y gestionables**. Sesgo, alucinaciones, privacidad y seguridad requieren diseño deliberado.
6. **La regulación ya existe y es exigente**. El AI Act europeo establece obligaciones vigentes desde 2025-2026.
7. **La adopción requiere más que tecnología**. Datos, talento, procesos y gobernanza son igualmente críticos.
8. **La frontera avanza: razonamiento, agentes y multimodalidad**. Las capacidades de 2026 superan las de 2023, pero la fiabilidad sigue siendo desigual.
9. **IA no sustituye el juicio humano en decisiones de alto impacto**. Human-in-the-loop, explicabilidad y supervisión son requisitos, no opciones.
10. **IA y Big Data son inseparables**. Los modelos necesitan datos: en volumen, variedad, calidad y velocidad.

---

### Puente hacia Big Data

La IA moderna opera sobre datos. Sin infraestructura de datos escalable, los modelos más sofisticados no pueden desarrollar su potencial. Este es el punto de conexión natural con el siguiente módulo.

- **IA**: modelos, algoritmos y aplicaciones que generan valor a partir de datos.
- **Datos**: volumen, variedad, velocidad y calidad determinan el techo de rendimiento de cualquier sistema de IA.
- **Plataformas**: data lakes, pipelines, almacenes y herramientas de procesamiento que hacen posible la IA a escala.
- **Big Data**: Módulo 2: arquitecturas, herramientas y casos de uso de datos a escala empresarial.

Módulo siguiente: Introducción al Big Data — arquitecturas de datos, plataformas distribuidas, almacenamiento y procesamiento a escala.
