---
type: note
status: seedling
created: 2026-10-07
updated: 2026-10-12
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 1 WSL Findings]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
next: Complete the user-authenticated VS Code Tunnel service test, obtain Acer clone inventory and transfer evidence, then seek exact approval for the optional OpenSSH fallback and repo pilot
---
# Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings

## One-Line Answer
==WSL-side VS Code parity is applied; the Acer has reached the Dell's canonical repo by plain SSH and Remote-SSH, and the post-idle Tailscale route returned direct. Remaining Phase 4 gates are the tunnel service test, Acer inventory/transfer evidence, and explicit choices for fallback SSH and the repo pilot.==

## Scope and status
Phase 2 items 1 through 6 are applied. Tailscale runs on Dell WSL and Acer Windows only, and Dell Tailscale SSH is active. On 2026-10-12, user-provided output confirmed the 75-second idle test passed, Acer `tailscale.exe ping dell-wsl` reached the direct endpoint, and plain Acer `ssh.exe` ran a Git status command on Dell. Earlier Acer Remote-SSH terminal output showed the canonical Dell WSL repo, user, path and Git status. Systemd remains degraded only on the known `systemd-binfmt.service` read-only flush; the user directed continuation without an unsafe workaround or prerelease update. The admin policy allows member-to-own-device SSH in check mode; key expiry is disabled. Do not alter the existing uncommitted hook or the internship repo's dirty worktree. No Windows user-level VS Code setting, Settings Sync control, WSL config, OpenSSH service, or editor data was changed.

## Before and after

> [!NOTE] Build 5 correction, 2026-10-13
> bubblewrap 0.9.0 is installed; only `socat` was missing, and `31-wsl-sudo-step.sh` installs it. Miniconda, ruff, shellcheck and shfmt are installed (Build 5).

| Area | Before | After / evidence |
|---|---|---|
| Remote WSL settings | Machine settings file absent | `~/.vscode-server/data/Machine/settings.json` created; JSON read-back valid; bash profile, Python activation, Linux interpreter, Jupyter exclusions, watcher exclusions, sandbox off |
| WSL extensions | 25 | 34 target extensions; stale entries removed, full C/C++ pack removed intentionally; final CLI count 34 |
| Shell environment | No vscode-env files/block | init, template, guarded Bash block, home workspace env/settings created; `bash -n` passed |
| Warm shell startup, 5 runs | Disabled: 0.44, 0.34, 0.34, 0.35, 0.36 sec | Enabled: 0.34, 0.38, 0.37, 0.35, 0.34 sec; median 0.35 sec both |
| Global Git config | Six requested keys absent | pull.rebase true; push.autoSetupRemote true; fetch.prune true; rerere.enabled true; core.autocrlf input; init.defaultBranch main |
| Global Git ignore | Absent | Eight named secret patterns installed and read back |
| Claude read safety | Two existing deny rules | Existing rules preserved; Acer-named file/path Read denials added; JSON valid |
| Claude user MCPs | jarvis, the-plan, jarvis-fs were project scope only | Three user-scope entries; `cd /tmp && claude mcp list` reports all connected |
| System-level packages | bubblewrap/socat absent | Not installed; `/mnt/d/WSL/ops/build2-sudo-step.sh` prepared for user, not run |
| Miniconda | No `~/miniconda3` directory found | Not installed; root has 902 GiB free and D: 364 GiB free. Rebuild cost is not estimated because the package-list dry-run from the referenced WSL note has not been performed; retain approval gate. |
| Tailscale | Not installed at Build 2 checkpoint | User installed/authenticated on Dell WSL and Acer Windows. Dell `tailscaled` active; `dell-wsl.tail0c1d06.ts.net`, `RunSSH=true`, Tailscale 1.104.1 stable; admin console shows key expiry disabled; peer ping to Acer direct. |

Backups made before edits: `~/.bashrc.build2-20261007.bak`, `~/.gitconfig.build2-20261007.bak`, `~/.claude/settings.json.build2-20261007.bak`, `~/.claude.json.build2-20261007.bak`, and `~/.mcp.json.build2-20261007.bak`. New target files had no previous version. JSON validation (`jq empty`) and shell syntax validation (`bash -n`) passed. Existing `gh auth git-credential` remains; no plaintext credential helper was added. Secrets were not printed.

## State-changing commands and errors
Commands applied in WSL after dated backups:
| Change | Command or action | Result |
|---|---|---|
| Global Git behavior | `git config --global pull.rebase true`; `push.autoSetupRemote true`; `fetch.prune true`; `rerere.enabled true`; `core.autocrlf input`; `init.defaultBranch main` | All six values read back correctly |
| Global secret ignore | Wrote `~/.config/git/ignore` and set `core.excludesfile` to it | All eight patterns read back; no credential values |
| VS Code settings/env | Wrote remote Machine settings, vscode-env init/template, guarded `.bashrc` block, and `~/.vscode` home-workspace files | JSON and shell checks passed |
| Claude deny rules | Backed up then edited `~/.claude/settings.json` | JSON valid; two existing rules preserved |
| Claude MCP scope | Backed up then edited `~/.claude.json`; left `~/.mcp.json` content unchanged | From `/tmp`, all three desired user servers connect |
| WSL extension set | `code --install-extension <id>` for missing target IDs; `code --uninstall-extension <id>` for stale IDs | Final count 34 |
| Sudo package work | Wrote executable `/mnt/d/WSL/ops/build2-sudo-step.sh` | Not run; user must run it when convenient |

The first VS Code CLI command failed because the shell inherited a stale `VSCODE_IPC_HOOK_CLI` socket path. Root cause: the CLI targeted a dead IPC socket even though the current server had live sockets. Re-running with the live socket path succeeded. Installing Jupyter auto-installed `ms-toolsai.vscode-jupyter-cell-tags` and `ms-toolsai.vscode-jupyter-slideshow`; both were removed because they are not in the target list. The stale C/C++ extension pack was removed as a whole, not as an individual pack member. No repeated failure remains. A final `claude mcp list` from `/tmp` confirmed the three requested MCPs connected. Unrelated pre-existing user/plugin entries also reported `gbrain` connection closed (cause not established), `pencil` executable missing at an old Cursor extension path, and several remote servers needing authentication. These were not edited; smallest next diagnostic is a targeted `claude mcp get gbrain`/`claude mcp get pencil` and inspect the corresponding launch path, without printing credentials.

