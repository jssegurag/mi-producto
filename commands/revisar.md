---
name: "Revisar"
description: Revisa todos tus documentos y te dice qué está bien y qué falta, con un semáforo. Úsalo antes de enseñarle el trabajo a alguien.
category: Calidad
tags: [revisar, calidad, informe]
---

Atajo a la skill **`revisar-todo`**. Despacha a los revisores sobre todo lo que exista en `docs/` y entrega un solo informe.

**Entrada opcional**: si el usuario acota (*"solo las tareas"*), restringe la revisión a eso.

---

## Comportamiento

1. **Mirar qué existe** en `docs/`. Si no hay nada todavía:
   > *"Todavía no hay documentos que revisar. ¿Empezamos por escribir tu idea?"*

2. **Activar la skill `revisar-todo`**, que despacha en paralelo a los revisores que apliquen.

3. **Entregar un solo informe** con semáforo. El detalle queda en `docs/.revisiones/`.

4. **Ofrecer arreglar** lo que salió en rojo.

---

## Formato del informe

```
## Revisión completa

🟢 Bien
   · Tu documento de producto tiene las 12 partes
   · Las 14 tareas están conectadas a un bloque
   · Todos tus objetivos están cubiertos

🟡 Conviene arreglar
   · 3 tareas no tienen criterios (T-009, T-011, T-012)
     → Sin eso nadie sabe cuándo están terminadas
   · El bloque B-004 todavía no tiene ninguna tarea

🔴 Hay que arreglar antes de enseñarlo
   · El objetivo "reducir llamadas al soporte" no lo cubre nada
     → O falta una parte del producto, o ese objetivo sobra

¿Empiezo por lo rojo?
```

---

## Reglas

- **Un solo informe**, no uno por revisor.
- **Cada hallazgo trae el porqué.** No basta decir "faltan criterios"; hay que decir qué se rompe sin ellos.
- **Usa el semáforo**, no niveles de severidad técnicos.
- **Ordena por impacto**, no por el orden en que llegaron los revisores.
- **No arregles nada sin permiso.** Este comando informa; arreglar es una decisión del usuario.
- Si todo está en verde, dilo claro y celébralo: *"Todo en orden. Esto ya se lo puedes enseñar a un equipo técnico."*
