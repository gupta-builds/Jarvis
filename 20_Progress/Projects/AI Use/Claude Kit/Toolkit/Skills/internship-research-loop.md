---
type: evergreen
status: sprout
created: 2026-09-06
updated: 2026-09-06
tags:
  - claude-kit
  - skills
  - internship-research-loop
notes: []
next: "Decide whether the 4 empty stub folders below get deleted or filled — flagged, not resolved, this pass. Decide a Toolkit home for this project's .claude/context/ and .claude/rules/ content (5 rule files, 2 context files) — no Context/Rules type folder exists in this Toolkit yet."
---
# internship-research-loop — Skills

Real inventory of `.claude/skills/` in `gupta-builds/internship-research-loop` (`~/projects/work/internship-research-loop/.claude/skills/`), read directly this session, not summarized from the repo's own CLAUDE.md table. No links out from this note on purpose — this project's Toolkit layer is still being built out.

**8 folders exist. Only 4 have a real SKILL.md.** The other 4 are empty directories with nothing inside — a real, current state of this repo, not a gap in this note.

## Empty stub folders (no SKILL.md — flagged, not filled in)

- `applying-rn/` — empty. The real equivalent lives as the `applying` agent (`.claude/agents/applying.md`), not a skill.
- `program-write/` — empty. Real equivalent: the `program-writer` agent.
- `testing/` — empty. Real equivalent: the `testing-tools` agent.
- `tracking/` — empty. Real equivalent: the `tracking` agent.

Pattern worth noting plainly: every one of these four empty skill folders has a same-purpose agent already built and in use. These look like leftover scaffolding from before the project settled on "agent" as the right shape for these four jobs (all four need either live vault-write tool access or Task-based orchestration — see the Agents note's "why an agent, not a skill" reasoning per file) — not four missing skills waiting to be written.

## promote-dossier

**File:** `.claude/skills/promote-dossier/SKILL.md` + `.claude/skills/promote-dossier/reference/note-templates.md`
**Trigger:** `/promote-dossier`

Turns one auto-discovered dossier (`List/Dossiers/<bucket>/`) into a Program + Contact + Tracker note trio in the Jarvis vault — Internship Pipeline Step 3 ("Commit"). Human-in-the-loop by design: reads the dossier, asks exactly two structured questions (target folder Serious/Considering; priority/category, defaulting to the auto-classified bucket with an explicit override option), launches the `contact-researcher` subagent and shows its findings *before* asking for an explicit go-ahead, then writes all three notes together or not at all — never partial output.

**Real, load-bearing detail found in the file, not the summary:** it explicitly forbids writing across repos via the GitHub API as a substitute for a real vault checkout or the `jarvis`/`jarvis-fs` MCP tools — `core/git_ops.py` exists specifically to solve the two-writer collision problem for this pipeline's own automated push, and a second interactive writer through a different mechanism would reintroduce that exact race with no retry/rebase handling.

**Use case:** the human is looking at a real, already-screened dossier and has decided it's worth pursuing.

**How-to resource:** `https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview` (Agent Skills — frontmatter, description-triggering) and `.../best-practices` (freedom tiers, output-format patterns). This skill's own Steps section is written almost entirely at low-freedom (exact two `AskUserQuestion` prompts, an exact "write all three or none" rule) — a good real example of the low-freedom tier the docs describe for a fragile, order-dependent operation.

## promoting-manual-find

**File:** `.claude/skills/promoting-manual-find/SKILL.md`
**Trigger:** `/promoting-manual-find`

Thin entry point — collects a manually-found lead's raw facts (career fair, referral, LinkedIn; no dossier exists) and hands off entirely to the `promotion` agent, which owns the actual orchestration. Exists as a separate skill from `promote-dossier` specifically because the input shape is genuinely different (no auto-classified bucket, no `list_origin` to link, source material that might be a screenshot or just a conversation) — forcing a manual lead through the dossier-shaped skill would mean guessing at fields that were never real.

**Use case:** the human found a real lead themselves (career fair, referral) with no dossier ever generated for it.

**How-to resource:** same Agent Skills docs as above. A clean, real example of the "two thin skills, one shared orchestrator agent" pattern rather than two full copies of the same three-note-writing logic — worth citing when explaining why a skill sometimes delegates its entire body of work to an agent instead of doing the work inline.

## review-loop-change

**File:** `.claude/skills/review-loop-change/SKILL.md`
**Trigger:** `/review-loop-change`

A repo-scoped convention checker, explicitly *not* a general code review — checks a diff against this repo's own four load-bearing conventions (zero-LLM unattended path, permissive-by-default filtering, fail-closed write-gate cost-ordering, cited-real-data rule comments). Reports-only; never modifies code. Its own file states plainly why this is a skill and not an agent: the repo is ~1,500 lines with a ~1:1 test-to-code ratio, changes land as small diffs, and the checklist is fixed and specific — none of that needs an isolated subagent context, and if the repo ever grows past small, individually-reviewable diffs, that reasoning should be revisited.

**Use case:** before committing/pushing a change to `core/`, `ingestion/`, `vault_writer/`, `run_pipeline.py`, or `recheck.py`.

**How-to resource:** same Agent Skills docs. Its `## Output format` section (`[PASS]`/`[FLAG]` lines ending in a one-line ship/fix verdict) is a real, local example of the documented Template pattern for a skill's output-format contract.

## tailoring-application

**File:** `.claude/skills/tailoring-application/SKILL.md`
**Trigger:** `/tailoring-application`

Thin entry point over the `applying` agent. Its very first instruction (step "0") is a hard stop-check: read the vault's `Resume & Cover Letter - System Map.md` Status section, and if `Main Resume.md` is still filler or `Main Cover Letter.md` doesn't exist, stop and say so rather than invoking `applying` against fake content. **Currently blocked for exactly that reason as of this writing.** Relays `applying`'s content plan to the human for approval, then flags that the downstream Humanizer gate (`30_Order/Standards/Humanized Writing Standard`) and the actual write/link steps are still manual — not automated yet.

**Use case:** a real Applying note exists (`status: Preparing`) and its documents need drafting — not runnable correctly until the resume/cover-letter block clears.

**How-to resource:** same Agent Skills docs. Worth noting: this skill's frontmatter `description` already states the blocker plainly ("Currently blocked on Main Resume.md/Main Cover Letter.md not being real yet") — a real example of a description doing real work (steering a session away from misusing the skill) rather than just restating the skill's name.
