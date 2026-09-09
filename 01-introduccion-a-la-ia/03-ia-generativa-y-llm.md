# IA Generativa y LLM

> Módulo 1 · Introducción a la Inteligencia Artificial
>
> **Práctica relacionada:** [Laboratorio 1.3 — Ingeniería de prompts con un LLM](../Labs/01-introduccion-a-la-ia/lab-1.3-ingenieria-prompts/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-1) · ⟵ [Anterior: Machine Learning y Deep Learning](02-machine-learning-y-deep-learning.md) · [Siguiente: Aplicaciones sectoriales →](04-aplicaciones-sectoriales.md)

### Hitos de IA: 1950–1990

La historia de la IA es la historia de paradigmas que se suceden, con períodos de entusiasmo (AI summers) seguidos de decepción y recorte de financiación (AI winters).

1. **1950 — Test de Turing**: Alan Turing propone una definición operativa de inteligencia máquina basada en la imitación del comportamiento humano.
2. **1956 — Dartmouth**: conferencia fundacional. John McCarthy acuña el término "Artificial Intelligence". Nace el campo como disciplina.
3. **1958 — Perceptrón**: Frank Rosenblatt introduce el perceptrón, primer modelo de aprendizaje automático con base neuronal.
4. **1970s-80s — Sistemas expertos**: MYCIN, DENDRAL y otros sistemas basados en reglas dominan la IA aplicada en medicina y química.
5. **1987-1993 — AI Winter**: limitaciones de los sistemas expertos y recorte de financiación. El campo reorienta sus expectativas.

---

### Hitos de IA: 1997–2016

Tres hitos simbólicos marcan el salto de capacidad especializada: del ajedrez al lenguaje, y del lenguaje al juego de estrategia más complejo jamás dominado por una máquina.

1. **1997 — Deep Blue**: el sistema de IBM derrota al campeón mundial de ajedrez Garry Kasparov. IA simbólica y búsqueda especializada en su apogeo.
2. **2011 — Watson**: IBM Watson gana en Jeopardy! combinando NLP, recuperación de información y razonamiento estadístico.
3. **2012 — AlexNet**: la CNN de Hinton gana ImageNet con una ventaja de más de 10 puntos porcentuales. El Deep Learning irrumpe en visión artificial.
4. **2016 — AlphaGo**: DeepMind derrota al campeón mundial de Go, Lee Sedol. Combinación de redes neuronales y aprendizaje por refuerzo.

---

### 2017: el Transformer

El artículo "Attention Is All You Need" (Vaswani et al., 2017) introdujo la arquitectura Transformer, que sustituyó las redes recurrentes y se convirtió en la base de todos los grandes modelos de lenguaje modernos.

**Innovaciones clave**
- Self-attention: cada token puede atender a todos los demás tokens del contexto simultáneamente.
- Multi-head attention: múltiples cabezas de atención en paralelo capturan distintos tipos de relaciones.

**Impacto arquitectónico**
- Paralelización: elimina la dependencia secuencial de las RNNs, acelerando drásticamente el entrenamiento.
- Escalabilidad: el rendimiento mejora de forma predecible al aumentar datos y parámetros.

El Transformer no solo transformó el NLP: su arquitectura se ha extendido a visión (ViT), audio, biología molecular (AlphaFold 2) y modelos multimodales.

GPT, BERT, T5, LLaMA, Gemini y prácticamente todos los modelos fundacionales modernos son variantes del Transformer original.

---

### Del NLP clásico a los LLM

El procesamiento del lenguaje natural ha recorrido un camino de décadas desde las reglas manuales hasta los modelos de miles de millones de parámetros entrenados en texto a escala de internet.

- **Reglas manuales**: gramáticas, diccionarios, expresiones regulares. Frágiles ante lenguaje no previsto.
- **Bag-of-words**: representación estadística de términos. TF-IDF, Naive Bayes. Ignora el orden y el contexto.
- **Embeddings**: Word2Vec, GloVe. Representaciones densas que capturan semántica. Contexto estático por palabra.
- **Transformers**: BERT, GPT-2. Contexto dinámico. Preentrenamiento + fine-tuning en tareas específicas.
- **LLM**: GPT, Claude, Gemini, LLaMA en sus versiones más recientes. Capacidades emergentes: razonamiento, código, instrucciones complejas.

