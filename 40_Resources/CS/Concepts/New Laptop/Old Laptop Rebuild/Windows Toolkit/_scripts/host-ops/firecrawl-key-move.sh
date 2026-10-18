#!/usr/bin/env bash
# firecrawl-key-move.sh  (Build 4b, A8, 2026-10-15)  ASCII only. Run INSIDE WSL.
#   bash /mnt/d/WSL/ops/windows/firecrawl-key-move.sh            dry run: changes nothing, asks for nothing, prints no secret
#   bash /mnt/d/WSL/ops/windows/firecrawl-key-move.sh --remove   deletes the key from ~/.bashrc and stores NOTHING (no new key is written anywhere)
#   bash /mnt/d/WSL/ops/windows/firecrawl-key-move.sh --apply    removes it AND stores a NEW key in ~/.mcp.env (prompts once, hidden input)
# Steps:
#   1. asks Firecrawl's own API whether the OLD key (the one in ~/.bashrc) is still accepted (status code only).
#      --apply stops if it still works; --remove only warns, because deleting the line is right either way.
#   2. --apply only: prompts for the NEW key (hidden), checks the API accepts it, writes it to ~/.mcp.env (chmod 600; ~/.bashrc already sources it, line 150).
#   3. removes the "# Firecrawl secrets" comment and the export line from ~/.bashrc (a copy with the key line blanked goes to D:\Backup\dotfiles-<stamp>\).
#   4. verifies: ~/.bashrc no longer holds the old key; lists other files that still hold the old key (paths only).
# Secret values are never printed, logged or put on a command line (curl reads its header from a process substitution).
set -u
apply=0; remove=0
case "${1:-}" in --apply) apply=1 ;; --remove) remove=1 ;; esac
logdir=/mnt/d/WSL/ops/windows/logs; mkdir -p "$logdir"
stamp=$(date +%Y%m%d-%H%M%S)
log="$logdir/firecrawl-key-move-$stamp.log"
say() { echo "$(date +%H:%M:%S) $*" | tee -a "$log"; }
rc="${FC_TEST_RC:-$HOME/.bashrc}"; envf="${FC_TEST_ENV:-$HOME/.mcp.env}"   # FC_TEST_* only for testing against dummy files
say "firecrawl-key-move apply=$apply remove=$remove  log=$log"

# HTTP status of Firecrawl's credit-usage endpoint for a key (status code only). 200 = key valid, 401/403 = rejected.
fc_status() {
  local k="$1" c
  for v in v2 v1; do
    c=$(curl -s -o /dev/null -m 20 -w '%{http_code}' --config <(printf 'header = "Authorization: Bearer %s"\n' "$k") "https://api.firecrawl.dev/$v/team/credit-usage" 2>/dev/null)
    case "$c" in 200|401|402|403) echo "$c"; return ;; esac
  done
  echo "${c:-000}"
}

