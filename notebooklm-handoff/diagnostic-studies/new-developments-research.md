# New Developments Research Report: Diagnostic Studies in Stroke (2020-2026)
## CVA Training App — PM&R Board Exam Preparation
### Research Date: 2026-03-21

---

## Research Methodology
- Deep web search on 10+ diagnostic topics covering 2020-2026 literature
- Sources: AHA/ASA journals, ESO guidelines, NEJM, Lancet, Radiology, PMC, FDA clearance data
- Cross-referenced with existing app content (diagnostic_studies_content.dart)
- Cross-referenced with Cuccurullo Stroke Chapter and DeLisa CVA Chapter
- Every claim source-tagged with board-readiness level

---

## TOPIC 1: CT Perfusion — RAPID Software and Automated Analysis
**[BOARD-LIKELY]**

### What the app currently covers:
The app covers CTP fundamentals well: CBF, CBV, MTT, TTP maps; core vs penumbra distinction; DAWN and DEFUSE-3 trial criteria. This is solid BOARD-CORE content.

### New developments NOT in the app:

**1. RAPID Software Specifics**
- RAPID uses rCBF <30% to define core infarct (pink on output maps) and Tmax >6 seconds for penumbra (green)
- Thrombectomy benefit criteria: mismatch ratio >1.8, core <70 mL, Tmax >10s volume <100 mL
- Truncation artifact causes overestimation of core — important quality assurance point
- Source: Practical Neurology, "RAPID Automated CT Perfusion in Clinical Practice"

**2. Competing Platforms (2024-2025)**
- UGuard software validated against RAPID: ICC 0.92 for core volume, ICC 0.8 for penumbra volume
- Multiple FDA-cleared alternatives now available
- Source: Nature Scientific Reports, 2025

### Gap assessment:
The app should add RAPID-specific thresholds and quality assurance pitfalls. These are increasingly testable on boards as automated perfusion becomes standard of care.

### Verification status: CONFIRMED
Multiple peer-reviewed sources confirm RAPID thresholds and quality assurance considerations.

---

## TOPIC 2: MRI DWI/PWI Mismatch and Extended-Window Treatment
**[BOARD-LIKELY]**

### What the app currently covers:
DWI-FLAIR mismatch for wake-up stroke (WAKE-UP trial), DAWN and DEFUSE-3 criteria. Well covered.

### New developments NOT in the app:

**1. Paradigm Shift: Time-Based to Tissue-Based**
- ESO guidelines now recommend 4.5-9h for thrombolysis and 6-24h for thrombectomy based on advanced imaging
- Emphasis on rapidly assessing salvageable tissue rather than clock time
- Source: AHA Journals, "Guidelines in Action," 2025

**2. Extended-Window Thrombolysis**
- Beyond thrombectomy, thrombolysis is now supported in extended windows with imaging selection
- Patients outside 4.5h window with salvageable tissue on imaging have improved 90-day outcomes
- Source: CATRAC, "Stroke Thrombolysis Beyond 4.5 Hours," 2025

### Gap assessment:
App should emphasize the time-to-tissue paradigm shift, which represents a major conceptual evolution likely to appear on boards.

### Verification status: CONFIRMED
Supported by AHA/ESO guidelines and multiple RCTs.

---

## TOPIC 3: CT Angiography for LVO Detection — AI Integration
**[BOARD-LIKELY]**

### What the app currently covers:
CTA capabilities, sensitivity >95% for LVO, collateral grading, spot sign. Comprehensive.

### New developments NOT in the app:

**1. AI-Automated LVO Detection**
- FDA-cleared AI tools detect LVO in <5 minutes with >=87% sensitivity and >=93% NPV
- Some newer AI systems outperform existing FDA-cleared tools by 25-45% for sensitivity
- Source: Nature Communications, 2023; Stroke (AHA), 2024

**2. Workflow Impact**
- AI alerts reduce CTA-to-door-in transfer intervals by average 22.5 minutes
- Enables primary stroke centers to fast-track transfers to thrombectomy-capable centers
- Source: Stroke: Vascular and Interventional Neurology, 2024

**3. Mobile Stroke Units**
- Machine learning now applied to CT images obtained on mobile stroke units
- Enables LVO detection in the field before hospital arrival
- Source: Stroke (AHA), "ML Detection of LVO from Mobile Stroke Unit CTA"

### Gap assessment:
AI-assisted LVO detection is increasingly standard practice. Add as BOARD-LIKELY content given its integration into current stroke center workflows.

