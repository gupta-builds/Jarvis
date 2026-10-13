#!/usr/bin/env bash
# 63-repo-contract-apply.sh (Build 5b). Adds the editor contract to CLEAN repos only: .editorconfig and .vscode/extensions.json.
# Never commits, never touches existing files, never touches a repo with uncommitted changes. Dry run unless --apply is given.
# Usage: 63-repo-contract-apply.sh [--apply] [repo ...]     (default: the three own clean repos; paths relative to ~/projects)
set -uo pipefail
APPLY=0; REPOS=()
for a in "$@"; do case "$a" in --apply) APPLY=1 ;; *) REPOS+=("$a") ;; esac; done
[ "${#REPOS[@]}" -gt 0 ] || REPOS=(hackathon/opspilot hackathon/safereach hub/Learning-Tracker-Tool)
SRC="$(cd "$(dirname "$0")/.." && pwd)/golden/repo/.editorconfig"
[ -f "$SRC" ] || { echo "golden .editorconfig not found: $SRC"; exit 1; }
for r in "${REPOS[@]}"; do
  d="$HOME/projects/$r"; echo "== $r"
  [ -d "$d/.git" ] || { echo "  not a repo, skipped"; continue; }
  if [ -n "$(git -C "$d" status --porcelain)" ]; then echo "  has uncommitted changes, skipped"; continue; fi
  exts='"editorconfig.editorconfig"'
  [ -f "$d/package.json" ] && { if [ -f "$d/biome.json" ] || [ -f "$d/biome.jsonc" ]; then exts="$exts, \"biomejs.biome\""; elif ls "$d"/eslint.config.* "$d"/.eslintrc* >/dev/null 2>&1; then exts="$exts, \"dbaeumer.vscode-eslint\""; fi; }
  { [ -f "$d/pyproject.toml" ] || [ -f "$d/requirements.txt" ]; } && exts="$exts, \"ms-python.python\", \"charliermarsh.ruff\""
  [ -f "$d/Cargo.toml" ] && exts="$exts, \"rust-lang.rust-analyzer\", \"tamasfe.even-better-toml\""
  if [ -e "$d/.editorconfig" ]; then echo "  .editorconfig exists, left alone"
  else echo "  + .editorconfig"; [ "$APPLY" = 1 ] && cp "$SRC" "$d/.editorconfig"; fi
  if [ -e "$d/.vscode/extensions.json" ]; then echo "  .vscode/extensions.json exists, left alone"
  else echo "  + .vscode/extensions.json  recommendations: [$exts]"; [ "$APPLY" = 1 ] && { mkdir -p "$d/.vscode"; printf '{\n  "recommendations": [%s]\n}\n' "$exts" > "$d/.vscode/extensions.json"; }; fi
  [ "$APPLY" = 1 ] && git -C "$d" status --short | sed 's/^/  git: /'
done
[ "$APPLY" = 1 ] || echo "DRY RUN. Re-run with --apply to create the files (they stay uncommitted)."
