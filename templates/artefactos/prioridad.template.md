# Priorización — {{PRODUCT_NAME}}

> **Método usado**: {{METODO}}
> **Fecha**: {{DATE}}
> **Participantes**: {{PARTICIPANTES}}

## Contexto de la sesión

<!-- 1 párrafo: qué se priorizó, por qué ahora, qué decisiones se buscaban -->

---

## Cómo se aplicó

<!-- Usar solo el bloque del método elegido; borrar los demás. -->

### Opción A — MoSCoW

| Categoría | Criterio operativo | Tareas |
|---|---|---|
| **Debe** | sin esto el producto falla | T-001, T-002, T-005, T-006 |
| **Debería** | importante pero no crítico para primera versión | T-003, T-007 |
| **Podría** | deseable si hay capacidad | T-008, T-009 |
| **Ahora no** | explícitamente fuera | T-010, T-011 |

**Distribución del esfuerzo**:
- Debe: 55% (el tope sano es 60%)
- Debería: 25%
- Podría: 15%
- Ahora no: 5%

### Opción B — RICE

```
Puntaje = (Alcance × Impacto × Confianza) / Esfuerzo
```

| ID | Alcance | Impacto | Confianza | Esfuerzo | **Puntaje** |
|----|-------|--------|------------|--------|-----------|
| T-001 | 5000 | 2 | 80% | 3 | **2667** |
| T-002 | 3000 | 2 | 100% | 2 | **3000** |
| T-003 | 1000 | 0.5 | 50% | 1 | **250** |

Ordenado de mayor a menor puntaje.

### Opción C — Valor / Esfuerzo

```
       Alto valor
           │
   T-002  │  T-001
   T-005  │  T-007
  ─────────┼─────────
   T-008  │  T-003
           │  T-009
       Bajo valor
   Bajo ←──┼──→ Alto esfuerzo
```

**Quick wins** (alto valor, bajo esfuerzo): T-002, T-005
**Big bets** (alto valor, alto esfuerzo): T-001, T-007
**Refactor / dividir**: T-003, T-009
**Skip**: T-008

### Opción D — Eisenhower

| | Urgente | No urgente |
|---|---|---|
| **Importante** | T-001 (HACER ya) | T-002, T-005 (PLANIFICAR) |
| **No importante** | T-007 (DELEGAR) | T-008 (ELIMINAR / aplazar) |

---

## Decisiones tomadas

1. {{DECISION_1}}
2. {{DECISION_2}}
3. {{DECISION_3}}

## Disidencias / preguntas abiertas

<!-- Si alguien no estuvo de acuerdo o si quedó una pregunta sin resolver -->

- {{DISIDENCIA_1}}

## Próxima revisión

<!-- Cuándo se vuelve a revisar el orden -->

- Fecha tentativa: {{NEXT_REVIEW_DATE}}
