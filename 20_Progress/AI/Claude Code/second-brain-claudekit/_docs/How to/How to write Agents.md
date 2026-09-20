# How to write an Agent

Practical walkthrough. The checkable spec lives in `60_Claude/Standards/Agent Standard.md` (including its "Anthropic's Own Subagent Mechanics" section, sourced 2026-09-05 from `code.claude.com/docs/en/sub-agents` and `.../hooks`) — this doc doesn't repeat that content, it tells you the order to do things in. Start from `60_Claude/Templates/agent-template.md`.

## 1. Confirm it needs a fresh, isolated context — that's the actual reason to write an agent

A subagent's context window is fresh on every invocation: no parent conversation history, no skills already invoked, no files the parent session already read. It only gets its own file's body (as its full system prompt, replacing Claude Code's default entirely), the delegation task message, the CLAUDE.md hierarchy, a git-status snapshot, and any preloaded `skills`. If the task genuinely needs that isolation (a long, focused run with its own tool allowlist), write an agent. If it just needs a repeatable procedure the *same* context can run, write a skill instead.

## 2. Write the mandate as if the agent has amnesia about everything except this file

Because of the isolation above, **a rule the parent session already established is invisible to the agent unless this file states it directly, or the task message repeats it.** This is the single most common way an agent silently drifts off-mandate — not a bad rule, a rule that was never actually delivered.

## 3. Bound `tools` to exactly what the mandate needs — never copy-paste another agent's list

State the literal, comma-separated tool list. If an allowlist is the wrong shape for this mandate (more natural to say what it can't do), use `disallowedTools` instead.

## 4. Add `memory` only when the agent has a real reason to remember something across separate invocations

This is the actual, documented mechanism closest to "a self-improving agent" — not autonomous self-modification, a `MEMORY.md` file the agent reads and writes each run:

| Scope | Path | Use when |
|---|---|---|
| `user` | `~/.claude/agent-memory/<name>/` | The memory is useful across every project this agent runs in |
| `project` | `.claude/agent-memory/<name>/` | Shareable via git, scoped to this one project |
| `local` | `.claude/agent-memory-local/<name>/` | This machine only, gitignored |

The first 200 lines / 25KB auto-load into context each run; tell the agent in its own Rules section to curate past that, not let it grow unbounded. **Good candidate:** an agent that redoes the same lookup or research from scratch on every invocation with nothing carried forward — memory turns that into a cache. **Don't add it speculatively** to an agent that has no such repeated-lookup problem.

## 5. Add `model`, `permissionMode`, `maxTurns`, `isolation: worktree`, or preloaded `skills` only if the mandate genuinely needs them

Same "bounded, not copy-pasted" discipline as `tools` — an unused field is a maintenance cost with no real benefit.

## 6. Write "What You Do Not Do" — this is the section most agent files skip, and the one that determines whether the agent stays a specialist

An explicit negative-space list. A mandate without a stated boundary drifts the first time a task is ambiguous — this is what keeps the agent from quietly becoming a second copy of the main session.

## 7. Give it an output-format contract if it produces a repeatable artifact

Same two documented patterns as a skill (see `How to write Skills.md` §5) apply here too — `.claude/agents/loop-verifier.md`'s fixed `## Output format` / required `## Verdict` line is the real, local example both this repo's Skill and Agent Standards already point to.

## 8. If you want to know whether this agent is actually running well over time, that's a monitoring question, not an authoring one

Two genuinely different problems, easy to conflate:
- **Does this specific agent's mandate need it to audit something else's live state** (like `loop-verifier` auditing the pipeline's test suite, GitHub Actions history, and vault state)? That's a normal agent job — build it into the mandate and Workflow When Invoked.
- **Do you want to know, across many separate invocations, whether *this agent itself* ran well** (how often, what it concluded, whether it needed correction)? That's invocation-level telemetry, not something the agent does to itself — see `60_Claude/Patterns/skill-agent-invocation-log.md` for the real mechanism (`SubagentStart`/`SubagentStop` hooks, which already carry `agent_id`, `agent_type`, and `last_assistant_message`) and its honest three-tier split of what's mechanically capturable versus what needs a human review pass.

## 9. Check it against the Standard's Done Conditions before promoting

`60_Claude/Standards/Agent Standard.md`'s Done Conditions are the actual promotion gate.