## Build 1 gate and host status

> [!NOTE] Build 5 correction, 2026-10-13
> WSL 3.0.3.0 (stable, 2026-10-09) fixed the `systemd-binfmt` read-only flush (WSL issue 41783). Live: `systemctl is-system-running` is `running` with zero failed units. Every statement below that says systemd is degraded, or that waits for a stable release, is closed; no prerelease and no workaround was installed.

The user's corrected idle-test output is PASS: after Ubuntu was started, the test made no WSL call for 75 seconds, then `wsl -l --running --quiet` listed Ubuntu. This exceeds the default 60-second VM idle timer. The prior FAIL was the Windows PowerShell 5.1 output decoding bug documented in Build 1 findings, not a stopped distro. The sparse conversion refusal was Microsoft’s potential-corruption safeguard. The host script design incorrectly made an optional sparse conversion fatal; the safe refusal is now recorded as SKIPPED and independent checks continue.

The post-update host report checked config/start, memory, processors, swap, and `wslview`; `wslview --version` works. It counted zero `CheckConnection` journal events over 120 seconds. On 2026-10-11, Phase 4.1 read-only recheck returned `systemctl is-system-running=degraded`; the sole failed unit is `systemd-binfmt.service`, `Result=exit-code`, `ExecMainStatus=1`. The live journal gives the exact line `Failed to flush binfmt_misc rules, ignoring: Read-only file system`. The unit then exits nonzero. Its current one-shot operation is to reset and register Linux `binfmt_misc` handlers. Microsoft issue [WSL #41783](https://github.com/microsoft/WSL/issues/41783) documents this exact WSL 3.0.1 behavior: systemd tries to clear handlers by writing `-1` to `/proc/sys/fs/binfmt_misc/status`; WSL rejects that flush because the registry is kernel-global/read-only in this context, then the unit exits with an error. A Microsoft WSL maintainer closed the issue as fixed in WSL 3.0.2. The [3.0.2 release listing](https://github.com/microsoft/WSL/releases/tag/3.0.2) currently labels it pre-release. No workaround was attempted; the user chose to wait for a stable release.

The practical current impact is bounded and measured: systemd PID 1 is still managing the distro, but reports `degraded`; `systemd-binfmt.service` is a one-shot boot setup unit, not a long-running daemon. The failed operation is its attempt to flush all binfmt rules. Microsoft's reproducer says configured rules are then registered but the unit still exits nonzero. This Dell's kernel currently shows enabled `WSLInterop` (`/init`, `MZ`) and `python3.12` (`/usr/bin/python3.12`) handlers, and the only binfmt config found was the Python 3.12 registration. `cmd.exe /c ver` succeeded, native Python launched successfully, and earlier `wslview --version` passed. No current loss of Windows interop, native Linux executable launch, or configured Python handler was observed. A future workload depending on some other custom format handler could be affected if its registration is absent, but none is configured here. This failure does not mean the WSL distro, SSH/Tailscale daemon, or ordinary Linux processes have stopped. The `cmd.exe` smoke test printed the normal UNC-current-directory warning and then defaulted to the Windows directory; command exit was 0, unrelated to binfmt.

Build 1's corrected 75-second idle test passed, but Phase 4.5 must repeat after service configuration and every WSL/editor/Docker/Codex session is closed. Phase 4 remains in progress while waiting for a stable WSL release containing the fix; do not clear the failure, make a service override, or install a prerelease workaround.

### Phase 4.1 read-only recheck, 2026-10-11
| Check | Evidence | Result |
|---|---|---|
| WSL host/version | `wsl.exe --version`: WSL 3.0.1.0, kernel 6.18.40.1-1 | PASS |
| Tailscale Dell WSL | `systemctl is-active tailscaled` active; `tailscale status` lists `dell-wsl`; `tailscale debug prefs` has `RunSSH=true` | PASS |
| Dell to Acer path | `tailscale ping 100.84.91.11`: pong from `gupta-builds` via `10.5.8.252:41641`, 5 ms | PASS, direct endpoint form |
| WSL SSH listeners | `ss -ltnp`: no port 22 or 2222 listener | PASS |
| OpenSSH fallback | `openssh-server` reports not installed; `sshd` missing; `ssh.socket` unit not found; `ssh` and `ssh.socket` inactive | NOT INSTALLED, approval still required |
| Dell Windows services/listeners | PowerShell: `sshd` and `Tailscale` services absent; no listeners on 22/2222 | PASS |
| Systemd | `systemctl is-system-running` returned `degraded`; only failed unit `systemd-binfmt.service`, exit status 1; WSL 3.0.1 rejects the global binfmt flush as read-only | GATE, user chose to wait for stable WSL fix |
| Idle test | Previously passed 75 seconds; not rerun because current WSL/editor sessions are active | PRIOR PASS; Phase 4.5 pending |

User-provided Acer evidence: `tailscale ping dell-wsl` returned `pong ... via 10.5.8.253:41641 in 54ms`, which is the direct endpoint form, not `via DERP(...)`. Acer Windows OpenSSH then displayed a first-connect prompt for `dell-wsl (100.94.129.113)` with ED25519 fingerprint `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`. The user has not reported accepting it or completing authentication. The host-key fingerprint is unverified: do not accept until compared against the Dell host key distributed through Tailscale's control plane. This observed prompt resolves part of the earlier uncertainty: plain Windows `ssh.exe` did prompt on this first connection despite the docs' general managed-known-hosts description. It does not prove an attack; exact cause is unknown. No `hostname`, `pwd`, Git status, or Remote-SSH test has completed.

Exact Acer terminal output provided by the user:
```text
tailscale ping dell-wsl
pong from dell-wsl (100.94.129.113) via 10.5.8.253:41641 in 54ms

ssh anant_gupta@dell-wsl
The authenticity of host 'dell-wsl (100.94.129.113)' can't be established.
ED25519 key fingerprint is SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

The measured Dell interface MTUs are `tailscale0=1280`, `eth0=1500`, `eth1=1500`, `loopback0=1500`. Default route is via `eth1`. No MTU was changed. Tailscale documents a WSL adjustment from 1280 to 1340 in a specific default-interface condition; the observed `tailscale0` value alone is not proof that the documented condition applies here. Follow the documented diagnostic on the relevant interface and test data-path sizes; do not guess a manual MTU.

## Questions Q1 to Q6

### Q1. Acer Windows Tailscale to Dell WSL Tailscale SSH
Tailscale SSH documentation says a tailnet device can connect to a Linux SSH server using the node's MagicDNS name or Tailscale IP. It uses tailnet node identity and control-plane-distributed host keys, with Tailscale client integration arranging known-host handling. Windows is a supported Tailscale client platform. Thus Windows-side Tailscale supplies the route to plain Windows `ssh.exe`; VS Code Remote-SSH can use that executable without a wrapper or ProxyCommand. Use `ssh anant_gupta@dell-wsl` after the node is named `dell-wsl`; if MagicDNS does not resolve, use the live `tailscale ip -4` address. The fully-qualified `.ts.net` name can be read from the admin device page if desired.

The Acer test now supplies the first-connect evidence: stock Windows `ssh.exe` displayed a normal unknown ED25519 host-key prompt for `dell-wsl (100.94.129.113)` with fingerprint `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`. The user has not accepted it. This differs from the docs' general managed-known-host description; the cause is not established. Do not accept until matching the fingerprint against the host key advertised by Tailscale's control plane. Once that is done, re-run the plain `ssh` test. The optional Acer WSL terminal route remains untested. No wrapper, ProxyCommand, or Acer-WSL Tailscale is proposed. Sources: [Tailscale SSH](https://tailscale.com/docs/features/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/docs/install/windows/wsl2).

### Q2. Tailscale inside mirrored WSL
**PARTIAL.** Tailscale is active in Dell mirrored WSL and Acer Windows. User evidence shows direct Tailscale ping in both directions. Dell `tailscale0` is MTU 1280; other active interfaces are 1500. The end-to-end SSH and large transfer checks remain incomplete, so mirrored-mode Tailscale functionality is not fully verified. No manual MTU change was made. Follow Tailscale's documented check for the default interface and verify actual data transfer before deciding whether there is a defect.

### Q3. Personal tailnet SSH ACL
**PENDING USER CONSOLE CHECK.** Do not assume the personal tailnet's current policy either allows or blocks SSH. User must open Tailscale Admin Console → Access controls and inspect the existing policy's `ssh` rules. If needed, add only the smallest rule the user directs. Do not broaden or edit the policy without explicit direction. The Acer's SSH client currently shows an unverified host-key prompt, but no accepted-key/authentication result.

### Q4. pnpm global virtual store and repo use
Installed pnpm is `10.33.2`; `pnpm config get enableGlobalVirtualStore` returns `undefined` because it is not currently configured. The installed version supports the setting `enableGlobalVirtualStore` (introduced in pnpm 10.12.1). The Locked Decisions note's newer spelling `virtualStoreType: global` is not the setting to use with pnpm 10.33.2; pnpm's current docs describe that newer spelling for pnpm 11.23+. This is a correction to propose in the locked note before dependency configuration is approved. Source: [pnpm 10 settings](https://pnpm.io/10.x/settings), [pnpm node_modules settings](https://pnpm.io/settings/node-modules).

Live root package/lockfile inventory confirms pnpm projects in `~/projects/hub/Assisto_website`, `Learning-Tracker-Tool`, and `portfolio`. The live second-brain checkout is `~/projects/ai/claude/second-brain-claudekit`; it has no root `package.json`, `pnpm-lock.yaml`, or `pnpm-workspace.yaml`. Do not apply pnpm settings to second-brain. Any virtual-store/worktree proposal must be limited to projects that actually use pnpm and be applied only after approval.

### Q5. uv cache and project filesystem
`uv cache dir` resolves to `/home/anant_gupta/.cache/uv`. The cache directory itself does not exist yet; its existing parent is on `/dev/sdd`, device ID 2096. The five discovered `pyproject.toml` project roots are also on `/dev/sdd`, device ID 2096: `code2prompt-python`, `ecc`, `ecc/skills/skill-comply`, `CausalOps`, and `tradingview`. Thus cache and each current uv project resolve to the same filesystem/device. `internship-research-loop` is not a live uv project root; the older note claiming its uv conversion is stale. Evidence was obtained using `df` on each resolved path. No uv cache setting was changed.

### Q6. Codex IDE in WSL and Acer-over-SSH
The live WSL process is the Codex extension's Linux binary under `~/.vscode-server/extensions/openai.chatgpt-26.1002.51308-linux-x64/.../codex`, launched as `app-server`. This is direct process evidence that the WSL extension runs Codex on the WSL remote host, not through the Windows Codex binary. With Acer Remote-SSH into this Dell, the extension host remains the Dell's WSL VS Code Server, so execution location does not change. The Acer handoff must verify the actual extension placement after connection.

## WSL 3.0.1, mirrored network, sparse conversion
The live WSL is 3.0.1.0, kernel `6.18.40.1-1`, WSLg `1.0.79`. Current `.wslconfig` has `[wsl2] vmIdleTimeout=-1`, `[general] instanceIdleTimeout=-1`, `[experimental] autoMemoryReclaim=gradual`, `sparseVhd=true`, and `networkingMode=mirrored`. Microsoft's current [WSL configuration reference](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) documents those keys in those sections. The host script's post-update start/config check passed, and resource/swap checks matched configuration. This is evidence the live distro accepted the configuration sufficiently to start and operate, though the 3.0.1 release notes do not individually certify each key. See [WSL 3.0.1 release notes](https://github.com/microsoft/WSL/releases/tag/3.0.1).

`wsl.exe --manage --help` is invalid syntax. `wsl.exe --help` lists `--set-sparse` and `--compact`, but does not list `--allow-unsafe`. The safe conversion output explicitly says sparse VHD support is disabled due to potential corruption and describes `--allow-unsafe` as a force override. This proves the current request was guarded on this machine; it does not prove whether that guard is build-specific or a standing policy. Never recommend the override.

Mirrored-mode parity on WSL 3.0.1 is partially established: Dell-to-Acer and Acer-to-Dell Tailscale pings both returned direct endpoint paths (IP:port, not `DERP(...)`). SSH authentication, large transfer behavior, and a completed SSH remote session are still pending, so do not mark the workflow fully verified. The Dell `tailscale0` reports MTU 1280; `eth0` and `eth1` report 1500, and default route is via `eth1`. No guessed MTU change was made. Follow the [documented WSL check](https://tailscale.com/docs/install/windows/wsl2) on its stated interface and verify with an actual data transfer. `CheckConnection` was 0 over one 120-second sample, compared to Build 1's 5/hour old-build sample. This is not enough for a trend or causal conclusion. Treat a reduced rate as a hypothesis until a comparable longer sample is taken; do not change networking based on this single reading.

## Windows-side findings for Build 3
No Windows user-level file or sync setting was changed. The synced settings contain Acer-only paths: Todo Tree points beneath `C:\Users\anant\...`; Python project paths beneath `D:\_Anant\...`; interpreter path resolves to a Windows `.venv/Scripts/python.exe`. Dell paths are `C:\Users\Anant Gupta` and `D:\Users\_Anant`. Windows VS Code is at `C:\Users\Anant Gupta\AppData\Local\Programs\Microsoft VS Code\Code.exe`; the Windows extension folder is `%USERPROFILE%\.vscode\extensions`. Windows has 40 extensions; WSL remote now has 34. The pre-sync backup showed the old PowerShell default shell, Python activation false, PowerShell/cmd/Git Bash profiles, Linux remote SSH host, hybrid auto-forwarding, format-on-save, Biome default formatter, pnpm package manager, and trust setting. `settingsSync.ignoredSettings` is absent from the current settings file.

Actual WSLENV is not empty as the 2026-10-04 snapshot claimed: current decoded Windows value is `ELECTRON_RUN_AS_NODE/w:`. This is a live contradiction to carry into Build 3. Microsoft documents machine-scoped `machine` and `machine-overridable` settings as excluded from sync and remote extensions as not synced ([VS Code Settings Sync](https://code.visualstudio.com/docs/configure/settings-sync)). Path-specific keys to consider excluding or converting to machine scope are `todo-tree.ripgrep.ripgrep`, `python-envs.pythonProjects`, and `python.defaultInterpreterPath`. VS Code's settings schema marks `settingsSync.ignoredSettings` itself as disallowed from the ignored list; its cross-device behavior should be tested before relying on it. Do not edit or sync any Windows file in this build.

## Corrections older notes need

> [!NOTE] Build 5 correction, 2026-10-13: the six corrections below were applied or re-verified
> 1. pnpm key `enableGlobalVirtualStore`: written into Locked Decisions, Decision 7.
> 2. second-brain checkout: live path is `~/projects/ai/claude/second-brain-claudekit` on the Dell (`ai/second-brain-claudekit` on the Acer); no root package manifest. Written into Decision 4.
> 3. internship-research-loop is not a live uv project (no `pyproject.toml` in the checkout). Written into Decision 4.
> 4. WSLENV is `ELECTRON_RUN_AS_NODE/w:` (not empty): recorded here, no other note relied on the empty value.
> 5. The Acer `ssh.exe` did show an unknown-host prompt; the fingerprint comparison with Tailscale's advertised key is still WAITING USER.
> 6. `settingsSync.ignoredSettings` is absent: Settings Sync stays live; Build 6 validates it.

List for later editing; older notes were not edited here:
1. Locked Decisions: pnpm 10.33.2 uses `enableGlobalVirtualStore`; do not prescribe `virtualStoreType: global` unless pnpm is upgraded to a version that supports it.
2. Clone notes: second-brain has no root package manifest/lockfile; confirm this is the live nested checkout path and avoid pnpm settings there.
3. Internship repo notes: live repo is not currently a uv project root; remove stale claim that it is already converted unless a `pyproject.toml` is added later.
4. Build 1 snapshot: WSLENV is currently `ELECTRON_RUN_AS_NODE/w:`, not empty.
5. WSL/Tailscale notes: Acer Windows `ssh.exe` did show an unknown-host ED25519 prompt on first connect; its fingerprint is not yet matched to the Tailscale-distributed host key. Acer WSL's route through Windows Tailscale remains untested.
6. Settings Sync notes: `settingsSync.ignoredSettings` is absent and should not be assumed to be machine-local; validate its sync behavior in the Windows build.

## Phase 3 proposals
### Editor-server cleanup list, approval required
Re-check immediately before any deletion that no VS Code, Cursor, or container editor is attached. Nothing has been deleted.
| Area | Current measured candidates | Proposed targeted action after approval |
|---|---|---|
| `~/.vscode-server` (7.74 GiB at Build 1 audit) | 1.75 GiB cached VSIX; stale extension versions and logs | Enumerate current server hashes, live process attachments, extension IDs/versions and log age/size. Keep active server/hash and current 34 extensions. Remove only specifically identified superseded VSIX/log files after approval. |
| `~/.cursor-server` (3.57 GiB) | 1.14 GiB snapshots and old extensions | Identify active Cursor processes/hash and snapshot ownership; present exact snapshot/extension paths and sizes; no blanket cache deletion. |
| `~/.vscode-remote-containers` (1.03 GiB) | Nine old hashes | Map each hash to running/known container server process and mtime; propose only orphaned hashes with exact sizes. |

### Repo contract and pilot
Repo audit for `.vscode/`, `extensions.json`, `.editorconfig`, pins and lockfiles is not started. Proposed pilot: `~/projects/hub/CausalOps` only if a fresh read-only check confirms clean status, no active worktree/session, an existing lockfile and a simple missing editor contract. It currently has `backend_setup...origin/backend_setup` with clean status, but branch choice and any repo edit require approval. Alternative clean repos need the same screening. The two protected target repos currently have user work and are not pilot candidates. No branch, commit, file, or worktree was created.

Worktree dependency proposal after Q4/Q5: use per-worktree dependency installs only where supported by the repo's manager; for pnpm 10.33.2 evaluate `enableGlobalVirtualStore=true` only on actual pnpm repos, then measure cross-device (already same device for uv) and verify isolated package state before adoption. Keep `node_modules`, `.venv`, logs, and build outputs out of sync; never share mutable virtual environments by filesystem links. This remains a proposal, not a change.

### Miniconda and editor capacity
No Miniconda install or environment rebuild was started. Existing space/disk measurements and the package cost decision belong to the subsequent approved item 9. User approval is required before installation.

## Phase 4 checkpoint — live refresh 2026-10-12

> [!NOTE] Build 5 correction, 2026-10-13
> Ledger rows 4.4, 4.9 and 4.10 below are stale: later sections show them passed. Row 4.1's systemd caveat is closed by WSL 3.0.3.0.

> [!NOTE] Build 5 correction, 2026-10-13
> WSL 3.0.3.0 (stable, 2026-10-09) fixed the `systemd-binfmt` read-only flush (WSL issue 41783). Live: `systemctl is-system-running` is `running` with zero failed units. Every statement below that says systemd is degraded, or that waits for a stable release, is closed; no prerelease and no workaround was installed.

| Step | Status | Evidence and remaining work |
|---|---|---|
| 4.1 Preconditions | PASS with known systemd caveat | Live WSL reports `degraded`; the sole failed unit remains `systemd-binfmt.service`. `tailscaled` is active, `RunSSH=true`, networking mode is mirrored, and WSL has no conventional listener on 22/2222. A corrected Windows PowerShell query returned no Dell Windows Tailscale/OpenSSH services or 22/2222 listeners. The user chose to continue Phase 4 without a workaround or prerelease update. |
| 4.2 OpenSSH fallback | WAITING USER DECISION | `sshd` and `ssh.socket` are inactive/not installed; no listener on 22/2222. The primary Tailscale SSH path now works. Ask if the optional keyed port-2222 fallback is still wanted before writing/running its sudo script. |
| 4.3 Tailscale | PASS | User already installed and authenticated Tailscale on Dell WSL and Acer Windows, set Dell `dell-wsl` with `RunSSH=true`, and disabled Dell key expiry. Live Dell-to-Acer `tailscale ping -c 2 100.84.91.11` returned directly via `10.5.8.252:41641` in 16 ms. No installation or `tailscale up` repeated. |
| 4.4 Admin console | PASS, user-provided | The user pasted the active SSH policy: `autogroup:member` to `autogroup:self`, users `autogroup:nonroot` and `root`, action `check`; general access remains allow-all. The Acer `gupta-builds` and Dell `dell-wsl` are the user's own devices. No policy changed or broadened. Key expiry is disabled per the user. |
| 4.5 Idle/reachability | PASS, user-provided | After closing WSL/editor/Codex sessions, `wsl-idle-test.ps1` reported Ubuntu still running after 75 seconds with no WSL command during the wait. The Acer then pinged Dell through DERP initially and directly via `10.5.8.253:41641` in 7 ms. |
| 4.6 Acer handoff | HANDOFF READY; inventory pending | Acer is on Windows Tailscale; its earlier PowerShell showed no WSL distro name and Windows `ssh.exe`/`tailscale.exe`. Acer-side scan of old repo clones and the optional Acer-WSL route check have not been returned. Do not retire any clone until the inventory and preservation review are complete. |
| 4.7 SSH/Remote-SSH | PASS for working path; transfer pending | New plain `ssh.exe` output ran `hostname`, `pwd`, and `git status` against Dell: `DESKTOP-3VBG0JH`, `/home/anant_gupta`, `## main...origin/main`, and the pre-existing modified hook. Earlier user-provided Acer Remote-SSH terminal output verified the same canonical repository, user and WSL path. No large-transfer measurement yet. The first key was accepted, but the user has not shown an independent comparison against Tailscale's advertised SSH host-key fingerprint; verify that now from Acer Windows before treating host identity as independently validated. |
| 4.8 VS Code Tunnel | CLI ready; authentication/service pending | Downloaded the official Linux standalone CLI 1.141.0 to `~/tools/vscode-tunnel-cli/code`; `tunnel --help` works, `tunnel status` reports no active tunnel/service, and `systemctl --user is-system-running` reports `running`. The ordinary WSL `code` command resolves to the Windows VS Code CLI, so do not use it to host a Dell WSL tunnel. User must authenticate interactively with the Linux CLI before installing/testing its service. |
| 4.9 Same-page check | Local PASS; Acer SSH invocation pending | Created executable `~/tools/sync-check`. Local run fetched only the two named shared repos and reported Node 24.14.1, pnpm 10.33.2, Python 3.12.3, uv 0.12.23. `second-brain-claudekit`: `main`, ahead 0/behind 0, dirty count 1 (the existing hook). `internship-research-loop`: `dell-latitude/deadline-quota-and-reseed-fixes`, 6 ahead/5 behind `origin/master`, dirty count 26. The `git fetch` updated Git remote metadata only. Acer must run `ssh.exe anant_gupta@dell-wsl '~/tools/sync-check'` and return the report. From Dell, `ssh ...@dell-wsl` cannot resolve because this node was brought up with `--accept-dns=false`; do not alter DNS for this test. A self-connection to Dell's own Tailscale IP returned connection refused, so it is not a valid substitute for the Acer-side SSH run. |
| 4.10 Internship directive | PASS | Backed up and patched the vault directive under `Codebases/internship-research-loop/` with one dated supersession line and link to Locked Decisions. The live repo copy is absent at the named path, and its worktree is already dirty; no live repo file was touched. The second-brain completion gate remains unchanged. |
| 4.11 Repo pilot | WAITING USER APPROVAL | No branch or repo edit was made. The internship checkout is dirty (26 paths) and has no upstream configured; its fetched head is 6 ahead/5 behind `origin/master`. The second-brain checkout has its pre-existing modified hook. Refresh the read-only candidate audit and obtain exact repo/change approval before selecting a clean pilot. |

### Changes made in this checkpoint
| Item | Before | After |
|---|---|---|
| Same-page checker | `~/tools/sync-check` absent | Created with mode 0700, `bash -n` passes; reports the two shared repos and four tool versions. `git fetch origin` updates remote metadata only. |
| Linux Tunnel CLI | No standalone Linux CLI; `code` resolves to Windows VS Code | Downloaded the official `cli-alpine-x64` archive to a temporary directory, extracted version 1.141.0 to `~/tools/vscode-tunnel-cli/code`, and set mode 0700. Tunnel status remains empty; no account sign-in or tunnel service yet. |
| Internship directive | No single-host supersession line | Dated 2026-10-12 line added under `Final completion gate` in the vault note after a backup. The similarly named live repo file does not exist at the specified path; its worktree is dirty and was not edited. |
| Runbook, handoff, findings, Index, session log | Last updated 2026-10-11 | Dated backups created before updating the phase ledger and recording user-provided evidence. No Windows VS Code settings, Tailscale policy, SSH service, WSL config, or repo source file changed. |

Commands/actions with state effects: created and `chmod 700`'d `~/tools/sync-check`; that script ran `git fetch origin` on the two named repos (fetch metadata only); downloaded/extracted the standalone Linux CLI and set its executable mode; copied dated backups of the five checkpoint notes/log; patched the vault internship directive and checkpoint notes. No commit/push, branch change, package installation requiring sudo, sign-in, service enablement, VHDX/config edit, or editor cleanup occurred.

### Errors during this checkpoint
- A first Windows PowerShell service/listener query failed because shell quoting corrupted `$_` inside `Where-Object`; the corrected single-quoted PowerShell command ran and returned no matching Windows services/listeners.
- `code tunnel --help` through the default WSL `code` command did not reach a Linux CLI. `type -a code` showed it resolves to the Windows VS Code application; the separate Linux CLI was installed for the Dell WSL host instead.
- The attempted official `cli-linux-x64` download URL returned HTTP 404. The current official Remote Tunnels documentation's standalone example uses `cli-alpine-x64`; downloading and running that archive succeeded at version 1.141.0.
- Plain `ssh anant_gupta@dell-wsl` from Dell WSL failed DNS resolution. Root cause is this WSL node was deliberately started with `--accept-dns=false`; MagicDNS resolution is available on Acer Windows and must be tested there.
- `tailscale ssh` to Dell's own tailnet IP returned `connect: connection refused`. This self-dial is not the Acer-to-Dell test; the Acer's supplied plain SSH result succeeds. Cause of the self-dial behavior is not established, so it is not generalized to peer connections.

## Growth Rules
| Growth source | Standing rule | One check command |
|---|---|---|
| VS Code server size and hashes | Keep only active server hashes; inventory before deletion and require no attached editor | `du -sh ~/.vscode-server; find ~/.vscode-server/bin -mindepth 1 -maxdepth 1 -type d -printf '%f %TY-%Tm-%Td\n'` |
| WSL extension count | Keep the reviewed shared WSL set; record count after install-loop changes | `code --list-extensions --show-versions | wc -l` |
| Worktrees and dependencies | One active session per branch; per-worktree installs; never delete worktrees/dependencies without approval | `git -C ~/projects/<repo> worktree list --porcelain; find ~/projects -xdev -type d \( -name node_modules -o -name .venv \) -prune -exec du -sh {} +` |
| Logs | Keep bounded logs and inspect age/size before cleanup | `find ~/.vscode-server/data/logs -type f -printf '%s %TY-%Tm-%Td %p\n' | sort -nr | head -30` |
| Tailscaled and sshd health | Keep Dell `tailscaled` active; install/enable keyed `sshd` on 2222 only if user reconfirms the fallback | `systemctl is-active tailscaled; systemctl is-active ssh ssh.socket 2>/dev/null; ss -ltn | rg ':(22|2222)\b'` |
| Tailscale key expiry | User confirmed expiry disabled for `dell-wsl`; preserve this state and recheck after node recreation | `tailscale status --json | jq -r '.Self | [.DNSName,.KeyExpiry] | @tsv'` |
| Repo ahead/behind drift | Fetch, report branch tracking and ahead/behind; do not auto-merge/push | `git -C ~/projects/<repo> fetch --quiet && git -C ~/projects/<repo> status --short --branch` |

## C: handoff line
2026-10-07: C: is 93% used with about 20.08 GiB free; pagefile allocation is 32,247 MB with 6,471 MB peak. D: has 363.80 GiB free. Do not shrink D:-resident Ubuntu VHDX to solve C: pressure; no C: data changed. See [[C Drive Bloat - Failure Log and Prevention Rules]].

## Remaining queue after the systemd gate and Phase 4
No failure workaround or unsafe WSL change is authorized. WSL 3.0.2 is currently prerelease and the user chose to wait for a stable build with the binfmt fix. When a stable update is available, recheck the failed unit and systemd health, then continue Phase 4 with the Access Controls check, verified Acer host key, SSH/Remote-SSH, and the idle test after closing every WSL/editor/Docker/Codex session. The keyed port-2222 fallback remains in locked R3, but this live audit found OpenSSH absent; confirm it remains desired before separately approved installation. After Phase 4, reconcile and schedule the pending bubblewrap/socat sudo script, Build 2 item 7 repo audit/pilot, item 8 editor-server cleanup proposal and approval, item 9 Miniconda disk/package estimate and install approval, optional Tunnels and sync-check/repo actions with their own gates, then Builds 3-6 in [[Old Laptop Rebuild - Index]] order.

## Dated live refresh and campaign ledger — 2026-10-11
Phase 4 is **in progress**, not paused: the user chose to wait for a stable WSL release containing Microsoft's binfmt fix. The system update is a waiting prerequisite; independent preparation and the wider campaign continue. Current official release page still labels WSL 3.0.1 latest stable and 3.0.2 prerelease; issue #41783 is closed as fixed in 3.0.2. Live Dell WSL remains 3.0.1.0, `systemctl is-system-running=degraded`, with only `systemd-binfmt.service` failed because flushing `binfmt_misc` returns `Read-only file system`. No workaround or prerelease installation was made.

Live refresh facts: `tailscaled` active, Tailscale 1.104.1, `RunSSH=true`, Dell `100.94.129.113`, Acer Windows `100.84.91.11`, `/dev/net/tun` present, `tailscale0` MTU 1280. Ping route varied: first `via DERP(ord)` then a later ping went direct via `10.5.8.252:41641`; direct connectivity is observed, but the route is not consistently direct. No WSL listeners on 22/2222 and no Dell Windows Tailscale/OpenSSH service/listener. WSL DNS lookup of the two node short names returned no records; use Tailscale CLI evidence, not assumed MagicDNS resolution. No MTU change. Acer SSH fingerprint remains unverified; no login/Remote-SSH. Active VS Code Server and Codex processes mean the idle test was not rerun. Measured `/` free 901 GiB, D: free 363.80 GiB, C: free 39.46 GiB; these are current reads, not historical screenshot baselines. The editor folders are currently approximate sizes (`~/.vscode-server` 4.5G, `~/.cursor-server` 3.6G, `~/.vscode-remote-containers` 1.1G); active editor processes were found, so no cleanup. Windows services, ports, and space were inspected read-only.

The Acer snapshot is present at `Acer Dotfile Snapshot/`, dated 2026-10-11; MANIFEST reports 39 exported files and hashes, with the expected redaction notes. VERSIONS records exact WSL tool versions, but several Windows tool versions remain path-only/not independently captured. Use the snapshot as Build 4's source of truth and verify it remains available in the vault when that Windows session starts.

| Build/item | Initial status | Action/evidence | Status | Approval or owner | Next action |
|---|---|---|---|---|---|
| B2 P4.1 systemd gate | Waiting stable fix | WSL 3.0.1.0; sole failure is read-only binfmt flush; upstream fix is in 3.0.2 prerelease | WAITING USER | User chose stable release | Recheck official stable release and live unit; continue Phase 4 when stable update is available |
| B2 P4.2 optional OpenSSH fallback | Absent | No `sshd`, `ssh.socket`, or 22/2222 listener on Dell WSL; no Dell Windows service/listener | WAITING USER | User decision/approval | Confirm omit or approve hardened tailnet-only fallback; then reviewed sudo script and test |
| B2 P4.3 Tailscale bring-up | User completed | Live Tailscale 1.104.1, active `tailscaled`, `dell-wsl`, `RunSSH=true`; Dell IP verified; no reinstallation or `tailscale up` repeated | PASS | User action already authorized for that exact command | Keep state; no unrelated service/network changes |
| B2 P4.4 key expiry | User-reported disabled | User's 2026-10-11 console report says key expiry is disabled for `dell-wsl`; not independently inspected in this read-only refresh | PASS (user-reported) | User browser report | Keep recorded as user-observed; recheck if node is recreated or key state changes |
| B2 P4.4 SSH access policy | Not inspected | Actual policy has not been viewed; no default or ACL behavior assumed | WAITING USER | User browser | Inspect the existing SSH rule and report whether `gupta-builds` is authorized; do not edit/broaden without direction |
| B2 P4.5 idle/reachability | Prior PASS | 75-second Build 1 idle PASS; current editor/Codex sessions active | WAITING USER | User closes all sessions and runs Windows script | After service work, close all WSL/editor/Docker/Codex sessions; run `D:\WSL\ops\wsl-idle-test.ps1` and return output; no WSL calls during wait |
| B2 P4.6 Acer handoff / placement | Handoff note exists | Acer Windows is intended Tailscale host; current Acer WSL placement has not been checked in this session | WAITING USER | User at Acer | Read-only verify no Tailscale inside Acer WSL; continue Windows-side tests only |
| B2 P4.7 Acer live round trip | Partial | User Acer ping was direct; Windows SSH stopped at unverified ED25519 prompt `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`; no SSH/Remote-SSH completed | WAITING USER | User at Acer + trusted Tailscale key evidence | Compare key before acceptance; then run ping, SSH, Remote-SSH and verify hostname/pwd/canonical repo/status/Git location |
| B2 P4.7 meaningful Git transfer | Not tested | No transfer run | WAITING USER | Explicit user approval | Present transfer contents/size and before/after evidence plan; run only after approval |
| B2 P4.8 Tunnels fallback | Not tested | Sign-in/service install not authorized | WAITING USER | User approval | Present exact plan; no install/sign-in until approved |
| B2 P4.9 same-page sync-check | Not run | `~/tools/sync-check` includes `git fetch`; no fetch approval | WAITING USER | User approval | Review script and obtain exact sync-check/fetch approval before execution |
| B2 P4.10 internship directive superseded-by | Pending | Live directive read; no edit | WAITING USER | Repo-note approval | Propose exact superseded-by amendment; edit only after approval; leave second-brain gate unchanged |
| B2 P4.11 repo pilot/worktree | Pending | CausalOps remains proposed, not approved; pnpm 10.33.2 uses `enableGlobalVirtualStore`; uv same-filesystem constraint documented | WAITING USER | User approval per repo/change | Refresh status/contracts/pins/lockfiles/config, present minimal manifest and exact pilot diff; no fetch, mutation, branch, or worktree without approval |
| B2 item 7 repo contract/pilot | Pending | Same P4.11 pilot remains unapproved; deeper repo audit is queued after Phase 4 checkpoint | WAITING USER | User approval per repo/change | Do the read-only contract/pin/lockfile/editor-config audit, then present exact pilot proposal; no repo edits or branch creation without approval |
| B2 editor-server cleanup (item 8) | Pending | Approx sizes above; active VS Code/Codex attachment; exact hash/handles inventory incomplete | WAITING USER | User approval | Immediately before cleanup, collect exact paths/bytes/hashes/references/open handles and attached editors; itemize targets; delete only after approval |
| B2 Miniconda (item 9) | Pending | Acer `jupyter-base` spec exists; Dell Miniconda absent at earlier checkpoint; no current dry-run cost estimate | WAITING USER | User decision/approval | Reconfirm decision; estimate package list, target disk, and size only; install/env creation only after approval |
| B2 sudo bubblewrap/socat | Script written, unrun | `/mnt/d/WSL/ops/build2-sudo-step.sh` is 462 bytes; exact contents were reviewed; no package verification | WAITING USER | User runs with sudo | After Phase 4 checkpoint, user runs `sudo bash /mnt/d/WSL/ops/build2-sudo-step.sh`; verify packages and sandbox remains disabled |
| Build 3 Dell Windows/storage | Read-only audit exists; actions pending | Seven WizTree screenshots and prior read-only findings are recorded; live C: 39.46 GiB and D: 363.80 GiB free; no mutation in this WSL session | WAITING USER | User in Windows PowerShell; Tier A approval still separate | Re-measure and follow Build 3 prompt; run approved ASCII scripts only; capture before/after and growth rules |
| Build 3 Tier A regenerable cleanup | Proposed, not approved | Exact paths/groups and sizes remain in Build 3 findings; group authorization requires user phrase `go A` | WAITING USER | User approval | Re-measure exact targets and affected drive; present complete list; act only after `go A` |
| Build 3 Tier B personal/app data | Proposed, itemized approvals required | Installed apps, profile data, quarantine, remote WSL server, VM/model/game/installer data and executables are separately approval-gated | WAITING USER | User per item | Recheck target, size, references/open handles; present exact item and wait per-item |
| Build 3 Tier C protected data | Protected / leave alone | Windows system trees, WSL VHDX, Docker disk, vaults, game saves, unknown-purpose data remain out of cleanup scope absent their specified separate approval | NOT APPLICABLE | User if scope is ever changed | No action in current Build 3; Docker prune never without separate approval |
| Build 3 pagefile and crash-dump configuration | Diagnostic PASS; changes pending | Elevated diagnostic ran 2026-10-11; D: auto-unlock via external `.BEK` is a hypothesis for boot-time pagefile failure. Staged plan is C: 16,384 MB + D: 32,768 MB, reboot/test, then C: 4,096 MB only if D: works | WAITING USER | User approval and Windows reboot | Reconfirm exact sizes/commit margin and approve Stage 1; verify after reboot before Stage 2; never shrink C: if D: fails |
| Build 3 Temp, caches, editors, quarantine | Mixed Tier A/B/C | Findings classify exact targets; WSL VHDX and broad AppData are protected; editor server and quarantine are Tier B | WAITING USER | User approvals by tier/item | Re-measure target-specific paths and open handles; proceed only within its tier |
| Build 3 Docker and WSL VHDX | Protected | `D:\WSL\Ubuntu\ext4.vhdx` and Docker disk cannot be altered/pruned without their specified approval | WAITING USER | Explicit separate user approval | Inventory only; no prune, compact, move, or delete absent exact approval |
| Build 3 D: folders/offloads and Google Drive scope | Design/review pending | Prompt requires review of installer tar, game archive, recycle-bin contents, Docker/model files and actual Drive scope; Acer vaults must stay outside this code-host workflow | WAITING USER | User review; account sign-in/out is separately gated | Inspect exact paths and app UI; present plan; no sign-in/out or move before approval |
| Build 3 startup, scheduled tasks, Defender exclusions | Review-only proposals pending | Includes `ConversationCapture-Backfill-WSL`; exclusions are security-impacting and tasks are item-by-item | WAITING USER | User decision per task/exclusion | Inventory and explain impact; run only explicitly approved entries; recheck after each group |
| Build 3 findings and Growth rules | Not completed | Prior findings include baseline but no final after-measurement or all recurring checks | WAITING USER | User Windows session | Record before/after per drive/group, commands/errors/causes, Drive design and one verified check command per growth source |
| Acer dotfile snapshot | Previously pending | Snapshot directory, MANIFEST, VERSIONS and SHA-256 logs are present, dated 2026-10-11 | PASS | No approval for read-only snapshot | Use it for Build 4; note Windows exact-version gaps and verify availability at session start |
| Build 4 Windows terminal parity | Not started | Snapshot available; Build 3 must precede it | WAITING USER | User in Windows PowerShell | Inventory first; use snapshot, label any note-derived config, back up every file and gate installs/replacements/default changes |
| Build 4 D1-D12 decisions and toolkit | Phase 2 design exists; decisions still open | Existing Build 4 Findings enumerates D1 Node, D2 uv, D3 Miniconda, D4 Git line endings, D5 terminal scheme/font, D6 profile block, D7 WSL configs, D8 Ollama, D9 PowerShell in WSL, D10 lint tools, D11 update policy, D12 Windows-only tools | WAITING USER | User decisions before scripts | Review each recommendation; then use ASCII preflight/install/apply/verify scripts with backups, hashes and drive-cost evidence; Build 3 first |
| Build 4 Acer execution and catalog | Design only | Snapshot has known profile-path/font/version limitations; Acer Windows/WSL actions require Acer session | WAITING USER | User at Acer and approval for each gate | Preflight profile path and versions; run only after Dell toolkit decisions and Build 4 checks |
| Build 5 Windows VS Code/MCP | Not started | Settings Sync can propagate to Acer; no Windows user-level changes made | WAITING USER | User approval | Inventory/back up; present exact sync impact; approve settings/extensions/MCP/sign-in separately; validate without secrets |
| Build 5 Windows VS Code user settings and sync | Not started | Settings Sync is active and may propagate Dell changes to Acer | WAITING USER | Explicit user approval | Compare current state; identify exact settings file/diff and Acer sync impact; backup before edit |
| Build 5 Windows/WSL extension sets | Not started | Windows and WSL extension sets differ; extension pack removal can uninstall members | WAITING USER | Explicit user approval for changes | Inventory independently; propose exact install/remove list; do not modify pack entries inadvertently |
| Build 5 MCP registry/endpoints/auth | Not started | MCP registry/sign-in can affect synced Windows setup; secrets must remain unprinted | WAITING USER | Explicit user approval | Backup, present exact registry impact, approve each change/sign-in; verify endpoints by name/status only |
| Build 6 final parity | Not started | Acer/Dell matrix incomplete | WAITING USER | User and both machines | Verify every layer; mark PASS/DIFF/UNKNOWN; do not claim parity for UNKNOWN rows |
| Build 6 comparison dimensions | Not started | WSL/tooling; Windows storage/host; terminal tools/config hashes; Windows/WSL VS Code and MCP; canonical repo; Tailscale/SSH; editor execution location; Growth rules | WAITING USER | Both machines and user | Record each dimension as PASS/DIFF/UNKNOWN with evidence; reconcile every remaining ledger item |
| GitHub fetch/push, branches, commits and PRs | Deferred but retained | No such operation performed | WAITING USER | Separate explicit approvals | Keep each repo-specific operation separately gated; never infer authorization from access-path approval |
| Kubernetes/AI infrastructure | Out of scope | No installation or enablement | NOT APPLICABLE | Separate future project | Mention only as proposed follow-on |

### Growth Rules — refreshed checks
| Growth source | Check command |
|---|---|
| C: and D: free space (Windows) | `Get-Volume -DriveLetter C,D | Select DriveLetter,Size,SizeRemaining` |
| WSL root and mounted D: | `df -hT / /mnt/d` |
| Editor server footprint | `du -sh ~/.vscode-server ~/.cursor-server ~/.vscode-remote-containers` |
| Active listeners and tailnet daemons | `systemctl is-active tailscaled ssh ssh.socket 2>/dev/null; ss -ltnp` |
| WSL distro/VHDX growth (Windows) | `Get-Item D:\WSL\Ubuntu\ext4.vhdx,D:\WSL\swap.vhdx | Select FullName,Length,LastWriteTime` |
| Repo dependency/worktree growth | `git -C ~/projects/<repo> worktree list --porcelain; find ~/projects -xdev -type d \( -name node_modules -o -name .venv \) -prune -exec du -sh {} +` |
