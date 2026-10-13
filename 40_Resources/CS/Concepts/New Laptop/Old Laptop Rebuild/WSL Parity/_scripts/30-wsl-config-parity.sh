#!/usr/bin/env bash
# 30-wsl-config-parity.sh  (Build 5, 2026-10-13)
# Makes the Dell's WSL config files match the Acer's real ones from the dotfile snapshot.
#   replace : starship, yazi (4 files), atuin, sesh, lazygit, ncdu, git/ignore, .tmux.conf
#   add     : yazi package.toml + flavors/tokyonight-storm.yazi (6 files)
#   merge   : ~/.gitconfig (Dell identity/credentials/lfs/Build 2 keys kept, Acer delta+pager+merge+diff keys added)
#             gh-dash config.yml (Acer file, Dell repoPaths kept as an empty map)
#   leave   : .wslconfig, /etc/wsl.conf, yazi plugins, tokyo-night flavor, plugins-src, .bashrc
# Usage: 30-wsl-config-parity.sh [--dry-run] [--with-tools] [--help]
# Exit code is non-zero when any required step fails. ASCII only, LF endings.
set -uo pipefail

DRY=0; TOOLS=0
for a in "$@"; do
  case "$a" in
    --dry-run) DRY=1 ;;
    --with-tools) TOOLS=1 ;;
    --help|-h) sed -n '2,12p' "$0"; exit 0 ;;
    *) echo "unknown option: $a" >&2; exit 2 ;;
  esac
done

