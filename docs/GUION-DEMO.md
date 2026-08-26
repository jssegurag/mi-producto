# Guion de demo — 10 minutos

Para una audiencia **mixta** (desarrolladores + gente de producto y negocio), corriendo **en vivo con red de seguridad**, con el objetivo de que **lo instalen esa misma noche**.

---

## Antes de subir

Prepara **dos ventanas de Claude Code** y déjalas abiertas antes de empezar. No las abras en escena.

**Ventana A — la demo en vivo.** Carpeta vacía, `git init` hecho, plugin ya instalado. Fuente grande (16-18pt mínimo). Terminal limpia, sin historial visible.

**Ventana B — la red de seguridad.** Un proyecto **ya generado completo** con el mismo ejemplo que vas a usar en vivo. Los 6 documentos escritos, la lista ordenada, todo. Esta ventana es tu seguro: si la generación se alarga o algo falla, saltas aquí y nadie se entera.

> **Genera la ventana B el día anterior, no una hora antes.** Si el ejemplo de la B no coincide con lo que digas en vivo, el salto se nota.

**Checklist:**

- [ ] Plugin instalado y probado en la máquina que vas a usar (no en otra)
- [ ] Ventana B generada, revisada y con el `docs/` abierto en un editor al lado
- [ ] Modo de no-molestar activado; notificaciones fuera
- [ ] El comando de instalación copiado en el portapapeles **y** en una diapositiva de respaldo
- [ ] Probado con el wifi del sitio, no solo con el de tu casa

---

## 0:00 – 1:00 · El gancho

**No empieces explicando qué es el plugin.** Empieza con el dolor, que en una sala mixta es el mismo para los dos bandos.

> *"Levanten la mano los que alguna vez recibieron este mensaje: «parce, tengo una idea para una app».*
>
> *[pausa, deja que se rían]*
>
> *Y ahora los del otro lado: los que alguna vez **fueron** los que mandaron ese mensaje, y del otro lado les respondieron con veinte preguntas que no sabían contestar."*

Ese es el gancho: **las dos mitades de la sala son las dos mitades del problema.**

> *"El problema no es que la idea sea mala. Es que entre «tengo una idea» y «alguien puede construir esto» hay un trabajo real — que tiene nombre, que tiene método, y que casi nadie hace porque es aburrido y hay que saber hacerlo.*
>
> *Eso es lo que vamos a automatizar. En diez minutos, de un mensaje de WhatsApp a un backlog priorizado."*

---

## 1:00 – 1:40 · La instalación, ya

**Ponla en pantalla ahora, no al final.** El objetivo de esta charla es que salgan de aquí con el plugin instalado; si lo dejas para el minuto 9, la mitad ya se fue mentalmente.

```
/plugin marketplace add jssegurag/mi-producto
/plugin install mi-producto
```

> *"Esto es todo lo que hace falta. Dos líneas dentro de Claude Code. No hay npm, no hay clonar nada, no hay Node, no hay archivo de configuración.*
>
> *Sáquenle foto ahora. Yo espero."*

**Espera de verdad.** Cuenta hasta cinco. Ese silencio incómodo es el que convierte espectadores en usuarios.

> *"Los que lo instalen mientras hablo, pueden ir siguiéndome."*

**Deja el comando visible** en una esquina o en la diapositiva de fondo durante el resto de la charla.

---

## 1:40 – 3:00 · `/empezar`

Ventana A. Teclea en vivo:

```
/empezar
```

Te va a hacer dos preguntas. Contéstalas **hablando en voz alta mientras escribes**, con el ejemplo del cuñado:

1. *¿Qué quieres construir?* → **"Una app para reservar canchas de fútbol por horas, que además arme los equipos si vas solo"**
2. *¿Quién lo va a usar?* → **"Gente que juega fútbol con amigos los fines de semana y siempre le toca a uno organizar"**

Mientras se prepara, di la frase que le habla a **los dos bandos** a la vez:

> *"Fíjense en lo que NO me preguntó. No me preguntó qué framework de priorización quiero. No me preguntó por los stakeholders. No me preguntó si quiero el PRD en formato largo o corto.*
>
> *Eso es una decisión de diseño, y es la más importante de todas: **la herramienta no le puede pedir al usuario que ya sepa la respuesta.** Si tu primera pregunta es «¿MoSCoW o RICE?», perdiste a la persona que más te necesitaba."*

