---
type: evergreen
status: sprout
created: 2026-09-06
updated: 2026-09-06
tags:
  - claude-kit
  - agents
  - internship-research-loop
notes: []
next: "None of the 7 agents below declare a `memory` field. contact-researcher is the obvious first candidate — it re-researches a company from scratch every invocation with no cache of its own. Flagged, not implemented, this pass."
---
# internship-research-loop — Agents

Real inventory of `.claude/agents/` in `gupta-builds/internship-research-loop`, all 7 files read directly this session. No links out from this note on purpose — this project's Toolkit layer is still being built out.

## contact-researcher

**File:** `.claude/agents/contact-researcher.md` · **Tools:** `Bash, Read` · **Model:** not pinned (inherits) · **Memory:** none

Given one company name, finds real, sourced contact signal (recruiter/HR, eng-blog byline, GitHub org member, LinkedIn search-snippet hit) using this repo's own `enrich.py` functions, reused via inline `python3 -c` calls rather than reimplemented. **The one rule that overrides everything else, stated in its own file:** a wrong guess is worse than an empty result — never infers a plausible name from company size/industry, never invents an email, reports "nothing found" as a valid, expected, complete answer for most small/private companies. Hard line inherited from `enrich.py`: public sources only, no LinkedIn scraping/CAPTCHA bypass/login walls, and it must never echo any part of `FIRECRAWL_API_KEY`'s actual value even truncated. Its output is a fixed template read *programmatically* by the skill that invoked it — explicitly told not to add conversational filler before/after.

**Use case:** invoked by `promote-dossier` and `promotion` at the contact-research checkpoint; can also run standalone for one company.

**Why an agent, not a skill:** exploratory search with an unbounded input space and a real cost to a wrong answer — the one place in this otherwise fully zero-LLM pipeline where judgment about *which* queries to run genuinely matters.

