# Diseño — `mi-producto`

**Fecha:** 2026-08-26
**Repo:** https://github.com/jssegurag/mi-producto (público, MIT)
**Estado:** diseño aprobado pendiente de revisión → implementación

---

## 1. Qué es

Un **plugin de Claude Code** que convierte la idea de una persona no técnica en el
set completo de documentos de producto que un equipo de desarrollo necesita para
construirla: documento de producto, mapa del recorrido, lista de trabajo, tareas
con criterios de aceptación, priorización y diagramas de pantallas.

El público objetivo es el **citizen developer**: alguien con una idea clara de
negocio y cero vocabulario de ingeniería de producto. Se entrega como regalo a
los asistentes de un meetup de la comunidad de Claude Code.

### Lo que NO es

- No es un CLI. No requiere Node, npm, ni terminal más allá de Claude Code.
- No es un producto con SLA ni mantenimiento comprometido.
- No tiene relación operativa con ningún repo corporativo.

---

## 2. Origen y aislamiento

Este repo es una **destilación independiente** de una vertical agéntica privada
(`trycore-spec-product-flow`, v0.4.0). Se copió la metodología, los agentes
revisores y las plantillas; se reescribieron los comandos, el flujo y el
vocabulario.

**Regla dura de aislamiento:** el repo de origen es **de solo lectura**. Ningún
archivo, commit, rama o push de este trabajo toca aquel repo. Los archivos se
copian hacia afuera y se reescriben aquí. Nada vuelve. Este repo tiene historia
git propia desde cero, sin ancestro común, y su único remote es
`jssegurag/mi-producto`.

Como consecuencia: **cero menciones de marca corporativa** en cualquier archivo
distribuido. Es un criterio de aceptación verificable (ver §10).

### Divergencia asumida

`METODO.md` se copia una vez; no se sincroniza con el origen. Los dos repos
evolucionan por separado. Esto se declara explícitamente en el README para que
nadie espere actualizaciones acopladas.

---

## 3. Decisiones de diseño

| # | Decisión | Alternativa descartada | Por qué |
|---|---|---|---|
| D1 | Destilación independiente, solo plugin | Fork con paridad total (CLI npm + plugin) | El doble canal de distribución confunde al no técnico y arrastra complejidad sin valor para este público |
| D2 | 3 comandos visibles | 11 comandos (origen) / 1 comando / 6 comandos | Un verbo por momento vital. Los 8 restantes siguen accesibles en lenguaje natural, sin ocupar espacio mental |
| D3 | Puente didáctico en el vocabulario | Natural puro / técnico intacto | El usuario habla natural, pero se lleva un artefacto que un equipo técnico reconoce como PRD, historia de usuario, etc. |
| D4 | Nombre `mi-producto` | `de-idea-a-plan` / `spec-facil` | Corto, apropiable, fácil de dictar en voz alta durante una charla |

---

## 4. Instalación

Dos líneas, cero prerrequisitos:

```
/plugin marketplace add jssegurag/mi-producto
/plugin install mi-producto
```

No hay `npm install -g`, `git clone`, CLI ni Node. Esto elimina la barrera de
entrada principal identificada en el análisis del repo origen, cuyo camino feliz
empezaba con `npm install -g @scope/paquete`.

**Trade-off aceptado:** sin CLI no existe un `init` idempotente por proyecto. El
plugin vive a nivel de usuario de Claude Code y `/empezar` crea la estructura
`docs/` en la carpeta de trabajo actual. Se gana simplicidad; se pierde
instalación por repositorio. Para este público es la decisión correcta.

---

## 5. Superficie de comandos

| Comando | Lo que el usuario piensa | Lo que ocurre por debajo |
|---|---|---|
| `/empezar` | "cuéntale a Claude mi idea" | Onboarding, crea `docs/`, guarda memoria de proyecto |
| `/documentar` | "conviértela en documentos" | Pasos 1–5 con checkpoints, + pantallas opcional |
| `/revisar` | "¿está bien lo que llevo?" | Los 8 agentes revisores en paralelo |

Los comandos viven en `commands/` **sin subcarpeta**, para que se invoquen como
`/empezar` y no `/namespace:empezar`.

### `/empezar`

Baja de 4 preguntas (origen) a 2:

1. ¿Qué quieres construir? (una o dos frases)
2. ¿Quién lo va a usar?

