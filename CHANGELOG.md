# Historial de cambios

## 1.0.0 — 2026-08-26

Primera versión pública.

### Qué trae

- **3 comandos**: `/empezar`, `/documentar`, `/revisar`.
- **11 skills** que escriben cada documento, con descripciones bilingües: se activan
  tanto si hablas en cristiano ("mi idea", "qué hago primero") como si usas los
  términos de la industria ("PRD", "backlog", "INVEST").
- **8 agentes revisores** que auditan lo escrito en contexto limpio. Quien revisa
  nunca es quien escribió.
- **2 hooks**: al abrir sesión te dice en qué punto vas; al escribir en `docs/`
  avisa en silencio si falta algo obvio.
- **6 carpetas** de documentos, cada una con un `LEEME.md` que explica qué hay
  dentro y cómo se llama eso en la industria.
- **`METODO.md`**: el método completo, con tabla de equivalencias entre el
  vocabulario natural y el técnico.

### Decisiones de diseño

- Instalación en 2 líneas vía marketplace de plugins. Sin npm, sin CLI, sin Node.
- Las carpetas están numeradas en el orden en que se llenan, para que "paso 3 de 5"
  coincida con `docs/3-tareas/`.
- Identificadores: `B-XXX` para bloques (épicas), `T-XXX` para tareas (historias).
- Método de priorización por defecto: Debe / Debería / Podría / Ahora no (MoSCoW),
  sin preguntarle al usuario en el minuto uno.

El detalle completo del porqué está en [docs/DISENO.md](docs/DISENO.md).
