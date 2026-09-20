# Laboratorio 3.7 (integrador) — Caso conceptual de principio a fin: predicción de churn

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.6): Despliega un modelo simple en la nube](../lab-3.6-despliegue-gradio/enunciado.md)

**Laboratorios relacionados:** [3.1 — Limpieza y exploración de datos con Pandas](../lab-3.1-limpieza-exploracion-pandas/enunciado.md) (metodología de EDA); [3.4 — Clasificación con scikit-learn: de los datos a las métricas](../lab-3.4-clasificacion-scikit-learn/enunciado.md) (metodología de modelado y evaluación); [3.5 — Dashboard con Power BI / Looker Studio](../lab-3.5-dashboard-bi/enunciado.md) (comunicación de resultados a negocio).

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

**Bloque temático:** [`07-casos-conceptuales-y-cierre.md`](../../../03-herramientas-y-tecnologias/07-casos-conceptuales-y-cierre.md)
**Duración orientativa:** 150 minutos
**Modalidad:** individual o en parejas — cierre de módulo
**Herramientas:** Google Colab + pandas + scikit-learn

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Recorrer el pipeline completo de un proyecto de datos — limpieza, modelado, evaluación y comunicación del resultado — replicando el caso conceptual de predicción de churn presentado en el módulo, integrando las técnicas de los laboratorios anteriores en un único proyecto de principio a fin.

<a id="contexto"></a>
## Contexto

Este es el laboratorio de cierre del Módulo 3. El apunte del bloque 7 dedica su apartado inicial, "Caso Conceptual: Predicción de Churn", a mostrar cómo un problema empresarial concreto se traduce en un pipeline de ML clásico, recorriendo las etapas **Problema → Features → Target → Modelo → Métricas**, con tres decisiones que subraya como decisiones de negocio y no puramente técnicas: qué cuenta como churn, qué features construir, y qué umbral de clasificación usar según el coste relativo de cada tipo de error.

Este laboratorio es deliberadamente **integrador**: reutiliza el EDA del laboratorio 3.1, la metodología completa de modelado y evaluación del laboratorio 3.4 (train/test, `Pipeline` con `ColumnTransformer`, matriz de confusión, precision/recall/F1, ajuste de umbral), y añade una pieza nueva — comunicar el resultado a una audiencia no técnica — que conecta con los principios de visualización del laboratorio 3.5. Si habéis completado los laboratorios anteriores del módulo, este os debería resultar familiar en su estructura, aunque el caso de negocio (retención de clientes) sea distinto al de fraude.

<a id="dataset"></a>
## Dataset

`churn_telecom.csv` (en esta misma carpeta), 4.200 clientes de una operadora de telecomunicaciones, con una tasa de churn del 20.4%. Columnas: `customer_id, genero, mayor_65, tiene_pareja, tiene_dependientes, antiguedad_meses, tipo_contrato, facturacion_electronica, metodo_pago, servicio_internet, seguridad_online, soporte_tecnico, streaming_tv, cargo_mensual, cargo_total, num_incidencias_soporte, churn` (variable objetivo, 0/1). En este dataset, `churn=1` significa cancelación explícita del contrato (no inactividad).

<a id="como-usar-el-notebook"></a>
## Cómo usar el notebook

`notebook_3.7.ipynb` contiene todo el código completo, verificado y ejecutado de principio a fin — incluye incluso los tres gráficos de comunicación ya generados como ficheros PNG en esta carpeta, listos para usar en vuestra presentación. Ejecutadlo en Google Colab y prestad especial atención a las celdas Markdown que razonan **por qué** se toma cada decisión (la definición de churn, el umbral final): ese razonamiento es tan parte del entregable como el código en sí.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

1. **Limpieza y exploración de los datos** (30 min). Reutilizando las técnicas del laboratorio 3.1 (`info()`, `describe()`, nulos), explorad el dataset y dejad explícita en una celda Markdown la definición de "churn" que usa este dataset (cancelación explícita del contrato).
2. **Feature engineering** (20 min). Cread al menos una variable derivada además de la antigüedad ya disponible: por ejemplo `cargo_mensual_alto` (booleana sobre la mediana) o un ratio `cargo_total / antiguedad_meses`.
3. **Modelado y evaluación completa** (40 min). Entrenad un modelo de clasificación (Random Forest o regresión logística) dentro de un `Pipeline` con preprocesado, y evaluadlo con matriz de confusión, precision, recall, F1 e importancia de variables (si usáis Random Forest).
4. **Comunicación de resultados** (40 min). Elaborad 2-3 gráficos con matplotlib/seaborn pensados para una audiencia de negocio (no técnica): tasa de churn por tipo de contrato, importancia de variables, distribución de probabilidad de churn. Razonad y justificad un umbral de decisión final por el coste relativo de falsos positivos y falsos negativos.
5. **Presentación de negocio** (20 min, fuera del notebook). Rellenad `plantilla-presentacion-negocio.md` con los hallazgos y la recomendación final, reutilizando los gráficos ya generados.

<a id="entregable"></a>
## Entregable

