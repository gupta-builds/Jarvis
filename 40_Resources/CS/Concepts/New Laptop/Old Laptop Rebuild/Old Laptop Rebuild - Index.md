---
type: note
status: sprout
created: 2026-10-04
updated: 2026-10-17
course: Life
track:
  - laptop
  - windows
  - wsl
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]"
  - "[[Installations]]"
  - "[[Ubuntu - WSL]]"
  - "[[New Laptop Setup]]"
  - "[[WSL Toolkit Config Reference]]"
  - "[[Machine Toolkit - Tool Use Cases and Agent Guide]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
  - "[[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]]"
  - "[[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]]"
next: "Revoke the Firecrawl key at the provider; read the first weekly-clean log (Sun 2026-10-18); run a Defender full scan; decide the Acer's 4 local-only internship commits and the pnpm-pin pushes; then write Build 6."
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) was rebuilt in five numbered builds (WSL, WSL VS Code and the SSH workflow, Windows cleanup, Windows toolkit, WSL parity) plus their follow-ups, so that it matches the newer Acer and serves as the always-on code host the Acer reaches over Tailscale; all five builds are finished and documented, the Acer ran its half on 2026-10-15, and what is left is a short list of decisions, one provider-side revocation and three future builds.==

## Where things are
| Place | Holds |
|---|---|
| this folder | this Index; [[C Drive Bloat - Failure Log and Prevention Rules]]; the two future-build plans ([[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]] and [[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]]); four asset folders |
| `Runs/` ([[Old Laptop Rebuild - Runs Index]]) | one folder per build with its findings note (`Build 1` to `Build 5`, `Build 5b Acer Visit`) |
| `Windows Toolkit/` | the Build 4 deliverable: `toolkit.json` (manifest), `toolkit.lock.json` (versions), `_scripts/` (run order and rollback in its README), `configs/`, `catalog/` (one catalog per machine), `results/` (script result JSONs) |
| `WSL Parity/` | the Build 5 deliverable: `golden/` configs (the single source for both laptops), `_scripts/`, [[WSL Toolkit Config Reference]] |
| `Acer Dotfile Snapshot/` | the Acer's real Windows and WSL configs as exported on 2026-10-11, with hashes (the "before" for parity) |
| `New Laptop/` (parent) | [[Installations]] (live inventory), [[Ubuntu - WSL]], [[New Laptop Setup]], [[Machine Toolkit - Tool Use Cases and Agent Guide]], `Codebases/` (including the Locked Decisions note), `Sync/` (a separate series) |
| `D:\WSL\ops` and `D:\WSL\ops\windows` | the live host scripts and their logs on the Dell (vault copies of the ones worth keeping are under `Windows Toolkit/_scripts/host-ops` and `WSL Parity/_scripts`) |
Retired on 2026-10-17: every build prompt, the Acer-facing handoff and run-sheet notes (their results live in the findings notes), the old Index history and all backup copies. Everything retired is recoverable from the vault's git history.

## Starting state (2026-10-04)
| Item | Value |
|---|---|
| Machine | Dell Latitude 5530, i7-1255U (10 cores, 12 threads), 32 GB RAM, Intel Iris Xe only (no NVIDIA GPU), one 1 TB NVMe |
| Disks | C: 251.9 GB (28.6 GB free, 93 percent used by 2026-10-07 at 20 GiB free), D: 700 GB (about 366 GB free) |
| C: biggest | Users 128 GB (AppData 100 GB), Windows 39 GB, `pagefile.sys` 25.6 GB (a RAM-sized fallback), Program Files 26 GB |
| D: biggest | WSL 176 GB (`ext4.vhdx` 105 GB, `wsl-ubuntu.tar` 36.7 GB), Docker VHDX 33.8 GB, Games 86 GB, recycle bin 32.5 GB |
| WSL | kernel 5.15.167.4 (old), `.wslconfig` 16 GB / 8 CPUs with no swap setting (so swap landed on C:) |
| Things found that changed the plan | no discrete GPU, so heavy local-model work belongs on the Acer; the pagefile warning had a visible cause (a configured D: pagefile that never gets created); WSL swap defaults to C:; the Jarvis MCP from WSL needs mirrored networking; running `wsl --shutdown` from inside WSL kills the session |

