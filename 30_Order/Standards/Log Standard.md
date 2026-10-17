---
type: system
status: sprout
created: 2026-08-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Maintaining Logs]]"
gold_standard: "[[20_Progress/Projects/AI Use/Claude Kit/Log]]"
notes:
  - "[[Logs]]"
  - "[[Memory Management]]"
  - "[[Review Standard]]"
---
# Log Standard
==A log is a real, ongoing, dateable stream of events with a named feeder. Before creating one, name who or what keeps it fed.==
This is the policy for whether a log earns its own file, who feeds it, and when it rotates. The shape and entry format are in [[Logs]]; what a session owes the logs it writes is in [[Memory Management]]; what a periodic review of a log contains is in [[Review Standard]].
## Does it earn a file
A log earns a file when it tracks a stream distinct enough from every existing log's actual scope to survive a side-by-side comparison. Ask whether a new entry could be mistaken for one that belongs in an existing log. If yes, extend the existing log, even if its stated scope does not quite cover the new content.
Default to extending. Create a new log only when mixing would make entries noticeably harder to scan: real volume or real subject mismatch, not a hypothetical one. `Claude Kit/Log.md` earned its file because tool-qualification activity is dense enough to bury the session log.
> [!WARNING]
> Creating a log because an existing one's stated scope feels too narrow. `Write Log.md` duplicated the heading format and subject of `Claude Kit/Log.md`, was never wired to anything, and sat silent for 21 days before it was retired.
## Feeder and owner
Every log answers one question in its frontmatter: what writes to it without anyone remembering? Name the hook, scheduled script, or skill, and check that it still fires, because the mechanism's real reliability matters, not its existence. If there is no mechanism, name the person or agent responsible for feeding it.
> [!WARNING]
> Writing "manual, session discipline" without saying whose. A log with no mechanism and no named owner goes silent.
## Silence
A log silent for longer than its own stated cadence is investigated for root cause before it is fixed or retired: a broken mechanism, or a lapsed habit. It is never left ambiguous.
## Size and rotation
A narrative log over about 100 KB rotates. Entries older than the current month move unchanged to `Archive/YYYY-MM.md` beside the log, and a link to the archive stays in the log's first lines. The rule applies from now on; no existing log is rewritten to comply. `Session Logs/log.md` is about 300 KB with mixed ordering, and its first rotation happens when the owner chooses.
## Done Conditions
- The log's frontmatter names its feeder or owner, its order, and its scope.
- Before a new log is created, the check against every existing log's actual scope is recorded in one sentence somewhere findable.
- A log past 100 KB has a rotation plan, or has rotated.
## Gold Standard Example
[[20_Progress/Projects/AI Use/Claude Kit/Log]]: dated entries since 2026-07-29, each naming what was verified and linking the notes it updated. Read it beside the retired `Write Log.md`: same heading format, no named feeder.
