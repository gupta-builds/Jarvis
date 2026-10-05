---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: wsl
title: "Session 2 commits and targeted fixes"
started_at: 2026-10-04T19:36:46
ended_at: 2026-10-04T19:44:48
duration_minutes: 8
exported_at: 2026-10-04T19:45:05
project: internship-research-loop
cwd: '/home/anant_gupta/projects/work/internship-research-loop'
session_id: 5e44242e-0b41-4634-99e5-15932ecd693d
status: raw
turn_count: 2
tools_used:
  Bash: 11
  mcp__jarvis__search_simple: 1
  mcp__jarvis__vault_get_document_map: 3
  mcp__jarvis__vault_list: 3
  mcp__jarvis__vault_patch: 2
  mcp__jarvis__vault_read: 5
  mcp__jarvis__vault_search_placeholder: 1
  Read: 5
  ToolSearch: 1
tokens:
  input: 118
  output: 42439
  cache_creation: 386967
  cache_read: 6372480
  total: 6802004
cost_usd: null
model:
  - claude-sonnet-5-5
files_touched:
  - "/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py"
  - "/home/anant_gupta/projects/work/internship-research-loop/tests/test_run_pipeline.py"
tags:
  - input
  - ai-conversation
  - claude-code
  - wsl
---

# Session 2 commits and targeted fixes

## You



<pasted_content id="d80f">
Session 1 is done and fully archived in [[Claude Code Prompts - Archive]] (read that entry in full before starting — it has the complete coverage-pass findings list, every corrected claim, and the open Decisions list; this prompt does not repeat it, only acts on a deliberately narrow slice of it). Nothing from Session 1 is uncommitted because two other, independent things were touching the same working tree: the human deleting `.agents/skills/*` by hand, and a separate Codex session editing `AGENTS.md`/adding `docs/codex/`. **The human has since confirmed directly (2026-10-04) that both are valid, intentional changes — there is no collision to resolve, nothing to restore, nothing to question. Task 1 below only needs to confirm the tree still looks like that, not investigate it as if it were still an open question.**

**Scope, stated explicitly per the literal-instruction-following lesson above:** this session commits Session 1's own work, fixes exactly two findings from its coverage-pass list (Finding 1: quota-shortfall mass exclusion; Finding 8: `reseed.yml` shell-injection pattern), and patches one small, already-identified doc inconsistency (§1 of [[Internship Notes Standard]] being stale relative to its own §8). **Findings 2-7 and 9-11, and every item on the Decisions list, are explicitly out of scope this round** — don't fix them, don't investigate them further, don't pre-build toward them. This is a deliberate scope cut, not an oversight; a later session picks those up on their own pass.

Run at **`effort: high`**.