### Verification status: CONFIRMED
Multiple FDA-cleared products, validated in multicenter studies.

---

## TOPIC 4: Carotid Ultrasound vs CTA — Updated Evidence
**[BOARD-CORE]**

### What the app currently covers:
PSV thresholds, NASCET trial, comparison table. Good foundation.

### New developments NOT in the app:

**1. Concordance Data**
- Overall agreement between duplex ultrasound and CTA: 79.1%
- Discrepancies in 44% of patients, particularly for vertebral arteries
- Duplex sensitivity 92%, specificity 89% per systematic review
- Source: PMC, "Comparison of DUS and CTA," 2023

**2. Current Clinical Approach**
- Duplex ultrasound remains first-line for initial evaluation
- CTA or MRA used when: ultrasound nondiagnostic, heavy calcification, pre-surgical planning, need for intracranial assessment
- For acute stroke/TIA: CTA or MRA preferred over ultrasound
- Source: Carelon Clinical Guidelines, 2024-2025

### Gap assessment:
Minor update needed. App could add concordance limitations and the clinical decision pathway.

### Verification status: CONFIRMED

---

## TOPIC 5: Echocardiography — TTE vs TEE Updated Evidence
**[BOARD-LIKELY]**

### What the app currently covers:
TTE vs TEE comparison table, when TEE is indicated. Solid.

### New developments NOT in the app:

**1. Quantified TEE Diagnostic Impact**
- TEE yields treatment-relevant findings in 1 of 7 patients <=60 years with cryptogenic stroke
- TEE impacted management in 23.9% of all patients in one study
- Source: Stroke (AHA), "Treatment-Relevant Findings in TEE After Stroke," 2022

**2. Updated Guideline Position**
- AHA/ASA: echocardiography is "reasonable" in cryptogenic stroke; TEE "reasonable" in ESUS
- No absolute mandate for TEE over TTE in all cases
- Age-stratified approach: TEE most valuable in patients <=60 years
- Source: ESO, "To TTE or TEE?"; PMC, "Evaluation and Prevention of Cardioembolic Stroke," 2023

### Gap assessment:
App should add the quantified diagnostic yield data and age-stratified approach.

### Verification status: CONFIRMED

---

## TOPIC 6: Cardiac Monitoring — ILR and LOOP Trial
**[BOARD-CORE / BOARD-LIKELY]**

### What the app currently covers:
CRYSTAL-AF trial, ILR detection rates, monitoring progression. Well covered.

### New developments NOT in the app:

**1. Reveal LINQ Registry (2024)**
- Large real-world registry: AF detected in 28.2% at 36 months
- Median time to AF detection: 7.9 months
- Detection rates: 4.73% (1 month), 13.45% (6 months), 17.5% (12 months), 25.98% (36 months)
- Source: JAHA, "Global Results of ILR for AF Detection After Stroke," 2024

**2. LOOP Trial (Lancet, 2021) — Critical Nuance**
- In patients with stroke risk factors (NOT prior stroke), ILR screening found 3x more AF
- BUT no significant reduction in stroke risk despite increased anticoagulation
- Implication: not all detected AF warrants anticoagulation; screen-detected AF may differ from clinical AF
- This applies to PRIMARY PREVENTION only — does NOT change approach for post-stroke monitoring
- Source: Lancet, "The LOOP Study," 2021

**3. Meta-Analysis Data**
- ILR detection is 2.78- to 5.31-fold higher than conventional monitoring
- Source: PubMed, "Value of ILRs in Detecting AF: Systematic Review," 2025

### Gap assessment:
App should add LOOP trial result (important board nuance) and updated registry data. The distinction between post-stroke monitoring vs. primary prevention screening is board-testable.

### Verification status: CONFIRMED

---

## TOPIC 7: Hypercoagulability Workup — ASH 2023 Guidelines
**[BOARD-LIKELY]**

### What the app currently covers:
Individual thrombophilia tests, when to consider, timing precautions. Solid foundation.

### New developments NOT in the app:

**1. ASH 2023 Guidelines (23 Recommendations)**
- Strong recommendation AGAINST testing general population before starting OCPs
- Conditional recommendations FOR testing in: cerebral/splanchnic venous thrombosis, family history of high-risk thrombophilia, VTE with hormonal risk factors
- Source: Blood Advances, "ASH 2023 Guidelines for Thrombophilia Testing"

