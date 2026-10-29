---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Deleted skills folder recovery"
started_at: 2026-10-28T23:04:59
ended_at: 2026-10-28T23:08:15
exported_at: 2026-10-28T23:33:07
duration_minutes: 3.3
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: ecd60cde-51bb-4095-98c6-2be8765502d2
status: seed
review_state: raw
created: 2026-10-28
updated: 2026-10-28
turn_count: 2
tools_used:
  Bash: 2
tokens:
  input: 6
  output: 1070
  cache_creation: 29969
  cache_read: 153272
  total: 184317
cost_usd: 0.145915
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Deleted skills folder recovery

## You

I accidentally deleted the entire skills folder while trying to delete a few plugin skills such as copilot .... The entire folder got deleted. Retrieve the folder back

## Claude

I restored the skills folder at `.claude/skills/` from git. All 28 files are back, in 19 skill folders, and `git status` is clean for that path.

Those files were all committed, so the restore is the exact committed version. The latest commit was the 23:03 auto-sync, shortly before the deletion. The folder had no files that git wasn't tracking, so nothing was lost beyond the tracked set.

The skill folders are `challenge`, `class-csci4041`, `closeday`, `distill-note`, `ideas`, `ingesting-clipping`, `llm-council`, `mcp-hub`, `mentorship`, `note-to-actions`, `ops`, `plan-it`, `project-career`, `remove-ai-slop`, `startday`, `tag-monthly`, `trace-goal`, `transcript-to-brief` and `weekly-review`.

I didn't touch the three modified clippings under `60_Claude/05_Clippings/AI Conversations/`.

The plugin skills you meant to delete (the copilot ones) most likely live in the plugin cache or `~/.claude/plugins`, not in this folder. To remove them, use `/plugin` to uninstall or disable the plugin. Deleting inside `.claude/skills` won't remove them.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && git status --short -- .claude/skills | head -50; echo ---; ls -la .claude/skills 2>&1 | head; echo ---; git ls-files .claude/skills | wc -l
```
```
 D .claude/skills/challenge/challenge.md
 D .claude/skills/class-csci4041/SKILL.md
 D .claude/skills/closeday/SKILL.md
 D .claude/skills/closeday/reference.md
 D .claude/skills/distill-note/distill-note.md
 D .claude/skills/ideas/ideas.md
 D .claude/skills/ingesting-clipping/SKILL.md
 D .claude/skills/ingesting-clipping/examples.md
 D .claude/skills/ingesting-clipping/reference.md
 D .claude/skills/ingesting-clipping/scripts/extract_pdf.py
 D .claude/skills/llm-council/llm-council.md
 D .claude/skills/mcp-hub/excalidraw-diagram.md
 D .claude/skills/mcp-hub/mcp-hub.md
 D .claude/skills/mentorship/SKILL.md
 D .claude/skills/note-to-actions/SKILL.md
 D .claude/skills/note-to-actions/references/example-action.md
 D .claude/skills/ops/ops-reference.md
 D .claude/skills/ops/ops.md
 D .claude/skills/plan-it/strategy.md
 D .claude/skills/project-career/SKILL.md
 D .claude/skills/remove-ai-slop/remove-ai-slop.md
 D .claude/skills/startday/SKILL.md
 D .claude/skills/startday/reference.md
 D .claude/skills/tag-monthly/tag-month.md
 D .claude/skills/trace-goal/trace-topic.md
 D .claude/skills/transcript-to-brief/SKILL.md
 D .claude/skills/transcript-to-brief/references/example-brief.md
 D .claude/skills/weekly-review/weekly-review.md
---
total 4
drwxr-xr-x 1 anant 197609 0 Oct 28 23:03 .
drwxr-xr-x 1 anant 197609 0 Oct 28 23:03 ..
---
28
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && git restore -- .claude/skills && git status --short -- .claude/skills; echo "exit: $?"; git ls-files .claude/skills | wc -l; find .claude/skills -type f | wc -l; ls .claude/skills
```
```
exit: 0
28
28
challenge
class-csci4041
closeday
distill-note
ideas
ingesting-clipping
llm-council
mcp-hub
mentorship
note-to-actions
ops
plan-it
project-career
remove-ai-slop
startday
tag-monthly
trace-goal
transcript-to-brief
weekly-review
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && git status --short -- .claude/skills | head -50; echo ---; ls -la .claude/skills 2>&1 | head; echo ---; git ls-files .claude/skills | wc -l`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && git restore -- .claude/skills && git status --short -- .claude/skills; echo "exit: $?"; git ls-files .claude/skills | wc -l; find .claude/skills -type f | wc -l; ls .claude/skills`