Enseña rápido lo que creó — las 6 carpetas, en el editor de al lado:

> *"Y miren los nombres de las carpetas. No dice `01-prd`. Dice `1-la-idea`. Pero abran el LEEME de adentro..."*

Abre `docs/1-la-idea/LEEME.md` y **lee la línea en voz alta**:

> *"«Cómo se llama esto en la industria: un PRD.»*
>
> *Esto es lo que yo llamo el puente. La persona trabaja en un idioma que entiende, y de paso aprende el idioma con el que va a tener que hablar cuando contrate a alguien. No la tratamos como tonta: la estamos enseñando de contrabando."*

---

## 3:00 – 6:00 · `/documentar`, en vivo

```
/documentar
```

Aquí Claude arranca a escribir el documento de producto. **Va a tardar.** Ese tiempo no es un problema: es tu espacio para hablar. Lo que **no** puedes hacer es quedarte callado mirando el spinner.

### Qué decir mientras genera (guion para el hueco)

**Primeros ~40 segundos — para la mitad de negocio:**

> *"Lo que está escribiendo ahora tiene doce partes obligatorias. Y hay una que casi nadie escribe nunca, que es la que más plata ahorra: **qué NO va a hacer el producto.***
>
> *Todo el mundo escribe lo que su app va a hacer. Nadie escribe lo que no. Y por eso los proyectos se estiran: porque nunca quedó escrito dónde estaba el borde."*

**Siguientes ~40 segundos — para la mitad técnica:**

> *"Y esto no es un prompt largo pidiendo un documento bonito. Detrás hay una skill con reglas duras. Si los objetivos no son medibles, los rechaza. Si el «qué no hace» viene vacío, lo marca. Y cuando termine, **otro agente distinto** lo va a auditar, en contexto limpio, sin haberlo escrito él.*
>
> *Esa separación es deliberada: quien revisa no puede ser quien escribió. Un modelo revisando su propio output es un modelo diciéndote que sí."*

### El checkpoint

Cuando termine el paso 1, aparece el checkpoint. **Este es el momento más importante de la demo.** Léelo en voz alta, tal cual está en pantalla:

> ```
> ✓ Listo 1 de 5: la idea de tu producto
>   Lo revisé. Hay 2 cosas que conviene aclarar:
>   · No dice cómo vas a saber si funcionó
>   ¿Las arreglamos, sigo adelante, o paramos aquí?
> ```

Y ahora la frase que quieres que se lleven:

> *"Miren cómo está escrito eso. No dice «2 issues bloqueantes detectados por el agente validador». Dice qué falta y por qué importa.*
>
> *Es la misma información. Pero una versión te hace sentir que estás usando una herramienta profesional, y la otra te hace sentir que no deberías estar aquí."*

Responde **seguir**, y deja que arranque el paso 2 (los bloques y el recorrido).

### 🔴 Punto de decisión — minuto 6

**Mira el reloj.** Si el paso 2 no ha terminado para el minuto 6, **no lo esperes**. Di:

> *"Esto sigue trabajando y va a tardar un par de minutos más. Como no les voy a hacer ver un spinner, déjenme mostrarles cómo queda esto mismo cuando termina — lo dejé corriendo anoche."*

Y salta a la **ventana B**. Dicho así no es una excusa: es cortesía con el público.

---

## 6:00 – 7:30 · El resultado (ventana B)

Ventana B, con el editor abierto al lado. **No leas los documentos. Enséñalos rápido y quédate en uno solo.**

Recorre las carpetas en 20 segundos:

> *"La idea. El recorrido. Catorce tareas. La lista completa. Y qué va primero."*

Abre **una sola tarea** y ve directo a los criterios:

> *"Y aquí está lo que hace que esto no sea un documento bonito sino algo que sirve. Cada tarea trae cómo se comprueba:*
>
> *«Dado que estoy en la pantalla de búsqueda, cuando escribo tres letras, entonces aparecen sugerencias en menos de medio segundo.»*
>
> *Para la mitad de negocio de la sala: usted no necesita saber programar para verificar eso. Lo hace, y ve si pasa.*
>
> *Para la mitad técnica: eso es Gherkin. Se convierte en un test automatizado tal cual está escrito, sin traducir nada."*

Cierra con la priorización — abre `docs/5-que-va-primero/`:

