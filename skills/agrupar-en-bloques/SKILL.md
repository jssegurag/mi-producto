---
name: agrupar-en-bloques
description: Parte el documento de producto en bloques grandes de trabajo, cada uno conectado a un objetivo. Actívala cuando el usuario diga "divide esto en partes", "en qué se compone mi producto", "agrupa el trabajo", "cuáles son las piezas grandes" — y también cuando use el término técnico "épicas", "epics" o "descomponer el PRD". Lee `docs/1-la-idea/` y escribe `docs/2-el-recorrido/bloques.md` con IDs `B-XXX`. Paso 2a de 5 (obligatorio).
category: Producto
tags: [bloques, epicas, partes, trazabilidad, discovery]
---

# agrupar-en-bloques

Toma el documento de producto (`docs/1-la-idea/<slug>.md`) y produce los bloques en `docs/2-el-recorrido/bloques.md`. Cada bloque se conecta explícitamente a uno o más objetivos del documento.

**Cómo se llama esto en la industria:** épicas (*epics*). Un bloque = una épica.

## Contexto (fuente: METODO.md §2)

La jerarquía completa es: **Plan general → Bloque → Tarea → Ticket**
(en la industria: *Roadmap → Épica → Historia de Usuario → Ticket*).

- Un bloque es una agrupación grande de trabajo. Se desglosa en varias tareas.
- Tiene ID propio `B-XXX` (3 dígitos).

**Regla dura de conexión**: todo bloque cubre ≥ 1 objetivo del documento. Todo objetivo del documento es cubierto por ≥ 1 bloque.

## Inputs requeridos

- Documento de producto en `docs/1-la-idea/`. Si no existe, dile al usuario: *"Primero necesito el documento de tu idea — ¿lo escribimos?"* y activa `documento-de-idea`.

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/bloques.template.md`

## Reglas duras

1. **Cobertura en los dos sentidos**: cada bloque → ≥1 objetivo; cada objetivo → ≥1 bloque. Reportar los que queden sueltos.
2. **Tamaño parecido**: los bloques deben ser comparables. Si uno es 10× más grande que otro, partirlo.
3. **Sin solapes**: dos bloques no cubren lo mismo. Si lo hacen, rehacerlos.
4. **IDs únicos y correlativos**: `B-001`, `B-002`, … Sin saltos, sin reutilizar.
5. **Cómo se sabe que está listo**: cada bloque declara algo medible para cuando esté completo.

## Flujo

1. **Leer el documento** de producto. Extraer objetivos, funcionalidades e indicadores.
2. **Identificar agrupaciones naturales**: las funcionalidades suelen mapear casi 1:1 a bloques; los objetivos suelen ser transversales y pueden requerir bloques que los crucen.
3. **Generar bloques** con IDs correlativos: título, resumen, por qué importa, objetivos que cubre, funcionalidades incluidas, cómo se sabe que está listo.
4. **Validar la conexión** internamente: matriz Bloque × Objetivo.
5. **Escribir** `docs/2-el-recorrido/bloques.md`.
6. **Reportar** lo que quedó suelto, en lenguaje natural.

## Cómo reportar

```
Tu producto se divide en 4 bloques grandes:

  B-001 · Buscar y encontrar        → objetivos 1 y 2
  B-002 · Reservar                  → objetivo 3
  B-003 · Pagar                     → objetivos 3 y 4
  B-004 · Administrar y ver reportes → objetivo 4

Todos tus objetivos quedaron cubiertos. ✓
```

Si algo queda suelto, dilo así: *"El objetivo 'reducir llamadas al soporte' no lo cubre ningún bloque. O falta una parte del producto, o ese objetivo se logra de otra forma. ¿Lo revisamos?"*

## Handoff

- **Revisor**: el agente `revisor-de-bloques` confirma cobertura y tamaño.
- **Siguiente paso**: `mapa-del-recorrido` (mismo paso 2, segunda mitad).
