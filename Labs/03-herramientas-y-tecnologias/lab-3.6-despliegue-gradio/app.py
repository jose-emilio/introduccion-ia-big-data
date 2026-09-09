"""
Laboratorio 3.6 — Despliega un modelo simple en la nube (nivel gratuito)
Módulo 3 · Herramientas y Tecnologías para IA y Big Data

Interfaz Gradio que expone el modelo de detección de fraude entrenado en el
laboratorio 3.4 (modelo_fraude.joblib) como un mini-servicio web consultable.

Cómo ejecutarlo:
- En local (con gradio instalado): `python app.py`. Abrid la URL local que
  aparece en la terminal (normalmente http://127.0.0.1:7860) para probarlo
  vosotros mismos, y fijaos también en la segunda URL que imprime Gradio, del
  tipo https://xxxxx.gradio.live — es un enlace público gratuito (válido unas
  72 horas) que cualquiera puede abrir sin que vosotros tengáis que desplegar
  nada más. Esto es gracias a `share=True` en `demo.launch()` al final de este
  fichero; es el entregable por defecto de este laboratorio.
- (Opcional, para un despliegue persistente) En Hugging Face Spaces: subid
  este fichero junto con requirements.txt y modelo_fraude.joblib a un Space de
  tipo "Gradio" (ver enunciado.md para las instrucciones paso a paso de
  publicación y las incidencias conocidas de esa plataforma).

Este fichero reutiliza exactamente las mismas columnas y el mismo orden que
se verificaron manualmente (sin gradio) contra el pipeline entrenado en el
laboratorio 3.4, antes de escribir esta interfaz.
"""

import joblib
import pandas as pd
import gradio as gr

# --------------------------------------------------------------------------
# Carga del modelo entrenado en el laboratorio 3.4. El Pipeline incluye TODO
# el preprocesado (escalado de numéricas + one-hot de categoria_comercio), así
# que basta con pasarle un DataFrame con las columnas originales sin procesar.
# --------------------------------------------------------------------------
MODELO = joblib.load("modelo_fraude.joblib")

# Umbral de decisión recomendado en el laboratorio 3.4 (Parte 6): un buen
# compromiso entre detectar fraude real (recall) y no saturar al equipo de
# revisión con demasiados falsos positivos. Podéis cambiarlo aquí si queréis
# experimentar con un umbral distinto.
UMBRAL_DECISION = 0.8

# Categorías de comercio que el modelo conoce (las mismas que aparecen en
# fraude_transacciones.csv, usadas para entrenar el OneHotEncoder del
# preprocesador). Se muestran como opciones del desplegable para que el
# usuario no pueda introducir un valor que el modelo no reconozca.
CATEGORIAS_COMERCIO = [
    "Alimentación",
    "Electrónica",
    "Restauración",
    "Retirada de efectivo",
    "Ropa",
    "Suscripciones",
    "Viajes",
]


def predecir(importe, hora_dia, categoria_comercio, pais_distinto_habitual,
             dispositivo_nuevo, num_transacciones_24h, antiguedad_cuenta_dias):
    """
    Construye una fila con las columnas exactas que espera el Pipeline
    entrenado en el laboratorio 3.4 y devuelve la probabilidad de fraude
    estimada junto con la clasificación según el umbral configurado.
    """
    # Los controles Radio de Gradio devuelven "Sí"/"No": los convertimos al
    # 0/1 que espera el modelo (igual que en fraude_transacciones.csv).
    pais_distinto_habitual_num = 1 if pais_distinto_habitual == "Sí" else 0
    dispositivo_nuevo_num = 1 if dispositivo_nuevo == "Sí" else 0

    fila = pd.DataFrame([{
        "hora_dia": int(hora_dia),
        "importe": float(importe),
        "categoria_comercio": categoria_comercio,
        "pais_distinto_habitual": pais_distinto_habitual_num,
        "dispositivo_nuevo": dispositivo_nuevo_num,
        "num_transacciones_24h": int(num_transacciones_24h),
        "antiguedad_cuenta_dias": int(antiguedad_cuenta_dias),
    }])

    probabilidad_fraude = float(MODELO.predict_proba(fila)[0, 1])
    es_fraude = probabilidad_fraude >= UMBRAL_DECISION

    etiqueta = "SÍ — marcar para revisión" if es_fraude else "NO — transacción normal"
    resultado = (
        f"Probabilidad de fraude: {probabilidad_fraude:.1%}\n"
        f"Umbral de decisión: {UMBRAL_DECISION:.0%}\n"
        f"¿Es fraude según el modelo?: {etiqueta}"
    )
    return resultado


demo = gr.Interface(
    fn=predecir,
    inputs=[
        gr.Number(label="Importe de la transacción (EUR)", value=50.0, minimum=0),
        gr.Slider(label="Hora del día (0-23)", minimum=0, maximum=23, step=1, value=12),
        gr.Dropdown(label="Categoría del comercio", choices=CATEGORIAS_COMERCIO, value="Alimentación"),
        gr.Radio(label="¿País distinto al habitual del cliente?", choices=["No", "Sí"], value="No"),
        gr.Radio(label="¿Dispositivo nuevo (no usado antes por este cliente)?", choices=["No", "Sí"], value="No"),
        gr.Number(label="Nº de transacciones del cliente en las últimas 24h", value=1, minimum=0, precision=0),
        gr.Number(label="Antigüedad de la cuenta (días)", value=365, minimum=0, precision=0),
    ],
    outputs=gr.Textbox(label="Resultado de la predicción", lines=3),
    title="Detector de fraude en transacciones — Laboratorio 3.6",
    description=(
        "Introduce los datos de una transacción y el modelo (entrenado en el laboratorio 3.4 "
        "sobre fraude_transacciones.csv) estimará la probabilidad de que sea fraudulenta. "
        f"Se clasifica como fraude cuando la probabilidad supera el {UMBRAL_DECISION:.0%} "
        "(umbral elegido para priorizar el recall, tal como se justificó en el laboratorio 3.4). "
        "Este es un despliegue mínimo con fines didácticos, no un sistema de producción real."
    ),
    examples=[
        [25.0, 14, "Alimentación", "No", "No", 2, 900],
        [850.0, 3, "Retirada de efectivo", "Sí", "Sí", 9, 15],
        [120.0, 22, "Viajes", "Sí", "No", 3, 500],
    ],
)

if __name__ == "__main__":
    # share=True hace que Gradio genere, además del servidor local, un enlace
    # público temporal (https://xxxxx.gradio.live, válido unas 72h) sin
    # necesidad de cuenta ni de ningún servicio externo. Es el entregable por
    # defecto de este laboratorio: no depende de la disponibilidad ni de las
    # condiciones de acceso de Hugging Face Spaces (ver enunciado.md).
    demo.launch(share=True)
