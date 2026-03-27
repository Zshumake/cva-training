# Spasticity & Shoulder Complications After Stroke
## Enriched Reference Document for NotebookLM -- CVA Training App (PM&R Board Prep)

---

# PART 1: SPASTICITY AFTER STROKE

## 1.1 Definition and Pathophysiology

Spasticity is a velocity-dependent increase in muscle tone due to hyperexcitability of the stretch reflex, resulting from loss of upper motor neuron inhibition on the spinal reflex arc. It develops in approximately 20-40% of stroke survivors. [BOARD-CORE]

**Key pathophysiological mechanisms:**
- Loss of corticospinal and reticulospinal inhibitory input to spinal motor neurons
- Increased excitability of alpha motor neurons and gamma motor neuron loop
- Imbalance between excitatory (medial reticulospinal) and inhibitory (lateral corticospinal, dorsal reticulospinal) descending pathways
- Secondary changes: muscle fiber type transformation (type I to type II), increased connective tissue, sarcomere loss, and muscle shortening [BOARD-CORE]

**Timeline:**
- Typically emerges days to weeks after stroke
- Peaks around 1-3 months post-stroke
- Follows the Brunnstrom stages: flaccidity (Stage 1) -> spasticity appears (Stage 2) -> spasticity prominent with synergy patterns (Stage 3) -> voluntary control emerges, spasticity decreases (Stages 4-5) -> near-normal function (Stage 6) [BOARD-CORE]

Source: Cuccurullo, Physical Medicine and Rehabilitation Board Review, Chapter 1; DeLisa, PM&R Principles and Practice, 6th Ed, Chapter 18; Lance JW, 1980.

## 1.2 Classic Spasticity Patterns

**Upper Extremity FLEXOR Synergy Pattern:**
- Shoulder adduction and internal rotation
- Elbow flexion
- Forearm pronation
- Wrist flexion and ulnar deviation
- Finger flexion
- Thumb-in-palm [BOARD-CORE]

**Lower Extremity EXTENSOR Synergy Pattern:**
- Hip extension, adduction, and internal rotation
- Knee extension
- Ankle plantarflexion and inversion (equinovarus)
- Toe flexion/curling [BOARD-CORE]

**Clinical Result:** Classic hemiplegic posture and gait with circumduction pattern due to stiff extended leg, hip hiking to clear foot, and equinovarus foot positioning. [BOARD-CORE]

**Board Pearl:** Spasticity can be BENEFICIAL -- some patients use LE extensor spasticity for standing and transfers (acts as internal splint). Reducing LE extensor tone may paradoxically worsen function. Always assess functional impact before treating. [BOARD-CORE]

Source: Cuccurullo, Chapter 1; App content (spasticity_shoulder_content.dart).

## 1.3 Assessment Scales

### Modified Ashworth Scale (MAS)

The most widely used clinical measure of spasticity. 6-point ordinal scale (0, 1, 1+, 2, 3, 4). [BOARD-CORE]

| Grade | Description |
|-------|-------------|
| 0 | No increase in muscle tone |
| 1 | Slight increase -- catch and release at end range |
| 1+ | Slight increase -- catch followed by minimal resistance through < half of ROM |
| 2 | More marked increase through most of ROM, but limb easily moved |
| 3 | Considerable increase -- passive movement difficult |
| 4 | Limb rigid in flexion or extension |

**Limitations of MAS:**
- Measures resistance to passive stretch at ONE speed only
- Does NOT differentiate between neural (spasticity) and non-neural (contracture) components
- Poor inter-rater reliability
- Does not capture velocity-dependence of spasticity [BOARD-CORE]

**2025 Update:** A major 2025 clinical outcomes review (Gal et al, Movement Disorders) explicitly excluded Ashworth-derived scales from recommendations for assessing true spasticity, emphasizing they do not align with contemporary definitions. The MAS classified spasticity more frequently than the Modified Tardieu Scale, potentially overestimating the neural component. [BOARD-EMERGING]

Source: Gal et al, Movement Disorders 2025; Beard et al, 2025; StatPearls NBK554572.