Cambios respecto al `onboard` del origen:

- **Desaparece la elección de framework de priorización.** Queda MoSCoW fijo,
  presentado como *"Debe / Debería / Podría / Ahora no"*. Un citizen developer no
  tiene criterio para elegir entre RICE y Eisenhower, y obligarlo a hacerlo en el
  minuto uno es una barrera pura.
- **Desaparece el preflight en bash** (`test -f .claude/.trycore-version`). Si el
  plugin está corriendo, está instalado.
- **Desaparecen las menciones a auto-memory y bloques marcados** de la
  conversación visible. Siguen ocurriendo, en silencio.
- **Termina ofreciendo continuar** sin cambiar de comando: *"¿Arrancamos con los
  documentos?"*. El usuario nunca queda parado preguntándose qué teclear.

### `/documentar`

Ejecuta el pipeline completo. Conserva del origen:

- Los **checkpoints entre pasos** (aprobar / corregir / parar).
- La **persistencia de estado** en `docs/.progreso.json`. El recovery importa más
  aquí que en el origen: un usuario no técnico cierra la terminal sin querer.
- El **guardrail de no avanzar** con problemas bloqueantes.

Lo que cambia es el registro del lenguaje. El checkpoint del origen dice:

```
✓ Paso N completado: <artefacto generado>
  Validaciones del agente revisor: ✗ 2 issues bloqueantes
  ¿Continuamos? [seguir / corregir / abortar]
```

El nuevo dice:

```
✓ Listo 1 de 5: la idea de tu producto
  → docs/1-la-idea/mi-app.md

  Lo revisé. Hay 2 cosas que conviene aclarar:
  · No dice cómo sabrás si funcionó
  · Falta qué NO va a hacer el producto

  ¿Las arreglamos, sigo adelante, o paramos aquí?
```

`/documentar` ejecuta los **pasos 1 a 5 de corrido** (con sus checkpoints) y al
terminar **ofrece** el paso 6 (pantallas), que es opcional. El contador dice
"de 5" mientras corre; las pantallas se presentan como un extra, no como una
tarea pendiente que deje al usuario con sensación de trabajo a medias.

### `/revisar`

Despacha los 8 agentes revisores y consolida un reporte en lenguaje natural con
semáforo, en vez de una lista de *issues* por severidad.

### Lo que no es comando

Todo lo demás sigue accesible hablando: *"añade una historia de login"*,
*"hazme los diagramas de las pantallas"*, *"reescribe la tarea 3"*. Las skills se
activan solas. **No se pierde ninguna capacidad; se esconden 8 comandos.**

---

## 6. Descripciones bilingües (mecanismo central)

Las skills se renombran a español natural, pero su `description` conserva los
términos técnicos como disparadores de activación:

```yaml
name: documento-de-idea
description: Escribe el documento que explica qué es tu producto, para quién
  y por qué. Actívala cuando el usuario diga "mi idea", "quiero documentar",
  "qué quiero construir" — y también cuando diga "PRD", "documento de
  requisitos" o "product requirements document". Produce
  docs/1-la-idea/<slug>.md con los 12 componentes obligatorios.
```

Doble puerta de entrada: el citizen developer la activa hablando como habla; un
técnico que llegue después la activa diciendo "PRD". Cero pérdida de potencia.

**Caveat honesto:** la activación por descripción es un *nudge* semántico que
Claude pondera, no una garantía del sistema. Los 3 comandos explícitos son la red
de seguridad cuando el nudge no basta.

### Mapa de renombrado

| Origen | Aquí |
|---|---|
| `trycore-escribir-prd` | `documento-de-idea` |
| `trycore-descomponer-prd-a-epicas` | `agrupar-en-bloques` |
| `trycore-crear-mapa-historias` | `mapa-del-recorrido` |
| `trycore-escribir-historia-usuario` | `escribir-tarea` |
| `trycore-escribir-criterios-aceptacion-bdd` | `criterios-de-listo` |
| `trycore-construir-backlog` | `lista-de-trabajo` |
| `trycore-priorizar-backlog` | `decidir-que-va-primero` |
| `trycore-validar-invest` | `revisar-tareas` |
| `trycore-revisar-calidad-documental` | `revisar-todo` |
| `trycore-mapear-flujos-navegacion` | `dibujar-pantallas` |
| `trycore-flujo-prd-a-backlog` | `flujo-completo` |

