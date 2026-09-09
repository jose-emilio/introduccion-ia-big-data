# Preguntas de negocio y gráficos recomendados

Esta guía define las 3-4 visualizaciones que debe incluir el dashboard del laboratorio 3.5, cada una anclada a una pregunta de negocio concreta. No es obligatorio ceñirse exactamente a esta lista (podéis justificar una alternativa mejor), pero sí es el punto de partida que se espera que sigáis salvo que tengáis una razón mejor.

---

## Gráfico 1 — ¿Qué categoría de producto vende más?

**Pregunta de negocio:** ¿en qué categoría de producto (Electrónica, Hogar, Deporte, Moda, Papelería) deberíamos concentrar el stock y las campañas de marketing?

**Tipo de gráfico recomendado:** gráfico de **barras horizontales o verticales**, con `categoria` en el eje de categorías y la **suma de `importe`** como valor, ordenado de mayor a menor.

**Por qué este tipo de gráfico:** el apunte señala que la posición y la longitud son los canales visuales más efectivos para comparar valores entre categorías discretas — exactamente lo que necesitamos aquí (comparar 5 categorías). Un gráfico de tarta sería peor opción: con 5 categorías de tamaño relativamente similar, comparar ángulos es mucho menos preciso que comparar la longitud de barras alineadas sobre el mismo eje.

---

## Gráfico 2 — ¿Hay estacionalidad en las ventas a lo largo del tiempo?

**Pregunta de negocio:** ¿existen meses o periodos del año con más o menos ventas? Esta información es clave para planificar inventario y campañas con antelación.

**Tipo de gráfico recomendado:** gráfico de **líneas**, con la fecha (agrupada por mes) en el eje horizontal y la **suma de `importe`** en el eje vertical.

**Por qué este tipo de gráfico:** el apunte recomienda líneas y áreas específicamente para "evolución temporal de una o varias series", ya que revelan tendencias y estacionalidades de forma mucho más clara que una tabla de números o un gráfico de barras con muchas categorías temporales. El dataset cubre desde enero de 2025 hasta agosto de 2026 (unos 20 meses), suficiente para detectar patrones repetidos entre años si existen.

---

## Gráfico 3 — ¿Qué región genera más ingresos?

**Pregunta de negocio:** ¿en qué regiones (Norte, Levante, Andalucía, Centro, Cataluña) está más consolidada la tienda, y en cuáles habría margen de crecimiento?

**Tipo de gráfico recomendado:** gráfico de **barras** por región con la suma de `importe` (alternativa más avanzada, si la herramienta lo permite fácilmente: un **mapa de España coroplético** con `region` como dimensión geográfica — Looker Studio y Power BI soportan mapas, aunque requieren un poco más de configuración con nombres de región reconocibles).

**Por qué este tipo de gráfico:** igual que en el Gráfico 1, la comparación entre un número reducido de categorías (5 regiones) se resuelve mejor con barras que con color o área. Si optáis por el mapa, tened en cuenta el aviso del apunte sobre el color como canal: la posición > longitud > área > color > ángulo en efectividad, así que el mapa es una visualización más vistosa pero objetivamente menos precisa para comparar valores exactos que un gráfico de barras — usadlo como complemento, no como sustituto único.

---

## Gráfico 4 — ¿Qué canal de venta predomina?

**Pregunta de negocio:** ¿qué proporción de las ventas se genera en cada canal (Web, App móvil, Marketplace)? Esta información orienta decisiones de inversión en cada canal (por ejemplo, si merece la pena invertir más en la app móvil).

**Tipo de gráfico recomendado:** gráfico de **barras** o de **anillo/tarta** (aquí sí es defendible, porque solo hay 3 categorías con proporciones claramente distintas, un caso donde un gráfico circular resulta más legible que con 5+ categorías) mostrando el número de pedidos o el importe total por `canal`.

**Por qué este tipo de gráfico:** con pocas categorías (3) y el objetivo de comunicar una proporción del total (más que comparar valores absolutos con precisión), un gráfico circular es aceptable según el apunte, siempre que se use con moderación y no como recurso por defecto para todo. Si preferís mantener la coherencia visual con los Gráficos 1 y 3, usad barras también aquí — ambas opciones son válidas.

---

## Resumen para el dashboard

| # | Pregunta de negocio | Dimensión | Métrica | Gráfico recomendado |
| --- | --- | --- | --- | --- |
| 1 | ¿Qué categoría vende más? | `categoria` | Suma de `importe` | Barras |
| 2 | ¿Hay estacionalidad? | `fecha` (por mes) | Suma de `importe` | Líneas |
| 3 | ¿Qué región genera más ingresos? | `region` | Suma de `importe` | Barras (o mapa) |
| 4 | ¿Qué canal predomina? | `canal` | Nº de pedidos o `importe` | Barras o anillo |

Añadid, además, un control de filtro (rango de fechas o selector de canal) que afecte a los 4 gráficos a la vez, tal como pide el enunciado.
