---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-05-31
tags:
  - evergreen
  - system
  - obsidian
  - learning
  - spaced-repetition
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
---
# Spaced Repetition and Learning Loops

Spaced Repetition should turn understood notes into retrieval practice. It should not turn raw source text into trivia.

Use it after the note has a mechanism, contrast, or worked example worth recalling.

## Current Settings

- Flashcard tag: `#cards`.
- Convert folders to decks: enabled.
- Single-line separator: `::`.
- Single-line reversed separator: `:::`.
- Multiline separator: `?`.
- Multiline reversed separator: `??`.
- Bold text creates clozes: enabled.
- Highlighted text creates clozes: enabled.
- Curly-brace clozes: disabled.
- Randomize card order: enabled.
- Show context in cards: enabled.
- Ignored folders: `30_Order/Templates`, `50_Archive`, `.obsidian`, `**/*.excalidraw.md`.

Because bold and highlight clozes are enabled, formatting choices can accidentally create cards.

> [!NOTE]
> **Fixed 2026-09-20 — `data.json` held two config layers, only one of which was ever real.** Confirmed directly from `main.js` (`PluginDataManager.loadData()`, `DEFAULT_DATA`): the plugin only ever reads the nested `settings` block. A set of top-level keys at the root of `data.json` (`flashcardTags: "#cards"`, `convertBoldTextToClozes: true`, etc.) were dead weight from an older plugin schema — never read, never migrated, silently preserved on every save. The installed version (1.15.4) was actually running on `flashcardTags: ["#flashcards"]` with bold-clozes off, meaning **every `#cards`-tagged card in this vault was invisible to review.** Fixed by editing the nested `settings` block to match this vault's actual established convention (`#cards`, bold-clozes-on, folders-to-decks-on) rather than renaming hundreds of existing card tags, and the dead top-level keys were deleted outright so this can't silently recur. If review still shows nothing, check `.obsidian/plugins/obsidian-spaced-repetition/data.json`'s `settings.flashcardTags` directly — that key, and only that key, path, is load-bearing.

## Card Syntax

Single direction:

```markdown
Why can bad retrieval make RAG worse?::Because the model gets confident-looking but irrelevant context and anchors on the wrong evidence. #cards
```

Reversed:

```markdown
Consistent frontmatter keeps dashboards trustworthy.:::What makes Dataview useful in Jarvis? #cards
```

Multiline:

```markdown
What should happen before a raw clipping becomes flashcards?
?
It should be summarized, linked to the source, and distilled into a concept or course note. Cards should test the processed idea, not pasted source fragments.
#cards
```

Multiline reversed:

```markdown
A project note's `next:` field should name one current move.
??
What belongs in `next:` instead of a task list?
#cards
```

Cloze:

```markdown
The query fails because **metadata drift** makes correct Dataview syntax return the wrong set of notes. #cards
```

Use bold or highlight only when the hidden term is worth recalling.

## Good Jarvis Cards

A good card tests one useful distinction:

- Mechanism: "Why does `BUILD-MAX-HEAP` run in linear time?"
- Contrast: "When should Jarvis use Dataview instead of Tasks?"
- Failure mode: "What happens if a project note has no `next:`?"
- Exam-style prompt: "Given this OCaml pattern match, what case is missing?"
- Project/application prompt: "Where should a BOOM source clipping go before synthesis?"

A bad card tests a label without use:

```markdown
Dataview is::A plugin #cards
```

That card adds review load without improving recall.

## Learning Loops

Coursework:

1. Put cards near the concept, week, lab, or exam note they test.
2. Prefer mechanism, contrast, mistake, and exam-prompt cards.
3. Link cards to boards when a course has a review map.

Algorithms and systems:

1. Start with invariants, state transitions, failure cases, and complexity traps.
2. Add Excalidraw diagrams only when the visual state helps.
3. Use cards to test why an invariant holds, not just what it is called.

AI concepts:

1. Test pipeline failure modes: retrieval, grounding, tool use, evaluation, memory drift.
2. Anchor cards in project notes or source summaries when the idea came from a real build.
3. Avoid cards that only repeat model/product names.

Interview prep:

1. Use cards for prompts that force explanation under pressure.
2. Include one "what mistake is this question baiting?" card for tricky topics.
3. Link to proof artifacts under capability dashboards when relevant.

## Connecting Cards To Dashboards

Dataview can surface notes tagged `#cards`:

```dataview
LIST
FROM #cards
WHERE !contains(file.folder, "30_Order/Templates")
SORT file.mtime DESC
LIMIT 10
```

Capability notes can also use:

- `last_drilled`
- `next_drill`
- `drill_interval`
- `mastery_level`
- `mastery_score`

Use those fields when the note belongs to long-term capability tracking, not for every small course note.

## Deck Naming

Tag cards with `#cards/[subject]` where `[subject]` matches the note's `track:` frontmatter field or the folder/course domain.

Vault deck names in use:
- `#cards/MGMT` — management, strategy, organizational behavior
- `#cards/CS` — algorithms, systems, theory
- `#cards/trading` — markets, quantitative finance
- `#cards/ai` — ML, LLMs, RAG, agent systems
- `#cards/bio` — biology coursework (BIOL 1009, 1012)
- `#cards/math` — linear algebra, calculus, stats

