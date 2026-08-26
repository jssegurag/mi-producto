---
name: escribir-tarea
description: Escribe una tarea en formato "Como [quién], quiero [qué], para [para qué]". Actívala cuando el usuario diga "añade una tarea", "necesito que se pueda hacer X", "escribe lo del login", "agrega una funcionalidad" — y también cuando use el término técnico "historia de usuario", "user story" o "HU". Escribe `docs/3-tareas/T-XXX-<slug>.md`. NO escribe los criterios de aceptación (eso es `criterios-de-listo`). Paso 3a de 5 (obligatorio, suele ir en pareja con criterios-de-listo).
category: Producto
tags: [tarea, historia-usuario, user-story, invest]
---

# escribir-tarea

Produce `docs/3-tareas/T-XXX-<slug>.md` con una tarea individual. Esta skill **no** escribe los criterios de aceptación — eso es el paso siguiente (`criterios-de-listo`).

**Cómo se llama esto en la industria:** una Historia de Usuario (*user story*).

## Contexto (fuente: METODO.md §3)

Formato canónico, **no negociable**:

```
Como [tipo de persona específica],
quiero [hacer algo concreto],
para [conseguir un beneficio visible].
```

Las tres partes importan. Sin el "para", nadie sabe por qué se construye. Sin el "como", nadie sabe para quién.

## Inputs requeridos

- ID de la tarea (auto-incrementar mirando `docs/3-tareas/`).
- Bloque al que pertenece (`B-XXX`).
- Quién es la persona (específica, **nunca** "el usuario").
- Qué quiere hacer.
- Para qué le sirve.

Si falta algo, preguntar con `AskUserQuestion` en lenguaje cotidiano:
*"¿Quién exactamente hace esto? No 'el usuario' — ¿es quien compra, quien administra, quien visita por primera vez?"*

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/tarea.template.md`

## Reglas duras

1. **Persona específica**: nada de "usuario" o "cliente" a secas. Si hay perfiles definidos en el documento de producto, anclarlo a uno.
2. **Acción de la persona, no del sistema**. *"Quiero filtrar por categoría"* ✓. *"Quiero que el sistema filtre"* ✗.
3. **Beneficio visible desde fuera** — si no se puede explicar sin hablar de tecnología, la tarea no existe todavía. *"Para que cargue más rápido"* no califica como beneficio de negocio por sí solo.
4. **Encabezado de datos completo**: `id`, `titulo`, `bloque`, `prioridad`, `complejidad`, `estado`. Estado inicial siempre `borrador`.
5. **Sin criterios de aceptación en este paso** — dejar la sección como pendiente.
6. **Pasa el chequeo de calidad**: al cerrar, verificar las 6 preguntas de `revisar-tareas` y reportar cuáles fallan.

## Flujo

1. **Determinar el siguiente ID** mirando `docs/3-tareas/T-*.md`.
2. **Validar inputs**, completar lo que falte preguntando.
3. **Generar el archivo** desde la plantilla.
4. **Auto-chequeo**: marcar las cajas que puedas verificar solo (al menos "le importa a alguien", "es pequeña", "se puede comprobar").
5. **Reportar** el ID asignado y lo que falta confirmar.

## Ejemplos válidos

- *"Como estudiante de la plataforma, quiero buscar cursos por palabra clave y ver sugerencias mientras escribo, para encontrar rápido el curso que necesito sin recorrer todo el catálogo."*
- *"Como residente que usa la bicicleta a diario, quiero programar reservas que se repitan, para asegurar mi transporte a la hora de ir al trabajo."*

## Anti-ejemplos (rechazar y explicar por qué)

| Mal escrito | Qué le falta |
|---|---|
| *"Como usuario quiero que sea rápido"* | Persona genérica + beneficio no visible |
| *"Como admin quiero que el sistema actualice la base cada hora"* | Es un requisito técnico, no una tarea de producto |
| *"Quiero filtros"* | Falta quién y para qué |

Cuando rechaces, **no digas "inválido"**. Di: *"Esto suena más a una decisión técnica que a algo que alguien quiere lograr. ¿Quién se beneficia cuando esto exista, y en qué cambia su día?"*

## Handoff

- **Revisor**: el agente `revisor-de-tareas` hace la evaluación formal de calidad.
- **Siguiente paso**: `criterios-de-listo` para esta misma tarea.
