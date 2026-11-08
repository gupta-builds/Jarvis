---
type: project
status: active
created: 2026-11-07
updated: 2026-11-07
tags:
  - jarvis
  - order
  - standards
  - build-record
project_kind: spec
next: Run the Workflow pass from the handoff table in Current State, then clear the 8 kit warnings, in a session that starts by reading this note.
related_progress:
  - '[[Builds - Jarvis]]'
  - '[[Jarvis Build History - July to October 2026]]'
  - '[[Jarvis Dashboard Build Record]]'
notes:
  - '[[00_How This Folder Works]]'
  - '[[Note Type Registry]]'
  - '[[Note Kit Standard]]'
  - '[[Building a Note Kit]]'
---
# Jarvis Order Rebuild Design
## What This Is
==This is the single record of the November 2026 rebuild of `30_Order`: the Templates, System and Standards passes, every decision taken in them, the research behind the decisions, the measured result, and what the next build starts from.==
It exists so a later session does not rediscover or reopen anything here. Read it before touching `30_Order`. The folder map is [[00_How This Folder Works]], the family index is [[Note Type Registry]], and the rules for the files themselves are [[Note Kit Standard]]. This note owns the history and the reasons.
### The stack and the one idea
Every note starts from a Template, follows its Standard, and runs through its Workflow. System documents the tooling that checks and runs all of it. The idea behind the rebuild: the Standard is the one note an AI follows to write a note type, as `AGENTS.md` and `CLAUDE.md` are the notes that govern writing in general. A Standard plus its Template should produce a note that passes lint and needs about 5% of edits from the owner.

| Layer | Owns | Does not own | State on 2026-11-07 |
|---|---|---|---|
| Templates | Shape: the Spec's keys and headings, one comment line each, no example prose | Rules, examples, process | Done (Templates pass) |
| System | Tooling: lint, git, sync, memory, scripts, one record per component | Note content | Done (System pass, three rounds) |
| Standards | What the note is, what each section holds, every rule, existing notes of the family, old shapes | Process steps, triggers, when and where | Done for non-course Standards (this record) |
| Workflows | When a note is made, where it goes, how it closes, the one core thing, in plain words | Rules and shapes | Next pass. Handoff below |
| Courses | Class note Standards, Templates, Workflows | n/a | Handled separately and later. Untouched by every pass here |
## Current State
Measured on 2026-11-07 with `node vault-lint.js` from `30_Order/System/vault-lint`.

| Measure | Value |
|---|---|
| Whole-vault fit | 252 of 5,647 notes (4.5%). It was 255 of 5,645 before the Standards pass; the three removed Standards were passing notes |
| `--kit` | 0 errors, 8 warnings (it was 11 on 2026-11-06). Listed under Open Questions |
| `--path 30_Order/Standards` | 71 of 71 (100%): 55 non-course plus 16 course Standards |
| Non-course Standards | 55: 41 family, 14 policy (it was 58: 41 family, 17 policy) |
| Spec blocks | Identical to commit `25a1e7a5` in all 55 surviving non-course Standards (compared by script on 2026-11-07) |
| Gold Standard Examples that resolve | 38 (it was 37) |
| Gold Standard Examples that pass their own family's lint | 13 (it was 4) |
### Timeline
| When | Pass | What happened |
|---|---|---|
| Before 2026-11-04 | Templates | 67 Template files restructured to the Note Kit contract. The `Frontmatter/` Template folder deleted. The Templater folder rules (27) applied so a new file in a folder gets its Template. The Dashboard Template created. The individual days were not logged; Standards last updated on 2026-10-16 to 10-29 predate it |
| 2026-11-04 to 11-05 | System, round 1 to 3 | Git moved to `master` and pushed, `infra/cross-laptop-sync` deleted after an ancestor check. `check-syncthing-status.ps1` fixed for a flapping 8384 socket. Six same-named READMEs renamed, links repointed, and the lint duplicate-name check now covers System. `jarvis-cli` and the memory registry fixed. `order-health.js` gained two sections. Weekly review Step 7.7 wired. Session-log rule unified (below). Hardening scripts added for `git-auto-sync`. Full account: the 2026-11-05 entry in `60_Claude/07_AI_Information/Session Logs/log.md` and [[Vault Lint]] |
| 2026-11-06 | Standards research | Survey and measurement of the 58 non-course Standards, a research pass over the sources below, and correction of the descriptive notes. No Standard rewritten. The new-session prompt was written |
| 2026-11-07 | Standards rebuild | A separate session wrote the pilot (Brief Standard), stopped at a gate, took the owner's answers, then rewrote all 55 non-course Standards in seven batches |
| 2026-11-07 | Documentation | This record, and the notes listed under Where Things Are Written |
### What the research found
The survey (2026-11-06) found the Standards structurally valid but thin. They parsed and all linted at 100%, yet they told an AI little. Only about 12 gave a count of existing notes, about 9 had a right-and-wrong example, none gave a reason for a rule, 21 named no Gold Standard Example, and only 4 of the 37 examples that resolved passed their own family. Every Standard sat just under 700 prose words.
The pilot session then tested the word-cap hypothesis and corrected it. The cap was not binding for most Standards (median 409 prose words, only 4 between 600 and 700). The thinness was missing elements, and adding them cost 100 to 250 words per Standard, so the cap blocked the fix. Tables were exempt, so content had been moved into them.
Sources read, with the rule each gave:

| Source | Rule taken |
|---|---|
| Anthropic, Skill authoring best practices (`platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices`) | Add only what the model does not know. Match strictness to fragility: a strict template where the format is exact. Input and output example pairs convey style better than prose. Use validate, fix, repeat loops. One term for one thing. Keep references one level deep |
| Anthropic, Effective context engineering (`anthropic.com/engineering/effective-context-engineering-for-ai-agents`) | Instructions at the right altitude: neither brittle nor vague. Organize into distinct sections. Minimal does not mean short. Curate a few canonical examples, not a list of edge cases |
| Anthropic, Prompting Claude Sonnet 5.5 (`platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`) | State scope literally, add a "stop and report when done" line, require real verification, no subagents for simple work, ask before destructive actions. It says nothing on reasons or examples, so those rest on the two pages above |
| MDN, Page types (`developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Page_structures/Page_types`) | One template per page type, with hints on how to fill each part |
| Diátaxis, Reference and How-to guides (`diataxis.fr/reference/`, `diataxis.fr/how-to-guides/`) | Reference only describes and states rules. It holds no opinions, steps or recipes. Steps belong to a how-to guide. This is why Standards hold rules and Workflows hold process |
| Obsidian Help, Properties | Supports quoted wikilinks and bare dates in frontmatter, which the Standards already follow |
| GOV.UK content design, content types | Only the "choose a content type" page was read: one content type per purpose |
### Decisions
Each was taken on the date shown and is final until the owner reopens it. The pilot gate was the only point where the rebuild waited for the owner.

