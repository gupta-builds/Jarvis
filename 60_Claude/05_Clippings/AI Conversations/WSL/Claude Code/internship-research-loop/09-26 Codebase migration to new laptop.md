---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: wsl
title: "Codebase migration to new laptop"
started_at: 2026-09-26T20:07:32
ended_at: 2026-09-26T20:15:26
duration_minutes: 8
exported_at: 2026-09-26T15:15:03
project: internship-research-loop
cwd: '/home/anant_gupta/projects/work/internship-research-loop'
session_id: 5fda8f63-6988-454b-9ea5-6c6cb5a0c3aa
status: raw
turn_count: 2
tools_used:
  Bash: 11
  Read: 1
tokens:
  input: 44
  output: 18326
  cache_creation: 305073
  cache_read: 1925864
  total: 2249307
cost_usd: 1.788813
model:
  - claude-sonnet-5
files_touched:
  - "/home/anant_gupta/projects/work/internship-research-loop/.claude/skills/promote-dossier/reference/worked-example.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - wsl
---

# Codebase migration to new laptop

## You

Firstly, i am going to be migrating this entire codebase to the new laptop. I need to do this correctly making sure that each and every single thing is added onto the new laptop correctly. Everything that is mentioned over here needs to be perfectly committed, pushed, clean github directory, etc. We are going to be working on two seperate branches going forward from here because we have two laptops now. we will be working as if we are two developers working on a single project so there is no confusion at all. Whenever come across merge conflicts. Will be resolved through prs and correct github workflow now. Making sure that each and every single thing is clean. But in reality, we are just one person working across multiple devices. There is a lot of work taking place on the new laptop regarding environments, etc. which will be mimicked onto this laptop once the process has been perfected across windows and wsl. The vs code sync process is also really cool which needs to take place overe here. But what we are primarily focused on is literally cloning this repo to be identical on the new laptop after making sure that we are a perfect github workflow over here. Making sure that the notes are clean and ready to be executed. Everything is perfectly laid out for the move process and the two laptop build that is going to take place. First, research about this task in detail. After that, I want you to write afolder over here just like second-brain-claudekit. We need to note down everything required to move the codebase to the new laptop: `40_Resources/CS/Concepts/New Laptop/Codebases`. Make sure to write this note only after you have made sure that this codebase is ready to be cloned and worked across two laptops and has a clean github workflow already established. A complete identical clone is what is desired.

## Claude

I'll start by investigating the actual state of the repo — what's uncommitted, what's untracked, and whether anything looks like it shouldn't be pushed to a public repo — before proposing a migration/workflow plan.

Before running the blocked command, per this repo's hook gate:

1. **Current user request:** Prepare this codebase for a clean two-laptop git workflow (fully committed/pushed, no stray state) and then document the migration process as a note in the Jarvis vault.
2. **This command verifies:** the actual git status, remote config, and branch list of this repo, plus unstaged diff stats — the ground truth needed before deciding what to commit, gitignore, or push.

**Tool calls:**

- `Bash` — `echo "=== STATUS ===" && git status && echo "=== REMOTE ===" && git remote -v && echo "=== BRANCHES ===" && git branch -a && echo "=== DIFF STAT (tracked, unstaged) ===" && git diff --stat`
  ```
PreToolUse:Bash hook error: [Fact-Forcing Gate]

Before the first Bash command this session, present these facts:

1. The current user request in one sentence
2. What this specific command verifies or produces

Present the facts, then retry the same operation.

Narrow recovery: set `GATEGUARD_BASH_ROUTINE_DISABLED=1`; destructive Bash checks remain active.

Recovery: if GateGuard is blocking setup or repair work, run this session with `ECC_GATEGUARD=off` or add `pre:bash:gateguard-fact-force` to `ECC_DISABLED_HOOKS`.
  ```
- `Bash` — `echo "=== .gitignore ===" && cat .gitignore && echo "=== untracked dirs ===" && for d in .agents .codex .claude/skills/testing .claude/skills/promote-dossier/scripts .claude/skills/review-loop-change/reference .claude/skills/review-loop-change/scripts; do echo "--- $d ---"; find "$d" -maxdepth 3 -type f 2>/dev/null; done`
  ```
=== .gitignore ===
.venv/
__pycache__/
*.pyc
.pytest_cache/
# The scheduled workflow checks out gupta-builds/Jarvis into this path (a
# nested git repo). Without this, `git add -A` on this repo's own root
# records it as a gitlink (mode 160000) with no .gitmodules to back it —
# harmless to Jarvis, but corrupts this repo's own history and breaks
# actions/checkout's post-job submodule cleanup ("No url found for
# submodule path 'jarvis-checkout' in .gitmodules").
jarvis-checkout/

# Project-local agent memory (Claude Code's `memory: local` agent frontmatter field).
# contact-researcher's company-research cache lives here — real people's found names/
# emails/LinkedIn URLs, the same shape of found-PII the Contact note already stores in
# the Jarvis vault. Keeping it out of this repo's git history is deliberate, not an
# oversight — a second copy here would just be a place for it to drift.
.claude/agent-memory-local/
=== untracked dirs ===
--- .agents ---
.agents/skills/contact-researcher/SKILL.md
.agents/skills/cover-letter-alteration/SKILL.md
.agents/skills/review-loop-change/SKILL.md
.agents/skills/promoting-manual-find/SKILL.md
.agents/skills/resume-alteration/SKILL.md
.agents/skills/loop-health-check/SKILL.md
.agents/skills/generating-cover-letter-docx/SKILL.md
.agents/skills/tailoring-application/SKILL.md
.agents/skills/testing/SKILL.md
.agents/skills/promote-dossier/SKILL.md
.agents/skills/generating-resume-docx/SKILL.md
--- .codex ---
.codex/hooks.json
.codex/hooks/review-reminder.sh
.codex/hooks/vault-write-guard.sh
.codex/agents/program-writer.toml
.codex/agents/testing-tools.toml
.codex/agents/tracking.toml
.codex/agents/loop-verifier.toml
.codex/agents/promotion.toml
.codex/agents/cover-letter-builder.toml
.codex/agents/contact-researcher.toml
.codex/agents/applying.toml
--- .claude/skills/testing ---
.claude/skills/testing/SKILL.md
--- .claude/skills/promote-dossier/scripts ---
.claude/skills/promote-dossier/scripts/check_vault_reachability.py
.claude/skills/promote-dossier/scripts/validate_note_trio.py
--- .claude/skills/review-loop-change/reference ---
.claude/skills/review-loop-change/reference/example-review.md
--- .claude/skills/review-loop-change/scripts ---
.claude/skills/review-loop-change/scripts/check_conventions.py
  ```