## The builds
| Build | Dates | Layer | Result | Findings |
|---|---|---|---|---|
| 1 | 2026-10-04 to 10-07 | WSL | repaired in place; 41.7 GiB of regenerable data removed; `.wslconfig` retuned for an always-on host; WSL updated; 75-second idle test passed | [[Old Laptop Rebuild - Build 1 WSL Findings]] |
| 2 | 2026-10-07 to 10-15 | WSL VS Code and the two-laptop SSH workflow | WSL-side VS Code parity; Tailscale SSH between `dell-wsl` and `gupta-builds`; host key verified; `sync-check`; port-2222 fallback and VS Code Tunnel declined | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] |
| 3 (+3b) | 2026-10-11 to 10-12 | Windows C: cleanup, structure, watch | C: free 39.5 to 136 GiB; caches redirected to D:; pagefile settled; daily watcher and weekly clean registered | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]], [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] |
| 4 (+4b) | 2026-10-11 to 10-17 | Windows toolkit | manifest-driven toolkit, 104 PASS, lock written; catalog, agent guide, Installations; Cursor root cause; WSL export; startup, OpenClaw, Rize, quarantine cleanup; pnpm-pin pilot | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 5 (+5b) | 2026-10-13 to 10-15 | WSL parity | configs equal to the Acer's, then one golden set for both; upkeep timers; Miniconda; tmux 3.8, pnpm 12.4.2; DCIM duplicates removed | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] |
| Acer visit | 2026-10-15 | Acer side of Builds 2, 4 and 5b | golden WSL set applied, Windows toolkit Parts 0 to 3 (0 FAIL), host key MATCH, WSL updated to 3.0.3.0 | [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] |
| 6 | not written | Windows VS Code, MCP registry and Claude Code settings; AI platforms audit | open: Codex `node_repl` path, the skill-junction dot folders (13 named in the audit, dozens in total), Settings Sync impact | plan: [[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]] |
| 7 | not written | dev-only profile and a final verification against the Acer | open | none |
| 8 | not written | `D:\_Anant` consolidation and Google Drive | open; needs your answers first | plan: [[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]] |
"Build 5b" means the WSL golden-config toolkit upgrade: the Dell's part is in the Build 5 findings, the Acer's part in the Acer visit note. "Build 4b" is the Dell leftovers and Tailscale/SSH decisions inside the Build 4 findings. Earlier drafts of these notes used a different numbering (for example "Build 5 Windows VS Code" and "Build 6 final parity"); that was superseded by the table above.

## Final state (verified live on the Dell, 2026-10-17)
| Area | State |
|---|---|
| Dell Windows | Windows 11 Pro 26300; PowerShell 7.6.7 default; Git 2.55.0, GitHub CLI 2.102.0, Node 24.20.0, pnpm 12.11.2, uv 0.12.19; Terminal One Half Dark with IosevkaTerm Nerd Font; Cursor 3.24.18 (auto-update on); Windows Ollama 0.40.3 from `D:\Apps\Ollama` when started; .NET 8 kept for WSL Settings; nothing in the Run key or Startup folder starts by itself. Details: [[Installations]] |
| Dell disks | C: 120.8 GiB free (it was 145.4 on 2026-10-13; the system-managed pagefile grew to 31 GB, to be confirmed after a reboot), D: 452.8 GiB free; `D:\Backup\Quarantine` is empty |
| Dell WSL | 3.0.3.0, kernel 6.18.54.1, Ubuntu 24.04.4, systemd `running` with 0 failed units, 19 GiB / 10 CPUs / 8 GiB swap on `D:\WSL\swap.vhdx`, mirrored networking, both idle timers off; golden configs `same=34`; `wsl-clean.timer` and `wsl-watch.timer` active |
| Dell WSL backup | `D:\Backup\WSL\ubuntu-20261014-233219.tar` (54.47 GiB, 1,114,217 entries, SHA-256 in its manifest, re-hashed 2026-10-17). **Never import-tested.** The only WSL backup |
| Tailscale and SSH | `dell-wsl` (WSL, `RunSSH=true`) and `gupta-builds` (Acer Windows) connected over a direct path; Tailscale SSH only; host key verified |
| Acer (reported 2026-10-15) | golden WSL set, tmux 3.8, pnpm 12.4.2, WSL 3.0.3.0, Windows toolkit 0 FAIL; C: 166.5 GiB free; only `UV_CACHE_DIR` of the cache variables set; 4 internship commits exist only on the Acer |

