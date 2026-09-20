# How to — this repo's own pipeline, for a cold read

Second-brain-claudekit's version of Jarvis's Toolkit "How to Use X" pattern (`_docs/Jarvis.md`'s description of `20_Progress/Projects/AI Use/Claude Kit/Toolkit/`) — written 2026-08-19 so a future session, or Anant, can pick up this repo's real, current operating state without re-deriving it from `_docs/Architecture.md`, `_docs/Design.md`, and every dated amendment in between.

| Doc | Answers |
|---|---|
| [`review-system.md`](review-system.md) | How Jarvis's own review system actually works today, and what (if anything) this repo's pipeline activity should feed into it. |
| [`conversation-capture.md`](conversation-capture.md) | What state this repo's session-capture pipeline is actually in right now — not what it was designed to be. |
| [`using-staged-artifacts.md`](using-staged-artifacts.md) | How `agents/`, `commands/`, `hooks/`, `skills/`, `instructions/` staging and promotion actually work, post-2026-08-19 Phase 1 resolution. |
| [`tests-and-promotion.md`](tests-and-promotion.md) | How `tests/` gates a promotion decision, and how that connects to `_docs/Promotion-Criteria.md` and `60_Claude/Qualification-Checklist.md`. |
| [`How to write Skills.md`](How%20to%20write%20Skills.md) | Practical order-of-operations for authoring a Skill — frontmatter limits, freedom tiers, output-format patterns, and why there's no self-improvement mechanism to design (2026-09-06, grounded in `60_Claude/Standards/Skill Standard.md`'s sourced research). |
| [`How to write Agents.md`](How%20to%20write%20Agents.md) | Same, for a `.claude/agents/*.md` subagent — the fresh-context constraint, the `memory` field, and the difference between an agent monitoring something else vs. being monitored itself (2026-09-06, grounded in `60_Claude/Standards/Agent Standard.md`). |

**Still empty, flagged rather than silently skipped (2026-09-06):** `How to write Hooks.md`, `How to write Commands.md`, `How to write Rules.md`, `How to make an Agentic OS.md`, `Memory Creation.md` — this pass only covered Skills and Agents, the two the current research round actually touched.

These are written from `_docs/Jarvis.md` and `_docs/Gaps.md` (both current as of 2026-08-19) — cited throughout rather than re-researched. Where this repo's own state changed *during* this session (conversation-capture, most notably), the doc says so explicitly with a real citation, not a guess.
