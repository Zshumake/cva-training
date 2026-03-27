# Handoff Instructions: Diagnostic Studies Module

## DO NOT REWRITE NotebookLM Outputs
Drop quiz/flashcard JSON and podcast WAV directly into the app as finished assets. These have been QA-reviewed, LaTeX-stripped, and tagged with boardReadiness levels.

## Files Included
- `quiz-questions.json` — 15 board-style questions (12 BOARD-CORE, 2 BOARD-LIKELY, 1 BOARD-EMERGING), ready for app integration
- `flashcards.json` — 90 flashcards (85 BOARD-CORE, 3 BOARD-LIKELY, 2 BOARD-EMERGING), ready for app integration
- `sync-check.md` — QA review results and new concepts identified
- `research-report.md` — Full enriched document (source of truth for content verification)
- `new-developments-research.md` — Recent research findings (2020-2026)

## Dart File Target
`lib/data/module_contents/diagnostic_studies_content.dart`

## Integration Steps
1. Load `quiz-questions.json` into the app's quiz system for the diagnostic studies module
2. Load `flashcards.json` into the app's flashcard system for the diagnostic studies module
3. Review `sync-check.md` for new concepts that may need app content updates
4. Use `research-report.md` as reference for any content questions

## Board Readiness Tags
- BOARD-CORE: Established guidelines/trials, definitely tested on boards
- BOARD-LIKELY: Recent but adopted, probably appearing on exams soon
- BOARD-EMERGING: Too new for current exam cycles, 2-3 years out

## Content Coverage
NCCT (sensitivity, hyperdense MCA sign), MRI/DWI/ADC interpretation, CT perfusion (core vs penumbra, RAPID software), ASPECTS scoring, DWI-FLAIR mismatch for wake-up stroke, CTA (spot sign, LVO detection), carotid Doppler (PSV thresholds), TEE vs TTE, cardiac monitoring (CRYSTAL-AF, LOOP trial), hypercoagulable workup (timing, antiphospholipid syndrome), NIHSS (scoring, bias, limitations), monogenic stroke conditions (CADASIL, MELAS, Fabry), SAH workup (LP, xanthochromia), PACNS diagnosis, AI-automated tools.