- `Bash` — `echo "=== STATUS ===" && git status && echo "=== REMOTE ===" && git remote -v && echo "=== BRANCHES ===" && git branch -a && echo "=== DIFF STAT (tracked, unstaged) ===" && git diff --stat`
  ```
=== STATUS ===
On branch master
Your branch and 'origin/master' have diverged,
and have 5 and 16 different commits each, respectively.
  (use "git pull" if you want to integrate the remote branch with yours)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   .claude/agents/contact-researcher.md
	modified:   .claude/agents/loop-verifier.md
	modified:   .claude/skills/promote-dossier/SKILL.md
	modified:   .claude/skills/review-loop-change/SKILL.md
	modified:   .claude/skills/tailoring-application/SKILL.md
	modified:   .github/workflows/run.yml
	modified:   .gitignore

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	.agents/
	.claude/agents/cover-letter-builder.md
	.claude/skills/generating-cover-letter-docx/
	.claude/skills/generating-resume-docx/
	.claude/skills/promote-dossier/reference/worked-example.md
	.claude/skills/promote-dossier/scripts/
	.claude/skills/review-loop-change/reference/
	.claude/skills/review-loop-change/scripts/
	.claude/skills/testing/
	.codex/
	AGENTS.md

no changes added to commit (use "git add" and/or "git commit -a")
=== REMOTE ===
origin	https://github.com/gupta-builds/internship-research-loop.git (fetch)
origin	https://github.com/gupta-builds/internship-research-loop.git (push)
=== BRANCHES ===
* master
  remotes/origin/master
=== DIFF STAT (tracked, unstaged) ===
 .claude/agents/contact-researcher.md          | 21 ++++++++++++++++++++-
 .claude/agents/loop-verifier.md               | 12 +++++++++++-
 .claude/skills/promote-dossier/SKILL.md       |  5 ++++-
 .claude/skills/review-loop-change/SKILL.md    |  8 ++++++++
 .claude/skills/tailoring-application/SKILL.md | 21 +++++++++++++++------
 .github/workflows/run.yml                     | 16 ++++++++++++++++
 .gitignore                                    |  7 +++++++
 7 files changed, 81 insertions(+), 9 deletions(-)
  ```
- `Bash` — `echo "=== local-only commits (ahead) ===" && git log origin/master..master --oneline && echo "=== remote-only commits (behind) ===" && git log master..origin/master --oneline && echo "=== merge-base ===" && git merge-base master origin/master`
  ```
=== local-only commits (ahead) ===
bee5146 Switch hourly run to exact-quota selection with a dossier hard-pause
775dbd2 Add read-only ready-to-screen report
193d5a5 Add cold-start reseed for a wiped or relaunched vault
8186ea7 Add on-demand company-enrichment cache
96261d8 Add company registry, agent configs, and pipeline improvements
=== remote-only commits (behind) ===
ce13788 Recheck log — 2026-09-20
189d66b Recheck log — 2026-09-19
0e58e19 Recheck log — 2026-09-18
e29c3f1 Recheck log — 2026-09-17
5aada60 Recheck log — 2026-09-16
d5a9879 Recheck log — 2026-09-15
e3c4b9e Recheck log — 2026-09-14
da5d7d7 Recheck log — 2026-09-13
4a15b32 Recheck log — 2026-09-12
5563d09 Recheck log — 2026-09-11
22bfe28 Recheck log — 2026-09-10
2da9c54 Recheck log — 2026-09-09
5bdc7c7 Recheck log — 2026-09-08
401ad53 Recheck log — 2026-09-07
334cc62 Recheck log — 2026-09-06
6b174d8 Recheck log — 2026-09-05
=== merge-base ===
[REDACTED]
  ```
- `Bash` — `echo "=== files touched by remote-only commits ===" && git diff --stat master...origin/master -- . | tail -5 && git log --name-only master..origin/master --pretty=format: | sort -u | grep -v '^$' && echo "=== files touched by local-only commits ===" && git diff --stat origin/master...master | tail -30`
  ```
=== files touched by remote-only commits ===
 logs/rechecks.jsonl     | 16 ++++++++++++++++
 state/dossier_uids.json | 16 ++++++++--------
 2 files changed, 24 insertions(+), 8 deletions(-)
logs/rechecks.jsonl
state/dossier_uids.json
=== files touched by local-only commits ===
 .claude/settings.json                         |  57 ++++-
 .claude/skills/promoting-manual-find/SKILL.md |  31 +++
 .claude/skills/tailoring-application/SKILL.md |  29 +++
 .github/workflows/reseed.yml                  |  56 +++++
 .github/workflows/run.yml                     |   1 +
 CLAUDE.md                                     |  41 +++-
 core/classify.py                              |  14 +-
 core/company_cache.py                         | 139 ++++++++++++
 core/company_registry.py                      |  47 ++++
 core/debate.py                                |  11 +-
 core/filter.py                                |  24 +-
 core/relevance.py                             |  11 +-
 docs/PIPELINE_CONTRACT.md                     |  58 +++++
 ingestion/posting_page.py                     |  23 +-
 requirements.txt                              |   1 +
 reseed.py                                     | 167 ++++++++++++++
 run_pipeline.py                               | 168 +++++++++++++-
 screen_report.py                              |  74 ++++++
 tests/fixtures/posting_microsoft_careers.md   |  98 ++++++++
 tests/test_classify.py                        |  67 ++++++
 tests/test_company_cache.py                   | 102 +++++++++
 tests/test_company_registry.py                |  42 ++++
 tests/test_filter.py                          |  27 ++-
 tests/test_posting_page.py                    |  30 +++
 tests/test_reseed.py                          | 139 ++++++++++++
 tests/test_run_pipeline.py                    | 314 +++++++++++++++++++++++++-
 tests/test_schema_drift.py                    | 192 ++++++----------
 tests/test_screen_report.py                   |  66 ++++++
 tests/test_write_gate_failures.py             |  22 +-
 44 files changed, 2306 insertions(+), 188 deletions(-)
  ```