| # | Decision | Reason | Date |
|---|---|---|---|
| 1 | One anatomy for every family Standard: an identity table (Allowed folders, File name, Kind, Status) under the Spec; per section five bullets (Write, Length, Never, Right, Wrong); a Rules table (Rule, Why, Enforced by); Legacy Shapes with measured counts; Done Conditions; a Gold Standard Example with a table of the family's notes | The thinness was missing elements, not words | 11-07 |
| 2 | No new `##` heading. The five Spec headings stay: Spec, Headings, Legacy Shapes, Done Conditions, Gold Standard Example | The Template and the linter expect exactly these | 11-07 |
| 3 | Policy Standards use the Rules table, an example for each judgment call, and a gold section that says what would qualify | Policies have no Spec or instance | 11-07 |
| 4 | Never lines replace every `> [!WARNING]` callout and carry the real incident | One place for the failure, with its reason | 11-07 |
| 5 | Right and Wrong lines are quoted word for word from real notes. If no real note shows a failure the line says "None seen"; if the family has no note yet, "None yet" | A made-up example teaches a failure nobody has seen | 11-07 |
| 6 | Word limit: at most 180 words per `###` entry (table rows not counted) and 2,000 per Standard (tables counted). The Standards session changed `vault-lint.js` and the matching rule in [[Note Kit Standard]] | The old 700-word total made the richer anatomy fail ~50 Standards | 11-07 |
| 7 | Every Spec block stays byte for byte. A Spec is never loosened to fit old notes; Legacy Shapes carries them | Specs drive the fit numbers | 11-07 |
| 8 | A Gold Standard Example is named only if the note exists and passes lint for its family. Otherwise the Standard says `none yet` and lists the best candidates and what each lacks. No note is edited to make it pass | An honest gold is worth more than a full column | 11-07 |
| 9 | Brief gold swapped to [[Jesse Meeting - 28th Oct Brief]], and Action gold to the matching Actions note | They pass lint and show more of the rules | 11-07 |
| 10 | Briefs start `sprout` and only the owner sets `tree` | The drafter cannot verify against the transcript as the owner can | 11-07 |
| 11 | No voice rule per family. A Voice row is added only where every existing note shares one voice. `HUMAN_WRITING` governs voice | A rule the notes do not follow would fail every old note | 11-07 |
| 12 | Standards add no skill or agent row. A rule about a skill's output may name the skill (Brief Standard names the `/note-to-actions` pass for `next`). Workflows name the skills | Diátaxis: a Standard holds rules, a Workflow holds process. The kit contract already says a Workflow names the skill, command or agent | 11-07 |
| 13 | Removals ("Strict"): Tracking Standard (retired redirect) deleted; Humanized Writing Standard merged into [[Human Writing Standard]]; Log Standard merged into [[30_Order/Standards/AI Loop/Logs\|Logs]]. Zero-note families that still have a Template stay, marked "no instance yet" | Fewer files, one source per rule | 11-07 |
| 14 | A rule that a Standard and a Workflow both state belongs in the Standard. The Workflow points to it | One source per rule | 11-06 |
| 15 | Session-log rule: one entry per session, written by whoever ran it ([[Memory Management]]). Skills and agents point at the rule and never append their own | Many entries per session buried the log | 11-05 |
| 16 | Courses Standards, Templates and Workflows are out of every pass here | Handled separately and in detail later | 11-06 |
### Deviations the owner must know about
- Decision 13 listed a fourth removal, Resume Alteration Standard (0 notes, no Template). The Standards session did not delete it, reporting that no fourth Standard had evidence for removal. It stays with "None yet" in most Right and Wrong lines.
- The merge direction for logs ran opposite to the plan: Log Standard was merged into Logs and removed, not the reverse. The AGENTS.md routing row for the session log now points to `[[Logs]]`.
- `Application Document Preparation 1.md` sits next to `Application Document Preparation.md` in `30_Order/Workflows/Internship/`. It is a legacy Workflow with no `system_kind` and is one of the 8 kit warnings. Nothing was done with it.
### What was rebuilt
| Folder | Standards rewritten | Entries with all five lines | Gold that passes lint |
|---|---|---|---|
| Root | 10 | 0 to 32 | 1 to 4 |
| Ingestion | 5 | 0 to 20 | 3 to 3 |
| Enrich | 10 | 0 to 67 | 0 to 3 |
| Operations | 4 | 0 to 24 | 0 to 0 |
| Projects | 5 | 0 to 31 | 0 to 2 |
| Internship | 11 | 0 to 62 | 0 to 0 |
| AI Loop | 10 | 0 to 24 | 0 to 1 |
| Total | 55 | 0 of 236 to 260 of 260 | 4 to 13 |
Other files changed by the Standards pass:

| File | Change |
|---|---|
| `30_Order/System/vault-lint/vault-lint.js` | The 700-word prose check became the two limits in decision 6. The session tested it on a scratch root; no automated test suite exists |
| [[Note Kit Standard]] | New anatomy: contract table, identity table, entry contract, Rules entry, Gold Standard Example rules |
| [[Standard Template]] | Comment lines now name the new elements |
| [[Note Type Registry]] | Four AI Loop policy rows added (Knowledge Noting, Memory Management, Orchestration, Tool Calls); the three periodic-review Spec ids named; the log row names Logs |
| [[00_How This Folder Works]], [[How to Write in This Vault]] | Folder map and what a Standard holds corrected |
| `AGENTS.md`, `CLAUDE.md` | Routing row for the session log; rule 5 now says what Standard, Template and Workflow each do |
| Ten notes | Links to removed Standards repointed by name only, including `Maintaining Logs` and `Application Document Preparation` in Workflows |
| Session log | One entry per session, as decision 15 says |
### Skills, commands and agents on disk
The Standards do not name them (decision 12). This table is the Workflow pass's input. Disk counts on 2026-11-07: 18 skill folders, 15 commands, 11 agents.

