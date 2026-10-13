#!/usr/bin/env bash
# 33-repo-contract-audit.sh (Build 5): READ-ONLY audit of the repo "editor contract" for every checkout under ~/projects.
# Reads files and `git status` only. No fetch, no writes inside any repo. Output: TSV to stdout.
# Contract per repo: .editorconfig, .vscode/extensions.json, a lockfile that matches the package manager, a runtime pin
# (.nvmrc/.node-version/packageManager/.python-version), .gitignore covering .env + node_modules/.venv, and a .gitattributes eol rule.
set -uo pipefail
ROOT="${1:-$HOME/projects}"
printf 'repo\tbranch\tdirty\tstack\teditorconfig\textensions_json\tlockfile\tpin\tgitignore_env\tgitignore_deps\tgitattributes\tproposal\n'
find "$ROOT" -maxdepth 4 -name .git \( -type d -o -type f \) -not -path '*/node_modules/*' -prune 2>/dev/null | sort | while read -r g; do
  r="$(dirname "$g")"; n="${r#$ROOT/}"
  br=$(git -C "$r" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "?")
  dirty=$(git -C "$r" status --porcelain 2>/dev/null | wc -l)
  stack=""; lock=""; pin="none"
  [ -f "$r/package.json" ] && stack="node"
  [ -f "$r/pyproject.toml" ] || [ -f "$r/requirements.txt" ] && stack="${stack:+$stack+}py"
  [ -f "$r/Cargo.toml" ] && stack="${stack:+$stack+}rust"
  [ -f "$r/go.mod" ] && stack="${stack:+$stack+}go"
  [ -z "$stack" ] && stack="other"
  for l in pnpm-lock.yaml package-lock.json yarn.lock bun.lockb bun.lock uv.lock poetry.lock Cargo.lock go.sum; do [ -f "$r/$l" ] && lock="$lock$l;"; done
  lock="${lock%;}"; [ -z "$lock" ] && lock="none"
  pins=""
  for p in .nvmrc .node-version .python-version .tool-versions rust-toolchain.toml; do [ -f "$r/$p" ] && pins="$pins$p;"; done
  [ -f "$r/package.json" ] && grep -q '"packageManager"' "$r/package.json" 2>/dev/null && pins="${pins}packageManager;"
  [ -n "$pins" ] && pin="${pins%;}"
  ec=no; [ -f "$r/.editorconfig" ] && ec=yes
  ej=no; [ -f "$r/.vscode/extensions.json" ] && ej=yes
  ge=no; grep -qE '^\.env' "$r/.gitignore" 2>/dev/null && ge=yes
  gd=no; grep -qE 'node_modules|\.venv|venv|target' "$r/.gitignore" 2>/dev/null && gd=yes
  ga=no; [ -f "$r/.gitattributes" ] && ga=yes
  prop=""
  [ "$ec" = no ] && prop="${prop}add .editorconfig; "
  [ "$ej" = no ] && prop="${prop}add .vscode/extensions.json; "
  [ "$ge" = no ] && prop="${prop}ignore .env; "
  [ "$gd" = no ] && [ "$stack" != other ] && prop="${prop}ignore deps dir; "
  [ "$ga" = no ] && prop="${prop}add .gitattributes (eol=lf); "
  [ "$lock" = none ] && [ "$stack" != other ] && prop="${prop}commit a lockfile; "
  [ "$pin" = none ] && [ "$stack" != other ] && prop="${prop}pin runtime; "
  [ "$dirty" -gt 0 ] && prop="${prop}(dirty: do not edit until clean)"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$n" "$br" "$dirty" "$stack" "$ec" "$ej" "$lock" "$pin" "$ge" "$gd" "$ga" "${prop:-ok}"
done
