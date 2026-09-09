# Ficha de diagnóstico de las 5 Vs — `tienda_online_ventas.csv`

**Autor/es:** _(nombre/s)_
**Fecha:** _(fecha)_
**Vía de trabajo:** _(Google Sheets / Colab + pandas)_

---

## 1. Volumen

**Preguntas guía:** ¿Cuántas filas y columnas tiene el dataset? ¿Qué tamaño ocupa en disco/memoria? Si el volumen de pedidos se multiplicase por 50, ¿en qué orden de magnitud (MB/GB/TB) estaríamos y qué implicaciones tendría para el almacenamiento?

- Número de filas: _______
- Número de columnas: _______
- Tamaño en disco / memoria: _______
- Estimación a escala 50x: _______

---

## 2. Velocidad

**Preguntas guía:** Aunque el CSV es una foto fija, ¿con qué frecuencia se generarían estos datos en el sistema real de la tienda? ¿Qué patrón de ingestión (batch, streaming, o ambos) tendría sentido para mantener un panel de ventas actualizado, y por qué?

- Frecuencia estimada de generación de nuevos pedidos: _______
- Patrón de ingestión recomendado y justificación: _______

---

## 3. Variedad

**Preguntas guía:** ¿Qué tipos de columnas hay (numéricas, categóricas, texto libre, fechas)? ¿Cuántas columnas caen en cada categoría?

| Tipo de columna | Columnas | Cuántas |
| --- | --- | --- |
| Numéricas | | |
| Categóricas | | |
| Texto libre | | |
| Fechas | | |

---

## 4. Veracidad

**Preguntas guía:** ¿Qué columnas tienen valores nulos y cuántos? De los nulos en `valoracion`, ¿son un problema de calidad o una ausencia esperada — y por qué? ¿Hay filas duplicadas? ¿Hay inconsistencias de formato (mayúsculas/minúsculas, nombres distintos para el mismo valor) en `categoria`, `canal` o `metodo_pago`?

- Nulos por columna (resumen): _______
- ¿`valoracion` nulo es problema real o ausencia legítima? Justifica: _______
- Duplicados encontrados: _______
- Inconsistencias de formato encontradas: _______

---

## 5. Valor

**Preguntas guía:** ¿Qué decisión de negocio concreta podría tomarse con este dataset? ¿En qué dato observado te apoyas para proponerla?

- Hipótesis de negocio (decisión accionable): _______
- Dato del CSV que la respalda: _______

---

## Reflexión final

- V que más ha costado medir directamente y por qué: _______
- V a priorizar antes de usar el dataset en un modelo predictivo, y por qué: _______
