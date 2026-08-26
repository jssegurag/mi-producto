# METODO.md — el método completo

> Este es el manual de referencia. Aquí se usan los **términos técnicos de la industria**, a propósito: si algún día quieres hablar de tú a tú con un equipo de producto, este es el vocabulario.
>
> No necesitas leerlo para usar el plugin. Está aquí para cuando quieras entender el porqué de una regla, o llevar la conversación más lejos.
>
> Las skills y los agentes citan las secciones de este documento por número. **Si una skill contradice este método, gana el método.**

## Equivalencias rápidas

| Como lo llama el plugin | Como se llama en la industria |
|---|---|
| La idea | PRD (Product Requirements Document) |
| Bloques | Épicas (*epics*) |
| El recorrido / mapa | User Story Map (Jeff Patton) |
| Tareas | Historias de usuario (*user stories*) |
| Criterios de listo | Acceptance Criteria (Given/When/Then, BDD) |
| Las 6 preguntas de calidad | INVEST |
| Lista de trabajo | Backlog |
| Debe / Debería / Podría / Ahora no | MoSCoW |
| Pantallas | User flows |
| Primera versión | MVP |

El proceso:

```
PRD  →  User Story Map  →  Historias de Usuario (con AC G/W/T)  →  Backlog  →  Priorización  →  Flows (opcional)
```

---

## 1. PRD — 12 componentes obligatorios

Un PRD válido contiene los **10 componentes clásicos** + **2 modernos**:

### Clásicos (1-10)
1. **Introducción y Objetivos** — problema, contexto, qué se pretende lograr.
2. **Stakeholders** — quiénes patrocinan, quiénes usan, quiénes reciben impacto.
3. **Historias de Usuarios** — perfiles + necesidades de alto nivel (se detallan luego en backlog).
4. **Componentes Principales y Sitemaps** — bloques del sistema y navegación si aplica.
5. **Características y Funcionalidades** — feature list ordenada por capability.
6. **Diseño y Experiencia del Usuario** — principios UX, accesibilidad, restricciones de marca.
7. **Requisitos Técnicos** — stack, integraciones, performance, seguridad, no-funcionales.
8. **Planificación del Proyecto** — fases, hitos, dependencias, equipo.
9. **Criterios de aceptación** — definición de "done" a nivel producto.
10. **Apéndices y Recursos Adicionales** — investigación, benchmarks, mockups, referencias.

### Modernos (11-12)
11. **Non-goals / Fuera de alcance** — qué el producto **no** hará en esta iteración. Tan importante como lo que hará.
12. **Métricas de éxito (KPIs)** — indicadores cuantitativos (adopción, NPS, tiempo de tarea, ingresos, retención).

**Variante "One-Pager PRD"** (fase temprana): puede arrancar solo con (1), (2), (3), (12). Se extiende a los 12 conforme el proyecto madura. No es excusa para entregar sin los 12 en revisión final.

### PRD optimizado para agentes de IA (cuando aplica)

Si el PRD será consumido por un agente de coding (Claude Code / Cursor / similar), estructurar el cuerpo principal como **fases secuenciales** donde cada fase tiene:

- **Dependencias explícitas** ("Fase 4 requiere el contexto de Fase 3").
- **Resultados verificables** ("Fase 2 termina con endpoint de subida funcional").
- **Alcance acotado** ("Fase 6 no modifica el schema de BD").
- **Estimación de tiempo del agente** (5-15 min por fase).

Esta forma convierte el PRD en input directo de un workflow agéntico. La "intención" es la fuente de verdad, no el código generado.

### Ecosistema de configuración

El PRD convive con (no reemplaza):
- `CLAUDE.md` — instrucciones persistentes del proyecto para Claude Code.
- `.cursor/rules/` — reglas si el equipo usa Cursor.
- `AGENTS.md` — estándar para coding agents.
- Skills — paquetes de conocimiento procedimental (lo que es esta vertical).

---

## 2. Taxonomía Agile

```
Product Roadmap                    ← plan estratégico de alto nivel (visión + dirección)
   │
   └── Épica                       ← agrupación grande, parte del roadmap, se desglosa en historias
         │
         └── Historia de Usuario   ← feature desde la perspectiva del usuario final, 1 sprint
               │
               └── Ticket          ← tarea concreta (bug, dev, test), parte de una historia
```

