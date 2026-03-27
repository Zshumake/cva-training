---
date: 2026-03-27
topic: interactive-learning-modalities
focus: non-reading learning avenues beyond quizzes
---

# Ideation: Interactive Learning Beyond Text

## Codebase Context
Flutter medical education app with 14 stroke modules. Current interactive elements: MCQ quizzes, 3D-flip flashcards, audio podcasts, SVG anatomy viewer with layer peeling, clinical branching scenarios, inline knowledge checks, visual timelines, 11 custom interactive widgets (NIHSS calculator, scales, etc.).

## Ranked Ideas

### 1. Before/After Comparison Slider
**Description:** Horizontal slider overlay revealing normal vs. abnormal images — CT with/without early ischemic changes, pre/post-thrombolysis MRI, acute vs. chronic infarct. Learner controls the reveal.
**Rationale:** Comparative visual learning builds calibration for subtle findings (early ischemic changes are the #1 missed finding). ~100 lines of Flutter code using Stack + ClipRect + GestureDetector.
**Downsides:** Requires curated image pairs. Limited to 2-way comparisons.
**Confidence:** 90%
**Complexity:** Low
**Status:** Unexplored

### 2. Spot-the-Finding Image Challenges
**Description:** Present CT/MRI/CTA and ask learner to tap/circle the abnormality. Score by proximity to target region. Reveal annotated version with teaching points.
**Rationale:** CT interpretation drives acute stroke decisions. ASPECTS scoring, hemorrhage identification, and vessel occlusion detection are high-stakes skills needing deliberate practice.
**Downsides:** Needs high-quality medical images (can use open-source radiology datasets). Touch accuracy varies on small screens.
**Confidence:** 85%
**Complexity:** Low-Medium
**Status:** Unexplored

### 3. Drag-and-Drop Territory Mapper
**Description:** Drag clinical deficits onto correct arterial territory on brain diagram. Incorrect placements snap back with explanation. Variants: deficit-to-territory, classify stroke type, sort NIHSS items.
**Rationale:** Localizing deficits to vascular territories is THE core reasoning skill. Active manipulation forces deeper processing than reading territory tables.
**Downsides:** Needs careful UX on mobile (drag targets must be large enough). Limited question variety per territory.
**Confidence:** 85%
**Complexity:** Low
**Status:** Unexplored

### 4. Audio Recognition Trainer
**Description:** Play clips of aphasia types (Broca, Wernicke, global, conduction) and dysarthria patterns. Learner classifies, then sees transcript highlighting distinguishing features.
**Rationale:** Speech assessment is critical but entirely auditory. Most residents learn from tables but can't apply at bedside. No competing app offers this.
**Downsides:** Content sourcing is the bottleneck — need recorded or licensed audio clips. Simulated actor recordings are a viable alternative.
**Confidence:** 75%
**Complexity:** Medium (content-dependent)
**Status:** Unexplored

### 5. Clinical Video Atlas with Annotated Overlays
**Description:** 15-60s video clips of clinical findings (nystagmus, facial droop, pronator drift, hemiplegic gait, FEES) with toggleable annotation overlays, slow-motion, and "what do you see?" prompts.
**Rationale:** Pattern recognition for exam findings requires seeing them. Reading about nystagmus is categorically different from recognizing it.
**Downsides:** Content production is the main cost. Video files increase app size. Streaming would require a backend.
**Confidence:** 70%
**Complexity:** Low (engineering), Medium (content)
**Status:** Unexplored

### 6. Spaced Repetition Engine
**Description:** SM-2/FSRS algorithm tracking performance across quizzes, flashcards, image challenges, and audio trainers. Surfaces a daily "Review Stack" mixing content types, targeting knowledge gaps.
**Rationale:** Most evidence-backed learning technique. Applying it across modalities (not just flashcards) creates durable, transferable knowledge.
**Downsides:** Requires local database (Hive/Isar). System-level change touching many features. Algorithm tuning needed.
**Confidence:** 80%
**Complexity:** Medium (system layer)
**Status:** Unexplored

## Rejection Summary

| # | Idea | Reason Rejected |
|---|------|-----------------|
| 1 | 3D Rotatable Brain | Flutter's 3D ecosystem is immature; effort disproportionate to value |
| 2 | Peer Challenge Mode | Requires backend infrastructure; not aligned with solo-study use case |
| 3 | Timed Protocol Simulator | Already covered by existing clinical simulator with timer |
| 4 | Interactive NIHSS Trainer | Too narrowly focused on one scale; better as a variant of video atlas |

## Session Log
- 2026-03-27: Initial ideation — 10 generated, 6 survived. User selected all 6 for implementation.
