---
type: note
status: sprout
created: 2026-09-16
updated: 2026-09-19
course: Life
track:
  - laptop
prerequisites:
  - "[[Installations]]"
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
related:
  - "[[Installations]]"
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Google Drive Sync Policy]]"
  - "[[Ubuntu - WSL]]"
  - "[[40_Resources/CS/Repos]]"
  - "[[Code Review & Eval Gap]]"
  - "[[Hermes Agent Framework — Corrected Framing]]"
  - "[[Claude Context (Zilliz)]]"
tags:
  - note
---
# Acer Live State — 2026-09-16

## Why this note exists

A detailed observational report (written for/by another session coordinating this exact setup) surfaced the actual current state of the Acer, several weeks into installs that hadn't been reconciled back into this folder's notes yet. This note captures that reconciliation so the "don't let installs drift ahead of documentation" failure ([[New Laptop Setup#New findings this pass (not in any existing note)]]) doesn't repeat here too.

## Confirmed real drive layout (supersedes the 310/690 estimate in [[Installations]])

- **C:** 315GB total, 212GB free (~103GB used)
- **D:** 636GB total, 577GB free (~59GB used)
- **G:** virtual Google Drive letter, 315GB/201GB free (~114GB actually synced locally)

## D:\ structure observed

`D:\_Anant` is the main PARA-style folder (`10_Areas`, `20_Progress`, `30_Resources`, Desktop, Downloads, Music, Pictures, Videos) — shown with Google Drive sync icons, meaning this is the real, working folder-redirection target, actively syncing. This matches the plan.

`D:\` root also has: `AI`, `Apps`, `Cache`, `DeliveryOptimization`, `Games`, `Program Files`, `WindowsApps`, `WpSystem`, `WSL`, `WUDownloadCache`.

**Explained, not a bug:** `Program Files`/`WindowsApps`/`WpSystem`/`DeliveryOptimization`/`WUDownloadCache` sitting at D:\ root (instead of nested in `D:\Cache`) is the direct, unavoidable result of Windows' "Change where new content is saved" setting, which only ever targets a drive's **root** — it has no subfolder option. `D:\Cache`'s prepared subfolders (GoogleDriveFS, npm-cache, etc.) are for things redirected individually via each tool's own setting/env var, not OS-level caches. Leave the root-level folders alone; stop trying to nest them.

**Not yet resolved:** Google Drive's own sync cache (DriveFS) is still on C: — no supported redirect exists. Check actual size and Drive's Mirror-vs-Stream setting before deciding whether to switch modes (safer) or symlink (riskier, can corrupt sync state).

## WSL discrepancy — needs `wsl -l -v`, not yet resolved

Signals observed (Settings app "Developer" tab already present, "Linux" node under This PC in File Explorer, `C:\Program Files (x86)\WSL` folder exists) are consistent with **the WSL optional feature being enabled with zero distros registered** — these specific artifacts appear from feature-enablement alone (e.g. a prior `wsl --install --no-distribution` or Store update), not proof a distro exists. `wsl -l -v` is the authoritative check, not yet run. If it shows no distros, proceed straight to distro registration on **D:** (`D:\WSL\Ubuntu`, per [[Installations]]'s reversed decision) — the engine step is likely already done, skip re-running it.

## C:\Users\anant — profile freshness unverified, real concern

The profile already contains dotfolders for `.claude`, `.codex`, `.config`, `.copilot`, `.cua-driver`, `.cursor`, `.docker`, `.gemini`, `.kiro`, `.ollama`, `.sbx-denybin`, `.vscode`, `.vscode-shared`, plus `.claude.json`, `.gitconfig`, and folders `ansel`, `Documents`, `OneDrive`, `Searches`, `workplace`. This is a different username (`anant`) than the Dell's (`Anant Gupta`), so it isn't the Dell/Acer mixup from 2026-09-13 — but it's far more tool config than "a few apps installed" would produce on its own.

**Two explanations, not yet distinguished:** (a) benign — every AI CLI listed was already individually, freshly installed on the Acer in sessions not yet reflected here, each tool creating its own directory exactly per the fresh-install-only policy ([[New Laptop Setup#AI platform global directories - fresh install only, never migrated or synced]]); or (b) a profile-migration/backup path (OOBE cloud restore, OneDrive, manual copy) brought over content it shouldn't have, violating that same policy. Needs the profile's `CreationTime` and each dotfolder's own timestamps to distinguish — see the audit script below.

## Other findings needing a decision or cleanup

- `C:\Data` (~667GB shown in Explorer) is reportedly a pre-D: mount artifact — needs verification it's a separate mounted volume (not counted against C:'s real 212GB free) rather than genuine C: usage.
- `C:\Program Files (x86)` has NVIDIA, PredatorSense, **Riot Vanguard** (Valorant anti-cheat — matches the Games use case, but Vanguard is a kernel driver with a history of virtualization/Hyper-V friction worth knowing about since WSL2 depends on the same virtualization stack), **Zoom**, **WinRAR**, Google, Microsoft Office, MSBuild, WSL.
- **Zoom appears in two different locations** — `Program Files (x86)\Zoom` (per-machine) here, vs. `%APPDATA%\Zoom\bin\` recorded in [[Installations]] from the 2026-09-13 winget install (per-user). Possible duplicate install — check both paths.
- **WinRAR is present** — [[Installations#Full software list — Windows side]] already decided to replace WinRAR with NanaZip. Flag for removal.
- OneDrive folder exists in the profile — verify it isn't doing Known Folder Move on Desktop/Documents/Pictures in parallel with the working `D:\_Anant` Google-Drive-based redirection (the exact dual-ownership conflict [[New Laptop Setup#Step 8 - Redirect the four user folders to D:]] warns against).

## Google Drive account identity — open question, material

The G: drive is reported syncing from a **different Google account** than the one used on the old Dell (which was `anantmahi721@gmail.com`, the account the [[Google Drive Sync Policy]] and the 2026-09-15 `10_Areas` migration work were both built around). Not yet confirmed which account this actually is. This matters directly: if G: is a different account, the whole `10_Areas`/`UMN @edu` reconciliation from 2026-09-15 may not even be the content landing on this laptop's local disk at all.

## Audit script (paste-back) — answers everything above in one pass

```powershell
Write-Output "=== WSL ==="
wsl --status
wsl -l -v

Write-Output "=== Disks/Volumes ==="
Get-Disk | Select-Object Number,FriendlyName,BusType,PartitionStyle,Size
Get-Volume | Where-Object DriveLetter | Select-Object DriveLetter,FileSystemLabel,@{n='SizeGB';e={[math]::Round($_.Size/1GB,1)}},@{n='FreeGB';e={[math]::Round($_.SizeRemaining/1GB,1)}}

Write-Output "=== C:\Data ==="
Get-Item "C:\Data" -ErrorAction SilentlyContinue | Select-Object FullName, Attributes
fsutil reparsepoint query "C:\Data" 2>$null
mountvol

Write-Output "=== D:\ root folder sizes ==="
Get-ChildItem D:\ -Directory -Force | ForEach-Object {
  $size = (Get-ChildItem $_.FullName -Recurse -File -Force -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
  [PSCustomObject]@{ Folder=$_.Name; SizeGB=[math]::Round($size/1GB,2) }
} | Sort-Object SizeGB -Descending

Write-Output "=== Profile C:\Users\anant ==="
(Get-Item "C:\Users\anant").CreationTime
Get-ChildItem "C:\Users\anant" -Force -ErrorAction SilentlyContinue |
  Select-Object Name, CreationTime, LastWriteTime | Sort-Object CreationTime | Format-Table -AutoSize

Write-Output "=== CLI tools on PATH ==="
foreach ($cmd in 'claude','cursor','codex','gemini','docker','ollama','kiro','code') {
  $p = Get-Command $cmd -ErrorAction SilentlyContinue
  if ($p) { Write-Output "$cmd -> $($p.Source)" } else { Write-Output "$cmd -> NOT found" }
}

Write-Output "=== OneDrive KFM ==="
Get-ItemProperty "HKCU:\Software\Microsoft\OneDrive\Accounts\*" -ErrorAction SilentlyContinue | Select-Object *Kfm*,UserFolder

Write-Output "=== Zoom install locations ==="
Test-Path "C:\Program Files (x86)\Zoom"
Test-Path "$env:APPDATA\Zoom"
```

## Evidence From This Vault

- [[Installations]] — drive-placement rules this note's findings get checked against
- [[New Laptop Setup]] — the pinned source of truth; the OneDrive/redirection conflict warning and the fresh-install-only AI platform policy now live there
- [[WSL New Laptop Master Plan — Verified 2026-09-11]] — Phase 2 WSL commands, now to run with D: once `wsl -l -v` confirms no existing distro
- [[Google Drive Sync Policy]] — the documents-only sync rule, confirmed followed for this laptop's Drive sync

## Open items

1. Run the audit script above, paste back results.
2. Confirm which Google account G: is syncing from.
3. Confirm whether the AI CLI tools already present were deliberately, individually installed already.

## Resolved 2026-09-16

Both open questions above answered: G: is confirmed **`anantmahi721@gmail.com`** (personal account) — the 2026-09-15 `10_Areas`/`UMN @edu` reconciliation work is directly relevant, and content placed in My Drive's root `10_Areas` will flow down to `D:\_Anant\10_Areas` automatically via the existing sync. The AI CLI dotfolders in `C:\Users\anant` are confirmed **deliberate, individual fresh installs** — not a migration/policy violation. Treat both as closed; only the audit script's other items (WSL registration, C:\Data, Zoom duplicate, OneDrive KFM) remain open.

## Audit results, round 1 (2026-09-16)

**C:\Data solved:** `mountvol` confirms `C:\Data` and `D:\` are mount points onto the *same* volume (`Volume{66219728-...}`). Not separate usage — a leftover redundant mount point from before D: got its own letter. Safe to remove with `mountvol C:\Data /D` (D:\ keeps working, nothing deleted).

**WSL solved:** `wsl -l -v` shows only `docker-desktop` (Docker's internal utility distro) — no real Linux distro exists yet. The Settings/Explorer artifacts were from Docker Desktop's own install, not a prior WSL setup. Clear to do a fresh Ubuntu install on D: with no conflict.

**Confirmed:** single physical NVMe disk (~1TB, GPT) — one-SSD branch applies. C: 315.73GB/212.4GB free, D: 636.62GB/576.8GB free — matches prior estimate closely.

**Still open:** D:\ root folder sizes, which CLI tools actually run, OneDrive KFM status, whether Zoom is duplicated in `Program Files (x86)` — round 1's commands for these got corrupted in transit (interactive paste breaking long lines mid-statement); round 2 uses a saved `.ps1` file instead of direct paste to avoid this.

## WSL execution log - 2026-09-18

WSL went from "platform installed, no distro" to a working Ubuntu-24.04 dev environment on `D:\WSL\Ubuntu` today. [[Ubuntu - WSL]] no longer carries the commands for any of this - only what's still pending - so this is where the full run, every bug hit, and the tool-selection debate live instead.

### What ran and is confirmed working

Platform install, `Ubuntu-24.04` on `D:` via `wsl --install --location`, `/etc/wsl.conf` (`anant_gupta` default user, `systemd=true`), `.wslconfig` (`memory=20GB`, `processors=18`, confirmed via `free -h`/`nproc`), base packages (`git` 2.43.0, `git-lfs` 3.4.1, `ripgrep` 14.1.0, `fd-find`/`bat`/`fzf`/`jq`, `gh` 2.45.0 from Ubuntu's own default repo), `gh auth login` + `gh auth setup-git`, git identity (`anantmahi721@gmail.com`), Node 24.21.0 via nvm, npm 11.19.0, pnpm 12.4.2 via Corepack, uv 0.12.17, Rust 1.98.1 via rustup, Starship binary (config copy failed, see below), Kiro CLI (`kiro-cli` 2.22.0), Codex CLI (`codex-cli` 0.155.1), Claude Code (2.1.277), Antigravity CLI (`agy` 1.2.6), `~/projects/{ai,hub,hackathon,scratch,work}` + `~/tools`, and the consolidated `.bashrc` block (`JARVIS_WSL_ENV_BLOCK` marker, ran clean on first paste). Cursor CLI was deliberately skipped - Cursor stays the Windows-native IDE per [[Installations]]. VHDX size after all of this: ~7GB (`D:\WSL\Ubuntu\ext4.vhdx`), unremarkable.

### What broke, and why

- **`.wslconfig` memory, twice.** First attempt (`memory=20.434928894043`, no unit) was rejected outright. The retry appended `GB` but was written via `Set-Content -Encoding asci` - not a valid PowerShell encoding name - so that write silently failed and the original broken file stayed in place; the next `free -h` still showed the exact same error text as before, which is what made it look like the "fix" hadn't worked at all. Real fix: whole-number `memory=20GB`, and always `Get-Content` right back after any `Set-Content` to a config file, before trusting it.
- **GitHub CLI apt repo, corrupted in transit.** `curl | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg` lost its destination argument somewhere in the copy/paste path and printed raw GPG bytes to the terminal instead of writing a file; the following `echo "deb [arch=... stable main"` picked up real embedded line breaks and got split across three physical lines by the shell's own `>` continuation prompt, writing a syntactically broken single-line source file. Net effect: `/etc/apt/sources.list.d/github-cli.list` existed but was malformed, and **every** subsequent `apt` command failed with `Malformed entry 1 in list file ... ([option] unparsable)` - including ones with nothing to do with `gh` - until that leftover file was explicitly `rm -f`'d. Simply not re-running the bad command wasn't enough; the file it had already written needed cleanup. Real fix, adopted going forward: don't use GitHub's separate apt repo at all - Ubuntu 24.04's own default repo already ships `gh` 2.45.0, which removes the whole fragile multi-step repo-setup entirely.
- **`gh auth login --web` couldn't open a browser.** WSL ships no browser opener by default (`exec: "xdg-open,x-www-browser,www-browser,wslview": executable file not found`). Worked anyway via manually pasting the printed URL into a Windows browser; `wslu` (gives WSL a real `wslview`/`xdg-open` that hands off to the Windows default browser) is queued in [[Ubuntu - WSL]] as a still-pending fix for every future OAuth-flavored login.
- **`credential.helper` looked empty even though auth worked.** `gh auth setup-git` scopes the credential helper per host (`credential.https://github.com.helper`), not the global `credential.helper` key - the verification command in the original guide was checking the wrong key, not describing a real problem. Corrected in [[Ubuntu - WSL]].
- **Starship config copy ran in the wrong shell.** `cp "/mnt/c/Users/anant/.config/starship.toml" ~/.config/starship.toml` got pasted straight into an open PowerShell prompt instead of a WSL one - PowerShell's `cp` read `/mnt/c/...` as a relative Windows path from the current directory, producing `C:\mnt\c\Users\...` (doesn't exist) instead of crossing into WSL. Same root cause hit the completion-gate check later (`command -v git && git --version` in PowerShell → `The token '&&' is not a valid statement separator`) and the Yazi config-copy `||` line (`The token '||' is not a valid statement separator`). All three are the identical mistake: a bash-only command surviving into an open PowerShell session because the previous command happened to work there. Fixed going forward by making every shell switch an explicit `wsl ~` line, not an assumption.
- **Yazi's `cargo install yazi-cli` fails outright, by design.** `error: failed to run custom build command for yazi-cli ... Due to Cargo's limitations, the yazi-fm and yazi-cli crates on crates.io must be built with cargo install --force yazi-build`. This is a real, documented upstream constraint of how Yazi's workspace is published to crates.io, not a transient failure. [[Ubuntu - WSL]] now installs Yazi from its GitHub release binary instead (resolved via `jq`, avoiding any build step).
- **Kiro and Antigravity's real binary names don't match their install URLs.** `curl -fsSL https://cli.kiro.dev/install | bash` installs `kiro-cli`, not `kiro`. `curl -fsSL https://antigravity.google/cli/install.sh | bash` installs `agy`, not `antigravity`. Both were silently "not found" until checked with the real names.
- **WSL2's swap file stays on C: even after the distro moves to D:.** `swapfile` is a separate `.wslconfig` setting (`[wsl2]` section) that defaults to `%TEMP%\swap.vhdx`, confirmed against [Microsoft's own reference](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) - relocating `ext4.vhdx` to `D:` never touches it. This is the mechanism most likely behind "WSL quietly filling C: with 35GB+" from before this laptop's rebuild even started; `swapfile=D:\\WSL\\swap.vhdx` is queued as the still-pending Phase 1 fix in [[Ubuntu - WSL]]. The same independence will apply to Docker Desktop's own WSL disk image once Docker is installed - it needs its own separate redirect in Docker Desktop's settings, not something `.wslconfig` covers.

### Tool selection: from 3, to 5, back to 3 - the full debate

First pass (this session, before the corrections above landed) picked `zellij` + `lazygit` + `ncdu` against a field of 15 candidates. On review, asked to widen to 50+ and ground the picks in the actual repo/ingestion plans in [[40_Resources/CS/Repos]] and `60_Claude/20_Distilled_Notes/Sources - Plan/` rather than a generic "nice WSL setup" list. Widened field, this pass: zoxide, direnv, mise, tmux, btop, atuin, watchexec, hyperfine, delta, chezmoi, `just`, xh, duf, entr, k9s, distrobox, tldr, gum, dive, Socket.dev/OSV-Scanner, Semgrep, gbrain, gstack, Graphify, claude-context, memsearch, PageIndex, obsidian-mind, a WSL-side Ollama, plus every repo named directly in the source notes (ECC, mattpocock-skills, spec-kit, bumblebee, promptfoo, CPR).

**Final list, three tools:**
- **`tmux`, replacing `zellij`.** Re-litigated on purpose rather than defended reflexively. `zellij` genuinely has better first-run UX (visible keybind hints, no config needed day one) - that's real and not disputed. What decided it the other way: the actual planned future here is running several AI CLI agent sessions (Claude Code, Codex, and whatever gets added next) in parallel panes and reattaching after a `wsl --shutdown` or laptop sleep, and the wider ecosystem of scripts/tooling for exactly that pattern is written against `tmux` far more often than `zellij`. `tmux-resurrect` + `tmux-continuum` also have years of production use specifically for surviving a full session teardown and restore, which `zellij`'s session-persistence story hasn't matched yet. Ecosystem fit for the stated future use case beat first-run polish.
- **`ncdu`** - unchanged from the first pass, directly requested again explicitly.
- **`semgrep`**, new. Not actually a new idea - [[Code Review & Eval Gap]] already decided this back in July as the free, permanent, per-repo static-analysis backstop (real bugs: logic errors, injection, secrets, race conditions), confirmed still uninstalled. This is the vault's own already-settled answer to "something for reviewing codebases," not a fresh pick.

**Deferred, not installed today, but confirmed wanted:** `lazygit` (TUI git client across a dozen-plus actively-tracked repos) and Graphify (structural/relational vault+code graph, already decided in [[40_Resources/CS/Repos]] and [[Graphify]] as a Claude Code skill, not a raw WSL package) - both explicitly "will install for sure," just not this pass.

**Deliberately out of scope for a WSL/terminal-tooling install list, and why:**
- **gbrain + gstack** - the vault's own already-decided memory stack ([[00_Execution]]'s Github pass: "adopt gstack + gbrain together... one coherent memory stack"), confirmed installed-and-tested once already (`bun install`, `gbrain init --pglite`, 80/100 doctor health). These are Claude Code plugin/skill installs (bun-based), not generic WSL apt/cargo packages - they belong in a dedicated Claude Code plugin session, not this WSL environment note. `bun` itself would be the concrete WSL-level prerequisite if/when that session happens.
- **claude-context** (Zilliz, semantic code search) - already run once for real against Anant's own Zilliz Cloud cluster (108 files, 1369 chunks indexed, per [[Claude Context (Zilliz)]]), but explicitly project-scoped to BOOM and blocked on a Milvus/Docker dependency that isn't installed on this laptop yet. Revisit once Docker Desktop lands.
- **`rtk`** - could not verify this as an existing, published tool under that name matching "strip filler from terminal/AI output to cut token cost." Not fabricated an install command for it; need the actual source (repo link, package name) before this can go in as a real install.

### Clarifications requested this session

- **The `ssh-keygen -t ed25519` command that ran and asked for a passphrase** generated a brand-new, currently-unused ed25519 key pair at `~/.ssh/id_ed25519`/`.pub` (no passphrase set - blank input at both prompts). It is not wired into GitHub, not a "SSH desktop," and does nothing on its own - git/GitHub auth in this setup runs entirely over HTTPS via `gh`'s own credential helper (`gh auth setup-git`), which is why the key was never necessary in the first place. The ASCII-art "randomart image" `ssh-keygen` printed is just its own built-in visual fingerprint confirmation, standard for every key it generates, not something specific to this setup. Safe to leave sitting unused, or add it to GitHub later with `gh ssh-key add ~/.ssh/id_ed25519.pub` if a real non-HTTPS need ever shows up.
- **`zoxide`** is a faster `cd` (tracks directory visit frequency/recency, jumps by fuzzy partial name) - it has no relationship to local models, the D: drive, or Ollama at all; it was proposed purely as project-navigation convenience across `~/projects/*` and nothing more. Deprioritized this pass per direct feedback that it doesn't serve the actual local-model use case - correct read, since it never did.
- **Can WSL still use Ollama? Yes, but a second WSL-native install isn't recommended here.** Ollama already has an official native Linux install path that works inside WSL2 with real NVIDIA GPU passthrough. The reason not to run a second instance: Ollama is already planned Windows-side ([[Installations]], models redirected to `D:`), and WSL already reaches it over `http://127.0.0.1:11434` through the same built-in NAT localhost forwarding already relied on for Jarvis's MCP servers - a second WSL-side install would duplicate multi-GB model files on disk for no real benefit. Revisit only if a specific reason to want GPU-passthrough-from-WSL-directly shows up.
- **Jan** is a Windows-native GUI app (Tauri + LlamaCPP, similar install-location constraints to Claude Desktop) - a decision for [[Installations]]'s Windows software queue, not a WSL package at all.
- **Kronos** is a financial-markets foundation model (Python/PyTorch, HuggingFace-style), already scoped in [[40_Resources/CS/Repos]] as TradingView-project material - it becomes a dependency inside that project's own `uv`-managed `.venv` once the TradingView build reaches it, not a general WSL install.
- **"Hermes" is not one thing, and none of its senses are an installable local model on their own.** Three unrelated uses of the name exist in this vault already: (1) NousResearch's `hermes-agent` GitHub repo - a coding agent (like an alternative to Claude Code), not evaluated yet; (2) zachdoesai's "Hermes Agent Framework" - not software at all, just branding for a generic agent-pattern, already resolved in [[Hermes Agent Framework — Corrected Framing]] as "no new build needed, the pattern already runs here unlabeled"; (3) Nous Research also publishes Hermes-family open-weight *model checkpoints* (e.g. a Hermes 3/4 GGUF), which is likely what "local models through ollama, hermes and jan" actually meant - if so, that's simply `ollama pull <hermes-model-tag>` once Ollama itself exists, not a separate tool to install.

## Status summary - 2026-09-18

Closing out this note's own earlier open items with what's now actually known, and separating genuinely-still-open from resolved-elsewhere.

**Resolved since round 1's "still open" list (further up this note):** which CLI tools actually run - fully answered by the WSL execution log above (`kiro-cli`, `codex`, `claude`, `agy`, plus `git`/`gh`/node stack/`tmux`/`ncdu`/`semgrep`, all confirmed via their own `--version`). Windows Day 1 (partitioning, hibernation, folder redirection, git identity, npm cache) is done and now recorded as history in [[New Laptop Setup#Day 1 - Windows, what actually happened]] rather than left implicit. Google Drive sync is confirmed complete and correct: personal account, `10_Areas`/`UMN @edu` content flowing through to `D:\_Anant` as designed, no further action needed there.

**Still genuinely open, not touched this session:** D:\ root folder sizes (never re-run after round 1's corrupted paste), OneDrive Known Folder Move status (never checked whether it's silently fighting the `D:\_Anant` redirection), and whether Zoom is actually duplicated between `Program Files (x86)\Zoom` and the per-user AppData install. None of these are WSL-related, so they didn't surface in this session's work - worth a dedicated short PowerShell pass using the audit script earlier in this note, saved to a `.ps1` file first per that script's own lesson about paste corruption.

**New machine-wide open items surfaced by this session's WSL work:** the WSL-native `~/.mcp.json` (blocked on Jarvis/Obsidian migrating here), Yazi's own config (no source found on either Windows-side path checked), and Docker Desktop (not installed - when it is, its WSL disk image needs the same kind of explicit D: redirect the swap file needed, not an assumption that "WSL is on D:" already covers it).

Overall: the Acer is now a fully working daily driver for AI development inside WSL. What's left is Jarvis migration (unblocks MCP), Docker, VS Code's Day 2+ build-out, and the small housekeeping items above - none of it blocking, all of it tracked in [[New Laptop Setup]] as the current pinned index.

## WSL configuration round 2 - 2026-09-19

Three follow-up sessions after the initial WSL build (all run against a real, working environment, findings cross-checked against official docs each time): tune the five originally-installed tools, decide and install a second batch of tools, then fix what the install pass found broken. Recorded here in full since none of it made it into the vault as it happened.

### Tuning pass on the original five (Starship, tmux, Yazi, ncdu, semgrep)

Applied and confirmed working: Starship gained a `[status]` table (exit code, previously invisible), `[cmd_duration]`, and `$shlvl`/`$jobs` - plus a real bug caught during testing, not predicted in advance: the default 30ms `scan_timeout` was timing out against the Hermes repo over the slower 9P-adjacent mount, bumped to 500ms, confirmed fixed. `tmux` gained `pane-border-status top`, `base-index 1`/`pane-base-index 1`, a prefix change from the tmux default (`Ctrl-b`) to `Ctrl-a` with splits rebound to `|`/`-` - deliberately matching WezTerm's own real defaults (confirmed directly against [wezterm.org/config/default-keys.html](https://wezterm.org/config/default-keys.html), not assumed), `win32yank` for real Windows-clipboard round-trips through tmux copy-mode (verified twice), and `tmux-fzf`. Yazi got a real config built from nothing (`yazi.toml`/`keymap.toml`/`theme.toml`, the `yazi-rs/plugins:git` status-column plugin, `full-border.yazi`, `smart-filter.yazi`, Tokyo Night Storm flavor to match Starship) - a real Yazi-version bug was caught and fixed along the way (this Yazi build rejects a `$schema` key some example configs include). `ncdu` got a config file (`-e`, `--color dark`, `.git`/`node_modules` excludes, `--confirm-quit`). `semgrep` needed no global change - confirmed nothing was misconfigured; its per-repo discipline (`.semgrepignore` with `:include .gitignore`, matching local/CI rulesets) is documented for whenever it's actually wired into a repo's CI, not done yet.

`git` gained `delta` (0.19.2 via `cargo`, newer than apt's 0.16.5) as `core.pager`, confirmed rendering real side-by-side diffs.

### New tools decided and installed: lazygit + seven more, each debated against real competitors

**`lazygit`** - installed, configured to use `delta`, confirmed working against a real repo with real uncommitted changes, bound into tmux as a popup (`prefix+g`).

The rest were debated against real alternatives rather than picked on name recognition, findings below each:
- **`sesh`**, not `tmux-sessionizer` - `t-smart-tmux-session-manager` (the tool `tmux-sessionizer` competes with) is now explicitly superseded by its own author's Go rewrite, `sesh`, which natively integrates with `zoxide`'s visited-directory ranking instead of maintaining a separate project list.
- **`zoxide`** - unambiguous pick; `autojump` and `fasd` are both archived/unmaintained, `zoxide` is the current standard.
- **`atuin`**, not `mcfly` - handles multi-line commands correctly where `mcfly` splits them, and its optional encrypted cross-machine sync matches the in-progress [[Cross-Laptop Sync - Build Roadmap]] (not enabled - explicitly kept local-only, sync is that roadmap's decision, not this one's).
- **`direnv`** - the only real option given `nvm`+`uv` are already the settled version managers; `mise`'s own env-loading is explicitly unsupported alongside `direnv` upstream, so adopting `mise` here would mean re-opening an already-closed decision, not adding a complementary tool.
- **`gh-dash`**, over the less-mature `gitpane` - multi-repo PR/issue dashboard built directly on the already-authenticated `gh` CLI.
- **`tmux-handlr`**, investigated against the already-installed `samleeney/tmux-agent-status` rather than blindly swapped in. Confirmed via `git remote` which of the two same-named "tmux-agent-status" repos was actually installed (`samleeney`'s, not `accessd`'s - both exist under similar names, a real naming collision worth remembering). Compared for real: `samleeney/tmux-agent-status` - 281 stars, 14 months old, active; `CRThaze/tmux-handlr` - 0 stars, 12 days old, but genuinely active commit history and the one real differentiator neither plugin's competitor has: push notifications (via ntfy) when an agent finishes or needs input while away from the terminal - directly answering the open question the very first tuning-pass session ended on. Installed alongside the existing plugin, not as a replacement - confirmed clean load, no conflicts. Flagged honestly as a bet on a young, single-maintainer project: revisit in a month, drop it if development goes quiet.

Install+inspect confirmed all seven work as installed: `zoxide` (0.10.0, real directory jumps tested), `sesh` (`sesh list` confirmed pulling zoxide's real tracked directories, live integration not just parallel installs), `atuin` (real 230-line bash history imported, a real past command found by search, confirmed local-only/no account created - and a real gotcha caught: its own installer already appends its PATH/eval lines to `.bashrc` outside the `JARVIS_WSL_ENV_BLOCK` marker, so only `zoxide`'s hook needed adding manually, avoiding a double-sourced `eval`), `gh-dash` (needs a real TTY, confirmed working against a real open PR).

### What the install pass found broken, and the fix

- **`chafa` installed via apt (1.14.0) is not sufficient** - Yazi requires >=1.16.0 before it will use chafa as an image-preview fallback at all, confirmed by testing (chafa itself renders real ANSI art from a real PNG standalone; Yazi's preview pane still shows nothing, zero image bytes emitted, matching the exact version-gate Yazi's own docs describe). Root cause fully pinned down, not just suspected. Deeper research beyond the version issue: WSL's Sixel support inside Windows Terminal is genuinely imperfect at the ConPTY level (confirmed via [sxyazi/yazi discussion #2140](https://github.com/sxyazi/yazi/discussions/2140)) - the only way to get *true* (non-fallback) image rendering would be switching terminal emulators, which conflicts with the already-settled "appearance is done, don't touch the terminal" decision. `chafa` via a newer static binary (hpjansson.org's official static releases, not the apt package or the one available PPA, which only reaches 1.14.5) is therefore the correct fix, not a compromise - Überzug++, the other fallback, needs a real X11/Wayland display server a ConPTY-hosted terminal doesn't have at all.
- **`direnv` never actually installed**, twice - `sudo apt install -y direnv` needs a password the sandboxed session had no way to enter, both times. Correctly not worked around by adding a `direnv hook` line for a binary that doesn't exist (would have broken every future shell start with `direnv: command not found`).

> [!IMPORTANT] Fix-pass queued, not yet confirmed complete
> A follow-up prompt was written to fix all of the above - upgrade `chafa` via the real static-binary release, retry `direnv`, add `atuin`'s recommended `filter_mode`/`filter_mode_shell_up_key_binding` split, build a real (non-automating) `sesh.toml`, wire `gh-dash`'s `repoPaths` to the real local-repo-to-remote mapping (discovered live via `git remote -v` across `~/projects`, not guessed) plus `pager.diff: delta`, and wire `tmux-handlr`'s ntfy push notification with a real random topic name. **No confirmation has come back that this actually ran.** Treat every item in this paragraph as pending until independently verified - don't assume it's done just because it was asked for.

### Full real state after this round

Confirmed installed and working: `git`, `git-lfs`, `ripgrep`, `fd`/`bat` (symlinked), `fzf`, `jq`, `gh` (2.45.0), `wslu`, `nvm`+Node (24.21.0), `pnpm` (12.4.2), `uv` (0.12.17), `rustup`/`cargo`, `kiro-cli` (2.22.0), `codex`, `claude` (2.1.277), `agy`/Antigravity (1.2.6), `starship` (1.26.0, tuned), `yazi` (26.9.1, full config), `tmux` (3.4, full config), `win32yank`, `ncdu` (configured), `semgrep` (1.177.0), `delta` (0.19.2), `lazygit` (configured), `zoxide` (0.10.0), `sesh` (installed, config pending), `atuin` (installed, history imported, tuning pending), `gh-dash` (installed, config pending), `tmux-agent-status` (`samleeney`, vetted), `tmux-handlr` (installed, ntfy pending). Not installed: `direnv` (blocked), Docker Desktop, Cursor CLI (deliberately). `chafa` installed but at an insufficient version (1.14.0, needs >=1.16.0).