| Nivel | Definición operativa |
|---|---|
| **Roadmap** | Comunica objetivos y prioridades a largo plazo. Guía decisiones estratégicas. |
| **Épica** | Iniciativa o capability importante. Se descompone en múltiples historias. Tiene ID propio (`B-XXX`). |
| **Historia de Usuario** | Descripción corta y simple de una característica desde la perspectiva del usuario. Cabe en 1 sprint (idealmente 2-4 días). Tiene ID propio (`T-XXX`). |
| **Ticket** | Acción concreta: bug, refactor, test, integración. Vive en herramientas tipo Jira/Linear/GitHub Issues. |

---

## 3. Historia de Usuario

### Formato estándar (no negociable)

```
Como [tipo de usuario], quiero [realizar una acción] para [obtener un beneficio].
```

**Reglas**:
- El "tipo de usuario" debe ser **un rol específico**, no "usuario" genérico.
- La "acción" es lo que el usuario hace, no lo que el sistema hace.
- El "beneficio" es valor externo y visible — si no se puede explicar, la historia no debería existir.
- Storytelling > especificación técnica. Si hay un buyer persona definido, anclar el rol a él.

### Frontmatter YAML obligatorio

Toda historia (`docs/3-tareas/T-XXX.md`) lleva:

```yaml
---
id: T-XXX
titulo: <titulo descriptivo>
epica: B-XXX
prioridad: <Must|Should|Could|Won't  o  P0|P1|P2|P3  o  score numérico según framework>
complejidad: <S|M|L  o  story points>
estado: <draft|lista|en-curso|hecha>
---
```

### Criterios INVEST (los 6)

Toda historia debe pasar las 6 letras antes de `estado: lista`:

| Letra | Significado | Test rápido |
|---|---|---|
| **I — Independent** | Se puede desarrollar y entregar sin depender de otras historias. | ¿Puedo planearla en cualquier sprint? |
| **N — Negotiable** | No es contrato rígido. El "qué" es fijo; el "cómo" se negocia (3 Cs de Ron Jeffries: Card, Conversation, Confirmation). | ¿Hay espacio para que el equipo discuta el cómo? |
| **V — Valuable** | Entrega valor externo y visible al usuario o negocio. | Si la cuento al cliente, ¿le importa? |
| **E — Estimable** | El equipo puede estimar con razonable confianza. | ¿Sé cuánto cuesta? |
| **S — Small** | Cabe en 1 sprint (idealmente 2-4 días). Si es más grande, dividir en **slices verticales** que atraviesen todas las capas. | ¿La termino en una semana? |
| **T — Testable** | Tiene criterios de aceptación claros y verificables. | ¿Sé cuándo está "hecha"? |

**Nota (Bill Wake, 2025)**: la "E" es el criterio más sobreexplotado. Si se replanteara INVEST hoy, sería "External" (valor externo visible) en lugar de "Estimable". Aplicar la "E" con criterio: una historia mal-estimable pero claramente valiosa puede pasar si el equipo está dispuesto a iterar.

---

## 4. Acceptance Criteria — formato Given/When/Then

Toda historia tiene **3-5 escenarios** (no más; si necesitas más, la historia es muy grande).

### Sintaxis

```
Dado que [contexto inicial / estado del sistema]
Cuando [acción única realizada]
Entonces [resultado observable]
[Y opcionalmente más resultados]
```

Equivalente en inglés:

```
Given [initial context / system state]
When [single action taken]
Then [observable outcome]
[And optional additional outcomes]
```

### Reglas duras

- **Given** describe estado, NO acción.
- **When** describe **una sola** acción del usuario o del tiempo.
- **Then** describe un resultado **observable** (UI cambia, dato persiste, evento se emite, error visible).
- Cada escenario es independiente y testable de forma aislada.
- Compatible directamente con Cucumber (Java/Ruby), Behave (Python), SpecFlow (.NET): los AC bien escritos se convierten en tests automatizados.

### Cobertura mínima de escenarios

Por cada historia, incluir:

1. **Happy path** — el flujo exitoso principal.
2. **Error** — un fallo esperado y su mensaje/recuperación.
3. **Edge case** — un caso límite que un QA experimentado señalaría.

### Ejemplo completo

