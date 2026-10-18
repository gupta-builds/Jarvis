---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "converge-jarvis-instruction-layer"
started_at: 2026-10-15T16:55:40
ended_at: 2026-10-15T18:42:26
exported_at: 2026-10-17T21:06:44
duration_minutes: 106.8
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 33d4247a-4479-4fa5-ab1a-9e666ace5520
status: raw
turn_count: 12
tools_used:
  Agent: 5
  AskUserQuestion: 1
  Bash: 39
  Edit: 12
  EnterPlanMode: 1
  ExitPlanMode: 1
  Grep: 5
  ListAgents: 3
  Read: 21
  ScheduleWakeup: 2
  SendMessage: 1
  ToolSearch: 2
  Write: 24
tokens:
  input: 460
  output: 395438
  cache_creation: 1311455
  cache_read: 53896131
  total: 55603484
cost_usd: null
model:
  - "claude-sonnet-5"
  - "claude-sonnet-5-5"
files_touched:
  - "C:\\Users\\anant\\.claude\\plans\\graceful-wishing-gadget.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\.claude\\agents\\anti-slop-editor.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\20_Progress\\AI\\Claude OS.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\00_How This Folder Works.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Conversations.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Graphify Notes.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Knowledge Noting.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Logs.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Memory Management.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Orchestration.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Per Project Review.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Review System.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\AI Loop\\Tool Calls.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Enrich\\Review Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Log Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\AI Toolkit\\AI Conversation.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\AI Toolkit\\Graphify Notes.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\AI Toolkit\\Tool Logs.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\00_Workflows Index.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Toolkit\\Conversation Capture.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Toolkit\\Graphify Folders.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Toolkit\\Maintaining Logs.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Workflows\\Toolkit\\Tools Tracking.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\CS\\AI\\Token Optimization\\Claude Optimization Master Setup.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\CS\\AI\\Workflows\\AI Workflow.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\Obsidian\\Jarvis Vault Architecture.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\Obsidian\\MCP-Hub-Index.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\Obsidian\\Vault Operating System.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\AI Conversation - Summaries\\README.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\AI_CONTEXT.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\How to Use Claude\\Agent Operating Guide.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\How to Use Claude\\Claude OS.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\Jarvis OS — North Star.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\Vault Map.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\Vault Rules — Complete AI Ruleset.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\AGENTS.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\CLAUDE.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# converge-jarvis-instruction-layer

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/clear</command-name>
            <command-message>clear</command-message>
            <command-args></command-args>

## You

Let's dig through the main CLAUDE.md, AGENTS.md, north stars, main instructional ai agent notes that written inside this vault inside these folders: `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information`, `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian`, `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI`,  `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\How to Use Claude`, etc. We need to be providing directional and fully instructional notes over here that provide concrete information. Most of these folders mentioned do not provide instructional ai foundations that need to be established correctly. The systems that are established are not used correctly at all. We need to make sure that each and every single set of instructional document is laid out perfectly for tool use case. We have been using jarvis for a long time now. We can easily draft these instructional notes to be basic, essential, follow rules and regulations, provide knowledge, easily map through folders and files. We need to strengthen the vault to be a easy access vault for anything that is coming across this vault. For that, i decided to establish a lot of how to and why notes across the vault. But this is not the build that is taken place here, we will be establishing that inside all the main folders that are created to provide context on what is inside the folder. But the folders and files mentioned above are top tier/level notes that any ai agent will skim through no matter what, we need to take care of those notes first. Only then, we can dive into lower level task based how to and why notes to be designed correctly. We need to clearly establish the ai orchisteration inside jarvis for personal knowledge gain. To learn like a superhuman, to fully utilize jarvis to actually learn infinite knowledge on everything that is worked on without burning through tokens and using everything efficiently exactly as designed. So, for this task to take place, You need to dig through a lot of notes inside jarvis. Grab a detailed understand of what is what right now, what needs to be improved, what needs to be worked on based on the north star, and other improvement notes that are established. There are a lot of improvements required but we need to clearly design the top tier level here. Make sure to get the top tier level here perfectly configured so that we never brun tokens, everything is mentioned, easily mapped and providing the exact set of knowledge. These files should not be extremely long because that would confuse the agent. provide a lot of interlinks since that's what obsidian is all about, make sure to describe in detail exactly how to use jarvis inside the main files. Where to dig through information for each task based on the files/system designed here: 30_order. Everything written inside the vault is based of the notes that exist here. Every single note goes through the exact system established inside the order. We need to make sure that this is a strictly established rule and is always implemented. No other type of frontmatter, notes are written except the templates and the standards set for them. If the existing note does not exist, then mention it so that a new template and order is designed for that purpose. Every single note from now on is following this exact order. We work through all the main notes so that we implement this correctly. This is just thing that is required to be mentioned inside the main note. We have a lot more specifications required to be set for jarvis specifically so that the content written in it hman, well designed, perfectly using plugins each note, etc. All of it is designed and laid out for ai agents to use.

## Claude

I'll start by mapping the vault's current top-tier AI instructional layer before touching anything. Let me survey the relevant folders and read the key foundational notes.

This is a large audit-and-redesign task. I'll read the core foundational files myself, and fork out a parallel survey of the wider "top-tier" set so I don't flood my own context with raw file dumps before synthesizing.

The North Star already diagnosed a lot of this and some fixes (AGENTS.md/CLAUDE.md shrink, Vault Rules demotion) look partially executed. I need to check the rest of the stack against that diagnosis. Let me fork a survey of the remaining files.

While that survey runs in the background, let me check what the Jarvis Vault Architecture and 30_Order/Workflows Index actually say right now, since those are core authorities I'll need to reference directly rather than rely on a summary.

The survey agent didn't actually do the reading — it just echoed a "will report back" placeholder. Let me push it to actually execute.

I've nudged the survey fork to actually execute now. I'll continue my own direct reading of a few more core files while that runs.

I'm mid-audit on the vault's top-tier AI instruction layer — cross-checking what `Jarvis OS — North Star.md` already diagnosed against what's actually been fixed since. Good news so far: several of the merges North Star called for (Move 1) already happened — `Vault Operating System.md` is correctly demoted to just a property schema, `Agent Operating Guide.md` is already a redirect stub. But `Jarvis Vault Architecture.md` (the placement authority) is still 287 lines of May-dated narrative with stale "open questions" and "build order" steps that look resolved by now, and `Vault Map.md` / `AI_CONTEXT.md` still prescribe two different cold-start read orders — the exact contradiction problem North Star called out. I have a background survey running on the remaining files (`How to Use Claude/`, `30_Order/Standards/AI Loop/`, `Jarvis Writing and Formatting`, etc.) to find what else has drifted or duplicated since North Star was written. I'll report back with a concrete plan once that lands.

### Tool Calls

- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== 60_Claude/07_AI_Information ===" && find "60_Claude/07_AI_Information" -maxdepth 3 -type f -name "*.md" 2>/dev/null
echo "=== 40_Resources/Obsidian ===" && find "40_Resources/Obsidian" -maxdepth 2 -type f -name "*.md" 2>/dev/null
echo "=== 40_Resources/CS/AI ===" && find "40_Resources/CS/AI" -maxdepth 3 -type f -name "*.md" 2>/dev/null
echo "=== 30_Order ===" && find "30_Order" -maxdepth 3 -type f -name "*.md" 2>/dev/null
echo "=== root ===" && ls -la | head -30`
```
=== 60_Claude/07_AI_Information ===
60_Claude/07_AI_Information/AI Conversation - Summaries/[REDACTED] — Summary.md
60_Claude/07_AI_Information/AI Conversation - Summaries/[REDACTED] — Summary.md
60_Claude/07_AI_Information/AI Conversation - Summaries/[REDACTED] — Summary.md
60_Claude/07_AI_Information/AI Conversation - Summaries/[REDACTED] — Summary.md
60_Claude/07_AI_Information/AI Conversation - Summaries/Claude Code/[REDACTED] — Summary.md
60_Claude/07_AI_Information/AI Conversation - Summaries/Cursor Project Brief — Vault OS Upgrade.md
60_Claude/07_AI_Information/AI Conversation - Summaries/Note Writing System — Audit and Roadmap (2026-05-31).md
60_Claude/07_AI_Information/AI Conversation - Summaries/README.md
60_Claude/07_AI_Information/AI Conversation - Summaries/Summaries-to-Create.md
60_Claude/07_AI_Information/AI Conversation - Summaries/WSL Claude Code — Wiring Gap.md
60_Claude/07_AI_Information/AI_CONTEXT.md
60_Claude/07_AI_Information/Fable Prompt — Dashboard and Ingestion Pass.md
60_Claude/07_AI_Information/How Notes Were Actually Written.md
60_Claude/07_AI_Information/How to Use Claude/Agent Operating Guide.md
60_Claude/07_AI_Information/How to Use Claude/Claude OS.md
60_Claude/07_AI_Information/How to Use Claude/What Graphify Does.md
60_Claude/07_AI_Information/How to Write in This Vault.md
60_Claude/07_AI_Information/Jarvis OS — North Star.md
60_Claude/07_AI_Information/Jarvis Writing and Formatting.md
60_Claude/07_AI_Information/North Star — Execution Prompt.md
60_Claude/07_AI_Information/Plugins.md
60_Claude/07_AI_Information/Session Logs/CausalOps/HiveMind Claude Setup Prompt.md
60_Claude/07_AI_Information/Session Logs/CausalOps/Memory Layer Implementation Prompt.md
60_Claude/07_AI_Information/Session Logs/CausalOps/[REDACTED].md
60_Claude/07_AI_Information/Session Logs/CausalOps/[REDACTED].md
60_Claude/07_AI_Information/Session Logs/Convergence Worklog 2026-06-11.md
60_Claude/07_AI_Information/Session Logs/log.md
60_Claude/07_AI_Information/Session Logs/Session Logs Board.md
60_Claude/07_AI_Information/Vault Map.md
60_Claude/07_AI_Information/Vault Rules — Complete AI Ruleset.md
60_Claude/07_AI_Information/Why We Write Notes.md
=== 40_Resources/Obsidian ===
40_Resources/Obsidian/Data View's/Inbox Dashboard.md
40_Resources/Obsidian/Data View's/Kyle's Second Brain.md
40_Resources/Obsidian/Data View's/Obsidian-Excalidraw Plugin Tutorials.md
40_Resources/Obsidian/Data View's/Plugins.md
40_Resources/Obsidian/Data View's/Tasks Plugin - Review and check your Statuses 2025-12-20 18-37-12.md
40_Resources/Obsidian/Data View's/UMN Dashboard.md
40_Resources/Obsidian/Jarvis Enrichment Engine.md
40_Resources/Obsidian/Jarvis Vault Architecture.md
40_Resources/Obsidian/MCP-Hub-Index.md
40_Resources/Obsidian/Plugins/00 Plugin Reference Index.md
40_Resources/Obsidian/Plugins/AI Automation and Local Interfaces.md
40_Resources/Obsidian/Plugins/Appearance Code Math and Reading Experience.md
40_Resources/Obsidian/Plugins/Canvas Spatial Maps.md
40_Resources/Obsidian/Plugins/Dataview and Dashboards.md
40_Resources/Obsidian/Plugins/Excalidraw Diagrams and Annotation.md
40_Resources/Obsidian/Plugins/Git Recovery and Vault Safety.md
40_Resources/Obsidian/Plugins/Omnisearch and Retrieval.md
40_Resources/Obsidian/Plugins/Plugin Gaps Recommendations and Verification.md
40_Resources/Obsidian/Plugins/Plugin Inventory and Configuration Map.md
40_Resources/Obsidian/Plugins/QuickAdd Capture Menu.md
40_Resources/Obsidian/Plugins/Search Linking and Navigation.md
40_Resources/Obsidian/Plugins/Spaced Repetition and Learning Loops.md
40_Resources/Obsidian/Plugins/Tasks Kanban and Project Tracking.md
40_Resources/Obsidian/Plugins/Templates Capture and Periodic Notes.md
40_Resources/Obsidian/Plugins/Visual Thinking with Canvas and Excalidraw.md
40_Resources/Obsidian/Portfolio Option A — RAG + Hybrid Search (jarvis-memory Build).md
40_Resources/Obsidian/Second Brain.md
40_Resources/Obsidian/Settings/Appearance Theme and CSS Snippets.md
40_Resources/Obsidian/Settings/Core Plugins Hotkeys and Defaults.md
40_Resources/Obsidian/Settings/File Handling and Properties.md
40_Resources/Obsidian/Vault Operating System.md
=== 40_Resources/CS/AI ===
40_Resources/CS/AI/Claude Context (Zilliz).md
40_Resources/CS/AI/CPR - Compress Preserve Resume.md
40_Resources/CS/AI/ECC - Everything Claude Code.md
40_Resources/CS/AI/GBrain and gstack.md
40_Resources/CS/AI/Gen AI Meeting.md
40_Resources/CS/AI/LLM Council Skill.md
40_Resources/CS/AI/Mattpocock Engineering Skills.md
40_Resources/CS/AI/Promptfoo.md
40_Resources/CS/AI/Prompts/Chat Gpt Prompts.md
40_Resources/CS/AI/Spec Kit.md
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md
40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md
40_Resources/CS/AI/Workflows/AI Workflow.md
40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow.md
40_Resources/CS/AI/Workflows/UMN Workflow.md
=== 30_Order ===
30_Order/00_How This Folder Works.md
30_Order/Standards/AI Loop/Conversations.md
30_Order/Standards/AI Loop/Knowledge Noting.md
30_Order/Standards/AI Loop/Memory Management.md
30_Order/Standards/AI Loop/Orchestration.md
30_Order/Standards/AI Loop/Per Project Review.md
30_Order/Standards/AI Loop/Review System.md
30_Order/Standards/AI Loop/Tool Calls.md
30_Order/Standards/Courses/Board Standard.md
30_Order/Standards/Courses/Concept Standard.md
30_Order/Standards/Courses/Discussion Standard.md
30_Order/Standards/Courses/Exam Standard.md
30_Order/Standards/Courses/Homework Standard.md
30_Order/Standards/Courses/Lab Standard.md
30_Order/Standards/Courses/Preparation Standard.md
30_Order/Standards/Courses/Project Standard.md
30_Order/Standards/Courses/Textbook Map Standard.md
30_Order/Standards/Courses/Textbook Standard.md
30_Order/Standards/Courses/Weekly Board Standard.md
30_Order/Standards/Courses/Weekly Standard.md
30_Order/Standards/Daily Workflow Standard.md
30_Order/Standards/Decoration Standard.md
30_Order/Standards/Editing Standard.md
30_Order/Standards/Enrich/Evergreen Standard.md
30_Order/Standards/Enrich/Human Writing Standard.md
30_Order/Standards/Enrich/Plugins Usage Standard.md
30_Order/Standards/Enrich/Review Standard.md
30_Order/Standards/Enrich/Source Summary Standard.md
30_Order/Standards/Enrich/Tracking Standard.md
30_Order/Standards/Ingestion/Action Standard.md
30_Order/Standards/Ingestion/Brief Standard.md
30_Order/Standards/Ingestion/Humanized Writing Standard.md
30_Order/Standards/Ingestion/PDF Extraction Standard.md
30_Order/Standards/Internship/Applying Standard.md
30_Order/Standards/Internship/Cover Letter Alteration Standard.md
30_Order/Standards/Internship/Deadline and Intake Triage Standard.md
30_Order/Standards/Internship/Internship Loop Review Standard.md
30_Order/Standards/Internship/Internship Notes Standard.md
30_Order/Standards/Internship/Internship Tracker Standard.md
30_Order/Standards/Internship/Resume Alteration Standard.md
30_Order/Standards/Log Standard.md
30_Order/Standards/MOC Standard.md
30_Order/Standards/Project Standard.md
30_Order/System/claude-workflow/Cowork-Operating-System.md
30_Order/System/claude-workflow/README.md
30_Order/System/cursor-workflow/README.md
30_Order/System/excalidraw-mcp/README.md
30_Order/System/jarvis-cli/README.md
30_Order/System/jarvis-memory/README.md
30_Order/System/sync-workflow/Sync Alert Banner.md
30_Order/Templates/AI Use/AI Monthly Review Template.md
30_Order/Templates/AI Use/AI Weekly Review Template.md
30_Order/Templates/AI Use/Clipping Distill Template.md
30_Order/Templates/AI Use/Deep Dive Template.md
30_Order/Templates/Capability/Action Template.md
30_Order/Templates/Capability/Brief Template.md
30_Order/Templates/Capability/Depth Ladder Template.md
30_Order/Templates/Capability/Field OS Template.md
30_Order/Templates/Capability/MOC Template.md
30_Order/Templates/Capability/Output Template.md
30_Order/Templates/Capability/Question Bank Template.md
30_Order/Templates/Capability/Synthesis Template.md
30_Order/Templates/Career/List Monthly Log Template.md
30_Order/Templates/Career/Plan Template.md
30_Order/Templates/Classes/Board or Main Template.md
30_Order/Templates/Classes/Concept Template.md
30_Order/Templates/Classes/Discussion Template.md
30_Order/Templates/Classes/Exam Sheet Template.md
30_Order/Templates/Classes/Homework Template.md
30_Order/Templates/Classes/Lab Template.md
30_Order/Templates/Classes/Preparation Template.md
30_Order/Templates/Classes/Project Template.md
30_Order/Templates/Classes/Textbook Map Template.md
30_Order/Templates/Classes/Textbook Template.md
30_Order/Templates/Classes/Week Template.md
30_Order/Templates/Classes/Weekly Board Template.md
30_Order/Templates/Enumerate/Better Month.md
30_Order/Templates/Enumerate/Better Today.md
30_Order/Templates/Enumerate/Better Weekly.md
30_Order/Templates/Enumerate/Better Year.md
30_Order/Templates/Frontmatter/For AI.md
30_Order/Templates/Frontmatter/For Brainstorm.md
30_Order/Templates/Frontmatter/For Classes.md
30_Order/Templates/Frontmatter/For Evergreen.md
30_Order/Templates/Frontmatter/For Everything.md
30_Order/Templates/Frontmatter/For Inputs.md
30_Order/Templates/Frontmatter/For Progress.md
30_Order/Templates/Frontmatter/For Thoughts.md
30_Order/Templates/Frontmatter/For Transcript.md
30_Order/Templates/MOC.md
30_Order/Workflows/00_Workflows Index.md
30_Order/Workflows/Courses/Board Workflow.md
30_Order/Workflows/Courses/Concept Workflow.md
30_Order/Workflows/Courses/Course Production Workflow.md
30_Order/Workflows/Courses/Discussion Workflow.md
30_Order/Workflows/Courses/Exam Workflow.md
30_Order/Workflows/Courses/Homework Workflow.md
30_Order/Workflows/Courses/Lab Workflow.md
30_Order/Workflows/Courses/Preparation Workflow.md
30_Order/Workflows/Courses/Projects Workflow.md
30_Order/Workflows/Courses/Textbook Map Workflow.md
30_Order/Workflows/Courses/Textbook Workflow.md
30_Order/Workflows/Courses/Weekly Board Workflow.md
30_Order/Workflows/Courses/Weekly Workflow.md
30_Order/Workflows/Enrichment/Capture to Summary.md
30_Order/Workflows/Enrichment/Decoration.md
30_Order/Workflows/Enrichment/Enrichment.md
30_Order/Workflows/Enrichment/Human Content Writer.md
30_Order/Workflows/Enrichment/Output with Provenance.md
30_Order/Workflows/Enrichment/Plugins Usage.md
30_Order/Workflows/Enrichment/Researcher.md
30_Order/Workflows/Ingestion/Brief to Action.md
30_Order/Workflows/Ingestion/Brief to Progress.md
30_Order/Workflows/Ingestion/Conversation Capture.md
30_Order/Workflows/Ingestion/PDF Extraction.md
30_Order/Workflows/Ingestion/Plan Review Cadence.md
30_Order/Workflows/Ingestion/Summary to Distilled.md
30_Order/Workflows/Ingestion/Transcript to Brief.md
30_Order/Workflows/Internship/Application Document Preparation 1.md
30_Order/Workflows/Internship/Application Document Preparation.md
30_Order/Workflows/Internship/Internship - Design Rationale.md
30_Order/Workflows/Internship/Internship Pipeline.md
30_Order/Workflows/Internship/Internship Review System.md
30_Order/Workflows/Internship/Internship Tracking Workflow.md
30_Order/Workflows/Internship/Promotion.md
=== root ===
total 138
drwxr-xr-x 1 anant 197609     0 Oct 15 15:24 .
drwxr-xr-x 1 anant 197609     0 Oct  2 23:15 ..
drwxr-xr-x 1 anant 197609     0 Sep 19 16:07 .agents
drwxr-xr-x 1 anant 197609     0 Oct 11 14:43 .claude
drwxr-xr-x 1 anant 197609     0 Oct  2 00:03 .codex
drwxr-xr-x 1 anant 197609     0 Sep 19 16:08 .cursor
drwxr-xr-x 1 anant 197609     0 Sep 19 16:21 .firecrawl
drwxr-xr-x 1 anant 197609     0 Oct 15 17:12 .git
-rw-r--r-- 1 anant 197609   492 Oct  1 23:28 .gitattributes
-rw-r--r-- 1 anant 197609 11995 Oct 15 15:24 .gitignore
drwxr-xr-x 1 anant 197609     0 Sep 19 16:08 .kiro
-rw-r--r-- 1 anant 197609   193 Sep 20 21:03 .mcp.json
drwxr-xr-x 1 anant 197609     0 Oct 11 14:37 .obsidian
drwxr-xr-x 1 anant 197609     0 Oct  7 18:03 .opencode
drwxr-xr-x 1 anant 197609     0 Sep 20 14:03 .stfolder
-rw-r--r-- 1 anant 197609 11494 Oct 15 15:24 .stignore
drwxr-xr-x 1 anant 197609     0 Oct 12 07:54 .stversions
drwxr-xr-x 1 anant 197609     0 Sep 19 16:14 .vscode
-rw-r--r-- 1 anant 197609  7461 Oct  9 23:03 00_Dashboard.md
drwxr-xr-x 1 anant 197609     0 Sep 19 16:47 10_Areas
drwxr-xr-x 1 anant 197609     0 Sep 29 13:44 20_Progress
drwxr-xr-x 1 anant 197609     0 Sep 19 16:12 30_Order
drwxr-xr-x 1 anant 197609     0 Sep 19 16:12 40_Resources
drwxr-xr-x 1 anant 197609     0 Sep 19 16:07 50_Archive
drwxr-xr-x 1 anant 197609     0 Sep 19 16:37 60_Claude
-rw-r--r-- 1 anant 197609  6740 Oct  7 16:45 AGENTS.md
-rw-r--r-- 1 anant 197609  5402 Oct  1 23:03 CLAUDE.md
-rw-r--r-- 1 anant 197609  6217 Oct  9 21:48 HUMAN_WRITING.md
drwxr-xr-x 1 anant 197609     0 Sep 25 16:15 Tracker
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Jarvis OS — North Star.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI_CONTEXT.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Map.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Rules — Complete AI Ruleset.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\00_How This Folder Works.md`
- `Agent` -- `{"subagent_type":"fork","description":"Survey remaining top-tier AI instruction files","prompt":"You are forked mid-task. The user wants a full audit-and-redesign pass over the top-tier AI-instructional layer of this Obsidian vault (Jarvis), so that every \"how to use Jarvis\" note an AI agent would skim on a cold start is concise, non-duplicated, correctly interlinked, and enforces the 30_Order template/standard system strictly.\n\nI (the main thread) have already read in full: `Jarvis OS — North Star.md` (60_Claude/07_AI_Information/), `AI_CONTEXT.md` (same folder), `Vault Map.md` (same folder), `Vault Rules — Complete AI Ruleset.md` (same folder, now titled \"Vault Rules — Operational Reference\" — appears already demoted per North Star\u0027s own audit), `30_Order/00_How This Folder Works.md`, plus root `CLAUDE.md` and `AGENTS.md` (both already shrunk to one-screen contracts per North Star Move 1).\n\nKey fact: the North Star file (Part 4) already contains a table of verdicts for the OLD instruction layer: keep/merge/cut/demote decisions for Vault Map, AI_CONTEXT, Vault Rules, Jarvis Writing and Formatting, Agent Operating Guide, Vault Operating System, Claude Pro Workflow, etc. Some of these verdicts already look partially executed (Vault Rules has been demoted and retitled; AGENTS/CLAUDE already shrunk). I need to find out, for the REST of the stack, what state things are actually in now versus what North Star prescribed, and survey files North Star never even mentioned.\n\nYour job: read the following files in full and report back findings. Do NOT just summarize — I need enough concrete detail (exact claims of \"authority\", exact overlaps, exact stale dates/references, exact length) that I can make real edit decisions without re-reading most of these myself.\n\nFiles to read (all under D:\\_Anant\\20_Progress\\Documents\\Jarvis\\):\n1. 60_Claude/07_AI_Information/How to Use Claude/Agent Operating Guide.md\n2. 60_Claude/07_AI_Information/How to Use Claude/Claude OS.md\n3. 60_Claude/07_AI_Information/How to Use Claude/What Graphify Does.md\n4. 60_Claude/07_AI_Information/How to Write in This Vault.md\n5. 60_Claude/07_AI_Information/Jarvis Writing and Formatting.md\n6. 60_Claude/07_AI_Information/Why We Write Notes.md\n7. 60_Claude/07_AI_Information/How Notes Were Actually Written.md\n8. 60_Claude/07_AI_Information/North Star — Execution Prompt.md\n9. 60_Claude/07_AI_Information/Plugins.md\n10. 40_Resources/Obsidian/Jarvis Vault Architecture.md\n11. 40_Resources/Obsidian/Vault Operating System.md\n12. 40_Resources/Obsidian/Jarvis Enrichment Engine.md\n13. 40_Resources/Obsidian/MCP-Hub-Index.md\n14. 40_Resources/Obsidian/Second Brain.md\n15. 40_Resources/Obsidian/Portfolio Option A — RAG + Hybrid Search (jarvis-memory Build).md\n16. 40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md\n17. 40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md\n18. 40_Resources/CS/AI/Workflows/AI Workflow.md\n19. HUMAN_WRITING.md (vault root)\n20. 30_Order/Standards/AI Loop/Orchestration.md\n21. 30_Order/Standards/AI Loop/Conversations.md\n22. 30_Order/Standards/AI Loop/Knowledge Noting.md\n23. 30_Order/Standards/AI Loop/Memory Management.md\n24. 30_Order/Standards/AI Loop/Per Project Review.md\n25. 30_Order/Standards/AI Loop/Review System.md\n26. 30_Order/Standards/AI Loop/Tool Calls.md\n27. 30_Order/Workflows/00_Workflows Index.md\n\nFor each file report, in compact form:\n- Path, frontmatter type/status/created/updated, line count\n- One or two sentences on what it actually contains / claims to own\n- Any explicit \"authority\" / \"canonical\" / \"this is the single source\" claims\n- Any cold-start read-order prescription it gives (exact sequence if present)\n- Overlap: name specific other files in this list (or the five I already read) that restate the same rule/content\n- Staleness: references to things that may not exist anymore (old plan names, dead links, dates far in the past vs today 2026-10-15), or content that contradicts the North Star\u0027s already-stated verdicts\n- Whether it is well-interlinked (wikilinks to the right authority files) or orphaned/disconnected\n\nAlso flag: does `30_Order/Standards/AI Loop/*` duplicate anything in the 07_AI_Information folder (this is the likely biggest hidden overlap — the North Star didn\u0027t audit 30_Order/Standards/AI Loop/ at all)?\n\nEnd with a short prioritized list: which of these files should be killed/merged/pointer-ified, which are genuinely load-bearing and unique, and which are stale enough to flag for deletion outright. Keep your final report under 1200 words — I need the facts, not polish."}`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\Jarvis Vault Architecture.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\00_Workflows Index.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== 10_Areas top level ===" && ls "10_Areas" && echo "=== check for hub notes ===" && find "10_Areas" -maxdepth 1 -name "*.md" && echo "=== 20_Progress top ===" && ls "20_Progress" && echo "=== dashboard head ===" && head -40 "00_Dashboard.md"`
```
=== 10_Areas top level ===
AI
Career
Excalidraw
Jarvis OS Dashboard.canvas
Life
Notes
Summer Grind.md
Trading
=== check for hub notes ===
10_Areas/Summer Grind.md
=== 20_Progress top ===
AI
Degree
Internship
Mentorship Program
Projects
=== dashboard head ===
---
type: dashboard
status: tree
created: 2026-04-23
updated: 2026-10-09
tags:
  - dashboard
  - daily
cssclasses:
  - dashboard
today_focus: Close the Main Cover Letter.md blocker and send the first
  real application; CSCI 4061 Midterm 1 is Thursday 10/8
today_80: Build Main Cover Letter.md's bullet bank for real and move
  Uber - 2027 SWE Intern from Current/ to Applied/
today_20: LeetCode/CodePath ≥5 (Google rotation, TIP103 Unit 1), start
  CSCI 4061 Midterm 1 review (due 10/8), run /closeday
lc_today: 0
study_today: 4
wins_done: 4
notes:
  - "[[CLAUDE.md]]"
  - "[[AGENTS.md]]"
  - "[[Jarvis OS — North Star]]"
---
<!-- SYNC-ALERT:BEGIN -->
![[30_Order/System/sync-workflow/Sync Alert Banner]]
<!-- SYNC-ALERT:END -->

# Jarvis — `$= moment().format("dddd, D MMMM YYYY")`
> [!focus] CURRENT FOCUS
> **`INPUT[text:today_focus]`**
> `INPUT[text:today_80]`
> `INPUT[text:today_20]`
> *Patched by /startday · cleared by /closeday.*

=== start-multi-column: JarvisDash
```column-settings
Number of Columns: 2
Largest Column: left
Border: off
```
- `ListAgents` -- `{}`
- `ToolSearch` -- `{"query":"select:SendMessage","max_results":3}`
- `SendMessage` -- `{"to":"a4825f3ba99c3cc21","summary":"Actually perform the file survey now","message":"You stopped early and only replied with a status placeholder (\"survey running in background, I\u0027ll report back\") without actually reading any files (0 tool uses recorded). There is no separate background process — you ARE the one who needs to read these files and produce the report, right now, in this turn, using your Read tool.\n\nPlease actually execute the task now: Read each of the 27 files listed in my original prompt in full, and produce the real structured findings report (per-file: path, frontmatter, line count, what it contains/claims, authority claims, cold-start read-order prescriptions, overlaps with named files, staleness, interlink quality), ending with the prioritized kill/merge/keep list — all under 1200 words. Do not say you\u0027ll report back later; give me the actual findings in your response now.","type":"message","recipient":"a4825f3ba99c3cc21","recipient_kind":"agent","content":"You stopped early and only replied with a status …"}`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\Vault Operating System.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\How to Use Claude\Agent Operating Guide.md`
- `ScheduleWakeup` -- `{"delaySeconds":90,"reason":"Waiting on resumed survey fork to actually read files and report; checking back shortly rather than polling immediately","prompt":"\u003c\[REDACTED]\u003e\u003e","noop":true}`
- `ScheduleWakeup` -- `{"stop":true}`

## You

<task-notification>
<task-id>a4825f3ba99c3cc21</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\tasks\a4825f3ba99c3cc21.output</output-file>
<status>completed</status>
<summary>Agent "Survey remaining top-tier AI instruction files" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>## Survey report — 27 files read

**Directive:** audit the top-tier AI-instructional files North Star's Part 4 never covered (How to Use Claude/, Jarvis Vault Architecture, Vault Operating System, 30_Order/Standards/AI Loop/, Claude Pro Workflow, etc.) and flag kill/merge/keep.

### Already-resolved pointers (good — no action needed)
- **`Agent Operating Guide.md`** (sprout, 27 lines) — already a pure redirect stub, "no unique content remains." Fine as-is.
- **`How to Write in This Vault.md`** (sprout, 26 lines) — clean map pointing to HUMAN_WRITING / Jarvis Writing and Formatting / 30_Order. No duplication. Good model for what a thin pointer file looks like.
- **`Vault Operating System.md`** (**tree**, 85 lines) — already demoted exactly per North Star's verdict: pure property-schema table + pointers. No action needed, though it's `status: tree` in `40_Resources/Obsidian/` while the real authority (`Jarvis Vault Architecture`, also `tree`) lives one level up in the same folder — mildly confusing to have two "tree" system docs in one folder, worth a one-line disambiguation in whichever orientation file lists them.

### Genuinely load-bearing, unique, keep
- **`Jarvis Writing and Formatting.md`** (sprout, 524 lines) — the actual formatting authority (blank-line rules, markers, frontmatter fields, Quality Gate 16-point checklist, Content Density Standard, Source Note Format Rules, Safety Rules). This is the single biggest file in the stack and is NOT redundant with HUMAN_WRITING (which only covers voice) — it's the real mechanics spec North Star's Part 4 said to keep. No merge needed; it already absorbed Vault Rules Parts 3–9.
- **`Jarvis Vault Architecture.md`** (**tree**, 288 lines) — real placement authority, detailed and current, already cross-linked correctly. Long but each section earns its place (contracts per folder). Candidate for trimming prose/open-questions sections (dated 2026-05-31, many "open questions" likely stale — e.g. "10_Areas has no identity notes yet," "coursework has two homes" — check against current state before trusting).
- **`Jarvis Enrichment Engine.md`** (sprout, 130 lines) — unique content (enrichment modes, write pattern, quality gate for enrichment specifically). Not duplicated elsewhere. Keep.
- **`30_Order/Workflows/00_Workflows Index.md`** (**tree**, 61 lines) — unique, correctly scoped, the actual workflow-picker. Keep as-is.
- **`HUMAN_WRITING.md`** (root) — voice authority, clean, already points to Jarvis Writing and Formatting for the mechanics half. No overlap found. Keep.

