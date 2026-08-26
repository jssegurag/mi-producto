#!/usr/bin/env bash
# donde-voy.sh — al abrir una sesión, dice en qué punto va el proyecto.
# Pensado para alguien no técnico: nada de inventarios, solo "vas por aquí y esto sigue".
#
# Uso: donde-voy.sh [directorio-del-proyecto]

set -euo pipefail

DIR="${1:-${CLAUDE_PROJECT_DIR:-$PWD}}"

# Si este proyecto no usa el plugin, callarse por completo.
[[ -d "$DIR/docs/1-la-idea" ]] || exit 0

contar() { find "$1" -maxdepth 1 -name "$2" 2>/dev/null | wc -l | tr -d ' '; }

IDEA=$(contar "$DIR/docs/1-la-idea" '*.md')
# LEEME.md y CLAUDE.md no cuentan como contenido
IDEA=$(( IDEA - $(contar "$DIR/docs/1-la-idea" 'LEEME.md') - $(contar "$DIR/docs/1-la-idea" 'CLAUDE.md') ))
BLOQUES=0; [[ -f "$DIR/docs/2-el-recorrido/bloques.md" ]] && BLOQUES=1
MAPA=0;    [[ -f "$DIR/docs/2-el-recorrido/mapa.md" ]] && MAPA=1
TAREAS=$(contar "$DIR/docs/3-tareas" 'T-*.md')
LISTA=0;   [[ -f "$DIR/docs/4-lista-de-trabajo/lista.md" ]] && LISTA=1
ORDEN=$(contar "$DIR/docs/5-que-va-primero" '*.md')
ORDEN=$(( ORDEN - $(contar "$DIR/docs/5-que-va-primero" 'LEEME.md') - $(contar "$DIR/docs/5-que-va-primero" 'CLAUDE.md') ))

# Tareas sin criterios de aceptación
SIN_CRITERIOS=0
if [[ "$TAREAS" -gt 0 ]]; then
  for f in "$DIR/docs/3-tareas/"T-*.md; do
    [[ -f "$f" ]] || continue
    grep -q 'Dado que' "$f" 2>/dev/null || SIN_CRITERIOS=$((SIN_CRITERIOS + 1))
  done
fi

marca() { [[ "$1" -gt 0 ]] && printf '✓' || printf '·'; }

echo "──────── Tu producto ────────"
printf '  %s 1. La idea\n'            "$(marca "$IDEA")"
printf '  %s 2. El recorrido\n'       "$(marca $(( BLOQUES + MAPA )))"
if [[ "$TAREAS" -gt 0 ]]; then
  printf '  ✓ 3. Las tareas (%s)\n' "$TAREAS"
else
  printf '  · 3. Las tareas\n'
fi
printf '  %s 4. La lista de trabajo\n' "$(marca "$LISTA")"
printf '  %s 5. Qué va primero\n'      "$(marca "$ORDEN")"

# Avisos (no sustituyen al «qué sigue», se suman)
echo ""
if [[ "$SIN_CRITERIOS" -eq 1 ]]; then
  echo "  Ojo: 1 tarea todavía no tiene criterios de aceptación."
elif [[ "$SIN_CRITERIOS" -gt 1 ]]; then
  echo "  Ojo: $SIN_CRITERIOS tareas todavía no tienen criterios de aceptación."
fi

# Qué sigue
if   [[ "$IDEA"    -eq 0 ]]; then echo "  Sigue: escribir el documento de tu idea  →  /documentar"
elif [[ $((BLOQUES + MAPA)) -lt 2 ]]; then echo "  Sigue: dividir el producto y dibujar el recorrido  →  /documentar"
elif [[ "$TAREAS"  -eq 0 ]]; then echo "  Sigue: escribir las tareas  →  /documentar"
elif [[ "$LISTA"   -eq 0 ]]; then echo "  Sigue: juntar todo en una lista  →  /documentar"
elif [[ "$ORDEN"   -eq 0 ]]; then echo "  Sigue: decidir qué va primero  →  /documentar"
else echo "  Todo completo. Para comprobar que está bien  →  /revisar"
fi

# Flujo a medias
if [[ -f "$DIR/docs/.progreso.json" ]]; then
  paso=$(grep -o '"ultimo_paso_completado"[^,}]*' "$DIR/docs/.progreso.json" 2>/dev/null | head -1 | cut -d'"' -f4)
  [[ -n "$paso" ]] && echo "  (dejaste un flujo a medias en «$paso» — /documentar lo retoma)"
fi
echo "─────────────────────────────"