```markdown
## Historia
Como estudiante de la plataforma de e-learning,
quiero buscar cursos por palabra clave y recibir sugerencias relevantes mientras escribo,
para que pueda encontrar rápidamente el curso que necesito sin navegar todo el catálogo.

## Criterios de aceptación

### Escenario 1 — Happy path: sugerencias en tiempo real
- **Dado que** estoy en la página principal
- **Cuando** escribo al menos 3 caracteres en el buscador
- **Entonces** aparecen sugerencias de cursos en tiempo real (máximo 500ms)

### Escenario 2 — Error: sin resultados
- **Dado que** busco un término que no coincide con ningún curso
- **Cuando** se muestran los resultados
- **Entonces** veo un mensaje "Sin resultados" con cursos sugeridos por categoría

### Escenario 3 — Edge case: navegación por teclado
- **Dado que** el listado de sugerencias está visible
- **Cuando** presiono flecha abajo y luego Enter
- **Entonces** navego al curso seleccionado sin necesidad de mouse
```

---

## 5. User Story Mapping (Jeff Patton)

Técnica para organizar historias en un mapa visual bidimensional. Evita el "backlog plano" donde se pierde la visión del journey del usuario.

### Estructura

```
                    ←——— flujo cronológico del usuario ———→
                  ┌──────────┬──────────┬──────────┬──────────┐
   Backbone (X):  │ Buscar   │ Comparar │ Agendar  │  Pagar   │   ← actividades del usuario
                  └──────────┴──────────┴──────────┴──────────┘
                       │           │          │           │
  ↑ más importante     │ T-001    │ T-005   │ T-009    │ T-013       ← MVP (release 1)
  │                    │ T-002    │ T-006   │ T-010    │ T-014
  Y axis ════════════════════════════════════════════════════════
  │                    │ T-003    │ T-007   │ T-011    │
  ↓ menos importante   │ T-004    │ T-008   │ T-012    │              ← v2
```

### Tres ejes / elementos

1. **Backbone (eje X)** — actividades del usuario en orden cronológico ("Buscar producto" → "Comparar" → "Agendar" → "Pagar").
2. **Eje Y** — historias bajo cada actividad, ordenadas por prioridad (arriba = más importante).
3. **Líneas horizontales de release** — dividen el mapa en releases o MVPs. Lo que queda **encima de la línea del MVP** entra en la primera entrega.

### Por qué es útil

- Visualiza el journey completo del usuario, no solo features sueltas.
- Hace explícita la conversación "¿qué es realmente el MVP?".
- Evidencia gaps en la funcionalidad y dependencias.
- Alinea stakeholders alrededor de una narrativa compartida.

---

## 5a. Flujos de navegación (flows) — artefacto opcional

El User Story Map cubre el journey de actividades en orden cronológico. Los AC en G/W/T cubren estado-acción-resultado por escenario. Pero ninguno describe el **grafo de navegación** entre pantallas/estados ni los ramales de error de manera holística. Cuando ese gap importa (productos con UI no trivial, wizards multi-paso, workflows con muchos estados), se introduce el artefacto **flows**.

### Granularidad y formato

- Un archivo por épica: `docs/6-pantallas/B-XXX-<slug>.md`.
- Formato: **Mermaid** embebido en markdown — `sequenceDiagram` para interacciones actor↔sistema, `flowchart TD` cuando domina la ramificación con decisiones.
- Cobertura por flow: happy path + ≥1 ramal de error + ≥1 edge case.

### Reglas duras de trazabilidad

1. Cada arco del diagrama lleva `%% T-XXX` como comentario inmediato. Sin esa marca, el arco se considera inventado.
2. Cero pasos sin AC: si una transición que el flow necesita NO está cubierta por ningún AC existente, **detener** y reportar el gap antes de continuar.
3. Toda HU con `epica: B-XXX` en su frontmatter debe aparecer al menos una vez en el flow correspondiente.
4. Actores válidos: solo los del PRD §Stakeholders.

### Por qué este artefacto en este formato

- Coherente con el principio del repo: **todo markdown puro, agnóstico, auditable por agentes**. Mermaid renderiza en GitHub y Claude Code sin dependencias.
- Wireframes (incluso ASCII) introducen ambigüedad visual que rompe los reviewers automáticos. Mermaid da el 80% del valor (estructura + decisión + actores) con 0% del costo de herramientas visuales externas.
- Granularidad por épica = unidad atómica que ya existe en el backbone del Story Map. Un único `flows.md` global crecería sin gobierno.

### Posición en el pipeline

Va **al final**, post-priorización (paso 6 del flujo). Requiere PRD + épicas + HU + AC + Story Map ya generados. Adelantarlo lo haría especulativo (pasos inventados sin AC).

### Producción y auditoría