### Tardieu Scale / Modified Tardieu Scale

More specific for true (velocity-dependent) spasticity than MAS. [BOARD-CORE]

| Feature | Tardieu Scale | Modified Ashworth Scale |
|---------|--------------|----------------------|
| What it measures | Velocity-dependent catch angle | Resistance at one speed |
| Testing speeds | Three velocities: V1 (slow), V2 (gravity speed), V3 (fast as possible) | One standard speed |
| Key measurement | R1 (angle of catch at fast speed) vs R2 (full passive ROM at slow speed); R2-R1 = dynamic component | Ordinal grade 0-4 |
| Differentiates neural vs non-neural | YES -- R2-R1 identifies neural component | NO |
| Clinical advantage | Detects true velocity-dependent spasticity | Simple, quick, widely used |
| Limitation | More complex, less standardized | Poor inter-rater reliability |

**Board Pearl:** A large R2-R1 gap = significant spasticity amenable to botulinum toxin. A small gap with limited R2 = fixed contracture requiring serial casting or surgical intervention. [BOARD-CORE]

**2025 Update:** The Tardieu Scale is now the ONLY clinician-reported outcome recommended for assessing spasticity per the 2025 Movement Disorders clinical outcomes review. This represents a significant paradigm shift from decades of MAS predominance in clinical practice. [BOARD-EMERGING]

Source: Gal et al, Movement Disorders 2025; App content.

## 1.4 Spasticity Treatment Ladder

### Step 1: Stretching, Positioning, and ROM

- Daily ROM exercises, prolonged stretching (20-30 min sustained stretch more effective than brief stretching)
- Proper positioning to counteract spastic patterns
- Anti-spasticity positioning: UE in abduction/ER/extension; LE in neutral rotation, slight knee flexion, ankle at 90 degrees
- Standing programs: 30-60 min/day for LE contracture prevention [BOARD-CORE]

Source: Cuccurullo, Chapter 1; DeLisa, Chapter 18.

### Step 2: Splinting and Orthotics

- Resting hand splint to prevent wrist/finger flexion contracture
- AFO for equinovarus foot control
- Static or dynamic splints to maintain range
- Serial casting for established contracture (casts changed every 5-7 days at increasing stretch) [BOARD-CORE]

Source: Cuccurullo, Chapter 1.

### Step 3: Oral Medications

| Agent | Mechanism | Key Side Effects | Notes |
|-------|-----------|-----------------|-------|
| Baclofen | GABA-B receptor agonist | Sedation, weakness, withdrawal seizures | Most commonly used; crosses BBB poorly |
| Tizanidine | Alpha-2 adrenergic agonist | Sedation, dry mouth, hepatotoxicity | Monitor LFTs; comparable efficacy to baclofen |
| Dantrolene | Direct muscle relaxant (ryanodine receptor) | Hepatotoxicity, weakness | Only peripheral agent; monitor LFTs |
| Diazepam | GABA-A agonist | Sedation, dependence, cognitive impairment | Rarely first-line in stroke |

**Key Evidence (2023 Meta-analysis):** Oral antispasticity drugs show only modest efficacy in non-progressive neurological diseases. Tizanidine, dantrolene, baclofen, and gabapentin are more effective than placebo, but evidence is weak, trials are small and short, and adverse effects (sedation, weakness) are common. Efficacy is marginal at best. [BOARD-CORE]

**Board Pearl:** Dantrolene is the ONLY oral antispasticity agent that acts peripherally (at the muscle level via ryanodine receptor). All others act centrally. This is a frequently tested distinction. [BOARD-CORE]

Source: Yelnik et al, J Pharm Bioallied Sci 2023; Cuccurullo, Chapter 1.

### Step 4: Botulinum Toxin Injections

OnabotulinumtoxinA (Botox), abobotulinumtoxinA (Dysport), or incobotulinumtoxinA (Xeomin). [BOARD-CORE]

**Mechanism:** Blocks presynaptic acetylcholine release at the neuromuscular junction by cleaving SNARE proteins. [BOARD-CORE]

