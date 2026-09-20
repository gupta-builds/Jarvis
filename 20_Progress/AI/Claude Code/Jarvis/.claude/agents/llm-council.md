---
name: llm-council
description: >
  Use proactively to run a hard, genuinely uncertain decision through the
  5-advisor council instead of answering directly. MUST BE USED when the
  user says "council this," "run the council," "war room this," or asks
  a real should-I-X-or-Y question with real stakes. Isolates the 5
  parallel advisor reads + peer-review pass in its own context so that
  reading never floods the main conversation window.
tools:
  - Read
  - Grep
  - Glob
model: claude-sonnet-5
---
# llm-council

## Purpose
Agent wrapper around the existing `/llm-council` skill (`.claude/skills/llm-council.md`, 5-advisor decision council). Two sources of truth, per Anant directly: Andrej Karpathy's original `llm-council` (`sandbox/llm-council` in second-brain-claudekit, git remote `karpathy/llm-council`) as the methodology's source of truth, and `aiwithremy/claude-skills-llm-council` (`sandbox/claude-skills-llm-council`) as the more detailed adaptation the current skill is already built from. This agent exists so the council's heavy parallel-read work runs isolated (Part 5.2's rationale: a side task that would flood the main window) rather than inline.

## Relationship to the skill
The skill (`skills/Jarvis/llm-council/llm-council.md`) already implements the real mechanism end-to-end (frame → 5 advisors in parallel → anonymized peer review → chairman synthesis, chat-only, no file output). This agent invokes that skill rather than re-implementing it — do not duplicate the skill's instructions here.

## Status
Scaffold — the skill is real and working; this agent file formalizes it as an isolable subagent per the North Star's agent standard, not yet wired as an actual dispatch target.

## Hierarchy note
Consult `https://platform.claude.com/llms.txt` before finalizing this agent's own settings, per `second-brain-claudekit`'s `60_Claude/vault-rules/anthropic-docs-reference.md` convention.
