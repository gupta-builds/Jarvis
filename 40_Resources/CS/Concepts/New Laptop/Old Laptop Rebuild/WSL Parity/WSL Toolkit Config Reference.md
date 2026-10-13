---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Acer Session Handoff - Toolkit Sync (Build 5b)]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
  - "[[Installations]]"
  - "[[Acer Live State — 2026-09-16]]"
next: "Acer session runs the handoff note; both laptops then report `wsl-check.sh` output so the two columns below match."
---
# WSL Toolkit Config Reference

## One-Line Answer
==Both laptops now take their WSL terminal configs from one golden folder in the vault (`Old Laptop Rebuild/WSL Parity/golden/home`), applied by `37-toolkit-apply.sh`, and their tool binaries from pinned releases installed by `38-toolkit-upgrade.sh`; this note explains every file, why it looks the way it does, and how to verify it.==

## How the two laptops stay identical
| Piece | Where | Rule |
|---|---|---|
| Golden configs | vault `Old Laptop Rebuild/WSL Parity/golden/home/...` (mirrors `~`) | Edit here first, then run `37-toolkit-apply.sh` on both laptops. Never hand-edit `~/.config/...` and leave it. |
| Config apply script | `WSL Parity/_scripts/37-toolkit-apply.sh [--dry-run]` | Secret scan, timestamped backups in `~/.config/.toolkit-backups/<ts>/`, SHA-256 table, git include wiring, one guarded `.bashrc` line. Auto-detects the vault path on both laptops. |
| Tool binaries | `WSL Parity/_scripts/38-toolkit-upgrade.sh [--dry-run] [--only ...] [--rollback TOOL]` | Pinned versions, pinned SHA-256, previous binary kept in `~/.local/bin/.prev/`. User space, no sudo. |
| Health check | `wsl-check.sh [config|tools|disk|swap|editors|backup|dtree]` | Read-only. Run on both laptops and compare. |
| Machine-specific, never shared | `~/.gitconfig` (user, credentials, lfs, `core.autocrlf`), `gh-dash repoPaths`, `.bashrc` secrets, `~/.mcp.env` | Stay local. |

Versions below are as of 2026-10-13. "Acer" is what its snapshot and notes recorded on 2026-09-19 to 2026-10-12, so it is a floor, not a live reading.

## Version matrix
| Tool | Dell now | Acer (recorded) | Latest release | Method on the Dell | Note |
|---|---|---|---|---|---|
| starship | 1.26.0 | 1.26.0 | 1.26.0 | release binary | current |
| yazi + ya | 26.9.1 | 26.9.1 | 26.9.1 | release binary | current; `ya` and `yazi` versions must match exactly |
| tmux | 3.4 (apt) | 3.7c | 3.8 | apt | 3.8 build needs `sudo apt install -y bison`, then `38 --only tmux` |
| lazygit | 0.66.1 | 0.65.1 | 0.66.1 | release binary | no config renames between 0.64 and 0.66 |
| delta | 0.20.1 | 0.19.2 | 0.20.1 | release binary | |
| atuin | 18.23.0 | 18.22.0 | 18.23.0 | installer | |
| sesh | 2.33.0 | 2.30.1 | 2.33.0 | release binary | repo is `joshmedeski/sesh` |
| zoxide | 0.10.0 | 0.10.0 | 0.10.0 | installer | |
| gh | 2.102.0 | 2.45.0 | 2.102.0 | release binary in `~/.local/bin` | the git credential helper still points at `/usr/bin/gh` (apt 2.45); auth state is shared in `~/.config/gh`, so both work |
| gh-dash | 4.26.1 | 4.25.2 | 4.26.1 | `gh extension install dlvhdr/gh-dash` | a loose-binary install cannot be upgraded; reinstall once through gh |
| fzf | 0.74.5 | apt 0.44.1 | 0.74.5 | release binary | shell integration needs 0.48+ |
| ripgrep | 15.2.0 | 14.1.0 | 15.2.0 | musl release binary | |
| fd | 10.5.0 | 9.0.0 | 10.5.0 | musl release binary (replaces the `fdfind` symlink) | |
| bat | 0.26.1 | 0.24.0 | 0.26.1 | musl release binary (replaces the `batcat` symlink) | |
| ncdu | 1.19 (apt) | 1.19 | 2.9 | apt | deliberately not upgraded (2.x is a Zig rewrite; same options still valid) |
| git | 2.43.0 (apt) | 2.43.0 | newer | apt | no user-space upgrade; see git notes |
| node | 24.21.0 (24.14.1 kept) | 24.21.0 | 24.21.0 | nvm | globals reinstalled from the old version |
| pnpm | 10.33.2 | 12.4.2 | 12.x | Corepack | MAJOR GAP, see decision below |
| uv | 0.12.23 | 0.12.17 | 0.13.0 | installer | held on 0.12.x on purpose |
| ruff / shellcheck / shfmt | 0.17.0 / 0.11.0 / 3.14.1 | check | same | uv tool / release binaries | |
| conda | 26.7.1 | 26.7.1 | | Miniconda in `~/miniconda3` | conda-forge only |
| claude / codex | 2.1.296 / 0.162.1 | 2.1.277 / check | same | own installers / npm | |
| win32yank | 0.1.1 | same | 0.1.1 | `~/.local/bin/win32yank.exe` | tmux copy-mode clipboard bridge |