- `Bash` — `echo "=== settings.json diff ===" && git diff .claude/settings.json && echo "=== grep secrets-ish patterns in untracked new content ===" && grep -rIn -E "(api[_-]?key|token|secret|password|BEGIN (RSA|PRIVATE)|ghp_|sk-ant|AKIA)" .agents .codex .claude/skills/generating-cover-letter-docx .claude/skills/generating-resume-docx .claude/skills/promote-dossier/scripts .claude/skills/promote-dossier/reference/worked-example.md .claude/skills/review-loop-change/scripts .claude/skills/review-loop-change/reference .claude/skills/testing AGENTS.md 2>/dev/null | grep -vi "JARVIS_PUSH_TOKEN\|FIRECRAWL_API_KEY" | head -50`
  ```
=== settings.json diff ===
=== grep secrets-ish patterns in untracked new content ===
.agents/skills/loop-health-check/SKILL.md:13:Audit this pipeline's **actual live state**, the same way this project's manual audits (recorded 2026-07-19, 2026-07-25 — see the vault's `20_Progress/Internship/Building System/Phases Run.md` and related build-log notes for their exact prior findings, if useful as precedent) were done: every claim in your final report must be backed by a command you actually ran or a file you actually read this session. Never write "looks fine" or "should be working" — write what you checked, what it returned, and what that does or doesn't tell you. If a check is inconclusive (e.g. a token is missing, a folder doesn't exist to check), say that plainly instead of skipping it silently.
.agents/skills/review-loop-change/SKILL.md:35:- Pass: a new gate that only rejects on a specific, named affirmative signal (a denylist token, an explicit exclusion string), same shape as the existing ones.
.agents/skills/review-loop-change/SKILL.md:45:Look through this repo's existing rule comments — `core/filter.py`'s `_NON_US` denylist ("Every foreign token actually observed in live data..."), `core/relevance.py`'s stage1/stage2 regexes ("Real examples confirmed against seeded Greenhouse boards 2026-07-26..."), `core/profile.yaml`'s `terms_weight` comment. The convention is explicit: a new keyword, regex, denylist entry, or threshold is never justified by "this seems right" — it cites the actual company/posting/fixture it was checked against and the date it was checked.
.codex/agents/loop-verifier.toml:4:You audit this pipeline's **actual live state**, the same way this project's manual audits (recorded 2026-07-19, 2026-07-25 — see the vault's `20_Progress/Internship/Building System/Phases Run.md` and related build-log notes for their exact prior findings, if you want precedent) were done: every claim in your final report must be backed by a command you actually ran or a file you actually read this session. Never write "looks fine" or "should be working" — write what you checked, what it returned, and what that does or doesn't tell you. If a check is inconclusive (e.g. a token is missing, a folder doesn't exist to check), say that plainly instead of skipping it silently.
AGENTS.md:10:2. **Permissive-by-default / explicit-negative-signal filtering.** Every eligibility gate in `core/filter.py` (`location_eligible`, `degrees_eligible`, the term/season matchers) lets ambiguous or missing data pass; only an affirmative negative signal (a denylist token, an explicit exclusion string) rejects. A false negative here silently kills a real, eligible posting before a human ever sees it — worse than a false positive, which a human screens out at Step 2 of the pipeline anyway.
  ```
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/.claude/skills/promote-dossier/reference/worked-example.md`
- `Bash` — `echo "=== AGENTS.md head ===" && head -30 AGENTS.md && echo "=== diff of tracked modified files (condensed) ===" && git diff --stat .claude/agents/contact-researcher.md .claude/agents/loop-verifier.md .claude/skills/promote-dossier/SKILL.md .claude/skills/review-loop-change/SKILL.md .claude/skills/tailoring-application/SKILL.md .github/workflows/run.yml .gitignore`
  ```
=== AGENTS.md head ===
# internship-research-loop — Codex guidance

This repo is small (~1,500 lines) with a ~1:1 test-to-code ratio (`tests/` mirrors `core/`, `ingestion/`, `vault_writer/` file-for-file). See `README.md` for what it does and `PRD.md` for the full spec/status. This file is about how a Codex session should work in it.

## Conventions this codebase enforces — read before touching core/, ingestion/, vault_writer/, run_pipeline.py, or recheck.py

These are load-bearing design decisions, not style preferences. `/review-loop-change` checks a diff against all four before it ships — but know them regardless of whether you run that skill.

