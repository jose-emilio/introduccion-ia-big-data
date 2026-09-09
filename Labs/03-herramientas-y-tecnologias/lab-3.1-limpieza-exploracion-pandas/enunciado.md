# Laboratorio 3.1 — Limpieza y exploración de datos con Pandas

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.5): Caso de uso end-to-end (integrador)](../../02-fundamentos-del-big-data/lab-2.5-caso-uso-end-to-end/enunciado.md) · [Laboratorio siguiente (3.2): Consultas SQL sobre una base de datos de ejemplo](../lab-3.2-consultas-sql/enunciado.md) ⟶

**Laboratorios relacionados:** [3.2 — Consultas SQL sobre una base de datos de ejemplo](../lab-3.2-consultas-sql/enunciado.md) (mismo dataset de ventas, resuelto con SQL en vez de pandas); [3.3 — Tu primer pipeline distribuido con Spark SQL](../lab-3.3-pipeline-spark-sql/enunciado.md) (mismo dataset, resuelto con Spark SQL); [3.5 — Dashboard con Power BI / Looker Studio](../lab-3.5-dashboard-bi/enunciado.md) (mismo dataset, usado para el dashboard de BI).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Cómo trabajar con el notebook](#como-trabajar-con-el-notebook)
- [Dataset](#dataset)
- [Actividades paso a paso](#actividades-paso-a-paso)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)

---

**Bloque temático:** [`01-python-y-entornos.md`](../../../03-herramientas-y-tecnologias/01-python-y-entornos.md)
**Duración orientativa:** 120 minutos
**Modalidad:** individual, notebook semi-guiado
**Herramientas:** Google Colab (o Jupyter local) + pandas

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Practicar el ciclo completo de Análisis Exploratorio de Datos (EDA) sobre un dataset tabular real: inspección inicial con `head()`/`info()`/`describe()`, detección de valores faltantes, filtrado y selección de datos, creación de columnas derivadas (feature engineering básico) y agregación con `groupby().agg()`.

<a id="contexto"></a>
## Contexto

El apunte del bloque 1 presenta pandas como la herramienta de referencia para cargar, explorar, limpiar y transformar datos tabulares antes de modelar o visualizar. También distingue las cuatro operaciones que forman el núcleo del trabajo diario con datos: seleccionar, filtrar, transformar (`groupby`) y combinar (`merge`/`concat`). Este laboratorio se centra en las tres primeras; la cuarta (combinar tablas) no aplica aquí porque el dataset ya viene en un único fichero, pero la veréis con detalle en SQL en el laboratorio 3.2 mediante `JOIN`.

Vais a trabajar con `tienda_online_ventas.csv`, un dataset de 12.000 pedidos de una tienda online. Es el mismo dataset (o una variante del mismo) que reaparece en otros laboratorios del módulo: en el 3.2 lo encontraréis normalizado en varias tablas SQL, en el 3.3 lo procesaréis con Spark SQL, y en el 3.5 lo usaréis para construir un dashboard de BI. Dominar bien su estructura aquí os ahorrará tiempo más adelante.

<a id="como-trabajar-con-el-notebook"></a>
## Cómo trabajar con el notebook

El notebook `notebook_3.1.ipynb` de esta carpeta contiene **todo el código ya escrito y funcionando**: podéis abrirlo en Google Colab (o Jupyter) y ejecutarlo celda a celda de principio a fin sin escribir nada, y obtendréis todos los resultados correctos.

Ahora bien, el objetivo de este laboratorio es que **vosotros** sepáis escribir ese código, no solo leerlo. Así que os recomendamos encarecidamente:

1. Antes de ejecutar cada celda de código, leed únicamente el enunciado de la celda Markdown que la precede y **tapad** (o no miréis todavía) el código que sigue.
2. Escribid vosotros mismos, en una celda nueva, el código pandas que resolvería ese paso.
3. Ejecutadlo y comparad vuestro resultado con el de la celda ya resuelta.
4. Usad el notebook resuelto como corrección: si os atascáis, mirad la solución; si vuestro código ya funciona, seguid adelante.

De esta forma practicáis la escritura real de pandas (que es lo que necesitaréis en el puesto de trabajo y en cualquier evaluación práctica) sin depender de memorizar sintaxis antes de tiempo, y siempre tenéis un notebook 100% funcional como referencia.

<a id="dataset"></a>
## Dataset

`tienda_online_ventas.csv` (en esta misma carpeta), 12.000 filas con las columnas:

`pedido_id, fecha, cliente_id, cliente_nombre, ciudad, region, producto_id, producto_nombre, categoria (Electrónica/Hogar/Deporte/Moda/Papelería), cantidad, precio_unitario, importe, canal (Web/App móvil/Marketplace), metodo_pago, valoracion (1-5, con nulos)`.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

1. **Cargar el dataset** (5 min). Cargad el CSV en un DataFrame de pandas con `pd.read_csv()`.
2. **Primera inspección** (25 min). Aplicad `head()`, `tail()`, `info()`, `describe()` y `value_counts()` sobre las columnas categóricas relevantes (`categoria`, `canal`, `region`). Identificad qué columna(s) tienen valores faltantes y en qué proporción.
3. **Filtrado y selección** (15 min). Seleccionad un subconjunto de columnas y aplicad al menos dos filtros distintos sobre las filas (por ejemplo, pedidos de una categoría y canal concretos, o pedidos por encima de un percentil de importe).
4. **Columnas derivadas** (20 min). Cread dos columnas nuevas: (a) `importe_por_unidad_bruto` como el ratio `importe / cantidad`, y (b) `dia_semana`, descomponiendo la columna `fecha` con `pd.to_datetime(...).dt.day_name()`.
5. **Agregación con `groupby().agg()`** (25 min). Agrupad por categoría (y por región, y por combinaciones de columnas) y calculad métricas agregadas: conteo de pedidos, importe medio, importe total, valoración media.
6. **Conclusiones** (10 min). Redactad tres conclusiones basadas en lo que habéis observado en el EDA.

<a id="entregable"></a>
## Entregable

El notebook ejecutado de principio a fin, con las transformaciones aplicadas y **tres conclusiones escritas** a partir del EDA (podéis partir de las conclusiones de referencia que incluye el notebook resuelto, validarlas o sustituirlas por las vuestras si observáis algo distinto).

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. ¿Por qué es importante ejecutar `info()` **antes** de hacer cualquier cálculo sobre una columna? ¿Qué error se podría cometer si se calcula la media de `valoracion` sin comprobar antes que tiene valores nulos?
2. La columna derivada `importe_por_unidad_bruto` sirve, de paso, como verificación de calidad de datos (comprobando que coincide con `precio_unitario`). ¿Se os ocurre otra columna derivada que sirva al mismo tiempo como chequeo de consistencia de los datos?
3. En el laboratorio 3.2 repetiréis algunas de estas mismas agregaciones, pero en SQL. Antes de llegar allí, pensad: ¿cómo escribiríais en SQL la agregación por categoría del paso 5 (`groupby("categoria").agg(...)`)?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte o para que el profesorado valide el trabajo de los grupos.*

Resultados obtenidos al ejecutar `notebook_3.1.ipynb` de principio a fin sobre `tienda_online_ventas.csv` (12.000 filas, 15 columnas):

**Inspección inicial (`info()`, `value_counts()`):** la única columna con valores faltantes es `valoracion`: 10.225 valores no nulos de 12.000 (1.775 nulos, el **14,79%** de las filas). El resto de columnas están completas. Distribución de categóricas:

- `categoria`: Electrónica 3.200, Deporte 2.427, Hogar 2.340, Papelería 2.043, Moda 1.990.
- `canal`: Web 6.598 (55,0%), App móvil 3.572 (29,8%), Marketplace 1.830 (15,2%).
- `region`: Levante 3.445, Norte 2.754, Andalucía 2.309, Centro 2.165, Cataluña 1.327.
- `valoracion` (excluyendo nulos): 1★ 359, 2★ 593, 3★ 1.459, 4★ 3.513, 5★ 4.301 — la mayoría de valoraciones son positivas (76,4% son 4 o 5 estrellas).

**Filtrado y selección:** los pedidos de categoría Electrónica por canal Web son 1.769. El percentil 90 de `importe` es **515,48 €**; 1.200 pedidos (exactamente el 10,0% del total, como cabe esperar de un percentil 90) superan ese umbral.

**Columnas derivadas:** `importe_por_unidad_bruto` (= `importe / cantidad`) coincide con `precio_unitario` con una diferencia máxima de **0,0** en todo el dataset, confirmando que `importe` se calculó correctamente en el fichero original. Por día de la semana (`dia_semana`), el volumen de pedidos es bastante uniforme: Monday 1.669, Tuesday 1.718, Wednesday 1.706, Thursday 1.767, Friday 1.717, Saturday 1.683, Sunday 1.740 — jueves es el día con más pedidos, pero la diferencia con el resto es pequeña (menos del 6% entre el máximo y el mínimo).

**Agregación `groupby().agg()` por categoría:**

| Categoría | Nº pedidos | Importe medio | Importe total | Valoración media |
| --- | --- | --- | --- | --- |
| Electrónica | 3.200 | 257,51 € | 824.029,78 € | 4,08 |
| Deporte | 2.427 | 281,37 € | 682.886,96 € | 4,03 |
| Papelería | 2.043 | 237,76 € | 485.748,23 € | 4,04 |
| Hogar | 2.340 | 186,34 € | 436.042,83 € | 4,05 |
| Moda | 1.990 | 167,61 € | 333.535,40 € | 4,07 |

Por región, el importe total ordenado es: Levante 773.870,25 €, Norte 633.253,04 €, Andalucía 541.784,54 €, Centro 496.573,30 €, Cataluña 316.762,07 € (Levante factura 2,44 veces más que Cataluña, la última región).

**Las tres conclusiones del EDA (con datos reales):**

1. **Electrónica es la categoría líder en ingresos (824.029,78 €, el 29,8% del total), pero no por ticket medio**: Deporte tiene el importe medio por pedido más alto (281,37 € frente a 257,51 €) pese a generar menos ingresos totales (682.886,96 €) porque tiene menos pedidos (2.427 frente a 3.200). Esto separa dos decisiones de negocio distintas: dónde concentrar stock (Electrónica, por volumen) y dónde hay margen para subir el ticket medio (Moda, con el importe medio más bajo, 167,61 €).
2. **Levante es, con diferencia, la región más rentable** (773.870,25 €), muy por delante de Cataluña (316.762,07 €, 2,44 veces menos), y también la que más pedidos genera (3.445). Esta brecha regional es mayor que la que existe entre categorías de producto, por lo que cualquier estrategia comercial geográfica debería priorizarse sobre la de producto.
3. **La columna `valoracion` tiene un 14,79% de nulos (1.775 de 12.000 filas)**, y la valoración media global (calculada solo sobre los 10.225 valores no nulos) es de 4,06 sobre 5, con el 76,4% de las valoraciones siendo de 4 o 5 estrellas — el servicio está bien percibido por quienes sí valoran, pero casi 1 de cada 7 pedidos no deja constancia de su satisfacción, lo que limita la fiabilidad de esta métrica si se usara para decisiones automatizadas.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (2.5): Caso de uso end-to-end (integrador)](../../02-fundamentos-del-big-data/lab-2.5-caso-uso-end-to-end/enunciado.md) · [Laboratorio siguiente (3.2): Consultas SQL sobre una base de datos de ejemplo](../lab-3.2-consultas-sql/enunciado.md) ⟶
