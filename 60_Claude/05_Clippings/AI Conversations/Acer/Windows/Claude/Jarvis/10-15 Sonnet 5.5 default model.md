---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Sonnet 5.5 default model"
started_at: 2026-10-15T17:05:57
ended_at: 2026-10-15T17:53:10
exported_at: 2026-10-28T16:15:21
duration_minutes: 47.2
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 53cf7585-a302-4715-b2d7-fd52300dbf30
status: seed
review_state: raw
created: 2026-10-15
updated: 2026-10-28
turn_count: 5
tools_used: {}
tokens:
  input: 2
  output: 1480
  cache_creation: 27341
  cache_read: 43442
  total: 72265
cost_usd: 0.132856
model:
  - "claude-sonnet-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Sonnet 5.5 default model

## You

Claude always tends to default to the model - sonnet 5 inside this repo, or maybe default on widnows. Change the setting to be the sonnet 5.5 model which was lauched recetnly. This should be global and for this project

## Claude

To set the model to Sonnet 5.5, use the `/config` command — it lets you pick the default model both at the user level (global, applies to all projects) and at the project level (overrides just for this repo).

Run `/config`, then set the model to Sonnet 5.5 twice: once in your global/user settings and once in this project's settings (it'll prompt you to choose scope, or you can open it from within this project directory for the local override).

If you'd rather I edit `settings.json` directly (global `~/.claude/settings.json` and this project's `.claude/settings.json`) instead of going through `/config`, let me know and I'll make that change.

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/config</command-name>
            <command-message>config</command-message>
            <command-args></command-args>

## You

<local-command-stdout>Set model to [1mDefault (Sonnet 5.5 · Efficient for routine tasks)[22m</local-command-stdout>

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_