## Standing decisions (locked, do not relitigate)
- **Two-laptop workflow (2026-10-04):** the Dell is the canonical host with one checkout per shared repo on WSL ext4; the Acer connects with VS Code Remote-SSH over Tailscale; GitHub is the backup and PR channel; parallel work uses git worktrees on `<machine>/<topic>` branches, one session per task; no sync daemon touches code. Reasoning and outcomes: [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]].
- **Tailscale placement:** inside WSL on the Dell, Windows side only on the Acer; never on the Dell's Windows side, never inside the Acer's WSL.
- **Settings Sync is live.** Any Windows VS Code user file written on the Dell reaches the Acer; Windows VS Code, MCP and Claude Code settings belong to Build 6.
- **Mirrored networking stays** (the Jarvis and The Plan MCP servers are Windows-side REST APIs on `127.0.0.1:27123` and `:27124`).
- **Never `wsl --shutdown`** from inside WSL and never restart WSL from a session; host steps go into a script the user runs.
- **No discrete GPU on the Dell** (Iris Xe only); heavy local-model work belongs on the Acer (RTX 5070 Ti).
- **Layout contract (Build 3b):** C: holds Windows, installs, drivers and the profile; `D:\Apps`, `D:\Cache\<tool>`, `D:\AI`, `D:\WSL`, `D:\Backup` hold the rest; a new tool sets its environment variable first.
- **Quarantines are temporary:** a review date in the folder name, a text record of what it held, then deletion. Only regenerable caches are deleted outright. Never delete `~/.cache/node` (it holds the Corepack pin).
- **Always-on host:** `Toolkit-Weekly-Clean` and the daily `Toolkit-Watch-C` on Windows; `wsl-clean.timer` and `wsl-watch.timer` in WSL.
- **Shared versions (2026-10-14):** pnpm 12.4.2 and tmux 3.8 in WSL on both laptops; Terminal scheme One Half Dark, font IosevkaTerm Nerd Font; PowerShell 7 is the default shell; the golden WSL configs in `WSL Parity/golden/` are the single source.
- **Cursor auto-update stays on** (2026-10-14): fix causes, never force-kill Cursor while its updater runs.
- **Drive and `_Anant` (2026-10-13):** `D:\_Anant` becomes the one main folder, Jarvis and The Plan stay out of any Drive mirror, and no mirror is turned on until codebases and cache trees leave the mirrored root.

## Rules learned the hard way (full table in each findings note)
1. Read an updater's state before stopping its app (Build 4 findings).
2. `powershell -File` passes a comma list as one string; a typed parameter coerces an array back; parenthesize `'key=' + $v` inside `@( , )`; native stderr can abort a PS 5.1 script under `Stop`; quotes inside `wsl.exe` arguments get mangled, so use a helper script (Build 4 findings).
3. Check elevation with the role enum, not the string "Administrator"; test every wildcard filter in a dry run; opam and Cygwin files carry the System attribute (Build 3b).
4. Verify a WSL export with GNU tar inside WSL, record the SHA-256, and say plainly that no import test was run (Build 5 findings).
5. After a pagefile or memory change, read C: free after a reboot before suspecting data (Failure Log).
6. No secret in any shell rc file; revoke at the provider and confirm with a status-only call (Build 4 findings).
7. Judge startup behaviour by process start time versus boot time, not by the Run key (Build 4 findings).
8. Before pinning a package manager, run a frozen install in an isolated worktree (Build 4 findings).
9. Only the session that closes a build edits this Index; a Syncthing conflict file is diffed before it is discarded (the 2026-10-13 incident).

## Open ledger: Dell
| # | Item | Owner | Detail |
|---|---|---|---|
| D1 | **Firecrawl key still accepted by the provider** | you | removed from `.bashrc` on 2026-10-15 and stored nowhere, but the API returned 200 for it at 13:37, 13:47 and 14:06 that day. In the dashboard revoke the key whose "last used" is the most recent. Never paste a key into a chat or a note |
| D2 | First `Toolkit-Weekly-Clean` run | automatic | Sunday 2026-10-18 03:30 (never run before; dry run showed 0.01 GiB); then read the newest `D:\WSL\ops\windows\logs` entry and `watch\ALERTS.txt`. `wsl-clean.timer` follows at 04:39 |
| D3 | C: free after a reboot | you | confirms the pagefile explanation for the drop from 145.4 to 120.8 GiB |
| D4 | Defender full scan, exclusions, BIOS battery cap (80 percent) and AC recovery | you | the two suspicious profile-root executables from Build 3 are gone but no full scan has ever run; exclusions need an elevated shell; the BIOS steps are by hand |
| D5 | `packageManager` pins | you, per repo | `Learning-Tracker-Tool`: local commit `51cc182`, unpushed (team repo; decide the push or PR). `portfolio`: its lockfile on `origin/main` is broken (duplicate `@ai-sdk/mistral@3.0.39`). `Assisto_website`: choose pnpm or npm first |
| D6 | `internship-research-loop` is 6 ahead / 5 behind `origin/master` with 25 dirty files | you | plus the Acer's 4 local-only commits (A1); the two histories need one deliberate merge |
| D7 | Malwarebytes (two entries), WhatsApp | you | keep or remove |
| D8 | GitLens re-downloads the GitKraken CLI (`gk.exe`) | you | uninstalling GitLens stops it (extension lists sync between laptops); 7 hidden Python component registrations remain (harmless) |
| D9 | `vscode-remote-wsl` (6.5 GiB on C:), pnpm store `v3` (1.8 GiB in WSL) | you | never decided |
| D10 | Import-test the WSL export once | you | the only way to prove the backup boots; it registers a temporary distro |
| D11 | Codex config carries a WSL `node_repl` path; skill-junction dot folders (13 named in the audit, dozens in total) | session | Build 6 |
| D12 | Tasks left disabled on purpose | you | `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync`, `ConversationCapture-Backfill-WSL`; re-enable with `Enable-ScheduledTask` |
| D13 | Optional tidy | you | `~/tools/vscode-tunnel-cli/` (unsigned Tunnel CLI) and the `Learning-Tracker-Tool` pin worktree once its branch is merged or dropped |

