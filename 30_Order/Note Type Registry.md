---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - registry
system_kind: guide
notes:
  - "[[00_How This Folder Works]]"
  - "[[Note Kit Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[Conformance Standard]]"
---
# Note Type Registry
==Every kind of note the vault holds has one row here: its tier, where it lives, and the Template, Standard, and Workflow that shape it.==
To write or fix a note, find its row, open the Standard, copy the Template, follow the Workflow. A note type with no row has no kit; build one with [[Building a Note Kit]] before writing it. Tiers are defined in [[Conformance Standard]]. A kit's state is `built` (written to the contract), `align` (exists, must be rewritten to the contract), `planned` (not written, named here), or `decide` (waiting on a user decision). Planned names are plain text and become links when written.
## Foundation
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| family-standard, policy-standard | 1 | system / standard | `30_Order/Standards/` | [[Standard Template]] | [[Note Kit Standard]] | [[Building a Note Kit]] | built |
| workflow | 1 | system / workflow | `30_Order/Workflows/` | [[Workflow Template]] | [[Note Kit Standard]] | [[Building a Note Kit]] | built |
| system-guide | 2 | system / guide | `30_Order/` | none | [[Note Kit Standard]] | none | built |
| system-component | 2 | system / spec | `30_Order/System/` | none | [[System Component Standard]] | none | built |
| generated-output | 3 | generated | zone not set | none | [[Generated Output Standard]] | [[Graphify Folders]] | built |
| (policies) | none | system / standard | `30_Order/Standards/` | none | [[Frontmatter Standard]], [[Conformance Standard]], [[Editing Standard]] | [[Conformance on Touch]] | built |
## Courses
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| course-concept | 1 | concept | `20_Progress/Degree/`, `40_Resources/UMN/Previous Classes/` | [[Concept Template]] | [[Concept Standard]] | [[Concept Workflow]] | align |
| course-week | 1 | class / week | same | [[Week Template]] | [[Weekly Standard]] | [[Weekly Workflow]] | align |
| course-textbook | 1 | class / textbook | same | [[Textbook Template]] | [[Textbook Standard]] | [[Textbook Workflow]] | align |
| course-textbook-map | 1 | class / textbook-map | same | [[Textbook Map Template]] | [[Textbook Map Standard]] | [[Textbook Map Workflow]] | align |
| course-lab | 1 | class / lab | same | [[Lab Template]] | [[Lab Standard]] | [[Lab Workflow]] | align |
| course-homework | 1 | class / homework | same | [[Homework Template]] | [[Homework Standard]] | [[Homework Workflow]] | align |
| course-exam | 1 | class / exam | same | [[Exam Sheet Template]] | [[Exam Standard]] | [[Exam Workflow]] | align |
| course-exam-material | 1 | class / exam-material | same | Exam Material Template | Exam Material Standard | [[Exam Workflow]] | planned |
| course-board | 1 | class / board | same | [[Board or Main Template]] | [[Board Standard]] | [[Board Workflow]] | align |
| course-subboard | 1 | class / subboard | same | [[Weekly Board Template]] | [[Weekly Board Standard]] | [[Weekly Board Workflow]] | align |
| course-discussion | 1 | class / discussion | same | [[Discussion Template]] | [[Discussion Standard]] | [[Discussion Workflow]] | align |
| course-preparation | 1 | class / preparation | same | [[Preparation Template]] | [[Preparation Standard]] | [[Preparation Workflow]] | align |
| course-project | 1 | class / project | same | [[Project Template]] | `30_Order/Standards/Courses/Project Standard` (rename to Course Project Standard) | [[Projects Workflow]] | align |
| course-control | 1 | class / control | `20_Progress/Degree/` root | Degree Control Template | Degree Control Standard | Degree Control Workflow | planned |
| course-track | 1 | class / track | `20_Progress/Degree/_Courses/` | Track Template | Self-Study Track Standard | [[Technical Interview Workflow]] | planned |
| course-audit | 1 | class / audit | `40_Resources/UMN/The Plan/` | none | Degree Audit Standard | none | planned |
| course-archive | 1 | class | `40_Resources/UMN/Previous Classes/` | none | Legacy Shapes of the course Standards | none | decide |
## Career
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| internship-dossier | 2 | input / job-dossier | `10_Areas/Career/Internships/List/Dossiers/` | none (bot-written) | [[Internship Notes Standard]] | [[Internship Pipeline]] | align |
| internship-tracker | 1 | tracker | `10_Areas/Career/Internships/Tracker/` | [[Tracking Template]] | [[Internship Tracker Standard]] | [[Internship Tracking Workflow]] | align |
| internship-program | 1 | reference / program | `10_Areas/Career/Internships/Programs/` | [[Program Template]] | Program Standard | [[Internship Pipeline]] | planned |
| internship-contact | 1 | contact | `10_Areas/Career/Internships/Contacts/` | [[Contact Template]] | Contact Standard | [[Internship Pipeline]] | planned |
| internship-applying | 1 | project | `20_Progress/Internship/Applying/` | [[Applying Template]] | [[Applying Standard]] | Application Document Preparation | align |
| career-fair | 1 | input / transcript, tracker | `20_Progress/Internship/Career Fair/` | none | Career Fair Standard | Career Fair Intake | planned |
| interview-prep | 1 | reference | `10_Areas/Career/` | [[Cheat Template]] | Interview Prep Standard | none | planned |
| mentorship-meeting | 1 | input | `20_Progress/Mentorship Program/Meetings/` | none | Mentorship Meeting Standard | none | planned |
| resume-alteration | 1 | output / resume | `20_Progress/Internship/Resumes/` | none | [[Resume Alteration Standard]] | Application Document Preparation | align |
| cover-letter | 1 | output / cover-letter | `20_Progress/Internship/Cover Letters/` | [[Cover Letter Template]] | [[Cover Letter Alteration Standard]] | Application Document Preparation | align |
| deadline-triage | 2 | tracker | `10_Areas/Career/Internships/Tracker/` | none | [[Deadline and Intake Triage Standard]] | none | align |
| internship-loop-review | 1 | review / internship-loop | `60_Claude/30_Reviews/Internship Loop/` | [[Internship Loop Weekly Review Template]], [[Internship Loop Monthly Review Template]] | [[Internship Loop Review Standard]] | [[Internship Review System]] | align |
| job-company | 1 | reference / company | none yet | [[Job & Company Template]] | none until a first note exists | none | decide |
| linkedin-post | 1 | output / post | none yet | [[LinkedIn Post Template]] | none until a first note exists | none | decide |
## Projects
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| project | 1 | project | `20_Progress/Projects/` | [[For Progress]] | [[30_Order/Standards/Project Standard|Project Standard]] | [[Brief to Progress]] | align |
| project-spec-plan | 1 | project / spec, plan | `20_Progress/` | Spec and Plan Template | Spec and Plan Standard | none | planned |
| code-mirror-doc | 1 | project / code-mirror | `60_Claude/40_Project_Briefs/CausalOps/` | Code Mirror Template | Code Mirror Doc Standard | none | planned |
| agent-prompt | 1 | project / prompt | `20_Progress/`, `60_Claude/07_AI_Information/Session Logs/` | Agent Prompt Template | Agent Prompt Standard | none | planned |
| machine-runbook | 1 | reference / runbook | `40_Resources/CS/` | Machine Runbook Template | Machine Runbook Standard | none | planned |
| technical-concept | 1 | concept | `20_Progress/Projects/`, `40_Resources/CS/` | [[Concept Template]] | Technical Concept Standard | [[Summary to Distilled]] | planned |
| brief | 1 | input / brief | `60_Claude/40_Project_Briefs/` | [[Brief Template]] | [[Brief Standard]] | [[Transcript to Brief]] | align |
| action | 1 | action | next to the source note | [[Action Template]] | [[Action Standard]] | [[Brief to Action]] | align |
## Knowledge
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| clipping | 2 | input / clipping | `60_Claude/05_Clippings/` | none (raw capture) | Clipping Standard | [[Capture to Summary]] | planned |
| source-summary | 1 | input / source-summary | `60_Claude/10_Source_Summaries/` | [[Clipping Distill Template]] | [[Source Summary Standard]] | [[Capture to Summary]] | align |
| repo-card | 1 | input / repo-card | `60_Claude/10_Source_Summaries/Github Ingestion/` | Repo Evaluation Template | Repo Evaluation Standard | none | planned |
| pdf-summary | 1 | input / pdf-summary | `60_Claude/10_Source_Summaries/PDF Ingestion/` | [[Clipping Distill Template]] | [[PDF Extraction Standard]] | [[PDF Extraction]] | align |
| distilled | 1 | evergreen / distilled | `60_Claude/20_Distilled_Notes/` | [[Deep Dive Template]] | [[Evergreen Standard]] | [[Summary to Distilled]] | align |
| reference-resource | 1 | reference | `40_Resources/` | none | [[Resources]] | [[Promotion]] | planned |
| output | 1 | output | next to the project it serves | [[Output Template]] | Output Standard | [[Output with Provenance]] | planned |
## Operations
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| daily-note | 2 | thought / daily | `10_Areas/Life/Enumerate/Daily/` | [[Better Today]] | Daily Note Standard | Daily Close Loop | planned |
| periodic-review-note | 2 | thought / weekly, monthly, yearly | `10_Areas/Life/Enumerate/` | [[Better Weekly]], [[Better Month]], [[Better Year]] | Periodic Review Note Standard | none | planned |
| plan | 1 | plan | `10_Areas/Life/Plans/` | [[Plan Template]] | [[Daily Workflow Standard]] (rename to Plan Standard) | [[Plan Review Cadence]] | align |
| identity-note | 1 | evergreen / identity | `10_Areas/Life/Truths of Life/` | [[For Evergreen]] | [[Evergreen Standard]] | none | align |
## Navigation
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| moc | 1 | index | any folder | [[MOC Template]] | [[MOC Standard]] | none | align |
| dashboard | 1 | dashboard | `60_Claude/44_Indexes/` | [[For Dashboards]] | Dashboard Standard | none | planned |
| field-os | 1 | dashboard / field-os, depth-ladder, question-bank | `60_Claude/44_Indexes/Field OS/` | [[Field OS Template]], [[Depth Ladder Template]], [[Question Bank Template]] | Dashboard Standard | none | planned |
## AI operations
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| ai-conversation-export | 2 | input / ai-conversation | `60_Claude/05_Clippings/AI Conversations/` | none (script-written) | [[Conversations]] | [[Conversation Capture]] | align |
| conversation-summary | 1 | input / ai-conversation-summary | `60_Claude/07_AI_Information/AI Conversation - Summaries/` | [[AI Conversation]] | [[Conversations]] | [[Conversation Capture]] | align |
| log | 2 | system / log | `60_Claude/07_AI_Information/Session Logs/`, project Log notes | [[Tool Logs]], [[Write Logs]] | [[Log Standard]], [[Logs]] | [[Maintaining Logs]] | align |
| ai-review | 1 | review / weekly, monthly | `60_Claude/30_Reviews/AI/` | [[AI Weekly Review Template]], [[AI Monthly Review Template]] | [[Review Standard]], [[Review System]] | none | align |
| capability-review | 1 | review / capability | `60_Claude/30_Reviews/Weekly Synthesis/` | [[Synthesis Template]] | Capability Review Standard | none | planned |
| audit-report | 1 | review / audit | `60_Claude/30_Reviews/` | none | Audit Report Standard | none | planned |
| project-review | 1 | review / project | the project's own Log | none | [[Per Project Review]] | none | align |
| graphify-note | 1 | reference / tool-profile | `20_Progress/AI/` | [[Graphify Notes Template]] | [[Graphify Notes]] | [[Graphify Folders]] | align |
| tool-tracking | 1 | reference / tool-profile | `20_Progress/Projects/AI Use/` | none | [[Per Project Review]] | [[Tools Tracking]], [[Files Tracking]] | align |
## Tier 4 and out of scope
Paths below are not measured for fit. They are the same patterns as `vault-lint.config.json`.
| Path | Why |
|---|---|
| `.claude/`, `.agents/`, `.codex/`, `.cursor/`, `.opencode/`, `.kiro/`, `.firecrawl/`, `.vscode/`, `copilot/` | Tool-native files; they keep their own frontmatter |
| `20_Progress/AI/<tool>/**/skills`, `agents`, `commands`, `hooks`, `rules`, `context`, `specs`, `steering`, `plans` | Mirrors of tool configuration and vendor docs |
| `50_Archive/`, `.git/`, `.obsidian/` | Never read or measured |
| `30_Order/Templates/` | Checked by `--kit`, not as notes |
## Aliases
Legacy names kept until the rename is done with link-aware moves: Daily Workflow Standard (to become Plan Standard), Courses/Project Standard (to become Course Project Standard), Weekly Board Standard (covers sub-boards), Internship Notes Standard (governs dossiers), Better Today and the other Enumerate templates (daily and periodic notes), Resources (the Standard for `reference` notes).