1. **Zero-LLM in the unattended path.** `run_pipeline.py`, `recheck.py`, `core/filter.py`, `core/relevance.py`, `core/classify.py`, everything under `ingestion/`, and `vault_writer/` run hourly/daily via GitHub Actions with no human in the loop, and must never call an LLM, however elaborate the logic gets (see `core/relevance.py`'s two-stage design for "elaborate but still zero-LLM"). `enrich.py` is the one manual-CLI exception — a human runs it on demand — and even it stays zero-LLM by its own docstring's rule.
2. **Permissive-by-default / explicit-negative-signal filtering.** Every eligibility gate in `core/filter.py` (`location_eligible`, `degrees_eligible`, the term/season matchers) lets ambiguous or missing data pass; only an affirmative negative signal (a denylist token, an explicit exclusion string) rejects. A false negative here silently kills a real, eligible posting before a human ever sees it — worse than a false positive, which a human screens out at Step 2 of the pipeline anyway.
3. **Fail-closed write-gate ordering.** `vault_writer/validate.py`'s `validate()` runs five checks in a specific cost order — `required_fields` → `not_duplicate` → `cross_source_duplicate` → `url_liveness` → `format_compliance` — free checks before ones that cost a network call, first failure wins. Don't reorder without restating the cost reasoning.
4. **Every new rule cites the real live data it was built from, in a comment.** A new regex, keyword, denylist entry, or threshold names the actual company/posting/fixture it was checked against and the date, right next to the code (see `core/filter.py`'s `_NON_US` denylist or `core/relevance.py`'s stage1/stage2 patterns for the expected shape). "Seems right" is not a citation.

## Note-template contracts (for `/promote-dossier`, `promotion`, and any future vault-writing code)

When writing Program, Contact, or Tracker/Each One notes into the Jarvis vault, every field below is **required and must always be present**, even as `null`/`[]` — same fail-closed-on-missing-fields discipline as `vault_writer/validate.py`'s `REQUIRED_FRONTMATTER_FIELDS` for dossiers. Full field-by-field templates with body structure live in `.Codex/skills/promote-dossier/reference/note-templates.md`; this is the contract summary.

**Program note** (`Programs/Serious/` or `Programs/Considering/`) — copied from the vault's own `30_Order/Templates/Career/Program Template.md`:
`name, company, program_type, eligible_classes, grad_year, role_type, wave, opens_date, deadline_posted, deadline_real, pay_per_week, pay_currency, duration_weeks, benefits, application_url, careers_page, list_origin, applying_note, recruiter_contact, tags`. No `status`/`next` field — Program notes are durable/static, they change only when a fact about the program itself changes.

**Contact note** (`Contacts/Each One/`) — copied from `30_Order/Templates/Career/Contact Template.md`:
`type: contact, name, role, company, linkedin_url, email, how_found, relationship, related_programs, last_contact_date, tags, next`.

**Tracker/Each One note** (`Tracker/Each One/`) — matches the vault's `30_Order/Standards/Internship/Internship Tracker Standard.md` and `Tracking Template.md`:
`type: tracker, program, contact, company, url, date_noted, date_researched, date_created, date_applied, date_result, result, deadline, related_notes, tags, next`.

**Applying note** (`20_Progress/Internship/Applying/`, created by the `applying` agent's caller, not written by this repo's own automation) — matches the vault's `30_Order/Standards/Internship/Applying Standard.md` and `Applying Template.md`:
`type: project, status, program, tracker, company, job_url, date_applied, date_response, next_deadline, resume_version, cover_letter, contacts, interview_note, related_progress, tags, next`.

Cross-links: Program `list_origin` → dossier, Program `recruiter_contact` ↔ Contact `related_programs`, Tracker `program`/`contact`/`related_notes` → the other three notes, Applying `program`/`tracker`/`contacts` → their respective notes. Don't invent new cross-link fields (e.g. a `tracker_note` field on Program) — propose a vault-template change explicitly if one's ever needed instead of adding it silently from a skill or agent.
=== diff of tracked modified files (condensed) ===
 .claude/agents/contact-researcher.md          | 21 ++++++++++++++++++++-
 .claude/agents/loop-verifier.md               | 12 +++++++++++-
 .claude/skills/promote-dossier/SKILL.md       |  5 ++++-
 .claude/skills/review-loop-change/SKILL.md    |  8 ++++++++
 .claude/skills/tailoring-application/SKILL.md | 21 +++++++++++++++------
 .github/workflows/run.yml                     | 16 ++++++++++++++++
 .gitignore                                    |  7 +++++++
 7 files changed, 81 insertions(+), 9 deletions(-)
  ```
- `Bash` — `git diff .github/workflows/run.yml .gitignore`
  ```
diff --git a/.github/workflows/run.yml b/.github/workflows/run.yml
index 48ef30d..85ab9a3 100644
--- a/.github/workflows/run.yml
+++ b/.github/workflows/run.yml
@@ -42,3 +42,19 @@ jobs:
           GH_TOKEN: ${{ github.token }}
           FIRECRAWL_API_KEY: ${{ secrets.FIRECRAWL_API_KEY }}  # discovery-time posting fetch; absent = thin dossiers, never a failure
         run: python run_pipeline.py
+
+      - name: Notify if new dossiers are ready to promote
+        # Added 2026-09-08. run_pipeline.py already writes written_count into the last
+        # line of logs/runs.jsonl; issues: write is already granted above (schema-drift
+        # notices use it) so this needs no new permission. Best-effort only (|| true) —
+        # a notification failure must never fail the pipeline run itself.
+        run: |
+          COUNT=$(tail -1 logs/runs.jsonl | python3 -c "import json,sys; print(json.load(sys.stdin).get('written_count', 0))" 2>/dev/null || echo 0)
+          if [ "$COUNT" -gt 0 ] 2>/dev/null; then
+            gh issue create \
+              --title "$COUNT new dossier(s) ready for /promote-dossier" \
+              --body "Run at $(date -u +%Y-%m-%dT%H:%M:%SZ). See logs/runs.jsonl for detail." \
+              --label "dossier-ready" || true
+          fi
+        env:
+          GH_TOKEN: ${{ github.token }}
diff --git a/.gitignore b/.gitignore
index 5e77bb8..99329f9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,3 +9,10 @@ __pycache__/
 # actions/checkout's post-job submodule cleanup ("No url found for
 # submodule path 'jarvis-checkout' in .gitmodules").
 jarvis-checkout/
+
+# Project-local agent memory (Claude Code's `memory: local` agent frontmatter field).
+# contact-researcher's company-research cache lives here — real people's found names/
+# emails/LinkedIn URLs, the same shape of found-PII the Contact note already stores in
+# the Jarvis vault. Keeping it out of this repo's git history is deliberate, not an
+# oversight — a second copy here would just be a place for it to drift.
+.claude/agent-memory-local/
  ```
- `Bash` — `git diff .claude/agents/contact-researcher.md .claude/agents/loop-verifier.md .claude/skills/promote-dossier/SKILL.md .claude/skills/review-loop-change/SKILL.md .claude/skills/tailoring-application/SKILL.md`
  ```
diff --git a/.claude/agents/contact-researcher.md b/.claude/agents/contact-researcher.md
index fa40408..be71cb1 100644
--- a/.claude/agents/contact-researcher.md
+++ b/.claude/agents/contact-researcher.md
@@ -1,11 +1,25 @@
 ---
 name: contact-researcher
-description: Given a company name, finds real, sourced contact signal (recruiter, HR, engineering-blog byline, GitHub org member, LinkedIn search-snippet hit) using this repo's enrich.py. Never fabricates a plausible-sounding contact — reports "nothing found" honestly when that's the real outcome. Invoked by the promote-dossier skill at Step 3 (Commit); can also be called standalone for one company.
+description: Given a company name, finds real, sourced contact signal (recruiter, HR, engineering-blog byline, GitHub org member, LinkedIn search-snippet hit) using this repo's enrich.py. Never fabricates a plausible-sounding contact — reports "nothing found" honestly when that's the real outcome. Invoked by the promote-dossier skill at Step 3 (Commit); can also be called standalone for one company. Caches a dated result per company (see Memory section) so a re-promoted or re-checked company doesn't repeat live searches within 30 days.
 tools: Bash, Read
+memory: local
 ---
 
 You research **one company's** real, public contact signal for the internship-research-loop pipeline. You are the exploratory step in an otherwise deterministic pipeline (see `core/filter.py`, `core/relevance.py`, `core/classify.py` — all zero-LLM, keyword-based) — that is exactly why this step is a subagent instead of a script. Your only job is to look, and to say precisely what you found and where it came from.
 
+## Memory — company research cache (added 2026-09-08)
+
+`memory: local` gives you a real, persistent `MEMORY.md` (`.claude/agent-memory-local/contact-researcher/`, gitignored — deliberately not shared via git, since a cached recruiter name/email is the same kind of found-PII the Contact note already stores in the vault; keeping a second copy in this repo's own git history would just be a place for it to drift, not a benefit). This exists because you were identified as the clearest case for this mechanism in this repo's own build notes: you had no cache of your own and re-ran every search from scratch on every invocation, even for a company already researched last week.
+
+**Before running any live search**, check whether `MEMORY.md` already has a dated entry for this exact company name.
+- **Entry exists and is 30 days old or less**: report it as cached — see the output format's new `Cache` line — rather than re-running the live searches. State the date plainly; do not present a cached result as if it were just fetched.
+- **Entry exists but is older than 30 days, or doesn't exist**: research live, exactly as documented below. A company's public hiring presence genuinely changes — don't extend the cache window past 30 days to save a few tool calls.
+- **The caller explicitly asks for a refresh** ("re-research," "check again," "ignore the cache"): always research live regardless of cache age.
+
+**After a live run** (cache miss, stale entry, or explicit refresh), append or replace that company's entry in `MEMORY.md` with today's date and the same structured findings you're about to report — a cache entry is a dated record of a real past finding, never a new guess, so this doesn't loosen the "never present a guess as a finding" rule anywhere, it just means the finding might have been made a few days ago instead of a few seconds ago.
+
+If `MEMORY.md` is approaching the 200-line/25KB auto-load budget, trim the oldest entries rather than letting new ones silently stop being written — a cache that's gone stale from neglect is worse than a slightly smaller one that's actually current.
+
 ## The one rule that overrides everything else
 
 **A wrong guess here is worse than an empty result.** If you are not looking at an actual name, title, or byline that a real tool call returned, do not report it. Never infer a plausible name from a company's size or industry. Never invent an email address that "looks right." Never present a guess as a finding. If nothing real turns up, say so — "nothing found" is a valid, complete, honest answer and is the expected outcome for most small/private companies.
@@ -58,6 +72,11 @@ For each hit, report: **name/title found → source URL → which query surfaced
 ```
 ## Contact research: <Company>
 
+### Cache
+- served from cache, researched <YYYY-MM-DD>
+  -- or --
+- live research (no cache entry / entry older than 30 days / explicit refresh)
+
 ### Recruiter / university recruiting search
 - <name/title> — <url> (query: "<company> recruiter")
   -- or --
diff --git a/.claude/agents/loop-verifier.md b/.claude/agents/loop-verifier.md
index e740106..2faf9b1 100644
--- a/.claude/agents/loop-verifier.md
+++ b/.claude/agents/loop-verifier.md
@@ -1,11 +1,18 @@
 ---
 name: loop-verifier
-description: Standalone health check of the whole internship-research-loop pipeline — test suite, scheduled-run history, vault-vs-log agreement, seen_ids/vault divergence, auto-filed issues. Produces a dated, evidence-cited verdict, the automated equivalent of the manual audits run on 2026-07-19 and 2026-07-25. Invoke when asked "is the pipeline actually healthy", before trusting a cadence change, or periodically as a sanity check — never invents a result it didn't verify.
+description: Standalone health check of the whole internship-research-loop pipeline — test suite, scheduled-run history, vault-vs-log agreement, seen_ids/vault divergence, auto-filed issues. Produces a dated, evidence-cited verdict, the automated equivalent of the manual audits run on 2026-07-19 and 2026-07-25. Invoke when asked "is the pipeline actually healthy", before trusting a cadence change, or periodically as a sanity check — never invents a result it didn't verify. Keeps a real, committed history of past verdicts (see Memory) so a periodic check can report a trend, not just a snapshot.
 tools: Bash, Read, Grep, Glob, mcp__jarvis__vault_list, mcp__jarvis__vault_read, mcp__jarvis__search_simple
+memory: project
 ---
 
 You audit this pipeline's **actual live state**, the same way this project's manual audits (recorded 2026-07-19, 2026-07-25 — see the vault's `20_Progress/Internship/Building System/Phases Run.md` and related build-log notes for their exact prior findings, if you want precedent) were done: every claim in your final report must be backed by a command you actually ran or a file you actually read this session. Never write "looks fine" or "should be working" — write what you checked, what it returned, and what that does or doesn't tell you. If a check is inconclusive (e.g. a token is missing, a folder doesn't exist to check), say that plainly instead of skipping it silently.
 
+## Memory — verdict history (added 2026-09-08)
+
+`memory: project` gives you a real, git-shareable `MEMORY.md` (`.claude/agent-memory/loop-verifier/`, committed — unlike `contact-researcher`'s cache, this holds no PII, only pipeline health facts already public in this repo's own `logs/*.jsonl`, so there's no reason to gitignore it; keeping it committed also means the history survives across machines/sessions the same way `logs/runs.jsonl` already does). Before writing your final report, read the most recent prior entry (if any) and note in the Verdict section whether the headline numbers moved since then (test pass count, workflow success rate, verdict level) — a periodic sanity check is far more useful when it can say "DEGRADED, same as last check on 2026-09-01" versus "DEGRADED, was HEALTHY as of 2026-09-01" than when every run reads as an isolated snapshot with no memory of the last one.
+
+After finishing your report, append a compact entry to `MEMORY.md` — date, verdict, and the headline number from each of the five sections (test pass/fail count, workflow success counts, dossier count match y/n, new divergence found y/n, unmapped-issue count). Keep entries compact (one block per run, not the full report) so this stays well under the 200-line/25KB auto-load budget for a long time; if it does approach that budget, trim the oldest entries rather than stop writing new ones.
+
 You are read-only. Never modify code, never write to the vault, never delete state files, never file or comment on issues yourself — you report, a human or a separate task acts on it.
 
 ## Checks to run, in this order
@@ -61,6 +68,9 @@ test.yml:    <...>
 
 ## Verdict
 <one of: HEALTHY / DEGRADED / BROKEN, one paragraph justifying it from the five sections above — no hedge words ("should be", "probably") without the check that would remove the hedge>
+<one line comparing to the most recent MEMORY.md entry, if one exists: "same as last check on <date>" / "improved from <X> on <date>" / "regressed from <X> on <date>" / "no prior entry — first recorded run">
 ```
 
+After reporting, append this run's compact entry to `MEMORY.md` per the Memory section above.
+
 If `gh` isn't authenticated, or the `jarvis` MCP tools aren't connected to a live vault (verify with a cheap `mcp__jarvis__vault_list` call before relying on it — an error there means "not connected," not "empty vault"), say exactly that in the relevant section instead of silently omitting the check or guessing at what it would probably show.
diff --git a/.claude/skills/promote-dossier/SKILL.md b/.claude/skills/promote-dossier/SKILL.md
index 2a52a40..697e328 100644
--- a/.claude/skills/promote-dossier/SKILL.md
+++ b/.claude/skills/promote-dossier/SKILL.md
@@ -22,6 +22,8 @@ Two ways that access can exist, and this skill works with either — but do not
    If this is how the vault is reachable, use plain `Read`/`Edit`/`Write` on paths under `../Jarvis/` (or wherever it's actually checked out — ask if it's not obviously sibling), and use `git status`/`git diff` in that checkout before committing so the human can see exactly what's about to be written, same review discipline as any other repo.
 2. **Obsidian MCP tools** (`jarvis`, `jarvis-fs` in this session's `.claude/settings.json` — confirmed connected in this repo as of 2026-07-26) — if Obsidian is running locally with its Local REST API plugin enabled, `mcp__jarvis__vault_read` / `vault_write` / `vault_patch` reach the live vault directly. This is what was actually used to verify this skill's templates against the real vault. It does not require a separate git checkout, but it does require Obsidian to actually be open with that plugin active — don't assume it's connected just because the tools are listed; call `mcp__jarvis__vault_list` first and confirm it returns real vault content before proceeding.
 
+**Run [`scripts/check_vault_reachability.py`](scripts/check_vault_reachability.py) first (added 2026-09-07)** rather than reasoning through the two paths above from scratch each time — it checks for a sibling checkout and for jarvis/jarvis-fs MCP config registration mechanically. It cannot confirm a live MCP connection (that's session state, invisible to a standalone script) — if it reports the MCP path as possible, still call `mcp__jarvis__vault_list` yourself and confirm real content comes back before proceeding. See [`reference/worked-example.md`](reference/worked-example.md) for this script's real output in context.
+
 If neither is available, **stop and tell the user** — don't guess at paths or fabricate vault content from memory of what this document says the vault contains.
 
 **Do not attempt to write across the two repos via the GitHub API** (`mcp__github__create_or_update_file` etc.) as a substitute for either path above. `core/git_ops.py` in this repo exists specifically to solve the two-writer collision problem (this pipeline's own CI + the vault's own independent auto-commit cycle) for the one automated writer this pipeline has. Adding a second interactive writer that pushes through a different mechanism (the API instead of a local checkout + normal git) reintroduces exactly that race with no equivalent retry/rebase handling. If you find yourself reaching for the GitHub API here, stop — that's a sign this prerequisite isn't actually met, not a reason to route around it.
@@ -53,7 +55,8 @@ On yes:
 1. Create any missing folder (`Programs/Considering/`, `Contacts/Each One/`, `Tracker/Each One/` — as of 2026-07-26 none of these three exist in the vault yet, only `Programs/Serious/` does) as part of this same write, not speculatively beforehand.
 2. Write the Program note, Contact note, and Tracker/Each One note per `reference/note-templates.md`, cross-linked as documented there (`list_origin`, `recruiter_contact`, `related_programs`, `program`, `contact`, `related_notes`). Before finalizing, run the "Backfill structured fields from the same content the body prose is drawn from" check in `reference/note-templates.md` — a fact narrated in the Eligibility/Traps prose (class year, degree level, a stated date) must also land in its matching frontmatter field, not just the prose; `Programs/Programs MOC.md` sorts and filters on `deadline_real`/`eligible_classes`, so a fact that's only in prose is invisible to it. Fill the Prep Checklist with 3-5 real items grounded in the posting's own stated requirements/duties, not a bare checkbox. Tracker's `date_created` is today, same as `date_researched` — not deferred to a later Applying note.
 3. Fold the contact-researcher subagent's real findings (with sources) into the Contact note's Facts section verbatim — don't paraphrase away the citations.
-4. Report back the three paths written and a one-line summary of what's now true that wasn't before.
+4. **Validate the trio (added 2026-09-07):** if the vault was reached via the sibling-checkout path, run [`scripts/validate_note_trio.py`](scripts/validate_note_trio.py) against the three real file paths — it mechanically checks every required frontmatter field is present and that the three notes' cross-links actually point at each other correctly, catching exactly the class of mistake a model re-deriving the field list from memory each time is prone to. If the vault was reached via MCP instead, the script can't run (no filesystem access to a live MCP session) — do the equivalent check by hand: read all three notes back with `mcp__jarvis__vault_read` and manually confirm the same required-fields/cross-link rules. Either way, do not report the promotion complete until this check (scripted or manual) has actually run. See [`reference/worked-example.md`](reference/worked-example.md) for a full run in context.
+5. Report back the three paths written, the validation result, and a one-line summary of what's now true that wasn't before.
 
 On no (or if the human wants changes): go back to step 2/3 as needed. Never write partial output — if any of the three notes can't be completed (e.g. a required cross-link target doesn't exist yet), stop and say so rather than writing two of three and leaving the third for later.
 
diff --git a/.claude/skills/review-loop-change/SKILL.md b/.claude/skills/review-loop-change/SKILL.md
index 9c63538..7b7cdc0 100644
--- a/.claude/skills/review-loop-change/SKILL.md
+++ b/.claude/skills/review-loop-change/SKILL.md
@@ -12,6 +12,14 @@ A repo-scoped convention check, not a general code review (use the built-in `/co
 
 This repo is ~1,500 lines with a ~1:1 test-to-code ratio (`tests/` mirrors `core/`, `ingestion/`, `vault_writer/` almost file-for-file) and changes land as small, individually-reviewable diffs (see `git log` — commits like "Four new discovery sources" or a single-file bloat fix, not sprawling multi-file rewrites). A diff this size doesn't need an isolated subagent context to protect the main conversation's window, and the checklist below is fixed and specific rather than open-ended — both are exactly the case where a lightweight, inline skill beats spinning up a separate agent. If this repo ever grows enough that a single diff regularly spans dozens of files, revisit this choice; the checklist would still apply, only the delivery mechanism would need to change.
 
+## Reference
+
+[`reference/example-review.md`](reference/example-review.md) — a worked example of the script below catching a real violation, and passing a fixed version, so you know what a FLAG/NOTE/clean run actually looks like before you rely on one.
+
+## Run the mechanical half first (added 2026-09-06)
+
+Before reasoning through the checklist by hand, run [`scripts/check_conventions.py`](scripts/check_conventions.py) against the actual diff (`git diff`, `--cached`, or `--against <ref>`, matching what the user is reviewing). It mechanically covers checks 1 and 4 in full (a `FLAG` there is a real pattern match — treat it as a likely violation to confirm, not a maybe) and narrows checks 2 and 3 to a `NOTE` on the specific lines/files worth reading closely — it does not replace judgment on those two, it points you at exactly where to apply it. This is what makes this skill work reliably for a model with less capacity to hold the whole checklist in mind at once: the pattern-matching is done by code, not recalled from a description.
+
 ## What to check
 
 Run against the actual diff — `git diff` (unstaged), `git diff --cached` (staged), or a specific file/range if the user names one. This is a **reports-only** check: never modify code as part of this skill; if a violation should be fixed, say so and let the user (or a follow-up edit) do it.
diff --git a/.claude/skills/tailoring-application/SKILL.md b/.claude/skills/tailoring-application/SKILL.md
index 960ba3f..3c255a3 100755
--- a/.claude/skills/tailoring-application/SKILL.md
+++ b/.claude/skills/tailoring-application/SKILL.md
@@ -1,15 +1,15 @@
 ---
 name: tailoring-application
-description: Runs the Tailor sequence (draft, plan, human approval, Humanizer gate, write, link) for one real application's resume and cover letter, per Application Document Preparation. Use when a real Applying note exists and its documents need drafting. Currently blocked on Main Resume.md/Main Cover Letter.md not being real yet — see the skill's own first step, which checks this before doing anything else.
+description: Runs the Tailor sequence (draft, plan, human approval, Humanizer gate, write, link) for one real application's resume and cover letter, per Application Document Preparation. Use when a real Applying note exists and its documents need drafting. Resume-side blocker cleared 2026-08-29 (Main Resume.md is real); cover-letter-side still blocked on Main Cover Letter.md not existing — see the skill's own first step, which checks current state before doing anything, rather than trusting either "still blocked" or "already cleared" as a given.
 ---
 
 # /tailoring-application
 
-Thin entry point over the `applying` subagent (`.claude/agents/applying.md`), which owns the actual `draft`/`plan` logic. This skill's only job beyond invoking that agent is the parts of `Application Document Preparation`'s sequence that happen around it: confirming the block hasn't already been checked and reported, and handing the approved plan onward to the Humanizer gate and the write step once those exist.
+Thin entry point over the `applying` subagent (`.claude/agents/applying.md`), which owns the actual `draft`/`plan` logic. This skill's only job beyond invoking that agent is the parts of `Application Document Preparation`'s sequence that happen around it: confirming current block state (don't trust a stale note — check the real files), and handing the approved plan onward to the Humanizer gate and the write step, which now has real tooling (see Step 4).
 
-## 0. Check the block first — do not skip this
+## 0. Check the block first — check real files, not a note about them
 
-Read `20_Progress/Internship/Building System/Resume & Cover Letter - System Map.md`'s Status section directly. If `Main Resume.md` is still generic filler or `Main Cover Letter.md` doesn't exist, **stop here and tell the user** — do not invoke `applying` against filler content. This check exists specifically because the block is the expected state as of this writing; running past it silently would produce a content plan built on fake evidence, exactly what the evidence rule (Resume/Cover Letter Alteration Standard §2) exists to prevent.
+**Corrected 2026-09-06**: this step used to say "Main Resume.md is still generic filler" — that was true when written (2026-08-28) and stale by the next day (2026-08-29, when the file was actually rebuilt). Don't repeat that mistake: read `20_Progress/Internship/Resumes/Main Resume.md` directly and check whether it still carries `#evidence/user-confirmed-<date>` tags and real Experience/Projects content, rather than trusting this note's own claim about it. As of 2026-09-06 it does — the resume half is real. Separately, check `20_Progress/Internship/Cover Letters/Main Cover Letter.md` directly — if it doesn't exist, or exists with most fragment slots still `#evidence/needed` placeholders, **stop here for the cover-letter half and tell the user** (`.claude/agents/cover-letter-builder.md`, promoted 2026-09-08, is what fills this in). Do not invoke `applying` against filler content for whichever half is still blocked — check both independently, since one clearing doesn't mean the other has.
 
 ## Steps (once the block above has actually cleared)
 
@@ -20,10 +20,19 @@ Per `Application Document Preparation`'s `prepare` step — this skill runs *for
 Hand it the Applying note's path. It reads the JD/fit/networking fields, `Main Resume.md`/`Main Cover Letter.md`, drafts, and returns a content plan for approval — it does not write past that point.
 
 ### 3. Relay the plan for approval
-Present `applying`'s content plan to the user exactly as returned. On approval, the plan moves to the Humanizer gate (`30_Order/Standards/Humanized Writing Standard`) — not yet automated as of this writing; flag that the `humanize`/`write`/`link` steps are still manual until that tooling exists, same honesty `Application Document Preparation`'s own "What Actually Runs Today" section states.
+Present `applying`'s content plan to the user exactly as returned. On approval, the plan moves to the Humanizer gate (`30_Order/Standards/Humanized Writing Standard`) — still manual as of this writing (the Humanizer gate itself has no automated tooling yet); flag that clearly rather than assuming it's been run.
+
+### 4. Write — real tooling now exists (added 2026-09-06)
+
+Once a plan has passed the Humanizer gate, hand the approved resume content to `generating-resume-docx` and the approved cover-letter content to `generating-cover-letter-docx` (both `.claude/skills/`, sibling to this one). Each is format-only — they lay out already-approved content into a real `.docx`, they do not decide anything. Report back both generated file paths and any format warnings either skill returns; a warning (e.g. content running long) is the human's call, not something to resolve silently.
+
+### 5. Link
+
+Once both documents are written, update the Applying note's `resume_version`/`cover_letter` fields to point at the real files — per `Application Document Preparation`'s `link` step. This skill does the update; it is not automatic.
 
 ## What this skill does not do
 
 - Does not draft content itself — that's `applying`.
-- Does not write a `.docx`/`.pdf` file — no tooling for that exists yet in this repo.
+- Does not decide the letter's or resume's actual wording — `generating-cover-letter-docx`/`generating-resume-docx` lay out already-approved content, they don't write it.
+- Does not run the Humanizer gate itself — that's a separate, still-manual step before Step 4.
 - Does not create the Applying note — that's a separate, earlier vault-side step.
  ```
- `Bash` — `find .claude/skills/generating-cover-letter-docx .claude/skills/generating-resume-docx .claude/skills/testing .claude/agents/cover-letter-builder.md -type f 2>/dev/null | xargs -I{} sh -c 'echo "--- {} ---"; wc -l "{}"'`
  ```
--- .claude/agents/cover-letter-builder.md ---
102 .claude/agents/cover-letter-builder.md
--- .claude/skills/generating-cover-letter-docx/SKILL.md ---
44 .claude/skills/generating-cover-letter-docx/SKILL.md
--- .claude/skills/generating-resume-docx/SKILL.md ---
43 .claude/skills/generating-resume-docx/SKILL.md
--- .claude/skills/testing/SKILL.md ---
30 .claude/skills/testing/SKILL.md
--- .claude/skills/generating-cover-letter-docx/scripts/generate_cover_letter_docx.py ---
232 .claude/skills/generating-cover-letter-docx/scripts/generate_cover_letter_docx.py
--- .claude/skills/generating-cover-letter-docx/reference/cover-letter-reference.md ---
69 .claude/skills/generating-cover-letter-docx/reference/cover-letter-reference.md
--- .claude/skills/generating-resume-docx/scripts/generate_resume_docx.py ---
232 .claude/skills/generating-resume-docx/scripts/generate_resume_docx.py
--- .claude/skills/generating-resume-docx/reference/resume-reference.md ---
62 .claude/skills/generating-resume-docx/reference/resume-reference.md
  ```
- `Bash` — `echo "=== python syntax check on new/changed scripts ===" && python3 -m py_compile .claude/skills/promote-dossier/scripts/check_vault_reachability.py .claude/skills/promote-dossier/scripts/validate_note_trio.py .claude/skills/review-loop-change/scripts/check_conventions.py $(find .claude/skills/generating-cover-letter-docx .claude/skills/generating-resume-docx -name '*.py' 2>/dev/null) && echo OK`
  ```
=== python syntax check on new/changed scripts ===
OK
  ```

## Actions Taken
- Files created: (none)
- Files modified: (none)
- Files deleted: (none)
- Commands run: echo "=== STATUS ===" && git status && echo "=== REMOTE ===" && git remote -v && echo "=== BRANCHES ===" && git branch -a && echo "=== DIFF STAT (tracked, unstaged) ===" && git diff --stat, echo "=== .gitignore ===" && cat .gitignore && echo "=== untracked dirs ===" && for d in .agents .codex .claude/skills/testing .claude/skills/promote-dossier/scripts .claude/skills/review-loop-change/reference .claude/skills/review-loop-change/scripts; do echo "--- $d ---"; find "$d" -maxdepth 3 -type f 2>/dev/null; done, echo "=== local-only commits (ahead) ===" && git log origin/master..master --oneline && echo "=== remote-only commits (behind) ===" && git log master..origin/master --oneline && echo "=== merge-base ===" && git merge-base master origin/master, echo "=== files touched by remote-only commits ===" && git diff --stat master...origin/master -- . | tail -5 && git log --name-only master..origin/master --pretty=format: | sort -u | grep -v '^$' && echo "=== files touched by local-only commits ===" && git diff --stat origin/master...master | tail -30, echo "=== settings.json diff ===" && git diff .claude/settings.json && echo "=== grep secrets-ish patterns in untracked new content ===" && grep -rIn -E "(api[_-]?key|token|secret|password|BEGIN (RSA|PRIVATE)|ghp_|sk-ant|AKIA)" .agents .codex .claude/skills/generating-cover-letter-docx .claude/skills/generating-resume-docx .claude/skills/promote-dossier/scripts .claude/skills/promote-dossier/reference/worked-example.md .claude/skills/review-loop-change/scripts .claude/skills/review-loop-change/reference .claude/skills/testing AGENTS.md 2>/dev/null | grep -vi "JARVIS_PUSH_TOKEN\|FIRECRAWL_API_KEY" | head -50, echo "=== AGENTS.md head ===" && head -30 AGENTS.md && echo "=== diff of tracked modified files (condensed) ===" && git diff --stat .claude/agents/contact-researcher.md .claude/agents/loop-verifier.md .claude/skills/promote-dossier/SKILL.md .claude/skills/review-loop-change/SKILL.md .claude/skills/tailoring-application/SKILL.md .github/workflows/run.yml .gitignore, git diff .github/workflows/run.yml .gitignore, git diff .claude/agents/contact-researcher.md .claude/agents/loop-verifier.md .claude/skills/promote-dossier/SKILL.md .claude/skills/review-loop-change/SKILL.md .claude/skills/tailoring-application/SKILL.md, find .claude/skills/generating-cover-letter-docx .claude/skills/generating-resume-docx .claude/skills/testing .claude/agents/cover-letter-builder.md -type f 2>/dev/null | xargs -I{} sh -c 'echo "--- {} ---"; wc -l "{}"', echo "=== python syntax check on new/changed scripts ===" && python3 -m py_compile .claude/skills/promote-dossier/scripts/check_vault_reachability.py .claude/skills/promote-dossier/scripts/validate_note_trio.py .claude/skills/review-loop-change/scripts/check_conventions.py $(find .claude/skills/generating-cover-letter-docx .claude/skills/generating-resume-docx -name '*.py' 2>/dev/null) && echo OK
- Tool call tally: Bash (11), Read (1)

