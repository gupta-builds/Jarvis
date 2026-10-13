#!/usr/bin/env bash
# 38-toolkit-upgrade.sh (Build 5b, 2026-10-13). Conservative, reversible, user-space upgrades of the WSL toolkit. No sudo.
# Every download is pinned to an exact version and verified against a pinned SHA-256 (GitHub release asset digests, read 2026-10-13).
# The previous binary is moved to ~/.local/bin/.prev/<tool>.<timestamp> first, so any tool can be rolled back.
# Usage: 38-toolkit-upgrade.sh [--dry-run] [--only gh,fzf,rg,fd,bat,lazygit,sesh,ghdash,node,tmux] [--rollback TOOL]
# Default set (everything except tmux): gh fzf rg fd bat lazygit sesh ghdash node. tmux builds from source and only runs when asked
# (--only tmux) AND no tmux server is running, because a 3.8 client cannot attach to a 3.4 server.
# NOT upgraded on purpose: git, jq, direnv, ncdu (apt; no AI-dev benefit, risk of config drift), uv (0.13 is a new minor), starship,
# yazi, delta, zoxide, atuin (already the latest release), claude, codex (already the latest release).
set -uo pipefail
DRY=0; ONLY="gh,fzf,rg,fd,bat,lazygit,sesh,ghdash,node"; ROLL=""
while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY=1 ;; --only) shift; ONLY="${1:-}" ;; --rollback) shift; ROLL="${1:-}" ;;
    --help|-h) sed -n '2,12p' "$0"; exit 0 ;; *) echo "unknown option: $1" >&2; exit 2 ;;
  esac; shift
done
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
BIN="$HOME/.local/bin"; PREV="$BIN/.prev"; TS=$(date +%Y%m%d-%H%M%S); FAILS=0; mkdir -p "$BIN" "$PREV"
say() { printf '%s\n' "$*"; }; fail() { say "FAIL: $*"; FAILS=$((FAILS+1)); }
want() { case ",$ONLY," in *",$1,"*) return 0;; *) return 1;; esac; }
W=$(mktemp -d); trap 'rm -rf "$W"' EXIT

if [ -n "$ROLL" ]; then
  last=$(ls -1t "$PREV/$ROLL".* 2>/dev/null | head -n 1)
  [ -n "$last" ] || { say "no backup for $ROLL in $PREV"; exit 1; }
  mv -f "$last" "$BIN/$ROLL" && say "rolled $ROLL back from $last"; exit 0
fi

fetch() { # url sha256 out
  curl -fsSL -m 300 "$1" -o "$3" || return 1
  [ "$(sha256sum "$3" | cut -d' ' -f1)" = "$2" ] || { say "  checksum mismatch for $1"; return 1; }
}
put_bin() { # src name
  local src="$1" name="$2" dst="$BIN/$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then mv -f "$dst" "$PREV/$name.$TS" || return 1; fi
  install -m 0755 "$src" "$dst.new" && mv -f "$dst.new" "$dst"
}
have() { # bin expected-substring
  local v; v=$("$1" --version 2>&1 | head -n 3 | tr '\n' ' '); case "$v" in *"$2"*) return 0;; *) return 1;; esac
}
tarball() { # name verstr bin url sha inner
  local name="$1" ver="$2" bin="$3" url="$4" sha="$5" inner="$6"
  want "$name" || return 0
  if have "$bin" "$ver" && [ "$(command -v "$bin")" = "$BIN/$bin" ]; then say "  $name already $ver in ~/.local/bin"; return 0; fi
  if [ "$DRY" = 1 ]; then say "  would install $name $ver from $url"; return 0; fi
  mkdir -p "$W/$name"
  if ! { fetch "$url" "$sha" "$W/$name.tgz" && tar -xzf "$W/$name.tgz" -C "$W/$name"; }; then fail "$name download/extract"; return 1; fi
  put_bin "$W/$name/$inner" "$bin" || { fail "$name install"; return 1; }
  if have "$bin" "$ver"; then say "  $name -> $("$bin" --version 2>&1 | head -n 1)"; else fail "$name version check after install (rollback: $0 --rollback $bin)"; fi
}

