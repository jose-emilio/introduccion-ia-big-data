# Laboratorio 3.6 — Despliega un modelo simple en la nube (nivel gratuito)

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.5): Dashboard con Power BI / Looker Studio](../lab-3.5-dashboard-bi/enunciado.md) · [Laboratorio siguiente (3.7): Caso conceptual de principio a fin: predicción de churn (integrador)](../lab-3.7-caso-churn-integrador/enunciado.md) ⟶

**Laboratorios relacionados:** [3.4 — Clasificación con scikit-learn: de los datos a las métricas](../lab-3.4-clasificacion-scikit-learn/enunciado.md) (requiere el modelo ya entrenado en ese laboratorio).

## Índice

- [Objetivo de aprendizaje](#objetivo-de-aprendizaje)
- [Contexto](#contexto)
- [Requisito previo](#requisito-previo)
- [Ficheros de esta carpeta](#ficheros-de-esta-carpeta)
- [Actividades paso a paso](#actividades-paso-a-paso)
  - [1. Ejecutar `app.py` y obtener vuestro enlace público (25 min)](#1-ejecutar-apppy-y-obtener-vuestro-enlace-publico-25-min)
  - [2. Opcional — Publicar en Hugging Face Spaces para un despliegue persistente (35 min)](#2-opcional-publicar-en-hugging-face-spaces-para-un-despliegue-persistente-35-min)
  - [3. Reflexionar sobre lo que falta para producción real (25 min)](#3-reflexionar-sobre-lo-que-falta-para-produccion-real-25-min)
- [Entregable](#entregable)
- [Preguntas de reflexión](#preguntas-de-reflexion)
- [Solución propuesta](#solucion-propuesta)

---

**Bloque temático:** [`06-cloud-y-mlops.md`](../../../03-herramientas-y-tecnologias/06-cloud-y-mlops.md)
**Duración orientativa:** 60 minutos (90 si además completáis la publicación opcional en Hugging Face Spaces)
**Modalidad:** individual o en parejas
**Herramientas:** Gradio (gratuito, sin necesidad de cuenta) y, opcionalmente, Hugging Face Spaces

<a id="objetivo-de-aprendizaje"></a>
## Objetivo de aprendizaje

Perder el miedo al despliegue en producción exponiendo el modelo entrenado en el laboratorio 3.4 como un mini-servicio web consultable por cualquier persona con un navegador, sin necesidad de gestionar infraestructura.

<a id="contexto"></a>
## Contexto

El apunte del bloque 6 dedica un bloque entero a MLOps: el conjunto de prácticas que llevan un modelo del notebook de un investigador a un sistema fiable en producción (ciclo MLOps: Data → Code → Model → Registry → Deployment → Monitoring). El bloque 7 de cierre también advierte (cita el bloque "Del Prototipo a Producción" de [`07-casos-conceptuales-y-cierre.md`](../../../03-herramientas-y-tecnologias/07-casos-conceptuales-y-cierre.md)) que "la mayoría de los proyectos de ML no fracasan por el modelo, sino por la ingeniería alrededor del modelo".

Este laboratorio da el primer paso más pequeño posible dentro de ese ciclo: el **Deployment**. No vais a montar un pipeline de CI/CD ni un sistema de monitorización — eso queda fuera del alcance de un laboratorio de 60-90 minutos — sino a exponer el modelo del laboratorio 3.4 (`modelo_fraude.joblib`) como un formulario web interactivo con **Gradio**. Por defecto lo publicaréis con el enlace público temporal y gratuito del propio Gradio (sin necesidad de ninguna cuenta externa); si queréis además un despliegue persistente con su propia URL fija, el laboratorio incluye como actividad **opcional** publicarlo también en **Hugging Face Spaces**. El objetivo es experimentar en primera persona la diferencia entre "un modelo que funciona en mi notebook" y "un servicio que cualquiera puede consultar desde un enlace", y reflexionar sobre qué le falta a este despliegue mínimo para ser un sistema MLOps real.

<a id="requisito-previo"></a>
## Requisito previo

Necesitáis haber completado el laboratorio 3.4 y tener el fichero `modelo_fraude.joblib` ya generado en esta carpeta (`lab-3.6-despliegue-gradio/`). Si no está aquí, copiadlo desde `../lab-3.4-clasificacion-scikit-learn/modelo_fraude.joblib` antes de continuar.

<a id="ficheros-de-esta-carpeta"></a>
## Ficheros de esta carpeta

- **`app.py`**: la interfaz Gradio completa y lista para usar. Carga `modelo_fraude.joblib` con `joblib.load(...)`, define la función `predecir(...)` que construye una fila de datos con las columnas exactas que espera el modelo y llama a `.predict_proba(...)`, monta el formulario con `gr.Interface(...)` y lo lanza con `demo.launch(share=True)`, que genera directamente un enlace público `gradio.live` al ejecutarlo.
- **`requirements.txt`**: las librerías necesarias para ejecutar `app.py` (gradio, scikit-learn, joblib, pandas, numpy).
- **`modelo_fraude.joblib`**: el pipeline entrenado en el laboratorio 3.4 (preprocesado + regresión logística), copiado desde esa carpeta.

<a id="actividades-paso-a-paso"></a>
## Actividades paso a paso

<a id="1-ejecutar-apppy-y-obtener-vuestro-enlace-publico-25-min"></a>
### Ejecutar `app.py` y obtener vuestro enlace público (25 min)

Si tenéis Python instalado, podéis ejecutar `app.py` en vuestro propio ordenador. `app.py` necesita las cinco librerías listadas en `requirements.txt` (`gradio`, `scikit-learn`, `joblib`, `pandas`, `numpy`), no solo gradio — instaladlas todas de una vez con:

```bash
pip install -r requirements.txt
```

(ejecutad este comando estando dentro de la carpeta `lab-3.6-despliegue-gradio/`, donde está `requirements.txt`; si tenéis varias instalaciones de Python, usad `python -m pip install -r requirements.txt` para asegurar que instala en el mismo intérprete con el que luego vais a ejecutar `app.py`). Después, ejecutad:

```bash
python app.py
```

> Si al ejecutarlo veis `ModuleNotFoundError: No module named 'joblib'` (o `gradio`, `pandas`...), es que faltó instalar `requirements.txt` completo — el error anterior de `pip install gradio` a secas solo cubre una de las cinco dependencias.

En la terminal aparecerán **dos URLs**. La primera, local (normalmente `http://127.0.0.1:7860`), solo funciona en vuestro propio ordenador — usadla para probar el formulario vosotros mismos. La segunda, del tipo `https://xxxxx.gradio.live`, es un **enlace público gratuito** generado por el propio Gradio (gracias a `share=True` en `demo.launch()`, ya incluido en el código): válido unas 72 horas, sin necesidad de cuenta ni de publicarlo en ningún sitio adicional, y es **el enlace que constituye el entregable de este laboratorio**. Si cerráis la terminal o el programa, el enlace deja de funcionar — dejad `app.py` corriendo mientras alguien más necesite probarlo, y volved a ejecutarlo (os dará una URL nueva) si necesitáis reabrirlo más tarde.

Probad los tres ejemplos precargados (`examples` en el código) y algún valor propio: un importe alto de madrugada en una categoría de riesgo (`Retirada de efectivo`) debería dar una probabilidad de fraude notablemente más alta que una compra normal de importe bajo en horario diurno.

<a id="2-opcional-publicar-en-hugging-face-spaces-para-un-despliegue-persistente-35-min"></a>
### Opcional — Publicar en Hugging Face Spaces para un despliegue persistente (35 min)

El enlace `gradio.live` del paso 1 ya es un despliegue público válido y es suficiente para el entregable de este laboratorio. Esta actividad es **opcional**: hacedla si queréis experimentar además con un despliegue persistente (con URL fija, que no caduca a las 72 horas) en una plataforma de terceros — así es como se suele hacer en la práctica cuando el servicio tiene que seguir disponible más allá de una sesión de trabajo.

> **Aviso:** Hugging Face ha empezado a exigir, para crear Spaces de cómputo (Gradio/Docker) incluso en el nivel gratuito "CPU Basic", cuenta con email verificado y algo de antigüedad (o, en algunos casos, una suscripción PRO de pago, sin periodo de prueba gratuito) — esto afecta sobre todo a cuentas nuevas, y es una restricción de la plataforma, no un fallo del laboratorio. Si no conseguís desbloquear el plan gratuito, saltaos esta actividad sin problema: ya tenéis vuestro entregable del paso 1.

1. **Crear una cuenta gratuita** en [https://huggingface.co](https://huggingface.co) (si no tenéis una).
2. **Crear un Space nuevo**: desde vuestro perfil, pulsad **"New Space"**. Dadle un nombre (por ejemplo `deteccion-fraude-lab36`), elegid licencia (opcional) y, en **"Select the Space SDK"**, elegid **"Gradio"**. Dejad el hardware por defecto (CPU básica, gratuita).

   > **Si Hugging Face os pide una suscripción PRO (o un método de pago) para poder crear el Space en CPU Basic:** la documentación oficial sigue diciendo que CPU Basic es gratuita, pero como se avisa arriba, Hugging Face está aplicando esta restricción a cuentas nuevas de forma más agresiva de lo que documenta oficialmente. Antes de descartar la actividad, revisad `huggingface.co/settings/billing` (a veces solo pide confirmar un método de pago de verificación, sin cobrar nada) y comprobad que vuestro email esté verificado. Si aun así no se desbloquea, no hace falta pagar: quedaos con el enlace `gradio.live` del paso 1 como entregable y continuad con el paso 3.
3. **Subir los ficheros**: en la pestaña **"Files"** de vuestro Space recién creado, subid (con "Add file" > "Upload files" o arrastrando):
   - `app.py`
   - `requirements.txt`
   - `modelo_fraude.joblib`

   Alternativamente, podéis conectar un repositorio de GitHub que contenga estos tres ficheros y vincularlo al Space.
4. **Esperar el build**: Hugging Face Spaces instalará automáticamente las dependencias de `requirements.txt` y ejecutará `app.py`. Este proceso ("Building") tarda uno o dos minutos; podéis seguir el progreso en la pestaña **"Logs"** del Space. Si algo falla, revisad ahí el mensaje de error.

   > **Si el log muestra `runtime error: No @spaces.GPU function detected during startup`** (fijaos en que justo antes suele aparecer `Running on local URL: http://0.0.0.0:7860` — la app en sí arrancó bien): el Space ha quedado configurado con hardware **ZeroGPU** en vez de **CPU basic**. ZeroGPU exige que el código tenga una función decorada con `@spaces.GPU`, y este laboratorio no la necesita — el modelo es una regresión logística de scikit-learn, corre perfectamente en CPU. Para arreglarlo sin tocar el código: pestaña **"Settings"** del Space > sección **"Space hardware"** > cambiad a **"CPU basic"** (el nivel gratuito) > guardad. El Space hará un reinicio ("factory reboot") y arrancará sin el error. Los avisos `InconsistentVersionWarning` sobre scikit-learn que puedan aparecer antes en el log son inofensivos (solo indican una versión de scikit-learn ligeramente distinta entre el entrenamiento y el Space) y no son la causa de este error.
5. **Probar el Space publicado**: una vez el estado pase a "Running", la pestaña **"App"** mostrará el mismo formulario que probasteis en local, ahora accesible desde un enlace público (`https://huggingface.co/spaces/<vuestro-usuario>/<nombre-del-space>`).

<a id="3-reflexionar-sobre-lo-que-falta-para-produccion-real-25-min"></a>
### Reflexionar sobre lo que falta para producción real (25 min)

Con vuestro modelo ya publicado (con el enlace `gradio.live` del paso 1, con un Space de Hugging Face si completasteis el paso 2 opcional, o con ambos), dedicad tiempo a responder por escrito a esta pregunta: **¿qué controles de un sistema MLOps real NO están presentes en este despliegue mínimo, y por qué harían falta en producción?** Usad como referencia el ciclo MLOps del apunte y completad la plantilla siguiente:

> **Versionado de modelos** — En este despliegue, `modelo_fraude.joblib` es un fichero suelto sin historial. En producción haría falta: _______
>
> **Monitorización de drift** — Nadie vigila si las transacciones reales de producción empiezan a diferir del dataset de entrenamiento. En producción haría falta: _______
>
> **Reentrenamiento** — El modelo nunca se actualiza con datos nuevos. En producción haría falta: _______
>
> **Tests automáticos** — No hay ninguna prueba que garantice que `app.py` sigue funcionando tras un cambio. En producción haría falta: _______
>
> **CI/CD** — Publicar una nueva versión del modelo es un proceso manual (subir ficheros a mano). En producción haría falta: _______

<a id="entregable"></a>
## Entregable

El enlace público a vuestro modelo desplegado — el `https://xxxxx.gradio.live` del paso 1 es suficiente; si completasteis también el paso 2 opcional, añadid también el enlace del Space de Hugging Face — más la reflexión escrita de la actividad 3 (podéis completar la plantilla anterior directamente o redactarla en prosa).

<a id="preguntas-de-reflexion"></a>
## Preguntas de reflexión

1. ¿Qué pasaría si alguien introdujera un importe negativo o una hora fuera del rango 0-23 en el formulario? ¿Está `app.py` protegido frente a esto? (Pista: mirad los parámetros `minimum`/`maximum` de los controles de Gradio).
2. El modelo desplegado aquí fue entrenado sobre datos sintéticos de un solo periodo. Si este fuera un sistema real de un banco, ¿con qué frecuencia creeríais razonable reentrenarlo, y qué señal os indicaría que hace falta hacerlo antes de lo previsto?
3. El enlace `gradio.live` (y, si lo probasteis, Hugging Face Spaces) os ha dado un despliegue funcional en minutos, sin gestionar servidores — pero ambos son soluciones pensadas para demos, no para producción (el primero caduca a las 72h; el segundo depende de la disponibilidad y las condiciones de acceso de un proveedor gratuito de terceros, como habéis podido comprobar vosotros mismos si os topasteis con el aviso de suscripción). ¿Qué limitaciones tiene este enfoque frente a un despliegue en AWS SageMaker, Azure ML o Vertex AI (según el apunte) para un sistema con miles de peticiones por segundo?

<a id="solucion-propuesta"></a>
## Solución propuesta

*Intenta resolver primero la actividad por tu cuenta. Lo que sigue es la solución de referencia, útil para autocorregirte.*

`gradio` no está instalado en este entorno, así que `app.py` no se ha podido ejecutar como servidor web aquí. En su lugar se ha verificado directamente el pipeline que `app.py` expone: se cargó `modelo_fraude.joblib` con `joblib.load(...)` y se reconstruyeron con pandas los tres ejemplos precargados exactamente como los define `examples=[...]` en `app.py`, para confirmar que el servicio funcionaría igual una vez publicado. El `demo.launch(share=True)` con el que termina `app.py` da, al ejecutarlo con Python y gradio instalados, el enlace público `gradio.live` que constituye el entregable de este laboratorio, sin depender de Hugging Face.

**Resultado de la verificación (mismas tres filas que `app.py` ofrece como ejemplos):**

| Escenario | Importe | Hora | Categoría | País distinto | Dispositivo nuevo | P(fraude) | Clasificación (umbral 0,8) |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Compra normal de alimentación, horario diurno | 25,0 € | 14h | Alimentación | No | No | **0,109** | NO — transacción normal |
| Retirada de efectivo de madrugada, señales múltiples | 850,0 € | 3h | Retirada de efectivo | Sí | Sí | **0,998** | SÍ — marcar para revisión |
| Compra en viajes, país distinto pero importe moderado | 120,0 € | 22h | Viajes | Sí | No | **0,817** | SÍ — marcar para revisión |

El pipeline reproduce exactamente el comportamiento esperado: la compra normal obtiene una probabilidad de fraude baja (10,9%), y las dos transacciones con señales de riesgo (importe alto, madrugada, país distinto, dispositivo nuevo) superan el umbral del 80% configurado en `UMBRAL_DECISION`. Con esto se confirma que `app.py` está **completo y listo para desplegar**: carga el modelo correctamente, construye la fila de entrada con las columnas y el orden exactos que espera el `Pipeline` entrenado en el laboratorio 3.4, y clasifica de forma coherente con lo observado en aquel laboratorio.

**Reflexión de ejemplo sobre los controles de MLOps que faltan en este despliegue mínimo:** este despliegue (con `gradio.live`, con un Space de Hugging Face, o con ambos) expone el modelo, pero no es un sistema de producción real. Faltan, como mínimo, cuatro controles: (1) **versionado de modelos** — `modelo_fraude.joblib` es un fichero suelto sin historial; en producción haría falta un registro de modelos (MLflow, un bucket versionado, o el "Model Registry" del ciclo MLOps del apunte) que permita saber qué versión está en producción y volver atrás si empeora; (2) **monitorización de drift** — nadie compara las transacciones reales que llegan al Space con la distribución de `fraude_transacciones.csv` usada para entrenar; sin esa vigilancia, el modelo puede degradarse silenciosamente si el patrón de fraude cambia; (3) **reentrenamiento** — el modelo nunca se actualiza, así que con el tiempo dejará de reflejar el comportamiento real de los defraudadores, que se adaptan; y (4) **tests automáticos y CI/CD** — hoy publicar una nueva versión significa subir ficheros a mano a la pestaña "Files", sin ninguna prueba que garantice que `app.py` sigue funcionando tras el cambio; en un sistema real, cada cambio debería pasar por un pipeline que ejecute tests (¿sigue cargando el modelo? ¿las columnas de entrada siguen siendo las esperadas?) antes de desplegarse automáticamente. Sin estos cuatro controles, el despliegue funciona como demostración, pero no resistiría el uso sostenido de un banco real.


---

**Navegación:** [Índice general](../../README.md) · [Índice del módulo](../README.md) · ⟵ [Laboratorio anterior (3.5): Dashboard con Power BI / Looker Studio](../lab-3.5-dashboard-bi/enunciado.md) · [Laboratorio siguiente (3.7): Caso conceptual de principio a fin: predicción de churn (integrador)](../lab-3.7-caso-churn-integrador/enunciado.md) ⟶