# Own PATH: non-interactive bash lacks ~/.local/bin, nvm and cargo.
NODEBIN=$(ls -d "$HOME"/.nvm/versions/node/*/bin 2>/dev/null | tail -n 1 || true)
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:${NODEBIN:+$NODEBIN:}/usr/local/bin:/usr/bin:/bin:$PATH"

VAULT="/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild"
SNAP="$VAULT/Acer Dotfile Snapshot/wsl/home"
TS=$(date +%Y%m%d-%H%M%S)
BK="$HOME/.config/.toolkit-backups/$TS"
REPORT="$HOME/.config/.toolkit-backups/parity-$TS.txt"
FAILS=0; CHANGED=0; SAME=0
TABLE=()

say()  { printf '%s\n' "$*"; }
fail() { say "FAIL: $*"; FAILS=$((FAILS+1)); }

PATTERNS=(
  'AKIA[0-9A-Z]{16}' 'gh[pousr]_[A-Za-z0-9]{30,}' 'github_pat_[A-Za-z0-9_]{30,}' 'sk-[A-Za-z0-9]{20,}'
  'xox[baprs]-[A-Za-z0-9-]{10,}' '-----BEGIN[ A-Z]*PRIVATE KEY-----' 'AIza[0-9A-Za-z_-]{35}'
  'ya29\.[0-9A-Za-z_-]+' '(api[_-]?key|secret|passwd|password)[[:space:]]*[=:][[:space:]]*[^[:space:]#]{8,}'
  'Bearer[[:space:]]+[A-Za-z0-9._-]{15,}'
)
has_secret() {
  local f="$1" p
  for p in "${PATTERNS[@]}"; do
    if grep -qiE "$p" "$f" 2>/dev/null; then say "  secret pattern hit in $f: $p"; return 0; fi
  done
  return 1
}

sha() { sha256sum "$1" | cut -d' ' -f1; }
is_text() { [ "${1##*.}" != "png" ]; }

STAGE=$(mktemp -d)
trap 'rm -rf "$STAGE"' EXIT
stage() { # snapshot file -> staged copy path (CR stripped only when the file has CR; never for png)
  local src="$1" out
  out="$STAGE/$(printf '%s' "$1" | sha256sum | cut -c1-16)"
  if is_text "$src" && grep -q $'\r' "$src"; then tr -d '\r' < "$src" > "$out"; else cp "$src" "$out"; fi
  printf '%s' "$out"
}

backup() {
  local rel="${1#$HOME/}"
  mkdir -p "$BK/$(dirname "$rel")" && cp -p "$1" "$BK/$rel"
}

install_file() { # staged source, dest absolute, label
  local src="$1" dst="$2" label="$3" before="-" after d
  after=$(sha "$src")
  [ -f "$dst" ] && before=$(sha "$dst")
  if [ "$before" = "$after" ]; then
    SAME=$((SAME+1)); TABLE+=("SAME	$label	$after	$after"); return 0
  fi
  if [ -f "$dst" ]; then
    d=$(diff -u "$dst" "$src" | grep -cE '^[+-][^+-]' || true)
    say "  $label: changed lines (+/-): $d"
  else
    say "  $label: new file"
  fi
  if [ "$DRY" = 1 ]; then TABLE+=("WOULD-WRITE	$label	$before	$after"); CHANGED=$((CHANGED+1)); return 0; fi
  [ -f "$dst" ] && backup "$dst"
  mkdir -p "$(dirname "$dst")" && cp "$src" "$dst" && chmod 0644 "$dst" || { fail "write $dst"; return 1; }
  [ "$(sha "$dst")" = "$after" ] || { fail "read-back mismatch $dst"; return 1; }
  CHANGED=$((CHANGED+1)); TABLE+=("WRITTEN	$label	$before	$after")
}

say "== Build 5 WSL config parity ($TS) dry-run=$DRY with-tools=$TOOLS"
[ -d "$SNAP" ] || { fail "snapshot not found: $SNAP"; exit 1; }
[ "$DRY" = 0 ] && mkdir -p "$BK"

say "== 1. secret scan of every source file"
SCAN_FILES=()
while IFS= read -r -d '' f; do SCAN_FILES+=("$f"); done < <(find "$SNAP/.config" "$SNAP/.gitconfig" "$SNAP/.tmux.conf" -type f ! -name '*.png' -print0)
for f in "${SCAN_FILES[@]}"; do
  if has_secret "$f"; then fail "secret scan: $f"; fi
done
[ "$FAILS" -eq 0 ] || { say "== ABORT: secret scan failed, nothing copied"; exit 1; }
say "  ${#SCAN_FILES[@]} files clean"

say "== 2. replace"
for rel in .config/starship.toml .config/yazi/yazi.toml .config/yazi/init.lua .config/yazi/keymap.toml \
           .config/yazi/theme.toml .config/atuin/config.toml .config/sesh/sesh.toml .config/lazygit/config.yml \
           .config/ncdu/config .config/git/ignore .tmux.conf; do
  install_file "$(stage "$SNAP/$rel")" "$HOME/$rel" "$rel"
done

say "== 3. add yazi package.toml and flavor"
install_file "$(stage "$SNAP/.config/yazi/package.toml")" "$HOME/.config/yazi/package.toml" ".config/yazi/package.toml"
for f in LICENSE LICENSE-tmtheme README.md flavor.toml tmtheme.xml preview.png; do
  rel=".config/yazi/flavors/tokyonight-storm.yazi/$f"
  install_file "$(stage "$SNAP/$rel")" "$HOME/$rel" "$rel"
done

say "== 4. gh-dash: Acer file, Dell repoPaths kept empty"
GH="$STAGE/gh-dash.yml"
tr -d '\r' < "$SNAP/.config/gh-dash/config.yml" | awk '
  /^repoPaths:/ { print "repoPaths: {}"; skip=1; next }
  skip && /^[ \t]/ { next }
  { skip=0; print }' > "$GH"
install_file "$GH" "$HOME/.config/gh-dash/config.yml" ".config/gh-dash/config.yml"

say "== 5. .gitconfig merge (git config keeps every other line untouched)"
GITKEYS=(
  "core.pager|delta" "core.fsmonitor|true" "core.untrackedCache|true"
  "interactive.diffFilter|delta --color-only"
  "delta.navigate|true" "delta.side-by-side|true" "delta.line-numbers|true"
  "merge.conflictstyle|diff3" "diff.colorMoved|default"
)
if [ "$DRY" = 0 ] && [ -f "$HOME/.gitconfig" ]; then backup "$HOME/.gitconfig"; fi
for kv in "${GITKEYS[@]}"; do
  k="${kv%%|*}"; v="${kv#*|}"; cur=$(git config --global --get "$k" 2>/dev/null || echo "<unset>")
  if [ "$cur" = "$v" ]; then SAME=$((SAME+1)); TABLE+=("SAME	gitconfig:$k	$v	$v"); continue; fi
  say "  $k: $cur -> $v"
  if [ "$DRY" = 1 ]; then CHANGED=$((CHANGED+1)); TABLE+=("WOULD-SET	gitconfig:$k	$cur	$v"); continue; fi
  if git config --global "$k" "$v" && [ "$(git config --global --get "$k")" = "$v" ]; then
    CHANGED=$((CHANGED+1)); TABLE+=("SET	gitconfig:$k	$cur	$v")
  else fail "git config $k"; fi
done
say "  kept: user, credential, lfs, core.autocrlf=$(git config --global --get core.autocrlf), pull.rebase, push.autoSetupRemote, fetch.prune, rerere.enabled"

if [ "$TOOLS" = 1 ]; then
  say "== 6. user-space tools (no sudo)"
  mkdir -p "$HOME/.local/bin"
  if [ "$DRY" = 1 ]; then
    say "  would: uv tool install ruff; shellcheck v0.11.0 and shfmt v3.14.1 from GitHub with pinned SHA-256"
  else
    if command -v ruff >/dev/null 2>&1; then say "  ruff present: $(ruff --version)"
    else uv tool install ruff >/dev/null 2>&1 && say "  ruff installed: $(ruff --version)" || fail "uv tool install ruff"; fi
    if command -v shellcheck >/dev/null 2>&1; then say "  shellcheck present"
    else
      u=https://github.com/koalaman/shellcheck/releases/download/v0.11.0/shellcheck-v0.11.0.linux.x86_64.tar.xz
      want=8c3be12b05d5c177a04c29e3c78ce89ac86f1595681cab149b65b97c4e227198
      if curl -fsSL -m 120 "$u" -o "$STAGE/sc.tar.xz" && [ "$(sha "$STAGE/sc.tar.xz")" = "$want" ] \
         && tar -xJf "$STAGE/sc.tar.xz" -C "$STAGE" && install -m 0755 "$STAGE/shellcheck-v0.11.0/shellcheck" "$HOME/.local/bin/shellcheck"; then
        say "  shellcheck installed: $(shellcheck --version | sed -n 2p)"
      else fail "shellcheck install (download or checksum)"; fi
    fi
    if command -v shfmt >/dev/null 2>&1; then say "  shfmt present"
    else
      u=https://github.com/mvdan/sh/releases/download/v3.14.1/shfmt_v3.14.1_linux_amd64
      want=76e77641faa025814b77f153b29796b8e6fa2fca03e0c76a691608b86c7ea7bf
      if curl -fsSL -m 120 "$u" -o "$STAGE/shfmt" && [ "$(sha "$STAGE/shfmt")" = "$want" ] \
         && install -m 0755 "$STAGE/shfmt" "$HOME/.local/bin/shfmt"; then
        say "  shfmt installed: $(shfmt --version)"
      else fail "shfmt install (download or checksum)"; fi
    fi
  fi
fi

say "== SHA-256 table (state / item / before / after)"
{ printf 'state\titem\tbefore\tafter\n'; printf '%s\n' "${TABLE[@]}"; } | { if [ "$DRY" = 1 ]; then cat; else tee "$REPORT"; fi; }
say "== summary: changed=$CHANGED same=$SAME fails=$FAILS backup=$([ "$DRY" = 1 ] && echo none || echo "$BK")"
[ "$FAILS" -eq 0 ]
