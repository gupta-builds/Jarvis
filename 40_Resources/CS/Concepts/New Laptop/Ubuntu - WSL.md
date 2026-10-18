---
type: concept
status: sprout
created: 2026-01-17
updated: 2026-10-17
course: Life
track:
  - laptop
mastery_level: 3
prerequisites: []
used_in:
  - "[[New Laptop Setup]]"
evidence: []
tags:
  - concept
related:
  - "[[40_Resources/CS/Links|Links]]"
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Acer Live State — 2026-09-16]]"
  - "[[Installations]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[Code Review & Eval Gap]]"
  - "[[40_Resources/CS/Repos]]"
---
# Ubuntu - WSL
> [!IMPORTANT]
> WSL setup on the Acer finished 2026-09-18, and the terminal environment was tuned in depth over 2026-09-18 to 2026-09-19 - this note is now a status record and the conceptual VHDX mental model, not a runbook. For the commands that got here, see [[Acer Live State — 2026-09-16#WSL execution log — 2026-09-18]] and [[Acer Live State — 2026-09-16#WSL configuration round 2 - 2026-09-19]]. For what to run periodically going forward, see [[WSL New Laptop Master Plan — Verified 2026-09-11#Maintenance Cadence]].

## One-Line Answer
==WSL2 is a real virtual machine with a real virtual disk, not "Linux in a window" — the whole Linux filesystem lives inside one Windows file, `ext4.vhdx`, and most WSL storage and "wrong version" mysteries trace back to forgetting that.==
## Mechanism
*The VHDX is the whole disk, not a folder:* every file under `/`, including `/home/anant_gupta`, lives inside `D:\WSL\Ubuntu\ext4.vhdx`. Windows sees one opaque binary; Linux sees a disk. View it from Windows Explorer through the bridge: `\\wsl$\Ubuntu\home\anant_gupta\projects` (plain `\\wsl$` shows the whole Linux environment).
*Three worlds, one rule:* Windows programs (Docker Desktop, browsers, Obsidian) run in World 1 on `C:`/`D:`. WSL Linux programs (node, uv, git, claude) run in World 2 inside the VHDX — native, fast. Windows files read from Linux (`/mnt/c`, `/mnt/d`) are World 3, a 9P network bridge that is 5–20x slower for anything touching many small files. Build and run code in World 2; only read Windows-side data (the Obsidian vault, model weights) through World 3.
*Run command:* `wsl.exe --cd '~'` opens the Linux user's home directory from PowerShell without expanding `~` to the Windows home. On the Acer, the PowerShell compatibility function added on 2026-10-13 also restores bare `wsl ~`. Plain `wsl` normally inherits the calling directory when it can translate that directory; its starting directory does not depend on where the VHDX is stored.
## Contrast / What It Is Not
WSL2 is not WSL1, which ran a translation layer instead of a real Linux kernel and had no VHDX — performance characteristics and file-access patterns are different between the two. It is also not a Windows folder you can sync with Google Drive or OneDrive: those tools back up files, and to them the VHDX is one binary blob, not a tree they can see inside.
## Failure Modes / Misconceptions
> [!WARNING]
> Believing `rm -rf` on a large directory shrinks the `.vhdx` on Windows. It does not — ext4 frees the blocks inside the disk image, but the image's high-water mark on `D:` stays the same until you `fstrim` inside Linux and then compact (`Optimize-VHD`/`diskpart`) from Windows, or run with `sparseVhd=true` so it self-compacts.
> [!WARNING]
> Cloning a working repo into `/mnt/c` or `/mnt/d` because it feels more visible from Windows. Every file operation crosses the 9P bridge and the toolchain feels broken — the fix is moving the repo to the Linux side, not debugging the editor.
## Evidence From This Vault
- [[New Laptop Setup]] — the procedure that depends on this mental model holding
- [[WSL New Laptop Master Plan — Verified 2026-09-11]] - the drive-letter-agnostic original version of this runbook; kept for its audit trail and decision history
- [[Acer Live State — 2026-09-16]] - the live audit this guide's hardcoded values come from, and the full execution log (what ran, what failed, the full tool debate) for everything this note no longer repeats
- [[Installations]] - the drive-placement rules (WSL/Docker on D:, forced-C: app list) this guide follows
- [[Jarvis MCP and REST API Setup]] - the MCP server definitions this guide's pending `~/.mcp.json` step reuses

> [!NOTE]
> **2026-10-12 correction:** between 2026-09-19 (when the paragraph below was written) and 2026-10-12, `.wslconfig` had drifted to `memory=16GB, processors=8` with no `swapfile=` line at all — found during a Windows home-directory audit, alongside a leftover `.wslconfig.bad` holding the original `memory=20GB, processors=18, swapfile=D:\WSL\swap.vhdx, swap=8GB` plus `dnsTunneling=false`, `autoProxy=false`, `sparseVhd=true`, `autoMemoryReclaim=gradual`. Live WSL (`free -h`, `nproc`, `/proc/swaps`) matched the drifted 16GB/8-core file, but the swap device was still on `D:\WSL\swap.vhdx` anyway — only still true because WSL hadn't had a cold restart since the swap redirect was last active; the next `wsl --shutdown` would have silently dropped swap back to C:. Restored `.wslconfig` to the original 20GB/18-core/swap-on-D: values (plus `firewall=true`, which the drifted file had and `.bad` didn't) so this paragraph is accurate again. Takes effect on the next `wsl --shutdown` plus restart, not applied to the currently-running VM.

## Acer audit and launch correction - 2026-10-13
This audit ran on the Acer Predator PHN16S-71, Windows user `anant`, Linux user `anant_gupta`. Only the active Windows PowerShell 7 profile was changed. Everything below labelled proposed remains unimplemented. The dated state below supersedes the September baseline where they differ.
### Why `wsl ~` failed and what changed
PowerShell 7.6.6 resolved `wsl` directly to `C:\Windows\System32\wsl.exe`; no alias or wrapper caused the failure. Native argument handling expanded bare `~` to `C:\Users\anant`. WSL then treated that Windows path as a Linux command, and Bash removed its unquoted backslashes, producing `/bin/bash: line 1: C:Usersanant: command not found` and exit 127. The same failure reproduced before any change. Microsoft's [PowerShell parsing documentation](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parsing?view=powershell-7.6#tilde-) describes native tilde expansion.
The fix is one `WSL_HOME_COMPAT` block in `D:\_Anant\20_Progress\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`, lines 25 to 45. Its `wsl` function translates a leading literal `~` into a directly quoted `--cd '~'` invocation of Microsoft's executable and forwards other arguments. It preserves piped input and publishes the native exit code through `$LASTEXITCODE`. The original profile bytes remain intact before the appended block. Backup: `Microsoft.PowerShell_profile.ps1.bak-wsl-home-20261013-182143` beside the profile.
Fresh profile-loaded checks passed: `wsl ~ --exec pwd` printed `/home/anant_gupta`; piping `pwd` and `exit` into exact `wsl ~` printed the same directory and exited 0; piped text through `wsl --exec cat` survived; explicit `/tmp` selection and `-d Ubuntu-24.04` worked; `/bin/false` propagated exit 1. The automated terminal could not allocate an interactive PTY, so interactive screen rendering was not verified. Open a new PowerShell tab, or run `. $PROFILE`, to load the fix in an existing tab. A profile-free invocation can use `wsl.exe --cd '~'` directly.
### Measured platform and working layers
| Layer | Live result |
|---|---|
| WSL | 2.7.14.0, kernel 6.18.33.2; Ubuntu-24.04 is the default WSL 2 distro, Ubuntu 24.04.5 LTS |
| Distro configuration | `/etc/wsl.conf`: systemd enabled, default user correct, Windows interop and appended Windows PATH enabled |
| Systemd | `running`; zero failed system or user units |
| Memory and CPUs | Runtime: about 15.6 GiB cap, 8 CPUs, 4 GiB swap. Saved `.wslconfig`: 20GB, 18 CPUs, 8GB swap at `D:\WSL\swap.vhdx`. The October 12 change has not reached the running VM. |
| Networking | Runtime mode `mirrored`; GitHub DNS lookup and HTTPS returned successfully. Windows Obsidian ports 27123 and 27124 accept TCP connections. |
| GitHub and Windows bridge | `gh auth status` passed without exposing credentials; `wslview --version` passed |
| Docker | Desktop integration works; client/server 29.8.0. Host data VHDX is about 11.4 GiB on D:, plus about 1.1 GiB for the Desktop distro. One container appeared in the current context; Docker disk accounting reported 6 images, 4 active containers and 3 active volumes. These counts describe different views and should not be collapsed into one inventory. |
| GPU | WSL sees the NVIDIA RTX 5070 Ti Laptop GPU, driver 616.92 and 12,227 MiB VRAM. This is GPU visibility, not a framework training test. |
| Development | Node 24.21.0, npm 11.19.0, pnpm 12.11.2, uv 0.12.17, Git 2.43.0, gh 2.45.0, tmux 3.7c, Starship 1.26.0, Yazi 26.9.1 |
| September pending items now present | chafa 1.18.2, direnv 2.32.1, Miniconda 26.7.1 with `jupyter-base`, Docker and user-scope MCP configuration. `gh dash` is an installed gh extension, not a standalone `gh-dash` binary. |
| MCP configuration | Claude user scope lists jarvis, jarvis-fs and the-plan; Codex lists github, jarvis and jarvis-fs. Missing `~/.mcp.json` is intentional under [[VS Code - WSL]], not an installation failure. TCP reachability and configuration presence do not prove every authenticated MCP operation works today. |
### Problems, growth and proposed follow-up
1. **Repair upkeep before the next scheduled clean.** The existing Sunday 03:00 `weekly-cache-cleanup.timer` calls `~/tools/weekly-cache-cleanup.sh`, which deletes `~/.cache/node`. That directory contains Corepack state. [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] records the same deletion causing pnpm to jump versions on the Dell. The Acer's October 11 log confirms the deletion, and pnpm is now 12.11.2 versus the September record's 12.4.2; the log does not prove this was the sole cause of the version change. That run logged neither the uv nor npm cleanup branches, consistent with missing tool paths in the service environment. Proposed: protect Corepack state, make tool resolution explicit, review cache cleanup in dry-run mode and choose the shared pnpm major before pinning it. No timer or script was changed.
2. **The Linux disk has a small logical capacity.** `lsblk` reports a 40 GiB Ubuntu block device; `df` reports 38.3 GiB filesystem capacity, about 25.4 GiB used and 10.9 GiB available, 70% used. D: has about 515 GiB free, but that space does not enlarge the Linux filesystem automatically. Ubuntu's host VHDX file is about 28.9 GiB. Proposed: review an offline, backed-up resize before larger toolchains or local workloads. Compaction would shrink host allocation, not fix the logical capacity.
3. **Largest storage candidates:** uv cache about 7.5 GiB, including about 6.7 GiB `archive-v0` and 830 MiB in two temporary directories; VS Code Server about 4.1 GiB, including about 779 MiB downloaded VSIX cache and 2.5 GiB installed extensions; Miniconda about 3.8 GiB; Codex state about 2.1 GiB; Rust toolchains about 1.5 GiB. `~/projects` is only about 252 MiB. Proposed: investigate active uv jobs before tool-native cleanup, then review regenerable VSIX cache. Keep environments, agent history, extensions and active server files unless individually approved. No cleanup ran.
4. **Reconcile `.wslconfig` before a planned cold restart.** Saved resource settings are not yet active. `sparseVhd` and `autoMemoryReclaim` are currently under `[wsl2]`, whereas Microsoft's [configuration reference](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#experimental-settings) assigns them to `[experimental]`. Their intended behavior should not be assumed. `sparseVhd=true` applies to newly created VHDs, not automatic conversion of this existing one. Proposed: review section placement, DNS policy and resource limits together, then restart outside active Docker/editor work and remeasure. No restart occurred.
5. **DNS-check noise remains.** The accessible current-boot journal contained 862 `CheckConnection` lines in the 24-hour query window and 86 in a later one-hour window, including `getaddrinfo() failed: -5`. GitHub DNS and HTTPS passed at probe time. Runtime resolver 10.255.255.254 is consistent with DNS tunnelling still active, while the saved file says `dnsTunneling=false`. Proposed: investigate the failed lookup and VPN interaction before changing mirrored networking. The accessible current-boot scan found zero matches for ext4 errors, I/O errors, OOM kills or kernel panic; this is not a full offline filesystem check.
6. **Toolkit parity is still incomplete.** No live `~/.config/toolkit` or golden bash include was found. Starship still has 119 CRLF lines, though its LF-normalised contents equal Windows. Tmux has current-directory splits but lacks explicit history-limit, renumber-windows, escape-time and allow-passthrough settings. gh-dash still contains the Windows Hermes repo path. Git has `autocrlf=false` and `fsmonitor=true`; Build 2's push/prune/rerere keys are absent. Bash has no `command -v` guards in its existing block and sources `.mcp.env`; that file is mode 600. ruff, shellcheck and shfmt were missing. Proposed: review [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] against this baseline; do not apply its entire fix list blindly. Chafa and direnv are already done, and pnpm policy still needs a decision.
7. **Backup and two-laptop closure remain unproven.** No tar/tar.gz/VHD backup appeared under D:\WSL within the three-level search; this does not prove no backup exists elsewhere. Four Git roots were found under `~/projects` at depth four, including local second-brain and internship clones. [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]] makes Dell WSL canonical and Acer Windows the Remote-SSH client. Clone retirement needs a separate dirty/worktree inventory; no repo was changed. Independent Dell host-key verification, transfer measurement and the final cross-machine acceptance pass remain open in [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]].
The Acer has a working platform, editor/toolchains, GPU bridge, Docker and configured MCP clients. It has not completed the shared golden toolkit or the final two-laptop acceptance pass. [[VS Code - WSL]] captures the September 26-27 progress that the older September 19 summaries missed. Dell Builds 1-5 and the Acer handoff are separate records; Dell-only fixes and capacities must not be copied onto the Acer by assumption.
## Current State - Acer, as of 2026-09-19

> [!NOTE] Build 5 correction, 2026-10-13
> (1) Ollama is NOT Windows-only on the Dell: a WSL Ollama 0.18.3 service ran (cloud models only); Build 5 stops and disables it so the Windows Ollama can own port 11434. (2) The Dell is the canonical always-on host, not retired. (3) The Acer `.wslconfig` in the snapshot (16GB, 8 CPUs) predates the 2026-10-12 correction; the correct values are the 20GB/18 CPU/swap-on-D: set in the note below, still to be verified on the Acer. (4) systemd on the Dell: "running", zero failed units on WSL 3.0.3.0.


WSL is fully installed and working, and the terminal environment is now deeply configured, not just installed. The platform and Ubuntu-24.04 live on `D:\WSL\Ubuntu`, with `anant_gupta` as the default Linux user and systemd running. `.wslconfig` caps memory at 20GB and processors at 18, and separately redirects the swap file to `D:\WSL\swap.vhdx` - a setting relocating the distro itself never touched, since it defaults to C: unconditionally. Base development tooling is in: git, git-lfs, ripgrep, fd/bat (symlinked past their Debian renames), fzf, jq, and GitHub's CLI from Ubuntu's own default repository rather than a separate, more fragile apt source. GitHub auth runs over HTTPS through `gh`'s own credential helper with the personal git identity set; a spare, unused SSH key exists but isn't wired into anything. Node runs through nvm on the current LTS, with pnpm via Corepack and uv for Python, both resolving without extra shell sourcing since Ubuntu's own profile already puts the right directories on `PATH`.

The terminal experience is fully tuned, not just matching the Windows side in spirit. Starship shows real exit-code and command-duration indicators on top of its Tokyo Night prompt, with a slow-mount timeout bug caught and fixed. Yazi has a real, built-from-scratch config - git-status column, full borders, fuzzy filtering, Tokyo Night Storm theme - though its image previews still don't render: chafa is installed but at too old a version (apt's 1.14.0, Yazi needs 1.16.0+), and the real fix (a newer static binary) is queued but not yet confirmed applied. `tmux` runs with a WezTerm-matched keybinding scheme (`Ctrl-a` prefix, `|`/`-` splits), pane labels, 1-indexed panes/windows, session persistence across restarts, real Windows-clipboard integration via `win32yank`, and two competing AI-agent-status plugins installed side by side pending a month's real-world comparison. `lazygit` and `git`'s own diff pager (`delta`) are both wired in and confirmed working. All four AI CLIs are installed and confirmed under their real command names, which don't all match their install URLs: `kiro-cli`, `codex`, `claude`, and `agy` for Antigravity. Cursor stays Windows-native by design, never installed as a WSL CLI. The project taxonomy (`~/projects/{ai,hub,hackathon,scratch,work}`, `~/tools`) exists, and one consolidated, duplicate-guarded `.bashrc` block wires `PATH`, nvm, cargo, uv, and Starship into every new shell regardless of which directory it opens in.

Beyond the original three (`tmux`, `ncdu`, `semgrep`), a second round added `zoxide` (fast directory jumping), `sesh` (session switching, integrated live with zoxide's visited-directory ranking), `atuin` (searchable shell history, imported and local-only - no cross-machine sync enabled, that's a decision for [[Cross-Laptop Sync - Build Roadmap]], not this note), and `gh-dash` (multi-repo GitHub dashboard) - each chosen after being debated against real, named competitors, not picked on name recognition. None of these auto-start; `tmux` in particular only runs when asked, matching the standing preference for manual, opt-in tooling over silent automation.

**What's still open:** the WSL-native `~/.mcp.json` stays unwritten until Jarvis/Obsidian migrates to this laptop; `direnv` isn't installed yet (blocked twice by a sudo password the install session had no way to enter - needs a human-run `sudo apt install -y direnv`); a handful of follow-up config items (chafa's version fix, atuin's filter-mode tuning, a real `sesh.toml`, `gh-dash`'s `repoPaths`, the agent-status plugin's push-notification wiring) were queued in a handoff prompt whose completion was never confirmed back - treat them as pending, not done, until verified directly; Docker Desktop, and its own separate WSL-disk redirect, hasn't been installed yet. The full execution history - every bug hit, exactly why, and the complete tool-selection debates across both rounds - lives in [[Acer Live State — 2026-09-16#WSL execution log — 2026-09-18]] and [[Acer Live State — 2026-09-16#WSL configuration round 2 - 2026-09-19]], not repeated here. The maintenance routine (cache hygiene, watching VHDX growth, backup discipline, local-model scheduling) lives in [[WSL New Laptop Master Plan — Verified 2026-09-11#Maintenance Cadence]] as an ongoing practice, not a setup step of this note's.

### Mistakes already made once - do not repeat these

> [!WARNING]
> `/etc/wsl.conf` has no `[wsl2]` section. A `memory=`/`processors=` line there is silently ignored - it belongs in `%UserProfile%\.wslconfig` only.

> [!WARNING]
> A `.wslconfig` memory value needs a whole number plus a unit (`20GB`). A bare number or a decimal gets rejected, and WSL falls back to its default cap without telling you clearly. Always re-read the file with `Get-Content` right after writing it - a silent `Set-Content` typo (like `-Encoding asci`) can leave the old, broken file in place while looking like it succeeded.

> [!WARNING]
> `fd-find`'s binary is `fdfind`, and `bat`'s binary is `batcat` - both renamed by Debian/Ubuntu to avoid clashing with unrelated older packages. Symlink `fd`/`bat` in `~/.local/bin` rather than assuming the package name is the command name.

> [!WARNING]
> Pasting one long logical shell line (a piped `curl | sudo tee /path`, a long `echo "..."`) directly into an interactive terminal. Something in the copy/paste chain (this session: likely the source document) can insert real line breaks mid-command, corrupting a file path or a one-line config format that can't tolerate embedded newlines. Keep commands short, or write them to a script file and run the file, the same fix already learned for PowerShell pastes in [[Acer Live State — 2026-09-16]]. A failed command like this can still leave a real, broken file on disk (`/etc/apt/sources.list.d/github-cli.list` did) - simply not repeating the bad command isn't enough, the leftover file has to be removed explicitly or it keeps breaking every future `apt` call.

> [!WARNING]
> Cloning or building a real project under `/mnt/c` or `/mnt/d`. Every file operation crosses the 9P bridge; the fix is moving the repo to the Linux filesystem, not debugging the toolchain.

> [!WARNING]
> Assuming `rm -rf` inside WSL shrinks the `.vhdx` on Windows. It doesn't - `fstrim` plus host-side compaction is required, and even then only after WSL/Docker/editors are fully shut down.

> [!WARNING]
> Copying an AI platform's home directory (`~/.claude`, `~/.cursor`, `~/.codex`, etc.), an SSH key, or `~/.mcp.json`/`~/.mcp.env` over from another machine. Every install is fresh; every credential is generated per machine - including SSH keys, which this guide skips entirely in favor of `gh`'s HTTPS credential helper.

> [!WARNING]
> Assuming relocating the distro's `ext4.vhdx` to D: also moved WSL2's swap file. It didn't - `swapfile` is a separate `.wslconfig` setting that defaults to `%TEMP%\swap.vhdx` on C: regardless of where the distro itself lives, and has to be set explicitly. The same independence applies to Docker's own WSL disk image later.

> [!WARNING]
> Pasting a bash-only command straight into an open PowerShell prompt, or the reverse, because the previous command happened to work there. Nothing stops PowerShell from half-parsing a bash line (or vice versa) and failing in a way that looks like the command itself is broken. When a phase switches shells, run the explicit `wsl ~` (or exit WSL) first, and check `whoami` if it's ever unclear which shell is actually active.

> [!WARNING]
> Assuming an install script's URL, package name, or command name all match. `kiro-cli`, `bat`/`batcat`, `fd-find`/`fdfind`, and `agy` (Antigravity's actual binary) all diverge from what the install command or package name would suggest. Always confirm with the tool's own `--version` right after installing, not by guessing from the install command.

> [!WARNING]
> Trusting `cargo install <crate>` to work for every Rust-distributed tool. Yazi's `yazi-cli`/`yazi-fs` crates fail outright on crates.io by design (an upstream workspace-publishing limitation) - check a tool's own install docs before assuming `cargo install` is the right method, and prefer a GitHub-release binary when the project's own docs point there instead.

## Flashcards
Why doesn't deleting a 19GB folder inside WSL free up space on the D: drive?::The VHDX only grows, never auto-shrinks. The blocks are freed inside Linux but the Windows-side file keeps its high-water mark until `fstrim` plus compaction (or `sparseVhd=true`).
#cards/laptop
`npm install` feels far slower in one WSL project than another — what's the most likely cause?::The slow project is cloned under `/mnt/c` or `/mnt/d` (crossing the 9P DrvFs bridge for every file) instead of the native Linux side (`~/projects/...`).
#cards/laptop
A cron job defined inside WSL isn't firing while the laptop is asleep - why, and what's the fix?::WSL only runs while its distro is active; cron inside it can't wake the machine or start WSL itself. Use Windows Task Scheduler to run `wsl -d Ubuntu-24.04 -- <command>` on a schedule instead - that wakes WSL and runs the command inside the real Linux environment.
#cards/laptop
Why install Ubuntu with `wsl --install --location` instead of installing normally then exporting/unregistering/reimporting to D:?::`--location` writes the VHDX directly to the given path - nothing ever touches C: even transiently, so the export/unregister/reimport dance is unnecessary unless `--location` isn't supported on the current WSL build.
#cards/laptop
`apt install fd-find` succeeds but `fd --version` says command not found - why?::Debian/Ubuntu ships the binary as `fdfind`, not `fd` (renamed to avoid clashing with an unrelated existing `fd` package). Same story for `bat`, installed as `batcat`. Symlink the names you want in `~/.local/bin`.
#cards/laptop
A `.wslconfig` edit doesn't seem to apply, and the same error message reappears after "fixing" it - what should you check first?::Re-read the file with `Get-Content` right after writing it. A `Set-Content` typo (like an invalid `-Encoding` name) fails silently, leaving the old, broken file in place while looking like the write succeeded.
#cards/laptop
Does WSL need SSH keys or mirrored networking for GitHub and Jarvis MCP to work?::No SSH key: `gh auth setup-git` gives git an HTTPS credential helper that covers GitHub. But it does need **mirrored networking** for the Jarvis and The Plan MCP servers: they are Obsidian REST APIs on the Windows side (`127.0.0.1:27123` and `:27124`), and in the default NAT mode localhost forwarding only works from Windows into WSL, not from WSL out to Windows. Both the Dell and the Acer run `networkingMode=mirrored`. (An earlier version of this card said NAT was enough; the Dell's Build 1 disproved it.)
#cards/laptop
`zellij` has nicer out-of-the-box UX than `tmux` - why did `tmux` win anyway?::Ecosystem fit for the actual planned use case: running multiple AI CLI agent sessions in parallel panes and reattaching after a WSL restart. Far more multi-agent-orchestration tooling targets `tmux`, and `tmux-resurrect`/`tmux-continuum` have years of production use for exactly the reattach-after-restart case this laptop needs.
#cards/laptop
Ollama is already planned on the Windows side with models on D: - is there any reason to also install Ollama inside WSL?::No. Under mirrored networking WSL reaches the Windows-side Ollama at `http://127.0.0.1:11434`, so a second install only duplicates model files, and a WSL Ollama service would hold the same port and block the Windows server (this happened on the Dell until Build 5 disabled it).
#cards/laptop
The distro's `ext4.vhdx` was moved to D:, but C: keeps filling up anyway - what else defaults to C: regardless of that move?::WSL2's swap file (`swapfile` in `.wslconfig`, default `%TEMP%\swap.vhdx`) and, later, Docker Desktop's own WSL disk image - both are independent settings that have to be redirected to D: explicitly; relocating the distro itself doesn't touch either one.
#cards/laptop
`git config --global --get credential.helper` comes back empty even after `gh auth setup-git` ran successfully - is that a bug?::No. `gh auth setup-git` scopes the credential helper per host (`credential.https://github.com.helper`), not the global `credential.helper` key - checking the wrong key is what makes it look broken.
#cards/laptop
`apt install chafa` succeeds and chafa itself renders images fine standalone, but Yazi's image preview still shows nothing - why?::Version gate, not a config problem. Yazi requires chafa >=1.16.0 as a fallback backend; Ubuntu 24.04's apt package is capped at 1.14.0. Fix with the official static binary release, not a PPA (the only one available only reaches 1.14.5).
#cards/laptop
An install session reports a tool is blocked because `sudo` needs a password it has no way to enter - what should it do about the shell hook that depends on that tool?::Not add the hook. A `direnv hook`/`eval` line for a binary that doesn't exist yet would break every future shell start with a "command not found" error - correct behavior is to install the binary first, verify it exists, and only then add anything that depends on it.
#cards/laptop

## Acer toolkit sync and swap fix - 2026-10-15
This section closes the problems list of the 2026-10-13 audit above, from a live session on the Acer.
| Audit item | State now |
|---|---|
| 1 Weekly clean deletes `~/.cache/node` | **Fixed.** The deletion block in `~/tools/weekly-cache-cleanup.sh` is removed (a comment explains why). Corepack pnpm is pinned to 12.4.2 again. |
| 2 Small Linux disk | Open. `/` is 39 GiB with 11 GiB free (72 percent used) after the toolkit upgrade. An offline resize with a backup is a user decision; compaction would not help. |
| 3 Storage candidates | Unchanged (uv cache, VS Code Server 4.1 GB, Miniconda 3.8 GB). No cleanup ran. |
| 4 `.wslconfig` | **Fixed and live.** Launch and swap problems were fixed with a new swap path. The file now has `memory=20GB`, `processors=18`, `swapFile=D:\\WSL\\wsl-swap.vhdx`, `swap=8GB`, `networkingMode=mirrored`, `firewall=true`, `dnsTunneling=true`, `autoProxy=true` and, under `[experimental]`, `sparseVhd=true` and `autoMemoryReclaim=gradual`. `free -h` shows 19 GiB, `nproc` 18, `/proc/swaps` 8,388,608 KB on `/dev/sdc`. The old `D:\WSL\swap.vhdx` (36 MB) is in `D:\Backup\Quarantine\swap-vhdx-review-2026-10-15`; do not recreate it. |
| 5 DNS-check noise | Not re-investigated. `dnsTunneling=true` is now set on purpose. |
| 6 Toolkit parity | **Done** with Build 5b: golden configs applied (`changed=13 same=21 fails=0`), starship is LF and has the python and conda segments, tmux has current-directory splits, history-limit 100000, renumber-windows, escape-time 10 and passthrough, gh-dash maps three Acer repos, git has the shared include and `autocrlf=input`, `.bashrc` hooks are guarded. ruff, shellcheck and shfmt are installed. `socat` is the only missing tool (needs sudo). pnpm stays on 12.4.2. |
| 7 Backup and two-laptop closure | Two-laptop closure done on 2026-10-15 (see [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]); the independent host-key comparison is the one open item. The Dell has a verified WSL export; the Acer has none, so take one before any disk resize. |
Version note: the Acer WSL was updated from 2.7.14.0 to 3.0.3.0 (kernel 6.18.54.1) on 2026-10-15, matching the Dell. The new `.wslconfig` survived the restart unchanged. Details in the follow-up below.

### What is on the Acer WSL disk, and what is still to decide (2026-10-15, read-only inventory)
Taken so the discussion about WSL's role (now that the Dell hosts the code and the Acer reaches it over Tailscale SSH) starts from facts. Nothing was removed.
| Item | Size | Regenerable? |
|---|---|---|
| `~/.cache` (uv 7.5 GB, node 0.1 GB, others small) | 7.7 GB | uv cache yes; `~/.cache/node` NEVER (Corepack pin) |
| `~/.vscode-server` (extensions 2.5 GB, bin 0.7 GB, data 0.9 GB) | 4.1 GB | yes, rebuilt on the next WSL window |
| `~/miniconda3` (`jupyter-base`) | 3.8 GB | rebuildable from the spec in `~/conda/specs` |
| `~/.codex` | 2.1 GB | agent state, review before touching |
| `~/.local` (uv tools, binaries, `.prev` rollbacks) | 1.8 GB | partly |
| `~/.rustup`, `~/.cargo`, `~/.nvm`, `~/.npm` | 1.5, 0.5, 0.7, 0.9 GB | toolchains and caches |
| `~/projects` | 252 MB, plus `scratch/gpu-smoke-test` 5.3 GB on disk | clones are small; the scratch project is the large one |
`/` is 39 GiB (72 percent used), `ext4.vhdx` is 28.9 GiB on D:. The WSL platform update (2.7.14.0 to 3.0.3.0) is scripted as `70-acer-wsl-update.ps1`, run from Windows PowerShell. Planned discussion, after all builds: what the Acer's WSL is for when the Dell hosts the code; what to do with the two Acer clones and `gpu-smoke-test`; whether to resize, shrink or rebuild the disk (take a `wsl --export` first; the Acer has none yet); how Remote-SSH, the Windows toolkit and Tailscale divide the work.

### WSL platform update, 2026-10-15
WSL platform update done 2026-10-15 18:48 (user ran `70-acer-wsl-update.ps1 -Apply`, 1 min 15 s, update exit 0, distro restarted exit 0, log `D:\WSL\ops\windows\logs\70-acer-wsl-update-20261015-184803.log`): WSL 2.7.14.0 to 3.0.3.0, kernel 6.18.33.2-2 to 6.18.54.1-1, WSLg 1.0.73.2 to 1.0.79, MSRDC 1.2.7214 to 1.2.7391. The script's own `systemd:` line printed blank (checked too soon after the restart); a live check afterwards showed `systemctl is-system-running` = running, 0 failed units, user systemd running, 19 GiB memory, 18 CPUs, `/proc/swaps` 8,388,608 KB on `/dev/sdc` with 0 used, `/` 39 GiB at 72 percent, tmux 3.8, pnpm 12.4.2, socat 1.8.0.0, `wsl-check` 22 MATCH and 9 intentional DIFF, `dell-wsl` resolves and `tcp/22` is reachable, no Tailscale in WSL, the three MCP servers still connect through the wrappers with no keys exported in a clean shell, and the weekly-cleanup and monthly-review user timers are enabled (next run Sunday 2026-10-18 03:00). Docker Desktop was closed by the update step and must be reopened by the user; its engine was not running at the check.
