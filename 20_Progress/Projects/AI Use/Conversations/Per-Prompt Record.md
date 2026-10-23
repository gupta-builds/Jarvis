---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - design
project_kind: spec
next: Build B3 in the build plan: a hook script that writes this record's event lines, then measure its cost on a real session.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
---
# Per-Prompt Record
## What This Is
==The unit of tracking is one typed prompt and everything the agent did until the next one, stored as a few hundred bytes of facts a hook can write for free and a person or a small model can read in under a minute.==
Designed 2026-10-22 from the sources in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]] and the machine facts in [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit]]. Nothing here is built. A prompt is the right grain for three reasons: the hooks share a `prompt_id`; a record this short fits a small local model (the A-MEM small-model runs and the Dunivin one-code-per-prompt result both work on short inputs, while AgenTracer shows small models fail on long traces); and a review of 20 to 30 prompts fits a weekly hour. This machine produced 32 to 130 prompts a week between 2026-09-14 and 2026-10-22 (432 in total in `history.jsonl`).
Source tags: **D** documented hook or telemetry field (docs, read once; the exact names are in [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]), **O** observed in this machine's transcript, **G** read from git, **C** computed by the digest script, **H** written by the human, **L** proposed by the local model.
## Fields
| Group | Field | Meaning | Source |
|---|---|---|---|
| Identity | `prompt_id`, `session_id`, `ts`, `machine`, `cwd`, `project` | Which prompt, where | D (`prompt_id`, `session_id`, `cwd`), C |
| | `model`, `effort`, `permission_mode`, `claude_version`, `git_branch` | How the agent was set up | D (`effort`, `permission_mode`), O (`version`, `gitBranch`, model on assistant entries) |
| Prompt | `text` (redacted), `length`, `command_name`, `source` | What you asked; whether it was a slash command or pasted | D (`prompt`, `UserPromptExpansion`), O (`promptSource`, `origin`) |
| Start context | `context_tokens_start`, `loaded_instruction_files[]` | How full the window was; which CLAUDE.md and rules loaded | O (`usage` on the prior assistant entry, deduplicated), D (`InstructionsLoaded`: `file_path`, `memory_type`, `load_reason`) |
| Work | `tools[]`: `name`, `target`, `ok`, `error`, `ms`, `result_bytes` | Every tool call, one line each | D (`tool_name`, `tool_input`, `duration_ms`, `PostToolUseFailure.error`), O (result length) |
| | `commands[]` | First word and exit state of each shell command | C from `tool_input` |
| | `files_read[]`, `files_written[]` | Paths touched, mapped to vault folder | D, C |
| | `skills[]`, `subagents[]`, `mcp[]` | Skill name and trigger; subagent type, tokens, tool uses; MCP server and tool | D (telemetry `skill_activated`, `subagent_completed`; `SubagentStop`), O (`Agent`, `Skill` tool calls) |
| | `permission_denials[]`, `compactions[]` | Blocks and context squeezes in this prompt | D (`PermissionDenied`, `PreCompact` and `PostCompact`) |
| End | `stop_reason`, `last_message_head`, `claims_done`, `verified_after_last_edit` | How the turn ended; whether Claude said "done" and any test, lint, or build ran after the last edit | D (`Stop.last_assistant_message`, `StopFailure`), C |
| Cost | `tokens_out`, `tokens_cache_read`, `tokens_cache_creation`, `duration_s` | What the prompt used | O (`usage`, deduplicated by message id and request id), O (`turn_duration`) |
| Next | `next_prompt_class`: `continue`, `pushback`, `new_task` | What you said next | C (pattern rules), L, H |
| Outcome | `commits[]`, `agent_lines_kept_7d` | Commits within the prompt's window; share of agent-written lines still unchanged a week later | G, C |
| Review | `codes[]`, `first_failure_note`, `model_flags[]`, `human_decision` | The weekly review's verdict on this prompt | H, L |
Token and cost fields must come from the transcript, because no hook payload carries usage. They must be deduplicated: the exporter currently sums every line and overstates totals 2.2 to 2.5 times in two sampled sessions ([[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]]).
## Shape
One JSON object per line, written by an async hook, appended to a per-machine file. Example with invented values:
```json
{"prompt_id":"p-0042","session_id":"d4e37e22","ts":"2026-10-22T05:40:11Z","project":"Jarvis","model":"claude-sonnet-5-5","permission_mode":"auto","text":"fix the sync log header","context_tokens_start":61200,"loaded_instruction_files":["CLAUDE.md","AGENTS.md"],"tools":[{"name":"Read","target":"30_Order/System/sync-workflow/README.md","ok":true,"ms":41,"result_bytes":4227},{"name":"Edit","target":"30_Order/System/claude-workflow/README.md","ok":true,"ms":88,"result_bytes":310}],"files_written":["30_Order/System/claude-workflow/README.md"],"stop_reason":"end_turn","claims_done":true,"verified_after_last_edit":false,"duration_s":38}
```
The hook writes `tools[]` rows as they happen (`PostToolUse`, `PostToolUseFailure`) keyed by `prompt_id`; a digest script folds them into one prompt record afterward. Raw event lines never leave the machine they were written on.
## Where it lives
- Raw event lines: `30_Order/System/claude-workflow/logs/events-<machine>.jsonl`, in the same folder the capture-health state files use. That folder is already ignored by git and Syncthing, which avoids the two-writer conflicts seen on the exported notes.
- What the other laptop and the review see: a weekly generated digest note with the folded records for the sampled prompts and the counts. That is small, synced, and rebuildable.
- Raw transcripts stay where Claude Code puts them, kept longer with `cleanupPeriodDays` (build B0), because two sources in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]] favor the raw record over summaries of it: the Meta-Harness ablation in the set-aside list (full traces beat summaries) and LongMemEval in the supporting list (summarized values lose information).
## What the record deliberately leaves out
Assistant prose beyond the final message head, thinking blocks, tool result bodies, and pasted documents. The prompt text is redacted by the same rules as the exporter plus a block on anything that looks like a pasted file; `history.jsonl` is never copied.
## Corrections
*2026-10-22.* The claim above that `logs/` is "already ignored by git and Syncthing" is wrong for a new file. `.gitignore` and `.stignore` list specific names (`capture-health-*.json`, `git-auto-sync.log`, and a few more), so `events-*.jsonl` would be tracked and synced. Phase P6 adds the ignore lines and proves them with `git check-ignore -v`. Also, `prompt_id` is documented as absent until the first user input. Events stay on each machine, cover every directory the owner uses with Claude Code, and are never copied into a synced note except as ids and counts.
## Non-Goals
Not a replacement for the transcript, and not scored. The record has no quality score; the review decides what was wrong, and the code list in [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]] is the vocabulary.
