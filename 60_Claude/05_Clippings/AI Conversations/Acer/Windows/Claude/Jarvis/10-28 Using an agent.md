---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Using an agent"
started_at: 2026-10-28T23:07:14
ended_at: 2026-10-28T23:07:44
exported_at: 2026-10-28T23:33:03
duration_minutes: 0.5
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 2b773709-34d5-42b1-b269-ea16c46f060e
status: seed
review_state: raw
created: 2026-10-28
updated: 2026-10-28
turn_count: 5
tools_used: {}
tokens:
  input: 6
  output: 666
  cache_creation: 28707
  cache_read: 92015
  total: 121394
cost_usd: 0.130702
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Using an agent

## You

How to use an agent?

## Claude

An agent is a subagent that Claude spawns to do a task in its own separate context. Its tool output stays out of your main conversation, and only its final report comes back.

**Ways to use one**

1. **Name it in your request.** Say something like "use the vault-curator agent to health-check the vault" or "run the learning-agent on this

## You

[Request interrupted by user]

## You

So there is no / command for an agent? What about commands?

## Claude

Right, there's no `/agent-name` shortcut. Agents and commands are separate things.

**Agents**
- `/agents` is the built-in command to list, create, edit, and delete agents.
- To run one, ask for it by name in plain language ("use the vault-curator agent to check the vault"), or type `@` and pick it from the autocomplete menu.
- Claude can also launch one on its own. Many of yours (`anti-slop-editor`, `daily-operator`, `meeting-operator`) say "use proactively" or "MUST BE USED" in their descriptions, so Claude picks them when your request matches.

**Commands**
- Built-in commands like `/help`, `/agents`, `/config`, and `/clear` manage the session itself.
- Your `/startday`, `/closeday`, `/ingest-clipping`, `/weekly-review`, `/llm-council` and similar are skills. A skill is a saved set of instructions that loads into the current conversation when you type its `/name`.
- Some skills hand work off to an agent. For example, your CLAUDE.md says to use `/llm-council` or the `llm-council` agent for high-stakes decisions, and `/remove-ai-slop` pairs with `anti-slop-editor`.

**Which to use**
- Use a `/` skill for a repeatable workflow you want to trigger by name.
- Use an agent when the task is big or noisy and you want it isolated from your main chat, or when you want a specialist with restricted tools.

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_