El notebook completo ejecutado de principio a fin, más una presentación breve (3-5 diapositivas o una página) siguiendo `plantilla-presentacion-negocio.md`, dirigida a público no técnico.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. El apunte menciona features de "ventanas temporales" (uso de los últimos 30 días) que este dataset no incluye, al ser una fotografía estática de cada cliente. Si tuvierais acceso al histórico mes a mes, ¿qué feature de ventana temporal añadiríais primero, y por qué creéis que sería predictiva?
2. Comparad el umbral recomendado en este laboratorio (0.45, para churn) con el del laboratorio 3.4 (0.8, para fraude). ¿Por qué tiene sentido que sean tan distintos, aunque en ambos casos se prioriza el recall?
3. Si tuvierais que presentar el gráfico de distribución de probabilidades a un director comercial sin formación técnica, ¿cómo explicaríais en una frase qué significa que las dos distribuciones se solapen parcialmente?

<a id="cierre"></a>
## Cierre

Este laboratorio integra el ciclo completo visto en el Módulo 3: Python/pandas para explorar y limpiar (bloque 1), SQL como alternativa para consultar datos estructurados (bloque 2), Spark SQL para cuando la escala lo exige (bloque 3), scikit-learn para modelar y evaluar con rigor (bloque 4), y principios de comunicación visual para que el resultado llegue a quien toma las decisiones (bloque 5) — cerrando con el paso a producción y sus implicaciones de negocio (bloques 6 y 7).

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

Resultados reales al ejecutar `notebook_3.7.ipynb` de principio a fin sobre `churn_telecom.csv` (4.200 clientes, sin valores nulos, tasa de churn global del 20,4% — 855 clientes con `churn=1` de 4.200).

**Hallazgos clave:**

- **El tipo de contrato es el factor más determinante**: la tasa de churn es del **28,1%** en contratos "Mes a mes" (2.311 clientes), del 12,2% en contratos de un año (1.058) y solo del **9,1%** en contratos de dos años (831) — los clientes sin permanencia cancelan más de 3 veces más que los de mayor compromiso.
- El soporte técnico también influye, aunque menos: 21,9% de churn sin soporte técnico contratado frente a 18,1% con soporte.
- La variable derivada `cargo_mensual_alto` (booleana sobre la mediana de 65,12 €) confirma la intuición: 26,8% de churn en el grupo de cargo alto frente a 14,0% en el grupo de cargo bajo.
- **Variables más predictivas según la importancia del Random Forest** (top 5): `antiguedad_meses` (27,7%), `cargo_total` (14,8%), `cargo_mensual` (11,6%), `cargo_por_mes_antiguedad` (10,6%) y `tipo_contrato_Mes a mes` (10,0%) — la antigüedad del cliente es, con diferencia, la señal más fuerte, seguida de las variables de facturación y del tipo de contrato.
- **Métricas del modelo en test** (umbral por defecto 0,5): precision 0,415, recall 0,626, F1 0,499, ROC-AUC 0,786. Con el **umbral recomendado de 0,45**: recall 0,701 (detecta el 70,1% de los clientes que realmente cancelan) y precision 0,377, marcando como "en riesgo" al 37,9% de la base de test — un volumen dirigido a una campaña de retención, no un contacto masivo. Se elige este umbral (por debajo del 0,5 por defecto) porque, igual que en el laboratorio 3.4, se prioriza el recall: no detectar a un cliente que se va a ir es más costoso (pérdida de ingresos recurrentes) que contactar de más a uno que no se iba a ir (coste de una llamada u oferta).

**Presentación de negocio (estructura de `plantilla-presentacion-negocio.md`, ya completada con estos datos):**

1. **El problema** — uno de cada cinco clientes cancela su contrato (20,4% de churn); el objetivo es predecir quién tiene mayor riesgo para poder actuar antes.
2. **Hallazgo 1: el tipo de contrato** (`grafico_1_churn_por_contrato.png`) — los clientes "Mes a mes" se van al 28,1%, los de dos años solo al 9,1%; incentivar la migración hacia contratos de permanencia reduciría el churn directamente, sin necesidad de modelo.
3. **Hallazgo 2: qué mira el modelo** (`grafico_2_importancia_variables.png`) — antigüedad, cargo mensual/total y número de incidencias de soporte son las señales más fuertes; un cliente nuevo con factura alta y que ya ha llamado a soporte debería activar una alerta temprana.
4. **Hallazgo 3: calidad de la separación** (`grafico_3_distribucion_probabilidad.png`) — ROC-AUC de 0,786: el modelo no es perfecto (las distribuciones se solapan parcialmente) pero distingue razonablemente bien a quién se va, suficiente para priorizar contactos.
5. **Recomendación** — generar mensualmente una lista de clientes con probabilidad de churn ≥ 0,45 (en torno al 37,9% de la base) para una campaña de retención proactiva, que a ese umbral captura al 70,1% de las cancelaciones reales; pilotar la campaña sobre ese grupo durante un trimestre y medir la reducción de churn frente a un grupo de control.

Los tres gráficos PNG ya están generados en esta carpeta (`grafico_1_churn_por_contrato.png`, `grafico_2_importancia_variables.png`, `grafico_3_distribucion_probabilidad.png`) y la plantilla [`plantilla-presentacion-negocio.md`](./plantilla-presentacion-negocio.md) contiene esta misma estructura ya redactada en detalle, lista para usar como entregable dirigido a público no técnico.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.6): Despliega un modelo simple en la nube](../lab-3.6-despliegue-gradio/enunciado.md)