**Pharmacokinetics:**
- Onset: 2-3 days to 2 weeks
- Peak effect: 2-6 weeks
- Duration: 3-6 months (requires re-injection) [BOARD-CORE]

**Injection Guidance (2023 Bayesian Network Meta-analysis):**
- Strong Level 1 evidence supports guided injections over anatomic localization
- Ultrasound guidance ranked BEST, followed by electrical stimulation, then EMG
- US provides real-time visualization of muscles, nerves, and vessels
- Combined US + e-stim offers advantages in complex cases [BOARD-LIKELY]

Source: PMC 10145352; Toxins 2023.

#### Common Injection Targets in Stroke

| Region | Target Muscle | Pattern Treated | Guidance |
|--------|--------------|----------------|----------|
| UE -- Elbow flexion | Biceps, brachialis, brachioradialis | Elbow flexion synergy | EMG/US/e-stim |
| UE -- Forearm pronation | Pronator teres, pronator quadratus | Persistent pronation | EMG/US |
| UE -- Wrist flexion | FCR, FCU | Wrist flexion deformity | Palpation/US; FCR most common |
| UE -- Finger flexion | FDP, FDS | Clenched fist, hygiene | US preferred (deep/superficial) |
| UE -- Thumb-in-palm | FPL, adductor pollicis, 1st DI | Thumb across palm | Low doses per muscle |
| LE -- Equinus | Gastroc (med/lat), soleus | Ankle plantarflexion | Most common LE target |
| LE -- Varus | Tibialis posterior | Ankle inversion | Deep; US/e-stim essential |
| LE -- Stiff knee | Rectus femoris | Stiff-legged gait | Palpation usually sufficient |
| LE -- Adducted thigh | Adductor longus, magnus | Scissoring gait | Phenol often preferred here |
| LE -- Toe curling | FDL, FHL | Claw toes | US guided; small doses |

[BOARD-CORE]

**Functional Outcomes:** BoNT-A is unlikely to improve active UE function (reaching/grasping) in most patients but may improve passive function (hand hygiene, dressing facilitation) and pain. [BOARD-CORE]

**Early Treatment Timing (2024-2025 Evidence):**
- Early BoNT-A treatment (within 12 weeks post-stroke) may reduce contracture development
- Early treatment within 1 year post-stroke positively impacts goal attainment
- A 2025 secondary analysis suggests early injection may improve motor recovery
- However, 2025 meta-analysis found no significant difference between early BoNT-A and placebo for pain-related spasticity specifically [BOARD-LIKELY]

Source: Frontiers Rehab Sci 2021; Toxins 2025 17(5):258; MDPI Toxins 2025 17(11):558; J Rehab Med consensus guide.

### Step 5: Phenol/Alcohol Nerve Blocks

Chemical neurolysis with phenol (5-7%) or alcohol (45-100%). [BOARD-CORE]

**Mechanism:** Denatures protein causing wallerian degeneration. [BOARD-CORE]

| Feature | Botulinum Toxin | Phenol/Alcohol |
|---------|----------------|----------------|
| Mechanism | Blocks presynaptic ACh release | Chemical neurolysis |
| Onset | Gradual (days to weeks) | Immediate (minutes) |
| Duration | 3-6 months | 3-6 months (variable, can be longer) |
| Cost | Expensive ($600-2000+/session) | Very inexpensive ($5-20/vial) |
| Best targets | Small muscles, precise targeting | Large muscles, pure motor nerves |
| Key risk | Diffusion; antibody formation | Painful dysesthesia if sensory fibers affected |
| Guidance | EMG, US, or e-stim | E-stim essential for motor point localization |

**Board Pearl -- Phenol for Obturator Nerve:** The obturator nerve is a PURE motor nerve to the adductors, making it an ideal phenol target with minimal dysesthesia risk. Classic treatment for hip adductor spasticity causing scissoring gait. In contrast, phenol to the tibial nerve (mixed motor/sensory) carries significant dysesthesia risk -- botulinum toxin preferred for ankle/foot spasticity. [BOARD-CORE]

