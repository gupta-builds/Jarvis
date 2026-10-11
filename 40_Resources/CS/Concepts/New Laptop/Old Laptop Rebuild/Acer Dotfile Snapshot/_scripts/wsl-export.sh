#!/usr/bin/env bash
set -u

SNAP="/mnt/d/_Anant/20_Progress/Documents/Jarvis/40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/Acer Dotfile Snapshot"
WSL_OUT="$SNAP/wsl"
mkdir -p "$SNAP"
mkdir -p "$WSL_OUT"

HASHES="$SNAP/hashes-wsl.txt"
EXCLUDED="$SNAP/excluded-wsl.txt"
printf 'RelDest\tSource\tSourceSHA256\tCopySHA256\tStatus\n' > "$HASHES"
printf 'Source\tRelDest\tReason\n' > "$EXCLUDED"

PATTERNS=(
  'AKIA[0-9A-Z]{16}'
  'gh[pousr]_[A-Za-z0-9]{30,}'
  'github_pat_[A-Za-z0-9_]{30,}'
  'sk-[A-Za-z0-9]{20,}'
  'xox[baprs]-[A-Za-z0-9-]{10,}'
  '-----BEGIN[ A-Z]*PRIVATE KEY-----'
  'AIza[0-9A-Za-z_-]{35}'
  'ya29\.[0-9A-Za-z_-]+'
  '(api[_-]?key|secret|passwd|password)[[:space:]]*[=:][[:space:]]*.{8,}'
  'Bearer[[:space:]]+[A-Za-z0-9._-]{15,}'
)

# Forbidden source paths (AI-tool / credential directories) - defense in depth.
FORBIDDEN_MARKERS=('.claude' '.codex' '.cursor' '.kiro' '.ssh' '.mcp.json' '.mcp.env')

has_secret_file() {
  local f="$1"
  for p in "${PATTERNS[@]}"; do
    if grep -qiE "$p" "$f" 2>/dev/null; then
      return 0
    fi
  done
  return 1
}

has_secret_text() {
  local t="$1"
  for p in "${PATTERNS[@]}"; do
    if printf '%s' "$t" | grep -qiE "$p" 2>/dev/null; then
      return 0
    fi
  done
  return 1
}

is_forbidden() {
  local path="$1"
  for m in "${FORBIDDEN_MARKERS[@]}"; do
    case "$path" in
      *"$m"*) return 0 ;;
    esac
  done
  return 1
}

log_excluded() {
  # args: source  reldest  reason
  printf '%s\t%s\t%s\n' "$1" "$2" "$3" >> "$EXCLUDED"
}

log_hash() {
  # args: reldest  source  sourcehash  copyhash  status
  printf '%s\t%s\t%s\t%s\t%s\n' "$1" "$2" "$3" "$4" "$5" >> "$HASHES"
}

# Plain, verbatim, binary-safe copy. Scans the SOURCE before ever writing a copy.
export_file() {
  local src="$1" rel="$2"
  if is_forbidden "$src"; then
    log_excluded "$src" "$rel" "AI-tool or credential directory - excluded by policy"
    return
  fi
  if [ ! -f "$src" ]; then
    log_excluded "$src" "$rel" "not present on this host"
    return
  fi
  if has_secret_file "$src"; then
    log_excluded "$src" "$rel" "matched secret heuristic - not copied"
    return
  fi
  local dest="$WSL_OUT/$rel"
  mkdir -p "$(dirname "$dest")"
  cp -p "$src" "$dest"
  local srchash dsthash status
  srchash=$(sha256sum "$src" | cut -d' ' -f1)
  dsthash=$(sha256sum "$dest" | cut -d' ' -f1)
  if [ "$srchash" = "$dsthash" ]; then status="MATCH"; else status="DIFF"; fi
  log_hash "wsl/$rel" "$src" "$srchash" "$dsthash" "$status"
}

# ---- starship ----
export_file "$HOME/.config/starship.toml" "home/.config/starship.toml"

# ---- yazi: toml files plus full flavor/plugin source trees, no caches (none present on this host) ----
if [ -d "$HOME/.config/yazi" ] && ! is_forbidden "$HOME/.config/yazi"; then
  while IFS= read -r -d '' f; do
    rel="home/.config/yazi/${f#"$HOME/.config/yazi/"}"
    export_file "$f" "$rel"
  done < <(find "$HOME/.config/yazi" -type f -print0)
else
  log_excluded "$HOME/.config/yazi" "home/.config/yazi" "not present on this host"
fi

export_file "$HOME/.config/atuin/config.toml" "home/.config/atuin/config.toml"
export_file "$HOME/.config/sesh/sesh.toml" "home/.config/sesh/sesh.toml"
export_file "$HOME/.config/gh-dash/config.yml" "home/.config/gh-dash/config.yml"
export_file "$HOME/.config/lazygit/config.yml" "home/.config/lazygit/config.yml"
export_file "$HOME/.config/ncdu/config" "home/.config/ncdu/config"

