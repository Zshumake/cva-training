import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData ischemicStrokeContent = TopicData(
  id: 'ischemic_stroke',
  title: 'Ischemic Stroke',
  tabs: [
    // ── Overview Tab ──
    TopicTab(
      title: 'Overview',
      blocks: [
        HeaderBlock('Ischemic Stroke Overview'),
        TextBlock(
          'Ischemic stroke accounts for approximately 87% of all strokes and '
          'is caused by occlusion of a cerebral artery, resulting in '
          'insufficient blood flow to the brain tissue it supplies. The '
          'resulting ischemia leads to a central core of irreversible injury '
          'surrounded by a potentially salvageable penumbra.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Pathophysiology of Ischemia',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Normal cerebral blood flow (CBF): 50-60 mL/100g/min',
            'Ischemic penumbra: CBF 10-20 mL/100g/min -- electrically silent but viable',
            'Infarct core: CBF <10 mL/100g/min -- irreversible injury within minutes',
            'Ischemic cascade: energy failure, glutamate excitotoxicity, calcium influx, free radical damage, apoptosis',
            'Penumbra can survive for hours depending on collateral flow -- this is the basis for the "time is brain" concept',
            'An estimated 1.9 million neurons die every minute during an untreated large vessel occlusion',
          ],
        ),
        PearlBlock(
          'Board Pearl: "Time Is Brain"',
          'Every minute of untreated large vessel occlusion results in the '
          'loss of approximately 1.9 million neurons. The penumbra (ischemic '
          'but viable tissue) is the target of reperfusion therapy. The '
          'concept of "mismatch" between the infarct core and penumbra guides '
          'treatment decisions beyond standard time windows.',
        ),
        TableBlock(
          title: 'TOAST Classification of Ischemic Stroke',
          columns: ['Subtype', 'Percentage', 'Description'],
          rows: [
            ['Large artery atherosclerosis', '~20-25%', 'Stenosis >50% of major cerebral artery or branch'],
            ['Cardioembolism', '~20-25%', 'Cardiac source identified (AFib, valvular disease, etc.)'],
            ['Small vessel occlusion (lacunar)', '~20-25%', 'Small deep infarct <15 mm with compatible syndrome'],
            ['Stroke of other determined etiology', '~5%', 'Dissection, vasculitis, hypercoagulable state, etc.'],
            ['Stroke of undetermined etiology (cryptogenic)', '~25-30%', 'No cause identified despite complete workup, or multiple causes'],
          ],
        ),
        BulletCardBlock(
          title: 'General Ischemic Stroke Features',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Onset can be sudden (embolic) or stuttering/progressive (thrombotic)',
            'Deficits correspond to the vascular territory involved',
            'May be preceded by TIA (especially thrombotic type)',
            'CT scan may be normal in the first 6-12 hours (MRI DWI is more sensitive)',
            'All ischemic strokes carry a risk of hemorrhagic transformation, especially with reperfusion',
          ],
        ),
        PearlBlock(
          'Board Pearl: TOAST Classification',
          'The TOAST classification is the standard system for categorizing ischemic '
          'stroke subtypes. It guides treatment: large artery disease gets '
          'antiplatelet + statin + possible CEA/stenting; cardioembolism gets '
          'anticoagulation; small vessel disease gets antiplatelet + aggressive BP '
          'control; cryptogenic stroke requires extended cardiac monitoring (often '
          'reveals occult AF).',
        ),
        KnowledgeCheckBlock(
          question: 'Approximately how many neurons die per minute during an untreated large vessel occlusion?',
          options: ['100,000', '500,000', '1.9 million', '10 million'],
          correctIndex: 2,
          explanation: 'An estimated 1.9 million neurons die every minute during an untreated large vessel occlusion, forming the basis for the "time is brain" concept and the urgency of reperfusion therapy.',
          boardRelevance: 'BOARD-CORE',
        ),
        TimelineBlock(
          title: 'Ischemic Stroke Evolution Timeline',
          milestones: [
            TimelineMilestone(
              label: '0-6 hours',
              title: 'Hyperacute Phase',
              details: ['Cytotoxic edema begins (DWI+, CT often normal)', 'Penumbra is maximal and salvageable', 'Window for IV tPA (0-4.5h) and thrombectomy (0-6h standard)'],
            ),
            TimelineMilestone(
              label: '6-24 hours',
              title: 'Acute Phase',
              details: ['CT begins showing hypodensity', 'Extended thrombectomy window with perfusion imaging (DAWN/DEFUSE-3)', 'Infarct core expanding into penumbra'],
            ),
            TimelineMilestone(
              label: '1-5 days',
              title: 'Early Subacute Phase',
              details: ['Vasogenic edema peaks at days 3-5', 'Risk of herniation in large MCA infarcts', 'Hemorrhagic transformation risk peaks', 'CT shows clear hypodensity with mass effect'],
            ),
            TimelineMilestone(
              label: '5-30 days',
              title: 'Late Subacute Phase',
              details: ['Edema resolving, mass effect decreasing', 'MRI FLAIR becomes hyperintense', '"Fogging effect" on CT (transient normalization around day 14)'],
            ),
            TimelineMilestone(
              label: '>30 days',
              title: 'Chronic Phase',
              details: ['Encephalomalacia and gliosis replace infarcted tissue', 'CSF-filled cavity (porencephaly) may form', 'Ex-vacuo dilation of adjacent ventricle', 'Wallerian degeneration of descending tracts'],
            ),
          ],
        ),
        BulletCardBlock(
          title: 'Cryptogenic Stroke Workup',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Cryptogenic stroke accounts for 25-30% of ischemic strokes -- no clear etiology identified',
            'Embolic stroke of undetermined source (ESUS) is a newer subcategory -- non-lacunar infarct with no identifiable source after standard workup',
            'Extended cardiac monitoring (30-day event monitor or implantable loop recorder) detects occult AF in ~10-25% of cryptogenic strokes',
            'Transesophageal echocardiography (TEE) to evaluate PFO, atrial septal aneurysm, aortic arch atheroma',
            'Hypercoagulable workup in younger patients: antiphospholipid syndrome, Factor V Leiden, protein C/S deficiency, prothrombin gene mutation',
            'Consider arterial dissection workup (MRI with fat-suppressed T1) in young patients',
            'Bubble study echocardiography to evaluate for right-to-left shunt (PFO)',
          ],
        ),
        BulletCardBlock(
          title: 'Carotid Artery Dissection',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Important cause of ischemic stroke in young and middle-aged adults (accounts for ~20% of strokes in patients <45)',
            'Caused by: trauma (even minor -- chiropractic manipulation, sports), connective tissue disorders (Ehlers-Danlos, Marfan, fibromuscular dysplasia), or spontaneous',
            'Pathophysiology: intimal tear allows blood to enter the vessel wall, creating an intramural hematoma that narrows the lumen or serves as a source of embolism',
            'Classic presentation: ipsilateral head/neck/face pain + ipsilateral partial Horner syndrome (miosis, ptosis WITHOUT anhidrosis) + contralateral hemiparesis from embolic stroke',
            'Diagnosis: CTA, MRA, or MRI with fat-saturated T1 (shows intramural hematoma as bright crescent)',
            'Treatment: anticoagulation (heparin then warfarin) or antiplatelet therapy for 3-6 months; most dissections heal spontaneously',
          ],
        ),
        PearlBlock(
          'Board Pearl: Carotid Dissection Triad',
          'The classic triad for carotid dissection is: (1) ipsilateral neck/head '
          'pain, (2) ipsilateral partial Horner syndrome (sympathetic fibers run '
          'along the ICA), and (3) contralateral cerebral ischemic symptoms. Think '
          'of dissection in any young patient with stroke preceded by neck pain or '
          'recent trauma/manipulation.',
        ),
        TableBlock(
          title: 'Embolic Shower -- Multiple Territory Infarcts',
          columns: ['Feature', 'Details'],
          rows: [
            ['Definition', 'Simultaneous or near-simultaneous infarcts in multiple vascular territories'],
            ['Most common cause', 'Cardiac embolism (AF, endocarditis, mural thrombus) -- a single cardiac source showers multiple emboli'],
            ['Key imaging finding', 'Acute infarcts in both anterior and posterior circulations, or bilateral hemispheres'],
            ['Diagnostic significance', 'Multiple territory involvement essentially rules out a single-vessel thrombotic etiology'],
            ['Endocarditis clue', 'Multiple small infarcts + fever + new murmur = septic emboli from endocarditis until proven otherwise'],
            ['Workup', 'TEE, blood cultures, extended cardiac monitoring; consider aortic arch atheroma'],
          ],
        ),
      ],
    ),

    // ── Thrombotic Tab ──
    TopicTab(
      title: 'Thrombotic',
      blocks: [
        HeaderBlock('Thrombotic Stroke'),
        TextBlock(
          'Thrombotic stroke results from in-situ thrombus formation on a '
          'pre-existing atherosclerotic plaque within a cerebral artery. It is '
          'the most common subtype of ischemic stroke and typically affects '
          'large and medium-sized arteries.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Characteristics',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Accounts for approximately 48% of ischemic strokes',
            'Classically occurs during sleep or periods of inactivity (low-flow state)',
            'Approximately 48% of thrombotic strokes have onset during sleep -- patient wakes with deficit',
            'Stuttering or stepwise progression of deficits over hours to days ("stroke-in-evolution")',
            'Often preceded by TIA(s) in the same vascular territory',
            'Most commonly involves the MCA, ICA bifurcation, or vertebrobasilar system',
          ],
        ),
        PearlBlock(
          'Board Pearl: Thrombotic Stroke Onset During Sleep',
          'Thrombotic strokes characteristically occur during sleep (~48%) due '
          'to decreased blood pressure and flow during nocturnal hours. The '
          'patient typically "wakes up with a deficit." This is in contrast to '
          'embolic strokes, which occur during activity and have maximal '
          'deficit at onset. This distinction is frequently tested.',
        ),
        BulletCardBlock(
          title: 'Pathophysiology',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Atherosclerotic plaque develops over years at arterial bifurcations and curves',
            'Plaque rupture or erosion exposes subendothelial collagen',
            'Platelet adhesion, activation, and aggregation form a white thrombus',
            'Activation of the coagulation cascade adds fibrin, forming a red thrombus',
            'Progressive luminal narrowing and eventual complete occlusion',
            'Collateral circulation may partially compensate, resulting in gradual onset',
          ],
        ),
        TableBlock(
          title: 'Thrombotic vs Embolic Stroke',
          columns: ['Feature', 'Thrombotic', 'Embolic'],
          rows: [
            ['Onset', 'Gradual, stuttering, during sleep', 'Sudden, maximal deficit at onset, during activity'],
            ['Preceding TIAs', 'Common, same territory', 'Less common'],
            ['Deficit progression', 'Stepwise worsening over hours-days', 'Maximal at onset, may improve'],
            ['Hemorrhagic transformation', 'Less common', 'More common (reperfusion of damaged tissue)'],
            ['Multiple territories', 'Usually single territory', 'May affect multiple territories'],
            ['Underlying cause', 'Local atherosclerosis', 'Distant source (cardiac, aortic, arterial)'],
          ],
        ),
        BulletCardBlock(
          title: 'Common Sites of Thrombosis',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Internal carotid artery bifurcation -- most common extracranial site',
            'MCA mainstem or branches',
            'Vertebrobasilar junction',
            'Common carotid bifurcation',
            'Origin of the vertebral arteries from the subclavian',
          ],
        ),
      ],
    ),

    // ── Embolic Tab ──
    TopicTab(
      title: 'Embolic',
      blocks: [
        HeaderBlock('Embolic Stroke'),
        TextBlock(
          'Embolic stroke occurs when a thrombus, vegetation, or other '
          'material forms at a distant site and travels through the '
          'bloodstream to occlude a cerebral artery. The embolus typically '
          'lodges at arterial branch points.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Characteristics',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Accounts for approximately 26% of ischemic strokes',
            'Sudden onset with maximal deficit at presentation -- no stuttering',
            'Occurs during activity (unlike thrombotic strokes)',
            'Higher risk of hemorrhagic transformation (when embolus lyses, reperfusion into damaged tissue)',
            'May affect multiple vascular territories simultaneously',
            'Cerebral circulation receives ~15-20% of cardiac output, making it a frequent destination for cardiac emboli',
            'MCA is the most commonly affected cerebral vessel (direct continuation of ICA, favored by streamline flow from the aortic arch)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Cardiac Sources of Embolic Stroke',
          'Atrial fibrillation is the #1 cardiac source of embolic stroke, '
          'followed by recent MI with LV thrombus, mechanical valves, and '
          'dilated cardiomyopathy. The left MCA is the most commonly affected '
          'cerebral vessel because it is a near-direct continuation of the '
          'left ICA, favored by streamline flow from the aortic arch.',
        ),
        BulletCardBlock(
          title: 'Sources of Emboli',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Cardiac sources (~20-30% of all ischemic strokes):',
            '  - Atrial fibrillation (most common cardiac source)',
            '  - Left ventricular thrombus (post-MI, especially anterior wall)',
            '  - Valvular disease (mitral stenosis, prosthetic valves, endocarditis)',
            '  - Patent foramen ovale (PFO) -- paradoxical embolism from venous system',
            '  - Atrial myxoma (most common primary cardiac tumor)',
            'Arterial sources (artery-to-artery embolism):',
            '  - Carotid atherosclerotic plaque',
            '  - Aortic arch atheromas',
            '  - Arterial dissection',
            'Other sources: fat embolism, air embolism, septic emboli',
          ],
        ),
        TableBlock(
          title: 'Cardiac Conditions and Stroke Risk',
          columns: ['Cardiac Source', 'Mechanism', 'Prevention'],
          rows: [
            ['Atrial fibrillation', 'Stasis in left atrial appendage forms thrombus', 'Anticoagulation (DOACs preferred over warfarin)'],
            ['Acute MI (anterior wall)', 'LV akinesis/dyskinesis leads to mural thrombus', 'Anticoagulation for 3-6 months if LV thrombus'],
            ['Mitral stenosis', 'Left atrial dilation and stasis', 'Anticoagulation (warfarin)'],
            ['Prosthetic valves', 'Mechanical valves are thrombogenic', 'Lifelong anticoagulation (warfarin for mechanical)'],
            ['PFO', 'Paradoxical embolism (venous to arterial via right-to-left shunt)', 'PFO closure or anticoagulation depending on anatomy'],
            ['Endocarditis', 'Septic vegetations embolize', 'Antibiotics; anticoagulation is controversial (may worsen hemorrhagic stroke)'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Embolic vs Thrombotic -- Key Distinction',
          'Embolic stroke: sudden onset during activity, maximal deficit at '
          'onset, higher hemorrhagic transformation risk. Thrombotic stroke: '
          'gradual onset during sleep, stepwise progression, preceded by '
          'TIA. This pattern recognition is one of the most frequently tested '
          'concepts.',
        ),
        KnowledgeCheckBlock(
          question: 'A 68-year-old patient with atrial fibrillation presents with sudden-onset maximal deficit during activity. Which type of ischemic stroke is most likely?',
          options: ['Thrombotic', 'Embolic', 'Lacunar', 'Watershed'],
          correctIndex: 1,
          explanation: 'Embolic stroke is characterized by sudden onset with maximal deficit at presentation, occurring during activity, often from a cardiac source such as atrial fibrillation. Thrombotic strokes typically have a stuttering onset during sleep.',
          boardRelevance: 'BOARD-CORE',
        ),
        BulletCardBlock(
          title: 'Paradoxical Embolism via PFO',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Patent foramen ovale (PFO) is present in ~25% of the general population',
            'Allows venous thrombus to cross from right to left atrium (paradoxical embolism), bypassing pulmonary filtration',
            'Suspect in young patients with stroke + DVT or Valsalva-provoking activity at onset',
            'Risk factors for paradoxical embolism: PFO + atrial septal aneurysm, large PFO, prominent Eustachian valve',
            'Diagnosed by bubble study (agitated saline contrast echocardiography) or TEE with Valsalva',
            'PFO closure (device closure) is recommended for age 18-60 with cryptogenic stroke and high-risk PFO anatomy (CLOSE, RESPECT, DEFENSE-PFO trials)',
          ],
        ),
        TableBlock(
          title: 'Sources of Cardiac Embolism -- Detailed',
          columns: ['Source', 'Mechanism', 'Risk Level', 'Key Facts'],
          rows: [
            ['Atrial fibrillation', 'Left atrial appendage thrombus due to stasis', 'High', '#1 cardiac source; risk stratified by CHA2DS2-VASc; DOACs preferred'],
            ['Left ventricular thrombus', 'Akinetic wall segment post-MI creates stasis', 'High', 'Especially anterior/apical MI; risk highest in first 3 months'],
            ['Rheumatic mitral stenosis', 'Left atrial dilation and stasis', 'High', 'Most common valvular cause; warfarin required (DOACs not validated)'],
            ['Prosthetic mechanical valve', 'Foreign surface activates coagulation', 'High', 'Lifelong warfarin required; DOACs contraindicated'],
            ['Infective endocarditis', 'Septic vegetations embolize', 'High', 'Anticoagulation may worsen mycotic aneurysm bleeding'],
            ['PFO with atrial septal aneurysm', 'Paradoxical venous-to-arterial embolism', 'Moderate', 'Consider device closure in cryptogenic stroke age <60'],
            ['Atrial myxoma', 'Tumor fragments or surface thrombi embolize', 'Moderate', 'Most common primary cardiac tumor; "ball-valve" obstruction'],
            ['Dilated cardiomyopathy', 'Low EF creates stasis', 'Moderate', 'Anticoagulation if EF <20% or documented thrombus'],
          ],
        ),
      ],
    ),

    // ── Lacunar Tab ──
    TopicTab(
      title: 'Lacunar',
      blocks: [
        HeaderBlock('Lacunar Stroke'),
        TextBlock(
          'Lacunar strokes are small, deep brain infarcts (typically <15 mm) '
          'resulting from occlusion of a single penetrating arteriole. They '
          'account for approximately 13-20% of all ischemic strokes and are '
          'strongly associated with hypertension and diabetes.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Characteristics',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Small infarcts <15 mm in diameter (the term "lacune" means "little lake")',
            'Caused by lipohyalinosis or microatheroma of small penetrating arteries (40-500 microns)',
            'Account for approximately 13% of ischemic strokes',
            'Strong association with chronic hypertension and diabetes mellitus',
            'Located in deep brain structures: basal ganglia, thalamus, internal capsule, pons, corona radiata',
            'No cortical signs (no aphasia, neglect, or visual field deficits)',
            'Produce characteristic "pure" syndromes',
            'Generally have a better prognosis than large territory strokes',
          ],
        ),
        PearlBlock(
          'Board Pearl: Lacunar Stroke = No Cortical Signs',
          'The hallmark of lacunar stroke is the ABSENCE of cortical signs. '
          'There is no aphasia, no neglect, no visual field cuts, and no '
          'seizures. If any cortical sign is present, it is NOT a lacunar '
          'stroke. This is a critical distinction tested on boards.',
        ),
        TableBlock(
          title: 'Classic Lacunar Syndromes',
          columns: ['Syndrome', 'Location', 'Presentation'],
          rows: [
            ['Pure motor hemiparesis', 'Posterior limb of internal capsule (most common) or basis pontis', 'Contralateral face, arm, and leg weakness equally; no sensory loss'],
            ['Pure sensory stroke', 'Ventral posterolateral (VPL) thalamus', 'Contralateral numbness/paresthesias of face, arm, and leg; no motor deficit'],
            ['Ataxic hemiparesis', 'Posterior limb of internal capsule or pons', 'Ipsilateral cerebellar ataxia with contralateral hemiparesis (weakness + incoordination same side)'],
            ['Dysarthria-clumsy hand syndrome', 'Basis pontis or genu of internal capsule', 'Dysarthria, dysphagia, ipsilateral hand weakness and clumsiness'],
            ['Sensorimotor stroke', 'Thalamocapsular region (thalamus + posterior limb IC)', 'Combined pure motor and pure sensory findings; largest lacunar infarct'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Pure Motor Hemiparesis',
          'Pure motor hemiparesis is the MOST COMMON lacunar syndrome and '
          'most commonly localizes to the posterior limb of the internal '
          'capsule. It affects face, arm, and leg EQUALLY (unlike MCA stroke '
          'where face/arm > leg). There is NO sensory loss. This is the #1 '
          'tested lacunar syndrome.',
        ),
        BulletCardBlock(
          title: 'Lacunar Stroke Locations',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Putamen/basal ganglia -- most common overall location for lacunar infarcts',
            'Internal capsule (posterior limb) -- most common location for pure motor hemiparesis',
            'Thalamus -- pure sensory stroke location',
            'Pons -- ataxic hemiparesis, dysarthria-clumsy hand, and pure motor',
            'Caudate nucleus',
            'Corona radiata',
          ],
        ),
        BulletCardBlock(
          title: 'Prognosis & Management',
          themeColor: Color(0xFF0EA5E9),
          backgroundColor: Color(0xFFF0F9FF),
          points: [
            'Generally better prognosis than large territory infarcts',
            'Lower mortality rate (~2% at 30 days vs 10-20% for large infarcts)',
            'Higher rate of good functional recovery',
            'However: multiple lacunar infarcts over time lead to "lacunar state" with vascular dementia, pseudobulbar palsy, and gait disorder',
            'Treatment focuses on aggressive risk factor management, especially BP and glucose control',
            'Antiplatelet therapy preferred over anticoagulation (not typically cardioembolic)',
          ],
        ),
        TableBlock(
          title: 'Lacunar Syndromes -- Detailed Localization',
          columns: ['Syndrome', 'Specific Location', 'Artery Involved', 'Pathology'],
          rows: [
            ['Pure motor hemiparesis', 'Posterior limb of internal capsule (most common) or basis pontis', 'Lenticulostriate (MCA) or pontine perforators (basilar)', 'Lipohyalinosis or microatheroma'],
            ['Pure sensory stroke', 'VPL nucleus of thalamus', 'Thalamogeniculate arteries (PCA)', 'Lipohyalinosis'],
            ['Dysarthria-clumsy hand', 'Basis pontis (most common) or genu of internal capsule', 'Pontine perforators (basilar)', 'Lipohyalinosis or microatheroma'],
            ['Ataxic hemiparesis', 'Posterior limb of IC, basis pontis, or corona radiata', 'Lenticulostriate or pontine perforators', 'Lipohyalinosis'],
            ['Sensorimotor stroke', 'Thalamocapsular junction (thalamus + posterior limb IC)', 'Thalamogeniculate + lenticulostriate', 'Largest lacunar type; worst prognosis of the five'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Lacunar State (Etat Lacunaire)',
          'Multiple lacunar infarcts over years produce a cumulative syndrome '
          'called "lacunar state": vascular parkinsonism (shuffling gait, '
          'bradykinesia), pseudobulbar palsy (emotional incontinence, dysphagia, '
          'dysarthria), vascular dementia, and urinary incontinence. This is '
          'distinct from a single lacunar event and represents chronic small vessel '
          'disease.',
        ),
        KnowledgeCheckBlock(
          question: 'A hypertensive patient presents with contralateral face, arm, and leg weakness equally, with no sensory loss, aphasia, or neglect. What is the most likely location of the infarct?',
          options: ['MCA cortical territory', 'Posterior limb of internal capsule', 'VPL thalamus', 'Occipital cortex'],
          correctIndex: 1,
          explanation: 'Pure motor hemiparesis is the most common lacunar syndrome and typically localizes to the posterior limb of the internal capsule. It affects face, arm, and leg equally (unlike MCA stroke) with NO cortical signs (no aphasia, neglect, or visual field cuts).',
          boardRelevance: 'BOARD-CORE',
        ),
        MnemonicBlock(
          'Lacunar Syndromes -- Location Memory Aid',
          'Pure Motor = Posterior limb of Internal Capsule (P for P)\n'
          'Pure Sensory = VPL Thalamus (S for Sensory = Thalamus)\n'
          'Dysarthria-Clumsy Hand = Basis Pontis (D for Down in the pons)\n'
          'Ataxic Hemiparesis = Internal Capsule or Pons (A for All over)\n'
          'Sensorimotor = Thalamocapsular junction (SM for Straddling the Middle)',
        ),
      ],
    ),
  ],
);
