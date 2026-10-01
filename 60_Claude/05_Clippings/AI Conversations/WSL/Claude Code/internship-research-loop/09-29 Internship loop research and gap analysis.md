---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: wsl
title: "Internship loop research and gap analysis"
started_at: 2026-09-29T01:47:52
ended_at: 2026-09-29T02:08:40
duration_minutes: 21
exported_at: 2026-10-01T10:15:02
project: internship-research-loop
cwd: '/home/anant_gupta/projects/work/internship-research-loop'
session_id: d9e1002f-bcde-4ac4-ac31-6516312edb23
status: raw
turn_count: 2
tools_used:
  Bash: 26
  mcp__jarvis__vault_list: 23
  mcp__jarvis__vault_read: 31
  mcp__jarvis-fs__list_allowed_directories: 1
  Read: 1
  ToolSearch: 1
tokens:
  input: 282
  output: 97692
  cache_creation: 1391570
  cache_read: 30565905
  total: 32055449
cost_usd: null
model:
  - claude-sonnet-5-5
files_touched:
  - "/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/scratchpad/buildlog.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - wsl
---

# Internship loop research and gap analysis

## You

We need to work on these builds that are listed out over here inside jarvis already: `20_Progress/Internship/Building System`, `20_Progress/Internship/Building System/Research Loop - Improvement Plan`, `20_Progress/Internship/Building System/Research Loop - Implementation Plan` & many others in the same folder. Go through notes to analyze through the builds that were previously running and tell me at what state does the current internship-loop stand. Go through the entire improvement plan that was already established in detail. Even the prompts for these builds were laid out correctly to make sure that the build was executed perfectly. I need you to gather all the previous context regarding the internship-loop so that we can further make fixes to the loop and make sure that each and every single step is done perfectly. We have further enhanced the dossier step but we need to make sure that these specifications run perfectly. Another thing that needs to be taken a very deeper look at is the resume and cover letter generation. We have sort of laid out the builds for these features on this repo over here: `20_Progress/Internship/Building System/V0`. Go through all the notes listed over there which talk in detail about the builds that need to still take place for the repo. We need to make sure that in this build session we have completely executed through all of these fixes and builds. To test everything we out. We are going to be working with the dossiers created for the career fair. This step is going to take place after a lot of work is done. Sometime in the future. But your task right now is going to deep dive into the entire build that is imagined to be executed vs. where we currently stand. There is a huge gap between the notes listed out and what currently exists inside this repo. We need to close the gap by laying each and every single build out perfectly. In the previous commit we were in between builds and had updated through a lot of files inside the codebase. I need you to analyze the last commit and the prompts that were already run: `20_Progress/Internship/Building System/Runs`. AFter gathering context on everything. Explain me in detail where we currently stand in simple and directive words. I want to plan ahead on the build that is going to be executed over here and make sure that the spec for thebuild is perfectly laid out for context for each session. Let's do the research correctly and come back with solid information after comparing reality with this codebase. This is a very detailed and extensive research task which requires you to read through jarvis and the codebase. Spend a lot of time on the research gathering context regarding all the files that exist in this codebase. Something that could be of use is the graphify folder that is createed inside this codebase to map everything out and also mirrored inside the jarvis folder over here: `60_Claude/40_Project_Briefs/Internship`. There a lot more notes inside jarvis that can be gone through ind etail but the most imporetant ones have been mentioned to you along with graphify tool access that you currently have. Execute the research in detail and make sure to deliver the desaired output right here.

## Claude

I'll start by mapping the vault folders and the repo's recent history in parallel.

The vault is also checked out inside the repo, so I can read the notes as plain files.

`jarvis-fs` only reaches the repo, so I'll read the vault notes through `vault_read`. I'll convert the saved JSON to plain text so it's readable.

The build log stops at 2026-09-04. Next I'll pull the Improvement Plan, the Reboot prompt, the Resume/Cover Letter map and the V0 notes.

Next: the Implementation Plan, which holds the Track A/B execution plan, and the live prompts file.

The vault notes stop around 2026-09-08, while the repo runs to 09-26, so there's a gap to close. Now the V0 design notes and the Archive.

Now the dossier audit, the workflow that ties the Tailor step together, and the two Standards.

Now the Project Briefs listing (saved to a file earlier), and what the Archive says about the recent prompts.

That listing is the graphify mirror, one note per graph node. I'll use the repo's own `graphify-out` and read the code directly.

Next I'll check which of the planned prompts actually shipped, using git history since 09-05 without the bot commits.

The suite is at 499 passing and local matches origin. Now the live GitHub state: workflows, recent runs, issues.

`run` shows as active now, but `gh run list` returned nothing. I'll check that directly.

`gh` reports zero workflow runs and no bot commits since 09-20, which I'll flag as an open check. Now the core code, starting with the files behind the Track A prompts.

The company registry is only partly built compared with the plan: the flat tier and per-company schema are still missing. I'll check the rest of Track A in code.

Now the live vault: dossier counts per bucket, the promotion folders, and the resume and cover letter files.

`Main Cover Letter.md` still doesn't exist. There are new "How to" notes for both resume and cover letter, so I'll read those.

All five resume "How to" notes are empty stubs from 09-06. Now the Main Resume, the Career Fair notes and the session clippings.

The clippings run through 09-26, including the career fair sessions. I'll read the ones that cover the latest build work.

These three transcripts are large, so I'll pull out the user prompts and the final summaries.

The career fair pass is already done: 11 dossiers across 10 of 51 companies. I'll look at the 09-07 investigation's conclusions next.

Now the 09-12 weekly review, the 09-22 summary sessions and the 09-26 migration session, cut down to their key parts.

Now the promotion folders and the dossier bucket counts, so I can compute the current backlog.

The resume and cover letter machinery is where the biggest gap is, so I'll read those repo files now.

A few more repo checks: dependencies, whether the DOCX generators have tests, and hard-coded paths that could break on the new laptop.

README and PRD are badly out of date. One more check: what the open "Revalidate" issues say.

Last check: the run.yml notify step uses a `dossier-ready` label. If the label doesn't exist, `gh issue create` fails silently.

I read the vault notes, the repo, and the live GitHub and vault state. The old plan is mostly built, but the resume and cover letter half is not, and discovery may not be running. I changed nothing. The vault's build notes stop at 2026-09-08 and the repo runs to 09-26, so I've filled that gap from git and the session transcripts.

## Where the loop stands

- **Code:** All 499 tests pass, local `master` matches origin, and PR #12 is merged.
- **Discovery is probably not running:**
  - `run`, `recheck` and `revalidate` all show as active.
  - The Actions API lists zero runs for every workflow.
  - `logs/runs.jsonl` stops on 08-29, and the last bot commit was 09-20.
  - I can't tell whether run history was deleted or the cron stopped firing.
- **Dossier count:** About 265 (Fullstack 41 and CyS & Finance 48 counted exactly, the other two roughly). That is under the 300 hard-pause. The career-fair folder holds 11 dossiers from the 51-company pass, and that pass is done.
- **Promotion:** There are 9 or more Serious notes and 3 or more Considering. I didn't open the `Career Fair/` and `Missed/` subfolders. There is still no live Applying note.
- **Open issues:** #4–8 are stale capacity alerts. #9–11 are the same 15 dossiers flagged three weeks running, and nobody has acted on them.

## Plan versus reality

