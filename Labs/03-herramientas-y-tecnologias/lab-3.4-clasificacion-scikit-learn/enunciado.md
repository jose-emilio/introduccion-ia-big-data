# Laboratorio 3.4 — Clasificación con scikit-learn: de los datos a las métricas

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.3): Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) · [Laboratorio siguiente (3.5): Dashboard con Power BI / Looker Studio](../lab-3.5-dashboard-bi/enunciado.md) ⟶

**Laboratorios relacionados:** [3.6 — Despliega un modelo simple en la nube](../lab-3.6-despliegue-gradio/enunciado.md) (el modelo entrenado aquí (`modelo_fraude.joblib`) se despliega en ese laboratorio).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Dataset](#dataset)
- [Cómo usar el notebook](#como-usar-el-notebook)
- [Actividades paso a paso](#actividades-paso-a-paso)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Cierre](#cierre)
- [Solución propuesta](#solucion-propuesta)

---

**Bloque temático:** [`04-ml-dl-y-evaluacion.md`](../../../03-herramientas-y-tecnologias/04-ml-dl-y-evaluacion.md)
**Duración orientativa:** 120–150 minutos
**Modalidad:** individual, notebook semi-guiado
**Herramientas:** Google Colab + scikit-learn

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Aplicar el ciclo completo de un problema de clasificación supervisada con evaluación rigurosa: separación train/validation/test, matriz de confusión, precision/recall/F1, ajuste del umbral de decisión y detección de over/underfitting.

<a id="contexto"></a>
## Contexto

El apunte del bloque 4 explica que scikit-learn ofrece una API unificada (`fit`/`predict`/`transform`) para intercambiar algoritmos de clasificación con mínimos cambios de código, e insiste especialmente en un mensaje que es el corazón de este laboratorio: el accuracy puede ser profundamente engañosa con clases desbalanceadas, y elegir la métrica correcta depende del coste relativo de cada tipo de error. La detección de fraude, mencionada explícitamente en el apunte como caso de uso, es el ejemplo perfecto: solo el 1.67% de las transacciones de vuestro dataset son fraudulentas, así que un modelo "tonto" que prediga siempre "no fraude" tendría un accuracy del 98.3% sin detectar ni un solo caso real.

Este laboratorio también recorre los conceptos de train/validation/test, overfitting/underfitting y pipelines de ML con ejercicios prácticos, no solo teóricos: vais a provocar overfitting a propósito para verlo con números reales, y vais a construir un `Pipeline` de scikit-learn que encapsula preprocesado y modelo en un único objeto — el mismo pipeline que el laboratorio 3.6 desplegará como servicio web con Gradio.

<a id="dataset"></a>
## Dataset

`fraude_transacciones.csv` (en esta misma carpeta), 6.000 transacciones con las columnas: `transaccion_id, hora_dia, importe, categoria_comercio, pais_distinto_habitual, dispositivo_nuevo, num_transacciones_24h, antiguedad_cuenta_dias, es_fraude` (variable objetivo, 0/1).

<a id="como-usar-el-notebook"></a>
## Cómo usar el notebook

`notebook_3.4.ipynb` contiene todo el código completo, verificado y con todos los números de las celdas Markdown comprobados de antemano. Es el notebook más largo del módulo — normal, dado que recorre el ciclo entero de un proyecto de ML supervisado — así que os recomendamos reservar tiempo suficiente y no tratar de ejecutarlo todo de una sentada sin leer las explicaciones intermedias: el valor está en entender **por qué** se toma cada decisión (el split en tres partes, el umbral, la regularización), no solo en ver que el código funciona.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

1. **Carga y EDA rápido** (15 min). Cargad el CSV, inspeccionadlo con las técnicas del laboratorio 3.1 y cuantificad el desbalanceo de clases.
2. **Separación train/validation/test** (15 min). Dividid los datos en 60/20/20 con `train_test_split` aplicado dos veces, usando `stratify=y` para mantener la proporción de fraude en los tres conjuntos.
3. **Entrenar dos modelos de complejidad distinta** (30 min). Regresión logística (`class_weight="balanced"`) frente a Random Forest, ambos dentro de un `Pipeline` con un `ColumnTransformer` que escala las variables numéricas y aplica one-hot a `categoria_comercio`.
4. **Matriz de confusión, precision, recall y F1** (30 min). Comparad ambos modelos con `classification_report` y `ConfusionMatrixDisplay`, y razonad qué métrica importa más en este caso de uso (spoiler: el recall, porque un fraude no detectado es mucho más costoso que investigar una transacción legítima por error).
5. **Provocar overfitting deliberadamente** (20 min). Entrenad un Random Forest sin límite de profundidad (`max_depth=None`) y comparad su F1 en train vs. validación frente a la versión regularizada (`max_depth=8`), para ver la caída de generalización con vuestros propios números.
6. **Ajustar el umbral de decisión y evaluar sobre test** (15 min). Exploradlo con una tabla de umbrales sobre validación, elegid uno razonable y evaluad el modelo final, por única vez, sobre el conjunto de test.
7. **Entrenar el modelo final y guardarlo** (10 min). Con `joblib.dump()`, generando `modelo_fraude.joblib` — el fichero que reutilizará el laboratorio 3.6.

<a id="entregable"></a>
## Entregable

El notebook ejecutado de principio a fin, con ambos modelos comparados en una tabla de métricas, la matriz de confusión, la demostración de overfitting, y una recomendación final justificada de qué modelo y qué umbral usar. El fichero `modelo_fraude.joblib` debe quedar generado en esta carpeta.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. En este laboratorio, el modelo más simple (regresión logística) obtuvo mejor recall que el más sofisticado (Random Forest) al umbral por defecto. ¿Qué os dice esto sobre la relación entre "complejidad del modelo" y "buen resultado en un caso de uso concreto"?
2. Si el equipo de fraude solo pudiera revisar manualmente 30 transacciones al día, ¿qué umbral de decisión elegiríais y por qué?
3. `class_weight="balanced"` fue la estrategia usada en este laboratorio para lidiar con el desbalanceo de clases. ¿Qué otras estrategias conocéis o intuís que podrían funcionar?

<a id="cierre"></a>
## Cierre

El modelo guardado en `modelo_fraude.joblib` es la pieza de partida del laboratorio 3.6, donde lo desplegaréis como un mini-servicio web con Gradio. Aseguraos de que el notebook se ha ejecutado completo y de que el fichero `.joblib` está generado antes de continuar.

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

Resultados reales al ejecutar `notebook_3.4.ipynb` de principio a fin sobre `fraude_transacciones.csv` (6.000 transacciones, 1,67% de fraude — 100 de 5.900 no-fraude). Split 60/20/20 estratificado: train 3.600 filas, validación 1.200, test 1.200, manteniendo el 1,67% de fraude en los tres conjuntos.

**Comparativa de métricas (validación, umbral por defecto 0,5):**

| Modelo | Precision (fraude) | Recall (fraude) | F1 (fraude) | Accuracy |
| --- | --- | --- | --- | --- |
| Regresión logística (`class_weight="balanced"`) | 0,055 | 0,650 | 0,102 | 0,809 |
| Random Forest (`max_depth=8`) | 0,077 | 0,050 | 0,061 | 0,974 |

A umbral 0,5 la regresión logística tiene mucho mejor recall (0,650 frente a 0,050): el Random Forest, aunque tiene mayor accuracy global (0,974 frente a 0,809), detecta prácticamente ningún fraude real — el caso de libro de por qué el accuracy es una métrica engañosa con clases desbalanceadas.

**Evidencia de overfitting** (F1 de la clase fraude en train vs. validación):

| Modelo | F1 train | F1 validación | Caída |
| --- | --- | --- | --- |
| RF `max_depth=8` (regularizado) | 0,803 | 0,061 | 0,742 |
| RF `max_depth=None` (sin regularizar) | 1,000 | 0,000 | 1,000 |

El Random Forest sin límite de profundidad memoriza perfectamente el train (F1 = 1,000, literalmente identifica las 100 transacciones fraudulentas de entrenamiento una por una) pero generaliza peor que la versión regularizada en validación (F1 = 0,000 frente a 0,061): un caso claro de overfitting severo, agravado aquí por lo poco representadas que están las 100 transacciones fraudulentas del train.

**Tabla de umbrales (regresión logística, validación)** — fragmento relevante:

| Umbral | Precision | Recall | F1 | % marcado para revisión |
| --- | --- | --- | --- | --- |
| 0,5 | 0,055 | 0,65 | 0,102 | 19,6% |
| 0,7 | 0,066 | 0,45 | 0,115 | 11,4% |
| **0,8** | **0,107** | **0,45** | **0,173** | **7,0%** |
| 0,9 | 0,237 | 0,45 | 0,310 | 3,2% |

**Evaluación final sobre test, umbral = 0,8 (regresión logística):** precision 0,150, recall 0,600, F1 0,240, ROC-AUC 0,898. El 6,7% de las transacciones del test quedan marcadas para revisión manual.

**Recomendación final:** se recomienda la **regresión logística con `class_weight="balanced"`**, no el Random Forest, porque en este caso de uso (fraude, donde un falso negativo es mucho más costoso que revisar una transacción legítima de más) el recall importa más que el accuracy o la precision, y la regresión logística lo mantiene sistemáticamente más alto en todos los umbrales probados. Dentro de esa regresión logística, se recomienda el **umbral 0,8**: en test detecta el 60% de los fraudes reales (recall 0,600) marcando solo el 6,7% del total de transacciones para revisión manual — un compromiso razonable entre no dejar pasar demasiado fraude y no saturar al equipo de revisión con falsos positivos. Verificación puntual sobre un ejemplo de cada clase: probabilidad de fraude de 0,109 en una transacción normal y de 0,998 en una transacción con señales claras de fraude (importe alto, de madrugada, dispositivo nuevo y país distinto al habitual) — el modelo separa correctamente ambos casos extremos.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.3): Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) · [Laboratorio siguiente (3.5): Dashboard con Power BI / Looker Studio](../lab-3.5-dashboard-bi/enunciado.md) ⟶