- Skill: `-mapear-flujos-navegacion` (slash command `/documentar`).
- Agente revisor: `flows-auditor` — verifica frontmatter, sintaxis Mermaid, trazabilidad bottom-up (cada HU de la épica está cubierta) y top-down (cada arco referencia una HU existente). Es complementario al `trazabilidad-auditor`, no lo duplica.

---

## 6. Backlog

### Definición operativa

> Lista **ordenada** de todo lo que se necesita realizar en el producto (features, requisitos técnicos, bugs).
>
> El factor diferencial respecto a "una lista de historias" es **el orden**: el backlog refleja un único orden de implementación. Sin orden no hay backlog, hay una lista.

### Estructura mínima (tabla)

```markdown
| ID | Título | Épica | Prioridad | Complejidad | Estado | AC count |
|----|--------|-------|-----------|-------------|--------|----------|
| T-001 | Búsqueda por palabra clave | B-001 | Must | M | lista | 3 |
| T-002 | Filtros por categoría | B-001 | Must | S | lista | 4 |
| T-003 | Recomendaciones IA | B-002 | Should | L | draft | 0 |
```

El orden de filas **es** la priorización.

---

## 7. Priorización del Backlog

### 7 factores a evaluar

1. **Valor del negocio** — retención, atractivo para nuevos usuarios, ingresos.
2. **Urgencia** — necesidades del mercado, compromisos con stakeholders.
3. **Dependencias** — qué desbloquea esta historia para otras.
4. **Coste de implementación** — esfuerzo, recursos, tiempo. Relación costo-beneficio.
5. **Riesgos y obstáculos** — técnicos, regulatorios, operativos.
6. **Feedback del usuario** — especialmente en UX y áreas críticas.
7. **Madurez tecnológica** — viabilidad de la solución propuesta.

### Frameworks de priorización (la skill `priorizar-backlog` los aplica)

#### MoSCoW

| Categoría | Significado | % típico |
|---|---|---|
| **M**ust have | Sin esto el producto falla. | ≤ 60% del esfuerzo |
| **S**hould have | Importante pero no crítico para el MVP. | ~20% |
| **C**ould have | Deseable si hay capacidad. | ~20% |
| **W**on't have (this time) | Explícitamente fuera de esta iteración. | resto |

**Regla**: si todo es Must, no hay priorización. Si más del 60% es Must, reabrir la discusión con stakeholders.

#### RICE

```
Score = (Reach × Impact × Confidence) / Effort
```

| Variable | Significado | Escala típica |
|---|---|---|
| **R**each | Cuántos usuarios afectados en un período | número estimado (ej. usuarios/mes) |
| **I**mpact | Cuánto cambia la vida del usuario | 0.25 (mínimo), 0.5, 1 (medio), 2 (alto), 3 (masivo) |
| **C**onfidence | Cuánta certeza tenemos en R, I, E | 100% (datos), 80% (alta), 50% (media), 20% (corazonada) |
| **E**ffort | Esfuerzo total (person-months) | número (semanas-persona / 4) |

Ordenar el backlog por Score descendente.

#### Valor / Esfuerzo (matriz simple)

```
       Alto valor
           │
   Quick   │   Big
   wins    │   bets
  ─────────┼─────────
   Skip    │   Refactor
           │   o dividir
       Bajo valor
   Bajo ←──┼──→ Alto esfuerzo
```

Prioridad: Quick wins → Big bets → Refactor → Skip.

#### Matriz de Eisenhower (urgencia × importancia)

```
            Urgente          No urgente
          ┌──────────────┬──────────────┐
Importante│   HACER      │  PLANIFICAR  │
          │   (ya)       │  (cuándo)    │
          ├──────────────┼──────────────┤
No-import.│  DELEGAR     │  ELIMINAR    │
          │  (a quién)   │              │
          └──────────────┴──────────────┘
```

Útil para triage rápido cuando hay sobrecarga de items.

#### Planning Poker (estimación, no priorización)

Técnica de estimación en grupo:
1. Cada miembro estima en privado (cartas con Fibonacci: 1, 2, 3, 5, 8, 13, 21).
2. Se revelan al tiempo.
3. Si hay divergencia, los extremos justifican; se re-estima.
4. Converger en 2 rondas.

### Proceso recomendado

1. **Revisión con stakeholders** — alinear con objetivos del negocio.
2. **Sesiones con el equipo** — Planning Poker para estimación, framework elegido para priorización.
3. **Iteración** — el backlog es dinámico; re-priorizar al final de cada sprint.

