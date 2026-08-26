---
name: revisar-tareas
description: Comprueba que una tarea está bien escrita, contra 6 preguntas de calidad. Actívala cuando el usuario diga "está bien esta tarea", "revisa lo que escribí", "esto se entiende", "es muy grande esta tarea" — y también cuando use el término técnico "INVEST", "validar INVEST" o "criterios INVEST". Lee `docs/3-tareas/T-*.md`. Chequeo de calidad transversal, obligatorio antes de marcar una tarea como `lista`.
category: Calidad
tags: [calidad, revision, invest, tarea]
---

# revisar-tareas

Valida una tarea (o varias) contra las **6 preguntas de calidad** y reporta el resultado con su razonamiento.

**Cómo se llama esto en la industria:** los criterios INVEST.

## Las 6 preguntas (fuente: METODO.md §3)

| # | En cristiano | Nombre técnico | Cómo se comprueba |
|---|---|---|---|
| 1 | ¿Se puede hacer sola? | **I**ndependent | ¿Se puede construir sin esperar a que otra esté lista? |
| 2 | ¿Deja decidir el "cómo"? | **N**egotiable | El "qué" es fijo; el "cómo" lo decide quien construye |
| 3 | ¿Le importa a alguien? | **V**aluable | Si se la cuentas a un cliente, ¿le interesa? Valor visible, no técnico |
| 4 | ¿Se puede calcular? | **E**stimable | ¿Quien construye sabe más o menos cuánto le cuesta? |
| 5 | ¿Es pequeña? | **S**mall | ¿Cabe en unos pocos días? Si no, hay que partirla |
| 6 | ¿Se puede comprobar? | **T**estable | ¿Tiene criterios claros? Sin criterios, esta falla siempre |

## Inputs requeridos

- Ruta a la tarea o tareas. Si se pasa una carpeta, validar todas.

## Reglas duras

1. **Una tarea debe pasar las 6** antes de marcarse como `lista`.
2. **Si falla "se puede comprobar"** porque no tiene criterios → no vale decir "pendiente". Activa `criterios-de-listo` primero.
3. **Si falla "es pequeña"** → proponer cómo partirla **por funcionalidad completa**, no por capas técnicas. Partir en "primero la pantalla, luego la base de datos" está mal: ninguna de las dos mitades sirve sola. Partir en "primero buscar por nombre, luego filtrar por fecha" está bien.
4. **Si "le importa a alguien" es dudoso** → preguntar al usuario quién se beneficia y en qué. Si no hay respuesta, la tarea no debería existir.

## Flujo

1. **Listar** las tareas a revisar.
2. **Para cada una**, evaluar las 6 con razonamiento explícito.
3. **Generar el reporte**:

   | Tarea | Sola | Cómo | Importa | Calculable | Pequeña | Comprobable | Qué hacer |
   |---|---|---|---|---|---|---|---|
   | T-001 | ✓ | ✓ | ✓ | ✓ | ✗ | ✓ | Partir en dos: buscar, y filtrar |

4. **Si hay más de 5 tareas o hay ambigüedad**, invocar al agente `revisor-de-tareas` para una segunda opinión con contexto limpio.
5. **Sugerir** marcar como `lista` solo las que pasaron las 6.

## Anti-patrón: el visto bueno automático

Marcar las 6 cajas con ✓ sin razonar es **peor que no revisar**: da una falsa sensación de calidad. Esta skill **siempre** muestra el porqué detrás de cada ✓ y sobre todo detrás de cada ✗. Si no tienes fundamento, marca "?" y pregunta.

## Handoff

- Si todas pasan: sugerir seguir a `lista-de-trabajo` o a `decidir-que-va-primero`.
- Si fallan: corregir y volver a revisar.
