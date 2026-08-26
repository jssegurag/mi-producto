# CLAUDE.md — docs/3-tareas/

Reglas locales para editar tareas y sus criterios. El método completo está en `METODO.md` §3 y §4.

## Archivos

Una tarea por archivo: `T-XXX-<slug>.md` (3 dígitos, minúsculas-con-guiones).

## Reglas que no se negocian

1. **Encabezado de datos completo**: `id, titulo, bloque, prioridad, complejidad, estado`. Estado inicial siempre `borrador`.
2. **Formato canónico**: `Como [persona específica], quiero [acción concreta], para [beneficio visible]`. Una persona genérica ("el usuario") se rechaza.
3. **Criterios en Dado que / Cuando / Entonces**: 3-5 escenarios cubriendo caso normal + error + caso raro. "Dado que" = situación; "Cuando" = una sola acción; "Entonces" = algo observable.
4. **Pasa las 6 preguntas de calidad** antes de marcar `estado: lista`.

## Skills y revisores

- Skills: `escribir-tarea`, `criterios-de-listo`, `revisar-tareas`
- Revisores: `revisor-de-tareas`, `revisor-de-criterios`, `revisor-de-conexiones`

## Qué NO va aquí

Bloques (en `docs/2-el-recorrido/`), el orden (en `docs/5-que-va-primero/`), diagramas (en `docs/6-pantallas/`).
