# Laboratorio 3.5 — Dashboard con Power BI / Looker Studio

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.4): Clasificación con scikit-learn: de los datos a las métricas](../lab-3.4-clasificacion-scikit-learn/enunciado.md) · [Laboratorio siguiente (3.6): Despliega un modelo simple en la nube](../lab-3.6-despliegue-gradio/enunciado.md) ⟶

**Laboratorios relacionados:** [3.1 — Limpieza y exploración de datos con Pandas](../lab-3.1-limpieza-exploracion-pandas/enunciado.md) (mismo dataset de ventas); [3.3 — Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) (mismo dataset de ventas).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Dataset](#dataset)
- [Qué construir: consultad `preguntas-de-negocio-y-graficos.md`](#que-construir-consultad-preguntas-de-negocio-y-graficosmd)
- [Instrucciones paso a paso — Google Looker Studio (sin instalación)](#instrucciones-paso-a-paso-google-looker-studio-sin-instalacion)
- [Instrucciones paso a paso — Power BI Desktop](#instrucciones-paso-a-paso-power-bi-desktop)
- [Actividades paso a paso (resumen)](#actividades-paso-a-paso-resumen)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)

---

**Bloque temático:** [`05-bi-y-visualizacion.md`](../../../03-herramientas-y-tecnologias/05-bi-y-visualizacion.md)
**Duración orientativa:** 90–120 minutos
**Modalidad:** individual o en parejas, sin código
**Herramientas:** Power BI Desktop (gratuito) o Google Looker Studio (sin instalación)

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Aplicar los principios de visualización del módulo — codificación visual adecuada, escalas honestas, reducción del ruido visual — construyendo un dashboard sencillo con varios gráficos enlazados a partir de datos reales.

<a id="contexto"></a>
## Contexto

El apunte del bloque 5 dedica un apartado completo a los principios de un buen gráfico: usar el canal visual más efectivo para cada tipo de dato (posición > longitud > área > color > ángulo), evitar ejes truncados y aportar contexto con referencias, reducir elementos decorativos que no aportan información, y ser honesto con el rango de datos mostrado. También presenta las dos herramientas de BI más extendidas del mercado: **Power BI** (Microsoft, con su capa de modelado semántico y DAX) y **Tableau** (Salesforce, orientado a exploración visual ad-hoc). En este laboratorio trabajaréis con Power BI o con Google Looker Studio (alternativa gratuita y sin instalación, con una filosofía de uso muy similar a Tableau/Power BI a nivel de usuario).

El dataset, `tienda_online_ventas.csv`, es el mismo que trabajasteis en el laboratorio 3.1: 12.000 pedidos de una tienda online con categoría de producto, región, canal de venta y fecha. Aquí el objetivo cambia: en 3.1 hicisteis análisis exploratorio con código; en este laboratorio vais a **comunicar** hallazgos de negocio a través de visualizaciones interactivas, sin escribir ni una línea de código — el nivel "descriptivo" de la escalera analítica del apunte: "¿qué ocurrió?".

<a id="dataset"></a>
## Dataset

`tienda_online_ventas.csv` (en esta misma carpeta), 12.000 filas con las columnas: `pedido_id, fecha, cliente_id, cliente_nombre, ciudad, region, producto_id, producto_nombre, categoria, cantidad, precio_unitario, importe, canal, metodo_pago, valoracion`.

<a id="que-construir-consultad-preguntas-de-negocio-y-graficosmd"></a>
## Qué construir: consultad `preguntas-de-negocio-y-graficos.md`

Antes de abrir Power BI o Looker Studio, leed el fichero `preguntas-de-negocio-y-graficos.md` de esta carpeta: define exactamente las 3-4 preguntas de negocio que vuestro dashboard debe responder y qué tipo de gráfico se recomienda para cada una, a modo de guía. No es obligatorio seguir esa guía al pie de la letra (podéis proponer una visualización distinta si la justificáis mejor), pero sí es el punto de partida esperado.

---

<a id="instrucciones-paso-a-paso-google-looker-studio-sin-instalacion"></a>
## Instrucciones paso a paso — Google Looker Studio (sin instalación)

1. **Acceder a la herramienta** (5 min). Entrad en [https://lookerstudio.google.com](https://lookerstudio.google.com) con una cuenta de Google. Es gratuito y no requiere instalación.
2. **Crear la fuente de datos** (10 min). En la pantalla principal, pulsad **"Crear" > "Fuente de datos"**. En el buscador de conectores, elegid **"Subir archivo"** (o "File Upload") y cargad `tienda_online_ventas.csv`. Looker Studio detectará automáticamente los tipos de columna (texto, número, fecha); revisad especialmente que la columna `fecha` se haya reconocido como tipo Fecha y no como texto — si no es así, cambiadlo manualmente haciendo clic sobre el tipo de la columna.

   > **Si `fecha` queda marcada como Texto y al intentar cambiarla a Fecha da un error de formato:** es un problema conocido de Looker Studio con fechas en formato `AAAA-MM-DD` (el que usa este CSV) — a veces no las autodetecta, y una vez que un campo queda como Texto, el desplegable de tipo no deja indicar qué patrón usar para reinterpretarlo. La solución no es forzar el tipo del campo `fecha` original, sino crear un **campo calculado** que lo parsee de forma explícita:
   > 1. Desde la fuente de datos (icono de lápiz "Editar") o desde el informe (panel "Configuración" de cualquier gráfico > "Añadir un campo"), cread un **Campo calculado**.
   > 2. Llamadlo, por ejemplo, `fecha_real`, con la fórmula: `PARSE_DATE("%Y-%m-%d", fecha)`.
   > 3. Usad siempre `fecha_real` (no `fecha`) como Dimensión en los gráficos y en el control de intervalo de fechas del paso 5 — ese sí quedará reconocido como tipo Fecha de verdad.
3. **Crear el informe** (5 min). Tras confirmar la fuente de datos, pulsad **"Crear informe"**. Se abrirá un lienzo en blanco listo para añadir gráficos.
4. **Añadir las visualizaciones** (40-50 min). Con el menú **"Añadir un gráfico"** (o el icono de gráfico de barras en la barra de herramientas), id añadiendo cada una de las 3-4 visualizaciones definidas en `preguntas-de-negocio-y-graficos.md`. Para cada gráfico:
   - Arrastradlo al lienzo y ajustad su tamaño.
   - En el panel derecho ("Configuración"), definid la **Dimensión** (p. ej. `categoria`, `region`, o `fecha`/`fecha_real` agrupada por mes para el Gráfico 2) y la **Métrica** (p. ej. suma de `importe`, o conteo de `pedido_id`).
   - Para el Gráfico 2 (estacionalidad), una vez el campo de fecha esté reconocido como tipo Fecha, haced clic sobre su chip en la Dimensión y elegid **"Año y mes"** como nivel de agregación (no "Mes" a secas, porque el dataset cruza 2025 y 2026: agrupar solo por "Mes" fusionaría enero de 2025 con enero de 2026 en un único punto).
   - Cambiad el tipo de gráfico desde el panel superior si el que se ha añadido por defecto no es el más adecuado (barras, línea, mapa, etc.).
5. **Añadir un filtro interactivo** (15 min). Añadid un control de tipo **"Control de intervalo de fechas"** (Date Range Control) o un **"Control de lista desplegable"** (por ejemplo, sobre `canal`) desde el menú "Añadir un control". Colocadlo en la parte superior del informe: al cambiar el filtro, todos los gráficos del informe deben actualizarse automáticamente (esto ocurre por defecto en Looker Studio, sin configuración adicional, siempre que los gráficos usen la misma fuente de datos).
6. **Aplicar los principios de diseño** (15 min). Revisad cada gráfico: desactivad el 3D si algún tipo de gráfico lo ofrece por defecto, simplificad la paleta de colores (usad como máximo 2-3 colores con significado, no uno por cada categoría sin criterio), y comprobad que los ejes numéricos empiezan en 0 (Looker Studio lo hace por defecto en gráficos de barras, pero revisadlo en los de línea).
7. **Publicar o exportar** (10 min). Con el botón **"Compartir" > "Descargar informe"** podéis exportar a PDF, o usad **"Compartir" > "Gestionar acceso"** para publicar el enlace del informe (requiere que el destinatario tenga acceso, o configurarlo como público según las políticas de vuestra organización).

---

<a id="instrucciones-paso-a-paso-power-bi-desktop"></a>
## Instrucciones paso a paso — Power BI Desktop

1. **Instalar Power BI Desktop** (10-15 min, solo la primera vez). Descargadlo gratis desde [https://powerbi.microsoft.com/desktop](https://powerbi.microsoft.com/desktop) (Microsoft Store en Windows, o el instalador `.exe`). No requiere licencia de pago para uso individual en el escritorio.
2. **Cargar el dataset** (5 min). Abrid Power BI Desktop y pulsad **"Obtener datos" > "Texto/CSV"** en la pestaña "Inicio". Seleccionad `tienda_online_ventas.csv`. En la ventana de vista previa, revisad que los tipos de columna se han detectado bien (especialmente `fecha` como tipo Fecha) y pulsad **"Cargar"**.
3. **Revisar el modelo de datos** (5 min). En la vista **"Modelo"** (icono lateral izquierdo), comprobad que la tabla `tienda_online_ventas` aparece correctamente cargada. Con un único fichero no hace falta crear relaciones, pero es el paso donde lo haríais si tuvierais varias tablas (como en el laboratorio 3.2).
4. **Añadir las visualizaciones** (40-50 min). Volved a la vista **"Informe"**. En el panel derecho de **"Visualizaciones"**, id seleccionando el tipo de gráfico (barras, líneas, mapa) para cada una de las 3-4 visualizaciones de `preguntas-de-negocio-y-graficos.md`, y arrastrad los campos correspondientes a los "ejes" (Eje X) y "valores" (Eje Y) del panel de configuración del gráfico. Por ejemplo, para "ventas por categoría": gráfico de barras, `categoria` en el eje y suma de `importe` en el valor.
5. **Añadir un segmentador (slicer)** (15 min). Desde el panel de Visualizaciones, añadid un gráfico de tipo **"Segmentación de datos"** (Slicer), configurado sobre la columna `fecha` (como rango de fechas) o sobre `canal` (como lista de selección). Colocadlo en un lateral del informe: al seleccionar un valor, todos los demás gráficos del informe se filtran automáticamente porque comparten la misma tabla de datos.
6. **Aplicar los principios de diseño** (15 min). Revisad el formato de cada visual (icono de brocha/pincel en el panel de Visualizaciones): desactivad efectos 3D, simplificad la paleta de colores desde "Formato > Colores de datos", y comprobad en "Formato > Eje Y" que el eje empieza en 0 (por defecto en Power BI, pero puede desactivarse por error).
7. **Publicar o exportar** (10 min). Con **"Archivo" > "Exportar" > "Exportar a PDF"** obtenéis una versión estática para entregar. Si tenéis cuenta de Power BI Service (gratuita para uso individual con ciertas limitaciones), podéis usar **"Publicar"** en la pestaña "Inicio" para compartir el informe interactivo online.

---

<a id="actividades-paso-a-paso-resumen"></a>
## Actividades paso a paso (resumen)

1. Cargar el dataset en la herramienta elegida (10-15 min).
2. Construir las 3-4 visualizaciones definidas en `preguntas-de-negocio-y-graficos.md` (40-50 min).
3. Aplicar al menos dos principios de teoría del apunte: evitar ejes truncados / incluir referencia visual, y reducir elementos decorativos (15 min).
4. Añadir un filtro o segmentador interactivo que afecte a varias visualizaciones a la vez (15 min).
5. Publicar o exportar el resultado y redactar una nota de una línea por gráfico explicando qué responde (10 min).

<a id="entregable"></a>
## Entregable

El dashboard publicado (enlace) o exportado a PDF/imagen, acompañado de una nota de una línea por gráfico que explique qué pregunta de negocio responde. Usad `rubrica-evaluacion.md` (en esta carpeta) para autoevaluar vuestro dashboard antes de entregarlo.

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. ¿Qué principio del apunte os ha costado más respetar sin darse cuenta de que lo estabais incumpliendo (por ejemplo, un color usado más por estética que por significado)?
2. Si tuvierais que añadir un quinto gráfico a este dashboard con una pregunta de negocio propia, ¿cuál sería y qué tipo de gráfico usaríais?
3. La escalera analítica del apunte sitúa a la BI en el nivel "descriptivo" (¿qué ocurrió?). ¿Qué pregunta de este dashboard os gustaría convertir en una pregunta "predictiva" (¿qué podría ocurrir?), y qué datos adicionales necesitaríais para abordarla con el enfoque de los laboratorios 3.4 o 3.7?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

Este laboratorio se resuelve con una herramienta de BI externa (Power BI / Looker Studio) sin código, así que no existe un dashboard real adjunto en esta carpeta. Para poder dar una solución con datos reales en vez de una descripción genérica, se ha calculado con pandas sobre `tienda_online_ventas.csv` exactamente lo que cada uno de los gráficos de [`preguntas-de-negocio-y-graficos.md`](./preguntas-de-negocio-y-graficos.md) mostraría en un dashboard bien construido:

**Gráfico 1 — ¿Qué categoría de producto vende más?** Ordenadas por importe total: Electrónica 824.029,78 € (29,8% del total), Deporte 682.886,96 €, Papelería 485.748,23 €, Hogar 436.042,83 € y Moda 333.535,40 € (la última, con un 12,1% del total). **Conclusión de negocio:** Electrónica debería concentrar el grueso del stock y las campañas de marketing, pero no es la categoría con mayor ticket medio (eso es Deporte, con 281,37 € de importe medio por pedido frente a los 257,51 € de Electrónica) — una oportunidad de up-selling en Electrónica, donde hay volumen pero el ticket medio es inferior al de Deporte.

**Gráfico 2 — ¿Hay estacionalidad en las ventas?** El importe mensual oscila entre 126.166,85 € (agosto de 2025, el mes más bajo) y 151.949,05 € (julio de 2025, el más alto) a lo largo de los 20 meses del dataset (enero 2025 – agosto 2026), una variación de apenas el 20% entre el mínimo y el máximo, sin un patrón de estacionalidad marcado que se repita de un año a otro en los mismos meses. **Conclusión de negocio:** a diferencia de lo que cabría esperar en retail (picos en campañas como Navidad o rebajas), este negocio muestra una demanda bastante estable mes a mes, lo que facilita la planificación de inventario (no hace falta un colchón de stock mucho mayor en ningún mes concreto) pero también sugiere que, si existen campañas de marketing puntuales, no están generando picos de venta claramente visibles en los datos.

**Gráfico 3 — ¿Qué región genera más ingresos?** Levante lidera con 773.870,25 €, seguida de Norte (633.253,04 €), Andalucía (541.784,54 €) y Centro (496.573,30 €); Cataluña cierra la lista con 316.762,07 €, **2,44 veces menos** que Levante. **Conclusión de negocio:** la brecha entre la región líder y la última es de 2,44 veces (similar a la brecha de 2,47 veces entre Electrónica y Moda en el Gráfico 1), lo que sitúa a Cataluña como la región con más margen de crecimiento relativo, o bien como la que merece investigarse para entender por qué su rendimiento es tan inferior al resto.

**Gráfico 4 — ¿Qué canal de venta predomina?** Web concentra el 55,0% de los pedidos (6.598) y el 54,8% del importe (1.512.573,61 €); App móvil el 29,8% de los pedidos (3.572) y 29,8% del importe (822.121,57 €); Marketplace el 15,2% de los pedidos (1.830) y 15,5% del importe (427.548,02 €). **Conclusión de negocio:** la proporción de pedidos y de importe es casi idéntica en cada canal (Web 55,0%/54,8%, App 29,8%/29,8%, Marketplace 15,2%/15,5%), lo que indica que el ticket medio es similar en los tres canales y que no hay un canal que "venda poco pero caro" o viceversa — la decisión de dónde invertir en marketing puede basarse directamente en el volumen de pedidos, sin necesidad de ponderar por importe medio.

Estos números son exactamente los que debería mostrar el dashboard interactivo construido en Power BI o Looker Studio; si vuestras cifras no coinciden al construirlo, revisad primero que la columna `fecha` se haya importado como tipo Fecha (y no como texto) y que las agregaciones usen `SUM(importe)` y no `COUNT` o `AVG` por error.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.4): Clasificación con scikit-learn: de los datos a las métricas](../lab-3.4-clasificacion-scikit-learn/enunciado.md) · [Laboratorio siguiente (3.6): Despliega un modelo simple en la nube](../lab-3.6-despliegue-gradio/enunciado.md) ⟶
