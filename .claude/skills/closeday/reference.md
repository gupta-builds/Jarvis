# closeday — reference

Loaded on demand from SKILL.md. Contents:
1. Scorecard template + scoring rules
2. Session log entry format

## §1 Scorecard template

Append to `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`, below the Morning Plan:

```markdown
## End of Day

### Fall Ops Scorecard

| Track              | Minimum                       | Met?       |
|---------------------|--------------------------------|------------|
| Application         | ≥1 company Current/ → Applied/ | [ ]        |
| LeetCode/CodePath   | ≥5                              | [ ] count: |
| Fall'26 class step  | one class, one step            | [ ]        |
| 4 Wins              | 4/4                             | [ ]        |

**Day Status: GREEN** (or **RED**)

> GREEN = Application met AND LeetCode/CodePath ≥5 AND at least one of (Fall'26 class step, 4 Wins) met. Everything else = RED.
> The Application row is the one that can't slide — it's the number the whole Fall 2026 Plan is judged on.

### What Actually Happened

[2-3 honest sentences about the day — what got done, what didn't, no inflation]

### Friction Fix
*(Fill if RED — one concrete behavioral change for tomorrow)*

### Preview Tomorrow
- [Top priority for tomorrow — pulled from session log carryover or plan sequence]
```

Fill checkboxes from Step 1 auto-gather + Step 2 answers. No signal for a row → leave unchecked, note "(unverified)".

Scoring:
- GREEN if LeetCode ≥5 AND ≥4 of the other 5 rows met
- RED otherwise

If RED: the friction fix must be a specific behavioral change ("Do LeetCode before opening any browser tab", not "be more disciplined").

## §2 Session log entry format

Append to `60_Claude/07_AI_Information/Session Logs/log.md`:

```markdown
## [YYYY-MM-DD] closeday | Daily close

- Note: [[10_Areas/Life/Enumerate/Daily/YYYY-MM-DD]]
- Status: GREEN / RED
- LeetCode: N problems (topic) — lc_count: N
- Study: N hours — study_today: N
- Wins: N/4 — wins_done: N
- Habits: [list from habits_done]
- Open carryover: [any unclosed items rolling to tomorrow]
- Tomorrow: [top priority]
```
