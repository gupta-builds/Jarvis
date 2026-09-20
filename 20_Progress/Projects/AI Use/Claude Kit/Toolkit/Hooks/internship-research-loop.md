---
type: evergreen
status: sprout
created: 2026-09-06
updated: 2026-09-06
tags:
  - claude-kit
  - hooks
  - internship-research-loop
notes: []
next: "Neither hook writes to a log file — both only print a reminder to the transcript and exit. The mechanism this project would need to actually register a skill/agent run is one hook-block away, not a new capability — see 60_Claude/Patterns/skill-agent-invocation-log.md (second-brain-claudekit)."
---
# internship-research-loop — Hooks

Real inventory of `.claude/hooks/` in `gupta-builds/internship-research-loop`, both files read directly this session. No links out from this note on purpose — this project's Toolkit layer is still being built out.

Both hooks share the same three traits, worth stating once rather than per-hook: **bash**, not PowerShell (unlike second-brain-claudekit's own `.ps1` hooks); **advisory-only** — neither ever denies or blocks anything, both only inject `additionalContext` for the model to see; **fails open** on any parse problem (`set -u`, empty-value guards, `jq -r ... // empty`, exit 0 on anything unrecognized).

## vault-write-guard.sh

**File:** `.claude/hooks/vault-write-guard.sh` · **Trigger:** `PreToolUse`

Fires before any of `mcp__jarvis__vault_write`/`vault_patch`/`vault_move`/`vault_delete` or the `jarvis-fs` write/edit/move tools — a no-op for anything else. For `vault_delete` specifically, its message names that this is the one Jarvis call the repo always asks approval for (per `.claude/rules/mcp-permissions.md`) and reminds the invoking session to confirm this is a single, human-approved deletion, not part of a batch. For the write/patch/move calls, it reminds the session to confirm the human consent gate already happened (per `.claude/rules/jarvis.md`) and that the note shape matches CLAUDE.md's note-template contracts before the write lands. **Its own file is explicit that it is not the real gate** — `settings.json`'s `"ask"` permission entry for `vault_delete` is the actual enforcement; this hook only adds context alongside that, it doesn't duplicate it.

**Use case:** runs automatically on every vault-write-shaped tool call in this repo — nothing to invoke, nothing to type.

**How-to resource:** `https://code.claude.com/docs/en/hooks` — `PreToolUse`'s documented ability to actually block (via exit code / JSON decision) is real but deliberately unused here; this hook is a real, working example of choosing the advisory path on purpose rather than by omission.

## review-reminder.sh

**File:** `.claude/hooks/review-reminder.sh` · **Trigger:** `PostToolUse` (matched to `Write|Edit|MultiEdit`)

Fires after any Write/Edit/MultiEdit whose file path falls under this repo's own convention-sensitive set — `core/filter.py`, `core/relevance.py`/`core/classify.py`, `vault_writer/validate.py`, `run_pipeline.py`/`recheck.py`, or anything under `ingestion/*.py` — and is a no-op for every other file. Each matched path gets its own specific reminder naming *which* of the four load-bearing conventions (from CLAUDE.md) is most relevant to the file just touched (e.g. `vault_writer/validate.py` → the fail-closed write-gate cost-ordering rule specifically, not a generic "be careful" message), then points the session at `/review-loop-change` before committing/pushing.

**Use case:** runs automatically on every edit to one of the five convention-sensitive path patterns — the just-in-time nudge toward `/review-loop-change` that this repo's own CLAUDE.md assumes happens, per its own skills table.

**How-to resource:** same hooks docs. Real, working example of a `PostToolUse` hook doing targeted, path-matched messaging rather than one generic reminder for every edit — the `case "$rel" in ... esac` block is the whole mechanism.

## What neither hook does yet — a real, current gap, not a design flaw

Per the Agent Standard's research (second-brain-claudekit, `60_Claude/Standards/Agent Standard.md`): `SubagentStop`'s hook payload already carries `agent_id`, `agent_type`, and `last_assistant_message` — everything needed to log "which agent ran, what it concluded" without parsing prose — but **no `SubagentStop` hook exists in this repo's `settings.json` at all**, and neither of the two hooks above writes to a log file; both only print a reminder to the transcript and exit. Registering every skill/agent run for later review (the "how well did it do over time" question) is one hook-block away, not a new capability to invent.
