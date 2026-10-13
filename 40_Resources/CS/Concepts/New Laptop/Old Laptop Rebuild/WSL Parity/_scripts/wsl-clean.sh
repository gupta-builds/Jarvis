#!/usr/bin/env bash
# wsl-clean.sh (Build 5): safe user-level cleanup of REGENERABLE caches only. No sudo.
# Usage: wsl-clean.sh [--apply] [--items a,b,c] [--auto]
#   default is a dry run that prints what would go. --apply deletes. --auto is for the timer (apply, quiet).
# Items: npx (dirs >14d in ~/.npm/_npx), vsix (VSIX caches >14d), logs (editor-server logs >14d),
#        containers (old ~/.vscode-remote-containers/bin hashes >60d, newest one kept), cache (small ~/.cache dirs >30d)
# Never touched: ~/.cache/node (holds Corepack's pinned pnpm; deleting it makes pnpm jump to the newest release), .vscode-server/extensions, any server/bin hash in use, .cursor-server snapshots and globalStorage,
#                ~/.cache/ms-playwright (slow to re-download), uv cache.
set -uo pipefail
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"
APPLY=0; AUTO=0; ITEMS="npx,vsix,logs,containers,cache"
while [ $# -gt 0 ]; do
  case "$1" in
    --apply) APPLY=1 ;; --auto) APPLY=1; AUTO=1 ;;
    --items) shift; ITEMS="$1" ;;
    --help|-h) sed -n '2,10p' "$0"; exit 0 ;;
    *) echo "unknown option $1" >&2; exit 2 ;;
  esac; shift
done
LOGDIR="$HOME/.local/state/wsl-clean"; mkdir -p "$LOGDIR"
LOG="$LOGDIR/clean-$(date +%Y%m%d-%H%M%S).log"
TOTAL=0
say() { [ "$AUTO" = 1 ] || printf '%s\n' "$*"; printf '%s\n' "$*" >> "$LOG"; }
editor_running() { pgrep -f -- '/\.(vscode|cursor)-server/(bin|cli|extensions)/|/\.vscode-remote-containers/bin/' >/dev/null 2>&1; }
want() { case ",$ITEMS," in *",$1,"*) return 0;; *) return 1;; esac; }
rm_path() { # path
  local p="$1" mb; mb=$(du -sm "$p" 2>/dev/null | cut -f1); mb=${mb:-0}
  if pgrep -f -- "$p" >/dev/null 2>&1; then say "skipped (in use by a running process) $p"; return 0; fi
  TOTAL=$((TOTAL+mb))
  if [ "$APPLY" = 1 ]; then rm -rf -- "$p" && say "removed ${mb}MB $p"; else say "would remove ${mb}MB $p"; fi
}
say "== wsl-clean $(date -Is) apply=$APPLY items=$ITEMS"
if want npx && [ -d "$HOME/.npm/_npx" ]; then
  while IFS= read -r -d '' p; do rm_path "$p"; done < <(find "$HOME/.npm/_npx" -mindepth 1 -maxdepth 1 -mtime +14 -print0)
fi
if want vsix || want logs || want containers; then
  if editor_running; then say "editor server process is running: skipping vsix, logs and containers items"; ITEMS="${ITEMS//vsix/}"; ITEMS="${ITEMS//logs/}"; ITEMS="${ITEMS//containers/}"; fi
fi
if want vsix; then
  for d in "$HOME/.vscode-server/data/CachedExtensionVSIXs" "$HOME/.cursor-server/data/CachedExtensionVSIXs"; do
    [ -d "$d" ] && while IFS= read -r -d '' p; do rm_path "$p"; done < <(find "$d" -mindepth 1 -maxdepth 1 -mtime +14 -print0)
  done
fi
if want logs; then
  for d in "$HOME/.vscode-server/data/logs" "$HOME/.cursor-server/data/logs"; do
    [ -d "$d" ] && while IFS= read -r -d '' p; do rm_path "$p"; done < <(find "$d" -mindepth 1 -maxdepth 1 -mtime +14 -print0)
  done
fi
if want containers && [ -d "$HOME/.vscode-remote-containers/bin" ]; then
  newest=$(ls -1t "$HOME/.vscode-remote-containers/bin" | head -n 1)
  while IFS= read -r -d '' p; do [ "$(basename "$p")" = "$newest" ] || rm_path "$p"; done < <(find "$HOME/.vscode-remote-containers/bin" -mindepth 1 -maxdepth 1 -mtime +60 -print0)
fi
if want cache && [ -d "$HOME/.cache" ]; then
  for n in pip typescript pre-commit mesa_shader_cache opencode; do
    p="$HOME/.cache/$n"; [ -d "$p" ] && [ -n "$(find "$p" -maxdepth 0 -mtime +30)" ] && rm_path "$p"
  done
fi
say "== total ${TOTAL}MB $([ "$APPLY" = 1 ] && echo removed || echo reclaimable) (log: $LOG)"
exit 0