| Skill, command or agent | Standard it serves |
|---|---|
| `startday`, `closeday`, `daily-operator` | [[Daily Note Standard]], [[Plan Standard]] |
| `weekly-review` | [[Capability Review Standard]], [[Periodic Review Note Standard]] |
| `transcript-to-brief`, `note-to-actions`, `meeting-operator` | [[Brief Standard]], [[Action Standard]], [[Transcript Standard]] |
| `ingesting-clipping`, `ingest-clipping`, `research-distiller` | [[Clipping Standard]], [[Source Summary Standard]] |
| `distill-note` | [[Evergreen Standard]] |
| `remove-ai-slop`, `anti-slop-editor`, `human-operator` | [[Human Writing Standard]] |
| `ops`, `vault-curator` | [[30_Order/Standards/AI Loop/Review System\|Review System]] |
| `llm-council`, `challenge`, `ideas`, `strategy`, `trace-topic`, `tag-month`, `mcp-hub`, `mentorship`, `project-career`, `learning-agent`, `professor`, `career-operator` | None |
Mismatches found:

| Item | Mismatch |
|---|---|
| `skills/tag-monthly/` holds the command `tag-month` | Folder name differs from the command |
| `skills/trace-goal/` holds `trace-topic` | Folder name differs |
| `skills/plan-it/` holds `strategy` | Folder name differs |
| Skill `ingesting-clipping` and command `ingest-clipping` | Names differ |
| Commands without a skill folder: `ingest-clipping`, `strategy`, `tag-month`, `trace-topic` | No skill behind them |
| Nine skills whose `name:` differs from their folder, such as `closeday` named `closing-day` | Tool-native; the folder is the key |
| Agent-side skill copies that `.claude/skills` lacks, such as `class-csci4041` | Copies out of step |
| Kit files name `/export-ai-session` (in `Maintaining Logs`) and `promote-dossier` (in Internship - Design Rationale) | No such command exists |
| Five agents use `claude-sonnet-4-6` | None uses the current model id |
### Workflow handoff
The next pass edits Workflows. The Standards session changed none beyond name-only repoints. Items below come from its report; the session-log lines were also seen in the pre-pass survey.

