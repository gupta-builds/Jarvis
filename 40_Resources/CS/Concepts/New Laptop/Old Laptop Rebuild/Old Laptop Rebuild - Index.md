---
type: note
status: sprout
created: 2026-10-04
updated: 2026-10-12
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[Installations]]"
  - "[[Old Laptop Rebuild - Prompt 1 WSL]]"
next: Finish the approved Phase 4 Tunnel authentication/service test, then close the Acer identity/inventory and remaining explicit fallback/pilot decisions
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) gets rebuilt to match the Acer in sessions run one layer at a time, WSL first, and every session logs what it measured and the rule that stops the same growth from returning.==

## Status
Build 1 WSL Phase 3 executed 2026-10-04 ([[Old Laptop Rebuild - Build 1 WSL Findings]]): 36.424 GiB of verified project artifacts plus 5.304 GiB of native caches reclaimed inside ext4; user-space parity/config applied; `.wslconfig` backed up and aligned for the always-on SSH host.
Update 2026-10-07: WSL 3.0.1.0 is live. Resource/swap verification passed (19 GiB, 10 processors, 8 GiB on `D:\WSL\swap.vhdx`), `wslview` and both mirrored Obsidian endpoints pass. The safe sparse refusal should have been SKIPPED, not fatal; the original idle FAIL was a PowerShell 5.1 decoding bug. Corrected ASCII scripts are under `D:\WSL\ops`, with dated backups. The post-update verifier measured 0 `CheckConnection` events in 120 seconds. The corrected idle test passed: Ubuntu remained Running after 75 seconds with no WSL call during the wait. Systemd is still `degraded` because `systemd-binfmt.service` failed; its only configured Python registration exactly matches one already live, suggesting a duplicate registration, but the unit log rotated away so this remains a hypothesis. Build 2 Phase 2 items 1-6 are now applied and verified; see [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]. Phase 3 checkpoint is ready. Host health is not fully clean until the systemd caveat is understood or accepted. C: has 20.08 GiB free and a 32,247 MB pagefile (6,471 MB peak); D: has 363.80 GiB free. See [[C Drive Bloat - Failure Log and Prevention Rules]].
Update 2026-10-07: WSL 3.0.1.0 is live. Resource/swap verification passed (19 GiB, 10 processors, 8 GiB on `D:\WSL\swap.vhdx`), `wslview` and both mirrored Obsidian endpoints pass. The safe sparse refusal should have been SKIPPED, not fatal; the original idle FAIL was a PowerShell 5.1 decoding bug. Corrected ASCII scripts are under `D:\WSL\ops`, with dated backups. The post-update verifier measured 0 `CheckConnection` events in 120 seconds. The corrected idle test passed: Ubuntu remained Running after 75 seconds with no WSL call during the wait. Systemd is still `degraded` because `systemd-binfmt.service` failed; its only configured Python registration exactly matches one already live, suggesting a duplicate registration, but the unit log rotated away so this remains a hypothesis. Build 2 Phase 2 items 1-6 are now applied and verified; see [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]. Phase 3 checkpoint is ready. Host health is not fully clean until the systemd caveat is understood or accepted. C: has 20.08 GiB free and a 32,247 MB pagefile (6,471 MB peak); D: has 363.80 GiB free. See [[C Drive Bloat - Failure Log and Prevention Rules]].
Update 2026-10-11: Tailscale is installed and authenticated on Acer Windows and Dell Ubuntu WSL. Dell WSL has `dell-wsl`, `RunSSH=true`, active `tailscaled`, Tailscale 1.104.1 stable, full name `dell-wsl.tail0c1d06.ts.net`, and key expiry disabled. Direct ping to Acer `100.84.91.11` returned via `10.5.8.252:41641` in 5 ms. Phase 4.1 read-only recheck: WSL 3.0.1.0, no WSL listeners on 22/2222, `ssh` and `ssh.socket` inactive, OpenSSH server not installed; Dell Windows has no Tailscale/sshd service or 22/2222 listeners. Systemd is degraded only because `systemd-binfmt.service` fails its binfmt flush with `Read-only file system`; WSL issue #41783 states fixed in WSL 3.0.2, which is prerelease. The user chose to wait for stable WSL. Acer ping to Dell was direct (via `10.5.8.253:41641`, 54 ms), but its first SSH host-key prompt remains unverified; no remote command or VS Code Remote-SSH verification has completed. Dell `tailscale0` MTU is 1280; no MTU change was made. See Build 2 Findings and Runbook.
After Phase 4, retain the unrun `/mnt/d/WSL/ops/build2-sudo-step.sh` (bubblewrap/socat) and Build 2 items 7-9; then separately approved Tunnels/sync-check/repo steps; then Builds 3-6 in the sequence above. Preserve the per-item approval gates and do not change either vault's sync.

