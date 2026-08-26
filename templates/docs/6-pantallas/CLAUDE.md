# CLAUDE.md — docs/6-pantallas/

Reglas locales para esta carpeta. El método completo está en `METODO.md` §5a.

## Archivos

Uno por bloque: `B-XXX-<slug>.md`. **Nunca un solo archivo global** con todo el producto: crece sin control y deja de ser legible.

## Reglas que no se negocian

1. **Cada flecha del diagrama lleva `%% T-XXX`** justo antes, apuntando a la tarea que la respalda. Sin esa marca, el paso se considera inventado.
2. **Cero pasos sin criterio detrás.** Si falta uno, detenerse y proponer escribirlo antes de seguir.
3. **Solo actores que aparezcan en `docs/1-la-idea/`.**
4. **Cobertura**: camino normal + ≥1 rama de error + ≥1 caso raro.
5. **El Mermaid tiene que ser válido.** `sequenceDiagram` para ida y vuelta persona↔sistema; `flowchart TD` cuando dominan las decisiones. No mezclar ambos en un bloque.

## Skill y revisor

- Skill: `dibujar-pantallas`
- Revisor: `revisor-de-pantallas`

## Qué NO va aquí

Imágenes o dibujos en ASCII. El resultado es texto versionable y auditable; los diagramas son el contrato.
