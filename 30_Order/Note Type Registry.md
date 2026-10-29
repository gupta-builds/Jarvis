---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-28
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
| (policies) vocabulary, fit, editing | none | system / standard | `30_Order/Standards/` | none | [[Frontmatter Standard]], [[Conformance Standard]], [[Editing Standard]] | [[Conformance on Touch]] | built |
| (policy) writing | none | system / standard | `30_Order/Standards/Enrich/` | none | [[Human Writing Standard]], [[Humanized Writing Standard]] | [[Human Content Writer]], [[Researcher]] | built |
| (policy) decoration | none | system / standard | `30_Order/Standards/` | none | [[Decoration Standard]] | [[Decoration]] | built |
| (policy) plugins | none | system / standard | `30_Order/Standards/Enrich/` | none | [[Plugins Usage Standard]] | [[Plugins Usage]] | built |
## Courses
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| course-concept | 1 | concept | `20_Progress/Degree/`, `40_Resources/UMN/Previous Classes/`, `10_Areas/Notes/` | [[Concept Template]] | [[Concept Standard]] | [[Concept Workflow]] | built |
| course-week | 1 | class / week | same | [[Week Template]] | [[Weekly Standard]] | [[Weekly Workflow]] | built |
| course-textbook | 1 | class / textbook | same | [[Textbook Template]] | [[Textbook Standard]] | [[Textbook Workflow]] | built |
| course-textbook-map | 1 | class / textbook-map | same | [[Textbook Map Template]] | [[Textbook Map Standard]] | [[Textbook Map Workflow]] | built |
| course-lab | 1 | class / lab | same | [[Lab Template]] | [[Lab Standard]] | [[Lab Workflow]] | built |
| course-homework | 1 | class / homework | same | [[Homework Template]] | [[Homework Standard]] | [[Homework Workflow]] | built |
| course-exam | 1 | class / exam | `20_Progress/Degree/`, `40_Resources/UMN/Previous Classes/`, `10_Areas/Notes/` | [[Exam Sheet Template]] | [[Exam Standard]] | [[Exam Workflow]] | built |
| course-exam-material | 1 | class / exam-material | same | [[Exam Material Template]] | [[Exam Material Standard]] | none (steps in [[Exam Workflow]]) | built |
| course-board | 1 | class / board | same | [[Board or Main Template]] | [[Board Standard]] | [[Board Workflow]] | built |
| course-subboard | 1 | class / subboard | same | [[Weekly Board Template]] | [[Weekly Board Standard]] | [[Weekly Board Workflow]] | built |
| course-discussion | 1 | class / discussion | same | [[Discussion Template]] | [[Discussion Standard]] | [[Discussion Workflow]] | built |
| course-preparation | 1 | class / preparation | same | [[Preparation Template]] | [[Preparation Standard]] | [[Preparation Workflow]] | built |
| course-project | 1 | class / project | same | [[Project Template]] | [[Course Project Standard]] | [[Projects Workflow]] | built |
| course-project-companion | 2 | class / project, `project_role: companion` | same | none | same Standard | [[Projects Workflow]] | built |
| course-control | 1 | class / control | `20_Progress/Degree/` root | [[Degree Control Template]] | [[Degree Control Standard]] | [[Course Production Workflow]] | built |
| course-track | 1 | class / track | `20_Progress/Degree/_Courses/` | [[Track Template]] | [[Self-Study Track Standard]] | none ([[Technical Interview Workflow]] is the Technical Interview production plan) | built |
| course-audit | 1 | class / audit | `40_Resources/UMN/The Plan/` | none | [[Degree Audit Standard]] | none | built |
| course-archive | 1 | class | `40_Resources/UMN/Previous Classes/` | none | Legacy Shapes of the course Standards | none | decide |
## Career
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| internship-dossier | 2 | input / job-dossier | `10_Areas/Career/Internships/List/Dossiers/` | none (bot-written) | [[Internship Notes Standard]] | [[Internship Pipeline]] | built |
| internship-tracker | 1 | tracker | `10_Areas/Career/Internships/Tracker/Each One/` | [[30_Order/Templates/Career/Tracking\|Tracking]] | [[Internship Tracker Standard]] | [[Internship Tracking Workflow]] | built |
| internship-program | 1 | reference / program | `10_Areas/Career/Internships/Programs/` | [[Program Template]] | [[Program Standard]] | [[Internship Pipeline]] | built |
| internship-contact | 1 | contact | `10_Areas/Career/Internships/Contacts/Each One/` | [[Contact Template]] | [[Contact Standard]] | [[Internship Pipeline]] | built |
| internship-applying | 1 | project / project | `20_Progress/Internship/Applying/` | [[Applying Template]] | [[Applying Standard]] | [[Application Document Preparation]] | built (unexercised) |
| career-fair | 2 | input | `20_Progress/Internship/Career Fair/` | none | [[Career Fair Standard]] | [[Career Fair Intake]] | built |
| interview-prep | 1 | project / project | `20_Progress/Internship/Preperation/Interviews/` | [[Interview Prep Template]] | [[Interview Prep Standard]] | none | built |
| resume-alteration | 1 | output / resume | `20_Progress/Internship/Resumes/` | none | [[Resume Alteration Standard]] | [[Application Document Preparation]] | built |
| cover-letter | 1 | output / cover-letter | `20_Progress/Internship/Cover Letters/` | [[Cover Letter Template]] | [[Cover Letter Alteration Standard]] | [[Application Document Preparation]] | built (no instance yet) |
| intake-log | 2 | input / clipping | `10_Areas/Career/Internships/List/Dossiers/_Today/` | none | [[Deadline and Intake Triage Standard]] | none | built |
| deadline-tracker | 2 | dashboard / dashboard | `10_Areas/Career/Internships/Tracker/Deadline Tracker.md` | none | [[Deadline and Intake Triage Standard]] | [[Internship Review System]] | built |
| internship-loop-review-weekly | 1 | review / internship-loop | `60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/` | [[Internship Loop Weekly Review Template]] | [[Internship Loop Review Standard]] | [[Internship Review System]] | built |
| internship-loop-review-monthly | 1 | review / internship-loop | `60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/` | [[Internship Loop Monthly Review Template]] | [[Internship Loop Review Standard]] | [[Internship Review System]] | built |
| job-company | 1 | reference / company | none yet | [[Job & Company Template]] | none until a first note exists | none | decide |
| linkedin-post | 1 | output / post | none yet | [[LinkedIn Post Template]] | none until a first note exists | none | decide |
| cheat | 1 | project | `20_Progress/Internship/` | [[Cheat Template]] | none until a decision | none | decide |
## Projects
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| project | 1 | project / project | `20_Progress/Projects/`, `20_Progress/Internship/`, `20_Progress/Mentorship Program/` | [[Project Note Template]] | [[30_Order/Standards/Project Standard|Project Standard]] | [[Brief to Progress]] | built |
| project-spec | 1 | project / spec | `20_Progress/`, `60_Claude/40_Project_Briefs/` | [[Project Spec Template]] | [[Spec and Plan Standard]] | none | built |
| project-plan | 1 | project / plan | `20_Progress/`, `60_Claude/40_Project_Briefs/` | [[Project Plan Template]] | [[Spec and Plan Standard]] | none | built |
| code-mirror-doc | 1 | project / code-mirror | `60_Claude/40_Project_Briefs/CausalOps/` | [[Code Mirror Template]] | [[Code Mirror Doc Standard]] | none | built |
| agent-prompt | 1 | project / prompt | `20_Progress/`, `60_Claude/40_Project_Briefs/` | [[Agent Prompt Template]] | [[Agent Prompt Standard]] | [[Prompt Cycle]] | built |
| prompt-queue | 1 | project / prompt (`prompt_shape: queue`) | `20_Progress/Internship/Building System/Runs/` | none | [[Agent Prompt Standard]] | [[Prompt Cycle]] | built |
| machine-runbook | 1 | reference / runbook | `40_Resources/CS/` | [[Machine Runbook Template]] | [[Machine Runbook Standard]] | none | built |
| technical-concept | 1 | concept | `20_Progress/Projects/`, `20_Progress/Internship/`, `40_Resources/CS/`, `40_Resources/UMN/SAO/` | [[Technical Concept Template]] | [[Technical Concept Standard]] | none | built (no gold example yet) |
| transcript | 2 | input / transcript | `20_Progress/`, `10_Areas/` (not `Degree/` or `Career Fair`), in a `Transcripts/` folder | [[Transcript Template]] | [[Transcript Standard]] | [[Meeting Workflow]] | built |
| brief | 1 | input / brief | `20_Progress/`, `10_Areas/`, `60_Claude/40_Project_Briefs/` | [[Brief Template]] | [[Brief Standard]] | [[Meeting Workflow]] | built |
| action | 1 | action | next to the source note | [[Action Template]] | [[Action Standard]] | [[Meeting Workflow]] | built |
## Knowledge
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| clipping | 2 | input / clipping, transcript | `60_Claude/05_Clippings/Web`, `Videos`, `PDFs` | none (capture tool) | [[Clipping Standard]] | [[Capture to Summary]] | built |
| source-summary | 1 | input / pdf-summary, web-summary, video-summary | `60_Claude/10_Source_Summaries/PDF Ingestion`, `Web Ingestion`, `Video Ingestion` | [[Clipping Distill Template]] | [[Source Summary Standard]] | [[Capture to Summary]] | built |
| repo-card | 1 | input / repo-card | `60_Claude/10_Source_Summaries/Github Ingestion/` | [[Repo Evaluation Template]] | [[Repo Evaluation Standard]] | none | built |
| pdf extraction (policy) | none | none | n/a | none | [[PDF Extraction Standard]] | [[PDF Extraction]] | built |
| distilled | 1 | evergreen / distilled | `60_Claude/20_Distilled_Notes/` | [[Deep Dive Template]] | [[Evergreen Standard]] | [[Summary to Distilled]] | built |
| synthesis | 1 | evergreen / synthesis | `60_Claude/20_Distilled_Notes/Synthesis/` | [[Synthesis Note Template]] | [[Evergreen Standard]] | [[Summary to Distilled]] | built |
| identity-note | 1 | evergreen / identity | `10_Areas/Life/Truths of Life/` | none (2 notes) | [[Evergreen Standard]] | none | built |
| reference-resource | 1 | reference | `40_Resources/`, `10_Areas/AI`, `10_Areas/Trading` | [[Reference Template]] | [[Reference Standard]] | [[Promotion]] | built |
| output-story | 1 | output / story | next to its project, `20_Progress/` | [[Output Template]] | [[Output Standard]] | [[Output with Provenance]] | built |
| output-bullet | 1 | output / bullet | same | [[Output Bullet Template]] | [[Output Standard]] | [[Output with Provenance]] | built |
| output-one-pager | 1 | output / one-pager | same | [[Output One-Pager Template]] | [[Output Standard]] | [[Output with Provenance]] | built |
## Operations and navigation
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| daily-note | 2 | thought / daily | `10_Areas/Life/Enumerate/Daily/` | [[Better Today]] | [[Daily Note Standard]] | [[Daily Close Loop]] | built |
| periodic-review-note (Spec ids -weekly, -monthly, -yearly) | 2 | thought / weekly, monthly, yearly | `10_Areas/Life/Enumerate/Weekly/`, `Monthly/`, `Yearly/` | [[Better Weekly]], [[Better Month]], [[Better Year]] | [[Periodic Review Note Standard]] | none | built |
| plan | 1 | plan | `10_Areas/Life/Plans/` | [[Plan Template]] | [[Plan Standard]] | [[Plan Review Cadence]] | built |
| moc | 1 | index | any folder | [[MOC Template]] | [[MOC Standard]] | none | built |
| dashboard | 1 | dashboard (dashboard, board, habit-board) | `60_Claude/` except `05_Clippings/`, `10_Areas/`, `20_Progress/`, `00_Dashboard.md` | [[For Dashboards]] | [[Dashboard Standard]] | none | built |
| field-os (Spec ids field-os, depth-ladder, question-bank) | 1 | dashboard / field-os, depth-ladder, question-bank | `60_Claude/44_Indexes/Field OS/` | [[Field OS Template]], [[Depth Ladder Template]], [[Question Bank Template]] | [[Field OS Standard]] | none | built |
## AI operations
| Family | Tier | type / kind | Folder | Template | Standard | Workflow | Kit |
|---|---|---|---|---|---|---|---|
| ai-conversation-export | 2 | input / ai-conversation | `60_Claude/05_Clippings/AI Conversations/` | none (script-written) | [[Conversations]] | [[Conversation Capture]], [[Conversations Loop]] | built |
| ai-conversation-summary | 1 | input / ai-conversation-summary | `60_Claude/07_AI_Information/AI Conversation - Summaries/` | [[AI Conversation]] | [[Conversations]] | [[Conversation Capture]], [[Conversations Loop]] | built |
| log | 2 | system / log | `60_Claude/07_AI_Information/Session Logs/`, `20_Progress/Projects/AI Use/Claude Kit/`, `60_Claude/30_Reviews/AI/Toolkit/` | [[Write Logs]], [[Tool Logs]] | [[Logs]], [[Log Standard]] | [[Maintaining Logs]], [[Tools Tracking]] | built |
| ai-review-weekly, ai-review-monthly | 1 | review / weekly, monthly | `60_Claude/30_Reviews/AI/Scheduled/` | [[AI Weekly Review Template]], [[AI Monthly Review Template]] | [[Review Standard]], [[Review System]] | none | built |
| capability-review | 1 | review / capability | `60_Claude/30_Reviews/Weekly Synthesis/` | [[Weekly Synthesis Template]] (not Synthesis Template, which is the concept-synthesis template) | [[Capability Review Standard]] | none; the `/weekly-review` skill is the feeder | built |
| audit-report | 1 | review / audit | `60_Claude/30_Reviews/` | [[Audit Report Template]] | [[Audit Report Standard]] | none | built |
| project-review | policy | log entry in the project note | the project's own `## Log` | none | [[Per Project Review]] | none | built |
| graphify-note | 1 | reference / repo | `60_Claude/40_Project_Briefs/` | [[Graphify Notes Template]] | [[Graphify Notes]] | [[Graphify Folders]] | built |
| tool-setup | 1 | reference / tool-profile | `20_Progress/AI/<Tool>/<Project>/Setup.md` | [[Tool Setup Template]] | [[Tool Setup]] | [[Files Tracking]] | built |
| tool-map | n/a | index (one note) | `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md` | none | none, single living note | [[Tools Tracking]] | decide |
## Tier 4 and out of scope
Paths below are not measured for fit. They are the same patterns as `vault-lint.config.json`.

| Path | Why |
|---|---|
| `.claude/`, `.agents/`, `.codex/`, `.cursor/`, `.opencode/`, `.kiro/`, `.firecrawl/`, `.vscode/`, `copilot/` | Tool-native files; they keep their own frontmatter |
| `20_Progress/AI/<tool>/**/skills`, `agents`, `commands`, `hooks`, `rules`, `context`, `specs`, `steering`, `plans` | Mirrors of tool configuration and vendor docs |
| `50_Archive/`, `.git/`, `.obsidian/` | Never read or measured |
| `30_Order/Templates/` | Checked by `--kit`, not as notes |
## Aliases
Names kept for legacy reasons. Weekly Board Standard also governs course sub-boards. Internship Notes Standard governs dossiers. Better Today, Better Weekly, Better Month and Better Year are the daily and periodic Templates. Humanized Writing Standard is a short internship-specific pointer to Human Writing Standard.
