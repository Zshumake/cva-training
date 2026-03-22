import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData strokeFundamentalsContent = TopicData(
  id: 'stroke_fundamentals',
  title: 'Stroke Fundamentals',
  tabs: [
    // ── Definition Tab ──
    TopicTab(
      title: 'Definition',
      blocks: [
        HeaderBlock('What Is a Stroke?'),
        TextBlock(
          'A stroke, or cerebrovascular accident (CVA), is a sudden interruption '
          'of blood flow to the brain resulting in neurological deficits that '
          'persist for more than 24 hours or result in death. The World Health '
          'Organization defines stroke as "rapidly developing clinical signs of '
          'focal (or global) disturbance of cerebral function, lasting more '
          'than 24 hours or leading to death, with no apparent cause other than '
          'vascular origin."',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Two Major Categories',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Ischemic stroke (87%) -- caused by arterial occlusion from thrombus or embolus',
            'Hemorrhagic stroke (13%) -- caused by rupture of a blood vessel (intracerebral or subarachnoid)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Stroke vs. TIA',
          'The critical distinction is duration: stroke produces deficits '
          'lasting >24 hours, while a TIA resolves within 24 hours (most '
          'within 1 hour). Modern definitions rely on tissue-based imaging -- '
          'a TIA shows no infarct on MRI DWI, whereas a stroke shows '
          'restricted diffusion regardless of symptom duration.',
        ),
        TableBlock(
          title: 'Stroke Classification Overview',
          columns: ['Type', 'Percentage', 'Mechanism'],
          rows: [
            ['Ischemic -- Thrombotic', '~48% of ischemic', 'In-situ clot on atherosclerotic plaque'],
            ['Ischemic -- Embolic', '~26% of ischemic', 'Clot travels from distant source (heart, large artery)'],
            ['Ischemic -- Lacunar', '~13% of ischemic', 'Small vessel lipohyalinosis, deep brain infarcts <15 mm'],
            ['Hemorrhagic -- ICH', '~10% of all strokes', 'Vessel rupture into brain parenchyma'],
            ['Hemorrhagic -- SAH', '~3% of all strokes', 'Bleeding into subarachnoid space'],
          ],
        ),
        BulletCardBlock(
          title: 'Key Terminology',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Penumbra -- ischemic tissue surrounding the infarct core that is electrically silent but structurally intact and potentially salvageable',
            'Infarct core -- irreversibly damaged tissue (CBF <10 mL/100g/min)',
            'Hemorrhagic transformation -- bleeding into an ischemic infarct, can occur spontaneously or after reperfusion therapy',
            'Cerebral autoregulation -- the brain\'s ability to maintain constant cerebral blood flow despite changes in systemic blood pressure (MAP 60-150 mmHg)',
          ],
        ),
        ScaleBlock(
          scaleName: 'NIH Stroke Scale (NIHSS)',
          description:
              'Standardized assessment of neurological deficit severity in acute stroke. '
              'Score ranges from 0 (no deficit) to 42 (maximum deficit). Used for tPA '
              'eligibility, prognosis, and serial monitoring.',
          columns: ['Domain', 'What Is Tested', 'Score Range'],
          rows: [
            ['1a. Level of consciousness (LOC)', 'Alert, drowsy, stupor, coma', '0-3'],
            ['1b. LOC questions', 'Age and current month', '0-2'],
            ['1c. LOC commands', 'Open/close eyes, grip/release', '0-2'],
            ['2. Best gaze', 'Horizontal eye movements', '0-2'],
            ['3. Visual fields', 'Confrontation visual fields', '0-3'],
            ['4. Facial palsy', 'Symmetry of facial movements', '0-3'],
            ['5a/5b. Motor arm (L/R)', 'Arm drift over 10 seconds', '0-4 each'],
            ['6a/6b. Motor leg (L/R)', 'Leg drift over 5 seconds', '0-4 each'],
            ['7. Limb ataxia', 'Finger-nose and heel-shin', '0-2'],
            ['8. Sensory', 'Pinprick in face, arm, leg', '0-2'],
            ['9. Best language', 'Naming, reading, describing', '0-3'],
            ['10. Dysarthria', 'Clarity of speech', '0-2'],
            ['11. Extinction/inattention', 'Double simultaneous stimulation', '0-2'],
          ],
          boardPearl:
              'NIHSS 1-4 = minor stroke. NIHSS 5-15 = moderate stroke. NIHSS 16-20 = '
              'moderate-severe. NIHSS 21-42 = severe stroke. An NIHSS >= 6 strongly '
              'supports consideration of IV tPA. NIHSS > 25 is associated with high '
              'risk of hemorrhagic transformation after thrombolysis.',
        ),
        ScaleBlock(
          scaleName: 'Modified Rankin Scale (mRS)',
          description:
              'Global disability/dependence scale used to measure functional outcome after '
              'stroke. It is the most widely used outcome measure in stroke clinical trials.',
          columns: ['Grade', 'Description', 'Functional Status'],
          rows: [
            ['0', 'No symptoms at all', 'Fully independent'],
            ['1', 'No significant disability despite symptoms', 'Able to carry out all usual duties'],
            ['2', 'Slight disability', 'Unable to carry out all previous activities but independent in ADLs'],
            ['3', 'Moderate disability', 'Requires some help but able to walk without assistance'],
            ['4', 'Moderately severe disability', 'Unable to walk unassisted, unable to attend to own bodily needs without assistance'],
            ['5', 'Severe disability', 'Bedridden, incontinent, requires constant nursing care'],
            ['6', 'Dead', 'N/A'],
          ],
          boardPearl:
              'mRS 0-2 is generally considered a "good outcome" in stroke trials. '
              'The primary endpoint in most major tPA and thrombectomy trials is mRS 0-2 '
              'at 90 days. mRS 0-1 is considered "excellent outcome."',
        ),
        PearlBlock(
          'Board Pearl: NIHSS Limitations',
          'The NIHSS is weighted toward anterior circulation and dominant hemisphere '
          'deficits. It underestimates posterior circulation strokes (may score low '
          'despite severe brainstem or cerebellar involvement) and non-dominant '
          'hemisphere strokes (neglect is scored but not heavily weighted). A patient '
          'with a devastating basilar occlusion may have a deceptively low NIHSS.',
        ),
      ],
    ),

    // ── Epidemiology Tab ──
    TopicTab(
      title: 'Epidemiology',
      blocks: [
        HeaderBlock('Stroke Epidemiology'),
        TextBlock(
          'Stroke is a leading cause of long-term disability and death in the '
          'United States. Understanding the epidemiological data is essential '
          'for rehabilitation professionals and is frequently tested on board '
          'examinations.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Statistics',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Approximately 795,000 people in the U.S. experience a stroke each year',
            '610,000 are first-time (new) strokes; 185,000 are recurrent strokes',
            'Stroke is the 5th leading cause of death in the U.S.',
            'Stroke is the #1 leading cause of long-term adult disability',
            'Someone in the U.S. has a stroke every 40 seconds',
            'Someone dies from a stroke every 3.5 minutes',
            'Approximately 7.2 million Americans over age 20 have had a stroke',
          ],
        ),
        PearlBlock(
          'Board Pearl: Mortality & Morbidity',
          '795,000 annual strokes, 5th leading cause of death, and #1 cause '
          'of adult disability are the most commonly tested epidemiological '
          'facts. Remember: approximately 1/4 of stroke patients die within '
          'the first year, and 15-30% are permanently disabled.',
        ),
        TableBlock(
          title: 'Risk by Demographics',
          columns: ['Demographic Factor', 'Key Data'],
          rows: [
            ['Age', 'Risk doubles each decade after age 55'],
            ['Sex', 'Higher incidence in men, but women have higher lifetime risk and higher mortality'],
            ['Race/Ethnicity', 'African Americans have nearly 2x the risk of first stroke compared to White Americans'],
            ['Geography', '"Stroke Belt" in southeastern U.S. has 30% higher stroke mortality'],
            ['Socioeconomic', 'Lower income and education levels associated with higher stroke incidence'],
          ],
        ),
        BulletCardBlock(
          title: 'Trends & Outcomes',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Stroke mortality has decreased significantly over the past 50 years due to improved acute management',
            'However, stroke incidence in younger adults (18-50) is increasing, likely related to rising rates of obesity, diabetes, and hypertension',
            'Approximately 50-70% of stroke survivors regain functional independence',
            'Only 10% achieve near-complete recovery',
            '25% recover with minor impairment',
            '40% experience moderate to severe disability',
          ],
        ),
        BulletCardBlock(
          title: 'Economic Burden of Stroke',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Estimated annual cost of stroke in the U.S.: \$34 billion (direct medical costs + lost productivity)',
            'Average lifetime cost per ischemic stroke patient: \$140,000-\$225,000',
            'Stroke accounts for the largest proportion of Medicare expenditures for neurological disease',
            'Indirect costs (lost wages, caregiver burden) often exceed direct medical costs',
            'Cost is projected to triple by 2030 as the population ages',
          ],
        ),
        BulletCardBlock(
          title: 'The Stroke Belt',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Southeastern U.S. region with 30% higher stroke mortality than the national average',
            'Includes: North Carolina, South Carolina, Georgia, Alabama, Mississippi, Tennessee, Arkansas, Louisiana',
            'The "Stroke Buckle" (coastal Carolinas and Georgia) has even higher rates -- up to 40% above national average',
            'Contributing factors: higher prevalence of hypertension, diabetes, obesity, smoking; dietary patterns; socioeconomic disparities; limited access to stroke centers',
            'African Americans in the Stroke Belt have the highest stroke mortality rates in the nation',
          ],
        ),
        BulletCardBlock(
          title: 'Race/Ethnicity Disparities',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'African Americans have approximately 2x the risk of first-ever stroke compared to White Americans',
            'African Americans have higher stroke mortality at every age and are more likely to be disabled after stroke',
            'Stroke incidence is increasing in the Hispanic population, driven by rising rates of diabetes and metabolic syndrome',
            'Asian Americans/Pacific Islanders have higher rates of hemorrhagic stroke relative to ischemic stroke compared to White Americans',
            'Disparities persist even after controlling for traditional risk factors, suggesting roles of systemic inequities in access to care, social determinants, and chronic stress',
          ],
        ),
        PearlBlock(
          'Board Pearl: Stroke Belt States',
          'The Stroke Belt encompasses 8 southeastern states with 30% higher stroke '
          'mortality. The "Stroke Buckle" (coastal NC, SC, and GA) has even higher '
          'rates. This geographic disparity persists even after controlling for '
          'known risk factors, suggesting environmental and systemic contributors.',
        ),
      ],
    ),

    // ── Risk Factors Tab ──
    TopicTab(
      title: 'Risk Factors',
      blocks: [
        HeaderBlock('Stroke Risk Factors'),
        TextBlock(
          'Risk factors for stroke are divided into modifiable and '
          'non-modifiable categories. Identifying and managing modifiable risk '
          'factors is the cornerstone of primary and secondary stroke '
          'prevention.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Non-Modifiable Risk Factors',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Age -- risk doubles every decade after 55',
            'Sex -- higher incidence in men; higher mortality in women',
            'Race -- African Americans have 2x risk of first stroke',
            'Family history / Genetics -- increased risk with first-degree relative history',
            'Prior stroke or TIA -- strongest predictor of future stroke',
          ],
        ),
        BulletCardBlock(
          title: 'Modifiable Risk Factors',
          themeColor: Color(0xFF16A34A),
          backgroundColor: Color(0xFFF0FDF4),
          points: [
            'Hypertension -- #1 modifiable risk factor for both ischemic and hemorrhagic stroke',
            'Atrial fibrillation -- #1 cardiac cause of embolic stroke; 5x increased risk',
            'Diabetes mellitus -- 2-4x increased risk; accelerates atherosclerosis',
            'Hyperlipidemia -- elevated LDL promotes atherosclerotic plaque formation',
            'Smoking -- 2x increased risk; promotes endothelial damage and hypercoagulability',
            'Obesity and physical inactivity',
            'Excessive alcohol use -- heavy drinking increases risk; moderate may be protective',
            'Carotid artery stenosis -- >70% stenosis significantly increases stroke risk',
            'Sickle cell disease -- especially in children',
            'Oral contraceptive use -- especially when combined with smoking or migraine with aura',
          ],
        ),
        PearlBlock(
          'Board Pearl: #1 Risk Factor',
          'Hypertension is the single most important modifiable risk factor for '
          'stroke. It is present in approximately 70% of stroke patients. For '
          'every 10 mmHg reduction in systolic BP, stroke risk decreases by '
          'approximately 33%. This is the most commonly tested risk factor fact '
          'on PM&R boards.',
        ),
        TableBlock(
          title: 'Risk Factor Impact Comparison',
          columns: ['Risk Factor', 'Relative Risk Increase', 'Population Attributable Risk'],
          rows: [
            ['Hypertension', '3-5x', '~35-50%'],
            ['Atrial fibrillation', '5x', '~15-20%'],
            ['Diabetes', '2-4x', '~5-10%'],
            ['Current smoking', '2x', '~12-15%'],
            ['Hyperlipidemia', '1.5-2x', '~25-30%'],
            ['Physical inactivity', '2.7x', '~30%'],
          ],
        ),
        MnemonicBlock(
          'ABCDD -- Secondary Prevention Mnemonic',
          'A = Antiplatelet/Anticoagulation therapy\n'
          'B = Blood pressure control\n'
          'C = Cholesterol management (statins)\n'
          'D = Diabetes management\n'
          'D = Diet and lifestyle modification',
        ),
        BulletCardBlock(
          title: 'Risk Factor Details -- High Yield',
          themeColor: Color(0xFF16A34A),
          backgroundColor: Color(0xFFF0FDF4),
          points: [
            'Atrial fibrillation increases stroke risk 5-fold; risk further stratified by CHA2DS2-VASc score',
            'Hypertension is #1 modifiable risk factor; present in ~70% of stroke patients; every 10 mmHg SBP reduction = 33% risk reduction',
            'Diabetes doubles stroke risk; risk increases further after 3+ years of disease duration due to progressive microvascular and macrovascular damage',
            'Smoking cessation reduces stroke risk to near-baseline within 5 years of quitting',
            'Carotid stenosis >70% (symptomatic) confers ~13% annual stroke risk without intervention; endarterectomy reduces this to ~2%',
            'Obstructive sleep apnea is an independent risk factor -- intermittent hypoxia promotes atherosclerosis and AF',
            'Migraine with aura doubles stroke risk in young women, especially when combined with OCPs and smoking',
          ],
        ),
        PearlBlock(
          'Board Pearl: CHA2DS2-VASc Score',
          'This score stratifies stroke risk in atrial fibrillation: C=CHF (1), '
          'H=Hypertension (1), A2=Age>=75 (2), D=Diabetes (1), S2=Prior '
          'Stroke/TIA (2), V=Vascular disease (1), A=Age 65-74 (1), Sc=Sex '
          'category female (1). Score >=2 in men or >=3 in women: anticoagulate. '
          'Score 0: no therapy needed. Score 1: consider anticoagulation.',
        ),
      ],
    ),

    // ── TIA Tab ──
    TopicTab(
      title: 'TIA',
      blocks: [
        HeaderBlock('Transient Ischemic Attack'),
        TextBlock(
          'A transient ischemic attack (TIA) is a brief episode of '
          'neurological dysfunction caused by focal brain, spinal cord, or '
          'retinal ischemia without acute infarction. TIA is a medical '
          'emergency and a critical warning sign of impending stroke.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'TIA Key Facts',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Classic definition: focal neurological deficits lasting <24 hours (most resolve within 1 hour)',
            'Modern tissue-based definition: transient symptoms WITHOUT evidence of infarction on MRI DWI',
            'TIA is a medical emergency -- 10-15% of TIA patients will have a stroke within 90 days',
            'Greatest risk of stroke is within the first 48 hours after TIA',
            'Up to 1/3 of untreated TIA patients will eventually have a stroke',
            'Amaurosis fugax (transient monocular blindness) is a type of TIA involving the ophthalmic artery',
          ],
        ),
        PearlBlock(
          'Board Pearl: TIA and Stroke Risk',
          '10-15% of TIA patients will have a completed stroke within 90 days, '
          'with the highest risk in the first 48 hours. This makes TIA the '
          'single strongest predictor of subsequent stroke. Every TIA should be '
          'evaluated emergently.',
        ),
        ScaleBlock(
          scaleName: 'ABCD2 Score -- TIA Risk Stratification',
          description: 'Predicts short-term risk of stroke after TIA. Score 0-7.',
          columns: ['Criteria', 'Points'],
          rows: [
            ['A -- Age >= 60 years', '1 point'],
            ['B -- Blood pressure >= 140/90 at presentation', '1 point'],
            ['C -- Clinical features: unilateral weakness', '2 points'],
            ['C -- Clinical features: speech impairment without weakness', '1 point'],
            ['D -- Duration >= 60 minutes', '2 points'],
            ['D -- Duration 10-59 minutes', '1 point'],
            ['D2 -- Diabetes present', '1 point'],
          ],
          boardPearl:
              'ABCD2 score >= 4 indicates high risk (>4% 2-day stroke risk). '
              'Score 0-3 is low risk (<1% 2-day risk). High-risk patients '
              'should be admitted for observation and urgent workup.',
        ),
        BulletCardBlock(
          title: 'TIA Workup',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Emergent non-contrast CT to rule out hemorrhage',
            'MRI with DWI to confirm absence of infarct (defines TIA vs stroke)',
            'Vascular imaging: CTA, MRA, or carotid ultrasound',
            'Cardiac evaluation: ECG, telemetry, echocardiography',
            'Labs: CBC, BMP, coagulation studies, lipid panel, HbA1c',
          ],
        ),
        BulletCardBlock(
          title: 'TIA Management',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Antiplatelet therapy: aspirin 325 mg acutely, then 81 mg daily',
            'Dual antiplatelet therapy (aspirin + clopidogrel) for 21 days may reduce early stroke risk in high-risk TIA',
            'Statin therapy for all patients with atherosclerotic disease',
            'Blood pressure management to target <130/80 mmHg',
            'Carotid endarterectomy if ipsilateral carotid stenosis >70%',
            'Anticoagulation if atrial fibrillation is identified',
          ],
        ),
        PearlBlock(
          'Board Pearl: ABCD2 Score Interpretation',
          'ABCD2 score of 0-3 = low risk (<1% 2-day stroke risk). Score 4-5 = '
          'moderate risk (~4% 2-day risk). Score 6-7 = high risk (~8% 2-day risk). '
          'All patients with ABCD2 >= 4 should be hospitalized for urgent workup. '
          'Even low-risk patients warrant evaluation within 24-48 hours. The score '
          'does not replace clinical judgment.',
        ),
        TableBlock(
          title: 'TIA Mimics vs True TIA',
          columns: ['Feature', 'True TIA', 'TIA Mimic'],
          rows: [
            ['Onset', 'Sudden, maximal at onset', 'Gradual, migratory, or fluctuating'],
            ['Symptoms', 'Negative (loss of function)', 'Positive (tingling, flashing lights)'],
            ['Duration', 'Usually <1 hour', 'Variable, may last hours'],
            ['Risk factors', 'Vascular risk factors present', 'Younger, history of migraine or seizure'],
            ['Common mimics', 'N/A', 'Migraine aura, focal seizure, hypoglycemia, peripheral vertigo, anxiety'],
          ],
        ),
        MnemonicBlock(
          'ABCD2 -- TIA Risk Score Memory Aid',
          'A = Age (>= 60 gets a point)\n'
          'B = Blood pressure (>= 140/90 at presentation)\n'
          'C = Clinical features (weakness = 2, speech only = 1)\n'
          'D = Duration (>= 60 min = 2, 10-59 min = 1)\n'
          'D2 = Diabetes (present = 1)\n\n'
          'Total possible: 7 points. Score >= 4 = admit for observation.',
        ),
      ],
    ),
  ],
);
