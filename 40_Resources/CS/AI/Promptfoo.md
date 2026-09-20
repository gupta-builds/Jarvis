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
# Promptfoo

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Short answer: **run once, for real, against a real second-brain-claudekit command — found a genuine weakness — but not yet promotion-decided or run again since.**

## What it is
A prompt/agent evaluation and red-teaming toolkit, with an `llm-rubric` grader for automated, structured judgment of an LLM's output against a stated rubric — used internally by OpenAI and Anthropic per its own docs.

## Install state
**Real next step executed, 2026-08-20** — cited to `Tool Map.md`'s sandbox-triage section, `sandbox/promptfoo/`. Not promotion-decided.

## The real command that worked, and what it actually found
```bash
npx promptfoo@latest eval   # against second-brain-claudekit's own /challenge command prompt
```
Model: `openai:gpt-4o-mini` (reused the same key wired for GBrain, with Anant's explicit go-ahead), grader: `llm-rubric`. **Result: 1 of 2 test cases passed.** The failure is a genuine finding, not a fluke: the rubric grader caught that `/challenge`'s counter-evidence for a "daily journaling" test idea was generic rather than a concrete counter-example — a structural weakness manual review likely wouldn't have flagged. Real evidence that promptfoo's automated grading adds something a skim doesn't.

## What it's for, if adopted
Regression-testing this repo's own `CLAUDE.md` and skills after edits — likely global if it clears the bar (per `Tool Map.md`'s own note), since prompt/agent quality isn't tied to any one project.

## WSL vs. Windows split
A CLI eval tool run against prompts/commands, not tied to the vault itself — WSL-side, alongside the other code-project tooling. If it's ever pointed at Jarvis-side skills (e.g. `/challenge`, `/llm-council`) specifically, that run would still be executed from WSL; the target being Jarvis-authored content doesn't move the tool itself Windows-side.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
