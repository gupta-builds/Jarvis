---
name: note-to-actions
description: >
  Use proactively to convert an existing note into a concrete set of
  actionable statements plus a new `action`-type note. MUST BE USED
  instead of leaving a dense brainstorm/brief/meeting note un-actioned —
  turns "what did this note actually imply I need to do" into a link-dense
  map of next steps, per the Action Standard.
tools:
  - Read
  - Write
model: claude-sonnet-5
---
# note-to-actions

## Purpose
Agent wrapper around the existing `/note-to-actions` skill (`.claude/skills/note-to-actions.md`). Per Anant directly: "an agent that converts any note into actionable statements and a new note — for having a detailed understanding of the task at hand that needs to be done." Where the skill defines the mechanics, this agent is the isolable entry point for running it as a subagent when the source note is long enough that reading it fully would otherwise flood the main window.

## Relationship to the skill
Does not duplicate the skill's instructions — invokes `.claude/skills/note-to-actions.md` per its own `type: action` note format (statements only, no checkboxes).

## Status
Scaffold — the skill is real; this agent formalizes it as a subagent per the North Star's agent standard.

## Hierarchy note
Consult `https://platform.claude.com/llms.txt` before finalizing this agent's own settings, per `second-brain-claudekit`'s `60_Claude/vault-rules/anthropic-docs-reference.md` convention.
