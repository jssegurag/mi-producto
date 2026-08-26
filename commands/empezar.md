---
name: "Empezar"
description: Cuéntale a Claude tu idea. Prepara el proyecto y deja todo listo para documentarla. Empieza por aquí.
category: Producto
tags: [empezar, inicio, idea]
---

Prepara un proyecto nuevo. Recoge lo mínimo sobre la idea, crea la estructura de carpetas y deja al usuario listo para `/documentar`.

**Tarda 2 minutos.** No pidas nada que no necesites.

---

## Fase 1 — Bienvenida

Preséntate en tres líneas. Nada de jerga, nada de listas largas de lo que va a pasar.

```
## Vamos a documentar tu idea

Te voy a hacer 2 preguntas rápidas y con eso preparo todo.
Después convertimos tu idea en los documentos que necesita
alguien para construirla.
```

---

## Fase 2 — Las 2 preguntas

Usa **AskUserQuestion**. Solo dos, y ambas de texto libre:

1. *"¿Qué quieres construir? Cuéntamelo en una o dos frases, como se lo contarías a un amigo."*
2. *"¿Quién lo va a usar? Descríbeme a esa persona."*

**No preguntes nada más.** En concreto, **no** preguntes por método de priorización, ni por stakeholders, ni por formato. Todo eso se decide después, con contexto, o tiene un valor por defecto sensato.

Si la respuesta a la primera pregunta ya menciona claramente quién lo usa, **sáltate la segunda** y confírmalo: *"Entiendo que es para [X], ¿correcto?"*

---

## Fase 3 — Preparar el proyecto (en silencio)

Sin narrar los pasos técnicos al usuario:

1. **Crear las carpetas** copiando desde `${CLAUDE_PLUGIN_ROOT}/templates/docs/` hacia `docs/` del proyecto actual:

   ```
   docs/1-la-idea/            docs/4-lista-de-trabajo/
   docs/2-el-recorrido/       docs/5-que-va-primero/
   docs/3-tareas/             docs/6-pantallas/
   ```

   Cada una lleva su `LEEME.md` y su `CLAUDE.md`. **Si una carpeta ya existe, no la toques.**

2. **Escribir el bloque de contexto** en el `CLAUDE.md` del proyecto, desde
   `${CLAUDE_PLUGIN_ROOT}/templates/CLAUDE.md.template`, entre los marcadores
   `<!-- BEGIN mi-producto -->` y `<!-- END mi-producto -->`. Sustituir
   `{{NOMBRE}}`, `{{DE_QUE_VA}}` y `{{PARA_QUIEN}}`.

   **No toques nada fuera de los marcadores.** Si el archivo no existe, créalo.
   Si el bloque ya existe, reemplaza solo su interior.

3. **Guardar en memoria** (tipo `project`): nombre, de qué va, para quién.
   Método de priorización por defecto: `debe-deberia-podria`.

---

## Fase 4 — Confirmar y ofrecer continuar

```
## Listo ✓

Entendí que quieres construir:
  <resumen en una frase, con tus palabras>

Para:
  <quién lo va a usar>

Ya preparé las carpetas donde van a vivir tus documentos.

¿Arrancamos? Puedo escribirte ahora mismo el documento que
explica tu producto — es el primero de 5, y de ahí sale todo
lo demás.
```

**Termina siempre ofreciendo continuar.** Si el usuario dice que sí, activa la skill `flujo-completo` directamente — **no le hagas teclear otro comando.**

---

## Reglas

- **Máximo 2 preguntas.** Si necesitas más contexto, lo pides durante el primer documento, no ahora.
- **Cero jerga** en todo el comando. No digas "parametrizar", "auto-memory", "pipeline", "scaffolding" ni "artefactos".
- **Si el proyecto ya está preparado** (existe `docs/1-la-idea/`), no repitas el onboarding. Di: *"Este proyecto ya está listo. ¿Retomamos donde quedaste?"* y muestra el avance.
- **No narres los pasos técnicos.** El usuario no necesita saber que copiaste plantillas.
