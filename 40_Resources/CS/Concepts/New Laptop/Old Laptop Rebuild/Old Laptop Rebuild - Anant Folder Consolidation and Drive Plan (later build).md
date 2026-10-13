---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - windows
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
  - "[[Google Drive Sync Policy]]"
  - "[[Cross-Laptop Sync - Known Failure Modes and Prevention]]"
next: "A separate later build, not Build 5. Before it starts, the user answers the open questions at the bottom."
---
# Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)

## One-Line Answer
==D:\_Anant becomes the one main folder on both laptops, everything under D:\Users\_Anant moves into it first and is reviewed afterwards, and Google Drive mirrors it on the Dell; this is a later build, and Build 5 only records it.==

## What the user decided (2026-10-13, verbatim intent)
- `D:\_Anant` is the main folder, because it is what the Acer already uses.
- The whole `D:\Users` tree will be deleted in the end. Nothing there is deleted in Build 5.
- Everything moves first. Desktop, Downloads, Documents and the other known folders move too, and the Jarvis vault lives under `D:\_Anant`. Keep-or-delete decisions come after the move, in detail, later.
- Dell: Google Drive mirrors the whole `D:\_Anant` folder, and the crucial files are read from that mirror.
- Acer: a Google Drive backup, not a mirror. Which files inside `_Anant` get backed up, and how, is still open.
- This is not part of the WSL build. It is recorded here so the later build has the context.

## Live facts that matter (checked 2026-10-13)
| Item | Live state |
|---|---|
| Known folders now | Desktop to `D:\Users\_Anant\Inbox`; Documents to `D:\Users\_Anant\10_Areas\Documents`; Downloads to `D:\Users\_Anant\Downloads`; Pictures to `...\Media`; Music to `...\Music`; Videos to `...\Videos`; Favorites to `...\Favorites` |
| `D:\_Anant` now | `00_Inbox` (empty), `20_Progress` (4.9 MB), `30_Resources` (115 MB), `99_Archive` (12 GB) |
| `D:\Users\_Anant` now | `10_Areas` 11 GB (Documents with the vault, Finance, Job & Apartment, Real coding, UMN, `.tmp.driveupload`), `Inbox` 28 MB, `Media` 27 MB, `Downloads`, `Music`, `Videos`, `Favorites`, `99_Archive` |
| Vault root, Dell now | `D:\Users\_Anant\10_Areas\Documents\Jarvis` |
| Vault root, Acer | `D:\_Anant\20_Progress\Documents\Jarvis` |
| Google Drive on the Dell | `GoogleDriveFS` is NOT running; three accounts; account 2 has drive letter H and a "computer root" id, account 3 has letter I; DriveFS data on C: is 0.85, 2.82 and 0.04 GB; no `ContentCachePath` value set |
| References to the old path | 35 vault notes plus Windows script logs; Syncthing, Obsidian, the Jarvis MCP and `AGENTS.md` also carry vault paths |

## Contradictions with the earlier notes (flagged, not decided)
1. "Mirror is running correctly on this laptop" versus live: Drive is not running, the backed-up folder list is stale, and two accounts have drive letters (a sign of streaming, not proof). Mirror versus stream is still undetermined.
2. [[Google Drive Sync Policy]] says never sync `.git`, `node_modules`, `.venv`, build output, AI configs, secrets or either Obsidian vault, and that Drive cannot exclude subfolders. Mirroring the whole `D:\_Anant` would include the Jarvis vault (which Syncthing already syncs, so two sync tools would write the same files and produce `.sync-conflict` files) and the regenerable trees (CSCI 5304 `.conda`, `node_modules`). The policy's own answer is to separate at the top level, so those trees need a home outside the mirrored folder, or the policy must be changed on purpose.
3. The earlier instruction "I do not want anything to depend on Google Drive data yet" versus "crucial files come from the Drive mirror". Treated as superseded by this decision. The policy note still says GitHub and local D: are the source of truth and the Google One term is one year; those risks stay.
4. Google's documentation: the Drive for desktop page says configuration of NEW backup folders in the app ends from 2026-06-15 (existing folders keep syncing), and its Mirror option mirrors My Drive into a folder the user selects; the local cache folder cannot be a subfolder of a mirrored folder. It does not describe mirroring an arbitrary existing folder. So "Drive mirrors D:\_Anant" most likely means making `D:\_Anant` the location of the mirrored My Drive, which downloads the cloud content into it and uploads what is inside. That is different from a backup. Verify in the app before the build. Source: [Customize Drive for desktop settings](https://support.google.com/drive/answer/13470231) (read 2026-10-13).
5. The Acer uses `20_Progress\Documents` for Documents and the Dell uses `10_Areas\Documents`. After the move the Dell should take the Acer's path so both laptops have the same vault root. `10_Areas` does not exist in `D:\_Anant` today.

## Proposed canonical tree (to confirm in the later build)
| Folder in `D:\_Anant` | Holds | Comes from |
|---|---|---|
| `00_Inbox` | Desktop, Downloads, loose files to sort | `Users\_Anant\Inbox`, `Users\_Anant\Downloads` |
| `10_Areas` | Finance, Job & Apartment (ongoing areas) | `Users\_Anant\10_Areas\Finance`, `...\Job & Apartment` |
| `20_Progress` | Documents (the Jarvis vault at `20_Progress\Documents\Jarvis`, same as the Acer), UMN, Real coding | `Users\_Anant\10_Areas\Documents`, `...\UMN`, `...\Real coding` |
| `30_Resources` | Media, Music, Videos, Favorites, reference files | `Users\_Anant\Media`, `Music`, `Videos`, `Favorites` |
| `99_Archive` | everything old; both `99_Archive` trees merge here | `D:\_Anant\99_Archive`, `Users\_Anant\99_Archive` |
| outside the mirrored folder | regenerable trees (`.conda`, `node_modules`, `.venv`), `D:\Apps`, `D:\Cache`, `D:\AI`, `D:\WSL`, `D:\Backup`, `D:\Quarantine` | stay on D: as now |

## Order of work for the later build
1. Read-only: confirm the Drive mode in the app (Preferences, Folders from Drive), list what each account backs up, decide the Acer backup scope.
2. Take a snapshot: sizes, file counts and a hash manifest of `D:\Users\_Anant` (same volume, so the move itself is a rename and needs no extra space).
3. Close Obsidian, pause Syncthing and Drive. Move each folder into `D:\_Anant`. Change each known folder through Windows (Properties, Location) or the User Shell Folders keys, one at a time, and check each.
4. Fix the places that hold the old vault path: Syncthing folder path, Obsidian vault registration, Jarvis MCP, `AGENTS.md`, VS Code workspace files, the WSL notes (`/mnt/d/Users/_Anant/...`).
5. Re-run the hash manifest and compare. Only then review what to keep.
6. Empty `D:\Users` goes to `D:\Quarantine` for review before any delete.
7. Bring the regenerable trees out of the mirrored area, then turn the mirror on.

## Duplicate and tidy candidates found so far (report only, nothing moved)
- `BS\DCIM`: Camera 3.52 GiB and Entire Copy 7.82 GiB, hash report in [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]].
- `.tmp.driveupload` (0.5 GiB, 6010 extensionless files), empty school folders under `99_Archive\Backup`, the stray `syncthing.exe` and node installer in the old Inbox, the CSCI 5304 `.conda` environment.

## Open questions for the user
- Does the Dell Drive run as Mirror or Stream today?
- Which Acer folders does the Acer Drive backup cover, and where does it keep Desktop, Downloads and Pictures?
- Should Jarvis stay Syncthing-only and be kept out of the Drive mirror?
