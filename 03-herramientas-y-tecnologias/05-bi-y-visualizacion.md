# BI y Visualización

> Módulo 3 · Herramientas y Tecnologías para IA y Big Data
>
> **Práctica relacionada:** [Laboratorio 3.5 — Dashboard con Power BI / Looker Studio](../Labs/03-herramientas-y-tecnologias/lab-3.5-dashboard-bi/enunciado.md)

**Navegación:** [Índice general](../README.md) · [Índice del módulo](../README.md#modulo-3) · ⟵ [Anterior: ML, DL y evaluación](04-ml-dl-y-evaluacion.md) · [Siguiente: Cloud y MLOps →](06-cloud-y-mlops.md)

### Visualización de Datos

La visualización es una herramienta transversal en el ciclo del dato: ayuda a explorar datos, detectar problemas de calidad, entender el comportamiento de modelos y comunicar hallazgos a audiencias diversas.

- **Barras y columnas**: comparar valores entre categorías. Efectivos para rankings, comparaciones temporales y proporciones.
- **Líneas y áreas**: evolución temporal de una o varias series. Revelan tendencias, estacionalidades y cambios de patrón.
- **Scatter y burbuja**: relación entre dos variables numéricas. Revelan correlaciones, clusters y outliers en los datos.
- **Histograma y boxplot**: distribución de una variable: forma, asimetría, percentiles y outliers. Esenciales en EDA.
- **Heatmap**: matrices de correlación, tablas de frecuencia o datos con dos dimensiones categóricas. Color como canal de información.

---

### Principios de Visualización

Un buen gráfico responde a una pregunta específica con la menor carga cognitiva posible. Los principios de diseño informacional guían la creación de visualizaciones honestas y efectivas.

- **Codificación adecuada (Encodings)**: usar el canal visual más efectivo para cada tipo de dato: posición > longitud > área > color > ángulo. Escalar correctamente los ejes.
- **Escalas y contexto**: ejes truncados distorsionan la percepción. Incluir siempre referencia (media, objetivo, período anterior) para que el dato tenga significado.
- **Reducir ruido visual**: eliminar elementos decorativos sin información: fondos con gradientes, bordes innecesarios, leyendas duplicadas. Cada píxel debe aportar información (data-ink ratio).
- **Accesibilidad**: paletas accesibles para personas con daltonismo. Texto alternativo. Tamaños de fuente legibles en el medio de destino (pantalla, proyector, papel).
- **Honestidad visual**: no seleccionar el rango de fechas o la muestra que favorece la narrativa deseada. La visualización debe reflejar fielmente los datos, incluyendo incertidumbre.

---

### Power BI

Power BI es la plataforma de Business Intelligence de Microsoft. Integra modelado de datos semántico, medidas calculadas, visualizaciones interactivas y capacidades de distribución y gobernanza empresarial.

- **Semantic Model**: capa de modelado con tablas, relaciones y medidas DAX. Actúa como fuente de verdad única para todos los informes de la organización.
- **Dashboards e Informes**: visualizaciones interactivas con filtros cruzados, segmentadores y drill-down. Publicados en Power BI Service y consumibles desde navegador o app móvil.
- **DAX y Measures**: DAX (Data Analysis Expressions) permite definir métricas calculadas complejas: YTD, comparativas, KPIs dinámicos basados en contexto de filtro.
- **Integración**: conectores nativos con SQL Server, Azure Synapse, Dataverse, Excel, APIs REST, Spark y cientos de fuentes adicionales mediante Power Query.

---

### Tableau

Tableau se centra en la exploración visual interactiva y el análisis ad-hoc. Su filosofía de diseño prioriza la velocidad de descubrimiento: permite a analistas crear visualizaciones sofisticadas mediante arrastrar y soltar, sin necesidad de código.

**Capacidades principales**

- **Visual Analytics**: exploración iterativa de datos mediante drag-and-drop. Facilita el descubrimiento de patrones sin definir la pregunta de antemano.
- **Dashboards interactivos**: múltiples vistas enlazadas con filtros, highlight y acciones entre hojas. Diseño responsivo para diferentes dispositivos.
- **Tableau Prep**: herramienta de preparación y transformación de datos con interfaz visual, integrada con el flujo de trabajo de Tableau Desktop y Server.

**Tableau en el ecosistema moderno**

Tableau forma parte del ecosistema Salesforce desde 2019. Sus capacidades analíticas se extienden con Tableau AI (Einstein Copilot), análisis predictivo integrado y conectividad con plataformas de datos modernas como Snowflake, Databricks y Google BigQuery.

El perfil de usuario objetivo de Tableau es el analista de negocio que necesita exploración avanzada sin depender del equipo de ingeniería para cada consulta.

---

### BI frente a ML: La Escalera Analítica

Business Intelligence y Machine Learning no son competidores: representan niveles diferentes de sofisticación analítica. BI responde a preguntas sobre el pasado; ML puede estimar el futuro o clasificar casos nuevos.

1. **Descriptiva** — ¿Qué ocurrió? KPIs, dashboards, informes. Herramientas: Power BI, Tableau, SQL.
2. **Diagnóstica** — ¿Por qué ocurrió? Análisis de causas raíz, drill-down, segmentación. Herramientas: BI avanzado, análisis exploratorio.
3. **Predictiva** — ¿Qué podría ocurrir? Modelos de clasificación, regresión y series temporales. Herramientas: scikit-learn, XGBoost, DL.
4. **Prescriptiva** — ¿Qué debería hacerse? Optimización, simulación, recomendaciones accionables. Herramientas: OR, RL, sistemas de decisión automatizados.

---
