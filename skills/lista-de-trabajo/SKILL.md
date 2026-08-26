---
name: lista-de-trabajo
description: Junta todas las tareas en una sola lista ordenada, de lo primero a lo último. Actívala cuando el usuario diga "muéstrame todo junto", "hazme la lista completa", "qué hay que hacer en total", "consolida las tareas" — y también cuando use el término técnico "backlog", "product backlog" o "consolidar el backlog". Lee `docs/3-tareas/T-*.md` y escribe `docs/4-lista-de-trabajo/lista.md`. Paso 4 de 5 (obligatorio).
category: Producto
tags: [lista, backlog, consolidacion, trazabilidad]
---

# lista-de-trabajo

Lee `docs/3-tareas/T-*.md` y produce `docs/4-lista-de-trabajo/lista.md`: una tabla con todo, en orden.

**Cómo se llama esto en la industria:** el backlog (*product backlog*).

## Contexto (fuente: METODO.md §6)

> La lista de trabajo es una lista **ordenada** de todo lo que hay que hacer. Sin orden no es una lista de trabajo, es un montón de notas.

El orden es lo que la hace útil. Un equipo mira la primera fila y sabe qué hacer.

## Inputs requeridos

- (Implícito) Las tareas en `docs/3-tareas/`.
- (Opcional) Si ya existe `lista.md`, **preservar el orden previo** y añadir las tareas nuevas al final con prioridad provisional. No reordenar por tu cuenta.

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/lista.template.md`

## Reglas duras

1. **Toda tarea en estado `lista`, `en-curso` o `hecha` aparece.** Las que están en `borrador` también aparecen, pero claramente marcadas como tales.
2. **Columnas obligatorias**: `#`, `ID`, `Título`, `Bloque`, `Prioridad`, `Complejidad`, `Estado`, `Criterios`, `Notas`.
3. **El orden de las filas ES la priorización vigente.** Esta skill **no inventa prioridades** — de eso se encarga `decidir-que-va-primero`. Si aún no hay priorización, ordenar por ID y decirlo explícitamente.
4. **Resumen de conexiones al final**: bloque → tareas que contiene.

## Flujo

1. **Buscar `docs/3-tareas/T-*.md`**, leer el encabezado de datos y contar los criterios de cada una.
2. **Detectar lista previa**. Si existe, preservar el orden y añadir las nuevas al final con prioridad "?".
3. **Generar la tabla** desde la plantilla.
4. **Generar el resumen**: totales por estado, y qué tareas cuelgan de cada bloque.
5. **Reportar inconsistencias**: tareas sin bloque asignado, bloques sin ninguna tarea, tareas que ya no están en borrador pero siguen sin criterios.

## Cómo reportar

```
Tu lista de trabajo tiene 14 tareas.

  Listas para construir     8
  Todavía en borrador       6

Dos cosas que conviene mirar:
· T-009 no pertenece a ningún bloque — quedó suelta
· El bloque B-004 (Reportes) no tiene ninguna tarea todavía

Todavía no están ordenadas por importancia. ¿Las ordenamos?
```

## Handoff

- **Revisor**: el agente `revisor-de-conexiones` verifica la cadena criterio → tarea → bloque → objetivo.
- **Siguiente paso**: `decidir-que-va-primero` cuando el usuario quiera ordenarlas.

## Notas

- Aquí **no se prioriza**. Esta skill solo junta y ordena según lo ya decidido.
- Una tarea sin bloque se marca como "suelta" y se sugiere corregirla.
- Una tarea sin criterios que ya no está en borrador es una inconsistencia: repórtala.
