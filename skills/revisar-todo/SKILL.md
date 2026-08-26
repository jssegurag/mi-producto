---
name: revisar-todo
description: Revisa todos los documentos del proyecto de una vez y entrega un único informe de qué está bien y qué falta. Actívala cuando el usuario diga "está bien todo esto", "revísame todo", "puedo enseñar esto", "antes de mandárselo a alguien" — y también con los términos técnicos "auditoría", "quality gate" o "revisión de calidad". Lee todo `docs/` y escribe el informe en `docs/.revisiones/`. Solo se activa cuando el usuario lo pide; nunca por su cuenta.
category: Calidad
tags: [revision, calidad, auditoria, informe]
---

# revisar-todo

Revisa todos los documentos despachando a los agentes revisores en paralelo. Es el chequeo completo antes de enseñarle el trabajo a alguien.

## Inputs requeridos

Ninguno. Si el usuario acota (*"solo las tareas"*), restringir a eso.

## Reglas duras

1. **Despachar en paralelo** todos los agentes que apliquen al estado actual del proyecto.
2. **Un solo informe** para el usuario, no uno por agente. El detalle va a `docs/.revisiones/<fecha-hora>-<agente>.md`.
3. **Ordenar por gravedad**: bloqueante / importante / menor / sugerencia.
4. **Cada hallazgo trae qué hacer**: qué archivo tocar y cómo arreglarlo.

## Flujo

1. **Inventariar** lo que existe: documento de producto, bloques, mapa, tareas con y sin criterios, lista de trabajo, prioridades, pantallas.
2. **Despachar los agentes** que apliquen:

   | Si existe | Agente |
   |---|---|
   | Documento de producto | `revisor-de-idea` |
   | Bloques | `revisor-de-bloques` |
   | Mapa del recorrido | `revisor-del-recorrido` |
   | Tareas | `revisor-de-tareas` |
   | Tareas con criterios | `revisor-de-criterios` |
   | Siempre | `revisor-de-conexiones` |
   | Prioridades | `revisor-de-prioridades` |
   | Pantallas | `revisor-de-pantallas` |

3. **Recoger y consolidar** los informes.
4. **Escribir** `docs/.revisiones/<AAAAMMDD-HHMMSS>-informe.md`.
5. **Resumir al usuario** los 3-5 puntos más importantes y ofrecer arreglarlos.

## Cómo presentar el informe

Usa un semáforo, no una lista de severidades técnicas:

```
## Revisión completa

🟢 Bien
   · Tu documento de producto tiene las 12 partes
   · Las 14 tareas están conectadas a un bloque
   · Todos los objetivos están cubiertos

🟡 Conviene arreglar
   · 3 tareas no tienen criterios de aceptación (T-009, T-011, T-012)
     → Sin eso nadie sabe cuándo están terminadas
   · El bloque B-004 no tiene ninguna tarea todavía

🔴 Hay que arreglar antes de enseñarlo
   · El objetivo "reducir llamadas al soporte" no lo cubre nada
     → O falta una parte del producto, o ese objetivo sobra

¿Empiezo por lo rojo?
```

## Handoff

- No hay siguiente paso automático — el usuario decide qué corregir primero.
- Ofrecer activar la skill correspondiente para cada arreglo.

## Cuándo usarlo

- Antes de enseñarle el trabajo a un equipo técnico o a un inversor.
- Después de cambiar el documento de producto (para revalidar que todo sigue conectado).
- Cada cierto tiempo, si el proyecto lleva semanas activo.