**2021 Evidence Update:** Early use of phenol neurolysis may reduce the total amount of botulinum toxin needed in post-stroke spasticity management. Most commonly injected nerves: tibial motor branches, sciatic motor branches, pectoral nerves, obturator nerve, and musculocutaneous nerve. Dysesthesia incidence with modern US-guided technique: only 0.7%. [BOARD-LIKELY]

Source: Frontiers Rehab Sci 2021; Cuccurullo, Chapter 1; StatPearls NBK525978.

### Step 6: Intrathecal Baclofen (ITB) Pump

Surgically implanted pump delivers baclofen directly to intrathecal space. [BOARD-CORE]

**Key Facts:**
- 100-1000x more effective than oral baclofen at 1/100th the dose
- Best for severe bilateral/generalized spasticity
- Trial injection (50-100 mcg bolus via lumbar puncture) required before implantation
- Reduces Ashworth scores significantly: LE scores from 3.3 to 1.4 in studies [BOARD-CORE]

**2024 Meta-analysis (Brain and NeuroRehabilitation):**
- Moderate-level evidence supports ITB efficacy for stroke spasticity
- Reduces both UE and LE spasticity
- Improves pain and quality of life (SISTERS study)
- However, complications are frequent: 25.7% device-related, with 50.3% catheter-specific and 21.3% pump-specific issues [BOARD-LIKELY]

**Stroke-Specific Considerations:**
- Limited experience compared to SCI/MS populations
- Some evidence for improved walking speed and functional mobility in ambulatory stroke patients
- Uncommonly used in stroke due to medical comorbidities
- Useful in selected cases for hygiene improvement, pain reduction, and function [BOARD-CORE]

**Board Pearl -- ITB Withdrawal:** Abrupt discontinuation can cause life-threatening withdrawal: high fever, altered mental status, rebound spasticity, rhabdomyolysis, multiorgan failure. Treat with IV benzodiazepines and oral/enteral baclofen. This is a medical emergency. [BOARD-CORE]

Source: Brain and NeuroRehab 2024; Neuromodulation 2020; Cuccurullo, Chapter 1.

---

# PART 2: HEMIPLEGIC SHOULDER PAIN

## 2.1 Overview

Shoulder pain occurs in 70-84% of hemiplegic patients and is one of the most common and debilitating complications after stroke. Of patients with shoulder pain, 85% develop it during the spastic phase. It significantly interferes with rehabilitation, sleep, and functional recovery. Multiple etiologies often coexist. [BOARD-CORE]

Source: Lombard et al, 2009; Cuccurullo, Chapter 1; DeLisa, Chapter 18.

## 2.2 Etiologies

1. **Glenohumeral subluxation** -- most common structural finding
2. **Rotator cuff injury** -- impingement, tendinopathy, tears (22-40% on US/MRI)
3. **Adhesive capsulitis** (frozen shoulder)
4. **Spasticity-related pain** -- subscapularis, pectoralis major
5. **CRPS Type I** (shoulder-hand syndrome)
6. **Brachial plexopathy** -- traction injury to plexus/nerve
7. **Bicipital tendinitis**
8. **Myofascial pain**
9. **Central post-stroke pain** (thalamic pain / Dejerine-Roussy)
10. **Heterotopic ossification** (rare, elbow extensor side) [BOARD-CORE]

Source: Black-Schaffer Table 1-8; Cuccurullo, Chapter 1.

## 2.3 Glenohumeral Subluxation

**Pathogenesis:**
- Loss of supraspinatus and posterior deltoid muscle tone (primary stabilizers)
- Basmajian Principle: these muscles provide vertical force vector (the "locking mechanism") preventing inferior subluxation
- Capsule and superior capsular ligaments are secondary restraints
- In flaccid stage, loss of tone allows inferior subluxation
- Subluxation does NOT necessarily correlate with pain severity [BOARD-CORE]

**Risk Factors (2025 Ultrasound Study):** Supraspinatus muscle thickness measured by ultrasound correlates with subluxation severity, providing an objective risk factor assessment tool. [BOARD-EMERGING]

