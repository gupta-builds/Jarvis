---
type: note
status: sprout
created: 2026-09-13
updated: 2026-09-13
course: Life
track:
  - laptop
prerequisites:
  - "[[Ubuntu - WSL]]"
  - "[[New Laptop Setup]]"
related:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[Old Laptop Decommission Checklist]]"
tags:
  - note
---
# Google Drive Sync Policy

## Why this note exists

The user believed this policy was already written down somewhere in this folder — verified 2026-09-13 that it was not. This note is the first real record of it. It governs Google Drive's desktop "back up folders from your computer" feature specifically, not the still-undecided cross-laptop sync tool (Syncthing/Tailscale, see [[New Laptop Setup#Cross-laptop scope]]) — those are separate systems.

## The rule

Sync an original, non-regenerable piece of content. Never sync anything a tool can rebuild from something else (git history, a package manager, a compiler).

**Sync:** documents, PDFs, slides, forms, spreadsheets, notes, write-ups, exported reports, photos, videos, financial records, applications.

**Never sync:** `.git`, `node_modules`, `.venv`/`venv`, `__pycache__`, `dist`, `build`, `bin`, `obj`, `target`, `.dll`/`.pdb`/`.exe` build output, `.claude`/`.codex`/`.cursor` tool config/cache, Docker build contexts/images, `.idea`/`.vs` IDE metadata.

## Why this matters beyond clutter

[[Ubuntu - WSL#Contrast / What It Is Not]] already establishes the technical reason independently: WSL's entire filesystem lives inside one opaque `.vhdx` file — Drive/OneDrive can only back up files they can see inside, so nothing WSL-side was ever syncable at the file level anyway. This policy generalizes that same boundary to Windows-side code too.

## Concrete evidence this was a real, live problem (2026-09-13)

A direct Drive search for "Backup" during this session's cleanup surfaced individual raw `.py` files actively uploading from the "UMN" backed-up folder, owned by the UMN university account (`gupt0479@umn.edu`): `BackupRead_BackupWrite.py`, `BackupEventLog.py`, `BackupSeek_streamheaders.py` — loose coursework source files, not documents. This is what "too much being synced, including the .git folder" looked like in practice.

## Applied to the current 7-folder Drive Desktop backup list

| Folder | Verdict |
|---|---|
| `00_Inbox`, `20_Progress`, `30_Resources`, `Finance`, `Job & Apartment` | Keep as-is — pure documents |
| `Real coding` (1.3GB) | Remove from the backup list entirely. GitHub is its real backup. Extract any standalone write-ups/PDFs first if worth keeping. |
| `UMN` (3.3GB) | Split: create a `UMN-Documents` folder with only syllabi/slides/PDFs/notes, sync that instead. Anything that's a real repo (`.git`, Dockerfile, build output, an assignment like the Backup*.py files above) stays out of Drive. |

## Known tool limitation driving the "split, don't configure" approach

Google Drive for desktop cannot exclude a subfolder by pattern inside a folder already selected for backup (confirmed 2026-09-13, still true) — selective sync only works at the top level. There is no `.gitignore`-equivalent inside the app. The fix has to be structural: physically separate document-only content into its own top-level folder before adding it to the backup list, not a settings toggle. Source: [Google Drive Community](https://support.google.com/drive/thread/13418864?hl=en).

## Account-lifespan risks this policy also has to account for

- **UMN Google Workspace account** — access ends at graduation/affiliation end. Treat it as disposable; nothing meant to last belongs there permanently, only currently-relevant coursework documents.
- **Google One subscription on `anantmahi721@gmail.com` is a 1-year term.** Don't treat the current generous storage as permanent. GitHub (code) and the local D: drive stay the actual source of truth; Drive is a convenience copy, not the archive of record.

## Open item

The "Entire Move" → "Laptop Backup (45GB)" shared shortcut's actual target folder could not be resolved via the Drive API from this session (tried three search approaches, 2026-09-13). Needs the user to paste the real folder URL or move it into My Drive directly before its contents can be reviewed.
