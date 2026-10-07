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
  - "[[Old Laptop Rebuild - Build 2 SSH Runbook]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
next: Run only after Dell Phase 4 setup and explicit Acer-side approval
---
# Old Laptop Rebuild - Build 2 Acer Handoff

## Ready-to-run prompt for the Acer Codex session

You are configuring the Acer as a client of the Dell's canonical WSL checkout. Follow the Locked Decisions note. Do not copy or sync code, node_modules, `.venv`, logs, caches, toolchains, or agent state. Do not touch Acer secrets or Jarvis/The Plan vault sync. Do not change Windows VS Code user settings or Settings Sync without approval. Remote-SSH user settings are synced and changes made there can reach the Dell, so inspect and avoid edits to synced user settings unless explicitly approved.

### 1. Confirm Tailscale placement
Tailscale belongs on the Acer Windows side only. Before installation, verify Tailscale is not installed or active inside any Acer WSL distro: `command -v tailscale`, `pgrep -a tailscaled`, `systemctl is-active tailscaled`. If it is installed in WSL, stop and report exact distro/package/service evidence; do not remove it until the user approves. Do not install or run Tailscale in Acer WSL. Install the official Windows Tailscale client only after approval, sign in with the same tailnet account as the Dell, and confirm Windows reports connected.

### 2. Configure plain Windows OpenSSH and VS Code Remote-SSH
Use the Windows OpenSSH executable and no wrapper, ProxyCommand, or WSL Tailscale. Add this host entry to the user's SSH config only with approval:

```sshconfig
Host dell-wsl
    HostName dell-wsl
    User anant_gupta
    ServerAliveInterval 30
    ServerAliveCountMax 3
```

If MagicDNS name resolution fails, obtain the Dell's current tailnet IPv4 with `tailscale ip -4` on the Dell and set `HostName` to that address. Prefer the `dell-wsl` MagicDNS name when it resolves. In VS Code, install/use Remote - SSH, select `dell-wsl`, and open only the canonical paths under `/home/anant_gupta/projects` on the remote host. Do not add remote settings to Acer's synced user settings without approval.

Tailscale docs describe control-plane-distributed host keys and automatic client known-host handling, but do not state the exact first-connect prompt/known_hosts behavior for Windows `ssh.exe`. On first connection, capture the exact Windows prompt/result. Do not blindly accept a host key if the prompt differs from expected Tailscale behavior; stop and report it. This is **to be tested on the Acer**.

### 3. Verify the route and remote execution
From Windows PowerShell on the Acer, run:

```powershell
tailscale status
tailscale ping dell-wsl
ssh anant_gupta@dell-wsl 'hostname; pwd; git -C ~/projects/ai/claude/second-brain-claudekit status --short --branch'
```

Expected: `tailscale ping` reaches `dell-wsl` and reports a direct path when network conditions permit; SSH identifies the Dell WSL user and repository status is from the canonical checkout. In VS Code Remote-SSH, open a terminal and run `hostname`, `pwd`, and `git status`; all should execute on the Dell. Verify Codex extension host/process is remote WSL, not the Acer Windows host.

Run a large but read-only Git transfer check by fetching a substantial repository's refs/objects from GitHub on the Dell and measuring before/after bytes, or use an approved read-only large-object transfer. Do not clone a second working copy for this test. Report transfer size and duration. The live Tailscale path check must show `tailscale ping` direct; if it is relay-only, report that rather than assuming success.

Optional Acer WSL route test: without installing Tailscale inside Acer WSL, run `ssh anant_gupta@dell-wsl 'hostname'` and `tailscale ping dell-wsl` from an Acer WSL terminal. Whether Windows-side Tailscale provides that route to Acer WSL is not established by the docs and is **to be tested on the Acer**. If it fails, do not install Tailscale in Acer WSL and do not create wrappers; report the exact failure and ask the user before revisiting the locked design.

### 4. Inventory the Acer's existing clones
For both `second-brain-claudekit` and `internship-research-loop`, locate every clone and worktree on the Acer, then record path, branch/upstream, ahead/behind, dirty count, untracked files, and dependency/output sizes. Do not delete or overwrite anything. Identify whether each is canonical, a local-only backup, or a worktree. Present a per-path retirement/relabel proposal; retire only after the user approves and verifies needed commits/uncommitted files are protected. GitHub protects pushed commits only, not uncommitted work, ignored dependencies, or logs. Do not touch either vault's sync mechanism.

### 5. Report
Return evidence for: Tailscale Windows connected; no Tailscale inside Acer WSL; `tailscale ping`; plain Windows `ssh.exe`; first-connect host-key behavior; Remote-SSH remote hostname/path; direct-path status; large transfer bytes/time; optional Acer WSL route result; Codex execution location; and full clone/worktree inventory with a safe retirement/relabel proposal. Mention that Remote-SSH user settings are synced and can flow back to the Dell. Do not push, branch, commit, delete, or modify repo files without explicit approval.

## References
[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/kb/1295/install-windows-wsl2), [VS Code Remote SSH](https://code.visualstudio.com/docs/remote/ssh).
