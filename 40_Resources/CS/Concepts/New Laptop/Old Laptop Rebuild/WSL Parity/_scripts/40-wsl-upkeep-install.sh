#!/usr/bin/env bash
# 40-wsl-upkeep-install.sh (Build 5): installs wsl-clean.sh + wsl-watch.sh into ~/.local/bin and enables
# two systemd USER timers (weekly clean Sunday 04:30, daily watch 06:15). No sudo. Remove with --uninstall.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
U="$HOME/.config/systemd/user"
if [ "${1:-}" = "--uninstall" ]; then
  systemctl --user disable --now wsl-clean.timer wsl-watch.timer 2>/dev/null || true
  rm -f "$U"/wsl-clean.* "$U"/wsl-watch.* "$HOME/.local/bin/wsl-clean.sh" "$HOME/.local/bin/wsl-watch.sh"
  systemctl --user daemon-reload; echo uninstalled; exit 0
fi
mkdir -p "$HOME/.local/bin" "$U"
install -m 0755 "$HERE/wsl-clean.sh" "$HOME/.local/bin/wsl-clean.sh"
install -m 0755 "$HERE/wsl-watch.sh" "$HOME/.local/bin/wsl-watch.sh"
cat > "$U/wsl-clean.service" <<'UNIT'
[Unit]
Description=WSL weekly safe cache cleanup (regenerable caches only)
[Service]
Type=oneshot
ExecStart=%h/.local/bin/wsl-clean.sh --auto
Nice=15
UNIT
cat > "$U/wsl-clean.timer" <<'UNIT'
[Unit]
Description=Run wsl-clean weekly
[Timer]
OnCalendar=Sun *-*-* 04:30:00
Persistent=true
RandomizedDelaySec=15m
[Install]
WantedBy=timers.target
UNIT
cat > "$U/wsl-watch.service" <<'UNIT'
[Unit]
Description=WSL disk, swap, cache and load watcher (read-only)
[Service]
Type=oneshot
ExecStart=%h/.local/bin/wsl-watch.sh
Nice=15
UNIT
cat > "$U/wsl-watch.timer" <<'UNIT'
[Unit]
Description=Run wsl-watch daily
[Timer]
OnCalendar=*-*-* 06:15:00
Persistent=true
[Install]
WantedBy=timers.target
UNIT
systemd-analyze calendar "Sun *-*-* 04:30:00" "*-*-* 06:15:00" | grep -E 'Normalized|Next'
systemctl --user daemon-reload
systemctl --user enable --now wsl-clean.timer wsl-watch.timer
loginctl enable-linger "$USER" 2>/dev/null && echo "linger enabled" || echo "linger not enabled (needs auth); timers run while the user manager is up"
systemctl --user list-timers --all --no-legend | grep wsl-
systemctl --user start wsl-watch.service && cat "$HOME/.local/state/wsl-watch/history.csv" | tail -n 1
