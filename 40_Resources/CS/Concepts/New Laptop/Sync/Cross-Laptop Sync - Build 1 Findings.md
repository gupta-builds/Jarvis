---
type: concept
status: sprout
created: 2026-09-18
tags:
  - concept
  - laptop
  - ai-infrastructure
notes:
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[Cross-Laptop Sync - Rollback Procedure]]"
next: "[[Cross-Laptop Sync - Build Roadmap]]"
---
# Cross-Laptop Sync - Build 1 Findings
## One-Line Answer
==Obsidian has no dirty-buffer protection against an external write== — the moment a file changes on disk, Obsidian's live editor reloads it instantly and silently, discarding whatever was in the editor that hadn't already been flushed to disk, with no warning, no conflict file, and (on this single-machine test) no version saved either.
## Test Setup
Real test, not a simulation on paper. Steps actually run this session on the Dell:
1. Created `60_Claude/00_Inbox/_sync-filelock-test.md` and opened it in a live Obsidian pane via the `jarvis` MCP bridge.
2. Asked the user to type an unsaved line (`MY UNSAVED EDIT`) into the open note without pressing save or clicking away.
3. Externally overwrote the file via a shell heredoc (`cat > file <<EOF ... EOF`) — bypassing Obsidian's own vault API entirely, the same way Syncthing's puller writes an incoming remote change.
4. Read the file back through the `jarvis` MCP bridge and asked the user to report what the live editor actually showed.
## What Actually Happened
**Finding 1 — Obsidian does not hold edits unsaved for long.** Before the external write even ran, reading the file from disk already showed the user's typed line appended. Obsidian's editor is not a classic dirty-buffer-until-Ctrl+S model; it flushes to disk on its own within seconds of typing. This undercuts the premise of "make an edit but don't save" as a distinct state — by the time any external process could plausibly interleave, the edit is usually already on disk.
**Finding 2 — the external write wins instantly, with zero warning.** After the shell overwrite, the user reported: *"The message was changed to the external write... in an instant with no warnings."* No dialog, no reload prompt, no diff view — the editor just now showed the external content in place of everything that had been there, including the user's own line.
**Finding 3 — no conflict-copy file was created.** Checked `.obsidian/` and `.trash/` for anything matching `*conflict*` or the test filename after the overwrite — nothing. Obsidian's own file-recovery/conflict mechanisms did not engage for a plain external filesystem write.
**Finding 4 — Staggered Versioning did not capture the discarded version.** No `.stversions/` folder exists in the vault after this test. This is consistent with [Syncthing's versioning docs](https://docs.syncthing.net/users/versioning.html), which describe versioning as triggering *"when replaced or deleted on a remote device"* — i.e. versioning is tied to Syncthing's own sync puller acting between two devices, not to any arbitrary external process editing a file it happens to be watching. On this Dell-only pilot there is no remote device, so nothing about this test exercised the versioning path at all. **This is the load-bearing caveat for Build 2**, not a settled result.
**Git showed nothing, correctly.** `git status`/`git diff` on the test file confirmed it was untracked the whole time — new files created this session were never staged or committed, so git has no history to compare and this check does not speak to the sync behavior either way. Recorded here because the user asked for it to be checked, not because it confirms anything about Obsidian or Syncthing.
## What This Single-Machine Test Can and Cannot Answer
Can answer: what Obsidian's editor does when the underlying file changes out from under it — silent reload, no conflict UI, no built-in protection against losing in-flight typing.
Cannot answer: whether Syncthing's own conflict-resolution (the `.sync-conflict-<date>-<time>-<deviceID>.ext` files it creates when two devices modify the same file within its detection window) or Staggered Versioning actually engages for a real incoming remote change — that requires the exact mechanism this build's pre-mortem flagged as genuinely untested, and needs a second device.
## What Build 2 Must Still Check
- Edit the same file on both Dell and Acer within Syncthing's conflict-detection window and confirm a real `.sync-conflict-*` file appears (Syncthing's documented multi-device behavior), rather than the silent last-write-wins this single-machine test showed.
- Confirm a version actually lands in `.stversions/` when the *incoming* change is a genuine cross-device Syncthing pull, not just a local external edit — Finding 4 shows the single-device case doesn't exercise this path at all.
- Given Finding 1 and Finding 2 together: the practical risk during Build 2 isn't "will Syncthing corrupt a file" — it's "will an in-progress edit on one machine get silently overwritten by an incoming sync from the other machine before the local edit is flushed." Test this directly: type on the Dell, then immediately trigger a conflicting sync from the Acer, and see whether it produces a `.sync-conflict-*` file or a silent loss like this test showed.
## Sources
- [Syncthing Versioning docs](https://docs.syncthing.net/users/versioning.html) — versioning trigger condition ("replaced or deleted on a remote device")
- This session's own test, 2026-09-18, run against the live Obsidian instance and this machine's filesystem