### Stale / needs a rewrite or deletion
- **`Claude OS.md`** (How to Use Claude/, dashboard, 220 lines) — dated 2026-07-03, now **3+ months stale** against today (2026-10-15). References specific verified states ("jarvis-memory verified 2026-07-03," "all 5 agents have frontmatter as of 2026-07-03") that may no longer hold — should be re-verified or re-labeled as a dated snapshot, not living truth. Also claims a different source-of-truth location (`20_Progress/AI/Claude OS Dashboard`) that nothing else in the top-tier stack references — orphaned branch of the instruction graph.
- **`MCP-Hub-Index.md`** (40_Resources/Obsidian/, sprout, 138 lines) — **badly stale**, uses an entirely different folder numbering than current reality: `60_Claude/7_AI_Information` (no leading zero, wrong — should be `07_`), `60_Claude/10_Session_Logs` (current is `Session Logs` under `07_AI_Information`), `60_Claude/30_Source_Summaries` (current is `10_Source_Summaries`), `60_Claude/60_Indexes` (current is `44_Indexes`), `60_Claude/45_Outputs` (current is `35_Outputs`). This file describes a vault structure that **no longer exists**. It duplicates Vault Map's "orientation for any AI tool" role but with wrong data. **Kill or fully rewrite** — right now it actively misleads any agent that reads it.
- **`Claude Pro Workflow.md`** (CS/AI/Token Optimization/, sprout, 157 lines) — mixes still-current rate-limit/context-pack guidance with the same stale path (`60_Claude/7_AI_Information`, in the Cowork section only — most of the file correctly uses `07_AI_Information`). Content itself (surface roles, token discipline block, hook policy) is genuinely useful and not duplicated elsewhere — keep, but fix the one stale path reference.
- **`Claude Optimization Master Setup.md`** (CS/AI/Token Optimization/, project/active, 267 lines) — a dated action-item snapshot from 2026-05-28 ("install mattpocock/skills," "create CONTEXT.md," action checklists). Largely **historical** now — some items may be done, some abandoned. Also uses stale paths (`60_Claude/7_AI_Information`, `60_Claude/10_Session_Logs`, `60_Claude/30_Source_Summaries`, `60_Claude/60_Indexes/Field OS/`). Should be either archived (it's a point-in-time plan, not a standing instruction) or stripped to only the durable parts (the skill list, the rate-limit discipline — both already stated better in Claude Pro Workflow).
- **`AI Workflow.md`** (CS/AI/Workflows/, input, 568 lines) — a GPT-generated plan from 2026-03-07 for a ChatGPT-Pro-centric multi-tool workflow. Explicitly flagged as outdated by `Claude Optimization Master Setup` itself ("ignore the tool hierarchy and budget math"). This is pure historical clutter in the top-tier AI folder — **candidate for moving to 50_Archive or deletion**, not something any agent should read on a cold start.

### Non-issues / out of scope but noted
- **`What Graphify Does.md`** and **`How Notes Were Actually Written.md`** — both scoped to one specific past CausalOps session, not vault-wide instruction. They're fine where they are but don't belong in any "top-tier cold-start" reading list; no overlap with the instruction spine.
- **`North Star — Execution Prompt.md`** — a one-time paste-able prompt, already self-contained and dated correctly, not duplicative.
- **`Plugins.md`** (07_AI_Information, 500 lines) — unique agent-facing plugin operating manual, correctly pointed at the deeper `40_Resources/Obsidian/Plugins/` reference layer. No overlap found. Keep.
- **`Portfolio Option A — RAG + Hybrid Search.md`** — a project-brief-shaped note misfiled in `40_Resources/Obsidian/` (its own frontmatter admits this placement choice). Not an instructional file — out of scope for this audit, flag separately for a Jarvis Vault Architecture placement review.
- **`Second Brain.md`** (40_Resources/Obsidian/) — a personal link/hotkey dump, `type: brainstorm`. Not instructional, mislabeled as living in the "top-tier" folder only by location. No overlap, no action for this audit.

### Biggest finding: `30_Order/Standards/AI Loop/*` is entirely empty
All six files — **`Orchestration.md`, `Conversations.md`, `Knowledge Noting.md`, `Memory Management.md`, `Per Project Review.md`, `Review System.md`, `Tool Calls.md`**, plus **`Tool Calls.md`** — are **0 bytes**. This is a real, unaudited gap: six Standards files exist by name (so `30_Order/00_How This Folder Works.md`'s own rule — "never leave a Standard, Template, or Workflow file created but empty" — is currently being violated) but hold no content. They are not duplicating anything in `07_AI_Information` (there's nothing to duplicate), but their existence as empty-but-named files is actively worse than not existing, per `00_How This Folder Works.md`'s own stated rule. This needs either real content (if "AI Loop" as a Standards subdomain is still wanted) or deletion.

### Priority kill/merge list
1. **Kill or fully rewrite:** `MCP-Hub-Index.md` (stale paths throughout, misleads agents)
2. **Archive out of the instruction layer:** `AI Workflow.md` (superseded, 2026-03 tool-era document)
3. **Trim/archive to history:** `Claude Optimization Master Setup.md` (point-in-time action list, not standing instruction)
4. **Fix one stale path, otherwise keep:** `Claude Pro Workflow.md`
5. **Re-verify or re-date:** `Claude OS.md` (3+ months stale snapshot presented as current)
6. **Fill or delete:** the 6 empty `30_Order/Standards/AI Loop/*.md` files — currently a Write Contract violation sitting undetected
7. **Keep unchanged:** `Jarvis Writing and Formatting`, `Jarvis Vault Architecture`, `Jarvis Enrichment Engine`, `HUMAN_WRITING`, `00_Workflows Index`, `Agent Operating Guide`, `How to Write in This Vault`, `Vault Operating System`, `Plugins.md`</result>
<usage><subagent_tokens>190668</subagent_tokens><tool_uses>27</tool_uses><duration_ms>58479</duration_ms></usage>
</task-notification>

## Claude

I now have the full picture. Before touching anything, let me lay out a concrete plan — this touches several `status: tree` (stable) files and the project's own CLAUDE.md requires proposing changes to those before editing, and there are a few real decision points only you can make.

The AI Loop standards answer is a significant scope expansion: you want these 7 empty files filled with content that reflects what's *actually already practiced* scattered across the vault, not invented from scratch — reconciling existing session-log/conversation/review/tool-use patterns into the proper Standard→Template→Workflow shape. Let me map where that real content already lives before drafting anything.

Three research agents are now mapping existing conversation/memory, orchestration/tool-call, and review content against the 7 empty AI Loop standards. I'll report back with the full plan once they land — this will take a few minutes.

### Tool Calls

- `ToolSearch` -- `{"query":"select:EnterPlanMode","max_results":3}`
- `EnterPlanMode` -- `{}`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\MCP-Hub-Index.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\How to Use Claude\Claude OS.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- Career ---" && ls "10_Areas/Career" && echo "--- Life ---" && ls "10_Areas/Life" && echo "--- Trading ---" && ls "10_Areas/Trading" && echo "--- UMN ---" && ls "10_Areas/UMN" | head -10 && echo "--- Notes ---" && ls "10_Areas/Notes" 2>/dev/null | head -10`
```
--- Career ---
Certifications
Engineer Edge Roadmap.md
Finance
Freelancing.md
Hackathon
Internships
Mentors
Useful Links.md
--- Life ---
Books
Enumerate
Habits
Plans
Tracking
Truths of Life
--- Trading ---
Stocks Trading AI Hub.md
--- UMN ---
ls: cannot access '10_Areas/UMN': No such file or directory
--- Notes ---
F'25
Files
PDFs
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- mcp-hub skill? ---" && find .claude/skills -iname "*mcp-hub*" 2>/dev/null && echo "--- 20_Progress/AI dir ---" && ls "20_Progress/AI" 2>/dev/null && echo "--- AI Loop file sizes ---" && ls -la "30_Order/Standards/AI Loop/" && echo "--- How to Use Claude dir ---" && ls "60_Claude/07_AI_Information/How to Use Claude"`
```
--- mcp-hub skill? ---
.claude/skills/mcp-hub
.claude/skills/mcp-hub/mcp-hub.md
--- 20_Progress/AI dir ---
Claude Code
Claude OS Dashboard.canvas
Claude OS Dashboard.md
Codex
Cursor
Google Skills + AI Pro.md
Kiro
--- AI Loop file sizes ---
total 8
drwxr-xr-x 1 anant 197609 0 Sep 26 16:11 .
drwxr-xr-x 1 anant 197609 0 Sep 26 16:04 ..
-rw-r--r-- 1 anant 197609 0 Sep 26 16:03 Conversations.md
-rw-r--r-- 1 anant 197609 0 Sep 26 16:04 Knowledge Noting.md
-rw-r--r-- 1 anant 197609 0 Sep 26 16:04 Memory Management.md
-rw-r--r-- 1 anant 197609 0 Sep 26 16:10 Orchestration.md
-rw-r--r-- 1 anant 197609 0 Sep 26 16:10 Per Project Review.md
-rw-r--r-- 1 anant 197609 0 Sep 26 16:04 Review System.md
-rw-r--r-- 1 anant 197609 0 Sep 26 16:03 Tool Calls.md
--- How to Use Claude dir ---
Agent Operating Guide.md
Claude OS.md
What Graphify Does.md
```
- `AskUserQuestion` -- `{"questions":[{"question":"30_Order/Standards/AI Loop/ has 7 empty standards files (Orchestration, Conversations, Knowledge Noting, Memory Management, Per Project Review, Review System, Tool Calls) — named exactly like the \"AI orchestration for knowledge gain\" system you described, but with zero content, which already violates 30_Order\u0027s own \"never leave a named-but-empty Standard\" rule. What should happen to them in this pass?","header":"AI Loop standards","multiSelect":false,"options":[{"label":"Delete now, design later (Recommended)","description":"Remove the 7 empty files as pure debt. Note in 00_How This Folder Works that an \u0027AI Loop\u0027 standards set is a deliberate future addition, to be designed in the dedicated lower-tier pass you mentioned — not invented hastily inside this top-tier cleanup."},{"label":"Leave them, just flag as TODO","description":"Keep the empty files as placeholders but add a one-line note in 30_Order\u0027s index flagging them as reserved-but-unwritten, so the Write Contract violation is at least visible and intentional."},{"label":"Draft real content now","description":"Treat this as in-scope for the current pass and have me write all 7 Standards (each needing a Gold Standard Example, matching Template, and cross-links) now. This is a substantial content-design task on top of the top-tier cleanup, not a quick fix."}]},{"question":"`Claude OS.md` currently sits in `60_Claude/07_AI_Information/How to Use Claude/` but its actual content is a cross-project tooling registry (agents/skills/hooks/MCP servers across Jarvis, CausalOps, Cursor, Kiro, Codex), not vault orientation — and it\u0027s 3+ months stale (dated 2026-07-03). Its companion dashboard/canvas already lives in `20_Progress/AI/`. What should happen to it?","header":"Claude OS.md placement","multiSelect":false,"options":[{"label":"Move to 20_Progress/AI/ (Recommended)","description":"Relocate next to its companion Claude OS Dashboard.md/.canvas, add a \u0027last verified 2026-07-03, re-verify before trusting\u0027 banner, and leave How to Use Claude/ holding only genuine vault-operating instructions."},{"label":"Leave in place, just add a staleness banner","description":"Don\u0027t move the file — only add a note flagging it as a dated snapshot, not living truth. Keeps the file where it is in case something already links to that exact path."},{"label":"Skip entirely","description":"Leave it untouched; it\u0027s out of scope for this pass."}]}]}`
- `Agent` -- `{"subagent_type":"Explore","description":"Map existing Conversations/Knowledge/Memory content","prompt":"In the Obsidian vault at D:\\_Anant\\20_Progress\\Documents\\Jarvis, I need to find all EXISTING content (already written, already practiced) that relates to three themes, because I\u0027m about to write three empty Standards files (30_Order/Standards/AI Loop/Conversations.md, Knowledge Noting.md, Memory Management.md) and the content must be grounded in what the vault already does, not invented.\n\nSearch thoroughly (medium-thorough breadth) and report back, for EACH of the three themes, concrete findings:\n\n**1. Conversations** — how AI conversations (with Claude, ChatGPT, Cursor, etc.) get captured/summarized in this vault.\n- Read `30_Order/Workflows/Ingestion/Conversation Capture.md` in full and report its exact steps/fields.\n- List files under `60_Claude/07_AI_Information/AI Conversation - Summaries/` (there\u0027s a README.md and several dated summary notes plus a Claude Code subfolder) — read the README and 1-2 real example summary notes to see the actual frontmatter/structure used in practice.\n- Check if there\u0027s a \"Brief Standard\" or similar under `30_Order/Standards/Ingestion/` that already covers transcript-to-brief work (there\u0027s a `Brief Standard.md` and workflow `Transcript to Brief.md`) — read both, report their frontmatter schema and structure.\n\n**2. Knowledge Noting** — how raw knowledge becomes durable notes (the capture→distill pipeline).\n- Read `30_Order/Standards/Enrich/Evergreen Standard.md`, `30_Order/Standards/Enrich/Source Summary Standard.md` in full.\n- Read `30_Order/Workflows/Ingestion/Capture to Summary.md` (actual filename may be `Ingestion/Capture to Summary.md` or similar — check `30_Order/Workflows/` listing) and `Enrichment/Summary to Distilled.md`.\n- Report whether these already fully cover \"how AI takes notes on knowledge\" or if there\u0027s a gap only a new \"Knowledge Noting\" standard would fill.\n\n**3. Memory Management** — how continuity/memory persists across sessions.\n- Read the \"Continuity Protocol\" section in `60_Claude/07_AI_Information/AI_CONTEXT.md` (already read by me, but you re-verify current content).\n- Read `60_Claude/07_AI_Information/Session Logs/log.md` — just the last ~40 lines (tail) to see the actual format being used in practice, not a template.\n- Check `30_Order/Standards/Log Standard.md` in full — does it already cover session-log format?\n- Search for any mention of \"CPR\" / \"compress preserve resume\" pattern in the vault (`40_Resources/CS/AI/CPR - Compress Preserve Resume.md`) — read it, report its core mechanism in 3-4 sentences.\n- Check whether `jarvis-memory` MCP server (`30_Order/System/jarvis-memory/README.md`) has any documented \"memory management\" contract worth citing.\n\nFor each of the 3 themes, end with a one-paragraph verdict: **\"a dedicated Standard here would duplicate X (cite the file) unless scoped narrowly to Y\"** or **\"no existing Standard covers this — a new one is genuinely needed, and here\u0027s the real-practice material to ground it in (cite the files/examples).\"**\n\nKeep the full report under 900 words — I need citable facts (file paths, exact frontmatter fields, exact structure), not a general restatement."}`
- `Agent` -- `{"subagent_type":"Explore","description":"Map existing Orchestration/Tool Calls content","prompt":"In the Obsidian vault at D:\\_Anant\\20_Progress\\Documents\\Jarvis, I need to find all EXISTING content (already written, already practiced) that relates to two themes, because I\u0027m about to write two empty Standards files (30_Order/Standards/AI Loop/Orchestration.md and Tool Calls.md) and the content must be grounded in what the vault already does, not invented.\n\nSearch thoroughly and report back, for EACH theme, concrete findings:\n\n**1. Tool Calls** — how an AI agent should choose which tool to use for a given situation.\n- Read `60_Claude/07_AI_Information/Vault Rules — Complete AI Ruleset.md` in full (it may now be titled \"Vault Rules — Operational Reference\" — read whatever is actually there) — it has a \"Tool Selection\" section with tables for Reading Files / Writing Files / MCP Filesystem Tools / Subagents. Quote the exact tables.\n- This looks like a near-exact duplicate of what a \"Tool Calls\" standard would contain. Confirm this by comparing structure, and report whether the right move is \"move this section verbatim into the new Standard and leave Vault Rules pointing at it\" or \"they\u0027re different enough to coexist.\"\n\n**2. Orchestration** — how multiple agents/subagents/skills coordinate on a task.\n- Read `60_Claude/07_AI_Information/Jarvis OS — North Star.md` Part 5.2 (\"The agent / subagent standard\") — already summarized to me, but re-read and quote its exact rules about subagent file shape, frontmatter, tool allowlists.\n- Read `60_Claude/07_AI_Information/Vault Map.md`\u0027s \"Workflow Chooser\" section (Dataview/Tasks/Kanban/Excalidraw/Spaced Repetition/Templater — when to use each).\n- List the `.claude/agents/*.md` files in this vault (there should be ~8-9: anti-slop-editor, career-operator, daily-operator, human-operator, ingestion, learning-agent, note-to-actions, professor, research-distiller, vault-curator) and read 2-3 of them to see their actual frontmatter pattern (name/description/tools) — report the pattern.\n- Check `60_Claude/07_AI_Information/How to Use Claude/Claude OS.md` for its agent roster table (5 agents: research-distiller, anti-slop-editor, vault-curator, learning-agent, career-operator) — note this may be stale/outdated vs the actual `.claude/agents/` folder contents; report the discrepancy if any (e.g. agent count mismatch).\n- Report whether there\u0027s an existing standard for \"when does a task warrant spawning a subagent vs. doing it inline\" (North Star Part 6 rule 5 touches this) — quote it.\n\nEnd each theme with a one-paragraph verdict: **\"a dedicated Standard here would duplicate X (cite file) unless scoped as Y\"** or **\"no existing Standard covers this — here\u0027s the real material to ground a new one in.\"**\n\nKeep the full report under 700 words — cite exact file paths and quote short exact passages, not paraphrases."}`
- `Agent` -- `{"subagent_type":"Explore","description":"Map existing Review/Per-Project-Review content","prompt":"In the Obsidian vault at D:\\_Anant\\20_Progress\\Documents\\Jarvis, I need to find all EXISTING content (already written, already practiced) that relates to two themes, because I\u0027m about to write two empty Standards files (30_Order/Standards/AI Loop/Per Project Review.md and Review System.md) and the content must be grounded in what the vault already does, not invented.\n\nSearch thoroughly and report back, for EACH theme, concrete findings:\n\n**1. Review System** — general review cadence (daily/weekly/monthly/quarterly) across the vault.\n- Read `30_Order/Standards/Enrich/Review Standard.md` in full.\n- Read `30_Order/Templates/AI Use/AI Weekly Review Template.md` and `AI Monthly Review Template.md` in full — report their exact frontmatter and headings.\n- Read `30_Order/Workflows/Ingestion/Plan Review Cadence.md` in full.\n- Check the `weekly-review` skill (search `.claude/skills/` for it) and the `closing-day` / `starting-day` skills (`/closeday`, `/startday`) briefly — what do they already automate for review cadence? Just report the gist (don\u0027t need full file dumps for these two).\n- Report whether these fully cover \"how review works in this vault\" already, or if there\u0027s a real gap (e.g., nothing yet ties multiple review layers — daily/weekly/monthly/project — into one coherent system) that a \"Review System\" standard would uniquely fill.\n\n**2. Per Project Review** — reviewing a specific active project/internship/course/research thread.\n- Read `30_Order/Standards/Internship/Internship Loop Review Standard.md` in full.\n- Read `30_Order/Standards/Project Standard.md` in full.\n- Check `20_Progress/UROP/BOOM Board.md` and `20_Progress/Projects/Projects Board.md` briefly (just enough to see if they already encode a per-project review cadence, e.g. a status/health column or review date field) — report what you find in 2-3 sentences each.\n- Report whether \"per project review\" is already fully specified by Internship Loop Review Standard + Project Standard (meaning a new Standard would be scoped narrowly, e.g. generalizing the internship-specific pattern to ALL project types: UROP, coursework, trading, personal builds), or whether it\u0027s a genuine gap.\n\nEnd each theme with a one-paragraph verdict: **\"a dedicated Standard here would duplicate X (cite file) unless scoped as Y\"** or **\"no existing Standard covers this — here\u0027s the real material to ground a new one in.\"**\n\nKeep the full report under 700 words — cite exact file paths and quote short exact passages, not paraphrases."}`

## You

<task-notification>
<task-id>a7f9616767426108a</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\tasks\a7f9616767426108a.output</output-file>
<status>completed</status>
<summary>Agent "Map existing Orchestration/Tool Calls content" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result># Theme 1 — Tool Calls

`60_Claude/07_AI_Information/Vault Rules — Complete AI Ruleset.md` (now titled **"Vault Rules — Operational Reference"**) contains a `## Tool Selection` section with exactly four tables:

**Reading Files**
```
| Situation | Tool |
|---|---|
| Any text file or Markdown note | `Read` |
| PDF file | Python pypdf via `Bash` |
| Image file | `Read` (multimodal) |
| Live URL | `WebFetch` |
| Search file contents | `Grep` |
| Find files by pattern | `Glob` |
| Directory listing | `Bash` (ls) |
```

**Writing Files**
```
| Situation | Tool |
|---|---|
| Patching an existing file by heading | `Edit` (patch only — do not rewrite) |
| Creating a new file | `Write` |
| Full rewrite of an existing file | `Read` first, then `Write` |
```

**MCP Filesystem Tools** — prose, not a table: "Prefer `Read`, `Edit`, `Write`, `Grep`, `Glob` over `mcp__filesystem__*` equivalents. Use MCP filesystem tools only when the core tools cannot perform the operation. Never use MCP tools to read plugin `data.json` files unless explicitly asked."

**Subagents** — bullets, not a table:
- "Use subagents for broad exploration requiring 3+ queries"
- "`subagent_type: Explore` for finding files without a known path"
- "`subagent_type: research-distiller` for long technical PDFs requiring section-by-section extraction"
- "Do not spawn subagents for tasks completable inline with 1–2 tool calls"

This is the entire tool-selection content in the vault — nothing else in `07_AI_Information` duplicates it. It is a direct, near-complete match for what a "Tool Calls" Standard should contain: it already covers read/write/MCP/subagent choice end to end. The file's own header makes its scope explicit — it now "holds the tool-selection table and the session-end protocol," with everything else (formatting, placement, strategy) pointed elsewhere, per the North Star's convergence rule: "**one fact, one home**... if a sentence is true in both, one copy is wrong and gets deleted in favor of a pointer" (`Jarvis OS — North Star.md` Part 7.1 / Vault Rules header).

**Verdict:** A dedicated Tool Calls Standard would duplicate `Vault Rules — Complete AI Ruleset.md`'s `## Tool Selection` section verbatim unless scoped as *the promotion of that section* — move the four tables into `30_Order/Standards/AI Loop/Tool Calls.md` as the new home, delete them from Vault Rules, and leave a one-line pointer in Vault Rules per the vault's own "one fact, one home" rule. There is no separate body of practice to invent; the content already exists and only needs relocation.

# Theme 2 — Orchestration

`Jarvis OS — North Star.md` Part 5.2 ("The agent / subagent standard") states the file shape exactly: "`.claude/agents/&lt;name&gt;.md` with frontmatter `name`, `description` (third person, 'Use proactively for… MUST BE USED for…' like the existing `anti-slop-editor`), optional `tools` (restrict to what it needs), and `model`." It also states the use-threshold: "Use one when a side task would flood the main conversation with reading you will not reference again." Part 6 rule 5 reinforces this: "Push wide reading into sub-agents. A search that must read twenty notes to find three runs in a separate agent whose intermediate reading never enters the main window; it returns the conclusion, not the transcript."

The actual `.claude/agents/*.md` files (11, not the 5 listed in Claude OS) — `anti-slop-editor`, `career-operator`, `daily-operator`, `human-operator`, `ingestion`, `learning-agent`, `llm-council`, `note-to-actions`, `professor`, `research-distiller`, `vault-curator` — match that frontmatter pattern precisely, e.g. `anti-slop-editor.md`: `name:`, `description: &gt;` block ("Use proactively for... MUST BE USED for..."), `tools:` list, `model: claude-sonnet-4-6`.

`60_Claude/07_AI_Information/How to Use Claude/Claude OS.md` lists only 5 agents (research-distiller, anti-slop-editor, vault-curator, learning-agent, career-operator) dated 2026-07-03 — stale: the real folder has 11, including `llm-council`, `note-to-actions`, `professor`, `daily-operator`, `human-operator`, `ingestion` not mentioned there.

`Vault Map.md`'s Workflow Chooser gives the exact when-to-use lines for Dataview/Tasks/Kanban/Excalidraw/Spaced Repetition/Templater quoted above (section "## Workflow Chooser").

Vault Rules' own Subagents bullets (Theme 1) are the existing "when to spawn vs. inline" rule, duplicating North Star Part 6 rule 5 — both say the same thing in different words, a live case of the "one fact, one home" violation the North Star itself flags.

**Verdict:** No single file today covers multi-agent/skill *coordination* — North Star 5.2 covers agent file shape, Vault Rules covers spawn-threshold, Vault Map covers tool-chooser, Claude OS is a stale registry. A dedicated Orchestration Standard should consolidate: North Star 5.2's frontmatter spec, the spawn-threshold bullets (deleted from Vault Rules), the Workflow Chooser, and a corrected 11-agent roster — grounding it in real files rather than inventing new coordination rules, while fixing Claude OS's stale count as a side effect.</result>
<usage><subagent_tokens>60243</subagent_tokens><tool_uses>10</tool_uses><duration_ms>43798</duration_ms></usage>
</task-notification>

## Claude

Two more research agents still running (Conversations/Knowledge/Memory, and Review/Per-Project-Review). I'll wait for those to finish before finalizing the plan.

### Tool Calls

- `ListAgents` -- `{}`

## You

<task-notification>
<task-id>ac773d11d1b7a0b0d</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\tasks\ac773d11d1b7a0b0d.output</output-file>
<status>completed</status>
<summary>Agent "Map existing Review/Per-Project-Review content" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result># Theme 1: Review System

**`30_Order/Standards/Enrich/Review Standard.md`** — governs only `60_Claude/30_Reviews/AI/Scheduled/{Weekly,Monthly}/`: "This is the content standard for ... how Claude Code, Cowork, and the sync layer are actually being used." Cadence is "Manual, human-triggered — no cron job writes a review." Headings: Period Covered, Sources Reviewed, What Ran This Period, Sync &amp; Capture Health, Findings, Decided Fixes, Open Questions, Next Period's Watch List.

**`AI Weekly Review Template.md`** frontmatter: `type: evergreen`, `status: tree`, `created`/`updated` (templater), `tags: [evergreen, review, template, claude-kit]`. Headings: `Period Covered`, `Sources Reviewed` (checkboxes), `What Ran This Period` (table), `Sync &amp; Capture Health`, `Findings`, `Decided Fixes`, `Open Questions`, `Next Period's Watch List`.

**`AI Monthly Review Template.md`** — same frontmatter shape, adds `Tool Map Health Check` heading and "All four Weekly reviews from this month" as a source to check.

**`30_Order/Workflows/Ingestion/Plan Review Cadence.md`** — a distinct mechanism: keeps `type: plan` notes' `review_cadence` honored by wiring `/startday`, `/closeday`, `/weekly-review` to read/append a plan's Current Progress section, with a staleness rule ("two review cycles with no new entry" → flag). This is about *plan* notes specifically, not a general review system.

**`weekly-review` skill** (`.claude/skills/weekly-review/weekly-review.md`) is a large, concrete operational pipeline: pre-flight reads, Fall Execution Audit, Enrichment Queue Health, Structural Health Check, Promotion Scan, writes `Weekly Synthesis — YYYY-WXX.md`, updates the index, runs Log Maintenance and a very detailed Sync Health Check (Steps 7.5–7.6, 14 sub-checks). This is the vault's dominant real "weekly" layer but is scoped to overall vault/build health, not internship or AI-tool reviews specifically — it even says "If it's the last week of a month, also check whether a monthly review note belongs in `60_Claude/30_Reviews/Monthly/`."

**`closeday`/`startday`** automate daily cadence only: `/startday` fills the daily note from the Fall 2026 Plan/habits; `/closeday` verifies completion and writes a scorecard. Neither touches weekly/monthly/project review content.

**Verdict:** Each existing layer governs a *different, siloed* review subject — AI-tool usage (Review Standard), vault-wide build health (weekly-review skill), plan-note staleness (Plan Review Cadence), daily habits (startday/closeday), and (separately) the internship loop (below). Nothing currently states the general *shape* of a review across cadences, or how these layers nest/escalate into each other. A "Review System" standard would duplicate `30_Order/Standards/Enrich/Review Standard.md` if it just restates its headings — instead it should be scoped as the cross-cutting meta-standard: defining what "daily/weekly/monthly/quarterly" mean vault-wide, how findings escalate between layers (the Carryover Escalation pattern already proven in Internship Loop Review Standard but not generalized), and where each existing review type plugs in. That is a real gap: no file ties daily → weekly → monthly → project-specific review into one coherent system today.

# Theme 2: Per Project Review

**`Internship Loop Review Standard.md`** is deep and internship-specific: two review types (Weekly Discovery, Monthly Promotion) plus a standalone 3-day Deadline Sweep, each with Sources Reviewed, Gate/Standard Conformance, Application Census, Health Check (cites a hard numeric target: "500 applications by 2026-12-31"), Immediate Actions, Carryover Escalation (two consecutive sightings auto-promotes to Immediate Actions), Decided Fixes/Open Questions. Explicitly declares itself "a sibling of Review Standard... not a replacement."

**`Project Standard.md`** governs single project notes in `20_Progress/` (`type: project`), not reviews — it's about Current State/Next Action/Log shape, continuity via append-only log, with `next:` as the dashboard hook. No periodic-review heading exists here at all.

**`20_Progress/UROP/BOOM Board.md`** is a pure navigation MOC with "Suggested Revisit Loops" (30-min / 2-hour / deep relearning passes) and dataview tables by status/deadline — a learning-refresh cadence, not a project-health review cadence; no review-date or health field.

**`20_Progress/Projects/Projects Board.md`** is a one-screen dataview index (`status, deadline, related_progress, next`) with zero review cadence or health column.

**Verdict:** per-project review is NOT already fully specified beyond the internship domain — "no existing Standard covers this generally; the Internship Loop Review Standard is the only real material to ground a new one in." It supplies a proven, transferable pattern (Weekly/Monthly split by stall-mode, Immediate Actions vs. Decided Fixes vs. Open Questions, Carryover Escalation, Sources Reviewed with per-source citation discipline) but is written entirely in internship vocabulary (dossiers, Programs, Application Census). A new "Per Project Review" Standard would duplicate `Internship Loop Review Standard.md` unless scoped as its generalization — applying the same review skeleton to `Project Standard.md`'s project notes (UROP, coursework, trading, personal builds) via their `next:`/Current State/Log fields, since neither BOOM Board nor Projects Board currently encodes any review cadence to lean on instead.</result>
<usage><subagent_tokens>65863</subagent_tokens><tool_uses>21</tool_uses><duration_ms>60144</duration_ms></usage>
</task-notification>

## Claude

Still waiting on the last one (Conversations/Knowledge Noting/Memory Management mapping). I'll hold here.

### Tool Calls

- `ListAgents` -- `{}`

## You

<task-notification>
<task-id>a249357aa64add3f6</task-id>
<tool-use-id>[REDACTED]</tool-use-id>
<output-file>C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\tasks\a249357aa64add3f6.output</output-file>
<status>completed</status>
<summary>Agent "Map existing Conversations/Knowledge/Memory content" finished</summary>
<note>A task-notification fires each time this agent stops with no live background children of its own. The user can send it another message and resume it, so the same task-id may notify more than once.</note>
<result>Confirmed empty. Here is the grounding report.

## 1. Conversations

**`Conversation Capture.md`** (workflow, `type: evergreen`, `status: tree`) defines three layers: raw transcript → `60_Claude/05_Clippings/AI Conversations/` (untouched) → summary in `60_Claude/10_Source_Summaries/` → selective promotion (never the whole transcript). Summary structure (exact headings): `What Was Decided / What Changed / Important Context / Source Claims / Inferred Claims / Open Questions / Follow-Up Actions / Related Notes / Should Be Promoted?`. Frontmatter: `type: input, status: sprout, source_app: &lt;claude-code|codex|cursor|kiro|chatgpt|claude-web|ollama|other&gt;, source_status: mixed`. Note: workflow text says session-log path is `60_Claude/07_AI_Information/Session Logs/log.md` in one place but says `10_Session_Logs` in the README below — a real inconsistency already in the vault, worth flagging rather than inheriting.

**`AI Conversation - Summaries/README.md`** is a *second*, more fleshed-out spec for the same pipeline, actually in use: required frontmatter adds `input_kind: ai-conversation-summary`, `source_note:` (wikilink to raw), `project:`, `decision_count: N`, `action_count: N`. File naming: `YYYY-MM-DD-{source-app}-{slugified-title} — Summary.md`. Two real examples confirm this is what's actually practiced — `[REDACTED] — Summary.md` and `Claude Code/2026-08-19-...— Summary.md` — both follow the README's frontmatter exactly, and the Claude Code one additionally adds ad hoc fields (`source_os`, `tools_used`, `tokens_total`, `cost_usd`) and a `## Tool Use Detail` section not in the official template — i.e., real practice has already extended the spec informally.

**`Brief Standard.md` + `Transcript to Brief.md`** are a *different, adjacent* pipeline: general transcripts (meetings/calls/video), not AI-tool conversations specifically. Frontmatter: `type: input, status: sprout, input_kind: transcript, source_note:, related_progress:, next:`. Structure: Source lines → What This Was → What Was Decided → Key Threads → Open Questions → Follow-Up Actions → Related Notes. This is brief-for-humans-talking, not AI-conversation capture — don't conflate it, though its per-heading density/warning-callout format is the right template to imitate.

**Verdict:** A dedicated Standard would significantly overlap `Conversation Capture.md` (workflow) and the `AI Conversation - Summaries/README.md` (the de facto content standard, already battle-tested against 4+ real summaries). It should be scoped narrowly to reconciling the two existing specs (fix the Session Logs path inconsistency, decide whether `tools_used`/`tokens_total`/`cost_usd` become official fields) and formalizing per-heading density rules (à la `Brief Standard.md`'s callout style), which neither existing doc currently has.

## 2. Knowledge Noting

Two parallel, fully fleshed-out pipelines already exist, each with workflow + Standard:
- **Capture → Summary**: `Capture to Summary.md` (workflow) + `Source Summary Standard.md`. Frontmatter: `type: input, status: sprout, source_url, source_status, track`. Full per-heading standard: Frontmatter → Title/Source lines → Source → Key Claims → Full Content (verbatim source order, one `==highlight==` per `###`) → Why It Matters → Links Into The Vault → Open Questions → Flashcards (`#cards/[track]`, 3–5 min). Gold example cited: `Quant Foundations (PDF)`.
- **Summary → Distilled**: `Summary to Distilled.md` (workflow) + `Evergreen Standard.md`. Frontmatter: `type: evergreen, status: sprout→tree, track, source_status, enrichment_status`. Per-heading: Core Claim → Mechanism → Why This Matters Here → Failure Modes → Evidence → Related. Gold examples: `BOOM`, `Observability in Backend vs Evaluation in AI`.

Both Standards are extremely detailed (warning callouts, density guidance, gold examples) — this is the most mature pair of the three themes.

**Verdict:** A dedicated "Knowledge Noting" Standard would heavily duplicate `Source Summary Standard.md` and `Evergreen Standard.md` unless scoped narrowly to something neither covers: the *decision layer* between them — when raw knowledge warrants a summary at all vs. skip-to-distilled, and the AI-agent behavior/cadence for noting as it reads (not the note's final shape, which is already fully specified).

## 3. Memory Management

**`AI_CONTEXT.md` § Continuity Protocol** (verified current, lines 70-75): 4 bullets — (1) after meaningful work append to `60_Claude/07_AI_Information/Session Logs/log.md`; (2) if focus/structure/priorities change, update the relevant dashboard/board; (3) don't store transient status in this file; (4) treat `00_Dashboard.md` + session log as the live continuity layer. Thin — four bullets, no mechanism detail.

**`Session Logs/log.md`** tail (1780 lines) shows real practice: dated entries `YYYY-MM-DD - &lt;dense paragraph&gt;` or `## [YYYY-MM-DD] title`, mixing both conventions; entries are long narrative paragraphs citing wikilinks to evidence notes, not short status lines.

**`Log Standard.md`** (full) already covers session-log format in depth: heading format `## [YYYY-MM-DD] tag | title`, append-only/never-edit rule, "verify before write," the core lesson of naming a trigger mechanism or responsible human for every log (citing the `Write Log.md` failure and `Claude Kit/Log.md` success as gold/negative examples), and a decision rule for when a new log earns its own file vs. extending an existing one.

**`CPR — Compress, Preserve, Resume.md`**: NOT a general Jarvis memory pattern — it's an evaluation note about an external repo (`second-brain-claudekit`)'s `/compress /preserve /resume` slash-command trio (status: "blend," currently unpromoted/not live). Core mechanism in practice: compress long sessions into structured summaries, preserve them to archive files under a topic-named filename scheme, and resume by grep-searching archived session logs by topic keyword — deliberately NOT full raw-conversation logging (conflicts with this vault's "progressive summarisation" principle). This is WSL-tool-scoped, not a Jarvis vault-memory contract.

**`jarvis-memory/README.md`**: documents a SQLite registry + MCP server (`jarvis_status`, `jarvis_search`, `jarvis_reindex` tools) that indexes notes/headings/links/chunks/conversations as a read-heavy derived-state layer ("registry never edits notes... delete `registry.sqlite` any time, nothing is lost"). It's infrastructure for future retrieval/answering, not a memory-management *practice* contract — closest it comes is "conversation raw text stays in `05_Clippings/`, registry only stores pointers."

**Verdict:** No existing Standard fully covers "memory management" — `Log Standard.md` covers *log mechanics* (format, ownership, when to split files) but not session-to-session continuity practice (what must survive a context reset, how/when to compress vs. archive, what `AI_CONTEXT.md`'s 4-bullet Continuity Protocol leaves unsaid). A new Standard is genuinely needed, grounded in: `AI_CONTEXT.md` §70-75 as the starting contract, `Log Standard.md`'s ownership/mechanism-naming discipline as the model to extend, real session-log entries (`Session Logs/log.md` lines 1740-1780) as the practiced format, and the CPR note's compress/archive/resume mechanism as a candidate pattern to adopt or explicitly reject — scoped to Jarvis's own vault rather than treated as settled (CPR is currently unpromoted even in its source repo).</result>
<usage><subagent_tokens>71164</subagent_tokens><tool_uses>19</tool_uses><duration_ms>75782</duration_ms></usage>
</task-notification>

## Claude

Now executing. Starting with Batch 1 — the cold-start merge.

I used em dashes in prose in that file, which your global rules prohibit. Let me find and fix them before moving on.

Python isn't available, so I'll rewrite the file cleanly without em dashes (keeping the one in the North Star filename, which is unavoidable).

Now the Vault Map stub, MCP-Hub-Index stub, and the Vault Operating System leftover line.

`.claude/rules/` has several rule files that auto-load for Claude Code and weren't in the audit. Let me read them since they may contradict the new single read order.

Now AGENTS.md: single read order via AI_CONTEXT, the strict 30_Order rule stated prominently, dead routing rows fixed, and the stale absolute path removed.

Now CLAUDE.md: fix the duplicate rule number, replace the invented frontmatter block with a pointer to the actual templates, correct dead paths, and add a compact task-to-tool map.

All inbound links use the bare name `[[Claude OS]]`, so moving it won't break any of them. Moving it and fixing the roster now.

While that runs, writing `Tool Calls.md` (a relocation of the existing Tool Selection section, in the Log Standard shape).

Everything left in Vault Rules now has a new home (Tool Calls, Orchestration, Memory Management), so it becomes a redirect stub like Agent Operating Guide.

Three notes share the name "Review System" and two share "Project Standard", which would make bare wikilinks resolve unpredictably. Switching those links to path-qualified form.

Now the Toolkit group. Let me verify the key sources directly (Tool log, Claude Kit Log, Tool Map, Graphify) before writing Logs, Tool Logs, Graphify, and the workflows.

Writing the Logs standard, Tool Logs template, and the Maintaining Logs and Tools Tracking workflows (the working directory shifted, so I'll use absolute paths).

Now registering the new workflows in the Workflows Index and the AI Loop in the 30_Order map.

Verifying that every wikilink in the files I wrote or edited resolves to exactly one note.

I finished the top-tier cleanup and wrote the AI Loop and Toolkit set. 14 empty files remain in `30_Order`, and a few things need your decision. Nothing is committed. I didn't append a session-log entry, because your global rule says not to write session logs unless asked.

**Top-tier files**
- **One read order.** `AI_CONTEXT.md` is now the single orientation and live-state file, with the one cold-start read order. `Vault Map.md` and `MCP-Hub-Index.md` are thin redirect stubs. The old MCP-Hub-Index read order used folder names that no longer exist.
- **Strict 30_Order rule.** `AGENTS.md` and `CLAUDE.md` now say every note starts from a `30_Order` template, and a missing template means stop and design one first. `AGENTS.md` also has a "which owner answers which question" table. `CLAUDE.md` has a task-to-tool table.
- **Architecture trimmed.** `Jarvis Vault Architecture.md` dropped its May-dated open questions and now has a short "Status as of 2026-10-15" section.
- **Dead folders removed from the routing tables.** `35_Outputs/` and `50_Reviews/` don't exist, and `AGENTS.md` and the Architecture note still pointed at them.
- **Other moves and fixes.**
  - `Claude OS.md` moved to `20_Progress/AI/`, with its agent roster corrected from 5 to 11.
  - `Vault Rules` is now a redirect stub.
  - `AI Workflow.md` and `Claude Optimization Master Setup.md` have "superseded / dated snapshot" banners.

**AI Loop standards (all written from content that already existed in the vault)**
- **Standards:** Tool Calls, Orchestration, Memory Management, Conversations, Knowledge Noting, Per Project Review, Review System, Logs, Graphify Notes.
- **Templates:** AI Conversation, Tool Logs, Graphify Notes.
- **Workflows:** Maintaining Logs, Tools Tracking, Graphify Folders.
- **Registered:** the new workflows are listed in the Workflows Index and `00_How This Folder Works.md`.
- **Unverified claim:** the Graphify rule that lint tools skip graphify folders is a prescription, not something I checked.

**Decisions for you**
1. **Four empty rule files.** `.claude/rules/what-to-read.md`, `how-to-write.md`, `claude-directions.md` and `interlinking.md` are 0 bytes. They auto-load every session, so I'd fill them with 5-10 line pointers to `AI_CONTEXT`. Say if you want that.
2. **Empty files I left alone because they need your call.**
   - `Write Logs` template: `Write Log.md` was retired in August, so I didn't know what this one is for.
   - `Files Tracking` workflow: no matching Standard or Template exists.
   - `Conversations Loop` workflow: it has no inbound links and duplicates `Conversation Capture`. I'd delete it.
3. **Other empty files, not touched.** Decoration, Editing, Human Writing and Plugins Usage Standards, `Resources`, the Tracking and For Dashboards templates, and the Enrichment workflows are still empty. Say if you want that set next.
4. **Flashcard conflict.** `Source Summary Standard` ends each summary with flashcards, but the rule elsewhere is "cards after distillation". I flagged it in `Knowledge Noting.md` without choosing.
5. **Outputs have no home.** `Output with Provenance.md` still writes to `35_Outputs/`, and `Plugins.md` has stale folder settings. I can't check those against the Obsidian plugin settings without reading plugin data files.
6. **Moving files into `50_Archive/`.** The two banners above are yours to action, since AI writes there are off limits.

### Tool Calls

- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Log Standard.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Enrich\Review Standard.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls "60_Claude"`
```
00_Inbox
05_Clippings
07_AI_Information
10_Source_Summaries
20_Distilled_Notes
30_Reviews
40_Project_Briefs
44_Indexes
Claude Board.md
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find "60_Claude" -maxdepth 2 -type d && echo "--- search for Outputs anywhere ---" && find . -maxdepth 4 -iname "*outputs*" -not -path "./.git/*" -not -path "./50_Archive/*" 2>/dev/null`
```
60_Claude
60_Claude/00_Inbox
60_Claude/00_Inbox/copilot
60_Claude/05_Clippings
60_Claude/05_Clippings/AI Conversations
60_Claude/05_Clippings/PDFs
60_Claude/05_Clippings/Videos
60_Claude/05_Clippings/Web
60_Claude/07_AI_Information
60_Claude/07_AI_Information/AI Conversation - Summaries
60_Claude/07_AI_Information/How to Use Claude
60_Claude/07_AI_Information/Session Logs
60_Claude/10_Source_Summaries
60_Claude/10_Source_Summaries/Github Ingestion
60_Claude/10_Source_Summaries/PDF Ingestion
60_Claude/10_Source_Summaries/Video Ingestion
60_Claude/10_Source_Summaries/Web Ingestion
60_Claude/20_Distilled_Notes
60_Claude/20_Distilled_Notes/Sources - Plan
60_Claude/20_Distilled_Notes/Synthesis
60_Claude/20_Distilled_Notes/The Plan
60_Claude/30_Reviews
60_Claude/30_Reviews/AI
60_Claude/30_Reviews/Internship Loop
60_Claude/30_Reviews/Monthly
60_Claude/30_Reviews/Ops Reports
60_Claude/30_Reviews/Weekly Synthesis
60_Claude/40_Project_Briefs
60_Claude/40_Project_Briefs/CausalOps
60_Claude/40_Project_Briefs/Internship
60_Claude/40_Project_Briefs/Portfolio
60_Claude/40_Project_Briefs/TradingView
60_Claude/44_Indexes
60_Claude/44_Indexes/Bases
60_Claude/44_Indexes/Field OS
--- search for Outputs anywhere ---
```
- `Write` -- `C:\Users\anant\.claude\plans\graceful-wishing-gadget.md`
```
# Jarvis top-tier AI-instruction layer — convergence pass

## Context

`Jarvis OS — North Star.md` already diagnosed this vault's instruction layer in June 2026 (four files claiming authority, four contradictory cold-start read orders, duplicated rules) and prescribed fixes. Checking against that diagnosis now (Oct 2026) shows **partial convergence**: `Vault Operating System.md` and `Agent Operating Guide.md` were correctly demoted to thin pointers. But the contradiction problem North Star called the core disease is still live: `Vault Map.md`, `AI_CONTEXT.md`, and `MCP-Hub-Index.md` each still prescribe a *different* cold-start read order, and `MCP-Hub-Index.md`'s is built on folder paths that no longer exist (`60_Claude/7_AI_Information`, `10_Session_Logs`, `30_Source_Summaries`, `45_Outputs`, `60_Indexes`, `10_UMN`). `Jarvis Vault Architecture.md` (the placement authority) is accurate in its live sections but still carries ~80 lines of May-2026-dated "open questions"/"build order" narrative, some now resolved, some not — presented as if still current. Several files elsewhere reference a `60_Claude/35_Outputs/` folder that was verified (via `find`) not to exist anywhere in the vault.

Separately, `30_Order/Standards/AI Loop/` holds 7 named-but-empty Standards files (`Orchestration`, `Conversations`, `Knowledge Noting`, `Memory Management`, `Per Project Review`, `Review System`, `Tool Calls`) — a live violation of `30_Order/00_How This Folder Works.md`'s own rule against empty-but-named files. You confirmed these were deliberately reserved for exactly the AI-orchestration/knowledge-loop system this task is about, and that they must be grounded in **what the vault already practices**, not invented — three research passes (below) mapped each of the 7 against real existing content, confirming several would duplicate existing Standards unless narrowly scoped, and identifying the exact material to build each from.

Net effect of this plan: one coherent, non-contradictory cold-start sequence; a placement authority that states only what's currently true; dead paths fixed everywhere they were found; and all 7 AI Loop standards filled with real, grounded content instead of being empty or invented.

## Batch 1 — Collapse the cold-start contradiction

- **`AI_CONTEXT.md`** becomes the one merged orientation + live-state file (this is what North Star Part 4 already specified — AI_CONTEXT as the merge target). Fold in from `Vault Map.md`: the six-layer table, "How to write a note" steps, "Conventions in one place," "Never do this" list, and the Workflow Chooser *minus* the AI-orchestration parts that move to `Orchestration.md` (Batch 5) — keep only the plugin-choice guidance (Dataview/Tasks/Kanban/Excalidraw/Spaced Repetition/Templater). Keep AI_CONTEXT's existing Live State Sources / Domain Entry Points / Continuity Protocol sections, trimming the Continuity Protocol's substance into `Memory Management.md` (Batch 5) and leaving one pointer line here.
- **`Vault Map.md`** becomes a thin redirect stub (same shape as `Agent Operating Guide.md`) so inbound links (`AGENTS.md`, North Star) keep resolving.
- **`MCP-Hub-Index.md`** gets gutted to a short stub for MCP-only/external agents: point at `AI_CONTEXT.md` (orientation+live-state) and `Jarvis Vault Architecture.md` (placement), state plainly that no separate read order exists for MCP-only agents, and keep the one genuinely unique line — the pointer to the `/mcp-hub` companion skill (`.claude/skills/mcp-hub/mcp-hub.md`, confirmed to exist). This removes the fourth contradictory read-order and every stale path in one move.
- **`Vault Operating System.md`** line 16 still says "This note is the canonical operating contract for Jarvis" directly above line 18's already-correct narrowed claim ("the canonical property/field schema"). Delete line 16 — a leftover authority claim from before this file was demoted.

## Batch 2 — Trim `Jarvis Vault Architecture.md`

Keep: the six-layer table, the Write Contract, the routing table, and the per-folder job/belongs/doesn't-belong/who-writes/workflow contracts — all current and load-bearing.

Replace the dated material with one short, honestly-labeled status note (verified today, not asserted):
- The "two possible homes for coursework" open question is resolved — `10_Areas/UMN/` no longer exists; coursework lives under `10_Areas/Notes/`.
- `30_Order/Workflows/` now exists (Build order Step 2, done) and `Vault Map`/`AI_CONTEXT` orientation exists (Step 3, done, see Batch 1).
- `10_Areas` identity-hub gap is **still partly open**: `Trading/` has a hub-shaped note (`Stocks Trading AI Hub.md`); `Career/`, `Life/`, `UMN`-successor `Notes/` do not have a single canonical hub note yet. State this as still-open, not resolved — do not fabricate hub notes as part of this pass.
- Fix the `60_Claude` subfolder contracts table: remove the `35_Outputs/` row (confirmed via `find` not to exist anywhere in the vault) and confirm the `30_Reviews/` row matches its real subfolders (`AI/`, `Internship Loop/`, `Monthly/`, `Ops Reports/`, `Weekly Synthesis/`).
- Cut the "Build order" and "What is still messy" sections down to this single status paragraph; drop the rest as noise per North Star's "deletion is part of writing" rule.

## Batch 3 — Fix confirmed dead/stale references

- **`AGENTS.md`** routing table: the "reusable output artifact" row points at `60_Claude/35_Outputs/`, a folder that does not exist. Replace with `60_Claude/40_Project_Briefs/` and an honest one-clause note that no dedicated Outputs folder currently exists.
- **`40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md`**: fix `60_Claude/7_AI_Information` → `60_Claude/07_AI_Information` (the one stale path in an otherwise-current file).
- **`30_Order/Workflows/Ingestion/Conversation Capture.md`**: fix the internal inconsistency where session-log path is given once correctly (`07_AI_Information/Session Logs/log.md`) and once as the stale `10_Session_Logs` — make both say the correct path.

## Batch 4 — Move and banner stale/misplaced notes

- **Move** `60_Claude/07_AI_Information/How to Use Claude/Claude OS.md` → `20_Progress/AI/Claude OS.md` (next to its existing companions `Claude OS Dashboard.md`/`.canvas`), per your answer. While moving: fix its agent roster table from the stale 5-agent list to the real 11 agents in `.claude/agents/` (`anti-slop-editor`, `career-operator`, `daily-operator`, `human-operator`, `ingestion`, `learning-agent`, `llm-council`, `note-to-actions`, `professor`, `research-distiller`, `vault-curator`), and add a one-line "last verified 2026-07-03 — counts above re-verified 2026-10-15, re-check skill/hook rows before trusting" banner.
- **Banner, don't move** (writing to `50_Archive/` is off-limits to AI per `AGENTS.md`'s hard rule — archiving is your call to make later): add a one-line "Superseded — see [[Claude Pro Workflow]] and [[Jarvis OS — North Star]] for current guidance" note atop `40_Resources/CS/AI/Workflows/AI Workflow.md` (2026-03, GPT-tool-era plan) and atop `40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md` (2026-05-28 point-in-time action list) — including fixing their own stale-path mentions while touching them.

## Batch 5 — Fill the 7 AI Loop Standards

All seven follow the existing `Log Standard.md` / `Review Standard.md` shape exactly (the two best current examples of this kind of cross-cutting Standard): frontmatter (`type: evergreen, status: sprout, tags: [system, standards]`), an opening `==one-line core discipline==`, a paragraph naming what neighboring Standard it must not be confused with, `## Maps To` / `## Used By Workflow` only where a real Template/Workflow exists or is being created, the per-rule body, `> [!WARNING]` callouts for the specific failure modes found, `## Done Conditions`, and `## Gold Standard Example` (stated honestly as "none yet" where nothing qualifies). Scopes below are narrowed specifically to avoid duplicating what the three research passes found already exists:

1. **`Tool Calls.md`** — relocate the four Tool Selection tables (Reading Files / Writing Files / MCP Filesystem Tools / Subagents) verbatim from `Vault Rules — Operational Reference.md`; delete them there, leave a one-line pointer. No Maps To/Workflow — a pure reference standard, same shape as `Log Standard.md`.
2. **`Orchestration.md`** — consolidate: North Star Part 5.2's subagent file-shape rule (frontmatter `name`/`description`/`tools`/`model`), the spawn-vs-inline threshold bullets (moved out of Vault Rules, pointer left behind), and the real 11-agent roster with trigger/tools pattern. Gold Standard Example: `.claude/agents/anti-slop-editor.md` (North Star's own citation). Explicitly out of scope: plugin/tool-type choice (Dataview vs. Tasks vs. Kanban) — that stays in `AI_CONTEXT.md`'s Workflow Chooser (Batch 1); this file is agent/skill coordination only.
3. **`Memory Management.md`** — absorb `AI_CONTEXT.md`'s 4-bullet Continuity Protocol as the base contract; extend with `Log Standard.md`'s mechanism-naming discipline (cited, not duplicated) and a real citation of current `Session Logs/log.md` entry format; state an explicit, honest verdict on the CPR compress/preserve/resume pattern (`40_Resources/CS/AI/CPR - Compress Preserve Resume.md`) — adopt the compress-long-sessions idea narrowly, note it is not fully promoted even in its source repo, don't claim it as settled practice.
4. **`Conversations.md`** — merge `60_Claude/07_AI_Information/AI Conversation - Summaries/README.md`'s de facto spec (the one actually followed by real summary notes, including its informally-added `tools_used`/`tokens_total`/`cost_usd`/`source_os` fields — promote these to official) with `Conversation Capture.md`'s three-layer pipeline. **New Template**: `30_Order/Templates/AI Use/AI Conversation Summary Template.md` (promoting the README's implicit shape into a real template — none exists today). Used By Workflow: `[[Conversation Capture]]`. Retire the README to a pointer at the new Standard, same demotion pattern used elsewhere.
5. **`Knowledge Noting.md`** — scoped deliberately narrow: only the *decision layer* between `Source Summary Standard.md` and `Evergreen Standard.md` (when raw material warrants a summary at all vs. skipping straight to a distilled note; agent note-taking cadence while reading a source) — both existing Standards already fully specify final note shape, so this file must not restate their per-heading content. No new Template.
6. **`Per Project Review.md`** — generalizes `Internship Loop Review Standard.md`'s proven pattern (Weekly/Monthly split, Sources Reviewed, Immediate Actions / Decided Fixes / Open Questions, Carryover Escalation) to any `type: project` note from `Project Standard.md`, since neither `BOOM Board.md` nor `Projects Board.md` currently encodes a review cadence. **New Template**: `30_Order/Templates/Capability/Per Project Review Template.md`. **New Workflow**: a short `30_Order/Workflows/Enrichment/Per Project Review.md`, since a real repeated process is evident but not yet written down.
7. **`Review System.md`** — the meta-layer tying the others together: a `## Review Layers Map` table showing how daily (`/startday`/`/closeday`), weekly/monthly (`weekly-review` skill + `Review Standard.md`), plan-specific (`Plan Review Cadence.md`), and now project-specific (`Per Project Review.md`, above) cadences nest and escalate — generalizing the Carryover Escalation idea already proven in `Internship Loop Review Standard.md`. No Maps To of its own; it is the index/contract above the concrete review Standards, the same relationship North Star has to Architecture.

## Verification

- After Batch 1–4: grep the vault for the dead strings `35_Outputs`, `7_AI_Information` (missing leading zero), `10_Session_Logs`, `30_Source_Summaries`, `10_UMN`, `60_Indexes`, `45_Outputs`, `50_Reviews` outside of `50_Archive/` and quoted-history contexts — zero hits expected once Batches 1–4 land.
- After Batch 5: open `30_Order/00_How This Folder Works.md`'s own checklist against each new Standard — every one either names its Template/Workflow under `## Maps To`/`## Used By Workflow` or explicitly has neither (matching `Log Standard.md`'s precedent); none left empty.
- Spot-check that no sentence is now true in two files at once (North Star's own test from Part 4): specifically confirm the Tool Selection tables, the subagent spawn-threshold bullets, and the Continuity Protocol bullets each exist in exactly one place after the moves.
- Confirm `AGENTS.md`, `CLAUDE.md`, and North Star's own inbound links to `Vault Map`/`AI_CONTEXT`/`MCP-Hub-Index` still resolve (they will, since Batch 1 keeps both filenames alive as either the merged file or a stub).

```
- `ExitPlanMode` -- `{"plan":"# Jarvis top-tier AI-instruction layer — convergence pass\n\n## Context\n\n`Jarvis OS — North Star.md` already diagnosed this vault\u0027s instruction layer in June 2026 (four files claiming authority, four contradictory cold-start read orders, duplicated rules) and prescribed fixes. Checking against that diagnosis now (Oct 2026) shows **partial convergence**: `Vault Operating System.md` and `Agent Operating Guide.md` were correctly demoted to thin pointers. But the contradiction problem North Star called the core disease is still live: `Vault Map.md`, `AI_CONTEXT.md`, and `MCP-Hub-Index.md` each still prescribe a *different* cold-start read order, and `MCP-Hub-Index.md`\u0027s is built on folder paths that no longer exist (`60_Claude/7_AI_Information`, `10_Session_Logs`, `30_Source_Summaries`, `45_Outputs`, `60_Indexes`, `10_UMN`). `Jarvis Vault Architecture.md` (the placement authority) is accurate in its live sections but still carries ~80 lines of May-2026-dated \"open questions\"/\"build order\" narrative, some now resolved, some not — presented as if still current. Several files elsewhere reference a `60_Claude/35_Outputs/` folder that was verified (via `find`) not to exist anywhere in the vault.\n\nSeparately, `30_Order/Standards/AI Loop/` holds 7 named-but-empty Standards files (`Orchestration`, `Conversations`, `Knowledge Noting`, `Memory Management`, `Per Project Review`, `Review System`, `Tool Calls`) — a live violation of `30_Order/00_How This Folder Works.md`\u0027s own rule against empty-but-named files. You confirmed these were deliberately reserved for exactly the AI-orchestration/knowledge-loop system this task is about, and that they must be grounded in **what the vault already practices**, not invented — three research passes (below) mapped each of the 7 against real existing content, confirming several would duplicate existing Standards unless narrowly scoped, and identifying the exact material to build each from.\n\nNet effect of this plan: one coherent, non-contradictory cold-start sequence; a placement authority that states only what\u0027s currently true; dead paths fixed everywhere they were found; and all 7 AI Loop standards filled with real, grounded content instead of being empty or invented.\n\n## Batch 1 — Collapse the cold-start contradiction\n\n- **`AI_CONTEXT.md`** becomes the one merged orientation + live-state file (this is what North Star Part 4 already specified — AI_CONTEXT as the merge target). Fold in from `Vault Map.md`: the six-layer table, \"How to write a note\" steps, \"Conventions in one place,\" \"Never do this\" list, and the Workflow Chooser *minus* the AI-orchestration parts that move to `Orchestration.md` (Batch 5) — keep only the plugin-choice guidance (Dataview/Tasks/Kanban/Excalidraw/Spaced Repetition/Templater). Keep AI_CONTEXT\u0027s existing Live State Sources / Domain Entry Points / Continuity Protocol sections, trimming the Continuity Protocol\u0027s substance into `Memory Management.md` (Batch 5) and leaving one pointer line here.\n- **`Vault Map.md`** becomes a thin redirect stub (same shape as `Agent Operating Guide.md`) so inbound links (`AGENTS.md`, North Star) keep resolving.\n- **`MCP-Hub-Index.md`** gets gutted to a short stub for MCP-only/external agents: point at `AI_CONTEXT.md` (orientation+live-state) and `Jarvis Vault Architecture.md` (placement), state plainly that no separate read order exists for MCP-only agents, and keep the one genuinely unique line — the pointer to the `/mcp-hub` companion skill (`.claude/skills/mcp-hub/mcp-hub.md`, confirmed to exist). This removes the fourth contradictory read-order and every stale path in one move.\n- **`Vault Operating System.md`** line 16 still says \"This note is the canonical operating contract for Jarvis\" directly above line 18\u0027s already-correct narrowed claim (\"the canonical property/field schema\"). Delete line 16 — a leftover authority claim from before this file was demoted.\n\n## Batch 2 — Trim `Jarvis Vault Architecture.md`\n\nKeep: the six-layer table, the Write Contract, the routing table, and the per-folder job/belongs/doesn\u0027t-belong/who-writes/workflow contracts — all current and load-bearing.\n\nReplace the dated material with one short, honestly-labeled status note (verified today, not asserted):\n- The \"two possible homes for coursework\" open question is resolved — `10_Areas/UMN/` no longer exists; coursework lives under `10_Areas/Notes/`.\n- `30_Order/Workflows/` now exists (Build order Step 2, done) and `Vault Map`/`AI_CONTEXT` orientation exists (Step 3, done, see Batch 1).\n- `10_Areas` identity-hub gap is **still partly open**: `Trading/` has a hub-shaped note (`Stocks Trading AI Hub.md`); `Career/`, `Life/`, `UMN`-successor `Notes/` do not have a single canonical hub note yet. State this as still-open, not resolved — do not fabricate hub notes as part of this pass.\n- Fix the `60_Claude` subfolder contracts table: remove the `35_Outputs/` row (confirmed via `find` not to exist anywhere in the vault) and confirm the `30_Reviews/` row matches its real subfolders (`AI/`, `Internship Loop/`, `Monthly/`, `Ops Reports/`, `Weekly Synthesis/`).\n- Cut the \"Build order\" and \"What is still messy\" sections down to this single status paragraph; drop the rest as noise per North Star\u0027s \"deletion is part of writing\" rule.\n\n## Batch 3 — Fix confirmed dead/stale references\n\n- **`AGENTS.md`** routing table: the \"reusable output artifact\" row points at `60_Claude/35_Outputs/`, a folder that does not exist. Replace with `60_Claude/40_Project_Briefs/` and an honest one-clause note that no dedicated Outputs folder currently exists.\n- **`40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md`**: fix `60_Claude/7_AI_Information` → `60_Claude/07_AI_Information` (the one stale path in an otherwise-current file).\n- **`30_Order/Workflows/Ingestion/Conversation Capture.md`**: fix the internal inconsistency where session-log path is given once correctly (`07_AI_Information/Session Logs/log.md`) and once as the stale `10_Session_Logs` — make both say the correct path.\n\n## Batch 4 — Move and banner stale/misplaced notes\n\n- **Move** `60_Claude/07_AI_Information/How to Use Claude/Claude OS.md` → `20_Progress/AI/Claude OS.md` (next to its existing companions `Claude OS Dashboard.md`/`.canvas`), per your answer. While moving: fix its agent roster table from the stale 5-agent list to the real 11 agents in `.claude/agents/` (`anti-slop-editor`, `career-operator`, `daily-operator`, `human-operator`, `ingestion`, `learning-agent`, `llm-council`, `note-to-actions`, `professor`, `research-distiller`, `vault-curator`), and add a one-line \"last verified 2026-07-03 — counts above re-verified 2026-10-15, re-check skill/hook rows before trusting\" banner.\n- **Banner, don\u0027t move** (writing to `50_Archive/` is off-limits to AI per `AGENTS.md`\u0027s hard rule — archiving is your call to make later): add a one-line \"Superseded — see [[Claude Pro Workflow]] and [[Jarvis OS — North Star]] for current guidance\" note atop `40_Resources/CS/AI/Workflows/AI Workflow.md` (2026-03, GPT-tool-era plan) and atop `40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md` (2026-05-28 point-in-time action list) — including fixing their own stale-path mentions while touching them.\n\n## Batch 5 — Fill the 7 AI Loop Standards\n\nAll seven follow the existing `Log Standard.md` / `Review Standard.md` shape exactly (the two best current examples of this kind of cross-cutting Standard): frontmatter (`type: evergreen, status: sprout, tags: [system, standards]`), an opening `==one-line core discipline==`, a paragraph naming what neighboring Standard it must not be confused with, `## Maps To` / `## Used By Workflow` only where a real Template/Workflow exists or is being created, the per-rule body, `\u003e [!WARNING]` callouts for the specific failure modes found, `## Done Conditions`, and `## Gold Standard Example` (stated honestly as \"none yet\" where nothing qualifies). Scopes below are narrowed specifically to avoid duplicating what the three research passes found already exists:\n\n1. **`Tool Calls.md`** — relocate the four Tool Selection tables (Reading Files / Writing Files / MCP Filesystem Tools / Subagents) verbatim from `Vault Rules — Operational Reference.md`; delete them there, leave a one-line pointer. No Maps To/Workflow — a pure reference standard, same shape as `Log Standard.md`.\n2. **`Orchestration.md`** — consolidate: North Star Part 5.2\u0027s subagent file-shape rule (frontmatter `name`/`description`/`tools`/`model`), the spawn-vs-inline threshold bullets (moved out of Vault Rules, pointer left behind), and the real 11-agent roster with trigger/tools pattern. Gold Standard Example: `.claude/agents/anti-slop-editor.md` (North Star\u0027s own citation). Explicitly out of scope: plugin/tool-type choice (Dataview vs. Tasks vs. Kanban) — that stays in `AI_CONTEXT.md`\u0027s Workflow Chooser (Batch 1); this file is agent/skill coordination only.\n3. **`Memory Management.md`** — absorb `AI_CONTEXT.md`\u0027s 4-bullet Continuity Protocol as the base contract; extend with `Log Standard.md`\u0027s mechanism-naming discipline (cited, not duplicated) and a real citation of current `Session Logs/log.md` entry format; state an explicit, honest verdict on the CPR compress/preserve/resume pattern (`40_Resources/CS/AI/CPR - Compress Preserve Resume.md`) — adopt the compress-long-sessions idea narrowly, note it is not fully promoted even in its source repo, don\u0027t claim it as settled practice.\n4. **`Conversations.md`** — merge `60_Claude/07_AI_Information/AI Conversation - Summaries/README.md`\u0027s de facto spec (the one actually followed by real summary notes, including its informally-added `tools_used`/`tokens_total`/`cost_usd`/`source_os` fields — promote these to official) with `Conversation Capture.md`\u0027s three-layer pipeline. **New Template**: `30_Order/Templates/AI Use/AI Conversation Summary Template.md` (promoting the README\u0027s implicit shape into a real template — none exists today). Used By Workflow: `[[Conversation Capture]]`. Retire the README to a pointer at the new Standard, same demotion pattern used elsewhere.\n5. **`Knowledge Noting.md`** — scoped deliberately narrow: only the *decision layer* between `Source Summary Standard.md` and `Evergreen Standard.md` (when raw material warrants a summary at all vs. skipping straight to a distilled note; agent note-taking cadence while reading a source) — both existing Standards already fully specify final note shape, so this file must not restate their per-heading content. No new Template.\n6. **`Per Project Review.md`** — generalizes `Internship Loop Review Standard.md`\u0027s proven pattern (Weekly/Monthly split, Sources Reviewed, Immediate Actions / Decided Fixes / Open Questions, Carryover Escalation) to any `type: project` note from `Project Standard.md`, since neither `BOOM Board.md` nor `Projects Board.md` currently encodes a review cadence. **New Template**: `30_Order/Templates/Capability/Per Project Review Template.md`. **New Workflow**: a short `30_Order/Workflows/Enrichment/Per Project Review.md`, since a real repeated process is evident but not yet written down.\n7. **`Review System.md`** — the meta-layer tying the others together: a `## Review Layers Map` table showing how daily (`/startday`/`/closeday`), weekly/monthly (`weekly-review` skill + `Review Standard.md`), plan-specific (`Plan Review Cadence.md`), and now project-specific (`Per Project Review.md`, above) cadences nest and escalate — generalizing the Carryover Escalation idea already proven in `Internship Loop Review Standard.md`. No Maps To of its own; it is the index/contract above the concrete review Standards, the same relationship North Star has to Architecture.\n\n## Verification\n\n- After Batch 1–4: grep the vault for the dead strings `35_Outputs`, `7_AI_Information` (missing leading zero), `10_Session_Logs`, `30_Source_Summaries`, `10_UMN`, `60_Indexes`, `45_Outputs`, `50_Reviews` outside of `50_Archive/` and quoted-history contexts — zero hits expected once Batches 1–4 land.\n- After Batch 5: open `30_Order/00_How This Folder Works.md`\u0027s own checklist against each new Standard — every one either names its Template/Workflow under `## Maps To`/`## Used By Workflow` or explicitly has neither (matching `Log Standard.md`\u0027s precedent); none left empty.\n- Spot-check that no sentence is now true in two files at once (North Star\u0027s own test from Part 4): specifically confirm the Tool Selection tables, the subagent spawn-threshold bullets, and the Continuity Protocol bullets each exist in exactly one place after the moves.\n- Confirm `AGENTS.md`, `CLAUDE.md`, and North Star\u0027s own inbound links to `Vault Map`/`AI_CONTEXT`/`MCP-Hub-Index` still resolve (they will, since Batch 1 keeps both filenames alive as either the merged file or a stub).\n","planFilePath":"C:\\Users\\anant\\.claude\\plans\\graceful-wishing-gadget.md"}`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI_CONTEXT.md`
```
---
type: evergreen
status: tree
created: 2026-05-31
updated: 2026-10-15
tags:
  - system
  - ai-agents
  - vault-map
notes:
  - "[[Jarvis OS — North Star]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
  - "[[HUMAN_WRITING]]"
  - "[[30_Order/Standards/AI Loop/Orchestration|Orchestration]]"
  - "[[30_Order/Standards/AI Loop/Memory Management|Memory Management]]"
---
# AI Context Manifest — Orientation + Live State

If you are an AI tool working in Jarvis, start here. This is the five-minute orientation and the live-state manifest in one file — it keeps Claude, Cursor, Kiro, Codex, and other tools aligned without copying instructions into multiple files. Do not duplicate this file's contents into tool-specific docs; they point here instead.

Jarvis is a personal knowledge operating system in Obsidian: live dashboards, metadata, backlinks, source layers, and AI-generated synthesis. Work with that system, not around it.

## Cold-start read order

1. **This file** — orientation + live state.
2. [[Jarvis OS — North Star]] — strategy, diagnosis, build standard. Why Jarvis exists and what it's building toward.
3. [[AGENTS.md]] — Write Contract and routing table. Read before creating any file.
4. [[40_Resources/Obsidian/Jarvis Vault Architecture]] — where every note goes (placement source of truth).
5. `30_Order/Workflows/` ([[00_Workflows Index]]) — how to write each note type.
6. [[HUMAN_WRITING]] — how prose must sound; [[Jarvis Writing and Formatting]] — Obsidian formatting mechanics.
7. [[00_Dashboard]] and the tail of `60_Claude/07_AI_Information/Session Logs/log.md` — what's happening right now.

There is exactly one read order. If another file ever states a different one, that file is wrong and should point here instead.

## The six layers

Every folder answers one question. Every note belongs to exactly one layer.

| Folder | Layer | Question |
|---|---|---|
| `10_Areas/` | Identity | Who am I, what are my domains? (canonical hubs; holds `Excalidraw/`) |
| `20_Progress/` | Execution | What am I actively doing? (each note has a `next:`) |
| `30_Order/` | Rules | How are notes written and structured? (standards + templates + workflows + CLI) |
| `40_Resources/` | Reference | What do I look up to do the work? (curated hub) |
| `60_Claude/` | AI workshop | Where does AI capture, draft, distill, coordinate? |
| `50_Archive/` | Dead | What is done? (never read, never write) |

Inside `60_Claude/`: `00_Inbox/` (default landing zone), `05_Clippings/` (raw), `07_AI_Information/` (this layer — agent map + memory), `10_Source_Summaries/`, `20_Distilled_Notes/`, `30_Reviews/`, `40_Project_Briefs/`, `44_Indexes/`.

The core motion: **knowledge is born in `60_Claude`, matures, and is promoted out to Identity / Execution / Reference. The workshop is not a warehouse.**

## How to write a note

1. Decide the layer, then check the routing table in [[40_Resources/Obsidian/Jarvis Vault Architecture]] for the exact folder.
2. Open the matching workflow in `30_Order/Workflows/` and follow its steps.
3. Use the matching template in `30_Order/Templates/` and the frontmatter schema in [[40_Resources/Obsidian/Vault Operating System]].
4. Write in the voice of [[HUMAN_WRITING]]; format per [[Jarvis Writing and Formatting]].
5. Wikilink sources, neighbors, and the project or domain it serves.
6. Append one line to `60_Claude/07_AI_Information/Session Logs/log.md`.

`30_Order` is mandatory pre-write reading: it holds the standards, templates, and the per-folder procedures. `HUMAN_WRITING` is the voice; `30_Order` is the structure.

## Conventions in one place

- **Wikilinks, not plain mentions.** Link when the target note helps future retrieval. Use aliases (`[[Long Note|short]]`) when prose reads better.
- **Frontmatter is the query surface.** Always set `type`, `status`, `created`, `tags`. Add `track`, `source_status`, `enrichment_status`, `next` where the note type calls for it. Do not hide queryable facts only in prose.
- **Maturity:** `seed` → `sprout` → `tree`. Be conservative editing `tree` notes; propose big restructures first.
- **Honesty:** mark claims source-grounded, inferred, or uncertain. Never fake a finished note.

## What 07_AI_Information is

The AI operating and memory layer — how agents read this vault and what has happened before. The **map** (this file, [[60_Claude/07_AI_Information/Jarvis Writing and Formatting|Jarvis Writing and Formatting]], [[60_Claude/07_AI_Information/Plugins|Plugins]]) and the **memory** (`Session Logs/log.md`, `AI Conversation - Summaries/`). It points at `30_Order` for the writing rules; it does not duplicate them.

## Workflow Chooser — which plugin fits the job

Use the smallest mechanism that fits. For agent/skill/subagent coordination (not plugin choice), see [[30_Order/Standards/AI Loop/Orchestration|Orchestration]] instead — that is a different question from the one below.

**Use Dataview when** a list should stay current from frontmatter metadata — dashboards querying active projects, missing next actions, stale notes, or task queues. Do not use for one-off explanations.

**Use Tasks when** there is a concrete action that should appear in task queries, with a due date, scheduled date, priority, or completion state. Write action tasks, not vague intentions.

**Use Kanban when** the work has lanes or stages — habit tracking, project triage, execution status. Use notes for knowledge; use boards for flow.

**Use Excalidraw when** the concept is easier as a map, graph, feedback loop, or system diagram. Always keep searchable text near visual work — future agents need text to find things.

**Use Spaced Repetition when** the concept is already understood and the card tests one atomic idea. Do not make flashcards from raw source before distillation.

**Use Templater when** creating notes in folders with configured folder templates. If writing outside Obsidian, manually follow the same template fields.

## Never do this

- Create a new file or folder at the vault root.
- Invent a folder when unsure — write to `60_Claude/00_Inbox/` instead.
- Read or write `50_Archive/`.
- Rewrite a raw clipping in `60_Claude/05_Clippings/`.
- Bulk-dump AI output into `40_Resources/` (curated; one backlinked entry at a time).
- Touch `.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`, or copy any plugin secret into a note.
- Restructure a `status: tree` note, modify `.obsidian` settings, change a template schema, or convert task formats vault-wide without proposing it first.

## Live State Sources

These tell you what is happening right now. Read them instead of relying on stale summaries.

- `00_Dashboard.md` — current control panel; active projects, open tasks, inbox and cleanup queues
- `60_Claude/07_AI_Information/Session Logs/log.md` — recent AI-assisted work, system changes, previous sessions
- `60_Claude/44_Indexes/Vault Health Dashboard.md` — metadata drift, orphan notes, stale inbox items, projects missing next actions
- `60_Claude/44_Indexes/Claude Layer Index.md` — current Claude-layer outputs

## Domain Entry Points

Read these when the task is domain-specific.

### System and vault work
- `40_Resources/Obsidian/Vault Operating System.md` — canonical property/field schema
- `AGENTS.md`, `CLAUDE.md`

### Active projects and career work
- `20_Progress/Projects/Projects Board.md`
- relevant notes under `20_Progress/Career/`, `20_Progress/Mentorship Program/`

### AI / agents / workflows
- `40_Resources/Obsidian/Claude Pro Workflow.md`
- notes under `40_Resources/CS/AI/`
- relevant `60_Claude/10_Source_Summaries/` and `20_Distilled_Notes/`

### Coursework as feeder layer
- relevant notes under `10_Areas/Notes/`
- enrich only flagship notes or create durable mirror notes elsewhere

## Shared Rules

- Prefer enriching existing notes over creating duplicates.
- Prefer backlinks and canonical notes over repeated summaries.
- Preserve frontmatter.
- Use [[HUMAN_WRITING]] to avoid AI slop.

## Continuity Protocol

Session-to-session memory practice (what must survive a context reset, when to log vs. compress) now lives in [[30_Order/Standards/AI Loop/Memory Management|Memory Management]]. The one rule that belongs here because it's about this file specifically: do not store transient status in this file — `00_Dashboard.md` and the session log are the live continuity layer.

## Tool-Specific Notes

- `CLAUDE.md` — Claude-specific workflow details, skills, and agents.
- `40_Resources/Obsidian/Claude Pro Workflow.md` — Claude Pro usage, context-pack, MCP, Desktop, and mobile rules.
- `.kiro/steering/` — Kiro loading rules.
- `.cursor/rules/` — Cursor rule wrappers.
- `.claude/agents/` and `.claude/skills/` — Claude-specific operational helpers.

```
- `Grep` -- pattern `—` path `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI_CONTEXT.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && python - <<'EOF'
import re
p="60_Claude/07_AI_Information/AI_CONTEXT.md"
s=open(p,encoding="utf-8").read()
parts=re.split(r'(\[\[.*?\]\])',s)
out=[]
for x in parts:
    if x.startswith("[["): out.append(x)
    else: out.append(x.replace(" — ",": "))
s="".join(out)
s=s.replace("# AI Context Manifest: Orientation + Live State","# AI Context Manifest, Orientation and Live State")
s=s.replace("in one file: it keeps Claude","in one file. It keeps Claude")
s=s.replace("instead — that","instead. That").replace("instead: that","instead. That")
s=s.replace("## Workflow Chooser: which plugin fits the job","## Workflow Chooser (which plugin fits the job)")
s=s.replace("this file: do not store","this file. Do not store").replace("this file specifically: do not","this file specifically. Do not")
s=s.replace("(this layer: agent map + memory)","(this layer, agent map and memory)")
open(p,"w",encoding="utf-8").write(s)
EOF
grep -n "—" 60_Claude/07_AI_Information/AI_CONTEXT.md`
```
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
11:  - "[[Jarvis OS — North Star]]"
17:# AI Context Manifest — Orientation + Live State
19:If you are an AI tool working in Jarvis, start here. This is the five-minute orientation and the live-state manifest in one file — it keeps Claude, Cursor, Kiro, Codex, and other tools aligned without copying instructions into multiple files. Do not duplicate this file's contents into tool-specific docs; they point here instead.
25:1. **This file** — orientation + live state.
26:2. [[Jarvis OS — North Star]] — strategy, diagnosis, build standard. Why Jarvis exists and what it's building toward.
27:3. [[AGENTS.md]] — Write Contract and routing table. Read before creating any file.
28:4. [[40_Resources/Obsidian/Jarvis Vault Architecture]] — where every note goes (placement source of truth).
29:5. `30_Order/Workflows/` ([[00_Workflows Index]]) — how to write each note type.
30:6. [[HUMAN_WRITING]] — how prose must sound; [[Jarvis Writing and Formatting]] — Obsidian formatting mechanics.
31:7. [[00_Dashboard]] and the tail of `60_Claude/07_AI_Information/Session Logs/log.md` — what's happening right now.
48:Inside `60_Claude/`: `00_Inbox/` (default landing zone), `05_Clippings/` (raw), `07_AI_Information/` (this layer — agent map + memory), `10_Source_Summaries/`, `20_Distilled_Notes/`, `30_Reviews/`, `40_Project_Briefs/`, `44_Indexes/`.
72:The AI operating and memory layer — how agents read this vault and what has happened before. The **map** (this file, [[60_Claude/07_AI_Information/Jarvis Writing and Formatting|Jarvis Writing and Formatting]], [[60_Claude/07_AI_Information/Plugins|Plugins]]) and the **memory** (`Session Logs/log.md`, `AI Conversation - Summaries/`). It points at `30_Order` for the writing rules; it does not duplicate them.
74:## Workflow Chooser — which plugin fits the job
76:Use the smallest mechanism that fits. For agent/skill/subagent coordination (not plugin choice), see [[30_Order/Standards/AI Loop/Orchestration|Orchestration]] instead — that is a different question from the one below.
78:**Use Dataview when** a list should stay current from frontmatter metadata — dashboards querying active projects, missing next actions, stale notes, or task queues. Do not use for one-off explanations.
82:**Use Kanban when** the work has lanes or stages — habit tracking, project triage, execution status. Use notes for knowledge; use boards for flow.
84:**Use Excalidraw when** the concept is easier as a map, graph, feedback loop, or system diagram. Always keep searchable text near visual work — future agents need text to find things.
93:- Invent a folder when unsure — write to `60_Claude/00_Inbox/` instead.
104:- `00_Dashboard.md` — current control panel; active projects, open tasks, inbox and cleanup queues
105:- `60_Claude/07_AI_Information/Session Logs/log.md` — recent AI-assisted work, system changes, previous sessions
106:- `60_Claude/44_Indexes/Vault Health Dashboard.md` — metadata drift, orphan notes, stale inbox items, projects missing next actions
107:- `60_Claude/44_Indexes/Claude Layer Index.md` — current Claude-layer outputs
114:- `40_Resources/Obsidian/Vault Operating System.md` — canonical property/field schema
139:Session-to-session memory practice (what must survive a context reset, when to log vs. compress) now lives in [[30_Order/Standards/AI Loop/Memory Management|Memory Management]]. The one rule that belongs here because it's about this file specifically: do not store transient status in this file — `00_Dashboard.md` and the session log are the live continuity layer.
143:- `CLAUDE.md` — Claude-specific workflow details, skills, and agents.
144:- `40_Resources/Obsidian/Claude Pro Workflow.md` — Claude Pro usage, context-pack, MCP, Desktop, and mobile rules.
145:- `.kiro/steering/` — Kiro loading rules.
146:- `.cursor/rules/` — Cursor rule wrappers.
147:- `.claude/agents/` and `.claude/skills/` — Claude-specific operational helpers.
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI_CONTEXT.md`
```
---
type: evergreen
status: tree
created: 2026-05-31
updated: 2026-10-15
tags:
  - system
  - ai-agents
  - vault-map
notes:
  - "[[Jarvis OS — North Star]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
  - "[[HUMAN_WRITING]]"
  - "[[30_Order/Standards/AI Loop/Orchestration|Orchestration]]"
  - "[[30_Order/Standards/AI Loop/Memory Management|Memory Management]]"
---
# AI Context Manifest: Orientation and Live State

If you are an AI tool working in Jarvis, start here. This is the five-minute orientation and the live-state manifest in one file. It keeps Claude, Cursor, Kiro, Codex, and other tools aligned without copying instructions into multiple files. Do not duplicate this file's contents into tool-specific docs; they point here instead.

Jarvis is a personal knowledge operating system in Obsidian: live dashboards, metadata, backlinks, source layers, and AI-generated synthesis. Work with that system, not around it.

## Cold-start read order

1. **This file.** Orientation and live state.
2. [[Jarvis OS — North Star]]: strategy, diagnosis, build standard. Why Jarvis exists and what it is building toward.
3. [[AGENTS.md]]: Write Contract and routing table. Read before creating any file.
4. [[40_Resources/Obsidian/Jarvis Vault Architecture]]: where every note goes (placement source of truth).
5. `30_Order/` ([[30_Order/00_How This Folder Works|How This Folder Works]], then [[00_Workflows Index]]): the standard, template, and workflow for the note type you are writing. This is mandatory before any write.
6. [[HUMAN_WRITING]] for voice, [[Jarvis Writing and Formatting]] for Obsidian formatting mechanics.
7. [[00_Dashboard]] and the tail of `60_Claude/07_AI_Information/Session Logs/log.md`: what is happening right now.

There is exactly one read order. If another file states a different one, that file is wrong and should point here instead.

## The six layers

Every folder answers one question. Every note belongs to exactly one layer.

| Folder | Layer | Question |
|---|---|---|
| `10_Areas/` | Identity | Who am I, what are my domains? (canonical hubs; holds `Excalidraw/`) |
| `20_Progress/` | Execution | What am I actively doing? (each note has a `next:`) |
| `30_Order/` | Rules | How are notes written and structured? (standards, templates, workflows, CLI) |
| `40_Resources/` | Reference | What do I look up to do the work? (curated hub) |
| `60_Claude/` | AI workshop | Where does AI capture, draft, distill, coordinate? |
| `50_Archive/` | Dead | What is done? (never read, never write) |

Inside `60_Claude/`: `00_Inbox/` (default landing zone), `05_Clippings/` (raw), `07_AI_Information/` (this layer: agent map and memory), `10_Source_Summaries/`, `20_Distilled_Notes/`, `30_Reviews/`, `40_Project_Briefs/`, `44_Indexes/`.

The core motion: **knowledge is born in `60_Claude`, matures, and is promoted out to Identity, Execution, or Reference. The workshop is not a warehouse.**

## How to write a note

Every note goes through `30_Order`. No frontmatter or structure is invented outside the templates and standards there. If no template exists for the note type you need, stop and say so, so one can be designed (Standard first, then Template, then Workflow, per [[30_Order/00_How This Folder Works|How This Folder Works]]).

1. Decide the layer, then check the routing table in [[40_Resources/Obsidian/Jarvis Vault Architecture]] for the exact folder.
2. Open the matching Standard in `30_Order/Standards/` (content contract) and Workflow in `30_Order/Workflows/` (process).
3. Start from the matching Template in `30_Order/Templates/`. Property meanings live in [[40_Resources/Obsidian/Vault Operating System]].
4. Write in the voice of [[HUMAN_WRITING]]; format per [[Jarvis Writing and Formatting]].
5. Wikilink sources, neighbors, and the project or domain it serves.
6. Append one line to `60_Claude/07_AI_Information/Session Logs/log.md`.

`HUMAN_WRITING` is the voice. `30_Order` is the structure.

## Conventions in one place

- **Wikilinks, not plain mentions.** Link when the target note helps future retrieval. Use aliases (`[[Long Note|short]]`) when prose reads better.
- **Frontmatter is the query surface.** Always set `type`, `status`, `created`, `tags`. Add `track`, `source_status`, `enrichment_status`, `next` where the note type calls for it. Do not hide queryable facts only in prose.
- **Maturity:** `seed`, then `sprout`, then `tree`. Be conservative editing `tree` notes; propose big restructures first.
- **Honesty:** mark claims source-grounded, inferred, or uncertain. Never fake a finished note.

## What 07_AI_Information is

The AI operating and memory layer: how agents read this vault and what has happened before. The **map** is this file, [[Jarvis Writing and Formatting]], and [[Plugins]]. The **memory** is `Session Logs/log.md` and `AI Conversation - Summaries/`. It points at `30_Order` for the writing rules and does not duplicate them.

## Workflow Chooser (which plugin fits the job)

Use the smallest mechanism that fits. For agent, skill, and subagent coordination (a different question from plugin choice), see [[30_Order/Standards/AI Loop/Orchestration|Orchestration]].

**Use Dataview when** a list should stay current from frontmatter metadata: dashboards querying active projects, missing next actions, stale notes, or task queues. Do not use for one-off explanations.

**Use Tasks when** there is a concrete action that should appear in task queries, with a due date, scheduled date, priority, or completion state. Write action tasks, not vague intentions.

**Use Kanban when** the work has lanes or stages: habit tracking, project triage, execution status. Use notes for knowledge; use boards for flow.

**Use Excalidraw when** the concept is easier as a map, graph, feedback loop, or system diagram. Keep searchable text near visual work, because future agents need text to find things.

**Use Spaced Repetition when** the concept is already understood and the card tests one atomic idea. Do not make flashcards from raw source before distillation.

**Use Templater when** creating notes in folders with configured folder templates. If writing outside Obsidian, manually follow the same template fields.

## Never do this

- Create a new file or folder at the vault root.
- Invent a folder when unsure. Write to `60_Claude/00_Inbox/` instead.
- Read or write `50_Archive/`.
- Rewrite a raw clipping in `60_Claude/05_Clippings/`.
- Bulk-dump AI output into `40_Resources/` (curated; one backlinked entry at a time).
- Touch `.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`, or copy any plugin secret into a note.
- Restructure a `status: tree` note, modify `.obsidian` settings, change a template schema, or convert task formats vault-wide without proposing it first.
- Write a note with frontmatter or headings that no template in `30_Order/Templates/` defines.

## Live State Sources

These tell you what is happening right now. Read them instead of relying on stale summaries.

- `00_Dashboard.md`: current control panel; active projects, open tasks, inbox and cleanup queues.
- `60_Claude/07_AI_Information/Session Logs/log.md`: recent AI-assisted work, system changes, previous sessions.
- `60_Claude/44_Indexes/Vault Health Dashboard.md`: metadata drift, orphan notes, stale inbox items, projects missing next actions.
- `60_Claude/44_Indexes/Claude Layer Index.md`: current Claude-layer outputs.

## Domain Entry Points

Read these when the task is domain-specific.

- **System and vault work:** `40_Resources/Obsidian/Vault Operating System.md` (property schema), `AGENTS.md`, `CLAUDE.md`.
- **Active projects and career:** `20_Progress/Projects/Projects Board.md`, then relevant notes under `20_Progress/Career/` and `20_Progress/Mentorship Program/`.
- **AI, agents, workflows:** `40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md`, notes under `40_Resources/CS/AI/`, and relevant `60_Claude/10_Source_Summaries/` and `20_Distilled_Notes/`.
- **Coursework (feeder layer):** relevant notes under `10_Areas/Notes/`. Enrich only flagship notes or create durable mirror notes elsewhere.

## Shared Rules

- Prefer enriching existing notes over creating duplicates.
- Prefer backlinks and canonical notes over repeated summaries.
- Preserve frontmatter.
- Use [[HUMAN_WRITING]] to avoid AI slop.

## Continuity Protocol

Session-to-session memory practice (what must survive a context reset, when to log, when to compress) lives in [[30_Order/Standards/AI Loop/Memory Management|Memory Management]]. The one rule that belongs here: do not store transient status in this file. `00_Dashboard.md` and the session log are the live continuity layer.

## Tool-Specific Notes

- `CLAUDE.md`: Claude-specific workflow details, skills, and agents.
- `40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md`: Claude Pro usage, context-pack, MCP, Desktop, and mobile rules.
- `.kiro/steering/`: Kiro loading rules.
- `.cursor/rules/`: Cursor rule wrappers.
- `.claude/agents/` and `.claude/skills/`: Claude-specific operational helpers.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Map.md`
```
---
type: evergreen
status: tree
created: 2026-05-31
updated: 2026-10-15
tags:
  - system
  - ai-agents
  - vault-map
notes:
  - "[[AI_CONTEXT]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
---
# Vault Map

This file's content has been merged into [[AI_CONTEXT]]. Read that instead:

- **Cold-start read order, six layers, how to write a note, conventions, workflow chooser, never-do list** are all in [[AI_CONTEXT]].
- **Where every note goes** is in [[40_Resources/Obsidian/Jarvis Vault Architecture]].

No unique content remains here. This file exists only to keep inbound wikilinks working.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\MCP-Hub-Index.md`
```
---
type: evergreen
status: sprout
created: 2026-05-29
updated: 2026-10-15
tags:
  - evergreen
  - mcp-hub
  - agent-entry-point
notes:
  - "[[AI_CONTEXT]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
---
# MCP Hub Index

Entry point for external agents that reach this vault only through an MCP server and cannot read `CLAUDE.md` or `AGENTS.md` from disk.

There is no separate read order for MCP-only agents. Use the same one as every other tool:

1. [[AI_CONTEXT]] for orientation, the single cold-start read order, and live state.
2. [[40_Resources/Obsidian/Jarvis Vault Architecture]] for where every note goes.
3. [[AGENTS.md]] for the Write Contract.

The `/mcp-hub` skill (`.claude/skills/mcp-hub/mcp-hub.md`) lists MCP tools, builds context packs, and checks that tool wrappers have not drifted.

This file previously carried its own folder map and read order, built on folder names that no longer exist. Those were removed so only one copy of each rule remains.

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\Vault Operating System.md`
```diff
- This note is the canonical operating contract for Jarvis as an AI second brain.
## What this vault is for
This note is the **canonical property/field schema** for Jarvis. Read before creating or restructuring notes.
+ ## What this note is for
This note is the **canonical property/field schema** for Jarvis. Read before creating or restructuring notes.
```
- `Grep` -- pattern `10_UMN|35_Outputs|50_Reviews|45_Outputs|10_Session_Logs|30_Source_Summaries|60_Indexes|[^0]7_AI_Information` path `D:\_Anant\20_Progress\Documents\Jarvis`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -rEc "10_UMN|35_Outputs|50_Reviews|45_Outputs|10_Session_Logs|30_Source_Summaries|60_Indexes|[^0]7_AI_Information" --include="*.md" --include="*.mdc" --include="*.json" --include="*.ps1" --include="*.py" --exclude-dir=50_Archive --exclude-dir=.git --exclude-dir=.stversions --exclude-dir=node_modules . 2>/dev/null | grep -v ":0$" | sort -t: -k2 -nr | head -50`
```
./60_Claude/05_Clippings/AI Conversations/Windows/Claude Code/Jarvis/09-20 Jarvis vault plugins documentation batch 3.md:66
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/09-20 Jarvis vault plugins documentation batch 3.md:65
./20_Progress/AI/Kiro/.kiro_wsl/tasks/240654dd3ff4e20b/pkm-capability-engine.meta.json:48
./60_Claude/07_AI_Information/Session Logs/log.md:43
./60_Claude/05_Clippings/AI Conversations/Windows/Cowork/2026-06/06-19 Below is a very detailed prompt written by sonnet 4.6 on.md:40
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/2026-06/06-20 Below is a very detailed prompt written by sonnet 4.6 on.md:40
./60_Claude/05_Clippings/AI Conversations/Dell/WSL/Claude/second-brain-claudekit/09-05 Second-brain-claudekit workspace cleanup and promotion pipeline.md:34
./20_Progress/AI/Kiro/The Plan/specs/pkm-capability-engine/tasks.md:27
./20_Progress/AI/Kiro/Jarvis/specs/pkm-capability-engine/tasks.md:27
./.kiro/specs/pkm-capability-engine/tasks.md:27
./60_Claude/05_Clippings/AI Conversations/Windows/Cowork/2026-07/07-07 # MISSION.md:25
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/2026-07/07-07 # MISSION.md:25
./60_Claude/05_Clippings/AI Conversations/Windows/Cowork/2026-06/06-19 [image attached].md:23
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/_archive-pre-fix/06-20 Cowork - Opus 4.8 finished the task and here is what it returned.md:23
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/2026-06/06-20 [image attached].md:23
./20_Progress/AI/Kiro/The Plan/specs/pkm-capability-engine/requirements.md:23
./20_Progress/AI/Kiro/Jarvis/specs/pkm-capability-engine/requirements.md:23
./.kiro/specs/pkm-capability-engine/requirements.md:23
./60_Claude/30_Reviews/Ops Reports/Jarvis Ops Report - 2026-04-24 20260424-170132.md:20
./20_Progress/AI/Kiro/The Plan/specs/pkm-capability-engine/design.md:19
./20_Progress/AI/Kiro/Jarvis/specs/pkm-capability-engine/design.md:19
./.kiro/specs/pkm-capability-engine/design.md:19
./60_Claude/30_Reviews/Vault-Audit-2026-05-29.md:16
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/_archive-pre-fix/06-20 Cowork - Below is a very detailed prompt written by sonnet 4.6 on.md:16
./40_Resources/UMN/Previous Classes/Minor/MGMT 3001/MGMT 3001 Master Summary.md:15
./60_Claude/05_Clippings/AI Conversations/Windows/Cowork/2026-07/07-07 I have two vaults The Plan & Jarvis - you have mcp tools.md:14
./60_Claude/05_Clippings/AI Conversations/Windows/Claude Code/Jarvis/09-19 Jarvis cross-laptop sync build 5 readiness.md:14
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/09-19 Jarvis cross-laptop sync build 5 readiness.md:14
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/2026-07/07-07 I have two vaults The Plan & Jarvis - you have mcp tools.md:14
./20_Progress/Projects/Jarvis & The Plan/Jarvis Three-Month Research Engine Master Plan.md:13
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/07-03 jarvis-os-fable-execution.md:12
./20_Progress/AI/Kiro/The Plan/specs/claude-code-ops-layer/design.md:12
./20_Progress/AI/Kiro/Jarvis/specs/claude-code-ops-layer/design.md:12
./.kiro/specs/claude-code-ops-layer/design.md:12
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/07-05 Set up centralized AI conversation archiving system.md:11
./20_Progress/Projects/Jarvis & The Plan/Jarvis Multi-Agent PKM Plan.md:11
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/08-20 Verify second-brain-claudekit adversarial review findings.md:10
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/08-20 Audit and build out ten Claude Code mirrors.md:10
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/07-27 Summer goals progress review and August planning.md:10
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/07-02 Configure Jarvis AI OS with Fable 5.md:10
./40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:10
./60_Claude/05_Clippings/AI Conversations/Windows/Cowork/2026-06/06-11 North Star — Execution Prompt.md:9
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Cowork/2026-06/06-11 North Star — Execution Prompt.md:9
./20_Progress/AI/Kiro/The Plan/specs/claude-code-ops-layer/requirements.md:9
./20_Progress/AI/Kiro/Jarvis/specs/claude-code-ops-layer/requirements.md:9
./20_Progress/AI/Claude Code/The Plan/CLAUDE.md:9
./.kiro/specs/claude-code-ops-layer/requirements.md:9
./60_Claude/05_Clippings/AI Conversations/Windows/Claude Code/Jarvis/09-19 Cross-laptop sync Build 3 audit.md:8
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Cursor/Jarvis/05-31 Execution plan for vault OS upgrade.md:8
./60_Claude/05_Clippings/AI Conversations/Dell/Windows/Claude/Jarvis/09-19 Cross-laptop sync Build 3 audit.md:8
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\Jarvis Vault Architecture.md`
```
---
type: evergreen
status: tree
created: 2026-05-30
updated: 2026-10-15
tags:
  - evergreen
  - system
  - obsidian
  - architecture
notes:
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[AGENTS]]"
  - "[[CLAUDE.md]]"
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[00_Dashboard]]"
---

# Jarvis Vault Architecture

This note defines what every folder in Jarvis is for, what goes in it, who may write to it, and how a note moves from raw capture to durable knowledge. It is the placement source of truth. When this note and the folder tree disagree, fix one of them on purpose. Never let an agent guess.

Read it before writing anything into the vault. An agent that does not know the architecture will invent a folder, and one bad guess at the root pollutes the whole system.

---

## The mental model: six layers

Jarvis is six layers, each answering one question. Every folder belongs to exactly one layer. If you can name the layer, you know where a note goes.

| Layer | Folder | The question it answers | Who owns it |
|---|---|---|---|
| **Identity** | `10_Areas/` | Who am I and what are my domains? | You. AI patches by heading only. |
| **Execution** | `20_Progress/` | What am I actively doing right now? | You + AI, working notes with next actions. |
| **Rules** | `30_Order/` | How are notes written and structured here? | You. AI reads this before writing; edits only when building tooling. |
| **Reference** | `40_Resources/` | What do I need to know or look up to do the work? | You curate. AI proposes, never bulk-dumps. |
| **AI workshop** | `60_Claude/` | Where does AI capture, draft, distill, and coordinate? | Every AI agent, freely. |
| **Dead** | `50_Archive/` | What is done and out of rotation? | Nobody touches it. AI never reads or writes. |

Two cross-cutting pieces sit inside these layers:

- **Visual**: `10_Areas/Excalidraw/` holds diagrams for any concept, project, or source. A diagram belongs to the domain it explains.
- **AI operating memory**: `60_Claude/07_AI_Information/` holds how any AI reads this vault, plus the session log and conversation record.

The most important relationship: **knowledge is born in `60_Claude`, matures there, and is promoted out to Identity, Execution, or Reference. `60_Claude` is a workshop, not a warehouse.**

---

## The Write Contract

Every agent follows this, regardless of which tool is driving (Claude Code, Cursor, Kiro, Codex, Cowork, or anything talking only through the Obsidian MCP server).

### Golden rules

1. **Never create a new top-level file or folder at the vault root.** The root holds exactly `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`, and the numbered folders `10_Areas` through `60_Claude`.
2. **When unsure where a note goes, write it to `60_Claude/00_Inbox/`.** A misfiled note in the Inbox is fixed in five seconds. A note in an invented folder is invisible until it causes damage.
3. **Read `30_Order/` before writing.** Its `Standards/`, `Templates/`, and `Workflows/` define how every note type is shaped and filed. No frontmatter or structure is used that a template does not define. If no template exists for the note type, say so and design one first (see [[30_Order/00_How This Folder Works|How This Folder Works]]).
4. **Search before creating.** Extend an existing canonical note. Most "new" notes should be edits.
5. **Preserve frontmatter and wikilinks. Patch by heading.**

### Where does this note go?

This table is mirrored in `AGENTS.md`. If the two ever differ, this one wins and `AGENTS.md` gets fixed.

| If the note is | Write it to |
| --- | --- |
| A raw clip, paste, web capture, video, or imported source | `60_Claude/05_Clippings/` |
| A quick AI output you are not sure how to file | `60_Claude/00_Inbox/` |
| A summary of one source | `60_Claude/10_Source_Summaries/` |
| Reusable distilled knowledge (a concept, not a source) | `60_Claude/20_Distilled_Notes/`, then promote to `40_Resources/` or `10_Areas/` once stable |
| Stable reference material (guide, cheat sheet, plugin doc, link) | `40_Resources/` + backlink to its `10_Areas/` domain |
| Work on an active project, internship, research, or mentorship | `20_Progress/` under the matching project folder |
| A canonical fact about a life domain | `10_Areas/`, patching an existing domain file by heading; no new top-level files without explicit instruction |
| A synthesized project brief | `60_Claude/40_Project_Briefs/` |
| A reusable deliverable (interview story, portfolio bullet, prompt) | `60_Claude/40_Project_Briefs/` with `source_concepts:` provenance. No dedicated Outputs folder exists today. |
| A daily, weekly, or monthly review | `10_Areas/Life/Enumerate/{Daily,Weekly,Monthly,Yearly}` (Periodic Notes) or `60_Claude/30_Reviews/` (AI, internship, ops, and synthesis reviews) |
| A dashboard or index | `60_Claude/44_Indexes/` |
| A session log entry | append to `60_Claude/07_AI_Information/Session Logs/log.md` |
| A new template, standard, workflow, or CLI tool | `30_Order/`, only when the task is explicitly building one |
| A visualization for a concept, project, PDF, source, or AI input | `10_Areas/Excalidraw/`, in an area or project subfolder |
| Information about the whole vault for any AI tool | `60_Claude/07_AI_Information/` |

### Never write to

- **The vault root.** No new files or folders directly inside it.
- **`50_Archive/`.** Never read, never write. Excluded from all AI context unless the task is explicitly archival.
- **`60_Claude/05_Clippings/`** after capture. Raw sources are read-only input.
- **`40_Resources/` in bulk.** It is a curated hub. Add a single backlinked entry when it is genuinely reference; never flush a batch of AI distillations into it.
- **`.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`.** Settings and tooling only, never notes. (`.claude/` skills and agents may be edited only when the task is building tooling.)

---

## The 60_Claude flow model

Anything can be dumped into `60_Claude`. Value is created when a dump is distilled and routed to a concrete home.

```
capture        05_Clippings (raw source)   ·   00_Inbox (loose AI output)
   ↓ summarize one source
distill        10_Source_Summaries  →  20_Distilled_Notes (working concept drafts)
   ↓ when a concept is stable and reused
promote        10_Areas/ (canonical domain truth)   ·   40_Resources/ (curated reference)   ·   20_Progress/ (active work)
```

What legitimately stays in `60_Claude` long-term is the operating machinery, not the knowledge: clippings, source summaries, project briefs, reviews, indexes, and the `07_AI_Information` layer. A distilled concept is a guest in `20_Distilled_Notes`. Once it is trustworthy and reused, it belongs in `10_Areas` (identity-level truth) or `40_Resources` (lookup reference).

**The 40_Resources guardrail.** Promotion into `40_Resources` is curated, not automatic. AI proposes a promotion and backlinks it; you decide whether it earns a place. The workshop never empties itself into your library without review.

---

## Top-level folder contracts

### Root files

**Job:** the fixed entry points every tool and human starts from.
**Belongs:** `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`. Dotfolders (`.claude`, `.obsidian`, `.git`, `.cursor`, `.kiro`, `.codex`) are tooling, not vault content.
**Who writes:** you, and AI only when explicitly editing one of those four contract files.

### 10_Areas: identity layer

**Job:** the source of truth for who you are and what you are working toward. Small and link-dense: a hub per domain that points out to active work in `20_Progress` and reference in `40_Resources`.
**Belongs:** one or two canonical notes per domain. Current domains: `Career/`, `Trading/`, `Life/`, `AI/`, plus `Notes/` (coursework) and `Excalidraw/` (visual layer).
**Does not belong:** active build work (that is Execution) and raw AI output.
**Who writes:** you, freely. AI patches existing domain notes by heading and never adds new top-level files here without explicit instruction.
**Workflow:** each domain gets one canonical hub note (`type: evergreen`, `status: tree`) that states the durable truth of that domain and links to the live work and resources. Everything else in the domain folder is subordinate to that hub.

### 20_Progress: execution layer

**Job:** everything actively in motion. If you are pushing on it this term, it lives here with a next action.
**Belongs:** active projects, internship tracking, mentorship, research (UROP/BOOM), degree planning, AI tooling setups. Current shape: `AI/`, `Degree/`, `Internship/`, `Mentorship Program/`, `Projects/`.
**Does not belong:** finished work (`50_Archive`), pure reference (`40_Resources`), identity-level truth (`10_Areas`).
**Who writes:** AI writes concrete project notes here, drawn from `60_Claude/40_Project_Briefs/` and `20_Distilled_Notes/`. Every `type: project` note carries a `next:` so the dashboard can surface stalls.
**Workflow:** a project starts as a brief in `40_Project_Briefs/`, becomes a live project note here with a `next:`, accrues working notes, and ends archived. The test: can you name something you are working on that has no note here? If yes, that thread is invisible to the system.

### 30_Order: rules and machinery layer

**Job:** how the vault itself works. `HUMAN_WRITING` governs how prose sounds; `30_Order` governs how a note is shaped, structured, and filed. **Every AI agent must read the relevant part of this folder before writing a note.**
**Belongs:** `Standards/` (content contracts per note type), `Templates/` (empty scaffolds), `Workflows/` (the process around creating and updating each type), and `System/` (`jarvis-cli`, `jarvis-memory`, sync and Claude workflow tooling).
**Does not belong:** knowledge, course material, PDFs, attachments. If it is not a standard, template, workflow, or tool, it does not belong here.
**Who writes:** you. AI reads this folder as mandatory input and edits it only when the explicit task is building a standard, template, workflow, or tool.
**Workflow:** see [[30_Order/00_How This Folder Works|How This Folder Works]] for the Standard, Template, Workflow split and the rule for adding a new note type.

### 40_Resources: reference hub

**Job:** your private search engine. Guides, concepts, links, tools, and docs you reach for to do the work. `10_Areas` and `20_Progress` link into here for the resource they need.
**Belongs:** `CS/` (AI tooling notes, concepts, links, repos), `Obsidian/` (system docs including this note and the Vault Operating System), `Capability/`, and course reference under `UMN/`. Every entry backlinks to the `10_Areas` domain it serves.
**Does not belong:** raw captures (`05_Clippings`), one-off source summaries (`10_Source_Summaries`), active project notes. Not a dumping ground for AI distillations.
**Who writes:** you curate. AI may add a single backlinked reference entry when it is genuinely lookup material, and otherwise proposes promotions for your review.

### 50_Archive: dead-letter office

**Job:** historical material out of active rotation but not deleted. **AI never reads and never writes here.** The hard exclusion keeps stale content out of AI context.

### 60_Claude: AI workshop and orchestration layer

**Job:** where every AI agent captures, drafts, distills, and coordinates. The one place an agent can write without second-guessing. Home of the default landing zone (`00_Inbox`).
**Who writes:** every AI agent, freely.
**Numbering:** subfolder numbers are intentionally non-sequential to leave room for insertion. Keep them stable so links do not break.

| Subfolder | Holds | AI behavior |
|---|---|---|
| `00_Inbox/` | loose AI output awaiting filing; the default landing zone | write freely; review and route out regularly |
| `05_Clippings/` | raw clips, web captures, videos, PDFs, AI conversations (`Web/`, `Videos/`, `PDFs/`, `AI Conversations/`) | write on capture only; never rewrite in place |
| `07_AI_Information/` | the AI operating and memory layer (see below) | patch the docs, append the logs |
| `10_Source_Summaries/` | one summary per source (`Web Ingestion/`, `Video Ingestion/`, `PDF Ingestion/`, `Github Ingestion/`) | one source in, one summary out |
| `20_Distilled_Notes/` | working concept drafts, `Synthesis/` | write; promote stable concepts to `10_Areas` or `40_Resources` |
| `30_Reviews/` | `AI/`, `Internship Loop/`, `Monthly/`, `Weekly Synthesis/`, `Ops Reports/` | write on cadence |
| `40_Project_Briefs/` | synthesized project plans (`CausalOps/`, `Internship/`, `Portfolio/`, `TradingView/`) | write; feed `20_Progress` |
| `44_Indexes/` | dashboards, indexes, Field OS, `Bases/` | prefer Dataview and Bases over hand-maintained tables |

#### 07_AI_Information: the AI operating and memory layer

**Job:** the agent's map and memory. The **map** is [[AI_CONTEXT]] (orientation, cold-start read order, live state), `Jarvis Writing and Formatting.md`, and `Plugins.md`. The **memory** is `Session Logs/log.md` and `AI Conversation - Summaries/`.

**Relationship to `30_Order`:** rules and standards live in `30_Order`; orientation and history live in `07_AI_Information`. This layer points agents at `30_Order` when they need the writing procedure and does not restate it.

### Excalidraw: visual layer (under 10_Areas)

**Job:** diagrams and visual thinking for any concept, project, source, or AI input, organized by the area or project they explain. Link every drawing from the note it supports.

---

## Status as of 2026-10-15

Verified against the current folder tree, not carried over from the May 2026 version of this note.

**Resolved since 2026-05-31:**
- `30_Order/Workflows/` exists and is indexed in [[00_Workflows Index]].
- The orientation file exists. It is now merged into [[AI_CONTEXT]], which holds the single cold-start read order.
- The coursework-home question is settled: `10_Areas/UMN/` no longer exists; coursework lives in `10_Areas/Notes/` with reference under `40_Resources/UMN/`.
- `AGENTS.md` carries the Write Contract.
- The `60_Claude/35_Outputs/` and `60_Claude/50_Reviews/` folders no longer exist. Reviews live in `30_Reviews/`. Reusable deliverables have no dedicated folder; use `40_Project_Briefs/`.

**Still open:**
- `10_Areas` identity hubs. `Trading/` has a hub-shaped note (`Stocks Trading AI Hub.md`). `Career/` and `Life/` have no single canonical hub note yet.
- `Links.md` still exists in several places. One canonical links note per domain has not been chosen.
- Not re-verified in this pass: whether `00_Dashboard.md` Dataview blocks still query a dead coursework path.
- `60_Claude/Claude Board.md` sits loose at the `60_Claude/` root and has no routing rule.

---

## Relationship to the other contract docs

- **This note:** what each folder is for and where any note goes.
- [[40_Resources/Obsidian/Vault Operating System]]: the property and frontmatter schema only.
- [[HUMAN_WRITING]]: how prose must sound. `30_Order` is the structural half.
- [[AGENTS]]: root behavioral rules; mirrors this note's Write Contract.
- [[CLAUDE.md]]: Claude-specific workflow, skills, and agents.
- [[AI_CONTEXT]]: orientation and live-state manifest for every tool.
- [[Jarvis OS — North Star]]: strategy and the reasons behind this structure.

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls 40_Resources && echo --- && grep -nE "10_UMN|35_Outputs|50_Reviews" 00_Dashboard.md AGENTS.md CLAUDE.md HUMAN_WRITING.md 2>/dev/null; echo "--- Claude Pro Workflow path refs ---"; grep -rn "Obsidian/Claude Pro Workflow" --include="*.md" . 2>/dev/null | grep -v "50_Archive\|05_Clippings\|Session Logs" | head`
```
CS
Capability
Obsidian
Random.md
UMN
---
AGENTS.md:59:| Reusable output artifact (story, bullet, prompt) | `60_Claude/35_Outputs/` with `source_concepts:` provenance |  |
AGENTS.md:60:| Daily / weekly / monthly review | `60_Claude/50_Reviews/` |  |
--- Claude Pro Workflow path refs ---
./60_Claude/00_Inbox/copilot/copilot-conversations/AI_Agent_Vault_Key_Files@20260529_103543.md:50:- `40_Resources/Obsidian/Claude Pro Workflow.md` (Claude-specific operating rules; listed as a canonical shared source) [^1]
./60_Claude/00_Inbox/copilot/copilot-conversations/AI_Agent_Vault_Key_Files@20260529_103543.md:71:  - `40_Resources/Obsidian/Claude Pro Workflow.md`  
./60_Claude/07_AI_Information/Jarvis OS — North Star.md:85:| `40_Resources/Obsidian/Claude Pro Workflow` | Pro-plan discipline | **Keep, trim.** The surface-roles and rate-limit content is unique. Cut the context-pack and MCP sections once those live here / in Part 5. |
./60_Claude/30_Reviews/Vault-Audit-2026-05-29.md:59:| `40_Resources/Obsidian/Claude Pro Workflow.md` | Good | Status `sprout`, created 2026-05-26. Strong on surface roles (Code/Desktop/mobile), MCP rules, rate-limit discipline, verification checklist. This is the operating contract for Claude Pro usage and should be the first file every Claude session reads after `AGENTS.md`. |
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W22.md:22:- `40_Resources/Obsidian/Claude Pro Workflow.md` — full operating guide for strict-budget summer AI workflow
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W22.md:66:**New notes without links:** `40_Resources/Obsidian/Claude Pro Workflow.md` — verify it links to `AI_CONTEXT`, `CLAUDE.md`, `00_Dashboard.md`. `60_Claude/40_Project_Briefs/Claude Optimization Master Setup.md` — should link to the Three-Month Master Plan.
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W22.md:71:2. `[[40_Resources/Obsidian/Claude Pro Workflow]]` → `[[60_Claude/7_AI_Information/AI_CONTEXT]]` — workflow doc is the operational layer for the context manifest.
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W22.md:72:3. `[[20_Progress/Projects/Jarvis]]` → `[[40_Resources/Obsidian/Claude Pro Workflow]]` — the Jarvis project note should reflect the Claude Pro workflow as an infrastructure milestone.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\AGENTS.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls .claude .claude/skills .claude/agents .claude/rules .claude/commands 2>/dev/null; echo ---; sed -n 1,30p "30_Order/Templates/Frontmatter/For Everything.md"`
```
.claude:
GITHUB_WORKFLOW.md
README.md
agents
commands
context
rules
scheduled_tasks.lock
settings.json
settings.local.json
skills

.claude/agents:
anti-slop-editor.md
career-operator.md
daily-operator.md
human-operator.md
ingestion.md
learning-agent.md
llm-council.md
note-to-actions.md
professor.md
research-distiller.md
vault-curator.md

.claude/commands:
challenge.md
closeday.md
context.md
distill-note.md
excalidraw-diagram.md
ideas.md
ingest-clipping.md
llm-council.md
note-to-actions.md
ops.md
remove-ai-slop.md
startday.md
strategy.md
tag-month.md
trace-topic.md
transcript-to-brief.md
weekly-review.md

.claude/rules:
claude-directions.md
how-to-write.md
human-writing.md
interlinking.md
what-to-read.md

.claude/skills:
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
type: "# thought | input | evergreen | class | project | template"
status: "# seed | sprout | tree | paused | archived"
created:
updated:
area:
tags:
next:
---
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis/.claude/rules" && for f in what-to-read.md how-to-write.md claude-directions.md interlinking.md; do echo "=================== $f ($(wc -l < $f) lines)"; cat "$f"; done`
```
=================== what-to-read.md (0 lines)
=================== how-to-write.md (0 lines)
=================== claude-directions.md (0 lines)
=================== interlinking.md (0 lines)
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && pwd && wc -c .claude/rules/*.md`
```
/d/_Anant/20_Progress/Documents/Jarvis
  0 .claude/rules/claude-directions.md
  0 .claude/rules/how-to-write.md
559 .claude/rules/human-writing.md
  0 .claude/rules/interlinking.md
  0 .claude/rules/what-to-read.md
559 total
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\AGENTS.md`
```
---
type: ai
status: sprout
created: 2026-03-19
updated: 2026-10-15
tags:
  - "#ai"
  - "#evergreen"
  - "#ai-infrastructure"
related:
  - "[[CLAUDE]]"
  - "[[HUMAN_WRITING]]"
  - "[[AI_CONTEXT]]"
---
# Jarvis Agent Guide

This vault is an AI-assisted second brain built in Obsidian. Treat it as a knowledge system first and a file tree second. This file owns the write contract and the routing table. Everything else it points to owns its own job.

## Cold start

Follow the single read order in [[AI_CONTEXT]]. Do not read the full instruction stack. Load only what the task touches.

| Question | Owner |
| --- | --- |
| Why does Jarvis exist and where is it going? | [[Jarvis OS — North Star]] |
| Where does this note go? | [[40_Resources/Obsidian/Jarvis Vault Architecture]] |
| How is this note type shaped? | `30_Order/` (see the rule below) |
| What do the frontmatter properties mean? | [[40_Resources/Obsidian/Vault Operating System]] |
| How must the prose sound? | [[HUMAN_WRITING]] |
| How do I format it in Obsidian? | [[Jarvis Writing and Formatting]] |
| What is happening right now? | [[00_Dashboard]] and `Session Logs/log.md` |
| Which agent, skill, or tool do I use? | [[CLAUDE]] and `30_Order/Standards/AI Loop/` |

## The 30_Order rule

Every note written into this vault follows a Standard, a Template, and (where one exists) a Workflow from `30_Order/`. This is strict.

- Start from the matching file in `30_Order/Templates/`. Do not write frontmatter or headings that no template defines.
- Read the matching Standard in `30_Order/Standards/` for what each heading must contain.
- Follow the matching Workflow in `30_Order/Workflows/` for the process around it ([[00_Workflows Index]] lists them).
- If no template exists for the note type, do not improvise. Say so, and design the Standard, then the Template, then the Workflow, in that order ([[30_Order/00_How This Folder Works|How This Folder Works]]). Until then, write the note to `60_Claude/00_Inbox/`.

## Write Contract

Every agent follows this, regardless of which tool is driving. Full version: [[40_Resources/Obsidian/Jarvis Vault Architecture]].

### Golden rules

1. **Never create a new top-level file or folder at the vault root.** Root holds only `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`, and the numbered folders `10_Areas` through `60_Claude`. This is the single most damaging mistake an agent can make.
2. **When unsure where a note goes, write it to `60_Claude/00_Inbox/`.** Unsure is the trigger to use the Inbox, never to invent a location.
3. **Read `30_Order/` before writing.** Its Standards, Templates, and Workflows are the structural half of [[HUMAN_WRITING]].
4. **Search before creating.** Extend an existing canonical note instead of duplicating.
5. **Preserve frontmatter and wikilinks. Patch by heading.**
6. **No personal-life content in Jarvis.** Jarvis is the execution and technical workshop: course work, projects, career mechanics, business and project income. Health, personal finance, relationships, reflective or confessional journaling, and identity-as-a-person content live in The Plan (`00_Live/`). `10_Areas/Life/Truths of Life/` is the one exception, scoped narrowly to builder-identity evidence (what the work says about me as an engineer), never personal reflection.

### Where does this note go?

| If the note is | Write it to | Read first (30_Order) |
| --- | --- | --- |
| Raw clip, paste, web capture, video, imported source | `60_Claude/05_Clippings/` | [[Capture to Summary]] |
| Quick AI output you are unsure how to file | `60_Claude/00_Inbox/` | |
| Summary of one source | `60_Claude/10_Source_Summaries/` | [[Source Summary Standard]] |
| AI conversation summary | `60_Claude/07_AI_Information/AI Conversation - Summaries/` | [[Conversations]] |
| Reusable distilled knowledge (a concept, not a source) | `60_Claude/20_Distilled_Notes/`, then promote to `40_Resources/` or `10_Areas/` once stable | [[Evergreen Standard]] |
| Stable reference material (guide, cheat sheet, plugin doc, link) | `40_Resources/` + backlink to its `10_Areas/` domain | |
| Active project, internship, research, mentorship work | `20_Progress/` under the matching project | [[Project Standard]] |
| Canonical fact about a life domain | `10_Areas/`, patching by heading; no new top-level files without instruction | |
| Synthesized project brief | `60_Claude/40_Project_Briefs/` | [[Brief Standard]] |
| Map of next steps from a brief or note | next to the source note | [[Action Standard]] |
| Reusable deliverable (story, bullet, prompt) | `60_Claude/40_Project_Briefs/` with `source_concepts:` provenance (no dedicated Outputs folder exists) | |
| Daily, weekly, monthly review | `10_Areas/Life/Enumerate/` (Periodic Notes) or `60_Claude/30_Reviews/` | [[Review System]] |
| Dashboard or index | `60_Claude/44_Indexes/` | [[MOC Standard]] |
| Session log entry | append to `60_Claude/07_AI_Information/Session Logs/log.md` | [[Log Standard]] |
| New template, standard, workflow, or CLI tool | `30_Order/` (only when explicitly building one) | [[30_Order/00_How This Folder Works|How This Folder Works]] |
| Visualization for a concept, project, or source | `10_Areas/Excalidraw/` | |
| Information about the whole vault for any AI tool | `60_Claude/07_AI_Information/` | |

### Never write to

- The vault root. No new files or folders directly inside it.
- `50_Archive/`. Never read, never write.
- `60_Claude/05_Clippings/` after capture. Raw sources are read-only.
- `40_Resources/` in bulk. It is a curated hub; add one backlinked entry at a time, never a batch of AI distillations.
- `.obsidian/`, `.claude/`, `.cursor/`, `.kiro/`, `.codex`, `.git/`. Settings and tooling only, never notes.

## Working Rules

- **Codex model routing:** use the global `base` profile for bounded, routine work with explicit inputs and acceptance criteria. Use `deep` before consequential architecture, hard debugging, security or code review, cross-source synthesis, important decisions, or difficult coursework. If base work becomes cross-cutting or difficult to verify, stop and ask to continue in `deep`; do not silently change model behavior.
- **Codex output:** never use an em dash. Use complete sentences with proper grammar; do not omit words that carry meaning.
- Search before creating a note. Prefer extending an existing canonical note over making duplicates.
- Preserve frontmatter and use the vault schema fields consistently. Update `updated:` when a note changes meaningfully.
- Prefer Obsidian wikilinks for internal references.
- Use `next:` on project, plan, and active progress notes when a concrete next step exists.
- For continuity, read [[AI_CONTEXT]], `00_Dashboard.md`, and `Session Logs/log.md` before making assumptions about current state.
- Do not write AI slop. Follow [[HUMAN_WRITING]]: cut filler, prefer mechanism and contrast, use real examples from this vault, leave notes denser and more human than before.
- After meaningful vault changes, append a concise continuity entry to `60_Claude/07_AI_Information/Session Logs/log.md` ([[Memory Management]]).
- Formatting rules (blank lines, markers, frontmatter, quality gate, safety): [[Jarvis Writing and Formatting]].

## Retrieval Rules

- Prefer structured fields over ad hoc prose when the information should be queryable.
- Prefer backlinks and MOC or index notes over duplicate summaries.
- Use dashboards and indexes under `60_Claude/44_Indexes/` to find gaps before inventing new structure.
- Find the right few notes by metadata or meaning and read only those. Do not load the vault to understand the vault.

## Safety

- This vault contains local plugin configuration. Do not surface or copy secrets from plugin data files.
- Prefer env vars and ignored local config for credentials, never vault notes.

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md`
```diff
- 5. **Read `HUMAN_WRITING.md` and `30_Order/` before writing** — `HUMAN_WRITING` governs voice; `30_Order/Templates/` and `30_Order/Workflows/` govern how each note type is shaped and filed. See [[40_Resources/Obsidian/Jarvis Vault Architecture]] for where each note goes.
6. **Use `60_Claude/07_AI_Information/AI_CONTEXT.md` for continuity** — read the manifest, dashboard, and session log before assuming current project state. The wikilink `[[AI_CONTEXT]]` resolves to the same file.
7. **Use context packs, not vault dumps** — follow [[Claude Pro Workflow]]: read the manifest, dashboard, session log tail, and task-specific notes instead of scanning the whole vault.

6. **No personal-life content in Jarvis** — health, personal finance, relationships, and confessional journaling belong in The Plan (`00_Live/`), not here. `10_Areas/Life/Truths of Life/` is scoped narrowly to builder-identity evidence only. Full rule: [[AGENTS.md]] → Write Contract → Golden rules.

### Note Creation Conventions

When creating new notes, use this frontmatter template:

```yaml
---
type: evergreen      # or: input, concept, project, thought, brainstorm
status: sprout       # seed → sprout → tree (maturity)
created: YYYY-MM-DD
tags:
  - evergreen
notes:
  - "[[Related Note 1]]"
  - "[[Related Note 2]]"
next: "[[Next Action]]"  # optional
---
```

**Type guide:**
- `evergreen` — Distilled, reusable knowledge (`60_Claude/20_Distilled_Notes/`, `40_Resources/`)
- `input` — Raw captures, source summaries (`60_Claude/05_Clippings/`, `60_Claude/10_Source_Summaries/`); transcripts and briefs also use `input` — see [[Brief Standard]]
- `concept` — Course concepts, definitions (`10_Areas/UMN/`, `40_Resources/CS/`)
- `project` — Active work with outcomes (`20_Progress/`)
- `thought` / `brainstorm` — Inbox-style captures (`00_Inbox/`)
- `index` — MOC / content map for a folder (see [[MOC Standard]]) — prose Map + Status + Dataview, not a bare link list
- `action` — Link-dense map of concrete next steps derived from a brief or note (see [[Action Standard]]); statements only, no checkboxes

### Output Destinations
See the routing table in [[AGENTS.md]] → Write Contract → "Where does this note go?".

### Ingestion Workflow (05_Clippings → 60_Claude)
Use `/ingest-clipping "filename.md"`. The full step-by-step workflow lives in `.claude/skills/ingest-clipping.md`.
+ 5. **Follow `30_Order/` strictly before writing** — every note starts from a Template in `30_Order/Templates/`, is shaped by its Standard in `30_Order/Standards/`, and follows its Workflow in `30_Order/Workflows/`. No frontmatter or headings outside them. If the note type has no template, say so and design one first; see [[AGENTS.md]] → "The 30_Order rule". `HUMAN_WRITING` governs voice.
6. **Use [[AI_CONTEXT]] for continuity** — read its cold-start order, then the dashboard and session log tail, before assuming current project state.
7. **Use context packs, not vault dumps** — follow [[Claude Pro Workflow]]: read the manifest, dashboard, session log tail, and task-specific notes instead of scanning the whole vault.
8. **No personal-life content in Jarvis** — health, personal finance, relationships, and confessional journaling belong in The Plan (`00_Live/`), not here. `10_Areas/Life/Truths of Life/` is scoped narrowly to builder-identity evidence only. Full rule: [[AGENTS.md]] → Write Contract → Golden rules.

### Note Creation Conventions

Frontmatter comes from the template, never from memory. Templates live in `30_Order/Templates/` (frontmatter-only starters in `Frontmatter/`: `For Evergreen`, `For Inputs`, `For Progress`, `For Classes`, `For Thoughts`, `For Brainstorm`, `For Transcript`, `For AI`, `For Everything`). Property meanings: [[40_Resources/Obsidian/Vault Operating System]]. Note-type to folder to standard mapping: the routing table in [[AGENTS.md]].

### Which tool for which task

| Task | Use |
| --- | --- |
| Open or close the day | `/startday`, `/closeday` |
| Ingest a clipping, PDF, link, or transcript | `/ingest-clipping`, `/transcript-to-brief`, agent `ingestion` or `research-distiller` |
| Distill a note, map next steps | `/distill-note`, `/note-to-actions` |
| Fix AI-sounding prose | `/remove-ai-slop`, agent `anti-slop-editor` |
| Review a week or vault health | `/weekly-review`, `/ops health-check`, agent `vault-curator` |
| Drill a concept | agent `learning-agent` |
| Decide something with real stakes | `/llm-council`, `/challenge`, `/strategy` |

Agent and tool selection rules: [[Orchestration]] and [[Tool Calls]].

### Output Destinations
See the routing table in [[AGENTS.md]] → Write Contract → "Where does this note go?".

### Ingestion Workflow (05_Clippings → 60_Claude)
Use `/ingest-clipping "filename.md"`. The full step-by-step workflow lives in `.claude/skills/ingesting-clipping/`.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md`
```diff
- updated: 2026-05-26
+ updated: 2026-10-15
```
- `Grep` -- pattern `7_AI_Information|10_Session_Logs` path `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI`
- `Grep` -- pattern `10_Session_Logs|7_AI_Information|Session Logs` path `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Ingestion\Conversation Capture.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -nE "(^|[^0])7_AI_Information|10_Session_Logs|30_Source_Summaries|60_Indexes|45_Outputs|10_UMN" "40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md" "40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md" "40_Resources/CS/AI/Workflows/AI Workflow.md" | cut -c1-200; echo ---; find 30_Order -name "Conversation Capture.md"; `
```
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:96:60_Claude/30_Source_Summaries/AI Conversations/
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:99:Create these two folders. At the end of any significant session, ask Claude: `Summarize this session as a conversation note
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:147:- **AI agents** → `60_Claude/60_Indexes/Field OS/AI Field OS.md`
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:148:- **Trading/finance** → `60_Claude/60_Indexes/Field OS/Trading Field OS.md`
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:149:- **Systems** → `60_Claude/60_Indexes/Field OS/Systems Field OS.md`
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:150:- **Algorithms** → `60_Claude/60_Indexes/Field OS/Algorithms Field OS.md`
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:151:- **Career** → `60_Claude/60_Indexes/Field OS/Career Field OS.md`
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:212:Read the Jarvis context pack: AGENTS.md, HUMAN_WRITING.md, 60_Claude/7_AI_Information/AI_CONTEXT.md, 00_Dashboard.md, and 
40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md:262:- [ ] Create `60_Claude/05_Clippings/AI Conversations/` and `60_Claude/30_Source_Summaries/AI Conversations/`
---
30_Order/Workflows/Toolkit/Conversation Capture.md
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls 30_Order/Workflows 30_Order/Workflows/Toolkit 30_Order/Templates 30_Order/Standards && grep -nE "Session_Logs|Session Logs|7_AI" "30_Order/Workflows/Toolkit/Conversation Capture.md" | cut -c1-220`
```
30_Order/Standards:
AI Loop
Courses
Daily Workflow Standard.md
Decoration Standard.md
Editing Standard.md
Enrich
Ingestion
Internship
Log Standard.md
MOC Standard.md
Project Standard.md

30_Order/Templates:
AI Toolkit
Capability
Career
Classes
Enumerate
Frontmatter
MOC.md

30_Order/Workflows:
00_Workflows Index.md
Courses
Enrichment
Ingestion
Internship
Toolkit

30_Order/Workflows/Toolkit:
Conversation Capture.md
Files Tracking.md
Graphify Folders.md
Maintaining Logs.md
Tools Tracking.md
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git status --short | head -40; echo ---; find 30_Order/Templates/"AI Toolkit" 30_Order/Workflows/Toolkit "30_Order/Standards/AI Loop" -type f -printf "%TY-%Tm-%Td %TH:%TM  %s  %p\n" | sort; echo ---; ls -la --time-style=long-iso 30_Order/Templates/ | head -20; git log --oneline -8 -- 30_Order`
```
 M AGENTS.md
 M CLAUDE.md
---
2026-06-11 09:40  3489  30_Order/Templates/AI Toolkit/Deep Dive Template.md
2026-06-20 04:33  1924  30_Order/Templates/AI Toolkit/Clipping Distill Template.md
2026-06-24 08:15  2567  30_Order/Workflows/Toolkit/Conversation Capture.md
2026-09-26 16:03  0  30_Order/Standards/AI Loop/Conversations.md
2026-09-26 16:03  0  30_Order/Standards/AI Loop/Tool Calls.md
2026-09-26 16:03  1024  30_Order/Templates/AI Toolkit/AI Weekly Review Template.md
2026-09-26 16:04  0  30_Order/Standards/AI Loop/Knowledge Noting.md
2026-09-26 16:04  0  30_Order/Standards/AI Loop/Memory Management.md
2026-09-26 16:04  0  30_Order/Standards/AI Loop/Review System.md
2026-09-26 16:08  1306  30_Order/Templates/AI Toolkit/AI Monthly Review Template.md
2026-09-26 16:10  0  30_Order/Standards/AI Loop/Orchestration.md
2026-09-26 16:10  0  30_Order/Standards/AI Loop/Per Project Review.md
2026-10-15 17:34  0  30_Order/Standards/AI Loop/Graphify Notes.md
2026-10-15 17:35  0  30_Order/Templates/AI Toolkit/Graphify Notes.md
2026-10-15 17:35  0  30_Order/Workflows/Toolkit/Graphify Folders.md
2026-10-15 17:36  0  30_Order/Templates/AI Toolkit/AI Conversation.md
2026-10-15 17:39  0  30_Order/Workflows/Toolkit/Files Tracking.md
2026-10-15 17:39  0  30_Order/Workflows/Toolkit/Tools Tracking.md
2026-10-15 17:41  0  30_Order/Templates/AI Toolkit/Tool Logs.md
2026-10-15 17:41  0  30_Order/Templates/AI Toolkit/Write Logs.md
2026-10-15 17:42  0  30_Order/Standards/AI Loop/Logs.md
2026-10-15 17:42  0  30_Order/Workflows/Toolkit/Maintaining Logs.md
---
total 24
drwxr-xr-x 1 anant 197609   0 2026-10-15 17:35 .
drwxr-xr-x 1 anant 197609   0 2026-09-19 16:12 ..
drwxr-xr-x 1 anant 197609   0 2026-10-15 17:41 AI Toolkit
drwxr-xr-x 1 anant 197609   0 2026-10-12 11:03 Capability
drwxr-xr-x 1 anant 197609   0 2026-10-15 17:38 Career
drwxr-xr-x 1 anant 197609   0 2026-10-02 13:05 Classes
drwxr-xr-x 1 anant 197609   0 2026-10-02 00:03 Enumerate
drwxr-xr-x 1 anant 197609   0 2026-10-15 17:37 Frontmatter
-rw-r--r-- 1 anant 197609 818 2026-09-08 15:36 MOC.md
118a66df Auto-sync: 2026-10-15 18:03,  36 files changed, 938 insertions(+), 44 deletions(-)
6928ed84 Auto-sync: 2026-10-14 23:20,  3 files changed, 46 insertions(+), 10 deletions(-)
574257b7 Preserve current vault work and sync repairs before approved history reconciliation
953c2a6c Auto-sync: 2026-10-12 10:48,  31 files changed, 120 insertions(+), 51 deletions(-)
b20ccbb0 Auto-sync: 2026-10-11 06:33,  10 files changed, 836 insertions(+), 1 deletion(-)
5ae60a53 Auto-sync: 2026-10-11 06:03,  1 file changed, 0 insertions(+), 0 deletions(-)
c8b4e0ea Auto-sync: 2026-10-10 15:48,  7 files changed, 2482 insertions(+), 1367 deletions(-)
aaf56a08 Auto-sync: 2026-10-09 23:48,  7 files changed, 14 insertions(+), 1529 deletions(-)
```
- `Grep` -- pattern `How to Use Claude/Claude OS|\[\[Claude OS(\||\]\])` path `D:\_Anant\20_Progress\Documents\Jarvis`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && mv "60_Claude/07_AI_Information/How to Use Claude/Claude OS.md" "20_Progress/AI/Claude OS.md" && ls "20_Progress/AI" "60_Claude/07_AI_Information/How to Use Claude" && for f in .claude/agents/*.md; do echo "== $f"; sed -n 1,12p "$f" | grep -E "^(name|tools|model):" ; done`
```
20_Progress/AI:
Claude Code
Claude OS Dashboard.canvas
Claude OS Dashboard.md
Claude OS.md
Codex
Cursor
Google Skills + AI Pro.md
Kiro

60_Claude/07_AI_Information/How to Use Claude:
Agent Operating Guide.md
What Graphify Does.md
== .claude/agents/anti-slop-editor.md
name: anti-slop-editor
tools:
== .claude/agents/career-operator.md
name: career-operator
tools:
== .claude/agents/daily-operator.md
name: daily-operator
tools:
== .claude/agents/human-operator.md
name: human-operator
tools:
== .claude/agents/ingestion.md
name: ingestion
tools:
== .claude/agents/learning-agent.md
name: learning-agent
== .claude/agents/llm-council.md
name: llm-council
tools:
== .claude/agents/note-to-actions.md
name: note-to-actions
tools:
model: claude-sonnet-5
== .claude/agents/professor.md
name: professor
tools:
== .claude/agents/research-distiller.md
name: research-distiller
tools:
== .claude/agents/vault-curator.md
name: vault-curator
tools:
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\AI\Claude OS.md`
```diff
- ### Agents (5 — all with name/description/tools/model frontmatter as of 2026-07-03)

| Agent | Trigger | Tools beyond Read/Glob/Grep/Edit/Write |
|-------|---------|-----------------------------------------|
| research-distiller | Deep ingestion: PDFs, web, transcripts, GitHub repos | Bash, WebFetch |
| anti-slop-editor | De-slopping any note per HUMAN_WRITING | — |
| vault-curator | Vault-wide health: links, duplicates, frontmatter, Write Contract | — |
| learning-agent | Overdue drills, enrichment, spaced repetition | — |
| career-operator | Internship/resume/portfolio/mentorship briefs | — |
+ ### Agents (11)

The current roster, triggers, and tool allowlists live in one place: [[Orchestration]]. The 2026-07-03 version of this note listed only 5 agents; the folder `.claude/agents/` now holds 11.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\AI\Claude OS.md`
```diff
- # Claude OS — Agentic Setup Registry

All skills,
+ # Claude OS — Agentic Setup Registry

> [!WARNING]
> Written 2026-07-03 and moved here from `07_AI_Information/How to Use Claude/` on 2026-10-15, because it is a tooling registry, not vault orientation. The agent roster was corrected on 2026-10-15. Skill, hook, and MCP counts below were not re-verified. Check them against `.claude/` before trusting a number.

All skills,
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's/^updated: 2026-07-03$/updated: 2026-10-15/' "20_Progress/AI/Claude OS.md" && sed -n 1,16p "20_Progress/AI/Claude OS.md"`
```
---
type: dashboard
status: sprout
created: 2026-07-03
updated: 2026-10-15
tags:
  - claude-os
  - ai-infrastructure
  - dashboard
notes:
  - "[[Jarvis OS — North Star]]"
  - "[[AI_CONTEXT]]"
next: "Act on the High rows of the marketplace evaluation; adopt /emerge and /challenge from second-brain-claudekit"
---
# Claude OS — Agentic Setup Registry
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI\Workflows\AI Workflow.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI\Token Optimization\Claude Optimization Master Setup.md`
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI\Workflows\AI Workflow.md`
```diff
- # AI Workflow Implementation Plan
Based on your
+ # AI Workflow Implementation Plan
> [!WARNING]
> Superseded. This is a March 2026 ChatGPT-era plan and its tool hierarchy and budget no longer apply. Current guidance: [[Claude Pro Workflow]] for Claude usage and [[Jarvis OS — North Star]] for the system. Do not read this on a cold start. Archiving it is the owner's call.

Based on your
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI\Token Optimization\Claude Optimization Master Setup.md`
```diff
- > Full vault audit + external link analysis done 2026-05-28 via Cowork session. This note replaces scattered AI Workflow docs as the canonical Claude setup guide.
+ > [!WARNING]
> Dated snapshot from 2026-05-28, not a standing instruction. It no longer claims to be the canonical Claude setup guide: living guidance is in [[Claude Pro Workflow]], [[Orchestration]], and [[Jarvis OS — North Star]]. Several checklist items below may already be done or dropped. Folder names in this note were corrected to the current tree on 2026-10-15.

Full vault audit and external link analysis done 2026-05-28 via a Cowork session.
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && f="40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md" && sed -i -e 's#60_Claude/7_AI_Information#60_Claude/07_AI_Information#g' -e 's#60_Claude/10_Session_Logs/log.md#60_Claude/07_AI_Information/Session Logs/log.md#g' -e 's#60_Claude/30_Source_Summaries#60_Claude/10_Source_Summaries#g' -e 's#60_Claude/60_Indexes#60_Claude/44_Indexes#g' "$f" && grep -nE "(^|[^0])7_AI_Information|10_Session_Logs|30_Source_Summaries|60_Indexes" "$f" | head; sed -i 's/^updated: 2026-05-28$/updated: 2026-10-15/' "$f"; echo done`
```
102:Create these two folders. At the end of any significant session, ask Claude: `Summarize this session as a conversation note. Include: decisions made, things tried, open questions, related notes.` Save output to `30_Source_Summaries/AI Conversations/YYYY-MM-DD-topic.md`.
done
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's#`30_Source_Summaries/AI Conversations/#`10_Source_Summaries/AI Conversations/#' "40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md" && find 30_Order -type f -size 0 | sort; echo ---; ls "20_Progress/Projects/AI Use" "20_Progress/Projects/AI Use/Claude Kit" "60_Claude/30_Reviews/AI" "60_Claude/30_Reviews/AI/Toolkit" 2>&1 | head -40`
```
30_Order/Standards/AI Loop/Conversations.md
30_Order/Standards/AI Loop/Graphify Notes.md
30_Order/Standards/AI Loop/Knowledge Noting.md
30_Order/Standards/AI Loop/Logs.md
30_Order/Standards/AI Loop/Memory Management.md
30_Order/Standards/AI Loop/Orchestration.md
30_Order/Standards/AI Loop/Per Project Review.md
30_Order/Standards/AI Loop/Review System.md
30_Order/Standards/AI Loop/Tool Calls.md
30_Order/Standards/Decoration Standard.md
30_Order/Standards/Editing Standard.md
30_Order/Standards/Enrich/Human Writing Standard.md
30_Order/Standards/Enrich/Plugins Usage Standard.md
30_Order/Standards/Enrich/Resources.md
30_Order/Templates/AI Toolkit/AI Conversation.md
30_Order/Templates/AI Toolkit/Graphify Notes.md
30_Order/Templates/AI Toolkit/Tool Logs.md
30_Order/Templates/AI Toolkit/Write Logs.md
30_Order/Templates/Career/Tracking.md
30_Order/Templates/Frontmatter/For Dashboards.md
30_Order/Workflows/Enrichment/Decoration.md
30_Order/Workflows/Enrichment/Human Content Writer.md
30_Order/Workflows/Enrichment/Plugins Usage.md
30_Order/Workflows/Enrichment/Researcher.md
30_Order/Workflows/Ingestion/Conversations Loop.md
30_Order/Workflows/Toolkit/Files Tracking.md
30_Order/Workflows/Toolkit/Graphify Folders.md
30_Order/Workflows/Toolkit/Maintaining Logs.md
30_Order/Workflows/Toolkit/Tools Tracking.md
---
20_Progress/Projects/AI Use:
Builds & Resources
Claude Kit
Cursor AI.md
Gen AI
Jan.md
Ollama.md
The AI Hub.md

20_Progress/Projects/AI Use/Claude Kit:
Build Map.md
Claude Code
Log.md
Overview.md
Source of Truth
Tool Map.md
Toolkit

60_Claude/30_Reviews/AI:
Scheduled
Toolkit

60_Claude/30_Reviews/AI/Toolkit:
Tool log.md
```
- `Agent` -- `{"subagent_type":"fork","name":"toolkit-research","description":"Ground Toolkit/Graphify/Logs/Tracking standards","prompt":"You are the fork. READ-ONLY research task: do not write or edit any file. Ground these empty 30_Order scaffolds in what the vault actually already practices, so I can write them from real material. Empty files: Standards/AI Loop/{Graphify Notes, Logs}.md; Templates/AI Toolkit/{Graphify Notes, Tool Logs, Write Logs, AI Conversation}.md; Workflows/Toolkit/{Graphify Folders, Files Tracking, Tools Tracking, Maintaining Logs}.md; Workflows/Ingestion/Conversations Loop.md. Existing non-empty neighbors: Standards/Log Standard.md, Workflows/Toolkit/Conversation Capture.md, Templates/AI Toolkit/{AI Weekly Review Template, AI Monthly Review Template, Clipping Distill Template, Deep Dive Template}.md.\n\nRead (real content, quote exact frontmatter and headings): \n1. 20_Progress/Projects/AI Use/Claude Kit/ : Overview.md, Build Map.md, Log.md (head + a few entries), Tool Map.md, and list + skim the Source of Truth/ and Toolkit/ and Claude Code/ subfolders.\n2. 60_Claude/30_Reviews/AI/Toolkit/Tool log.md (head + row format).\n3. 20_Progress/AI/Claude Code/ : Write Log.md (retired), _All-Projects-Sync-Log.md (head + entry format), and what else lives there that is a tracked file or folder set.\n4. Graphify: 40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow.md, 60_Claude/07_AI_Information/How to Use Claude/What Graphify Does.md, and find any graphify output folders/notes in the vault (Glob/Grep for \"graphify\", \"graph.json\", \"GRAPH_REPORT\"). What is a \"Graphify folder\" and what notes does it produce?\n5. Workflows/Toolkit/Conversation Capture.md in full and 60_Claude/07_AI_Information/AI Conversation - Summaries/README.md in full (exact required frontmatter, headings, filename pattern).\n6. Any note anywhere that talks about \"files tracking\" / tracking which files or mirrors exist (sync manifests, mirror lists, MANIFEST) in the Toolkit/Claude Kit/Claude Code area.\n\nReport in under 1100 words, per scaffold: (a) what real practice already exists (file paths, exact frontmatter fields, exact headings, entry formats), (b) what it must NOT duplicate (cite existing file), (c) a proposed one-sentence scope, (d) whether it is a Standard/Template/Workflow in the Standard-\u003eTemplate-\u003eWorkflow triplet and which sibling files it pairs with. Flag contradictions between existing docs. Use no em dashes."}`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Tool Calls.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Orchestration]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[Jarvis Writing and Formatting]]"
  - "[[AGENTS]]"
---
# Tool Calls
==Pick the narrowest tool that does the job, and never open a file only to confirm a secret is there.==
This is the behavior standard for which tool an agent reaches for when it reads, searches, or writes in this vault. It governs a different question than [[Orchestration]]: Tool Calls decides the single call, Orchestration decides when to hand a whole task to a subagent or skill. This section used to live in `Vault Rules — Operational Reference.md`; it moved here on 2026-10-15 so there is one copy.
## Reading files
| Situation | Tool |
|---|---|
| Any text file or Markdown note | `Read` |
| PDF file | Python pypdf via `Bash` |
| Image file | `Read` (multimodal) |
| Live URL | `WebFetch` |
| Search file contents | `Grep` |
| Find files by pattern | `Glob` |
| Directory listing | `Bash` (ls) |
## Writing files
| Situation | Tool |
|---|---|
| Patching an existing file by heading | `Edit` (patch only, do not rewrite) |
| Creating a new file | `Write` |
| Full rewrite of an existing file | `Read` first, then `Write` |
## MCP and filesystem tools
Prefer `Read`, `Edit`, `Write`, `Grep`, `Glob` over `mcp__filesystem__*` equivalents. Use MCP filesystem tools only when the core tools cannot perform the operation. Use the `obsidian-cli` skill when the task needs Obsidian's running state (the open note, backlinks, typed properties, Bases queries), not for ordinary file work.
> [!WARNING]
> Reading a plugin `data.json`, `.env*`, credentials file, or `.mcp.json` to "check it looks right". Existence checks and actions that consume the value without printing it are allowed. Reading the value back is not, on any tool, for any reason. See the Safety section of [[AGENTS]].
## When one call is not enough
If the job needs three or more searches, or reading many notes you will not reference again, stop calling tools one by one and delegate it: see the spawn threshold in [[Orchestration]].
## Done Conditions
- Every write to an existing file was a patch by heading, or was preceded by a `Read` in the same session.
- No search was done with `Bash` when `Grep` or `Glob` fits.
- No secret-bearing file was opened to show its contents.
## Gold Standard Example
None yet. This Standard is a relocation of rules that were already in use, and no session has been reviewed against it. When a review ([[Review System]]) finds a session that handled a hard case well, name it here.

```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Rules — Complete AI Ruleset.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Rules — Complete AI Ruleset.md`
```
---
type: evergreen
status: tree
created: 2026-05-31
updated: 2026-10-15
tags:
  - system
  - ai-agents
  - rules
notes:
  - "[[AI_CONTEXT]]"
  - "[[Tool Calls]]"
  - "[[Orchestration]]"
  - "[[Memory Management]]"
---
# Vault Rules (redirect)

This file's content has been merged into the Standards in `30_Order/Standards/AI Loop/`. Read those directly:

- **Tool selection** (reading, writing, MCP) is in [[Tool Calls]].
- **When to spawn a subagent** is in [[Orchestration]].
- **Session end protocol and log entry format** is in [[Memory Management]].
- **Formatting spec** is in [[Jarvis Writing and Formatting]].
- **Placement rules** are in [[40_Resources/Obsidian/Jarvis Vault Architecture]].
- **Cold-start read order** is in [[AI_CONTEXT]].

No unique content remains here. It exists only to keep inbound wikilinks working.

```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\.claude\agents\anti-slop-editor.md`
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Orchestration.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Tool Calls]]"
  - "[[Memory Management]]"
  - "[[Jarvis OS — North Star]]"
  - "[[CLAUDE]]"
---
# Orchestration
==Read wide in a subagent, decide in the main window: the agent returns the conclusion, not the transcript.==
This is the behavior standard for when a task goes to a subagent, a skill, or stays inline, and how a subagent file is shaped. It governs a different question than [[Tool Calls]]: Tool Calls picks the single tool for one step, Orchestration picks who runs the whole task. Plugin choice (Dataview, Tasks, Kanban) is a third question and lives in the Workflow Chooser of [[AI_CONTEXT]].
## Spawn threshold
Spawn a subagent when a side task would flood the main conversation with reading you will not reference again: a search that must open twenty notes to find three, a full-source ingestion, a link audit. Keep it inline when one or two tool calls finish the job.
- Use `Explore` to find files when the path is unknown and the search needs three or more queries.
- Use `research-distiller` for long PDFs that need section-by-section extraction.
- Use `fork` when the work needs the context already in the conversation.
- A subagent starts cold. Brief it with the goal, what is already ruled out, and the exact paths to read.
## Skill, agent, or inline
- **Skill (a `/command`):** a repeatable procedure with a fixed checklist, run in the main window. Examples: `/startday`, `/closeday`, `/ingest-clipping`, `/weekly-review`.
- **Agent:** isolated context for heavy reading or a distinct role. Examples below.
- **Inline:** everything else.
## Agent file shape
Each agent is `.claude/agents/<name>.md` with frontmatter `name`, `description`, `tools`, and `model`. The description is third person and says when to use it: "Use proactively for... MUST BE USED for...". The `tools` list holds only what the role needs, so a read-only role cannot write.
## Roster
| Agent | Use for | Tools |
|---|---|---|
| `ingestion` | any new source: YouTube, transcript, clipping, PDF | Read, Write, WebFetch, Bash |
| `research-distiller` | deep multi-source or long-PDF distillation | Read, Glob, Grep, Edit, Write, Bash, WebFetch |
| `human-operator` | default writer for new vault prose | Read, Write, Edit |
| `anti-slop-editor` | rewriting AI-sounding notes | Read, Glob, Grep, Edit, Write |
| `note-to-actions` | turning a note into an action map | Read, Write |
| `learning-agent` | drills, spaced repetition, learning from the vault only | Read, Glob, Grep, Edit, Write |
| `professor` | coordinating coursework skills | Read, Grep, Glob, Edit |
| `daily-operator` | dashboard, plans, rollover, deadlines | Read, Grep, Glob, Edit |
| `career-operator` | applications, resume, portfolio briefs | Read, Glob, Grep, Edit, Write |
| `vault-curator` | links, orphans, duplicates, Write Contract checks | Read, Glob, Grep, Edit, Write |
| `llm-council` | high-stakes decisions needing five advisors | Read, Grep, Glob |
Counts and tool lists drift. The folder `.claude/agents/` is the truth; fix this table when it disagrees.
> [!WARNING]
> Treating a subagent's report as fact. A report describes what the agent intended to do. On 2026-10-15 a survey agent returned a "will report back" line with zero tool uses recorded. Check tool-use counts, and read the files that carry the conclusion before acting on it.
> [!WARNING]
> Spawning an agent for a one- or two-call task. The briefing costs more than the work.
## Done Conditions
- Wide reading happened in a subagent, and only its conclusion entered the main window.
- Every agent used appears in the roster, and its file follows the shape above.
- Anything an agent reported that changes the vault was checked against the files before it was written.
## Gold Standard Example
`.claude/agents/anti-slop-editor.md`: one role, a trigger sentence, a minimal tool list, and a short rule list the agent can follow without asking.

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && tail -n 6 "60_Claude/07_AI_Information/Session Logs/log.md" | cut -c1-400; echo; grep -nE "^## \[" "60_Claude/07_AI_Information/Session Logs/log.md" | tail -3; grep -cE "^## \[" "60_Claude/07_AI_Information/Session Logs/log.md"; wc -l "60_Claude/07_AI_Information/Session Logs/log.md"; sed -n 1,14p "40_Resources/CS/AI/CPR - Compress Preserve Resume.md"`
```
2026-10-15 - Acer visit: ran Build 5b and the Build 2 SSH items on gupta-builds. Golden WSL configs applied (changed=13 same=21 fails=0), tmux 3.8, pnpm 12.4.2 and the rest of the toolkit upgraded with checksums, `.bashrc` hooks guarded, and the Acer's weekly clean fixed because it deleted the Corepack pin in ~/.cache/node. Old 36 MB swap.vhdx moved to D:\Backup\Quarantine. Tailscale SSH checks pa

2026-10-15 - Acer visit follow-up: user installed socat and ran Windows toolkit Part 1; the session ran Part 3 (99-verify 0 FAIL, Acer catalog written), promoted the Acer's real bat and fd configs into the shared toolkit source, narrowed ~/.mcp.env to wrapper functions for the AI CLIs (verified with a clean env -i shell and claude mcp list), wrote and dry-ran 70-acer-wsl-update.ps1, audited packag

2026-10-15 - Closed the last Build 2 Acer item: the Dell's Tailscale SSH host key fingerprint matches the key the Acer accepted (SHA256:[REDACTED]); read on the Dell with a new script because ssh-keygen cannot parse Tailscale's PKCS8 key file. Only the Acer WSL platform update script and the user decisions remain.

1677:## [2026-09-21] write | WSL session and Jarvis MCP build prompt
1685:## [2026-10-02] write | Cross-Laptop Sync Build 9 - root-caused the CSCI 4061 conflict incident, closed the "no one sees the warning" gap
1695:## [2026-10-02] write | Cross-Laptop Sync Build 9 addendum - full workflow audit, cadence change, gitignore fix, autonomy reality-check
126
1782 60_Claude/07_AI_Information/Session Logs/log.md
---
type: evergreen
status: sprout
created: 2026-09-05
updated: 2026-09-05
tags: [evergreen, ai, tooling, second-brain-claudekit]
notes:
  - "[[40_Resources/CS/Repos]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"
---
# CPR — Compress, Preserve, Resume (EliaAlberti)

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Important, non-obvious state: **`/compress`, `/preserve`, `/resume` are NOT currently live slash commands in `second-brain-claudekit` at all** — the old hand-authored trio was archived, the new blended trio was never promoted. Don't assume `second-brain-claudekit/CLAUDE.md`'s "Session Memory (CPR Pattern)" section describes a working command today without checking `.claude/commands/` directly.
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Memory Management.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Log Standard]]"
  - "[[AI_CONTEXT]]"
  - "[[Orchestration]]"
  - "[[CPR - Compress Preserve Resume]]"
---
# Memory Management
==Whatever is not written to the session log, a `next:` field, or the dashboard before a session ends is gone at the next context reset.==
This is the behavior standard for what an agent must persist, where, and when, so the next session starts from fact and not from guesses. It governs a different question than [[Log Standard]]: Log Standard says when a log file earns its existence and how its entries are formed, this Standard says what a session owes the logs it writes to. The ownership of each log file is a Log Standard question.
## What must survive a reset
- **Decisions and why:** goes in the session log entry.
- **Files created or changed:** goes in the session log entry, as wikilinks.
- **What was verified, not assumed:** goes in the session log entry, marked as verified.
- **Open questions:** goes in the log entry, and in the note's `Open Questions` heading if it has one.
- **The next concrete action:** goes in the project or plan note's `next:` field, so the dashboard can surface it.
- **Changes to focus or priorities:** go in `00_Dashboard.md` or the relevant board, not in the log alone.
Transient status never goes in [[AI_CONTEXT]]. The dashboard and the session log are the live continuity layer.
## Session end protocol
1. Append one entry to `60_Claude/07_AI_Information/Session Logs/log.md`. Newest entries go at the bottom of the file.
2. Update `updated:` on every note that changed meaningfully. Do not touch dashboards just to create activity.
3. Set or refresh `next:` on any project or plan note whose next step changed.
4. Run `/closeday` if it is the end of the working day.
Skip the entry for a session that changed nothing. A log with filler entries is a log nobody reads.
## Entry format
Heading `## [YYYY-MM-DD] tag | title` on one line, then four bullets: what was created or changed, why it matters, open questions, next action if one exists. Entries are append-only. A correction is a new dated entry that names the one it corrects.
> [!WARNING]
> Format drift. The log holds 126 entries in the heading form and, since October 2026, entries written as `2026-10-15 - one long paragraph`. The paragraphs are hard to scan and invisible to heading search. Old entries stay as written. New entries use the heading form.
## Compressing a long session
The CPR pattern (compress a long session into a structured summary, preserve it to a topic-named file, resume by searching it) fits one real problem: a session too long to carry in the window. Adopt the idea narrowly. Write the durable facts to the log and the notes before compacting, and let the window forget the rest. Do not treat `/compress`, `/preserve`, `/resume` as working commands: [[CPR - Compress Preserve Resume]] records that they are not live in `second-brain-claudekit` today. Check `.claude/commands/` before relying on them.
## Derived memory
The `jarvis-memory` index (`30_Order/System/jarvis-memory/`) is derived state built from the notes. It can be deleted and rebuilt without loss. It is a retrieval aid, never the record. Raw conversation text stays in `60_Claude/05_Clippings/AI Conversations/`, and the summary lives under [[Conversations]].
> [!WARNING]
> Logging a claim from another agent or tool as if it were checked. Write what you opened and confirmed. If a result came from a subagent and was not verified, say so in the entry.
## Done Conditions
- The session log has one heading-form entry for the session, or the session changed nothing.
- Every project or plan note touched has a current `next:`.
- Every open question is written somewhere findable, not left in the conversation.
- Nothing transient was added to `AI_CONTEXT.md`.
## Gold Standard Example
None yet reviewed against this Standard. A candidate is the `[2026-10-02] write | Cross-Laptop Sync Build 9` entry in `Session Logs/log.md`, which names a root cause and a changed cadence. Confirm it against these Done Conditions before treating it as the example.

```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Conversation Capture.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI Conversation - Summaries\README.md`
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis/60_Claude/07_AI_Information/AI Conversation - Summaries" && f="Claude Code/2026-08-19-claude-code-second-brain-claudekit-jarvis-notes-sync — Summary.md" && sed -n 1,30p "$f" | cut -c1-200; grep -n "^## " "$f"; echo ====; sed -n 1,20p "2026-07-05-cursor-mcp-failure-resolution-plan — Summary.md" | cut -c1-160`
```
---
type: input
input_kind: ai-conversation-summary
status: sprout
created: 2026-08-20
source_app: claude-code
source_os: windows
source_note: "[[08-19 Second-brain-claudekit Jarvis notes sync]]"
project: Jarvis
decision_count: 7
action_count: 5
tools_used:
  Bash: 34
  Edit: 21
  Read: 23
  Write: 2
tokens_total: 33700519
cost_usd: 19.671298
tags:
  - input
  - ai-conversation-summary
notes:
  - "[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Log]]"
  - "[[10_Areas/AI/Setup/Folder Map]]"
---

# Conversation Summary — Second-brain-claudekit Jarvis Notes Sync

## What Was Decided
30:## What Was Decided
39:## What Changed
42:## Tool Use Detail
45:## Important Context
48:## Source Claims (Quoted From Transcript)
52:## Inferred Claims (Distiller Interpretation)
55:## Open Questions
58:## Follow-Up Actions
61:## Related Notes
64:## Should Be Promoted?
====
---
type: input
input_kind: ai-conversation-summary
status: sprout
created: 2026-07-05
source_app: cursor
source_note: "[[60_Claude/05_Clippings/AI Conversations/WSL/Cursor/07-05 Cursor - MCP failure resolution plan.md]]"
project: CausalOps
decision_count: 3
action_count: 2
tags:
  - input
  - ai-conversation-summary
notes: []
---

# Conversation Summary — MCP failure resolution plan

## What Was Decided
- Root cause of jarvis/the-plan MCP failures on WSL: Streamable HTTP SSE session conflict (HTTP 409) after ~15 min idle, not wrong ports or API keys.
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && cat "30_Order/Templates/AI Toolkit/AI Weekly Review Template.md"; echo =====; sed -n 1,25p "30_Order/Templates/Frontmatter/For Inputs.md"`
```
---
type: evergreen
status: tree
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - evergreen
  - review
  - template
  - claude-kit
---
# AI Tools Weekly Review — <% tp.date.now("YYYY") %>-W<% tp.date.now("ww") %>
## Period Covered
<% tp.date.now("YYYY-MM-DD", -6) %> through <% tp.date.now("YYYY-MM-DD") %>
## Sources Reviewed
- [ ] [[60_Claude/30_Reviews/AI/Toolkit/Tool log|Tool log]]
- [ ] [[20_Progress/AI/Claude Code/_All-Projects-Sync-Log|_All-Projects-Sync-Log]]
- [ ] [[20_Progress/Projects/AI Use/Claude Kit/Log|Claude Kit/Log]]
- [ ] Raw `AI Conversations/` session notes (only if the Tool log flags something)
## What Ran This Period
| Skill/Command | Uses | Notes |
|---|---|---|
## Sync & Capture Health
- Sync runs this period: OK ___ / failed ___ / skipped ___
- Sessions captured vs. real sessions run (spot-check): ___
## Findings
-
## Decided Fixes
_Only items with 100% clarity — see [[Review Standard]]._
-
## Open Questions
-
## Next Period's Watch List
-
=====
---
type: input
input_kind:
status:
created:
source_url:
related_progress: []
tags:
  - input
next:
---
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\AI Toolkit\AI Conversation.md`
```
---
type: input
input_kind: ai-conversation-summary
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
source_app: # claude-code | claude-web | codex | cursor | kiro | chatgpt | ollama | other
source_note: "[[60_Claude/05_Clippings/AI Conversations/<raw file>]]"
project:
decision_count: 0
action_count: 0
tags:
  - input
  - ai-conversation-summary
notes: []
---
# Conversation Summary: <title>
## What Was Decided
-
## What Changed
-
## Important Context
-
## Source Claims (Quoted From Transcript)
-
## Inferred Claims (Distiller Interpretation)
-
## Open Questions
-
## Follow-Up Actions
- [ ]
## Related Notes
- [[]]
## Should Be Promoted?
- decision: yes | no | partial. Say what moves where.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Conversations.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[AI Conversation]]"
  - "[[Conversation Capture]]"
  - "[[Brief Standard]]"
  - "[[Memory Management]]"
---
# Conversations
==A conversation summary keeps the decisions and drops the back-and-forth: it exists so the next AI does not start from zero.==
This is the content standard for summaries of conversations with an AI tool (Claude Code, Claude web, Codex, Cursor, Kiro, ChatGPT, a local model). It governs a different subject than [[Brief Standard]], which covers transcripts of people talking (meetings, calls, videos). Do not use one for the other's job. The raw transcript is never rewritten; this Standard covers only the summary.
## Maps To
- Template: [[AI Conversation]]
## Used By Workflow
- [[Conversation Capture]]. Raw transcript to `60_Claude/05_Clippings/AI Conversations/`, summary to `60_Claude/07_AI_Information/AI Conversation - Summaries/`, then selective promotion.
## Where the summary lives and what it is called
Real summaries already live in `AI Conversation - Summaries/`, not in `10_Source_Summaries/`. One summary per raw conversation, and only for a conversation that produced a decision or context worth keeping. Filename: `YYYY-MM-DD-{source-app}-{slugified-title} — Summary.md`.
## Frontmatter
Set by the [[AI Conversation]] template: `type: input`, `input_kind: ai-conversation-summary`, `status`, `created`, `source_app`, `source_note` (wikilink to the raw file), `project`, `decision_count`, `action_count`, `tags`, `notes`.
Claude Code summaries may also carry `source_os`, `tools_used` (counts per tool), `tokens_total`, and `cost_usd`. Real notes already use them, so they are official, and they stay optional. Other tools omit them.
## Per-Heading Standard
### What Was Decided
Each decision in one line, with the reason. This section sets `decision_count`.
*Density:* short. A summary with no decisions is not worth keeping; do not write it.
### What Changed
Files, configs, or notes that now differ, as wikilinks or paths. For Claude Code, a `## Tool Use Detail` section may follow when tool use matters to the conclusion.
### Important Context
Only what a reader needs to understand the decisions: constraints, what was ruled out and why.
### Source Claims (Quoted From Transcript)
What the transcript states, quoted or tightly paraphrased.
### Inferred Claims (Distiller Interpretation)
What you concluded that the transcript did not say.
> [!WARNING]
> Moving an inference into Source Claims because it sounds certain. If the transcript did not say it, it belongs under Inferred Claims.
### Open Questions
What was left unresolved. Carries forward until answered.
### Follow-Up Actions
Task-formatted next steps. This section sets `action_count`.
### Related Notes
Wikilinks to the project, concepts, and logs the conversation touched.
### Should Be Promoted?
`decision: yes | no | partial`, naming what moves where: a decision to a project `next:`, a new understanding to a distilled note. The transcript itself is never promoted.
## Done Conditions
- The raw transcript is archived and untouched, and `source_note` links to it.
- `decision_count` and `action_count` match the lists.
- Source Claims and Inferred Claims are separated.
- A one-line entry was appended to the session log ([[Memory Management]]).
- No `---` in the body, and zero blank lines except after a callout.
## Gold Standard Example
`60_Claude/07_AI_Information/AI Conversation - Summaries/Claude Code/[REDACTED] — Summary.md`: full frontmatter including tool counts and cost, and every heading filled. Note that it adds `## Tool Use Detail`, which this Standard now allows for Claude Code summaries.

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Conversation Capture.md`
```diff
- **Moves:** raw transcript → `60_Claude/05_Clippings/AI Conversations/` → summary in `60_Claude/10_Source_Summaries/` (and, once built, the `jarvis-memory` registry under `30_Order/System/`)

## The three layers

Raw conversation is not knowledge yet. Store it in three layers and only promote the durable parts:

1. **Raw archive** — the transcript, untouched, in `05_Clippings/AI Conversations/`.
2. **Summary** — a short distillation in `10_Source_Summaries/`, using the structure below.
3. **Promotion** — only durable decisions become concept notes, project updates, outputs, or `next:` actions. The transcript itself never becomes a durable note.

## Summary structure

```markdown
## What Was Decided
## What Changed
## Important Context
## Source Claims
## Inferred Claims
## Open Questions
## Follow-Up Actions
## Related Notes
## Should Be Promoted?
```

## Steps

1. Save the raw transcript to `05_Clippings/AI Conversations/`. Do not edit it.
2. Write the summary in `10_Source_Summaries/` using the structure above. Keep it short — the value is the decisions, not the back-and-forth.
+ **Moves:** raw transcript → `60_Claude/05_Clippings/AI Conversations/` → summary in `60_Claude/07_AI_Information/AI Conversation - Summaries/` (and the `jarvis-memory` registry under `30_Order/System/` indexes both).

**Serves Standard:** [[Conversations]]. **Template:** [[AI Conversation]].

## The three layers

Raw conversation is not knowledge yet. Store it in three layers and only promote the durable parts:

1. **Raw archive** — the transcript, untouched, in `05_Clippings/AI Conversations/`.
2. **Summary** — a short distillation in `AI Conversation - Summaries/`, shaped by the [[AI Conversation]] template and the [[Conversations]] Standard.
3. **Promotion** — only durable decisions become concept notes, project updates, outputs, or `next:` actions. The transcript itself never becomes a durable note.

## Steps

1. Save the raw transcript to `05_Clippings/AI Conversations/`. Do not edit it.
2. Write the summary in `AI Conversation - Summaries/` from the [[AI Conversation]] template. Keep it short: the value is the decisions, not the back-and-forth.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Conversation Capture.md`
```diff
- ## Frontmatter to set (on the summary)

```yaml
type: input
status: sprout
source_app: <claude-code|codex|cursor|kiro|chatgpt|claude-web|ollama|other>
source_status: mixed
```

## Done when
+ ## Frontmatter

Comes from the [[AI Conversation]] template. Do not write it from memory.

## Done when
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's/^updated: 2026-05-31$/updated: 2026-10-15/' "30_Order/Workflows/Toolkit/Conversation Capture.md" && git diff --stat -- "30_Order/Workflows/Toolkit/Conversation Capture.md" | tail -1`
```
 1 file changed, 8 insertions(+), 25 deletions(-)
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI Conversation - Summaries\README.md`
```
---
type: dashboard
status: tree
created: 2026-05-29
updated: 2026-10-15
tags:
  - source-summaries
  - ai-conversations
  - readme
notes:
  - "[[Conversations]]"
  - "[[AI Conversation]]"
  - "[[Conversation Capture]]"
  - "[[60_Claude/05_Clippings/AI Conversations/README]]"
---

# AI Conversations: Distilled Summaries

Distilled summaries of AI conversations. Raw transcripts live in `60_Claude/05_Clippings/AI Conversations/`.

The spec that used to be written here now lives in `30_Order`, so there is one copy:

- **Content standard, filename pattern, and frontmatter fields:** [[Conversations]]
- **Template to start from:** [[AI Conversation]]
- **The capture process:** [[Conversation Capture]]

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -n 1,40p "30_Order/Standards/Enrich/Source Summary Standard.md" | cut -c1-260; echo =====; sed -n 1,30p "30_Order/Standards/Enrich/Evergreen Standard.md" | cut -c1-260; echo ====; sed -n 1,25p "30_Order/Standards/Internship/Internship Loop Review Standard.md" | cut -c1-300`
```
---
type: evergreen
status: sprout
created: 2026-06-01
updated: 2026-06-01
tags:
  - system
  - standards
notes:
  - "[[Clipping Distill Template]]"
  - "[[Capture to Summary]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[HUMAN_WRITING]]"
---
# Source Summary Standard
==A source summary captures one source so completely that reopening the original reveals nothing new — it replaces the source, it does not advertise it.==
This is the content standard for any `input` note created from a single source (PDF, web page, video, image, AI conversation). It says what belongs under each heading, how dense each section should be, which plugin syntax applies, and what each section looks l
## Maps To
- Template: [[Clipping Distill Template]]
## Used By Workflow
- [[Capture to Summary]] — the create-the-note step reads this doc first.
- `research-distiller` agent and `ingest-clipping` skill point here for the note body.
## Per-Heading Standard
### Frontmatter
`type: input`, `status: sprout`, `created`/`updated` as `YYYY-MM-DD`, `tags: [summary]`. Set `input_kind` to the real source kind (`pdf | web | video | image | conversation | github`) and `track` to the subject domain (`ai | systems | algorithms | career | tra
> [!WARNING]
> Duplicate `notes:` keys (YAML silently keeps the last), a `source_note` written as a full path or without the extension, or a `track` that does not match the deck you tag in Flashcards. The Quant Foundations note uses `source_note: "[[Quant Foundations.pdf]]
### Title and Source Lines
One H1 with the source's real title plus ` — Summary`, no blank line after frontmatter. Immediately follow with three bold header lines: `**Source:**` (path or URL in backticks), `**Ingested:**` (date), `**Pages:**` (count for PDFs; omit the count for web/vi
> [!WARNING]
> A blank line between the frontmatter `---` and the title, or prose padding before the header lines. See Quant Foundations lines 15–18 for the exact shape.
### Source
One sentence: what it is, who produced it, its stated purpose. Bold the source type, author, or named firms on first mention. One `==highlight==` is optional here; the real anchor lives in Full Content sections.
*Density:* one to three sentences. No bullet list.
> [!WARNING]
> A multi-paragraph description, or restating the title. Quant Foundations § Source is a single sentence naming the firms (`**Jane Street**`, `**SIG**`, ...) and the four things the source actually teaches.
### Key Claims
Every distinct claim in the source as a bullet, bold the key concept in each. This is the compressed argument of the whole source before the full capture.
*Density:* one bullet per real claim — Quant Foundations carries 12. Do not merge claims to look shorter.
*Plugins:* bold cloze on the key term; this section is not `#cards`-tagged so bold is safe on every named concept.
=====
---
type: evergreen
status: sprout
created: 2026-06-01
updated: 2026-06-01
tags:
  - system
  - standards
notes:
  - "[[30_Order/Templates/Metadata/For Evergreen|For Evergreen]]"
  - "[[Summary to Distilled]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[HUMAN_WRITING]]"
---
# Evergreen Standard
==An evergreen note distills a reusable mechanism that outlives any single source — it exists because a concept recurred across sources or contexts, not because one source was worth keeping.==
This is the content standard for `evergreen` notes in `60_Claude/20_Distilled_Notes/` (including `Synthesis/` cross-concept comparisons). The difference from a source summary: a summary is fixed to one source and never extended; an evergreen is owned knowledge
## Maps To
- Template: [[30_Order/Templates/Metadata/For Evergreen|For Evergreen]]
## Used By Workflow
- [[Summary to Distilled]] — the create-the-note step reads this Standard first. Search `20_Distilled_Notes/` for an existing note on the concept and extend it before creating a sibling.
## Per-Heading Standard
### Frontmatter
`type: evergreen`, `status: sprout` (raise to `tree` only after the concept is reused and trusted), `tags: [evergreen]`, `notes:` linking the source summaries and concept neighbors it came from, `next:` if a concrete next move exists. Synthesis notes add `trac
> [!WARNING]
> Promoting straight to `status: tree` on first write, or leaving `notes:` empty so the note is invisible to backlinks and the graph.
### Core Claim
The single most important thing the note establishes, in one sentence. This is the `==highlight==` anchor.
*Density:* one sentence wrapped in `==...==`.
> [!WARNING]
====
---
type: evergreen
status: sprout
created: 2026-08-23
updated: 2026-09-05
tags:
  - system
  - standards
  - internship
  - review
notes:
  - "[[Review Standard]]"
  - "[[Internship Notes Standard]]"
  - "[[Internship Pipeline]]"
  - "[[20_Progress/Internship/Building System/Source of Truth]]"
  - "[[20_Progress/Internship/Building System/System - Build Log]]"
  - "[[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]]"
  - "[[Deadline and Intake Triage Standard]]"
  - "[[30_Order/Workflows/Internship/Internship Review System]]"
  - "[[10_Areas/Career/Internships/Tracker/Main Log]]"
next: First rebuild pass 2026-09-05, triggered by the 2026-09 Monthly Review missing 3 of 5 real passed-deadline programs and neither review ever escalating the 2 it did catch same-day. Re-derive Health Check's actual-rate number and the Application Census counts fresh every run — never copy last 
---
# Internship Loop Review Standard
==A review here checks the internship-research-loop's actual output against what it was designed to do — [[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]'s gates and [[Internship Notes Standard|Internship Notes Standard]]'s content rules — never a summary of dossier cou
## Why Two Review Types Plus A Standalone Sweep
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Knowledge Noting.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Source Summary Standard]]"
  - "[[Evergreen Standard]]"
  - "[[Capture to Summary]]"
  - "[[Summary to Distilled]]"
  - "[[Jarvis OS — North Star]]"
---
# Knowledge Noting
==Decide what a source becomes before writing anything: a summary, a distilled concept, or nothing.==
This is the decision standard for how raw material turns into knowledge. It does not say what a finished note looks like. [[Source Summary Standard]] fixes the shape of a summary and [[Evergreen Standard]] fixes the shape of a distilled concept; read those for headings and density. This Standard owns only the choice between them and the agent's behavior while reading.
## The loop
Capture, triage, distill, connect, promote, retrieve, review. A clipping lands in `60_Claude/05_Clippings/` or the Inbox, a triage pass routes it, and the sections below decide the route.
## The routing decision
Ask in this order and stop at the first yes.
1. **Will I act on it or reopen it?** If no, leave the clipping where it is. No summary. A summary of a source nobody needs is storage, not knowledge.
2. **Is it one source worth keeping beyond a link?** Write a source summary ([[Capture to Summary]]). One source in, one summary out. It replaces the source and is never extended later.
3. **Did the same concept recur across sources or in your own work?** Write or extend an evergreen note ([[Summary to Distilled]]). Search `20_Distilled_Notes/` first and extend before creating a sibling.
4. **Is the concept already understood from your own work, with no single source behind it?** Write the evergreen directly with `source_status: vault-grounded`. Do not invent a summary to justify it.
5. **Is the evergreen stable and reused?** Propose a promotion to `10_Areas/` or `40_Resources/`. The owner decides; nothing bulk-promotes.
## While reading
- Read the source once, fully, then write the note in the same session. A half-read source becomes a confident half-note.
- Mark every claim as source-grounded, inferred, or uncertain as you write it, not afterward.
- Link as you go. A note with no links to or from it is invisible to retrieval.
- Do not turn raw source into flashcards. Cards come after distillation.
> [!WARNING]
> Summarizing everything. The vault already holds hundreds of clippings; a summary adds value only for the ones that clear step 2. Skipping the triage question is how `60_Claude` becomes a warehouse.
## Open question for the owner
`Source Summary Standard` ends each summary with a Flashcards section, while the rule above (and the Spaced Repetition guidance in [[AI_CONTEXT]]) says cards come after distillation. These disagree. One of them should change. This Standard follows the distillation-first rule until the owner decides.
## Done Conditions
- The routing decision was made explicitly, and a source that clears none of the steps was left alone.
- No new note duplicates an existing concept note.
- Every new note links to its source and to at least one neighbor.
- Claims are labeled by grounding.
## Gold Standard Example
None yet for the decision itself. For the finished shapes, see the examples named in [[Source Summary Standard]] (`Quant Foundations (PDF)`) and [[Evergreen Standard]] (`BOOM`).

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find 60_Claude/05_Clippings -type f -name "*.md" | wc -l; grep -n "^### Flashcards" "30_Order/Standards/Enrich/Source Summary Standard.md"`
```
740
65:### Flashcards
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Knowledge Noting.md`
```diff
- The vault already holds hundreds of clippings; a summary
+ `05_Clippings/` holds about 740 Markdown files as of 2026-10-15; a summary
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && cat "30_Order/Standards/Project Standard.md" | cut -c1-420; echo; echo =======; grep -n "^## \|^### " "30_Order/Standards/Internship/Internship Loop Review Standard.md"; grep -n -i -A3 "carryover escalation" "30_Order/Standards/Internship/Internship Loop Review Standard.md" | head -30 | cut -c1-420`
```
---
type: evergreen
status: sprout
created: 2026-06-01
updated: 2026-06-01
tags:
  - system
  - standards
notes:
  - "[[30_Order/Templates/Metadata/For Progress|For Progress]]"
  - "[[Brief to Progress]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[HUMAN_WRITING]]"
---
# Project Standard
==A project note tracks current state and the single next move so the dashboard can surface it — a project note without a live `next:` is invisible to the system.==
This is the content standard for `project` notes in `20_Progress/`. The brief in `40_Project_Briefs/` is the thinking; the project note is the doing. Its job is continuity: at any milestone, the note tells you what is true now, what to do next, and what already happened. Update it by appending to the log — never by rewriting history.
## Maps To
- Template: [[30_Order/Templates/Metadata/For Progress|For Progress]]
## Used By Workflow
- [[Brief to Progress]] — the create-the-note step reads this Standard first. Write the brief in `40_Project_Briefs/` before the project note exists.
## Per-Heading Standard
### Frontmatter
`type: project`, `status:` one of `active | paused | complete | archived`, `created`/`updated`, `deadline:` if one exists, `tags:`, and `next:` — the single next move, mirrored in the `## Next Action` section. Set `related_progress:` / `notes:` to the brief and supporting concepts.
> [!WARNING]
> An `active` project with an empty `next:` — it drops out of the "projects missing a next action" dashboard. Jarvis carries `next: Build Week 1 registry hardening...` mirrored in its body.
### Goal
One sentence: what done looks like.
*Density:* a single outcome sentence; this is the `==highlight==` anchor if the note uses one.
> [!WARNING]
> A feature list instead of an outcome. State the finish line, not the work.
### Current State
What is true right now. Bold the key blocker or milestone.
*Density:* the honest present — what works, what is mocked, what is blocked. A complete project (OpsPilot) breaks this into Completed / Partially completed / Not implemented / Real vs mocked.
> [!WARNING]
> Aspirational state ("the pipeline is robust") when the truth is partial. OpsPilot explicitly labels what was **real** vs **mocked/deferred** — that honesty is the standard.
### Next Action
The single next step, mirroring the `next:` frontmatter field so dashboards surface it.
*Density:* one concrete action. Multi-step plans go under Log or Open Questions, not here.
> [!WARNING]
> A vague direction ("keep building") or a list of five next steps. One move.
### Open Questions
`- [ ]` Tasks format, never prose. Add `📅`/priority where a real date exists.
*Density:* the genuine unknowns blocking or shaping the work.
> [!WARNING]
> Prose paragraphs of musing. Use checkboxes so they are trackable.
### Log
Dated entries appended over time, newest at the bottom: `- **YYYY-MM-DD:** what changed`. Do not rewrite past entries.
*Density:* one entry per meaningful work session or milestone.
> [!WARNING]
> Editing or deleting old log lines to make the history look clean. The log is append-only by design.
## Done Conditions
- The note exists in `20_Progress/` under the right project home with a live `next:` mirrored in `## Next Action`.
- Current State is honest about what is real vs mocked vs blocked.
- It links back to its brief and the concepts/resources it depends on.
- The dashboard shows it as active with a next action.
- Open Questions are `- [ ]` tasks; the Log is append-only.
- Passes the applicable points of [[Vault Rules — Complete AI Ruleset]] Part 12 (flashcards do not apply to project notes).
## Gold Standard Example
- [[Jarvis]] — an active project note: one-line north star, control surfaces, build tracks, and a concrete `next:` mirrored in the body.
- [[Opspilot|OpsPilot]] — a complete project retrospective: Current State split into Completed / Partial / Not implemented / Real vs mocked, plus What Went Well/Wrong, lessons, and portfolio assets. Use it as the depth bar for a finished project.

=======
25:## Why Two Review Types Plus A Standalone Sweep
30:## A Known Dependency — Read Before Running The Monthly Review
33:## Maps To
36:## Used By Workflow
38:## Per-Heading Standard — Weekly Discovery Review
39:### Period Covered
41:### Sources Reviewed
43:### Sample & Method
45:### Gate Conformance
47:### Standard Conformance
51:### Priority Classification Accuracy
53:### Resource-Limit Health
55:### Deadline Sweep Citation
57:### Findings
59:### Immediate Actions
61:### Decided Fixes
63:### Open Questions
67:### Next Period's Watch List
69:## Per-Heading Standard — Monthly Promotion Review
70:### Period Covered
72:### Sources Reviewed
74:### Pipeline Checklist
76:### Per-Program Trace
78:### Deadline Sweep Reconciliation
80:### Application Census
89:### Health Check
95:### Note-Shape Conformance — Provisional
97:### Findings
99:### Immediate Actions
101:### Decided Fixes
103:### Open Questions
107:### Next Period's Watch List
109:## Done Conditions
116:## Gold Standard Examples
66:> **Carryover Escalation, new 2026-09-05.** An Open Question or an unresolved Finding that appears in this same slot two consecutive Weekly reviews auto-promotes to next period's Immediate Actions — per the 2026-09 Monthly review's own stated bar ("a second consecutive sighting is stronger evidence this is a discipline gap, not a one-time oversight"), now made mechanical instead of optional. Whoever writes the n
67-### Next Period's Watch List
68:What this review specifically expects to check again next week, including anything just promoted by the Carryover Escalation rule above.
69-## Per-Heading Standard — Monthly Promotion Review
70-### Period Covered
71-The calendar month, or the real range covered if a review runs late (state it honestly, per the Weekly review's same rule).
--
106:> **Carryover Escalation** — same rule as the Weekly review's: an Open Question or unresolved Finding appearing in the same slot two consecutive Monthly reviews auto-promotes to next period's Immediate Actions. Already demonstrated live: Deepgram/Nuro/Uber/Western Digital's missing trio and Appian's stale "no rush" claim both hit this bar in the 2026-09 review and were resolved the same day this rule was writte
107-### Next Period's Watch List
108:What this review specifically expects to check again next month, including anything just promoted by Carryover Escalation.
109-## Done Conditions
110-- Every claim in Gate Conformance, Standard Conformance, Resource-Limit Health, Deadline Sweep Reconciliation, Application Census, and Health Check traces to a real file, count, or log row — a fraction or count stated only when actually counted, not estimated.
111-- The Weekly review states its sample size and selection method explicitly; every one of its four named sources gets a checked or unchecked box with a reason, never silent omission.
--
114:- A finding that meets the Carryover Escalation bar (two consecutive sightings) is promoted to Immediate Actions, not left to carry forward a third time unremarked.
115-- No `---` in the body; zero blank lines except after a callout; no duplicate frontmatter keys; every `notes:` wikilink resolves.
116-## Gold Standard Examples
117-[[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34|Weekly — 2026-W34]] — the first real review, notable for what a full-corpus grep turned up that a sample alone would have missed. [[60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/Internship Loop Monthly Review — 2026-09|Monthly — 2026-09]] — the review that motivated this rebuild: found 2 real pass
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Per Project Review.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - review
notes:
  - "[[Project Standard]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Review System]]"
  - "[[Plan Review Cadence]]"
---
# Per Project Review
==A project review checks the note's claims against the real work and ends with one live next action, written into the project's own Log.==
This is the content standard for reviewing a single `type: project` note in `20_Progress/` (UROP, coursework builds, trading, personal builds). It borrows the proven skeleton from [[Internship Loop Review Standard]] but is not an internship review: no dossiers, no application counts. It does not replace [[Project Standard]], which says what a project note must contain. This Standard says how to check that the note is still true.
## Maps To
- No new template. The output is a dated entry appended to the project note's own `## Log`, so the review lives next to the work it reviews. Stalls then show up when you open the note.
## Used By Workflow
- No dedicated Workflow yet. Nothing triggers this automatically: the owner or an agent runs it on request or during `/weekly-review`. If it becomes a repeated process, design the Workflow then (see [[30_Order/00_How This Folder Works|How This Folder Works]]).
## Cadence
Weekly for a project with an `active` status and a deadline inside the term. Monthly for an `active` project with no deadline. Never for `paused`, `complete`, or `archived`.
## Per-Heading Standard
Write the review as one Log entry: `- **YYYY-MM-DD review:**` followed by the checks below as short lines.
### Sources Reviewed
Name what was opened this pass: the project note, its brief in `40_Project_Briefs/`, its board (for example `Projects Board`, `BOOM Board`), and the tail of its own Log. An unopened source is listed as not reviewed.
> [!WARNING]
> Listing a source that was not opened. "Brief not reviewed" is honest; a claim about the brief without opening it is not.
### Current State check
Compare `## Current State` with the real work: the repo, the files, the last commit or edit date. Say what changed and what is now false. Label anything still partial as partial.
### Next Action check
Is `next:` live, single, and doable this week? Is it mirrored in `## Next Action`? If it is vague or done, replace it. One move only.
### Stall check
Days since the last Log entry before this one. Two review cycles with no new Log entry mean the project is stalled (the same bar [[Plan Review Cadence]] uses). A stalled project gets a decision, not a note: name the blocker, pause it, or archive it.
### Findings, Immediate Actions, Decided Fixes, Open Questions
Same meaning as in [[Review Standard]]. Decided Fixes holds only items with 100% clarity. Open Questions are `- [ ]` tasks and carry forward.
### Carryover Escalation
An Open Question or unresolved Finding that appears in two consecutive reviews of the same project is promoted to Immediate Actions in the next entry. Do not carry it a third time unremarked.
## Done Conditions
- The Log entry lists sources reviewed, including any not opened.
- Current State was compared with real files or commits, not with the previous Current State.
- `next:` is current and matches `## Next Action`.
- A stalled project has a decision recorded.
- Carryover items two reviews old were promoted.
## Gold Standard Example
None yet. The pattern is proven in the internship loop: [[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34|Weekly 2026-W34]]. The first project review written against this Standard should be named here.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Review System.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - review
notes:
  - "[[Review Standard]]"
  - "[[Per Project Review]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Plan Review Cadence]]"
  - "[[Daily Workflow Standard]]"
  - "[[Memory Management]]"
---
# Review System
==Every review layer cites the real rows it read, fixes only what it is certain about, and hands anything unresolved to the layer above it.==
This is the map and shared contract for how reviews nest in this vault. It does not say what any single review contains. Each layer below has its own Standard for that. Read this when you need to know which review applies, where its output goes, and how a finding escalates.
## Review layers
| Layer | Cadence | What it reviews | Standard or skill | Output goes to |
|---|---|---|---|---|
| Daily | each working day | the day's plan and scorecard | `/startday`, `/closeday`, [[Daily Workflow Standard]] | the daily note in `10_Areas/Life/Enumerate/Daily/` |
| Project | weekly or monthly per project | one project note's truth and stall state | [[Per Project Review]] | the project note's own `## Log` |
| Plan | each review cycle | a `type: plan` note's progress | [[Plan Review Cadence]] | the plan's Current Progress section |
| Internship loop | weekly and monthly | the internship pipeline's output | [[Internship Loop Review Standard]] | `60_Claude/30_Reviews/Internship Loop/` |
| AI tools | weekly and monthly | how Claude Code, Cowork, and sync are used | [[Review Standard]] | `60_Claude/30_Reviews/AI/Scheduled/` |
| Vault | weekly | build, enrichment, and structural health | `/weekly-review` | `60_Claude/30_Reviews/Weekly Synthesis/` |
| Ops | on demand | link, frontmatter, and orphan health | `/ops health-check`, agent `vault-curator` | `60_Claude/30_Reviews/Ops Reports/` |
## Rules every layer shares
- **Cite real rows.** Every claim traces to a file, count, or log row opened this pass. A source not opened is listed as not reviewed.
- **Reviews do not fix.** A review that surfaces a problem is not authorization to auto-fix it. Decided Fixes holds only items with 100% clarity, applied by hand or flagged for the next build session.
- **Open Questions carry.** They are never deleted without being resolved.
- **Carryover Escalation.** A finding or open question that shows up in the same slot twice in a row is promoted to Immediate Actions in the next review. Do not carry it a third time unremarked.
- **Honest emptiness.** "Nothing to report" is a valid finding. Do not invent one to fill a heading.
- **Nothing runs on its own.** Every review is triggered by the owner or an agent asked to run it. A review not run is a gap to record, not to hide.
## How findings escalate
A project review's unresolved items surface in the vault's weekly review. A weekly item still open at month end is carried by the monthly review of its own layer. An item that reaches a second monthly sighting is a discipline gap, and goes to the owner as a decision, not another note.
> [!WARNING]
> Adding a new review layer because a topic feels important. Check this table first. If an existing layer covers the subject, extend its Standard. A new layer needs a named trigger and a named owner, the same test [[Log Standard]] applies to logs.
## Known gaps
- `Review Standard`, `AI Weekly Review Template`, and `AI Monthly Review Template` cite `_All-Projects-Sync-Log`, which no longer exists. The live sync logs are `Sync-Log.md` inside `20_Progress/AI/Claude Code/.claude_windows/` and `.claude_wsl/`. Fix the citations when those files are next edited.
- `Review Standard` cites `Weekly Synthesis Template` and `Monthly Synthesis Template` under `Templates/Capability/`; no files by those names exist there now.
- The log tail of each layer is the only record that a review ran. See [[Memory Management]].
## Done Conditions
- The review run was matched to a row in the table above.
- Its output landed where the table says.
- Anything two reviews old was escalated.
## Gold Standard Example
None for the system as a whole. For one layer, see the Gold Standard Example in [[Review Standard]].

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls 30_Order/Templates/Capability; ls "60_Claude/30_Reviews/Internship Loop" "60_Claude/30_Reviews/AI/Scheduled" 2>&1 | head; ls "10_Areas/Life/Enumerate"; ls 20_Progress/AI/Claude\ Code | head -30`
```
Action Template.md
Brief Template.md
Depth Ladder Template.md
Field OS Template.md
MOC Template.md
Output Template.md
Question Bank Template.md
Synthesis Template.md
60_Claude/30_Reviews/AI/Scheduled:
Weekly

60_Claude/30_Reviews/Internship Loop:
Internship Loop Reviews MOC.md
Review System.md
Scheduled
Daily
Enumerate Board.md
Monthly
Weekly
Yearly
CausalOps
Github ReadMe
Jarvis
MOC.md
Management.md
OpsPilot
Portfolio
Resq
Sync - Unison.md
The Plan
Trading View
Write Log.md
internship-research-loop
second-brain-claudekit
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for n in "Review System" "Tool Calls" "Orchestration" "Memory Management" "Conversations" "Knowledge Noting" "Per Project Review" "Logs" "Graphify Notes" "AI Conversation" "Conversation Capture" "Log Standard" "Review Standard" "Plan Review Cadence" "Daily Workflow Standard" "Project Standard"; do echo "== $n"; find . -name "$n.md" -not -path "./.git/*" -not -path "./50_Archive/*" -not -path "./.stversions/*" 2>/dev/null; done; sed -n 1,12p "60_Claude/30_Reviews/Internship Loop/Review System.md"`
```
== Review System
./10_Areas/AI/Setup/Review System.md
./30_Order/Standards/AI Loop/Review System.md
./60_Claude/30_Reviews/Internship Loop/Review System.md
== Tool Calls
./30_Order/Standards/AI Loop/Tool Calls.md
== Orchestration
./30_Order/Standards/AI Loop/Orchestration.md
== Memory Management
./30_Order/Standards/AI Loop/Memory Management.md
== Conversations
./30_Order/Standards/AI Loop/Conversations.md
== Knowledge Noting
./30_Order/Standards/AI Loop/Knowledge Noting.md
== Per Project Review
./30_Order/Standards/AI Loop/Per Project Review.md
== Logs
./20_Progress/Projects/Research/BOOM/Logs.md
./30_Order/Standards/AI Loop/Logs.md
== Graphify Notes
./30_Order/Standards/AI Loop/Graphify Notes.md
./30_Order/Templates/AI Toolkit/Graphify Notes.md
== AI Conversation
./30_Order/Templates/AI Toolkit/AI Conversation.md
== Conversation Capture
./30_Order/Workflows/Toolkit/Conversation Capture.md
== Log Standard
./30_Order/Standards/Log Standard.md
== Review Standard
./30_Order/Standards/Enrich/Review Standard.md
== Plan Review Cadence
./30_Order/Workflows/Ingestion/Plan Review Cadence.md
== Daily Workflow Standard
./30_Order/Standards/Daily Workflow Standard.md
== Project Standard
./30_Order/Standards/Courses/Project Standard.md
./30_Order/Standards/Project Standard.md
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && RS='[[30_Order/Standards/AI Loop/Review System|Review System]]' && PS='[[30_Order/Standards/Project Standard|Project Standard]]' && \
sed -i "s#\[\[Review System\]\]#$RS#g" "30_Order/Standards/AI Loop/Tool Calls.md" "30_Order/Standards/AI Loop/Per Project Review.md" AGENTS.md && \
sed -i "s#\[\[Project Standard\]\]#$PS#g" "30_Order/Standards/AI Loop/Per Project Review.md" AGENTS.md && \
grep -n "Review System\|Project Standard" AGENTS.md "30_Order/Standards/AI Loop/Per Project Review.md" "30_Order/Standards/AI Loop/Tool Calls.md" | cut -c1-200`
```
AGENTS.md:66:| Active project, internship, research, mentorship work | `20_Progress/` under the matching project | [[30_Order/Standards/Project Standard|Project Standard]] |
AGENTS.md:71:| Daily, weekly, monthly review | `10_Areas/Life/Enumerate/` (Periodic Notes) or `60_Claude/30_Reviews/` | [[30_Order/Standards/AI Loop/Review System|Review System]] |
30_Order/Standards/AI Loop/Per Project Review.md:11:  - "[[30_Order/Standards/Project Standard|Project Standard]]"
30_Order/Standards/AI Loop/Per Project Review.md:13:  - "[[30_Order/Standards/AI Loop/Review System|Review System]]"
30_Order/Standards/AI Loop/Per Project Review.md:18:This is the content standard for reviewing a single `type: project` note in `20_Progress/` (UROP, coursework builds, trading, personal builds). It b
30_Order/Standards/AI Loop/Tool Calls.md:45:None yet. This Standard is a relocation of rules that were already in use, and no session has been reviewed against it. When a review ([[30_Order/Standards/
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== Tool log"; sed -n 1,40p "60_Claude/30_Reviews/AI/Toolkit/Tool log.md" | cut -c1-300; echo "=== Claude Kit Log head"; sed -n 1,22p "20_Progress/Projects/AI Use/Claude Kit/Log.md" | cut -c1-260; echo "=== sync scripts"; ls 30_Order/System/sync-workflow/scripts 2>/dev/null | head -20`
```
=== Tool log
---
type: dashboard
status: active
created: 2026-08-11
updated: 2026-08-20
tags:
  - claude-code
  - tool-log
  - skill-use
notes:
  - "[[20_Progress/Projects/AI Use/Claude Kit/Toolkit/Claude Code]]"
next: Add a row every time /export-ai-session reviews a session — the ad-hoc/multiple convention (added 2026-08-20) covers sessions without one clean slash-command name; watch whether that convention holds up once more rows land
---
# Tool log
==Every row is one skill or command's use in one session — one skill invoked twice in a session earns two rows — appended by /export-ai-session, never hand-edited into a different shape.==
## Purpose
This is the per-use record of Claude Code skills, commands, and agents across both Windows and WSL sessions — Claude Code only for now, per the same scope [[20_Progress/Projects/AI Use/Claude Kit/Toolkit/Claude Code|Toolkit/Claude Code.md]] tracks. It answers "when was this skill last used, on wha
Filed under `60_Claude/30_Reviews/AI/Tools/`, not `05_Clippings/`, on purpose — this is a derived, continuously-updated index built from raw captures, not a raw capture itself, and `05_Clippings` is read-only after capture per the vault's Write Contract (`AGENTS.md`). An empty placeholder was orig
## Row shape
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
| YYYY-MM-DD | project name from the raw note's frontmatter | `/skill-name` or agent name | one clause, concrete | clean / partial / failed, one clause why if not clean | `[[raw session note]]` |
`Outcome` is never left blank — "clean" still gets written, not omitted. `Source` links the raw session note (`Windows/Claude Code/<project>/...` or `WSL/Claude Code/<project>/...`), not the distilled summary — the summary may not exist for every session that gets a Tool log row, since `/export-
**`Skill/Command` when there is no single clean value (added 2026-08-20, found necessary the first time this log got a real row):** a real session frequently doesn't route through one nameable slash command. Two explicit values cover this rather than leaving the column blank or forcing a fake name:
- **`ad-hoc`** — the session invoked no registered skill/command at all (a freeform task worked directly in the main thread). Name what it actually did in `What It Did` instead — that column carries the specificity this one can't.
- **`multiple`** — the session invoked more than one registered skill/command. Name every one actually used in `What It Did` (e.g. "ran `/startday` then `/note-to-actions`"); do not pick just one to represent the row.
One row is still written per session in either case — `ad-hoc`/`multiple` describes the session's shape, it doesn't multiply into several rows the way one skill used twice in a session does.
## Log
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
| 2026-08-19 | Jarvis | ad-hoc | Re-verified second-brain-claudekit's real repo state via direct WSL access (not the Windows mirror) and patched 7 Jarvis tracking notes (Tool Map, Log, What Agents/Commands/Hooks, Folder Map, Notes Map, Claude Code.md) to match — no registered skill/command invoked
## Links
[[20_Progress/Projects/AI Use/Claude Kit/Toolkit/Claude Code]] for the wider Toolkit this log feeds. `C:\Users\Anant Gupta\.claude\skills\export-ai-session\SKILL.md` for the skill that writes rows here.
=== Claude Kit Log head
## [2026-08-21] correction | instructions/ flatten bug fixed for real — verified directly against 3 commits, not the report alone
- **Verified the fix landed, not trusted from the report.** Checked directly against the live repo (`wsl.exe`), not the Windows mirror: `instructions/second-brain-claudekit/` is now flat — 16 files, no subfolder, `_docs/`/`_docs/_docs/` gone. Three real comm
- **The flagged, not-fixed gap is real and correctly left open, not silently absorbed into "done."** `second-brain-claudekit`'s own `Architecture.md`/`PRD.md` moved out of `_docs/` to the repo root in an unrelated, still-uncommitted change; `instructions_paths
- **[[10_Areas/AI/Setup/Folder Map|Folder Map.md]] updated** with the resolution, closing the correction added earlier today.
- **This closes the sync-build phase's last open item.** Next phase, unchanged from the entry above: `tests/`'s deferred refinement pass, and a direct re-check of the AI-tools review system's "Gold Standard Example" status before the next session treats it as 
- **Correction, same day: not actually closed.** `instructions/<repo>/`'s scope needed a third fix — it should hold only explicit main files (`CLAUDE.md`, `AGENTS.md`, `README.md`, `PRD.md`, `Architecture.md`), never a whole directory's contents; the "flat" 
- **Third and, per the mechanism change, final correction — landed and verified for real, same day.** Four new commits (`b48480c`, `f6cafb3`, `1c95223`, `ff59f4f`, all `2026-08-21 17:27–17:28`): `sync-all.sh`'s directory-flattening logic was removed outrig

## [2026-08-21] correction | Sync-build phase closed out — instructions/ flatten bug confirmed still open, not fixed by the parallel round; Folder Map's stale "no instructions/second-brain-claudekit/" claim corrected
- **Audited the flatten fix directly (WSL path, not any round's report) — it has NOT landed.** `instructions/second-brain-claudekit/_docs/_docs/How to/` still exists right now: the self-nesting bug described in round 6/7's framing is real, current, and unfix
- **All other 9 `instructions/<repo>/` folders on the source side are correctly flat**, checked directly (CausalOps, Jarvis, OpsPilot, Portfolio, Resq, The Plan, Trading View, `.claude_wsl`) — real files sitting directly in each project folder, `claude-` col
- **The Jarvis mirror (`20_Progress/AI/Claude Code/second-brain-claudekit/`) doesn't mirror `instructions/` at all, and never has** — `instructions_paths` drives a same-repo, source-to-source `cp`, not a leg of the Unison sync to Jarvis. Its own `_docs/` sub
- **[[10_Areas/AI/Setup/Folder Map|Folder Map.md]] corrected in place** — its "Corrected 2026-08-20" section claimed "no `instructions/second-brain-claudekit/` folder exists," accurate for the few hours between the 2026-08-20 removal and its reversal, but st
- **Sync-build phase closed out as its own line, per instruction — with the caveat above, not despite it.** The mechanism itself is done and proven: `sandbox/` → tested for real → `tested-tools/` (never live-synced to any project) → an explicit, per-it
- **Next phase, for whoever picks this up:** `tests/` needs a real refinement pass — flagged explicitly 2026-08-20 (sixth pass) as out of scope for that sync-only session, not attempted since. **Review-system claim checked, not confirmed as given:** this rep
- Updated: this file, [[10_Areas/AI/Setup/Folder Map|Folder Map.md]].

## [2026-08-20] correction | The real pipeline model recorded as dated source of truth — two Folder Map claims corrected, sync task caught mid-failure, settings.json cleanup landed
- **The corrected model, confirmed directly by Anant, recorded here as the dated source of truth:** `sandbox/` → tested for real → `tested-tools/` (never live-synced to any project) → an explicit, per-item human decision → `agents/<Project>/`, `command
- **Explicit correction to [[10_Areas/AI/Setup/Folder Map|Folder Map.md]], caught this session, not carried forward silently:** that note's "Claude Kit sync layer" section said "nothing beyond second-brain-claudekit has been switched live; that requires a per-
- **Sync mechanism caught mid-failure, not assumed healthy from the last log line.** `_All-Projects-Sync-Log.md`'s last successful run across all ten entries is 2026-08-20 16:00:03 +0400 (`OK`). Direct check of the real Windows Scheduled Task (`Get-ScheduledTa
- **The parallel codebase-side settings.json fix landed for real, verified by commit, not by re-reading the same manifest twice.** First read of `60_Claude/scripts/sync-manifest.json` this session showed the old schema (`repo_root`/`mirror_path` keys), with `.
=== sync scripts
check-syncthing-status-silent.vbs
check-syncthing-status.ps1
rotate-sync-logs.ps1
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls "60_Claude/40_Project_Briefs/TradingView" | head -12; echo ---; sed -n 1,12p "60_Claude/40_Project_Briefs/TradingView/GRAPH_REPORT.md" | cut -c1-220; echo --- ; ls "60_Claude/40_Project_Briefs/TradingView/Communities" 2>/dev/null | head -3; ls "60_Claude/40_Project_Briefs/TradingView/Nodes" 2>/dev/null | head -3; echo ---; sed -n 1,30p "40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow.md" | cut -c1-260; echo ---; ls 60_Claude/40_Project_Briefs | head -20; find . -name "How to use Graphify.md" -not -path "./.git/*" | head`
```
00 Overview.md
Communities
GRAPH_REPORT.md
Nodes
graph.html
---
# Graph Report - /home/anant_gupta/projects/hub/tradingview  (2026-06-25)

## Corpus Check
- Corpus is ~27,519 words - fits in a single context window. You may not need a graph.

## Summary
- 981 nodes · 1929 edges · 95 communities (49 shown, 46 thin omitted)
- Extraction: 63% EXTRACTED · 37% INFERRED · 0% AMBIGUOUS · INFERRED: 715 edges (avg confidence: 0.63)
- Token cost: 0 input · 145,907 output

## Community Hubs (Navigation)
- [[_COMMUNITY_OHLCVRecord Model & Validation Tests|OHLCVRecord Model & Validation Tests]]
---
2026 Research Baseline & Multi-Agent Roles.md
2026 Research Baseline (FinGPTFinRobotFINRASEC).md
AI Hub Card Property Tests (20-23).md
4-Week MVP Plan.md
A date before the calendar's supported range should raise CalendarError..md
A date far in the future beyond calendar range should raise CalendarError..md
---
---
type: evergreen
status: sprout
created: 2026-08-22
updated: 2026-08-22
tags:
  - evergreen
  - graphify
  - claude-code
source_url: https://github.com/Graphify-Labs/graphify
notes:
  - "[[40_Resources/CS/Concepts/Helpful Tools/Graphify]]"
  - "[[60_Claude/40_Project_Briefs/How to use Graphify]]"
next:
---
# Graphify Workflow
==The graph lives in `graphify-out/graph.json`; every other output (`GRAPH_REPORT.md`, `graph.html`, the Obsidian export) is a view derived from it, and `graphify update` only ever touches the code-derived view — a docs/PDF change needs a full `/graphify --u
## Install
```bash
uv tool install graphifyy      # recommended — isolated env, clean uv tool upgrade path
# or: pipx install graphifyy
graphify install                # registers the /graphify skill with Claude Code
```
*Avoid plain `pip install` on Mac/Windows if avoidable* — the skill resolves its Python interpreter at runtime from `graphify-out/.graphify_python`, and a `pip`-installed copy can point at the wrong environment later, producing `ModuleNotFoundError: No modul
**Staying current matters more than it looks.** The package ships near-daily patch releases (0.9.44 → 0.9.48 across five days observed in `CHANGELOG.md`), and several fixes land directly on the git-hook workflow below — e.g. 0.9.46 stopped `post-checkout` 
## The Three-Pass Pipeline
1. **Code (free)** — tree-sitter AST, 37 languages, `ProcessPoolExecutor`-parallel (measured ~1.66x faster than sequential on an 84-file corpus). SQL gets deterministic table/view/FK/JOIN extraction. Code files never reach the LLM pass; if the corpus is code
2. **Video/audio (free)** — faster-whisper, local. The transcription prompt is seeded with the codebase's own current god-nodes so the transcript stays domain-focused.
3. **Docs/PDFs/images (costs tokens)** — parallel Claude subagents (or a configured API backend for headless `graphify extract`), each reading a batch of files and returning a `{nodes, edges}` JSON fragment, merged into the graph.
## Community Detection And Confidence
---
40_Project_Briefs Board.md
CausalOps
Codebase Sync Decision and Logging Failure Audit — 2026-10-04.md
Graphify — Internship Research Loop Implementation.md
How to use Graphify.md
In depth Usage.md
Internship
Portfolio
TradingView
./60_Claude/40_Project_Briefs/How to use Graphify.md
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && f="60_Claude/40_Project_Briefs/How to use Graphify.md" && sed -n 1,16p "$f" | cut -c1-300; grep -n "^## \|^### " "$f"; grep -n -i "health\|three numbers\|3 numbers\|manifest\|--obsidian-dir\|never.*edit\|hand-edit" "$f" | head -20 | cut -c1-300; echo ---; cat "60_Claude/40_Project_Briefs/Internship/.graphify_obsidian_manifest.json" 2>/dev/null | head -c 400`
```
---
type: evergreen
status: sprout
created: 2026-08-22
updated: 2026-08-22
tags:
  - evergreen
  - ai-agents
  - graphify
notes:
  - "[[40_Resources/CS/Concepts/Helpful Tools/Graphify]]"
  - "[[40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow]]"
  - "[[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation]]"
next: "Apply this exact procedure to the next codebase that needs mapping; update this note if the procedure changes in a way worth capturing"
---
# How to use Graphify
18:## Before Doing Anything
25:## First Build In A Repo
33:## Repo Already Mapped
38:## The One Rule That Matters Most
45:## Health Check — Run This On Any Obsidian-Synced Setup
53:## Open Items Worth Checking On Any New Setup
57:## Links
29:4. **Decide the Obsidian target.** If this vault (Jarvis) should mirror the graph, the convention this vault uses is `60_Claude/40_Project_Briefs/<RepoName>/`, passed as `/graphify . --obsidian --obsidian-dir "<path to that folder>"` in the same build pass. This folder becomes graphify-owned — 
32:7. **Gitignore correctly.** At minimum: `cost.json` (per the official README), `cache/`, and anything machine-local (`.graphify_python`, `.graphify_root`, `.rebuild.lock`, `.pending_changes`). Check for a dated `graphify-out/<YYYY-MM-DD>/` backup folder too — not in the official docs, but real 
44:Never assume the graph is current for a doc-heavy repo just because hooks are installed. Check `graphify-out/manifest.json`'s timestamps, or just run `/graphify --update` — it no-ops cheaply if nothing changed.
45:## Health Check — Run This On Any Obsidian-Synced Setup
46:Three numbers should stay close together: the vault folder's real `.md` file count, `.graphify_obsidian_manifest.json`'s tracked-file count, and `graph.json`'s current node count. On **0.9.17+**, a node dropping out of the graph self-prunes its old note automatically — the gap should stay near 
49:python3 -c "import json; print(len(json.load(open('<vault-target>/.graphify_obsidian_manifest.json'))['files']))"
55:- [ ] Run the health check above once after initial setup and again after any period of heavy concurrent-session activity
---
{
  "files": [
    "(b) Already sourced in the vault's own research log  Cover Letter Alteration Standard \u00a77.md",
    "(b) Columbia University SEAS Career Center \u2014 verified live 2026-09-06.md",
    "(b) National American University Career Services \u2014 verified live 2026-09-06.md",
    "(text, tags) for every '- ' line carrying at least one skill tag..md",
    ".increase_indent().md",
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -n '29p;38,44p;46,52p' "60_Claude/40_Project_Briefs/How to use Graphify.md"`
```
4. **Decide the Obsidian target.** If this vault (Jarvis) should mirror the graph, the convention this vault uses is `60_Claude/40_Project_Briefs/<RepoName>/`, passed as `/graphify . --obsidian --obsidian-dir "<path to that folder>"` in the same build pass. This folder becomes graphify-owned — it will never overwrite a pre-existing note there, but treat it as a generated mirror, not a place to hand-write notes.
## The One Rule That Matters Most
| Change type | Propagates automatically once hooks are installed? |
|---|---|
| Code (any language graphify parses) | Yes — `graphify update`, zero LLM |
| Docs, PRDs, READMEs, PDFs, images | **No** — needs `/graphify --update` in a live session |
| Commits made somewhere other than this machine (CI) | Only if a `post-merge` hook was added — not part of the official `graphify hook install` |
Never assume the graph is current for a doc-heavy repo just because hooks are installed. Check `graphify-out/manifest.json`'s timestamps, or just run `/graphify --update` — it no-ops cheaply if nothing changed.
Three numbers should stay close together: the vault folder's real `.md` file count, `.graphify_obsidian_manifest.json`'s tracked-file count, and `graph.json`'s current node count. On **0.9.17+**, a node dropping out of the graph self-prunes its old note automatically — the gap should stay near zero on its own. On anything older, or after a burst of concurrent hook-triggered exports (no lock file guards the manifest write, unlike `graph.json`'s own `.rebuild.lock`), a real gap means orphans accumulated and need one-time manual cleanup (real precedent: 350 found and removed on this vault's own Internship mirror — see [[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation|the Internship implementation note]] for the exact root cause and the git-verified cleanup).
```bash
ls <vault-target>/*.md | wc -l
python3 -c "import json; print(len(json.load(open('<vault-target>/.graphify_obsidian_manifest.json'))['files']))"
python3 -c "import json; print(len(json.load(open('graphify-out/graph.json'))['nodes']))"
```
If the vault itself is a git repo (check `git -C <vault-root> rev-parse --is-inside-work-tree` — don't assume "no `.git`" from a truncated directory listing), it's a safety net for exactly this kind of cleanup: `git status` shows deletions before they're permanent, `git show <commit>:<path>` confirms a file's origin (a real `graphify/EXTRACTED` tag settles "is this debris or content" definitively), and committing the cleanup deliberately beats letting an unrelated auto-commit finalize an unreviewed batch.
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Graphify Notes.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - graphify
notes:
  - "[[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes template]]"
  - "[[Graphify Folders]]"
  - "[[How to use Graphify]]"
  - "[[Graphify Workflow]]"
---
# Graphify Notes
==A graphify folder is a generated mirror that graphify owns: read it, link to it, never hand-write inside it. Everything a human writes about it goes in one entry note outside it.==
This is the content standard for notes that come from a Graphify export into this vault, and for the one human-written entry note that wraps each export. It does not teach Graphify. Commands, the three-pass pipeline, and the hook behavior live in [[Graphify Workflow]] and [[How to use Graphify]].
## Maps To
- Template: [[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes template]] (the entry note only)
## Used By Workflow
- [[Graphify Folders]]
## What a graphify folder is
The vault convention is `60_Claude/40_Project_Briefs/<RepoName>/`, created with `/graphify . --obsidian --obsidian-dir "<that folder>"`. It holds machine-generated files:
- `00 Overview.md`, `GRAPH_REPORT.md`, `graph.html`
- `Communities/` (notes named `_COMMUNITY_<name>`) and `Nodes/`
- `.graphify_obsidian_manifest.json`, which tracks every file graphify wrote
Seen today in `TradingView/` and `Internship/`.
## Ownership rules
- **Graphify owns the folder.** Never hand-write or hand-edit a note inside it. A rebuild may prune or overwrite it.
- **Generated files carry no vault frontmatter.** `GRAPH_REPORT.md` starts with a plain `# Graph Report` heading. These files are exempt from the 30_Order frontmatter rule, and lint, enrichment, and link checks should skip them.
- **The entry note is human-owned.** One note per mirror, started from the template, kept outside the generated folder (in `40_Project_Briefs/`), holding the repo, the last build date, the health check result, and links in.
- **Link in, not through.** Other notes link to `GRAPH_REPORT.md` and to the entry note, not to individual generated node files.
> [!WARNING]
> Tooling exclusion is a rule here, not a verified fact. Confirm that `vault-curator` and `/ops` skip graphify folders before relying on a clean report. The Internship mirror once held about 350 orphaned notes with junk names such as `.increase_indent().md`, found only by the manual health check.
## Health check
Three numbers stay close together: the folder's real `.md` count, the manifest's tracked-file count, and `graph.json`'s node count. A real gap means orphans accumulated. The commands are in [[How to use Graphify]]. Record the three numbers and the date in the entry note every time they are checked.
## Done Conditions
- The folder sits at `60_Claude/40_Project_Briefs/<RepoName>/` and nothing in it was hand-edited.
- An entry note exists, started from the template, with a dated health check.
- The three counts agree, or the gap is recorded as an Open Question.
- The entry note links to `GRAPH_REPORT.md`.
## Gold Standard Example
None yet for the entry note. The closest is [[Graphify — Internship Research Loop Implementation]], which records the root cause and cleanup of the Internship mirror, but it predates this template.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\AI Toolkit\Graphify Notes.md`
```
---
type: evergreen
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - evergreen
  - graphify
repo:
mirror_folder: "60_Claude/40_Project_Briefs/<RepoName>/"
last_build:
notes:
  - "[[How to use Graphify]]"
next:
---
# Graphify: <RepoName>
==One line: what this graph answers about the repo.==
## Source
The repo path, what it contains, and why it was mapped.
## Mirror
Folder: `60_Claude/40_Project_Briefs/<RepoName>/` (graphify-owned, never hand-edited). Report: [[<RepoName>/GRAPH_REPORT|GRAPH_REPORT]]
## Last Build
Date, command used, and whether docs or PDFs changed since (those need a full `/graphify --update`).
## Health Check
| Date | Folder `.md` count | Manifest count | `graph.json` nodes |
|---|---|---|---|
|  |  |  |  |
A real gap means orphans. Cleanup steps are in [[How to use Graphify]].
## Open Questions
- [ ]

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Graphify Folders.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - workflow
  - graphify
notes:
  - "[[00_Workflows Index]]"
  - "[[30_Order/Standards/AI Loop/Graphify Notes|Graphify Notes]]"
  - "[[How to use Graphify]]"
---
# Graphify Folders
Add a Graphify mirror of a repo to the vault, or keep an existing one healthy.
**Use when:** a repo needs a navigable graph inside Jarvis, or a mirror's health check is due.
**Serves Standard:** [[30_Order/Standards/AI Loop/Graphify Notes|Graphify Notes]]. **Template:** [[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes]].
The commands and the three-pass pipeline are in [[How to use Graphify]] and [[Graphify Workflow]]. This workflow covers only the vault side.
## Steps
1. Check whether the repo is already mapped. If it is, skip to step 5.
2. Choose the target folder: `60_Claude/40_Project_Briefs/<RepoName>/`. It must not already hold hand-written notes.
3. Build with `--obsidian --obsidian-dir` pointing at that folder, in the same pass as the graph build.
4. Create the entry note from the Graphify Notes template and fill Source, Mirror, and Last Build.
5. Run the three-count health check and record it in the entry note's Health Check table.
6. If the counts disagree, record the gap as an Open Question. Clean up orphans only after confirming in git that they are debris.
7. Append one line to the session log ([[Memory Management]]).
## Done when
- The mirror folder holds only graphify-generated files.
- The entry note exists with a dated health check.
- Any count gap is written down, not ignored.

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis/20_Progress/AI/Claude Code" && ls -la .claude_windows .claude_wsl 2>&1 | grep -i "sync-log"; head -3 .claude_windows/Sync-Log.md | cut -c1-200; sed -n 1,12p "Write Log.md" | cut -c1-160; grep -n "param\|Archive\|MaxLines\|MaxKB\|threshold" "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/sync-workflow/scripts/rotate-sync-logs.ps1" | head -10`
```
-rw-r--r-- 1 anant 197609 458624 Sep 19 13:37 [REDACTED].md
-rw-r--r-- 1 anant 197609  36619 Sep 20 20:49 Sync-Log.md
-rw-r--r-- 1 anant 197609 516103 Sep 19 13:37 [REDACTED].md
-rw-r--r-- 1 anant 197609 199485 Sep 20 20:40 Sync-Log.md
2026-09-20 06:04:34 -0500  hooks/  OK  hooks -> hooks/.claude_windows
2026-09-20 06:04:34 -0500  context/  OK  context -> context/.claude_windows
2026-09-20 06:04:34 -0500  rules/  OK  rules -> rules/.claude_windows
---
type: log
status: retired
created: 2026-07-30
updated: 2026-08-20
tags:
  - claude-code
  - log
  - claude-kit
notes:
  - "[[20_Progress/AI/Claude Code/Management]]"
  - "[[20_Progress/AI/Claude Code/MOC]]"
3:# Nothing is deleted - old lines move to Sync-Log-Archive-<rotation-date>.md.
17:param(
69:    $archivePath = Join-Path (Split-Path $path -Parent) ("Sync-Log-Archive-$rotationDate.md")
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Logs.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - logs
notes:
  - "[[Log Standard]]"
  - "[[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs template]]"
  - "[[Maintaining Logs]]"
  - "[[Memory Management]]"
---
# Logs
==Pick the log's shape from the stream it records, then write its feeder, owner, and order into its header.==
This is the shape standard for the AI-toolkit logs in this vault. It does not decide whether a log should exist, or how to avoid a silent one: that is [[Log Standard]], read it first. This Standard covers the three shapes a log takes once it earns a file, and the per-entry format of each.
## Maps To
- Template: [[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs]] (row logs only). Narrative and machine logs have no template yet.
## Used By Workflow
- [[Maintaining Logs]]
## The three shapes
| Shape | Live example | Entry format | Fed by |
|---|---|---|---|
| Narrative | `Session Logs/log.md`, `20_Progress/Projects/AI Use/Claude Kit/Log.md` | `## [YYYY-MM-DD] tag \| title`, then bullets | a human or agent, at session end ([[Memory Management]]) |
| Row | `60_Claude/30_Reviews/AI/Toolkit/Tool log.md` | one table row: `Date \| Project \| Skill/Command \| What It Did \| Outcome \| Source` | the `/export-ai-session` skill |
| Machine | `Sync-Log.md` in `20_Progress/AI/Claude Code/.claude_windows/` and `.claude_wsl/` | `YYYY-MM-DD HH:MM:SS -0500  path  OK  detail` | the sync scripts |
Use the shape of the stream, not the shape you prefer. Decisions and reasoning are narrative. Repeated uses of a thing are rows. Script output is machine.
## Header every log carries
- **Feeder:** the mechanism that writes to it, or the named owner if none exists ([[Log Standard]]).
- **Order:** newest first or newest last, stated. Both exist today: `Claude Kit/Log.md` is newest first, `Session Logs/log.md` newest last.
- **Scope:** one sentence on what belongs here and what goes elsewhere.
## Per-shape rules
### Narrative
Entries are append-only. A correction is a new entry that names the one it corrects. State what was verified, not what was reported.
### Row
One row per skill or command use in a session. A skill used twice in one session earns two rows. `Outcome` is never blank: write `clean`, `partial`, or `failed` with one clause of why. When no single command fits, `Skill/Command` is `ad-hoc` (none used) or `multiple` (name them all in `What It Did`). `Source` links the raw session note.
### Machine
Never hand-edited. Old lines move to `Sync-Log-Archive-<date>.md` by `rotate-sync-logs.ps1`; nothing is deleted.
> [!WARNING]
> Hand-editing a row or machine log into a different shape. The Tool log exists because its rows stay uniform, and a review that cites a hand-edited row is citing nothing.
## Known gaps
- `Review Standard`, `Log Standard`, and the AI review templates cite `_All-Projects-Sync-Log`, which no longer exists. Point them at the two `Sync-Log.md` files.
- `Tool log.md` says it is filed under `.../AI/Tools/` but lives at `.../AI/Toolkit/`. Correct the body text.
- `Write Log.md` is retired but still sits in `20_Progress/AI/Claude Code/`. It is the negative example in [[Log Standard]].
- `/export-ai-session` asks for confirmation before writing, so it cannot run on a schedule. Row logs therefore depend on a named human running it.
## Done Conditions
- The log's header names its feeder or owner, its order, and its scope.
- Its entries match the format of its shape.
- No entry was hand-edited after it was written.
- A silent log was investigated per [[Log Standard]], not left.
## Gold Standard Example
`20_Progress/Projects/AI Use/Claude Kit/Log.md` for narrative, and `60_Claude/30_Reviews/AI/Toolkit/Tool log.md` for row, which defines the `ad-hoc` and `multiple` rule from its first real use.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\AI Toolkit\Tool Logs.md`
```
---
type: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - claude-code
  - tool-log
  - skill-use
notes:
  - "[[20_Progress/Projects/AI Use/Claude Kit/Toolkit/Claude Code]]"
next:
---
# Tool log
==Every row is one skill or command's use in one session, appended by its feeder and never hand-edited into a different shape.==
## Purpose
What this log records, which tools it covers, and the question it answers ("when was this skill last used, on what").
## Feeder and order
- **Feeder:** `/export-ai-session`, or a named owner.
- **Order:** newest last.
## Row shape
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
| YYYY-MM-DD | project name | `/skill-name`, agent name, `ad-hoc`, or `multiple` | one clause, concrete | clean, partial, or failed, with one clause of why if not clean | `[[raw session note]]` |
`Outcome` is never blank. `ad-hoc` means no registered skill ran. `multiple` means several ran, so name each in `What It Did`.
## Log
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
## Links
- [[30_Order/Standards/AI Loop/Logs|Logs]]

```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Maintaining Logs.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - workflow
  - logs
notes:
  - "[[00_Workflows Index]]"
  - "[[30_Order/Standards/AI Loop/Logs|Logs]]"
  - "[[Log Standard]]"
---
# Maintaining Logs
Keep the AI-toolkit logs fed, rotated, and honest.
**Use when:** a session ends, a review is due, or a log looks silent.
**Serves Standard:** [[30_Order/Standards/AI Loop/Logs|Logs]]. **Policy:** [[Log Standard]]. **Template:** [[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs]] (row logs).
## Steps
1. **Narrative logs:** at session end, append one entry ([[Memory Management]]).
2. **Row logs:** run `/export-ai-session` for any session that used skills or commands. It asks for confirmation, so it needs a person present.
3. **Machine logs:** do nothing by hand. Rotate with `30_Order/System/sync-workflow/scripts/rotate-sync-logs.ps1`; old lines move to `Sync-Log-Archive-<date>.md`.
4. **Silence check:** during each AI-tools review ([[Review Standard]]), open every log and compare its last entry with its stated cadence. A silent log is a finding. Find the cause (broken feeder or lapsed habit) before fixing or retiring it.
5. **Retire, do not delete:** a log that cannot name a feeder or owner is folded into an existing log, as `Write Log.md` was on 2026-08-20.
## Done when
- Each log's last entry matches its cadence, or the silence is recorded as a finding.
- No log was edited after the fact.

```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find . -name "The Qualification Pipeline.md" -not -path "./.git/*"; sed -n 1,30p "20_Progress/Projects/AI Use/Claude Kit/Tool Map.md" | cut -c1-280`
```
./20_Progress/Projects/AI Use/Claude Kit/Source of Truth/The Qualification Pipeline.md
---
type: index
status: active
created: 2026-07-29
updated: 2026-09-05
tags:
  - claude-code
  - ai-use
  - ingestion
  - claude-kit
notes:
  - "[[Claude Kit Implementation|Claude Kit]]"
  - "[[40_Resources/CS/Repos]]"
  - "[[20_Progress/AI/Claude Code/MOC|Claude Code MOC]]"
next: Add a row here the same session anything new lands in
  second-brain-claudekit's sandbox/, tested-tools/, or a rigid folder — see that
  repo's _docs/Jarvis.md for the ritual
---
# Claude Kit — second-brain-claudekit Tool Map

==This is the living map of everything ingested into `gupta-builds/second-brain-claudekit`== (`~/projects/ai/claude/second-brain-claudekit` in WSL) — one row per tool, updated the same session its pipeline stage changes. **This file gets a new or updated entry every time someth

This tracks a different layer than `20_Progress/AI/Claude Code/<Project>/Setup.md` — those are per-project, hand-maintained inventories of what's *actually deployed* in a real project's `.claude/`. Most rows below haven't reached that stage yet; this file exists precisely to tr

**Pipeline stages** (full definitions: `second-brain-claudekit/_docs/Architecture.md`): `sandbox` → `tested-tools` → `promoted (repo-scoped)` / `promoted (global)`, or `blocked` / `dropped` / `undecided` / **`parked (future)`** at any point. `tested-tools` is the current name

**Verified 2026-08-20, against the real repo directly (`wsl.exe`, not the Jarvis mirror):** the repo's adversarial-review fixes — `claudeMdExcludes` extended to `["sandbox/**", "tested-tools/**", "instructions/**"]`, `_docs/Repo-Map.md`'s self-consistency, the `second-brain-cla

**The corrected sync/pipeline model and a caught-mid-flight manifest fix (`b5cf0ed`, dropping `settings.json` and adding `README.md`/`_docs` coverage across all 10 manifest entries) are recorded as a dated entry in [[20_Progress/Projects/AI Use/Claude Kit/Log|Log.md]]'s 2026-08-2
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Tools Tracking.md`
```
---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - workflow
  - claude-kit
notes:
  - "[[00_Workflows Index]]"
  - "[[Tool Map]]"
  - "[[The Qualification Pipeline]]"
  - "[[30_Order/Standards/AI Loop/Logs|Logs]]"
---
# Tools Tracking
Keep the Tool Map true whenever a tool moves through the Claude Kit pipeline.
**Use when:** a tool is ingested, tested, promoted, blocked, dropped, or parked in `second-brain-claudekit`.
**Standard:** none yet. The row shape is defined by the header of [[Tool Map]] and the stage definitions by [[The Qualification Pipeline]]. If this becomes a repeated process with drift, write a Standard first ([[30_Order/00_How This Folder Works|How This Folder Works]]).
## Steps
1. Note the new stage. The stages are `sandbox`, `tested-tools`, `promoted (repo-scoped)`, `promoted (global)`, `blocked`, `dropped`, `undecided`, `parked (future)`.
2. In the same session, add or update the tool's `### <Tool>` section in [[Tool Map]] with its bullets: What, Useful for, Global vs. project-scoped, Pipeline stage, Displaces.
3. Append a narrative entry to `20_Progress/Projects/AI Use/Claude Kit/Log.md` naming what changed and what was verified, not what was reported ([[30_Order/Standards/AI Loop/Logs|Logs]]).
4. If the tool reached a real project, update that project's `Setup.md` under `20_Progress/AI/Claude Code/<Project>/`, which lists what is actually deployed.
5. Check the real repo directly, not the Jarvis mirror, before writing that a stage change landed.
## Done when
- The Tool Map row and the Log entry both exist and agree.
- Any deployed change is reflected in the project's `Setup.md`.

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\00_Workflows Index.md`
```diff
- | Create a plan, or keep an existing one wired into daily/weekly execution | [[Plan Review Cadence]] |
+ | Create a plan, or keep an existing one wired into daily/weekly execution | [[Plan Review Cadence]] |
| Add or health-check a Graphify mirror of a repo | [[Graphify Folders]] |
| Keep the AI-toolkit logs fed, rotated, and honest | [[Maintaining Logs]] |
| Update the Claude Kit Tool Map when a tool changes pipeline stage | [[Tools Tracking]] |
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\00_How This Folder Works.md`
```diff
- `Standards/Internship/` — the career/application pipeline.
+ `Standards/Internship/` — the career/application pipeline. `Standards/AI Loop/` — how AI agents operate in the vault: tool selection ([[Tool Calls]]), subagent and skill coordination ([[Orchestration]]), session memory ([[Memory Management]]), conversation capture ([[Conversations]]), the raw-to-knowledge decision ([[Knowledge Noting]]), review layers ([[30_Order/Standards/AI Loop/Review System|Review System]], [[Per Project Review]]), toolkit logs ([[30_Order/Standards/AI Loop/Logs|Logs]]), and Graphify mirrors ([[30_Order/Standards/AI Loop/Graphify Notes|Graphify Notes]]). Its workflows are in `Workflows/Toolkit/` and its templates in `Templates/AI Toolkit/`. Behavior standards (Tool Calls, Orchestration, Memory Management, Knowledge Noting, Review System) have no template, the same as [[Log Standard]].
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && cat > /tmp/chk.sh <<'EOF'
files=(
"AGENTS.md" "CLAUDE.md"
"60_Claude/07_AI_Information/AI_CONTEXT.md" "60_Claude/07_AI_Information/Vault Map.md"
"60_Claude/07_AI_Information/Vault Rules — Complete AI Ruleset.md"
"60_Claude/07_AI_Information/AI Conversation - Summaries/README.md"
"40_Resources/Obsidian/Jarvis Vault Architecture.md" "40_Resources/Obsidian/MCP-Hub-Index.md"
"40_Resources/Obsidian/Vault Operating System.md"
"20_Progress/AI/Claude OS.md"
"30_Order/00_How This Folder Works.md" "30_Order/Workflows/00_Workflows Index.md"
"30_Order/Workflows/Toolkit/Conversation Capture.md" "30_Order/Workflows/Toolkit/Graphify Folders.md"
"30_Order/Workflows/Toolkit/Maintaining Logs.md" "30_Order/Workflows/Toolkit/Tools Tracking.md"
"30_Order/Templates/AI Toolkit/AI Conversation.md" "30_Order/Templates/AI Toolkit/Graphify Notes.md" "30_Order/Templates/AI Toolkit/Tool Logs.md"
)
for f in 30_Order/Standards/AI\ Loop/*.md; do files+=("$f"); done
for f in "${files[@]}"; do
  [ -s "$f" ] || { echo "EMPTY/MISSING: $f"; continue; }
  grep -o '\[\[[^]]*\]\]' "$f" | sed 's/^\[\[//; s/\]\]$//; s/|.*//; s/#.*//' | sort -u | while read -r l; do
    [ -z "$l" ] && continue
    case "$l" in *"<"*) continue;; esac
    b="${l##*/}"; b="${b%.md}"
    n=$(find . \( -name "$b.md" -o -name "$b.canvas" \) -not -path "./.git/*" -not -path "./50_Archive/*" -not -path "./.stversions/*" 2>/dev/null | wc -l)
    if [ "$n" -eq 0 ]; then echo "DEAD  [$f] -> $l"; 
    elif [ "$n" -gt 1 ] && [[ "$l" != */* ]]; then echo "AMBIG($n) [$f] -> $l"; fi
  done
done
EOF
bash /tmp/chk.sh 2>&1 | head -60`
```
AMBIG(12) [AGENTS.md] -> CLAUDE
AMBIG(8) [CLAUDE.md] -> AGENTS
AMBIG(8) [CLAUDE.md] -> AGENTS.md
AMBIG(8) [60_Claude/07_AI_Information/AI_CONTEXT.md] -> AGENTS.md
DEAD  [60_Claude/07_AI_Information/AI_CONTEXT.md] -> Long Note
AMBIG(2) [60_Claude/07_AI_Information/AI_CONTEXT.md] -> Plugins
AMBIG(8) [40_Resources/Obsidian/Jarvis Vault Architecture.md] -> AGENTS
AMBIG(12) [40_Resources/Obsidian/Jarvis Vault Architecture.md] -> CLAUDE.md
AMBIG(8) [40_Resources/Obsidian/MCP-Hub-Index.md] -> AGENTS.md
AMBIG(8) [40_Resources/Obsidian/Vault Operating System.md] -> AGENTS.md
AMBIG(12) [40_Resources/Obsidian/Vault Operating System.md] -> CLAUDE.md
DEAD  [20_Progress/AI/Claude OS.md] -> 10_Areas/Excalidraw/Claude OS Map
DEAD  [30_Order/Templates/AI Toolkit/Tool Logs.md] -> raw session note
AMBIG(12) [30_Order/Standards/AI Loop/Orchestration.md] -> CLAUDE
AMBIG(8) [30_Order/Standards/AI Loop/Tool Calls.md] -> AGENTS
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's#\[\[Plugins\]\]#[[60_Claude/07_AI_Information/Plugins|Plugins]]#' 60_Claude/07_AI_Information/AI_CONTEXT.md && grep -n "Plugins" 60_Claude/07_AI_Information/AI_CONTEXT.md | head -3; echo ---dead-path sweep in instruction layer; grep -rnE "35_Outputs|50_Reviews|10_UMN|10_Session_Logs|30_Source_Summaries|60_Indexes|45_Outputs|(^|[^0])7_AI_Information|Templates/Metadata|AI Use/(AI Weekly|AI Monthly|Clipping|Deep)" AGENTS.md CLAUDE.md HUMAN_WRITING.md 60_Claude/07_AI_Information/*.md 40_Resources/Obsidian/*.md 30_Order/Standards 30_Order/Workflows 30_Order/Templates 30_Order/00_How\ This\ Folder\ Works.md 2>/dev/null | grep -v "Jarvis OS — North Star\|North Star — Execution\|Fable Prompt\|Convergence\|Portfolio Option" | cut -c1-180`
```
74:The AI operating and memory layer: how agents read this vault and what has happened before. The **map** is this file, [[Jarvis Writing and Formatting]], and [[60_Claude/07_AI_Information/Plugins|Plugins]]. The **memory** is `Session Logs/log.md` and `AI Conversation - Summaries/`. It points at `30_Order` for the writing rules and does not duplicate them.
---dead-path sweep in instruction layer
60_Claude/07_AI_Information/Plugins.md:153:  - `10_UMN`
60_Claude/07_AI_Information/Plugins.md:157:  - `60_Claude/30_Source_Summaries`
60_Claude/07_AI_Information/Plugins.md:169:- Whether `60_Claude/7_AI_Information` should receive its own folder template later.
60_Claude/07_AI_Information/Plugins.md:177:- Daily: `60_Claude/50_Reviews/Daily`, template `30_Order/Templates/Headway Templates/Better Today.md`.
60_Claude/07_AI_Information/Plugins.md:178:- Weekly: `60_Claude/50_Reviews/Weekly`, template `30_Order/Templates/Headway Templates/Better Week.md`.
60_Claude/07_AI_Information/Plugins.md:179:- Monthly: `60_Claude/50_Reviews/Monthly`, template `30_Order/Templates/Headway Templates/Better Month.md`.
60_Claude/07_AI_Information/Plugins.md:494:- Whether `60_Claude/7_AI_Information` should replace or coexist with the typo-like empty `60_Claude/7_Al_Information`.
40_Resources/Obsidian/Jarvis Vault Architecture.md:193:- The `60_Claude/35_Outputs/` and `60_Claude/50_Reviews/` folders no longer exist. Reviews live in `30_Reviews/`. Reusable de
30_Order/Standards/Enrich/Evergreen Standard.md:10:  - "[[30_Order/Templates/Metadata/For Evergreen|For Evergreen]]"
30_Order/Standards/Enrich/Evergreen Standard.md:19:- Template: [[30_Order/Templates/Metadata/For Evergreen|For Evergreen]]
30_Order/Standards/Project Standard.md:10:  - "[[30_Order/Templates/Metadata/For Progress|For Progress]]"
30_Order/Standards/Project Standard.md:19:- Template: [[30_Order/Templates/Metadata/For Progress|For Progress]]
30_Order/Workflows/00_Workflows Index.md:32:produce        35_Outputs (with source_concepts provenance)
30_Order/Workflows/Enrichment/Output with Provenance.md:19:**Moves:** `60_Claude/20_Distilled_Notes/` + `20_Progress/` evidence → `60_Claude/35_Outputs/`
30_Order/Workflows/Enrichment/Output with Provenance.md:25:A distilled note teaches *you* (`20_Distilled_Notes`). An output is something you hand to *another person or system* (`35
30_Order/Workflows/Enrichment/Output with Provenance.md:30:2. Write the artifact in `35_Outputs/` using the output template.
30_Order/Workflows/Enrichment/Output with Provenance.md:33:5. Link it into `35_Outputs/Output Index.md` so it is findable when you need it.
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's#30_Order/Templates/Metadata/For#30_Order/Templates/Frontmatter/For#g' "30_Order/Standards/Enrich/Evergreen Standard.md" "30_Order/Standards/Project Standard.md" && sed -n '148,180p;492,496p' 60_Claude/07_AI_Information/Plugins.md | cut -c1-230; sed -n 28,36p "30_Order/Workflows/00_Workflows Index.md"; ls 30_Order/Templates/Enumerate`
```
- Templates folder: `30_Order/Templates`.
- Trigger on file creation is enabled.
- System commands are disabled.
- Folder templates are enabled for:
  - `10_UMN`
  - `20_Progress`
  - `40_Resources`
  - `60_Claude/20_Distilled_Notes`
  - `60_Claude/30_Source_Summaries`
  - `60_Claude/40_Project_Briefs`

Agent rules:

- Match the existing frontmatter schema instead of inventing new keys.
- If creating notes in configured folders, expect Templater to provide the baseline structure in Obsidian.
- If creating files outside Obsidian, manually follow the same template conventions.
- Never enable Templater system commands without explicit permission.

Needs verification:

- Whether `60_Claude/7_AI_Information` should receive its own folder template later.

### Periodic Notes

Use Periodic Notes for structured reviews, not random daily-note creation.

Vault settings:

- Daily: `60_Claude/50_Reviews/Daily`, template `30_Order/Templates/Headway Templates/Better Today.md`.
- Weekly: `60_Claude/50_Reviews/Weekly`, template `30_Order/Templates/Headway Templates/Better Week.md`.
- Monthly: `60_Claude/50_Reviews/Monthly`, template `30_Order/Templates/Headway Templates/Better Month.md`.
- Yearly is disabled.
- `workspaces-plus` has no readable manifest.
- NotebookLM resource requires authenticated access and was not locally inspectable.
- Whether `60_Claude/7_AI_Information` should replace or coexist with the typo-like empty `60_Claude/7_Al_Information`.

## Agent Rule Of Thumb
distill        20_Distilled_Notes
   ↓ stable + reused → out of the workshop
promote        10_Areas (identity)  ·  40_Resources (reference)  ·  20_Progress (active work)
   ↓ understanding → deliverable
produce        35_Outputs (with source_concepts provenance)

across all of it:  enrich existing notes in place  ·  capture AI conversations  ·  log every change
```

Better Month.md
Better Today.md
Better Weekly.md
Better Year.md
```
- `Bash` -- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in 30_Order/Standards/AI\ Loop/*.md 30_Order/Templates/AI\ Toolkit/{AI\ Conversation,Graphify\ Notes,Tool\ Logs}.md 30_Order/Workflows/Toolkit/{Graphify\ Folders,Maintaining\ Logs,Tools\ Tracking}.md 60_Claude/07_AI_Information/AI_CONTEXT.md AGENTS.md "40_Resources/Obsidian/Jarvis Vault Architecture.md" 40_Resources/Obsidian/MCP-Hub-Index.md; do sed -E 's/\[\[[^]]*\]\]//g; s/`[^`]*`//g' "$f" | grep -n "—" | sed "s#^#$f: #" | cut -c1-160; done; echo; echo "--- empty files remaining in 30_Order:"; find 30_Order -type f -size 0 | sort`
```
--- empty files remaining in 30_Order:
30_Order/Standards/Decoration Standard.md
30_Order/Standards/Editing Standard.md
30_Order/Standards/Enrich/Human Writing Standard.md
30_Order/Standards/Enrich/Plugins Usage Standard.md
30_Order/Standards/Enrich/Resources.md
30_Order/Templates/AI Toolkit/Write Logs.md
30_Order/Templates/Career/Tracking.md
30_Order/Templates/Frontmatter/For Dashboards.md
30_Order/Workflows/Enrichment/Decoration.md
30_Order/Workflows/Enrichment/Human Content Writer.md
30_Order/Workflows/Enrichment/Plugins Usage.md
30_Order/Workflows/Enrichment/Researcher.md
30_Order/Workflows/Ingestion/Conversations Loop.md
30_Order/Workflows/Toolkit/Files Tracking.md
```

## Actions Taken

**Files created:**
- `C:\Users\anant\.claude\plans\graceful-wishing-gadget.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Conversations.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Graphify Notes.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Knowledge Noting.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Logs.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Memory Management.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Orchestration.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Per Project Review.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Review System.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\AI Loop\Tool Calls.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\AI Toolkit\AI Conversation.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\AI Toolkit\Graphify Notes.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\AI Toolkit\Tool Logs.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Graphify Folders.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Maintaining Logs.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Tools Tracking.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\Jarvis Vault Architecture.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\MCP-Hub-Index.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI Conversation - Summaries\README.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\AI_CONTEXT.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Map.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Vault Rules — Complete AI Ruleset.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\AGENTS.md`

**Files modified:**
- `D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\AI\Claude OS.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\00_How This Folder Works.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\00_Workflows Index.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Workflows\Toolkit\Conversation Capture.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI\Token Optimization\Claude Optimization Master Setup.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\AI\Workflows\AI Workflow.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\Obsidian\Vault Operating System.md`
- `D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md`

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== 60_Claude/07_AI_Information ===" && find "60_Claude/07_AI_Information" -maxdepth 3 -type f -name "*.md" 2>/dev/null
echo "=== 40_Resources/Obsidian ===" && find "40_Resources/Obsidian" -maxdepth 2 -type f -name "*.md" 2>/dev/null
echo "=== 40_Resources/CS/AI ===" && find "40_Resources/CS/AI" -maxdepth 3 -type f -name "*.md" 2>/dev/null
echo "=== 30_Order ===" && find "30_Order" -maxdepth 3 -type f -name "*.md" 2>/dev/null
echo "=== root ===" && ls -la | head -30`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== 10_Areas top level ===" && ls "10_Areas" && echo "=== check for hub notes ===" && find "10_Areas" -maxdepth 1 -name "*.md" && echo "=== 20_Progress top ===" && ls "20_Progress" && echo "=== dashboard head ===" && head -40 "00_Dashboard.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- Career ---" && ls "10_Areas/Career" && echo "--- Life ---" && ls "10_Areas/Life" && echo "--- Trading ---" && ls "10_Areas/Trading" && echo "--- UMN ---" && ls "10_Areas/UMN" | head -10 && echo "--- Notes ---" && ls "10_Areas/Notes" 2>/dev/null | head -10`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "--- mcp-hub skill? ---" && find .claude/skills -iname "*mcp-hub*" 2>/dev/null && echo "--- 20_Progress/AI dir ---" && ls "20_Progress/AI" 2>/dev/null && echo "--- AI Loop file sizes ---" && ls -la "30_Order/Standards/AI Loop/" && echo "--- How to Use Claude dir ---" && ls "60_Claude/07_AI_Information/How to Use Claude"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls "60_Claude"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find "60_Claude" -maxdepth 2 -type d && echo "--- search for Outputs anywhere ---" && find . -maxdepth 4 -iname "*outputs*" -not -path "./.git/*" -not -path "./50_Archive/*" 2>/dev/null`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && python - <<'EOF'
import re
p="60_Claude/07_AI_Information/AI_CONTEXT.md"
s=open(p,encoding="utf-8").read()
parts=re.split(r'(\[\[.*?\]\])',s)
out=[]
for x in parts:
    if x.startswith("[["): out.append(x)
    else: out.append(x.replace(" — ",": "))
s="".join(out)
s=s.replace("# AI Context Manifest: Orientation + Live State","# AI Context Manifest, Orientation and Live State")
s=s.replace("in one file: it keeps Claude","in one file. It keeps Claude")
s=s.replace("instead — that","instead. That").replace("instead: that","instead. That")
s=s.replace("## Workflow Chooser: which plugin fits the job","## Workflow Chooser (which plugin fits the job)")
s=s.replace("this file: do not store","this file. Do not store").replace("this file specifically: do not","this file specifically. Do not")
s=s.replace("(this layer: agent map + memory)","(this layer, agent map and memory)")
open(p,"w",encoding="utf-8").write(s)
EOF
grep -n "—" 60_Claude/07_AI_Information/AI_CONTEXT.md`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -rEc "10_UMN|35_Outputs|50_Reviews|45_Outputs|10_Session_Logs|30_Source_Summaries|60_Indexes|[^0]7_AI_Information" --include="*.md" --include="*.mdc" --include="*.json" --include="*.ps1" --include="*.py" --exclude-dir=50_Archive --exclude-dir=.git --exclude-dir=.stversions --exclude-dir=node_modules . 2>/dev/null | grep -v ":0$" | sort -t: -k2 -nr | head -50`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls 40_Resources && echo --- && grep -nE "10_UMN|35_Outputs|50_Reviews" 00_Dashboard.md AGENTS.md CLAUDE.md HUMAN_WRITING.md 2>/dev/null; echo "--- Claude Pro Workflow path refs ---"; grep -rn "Obsidian/Claude Pro Workflow" --include="*.md" . 2>/dev/null | grep -v "50_Archive\|05_Clippings\|Session Logs" | head`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls .claude .claude/skills .claude/agents .claude/rules .claude/commands 2>/dev/null; echo ---; sed -n 1,30p "30_Order/Templates/Frontmatter/For Everything.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis/.claude/rules" && for f in what-to-read.md how-to-write.md claude-directions.md interlinking.md; do echo "=================== $f ($(wc -l < $f) lines)"; cat "$f"; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && pwd && wc -c .claude/rules/*.md`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && grep -nE "(^|[^0])7_AI_Information|10_Session_Logs|30_Source_Summaries|60_Indexes|45_Outputs|10_UMN" "40_Resources/CS/AI/Token Optimization/Claude Pro Workflow.md" "40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md" "40_Resources/CS/AI/Workflows/AI Workflow.md" | cut -c1-200; echo ---; find 30_Order -name "Conversation Capture.md"; `
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls 30_Order/Workflows 30_Order/Workflows/Toolkit 30_Order/Templates 30_Order/Standards && grep -nE "Session_Logs|Session Logs|7_AI" "30_Order/Workflows/Toolkit/Conversation Capture.md" | cut -c1-220`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && git status --short | head -40; echo ---; find 30_Order/Templates/"AI Toolkit" 30_Order/Workflows/Toolkit "30_Order/Standards/AI Loop" -type f -printf "%TY-%Tm-%Td %TH:%TM  %s  %p\n" | sort; echo ---; ls -la --time-style=long-iso 30_Order/Templates/ | head -20; git log --oneline -8 -- 30_Order`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && mv "60_Claude/07_AI_Information/How to Use Claude/Claude OS.md" "20_Progress/AI/Claude OS.md" && ls "20_Progress/AI" "60_Claude/07_AI_Information/How to Use Claude" && for f in .claude/agents/*.md; do echo "== $f"; sed -n 1,12p "$f" | grep -E "^(name|tools|model):" ; done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's/^updated: 2026-07-03$/updated: 2026-10-15/' "20_Progress/AI/Claude OS.md" && sed -n 1,16p "20_Progress/AI/Claude OS.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && f="40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md" && sed -i -e 's#60_Claude/7_AI_Information#60_Claude/07_AI_Information#g' -e 's#60_Claude/10_Session_Logs/log.md#60_Claude/07_AI_Information/Session Logs/log.md#g' -e 's#60_Claude/30_Source_Summaries#60_Claude/10_Source_Summaries#g' -e 's#60_Claude/60_Indexes#60_Claude/44_Indexes#g' "$f" && grep -nE "(^|[^0])7_AI_Information|10_Session_Logs|30_Source_Summaries|60_Indexes" "$f" | head; sed -i 's/^updated: 2026-05-28$/updated: 2026-10-15/' "$f"; echo done`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's#`30_Source_Summaries/AI Conversations/#`10_Source_Summaries/AI Conversations/#' "40_Resources/CS/AI/Token Optimization/Claude Optimization Master Setup.md" && find 30_Order -type f -size 0 | sort; echo ---; ls "20_Progress/Projects/AI Use" "20_Progress/Projects/AI Use/Claude Kit" "60_Claude/30_Reviews/AI" "60_Claude/30_Reviews/AI/Toolkit" 2>&1 | head -40`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && tail -n 6 "60_Claude/07_AI_Information/Session Logs/log.md" | cut -c1-400; echo; grep -nE "^## \[" "60_Claude/07_AI_Information/Session Logs/log.md" | tail -3; grep -cE "^## \[" "60_Claude/07_AI_Information/Session Logs/log.md"; wc -l "60_Claude/07_AI_Information/Session Logs/log.md"; sed -n 1,14p "40_Resources/CS/AI/CPR - Compress Preserve Resume.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis/60_Claude/07_AI_Information/AI Conversation - Summaries" && f="Claude Code/2026-08-19-claude-code-second-brain-claudekit-jarvis-notes-sync — Summary.md" && sed -n 1,30p "$f" | cut -c1-200; grep -n "^## " "$f"; echo ====; sed -n 1,20p "2026-07-05-cursor-mcp-failure-resolution-plan — Summary.md" | cut -c1-160`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && cat "30_Order/Templates/AI Toolkit/AI Weekly Review Template.md"; echo =====; sed -n 1,25p "30_Order/Templates/Frontmatter/For Inputs.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's/^updated: 2026-05-31$/updated: 2026-10-15/' "30_Order/Workflows/Toolkit/Conversation Capture.md" && git diff --stat -- "30_Order/Workflows/Toolkit/Conversation Capture.md" | tail -1`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -n 1,40p "30_Order/Standards/Enrich/Source Summary Standard.md" | cut -c1-260; echo =====; sed -n 1,30p "30_Order/Standards/Enrich/Evergreen Standard.md" | cut -c1-260; echo ====; sed -n 1,25p "30_Order/Standards/Internship/Internship Loop Review Standard.md" | cut -c1-300`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find 60_Claude/05_Clippings -type f -name "*.md" | wc -l; grep -n "^### Flashcards" "30_Order/Standards/Enrich/Source Summary Standard.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && cat "30_Order/Standards/Project Standard.md" | cut -c1-420; echo; echo =======; grep -n "^## \|^### " "30_Order/Standards/Internship/Internship Loop Review Standard.md"; grep -n -i -A3 "carryover escalation" "30_Order/Standards/Internship/Internship Loop Review Standard.md" | head -30 | cut -c1-420`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls 30_Order/Templates/Capability; ls "60_Claude/30_Reviews/Internship Loop" "60_Claude/30_Reviews/AI/Scheduled" 2>&1 | head; ls "10_Areas/Life/Enumerate"; ls 20_Progress/AI/Claude\ Code | head -30`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for n in "Review System" "Tool Calls" "Orchestration" "Memory Management" "Conversations" "Knowledge Noting" "Per Project Review" "Logs" "Graphify Notes" "AI Conversation" "Conversation Capture" "Log Standard" "Review Standard" "Plan Review Cadence" "Daily Workflow Standard" "Project Standard"; do echo "== $n"; find . -name "$n.md" -not -path "./.git/*" -not -path "./50_Archive/*" -not -path "./.stversions/*" 2>/dev/null; done; sed -n 1,12p "60_Claude/30_Reviews/Internship Loop/Review System.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && RS='[[30_Order/Standards/AI Loop/Review System|Review System]]' && PS='[[30_Order/Standards/Project Standard|Project Standard]]' && \
sed -i "s#\[\[Review System\]\]#$RS#g" "30_Order/Standards/AI Loop/Tool Calls.md" "30_Order/Standards/AI Loop/Per Project Review.md" AGENTS.md && \
sed -i "s#\[\[Project Standard\]\]#$PS#g" "30_Order/Standards/AI Loop/Per Project Review.md" AGENTS.md && \
grep -n "Review System\|Project Standard" AGENTS.md "30_Order/Standards/AI Loop/Per Project Review.md" "30_Order/Standards/AI Loop/Tool Calls.md" | cut -c1-200`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && echo "=== Tool log"; sed -n 1,40p "60_Claude/30_Reviews/AI/Toolkit/Tool log.md" | cut -c1-300; echo "=== Claude Kit Log head"; sed -n 1,22p "20_Progress/Projects/AI Use/Claude Kit/Log.md" | cut -c1-260; echo "=== sync scripts"; ls 30_Order/System/sync-workflow/scripts 2>/dev/null | head -20`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && ls "60_Claude/40_Project_Briefs/TradingView" | head -12; echo ---; sed -n 1,12p "60_Claude/40_Project_Briefs/TradingView/GRAPH_REPORT.md" | cut -c1-220; echo --- ; ls "60_Claude/40_Project_Briefs/TradingView/Communities" 2>/dev/null | head -3; ls "60_Claude/40_Project_Briefs/TradingView/Nodes" 2>/dev/null | head -3; echo ---; sed -n 1,30p "40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow.md" | cut -c1-260; echo ---; ls 60_Claude/40_Project_Briefs | head -20; find . -name "How to use Graphify.md" -not -path "./.git/*" | head`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && f="60_Claude/40_Project_Briefs/How to use Graphify.md" && sed -n 1,16p "$f" | cut -c1-300; grep -n "^## \|^### " "$f"; grep -n -i "health\|three numbers\|3 numbers\|manifest\|--obsidian-dir\|never.*edit\|hand-edit" "$f" | head -20 | cut -c1-300; echo ---; cat "60_Claude/40_Project_Briefs/Internship/.graphify_obsidian_manifest.json" 2>/dev/null | head -c 400`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -n '29p;38,44p;46,52p' "60_Claude/40_Project_Briefs/How to use Graphify.md"`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis/20_Progress/AI/Claude Code" && ls -la .claude_windows .claude_wsl 2>&1 | grep -i "sync-log"; head -3 .claude_windows/Sync-Log.md | cut -c1-200; sed -n 1,12p "Write Log.md" | cut -c1-160; grep -n "param\|Archive\|MaxLines\|MaxKB\|threshold" "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/sync-workflow/scripts/rotate-sync-logs.ps1" | head -10`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && find . -name "The Qualification Pipeline.md" -not -path "./.git/*"; sed -n 1,30p "20_Progress/Projects/AI Use/Claude Kit/Tool Map.md" | cut -c1-280`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && cat > /tmp/chk.sh <<'EOF'
files=(
"AGENTS.md" "CLAUDE.md"
"60_Claude/07_AI_Information/AI_CONTEXT.md" "60_Claude/07_AI_Information/Vault Map.md"
"60_Claude/07_AI_Information/Vault Rules — Complete AI Ruleset.md"
"60_Claude/07_AI_Information/AI Conversation - Summaries/README.md"
"40_Resources/Obsidian/Jarvis Vault Architecture.md" "40_Resources/Obsidian/MCP-Hub-Index.md"
"40_Resources/Obsidian/Vault Operating System.md"
"20_Progress/AI/Claude OS.md"
"30_Order/00_How This Folder Works.md" "30_Order/Workflows/00_Workflows Index.md"
"30_Order/Workflows/Toolkit/Conversation Capture.md" "30_Order/Workflows/Toolkit/Graphify Folders.md"
"30_Order/Workflows/Toolkit/Maintaining Logs.md" "30_Order/Workflows/Toolkit/Tools Tracking.md"
"30_Order/Templates/AI Toolkit/AI Conversation.md" "30_Order/Templates/AI Toolkit/Graphify Notes.md" "30_Order/Templates/AI Toolkit/Tool Logs.md"
)
for f in 30_Order/Standards/AI\ Loop/*.md; do files+=("$f"); done
for f in "${files[@]}"; do
  [ -s "$f" ] || { echo "EMPTY/MISSING: $f"; continue; }
  grep -o '\[\[[^]]*\]\]' "$f" | sed 's/^\[\[//; s/\]\]$//; s/|.*//; s/#.*//' | sort -u | while read -r l; do
    [ -z "$l" ] && continue
    case "$l" in *"<"*) continue;; esac
    b="${l##*/}"; b="${b%.md}"
    n=$(find . \( -name "$b.md" -o -name "$b.canvas" \) -not -path "./.git/*" -not -path "./50_Archive/*" -not -path "./.stversions/*" 2>/dev/null | wc -l)
    if [ "$n" -eq 0 ]; then echo "DEAD  [$f] -> $l"; 
    elif [ "$n" -gt 1 ] && [[ "$l" != */* ]]; then echo "AMBIG($n) [$f] -> $l"; fi
  done
done
EOF
bash /tmp/chk.sh 2>&1 | head -60`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's#\[\[Plugins\]\]#[[60_Claude/07_AI_Information/Plugins|Plugins]]#' 60_Claude/07_AI_Information/AI_CONTEXT.md && grep -n "Plugins" 60_Claude/07_AI_Information/AI_CONTEXT.md | head -3; echo ---dead-path sweep in instruction layer; grep -rnE "35_Outputs|50_Reviews|10_UMN|10_Session_Logs|30_Source_Summaries|60_Indexes|45_Outputs|(^|[^0])7_AI_Information|Templates/Metadata|AI Use/(AI Weekly|AI Monthly|Clipping|Deep)" AGENTS.md CLAUDE.md HUMAN_WRITING.md 60_Claude/07_AI_Information/*.md 40_Resources/Obsidian/*.md 30_Order/Standards 30_Order/Workflows 30_Order/Templates 30_Order/00_How\ This\ Folder\ Works.md 2>/dev/null | grep -v "Jarvis OS — North Star\|North Star — Execution\|Fable Prompt\|Convergence\|Portfolio Option" | cut -c1-180`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && sed -i 's#30_Order/Templates/Metadata/For#30_Order/Templates/Frontmatter/For#g' "30_Order/Standards/Enrich/Evergreen Standard.md" "30_Order/Standards/Project Standard.md" && sed -n '148,180p;492,496p' 60_Claude/07_AI_Information/Plugins.md | cut -c1-230; sed -n 28,36p "30_Order/Workflows/00_Workflows Index.md"; ls 30_Order/Templates/Enumerate`
- `cd "D:\_Anant\20_Progress\Documents\Jarvis" && for f in 30_Order/Standards/AI\ Loop/*.md 30_Order/Templates/AI\ Toolkit/{AI\ Conversation,Graphify\ Notes,Tool\ Logs}.md 30_Order/Workflows/Toolkit/{Graphify\ Folders,Maintaining\ Logs,Tools\ Tracking}.md 60_Claude/07_AI_Information/AI_CONTEXT.md AGENTS.md "40_Resources/Obsidian/Jarvis Vault Architecture.md" 40_Resources/Obsidian/MCP-Hub-Index.md; do sed -E 's/\[\[[^]]*\]\]//g; s/`[^`]*`//g' "$f" | grep -n "—" | sed "s#^#$f: #" | cut -c1-160; done; echo; echo "--- empty files remaining in 30_Order:"; find 30_Order -type f -size 0 | sort`


