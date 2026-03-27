import 'models/clinical_scenario_model.dart';

/// All clinical branching scenarios for CVA Training.
class StrokeClinicalScenarios {
  static const List<ClinicalScenario> all = [
    tpaDecision,
    thrombectomy,
    ichManagement,
    postStrokeDysphagia,
    motorRecoveryRehab,
  ];

  // ════════════════════════════════════════════════════════════
  // SCENARIO 1 -- Acute Ischemic Stroke: tPA Decision
  // ════════════════════════════════════════════════════════════

  static const ClinicalScenario tpaDecision = ClinicalScenario(
    id: 'tpa_decision_01',
    title: 'Acute Ischemic Stroke: tPA Decision',
    patientSummary:
        '72M, sudden left hemiparesis and left facial droop noted by '
        'wife 2 hours ago. PMH: HTN, HLD. No prior strokes. NIHSS 16. '
        'Last known well 2 hours ago.',
    difficulty: 'Intermediate',
    moduleId: 'ischemic_stroke',
    steps: [
      // ──────────────────────────────────────
      // STEP 1 -- Initial assessment / CT
      // ──────────────────────────────────────
      ScenarioStep(
        id: 'step_1',
        narrative:
            'EMS brings a 72-year-old man to the ED with acute left '
            'hemiparesis, left facial droop, and dysarthria. Onset was '
            'witnessed 2 hours ago. Code stroke has been activated. A '
            'non-contrast CT head has been completed. What is your '
            'immediate priority after reviewing the CT?',
        vitals: VitalSigns(
          hr: 88,
          sbp: 178,
          dbp: 96,
          rr: 18,
          spo2: 96,
          temp: 37.0,
          nihss: 16,
        ),
        imagingFinding:
            'NCCT Head: No acute hemorrhage. No early ischemic changes. '
            'No mass lesion. Old lacunar infarct in right caudate. '
            'ASPECTS score 9.',
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) CT is negative for hemorrhage -- check glucose and '
                'confirm tPA eligibility',
            isCorrect: true,
            consequence:
                'You confirm no hemorrhage on CT and proceed to verify '
                'tPA eligibility. Fingerstick glucose returns at '
                '142 mg/dL (normal). Review of inclusion/exclusion '
                'criteria begins.',
            explanation:
                'The first priority after a negative CT is to rule out '
                'hypoglycemia (which can mimic stroke) and confirm tPA '
                'eligibility. AHA/ASA guidelines require: (1) Measurable '
                'neurological deficit, (2) Onset within 4.5 hours, '
                '(3) Age >= 18, (4) No hemorrhage on CT. A glucose check '
                'is the ONLY lab required before initiating tPA -- do not '
                'delay for other labs unless clinical suspicion of '
                'coagulopathy. The ASPECTS score of 9 (out of 10) '
                'indicates minimal early ischemic change, which is '
                'favorable for thrombolysis.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 86,
              sbp: 174,
              dbp: 94,
              rr: 18,
              spo2: 97,
              temp: 37.0,
              nihss: 16,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Obtain MRI with diffusion-weighted imaging before '
                'making treatment decisions',
            isCorrect: false,
            consequence:
                'Waiting for MRI delays treatment by 45 minutes. The '
                'patient is now 2 hours 45 minutes from symptom onset. '
                'While the MRI eventually confirms the infarct, '
                'precious treatment time has been lost.',
            explanation:
                'MRI is NOT required before IV tPA administration. NCCT '
                'to exclude hemorrhage is sufficient. Delaying treatment '
                'for MRI reduces the benefit of thrombolysis -- the NNT '
                'increases with every 15-minute delay. The phrase "time '
                'is brain" reflects that 1.9 million neurons are lost '
                'per minute in a large vessel occlusion. MRI with DWI '
                'may be useful for unclear diagnoses or extended window '
                'cases but should never delay treatment in a clear '
                'clinical presentation within the standard window.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 90,
              sbp: 180,
              dbp: 98,
              rr: 18,
              spo2: 96,
              temp: 37.0,
              nihss: 17,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Wait for complete CBC, BMP, coagulation studies, '
                'and troponin before proceeding',
            isCorrect: false,
            consequence:
                'Lab results take 40 minutes. The treatment window '
                'narrows significantly. Meanwhile NIHSS increases to 18, '
                'suggesting thrombus propagation.',
            explanation:
                'AHA/ASA guidelines state that IV alteplase should NOT '
                'be delayed for lab results unless there is clinical '
                'suspicion of a bleeding abnormality or anticoagulant '
                'use. The only lab required before tPA is a fingerstick '
                'glucose. Waiting for a full panel is a common and '
                'harmful delay. Exception: if the patient is on '
                'anticoagulants, check INR/PTT. If on a DOAC, specific '
                'levels or thrombin time may be needed. This patient has '
                'no anticoagulant history.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 92,
              sbp: 182,
              dbp: 100,
              rr: 18,
              spo2: 96,
              temp: 37.0,
              nihss: 18,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Start IV labetalol to lower BP below 140/90 before '
                'any intervention',
            isCorrect: false,
            consequence:
                'Aggressive BP lowering drops BP to 128/72. The patient '
                'develops worsening neurological deficits as perfusion '
                'to the ischemic penumbra is compromised. NIHSS '
                'increases to 20.',
            explanation:
                'The BP threshold for IV tPA is < 185/110, NOT 140/90. '
                'Current BP of 178/96 is BELOW the tPA threshold and '
                'does not need treatment before thrombolysis. Aggressive '
                'BP lowering in acute ischemic stroke can worsen '
                'outcomes by reducing collateral perfusion to the '
                'ischemic penumbra. After tPA administration, maintain '
                'BP < 180/105 for 24 hours. Board pearl: know the BP '
                'thresholds -- 185/110 pre-tPA, 180/105 post-tPA, and '
                '220/120 for non-tPA candidates.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 128,
              dbp: 72,
              rr: 16,
              spo2: 97,
              temp: 37.0,
              nihss: 20,
            ),
          ),
        ],
      ),

      // ──────────────────────────────────────
      // STEP 2 -- tPA dosing and administration
      // ──────────────────────────────────────
      ScenarioStep(
        id: 'step_2',
        narrative:
            'The patient meets all inclusion criteria for IV tPA. No '
            'exclusion criteria are identified. He weighs 82 kg. The '
            'stroke team is ready to administer alteplase. What is the '
            'correct dosing protocol?',
        vitals: VitalSigns(
          hr: 86,
          sbp: 176,
          dbp: 94,
          rr: 18,
          spo2: 97,
          temp: 37.0,
          nihss: 16,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) Alteplase 0.9 mg/kg (max 90 mg): 10% bolus over 1 '
                'minute, remainder infused over 60 minutes',
            isCorrect: true,
            consequence:
                'You administer alteplase correctly: 7.4 mg IV bolus '
                'over 1 minute, then 66.6 mg infused over 60 minutes '
                '(total 74 mg for 82 kg). BP is monitored every 15 '
                'minutes. NIHSS improves to 12 at 30 minutes.',
            explanation:
                'The standard IV alteplase dose for acute ischemic '
                'stroke is 0.9 mg/kg with a maximum of 90 mg. The '
                'protocol is: 10% as IV bolus over 1 minute, remaining '
                '90% infused over 60 minutes. For this 82 kg patient: '
                '0.9 x 82 = 73.8 mg total. Bolus: 7.4 mg. Infusion: '
                '66.4 mg over 60 min. Post-tPA monitoring: neuro checks '
                'every 15 min for 2 hours, then every 30 min for 6 '
                'hours, then hourly for 16 hours. BP must remain '
                '< 180/105. No anticoagulants or antiplatelets for '
                '24 hours.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 82,
              sbp: 168,
              dbp: 88,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 12,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Alteplase 0.6 mg/kg: 15% bolus, remainder over '
                '30 minutes',
            isCorrect: false,
            consequence:
                'The lower dose provides subtherapeutic thrombolysis. '
                'The NIHSS improves only marginally to 15. The clot '
                'is not adequately lysed.',
            explanation:
                'The 0.6 mg/kg dose was studied in the ENCHANTED trial '
                '(primarily in Asian populations) and showed '
                'non-inferiority for death/disability but lower rates '
                'of symptomatic ICH. However, the AHA/ASA standard '
                'recommendation remains 0.9 mg/kg (max 90 mg) for the '
                'general population. The 15% bolus and 30-minute '
                'infusion are also non-standard. Using the wrong dose '
                'or protocol may result in inadequate clot lysis. Board '
                'exams expect the standard 0.9 mg/kg protocol.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 86,
              sbp: 172,
              dbp: 92,
              rr: 18,
              spo2: 97,
              temp: 37.0,
              nihss: 15,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Tenecteplase 0.25 mg/kg as a single IV bolus',
            isCorrect: false,
            consequence:
                'Tenecteplase is administered as a single bolus. While '
                'this is logistically simpler and shows promise in '
                'trials, it is not yet the standard of care in the '
                'United States for acute ischemic stroke.',
            explanation:
                'Tenecteplase (TNK) has emerged as a potential '
                'alternative to alteplase with advantages of single '
                'bolus dosing and possibly superior recanalization in '
                'LVO. The AcT trial and other studies support TNK '
                '0.25 mg/kg. The 2024 AHA/ASA guidelines now include '
                'TNK 0.25 mg/kg as a reasonable alternative (Class 2a). '
                'However, alteplase 0.9 mg/kg remains the primary '
                'recommendation (Class 1) and is the expected answer '
                'on most board examinations. TNK use is growing but '
                'institutional protocols vary.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 84,
              sbp: 170,
              dbp: 90,
              rr: 16,
              spo2: 97,
              temp: 37.0,
              nihss: 13,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Alteplase 1.0 mg/kg with 20% bolus for faster '
                'recanalization',
            isCorrect: false,
            consequence:
                'The higher dose leads to symptomatic intracerebral '
                'hemorrhage 4 hours after administration. The patient '
                'develops sudden unresponsiveness and a fixed dilated '
                'left pupil.',
            explanation:
                'Overdosing alteplase significantly increases the risk '
                'of symptomatic ICH. The 0.9 mg/kg dose (max 90 mg) '
                'was established by the NINDS trial and has been the '
                'standard for decades. The 10% bolus / 90% infusion '
                'protocol provides optimal balance of efficacy and '
                'safety. Higher doses (such as the 1.1 mg/kg used in '
                'cardiac PE protocols) are NOT appropriate for stroke '
                'due to unacceptable hemorrhage rates. Board pearl: '
                'the stroke dose (0.9 mg/kg max 90 mg) is LOWER than '
                'the PE dose (100 mg) -- never confuse the two.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 52,
              sbp: 198,
              dbp: 108,
              rr: 12,
              spo2: 94,
              temp: 37.0,
              nihss: 28,
              gcs: 7,
            ),
          ),
        ],
      ),

      // ──────────────────────────────────────
      // STEP 3 -- Post-tPA BP management
      // ──────────────────────────────────────
      ScenarioStep(
        id: 'step_3',
        narrative:
            'Thirty minutes into the alteplase infusion, the nurse '
            'reports the patient\'s blood pressure has risen to '
            '192/106 mmHg. The patient is otherwise stable with NIHSS '
            'of 14. What is your next step?',
        vitals: VitalSigns(
          hr: 84,
          sbp: 192,
          dbp: 106,
          rr: 16,
          spo2: 97,
          temp: 37.0,
          nihss: 14,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) IV labetalol 10-20 mg push; target BP < 180/105',
            isCorrect: true,
            consequence:
                'You administer labetalol 10 mg IV over 1 minute. BP '
                'decreases to 172/98. The tPA infusion continues '
                'without interruption. Repeat neuro exam shows stable '
                'NIHSS of 14.',
            explanation:
                'Post-tPA BP must be maintained < 180/105 for 24 hours '
                'to minimize the risk of hemorrhagic transformation. '
                'First-line agents: IV labetalol 10-20 mg over 1-2 '
                'minutes (may repeat) or nicardipine infusion 5 mg/hr '
                '(titrate by 2.5 mg/hr every 5-15 min, max 15 mg/hr). '
                'If BP remains above 180/105 after two doses of '
                'labetalol, consider nicardipine or clevidipine drip. '
                'Avoid aggressive lowering below 140/80 as this can '
                'worsen penumbral ischemia.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 172,
              dbp: 98,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 14,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Stop the tPA infusion immediately due to '
                'hypertensive emergency',
            isCorrect: false,
            consequence:
                'The infusion is stopped prematurely. Only 50% of the '
                'total dose has been administered. The clot is not '
                'adequately lysed. NIHSS worsens to 18 as the thrombus '
                'propagates.',
            explanation:
                'BP of 192/106 exceeds the 180/105 threshold but is '
                'NOT a reason to stop tPA. The correct approach is to '
                'treat the BP with antihypertensives while continuing '
                'the infusion. tPA should only be stopped for: '
                '(1) Suspected symptomatic ICH (sudden neurological '
                'deterioration, severe headache, vomiting), '
                '(2) Severe allergic reaction / angioedema, '
                '(3) Uncontrollable bleeding. Hypertension during tPA '
                'infusion is common and treatable -- it is not an '
                'indication to stop the drug.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 88,
              sbp: 186,
              dbp: 102,
              rr: 18,
              spo2: 96,
              temp: 37.0,
              nihss: 18,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Start nitroprusside drip for rapid BP reduction '
                'to < 140/90',
            isCorrect: false,
            consequence:
                'Nitroprusside causes a precipitous drop to 118/68. '
                'The patient develops worsening left-sided weakness as '
                'penumbral blood flow is compromised. NIHSS increases '
                'to 20.',
            explanation:
                'Nitroprusside is NOT recommended as a first-line agent '
                'in acute stroke due to unpredictable BP drops and the '
                'risk of increased intracranial pressure (via cerebral '
                'vasodilation). Furthermore, targeting 140/90 is too '
                'aggressive -- the post-tPA target is < 180/105, not '
                '< 140/90. Overly aggressive BP lowering in acute '
                'stroke reduces collateral perfusion and can convert '
                'the ischemic penumbra into infarct core. Preferred '
                'agents are labetalol, nicardipine, or clevidipine.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 98,
              sbp: 118,
              dbp: 68,
              rr: 18,
              spo2: 96,
              temp: 37.0,
              nihss: 20,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Observe without treatment; BP will come down on '
                'its own once tPA takes effect',
            isCorrect: false,
            consequence:
                'BP remains elevated at 192/106 for the next hour. '
                'The sustained hypertension increases the risk of '
                'hemorrhagic transformation. Post-tPA CT at 24 hours '
                'shows petechial hemorrhage in the infarct territory.',
            explanation:
                'Post-tPA BP > 180/105 must be actively treated. '
                'Observation alone is not acceptable because sustained '
                'hypertension during and after thrombolysis significantly '
                'increases the risk of symptomatic intracerebral '
                'hemorrhage (sICH). The sICH rate is approximately 6% '
                'with tPA; uncontrolled hypertension is a major '
                'modifiable risk factor. Frequent BP monitoring (every '
                '15 min for 2 hours, then every 30 min for 6 hours) '
                'with prompt treatment is essential.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 86,
              sbp: 190,
              dbp: 104,
              rr: 16,
              spo2: 97,
              temp: 37.0,
              nihss: 15,
            ),
          ),
        ],
      ),

      // ──────────────────────────────────────
      // STEP 4 -- CTA reveals LVO
      // ──────────────────────────────────────
      ScenarioStep(
        id: 'step_4',
        narrative:
            'CTA obtained alongside the initial CT (results now '
            'available) shows a left M1 MCA occlusion. The tPA infusion '
            'is complete. NIHSS remains 14. The nearest thrombectomy-'
            'capable center is 45 minutes away by ground ambulance. '
            'What is the next step?',
        vitals: VitalSigns(
          hr: 80,
          sbp: 168,
          dbp: 90,
          rr: 16,
          spo2: 98,
          temp: 37.0,
          nihss: 14,
        ),
        imagingFinding:
            'CTA Head/Neck: Complete occlusion of the left M1 segment '
            'of the middle cerebral artery. Good collateral circulation '
            'via leptomeningeal anastomoses. No carotid stenosis. '
            'No vertebrobasilar abnormality.',
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Arrange emergent transfer for mechanical '
                'thrombectomy -- the patient is within the treatment '
                'window and meets criteria',
            isCorrect: true,
            consequence:
                'You initiate drip-and-ship protocol. The patient is '
                'transferred and undergoes successful mechanical '
                'thrombectomy with TICI 2b/3 recanalization 4 hours '
                'after onset. NIHSS at 24 hours is 4.',
            explanation:
                'This patient has a proximal LVO (M1 MCA) with a '
                'significant deficit (NIHSS 14) within the 6-hour '
                'standard window for thrombectomy. Five landmark '
                'trials (MR CLEAN, ESCAPE, EXTEND-IA, SWIFT PRIME, '
                'REVASCAT) established mechanical thrombectomy as '
                'standard of care for LVO within 6 hours (and DAWN/'
                'DEFUSE-3 extended this to 24 hours in select patients). '
                'tPA and thrombectomy are complementary -- the "drip-'
                'and-ship" model (tPA at the presenting hospital, '
                'transfer for EVT) is appropriate when local EVT is '
                'not available. NNT for thrombectomy is approximately '
                '2.6 for improved functional outcome.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 158,
              dbp: 84,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 4,
            ),
          ),
          ScenarioChoice(
            text:
                'B) The tPA has been given; observe for clinical '
                'improvement before considering further intervention',
            isCorrect: false,
            consequence:
                'You observe for 6 hours. NIHSS remains 14. The '
                'thrombectomy window passes. The M1 occlusion persists. '
                'The patient is left with a large MCA territory infarct '
                'and dense hemiplegia.',
            explanation:
                'Waiting to see if tPA alone will recanalize an LVO '
                'is a critical error. IV tPA alone achieves '
                'recanalization in only 10-30% of proximal LVO '
                '(M1/ICA). The additional benefit of thrombectomy is '
                'substantial: absolute risk reduction of 20-30% for '
                'disability. The AHA/ASA guidelines recommend that '
                'thrombectomy should NOT be delayed to assess tPA '
                'response. Transfer should be initiated as soon as '
                'LVO is identified, even during or immediately after '
                'tPA infusion.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 84,
              sbp: 166,
              dbp: 90,
              rr: 16,
              spo2: 97,
              temp: 37.2,
              nihss: 14,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Administer a second dose of tPA since the first '
                'did not fully resolve symptoms',
            isCorrect: false,
            consequence:
                'A second dose of tPA is given. The patient develops '
                'symptomatic intracerebral hemorrhage 2 hours later '
                'with sudden unresponsiveness.',
            explanation:
                'Repeat dosing of IV tPA is CONTRAINDICATED. A second '
                'dose dramatically increases the risk of symptomatic '
                'ICH without meaningful additional benefit for large '
                'vessel occlusion. The appropriate escalation for a '
                'persistent LVO after IV tPA is mechanical '
                'thrombectomy, not repeat thrombolysis. This is a '
                'high-yield board point: know the difference between '
                'IV tPA (clot dissolution with systemic fibrinolysis) '
                'and mechanical thrombectomy (physical clot retrieval '
                'via catheter).',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 56,
              sbp: 202,
              dbp: 112,
              rr: 10,
              spo2: 93,
              temp: 37.0,
              nihss: 30,
              gcs: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Start a heparin drip at therapeutic dose to prevent '
                'clot propagation',
            isCorrect: false,
            consequence:
                'Heparin is started 2 hours after tPA. The patient '
                'develops a large parenchymal hematoma in the infarct '
                'territory. Emergency CT shows a 45 mL hemorrhage with '
                'midline shift.',
            explanation:
                'Anticoagulation within 24 hours of IV tPA is '
                'CONTRAINDICATED due to the high risk of hemorrhagic '
                'transformation. AHA/ASA guidelines clearly state: no '
                'antiplatelets or anticoagulants for 24 hours after '
                'tPA, and a follow-up CT must confirm no hemorrhage '
                'before starting these agents. For persistent LVO, '
                'the answer is mechanical thrombectomy, not systemic '
                'anticoagulation.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 110,
              sbp: 88,
              dbp: 58,
              rr: 22,
              spo2: 92,
              temp: 37.0,
              nihss: 32,
              gcs: 4,
            ),
          ),
        ],
      ),

      // ──────────────────────────────────────
      // STEP 5 -- 24-hour follow-up
      // ──────────────────────────────────────
      ScenarioStep(
        id: 'step_5',
        narrative:
            'It is now 24 hours after treatment. The follow-up CT head '
            'shows a small left MCA territory infarct without '
            'hemorrhagic transformation. NIHSS has improved to 6. The '
            'patient is hemodynamically stable. What is the appropriate '
            'next step in secondary prevention?',
        vitals: VitalSigns(
          hr: 74,
          sbp: 148,
          dbp: 82,
          rr: 14,
          spo2: 98,
          temp: 37.0,
          nihss: 6,
        ),
        imagingFinding:
            '24-hour CT Head: Left MCA territory infarct involving '
            'the posterior insular cortex and superior temporal gyrus. '
            'No hemorrhagic transformation. No significant midline '
            'shift.',
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Start aspirin 325 mg (now that 24-hour post-tPA '
                'window has passed and CT shows no hemorrhage), '
                'high-dose statin, and order vascular workup',
            isCorrect: true,
            consequence:
                'Aspirin 325 mg is given. Atorvastatin 80 mg is '
                'started. Echocardiography, lipid panel, HbA1c, and '
                'telemetry are ordered. Stroke etiology workup is '
                'initiated to guide long-term secondary prevention.',
            explanation:
                'At 24 hours post-tPA, after confirming no hemorrhage '
                'on CT, antiplatelet therapy should be initiated. '
                'Aspirin 160-325 mg within 24-48 hours of ischemic '
                'stroke reduces recurrence and mortality (IST and CAST '
                'trials). High-intensity statin (atorvastatin 80 mg) '
                'reduces recurrent stroke by ~25% (SPARCL trial) and '
                'should be started regardless of baseline LDL. The '
                'vascular workup (echo, carotid imaging, cardiac '
                'monitoring for AF) determines the stroke mechanism '
                'and guides long-term prevention (antiplatelets vs '
                'anticoagulation).',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 142,
              dbp: 78,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Start dual antiplatelet therapy (aspirin + '
                'clopidogrel) immediately for 90 days',
            isCorrect: false,
            consequence:
                'Dual antiplatelet therapy is started. While DAPT has '
                'evidence in minor stroke, this patient had a moderate '
                'stroke (NIHSS 16) and the DAPT indication is not as '
                'clearly supported for this severity.',
            explanation:
                'Dual antiplatelet therapy (DAPT) with aspirin + '
                'clopidogrel has evidence from the CHANCE and POINT '
                'trials for MINOR ischemic stroke (NIHSS <= 3) or '
                'high-risk TIA within 24 hours of onset, continued '
                'for 21 days (CHANCE) or up to 90 days (POINT). This '
                'patient had a NIHSS of 16, which is a moderate-to-'
                'severe stroke -- DAPT is not well-supported at this '
                'severity and increases bleeding risk. The correct '
                'initial step is aspirin monotherapy with statin and '
                'etiologic workup. DAPT may be considered later based '
                'on etiology (e.g., intracranial stenosis).',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 146,
              dbp: 80,
              rr: 14,
              spo2: 98,
              temp: 37.0,
              nihss: 6,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Start warfarin with a target INR of 2-3 for '
                'secondary stroke prevention',
            isCorrect: false,
            consequence:
                'Warfarin is started without a clear indication. The '
                'stroke etiology has not been determined yet. If this '
                'is an atherosclerotic stroke, anticoagulation may '
                'actually increase the risk of hemorrhage without '
                'benefit over antiplatelet therapy.',
            explanation:
                'Anticoagulation for secondary stroke prevention is '
                'only indicated for specific etiologies: atrial '
                'fibrillation, mechanical heart valves, cardiac thrombus, '
                'or certain hypercoagulable states. The WARSS trial '
                'showed NO benefit of warfarin over aspirin for non-'
                'cardioembolic stroke, with increased bleeding. Stroke '
                'etiology must be determined before choosing between '
                'antiplatelets and anticoagulation. For AF-related '
                'stroke, DOACs (apixaban, rivaroxaban, dabigatran, '
                'edoxaban) are now preferred over warfarin.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 146,
              dbp: 80,
              rr: 14,
              spo2: 98,
              temp: 37.0,
              nihss: 6,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Discharge the patient home with aspirin and '
                'outpatient follow-up in 2 weeks',
            isCorrect: false,
            consequence:
                'The patient is discharged prematurely. Three days '
                'later, he returns with a recurrent stroke. The workup '
                'that was never completed would have revealed atrial '
                'fibrillation requiring anticoagulation.',
            explanation:
                'Premature discharge without completing the stroke '
                'etiology workup is dangerous. The risk of recurrent '
                'stroke is highest in the first 30 days (approximately '
                '5-15%). An NIHSS of 6 indicates ongoing deficits that '
                'need inpatient rehabilitation evaluation. The workup '
                'must include: cardiac rhythm monitoring (at least '
                '24-72 hours of telemetry), echocardiography, vascular '
                'imaging, and metabolic labs. Up to 25% of cryptogenic '
                'strokes are later found to have AF with extended '
                'monitoring.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 146,
              dbp: 80,
              rr: 14,
              spo2: 98,
              temp: 37.0,
              nihss: 6,
            ),
          ),
        ],
      ),
    ],
  );

  // ════════════════════════════════════════════════════════════
  // SCENARIO 2 -- Large Vessel Occlusion: Thrombectomy
  // ════════════════════════════════════════════════════════════

  static const ClinicalScenario thrombectomy = ClinicalScenario(
    id: 'thrombectomy_01',
    title: 'Large Vessel Occlusion: Thrombectomy Decision',
    patientSummary:
        '58F, sudden R hemiplegia, global aphasia, forced left gaze '
        'deviation. NIHSS 22. Last seen normal 5 hours ago. PMH: AFib '
        '(not on anticoagulation), HTN, DM2.',
    difficulty: 'Advanced',
    moduleId: 'ischemic_stroke',
    steps: [
      // STEP 1 -- Identify LVO
      ScenarioStep(
        id: 'step_1',
        narrative:
            'A 58-year-old woman is brought by EMS with right '
            'hemiplegia, global aphasia, and left gaze preference. '
            'Last seen normal 5 hours ago. NCCT shows no hemorrhage, '
            'ASPECTS 7. What is the critical next imaging study?',
        vitals: VitalSigns(
          hr: 92,
          sbp: 162,
          dbp: 88,
          rr: 20,
          spo2: 95,
          temp: 37.2,
          nihss: 22,
        ),
        imagingFinding:
            'NCCT Head: No hemorrhage. Hyperdense left MCA sign present. '
            'Loss of gray-white differentiation in left insular cortex, '
            'left M2 and M3 regions. ASPECTS 7.',
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) CTA head and neck to identify the site of '
                'occlusion and assess for LVO',
            isCorrect: true,
            consequence:
                'CTA reveals a left M1 MCA occlusion with a clot '
                'length of 12 mm. Left ICA is patent. Good collateral '
                'circulation is visible.',
            explanation:
                'CTA is the critical next step when LVO is suspected '
                'based on clinical presentation (NIHSS >= 6, cortical '
                'signs, gaze deviation). The hyperdense MCA sign on '
                'NCCT suggests thrombus in the MCA. CTA confirms the '
                'occlusion site and assesses collateral circulation, '
                'which is a key prognostic factor. ASPECTS of 7 '
                '(out of 10) indicates moderate early ischemic changes '
                'but is above the threshold of >= 6 used in the '
                'landmark thrombectomy trials. CTA also evaluates for '
                'tandem lesions (cervical ICA dissection or stenosis).',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 90,
              sbp: 158,
              dbp: 86,
              rr: 20,
              spo2: 96,
              temp: 37.2,
              nihss: 22,
            ),
          ),
          ScenarioChoice(
            text:
                'B) MRI with DWI/PWI for perfusion mismatch assessment',
            isCorrect: false,
            consequence:
                'MRI takes 35 minutes. The patient is now 5 hours '
                '35 minutes from last known well. While MRI shows a '
                'large perfusion mismatch, the delay may impact '
                'outcomes.',
            explanation:
                'While MRI perfusion can provide valuable information '
                'about salvageable tissue, it should not delay '
                'emergent CTA in the acute setting. CTA is faster '
                '(< 5 minutes), widely available, and provides the '
                'critical information needed: is there an LVO amenable '
                'to thrombectomy? MRI perfusion (or CT perfusion) '
                'becomes important in the EXTENDED window (6-24 hours) '
                'where DAWN/DEFUSE-3 criteria are applied. In the '
                'standard window (< 6 hours), CTA + ASPECTS is '
                'sufficient for thrombectomy decision-making.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 94,
              sbp: 164,
              dbp: 90,
              rr: 20,
              spo2: 95,
              temp: 37.2,
              nihss: 23,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Carotid duplex ultrasound to evaluate for '
                'carotid stenosis',
            isCorrect: false,
            consequence:
                'The ultrasound shows no significant carotid stenosis '
                'but provides no information about the intracranial '
                'occlusion. Time is wasted on a test that does not '
                'change acute management.',
            explanation:
                'Carotid duplex is useful for secondary prevention '
                'workup but is NOT the appropriate emergent imaging '
                'study in acute stroke with suspected LVO. It cannot '
                'identify intracranial occlusions. CTA provides '
                'both extracranial and intracranial vascular imaging '
                'in a single rapid study. In the acute setting, every '
                'minute counts -- use the most informative test first.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 96,
              sbp: 168,
              dbp: 92,
              rr: 20,
              spo2: 95,
              temp: 37.2,
              nihss: 24,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Transcranial Doppler to assess MCA flow velocity',
            isCorrect: false,
            consequence:
                'TCD is operator-dependent and time-consuming. While '
                'it suggests absent left MCA flow, it cannot provide '
                'the anatomic detail needed for thrombectomy planning.',
            explanation:
                'Transcranial Doppler (TCD) can detect LVO with '
                'reasonable sensitivity but is operator-dependent, '
                'time-consuming, and insufficient for thrombectomy '
                'planning. It does not show collateral circulation, '
                'clot location, or tandem lesions. CTA is the gold '
                'standard for acute LVO diagnosis and procedural '
                'planning. TCD has a role in monitoring for vasospasm '
                '(SAH) and microembolic signals, not in acute stroke '
                'triage.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 94,
              sbp: 166,
              dbp: 90,
              rr: 20,
              spo2: 95,
              temp: 37.2,
              nihss: 23,
            ),
          ),
        ],
      ),

      // STEP 2 -- tPA + thrombectomy decision
      ScenarioStep(
        id: 'step_2',
        narrative:
            'CTA confirms a left M1 MCA occlusion. Your hospital does '
            'not have neurointerventional capabilities. The patient is '
            '5 hours from last known well. She is on no anticoagulants. '
            'What is the optimal management strategy?',
        vitals: VitalSigns(
          hr: 90,
          sbp: 158,
          dbp: 86,
          rr: 18,
          spo2: 96,
          temp: 37.1,
          nihss: 22,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) Start IV tPA immediately while arranging emergent '
                'transfer for thrombectomy (drip-and-ship)',
            isCorrect: true,
            consequence:
                'tPA bolus is given at 5 hours 10 minutes (within '
                '4.5 hour window from symptom onset -- wait, the '
                'patient is actually at 5 hours). The tPA is started '
                'while arranging transfer. She arrives at the '
                'comprehensive stroke center and undergoes successful '
                'thrombectomy at 6 hours 30 minutes.',
            explanation:
                'The drip-and-ship model is the standard approach when '
                'a primary stroke center identifies an LVO that '
                'requires thrombectomy at a comprehensive center. '
                'Important nuance: at 5 hours from onset, the patient '
                'is OUTSIDE the 4.5-hour tPA window. In this case, '
                'tPA should NOT be given (only the transfer for '
                'thrombectomy is appropriate). However, if onset had '
                'been < 4.5 hours, bridging tPA + thrombectomy is '
                'standard (IMS-III, SWIFT PRIME protocols). The '
                'thrombectomy window extends to 6 hours (standard) or '
                '24 hours (DAWN/DEFUSE-3 criteria). Transfer for EVT '
                'should never be delayed for tPA effect observation.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 86,
              sbp: 152,
              dbp: 82,
              rr: 18,
              spo2: 97,
              temp: 37.1,
              nihss: 20,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Give tPA only; 5 hours is too late for '
                'thrombectomy consideration',
            isCorrect: false,
            consequence:
                'tPA alone fails to recanalize the M1 occlusion. '
                'Moreover, the patient is actually at 5 hours -- '
                'beyond the 4.5-hour tPA window. The thrombectomy '
                'window extends to at least 6 hours.',
            explanation:
                'This answer contains two errors: (1) At 5 hours, '
                'the patient is OUTSIDE the 4.5-hour tPA window. '
                '(2) The thrombectomy window extends to at least '
                '6 hours for standard criteria (ASPECTS >= 6, '
                'NIHSS >= 6, proximal LVO) and up to 24 hours '
                'with perfusion imaging selection (DAWN/DEFUSE-3). '
                'Thrombectomy is actually the MORE important '
                'intervention here, not less. IV tPA recanalization '
                'rates for M1 occlusions are only 10-30%, while '
                'thrombectomy achieves TICI 2b/3 in 70-90% of cases.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 92,
              sbp: 162,
              dbp: 88,
              rr: 20,
              spo2: 95,
              temp: 37.2,
              nihss: 22,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Administer IV tPA and monitor for improvement; '
                'only transfer if no improvement in 2 hours',
            isCorrect: false,
            consequence:
                'After 2 hours of observation, the patient shows '
                'minimal improvement (NIHSS 20). By now she is 7 hours '
                'from onset. Transfer is initiated but the standard '
                'thrombectomy window has closed.',
            explanation:
                'Waiting to assess tPA response before initiating '
                'thrombectomy transfer is a CRITICAL ERROR. AHA/ASA '
                'guidelines explicitly state: "EVT should not be '
                'delayed to assess clinical response to IV alteplase." '
                'Transfer for thrombectomy should occur simultaneously '
                'with or immediately after tPA administration. The '
                '2-hour delay in this scenario pushes the patient '
                'beyond the 6-hour standard window, potentially '
                'denying her a life-changing intervention.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 94,
              sbp: 166,
              dbp: 92,
              rr: 20,
              spo2: 95,
              temp: 37.3,
              nihss: 20,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Skip tPA entirely and arrange immediate transfer '
                'for thrombectomy alone',
            isCorrect: false,
            consequence:
                'The patient is transferred directly for thrombectomy. '
                'This is actually the most appropriate approach given '
                'she is beyond the 4.5-hour tPA window at 5 hours '
                'from onset.',
            explanation:
                'This is actually a reasonable answer given the '
                'timeline. At 5 hours from onset, the patient IS '
                'outside the 4.5-hour tPA window, so skipping tPA '
                'and proceeding directly to thrombectomy transfer is '
                'appropriate. However, the ideal answer recognizes '
                'that if tPA were still eligible (< 4.5 hours), it '
                'should be given as a bridge. The key teaching point: '
                'always calculate time windows carefully. Board pearl: '
                'tPA window = 4.5 hours; thrombectomy standard = '
                '6 hours; thrombectomy extended = up to 24 hours with '
                'perfusion selection.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 88,
              sbp: 156,
              dbp: 84,
              rr: 18,
              spo2: 96,
              temp: 37.1,
              nihss: 22,
            ),
          ),
        ],
      ),

      // STEP 3 -- Extended window consideration
      ScenarioStep(
        id: 'step_3',
        narrative:
            'The patient arrives at the comprehensive stroke center. '
            'The neurointerventionalist asks about perfusion imaging '
            'criteria. It is now 6 hours from symptom onset. CT '
            'perfusion is performed. Which criteria determine '
            'thrombectomy eligibility in the 6-24 hour window?',
        vitals: VitalSigns(
          hr: 88,
          sbp: 154,
          dbp: 84,
          rr: 18,
          spo2: 97,
          temp: 37.1,
          nihss: 21,
        ),
        imagingFinding:
            'CTP: Ischemic core volume 18 mL. Penumbra volume 120 mL. '
            'Mismatch ratio 6.7:1. Tmax > 6 seconds volume: 102 mL.',
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) DAWN and DEFUSE-3 criteria: clinical-imaging '
                'mismatch (small core relative to deficit severity) '
                'with favorable perfusion profile',
            isCorrect: true,
            consequence:
                'The patient meets both DAWN and DEFUSE-3 criteria '
                'with a small ischemic core (18 mL) relative to her '
                'severe clinical deficit (NIHSS 21) and large penumbra. '
                'Thrombectomy proceeds with successful TICI 3 '
                'recanalization.',
            explanation:
                'DAWN trial (2018): 6-24 hours, used clinical-imaging '
                'mismatch. Criteria: (1) Age >= 80: NIHSS >= 10, core '
                '< 21 mL. (2) Age < 80: NIHSS >= 10, core < 31 mL, '
                'OR NIHSS >= 20, core < 51 mL. DEFUSE-3 trial (2018): '
                '6-16 hours, used perfusion imaging mismatch. Criteria: '
                'Core < 70 mL, mismatch ratio >= 1.8, penumbra >= '
                '15 mL. This patient (age 58, NIHSS 21, core 18 mL, '
                'mismatch ratio 6.7) meets BOTH sets of criteria. '
                'These trials showed NNT of ~2-3 for improved '
                'functional outcome, making thrombectomy one of the '
                'most effective interventions in medicine.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 146,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'B) ASPECTS score alone determines eligibility in '
                'the extended window',
            isCorrect: false,
            consequence:
                'Using ASPECTS alone, the patient would be borderline '
                '(ASPECTS 7). Without perfusion-based selection, the '
                'neurointerventionalist is uncertain about proceeding '
                'and delays the case for further discussion.',
            explanation:
                'ASPECTS is used in the STANDARD window (< 6 hours) '
                'where a threshold of >= 6 was used in most trials. '
                'In the EXTENDED window (6-24 hours), perfusion '
                'imaging or clinical-imaging mismatch criteria (DAWN/'
                'DEFUSE-3) are required. ASPECTS alone does not '
                'capture the dynamic balance between infarcted core '
                'and salvageable penumbra that determines who will '
                'benefit from late thrombectomy. Patients with '
                'favorable perfusion profiles can benefit even with '
                'moderate ASPECTS scores.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 90,
              sbp: 158,
              dbp: 86,
              rr: 18,
              spo2: 96,
              temp: 37.1,
              nihss: 21,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Any patient with an LVO within 24 hours is '
                'eligible regardless of imaging',
            isCorrect: false,
            consequence:
                'This overly broad criterion would include patients '
                'with large completed infarcts who would not benefit '
                'and could be harmed by thrombectomy (reperfusion '
                'injury, hemorrhagic transformation).',
            explanation:
                'Thrombectomy in the extended window is NOT appropriate '
                'for all LVO patients. The DAWN and DEFUSE-3 trials '
                'used strict imaging criteria because patients with '
                'large completed infarcts (large core volumes) do not '
                'benefit and may be harmed. The key concept is '
                '"target mismatch" -- a small infarct core with a '
                'large ischemic penumbra that can be salvaged by '
                'recanalization. Without this mismatch, reperfusion '
                'can cause hemorrhagic transformation of already-'
                'infarcted tissue.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 90,
              sbp: 158,
              dbp: 86,
              rr: 18,
              spo2: 96,
              temp: 37.1,
              nihss: 21,
            ),
          ),
          ScenarioChoice(
            text:
                'D) The 6-hour window is absolute; no thrombectomy '
                'should be performed after 6 hours',
            isCorrect: false,
            consequence:
                'The case is declined. The patient is managed '
                'conservatively and develops a large MCA infarct with '
                'dense right hemiplegia and global aphasia. She '
                'requires nursing home care at discharge.',
            explanation:
                'The 6-hour window is the STANDARD window from the '
                'initial thrombectomy trials, but DAWN (2018) and '
                'DEFUSE-3 (2018) extended thrombectomy eligibility to '
                '24 hours and 16 hours respectively, using perfusion-'
                'based patient selection. These were landmark trials '
                'that changed practice worldwide. Refusing thrombectomy '
                'after 6 hours in an eligible patient is a critical '
                'error that denies a highly effective treatment. This '
                'is a must-know for board exams.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 88,
              sbp: 156,
              dbp: 84,
              rr: 18,
              spo2: 96,
              temp: 37.2,
              nihss: 22,
            ),
          ),
        ],
      ),

      // STEP 4 -- Post-thrombectomy management
      ScenarioStep(
        id: 'step_4',
        narrative:
            'Thrombectomy is successful with TICI 2b recanalization. '
            'The patient is in the neuro-ICU. NIHSS has improved to 10. '
            'Six hours post-procedure, her BP is 172/94. She is known '
            'to have atrial fibrillation. When should anticoagulation '
            'be initiated?',
        vitals: VitalSigns(
          hr: 84,
          sbp: 172,
          dbp: 94,
          rr: 16,
          spo2: 98,
          temp: 37.0,
          nihss: 10,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Start DOAC in 4-14 days based on infarct size and '
                'hemorrhagic risk assessment',
            isCorrect: true,
            consequence:
                'You plan to initiate apixaban at day 7, pending a '
                'follow-up CT at 48 hours to rule out hemorrhagic '
                'transformation. The patient is bridged with aspirin '
                'until DOAC initiation.',
            explanation:
                'For AF-related stroke, DOACs are preferred over '
                'warfarin (RE-LY, ROCKET-AF, ARISTOTLE, ENGAGE-AF '
                'trials). Timing of initiation depends on infarct '
                'size and hemorrhage risk: (1) TIA/small infarct: '
                '1-3 days, (2) Moderate infarct: 4-7 days, '
                '(3) Large infarct: 7-14 days. The "1-3-6-12 rule" '
                'is a common heuristic. A follow-up CT to exclude '
                'hemorrhagic transformation should be obtained before '
                'starting anticoagulation. Aspirin can be used as a '
                'bridge. Board pearl: DOACs are first-line for non-'
                'valvular AF stroke prevention; warfarin is reserved '
                'for mechanical valves and severe mitral stenosis.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 80,
              sbp: 148,
              dbp: 82,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Start heparin drip immediately to prevent '
                'recurrent cardioembolism',
            isCorrect: false,
            consequence:
                'Heparin is started 6 hours after thrombectomy. At '
                '18 hours, the patient develops headache and '
                'neurological decline. CT shows hemorrhagic '
                'transformation of the infarct.',
            explanation:
                'Immediate full-dose anticoagulation after '
                'thrombectomy for a moderate-to-large infarct carries '
                'a high risk of hemorrhagic transformation. Multiple '
                'studies have shown that early anticoagulation (< 48 '
                'hours) after moderate-to-large ischemic stroke does '
                'NOT reduce recurrent stroke but DOES increase '
                'hemorrhagic complications. The EAFT trial and '
                'subsequent guidelines recommend waiting at least '
                '4-14 days based on infarct size.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 62,
              sbp: 188,
              dbp: 102,
              rr: 14,
              spo2: 96,
              temp: 37.0,
              nihss: 16,
            ),
          ),
          ScenarioChoice(
            text:
                'C) No anticoagulation; treat with aspirin and '
                'clopidogrel long-term for AF',
            isCorrect: false,
            consequence:
                'The patient is discharged on dual antiplatelet therapy '
                'alone. Six weeks later, she presents with a recurrent '
                'cardioembolic stroke to the right MCA territory.',
            explanation:
                'Antiplatelet therapy is INFERIOR to anticoagulation '
                'for preventing cardioembolism in atrial fibrillation. '
                'The ACTIVE-W trial showed that aspirin + clopidogrel '
                'was inferior to warfarin for AF stroke prevention, '
                'and DOACs are even more effective. CHA2DS2-VASc '
                'score for this patient (58F, HTN, DM, prior stroke) '
                'is at least 6, placing her at very high risk. '
                'Anticoagulation is essential -- the only question is '
                'timing (delayed initiation based on infarct size).',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 82,
              sbp: 154,
              dbp: 86,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Place a left atrial appendage closure device '
                'during this hospitalization',
            isCorrect: false,
            consequence:
                'Interventional cardiology is consulted for LAAC '
                'during the acute stroke hospitalization. This is '
                'premature and does not address the immediate need '
                'for anticoagulation.',
            explanation:
                'Left atrial appendage closure (LAAC, e.g., Watchman '
                'device) is an option for patients with non-valvular '
                'AF who have contraindications to long-term '
                'anticoagulation (PROTECT-AF, PREVAIL trials). However, '
                'it is NOT a first-line treatment, is not appropriate '
                'during acute stroke hospitalization, and still '
                'requires anticoagulation for 45 days post-implant '
                'followed by DAPT. The priority is timely initiation '
                'of oral anticoagulation for secondary prevention.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 84,
              sbp: 156,
              dbp: 88,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 10,
            ),
          ),
        ],
      ),

      // STEP 5 -- Rehab disposition
      ScenarioStep(
        id: 'step_5',
        narrative:
            'The patient is medically stable on hospital day 5. NIHSS '
            'has improved to 8. She has R hemiparesis (4/5 arm, 4+/5 '
            'leg), mild expressive aphasia, and requires moderate '
            'assist for transfers and ADLs. What is the most '
            'appropriate discharge disposition?',
        vitals: VitalSigns(
          hr: 76,
          sbp: 138,
          dbp: 78,
          rr: 16,
          spo2: 99,
          temp: 36.9,
          nihss: 8,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Inpatient rehabilitation facility (IRF) -- she '
                'can tolerate 3 hours of therapy daily and has good '
                'recovery potential',
            isCorrect: true,
            consequence:
                'The patient is transferred to IRF where she receives '
                'intensive PT, OT, and speech therapy. At 3 weeks, '
                'she is ambulating with a cane, dressing independently, '
                'and communicating effectively with mild word-finding '
                'difficulty.',
            explanation:
                'IRF is appropriate when: (1) The patient can '
                'tolerate >= 3 hours of therapy daily (the "3-hour '
                'rule"), (2) Requires 2+ therapy disciplines, '
                '(3) Needs physician-directed rehabilitation, '
                '(4) Has realistic functional goals. This patient '
                'meets all criteria. Evidence shows that early, '
                'intensive rehabilitation after stroke improves '
                'functional outcomes (AVERT trial nuance: early '
                'mobilization is beneficial but very early aggressive '
                'mobilization within 24 hours may not be). The '
                'optimal window for initiating intensive rehab is '
                '24-48 hours after medical stabilization. FIM scores '
                'and functional trajectory should guide disposition.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 136,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Skilled nursing facility (SNF) for a slower pace '
                'of rehabilitation',
            isCorrect: false,
            consequence:
                'At SNF, the patient receives only 1 hour of therapy '
                'daily. Recovery is slower, and she develops '
                'deconditioning and depression.',
            explanation:
                'SNF rehabilitation provides lower intensity therapy '
                '(typically 1-2 hours/day) and is appropriate for '
                'patients who cannot tolerate the 3-hour daily '
                'therapy requirement of IRF, or who have significant '
                'medical comorbidities requiring nursing care. This '
                'patient is medically stable and has moderate deficits '
                'with good recovery potential -- she would benefit '
                'more from the intensive IRF setting. Studies '
                'consistently show better functional outcomes with '
                'IRF vs SNF for eligible stroke patients.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 140,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 36.9,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Home with outpatient therapy 3 times per week',
            isCorrect: false,
            consequence:
                'The patient goes home but falls attempting to '
                'transfer independently on day 2. She sustains a hip '
                'fracture requiring surgical fixation and prolonged '
                'immobilization.',
            explanation:
                'Home discharge is premature for a patient requiring '
                'moderate assist for transfers and ADLs. Outpatient '
                'therapy (3x/week) provides insufficient intensity '
                'for the level of deficit and introduces significant '
                'safety risks (falls, caregiver burden). Home '
                'discharge after stroke is appropriate when the '
                'patient is independent or requires only minimal '
                'assist with a capable caregiver. This patient needs '
                'structured inpatient rehabilitation.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 140,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 36.9,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Keep in the acute hospital for another week of '
                'therapy before disposition',
            isCorrect: false,
            consequence:
                'Extended acute hospital stay provides suboptimal '
                'rehabilitation intensity and increases risks of '
                'nosocomial complications (DVT, hospital-acquired '
                'infections, deconditioning).',
            explanation:
                'Once a stroke patient is medically stable, prolonged '
                'acute hospital stays are harmful. Acute hospitals '
                'are not optimized for rehabilitation -- therapy '
                'intensity is limited, the environment is not '
                'conducive to functional recovery, and exposure to '
                'nosocomial pathogens increases. Early transfer to '
                'rehabilitation (within 7 days of stroke for eligible '
                'patients) is associated with better outcomes. Length '
                'of stay metrics and CMS guidelines also discourage '
                'unnecessary acute hospitalization when rehab '
                'transfer is appropriate.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 142,
              dbp: 80,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              nihss: 8,
            ),
          ),
        ],
      ),
    ],
  );

  // ════════════════════════════════════════════════════════════
  // SCENARIO 3 -- ICH Management
  // ════════════════════════════════════════════════════════════

  static const ClinicalScenario ichManagement = ClinicalScenario(
    id: 'ich_management_01',
    title: 'Intracerebral Hemorrhage: Anticoagulant Reversal',
    patientSummary:
        '65M on warfarin (AF, INR 3.2), sudden severe headache and R '
        'hemiparesis onset 1 hour ago. CT: L basal ganglia ICH, '
        '40 mL. GCS 12.',
    difficulty: 'Advanced',
    moduleId: 'hemorrhagic_stroke',
    steps: [
      // STEP 1 -- Reversal agent
      ScenarioStep(
        id: 'step_1',
        narrative:
            'A 65-year-old man on warfarin for atrial fibrillation '
            'presents with sudden headache, right hemiparesis, and '
            'dysarthria. CT shows a 40 mL left basal ganglia ICH with '
            '3 mm midline shift. INR is 3.2. GCS is 12. What is the '
            'immediate priority for anticoagulant reversal?',
        vitals: VitalSigns(
          hr: 68,
          sbp: 198,
          dbp: 108,
          rr: 18,
          spo2: 97,
          temp: 37.0,
          gcs: 12,
        ),
        imagingFinding:
            'NCCT Head: Left basal ganglia hemorrhage, 40 mL volume '
            '(ABC/2 method). 3 mm rightward midline shift. Mild '
            'surrounding edema. Intraventricular extension into left '
            'lateral ventricle.',
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) 4-factor PCC (Kcentra) 25-50 units/kg IV + '
                'Vitamin K 10 mg IV',
            isCorrect: true,
            consequence:
                'You administer 4-factor PCC based on INR (50 units/kg '
                'for INR > 3). Vitamin K 10 mg IV is given '
                'simultaneously. INR corrects to 1.3 within 15 minutes. '
                'Repeat CT at 6 hours shows stable hematoma size.',
            explanation:
                'For warfarin-associated ICH, AHA/ASA guidelines '
                'recommend emergent reversal with 4-factor PCC '
                '(prothrombin complex concentrate) + IV vitamin K. '
                'PCC provides immediate INR correction (within '
                '15-30 minutes) by replacing vitamin K-dependent '
                'clotting factors (II, VII, IX, X). Vitamin K is '
                'essential because PCC effect is temporary (6-8 hours) '
                'while vitamin K provides sustained correction. Dosing: '
                'INR 2-4: 25 units/kg; INR 4-6: 35 units/kg; '
                'INR > 6: 50 units/kg. Target INR < 1.3. FFP is no '
                'longer first-line due to volume, time to infuse, and '
                'incomplete correction.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 66,
              sbp: 192,
              dbp: 104,
              rr: 18,
              spo2: 97,
              temp: 37.0,
              gcs: 12,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Fresh frozen plasma (FFP) 4 units IV as first-line '
                'reversal',
            isCorrect: false,
            consequence:
                'FFP is ordered but requires thawing (30 min), type '
                'and screen, and slow infusion. By the time 4 units '
                'are infused (2+ hours), the hematoma has expanded to '
                '55 mL with worsening midline shift.',
            explanation:
                'FFP was the traditional warfarin reversal agent but '
                'has significant disadvantages compared to PCC: '
                '(1) Requires blood typing and thawing (30-60 min '
                'delay), (2) Large volume (1 L+ for 4 units) risking '
                'volume overload, (3) Slow infusion time, '
                '(4) Incomplete INR correction in many cases. The '
                'INCH trial (2016) showed that PCC was superior to '
                'FFP for INR normalization and hematoma expansion '
                'prevention in warfarin-ICH. AHA/ASA 2022 guidelines '
                'recommend PCC over FFP as first-line. Board pearl: '
                'PCC > FFP for warfarin reversal in ICH.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 62,
              sbp: 204,
              dbp: 112,
              rr: 16,
              spo2: 96,
              temp: 37.1,
              gcs: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Idarucizumab (Praxbind) 5 g IV',
            isCorrect: false,
            consequence:
                'Idarucizumab is administered but has no effect -- it '
                'is a specific reversal agent for dabigatran, not '
                'warfarin. The INR remains 3.2 and the hematoma '
                'continues to expand.',
            explanation:
                'Idarucizumab (Praxbind) is the specific reversal '
                'agent for DABIGATRAN (Pradaxa) only. It is a '
                'monoclonal antibody fragment that binds dabigatran '
                'with high affinity. It has NO effect on warfarin, '
                'factor Xa inhibitors, or other anticoagulants. Know '
                'your reversal agents: Warfarin -> PCC + Vitamin K; '
                'Dabigatran -> Idarucizumab; Factor Xa inhibitors '
                '(rivaroxaban, apixaban, edoxaban) -> Andexanet alfa '
                '(Andexxa) or PCC if andexanet unavailable.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 64,
              sbp: 200,
              dbp: 110,
              rr: 18,
              spo2: 96,
              temp: 37.0,
              gcs: 11,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Vitamin K 10 mg IV alone; wait for INR correction',
            isCorrect: false,
            consequence:
                'Vitamin K IV is given but takes 6-12 hours for full '
                'effect. During this delay, the hematoma expands to '
                '60 mL. The patient deteriorates to GCS 8 and requires '
                'intubation.',
            explanation:
                'Vitamin K alone is TOO SLOW for emergent reversal in '
                'ICH. IV vitamin K takes 6-12 hours for meaningful INR '
                'correction because it must be synthesized into new '
                'clotting factors by the liver. While vitamin K is a '
                'necessary component of warfarin reversal (for '
                'sustained effect), it must be paired with PCC for '
                'immediate correction. Hematoma expansion occurs in '
                '~30% of ICH patients in the first 6 hours and is '
                'the most important modifiable predictor of outcome. '
                'Every minute of continued coagulopathy increases '
                'expansion risk.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 58,
              sbp: 208,
              dbp: 114,
              rr: 14,
              spo2: 95,
              temp: 37.0,
              gcs: 8,
            ),
          ),
        ],
      ),

      // STEP 2 -- Blood pressure target
      ScenarioStep(
        id: 'step_2',
        narrative:
            'Anticoagulation has been addressed. The patient\'s blood '
            'pressure is 198/108. Current guidelines recommend acute BP '
            'lowering in ICH. What is the target?',
        vitals: VitalSigns(
          hr: 66,
          sbp: 198,
          dbp: 108,
          rr: 18,
          spo2: 97,
          temp: 37.0,
          gcs: 12,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) Target SBP < 140 mmHg within 1 hour using IV '
                'nicardipine or clevidipine',
            isCorrect: true,
            consequence:
                'Nicardipine drip is started at 5 mg/hr and titrated '
                'to SBP 130-140. BP reaches target within 45 minutes. '
                'The patient remains neurologically stable.',
            explanation:
                'The INTERACT2 trial (2013) and AHA/ASA 2022 ICH '
                'guidelines recommend targeting SBP < 140 mmHg for '
                'ICH patients presenting with SBP 150-220 who can be '
                'treated within 2 hours of onset. This was shown to '
                'be safe and may improve functional outcomes. '
                'ATACH-2 (2016) showed that targeting SBP 110-139 did '
                'not improve outcomes over 140-179 and had more renal '
                'adverse events, suggesting the "sweet spot" is around '
                '130-140. Preferred agents: nicardipine (predictable, '
                'titratable), clevidipine, or labetalol. Avoid '
                'nitroprusside (raises ICP).',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 138,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              gcs: 12,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Target SBP < 180 mmHg; more aggressive lowering '
                'increases risk of ischemia',
            isCorrect: false,
            consequence:
                'SBP is maintained at 170-180. Repeat CT at 6 hours '
                'shows hematoma expansion from 40 to 52 mL. The '
                'patient develops worsening hemiparesis.',
            explanation:
                'SBP < 180 was the older, more conservative target. '
                'Current evidence from INTERACT2 supports more '
                'aggressive lowering to < 140 mmHg for ICH patients '
                'presenting with SBP 150-220. The concern about '
                'perihematomal ischemia with lower BP targets has not '
                'been supported by imaging studies -- the '
                'perihematomal hypoperfusion is related to edema '
                'and metabolic suppression, not ischemia. More '
                'aggressive BP control reduces hematoma expansion, '
                'which is the primary goal.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 172,
              dbp: 94,
              rr: 18,
              spo2: 97,
              temp: 37.0,
              gcs: 11,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Target SBP < 110 mmHg for maximal hematoma '
                'stability',
            isCorrect: false,
            consequence:
                'Aggressive lowering drops SBP to 108. The patient '
                'develops acute kidney injury (creatinine doubles) and '
                'worsening neurological status from hypoperfusion.',
            explanation:
                'SBP < 110 is TOO aggressive. ATACH-2 showed that '
                'targeting SBP 110-139 vs 140-179 did not improve '
                'outcomes and caused more renal adverse events. The '
                'optimal target appears to be SBP 130-140 mmHg. '
                'Excessive BP lowering in the setting of ICH can '
                'impair renal perfusion, worsen cardiac output, and '
                'potentially reduce cerebral perfusion to brain '
                'regions dependent on collateral flow.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 96,
              sbp: 108,
              dbp: 62,
              rr: 20,
              spo2: 96,
              temp: 37.0,
              gcs: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Do not lower BP; it will normalize once the '
                'hematoma stabilizes',
            isCorrect: false,
            consequence:
                'BP remains at 198/108. Over the next 6 hours the '
                'hematoma expands to 65 mL with increasing midline '
                'shift and clinical deterioration.',
            explanation:
                'Leaving hypertension untreated in acute ICH is '
                'dangerous. Elevated BP is the strongest predictor '
                'of hematoma expansion, which occurs in ~30% of '
                'patients and is the most modifiable risk factor for '
                'poor outcome. AHA/ASA guidelines provide clear '
                'recommendations for acute BP lowering. The Cushing '
                'response (hypertension + bradycardia) seen with '
                'intracranial hypertension should not be confused '
                'with benign reactive hypertension -- both require '
                'treatment.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 58,
              sbp: 212,
              dbp: 116,
              rr: 16,
              spo2: 95,
              temp: 37.1,
              gcs: 9,
            ),
          ),
        ],
      ),

      // STEP 3 -- IVH and hydrocephalus
      ScenarioStep(
        id: 'step_3',
        narrative:
            'Six hours later, the patient becomes more somnolent '
            '(GCS drops to 9). Repeat CT shows the hematoma is stable '
            'but there is now obstructive hydrocephalus from '
            'intraventricular extension. What is the appropriate '
            'intervention?',
        vitals: VitalSigns(
          hr: 56,
          sbp: 178,
          dbp: 96,
          rr: 14,
          spo2: 96,
          temp: 37.2,
          gcs: 9,
        ),
        imagingFinding:
            'Repeat CT: Stable left basal ganglia hematoma (40 mL). '
            'New bilateral ventriculomegaly with temporal horn '
            'dilation. Blood layering in 3rd and 4th ventricles. '
            'Periventricular transependymal edema.',
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) Emergent external ventricular drain (EVD) '
                'placement for CSF diversion',
            isCorrect: true,
            consequence:
                'EVD is placed by neurosurgery. Opening pressure is '
                '28 cmH2O. CSF drainage is initiated. GCS improves '
                'to 11 within 2 hours as hydrocephalus resolves.',
            explanation:
                'Obstructive hydrocephalus from IVH is a common '
                'and life-threatening complication of ICH, occurring '
                'in ~40% of ICH patients with IVH. EVD placement '
                'provides immediate CSF diversion and ICP monitoring. '
                'AHA/ASA guidelines recommend EVD for patients with '
                'decreased level of consciousness attributed to '
                'hydrocephalus. The CLEAR III trial studied '
                'intraventricular alteplase via EVD for clot '
                'clearance -- it showed faster clot resolution and '
                'reduced mortality in a subgroup analysis but did not '
                'meet the primary endpoint of improved functional '
                'outcome.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 156,
              dbp: 86,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              gcs: 11,
            ),
          ),
          ScenarioChoice(
            text:
                'B) IV mannitol for cerebral edema and ICP reduction',
            isCorrect: false,
            consequence:
                'Mannitol provides transient improvement but does not '
                'address the mechanical obstruction. The hydrocephalus '
                'persists and the patient continues to deteriorate.',
            explanation:
                'Mannitol reduces ICP from parenchymal edema but '
                'does NOT treat obstructive hydrocephalus. The '
                'obstruction is from blood blocking CSF flow through '
                'the ventricular system. Only CSF diversion (EVD) '
                'can address this. Osmotic therapy may be used as a '
                'temporizing measure while preparing for EVD but '
                'should not substitute for definitive treatment. '
                'Board pearl: distinguish between cytotoxic edema, '
                'vasogenic edema, and obstructive hydrocephalus -- '
                'each has different treatment.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 58,
              sbp: 172,
              dbp: 92,
              rr: 14,
              spo2: 96,
              temp: 37.1,
              gcs: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Lumbar puncture for CSF drainage',
            isCorrect: false,
            consequence:
                'Lumbar puncture is performed. The patient rapidly '
                'deteriorates as the transtentorial pressure gradient '
                'worsens, causing downward herniation.',
            explanation:
                'Lumbar puncture with OBSTRUCTIVE hydrocephalus and a '
                'supratentorial mass (ICH) is CONTRAINDICATED. '
                'Removing CSF from below the tentorium while there is '
                'a supratentorial pressure gradient can precipitate '
                'transtentorial (uncal) herniation -- identical to '
                'the mechanism in TBI. The correct CSF diversion is '
                'from ABOVE the obstruction via EVD. This is a '
                'critical safety concept tested on boards.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 42,
              sbp: 202,
              dbp: 108,
              rr: 8,
              spo2: 92,
              temp: 37.2,
              gcs: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Emergent surgical evacuation of the hematoma',
            isCorrect: false,
            consequence:
                'Neurosurgery takes the patient for craniotomy and '
                'clot evacuation. While the hematoma is removed, this '
                'is a more invasive intervention than what is needed '
                'for the acute hydrocephalus.',
            explanation:
                'Surgical evacuation of spontaneous supratentorial ICH '
                'remains controversial. The STICH and STICH-II trials '
                'showed no clear benefit for early surgery vs initial '
                'conservative treatment for most supratentorial ICH. '
                'The MISTIE III trial of minimally invasive surgery '
                'showed potential benefit in a subgroup with residual '
                'clot < 15 mL. For this patient, the acute '
                'deterioration is from hydrocephalus, which is best '
                'treated with EVD rather than a major craniotomy. '
                'Surgery may be considered later if the hematoma '
                'expands or the patient deteriorates despite EVD.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 148,
              dbp: 82,
              rr: 14,
              spo2: 97,
              temp: 36.8,
              gcs: 10,
            ),
          ),
        ],
      ),

      // STEP 4 -- Prognostication and goals of care
      ScenarioStep(
        id: 'step_4',
        narrative:
            'The EVD is functioning well and the patient has stabilized '
            '(GCS 11). The family asks about prognosis. The ICH Score '
            'components are: GCS 3-4 = 2 points, 5-12 = 1, 13-15 = 0; '
            'ICH volume >= 30 mL = 1; IVH present = 1; Infratentorial '
            'origin = 1; Age >= 80 = 1. What is this patient\'s ICH '
            'Score and expected 30-day mortality?',
        vitals: VitalSigns(
          hr: 70,
          sbp: 142,
          dbp: 78,
          rr: 16,
          spo2: 98,
          temp: 37.0,
          gcs: 11,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) ICH Score 3 (GCS 5-12 = 1, volume >= 30 = 1, '
                'IVH = 1, not infratentorial, age < 80); '
                '30-day mortality ~72%',
            isCorrect: true,
            consequence:
                'You accurately calculate the ICH Score and discuss '
                'prognosis with the family while cautioning against '
                'early withdrawal of care. The family opts for full '
                'treatment. At 2 weeks, the patient has improved to '
                'GCS 14.',
            explanation:
                'The ICH Score (Hemphill et al., 2001) is the most '
                'widely used prognostic tool for ICH. This patient: '
                'GCS 11 (5-12 range) = 1 point; ICH volume 40 mL '
                '(>= 30) = 1 point; IVH present = 1 point; '
                'Supratentorial = 0 points; Age 65 (< 80) = 0 points. '
                'Total = 3. Published mortality rates: 0 = 0%, 1 = 13%, '
                '2 = 26%, 3 = 72%, 4 = 97%, 5 = 100%. IMPORTANT: '
                'these mortality rates include withdrawal of care '
                '(WLST), which creates a self-fulfilling prophecy. '
                'AHA/ASA guidelines recommend avoiding DNRCC/withdrawal '
                'decisions within the first 24-48 hours due to this '
                'bias.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 140,
              dbp: 76,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              gcs: 11,
            ),
          ),
          ScenarioChoice(
            text:
                'B) ICH Score 1; low mortality expected; full '
                'recovery likely',
            isCorrect: false,
            consequence:
                'You underestimate the severity. The family is given '
                'overly optimistic expectations. When the patient '
                'develops complications, the family is unprepared and '
                'trust is damaged.',
            explanation:
                'ICH Score 1 would require only 1 point, which would '
                'mean either GCS 5-12 OR volume >= 30 OR IVH, but '
                'this patient has ALL THREE. Underestimating severity '
                'leads to poor communication and unrealistic family '
                'expectations. Accurate prognostication is a critical '
                'clinical skill. The ICH Score is straightforward to '
                'calculate and should be documented in the chart.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 142,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              gcs: 11,
            ),
          ),
          ScenarioChoice(
            text:
                'C) ICH Score 5; recommend comfort measures given '
                'dismal prognosis',
            isCorrect: false,
            consequence:
                'Based on an overestimated ICH Score, you recommend '
                'comfort measures. The family agrees. Had treatment '
                'continued, the patient may have survived with moderate '
                'disability.',
            explanation:
                'ICH Score 5 would require: GCS 3-4 (2 pts), volume '
                '>= 30 (1), IVH (1), and either infratentorial origin '
                'or age >= 80 (1). This patient scores only 3. '
                'Over-estimating severity and recommending early '
                'withdrawal of care is a recognized contributor to '
                'poor outcomes in ICH -- the "self-fulfilling '
                'prophecy" of nihilistic prognostication. AHA/ASA '
                'guidelines explicitly warn against early WLST '
                'decisions and advocate for aggressive early '
                'treatment regardless of initial severity.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 142,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              gcs: 11,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Prognostic tools are unreliable; just tell the '
                'family to wait and see',
            isCorrect: false,
            consequence:
                'The family feels uninformed and anxious. Without '
                'prognostic context, they cannot make informed '
                'decisions about goals of care.',
            explanation:
                'While no prognostic tool is perfect, the ICH Score '
                'and other validated tools (FUNC score for functional '
                'outcome, max-ICH) provide useful frameworks for '
                'family counseling. Dismissing prognostic tools leaves '
                'families without the information they need for '
                'informed decision-making. The correct approach: '
                'share prognosis honestly with caveats about '
                'uncertainty, self-fulfilling prophecy of WLST, and '
                'the potential for improvement over weeks to months.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 142,
              dbp: 78,
              rr: 16,
              spo2: 98,
              temp: 37.0,
              gcs: 11,
            ),
          ),
        ],
      ),

      // STEP 5 -- Long-term anticoagulation decision
      ScenarioStep(
        id: 'step_5',
        narrative:
            'The patient recovers well over 2 weeks. GCS is 15, NIHSS '
            '4. He still has atrial fibrillation with a CHA2DS2-VASc '
            'score of 5 (age, HTN, DM, prior stroke, male). His '
            'HAS-BLED score is 3. When and how should anticoagulation '
            'be restarted?',
        vitals: VitalSigns(
          hr: 78,
          sbp: 132,
          dbp: 76,
          rr: 14,
          spo2: 99,
          temp: 36.9,
          gcs: 15,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Restart anticoagulation with a DOAC at 4-8 weeks, '
                'after repeat imaging confirms hematoma resolution and '
                'thorough risk-benefit discussion',
            isCorrect: true,
            consequence:
                'At 6 weeks, repeat CT shows resolved hematoma. After '
                'a detailed discussion of ischemic vs hemorrhagic risk, '
                'apixaban 5 mg BID is started. At 1 year, no recurrent '
                'stroke or hemorrhage.',
            explanation:
                'Restarting anticoagulation after ICH is one of the '
                'most debated topics in stroke medicine. Current '
                'evidence (SoSTART trial, observational data) suggests '
                'that restarting anticoagulation after 4-8 weeks in '
                'patients with high thromboembolic risk (CHA2DS2-VASc '
                '>= 4) and acceptable hemorrhage risk may reduce net '
                'adverse events. DOACs are preferred over warfarin '
                'due to lower ICH rates (~50% reduction). The decision '
                'must be individualized: location of ICH (lobar = '
                'higher rebleed risk, suggestive of amyloid angiopathy; '
                'deep/basal ganglia = hypertensive, lower rebleed '
                'risk), thromboembolic risk, and patient preferences.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 130,
              dbp: 74,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              gcs: 15,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Never restart anticoagulation; the ICH risk is '
                'too high',
            isCorrect: false,
            consequence:
                'Anticoagulation is permanently withheld. Three months '
                'later, the patient has a massive cardioembolic stroke '
                'to the right MCA territory, resulting in severe '
                'disability.',
            explanation:
                'Permanently withholding anticoagulation in a patient '
                'with CHA2DS2-VASc 5 carries a very high risk of '
                'recurrent ischemic stroke (~8-10% per year). '
                'Observational studies show that NOT restarting '
                'anticoagulation after ICH is associated with higher '
                'mortality from ischemic events. The balance of risk '
                'favors anticoagulation resumption in most patients '
                'with high CHA2DS2-VASc scores, especially with deep '
                '(non-lobar) ICH and controlled hypertension. '
                'Left atrial appendage closure may be considered for '
                'patients truly unable to tolerate anticoagulation.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              gcs: 15,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Restart warfarin immediately at discharge with '
                'INR target 2-3',
            isCorrect: false,
            consequence:
                'Warfarin is restarted at 2 weeks. One week later, the '
                'patient develops recurrent hemorrhage in the same '
                'location as INR becomes supratherapeutic.',
            explanation:
                'Restarting anticoagulation too early (< 4 weeks) '
                'after ICH is associated with a high risk of recurrent '
                'hemorrhage. The hematoma cavity is still resolving, '
                'and the perihematomal tissue is fragile. Additionally, '
                'warfarin is a poor choice given DOACs have ~50% lower '
                'ICH rates. If anticoagulation is restarted, DOACs '
                'are preferred. Timing should be 4-8 weeks after ICH '
                'onset, guided by repeat imaging.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              gcs: 15,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Use aspirin + clopidogrel instead of '
                'anticoagulation for AF',
            isCorrect: false,
            consequence:
                'Dual antiplatelet therapy provides inferior stroke '
                'prevention compared to anticoagulation for AF. The '
                'patient has a recurrent cardioembolic stroke at '
                '6 months.',
            explanation:
                'Antiplatelet therapy is INFERIOR to anticoagulation '
                'for stroke prevention in AF. The ACTIVE-W trial '
                'showed aspirin + clopidogrel was inferior to warfarin, '
                'and DOACs are even more effective. While DAPT is '
                'sometimes used as a compromise in patients unable to '
                'take anticoagulants, it provides suboptimal protection '
                'and still carries bleeding risk. For this patient '
                'with CHA2DS2-VASc 5 and deep (basal ganglia) ICH, '
                'the risk-benefit analysis favors DOAC resumption '
                'at 4-8 weeks over indefinite antiplatelet therapy.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              gcs: 15,
            ),
          ),
        ],
      ),
    ],
  );

  // ════════════════════════════════════════════════════════════
  // SCENARIO 4 -- Post-Stroke Dysphagia
  // ════════════════════════════════════════════════════════════

  static const ClinicalScenario postStrokeDysphagia = ClinicalScenario(
    id: 'dysphagia_01',
    title: 'Post-Stroke Dysphagia Management',
    patientSummary:
        '70F, 3 days post left MCA stroke (NIHSS 10). Nurse reports '
        'coughing and wet voice quality with meals. Currently on '
        'regular diet with thin liquids.',
    difficulty: 'Intermediate',
    moduleId: 'dysphagia',
    steps: [
      // STEP 1 -- Initial response
      ScenarioStep(
        id: 'step_1',
        narrative:
            'You are consulted on a 70-year-old woman who is 3 days '
            'post left MCA ischemic stroke. The nurse reports she has '
            'been coughing during meals and has a "wet" voice quality '
            'after drinking water. She is currently on a regular diet '
            'with thin liquids. What is your immediate action?',
        vitals: VitalSigns(
          hr: 78,
          sbp: 142,
          dbp: 82,
          rr: 18,
          spo2: 95,
          temp: 37.6,
          nihss: 10,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) Make the patient NPO immediately and order a '
                'formal swallowing evaluation by SLP',
            isCorrect: true,
            consequence:
                'The patient is made NPO. IV fluids are started for '
                'hydration. An SLP bedside swallowing evaluation is '
                'ordered for the morning. The low-grade fever prompts '
                'a chest X-ray which shows a right lower lobe '
                'infiltrate.',
            explanation:
                'AHA/ASA guidelines recommend that ALL stroke patients '
                'be screened for dysphagia before ANY oral intake '
                '(food, liquid, or oral medications). This patient '
                'has classic signs of oropharyngeal dysphagia: '
                'coughing with meals (indicating penetration/aspiration '
                'during swallowing) and wet voice quality (indicating '
                'residue in the hypopharynx/laryngeal vestibule). The '
                'low-grade fever and SpO2 of 95% suggest aspiration '
                'pneumonia may already be developing. Immediate NPO '
                'status prevents further aspiration while awaiting '
                'formal evaluation. Up to 50% of stroke patients have '
                'dysphagia acutely, and aspiration pneumonia is a '
                'leading cause of post-stroke mortality.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 140,
              dbp: 80,
              rr: 16,
              spo2: 96,
              temp: 37.4,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Switch to thickened liquids and soft diet; '
                'continue oral feeding with precautions',
            isCorrect: false,
            consequence:
                'Modified diet is started without formal evaluation. '
                'The patient continues to aspirate on thickened liquids '
                '(silent aspiration). Two days later, she develops '
                'frank aspiration pneumonia requiring antibiotics and '
                'ICU transfer.',
            explanation:
                'Modifying the diet WITHOUT a formal swallowing '
                'evaluation by SLP is inappropriate. Coughing with '
                'meals indicates aspiration, but up to 50% of '
                'aspiration in stroke patients is SILENT (no cough '
                'reflex). Without instrumental assessment, the true '
                'severity cannot be determined. Thickened liquids may '
                'still be aspirated if the pharyngeal swallow mechanism '
                'is severely impaired. A formal SLP evaluation with '
                'potential VFSS or FEES is needed before determining '
                'the appropriate diet.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 88,
              sbp: 146,
              dbp: 86,
              rr: 22,
              spo2: 92,
              temp: 38.4,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Continue current diet; coughing is a normal '
                'protective reflex',
            isCorrect: false,
            consequence:
                'The patient continues regular diet with thin liquids. '
                'She develops worsening aspiration pneumonia over '
                '48 hours with sepsis requiring intubation.',
            explanation:
                'While coughing IS a protective airway reflex, '
                'coughing DURING meals in a stroke patient indicates '
                'penetration or aspiration of food/liquid into the '
                'airway. This is NOT normal and requires immediate '
                'intervention. Combined with wet voice quality (residue '
                'on the vocal folds), this presentation has high '
                'specificity for aspiration. Ignoring these signs is '
                'a major patient safety error. Board pearl: know the '
                'clinical signs of aspiration -- cough with meals, '
                'wet/gurgly voice, throat clearing, O2 desaturation '
                'with meals, recurrent pneumonia.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 102,
              sbp: 118,
              dbp: 68,
              rr: 28,
              spo2: 88,
              temp: 39.2,
              nihss: 12,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Administer oral medications crushed in applesauce '
                'but hold food and liquids',
            isCorrect: false,
            consequence:
                'The patient aspirates crushed medications mixed with '
                'applesauce. Several pills are not safe to crush '
                '(extended-release formulations). Medications need to '
                'be given via alternative routes.',
            explanation:
                'If a patient is at risk for aspiration, oral '
                'medications should also be held (or given via '
                'alternative route) until swallowing is formally '
                'assessed. Crushed medications in applesauce can be '
                'aspirated just like food or liquid. Additionally, '
                'some medications (extended-release, enteric-coated) '
                'should NEVER be crushed. The correct approach: '
                'NPO including oral medications, switch essential '
                'medications to IV or rectal routes, and await SLP '
                'evaluation.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 80,
              sbp: 142,
              dbp: 82,
              rr: 18,
              spo2: 95,
              temp: 37.6,
              nihss: 10,
            ),
          ),
        ],
      ),

      // STEP 2 -- Instrumental assessment
      ScenarioStep(
        id: 'step_2',
        narrative:
            'The SLP performs a bedside clinical swallowing evaluation '
            'and notes impaired pharyngeal swallow with suspected '
            'aspiration on thin and nectar-thick liquids. She recommends '
            'an instrumental assessment. Which study is most '
            'appropriate?',
        vitals: VitalSigns(
          hr: 76,
          sbp: 138,
          dbp: 78,
          rr: 16,
          spo2: 96,
          temp: 37.8,
          nihss: 10,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Videofluoroscopic swallowing study (VFSS / '
                'modified barium swallow) to visualize the swallowing '
                'mechanism and identify aspiration',
            isCorrect: true,
            consequence:
                'VFSS reveals aspiration of thin and nectar-thick '
                'liquids with delayed pharyngeal swallow trigger and '
                'reduced hyolaryngeal excursion. Honey-thick liquids '
                'and pureed solids are safe with chin-tuck posture.',
            explanation:
                'VFSS (modified barium swallow) is the gold standard '
                'instrumental assessment for oropharyngeal dysphagia. '
                'It provides real-time fluoroscopic visualization of '
                'all phases of swallowing (oral prep, oral, pharyngeal) '
                'with multiple consistencies. Advantages: visualizes '
                'aspiration timing (before, during, after swallow), '
                'assesses compensatory strategies (chin tuck, head '
                'turn), and grades severity using the Penetration-'
                'Aspiration Scale (PAS). FEES is an acceptable '
                'alternative (especially for bedside-bound patients) '
                'but has a "whiteout" period during the swallow. Both '
                'are considered appropriate by AHA/ASA guidelines.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 138,
              dbp: 78,
              rr: 16,
              spo2: 96,
              temp: 37.6,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Barium esophagram to evaluate for structural '
                'esophageal abnormality',
            isCorrect: false,
            consequence:
                'The barium esophagram shows no esophageal stricture '
                'or motility disorder. However, it does not evaluate '
                'the oropharyngeal phase of swallowing where the '
                'problem lies.',
            explanation:
                'A barium esophagram evaluates ESOPHAGEAL swallowing '
                '(esophageal phase), not oropharyngeal swallowing. '
                'Post-stroke dysphagia is an OROPHARYNGEAL disorder '
                '-- impaired oral bolus control, delayed pharyngeal '
                'swallow trigger, reduced laryngeal elevation, and '
                'impaired UES opening. The barium esophagram is '
                'appropriate for suspected esophageal pathology '
                '(stricture, ring, achalasia, tumor) but does not '
                'assess the pharyngeal mechanisms relevant to '
                'aspiration risk. Board pearl: distinguish '
                'oropharyngeal dysphagia (neurogenic, stroke) from '
                'esophageal dysphagia (structural, motility).',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 140,
              dbp: 80,
              rr: 16,
              spo2: 96,
              temp: 37.7,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'C) CT neck with contrast to evaluate for structural '
                'pathology',
            isCorrect: false,
            consequence:
                'CT neck shows no structural abnormality. It provides '
                'no dynamic information about swallowing function. '
                'Time is wasted on a non-diagnostic study.',
            explanation:
                'CT imaging is a static study that does not provide '
                'dynamic swallowing assessment. It cannot visualize '
                'aspiration, pharyngeal residue, or the timing and '
                'coordination of the swallowing mechanism. CT may be '
                'useful if a structural lesion (tumor, abscess) is '
                'suspected but is not appropriate for evaluating '
                'neurogenic oropharyngeal dysphagia. The two '
                'appropriate instrumental studies for oropharyngeal '
                'dysphagia are VFSS and FEES.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 140,
              dbp: 80,
              rr: 16,
              spo2: 96,
              temp: 37.7,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'D) No instrumental study needed; the bedside exam is '
                'sufficient to guide diet',
            isCorrect: false,
            consequence:
                'Diet is modified based on bedside assessment alone. '
                'The patient has SILENT aspiration on honey-thick '
                'liquids (not detected at bedside) and develops '
                'recurrent aspiration pneumonia.',
            explanation:
                'The clinical (bedside) swallowing evaluation has '
                'limited sensitivity for detecting aspiration, '
                'particularly SILENT aspiration (sensitivity ~50-70% '
                'depending on the study). Up to 50% of aspiration '
                'events are silent in stroke patients. Instrumental '
                'assessment (VFSS or FEES) is needed to: (1) Confirm '
                'or rule out aspiration, (2) Identify the mechanism '
                'of dysphagia, (3) Test compensatory strategies, '
                '(4) Determine the safest diet consistency. AHA/ASA '
                'guidelines recommend instrumental assessment when '
                'bedside screening suggests aspiration risk.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 78,
              sbp: 140,
              dbp: 80,
              rr: 16,
              spo2: 96,
              temp: 37.7,
              nihss: 10,
            ),
          ),
        ],
      ),

      // STEP 3 -- Diet modification
      ScenarioStep(
        id: 'step_3',
        narrative:
            'VFSS shows aspiration on thin and nectar-thick liquids '
            'with PAS score of 8 (silent aspiration on thin). '
            'Honey-thick liquids are safe. Pureed solids with chin '
            'tuck are safe. Regular solids show residue in the '
            'valleculae. What is the appropriate diet order?',
        vitals: VitalSigns(
          hr: 76,
          sbp: 136,
          dbp: 76,
          rr: 16,
          spo2: 97,
          temp: 37.4,
          nihss: 10,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) IDDSI Level 4 (pureed) diet with IDDSI Level 3 '
                '(moderately thick / honey) liquids; chin tuck cue; '
                'SLP supervision at meals',
            isCorrect: true,
            consequence:
                'The modified diet is started with SLP-supervised '
                'meals. The patient tolerates the diet without '
                'coughing or desaturation. Aspiration pneumonia '
                'treatment continues concurrently.',
            explanation:
                'The International Dysphagia Diet Standardisation '
                'Initiative (IDDSI) provides a standardized framework '
                'for diet modification (Levels 3-7 for food, 0-4 for '
                'liquids). Based on VFSS findings: thin (IDDSI 0) and '
                'nectar (IDDSI 2) are unsafe -> restrict to honey '
                'consistency (IDDSI 3). Regular solids show residue -> '
                'restrict to pureed (IDDSI 4). Chin tuck narrows the '
                'airway entrance and widens the valleculae, providing '
                'additional protection. SLP supervision at meals '
                'ensures compliance and monitors tolerance. Board '
                'pearl: know IDDSI framework -- it replaced the '
                'old NDD levels in 2019.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 134,
              dbp: 74,
              rr: 16,
              spo2: 97,
              temp: 37.2,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Keep patient NPO and place a PEG tube for '
                'long-term nutrition',
            isCorrect: false,
            consequence:
                'PEG tube is placed on day 5 post-stroke. The patient '
                'is deprived of oral intake despite having a safe '
                'modified diet option. PEG tube placement carries '
                'procedural risks and does not prevent aspiration of '
                'oral secretions.',
            explanation:
                'PEG tube placement is premature at 3 days post-stroke '
                'when the patient has a safe modified diet option. '
                'AHA/ASA guidelines recommend PEG consideration only '
                'when dysphagia is expected to persist beyond 2-3 '
                'weeks. Most stroke dysphagia improves significantly '
                'in the first 1-2 weeks. Key points: (1) PEG does '
                'NOT prevent aspiration of oral secretions, '
                '(2) Early PEG (< 7 days) vs nasogastric tube shows '
                'no outcome benefit (FOOD trial), (3) NG tube is '
                'preferred for short-term enteral nutrition. Board '
                'pearl: do not place PEG in the first 2 weeks '
                'post-stroke unless clear indication of permanent '
                'dysphagia.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 136,
              dbp: 76,
              rr: 16,
              spo2: 97,
              temp: 37.4,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Regular diet with thin liquids plus aspiration '
                'precautions (elevated HOB, small bites)',
            isCorrect: false,
            consequence:
                'The patient aspirates thin liquids despite '
                'precautions. She develops worsening pneumonia with '
                'respiratory failure.',
            explanation:
                'VFSS clearly demonstrated aspiration on thin liquids '
                '(PAS 8 = material enters airway and passes below '
                'vocal folds with no effort to eject). Generic '
                '"aspiration precautions" do NOT prevent aspiration '
                'when the swallowing mechanism is impaired. The diet '
                'must be modified to consistencies that were SAFE on '
                'the instrumental study. Providing thin liquids when '
                'VFSS shows aspiration on thin liquids is a direct '
                'patient safety violation.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 92,
              sbp: 128,
              dbp: 72,
              rr: 24,
              spo2: 90,
              temp: 38.6,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'D) All liquids by mouth are unsafe; use NG tube for '
                'hydration and restrict to pureed solids only',
            isCorrect: false,
            consequence:
                'An NG tube is placed unnecessarily. The patient finds '
                'it uncomfortable and pulls it out. Meanwhile, she '
                'could have been safely hydrated with honey-thick '
                'liquids per VFSS findings.',
            explanation:
                'The VFSS showed that honey-thick liquids were SAFE. '
                'There is no need for NG tube hydration when a safe '
                'liquid consistency has been identified. Overly '
                'restrictive diets reduce quality of life, caloric '
                'intake, and hydration. The goal of dysphagia '
                'management is to find the LEAST restrictive diet that '
                'is safe -- not to restrict everything. NG tubes have '
                'their own complications (nasal irritation, sinusitis, '
                'aspiration of tube feeds) and should be used only '
                'when no safe oral option exists.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 136,
              dbp: 76,
              rr: 16,
              spo2: 97,
              temp: 37.4,
              nihss: 10,
            ),
          ),
        ],
      ),

      // STEP 4 -- Aspiration pneumonia management
      ScenarioStep(
        id: 'step_4',
        narrative:
            'Chest X-ray confirms right lower lobe infiltrate '
            'consistent with aspiration pneumonia. Temperature is '
            '37.8 C, WBC 14,000. The patient is hemodynamically '
            'stable. What is the appropriate antibiotic approach?',
        vitals: VitalSigns(
          hr: 82,
          sbp: 136,
          dbp: 76,
          rr: 18,
          spo2: 95,
          temp: 37.8,
          nihss: 10,
        ),
        imagingFinding:
            'CXR: Right lower lobe infiltrate with air bronchograms. '
            'No pleural effusion. No pneumothorax.',
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) Ampicillin-sulbactam or a respiratory '
                'fluoroquinolone for community-acquired aspiration '
                'pneumonia',
            isCorrect: true,
            consequence:
                'Ampicillin-sulbactam is started. The patient '
                'defervesces within 48 hours. WBC normalizes. She '
                'completes a 5-7 day course.',
            explanation:
                'Aspiration pneumonia in the hospital setting should '
                'be treated with antibiotics covering oral anaerobes '
                'and aerobic gram-positive organisms. For community-'
                'acquired aspiration pneumonia: ampicillin-sulbactam, '
                'amoxicillin-clavulanate, or a respiratory '
                'fluoroquinolone (levofloxacin, moxifloxacin). If '
                'hospital-acquired (> 48 hours inpatient), broader '
                'coverage for MRSA and Pseudomonas may be needed. '
                'Treatment duration: 5-7 days for uncomplicated cases. '
                'Prevention through appropriate diet modification and '
                'oral hygiene is more important than treatment.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 134,
              dbp: 74,
              rr: 16,
              spo2: 97,
              temp: 37.2,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Metronidazole monotherapy for anaerobic coverage',
            isCorrect: false,
            consequence:
                'Metronidazole alone provides incomplete coverage. '
                'Aerobic gram-positive organisms (Streptococcus, '
                'Staphylococcus) are not covered. The pneumonia '
                'worsens despite treatment.',
            explanation:
                'Aspiration pneumonia is typically polymicrobial, '
                'involving BOTH anaerobes (Bacteroides, Fusobacterium, '
                'Peptostreptococcus) AND aerobic organisms '
                '(Streptococcus, Staphylococcus, gram-negative '
                'enterics). Metronidazole provides anaerobic coverage '
                'but does not cover the aerobic component. '
                'Additionally, current IDSA guidelines have moved '
                'away from routine anaerobic coverage for aspiration '
                'pneumonia unless lung abscess or empyema is present. '
                'Standard CAP coverage with aspiration risk '
                'consideration is now preferred.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 88,
              sbp: 128,
              dbp: 72,
              rr: 20,
              spo2: 93,
              temp: 38.2,
              nihss: 10,
            ),
          ),
          ScenarioChoice(
            text:
                'C) No antibiotics; aspiration pneumonitis is '
                'chemical inflammation, not infection',
            isCorrect: false,
            consequence:
                'Antibiotics are withheld. The infiltrate progresses '
                'and the patient develops frank sepsis with '
                'hypotension and tachycardia.',
            explanation:
                'It is important to distinguish aspiration pneumonITIS '
                '(chemical inflammation from gastric acid without '
                'infection, often rapid onset, may resolve without '
                'antibiotics) from aspiration pneumoNIA (bacterial '
                'infection from aspiration of oropharyngeal secretions '
                'containing bacteria). This patient has a RLL '
                'infiltrate, fever, and elevated WBC 3 days into '
                'hospitalization -- this is aspiration PNEUMONIA '
                'requiring antibiotics, not sterile chemical '
                'pneumonitis. Board pearl: pneumonitis = chemical, '
                'acute, may self-resolve; pneumonia = infectious, '
                'requires antibiotics.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 108,
              sbp: 96,
              dbp: 58,
              rr: 26,
              spo2: 89,
              temp: 39.4,
              nihss: 12,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Vancomycin + piperacillin-tazobactam for broad '
                'MRSA and Pseudomonas coverage',
            isCorrect: false,
            consequence:
                'Unnecessarily broad spectrum antibiotics are started. '
                'While the pneumonia resolves, the patient develops '
                'C. difficile colitis from broad-spectrum coverage.',
            explanation:
                'Vancomycin + piperacillin-tazobactam provides '
                'excessively broad coverage for a patient with '
                'community-onset aspiration pneumonia who has been '
                'hospitalized for only 3 days. This level of coverage '
                'is appropriate for hospital-acquired pneumonia '
                '(> 5 days, prior IV antibiotics, ventilator-'
                'associated) but represents antibiotic overuse in this '
                'scenario. Antibiotic stewardship is important -- '
                'overly broad coverage increases C. difficile risk, '
                'selects for resistant organisms, and adds unnecessary '
                'cost.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 76,
              sbp: 134,
              dbp: 74,
              rr: 16,
              spo2: 97,
              temp: 37.2,
              nihss: 10,
            ),
          ),
        ],
      ),

      // STEP 5 -- Reassessment at 2 weeks
      ScenarioStep(
        id: 'step_5',
        narrative:
            'Two weeks post-stroke, the patient has improved. '
            'A repeat VFSS shows improved pharyngeal function: thin '
            'liquids are now safe with chin tuck, regular solids still '
            'show residue. The patient asks when she can eat normally '
            'again. How do you counsel her?',
        vitals: VitalSigns(
          hr: 74,
          sbp: 132,
          dbp: 74,
          rr: 14,
          spo2: 98,
          temp: 36.9,
          nihss: 6,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Upgrade diet to IDDSI Level 5 (minced and moist) '
                'with thin liquids + chin tuck; continue SLP therapy '
                'targeting pharyngeal strength; repeat VFSS in 4-6 '
                'weeks',
            isCorrect: true,
            consequence:
                'The diet is upgraded stepwise. The patient is '
                'discharged to rehab with the modified diet and '
                'ongoing SLP therapy. At 6 weeks, repeat VFSS shows '
                'near-normal swallowing and she advances to a regular '
                'diet.',
            explanation:
                'Dysphagia management is DYNAMIC and should be '
                'reassessed regularly. Most stroke dysphagia improves '
                'significantly in the first 2-6 weeks due to neural '
                'recovery and compensatory strategies. The approach '
                'should be stepwise diet advancement based on '
                'instrumental re-evaluation, not subjective assessment '
                'alone. SLP therapy targets include pharyngeal '
                'strengthening exercises (Mendelsohn maneuver, effortful '
                'swallow, Shaker exercise for UES opening), '
                'compensatory strategies (chin tuck, head turn), and '
                'sensory enhancement techniques. Serial VFSS guides '
                'diet progression.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 130,
              dbp: 72,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Return to regular diet immediately since thin '
                'liquids are now safe',
            isCorrect: false,
            consequence:
                'The patient resumes regular solids and chokes on a '
                'piece of chicken, requiring suctioning. The near-'
                'aspiration event is traumatic and the patient becomes '
                'afraid to eat.',
            explanation:
                'While thin liquids improved, the VFSS still showed '
                'residue with regular solids, indicating incomplete '
                'pharyngeal clearance. Jumping to a regular diet '
                'ignores objective evidence of ongoing dysphagia for '
                'solids. Diet advancement must follow VFSS findings '
                'for ALL consistencies, not just liquids. A choking '
                'event can also cause psychological trauma and food '
                'avoidance, worsening nutritional status.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 132,
              dbp: 74,
              rr: 14,
              spo2: 98,
              temp: 36.9,
              nihss: 6,
            ),
          ),
          ScenarioChoice(
            text:
                'C) This is likely permanent; plan for PEG placement '
                'and long-term modified diet',
            isCorrect: false,
            consequence:
                'PEG placement is planned unnecessarily. The patient '
                'is told her swallowing may never recover, causing '
                'depression and reduced participation in therapy.',
            explanation:
                'The majority of post-stroke dysphagia IMPROVES. '
                'Studies show 80-90% of stroke patients recover '
                'functional swallowing within 6 months. This patient '
                'already showed improvement at 2 weeks (thin liquids '
                'now safe). Nihilistic prognostication regarding '
                'swallowing recovery is not supported by evidence. '
                'PEG consideration should be reserved for patients '
                'with persistent severe dysphagia at 2-4 weeks with '
                'no signs of improvement. The demonstrated improvement '
                'here predicts continued recovery.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 132,
              dbp: 74,
              rr: 14,
              spo2: 98,
              temp: 36.9,
              nihss: 6,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Discharge on current diet without follow-up '
                'swallowing assessment',
            isCorrect: false,
            consequence:
                'The patient stays on the restrictive diet for months '
                'without reassessment. She develops malnutrition and '
                'dehydration from inadequate intake on the modified '
                'diet. She could have safely advanced weeks ago.',
            explanation:
                'Failing to reassess swallowing function after stroke '
                'leads to two problems: (1) Patients who improve are '
                'kept on unnecessarily restrictive diets, reducing '
                'quality of life and nutritional adequacy. '
                '(2) Patients who worsen or develop new aspiration '
                'patterns go undetected. Serial reassessment is '
                'essential. The general timeline for VFSS follow-up: '
                '1-2 weeks, 4-6 weeks, and as needed based on clinical '
                'change. Diet should be advanced as quickly as '
                'swallowing function allows.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 74,
              sbp: 132,
              dbp: 74,
              rr: 14,
              spo2: 98,
              temp: 36.9,
              nihss: 6,
            ),
          ),
        ],
      ),
    ],
  );

  // ════════════════════════════════════════════════════════════
  // SCENARIO 5 -- Stroke Rehab: Motor Recovery Assessment
  // ════════════════════════════════════════════════════════════

  static const ClinicalScenario motorRecoveryRehab = ClinicalScenario(
    id: 'motor_recovery_01',
    title: 'Stroke Rehab: Motor Recovery and Discharge Planning',
    patientSummary:
        '55M, 2 weeks post left MCA stroke. R hemiplegia with some '
        'finger extension emerging. Independent prior. Motivated. '
        'Wife is primary caregiver.',
    difficulty: 'Intermediate',
    moduleId: 'motor_recovery',
    steps: [
      // STEP 1 -- Motor staging
      ScenarioStep(
        id: 'step_1',
        narrative:
            'You are evaluating a 55-year-old man 2 weeks after a '
            'left MCA ischemic stroke. He has right hemiplegia. On '
            'examination, he has mass flexion synergy in the right '
            'upper extremity (can flex the elbow, wrist, and fingers '
            'together but cannot isolate movements) and is beginning '
            'to show some active finger extension. What Brunnstrom '
            'stage best describes his upper extremity motor recovery?',
        vitals: VitalSigns(
          hr: 72,
          sbp: 134,
          dbp: 78,
          rr: 14,
          spo2: 99,
          temp: 37.0,
          nihss: 8,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Brunnstrom Stage 3 -- spasticity peaks, '
                'voluntary movement present only in synergy patterns',
            isCorrect: true,
            consequence:
                'You document Brunnstrom Stage 3 for the right upper '
                'extremity. The emerging finger extension suggests '
                'transition toward Stage 4 (some out-of-synergy '
                'movement). This is a favorable prognostic sign.',
            explanation:
                'Brunnstrom stages describe the stereotypical '
                'recovery sequence after stroke: Stage 1: Flaccidity '
                '(no voluntary movement). Stage 2: Spasticity begins, '
                'basic synergies emerge. Stage 3: Spasticity peaks, '
                'voluntary control only WITHIN synergy patterns (flexor '
                'synergy: shoulder abduction/external rotation, elbow '
                'flexion, forearm supination, wrist/finger flexion; '
                'extensor synergy: the opposite). Stage 4: Some '
                'movement OUT of synergy begins. Stage 5: Synergies '
                'no longer dominate. Stage 6: Near-normal. Stage 7: '
                'Normal. This patient has mass flexion synergy (Stage '
                '3) with emerging isolated finger extension (beginning '
                'to transition to Stage 4).',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 134,
              dbp: 78,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Brunnstrom Stage 1 -- flaccidity with no '
                'voluntary movement',
            isCorrect: false,
            consequence:
                'You underestimate the patient\'s motor recovery. '
                'Therapy goals are set too low and the patient does '
                'not receive appropriately challenging interventions.',
            explanation:
                'Stage 1 is FLACCIDITY -- no voluntary movement at '
                'all. This patient has clear voluntary movement '
                '(mass flexion synergy) and some emerging isolated '
                'movement (finger extension). Underestimating motor '
                'recovery stage leads to insufficient therapy '
                'challenge and missed recovery potential. Accurate '
                'staging guides therapy intensity and goal-setting.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 134,
              dbp: 78,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Brunnstrom Stage 5 -- synergies no longer '
                'dominate; individual joint movements possible',
            isCorrect: false,
            consequence:
                'You overestimate recovery. Therapy is set at too high '
                'a level and the patient fails tasks, becoming '
                'frustrated and demoralized.',
            explanation:
                'Stage 5 implies that synergy patterns no longer '
                'dominate and the patient can perform isolated joint '
                'movements freely. This patient still shows mass '
                'flexion synergy (movements are "linked" in the '
                'synergy pattern) with only emerging finger extension '
                'as the first sign of out-of-synergy control. '
                'Overestimating motor stage leads to setting '
                'unrealistic therapy goals and patient frustration. '
                'The presence of synergy-bound movement clearly '
                'places this patient at Stage 3.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 134,
              dbp: 78,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Brunnstrom staging is outdated and should not be '
                'used in modern practice',
            isCorrect: false,
            consequence:
                'You skip motor staging entirely. Without a framework '
                'for understanding recovery trajectory, therapy '
                'planning is unfocused and progress is difficult to '
                'track.',
            explanation:
                'While Brunnstrom staging has limitations (it is '
                'descriptive, not predictive; it implies a fixed '
                'sequence that not all patients follow), it remains '
                'a foundational framework in stroke rehabilitation '
                'and is FREQUENTLY TESTED on PM&R boards. It provides '
                'a common language for describing motor recovery '
                'stage and guiding treatment approaches. Modern '
                'practice supplements Brunnstrom with outcome measures '
                'like Fugl-Meyer, Action Research Arm Test (ARAT), '
                'and SAFE score, but Brunnstrom staging remains a '
                'core competency.',
            nextStepId: 'step_2',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 134,
              dbp: 78,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
        ],
      ),

      // STEP 2 -- SAFE score
      ScenarioStep(
        id: 'step_2',
        narrative:
            'You want to predict this patient\'s potential for upper '
            'extremity recovery. The SAFE score uses shoulder abduction '
            'and finger extension within 72 hours of stroke. His '
            'admission records show: shoulder abduction 2/5, finger '
            'extension 1/5 at 48 hours post-stroke. What does the '
            'SAFE score predict?',
        vitals: VitalSigns(
          hr: 72,
          sbp: 132,
          dbp: 76,
          rr: 14,
          spo2: 99,
          temp: 37.0,
          nihss: 8,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) SAFE score 3 out of 10 -- predicts limited but '
                'possible upper extremity recovery; the emerging '
                'finger extension at 2 weeks is a favorable sign '
                'exceeding the early prediction',
            isCorrect: true,
            consequence:
                'You document the SAFE score and note the patient is '
                'tracking ahead of prediction. The emerging finger '
                'extension at 2 weeks combined with a SAFE score of '
                '3 places him in a "potential for recovery" category '
                'that warrants intensive UE therapy.',
            explanation:
                'The SAFE score (Shoulder Abduction, Finger Extension) '
                'is calculated from MRC grades measured within 72 '
                'hours of stroke. Shoulder abduction MRC 2 = 2 points, '
                'finger extension MRC 1 = 1 point. Total SAFE = 3/10. '
                'Interpretation: SAFE >= 5 predicts good UE recovery '
                '(~80% achieve ARAT >= 10). SAFE < 5 predicts limited '
                'recovery but does NOT mean no recovery. The PREP2 '
                'algorithm incorporates SAFE score + age + stroke '
                'severity + neurophysiology (TMS) for more refined '
                'prediction. This patient\'s emerging finger extension '
                'at 2 weeks is a favorable prognostic sign that may '
                'exceed the early SAFE prediction.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'B) SAFE score cannot be calculated retroactively; '
                'only real-time bedside assessment counts',
            isCorrect: false,
            consequence:
                'You decline to use the SAFE score. Without a '
                'prognostic framework, therapy planning lacks evidence-'
                'based direction.',
            explanation:
                'The SAFE score can be calculated from documented '
                'motor examination findings within the 72-hour window. '
                'While real-time assessment is ideal, documented MRC '
                'grades from the admission neurological exam are '
                'commonly used. The key is that the measurements '
                'were taken within 72 hours of onset. Refusing to '
                'use available prognostic tools deprives the team of '
                'important information for therapy planning and '
                'patient counseling.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'C) SAFE score 3 predicts NO meaningful recovery; '
                'focus therapy on compensatory strategies only',
            isCorrect: false,
            consequence:
                'Therapy focuses only on one-handed techniques and '
                'learned non-use of the right arm. The patient misses '
                'the critical window for neuroplasticity-driven '
                'recovery.',
            explanation:
                'A SAFE score of 3 predicts LIMITED recovery but '
                'does NOT predict NO recovery. The PREP2 algorithm '
                'stratifies patients into categories: excellent, '
                'good, limited, and no recovery. SAFE < 5 does not '
                'automatically mean "no recovery" -- it means further '
                'assessment (TMS) may help refine the prediction. '
                'Importantly, even patients with limited recovery '
                'potential benefit from both restorative AND '
                'compensatory approaches. Abandoning restorative '
                'therapy too early leads to learned non-use and '
                'misses neuroplastic potential.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
          ScenarioChoice(
            text:
                'D) SAFE score 8 out of 10 -- excellent prognosis '
                'for full recovery',
            isCorrect: false,
            consequence:
                'Overestimating the SAFE score leads to unrealistic '
                'expectations. The patient and family are disappointed '
                'when full UE recovery does not materialize despite '
                'good progress.',
            explanation:
                'SAFE score 8/10 would require shoulder abduction '
                '~ 4/5 (4 points) and finger extension ~ 4/5 '
                '(4 points). This patient had shoulder abduction 2/5 '
                'and finger extension 1/5, giving a SAFE of 3, not 8. '
                'Overestimating the SAFE score leads to overly '
                'optimistic prognostication. While it is important '
                'to maintain hope and motivation, setting realistic '
                'expectations based on validated tools helps patients '
                'and families prepare appropriately.',
            nextStepId: 'step_3',
            updatedVitals: VitalSigns(
              hr: 72,
              sbp: 132,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 8,
            ),
          ),
        ],
      ),

      // STEP 3 -- CIMT candidacy
      ScenarioStep(
        id: 'step_3',
        narrative:
            'The occupational therapist asks about Constraint-Induced '
            'Movement Therapy (CIMT) for this patient. He now has: '
            'active wrist extension 10 degrees, active finger extension '
            '10 degrees (MCP/IP), some mass grasp. What is your '
            'recommendation?',
        vitals: VitalSigns(
          hr: 70,
          sbp: 130,
          dbp: 76,
          rr: 14,
          spo2: 99,
          temp: 37.0,
          nihss: 7,
        ),
        imagingFinding: null,
        timeLimit: 45,
        choices: [
          ScenarioChoice(
            text:
                'A) He meets minimum motor criteria for CIMT -- at '
                'least 10 degrees active wrist extension and 10 '
                'degrees finger extension; proceed with modified CIMT',
            isCorrect: true,
            consequence:
                'Modified CIMT is initiated: constraining the '
                'unaffected left hand for 6 hours/day with 2-3 hours '
                'of structured task practice. After 2 weeks, ARAT '
                'scores improve significantly.',
            explanation:
                'CIMT (Constraint-Induced Movement Therapy) was '
                'established by the EXCITE trial (Wolf et al., 2006). '
                'Minimum motor criteria: >= 10 degrees active wrist '
                'extension AND >= 10 degrees active finger extension '
                'at MCPs/IPs. The intervention constrains the '
                'unaffected limb while providing intensive, repetitive '
                'task practice with the affected limb (overcoming '
                'learned non-use). Original protocol: mitt on '
                'unaffected hand for 90% of waking hours, 6 hours of '
                'structured practice daily. Modified CIMT (mCIMT) '
                'uses less intensive protocols (3-6 hours of constraint, '
                '2-3 hours of practice) with similar benefit. '
                'Evidence: Level 1 (strongest) for chronic stroke, '
                'growing evidence for subacute.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 130,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 6,
            ),
          ),
          ScenarioChoice(
            text:
                'B) He does NOT meet CIMT criteria; requires at '
                'least 20 degrees wrist extension and full finger '
                'extension',
            isCorrect: false,
            consequence:
                'CIMT is deferred. The patient continues standard OT '
                'and misses the opportunity for intensive task-specific '
                'practice during the critical early recovery window.',
            explanation:
                'The minimum motor criteria for CIMT are 10 degrees '
                'of active wrist extension and 10 degrees of active '
                'finger extension -- NOT 20 degrees or full extension. '
                'These threshold criteria ensure the patient has '
                'enough voluntary motor control to attempt functional '
                'tasks with the affected hand. Using overly strict '
                'criteria excludes patients who would benefit. '
                'This patient meets the published EXCITE trial '
                'inclusion criteria and should be offered CIMT.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 130,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 7,
            ),
          ),
          ScenarioChoice(
            text:
                'C) CIMT is only effective in chronic stroke (> 6 '
                'months); too early to start',
            isCorrect: false,
            consequence:
                'CIMT is delayed until 6 months post-stroke. By then, '
                'learned non-use has become entrenched and the patient '
                'has adapted to one-handed function.',
            explanation:
                'While the original EXCITE trial studied CHRONIC '
                'stroke patients (3-9 months post), subsequent '
                'studies have shown benefit in SUBACUTE stroke as '
                'well. The VECTORS trial and others support CIMT '
                'initiation as early as 2-4 weeks post-stroke in '
                'appropriate candidates. The subacute period (2 weeks '
                'to 3 months) is actually optimal for neuroplasticity-'
                'driven interventions due to heightened cortical '
                'excitability and synaptogenesis. Delaying to chronic '
                'phase misses this critical window.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 130,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 7,
            ),
          ),
          ScenarioChoice(
            text:
                'D) CIMT is contraindicated because it may worsen '
                'spasticity in the affected limb',
            isCorrect: false,
            consequence:
                'CIMT is not offered due to unfounded concern. The '
                'patient receives less intensive therapy and has a '
                'slower functional recovery.',
            explanation:
                'CIMT does NOT worsen spasticity. This is a common '
                'misconception. Intensive task practice through CIMT '
                'promotes cortical reorganization and voluntary motor '
                'control, which may actually help modulate spasticity '
                'over time. The EXCITE trial and subsequent studies '
                'showed improved motor function without adverse '
                'effects on tone. Contraindications to CIMT include: '
                'cognitive impairment preventing participation, '
                'balance impairment risking falls with one-handed '
                'constraint, and severe neglect. Spasticity is NOT '
                'a contraindication.',
            nextStepId: 'step_4',
            updatedVitals: VitalSigns(
              hr: 70,
              sbp: 130,
              dbp: 76,
              rr: 14,
              spo2: 99,
              temp: 37.0,
              nihss: 7,
            ),
          ),
        ],
      ),

      // STEP 4 -- FIM and discharge planning
      ScenarioStep(
        id: 'step_4',
        narrative:
            'After 2 weeks of IRF (inpatient rehabilitation), the '
            'patient has made significant progress. Current FIM scores: '
            'Motor FIM 72/91 (eating 6, grooming 5, bathing 4, UB '
            'dressing 5, LB dressing 4, toileting 5, bladder 7, '
            'bowel 7, bed/chair transfer 5, toilet transfer 5, '
            'tub transfer 4, walk 5, stairs 4). Cognitive FIM 32/35. '
            'What is the most appropriate discharge disposition?',
        vitals: VitalSigns(
          hr: 68,
          sbp: 128,
          dbp: 74,
          rr: 14,
          spo2: 99,
          temp: 36.9,
          nihss: 5,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Discharge home with home health PT/OT/SLP, home '
                'modifications, and caregiver training for the wife; '
                'transition to outpatient therapy when appropriate',
            isCorrect: true,
            consequence:
                'The patient is discharged home with a comprehensive '
                'home program. His wife receives caregiver training. '
                'Home modifications include grab bars, shower bench, '
                'and bedside commode. He transitions to outpatient '
                'therapy at 4 weeks and continues to improve.',
            explanation:
                'This patient has a Motor FIM of 72 (most items at '
                'supervision or modified independence level, scores '
                'of 4-6), good cognition (Cog FIM 32/35), a motivated '
                'disposition, and a supportive caregiver (wife). He is '
                'appropriate for home discharge with home health '
                'services. FIM score interpretation: 7 = complete '
                'independence, 6 = modified independence (device), '
                '5 = supervision/setup, 4 = minimal assist (75%+), '
                '3 = moderate assist (50-74%), 2 = maximal assist '
                '(25-49%), 1 = total assist. His scores of 4-6 '
                'indicate he is at supervision-to-minimal assist '
                'level, manageable at home with trained caregiver.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 128,
              dbp: 74,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'B) Transfer to SNF for continued rehabilitation',
            isCorrect: false,
            consequence:
                'The patient is transferred to SNF despite having '
                'adequate support at home. He becomes depressed in '
                'the institutional setting, therapy intensity '
                'decreases, and recovery plateaus.',
            explanation:
                'SNF is appropriate for patients who: (1) Cannot '
                'tolerate IRF intensity (3 hours/day) but need ongoing '
                'skilled nursing, (2) Lack adequate home support, '
                'or (3) Have significant medical complexity. This '
                'patient has good functional progress, adequate '
                'cognition, a supportive caregiver, and is at '
                'supervision/minimal assist level. Home discharge '
                'with services is more appropriate, cost-effective, '
                'and associated with better patient satisfaction and '
                'outcomes. Unnecessary institutional placement should '
                'be avoided.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 128,
              dbp: 74,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'C) Continue IRF for another 2 weeks to maximize '
                'recovery before discharge',
            isCorrect: false,
            consequence:
                'Extended IRF stay is requested. Insurance denies the '
                'extension because the patient has met functional '
                'goals for safe home discharge. The delay increases '
                'cost without proportional benefit.',
            explanation:
                'IRF length of stay should be based on: (1) Ongoing '
                'need for physician-directed rehab, (2) Ability to '
                'tolerate and benefit from 3 hours/day therapy, '
                '(3) Measurable functional progress toward discharge '
                'goals. When a patient reaches a functional level '
                'safe for discharge with appropriate services, '
                'continued IRF stay is no longer medically necessary '
                'and will be denied by payers. The average IRF LOS '
                'for stroke is 14-16 days. This patient at 2 weeks '
                'with supervision/minimal assist levels has met '
                'typical discharge criteria.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 128,
              dbp: 74,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 5,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Discharge home with no further therapy; he has '
                'recovered sufficiently',
            isCorrect: false,
            consequence:
                'The patient goes home without therapy. His progress '
                'plateaus and he develops compensatory movement '
                'patterns that are inefficient. He does not reach '
                'his full recovery potential.',
            explanation:
                'Discharging without continued therapy ignores the '
                'fact that this patient still has deficits (FIM scores '
                'of 4-5 in several domains) and is in the critical '
                'early recovery window (first 3 months) when '
                'neuroplasticity is maximal. Continued PT, OT, and '
                'SLP through home health and later outpatient settings '
                'is essential for maximizing recovery. The first 3-6 '
                'months post-stroke represent the period of greatest '
                'recovery potential. Terminating therapy at 4 weeks '
                'post-stroke is premature.',
            nextStepId: 'step_5',
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 128,
              dbp: 74,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 5,
            ),
          ),
        ],
      ),

      // STEP 5 -- Community reintegration
      ScenarioStep(
        id: 'step_5',
        narrative:
            'At the 3-month follow-up visit, the patient reports he '
            'can walk independently with a single-point cane, dress '
            'himself with minimal difficulty, and perform basic ADLs. '
            'However, he has not returned to work (accountant), is '
            'not driving, and reports feeling isolated. He asks when '
            'he can resume normal activities. What is your approach?',
        vitals: VitalSigns(
          hr: 68,
          sbp: 126,
          dbp: 72,
          rr: 14,
          spo2: 99,
          temp: 36.9,
          nihss: 3,
        ),
        imagingFinding: null,
        timeLimit: 60,
        choices: [
          ScenarioChoice(
            text:
                'A) Address driving evaluation, vocational rehab '
                'referral, community reintegration program, and '
                'screen for post-stroke depression',
            isCorrect: true,
            consequence:
                'You refer for a comprehensive driving evaluation, '
                'contact vocational rehabilitation for workplace '
                'accommodations, recommend a community stroke support '
                'group, and screen for depression (PHQ-9 reveals '
                'moderate depression). He starts an SSRI and begins '
                'returning to work part-time at 4 months.',
            explanation:
                'Community reintegration is a critical and often '
                'overlooked component of stroke rehabilitation. Key '
                'components: (1) DRIVING: Formal evaluation by '
                'certified driver rehab specialist (OT-DRS). Most '
                'states require 3-6 month seizure-free period and '
                'physician clearance. Assessment includes visual '
                'fields, reaction time, cognition, and behind-the-'
                'wheel evaluation. (2) VOCATIONAL REHAB: Return to '
                'work assessment, workplace modifications, graduated '
                'return schedule. Only ~50% of working-age stroke '
                'survivors return to work. (3) DEPRESSION: Affects '
                '~30% of stroke survivors. Screen with PHQ-9. SSRIs '
                'are first-line. The FLAME trial showed fluoxetine '
                'may also enhance motor recovery. (4) Social '
                'participation: Community programs, peer support '
                'groups reduce isolation.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 66,
              sbp: 124,
              dbp: 70,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 3,
            ),
          ),
          ScenarioChoice(
            text:
                'B) He can resume driving and working immediately '
                'since his deficits are mild',
            isCorrect: false,
            consequence:
                'The patient returns to driving without formal '
                'evaluation. He has a near-miss accident due to '
                'impaired right-sided visual scanning. He returns '
                'to work full-time and becomes overwhelmed, '
                'worsening his depression.',
            explanation:
                'Even mild stroke deficits can significantly impact '
                'driving safety. Subtle cognitive impairments (divided '
                'attention, processing speed), visual field cuts, and '
                'motor deficits may not be apparent in clinic but '
                'create dangerous driving situations. AHA/ASA '
                'guidelines recommend formal driving evaluation '
                'before resuming driving after stroke. Returning to '
                'work should be graduated (part-time first) with '
                'vocational rehabilitation support. Clearing a patient '
                'for driving and full work without assessment is a '
                'significant liability and safety risk.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 126,
              dbp: 72,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 3,
            ),
          ),
          ScenarioChoice(
            text:
                'C) He should not drive or work again given his '
                'stroke history',
            isCorrect: false,
            consequence:
                'The patient is told he can never drive or work again. '
                'He becomes severely depressed, his marriage is '
                'strained, and he loses financial stability.',
            explanation:
                'Blanket prohibition of driving and working after '
                'stroke is not evidence-based. Many stroke survivors '
                'return to safe driving and productive employment '
                'after appropriate evaluation and rehabilitation. '
                'The key is INDIVIDUALIZED assessment, not a blanket '
                'restriction. Studies show that 30-70% of stroke '
                'survivors can return to driving and ~50% can return '
                'to work with appropriate support. Nihilistic '
                'restrictions without assessment deprive patients of '
                'independence and contribute to post-stroke depression.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 126,
              dbp: 72,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 3,
            ),
          ),
          ScenarioChoice(
            text:
                'D) Focus only on continued physical therapy; social '
                'and vocational issues are not medical concerns',
            isCorrect: false,
            consequence:
                'Social and vocational needs go unaddressed. The '
                'patient develops severe depression, stops attending '
                'therapy, and has a functional decline.',
            explanation:
                'Stroke rehabilitation must address the WHOLE PERSON, '
                'not just motor recovery. The ICF (International '
                'Classification of Functioning, Disability, and '
                'Health) framework recognizes that participation '
                '(community, vocational, social) is as important as '
                'body structure/function and activity. Post-stroke '
                'depression affects ~30% of survivors and is the '
                'strongest predictor of poor quality of life. Social '
                'isolation, loss of roles, and vocational disruption '
                'are significant contributors to disability. PM&R '
                'physicians have a unique role in addressing the '
                'bio-psycho-social model of care.',
            nextStepId: null,
            updatedVitals: VitalSigns(
              hr: 68,
              sbp: 126,
              dbp: 72,
              rr: 14,
              spo2: 99,
              temp: 36.9,
              nihss: 3,
            ),
          ),
        ],
      ),
    ],
  );
}
