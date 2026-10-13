#!/usr/bin/env bash
# 37-toolkit-apply.sh (Build 5b, 2026-10-13). Applies the GOLDEN toolkit configs to this WSL (Dell or Acer).
# Source: vault Old Laptop Rebuild/WSL Parity/golden/home (one copy of truth for both laptops).
# What it does, in order: secret scan -> copy every golden file with timestamped backups (CR stripped) -> bat theme build ->
#   git wiring (include ~/.config/git/shared.gitconfig, drop the keys now owned by it, drop no-op core.fsmonitor) ->
#   one guarded source line in ~/.bashrc (TOOLKIT_ENV_BLOCK). It never prints .bashrc and never touches secrets.
# Usage: 37-toolkit-apply.sh [--dry-run] [--vault PATH]     (on the Acer pass --vault if auto-detection fails)
# Exit code is non-zero when a required step fails. ASCII only, LF endings.
set -uo pipefail
DRY=0; VAULT_ARG=""
while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY=1 ;;
    --vault) shift; VAULT_ARG="${1:-}" ;;
    --help|-h) sed -n '2,11p' "$0"; exit 0 ;;
    *) echo "unknown option: $1" >&2; exit 2 ;;
  esac; shift
done
NODEBIN=$(ls -d "$HOME"/.nvm/versions/node/*/bin 2>/dev/null | tail -n 1 || true)
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:${NODEBIN:+$NODEBIN:}/usr/local/bin:/usr/bin:/bin:$PATH"

REL="40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/WSL Parity/golden/home"
GOLD=""
for base in "$VAULT_ARG" "${VAULT:-}" "/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis" "/mnt/d/_Anant/20_Progress/Documents/Jarvis" "/mnt/d/_Anant/10_Areas/Documents/Jarvis"; do
  if [ -n "$base" ] && [ -d "$base/$REL" ]; then GOLD="$base/$REL"; break; fi
done
[ -n "$GOLD" ] || { echo "FAIL: golden dir not found. Pass --vault <path to the Jarvis vault as seen from WSL>"; exit 1; }

TS=$(date +%Y%m%d-%H%M%S); BK="$HOME/.config/.toolkit-backups/$TS"
FAILS=0; CHANGED=0; SAME=0; TABLE=()
say()  { printf '%s\n' "$*"; }
fail() { say "FAIL: $*"; FAILS=$((FAILS+1)); }
sha()  { sha256sum "$1" | cut -d' ' -f1; }
PATTERNS=('AKIA[0-9A-Z]{16}' 'gh[pousr]_[A-Za-z0-9]{30,}' 'github_pat_[A-Za-z0-9_]{30,}' 'sk-[A-Za-z0-9]{20,}' 'xox[baprs]-[A-Za-z0-9-]{10,}'
  '-----BEGIN[ A-Z]*PRIVATE KEY-----' 'AIza[0-9A-Za-z_-]{35}' 'ya29\.[0-9A-Za-z_-]+'
  '(api[_-]?key|secret|passwd|password)[[:space:]]*[=:][[:space:]]*[^[:space:]#]{8,}' 'Bearer[[:space:]]+[A-Za-z0-9._-]{15,}')
has_secret() { local p; for p in "${PATTERNS[@]}"; do if grep -qiE "$p" "$1" 2>/dev/null; then say "  secret pattern hit in $1: $p"; return 0; fi; done; return 1; }
STAGE=$(mktemp -d); trap 'rm -rf "$STAGE"' EXIT
stage() { local src="$1" out; out="$STAGE/$(printf '%s' "$1" | sha256sum | cut -c1-16)"
  if [ "${src##*.}" != png ] && grep -q $'\r' "$src"; then tr -d '\r' < "$src" > "$out"; else cp "$src" "$out"; fi; printf '%s' "$out"; }
backup() { local rel="${1#$HOME/}"; mkdir -p "$BK/$(dirname "$rel")" && cp -p "$1" "$BK/$rel"; }
install_file() { # staged, dest, label
  local src="$1" dst="$2" label="$3" before="-" after; after=$(sha "$src"); [ -f "$dst" ] && before=$(sha "$dst")
  if [ "$before" = "$after" ]; then SAME=$((SAME+1)); TABLE+=("SAME	$label	$after	$after"); return 0; fi
  if [ "$DRY" = 1 ]; then say "  would write $label"; TABLE+=("WOULD-WRITE	$label	$before	$after"); CHANGED=$((CHANGED+1)); return 0; fi
  [ -f "$dst" ] && backup "$dst"
  mkdir -p "$(dirname "$dst")" && cp "$src" "$dst" && chmod 0644 "$dst" || { fail "write $dst"; return 1; }
  [ "$(sha "$dst")" = "$after" ] || { fail "read-back mismatch $dst"; return 1; }
  say "  wrote $label"; CHANGED=$((CHANGED+1)); TABLE+=("WRITTEN	$label	$before	$after")
}

say "== Build 5b toolkit apply ($TS) dry-run=$DRY"; say "   golden: $GOLD"
[ "$DRY" = 0 ] && mkdir -p "$BK"

say "== 1. secret scan"
n=0; while IFS= read -r -d '' f; do n=$((n+1)); if has_secret "$f"; then fail "secret scan: $f"; fi; done < <(find "$GOLD" -type f ! -name '*.png' -print0)
[ "$FAILS" -eq 0 ] || { say "== ABORT: secret scan failed, nothing copied"; exit 1; }
say "  $n files clean"

say "== 2. copy golden files"
while IFS= read -r -d '' f; do
  rel="${f#$GOLD/}"
  install_file "$(stage "$f")" "$HOME/$rel" "$rel"
done < <(find "$GOLD" -type f -print0 | sort -z)

say "== 3. bat theme (Tokyo Night Storm tmTheme from the Yazi flavor)"
TM="$HOME/.config/yazi/flavors/tokyonight-storm.yazi/tmtheme.xml"; BT="$HOME/.config/bat/themes/tokyonight_storm.tmTheme"
BATBIN=$(command -v bat || command -v batcat || true)
if [ -f "$TM" ] && [ -n "$BATBIN" ]; then
  if [ "$DRY" = 1 ]; then say "  would copy tmTheme and run: $BATBIN cache --build"
  else
    mkdir -p "$(dirname "$BT")" && cp "$TM" "$BT" && "$BATBIN" cache --build >/dev/null 2>&1
    if "$BATBIN" --list-themes 2>/dev/null | grep -q tokyonight_storm; then say "  bat theme tokyonight_storm registered"; else fail "bat theme build"; fi
  fi
else say "  skipped (yazi flavor or bat missing)"; fi

say "== 4. git wiring"
INC="$HOME/.config/git/shared.gitconfig"
if [ "$DRY" = 1 ]; then say "  would: add include.path, unset core.pager core.untrackedCache core.fsmonitor interactive.diffFilter delta.* merge.conflictstyle diff.colormoved from ~/.gitconfig"
else
  [ -f "$HOME/.gitconfig" ] && backup "$HOME/.gitconfig"
  if ! git config --global --get-all include.path | grep -qx "$INC"; then git config --global --add include.path "$INC" || fail "git include"; fi
  for k in core.pager core.untrackedCache core.fsmonitor interactive.diffFilter delta.navigate delta.side-by-side delta.line-numbers delta.dark merge.conflictstyle diff.colormoved; do
    git config --global --unset-all "$k" 2>/dev/null; done
  for kv in "core.pager=delta" "merge.conflictstyle=zdiff3" "diff.algorithm=histogram" "worktree.guessremote=true" "delta.dark=true"; do
    k="${kv%%=*}"; v="${kv#*=}"; [ "$(git config --get "$k")" = "$v" ] || fail "git $k expected $v got '$(git config --get "$k")'"; done
  say "  include wired; core.autocrlf=$(git config --global --get core.autocrlf) (machine-specific, left as is)"
fi

say "== 5. ~/.bashrc source line (backup first; file content is not printed)"
MARK="# >>> TOOLKIT_ENV_BLOCK (Build 5b) >>>"
if grep -qF "$MARK" "$HOME/.bashrc" 2>/dev/null; then say "  block already present"
elif [ "$DRY" = 1 ]; then say "  would append TOOLKIT_ENV_BLOCK"
else
  backup "$HOME/.bashrc"
  printf '\n%s\n[ -f "$HOME/.config/toolkit/env.sh" ] && . "$HOME/.config/toolkit/env.sh"\n# <<< TOOLKIT_ENV_BLOCK <<<\n' "$MARK" >> "$HOME/.bashrc"
  if bash -n "$HOME/.bashrc"; then say "  appended; bash -n ok"; else fail "bashrc syntax after edit (restore from $BK/.bashrc)"; fi
fi

say "== SHA-256 table"; { printf 'state\titem\tbefore\tafter\n'; printf '%s\n' "${TABLE[@]}"; } | { if [ "$DRY" = 1 ]; then cat; else tee "$HOME/.config/.toolkit-backups/apply-$TS.txt"; fi; }
say "== summary: changed=$CHANGED same=$SAME fails=$FAILS backup=$([ "$DRY" = 1 ] && echo none || echo "$BK")"
[ "$FAILS" -eq 0 ]