Open decision for the user: pnpm major. The Dell is pinned on 10.33.2 (the Locked Decisions note prescribes `enableGlobalVirtualStore` for 10.x). The Acer floated to 12.4.2 because Corepack was never pinned. Repos shared by both laptops should declare `packageManager` in `package.json` so Corepack picks the same pnpm everywhere. Until decided, do not commit lockfile changes made with the other major.

## Per-tool reference

### starship (prompt)
- File: `~/.config/starship.toml`. Golden = the Acer's Tokyo Night "pastel powerline" file (LF) plus Build 5b additions.
- Acer origin: tuned 2026-09-19 (exit-code `[status]`, `[cmd_duration]`, `$shlvl`, `$jobs`; `scan_timeout` raised from 30 to 500 ms because the default timed out on a repo on a slow mount).
- Build 5b: `command_timeout = 1000`; `$python` and `$conda` added to the format (a custom `format` replaces `$all`, so unlisted modules never render; conda `auto_activate` and `changeps1` are off, so Starship is the only place the active env shows); `[conda] ignore_base = true`; segments styled in the same dark-blue block as node/rust.
- Verify: in a folder with `pyproject.toml` and `CONDA_DEFAULT_ENV=jupyter-base`, `starship prompt` shows the Python version and `jupyter-base`. `starship explain` lists the modules. Do not run `starship config` (it opens `$EDITOR`).
- Pitfall: the Acer's WSL copy had CRLF line endings (edited from Windows). The golden file is LF; `37` strips CR.

### tmux
- File: `~/.tmux.conf`; plugins in `~/.tmux/plugins` via TPM (tpm, tmux-resurrect, tmux-continuum, tmux-fzf, tmux-agent-status by samleeney, tmux-handlr by CRThaze).
- Acer origin: prefix `Ctrl-a` and `|` / `-` splits to match WezTerm's defaults, `pane-border-status top` labels so several AI agent panes are distinguishable, 1-based indices, `mode-keys vi`, win32yank clipboard, lazygit popup on `g`, continuum restore, agent plugins. Chosen over zellij because the future workflow is several AI CLI agent sessions in parallel panes that must survive a `wsl --shutdown` (resurrect and continuum have years of use).
- Build 5b additions, all valid on tmux 3.4 through 3.8 (tmux CHANGES read for 3.4 to 3.8): `default-terminal tmux-256color` plus `terminal-features ",*:RGB"` (truecolor); `escape-time 10` (tmux below 3.5 defaults to 500 ms, laggy Esc in vim and AI TUIs); `focus-events on`; `allow-passthrough on` plus `update-environment TERM, TERM_PROGRAM` (Yazi image previews, per the Yazi docs); `history-limit 100000`; `renumber-windows on`; splits and new windows keep the current directory; `bind r` reloads; `detach-on-destroy off` (sesh recommends it); `win32yank.exe -i --crlf` so Windows apps get CRLF; `T` opens `sesh picker -i`, `L` runs `sesh last`; pane label also shows the running command (`claude`, `codex`, `lazygit`).
- tmux 3.8 notes: `mouse` now defaults to on (harmless), Tab and BTab and `prefix T` gain default bindings (we bind `T` ourselves), no removal affects this config.
- Verify (no plugins, throwaway socket): `grep -v -E "^run |@plugin|^set -g @" ~/.tmux.conf > /tmp/t.conf; tmux -L t -f /tmp/t.conf new-session -d 'sleep 5'; tmux -L t show -g prefix escape-time history-limit; tmux -L t kill-server`.
- Pitfalls: a 3.8 client cannot attach to a 3.4 server ("protocol version mismatch"): kill the server before changing tmux versions. Never test with the real conf on a throwaway socket: continuum would try to restore saved sessions into it. Non-interactive shells may find `/usr/bin/tmux` first; keep `~/.local/bin` first in PATH.
- Still pending from the Acer notes: the `tmux-handlr` push-notification topic. `@handlr-notify-command` points at `agent-ntfy-notify.sh`, but the ntfy topic (a random name, treated like a secret) was never confirmed. Set it locally in `~/.tmux/plugins/tmux-handlr` config, not in the vault.