Los **8 agentes revisores se portan sin cambios funcionales** (solo se limpia el
prefijo y cualquier mención de marca). Son invisibles para el usuario y son
precisamente lo que garantiza que "mismo resultado" siga siendo cierto.

---

## 7. Estructura de artefactos y puente didáctico

```
docs/
 ├─ 1-la-idea/            ← PRD
 ├─ 2-el-recorrido/       ← épicas + User Story Map
 ├─ 3-tareas/             ← historias de usuario con AC
 ├─ 4-lista-de-trabajo/   ← backlog consolidado
 ├─ 5-que-va-primero/     ← priorización
 └─ 6-pantallas/          ← user flows (Mermaid)
```

### Renumeración respecto al origen

El pipeline del origen tiene **7 pasos** repartidos en **6 carpetas**: épicas y
backlog comparten `03-backlog/`, y el orden de ejecución (PRD → épicas → mapa →
historias → backlog → priorización → flows) no coincide con la numeración de
carpetas. Un contador *"listo 3 de 6"* sería incoherente con lo que el usuario ve
en el disco.

Como este repo no arrastra compatibilidad con proyectos existentes, se renumera
para que **paso N = carpeta N**, sin excepciones:

| Paso visible | Carpeta | Pasos del origen que absorbe |
|---|---|---|
| 1 · La idea | `1-la-idea/` | 1 (PRD) |
| 2 · El recorrido | `2-el-recorrido/` | 2 (épicas) + 3 (mapa) |
| 3 · Las tareas | `3-tareas/` | 4a (historias) + 4b (AC) |
| 4 · La lista de trabajo | `4-lista-de-trabajo/` | 5 (backlog) |
| 5 · Qué va primero | `5-que-va-primero/` | 6 (priorización) |
| 6 · Las pantallas | `6-pantallas/` | 7 (flows, opcional) |

Épicas y mapa se agrupan porque para el usuario son el mismo momento mental
("¿de qué partes se compone esto y en qué orden las vive la gente?"), y porque
las épicas son insumo directo del mapa. Las skills subyacentes siguen siendo dos,
separadas e independientes.

Cada carpeta lleva un `LEEME.md` de seis líneas:

```markdown
# 1 · La idea

Aquí vive el documento que explica qué es tu producto.

**Cómo se llama esto en la industria:** un PRD
(Product Requirements Document).

**Qué hacer con esto:** compártelo con quien vaya a construir tu
producto — entenderá exactamente qué quieres.
```

**El contenido de los documentos generados no cambia.** Siguen cumpliendo los 12
componentes obligatorios del PRD, los 6 criterios INVEST y el formato
Given/When/Then. Lo que cambia es cómo se nombra la carpeta y cómo Claude habla
de ella.

Los `CLAUDE.md` scoped por subcarpeta **se conservan** — son invisibles, no
cuestan nada al usuario, y son lo que mantiene la calidad local vía progressive
disclosure.

---

## 8. Poda

| Se elimina | Por qué |
|---|---|
| Todo `src/` + CLI TypeScript + `package.json` + `tsconfig.json` | La instalación es `/plugin install`. ~7 archivos TS fuera |
| `scripts/legacy/` | Fallback de un canal de distribución que ya no existe |
| `check-agnostic.sh` + `denylist.txt` | Sustituido por un check de marca más simple (§10) |
| `check-version-sync.sh` | De 4 puntos de versión a 1 (`plugin.json`) |
| `GOVERNANCE.md` | Gobernanza corporativa; no aplica a un regalo público |
| `INSTALL.md` | Son dos líneas; van en el README |
| 8 de 11 slash commands | Siguen accesibles en lenguaje natural |
| 12 documentos técnicos → 3 | `README.md` + `COMO-FUNCIONA.md` + `METODO.md` |
| Hooks `Stop` (`check-todos`, `reflect-session`) | Ruido para un usuario no técnico |

### Hooks que se conservan

- **`SessionStart`** (`estado-documental.sh`) — abrir la terminal y que te digan
  *"vas por el paso 3 de 5"* es de lo más valioso que existe para alguien no
  técnico. Se reescribe la salida en lenguaje natural.
- **`PostToolUse`** silencioso — valida al escribir, avisa solo si falta algo.

