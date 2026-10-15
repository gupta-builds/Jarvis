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
  - "[[WSL Toolkit Config Reference]]"
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
  - "[[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]]"
next: "The Acer session runs steps 1 to 7, then fills in the Results section at the bottom of this note."
---
# Acer Session Handoff - Toolkit Sync (Build 5b)

## One-Line Answer
==The Dell's WSL toolkit was upgraded and its configs were turned into one golden set in this vault; the Acer must apply the same set so both laptops behave identically, and several things on the Acer are missing or wrong and need fixing there.==

## Who this is for
The Claude session running on the Acer (Windows plus WSL Ubuntu-24.04, user `anant_gupta`). You have no access to the Dell. Everything you need is in this vault, which Syncthing carries to you. Wait for Syncthing to finish before starting, then check the golden folder exists.

Vault root as the Acer sees it from WSL: `/mnt/d/_Anant/20_Progress/Documents/Jarvis`. Shorthand used below: `$P` = `<vault>/40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/WSL Parity`.
```
V=/mnt/d/_Anant/20_Progress/Documents/Jarvis
P="$V/40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/WSL Parity"
ls "$P/golden/home" "$P/_scripts"
```
If the path does not exist, find the vault with `ls /mnt/d/_Anant/*/Documents` and adjust; the scripts accept `--vault <path>`.

Same visit (added 2026-10-15): also run Part 0 of [[Acer Run Sheet - Windows Toolkit]] and the Build 2 SSH items in [[Old Laptop Rebuild - Build 2 Acer Handoff]] (host-key comparison, sync-check over SSH, large Git transfer, clone inventory, optional WSL route test).

## Rules for this session
- Read-only first; every script has `--dry-run`. Back up before editing (the scripts do it for you).
- Never print `.bashrc` broadly, `~/.mcp.env`, tokens, keys or auth files. Never copy secrets into the vault.
- Do not edit files under `golden/` on the Acer. If a golden file is wrong for the Acer, write the reason under Results below and let the Dell session change the golden copy, so the two laptops never diverge.
- No `wsl --shutdown` from inside WSL. Host steps go in a script for the user.
- No em dashes in vault notes.

## Steps (in order)
1. Health baseline, read-only. Install the checker, run it, keep the output for the Results section.
   `install -m 0755 "$P/_scripts/36-wsl-check.sh" ~/.local/bin/wsl-check.sh && wsl-check.sh`
2. Close any tmux server before touching tmux or its config: `tmux ls` should say no server (or `tmux kill-server`; continuum restores sessions later).
3. Apply the golden configs. Dry run, read the list, then apply.
   `bash "$P/_scripts/37-toolkit-apply.sh" --dry-run`
   `bash "$P/_scripts/37-toolkit-apply.sh"`
   It backs up every file it changes to `~/.config/.toolkit-backups/<timestamp>/`, scans for secrets first, builds the bat theme, wires git to the shared include, removes the no-op `core.fsmonitor`, and appends ONE guarded line to `.bashrc`.
4. Upgrade the binaries (user space, pinned, checksum-verified, reversible).
   `bash "$P/_scripts/38-toolkit-upgrade.sh" --dry-run`
   `bash "$P/_scripts/38-toolkit-upgrade.sh"`
   Rollback any tool: `bash "$P/_scripts/38-toolkit-upgrade.sh" --rollback <tool>`. The default set now ALSO pins pnpm to 12.4.2 (Corepack) and builds tmux 3.8 from source into `~/.local/bin` (static libevent, a no-op yacc stub because the tarball ships `cmd-parse.c`, no sudo). tmux is skipped while a tmux server runs: close every tmux session on the Acer first (`tmux kill-server`), otherwise rerun later with `--only tmux`. The Dell is already on tmux 3.8 and pnpm 12.4.2.
5. Reload tmux plugins: start tmux, press `Ctrl-a` then `I` (capital i) once so TPM installs any missing plugin.
6. Fix the Acer-only problems in the table below.
7. Verify and report: `wsl-check.sh`, `ya pkg list`, `starship explain | head`, `bat --list-themes | grep tokyonight_storm`, `git config --show-origin --get core.pager`. Paste the results in the Results section.

