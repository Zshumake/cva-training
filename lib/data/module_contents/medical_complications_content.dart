import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData medicalComplicationsContent = TopicData(
  id: 'medical_complications',
  title: 'Medical Complications After Stroke',
  tabs: [
    // ── Tab 1: DVT/VTE ──
    TopicTab(
      title: 'DVT/VTE',
      blocks: [
        HeaderBlock('Venous Thromboembolism After Stroke'),
        TextBlock(
          'Deep venous thrombosis (DVT) occurs in 20-75% of untreated hemiplegic '
          'stroke patients, making it one of the most common and dangerous '
          'medical complications. Pulmonary embolism (PE) is the most common '
          'cause of death between 2-4 weeks poststroke. Prophylaxis is essential '
          'for all immobilized stroke patients.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'DVT Risk Factors in Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Hemiplegia/immobility — Virchow triad (stasis)',
            'Older age',
            'Obesity',
            'Prior DVT/PE',
            'AF and cardiac disease',
            'Dehydration',
            'Lower extremity paresis (DVT most common in paretic leg)',
            'Hemorrhagic stroke patients — cannot use anticoagulant prophylaxis',
          ],
        ),
        BulletCardBlock(
          title: 'DVT Prophylaxis — Ischemic Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'LMWH (enoxaparin 40 mg SQ daily) — preferred pharmacologic agent',
            'Unfractionated heparin 5000 units SQ BID-TID — alternative',
            'Intermittent pneumatic compression (IPC) devices — all immobile patients',
            'Early mobilization — most important nonpharmacologic intervention',
            'Graduated compression stockings (TED hose) — NOT recommended alone (CLOTS trials)',
            'CLOTS 1 trial: Graduated compression stockings did NOT reduce DVT',
            'CLOTS 3 trial: IPC significantly reduced DVT in immobile stroke patients',
            'Combine pharmacologic + IPC for highest-risk patients',
          ],
        ),
        KnowledgeCheckBlock(
          question: 'According to the CLOTS trials, which DVT prophylaxis method is effective in immobile stroke patients?',
          options: [
            'Thigh-length graduated compression stockings',
            'Below-knee graduated compression stockings',
            'Intermittent pneumatic compression (IPC) devices',
            'Elastic bandage wrapping',
          ],
          correctIndex: 2,
          explanation: 'CLOTS 3 showed that IPC devices significantly reduce DVT in immobile stroke patients (NNT = 28). CLOTS 1 showed compression stockings do NOT reduce DVT and increase skin complications. IPC, not stockings, should be used.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'CLOTS Trials — Compression Stockings Are Not Effective',
          'The CLOTS trials are landmark studies for stroke DVT prophylaxis. '
          'CLOTS 1 showed that graduated compression stockings (GCS/TED hose) '
          'do NOT reduce DVT and INCREASE skin complications. CLOTS 3 showed '
          'that intermittent pneumatic compression (IPC) devices significantly '
          'reduce DVT risk. Bottom line: use IPC, NOT stockings alone. This is '
          'a frequently tested board fact.',
        ),
        BulletCardBlock(
          title: 'DVT Prophylaxis — Hemorrhagic Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'IPC devices — mainstay (start on admission)',
            'Pharmacologic prophylaxis delayed until hematoma is stable',
            'Typically start LMWH at 48-72 hours if no hematoma expansion',
            'Some centers wait up to 7-14 days',
            'Early mobilization when medically stable',
            'IVC filter — rarely indicated, only for proven DVT when anticoagulation contraindicated',
          ],
        ),
        TableBlock(
          title: 'DVT/PE Diagnosis',
          columns: ['Test', 'Use', 'Key Points'],
          rows: [
            [
              'Duplex ultrasound',
              'First-line for DVT',
              'High sensitivity for proximal DVT, lower for calf DVT',
            ],
            ['D-dimer', 'Screening', 'High NPV — useful to rule OUT DVT. Often elevated poststroke'],
            [
              'CT pulmonary angiography',
              'Gold standard for PE',
              'Rapid, widely available, high sensitivity/specificity',
            ],
            [
              'V/Q scan',
              'Alternative for PE',
              'When CTA contraindicated (renal insufficiency, contrast allergy)',
            ],
            [
              'Venography',
              'Historical gold standard for DVT',
              'Rarely used — invasive, replaced by ultrasound',
            ],
          ],
        ),
        ScaleBlock(
          scaleName: 'Wells Score for DVT',
          description:
              'A clinical prediction rule that estimates the probability of DVT '
              'based on clinical features. Used to guide diagnostic workup.',
          columns: ['Clinical Feature', 'Points'],
          rows: [
            ['Active cancer (treatment within 6 months or palliative)', '+1'],
            ['Paralysis, paresis, or recent immobilization of lower extremity', '+1'],
            ['Recently bedridden >3 days or major surgery within 12 weeks', '+1'],
            ['Localized tenderness along distribution of deep venous system', '+1'],
            ['Entire leg swollen', '+1'],
            ['Calf swelling >3 cm compared to asymptomatic leg (measured 10 cm below tibial tuberosity)', '+1'],
            ['Pitting edema confined to symptomatic leg', '+1'],
            ['Collateral superficial veins (non-varicose)', '+1'],
            ['Previously documented DVT', '+1'],
            ['Alternative diagnosis at least as likely as DVT', '-2'],
          ],
          boardPearl:
              'Score >=3: HIGH probability (~75% prevalence) — proceed directly to ultrasound. '
              'Score 1-2: MODERATE probability (~17%) — D-dimer, then ultrasound if positive. '
              'Score <=0: LOW probability (~5%) — D-dimer; if negative, DVT effectively ruled out. '
              'Note: stroke patients inherently score high (paralysis +1, bedridden +1) making '
              'Wells score less useful — maintain high clinical suspicion in all immobile stroke patients.',
        ),
        TableBlock(
          title: 'CLOTS 1, 2, and 3 Trials — Summary',
          columns: ['Trial', 'Intervention', 'Findings', 'Clinical Implication'],
          rows: [
            [
              'CLOTS 1 (2009)',
              'Thigh-length graduated compression stockings (GCS) vs no stockings',
              'GCS did NOT reduce DVT. Increased skin complications (skin breaks, ulcers, blisters)',
              'Do NOT use compression stockings for DVT prevention in immobile stroke patients',
            ],
            [
              'CLOTS 2 (2010)',
              'Thigh-length GCS vs below-knee GCS',
              'Neither was effective; thigh-length slightly less ineffective but neither recommended',
              'Below-knee stockings are NOT a suitable alternative — neither length works',
            ],
            [
              'CLOTS 3 (2013)',
              'Intermittent pneumatic compression (IPC) vs no IPC in immobile stroke patients',
              'IPC significantly reduced DVT (absolute risk reduction ~3.6%). NNT = 28',
              'IPC IS effective and recommended for all immobile stroke patients',
            ],
          ],
        ),
      ],
    ),

    // ── Tab 2: Bladder & Bowel ──
    TopicTab(
      title: 'Bladder & Bowel',
      blocks: [
        HeaderBlock('Bladder & Bowel Dysfunction After Stroke'),
        TextBlock(
          'Urinary incontinence affects 50-70% of stroke patients in the first '
          'month and is a strong negative predictor of functional outcome and '
          'discharge disposition. Bowel incontinence occurs in approximately '
          '31% of acute stroke patients. Understanding the neuroanatomy of '
          'bladder control is essential for management.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Bladder Types After Stroke',
          columns: ['Type', 'Mechanism', 'Urodynamics', 'Treatment'],
          rows: [
            [
              'Uninhibited Neurogenic (Spastic)',
              'Loss of cortical inhibition of pontine micturition center (UMN lesion)',
              'Detrusor hyperreflexia — involuntary contractions at low volumes',
              'Timed voiding, anticholinergics (oxybutynin), behavioral training',
            ],
            [
              'Areflexic (Flaccid)',
              'Acute stage — spinal shock equivalent or detrusor underactivity',
              'Detrusor areflexia — large volumes, overflow incontinence',
              'Intermittent catheterization, Crede/Valsalva (caution)',
            ],
            [
              'Detrusor-Sphincter Dyssynergia',
              'Incoordination of detrusor contraction and sphincter relaxation',
              'High pressures, incomplete emptying, UTI risk',
              'Alpha-blocker (tamsulosin), intermittent catheterization',
            ],
          ],
        ),
        KnowledgeCheckBlock(
          question: 'What is the most common type of neurogenic bladder after stroke?',
          options: [
            'Areflexic (flaccid) bladder',
            'Uninhibited neurogenic (spastic) bladder with detrusor hyperreflexia',
            'Detrusor-sphincter dyssynergia',
            'Overflow incontinence from outlet obstruction',
          ],
          correctIndex: 1,
          explanation: 'The uninhibited neurogenic bladder (detrusor hyperreflexia) is the most common type after stroke because stroke is an upper motor neuron lesion. Loss of cortical inhibition of the pontine micturition center causes involuntary detrusor contractions at low volumes, resulting in urge incontinence.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'Most Common Bladder Type After Stroke',
          'The most common bladder dysfunction after stroke is the UNINHIBITED '
          'neurogenic bladder (detrusor hyperreflexia) because stroke is an '
          'UPPER motor neuron lesion. The cortical micturition center (medial '
          'frontal lobe) normally inhibits the pontine micturition reflex. '
          'When this inhibition is lost, the detrusor contracts involuntarily '
          'at low bladder volumes, causing urge incontinence with frequency '
          'and urgency.',
        ),
        BulletCardBlock(
          title: 'Bladder Management Principles',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Remove indwelling catheter as soon as possible (within 24-48 hours)',
            'Catheter-associated UTI is a major complication',
            'Timed voiding schedule every 2-4 hours',
            'Post-void residual (PVR) monitoring — if >150 mL, consider intermittent cath',
            'Intermittent catheterization preferred over indwelling catheter',
            'Anticholinergics for detrusor hyperreflexia (oxybutynin, tolterodine)',
            'Side effects: dry mouth, constipation, confusion (especially in elderly)',
            'Behavioral strategies: fluid management, prompted voiding, pelvic floor exercises',
          ],
        ),
        HeaderBlock('Bowel Dysfunction'),
        BulletCardBlock(
          title: 'Bowel Incontinence & Constipation',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Bowel incontinence: ~31% in acute stroke, improves to ~10% by discharge',
            'Constipation: ~60% of stroke patients — more common than incontinence',
            'Causes: immobility, medications (opioids, anticholinergics), dehydration, diet changes',
            'Strong negative prognostic indicator for functional recovery',
            'Bowel program: timed toileting, adequate fiber (25-30g/day), fluids, stool softeners',
            'Digital stimulation and suppositories for neurogenic bowel',
            'Avoid chronic laxative use — leads to dependency',
            'Goal: regular, predictable bowel routine within 30 minutes of same time daily',
          ],
        ),
        PearlBlock(
          'Incontinence as a Prognostic Indicator',
          'Persistent urinary incontinence at 2 weeks poststroke is one of '
          'the strongest negative predictors of functional outcome and '
          'discharge to home. Patients who remain incontinent at 2 weeks are '
          'significantly more likely to require institutional care. Incontinence '
          'is included in most prognostic models for stroke rehabilitation '
          'outcomes (e.g., the Orpington Prognostic Scale).',
        ),
      ],
    ),

    // ── Tab 3: Cardiac ──
    TopicTab(
      title: 'Cardiac',
      blocks: [
        HeaderBlock('Cardiac Complications After Stroke'),
        TextBlock(
          'Cardiac disease is present in approximately 75% of stroke patients '
          'and is the leading cause of long-term mortality after stroke. '
          'Stroke can also directly cause cardiac complications through '
          'autonomic dysregulation, particularly with insular cortex lesions.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Cardiac Comorbidities in Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            '75% of stroke patients have coexisting cardiac disease',
            'Leading cause of death in long-term stroke survivors',
            'Atrial fibrillation — present in 15-25% of stroke patients',
            'Coronary artery disease — present in 20-40%',
            'Heart failure — present in 10-20%',
            'Shared risk factors: HTN, DM, hyperlipidemia, smoking, obesity',
            'All stroke patients should have cardiac evaluation',
          ],
        ),
        BulletCardBlock(
          title: 'Stroke-Induced Cardiac Changes',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'ECG changes occur in up to 70% of acute stroke patients',
            'QT prolongation — most common ECG abnormality',
            'T-wave inversions and ST changes (can mimic MI)',
            'Cardiac arrhythmias — AF, ventricular ectopy, sinus bradycardia',
            'Troponin elevation (without primary coronary disease)',
            'Takotsubo cardiomyopathy (stress cardiomyopathy)',
            'Insular cortex lesions (especially right) cause the most cardiac dysregulation',
            'Autonomic storm — catecholamine surge damages myocardium',
          ],
        ),
        TimelineBlock(
          title: 'DVT Prophylaxis & Complication Prevention Timeline',
          milestones: [
            TimelineMilestone(
              label: 'Day 0 (Admission)',
              title: 'Immediate Prophylaxis',
              details: ['Start IPC devices on both legs', 'Assess DVT risk factors', 'Remove indwelling urinary catheter ASAP (within 24-48 hours)'],
            ),
            TimelineMilestone(
              label: 'Day 1',
              title: 'Pharmacologic DVT Prophylaxis (Ischemic Stroke)',
              details: ['Start LMWH (enoxaparin 40 mg SQ daily)', 'Begin dysphagia screening and aspiration precautions', 'Initiate skin inspection protocol'],
            ),
            TimelineMilestone(
              label: 'Days 2-3',
              title: 'Hemorrhagic Stroke Prophylaxis Window',
              details: ['Start LMWH if hematoma stable on repeat imaging', 'Some centers wait up to 7-14 days', 'Continue IPC as primary prophylaxis until then'],
            ),
            TimelineMilestone(
              label: 'Week 1',
              title: 'Early Mobilization & Complication Screening',
              details: ['Mobilize within 24-48 hours (avoid very early high-dose per AVERT)', 'Screen for depression, cognitive impairment', 'Begin bowel program if constipation develops'],
            ),
            TimelineMilestone(
              label: 'Weeks 2-4',
              title: 'Ongoing Monitoring',
              details: ['Assess continence -- persistent incontinence at 2 weeks is a negative prognostic sign', 'Monitor for DVT signs (leg swelling, pain)', 'Cardiac telemetry for at least 24-72 hours; extended monitoring for cryptogenic stroke'],
            ),
            TimelineMilestone(
              label: 'Months 1-3',
              title: 'Transition to Long-Term Prevention',
              details: ['Transition DVT prophylaxis to therapeutic anticoagulation if indicated (AF)', 'Address seizure risk -- prophylactic anticonvulsants NOT recommended', 'Ongoing fall prevention and pressure injury prevention'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'Which insular cortex lesion is associated with sympathetic overactivity and higher risk of fatal cardiac arrhythmias after stroke?',
          options: ['Left insular cortex', 'Right insular cortex', 'Bilateral insular cortex', 'Posterior insular cortex'],
          correctIndex: 1,
          explanation: 'Right insular cortex lesions are associated with sympathetic overactivity (tachycardia, hypertension, arrhythmias, myocardial injury) and carry a higher risk of sudden cardiac death. Left insular lesions are associated with parasympathetic overactivity (bradycardia, hypotension).',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'Insular Cortex and Cardiac Autonomic Control',
          'The insular cortex is the primary cortical center for autonomic '
          'cardiovascular regulation. RIGHT insular lesions are associated with '
          'sympathetic overactivity (tachycardia, hypertension, arrhythmias, '
          'myocardial injury). LEFT insular lesions are associated with '
          'parasympathetic overactivity (bradycardia, hypotension). This is '
          'why right insular strokes carry a higher risk of sudden cardiac '
          'death and are associated with worse cardiac outcomes.',
        ),
        BulletCardBlock(
          title: 'Cardiac Monitoring & Workup',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Continuous cardiac telemetry for at least 24-72 hours minimum',
            '12-lead ECG on admission',
            'Extended cardiac monitoring (14-30 day Holter) for cryptogenic stroke',
            'Echocardiography — transthoracic (TTE) for all, TEE if cardioembolism suspected',
            'Implantable cardiac monitor (ICM/LINQ) — up to 3 years of monitoring',
            'CRYSTAL-AF trial: ICM detected AF in 30% of cryptogenic stroke patients at 3 years',
            'Troponin levels at admission',
          ],
        ),
        BulletCardBlock(
          title: 'Exercise After Stroke — Cardiac Considerations',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Exercise tolerance testing recommended before vigorous exercise program',
            'Peak VO2 typically 50-70% of age-matched controls in chronic stroke',
            'Deconditioning contributes significantly to disability',
            'Aerobic exercise: 20-60 min, 3-5 days/week at 40-70% HRR',
            'Monitor BP and HR response — exaggerated pressor response common',
            'Beta-blockers may blunt HR response — use RPE for intensity monitoring',
            'Exercise improves cardiovascular fitness AND functional outcomes',
          ],
        ),
        ComparisonCardBlock(
          title: 'Autonomic Dysfunction After Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.monitor_heart,
          description:
              'Stroke can disrupt central autonomic pathways, leading to '
              'cardiovascular, thermoregulatory, and sudomotor dysfunction. '
              'Insular cortex and hypothalamic lesions carry the highest risk.',
          keyPoints: [
            'Cardiac arrhythmias: AF, ventricular ectopy, QT prolongation — most common in first 72 hours',
            'Blood pressure variability: exaggerated swings, orthostatic hypotension, loss of circadian BP dipping',
            'Orthostatic hypotension: impairs early mobilization; treat with compression, fluids, gradual positioning, midodrine if needed',
            'Sweating abnormalities: hyperhidrosis or anhidrosis on the affected side',
            'Thermoregulatory dysfunction: impaired temperature regulation, especially with hypothalamic lesions',
            'Gastrointestinal dysmotility: gastroparesis, constipation from vagal and sympathetic disruption',
            'Urinary autonomic dysfunction: detrusor overactivity from loss of cortical inhibition',
            'Right insular stroke: sympathetic predominance — higher risk of fatal arrhythmias',
            'Left insular stroke: parasympathetic predominance — bradycardia risk',
            'Autonomic dysfunction contributes to sudden death in the first weeks after stroke',
          ],
        ),
      ],
    ),

    // ── Tab 4: Other ──
    TopicTab(
      title: 'Other',
      blocks: [
        HeaderBlock('Other Medical Complications'),
        TextBlock(
          'Stroke patients face numerous additional medical complications '
          'including falls, malnutrition, pressure injuries, seizures, and '
          'psychosocial challenges. A comprehensive rehabilitation approach '
          'addresses all of these domains.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Common Medical Complications — Prevalence',
          columns: ['Complication', 'Prevalence', 'Key Management'],
          rows: [
            ['Falls', '25% during rehabilitation', 'Balance training, environmental modification, hip protectors'],
            ['Malnutrition', '16% at admission, up to 35% during rehab', 'Nutritional screening, supplementation, dietitian consult'],
            ['Pressure ulcers', '3-14%', 'Turning schedule, pressure-relieving surfaces, nutrition, skin checks'],
            ['Seizures', '5-10% in first year', 'Anticonvulsants if recurrent; no prophylaxis recommended'],
            ['UTI', '15-30%', 'Remove catheter early, intermittent cath preferred, hydration'],
            ['Pneumonia', '10-20%', 'Dysphagia management, oral hygiene, aspiration precautions'],
            ['Contractures', '20-60%', 'ROM exercises, positioning, splinting, serial casting'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Falls Prevention',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.warning,
          description:
              'Falls occur in approximately 25% of stroke patients during '
              'inpatient rehabilitation and are even more common after discharge.',
          keyPoints: [
            'Risk factors: hemiplegia, neglect, cognitive impairment, impulsivity, medications',
            'Right hemisphere stroke patients — higher fall risk due to neglect and impulsivity',
            'Multifactorial fall prevention program recommended',
            'Balance training, strength training, gait training',
            'Environmental modifications (grab bars, raised toilet, adequate lighting)',
            'Medication review — reduce sedatives, antihypertensives, polypharmacy',
            'Hip protectors for high-risk patients',
            'Fear of falling limits activity — address with CBT and graded exposure',
          ],
        ),
        ComparisonCardBlock(
          title: 'Sexuality After Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.favorite,
          description:
              'Sexual dysfunction is common after stroke but rarely addressed. '
              'Prevalence of decreased sexual activity: 50-75%.',
          keyPoints: [
            'Physical barriers: hemiparesis, spasticity, fatigue, incontinence',
            'Psychological: depression, altered body image, fear of recurrent stroke',
            'Medication effects: antihypertensives, SSRIs, beta-blockers',
            'Safe to resume when medically stable — similar cardiac demand as climbing 2 flights of stairs',
            'Counseling should be offered proactively — patients rarely initiate discussion',
            'Positioning advice: affected side up, use of pillows for support',
            'PDE5 inhibitors generally safe but avoid with nitrates',
          ],
        ),
        BulletCardBlock(
          title: 'Poststroke Seizures',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Early seizures (<7 days): 2-5% — provoked by acute injury',
            'Late seizures (>7 days): 3-5% — represent epileptogenesis',
            'Cortical involvement increases seizure risk (especially hemorrhagic)',
            'Prophylactic anticonvulsants NOT recommended',
            'Treat if recurrent seizures or status epilepticus',
            'Levetiracetam preferred — fewer drug interactions than phenytoin',
            'Avoid phenytoin if possible (cognitive effects, drug interactions)',
          ],
        ),
        TableBlock(
          title: 'Early vs Late Post-Stroke Seizures',
          columns: ['Feature', 'Early Seizures (<7 days)', 'Late Seizures (>7 days)'],
          rows: [
            ['Mechanism', 'Acute cellular dysfunction: glutamate excitotoxicity, ionic shifts, metabolic derangement', 'Epileptogenesis: gliosis, neuronal reorganization, scar formation, altered GABAergic inhibition'],
            ['Prevalence', '2-5% of ischemic strokes; higher in hemorrhagic', '3-5%; cumulative risk increases over years'],
            ['Seizure type', 'Often focal with secondary generalization', 'Focal onset, may generalize; more likely recurrent'],
            ['Recurrence risk', 'Low (~30%) — many are isolated provoked seizures', 'High (~50-70%) — represents true poststroke epilepsy'],
            ['Treatment approach', 'Treat acutely if prolonged; short-term AED may be sufficient; no long-term AED for single early seizure', 'Long-term AED typically indicated — high recurrence constitutes epilepsy'],
            ['Risk factors', 'Hemorrhagic stroke, cortical involvement, large infarct, severe NIHSS', 'Hemorrhagic stroke, cortical involvement, early seizures (slight increased risk for late seizures)'],
            ['Preferred AED', 'Levetiracetam (fewer drug interactions, no hepatic metabolism)', 'Levetiracetam, lamotrigine (good cognitive profile); avoid phenytoin if possible'],
          ],
        ),
        BulletCardBlock(
          title: 'Pressure Injury Prevention',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Prevalence: 3-14% in stroke rehabilitation',
            'Common sites: sacrum, ischial tuberosities, heels, greater trochanter',
            'Reposition every 2 hours in bed',
            'Pressure-relieving mattress for high-risk patients',
            'Adequate nutrition — albumin >3.5, vitamin C, zinc',
            'Keep skin clean and dry — manage incontinence',
            'Daily skin inspections — especially insensate areas',
            'Weight shifts every 15-30 minutes in wheelchair',
            'Braden Scale for pressure injury risk assessment',
          ],
        ),
        ScaleBlock(
          scaleName: 'Braden Scale for Pressure Injury Risk',
          description:
              'The most widely used tool for predicting pressure injury risk. '
              'Six subscales scored 1-4 (or 1-3), with LOWER total score indicating '
              'HIGHER risk. Total score range: 6-23.',
          columns: ['Subscale', 'Scoring', 'What It Assesses'],
          rows: [
            ['Sensory Perception', '1-4', 'Ability to respond meaningfully to pressure-related discomfort'],
            ['Moisture', '1-4', 'Degree to which skin is exposed to moisture (incontinence, perspiration)'],
            ['Activity', '1-4', 'Degree of physical activity (bedfast, chairfast, walks occasionally, walks frequently)'],
            ['Mobility', '1-4', 'Ability to change and control body position'],
            ['Nutrition', '1-4', 'Usual food intake pattern and nutritional status'],
            ['Friction & Shear', '1-3', 'Level of friction and shear forces on skin during movement'],
          ],
          boardPearl:
              'Braden score <=18 = at risk. <=15 = moderate risk. <=12 = high risk. '
              '<=9 = very high risk. Stroke patients score low on sensory perception '
              '(hemisensory loss), activity (hemiplegia), and mobility (immobility) — '
              'making them inherently high risk. Intervene proactively for any patient '
              'with a Braden score <=18.',
        ),
        ComparisonCardBlock(
          title: 'Heterotopic Ossification (HO) After Stroke',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.broken_image,
          description:
              'Formation of mature lamellar bone in periarticular soft tissues. '
              'Less common in stroke than in TBI or SCI, but does occur.',
          keyPoints: [
            'Prevalence in stroke: ~0.5-1.2% clinically significant (much lower than TBI at 10-20% or SCI at 15-30%)',
            'Most common location: shoulder (glenohumeral) and elbow on the hemiplegic side',
            'Presents as painful, warm, swollen joint with progressive loss of ROM',
            'Can be confused with DVT, septic arthritis, or fracture',
            'Diagnosis: elevated alkaline phosphatase, triple-phase bone scan (most sensitive early), plain X-ray (delayed 4-6 weeks)',
            'Treatment: NSAIDs (indomethacin), gentle ROM (avoid aggressive stretching), etidronate',
            'Surgical excision only after maturation (typically 12-18 months, confirmed by normalization of bone scan)',
            'Radiation prophylaxis: used in TBI/SCI but rarely needed in stroke due to low incidence',
          ],
        ),
        ComparisonCardBlock(
          title: 'Osteoporosis on the Hemiplegic Side',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.accessibility_new,
          description:
              'Disuse osteoporosis develops rapidly on the hemiplegic side due '
              'to immobility and lack of weight-bearing, increasing fracture risk.',
          keyPoints: [
            'Bone mineral density (BMD) decreases significantly on the paretic side within weeks to months',
            'Hemiplegic hip and proximal humerus are most vulnerable',
            'Up to 4x increased fracture risk on the hemiplegic side compared to non-paretic side',
            'Falls + osteoporosis = high fracture risk — a dangerous combination in stroke survivors',
            'Hip fractures on the hemiplegic side have worse outcomes and higher mortality',
            'DEXA scan recommended for stroke patients with prolonged immobility',
            'Weight-bearing exercise and standing programs may slow bone loss',
            'Vitamin D and calcium supplementation recommended',
            'Bisphosphonates considered for documented osteoporosis',
          ],
        ),
        TableBlock(
          title: 'Post-Stroke Pain Syndromes — Comprehensive',
          columns: ['Pain Type', 'Mechanism', 'Characteristics', 'Treatment'],
          rows: [
            [
              'Central Post-Stroke Pain (CPSP)',
              'Thalamic or spinothalamocortical pathway lesion',
              'Burning, aching, lancinating pain in contralateral body; allodynia, hyperalgesia; often delayed onset (weeks-months)',
              'Amitriptyline, gabapentin/pregabalin, lamotrigine; opioids generally ineffective',
            ],
            [
              'Hemiplegic Shoulder Pain',
              'Subluxation, rotator cuff injury, adhesive capsulitis, spasticity, impingement',
              'Pain at rest and with movement; most common pain complaint in stroke (up to 72%); limits rehab',
              'Positioning, slings, ROM exercises, suprascapular nerve block, botulinum toxin for spasticity',
            ],
            [
              'Spasticity-Related Pain',
              'Velocity-dependent muscle hypertonicity from UMN lesion',
              'Cramping, tightness, painful muscle spasms; worse with positioning, triggers',
              'Stretching, oral antispasmodics (baclofen, tizanidine), botulinum toxin, intrathecal baclofen',
            ],
            [
              'Complex Regional Pain Syndrome (CRPS)',
              'Shoulder-hand syndrome; sympathetically mediated pain with autonomic changes',
              'Burning pain, edema, skin color/temperature changes, sweating abnormalities; typically hand/wrist',
              'Aggressive ROM, desensitization, corticosteroids (early), stellate ganglion block, mirror therapy',
            ],
            [
              'Musculoskeletal Pain',
              'Abnormal biomechanics, joint malalignment, compensatory overuse',
              'Pain in non-paretic limbs from overuse; back pain from asymmetric gait; knee hyperextension',
              'Biomechanical correction, bracing (AFO), strengthening, NSAIDs, physical therapy',
            ],
          ],
        ),
        ComparisonCardBlock(
          title: 'Nutritional Screening — MUST Tool',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.restaurant_menu,
          description:
              'The Malnutrition Universal Screening Tool (MUST) is a validated '
              '5-step screening tool to identify adults who are malnourished or '
              'at risk of malnutrition.',
          keyPoints: [
            'Step 1: BMI score — >20 = 0 points, 18.5-20 = 1 point, <18.5 = 2 points',
            'Step 2: Unplanned weight loss in past 3-6 months — <5% = 0, 5-10% = 1, >10% = 2',
            'Step 3: Acute disease effect — if acutely ill AND no nutritional intake for >5 days = 2 points',
            'Step 4: Add scores from steps 1-3 for overall risk',
            'Step 5: Management — Score 0 = low risk (routine care), 1 = medium risk (observe), >=2 = high risk (treat)',
            'Malnutrition in stroke: 16% at admission, rising to 26-35% during rehabilitation',
            'Dysphagia, depression, cognitive impairment, and upper extremity weakness all contribute to poor intake',
            'Dietitian referral recommended for all stroke patients with MUST score >=1',
            'Adequate protein intake (1.0-1.5 g/kg/day) important for tissue healing and functional recovery',
          ],
        ),
      ],
    ),
  ],
);
