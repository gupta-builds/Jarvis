---
type: note
status: seedling
created: 2026-10-07
updated: 2026-10-11
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Old Laptop Rebuild - Build 2 Acer Handoff]]"
next: Await stable WSL with the binfmt fix; then recheck systemd and continue Phase 4 from the already-live Tailscale state
---
# Old Laptop Rebuild - Build 2 SSH Runbook

## Gate
This is a planned runbook, not authorization. Every network exposure, service enablement, Tailscale login/admin action, and Phase 4 operation requires the user's explicit approval. Stop at the first failed check. Never run `wsl --shutdown` from inside WSL.

## Phase 4 sequence
| Step | Actor and command/action | Expected check |
|---|---|---|
| 4.1 Preconditions | **Codex, read-only:** verify Build 1 host script and prior 75-second idle PASS; systemd status; listeners 22/2222 in Dell WSL and Windows; Windows `sshd`/Tailscale services; Dell `tailscaled`, `dell-wsl`, `RunSSH=true`. | Rechecked 2026-10-11: Tailscale active and SSH advertised; direct Dell-to-Acer ping; no listeners, no Dell-Windows services, no OpenSSH server. **WAITING PREREQUISITE:** systemd is degraded from sole `systemd-binfmt.service` failure (exit status 1), because WSL 3.0.1 rejects the binfmt registry flush as read-only. User chose to wait for a stable WSL release containing the fix; recheck health when available, then continue Phase 4. |
| 4.2 Optional OpenSSH fallback | **Not yet approved.** Tailscale is already installed and authenticated; do not reinstall it. Read-only check says `openssh-server` is not installed, `sshd` is absent, and `ssh.socket` is not found. First ask if keyed port-2222 fallback is still desired. Only if confirmed and separately approved, **Codex** writes `/mnt/d/WSL/ops/build2-tailscale-ssh-step.sh`; **user with sudo** inspects/runs it. It checks `/dev/net/tun` only if needed, installs OpenSSH (not Tailscale), adds port 2222 and fallback hardening, runs `sshd -t`, accounts for Ubuntu `ssh.socket`, then enables the selected service/socket. | No change until approval. If selected, script exits 0, `sshd -t` succeeds, fallback listens only on 2222; Tailscale continues owning tailnet port 22. |
| 4.3 Tailscale bring-up | **Already done by user:** installed/authenticated on Dell Ubuntu WSL, `sudo tailscale up --ssh --hostname=dell-wsl --accept-dns=false`. **Codex, read-only:** verify status, prefs, route, and interface MTUs. | `dell-wsl`, `RunSSH=true`, active tailscaled. Direct Dell-to-Acer ping returned via `10.5.8.252:41641` in 5 ms. MTUs measured: `tailscale0=1280`, `eth0/eth1=1500`; no manual MTU change. |
| 4.4 Admin console | **After stable WSL gate, user in browser:** Tailscale Admin Console → Machines → `dell-wsl` → confirm key expiry state; then Access controls → inspect actual policy. Do not edit/broaden without the user's direction. | Key expiry is already disabled per user's 2026-10-11 console check. Pending: inspect whether current SSH rule authorizes Acer Windows node `gupta-builds`. No assumption about policy. |
| 4.5 Idle/reachability | **After service/config work, user in Windows PowerShell:** close every WSL terminal, VS Code/Cursor, Docker operation and Codex session. Run `D:\WSL\ops\wsl-idle-test.ps1`. **Codex after session returns:** check tailscaled/SSH and peer status. | Earlier 75-second test passed before Tailscale. This re-test is pending; Ubuntu must remain Running and Dell must remain online after the quiet wait. |
| 4.6 Acer handoff | **Codex:** handoff note updated 2026-10-11 to reflect Tailscale already installed on Acer Windows. **Acer user/Codex:** verify no Tailscale inside Acer WSL and continue the already-installed client test. | Pending Acer WSL placement check and remote execution checks. |
| 4.7 Acer live round trip | **Acer user/Codex, after gate and host-key verification:** run `tailscale ping dell-wsl`; plain `ssh anant_gupta@dell-wsl`; then VS Code Remote-SSH to the canonical repo and run `hostname`, `pwd`, `git status`. Measure large Git transfer separately. | Ping evidence is direct (`via 10.5.8.253:41641`, 54 ms). SSH stopped at first-connect ED25519 prompt, fingerprint not yet verified, so do not accept yet. No remote shell or VS Code test completed. |
| 4.8 Tunnels fallback | **Ask user first.** If approved: user signs in; Codex tests `code tunnel service install` or equivalent and service persistence, with no assumption of background reliability. | Tunnel reachable after logout/restart test, or fallback documented unusable. |
| 4.9 Same-page check | **Codex:** create `~/tools/sync-check`, read-only per repo. It runs `git fetch`, reports branch, ahead/behind and dirty count, plus node/pnpm/python/uv versions. Run locally, then `ssh anant_gupta@dell-wsl '~/tools/sync-check'` from Acer. | Local and SSH reports match. `git fetch` contacts GitHub but does not change working files; no push/merge. |
| 4.10 Directive patch | **Only after approval:** edit `Codebases/internship-research-loop/internship-research-loop-new-laptop-directive.md` under the relevant heading with one dated supersession line and link to Locked Decisions. Leave second-brain gate unchanged. | Diff contains only that line. |
| 4.11 Repo pilot/worktree setting | **Only after approval:** one repo at a time; create `<machine>/<topic>` branch and change only approved editor/toolchain contract. | Review diff, run checks, commit/push/PR only with separate explicit approval. |

