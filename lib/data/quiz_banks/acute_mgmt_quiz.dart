import '../../core/models/quiz_model.dart';

class AcuteMgmtQuiz {
  AcuteMgmtQuiz._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      question:
          'What is the standard time window for IV alteplase (tPA) administration in acute ischemic stroke?',
      options: [
        'Within 1 hour of symptom onset',
        'Within 3 hours of symptom onset (up to 4.5 hours in select patients)',
        'Within 6 hours of symptom onset',
        'Within 8 hours of symptom onset',
      ],
      correctIndex: 1,
      explanation:
          'IV alteplase is FDA-approved within 3 hours of symptom onset. AHA/ASA guidelines extend the window to 4.5 hours for select patients, with additional exclusion criteria (age >80, NIHSS >25, oral anticoagulant use, history of both stroke and diabetes).',
      moduleId: 'acute_mgmt',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'What is the correct dose of IV alteplase for acute ischemic stroke?',
      options: [
        '0.6 mg/kg, maximum 60 mg',
        '0.9 mg/kg, maximum 90 mg',
        '1.0 mg/kg, maximum 100 mg',
        '1.5 mg/kg, maximum 150 mg',
      ],
      correctIndex: 1,
      explanation:
          'IV alteplase is dosed at 0.9 mg/kg (maximum 90 mg), with 10% given as an IV bolus over 1 minute and the remaining 90% infused over 60 minutes.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Blood pressure must be maintained below what level BEFORE administering IV tPA?',
      options: [
        '160/90 mmHg',
        '180/105 mmHg',
        '185/110 mmHg',
        '220/120 mmHg',
      ],
      correctIndex: 2,
      explanation:
          'Blood pressure must be <185/110 mmHg before tPA administration and maintained <180/105 mmHg for 24 hours after tPA to minimize the risk of hemorrhagic transformation.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Which of the following is an absolute contraindication to IV tPA for acute ischemic stroke?',
      options: [
        'Age greater than 80 years',
        'NIHSS score less than 5',
        'Intracranial hemorrhage on CT',
        'Blood glucose of 350 mg/dL',
      ],
      correctIndex: 2,
      explanation:
          'Intracranial hemorrhage on CT is an absolute contraindication to tPA. The entire purpose of the initial non-contrast CT is to exclude hemorrhage. Age >80 is an exclusion only in the extended 3-4.5 hour window. Low NIHSS and hyperglycemia are relative considerations.',
      moduleId: 'acute_mgmt',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'According to the DAWN and DEFUSE 3 trials, mechanical thrombectomy for large vessel occlusion may be performed up to how many hours from symptom onset?',
      options: [
        '6 hours',
        '12 hours',
        '24 hours',
        '48 hours',
      ],
      correctIndex: 2,
      explanation:
          'The DAWN trial (6-24 hours) and DEFUSE 3 trial (6-16 hours) demonstrated that mechanical thrombectomy is beneficial up to 24 hours from last known well in carefully selected patients with favorable perfusion imaging (mismatch between clinical deficit/infarct core and ischemic penumbra).',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In acute ischemic stroke NOT treated with thrombolytics, permissive hypertension allows blood pressure up to:',
      options: [
        '160/90 mmHg',
        '185/110 mmHg',
        '220/120 mmHg',
        '240/140 mmHg',
      ],
      correctIndex: 2,
      explanation:
          'In non-thrombolytic-eligible patients, blood pressure is generally not lowered unless >220/120 mmHg. Permissive hypertension maintains cerebral perfusion pressure to the ischemic penumbra. Aggressive BP lowering may worsen ischemia.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the recommended DVT prophylaxis for immobilized acute stroke patients, based on the CLOTS trials?',
      options: [
        'Graduated compression stockings',
        'Aspirin alone',
        'Intermittent pneumatic compression (IPC) devices',
        'No prophylaxis needed if mobile within 48 hours',
      ],
      correctIndex: 2,
      explanation:
          'The CLOTS 3 trial showed IPC devices significantly reduce DVT in immobilized stroke patients. CLOTS 1 and 2 showed graduated compression stockings are NOT effective and may cause skin complications. Pharmacologic prophylaxis (heparin/LMWH) is an option but carries bleeding risk.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Dual antiplatelet therapy (DAPT) with aspirin and clopidogrel for minor ischemic stroke or high-risk TIA should be started within what time frame?',
      options: [
        'Within 6 hours, continued for 7 days',
        'Within 24 hours, continued for 21 days',
        'Within 48 hours, continued for 90 days',
        'Within 72 hours, continued for indefinitely',
      ],
      correctIndex: 1,
      explanation:
          'Per the CHANCE and POINT trials, DAPT (aspirin + clopidogrel) should begin within 24 hours of minor ischemic stroke (NIHSS <=3) or high-risk TIA, continued for 21 days, then transition to single antiplatelet therapy.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'For secondary stroke prevention in non-valvular atrial fibrillation, which anticoagulant class is preferred?',
      options: [
        'Unfractionated heparin',
        'Warfarin',
        'Direct oral anticoagulants (DOACs)',
        'Low-molecular-weight heparin',
      ],
      correctIndex: 2,
      explanation:
          'DOACs (apixaban, rivaroxaban, dabigatran, edoxaban) are preferred over warfarin for non-valvular AF-related stroke prevention due to similar or better efficacy, lower intracranial hemorrhage risk, fewer drug interactions, and no requirement for INR monitoring.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Carotid endarterectomy (CEA) is most clearly beneficial in symptomatic patients with what degree of carotid stenosis?',
      options: [
        '30-49% stenosis',
        '50-69% stenosis',
        '70-99% stenosis',
        '100% occlusion',
      ],
      correctIndex: 2,
      explanation:
          'The NASCET trial showed CEA provides the greatest benefit for symptomatic carotid stenosis of 70-99% (NNT ~6). Moderate benefit exists for 50-69%. CEA is not beneficial for <50% stenosis or complete (100%) occlusion. Surgery should be performed within 2 weeks of the symptomatic event.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A patient on dabigatran presents with acute ICH. What is the specific reversal agent?',
      options: [
        '4-factor PCC',
        'Fresh frozen plasma',
        'Idarucizumab',
        'Andexanet alfa',
      ],
      correctIndex: 2,
      explanation:
          'Idarucizumab (Praxbind) is a monoclonal antibody fragment that specifically binds and reverses dabigatran (direct thrombin inhibitor). Andexanet alfa reverses factor Xa inhibitors (rivaroxaban, apixaban). 4-factor PCC reverses warfarin.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'For warfarin-associated intracerebral hemorrhage with INR >1.5, what is the recommended reversal strategy?',
      options: [
        'Hold warfarin and observe',
        'Fresh frozen plasma alone',
        '4-factor prothrombin complex concentrate (PCC) plus IV vitamin K',
        'Recombinant factor VIIa alone',
      ],
      correctIndex: 2,
      explanation:
          '4-factor PCC provides rapid, complete INR reversal and is preferred over FFP (faster onset, smaller volume, does not require thawing). IV vitamin K (10 mg) is given simultaneously for sustained effect. FFP alone is slower and requires large volumes.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Decompressive hemicraniectomy for malignant MCA infarction has the best evidence of benefit in which patient population?',
      options: [
        'Patients aged >70 with dominant hemisphere stroke',
        'Patients aged 18-60 with surgery within 48 hours',
        'All patients regardless of age if GCS <8',
        'Patients aged >80 with non-dominant hemisphere stroke',
      ],
      correctIndex: 1,
      explanation:
          'The DECIMAL, DESTINY, and HAMLET trials showed decompressive hemicraniectomy within 48 hours significantly reduces mortality in patients aged 18-60 with malignant MCA infarction. The DESTINY 2 trial showed mortality benefit in patients >60 but with higher rates of severe disability.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the target blood glucose range for acute stroke patients?',
      options: [
        '80-110 mg/dL',
        '140-180 mg/dL',
        '180-250 mg/dL',
        'No specific target is recommended',
      ],
      correctIndex: 1,
      explanation:
          'AHA/ASA guidelines recommend treating hyperglycemia to maintain blood glucose in the range of 140-180 mg/dL in acute stroke. Both hyperglycemia (>180 mg/dL, increases infarct size) and hypoglycemia (<60 mg/dL, mimics stroke) should be avoided.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A cerebellar hemorrhage >3 cm with signs of brainstem compression requires:',
      options: [
        'Conservative medical management',
        'IV mannitol and observation',
        'Emergent surgical evacuation',
        'Intraventricular tPA',
      ],
      correctIndex: 2,
      explanation:
          'Cerebellar hemorrhage >3 cm (or any size with brainstem compression or hydrocephalus) is a neurosurgical emergency requiring suboccipital craniectomy and clot evacuation. Rapid deterioration and death can occur without intervention. This is one of the few ICH scenarios with clear surgical indication.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
  ];
}
