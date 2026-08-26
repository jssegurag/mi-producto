---
id: T-{{ID}}
titulo: {{TITULO}}
bloque: B-{{BLOQUE_ID}}
prioridad: {{PRIORIDAD}}      # Debe | Debería | Podría | Ahora-no
complejidad: {{COMPLEJIDAD}}  # S | M | L
estado: borrador              # borrador | lista | en-curso | hecha
---

# {{TITULO}}

## Qué se quiere hacer

Como **{{ROL}}**,
quiero **{{ACCION}}**,
para **{{BENEFICIO}}**.

## Por qué

<!-- 1-3 frases: qué motiva esta tarea y en qué momento del recorrido encaja -->

## Cómo se comprueba que está lista

<!--
Estos son los criterios de aceptación. Si haces lo que dice el "Cuando"
y pasa lo que dice el "Entonces", la tarea está bien hecha.
En la industria a esto se le llama Given/When/Then o Gherkin.
-->

### Escenario 1 — Caso normal: {{ESCENARIO_NORMAL_TITULO}}
- **Dado que** {{NORMAL_DADO}}
- **Cuando** {{NORMAL_CUANDO}}
- **Entonces** {{NORMAL_ENTONCES}}

### Escenario 2 — Caso de error: {{ESCENARIO_ERROR_TITULO}}
- **Dado que** {{ERROR_DADO}}
- **Cuando** {{ERROR_CUANDO}}
- **Entonces** {{ERROR_ENTONCES}}

### Escenario 3 — Caso raro: {{ESCENARIO_RARO_TITULO}}
- **Dado que** {{RARO_DADO}}
- **Cuando** {{RARO_CUANDO}}
- **Entonces** {{RARO_ENTONCES}}

<!-- Opcional: escenarios 4 y 5. Nunca más de 5 — si los necesitas, la tarea es demasiado grande: divídela. -->

## Notas para quien construya (opcional)

<!-- Pistas útiles: integraciones, rendimiento, accesibilidad, cosas ya decididas -->

## Las 6 preguntas de calidad

<!-- En la industria estos son los criterios INVEST -->

- [ ] **¿Se puede hacer sola?** — se construye sin esperar a que otra esté lista
- [ ] **¿Deja decidir el cómo?** — el "qué" es fijo; el "cómo" lo decide quien construye
- [ ] **¿Le importa a alguien?** — el beneficio se ve desde fuera, no es solo técnico
- [ ] **¿Se puede calcular?** — quien construye sabe más o menos cuánto le cuesta
- [ ] **¿Es pequeña?** — cabe en unos pocos días de trabajo
- [ ] **¿Se puede comprobar?** — los criterios de arriba se pueden verificar uno por uno
