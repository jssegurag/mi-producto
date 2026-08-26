# Mi Producto

**Tienes una idea. Este plugin la convierte en los documentos que alguien necesita para construirla.**

No hay que saber programar. No hay que instalar nada raro. Hablas normal y Claude escribe.

---

## Instalar (2 líneas)

Abre Claude Code y escribe:

```
/plugin marketplace add jssegurag/mi-producto
/plugin install mi-producto
```

Ya está. No necesitas Node, ni npm, ni terminal, ni clonar nada.

---

## Usar

Crea una carpeta para tu proyecto, abre Claude Code ahí, y escribe:

```
/empezar
```

Te hace 2 preguntas y prepara todo. Luego:

```
/documentar
```

Y de ahí en adelante Claude te va llevando, parando en cada paso para que apruebes.

Cuando quieras comprobar que todo está bien:

```
/revisar
```

**Esos son los tres comandos. No hay más que aprender.**

---

## Qué te llevas

Al terminar tienes esto, en archivos de texto que puedes abrir con cualquier cosa:

```
docs/
├── 1-la-idea/            qué es tu producto y para quién
├── 2-el-recorrido/       en qué partes se divide, y en qué orden se usa
├── 3-tareas/             cada cosa a construir, con cómo se comprueba
├── 4-lista-de-trabajo/   todo junto, en orden
├── 5-que-va-primero/     qué se construye primero, y por qué
└── 6-pantallas/          diagramas de navegación (opcional)
```

Cada carpeta lleva un `LEEME.md` que te explica qué hay dentro **y cómo se llama eso en la industria**, para que puedas hablar con un equipo técnico sin sentirte perdido.

### ¿Para qué sirve de verdad?

- **Pedir presupuesto.** La lista de trabajo es lo que se cotiza. Fila por fila.
- **Contratar a alguien que lo construya.** Le das la carpeta y empieza. Sin cien reuniones.
- **Construirlo tú con Claude.** Pídele que empiece por la tarea T-001.
- **Explicarle tu idea a un socio o a un inversor**, sin que suene a "una app, más o menos".

---

## Lo que hace por dentro

No es un generador de texto bonito. Detrás hay un método de producto de verdad, y **agentes que revisan lo que se escribe**:

- El documento de tu idea tiene que llevar **12 partes obligatorias**, incluida la que casi nadie escribe: qué NO va a hacer el producto.
- Cada tarea pasa **6 preguntas de calidad** antes de darse por buena. Si es demasiado grande, te dice cómo partirla.
- Cada tarea lleva sus **criterios de comprobación**: caso normal, caso de error y caso raro. Escritos así, quien programe los puede convertir directamente en pruebas automáticas.
- Todo queda **conectado**: cada criterio pertenece a una tarea, cada tarea a un bloque, cada bloque a un objetivo. Si un objetivo tuyo no lo cubre nada, te avisa.

Si quieres el detalle completo del método: [METODO.md](METODO.md).
Si quieres saber cómo está armado el plugin: [docs/COMO-FUNCIONA.md](docs/COMO-FUNCIONA.md).

---

## Preguntas frecuentes

**¿Necesito saber programar?**
No. Ese es justamente el punto.

**¿Y si no sé lo que es un PRD, o una épica, o INVEST?**
Tampoco importa. El plugin habla en cristiano y te va diciendo, de pasada, cómo se llama cada cosa en la industria. Te lo aprendes sin darte cuenta.

**¿Puedo parar a la mitad y seguir mañana?**
Sí. Guarda el avance solo. Vuelves, escribes `/documentar` y retoma donde quedaste.

**¿Y si me equivoqué en algo?**
Díselo hablando: *"la tarea 3 está mal, en realidad quiero que…"*. Lo corrige y revisa si eso afecta a lo demás.

**¿Funciona en inglés / para otro idioma?**
El plugin está escrito en español. Puedes pedirle que escriba los documentos en otro idioma y lo hará.

**¿Esto se lo puedo enseñar a un desarrollador sin que se ría?**
Sí. Los documentos cumplen los estándares reales: PRD de 12 componentes, historias de usuario con INVEST, criterios en Given/When/Then. Eso es lo que hay debajo del lenguaje sencillo.

---

## De dónde sale

Es una destilación de una vertical agéntica más grande, pensada originalmente para consultoría. Aquí se quitó todo lo que sobraba para alguien no técnico: la instalación por línea de comandos, los once comandos, la jerga.

Se quedó lo que importa: el método, los revisores automáticos y la garantía de que el resultado sirve de verdad.

Se entrega como regalo a la comunidad de Claude Code. **No es un producto con soporte comprometido** — es una herramienta que funciona, y que puedes forkear y adaptar a tu gusto.

---

## Licencia

MIT. Haz lo que quieras con esto.