| Kind | Where |
|---|---|
| Step adds its own session-log line, against decision 15 (about 16) | Capture to Summary 9, Enrichment 7 and its Done line, Output with Provenance 7, Brief to Progress Done, Conversations Loop 7, Meeting Workflow 9, PDF Extraction 8, Summary to Distilled 7, Promotion 6, Daily Close Loop Done, Building a Note Kit 9, Conformance on Touch 9 and Done, Conversation Capture 7 and Done, Graphify Folders 7, Internship Review System 7, Career Fair Intake 6. The report also named Tools Tracking and Files Tracking as lines that can stay, because they write tool logs and not the session log; that part of the report was cut off, so confirm it |
| Repeats a Standard rule | `Maintaining Logs` steps 5 and 6 and its closing line repeat Logs. `PDF Extraction` is 880 words and repeats the PDF Extraction Standard. `Building a Note Kit` "Do not" still says a Standard is under 700 words of prose, and its step 3 describes the old anatomy (read on 2026-11-07). `Meeting Workflow` "Do not" lines repeat Standard rules. `Conformance on Touch` and `Graphify Folders` also repeat Standard text |
| Skill missing from a Workflow | `Capture to Summary` needs `/ingest-clipping`; `Summary to Distilled` needs `/distill-note`; `Conversation Capture` and `Conversations Loop` need their export script named; `Application Document Preparation` has `serves` pointing only at Applying Standard but uses the cover-letter and writing Standards |
| `serves` mismatch | `Graphify Folders` does not point back to Generated Output Standard (a kit warning) |
| Process text still inside a Standard | Daily Note (`/startday` and `/closeday` steps), Clipping (completing keys at ingest), Internship Notes (screen fields, closed postings to `Viewed/`), Contact (the draft built from the Mimic note), Tracker (folder moves at submission), Cover Letter and Resume (plan approval order and the humanizer gate), Evergreen and Reference ("search first" timing), Capability Review (checking whether the week's note exists), Deadline and Intake Triage |
## Non-Goals
- Rewriting any Courses Standard, Template or Workflow in this rebuild.
- Rewriting real notes or gold notes so they pass. Conformance on Touch does that, one note at a time.
- Editing any Workflow beyond repointing a link to a removed Standard.
- Loosening a Spec to raise the fit number. Fit is 4.5% because the Standards describe a shape most real notes do not have yet.
- Adding process steps, triggers or skill rows to a Standard.
- Future builds. These are noted and not started: a weekly JSON history for the order health report, a Graphify conversion, registering `jarvis-memory`, the npm and pip installs, retiring the mirrors, and purging history.
## Next Action
1. Start a Workflow session that reads this note first. Apply the handoff table, one Workflow per edit, with `--kit` after each. Workflows say when a note is made, where it goes, how it closes, and the one core thing, in plain words. Give each Workflow the name of the skill, command or agent that automates a step, using the inventory above and not memory.
2. In the same pass, clear the 8 kit warnings: four Better Today template sections with body text, `For Everything` having no `type` (by design, so decide whether the kit check should skip it), PDF Extraction at 880 words, `Application Document Preparation 1.md`, and the `Graphify Folders` serves link.
3. Hand to a System pass: a kit check "the Gold Standard Example fits its family" (13 of 38 do today), an automated test for `vault-lint.js`, and a rebuild of `registry.sqlite`, which still holds the removed Standard names.
4. Improve gold notes over time. A family with no passing note says what is missing and lists candidates. The Standards with no real example at all: Cover Letter Alteration, Resume Alteration, Technical Concept and Applying.
## Open Questions
- [ ] Resume Alteration Standard: delete it (0 notes, no Template, as decision 13 intended) or keep it until a first resume exists?
- [ ] `Application Document Preparation 1.md`: delete the legacy duplicate or fold it into the live Workflow?
- [ ] Agent Prompt Standard: the nine P-prompt notes use `<report>`-style tags, not the four Spec headings. The Spec was kept as it was and a mapping listed. Should the tags replace the headings?
- [ ] Five agents use `claude-sonnet-4-6`. Update them to the current model ids, or leave until each is used?
- [ ] Skill folder names that differ from their commands (`tag-monthly`, `trace-goal`, `plan-it`): rename the folders, or leave since the tools read them?
- [ ] Old names (Tracking, Humanized Writing, Log Standard) remain in read-only AI conversation exports, the System Build Log, the Claude Kit Log alias text, and `registry.sqlite`. Leave as history, or rewrite the two living notes?
## Corrections
### 2026-11-07: the pasted Standards report was partly cut off
The Standards session's final report reached this session with garbled and truncated lines (the checks table, the gold-by-folder table, one part of the Workflow handoff). Figures above come from three sources: lines of the report that were readable, the session-log entry the Standards session wrote, and measurements repeated here on 2026-11-07 (Spec blocks identical, 55 Standards with 41 family and 14 policy, 38 gold links resolving and 13 passing, `--kit` 0 errors and 8 warnings, Standards folder 71 of 71, whole vault 252 of 5,647). The per-folder entry counts, the "300 quoted lines" check, and the skills mismatch list are the Standards session's own and were not repeated.
### 2026-11-06: what the first survey got wrong
The survey measured the Standards as capped by the 700-word limit. The pilot showed the median was 409 words and the missing elements were the cause. The cap still had to change, because the new elements do not fit under it.
## Evidence
| Claim | Check |
|---|---|
| 0 errors and 8 warnings | `node vault-lint.js --kit` on 2026-11-07 |
| 71 of 71 in Standards | `node vault-lint.js --path 30_Order/Standards` on 2026-11-07 |
| 252 of 5,647 | `node vault-lint.js` on 2026-11-07 |
| Spec blocks unchanged | A script compared the JSON blocks of each surviving Standard against `git show 25a1e7a5:<path>`: 55 compared, 55 identical |
| 13 gold pass, 38 resolve | A script linted each `gold_standard` target against its own family on 2026-11-07 |
| Standards pass in detail | The 2026-11-07 entry in `60_Claude/07_AI_Information/Session Logs/log.md` |
| System pass in detail | The 2026-11-05 entry in the same log, and [[Vault Lint]] |
## Related Notes
- [[00_How This Folder Works]]: the folder map and how a note is written.
- [[Note Type Registry]]: every family with its Template, Standard and Workflow.
- [[Note Kit Standard]]: the contract for Standards, Templates and Workflows, including the anatomy decided here.
- [[Standard Template]]: the scaffold that matches the anatomy.
- [[Building a Note Kit]]: the Workflow that builds a kit; it still describes the old anatomy.
- [[Conformance on Touch]]: how old notes reach their Standard without a bulk rewrite.
- [[Vault Lint]]: the checker, with its commands and failure behavior.
- [[Brief Standard]]: the pilot, and the model for every other Standard.
- [[Jarvis Dashboard Build Record]]: the earlier build record this one follows in shape.
