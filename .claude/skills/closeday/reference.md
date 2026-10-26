# closeday - reference

Loaded on demand from SKILL.md. Contents:
1. Scorecard template and scoring rules
2. Session log entry format
3. Daily Loses line format and rules

## §1 Scorecard template

Append to `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`, below the last section:

```markdown
## End of Day

### Scorecard

| Track | Target | Met? |
|---|---|---|
| [Daily Floor row 1: track] | [its target] | [ ] |
| [Daily Floor row 2: track] | [its target] | [ ] count: |
| [Daily Floor row 3: track] | [its target] | [ ] |
| Wins | 4/4 | N/4 |

**Day Status: GREEN** (or **RED**)

### What Actually Happened

[2-3 honest sentences about the day: what got done, what didn't, no inflation]

### Friction Fix
*(Fill if RED: one concrete behavioral change for tomorrow)*

### Preview Tomorrow
- [Top priority for tomorrow, from the weekly note, session-log carryover, or an open Lose]
```

The rows mirror today's Daily Floor table, in order, so the scorecard never names the term. "Met?" comes from the `floor_*` toggles and "Wins" from `wins_done`. No signal for a row: leave it unchecked and write "(unverified)".

Scoring:
- GREEN if the application floor row is met AND the problems row reaches its target AND at least one of (the class-step row, 4/4 wins) is met.
- RED otherwise.
- Open Loses never change the status. They are shown in Preview Tomorrow instead.

If RED, the friction fix is a specific behavioral change ("Open DSA.md before any browser tab"), not "be more disciplined". It should answer the `fix` of the most recent Lose when one fits.

## §2 Session log entry format

Append to `60_Claude/07_AI_Information/Session Logs/log.md`:

```markdown
## [YYYY-MM-DD] closeday | Daily close

- Note: [[10_Areas/Life/Enumerate/Daily/YYYY-MM-DD]]
- Status: GREEN / RED
- Problems: N (topic), lc_count: N
- Study: N hours, study_today: N
- Wins: N/4, wins_done: N
- Floor: N/3, floors_done: N
- Loses: N new, N open in total (oldest N days)
- Tomorrow: [top priority]
```

## §3 Daily Loses line format

```
- [ ] [the promise, as the weekly note, the calendar or the toggle named it] [why:: ...] [fix:: ...] [from:: weekly|calendar|win|floor|other] [since:: YYYY-MM-DD]
```

Rules:
- One line per promise. The text is the promise itself, not a feeling about it.
- `why` and `fix` are the user's words. A missing one is `(unanswered)`.
- `since` is the date the promise first slipped and never changes. A carried line keeps it.
- Marks: `[ ]` open, `[x]` made up, `[>]` carried (written by `/startday`), `[-]` dropped on purpose with the reason in `why`.
- A toggle that was never meant for the day (a rest day) is not a Lose. The user says so in Step 3 and the toggle stays false with no line.
- A day with no Loses is written as no lines. Say "No promises slipped" in the chat summary only after all three sources were checked.
