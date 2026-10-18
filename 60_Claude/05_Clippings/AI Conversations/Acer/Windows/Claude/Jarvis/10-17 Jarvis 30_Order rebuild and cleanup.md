---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Jarvis 30_Order rebuild and cleanup"
started_at: 2026-10-17T17:32:17
ended_at: 2026-10-17T17:41:06
exported_at: 2026-10-18T01:33:09
duration_minutes: 8.8
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: e5420810-3e08-432d-b29a-35be8ea781b4
status: raw
turn_count: 5
tools_used:
  Bash: 5
  Grep: 1
  PowerShell: 5
  Read: 2
tokens:
  input: 50
  output: 26417
  cache_creation: 337599
  cache_read: 1616798
  total: 1980864
cost_usd: null
model:
  - "claude-sonnet-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\00_How This Folder Works.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Note Type Registry.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Jarvis 30_Order rebuild and cleanup

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/model</command-name>
            <command-message>model</command-message>
            <command-args></command-args>

## You

<local-command-stdout>Set model to `Sonnet 5.5` and saved as your default for new sessions[2m[22m
[2m     .claude\settings.json pins [22m`Sonnet 5`[2m — that applies on restart[22m</local-command-stdout>

## You



<pasted_content id="87ad">
The 30_Order rebuild is done. I linted the whole of 30_Order against the new contract: 97.0% of its notes fit (129 of 133), and there are no empty files and no duplicate file names. Nothing was committed by me, though your auto-sync may have committed the changes.

What exists now
- Counts: 30_Order holds 74 Standards, 78 Templates, 49 Workflows, and 76 machine-readable Specs.
- Foundation:
  - The Frontmatter Standard is the one vocabulary: 17 note types and 7 statuses. The Vault Operating System, CLAUDE.md and AGENTS.md now point to it.
  - The Note Kit Standard says how every Standard, Template and Workflow is written.
  - The Conformance Standard defines "fit" as five script-checkable tests plus a mapping check.
  - The Note Type Registry has 77 rows, one per note type, naming its Template, Standard, Workflow and folder.
- Family kits: courses, career, projects, knowledge, operations and navigation, the AI Loop, and the System tooling docs are all written to the contract. Each Standard has a Legacy Shapes table that maps old shapes to the new ones, so any session can upgrade an old note it touches.
- All 14 empty stubs are written, as you chose.
- Renames done: four, using the Obsidian CLI so links followed. They were Graphify Notes Template, Plan Standard, Course Project Standard and Reference Standard.
- Measuring tool: System/vault-lint/ scores every note and reports fit per tier and per family. It also catches dead Dataview paths, which the vault has about 150 of (93 notes).

The baseline: 128 of 5,299 notes in ecause no old note has been touchedyet. To reach 90%:
1. One scripted pass converts the 2,e: generated (about 46% of thevault).
2. A second reviewed dry-run pass stes date placeholders and maps thelegacy type and status values.
3. Every session that opens an olderhe new Conformance on Touch workflow.

I haven't written these scripts. Say

Needs your decision
- Deletes (I did none): Templates/MOC.md, Templates/Career/Internship/Tracking Template.md,
  Workflows/Internship/Application D redirect-stubStandards/Enrich/Tracking Standard.md, and the old Templates/Capability/Synthesis Template.md.
- Resume and cover-letter "How to" s fewer, to delete or fill.
- Cheat notes: whether to write a Cheat Standard.
- Dossiers: let the Frontmatter Stanception, or change the bot thatwrites them.
- Clippings: AGENTS.md says clippingng frontmatter to them needs yourapproval.
- Cut content: the internship bot spom the Notes Standard is saved in the scratchpad (K-career-moved-out.md) and needs a home outside 30_Order.

Edits outside 30_Order I did not make
- The /startday and /closeday skillse the daily template no longer namesthe term in its headings. Tooling edits weren't in your pointer-edit approval.
- Four tooling defects the System fo
  - .mcp.json registers only jarvis.
  - jarvis-cli report writes to the
  - The session-continuity hook isn't in the project settings.
  - The Cursor exporter hardcodes th

One live problem: git-auto-sync has se conflict (latest at 00:03), andyour dashboard banner reports it.

Not yet verified: I couldn't run Dataview, so the Field OS queries (which use this.track[0]) areuntested, and Python isn't usable hememory were read, not run. Three PerClass workflows (CSCI 4061, 4511W, 5304) still fail lint on blank lines and dead links in their bodies, which I left untouched.
</pasted_content id="87ad">


In a previous session, 

<pasted_content id="87ad">
While working on Jarvis’s infrastructure, many core details were established in a different session. I will paste the entire output of that session. It was a discussion about Jarvis’s current status and how we can improve it. Based on that discussion, a rubric‑score design was created to clarify the situation for the AI‑engineer grader.

Now we need to record this information. Several statements from the previous session must be verified. We need extensive cleanup to avoid overloading Jarvis with instructions and rules; we should cut down many standards and templates because we don’t need so many.

We will reduce the groups and families created in the previous session by analyzing each grouping and category for standards and templates. Verify that this session has completed its work and that everything is indeed finished as claimed. Then, based on the other session’s reply, summarize all templates and contents in the 30_order folder. After reviewing every detail, we will take action to reduce the 30_order folder. Please read both replies carefully.
</pasted_content id="87ad">

. 

<pasted_content id="87ad">
1. Do you have harnesses?

Yes. A common 2026 formula is "Agent = Model + Harness": the harness is everything around the model. Jarvis has six of the seven usual layers:

┌─────────────────────┬───────────────────────────────────────────────────────────────────────────┐
│        Layer        │                           What exists in Jarvis                           │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ Instructions        │ CLAUDE.md, AGENTS.md, HUMAN_WRITING, .claude/rules, and 30_Order with 74  │
│ (context            │ Standards, 78 Templates and 49 Workflows                                  │
│ engineering)        │                                                                           │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ Capabilities        │ 11 subagents, 17 commands, about 29 skills                                │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│                     │ A write guard that runs before every write and blocks writes to the root, │
│ Guardrails          │  Archive and Clippings; an internship note guard that runs after writes;  │
│                     │ vault-lint; jarvis-cli health checks                                      │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ Continuity / memory │ A hook that loads a context pack when a session starts and exports the    │
│                     │ transcript when it ends; the session log; 715 captured conversation files │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ Scheduling          │ Git auto-sync every 30 minutes, a headless /weekly-review on Sundays,     │
│                     │ backfill jobs, Syncthing                                                  │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ Tools (MCP)         │ jarvis and the-plan through Obsidian's Local REST API, plus github and    │
│                     │ jarvis-fs                                                                 │
├─────────────────────┼───────────────────────────────────────────────────────────────────────────┤
│ Evaluation          │ Missing. Nothing measures whether an answer from Jarvis is correct. The   │
│                     │ benchmarks table is empty.                                                │
└─────────────────────┴──────────────────────────────────
</pasted_content id="87ad">

, 

<pasted_content id="87ad">
5. Rating, against a professional AI engineer bar

- Harness and reliability design: 8/10. Fail-closed gates, data-drift checks, idempotent state, and no LLM in unattended paths are mature instincts.
- Context engineering: 7/10. It is strong but bloated. 200+ files in 30_Order is expensive for both you and the model to read.
- Retrieval, memory and ML: 2/10. It is designed but not built: no embeddings, no ranking, no learned components.
- Evaluation and measurement: 3/10. Vault-lint measures structure, but nothing measures whether answers are right.
- Overall: a strong new-grad "AI systems builder", ahead of most undergraduates on harnesses and behind on ML depth and measured results. Hiring managers look for numbers, and Jarvis doesn't produce any yet.

6. What the you of five years from now would build, and why

Your stated goal (Engineer Edge Roadmap) is to be the engineer who "can turn messy AI-assisted code into a designed, tested, observable, explainable system." Jarvis is the right lab for that, but only if it produces measured artifacts and not more structure. Learn in this order, and build each step into jarvis-memory:

1. Retrieval basics: BM25 keyword search, embeddings, hybrid search, reranking, chunking. Fill chunks and add jarvis_semantic_search.
2. Evals. Use Anthropic's "Demystifying evals" post: code graders, model graders, pass@k vs pass^k. Write 30 to 50 real questions with known answers from your own notes. Your CSCI 4061 quiz is a ready-made set.
3. Graph retrieval. Load wikilinks and frontmatter edges into links, then rank with Personalized PageRank as HippoRAG 2 does. Most GraphRAG systems spend LLM calls building a graph. You already have one for free, which makes this a genuinely distinctive project.
4. Temporal memory. Zep/Graphiti record when each fact was valid, so a fact that stops being true is marked invalid, not deleted. That fits your plans, decisions and sync state, which change over time.
5. Long-running harnesses. Anthropic's write-up uses a progress file, a feature list and git history as the agent's memory across sessions. Your session log already plays that role.
6. Neural network fundamentals, then graph neural networks. Learn backpropagation, embeddings and transformers first. Then try a link-prediction experiment: hide some real wikilinks and test whether a model can predict them. That is a real ML experiment on your own data.
</pasted_content id="87ad">


## Claude

I'll start by checking the claimed counts and structure of `30_Order` against what's on disk.

Standards, Templates and Workflows counts match (74, 78, 49). There's no `Specs` folder though, and `System` holds 66 files that weren't mentioned. I'll look closer.

Still working: the vault-wide lint contradicts the "97%" headline, so I'm pulling the full per-family counts to see which Standards cover real notes.

The other session's counts hold up, but the "97% fit" headline doesn't. I changed nothing and wrote no files. I ran `vault-lint` and counted what's on disk.

## What checks out

| Claim | Result |
|---|---|
| 74 Standards, 78 Templates, 49 Workflows | Exact match. |
| 76 machine-readable Specs | Real, but they are JSON blocks embedded in 58 Standards. There is no Specs folder or file set. |
| 97.0% fit (129 of 133) | Reproduced. See the next section for why it misleads. |
| No empty files | True. |
| Nothing committed by that session | True. Auto-sync made the last `30_Order` commit (05:33 today). |
| 11 subagents, 17 commands, 29 skills, 715 conversation files | All exact. |
| `.mcp.json` registers only `jarvis` | True. I printed key names only. The other servers in the second reply (`the-plan`, `github`, `jarvis-fs`) must be configured somewhere else. |

## What doesn't hold up

- **The 97% is the kit grading itself.** Those 133 notes are the Standards and Workflows, checked against the Standard that defines them. Across the whole vault the score is **135 of 5,299 = 2.5%**. Tier 3 (generated notes) is at 0%, and the other 2,919 notes (55%) map to no family at all. The other session's "128" is close, but it was framed as a footnote.
- **"No duplicate file names" is false.** `README.md` appears 6 times under `System/`. Near-duplicates also exist: two MOC templates, two Synthesis templates, two Tracking templates, two Project templates and three Output templates.
- **A stray stub remains.** `Application Document Preparation 1.md` is a 562-byte legacy file, still flagged as legacy by lint.
- **12 lint warnings are open.** They include three Periodic Review families with no registry row, and templates that have no `type` or carry body text.
- **`30_Order` doesn't match its own description.** It says it holds "the shape of every note and nothing else". In fact `System/` holds 66 files that aren't notes: a 3 MB `git-auto-sync.log`, a 2.6 MB `registry.sqlite`, a 213 KB `package-lock.json`, retired session JSONs, `.vbs` launchers and Python and PowerShell scripts.
- **The folder guide is stale.** It says `Operations/` and `Projects/` "are created when needed", but they already exist.

## Size of the kit

| Part | Files | Size |
|---|---|---|
| Standards | 74 | about 335 KB |
| Workflows | 49 | about 141 KB |
| Templates | 78 | about 62 KB |
| **Kit total** | 201 | **about 540 KB (roughly 130k tokens)** |

The three per-class workflows are 10 to 15 KB each. They are the largest notes in the kit, and they still fail lint.

## What is in `30_Order`, with how many real notes each kit covers

**Foundation (11 Standards at root).** These are Frontmatter, Note Kit, Conformance, Editing, Decoration, Generated Output, Log, MOC, Plan, Project and System Component. Frontmatter, Note Kit and Conformance are the real core.

**Courses (16 Standards, 15 class Templates, 17 Workflows).** One kit per class note type. Instances:
- Well used: concept 222, textbook 81, week 80, homework 46, board 20, discussion 13, subboard 10, control 9.
- Barely used: lab 4, textbook-map 5, track 5, exam-material 6, audit 2, and exam 1.

**Internship and career (12 Standards, 15 Templates, 8 Workflows).**
- Dossiers: 354 notes, bot-written, 0% fit.
- Trackers 32, programs 31 and contacts 30.
- Used once or never: applying 1, deadline-tracker 1, career-fair 4, and cover-letter, job-company, linkedin-post and cheat at 0.

**Enrich (11 Standards).**
- Reference 73, source-summary 45 and repo-card 94.
- The two writing Standards duplicate `HUMAN_WRITING.md`.
- A 902-byte Tracking Standard is a redirect stub.
- Review, Audit and Capability Review are three Standards for about 10 notes in total.

**Ingestion (5 Standards, 7 Workflows).** Action, Brief, Clipping, Humanized Writing and PDF Extraction.

**AI Loop (10 Standards, 9 Templates, 5 Toolkit Workflows).**
- Conversations: 492 notes, 0% fit.
- Tool-setup 32, log 3.
- Graphify Notes has 1 note, and the weekly review has 1.

**Projects (5 Standards, 7 Templates).**
- Machine-runbook 91, code-mirror 28, agent-prompt 7, technical-concept 43.
- Spec 3 and plan 4.

**Operations (4 Standards).**
- Daily note 23.
- Dashboard 83.
- Field OS 5, plus depth-ladder 5 and question-bank 5.
- Periodic notes 7.

**Other Templates.** There are 10 frontmatter starters, 4 daily and periodic templates, and 10 Capability templates. Roughly half of the Capability templates duplicate templates in other folders.

## Where the cuts should come from (preliminary)

I haven't acted on any of these. They are candidates for you to approve.

1. **Delete kits with zero or one instance.** This covers cover-letter, job-company, linkedin-post, cheat, course-archive, tool-map, applying, deadline-tracker, graphify-note, prompt-queue and output-bullet.
2. **Merge the courses Standards.** The 16 become one "course note" Standard with a short table of kinds. Keep Concept and Weekly detail only if you still write them.
3. **Merge Internship from 12 Standards to about 3.** Keep tracker, program and contact. Treat dossiers as bot output and exclude them from fit.
4. **Merge Enrich.** Fold the two writing Standards into `HUMAN_WRITING.md`, and merge Review, Audit and Capability Review into one. Delete the Tracking stub.
5. **Merge AI Loop from 10 Standards to about 3.**
6. **Collapse the Templates.** Remove the duplicates above and shrink the 10 frontmatter starters to 3.
7. **Cut Workflows from 49 to about 12.** Drop the 3 huge per-class files, which belong in the course skills, and drop "Application Document Preparation 1". `Internship - Design Rationale` (7 KB) is a rationale note, not a workflow.
8. **Move `System/` out of `30_Order`.** Caution: git-auto-sync, the Cursor exporter and the hooks have hardcoded paths into it. Moving it breaks the scheduled tasks unless the paths are updated at the same time.
9. **Rethink the fit metric.** Exclude generated notes and dossiers and report fit only on notes you write by hand. Otherwise the vault-wide number stays near 2%. The honest aim is a small kit that covers most of the notes you actually write.

Rough target: about 20 to 25 Standards, 25 to 30 Templates and 12 Workflows. That is about 55 files instead of 201.

## Next step

Tell me which of items 1 to 9 to proceed with. I'd start with 1, 4 and 6, because they are pure deletes and merges with no path risk. Item 8 should be its own step. Before any delete I'd check backlinks with the Obsidian CLI so wikilinks don't break.

I can also write this up as a note if you want it kept. I haven't, per your no-extra-files rule.

### Tool Calls

- `PowerShell` -- `{"command":"cd \"D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\"; Get-ChildItem -Recurse -File | Group-Object { ($_.FullName.Substring((Get-Location).Path.Length+1) -split \u0027\\\\\u0027)[0] } | Select Name,Count | Format-Table -AutoSize; \"Total:\"; (Get-ChildItem -Recurse -File).Count; \"By ext:\"; Get-ChildItem -Recurse -File | Group-Object Extension | Select Name,Count | Format-Table -AutoSize","description":"Count files in 30_Order by folder and extension"}`
- `PowerShell` -- `{"command":"cd \"D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\"; foreach($top in \u0027Standards\u0027,\u0027Templates\u0027,\u0027Workflows\u0027,\u0027Specs\u0027){ if(Test-Path $top){ \"== $top\"; Get-ChildItem $top -Directory | ForEach-Object { $n=(Get-ChildItem $_.FullName -Recurse -File).Count; $b=(Get-ChildItem $_.FullName -Recurse -File | Measure-Object Length -Sum).Sum; \"{0,-40} {1,4} files {2,8} bytes\" -f $_.Name,$n,$b }; \"  (loose files at top: \" + (Get-ChildItem $top -File).Count + \")\" } }; Get-ChildItem -File | Select Name,Length","description":"Per-family file counts and sizes in 30_Order"}`
- `PowerShell` -- `{"command":"cd \"D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\"; Get-ChildItem Standards -Recurse -File | ForEach-Object { \"{0,6}  {1}\" -f $_.Length, $_.FullName.Substring((Get-Location).Path.Length+1) }; \"---- spec-like:\"; Get-ChildItem -Recurse -File | Where-Object { $_.Name -match \u0027spec\u0027 } | Select -First 20 FullName","description":"List all Standards files with sizes, look for Specs"}`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Note Type Registry.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\00_How This Folder Works.md`
- `PowerShell` -- `{"command":"cd \"D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\"; foreach($t in \u0027Templates\u0027,\u0027Workflows\u0027){ \"===== $t\"; Get-ChildItem $t -Recurse -File | ForEach-Object { \"{0,6}  {1}\" -f $_.Length, $_.FullName.Substring((Get-Location).Path.Length+1) } }","description":"List Templates and Workflows files with sizes"}`
- `PowerShell` -- `{"command":"cd \"D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\"; \"===== System\"; Get-ChildItem System -Recurse -File | ForEach-Object { \"{0,7}  {1}\" -f $_.Length, $_.FullName.Substring((Get-Location).Path.Length+1) }; \"--- empty md files:\"; Get-ChildItem -Recurse -File -Filter *.md | Where-Object { $_.Length -lt 50 } | Select FullName; \"--- duplicate md names:\"; Get-ChildItem -Recurse -File -Filter *.md | Group-Object Name | Where-Object Count -gt 1 | Select Name,Count","description":"List System folder; check empty and duplicate files"}`
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; echo "agents: $(ls .claude/agents 2>/dev/null | wc -l)"; echo "commands: $(ls .claude/commands 2>/dev/null | wc -l)"; echo "skills dirs/files:"; find .claude/skills -maxdepth 2 -name 'SKILL.md' 2>/dev/null | wc -l; find .claude/skills -maxdepth 1 -type f 2>/dev/null | wc -l; echo "conversation files:"; find "60_Claude/05_Clippings/AI Conversations" -type f -name '*.md' 2>/dev/null | wc -l; echo "--- git"; git log --oneline -3; git status --short | head; echo "--- last commits touching 30_Order"; git log --oneline -5 -- 30_Order; echo "--- node?"; which node python python3 2>&1 | head`
```
agents: 11
commands: 17
skills dirs/files:
6
0
conversation files:
715
--- git
1773f7e2 Auto-sync: 2026-10-17 17:33,  2 files changed, 2 insertions(+), 2 deletions(-)
46c3d9d6 Auto-sync: 2026-10-17 16:33,  2 files changed, 2 insertions(+), 2 deletions(-)
20581b5c Auto-sync: 2026-10-17 15:33,  2 files changed, 2 insertions(+), 2 deletions(-)
--- last commits touching 30_Order
1de66330 Auto-sync: 2026-10-17 05:33,  7 files changed, 124 insertions(+), 86 deletions(-)
74c2a685 Auto-sync: 2026-10-17 05:03,  2 files changed, 72 insertions(+), 96 deletions(-)
06728e6d Auto-sync: 2026-10-17 00:33,  97 files changed, 2825 insertions(+), 1389 deletions(-)
8f9adca9 Auto-sync: 2026-10-17 00:03,  10 files changed, 36 insertions(+), 11 deletions(-)
abcc516a Auto-sync: 2026-10-16 20:03,  33 files changed, 1528 insertions(+), 595 deletions(-)
--- node?
/c/Program Files/nodejs/node
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python3
```
- `Grep` -- pattern `^```(yaml|json)? ?spec|^## Spec|^## Machine|spec_id|^spec:` path `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards`
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; find .claude/skills -name 'SKILL.md' | wc -l; find .claude/skills -type f -name '*.md' | wc -l; ls .claude/skills | head -40; echo ---; sed -n 1,60p "30_Order/System/vault-lint/Vault Lint.md"`
```
6
25
challenge
class-csci4041
closeday
copilot-fetch-x
copilot-read-pdf
copilot-web-fetch
copilot-web-search
copilot-youtube-transcript
distill-note
ideas
ingesting-clipping
json-canvas
llm-council
mcp-hub
mentorship
note-to-actions
obsidian-bases
obsidian-cli
obsidian-markdown
openartifacts-publish
ops
plan-it
project-career
remove-ai-slop
startday
tag-monthly
trace-goal
transcript-to-brief
weekly-review
---
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - tooling
system_kind: spec
trigger: On demand with node, in the weekly review, and after any change to a Standard.
owner: Anant, and any session that changes a Standard or a Spec block.
notes:
  - "[[Conformance Standard]]"
  - "[[Note Kit Standard]]"
  - "[[Conformance on Touch]]"
---
# Vault Lint
## Purpose
Measures how many notes fit their Standard and checks that the kit files (Standards, Templates, Workflows) agree with each other. Without it the goal of 90% fit has no number, and a Standard can drift from its Template unnoticed.
## Trigger
Run by hand: `node vault-lint.js` from this folder. The weekly review records the fit percentage. Run `--kit` after any change to a Standard, Template, or Workflow. No scheduled task exists yet.
## Inputs and Outputs
Reads every `.md` file under the vault root (found three folders up from the script), the Spec blocks in `30_Order/Standards/`, the vocabulary tables in [[Frontmatter Standard]], and `vault-lint.config.json`. It writes nothing into the vault. `--json FILE` writes a report wherever you point it, which should be an ignored or scratch folder.
```powershell
node vault-lint.js                                  # fit %, by tier, by family, top failure reasons
node vault-lint.js --path 30_Order/Standards/       # one folder
node vault-lint.js --family course-concept --list 20   # failing notes in a family
node vault-lint.js --specs                          # Spec blocks, names, empty files
node vault-lint.js --kit                            # Standard, Template, Workflow consistency
```
## State
None. `vault-lint.config.json` is tracked source: `out_of_scope`, `tier4`, and `template_paths` regular expressions. The type and status vocabulary is read from the tables in [[Frontmatter Standard]]; change the tables, not the script.
## Failure Behavior
It never edits a note. A Spec block that is not valid JSON is reported as an error, and notes of that family then fall to `unmapped`. `--kit` exits with status 1 when it finds an error, so it can gate a commit.
## Verify
Run `node vault-lint.js --specs` and compare the Spec count with the number of Spec blocks you wrote. Lint a note you know fits and one you know does not. The scanned count plus the excluded counts equals the number of `.md` files under the root.
## Retire
Delete this folder in one commit and remove the lint step from the weekly review. The fit number then goes back to being unmeasured.
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; echo "=== specs"; node vault-lint.js --specs 2>&1 | head -40; echo "=== path 30_Order"; node vault-lint.js --path 30_Order/ 2>&1 | head -60; echo "=== kit"; node vault-lint.js --kit 2>&1 | head -50`
```
=== specs
Specs loaded: 76 from 58 Standards. Vocabulary parsed: true
WARN  30_Order/Standards/Operations/Periodic Review Note Standard.md  family periodic-review-note-weekly has no row in Note Type Registry
WARN  30_Order/Standards/Operations/Periodic Review Note Standard.md  family periodic-review-note-monthly has no row in Note Type Registry
WARN  30_Order/Standards/Operations/Periodic Review Note Standard.md  family periodic-review-note-yearly has no row in Note Type Registry
WARN  30_Order/Templates/Capability/Depth Ladder Template.md  template section "Compare and Discriminate" has body text beyond a comment
WARN  30_Order/Templates/Career/Internship/Job & Company Template.md  template has no type
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Morning Plan" has body text beyond a comment
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Daily Wins" has body text beyond a comment
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Daily Floor" has body text beyond a comment
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Productivity" has body text beyond a comment
WARN  30_Order/Templates/Frontmatter/For Everything.md  template has no type
WARN  30_Order/Workflows/Internship/Application Document Preparation 1.md  legacy Workflow (no system_kind)
WARN  30_Order/Workflows/Toolkit/Graphify Folders.md  serves does not point back to Generated Output Standard

0 errors, 12 warnings
=== path 30_Order
Scanned 133 notes in scope (excluded: 1 out of scope, 1468 tier 4, 78 templates). Specs: 76. Vocabulary parsed: true
FIT: 129/133 = 97.0%

By tier:
  tier 1: 116/117 = 99.1%
  tier 2: 13/16 = 81.3%

By family (fit / total, near-fit, failing checks):
  family-standard                 57/57    100.0%  near    0  
  workflow                        42/42    100.0%  near    0  
  policy-standard                 17/17    100.0%  near    0  
  system-guide                     6/9      66.7%  near    1  F3:2 F5:3
  system-component                 7/7     100.0%  near    0  
  (unmapped)                       0/1       0.0%  near    1  F6:1

Top failure reasons:
      3  5:extra-blank-lines
      2  3:dead-body-links
      1  6:unmapped
=== kit
Specs loaded: 76 from 58 Standards. Vocabulary parsed: true
WARN  30_Order/Standards/Operations/Periodic Review Note Standard.md  family periodic-review-note-weekly has no row in Note Type Registry
WARN  30_Order/Standards/Operations/Periodic Review Note Standard.md  family periodic-review-note-monthly has no row in Note Type Registry
WARN  30_Order/Standards/Operations/Periodic Review Note Standard.md  family periodic-review-note-yearly has no row in Note Type Registry
WARN  30_Order/Templates/Capability/Depth Ladder Template.md  template section "Compare and Discriminate" has body text beyond a comment
WARN  30_Order/Templates/Career/Internship/Job & Company Template.md  template has no type
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Morning Plan" has body text beyond a comment
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Daily Wins" has body text beyond a comment
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Daily Floor" has body text beyond a comment
WARN  30_Order/Templates/Enumerate/Better Today.md  template section "Productivity" has body text beyond a comment
WARN  30_Order/Templates/Frontmatter/For Everything.md  template has no type
WARN  30_Order/Workflows/Internship/Application Document Preparation 1.md  legacy Workflow (no system_kind)
WARN  30_Order/Workflows/Toolkit/Graphify Folders.md  serves does not point back to Generated Output Standard

0 errors, 12 warnings
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; node vault-lint.js 2>&1 | head -50; cd ../../..; echo; echo "=== skill list in .claude/skills (names only):"; ls .claude/skills | wc -l; echo "=== MCP server names (keys only):"; node -e "const j=require('./.mcp.json');console.log(Object.keys(j.mcpServers||j))" 2>&1 | head`
```
Scanned 5299 notes in scope (excluded: 1 out of scope, 1468 tier 4, 78 templates). Specs: 76. Vocabulary parsed: true
FIT: 135/5299 = 2.5%

By tier:
  tier 1: 122/1916 = 6.4%
  tier 2: 13/947 = 1.4%
  tier 3: 0/2436 = 0.0%

By family (fit / total, near-fit, failing checks):
  (unmapped)                       0/2919    0.0%  near   61  F1:2753 F3:296 F5:338 F6:2919
  ai-conversation-export           0/492     0.0%  near    0  F1:492 F3:96 F5:492
  internship-dossier               0/354     0.0%  near    0  F1:354 F5:4 F6:354
  course-concept                   0/222     0.0%  near    4  F1:218 F2:208 F3:105 F4:85 F5:201
  repo-card                        0/94      0.0%  near    0  F1:94 F2:45 F3:3 F5:93 F6:94
  machine-runbook                  0/91      0.0%  near    0  F1:91 F2:91 F3:2 F5:71 F6:91
  project                          0/86      0.0%  near    0  F1:86 F2:84 F3:6 F5:50 F6:86
  dashboard                        0/83      0.0%  near    2  F1:83 F3:40 F4:59 F5:73 F6:10
  course-textbook                  0/81      0.0%  near    0  F1:81 F2:66 F3:41 F5:46 F6:81
  course-week                      0/80      0.0%  near    0  F1:80 F2:56 F3:35 F5:60 F6:80
  reference-resource               0/73      0.0%  near    2  F1:73 F3:11 F4:7 F5:53 F6:60
  family-standard                 57/57    100.0%  near    0  
  moc                              5/49     10.2%  near    2  F1:39 F2:41 F3:7 F5:36 F6:4
  course-homework                  0/46      0.0%  near    0  F1:46 F2:39 F3:29 F5:41 F6:46
  source-summary                   0/45      0.0%  near    9  F1:45 F2:25 F3:25 F5:9
  technical-concept                0/43      0.0%  near    0  F1:42 F2:43 F3:8 F5:36
  workflow                        42/42    100.0%  near    0  
  internship-tracker               0/32      0.0%  near   16  F1:32 F3:14 F4:3
  tool-setup                       0/32      0.0%  near    0  F1:32 F2:24 F3:2 F5:1 F6:32
  internship-program               0/31      0.0%  near    0  F1:31 F2:26 F3:3 F5:1 F6:31
  internship-contact               0/30      0.0%  near   10  F1:30 F3:5 F4:12 F5:10
  code-mirror-doc                  0/28      0.0%  near    0  F1:28 F5:28 F6:28
  clipping                         0/24      0.0%  near    1  F1:24 F6:23
  daily-note                       0/23      0.0%  near    0  F1:23 F3:6 F5:23 F6:23
  course-board                     0/20      0.0%  near    0  F1:20 F2:20 F3:7 F4:1 F5:14 F6:20
  policy-standard                 17/17    100.0%  near    0  
  distilled                        0/14      0.0%  near    0  F1:14 F2:14 F3:4 F5:12 F6:14
  course-discussion                0/13      0.0%  near    0  F1:13 F2:11 F5:12 F6:13
  course-project-companion         0/12      0.0%  near    0  F1:12 F3:9 F5:10 F6:11
  course-subboard                  0/10      0.0%  near    0  F1:10 F2:7 F3:1 F5:1 F6:10
  course-control                   0/9       0.0%  near    0  F1:9 F3:1 F5:8 F6:9
  course-project                   0/9       0.0%  near    0  F1:9 F2:8 F3:5 F4:4 F5:6 F6:9
  system-guide                     6/9      66.7%  near    1  F3:2 F5:3
  course-preparation               0/7       0.0%  near    0  F1:7 F2:1 F3:3 F5:3 F6:7
  system-component                 7/7     100.0%  near    0  
  agent-prompt                     0/7       0.0%  near    0  F1:7 F2:3 F5:7 F6:7
  plan                             0/6       0.0%  near    2  F1:4 F2:4 F3:1 F4:1 F5:6
  course-exam-material             0/6       0.0%  near    0  F1:6 F2:6 F3:1 F5:5 F6:6
  audit-report                     0/6       0.0%  near    0  F1:6 F2:6 F3:1 F4:2 F5:5 F6:6
  course-textbook-map              0/5       0.0%  near    0  F1:5 F2:4 F5:2 F6:5
  course-track                     0/5       0.0%  near    0  F1:5 F2:2 F5:3 F6:5

=== skill list in .claude/skills (names only):
29
=== MCP server names (keys only):
[ 'jarvis' ]
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; node vault-lint.js 2>&1 | sed -n '/By family/,/Top failure/p' | tail -n +44; echo ...; node vault-lint.js 2>&1 | sed -n '/Top failure/,$p' | head -20; cd ../..; echo "== sizes (KB)"; for d in Standards Templates Workflows System; do echo "$d: $(find $d -type f -name '*.md' -print0 | xargs -0 cat | wc -c) bytes md"; done`
```
  depth-ladder                     0/5       0.0%  near    0  F1:5 F2:5 F3:1 F5:5 F6:5
  field-os                         0/5       0.0%  near    0  F1:5 F5:5 F6:5
  question-bank                    0/5       0.0%  near    0  F1:5 F5:5 F6:5
  periodic-review-note-weekly      0/4       0.0%  near    0  F1:4 F5:4 F6:4
  course-lab                       0/4       0.0%  near    0  F1:4 F5:1 F6:4
  project-plan                     0/4       0.0%  near    0  F1:4 F2:4 F5:4 F6:4
  career-fair                      0/4       0.0%  near    1  F1:4 F5:3
  synthesis                        0/4       0.0%  near    0  F1:4 F2:4 F3:1 F5:3 F6:4
  capability-review                0/4       0.0%  near    0  F1:4 F5:4 F6:4
  project-spec                     0/3       0.0%  near    0  F1:3 F2:3 F3:1 F5:3 F6:3
  log                              0/3       0.0%  near    0  F1:3 F3:1 F5:2 F6:3
  output-story                     0/3       0.0%  near    0  F1:3 F4:1 F5:2 F6:3
  intake-log                       0/2       0.0%  near    0  F1:2 F5:1 F6:2
  periodic-review-note-yearly      0/2       0.0%  near    0  F1:2 F5:1 F6:2
  identity-note                    0/2       0.0%  near    0  F1:2 F5:2 F6:2
  output-one-pager                 0/2       0.0%  near    0  F1:2 F4:1 F6:2
  prompt-queue                     0/2       0.0%  near    0  F1:2 F5:2 F6:2
  mentorship-meeting               0/2       0.0%  near    0  F1:2 F2:2 F5:2 F6:2
  course-audit                     0/2       0.0%  near    0  F1:2 F2:2 F5:2 F6:2
  internship-loop-review-monthly     0/2       0.0%  near    0  F1:2 F2:2 F3:1 F5:1 F6:2
  internship-loop-review-weekly     0/2       0.0%  near    0  F1:2 F2:2 F3:1 F6:2
  action                           1/1     100.0%  near    0  
  deadline-tracker                 0/1       0.0%  near    0  F1:1 F3:1 F5:1 F6:1
  periodic-review-note-monthly     0/1       0.0%  near    0  F1:1 F5:1 F6:1
  internship-applying              0/1       0.0%  near    0  F1:1 F2:1 F3:1 F6:1
  brief                            0/1       0.0%  near    0  F1:1 F6:1
  output-bullet                    0/1       0.0%  near    0  F1:1 F5:1 F6:1
  course-exam                      0/1       0.0%  near    0  F1:1 F2:1 F6:1
  ai-review-weekly                 0/1       0.0%  near    0  F1:1 F3:1 F6:1
  graphify-note                    0/1       0.0%  near    0  F1:1 F2:1 F5:1 F6:1

Top failure reasons:
...
Top failure reasons:
   5351  1:missing-key
   3633  2:missing-heading
   2919  6:unmapped
   2436  1:legacy-generated-type
   1811  5:extra-blank-lines
   1235  6:legacy-shape
   1114  1:status-off-vocab
    804  5:blank-after-frontmatter
    593  3:dead-body-links
    507  5:hr-in-body
    462  1:no-type
    459  5:trailing-blank
    437  1:hash-in-tags
    280  1:empty-key
    265  1:bom
== sizes (KB)
Standards: 334915 bytes md
Templates: 62052 bytes md
Workflows: 140746 bytes md
System: 35705 bytes md
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; echo "agents: $(ls .claude/agents 2>/dev/null | wc -l)"; echo "commands: $(ls .claude/commands 2>/dev/null | wc -l)"; echo "skills dirs/files:"; find .claude/skills -maxdepth 2 -name 'SKILL.md' 2>/dev/null | wc -l; find .claude/skills -maxdepth 1 -type f 2>/dev/null | wc -l; echo "conversation files:"; find "60_Claude/05_Clippings/AI Conversations" -type f -name '*.md' 2>/dev/null | wc -l; echo "--- git"; git log --oneline -3; git status --short | head; echo "--- last commits touching 30_Order"; git log --oneline -5 -- 30_Order; echo "--- node?"; which node python python3 2>&1 | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis"; find .claude/skills -name 'SKILL.md' | wc -l; find .claude/skills -type f -name '*.md' | wc -l; ls .claude/skills | head -40; echo ---; sed -n 1,60p "30_Order/System/vault-lint/Vault Lint.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; echo "=== specs"; node vault-lint.js --specs 2>&1 | head -40; echo "=== path 30_Order"; node vault-lint.js --path 30_Order/ 2>&1 | head -60; echo "=== kit"; node vault-lint.js --kit 2>&1 | head -50`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; node vault-lint.js 2>&1 | head -50; cd ../../..; echo; echo "=== skill list in .claude/skills (names only):"; ls .claude/skills | wc -l; echo "=== MCP server names (keys only):"; node -e "const j=require('./.mcp.json');console.log(Object.keys(j.mcpServers||j))" 2>&1 | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/vault-lint"; node vault-lint.js 2>&1 | sed -n '/By family/,/Top failure/p' | tail -n +44; echo ...; node vault-lint.js 2>&1 | sed -n '/Top failure/,$p' | head -20; cd ../..; echo "== sizes (KB)"; for d in Standards Templates Workflows System; do echo "$d: $(find $d -type f -name '*.md' -print0 | xargs -0 cat | wc -c) bytes md"; done`


