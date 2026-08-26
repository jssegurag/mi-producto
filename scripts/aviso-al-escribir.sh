#!/usr/bin/env bash
# aviso-al-escribir.sh — tras escribir un archivo en docs/, avisa si le falta algo obvio.
# Silencioso por diseño: solo habla cuando hay un problema real. Nunca bloquea.
#
# Uso: aviso-al-escribir.sh <ruta-del-archivo>

set -euo pipefail

ARCHIVO="${1:-}"
[[ -n "$ARCHIVO" && -f "$ARCHIVO" ]] || exit 0
case "$ARCHIVO" in */docs/*) ;; *) exit 0 ;; esac

base="$(basename "$ARCHIVO")"

case "$ARCHIVO" in
  */3-tareas/T-*.md)
    faltan=()
    grep -q 'Dado que' "$ARCHIVO" 2>/dev/null || faltan+=("los criterios de aceptación (Dado que / Cuando / Entonces)")
    grep -q '^bloque:'  "$ARCHIVO" 2>/dev/null || faltan+=("a qué bloque pertenece")
    grep -qE '^Como \*\*|^Como ' "$ARCHIVO" 2>/dev/null || faltan+=("el formato «Como… quiero… para…»")
    if [[ ${#faltan[@]} -gt 0 ]]; then
      echo "· A $base le falta: $(printf '%s; ' "${faltan[@]}" | sed 's/; $//')"
    fi
    ;;
  */1-la-idea/*.md)
    case "$base" in LEEME.md|CLAUDE.md) exit 0 ;; esac
    grep -qi 'no ' "$ARCHIVO" 2>/dev/null || true
    grep -qiE 'qué no|fuera de alcance|non-goal' "$ARCHIVO" 2>/dev/null \
      || echo "· $base no dice qué NO va a hacer el producto. Eso evita que se construya de más."
    ;;
  */6-pantallas/B-*.md)
    grep -q '%% T-' "$ARCHIVO" 2>/dev/null \
      || echo "· $base tiene pasos sin la marca «%% T-XXX» que los conecta con una tarea."
    ;;
esac

exit 0
