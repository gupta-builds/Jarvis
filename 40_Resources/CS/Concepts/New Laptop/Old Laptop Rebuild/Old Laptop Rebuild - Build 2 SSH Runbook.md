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
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Old Laptop Rebuild - Build 2 Acer Handoff]]"
next: Complete the Tunnel CLI's interactive sign-in and service test, then collect Acer clone inventory, independent host-key check, and remote sync-check output
---
# Old Laptop Rebuild - Build 2 SSH Runbook

## Gate
> Update 2026-10-13: WSL is 3.0.3.0 stable and systemd is `running`; the `systemd-binfmt.service` caveats in the rows below are historical.

This is a planned runbook, not authorization. Every network exposure, service enablement, Tailscale login/admin action, and Phase 4 operation requires the user's explicit approval. Stop at the first failed check. Never run `wsl --shutdown` from inside WSL.

## Phase 4 sequence
| Step | Actor and command/action | Expected check |
|---|---|---|
| 4.1 Preconditions | **Codex, read-only:** verify Build 1 host script and 75-second idle PASS; systemd status; listeners 22/2222 in Dell WSL and Windows; Windows `sshd`/Tailscale services; Dell `tailscaled`, `dell-wsl`, `RunSSH=true`. | Rechecked 2026-10-12: Tailscale active and SSH advertised; no listeners or Dell-Windows services. `systemd-binfmt.service` remains the sole failure from the read-only binfmt flush. User directs continuation with this known degraded condition; stable WSL recheck remains deferred, not a gate. |
| 4.2 Optional OpenSSH fallback | **Not yet approved.** Tailscale is already installed and authenticated; do not reinstall it. Read-only check says `openssh-server` is not installed, `sshd` is absent, and `ssh.socket` is not found. First ask if keyed port-2222 fallback is still desired. Only if confirmed and separately approved, **Codex** writes `/mnt/d/WSL/ops/build2-tailscale-ssh-step.sh`; **user with sudo** inspects/runs it. It checks `/dev/net/tun` only if needed, installs OpenSSH (not Tailscale), adds port 2222 and fallback hardening, runs `sshd -t`, accounts for Ubuntu `ssh.socket`, then enables the selected service/socket. | No change until approval. If selected, script exits 0, `sshd -t` succeeds, fallback listens only on 2222; Tailscale continues owning tailnet port 22. |
| 4.3 Tailscale bring-up | **Already done by user:** installed/authenticated on Dell Ubuntu WSL, `sudo tailscale up --ssh --hostname=dell-wsl --accept-dns=false`. **Codex, read-only:** verify status, prefs, route, and interface MTUs. | `dell-wsl`, `RunSSH=true`, active tailscaled. Direct Dell-to-Acer ping returned via `10.5.8.252:41641` in 5 ms. MTUs measured: `tailscale0=1280`, `eth0/eth1=1500`; no manual MTU change. |
| 4.4 Admin console | **User in browser, completed:** Tailscale Admin Console → Machines → `dell-wsl`; Access controls. | Key expiry is disabled. User pasted the actual `check` rule from `autogroup:member` to `autogroup:self` for nonroot/root users. No policy edit was needed or made. |
| 4.5 Idle/reachability | **User in Windows PowerShell, completed:** after closing every WSL terminal, VS Code/Cursor, Docker operation and Codex session, run `D:\WSL\ops\wsl-idle-test.ps1`. | PASS on 2026-10-12: Ubuntu remained Running for 75 seconds with no WSL call during the wait. Acer then pinged Dell directly. |
| 4.6 Acer handoff | **Codex:** handoff updated 2026-10-12 with existing Acer Windows Tailscale and new SSH evidence. **Acer user/Codex:** inventory local clones/worktrees and read-only check Acer WSL placement if needed. | SSH/Remote-SSH evidence is in; clone inventory and Acer WSL placement/route result remain pending. |
| 4.7 Acer live round trip | **Acer user/Codex, completed for shell and Remote-SSH:** `tailscale ping dell-wsl`; plain `ssh.exe anant_gupta@dell-wsl`; Remote-SSH to the canonical repo. | PASS for workspace path: Acer ping switched to direct `10.5.8.253:41641` in 7 ms; plain SSH and Remote-SSH ran on Dell WSL. The accepted host key still lacks an independent advertised-key comparison; large transfer remains pending. |
| 4.8 Tunnels fallback | **Ask user first.** If approved: user signs in; Codex tests `code tunnel service install` or equivalent and service persistence, with no assumption of background reliability. | Tunnel reachable after logout/restart test, or fallback documented unusable. |
| 4.9 Same-page check | **Codex:** create `~/tools/sync-check`, read-only per repo. It runs `git fetch`, reports branch, ahead/behind and dirty count, plus node/pnpm/python/uv versions. Run locally, then `ssh anant_gupta@dell-wsl '~/tools/sync-check'` from Acer. | Local and SSH reports match. `git fetch` contacts GitHub but does not change working files; no push/merge. |
| 4.10 Directive patch | **Codex, completed in vault:** backed up and patched `Codebases/internship-research-loop/internship-research-loop-new-laptop-directive.md` under `Final completion gate` with one dated supersession line and link to Locked Decisions. | PASS; no live repo file changed, second-brain gate unchanged. |
| 4.11 Repo pilot/worktree setting | **Only after approval:** one repo at a time; create `<machine>/<topic>` branch and change only approved editor/toolchain contract. | Review diff, run checks, commit/push/PR only with separate explicit approval. |

