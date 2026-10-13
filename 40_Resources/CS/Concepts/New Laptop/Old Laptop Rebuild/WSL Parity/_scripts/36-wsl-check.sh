#!/usr/bin/env bash
# 36-wsl-check.sh (Build 5): read-only health check for the Dell WSL host. One section per thing that can drift or grow.
# Usage: 36-wsl-check.sh [config|tools|disk|swap|editors|backup|dtree|all]   (default: all)
set -uo pipefail
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/miniconda3/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
SNAP="/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/Acer Dotfile Snapshot"
what="${1:-all}"
want() { [ "$what" = all ] || [ "$what" = "$1" ]; }

if want config; then
  echo "== config hashes vs the Acer snapshot (MATCH or MATCH-LF expected; gh-dash, .gitconfig, wsl.conf differ on purpose)"
  tail -n +2 "$SNAP/hashes-wsl.txt" | while IFS=$'\t' read -r rel _src sh ch _sz _st; do
    [ "$sh" = n/a ] && continue
    case "$rel" in wsl/etc/*) live=/etc/${rel#wsl/etc/};; wsl/home/*) live=$HOME/${rel#wsl/home/};; *) continue;; esac
    [ -e "$live" ] || { echo "MISSING   $rel"; continue; }
    lh=$(sha256sum "$live" | cut -d' ' -f1)
    ln=$(tr -d '\r' < "$live" | sha256sum | cut -d' ' -f1); sn=$(tr -d '\r' < "$SNAP/$rel" | sha256sum | cut -d' ' -f1)
    if [ "$lh" = "$ch" ]; then r=MATCH; elif [ "$ln" = "$sn" ]; then r=MATCH-LF; else r=DIFF; fi
    echo "$r $rel"
  done | sort | awk '{c[$1]++; if($1=="DIFF"||$1=="MISSING") d=d "\n    " $2} END{for(k in c) print "  " k ": " c[k]; if(d!="") print "  not matching:" d}'
fi
if want tools; then
  echo "== tool versions"
  for t in node pnpm uv ruff shfmt shellcheck conda claude codex tmux delta starship ya lazygit atuin sesh socat bwrap; do
    if ! command -v "$t" >/dev/null 2>&1; then printf '  %-11s MISSING\n' "$t"; continue; fi
    case "$t" in
      tmux) v=$(tmux -V) ;;
      lazygit) v=$(lazygit --version 2>&1 | grep -o 'version=[0-9.]*') ;;
      shellcheck) v=$(shellcheck --version | sed -n 2p) ;;
      socat) v=$(socat -V 2>&1 | sed -n 2p) ;;
      pnpm) v=$(COREPACK_ENABLE_DOWNLOAD_PROMPT=0 pnpm --version 2>&1 | tail -n 1) ;;
      *) v=$("$t" --version 2>&1 | head -n 1) ;;
    esac
    printf '  %-11s %s\n' "$t" "$(printf '%s' "$v" | cut -c1-60)"
  done
  echo "  systemd: $(systemctl is-system-running) ; failed units: $(systemctl --failed --no-legend | wc -l) ; ollama: $(systemctl is-enabled ollama 2>&1)"
fi
if want disk; then
  echo "== disk"; df -h / | tail -n 1; ls -l /mnt/d/WSL/Ubuntu/ext4.vhdx | awk '{printf "  ext4.vhdx %.1f GiB\n", $5/1073741824}'
  df -h /mnt/d /mnt/c | tail -n 2
  if [ -f "$HOME/.local/state/wsl-watch/ALERT" ]; then cat "$HOME/.local/state/wsl-watch/ALERT"; else echo "  watcher: no alert"; fi
fi
if want swap; then
  echo "== swap"; free -m | awk '/Swap/{print "  swap used " $3 " MB of " $2 " MB"}'; ls -l /mnt/d/WSL/swap.vhdx | awk '{printf "  swap.vhdx %.0f MB\n", $5/1048576}'
  grep -E '^(swap|swapfile|memory|processors)' /mnt/c/Users/*/.wslconfig 2>/dev/null | tr -d '\r' | sed 's/^/  /'
fi
if want editors; then
  echo "== editor servers and caches"; du -sh ~/.vscode-server ~/.cursor-server ~/.vscode-remote-containers ~/.npm/_npx ~/.cache ~/miniconda3 2>/dev/null | sed 's/^/  /'
  echo "  clean timer: $(systemctl --user is-active wsl-clean.timer) ; watch timer: $(systemctl --user is-active wsl-watch.timer)"
fi
if want backup; then
  echo "== tarball and export backup"
  ls -l /mnt/d/WSL/Installers/wsl-ubuntu.tar 2>&1 | awk '{print "  old tar: " $5 " bytes"}'
  ls /mnt/d/Backup/WSL/ubuntu-*.tar 2>/dev/null | sed 's/^/  export: /'
  ls -d /mnt/d/Quarantine/wsl-tar-review-* 2>/dev/null | sed 's/^/  quarantine: /'
fi
if want dtree; then
  echo "== D: tree and Drive"; ls /mnt/d/_Anant /mnt/d/Users/_Anant 2>&1 | sed 's/^/  /'
  powershell.exe -NoProfile -Command 'if(Get-Process GoogleDriveFS -ErrorAction SilentlyContinue){"  Drive running"}else{"  Drive not running"}; "  DriveFS dir GB: " + [math]::Round((Get-ChildItem "$env:LOCALAPPDATA\Google\DriveFS" -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum/1GB,2)' 2>/dev/null | tr -d '\r\0'
fi
exit 0
