---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: agent-prompt
tier: 1
maps_to:
  - "[[Agent Prompt Template]]"
used_by:
  - "[[Prompt Cycle]]"
gold_standard: "[[60_Claude/40_Project_Briefs/CausalOps/claude code/ran/01 - Fix MCP Server Deployment and Housekeeping|Prompt 1: Fix the MCP Server Deployment]]"
notes:
  - "[[Spec and Plan Standard]]"
  - "[[Project Standard]]"
---
# Agent Prompt Standard
==A prompt note holds one task for a fresh agent session and everything that session needs, so the run does not depend on what the writer remembers.==
This is the standard for notes that hold a prompt to paste into Claude Code, Codex, or another agent: the numbered CausalOps prompts and the Internship Building System runs. It covers the prompt note and, in a second Spec, the rolling queue file that holds only the next prompt. The plan a prompt belongs to is a [[Spec and Plan Standard]] note.
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
## Headings
### Frontmatter
`project_kind: prompt`. `task` is a short slug of the job, for example `mcp-server-port-fix`. `model` is the agent and model it was written for. `status` is `active` until it runs, `complete` after the result is reviewed, `archived` once superseded. `prompt_shape: queue` marks the rolling file; it is omitted on a single prompt.
### Why This Exists
The evidence behind the task: the finding, with a file path, commit, or review reference. A hypothesis the note wrote itself is labeled as one.
> [!WARNING]
> Handing the agent a diagnosis that was never checked. State what was verified and what is assumed, and tell the agent to re-check it.
### Hard Rules
Scope limits and constraints, one line each: what to leave untouched, what must stay green, what is out of scope this round.
### Implementation Order
Numbered steps with the files touched, in the order to do them.
### Report Back
What the agent must report so the result can be reviewed: files changed, commands run with output, anything it could not do. A prompt without this gets a report nobody can check.
### What Not To Do
Optional. The two or three mistakes a past run made.
### Queue file
The queue holds only the next prompt or two, under `Prompting Guide In Use` and one `##` per prompt, and is rewritten each cycle ([[Prompt Cycle]]).
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `project_kind`, `task`, or `model` (the CausalOps `ran/` prompts have `tags`, `created`, sometimes `task`, `model`) | Add all three | Mechanical once the model is known |
| Prompt without Report Back or Hard Rules | Add the missing section from the prompt text | Judgment |
| `status: active` on a prompt that already ran | `complete` | Judgment |
| Rolling `Claude Code Prompts` or `Codex Prompts` file | Add `prompt_shape: queue`; archive files get `status: archived` | Mechanical |
| A scratch ledger from one run (Freshness Sweep Scratch) | Not a prompt: keep as `project_kind: plan` with `status: complete`, or drop it | Judgment |
## Done Conditions
- A prompt note has the four required headings, `task`, and `model`.
- Every claim in Why This Exists says whether it was verified and how.
- A finished prompt moves to `status: complete` or to the Archive note, with its result linked.
- The note passes [[Vault Lint]] for `agent-prompt` or `prompt-queue`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/CausalOps/claude code/ran/01 - Fix MCP Server Deployment and Housekeeping|Prompt 1: Fix the MCP Server Deployment]]: a cited finding, hard rules, an ordered implementation, and a report-back section. It predates `project_kind`, `status`, and `updated`, which Legacy Shapes adds.
