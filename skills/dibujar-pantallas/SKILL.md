---
name: dibujar-pantallas
description: Dibuja el camino que recorre una persona por las pantallas del producto, como diagramas, uno por bloque. Actívala SOLO si el usuario lo pide explícitamente diciendo "dibuja las pantallas", "cómo se navega", "haz los diagramas", "el paso a paso por la app" — o los términos técnicos "flows", "user flows", "flujos de navegación" o "diagramas de secuencia". Escribe `docs/6-pantallas/B-XXX-<slug>.md` en Mermaid. Paso 6, OPCIONAL y posterior al flujo principal — no se activa sola durante la edición de otros documentos.
category: Producto
tags: [pantallas, navegacion, flows, mermaid, diagramas]
---

# dibujar-pantallas

Genera un diagrama por bloque en `docs/6-pantallas/B-XXX-<slug>.md`. Cada diagrama describe cómo navega la persona, y **cada paso está respaldado por un criterio de aceptación ya escrito**.

**Cómo se llama esto en la industria:** user flows / flujos de navegación.

## Contexto (fuente: METODO.md §5a)

El mapa del recorrido cubre **los momentos en orden cronológico**. Los criterios de listo cubren **situación-acción-resultado por escenario**. Pero ninguno de los dos describe el **mapa de navegación** entre pantallas ni las ramas de error de forma completa. Esto cierra ese hueco.

**Granularidad:** un archivo por bloque. **Posición:** al final, opcional.

## Inputs requeridos (en este orden)

1. `docs/1-la-idea/<slug>.md` — objetivos, alcance y **quiénes participan** (única fuente válida de actores).
2. `docs/2-el-recorrido/bloques.md` — los `B-XXX` que delimitan los diagramas.
3. `docs/3-tareas/T-*.md` — datos y criterios (cada paso del diagrama se respalda con un criterio).
4. `docs/2-el-recorrido/mapa.md` — para entender el orden.

Si **falta cualquiera**, **detenerse** y reportarlo. **No inventar pasos.**

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/pantallas.template.md`

## Reglas duras

1. **Cada paso del diagrama corresponde a un criterio existente.** En el diagrama, cada flecha lleva `%% T-XXX` como comentario justo antes. Sin esa marca, el paso se considera inventado.
2. **Cero pasos sin respaldo.** Si el diagrama necesita una transición que ningún criterio cubre, **detenerse**, reportar el hueco y proponer escribir ese criterio primero.
3. **Solo actores que aparezcan en el documento de producto.** Un actor inventado invalida el diagrama.
4. **Cobertura por diagrama**: camino normal + ≥1 rama de error + ≥1 caso raro.
5. **Cobertura por bloque**: toda tarea que declare `bloque: B-XXX` debe aparecer al menos una vez en su diagrama. Si no aparece, reportarlo.
6. **El diagrama tiene que ser válido.** `sequenceDiagram` cuando hay ida y vuelta entre persona y sistema; `flowchart TD` cuando dominan las decisiones. No mezclar los dos en un mismo bloque.
7. **No sobrescribir sin confirmar.** Si el archivo ya existe: preguntar (mantener / rehacer / comparar).

## Flujo

1. **Verificar** que existan los 4 inputs.
2. **Listar bloques** y, para cada uno, identificar sus tareas.
3. **Para cada bloque**:
   1. Extraer los actores del documento de producto.
   2. Reunir tareas y criterios de ese bloque.
   3. Elegir el tipo de diagrama.
   4. Construir el camino: normal + error + raro.
   5. Anotar cada flecha con `%% T-XXX`.
   6. Validar que no quedó ninguna tarea fuera.
   7. Escribir `docs/6-pantallas/B-XXX-<slug>.md`.
4. **Reportar** por diagrama: qué tareas cubre y qué huecos quedaron.

## Handoff

- **Revisor**: el agente `revisor-de-pantallas`.
- Se complementa con `revisor-de-conexiones` (que cubre criterio→tarea→bloque→objetivo), no lo duplica.

## Anti-patrones

- Un solo diagrama gigante con todo el producto → crece sin control y deja de ser legible.
- Inventar pasos que "tienen sentido" pero no tienen criterio detrás → rompe la trazabilidad, que es justamente la razón de ser de esta skill.
- Usar imágenes o dibujos ASCII → el resultado es texto versionable y auditable. Los diagramas son el contrato.