> *"Y esto de aquí, «Ahora no». Es la categoría que nadie usa y la que más vale.*
>
> *No dice «esto no sirve». Dice «esto no va en esta vuelta», por escrito, con fecha y con quién estaba en la conversación. Cuando en tres meses alguien pregunte por qué no hicimos eso primero, la respuesta ya está escrita."*

---

## 7:30 – 8:45 · El motor (para la mitad técnica)

Cambia el tono. Esto es explícitamente para los devs, y avísalo — así la otra mitad no siente que se perdió.

> *"Un minuto para los que están pensando «¿y esto cómo está hecho?». Los demás, aguántenme."*

Enseña la estructura del repo. **Tres ideas, sin entrar en código:**

**1. Skills, agentes y hooks son cosas distintas.**
> *"Las skills saben escribir. Los agentes saben auditar, y corren en contexto limpio. Los hooks son la red: uno te dice al abrir sesión en qué punto vas, otro te avisa en silencio si escribiste una tarea sin criterios. Ninguno bloquea nada."*

**2. Las descripciones son bilingües.** Este es el truco que se llevan a sus propios plugins:
> *"Las skills se llaman en español natural, pero su descripción trae los dos vocabularios. «Actívala cuando el usuario diga mi idea — y también cuando diga PRD.»*
>
> *La misma skill, dos puertas de entrada. El que no sabe la activa hablando; el que sabe la activa con el término técnico. No hay que elegir un público."*

**3. La honestidad sobre el límite.** Esto te da credibilidad ante una sala técnica:
> *"Y les digo lo que no es: eso es un nudge semántico, no una garantía del sistema. Claude lo pondera, no lo obedece. Por eso hay tres comandos explícitos — son la red para cuando el nudge no alcanza. Prometer determinismo donde no lo hay es cómo se pierde la confianza de una sala como esta."*

---

## 8:45 – 10:00 · Cierre

Vuelve al comando de instalación en pantalla. **Siempre se cierra donde se quiere que actúen.**

```
/plugin marketplace add jssegurag/mi-producto
/plugin install mi-producto
```

> *"Está en MIT. Está público. Fórkenlo, cámbienle los nombres, quítenle lo que no les sirva.*
>
> *Y tres formas de usarlo, según de qué lado de la sala estén:*
>
> *Si tienen una idea — úsenlo esta noche. Media hora y tienen algo que se le puede enseñar a alguien.*
>
> *Si son quienes construyen — dénselo a la persona que les manda requerimientos por WhatsApp. Van a recibir de vuelta algo con criterios de aceptación, y van a dejar de hacer de traductores.*
>
> *Y si están armando sus propios plugins — miren cómo están escritas las descripciones. Ese detalle es el que hace que una herramienta sirva para dos públicos sin partirse en dos."*

Última frase, y esta te la aprendes de memoria:

> *"El objetivo no es que la gente aprenda a hablar como nosotros. Es que nosotros dejemos de exigírselo.*
>
> *Gracias."*

---

## Si algo falla

| Qué pasa | Qué haces |
|---|---|
| La generación se cuelga o va lentísima | *"Déjenme mostrarles el que dejé corriendo anoche"* → ventana B. **Nunca** digas "se rompió". |
| Se cae el wifi | Ventana B ya tiene todo generado en disco. La demo sigue sin conexión. |
| Claude escribe algo flojo o raro | **Aprovéchalo.** *"Miren, eso quedó vago. Y aquí es donde importa el checkpoint"* → pides corregir. Sale mejor charla que si todo hubiera salido perfecto. |
| Te quedas sin tiempo en el minuto 7 | Salta el bloque del motor entero. Ve directo al cierre. La instalación pesa más que la arquitectura. |
| Alguien pregunta si esto reemplaza a un Product Owner | *"No. Le quita la parte mecánica para que use su tiempo en hablar con usuarios, que es lo que un modelo no puede hacer por él."* |
| Alguien pregunta por el costo en tokens | Sé concreto: un flujo completo son varias llamadas largas. Di que depende del tamaño del producto y que el checkpoint permite parar cuando quieras. |

---

## Recortes según el reloj

Si vas tarde, corta **en este orden** — de menos a más doloroso:

1. El bloque del motor (7:30–8:45) — 75 segundos, se puede prometer para el final o para el repo
2. La priorización en el minuto 7 — 30 segundos
3. El paso 2 en vivo: salta a la ventana B justo después del primer checkpoint

**Nunca cortes:** el gancho, la instalación, ni el checkpoint del minuto 5. Ese trío es la charla; lo demás es adorno.
