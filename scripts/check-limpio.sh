#!/usr/bin/env bash
# check-limpio.sh — verifica que no quede rastro del repo del que se destiló este plugin.
# Correr antes de cualquier publicación.

set -uo pipefail

RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$RAIZ"

# Términos que NO pueden aparecer en nada de lo que se distribuye
TERMINOS=(
  "trycore"
  "Trycore"
  "TRYCORE"
  "spec-product-flow"
  "@trycore"
  "docs/01-prd"
  "docs/02-user-story-map"
  "docs/03-backlog"
  "docs/04-historias"
  "docs/05-priorizacion"
  "docs/06-flows"
  "METODOLOGIA.md"
)

# Qué se revisa (todo lo distribuible)
RUTAS=(commands skills agents hooks scripts templates METODO.md README.md docs .claude-plugin)

fallos=0
echo "── check-limpio ──"
for t in "${TERMINOS[@]}"; do
  hits=$(grep -rn --exclude-dir=.git -F -- "$t" "${RUTAS[@]}" 2>/dev/null | grep -v 'check-limpio.sh' || true)
  if [[ -n "$hits" ]]; then
    echo "✗ Encontrado «${t}»:"
    echo "$hits" | sed 's/^/    /'
    fallos=$((fallos + 1))
  fi
done

# Los nombres de skills y agentes que se citan deben existir
echo "── referencias cruzadas ──"
for d in skills/*/; do
  nombre="$(basename "$d")"
  declarado="$(grep -m1 '^name:' "$d/SKILL.md" 2>/dev/null | sed 's/^name: *//')"
  if [[ "$nombre" != "$declarado" ]]; then
    echo "✗ skills/$nombre declara name: «${declarado}» (deben coincidir)"
    fallos=$((fallos + 1))
  fi
done
for f in agents/*.md; do
  nombre="$(basename "$f" .md)"
  declarado="$(grep -m1 '^name:' "$f" | sed 's/^name: *//')"
  if [[ "$nombre" != "$declarado" ]]; then
    echo "✗ $f declara name: «${declarado}» (deben coincidir)"
    fallos=$((fallos + 1))
  fi
done

echo "──────────────────"
if [[ "$fallos" -eq 0 ]]; then
  echo "✓ Limpio. Listo para publicar."
  exit 0
else
  echo "✗ $fallos problema(s). No publicar hasta resolverlos."
  exit 1
fi
