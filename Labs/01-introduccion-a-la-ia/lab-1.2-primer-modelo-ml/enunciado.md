# Laboratorio 1.2 — Entrena tu primer modelo de Machine Learning

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.1): Cartografía de la IA a tu alrededor](../lab-1.1-cartografia-ia/enunciado.md) · [Laboratorio siguiente (1.3): Ingeniería de prompts con un LLM](../lab-1.3-ingenieria-prompts/enunciado.md) ⟶

## Índice

- [Cabecera](#cabecera)
- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [Fase 1 — Carga y exploración de los datos (15-20 min)](#fase-1-carga-y-exploracion-de-los-datos-15-20-min)
  - [Fase 2 — Selección de features y partición train/test (15-20 min)](#fase-2-seleccion-de-features-y-particion-traintest-15-20-min)
  - [Fase 3 — Entrenamiento y evaluación con los valores por defecto (20-25 min)](#fase-3-entrenamiento-y-evaluacion-con-los-valores-por-defecto-20-25-min)
  - [Fase 4 — Experimentación guiada (25-35 min)](#fase-4-experimentacion-guiada-25-35-min)
  - [Fase 5 — Conclusión escrita (10-15 min)](#fase-5-conclusion-escrita-10-15-min)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)
  - [Resultado con la configuración por defecto (`TEST_SIZE = 0.2`, `MODELO = "arbol"`)](#resultado-con-la-configuracion-por-defecto-testsize-02-modelo-arbol)
  - [Efecto de cambiar `TEST_SIZE` (manteniendo `MODELO = "arbol"`)](#efecto-de-cambiar-testsize-manteniendo-modelo-arbol)
  - [Efecto de cambiar `MODELO` (con `TEST_SIZE = 0.2`)](#efecto-de-cambiar-modelo-con-testsize-02)
  - [Mejor combinación para recall (pregunta de reflexión 1)](#mejor-combinacion-para-recall-pregunta-de-reflexion-1)
  - [Ejemplo de conclusión redactada (celda final)](#ejemplo-de-conclusion-redactada-celda-final)

---

<a id="cabecera"></a>
## Cabecera

- **Bloque temático**: [`02-machine-learning-y-deep-learning.md`](../../../01-introduccion-a-la-ia/02-machine-learning-y-deep-learning.md).
- **Duración estimada**: 90–120 minutos.
- **Modalidad**: individual.
- **Herramientas necesarias**: un entorno de notebook con Python (Google Colab es la opción más sencilla porque no requiere instalación; también funciona en Jupyter local o en cualquier entorno con `pandas`, `numpy`, `scikit-learn` y `matplotlib` instalados). El notebook [`notebook_1.2.ipynb`](notebook_1.2.ipynb) ya contiene todo el código necesario.

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Al terminar este laboratorio, el alumnado será capaz de recorrer el ciclo completo de un proyecto de aprendizaje supervisado —datos, features, entrenamiento, validación e inferencia— sin necesidad de dominar Python a fondo, y de observar en directo, mediante experimentación guiada, el efecto que tiene el tamaño del conjunto de validación sobre el fenómeno de overfitting.

<a id="contexto"></a>
## Contexto

El apunte describe los componentes de un problema de aprendizaje supervisado: features (X), target (y), el papel del conjunto de entrenamiento frente al de validación, y las tres fases del ciclo de vida de un modelo (entrenamiento, validación e inferencia). Este laboratorio materializa esos conceptos con un caso real: predecir si un tumor es maligno o benigno a partir de un conjunto de medidas del núcleo celular, un problema clásico de clasificación binaria.

No necesitas escribir código desde cero: el notebook ya está completo y funciona de principio a fin ejecutando las celdas en orden, con valores por defecto ya elegidos. Tu trabajo consiste en **ejecutar, observar, modificar unos pocos parámetros señalados con claridad, y volver a ejecutar** — exactamente el tipo de iteración experimental con la que trabaja cualquier equipo de datos al ajustar un modelo. El objetivo no es que memorices sintaxis de `scikit-learn`, sino que vivencies con tus propias manos por qué el tamaño del conjunto de validación y la elección de algoritmo afectan al resultado final, conectando con las ideas de overfitting/underfitting y de "función de pérdida y optimización".

El dataset utilizado (`breast cancer`, incluido en scikit-learn) es un conjunto de datos real y de acceso público, ya preparado para uso educativo: no requiere descargar ningún fichero externo ni conexión a internet más allá de abrir el propio notebook, y funciona exactamente igual en Google Colab que en cualquier otro entorno.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="fase-1-carga-y-exploracion-de-los-datos-15-20-min"></a>
### Fase 1 — Carga y exploración de los datos (15-20 min)

1. Abre `notebook_1.2.ipynb` y ejecuta las celdas en orden, empezando por la carga de librerías y del dataset.
2. Observa cómo se cargan los datos con `load_breast_cancer(as_frame=True)` y cómo `pandas` los organiza en una tabla (DataFrame). Fíjate en cuántas observaciones (filas) y cuántas variables (columnas) tiene el dataset completo, y en cómo se distribuye la variable objetivo (maligno/benigno).

<a id="fase-2-seleccion-de-features-y-particion-traintest-15-20-min"></a>
### Fase 2 — Selección de features y partición train/test (15-20 min)

3. Ejecuta la celda de selección de columnas: el notebook ya usa un subconjunto legible de 6-8 medidas (en vez de las 30 disponibles) para que puedas interpretar con sentido cada feature.
4. Ejecuta la celda de partición train/test. Fíjate en la variable `TEST_SIZE`, que controla qué porcentaje de los datos se reserva para validar el modelo en vez de para entrenarlo.

<a id="fase-3-entrenamiento-y-evaluacion-con-los-valores-por-defecto-20-25-min"></a>
### Fase 3 — Entrenamiento y evaluación con los valores por defecto (20-25 min)

5. Ejecuta la celda de elección de algoritmo. Observa la variable `MODELO`, que puede valer `"arbol"` (árbol de decisión) o `"logistica"` (regresión logística), y cómo el código usa esa variable para instanciar uno u otro modelo.
6. Ejecuta la celda de entrenamiento (`.fit(...)`) y la celda de evaluación, que genera la matriz de confusión y calcula accuracy, precision y recall con una función ya escrita.
7. Interpreta el resultado: ¿cuántos tumores malignos identificó correctamente el modelo? ¿Cuántos falsos negativos hubo (tumores malignos clasificados como benignos)? En un contexto médico real, ¿por qué ese tipo de error es especialmente importante de vigilar?

<a id="fase-4-experimentacion-guiada-25-35-min"></a>
### Fase 4 — Experimentación guiada (25-35 min)

8. Vuelve a la celda de `TEST_SIZE` y cámbialo a un valor bajo, por ejemplo `0.1` (10% de los datos para validar). Vuelve a ejecutar, en orden, todas las celdas desde la partición train/test hasta la evaluación. Anota accuracy, precision y recall.
9. Repite con un valor alto, por ejemplo `0.5` (50% de los datos para validar). Vuelve a ejecutar y anota los resultados.
10. Ahora cambia `MODELO` a la otra opción (`"arbol"` si tenías `"logistica"`, o viceversa) manteniendo `TEST_SIZE = 0.2`, y compara.
11. Si te queda tiempo, combina cambios: prueba `TEST_SIZE` bajo con el otro modelo, y `TEST_SIZE` alto con el modelo original.

<a id="fase-5-conclusion-escrita-10-15-min"></a>
### Fase 5 — Conclusión escrita (10-15 min)

12. Completa la celda Markdown final del notebook, titulada "## Tu conclusión (escribe aquí)", respondiendo a las preguntas guía que contiene sobre cómo cambiaron las métricas y qué relación observas con overfitting/underfitting.

<a id="entregable"></a>
## Entregable

El notebook `notebook_1.2.ipynb` ejecutado de principio a fin (todas las celdas con su salida visible) junto con la celda de conclusión final completada con 3-4 líneas de texto propio.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. ¿Con qué combinación de `TEST_SIZE` y `MODELO` obtuviste el mejor recall (menos falsos negativos)? ¿Por qué crees que en un problema de diagnóstico médico el recall puede ser más importante que el accuracy global?
2. Cuando usaste un `TEST_SIZE` muy alto (por ejemplo, 0.5), ¿qué le pasó al conjunto de entrenamiento? ¿Cómo relacionas eso con la idea de que un modelo necesita "suficientes" ejemplos para aprender bien (idea recogida en el apunte `01-definir-ia.md`: "la calidad y cantidad de los datos de entrenamiento determinan en gran medida el rendimiento")?
3. Si tuvieras que explicarle a alguien sin conocimientos técnicos qué diferencia hay entre el conjunto de entrenamiento y el de validación, ¿qué analogía usarías?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

El propio `notebook_1.2.ipynb` ya contiene el código completo y es, por tanto, la parte principal de la solución: no hay nada que "programar" aparte. Esta sección resume los **resultados esperados** al ejecutarlo (obtenidos ejecutando el notebook de verdad, con semilla fija `SEMILLA = 42`, por lo que deberías obtener exactamente los mismos números) y cómo interpretarlos, para que puedas comparar tu ejecución con la de referencia.

<a id="resultado-con-la-configuracion-por-defecto-testsize-02-modelo-arbol"></a>
### Resultado con la configuración por defecto (`TEST_SIZE = 0.2`, `MODELO = "arbol"`)

- Dataset: 569 observaciones, 8 features seleccionadas, partición de 455 ejemplos de entrenamiento y 114 de validación.
- **Accuracy: 0,930** — Precision (clase "maligno"): **0,854** — Recall (clase "maligno"): **0,976**.
- Interpretación clínica: con un recall de 0,976 sobre la clase maligna, el modelo solo deja escapar una pequeña fracción de los tumores malignos como falsos negativos, que es precisamente el tipo de error más grave en un contexto de diagnóstico (un falso negativo retrasa un tratamiento necesario; un falso positivo "solo" genera una prueba adicional). La precision más baja (0,854) indica que el modelo es algo más permisivo clasificando como maligno, lo cual en este contexto es el compromiso deseable.

<a id="efecto-de-cambiar-testsize-manteniendo-modelo-arbol"></a>
### Efecto de cambiar `TEST_SIZE` (manteniendo `MODELO = "arbol"`)

| TEST_SIZE | n_train | n_test | Accuracy | Precision (maligno) | Recall (maligno) |
| --- | --- | --- | --- | --- | --- |
| 0,1 | 512 | 57 | 0,965 | 0,952 | 0,952 |
| 0,2 (por defecto) | 455 | 114 | 0,930 | 0,854 | 0,976 |
| 0,5 | 284 | 285 | 0,954 | 0,927 | 0,953 |

Con `TEST_SIZE = 0.1` el modelo dispone de más ejemplos para entrenar (512) y el conjunto de validación es muy pequeño (57 ejemplos): las métricas se ven muy bien, pero cada ejemplo mal clasificado pesa casi un 1,8 % sobre el resultado, así que la medición es menos fiable estadísticamente (alta varianza con pocos datos de validación). Con `TEST_SIZE = 0.5`, el modelo se entrena con menos de la mitad de los datos originales (284 ejemplos) — aun así, en este dataset concreto (bastante separable) el accuracy se mantiene alto, aunque ya es una señal de alerta: en datasets más difíciles o más pequeños, reducir tanto el conjunto de entrenamiento sí deteriora claramente el aprendizaje. La lección clave no es que las métricas suban o bajen de forma perfectamente lineal con `TEST_SIZE` (con pocos datos de test, hay ruido), sino que existe un compromiso real entre "más datos para entrenar mejor" y "más datos para medir con más confianza".

<a id="efecto-de-cambiar-modelo-con-testsize-02"></a>
### Efecto de cambiar `MODELO` (con `TEST_SIZE = 0.2`)

| MODELO | Accuracy | Precision (maligno) | Recall (maligno) |
| --- | --- | --- | --- |
| Árbol de decisión (por defecto) | 0,930 | 0,854 | 0,976 |
| Regresión logística | 0,912 | 0,848 | 0,929 |

En esta configuración concreta, el árbol de decisión iguala o supera a la regresión logística en las tres métricas, y en particular tiene mejor recall (0,976 frente a 0,929): detecta una proporción mayor de los tumores malignos reales. Esto no es una regla general ("los árboles siempre ganan a la regresión logística"), sino el resultado observado con estas 8 features, esta partición y esta semilla concretas — precisamente el tipo de comparación empírica que hay que hacer en cada proyecto real en lugar de asumir de antemano qué algoritmo es "mejor".

<a id="mejor-combinacion-para-recall-pregunta-de-reflexion-1"></a>
### Mejor combinación para recall (pregunta de reflexión 1)

De las seis combinaciones posibles, la que obtiene el recall más alto sobre la clase maligna es **árbol de decisión con `TEST_SIZE = 0.2`** (recall = 0,976), seguida muy de cerca por árbol con `TEST_SIZE = 0.5` (0,953) y con `TEST_SIZE = 0.1` (0,952). El recall importa más que el accuracy global en diagnóstico médico porque un falso negativo (un tumor maligno clasificado como benigno) puede significar que un paciente no reciba tratamiento a tiempo, mientras que un falso positivo solo implica una prueba de confirmación adicional: los dos tipos de error no tienen el mismo coste.

<a id="ejemplo-de-conclusion-redactada-celda-final"></a>
### Ejemplo de conclusión redactada (celda final)

> "Al reducir `TEST_SIZE` a 0.1 el modelo entrena con más datos (512 ejemplos) y el accuracy sube a 0.965, pero el conjunto de validación (57 ejemplos) es tan pequeño que cada error pesa mucho en la métrica, así que esa mejora hay que tomarla con cautela. Al subirlo a 0.5 el modelo entrena con poco más de la mitad de los datos originales y el rendimiento se mantiene sorprendentemente alto en este dataset, aunque en uno más difícil probablemente habría bajado más: hay un equilibrio entre dejar suficientes datos para entrenar y suficientes para medir con fiabilidad. Cambiando de árbol de decisión a regresión logística con `TEST_SIZE = 0.2`, el recall sobre la clase maligna bajó de 0.976 a 0.929, es decir, el árbol detectó una proporción mayor de los tumores malignos reales en esta prueba. En un contexto médico real priorizaría el recall sobre el accuracy, y repetiría el experimento con más semillas distintas antes de confiar en una sola comparación."

Si tus números exactos difieren ligeramente de los de esta tabla, revisa que no hayas cambiado `SEMILLA`, el conjunto `FEATURES`, o que hayas ejecutado todas las celdas intermedias en orden tras modificar `TEST_SIZE` o `MODELO` (un error frecuente es cambiar la variable pero no volver a ejecutar la celda de partición train/test y la de entrenamiento antes de leer la evaluación).


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (1.1): Cartografía de la IA a tu alrededor](../lab-1.1-cartografia-ia/enunciado.md) · [Laboratorio siguiente (1.3): Ingeniería de prompts con un LLM](../lab-1.3-ingenieria-prompts/enunciado.md) ⟶
