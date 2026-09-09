# Machine Learning y Deep Learning

> Módulo 1 · Introducción a la Inteligencia Artificial
>
> **Práctica relacionada:** [Laboratorio 1.2 — Entrena tu primer modelo de Machine Learning](../Labs/01-introduccion-a-la-ia/lab-1.2-primer-modelo-ml/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-1) · ⟵ [Anterior: Definir IA](01-definir-ia.md) · [Siguiente: IA Generativa y LLM →](03-ia-generativa-y-llm.md)

### Relación entre IA, Machine Learning y Deep Learning

Una simplificación útil: IA ⊃ ML ⊃ DL. El Deep Learning es un subconjunto del ML que usa redes neuronales profundas; el ML es un subconjunto de la IA que aprende de datos.

No todo ML es DL, y no todo el campo de la IA usa ML. Conocer estos límites evita confusiones conceptuales frecuentes.

---

### Tipos de Machine Learning

Los paradigmas de ML se distinguen por el tipo de señal de aprendizaje disponible y el objetivo que resuelven. Cada uno aplica a familias de problemas distintas.

- **Supervisado**: aprende de ejemplos etiquetados (input → output conocido). Tareas: clasificación, regresión.
- **No supervisado**: descubre estructura en datos sin etiquetas. Tareas: clustering, reducción dimensional, anomalías.
- **Por refuerzo**: aprende por interacción y recompensas. Tareas: control, juegos, optimización de políticas.
- **Generativo**: aprende la distribución de los datos para generar nuevas muestras. Paradigma complementario al supervisado.

---

### Aprendizaje supervisado

El modelo aprende una función que relaciona variables de entrada (features) con una variable objetivo (target) conocida. El dataset de entrenamiento contiene ejemplos etiquetados de esa relación.

**Componentes clave**
- Features (X): variables de entrada que describen cada observación.
- Target (y): variable que queremos predecir.
- Etiqueta: valor conocido de y para cada ejemplo de entrenamiento.
- Modelo: función f(X) ≈ y aprendida durante el entrenamiento.

**Dos grandes familias de tareas**
- **Clasificación**: output discreto. Ej.: spam/no spam, diagnóstico médico, churn de cliente.
- **Regresión**: output continuo. Ej.: precio de vivienda, temperatura, ventas futuras.

---

### Aprendizaje no supervisado

El objetivo es descubrir estructura latente en los datos sin disponer de una variable objetivo explícita. El sistema organiza, comprime o filtra la información de forma autónoma.

- **Clustering**: agrupa observaciones similares. Ej.: segmentación de clientes, agrupación de documentos.
- **Reducción dimensional**: representa datos de alta dimensión en espacios menores preservando información relevante. Ej.: PCA, t-SNE, UMAP.
- **Detección de anomalías**: identifica observaciones atípicas respecto a la distribución aprendida. Ej.: fraude, fallos industriales.

---

### Aprendizaje por refuerzo

Un agente aprende a tomar decisiones interactuando con un entorno. Recibe señales de recompensa que refuerzan o desalientan comportamientos, construyendo progresivamente una política óptima.

El ciclo de interacción se compone de los siguientes pasos:

- Agente observa Estado.
- Selecciona Acción.
- Entorno da Recompensa.
- Agente actualiza Política.

**Exploración vs. explotación**

El agente debe equilibrar probar acciones nuevas (explorar) con usar lo que ya sabe que funciona (explotar). Este dilema es central en el diseño de algoritmos de RL.

---

### Datos, features y etiquetas

La representación de los datos condiciona lo que el modelo puede aprender. Un buen diseño de features (feature engineering) es tan importante como la elección del algoritmo.

| ID Observación | Feature 1: Edad | Feature 2: Ingresos | Feature 3: Historial | Target / Etiqueta |
| --- | --- | --- | --- | --- |
| Cliente 001 | 34 | 42.000 € | Sin incidencias | Aprobado ✓ |
| Cliente 002 | 28 | 18.000 € | 1 impago | Denegado ✗ |
| Cliente 003 | 51 | 75.000 € | Sin incidencias | Aprobado ✓ |

Cada fila es una observación; cada columna de entrada es una feature; la columna de salida es el target o etiqueta que el modelo aprende a predecir.

---

### Entrenamiento, validación e inferencia

El ciclo de vida de un modelo de ML implica tres fases claramente diferenciadas, con propósitos y datos distintos en cada una.

- **Entrenamiento**: el algoritmo ajusta los parámetros del modelo minimizando el error sobre el conjunto de datos de entrenamiento.
- **Validación**: se evalúa el rendimiento en datos no vistos durante el entrenamiento para seleccionar hiperparámetros y detectar sobreajuste (overfitting).
- **Inferencia**: el modelo ya entrenado procesa nuevos ejemplos en producción para generar predicciones o respuestas.

---

### Función de pérdida y optimización

El aprendizaje de un modelo consiste en ajustar sus parámetros para minimizar una función de pérdida (loss function) que mide el error entre las predicciones y los valores reales.

**Conceptos clave**
- Loss: medida cuantitativa del error del modelo.
- Gradiente: dirección y magnitud del cambio en la pérdida respecto a cada parámetro.
- Optimizador: algoritmo que actualiza parámetros (ej.: SGD, Adam).
- Learning rate: tamaño del paso en cada actualización.

**Intuición geométrica**

Imagina una superficie montañosa donde cada punto representa una configuración de parámetros. El optimizador busca el valle más bajo (mínimo de pérdida) siguiendo la pendiente descendente en cada paso.

Descenso de gradiente estocástico (SGD) y sus variantes (Adam, RMSProp) son los optimizadores más utilizados en la práctica.

---

### Redes neuronales artificiales

Las redes neuronales transforman representaciones de entrada en salidas mediante capas de operaciones lineales y no lineales parametrizadas. Son la base del Deep Learning.

- **Neurona (nodo)**: unidad básica; calcula una suma ponderada de entradas y aplica una función de activación no lineal.
- **Pesos y bias**: parámetros ajustables. Los pesos controlan la importancia de cada entrada; el bias desplaza la activación.
- **Capas**: input → capas ocultas (hidden layers) → output. La profundidad permite aprender representaciones jerárquicas.
- **Activaciones**: funciones no lineales (ReLU, sigmoid, softmax) que permiten aprender relaciones complejas.

---

### Backpropagation

Backpropagation es el algoritmo que permite calcular cómo cada parámetro de la red contribuye al error final, para después actualizarlo en la dirección correcta. El ciclo consta de las siguientes etapas:

- Cálculo de la pérdida.
- Retropropagación.
- Paso adelante.
- Actualización.

Este ciclo se repite miles o millones de veces durante el entrenamiento. Cada iteración (step) sobre un lote de datos se denomina mini-batch, y una pasada completa sobre el dataset es una época (epoch).

---

### Por qué Deep Learning fue disruptivo

El Deep Learning no es solo una mejora incremental: es el resultado de la convergencia simultánea de cuatro factores que desbloquearon el entrenamiento de redes de escala sin precedentes.

- **Hardware (GPU/TPU)**: las GPUs permitieron paralelizar el cómputo matricial. TPUs y aceleradoras especializadas multiplicaron la capacidad de entrenamiento.
- **Datos a escala**: internet, sensores y digitalización generaron volúmenes de datos suficientes para alimentar modelos con millones de parámetros.
- **Frameworks y cloud**: TensorFlow, PyTorch y la computación en la nube democratizaron el acceso a infraestructura de entrenamiento a gran escala.
- **Arquitecturas**: CNNs para visión, RNNs para secuencias y finalmente Transformers redefinieron las posibilidades de representación.
