#!/usr/bin/env bash
# wsl-watch.sh (Build 5): read-only WSL watcher. Appends a CSV row, writes an ALERT file when a threshold trips.
# Host-side numbers (VHDX size) come from the Windows watcher's latest.json; this script does not measure them twice.
set -uo pipefail
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"
OUT="$HOME/.local/state/wsl-watch"; mkdir -p "$OUT"
CSV="$OUT/history.csv"; ALERT="$OUT/ALERT"
WIN=/mnt/d/WSL/ops/windows/watch/latest.json
mb() { du -sm "$1" 2>/dev/null | cut -f1 || echo 0; }
read -r _ _ used avail pct _ < <(df -BG --output=source,size,used,avail,pcent,target / | tail -n 1 | tr -d 'G%')
vhdx=""; age=""; swapvhdx=""
if [ -r "$WIN" ]; then
  vhdx=$(python3 -c "import json,sys;print(json.load(open('$WIN')).get('ubuntu_vhdx_gb',''))" 2>/dev/null)
  age=$(( ( $(date +%s) - $(stat -c %Y "$WIN") ) / 3600 ))
fi
[ -f /mnt/d/WSL/swap.vhdx ] && swapvhdx=$(( $(stat -c %s /mnt/d/WSL/swap.vhdx) / 1048576 ))
cache=$(mb "$HOME/.cache"); npm=$(mb "$HOME/.npm"); vs=$(mb "$HOME/.vscode-server"); cu=$(mb "$HOME/.cursor-server"); rc=$(mb "$HOME/.vscode-remote-containers")
jr=$(journalctl --disk-usage 2>/dev/null | grep -oE '[0-9.]+[MG]' | head -n 1); jmb=$(echo "$jr" | awk '/G/{print $1*1024;next}{print int($1)}')
load=$(cut -d' ' -f1 /proc/loadavg); swapused=$(free -m | awk '/Swap/{print $3}'); memavail=$(free -m | awk '/Mem/{print $7}')
[ -f "$CSV" ] || echo 'time,root_used_gb,root_avail_gb,root_pct,vhdx_gb,swap_vhdx_mb,cache_mb,npm_mb,vscode_mb,cursor_mb,containers_mb,journal_mb,load1,swap_used_mb,mem_avail_mb,winwatch_age_h' > "$CSV"
echo "$(date -Is),$used,$avail,$pct,$vhdx,$swapvhdx,$cache,$npm,$vs,$cu,$rc,${jmb:-},$load,$swapused,$memavail,$age" >> "$CSV"
A=()
[ "${pct:-0}" -ge 70 ] && A+=("root filesystem ${pct}% used (limit 70)")
[ -n "$vhdx" ] && awk "BEGIN{exit !($vhdx>=140)}" && A+=("ext4.vhdx ${vhdx} GiB (limit 140): consider the compaction host script")
[ -n "$swapvhdx" ] && [ "$swapvhdx" -ge 4096 ] && A+=("swap.vhdx ${swapvhdx} MB (limit 4096)")
[ "${swapused:-0}" -ge 2048 ] && A+=("swap in use ${swapused} MB (limit 2048)")
[ "${cache:-0}" -ge 6144 ] && A+=("~/.cache ${cache} MB (limit 6144)")
[ "${npm:-0}" -ge 6144 ] && A+=("~/.npm ${npm} MB (limit 6144): run wsl-clean.sh")
[ $(( ${vs:-0} + ${cu:-0} + ${rc:-0} )) -ge 14336 ] && A+=("editor servers $(( vs + cu + rc )) MB (limit 14336)")
[ "${jmb:-0}" -ge 500 ] && A+=("journal ${jmb} MB (limit 500)")
awk "BEGIN{exit !($load>=15)}" && A+=("load1 $load (limit 15 on 10 CPUs)")
[ "${memavail:-9999}" -le 1024 ] && A+=("available memory ${memavail} MB (limit 1024)")
[ -n "$age" ] && [ "$age" -ge 36 ] && A+=("Windows watcher latest.json is ${age} h old: check Toolkit-Watch-C")
if [ "${#A[@]}" -gt 0 ]; then { echo "WSL watch alert $(date -Is)"; printf -- '- %s\n' "${A[@]}"; } > "$ALERT"; else rm -f "$ALERT"; fi
exit 0
