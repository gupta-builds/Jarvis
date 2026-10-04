---
type: project
status: sprout
created: 2026-10-04
tags:
  - project-brief
notes:
  - "[[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]]"
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[Cross-Laptop Sync - Build 4 Findings]]"
  - "[[second-brain-claudekit-jarvis-unison-sync]]"
  - "[[Folder Map]]"
  - "[[Gaps]]"
next: "[[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]]"
---

## Verdict: codebase sync between the two laptops

Run [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] as written. This isn't a fresh architecture decision — it already specifies the Dell-as-host, Remote-SSH-over-Tailscale, GitHub-as-backup, worktrees-for-parallel-work design from the pasted suggestion, and it hasn't been run yet. The underlying call ("don't live-sync codebases") was already made and paid for in [[Cross-Laptop Sync - Build Roadmap]]: Build 4 found a live Next.js app's `.git`, `node_modules`, and `.env.local` had synced by accident inside what was assumed to be a curated config folder. That's the concrete failure behind "syncing seems impossible" — it happened once, here, and the fix was "codebases stay GitHub-only," not "try harder to sync them."

**It is not a devcontainer.** A devcontainer defines a portable environment (usually Docker) that runs identically on any host you point it at. Remote-SSH does the opposite: VS Code's backend runs on one physical machine — the Dell — and the Acer is a display into it. Nothing here is portable. If the Dell is off or off Tailscale, you lose access; the design's own fallback is the Acer cloning fresh from GitHub and pushing a branch. A devcontainer could be layered in later for reproducibility, but it answers a different question than the one in front of you.

**Your three worries, answered directly:**
- *Will you still need `git clone`?* Yes, once — on the Dell, which already has all 18 shared repos checked out. The Acer doesn't need its own full checkout for daily work, since it's editing the Dell's checkout remotely.
- *Does the Acer's detailed WSL/tool setup stop mattering?* No. [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] uses the Acer's documented state (in `40_Resources/CS/Concepts/New Laptop`) as the target the Dell gets brought up to match — VS Code extensions, git config, Claude Code deny-rules, MCP wiring. The detail becomes the spec, not dead weight.
- *Does Remote-SSH strand local work?* Only Acer-local things stay Acer-local anyway — the discrete GPU and the planned local models (Ollama/Jan/Hermes/Kronos) are Acer hardware-bound regardless of this decision, not shared-repo work.

**One thing to correct before you proceed:** [[second-brain-claudekit-jarvis-unison-sync]] already exists, but it's a **one-way mirror** (`force_source: true`, WSL checkout → vault) of `.claude/agents`, `.claude/commands`, `.claude/hooks`, `CLAUDE.md`, `README.md`, `_docs` — built for visibility/review, not the two-way unison sync you described wanting. Given Build 4's incident, that's the safer shape and I'd leave it one-way for now. If you actually want true two-way `.claude`-folder sync across repos, that's a separate, narrower, and still-nonzero-risk build — give it its own numbered build the way vault sync got Builds 0–10, don't fold it into running Prompt 2.

**Decision needed from you:** (1) approve running Prompt 2 as-is, and (2) confirm the `.claude` mirror stays one-way, or tell me to scope a two-way version as its own build.

## Logging and recording failure audit

Per [[Folder Map]] and [[Gaps]], re-verified live rather than trusted as current:

| Platform | Status |
|---|---|
| Claude Code (Windows) | Live. Stop+SessionEnd hook, 30-min backfill task, 585+ raw notes. |
| Claude Code (WSL) | Live. Recovered from a hook crash on 2026-08-19; notes exist through at least 08-20 across CausalOps, portfolio, tradingview, second-brain-claudekit, gbrain. |
| Cowork | Capture folder exists; `Tool log.md` is 0 bytes; zero sessions ever distilled; last known raw activity 2026-07-24, never re-verified since. Effectively dead, silently. |
| Kiro | Scaffolded folder only. Never wired. |
| Cursor | The only platform with real distilled summaries (4 total) — built separately from the Claude Code pipeline, and it's the one that actually works end to end. |
| Codex, claude.ai chat, Agy | No capture pipeline exists at all. |
| Local models (Ollama/Jan/Hermes/Kronos) | Not installed yet — correctly zero capture, not yet a gap. Becomes one the moment any of them land. |

**Skill/agent/hook usage tracking exists but is functionally dead.** `export-ai-session` writes one row per reviewed session to `60_Claude/30_Reviews/AI/Toolkit/Tool log.md`. That file has exactly **one row, dated 2026-08-19**, and nothing since — it's a manual slash command, never hook- or cron-triggered. Hook-firing events themselves (distinct from skill/command names) aren't logged anywhere.

**Review cadence is broken, with one recent forced fix:**
- Weekly Synthesis: W17, W22, then a **17-week gap**, then W39 and W40 (this week). The gap closed only because `Jarvis-WeeklyReview` — a Scheduled Task its own docs claimed was "registered 2026-09-20" — didn't actually exist until 2026-09-28. This week's W40 is that task's first real unattended fire.
- AI Tools Weekly Review: one entry ever (W34), never repeated.
- Monthly Review: one entry ever (2026-06) — four months stale.
- Internship Loop reviews: partial, gappy.

**Cron infrastructure is real but was quietly broken.** `Jarvis-GitAutoSync`, `Jarvis-Syncthing-Health`, `Jarvis-WeeklyReview`, and the Claude Code backfill tasks all exist as Windows Scheduled Tasks. But the 2026-09-28 session found **12 active scripts with the old laptop's path hardcoded in** — the entire capture-backfill pipeline, Cursor export, log rotation, and sync registration had been silently no-op-ing, with no Scheduled Task registered for any of them on the new laptop. That's the actual cause of "capture folders don't exist yet," a complaint that had been re-flagged in multiple past weekly reviews without anyone finding the root cause.

**The pattern underneath all of this:** Jarvis has real logging mechanisms, but no mechanism that checks whether the mechanisms are still running. The Tool log went dead for six weeks, Weekly Synthesis went dark for seventeen, and a task's own documentation said "registered" for over a week while it didn't exist — and in every case, a human caught it late, not an alert. A single capture pipeline landing (Cowork, Kiro, Codex) doesn't fix that pattern; a watchdog over the existing mechanisms would.

## Proposed builds (not started — sequencing is yours to set)

- **A — Run Prompt 2.** Execute [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] as-is.
- **B — `.claude`-mirror direction.** Confirm one-way stays, or scope two-way sync as its own numbered build with its own failure-mode review (same discipline as [[Cross-Laptop Sync - Known Failure Modes and Prevention]]).
- **C — Watchdog layer.** One scheduled check that verifies the mechanisms themselves: Tool log freshness, Weekly/Monthly review cadence, and that every capture Scheduled Task actually exists on the current machine — alerts (not silence) when any goes stale past a threshold. This is the highest-leverage fix of the three, since it would have caught every failure listed above on its own.
- **D — Wire or kill Cowork and Kiro.** Cowork's pipeline exists but is dead; either revive and verify it, or stop carrying it as "built."
- **E — Codex / Agy / claude.ai chat capture.** Decide scope, then build minimal SessionEnd-style pipelines matching the Claude Code pattern.
- **F — Local-model logging spec.** Write the per-run logging/self-improvement spec for Ollama/Jan/Hermes/Kronos *before* install, not after, so new tools don't join the vault with the same gap as everything above.

Each of these gets handed to its own fresh session as a small build, the way vault sync was staged across Builds 0–10 — none of this should be executed in a single planning pass.