# ---- locate the old key in ~/.bashrc
n=$(grep -c '^export FIRECRAWL_API_KEY=' "$rc")
if [ "$n" != "1" ]; then say "STOP: expected exactly 1 'export FIRECRAWL_API_KEY=' line in $rc, found $n"; exit 2; fi
lineno=$(grep -n '^export FIRECRAWL_API_KEY=' "$rc" | cut -d: -f1)
cmt=0; [ "$lineno" -gt 1 ] && [ "$(sed -n "$((lineno - 1))p" "$rc")" = "# Firecrawl secrets" ] && cmt=1
old=$(grep '^export FIRECRAWL_API_KEY=' "$rc" | head -1 | cut -d= -f2-)
old=${old%\"}; old=${old#\"}; old=${old%\'}; old=${old#\'}
say "found assignment at $rc line $lineno (comment line above it: $cmt); old key length ${#old}"
ostat=$(fc_status "$old")
say "Firecrawl API says the key in .bashrc -> HTTP $ostat  (401/403 = revoked; 200 = STILL ACCEPTED by Firecrawl)"
if [ "$ostat" = "200" ]; then say "NOTE: this key still works at Firecrawl. In the dashboard, the key whose 'last used' time is now ($(date +%H:%M)) is the one to revoke."; fi
envperm=$(stat -c %a "$envf" 2>/dev/null || echo missing)
say "$envf perms: $envperm; already defines FIRECRAWL_API_KEY: $(grep -c '^\(export \)\?FIRECRAWL_API_KEY=' "$envf" 2>/dev/null)"

if [ "$apply" = "0" ] && [ "$remove" = "0" ]; then
  say "DRY RUN: --remove would delete line(s) $((lineno - cmt))-$lineno from $rc and store nothing; --apply would also store a new key in $envf (600). Nothing changed."
  exit 0
fi

new=""
if [ "$apply" = "1" ]; then
  if [ "$ostat" = "200" ]; then say "STOP: the old key still works. Revoke it in the Firecrawl dashboard first, then re-run (or use --remove)."; exit 3; fi
  read -rsp 'Paste the NEW Firecrawl API key (hidden, then Enter): ' new; echo
  if [ -z "$new" ] || [[ "$new" =~ [[:space:]\'\"] ]]; then say "STOP: empty key or it contains whitespace/quotes"; exit 4; fi
  if [ "$new" = "$old" ]; then say "STOP: the new key is identical to the old one"; exit 4; fi
  nstat=$(fc_status "$new")
  say "Firecrawl API says NEW key -> HTTP $nstat"
  if [ "$nstat" != "200" ]; then say "STOP: the API did not accept the new key (expected 200). Nothing was written."; exit 5; fi
fi

bk="${FC_TEST_BK:-/mnt/d/Backup/dotfiles-$stamp}"; mkdir -p "$bk"
sed -E 's/^(export FIRECRAWL_API_KEY=).*/\1<removed>/' "$rc" > "$bk/bashrc.redacted"
say "backup of .bashrc with the key blanked: $bk/bashrc.redacted"

if [ "$apply" = "1" ]; then
  [ -f "$envf" ] && cp -p "$envf" "$HOME/.mcp.env.bak-$stamp" && chmod 600 "$HOME/.mcp.env.bak-$stamp" && say "rollback copy of $envf: $HOME/.mcp.env.bak-$stamp (holds secrets: delete it once everything works)"
  umask 077
  tmp=$(mktemp "$HOME/.mcp.env.new.XXXXXX")
  { [ -f "$envf" ] && grep -v '^\(export \)\?FIRECRAWL_API_KEY=' "$envf"; printf "export FIRECRAWL_API_KEY='%s'\n" "$new"; } > "$tmp"
  chmod 600 "$tmp"; mv -f "$tmp" "$envf"; chmod 600 "$envf"
  say "wrote FIRECRAWL_API_KEY to $envf (perms $(stat -c %a "$envf"))"
fi

tmp=$(mktemp "$HOME/.bashrc.new.XXXXXX")
awk -v ln="$lineno" -v c="$cmt" 'NR==ln {next} (c==1 && NR==ln-1) {next} {print}' "$rc" > "$tmp"
chmod --reference="$rc" "$tmp"; mv -f "$tmp" "$rc"
say "removed line(s) $((lineno - cmt))-$lineno from $rc"

# ---- verify (counts only)
say "~/.bashrc still contains the old key: $(grep -cF -- "$old" "$rc")  | any FIRECRAWL_API_KEY= line left in .bashrc: $(grep -c 'FIRECRAWL_API_KEY=' "$rc")"
if [ "$apply" = "1" ]; then
  len=$(timeout 20 env -i HOME="$HOME" PATH="$PATH" bash -c '. "$HOME/.mcp.env" 2>/dev/null; echo ${#FIRECRAWL_API_KEY}' 2>/dev/null | tail -1)
  say "sourcing $envf in a clean shell gives FIRECRAWL_API_KEY with length: $len (new key length ${#new}); .bashrc line 150 sources this file"
else
  say "$envf defines FIRECRAWL_API_KEY: $(grep -c '^\(export \)\?FIRECRAWL_API_KEY=' "$envf" 2>/dev/null) (expected 0 after --remove; nothing stored)"
fi
say "scanning the config files that can hold an MCP key for the OLD key; file paths only"
found=0
W="/mnt/c/Users/Anant Gupta"
for p in "$HOME/.mcp.env" "$HOME/.profile" "$HOME/.bash_profile" "$HOME/.zshrc" "$HOME/.claude.json" "$HOME/.claude/settings.json" "$HOME/.cursor/mcp.json" "$HOME/.codex/config.toml" "$HOME/.gemini/settings.json" "$HOME/.config/mcp/mcp.json" \
         "$W/.claude.json" "$W/.claude/settings.json" "$W/.cursor/mcp.json" "$W/.codex/config.toml" "$W/.gemini/settings.json" "$W/.config/mcp/mcp.json" "$W/AppData/Roaming/Code/User/mcp.json" "$W/AppData/Roaming/Code/User/settings.json" "$W/AppData/Roaming/Cursor/User/settings.json"; do
  [ -f "$p" ] || continue
  if grep -qF -- "$old" "$p" 2>/dev/null; then found=1; say "   still holds the old key: $p"; fi
done
[ "$found" = "0" ] && say "no other file in those locations holds the old key"
say "Restart Claude Code, Cursor and VS Code so MCP servers drop the old key."
say "DONE. Log: $log"