## Two-laptop workflow (locked direction, 2026-10-04)
The Dell is the canonical host: one checkout per shared repo on its WSL ext4 disk. The Acer connects through VS Code Remote-SSH over Tailscale. Tailscale runs in exactly one place per machine: inside WSL on the Dell (the Tailscale SSH server is Linux/macOS only), and on the Windows side only on the Acer (Remote-SSH uses the Windows `ssh.exe`). Decided 2026-10-04. GitHub stays the backup and PR channel, parallel tasks use git worktrees with `<machine>/<topic>` branches, and no sync daemon touches code. Cost: the Dell must be awake and on the tailnet. Fallback when it is off: the Acer pushes a branch from its own clone. Reasoning: a single copy cannot drift, which is the property the Jarvis sync could not give without constant repair ([[Cross-Laptop Sync - Known Failure Modes and Prevention]]). Network exposure (Tailscale, sshd) needs the user's approval inside the session.

## Settings Sync is live on the Dell
The Acer's cloud copy has landed on the Dell's Windows VS Code, with Acer-only paths in the synced `settings.json`. Anything written to a Windows user-level VS Code file on the Dell reaches the Acer. Build 2 stays out of those files and records findings for the Windows-side build.

## Facts (WizTree scans plus live queries, 2026-10-04)
| Item | Value |
|---|---|
| Machine | Dell Latitude 5530, i7-1255U (10 cores, 12 threads), 32 GB RAM, Intel Iris Xe only, no NVIDIA GPU |
| Disk | One Samsung PM9A1 1 TB NVMe. C: 251.9 GB (28.6 GB free), D: 700 GB (about 366 GB free) |
| C: biggest | Users 128 GB (AppData 100 GB: Local 67.8, Roaming 32.2), Windows 39 GB, pagefile.sys 25.6 GB, Program Files 26 GB |
| Roaming heavy | Claude 10.7 GB, Code 3.4, Jan 3.3, Cursor 2.8, Kiro 2.6, npm 1.8 |
| Local heavy | Programs 15 GB, Spotify 6.2, Vivaldi 5.8, Microsoft 5.0, superwhisper 4.9, npm-cache 4.5 (redirect to D: missed), Packages 3.8, Temp 3.6, hermes 2.3, WisprFlow 1.9, ms-playwright 1.4. `Local/Google` reports a bogus size (Drive virtual files), so skip it when measuring |
| Home folders on C: | vscode-remote-wsl 6.3 GB, miniconda3 7.1 GB, .vscode 4.3, .codex 2.5, codex-cleanup-quarantine-2026-09-20 2.3, .cache 1.4 |
| D: biggest | WSL 176 GB (Ubuntu vhdx 105.4, Installers/wsl-ubuntu.tar 36.7), Docker vhdx 33.8, Games 86 (Elden Ring rar 67), $RECYCLE.BIN 32.5 (about 21 GB of Rust target dirs), ollama-models 9.2 |
| WSL | Kernel 5.15.167.4 (old). .wslconfig: mirrored, 16 GB, 8 CPUs, no swap setting |

## Findings that change the plan
- **There is no discrete GPU.** "Use the GPU" means the Iris Xe only. CUDA, NVIDIA container tooling and GPU-passthrough tuning do not apply. Heavy local-model work belongs on the Acer.
- **The pagefile warning has a visible cause.** Windows reports `D:\pagefile.sys` as the configured pagefile (system-managed, `AutomaticManagedPagefile` off), but no pagefile exists on D:. The live one is a 25.6 GB `C:\pagefile.sys`. The likely story is that Windows cannot create the D: file at boot, falls back to a temporary C: file, and shows the "pagefile" pop-up. This is a hypothesis for the Windows-host session to confirm in the event log. The fix is an explicit, sized pagefile configuration, not another reboot.
- **WSL swap defaults to C:.** No `swapfile=` setting exists, the same bug the Acer notes record.
- **Jarvis MCP needs mirrored networking.** From WSL, `127.0.0.1:27123` is Obsidian on Windows only in mirrored mode ([[VS Code - MCP and Secrets]]). The statement in [[Ubuntu - WSL]] that NAT alone forwards localhost both ways is only true from Windows to WSL, so the Dell keeps mirrored.
- **A past quarantine sits on C:.** `codex-cleanup-quarantine-2026-09-20` (2.3 GB) is on the drive being freed.
- **Running `wsl --shutdown` from inside a WSL session kills the session.** Host steps go in a script the user runs.