**Non-negotiable rules:**
- **Write your full report into this file before you consider the session done.** Not a chat reply, not a summary to the human alone — the actual Task Order below, each item resolved, written directly into this file's body, the way the "Report Back" section specifies. If this file still reads like this prompt (unexecuted) at the start of your next session, that's the signal the report never landed — don't let that happen a third time.
- **Task 1 first, literally, before anything else is touched or committed.** Confirm — don't re-litigate — that the `.agents/skills/*` deletion and the `AGENTS.md`/`docs/codex/` changes are present and look like what the human described. If anything else, beyond those two known groups and Session 1's own changes, is sitting in the tree unexpectedly, stop and report that specifically rather than committing through it.
- **Commit Session 1's own changes separately from the other two groups.** This project's own git-hygiene history (Prompt 2's bundling issue, Prompt 7's clean-commit discipline, both in [[Claude Code Prompts - Archive]]) is explicit that unrelated work landing in the same commit is a real problem even when nothing in it is wrong — stage and commit `ingestion/posting_page.py`, `vault_writer/writer.py`, `vault_writer/validate.py`, `run_pipeline.py`, `grade_resume.py`, `README.md`, `PRD.md`, `.cursor/skills/resume-alteration/SKILL.md`, and the five test files (Session 1's own list) as their own logical commit(s). Leave the `.agents` deletion and the `AGENTS.md`/`docs/codex/` changes to whoever's commit they actually belong to — don't fold them into yours just because they're sitting in the same tree, and don't revert or stage them either unless they're still uncommitted and genuinely orphaned (check first, per Task 1).
- **Still do not push.** Still a separate, explicit human decision, unchanged from every prior prompt in this file.
- **Still do not re-enable `run.yml`, assign tiers, change the hard-pause threshold, or touch the mirror question.** All resolved-or-deferred per Session 1's own Decisions list; none of them are this session's job.
- Full `pytest` green-check before AND after, both counts reported honestly.

**Task Order:**
1. **Confirm the working-tree state matches what the human described** (`git status`, `git diff --stat` on the relevant paths) — the `.agents/skills/*` deletion and the `AGENTS.md`/`docs/codex/` changes are both valid and intentional, per the human directly, 2026-10-04. Report what you see; flag anything beyond those two groups and Session 1's own file list.
2. **Commit Session 1's own changes**, grouped sensibly (e.g., the deadline-field write-time rule as one commit, the `grade_resume.py` fix as another, the doc updates as a third — use your own judgment on the split, but keep it disjoint from the other two groups per the non-negotiable rule above). Confirm `pytest` green on the resulting `HEAD`.
3. **Fix Finding 1 (quota-shortfall mass exclusion).** Re-read the finding and Session 1's own recommended fix shape in [[Claude Code Prompts - Archive]] first. Implement the smaller change: a candidate deferred because its own bucket's pool was short this run should not be charged a debate loss — only an actual losing comparison against a real competing candidate counts toward `MAX_DEBATE_LOSSES`. Write a regression test that reproduces the original hazard (a short-pool run charging a loss) and proves the fix (the same scenario no longer charges one), on top of whatever test Session 1 already used to reproduce the bug.
4. **Fix Finding 8 (`reseed.yml` shell-injection pattern).** Re-read the actual current `reseed.yml` yourself first — confirm the `confirm` input really is interpolated directly into a shell `echo` (or whatever the real line is) rather than trusting the citation blind. Fix via `env:` indirection (pass the input through a workflow `env:` var, reference it as `$VAR` inside `run:`, never interpolate `${{ }}` directly into a shell string) — the standard fix for this GitHub Actions injection class. Confirm the workflow still does what it did before (the confirm-gate behavior itself unchanged, just no longer unsafely interpolated).
5. **Patch [[Internship Notes Standard]] §1's required-field list** to match §8's own stated current field order (`company, title, url, source, terms, locations, target_year, date_posted, date_found, deadline_posted, own_deadline, matched_reason, status, next, notes, preference_tier, tags`) — confirm this order against the real current `build_frontmatter()` yourself rather than trusting either section blind, correct whichever one is wrong if they still disagree. Don't touch any other section of that note.
6. **Write the full report into this file** (see the non-negotiable rule above), then move this prompt's text + the report into [[Claude Code Prompts - Archive]] once reviewed, per this file's standing convention.

**Report back:** Task 1's tree-state confirmation; the exact commits made (hashes, file sets, messages) with `pytest` green confirmed on each; Finding 1's fix with the before/after regression test behavior described concretely; Finding 8's actual confirmed-then-fixed diff; confirmation of §1's corrected field order against the real `build_frontmatter()`.

**Grading rubric (scored out of 10 against):**
- The report is actually written into this file, not left in chat only — the one thing this prompt most needs to not repeat.
- Task 1 confirmed the tree state without re-opening a decision the human already made.
- Session 1's commits are clean and disjoint from the `.agents`/`AGENTS.md`/`docs/codex` changes.
- Finding 1's fix is real, tested, and doesn't change quota behavior for an actual losing candidate (only a shortfall-deferred one).
- Finding 8 is actually fixed via `env:` indirection, confirmed against the real current file, not assumed from the citation.
- §1 and §8 of [[Internship Notes Standard]] agree with each other and with the real code.
- Nothing from the explicitly-out-of-scope list (Findings 2-7/9-11, any Decision) was touched.
- Full `pytest` green before and after, both counts reported honestly.
</pasted_content id="d80f">


## Claude

Starting with Task 1: the tree state, plus a baseline pytest run.

Session 1's changes split into three disjoint commits, with only explicit paths staged.

The commits are in and `pytest` was 528 after each. Now Finding 1: I'll read the code first.

Finding 1 is patched and the tests pass. Next I'll confirm the new regression assertions fail against the old `run_pipeline.py`, then move on to `reseed.yml`.

Task 5: I'll compare §1 and §8 of the Notes Standard against the real `build_frontmatter()`.

The real key order matches §8's stated order exactly. That placeholder call was my mistake and did nothing. Next I'll find the Standard note.

§1 already lists the deadline fields. It's missing `preference_tier`, which both the real code and §8's order include. I'll replace just §1's first paragraph.

Session 2 is done and the report is written into the Session 2 section of `Claude Code Prompts.md`. Full `pytest` went from 528 passed before to 529 passed after. I made five local commits on `master` and did not push.

- **Task 1:** The tree matched what you described. It had the 21 `.agents/skills/*` deletions, `AGENTS.md`, `docs/codex/`, and Session 1's own files, with nothing unexpected. I didn't stage or touch the `.agents`, `AGENTS.md` or `docs/codex` changes.
- **Task 2:** Session 1's work went in as three commits, and `pytest` was 528 passed after each.
  - `06c7c5d`: the deadline-field rule, with its tests.
  - `a3cf111`: the `grade_resume.py` fix.
  - `f022822`: the README, PRD and resume-skill truth-up.
- **Finding 1 (`ee5da85`):** The fix is in `_select_exact_quota`. A quota shortfall now defers only candidates that really lost a comparison. Candidates held back by a short pool are not charged a loss. I added one test and tightened two existing ones. With the old `run_pipeline.py` restored, exactly those 3 tests fail, and with the fix all pass. A candidate that really lost a comparison is still charged even in a shortfall run. In a shortfall run, `deferred_count` now means "lost a comparison", not "everything unwritten", which is a small change to that record field. I also updated the PRD line that said this was unfixed.
- **Finding 8 (`10d3402`):** The real `reseed.yml` did splice `${{ github.event.inputs.confirm }}` straight into a shell `echo`. It now goes through `env: CONFIRM` and is referenced as `$CONFIRM`. The `if:` gate is unchanged, and the YAML still parses. I did not trigger a real `workflow_dispatch` run.
- **Task 5:** The real `build_frontmatter()` order matches §8. §1 was only missing `preference_tier`, so I added it between `notes` and `tags`. No other section of the Standard changed.

I left the prompt and report in `Claude Code Prompts.md` instead of moving them to the Archive, because the task says to archive them "once reviewed". CLAUDE.md says never to commit directly to `master`, but this prompt told me to commit locally, so I did. Move these commits to a `dell-latitude/<topic>` branch before any push.

**Tool calls:**

- `Bash` — `git status --short | grep -v '^ D .agents/' ; echo ---; git status --short | grep -c '^ D .agents/'; git diff --stat | tail -20; ls docs/codex; echo ---; python -m pytest -q 2>&1 | tail -5`
  ```
PreToolUse:Bash hook error: [Fact-Forcing Gate]

Before the first Bash command this session, present these facts:

1. The current user request in one sentence
2. What this specific command verifies or produces

Present the facts, then retry the same operation.

Narrow recovery: set `GATEGUARD_BASH_ROUTINE_DISABLED=1`; destructive Bash checks remain active.

Recovery: if GateGuard is blocking setup or repair work, run this session with `ECC_GATEGUARD=off` or add `pre:bash:gateguard-fact-force` to `ECC_DISABLED_HOOKS`.
  ```
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_list,mcp__jarvis__vault_read,mcp__jarvis__vault_patch,mcp__jarvis__vault_get_document_map","max_results":5}`
- `Bash` — `git status --short | grep -v '^ D .agents/' ; echo ---; git status --short | grep -c '^ D .agents/'; git diff --stat | tail -20; ls docs/codex; echo ---; python -m pytest -q 2>&1 | tail -5`
  ```
 M .cursor/skills/resume-alteration/SKILL.md
 M AGENTS.md
 M PRD.md
 M README.md
 M grade_resume.py
 M ingestion/posting_page.py
 M run_pipeline.py
 M tests/test_grade_resume.py
 M tests/test_posting_page.py
 M tests/test_run_pipeline.py
 M tests/test_validate.py
 M tests/test_writer.py
 M vault_writer/validate.py
 M vault_writer/writer.py
?? docs/codex/
---
21
 .agents/skills/review-loop-change/SKILL.md         |  63 ------
 .../review-loop-change/reference/example-review.md |  49 ----
 .../scripts/check_conventions.py                   | 246 ---------------------
 .agents/skills/tailoring-application/SKILL.md      |  38 ----
 .agents/skills/testing/SKILL.md                    |  30 ---
 .cursor/skills/resume-alteration/SKILL.md          |  14 +-
 AGENTS.md                                          |  24 +-
 PRD.md                                             |  30 ++-
 README.md                                          |  77 +++++--
 grade_resume.py                                    |  30 ++-
 ingestion/posting_page.py                          |  66 ++++++
 run_pipeline.py                                    |  13 +-
 tests/test_grade_resume.py                         |  20 +-
 tests/test_posting_page.py                         |  48 ++++
 tests/test_run_pipeline.py                         |  47 ++++
 tests/test_validate.py                             |  34 +++
 tests/test_writer.py                               |  37 ++++
 vault_writer/validate.py                           |  11 +-
 vault_writer/writer.py                             |  31 ++-
 35 files changed, 415 insertions(+), 2036 deletions(-)
ACCESS.md
ARCHITECTURE.md
BUILD_PLAYBOOK.md
---
........................................................................ [ 68%]
........................................................................ [ 81%]
........................................................................ [ 95%]
........................                                                 [100%]
528 passed in 6.61s
  ```
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System"}`
- `mcp__jarvis__search_simple` — `{"query":"Claude Code Prompts"}`
- `Bash` — `git diff vault_writer/ run_pipeline.py ingestion/ grade_resume.py | head -300`
  ```
diff --git a/grade_resume.py b/grade_resume.py
index e8deea4..29b71d5 100644
--- a/grade_resume.py
+++ b/grade_resume.py
@@ -7,14 +7,22 @@ not vibes:
 
     python grade_resume.py jd.txt            # or: pbpaste | python grade_resume.py -
     python grade_resume.py jd.txt --resume "path/to/Main Resume.md"
+
+Without --resume, reads $JARVIS_DIR/20_Progress/Internship/Resumes/Main Resume.md.
 """
 import argparse
+import os
 import re
 import sys
 from collections import Counter
-
-DEFAULT_RESUME = ("/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/"
-                  "Internship/Resumes/Main Resume.md")
+from pathlib import Path
+
+# Vault-relative, resolved against JARVIS_DIR — the same env var run_pipeline.py,
+# recheck.py, revalidate.py and screen_report.py already use for "where is the
+# Jarvis checkout". This used to be a hardcoded /mnt/d/Users/_Anant/... path
+# that only existed on the original laptop (found 2026-10-03 during the
+# two-laptop migration audit: it fails outright on dell-latitude).
+RESUME_RELPATH = "20_Progress/Internship/Resumes/Main Resume.md"
 # Just enough stopwords to keep JD boilerplate from scoring; not a linguistics project.
 STOP = set("""a an and are as at be by for from has have in is it of on or our the
 to we will with you your this that they them their its into within using able
@@ -54,15 +62,27 @@ def grade(resume_md: str, jd_text: str) -> list:
     return sorted(scored, key=lambda s: -s[0])
 
 
+def resolve_resume_path(resume_arg, environ=None) -> str:
+    """--resume wins; otherwise $JARVIS_DIR/<RESUME_RELPATH>. Exits with a
+    clear message (never guesses a path) when neither is available."""
+    if resume_arg:
+        return resume_arg
+    environ = os.environ if environ is None else environ
+    jarvis_dir = environ.get("JARVIS_DIR")
+    if not jarvis_dir:
+        sys.exit("no resume path: pass --resume PATH, or set JARVIS_DIR to your Jarvis vault checkout")
+    return str(Path(jarvis_dir) / RESUME_RELPATH)
+
+
 def main():
     ap = argparse.ArgumentParser(description=__doc__)
     ap.add_argument("jd", help="path to a file with the pasted JD, or '-' for stdin")
-    ap.add_argument("--resume", default=DEFAULT_RESUME)
+    ap.add_argument("--resume", default=None, help="path to Main Resume.md (default: $JARVIS_DIR/" + RESUME_RELPATH + ")")
     ap.add_argument("--top", type=int, default=5, help="bullets to recommend")
     args = ap.parse_args()
 
     jd_text = sys.stdin.read() if args.jd == "-" else open(args.jd, encoding="utf-8").read()
-    resume_md = open(args.resume, encoding="utf-8").read()
+    resume_md = open(resolve_resume_path(args.resume), encoding="utf-8").read()
     ranked = grade(resume_md, jd_text)
     if not ranked:
         sys.exit("no #skill-tagged bullets found in the resume file")
diff --git a/ingestion/posting_page.py b/ingestion/posting_page.py
index 57c61c2..347d254 100644
--- a/ingestion/posting_page.py
+++ b/ingestion/posting_page.py
@@ -14,6 +14,7 @@ real data 2026-07-18: Palantir's US Government and Commercial internships
 differ on exactly this axis within the same company.
 """
 import re
+from datetime import date
 from urllib.parse import parse_qs, urlparse
 
 import requests
@@ -146,6 +147,71 @@ def phd_only_exclusion(text: str):
     return m.group(0)
 
 
+# Real stated-deadline phrasings, each read directly from a live vault dossier's
+# stored posting text on 2026-10-03 (not guessed) — the shapes below are
+# exactly the ones those dossiers use, nothing broader:
+#   - Walleye Capital "Quantic – Quantitative Developer Intern (Summer 2027)"
+#     (Greenhouse): "The deadline to apply for this opportunity is Friday,
+#     July 31 at 11:59pm ET."
+#   - Castleton Commodities "Data Science Machine Learning Intern"
+#     (SimplifyJobs/Workday): "Application Deadline: September 1, 11:59pm EST"
+#   - LPL Financial "Data Engineer Intern - Data" (SimplifyJobs/Workday):
+#     "Priority Application Date: September 21 at 11:59 PM PST" — a stated
+#     "apply by" date even though LPL reviews on a rolling basis, which is the
+#     same call the 2026-08-30 deadline-priority batch made for it.
+#   - Moog "Intern, Software Engineering" (zshah101/Workday): the ATS label run
+#     "time left to applyEnd Date: July 29, 2026 (3 days left to apply)". Only
+#     matched when anchored to that label — a bare "End Date" elsewhere is
+#     often an internship end date, not an application deadline.
+# Month-name dates only: no real example of a numeric (7/31) or ISO deadline
+# has been seen in a stored posting yet. Add one with a citation if it shows up.
+_DATE_RE = (
+    r"(?P<mon>jan(?:uary)?|feb(?:ruary)?|mar(?:ch)?|apr(?:il)?|may|june?|july?|aug(?:ust)?"
+    r"|sep(?:t(?:ember)?)?|oct(?:ober)?|nov(?:ember)?|dec(?:ember)?)\.?\s+"
+    r"(?P<day>\d{1,2})(?:st|nd|rd|th)?\b(?:,?\s+(?P<year>20\d{2}))?"
+)
+_WEEKDAY_RE = r"(?:(?:mon|tues?|wednes|thurs?|fri|sat(?:ur)?|sun)(?:day)?,?\s+)?"
+_DEADLINE_PATTERNS = (
+    re.compile(
+        r"\b(?:application\s+)?deadline(?:\s+to\s+apply)?(?:\s+for\s+this\s+\w+)?\s*(?:is|:)\W{0,6}"
+        r"(?:on\s+)?" + _WEEKDAY_RE + _DATE_RE, re.I),
+    re.compile(r"\bpriority\s+application\s+(?:date|deadline)\W{0,6}" + _DATE_RE, re.I),
+    re.compile(r"\btime\s+left\s+to\s+apply\W{0,3}end\s+date:\s*" + _DATE_RE, re.I),
+)
+_MONTH_NUMBERS = {m: i for i, m in enumerate(
+    ("jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"), 1)}
+
+
+def extract_deadline(text: str, reference_date: str):
+    """The posting's own stated application deadline as an ISO date, or None
+    when the text states none (permissive default — absence is not a signal).
+    reference_date is the dossier's date_found (ISO), used only to pick a year
+    when the posting omits one: the occurrence of that month/day nearest to
+    reference_date wins, because a posting can be found after its deadline has
+    already passed — the real Walleye dossier above was fetched 2026-08-04
+    stating "July 31", which is 2026-07-31 (4 days earlier), not 2027-07-31.
+    If several stated dates match (e.g. a priority date and a final deadline),
+    the earliest wins — it's the first real forcing date.
+
+    ponytail: month-name dates only and the phrasings above; extend with a
+    cited real example, not a guess."""
+    ref = date.fromisoformat(reference_date)
+    found = []
+    for pattern in _DEADLINE_PATTERNS:
+        for m in pattern.finditer(text or ""):
+            month, day = _MONTH_NUMBERS[m.group("mon")[:3].lower()], int(m.group("day"))
+            years = [int(m.group("year"))] if m.group("year") else [ref.year - 1, ref.year, ref.year + 1]
+            candidates = []
+            for y in years:
+                try:
+                    candidates.append(date(y, month, day))
+                except ValueError:  # e.g. "Feb 30" — not a real date, skip it
+                    pass
+            if candidates:
+                found.append(min(candidates, key=lambda d: abs((d - ref).days)))
+    return min(found).isoformat() if found else None
+
+
 def fetch_posting_markdown(url: str, api_key: str, http_post=None) -> str:
     """Page markdown via Firecrawl (JS-rendered — ATS pages are SPAs).
     Raises requests exceptions on failure; callers treat any failure as
diff --git a/run_pipeline.py b/run_pipeline.py
index 26e6e3a..0773b43 100644
--- a/run_pipeline.py
+++ b/run_pipeline.py
@@ -34,7 +34,13 @@ from core.schema_drift import SchemaDriftError
 from core.schema_drift import check_all as check_schema_drift
 from ingestion.freehire import fetch_freehire
 from ingestion.interndock import fetch_interndock_drop, fetch_interndock_drop_candidates, normalize_interndock
-from ingestion.posting_page import extract_content, fetch_posting_markdown, opt_exclusion, phd_only_exclusion
+from ingestion.posting_page import (
+    extract_content,
+    extract_deadline,
+    fetch_posting_markdown,
+    opt_exclusion,
+    phd_only_exclusion,
+)
 from ingestion.sources import (
     fetch_ai_jobs,
     fetch_applyguy,
@@ -715,7 +721,10 @@ def validate_and_write(new_listings, profile: dict, jarvis_dir, seen_ids: set, d
                 enriched = render_dossier(listing, uid, date_found,
                                           build_matched_reason(listing, profile), posting_content,
                                           classification_callout(bucket, signal),
-                                          preferred_companies=profile.get("preferred_companies"))
+                                          preferred_companies=profile.get("preferred_companies"),
+                                          # raw page_md, not posting_content: extract_content() caps at
+                                          # CONTENT_LIMIT and drops label lines a stated deadline can sit in.
+                                          deadline_posted=extract_deadline(page_md, date_found))
                 # The gate validated the thin render; re-check format on the
                 # enriched one — an extraction bug degrades to thin, never
                 # writes malformed markdown into the vault.
diff --git a/vault_writer/validate.py b/vault_writer/validate.py
index 2cf0365..55f8dea 100644
--- a/vault_writer/validate.py
+++ b/vault_writer/validate.py
@@ -12,8 +12,8 @@ from core.identity import cross_source_key
 REQUIRED_LISTING_FIELDS = ("company", "title", "url", "source", "uid")
 REQUIRED_FRONTMATTER_FIELDS = (
     "company", "title", "url", "source", "terms", "locations",
-    "target_year", "date_posted", "date_found", "matched_reason", "status", "next", "notes",
-    "preference_tier", "tags",
+    "target_year", "date_posted", "date_found", "deadline_posted", "own_deadline",
+    "matched_reason", "status", "next", "notes", "preference_tier", "tags",
 )
 
 
@@ -99,6 +99,13 @@ def check_format_compliance(markdown: str) -> ValidationResult:
     missing = [f for f in REQUIRED_FRONTMATTER_FIELDS if f not in frontmatter]
     if missing:
         return ValidationResult(False, "format_compliance", f"frontmatter missing fields: {', '.join(missing)}")
+    # Internship Notes Standard §8: every dossier this pipeline writes carries
+    # exactly one real deadline value (a stated one, or the 7-day own_deadline).
+    # build_frontmatter() guarantees it; this catches a regression there.
+    if bool(frontmatter["deadline_posted"]) == bool(frontmatter["own_deadline"]):
+        return ValidationResult(
+            False, "format_compliance", "exactly one of deadline_posted/own_deadline must be set"
+        )
 
     body_lines = lines[closing_idx + 1:]
     if not body_lines or body_lines[0].strip() == "":
diff --git a/vault_writer/writer.py b/vault_writer/writer.py
index 040747a..e60e329 100644
--- a/vault_writer/writer.py
+++ b/vault_writer/writer.py
@@ -7,7 +7,7 @@ ValidationResult from validate.validate() before calling it.
 """
 import json
 import re
-from datetime import datetime, timezone
+from datetime import date, datetime, timedelta, timezone
 from pathlib import Path
 
 import yaml
@@ -61,8 +61,17 @@ def company_slug(company: str) -> str:
     return re.sub(r"\s+", "-", s)
 
 
+# Going-forward forcing deadline for a freshly-discovered dossier whose posting
+# states none (2026-10-03 decision; field contract defined by the Codex
+# freshness sweep in Runs/Codex Prompts.md Task 6). date_found really is
+# "now" for a dossier this pipeline just wrote, so date_found + 7 days is a
+# real future date — unlike the one-time retroactive sweep over weeks-old
+# dossiers, which deliberately anchors on its own run date instead.
+OWN_DEADLINE_DAYS = 7
+
+
 def build_frontmatter(listing, uid: str, date_found: str, matched_reason: str,
-                      preferred_companies: dict = None) -> dict:
+                      preferred_companies: dict = None, deadline_posted: str = None) -> dict:
     """uid and category are deliberately not rendered — uid stays available
     internally via the dossier_uids.json manifest (see write_dossier), and
     category was never surfaced to the reader anywhere else in the note.
@@ -73,7 +82,15 @@ def build_frontmatter(listing, uid: str, date_found: str, matched_reason: str,
     `preference_tier` (Prompt 5 Task O) is the matched core/profile.yaml
     preferred_companies tier, or null — required like every other field
     here, not omitted when there's no match (fail-closed, same discipline
-    as REQUIRED_FRONTMATTER_FIELDS everywhere else in this file)."""
+    as REQUIRED_FRONTMATTER_FIELDS everywhere else in this file).
+    `deadline_posted` is the posting's own stated deadline (ISO, extracted by
+    ingestion/posting_page.py's extract_deadline from the fetched page) or None;
+    `own_deadline` is set only when deadline_posted is None, to date_found +
+    OWN_DEADLINE_DAYS — so exactly one of the two always carries a real value.
+    Both sit right after date_found, before matched_reason."""
+    own_deadline = None
+    if not deadline_posted:
+        own_deadline = (date.fromisoformat(date_found) + timedelta(days=OWN_DEADLINE_DAYS)).isoformat()
     return {
         "company": listing.company,
         "title": listing.title,
@@ -84,6 +101,8 @@ def build_frontmatter(listing, uid: str, date_found: str, matched_reason: str,
         "target_year": _yaml_list(listing.target_year),
         "date_posted": _iso_date(listing.date_posted),
         "date_found": date_found,
+        "deadline_posted": deadline_posted or None,
+        "own_deadline": own_deadline,
         "matched_reason": matched_reason,
         "status": "unreviewed",
         "next": None,
@@ -103,8 +122,10 @@ def dump_frontmatter(frontmatter: dict) -> str:
 
 
 def render_dossier(listing, uid: str, date_found: str, matched_reason: str, posting_content: str = "",
-                   classification_callout: str = "", preferred_companies: dict = None) -> str:
-    frontmatter = build_frontmatter(listing, uid, date_found, matched_reason, preferred_companies)
+                   classification_callout: str = "", preferred_companies: dict = None,
+                   deadline_posted: str = None) -> str:
+    frontmatter = build_frontmatter(listing, uid, date_found, matched_reason, preferred_companies,
+                                    deadline_posted=deadline_posted)
     frontmatter_yaml = dump_frontmatter(frontmatter)
     markdown = _template.render(
         frontmatter_yaml=frontmatter_yaml,
  ```
- `Bash` — `git diff .cursor | head -40; git diff --stat README.md PRD.md; git diff PRD.md | grep '^[+-]' | head -50`
  ```
diff --git a/.cursor/skills/resume-alteration/SKILL.md b/.cursor/skills/resume-alteration/SKILL.md
index c7c73fc..e428f24 100644
--- a/.cursor/skills/resume-alteration/SKILL.md
+++ b/.cursor/skills/resume-alteration/SKILL.md
@@ -11,23 +11,23 @@ disable-model-invocation: true
 
 # resume-alteration
 
-Drafts and writes the tailored resume for one application, per the Jarvis vault's `20_Progress/Internship/Building System/Resume Alteration.md` design note and its enforceable rules in `30_Order/Standards/Resume Alteration Standard.md`. This is a human-in-the-loop step: it never invents a claim it can't source, and it never writes a file without explicit approval of the content plan **and** a pass through the Humanizer gate.
+Drafts and writes the tailored resume for one application, per the Jarvis vault's `20_Progress/Internship/Building System/V0/Resume Alteration.md` design note and its enforceable rules in `30_Order/Standards/Internship/Resume Alteration Standard.md`. This is a human-in-the-loop step: it never invents a claim it can't source, and it never writes a file without explicit approval of the content plan **and** a pass through the Humanizer gate.
 
 ## Prerequisite — read this before running
 
 **Needs the Jarvis vault reachable**, same two paths `promote-dossier` documents (a sibling git checkout, or the `user-jarvis` MCP namespace — confirm with `vault_list` before assuming it's connected). This skill is vault-side work; it does not touch this repo's own pipeline code.
 
 **Read the design contract first, every run** — don't work from memory of what these say:
-- `20_Progress/Internship/Building System/Resume Alteration.md` — the narrative and per-application flow.
-- `30_Order/Standards/Resume Alteration Standard.md` — the enforceable evidence/tailoring/naming/overwrite rules.
-- `30_Order/Standards/Humanized Writing Standard.md` — the tone checklist the draft must pass before writing.
+- `20_Progress/Internship/Building System/V0/Resume Alteration.md` — the narrative and per-application flow.
+- `30_Order/Standards/Internship/Resume Alteration Standard.md` — the enforceable evidence/tailoring/naming/overwrite rules.
+- `30_Order/Standards/Ingestion/Humanized Writing Standard.md` — the tone checklist the draft must pass before writing.
 
-**Stop if `Resumes/Main Resume.md` is not in evidence-tagged shape yet.** As of this skill's authoring (2026-08-28), Main Resume is still generic filler, not a bullet bank with sourced claims — that rebuild is separate, gated work. Running this skill against the current Main Resume would mean tailoring from unreliable source material. If that rebuild hasn't happened, say so and stop rather than drafting from what's there today.
+**Stop if `Resumes/Main Resume.md` is not in evidence-tagged shape.** Check the real file at the start of every run — don't trust this note about it. Re-verified 2026-10-03: it is a real evidence-tagged bullet bank (rebuilt 2026-08-29; every bullet carries `#evidence/user-confirmed-<date>` and a `#skill/...` tag; four unconfirmed project names sit in a Logged Gaps section and must not be used). The earlier "still generic filler" wording here (written 2026-08-28) went stale the next day. If the file you find has untagged claims or no evidence tags, say so and stop rather than drafting from it.
 
 ## Steps
 
 ### 1. Take the input
-Accept an Applying note path (`20_Progress/Internship/Applying/<name>.md`) or a Program note to prepare one for. Read its `program`, `tracker`, `company`, `job_url` fields and its Job Description / Fit / Networking one-liners. If the Applying note doesn't exist yet, create it from `30_Order/Templates/Career/Applying Template.md` first (`status: Preparing`, `date_applied: null`) — this is Application Document Preparation's `prepare` step.
+Accept an Applying note path (`20_Progress/Internship/Applying/<name>.md`) or a Program note to prepare one for. Read its `program`, `tracker`, `company`, `job_url` fields and its Job Description / Fit / Networking one-liners. If the Applying note doesn't exist yet, create it from `30_Order/Templates/Career/Internship/Applying Template.md` first (`status: Preparing`, `date_applied: null`) — this is Application Document Preparation's `prepare` step.
 
 ### 2. Gather evidence
 Read `Resumes/Main Resume.md` in full. Read the JD (via `job_url` or whatever the Applying note/Program note already captured). Read any Jarvis project notes the Main Resume's bullets cite. For every JD requirement, check whether it's covered by an existing Main Resume bullet or a cited project note — per the Standard's §2, a requirement with no match anywhere is a **gap**, not something to fill by inventing a bullet. If the human is present, ask about a genuine gap rather than skip it silently.
@@ -40,7 +40,7 @@ Present, as a short structured list, not the final document text:
 Ask explicitly: "Approve this content plan?" — a yes/no, not implied by the human having read it.
 
 ### 4. Humanizer gate
-Only after approval, run the plan's actual bullet text against `30_Order/Standards/Humanized Writing Standard.md`'s checklist. Flag anything that matches a prohibited pattern (generic filler, corporate padding words, repetitive structure, tone louder than the underlying fact) with the specific phrase and a suggested fix — never silently rewrite it yourself without showing the flag. Loop back to step 3 for any fix, then re-check, until the draft passes clean.
+Only after approval, run the plan's actual bullet text against `30_Order/Standards/Ingestion/Humanized Writing Standard.md`'s checklist. Flag anything that matches a prohibited pattern (generic filler, corporate padding words, repetitive structure, tone louder than the underlying fact) with the specific phrase and a suggested fix — never silently rewrite it yourself without showing the flag. Loop back to step 3 for any fix, then re-check, until the draft passes clean.
 PRD.md    | 30 +++++++++++++++----------
 README.md | 77 +++++++++++++++++++++++++++++++++++++++++++++------------------
 2 files changed, 73 insertions(+), 34 deletions(-)
--- a/PRD.md
+++ b/PRD.md
-**Status:** Verified against live repo/GitHub state on 2026-08-22 (git log, `pytest` [329/329], `gh run list`, `gh api`, live vault dossier counts — not assumed from memory). Still not independently product-reviewed; this was built spec-first in conversation, not PRD-first. Read this file alone for orientation — it does not require the Jarvis vault to make sense. For build history, decisions, and how each number below was verified, see `20_Progress/Internship/Building System/Phases 1-3 Run.md` (original build) and `System - Build Log.md` (ongoing) in the Jarvis vault; neither is required reading to pick this project up, only to understand *why* it looks this way.
+**Status:** Verified against live repo/GitHub/vault state on 2026-10-03 (`git log`, `pytest` [528 passing], `gh api` workflow list and run history, Jarvis repo commit history, direct vault folder listings — not assumed from memory). Sections not re-verified that day are marked with their own date. Still not independently product-reviewed; this was built spec-first in conversation, not PRD-first. Read this file alone for orientation — it does not require the Jarvis vault to make sense. For build history, decisions, and how each number below was verified, see `20_Progress/Internship/Building System/Phases 1-3 Run.md` (original build) and `System - Build Log.md` (ongoing) in the Jarvis vault; neither is required reading to pick this project up, only to understand *why* it looks this way.
-- Poll two internship-listing sources hourly (GitHub Actions cron); zapplyjobs was removed 2026-07-18 — its entries are program landing pages, not deadline-bearing postings
+- Poll eleven internship-listing sources hourly (GitHub Actions cron): SimplifyJobs, Jose-Gael-Cruz-Lopez, vanshb03, zshah101, ApplyGuy, Greenhouse, Ashby, Lever, Freehire, AIJobs, plus sitemap-detected InternDock. zapplyjobs was removed 2026-07-18 — its entries are program landing pages, not deadline-bearing postings
-- Daily post-write recheck (`recheck.yml`): removes dossiers whose posting went `active: false` or vanished upstream, with a mass-deletion brake and per-source fetch-failure isolation
+- Daily post-write recheck (`recheck.yml`): moves dossiers whose posting went `active: false` or vanished upstream into `Dossiers/Viewed/` (never deletes), with a mass-move brake and per-source fetch-failure isolation. Covers 8 of the 11 sources — ApplyGuy, Freehire and InternDock dossiers are never rechecked (`recheck.py` `FEEDS`)
+- **Write pacing (2026-09-07/08):** the hourly run writes an exact per-bucket quota (`QUOTA_PER_RUN` = 2 AI/ML + 1 Fullstack + 1 CyS & Finance + 2 Other, all-or-nothing), and disables its own workflow at 300 live dossiers (`HARD_PAUSE_TOTAL_THRESHOLD`) — a deliberate, human-decided reversal of the older notify-never-refuse rule for total volume only
+- **Deadlines on every dossier (2026-10-03):** `deadline_posted` (the posting's own stated deadline, read from the fetched text by `ingestion/posting_page.py`'s `extract_deadline`) or, when none is stated, `own_deadline` = `date_found` + 7 days; exactly one is set, enforced by the write gate
+- **Company registry:** `core/company_registry.py` holds the quant-firm bucket-override list and adjacent-field company list that `classify.py` and `relevance.py` share; the preference-tier rank (`debate.py`) is still a single grade
+- Weekly `revalidate.yml` re-checks live dossiers against current rules and files one digest issue (moves nothing); manual `reseed.yml` does a one-off cold-start pull; `screen_report.py` prints a read-only ready-to-screen list
-- Promotion-triggered tools, outside the automated loop: `enrich.py` (Layer 5 company/contact research — public sources only; built, unit-tested, never yet run end-to-end) and `grade_resume.py` (Layer 6 keyword-overlap resume grader, verified against a real JD)
+- Promotion-triggered tools, outside the automated loop: `enrich.py` (Layer 5 company/contact research — public sources only; built, unit-tested, never yet run end-to-end) and `grade_resume.py` (Layer 6 keyword-overlap resume grader, verified against a real JD; reads `$JARVIS_DIR/...Main Resume.md`, no longer a hardcoded path)
-Repo layout: `ingestion/` (`sources.py`, `normalize.py`, `posting_page.py`), `core/` (`filter.py`, `identity.py`, `profile.yaml`, `schema_drift.py`, `git_ops.py`, `run_log.py`), `vault_writer/` (template + `validate.py` + `writer.py`), `run_pipeline.py`, `recheck.py`, `enrich.py`, `grade_resume.py`, `tests/` (167 tests), `state/` (`seen_ids.json`, `opt_cache.json`), `logs/`, `.github/workflows/` (`run.yml` hourly, `recheck.yml` daily 06:30 UTC, `test.yml` on push).
+Repo layout: `ingestion/` (`sources.py`, `normalize.py`, `posting_page.py`), `core/` (`filter.py`, `identity.py`, `profile.yaml`, `schema_drift.py`, `git_ops.py`, `run_log.py`), `vault_writer/` (template + `validate.py` + `writer.py`), `run_pipeline.py`, `recheck.py`, `enrich.py`, `grade_resume.py`, `tests/` (528 tests), `state/` (`seen_ids.json`, `opt_cache.json`, `excluded_uids.json`, `debate_losses.json`, `write_gate_failures.json`, `dossier_uids.json`, ...), `logs/`, `.github/workflows/` (`run.yml` hourly, `recheck.yml` daily 06:30 UTC, `revalidate.yml` weekly, `reseed.yml` manual, `test.yml` on push/PR). Also `core/debate.py`, `core/classify.py`, `core/relevance.py`, `core/company_registry.py`, `core/company_cache.py` (not yet wired in), `reseed.py`, `revalidate.py`, `screen_report.py`. `.claude/`, `.cursor/`, `.agents/` and `.codex/` hold the agent/skill/hook layer described in `CLAUDE.md`.
-## Current Status (verified 2026-08-22)
+## Current Status (verified 2026-10-03)
-- `pytest`: **329/329 passing**; CI green on every push. A local `scripts/hooks/pre-push` test gate now blocks a `git push` if the suite fails — this repo has no PR-based CI gate, so this is the only thing standing between a broken commit and `origin/master` before the next scheduled run
-- `run.yml`: firing hourly and succeeding — 20/20 most recent scheduled runs successful. `recheck.yml`: firing daily, 10/10 most recent runs successful, moving closed postings to `Dossiers/Viewed/` (never deleting, since 2026-08-21)
-- Vault dossiers: **391 total** across the four priority buckets (146 AI/ML, 43 Fullstack, 63 CyS & Finance, 139 Other), plus 5 in `Viewed/`. `state/seen_ids.json` holds 606 entries. Eight discovery sources live (SimplifyJobs, Jose-Gael-Cruz-Lopez, vanshb03, zshah101, Greenhouse, Ashby, Freehire, AIJobs), up from the original two
-- **Dossier resource-limit system live since 2026-08-21**: a per-bucket 50-dossier notification threshold and a global 190/200 issue-filing threshold, both notification-only (never a write refusal) — confirmed firing for real, not just designed: issues #4-8 were auto-filed the first time these were actually crossed. Write priority within each bucket now runs through a deterministic "debate" comparator (preferred-company tier → bucket fill-need → recency); a candidate that loses 5 consecutive runs moves to a reviewable exclusion log, never a silent drop
-- `FIRECRAWL_API_KEY` present as an Actions secret; live discovery-time content enrichment confirmed firing (391 dossiers carry real fetched posting content)
-- **8 GitHub issues filed to date** — 3 closed (transient `raw.githubusercontent.com` rate-limiting from 2026-08-17/18, self-resolved, closed 2026-08-21 with evidence), 5 open (the new capacity-notification issues #4-8, informational by design)
+- `pytest`: **528 passing**; local `master` equals `origin/master`; PR #12 (two-laptop cleanup) merged 2026-09-26.
+- **Scheduled automation is not observably running.** The Actions API lists `run`, `recheck`, `revalidate`, `reseed` and `test` as `active` but returns zero workflow runs for any of them (only one unrelated dependency-graph run exists repo-wide). Evidence of last real activity: `logs/runs.jsonl` ends 2026-08-29 09:34 UTC (687 lines; the human paused `run.yml` then — `disabled_manually`; the workflow's `updated_at` of 2026-09-22 suggests it was re-enabled that day, an inference, not a logged fact); the last bot commit in this repo is `Recheck log — 2026-09-20`; the last bot commit in the vault repo is `Move 1 closed posting(s) to Viewed/ — recheck 2026-09-17`. No scheduled run has left a trace since. Cause not determined (history deleted? cron not firing? expired `JARVIS_PUSH_TOKEN` failing the checkout step before any log line?). A `workflow_dispatch` would answer it but was deliberately not run.
+- Vault dossiers (excluding `Viewed/`): **278** — AI/ML 130, Fullstack 41, CyS & Finance 48, Other 59 (the AI/ML figure is the parallel vault sweep's own count; the other three were counted directly from folder listings 2026-10-03), under the 300 hard-pause. Plus 67 in `Viewed/` and 11 in `_Career Fair/` (not counted toward the pause — `count_dossiers_by_bucket` only globs the four bucket folders).
+- Promotion: `Programs/Serious/` and `Considering/` hold the 2026-08/09 batches; no live `Applying/` note exists, so Steps 4–9 of the vault's Internship Pipeline are still unexercised.
+- **Open GitHub issues:** #4–8 (stale 2026-08-21 capacity notifications) and #9–11 (the same 15 dossiers flagged by `revalidate.yml` on 08-31, 09-07 and 09-14; six are Microsoft dossiers whose stored content predates the sidebar-extraction fix and cannot be re-extracted by `revalidate.py`).
+- `FIRECRAWL_API_KEY` and `JARVIS_PUSH_TOKEN` exist as Actions secrets (created 2026-07-18 and 2026-07-17).
+- **All-or-nothing quota feeds the debate-loss counter (found 2026-10-03, reproduced with the real functions).** When any bucket's pool is smaller than its quota, `_select_exact_quota` returns every candidate as `deferred`, `update_debate_losses` charges each one a loss, and after `MAX_DEBATE_LOSSES` (48) such runs every candidate is permanently excluded with nothing ever written. Only matters while `run.yml` is live; not yet fixed (a design decision — see the 2026-10-03 truth-up report).
+- **Fixes reach new dossiers only.** The Microsoft sidebar fix, the quant-firm override, the denylist additions: none re-evaluates a dossier written before it landed. `revalidate.py` re-checks against *stored* content, so it can flag but not repair a stale-extraction dossier.
  ```
- `Bash`:
  ```bash
git diff --cached --quiet && echo "index clean" 
git add ingestion/posting_page.py vault_writer/writer.py vault_writer/validate.py run_pipeline.py tests/test_posting_page.py tests/test_run_pipeline.py tests/test_validate.py tests/test_writer.py
git commit -q -m "Stamp every new dossier with deadline_posted or a 7-day own_deadline

extract_deadline reads a stated deadline from the fetched posting page; when
none is stated, build_frontmatter sets own_deadline = date_found + 7 days.
The write gate now requires exactly one of the two.

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" && python -m pytest -q 2>&1 | tail -1
git add grade_resume.py tests/test_grade_resume.py
git commit -q -m "grade_resume: resolve Main Resume via JARVIS_DIR instead of a hardcoded path

The old /mnt/d/Users/_Anant/... default only existed on the original laptop.

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" && python -m pytest -q 2>&1 | tail -1
git add README.md PRD.md .cursor/skills/resume-alteration/SKILL.md
git commit -q -m "Truth-up README, PRD and resume-alteration skill against live state (2026-10-03)

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" && python -m pytest -q 2>&1 | tail -1
git log --oneline -4; git status --short | grep -v '^ D .agents/'
  ```
  ```
index clean
[graphify hook] launching background rebuild (log: /home/anant_gupta/.cache/graphify-rebuild.log)
528 passed in 14.03s
[graphify hook] launching background rebuild (log: /home/anant_gupta/.cache/graphify-rebuild.log)
528 passed in 20.86s
[graphify hook] launching background rebuild (log: /home/anant_gupta/.cache/graphify-rebuild.log)
528 passed in 10.29s
f022822 Truth-up README, PRD and resume-alteration skill against live state (2026-10-03)
a3cf111 grade_resume: resolve Main Resume via JARVIS_DIR instead of a hardcoded path
06c7c5d Stamp every new dossier with deadline_posted or a 7-day own_deadline
a3664ca Document the two-laptop branch workflow; ignore graphify's .sig output
 M AGENTS.md
?? docs/codex/
  ```
- `Bash` — `grep -n "_select_exact_quota\|update_debate_losses\|MAX_DEBATE_LOSSES\|deferred" run_pipeline.py core/debate.py | head -40`
  ```
run_pipeline.py:108:# run at all (see _select_exact_quota). Real counts checked directly via
run_pipeline.py:145:    the final written folder does. Returns (this_run, deferred) — deferred
run_pipeline.py:166:    this_run, deferred = [], []
run_pipeline.py:190:        deferred.extend(remainder)
run_pipeline.py:191:    return this_run, deferred
run_pipeline.py:194:def _select_exact_quota(new_listings: list, quota: dict, preferred_companies: dict = None) -> tuple:
run_pipeline.py:199:    candidates land in deferred untouched), same convention
run_pipeline.py:202:    Returns (this_run, deferred, shortfall). shortfall is
run_pipeline.py:205:    this_run is [] and deferred is EVERY item in new_listings — a partial
run_pipeline.py:208:    land in deferred in this case, so they still count toward
run_pipeline.py:209:    MAX_DEBATE_LOSSES the same way a candidate cut for any other reason
run_pipeline.py:215:    differently-distributed N+1" — see test_select_exact_quota_does_not_
run_pipeline.py:239:    deferred = [(uid, listing) for uid, listing in new_listings if uid not in written_uids]
run_pipeline.py:240:    return this_run, deferred, shortfall
run_pipeline.py:271:# "deferred" list) accumulates a loss count across runs. 5 was the original
run_pipeline.py:283:MAX_DEBATE_LOSSES = 48
run_pipeline.py:294:# new candidates all cross MAX_DEBATE_LOSSES together — real incident,
run_pipeline.py:299:# MAX_DEBATE_LOSSES runs (~5 hours) with no signal to a human that it's
run_pipeline.py:389:def update_debate_losses(losses: dict, deferred: list, written_uids: list) -> tuple:
run_pipeline.py:391:    Increments the loss count for every deferred uid (a candidate that lost
run_pipeline.py:394:    is moot. A uid whose count reaches MAX_DEBATE_LOSSES is returned in
run_pipeline.py:401:    for uid, listing in deferred:
run_pipeline.py:403:        if losses[uid] >= MAX_DEBATE_LOSSES:
run_pipeline.py:415:# never "deferred" (that only happens to items _prioritize_and_cap itself
run_pipeline.py:417:# MAX_DEBATE_LOSSES, and it's never written, so it never reaches
run_pipeline.py:424:# run, forever, pushing a real competing candidate into deferred (and toward
run_pipeline.py:439:# A dead link doesn't deserve MAX_DEBATE_LOSSES' 48-run benefit of the doubt
run_pipeline.py:467:# (MAX_DEBATE_LOSSES) — a real, if coincidental, correctly-filtered
run_pipeline.py:496:    slate" semantics as update_debate_losses's written_uids handling above —
run_pipeline.py:611:    comparator MAX_DEBATE_LOSSES consecutive times here, before it's even
run_pipeline.py:783:        "deferred_count": 0,
run_pipeline.py:895:        this_run, deferred = _prioritize_and_cap(
run_pipeline.py:900:        this_run, deferred, quota_shortfall = _select_exact_quota(
run_pipeline.py:903:    record["deferred_count"] = len(deferred)
run_pipeline.py:918:    # Task N (Prompt 5): count this run's debate loss for every deferred
run_pipeline.py:920:    # entirely. A uid crossing MAX_DEBATE_LOSSES moves to the excluded set
run_pipeline.py:925:        debate_losses, newly_excluded = update_debate_losses(debate_losses, deferred, written_uids)
run_pipeline.py:935:                    f"excluded {now.date().isoformat()} — lost the debate {MAX_DEBATE_LOSSES} consecutive runs"
run_pipeline.py:939:                    max_losses=MAX_DEBATE_LOSSES,
run_pipeline.py:945:                f"{record['newly_excluded_count']} candidates crossed MAX_DEBATE_LOSSES "
  ```
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System/Runs"}`
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py`
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py`
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py`
- `mcp__jarvis__vault_get_document_map` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts - Archive.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts - Archive.md","targetType":"heading","target":["Session 1 — Truth-Up & Deep Codebase Audit (written 2026-10-03, run 2026-10-03/04, archived 2026-10-04)","Coverage-Pass Findings (reported, not filtered — confidence/severity as given)"]}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts.md"}`
- `Bash` — `grep -rn "_select_exact_quota\|deferred_count\|quota_shortfall" --include=*.py . | grep -v "^./run_pipeline.py:\(19\|20\|21\|22\|23\)"; `
  ```
reseed.py:161:        f"deferred {result['deferred_count']}"
run_pipeline.py:108:# run at all (see _select_exact_quota). Real counts checked directly via
run_pipeline.py:194:def _select_exact_quota(new_listings: list, quota: dict, preferred_companies: dict = None) -> tuple:
run_pipeline.py:215:    differently-distributed N+1" — see test_select_exact_quota_does_not_
run_pipeline.py:783:        "deferred_count": 0,
run_pipeline.py:793:        "quota_shortfall": {},
run_pipeline.py:898:        quota_shortfall = {}
run_pipeline.py:900:        this_run, deferred, quota_shortfall = _select_exact_quota(
run_pipeline.py:903:    record["deferred_count"] = len(deferred)
run_pipeline.py:904:    record["quota_shortfall"] = quota_shortfall
tests/test_run_pipeline.py:314:# --- _select_exact_quota: all-or-nothing exact quota (2026-09-07 decision) ---
tests/test_run_pipeline.py:316:def test_select_exact_quota_selects_exactly_and_defers_rest_in_debate_order():
tests/test_run_pipeline.py:318:    this_run, deferred, shortfall = run_pipeline._select_exact_quota(items, quota={"Other": 2})
tests/test_run_pipeline.py:325:def test_select_exact_quota_reports_shortfall_and_returns_nothing_when_a_bucket_is_short():
tests/test_run_pipeline.py:331:    this_run, deferred, shortfall = run_pipeline._select_exact_quota(items, quota={"Other": 2})
tests/test_run_pipeline.py:338:def test_select_exact_quota_bucket_missing_from_quota_is_fully_deferred():
tests/test_run_pipeline.py:343:    this_run, deferred, shortfall = run_pipeline._select_exact_quota(items, quota={})
tests/test_run_pipeline.py:350:def test_select_exact_quota_does_not_grant_a_reserved_slot_unlike_prioritize_and_cap():
tests/test_run_pipeline.py:359:    this_run, deferred, shortfall = run_pipeline._select_exact_quota(
tests/test_run_pipeline.py:378:    assert record["deferred_count"] == total_matched - 1
tests/test_run_pipeline.py:702:    assert first["deferred_count"] == 0
tests/test_run_pipeline.py:728:    assert record["quota_shortfall"] == {"Other": 1}
tests/test_run_pipeline.py:729:    assert record["deferred_count"] == 2  # both AI/ML candidates deferred, not written
tests/test_run_pipeline.py:764:    assert record["quota_shortfall"] == {}
  ```
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/tests/test_run_pipeline.py`
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/tests/test_run_pipeline.py`
- `Bash`:
  ```bash
python - <<'EOF'
p='run_pipeline.py'
s=open(p).read()
old_doc='''    this_run is [] and deferred is EVERY item in new_listings — a partial
    fill (e.g. 4-of-5) is never written, per the 2026-09-07 all-or-nothing
    decision. Candidates that would have won their bucket's slot still
    land in deferred in this case, so they still count toward
    MAX_DEBATE_LOSSES the same way a candidate cut for any other reason
    already does — no special-casing needed downstream.
'''
new_doc='''    this_run is [] — a partial fill (e.g. 4-of-5) is never written, per the
    2026-09-07 all-or-nothing decision. deferred is only the candidates that
    lost a real comparison (ranked below their bucket's cut, or in a bucket
    absent from quota); the ones that WOULD have been selected, including
    every candidate of the short bucket itself, are held back without
    counting toward MAX_DEBATE_LOSSES. They lost to nobody — a thin pool
    would otherwise exclude them permanently after MAX_DEBATE_LOSSES runs
    with nothing ever written (Session 1 Finding 1, 2026-10-03, reproduced
    against the real functions; fix 2026-10-04).
'''
assert old_doc in s
s=s.replace(old_doc,new_doc)
old='''    if shortfall:
        return [], list(new_listings), shortfall

    this_run = [item for bucket in quota for item in selected_by_bucket[bucket]]
    written_uids = {uid for uid, _listing in this_run}
    deferred = [(uid, listing) for uid, listing in new_listings if uid not in written_uids]
    return this_run, deferred, shortfall
'''
new='''    this_run = [item for bucket in quota for item in selected_by_bucket[bucket]]
    selected_uids = {uid for uid, _listing in this_run}
    deferred = [(uid, listing) for uid, listing in new_listings if uid not in selected_uids]
    return ([] if shortfall else this_run), deferred, shortfall
'''
assert old in s
open(p,'w').write(s.replace(old,new))

t='tests/test_run_pipeline.py'
s=open(t).read()
s=s.replace('''    assert this_run == []
    assert deferred == items  # everything deferred, including the sole Other candidate
    assert shortfall == {"Other": 1}
''','''    assert this_run == []
    assert deferred == []  # the sole candidate is held back, not a debate loser
    assert shortfall == {"Other": 1}


def test_select_exact_quota_shortfall_defers_only_real_losers():
    """Short bucket held back uncharged, but a candidate that really lost its
    bucket's comparison (Other has 3 for a quota of 2, AI/ML is short) is still
    deferred — only a shortfall-held candidate is exempt."""
    other = [_listing_with_date(f"o{i}", d) for i, d in enumerate((300, 200, 100))]
    this_run, deferred, shortfall = run_pipeline._select_exact_quota(other, quota={"Other": 2, "AI/ML": 1})

    assert this_run == []
    assert shortfall == {"AI/ML": 1}
    assert [l.date_posted for _, l in deferred] == [100]  # oldest Other lost to two real competitors
''')
s=s.replace('''    assert record["deferred_count"] == 2  # both AI/ML candidates deferred, not written
''','''    assert record["deferred_count"] == 0  # held back, not debate losers
    # Regression (Finding 1): a short pool used to charge every candidate a
    # debate loss each run; 48 runs excluded them forever with nothing written.
    assert run_pipeline.load_debate_losses(kwargs["state_dir"]) == {}
''')
open(t,'w').write(s)
EOF
grep -n "_listing_with_date" tests/test_run_pipeline.py | head -3; python -m pytest -q tests/test_run_pipeline.py 2>&1 | tail -8
  ```
  ```
160:def _listing_with_date(uid_suffix, date_posted):
207:    # _listing_with_date's base fixture (Palantir "Forward Deployed Software
210:    items = [_listing_with_date(i, date_posted) for i, date_posted in enumerate([100, 300, 200])]
...................................................................      [100%]
67 passed in 3.15s
  ```
- `Bash` — `git stash push -q run_pipeline.py && python -m pytest -q tests/test_run_pipeline.py 2>&1 | tail -5; git stash pop -q && python -m pytest -q 2>&1 | tail -1; cat .github/workflows/reseed.yml`
  ```
=========================== short test summary info ============================
FAILED tests/test_run_pipeline.py::test_select_exact_quota_reports_shortfall_and_returns_nothing_when_a_bucket_is_short
FAILED tests/test_run_pipeline.py::test_select_exact_quota_shortfall_defers_only_real_losers
FAILED tests/test_run_pipeline.py::test_run_once_all_or_nothing_short_bucket_writes_nothing
3 failed, 64 passed in 3.66s
529 passed in 3.81s
name: reseed
# Manual cold-start reseed: one large, deliberately resource-intensive pull
# across all 11 sources, for the specific scenario where the vault's dossier
# pile is empty or being deliberately relaunched. workflow_dispatch only —
# never scheduled — and does not touch run.yml's own cadence or budget.

on:
  workflow_dispatch:
    inputs:
      confirm:
        description: 'Type exactly "yes-drain-budget" to run this one-off burst pull.'
        required: true

permissions:
  contents: write  # commit state/seen_ids.json + state/excluded_uids.json + logs/reseed_runs.jsonl back to this repo
  issues: write    # gh issue create on schema-drift / push-failure (same as run.yml)

jobs:
  reseed:
    runs-on: ubuntu-latest
    steps:
      - name: Require explicit confirmation
        if: ${{ github.event.inputs.confirm != 'yes-drain-budget' }}
        run: |
          echo "confirm input must be exactly 'yes-drain-budget' (got '${{ github.event.inputs.confirm }}') — aborting before any checkout or spend."
          exit 1

      - name: Checkout internship-research-loop
        uses: actions/checkout@v4

      - name: Checkout gupta-builds/Jarvis
        uses: actions/checkout@v4
        with:
          repository: gupta-builds/Jarvis
          token: ${{ secrets.JARVIS_PUSH_TOKEN }}
          path: jarvis-checkout
          fetch-depth: 0  # full history — a shallow clone can fail `git pull --rebase`
                          # if the vault's own auto-commit cycle has diverged by more than one commit

      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - run: pip install -r requirements.txt

      - name: Configure git identity
        run: |
          git config --global user.name "internship-research-loop bot"
          git config --global user.email "actions@users.noreply.github.com"

      - name: Run cold-start reseed
        env:
          JARVIS_DIR: ${{ github.workspace }}/jarvis-checkout
          GH_TOKEN: ${{ github.token }}
          FIRECRAWL_API_KEY: ${{ secrets.FIRECRAWL_API_KEY }}
        run: python reseed.py
  ```
- `Bash`:
  ```bash
python - <<'EOF'
p='.github/workflows/reseed.yml'
s=open(p).read()
old='''        if: ${{ github.event.inputs.confirm != 'yes-drain-budget' }}
        run: |
          echo "confirm input must be exactly 'yes-drain-budget' (got '${{ github.event.inputs.confirm }}') — aborting before any checkout or spend."
'''
new='''        if: ${{ github.event.inputs.confirm != 'yes-drain-budget' }}
        env:
          # env indirection, not ${{ }} inside the script: the input is attacker-
          # controllable text and must never be spliced into shell source.
          CONFIRM: ${{ github.event.inputs.confirm }}
        run: |
          echo "confirm input must be exactly 'yes-drain-budget' (got '$CONFIRM') — aborting before any checkout or spend."
'''
assert old in s
open(p,'w').write(s.replace(old,new))
# PRD: Finding 1 no longer open
p='PRD.md'
s=open(p).read()
i=s.index('- **All-or-nothing quota feeds the debate-loss counter')
j=s.index('\n',i)
s=s[:i]+"- **All-or-nothing quota and the debate-loss counter (found 2026-10-03, fixed 2026-10-04).** A short bucket pool used to charge every candidate a debate loss each run, excluding them permanently after `MAX_DEBATE_LOSSES` (48) runs with nothing written. `_select_exact_quota` now defers only real comparison losers; shortfall-held candidates are not charged."+s[j:]
open(p,'w').write(s)
EOF
python -c "import yaml;d=yaml.safe_load(open('.github/workflows/reseed.yml'));print(d['jobs']['reseed']['steps'][0])"
git diff .github | grep '^[+-]'
python -m pytest -q 2>&1 | tail -1
git add run_pipeline.py tests/test_run_pipeline.py PRD.md
git commit -q -m "Don't charge a debate loss to candidates held back by a quota shortfall

A short bucket pool deferred every candidate and charged each a loss; 48 such
runs excluded them permanently with nothing ever written. _select_exact_quota
now defers only real comparison losers.

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>"
git add .github/workflows/reseed.yml
git commit -q -m "reseed.yml: pass the confirm input via env instead of interpolating it into shell

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>"
git log --oneline -3; git status --short | grep -v '^ D .agents/'
  ```
  ```
{'name': 'Require explicit confirmation', 'if': "${{ github.event.inputs.confirm != 'yes-drain-budget' }}", 'env': {'CONFIRM': '${{ github.event.inputs.confirm }}'}, 'run': 'echo "confirm input must be exactly \'yes-drain-budget\' (got \'$CONFIRM\') — aborting before any checkout or spend."\nexit 1\n'}
--- a/.github/workflows/reseed.yml
+++ b/.github/workflows/reseed.yml
+        env:
+          # env indirection, not ${{ }} inside the script: the input is attacker-
+          # controllable text and must never be spliced into shell source.
+          CONFIRM: ${{ github.event.inputs.confirm }}
-          echo "confirm input must be exactly 'yes-drain-budget' (got '${{ github.event.inputs.confirm }}') — aborting before any checkout or spend."
+          echo "confirm input must be exactly 'yes-drain-budget' (got '$CONFIRM') — aborting before any checkout or spend."
529 passed in 6.68s
[graphify hook] launching background rebuild (log: /home/anant_gupta/.cache/graphify-rebuild.log)
[graphify hook] launching background rebuild (log: /home/anant_gupta/.cache/graphify-rebuild.log)
10d3402 reseed.yml: pass the confirm input via env instead of interpolating it into shell
ee5da85 Don't charge a debate loss to candidates held back by a quota shortfall
f022822 Truth-up README, PRD and resume-alteration skill against live state (2026-10-03)
 M AGENTS.md
?? docs/codex/
  ```
- `Bash`:
  ```bash
python - <<'EOF'
import sys; sys.path.insert(0,'.')
from vault_writer.writer import build_frontmatter
from types import SimpleNamespace as N
l=N(company="a",title="b",url="u",source="s",terms=[],locations=[],target_year=[],date_posted=None,category="x")
print(", ".join(build_frontmatter(l,"u","2026-10-04","r").keys()))
EOF
  ```
  ```
company, title, url, source, terms, locations, target_year, date_posted, date_found, deadline_posted, own_deadline, matched_reason, status, next, notes, preference_tier, tags
  ```
- `mcp__jarvis__vault_search_placeholder` — `{}`
- `mcp__jarvis__vault_list` — `{"path":"30_Order/Standards/Internship"}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"30_Order/Standards/Internship/Internship Notes Standard.md"}`
- `mcp__jarvis__vault_read` — `{"path":"30_Order/Standards/Internship/Internship Notes Standard.md","targetType":"heading","target":["Internship Notes Standard","1. Frontmatter — required fields"]}`
- `mcp__jarvis__vault_patch` — `{"path":"30_Order/Standards/Internship/Internship Notes Standard.md","targetType":"heading","target":["Internship Notes Standard","1. Frontmatter — required fields"],"operation":"replace","within":0,"content":"Every dossier carries exactly the fields `vault_writer/writer.py`'s `build_frontmatter()` produces, in this order: `company, title, url, source, terms, locations, target_year, date_posted, date_found, deadline_posted, own_deadline, matched_reason, status, next, notes, preference_tier, tags`. Fail-closed, same as everywhere else in this codebase (`vault_writer/validate.py`'s `REQUIRED_FRONTMATTER_FIELDS`) — a field is present even when `null`/`[]`, never omitted.","ifMatch":"d84ffe"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts.md","targetType":"heading","target":["Codebase","Session 2 — Commit Cleanly, Fix The Two Safety-Relevant Findings, One Small Standard Cleanup"],"scope":"marker"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts.md","targetType":"heading","target":["Codebase","Session 2 — Commit Cleanly, Fix The Two Safety-Relevant Findings, One Small Standard Cleanup"]}`
- `mcp__jarvis__vault_read` — `{"path":"30_Order/Standards/Internship/Internship Notes Standard.md","targetType":"heading","target":["Internship Notes Standard","1. Frontmatter — required fields"],"within":"0"}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts.md","targetType":"heading","target":["Codebase","Session 2 — Commit Cleanly, Fix The Two Safety-Relevant Findings, One Small Standard Cleanup"],"operation":"append","content":"### Execution Report (run 2026-10-04, written into this file by the session itself)\n\n**Task 1 — tree state: matches the human's description, nothing unexpected.** `git status` showed exactly: 21 `.agents/skills/*` deletions; `M AGENTS.md` plus untracked `docs/codex/` (`ACCESS.md`, `ARCHITECTURE.md`, `BUILD_PLAYBOOK.md`); and Session 1's own 14 files (`ingestion/posting_page.py`, `vault_writer/writer.py`, `vault_writer/validate.py`, `run_pipeline.py`, `grade_resume.py`, `README.md`, `PRD.md`, `.cursor/skills/resume-alteration/SKILL.md`, five test files). No other file was modified. Not re-litigated.\n\n**Baseline `pytest`: 528 passed.**\n\n**Task 2 — Session 1's commits (3, disjoint from the `.agents`/`AGENTS.md`/`docs/codex` groups, which were never staged; explicit paths only). `pytest` re-run after each: 528 passed.**\n- `06c7c5d` — \"Stamp every new dossier with deadline_posted or a 7-day own_deadline\": `ingestion/posting_page.py`, `vault_writer/writer.py`, `vault_writer/validate.py`, `run_pipeline.py`, `tests/test_posting_page.py`, `tests/test_run_pipeline.py`, `tests/test_validate.py`, `tests/test_writer.py`.\n- `a3cf111` — \"grade_resume: resolve Main Resume via JARVIS_DIR instead of a hardcoded path\": `grade_resume.py`, `tests/test_grade_resume.py`.\n- `f022822` — \"Truth-up README, PRD and resume-alteration skill against live state (2026-10-03)\": `README.md`, `PRD.md`, `.cursor/skills/resume-alteration/SKILL.md`.\n\n**Task 3 — Finding 1 fixed: `ee5da85` \"Don't charge a debate loss to candidates held back by a quota shortfall\".**\n- *Cause (re-read, not trusted):* `_select_exact_quota`'s shortfall branch returned `list(new_listings)` as `deferred`; `update_debate_losses` charged every one a loss each run; 48 such runs excluded them permanently with nothing ever written.\n- *Fix (`run_pipeline.py`):* one return path now. `deferred` = candidates NOT in any quota bucket's selected slice (ranked below their bucket's cut, or in a bucket absent from quota — identical to a non-shortfall run). `this_run` is `[]` when there is a shortfall. Candidates that would have been selected — including every candidate of the short bucket — are held back and not charged. A real comparison loser is still charged during a shortfall run; the non-shortfall path is byte-for-byte the same behavior.\n- *Tests (`tests/test_run_pipeline.py`):* updated `..._reports_shortfall_and_returns_nothing...` (`deferred == []`, was `== items`); new `test_select_exact_quota_shortfall_defers_only_real_losers` (AI/ML short, Other has 3 for quota 2 → only the oldest Other is deferred); `test_run_once_all_or_nothing_short_bucket_writes_nothing` now asserts `deferred_count == 0` and `load_debate_losses(state_dir) == {}` (the end-to-end hazard: a short-pool run charging losses).\n- *Before/after:* with the old `run_pipeline.py` restored, exactly those 3 tests fail (`3 failed, 64 passed`); with the fix, all pass. Full suite **529 passed** (528 + 1 new).\n- *Side effect to know about:* `record[\"deferred_count\"]` in a shortfall run now means \"lost a comparison\" (0 in that test), not \"everything unwritten\". `quota_shortfall` in the same record still says why nothing was written. `PRD.md`'s \"not yet fixed\" bullet was updated to \"fixed 2026-10-04\" in the same commit.\n\n**Task 4 — Finding 8 fixed: `10d3402` \"reseed.yml: pass the confirm input via env instead of interpolating it into shell\".**\n- *Confirmed against the real file first:* the \"Require explicit confirmation\" step's `run:` contained `echo \"... (got '${{ github.event.inputs.confirm }}') ...\"` — the raw workflow_dispatch input spliced into shell source (a `\"` or `$(...)` in the input would execute).\n- *Diff:* added `env: CONFIRM: ${{ github.event.inputs.confirm }}` to that step; the echo now reads `(got '$CONFIRM')`. The step's `if: ${{ github.event.inputs.confirm != 'yes-drain-budget' }}` is an expression, not shell, so it is unchanged and the gate behaves identically (still aborts with `exit 1` before checkout/spend unless the input is exactly `yes-drain-budget`). Workflow parses as valid YAML (`yaml.safe_load` checked the step). Not exercised via a real `workflow_dispatch` — deliberately not run (it would drain the budget path only if confirmed, but I did not trigger it).\n\n**Task 5 — Internship Notes Standard §1 patched (vault, only §1's first paragraph).** Real `build_frontmatter()` output, printed directly: `company, title, url, source, terms, locations, target_year, date_posted, date_found, deadline_posted, own_deadline, matched_reason, status, next, notes, preference_tier, tags`. §8's stated order already matched it; §1 already had the two deadline fields but was missing `preference_tier` (between `notes` and `tags`). Added it; no other section touched. §1, §8 and the code now agree.\n\n**Final `pytest`: 529 passed** (HEAD `10d3402`).\n\n**State left behind:** 5 new commits on local `master`, **not pushed**. Still uncommitted and untouched: the 21 `.agents/skills/*` deletions, `AGENTS.md`, `docs/codex/`. Not touched: Findings 2-7 and 9-11, every Decisions-list item, `run.yml`, tiers, hard-pause threshold, the mirror question. Note: CLAUDE.md's two-laptop convention says never commit directly to `master`; this prompt's own instruction was to commit locally, so I did, on `master` — worth moving to a `dell-latitude/<topic>` branch before any push.\n\n**Not done:** moving this prompt + report into [[Claude Code Prompts - Archive]] — the prompt says \"once reviewed\", so it stays here for review first."}`

## Actions Taken
- Files created: (none)
- Files modified: (none)
- Files deleted: (none)
- Commands run: git status --short | grep -v '^ D .agents/' ; echo ---; git status --short | grep -c '^ D .agents/'; git diff --stat | tail -20; ls docs/codex; echo ---; python -m pytest -q 2>&1 | tail -5, git diff vault_writer/ run_pipeline.py ingestion/ grade_resume.py | head -300, git diff .cursor | head -40; git diff --stat README.md PRD.md; git diff PRD.md | grep '^[+-]' | head -50, git diff --cached --quiet && echo "index clean" git add ingestion/posting_page.py vault_writer/writer.py vault_writer/validate.py run_pipeline.py tests/test_posting_page.py tests/test_run_pipeline.py tests/test_validate.py tests/test_writer.py git commit -q -m "Stamp every new dossier with deadline_posted or a 7-day own_deadline extract_deadline reads a stated deadline from the fetched posting page; when none is stated, build_frontmatter sets own_deadline = date_found + 7 days. The write gate now requires exactly one of the two. Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" && python -m pytest -q 2>&1 | tail -1 git add grade_resume.py tests/test_grade_resume.py git commit -q -m "grade_resume: resolve Main Resume via JARVIS_DIR instead of a hardcoded path The old /mnt/d/Users/_Anant/... default only existed on the original laptop. Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" && python -m pytest -q 2>&1 | tail -1 git add README.md PRD.md .cursor/skills/resume-alteration/SKILL.md git commit -q -m "Truth-up README, PRD and resume-alteration skill against live state (2026-10-03) Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" && python -m pytest -q 2>&1 | tail -1 git log --oneline -4; git status --short | grep -v '^ D .agents/', grep -n "_select_exact_quota\|update_debate_losses\|MAX_DEBATE_LOSSES\|deferred" run_pipeline.py core/debate.py | head -40, grep -rn "_select_exact_quota\|deferred_count\|quota_shortfall" --include=*.py . | grep -v "^./run_pipeline.py:\(19\|20\|21\|22\|23\)"; , python - <<'EOF' p='run_pipeline.py' s=open(p).read() old_doc=''' this_run is [] and deferred is EVERY item in new_listings — a partial fill (e.g. 4-of-5) is never written, per the 2026-09-07 all-or-nothing decision. Candidates that would have won their bucket's slot still land in deferred in this case, so they still count toward MAX_DEBATE_LOSSES the same way a candidate cut for any other reason already does — no special-casing needed downstream. ''' new_doc=''' this_run is [] — a partial fill (e.g. 4-of-5) is never written, per the 2026-09-07 all-or-nothing decision. deferred is only the candidates that lost a real comparison (ranked below their bucket's cut, or in a bucket absent from quota); the ones that WOULD have been selected, including every candidate of the short bucket itself, are held back without counting toward MAX_DEBATE_LOSSES. They lost to nobody — a thin pool would otherwise exclude them permanently after MAX_DEBATE_LOSSES runs with nothing ever written (Session 1 Finding 1, 2026-10-03, reproduced against the real functions; fix 2026-10-04). ''' assert old_doc in s s=s.replace(old_doc,new_doc) old=''' if shortfall: return [], list(new_listings), shortfall this_run = [item for bucket in quota for item in selected_by_bucket[bucket]] written_uids = {uid for uid, _listing in this_run} deferred = [(uid, listing) for uid, listing in new_listings if uid not in written_uids] return this_run, deferred, shortfall ''' new=''' this_run = [item for bucket in quota for item in selected_by_bucket[bucket]] selected_uids = {uid for uid, _listing in this_run} deferred = [(uid, listing) for uid, listing in new_listings if uid not in selected_uids] return ([] if shortfall else this_run), deferred, shortfall ''' assert old in s open(p,'w').write(s.replace(old,new)) t='tests/test_run_pipeline.py' s=open(t).read() s=s.replace(''' assert this_run == [] assert deferred == items # everything deferred, including the sole Other candidate assert shortfall == {"Other": 1} ''',''' assert this_run == [] assert deferred == [] # the sole candidate is held back, not a debate loser assert shortfall == {"Other": 1} def test_select_exact_quota_shortfall_defers_only_real_losers(): """Short bucket held back uncharged, but a candidate that really lost its bucket's comparison (Other has 3 for a quota of 2, AI/ML is short) is still deferred — only a shortfall-held candidate is exempt.""" other = [_listing_with_date(f"o{i}", d) for i, d in enumerate((300, 200, 100))] this_run, deferred, shortfall = run_pipeline._select_exact_quota(other, quota={"Other": 2, "AI/ML": 1}) assert this_run == [] assert shortfall == {"AI/ML": 1} assert [l.date_posted for _, l in deferred] == [100] # oldest Other lost to two real competitors ''') s=s.replace(''' assert record["deferred_count"] == 2 # both AI/ML candidates deferred, not written ''',''' assert record["deferred_count"] == 0 # held back, not debate losers # Regression (Finding 1): a short pool used to charge every candidate a # debate loss each run; 48 runs excluded them forever with nothing written. assert run_pipeline.load_debate_losses(kwargs["state_dir"]) == {} ''') open(t,'w').write(s) EOF grep -n "_listing_with_date" tests/test_run_pipeline.py | head -3; python -m pytest -q tests/test_run_pipeline.py 2>&1 | tail -8, git stash push -q run_pipeline.py && python -m pytest -q tests/test_run_pipeline.py 2>&1 | tail -5; git stash pop -q && python -m pytest -q 2>&1 | tail -1; cat .github/workflows/reseed.yml, python - <<'EOF' p='.github/workflows/reseed.yml' s=open(p).read() old=''' if: ${{ github.event.inputs.confirm != 'yes-drain-budget' }} run: | echo "confirm input must be exactly 'yes-drain-budget' (got '${{ github.event.inputs.confirm }}') — aborting before any checkout or spend." ''' new=''' if: ${{ github.event.inputs.confirm != 'yes-drain-budget' }} env: # env indirection, not ${{ }} inside the script: the input is attacker- # controllable text and must never be spliced into shell source. CONFIRM: ${{ github.event.inputs.confirm }} run: | echo "confirm input must be exactly 'yes-drain-budget' (got '$CONFIRM') — aborting before any checkout or spend." ''' assert old in s open(p,'w').write(s.replace(old,new)) # PRD: Finding 1 no longer open p='PRD.md' s=open(p).read() i=s.index('- **All-or-nothing quota feeds the debate-loss counter') j=s.index('\n',i) s=s[:i]+"- **All-or-nothing quota and the debate-loss counter (found 2026-10-03, fixed 2026-10-04).** A short bucket pool used to charge every candidate a debate loss each run, excluding them permanently after `MAX_DEBATE_LOSSES` (48) runs with nothing written. `_select_exact_quota` now defers only real comparison losers; shortfall-held candidates are not charged."+s[j:] open(p,'w').write(s) EOF python -c "import yaml;d=yaml.safe_load(open('.github/workflows/reseed.yml'));print(d['jobs']['reseed']['steps'][0])" git diff .github | grep '^[+-]' python -m pytest -q 2>&1 | tail -1 git add run_pipeline.py tests/test_run_pipeline.py PRD.md git commit -q -m "Don't charge a debate loss to candidates held back by a quota shortfall A short bucket pool deferred every candidate and charged each a loss; 48 such runs excluded them permanently with nothing ever written. _select_exact_quota now defers only real comparison losers. Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" git add .github/workflows/reseed.yml git commit -q -m "reseed.yml: pass the confirm input via env instead of interpolating it into shell Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" git log --oneline -3; git status --short | grep -v '^ D .agents/', python - <<'EOF' import sys; sys.path.insert(0,'.') from vault_writer.writer import build_frontmatter from types import SimpleNamespace as N l=N(company="a",title="b",url="u",source="s",terms=[],locations=[],target_year=[],date_posted=None,category="x") print(", ".join(build_frontmatter(l,"u","2026-10-04","r").keys())) EOF
- Tool call tally: Bash (11), mcp__jarvis__search_simple (1), mcp__jarvis__vault_get_document_map (3), mcp__jarvis__vault_list (3), mcp__jarvis__vault_patch (2), mcp__jarvis__vault_read (5), mcp__jarvis__vault_search_placeholder (1), Read (5), ToolSearch (1)

