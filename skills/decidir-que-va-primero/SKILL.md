---
name: decidir-que-va-primero
description: Ordena la lista de trabajo decidiendo qué se construye primero y qué puede esperar. Por defecto usa "Debe / Debería / Podría / Ahora no". Actívala cuando el usuario diga "qué hago primero", "ordena esto por importancia", "no sé por dónde empezar", "qué es lo más urgente" — y también cuando use el término técnico "priorizar", "priorización", "MoSCoW", "RICE", "valor-esfuerzo" o "Eisenhower". Escribe `docs/5-que-va-primero/<metodo>-<fecha>.md` y reordena `docs/4-lista-de-trabajo/lista.md`. Paso 5 de 5.
category: Producto
tags: [prioridad, orden, moscow, rice, decisiones]
---

# decidir-que-va-primero

Aplica un método de priorización a la lista de trabajo, deja registro de la sesión en `docs/5-que-va-primero/`, y reordena `docs/4-lista-de-trabajo/lista.md` **solo si el usuario aprueba**.

**Cómo se llama esto en la industria:** priorización del backlog.

## Contexto (fuente: METODO.md §7)

Siete cosas a considerar al decidir: valor para el negocio, urgencia, de qué depende, cuánto cuesta, qué riesgos tiene, qué pide la gente que lo usa, y qué tan madura está la tecnología.

### Método por defecto: Debe / Debería / Podría / Ahora no

En la industria se llama **MoSCoW**. Preséntalo siempre en español:

| Categoría | Qué significa | Cuánto del total |
|---|---|---|
| **Debe** | Sin esto el producto no sirve | ≤ 60% |
| **Debería** | Importante, pero no lo hunde | ~20% |
| **Podría** | Estaría bien si sobra tiempo | ~20% |
| **Ahora no** | Decidido explícitamente que no va en esta vuelta | el resto |

**Regla clave:** si todo es "Debe", no se priorizó nada. Reabrir la conversación.

La categoría "Ahora no" es la más valiosa y la que más cuesta usar. Explícaselo al usuario: *"Decir 'esto no va ahora' por escrito es lo que evita que el proyecto se estire sin control. No es descartar; es decidir cuándo."*

### Otros métodos (solo si el usuario los pide)

**RICE** — `Puntaje = (Alcance × Impacto × Confianza) / Esfuerzo`
- Impacto: 0.25, 0.5, 1, 2, 3 · Confianza: 100, 80, 50, 20 (%) · Esfuerzo: en meses-persona.

**Valor / Esfuerzo** — matriz 2×2. Orden: ganancias rápidas → apuestas grandes → arreglos → descartar.

**Urgente / Importante** (Eisenhower) — 4 cuadrantes: hacer / planificar / delegar / eliminar.

**Estimación con cartas** (Planning Poker) — no es priorización sino estimación. Fibonacci, voto privado, quien se desvía explica, converger en 2 rondas. Úsalo solo si no está clara la complejidad.

## Inputs requeridos

- Método. Si no se especifica: leer memoria `project`; si no hay nada, **usar el método por defecto sin preguntar**. Ofrecer los otros solo si el usuario muestra interés.
- Quiénes participaron en la decisión (para el encabezado del archivo).
- Si es RICE: las 4 estimaciones por tarea. Si faltan, pedirlas o sugerir una sesión aparte.

## Plantilla

`${CLAUDE_PLUGIN_ROOT}/templates/artefactos/prioridad.template.md`

## Reglas duras

1. **El método se aplica completo, no a medias.** Con el método por defecto: toda tarea cae en una de las 4 categorías. Ninguna queda sin clasificar.
2. **Reparto sano**:
   - "Debe" ≤ 60% del esfuerzo total. Si lo supera, **advertir explícitamente**.
   - RICE: las 3 primeras deben puntuar ≥ 2× el promedio del resto. Si no, el orden no está aportando información.
3. **Los desacuerdos se registran.** Si en la conversación hubo discrepancia, queda escrita en "Dudas y desacuerdos".
4. **Cada sesión deja fecha tentativa** para la próxima revisión.
5. **La lista se reordena solo con aprobación explícita.** Nunca automático.

## Flujo

1. **Detectar el método** (memoria → por defecto).
2. **Cargar la lista** actual y todas las tareas con sus datos.
3. **Recorrer las tareas** preguntando lo que el método necesite. Con el método por defecto, la pregunta es simple: *"Si esto no existe, ¿el producto sirve igual?"*
4. **Agrupar o calcular** según el método.
5. **Escribir** `docs/5-que-va-primero/<metodo>-<AAAA-MM-DD>.md`.
6. **Mostrar el resultado** y preguntar si reordena la lista.
7. Si aprueba: reordenar las filas de `lista.md` y actualizar la columna de prioridad.

## Cómo reportar

```
Así queda tu orden de trabajo:

  DEBE (6 tareas)  — sin esto no hay producto
    T-001 · Buscar canchas por zona
    T-003 · Reservar una franja horaria
    ...

  DEBERÍA (4)      — importante, pero se puede lanzar sin ello
  PODRÍA (3)       — si sobra tiempo
  AHORA NO (1)     — decidido: no en esta vuelta
    T-014 · Programa de puntos y recompensas

⚠ Ojo: el "Debe" se llevó el 71% del esfuerzo. Eso suele
  significar que algo de ahí en realidad es "Debería".
  ¿Lo revisamos juntos?
```

## Handoff

- **Revisor**: el agente `revisor-de-prioridades` verifica que el método se aplicó bien.
- **Siguiente paso**: construir. La lista ordenada es lo que un equipo usa para arrancar.

## Anti-patrones

- Decir "RICE" y asignar números a ojo sin fórmula → eso no es RICE.
- Tener el archivo de prioridades pero no reordenar la lista → no sirvió de nada.
- Re-priorizar cada semana sin construir nada → señal de parálisis, no de rigor.