**How-to resource:** `https://code.claude.com/docs/en/sub-agents` (frontmatter fields, fresh-context isolation) and `.../hooks` (for anyone building a monitoring layer over this agent's runs later). Real candidate for the documented `memory` field (`project` scope) — it currently has zero memory of a company it already researched, redoing the same search from scratch if the same company resurfaces via a second dossier.

## program-writer

**File:** `.claude/agents/program-writer.md` · **Tools:** `Read, Grep, Glob, mcp__jarvis__vault_read, mcp__jarvis__vault_write, mcp__jarvis__vault_patch, mcp__jarvis__vault_list` · **Model:** sonnet · **Memory:** none

Writes or updates exactly one Program note per invocation, from either a dossier or a manual lead — never a batch, never free-hand outside this agent. Owns two real, load-bearing rules found live in production: **the Backfill Rule** (a fact narrated in prose — a class year, a deadline — must also land in its matching frontmatter field, since `Programs MOC.md` sorts/filters on frontmatter only and a prose-only fact is invisible to it; found live from a real incident, Appian, 2026-07-26) and **the Prep Checklist rule** (3-5 items generated from the posting's own real content, never a bare unchecked box — and if the source material is too thin to ground a real item, say so in the checklist rather than inventing filler).

**Use case:** invoked by `promotion` and by `promote-dossier`'s own logic — never called free-hand.

**Why an agent, not a skill:** needs live tool access to a *different* repository (the Jarvis vault, via a sibling checkout or the `jarvis` MCP tools) that a headless script under GitHub Actions CI never has — this is a "where it has to run" reason, not primarily a judgment-call reason, per this repo's own CLAUDE.md.

**How-to resource:** same sub-agents docs. A clean, real example of a bounded `tools` list — five entries, every one load-bearing (three `mcp__jarvis__*` calls plus `Read/Grep/Glob` for reading the dossier), nothing copy-pasted from a sibling agent.

## promotion

**File:** `.claude/agents/promotion.md` · **Tools:** `Read, Grep, Glob, AskUserQuestion, Task, mcp__jarvis__vault_read, mcp__jarvis__vault_list` · **Model:** sonnet · **Memory:** none

Orchestrates the manual-lead promotion path — gates human consent, invokes `contact-researcher`, `program-writer`, and a direct Contact-note write, then `tracking`, in that order, each as a separate `Task` invocation. Built to close a real, confirmed gap: as of 2026-09-04, three of the pipeline's four real promotions ever made (Uber, Western Digital, Deepgram) had a Program note and no paired Contact or Tracker note — only the one dossier-path promotion (Appian, via `promote-dossier`) got the full trio.

**Use case:** a real internship lead found by hand (career fair, referral, LinkedIn), never a dossier.

**Why an agent, not a skill:** it's an orchestrator reused by exactly one entry point today (`promoting-manual-find`) but written to be callable the same way if `promote-dossier` is ever refactored to share it — the sequencing logic for three other agents behind one consent gate would flood a skill's own inline prose if written there directly.

**How-to resource:** same sub-agents docs, specifically the `Task` tool section for how one agent invokes another.

## tracking

**File:** `.claude/agents/tracking.md` · **Tools:** `Read, Grep, Glob, mcp__jarvis__vault_read, mcp__jarvis__vault_write, mcp__jarvis__vault_patch, mcp__jarvis__vault_move, mcp__jarvis__vault_list` · **Model:** sonnet · **Memory:** none

Writes or updates exactly one Tracker/Each One note per invocation, at creation or at one of four real maintenance touch-points (a deadline fact changes; the Tailor sequence starts; actual submission; an outcome lands). Explicitly the most mechanical agent in the roster by its own description — mostly copying an already-known fact into the right field or moving a file between three folders (`Current/` → `Applied/` → `Result/`). **The one invariant it exists to protect:** a Tracker note's folder and its `date_applied`/`date_result` fields must never disagree: if it's already found out of sync from a cause other than its own edit, it reports the mismatch rather than silently fixing it.

**Use case:** invoked at promotion time (creation) or whenever one of the four named events has actually happened (maintenance) — never on a hunch that something changed.

**Why an agent, not a skill:** same "needs live vault tool access a headless CI script never has" reason as `program-writer` — its own internal logic is deliberately low-judgment.

**How-to resource:** same sub-agents docs. Good real example of an agent whose "What You Do Not Do" section is about *scope*, not risk — it explicitly won't touch the paired Program/Contact/Applying note itself, leaving that coordination to its caller.

## applying

**File:** `.claude/agents/applying.md` · **Tools:** `Read, Grep, Glob, AskUserQuestion, mcp__jarvis__vault_read, mcp__jarvis__vault_patch` · **Model:** sonnet · **Memory:** none

Runs the `draft`/`plan` half of the Tailor sequence (`prepare → draft → plan → approve → humanize → write → link → apply`) for one real application. **Not runnable yet, by its own frontmatter description and its own first section** — `Main Resume.md` is still generic filler and `Main Cover Letter.md` doesn't exist; the file is written now so the sequence is fully specified the moment the block clears, and explicitly states that fact is not itself a signal the block has cleared. **The evidence rule, the one thing that overrides everything else in this file:** every claim in a draft must trace to an approved resume/letter bullet, a linked Jarvis project note cited by path, or a fact the human explicitly supplies when asked — a JD requirement with no matching evidence is an honest, reported gap, never guessed or invented.

**Use case:** a real Applying note exists and needs its resume/cover-letter content plan drafted — currently blocked, do not invoke against real content until the block clears.

**How-to resource:** same sub-agents docs. This is the agent this repo's own ai-job-search review (the previous research pass) found the closest real analogue for in an external tool — ai-job-search's drafter-reviewer `/apply` pattern and its LaTeX/ATS-verification tooling are both still parked, waiting on this exact same blocker.

## testing-tools

**File:** `.claude/agents/testing-tools.md` · **Tools:** `Bash, Read, Grep, Glob` · **Model:** sonnet · **Memory:** none

Runs and interprets the repo's pytest suite against its own four conventions, and helps add a correctly-shaped test for a new source. Explicitly scoped tight to this codebase (~1,500 lines, ~1:1 test-to-code ratio) — never generic pytest advice. Real, specific finding in its own file: `test_schema_drift.py` holds 46 tests, a near-mechanical 4-5-per-source pattern across all 11 sources, confirmed as a real parametrization candidate not yet done — and it's explicitly told **not** to add a 12th copy-pasted block, and not to silently parametrize the whole file as a side effect of an unrelated ask.

**Use case:** before committing new tests, when the suite fails for a non-obvious reason, or when adding a new source and unsure whether it needs the schema-drift pattern.

**Why an agent, not a skill:** interpreting *why* a failure happened (a logic bug vs. a convention violation) and judging whether a new fixture is genuinely real data both need reading comprehension a lint rule doesn't have — same reasoning `review-loop-change` already established for production code, applied here to tests.

**How-to resource:** same sub-agents docs.

## loop-verifier

**File:** `.claude/agents/loop-verifier.md` · **Tools:** `Bash, Read, Grep, Glob, mcp__jarvis__vault_list, mcp__jarvis__vault_read, mcp__jarvis__search_simple` · **Model:** not pinned (inherits) · **Memory:** none

Standalone health check of the whole pipeline's **live state** — full test suite, `run.yml`/`recheck.yml`/`test.yml` run history via `gh run list`, vault dossier counts vs. what the run log claims was written, `seen_ids.json`/vault divergence (with a named, permanent, expected baseline divergence from a 2026-07-18 manual cleanup — the agent is told to look for *new*, unexplained divergence beyond that, not flag the baseline itself), and auto-filed GitHub issues matched against the four real call sites that can file one. Read-only by explicit rule — never modifies code, writes to the vault, deletes state, or files/comments on an issue itself. Output format ends in a required, non-hedged Verdict line (HEALTHY/DEGRADED/BROKEN) — no "should be working" without the check that would remove the hedge.

**Use case:** "is the pipeline actually healthy" — before trusting a cadence change, or as a periodic sanity check.

**This is real monitoring, but of a different kind than "did an agent run well":** it audits the *pipeline's* live state by running real commands each time, not Claude Code's `SubagentStop`/hook mechanism, and it does not watch other agents' or skills' own invocations — see the Skills note and `60_Claude/Patterns/skill-agent-invocation-log.md` (this repo, second-brain-claudekit) for that different, still-open problem.

**How-to resource:** same sub-agents docs. Its `## Output format`'s required closing Verdict line is the clearest real example in this whole project of the documented Template pattern for an output-format contract.