Default to the subject folder name if a track deck does not yet exist. Do not use bare `#cards` on new notes — always add the subdeck.

## PDF Ingestion Note Structure

When an agent creates a note from an ingested PDF, paper, or textbook chapter, it must follow this section order:

1. Section content under `##` headings
2. `## Open Questions` — Tasks (`- [ ]`) for unresolved claims or follow-up actions from the source
3. `## Flashcards` — SR cards, tagged `#cards/[track]`, placed after the concepts they test

The `## Flashcards` section must use `#cards/[track]` (not bare `#cards`) and must appear last. Cards placed before the explanatory content are forbidden — if the note is not explained yet, the card cannot be stable.

## Agent Rules

Agents may add cards when:
- the source has been processed into a summary or concept note
- the answer is stable
- the card tests one mechanism or contrast
- the card is near its explanatory context

**Bold (`**text**`) and highlight (`==text==`) clozes are ON.** Every bold term in a `#cards` section becomes an automatic cloze card. This means:
- In `#cards`-tagged notes, bold only terms worth hiding in review
- Outside `#cards` sections, bold is safe for named concepts and category labels
- `==highlight==` in a `#cards` note creates a cloze — use it once per section maximum, for the single most important definitional claim

Agents should avoid:
- creating cards from `60_Claude/05_Clippings`
- using bare `#cards` without a subdeck on new notes
- creating large flashcard banks in one pass
- using cards to hide weak explanations
- bolding aggressively in card sections (every bold term becomes a cloze)

Review should improve the note. If a card feels hard because the underlying note is vague, fix the note first.

## Integration Map
- **SR ← formatting markers:** `**bold**` and `==highlight==` are not styling here — when bold/highlight clozes are on, each one in a `#cards` section becomes a cloze card. This is why [[Jarvis Writing and Formatting]] restricts `==` to one definition-anchor per section and bold to named concepts. The formatting rule exists *because* SR reads it.
- **SR → Dataview:** notes tagged `#cards` are surfaced by the flashcard-queue query in [[Dataview and Dashboards]]. Capability notes additionally expose `last_drilled`, `next_drill`, `mastery_level` for review dashboards. Cards with no tag never reach the queue.
- **SR ↔ compression hierarchy:** cards are the last step of raw → summary → distilled → card. A card made directly from a clipping skips the compression that makes it answerable, which is why card creation from `60_Claude/05_Clippings/` is forbidden.
- **SR ✗ Excalidraw:** the ignore pattern `**/*.excalidraw.md` keeps drawings out of review; do not put cards inside drawing files.
## Gold-Standard Example
[[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 9|Week - 9]] is the model: a `## Flashcards` section at the very end, tagged `#cards/MGMT`, with cards that test distinctions (power vs influence vs authority; the five power bases) rather than label trivia — placed after the concepts are explained in the body. [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 4|Week - 4]] shows the same pattern with numbered single-line cards. Match these, not invented examples.
## Verified Open State
- Is the review cadence being followed, or are cards accumulating without review? — *behavioral, not a settings question*
- Should capability notes standardize on `last_drilled`/`next_drill`, and which dashboard reads them? — *partially answered in Dataview doc; field adoption still inconsistent*
- Nested sub-decks (`#cards/CS/algorithms`) vs the current flat list — not worth doing now. The tag system supports arbitrary depth, but with six decks and coursework arriving at normal volume, flat names stay easy to scan. Revisit only if one deck (most likely `#cards/CS`) grows large enough that scrolling becomes the real bottleneck; retrofitting nesting later is a find-and-replace, not a rebuild, so there's no cost to waiting.
## How To Verify This Is Actually Working
Do this after any Obsidian update to this plugin, since a version bump can reintroduce a schema mismatch the same way the original one happened:
1. Open Settings → Spaced Repetition → Flashcards. The "Flashcard Tags" field must show `#cards`, not `#flashcards`.
2. Open Settings → Spaced Repetition → Behaviour. "Convert highlights to clozes" and "Convert bold text to clozes" must both be on.
3. Open a note with a real `#cards/[track]` card, confirm the SR ribbon icon or `Ctrl/Cmd+P` → "Spaced Repetition: Open flashcard queue" actually shows that card queued.
4. If any of these three show the wrong value, `data.json`'s `settings` block (not any top-level key — there are no more of those) is the only place to fix it.
## Sources
- [Spaced Repetition README](https://github.com/st3v3nmw/obsidian-spaced-repetition)
- [Spaced Repetition resources](https://www.stephenmwangi.com/obsidian-spaced-repetition/resources/)
- Direct read of `.obsidian/plugins/obsidian-spaced-repetition/main.js` (`PluginDataManager.loadData`, `DEFAULT_DATA`, `DEFAULT_SETTINGS`, `SettingsManager` constructor) — confirms the nested `settings` block is the only config path the installed version (1.15.4) ever reads — this session, 2026-09-20
- [[00_Dashboard]]
- [[40_Resources/Obsidian/Vault Operating System]]