## Queued work after Phase 4
After Phase 4, reconcile and schedule the unrun `/mnt/d/WSL/ops/build2-sudo-step.sh` (bubblewrap/socat), Build 2 item 7 repo contract audit and pilot, item 8 editor-server cleanup proposal and approval, item 9 Miniconda package/disk estimate and install approval, and any separately approved Tunnels, sync-check, directive, or repo steps. Then proceed to Builds 3-6 in [[_Rebuild - Index]] order. Keep each existing approval gate: no repo edits or Git publication, editor deletion, Miniconda install, sign-in, Windows settings/sync changes, or vault sync changes without the required approval.

## Proposed configuration details
Fallback SSH hardening, only for the keyed OpenSSH fallback: `PasswordAuthentication no`, `KbdInteractiveAuthentication no`, `PermitRootLogin no`, `AllowUsers anant_gupta`, `AllowTcpForwarding yes`; listen on port 2222. Ubuntu 24.04 can use `ssh.socket` activation, so after installing the drop-in, run `sshd -t`, `systemctl daemon-reload`, then enable/restart `ssh.socket` and verify with `ss -ltn`. Tailscale SSH takes tailnet port 22. It authenticates the device through tailnet identity and does not validate a client SSH key pair; any OS user on an allowed tailnet device can connect as the configured WSL account. ACLs therefore need to restrict allowed devices/users tightly.

