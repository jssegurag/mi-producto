---
name: mapa-del-recorrido
description: Dibuja el recorrido completo que hace una persona al usar tu producto, de principio a fin, y marca qué parte se construye primero. Actívala cuando el usuario diga "cómo lo usaría la gente", "el paso a paso del usuario", "qué construyo primero", "cuál es el mínimo para lanzar" — y también cuando use el término técnico "user story map", "story mapping", "mapa de historias", "MVP" o "backbone". Escribe `docs/2-el-recorrido/mapa.md`. Paso 2b de 5 (obligatorio).
category: Producto
tags: [recorrido, mapa, mvp, journey, story-map]
---

# mapa-del-recorrido

Produce `docs/2-el-recorrido/mapa.md`: el recorrido del usuario en orden cronológico, con las tareas colgando de cada momento y una línea que marca qué entra en la primera versión.

**Cómo se llama esto en la industria:** User Story Map, técnica de Jeff Patton.

## Contexto (fuente: METODO.md §5)

Evita la "lista plana" donde se pierde la narrativa de qué hace la gente. Tres elementos:

1. **El recorrido (eje X)** — los momentos por los que pasa el usuario, en orden.
2. **Eje Y** — las tareas bajo cada momento, ordenadas por importancia.
3. **Líneas de versión** — cortes horizontales que separan la primera versión de las siguientes.

## Inputs requeridos

- Documento de producto (para extraer el recorrido).
- `docs/2-el-recorrido/bloques.md` ya generado.
- (Opcional) Lista preliminar de tareas si ya existen.

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/mapa.template.md`

## Reglas duras

1. **El recorrido está completo** — desde la primera vez que la persona toca el producto hasta que logra lo que quería. Sin saltos.
2. **Cada momento tiene ≥ 1 tarea** en alguna versión. Un momento vacío significa que ahí no hay nada construido y el usuario se queda atascado.
3. **Línea de primera versión explícita** — tiene que existir un corte claro. Sin eso, el mapa no sirve para decidir.
4. **Las tareas se referencian por ID** (`T-XXX`). Si aún no existen, el mapa las anticipa reservando el ID.

## Flujo

1. **Leer el documento** de producto y extraer el recorrido de la persona principal.
2. **Construir el recorrido**: 3-7 momentos en orden cronológico. Si salen más, agrupar.
3. **Colgar tareas** de cada momento; donde falten, reservar ID y marcar como pendiente.
4. **Definir la primera versión** explicando por qué: *qué es lo mínimo para que la persona complete el recorrido de punta a punta*.
5. **Detectar huecos**: momentos con poca cobertura.
6. **Escribir** `docs/2-el-recorrido/mapa.md`.

## Cómo explicar la primera versión al usuario

Esta es la parte de más valor de todo el método. Explícala así:

> La línea que dibujé separa lo que construyes **primero** de lo que puede esperar.
> El criterio no es "lo más fácil" ni "lo más bonito", sino: **¿con esto una persona
> puede recorrer todo el camino de principio a fin?** Aunque sea de forma básica.
>
> Media función que no deja terminar el recorrido no sirve de nada. Una versión
> básica que sí lo deja terminar, ya se puede probar con gente real.

## Handoff

- **Revisor**: el agente `revisor-del-recorrido` verifica que el mapa cubre el recorrido del documento.
- **Siguiente paso**: `escribir-tarea` para cada tarea anticipada en el mapa.

## Formato

Tabla Markdown (más portable que un diagrama para este caso). Una columna por momento del recorrido, filas agrupadas por versión con un separador visual entre versiones.
