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
  - "[[Old Laptop Rebuild - Build 2 SSH Runbook]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
next: After stable WSL 3.0.2 resolves systemd-binfmt, verify the advertised Dell SSH host key before accepting the Acer Windows OpenSSH prompt
---
# Old Laptop Rebuild - Build 2 Acer Handoff

## Ready-to-run prompt for the Acer Codex session

You are configuring the Acer as a client of the Dell's canonical WSL checkout. Follow the Locked Decisions note. Do not copy or sync code, node_modules, `.venv`, logs, caches, toolchains, or agent state. Do not touch Acer secrets or Jarvis/The Plan vault sync. Do not change Windows VS Code user settings or Settings Sync without approval. Remote-SSH user settings are synced and changes made there can reach the Dell, so inspect and avoid edits to synced user settings unless explicitly approved.

### 1. Confirm Tailscale placement
Tailscale belongs on the Acer Windows side only. The user reports that the official Windows client is already installed, authenticated to the same admin-console account as Dell, and registered as Windows node `gupta-builds` (`100.84.91.11`). Do not reinstall or sign out. Before connecting, read-only verify Tailscale is not installed/active inside any Acer WSL distro. If it is installed in WSL, stop and report exact distro/package/service evidence; do not remove it without approval. Do not install or run Tailscale in Acer WSL.

The user reports Dell `dell-wsl` is online at `100.94.129.113`, Tailscale 1.104.1 stable, SSH advertised, and key expiry disabled. Full MagicDNS name is `dell-wsl.tail0c1d06.ts.net`. No SSH policy assumption is made; the Access Controls policy still needs inspection.

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

Observed on 2026-10-11: Acer Windows `ssh anant_gupta@dell-wsl` showed a first-connect prompt for `dell-wsl (100.94.129.113)`, ED25519 fingerprint `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`. No acceptance/authentication result was reported. **Do not type `yes` until the offered fingerprint is independently matched to the SSH host key distributed through Tailscale's control plane.** At the prompt, cancel with Ctrl+C or answer `no` for now. A host-key prompt does not itself prove an attack, but it is not verified.

After the gate and Access Controls review, from Acer Windows PowerShell inspect the peer's published SSH host key:

```powershell
$status = tailscale status --json | ConvertFrom-Json
$dell = $status.Peer.PSObject.Properties.Value | Where-Object {
    $_.DNSName -like 'dell-wsl*' -or $_.TailscaleIPs -contains '100.94.129.113'
}
$dell | Select-Object DNSName, TailscaleIPs, SSH_HostKeys
```

If an `ssh-ed25519` key is present, compute its fingerprint locally and compare it exactly to the offered `SHA256:...` value before accepting. If the key is absent or does not match, do not accept; report the output and stop for policy/key investigation. Do not work around this with a wrapper or ProxyCommand. Tailscale's SSH docs describe managed host keys generally, while the Tailscale CLI source shows those advertised keys being used to populate a managed known-hosts file; the exact behavior of this Windows `ssh.exe` invocation needs this live validation. [Tailscale SSH docs](https://tailscale.com/docs/features/tailscale-ssh) · [Tailscale CLI source](https://github.com/tailscale/tailscale/blob/main/cmd/tailscale/cli/ssh.go).

### 3. Verify the route and remote execution
After the fingerprint matches the key advertised by Tailscale and the user explicitly accepts it, from Windows PowerShell on the Acer run:

```powershell
tailscale status
tailscale ping dell-wsl
ssh anant_gupta@dell-wsl 'hostname; pwd; git -C ~/projects/ai/claude/second-brain-claudekit status --short --branch'
```

Evidence already received: `tailscale ping dell-wsl` returned `pong from dell-wsl (100.94.129.113) via 10.5.8.253:41641 in 54ms`. Tailscale documents an IP:port endpoint as a direct path, whereas a DERP relay is shown as `via DERP(...)`; this is direct-path evidence. [Tailscale connection diagnosis](https://tailscale.com/docs/reference/troubleshooting/network-configuration/derp-routing). SSH has not completed yet. After key verification, SSH should identify the Dell WSL user and show repository status from the canonical checkout. In VS Code Remote-SSH, open a terminal and run `hostname`, `pwd`, and `git status`; all should execute on the Dell. Verify Codex extension host/process is remote WSL, not Acer Windows.

Run a large but read-only Git transfer check by fetching a substantial repository's refs/objects from GitHub on the Dell and measuring before/after bytes, or use an approved read-only large-object transfer. Do not clone a second working copy for this test. Report transfer size and duration. The live Tailscale path check must show `tailscale ping` direct; if it is relay-only, report that rather than assuming success.

Optional Acer WSL route test: without installing Tailscale inside Acer WSL, run `ssh anant_gupta@dell-wsl 'hostname'` and `tailscale ping dell-wsl` from an Acer WSL terminal. Whether Windows-side Tailscale provides that route to Acer WSL is not established by the docs and is **to be tested on the Acer**. If it fails, do not install Tailscale in Acer WSL and do not create wrappers; report the exact failure and ask the user before revisiting the locked design.

### 4. Inventory the Acer's existing clones
For both `second-brain-claudekit` and `internship-research-loop`, locate every clone and worktree on the Acer, then record path, branch/upstream, ahead/behind, dirty count, untracked files, and dependency/output sizes. Do not delete or overwrite anything. Identify whether each is canonical, a local-only backup, or a worktree. Present a per-path retirement/relabel proposal; retire only after the user approves and verifies needed commits/uncommitted files are protected. GitHub protects pushed commits only, not uncommitted work, ignored dependencies, or logs. Do not touch either vault's sync mechanism.

### 5. Report
Return evidence for: Tailscale Windows connected; no Tailscale inside Acer WSL; `tailscale ping`; plain Windows `ssh.exe`; verified first-connect host-key behavior; Remote-SSH remote hostname/path; direct-path status; large transfer bytes/time; optional Acer WSL route result; Codex execution location; and full clone/worktree inventory with a safe retirement/relabel proposal. Mention that Remote-SSH user settings are synced and can flow back to the Dell. Do not push, branch, commit, delete, or modify repo files without explicit approval.

## References
[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/kb/1295/install-windows-wsl2), [VS Code Remote SSH](https://code.visualstudio.com/docs/remote/ssh).
