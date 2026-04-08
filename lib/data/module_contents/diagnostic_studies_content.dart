import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData diagnosticStudiesContent = TopicData(
  id: 'diagnostic_studies',
  title: 'Diagnostic Studies',
  tabs: [
    // ── CT & MRI Tab ──
    TopicTab(
      title: 'CT & MRI',
      blocks: [
        HeaderBlock('Brain Imaging in Stroke'),
        TextBlock(
          'Brain imaging is the cornerstone of acute stroke evaluation. The '
          'primary goal is to distinguish ischemic from hemorrhagic stroke, as '
          'management differs fundamentally. Non-contrast CT is the initial '
          'study of choice because it is fast, widely available, and highly '
          'sensitive for acute hemorrhage.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Non-Contrast CT (NCCT)',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.camera,
          description:
              'First-line imaging for acute stroke. Rapid, widely available, '
              'and the gold standard for detecting acute hemorrhage.',
          keyPoints: [
            'Acute hemorrhage appears BRIGHT (hyperdense/white) on CT -- detectable immediately',
            'Acute ischemia appears DARK (hypodense) -- but may NOT be visible for 6-12 hours',
            'CT may be completely normal in the first 6 hours of ischemic stroke',
            'Early ischemic signs: loss of gray-white differentiation, sulcal effacement, hyperdense MCA sign (clot in MCA)',
            'Sensitivity for ischemic stroke in first 6 hours: only ~60%',
            'Sensitivity for acute hemorrhage: >95%',
            'Must be obtained before any thrombolytic therapy',
          ],
        ),
        PearlBlock(
          'Board Pearl: CT Density Rules',
          'On CT: DARK = ischemic (hypodense). BRIGHT = hemorrhagic '
          '(hyperdense). Mnemonic: "Blood is Bright." A normal CT does NOT '
          'rule out ischemic stroke in the acute setting. The hyperdense MCA '
          'sign (bright MCA on CT) indicates acute thrombus in the MCA and '
          'is an early sign of large vessel occlusion.',
        ),
        ComparisonCardBlock(
          title: 'MRI with Diffusion-Weighted Imaging (DWI)',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.camera,
          description:
              'The most sensitive imaging modality for detecting acute ischemic '
              'stroke. DWI shows restricted diffusion within minutes of onset.',
          keyPoints: [
            'DWI is the MOST SENSITIVE sequence for acute ischemic stroke -- detects infarct within minutes',
            'Restricted diffusion appears BRIGHT on DWI and DARK on ADC map (confirms true restriction)',
            'Sensitivity for acute ischemic stroke: >95% (vs ~60% for CT)',
            'Can differentiate acute from chronic infarcts using DWI/ADC correlation',
            'FLAIR sequence helps determine stroke timing (DWI+/FLAIR- suggests <4.5 hours -- "DWI-FLAIR mismatch")',
            'Gradient echo (GRE) or susceptibility-weighted imaging (SWI) can detect hemorrhage',
            'Limitations: longer acquisition time, less available, contraindicated with certain implants, motion artifact',
          ],
        ),
        TableBlock(
          title: 'CT vs MRI Comparison for Stroke',
          columns: ['Feature', 'CT', 'MRI'],
          rows: [
            ['Speed', 'Fast (5-10 minutes)', 'Slower (20-45 minutes)'],
            ['Availability', 'Widely available 24/7', 'Less available, especially overnight'],
            ['Acute hemorrhage detection', 'Excellent (>95%)', 'Good (GRE/SWI sequences)'],
            ['Acute ischemia detection', 'Poor in first 6 hours (~60%)', 'Excellent with DWI (>95%)'],
            ['Posterior fossa imaging', 'Limited (bone artifact)', 'Superior'],
            ['TIA evaluation', 'Often normal', 'DWI may show small infarcts (reclassifies TIA as stroke)'],
            ['Cost', 'Lower', 'Higher'],
            ['Contraindications', 'Minimal (contrast allergy, pregnancy)', 'Pacemakers, metallic implants, claustrophobia'],
          ],
        ),
        KnowledgeCheckBlock(
          question: 'A patient presents with acute stroke symptoms 3 hours ago. Non-contrast CT is normal. What is the most sensitive imaging modality to confirm acute ischemic infarction?',
          options: ['CT Angiography', 'FLAIR MRI', 'MRI Diffusion-Weighted Imaging (DWI)', 'CT Perfusion'],
          correctIndex: 2,
          explanation: 'MRI DWI is the most sensitive sequence for acute ischemic stroke, detecting restricted diffusion within minutes of onset with >95% sensitivity. Non-contrast CT is only about 60% sensitive in the first 6 hours.',
          boardRelevance: 'BOARD-CORE',
        ),
        BulletCardBlock(
          title: 'CT Perfusion (CTP)',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Maps cerebral blood flow (CBF), cerebral blood volume (CBV), mean transit time (MTT), and time to peak (TTP)',
            'Identifies the ischemic penumbra (salvageable tissue) vs infarct core',
            'Penumbra: decreased CBF but maintained CBV (autoregulatory vasodilation)',
            'Core: decreased CBF AND decreased CBV (irreversible)',
            'Used to select patients for reperfusion therapy beyond standard time windows (DAWN, DEFUSE-3 trials)',
            'Mismatch between core and penumbra supports treatment up to 24 hours in select patients',
          ],
        ),
        PearlBlock(
          'Board Pearl: Core vs Penumbra Mismatch',
          'The mismatch concept is the foundation of extended-window thrombectomy. '
          '"Core" is irreversibly infarcted tissue (low CBF + low CBV on CTP, or '
          'restricted diffusion on DWI). "Penumbra" is ischemic but salvageable '
          '(low CBF but maintained CBV). A large mismatch ratio (penumbra >> core) '
          'means there is significant brain tissue to rescue. DAWN trial required '
          'core <21 mL (NIHSS >= 10) or <31 mL (NIHSS >= 20) at 6-24 hours. '
          'DEFUSE-3 required mismatch ratio >= 1.8 with core <70 mL at 6-16 hours.',
        ),
        ScaleBlock(
          scaleName: 'ASPECTS Score (Alberta Stroke Program Early CT Score)',
          description:
              'A 10-point quantitative topographic CT score used to assess early '
              'ischemic changes in the MCA territory. Each region with early ischemic '
              'changes receives a deduction of 1 point from a total of 10.',
          columns: ['Score', 'Interpretation', 'Clinical Significance'],
          rows: [
            ['10', 'Normal CT, no early ischemic changes', 'Best candidate for reperfusion therapy'],
            ['7-9', 'Small area of early ischemic change', 'Good candidate for thrombectomy (>= 6 required)'],
            ['4-6', 'Moderate ischemic changes', 'ASPECTS <6 predicts poor outcome with reperfusion; higher hemorrhagic risk'],
            ['0-3', 'Extensive early ischemic changes', 'Large established infarct; thrombectomy generally NOT beneficial'],
          ],
          boardPearl:
              'ASPECTS >= 6 is the standard threshold for thrombectomy eligibility. '
              'The 10 regions scored are: caudate (C), lentiform nucleus (L), '
              'internal capsule (IC), insular cortex (I), and MCA cortical regions '
              'M1-M6. A score of 10 is normal. Subtract 1 point for each region '
              'with early ischemic change. ASPECTS <6 predicts >85% chance of poor '
              'functional outcome regardless of treatment.',
        ),
        ComparisonCardBlock(
          title: 'DWI-FLAIR Mismatch for Wake-Up Stroke',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.access_time,
          description:
              'When stroke onset time is unknown (e.g., "wake-up stroke"), '
              'DWI-FLAIR mismatch can help estimate whether the stroke is within '
              'the treatable window.',
          keyPoints: [
            'DWI positive + FLAIR negative (mismatch) suggests stroke onset <4.5 hours',
            'DWI positive + FLAIR positive suggests stroke onset >4.5 hours',
            'WAKE-UP trial: tPA guided by DWI-FLAIR mismatch improved outcomes in wake-up strokes',
            'Enables thrombolysis in patients who would otherwise be excluded due to unknown onset time',
            'Approximately 25% of ischemic strokes present as wake-up strokes',
            'FLAIR changes lag behind DWI by several hours -- this temporal gap creates the mismatch window',
          ],
        ),
        TableBlock(
          title: 'MRI Sequences in Stroke Evaluation',
          columns: ['Sequence', 'What It Shows', 'Stroke Application'],
          rows: [
            ['DWI (Diffusion-Weighted)', 'Restricted water diffusion (cytotoxic edema)', 'Acute ischemia -- BRIGHT within minutes; most sensitive sequence for acute infarct'],
            ['ADC Map', 'Apparent diffusion coefficient -- confirms DWI findings', 'TRUE restriction is DARK on ADC (vs T2 shine-through which is bright on ADC)'],
            ['FLAIR (Fluid-Attenuated Inversion Recovery)', 'T2-weighted with CSF signal suppressed', 'Subacute/chronic infarcts, periventricular white matter disease; used in DWI-FLAIR mismatch'],
            ['T1-Weighted', 'Anatomic detail, fat appears bright', 'Structural anatomy; fat-suppressed T1 for arterial dissection (intramural hematoma appears bright)'],
            ['T2-Weighted', 'Fluid appears bright; edema detection', 'Vasogenic edema, chronic infarcts, mass lesions'],
            ['GRE / SWI (Gradient Echo / Susceptibility-Weighted)', 'Blood products appear DARK (blooming artifact)', 'Hemorrhage detection (acute and chronic microbleeds); SWI is more sensitive than GRE'],
            ['MRA (MR Angiography)', 'Vascular anatomy without contrast (TOF) or with gadolinium', 'Large vessel occlusion, stenosis, aneurysm, dissection'],
          ],
        ),
      ],
    ),

    // ── Vascular Studies Tab ──
    TopicTab(
      title: 'Vascular Studies',
      blocks: [
        HeaderBlock('Vascular Imaging'),
        TextBlock(
          'Vascular imaging is essential to identify the site and cause of '
          'arterial occlusion, evaluate for stenosis, detect aneurysms and '
          'malformations, and guide intervention. Multiple modalities are '
          'available, each with specific advantages.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Vascular Imaging Modalities',
          columns: ['Modality', 'Advantages', 'Limitations', 'Primary Uses'],
          rows: [
            ['CT Angiography (CTA)', 'Fast, widely available, excellent for acute LVO detection', 'Radiation, iodinated contrast, may overestimate stenosis', 'Acute stroke (LVO detection), carotid stenosis, aneurysm detection'],
            ['MR Angiography (MRA)', 'No radiation, no iodinated contrast, can be done without contrast (TOF)', 'Slower, overestimates stenosis, flow artifacts', 'Carotid/intracranial stenosis, aneurysm screening, follow-up imaging'],
            ['Conventional (catheter) angiography', 'GOLD STANDARD for vascular imaging; allows intervention', 'Invasive, radiation, contrast, 1% stroke risk', 'Definitive aneurysm characterization, AVM evaluation, endovascular treatment'],
            ['Carotid Doppler ultrasound', 'Non-invasive, no radiation, portable, inexpensive', 'Operator-dependent, limited to extracranial carotid', 'Carotid stenosis screening, follow-up after endarterectomy'],
            ['Transcranial Doppler (TCD)', 'Non-invasive, bedside, real-time monitoring', 'Operator-dependent, limited acoustic window in 10-15%', 'Vasospasm monitoring in SAH, MCA stenosis, PFO detection with bubble study'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Carotid Stenosis Evaluation',
          'Carotid Doppler ultrasound uses peak systolic velocity (PSV) to '
          'estimate stenosis: PSV >125 cm/s suggests >50% stenosis; PSV >230 '
          'cm/s suggests >70% stenosis. Conventional angiography remains the '
          'gold standard but is invasive. CTA and MRA are used as '
          'confirmatory non-invasive tests. Carotid endarterectomy is '
          'indicated for symptomatic stenosis >70% (NASCET trial).',
        ),
        BulletCardBlock(
          title: 'Transcranial Doppler (TCD) Applications',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Vasospasm detection and monitoring after SAH -- most important clinical application',
            'MCA mean flow velocity >120 cm/s suggests mild vasospasm; >200 cm/s suggests severe vasospasm',
            'Lindegaard ratio (MCA velocity / extracranial ICA velocity) >3 confirms vasospasm vs hyperemia',
            'Detection of microembolic signals (MES) for embolic source monitoring',
            'PFO detection with agitated saline (bubble study) -- detects right-to-left shunt',
            'Sickle cell disease screening -- elevated velocities predict stroke risk (STOP trial)',
            'Assessment of cerebral autoregulation and intracranial stenosis',
          ],
        ),
        BulletCardBlock(
          title: 'Conventional Angiography (DSA)',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Digital subtraction angiography (DSA) is the gold standard for cerebral vascular imaging',
            'Catheter inserted via femoral or radial artery and advanced to cerebral vessels',
            'Provides real-time dynamic visualization of blood flow',
            'Best spatial resolution of any vascular imaging modality',
            'Essential for: aneurysm characterization before surgery/coiling, AVM nidus mapping, vasculitis diagnosis, moyamoya disease',
            'Risks: stroke (~1%), groin hematoma, contrast reaction, vessel dissection',
            'Allows simultaneous endovascular intervention (coiling, stenting, thrombectomy)',
          ],
        ),
        ComparisonCardBlock(
          title: 'CT Angiography (CTA) for Large Vessel Occlusion',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.visibility,
          description:
              'CTA is the primary imaging modality for rapid detection of large '
              'vessel occlusion (LVO) in acute stroke and is essential for '
              'thrombectomy decision-making.',
          keyPoints: [
            'Can be performed immediately after NCCT with same contrast bolus',
            'Detects ICA, MCA (M1/M2), basilar artery occlusions with >95% sensitivity',
            'Identifies tandem lesions (extracranial ICA + intracranial occlusion)',
            'CTA source images can estimate infarct core (poor contrast enhancement = core)',
            'CTA collateral grading helps predict treatment response -- good collaterals = better outcomes',
            'Required for thrombectomy triage in most stroke center protocols',
            'May overestimate stenosis compared to conventional angiography due to calcification artifact',
          ],
        ),
        PearlBlock(
          'Board Pearl: CTA Spot Sign',
          'The CTA "spot sign" refers to contrast extravasation within an '
          'intracerebral hemorrhage on CTA. It indicates active bleeding and '
          'predicts hematoma expansion. Presence of the spot sign is associated '
          'with higher mortality and worse outcomes. It may help identify ICH '
          'patients who need more aggressive blood pressure control or hemostatic '
          'therapy.',
        ),
        TimelineBlock(
          title: 'Stroke Imaging Timeline: When to Use What',
          milestones: [
            TimelineMilestone(
              label: '0-25 min',
              title: 'Non-Contrast CT (NCCT)',
              details: ['First-line: rule out hemorrhage', 'Must complete within 25 min of door arrival', 'Sensitivity for hemorrhage >95%; ischemia only ~60%'],
            ),
            TimelineMilestone(
              label: '25-45 min',
              title: 'CT Angiography (CTA)',
              details: ['Detect large vessel occlusion for thrombectomy triage', 'Can be done immediately after NCCT with same contrast bolus', 'Evaluate collateral status'],
            ),
            TimelineMilestone(
              label: '45 min-6 hr',
              title: 'CT Perfusion (CTP)',
              details: ['Map infarct core vs penumbra', 'Guide reperfusion decisions in borderline cases', 'ASPECTS score >= 6 supports thrombectomy'],
            ),
            TimelineMilestone(
              label: '6-24 hr',
              title: 'Advanced Perfusion Imaging',
              details: ['CTP or MRI DWI for extended-window thrombectomy', 'DAWN trial: clinical-core mismatch at 6-24 hours', 'DEFUSE-3: perfusion mismatch ratio >= 1.8 at 6-16 hours'],
            ),
            TimelineMilestone(
              label: '24+ hr',
              title: 'MRI for Characterization',
              details: ['DWI confirms infarct extent', 'DWI-FLAIR mismatch estimates stroke timing for wake-up strokes', 'GRE/SWI for microbleeds (CAA evaluation)', 'MRA for vascular anatomy and follow-up'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'What ASPECTS score threshold is generally required for thrombectomy eligibility?',
          options: ['>=3', '>=6', '>=8', '>=10'],
          correctIndex: 1,
          explanation: 'An ASPECTS score >= 6 is the standard threshold for thrombectomy eligibility. ASPECTS <6 predicts an >85% chance of poor functional outcome regardless of treatment and indicates a large established infarct.',
          boardRelevance: 'BOARD-CORE',
        ),
      ],
    ),

    // ── Cardiac Studies Tab ──
    TopicTab(
      title: 'Cardiac Studies',
      blocks: [
        HeaderBlock('Cardiac Evaluation in Stroke'),
        TextBlock(
          'Cardiac evaluation is a crucial part of the stroke workup because '
          'cardioembolism accounts for 20-30% of ischemic strokes. The '
          'cardiac workup aims to identify structural heart disease, '
          'arrhythmias, and intracardiac thrombi as potential embolic sources.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Echocardiography: TTE vs TEE',
          columns: ['Feature', 'Transthoracic Echo (TTE)', 'Transesophageal Echo (TEE)'],
          rows: [
            ['Approach', 'External chest wall probe', 'Probe inserted into esophagus'],
            ['Invasiveness', 'Non-invasive', 'Semi-invasive (requires sedation)'],
            ['Initial study', 'Yes -- first-line cardiac imaging', 'If TTE inconclusive or high suspicion for cardioembolic source'],
            ['LV thrombus', 'Good sensitivity', 'Good sensitivity'],
            ['Left atrial appendage thrombus', 'Poor -- cannot adequately visualize', 'Excellent -- gold standard for LAA thrombus detection'],
            ['PFO / ASD', 'Moderate with bubble study', 'Superior -- gold standard for PFO detection'],
            ['Valvular vegetations', 'Moderate', 'Superior -- much better for small vegetations (<5 mm)'],
            ['Aortic arch atheroma', 'Cannot visualize', 'Excellent visualization'],
          ],
        ),
        PearlBlock(
          'Board Pearl: TEE vs TTE',
          'TEE is SUPERIOR to TTE for detecting: left atrial appendage (LAA) '
          'thrombus, patent foramen ovale (PFO), small valvular vegetations, '
          'and aortic arch atheromas. TTE is the initial screening study, but '
          'TEE should be pursued when cardioembolism is strongly suspected '
          'and TTE is unrevealing -- especially in young patients with '
          'cryptogenic stroke.',
        ),
        BulletCardBlock(
          title: 'Electrocardiography & Rhythm Monitoring',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            '12-lead ECG -- obtained on ALL stroke patients; may show AFib, acute MI, LVH',
            'Continuous telemetry -- minimum 24 hours of cardiac monitoring during hospitalization',
            'Holter monitor (24-48 hours) -- for outpatient rhythm monitoring',
            'Extended cardiac monitoring (14-30 day event recorder) -- for cryptogenic stroke, detects paroxysmal AFib in up to 15% of cases',
            'Implantable loop recorder (ILR) -- continuous monitoring for up to 3 years; CRYSTAL-AF trial showed 30% AFib detection at 3 years in cryptogenic stroke',
            'Atrial fibrillation is the most commonly identified cardiac source and is found in up to 25% of all ischemic stroke patients',
          ],
        ),
        BulletCardBlock(
          title: 'Laboratory Studies in Stroke Workup',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Serum glucose -- hyperglycemia worsens stroke outcome; hypoglycemia can mimic stroke',
            'CBC -- thrombocytopenia or polycythemia',
            'INR/PT/PTT -- coagulopathy, baseline before anticoagulation',
            'Troponin -- cardiac injury; stroke-heart interaction',
            'Lipid panel and HbA1c -- risk factor assessment',
            'BMP -- electrolytes, renal function (for contrast studies)',
            'ESR/CRP -- vasculitis screening if young or unusual presentation',
            'Hypercoagulable workup in young patients: protein C, protein S, antithrombin III, factor V Leiden, antiphospholipid antibodies',
          ],
        ),
        PearlBlock(
          'Board Pearl: Cryptogenic Stroke Workup',
          'In patients with cryptogenic stroke (no identified cause after '
          'initial workup), extended cardiac monitoring with an implantable '
          'loop recorder can identify paroxysmal atrial fibrillation in up to '
          '30% of cases at 3 years (CRYSTAL-AF trial). This changes '
          'management from antiplatelet to anticoagulation therapy.',
        ),
        KnowledgeCheckBlock(
          question: 'Which echocardiographic modality is the gold standard for detecting a patent foramen ovale (PFO)?',
          options: ['Transthoracic echo (TTE)', 'Transesophageal echo (TEE)', 'Stress echocardiography', 'Intracardiac echocardiography'],
          correctIndex: 1,
          explanation: 'TEE is the gold standard for detecting PFO, left atrial appendage thrombus, small valvular vegetations, and aortic arch atheromas. TTE is the initial screening study, but TEE should be pursued when cardioembolism is suspected and TTE is unrevealing.',
          boardRelevance: 'BOARD-CORE',
        ),
        ComparisonCardBlock(
          title: 'Bubble Study (Agitated Saline Contrast Echocardiography)',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.bubble_chart,
          description:
              'Agitated saline is injected IV while performing echocardiography '
              'or TCD to detect right-to-left shunting through a PFO or ASD.',
          keyPoints: [
            'Microbubbles normally stay on the right side of the heart and are filtered by the lungs',
            'If bubbles appear in the left atrium within 3-5 cardiac cycles = intracardiac shunt (PFO/ASD)',
            'If bubbles appear after >5 cardiac cycles = pulmonary AV shunt',
            'Valsalva maneuver during injection increases sensitivity (transiently raises RA pressure)',
            'TTE with bubble study is initial screening; TEE with bubble is gold standard for PFO',
            'TCD bubble study detects right-to-left shunt regardless of location (cardiac or pulmonary)',
            'Positive bubble study in young cryptogenic stroke prompts evaluation for PFO closure',
          ],
        ),
        TableBlock(
          title: 'Holter Monitor vs Implantable Loop Recorder (ILR)',
          columns: ['Feature', 'Holter / Event Monitor', 'Implantable Loop Recorder (ILR)'],
          rows: [
            ['Duration', '24-48 hours (Holter); 14-30 days (event monitor)', 'Up to 3 years continuous monitoring'],
            ['Invasiveness', 'Non-invasive, external electrodes', 'Minor surgical implant (subcutaneous)'],
            ['AF detection yield', '~5% at 24 hours; ~15% at 30 days', '~12% at 12 months; ~30% at 36 months (CRYSTAL-AF)'],
            ['Best for', 'Initial outpatient rhythm monitoring', 'Cryptogenic stroke with negative initial monitoring'],
            ['Limitations', 'Short monitoring window, patient compliance', 'Cost, minor procedure, infection risk (<1%)'],
            ['Key trial', 'EMBRACE trial (30-day monitor: 16% AF detection)', 'CRYSTAL-AF trial (ILR: 30% AF at 3 years)'],
          ],
        ),
        BulletCardBlock(
          title: 'Hypercoagulable Workup',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Consider in: stroke at age <50, cryptogenic stroke, venous sinus thrombosis, recurrent events despite treatment, family history of thrombosis',
            'Factor V Leiden mutation -- most common inherited thrombophilia (5% of Caucasians)',
            'Prothrombin gene mutation (G20210A) -- second most common',
            'Antiphospholipid antibodies -- lupus anticoagulant, anticardiolipin, anti-beta2 glycoprotein I (must be positive on 2 occasions 12 weeks apart)',
            'Protein C deficiency -- risk of warfarin-induced skin necrosis',
            'Protein S deficiency -- decreased in acute illness, pregnancy, liver disease (test in stable state)',
            'Antithrombin III deficiency -- heparin resistance (heparin works through antithrombin)',
            'Homocysteine level -- elevated homocysteine is a stroke risk factor; treat with folate + B6 + B12',
            'Timing: test for protein C, S, and antithrombin when NOT on anticoagulation and NOT in acute phase (results unreliable acutely)',
          ],
        ),
      ],
    ),

    // ── Other Studies Tab ──
    TopicTab(
      title: 'Other',
      blocks: [
        HeaderBlock('Additional Diagnostic Studies'),
        TextBlock(
          'Beyond standard brain imaging and cardiac evaluation, several '
          'additional studies play important roles in specific clinical '
          'scenarios: lumbar puncture for SAH, EEG for seizures, and '
          'specialized blood tests for unusual stroke etiologies.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Lumbar Puncture for SAH',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.water_drop,
          description:
              'Lumbar puncture is indicated when SAH is clinically suspected '
              'but CT is negative. CT sensitivity for SAH decreases over time, '
              'making LP essential for delayed presentations.',
          keyPoints: [
            'Indicated when CT is negative but clinical suspicion for SAH remains high',
            'CT sensitivity for SAH: >95% at 6 hours, ~93% at 12 hours, ~80% at 24 hours, ~50% at 1 week',
            'Xanthochromia (yellow CSF supernatant) is the key finding -- caused by bilirubin from RBC breakdown',
            'Xanthochromia takes 6-12 hours to develop -- LP before 6 hours may not show xanthochromia',
            'Elevated opening pressure and elevated RBC count (does not clear with successive tubes = true SAH vs traumatic tap)',
            'Traumatic tap: RBC count decreases in successive tubes; SAH: RBC count remains constant',
          ],
        ),
        PearlBlock(
          'Board Pearl: Xanthochromia',
          'Xanthochromia (yellow discoloration of CSF supernatant) is the '
          'most reliable LP finding for SAH. It indicates prior bleeding and '
          'takes 6-12 hours to develop. If a patient presents >6 hours after '
          'headache onset with a negative CT, xanthochromia on LP confirms '
          'SAH. The classic way to distinguish SAH from a traumatic tap is '
          'that SAH shows consistent RBCs across all tubes and xanthochromia, '
          'while a traumatic tap shows decreasing RBCs and no xanthochromia.',
        ),
        BulletCardBlock(
          title: 'EEG in Stroke',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Indicated when seizures are suspected (post-stroke seizures occur in 5-10% of patients)',
            'Early seizures (<7 days) are more common with hemorrhagic stroke and cortical involvement',
            'Late seizures (>7 days) are considered post-stroke epilepsy',
            'Continuous EEG monitoring for unexplained altered consciousness after stroke (nonconvulsive status epilepticus)',
            'Focal slowing on EEG corresponds to the area of ischemia/infarction',
            'Locked-in syndrome: EEG shows normal waking alpha rhythm (distinguishes from coma)',
          ],
        ),
        TableBlock(
          title: 'Special Etiologic Workup',
          columns: ['Condition Suspected', 'Diagnostic Test', 'Key Findings'],
          rows: [
            ['Cerebral vasculitis', 'ESR, CRP, ANA, ANCA, cerebral angiography, brain/meningeal biopsy', 'Segmental narrowing on angiography ("string of beads"); elevated inflammatory markers'],
            ['Arterial dissection', 'MRI/MRA with fat-suppressed T1 (neck), CTA', 'Intramural hematoma (crescent sign on axial MRI), string sign or flame-shaped occlusion on angiography'],
            ['Moyamoya disease', 'MRA or conventional angiography', 'Bilateral ICA stenosis/occlusion with "puff of smoke" collateral vessels on angiography'],
            ['Hypercoagulable state', 'Protein C, S, antithrombin III, factor V Leiden, prothrombin gene mutation, antiphospholipid antibodies', 'Consider in young patients (<50) with cryptogenic stroke or venous sinus thrombosis'],
            ['Cerebral venous sinus thrombosis', 'CT venography (CTV) or MR venography (MRV)', 'Empty delta sign on contrast CT (absent flow in superior sagittal sinus); consider in young women on OCPs with headache + seizure'],
          ],
        ),
        BulletCardBlock(
          title: 'NIHSS -- Clinical Assessment',
          themeColor: Color(0xFF7C3AED),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'NIH Stroke Scale: standardized 11-item neurological examination scored 0-42',
            'Used to quantify stroke severity, guide treatment decisions (tPA eligibility), and track recovery',
            'Score 0 = no deficit; 1-4 = minor; 5-15 = moderate; 16-20 = moderate-severe; 21-42 = severe',
            'Higher NIHSS at presentation predicts worse outcome',
            'NIHSS >6 suggests large vessel occlusion; NIHSS >10 strongly suggests LVO',
            'The scale is weighted toward anterior circulation and left hemisphere deficits (aphasia scores more than neglect)',
            'Serial NIHSS assessments track improvement or deterioration',
          ],
        ),
        TableBlock(
          title: 'NIHSS Scoring Components',
          columns: ['Item', 'Domain Tested', 'Score Range'],
          rows: [
            ['1a', 'Level of consciousness', '0-3'],
            ['1b', 'LOC questions (month, age)', '0-2'],
            ['1c', 'LOC commands (open/close eyes, grip/release)', '0-2'],
            ['2', 'Best gaze (horizontal eye movements)', '0-2'],
            ['3', 'Visual fields', '0-3'],
            ['4', 'Facial palsy', '0-3'],
            ['5a/5b', 'Motor arm (L and R — drift test, 10 seconds)', '0-4 each'],
            ['6a/6b', 'Motor leg (L and R — drift test, 5 seconds)', '0-4 each'],
            ['7', 'Limb ataxia', '0-2'],
            ['8', 'Sensory', '0-2'],
            ['9', 'Best language (aphasia)', '0-3'],
            ['10', 'Dysarthria', '0-2'],
            ['11', 'Extinction and inattention (neglect)', '0-2'],
          ],
        ),
        PearlBlock(
          'Board Pearl: NIHSS Limitations',
          'The NIHSS is weighted toward anterior circulation and LEFT hemisphere '
          'deficits. Aphasia (item 9) can score up to 3 points, while neglect '
          '(item 11) scores a maximum of 2 points. This means left MCA strokes '
          '(dominant hemisphere, causing aphasia) often score higher than right '
          'MCA strokes (non-dominant, causing neglect) of similar size. Posterior '
          'circulation strokes (vertigo, diplopia, ataxia) are also under-'
          'represented and may have low NIHSS despite severe deficits.',
        ),
      ],
    ),
  ],
);
