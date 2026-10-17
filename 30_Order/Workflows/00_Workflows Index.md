---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: guide
notes:
  - "[[Note Type Registry]]"
  - "[[Note Kit Standard]]"
  - "[[Conformance on Touch]]"
---
# Workflows Index
This folder is the procedure half of `30_Order`. A Workflow is the repeated process around a note: when it is made, what updates it, what it links to next. Pick the one that matches the task, then open the Standard it serves. For which Template and Standard a note uses, see [[Note Type Registry]]. A family with no repeated process has no Workflow. Rebuild this list from the `trigger` and `serves` fields of each Workflow.
```
capture      05_Clippings (raw)  ·  00_Inbox (loose AI output)
   ↓ one source, one summary
summarize    10_Source_Summaries
   ↓ many summaries, one concept
distill      20_Distilled_Notes
   ↓ stable and reused
promote      10_Areas  ·  40_Resources  ·  20_Progress
   ↓ understanding to deliverable
produce      outputs next to the project they serve
```
## System
| Workflow | Use when | Serves |
|---|---|---|
| [[Building a Note Kit]] | A note type is being written regularly and has no Standard, or an existing Standard fails its own checks. | [[Note Kit Standard]] |
| [[Conformance on Touch]] | Any session opens an existing note to change it, or to rely on it. | [[Conformance Standard]] |
## Ingestion and projects
| Workflow | Use when | Serves |
|---|---|---|
| [[Brief to Action]] | A brief or dense note exists, its topics are understood, and each needs a concrete next step. | [[Action Standard]] |
| [[Brief to Progress]] | A plan, spec, or meeting brief is ready to become active work the dashboard tracks. | [[Project Standard]] |
| [[Conversations Loop]] | Weekly, during the AI tools review, and whenever capture looks wrong. | [[Conversations]] |
| [[PDF Extraction]] | A PDF needs its content pulled into the vault before a source summary or textbook note is written. | [[PDF Extraction Standard]] |
| [[Plan Review Cadence]] | A daily or weekly skill runs where a type plan note exists, or a new plan is created. | [[Plan Standard]] |
| [[Summary to Distilled]] | A concept recurs across summaries, or one summary holds an idea worth owning. | [[Evergreen Standard]] |
| [[Transcript to Brief]] | A transcript of people talking is in the vault and worth turning into decisions and threads. | [[Brief Standard]] |
## Enrichment and writing
| Workflow | Use when | Serves |
|---|---|---|
| [[Capture to Summary]] | A clipping, PDF, web page, or video is worth keeping but too noisy to act on. | [[Source Summary Standard]] |
| [[Decoration]] | A note's content is final and its markers have not been checked, or a rewrite just finished. | [[Decoration Standard]] |
| [[Enrichment]] | An existing note matters enough to deepen but is thin, with no examples, source anchors, or drills. | [[Editing Standard]] |
| [[Human Content Writer]] | Any session drafts new prose for a note, or rewrites a note that reads as generic. | [[Human Writing Standard]] |
| [[Output with Provenance]] | You need an artifact for an outsider: an interview story, a portfolio bullet, or a project one-pager. | [[Output Standard]] |
| [[Plugins Usage]] | A note needs a live list, a task, a card, a board, a widget, or a diagram. | [[Plugins Usage Standard]] |
| [[Researcher]] | A question needs an answer built from sources, or a topic is new to the vault. | [[Human Writing Standard]] |
## Projects
| Workflow | Use when | Serves |
|---|---|---|
| [[Prompt Cycle]] | A build or fix round on a codebase will be run by an agent session. | [[Agent Prompt Standard]] |
## Courses
| Workflow | Use when | Serves |
|---|---|---|
| [[Board Workflow]] | A course is added, its syllabus or modules page changes, or a schedule, grading, or source correction lands. | [[Board Standard]] |
| [[Concept Workflow]] | A scheduled topic, textbook section, lecture, lab, project, or repeated mistake reveals a reusable mechanism. | [[Concept Standard]] |
| [[Course Production Workflow]] | A course starts, a term is reset, or a week of course notes is due to be produced. | [[Degree Control Standard]] |
| [[Discussion Workflow]] | A discussion section, paper discussion, reading conversation, or participation task is scheduled. | [[Discussion Standard]] |
| [[Exam Workflow]] | An exam, long quiz, or final is announced, and again when its results return. | [[Exam Standard]] |
| [[Homework Workflow]] | A problem set, coding or written assignment, journal entry, or short quiz is assigned. | [[Homework Standard]] |
| [[Lab Workflow]] | A lab prompt and starter files are available, or a lab session just happened. | [[Lab Standard]] |
| [[CSCI 4061 Workflow]] | Course-specific production plan |  |
| [[CSCI 4511W Workflow]] | Course-specific production plan |  |
| [[CSCI 5304 Workflow]] | Course-specific production plan |  |
| [[Technical Interview Workflow]] | Course-specific production plan |  |
| [[Preparation Workflow]] | Course setup, the first graded artifact, a major assessment, or a change in the course rules or schedule. | [[Preparation Standard]] |
| [[Projects Workflow]] | A course project or multi-week build is assigned. | [[Course Project Standard]] |
| [[Textbook Map Workflow]] | A course starts, the schedule changes, a source lands, or a chapter note is produced. | [[Textbook Map Standard]] |
| [[Textbook Workflow]] | A textbook chapter or section is assigned and its source file has landed in the course folder. | [[Textbook Standard]] |
| [[Weekly Board Workflow]] | A week is scheduled, a layer's note is created or updated, or a course layer needs an honest freshness check. | [[Weekly Board Standard]] |
| [[Weekly Workflow]] | A course week appears on the verified schedule, and again after its lecture. | [[Weekly Standard]] |
## Internship and career
| Workflow | Use when | Serves |
|---|---|---|
| [[Application Document Preparation]] | Real preparation of an application starts (Pipeline step 5). | [[Applying Standard]] |
| [[Application Document Preparation 1]] |  |  |
| [[Career Fair Intake]] | A career fair or recruiting event produces postings and conversations to follow up. | [[Career Fair Standard]] |
| [[Internship - Design Rationale]] | Course-specific production plan |  |
| [[Internship Pipeline]] | A posting is found, or an internship is being pursued or tracked. | [[Internship Tracker Standard]] |
| [[Internship Review System]] | Every Friday for the Weekly review, the 1st of each month for the Monthly review, and every third day for the Deadline Sweep. | [[Internship Loop Review Standard]] |
| [[Internship Tracking Workflow]] | A deadline changes, preparation starts, an application is submitted, or an outcome lands. | [[Internship Tracker Standard]] |
| [[Promotion]] | A distilled note is trusted, has been reused, and reads like lookup material or domain truth. | [[Reference Standard]] |
## Operations
| Workflow | Use when | Serves |
|---|---|---|
| [[Daily Close Loop]] | The working day starts with /startday or ends with /closeday. | [[Daily Note Standard]] |
## AI toolkit
| Workflow | Use when | Serves |
|---|---|---|
| [[Conversation Capture]] | A conversation with any AI tool produced a decision, a plan, or context worth keeping. | [[Conversations]] |
| [[Files Tracking]] | Files in a mirrored tool folder under 20_Progress/AI were added, removed, or changed, or a sync run reported changes. | [[Tool Setup]] |
| [[Graphify Folders]] | A repo needs a navigable graph inside Jarvis, or a mirror's health check is due. | [[Graphify Notes]] |
| [[Maintaining Logs]] | A session ends, a review is due, or a log looks silent. | [[Logs]] |
| [[Tools Tracking]] | A tool is ingested, tested, promoted, blocked, dropped, or parked in second-brain-claudekit. | [[Logs]] |