**Grading:**
- Finger-breadth palpation of sub-acromial space
- 1 FB = mild, 1.5 FB = moderate, 2+ FB = severe
- Radiographic: distance from inferior acromion to superior humeral head [BOARD-CORE]

### Management

**Positioning and Prevention:**
- Support arm on lap tray, armrest, pillows
- NEVER let arm hang unsupported during standing/walking
- Avoid pulling on affected arm during transfers
- Avoid overhead pulleys -- can cause impingement and labral injury (AHA guideline) [BOARD-CORE]

**Slings:**
- Controversial -- may contribute to flexor synergy, immobility, contracture, adhesive capsulitis, learned nonuse
- Types: single strap, GivMohr, Bobath roll, Harris hemi-sling
- Friedland (1975): slings do not prevent/correct subluxation
- Most specialists limit sling use to upright mobility only [BOARD-CORE]

**FES for Subluxation (2025 Network Meta-analysis):**
- NMES is the most effective intervention for reducing subluxation in acute/subacute stroke
- FES to supraspinatus and posterior deltoid: 30-60 min/day, 5-7 days/week, 4-6 weeks
- Optimal parameters: frequency 10-36 Hz, pulse width 200-300 microseconds
- Must start early (within first few weeks) for best results
- Effects may not persist beyond the intervention period
- BT-CCFES (bilateral training guided by contralaterally controlled FES) is a newer approach showing promise [BOARD-CORE for FES, BOARD-LIKELY for BT-CCFES]

Source: JCM 2025 Network Meta-analysis; Frontiers Neurology 2025; Sagepub Zhou et al 2025.

**Kinesiotaping (2020-2025 Evidence):**
- 2025 network meta-analysis: most effective intervention for enhancing functional recovery and reducing pain during activity
- 2022 meta-analysis (9 RCTs, 253 patients): significantly reduced pain (mean difference -1.59), improved ROM (+7 degrees), reduced subluxation distance (-0.42 mm)
- Mechanism: proprioceptive feedback, joint stability, pain modulation, lymphatic drainage
- No significant side effects
- Does not improve upper limb function (FMA-UE) or ADL independence [BOARD-LIKELY]

Source: Deng et al, Clin Rehabil 2021; AJTR 2022; JCM 2025.

## 2.4 Rotator Cuff Tears in Hemiplegic Shoulder

- Prevalence: 22-40% on US/MRI
- Often pre-existing (age-related) but worsened by subluxation
- Supraspinatus tear most common
- Mechanism: inferior subluxation stretches supraspinatus; abnormal scapulohumeral rhythm causes impingement
- Diagnosis: US is first-line (dynamic, portable, inexpensive)
- Management: usually conservative; surgery rarely indicated in severe hemiplegia [BOARD-CORE]

Source: Cuccurullo, Chapter 1; App content.

## 2.5 Shoulder Pain Prevention

- Avoid overhead pulleys (can cause impingement/labral injury)
- Gentle PROM within pain-free range
- External rotation ROM most important to maintain
- Scapular mobilization BEFORE glenohumeral ROM
- Educate ALL staff on proper handling techniques
- Avoid traction on affected arm during transfers [BOARD-CORE]

Source: AHA guidelines; Cuccurullo, Chapter 1.

## 2.6 Suprascapular Nerve Block

**Evidence (2020-2025):**
- 2021 systematic review and meta-analysis (8 studies, 281 patients): safe and effective for hemiplegic shoulder pain
- 2020 RCT: local anesthetic + corticosteroid provides superior pain reduction vs placebo
- Improves pain-related spasticity and passive shoulder ROM
- Quality of life improvements at 1 month
- 2025 case series: combined SSNB + intra-articular corticosteroid injection shows promise as multimodal approach [BOARD-LIKELY]

Source: Frontiers Neurology 2021; PubMed 32388647; Frontiers Neurology 2025.

## 2.7 Injection Therapies for HSP

**2025 Systematic Review and Meta-analysis (Frontiers Neurology):**
- Searched PubMed, Embase, Cochrane through April 2025
- Evaluated suprascapular nerve block, botulinum toxin, and anesthetic interventions
- BoNT-A effective for hemiplegic shoulder pain (2021 meta-analysis confirmed)
- Low-frequency electrical stimulation also demonstrated significant positive effects [BOARD-LIKELY]

