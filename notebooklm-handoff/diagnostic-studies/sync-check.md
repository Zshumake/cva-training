# Sync Check: Diagnostic Studies Module

## QA Status: PASSED
- Date: 2026-03-21
- Content verified against enriched-document.md

## Topic Verification
Content correctly covers: NCCT, MRI/DWI/ADC, CT perfusion (core vs penumbra), ASPECTS scoring, DWI-FLAIR mismatch, CTA (spot sign, LVO detection), carotid Doppler (PSV thresholds), TEE vs TTE, cardiac monitoring (CRYSTAL-AF), hypercoagulable workup, NIHSS, monogenic stroke conditions (CADASIL, MELAS, Fabry), SAH workup, PACNS diagnosis.

## Quiz Questions: 15
- BOARD-CORE: 12
- BOARD-LIKELY: 2 (2023 ESO PACNS guidelines, hypercoagulable workup timing)
- BOARD-EMERGING: 1 (AI-automated LVO detection)
- Spurious top-level "isCorrect" fields removed from all questions

## Flashcards: 90
- BOARD-CORE: 85
- BOARD-LIKELY: 3 (LOOP trial, extended thrombolysis window, WAKE-UP trial)
- BOARD-EMERGING: 2 (AI ASPECTS scoring, AI LVO detection sensitivity)
- Heavy LaTeX successfully stripped

## Content Accuracy Notes
- NCCT sensitivity 60% in first 6 hours: correct per Cuccurullo
- DWI bright + ADC dark = true restriction: correct
- Penumbra = decreased CBF + maintained CBV: correct
- ASPECTS >=6 for thrombectomy: correct per DAWN/DEFUSE-3
- PSV >125 = >50% stenosis, >230 = >70% stenosis: correct per NASCET
- CRYSTAL-AF 30% AFib detection at 3 years: correct
- CADASIL = NOTCH3, anterior temporal pole lesions: correct

## New Concepts for App Content
- RAPID software color coding (green = penumbra, pink = core)
- NIHSS item-level scoring details (items 5, 6, 11)
- Extended thrombolysis window 4.5-9 hours

## Dart File Target
lib/data/module_contents/diagnostic_studies_content.dart