---

### Qué es un modelo fundacional

Un modelo fundacional (foundation model) se entrena a enorme escala sobre datos generales y luego puede adaptarse a múltiples tareas y aplicaciones sin necesidad de reentrenamiento completo.

- **Modelo base**: preentrenado en datos masivos: texto, código, imágenes, audio.
- **Prompting**: adaptación sin modificar pesos mediante instrucciones en lenguaje natural.
- **RAG**: conexión con conocimiento externo en tiempo de inferencia.
- **Fine-tuning**: ajuste de parámetros sobre datos de dominio específico.
- **Múltiples aplicaciones**: un único modelo base sirve para docenas de casos de uso distintos.

---

### Large Language Models (LLMs)

Los LLM aprenden representaciones estadísticas profundas del lenguaje y generan secuencias de texto condicionadas por el contexto de entrada. Su escala los diferencia cualitativamente de modelos anteriores.

**Arquitectura y escala**
- Tokens: unidades de texto (palabras o subpalabras) que el modelo procesa.
- Parámetros: miles de millones de pesos que codifican el conocimiento aprendido.
- Context window: cantidad máxima de tokens que el modelo puede "ver" a la vez.
- Pretraining: entrenamiento en predicción del siguiente token sobre billones de tokens.

**Capacidades emergentes**
- Generación de texto coherente y fluido en múltiples idiomas.
- Razonamiento paso a paso (chain-of-thought).
- Escritura y análisis de código.
- Traducción, resumen y extracción de información.
- Seguimiento de instrucciones complejas.

---

### Tokens, embeddings y contexto

Antes de procesar lenguaje, los modelos convierten el texto en representaciones numéricas que permiten operar sobre relaciones semánticas y sintácticas aprendidas durante el preentrenamiento. El proceso sigue el flujo: **Texto → Tokenización → Embeddings**.

El embedding de un token no es fijo: cambia según el contexto (contextual embeddings). La misma palabra "banco" tendrá representaciones distintas en "banco financiero" y "banco en el parque".

---

### Cómo se genera una respuesta

Los LLM generan texto de forma autorregresiva: producen un token a la vez, cada uno condicionado por todos los tokens anteriores. La estrategia de decodificación controla creatividad y coherencia.

**Pipeline de generación**
1. El modelo recibe el prompt tokenizado.
2. Calcula logits: puntuación para cada posible token siguiente.
3. Aplica softmax para obtener distribución de probabilidades.
4. La estrategia de decoding selecciona el token (greedy, top-p, temperatura).
5. El token se añade al contexto y se repite el proceso.

**Parámetros de generación**
- Temperatura: controla aleatoriedad. Valores bajos = más determinista; altos = más creativo.
- Top-p (nucleus sampling): limita el conjunto de tokens candidatos al p% de masa de probabilidad acumulada.
- Top-k: restringe la selección a los k tokens más probables.
- Max tokens: longitud máxima de la respuesta generada.

---

### IA generativa

La IA generativa (Generative AI) produce contenido nuevo y original a partir de patrones aprendidos en los datos de entrenamiento. A diferencia de la IA discriminativa, no clasifica: crea.

- **Texto**: artículos, resúmenes, código, diálogos, traducciones.
- **Imagen**: fotografías sintéticas, ilustraciones, diseño gráfico.
- **Audio**: voz sintética, música, efectos de sonido.
- **Vídeo**: clips sintéticos, animación, edición automatizada.
- **Código**: generación, refactorización, documentación y testing automatizado.

---

### Modelos de difusión

Los modelos de difusión (diffusion models) son la arquitectura dominante en generación de imágenes de alta calidad. Aprenden a revertir un proceso de añadir ruido hasta recuperar una imagen coherente.

El proceso de generación recorre las siguientes etapas:
- **Ruido aleatorio**: imagen de ruido gaussiano puro.
- **Desruido 1**: el modelo empieza a revelar estructura.
- **Desruido N**: formas y detalles emergen.
- **Imagen final**: salida fotorealista o artística condicionada.

**Proceso de entrenamiento**

Se corrompen imágenes reales añadiendo ruido progresivamente. La red aprende a predecir y eliminar ese ruido en cada paso.