---

## 8. Flujo PRD → Backlog con IA (2026)

El flujo tradicional copia-y-pega entre Word, Excel y Jira tarda 3+ horas. Con IA + Skills:

```
PRD (markdown)
    │
    ▼ skill: descomponer-prd-a-epicas
Épicas (trazadas a objetivos del PRD)
    │
    ▼ skill: crear-mapa-historias
User Story Map
    │
    ▼ skill: escribir-historia-usuario + escribir-criterios-aceptacion-bdd
Historias T-XXX.md con AC G/W/T
    │
    ▼ skill: construir-backlog
Backlog (tabla ordenada)
    │
    ▼ skill: priorizar-backlog (framework elegido)
Backlog priorizado
    │
    ▼ skill: mapear-flujos-navegacion (opcional, requiere todo lo anterior)
Flows en Mermaid (un archivo por épica en docs/6-pantallas/)
    │
    ▼ (en cada paso) agentes revisores → reportes en docs/.reviews/
Quality gates
```

**Lo que cambia**:
- 3 horas → 10 minutos de review.
- Formato consistente: todas las historias siguen la misma plantilla, el mismo INVEST, el mismo G/W/T.
- Trazabilidad: cada AC → US → Épica → Objetivo-PRD se mantiene automáticamente.
- El refinement humano deja de ser "re-explicar decisiones" y pasa a ser "discutir los puntos que realmente lo merecen".

**Caveat**: el primer borrador lo da la IA, el refinement sigue siendo humano. El equipo valida realidad técnica, sizing y cobertura de escenarios.

---

## 9. Mapa de skills, agentes y reglas

| Artefacto | Skill que lo escribe | Agente que lo revisa | Regla dura |
|---|---|---|---|
| PRD (la idea) | `documento-de-idea` | `revisor-de-idea` | 12 componentes obligatorios (10 + qué NO hace + cómo se mide) |
| Épicas (bloques) | `agrupar-en-bloques` | `revisor-de-bloques` | Cada bloque trazado a ≥1 objetivo del documento de producto |
| Story Map (el recorrido) | `mapa-del-recorrido` | `revisor-del-recorrido` | Cubre el recorrido completo, con línea de primera versión |
| Historia de Usuario (tarea) | `escribir-tarea` | `revisor-de-tareas` | Pasa las 6 preguntas de calidad + encabezado completo |
| Acceptance Criteria (criterios) | `criterios-de-listo` | `revisor-de-criterios` | 3-5 escenarios: normal + error + raro |
| Backlog (lista de trabajo) | `lista-de-trabajo` | `revisor-de-conexiones` | Cada item trazado: criterio → tarea → bloque → objetivo |
| Priorización (qué va primero) | `decidir-que-va-primero` | `revisor-de-prioridades` | El método se aplica completo, no a medias |
| Flows (pantallas) | `dibujar-pantallas` | `revisor-de-pantallas` | Un archivo por bloque; cada flecha lleva `%% T-XXX`; cobertura normal+error+raro |
| — (orquesta todo) | `flujo-completo` | — | Checkpoint tras cada paso; no avanza con problemas bloqueantes |
| — (revisa todo) | `revisar-todo` | *(todos)* | Un solo informe consolidado, con semáforo |


---

## 10. Referencias bibliográficas (fuentes base)

Esta metodología se construye sobre:

- "Documento de requisitos de producto (PRD)" — sección 1 (Introducción), sección 2 (PRD en la era de la IA).
- "Gestión de producto y User Stories" — sección 5 (INVEST), sección 6 (Estructura básica), sección 7 (Ejemplos con BDD), sección 8 (User Story Mapping).
- "Historias de usuarios" — sección 1.5 (Anatomía), sección 2 (Priorización), sección 3 (Flujo PRD→Backlog con IA).

Conceptos canónicos:
- **3 Cs de Ron Jeffries**: Card, Conversation, Confirmation.
- **INVEST** acuñado por Bill Wake; reflexión 2025 sobre la "E" → "External".
- **User Story Mapping** por Jeff Patton.
- **MoSCoW** por Dai Clegg (Oracle, 1994).
- **RICE** por Intercom (~2017).
- **BDD** popularizado por Dan North; Given/When/Then originalmente de Aslak Hellesøy (Cucumber).

Las skills y agentes citan estas secciones por número cuando aplica.
