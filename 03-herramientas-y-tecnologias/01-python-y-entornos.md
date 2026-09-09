# Python y Entornos

> Módulo 3 · Herramientas y Tecnologías para IA y Big Data
>
> **Práctica relacionada:** [Laboratorio 3.1 — Limpieza y exploración de datos con Pandas](../Labs/03-herramientas-y-tecnologias/lab-3.1-limpieza-exploracion-pandas/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-3) · ⟵ [Anterior: Introducción y objetivos](00-introduccion-y-objetivos.md) · [Siguiente: SQL y NoSQL →](02-sql-y-nosql.md)

### Mapa del Stack Tecnológico

Las herramientas no son intercambiables: cada una ocupa una capa y cumple un propósito específico dentro de la arquitectura. Comprender estas capas evita decisiones de diseño incorrectas.

La pirámide representa la dependencia: las capas superiores se apoyan en las inferiores. Un cambio en infraestructura puede afectar toda la solución; un cambio de librería, solo la capa de modelado.

---

### Python en el Ecosistema de Datos

Python se ha convertido en el lenguaje dominante para análisis, ingeniería de datos, machine learning y aplicaciones de IA. Su éxito radica en una sintaxis legible, un ecosistema maduro y una comunidad activa.

- **Sintaxis expresiva**: permite expresar operaciones complejas de forma legible. Facilita la colaboración entre perfiles técnicos y analíticos.
- **Notebooks interactivos**: Jupyter permite combinar código, resultados y narrativa en un único documento. Estándar en exploración y experimentación.
- **Ecosistema de librerías**: NumPy, Pandas, scikit-learn, PyTorch, TensorFlow y cientos de librerías especializadas disponibles vía pip o conda.
- **Integraciones**: conectores nativos con bases de datos, APIs REST, plataformas cloud y motores como Spark (PySpark).

---

### Entornos de Desarrollo

Un proyecto reproducible requiere no solo código correcto, sino también un entorno bien definido: versiones de librerías controladas, herramientas de colaboración y flujos de trabajo consistentes entre desarrolladores y máquinas.

**Herramientas clave**

- **Jupyter / JupyterLab**: notebooks interactivos para exploración y prototipado.
- **IDEs (VS Code, PyCharm)**: edición avanzada, depuración y refactorización para código productivo.
- **Entornos virtuales**: venv, conda o poetry para aislar dependencias por proyecto.

**Gestión y colaboración**

- **Gestión de paquetes**: pip y conda instalan y resuelven dependencias. requirements.txt o pyproject.toml documentan el entorno.
- **Control de versiones con Git**: indispensable para trabajo en equipo, revisión de cambios y trazabilidad del código. Plataformas: GitHub, GitLab, Azure DevOps.
- **Reproducibilidad**: fijar versiones de dependencias garantiza que el entorno funcione igual en desarrollo, CI/CD y producción.

---

### NumPy: Arrays y Cálculo Numérico

NumPy (Numerical Python) es la base del ecosistema científico de Python. Proporciona el tipo `ndarray` y operaciones vectorizadas que ejecutan cálculo numérico de forma eficiente, aprovechando implementaciones compiladas en C.

- **ndarray**: array N-dimensional homogéneo. Es la estructura central de NumPy y la base sobre la que se construyen Pandas, scikit-learn y los tensores de DL.
- **Shape y dtype**: `shape` describe las dimensiones (p. ej. `(1000, 20)` para 1000 filas y 20 columnas). `dtype` determina el tipo de dato: `float32`, `int64`, etc.
- **Operaciones vectorizadas**: las operaciones se aplican elemento a elemento sin bucles Python explícitos, lo que resulta en código más conciso y mucho más rápido.
- **Broadcasting**: mecanismo que permite operar arrays de formas distintas siguiendo reglas predefinidas. Evita copias innecesarias de datos en memoria.

NumPy es la capa de bajo nivel sobre la que se construyen Pandas, scikit-learn y los tensores de PyTorch/TensorFlow.

---

### Pandas: DataFrames para Análisis Tabular

Pandas ofrece estructuras de datos tabulares de alto nivel sobre NumPy. Es la librería de referencia para cargar, explorar, limpiar y transformar datos antes de modelar o visualizar.

**Estructuras principales**

- **Series**: array unidimensional con índice. Equivale a una columna de una tabla. Soporta tipos heterogéneos por columna.
- **DataFrame**: colección de Series alineadas por un índice común. Es la abstracción central de Pandas: filas, columnas y un índice nombrado.

