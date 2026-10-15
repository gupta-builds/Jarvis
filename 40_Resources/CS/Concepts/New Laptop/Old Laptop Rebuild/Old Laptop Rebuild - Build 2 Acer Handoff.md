---
type: note
status: seedling
created: 2026-10-07
updated: 2026-10-15
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Build 2 SSH Runbook]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
next: Independently compare the already-accepted Acer SSH host key, inventory Acer clones/worktrees, and run ~/tools/sync-check over SSH
---
# Old Laptop Rebuild - Build 2 Acer Handoff

## Ready-to-run prompt for the Acer Codex session

You are configuring the Acer as a client of the Dell's canonical WSL checkout. Follow the Locked Decisions note. Do not copy or sync code, node_modules, `.venv`, logs, caches, toolchains, or agent state. Do not touch Acer secrets or Jarvis/The Plan vault sync. Do not change Windows VS Code user settings or Settings Sync without approval. Remote-SSH user settings are synced and changes made there can reach the Dell, so inspect and avoid edits to synced user settings unless explicitly approved.

### 1. Confirm Tailscale placement
Tailscale belongs on the Acer Windows side only. The user reports that the official Windows client is already installed, authenticated to the same admin-console account as Dell, and registered as Windows node `gupta-builds` (`100.84.91.11`). Do not reinstall or sign out. Before connecting, read-only verify Tailscale is not installed/active inside any Acer WSL distro. If it is installed in WSL, stop and report exact distro/package/service evidence; do not remove it without approval. Do not install or run Tailscale in Acer WSL.

The user reports Dell `dell-wsl` is online at `100.94.129.113`, Tailscale 1.104.1 stable, SSH advertised, and key expiry disabled. Full MagicDNS name is `dell-wsl.tail0c1d06.ts.net`. The user inspected Access Controls: the existing SSH rule is `check` from `autogroup:member` to `autogroup:self` as `autogroup:nonroot`/`root`; no policy edit was made.

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

Observed: Acer Windows `ssh anant_gupta@dell-wsl` initially showed a first-connect prompt for `dell-wsl (100.94.129.113)`, ED25519 fingerprint `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`. The user entered the displayed fingerprint and it was added to `known_hosts`; this proves acceptance, not an independent comparison with Tailscale's advertised host key. Do not remove or rewrite `known_hosts`. Run the read-only advertised-key comparison below and stop if the fingerprint differs or is unavailable.

The user's first connection showed an ED25519 fingerprint and they accepted the displayed fingerprint. That is not an independent verification. Complete the read-only advertised-key comparison in Step 3; do not edit `known_hosts`.

### 3. Verify the route and remote execution
Current Acer evidence: `tailscale.exe ping dell-wsl` returned several DERP replies, then a direct `via 10.5.8.253:41641 in 7ms`. Plain `ssh.exe` completed and ran hostname, path, and Git status commands on Dell, showing `anant_gupta`, `/home/anant_gupta`, and the canonical checkout. Earlier Remote-SSH terminal output also showed the repository root and Dell WSL kernel. The single modified `.codex/hooks/session-wrapup.ps1` is pre-existing user work; do not reset, stash, stage, commit, or otherwise alter it.

Run the remaining identity comparison in Acer PowerShell:

```powershell
$status = tailscale.exe status --json | ConvertFrom-Json
$peer = $status.Peer.PSObject.Properties.Value | Where-Object {
    $_.DNSName -like 'dell-wsl*' -or $_.TailscaleIPs -contains '100.94.129.113'
}
$keyFile = Join-Path $env:TEMP 'dell-wsl-tailnet-hostkeys.pub'
$peer.SSH_HostKeys | Set-Content -LiteralPath $keyFile -Encoding ascii
ssh-keygen.exe -lf $keyFile
```

Compare the printed ED25519 fingerprint exactly to `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`. If the key is absent or differs, stop and report; do not rewrite `known_hosts` or accept another key. The temporary file contains a public host key only. The plain SSH and Remote-SSH tests have already completed, but independent key verification remains outstanding. Tailscale's `via IP:port` output indicates a direct path; earlier `via DERP(...)` replies show route establishment can initially relay before switching direct.

