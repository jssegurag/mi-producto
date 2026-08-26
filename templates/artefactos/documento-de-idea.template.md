# Documento de producto — {{PRODUCT_NAME}}

 > **Estado**: borrador | en-revisión | firmado
> **Versión**: 0.1
> **Última actualización**: {{DATE}}
> **Sponsor**: {{SPONSOR}}

---

## 1. Introducción y objetivos

**Problema**: <!-- ¿qué problema concreto resuelve este producto? -->

**Contexto**: <!-- por qué ahora, qué pasó antes, qué cambió -->

**Objetivos** (3-5, medibles):
- {{OBJETIVO_1}}
- {{OBJETIVO_2}}
- {{OBJETIVO_3}}

## 2. Quiénes participan

| Rol | Nombre / equipo | Interés / responsabilidad |
|---|---|---|
| Sponsor | | |
| Product Owner | | |
| Equipo técnico | | |
| Usuario primario | | |
| Usuario secundario | | |
| Operaciones / soporte | | |

## 3. Tareass (de alto nivel)

> Detalle por tarea en `docs/3-tareas/`. Aquí solo el resumen narrativo de los perfiles + necesidades.

- Como {{ROL_1}}, necesito {{NECESIDAD_1}} para {{BENEFICIO_1}}.
- Como {{ROL_2}}, necesito {{NECESIDAD_2}} para {{BENEFICIO_2}}.

## 4. Componentes principales y sitemap

<!-- Bloques del sistema (frontend, API, BD, integraciones) y/o sitemap si es web/app -->

```
[bloque A]  ──→  [bloque B]
     │              │
     └──→ [bloque C] ◄──┘
```

## 5. Características y funcionalidades

Agrupadas por capability:

### Capability 1: {{CAPABILITY_1}}
- Feature 1.1
- Feature 1.2

### Capability 2: {{CAPABILITY_2}}
- Feature 2.1
- Feature 2.2

## 6. Diseño y experiencia del usuario

- **Principios UX**: <!-- ej. mobile-first, accesible, idioma X, tono Y -->
- **Accesibilidad**: <!-- WCAG AA, navegación por teclado, screen reader, etc. -->
- **Restricciones de marca**: <!-- guía de estilo, paleta, tipografía -->
- **Inspiración / benchmarks**: <!-- referencias, no copiar -->

## 7. Requisitos técnicos

- **Stack**: <!-- frontend, backend, datos, infra -->
- **Integraciones**: <!-- APIs externas, SSO, pagos, mensajería -->
- **No-funcionales**:
  - Performance: <!-- ej. p95 < 500 ms, soporta 1k usuarios concurrentes -->
  - Seguridad: <!-- autenticación, autorización, datos sensibles -->
  - Disponibilidad: <!-- SLO, tolerancia a fallos -->
  - Observabilidad: <!-- logs, métricas, alertas -->

## 8. Planificación del proyecto

| Fase | Duración | Hitos | Dependencias |
|---|---|---|---|
| F1 — Discovery | | | |
| F2 — primera versión | | | |
| F3 — Iteración | | | |
| F4 — Producción | | | |

## 9. Criterios de aceptación (nivel producto)

El producto se considera entregado cuando:
- [ ] Criterio 1
- [ ] Criterio 2
- [ ] Criterio 3

## 10. Apéndices y recursos adicionales

- Investigación de usuario: <!-- enlaces / archivos -->
- Benchmarks: <!-- -->
- Mockups / wireframes: <!-- -->
- Referencias técnicas: <!-- -->

## 11. Non-goals (fuera de alcance)

Explícitamente NO se incluye en esta iteración:
- {{NO_GOAL_1}}
- {{NO_GOAL_2}}
- {{NO_GOAL_3}}

## 12. Métricas de éxito (KPIs)

| KPI | Línea base | Meta | Cuándo se mide |
|---|---|---|---|
| {{KPI_1}} | | | |
| {{KPI_2}} | | | |
| {{KPI_3}} | | | |

---

<!-- Si este documento será consumido por agentes de IA, anexar la versión "fases secuenciales":

## Anexo A: versión para agentes que programan

### Fase 1: {{FASE_1_TITULO}}
- **Dependencias**: ninguna
- **Resultado verificable**: {{RESULTADO_1}}
- **Alcance**: {{ALCANCE_1}}
- **Tiempo estimado del agente**: 10 min

### Fase 2: ...
-->