### yazi (file manager)
- Files: `~/.config/yazi/{yazi.toml,keymap.toml,theme.toml,init.lua,package.toml}`, flavor `flavors/tokyonight-storm.yazi`, plugins `git`, `full-border`, `smart-filter`.
- Acer origin: built from nothing 2026-09-19: git-status column, full borders, `F` for smart filter, Tokyo Night Storm flavor, a bug fixed on the way (this yazi build rejects a `$schema` key).
- Build 5b: removed `id = "git"` from the fetcher rules (docs list `url, run, if, prio, group`; yazi ignores the extra key, verified by launching it). `package.toml` pins plugins by commit hash so a fresh `ya pkg install` reproduces them.
- Image previews: Yazi needs chafa 1.16+ as fallback (Dell has 1.18.3 static in `~/.local/bin`; the Acer notes show apt 1.14.0, which is too old), tmux `allow-passthrough`, and Windows Terminal 1.22.10352+ for Sixel. Under WSL, ConPTY limits Sixel; chafa block art is the realistic result.
- Verify: `ya pkg list`; open in a real terminal (`tmux -L t new-session -d -x 120 -y 30 yazi ~/projects; tmux -L t capture-pane -p`).

### atuin (shell history)
- File: `~/.config/atuin/config.toml`; data in `~/.local/share/atuin`.
- Acer origin: installed 2026-09-19, 230 lines of bash history imported, local only; the Acer file is the 16 KB commented default dump plus `filter_mode = "global"`, `filter_mode_shell_up_key_binding = "directory"`, `enter_accept = true`.
- Build 5b: golden file lists only non-defaults. Added `auto_sync = false` and `update_check = false` (no network traffic at all), `secrets_filter = true`, and a `history_filter` regex list so API keys never enter history (atuin's built-in filter does not know OpenAI, Anthropic or Firecrawl key shapes). Regexes were tested against a sample set: key assignments, `export ...KEY=`, `sk-`, `fc-`, GitHub tokens, Bearer tokens, AWS keys are filtered; ordinary commands are not.
- Verify: `atuin history start -- 'export TEST_API_KEY=abcdefgh1234567890'` returns nothing (filtered). After editing `history_filter`, `atuin history prune` removes already stored matches.
- Interaction: Ctrl-R belongs to atuin. fzf's Ctrl-R binding is disabled in `env.sh`.

### sesh (tmux session manager)
- File: `~/.config/sesh/sesh.toml` (schema line at the top for editor validation).
- Acer origin: chosen over tmux-sessionizer because its author superseded that tool with sesh and sesh reads zoxide's ranking; the Acer file was only `preview_command = "ls -la --color=always {}"`.
- Build 5b: `dir_length = 2`, `sort_order`, one `[[session]] projects -> ~/projects`; popup via `sesh picker -i` (built in; no fzf-tmux needed). Documented keys: `[default_session]`, `[[session]]`, `[[window]]` (key is `startup_script`), `[[wildcard]]`, `blacklist`, `cache`.

### lazygit
- File: `~/.config/lazygit/config.yml`.
- Acer origin: delta pager, `nerdFontsVersion 3`, file tree on, command log off, popup on tmux `g`.
- Key fact: the pager setting is `git.diffRenderers` (renamed from `git.paging` in lazygit 0.64.0). The Acer file is correct; the Dell's older reconstruction used the retired key. `delta --navigate` does not work in lazygit, so it is not passed. `--dark` is hard-coded instead of `{{colorScheme}}` (that variable needs 0.66+, and the Acer runs 0.65.1).
- Build 5b: Tokyo Night Storm border and selection colours under `gui.theme`.
- First launch of a new lazygit version shows a "Thanks for using lazygit" popup once; press Esc.

### git + delta
- Files: `~/.gitconfig` (machine) includes `~/.config/git/shared.gitconfig` (golden) and `~/.config/git/ignore`.
- Shared keys and why: `core.pager=delta`, `interactive.diffFilter`, `delta.navigate/dark/line-numbers/side-by-side` (Acer choices); `merge.conflictStyle=zdiff3` (delta's docs recommend it; the Acer used diff3); `diff.algorithm=histogram`, `colorMoved` with `colorMovedWS` (cleaner agent diffs); `pull.rebase`, `push.autoSetupRemote`, `fetch.prune`, `rerere.enabled` (Build 2 keys); `rebase.updateRefs`, `branch.sort=-committerdate`, `worktree.guessRemote` (parallel worktree workflow); `core.untrackedCache`.
- Deliberately NOT set: `core.fsmonitor`. Git 2.43 on Linux prints `fsmonitor--daemon not supported on this platform`; the Acer had it set from its Windows config and it does nothing in WSL. `rebase.autoStash` (would let `git pull` stash dirty work silently). `help.autocorrect=prompt` (probably unsupported on 2.43).
- `core.autocrlf`: Dell WSL = `input`. The Acer WSL has `false`, which silently commits CRLF; recommend `input` there too.
- Ignore file: Acer's secret patterns plus `.claude/settings.local.json`, `*.p12`, `*.pfx`, `id_rsa`, `id_ed25519`, OS junk. A repo that must track one uses `git add -f`.

### gh and gh-dash
- `gh` 2.102.0 lives in `~/.local/bin`; `/usr/bin/gh` (2.45.0, apt) remains because `~/.gitconfig` credential helpers call it by absolute path. Both read `~/.config/gh/hosts.yml`.
- gh-dash file `~/.config/gh-dash/config.yml`: Acer's sections, `pager.diff: delta`, preview layout. `repoPaths` is machine specific: syntax is `owner/repo: ~/projects/<group>/<repo>` or `owner/*: ~/projects/<group>/*` (exact beats wildcard; wildcard keys need wildcard values). The Acer pointed one entry at `/mnt/d/Apps/Hermes/...`, a Windows path; repos belong on ext4.

### bat, fd, ripgrep, fzf (search and view)
- bat: `~/.config/bat/config` with the Windows Toolkit's flags (`--style=numbers,changes,header`, `--paging=auto`, `--italic-text=always`) and `--theme="tokyonight_storm"`. bat ships no Tokyo Night theme, so `37` copies the Yazi flavor's `tmtheme.xml` to `~/.config/bat/themes/tokyonight_storm.tmTheme` and runs `bat cache --build` (rebuild after every bat upgrade).
- fd: `~/.config/fd/ignore` = the Windows Toolkit list plus `.next`, `.turbo` (keep Windows and WSL in step).
- ripgrep: reads `~/.config/ripgrep/config` only when `RIPGREP_CONFIG_PATH` is set (done in `env.sh`): smart-case, hidden, exclusions, `--max-columns=200`. Flags use `--flag=value` form.
- fzf: `env.sh` sets `FZF_DEFAULT_COMMAND` (fd), Tokyo Night colours, `Ctrl-T` files, `Alt-C` directories, and `eval "$(fzf --bash)"` with `FZF_CTRL_R_COMMAND=` so atuin keeps Ctrl-R.
- Shared entry point: `~/.config/toolkit/env.sh`, sourced by ONE line in `.bashrc` (`# >>> TOOLKIT_ENV_BLOCK`). It holds no secrets and returns immediately in non-interactive shells.

### ncdu, zoxide, direnv, chafa, win32yank
- ncdu 1.19 config unchanged: `-e`, `--color dark`, excludes, `--confirm-quit` (all still valid in 2.9 if it is ever upgraded).
- zoxide and direnv hooks live in the Acer-style `JARVIS_WSL_ENV_BLOCK` in `.bashrc`; direnv was a blocked sudo install on the Acer in September, confirm it exists there.
- chafa must be a 1.16+ static binary (apt's 1.14.0 breaks Yazi previews).

## What changed on the Dell, in order (2026-10-13)
1. `30-wsl-config-parity.sh`: replaced 11 reconstructed files and added 7 Yazi files from the Acer snapshot (27 of 31 SHA matches).
2. Removed `core.fsmonitor` (no-op) after git reported it unsupported.
3. `37-toolkit-apply.sh`: golden configs (13 files), bat theme, git include, `.bashrc` source line.
4. `38-toolkit-upgrade.sh`: gh, fzf, ripgrep, fd, bat, lazygit, sesh, gh-dash reinstall, node 24.21.0.
5. Corrected my own mistake: `~/.cache/node` held Corepack's pnpm pin and was removed by a cleanup; restored with `corepack prepare pnpm@10.33.2 --activate`.

## Sources
tmux CHANGES (3.4 to 3.8); Yazi docs (configuration, flavors, image-preview, cli); lazygit `docs/Config.md` and `Custom_DiffRenderers.md`; delta "Get started" and "Merge conflicts"; git-config manual; atuin configuration reference (docs.atuin.sh, page flagged as not the latest release); sesh README and `sesh.schema.json`; fzf README and CHANGELOG; starship config docs; gh-dash configuration and repo-paths pages; bat README; ripgrep GUIDE; fd README; ncdu manual 2.9; Acer Live State (WSL rounds 1 and 2).
