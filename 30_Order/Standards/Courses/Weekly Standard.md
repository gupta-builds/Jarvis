---
type: evergreen
status: sprout
created: 2026-06-01
updated: 2026-06-01
tags:
  - system
  - standards
notes:
  - "[[Week Template]]"
  - "[[00_Workflows Index]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[HUMAN_WRITING]]"
---
# Course Week Standard
==A week note fuses lecture and textbook into one synthesis that resolves what each source alone leaves ambiguous — the synthesis section is the point, not an afterthought.==
This is the content standard for `class` / `input_kind: lecture` week notes. Current courses file these at `20_Progress/Degree/<Course>/Weekly/Week - N.md`; older courses predate the `Weekly/` subfolder and keep them flat at the course root — both locations follow this same content standard, only the path differs. The defining move is the `## Lecture-to-textbook synthesis` section: lecture gives the scenario and the application, the textbook gives the named frameworks and tests, and the synthesis states how they fit. The gold standard is the MGMT 3001 week set; match its shape.
This Standard governs each week's *content*. [[Week Standard]] governs the `Weekly Board.md` index that lists and links every week note in a course — read that one first for the index, this one for what goes inside each entry it points to.
## Maps To
- Template: [[Week Template]]
## Used By Workflow
- [[Weekly Workflow]] covers when a week note gets created and how it links back to `Weekly Board.md`. See [[00_Workflows Index]] for the surrounding system and read this Standard before writing.
## Per-Heading Standard
### Frontmatter
`type: class`, `input_kind: lecture`, `status: seed` (week notes stay `seed`; the distilled concept note is where maturity grows), `area:` linking the course board and the matching textbook chapter, `tags: [#class, #Lecture]`, and `next:` pointing to the following week. Path-qualify ambiguous links — every course has a `Week - 9`.
> [!WARNING]
> A bare `[[Week - 10]]` that resolves to the wrong course's week. Week 9 uses `area:` links to the board, `[[Chapter - 14]]`, and the concept note, with `next:` → Week 10.
### What you must be able to do
The week's learning objectives as bullets, with the textbook chapter linked first. These are the exam-facing "can I do this" checks.
*Density:* four to eight objective bullets, each a verb the student must perform ("Distinguish...", "Apply the diversification test...").
> [!WARNING]
> Restating the topic title instead of listing testable abilities. Week 4 opens with `[[Chapter - 6]]` then eight "Distinguish / Explain / Apply / Compare" objectives.
### Key ideas (short)
Three to six compressed claims. Bold the named concept and the key contrast word in each.
*Density:* one line per idea, no sub-bullets.
> [!WARNING]
> Re-explaining the lecture here — this section is the short version, the Lecture section is the long one. Week 9: "Power is potential; influence is power in action; authority is formal right."
### Concepts created today
Wikilinks to the concept notes this week produced. Verify each exists or mark `(to create)`.
*Density:* one to four concept links.
> [!WARNING]
> Linking concepts that have no note. Week 9 links `[[Power and Influence]]`, `[[Management Foundations and Leadership]]`, `[[Ethics and Corporate Social Responsibility]]`.
### Examples worth keeping
Real lecture examples and scenarios — never invented ones. Bold the entity (a company, a named study).
*Density:* three to six concrete cases.
> [!WARNING]
> Generic textbook examples. Week 9: "Heidi vs Howard = gendered perception of the same behavior", "Oprah and Obama = referent power."
### Lecture
Numbered sections following the lecture's own structure: `### 1. Title` with tab-indented sub-content. Use `$...$` for any notation. This is the full lecture capture.
*Density:* one `###` per lecture section — Week 9 has 10. Reproduce the lecture, do not compress.
*Plugins:* `**bold**` on every power base / tactic / named term; `1.`/`-` lists for enumerations.
> [!WARNING]
> Collapsing ten lecture sections into a paragraph. Week 9 § Lecture walks sections 1–10 (power vs authority → choosing the right tactic) with the five power bases and ten influence tactics each bolded.
### Textbook integration
What the chapter adds beyond lecture. Link the chapter. When the chapter is dense, use `### Additions easy to miss` subheadings (Week 4 uses "Textbook additions that are easy to miss" with `### Why firms diversify`, `### Portfolio thinking`, etc.).
*Density:* capture the frameworks and tests the lecture only gestured at.
> [!WARNING]
> Repeating the lecture instead of stating the delta. Week 4 surfaces the **BCG Growth-Share Matrix**, the inverted-U diversification result, and the ownership test — none stated plainly in lecture.
### Domain links (leadership / entrepreneurship / speaking)
Optional but present in the gold notes: `### Leadership link`, `### Entrepreneurship link`, `### Speaking skill link` — how the week's concept transfers to the course's applied tracks.
*Density:* one to three bullets per sub-link, only where a real transfer exists.
> [!WARNING]
> Forcing all three when only one applies. Week 4 ties corporate strategy to conceptual skill (leadership), founder scope decisions (entrepreneurship), and a five-step recommendation order (speaking).
### Takeaways (questions to resolve)
`- [ ]` Tasks format, never prose. These are real open questions to resolve before the exam.
*Density:* two to five genuine questions.
> [!WARNING]
> Prose paragraphs, or questions already answered in the note. Week 4: "- [ ] At what point do transaction-cost savings stop justifying vertical integration?"
### Lecture-to-textbook synthesis
==The required section that makes a week note good and is missing from weak ones.== Exact shape:
- one `==definition anchor==` highlight stating the week's core concept in a sentence (the section's single highlight);
- `*Mechanism:*` — how lecture and textbook fit, what drives the concept;
- lecture example/scenario — the concrete case that makes it stick;
- textbook connection — `[[Chapter - ]]` supplies the framework the lecture applied;
- concept links — the `[[Concept - ]]` notes;
- `> [!WARNING]` the common confusion or failure mode, then `> [!SUMMARY]` one sentence on what the week is really about.
> [!WARNING]
> Skipping this section, or using more than one highlight in it. Week 9 anchors on "power is the capacity to influence, influence is the process, authority is the formal right", then mechanism → playing high/low example → `[[Chapter - 14]]` → concept links → WARNING (power ≠ authority) → SUMMARY.
### Flashcards
`#cards/[course]` (the gold notes use `#cards/MGMT`). 3–5+ cards testing distinctions and mechanisms, not labels. In the `#cards` section bold only the term meant to be hidden.
> [!WARNING]
> Label cards ("Five power bases::Legitimate, reward, coercive, expert, referent" is acceptable as a list-recall card, but prefer distinction cards like "Playing high::Signals rank; useful when rank must be reinforced").
## Done Conditions
- Lecture is captured section-by-section; textbook integration states only the delta.
- The `## Lecture-to-textbook synthesis` section is present and follows the exact six-part shape with one highlight, a WARNING, and a SUMMARY.
- Objectives, key ideas, examples, and concept links are all real and verified.
- `- [ ]` Tasks for takeaways; 3–5+ `#cards/[course]` cards.
- Passes all 16 points of [[Vault Rules — Complete AI Ruleset]] Part 12.
## 2026-09-20 Normative Production Addendum
### Lifecycle
Create the week note before lecture from the verified schedule, the landed textbook note, assigned slides/PDFs, notebooks or Python files, prior concepts, and relevant assignments. The goal is to be ahead of the lecture. During class, the user's live notes belong in the `## Lecture` section/header. Treat that capture as protected human source material: organize around it and add links, but do not delete, overwrite, silently paraphrase away uncertainty, or replace it with an imagined transcript.
When no live lecture is happening, the same `## Lecture` area may contain pre-lecture slide/PDF/source notes. Label those as `Pre-lecture source notes` and keep later `Live lecture capture` distinguishable. Do not create a parallel temporary lecture note that can drift away from the weekly note.
After lecture, reconcile the live capture with textbook, slides/PDFs, code, assignments, and concept notes. Carry forward what was actually emphasized or corrected into the textbook integration, concept notes, Board, assignment notes, and open questions. Preserve disagreements as source-attributed conflicts until verified.
### Source map and strictness
Before drafting, list the schedule row, textbook chapter/section, lecture date/capture, slides/PDF/notebook files, labs/projects/assignments, and concepts touched. Read every available source row for the target week; do not rely on a single existing note. Every example, number, code behavior, and claim needs a source anchor or an explicit `Inferred`/`Unresolved` label.
### Density and exam use
The Lecture section follows the actual lecture structure and retains mechanisms, derivations, code shape, edge cases, examples, and corrections. Textbook integration states the delta rather than repeating lecture. When an exam is near, make the concept layer rich and use this note to map retrieval and practice; do not turn the weekly note into a giant cram dump.
### Final gate
The week is complete only when pre-lecture preparation, protected live capture, post-lecture reconciliation, source-grounded links, real open questions, and mechanism/contrast flashcards are all accounted for. A stub with polished prose but no actual lecture/source reconciliation is not complete.
## Gold Standard Example
- [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 9|Week - 9]] — power and influence; the cleanest synthesis section.
- [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 4|Week - 4]] — corporate strategy; the strongest "textbook additions easy to miss" and domain-link sections.
