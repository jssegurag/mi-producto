---
name: "Documentar"
description: Convierte tu idea en documentos completos, paso a paso, parando para que apruebes cada uno. Es el comando principal.
category: Producto
tags: [documentar, flujo, completo]
---

Atajo a la skill **`flujo-completo`**. Recorre los 5 pasos que van de la idea a la lista de trabajo ordenada.

**Entrada opcional** (después del comando): una descripción de la idea, si el usuario no ha corrido `/empezar`.

---

## Antes de arrancar

1. **¿Existe `docs/.progreso.json`?** Léelo y pregunta:
   - *"Veo que ya habías avanzado hasta [paso]. ¿Seguimos desde ahí, o empezamos de cero?"*
   - Si empieza de cero: mover el archivo viejo a `docs/.progreso.json.bak` con la fecha.

2. **¿Existe `docs/1-la-idea/`?** Si no, el proyecto no está preparado. Ofrece hacerlo ahora mismo, sin mandar al usuario a otro comando:
   > *"Todavía no hemos preparado este proyecto. Lo hago ahora en 10 segundos y seguimos."*

   Prepara las carpetas igual que `/empezar` y continúa.

3. **Si no hay nada previo**, arranca desde el paso 1.

Después, **activa la skill `flujo-completo`**. Ella se encarga del orden, los checkpoints y de guardar el avance.

---

## Los 5 pasos

| # | Paso | Qué produce |
|---|---|---|
| 1 | La idea | El documento que explica el producto |
| 2 | El recorrido | En qué bloques se divide y el camino del usuario |
| 3 | Las tareas | Cada cosa a construir, con sus criterios |
| 4 | La lista | Todo junto, en una tabla |
| 5 | Qué va primero | El orden, y por qué |

Al terminar, **ofrece** el extra opcional: los diagramas de pantallas.

---

## Cómo se ve un checkpoint

Después de cada paso, para y muestra:

```
✓ Listo 1 de 5: la idea de tu producto
  → docs/1-la-idea/reservas-canchas.md

  <2-3 líneas contando qué dice el documento, con palabras
   del usuario, no del método>

  Lo revisé. Hay 2 cosas que conviene aclarar:
  · No dice cómo vas a saber si funcionó
  · Falta qué NO va a hacer el producto

  ¿Las arreglamos, sigo adelante, o paramos aquí?
```

- **arreglar** → volver a la skill del paso actual para corregir.
- **seguir** → guardar el avance y pasar al siguiente.
- **parar** → guardar el avance y cerrar con un resumen de dónde quedó todo.

---

## Reglas

- **Nunca uses jerga en un checkpoint.** Nada de "issues bloqueantes", "gaps", "validación del agente revisor", "artefacto generado". Di qué falta y por qué importa, en una frase que se entienda.
- **No avances si hay algo que rompe lo que viene.** Ejemplo: si los objetivos no se pueden medir, los siguientes pasos heredan el problema. Pausa y explica por qué en una frase.
- **Guarda el avance siempre**, incluso si el usuario se va a mitad.
- **Si el usuario quiere saltarse un paso**, explica en una frase para qué sirve y déjalo saltar si insiste. No lo bloquees ni le des un sermón.
- **Si van a salir más de 8 tareas**, ofrece hacerlas de corrido: *"Son unas 12 tareas. ¿Las escribo todas y las revisamos juntas al final, o prefieres irlas viendo de a una?"*
- **Cada mensaje termina con una pregunta concreta.** El usuario nunca debe quedarse sin saber qué sigue.
