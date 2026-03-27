import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData hemorrhagicStrokeContent = TopicData(
  id: 'hemorrhagic_stroke',
  title: 'Hemorrhagic Stroke',
  tabs: [
    // ── Overview Tab ──
    TopicTab(
      title: 'Overview',
      blocks: [
        HeaderBlock('Hemorrhagic Stroke Overview'),
        TextBlock(
          'Hemorrhagic stroke accounts for approximately 13% of all strokes '
          'but is responsible for a disproportionately high percentage of '
          'stroke-related deaths and disability. It is caused by rupture of a '
          'blood vessel, leading to bleeding into the brain parenchyma '
          '(intracerebral hemorrhage) or the subarachnoid space (subarachnoid '
          'hemorrhage).',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Facts',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Accounts for approximately 13% of all strokes (ICH ~10%, SAH ~3%)',
            'Much higher mortality than ischemic stroke (30-50% at 30 days for ICH)',
            'More common in younger patients compared to ischemic stroke',
            'Hypertension is the #1 risk factor for ICH',
            'Anticoagulant use is an increasingly common cause',
            'Presents with sudden onset of severe headache, vomiting, rapid neurological deterioration',
            'Often associated with elevated ICP and risk of herniation',
          ],
        ),
        TableBlock(
          title: 'ICH vs SAH Comparison',
          columns: ['Feature', 'Intracerebral Hemorrhage (ICH)', 'Subarachnoid Hemorrhage (SAH)'],
          rows: [
            ['Percentage of strokes', '~10%', '~3%'],
            ['Location of bleeding', 'Within brain parenchyma', 'Between arachnoid and pia mater'],
            ['Most common cause', 'Hypertension', 'Ruptured saccular (berry) aneurysm'],
            ['Classic presentation', 'Sudden focal deficit + headache + vomiting', '"Worst headache of my life" + neck stiffness'],
            ['CT appearance', 'Hyperdense (bright white) mass within brain', 'Blood in cisterns and sulci'],
            ['30-day mortality', '30-50%', '40-50%'],
            ['Key complication', 'Herniation from mass effect', 'Vasospasm (days 4-14)'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Hemorrhagic = Bright on CT',
          'Acute blood appears BRIGHT (hyperdense/white) on non-contrast CT. '
          'This is the opposite of ischemic stroke, which appears DARK '
          '(hypodense) -- and may not be visible at all in the first 6-12 '
          'hours. Remember: hemorrhagic = white = bright = emergency surgery '
          'consideration.',
        ),
      ],
    ),

    // ── ICH Tab ──
    TopicTab(
      title: 'ICH',
      blocks: [
        HeaderBlock('Intracerebral Hemorrhage'),
        TextBlock(
          'Intracerebral hemorrhage (ICH) results from rupture of a blood '
          'vessel directly into the brain parenchyma, forming a hematoma that '
          'causes damage through direct tissue destruction, mass effect, and '
          'elevated intracranial pressure. It accounts for approximately 10% '
          'of all strokes.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Etiology',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Hypertension -- #1 cause overall (Charcot-Bouchard microaneurysms of lenticulostriate arteries)',
            'Cerebral amyloid angiopathy (CAA) -- #1 cause in elderly/normotensive patients; causes lobar hemorrhage',
            'Anticoagulant therapy -- warfarin, DOACs, heparin',
            'Coagulopathy -- thrombocytopenia, DIC, liver failure',
            'Vascular malformations -- AVM, cavernous malformation',
            'Brain tumor (hemorrhagic metastasis: melanoma, renal cell, choriocarcinoma, thyroid)',
            'Drug use -- cocaine and amphetamines (acute hypertensive surge)',
            'Hemorrhagic transformation of ischemic stroke',
          ],
        ),
        TableBlock(
          title: 'ICH Locations and Associations',
          columns: ['Location', 'Frequency', 'Usual Cause', 'Clinical Features'],
          rows: [
            ['Putamen/basal ganglia', '35-50% (most common)', 'Hypertension', 'Contralateral hemiparesis, hemisensory loss, homonymous hemianopia, aphasia or neglect'],
            ['Thalamus', '10-15%', 'Hypertension', 'Contralateral sensory loss, upgaze palsy ("eyes look at the nose"), aphasia or neglect, may extend into ventricles'],
            ['Pons', '5-10%', 'Hypertension', 'Rapidly fatal; coma, quadriplegia, pinpoint reactive pupils, hyperthermia, posturing'],
            ['Cerebellum', '5-10%', 'Hypertension', 'Sudden onset ataxia, vertigo, headache, vomiting; may compress brainstem -- SURGICAL EMERGENCY'],
            ['Lobar (cortical)', '20-30%', 'Amyloid angiopathy, AVM', 'Varies by lobe; more common in elderly normotensive patients; recurrence risk is high with CAA'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Putamen = Most Common ICH Location',
          'The putamen is the most common site of hypertensive ICH due to '
          'rupture of the lenticulostriate arteries (branches of the MCA). '
          'Cerebellar hemorrhage is the most important to recognize because it '
          'is a surgical emergency -- posterior fossa decompression can be '
          'life-saving. Indications: hematoma >3 cm, brainstem compression, '
          'or hydrocephalus.',
        ),
        BulletCardBlock(
          title: 'ICH Management Principles',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Emergent CT to confirm diagnosis',
            'Blood pressure control: target SBP <140 mmHg (INTERACT2 trial) using IV nicardipine or labetalol',
            'Reverse anticoagulation if applicable (vitamin K, FFP, PCC for warfarin; idarucizumab for dabigatran; andexanet alfa for factor Xa inhibitors)',
            'Surgical evacuation considered for: cerebellar hemorrhage >3 cm, lobar hemorrhage with deterioration, young patients',
            'ICP management: osmotic therapy (mannitol 20%, hypertonic saline), HOB 30 degrees, hyperventilation as temporizing measure',
            'External ventricular drain (EVD) if intraventricular extension with hydrocephalus',
            'Seizure prophylaxis is controversial -- treat clinical seizures but routine prophylaxis not recommended for all',
          ],
        ),
        ScaleBlock(
          scaleName: 'ICH Score -- Prognosis Prediction',
          description: 'Validated grading scale for ICH prognosis. Score 0-6. Higher score = higher 30-day mortality.',
          columns: ['Component', 'Criteria', 'Points'],
          rows: [
            ['GCS 3-4', 'GCS score 3-4', '2'],
            ['GCS 5-12', 'GCS score 5-12', '1'],
            ['GCS 13-15', 'GCS score 13-15', '0'],
            ['ICH volume >= 30 mL', 'Hematoma volume >= 30 cm3', '1'],
            ['ICH volume < 30 mL', 'Hematoma volume < 30 cm3', '0'],
            ['IVH present', 'Intraventricular hemorrhage', '1'],
            ['Infratentorial origin', 'Brainstem or cerebellar', '1'],
            ['Age >= 80', 'Patient age >= 80 years', '1'],
          ],
          boardPearl:
              'ICH Score of 0 has ~0% 30-day mortality, while a score of 5 '
              'has ~100% 30-day mortality. This scale should NOT be used in '
              'isolation for withdrawal of care decisions.',
        ),
        TableBlock(
          title: 'ICH Score -- Mortality Correlation',
          columns: ['ICH Score', '30-Day Mortality', 'Clinical Interpretation'],
          rows: [
            ['0', '0%', 'Excellent prognosis'],
            ['1', '13%', 'Good prognosis'],
            ['2', '26%', 'Moderate prognosis'],
            ['3', '72%', 'Poor prognosis'],
            ['4', '97%', 'Very poor prognosis'],
            ['5', '100%', 'Uniformly fatal in original study'],
            ['6', '100%', 'Uniformly fatal'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Cerebral Amyloid Angiopathy (CAA)',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          icon: Icons.elderly,
          description:
              'Deposition of beta-amyloid protein in the walls of small cortical '
              'and leptomeningeal vessels. The leading cause of lobar ICH in '
              'elderly normotensive patients.',
          keyPoints: [
            'Most common cause of spontaneous lobar hemorrhage in patients over age 65',
            'Recurrent lobar hemorrhages in different locations over time -- hallmark pattern',
            'Spares deep structures (basal ganglia, thalamus, brainstem) -- these are hypertensive ICH locations',
            'Associated with Alzheimer disease (same beta-amyloid pathology) and progressive dementia',
            'MRI gradient echo (GRE/SWI) shows multiple cortical microbleeds -- key diagnostic finding',
            'Boston criteria used for diagnosis: probable CAA = multiple lobar hemorrhages in patient >= 55 with no other cause',
            'No specific treatment; anticoagulation is relatively contraindicated due to high rebleeding risk',
          ],
        ),
        BulletCardBlock(
          title: 'Warfarin-Related ICH',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Warfarin-related ICH has the highest mortality of any ICH subtype (~50-65%)',
            'Hematoma expansion is more rapid and prolonged compared to spontaneous ICH',
            'Supratherapeutic INR is the strongest risk factor, but ICH occurs even at therapeutic INR',
            'Emergent reversal is critical: 4-factor PCC (Kcentra) is preferred over FFP (faster, more complete reversal)',
            'Reversal protocol: IV Vitamin K 10 mg + 4-factor PCC (dose based on INR) -- target INR < 1.4 within 1 hour',
            'FFP is second-line (requires large volume, slower onset, risk of volume overload and TRALI)',
            'DOAC-related ICH: idarucizumab for dabigatran; andexanet alfa for rivaroxaban/apixaban',
            'Restarting anticoagulation after ICH is controversial -- generally considered after 4-8 weeks if strong indication exists',
          ],
        ),
        PearlBlock(
          'Board Pearl: CAA vs Hypertensive ICH',
          'Hypertensive ICH affects DEEP structures (putamen, thalamus, pons, '
          'cerebellum). CAA causes LOBAR (cortical) hemorrhages. If a question '
          'describes a normotensive elderly patient with recurrent lobar hemorrhages '
          'and cortical microbleeds on MRI, the answer is cerebral amyloid '
          'angiopathy. CAA + anticoagulation is a particularly dangerous combination.',
        ),
        KnowledgeCheckBlock(
          question: 'What is the most common location for hypertensive intracerebral hemorrhage?',
          options: ['Thalamus', 'Putamen/basal ganglia', 'Cerebellum', 'Lobar (cortical)'],
          correctIndex: 1,
          explanation: 'The putamen/basal ganglia is the most common site of hypertensive ICH (35-50% of cases), caused by rupture of lenticulostriate arteries. Lobar hemorrhages are more characteristic of cerebral amyloid angiopathy in normotensive elderly patients.',
          boardRelevance: 'BOARD-CORE',
        ),
      ],
    ),

    // ── SAH Tab ──
    TopicTab(
      title: 'SAH',
      blocks: [
        HeaderBlock('Subarachnoid Hemorrhage'),
        TextBlock(
          'Subarachnoid hemorrhage (SAH) is bleeding into the subarachnoid '
          'space, most commonly from rupture of a saccular (berry) aneurysm '
          'at the Circle of Willis. It accounts for approximately 3% of all '
          'strokes but carries extremely high morbidity and mortality.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Clinical Features',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            '"Worst headache of my life" -- sudden, severe, thunderclap headache reaching maximum intensity in seconds',
            'Neck stiffness (meningismus) -- blood irritates the meninges',
            'Nausea, vomiting, photophobia',
            'Loss of consciousness at onset (up to 50% of patients)',
            'Sentinel headache -- warning headache from minor leak days to weeks before major rupture (reported in 30-50%)',
            'Cranial nerve findings (CN III palsy from PComm aneurysm)',
            'Subhyaloid (preretinal) hemorrhage on fundoscopy -- Terson syndrome',
          ],
        ),
        PearlBlock(
          'Board Pearl: "Worst Headache of My Life"',
          'Any patient presenting with a sudden-onset severe headache ("worst '
          'headache of my life" or "thunderclap headache") must be evaluated '
          'for SAH. Step 1: non-contrast CT (sensitivity >95% within 6 '
          'hours). Step 2: if CT is negative, perform lumbar puncture looking '
          'for xanthochromia (yellow discoloration from bilirubin). Step 3: '
          'if SAH confirmed, CTA or conventional angiography to locate the '
          'aneurysm.',
        ),
        BulletCardBlock(
          title: 'Saccular (Berry) Aneurysms',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Cause ~85% of non-traumatic SAH',
            'Located at arterial bifurcations of the Circle of Willis',
            'Most common location: anterior communicating artery (AComm) ~30-35%',
            'Second most common: posterior communicating artery (PComm) ~25-30%',
            'Risk factors: hypertension, smoking, heavy alcohol use, family history, connective tissue disorders',
            'Associated conditions: ADPKD (autosomal dominant polycystic kidney disease), Ehlers-Danlos type IV, coarctation of the aorta',
            'Risk of rupture increases with aneurysm size (especially >7 mm)',
          ],
        ),
        ScaleBlock(
          scaleName: 'Hunt & Hess Scale -- SAH Clinical Grading',
          description: 'Clinical grading scale for SAH severity. Used to predict prognosis and guide surgical timing.',
          columns: ['Grade', 'Criteria', 'Approximate Mortality'],
          rows: [
            ['Grade I', 'Asymptomatic or mild headache, slight nuchal rigidity', '~1%'],
            ['Grade II', 'Moderate-severe headache, nuchal rigidity, cranial nerve palsy only', '~5%'],
            ['Grade III', 'Drowsiness, confusion, or mild focal deficit', '~19%'],
            ['Grade IV', 'Stupor, moderate-severe hemiparesis, early decerebrate posturing', '~42%'],
            ['Grade V', 'Deep coma, decerebrate posturing, moribund appearance', '~77%'],
          ],
          boardPearl:
              'Hunt & Hess Grade I-III: generally favorable for early surgical '
              'intervention (clipping or coiling within 72 hours). Grade IV-V: '
              'worse prognosis; surgery may be delayed until clinical '
              'improvement. Higher grade = higher mortality.',
        ),
        TableBlock(
          title: 'SAH Complications by Timeframe',
          columns: ['Timeframe', 'Complication', 'Details'],
          rows: [
            ['Immediate (day 0)', 'Rebleeding', 'Greatest risk in first 24 hours; ~4% in first day; highest mortality risk'],
            ['Days 1-3', 'Acute hydrocephalus', 'Blood blocks CSF absorption at arachnoid granulations'],
            ['Days 4-14', 'Cerebral vasospasm', 'Most dangerous complication; peaks days 7-10; causes delayed cerebral ischemia (DCI)'],
            ['Days 4-14', 'Hyponatremia', 'Cerebral salt wasting (NOT SIADH) -- treat with saline, not fluid restriction'],
            ['Weeks-months', 'Chronic hydrocephalus', 'Communicating type; may require VP shunt; presents as NPH'],
            ['Weeks-months', 'Seizures', '~5-10% develop seizures'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Vasospasm and Nimodipine',
          'Cerebral vasospasm peaks at days 7-10 post-SAH and is the leading '
          'cause of morbidity in SAH survivors. Nimodipine (oral calcium '
          'channel blocker) is given to ALL SAH patients for 21 days to '
          'improve outcomes. Note: nimodipine improves outcomes but has NOT '
          'been shown to reduce angiographic vasospasm -- it is '
          'neuroprotective. Treatment of symptomatic vasospasm is "triple H '
          'therapy": Hypertension, Hypervolemia, Hemodilution.',
        ),
        MedicationCardBlock(
          name: 'Nimodipine',
          drugClass: 'Calcium channel blocker (dihydropyridine)',
          mechanism: 'Selective cerebral vasodilation and neuroprotection; crosses blood-brain barrier',
          indication: 'ALL patients with SAH -- reduces poor outcomes from vasospasm',
          dosing: '60 mg PO/NG every 4 hours for 21 days; begin within 96 hours of SAH',
          sideEffects: 'Hypotension (dose-limiting), headache, nausea',
          boardPearl: 'Nimodipine is the ONLY medication proven to improve outcomes in SAH. It must be given ORALLY -- IV administration is not approved and has caused fatal hypotension and cardiac arrest.',
        ),
        ScaleBlock(
          scaleName: 'Fisher Scale -- SAH CT Grading',
          description:
              'Grades the amount and distribution of blood on initial CT scan '
              'after SAH. Predicts risk of delayed cerebral vasospasm.',
          columns: ['Grade', 'CT Appearance', 'Vasospasm Risk'],
          rows: [
            ['Grade 1', 'No blood detected on CT', 'Low (~21%)'],
            ['Grade 2', 'Diffuse thin layer of blood (<1 mm thick)', 'Low (~25%)'],
            ['Grade 3', 'Thick clot or localized clot (>1 mm thick)', 'HIGH (~37%)'],
            ['Grade 4', 'Diffuse or no subarachnoid blood but with intraventricular hemorrhage (IVH)', 'Moderate (~31%)'],
          ],
          boardPearl:
              'Fisher Grade 3 (thick cisternal clot >1 mm) carries the highest risk '
              'of vasospasm. The Modified Fisher Scale (0-4) adds IVH as a separate '
              'variable and is increasingly used in clinical practice.',
        ),
        ScaleBlock(
          scaleName: 'Modified Fisher Scale',
          description:
              'Updated version of the Fisher Scale. Better predictor of '
              'symptomatic vasospasm. Independently scores cisternal blood and IVH.',
          columns: ['Grade', 'Cisternal Blood', 'IVH', 'Symptomatic Vasospasm Risk'],
          rows: [
            ['0', 'No SAH or IVH', 'No', '~0%'],
            ['1', 'Thin SAH, no IVH', 'No', '~24%'],
            ['2', 'Thin SAH, with IVH', 'Yes', '~33%'],
            ['3', 'Thick SAH, no IVH', 'No', '~33%'],
            ['4', 'Thick SAH, with IVH', 'Yes', '~40%'],
          ],
          boardPearl:
              'The Modified Fisher Scale improves on the original by treating IVH '
              'as an independent predictor of vasospasm rather than grouping it with '
              'Grade 4. Higher Modified Fisher grades correlate with higher '
              'vasospasm rates.',
        ),
        BulletCardBlock(
          title: 'Vasospasm -- Timeline and Management',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Occurs in 30-70% of SAH patients angiographically; ~30% develop symptomatic delayed cerebral ischemia (DCI)',
            'Timeline: begins day 3, peaks days 7-10, resolves by day 14-21',
            'Monitored by: daily neurological exams, transcranial Doppler (TCD) velocities >120 cm/s suggest spasm, >200 cm/s is severe',
            'Nimodipine 60 mg PO q4h x 21 days -- given to ALL SAH patients (only proven pharmacological intervention)',
            'Triple-H therapy (hypertension, hypervolemia, hemodilution) was traditional treatment but is now largely ABANDONED',
            'Current approach: euvolemia + induced hypertension (phenylephrine or norepinephrine drip) for symptomatic vasospasm',
            'Refractory vasospasm: intra-arterial verapamil or balloon angioplasty via endovascular intervention',
            'Hypervolemia is no longer recommended -- it increases complications (pulmonary edema, electrolyte derangement) without proven benefit',
          ],
        ),
        PearlBlock(
          'Board Pearl: Triple-H Therapy -- Outdated',
          'Classic teaching emphasized "triple-H therapy" (Hypertension, '
          'Hypervolemia, Hemodilution) for vasospasm. Modern evidence supports '
          'ONLY induced hypertension with euvolemia. Hypervolemia and hemodilution '
          'have been abandoned because they increase complications without '
          'improving outcomes. However, older board questions may still reference '
          'triple-H therapy as the answer.',
        ),
        BulletCardBlock(
          title: 'SAH -- Hyponatremia Distinction',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Hyponatremia occurs in ~30-50% of SAH patients and worsens vasospasm risk',
            'Cerebral salt wasting (CSW) is the primary cause -- NOT SIADH (this distinction is high-yield)',
            'CSW: hyponatremia + hypovolemia + high urine sodium + high urine output (renal salt loss)',
            'SIADH: hyponatremia + euvolemia/hypervolemia + concentrated urine + low urine output',
            'CSW treatment: aggressive IV normal saline + fludrocortisone (volume replacement)',
            'SIADH treatment: fluid restriction -- but fluid restriction is CONTRAINDICATED in SAH (worsens vasospasm)',
            'If unsure, always give saline in SAH (treating as CSW is safer than restricting fluids)',
          ],
        ),
        PearlBlock(
          'Board Pearl: CSW vs SIADH in SAH',
          'In SAH, hyponatremia is almost always cerebral salt wasting (CSW), '
          'NOT SIADH. The critical difference: CSW patients are hypovolemic '
          'and need saline. SIADH patients are euvolemic and need fluid restriction. '
          'Fluid restriction in SAH is DANGEROUS because it worsens cerebral '
          'vasospasm. When in doubt in SAH, give saline.',
        ),
        TimelineBlock(
          title: 'SAH Vasospasm and Complications Timeline',
          milestones: [
            TimelineMilestone(
              label: 'Day 0',
              title: 'Aneurysm Rupture',
              details: ['Thunderclap headache, meningismus', 'Rebleeding risk highest in first 24 hours (~4%)', 'Emergent CT, secure aneurysm (clip or coil) within 72 hours'],
            ),
            TimelineMilestone(
              label: 'Days 1-3',
              title: 'Acute Hydrocephalus',
              details: ['Blood blocks CSF absorption at arachnoid granulations', 'May require EVD placement', 'Begin nimodipine 60 mg PO q4h (continue for 21 days)'],
            ),
            TimelineMilestone(
              label: 'Days 4-14',
              title: 'Vasospasm Window',
              details: ['Peak vasospasm at days 7-10', 'Monitor with TCD (velocity >120 cm/s = spasm)', 'Delayed cerebral ischemia (DCI) is the leading cause of morbidity', 'Treat with induced hypertension + euvolemia'],
            ),
            TimelineMilestone(
              label: 'Days 14-21',
              title: 'Vasospasm Resolution',
              details: ['Spasm gradually resolves by day 21', 'Complete 21-day course of nimodipine', 'Monitor for hyponatremia (cerebral salt wasting)'],
            ),
            TimelineMilestone(
              label: 'Weeks-Months',
              title: 'Late Complications',
              details: ['Chronic communicating hydrocephalus (may need VP shunt)', 'NPH triad: "wet, wobbly, wacky"', 'Seizures in 5-10%', 'Cognitive and behavioral deficits'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'In SAH, hyponatremia is most commonly caused by which of the following?',
          options: ['SIADH', 'Cerebral salt wasting', 'Diabetes insipidus', 'Iatrogenic fluid overload'],
          correctIndex: 1,
          explanation: 'In SAH, hyponatremia is most commonly caused by cerebral salt wasting (CSW), NOT SIADH. CSW produces hypovolemic hyponatremia and requires IV saline. Fluid restriction (SIADH treatment) is contraindicated in SAH because it worsens vasospasm.',
          boardRelevance: 'BOARD-CORE',
        ),
      ],
    ),

    // ── AVM Tab ──
    TopicTab(
      title: 'AVM',
      blocks: [
        HeaderBlock('Arteriovenous Malformations'),
        TextBlock(
          'Arteriovenous malformations (AVMs) are congenital tangles of '
          'abnormal arteries and veins connected by a nidus without '
          'intervening capillary beds. They are the most common cause of '
          'hemorrhagic stroke in young adults and children.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'AVM Key Facts',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Congenital vascular malformation -- present from birth but often asymptomatic until young adulthood',
            'Most common presentation: ICH (50% of cases), followed by seizures (25%)',
            'Annual rupture risk: approximately 2-4% per year',
            'Lifetime bleeding risk: approximately 40-50% (historically estimated by "105 minus age in years")',
            'Peak presentation: ages 20-40',
            'High-flow shunting may cause vascular steal phenomenon (ischemia of surrounding tissue)',
            'May present with headache, progressive neurological deficit, or incidental finding',
          ],
        ),
        PearlBlock(
          'Board Pearl: AVM Lifetime Bleed Risk',
          'The lifetime risk of AVM hemorrhage is approximately 40-50%. A '
          'historical estimation formula is: lifetime risk = 105 - patient\'s '
          'age. For example, a 25-year-old has approximately 80% lifetime '
          'risk. This underscores why younger patients are more aggressively '
          'treated. Annual rupture risk is 2-4% per year, cumulating over a '
          'lifetime.',
        ),
        ScaleBlock(
          scaleName: 'Spetzler-Martin AVM Grading Scale',
          description: 'Used to predict surgical risk for AVM resection. Score 1-5 (sum of three components). Higher grade = higher surgical risk.',
          columns: ['Component', 'Feature', 'Points'],
          rows: [
            ['Size of nidus', 'Small (<3 cm)', '1'],
            ['Size of nidus', 'Medium (3-6 cm)', '2'],
            ['Size of nidus', 'Large (>6 cm)', '3'],
            ['Location', 'Non-eloquent cortex', '0'],
            ['Location', 'Eloquent cortex (motor, sensory, language, visual, thalamus, brainstem)', '1'],
            ['Venous drainage', 'Superficial only', '0'],
            ['Venous drainage', 'Deep drainage present', '1'],
          ],
          boardPearl:
              'Grade I-II: usually amenable to surgical resection. Grade III: '
              'individualized decision. Grade IV-V: high surgical risk; often '
              'managed conservatively or with radiosurgery. Grade VI (added '
              'informally) = inoperable.',
        ),
        TableBlock(
          title: 'Vascular Malformation Types Comparison',
          columns: ['Type', 'Pathology', 'Bleeding Risk', 'Treatment'],
          rows: [
            ['AVM', 'Arterial-venous connections without capillary bed; high flow', 'High (2-4%/year)', 'Surgery, embolization, radiosurgery, or combination'],
            ['Cavernous malformation (cavernoma)', 'Low-flow sinusoidal channels without intervening brain; "popcorn" on MRI', 'Low (~0.5-1%/year)', 'Surgery if symptomatic and accessible; observation often appropriate'],
            ['Developmental venous anomaly (DVA)', 'Anomalous venous drainage; most common vascular malformation', 'Extremely low', 'Benign -- NO treatment; must not be resected (may be sole venous drainage)'],
            ['Capillary telangiectasia', 'Dilated capillaries, often in pons', 'Extremely low', 'Benign -- no treatment needed'],
            ['Dural AV fistula', 'Acquired; within dura mater', 'Variable', 'Embolization or surgery if symptomatic'],
          ],
        ),
        BulletCardBlock(
          title: 'AVM Treatment Options',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Microsurgical resection -- definitive treatment, best for low-grade (Spetzler-Martin I-II)',
            'Endovascular embolization -- used as adjunct to reduce AVM size before surgery or radiosurgery',
            'Stereotactic radiosurgery (Gamma Knife) -- for small, deep, or eloquent-area AVMs; takes 2-3 years for full obliteration',
            'Multimodality treatment -- combination approach for large or complex AVMs',
            'Conservative management -- may be appropriate for high-grade AVMs in elderly patients (ARUBA trial showed observation may be superior to intervention for unruptured AVMs)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Spetzler-Martin Quick Reference',
          'Spetzler-Martin Grade = Size (1-3) + Eloquence (0-1) + Drainage (0-1). '
          'Grade I-II: surgical cure is usually safe and recommended. Grade III: '
          'individualized. Grade IV-V: high surgical risk; consider radiosurgery '
          'for small nidus or observation. Eloquent cortex includes motor, sensory, '
          'language, visual, thalamus, hypothalamus, brainstem, and cerebellar peduncles.',
        ),
        BulletCardBlock(
          title: 'Normal Perfusion Pressure Breakthrough',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Complication after AVM resection or embolization',
            'Chronic high-flow AVM shunting causes surrounding brain to lose autoregulation',
            'After AVM removal, normal perfusion pressure is too high for the previously "steal"-affected tissue',
            'Results in edema, hemorrhage, or both in the tissue surrounding the former AVM site',
            'Risk is higher with large, high-flow AVMs',
            'Staged embolization before surgery may reduce this risk by allowing gradual hemodynamic adjustment',
          ],
        ),
        TableBlock(
          title: 'Hemorrhagic Stroke -- Reversal Agents',
          columns: ['Anticoagulant', 'Reversal Agent', 'Key Details'],
          rows: [
            ['Warfarin', '4-factor PCC (Kcentra) + IV Vitamin K', 'PCC preferred over FFP (faster, smaller volume); target INR <1.4 within 1 hour'],
            ['Dabigatran (Pradaxa)', 'Idarucizumab (Praxbind)', 'Monoclonal antibody fragment; 5g IV; immediate and complete reversal'],
            ['Rivaroxaban/Apixaban', 'Andexanet alfa (Andexxa)', 'Recombinant modified factor Xa; binds and sequesters factor Xa inhibitors'],
            ['Heparin (UFH)', 'Protamine sulfate', '1 mg protamine per 100 units heparin given in prior 2-3 hours; max 50 mg'],
            ['LMWH (enoxaparin)', 'Protamine sulfate (partial)', 'Only ~60% reversal; 1 mg per 1 mg enoxaparin given in prior 8 hours'],
            ['Antiplatelet agents', 'Platelet transfusion (controversial)', 'PATCH trial showed platelet transfusion may WORSEN outcomes in antiplatelet-related ICH'],
          ],
        ),
      ],
    ),
  ],
);