**Conceptos clave**

- **Index**: identificador de fila. Puede ser numérico, temporal o categórico. Facilita alineación y búsqueda.
- **Columns**: etiquetas de las columnas. Permiten selección expresiva y nombrada.
- **dtypes**: cada columna tiene un tipo: `int64`, `float64`, `object`, `datetime64`, `category`.

---

### Exploración de Datos con Pandas (EDA)

Antes de modelar hay que conocer el dataset en profundidad: su estructura, tipos de datos, presencia de valores faltantes y distribución de las variables. Este proceso se denomina Análisis Exploratorio de Datos (Exploratory Data Analysis, EDA).

- **head() / tail()**: visualizar las primeras o últimas filas del dataset para tener una primera impresión de la estructura y los valores.
- **info()**: muestra tipos de columnas, conteo de valores no nulos y uso de memoria. Primer paso para detectar columnas mal tipadas o con datos faltantes.
- **describe()**: estadísticos descriptivos para columnas numéricas: media, desviación típica, percentiles. Revela rangos, posibles outliers y asimetrías.
- **Distribuciones y conteos**: `value_counts()` para variables categóricas; histogramas o boxplots para numéricas. Detectan desequilibrios y anomalías.

---

### Transformación de Datos

Filtrado, selección, transformación y agregación son las operaciones que convierten datos crudos en información lista para analizar o modelar. Estas operaciones son el núcleo del trabajo diario de un analista o ingeniero de datos.

- **Seleccionar — Select / Assign**: elegir columnas con `[]` o `loc`; crear nuevas variables derivadas con `assign()`.
- **Filtrar — Filter**: seleccionar filas que cumplen una condición booleana. Equivale al `WHERE` de SQL.
- **Transformar — GroupBy**: agrupar por una o varias claves y aplicar funciones de agregación: suma, media, conteo, percentiles.
- **Aggregate**: `agg()` permite aplicar múltiples funciones a distintas columnas en una sola operación.

---

### Combinar Datasets

En proyectos reales, la información relevante rara vez reside en una única tabla. Combinar fuentes mediante claves o concatenación es una tarea habitual en ingeniería de datos y análisis.

- **Concat**: útil para apilar datasets con el mismo esquema (p. ej. datos mensuales) o para añadir nuevas columnas calculadas externamente.
- **Tipos de merge**: Inner (solo filas con clave en ambas tablas), Left/Right (conserva todas las filas del lado indicado), Outer (todas las filas de ambas tablas).
- **Claves y duplicados**: una clave no única puede generar explosión de filas (cartesian product). Verificar unicidad antes de combinar es una buena práctica.

---

### Calidad de Datos en Python

La preparación de datos es, en la mayoría de proyectos, la fase que consume más tiempo. Identificar y tratar problemas de calidad antes del modelado es fundamental para obtener resultados fiables.

**Problemas más frecuentes**

- **Missing values**: valores nulos (NaN). Estrategias: eliminación, imputación por media/mediana/moda o modelos de imputación.
- **Duplicados**: filas repetidas que distorsionan estadísticos y modelos. `duplicated()` y `drop_duplicates()`.
- **Tipos incorrectos**: fechas como texto, números como cadenas. Corregir con `astype()` o `pd.to_datetime()`.
- **Outliers**: valores extremos por error o fenómeno real. Identificar con percentiles, IQR o modelos de detección de anomalías.

**Impacto en modelos**

Los modelos de ML son sensibles a la calidad de los datos de entrada. Datos con ruido, missing values no tratados o features mal codificadas pueden degradar la precisión del modelo más que un algoritmo subóptimo.

"Garbage in, garbage out": la calidad del modelo no puede superar la calidad de los datos.

---

### Feature Engineering

El feature engineering es el proceso de crear representaciones informativas de los datos crudos para mejorar el aprendizaje del modelo. Una buena representación puede ser más valiosa que cambiar de algoritmo.

- **Ratios y combinaciones**: cocientes entre variables (p. ej. ingresos/gasto, clics/impresiones) capturan relaciones que cada variable por separado no expresa.
- **Ventanas temporales**: medias móviles, sumas acumuladas o estadísticos de los últimos N periodos capturan tendencias y patrones de comportamiento.
- **Descomposición de fechas**: extraer día de la semana, mes, hora, festivo o temporada de una fecha puede revelar patrones cíclicos importantes.
- **Encoding de categorías**: one-hot encoding, ordinal encoding o target encoding convierten variables categóricas en representaciones numéricas que los modelos pueden procesar.

---