## Open ledger: Acer
| # | Item | Detail |
|---|---|---|
| A1 | **4 internship commits exist only on the Acer** | branch `acer-predator/repo-environment-setup`, upstream gone; protected by a verified bundle in `D:\Backup\repo-bundles\` on the Acer; push the branch or bring the commits to the Dell session |
| A2 | Discussion: what WSL is for on the Acer | disk 72 percent used, no `wsl --export` yet; the Dell hosts the code. Questions: what runs there, what to do with its clones, resize versus rebuild |
| A3 | Cache redirects | set `PIP_CACHE_DIR`, `HF_HOME`, `NUGET_PACKAGES`, `GRADLE_USER_HOME`, `PLAYWRIGHT_BROWSERS_PATH`, `PUPPETEER_CACHE_DIR` and decide `OLLAMA_MODELS` |
| A4 | Small items | reopen Docker Desktop; Node 24.19.0 versus the lock's 24.20.0; the Remote-SSH execution-location re-check in a GUI window; find out why an SSH stream runs at only 2.5 MiB/s |
| A5 | Acer Drive backup scope and the account question | the Drive plan note |
| A6 | Optional | the Dell can adopt the Acer's wrapper pattern that keeps `~/.mcp.env` out of every shell |

## Next actions (in order)
1. **Revoke the Firecrawl key** at the provider (D1).
2. **Sunday 2026-10-18:** let the first weekly clean run, then have the next session read its log and the watcher alert file (D2).
3. **Reboot once and read C: free** (D3); then run a **Defender full scan** (D4).
4. **Decide the code questions:** the Acer's 4 commits (A1/D6), whether to push or PR the Learning-Tracker-Tool pin (D5), how to repair the portfolio lockfile, and which manager Assisto uses.
5. **Optional safety step:** import-test the WSL export once (D10).
6. **Small Dell clean-ups** (D7 to D9, D13), each a yes or no.
7. **Acer visit when convenient:** A3, A4, then the WSL-role discussion (A2).
8. **Write Build 6** (Windows VS Code, MCP and Claude Code wiring plus the AI platforms audit), then Build 7 (dev-only profile, final verification against the Acer). **Build 8** (`D:\_Anant` and Drive) only after you answer the questions in its plan.

## Stale notes outside this folder (status)
Fixed during the 2026-10-17 pass: [[Installations]], [[Ubuntu - WSL]] (two wrong flashcards), [[WSL Toolkit Config Reference]], the Locked Decisions note. Still historical and out of date on purpose (the live machine wins): [[Old Laptop Decommission Checklist]], `WSL New Laptop Master Plan` and [[WSL Session Briefing]] (their Ollama and "Dell retired" statements are wrong). Two notes in the parent folder are not part of this programme: `Statusline Migration` (an Obsidian plugin prompt filed here by mistake) and the `VS Code - Windows Environment Build Prompt` (Build 6 reads it). [[VS Code - Windows]] still says Docker starts at logon; it does not.

## Logging rule for every session
1. A session writes `Old Laptop Rebuild - Build N <layer> Findings.md` in `Runs/Build N .../`, with a verified outcome, a before and after table, every state-changing command and its result, the root cause of every error, and Growth rules (the standing rule and one check command). It adds one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
2. **One owner per note.** Only the session that closes a build edits this Index and the Runs Index.
3. A prompt is a working document: once its build is closed it is deleted and the findings keep the facts. Quarantines and backups follow the same rule.
4. If Syncthing writes a `*.sync-conflict-*` file, diff it against the live note and merge anything unique before discarding it.