Source: Frontiers Neurology 2025; PubMed 33454279.

## 2.8 Repetitive Transcranial Magnetic Stimulation (rTMS) for HSP

**2024 Systematic Review:** rTMS is an emerging non-invasive treatment modality being investigated for post-stroke hemiplegic shoulder pain, though evidence is still preliminary and routine clinical use is not yet supported. [BOARD-EMERGING]

Source: Neurological Sciences, Springer 2024.

---

# PART 3: COMPLEX REGIONAL PAIN SYNDROME (CRPS)

## 3.1 Definition and Epidemiology

CRPS Type I (formerly reflex sympathetic dystrophy, shoulder-hand syndrome) occurs in 12-49% of stroke patients (12-25% with specific CRPS criteria). CRPS after stroke is Type I (no peripheral nerve injury -- follows CNS injury). The most common subtype in stroke is shoulder-hand syndrome. [BOARD-CORE]

Source: Cuccurullo, Chapter 1; DeLisa, Chapter 18.

## 3.2 Pathogenesis

- Abnormal adrenergic sensitivity in injured nociceptors
- Locally secreted sympathetic neurotransmitters trigger painful afferent activity
- Cutaneous injury activates nociceptor fibers leading to central pain sensitization
- Low-threshold mechanoreceptor input develops capacity to evoke pain
- Efferent sympathetic fibers develop capacity to activate nociceptor fibers
- Central nervous system reorganization affects primary somatosensory cortex
- Localized neurogenic inflammation causes edema, vasodilation, hyperhidrosis [BOARD-CORE]

Source: Cuccurullo, Chapter 1.

## 3.3 Clinical Stages

| Stage | Name | Timeline | Shoulder | Hand | Imaging |
|-------|------|----------|----------|------|---------|
| 1 | Acute/Warm | 0-3 months | Diffuse pain, limited ROM (especially ER/abduction) | Dorsal edema, warmth, erythema, sweating, MCP tenderness | X-ray may be normal; bone scan shows diffuse uptake |
| 2 | Dystrophic/Cold | 3-9 months | Persistent stiffness | Cool, cyanotic; brawny edema; finger ROM decreasing | Patchy osteoporosis (Sudeck atrophy) |
| 3 | Atrophic | 9-12+ months | Adhesive capsulitis may be fixed | Glossy, pale, atrophic skin; severe contractures; muscle wasting | Marked diffuse osteoporosis; irreversible changes |

[BOARD-CORE]

Source: Cuccurullo, Chapter 1; App content.

## 3.4 Diagnosis

**Budapest Criteria (2003, revised 2010):** [BOARD-CORE]

1. Continuing pain disproportionate to inciting event
2. At least 1 SYMPTOM in 3 of 4 categories:
   - Sensory: hyperesthesia, allodynia
   - Vasomotor: temperature asymmetry, skin color changes
   - Sudomotor/Edema: edema, sweating changes
   - Motor/Trophic: decreased ROM, weakness, tremor, hair/nail/skin changes
3. At least 1 SIGN in 2 or more categories at evaluation
4. No other diagnosis better explains findings

**Sensitivity 85%, Specificity 69%** (clinical); research criteria require signs in 3/4 categories for higher specificity. [BOARD-CORE]

**Diagnostic Tests:**
- **Triple phase bone scan** -- most sensitive early test (sensitivity ~92%, specificity ~56%, PPV ~58%, NPV ~91%)
- Diffusely increased juxta-articular tracer activity on delayed images is most sensitive indicator (sensitivity 96%, specificity 97%, PPV 88%)
- MCP tenderness to compression: 100% predictive value, 85% sensitivity, 100% specificity (Wang et al, 1998)
- X-rays: patchy osteoporosis but only in later stages (need 30-50% demineralization for detection)
- EMG: absence of spontaneous activity predicts CRPS development [BOARD-CORE]

