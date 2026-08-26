---
name: flujo-completo
description: Orquesta los 5 pasos seguidos, de la idea hasta la lista de trabajo ordenada, parando en cada paso para que el usuario apruebe. Guarda el avance para poder retomar si se corta la sesión. Actívala cuando el usuario diga "hazlo todo", "el proceso completo", "de principio a fin", "documenta mi idea entera" o use el comando /documentar — y también con el término técnico "pipeline completo". No se activa para editar un documento suelto.
category: Producto
tags: [orquestador, flujo, completo, avance]
---

# flujo-completo

Ejecuta el proceso documental completo, paso a paso, parando en cada uno para que el usuario apruebe o corrija.

Esta skill **no escribe artefactos directamente** — encadena a las que sí lo hacen.

## El proceso

```
1. La idea              documento-de-idea         → docs/1-la-idea/<slug>.md
2. El recorrido         agrupar-en-bloques        → docs/2-el-recorrido/bloques.md
                        mapa-del-recorrido        → docs/2-el-recorrido/mapa.md
3. Las tareas    (loop) escribir-tarea
                      + criterios-de-listo        → docs/3-tareas/T-*.md
4. La lista             lista-de-trabajo          → docs/4-lista-de-trabajo/lista.md
5. Qué va primero       decidir-que-va-primero    → docs/5-que-va-primero/...

6. Las pantallas (opcional, se OFRECE al final)
                        dibujar-pantallas         → docs/6-pantallas/B-*.md
```

El contador que ve el usuario va **"de 5"**. Las pantallas se ofrecen como extra al terminar, no como un pendiente.

## Guardar el avance

Escribe `docs/.progreso.json` después de cada paso completado:

```json
{
  "ultimo_paso_completado": "el-recorrido",
  "datos": {"slug": "reservas-canchas", "metodo_prioridad": "debe-deberia-podria"},
  "fecha": "2026-08-26T14:30:00Z",
  "tareas_pendientes": ["T-003", "T-004", "T-005"]
}
```

Si al arrancar ese archivo ya existe, **preguntar primero**: retomar desde donde quedó, o empezar de nuevo.

Explícaselo al usuario en cristiano: *"Veo que ya habías avanzado hasta el paso 2. ¿Seguimos desde ahí, o prefieres empezar de cero?"*

## Los checkpoints

Después de cada paso:

1. Mostrar qué se generó y dónde.
2. Resumir lo que el agente revisor encontró, **en lenguaje natural**.
3. Preguntar: **arreglar / seguir / parar aquí**.

Formato:

```
✓ Listo 2 de 5: el recorrido de tu producto
  → docs/2-el-recorrido/bloques.md
  → docs/2-el-recorrido/mapa.md

  Tu producto se divide en 4 bloques, y dibujé el camino
  completo que hace una persona al usarlo.

  Marqué qué entra en la primera versión: los 3 primeros
  bloques. Con eso alguien ya puede reservar una cancha
  de principio a fin.

  Una cosa por revisar:
  · El objetivo "reducir llamadas al soporte" no lo cubre
    ningún bloque

  ¿Lo arreglamos, sigo con las tareas, o paramos aquí?
```

## Reglas duras

1. **No saltar pasos.** Si el usuario dice *"sáltate el mapa"*, explicar en una frase por qué importa y permitirlo **solo si insiste**. Ejemplo: *"El mapa es lo que te dice qué construir primero. Sin él acabas con una lista plana donde todo parece igual de urgente. ¿Aun así lo saltamos?"*
2. **Cada paso pasa su revisión** antes del siguiente. El agente revisor se invoca siempre, sin depender de los hooks.
3. **Parar ante un problema bloqueante.** Si el revisor encuentra algo que rompe lo que viene (ej. objetivos que no se pueden medir), pausar hasta corregir. **No** avanzar a bloques con un documento de producto inválido.
4. **Guardar el avance siempre**, incluso si el usuario aborta.
5. **Nunca dejar al usuario sin saber qué sigue.** Cada mensaje termina con una pregunta concreta o un próximo paso.

## Flujo

1. **Detectar avance previo** → retomar o empezar de nuevo.
2. **Recopilar lo mínimo** para arrancar (de qué va la idea).
3. **Paso 1** (la idea) → checkpoint → guardar → paso 2.
4. **Paso 2** (bloques, luego mapa) → checkpoint → guardar → paso 3.
5. **Paso 3** (bucle de tareas). Cada tarea es un mini-checkpoint. Si se anticipan **más de 8 tareas**, ofrecer: *"Son unas 12 tareas. ¿Las escribo todas de corrido y las revisamos juntas al final, o prefieres irlas viendo de a una?"*
6. **Paso 4** (la lista) → checkpoint.
7. **Paso 5** (qué va primero) → checkpoint.
8. **Ofrecer el extra**: *"Con esto ya tienes todo lo necesario para que alguien construya tu producto. Si quieres, puedo dibujarte además los diagramas de cómo se navega entre pantallas. ¿Te sirve?"*
9. **Cierre**: resumen de qué se generó, qué quedó pendiente y qué hacer con ello.
10. **Marcar el avance como terminado**.

## El cierre

El último mensaje es el que el usuario se lleva. Que sea concreto:

```
## Ya está 🎉

Tienes 5 documentos que describen tu producto completo:

  docs/1-la-idea/           qué es y para quién
  docs/2-el-recorrido/      en qué partes se divide y en qué orden
  docs/3-tareas/            14 tareas, cada una con sus criterios
  docs/4-lista-de-trabajo/  todo junto, en orden
  docs/5-que-va-primero/    qué se construye primero y por qué

Qué puedes hacer ahora:

· Enseñárselo a alguien que programe — con esto puede empezar
· Pedir presupuesto: la lista de trabajo es lo que se cotiza
· Seguir tú mismo: pídele a Claude que construya la tarea T-001

Cuando cambies de idea sobre algo, dímelo y actualizo lo que
haga falta — todo está conectado.
```

## Anti-patrones

- Saltarse el mapa del recorrido → se pierde el hilo y la primera versión queda mal definida.
- Generar 50 tareas sin ordenarlas → el equipo no sabe por dónde empezar.
- No parar en los checkpoints → el usuario solo ve el resultado al final, sin poder corregir a tiempo.
- Terminar con jerga → si el último mensaje dice "pipeline completado, 0 issues bloqueantes", perdiste al usuario justo en la meta.
