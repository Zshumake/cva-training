# Handoff Instructions: Stroke Syndromes Module

## DO NOT REWRITE NotebookLM Outputs
Drop quiz/flashcard JSON and podcast WAV directly into the app as finished assets. These have been QA-reviewed, LaTeX-stripped, and tagged with boardReadiness levels.

## Files Included
- `quiz-questions.json` — 15 board-style questions (all BOARD-CORE), ready for app integration
- `flashcards.json` — 65 flashcards (all BOARD-CORE), ready for app integration
- `sync-check.md` — QA review results and new concepts identified
- `research-report.md` — Full enriched document (source of truth for content verification)
- `new-developments-research.md` — Recent research findings (2020-2026)

## Dart File Target
`lib/data/module_contents/stroke_syndromes_content.dart`

## Integration Steps
1. Load `quiz-questions.json` into the app's quiz system for the stroke syndromes module
2. Load `flashcards.json` into the app's flashcard system for the stroke syndromes module
3. Review `sync-check.md` for new concepts that may need app content updates
4. Use `research-report.md` as reference for any content questions

## Board Readiness Tags
- BOARD-CORE: Established guidelines/trials, definitely tested on boards
- BOARD-LIKELY: Recent but adopted, probably appearing on exams soon
- BOARD-EMERGING: Too new for current exam cycles, 2-3 years out

## Content Coverage
MCA/ACA/PCA syndromes, Wallenberg syndrome, medial medullary syndrome, midbrain syndromes (Weber, Benedikt, Claude), locked-in syndrome, lacunar syndromes (pure motor, pure sensory, ataxic hemiparesis, dysarthria-clumsy hand, sensorimotor), watershed infarcts, anterior choroidal artery syndrome, visual field deficits, Rule of 4 for brainstem localization, Gerstmann tetrad, Dejerine-Roussy syndrome.