**Stellate ganglion block:** Successful if patient develops ipsilateral Horner syndrome. Alleviation of pain confirms sympathetically mediated CRPS. Gold standard for diagnosis of sympathetically mediated pain. [BOARD-CORE]

Source: Cuccurullo, Chapter 1; App content.

## 3.5 Treatment

**Early aggressive treatment is critical -- outcomes worsen with delay.** [BOARD-CORE]

1. **ROM exercises and stress loading program** (scrubbing and carrying) -- within 3 weeks, pain-free for most (<4-6 days with passive stretch)
2. **Corticosteroids** -- most effective in early acute CRPS (Stage 1). Prednisone 100-200 mg/day or 1 mg/kg, tapered over 2 weeks. More effective in bone-scan-confirmed CRPS. In one study, 31/34 MCA stroke patients became pain-free by 14 days with methylprednisolone 8 mg QID for 2 weeks then taper.
3. **Bisphosphonates** -- may help with bone pain and osteoporosis
4. **Gabapentin/pregabalin** -- for neuropathic pain component
5. **TENS** -- for pain management
6. **Mirror therapy** -- growing evidence base
7. **Stellate ganglion block** -- for UE CRPS (diagnostic and therapeutic)
8. **Vitamin C 500 mg/day** -- may have preventive benefit
9. **Other medications:** NSAIDs, TCAs, calcitonin, alpha-adrenergic blockers (clonidine, prazosin), beta-blockers, calcium channel blockers, topical capsaicin
10. **Edema control:** compression glove, retrograde massage, elevation
11. **Desensitization techniques, contrast baths**
12. **Radiofrequency or surgical sympathectomy** -- last resort [BOARD-CORE]

**2022 Cross-sectional Study:** Upper limb inactivity is significantly associated with post-stroke CRPS severity, supporting the importance of early mobilization and active rehabilitation programs. [BOARD-LIKELY]

Source: Cuccurullo, Chapter 1; PMC 9587704.

## 3.6 CRPS vs Central Post-Stroke Pain (Dejerine-Roussy Syndrome)

| Feature | CRPS Type I | Central Post-Stroke Pain |
|---------|------------|------------------------|
| Mechanism | Peripheral/sympathetic dysregulation | Spinothalamocortical pathway damage |
| Location | Distal extremity (hand/foot) | Hemibody (contralateral to stroke) |
| Onset | Early (weeks) | Delayed (1-6 months) |
| Edema/Vasomotor | YES -- hallmark | NO |
| Trophic changes | YES | NO |
| Associated stroke | Any | Thalamic (VPL nucleus), lateral medullary (Wallenberg), cortical |
| Character | Burning with edema, color changes | Burning, lancinating, freezing; allodynia, hyperalgesia |
| Treatment | Steroids, sympathetic blocks, PT | Amitriptyline (first-line), gabapentin, pregabalin, lamotrigine |
| Opioid response | Variable | Generally ineffective |

**Board Pearl:** These are distinct entities that CAN coexist. The presence of edema and vasomotor/trophic changes distinguishes CRPS from central pain. Opioids are generally ineffective for central neuropathic pain. [BOARD-CORE]

Source: App content; Cuccurullo, Chapter 1.

---

# PART 4: OTHER MUSCULOSKELETAL COMPLICATIONS

## 4.1 Heterotopic Ossification (HO)

- Occurs in ~0.5-1% of stroke patients (less common than TBI/SCI)
- **Most common location: EXTENSOR (lateral) side of the elbow** -- this differs from HO in SCI (more commonly hip) [BOARD-CORE]
- Elevated alkaline phosphatase (nonspecific)
- Triple phase bone scan most sensitive early test
- X-rays lag 2-6 weeks behind
- Treatment: gentle ROM (do NOT force through HO), NSAIDs, etidronate disodium
- Surgery only after HO is mature (12-18 months, normal alk phos) [BOARD-CORE]

Source: Cuccurullo, Chapter 1.

## 4.2 Contracture Prevention