## Queued work after Phase 4
After Phase 4, reconcile and schedule the unrun `/mnt/d/WSL/ops/build2-sudo-step.sh` (bubblewrap/socat), Build 2 item 7 repo contract audit and pilot, item 8 editor-server cleanup proposal and approval, item 9 Miniconda package/disk estimate and install approval, and any separately approved Tunnels, sync-check, directive, or repo steps. Then proceed to Builds 3-6 in [[Old Laptop Rebuild - Index]] order. Keep each existing approval gate: no repo edits or Git publication, editor deletion, Miniconda install, sign-in, Windows settings/sync changes, or vault sync changes without the required approval.

## Proposed configuration details
Fallback SSH hardening, only for the keyed OpenSSH fallback: `PasswordAuthentication no`, `KbdInteractiveAuthentication no`, `PermitRootLogin no`, `AllowUsers anant_gupta`, `AllowTcpForwarding yes`; listen on port 2222. Ubuntu 24.04 can use `ssh.socket` activation, so after installing the drop-in, run `sshd -t`, `systemctl daemon-reload`, then enable/restart `ssh.socket` and verify with `ss -ltn`. Tailscale SSH takes tailnet port 22. It authenticates the device through tailnet identity and does not validate a client SSH key pair; any OS user on an allowed tailnet device can connect as the configured WSL account. ACLs therefore need to restrict allowed devices/users tightly.

Tailscale installation/authentication and `tailscale up --ssh` are complete. Key expiry and Access Controls remain user browser actions. Admin path: [Tailscale Admin Console](https://login.tailscale.com/admin) → Machines → `dell-wsl` → row menu → Disable key expiry; then Access controls → inspect policy. Do not add/edit a policy unless the user directs it.

## Phase 4.1 current checklist evidence
- [x] Build 1 host script ran and corrected verifier completed.
- [x] Corrected idle test passed after 75 seconds.
- [ ] Wait for stable WSL 3.0.2 with the binfmt fix, then recheck that `systemd-binfmt.service` succeeds and `systemctl is-system-running` reports healthy. User chose not to accept the degraded state.
- [x] Dell WSL has no listener on port 22 or 2222; Dell Windows services and listeners are absent as of 2026-10-11. Recheck immediately before any fallback change.
- [x] Tailscale is not running on Dell Windows; it is intentionally active only in Dell WSL. Acer placement is Windows-only per R2, and must be read-only checked inside Acer WSL.
- [x] Dell WSL Tailscale is active, `dell-wsl`, `RunSSH=true`; both directions have direct-ping output.
- [x] User reports key expiry is disabled for `dell-wsl`.
- [ ] User checks Access Controls policy and reports whether Acer `gupta-builds` is authorized for SSH.
- [ ] User confirms whether port-2222 OpenSSH fallback is still desired; no service/install change without approval.
- [ ] Acer host key is verified against Tailscale-distributed key; first-connect prompt is currently unaccepted/unverified.
- [ ] Acer plain SSH and VS Code Remote-SSH commands complete; Acer WSL route test remains optional.
- [ ] Re-run idle test after all relevant sessions close.
- [x] User selected wait for stable WSL; no workaround or prerelease is authorized.

## Sources
[Tailscale SSH](https://tailscale.com/docs/features/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/docs/install/windows/wsl2), [Tailscale direct/DERP diagnosis](https://tailscale.com/docs/reference/troubleshooting/network-configuration/derp-routing), [Ubuntu OpenSSH server](https://ubuntu.com/server/docs/openssh-server/), [Ubuntu Noble OpenSSH package files](https://packages.ubuntu.com/noble/all/openssh-server/filelist), [Tailscale key expiry](https://tailscale.com/docs/features/access-control/key-expiry), [VS Code Remote SSH](https://code.visualstudio.com/docs/remote/ssh), [VS Code Tunnels](https://code.visualstudio.com/docs/remote/tunnels).
