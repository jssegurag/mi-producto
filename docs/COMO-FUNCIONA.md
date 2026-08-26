# Cómo funciona por dentro

Para quien quiera entender el motor, forkear el plugin o adaptarlo.

## Las piezas

```
mi-producto/
├── .claude-plugin/
│   ├── plugin.json        manifiesto del plugin (única fuente de la versión)
│   └── marketplace.json   permite /plugin marketplace add
├── commands/              3 comandos: empezar, documentar, revisar
├── skills/                11 skills — el conocimiento de cómo escribir cada cosa
├── agents/                8 revisores — auditan en contexto limpio
├── hooks/hooks.json       2 hooks: orientación al abrir, aviso al escribir
├── scripts/               los 2 scripts que ejecutan los hooks + el check de limpieza
├── templates/             plantillas de carpetas y de artefactos
└── METODO.md              la fuente de verdad metodológica
```

## Cómo encajan

**Comandos → skills → agentes.** Un comando es un atajo delgado que activa una skill. La skill contiene el conocimiento de *cómo* escribir el artefacto y sus reglas duras. El agente lo audita después, en un contexto limpio, sin haberlo escrito él — esa es la clave: **quien revisa no es quien escribió**.

**Los hooks son la red de seguridad.** `donde-voy.sh` corre al abrir sesión y dice en qué punto va el proyecto. `aviso-al-escribir.sh` corre tras cada escritura en `docs/` y avisa si falta algo obvio. Ninguno bloquea nada; solo hablan cuando hay un problema real.

**Los `CLAUDE.md` scoped son *progressive disclosure*.** Cada carpeta de `docs/` lleva el suyo, con las reglas locales de ese directorio. Solo pesan en el contexto cuando Claude está editando ahí. Es lo que mantiene la calidad sin inflar cada conversación.

## El truco de las descripciones bilingües

Las skills tienen nombre en español natural, pero su `description` contiene **los dos vocabularios**:

```yaml
name: documento-de-idea
description: Escribe el documento que explica qué es tu producto…
  Actívala cuando el usuario diga "mi idea", "quiero documentar" —
  y también cuando diga "PRD", "documento de requisitos"…
```

Un citizen developer la activa hablando como habla. Un técnico que llegue después la activa diciendo "PRD". La misma skill, dos puertas de entrada.

**Límite honesto:** esto es un *nudge* semántico que Claude pondera, no una garantía del sistema. Por eso existen los 3 comandos explícitos: son la red cuando el nudge no basta.

## Los identificadores

- Bloques: `B-001`, `B-002`… (épicas)
- Tareas: `T-001`, `T-002`… (historias de usuario)
- Cada carpeta de `docs/` está numerada **en el orden en que se llenan**, para que "paso 3 de 5" coincida con `docs/3-tareas/`.

## Añadir cosas

**Una skill nueva:** crea `skills/<nombre>/SKILL.md` con frontmatter `name` y `description`. Escribe la descripción con los dos vocabularios y declara sobre qué carpeta trabaja. Se carga sola.

**Un agente nuevo:** crea `agents/<nombre>.md` con `name`, `description`, `tools` y `model`. Los agentes solo leen y reportan — **nunca editan**. Esa separación es deliberada.

**Un comando nuevo:** piénsalo dos veces. La razón de que haya solo tres es que once eran demasiados. Si algo se puede pedir hablando, no necesita comando.

## Cambiar el método

`METODO.md` manda. Si una skill lo contradice, gana el método. Si quieres cambiar una regla dura (por ejemplo, exigir 15 componentes en vez de 12), cámbiala primero ahí y después en la skill y el agente que la aplican.

## Verificar antes de publicar

```bash
bash scripts/check-limpio.sh
```

Comprueba que no se coló ninguna referencia de marca corporativa ni rutas del repo del que se destiló esto.
