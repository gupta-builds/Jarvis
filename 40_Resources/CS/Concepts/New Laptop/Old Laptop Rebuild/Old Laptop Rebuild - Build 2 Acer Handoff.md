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
next: "Build 2 Acer items all closed 2026-10-15. Open only: the decision about the Acer's 4 local-only internship commits and the per-repo pilot approval."
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

## Acer visit results (2026-10-15)
Run from the Acer (host `gupta-builds`) by a Claude Code session. Evidence only; no repo, `known_hosts`, Tailscale setting or synced VS Code file was changed.

| Step | Result | Evidence |
|---|---|---|
| 1 Tailscale placement | PASS | Windows Tailscale 1.104.1 is connected as `gupta-builds` (`100.84.91.11`). Inside the Acer WSL there is no `tailscale` binary, no package, and `tailscaled` is not active. |
| 2 Config | not touched | The existing accepted `known_hosts` entry and Windows OpenSSH were used as they are. No SSH config or VS Code setting was written. |
| 3 Route | PASS | `tailscale.exe ping`: direct `via 10.5.8.253:41641`, 4 to 5 ms (13 ms in a later sample). The control plane shows `dell-wsl` online with relay `ord`. |
| 3 Remote command | PASS | `ssh.exe anant_gupta@dell-wsl` ran `hostname` (`DESKTOP-3VBG0JH`) and `uptime` (up 1 day 10 hours). Tailscale SSH asked for its extra "check" authentication once; it passed. |
| 3 Host key comparison | **PASS, closed 2026-10-15 by a Dell-side read** | The Acer's own `tailscale.exe status --json` has a `dell-wsl.tail0c1d06.ts.net` peer entry with **no `SSH_HostKeys` field** (Tailscale 1.104.1). Per this note, nothing was rewritten. Consistency check instead: the `known_hosts` entry and the key served right now by `ssh-keyscan` are both `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`, equal to the fingerprint the user accepted. That proves the key is stable, not that it is the one Tailscale advertises. To close it, the user reads the key on the Dell (needs sudo; the exact file location was not verified, so list it first): in Dell WSL run `WSL Parity/_scripts/71-hostkey-fingerprint.sh` (run in Dell WSL: `sudo bash <that file>`; it prints the Dell key's fingerprint and says MATCH or DIFFERENT). Tried first on 2026-10-15: `ssh-keygen -lf` on `/var/lib/tailscale/ssh/ssh_host_ed25519_key` fails with "is not a key file" because Tailscale stores a plain PKCS8 PEM, which is why the script derives the public key with openssl and hashes the SSH blob (method checked against ssh-keygen on a test key). |
| 3b sync-check over SSH | PASS | `ssh.exe anant_gupta@dell-wsl '~/tools/sync-check'`: second-brain-claudekit `main`, `origin/main` 0/0, dirty 1; internship-research-loop `dell-latitude/deadline-quota-and-reseed-fixes`, `origin/master` 6 ahead and 5 behind, dirty 25. Identical to the Dell's own run of 2026-10-15. The `node`, `pnpm`, `uv` lines read `not-installed`, as predicted for a non-interactive shell. |
| 3 Large transfer | measured, slow | A `git bundle` of second-brain-claudekit (17,039,678 bytes) streamed over SSH to a byte counter (nothing written on either side) took 2.38 s, 6.8 MiB/s. A 512 MiB stream from `/dev/zero` took 197 s, **2.5 MiB/s**, with a direct 4 to 13 ms path. That is slow for a direct path. Cause not established (one SSH stream through the Dell's userspace Tailscale, the `tailscale0` MTU of 1280 and mirrored networking are candidates). No setting was changed. The largest repo history on the Dell is `jan` at 1.5 GB; do not clone it over this link without testing first. |
| 3 Acer WSL route (optional) | PASS | Acer WSL has no Tailscale. `dell-wsl` resolves to `100.94.129.113` there, `tcp/22` is reachable, and `ssh` with a temporary known-hosts file holding only the verified key ran `hostname` on the Dell. A plain `ssh` from WSL stops at "Host key verification failed" until WSL's own `known_hosts` has the entry, which is expected. If the user wants it, run the first connection interactively and compare the printed fingerprint with the one above. |
| 4 Clone inventory | done, one risk found | See below. |
| 5 Codex execution location | not re-tested | The 2026-10-12 Remote-SSH evidence stands (extension host on the Dell WSL server). A GUI VS Code window is needed to re-check it. |

### Clone and worktree inventory (Acer)
Searched: both WSL clones by name under `~/projects`; Windows side by name at depth 2 under `C:\Users\anant`, `D:\_Anant\{10_Areas,20_Progress,30_Resources,00_Inbox,99_Archive}`, `D:\Apps`, `D:\AI`, `D:\Games`, and at depth 5 under the vault PARA folders, `.claude` and `workplace`. No Windows-side clone of either repo was found. One earlier depth-4 sweep of `D:\Apps` and `D:\Cache` did not finish, so those two were only checked at depth 2.

| Path | Branch and upstream | Ahead / behind | Dirty | Size | Worktrees | Role and proposal |
|---|---|---|---|---|---|---|
| `~/projects/ai/second-brain-claudekit` | `main`, `origin/main` | 0 / 0 (fetched) | 0 | 211 MB | none | Clean local clone, last commit 4 weeks ago. Relabel as "behind the Dell canonical checkout, no unique work". Retire only after the user approves. |
| `~/projects/work/internship-research-loop` | `acer-predator/repo-environment-setup`, upstream **gone** on origin | 4 / 5 against `origin/master` | 0 | 40 MB (`.venv` 33 MB) | none | **Holds 4 commits that exist nowhere else** (2026-10-03): `645a6c5` remove `.agents` mirror, Codex config only under `.codex`; `3e986c7` move 21 mirrored skill files into `.codex/skills`; `51b0377` adopt uv, commit `pyproject.toml` and `uv.lock`; `e0788fe` ignore machine-local settings, env files and tool caches. 24 files, 541 insertions. Do not retire this clone. |
| `~/projects/work/gupta-builds` | `main`, `origin/main` | in sync | 1 untracked | 0.5 MB | none | Not a shared repo. |
| `~/projects/scratch/gpu-smoke-test` | `main`, no commits, no upstream | n/a | 6 untracked | 5.3 GB | none | Scratch; not a shared repo. |

Protection made without touching the repo: `D:\Backup\repo-bundles\internship-research-loop-acer-20261015.bundle` (1.6 MB, `git bundle verify` says "complete history", SHA-256 `64e07ec865aaa0b45bb5eecebffe054f4d472407b2af53a1ae6a4f992353257a`, `.sha256` file beside it). Decision for the user: push `acer-predator/repo-environment-setup` to GitHub, or bring the four commits to the Dell session. Note that the Dell's internship checkout is itself 6 ahead and 5 behind `origin/master` with 25 dirty files, and the Dell note says that repo is not a uv project, while the Acer's commit `51b0377` adopts uv, so the two histories need a deliberate merge. Nothing was pushed, reset, stashed or deleted.

### Still open after this visit
The user's decision on the internship branch; Remote-SSH execution-location re-check in a GUI window; clone retirement approvals.

### Host-key comparison closed (2026-10-15)
Closed 2026-10-15: the user ran `71-hostkey-fingerprint.sh` on the Dell (and the equivalent openssl one-liner); both printed `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`, equal to the key the Acer accepted. RESULT: MATCH. The Acer's own `tailscale.exe status --json` never carried `SSH_HostKeys` for the Dell, so the Dell-side read was the only independent source. No `known_hosts` entry was changed.