**2. Stroke-Specific Approach**
- Antiphospholipid syndrome identified as strongest thrombophilia risk factor for arterial events
- Stepwise approach recommended: exclude acquired conditions before pursuing genetic testing
- Factors increasing testing yield: young age, pregnancy, estrogen use, PFO, cryptogenic mechanism
- Source: AHA Stroke, "Thrombophilia Testing After Ischemic Stroke"; Sage Journals, 2026

### Gap assessment:
App should incorporate the ASH 2023 guideline framework and the acquired-before-genetic stepwise approach. The APS emphasis is board-relevant.

### Verification status: CONFIRMED

---

## TOPIC 8: Vasculitis Screening — ESO 2023 PACNS Guidelines
**[BOARD-LIKELY]**

### What the app currently covers:
Basic vasculitis workup (ESR, CRP, ANA, ANCA, angiography, biopsy). Adequate.

### New developments NOT in the app:

**1. ESO 2023 Guidelines on PACNS**
- First evidence-based guidelines for PACNS using GRADE methodology
- Mean prodromal period: 170 days from onset to diagnosis
- CSF analysis lacks evidence as standalone diagnostic tool
- Non-invasive imaging (CTA/MRA) has lower sensitivity than DSA — caution in interpretation
- Three diagnostic levels: neuropathological (gold standard), neuroimaging (most used), clinical
- Source: European Stroke Journal, "ESO Guidelines on PACNS," 2023

### Gap assessment:
Add the diagnostic hierarchy and the caution about non-invasive imaging sensitivity for vasculitis.

### Verification status: CONFIRMED

---

## TOPIC 9: Genetic Testing for Young Stroke
**[BOARD-LIKELY]**

### What the app currently covers:
Nothing on genetic/monogenic causes of stroke. This is a GAP.

### New developments to add:

**1. Monogenic Stroke Overview**
- Accounts for 1-5% of all strokes; higher proportion in young patients
- Key conditions: CADASIL (NOTCH3), Fabry disease (GLA), MELAS (mtDNA A3243G)
- Source: Stroke (AHA), "Genetic Testing for Monogenic Stroke," 2024

**2. CADASIL**
- Most common hereditary stroke cause in adults
- Autosomal dominant, NOTCH3 mutations
- Characteristic MRI: anterior temporal pole and external capsule white matter lesions
- Diagnosis: genetic testing or skin biopsy (GOM deposits)

**3. Fabry Disease**
- X-linked, alpha-galactosidase A deficiency
- 1% of all young strokes, 3-5% of cryptogenic young strokes
- ONLY monogenic stroke with specific treatment: enzyme replacement therapy
- Multi-system: acroparesthesias, angiokeratomas, renal/cardiac disease

**4. MELAS**
- Mitochondrial inheritance, A3243G mutation
- Stroke-like episodes do NOT follow vascular territories
- Elevated serum/CSF lactate; ragged red fibers on muscle biopsy

**5. Clinical Impact**
- Genetic diagnosis can: change management, avoid unnecessary invasive tests, enable reproductive counseling, prompt cascade testing
- Source: EAN Consensus, 2020; Stroke (AHA), 2024

### Gap assessment:
SIGNIFICANT GAP. Monogenic stroke is increasingly tested on PM&R boards. Add a new section covering CADASIL, Fabry, and MELAS at minimum.

### Verification status: CONFIRMED

---

## TOPIC 10: AI/Machine Learning in Stroke Imaging
**[BOARD-EMERGING]**

### What the app currently covers:
Nothing on AI in stroke imaging. This is a GAP.

### New developments to add:

**1. Multi-Step AI Diagnostic Performance (2025)**
- ICH detection on NCCT: 94.6% accuracy
- LVO identification on CTA: 86.4% accuracy
- Region-based ASPECTS: 88.6% accuracy
- Source: PubMed, "Performance of AI Tool for Multi-Step Acute Stroke Imaging," 2025

**2. Clinical Workflow Impact**
- Transfer time reduction: 22.5 minutes average
- Reduced inter-reader variability for ASPECTS
- Automated alerts to stroke teams
- Source: Multiple AHA and PMC publications, 2023-2025

**3. Technology Overview**
- CNNs for LVO detection
- Random forests for ASPECTS scoring
- Automated CTP processing (RAPID and competitors)

### Gap assessment:
Emerging topic. Add as awareness-level content. Unlikely to be heavily tested in current exam cycles but represents the direction of the field.

### Verification status: CONFIRMED

---

## TOPIC 11: ESUS and PFO Closure Updates
**[BOARD-LIKELY]**

### What the app currently covers:
PFO detection via bubble study, basic PFO-stroke connection. Does not cover ESUS concept or trial data.

