---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: agent-prompt
tier: 1
maps_to:
  - "[[Agent Task Prompt Template]]"
used_by:
  - "[[Prompt Cycle]]"
gold_standard: "[[60_Claude/40_Project_Briefs/CausalOps/claude code/ran/01 - Fix MCP Server Deployment and Housekeeping|Prompt 1: Fix the MCP Server Deployment]]"
notes:
  - "[[Spec and Plan Standard]]"
  - "[[Project Standard]]"
---
# Agent Prompt Standard
==A prompt note holds one task for a fresh agent session and everything that session needs, so the run does not depend on what the writer remembers.==
This is the Standard for notes that hold a prompt to paste into Claude Code, Codex, or another agent, and, in a second Spec, the rolling queue file that holds only the next prompt. It is not the plan a prompt belongs to ([[Spec and Plan Standard]]) and not the status page of the project ([[Project Standard]]).
## Spec
```json
{
  "family": "agent-prompt",
  "tier": 1,
  "match": {"type": "project", "kind": "prompt", "path": "^(20_Progress|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {"prompt_shape": "queue"}},
  "legacy_match": [
    {"path": "^60_Claude/40_Project_Briefs/CausalOps/claude code/"},
    {"type": "project", "path": "^20_Progress/Internship/Building System/Runs/Prompt "}
  ],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "task", "model"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Why This Exists", "Hard Rules", "Implementation Order", "Report Back"],
  "optional_headings": ["What Not To Do", "Status", "Related Notes"]
}
```
```json
{
  "family": "prompt-queue",
  "tier": 1,
  "match": {"type": "project", "kind": "prompt", "path": "^20_Progress/", "where": {"prompt_shape": "queue"}, "where_not": {}},
  "legacy_match": [{"type": "project", "path": "^20_Progress/Internship/Building System/Runs/(Claude Code|Codex) Prompts( - Archive)?\\.md"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "prompt_shape", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Prompting Guide In Use"],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/` or `60_Claude/40_Project_Briefs/`, next to the plan it serves. The queue file only in `20_Progress/`. |
| File name | The prompt's number and task (`P1 - Exporter Correctness`). Unique in the vault. |
| Kind | `type: project` with `project_kind: prompt`. The queue also has `prompt_shape: queue`. |
| Status | `active` until it runs, `complete` after the result is reviewed, `archived` once superseded. |
## Headings
### Frontmatter
- **Write:** `project_kind: prompt`, `task` (a short slug of the job), `model` (the agent and model it was written for), `status`, dates, `tags`. `prompt_shape: queue` marks the rolling file and is omitted on a single prompt.
- **Length:** one line per key.
- **Never:** a prompt with no `type`, `status`, or `project_kind`. The five CausalOps `ran/` prompts carry only `tags`, `created`, `task`, and `model`, so none appears as a project note.
- **Right:** `task: exporter-correctness`
- **Wrong:** `tags: [causalops, prompt, memory-layer, claude-code, mcp, bugfix]`
### Why This Exists
- **Write:** the evidence behind the task: the finding, with a file path, commit, or review reference. A hypothesis the note wrote itself is labeled as one.
- **Length:** a short paragraph and a few bullets.
- **Never:** a diagnosis handed to the agent unchecked. State what was verified and what is assumed, and tell the agent to re-check it.
- **Right:** `What is still wrong, by reading the code:`
- **Wrong:** None seen.
### Hard Rules
- **Write:** scope limits and constraints, one line each: what to leave untouched, what must stay green, what is out of scope this round.
- **Length:** three to eight lines.
- **Never:** a rule that does not say what is protected.
- **Right:** `Verify by actually curling the running container.`
- **Wrong:** None seen.
### Implementation Order
- **Write:** numbered steps with the files touched, in the order to do them.
- **Length:** a numbered list; a code block only where the exact code matters.
- **Never:** a step with no file or command.
- **Right:** `Rebuild and start only the`
- **Wrong:** None seen.
### Report Back
- **Write:** what the agent must report so the result can be reviewed: files changed, commands run with output, anything it could not do.
- **Length:** one paragraph.
- **Never:** a prompt without it. It gets a report nobody can check.
- **Right:** `If the curl verification fails, say so explicitly rather than reporting the fix as complete`
- **Wrong:** None seen.
### What Not To Do
- **Write:** optional. The two or three mistakes a past run made.
- **Length:** two or three bullets.
- **Never:** a general warning.
- **Right:** None yet.
- **Wrong:** None seen.
### Queue file
- **Write:** only the next prompt or two, under `Prompting Guide In Use` and one `##` per prompt, rewritten each cycle ([[Prompt Cycle]]).
- **Length:** one to two prompts.
- **Never:** an accumulating history. Finished prompts move to the Archive note.
- **Right:** `## Prompting Guide In Use`
- **Wrong:** `## Session 4`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| A prompt note has the four headings, `task`, and `model` | A fresh session needs the evidence, limits, order, and report shape | Lint, checks 1 and 2 |
| Every claim in Why This Exists says whether it was verified and how | An unchecked diagnosis sends the agent after a guess | Reader |
| A finished prompt becomes `complete` or moves to the Archive note, with its result linked | A stale `active` prompt reruns old work | Reader |
| The queue holds at most the next two prompts | A long queue is a history, not a plan | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `type`, `status`, `updated`, or `project_kind` (the five `ran/` CausalOps prompts) | Add them; `model` is already there | Mechanical once the model is known |
| A prompt in a fence with `<role>`, `<context>`, `<tasks>`, `<rules>`, `<report>` tags and `## Run Record` (the nine P-prompts in `Prompts - Acer/`) | `<context>` becomes Why This Exists, `<rules>` Hard Rules, `<tasks>` Implementation Order, `<report>` Report Back. The Spec headings are not yet in these notes; owner's decision whether the tags replace them | Judgment |
| `status: active` on a prompt that already ran | `complete` | Judgment |
| Rolling `Claude Code Prompts` or `Codex Prompts` file (`Codex Prompts` has `status: idle`) | Add `prompt_shape: queue`; archive files get `status: archived` | Mechanical |
| A scratch ledger from one run (Freshness Sweep Scratch) | Not a prompt: keep as `project_kind: plan` with `status: complete`, or drop it | Judgment |
## Done Conditions
- A prompt note has the four required headings, `task`, and `model`.
- Every claim in Why This Exists says whether it was verified and how.
- A finished prompt moves to `status: complete` or to the Archive note, with its result linked.
- The note passes [[Vault Lint]] for `agent-prompt` or `prompt-queue`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/CausalOps/claude code/ran/01 - Fix MCP Server Deployment and Housekeeping|Prompt 1: Fix the MCP Server Deployment]]: a cited finding, hard rules, an ordered implementation, and a report-back section. It does not pass lint: no `type`, `status`, `updated`, or `project_kind`.
Measured 2026-11-07: prompts 16 notes, 0 pass; queue 2 notes, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 01 - Fix MCP Server Deployment and Housekeeping (gold) | `60_Claude/40_Project_Briefs/CausalOps/claude code/ran/` | All four sections | Four frontmatter keys |
| P1 - Exporter Correctness | `20_Progress/Projects/AI Use/Conversations/Prompts - Acer/` | `project_kind`, `task`, `model`; evidence by reading code; a report shape | The four Spec headings (it uses tags) |
| Claude Code Prompts | `20_Progress/Internship/Building System/Runs/` | The queue | `project_kind`, `prompt_shape`; accumulates sessions |