## Session sequence
1. WSL layer ([[Old Laptop Rebuild - Prompt 1 WSL]]): audit, `.wslconfig`, tool parity, WSL-side cleanup, Jarvis log.
2. Build 2 (WSL VS Code and the two-laptop SSH workflow): see [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]].
3. Build 3, Windows C: cleanup, Google Drive mirror, D: baseline and Windows-side WSL host settings (pagefile, AppData, Temp and crash dumps, quarantine, startup and tasks, Defender exclusions, D: offload). Prompt in [[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]], run with the WizTree screenshots attached. Executed 2026-10-12 and closed in [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] (C: free 39.5 to 136 GB, C: and D: structure contract, weekly clean and daily watch tasks).
4. Acer dotfile snapshot: exported 2026-10-11 into `Old Laptop Rebuild/Acer Dotfile Snapshot/` (with its `_scripts`), so terminal configs are copied from the Acer instead of rebuilt from notes. Build 4 uses it.
5. Build 4, scripted Windows toolkit on both laptops (PowerShell 7, Windows Terminal, Starship, fonts, shared config hashes, WSL config parity from the snapshot) plus a catalog and agent guide for AI tools. Same note; the Dell inventory is the "Old Laptop" section of [[Installations]].
6. Build 5, Windows VS Code and MCP wiring (extensions 39/34, settings, MCP registry), with the stale Acer paths from Build 2's findings.
7. Build 6, dev-only profile and a final verification pass against the Acer.

## Logging rule for every session
Each session writes `Old Laptop Rebuild - Build N <layer> Findings.md` here, with a before/after size table, every state-changing command, the root cause of every error, and a Growth rules section (the standing rule and one check command per thing that grew).

## Dated campaign amendment — 2026-10-11
Phase 4 remains **in progress** while waiting for a stable WSL release containing the `systemd-binfmt` fix. The user's choice is to wait for stable; this is not a pause of the phase or campaign. WSL 3.0.1.0 remains live and degraded only because the binfmt flush is read-only; do not install the prerelease or apply a workaround. Follow the detailed live facts and item-by-item ledger in [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]].

Current handoff: The user has directed Phase 4 to continue with the known `systemd-binfmt.service` degradation; no workaround or prerelease update was applied. On 2026-10-12 the corrected 75-second idle test passed, Acer Tailscale ping switched from DERP to direct, and plain Acer Windows SSH executed commands against Dell's canonical checkout. Earlier Acer Remote-SSH terminal evidence also showed the Dell WSL repo, user and path. Key expiry is disabled and the pasted Access Controls policy permits member-to-own-device SSH in check mode. Still pending: independent comparison of the already accepted SSH host key against Tailscale's advertised key, Acer clone/worktree inventory, approved harmless large-transfer measurement, Acer invocation of `~/tools/sync-check`, and VS Code Tunnel interactive authentication plus persistent-service test. The optional keyed port-2222 fallback still needs a direct yes/no decision. Phase 4.10's dated line is in the vault directive. Phase 4.11 pilot needs exact repo/change approval; no branch or repo edit has been made. Then the unrun bubblewrap/socat sudo script and Build 2 items 7-9 remain. Builds 3-6 remain in this Index's stated order. See the 2026-10-12 checkpoint in Build 2 Findings and Runbook.

Live 2026-10-11 disk/service refresh: WSL `/` has 901 GiB free; C: 39.46 GiB free; D: 363.80 GiB free. Tailscale ping first used DERP and later went direct, so route is variable; no MTU change. No listeners on 22/2222 or Dell Windows Tailscale/OpenSSH service were observed. Current editor/Codex processes prevented an idle-test rerun. Historical 2026-10-07 duplicate-Python-registration hypothesis is superseded: latest journal evidence is the read-only `binfmt_misc` flush failure described in Build 2 findings.

## Campaign amendment — 2026-10-12
The stable-WSL wait is no longer a gate to the demonstrated SSH workflow. The user explicitly directed Phase 4 to continue while recording the sole `systemd-binfmt.service` read-only-flush failure as a known degraded condition. Do not apply an unsafe workaround or install a prerelease. The idle test passed for 75 seconds and the Acer reconnected afterward by direct Tailscale path; plain Windows SSH reached the canonical Dell WSL checkout, and prior Remote-SSH terminal evidence confirmed the same. Phase 4 remains incomplete until its listed authentication, Acer inventory/transfer, same-page SSH invocation, and approval-gated choices are closed.