### New developments to add:

**1. ESUS Trial Results**
- NAVIGATE-ESUS (rivaroxaban) and RE-SPECT ESUS (dabigatran): Neither DOAC was superior to aspirin for all ESUS patients
- However, in ESUS WITH PFO, anticoagulation showed benefit in meta-analysis
- Source: Neurology, 2024; ACC, 2024

**2. PFO Closure Trials**
- CLOSE, RESPECT, REDUCE: PFO closure reduces recurrent stroke in ESUS patients <60 years with no other identified etiology
- Source: ACC, "Embolic Strokes of Undetermined Source," 2024

**3. Current Approach**
- Moving away from blanket anticoagulation for ESUS
- Toward mechanism-specific therapy: subclinical AF, PFO, atrial cardiopathy
- Personalized approach based on identified mechanism

### Gap assessment:
Add ESUS concept and key trial results. PFO closure indications are board-testable.

### Verification status: CONFIRMED

---

## SUMMARY OF GAPS IDENTIFIED

### Content gaps in the current app (priority order):

1. **Genetic testing for young stroke (CADASIL, Fabry, MELAS)** — SIGNIFICANT GAP, board-relevant
2. **ESUS concept and NAVIGATE/RE-SPECT trial results** — Not covered, board-likely
3. **PFO closure trial data (CLOSE, RESPECT, REDUCE)** — Not covered, board-likely
4. **AI/ML in stroke imaging** — Emerging, awareness needed
5. **RAPID software specifics and quality assurance** — Supplements existing CTP content
6. **LOOP trial result** — Important nuance for cardiac monitoring section
7. **ASH 2023 thrombophilia guidelines** — Updates hypercoagulable workup approach
8. **ESO 2023 PACNS guidelines** — Updates vasculitis diagnostic approach
9. **Time-to-tissue paradigm shift** — Conceptual update for extended-window treatment
10. **Updated TEE diagnostic yield data** — Quantifies when TEE changes management

### Content already well-covered in the app:
- NCCT interpretation and early ischemic signs
- DWI/ADC interpretation
- CT perfusion core vs penumbra concept
- ASPECTS scoring
- DWI-FLAIR mismatch and WAKE-UP trial
- CTA for LVO detection
- Vascular imaging comparison
- TTE vs TEE comparison
- Cardiac monitoring progression
- CRYSTAL-AF trial
- Hypercoagulable workup basics
- LP for SAH and xanthochromia
- EEG in stroke
- NIHSS scoring and limitations
- Special etiologic workup (dissection, moyamoya, CVST)

---

## SOURCES CONSULTED

### Textbook Sources
- Cuccurullo SJ, ed. Physical Medicine and Rehabilitation Board Review, 4th Edition. Chapter 1: Stroke.
- DeLisa JA, ed. Physical Medicine and Rehabilitation: Principles and Practice, 6th Edition. Chapter 18: Stroke Rehabilitation.

### Journal and Guideline Sources (2020-2026)
- Practical Neurology: RAPID Automated CT Perfusion in Clinical Practice
- Nature Scientific Reports (2025): UGuard vs RAPID validation
- AHA Journals (2025): Guidelines in Action — Extending the Treatment Window
- ESO Guidelines: Extended time window reperfusion therapies
- Nature Communications (2023): Deep learning LVO detection
- Stroke/AHA (2024): ML-Enabled Automated LVO Detection
- PMC (2023): Comparison of Doppler Ultrasound and CTA
- ESO (2023): To TTE or TEE?
- Stroke/AHA (2022): Treatment-Relevant Findings in TEE After Stroke
- PMC (2023): Evaluation and Prevention of Cardioembolic Stroke
- JAHA (2024): Reveal LINQ Registry — ILR for AF Detection After Stroke
- Lancet (2021): The LOOP Study
- Blood Advances/ASH (2023): Thrombophilia Testing Guidelines
- Stroke/AHA: Thrombophilia Testing After Ischemic Stroke
- European Stroke Journal (2023): ESO Guidelines on PACNS
- Stroke/AHA (2024): Genetic Testing for Monogenic Stroke
- EAN Consensus (2020): Monogenic Cerebral Small-Vessel Diseases
- Radiology (2024): Deep Learning Applications in Stroke Imaging
- PMC (2025): AI in Stroke Care — Narrative Review
- Neurology (2024): Anticoagulation vs Antiplatelets in ESUS
- ACC (2024): Embolic Strokes of Undetermined Source — Key Points