- Equinovarus foot -- most common LE contracture
- Wrist/finger flexion -- most common UE contracture
- Prevention: daily ROM (minimum 2x/day), proper positioning, splinting
- Serial casting for established contracture (changed every 5-7 days)
- Botox BEFORE casting improves outcomes (reduces tone to allow better stretch)
- Dynamic splinting for mild-moderate contracture [BOARD-CORE]

Source: App content; Cuccurullo, Chapter 1.

## 4.3 Osteoporosis and Fracture Risk

- BMD decreases on hemiplegic side within weeks (up to 14% loss in first year)
- Proximal femur on hemiplegic side is most common fracture site
- DEXA scan of hemiplegic hip for monitoring
- Weight-bearing exercise and vitamin D supplementation recommended
- Bisphosphonates if osteoporosis confirmed [BOARD-CORE]

Source: App content.

## 4.4 Hemiplegic Gait Deviations

- **Circumduction** -- swing leg in lateral arc (stiff knee + ankle PF)
- **Hip hiking** -- pelvis elevation on swing side to clear foot
- **Trendelenburg** -- weak hip abductors cause pelvis drop
- **Equinovarus** -- spastic tibialis posterior and gastroc
- **Genu recurvatum** -- knee hyperextension
- AFO prescribed to control equinovarus; articulated AFO allows DF, blocks PF [BOARD-CORE]

Source: App content.

---

# PART 5: COMPREHENSIVE DIFFERENTIAL DIAGNOSIS TABLE

## Poststroke Shoulder Pain Differential (Adapted from Black-Schaffer/Cuccurullo Table 1-8)

| Feature | Inferior Subluxation | Rotator Cuff Tear | CRPS Type I | Adhesive Capsulitis | Impingement | Bicipital Tendinitis |
|---------|---------------------|-------------------|------------|--------------------|--------------|--------------------|
| Exam | Acromiohumeral separation; flaccid | Positive abduction; positive drop arm; skin changes possible | MCP compression test; skin/edema changes | External rotation <15 degrees; early decrease in scapular motion | Pain with abduction 70-90 degrees; forward flexion pain | Positive Speed/Yergason test |
| Diagnostic Test | X-ray standing; scapular plane view | X-ray, arthrogram, MRI, subacromial lidocaine | Triple phase bone scan; stellate ganglion block | Arthrogram | Subacromial injection of lidocaine | Tendon sheath injection of lidocaine |
| Treatment | Sling when upright; FES | Steroid injection; PT/ROM; possible surgical repair; reduction of internal RC tone | Oral corticosteroids; stellate ganglion block; intra-articular steroids; oral steroids | PT/ROM; debridement manipulation; subacromial/GH steroid injection; intra-articular steroids | PT/ROM; scapular mobilization; subacromial steroid injection | PT/ROM; reduction of internal rotator cuff tone; subacromial steroid injection |

[BOARD-CORE]

Source: Black-Schaffer RM, Osberg JS. Arch Phys Med Rehabil. 1990;71:285-290; Cuccurullo Table 1-8.

---

# PART 6: ANTI-SPASTICITY POSITIONING GUIDE

| Joint | Spastic Pattern | Corrective Position |
|-------|----------------|-------------------|
| Shoulder | Adduction, internal rotation | Abduction, external rotation; supported on pillow |
| Elbow | Flexion | Extension; elbow splint at night if needed |
| Forearm | Pronation | Neutral to slight supination |
| Wrist | Flexion, ulnar deviation | Neutral to slight extension; resting hand splint |
| Fingers | Flexion, thumb-in-palm | Extension with finger spreader or cone |
| Hip | Adduction, internal rotation | Neutral alignment; trochanter roll |
| Knee | Extension | Slight flexion in bed (small roll behind knee) |
| Ankle | Plantarflexion, inversion | Neutral dorsiflexion; pillows or AFO |

[BOARD-CORE]

Source: App content.

---

*Document prepared for NotebookLM ingestion. All claims source-tagged. Board-readiness levels assigned per PM&R exam relevance.*
*Date: 2026-03-21*
*Module: Spasticity & Shoulder Complications*
*App: CVA Training (PM&R Board Prep)*