## What is missing or wrong on the Acer (evidence, then fix)
| # | Problem | Evidence | Fix |
|---|---|---|---|
| 1 | `core.autocrlf=false` in WSL silently commits CRLF; Build 2 git keys absent | Acer snapshot `.gitconfig` | Step 3 adds the shared include (pull.rebase, push.autoSetupRemote, fetch.prune, rerere). Then `git config --global core.autocrlf input`. |
| 2 | `core.fsmonitor=true` and `untrackedCache` copied from the Windows config; fsmonitor does nothing in WSL (`git fsmonitor--daemon status` says unsupported on this platform) | Dell test on git 2.43 | Step 3 removes `core.fsmonitor`; `untrackedCache` stays in the shared file. |
| 3 | `starship.toml` in WSL has CRLF line endings | snapshot copy 2,379 B vs 2,260 B LF; hash equals the Windows file after LF normalisation | Step 3 overwrites with the LF golden file. Keep Windows and WSL starship files identical after LF normalisation. |
| 4 | starship format lists no `$python` or `$conda`, yet conda `changeps1` is off "because Starship shows the env" | `Installations` note and snapshot format string | Golden adds both segments (step 3). |
| 5 | `.tmux.conf`: splits lose the current directory, no `history-limit`, no `renumber-windows`, `escape-time` left at the tmux 3.4 default of 500 ms, no truecolor or passthrough settings, comments still say WezTerm | snapshot `.tmux.conf` | Golden `.tmux.conf` (step 3). Restart tmux afterwards. |
| 6 | gh-dash `repoPaths` points `NousResearch/hermes-agent` at `/mnt/d/Apps/Hermes/hermes-agent` (a Windows path) | snapshot `gh-dash/config.yml` | Golden has `repoPaths: {}`. Add Acer-only entries by hand afterwards, in the form `owner/repo: ~/projects/<group>/<repo>` with ext4 paths. Re-running step 3 resets the file (a backup is kept). |
| 7 | `.bashrc` JARVIS block: every hook unguarded (atuin env, starship, zoxide, direnv), `PATH` prepended again on every re-source, nvm loaded eagerly (slow startup), `~/.mcp.env` sourced into every interactive shell so its secrets reach every process | snapshot `.bashrc.jarvis_block` | Optional hardening, do it with a backup and without printing the file: guard each hook with `command -v <tool> >/dev/null &&`, prepend `~/.local/bin` only if absent, source `.mcp.env` only from the tools that need it. Test with `bash -n ~/.bashrc` and a new shell. |
| 8 | `atuin` file is the 16 KB default dump; `auto_sync` and `update_check` not explicit; no `history_filter` for API keys | snapshot | Golden atuin file (step 3). After that run `atuin history prune` once. |
| 9 | `lazygit` 0.65.1, `delta` 0.19.2, `sesh` 2.30.1, `atuin` 18.22.0, `gh` 2.45.0, `gh-dash` 4.25.2, `fzf` apt 0.44.1, `ripgrep` 14.1.0, `fd` 9.0.0, `bat` 0.24.0, `uv` 0.12.17, `claude` 2.1.277 | `VERSIONS.md` and `Installations` | Step 4 covers gh, fzf, rg, fd, bat, lazygit, sesh, gh-dash. Update delta, atuin, uv with their own installers; update claude with its own updater. |
| 10 | `chafa` 1.14.0 is too old for Yazi (needs 1.16+), direnv install was blocked by a sudo prompt in September | `Acer Live State` round 2 | `chafa --version`; if below 1.16, install the static release binary into `~/.local/bin`. `command -v direnv`; if missing: `sudo apt install -y direnv` (user runs it). |
| 11 | `.wslconfig` in the snapshot says 16GB / 8 CPUs with no swap line; notes say it was corrected to 20GB / 18 CPUs / swap on D: | `Ubuntu - WSL` note, 2026-10-12 correction | In Windows PowerShell: `Get-Content $env:USERPROFILE\.wslconfig`; in WSL: `free -h; nproc; cat /proc/swaps`. Report real values. Do not change it from inside WSL. |
| 12 | pnpm floated to 12.4.2 (Corepack unpinned) while the Dell is pinned on 10.33.2 | version matrix in [[WSL Toolkit Config Reference]] | DECIDED: 12.4.2 on both laptops. Step 4 pins it. Report `pnpm --version` (expect 12.4.2) and which shared repos have `packageManager` in `package.json`; adding `pnpm@12.4.2` there is a per-repo approval. |
| 13 | `tmux-handlr` ntfy topic never confirmed | `Acer Live State` round 2 | Check `~/.tmux/plugins/tmux-handlr` config for a topic; if none, tell the user (the topic is secret-like, keep it out of the vault). |
| 14 | `snapshot excluded-wsl.txt` has a junk first line ("Shell cwd was reset") | snapshot | Harmless. Ignore. |
| 15 | tmux 3.7c vs Dell 3.4 | `VERSIONS.md` | DECIDED: both on 3.8. The Dell is on 3.8 already (2026-10-14). Step 4 builds 3.8 on the Acer (close tmux first). Expect `tmux -V` = `tmux 3.8`. |

## Decisions waiting for the user (do not decide on your own)
- RESOLVED 2026-10-14 by the user: pnpm 12.4.2 on both (matches the Acer), tmux 3.8 on both (latest). Only the per-repo `packageManager` pin is left to approve.
- Whether the Acer WSL should also use `core.autocrlf=input` (recommended) or stay `false`.

## Results (the Acer session fills this in; patch this heading, keep it dated)
- Date and time:
- `wsl-check.sh` output:
- Step 3 summary line (`changed=... same=... fails=...`):
- Step 4 versions printed at the end:
- Items from the table that could not be done, with the exact error:
- Real `.wslconfig` values and `/proc/swaps`:
