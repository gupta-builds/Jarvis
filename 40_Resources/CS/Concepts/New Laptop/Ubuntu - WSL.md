---
type: concept
status: sprout
created: 2026-01-17
updated: 2026-09-19
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
*Run command:* `wsl ~` opens straight into the WSL home directory. Plain `wsl` opens wherever the root filesystem got installed — historically `C:`, even though everything that matters now actually runs on `D:` after the VHDX move.
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

## Current State - Acer, as of 2026-09-19

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
Does WSL need SSH keys or mirrored networking for GitHub and Jarvis MCP to work?::No to both. `gh auth setup-git` gives git an HTTPS credential helper, covering all GitHub operations without an SSH key. WSL2's default NAT mode already forwards `127.0.0.1` between Windows and WSL (built-in localhost forwarding), which is all Jarvis's MCP HTTP servers need - mirrored networking is for advanced cases this setup doesn't have.
#cards/laptop
`zellij` has nicer out-of-the-box UX than `tmux` - why did `tmux` win anyway?::Ecosystem fit for the actual planned use case: running multiple AI CLI agent sessions in parallel panes and reattaching after a WSL restart. Far more multi-agent-orchestration tooling targets `tmux`, and `tmux-resurrect`/`tmux-continuum` have years of production use for exactly the reattach-after-restart case this laptop needs.
#cards/laptop
Ollama is already planned on the Windows side with models on D: - is there any reason to also install Ollama inside WSL?::Not for this setup. WSL already reaches the Windows-side Ollama at `http://127.0.0.1:11434` via the same built-in NAT localhost forwarding used for Jarvis's MCP servers - a second WSL-native install would just duplicate multi-GB model files on disk for no benefit.
#cards/laptop
The distro's `ext4.vhdx` was moved to D:, but C: keeps filling up anyway - what else defaults to C: regardless of that move?::WSL2's swap file (`swapfile` in `.wslconfig`, default `%TEMP%\swap.vhdx`) and, later, Docker Desktop's own WSL disk image - both are independent settings that have to be redirected to D: explicitly; relocating the distro itself doesn't touch either one.
#cards/laptop
`git config --global --get credential.helper` comes back empty even after `gh auth setup-git` ran successfully - is that a bug?::No. `gh auth setup-git` scopes the credential helper per host (`credential.https://github.com.helper`), not the global `credential.helper` key - checking the wrong key is what makes it look broken.
#cards/laptop
`apt install chafa` succeeds and chafa itself renders images fine standalone, but Yazi's image preview still shows nothing - why?::Version gate, not a config problem. Yazi requires chafa >=1.16.0 as a fallback backend; Ubuntu 24.04's apt package is capped at 1.14.0. Fix with the official static binary release, not a PPA (the only one available only reaches 1.14.5).
#cards/laptop
An install session reports a tool is blocked because `sudo` needs a password it has no way to enter - what should it do about the shell hook that depends on that tool?::Not add the hook. A `direnv hook`/`eval` line for a binary that doesn't exist yet would break every future shell start with a "command not found" error - correct behavior is to install the binary first, verify it exists, and only then add anything that depends on it.
#cards/laptop
