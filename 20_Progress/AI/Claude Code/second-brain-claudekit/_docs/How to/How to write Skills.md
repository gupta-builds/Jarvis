# How to write a Skill

Practical walkthrough. The checkable spec lives in `60_Claude/Standards/Skill Standard.md` (including its "Anthropic's Own Authoring Guidance" section, sourced 2026-09-05 from `platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices`) — this doc doesn't repeat that content, it tells you the order to do things in. Start from `60_Claude/Templates/skill-template.md`.

## 1. Confirm it's a skill, not a command or an agent

A skill carries the logic; a command is often just the trigger that invokes it. Reach for a skill when the same multi-step procedure needs to run the same way every time it's invoked, regardless of what triggers it. If the task needs a fresh, isolated context and its own bounded tool list, it's an agent instead — see `How to write Agents.md`.

## 2. Write the frontmatter first, and treat its limits as real constraints

`name`: max 64 chars, lowercase/numbers/hyphens, gerund form (`processing-pdfs`, not `pdf-helper`), never containing `"anthropic"` or `"claude"`. `description`: third person, max 1024 chars, no XML tags — this is the one thing that's pre-loaded into the system prompt for every skill at startup, competing with every other skill's description for the same tokens before any one skill is read in full. Write it to answer "when should Claude reach for this," not just "what does it do."

## 3. Keep the body under 500 lines — split, don't pad

Only the frontmatter is pre-loaded; the body is read once the skill is selected, but it still costs real tokens then. Default assumption: Claude is already very smart. Cut anything that doesn't change behavior. If the real content needs more than 500 lines, split into sibling reference files **one level deep only** — a file that links to a file that links to a file gets partially read (`head -100`), not read in full.

## 4. Pick the right freedom tier per instruction, not one tier for the whole skill

- **High** (prose heuristics) — multiple valid approaches, judgment matters.
- **Medium** (parameterized pseudocode) — a preferred pattern exists, some variation is fine.
- **Low** (an exact command, no variation) — the step is fragile or order-dependent. Say so explicitly, the way the docs' own migration example does: "do not modify this command or add flags."

A skill that's mostly high-freedom prose but has one genuinely fragile step (a specific CLI invocation, a specific file-write order) should mark that one step low-freedom explicitly — don't let it read the same as the surrounding prose.

## 5. Give it an output-format contract, using one of the two documented patterns

- **Template pattern** — a literal, fixed shape, for output that must be consistent. `.claude/agents/loop-verifier.md`'s `## Output format` section (real, local) is the gold-standard example: it ends in a required, non-hedged `## Verdict` line.
- **Examples pattern** — concrete input/output pairs, for output where a template alone under-specifies the real behavior.

Don't invent a third pattern per skill — pick whichever of these two actually fits.

## 6. If the skill is a multi-step procedure or needs self-correction, name that explicitly

- **Checklist workflow** — a literal checklist Claude copies into its own response and checks off, when skipping a step is the real failure mode.
- **Feedback loop** — "run a validator → fix → repeat" until it passes, before proceeding. The validator can be a script or a reference doc to compare a draft against.

## 7. Don't design a self-improvement mechanism — there isn't one to design

Anthropic's docs describe no automatic way for a skill to revise itself. What's real and repeatable instead: write 3+ evaluation scenarios (a JSON `{skills, query, files, expected_behavior}` shape, run by hand) *before* writing extensive instructions, then iterate with a **Claude-A / Claude-B** loop — one instance authors/refines the skill, a fresh instance tests it on real tasks, and a human brings Claude-B's specific observed failures back to Claude A. If a real need arises to track *how a skill performed over many separate invocations* (not just one iteration session), that's a different, adjacent problem — see `60_Claude/Patterns/skill-agent-invocation-log.md`, which is about logging invocations for later review, not about the skill improving itself.

## 8. Check it against the Standard's Done Conditions before promoting

`60_Claude/Standards/Skill Standard.md`'s Done Conditions are the actual promotion gate — don't skip straight to `tested-tools/` without checking them.
