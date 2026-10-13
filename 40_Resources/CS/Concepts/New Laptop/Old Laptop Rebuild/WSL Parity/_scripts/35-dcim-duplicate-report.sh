#!/usr/bin/env bash
# 35-dcim-duplicate-report.sh (Build 5): READ-ONLY duplicate report for D:\_Anant\99_Archive\BS\DCIM (Camera vs Entire Copy).
# Only files that share a byte size with another file are hashed (SHA-256), so most files are never read in full.
# Output: a TSV of duplicate groups (hash, bytes, path) plus a summary. Nothing is moved, renamed or deleted.
# Usage: 35-dcim-duplicate-report.sh [root] [out.tsv]
set -uo pipefail
ROOT="${1:-/mnt/d/_Anant/99_Archive/BS/DCIM}"
OUT="${2:-$HOME/.local/state/dcim-duplicates-$(date +%Y%m%d).tsv}"
mkdir -p "$(dirname "$OUT")"
[ -d "$ROOT" ] || { echo "not found: $ROOT"; exit 1; }
T=$(mktemp -d); trap 'rm -rf "$T"' EXIT
find "$ROOT" -type f -printf '%s\t%p\n' > "$T/all.tsv"
total=$(wc -l < "$T/all.tsv")
awk -F'\t' '{c[$1]++; l[$1]=l[$1] "\n" $0} END{for(s in c) if(c[s]>1 && s>0) print l[s]}' "$T/all.tsv" | sed '/^$/d' > "$T/cand.tsv"
ncand=$(wc -l < "$T/cand.tsv")
echo "files: $total ; same-size candidates to hash: $ncand"
: > "$T/hashes.tsv"
while IFS=$'\t' read -r size path; do
  h=$(sha256sum -- "$path" | cut -d' ' -f1)
  printf '%s\t%s\t%s\n' "$h" "$size" "$path" >> "$T/hashes.tsv"
done < "$T/cand.tsv"
sort "$T/hashes.tsv" | awk -F'\t' '{c[$1]++; l[$1]=l[$1] $0 "\n"} END{for(h in c) if(c[h]>1) printf "%s", l[h]}' | sort > "$OUT"
groups=$(cut -f1 "$OUT" | sort -u | wc -l)
files=$(wc -l < "$OUT")
waste=$(awk -F'\t' '{if($1==p){w+=$2} p=$1} END{print w+0}' "$OUT")
cross=$(awk -F'\t' '{k=($3 ~ /\/Camera\//)?"C":"E"; s[$1]=s[$1] k} END{n=0; for(h in s) if(s[h] ~ /C/ && s[h] ~ /E/) n++; print n}' "$OUT")
echo "duplicate groups: $groups ; files in groups: $files ; groups spanning Camera and Entire Copy: $cross"
echo "reclaimable if one copy per group is kept: $(( waste / 1048576 )) MiB"
echo "report: $OUT"
