# Lista de trabajo — {{PRODUCT_NAME}}

> El orden de las filas **es** la priorización. Para detalles de priorización ver `docs/5-que-va-primero/`.

**Última actualización**: {{DATE}}
**Cómo se decidió el orden**: {{METODO}} (Debe-Debería-Podría | RICE | Valor-Esfuerzo | Urgente-Importante)

## Resumen

- Total tareas: N
- En estado `lista`: N
- En estado `en-curso`: N
- En estado `hecha`: N

## Tabla priorizada

| # | ID | Título | Bloque | Prioridad | Complejidad | Estado | Criterios | Notas |
|---|----|--------|-------|-----------|-------------|--------|----|-------|
| 1 | T-001 | {{TITULO_1}} | B-001 | Debe | M | lista | 3 | |
| 2 | T-002 | {{TITULO_2}} | B-001 | Debe | S | lista | 4 | |
| 3 | T-005 | {{TITULO_5}} | B-002 | Debe | M | lista | 3 | |
| 4 | T-003 | {{TITULO_3}} | B-001 | Debería | L | borrador | 0 | bloqueada por T-001 |
| ... | | | | | | | | |

## Trazabilidad rápida (bloque → tareas)

- **B-001 — {{TITULO_BLOQUE_1}}**: T-001, T-002, T-003, ...
- **B-002 — {{TITULO_BLOQUE_2}}**: T-005, T-006, ...

## Items pendientes de definir

<!-- Tareas detectadas pero todavía sin detalle suficiente -->

- [ ] T-??? — {{IDEA_SIN_DETALLAR}}
