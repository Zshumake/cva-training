import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData acuteManagementContent = TopicData(
  id: 'acute_management',
  title: 'Acute Management',
  tabs: [
    // ── Immediate Tab ──
    TopicTab(
      title: 'Immediate',
      blocks: [
        HeaderBlock('Immediate Stroke Management'),
        TextBlock(
          'Acute stroke is a medical emergency. The immediate priorities are '
          'stabilization of the patient, rapid neurological assessment, '
          'emergent brain imaging to distinguish ischemic from hemorrhagic '
          'stroke, and initiation of time-sensitive reperfusion therapy if '
          'indicated. "Time is brain" -- every minute of delay means more '
          'irreversible brain damage.',
          isIntro: true,
        ),
        NumberedListBlock([
          MapEntry('Emergency Department Stroke Protocol', ''),
          MapEntry('ABCs', 'Secure airway, breathing, circulation; intubate if GCS <=8 or unable to protect airway'),
          MapEntry('Vital signs and monitoring', 'Continuous cardiac monitoring, pulse oximetry, temperature'),
          MapEntry('Establish IV access', 'Two large-bore IVs; draw labs (glucose, CBC, BMP, coags, troponin)'),
          MapEntry('Finger-stick glucose', 'Immediately -- hypoglycemia can mimic stroke and must be corrected first'),
          MapEntry('NIHSS assessment', 'Standardized neurological examination to quantify deficit severity'),
          MapEntry('Emergent non-contrast CT', 'Must be obtained within 25 minutes of arrival (door-to-CT); rule out hemorrhage'),
          MapEntry('Determine tPA eligibility', 'Within 4.5 hours of symptom onset; review inclusion/exclusion criteria'),
          MapEntry('NPO status', 'Nothing by mouth until formal swallowing evaluation (dysphagia risk)'),
        ]),
        PearlBlock(
          'Board Pearl: NPO Until Swallow Evaluation',
          'All stroke patients must be kept NPO (nothing by mouth) until a '
          'formal swallowing evaluation is completed. Dysphagia occurs in '
          '37-78% of acute stroke patients and aspiration pneumonia is a '
          'leading cause of death in stroke patients. A bedside swallow '
          'screen should be performed before any oral intake.',
        ),
        BulletCardBlock(
          title: 'Time Benchmarks (AHA/ASA Guidelines)',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Door-to-physician: <10 minutes',
            'Door-to-CT completion: <25 minutes',
            'Door-to-CT interpretation: <45 minutes',
            'Door-to-needle (tPA administration): <60 minutes',
            'Door-to-groin puncture (thrombectomy): <90 minutes',
            'These benchmarks reflect the critical importance of rapid treatment -- each 15-minute reduction in door-to-needle time is associated with improved outcomes',
          ],
        ),
        TimelineBlock(
          title: 'Acute Stroke Protocol Timeline',
          milestones: [
            TimelineMilestone(
              label: '0-10 min',
              title: 'Door-to-Physician',
              details: ['ABCs and vital signs', 'Establish IV access, draw labs', 'Finger-stick glucose immediately', 'Activate stroke team'],
            ),
            TimelineMilestone(
              label: '10-25 min',
              title: 'Door-to-CT Completion',
              details: ['Emergent non-contrast CT', 'NIHSS assessment (can occur during transport)', 'Rule out hemorrhage before any thrombolytic'],
            ),
            TimelineMilestone(
              label: '25-45 min',
              title: 'Door-to-CT Interpretation',
              details: ['CT read by radiologist or stroke physician', 'CTA if LVO suspected (thrombectomy triage)', 'Review tPA inclusion/exclusion criteria'],
            ),
            TimelineMilestone(
              label: '<60 min',
              title: 'Door-to-Needle (tPA)',
              details: ['IV alteplase 0.9 mg/kg (max 90 mg)', '10% bolus over 1 minute, 90% over 60 minutes', 'BP must be <185/110 before administration'],
            ),
            TimelineMilestone(
              label: '<90 min',
              title: 'Door-to-Groin Puncture',
              details: ['Mechanical thrombectomy for LVO', 'Standard window 0-6 hours; extended to 24 hours with imaging selection', 'tPA should NOT be delayed for thrombectomy -- give during transfer'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'What is the AHA/ASA target for door-to-needle time for IV tPA administration?',
          options: ['<30 minutes', '<45 minutes', '<60 minutes', '<90 minutes'],
          correctIndex: 2,
          explanation: 'The AHA/ASA guideline target for door-to-needle time is <60 minutes. Each 15-minute reduction in door-to-needle time is associated with improved outcomes. Door-to-groin puncture for thrombectomy should be <90 minutes.',
          boardRelevance: 'BOARD-CORE',
        ),
        BulletCardBlock(
          title: 'Initial Orders and Supportive Care',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Head of bed at 0-15 degrees (flat) for ischemic stroke to maximize cerebral perfusion (unless ICP concerns)',
            'Head of bed at 30 degrees for hemorrhagic stroke (balance ICP and perfusion)',
            'IV normal saline -- avoid hypotonic fluids (can worsen cerebral edema)',
            'Treat hyperthermia aggressively -- fever worsens stroke outcomes; target normothermia',
            'Maintain glucose 140-180 mg/dL -- avoid both hyperglycemia and hypoglycemia',
            'DVT prophylaxis: intermittent pneumatic compression devices immediately; pharmacologic when safe',
            'Avoid Foley catheter if possible (UTI risk) -- use bladder scanning and intermittent catheterization',
          ],
        ),
        ComparisonCardBlock(
          title: 'Glucose Management in Acute Stroke',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.bloodtype,
          description:
              'Both hyperglycemia and hypoglycemia worsen stroke outcomes. '
              'Tight glucose control is critical in the acute phase.',
          keyPoints: [
            'Target glucose: 140-180 mg/dL in acute stroke',
            'Hyperglycemia (>180 mg/dL) increases infarct size, hemorrhagic transformation risk, and mortality',
            'Hyperglycemia promotes anaerobic glycolysis, lactic acidosis, and free radical production in ischemic tissue',
            'Insulin infusion for persistent hyperglycemia >180 mg/dL',
            'Hypoglycemia (<60 mg/dL) can mimic stroke AND worsen ischemic injury',
            'SHINE trial: intensive glucose control (80-130) did NOT improve outcomes vs standard (80-180) and caused more hypoglycemia',
            'Check finger-stick glucose immediately on arrival -- hypoglycemia is a stroke mimic that must be excluded first',
          ],
        ),
        ComparisonCardBlock(
          title: 'Temperature Management in Acute Stroke',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.thermostat,
          description:
              'Fever is common after stroke and is independently associated '
              'with worse outcomes. Aggressive normothermia is recommended.',
          keyPoints: [
            'Fever occurs in 25-50% of stroke patients in the first 48 hours',
            'Every 1 degree C rise in temperature worsens stroke outcome',
            'Hyperthermia increases metabolic demand, excitotoxicity, BBB breakdown, and free radical production',
            'Target normothermia: 36.0-37.5 degrees C',
            'Treat with acetaminophen 650-1000 mg every 4-6 hours; consider ibuprofen',
            'Cooling blankets and surface cooling devices for refractory fever',
            'Search for and treat underlying infection (UTI, pneumonia, line infection)',
            'Therapeutic hypothermia (33-35 degrees C) for stroke remains investigational (unlike post-cardiac arrest)',
          ],
        ),
      ],
    ),

    // ── BP Management Tab ──
    TopicTab(
      title: 'BP Management',
      blocks: [
        HeaderBlock('Blood Pressure Management'),
        TextBlock(
          'Blood pressure management in acute stroke is nuanced and differs '
          'based on stroke type and treatment decisions. In ischemic stroke, '
          'permissive hypertension is generally maintained to support perfusion '
          'through collateral pathways, while hemorrhagic stroke requires '
          'more aggressive BP reduction to limit hematoma expansion.',
          isIntro: true,
        ),
        TableBlock(
          title: 'BP Targets by Stroke Type and Scenario',
          columns: ['Clinical Scenario', 'BP Target', 'Rationale'],
          rows: [
            ['Ischemic stroke -- NOT receiving tPA', 'Permissive HTN; treat only if >220/120 mmHg', 'Higher BP maintains perfusion to ischemic penumbra through collateral vessels'],
            ['Ischemic stroke -- RECEIVING tPA', 'Must be <185/110 BEFORE tPA; maintain <180/105 for 24 hours AFTER', 'Higher BP increases risk of hemorrhagic transformation with thrombolysis'],
            ['Ischemic stroke -- post-thrombectomy', '<180/105 mmHg for 24 hours', 'Same rationale as post-tPA'],
            ['ICH (intracerebral hemorrhage)', 'Target SBP <140 mmHg (INTERACT2 trial)', 'Reduces hematoma expansion; shown to be safe'],
            ['SAH (subarachnoid hemorrhage)', 'SBP <160 mmHg until aneurysm secured', 'Prevent rebleeding while maintaining cerebral perfusion'],
            ['SAH -- post-securing', 'Allow induced hypertension if vasospasm develops', 'Higher BP needed to push blood through spastic vessels'],
          ],
        ),
        PearlBlock(
          'Board Pearl: tPA Blood Pressure Limits',
          'For tPA eligibility, BP must be <185/110 mmHg BEFORE administration '
          'and maintained <180/105 mmHg for 24 hours AFTER administration. '
          'If BP cannot be brought below these thresholds, tPA is '
          'CONTRAINDICATED. These numbers are among the most commonly tested '
          'acute stroke management facts.',
        ),
        BulletCardBlock(
          title: 'Antihypertensive Agents for Acute Stroke',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'IV labetalol -- first-line; 10-20 mg IV push over 1-2 minutes; can repeat',
            'IV nicardipine -- continuous infusion 5-15 mg/hr; more predictable and titratable',
            'IV clevidipine -- alternative calcium channel blocker infusion',
            'IV hydralazine -- second-line; less predictable',
            'Avoid: sublingual nifedipine (precipitous drops), nitroprusside (raises ICP), oral agents acutely (unpredictable absorption)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Permissive Hypertension',
          'In acute ischemic stroke WITHOUT thrombolysis, do NOT aggressively '
          'lower BP unless >220/120 mmHg. The elevated BP is a compensatory '
          'response to maintain perfusion through collaterals to the ischemic '
          'penumbra. Rapidly lowering BP can extend the infarct. This concept '
          'of "permissive hypertension" is critical for boards.',
        ),
        TableBlock(
          title: 'Acute Blood Pressure Targets Summary',
          columns: ['Scenario', 'Pre-Treatment Target', 'Post-Treatment Target', 'Key Agent'],
          rows: [
            ['Ischemic -- no reperfusion', 'Treat only if >220/120', 'Allow autoregulation', 'Labetalol or nicardipine PRN'],
            ['Ischemic -- pre-tPA', '<185/110 (must achieve before giving tPA)', '<180/105 for 24 hours', 'Labetalol 10-20 mg IV or nicardipine 5 mg/hr'],
            ['Ischemic -- post-thrombectomy', '<180/105', '<180/105 for 24 hours', 'Nicardipine infusion preferred'],
            ['ICH', 'Rapidly lower to SBP <140', 'Maintain SBP <140 (INTERACT2)', 'Nicardipine infusion (titratable)'],
            ['SAH -- pre-securing', 'SBP <160', 'SBP <160 until aneurysm secured', 'Nicardipine or labetalol'],
            ['SAH -- post-securing with vasospasm', 'Allow induced hypertension', 'SBP 160-200 (triple H therapy)', 'Phenylephrine or norepinephrine'],
          ],
        ),
      ],
    ),

    // ── ICP Tab ──
    TopicTab(
      title: 'ICP',
      blocks: [
        HeaderBlock('Intracranial Pressure Management'),
        TextBlock(
          'Elevated intracranial pressure (ICP) is a life-threatening '
          'complication of large ischemic strokes and hemorrhagic strokes. '
          'The Monro-Kellie doctrine states that the intracranial compartment '
          'is a fixed volume: an increase in any component (brain, blood, or '
          'CSF) must be offset by a decrease in another, or ICP rises.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'ICP Fundamentals',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Normal ICP: 5-15 mmHg (or 70-200 mm H2O)',
            'ICP >20 mmHg requires treatment',
            'Cerebral perfusion pressure (CPP) = MAP - ICP',
            'Target CPP >60 mmHg (some guidelines suggest >70 mmHg)',
            'Brain herniation occurs when ICP exceeds compensatory mechanisms',
            'Signs of herniation: blown pupil (CN III compression), Cushing triad (hypertension, bradycardia, irregular respirations), decerebrate posturing',
          ],
        ),
        PearlBlock(
          'Board Pearl: CPP = MAP - ICP',
          'The most important formula in ICP management. Cerebral perfusion '
          'pressure (CPP) must be maintained >60 mmHg. This means either '
          'lowering ICP or raising MAP (or both). If ICP is 25 and MAP is 80, '
          'CPP is only 55 -- inadequate. Treatment must restore CPP >60.',
        ),
        NumberedListBlock([
          MapEntry('Stepwise ICP Management', ''),
          MapEntry('Head of bed elevation', 'Elevate HOB to 30 degrees; keep head midline to facilitate venous drainage'),
          MapEntry('Avoid ICP-raising factors', 'Treat pain, agitation, fever, seizures, constipation; avoid hypotonic fluids'),
          MapEntry('Osmotic therapy', 'Mannitol 20% (0.25-1 g/kg IV) or hypertonic saline (23.4% via central line, 3% via peripheral)'),
          MapEntry('Controlled hyperventilation', 'Temporary measure only; target PaCO2 30-35 mmHg; reduces ICP via cerebral vasoconstriction'),
          MapEntry('Sedation', 'Propofol or midazolam to reduce cerebral metabolic demand'),
          MapEntry('CSF drainage', 'External ventricular drain (EVD) if hydrocephalus is present'),
          MapEntry('Decompressive surgery', 'Decompressive craniectomy for malignant MCA infarction (age <60, within 48 hours); posterior fossa decompression for cerebellar hemorrhage'),
        ]),
        TableBlock(
          title: 'Osmotic Agents Comparison',
          columns: ['Agent', 'Mechanism', 'Key Considerations'],
          rows: [
            ['Mannitol 20%', 'Osmotic diuresis; draws water from brain parenchyma across intact BBB', 'Dose: 0.25-1 g/kg IV bolus; monitor serum osmolality (hold if >320); can cause hypovolemia and renal injury; requires urinary catheter'],
            ['Hypertonic saline (3%, 7.5%, 23.4%)', 'Osmotic gradient draws water from brain; expands intravascular volume', '23.4% requires central line; 3% can be given peripherally; does not cause diuresis; may be preferred in hypovolemic patients'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Decompressive Craniectomy',
          'Decompressive craniectomy (hemicraniectomy) for malignant MCA '
          'infarction reduces mortality from ~80% to ~20% when performed in '
          'patients <60 years old within 48 hours of stroke onset (DECIMAL, '
          'DESTINY, HAMLET trials). However, many survivors have moderate-to-'
          'severe disability. This is an important shared decision-making '
          'conversation with families.',
        ),
        ComparisonCardBlock(
          title: 'Malignant MCA Infarction',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.warning_amber,
          description:
              'Complete MCA territory infarction with massive cerebral edema, '
              'typically peaking at 72-96 hours post-stroke, leading to '
              'transtentorial herniation and death in up to 80% without surgery.',
          keyPoints: [
            'Typically affects >50% of MCA territory on imaging',
            'Peak edema and herniation risk at days 2-5 post-stroke',
            'Clinical signs: progressive drowsiness, blown pupil, Cushing triad',
            'DESTINY trial: hemicraniectomy within 48 hours reduced mortality (NNT = 2)',
            'DECIMAL trial: confirmed mortality reduction with early surgery',
            'HAMLET trial: benefit seen only when performed within 48 hours (NOT at 96 hours)',
            'DESTINY II (age 61-82): reduced mortality but most survivors had severe disability (mRS 4-5)',
            'Age <60 with large MCA infarct: strong recommendation for hemicraniectomy',
            'Age >60: shared decision-making -- survival benefit exists but functional outcome is often poor',
          ],
        ),
        ComparisonCardBlock(
          title: 'Posterior Fossa Decompression',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.medical_services,
          description:
              'Cerebellar hemorrhage or infarction can cause rapid brainstem '
              'compression and obstructive hydrocephalus requiring emergent surgery.',
          keyPoints: [
            'Cerebellar hemorrhage >3 cm diameter: neurosurgical evacuation recommended',
            'Cerebellar hemorrhage with brainstem compression or hydrocephalus: emergent surgical indication',
            'EVD (external ventricular drain) for obstructive hydrocephalus',
            'Surgery can be life-saving with excellent functional recovery potential (unlike supratentorial)',
            'Posterior fossa is a small, rigid compartment -- less tolerance for mass effect',
            'Signs: rapidly declining consciousness, gaze palsy, ataxia, lower cranial nerve palsies',
            'Do NOT rely solely on GCS -- clinical deterioration can be sudden and catastrophic',
          ],
        ),
        TableBlock(
          title: 'Hemorrhagic Transformation Classification (ECASS)',
          columns: ['Type', 'Definition', 'Clinical Significance'],
          rows: [
            ['HI-1 (Hemorrhagic Infarction 1)', 'Small petechiae along margins of infarct', 'Usually clinically silent; common after reperfusion'],
            ['HI-2 (Hemorrhagic Infarction 2)', 'Confluent petechiae within infarct without mass effect', 'Usually clinically silent; monitor closely'],
            ['PH-1 (Parenchymal Hematoma 1)', 'Hematoma <30% of infarct area, mild mass effect', 'May or may not be symptomatic; hold antithrombotics'],
            ['PH-2 (Parenchymal Hematoma 2)', 'Hematoma >30% of infarct area with significant mass effect', 'CLINICALLY SIGNIFICANT -- associated with neurological deterioration and worse outcomes; most feared complication of tPA'],
          ],
        ),
        PearlBlock(
          'Board Pearl: PH-2 Hemorrhagic Transformation',
          'PH-2 (parenchymal hematoma type 2) is the only type of hemorrhagic '
          'transformation that is consistently associated with clinical '
          'deterioration and increased mortality. It occurs in approximately '
          '2-6% of tPA-treated patients. Risk factors include: large infarct '
          'volume, high NIHSS, hyperglycemia, advanced age, and early CT '
          'hypodensity. HI-1 and HI-2 are generally considered benign and '
          'may even indicate successful reperfusion.',
        ),
      ],
    ),

    // ── tPA Tab ──
    TopicTab(
      title: 'tPA',
      blocks: [
        HeaderBlock('IV Thrombolysis (tPA / Alteplase)'),
        TextBlock(
          'Intravenous alteplase (tPA) is the standard thrombolytic therapy '
          'for acute ischemic stroke. It works by converting plasminogen to '
          'plasmin, which breaks down fibrin clots. tPA must be administered '
          'within 4.5 hours of symptom onset (or last known well time) and '
          'requires strict adherence to inclusion and exclusion criteria.',
          isIntro: true,
        ),
        MedicationCardBlock(
          name: 'Alteplase (tPA)',
          drugClass: 'Thrombolytic / fibrinolytic agent',
          mechanism: 'Recombinant tissue plasminogen activator; converts plasminogen to plasmin, which lyses fibrin clots',
          indication: 'Acute ischemic stroke within 4.5 hours of symptom onset (or last known well time)',
          dosing: '0.9 mg/kg IV (max 90 mg total); 10% given as IV bolus over 1 minute, remaining 90% infused over 60 minutes',
          sideEffects: 'Symptomatic intracranial hemorrhage (~6%), systemic bleeding, angioedema (especially with ACE inhibitor use)',
          boardPearl: 'The dose for stroke (0.9 mg/kg, max 90 mg) is LOWER than the dose for MI (100 mg). The 10% bolus + 60-min infusion protocol is unique to stroke. BP must be <185/110 before and <180/105 for 24 hours after.',
        ),
        BulletCardBlock(
          title: 'tPA Inclusion Criteria (0-3 Hour Window)',
          themeColor: Color(0xFF16A34A),
          backgroundColor: Color(0xFFF0FDF4),
          points: [
            'Clinical diagnosis of ischemic stroke with measurable neurological deficit',
            'Symptom onset (or last known well time) within 3 hours',
            'Age >= 18 years',
            'CT brain showing NO hemorrhage and no large completed infarct',
            'BP <185/110 mmHg (can be achieved with treatment)',
          ],
        ),
        BulletCardBlock(
          title: 'Extended Window (3-4.5 Hours) -- Additional Criteria',
          themeColor: Color(0xFF16A34A),
          backgroundColor: Color(0xFFF0FDF4),
          points: [
            'Same criteria as 0-3 hours, PLUS:',
            'Age <80 years (relative contraindication >80 in 3-4.5 hr window per ECASS III)',
            'NIHSS <25',
            'NOT on oral anticoagulants (regardless of INR)',
            'No history of both diabetes AND prior stroke',
            'Based on ECASS III trial extending the window from 3 to 4.5 hours',
          ],
        ),
        BulletCardBlock(
          title: 'Absolute Exclusion Criteria',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Evidence of ICH on CT',
            'Symptoms suggestive of SAH (even with normal CT)',
            'BP >185/110 mmHg despite treatment',
            'Active internal bleeding or known bleeding diathesis',
            'Platelet count <100,000/mm3',
            'INR >1.7 or PT >15 seconds',
            'Heparin within 48 hours with elevated PTT',
            'Current use of direct thrombin inhibitors or factor Xa inhibitors with elevated lab tests',
            'Head trauma or prior stroke within 3 months',
            'Major surgery within 14 days',
            'Intracranial neoplasm, AVM, or aneurysm',
            'GI or urinary tract hemorrhage within 21 days',
            'Arterial puncture at non-compressible site within 7 days',
          ],
        ),
        PearlBlock(
          'Board Pearl: tPA Key Numbers',
          'Dose: 0.9 mg/kg (max 90 mg). Window: <4.5 hours. BP: <185/110 '
          'before, <180/105 after. Platelets: must be >100,000. INR: must be '
          '<1.7. Hemorrhagic transformation risk: ~6%. These numbers are '
          'tested on virtually every stroke exam. The most common reason for '
          'tPA exclusion is arriving outside the time window.',
        ),
        KnowledgeCheckBlock(
          question: 'What is the maximum blood pressure allowed BEFORE administering IV tPA for acute ischemic stroke?',
          options: ['<160/90 mmHg', '<180/105 mmHg', '<185/110 mmHg', '<220/120 mmHg'],
          correctIndex: 2,
          explanation: 'Blood pressure must be <185/110 mmHg before tPA administration and maintained <180/105 mmHg for 24 hours after. If BP cannot be brought below these thresholds with IV antihypertensives, tPA is contraindicated.',
          boardRelevance: 'BOARD-CORE',
        ),
        BulletCardBlock(
          title: 'Post-tPA Management',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'ICU or stroke unit admission for minimum 24 hours',
            'Neuro checks every 15 minutes for 2 hours, then every 30 minutes for 6 hours, then hourly for 16 hours',
            'BP monitoring: maintain <180/105 mmHg for 24 hours',
            'NO anticoagulants or antiplatelets for 24 hours after tPA',
            'NO arterial punctures, central lines, or invasive procedures for 24 hours',
            'Repeat CT at 24 hours (before starting antiplatelets)',
            'If neurological deterioration: STOP infusion, emergent CT, check coagulation studies, consider cryoprecipitate and tranexamic acid',
          ],
        ),
        MedicationCardBlock(
          name: 'Tenecteplase',
          drugClass: 'Thrombolytic / fibrinolytic agent (modified tPA)',
          mechanism: 'Genetically modified tPA with longer half-life, greater fibrin specificity, and resistance to PAI-1',
          indication: 'Emerging alternative to alteplase for acute ischemic stroke; particularly promising for large vessel occlusion prior to thrombectomy',
          dosing: '0.25 mg/kg IV single bolus (compared to alteplase\'s 60-minute infusion)',
          sideEffects: 'Similar hemorrhagic risk to alteplase',
          boardPearl: 'Tenecteplase\'s advantage is its single IV bolus administration (vs 60-minute infusion for alteplase), making it easier to administer, especially for inter-facility transfers. AHA/ASA 2024 guidelines now support tenecteplase as an alternative.',
        ),
        ComparisonCardBlock(
          title: 'ECASS III: Extended tPA Window (3-4.5 Hours)',
          themeColor: Color(0xFF16A34A),
          backgroundColor: Color(0xFFF0FDF4),
          icon: Icons.timer,
          description:
              'The ECASS III trial extended the tPA treatment window from 3 hours '
              'to 4.5 hours but with ADDITIONAL exclusion criteria beyond the '
              'standard 0-3 hour window.',
          keyPoints: [
            'ECASS III (2008): alteplase given at 3-4.5 hours improved functional outcome vs placebo',
            'Absolute benefit: 7.2% more patients achieved mRS 0-1',
            'Additional exclusion criteria for the 3-4.5 hour window:',
            'Age >80 years (higher hemorrhagic risk in extended window)',
            'NIHSS >25 (very severe strokes excluded)',
            'History of BOTH diabetes AND prior stroke (combination excluded)',
            'Current oral anticoagulant use regardless of INR value',
            'NNT = 14 for the 3-4.5 hour window (vs NNT = 7-8 for the 0-3 hour window)',
            'Benefit diminishes with time -- "time is brain" remains paramount',
          ],
        ),
        TableBlock(
          title: 'Tenecteplase vs Alteplase Comparison',
          columns: ['Feature', 'Alteplase (tPA)', 'Tenecteplase (TNK)'],
          rows: [
            ['Administration', '10% bolus + 60-minute infusion', 'Single IV bolus over 5-10 seconds'],
            ['Dose', '0.9 mg/kg (max 90 mg)', '0.25 mg/kg (max 25 mg)'],
            ['Half-life', '4-5 minutes', '20-24 minutes'],
            ['Fibrin specificity', 'Moderate', 'Higher (14x more fibrin-specific)'],
            ['PAI-1 resistance', 'Low', 'High (80x more resistant)'],
            ['Key advantage', 'Decades of evidence, well-established', 'Simpler dosing; ideal for drip-and-ship transfers'],
            ['LVO data', 'Standard of care', 'Non-inferior to alteplase; may have higher early recanalization for LVO (AcT trial)'],
            ['Hemorrhagic risk', '~6% sICH', 'Similar (~6% sICH)'],
          ],
        ),
      ],
    ),

    // ── Thrombectomy Tab ──
    TopicTab(
      title: 'Thrombectomy',
      blocks: [
        HeaderBlock('Mechanical Thrombectomy'),
        TextBlock(
          'Mechanical thrombectomy (endovascular thrombectomy, EVT) is the '
          'standard of care for acute ischemic stroke caused by large vessel '
          'occlusion (LVO) in the anterior circulation. Five landmark trials '
          'in 2015 (MR CLEAN, ESCAPE, EXTEND-IA, SWIFT-PRIME, REVASCAT) '
          'established its benefit, and subsequent trials (DAWN, DEFUSE-3) '
          'extended the treatment window to 24 hours in select patients.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Thrombectomy Eligibility Criteria',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Large vessel occlusion (LVO): ICA, MCA M1 (and possibly M2) segments',
            'Standard window: within 6 hours of symptom onset (or last known well)',
            'Extended window: up to 24 hours with favorable perfusion imaging (DAWN, DEFUSE-3)',
            'NIHSS >= 6 (suggests significant deficit from LVO)',
            'Pre-stroke functional independence (mRS 0-1)',
            'ASPECTS score >= 6 on CT (Alberta Stroke Program Early CT Score; measures early ischemic changes)',
            'tPA should NOT be withheld if eligible -- thrombectomy is complementary, not a replacement',
          ],
        ),
        PearlBlock(
          'Board Pearl: Thrombectomy Time Windows',
          'Standard window: up to 6 hours from onset. Extended window: up to '
          '24 hours with perfusion imaging showing small core and large '
          'penumbra (DAWN trial used clinical-imaging mismatch; DEFUSE-3 '
          'used perfusion mismatch). The key concept: it is not just about '
          'time, but about tissue -- if salvageable brain exists, '
          'thrombectomy can still help.',
        ),
        TableBlock(
          title: 'Landmark Thrombectomy Trials',
          columns: ['Trial', 'Year', 'Key Finding'],
          rows: [
            ['MR CLEAN', '2015', 'First RCT showing benefit of EVT for LVO; number needed to treat (NNT) = 7'],
            ['ESCAPE', '2015', 'EVT within 12 hours; emphasis on good collaterals; NNT = 4'],
            ['EXTEND-IA', '2015', 'Perfusion imaging selection; high recanalization rates'],
            ['SWIFT-PRIME', '2015', 'Stent retriever + tPA superior to tPA alone'],
            ['REVASCAT', '2015', 'EVT benefit up to 8 hours'],
            ['DAWN', '2018', 'Extended window to 24 hours using clinical-imaging mismatch (small core, large deficit)'],
            ['DEFUSE-3', '2018', 'Extended window to 16 hours using perfusion imaging mismatch'],
          ],
        ),
        BulletCardBlock(
          title: 'Thrombectomy Procedure',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Performed under general anesthesia or conscious sedation (debate ongoing)',
            'Femoral or radial artery access; catheter advanced to the intracranial occlusion site',
            'Stent retriever technique: deployed across the clot, waits 3-5 minutes, then withdrawn with the clot',
            'Direct aspiration (ADAPT technique): suction catheter applied directly to clot face',
            'Combined techniques may be used',
            'Goal: successful recanalization (TICI 2b-3 flow) -- achieved in approximately 80-90% with modern devices',
            'Number needed to treat for good outcome: ~2.5-4 (extraordinarily effective)',
          ],
        ),
        PearlBlock(
          'Board Pearl: tPA + Thrombectomy',
          'tPA and thrombectomy are COMPLEMENTARY, not competing therapies. '
          'If a patient is eligible for tPA, it should be given immediately '
          'and should NOT be delayed for thrombectomy. tPA is given during '
          'transfer to the thrombectomy-capable center ("drip and ship" '
          'model). Thrombectomy without tPA is appropriate when tPA is '
          'contraindicated.',
        ),
        ComparisonCardBlock(
          title: 'DAWN Trial (6-24 Hour Window)',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.access_time_filled,
          description:
              'Landmark trial extending thrombectomy window to 24 hours using '
              'clinical-core mismatch (small infarct core on imaging with '
              'large clinical deficit on NIHSS).',
          keyPoints: [
            'Enrolled patients 6-24 hours from last known well with anterior LVO',
            'Used clinical-imaging mismatch: large NIHSS deficit + small infarct core on CTP or DWI',
            'Group A: age >= 80, NIHSS >= 10, core <21 mL',
            'Group B: age <80, NIHSS >= 10, core <31 mL',
            'Group C: age <80, NIHSS >= 20, core 31-51 mL',
            'Results: 49% vs 13% functional independence (mRS 0-2) -- NNT = 2.8',
            'Trial stopped early due to overwhelming benefit',
            'Paradigm shift: "time is brain" evolved to "tissue is brain"',
          ],
        ),
        ComparisonCardBlock(
          title: 'DEFUSE-3 Trial (6-16 Hour Window)',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          icon: Icons.access_time_filled,
          description:
              'Extended thrombectomy window to 16 hours using perfusion imaging '
              'mismatch between ischemic core and penumbra.',
          keyPoints: [
            'Enrolled patients 6-16 hours from onset with anterior LVO',
            'Used perfusion imaging mismatch: mismatch ratio >= 1.8, core <70 mL, penumbra >= 15 mL',
            'Results: 45% vs 17% functional independence (mRS 0-2) -- NNT = 3.6',
            'Also stopped early due to clear benefit',
            'Complementary to DAWN: uses perfusion imaging rather than clinical-core mismatch',
            'Together, DAWN and DEFUSE-3 established that imaging selection (not just time) determines candidacy',
            'Automated software (RAPID) processes CTP to calculate core and penumbra volumes in minutes',
          ],
        ),
        BulletCardBlock(
          title: 'Seizure Management in Acute Stroke',
          themeColor: Color(0xFFEA580C),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Post-stroke seizures occur in 5-10% of patients',
            'More common with hemorrhagic stroke and cortical involvement',
            'Early seizures (<7 days): often provoked, may not require long-term treatment',
            'Late seizures (>7 days): considered post-stroke epilepsy, require long-term AED therapy',
            'First-line AEDs: levetiracetam (Keppra) -- preferred due to fewer drug interactions and no hepatic metabolism',
            'Avoid phenytoin if possible -- interacts with warfarin, can impair recovery',
            'Prophylactic anticonvulsants are NOT recommended for ischemic stroke',
            'Prophylactic anticonvulsants may be considered for ICH (controversial) and SAH (short-term)',
            'Status epilepticus: IV lorazepam (first-line), then levetiracetam or fosphenytoin',
          ],
        ),
      ],
    ),
  ],
);
