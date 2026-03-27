# Handoff: stroke-fundamentals

## DO NOT REWRITE NotebookLM Outputs

Drop quiz/flashcard JSON and podcast WAV directly into the app as finished assets. These have been QA-reviewed, LaTeX-stripped, and board-tagged. Do not rewrite, reformat, or regenerate them.

## Assets Included

| File | Status | Action |
|------|--------|--------|
| quiz-questions.json | Yes | Load into app quiz system |
| flashcards.json | Yes | Load into app flashcard system |
| podcast.wav | Yes | Add to assets/audio/ |
| sync-check.md | Reference | Review for accuracy notes |
| research-report.md | Reference | Source document for all content |
| new-developments-research.md | Reference | Latest guideline updates and research |

## Dart File

`lib/data/module_contents/stroke_fundamentals_content.dart`

## Integration Steps

1. Copy `quiz-questions.json` into the app's quiz data directory or load via the existing quiz model
2. Copy `flashcards.json` into the app's flashcard data directory or load via the existing flashcard model
3. If podcast.wav is included, copy to `assets/audio/stroke-fundamentals/` and register in the podcast/audio content model
4. Review `sync-check.md` for any app content updates needed
5. Check `new-developments-research.md` for recent guideline changes that may need app content updates

## Board-Readiness Tags

Every quiz question and flashcard is tagged with one of:

- **BOARD-CORE**: Established guidelines, landmark trials, and standard-of-care content. Definitely on current board exams. Study these first.
- **BOARD-LIKELY**: Recently adopted guidelines and emerging consensus. Probably appearing on upcoming exams within 1-2 cycles.
- **BOARD-EMERGING**: Cutting-edge research, too new for current exam cycles. Relevant in 2-3 years. Low priority for immediate board prep.

Tags appear in the `boardReadiness` field of each JSON item.
