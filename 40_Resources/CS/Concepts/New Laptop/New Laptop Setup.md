---
type: note
status: tree
created: 2026-06-17
updated: 2026-09-19
course: Life
track:
  - laptop
prerequisites: []
used_in: []
evidence: []
tags:
  - note
related:
  - "[[Ubuntu - WSL]]"
  - "[[Acer Live State — 2026-09-16]]"
  - "[[Installations]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[VS Code Professional Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Old Laptop Decommission Checklist]]"
  - "[[Google Drive Sync Policy]]"
  - "[[Cross-Laptop Sync - Build Roadmap]]"
---
# New Laptop Setup

> [!IMPORTANT] This is the pinned source of truth for the Acer
> Everything about the new laptop routes through this note - drive layout, what Day 1 actually did, the architecture decisions that hold regardless of which machine, and where to go for each subsystem's own detail. A separate note, "Windows Setup Master Plan", used to hold the Day-1 checklist and the architecture decisions on its own; its crucial content is merged in below and that note is now deleted - any old reference to it means this note now.

## Current status, 2026-09-19

The Acer is the active daily driver. Windows Day 1 is done: partitioned (`C:` 315.73GB / `D:` 636.62GB, confirmed single physical NVMe), hibernation off, Documents/Downloads/Desktop/Pictures redirected to `D:\Users\_Anant\`, git identity and npm cache set, Vivaldi installed and synced, Google Drive syncing the correct personal account (`anantmahi721@gmail.com`) with `10_Areas` flowing through to `D:\_Anant` as designed. WSL is fully installed and its terminal environment is deeply tuned (18 CLI tools beyond the base toolchain, each chosen against named competitors, not picked on name recognition) - see [[Ubuntu - WSL#Current State - Acer, as of 2026-09-19]] for the real state, [[Acer Live State — 2026-09-16#WSL execution log — 2026-09-18]] and [[Acer Live State — 2026-09-16#WSL configuration round 2 - 2026-09-19]] for the full build log. Still open: `direnv` isn't installed (blocked by sudo access in the install session), a handful of config-tuning items are queued but their completion was never confirmed (see [[Installations#Full software list — WSL side (Ubuntu 24.04, inside the distro)]] for exactly which), Jarvis/Obsidian hasn't migrated to this laptop yet (blocks the WSL-native `~/.mcp.json` and the Windows-side MCP wiring both), Docker Desktop isn't installed, and the VS Code Day 2+ build-out (Settings Sync, profiles, tasks/launch configs) hasn't started.

## Routing table - where does X live

| Topic | Note |
|---|---|
| WSL setup, current state | [[Ubuntu - WSL]] |
| Live audit of what's actually true on the Acer right now | [[Acer Live State — 2026-09-16]] |
| Software inventory, which drive each app landed on | [[Installations]] |
| MCP / Jarvis-Obsidian wiring | [[Jarvis MCP and REST API Setup]] |
| VS Code build-out (Day 2+, not started) | [[VS Code Professional Setup]] |
| WSL maintenance - what to run periodically | [[WSL New Laptop Master Plan — Verified 2026-09-11#Maintenance Cadence]] |
| Old Dell decommission gate | [[Old Laptop Decommission Checklist]] |
| Google Drive desktop sync rules | [[Google Drive Sync Policy]] |
| Cross-laptop sync mechanics (still being designed) | [[Cross-Laptop Sync - Build Roadmap]] |

## Architecture decisions

Durable rules that hold regardless of which machine gets rebuilt next - merged in from the former "Windows Setup Master Plan".

### Drive layout: redirect known folders + tool data to D:, keep the Windows profile skeleton on C:

Not full profile relocation (setting `%USERPROFILE%` itself to D:) - that's not well-supported after install, and some installers still assume a C: profile even when attempted at OOBE. Instead: the Windows profile skeleton (a few GB) stays on C:, and everything that actually grows moves to D:.

- Documents / Downloads / Desktop / Pictures → redirected to `D:\Users\_Anant\...` via each folder's own **Properties → Location tab** - Windows' own supported per-folder redirection, not a profile-wide hack. Done on the Acer.
- Every tool's data directory individually - npm cache, Ollama models, Docker's WSL disk image, WSL itself - lands on D:, never left to silently default to C:.
- Electron-app installers that give no drive choice (VS Code's forced-C: sibling builds, Cursor, Obsidian, Ollama, Slack, etc.) stay on C: in `AppData\Local\Programs` - the one category with no real choice to make. Full current per-app placement: [[Installations]].

#### Third drive for WSL/Linux: decided - a dedicated disk, fresh install, no migration

Resolved for the Acer: single physical NVMe (`Get-Disk` confirmed), so the one-SSD branch applies - `C:` for Windows/apps, `D:` for PARA data plus the WSL/Docker VHDX folders, no third partition carved out for WSL. Fresh-installed WSL and Docker rather than migrating the old Dell's VHDXs, per the standing policy below.

### Cross-laptop scope

This machine and a second workstation are meant to run as two live, simultaneously-used machines with project code and the Jarvis/The Plan vaults kept in sync (Syncthing + Tailscale, chosen over Obsidian's paid Sync and self-hosted LiveSync). **The full sync mechanism is still being designed** - see [[Cross-Laptop Sync - Build Roadmap]] - but the part that's decided and doesn't depend on which sync tool carries the rest is what never travels between machines, and why.

#### AI platform global directories - fresh install only, never migrated or synced

Every AI coding platform (Claude Code, Cursor, Codex, Kiro, Antigravity, and anything added later) gets **freshly installed on each machine, on both the Windows side and inside WSL** - never by copying or syncing a home-level config directory (`.claude`, `.cursor`, `.codex`, etc.) from one machine to the other. Let each platform's own installer and first run create its directory structure from scratch. Confirmed followed on the Acer: every AI CLI dotfolder found there was a deliberate, individual fresh install, not a migration.

Sequencing matters: install every AI platform first and let all of them finish generating their own global directories before touching MCP wiring or any cross-laptop sync tooling - standing up sync against a directory a platform hasn't finished initializing risks fighting the installer's own assumptions.

#### Secrets and machine-specific credentials - reconfigured per machine, never synced

- SSH private keys, if one exists at all - the Acer's WSL setup skips SSH entirely in favor of `gh`'s HTTPS credential helper, see [[Ubuntu - WSL]].
- `.credentials.json` (Claude Code's own auth token).
- `.mcp.json` / any `.mcp.env` (Bearer tokens, GitHub PATs, Obsidian Local REST API keys).

None of these are ever live-synced, and none are auto-copied by any tool. Each gets reconfigured directly on its own machine: a fresh Obsidian install generates a new Local REST API key per vault (see [[Jarvis MCP and REST API Setup#New Laptop Checklist]]), and `gh auth login` / `claude` login re-authenticate fresh rather than reusing a copied token.

**What's still genuinely synced:** project code (working trees), per-project `.claude/` folders, Desktop/work folders, and the Jarvis/The Plan vaults. Only the AI-platform global directories and the secrets above are carved out.

## Day 1 - Windows, what actually happened

Historical record now, not a checklist to follow again - the Acer already went through this.

- Hibernation disabled (`powercfg /hibernate off`), confirmed via `powercfg /a`.
- Partitioned to the confirmed real split (`C:` 315.73GB, `D:` 636.62GB) after the read-only hardware audit, not copied from the old Dell's numbers.
- Git identity set to `anantmahi721@gmail.com` / "Anant Gupta", `core.autocrlf false`, `init.defaultBranch main`, `pull.rebase true`.
- Node via `nvm-windows`, not a direct `nodejs.org` install - avoids the old Dell's "no version manager" gap.
- npm cache redirected to `D:\npm-cache`.

#### Step 8 - Redirect the four user folders to D:

Create the destination folders first, then for each of Documents, Downloads, Desktop, and Pictures: right-click in File Explorer → Properties → Location → Move, choosing the matching folder under `D:\Users\_Anant\`. Never enable OneDrive Known Folder Move for the same folders at the same time - pick one owner per folder, local redirection or OneDrive, never both. Done on the Acer via this exact method, confirmed as the real, actively-syncing target.

### New findings this pass (not in any existing note)

Carried forward from the original Windows-side verification pass, still worth knowing: a long tail of OEM/incidental installs can accumulate undocumented (Dell OEM bloat on the old machine, Chris Titus Tech batch installs on the Acer) if nothing tracks them - [[Installations]] exists specifically to stop that drift from repeating. `wsl --install <Distro> --location <Path>` is a real, current flag (used for the actual Acer install). `wsl --manage <Distro> --set-sparse true` also exists and makes the VHDX auto-reclaim freed space - not yet enabled on the Acer, worth revisiting once VHDX growth becomes a real concern (see the maintenance cadence in [[WSL New Laptop Master Plan — Verified 2026-09-11#Maintenance Cadence]]).

## Day 2+ - VS Code build-out

Not started. Follow [[VS Code Professional Setup#Suggested build order for the next VS Code session (for discussion, not started)]] in the order it specifies: Settings Sync first, then Profiles, then `tasks.json`/`launch.json` on one real project, then the `uv`+`ipykernel` Jupyter pattern, then Test Explorer, then snippets/multi-root/`extensions.json` as polish.

## Where to go when something breaks

| Symptom | Look here |
|---|---|
| Anything inside WSL behaves wrong | [[Ubuntu - WSL]] for the mental model and current state; [[Acer Live State — 2026-09-16#WSL execution log — 2026-09-18]] for the full bug list already hit and fixed |
| C: filling up again | Check `AppData\Roaming`/`AppData\Local\Programs` first, then confirm nothing WSL-related (swap file, Docker's disk image) silently defaulted back to C: - see [[Ubuntu - WSL#Mistakes already made once - do not repeat these]] |
| `.wslconfig`/`wsl.conf` memory or CPU caps not applying | Caps go in `.wslconfig` only, never `wsl.conf`'s `[wsl2]` block |
| Jarvis/The Plan MCP not connecting | [[Jarvis MCP and REST API Setup#Failure Modes / Misconceptions]] - though as of 2026-09-18 this is expected, MCP hasn't been wired yet |
| VS Code feels like "the same editor, no leverage" | [[VS Code Professional Setup]] - everything there is still unbuilt by design until Day 2+ |
| Wondering whether to copy an AI-platform home directory or a secret between machines | Don't - see [[New Laptop Setup#Cross-laptop scope]] above |
| Old Dell decommission readiness | [[Old Laptop Decommission Checklist]] |

## Evidence From This Vault
- [[Ubuntu - WSL]] - the WSL mental model and current real state
- [[Acer Live State — 2026-09-16]] - the live audit and full execution log this note's current-status section draws from
- [[Jarvis MCP and REST API Setup]] - the MCP subsystem, still pending on this machine
- [[VS Code Professional Setup]] - the Windows-side VS Code deep-dive, still unbuilt
- [[Installations]] - the living software inventory and drive-placement record
- [[WSL New Laptop Master Plan — Verified 2026-09-11]] - the original hardware-gated plan; its Maintenance Cadence section is the one part still actively used

## Flashcards
Where does the WSL2 `memory=` resource cap actually go - `/etc/wsl.conf` or `.wslconfig`?::`%UserProfile%\.wslconfig`. `/etc/wsl.conf` has no `[wsl2]` section, so a memory/processors line there is silently ignored - this exact bug happened once already, see [[Ubuntu - WSL#Mistakes already made once - do not repeat these]].
#cards/laptop
What never travels between the two laptops, even once cross-laptop sync is built?::AI-platform global config directories (`.claude`, `.cursor`, `.codex`) and every secret (`.credentials.json`, `.mcp.json`/`.mcp.env`, any SSH key) - each gets freshly installed or regenerated per machine, never copied or synced.
#cards/laptop
This vault once cited a "deeper WSL-specific manual" that turned out not to exist as a findable file - what's the lasting lesson, not just the specific fact?::Verify a source file actually exists and is readable before citing "it says X" as settled - a citation to an unconfirmed document is not evidence, even if the claim later turns out to be independently correct on its own merits.
#cards/laptop