Run a large but read-only Git transfer check by fetching a substantial repository's refs/objects from GitHub on the Dell and measuring before/after bytes, or use an approved read-only large-object transfer. Do not clone a second working copy for this test. Report transfer size and duration. The live Tailscale path check must show `tailscale ping` direct; if it is relay-only, report that rather than assuming success.

Optional Acer WSL route test: without installing Tailscale inside Acer WSL, run `ssh anant_gupta@dell-wsl 'hostname'` and `tailscale ping dell-wsl` from an Acer WSL terminal. Whether Windows-side Tailscale provides that route to Acer WSL is not established by the docs and is **to be tested on the Acer**. If it fails, do not install Tailscale in Acer WSL and do not create wrappers; report the exact failure and ask the user before revisiting the locked design.

### 3b. Where to read the Dell's advertised host key, and the sync-check run (added 2026-10-15)
**Host key source.** The Dell cannot supply the key for this comparison: its own `tailscale status --json` has a `Self` entry with no `SSH_HostKeys` (checked 2026-10-15, Tailscale 1.104.1). The only independent source is the **Acer's** Tailscale view of the Dell: `tailscale.exe status --json`, then the `Peer` entry whose `DNSName` starts with `dell-wsl` (full name `dell-wsl.tail0c1d06.ts.net`, `100.94.129.113`), field `SSH_HostKeys`. That is exactly what the Step 3 snippet reads. If the Acer's peer entry also has no `SSH_HostKeys`, stop and report that; the fallback is a Dell-side read that needs `sudo`, which the user runs. Never rewrite `known_hosts`.

**sync-check over SSH (read-only).** Run from the Acer, then compare with the Dell's own run below:
```powershell
ssh dell-wsl '~/tools/sync-check'
```
It prints `host=`, tool versions, then for each of the two canonical repos: `branch`, `fetch=ok`, `compare_ref ... ahead/behind`, `dirty_count`. `git fetch` only updates remote-tracking refs; nothing in the working tree changes. **Ignore the `node`, `pnpm` and `uv` lines over plain SSH:** they print `not-installed` because nvm and `~/.local/bin` are set up in the interactive `.bashrc`, which a non-interactive SSH command does not load. The repo lines are the real check.

Dell's own run on 2026-10-15 (local, same script):
| Repo | Branch | Versus | Ahead / behind | Dirty |
|---|---|---|---|---|
| `second-brain-claudekit` | `main` | `origin/main` | 0 / 0 | 1 |
| `internship-research-loop` | `dell-latitude/deadline-quota-and-reseed-fixes` | `origin/master` | 6 / 5 | 25 |
The second repo has diverged from `origin/master` and has 25 dirty files. Do not reset, stash, commit or push either repo from the Acer. Report what the Acer sees; the Dell session decides.

### 4. Inventory the Acer's existing clones
For both `second-brain-claudekit` and `internship-research-loop`, locate every clone and worktree on the Acer, then record path, branch/upstream, ahead/behind, dirty count, untracked files, and dependency/output sizes. Do not delete or overwrite anything. Identify whether each is canonical, a local-only backup, or a worktree. Present a per-path retirement/relabel proposal; retire only after the user approves and verifies needed commits/uncommitted files are protected. GitHub protects pushed commits only, not uncommitted work, ignored dependencies, or logs. Do not touch either vault's sync mechanism.

### 5. Report
Return evidence for: Tailscale Windows connected; no Tailscale inside Acer WSL; `tailscale ping`; plain Windows `ssh.exe`; the independent host-key comparison; Remote-SSH hostname/path; direct-path status; large-transfer bytes/time if a specific harmless test is approved; optional Acer WSL route result; Codex execution location; and full clone/worktree inventory with a safe retirement/relabel proposal. The identity comparison, clone inventory, large-transfer check, and optional Acer WSL route test remain pending. Mention that Remote-SSH user settings are synced and can flow back to Dell. Do not push, branch, commit, delete, or modify repo files without explicit approval.

## References
[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh), [Tailscale WSL 2](https://tailscale.com/kb/1295/install-windows-wsl2), [VS Code Remote SSH](https://code.visualstudio.com/docs/remote/ssh).
