---
type: evergreen
status: sprout
created: 2026-06-01
updated: 2026-06-01
tags:
  - system
  - standards
notes:
  - "[[Concept Template]]"
  - "[[Summary to Distilled]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[HUMAN_WRITING]]"
---
# Concept Standard
==A concept note answers four questions in order — what is it, how does it work, what is it not, where has it shown up — and earns its keep on the third and fourth.==
This is the content standard for `concept` notes: course concepts and definitions that recur and will appear again on an exam, in an interview, or in another course. A summary records what a source said; a concept note records what *you* understand and can use. The decisive sections are the contrast and the failure modes — a concept with only a definition is a flashcard, not a note.
## Maps To
- Template: [[Concept Template]]
## Used By Workflow
- [[Summary to Distilled]] — concepts promoted out of source summaries are written here; course concepts are also created directly in Obsidian via the folder template. Read this Standard before writing either way.
## Per-Heading Standard
### Frontmatter
`type: concept`, `status: sprout`, `course` and `track` set, `mastery_level: 0` (0–10 integer — not the old `mastery (1/10)` string key), and the relational fields `prerequisites:`, `used_in:`, `evidence:` as wikilink lists (empty `[]` until real). `tags: [concept]`.
> [!WARNING]
> Reusing the invalid `mastery (1/10):` key (a parenthesis in a YAML key), or filling `evidence:` with notes that do not exist. Keep relational fields empty rather than fake.
> [!WARNING] 2026-10-02: `mastery_level` was quoted in the template itself
> `Concept Template.md` shipped with `mastery_level: "0"` (a quoted string) instead of `mastery_level: 0` (a bare integer) for over a month before this was caught, and every concept note created from the template inherited the bug. A quoted number is a real, silent problem in this vault, not cosmetic: Obsidian's Properties panel renders a quoted number as its Text type instead of Number, Dataview's numeric comparisons/sorts (`WHERE mastery_level > 5`) silently fail or sort lexically ("10" before "2") against a string, and the Capability Engine's spaced-repetition scheduling (see [[40_Resources/Obsidian/Plugins/Spaced Repetition and Learning Loops]]) depends on `mastery_level` being a real number. The template is now fixed (`mastery_level: 0`, unquoted) - if you ever see `mastery_level: "N"` with quotes on a concept note, that note was created before the fix and its quotes should be stripped.
> **The general rule this incident demonstrates:** before adding or changing any frontmatter property, on a template or a real note, decide its actual YAML type on purpose and write it accordingly - never let a quote appear "just in case." Numbers (`mastery_level`, any future score/count/weight field) are bare and unquoted. Wikilinks (`course:`, `area:`, `evidence:` entries) are quoted strings (`"[[Note]]"`) because the YAML parser would otherwise choke on the brackets. Dates (`created:`, `updated:`) are bare, unquoted, ISO `YYYY-MM-DD` - Obsidian reads that shape as its native Date type, and quoting it downgrades it to Text and breaks date-based Dataview sorts the same way. Plain enum-like strings (`status:`, `track:`) can go either way stylistically, but should stay consistent within one template. Empty relational fields are `[]`, never an empty quoted string. When a template is touched for any other reason, spend ten seconds checking every property's type is still what Dataview/the Properties panel actually need, not just what looks tidy.
### One-Line Answer
The concept in a single sentence, as you would say it to a peer. This is the `==highlight==` anchor for the note.
*Density:* one sentence, wrapped in `==...==`.
> [!WARNING]
> A textbook definition copied verbatim, or two sentences. "A team is a group with interdependent work, shared goals, and mutual accountability" — peer-level, not dictionary-level.
### Mechanism
**How** it works, not just what it is. Bold named sub-concepts. Use `$...$` for any notation and explain each symbol in prose.
*Density:* the core of the note — enough to actually use the concept. Break into the concept's natural parts (the Teams note uses the **IPO** breakdown: Inputs → States → Processes → Outputs).
*Plugins:* `**bold**` on each named part; `*Label:*` for sub-group intros; callouts only where a real warning or tip lives.
> [!WARNING]
> Listing features instead of explaining the driving mechanism. Teams § mechanism explains *why* a bad team underperforms a strong individual (coordination cost, loafing, groupthink), not just that teams have inputs.
### Contrast / What It Is Not
The nearby concept it gets confused with, and the distinction. Skip only if nothing is genuinely confusable.
*Density:* one to three contrasts, each naming the confusable pair and the line between them.
> [!WARNING]
> Omitting this section because it is the hardest to write. Teams contrasts task conflict (improves decisions) vs relationship conflict (destroys effort), and cohesion vs groupthink.
### Failure Modes / Misconceptions
Where the concept breaks or where people get it wrong. A real misconception beats a generic warning. Anchor with a `> [!WARNING]` callout.
*Density:* the genuine traps — Teams lists six ("calling any group a team", "treating storming as failure", "assuming virtual teams need less structure").
> [!WARNING]
> A vague "be careful here" with no specific misconception. Name the wrong belief and the correction.
### Evidence From This Vault
Verified wikilinks to notes where this concept actually appeared — a lecture, a project, a worked example. This is the retrieval path; Grep each link first.
*Density:* link the lecture week and any project that used it.
> [!WARNING]
> An empty section, or links to notes that do not exist. Teams links its Week 5 lecture and Chapter 17.
### Flashcards
`#cards/[track]`, 3–8 cards testing the mechanism and the contrast, not the label. Bold only terms meant to be hidden in review.
> [!WARNING]
> Cards that test the definition ("Team::a group...") instead of the distinction ("Task vs relationship conflict::task conflict can improve decisions; relationship conflict damages attention").
## Done Conditions
- The note explains how the concept works and what it is not, not merely what it is.
- One highlight (the One-Line Answer); failure modes and contrast are both present and specific.
- `evidence:` / Evidence section link real vault notes that prove the concept was used.
- 3–8 mechanism/contrast flashcards on the correct deck.
- Passes all 16 points of [[Vault Rules — Complete AI Ruleset]] Part 12.
## 2026-09-20 Normative Production Addendum
These rules are mandatory for current course work and operationalize the per-heading requirements above.
### Creation timing and source coverage
Create or update a concept when the scheduled topic is known and its textbook note/source has landed, preferably before lecture. A concept may be derived from a textbook, NotebookLM-derived textbook output, lecture slides, Python/notebook code, PDF/paper, lab, project, or repeated question. Search for an existing concept or alias first. After lecture, reconcile the pre-lecture note with the user's live capture and the actual emphasis or corrections.
### Mechanism minimum
The Mechanism section must state inputs/state, causal sequence, invariants/assumptions, output, complexity or limitations when relevant, a source-grounded example, and a failure boundary. Programming concepts additionally need code shape/types and test implications; math/AI concepts need conditions, representation, and decision procedure.
### Provenance and exam enrichment
Every claim must trace to a real source; label inference and unresolved questions. Verify every wikilink and keep `evidence:` empty rather than inventing a link. NotebookLM is an input for textbook-derived understanding, not an authority that permits unsupported claims. When an exam is near, deepen relevant concepts with derivations, worked examples, comparisons, common traps, and links to practice, then review and extend their mechanism/contrast flashcards.
### Final gate
A concept is not done if it only defines a term, has no real contrast/failure mode, points to unverified notes, or cannot support explaining and applying the mechanism without reopening the source.
## Gold Standard Example
- [[Teams and Team Effectiveness]] — mechanism-dense (IPO breakdown), explicit contrasts (task vs relationship conflict, cohesion vs groupthink), six named traps, and real course examples. It predates the current template heading names but demonstrates the depth this Standard requires under each.