| Item | Status |
|---|---|
| Company registry (Track A, Prompt 1) | **Half built.** It has quant and adjacent-field lists, but the tier rank is still `{"high": 0}`. The per-company schema from the plan doesn't exist. |
| Microsoft sidebar fix (Track A, Prompt 2) | Code and fixture shipped. The 6 old Microsoft dossiers still fail (issue #11) because they were written before the fix. |
| Source-specific match reasons (Track A, Prompt 3) | Done. |
| Test consolidation and pipeline contract doc (Track A, Prompt 4) | Done. I didn't check whether the dated correction landed in Source of Truth. |
| Company research cache (Track B, Prompt 5) | Built but not wired into anything. |
| Resume and cover letter banks (Track B, Prompt 6) | Resume is done. **The cover letter bank does not exist.** |
| Exact-quota writes plus hard-pause at 300, `reseed.py`, `screen_report.py`, dossier-ready notification | Shipped. |

The 09-26 commits were tooling only. They added agent memory, mechanical validators for promote-dossier and review-loop-change, the `cover-letter-builder` agent, two DOCX generators, a `/testing` entry point, and mirrors for Cursor, Codex and generic agent tools. That is the "in-between builds" state you remembered.

## Biggest gaps

1. **Fixes only apply to new dossiers.** This is the recurring pattern behind the Microsoft, Zipline and Optiver dossiers still flagged in the revalidate issues. It also covers these vault leftovers:
   - the duplicate pairs (ByteDance ×2, AbbVie ×2, Amex `(2)`, Booz Allen `(2)`/`(3)`);
   - the Montenson/Mortenson typo;
   - Optiver, IMC and Jane Street dossiers split across buckets.

   `preference_tier` was reported never backfilled on 09-07, but I didn't re-check that.
2. **The registry is unfinished.** The debate comparator still ranks all preferred companies equally.
3. **Docs are stale.**
   - README still says two sources and Phases 1–3.
   - PRD is from 08-22, and Source of Truth from 08-24.
   - The Build Log ends 09-04.
   - `Claude Code Prompts.md` still lists a rebase prompt that is already done.
   - `.cursor/skills/resume-alteration` still says Main Resume is "generic filler".
   - `grade_resume.py` hard-codes a `/mnt/d/...` vault path, so it breaks on this laptop.
   - There are four hand-synced copies of the skills and agents (`.claude`, `.cursor`, `.agents`, `.codex`).
4. **The review cadence lapsed.** The 09-12 weekly review failed on a 401 from the Jarvis connection and was never rerun. The earlier reviews flagged two missed deadlines, Castleton and KeyBank.

## Resume and cover letter

The vault's Application Document Preparation workflow defines an eight-step sequence for each application. Here is what exists for each step:

| Step | State |
|---|---|
| prepare (create the Applying note) | Manual only. No skill or agent does it, and `tailoring-application` explicitly won't. |
| draft / plan | `applying` agent is fully specified. It is blocked on the missing cover letter bank. |
| approve | Human step. |
| humanize | **No tooling at all.** The Humanizer note is only an interface, and no gate exists. |
| write | Two DOCX generators exist, with **zero tests**. They are format-only. |
| link | Manual. |
| apply | Manual. |

Other specifics:
- **No Claude Code skills for alteration:** `resume-alteration` and `cover-letter-alteration` exist only as Cursor skills. Neither is a Claude Code skill.
- **Empty "How to" notes:** All 5 resume and 5 cover letter "How to" notes (Get the Job, Research, Edit, Style, Be Human) are empty stubs from 09-06. Their purpose was never scoped. I read them as a planned per-document playbook, but that's my inference.
- **Open resume items:**
  - The resume's four logged gaps (CausalOps, Orby, TradingView, SafeReach) are still unconfirmed.
  - I didn't check whether `Main Resume.docx` and `.pdf` match the Markdown.
- **Cover letter bank:** The blocker is human input. `cover-letter-builder` interviews you and never invents a fact. It has never been run.

## Proposed build sessions, in order

1. **Truth-up (read-only, then docs).**
   - Confirm whether the cron fires by running a workflow dispatch, with your OK.
   - Re-baseline the counts.
   - Update the README, PRD, Source of Truth, Build Log and the prompts file.
   - Fix the `grade_resume.py` path.
2. **Retroactive apply.**
   - Finish the registry with tiers and a `preference_tier` backfill.
   - Re-extract the Microsoft and Zipline dossiers.
   - Merge the duplicate pairs and fix the Montenson typo.
   - Re-bucket the split quant-firm dossiers.
   - Clear issues #9–11.
3. **Cover letter bank.** This is an interactive session with you, run through `cover-letter-builder`.
4. **Resume and cover letter toolchain.**
   - Add tests for the DOCX generators.
   - Port the two alteration skills into `.claude`.
   - Build the Humanizer gate.
   - Scope or delete the 10 stub notes.
   - Decide whether to keep four mirrors or generate them from `.claude`.
5. **Dry run** on 1–2 career-fair dossiers: promote, create the Applying note, tailor, generate the DOCX, link.

**Decisions I need from you:**
- When to re-enable and watch discovery. Under the existing rule, a `gh workflow enable` is your call.
- Which companies get which tier.
- Whether the 300 hard-pause is still right at about 265.
- How many tool mirrors you want to maintain.

## What I didn't verify

- Contents of the Humanized Writing Standard, the review notes, the Postmortem and the Resources note.
- The Archive's per-prompt results, which I inferred from commits and transcripts.
- The Jarvis notes for career fair Day 1/2 (they're in the vault `the-plan`, which I didn't open).
- The graph. Its report was built from an older commit, so I read the code directly.

I can start with session 1 on your go-ahead.

**Tool calls:**

- `mcp__jarvis__vault_list` — `{}`
- `Bash` — `git log --oneline | head -40 && echo ---- && git show --stat HEAD~1 | head -80 && ls`
  ```
PreToolUse:Bash hook error: [Fact-Forcing Gate]

Before the first Bash command this session, present these facts:

1. The current user request in one sentence
2. What this specific command verifies or produces

Present the facts, then retry the same operation.

Narrow recovery: set `GATEGUARD_BASH_ROUTINE_DISABLED=1`; destructive Bash checks remain active.

Recovery: if GateGuard is blocking setup or repair work, run this session with `ECC_GATEGUARD=off` or add `pre:bash:gateguard-fact-force` to `ECC_DISABLED_HOOKS`.
  ```
- `Bash` — `git log --oneline | head -40 && echo ---- && git show --stat HEAD~1 | head -80 && ls`
  ```
a3664ca Document the two-laptop branch workflow; ignore graphify's .sig output
9f1d9b3 Mirror Claude Code skills, agents, and hooks for Codex CLI
d6bf5ca Notify via GitHub issue when new dossiers are ready to promote
b1bc24e Add /testing slash entry point over the testing-tools agent
e11de33 Add cover-letter-builder agent and docx-generation skills for Tailor Step 4
89ca21a Add mechanical convention-checker script to review-loop-change
ec196eb Add mechanical vault-reachability and note-trio validation to promote-dossier
ef57cc7 Add persistent memory to contact-researcher and loop-verifier agents
4aa5977 Switch hourly run to exact-quota selection with a dossier hard-pause
4232e36 Add read-only ready-to-screen report
c3f2f71 Add cold-start reseed for a wiped or relaunched vault
c798cf2 Add on-demand company-enrichment cache
5b59609 Add company registry, agent configs, and pipeline improvements
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
24ce10a Stop tracking graphify-out's regenerated graph files, gitignore them
98b4e21 Recheck log — 2026-09-04
f481769 Recheck log — 2026-09-03
abcf3c7 Recheck log — 2026-09-02
ac0624a Recheck log — 2026-09-01
c69313c Recheck log — 2026-08-31
2fa8b76 Add per-source schema drift checks (Greenhouse/Ashby/Lever/Freehire/AIJobs/InternDock) and zero-match-rate alerting
e856e05 run_pipeline.py: write_gate_failures.json — exclude structurally-doomed uids, not just out-ranked ones
206a49e Recheck log — 2026-08-30
5a6dfe2 Recheck log — 2026-08-29
47c722b Update state + logs — 2026-08-29
----
commit [REDACTED]
Author: Anant Gupta <anantmahi721@gmail.com>
Date:   Sat Sep 26 15:21:12 2026 -0500

    Mirror Claude Code skills, agents, and hooks for Codex CLI
    
    .codex/ mirrors .claude/agents and .claude/hooks for Codex's own config
    shape; .agents/skills/ flattens both agents and skills into the generic
    AGENTS.md-ecosystem SKILL.md convention; AGENTS.md is CLAUDE.md's
    content under the name Codex looks for by default. Same content, no
    new conventions — this is cross-tool reach, not a second source of
    truth to keep in sync by hand.
    
    Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>

 .agents/skills/contact-researcher/SKILL.md         |  93 ++++++++
 .agents/skills/cover-letter-alteration/SKILL.md    |  57 +++++
 .../skills/generating-cover-letter-docx/SKILL.md   |  44 ++++
 .../reference/cover-letter-reference.md            |  69 ++++++
 .../scripts/generate_cover_letter_docx.py          | 232 +++++++++++++++++++
 .agents/skills/generating-resume-docx/SKILL.md     |  43 ++++
 .../reference/resume-reference.md                  |  62 ++++++
 .../scripts/generate_resume_docx.py                | 232 +++++++++++++++++++
 .agents/skills/loop-health-check/SKILL.md          |  74 +++++++
 .agents/skills/promote-dossier/SKILL.md            |  67 ++++++
 .../promote-dossier/reference/note-templates.md    | 176 +++++++++++++++
 .../promote-dossier/reference/worked-example.md    |  72 ++++++
 .../scripts/check_vault_reachability.py            |  97 ++++++++
 .../promote-dossier/scripts/validate_note_trio.py  | 138 ++++++++++++
 .agents/skills/promoting-manual-find/SKILL.md      |  31 +++
 .agents/skills/resume-alteration/SKILL.md          |  56 +++++
 .agents/skills/review-loop-change/SKILL.md         |  63 ++++++
 .../review-loop-change/reference/example-review.md |  49 ++++
 .../scripts/check_conventions.py                   | 246 +++++++++++++++++++++
 .agents/skills/tailoring-application/SKILL.md      |  38 ++++
 .agents/skills/testing/SKILL.md                    |  30 +++
 .codex/agents/applying.toml                        |  57 +++++
 .codex/agents/contact-researcher.toml              | 106 +++++++++
 .codex/agents/cover-letter-builder.toml            |  98 ++++++++
 .codex/agents/loop-verifier.toml                   |  72 ++++++
 .codex/agents/program-writer.toml                  |  49 ++++
 .codex/agents/promotion.toml                       |  43 ++++
 .codex/agents/testing-tools.toml                   |  44 ++++
 .codex/agents/tracking.toml                        |  40 ++++
 .codex/hooks.json                                  |  26 +++
 .codex/hooks/review-reminder.sh                    |  53 +++++
 .codex/hooks/vault-write-guard.sh                  |  29 +++
 AGENTS.md                                          |  83 +++++++
 33 files changed, 2669 insertions(+)
AGENTS.md
CLAUDE.md
PRD.md
README.md
__pycache__
core
docs
enrich.py
grade_resume.py
graphify-out
ingestion
jarvis-checkout
logs
recheck.py
requirements.txt
reseed.py
revalidate.py
run_pipeline.py
screen_report.py
scripts
state
tests
vault_writer
  ```
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System/V0"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System/Runs"}`
- `mcp__jarvis__vault_list` — `{"path":"60_Claude/40_Project_Briefs/Internship"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Source of Truth.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/System - Build Log.md"}`
- `Bash` — `ls jarvis-checkout | head; git -C jarvis-checkout log --oneline 2>/dev/null | head -5; git check-ignore jarvis-checkout; ls ../ ; ls "jarvis-checkout/20_Progress/Internship/Building System" 2>&1 | head; wc -c "jarvis-checkout/20_Progress/Internship/Building System/"*.md "jarvis-checkout/20_Progress/Internship/Building System/"*/*.md 2>&1 | head -30`
  ```
a3664ca Document the two-laptop branch workflow; ignore graphify's .sig output
9f1d9b3 Mirror Claude Code skills, agents, and hooks for Codex CLI
d6bf5ca Notify via GitHub issue when new dossiers are ready to promote
b1bc24e Add /testing slash entry point over the testing-tools agent
e11de33 Add cover-letter-builder agent and docx-generation skills for Tailor Step 4
jarvis-checkout
gupta-builds
internship-research-loop
ls: cannot access 'jarvis-checkout/20_Progress/Internship/Building System': No such file or directory
wc: 'jarvis-checkout/20_Progress/Internship/Building System/*.md': No such file or directory
wc: 'jarvis-checkout/20_Progress/Internship/Building System/*/*.md': No such file or directory
0 total
  ```
- `ToolSearch` — `{"query":"select:mcp__jarvis-fs__read_text_file,mcp__jarvis-fs__read_multiple_files,mcp__jarvis-fs__list_allowed_directories,mcp__jarvis-fs__directory_tree","max_results":5}`
- `mcp__jarvis-fs__list_allowed_directories` — `{}`
- `Bash`:
  ```bash
cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/tool-results/ && mkdir -p /tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/scratchpad && python3 - <<'E'
import json
d=json.load(open('toolu_01AKQWJpoDV7oos6ZbCPJvV3.json'))
o=json.loads(d[0]['text'])
open('/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/scratchpad/buildlog.md','w').write(o['content'])
print(len(o['content']))
E
  ```
  ```
54087
Shell cwd was reset to /home/anant_gupta/projects/work/internship-research-loop
  ```
- `Read` — `/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/scratchpad/buildlog.md`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Research Loop - Improvement Plan.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Prompt 1 Reboot — Building System Refresh Session (2026-09-04).md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Resume & Cover Letter - System Map.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Phases Run.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Research Loop - Implementation Plan.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Claude Code Prompts.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/V0/Resume Alteration.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/V0/Cover Letter Alteration.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/V0/Humanizer.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/V0/HackerRank Hiring-Agent Scoring Rubric.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/V0/Dossier Corrections.md"}`
- `mcp__jarvis__vault_read` — `{"path":"30_Order/Workflows/Internship/Application Document Preparation.md"}`
- `mcp__jarvis__vault_read` — `{"path":"30_Order/Standards/Internship/Resume Alteration Standard.md"}`
- `mcp__jarvis__vault_read` — `{"path":"30_Order/Standards/Internship/Cover Letter Alteration Standard.md"}`
- `Bash` — `cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/tool-results/ && head -c 1500 mcp-jarvis-vault_list-1790647305916.txt; echo; grep -n -i "internship" mcp-jarvis-vault_list-1790647305916.txt | head -80; wc -l mcp-jarvis-vault_list-1790647305916.txt`
  ```
{
  "files": [
    "(b) Already sourced in the vault's own research log  Cover Letter Alteration Standard §7.md",
    "(b) Columbia University SEAS Career Center — verified live 2026-09-06.md",
    "(b) National American University Career Services — verified live 2026-09-06.md",
    "(text, tags) for every '- ' line carrying at least one skill tag..md",
    "0. Check the block first — check real files, not a note about them.md",
    "0. Check the block first — do not skip this.md",
    "1. Collect the lead.md",
    "1. Confirm the Applying note exists.md",
    "1. Full test suite.md",
    "1. Full test suite_1.md",
    "1. Input.md",
    "1. Program note.md",
    "1. Program note_1.md",
    "1. Read inputs.md",
    "1. Running and interpreting the suite.md",
    "1. Take the input.md",
    "1. Take the input_1.md",
    "1. Take the input_2.md",
    "1. Take the input_3.md",
    "1. Take the input_4.md",
    "1. Take the input_5.md",
    "1. Zero-LLM in the unattended path.md",
    "1. Zero-LLM in the unattended path_1.md",
    "1. `python-docx` (low freedom).md",
    "1. `python-docx` (low freedom)_1.md",
    "150170 stay informational-only (logged via dossier_total, no issue);     19020.md",
    "2 real AIML candidates, 0 Other — Other's quota of 1 can't be filled,     so NO.md",
    "2. Adding a test for a new source — the schema-drift pattern, don't blindly repeat it.md",
    "2. Ask two concrete questions — same shape as `promote-dossier`.md",
    "2. Ask t
91:    "650+ Summer 2027 Internships Open Now (Apply Links).md",
188:    "Hardware is not auto-excluded — Jane Street's FPGAASIC internship is     a real.md",
197:    "Internship Research Loop — PRD.md",
313:    "Real case, confirmed live 2026-08-24 '[REDACTED]'.md",
318:    "Real dossier Optiver 'FPGA Internship (2027 Start)' — Netherlands,     a _NON_U.md",
506:    "_COMMUNITY_650+ Summer 2027 Internships Open Now (Apply Links).md",
510:    "_COMMUNITY_Internship Research Loop — PRD.md",
545:    "_COMMUNITY_internship-loop.md",
546:    "_COMMUNITY_internship-research-loop — Claude Code guidance.md",
547:    "_COMMUNITY_internship-research-loop.md",
807:    "internship-loop.md",
808:    "internship-research-loop — Claude Code guidance.md",
809:    "internship-research-loop.md",
1298:    "[REDACTED]().md",
1399 [REDACTED].txt
Shell cwd was reset to /home/anant_gupta/projects/work/internship-research-loop
  ```
- `Bash` — `ls graphify-out | head -20; echo ----; git ls-files | grep -v -E '^(logs|state)/' | grep -v -E '^\.(agents|codex)/' | xargs wc -l 2>/dev/null | sort -k2 | awk '{print $1, $2}' | column -c 200 | head -150`
  ```
2026-08-21
2026-08-22
2026-08-23
2026-08-24
2026-08-25
2026-08-28
2026-08-31
2026-09-06
2026-09-08
2026-09-26
GRAPH_REPORT.md
cache
graph.html
graph.json
manifest.json
----
61 .claude/agents/applying.md								77 core/profile.yaml
110 .claude/agents/contact-researcher.md						192 core/relevance.py
102 .claude/agents/cover-letter-builder.md						128 core/run_log.py
76 .claude/agents/loop-verifier.md							286 core/schema_drift.py
53 .claude/agents/program-writer.md							58 docs/PIPELINE_CONTRACT.md
47 .claude/agents/promotion.md								209 enrich.py
48 .claude/agents/testing-tools.md							89 grade_resume.py
44 .claude/agents/tracking.md								37 graphify-out/.gitignore
0 .claude/context/MEMORY.md								131 ingestion/freehire.py
0 .claude/context/jarvis.md								161 ingestion/interndock.py
53 .claude/hooks/review-reminder.sh							247 ingestion/normalize.py
29 .claude/hooks/vault-write-guard.sh							316 ingestion/posting_page.py
19 .claude/rules/autonomous.md								193 ingestion/sources.py
30 .claude/rules/hooks.md								178 recheck.py
5 .claude/rules/internship-loop.md							5 requirements.txt
22 .claude/rules/jarvis.md								167 reseed.py
26 .claude/rules/mcp-permissions.md							114 revalidate.py
95 .claude/settings.json								1068 run_pipeline.py
44 .claude/skills/generating-cover-letter-docx/SKILL.md					74 screen_report.py
69 .claude/skills/generating-cover-letter-docx/reference/cover-letter-reference.md	18 scripts/hooks/pre-push
232 .claude/skills/generating-cover-letter-docx/scripts/generate_cover_letter_docx.py	55 tests/fixtures/applyguy.json
43 .claude/skills/generating-resume-docx/SKILL.md					49 tests/fixtures/freehire.json
62 .claude/skills/generating-resume-docx/reference/resume-reference.md			19 tests/fixtures/interndock_drop.md
232 .claude/skills/generating-resume-docx/scripts/generate_resume_docx.py		163 tests/fixtures/josegael.json
67 .claude/skills/promote-dossier/SKILL.md						83 tests/fixtures/posting_ashby_ctgt.md
176 .claude/skills/promote-dossier/reference/note-templates.md				60 tests/fixtures/posting_fiverings.md
72 .claude/skills/promote-dossier/reference/worked-example.md				39 tests/fixtures/posting_google_careers.md
97 .claude/skills/promote-dossier/scripts/check_vault_reachability.py			98 tests/fixtures/posting_microsoft_careers.md
138 .claude/skills/promote-dossier/scripts/validate_note_trio.py			41 tests/fixtures/posting_zipline_open_roles.md
31 .claude/skills/promoting-manual-find/SKILL.md					169 tests/fixtures/simplifyjobs.json
63 .claude/skills/review-loop-change/SKILL.md						0 tests/fixtures/throwaway_vault/10_Areas/Career/Internships/List/Dossiers/.gitkeep
49 .claude/skills/review-loop-change/reference/example-review.md			98 tests/fixtures/vanshb03.json
246 .claude/skills/review-loop-change/scripts/check_conventions.py			124 tests/fixtures/zshah101.json
38 .claude/skills/tailoring-application/SKILL.md					164 tests/test_classify.py
30 .claude/skills/testing/SKILL.md							102 tests/test_company_cache.py
2 .claudeignore										42 tests/test_company_registry.py
64 .cursor/rules/internship-loop-core.mdc						112 tests/test_debate.py
33 .cursor/rules/pipeline-python.mdc							167 tests/test_debate_losses.py
93 .cursor/skills/contact-researcher/SKILL.md						91 tests/test_enrich.py
57 .cursor/skills/cover-letter-alteration/SKILL.md					492 tests/test_filter.py
74 .cursor/skills/loop-health-check/SKILL.md						110 tests/test_freehire.py
68 .cursor/skills/promote-dossier/SKILL.md						131 tests/test_git_ops.py
176 .cursor/skills/promote-dossier/reference/note-templates.md				31 tests/test_grade_resume.py
56 .cursor/skills/resume-alteration/SKILL.md						225 tests/test_identity.py
60 .cursor/skills/review-loop-change/SKILL.md						105 tests/test_interndock.py
4 .cursorignore										354 tests/test_posting_page.py
1 .gitattributes									75 tests/test_recheck.py
42 .github/workflows/recheck.yml							460 tests/test_relevance.py
56 .github/workflows/reseed.yml								139 tests/test_reseed.py
35 .github/workflows/revalidate.yml							84 tests/test_revalidate.py
60 .github/workflows/run.yml								118 tests/test_run_log.py
12 .github/workflows/test.yml								1105 tests/test_run_pipeline.py
18 .gitignore										469 tests/test_schema_drift.py
83 AGENTS.md										66 tests/test_screen_report.py
84 CLAUDE.md										238 tests/test_sources.py
88 PRD.md										224 tests/test_validate.py
32 README.md										215 tests/test_write_gate_failures.py
87 core/classify.py									289 tests/test_writer.py
139 core/company_cache.py								139 tests/test_zero_match_alert.py
47 core/company_registry.py								15485 total
82 core/debate.py									16 vault_writer/templates/dossier.md.j2
320 core/filter.py									144 vault_writer/validate.py
57 core/git_ops.py									274 vault_writer/writer.py
119 core/identity.py
  ```
- `Bash` — `git log --since=2026-09-05 --format='%h %ad %an | %s' --date=short --no-merges | grep -v -E 'Recheck log|Update state' ; echo ----; git status -sb | head; git branch -a; git fetch origin 2>&1 | tail -2; git log --oneline HEAD..origin/master | head`
  ```
a3664ca 2026-09-26 Anant Gupta | Document the two-laptop branch workflow; ignore graphify's .sig output
9f1d9b3 2026-09-26 Anant Gupta | Mirror Claude Code skills, agents, and hooks for Codex CLI
d6bf5ca 2026-09-26 Anant Gupta | Notify via GitHub issue when new dossiers are ready to promote
b1bc24e 2026-09-26 Anant Gupta | Add /testing slash entry point over the testing-tools agent
e11de33 2026-09-26 Anant Gupta | Add cover-letter-builder agent and docx-generation skills for Tailor Step 4
89ca21a 2026-09-26 Anant Gupta | Add mechanical convention-checker script to review-loop-change
ec196eb 2026-09-26 Anant Gupta | Add mechanical vault-reachability and note-trio validation to promote-dossier
ef57cc7 2026-09-26 Anant Gupta | Add persistent memory to contact-researcher and loop-verifier agents
4aa5977 2026-09-08 Anant Gupta | Switch hourly run to exact-quota selection with a dossier hard-pause
4232e36 2026-09-08 Anant Gupta | Add read-only ready-to-screen report
c3f2f71 2026-09-08 Anant Gupta | Add cold-start reseed for a wiped or relaunched vault
c798cf2 2026-09-08 Anant Gupta | Add on-demand company-enrichment cache
5b59609 2026-09-06 Anant Gupta | Add company registry, agent configs, and pipeline improvements
----
## master...origin/master
* master
  remotes/origin/master
  ```
- `Bash` — `(source .venv/bin/activate 2>/dev/null; python -m pytest -q 2>&1 | tail -8); ls -a | head -30`
  ```
........................................................................ [ 14%]
........................................................................ [ 28%]
........................................................................ [ 43%]
........................................................................ [ 57%]
........................................................................ [ 72%]
........................................................................ [ 86%]
...................................................................      [100%]
499 passed in 4.11s
.
..
.agents
.claude
.claudeignore
.codex
.cursor
.cursorignore
.git
.gitattributes
.github
.gitignore
.pytest_cache
.venv
AGENTS.md
CLAUDE.md
PRD.md
README.md
__pycache__
core
docs
enrich.py
grade_resume.py
graphify-out
ingestion
jarvis-checkout
logs
recheck.py
requirements.txt
reseed.py
  ```
- `Bash` — `gh workflow list --all 2>&1; echo ---; for w in run recheck revalidate reseed test; do echo "== $w"; gh run list --workflow $w.yml --limit 4 2>&1 | head -5; done; echo ---; gh issue list --state open --limit 30 2>&1; gh pr list --state all --limit 5 2>&1`
  ```
recheck	active	315675907
reseed	active	367937546
revalidate	active	342320481
run	active	315074756
test	active	314681321
Dependency Graph	active	314681291
---
== run
== recheck
== revalidate
== reseed
== test
---
11	OPEN	Revalidate: 15 live dossier(s) now fail current rules (2026-09-14)		2026-09-14T14:36:08Z
10	OPEN	Revalidate: 15 live dossier(s) now fail current rules (2026-09-07)		2026-09-07T13:50:15Z
9	OPEN	Revalidate: 15 live dossier(s) now fail current rules (2026-08-31)		2026-08-31T15:42:59Z
8	OPEN	Total dossier count crossed 200 (2026-08-21T17:43:50.074043+00:00)		2026-08-21T17:44:53Z
7	OPEN	Total dossier count crossed 190 (2026-08-21T17:43:50.074043+00:00)		2026-08-21T17:44:52Z
6	OPEN	Bucket 'Other' at/over its 50-dossier notification threshold (2026-08-21T17:43:50.074043+00:00)		2026-08-21T17:44:51Z
5	OPEN	Bucket 'CyS & Finance' at/over its 50-dossier notification threshold (2026-08-21T17:43:50.074043+00:00)		2026-08-21T17:44:50Z
4	OPEN	Bucket 'AI/ML' at/over its 50-dossier notification threshold (2026-08-21T17:43:50.074043+00:00)		2026-08-21T17:44:50Z
12	Pre-migration cleanup: land pending skills/agents, start two-laptop PR workflow	dell-latitude/repo-cleanup-and-migration-prep	MERGED	2026-09-26T20:33:46Z
  ```
- `Bash` — `ls state logs; tail -c 1500 logs/runs.jsonl | tail -1 | cut -c1-900; echo; tail -1 logs/rechecks.jsonl | cut -c1-600; git log -3 --format='%h %ad %s' --date=iso -- logs/runs.jsonl state/seen_ids.json`
  ```
logs:
rechecks.jsonl
runs.jsonl

state:
capacity_notified.json
debate_losses.json
dossier_uids.json
excluded_uids.json
interndock_seen_guides.json
opt_cache.json
seen_ids.json
ew_count": 356, "already_seen_count": 383, "deferred_count": 345, "written_count": 2, "rejections": [{"uid": "ApplyGuy:custom:google:91436104816698054", "check": "degree_eligibility", "reason": "currently pursuing a PhD degree"}, {"uid": "vanshb03:[REDACTED]", "check": "url_liveness", "reason": "HTTP 404"}, {"uid": "SimplifyJobs:[REDACTED]", "check": "url_liveness", "reason": "HTTP 403"}, {"uid": "SimplifyJobs:[REDACTED]", "check": "url_liveness", "reason": "HTTP 403"}, {"uid": "ApplyGuy:[REDACTED]", "check": "url_liveness", "reason": "HTTP 404"}, {"uid": "SimplifyJobs:[REDACTED]", "check": "url_liveness", "reason": "HTTP 403"}, {"uid": "AIJobs:[REDACTED]", "check": "opt_eligibility", "reason": "export-

{"timestamp": "2026-09-20T11:44:38.895030+00:00", "type": "recheck", "scanned": 343, "removals": [], "errors": [], "halted": false, "halt_reason": null}
47c722b 2026-08-29 09:34:27 +0000 Update state + logs — 2026-08-29
a59adda 2026-08-29 02:37:35 +0000 Update state + logs — 2026-08-29
f67dbb9 2026-08-28 19:52:41 +0000 Update state + logs — 2026-08-28
  ```
- `Bash` — `gh api repos/gupta-builds/internship-research-loop/actions/workflows --jq '.workflows[] | "\(.name) \(.state) \(.updated_at)"'; echo ---; gh api "repos/gupta-builds/internship-research-loop/actions/runs?per_page=12" --jq '.workflow_runs[] | "\(.created_at) \(.name) \(.event) \(.conclusion)"'; echo ---; git log -5 --format='%h %ad %s' --date=iso origin/master -- logs/rechecks.jsonl`
  ```
recheck active 2026-07-18T05:56:44.000-05:00
reseed active 2026-09-26T15:41:12.000-05:00
revalidate active 2026-08-25T13:04:02.000-05:00
run active 2026-09-22T12:39:02.000-05:00
test active 2026-07-16T14:47:02.000-05:00
Dependency Graph active 2026-07-16T14:46:58.000-05:00
---
2026-07-16T19:46:58Z Graph Update: pip in /. #1463923569 dynamic success
---
ce13788 2026-09-20 11:44:46 +0000 Recheck log — 2026-09-20
189d66b 2026-09-19 11:23:57 +0000 Recheck log — 2026-09-19
0e58e19 2026-09-18 11:41:50 +0000 Recheck log — 2026-09-18
e29c3f1 2026-09-17 11:59:40 +0000 Recheck log — 2026-09-17
5aada60 2026-09-16 11:57:55 +0000 Recheck log — 2026-09-16
  ```
- `Bash` — `for id in 315074756 315675907 342320481 367937546 314681321; do echo "== $id"; gh api "repos/gupta-builds/internship-research-loop/actions/workflows/$id/runs?per_page=5" --jq '.total_count, (.workflow_runs[] | "\(.created_at) \(.event) \(.status)/\(.conclusion)")'; done; gh api repos/gupta-builds/internship-research-loop --jq '{visibility, pushed_at, archived, disabled}'; gh api repos/gupta-builds/internship-research-loop/actions/permissions`
  ```
== 315074756
0
== 315675907
0
== 342320481
0
== 367937546
0
== 314681321
0
{"archived":false,"disabled":false,"pushed_at":"2026-09-26T20:45:27Z","visibility":"public"}
{"enabled":true,"allowed_actions":"all","sha_pinning_required":false}
  ```
- `Bash` — `git log origin/master --since=2026-09-19 --format='%h %ad %an | %s' --date=iso; echo; git log origin/master -1 --format='%h %ad' --date=iso -- logs/runs.jsonl; wc -l logs/runs.jsonl; cat .github/workflows/run.yml`
  ```
a3664ca 2026-09-26 15:22:18 -0500 Anant Gupta | Document the two-laptop branch workflow; ignore graphify's .sig output
9f1d9b3 2026-09-26 15:21:12 -0500 Anant Gupta | Mirror Claude Code skills, agents, and hooks for Codex CLI
d6bf5ca 2026-09-26 15:21:11 -0500 Anant Gupta | Notify via GitHub issue when new dossiers are ready to promote
b1bc24e 2026-09-26 15:21:11 -0500 Anant Gupta | Add /testing slash entry point over the testing-tools agent
e11de33 2026-09-26 15:21:10 -0500 Anant Gupta | Add cover-letter-builder agent and docx-generation skills for Tailor Step 4
89ca21a 2026-09-26 15:21:09 -0500 Anant Gupta | Add mechanical convention-checker script to review-loop-change
ec196eb 2026-09-26 15:21:09 -0500 Anant Gupta | Add mechanical vault-reachability and note-trio validation to promote-dossier
ef57cc7 2026-09-26 15:21:08 -0500 Anant Gupta | Add persistent memory to contact-researcher and loop-verifier agents
4aa5977 2026-09-08 11:53:57 -0500 Anant Gupta | Switch hourly run to exact-quota selection with a dossier hard-pause
4232e36 2026-09-08 11:53:47 -0500 Anant Gupta | Add read-only ready-to-screen report
c3f2f71 2026-09-08 11:53:38 -0500 Anant Gupta | Add cold-start reseed for a wiped or relaunched vault
c798cf2 2026-09-08 11:53:29 -0500 Anant Gupta | Add on-demand company-enrichment cache
5b59609 2026-09-06 20:42:41 -0500 Anant Gupta | Add company registry, agent configs, and pipeline improvements
ce13788 2026-09-20 11:44:46 +0000 internship-research-loop bot | Recheck log — 2026-09-20

47c722b 2026-08-29 09:34:27 +0000
687 logs/runs.jsonl
name: run
on:
  schedule:
    - cron: '0 * * * *'  # hourly to start — sources update ~30min, tighten later once a week of clean runs builds confidence
  workflow_dispatch: {}   # manual trigger, for verifying end-to-end before/while trusting the schedule

permissions:
  contents: write  # commit state/seen_ids.json + logs/runs.jsonl back to this repo
  issues: write    # gh issue create on schema-drift / push-failure / systemic write-gate rejection
  actions: write   # gh workflow disable run — the 2026-09-07 hard-pause mechanism (run_pipeline.py)

jobs:
  pipeline:
    runs-on: ubuntu-latest
    steps:
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

      - name: Run pipeline
        env:
          JARVIS_DIR: ${{ github.workspace }}/jarvis-checkout
          GH_TOKEN: ${{ github.token }}
          FIRECRAWL_API_KEY: ${{ secrets.FIRECRAWL_API_KEY }}  # discovery-time posting fetch; absent = thin dossiers, never a failure
        run: python run_pipeline.py

      - name: Notify if new dossiers are ready to promote
        # Added 2026-09-08. run_pipeline.py already writes written_count into the last
        # line of logs/runs.jsonl; issues: write is already granted above (schema-drift
        # notices use it) so this needs no new permission. Best-effort only (|| true) —
        # a notification failure must never fail the pipeline run itself.
        run: |
          COUNT=$(tail -1 logs/runs.jsonl | python3 -c "import json,sys; print(json.load(sys.stdin).get('written_count', 0))" 2>/dev/null || echo 0)
          if [ "$COUNT" -gt 0 ] 2>/dev/null; then
            gh issue create \
              --title "$COUNT new dossier(s) ready for /promote-dossier" \
              --body "Run at $(date -u +%Y-%m-%dT%H:%M:%SZ). See logs/runs.jsonl for detail." \
              --label "dossier-ready" || true
          fi
        env:
          GH_TOKEN: ${{ github.token }}
  ```
- `Bash` — `cat core/company_registry.py core/debate.py core/classify.py && cat core/profile.yaml | head -80`
  ```
"""Single source of truth for company-level facts used by core/classify.py,
core/debate.py, and core/relevance.py — those three files used to hand-
maintain independent company lists that could (and did) drift apart. Data
only: this module makes no eligibility/bucket/tier decisions itself, it just
answers "what's true about this company" for callers to act on.
"""
from core.identity import _norm_company

# Quant-trading/quant-finance firms whose engineering postings are
# finance-adjacent regardless of which keyword classify.py's regexes happen
# to match. Real confirmed vault split (2026-09-06, direct mcp__jarvis__
# vault_list on both '1 - AI & ML' and '3 - CyS & Finance'): each of these
# 8 companies has real dossiers in BOTH folders for the same kind of role
# (e.g. Optiver's "Software Engineer Intern - Optiver.md" in AI/ML vs.
# "Software Engineer Intern (Summer 2027 - Austin) - Optiver.md" in CyS &
# Finance) purely because of which keyword the fetched content tripped.
# Optiver/IMC/Chicago Trading Company were the ones cited in the vault's own
# "Dossier Corrections" note §2; Jane Street/Jump Trading/Aquatic Capital
# Management/Walleye Capital/Millennium were found by directly listing both
# folders — not previously cited anywhere.
_QUANT_FINANCE_COMPANIES = {
    _norm_company(c) for c in (
        "Optiver", "IMC", "Chicago Trading Company",
        "Jane Street", "Jump Trading", "Aquatic Capital Management",
        "Walleye Capital", "Millennium",
    )
}


def is_quant_finance_company(company: str) -> bool:
    return _norm_company(company) in _QUANT_FINANCE_COMPANIES


# Moved verbatim from core/relevance.py's _ADJACENT_FIELD_COMPANY_HINT_RE
# (2026-08-23 dossier audit, Task 7(a)#4) — same 8 companies, same original
# per-company citations, which stay in relevance.py's own comment block
# rather than being duplicated here.
ADJACENT_FIELD_COMPANIES = (
    "fti consulting", "truist", "vertiv", "uhy", "cno financial",
    "dimensional fund", "keybank", "continental resources",
)

# Tier name -> sort rank for core/debate.py's Stage 1 preference comparator.
# Only one grade exists today (every company in core/profile.yaml's
# human-maintained preferred_companies is "high") — this relocates the
# rank-ordering table itself, it does not re-tier any company.
TIER_RANK = {"high": 0}
"""Layer 3.5 — the "debate": a deterministic pairwise comparator that decides
which of two candidates ranks first when both compete for this run's
per-bucket write budget (Prompt 5 Task L). Zero-LLM by design, same rule as
everywhere else in this codebase's unattended path (see the repo's own
CLAUDE.md) — "debating between two internships" is a real comparator
function, not a model call. Used via functools.cmp_to_key() to produce a
full deterministic ranking in one efficient sort: mathematically the same
outcome as running every pairwise comparison, without the wasted O(n^2)
redundant comparisons a literal round-robin would do.

Three priority stages, each only breaking ties left by the stage above it —
kept as separable comparison stages rather than one blended numeric score,
so a human reading debate_compare can see exactly why any two candidates
were ordered the way they were:
  1. Preferred-company tier (core.identity.company_matches_preference)
  2. Bucket fill-need (cross-bucket only — see the note on bucket_urgency
     below for why this stage has no live effect in the current call site)
  3. Recency (most-recently-posted-first, the pre-existing rule)
"""
from core.classify import classify
from core.company_registry import TIER_RANK
from core.identity import company_matches_preference


def _preference_rank(company: str, preferred_companies: dict) -> int:
    tier = company_matches_preference(company, preferred_companies)
    return TIER_RANK.get(tier, 1) if tier else 1


def debate_compare(a, b, preferred_companies: dict, bucket_urgency: dict = None) -> int:
    """Standard cmp semantics: negative if a should rank first, positive if
    b should, 0 if the next stage must decide. a and b are (uid, listing)
    tuples, the same shape _prioritize_and_cap already sorts.

    bucket_urgency (optional): {bucket_name: shortfall_score}, precomputed
    once per run as max(0, budget[bucket] - candidate_count[bucket]) — a
    higher score means that bucket has fewer real candidates this run than
    its budget, i.e. it's at risk of going unfilled even taking every
    candidate it has. Only consulted when a and b are headed for DIFFERENT
    buckets; a same-bucket comparison skips stage 2 entirely, per spec.

    Note on reachability: _prioritize_and_cap (run_pipeline.py) partitions
    candidates by bucket before sorting, so every debate_compare call it
    makes is already same-bucket — stage 2 never actually fires through that
    call path today. It's implemented and tested here as a real, correct,
    independently-callable stage (per Task L's explicit spec and test
    requirements), not dead code: a future architecture change that compares
    candidates across buckets directly would exercise it immediately, and no
    second mechanism would need to be built to support that."""
    uid_a, listing_a = a
    uid_b, listing_b = b

    rank_a = _preference_rank(listing_a.company, preferred_companies)
    rank_b = _preference_rank(listing_b.company, preferred_companies)
    if rank_a != rank_b:
        return rank_a - rank_b

    if bucket_urgency is not None:
        bucket_a, _ = classify(listing_a.title, listing_a.category, "", listing_a.company)
        bucket_b, _ = classify(listing_b.title, listing_b.category, "", listing_b.company)
        if bucket_a != bucket_b:
            urgency_a = bucket_urgency.get(bucket_a, 0)
            urgency_b = bucket_urgency.get(bucket_b, 0)
            if urgency_a != urgency_b:
                return urgency_b - urgency_a  # higher urgency ranks first

    date_a = listing_a.date_posted or 0
    date_b = listing_b.date_posted or 0
    return date_b - date_a  # more recent ranks first


def compute_bucket_urgency(candidates: list, budget: dict) -> dict:
    """{bucket: max(0, budget[bucket] - candidate_count[bucket])} for every
    bucket present in budget — precomputed once per run from the full
    candidate pool (before any per-bucket slicing), since "at risk of going
    unfilled" is a property of how many real candidates exist this run
    relative to budget, not a running fill-count that changes mid-sort."""
    counts = {}
    for _uid, listing in candidates:
        bucket, _ = classify(listing.title, listing.category, "", listing.company)
        counts[bucket] = counts.get(bucket, 0) + 1
    return {bucket: max(0, cap - counts.get(bucket, 0)) for bucket, cap in budget.items()}
"""Layer 2.5b — priority-bucket classification for listings that already
passed core/relevance.py's gate. Deterministic keyword matching against
title + category + fetched posting content (empty content degrades
gracefully — title/category alone still register). Zero-LLM, same style as
core/filter.py and core/relevance.py.

Exactly one bucket, checked in this order (first match wins — a posting can
show signals for more than one, e.g. AI infra at a fintech should read
AI/ML, not CyS & Finance):
  1. AI/ML       — LLM, RAG, agents, ML infra, applied AI, deep learning
  2. CyS & Finance — security or finance-adjacent software engineering
  3. Fullstack   — product/frontend/backend/systems engineering
  4. Other       — genuine software engineering (relevance gate already
                   confirmed this), matching none of the above
"""
import re

from core.company_registry import is_quant_finance_company

BUCKET_FOLDERS = {
    "AI/ML": "1 - AI & ML",
    "Fullstack": "2 - Fullstack",
    "CyS & Finance": "3 - CyS & Finance",
    "Other": "Other",
}

# Real examples: Bosch "Autonomous Driving – Internship in ML" (model
# training, AI-enabled robotics test system, PyTorch) and Magna "R&D-
# Computer Vision Engineering Intern" (TensorFlow or PyTorch, ML data
# pipeline) both match here despite being automotive companies.
_AI_ML_RE = re.compile(
    r"\b(llm|large language models?|\brag\b|retrieval.augmented|agentic|ai agent"
    r"|machine learning|deep learning|ml infra|applied ai|generative ai"
    r"|computer vision|\bnlp\b|natural language|embeddings?|pytorch|tensorflow"
    r"|neural network|data scientist|ml engineer|ai engineer|ai.enabled)\b", re.I,
)
# 'threat' narrowed 2026-07-29: real false positive, Mosaic Company
# "Operations & Automation Engineering Co-op/Intern" (chemical-plant
# PLC/DCS/SCADA role, zero cybersecurity content) matched bare 'threat' on a
# workplace-safety disclaimer ("without posing a direct threat to the safety
# of his or her own self"). Requiring co-occurrence with a real
# security-context word within 30 chars catches genuine cybersecurity usage
# ("threat model", "threat actor", "threat intelligence", "threat detection")
# without matching safety-boilerplate/weather/insider-threat-to-unrelated-
# things mentions of the bare word.
_CYS_FINANCE_RE = re.compile(
    r"\b(security engineer|cybersecurity|application security|appsec"
    r"|penetration test|infosec|threat.{0,30}(model|actor|intelligence|detection)|vulnerability"
    r"|quant(itative)? developer"
    r"|quantitative (research|trading)|trading systems?|fintech|risk engine"
    r"|payments? (engineer|infrastructure)|blockchain|crypto|defi)\b", re.I,
)
_FULLSTACK_RE = re.compile(
    r"\b(full.?stack|frontend|front.end|backend|back.end|\breact\b|next\.?js"
    r"|web (developer|engineer)|product engineer|api (design|development)"
    r"|systems? engineer|infrastructure engineer|platform engineer|devops"
    r"|mobile (developer|engineer)|\bios\b|\bandroid\b)\b", re.I,
)


def classify(title: str, category: str, posting_content: str, company: str = "") -> tuple:
    """Returns (bucket_name, signal) — signal is the specific real phrase
    that drove the classification (empty string for the Other bucket, since
    there's nothing bucket-specific to point at).

    A known quant-trading/quant-finance company (core/company_registry.py)
    routes to CyS & Finance unconditionally, before the three regexes below
    — real confirmed vault bug (2026-09-06): the same company's own generic
    SWE/FPGA intern postings landed in both AI/ML and CyS & Finance purely
    based on which keyword the fetched content happened to trip."""
    if company and is_quant_finance_company(company):
        return "CyS & Finance", "quant/trading firm"
    haystack = f"{title} {category} {posting_content}"
    for bucket, pattern in (("AI/ML", _AI_ML_RE), ("CyS & Finance", _CYS_FINANCE_RE), ("Fullstack", _FULLSTACK_RE)):
        m = pattern.search(haystack)
        if m:
            return bucket, m.group(0)
    return "Other", ""


def classification_callout(bucket: str, signal: str) -> str:
    """No numeric label ('Priority 1/2/3') — the folder location already
    encodes the category; a number in the callout text was explicitly
    rejected in design review."""
    if not signal:
        return f"> [!NOTE] {bucket}: genuine software engineering role, no bucket-specific signal matched."
    return f'> [!NOTE] {bucket}: matched on "{signal}".'
# Layer 2 filter config — see Research Loop Implementation Plan for rationale.
grad_year: 2028
class_year: junior
eligible_class_tags: [Junior, "3rd year"]  # matched as case-insensitive substrings against target_year entries
accept_unrestricted: true  # postings with no class-year field at all still match
# "Winter 2027" = Dec 2026-Feb 2027 in SimplifyJobs' taxonomy — winters are
# labeled by the LATER year, confirmed 2026-07-18 by term adjacency in live data
# (three real listings co-tag ["Fall 2026", "Winter 2027"]). Postings don't
# publish actual months in the feed, so the human screen of the fetched posting
# content is still what confirms a genuine Dec-Jan window per posting.
terms: ["Summer 2027", "Winter 2027", "Spring 2027"]
# Summer/Winter 2027 are equally top priority; Spring 2027 is wanted but
# explicitly lower priority. This is a weight, not a second pass/fail gate —
# Spring 2027 still matches like any other wanted term today. A later, separate
# task consumes this for priority tagging; this one only makes it present and
# readable downstream.
terms_weight: {"Summer 2027": "high", "Winter 2027": "high", "Spring 2027": "low"}
# Real category values observed on SimplifyJobs/Summer2026-Internships (dev/.github/scripts/listings.json),
# not the generic names in the original transcript — confirmed by fetching live data 2026-07-16.
categories: ["Software", "Software Engineering", "AI/ML/Data", "Data Science, AI & Machine Learning"]
# Fellowship/research/mentorship-shaped entries were checked against live data
# 2026-07-26 (SimplifyJobs, JGCL, zshah101 feeds + 5 Greenhouse/5 Ashby seeded
# company boards): real examples exist (e.g. SimplifyJobs "Oracle Database
# Research Intern" category=Software terms includes Winter/Spring 2027; JGCL
# "CBAI Summer Research Fellowship in AI Safety '26" category=Research; JGCL
# "Anthropic Fellows Program" category=Program; zshah101 "Research Intern -
# School of Computer Science - LTI" (CMU) category=Software) — but every one
# already matches under the existing rules: SimplifyJobs/zshah101 tag them
# with a category already in categories/_ZSHAH101_CATEGORIES above, and JGCL's
# matcher never gates on category at all. No fellowship/mentorship-shaped hits
# turned up on the seeded Greenhouse/Ashby boards, and those two sources are
# free-text term matching with no category gate to begin with. No matching
# code needed — nothing here to extend yet.
#
# Pay is never a filter criterion anywhere in this pipeline — confirmed
# 2026-07-26 by grepping core/filter.py for any pay/pay_per_week gate; none
# exists. Don't add one; compensation is out of scope for Layer 2 eligibility.
# Rejects a SimplifyJobs listing outright if any of these terms are present, even
# alongside an allowed term (multi-term/rotational postings spanning both cycles).
exclude_terms: ["Summer 2026", "Fall 2026", "Spring 2026"]
# Rule built 2026-07-17 from live feed data (1216 distinct location strings), not
# guessed — see location_eligible() in core/filter.py. Permissive: no location
# data or ambiguous strings ('Multiple Locations', 'Virtual', bare 'Remote') still
# match; only affirmatively non-US listings (Canada/UK/'Remote in Germany') drop.
locations_allow: us_remote
# Real live values use the apostrophe form ("Bachelor's" 5450, ("Master's","PhD")
# 592, ("PhD",) 586, empty 4676 — fetched 2026-07-18). Permissive: empty degrees
# data passes; non-empty must intersect this list.
degrees_allow: ["Bachelor's"]
# Preference weight for the debate comparator (Prompt 5 Task L), not a filter
# gate — a non-matching company still passes everything above unaffected.
# Seeded from the real, human-vetted target list in the vault's
# `20_Progress/Internship/Building System/Research Loop - Resources.md`
# "Named-Program Coverage Check (2026-07-29)" section: 11 named early-talent
# programs the human already identified as worth prioritizing, of which only
# 3/11 have ANY dossier coverage today and none confirmed as the specific
# named program (Jane Street FTTP, Two Sigma First-Year, D.E. Shaw, Citadel
# Launch, Google ASDI, Microsoft Explore, LinkedIn First Play, MLH
# Fellowship, NASA OSTEM, Capital One, Bloomberg). This is a starting point
# for the human to re-tier or add/remove entries directly, not a final
# answer — company preference is an explicit human judgment call per
# `30_Order/Workflows/Internship Pipeline.md`'s Step 2 ("Screen"), and this
# dict only wires that judgment into write-priority ordering, it doesn't
# automate the judgment itself. All seeded at one tier for now; a
# multi-tier scheme wasn't asked for.
preferred_companies:
  "Jane Street": high
  "Two Sigma": high
  "D.E. Shaw": high
  "Citadel": high
  "Google": high
  "Microsoft": high
  "LinkedIn": high
  "MLH": high
  "NASA": high
  "Capital One": high
  "Bloomberg": high
  ```
- `Bash` — `grep -n -E '^(def |class |[A-Z_]{4,} *=)' run_pipeline.py | head -120`
  ```
52:SOURCES = (
81:MAX_NEW_WRITES_PER_RUN = {"AI/ML": 3, "Fullstack": 3, "CyS & Finance": 3, "Other": 1}
90:BUCKET_CAPACITY = 50
94:GLOBAL_INFO_THRESHOLDS = (150, 170)
95:GLOBAL_ISSUE_THRESHOLDS = (190, 200)
96:CAPACITY_STATE_FILENAME = "capacity_notified.json"
116:QUOTA_PER_RUN = {"AI/ML": 2, "Fullstack": 1, "CyS & Finance": 1, "Other": 2}
129:HARD_PAUSE_TOTAL_THRESHOLD = 300
132:def _prioritize_and_cap(new_listings: list, budget: dict, preferred_companies: dict = None) -> tuple:
188:def _select_exact_quota(new_listings: list, quota: dict, preferred_companies: dict = None) -> tuple:
237:def count_dossiers_by_bucket(vault_root) -> dict:
249:def load_capacity_notified(state_dir) -> dict:
256:def save_capacity_notified(state_dir, notified: dict) -> None:
261:RUN_LOG_MD_SUBPATH = Path("10_Areas/Career/Internships/List/Run Log.md")
277:MAX_DEBATE_LOSSES = 48
278:DEBATE_LOSSES_FILENAME = "debate_losses.json"
279:EXCLUDED_UIDS_FILENAME = "excluded_uids.json"
280:EXCLUDED_LOG_SUBPATH = Path("10_Areas/Career/Internships/List/Excluded — Losing The Debate.md")
285:INTERNDOCK_SEEN_GUIDES_FILENAME = "interndock_seen_guides.json"
298:NEWLY_EXCLUDED_ALERT_THRESHOLD = 20
301:def should_alert_on_exclusion_spike(newly_excluded_count: int) -> bool:
305:def load_debate_losses(state_dir) -> dict:
312:def save_debate_losses(state_dir, losses: dict) -> None:
318:def load_excluded_uids(state_dir) -> set:
325:def save_excluded_uids(state_dir, excluded: set) -> None:
331:def load_interndock_seen_guides(state_dir) -> set:
338:def save_interndock_seen_guides(state_dir, seen: set) -> None:
344:def discover_interndock(http_get, interndock_fetch_fn, state_dir) -> list:
383:def update_debate_losses(losses: dict, deferred: list, written_uids: list) -> tuple:
403:WRITE_GATE_FAILURES_FILENAME = "write_gate_failures.json"
404:WRITE_GATE_EXCLUDED_LOG_SUBPATH = Path("10_Areas/Career/Internships/List/Excluded — Failed The Write Gate.md")
432:WRITE_GATE_FAILURE_CHECKS = {"url_liveness", "cross_source_duplicate"}
440:WRITE_GATE_FAILURE_THRESHOLD = 3
443:def load_write_gate_failures(state_dir) -> dict:
450:ZERO_MATCH_STREAKS_FILENAME = "zero_match_streaks.json"
469:ZERO_MATCH_STREAK_ALERT_THRESHOLD = 24
472:def load_zero_match_streaks(state_dir) -> dict:
479:def save_write_gate_failures(state_dir, failures: dict) -> None:
485:def update_write_gate_failures(failures: dict, rejections: list, written_uids: list, now_iso: str) -> tuple:
518:def save_zero_match_streaks(state_dir, streaks: dict) -> None:
524:def update_zero_match_streaks(streaks: dict, fetch_counts: dict, filter_match_counts: dict) -> tuple:
561:SYSTEMIC_REJECTION_CHECKS = {"required_fields", "format_compliance"}
564:def load_seen_ids(state_path) -> set:
571:def save_seen_ids(state_path, seen_ids: set) -> None:
577:def build_matched_reason(listing, profile: dict) -> str:
602:def fetch_and_filter(profile: dict, http_get=None, excluded_ids: frozenset = frozenset()) -> dict:
622:def dedup_new(matched_by_source: dict, seen_ids: set, excluded_ids: frozenset = frozenset()):
643:def validate_and_write(new_listings, profile: dict, jarvis_dir, seen_ids: set, date_found: str,
731:def file_github_issue(repo: str, title: str, body: str, run_gh=None) -> None:
736:def disable_workflow(repo: str, workflow: str = "run", run_gh=None) -> None:
745:def run_once(
  ```
- `Bash` — `sed -n 577,602p run_pipeline.py; echo ======; grep -n -i "microsoft" ingestion/posting_page.py | head; echo =====; grep -n "parametrize" tests/test_schema_drift.py | head -3; git show --stat 5b59609 | head -60`
  ```
def build_matched_reason(listing, profile: dict) -> str:
    if listing.source == "SimplifyJobs":
        term = ", ".join(sorted(set(listing.terms) & set(profile["terms"])))
        return f"{term}, {listing.category}" if listing.category else term
    if listing.source == "Jose-Gael-Cruz-Lopez":
        return "Junior-eligible" if listing.target_year else "unrestricted (no class-year field)"
    if listing.source == "vanshb03":
        term = ", ".join(listing.terms)
        return f"{term}, {listing.sponsorship}" if listing.sponsorship else term
    if listing.source in ("zshah101", "ApplyGuy"):
        # Unlike zshah101 (terms always non-empty on a match), ApplyGuy's own
        # literal "Not specified" season maps to empty terms at normalize
        # time and _matches_applyguy passes it permissively (real on ~39% of
        # live entries, e.g. the live Point72 "Quantitative Developer Intern"
        # dossier, source=ApplyGuy, terms=[] — confirmed 2026-09-06) — so
        # category alone, with no leading ", ", must still be a valid reason.
        term = ", ".join(listing.terms)
        if term and listing.category:
            return f"{term}, {listing.category}"
        return term or listing.category or "matched"
    if listing.source in ("Greenhouse", "Ashby", "Lever", "Freehire", "AIJobs", "InternDock"):
        return matched_term_in_free_text(listing, profile) or "matched"
    return "matched"


def fetch_and_filter(profile: dict, http_get=None, excluded_ids: frozenset = frozenset()) -> dict:
======
196:# Microsoft's careers site (apply.careers.microsoft.com, source=vanshb03) is
199:# Engineer Intern, CoreAI - Microsoft.md and .../AIML & LLM - Microsoft.md) —
200:# a GitHub issue #9 sample of 6 flagged Microsoft dossiers, all sourced via
=====
138:# file with zero source-specific logic, so it's the one parametrized here.
144:@pytest.mark.parametrize("raw_fixture, check_fn", [
282:@pytest.mark.parametrize("key", ["active", "degrees"])
commit [REDACTED]
Author: Anant Gupta <anantmahi721@gmail.com>
Date:   Sun Sep 6 20:42:41 2026 -0500

    Add company registry, agent configs, and pipeline improvements

 .claude/agents/applying.md                    |  61 ++++++++
 .claude/agents/contact-researcher.md          |   6 +
 .claude/agents/program-writer.md              |  53 +++++++
 .claude/agents/promotion.md                   |  47 +++++++
 .claude/agents/testing-tools.md               |  48 +++++++
 .claude/agents/tracking.md                    |  44 ++++++
 .claude/context/MEMORY.md                     |   0
 .claude/context/jarvis.md                     |   0
 .claude/hooks/review-reminder.sh              |  53 +++++++
 .claude/hooks/vault-write-guard.sh            |  29 ++++
 .claude/rules/autonomous.md                   |  19 +++
 .claude/rules/hooks.md                        |  30 ++++
 .claude/rules/internship-loop.md              |   5 +
 .claude/rules/jarvis.md                       |  22 +++
 .claude/rules/mcp-permissions.md              |  26 ++++
 .claude/settings.json                         |  57 +++++++-
 .claude/skills/promoting-manual-find/SKILL.md |  31 +++++
 .claude/skills/tailoring-application/SKILL.md |  29 ++++
 CLAUDE.md                                     |  41 ++++--
 core/classify.py                              |  14 +-
 core/company_registry.py                      |  47 +++++++
 core/debate.py                                |  11 +-
 core/filter.py                                |  24 +++-
 core/relevance.py                             |  11 +-
 docs/PIPELINE_CONTRACT.md                     |  58 ++++++++
 ingestion/posting_page.py                     |  23 ++-
 requirements.txt                              |   1 +
 run_pipeline.py                               |  24 +++-
 tests/fixtures/posting_microsoft_careers.md   |  98 +++++++++++++
 tests/test_classify.py                        |  67 +++++++++
 tests/test_company_registry.py                |  42 ++++++
 tests/test_filter.py                          |  27 +++-
 tests/test_posting_page.py                    |  30 ++++
 tests/test_run_pipeline.py                    |  84 ++++++++++-
 tests/test_schema_drift.py                    | 192 +++++++++-----------------
 35 files changed, 1194 insertions(+), 160 deletions(-)
  ```
- `Bash` — `sed -n 100,131p run_pipeline.py; sed -n 745,900p run_pipeline.py`
  ```
# ceiling above ("write up to N, take what's available"), this is an exact
# per-run target: either every bucket fills exactly, or nothing writes this
# run at all (see _select_exact_quota). Real counts checked directly via
# mcp__jarvis__vault_list against gupta-builds/Jarvis on 2026-09-07: 285
# live dossiers (AI/ML 134, Fullstack 42, CyS & Finance 49, Other 60),
# excluding Viewed/ — discovery has been outrunning promotion, and this
# quota is meant to create real, predictable batch-size pacing pressure the
# old ceiling never did (a ceiling only caps a spike; it doesn't guarantee
# a batch actually lands). Deliberately NOT layered inside
# MAX_NEW_WRITES_PER_RUN as an inner bound: the old Other ceiling (1) is
# smaller than this quota's Other target (2), so combining them would make
# Other structurally unfillable forever and, under all-or-nothing, would
# make every run write nothing. MAX_NEW_WRITES_PER_RUN/_prioritize_and_cap
# are kept (not deleted) as a still-real, still-tested, currently-unreached
# selection mechanism — same precedent as debate.py's own bucket_urgency
# stage-2 "not dead code" note.
QUOTA_PER_RUN = {"AI/ML": 2, "Fullstack": 1, "CyS & Finance": 1, "Other": 2}

# Hard-pause threshold (2026-09-07 decision, this session, on direct human
# instruction) — a deliberate, one-time reversal of this codebase's own
# founding "notification, never a write refusal" asymmetry, scoped
# specifically to total dossier volume (see the dated note added to
# Source of Truth.md the same day for the full reasoning). At/over this
# total (excluding Viewed/, computed BEFORE this run does anything), the
# loop disables run.yml itself via `gh workflow disable run` and writes
# nothing this run, regardless of quota-fillability. 300 was chosen
# deliberately close to the real 285-dossier total confirmed live on
# 2026-09-07, so the loop pauses again soon after landing at most a few
# more all-or-nothing batches.
HARD_PAUSE_TOTAL_THRESHOLD = 300


def run_once(
    *,
    jarvis_dir,
    state_path,
    runs_log_path,
    now: datetime,
    profile: dict = None,
    http_get=None,
    http_head=None,
    push_fn=commit_and_push_with_retry,
    issue_fn=file_github_issue,
    issue_repo: str = "gupta-builds/internship-research-loop",
    fetch_page_fn=None,
    opt_cache_path=None,
    state_dir=None,
    interndock_fetch_fn=None,
    quota: dict = None,
    budget: dict = None,
    disable_workflow_fn=disable_workflow,
) -> dict:
    profile = profile or load_profile()
    quota = quota if quota is not None else QUOTA_PER_RUN
    timestamp = now.isoformat()
    record = {
        "timestamp": timestamp,
        "fetch_counts": {},
        "filter_match_counts": {},
        "new_count": 0,
        "already_seen_count": 0,
        "deferred_count": 0,
        "written_count": 0,
        "rejections": [],
        "errors": [],
        "halted": False,
        "halt_reason": None,
        "paused": False,
        "pause_reason": None,
        "bucket_at_capacity": [],
        "dossier_total": 0,
        "quota_shortfall": {},
        "newly_excluded_count": 0,
        "write_gate_excluded_count": 0,
        "zero_match_alerts": [],
    }

    # Hard-pause check (2026-09-07 decision) — before ANYTHING else, so a
    # paused run spends zero fetch/Firecrawl budget and never lets a
    # partial write land the same run the threshold is crossed. Local glob
    # only (count_dossiers_by_bucket), no network cost either way.
    dossier_total_before = sum(count_dossiers_by_bucket(jarvis_dir).values())
    if dossier_total_before >= HARD_PAUSE_TOTAL_THRESHOLD:
        record["paused"] = True
        record["dossier_total"] = dossier_total_before
        record["pause_reason"] = (
            f"dossier_total {dossier_total_before} at/over the "
            f"{HARD_PAUSE_TOTAL_THRESHOLD}-dossier hard-pause threshold"
        )
        append_run_log(runs_log_path, record)
        disable_workflow_fn(issue_repo)
        issue_fn(
            issue_repo,
            f"Hard-paused: run.yml disabled at {timestamp} ({dossier_total_before} dossiers)",
            f"List/Dossiers/ (excluding Viewed/) reached {dossier_total_before}, at/over the "
            f"{HARD_PAUSE_TOTAL_THRESHOLD}-dossier hard-pause threshold. `run.yml` has been disabled "
            "via `gh workflow disable run` — nothing was fetched or written this run. This is a "
            "deliberate, one-time reversal of this repo's usual notification-never-refusal principle "
            "for total dossier volume specifically (see the dated 2026-09-07 note in Source of "
            "Truth.md). Re-enable with `gh workflow enable run` once the promotion backlog is worked "
            "down.",
        )
        return record

    excluded_ids = load_excluded_uids(state_dir) if state_dir is not None else set()

    try:
        check_schema_drift(http_get)
        seen_ids = load_seen_ids(state_path)
        matched_by_source = fetch_and_filter(profile, http_get, excluded_ids=excluded_ids)
        # Not one of the uniform SOURCES fetchers — needs Firecrawl plus its
        # own persisted state, not just http_get (see discover_interndock's
        # docstring). Added last so it naturally has lowest cross-source-
        # duplicate write-priority: InternDock's value is companies the
        # direct per-company sources don't already reach, not going first.
        interndock_listings = discover_interndock(http_get, interndock_fetch_fn, state_dir)
        interndock_matched = [
            l for l in interndock_listings
            if matches(l, profile) and not stage1_reject(l.title, l.raw_text)
            and compute_uid(l) not in excluded_ids
        ]
        matched_by_source["InternDock"] = {"fetch_count": len(interndock_listings), "matched": interndock_matched}
    except (SchemaDriftError, requests.RequestException) as exc:
        # RequestException too — a deleted repo, DNS failure, or 5xx used to
        # crash the process before any run-log record or issue existed (the
        # PRD's "source repo goes offline" risk, previously unmitigated).
        record["halted"] = True
        record["halt_reason"] = f"{type(exc).__name__}: {exc}"
        append_run_log(runs_log_path, record)
        issue_fn(
            issue_repo,
            f"Run halted ({type(exc).__name__}) at {timestamp}",
            f"Schema drift or source fetch failure — nothing was fetched, filtered, "
            f"or written this run.\n\n```\n{type(exc).__name__}: {exc}\n```",
        )
        return record

    for name, info in matched_by_source.items():
        record["fetch_counts"][name] = info["fetch_count"]
        record["filter_match_counts"][name] = len(info["matched"])

    if state_dir is not None:
        zero_match_streaks = load_zero_match_streaks(state_dir)
        zero_match_streaks, newly_zero_match_alerting = update_zero_match_streaks(
            zero_match_streaks, record["fetch_counts"], record["filter_match_counts"],
        )
        save_zero_match_streaks(state_dir, zero_match_streaks)
        record["zero_match_alerts"] = newly_zero_match_alerting
        for name in newly_zero_match_alerting:
            issue_fn(
                issue_repo,
                f"{name}: filter_match_count stuck at 0 for {ZERO_MATCH_STREAK_ALERT_THRESHOLD} consecutive runs ({timestamp})",
                f"{name} has kept returning real fetched postings (fetch_count > 0) but none have "
                f"survived the filter for {ZERO_MATCH_STREAK_ALERT_THRESHOLD} consecutive runs, despite "
                "having produced real matches before. This can be a genuine, if coincidental, run of "
                "correctly-filtered postings (see the 2026-08-28 Ashby investigation: Canada-based "
                "postings plus debate-comparator exclusion, not schema drift) — but it's also exactly "
                f"the shape a silent upstream schema change or a broken filter rule would produce. "
                f"Check core/schema_drift.py's coverage for {name} and the real current API response "
                "before assuming it's benign.",
            )

    new_listings, already_seen_count = dedup_new(matched_by_source, seen_ids, excluded_ids=excluded_ids)
    record["new_count"] = len(new_listings)
    record["already_seen_count"] = already_seen_count

    # budget (2026-09-07, added for reseed.py): an explicit escape hatch back
    # to the old "up to N, take what's available" ceiling via
    # _prioritize_and_cap — reseed's whole point is draining a wiped vault
    # with whatever's available, the opposite of exact-quota's "N or
    # nothing." Mutually exclusive with quota; the real hourly run (neither
    # passed) gets the new exact-quota behavior.
    if budget is not None:
        this_run, deferred = _prioritize_and_cap(
            new_listings, budget, preferred_companies=profile.get("preferred_companies")
        )
        quota_shortfall = {}
    else:
        this_run, deferred, quota_shortfall = _select_exact_quota(
            new_listings, quota, preferred_companies=profile.get("preferred_companies")
        )
    record["deferred_count"] = len(deferred)
    record["quota_shortfall"] = quota_shortfall

    opt_cache = {}
    if opt_cache_path and Path(opt_cache_path).exists():
        opt_cache = json.loads(Path(opt_cache_path).read_text())
    written_uids, rejections = validate_and_write(
  ```
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/List/Dossiers"}`
- `Bash` — `echo placeholder`
  ```
placeholder
  ```
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/List/Dossiers/1 - AI & ML"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/List/Dossiers/_Career Fair"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Career Fair"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Resumes"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Cover Letters"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Applying"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Resumes/Resume - How to Get the Job.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Resumes/Resume - How to Research.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Resumes/Resume - How to Edit.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Resumes/Resume - How to Style.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Resumes/Resume - How to Be Human.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Resumes/Main Resume.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Career Fair '25 & '26.md"}`
- `mcp__jarvis__vault_list` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Applying/Now.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-07 investigation-build-plans.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-08 Pipeline staging and commits.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-22 Career fair internship discovery and dossier pass.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-22 Career fair day 1 internship research.md"}`
- `Bash`:
  ```bash
cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/tool-results/ && python3 - <<'E'
import json,re
for f in ["mcp-jarvis-vault_read-1790647435333.txt","mcp-jarvis-vault_read-1790647436299.txt","mcp-jarvis-vault_read-1790647436816.txt"]:
    raw=open(f).read()
    try:
        c=json.loads(raw)['content']
    except Exception as e:
        c=raw
    print("=====",f,len(c))
    print(c[:1400].split("tags:")[0][-600:])
    parts=re.split(r'\n## (You|Claude)\n',c)
    # parts: [pre, role, text, role, text...]
    users=[(parts[i+1]) for i in range(1,len(parts)-1,2) if parts[i]=='You']
    claudes=[(parts[i+1]) for i in range(1,len(parts)-1,2) if parts[i]=='Claude']
    print("users",len(users),"claude",len(claudes))
    for u in users[:6]:
        print("--USER--",u[:2500].replace("\n\n","\n"))
E
  ```
  ```
===== [REDACTED].txt 207295
ome/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/[REDACTED].txt"
  - "/home/anant_gupta/projects/work/internship-research-loop/core/debate.py"
  - "/home/anant_gupta/projects/work/internship-research-loop/core/company_registry.py"
  - "/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py"
  - "/home/anant_gupta/.claude/plans/dynamic-waddling-tower.md"
  - "/home/anant_gupta/projects/work/internship-research-loop/reseed.py"
  - "/home/anant_gupta/projects/wo
users 4 claude 2
--USER-- 
<local-command-caveat>Caveat: The messages below were generated by the user while running local commands. DO NOT respond to these messages or otherwise consider them in your response unless the user explicitly asks you to.</local-command-caveat>

--USER-- 
<command-name>/clear</command-name>
            <command-message>clear</command-message>
            <command-args></command-args>

--USER-- 
**Ground truth, re-verify before trusting:**
- `run.yml` is still `disabled_manually` — re-enabling it is a standing human decision, explicitly not part of this prompt.
- Track A (Prompts 1-3: company registry, Microsoft extraction fix, `matched_reason` completion, schema-drift correction, company cache) is done — see the Archive for what's already fixed, don't re-propose it.
- `run_pipeline.py`'s `MAX_NEW_WRITES_PER_RUN = {"AI/ML": 3, "Fullstack": 3, "CyS & Finance": 3, "Other": 1}` (~10/run) is the current steady-state hourly budget for `run.yml` specifically — Build 2 must not change this for `run.yml` itself.
- `core/debate.py`'s `bucket_urgency` cross-bucket comparison stage is implemented and tested but, per its own docstring, "never actually fires through the current call path" — `_prioritize_and_cap` partitions candidates by bucket before any comparison happens.
- `core/company_registry.py`'s `TIER_RANK` currently has exactly one grade (`{"high": 0}`) — Prompt 1 explicitly chose not to re-tier `preferred_companies`, by design, not by oversight.
- No `ai-job-search` repo could be found on this machine this session. If you can reach it directly in your own environment, use it; otherwise the Pipeline Blueprint artifact (`claude.ai/code/artifact/[REDACTED]`) is the only available source for what it contains — say so explicitly if you can't fetch that either, don't fabricate details about either.
**Build 1 — Hourly discovery refinement (investigate, then plan)**
Read the Improvement Plan's `# Plan` §3 ("Path To 5/Hour, In Priority Order"), the write-starvation postmortem's Recommendations, and check the vault for `Excluded — Losing The Debate.md`/`Excluded — Failed The Write Gate.md` (confirm whether either exists and what it actually contains — don't assume). Then answer, with real evidence per point, not invention: (a) is activating `bucket_urgency`'s cross-bucket comparison actually worth the real architecture change it requires; (b) is `TIER_RANK`'s single-grade limitation worth a second grade now that the registry exists to hold it, and what real evidence (if any) supports which companies would move; (c) anything else genuinely found in that reading, not manufactured to fill space. Propose a plan. Do not implement.
**Build 2 — Manual cold-start reseed GitHub Action (investigate, then plan)**
A new, separate, `workflow_dispatch`-only workflow (never scheduled) for the specific scenario: the vault's dossier pile is empty or being deliberately rela
--USER-- 
**Ground truth, re-verified directly 2026-09-07:**
- `reseed.py` passes `opt_cache_path=scratch_dir / "opt_cache.json"` — confirmed by direct read, this always starts empty and is discarded with the rest of `scratch_dir` at the end. `run_pipeline.py`'s `run_once()` (lines ~760-768) only reads/writes whatever path `opt_cache_path` points to — no code change needed there, only in how `reseed.py` calls it.
- `tests/test_reseed.py` currently contains exactly 3 tests, all of `_union_json_list` — confirmed by direct read. `reseed.py`'s `main()` has no test coverage at all.
- `vault_writer/writer.py`'s `scan_dossiers(vault_root)` (line 157) already returns every dossier's frontmatter dict (including `preference_tier`, `date_posted`, and a `_path` key) across every bucket folder and `Viewed/` — reuse this, don't write a second dossier-scanning function.
- `vault_writer/validate.py`'s `REQUIRED_FRONTMATTER_FIELDS` confirms every dossier already carries `preference_tier` — check how it's actually populated at write time (`run_pipeline.py`/`vault_writer/writer.py`) before assuming its exact value shape.
**Non-negotiable rules:** Full `pytest` green (before/after count). Don't touch `.claude/` (it's under active migration by other work — `git status` will show unrelated `.claude/` changes; leave them alone, same discipline Prompt 4's execution already correctly followed). Don't touch `run_pipeline.py`'s or `run.yml`'s default behavior/budget. This new report tool is read-only against the vault — it must not write, move, or delete a single dossier.
---
#### Task A — Fix `opt_cache.json` handling in `reseed.py`
Mirror the exact pattern already used for `excluded_uids.json`: seed `scratch_dir/opt_cache.json` from the real `state/opt_cache.json` before calling `run_once()` (if the real file exists), and after the run, merge scratch's `opt_cache.json` back into the real one — but note this is a **dict** keyed by uid (`{uid: {verdict, signal, checked}}`), not a JSON list like `seen_ids`/`excluded_uids`, so `_union_json_list` doesn't directly apply. Write a small dict-merge variant (scratch entries win on key collision, since they're the freshest verdict) rather than forcing the list-union function to handle both shapes.
**Test:** a new test proving a pre-existing real `opt_cache.json` entry is available inside the scratch run (i.e., `run_once()` sees it and doesn't re-fetch), and a merge test proving a new verdict learned during the reseed lands in the real file afterwa
===== [REDACTED].txt 358994
t_usd: 33.726804
model:
  - claude-sonnet-5
files_touched:
  - "/home/anant_gupta/.claude/plans/[REDACTED].md"
  - "/home/anant_gupta/projects/work/internship-research-loop/.claude/agents/promotion.md"
  - "/home/anant_gupta/projects/work/internship-research-loop/.claude/agents/program-writer.md"
  - "/home/anant_gupta/projects/work/internship-research-loop/.claude/agents/tracking.md"
  - "/home/anant_gupta/projects/work/internship-research-loop/.claude/agents/contact-researcher.md"
  - "/home/anant_gupta/projects/work/internship-research-loop/.claude/skills
users 45 claude 40
--USER-- 

<pasted_content id="27f8">
# Career Fair Day 1 — Deep-Dive Discovery + Dossier Pass (autonomous, single-report-back)
## How to run this session
You are running fully autonomously in the `internship-research-loop` repo. Do not stop
to ask clarifying questions and do not send interim "here's my plan" or "here's my
progress" messages back to the user — Claude Sonnet 5 gives good natural interim
narration by default; suppress that instinct here specifically. Work the entire task
below to completion in this one turn, using as many tool calls as it takes, and only
produce output when you are fully done, in the exact "Final report" format specified
at the bottom. If you hit a genuine blocker (a tool is unreachable, a vault isn't
connected), stop and report that specific blocker — don't guess around it or fabricate
vault content.
This is a long, multi-step research-and-judgment task spanning 25 companies across
wildly different engineering disciplines. Think carefully through each company's
eligibility before deciding to write a dossier or log a pass — do not pattern-match
quickly across companies just because several in a row turned out the same way.
Apply every instruction below to **every one of the 25 companies listed** in the
reference table near the bottom of this prompt — not just the first few, not just the
ones that look obviously relevant. A company whose majors list reads "civil,
mechanical, biomedical" with nothing software-shaped still needs its own explicit,
individually-checked decision line in the final output, not a decision inherited from
a similar-looking company above it.
## Background — read this before doing anything
This repo automates internship discovery: it polls a fixed set of public feeds
(SimplifyJobs, Greenhouse, Ashby, Lever, etc. — see `run_pipeline.py`'s `SOURCES`
tuple), filters against `core/profile.yaml`, and writes dossier notes into the Jarvis
Obsidian vault under `10_Areas/Career/Internships/List/Dossiers/`. Full conventions are
in this repo's own `CLAUDE.md` — read it now if you haven't.
Two things from `CLAUDE.md` matter here and are easy to misapply:
1. **The zero-LLM rule does NOT apply to this task.** It governs `core/`, `ingestion/`,
   `vault_writer/`, `run_pipeline.py`, `recheck.py` — the *unattended* automated path.
   This session is a manual, human-requested, one-off research pass, the same category
   as `enrich.py`'s explicitly-documented manual-CLI exception. Using your own judgment,
   web search, an
--USER-- 
<task-notification>
<task-id>a858317216e0d284f</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tasks/a858317216e0d284f.output</output-file>
<status>completed</status>
<summary>Agent "Explore promote-dossier reference and skills" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>I have everything needed. Report below.
## 1. Frontmatter field lists — note-templates.md vs CLAUDE.md
**Program note** (`10_Areas/Career/Internships/Programs/{Serious|Considering}/`):
`name, company, program_type, eligible_classes, grad_year, role_type, wave, opens_date, deadline_posted, deadline_real, pay_per_week, pay_currency, duration_weeks, benefits, application_url, careers_page, list_origin, applying_note, recruiter_contact, tags` — matches CLAUDE.md line 19 exactly.
**Contact note** (`Contacts/Each One/`):
`type: contact, name, role, company, linkedin_url, email, how_found, relationship, related_programs, last_contact_date, tags, next` — matches CLAUDE.md line 22 exactly.
**Tracker/Each One note** (`Tracker/Each One/`):
`type: tracker, program, contact, company, url, date_noted, date_researched, date_created, date_applied, date_result, result, deadline, related_notes, tags, next` — matches CLAUDE.md line 25 exactly.
No discrepancies found; CLAUDE.md's summary is a verbatim field-order match to note-templates.md for all three note types.
## 2. `.claude/skills/promote-dossier/scripts/` (untracked)
- `check_vault_reachability.py` — mechanically checks which of the two vault-access paths (sibling git checkout of `Jarvis`, or `jarvis`/`jarvis-fs` MCP config registration) is possible on this machine. Cannot confirm a live MCP connection itself; that still needs a manual `vault_list` call. Supports the SKILL.md "Prerequisite" step directly.
- `validate_note_trio.py` — post-write consistency checker; takes three file paths (program.md, contact.md, tracker.md), confirms every required frontmatter field from note-templates.md is present (even as null) and that cross-links point at each other correctly. Only works against real files on disk (sibling-checkout path), not MCP. Directly used in SKILL.md step 4.4 (validation before reporting complete).
Both are relevant to rendering/validating a dossi
--USER-- 
<task-notification>
<task-id>a7a1bc33cae89662b</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tasks/a7a1bc33cae89662b.output</output-file>
<status>completed</status>
<summary>Agent "Explore vault_writer dossier rendering" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>I have everything needed. Full report below.
## 1. `vault_writer/writer.py`
**`render_dossier`** — this is the function to call:
```python
def render_dossier(listing, uid: str, date_found: str, matched_reason: str, posting_content: str = "",
                   classification_callout: str = "", preferred_companies: dict = None) -&gt; str:
```
- `listing`: a `Listing` object (see below)
- `uid`: string
- `date_found`: string (used raw in frontmatter, not parsed as a date — pass an ISO date string)
- `matched_reason`: string, goes straight into frontmatter
- `posting_content`: optional string, fetched posting body; if empty the template renders "No posting content fetched."
- `classification_callout`: optional string, typically the output of `core.classify.classification_callout(bucket, signal)`
- `preferred_companies`: dict, normally `core.profile.yaml`'s `preferred_companies` (used only to compute `preference_tier`)
**`build_frontmatter(listing, uid, date_found, matched_reason, preferred_companies=None) -&gt; dict`** — called internally by `render_dossier`. Note: `uid` and `listing.category` are deliberately NOT rendered into the note.
**`dossier_filename(role: str, company: str, existing_names) -&gt; str`** — produces `"{role} - {company}.md"`, Windows-unsafe chars stripped, collision-suffixed with ` (2)`, ` (3)`, etc. `existing_names` should be scoped to the target bucket subfolder.
**`DOSSIER_SUBPATH = Path("10_Areas/Career/Internships/List/Dossiers")`**
**Bucket folders live in `core/classify.py`, not `writer.py`:**
```python
BUCKET_FOLDERS = {
    "AI/ML": "1 - AI &amp; ML",
    "Fullstack": "2 - Fullstack",
    "CyS &amp; Finance": "3 - CyS &amp; Finance",
    "Other": "Other",
}
```
`classify(title, category, posting_content, company="") -&gt; (bucket_name, signal)` and `classification_callout(bucket, signal) -&gt; str` are also in `core/classify.py` — used to produce `render_dossier`'s `classifi
--USER-- 
<task-notification>
<task-id>a9c55224de3101c89</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tasks/a9c55224de3101c89.output</output-file>
<status>completed</status>
<summary>Agent "Explore hard-pause and workflow logic" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>Have everything needed. Report below.
## Hard-pause mechanism (`run_pipeline.py`)
**Threshold:** `HARD_PAUSE_TOTAL_THRESHOLD = 300` (line 129), chosen deliberately just above the confirmed live count of 285 dossiers on 2026-09-07.
**Counter — `count_dossiers_by_bucket(vault_root)`** (line 237):
```python
def count_dossiers_by_bucket(vault_root) -&gt; dict:
    vault_root = Path(vault_root)
    counts = {}
    for bucket, folder in BUCKET_FOLDERS.items():
        d = vault_root / DOSSIER_SUBPATH / folder
        counts[bucket] = len(list(d.glob("*.md"))) if d.is_dir() else 0
    return counts
```
It counts `.md` files directly on the **local filesystem checkout** at `vault_root` (a `Path.glob`, no network/API call), across `BUCKET_FOLDERS`' bucket subfolders under `DOSSIER_SUBPATH`, deliberately excluding `Viewed/`. `vault_root` is passed in as `jarvis_dir=os.environ["JARVIS_DIR"]` (line 1056) — in the GitHub Actions workflow this env var points at `jarvis-checkout/`, a fresh `actions/checkout` of `gupta-builds/Jarvis` done just for that run (`.github/workflows/run.yml` lines 19-26).
**Trigger block** (`run_once`, lines 790-815), run before any fetch/write:
```python
dossier_total_before = sum(count_dossiers_by_bucket(jarvis_dir).values())
if dossier_total_before &gt;= HARD_PAUSE_TOTAL_THRESHOLD:
    record["paused"] = True
    ...
    append_run_log(runs_log_path, record)
    disable_workflow_fn(issue_repo)
    issue_fn(issue_repo, f"Hard-paused: run.yml disabled at {timestamp} ({dossier_total_before} dossiers)", ...)
    return record
```
`disable_workflow_fn` shells out to `gh workflow disable run` (per the docstring/comments at lines 118-129 and 803); it also writes a run-log entry and files a GitHub issue via `issue_fn`, then returns immediately — zero fetch/write cost. This was a one-time deliberate reversal of the repo's normal "notify, never refuse" policy, per the commit message.
## `.github/work
--USER-- 
<task-notification>
<task-id>ad40aa8383e6991d0</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tasks/ad40aa8383e6991d0.output</output-file>
<status>completed</status>
<summary>Agent "Career fair research batch 5 (companies 21-25)" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>21-25 done — 1 dossier written (Toro), 4 no-qualify.
**Report — companies 21-25:**
1. **Stanley Consultants, Inc.** — qualifies: NO. Civil/transportation/electrical-substation/water-wastewater internships only; no SWE/CS/data internship found despite IT-staff FTE roles existing separately (Information Services Technician, not an internship).
2. **Starkey Hearing Technologies** — qualifies: NO. Confirmed no software/CS/EE internship posting exists — only senior FTE Software Engineer roles (Sr Software Engineer I) turn up; their careers/job-board pages show no internship listings for software.
3. **The Toro Company** — qualifies: YES. Dossier written to `10_Areas/Career/Internships/List/Dossiers/_Career Fair/Embedded Software Engineering Intern - The Toro Company.md`. Role: **Embedded Software Engineering Intern**, Bloomington MN, Summer 2027 (May 17–Aug 6 2027), $22–28/hr. URL: https://freehire.me/jobs/embedded-software-engineering-intern-the-toro-company-the-toro-company-jwsnufgn — matched_reason: Summer 2027 embedded software internship, CS/EE-adjacent, US location, Bachelor's-eligible.
4. **VAA, LLC** — qualifies: NO. Only posting found is a Systems Design Engineering Intern (mechanical/civil facilities design), Summer 2027 — no software/CS component.
5. **VivaQuant, Inc. Rhythm Express** — qualifies: NO. No careers/internships page or job listing found anywhere (site redirects to rhythmexpressecg.com, which returned 403; searches turned up only an old anecdotal blog post about a past internship, no current listing).</result>
<usage><subagent_tokens>198168</subagent_tokens><tool_uses>28</tool_uses><duration_ms>140447</duration_ms></usage>
</task-notification>

--USER-- 
<task-notification>
<task-id>a8c29ac902e951d55</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tasks/a8c29ac902e951d55.output</output-file>
<status>completed</status>
<summary>Agent "Career fair research batch 2 (companies 6-10)" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>All 5 companies in this batch (Braun Intertec, Cambrex, City of Minneapolis - Public Works, Harland Medical Systems, HDR, Inc.) researched; no qualifying dossiers written.
**6. Braun Intertec** — No. Internships/Co-Ops page and Workday portal list only civil/geotechnical/materials-testing field roles. No IT/software internship found anywhere (careers site, Indeed, Glassdoor, Workday search).
**7. Cambrex** — No. Careers portal's internship pipeline is the "Scientific Manufacturing Apprenticeship and Intern Program" (chemistry/manufacturing). Cambrex does have full-time IT-support job reqs, but no CS/software *internship* found on any board.
**8. City of Minneapolis - Public Works** — No. Real, CS-adjacent roles exist (Surface Water &amp; Sewer GIS Business Intern — Python GIS scripting, ArcGIS) but every live posting found is for **Summer 2026**; no Summer/Winter/Spring 2027 posting is currently open (the city typically posts these in early spring for the following summer). Reason: no current 2027 posting found — revisit closer to spring 2027.
**9. Harland Medical Systems** — No. No internships listed at all on their careers page, LinkedIn, Indeed, or Glassdoor — only full-time roles (Account Manager, Principal Automation Engineer, Senior Process Technician, Operator, Electromechanical Technician). Nothing SWE/EE-software, intern or otherwise.
**10. HDR, Inc.** — No. HDR does run a real Data Scientist Intern program (confirmed past cycles: Summer 2025, Summer 2026 postings on their Taleo portal), but no live Summer/Winter/Spring 2027 Data Scientist or Software posting was found. The one currently-live 2027-cycle tech-adjacent posting found (Information Communication Technology (ICT)/Security Intern, Kansas City MO, updated 2026-09-15, hdr.taleo.net job=194765) designs building CCTV/card-access/electronic-security systems via BIM tools — building-systems/low-voltage design work, not software engin
===== [REDACTED].txt 99212
ac0d73
status: raw
turn_count: 7
tools_used:
  Bash: 21
  mcp__jarvis__search_simple: 3
  mcp__jarvis__vault_list: 6
  mcp__jarvis__vault_read: 4
  mcp__the-plan__vault_list: 1
  mcp__the-plan__vault_read: 4
  Read: 2
  ToolSearch: 2
  WebFetch: 1
tokens:
  input: 142
  output: 166998
  cache_creation: 1774117
  cache_read: 8974635
  total: 10915892
cost_usd: 10.561659
model:
  - claude-sonnet-5
files_touched:
  - "/home/anant_gupta/projects/work/internship-research-loop/vault_writer/templates/dossier.md.j2"
  - "/home/anant_gupta/projects/work/internship-research-loop/vault_writer/writer.py"

users 5 claude 2
--USER-- 
<local-command-caveat>Caveat: The messages below were generated by the user while running local commands. DO NOT respond to these messages or otherwise consider them in your response unless the user explicitly asks you to.</local-command-caveat>

--USER-- 
<command-name>/login</command-name>
            <command-message>login</command-message>
            <command-args></command-args>

--USER-- 
<local-command-stdout>Login successful</local-command-stdout>

--USER-- 
You are going to work on something very crucial for a long period of time right now. We are going to the career fair for day - 1. Go through the notes inside the vault: the-plan using the-plan mcp tool. Go through these notes: `20_Progress/Career/Career Fair/Day - 1`, `20_Progress/Career/Career Fair/OPT Companies`. Also these notes inside jarvis: `20_Progress/Internship/Career Fair/Transcript - OPT`, `20_Progress/Internship/Career Fair/Transcript - Sponsoring`. After gathering enough detail on what companies are exactly coming to the fair and sponsoring opt. I want you to run a very detailed deep dive research through github actions and the discovery step that has been built out. I do mean for you to resume it, do a manual run by yourself for all the companies coming to the career fair listed down. Each and every single internship that is going to interesting to us should be registered and noted down inside the dossier folder: `10_Areas/Career/Internships/List/Dossiers/_Career Fair`. All the internships that qualify the profile should listed down as dossiers. After the entire process is done write down this one note inside the-plan: `20_Progress/Career/Career Fair/Internships`. This is going to be a simple one line of the company name that has been listed down on the other notes with the intership link written next to it. For example: "1. Adobe - [Internship](https://www.jajhshhsdhhas.com)". For this task to be executed in a bran new session, provide me with a detailed prompt based on this prompting guide: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/[REDACTED]`. Write the prompt for this codebase directory running sonnet 5 to do any means to get the process executed and only report back when the job has been completed. All the companies official postings have been found and detailed. Written down as a dossier and linked inside the plan. Everything done for each and every single company that is listed down. Write an excellent prompts based off the total companies listed down in the notes right now. Make no mistakes, each company has a decision written down in the end no matter what. Each and every single one.

--USER-- 
Day -2 has been laid out in complete detail. I want a new session to do exactly what the clause session just ran in the session: ```Final report — full 51-company pass
11 dossiers written across 10 companies, all self-checked with check_format_compliance() before writing, confirmed present in 10_Areas/Career/Internships/List/Dossiers/_Career Fair/:
┌────────────────────────┬────────────────────────────────────────────────────────────────────────┐
│        Company         │                                Role(s)                                 │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ Barr Engineering Co.   │ Internship - Data Science (Remote)                                     │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ Bracco Medical         │ Firmware Engineering Co-op                                             │
│ Technologies           │                                                                        │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ Marvell Technology     │ SRAM Software Engineer Intern, BS                                      │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ Micron Technology Inc. │ Intern - Software Engineer                                             │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ The Toro Company       │ Embedded Software Engineering Intern                                   │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 3M                     │ 2027 Undergraduate IT Intern                                           │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ Teleflex               │ Software Engineering Intern (Spring/Summer 2027)                       │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ Tetra Pak              │ IT Product Development Intern                                          │
├────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ TSMC                   │ Computer Integrated Manufacturing (CIM) Engineer Intern                │
├────────────────────────┼────────────────────
Shell cwd was reset to /home/anant_gupta/projects/work/internship-research-loop
  ```
- `Bash`:
  ```bash
cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/d9e1002f-bcde-4ac4-ac31-6516312edb23/tool-results/ && python3 - <<'E'
import json,re
raw=open("mcp-jarvis-vault_read-1790647435333.txt").read()
c=json.loads(raw)['content']
parts=re.split(r'\n## (You|Claude)\n',c)
claudes=[parts[i+1] for i in range(1,len(parts)-1,2) if parts[i]=='Claude']
for x in claudes:
    print("--CLAUDE--",len(x)); print(x[:9000])
E
  ```
  ```
--CLAUDE-- 100761

I'll start by investigating both builds. Let me locate the source documents first.

Vault is reachable via the `jarvis` MCP. Let me search it for the Improvement Plan, postmortem, and the two "Excluded" docs.

Found both. Let me read the Improvement Plan's §3 and the postmortem's Recommendations.

Both files should live under `10_Areas/Career/Internships/List/`. Let me check that folder directly.

Now let's move to Build 2 groundwork — examine the existing workflows and state files to plan the reseed action.

I now have enough grounded evidence for both builds. Let me enter plan mode to present them for approval.

Both plans are now in `/home/anant_gupta/.claude/plans/dynamic-waddling-tower.md`. Quick summary:

**Build 1 (hourly discovery refinement):** No code change recommended. Cross-bucket `bucket_urgency` activation and a second `TIER_RANK` grade are both evidence-backed "not yet" — the Improvement Plan itself gates the former behind `run.yml` being back on and watched for 24-48h (still disabled), and the latter is a `profile.yaml` preference call with zero supporting data, not a code limitation. One real finding: `Excluded — Failed The Write Gate.md` doesn't exist yet, so the write-gate-failure fix has test coverage but no production evidence it's ever fired.

**Build 2 (cold-start reseed action):** A new `workflow_dispatch`-only `reseed.yml` + a small orchestration script reusing `run_pipeline.run_once()` unchanged — copy `state/` to scratch, override the write budget in-memory (~100-150/run), merge only `seen_ids.json`/`excluded_uids.json` back afterward (not `debate_losses.json`/`capacity_notified.json`), gated by a required confirm-string input checked before any billable work. Estimated ~10-20 min/run, no `run.yml` or `MAX_NEW_WRITES_PER_RUN` changes.

Since your original ask was investigate-then-plan with each build implemented only after separate approval, I stopped at the plan. Which would you like implemented, if either?

Now let me write the two files.

Now a small test for the merge-back logic — the one non-trivial, testable piece of new logic.

Now run the full test suite to confirm green.

Good — yaml parses fine (the py_compile call was a mistake, it's not Python). Everything checks out: import works, budget dict is correct, workflow YAML is valid, full test suite is green (486 passed).

Build 2 is implemented and tests are green — I haven't committed anything (wasn't asked to, and there's pre-existing unrelated dirty state in `.claude/` from before this session that I left untouched).

**What's new:**
- `reseed.py` — orchestration script reusing `run_pipeline.run_once()` unmodified. Copies `excluded_uids.json` as a seed into scratch state, runs against an isolated `seen_ids.json`/`state_dir` with `MAX_NEW_WRITES_PER_RUN` overridden in-memory to `{"AI/ML": 40, "Fullstack": 40, "CyS & Finance": 40, "Other": 20}` (~100/run), then unions only `seen_ids.json` and `excluded_uids.json` back into the real `state/` before pushing.
- `.github/workflows/reseed.yml` — `workflow_dispatch`-only, no schedule, with a required `confirm` input checked (`== 'yes-drain-budget'`) in the first step before checkout/pip-install, so a mistyped confirmation never spends anything.
- `tests/test_reseed.py` — covers the merge-back logic (`_union_json_list`)'s three real branches: union, missing real file, missing scratch file.

`run_pipeline.py` and `run.yml` are untouched. Full suite: `486 passed`.

**Tool calls:**

- `Bash` — `echo "=== repo root ==="; ls /home/anant_gupta/projects/work/internship-research-loop; echo "=== sibling dirs ==="; ls /home/anant_gupta/projects/work/ 2>/dev/null; echo "=== search for Improvement Plan / postmortem in repo ==="; grep -ril "improvement plan\|write-starvation\|write starvation" /home/anant_gupta/projects/work/internship-research-loop 2>/dev/null`
  ```
=== repo root ===
CLAUDE.md
PRD.md
README.md
__pycache__
core
docs
enrich.py
grade_resume.py
graphify-out
ingestion
jarvis-checkout
logs
recheck.py
requirements.txt
revalidate.py
run_pipeline.py
scripts
state
tests
vault_writer
=== sibling dirs ===
gupta-builds
internship-research-loop
=== search for Improvement Plan / postmortem in repo ===
/home/anant_gupta/projects/work/internship-research-loop/tests/test_freehire.py
/home/anant_gupta/projects/work/internship-research-loop/ingestion/sources.py
  ```
- `Bash` — `find /home/anant_gupta/projects -maxdepth 2 -iname "*jarvis*" 2>/dev/null; echo "---"; find / -maxdepth 3 -iname "*jarvis*" 2>/dev/null`
  ```
---
/tmp/claudekit-sync-Jarvis-.lock
  ```
- `Bash`:
  ```bash
echo "=== jarvis-checkout ==="; ls -la /home/anant_gupta/projects/work/internship-research-loop/jarvis-checkout 2>/dev/null | head -30
echo "=== gupta-builds ==="; ls /home/anant_gupta/projects/work/gupta-builds 2>/dev/null
echo "=== is jarvis-checkout gitignored? ==="; grep -n "jarvis-checkout" /home/anant_gupta/projects/work/internship-research-loop/.gitignore 2>/dev/null
echo "=== docs dir in repo ==="; find /home/anant_gupta/projects/work/internship-research-loop/docs -iname "*improvement*" -o -iname "*postmortem*" -o -iname "*starvation*" 2>/dev/null
echo "=== logs dir ==="; ls /home/anant_gupta/projects/work/internship-research-loop/logs | tail -20
  ```
  ```
=== jarvis-checkout ===
total 8
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Jul 17 06:24 .
drwxr-xr-x 19 anant_gupta anant_gupta 4096 Sep  6 20:30 ..
=== gupta-builds ===
README.md
assets
scripts
=== is jarvis-checkout gitignored? ===
10:# submodule path 'jarvis-checkout' in .gitmodules").
11:jarvis-checkout/
=== docs dir in repo ===
=== logs dir ===
rechecks.jsonl
runs.jsonl
  ```
- `Bash` — `find /home/anant_gupta/projects/work/internship-research-loop/docs -maxdepth 2 -type f | head -50`
  ```
/home/anant_gupta/projects/work/internship-research-loop/docs/PIPELINE_CONTRACT.md
  ```
- `Bash` — `grep -n "^# Plan\|Path To 5" /home/anant_gupta/projects/work/internship-research-loop/PRD.md | head -20`
  ```
(Bash completed with no output)
  ```
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_list,mcp__jarvis__search_simple,mcp__jarvis__vault_read,mcp__the-plan__vault_list","max_results":10}`
- `mcp__jarvis__vault_list` — `{}`
- `mcp__jarvis__search_simple` — `{"query":"Path To 5/Hour","contextLength":150}`
- `mcp__jarvis__search_simple` — `{"query":"write-starvation postmortem","contextLength":150}`
- `mcp__jarvis__search_simple` — `{"query":"Excluded — Losing The Debate","contextLength":150}`
- `mcp__jarvis__search_simple` — `{"query":"Excluded — Failed The Write Gate","contextLength":150}`
- `Bash` — `grep -n "^File:\|\.md$" -i "/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/[REDACTED].txt" | head -40`
  ```
(Bash completed with no output)
  ```
- `Read` — `/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/[REDACTED].txt`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Internship/Building System/Runs"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Research Loop - Improvement Plan.md","targetType":"heading","target":["Plan"]}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Runs/Discovery Step Postmortem — Write-Starvation Incident (2026-08-26).md"}`
- `Bash` — `wc -l core/debate.py core/company_registry.py run_pipeline.py`
  ```
   82 core/debate.py
   47 core/company_registry.py
  930 run_pipeline.py
 1059 total
  ```
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/core/debate.py`
- `Bash` — `grep -n "_prioritize_and_cap\|MAX_NEW_WRITES_PER_RUN\|bucket_urgency\|debate_compare\|compute_bucket_urgency" /home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py`
  ```
18:from core.debate import compute_bucket_urgency, debate_compare
81:MAX_NEW_WRITES_PER_RUN = {"AI/ML": 3, "Fullstack": 3, "CyS & Finance": 3, "Other": 1}
99:def _prioritize_and_cap(new_listings: list, budget: dict, preferred_companies: dict = None) -> tuple:
123:    bucket_urgency = compute_bucket_urgency(new_listings, budget)
124:    cmp_key = cmp_to_key(lambda x, y: debate_compare(x, y, preferred_companies or {}, bucket_urgency))
140:        # audit's Archive entry). debate_compare already sorts every
145:        # are competing for it, debate_compare's existing recency tie-break
182:# (falls outside its bucket's budget, i.e. ends up in _prioritize_and_cap's
326:# source) still wins its bucket's debate_compare ranking every run — it's
327:# never "deferred" (that only happens to items _prioritize_and_cap itself
335:# it occupied one of its bucket's limited MAX_NEW_WRITES_PER_RUN slots every
754:    this_run, deferred = _prioritize_and_cap(
755:        new_listings, MAX_NEW_WRITES_PER_
--CLAUDE-- 93013

Now let's implement all three tasks. Starting with rewriting `reseed.py` for Tasks A and B together.

Now let's rewrite the test file with the merge tests and the full end-to-end orchestration test.

Now let's run the test suite to see if this works.

All 6 pass on the first try. Now let's run the full suite for the before/after count.

Now the required Task B verification: deliberately break the merge-back logic, confirm the test catches it, then restore.

The test correctly fails when the merge-back is skipped. Now let's restore the fix.

Restored, and back to 489 passed. Tasks A and B are done. Now Task C — the read-only ready-to-screen report script.

Both pass. Now the full suite, and let's also produce a real report excerpt against the actual live vault as required.

Let me pull a real sample from the vault to build a realistic local checkout, then run the script against it for a genuine excerpt.

I have 6 real dossiers across two buckets (some CyS & Finance filenames with `&` didn't resolve). Let me materialize these into a local checkout and run the actual script against it.

Now let's run the actual script against this real (partial) checkout.

This real output surfaced a genuine finding: none of these live dossiers — including Google and Jane Street, both in `preferred_companies` today — carry `preference_tier: high`. They either predate Task O's frontmatter addition entirely (no field at all) or have it stored `null` (Prophet Security). So today's actual vault gets zero benefit from the tier-ranking in `build_report` — it's correctly implemented, but there's nothing to rank yet since the existing dossier pile was never backfilled. Worth flagging as a real, separate finding, not a bug.

`.claude/` untouched, confirmed. Full report below.

## Task A — `opt_cache.json` handling fixed

`reseed.py` now seeds `scratch_dir/opt_cache.json` from the real `state/opt_cache.json` before calling `run_once()`, and merges it back afterward with `_merge_dict_json` (scratch wins on key collision — it's this run's freshest verdict). Real merged-file content, from the end-to-end test:

```json
{
  "SimplifyJobs:[REDACTED]": {"verdict": "excluded", "signal": "U.S. Person status is required", "checked": "2026-01-01"},
  "<some other written uid>": {"verdict": "eligible", "signal": null, "checked": "2026-07-17"}
}
```
The pre-existing excluded verdict survived untouched; a genuinely new eligible verdict from this run's own OPT check landed alongside it. Two new unit tests (`test_merge_dict_json_scratch_wins_on_collision`, `test_merge_dict_json_missing_scratch_leaves_real_untouched`) cover the dict-merge shape directly.

## Task B — `run_reseed()` extracted and tested end-to-end

`main()`'s logic now lives in `run_reseed(*, jarvis_dir, real_state_dir, runs_log_path, now, ...)` — explicit args, no env reads — with `__main__` doing only the env-var lookups, mirroring `run_pipeline.py`'s own `run_once()`/`__main__` split. Also fixed a real bug this refactor exposed: the old code permanently mutated `run_pipeline.MAX_NEW_WRITES_PER_RUN` at module scope with no restore, which would have leaked the reseed budget into any later call in the same process (a real test-pollution and in-process-reuse hazard). Now saved/restored via `try/finally`.

New end-to-end test (`test_run_reseed_end_to_end_merges_state_and_respects_seeded_opt_cache`) uses `_fake_http_get`/`_fake_http_head_all_live`/`PROFILE` from `tests/test_run_pipeline.py`, seeds a real `state/` dir with a pre-existing `excluded_uids.json` entry and a cached-excluded `opt_cache.json` verdict for a real fixture uid, runs `run_reseed()`, and asserts on the real files afterward.

**Break-it-and-verify, as required:** I commented out the `seen_ids.json` merge-back line, reran the test — it failed with `FileNotFoundError: .../state/seen_ids.json`, correctly catching the break. Restored the line, reran the full suite — green again (489 passed at that point).

## Task C — `screen_report.py` (repo root)

Placed at repo root, not `core/`, matching `recheck.py`/`enrich.py`'s existing convention: a script a human runs directly, not a library module `run_pipeline.py` imports. Reuses `vault_writer.writer.scan_dossiers()` and `core/company_registry.py`'s `TIER_RANK` — no new dossier-scanning logic. Two-pass stable sort (date descending, then tier ascending) so ties break by recency and preferred companies always win regardless of date.

Real excerpt, run against 6 dossiers pulled live from the vault via `mcp__jarvis__vault_read` (materialized into a local checkout, script run for real against it — not simulated):

```
# Ready To Screen

## AI/ML (3 total, showing top 3)
- **Prophet Security** — Software Engineer, Backend Intern — [...] — tier: — — posted: 2026-08-25
- **Jane Street** — Machine Learning Engineer Intern — [...] — tier: — — posted: 2026-07-24
- **Optiver** — Software Engineer Intern — [...] — tier: — — posted: 2026-07-07

## Fullstack (3 total, showing top 3)
- **Google** — Software Engineering Intern — [...] — tier: — — posted: 2026-07-24
- **Uber** — 2027 Software Engineering Internship, Uber Career Prep — [...] — tier: — — posted: 2026-07-20
- **Western Digital** — Software Engineer Intern — [...] — tier: — — posted: 2026-07-20
```

**Genuine finding from this run, not from the unit tests:** none of these six real dossiers — including Google and Jane Street, both `high`-tier in today's `profile.yaml` — carry a stored `preference_tier: high`. They either predate the field entirely or have it explicitly `null`. So on today's actual dossier pile, the tier-ranking is correctly implemented but currently inert — everything falls back to pure recency. Not a bug in the script; a backfill gap in the existing dossiers, worth knowing before trusting the ranking to surface preferred companies right after the next `reseed.yml` run.

## Test counts

Before this turn: 486. After: **491 passed** (`_union_json_list` ×3 unchanged, `_merge_dict_json` ×2 new, `run_reseed` end-to-end ×1 new, `screen_report` ×2 new). `run_pipeline.py` and `run.yml` untouched; `.claude/` untouched (confirmed via `git status`).

**Tool calls:**

- `Bash`:
  ```bash
cd /home/anant_gupta/projects/work/internship-research-loop
sed -n '750,775p' run_pipeline.py
  ```
  ```
    new_listings, already_seen_count = dedup_new(matched_by_source, seen_ids, excluded_ids=excluded_ids)
    record["new_count"] = len(new_listings)
    record["already_seen_count"] = already_seen_count

    this_run, deferred = _prioritize_and_cap(
        new_listings, MAX_NEW_WRITES_PER_RUN, preferred_companies=profile.get("preferred_companies")
    )
    record["deferred_count"] = len(deferred)

    opt_cache = {}
    if opt_cache_path and Path(opt_cache_path).exists():
        opt_cache = json.loads(Path(opt_cache_path).read_text())
    written_uids, rejections = validate_and_write(
        this_run, profile, jarvis_dir, seen_ids, now.date().isoformat(), http_head,
        fetch_page_fn=fetch_page_fn, opt_cache=opt_cache, state_dir=state_dir,
    )
    if opt_cache_path and opt_cache:
        Path(opt_cache_path).parent.mkdir(parents=True, exist_ok=True)
        Path(opt_cache_path).write_text(json.dumps(opt_cache, indent=2, sort_keys=True) + "\n")
    record["rejections"] = rejections

    # Task N (Prompt 5): count this run's debate loss for every deferred
    # candidate; a uid that won (got written) has its loss history dropped
    # entirely. A uid crossing MAX_DEBATE_LOSSES moves to the excluded set
    # and gets one line in a reviewable markdown log — not a silent,
    # permanent exclusion.
  ```
- `Bash`:
  ```bash
cd /home/anant_gupta/projects/work/internship-research-loop
sed -n '1,40p' vault_writer/writer.py
echo "---scan_dossiers---"
grep -n "^def scan_dossiers" -A 25 vault_writer/writer.py
  ```
  ```
"""Renders the fixed dossier template and writes it into a vault checkout.

Rendering is pure (no I/O) so validate.py can check format compliance on the
same markdown before anything touches disk. write_dossier() itself does not
re-run the write gate — callers are expected to have already gotten a passing
ValidationResult from validate.validate() before calling it.
"""
import json
import re
from datetime import datetime, timezone
from pathlib import Path

import yaml
from jinja2 import Environment, FileSystemLoader

from core.identity import company_matches_preference

TEMPLATE_DIR = Path(__file__).parent / "templates"
DOSSIER_SUBPATH = Path("10_Areas/Career/Internships/List/Dossiers")
DOSSIER_UIDS_FILENAME = "dossier_uids.json"

_env = Environment(loader=FileSystemLoader(TEMPLATE_DIR))
_template = _env.get_template("dossier.md.j2")


class _FrontmatterDumper(yaml.SafeDumper):
    """Dumps None as a blank scalar (matching the plan's `field:` empty style
    instead of PyYAML's default literal `null`) and indents list items under
    their parent key (matching the vault's own `tags:\n  - x` convention)."""

    def increase_indent(self, flow=False, i
Shell cwd was reset to /home/anant_gupta/projects/work/internship-research-loop
  ```
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-12 Weekly Discovery Review.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-22 Below is a conversation log from a Claude Code coding session. Create a summary.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/internship-research-loop/09-26 Codebase migration to new laptop.md"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/Programs"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/Programs/Serious"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/Programs/Considering"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/Tracker"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/Contacts"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/List/Dossiers/2 - Fullstack"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/Career/Internships/List/Dossiers/Other"}`
- `Bash` — `cat .claude/agents/applying.md .claude/skills/tailoring-application/SKILL.md; echo =====CLB; cat .claude/agents/cover-letter-builder.md`
  ```
---
name: applying
description: Runs the Tailor sequence (draft, plan, humanize) for one real application, reading Main Resume.md / Main Cover Letter.md and the Applying note's JD/fit/networking fields, and proposing a traceable content plan for human approval before anything is written. Use when a real Applying note exists and needs its resume/cover-letter content plan drafted. Currently blocked — see "Not runnable yet" below — do not invoke against real Main Resume.md / Main Cover Letter.md content until that block clears; this file exists so the sequence is fully specified and ready the moment it does.
tools: Read, Grep, Glob, AskUserQuestion, mcp__jarvis__vault_read, mcp__jarvis__vault_patch
model: sonnet
---

You draft — you never write a final DOCX yourself, and you never decide anything a human hasn't explicitly approved. Your job is the `draft` and `plan` steps of the Jarvis vault's `30_Order/Workflows/Internship/Application Document Preparation` sequence: `prepare → draft → plan → approve → humanize → write → link → apply`. You own the middle two; a human owns `approve`; the Humanizer gate and the actual file write happen after you, not inside you.

## Not fully runnable yet — read this before doing anything else

**Corrected 2026-09-06**: `Resumes/Main Resume.md` was actually rebuilt into a real evidence-tagged bullet bank on 2026-08-29 (`#evidence/[REDACTED]` tags throughout) — the "still generic filler" note that used to live here was stale documentation, not current fact; verify this yourself by reading the file rather than trusting either this note or the correction. `Cover Letters/Main Cover Letter.md` still does not exist — that half of the block is real and current, and a `cover-letter-builder` agent exists in `second-brain-claudekit`'s staging (`agents/internship-research-loop/cover-letter-builder.md`) specifically to build it. **If you are invoked and `Cover Letters/Main Cover Letter.md` still does not exist (or exists but its fragment categories are still mostly `#evidence/needed` placeholders), stop immediately and say so for the cover-letter half** — do not draft cover-letter content against a bank that isn't real yet. The resume half no longer has this restriction; verify `Main Resume.md`'s actual current content before drafting either way, since vault state can change between sessions and a stale note is exactly how this one drifted.

## Prerequisite
See `.claude/rules/jarvis.md` for the vault-reachability check — confirm it before reading the Applying note.

## The evidence rule — the one thing that overrides everything else

Every claim in a `draft`/`plan` output must trace to exactly one of three sources (Resume Alteration Standard §2, Cover Letter Alteration Standard §2, identical rule both places):
1. An already-approved bullet/fragment in `Main Resume.md` / `Main Cover Letter.md`.
2. A fact drawn from a linked Jarvis project note, cited by path.
3. A fact the human explicitly supplies when you ask.
A JD requirement with no matching evidence in any of those three is an honest **gap** in the plan — never guessed, never filled with a plausible-sounding invention, no matter how minor or how much the JD wants it. `Resume & Cover Letter - System Map.md` names the human (Anant) as the real, available fourth-path fact source for exactly this situation — **ask**, don't invent, the moment a JD requirement has no matching bullet or fragment.

## Steps

### 1. Read inputs
The Applying note (JD summary, fit, networking fields — from its Interlinks section), `Main Resume.md` and `Main Cover Letter.md` (once real), and any linked Jarvis project note the JD's requirements might map to.

### 2. Draft
For the resume: select which existing bullets map to the JD's top requirements, in what order, what wording gets mirrored to the JD's own terminology (Resume Alteration Standard §3 — allowed: rephrasing that preserves the underlying fact; not allowed: inventing, inflating, or changing a real number). For the cover letter: select 2-3 real, evidence-backed experiences (never more — Cover Letter Alteration Standard §3), an opening hook matching the company's archetype from `Cover Letter Template.md`'s fragment categories, and a closing.

### 3. Plan
Produce one short, traceable content plan covering both documents: which bullets/paragraphs, in what order, what's rephrased and why, which JD keywords are covered, which are honest gaps (with a note on whether you asked the human and what they said, or that you haven't asked yet). Nothing is written to a file at this stage — this is a proposal, not a draft file.

### 4. Stop for approval
Present the plan via `AskUserQuestion` (or equivalent explicit approval ask) — the same consent discipline as `/promote-dossier` and `promotion`. Changes route back to step 2/3, never a partial write. You do not proceed past this point — `humanize` and `write` are downstream of this agent, not yours to run.

## Output format

```
## Content plan: <Role> - <Company>

### Resume
- Lead bullet: <which, why — JD requirement it maps to>
- Order: <top-to-bottom selection, each cited to Main Resume.md or a project note>
- Gaps: <JD requirements with no matching evidence — asked human? y/n, answer if yes>

### Cover Letter
- Opening hook: <which archetype fragment, or "needs a new one — none fits">
- Experiences (2-3): <each cited>
- Gaps: <same as above>

Ready for approval — nothing written yet.
```

## What you do not do

- Does not pass the Humanizer gate itself — that's a separate step, after your plan is approved.
- Does not write or overwrite any `.docx`/`.pdf` file.
- Does not update the Applying note's `resume_version`/`cover_letter` fields — that happens at the `link` step, after `write`, not here.
---
name: tailoring-application
description: Runs the Tailor sequence (draft, plan, human approval, Humanizer gate, write, link) for one real application's resume and cover letter, per Application Document Preparation. Use when a real Applying note exists and its documents need drafting. Resume-side blocker cleared 2026-08-29 (Main Resume.md is real); cover-letter-side still blocked on Main Cover Letter.md not existing — see the skill's own first step, which checks current state before doing anything, rather than trusting either "still blocked" or "already cleared" as a given.
---

# /tailoring-application

Thin entry point over the `applying` subagent (`.claude/agents/applying.md`), which owns the actual `draft`/`plan` logic. This skill's only job beyond invoking that agent is the parts of `Application Document Preparation`'s sequence that happen around it: confirming current block state (don't trust a stale note — check the real files), and handing the approved plan onward to the Humanizer gate and the write step, which now has real tooling (see Step 4).

## 0. Check the block first — check real files, not a note about them

**Corrected 2026-09-06**: this step used to say "Main Resume.md is still generic filler" — that was true when written (2026-08-28) and stale by the next day (2026-08-29, when the file was actually rebuilt). Don't repeat that mistake: read `20_Progress/Internship/Resumes/Main Resume.md` directly and check whether it still carries `#evidence/user-confirmed-<date>` tags and real Experience/Projects content, rather than trusting this note's own claim about it. As of 2026-09-06 it does — the resume half is real. Separately, check `20_Progress/Internship/Cover Letters/Main Cover Letter.md` directly — if it doesn't exist, or exists with most fragment slots still `#evidence/needed` placeholders, **stop here for the cover-letter half and tell the user** (`.claude/agents/cover-letter-builder.md`, promoted 2026-09-08, is what fills this in). Do not invoke `applying` against filler content for whichever half is still blocked — check both independently, since one clearing doesn't mean the other has.

## Steps (once the block above has actually cleared)

### 1. Confirm the Applying note exists
Per `Application Document Preparation`'s `prepare` step — this skill runs *for* an existing Applying note (`status: Preparing`), it does not create one. If none exists yet for this application, that's a separate, earlier step (creating the note from `Applying Template`), not this skill's job.

### 2. Invoke `applying`
Hand it the Applying note's path. It reads the JD/fit/networking fields, `Main Resume.md`/`Main Cover Letter.md`, drafts, and returns a content plan for approval — it does not write past that point.

### 3. Relay the plan for approval
Present `applying`'s content plan to the user exactly as returned. On approval, the plan moves to the Humanizer gate (`30_Order/Standards/Humanized Writing Standard`) — still manual as of this writing (the Humanizer gate itself has no automated tooling yet); flag that clearly rather than assuming it's been run.

### 4. Write — real tooling now exists (added 2026-09-06)

Once a plan has passed the Humanizer gate, hand the approved resume content to `generating-resume-docx` and the approved cover-letter content to `generating-cover-letter-docx` (both `.claude/skills/`, sibling to this one). Each is format-only — they lay out already-approved content into a real `.docx`, they do not decide anything. Report back both generated file paths and any format warnings either skill returns; a warning (e.g. content running long) is the human's call, not something to resolve silently.

### 5. Link

Once both documents are written, update the Applying note's `resume_version`/`cover_letter` fields to point at the real files — per `Application Document Preparation`'s `link` step. This skill does the update; it is not automatic.

## What this skill does not do

- Does not draft content itself — that's `applying`.
- Does not decide the letter's or resume's actual wording — `generating-cover-letter-docx`/`generating-resume-docx` lay out already-approved content, they don't write it.
- Does not run the Humanizer gate itself — that's a separate, still-manual step before Step 4.
- Does not create the Applying note — that's a separate, earlier vault-side step.
=====CLB
---
name: cover-letter-builder
description: One-time (or occasional) builder for `Cover Letters/Main Cover Letter.md` — the evidence-tagged paragraph/story bank that doesn't exist yet and is the single remaining blocker on the whole application-writing system (Main Resume.md was already rebuilt 2026-08-29; this is the other half). Interviews the human for each fragment slot the Cover Letter Template defines, never invents a fact, and writes only what's explicitly confirmed. Use when the human wants to actually build Main Cover Letter.md for the first time, or wants to add/revise a fragment in it later. Do NOT use this for a per-application cover letter — that's `.cursor/skills/cover-letter-alteration` for selecting content, and `.claude/skills/generating-cover-letter-docx` for laying it out as a real .docx — both downstream consumers of the file this agent builds, not competitors to it.
tools: Read, Grep, Glob, AskUserQuestion, mcp__jarvis__vault_read, mcp__jarvis__vault_write, mcp__jarvis__vault_get_document_map
model: sonnet
---

You build the **master fragment bank**, never a per-application letter. Your one deliverable is `20_Progress/Internship/Cover Letters/Main Cover Letter.md` in the Jarvis vault — a bank of reusable, evidence-tagged opening hooks, experience paragraphs, and closings that `.cursor/skills/cover-letter-alteration` selects from per application, and `.claude/skills/generating-cover-letter-docx` then lays out as a real Word document. You do not write a cover letter for any specific company, and you do not generate a `.docx`. If asked to do either, stop and say this is the wrong agent/skill for that step.

## Why this exists, and why it's safe to run now

Read `20_Progress/Internship/Building System/Resume & Cover Letter - System Map.md` first, in full, before doing anything else — it is the authoritative live-state note and this section only summarizes it. As of this writing: `Resumes/Main Resume.md` was rebuilt 2026-08-29 into a real evidence-tagged bullet bank (confirmed — read it, it is not filler). `Cover Letters/Main Cover Letter.md` does not exist at all; only its template scaffold does, at `30_Order/Templates/Career/Internship/Cover Letter Template.md`, and every fragment slot in that template is an explicit placeholder (tagged `#evidence/needed`), not real content. This agent's whole job is turning those placeholders into real, evidence-tagged fragments — one at a time, never guessed.

**If, when you run, the System Map's Status section says Main Cover Letter.md already has real fragments in most or all categories, stop and tell the human** — this agent is for the initial build and later additions, not for re-deriving something already done; ask what specifically they want changed before touching the file.

## The one rule that overrides everything else — identical to `applying`'s evidence rule

Every fragment you write must trace to exactly one of these three sources (Cover Letter Alteration Standard §2 — read that Standard in full before drafting anything, don't work from this paraphrase alone):
1. An already-approved bullet in `Resumes/Main Resume.md`.
2. A fact drawn from a linked Jarvis project note, cited by note path.
3. A fact the human explicitly supplies when you ask, in this session.

**A fragment slot with no matching evidence in any of those three stays exactly as written in the template (`*(fragment — pending)*` with `#evidence/needed`) or gets logged in the new file's own "Logged Gaps" section — never filled with a plausible-sounding invention, no matter how minor, no matter how much it would make the file look more complete.** An honestly-empty slot is correct. A fabricated one is the exact failure this Standard exists to block, and it is worse than leaving the slot empty, because a downstream drafting pass will trust it as real.

## Freedom tiers for this agent's own steps (state this explicitly so a future re-read of this file knows which parts are fixed and which are judgment calls)

- **Low freedom, do not deviate:** the file path (`Cover Letters/Main Cover Letter.md`), the tag syntax (`#hook/<archetype>`, `#experience/<category>`, `#closing/standard`, `#evidence/user-confirmed-<YYYY-MM-DD>`), the four opening-hook archetypes and four experience categories the template already names, and the requirement to stop and ask rather than invent.
- **Medium freedom:** how you phrase a confirmed fact into a fragment (mirror `Main Resume.md`'s own voice and the JD-terminology-mirroring latitude the Standards allow — rephrasing that preserves the fact is fine, changing the fact is not), and how you sequence your questions to the human (batching related questions is fine, asking one at a time is fine, use judgment on what's less tedious for a real conversation).
- **High freedom:** which linked Jarvis project note to check for more color on a given experience, and how much of that note's detail is worth surfacing in your question to the human versus just asking directly.

## Steps

### 1. Read every real source before asking the human anything

In this order, so you never ask for something already answered:
- `20_Progress/Internship/Building System/Resume & Cover Letter - System Map.md` (already read above, per "Why this exists").
- `30_Order/Standards/Internship/Cover Letter Alteration Standard.md` — full read, not a skim. This is the enforceable contract; the rest of this file is guidance, that Standard is the rule.
- `20_Progress/Internship/Resumes/Main Resume.md` — the current real evidence source. Note every `#skill/<category>` tag and which experience/project it's attached to; you'll map these to the template's `#experience/<category>` slots.
- `30_Order/Templates/Career/Internship/Cover Letter Template.md` — the exact structure and every placeholder slot you're filling. Copy its section structure and tag conventions exactly; do not invent a new organization.
- For each named experience/project in `Main Resume.md` (NSEdu, BOOM, the CSE Student Ambassador role, the Jarvis-Second-Brain project, the Resq project, and any others present at read time), search the vault for a linked project note with more narrative detail than the resume's terse bullet form (`mcp__jarvis__vault_get_document_map` or a targeted read/grep by the project name). Read what you find. Not finding one is a normal, expected outcome for some of these — don't stall on it, just note you checked.
- Check `Main Resume.md`'s own "Logged Gaps" section (currently: CausalOps, Orby, TradingView, SafeReach) — these are explicitly unconfirmed and must not be used as evidence for a cover-letter fragment either, for the same reason they're excluded from the resume.

### 2. Map what you have to the template's slots — before asking anything

For each of the four experience-paragraph categories (`fullstack`, `ai`, `systems`, `communication`), identify which `Main Resume.md` bullets and which Jarvis project note (if found) could support a real paragraph. You likely already have enough for most or all four categories directly from `Main Resume.md` — this step is about organizing what already exists, not discovering new facts yet.

For the four opening-hook archetypes (startup/scale-up, big-tech, quant/finance, research-heavy/applied-AI), you will almost always need to ask the human directly — a hook needs a real reason *this kind of company* resonates, which is rarely sitting in a resume bullet. Don't guess at this from the resume alone.

### 3. Ask the human, in one batched pass, for exactly what's missing

Use `AskUserQuestion` (or, if the interface doesn't fit a single structured question, plain conversational questions — the interview itself is high-freedom, the discipline of "don't proceed without a real answer" is not). Ask, per gap:

- For each opening-hook archetype: "Is there a real reason a [startup/big-tech/quant-finance/research] company's mission or work genuinely resonates with you, backed by something specific you've actually done or noticed? If nothing real comes to mind for this archetype right now, say so — it's fine to leave it pending."
- For any experience category where `Main Resume.md` and the linked project notes together don't give you enough to write a full paragraph (not just a bullet): ask the specific missing detail — scope, a concrete outcome, why it matters for that category.
- For the closing: confirm whether a single standard closing (restate fit, name the next step, thank the reader) is wanted, or whether the human wants to supply their own closing language.

**Do not treat silence or a vague answer as permission to invent.** If the human says "I don't have a good example for the quant/finance hook," that category's slot stays `*(fragment — pending)*` in the file you write — that is a correct, complete outcome for this run, not a failure to fix by guessing.

### 4. Draft every fragment you now have real evidence for

For each fragment: 2–5 sentences, in a voice that matches `Main Resume.md`'s register (plain, factual, no inflated language — the same restraint the Resume Standard's tailoring boundary requires, applied to prose instead of bullets). Tag it `#hook/<archetype>` or `#experience/<category>` as appropriate, plus `#evidence/user-confirmed-<today's date, YYYY-MM-DD>` for anything the human confirmed in this session, or cite the Jarvis note path directly in-line if the fact came from there instead of a live confirmation.

### 5. Present the full draft file content for explicit approval before writing

Do not call `mcp__jarvis__vault_write` until the human has explicitly approved the content. Show the complete proposed file body — every filled fragment, every slot still correctly left pending, and the Logged Gaps section — and ask for approval or changes, the same "stop before writing" discipline `applying.md` uses for per-application content plans. If the human asks for a change, revise and re-present; don't write a partial version in between.

### 6. Write, once approved

Use `mcp__jarvis__vault_write` on `20_Progress/Internship/Cover Letters/Main Cover Letter.md`. Preserve the template's overall section structure and heading names exactly (`# Main Cover Letter`, `## How This Bank Is Organized`, `## Opening Hooks — By Company Archetype` with its four archetype sub-headings, `## Experience Paragraphs — Tagged By JD-Requirement Theme`, `## Closings`, `## Logged Gaps`) so the file reads as the same document family as `Main Resume.md` and the template it came from. Set frontmatter `type: project`, `status: active`, `created`/`updated` to today's real date, `source_note: null` (nothing supersedes this file — it's the source), matching the template's own frontmatter shape.

### 7. Report what changed, and what's still open

After writing, state plainly: which fragments are now real (with their tags), which slots are still pending and why (no real evidence surfaced this session — name which ones), and that `Cover Letters/Main Cover Letter.md` now exists as a real file for the first time — which is what clears `applying.md`'s "Not fully runnable yet" block for the cover-letter half specifically (the resume half already cleared 2026-08-29; confirm both are now clear, or state plainly if a pending slot means the file exists but isn't complete enough yet for `applying.md`'s own judgment on that point). Once both halves are clear, the whole chain (`applying` → `.cursor/skills/cover-letter-alteration` → `.claude/skills/generating-cover-letter-docx`) is unblocked end to end for the first time — worth saying plainly if that's the actual outcome of this run.

## Output format

End every run with exactly this:

```
## Cover letter bank build — <date>

### Filled this session
- <archetype/category>: <one-line summary of the fragment> — #<tag>

### Still pending (no real evidence yet, correctly left blank)
- <archetype/category>: <why — e.g. "no quant/finance-shaped experience surfaced">

### Logged Gaps (unchanged from Main Resume.md, or newly added)
- <item> — <why it's not usable yet>

### File status
Written to `20_Progress/Internship/Cover Letters/Main Cover Letter.md`: <yes/no — if no, say exactly what's still waiting on human approval>
```

## What you do not do

- Do not write a per-application cover letter — that's `.cursor/skills/cover-letter-alteration`'s job, downstream of the file you build here.
- Do not generate a `.docx` — that's `.claude/skills/generating-cover-letter-docx`'s job, further downstream still.
- Do not invent a fragment to fill a slot that has no real evidence behind it, under any framing ("a plausible example," "something generic that could work," "just a placeholder that sounds real") — an untagged or fabricated fragment is worse than an honest pending slot, because it will be trusted as real by the next agent that reads this file.
- Do not touch `Resumes/Main Resume.md`, `Resumes/Main Resume.docx`, or `Resumes/Main Resume.pdf` — read-only source for you, owned by the resume side of this system.
- Do not run the Humanizer gate yourself — that happens on a per-application draft later, not on the master fragment bank.
- Do not proceed past Step 5 without explicit human approval, no matter how confident you are in the draft.
  ```
- `Bash` — `cat .cursor/skills/resume-alteration/SKILL.md; echo ====; cat .cursor/skills/cover-letter-alteration/SKILL.md; echo ====; cat .claude/skills/generating-resume-docx/SKILL.md; diff .claude/skills/generating-resume-docx/scripts/generate_resume_docx.py .claude/skills/generating-cover-letter-docx/scripts/generate_cover_letter_docx.py | head -40; cat grade_resume.py | head -30`
  ```
---
name: resume-alteration
description: >-
  Drafts a traceable, evidence-only content plan for one application's tailored resume
  from the Jarvis vault's Main Resume, gets explicit human approval and a Humanizer pass,
  then writes it as Resumes/<Role> - <Company>.docx. Use when an Applying note exists (or
  is being created) and needs its resume prepared — Application Document Preparation's
  draft/plan/humanize/write sequence, resume half.
disable-model-invocation: true
---

# resume-alteration

Drafts and writes the tailored resume for one application, per the Jarvis vault's `20_Progress/Internship/Building System/Resume Alteration.md` design note and its enforceable rules in `30_Order/Standards/Resume Alteration Standard.md`. This is a human-in-the-loop step: it never invents a claim it can't source, and it never writes a file without explicit approval of the content plan **and** a pass through the Humanizer gate.

## Prerequisite — read this before running

**Needs the Jarvis vault reachable**, same two paths `promote-dossier` documents (a sibling git checkout, or the `user-jarvis` MCP namespace — confirm with `vault_list` before assuming it's connected). This skill is vault-side work; it does not touch this repo's own pipeline code.

**Read the design contract first, every run** — don't work from memory of what these say:
- `20_Progress/Internship/Building System/Resume Alteration.md` — the narrative and per-application flow.
- `30_Order/Standards/Resume Alteration Standard.md` — the enforceable evidence/tailoring/naming/overwrite rules.
- `30_Order/Standards/Humanized Writing Standard.md` — the tone checklist the draft must pass before writing.

**Stop if `Resumes/Main Resume.md` is not in evidence-tagged shape yet.** As of this skill's authoring (2026-08-28), Main Resume is still generic filler, not a bullet bank with sourced claims — that rebuild is separate, gated work. Running this skill against the current Main Resume would mean tailoring from unreliable source material. If that rebuild hasn't happened, say so and stop rather than drafting from what's there today.

## Steps

### 1. Take the input
Accept an Applying note path (`20_Progress/Internship/Applying/<name>.md`) or a Program note to prepare one for. Read its `program`, `tracker`, `company`, `job_url` fields and its Job Description / Fit / Networking one-liners. If the Applying note doesn't exist yet, create it from `30_Order/Templates/Career/Applying Template.md` first (`status: Preparing`, `date_applied: null`) — this is Application Document Preparation's `prepare` step.

### 2. Gather evidence
Read `Resumes/Main Resume.md` in full. Read the JD (via `job_url` or whatever the Applying note/Program note already captured). Read any Jarvis project notes the Main Resume's bullets cite. For every JD requirement, check whether it's covered by an existing Main Resume bullet or a cited project note — per the Standard's §2, a requirement with no match anywhere is a **gap**, not something to fill by inventing a bullet. If the human is present, ask about a genuine gap rather than skip it silently.

### 3. Propose the content plan — before writing anything
Present, as a short structured list, not the final document text:
- Which existing bullets are selected, in what order, and why (which JD requirement each one answers).
- What wording is rephrased to mirror JD terminology, with the original next to it, so the human can see the change is cosmetic, not factual.
- Any honest gaps (JD requirements with no matching evidence).
Ask explicitly: "Approve this content plan?" — a yes/no, not implied by the human having read it.

### 4. Humanizer gate
Only after approval, run the plan's actual bullet text against `30_Order/Standards/Humanized Writing Standard.md`'s checklist. Flag anything that matches a prohibited pattern (generic filler, corporate padding words, repetitive structure, tone louder than the underlying fact) with the specific phrase and a suggested fix — never silently rewrite it yourself without showing the flag. Loop back to step 3 for any fix, then re-check, until the draft passes clean.

### 5. Write the file
On a clean pass, write `Resumes/<Role> - <Company>.docx` (sanitized filename, per the Standard's §5 — never `Main Resume.*`, never a subfolder). **If no DOCX-generation mechanism is set up in this environment yet**, stop before this step and tell the human plainly — offer to write the approved, humanized content plan as a Markdown file instead (e.g. alongside the Applying note) so the work isn't lost, but do not fabricate a DOCX-writing tool call that doesn't exist. Overwrite in place if this application's resume already exists and `date_applied` is still null; if `date_applied` is already set, stop and ask before touching the file — per the Standard's §6, a submitted application's resume is historical.

### 6. Link back
Set the Applying note's `resume_version` field to the new file's path, and add a one-line summary of what the resume leads with under its Documents section — not the full plan, which stays in this conversation / the Program note's own history.

## What this skill does not do

- Does not rebuild `Main Resume.md` — that's separate, gated work (see the design note's "Not Yet Built").
- Does not draft the cover letter — that's `cover-letter-alteration`, run alongside this one per `Application Document Preparation`, sharing the same Applying note and approval gate.
- Does not submit the application or change `date_applied`/`status` — that's Internship Pipeline Step 7, a later, separate human action.
- Does not silently rewrite a draft to fix a Humanizer flag — every fix is shown, never applied invisibly.
====
---
name: cover-letter-alteration
description: >-
  Drafts a traceable, evidence-only content plan for one application's cover letter from
  the Jarvis vault's Main Cover Letter bank, gets explicit human approval and a Humanizer
  pass, then writes it as Cover Letters/<Role> - <Company>.docx. Use when an Applying note
  exists (or is being created) and needs its cover letter prepared — Application Document
  Preparation's draft/plan/humanize/write sequence, cover-letter half.
disable-model-invocation: true
---

# cover-letter-alteration

Drafts and writes the tailored cover letter for one application, per the Jarvis vault's `20_Progress/Internship/Building System/Cover Letter Alteration.md` design note and its enforceable rules in `30_Order/Standards/Cover Letter Alteration Standard.md`. Sibling to `resume-alteration`, sharing the same Applying note, the same approval gate, and the same Humanizer pass — see `Application Document Preparation` for how the two run together.

## Prerequisite — read this before running

Same vault-access prerequisite as `resume-alteration` (sibling git checkout or the `user-jarvis` MCP namespace, confirmed with `vault_list` first).

Read every run, not from memory:
- `20_Progress/Internship/Building System/Cover Letter Alteration.md` — narrative and flow.
- `30_Order/Standards/Cover Letter Alteration Standard.md` — enforceable evidence/length/naming/overwrite rules.
- `30_Order/Standards/Humanized Writing Standard.md` — shared tone checklist.

**Stop if `Cover Letters/Main Cover Letter.md` does not exist yet.** Unlike Main Resume, this file has never been built — there is no paragraph bank to draft from. As of this skill's authoring (2026-08-28) that master doesn't exist. If it's missing, say so and stop rather than writing a cover letter's narrative content from nothing.

## Steps

### 1. Take the input
Same Applying note as `resume-alteration` — read `program`, `tracker`, `company`, `job_url`, and its Job Description / Fit / Networking one-liners. Don't recreate the Applying note if `resume-alteration` (or the human) already created it in this session.

### 2. Gather evidence
Read `Cover Letters/Main Cover Letter.md` in full — its opening hooks, experience paragraphs, and closings. Read the Program note's Company Information section for a real, specific company fact to open with (never a generic mission-statement line). Every paragraph must trace to a Main Cover Letter fragment, a linked Jarvis project note, or an explicit human-supplied fact — per the Standard's §2, inventing a company-specific detail or a personal claim ("I've always dreamed of...") is exactly the failure mode this rule blocks, not an exception to it.

### 3. Propose the content plan — before writing anything
Present:
- The opening hook and the specific company fact it's built from.
- 2–3 selected experiences, each with the JD requirement it maps to and which source (fragment / project note / human input) it traces to.
- A target word count within the Standard's 250–350 word default (or a stated reason for deviating).
- Any honest gap (a JD ask with nothing real to map to).
Ask explicitly: "Approve this content plan?"

### 4. Humanizer gate
Same as `resume-alteration` step 4 — check the actual paragraph text against `30_Order/Standards/Humanized Writing Standard.md`, flag specific phrases with fixes, never silently rewrite, loop until clean. Cover letters are the format most prone to generic-enthusiasm filler ("passionate about your mission") — check for it explicitly.

### 5. Write the file
On a clean pass, write `Cover Letters/<Role> - <Company>.docx` (sanitized filename; never `Main Cover Letter.*`). **If no DOCX-generation mechanism exists in this environment**, stop and say so — offer a Markdown fallback of the approved, humanized text instead of fabricating a tool call. Overwrite in place while `date_applied` is null on the Applying note; if it's already set, stop and ask first.

### 6. Link back
Set the Applying note's `cover_letter` field to the new file's path, and add a one-line summary of what the letter opens with under its Documents section.

## What this skill does not do

- Does not build `Main Cover Letter.md` itself — that's separate work, and this skill is blocked until it exists (see Prerequisite).
- Does not draft the resume — that's `resume-alteration`.
- Does not submit the application or change `date_applied`/`status`.
- Does not silently fix a Humanizer flag without showing it first.
====
---
name: generating-resume-docx
description: Turns an already-approved resume bullet selection (from `.cursor/skills/resume-alteration`) into a real, correctly-formatted `.docx` — single column, standard font, real Word bullets, section order matching Main Resume.md. This is the resume-side counterpart to generating-cover-letter-docx, and the other missing DOCX-generation mechanism named in Resume & Cover Letter - System Map.md. Use whenever an approved resume content plan needs to become a real Word document — never to choose which bullets appear.
---

# Generating a resume .docx

Format only, same division of labor as the cover-letter generator. By the time you run, `.cursor/skills/resume-alteration` has already selected which `Main Resume.md` bullets appear, in what order, per Resume Alteration Standard §2/§3. Your job is laying that approved selection into a real, ATS-safe Word document.

## Reference

[`reference/resume-reference.md`](reference/resume-reference.md) — cites `Resume Alteration Standard` §8 directly, plus a fabricated example showing the exact section order and structure.

## Precondition

Confirm the bullet selection is already approved (Resume Alteration Standard §7's gate) before generating. If not, stop and say so.

## Steps

### 1. `python-docx` (low freedom)
Already in `requirements.txt` (`python-docx==1.2.0`, shared with the cover-letter generator).

### 2. Build the `ResumePlan` (medium freedom)
`name`/`contact_line` from `Main Resume.md`'s header, verbatim, identical to what the cover-letter generator uses. `education` from the Education section, generally unchanged. `skills` — the approved, possibly-reordered category list. `experience`/`projects` — each `Entry.header` verbatim from `Main Resume.md`; `bullets` the approved, possibly-reordered, possibly-rephrased-for-JD-terminology subset of that entry's real bullets. `certifications` usually unchanged. `objective` optional — omit the field entirely if the approved plan has none.

### 3. Generate, verify, report (low freedom)
Call `build_resume(plan, output_path)` in [`scripts/generate_resume_docx.py`](scripts/generate_resume_docx.py), `output_path` = `Resumes/<Role> - <Company>.docx` (Standard §5's naming convention). Report every warning — a length warning past one page is a real per-application decision (Standard §8: two pages only where the target company's guidance explicitly says so), never resolved silently. Read the file back to confirm font/bullets/headings before reporting success.

## Output format

```
## Resume generated: <Role> - <Company>

**File:** <path>.docx
**Verified:** <font>/<size>, <bullet count>, <section headings present>
**Format warnings:** <none, or list every warning returned>
```

## What this skill does not do

- Does not select, reorder, or rephrase bullets — that's `.cursor/skills/resume-alteration`'s job.
- Does not decide whether a two-page resume is warranted — reports the warning, lets the human decide.
- Does not touch `Main Resume.md` itself — read-only source.
2,3c2
< """Generate a resume .docx that matches this skill's format rules (cross-referenced
< from Resume Alteration Standard §8, not re-researched -- see reference/resume-format-rules.md).
---
> """Generate a cover letter .docx that matches this skill's researched format rules.
5,19c4,36
< Format only, same division of labor as generate_cover_letter_docx.py: this script
< never decides which bullets appear or in what order -- that's Resume Alteration
< Standard §2/§3's job and .cursor/skills/resume-alteration's job. This script turns
< an already-approved bullet selection into a real, single-column, ATS-safe .docx.
< 
< Rules implemented, each cited in reference/resume-format-rules.md:
<   - Single column, no tables/text boxes/graphics (Greenhouse's own parse-failure list).
<   - One font throughout, 10-12pt, standard system font.
<   - Real Word bullet-list style for every bullet, not a typed hyphen.
<   - Bold section headings one size larger than body; bold sub-entry headers
<     (role/company/dates, project names) at body size -- matches Main Resume.md's
<     own real visual hierarchy.
<   - One-page soft target (word-count warning, not a hard block -- a two-page
<     resume is a legitimate per-application choice for technical roles where the
<     target company's own guidance allows it, per the Standard's own §8 note).
---
> This script owns FORMAT only (page size, font, spacing, margins, the closing block).
> It does not select content, check evidence, or decide what a letter says — that is
> Cover Letter Alteration Standard's job and .cursor/skills/cover-letter-alteration's
> job. This script's only input is an already-approved content plan; it never asks
> "is this true," only "does this fit the page and look like a real business letter."
> 
> Rules implemented, each cited in reference/cover-letter-format-rules.md:
>   - One page target (soft-enforced via a word-count warning, not a hard page count,
>     since page rendering depends on the reader's own Word/LibreOffice font metrics).
>   - Times New Roman by default (Arial/Calibri/Tahoma are the other Standard-approved
>     choices — pass --font to use one of them), one font throughout, no bold/italic
>     in body text.
>   - Font size 11 by default (10-12 is the approved range).
>   - Single line spacing within paragraphs, one blank line between paragraphs
>     (implemented as space_after on each paragraph, not literal blank paragraphs).
>   - 1-inch margins on all sides.
>   - Closing: "Sincerely," + typed name + the same contact line as the header --
>     no blank lines reserved for a handwritten signature (this produces a digital
#!/usr/bin/env python3
"""Layer 6 — resume grader: keyword-overlap scorer, no LLM, no network.

Ranks Main Resume.md's `#skill/*`-tagged bullets against a pasted JD so the
top-third tailoring step of the Internship Pipeline starts from evidence,
not vibes:

    python grade_resume.py jd.txt            # or: pbpaste | python grade_resume.py -
    python grade_resume.py jd.txt --resume "path/to/Main Resume.md"
"""
import argparse
import re
import sys
from collections import Counter

DEFAULT_RESUME = ("/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/"
                  "Internship/Resumes/Main Resume.md")
# Just enough stopwords to keep JD boilerplate from scoring; not a linguistics project.
STOP = set("""a an and are as at be by for from has have in is it of on or our the
to we will with you your this that they them their its into within using able
work team who what when where required preferred qualifications responsibilities
experience years strong skills ability including etc more than least about
""".split())
_TAG_RE = re.compile(r"#skill/[\w-]+")
_WORD_RE = re.compile(r"[a-z][a-z0-9.+#/-]{2,}")


def parse_bullets(resume_md: str) -> list:
    """(text, tags) for every '- ' line carrying at least one #skill tag."""
    out = []
  ```
- `Bash` — `cat requirements.txt; echo ---; grep -rn "docx" tests/*.py | head -3; echo "--- hardcoded /mnt/d paths:"; grep -rn "/mnt/d" --include=*.py --include=*.md --include=*.yml --include=*.json . 2>/dev/null | grep -v -E '^./(graphify-out|logs|state|\.venv)' | head -12; echo ---; cat README.md; sed -n 1,88p PRD.md | cut -c1-260`
  ```
requests==2.34.2
pyyaml==6.0.3
pytest==9.1.1
jinja2==3.1.6
python-docx==1.2.0
---
--- hardcoded /mnt/d paths:
grade_resume.py:16:DEFAULT_RESUME = ("/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/"
---
# internship-research-loop

24/7 internship discovery automation — polls SimplifyJobs and Jose-Gael-Cruz-Lopez,
filters against a profile, dedups (per-source uid + cross-source company+title), and
writes dossiers into an Obsidian vault through a validated template + five-check
write gate. A daily recheck (`recheck.yml`) removes dossiers whose postings close
upstream. (zapplyjobs was dropped as a source 2026-07-18 — its entries are program
landing pages, not deadline-bearing postings.)

Full spec lives in the Jarvis vault: `Internship/Building System/Research Loop —
Implementation Plan.md`.

## Status

Phases 1–3 are live. `.github/workflows/run.yml` runs hourly against the real
`gupta-builds/Jarvis` repo — schema-drift check, fetch, filter, dedup,
validate, write, push (retry-safe against the vault's own independent
auto-commit cycle), with `state/seen_ids.json` only updated after a confirmed
push. First live run (2026-07-17) wrote 137 real dossiers into
`10_Areas/Career/Internships/List/Dossiers/`; a follow-up run correctly
recognized all 137 as already-seen and wrote zero duplicates. Per the plan's
build order: watch the Run Log rollup for a full week before tightening the
cadence past hourly.

## Local dev

```
python3 -m venv .venv && .venv/bin/pip install -r requirements.txt
.venv/bin/python -m pytest tests/ -v
```

One-time: `cp scripts/hooks/pre-push .git/hooks/pre-push` — this repo has no PR gate, so this local hook is what blocks a `git push` with a failing test suite.
# Internship Research Loop — PRD

**Status:** Verified against live repo/GitHub state on 2026-08-22 (git log, `pytest` [329/329], `gh run list`, `gh api`, live vault dossier counts — not assumed from memory). Still not independently product-reviewed; this was built spec-first in conversation

## Problem

Manually checking internship-listing repos/boards for new postings that match a specific eligibility window (class year, term, category, location, work authorization) is repetitive and easy to let slip. Postings also go stale fast — a manually-curated list r

## Goal

A 24/7 background process that watches known internship-listing sources, keeps only postings the user is actually eligible for under **three hard criteria** — timing (Summer 2027 or the Dec 2026–Jan 2027 winter window), location (US/Remote), and OPT eligib

## User

Single user (repo owner) — a rising junior CS student, grad Spring 2028, F-1 student targeting Summer 2027 (or Dec 2026–Jan 2027) SWE/AI/data internships in the US. Not built as a multi-tenant product; `core/profile.yaml` is hardcoded to one person's eligi

## In Scope — Built (Phases 1–6, complete and live)

- Poll two internship-listing sources hourly (GitHub Actions cron); zapplyjobs was removed 2026-07-18 — its entries are program landing pages, not deadline-bearing postings
- Filter deterministically against the profile: term (incl. `Winter 2027` = Dec 2026–Feb 2027 per live term-adjacency evidence), category, class year, `active` status, `degrees` (Bachelor's), locations (US signal wins / foreign token loses / ambiguous passes
- Deduplicate two ways: persistent per-source uid seen-set, plus a punctuation-insensitive cross-source company+title key checked against the dossier files actually in the vault
- Five-check write gate (required fields, uid dedup, cross-source dedup, URL liveness, format compliance), fail-closed
- **OPT-eligibility gate at discovery:** each new validated match's posting page is fetched once (Firecrawl), checked per-posting for explicit exclusion signals (US-person/citizenship required, clearance required, OPT/CPT not accepted — EEO boilerplate and "
- **Content-carrying dossiers:** the same fetch fills a verbatim, trimmed "Posting" section (role, requirements, comp) in each dossier — no LLM anywhere; fail-open to a thin dossier if the fetch fails
- Daily post-write recheck (`recheck.yml`): removes dossiers whose posting went `active: false` or vanished upstream, with a mass-deletion brake and per-source fetch-failure isolation
- Push safely against the vault's own auto-commit cycle (pull-rebase + retry-once, never force-push)
- Halt, log, and file a GitHub issue on schema drift **or any source fetch failure** (network errors no longer crash unrecorded), push failure, or systemic write-gate rejection
- Log every run (`logs/runs.jsonl`, `logs/rechecks.jsonl`; weekly rollup into the vault fires Sundays 23:00 UTC)
- Promotion-triggered tools, outside the automated loop: `enrich.py` (Layer 5 company/contact research — public sources only; built, unit-tested, never yet run end-to-end) and `grade_resume.py` (Layer 6 keyword-overlap resume grader, verified against a real 

## Explicitly Out Of Scope

- Any login-walled scraping (LinkedIn, etc.), CAPTCHA bypass, or stealth browser automation — a hard non-goal, not a resourcing decision
- Any Claude/Anthropic LLM call in the automated path — Firecrawl fetches return page markdown; all extraction is mechanical line filtering
- Grad-year-requirement parsing ("must graduate in 2027") — found in real postings but left to the human screen of the now-present dossier content, not codified
- Tightening cadence below hourly — still gated on a week of clean runs (evaluable on/after 2026-07-24)

## Architecture (Summary)

Deterministic pipeline, no LLM calls anywhere in the loop:

```
ingestion (fetch + normalize) → filter (term/category/class/active/degrees/location/season)
  → dedup (uid) → write gate (5 mechanical checks) → posting fetch (Firecrawl, fail-open)
  → OPT check (per-posting, cached) → write content-carrying dossier → push (retry-safe)
  → mark seen (only after confirmed push) → log
daily: recheck (remove closed postings)     weekly: rollup into vault Run Log
```

Repo layout: `ingestion/` (`sources.py`, `normalize.py`, `posting_page.py`), `core/` (`filter.py`, `identity.py`, `profile.yaml`, `schema_drift.py`, `git_ops.py`, `run_log.py`), `vault_writer/` (template + `validate.py` + `writer.py`), `run_pipeline.py`, `rech

## Current Status (verified 2026-08-22)

- `pytest`: **329/329 passing**; CI green on every push. A local `scripts/hooks/pre-push` test gate now blocks a `git push` if the suite fails — this repo has no PR-based CI gate, so this is the only thing standing between a broken commit and `origin/master`
- `run.yml`: firing hourly and succeeding — 20/20 most recent scheduled runs successful. `recheck.yml`: firing daily, 10/10 most recent runs successful, moving closed postings to `Dossiers/Viewed/` (never deleting, since 2026-08-21)
- Vault dossiers: **391 total** across the four priority buckets (146 AI/ML, 43 Fullstack, 63 CyS & Finance, 139 Other), plus 5 in `Viewed/`. `state/seen_ids.json` holds 606 entries. Eight discovery sources live (SimplifyJobs, Jose-Gael-Cruz-Lopez, vanshb03, z
- **Dossier resource-limit system live since 2026-08-21**: a per-bucket 50-dossier notification threshold and a global 190/200 issue-filing threshold, both notification-only (never a write refusal) — confirmed firing for real, not just designed: issues #4-8 
- `FIRECRAWL_API_KEY` present as an Actions secret; live discovery-time content enrichment confirmed firing (391 dossiers carry real fetched posting content)
- **8 GitHub issues filed to date** — 3 closed (transient `raw.githubusercontent.com` rate-limiting from 2026-08-17/18, self-resolved, closed 2026-08-21 with evidence), 5 open (the new capacity-notification issues #4-8, informational by design)

## Success Metrics

1. **Run reliability** — fraction of triggered runs completing without crash/halt (`gh run list` × `runs.jsonl`). Fetch-failure crashes with no record are no longer possible (halt + log + issue since 2026-07-18).
2. **Write-gate outcome breakdown** — `written_count` vs `rejections` by check, now including `opt_eligibility`; summarized weekly by the rollup (first real firing: 2026-07-19 23:00 UTC).
3. **Dedup correctness** — no duplicate dossiers in the vault (uid + cross-source key); currently holding at 20/20 verified-unique.
4. **Vault hygiene** — the recheck should keep the vault free of closed postings within a day of upstream closure; measurable from `rechecks.jsonl` once it starts firing.

**Not measurable without new tracking:** applications submitted, response rate, time saved — downstream behavior lives in the vault's `Applying/` flow, unlinked to this system.

## Open Backlog

- ~~Confirm the first real Sunday 23:00 UTC weekly rollup~~ — **done**: `Run Log.md` shows five weekly rollups firing continuously since 2026-07-19, most recently 2026-08-09 to 2026-08-16
- ~~Confirm the first scheduled recheck run behaves against the post-audit vault~~ — **done**: `recheck.yml` has run daily since, 10/10 most recent runs successful, now moving closed postings to `Viewed/` (2026-08-21)
- ~~Confirm the first live discovery-time enriched write~~ — **done**: all 391 current dossiers carry real fetched posting content
- Cadence decision on/after 2026-07-24 — still hourly, unchanged; over a month of clean runs since (20/20 recent success) makes this the settled default, though no explicit decision note exists
- Layer 5 `enrich.py` first live end-to-end run — **still unconfirmed**; the `/promote-dossier` skill and `contact-researcher` agent (built on `enrich.py`'s functions, see `CLAUDE.md`) have run live for the Appian promotion, but no direct evidence `enrich.py

## Risks

- **Fine-grained PAT (`JARVIS_PUSH_TOKEN`) expires or is revoked.** Fails the checkout step before Python runs — no run-log entry, no issue; only GitHub's failed-workflow email. Expiry date still recorded nowhere. *Unchanged, still the biggest silent-failure
- **Firecrawl dependency.** The discovery loop now calls a paid third-party API. Failure mode is deliberately soft (fail-open thin dossiers, no run failure), but quota exhaustion would silently degrade dossiers back to thin — watch `opt_cache.json` growth an
- **Neither secret's expiry date is checkable programmatically.** GitHub deliberately doesn't expose a fine-grained PAT's expiry via `gh`/the API, and Firecrawl has no such API either — confirmed 2026-08-22, not assumed. This needs a one-time **manual** chec
- **GitHub Actions public-repo minutes policy changes; usage still unmonitored.** Confirmed 2026-08-22: the billing/usage API (`/users/gupta-builds/settings/billing/actions`) returns 404 with this token's scopes (`gist`, `read:org`, `repo`, `workflow` — no `
- ~~Source repo goes offline → uncaught crash with no record~~ — **mitigated 2026-07-18**: any `requests` failure during drift-check/fetch now halts with a logged record and an auto-filed issue.

## Source Of Truth

This file is the standalone orientation document. `20_Progress/Internship/Building System/Phases 1-3 Run.md` in the Jarvis vault is the deeper record: build-by-build history, bugs found and fixed, audit evidence, and reasoning. If the two disagree on a fact, r
  ```
- `Bash` — `head -60 graphify-out/GRAPH_REPORT.md; ls -la graphify-out | head; git log -1 --format=%cd -- graphify-out/.gitignore`
  ```
# Graph Report - internship-research-loop  (2026-09-26)

## Corpus Check
- 104 files · ~94,638 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 10 file(s) not represented in the graph (top: (none) 5, .mdc 2, .jsonl 2)

## Summary
- 1245 nodes · 2703 edges · 74 communities (65 shown, 9 thin omitted)
- Extraction: 95% EXTRACTED · 5% INFERRED · 0% AMBIGUOUS · INFERRED: 145 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `bee5146b`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- test_writer.py
- matches
- normalize_simplify
- _fake_http_get
- test_posting_page.py
- test_validate.py
- test_classify.py
- test_identity.py
- normalize_josegael
- test_relevance.py
- test_enrich.py
- pathlib
- test_sources.py
- Internship Research Loop — PRD
- Software Engineering Intern (Summer 2027)
- _run_once_kwargs
- grade_resume.py
- /promote-dossier
- What to check
- recheck.py
- promote-dossier note templates
- internship-research-loop — Claude Code guidance
- contact-researcher.md
- internship-research-loop
- job details
- Summer Intern 2027 - Software Developer
- linkedin_recruiter_snippet
- test_freehire.py
- test_write_gate_failures.py
- test_interndock.py
- test_run_pipeline.py
- enrich.py
- test_debate_losses.py
- promote-dossier note templates
- validate
- load_seen_ids
- 650+ Summer 2027 Internships Open Now (Apply Links)
- posting_zipline_open_roles.md
- contact-researcher
- test_reseed.py
- writer.py
- test_git_ops.py
total 2884
drwxr-xr-x 13 anant_gupta anant_gupta    4096 Sep 26 15:42 .
drwxr-xr-x 21 anant_gupta anant_gupta    4096 Sep 26 15:42 ..
-rw-r--r--  1 anant_gupta anant_gupta    1899 Sep 26 15:42 .gitignore
-rw-r--r--  1 anant_gupta anant_gupta    2276 Sep 26 15:41 .graphify_labels.json
-rw-r--r--  1 anant_gupta anant_gupta    1917 Sep 26 15:41 .graphify_labels.json.sig
-rw-r--r--  1 anant_gupta anant_gupta       1 Sep 26 15:41 .graphify_root
drwxr-xr-x  2 anant_gupta anant_gupta    4096 Aug 21 12:20 2026-08-21
drwxr-xr-x  2 anant_gupta anant_gupta    4096 Aug 22 05:07 2026-08-22
drwxr-xr-x  2 anant_gupta anant_gupta    4096 Aug 23 08:21 2026-08-23
Sat Sep 26 15:41:10 2026 -0500
  ```
- `Bash` — `gh issue view 11 --json body,title --jq '.title, .body' | head -50; cat .github/workflows/revalidate.yml | head -35; grep -n "ADJACENT_FIELD_COMPANIES" core/relevance.py | head -3`
  ```
Revalidate: 15 live dossier(s) now fail current rules (2026-09-14)
These passed the write-gate when written but no longer pass the current core/filter.py / core/relevance.py rules against their own stored content — a code fix (denylist/hint-list change) landed after they were written. Review and remove/keep by hand; this job never moves or deletes a dossier itself.

- `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Agentic AI Intern - American Fidelity.md` (stage2_confirm) — American Fidelity: Agentic AI Intern
- `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Software Engineer Intern, AIML & LLM - Microsoft.md` (stage1_reject) — Microsoft: Software Engineer Intern, AI/ML & LLM
- `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Software Engineer Intern, CoreAI - Microsoft.md` (stage1_reject) — Microsoft: Software Engineer Intern, CoreAI
- `10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/Software Engineer Intern, Cloud & Distributed Backend - Microsoft.md` (stage1_reject) — Microsoft: Software Engineer Intern, Cloud & Distributed Backend
- `10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/Software Engineer Intern, Fullstack Product (Web + Services) - Microsoft.md` (stage1_reject) — Microsoft: Software Engineer Intern, Fullstack Product (Web + Services)
- `10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/FPGA Engineer Intern (Summer 2027 - Austin) - Optiver.md` (stage2_confirm) — Optiver : FPGA Engineer Intern (Summer 2027 - Austin)
- `10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/FPGA Engineer Intern (Summer 2027 - Chicago) - Optiver.md` (stage2_confirm) — Optiver : FPGA Engineer Intern (Summer 2027 - Chicago)
- `10_Areas/Career/Internships/List/Dossiers/Other/Product Management Intern, Global Merchant & Network Services - American Express.md` (stage1_reject) — American Express: Product Management Intern, Global Merchant & Network Services
- `10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Intern - Spring 2027 - Zipline.md` (stage2_confirm) — Zipline: Software Engineer Intern - Spring 2027
- `10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Intern, Data PlatformAnalytics - Microsoft.md` (stage1_reject) — Microsoft: Software Engineer Intern, Data Platform/Analytics
- `10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Intern, Security & Identity - Microsoft.md` (stage1_reject) — Microsoft: Software Engineer Intern, Security & Identity
- `10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Internship (2027 Start) - Optiver.md` (location_eligible) — Optiver : Software Engineer Internship (2027 Start)
- `10_Areas/Career/Internships/List/Dossiers/Viewed/Data Intern - Key Technology & Services - Data Track - KeyBank.md` (stage1_reject) — KeyBank: Data Intern - Key Technology & Services - Data Track
- `10_Areas/Career/Internships/List/Dossiers/Viewed/Perception Intern (Summer 2027) - Zipline.md` (stage2_confirm) — Zipline: Perception Intern (Summer 2027)
- `10_Areas/Career/Internships/List/Dossiers/Viewed/Software Systems Validation Intern (Summer 2027) - Zipline.md` (stage2_confirm) — Zipline: Software Systems Validation Intern (Summer 2027)
name: revalidate
on:
  schedule:
    - cron: '0 8 * * 1'  # weekly, Monday — a rule/hint-list fix lands rarely, not fast-moving data like recheck.yml's postings
  workflow_dispatch: {}   # manual trigger, for verifying end-to-end before trusting the schedule

permissions:
  contents: read   # read-only: never moves or deletes a dossier itself
  issues: write    # gh issue create — one digest issue per run with any regressions

jobs:
  revalidate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout internship-research-loop
        uses: actions/checkout@v4

      - name: Checkout gupta-builds/Jarvis
        uses: actions/checkout@v4
        with:
          repository: gupta-builds/Jarvis
          token: ${{ secrets.JARVIS_PUSH_TOKEN }}
          path: jarvis-checkout

      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"

      - run: pip install -r requirements.txt

      - name: Run revalidate
        env:
          JARVIS_DIR: ${{ github.workspace }}/jarvis-checkout
          GH_TOKEN: ${{ github.token }}
        run: python revalidate.py
27:from core.company_registry import ADJACENT_FIELD_COMPANIES
148:# ADJACENT_FIELD_COMPANIES (single source of truth, shared with the rest of
155:    r"|" + "|".join(re.escape(c) for c in ADJACENT_FIELD_COMPANIES) +
  ```
- `Bash` — `gh label list --limit 50; git show --stat d6bf5ca | tail -5; git show --stat a3664ca | tail -6; git show --stat e11de33 | tail -12`
  ```
bug	Something isn't working	#d73a4a
documentation	Improvements or additions to documentation	#0075ca
duplicate	This issue or pull request already exists	#cfd3d7
enhancement	New feature or request	#a2eeef
good first issue	Good for newcomers	#7057ff
help wanted	Extra attention is needed	#008672
invalid	This doesn't seem right	#e4e669
question	Further information is requested	#d876e3
wontfix	This will not be worked on	#ffffff
dossier-ready	New dossier(s) found by run.yml, ready for /promote-dossier	#0E8A16
    
    Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>

 .github/workflows/run.yml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
    
    Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>

 CLAUDE.md               | 3 ++-
 graphify-out/.gitignore | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)
    
    Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>

 .claude/agents/cover-letter-builder.md             | 102 +++++++++
 .../skills/generating-cover-letter-docx/SKILL.md   |  44 ++++
 .../reference/cover-letter-reference.md            |  69 ++++++
 .../scripts/generate_cover_letter_docx.py          | 232 +++++++++++++++++++++
 .claude/skills/generating-resume-docx/SKILL.md     |  43 ++++
 .../reference/resume-reference.md                  |  62 ++++++
 .../scripts/generate_resume_docx.py                | 232 +++++++++++++++++++++
 .claude/skills/tailoring-application/SKILL.md      |  21 +-
 8 files changed, 799 insertions(+), 6 deletions(-)
  ```

## Actions Taken
- Files created: (none)
- Files modified: (none)
- Files deleted: (none)
- Commands run: git log --oneline | head -40 && echo ---- && git show --stat HEAD~1 | head -80 && ls, ls jarvis-checkout | head; git -C jarvis-checkout log --oneline 2>/dev/null | head -5; git check-ignore jarvis-checkout; ls ../ ; ls "jarvis-checkout/20_Progress/Internship/Building System" 2>&1 | head; wc -c "jarvis-checkout/20_Progress/Internship/Building System/"*.md "jarvis-checkout/20_Progress/Internship/Building System/"*/*.md 2>&1 | head -30, cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/ && mkdir -p /tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/scratchpad && python3 - <<'E' import json d=json.load(open('[REDACTED].json')) o=json.loads(d[0]['text']) open('/tmp/claude-1001/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/scratchpad/buildlog.md','w').write(o['content']) print(len(o['content'])) E, cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/ && head -c 1500 [REDACTED].txt; echo; grep -n -i "internship" [REDACTED].txt | head -80; wc -l [REDACTED].txt, ls graphify-out | head -20; echo ----; git ls-files | grep -v -E '^(logs|state)/' | grep -v -E '^\.(agents|codex)/' | xargs wc -l 2>/dev/null | sort -k2 | awk '{print $1, $2}' | column -c 200 | head -150, git log --since=2026-09-05 --format='%h %ad %an | %s' --date=short --no-merges | grep -v -E 'Recheck log|Update state' ; echo ----; git status -sb | head; git branch -a; git fetch origin 2>&1 | tail -2; git log --oneline HEAD..origin/master | head, (source .venv/bin/activate 2>/dev/null; python -m pytest -q 2>&1 | tail -8); ls -a | head -30, gh workflow list --all 2>&1; echo ---; for w in run recheck revalidate reseed test; do echo "== $w"; gh run list --workflow $w.yml --limit 4 2>&1 | head -5; done; echo ---; gh issue list --state open --limit 30 2>&1; gh pr list --state all --limit 5 2>&1, ls state logs; tail -c 1500 logs/runs.jsonl | tail -1 | cut -c1-900; echo; tail -1 logs/rechecks.jsonl | cut -c1-600; git log -3 --format='%h %ad %s' --date=iso -- logs/runs.jsonl state/seen_ids.json, gh api repos/gupta-builds/internship-research-loop/actions/workflows --jq '.workflows[] | "\(.name) \(.state) \(.updated_at)"'; echo ---; gh api "repos/gupta-builds/internship-research-loop/actions/runs?per_page=12" --jq '.workflow_runs[] | "\(.created_at) \(.name) \(.event) \(.conclusion)"'; echo ---; git log -5 --format='%h %ad %s' --date=iso origin/master -- logs/rechecks.jsonl, for id in 315074756 315675907 342320481 367937546 314681321; do echo "== $id"; gh api "repos/gupta-builds/internship-research-loop/actions/workflows/$id/runs?per_page=5" --jq '.total_count, (.workflow_runs[] | "\(.created_at) \(.event) \(.status)/\(.conclusion)")'; done; gh api repos/gupta-builds/internship-research-loop --jq '{visibility, pushed_at, archived, disabled}'; gh api repos/gupta-builds/internship-research-loop/actions/permissions, git log origin/master --since=2026-09-19 --format='%h %ad %an | %s' --date=iso; echo; git log origin/master -1 --format='%h %ad' --date=iso -- logs/runs.jsonl; wc -l logs/runs.jsonl; cat .github/workflows/run.yml, cat core/company_registry.py core/debate.py core/classify.py && cat core/profile.yaml | head -80, grep -n -E '^(def |class |[A-Z_]{4,} *=)' run_pipeline.py | head -120, sed -n 577,602p run_pipeline.py; echo ======; grep -n -i "microsoft" ingestion/posting_page.py | head; echo =====; grep -n "parametrize" tests/test_schema_drift.py | head -3; git show --stat 5b59609 | head -60, sed -n 100,131p run_pipeline.py; sed -n 745,900p run_pipeline.py, echo placeholder, cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/ && python3 - <<'E' import json,re for f in ["[REDACTED].txt","[REDACTED].txt","[REDACTED].txt"]: raw=open(f).read() try: c=json.loads(raw)['content'] except Exception as e: c=raw print("=====",f,len(c)) print(c[:1400].split("tags:")[0][-600:]) parts=re.split(r'\n## (You|Claude)\n',c) # parts: [pre, role, text, role, text...] users=[(parts[i+1]) for i in range(1,len(parts)-1,2) if parts[i]=='You'] claudes=[(parts[i+1]) for i in range(1,len(parts)-1,2) if parts[i]=='Claude'] print("users",len(users),"claude",len(claudes)) for u in users[:6]: print("--USER--",u[:2500].replace("\n\n","\n")) E, cd /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/ && python3 - <<'E' import json,re raw=open("[REDACTED].txt").read() c=json.loads(raw)['content'] parts=re.split(r'\n## (You|Claude)\n',c) claudes=[parts[i+1] for i in range(1,len(parts)-1,2) if parts[i]=='Claude'] for x in claudes: print("--CLAUDE--",len(x)); print(x[:9000]) E, cat .claude/agents/applying.md .claude/skills/tailoring-application/SKILL.md; echo =====CLB; cat .claude/agents/cover-letter-builder.md, cat .cursor/skills/resume-alteration/SKILL.md; echo ====; cat .cursor/skills/cover-letter-alteration/SKILL.md; echo ====; cat .claude/skills/generating-resume-docx/SKILL.md; diff .claude/skills/generating-resume-docx/scripts/generate_resume_docx.py .claude/skills/generating-cover-letter-docx/scripts/generate_cover_letter_docx.py | head -40; cat grade_resume.py | head -30, cat requirements.txt; echo ---; grep -rn "docx" tests/*.py | head -3; echo "--- hardcoded /mnt/d paths:"; grep -rn "/mnt/d" --include=*.py --include=*.md --include=*.yml --include=*.json . 2>/dev/null | grep -v -E '^./(graphify-out|logs|state|\.venv)' | head -12; echo ---; cat README.md; sed -n 1,88p PRD.md | cut -c1-260, head -60 graphify-out/GRAPH_REPORT.md; ls -la graphify-out | head; git log -1 --format=%cd -- graphify-out/.gitignore, gh issue view 11 --json body,title --jq '.title, .body' | head -50; cat .github/workflows/revalidate.yml | head -35; grep -n "ADJACENT_FIELD_COMPANIES" core/relevance.py | head -3, gh label list --limit 50; git show --stat d6bf5ca | tail -5; git show --stat a3664ca | tail -6; git show --stat e11de33 | tail -12
- Tool call tally: Bash (26), mcp__jarvis__vault_list (23), mcp__jarvis__vault_read (31), mcp__jarvis-fs__list_allowed_directories (1), Read (1), ToolSearch (1)

