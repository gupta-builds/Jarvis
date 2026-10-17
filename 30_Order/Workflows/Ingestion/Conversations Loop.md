---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - conversation-memory
system_kind: workflow
serves: "[[Conversations]]"
trigger: Weekly, during the AI tools review, and whenever capture looks wrong.
notes:
  - "[[Conversation Capture]]"
  - "[[Review Standard]]"
  - "[[Summaries-to-Create]]"
  - "[[Knowledge Noting]]"
---
# Conversations Loop
Keep conversation capture complete and summarized in proportion, so the archive is searchable and the few sessions that mattered are distilled. Conversation Capture handles one session; this handles all of them.
## Use when
At each weekly AI tools review, after a hook, script, or machine change, and when a Session Index looks empty or a session is missing.
## Steps
1. Count this week's exported session notes per tool and machine, and compare with ground truth: `~/.claude/projects/` session files for Claude Code, composers for Cursor. A gap is a finding in the [[Review Standard]] review.
2. Open one `00 - Session Index.md` per machine folder. Its Dataview `FROM` path must be its own folder; a stale path after a layout change is the usual cause of an empty index.
3. List the week's sessions with a decision signal: many turns, high cost, many files touched, an open question. Skip the rest.
4. Open [[Summaries-to-Create]], add the sessions that matter, and work from the top. Only about 10 summaries exist for roughly 490 sessions, and most sessions never need one.
5. For each chosen session, run [[Conversation Capture]] from step 2.
6. Route what the summaries decided with [[Knowledge Noting]]: decisions to project `next:`, understanding to distilled notes.
7. Append one session-log line: sessions expected against exported, summaries written, items promoted.
## Do not
Do not summarize every session, edit a raw export, or delete the `.exported/` markers that stop duplicates.
## Done when
- Exported counts match ground truth, or the gap is recorded as a finding.
- Every Session Index queries its own folder.
- The backlog has been worked and the log line written.
