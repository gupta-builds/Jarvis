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
  - "[[New Laptop Setup]]"
next: "[[Cross-Laptop Sync - Build 1 Findings]]"
---
# Cross-Laptop Sync - Rollback Procedure
## One-Line Answer
==Pause the folder first, never delete it== — pausing stops sync instantly and leaves every file untouched, while removing the folder from Syncthing's config only stops Syncthing from watching it and does not touch files on disk either, but skips that reversible middle step for no benefit.
## Why This Exists
Build 1's pre-mortem ([[Cross-Laptop Sync - Build Roadmap]]) named this a precondition, not an afterthought: Staggered versioning is Syncthing's only automatic undo, so a manual procedure has to cover everything versioning does not — a bad config, a folder pointed at the wrong path, or a sync that needs to stop *right now* while you figure out what went wrong.
## Scenario 1: Stop Syncing Immediately, Keep Everything As-Is
**Pause the folder**, not the whole app. Syncthing's own FAQ frames folder removal and disconnection as changes that only make sense once devices are already synchronized (*"It's important to do this when the folder is already in sync between your devices, as it is otherwise unpredictable which changes will 'win'"* — [Syncthing FAQ](https://docs.syncthing.net/users/faq.html)). Pausing sidesteps that risk entirely: it halts pushing and pulling without touching the folder's config or its files.
- GUI: open the folder in the Syncthing web UI (`http://127.0.0.1:8384`) and toggle **Pause**.
- REST API: `PATCH /rest/config/folders/jarvis` with body `{"paused": true}` — verified directly against this machine's running v2.1.5 instance, whose live folder schema (`GET /rest/config/folders/jarvis`) includes a `paused` boolean field.
- Resume the same way, flipping `paused` back to `false`.
This is the default move any time something looks wrong. It costs nothing to undo.
## Scenario 2: Take The Folder Out Of Syncthing Cleanly
For a bigger change — moving the vault, reconfiguring the folder from scratch, or abandoning the Dell-Acer pair — Syncthing's FAQ gives the safe order: *"Remove the folder in the Syncthing UI, move it on disk, then re-add it using the new path"* ([Syncthing FAQ](https://docs.syncthing.net/users/faq.html)).
1. Confirm the folder is fully in sync on every device that has it (check "Up to Date" state in the GUI, or `state` in `GET /rest/db/status?folder=jarvis`) before touching anything.
2. Remove the folder from Syncthing's configuration (GUI: folder settings → **Remove Folder**; REST: `DELETE /rest/config/folders/jarvis`). This only removes Syncthing's *pointer* to the folder — the FAQ is explicit that removing a folder does not delete files on disk.
3. The `.stfolder` marker file and the vault's actual content are untouched. Re-add later by pointing a new folder entry at the same path if you want sync back.
*Why not skip straight to removal instead of pausing first:* removal is safe for the files themselves, but doing it while devices are out of sync is what the FAQ calls "unpredictable" — pausing first buys time to check sync state without that risk.
## Scenario 3: Recover A File That Synced Wrong
This is what **Staggered File Versioning** is for — the safety net Build 0's pre-mortem required before Build 1 could proceed, since Syncthing has no other rollback mechanism ([Syncthing Versioning docs](https://docs.syncthing.net/users/versioning.html)).
- Every time a remote change replaces or deletes a file, the previous version moves into `.stversions/` inside the folder instead of disappearing.
- Retention is tiered, not flat: every 30 seconds for the first hour, hourly for the first day, daily for 30 days, then weekly beyond that — so recent mistakes have dense recovery points and old ones taper off automatically.
- This vault's folder is configured with `maxAge: 0` (indefinite retention — versions are never age-purged, only thinned by the tiering above) and `cleanupIntervalS: 3600` (Syncthing checks hourly for versions the tiering rules say to drop).
- To recover: find the file's history under `.stversions/` inside the Jarvis vault folder (same relative path as the original, with a timestamp suffix) and copy the wanted version back over the current file.
## What Not To Do
- Do not edit `.git` through Syncthing's sync path — it is permanently excluded via `.stignore` because concurrent writes to Git's internal object store corrupt the repository; this is why `.git` is the first line in [[Cross-Laptop Sync - Build Roadmap]]'s exclusion list, not just a convenience exclusion.
- Do not treat Syncthing versioning as a backup. Syncthing's own FAQ says so directly: *"we encourage you to use other tools to keep your data safe from your (or our) mistakes"* ([Syncthing FAQ](https://docs.syncthing.net/users/faq.html)). Git history and GitHub remain the actual backup for this vault.
- Do not remove a folder while devices are out of sync — that is the one scenario the FAQ calls out as unpredictable.
## Scenario 4: Confirm Both Laptops Are Actually Fully Synced
**Added Build 3, 2026-09-19.** "Both laptops report Up to Date" in the GUI is a per-device summary; the question that actually matters — *is device A's copy of every file identical to device B's right now* — needs the REST API's own completion check, not a separate hashing tool, per the roadmap's locked-in decision.
- `GET /rest/db/status?folder=jarvis` on a device reports that device's own local state: `state` (`idle`/`scanning`/`syncing`), `needFiles`, `needBytes`, `errors`. `needBytes: 0` with `errors: 0` means the local device thinks it has everything it should.
- `GET /rest/db/completion?folder=jarvis&device=<remote-device-id>` reports how complete *that specific remote device* is from this device's point of view: `completion` (0-100), `needBytes`, `needItems`. `completion: 100` and `needBytes: 0` mean the remote device has fully received this device's state.
- Querying `db/completion` with your own device ID (no second device paired) returns `remoteState: unknown` — it is not a meaningful self-check. This only becomes a real cross-machine answer once a genuine second device ID is in the query.
- A documented, tested script wraps both calls: [[30_Order/System/sync-workflow/scripts/check-syncthing-status.ps1]] (`D:\Users\_Anant\10_Areas\Documents\Jarvis\30_Order\System\sync-workflow\scripts\check-syncthing-status.ps1`). It reads the API key from the primary instance's `config.xml`, reports local `db/status`, then reports `db/completion` against every device configured to share the `jarvis` folder other than itself. Exit code `0` means fully synced (or no remote device paired yet, which is the honest pre-Build-4 state); exit code `1` means it found unsynced bytes, errors, or an unreachable device.
- **Verified against the live primary instance, 2026-09-19** (no second device exists yet): `db/status` returned `state: scanning`, `needBytes: 0`, `errors: 0`; the script correctly reported "no remote devices share folder 'jarvis' yet" and exited `0`. It has not been run against a real second device — that is Build 4's job, and the script needs no changes to do it: once the Acer is paired, its device ID appears in `config.xml`'s folder-device list automatically, and the script's loop already handles more than one remote device.
- Recommended use in Build 4: run the script from either laptop right after a deliberate cross-device edit, instead of eyeballing the GUI's "Up to Date" text, and treat a non-zero exit code as "wait and re-check," not "something is broken" — completion briefly dips to non-100 during normal propagation.
## Sources
- [Syncthing FAQ](https://docs.syncthing.net/users/faq.html) — folder removal/move safety, versioning-is-not-backup warning
- [Syncthing Versioning docs](https://docs.syncthing.net/users/versioning.html) — Staggered File Versioning tiers and parameters
- `GET`/`PATCH /rest/config/folders/jarvis` against this machine's running Syncthing v2.1.5 instance — verified live folder schema (`paused`, `versioning.params.maxAge`, `versioning.cleanupIntervalS`) this session, 2026-09-18
- `GET /rest/db/status` and `GET /rest/db/completion` against this machine's running Syncthing v2.1.5 instance — verified live response shape and the `remoteState: unknown` self-query behavior, 2026-09-19
