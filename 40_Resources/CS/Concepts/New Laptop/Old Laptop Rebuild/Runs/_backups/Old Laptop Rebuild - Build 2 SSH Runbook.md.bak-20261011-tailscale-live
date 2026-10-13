---
type: note
status: seedling
created: 2026-10-07
updated: 2026-10-07
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Old Laptop Rebuild - Build 2 Acer Handoff]]"
next: Do not execute Phase 4 until the user approves the Phase 3 checkpoint
---
# Old Laptop Rebuild - Build 2 SSH Runbook

## Gate
This is a planned runbook, not authorization. Every network exposure, service enablement, Tailscale login/admin action, and Phase 4 operation requires the user's explicit approval. Stop at the first failed check. Never run `wsl --shutdown` from inside WSL.

## Phase 4 sequence
| Step | Actor and command/action | Expected check |
|---|---|---|
| 4.1 Preconditions | **Codex, read-only:** print checklist: Build 1 host script completed; corrected 75-second idle test passed; systemd active or its degraded `systemd-binfmt` caveat explicitly accepted; systemd running; `ss -ltn` has no listeners on 22/2222; Windows OpenSSH and Windows-side Tailscale are not running. Ask user to paste idle output if unavailable. | Every item verified; if not, stop. Current known caveat is `systemd-binfmt.service` degraded. |
| 4.2 Install services/configure fallback | **Codex:** write `/mnt/d/WSL/ops/build2-tailscale-ssh-step.sh`. **User with sudo:** inspect and run it. Script checks `/dev/net/tun`, installs Tailscale from official apt repo and OpenSSH, creates fallback port 2222 and hardening files, runs `sshd -t`, reloads systemd and enables services. | Script exits 0, `sshd -t` silent/0, `tailscaled` and `ssh.socket` enabled. Tailscale SSH owns tailnet 22; fallback sshd uses 2222. |
| 4.3 Bring up node | **User with sudo/browser login:** first record DNS baseline with `cat /etc/resolv.conf` and `getent hosts <known-host>`. Then `sudo tailscale up --ssh --hostname=dell-wsl --accept-dns=false`. Complete browser authentication. **Codex:** inspect `tailscale status`, `tailscale ip -4`, `ip link show`; repeat DNS checks. | `dell-wsl` online, tailnet IP recorded, DNS unchanged, Tailscale interface MTU observed (expected docs adjustment 1280 to 1340), live `tailscale ping` round trip succeeds. |
| 4.4 Admin console | **User in browser:** Tailscale Admin Console → Machines → `dell-wsl` → three-dot menu → Disable key expiry / Edit key expiry → confirm. Then Access controls → inspect current SSH policy. If policy is needed, add only an SSH rule for the user's own devices and `anant_gupta`; do not paste a broader sample blindly. | Node shows key expiry disabled. User reports whether existing policy suffices or policy was changed. No claim about defaults before inspection. |
| 4.5 Idle/reachability | **User in Windows PowerShell:** close all WSL terminals, VS Code/Cursor windows, Docker operations and Codex sessions. Run `D:\WSL\ops\wsl-idle-test.ps1`. **Codex after session returns:** check `tailscale status`, `systemctl is-active tailscaled`, and SSH health. | Ubuntu still listed Running after 75 seconds without WSL calls; Dell remains online. If failure, stop. |
| 4.6 Acer handoff | **Codex:** write `[[Old Laptop Rebuild - Build 2 Acer Handoff]]`. | Ready-to-run prompt reviewed before Acer actions. |
| 4.7 Acer live round trip | **Acer user/Codex:** follow handoff; Remote-SSH opens canonical Dell repo; execute `hostname`, `pwd`, `git status`, `tailscale ping dell-wsl`; perform large Git transfer test. | VS Code terminal and Git run on Dell WSL; direct Tailscale path; no second checkout used for shared work. If Acer unavailable, mark PENDING and retain exact commands. |
| 4.8 Tunnels fallback | **Ask user first.** If approved: user signs in; Codex tests `code tunnel service install` or equivalent and service persistence, with no assumption of background reliability. | Tunnel reachable after logout/restart test, or fallback documented unusable. |
| 4.9 Same-page check | **Codex:** create `~/tools/sync-check`, read-only per repo. It runs `git fetch`, reports branch, ahead/behind and dirty count, plus node/pnpm/python/uv versions. Run locally, then `ssh anant_gupta@dell-wsl '~/tools/sync-check'` from Acer. | Local and SSH reports match. `git fetch` contacts GitHub but does not change working files; no push/merge. |
| 4.10 Directive patch | **Only after approval:** edit `Codebases/internship-research-loop/internship-research-loop-new-laptop-directive.md` under the relevant heading with one dated supersession line and link to Locked Decisions. Leave second-brain gate unchanged. | Diff contains only that line. |
| 4.11 Repo pilot/worktree setting | **Only after approval:** one repo at a time; create `<machine>/<topic>` branch and change only approved editor/toolchain contract. | Review diff, run checks, commit/push/PR only with separate explicit approval. |

## Proposed configuration details
Fallback SSH hardening, only for the keyed OpenSSH fallback: `PasswordAuthentication no`, `KbdInteractiveAuthentication no`, `PermitRootLogin no`, `AllowUsers anant_gupta`, `AllowTcpForwarding yes`; listen on port 2222. Ubuntu 24.04 can use `ssh.socket` activation, so after installing the drop-in, run `sshd -t`, `systemctl daemon-reload`, then enable/restart `ssh.socket` and verify with `ss -ltn`. Tailscale SSH takes tailnet port 22. It authenticates the device through tailnet identity and does not validate a client SSH key pair; any OS user on an allowed tailnet device can connect as the configured WSL account. ACLs therefore need to restrict allowed devices/users tightly.

Tailscale login and key/ACL edits are user browser actions. Admin paths: [Tailscale Admin Console](https://login.tailscale.com/admin) → Machines → `dell-wsl` → key expiry control; and Access controls → inspect/edit SSH rules. Exact labels may vary slightly with console version.

## Phase 4.1 current checklist evidence
- [x] Build 1 host script ran and corrected verifier completed.
- [x] Corrected idle test passed after 75 seconds.
- [ ] systemd fully healthy; current known `systemd-binfmt.service` failure must be resolved or user explicitly accepts it.
- [ ] Nothing listens on port 22 or 2222; recheck immediately before Phase 4.
- [ ] Windows OpenSSH and Tailscale are not running on Windows; recheck immediately before Phase 4.
- [ ] User approves Phase 4.

## Sources
[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/kb/1295/install-windows-wsl2), [Ubuntu OpenSSH server](https://ubuntu.com/server/docs/openssh-server/), [Ubuntu Noble OpenSSH package files](https://packages.ubuntu.com/noble/all/openssh-server/filelist), [Tailscale key expiry](https://tailscale.com/kb/1028/key-expiry), [VS Code Remote SSH](https://code.visualstudio.com/docs/remote/ssh), [VS Code Tunnels](https://code.visualstudio.com/docs/remote/tunnels).