say "== Build 5b toolkit upgrade ($TS) dry-run=$DRY only=$ONLY"
tarball gh      "2.102.0" gh      https://github.com/cli/cli/releases/download/v2.102.0/gh_2.102.0_linux_amd64.tar.gz                     bb766f710eef8ede859c18578c72c327597cd4c8a85b06001b1f3843c6019386 "gh_2.102.0_linux_amd64/bin/gh"
tarball fzf     "0.74.5"  fzf     https://github.com/junegunn/fzf/releases/download/v0.74.5/fzf-0.74.5-linux_amd64.tar.gz                  d47d7f882972c7d674dbbba998ffa4116e68379616ffac7695d0671e9a722c5f "fzf"
tarball rg      "15.2.0"  rg      https://github.com/BurntSushi/ripgrep/releases/download/15.2.0/ripgrep-15.2.0-x86_64-unknown-linux-musl.tar.gz 33e15bcf1624b25cdd2a55813a47a2f95dbe126268203e76aa6a585d1e7b149c "ripgrep-15.2.0-x86_64-unknown-linux-musl/rg"
tarball fd      "10.5.0"  fd      https://github.com/sharkdp/fd/releases/download/v10.5.0/fd-v10.5.0-x86_64-unknown-linux-musl.tar.gz     761c72dc8e120d85b22292063be8a796e2eeb20eb3e4f38b8fa2343ccf3514a7 "fd-v10.5.0-x86_64-unknown-linux-musl/fd"
tarball bat     "0.26.1"  bat     https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz   0dcd8ac79732c0d5b136f11f4ee00e581440e16a44eab5b3105b611bbf2cf191 "bat-v0.26.1-x86_64-unknown-linux-musl/bat"
tarball lazygit "0.66.1"  lazygit  https://github.com/jesseduffield/lazygit/releases/download/v0.66.1/lazygit_0.66.1_linux_x86_64.tar.gz  7b3f30c2c06a42cf575280f907e58d7ea08411408b6b62bc926bc91cbc6c3f46 "lazygit"
tarball sesh    "2.33.0"  sesh    https://github.com/joshmedeski/sesh/releases/download/v2.33.0/sesh_Linux_x86_64.tar.gz                  e04fe35778eaf768a1fbbaa6e01d008ae22038c52b8d7834d38c9e7ad4822daa "sesh"

if want ghdash; then
  if [ "$DRY" = 1 ]; then say "  would run: gh extension upgrade dlvhdr/gh-dash"
  else gh extension upgrade dlvhdr/gh-dash 2>&1 | tail -n 1; say "  gh-dash: $(gh extension list 2>/dev/null | grep -i dash | cut -f1,3 | tr '\t' ' ')"; fi
fi

if want node; then
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  CUR=$(node -v 2>/dev/null)
  if [ "$CUR" = "v24.21.0" ]; then say "  node already v24.21.0"
  elif [ "$DRY" = 1 ]; then say "  would run: nvm install 24.21.0 --reinstall-packages-from=$CUR ; corepack enable ; keep $CUR installed"
  else
    nvm install 24.21.0 --reinstall-packages-from="$CUR" >"$W/nvm.log" 2>&1 || { tail -n 5 "$W/nvm.log"; fail "nvm install 24.21.0"; }
    nvm alias default 'lts/*' >/dev/null 2>&1; nvm use 24.21.0 >/dev/null 2>&1
    corepack enable >/dev/null 2>&1
    say "  node $(node -v) npm $(npm -v) pnpm $(pnpm --version 2>&1 | tail -n 1) ; globals: $(npm ls -g --depth=0 2>/dev/null | tail -n +2 | wc -l) ; old $CUR kept"
  fi
fi

if want tmux; then
  LE="$HOME/.local/libevent-2.1.13"
  if tmux ls >/dev/null 2>&1; then say "  tmux: a server is running; refusing to build (kill it first: tmux kill-server)"
  elif have tmux "tmux 3.8" && [ "$(command -v tmux)" = "$BIN/tmux" ]; then say "  tmux already 3.8"
  elif [ "$DRY" = 1 ]; then say "  would build libevent 2.1.13 (static, ~/.local/libevent) and tmux 3.8 into ~/.local/bin"
  elif ! { command -v gcc >/dev/null && command -v make >/dev/null && command -v pkg-config >/dev/null; }; then fail "tmux build needs gcc, make, pkg-config"
  elif ! { command -v yacc >/dev/null || command -v bison >/dev/null; }; then
    say "  tmux 3.8 needs yacc/bison, which is not installed. One sudo line, then rerun with --only tmux:  sudo apt install -y bison"
    say "  (tmux stays on the apt 3.4 until then; the golden .tmux.conf works on 3.4 and 3.8)"
  else
    if ! ( cd "$W" && fetch https://github.com/libevent/libevent/releases/download/release-2.1.13-stable/libevent-2.1.13-stable.tar.gz f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c le.tgz \
      && tar -xzf le.tgz && cd libevent-2.1.13-stable && ./configure --prefix="$LE" --disable-shared --disable-openssl --disable-samples --disable-libevent-regress >/dev/null && make -j4 >/dev/null && make install >/dev/null ); then fail "libevent build"; fi
    if ! ( cd "$W" && fetch https://github.com/tmux/tmux/releases/download/3.8/tmux-3.8.tar.gz e79c699c7e949dccd0a4a125e17b8d1261e311b16979dbc8eb34542f3966d82e tmux.tgz \
      && tar -xzf tmux.tgz && cd tmux-3.8 && PKG_CONFIG_PATH="$LE/lib/pkgconfig" ./configure --prefix="$HOME/.local" >/dev/null && make -j4 >/dev/null ); then fail "tmux build"; fi
    if [ "$FAILS" -eq 0 ]; then
      if put_bin "$W/tmux-3.8/tmux" tmux; then say "  tmux -> $(tmux -V)"; else fail "tmux install"; fi
    fi
  fi
fi

say "== versions now"
for t in gh fzf rg fd bat lazygit sesh tmux node pnpm; do printf '  %-8s %s\n' "$t" "$({ "$t" --version 2>&1 || "$t" -V 2>&1; } | head -n 1 | cut -c1-70) [$(command -v "$t")]"; done
say "== done: fails=$FAILS ; previous binaries are in $PREV ; rollback: $0 --rollback <tool>"
[ "$FAILS" -eq 0 ]