# ---- .config/git dir ----
if [ -d "$HOME/.config/git" ] && ! is_forbidden "$HOME/.config/git"; then
  while IFS= read -r -d '' f; do
    rel="home/.config/git/${f#"$HOME/.config/git/"}"
    export_file "$f" "$rel"
  done < <(find "$HOME/.config/git" -type f -print0)
fi

# ---- .gitconfig: redact [credential ...] and [user] sections, scanning IN MEMORY before any write ----
if [ -f "$HOME/.gitconfig" ] && ! is_forbidden "$HOME/.gitconfig"; then
  redacted=$(awk '
    /^[[:space:]]*\[(credential|user)\b/ { skip=1; next }
    /^[[:space:]]*\[/ { skip=0 }
    !skip { print }
  ' "$HOME/.gitconfig")
  if has_secret_text "$redacted"; then
    log_excluded "$HOME/.gitconfig" "home/.gitconfig" "matched secret heuristic after redaction - not copied"
  else
    dest="$WSL_OUT/home/.gitconfig"
    mkdir -p "$(dirname "$dest")"
    printf '%s\n' "$redacted" > "$dest"
    srchash=$(sha256sum "$HOME/.gitconfig" | cut -d' ' -f1)
    dsthash=$(sha256sum "$dest" | cut -d' ' -f1)
    log_hash "wsl/home/.gitconfig" "$HOME/.gitconfig (redacted: removed [credential] and [user] sections)" "$srchash" "$dsthash" "DIFF"
  fi
fi

# ---- .tmux.conf ----
export_file "$HOME/.tmux.conf" "home/.tmux.conf"

# ---- tmux plugin NAMES only (not plugin source), generated listing ----
if [ -d "$HOME/.tmux/plugins" ] && ! is_forbidden "$HOME/.tmux/plugins"; then
  listing=$(ls -1 "$HOME/.tmux/plugins")
  dest="$WSL_OUT/home/.tmux-plugins-list.txt"
  mkdir -p "$(dirname "$dest")"
  printf '%s\n' "$listing" > "$dest"
  dsthash=$(sha256sum "$dest" | cut -d' ' -f1)
  log_hash "wsl/home/.tmux-plugins-list.txt" "$HOME/.tmux/plugins (directory listing only, not plugin source, generated)" "n/a" "$dsthash" "GENERATED"
else
  log_excluded "$HOME/.tmux/plugins" "home/.tmux-plugins-list.txt" "not present on this host"
fi

# ---- /etc/wsl.conf ----
export_file "/etc/wsl.conf" "etc/wsl.conf"

# ---- JARVIS_WSL_ENV_BLOCK section only, from ~/.bashrc; scan IN MEMORY before any write ----
if [ -f "$HOME/.bashrc" ] && ! is_forbidden "$HOME/.bashrc"; then
  start=$(grep -n '^# JARVIS_WSL_ENV_BLOCK' "$HOME/.bashrc" | head -1 | cut -d: -f1)
  if [ -n "${start:-}" ]; then
    end=$(awk -v s="$start" 'NR>s && /^# >>>/ {print NR-1; exit} END{if(NR>0) print NR}' "$HOME/.bashrc")
    # extract the range, then trim trailing blank lines via awk (portable, no multi-line sed tricks)
    block=$(sed -n "${start},${end}p" "$HOME/.bashrc" | awk '{lines[NR]=$0} END{n=NR; while (n>0 && lines[n]=="") n--; for (i=1;i<=n;i++) print lines[i]}')
    if has_secret_text "$block"; then
      log_excluded "$HOME/.bashrc (JARVIS_WSL_ENV_BLOCK lines $start-$end)" "home/.bashrc.jarvis_block" "matched secret heuristic - not copied"
    else
      dest="$WSL_OUT/home/.bashrc.jarvis_block"
      mkdir -p "$(dirname "$dest")"
      printf '%s\n' "$block" > "$dest"
      dsthash=$(sha256sum "$dest" | cut -d' ' -f1)
      log_hash "wsl/home/.bashrc.jarvis_block" "$HOME/.bashrc (JARVIS_WSL_ENV_BLOCK lines $start-$end only, generated excerpt)" "n/a" "$dsthash" "GENERATED"
    fi
  else
    log_excluded "$HOME/.bashrc" "home/.bashrc.jarvis_block" "JARVIS_WSL_ENV_BLOCK marker not found"
  fi
fi

echo "DONE: wsl export"
echo "copied: $(( $(wc -l < "$HASHES") - 1 ))"
echo "excluded/not-present: $(( $(wc -l < "$EXCLUDED") - 1 ))"
