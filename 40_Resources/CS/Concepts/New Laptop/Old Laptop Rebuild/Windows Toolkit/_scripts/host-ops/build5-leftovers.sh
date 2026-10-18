#!/usr/bin/env bash
# build5-leftovers.sh  (Build 4b, A10, 2026-10-15)  ASCII only. Helper for 07-build5-leftovers.ps1; no quoting passes through PowerShell.
#   build5-leftovers.sh check                 prints cursor_server=<n> and SIZE|<name>|<size or missing>|<path> for each item
#   build5-leftovers.sh move cursor <dest>    moves the Cursor server items (snapshots, agent-worker) into <dest> (a /mnt/d path)
#   build5-leftovers.sh move pnpm <dest>      moves the old pnpm v10 stores into <dest>
# Items (all under $HOME). pnpm v3 (1.8 GB, last written 2026-02-22) is deliberately NOT listed: it was not approved.
mode="${1:-check}"; group="${2:-}"; dest="${3:-}"
declare -A path=(
  [cursor-snapshots]="$HOME/.cursor-server/data/snapshots"
  [cursor-agent-worker]="$HOME/.cursor-server/data/User/globalStorage/anysphere.cursor-agent-worker"
  [pnpm-v10-share]="$HOME/.local/share/pnpm/store/v10"
  [pnpm-v10-home]="$HOME/.pnpm-store/v10"
)
cursor_items=(cursor-snapshots cursor-agent-worker)
pnpm_items=(pnpm-v10-share pnpm-v10-home)
if [ "$mode" = "check" ]; then
  echo "cursor_server=$(pgrep -fc '[c]ursor-server')"
  for k in "${cursor_items[@]}" "${pnpm_items[@]}"; do
    p="${path[$k]}"
    if [ -e "$p" ]; then echo "SIZE|$k|$(du -sh "$p" 2>/dev/null | cut -f1)|$p"; else echo "SIZE|$k|missing|$p"; fi
  done
  exit 0
fi
if [ "$mode" = "move" ]; then
  case "$group" in cursor) items=("${cursor_items[@]}") ;; pnpm) items=("${pnpm_items[@]}") ;; *) echo "bad group"; exit 2 ;; esac
  case "$dest" in /mnt/d/Backup/Quarantine/*) ;; *) echo "STOP: destination must be under /mnt/d/Backup/Quarantine"; exit 2 ;; esac
  mkdir -p "$dest" || exit 3
  for k in "${items[@]}"; do
    p="${path[$k]}"
    [ -e "$p" ] || { echo "MOVED|$k|absent|0"; continue; }
    mv "$p" "$dest/$k"; rc=$?
    echo "MOVED|$k|$dest/$k|$rc"
  done
  exit 0
fi
echo "usage: check | move cursor|pnpm <dest>"; exit 2
