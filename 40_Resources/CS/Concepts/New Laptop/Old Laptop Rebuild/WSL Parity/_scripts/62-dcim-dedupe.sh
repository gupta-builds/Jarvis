#!/usr/bin/env bash
# 62-dcim-dedupe.sh (Build 5b). Deletes byte-identical duplicate files found by 35-dcim-duplicate-report.sh. One copy per group stays.
# Safety: every file is deleted only after `cmp` proves it is byte-for-byte identical to the kept copy (not just the same hash), the kept copy
# must exist, and a log maps every deleted path to the kept path. Keeper rule: a copy under /Camera/ wins, otherwise the first path in sort order.
# Dry run unless --apply is given. Empty folders left behind are NOT removed.
# Usage: 62-dcim-dedupe.sh [--apply] [report.tsv]
set -uo pipefail
APPLY=0; REPORT=""
for a in "$@"; do case "$a" in --apply) APPLY=1 ;; *) REPORT="$a" ;; esac; done
REPORT="${REPORT:-$HOME/.local/state/dcim-duplicates-20261013.tsv}"
[ -f "$REPORT" ] || { echo "report not found: $REPORT (run 35-dcim-duplicate-report.sh first)"; exit 1; }
ROOT=/mnt/d/_Anant/99_Archive/BS/DCIM
LOG="$HOME/.local/state/dcim-delete-$(date +%Y%m%d-%H%M%S).tsv"
printf 'sha256\tbytes\tkept\tdeleted\n' > "$LOG"
groups=0; del=0; freed=0; skipped=0
while IFS= read -r h; do
  mapfile -t paths < <(awk -F'\t' -v h="$h" '$1==h {print $3}' "$REPORT" | LC_ALL=C sort)
  size=$(awk -F'\t' -v h="$h" '$1==h {print $2; exit}' "$REPORT")
  keeper=""
  for p in "${paths[@]}"; do case "$p" in */Camera/*) keeper="$p"; break ;; esac; done
  [ -n "$keeper" ] || keeper="${paths[0]}"
  case "$keeper" in "$ROOT"/*) ;; *) echo "refusing: keeper outside $ROOT: $keeper"; exit 1 ;; esac
  [ -f "$keeper" ] || { echo "keeper missing, skipping group $h"; skipped=$((skipped+1)); continue; }
  groups=$((groups+1))
  for p in "${paths[@]}"; do
    [ "$p" = "$keeper" ] && continue
    case "$p" in "$ROOT"/*) ;; *) echo "refusing: path outside $ROOT: $p"; exit 1 ;; esac
    [ -f "$p" ] || { skipped=$((skipped+1)); continue; }
    [ "$p" -ef "$keeper" ] && { skipped=$((skipped+1)); continue; }
    if cmp -s -- "$keeper" "$p"; then
      printf '%s\t%s\t%s\t%s\n' "$h" "$size" "$keeper" "$p" >> "$LOG"
      if [ "$APPLY" = 1 ]; then rm -f -- "$p" || { echo "delete failed: $p"; skipped=$((skipped+1)); continue; }; fi
      del=$((del+1)); freed=$((freed+size))
    else
      echo "hash group member differs byte-wise, kept: $p"; skipped=$((skipped+1))
    fi
  done
done < <(cut -f1 "$REPORT" | LC_ALL=C sort -u)
echo "groups: $groups ; $([ "$APPLY" = 1 ] && echo deleted || echo 'would delete'): $del files ; space: $(( freed / 1048576 )) MiB ; skipped: $skipped"
echo "log: $LOG"
[ "$APPLY" = 1 ] || echo "DRY RUN. Re-run with --apply to delete."
