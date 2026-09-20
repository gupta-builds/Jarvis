---
type: index
status: sprout
created: 2026-09-07
updated: 2026-09-07
tags:
  - index
  - moc
  - fall2026
  - builds
notes:
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]"
  - "[[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]]"
next: "Pick the tool stack for the Jarvis automations weekend project (Gmail, GCal, mobile-to-Obsidian) - currently unscoped"
---
# Fall 2026 Builds
This is the build-project counterpart to [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] - that note maps what gets studied this fall, this one maps what gets built. Everything here answers to the same frame in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]: none of these get more hours than the internship push, and each one exists either because it's already real and worth maintaining, or because it produces a concrete interview story. Written 2026-09-07 against real files, not memory - where a claim can't be verified from inside Jarvis, that's stated outright instead of rounded up.

## Map

**TradingView** already has real guardrails against fabricated data and execution language (`20_Progress/AI/Claude Code/Trading View/CLAUDE.md`), but the `Trading View/` folder in this vault is only a synced mirror of instructions - README, CLAUDE.md, AGENTS.md, Setup.md, and a Sync-Log that just records periodic file-copy timestamps. There's no `src/`, no `.kiro/`, no actual code here, so its real build state can't be verified from Jarvis. Its own two docs disagree: CLAUDE.md (edited 2026-08-10) says the current phase is "Month 1 - Data Ingestion Foundation" with strategy work explicitly gated behind it; README.md (edited 2026-08-21, eleven days more recent) claims a "year-ahead base" is already complete on `main` - ingestion, a brain closed loop, factor math, fundamentals (FMP/SEC), a four-gate promotion harness, and paper-test contracts. Neither claim is confirmed from here. The Fall goal, regardless of which status is current: a basic UI to look at and test features, a self-improving ingestion system, and real notes on the specific market niche worked into an actual strategy - matching the repo's own Roadmap (`live-data shakeout → RankIC/Kronos validation → agents on evidence packets → UI/charts`). Every guardrail in CLAUDE.md still applies to whatever gets written this fall, including strategy notes: no execution language, no fabricated data, confidence always capped by real data quality.

**Portfolio** is a mature, active build - Next.js 16, Sanity CMS, Clerk auth, an Orby chatbot with an eval harness, security hardening phases 1 through 5, an SEO/AEO strategy, and a Blog section already implemented per `20_Progress/Projects/CS/Portfolio/frontend/Ran/08 - Blog, Contact & Footer.md`. What's new as of 2026-09-07: v2 ships first (the current build), but real blog hosting and posting ramps up in what the user calls "v3" - a term that doesn't exist anywhere else in the vault yet, just stated intent, not a scoped iteration. Once v3 deploys: publish weekly, share resources, post about each one on LinkedIn, and (a "maybe," not a commitment) explore organic AI-generated ad marketing across social platforms. Two real monetization goals, both currently unscoped: ads/sponsors for individual posts, and some form of income generation on the subdomain itself. None of the mechanisms for either are chosen yet.

**ClaudeKit / the agentic OS visualization** carries over unchanged from the original scope: `second-brain-claudekit` already runs a real qualification pipeline (sandbox → tested-tools → promotion) and syncs Windows ↔ WSL via Unison, with a known, unresolved permission-bit failure on the Windows side visible in its own `Sync-Log.md`. This is maintenance on infrastructure the internship-research-loop's 24/7 discovery automation already depends on, not a new build.

**Jarvis daily use, alongside The Plan's sync** also carries over unchanged - Jarvis gets used daily as the actual second brain it's built to be, and getting The Plan's sync fully active is still an open item with no system built for it yet.

**Arc (Learning Tracker) is dropped**, reversing its "carried over, not dropped" status from the original scope. Its planning docs live at `20_Progress/Projects/CS/Arc/` - a 5-sprint roadmap and a data-model sketch, no code ever written, per the Summer close-out's own verdict ("Planning docs exist but don't count as a real scope - no code"). They're slated for deletion but that hasn't happened yet - nothing in this session deleted them.

**Jarvis automations** is the one genuinely new, unscoped build this session: a weekend (no date set yet) spent building real automations across Gmail, Google Calendar, and other information-providing tools, plus a pipeline that ingests videos shared from the phone - Reels, YouTube videos watched - landing in Obsidian somehow. `20_Progress/Projects/Automations/` already exists as a folder but is completely empty - nothing built, nothing scoped. Two vault notes are worth checking before choosing a tool stack: `10_Areas/Career/Internships/Contacts/Outreach Discovery & Automation Status.md` already ruled n8n out for LinkedIn specifically (login-walled, actively detected) - whether that verdict extends to Gmail/GCal automation is a real open question, not assumed; and `40_Resources/Obsidian/Plugins/AI Automation and Local Interfaces.md` may already cover relevant local-automation options worth reading first instead of starting from zero.

**Hackathons** - the user referenced "other hackathons coming up, enrolled for" but no specific hackathon, date, or enrollment record exists anywhere in the vault as of this session. `10_Areas/Career/Hackathon/Hackathons.md` holds the judge-credibility playbook and prep checklist, not a roster of what's actually signed up for. This is a real gap: name the specific hackathons once they're confirmed, don't assume the playbook alone covers it.

## Evidence Discipline
The user asked directly for "systematic proof notes" going forward - every claim above gets checked against a real file, a real commit, or an explicit "unverified" flag, the same Implementation-Status convention [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]] already runs on. This note follows that convention rather than inventing a separate proof-note format. Per the user's own instruction, the next step after this note is a deeper information-gathering pass across everything discussed this session, then - on a future prompt, not this one - sub-notes get written for exactly how each build actually gets done. Nothing beyond this map gets built or written until that prompt.

## Status
| Build | State as of 2026-09-07 | Fall target |
|---|---|---|
| TradingView | Unverifiable from Jarvis - docs disagree (see Map) | Basic UI, self-improving ingestion, market-niche strategy notes |
| Portfolio v2 | Mature, active, real | Ships initially |
| Portfolio "v3" / blog | Doesn't exist as a scoped plan yet | Weekly posts once deployed, LinkedIn promotion, ads/sponsors, subdomain income - all mechanisms unchosen |
| ClaudeKit / agentic OS | Real pipeline running, one known sync bug | Windows/WSL permission-bit failure root-caused |
| Jarvis daily use + Plan sync | Ongoing, no dedicated system | Plan sync fully active |
| Arc (Learning Tracker) | Planning docs only, no code | Dropped - docs pending deletion |
| Jarvis automations | Empty folder, nothing scoped | Real Gmail/GCal/mobile-to-Obsidian automations built and running |
| Hackathons enrolled | No record in the vault | Name them once confirmed |

## Links
- Priority frame: [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]].
- Execution cadence and Systems table: [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]].
- Study/certification counterpart to this note: [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]].