### Balance

| | Origen | Aquí |
|---|---|---|
| Comandos visibles | 11 | **3** |
| Documentos | 12 | **3** |
| Canales de instalación | 2 | **1** |
| Pasos de instalación | ~5 | **2** |
| Skills | 11 | 11 (renombradas) |
| Agentes revisores | 8 | 8 (intactos) |

---

## 9. Estructura del repo

```
mi-producto/
├── .claude-plugin/
│   ├── plugin.json          ← manifiesto (única fuente de versión)
│   └── marketplace.json     ← para /plugin marketplace add
├── commands/                ← plano, sin namespace
│   ├── empezar.md
│   ├── documentar.md
│   └── revisar.md
├── skills/                  ← 11 skills renombradas, descripciones bilingües
├── agents/                  ← 8 agentes revisores
├── hooks/
│   └── hooks.json           ← SessionStart + PostToolUse
├── scripts/                 ← estado-documental, validadores
├── templates/
│   ├── docs/                ← las 6 carpetas + sus LEEME.md + CLAUDE.md scoped
│   └── artefactos/          ← plantillas de PRD, historia, backlog, etc.
├── docs/
│   ├── DISENO.md            ← este documento
│   └── COMO-FUNCIONA.md     ← para quien quiera entender el motor
├── METODO.md                ← fuente de verdad metodológica
├── README.md                ← para el asistente al meetup
└── LICENSE                  ← MIT
```

---

## 10. Criterios de aceptación

El trabajo está terminado cuando:

1. **Aislamiento verificado** — `git status --porcelain` en el repo origen
   devuelve 0 líneas, y su `HEAD` es el mismo commit que al empezar (`db0ccfe`).
2. **Sin marca corporativa** — un grep de los términos de marca sobre todos los
   archivos distribuidos devuelve cero resultados. Se implementa como
   `scripts/check-limpio.sh`.
3. **Instalable** — `/plugin marketplace add jssegurag/mi-producto` seguido de
   `/plugin install mi-producto` funciona en una máquina limpia.
4. **End-to-end** — en una carpeta vacía, `/empezar` → `/documentar` produce los
   6 artefactos completos, y `/revisar` los audita sin error.
5. **Calidad preservada** — el PRD generado cumple los 12 componentes; las tareas
   pasan INVEST; los criterios están en Given/When/Then. Verificado contra
   `METODO.md`, no contra la impresión de que "se ve bien".
6. **Legible para el público objetivo** — ningún texto que el usuario vea durante
   el flujo feliz contiene jerga sin traducir.

---

## 11. Plan de implementación

| Fase | Qué | Entregable |
|---|---|---|
| 0 | Scaffold: `plugin.json`, `marketplace.json`, LICENSE MIT, `.gitignore` | Repo instalable vacío |
| 1 | Portar 11 skills: renombrado + descripciones bilingües + limpieza de marca | `skills/` |
| 2 | Portar 8 agentes: limpieza de prefijo y marca | `agents/` |
| 3 | Escribir los 3 comandos desde cero | `commands/` |
| 4 | Templates `docs/` con las 6 carpetas, `LEEME.md` puente y `CLAUDE.md` scoped | `templates/` |
| 5 | Hooks podados y reescritos en lenguaje natural | `hooks/`, `scripts/` |
| 6 | `README.md`, `COMO-FUNCIONA.md`, `METODO.md`, `check-limpio.sh` | Documentación |
| 7 | Prueba end-to-end en carpeta vacía, actuando como asistente al meetup | Evidencia de §10.4 |
| 8 | Publicación: primer push a `jssegurag/mi-producto` | **Solo con aprobación explícita** |

**Nada se publica hasta que las fases 0–7 estén completas y revisadas.** Los
commits ocurren en local; el push es un acto separado y explícito.

---

## 12. Puntos abiertos para revisión

Estos quedaron sin resolver y se implementan con el valor por defecto indicado,
salvo que se decida lo contrario:

| # | Punto | Por defecto |
|---|---|---|
| A1 | Nombres de skills (`agrupar-en-bloques` vs. alternativas) | El mapa de §6 |
| A2 | Hook `reflect-session` | Podado (§8) |
| A3 | Guion de demo de 10 minutos para la charla | **No incluido.** Se añadiría como fase 9 |