**Modelos destacados**

Stable Diffusion, DALL·E, Midjourney e Imagen (Google) son ejemplos representativos de esta arquitectura, a menudo guiados por texto mediante text conditioning.

---

### IA multimodal

Los sistemas multimodales modernos pueden procesar y generar combinaciones de texto, imagen, audio y vídeo en una única arquitectura, superando la barrera de modalidad única.

**Modelo multimodal**: núcleo integrado que procesa y relaciona múltiples tipos de señal.

- **Texto**: instrucciones, preguntas, documentos en lenguaje natural.
- **Imagen**: fotografías, capturas, diagramas, documentos escaneados.
- **Audio**: voz, música, señales de audio en tiempo real.
- **Vídeo**: secuencias temporales, análisis de escenas en movimiento.

---

### RAG: modelos conectados a conocimiento externo

Retrieval-Augmented Generation combina un sistema de recuperación de información con un LLM generativo, permitiendo responder sobre documentación actualizada sin reentrenar el modelo. El pipeline consta de las siguientes etapas:

- Ingesta
- Chunking
- Embeddings
- Recuperación

RAG puede reducir las alucinaciones al anclar las respuestas en fuentes verificables recuperadas en tiempo real. Es especialmente útil para conocimiento corporativo o normativo actualizable.

---

### Prompting y context engineering

La calidad de la interacción con un LLM depende en gran medida de cómo se estructura el contexto que recibe. El prompt no es solo una pregunta: es la arquitectura de la interacción.

**Componentes del prompt**
- System prompt: instrucciones globales de comportamiento y rol.
- Contexto: información relevante para la tarea (documentos, historial).
- Ejemplos: demostraciones del formato o estilo esperado (few-shot).
- Restricciones: limitaciones de formato, longitud o contenido.
- Structured output: instrucciones para obtener JSON, XML u otros formatos.

**Técnicas avanzadas**
- Chain-of-Thought: pedir razonamiento paso a paso mejora resultados en tareas complejas.
- Few-shot: incluir ejemplos en el prompt guía el formato y el estilo de respuesta.

---

### Fine-tuning y adaptación

Existen tres estrategias principales para adaptar un modelo fundacional a una tarea específica. La elección depende del coste, los datos disponibles y el nivel de especialización requerido.

| Dimensión | Prompting | RAG | Fine-tuning |
| --- | --- | --- | --- |
| ¿Modifica pesos? | No | No | Sí |
| Coste | Muy bajo | Medio | Alto |
| Conocimiento actualizable | Manual | Sí, dinámico | No (requiere reentrenamiento) |
| Especialización | Baja-media | Media (sobre conocimiento) | Alta (estilo, dominio, formato) |
| Cuándo usarlo | Primera aproximación, prototipado | Documentación corporativa viva | Tono, formato específico, dominio cerrado |

---

### Agentes de IA

Un agente de IA es un sistema que combina un modelo de lenguaje con herramientas, memoria, planificación y capacidad de ejecutar acciones en entornos reales para completar tareas de forma autónoma. Su ciclo de funcionamiento sigue las etapas:

- Meta
- Planificador
- Selección
- Ejecución
- Observación

**Diferencia clave con un chatbot**

Un chatbot responde; un agente actúa. Los agentes pueden encadenar múltiples pasos, usar herramientas, corregir errores y persistir estado entre interacciones.

---

### IA basada en herramientas

El tool use permite a un modelo de lenguaje invocar funciones externas, ampliar sus capacidades más allá del texto y acceder a información o acciones del mundo real con validación controlada.

- **Búsqueda web**: el modelo consulta motores de búsqueda en tiempo real para acceder a información actualizada fuera de su conocimiento paramétrico.
- **Bases de datos**: consultas a sistemas estructurados (SQL, NoSQL) para recuperar datos específicos de negocio.
- **APIs externas**: integración con servicios: calendarios, CRM, ERPs, plataformas de pagos o sistemas de monitorización.
- **Ejecución de código**: el modelo genera y ejecuta código (Python, SQL) para cálculos, análisis o automatizaciones verificables.

Permisos, validación de entradas y auditoría de invocaciones son controles esenciales en sistemas con tool use en producción.
