---
name: documento-de-idea
description: Escribe el documento que explica qué es tu producto, para quién es y por qué vale la pena. Actívala cuando el usuario diga "mi idea", "quiero documentar lo que quiero construir", "escribe el documento de mi producto", "no sé por dónde empezar" — y también cuando use el término técnico "PRD", "documento de requisitos" o "product requirements document". Produce `docs/1-la-idea/<slug>.md` con los 12 componentes obligatorios. Paso 1 de 5 (obligatorio, primero).
category: Producto
tags: [idea, producto, prd, requisitos, discovery]
---

# documento-de-idea

Escribe el documento de producto en `docs/1-la-idea/<slug>.md`. Es el **primer artefacto** y la fuente de verdad para todo lo que viene después (bloques, tareas, lista de trabajo).

**Cómo se llama esto en la industria:** un PRD (Product Requirements Document). Menciónalo una vez al usuario, sin repetirlo en cada mensaje.

## Contexto (fuente: METODO.md §1)

Un documento de producto válido tiene **12 componentes** (10 clásicos + 2 modernos: Non-goals y KPIs). Si lo va a consumir un agente de IA que programa, anexar la versión "fases secuenciales" en el Anexo A.

Variante **una-página** permitida en fase temprana — pero la entrega final requiere los 12.

## Inputs requeridos

Antes de escribir, asegúrate de tener (preguntar con `AskUserQuestion` lo que falte). **Pregunta en lenguaje cotidiano**, no con el nombre técnico del campo:

| Necesitas | Pregúntalo así |
|---|---|
| Nombre del producto | "¿Cómo se va a llamar?" |
| Problema concreto | "¿Qué problema le resuelve a la gente?" |
| Audiencia primaria | "¿Quién lo va a usar? Descríbeme a esa persona" |
| Objetivos medibles | "¿Cómo vas a saber que funcionó?" |
| Restricciones | "¿Hay algo que ya esté decidido? Presupuesto, fecha, tecnología que ya usas" |
| Modo | "¿Lo quieres rápido (una página) o completo?" |

Lee el `CLAUDE.md` del proyecto y la memoria tipo `project` para lo que `/empezar` ya capturó. **No repreguntes lo que ya sabes.**

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/documento-de-idea.template.md`

## Reglas duras (no negociables)

Estas reglas **no se relajan** porque el usuario no sea técnico. Son lo que hace que el documento sirva de verdad.

1. **Faltan componentes** → no se acepta. Los 12 deben aparecer (pueden llevar marcadores de pendiente, pero los títulos existen).
2. **Objetivos no medibles** → marcar y reescribir. "Mejorar la experiencia" no es medible; "que encontrar una cancha pase de 30 segundos a 10" sí. Si el usuario da un objetivo vago, **ayúdalo a concretarlo con una pregunta**, no lo rechaces de plano.
3. **Non-goals vacíos** → no se acepta. Traducción al usuario: *"¿Qué NO va a hacer tu producto? Esto es tan importante como lo que sí hace — evita que el equipo construya cosas que no querías."*
4. **Indicadores sin punto de partida ni meta** → marcar como pendiente. Mínimo: dónde estás hoy, a dónde quieres llegar, cuándo lo mides.
5. **Modo "para-agentes" sin fases secuenciales** → si el modo lo activa pero falta el Anexo A, no entregar.

## Flujo

1. **Detectar contexto**: leer `CLAUDE.md` y la memoria `project`. Identificar nombre, dominio, para quién es.
2. **Recopilar lo que falte** con `AskUserQuestion`. Máximo 4 preguntas por ronda.
3. **Generar borrador** desde la plantilla, sustituyendo `{{...}}` por valores reales o por `<!-- PENDIENTE: ... -->` si falta información.
4. **Aplicar las reglas duras** internamente. Lo que quede obviamente vacío o falso, marcarlo.
5. **Escribir** `docs/1-la-idea/<slug>.md`, con el slug derivado del nombre del producto.
6. **Resumir al usuario** en lenguaje natural qué quedó pendiente y cuál es el siguiente paso.

## Cómo reportar los huecos

No digas *"3 gaps en KPIs, 2 stakeholders sin nombrar"*. Di:

```
Listo, ya está el documento de tu producto.
→ docs/1-la-idea/reservas-canchas.md

Quedaron 2 cosas por definir, y las dejé marcadas:
· Cómo vas a medir si funcionó (pusiste "que la gente lo use",
  necesitamos un número)
· Quién decide si algo entra o no al producto

¿Las definimos ahora, o sigo con el siguiente paso y volvemos luego?
```

## Handoff

- **Revisor**: el agente `revisor-de-idea` audita el resultado.
- **Siguiente paso**: `agrupar-en-bloques` (o el orquestador `flujo-completo` si el usuario está en el flujo de `/documentar`).

## Memoria

- **NO** escribas memoria desde esta skill. La parametrización del proyecto ya la hizo `/empezar` con tipo `project`.
- Si el usuario da decisiones nuevas durante la redacción (ej. *"siempre incluye una sección de accesibilidad"*), sugiérele guardarlas en `CLAUDE.md`; no las guardes tú por tu cuenta.

## Variante "para un agente que programa"

Estructurar el cuerpo en **fases secuenciales**, donde cada fase declara:

```markdown
### Fase N: <título>
- **Depende de**: <Fase N-1 | nada>
- **Qué queda hecho**: <resultado verificable>
- **Alcance**: <qué SÍ; qué NO>
- **Tiempo estimado**: <5-15 min>
```

Ideal cuando el documento va a ser input directo de un agente de IA que escribe el código.