Tailscale installation/authentication and `tailscale up --ssh` are complete. Key expiry and Access Controls remain user browser actions. Admin path: [Tailscale Admin Console](https://login.tailscale.com/admin) → Machines → `dell-wsl` → row menu → Disable key expiry; then Access controls → inspect policy. Do not add/edit a policy unless the user directs it.

## Phase 4.1 current checklist evidence
- [x] Build 1 host script ran and corrected verifier completed.
- [x] Corrected idle test passed after 75 seconds.
- [x] User directs Phase 4 to continue with the known `systemd-binfmt.service` degradation. Recheck after a stable WSL fix; do not use a prerelease or workaround.
- [x] Dell WSL has no listener on port 22 or 2222; Dell Windows services and listeners are absent as of 2026-10-11. Recheck immediately before any fallback change.
- [x] Tailscale is not running on Dell Windows; it is intentionally active only in Dell WSL. Acer placement is Windows-only per R2, and must be read-only checked inside Acer WSL.
- [x] Dell WSL Tailscale is active, `dell-wsl`, `RunSSH=true`; both directions have direct-ping output.
- [x] User reports key expiry is disabled for `dell-wsl`.
- [x] User checked Access Controls: existing own-device SSH rule is in check mode; no policy edit needed.
- [ ] User confirms whether port-2222 OpenSSH fallback is still desired; no service/install change without approval.
- [ ] Independently compare the already-accepted Acer host key against Tailscale's advertised SSH key.
- [x] Acer plain SSH and VS Code Remote-SSH commands completed; Acer WSL route test remains optional and pending.
- [x] Re-run idle test after all relevant sessions close; Ubuntu remained running after 75 seconds.
- [x] Continue with degraded systemd by user direction; no workaround or prerelease is authorized.

## Sources
[Tailscale SSH](https://tailscale.com/docs/features/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/docs/install/windows/wsl2), [Tailscale direct/DERP diagnosis](https://tailscale.com/docs/reference/troubleshooting/network-configuration/derp-routing), [Ubuntu OpenSSH server](https://ubuntu.com/server/docs/openssh-server/), [Ubuntu Noble OpenSSH package files](https://packages.ubuntu.com/noble/all/openssh-server/filelist), [Tailscale key expiry](https://tailscale.com/docs/features/access-control/key-expiry), [VS Code Remote SSH](https://code.visualstudio.com/docs/remote/ssh), [VS Code Tunnels](https://code.visualstudio.com/docs/remote/tunnels).

## Live checkpoint — 2026-10-12
This refresh supersedes the earlier pending rows above where the new evidence is explicit. The user directed Phase 4 to continue while accepting the known systemd degradation; no WSL workaround or prerelease was installed.
| Step | Actor | Current result / exact next action |
|---|---|---|
| 4.1 | **Codex, read-only** | PASS with caveat. `systemctl is-system-running` is still `degraded`; `systemd-binfmt.service` remains the only failed unit. Tailscaled is active and `RunSSH=true`. `wslinfo --networking-mode` is `mirrored`. `ss -ltnp` shows no conventional 22/2222 listener; `sshd`, `ssh`, and `ssh.socket` are absent/inactive. Corrected Dell Windows service/listener query found no Tailscale/OpenSSH service or 22/2222 listener. This known degraded status is recorded, not a claim that systemd is healthy.
| 4.2 | **User decision required** | Optional port-2222 fallback remains uninstalled. Tailscale SSH is working. Confirm whether the fallback is still wanted; do not install OpenSSH or enable a listener until separately confirmed.
| 4.3 | **User already completed; Codex read-only** | PASS. `dell-wsl`, tailnet IPv4 `100.94.129.113`, active Tailscale 1.104.1, `RunSSH=true`; `tailscale0` MTU remains 1280. No guessed MTU change.
| 4.4 | **User in browser, completed** | PASS by user-provided console evidence. Dell key expiry is disabled. Existing SSH rule is `check`, `autogroup:member` to `autogroup:self`, users `autogroup:nonroot` and `root`; no policy edit needed for this own-device pair. General access rule remains `*` to `*`, all ports/protocols. Do not broaden or change it.
| 4.5 | **User in Windows PowerShell, completed** | PASS. Close all WSL/editor/Docker/Codex sessions, then run `powershell.exe -NoProfile -File "D:\\WSL\\ops\\wsl-idle-test.ps1"`. The supplied output shows Ubuntu remained running after 75 seconds with no WSL call during the interval. Afterward Acer ping showed four DERP replies followed by direct `10.5.8.253:41641` in 7 ms.
| 4.6 | **Codex note; user at Acer for inventory** | Handoff is updated with the already-installed Windows Tailscale path. Still run the handoff's read-only scan for existing Acer clones/worktrees of both target repos and return path, branch, dirty/untracked state, and artifact sizes. Do not delete or relabel before review. Optional Acer WSL route remains an observation-only test; never install Tailscale inside Acer WSL.
| 4.7 | **User at Acer** | Plain `ssh.exe anant_gupta@dell-wsl` PASS: output ran `hostname`, `pwd`, and Git status against Dell, showing `/home/anant_gupta` and the canonical second-brain checkout with one existing modified hook. Earlier Remote-SSH terminal evidence also showed the repo root, `id -un`, and Git status on Dell. Direct ping PASS. First-connect key was accepted, but a fingerprint comparison against the Tailscale-advertised key has not been shown; run the handoff's read-only advertised-key check. Large-transfer measurement remains pending and requires a chosen harmless payload/test method.
| 4.8 | **User interactive auth, then Codex verification** | Linux CLI is ready at `~/tools/vscode-tunnel-cli/code` (version 1.141.0). The default `code` command is the Windows executable and must not host this WSL tunnel. `~/tools/vscode-tunnel-cli/code tunnel status` currently reports no tunnel/service; `systemctl --user is-system-running` is `running`. User runs `~/tools/vscode-tunnel-cli/code tunnel --name dell-wsl` and completes the displayed account/device authorization and license prompt. Once it reports a running tunnel, stop the foreground instance with Ctrl+C; then install/test `~/tools/vscode-tunnel-cli/code tunnel service install`. Verify status, service unit, Acer visibility/connectivity, and persistence after the interactive process exits. Uninstall only if the user asks or the service fails and the user elects rollback.
| 4.9 | **Codex created and ran locally; Acer invocation pending** | `~/tools/sync-check` is executable and syntax-checked. It runs `git fetch origin` for only the two shared checkouts, then reports branch, ahead/behind and dirty count plus node/pnpm/Python/uv versions. Local result: second-brain `main`, ahead 0/behind 0, dirty 1; internship `dell-latitude/deadline-quota-and-reseed-fixes`, 6 ahead/5 behind `origin/master`, dirty 26. Acer PowerShell runs `ssh.exe anant_gupta@dell-wsl '~/tools/sync-check'`; compare report. Fetch updates Git remote metadata only, not working files. Dell WSL cannot resolve `dell-wsl` locally because `--accept-dns=false`; use Acer Windows as designed, do not change DNS for this test.
| 4.10 | **Codex, completed in vault** | PASS. A backup was made, and one dated 2026-10-12 supersession line was added to the vault's internship directive under `Final completion gate`. No repo file was edited. Second-brain gate left alone.
| 4.11 | **Waiting exact user approval** | No pilot branch or repo edit. Internship is dirty (26 paths); second-brain has one pre-existing hook change. Identify/audit a clean pilot candidate and approve the exact repo, branch, and files before any repository change. Commits, pushes and PRs remain separately gated.

Systemd status explanation: Phase 4 is proceeding at the user's direction with `systemd-binfmt.service` still degraded. The service is not needed for the Tailscale SSH workflow demonstrated here; no workaround was used. Recheck after a stable WSL fix becomes available, but it is not a prerequisite for the already-proven remote shell path.
