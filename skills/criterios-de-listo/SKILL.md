---
name: criterios-de-listo
description: Escribe cómo se comprueba que una tarea quedó bien hecha, en formato "Dado que / Cuando / Entonces". Cubre el caso normal, el caso de error y un caso raro. Actívala cuando el usuario diga "cómo sé que está listo", "qué tiene que pasar para darlo por bueno", "cómo se prueba esto" — y también cuando use el término técnico "criterios de aceptación", "acceptance criteria", "AC", "Gherkin", "BDD" o "Given/When/Then". Edita archivos `T-*.md` en `docs/3-tareas/`. Paso 3b de 5 (obligatorio).
category: Producto
tags: [criterios, aceptacion, bdd, gherkin, pruebas]
---

# criterios-de-listo

Toma una tarea existente (`docs/3-tareas/T-XXX-<slug>.md`) y completa su sección de criterios con 3-5 escenarios.

**Cómo se llama esto en la industria:** Acceptance Criteria en formato Given/When/Then (BDD / Gherkin).

## Contexto (fuente: METODO.md §4)

```
Dado que [en qué situación estamos]
Cuando [qué hace la persona]
Entonces [qué tiene que pasar, y se puede ver]
```

**Por qué importa:** escritos así, estos criterios se convierten directamente en pruebas automáticas. El equipo técnico los puede ejecutar tal cual. Es la diferencia entre "quedó bonito" y "quedó comprobado".

## Inputs requeridos

- Ruta a la tarea, o su ID `T-XXX`. Si hay varias sin criterios, listarlas y preguntar cuál.

## Reglas duras

1. **3-5 escenarios** por tarea. Si necesitas más, la tarea es demasiado grande — sugerir partirla.
2. **Cobertura mínima obligatoria**:
   - 1 **caso normal** (todo sale bien).
   - 1 **caso de error** (algo falla como se espera: dato inválido, sin permiso, no encontrado).
   - 1 **caso raro** (el límite que alguien con experiencia probando señalaría).
3. **"Dado que" describe una SITUACIÓN, no una acción.** *"Dado que estoy en la pantalla de búsqueda"* ✓. *"Dado que hago clic en buscar"* ✗ — eso es un "Cuando".
4. **"Cuando" describe UNA sola acción.** Si escribes *"Cuando escribo, presiono Enter y luego..."*, divídelo en escenarios separados.
5. **"Entonces" describe algo que se PUEDE VER**: cambia la pantalla, se guarda un dato, aparece un mensaje. Nada de *"entonces el sistema mejora"*.
6. **Cada escenario se sostiene solo** y se puede comprobar por separado.

## Flujo

1. **Cargar la tarea** y confirmar que la sección de criterios está pendiente.
2. **Razonar 3-5 escenarios** que cubran normal + error + raro.
3. **Escribir** cada uno con un título descriptivo y su bloque de tres líneas.
4. **Reemplazar solo la sección de criterios**, sin tocar el resto del archivo.
5. **Auto-chequeo**: contar escenarios, verificar formato, marcar cualquier "Cuando" compuesto o "Entonces" no observable.
6. **Reportar** lo escrito y cualquier ambigüedad.

## Ejemplo

Tarea: *"Búsqueda de cursos con sugerencias mientras escribes"*

```markdown
### Escenario 1 — Caso normal: sugerencias mientras escribo
- **Dado que** estoy en la página principal
- **Cuando** escribo al menos 3 letras en el buscador
- **Entonces** aparecen sugerencias de cursos en menos de medio segundo

### Escenario 2 — Caso de error: no hay resultados
- **Dado que** busco algo que no existe en el catálogo
- **Cuando** se muestran los resultados
- **Entonces** veo un mensaje "Sin resultados" junto a cursos sugeridos por categoría

### Escenario 3 — Caso raro: navegar sin mouse
- **Dado que** la lista de sugerencias está visible
- **Cuando** presiono flecha abajo y luego Enter
- **Entonces** entro al curso seleccionado sin haber usado el mouse
```

## Cómo explicárselo al usuario

> Estos tres renglones por escenario son lo que le va a permitir a quien construya
> tu producto saber exactamente cuándo terminó. Y a ti te dejan comprobarlo sin
> saber nada de tecnología: lees el "Entonces", lo haces, y ves si pasa.

## Handoff

- **Revisor**: el agente `revisor-de-criterios` audita formato y cobertura.
- **Siguiente paso recomendado**: `revisar-tareas` sobre esta tarea — ahora que tiene criterios, se puede comprobar que es verificable.
