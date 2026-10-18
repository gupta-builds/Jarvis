---
type: project
status: active
created: 2026-10-04
tags:
  - laptop
  - wsl
  - vscode
  - codebase-sync
  - ssh
  - tailscale
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]"
  - "[[internship-research-loop-new-laptop-directive]]"
  - "[[second-brain-claudekit-new-laptop-directive]]"
  - "[[Cross-Laptop Sync - Known Failure Modes and Prevention]]"
updated: 2026-10-17
next: "Decisions applied. Open: the Dell pulling the merged internship master (6 local commits to reconcile); per-repo pnpm pins (pilot partly done)."
---
# Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem

## One-Line Answer
The two-laptop design held: the Dell is the canonical always-on host, Tailscale runs inside the Dell's WSL only and on the Acer's Windows side only, Tailscale SSH is the one SSH path (the keyed OpenSSH fallback and the VS Code Tunnel were declined), both WSL idle timers are off, and concurrent work is separated by task with git worktrees. The 2026-10-04 design text below is kept as the reasoning; the verified outcome of each decision is at the end.

## Status
Supersedes the codebase-sync "Verdict" section of `60_Claude/40_Project_Briefs/Codebase Sync Decision and Logging Failure Audit — 2026-10-04.md` (that note's separate logging-audit half is untouched and still current). Written 2026-10-04 as the design input for the two WSL builds; every external claim was checked live against Tailscale and Microsoft documentation that day, and two of the ten decisions corrected something earlier drafts got wrong or left unresolved. "Prompt 1" and "Prompt 2" in the text below are the two build briefs for the WSL layer and the VS Code/SSH layer; they have run and been retired. The outcome of each decision, verified on 2026-10-17, is in "Decision outcomes" before the Sources.

---

## Decision 1 — Tailscale goes inside WSL only. This was already correct; verify it, don't re-decide it.
> [!IMPORTANT] Amended 2026-10-04 by the user
> The rule is now **one location per machine, never both**. The Dell runs Tailscale inside WSL only (the Tailscale SSH server exists only on Linux and macOS, and the code lives in WSL). The Acer, a client only, runs Tailscale on its **Windows side only** and never inside its WSL. Reason: VS Code Remote-SSH on the Acer uses the Windows `ssh.exe`, which needs a Windows-side tailnet route, and Tailscale's WSL2 page recommends the Windows host alone for ordinary use while warning only about running both on one machine. Windows-side Tailscale moves no code or tooling out of WSL. The text below was written before this amendment; where it says "never on either Windows side", read it as "never on the Dell's Windows side, and never in the Acer's WSL". (This was rule R2 of the build brief.)

Prompt 2's locked design already says Tailscale and sshd run inside the WSL distro, with its own tailnet name (`dell-wsl`), never on either laptop's Windows side. **Keep this.** The prior review session's suggestion to add this as a standing rule is right — but confirm the reasoning precisely, because the real failure mode is narrower than "never run it on both":

- Tailscale's own install docs (`tailscale.com/docs/install/windows/wsl2`, last validated 2025-11-03) state the actual failure: running Tailscale on **both** the Windows host and inside WSL2 **at the same time** breaks outbound WSL traffic, because WSL's own Tailscale-encrypted packets get wrapped a second time going out through the Windows host's Tailscale tunnel and no longer fit (an MTU/double-encapsulation failure, not a config mistake you can tune around). Running Tailscale in WSL *alone*, with Windows never running it, is a supported configuration — the danger is specifically the combination, not the WSL side on its own.
- Not yet checked by either Prompt 2 or the prior review: that warning is written for WSL2 in general, not specifically for `networkingMode=mirrored` (the Dell's actual mode, confirmed in Prompt 2's own facts). **Phase 1 must add a live round-trip connectivity test** (ping + an actual SSH connection from a second device, not just `tailscale status`), and confirm the documented MTU workaround fires: the same docs say `tailscaled` auto-raises WSL's default-interface MTU from 1280 to 1340 when it detects WSL — verify this happened (`ip link show` inside WSL after `tailscale up`), don't assume it.
- **Standing rule to add next to "never run `wsl --shutdown` mid-session":** Tailscale is never installed on either laptop's Windows side, full stop. Record this in Prompt 2's rewrite as a named rule, not an inference from "the design doesn't mention it."

## Decision 2 — Tailscale SSH primary, keyed OpenSSH kept only as fallback
Prompt 2 currently plans key-only OpenSSH as the only SSH mechanism. Change the default to Tailscale SSH, with the already-planned OpenSSH server demoted to fallback — this is not extra work, since Prompt 2 was already going to install an OpenSSH server; only the primary/fallback ordering changes.

**Why, confirmed directly from Tailscale's own docs (`tailscale.com/docs/features/tailscale-ssh`):**
- Tailscale SSH authenticates via the tailnet's own node identity, not a distributed key pair — it intercepts SSH traffic through `netstack` port interception and the SSH protocol's `none` auth type once `tailscaled` already knows who the remote peer is. No key generation, no `authorized_keys`, no key rotation.
- **Zero client-side config.** Confirmed directly (a Tailscale engineer, on the record): "Client changes aren't needed for this to work, all that is required is to use your SSH client as normal." VS Code's Remote-SSH extension needs nothing extra — it just calls `ssh host` the normal way, and Tailscale's daemon on the target machine takes it from there. This is a real simplification over the pasted review's assumption that this needed special VS Code config.
- **Host-key churn is a non-issue under Tailscale SSH specifically** — this resolves one of the prior review's named landmines, not just works around it. Tailscale distributes the SSH host public key through its own control plane, separately from node keys, specifically so a reinstalled WSL distro's new host key propagates automatically and the client never sees an "unknown host" warning. (Host-key churn is still a real manual fix — `ssh-keygen -R <host>` on the Acer — if you ever fall back to the plain OpenSSH path.)
- **The one real limitation, stated explicitly in Tailscale's own docs, to accept rather than "fix":** Tailscale SSH doesn't check a client-side key pair, so *any* OS user on the connecting machine with tailnet access can SSH in as the configured WSL user. For two personal devices with one user account each, this is the correct tradeoff to accept explicitly, not a gap to patch.
- **Unresolved, needs a live check in Phase 4, not an assumption:** whether Tailscale SSH authorizes the connection by default for a personal (non-org) tailnet with no ACL file, or needs an explicit `ssh` block added to the tailnet policy — sources disagree by year (a 2022 comment from Tailscale's own co-founder says personal tailnets default to allowing SSH to your own untagged devices; a more recent third-party guide says an explicit `ssh` ACL rule is always required with no default). **Check the admin console's Access Controls page directly before assuming either answer; don't ship a prompt that asserts one.**
- Keep the already-planned sshd hardening file (`PasswordAuthentication no`, `PermitRootLogin no`, `AllowUsers anant_gupta`, `AllowTcpForwarding yes`) — but note explicitly in the rewrite that this file only matters for the **fallback** path. If Tailscale SSH is primary and healthy, sshd's own auth settings are bypassed entirely by `tailscale up --ssh`'s interception; don't let Phase 4 think the hardening work was wasted if it's rarely exercised.

## Decision 3 — the actual stay-awake fix, which neither prompt currently sets
**This is the single most important correction from this research pass.** Prompt 2 names "stay-awake risk" as real and explicitly defers the fix to Prompt 1 ("The WSL idle timeouts live in `.wslconfig`, which Build 1 owns"). But Prompt 1's own target-state list for `.wslconfig` (`memory`, `processors`, `swap`, `swapfile`, `networkingMode`, `firewall`, `autoMemoryReclaim`, `sparseVhd`) **does not include any idle-timeout setting at all.** The handoff between the two prompts drops the one setting the whole design depends on.

Confirmed directly against Microsoft's own WSL config docs (`learn.microsoft.com/en-us/windows/wsl/wsl-config`) and a live, dated (April 2026) community report of the exact failure mode:
- There are **two separate timers**, not one: `vmIdleTimeout` (default 60000ms / 60s) under `[wsl2]` shuts down the whole lightweight VM; `instanceIdleTimeout` (default 15000ms / **15 seconds**) under `[general]` shuts down the specific distro instance independently of the VM timer.
- Setting only `vmIdleTimeout=-1` — which is the one setting anyone usually finds first — **does not work on its own.** Directly confirmed by a user who had it set and still watched their distro (with systemd and background services running) die ~15 seconds after the last terminal session closed: "that doesn't work... it does not prevent your distribution from stopping after the last terminal closes, even with systemd running." The fix needs **both**:
  ```ini
  # In %UserProfile%\.wslconfig
  [wsl2]
  vmIdleTimeout=-1

  [general]
  instanceIdleTimeout=-1
  ```
- This directly resolves Prompt 2's own flagged unresolved question ("whether sshd-as-a-systemd-service... keeps the distro alive indefinitely... flags this as unverified, correctly"). The verified answer is **no, an active sshd service does not keep the distro alive by itself** — the 15-second `instanceIdleTimeout` kills the distro regardless of what's running inside it, unless this setting is explicitly disabled.
- **Tradeoff to accept explicitly, not silently:** `-1` on both means the Dell's WSL VM and distro never auto-shut down to reclaim resources, ever — this is the deliberate cost of being an always-on SSH host, not a side effect to discover later. `autoMemoryReclaim=gradual` (already in Prompt 1's target state) is still worth keeping alongside this — it reclaims idle memory *while the VM stays running*, which is compatible with, not contradicted by, disabling the two shutdown timers.
- **Add to Prompt 1's target state, item 1**, and remove the implicit assumption from Prompt 2's "Stay-awake risk" paragraph that this is simply "recorded" for Build 1 — Build 1's own prompt text needs the explicit setting, or the same gap recurs.
- **Verification Prompt 1 or Prompt 2's Phase 1 must run, live, not assumed from the docs:** close every WSL terminal and VS Code window, wait at least 30 seconds, then confirm from PowerShell (`wsl -l -v` should still show the distro `Running`) and confirm sshd still answers a connection. Do this before trusting any later phase of the two-laptop design.

## Decision 4 — retire the existing dual-checkout model explicitly; don't assume Prompt 2 is a continuation of it

> [!NOTE] Build 5 correction, 2026-10-13
> The Dell's second-brain checkout is `~/projects/ai/claude/second-brain-claudekit` (the Acer uses `ai/second-brain-claudekit`) and it has no root package manifest. The internship-research-loop checkout is not a live uv project (no `pyproject.toml`).

Both `second-brain-claudekit` and `internship-research-loop` already have a real, dated, working model that Prompt 2 silently replaces, not extends:
- `internship-research-loop-new-laptop-directive.md` (2026-09-26): each laptop holds its **own independent clone**, branches named `dell-latitude/<topic>` / `acer-predator/<topic>`, merged by PR, documented in the repo's own `CLAUDE.md` under "Two-laptop workflow" (added 2026-09-26, in the Auto-mode classifier notes section).
- **Important and easy to miss: the vault's own mirrored copy of that `CLAUDE.md`** (`20_Progress/AI/Claude Code/internship-research-loop/CLAUDE.md`) **is stale and does not contain this section at all** — its last write is 2026-09-05, three weeks before the section was added to the real repo. This is a live, concrete example of the one-way-mirror risk already flagged in the superseded brief: **don't trust the vault's mirrored `CLAUDE.md` copies as source of truth for either repo's current two-laptop conventions — read the live WSL checkout directly.**
- Prompt 2's own "Verified facts" section confirms the dual-checkout model is "already in use" today (18 repos on Dell, `<machine>/<topic>` branch convention, GitHub-only) — so the single-canonical-host design is a real, second architecture change layered on top of a model that's currently active, not a greenfield decision.

**Add to Prompt 2's rewrite, Phase 4 (Acer handoff), as an explicit step:** inventory the Acer's existing clones of both repos and either retire or clearly relabel them before the handoff completes. An old, no-longer-authoritative local clone left sitting on the Acer's disk is the same shape of failure the vault's own sync history already caught once — [[Cross-Laptop Sync - Build 4 Findings]] found a live, forgotten Next.js checkout (`.git`, `node_modules`, `.env.local` intact) sitting inside a folder nobody remembered was a real codebase.

## Decision 5 — both repos' completion-gate checklists need a dated rewrite note, not silent obsolescence
Read directly from both directive notes' "Final completion gate" sections:
- `internship-research-loop`'s gate includes `gh auth status succeeds without exposing a token` and `First new work on the new laptop starts on an acer-predator/<topic> branch, not master` — both assume the Acer runs its own independent `gh`-authenticated clone. Under the single-host design, the Acer never runs `gh` or holds git credentials at all; every push/PR executes on the Dell via the Remote-SSH session. This gate item becomes meaningless, not merely redundant, and will read as a false regression to a future audit unless it's explicitly marked superseded.
- `second-brain-claudekit`'s gate has no equivalent laptop-specific branch or `gh auth` item — its checks are tool/sync-presence checks (`git lfs version`, `unison -version`, the sync script exit code), which stay valid either way. **No rewrite needed there** — don't assume symmetry between the two repos' gates just because they're handled by the same prompt.

**Add to Prompt 2's rewrite:** a step that patches `internship-research-loop-new-laptop-directive.md`'s completion gate with a dated note ("superseded by the single-host design, see [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]") rather than leaving it to look like an unmet checklist item indefinitely.

## Decision 6 — the Jarvis and The Plan vaults are out of scope; say so, don't imply it
Prompt 2's scope is `~/projects` and the 18 repos under it. The vaults already have a working, different, deliberately-opposite-philosophy sync mechanism — Syncthing's real-time mirror plus `Jarvis-GitAutoSync`'s scheduled commit/push, Builds 0-11 — built specifically because independent live copies (what the vaults need) and one-canonical-checkout (what Prompt 2 is building for code) solve different problems. Layering Prompt 2's model onto the vaults would fight that design directly, not complement it.

**Add one explicit line to Prompt 2's rewrite:** "This build's scope is `~/projects` only. The Jarvis and The Plan vaults keep their existing Syncthing + git-auto-sync mechanism unchanged; do not touch `.stignore`, `.gitignore`, or either vault's Scheduled Tasks from this build." Don't rely on scope being implied by the reading list.

## Decision 7 — worktree dependency caches: the specific settings, confirmed

> [!NOTE] Build 5 correction, 2026-10-13
> pnpm 10.33.2 uses the key `enableGlobalVirtualStore`, not `virtualStoreType: global`. Only set it on repos that really use pnpm, and measure first.
> Update 2026-10-14: both laptops now run pnpm 12.4.2 (user matched the Acer). The key above was verified for 10.33.2 only; on 12.4.2 `pnpm config get` shows neither key set, so check pnpm.io before setting any global-virtual-store option.

Both repos' package managers already support exactly this scenario natively — this needs a specific setting, not just an awareness that "caches help":
- **`second-brain-claudekit` (pnpm):** pnpm's own documentation (`pnpm.io/git-worktrees`, `pnpm.io/global-virtual-store`) describes this exact use case by name ("pnpm + Git Worktrees for Multi-Agent Development"). Default pnpm already hardlinks package contents from a shared content-addressable store into each project's `node_modules/.pnpm` — real bytes aren't duplicated, but the hardlink *directory structure* is still rebuilt per worktree, which costs real time at scale. The documented fix for exactly this scenario is `virtualStoreType: global` in `pnpm-workspace.yaml` (or `.npmrc`): every worktree's `node_modules` becomes pure symlinks into one shared global store, "near-zero per-worktree overhead." **Set this explicitly for `second-brain-claudekit`, don't rely on pnpm's default per-project behavior.**
- **`internship-research-loop` (uv):** uv's global content-addressed cache uses hardlinks/copy-on-write by default (confirmed, `docs.astral.sh/uv/concepts/cache`) — no extra setting needed, but it only works when the cache and the `.venv` share a filesystem; if they're on different volumes, uv silently falls back to slow copies with no warning. **Verification step for Phase 1:** confirm `uv cache dir` and every worktree's path under `~/projects` resolve to the same filesystem (`df` both paths, compare the device) — this is already satisfied by Prompt 2's own "never work from `/mnt/c` or `/mnt/d`" rule, but confirm it rather than inferring it.

## Decision 8 — Tailscale key/node expiry: the one-click fix, not just a known risk
Confirmed directly (`tailscale.com/docs/features/access-control/auth-keys`): node key expiry defaults to a maximum of 90 days (sources elsewhere cite 180 days for some expiry policies — the admin console's actual per-node value is the one to trust, not either number from memory). A device whose key silently expires looks completely fine for weeks, then Remote-SSH simply stops connecting with no useful local error.
**Concrete fix, to run once during Phase 4 setup, not left as an ongoing risk to remember:** in the Tailscale admin console → Device Management → find the Dell's `dell-wsl` node → **Disable key expiry** for that specific node. This is a real, documented, permanent setting, not a recurring maintenance task.

## Decision 9 — Tunnels fallback: set it up and test it now
VS Code's Remote Tunnels (confirmed, `code.visualstudio.com/docs/remote/tunnels`) is a real, separate mechanism from Remote-SSH — it tunnels through a Microsoft/GitHub account as the broker, works through any firewall, and needs no SSH at all. Its one hard constraint, stated directly in Microsoft's own docs: **the remote machine is only reachable through the tunnel while VS Code (or the `code tunnel` CLI) is actually running there.** For this to be a real fallback rather than a hopeful one, confirm during Phase 4 (not during an actual Dell-unreachable emergency) whether a persistent, logon-independent tunnel service can be installed (`code tunnel service install` or equivalent) rather than relying on an interactively-opened VS Code window that closes the tunnel the moment it exits.

## Decision 10 — this is not a devcontainer, and nothing here changes that
No new research changed this from the prior brief: Remote-SSH runs VS Code's backend on one specific physical machine; nothing here is portable or reproducible across hosts the way a devcontainer definition would be. If reproducibility across unrelated machines is ever wanted later, that's an additive, separate project — not a reason to delay this one.

## Decision 11 — concurrent-session model: one filesystem, not a sync race; separation is by task, not by physical machine

> [!NOTE] Added 2026-10-14, from a planning-session Q&A, not yet exercised live
> This decision answers "what actually happens if the Dell and the Acer touch the same checkout at once" and "where does global config/conversation state land" — both came up as open questions and have a precise mechanical answer, not a "depends."

Under the single-canonical-host design there is **one filesystem** for everything under `~/projects` on the Dell. A Remote-SSH session driven from the Acer is not a second copy racing the Dell's — it is a second live process pointed at the exact same files. This is a narrower, more dangerous failure mode than the vaults' own Syncthing sync-conflict mechanic (see the case study below): a plain concurrent save on the same checkout has **no conflict-copy safety net at all**, it just silently overwrites.

- **Worktree separation is by concurrently-active task, not by which physical machine is driving.** Decision 4's `<machine>/<topic>` branch naming is attribution, not the actual safety mechanism — the mechanism is that each concurrently-active session gets its own `git worktree add` directory, so two editors never share an inode. If a Dell-native session and an Acer-driven Remote-SSH session are ever open on the same branch/checkout path at the same time, that is the violation, regardless of whose name is on the branch.
- **No automated lock enforces "one session owns a branch at a time."** This is a discipline rule, not software — nothing warns you when it's violated. The planned `~/tools/sync-check` (SSH Runbook step 4.9) reports branch/ahead-behind/dirty state, not "is a live session currently open elsewhere" — that gap stays open.
- **Global Claude Code config (`~/.claude/settings.json`, `~/.claude.json`, skills, memory) follows the execution host, not the human's physical seat.** A Remote-SSH session into `dell-wsl` always reads the Dell's global config, never the Acer's, because the `claude`/`codex` process and the Remote-SSH workspace-extension host both run on the Dell. Build 2 item 5 already closed the one safety-critical gap this caused (Acer's secret-file deny-rules were missing from the Dell's `~/.claude/settings.json`; now applied). Any other Acer-only global skill/setting still will not appear on the Dell — nothing syncs this going forward, by the same one-way-visibility-only logic as the `.claude`-mirror decision elsewhere in this vault.
- **Conversation transcripts land wherever the process ran, not wherever the human sat.** A Claude Code session driven from the Acer via Remote-SSH writes its transcript to the Dell's `~/.claude/projects/...`, same as a native Dell session. This should mean the existing WSL Claude Code capture pipeline (see memory `project_ai_conversation_archive.md`) already covers Remote-SSH-driven sessions — not yet live-verified for that specific trigger path, so confirm rather than assume. Acer-only local work (never touching `~/projects` on the Dell) needs the Acer's own separate capture pipeline, which is a distinct, unverified item.

**Real-world precedent for the "no safety net" risk, from this vault's own history, not hypothetical:** two Dell-side Claude Code sessions editing the Old Laptop Rebuild notes concurrently on 2026-10-13 produced 15 Syncthing `.sync-conflict-*` files (the conflict copies no longer exist; the incident is recorded in the Runs Index). No content was lost there only because Syncthing was watching those files and wrote conflict copies — the exact protection a plain code checkout under this design does not have. The Index's own response was procedural ("one owner per note" — only the session closing a build edits the Index/Runs Index) rather than technical, because no technical lock exists. The same discipline-not-software gap applies to code worktrees.

---

## Decision outcomes (verified 2026-10-17)
| Decision | What was decided | Outcome |
|---|---|---|
| 1 Tailscale placement (amended 2026-10-04) | Dell: inside WSL only. Acer: Windows side only. Never both on one machine | **Held.** `dell-wsl` (`100.94.129.113`, 1.104.1) in the Dell WSL; `gupta-builds` (`100.84.91.11`) on the Acer's Windows side; nothing on the Dell's Windows side, nothing in the Acer's WSL. Round trip tested with `tailscale ping`, plain `ssh.exe` and Remote-SSH; `tailscale0` MTU stays 1280, no change was needed |
| 2 Tailscale SSH primary, keyed OpenSSH fallback | Tailscale SSH first | **Held for Tailscale SSH.** The open question about the default policy was settled by looking at the admin console: an explicit `check` rule from `autogroup:member` to `autogroup:self` exists. The OpenSSH fallback on port 2222 was **declined** (2026-10-15): not installed, nothing listens on 22/2222 in the Dell WSL, and under mirrored networking the Hyper-V firewall default for inbound is Block |
| 3 Stay-awake | `vmIdleTimeout=-1` and `instanceIdleTimeout=-1` | **Applied** in Build 1 and proven by the 75-second idle test (2026-10-07, repeated 2026-10-12). Both keys are in the live `.wslconfig`. An active `sshd` does not keep the distro alive by itself; the timers do |
| 4 Retire the dual-checkout model | inventory the Acer's clones and retire or relabel them | **Inventoried 2026-10-15.** `second-brain-claudekit` on the Acer has no unique work. `internship-research-loop` on the Acer holds **4 commits that exist nowhere else** (branch `acer-predator/repo-environment-setup`, upstream gone), protected by a verified Git bundle; the push-or-bring decision is open. No clone was retired. **Follow-up 2026-10-17 (Build 5c):** all three Acer WSL repos (`second-brain-claudekit`, `internship-research-loop`, `gupta-builds`) were bundled to `D:\Backup\repo-bundles\` (verified, SHA-256 recorded in the Build 5c findings) and removed. The "4 commits that exist nowhere else" turned out to be on `origin/master` already: PR #13 rebase-merged them on 2026-10-04, which only renamed the hashes (`git cherry` shows all four upstream). The model is now: the Dell hosts every checkout; the Acer WSL holds none |
| 5 Completion-gate rewrite | patch the internship directive with a dated supersession line | **Done** (2026-10-12); the second-brain gate was left alone as decided. **Follow-up 2026-10-17:** both directive notes now carry a dated line marking their completion gates superseded, because the Acer clones they describe were removed in Build 5c |
| 6 Vaults out of scope | Jarvis and The Plan keep Syncthing and git auto-sync | **Held.** No vault sync file, ignore file or scheduled task was changed |
| 7 Worktree dependency caches | per-repo settings; uv cache on the same filesystem as the projects | uv: confirmed on the same device. pnpm: the 10.x key `enableGlobalVirtualStore` and the 11.23+ spelling `virtualStoreType` are both unset on pnpm 12.4.2, so nothing was configured; check pnpm.io before ever setting one. Worktree convention used: `~/projects/<group>/.worktrees/<repo>-<topic>` on branch `<machine>/<topic>` |
| 8 Key expiry | disable it for `dell-wsl` | **Done** by the user in the admin console |
| 9 Tunnels fallback | test a persistent tunnel service | **Declined** (2026-10-15). The Linux CLI 1.141.0 sits unsigned at `~/tools/vscode-tunnel-cli/code`; nothing is installed as a service. **Follow-up 2026-10-17:** Remote-SSH from the Acer now has a `Host dell-wsl` alias with keep-alives (30 s, 3 misses), Tailscale on the Acer runs unattended (`ForceDaemon` true), and the shortcuts `dell` and `dcode` exist; the tunnel stays declined |
| 10 Not a devcontainer | unchanged | unchanged |
| 11 Concurrent sessions | separation by task, not by machine; no lock exists | **Discipline rule, unchanged.** The 2026-10-13 incident (two Dell sessions editing the same notes, 15 conflict files) is the precedent. The pin pilot of 2026-10-17 used an isolated worktree for exactly this reason. **Follow-up 2026-10-17:** the exporter dedupes by per-session marker files and keeps a separate tree per machine (`<Machine>/<OS>/Claude`), and each laptop's Capture Health note and state files are per machine, so two machines never write one synced file. The Dell still has to pull the merged internship `master` and reconcile its 6 local commits |
Also confirmed live on 2026-10-17: `~/tools/sync-check` reports `second-brain-claudekit` `main` 0/0 (dirty 1) and `internship-research-loop` `dell-latitude/deadline-quota-and-reseed-fixes` 6 ahead / 5 behind `origin/master` (dirty 25); the Acer sees identical numbers over SSH. Measured transfer from the Acer: a 17 MB bundle in 2.4 s, a 512 MiB stream at only 2.5 MiB/s (cause unknown, so test before cloning a large history such as `jan` at 1.5 GB over this link).
## Sources (checked live, 2026-10-04)
- `tailscale.com/docs/features/tailscale-ssh` — authentication model, netstack interception, host-key distribution, OS-user limitation.
- `tailscale.com/docs/install/windows/wsl2` (last validated 2025-11-03) — the both-at-once MTU/double-encapsulation warning, the 1280→1340 MTU workaround.
- `tailscale.com/docs/features/access-control/auth-keys` — 90-day default key expiry, admin-console override.
- `learn.microsoft.com/en-us/windows/wsl/wsl-config` — `vmIdleTimeout` (60000ms default) vs `instanceIdleTimeout` (15000ms default), the two-setting fix.
- GitHub `microsoft/WSL` discussion #9245 (dated comment, April 2026) — live confirmation that `vmIdleTimeout=-1` alone does not prevent instance shutdown.
- `pnpm.io/git-worktrees`, `pnpm.io/global-virtual-store` — `virtualStoreType: global` for near-zero per-worktree `node_modules` cost.
- `docs.astral.sh/uv/concepts/cache` — uv's hardlink/copy-on-write global cache and its same-filesystem requirement.
- `code.visualstudio.com/docs/remote/tunnels` — Remote Tunnels' VS-Code-must-be-running constraint.
- This vault: `internship-research-loop-new-laptop-directive.md`, `second-brain-claudekit-new-laptop-directive.md`, `Old Laptop Rebuild - Index.md`, `Cross-Laptop Sync - Known Failure Modes and Prevention.md`.

## packageManager register (2026-10-15, read-only audit of the Dell's canonical repos)
Decision 11 and the Build 5b decision on pnpm 12.4.2 mean a pin belongs in each repo's `package.json`, but only where the repo really uses that manager. The audit found that a blanket `pnpm@12.4.2` would be wrong for most repos. Nothing was changed in any repo. Each row is a separate, per-repo approval, done in its own `<machine>/pin-package-manager` branch or worktree, one repo at a time, and only when the working tree is clean enough to review the diff.
| Repo (under `~/projects`) | Lockfiles found | `packageManager` today | Proposed pin | Blocker or note |
|---|---|---|---|---|
| `hub/portfolio` | `pnpm-lock.yaml` | none | `pnpm@12.4.2` | 114 dirty files on `post-frontend`; pin only after that work is committed or moved |
| `hub/Learning-Tracker-Tool` | `pnpm-lock.yaml` | none | `pnpm@12.4.2` | 2 dirty files; clean candidate for the first pilot |
| `hub/Assisto_website` | `pnpm-lock.yaml` and `package-lock.json` (mixed) | none | `pnpm@12.4.2` after deleting the stale `package-lock.json` | 73 dirty files; choose one manager first |
| `hackathon/Resq`, `hackathon/opspilot`, `hackathon/safereach`, `hub/DNA_BJJ_APP`, `hub/GymMangment_app_demo` | `package-lock.json` | none | `npm@11.x` (match the Node 24 npm) | npm repos: do not pin pnpm; pin npm only if you want Corepack to enforce it |
| `hub/boom-tracer` | `package-lock.json` and `bun.lockb` (mixed) | none | decide npm or bun first | mixed lockfiles |
| `ai/claude/ecc` | `package-lock.json` and `yarn.lock` | `yarn@4.9.2` (upstream clone) | leave | upstream's pin; do not edit |
| `ai/jan` | `yarn.lock` | `yarn@4.5.3` (upstream clone) | leave | upstream's pin; do not edit |
| `hub/CausalOps`, `hub/tradingview`, `work/internship-research-loop`, `ai/claude/second-brain-claudekit`, `work/gupta-builds`, `ai/claude/adx-worktree-throwaway-test` | none (no `package.json`) | n/a | none | Python or docs repos; they need a Python pin (`.python-version`, `uv.lock`) instead, not a Node one |
| `umn/boom` | `Cargo.lock` | n/a | none | Rust |
Acer clones: only `second-brain-claudekit` and `internship-research-loop` exist as shared clones there, and neither has a `package.json`. The Acer's internship clone already commits `pyproject.toml` and `uv.lock` (four unpushed commits, see [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]); the Dell's checkout has neither, so that repo's Python pin needs one decision across both laptops before any build touches it. Remember `~/.cache/node` must never be deleted: Corepack reads its pin from there.

**Pilot result (2026-10-17).** The first row to be tried was `hub/Learning-Tracker-Tool` (the register's "clean candidate"): done as a local commit `51cc182` on `dell-latitude/pin-package-manager` in an isolated worktree, unpushed. It also needed `allowBuilds` in `pnpm-workspace.yaml` (pnpm 12 ignores the old build-script keys) and adds the package-manager section to the lockfile; it is a team repo, so the push is a decision. `hub/portfolio` turned out to have a broken lockfile on `origin/main` (duplicate key `@ai-sdk/mistral@3.0.39`, lines 201 and 207) and was reverted; `hub/Assisto_website` still needs a manager choice; the dirty-file counts in the table above were measured on 2026-10-15 (`portfolio` is 114). Full account: Build 4 findings, "Build 4b follow-up".