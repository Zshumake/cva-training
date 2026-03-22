import '../../core/models/quiz_model.dart';

class StrokeQuizBank {
  StrokeQuizBank._();

  static List<QuizQuestion> getRandomQuiz(int count) {
    final shuffled = List<QuizQuestion>.from(allQuestions)..shuffle();
    return shuffled.take(count).toList();
  }

  static const List<QuizQuestion> allQuestions = [
    // ── Fundamentals / Epidemiology ──────────────────────────────────
    QuizQuestion(
      question:
          'Which of the following is the most common modifiable risk factor for stroke?',
      options: [
        'Diabetes mellitus',
        'Hypertension',
        'Atrial fibrillation',
        'Hyperlipidemia',
      ],
      correctIndex: 1,
      explanation:
          'Hypertension is the single most important modifiable risk factor for both ischemic and hemorrhagic stroke, present in approximately 70% of stroke patients.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'What percentage of all strokes are ischemic in origin?',
      options: ['50%', '65%', '87%', '95%'],
      correctIndex: 2,
      explanation:
          'Approximately 87% of all strokes are ischemic, with the remainder being hemorrhagic (10% intracerebral, 3% subarachnoid).',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Stroke is the leading cause of which of the following in the United States?',
      options: [
        'Death',
        'Long-term disability',
        'Hospitalization',
        'Emergency department visits',
      ],
      correctIndex: 1,
      explanation:
          'Stroke is the leading cause of serious long-term disability in the United States and the fifth leading cause of death.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which cardiac arrhythmia is most commonly associated with cardioembolic stroke?',
      options: [
        'Ventricular tachycardia',
        'Atrial flutter',
        'Atrial fibrillation',
        'Supraventricular tachycardia',
      ],
      correctIndex: 2,
      explanation:
          'Atrial fibrillation is the most common cardiac arrhythmia associated with cardioembolic stroke and increases stroke risk approximately 5-fold.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The ABCD2 score is used to predict stroke risk after which event?',
      options: [
        'Myocardial infarction',
        'Transient ischemic attack (TIA)',
        'Subarachnoid hemorrhage',
        'Deep vein thrombosis',
      ],
      correctIndex: 1,
      explanation:
          'The ABCD2 score (Age, Blood pressure, Clinical features, Duration, Diabetes) predicts the short-term risk of stroke following a TIA.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),

    // ── Vascular Anatomy ─────────────────────────────────────────────
    QuizQuestion(
      question:
          'The circle of Willis is completed posteriorly by which arteries?',
      options: [
        'Anterior cerebral arteries',
        'Posterior communicating arteries',
        'Superior cerebellar arteries',
        'Posterior inferior cerebellar arteries',
      ],
      correctIndex: 1,
      explanation:
          'The posterior communicating arteries connect the internal carotid system to the posterior cerebral arteries, completing the posterior portion of the circle of Willis.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The lenticulostriate arteries are branches of which vessel?',
      options: [
        'Anterior cerebral artery',
        'Posterior cerebral artery',
        'Middle cerebral artery',
        'Basilar artery',
      ],
      correctIndex: 2,
      explanation:
          'The lenticulostriate arteries are penetrating branches of the M1 segment of the MCA. They supply the putamen, globus pallidus, and internal capsule. Occlusion produces lacunar infarcts.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Which artery supplies the primary motor and sensory cortex for the lower extremity?',
      options: [
        'Middle cerebral artery',
        'Posterior cerebral artery',
        'Anterior cerebral artery',
        'Anterior choroidal artery',
      ],
      correctIndex: 2,
      explanation:
          'The ACA supplies the medial surface of the cerebral hemisphere, including the motor and sensory strips for the lower extremity (cortical homunculus).',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The anterior spinal artery syndrome results from occlusion affecting which area of the spinal cord?',
      options: [
        'Posterior columns',
        'Anterior two-thirds of the spinal cord',
        'Lateral corticospinal tract only',
        'Dorsal root ganglia',
      ],
      correctIndex: 1,
      explanation:
          'Anterior spinal artery syndrome affects the anterior two-thirds of the cord, causing bilateral motor paralysis, loss of pain/temperature, and autonomic dysfunction below the lesion, with preserved proprioception and vibration (posterior columns).',
      moduleId: 'fundamentals',
      difficulty: 'board',
    ),

    // ── Ischemic vs Hemorrhagic Stroke ───────────────────────────────
    QuizQuestion(
      question:
          'Which imaging study is the initial study of choice to differentiate ischemic from hemorrhagic stroke?',
      options: [
        'MRI with diffusion-weighted imaging',
        'CT angiography',
        'Non-contrast CT head',
        'Cerebral angiography',
      ],
      correctIndex: 2,
      explanation:
          'A non-contrast CT head is the initial study of choice because it can rapidly and reliably identify acute hemorrhage, which appears hyperdense. This distinction is critical before initiating thrombolytic therapy.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which of the following is the most common location for hypertensive intracerebral hemorrhage?',
      options: [
        'Lobar (cortical)',
        'Putamen/basal ganglia',
        'Thalamus',
        'Cerebellum',
      ],
      correctIndex: 1,
      explanation:
          'The putamen/basal ganglia is the most common site of hypertensive ICH (approximately 35-50% of cases), due to rupture of Charcot-Bouchard microaneurysms on the lenticulostriate arteries.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient presents with the "worst headache of my life," neck stiffness, and photophobia. Which diagnosis is most likely?',
      options: [
        'Ischemic stroke',
        'Subdural hematoma',
        'Subarachnoid hemorrhage',
        'Migraine with aura',
      ],
      correctIndex: 2,
      explanation:
          'The classic presentation of subarachnoid hemorrhage (SAH) includes sudden, severe "thunderclap" headache, meningismus (neck stiffness), and photophobia. The most common cause is rupture of a saccular (berry) aneurysm.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),

    // ── Stroke Syndromes / Localization ──────────────────────────────
    QuizQuestion(
      question:
          'A patient presents with contralateral hemiparesis and hemisensory loss affecting the face and upper extremity more than the lower extremity, homonymous hemianopia, and global aphasia. Which vascular territory is affected?',
      options: [
        'Anterior cerebral artery',
        'Middle cerebral artery',
        'Posterior cerebral artery',
        'Basilar artery',
      ],
      correctIndex: 1,
      explanation:
          'The MCA supplies the lateral cerebral cortex including the face and upper extremity motor/sensory areas, Broca and Wernicke areas (dominant hemisphere), and the optic radiations. This presentation is classic for a dominant-hemisphere MCA stroke.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient has contralateral leg weakness and sensory loss with urinary incontinence and abulia. Which artery is most likely occluded?',
      options: [
        'Middle cerebral artery',
        'Anterior cerebral artery',
        'Posterior inferior cerebellar artery',
        'Anterior choroidal artery',
      ],
      correctIndex: 1,
      explanation:
          'The ACA supplies the medial frontal and parietal lobes. Occlusion causes contralateral leg-predominant weakness and sensory loss, urinary incontinence (medial frontal micturition center), and abulia (lack of will/motivation).',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient presents with contralateral homonymous hemianopia, alexia without agraphia, and visual agnosia. Which artery is most likely involved?',
      options: [
        'Anterior cerebral artery',
        'Middle cerebral artery',
        'Posterior cerebral artery',
        'Anterior choroidal artery',
      ],
      correctIndex: 2,
      explanation:
          'The PCA supplies the occipital lobe and inferomedial temporal lobe. Dominant PCA stroke causes contralateral homonymous hemianopia and alexia without agraphia (splenium of corpus callosum involvement disconnects visual input from the language area).',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Lateral medullary (Wallenberg) syndrome results from occlusion of which artery?',
      options: [
        'Anterior inferior cerebellar artery',
        'Posterior inferior cerebellar artery or vertebral artery',
        'Superior cerebellar artery',
        'Basilar artery',
      ],
      correctIndex: 1,
      explanation:
          'Wallenberg syndrome results from PICA or vertebral artery occlusion. Findings include ipsilateral Horner syndrome, ipsilateral facial pain/temperature loss, contralateral body pain/temperature loss, dysphagia, hoarseness, vertigo, and ipsilateral cerebellar ataxia.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient presents with "locked-in syndrome" (quadriplegia, anarthria, preserved consciousness and vertical eye movements). Which structure is most likely affected?',
      options: [
        'Midbrain',
        'Ventral pons',
        'Medulla',
        'Thalamus',
      ],
      correctIndex: 1,
      explanation:
          'Locked-in syndrome results from ventral pontine infarction (typically basilar artery occlusion), destroying the corticospinal and corticobulbar tracts while sparing the reticular activating system and vertical gaze centers in the midbrain.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Weber syndrome (medial midbrain syndrome) presents with which combination of findings?',
      options: [
        'Ipsilateral CN III palsy with contralateral hemiparesis',
        'Ipsilateral CN VI palsy with contralateral hemiparesis',
        'Ipsilateral Horner syndrome with contralateral hemiparesis',
        'Ipsilateral CN VII palsy with contralateral hemiparesis',
      ],
      correctIndex: 0,
      explanation:
          'Weber syndrome results from medial midbrain infarction affecting the cerebral peduncle (contralateral hemiparesis) and CN III fascicles (ipsilateral oculomotor palsy with ptosis and "down and out" eye).',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A pure motor hemiparesis lacunar syndrome most commonly localizes to which structure?',
      options: [
        'Thalamus',
        'Caudate nucleus',
        'Posterior limb of the internal capsule',
        'Cerebral cortex',
      ],
      correctIndex: 2,
      explanation:
          'Pure motor hemiparesis is the most common lacunar syndrome, usually caused by a small vessel infarct in the posterior limb of the internal capsule or basis pontis, affecting the corticospinal tract.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Which lacunar syndrome presents with contralateral hemiparesis AND hemisensory loss without cortical signs?',
      options: [
        'Pure motor hemiparesis',
        'Pure sensory stroke',
        'Sensorimotor stroke',
        'Ataxic hemiparesis',
      ],
      correctIndex: 2,
      explanation:
          'Sensorimotor lacunar stroke involves the posterior limb of the internal capsule and adjacent thalamus, producing combined motor and sensory deficits without cortical signs (aphasia, neglect, hemianopia).',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),

    // ── Diagnostic Studies ───────────────────────────────────────────
    QuizQuestion(
      question:
          'Which MRI sequence is most sensitive for detecting acute ischemic stroke within the first 6 hours?',
      options: [
        'T1-weighted',
        'T2-weighted',
        'FLAIR',
        'Diffusion-weighted imaging (DWI)',
      ],
      correctIndex: 3,
      explanation:
          'DWI detects restricted diffusion caused by cytotoxic edema within minutes of ischemic onset. It is the most sensitive sequence for hyperacute ischemic stroke, far surpassing CT and conventional MRI sequences.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The NIH Stroke Scale (NIHSS) assesses all of the following EXCEPT:',
      options: [
        'Level of consciousness',
        'Visual fields',
        'Memory',
        'Limb ataxia',
      ],
      correctIndex: 2,
      explanation:
          'The NIHSS does not assess memory. It evaluates: consciousness, gaze, visual fields, facial palsy, motor arm/leg, limb ataxia, sensory, language, dysarthria, and extinction/inattention.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Carotid duplex ultrasound is most useful for evaluating which stroke mechanism?',
      options: [
        'Cardioembolic stroke',
        'Large vessel atherosclerotic disease',
        'Small vessel lacunar disease',
        'Cerebral venous sinus thrombosis',
      ],
      correctIndex: 1,
      explanation:
          'Carotid duplex ultrasound is the initial non-invasive test of choice for evaluating extracranial carotid stenosis due to atherosclerotic disease, a major mechanism of ischemic stroke.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),

    // ── tPA / Acute Management ───────────────────────────────────────
    QuizQuestion(
      question:
          'What is the recommended time window for IV alteplase (tPA) administration in acute ischemic stroke?',
      options: [
        'Within 2 hours of symptom onset',
        'Within 3 hours (up to 4.5 hours in select patients)',
        'Within 6 hours of symptom onset',
        'Within 12 hours of symptom onset',
      ],
      correctIndex: 1,
      explanation:
          'IV alteplase is approved within 3 hours of symptom onset. The AHA/ASA guidelines extend the window to 4.5 hours for select patients, though with additional exclusion criteria (age >80, NIHSS >25, oral anticoagulant use, history of both stroke and diabetes).',
      moduleId: 'acute_mgmt',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which of the following is an absolute contraindication to IV tPA?',
      options: [
        'Blood glucose of 300 mg/dL',
        'NIHSS score of 4',
        'Platelet count of 90,000/microL',
        'Active internal bleeding',
      ],
      correctIndex: 3,
      explanation:
          'Active internal bleeding is an absolute contraindication to IV tPA. Platelet count <100,000 is also a contraindication. Hyperglycemia and low NIHSS are relative considerations but not absolute contraindications.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the recommended dose of IV alteplase for acute ischemic stroke?',
      options: [
        '0.6 mg/kg, max 60 mg',
        '0.9 mg/kg, max 90 mg',
        '1.0 mg/kg, max 100 mg',
        '1.5 mg/kg, max 150 mg',
      ],
      correctIndex: 1,
      explanation:
          'The standard dose is 0.9 mg/kg (max 90 mg), with 10% given as an IV bolus over 1 minute and the remainder infused over 60 minutes.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Blood pressure must be below what threshold before administering IV tPA?',
      options: [
        '160/90 mmHg',
        '180/105 mmHg',
        '185/110 mmHg',
        '220/120 mmHg',
      ],
      correctIndex: 2,
      explanation:
          'Blood pressure must be <185/110 mmHg before tPA and maintained <180/105 mmHg for 24 hours after tPA administration to reduce hemorrhagic transformation risk.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Mechanical thrombectomy is indicated for large vessel occlusion in the anterior circulation within what time window, per AHA guidelines?',
      options: [
        'Up to 4.5 hours',
        'Up to 6 hours',
        'Up to 24 hours with appropriate imaging selection',
        'Up to 48 hours',
      ],
      correctIndex: 2,
      explanation:
          'The DAWN and DEFUSE 3 trials extended the thrombectomy window to 24 hours for select patients with large vessel occlusion who demonstrate favorable perfusion imaging (mismatch between infarct core and penumbra).',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In acute ischemic stroke NOT treated with tPA, permissive hypertension is allowed up to what blood pressure?',
      options: [
        '185/110 mmHg',
        '200/110 mmHg',
        '220/120 mmHg',
        '240/130 mmHg',
      ],
      correctIndex: 2,
      explanation:
          'In patients not receiving thrombolytics, blood pressure is generally not treated unless >220/120 mmHg, to maintain cerebral perfusion to the ischemic penumbra (permissive hypertension).',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Decompressive hemicraniectomy for malignant MCA infarction has the best outcomes when performed within what time frame in patients under age 60?',
      options: [
        '12 hours',
        '24 hours',
        '48 hours',
        '72 hours',
      ],
      correctIndex: 2,
      explanation:
          'Randomized trials (DECIMAL, DESTINY, HAMLET) showed that decompressive hemicraniectomy within 48 hours of malignant MCA infarction in patients aged 18-60 significantly reduces mortality and improves functional outcomes.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),

    // ── Anticoagulation / Secondary Prevention ───────────────────────
    QuizQuestion(
      question:
          'For secondary stroke prevention in atrial fibrillation, which medication class is preferred over warfarin?',
      options: [
        'Antiplatelet agents',
        'Direct oral anticoagulants (DOACs)',
        'Low-molecular-weight heparin',
        'GP IIb/IIIa inhibitors',
      ],
      correctIndex: 1,
      explanation:
          'DOACs (dabigatran, rivaroxaban, apixaban, edoxaban) are preferred over warfarin for nonvalvular atrial fibrillation due to similar or superior efficacy, lower risk of intracranial hemorrhage, and no need for routine INR monitoring.',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Dual antiplatelet therapy (aspirin + clopidogrel) for minor ischemic stroke or high-risk TIA should be initiated within what time frame and continued for how long?',
      options: [
        'Within 12 hours, for 90 days',
        'Within 24 hours, for 21 days',
        'Within 48 hours, for 30 days',
        'Within 72 hours, for 14 days',
      ],
      correctIndex: 1,
      explanation:
          'Per the CHANCE and POINT trials, dual antiplatelet therapy (aspirin + clopidogrel) should be started within 24 hours of minor stroke (NIHSS <=3) or high-risk TIA and continued for 21 days, then transition to single antiplatelet therapy.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Carotid endarterectomy (CEA) is clearly beneficial for symptomatic carotid stenosis of what degree?',
      options: [
        '30-49%',
        '50-69%',
        '70-99%',
        'Only complete occlusion',
      ],
      correctIndex: 2,
      explanation:
          'The NASCET trial demonstrated clear benefit of CEA for symptomatic carotid stenosis of 70-99%. Moderate benefit exists for 50-69%. CEA should be performed within 2 weeks of the index event for maximum benefit.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),

    // ── Motor Recovery / Brunnstrom Stages ───────────────────────────
    QuizQuestion(
      question:
          'According to Brunnstrom stages of motor recovery, which stage is characterized by the emergence of spasticity and synergy patterns?',
      options: [
        'Stage 1 (flaccidity)',
        'Stage 2 (spasticity begins)',
        'Stage 3 (spasticity peaks, synergy patterns)',
        'Stage 4 (spasticity decreases)',
      ],
      correctIndex: 2,
      explanation:
          'Brunnstrom Stage 3 is characterized by peak spasticity and the ability to perform voluntary movement only within synergy patterns (flexor synergy of the upper extremity, extensor synergy of the lower extremity).',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The typical upper extremity flexor synergy pattern after stroke includes all of the following EXCEPT:',
      options: [
        'Shoulder abduction and external rotation',
        'Elbow flexion',
        'Forearm supination',
        'Wrist and finger flexion',
      ],
      correctIndex: 0,
      explanation:
          'The upper extremity flexor synergy includes shoulder adduction, internal rotation, and elevation (NOT abduction/external rotation), elbow flexion, forearm supination, and wrist/finger flexion.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The most rapid neurological recovery after stroke typically occurs during which time period?',
      options: [
        'First 24 hours',
        'First 3 months',
        '3-6 months',
        '6-12 months',
      ],
      correctIndex: 1,
      explanation:
          'The most rapid neurological recovery occurs during the first 3 months post-stroke, driven by resolution of diaschisis, perilesional reorganization, and neural plasticity. Meaningful recovery can continue beyond this period but at a slower rate.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),

    // ── Spasticity ───────────────────────────────────────────────────
    QuizQuestion(
      question:
          'Spasticity is defined as a velocity-dependent increase in muscle tone due to hyperexcitability of which reflex?',
      options: [
        'Golgi tendon organ reflex',
        'Stretch reflex (muscle spindle)',
        'Withdrawal reflex',
        'Crossed extensor reflex',
      ],
      correctIndex: 1,
      explanation:
          'Spasticity is a velocity-dependent increase in tonic stretch reflexes (muscle spindle) due to upper motor neuron lesion, resulting in hyperexcitability of the stretch reflex arc. This is the classic Lance definition.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which medication is considered first-line oral treatment for generalized post-stroke spasticity?',
      options: [
        'Dantrolene',
        'Baclofen',
        'Tizanidine',
        'Diazepam',
      ],
      correctIndex: 1,
      explanation:
          'Baclofen (a GABA-B agonist) is typically considered first-line for generalized spasticity. Tizanidine (alpha-2 agonist) is an alternative. Dantrolene acts peripherally on muscle. Diazepam is effective but limited by sedation and dependence.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Botulinum toxin injection for focal spasticity works by which mechanism?',
      options: [
        'Blocking acetylcholine release at the neuromuscular junction',
        'Directly relaxing muscle fibers',
        'Inhibiting spinal interneurons',
        'Blocking calcium channels in the sarcoplasmic reticulum',
      ],
      correctIndex: 0,
      explanation:
          'Botulinum toxin cleaves SNARE proteins required for acetylcholine vesicle fusion at the presynaptic terminal of the neuromuscular junction, causing chemical denervation and focal reduction of muscle tone.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),

    // ── Dysphagia ────────────────────────────────────────────────────
    QuizQuestion(
      question:
          'What is the gold standard study for evaluating oropharyngeal dysphagia after stroke?',
      options: [
        'Bedside swallow evaluation',
        'Fiberoptic endoscopic evaluation of swallowing (FEES)',
        'Videofluoroscopic swallow study (VFSS/modified barium swallow)',
        'Esophageal manometry',
      ],
      correctIndex: 2,
      explanation:
          'The videofluoroscopic swallow study (modified barium swallow) is considered the gold standard for evaluating oropharyngeal dysphagia, allowing real-time visualization of all phases of swallowing and aspiration.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Silent aspiration is defined as aspiration without which response?',
      options: [
        'Gagging',
        'Coughing',
        'Tearing',
        'Choking sensation',
      ],
      correctIndex: 1,
      explanation:
          'Silent aspiration is penetration of material below the vocal folds without triggering a cough reflex. It is particularly dangerous because it is clinically undetectable at bedside and occurs in up to 40-70% of dysphagic stroke patients.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Aspiration pneumonia is the leading cause of death in which time period after stroke?',
      options: [
        'First 24 hours',
        'First week',
        'First 30 days',
        'First year',
      ],
      correctIndex: 2,
      explanation:
          'Aspiration pneumonia is a leading cause of death within the first 30 days after stroke. Dysphagia screening should be performed before any oral intake to reduce aspiration risk.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),

    // ── Aphasia ──────────────────────────────────────────────────────
    QuizQuestion(
      question:
          'Broca aphasia is characterized by which of the following?',
      options: [
        'Fluent speech with impaired comprehension',
        'Non-fluent speech with relatively preserved comprehension',
        'Fluent speech with preserved comprehension but impaired repetition',
        'Non-fluent speech with impaired comprehension',
      ],
      correctIndex: 1,
      explanation:
          'Broca (expressive/non-fluent) aphasia features effortful, telegraphic, non-fluent speech with relatively preserved auditory comprehension. The lesion is in the posterior inferior frontal gyrus (Brodmann areas 44-45) of the dominant hemisphere.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Wernicke aphasia is localized to which brain region?',
      options: [
        'Inferior frontal gyrus',
        'Superior temporal gyrus (posterior)',
        'Angular gyrus',
        'Supplementary motor area',
      ],
      correctIndex: 1,
      explanation:
          'Wernicke area is located in the posterior portion of the superior temporal gyrus (Brodmann area 22) of the dominant hemisphere. Damage produces fluent but meaningless speech (paraphasias, neologisms) with severely impaired comprehension.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which type of aphasia features fluent speech, impaired comprehension, AND impaired repetition?',
      options: [
        'Broca aphasia',
        'Wernicke aphasia',
        'Transcortical motor aphasia',
        'Conduction aphasia',
      ],
      correctIndex: 1,
      explanation:
          'Wernicke aphasia features fluent speech (often with paraphasias), impaired comprehension, and impaired repetition. Transcortical aphasias (motor and sensory) have preserved repetition. Conduction aphasia has impaired repetition but preserved comprehension.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Conduction aphasia results from damage to which structure?',
      options: [
        'Broca area',
        'Wernicke area',
        'Arcuate fasciculus',
        'Angular gyrus',
      ],
      correctIndex: 2,
      explanation:
          'Conduction aphasia results from damage to the arcuate fasciculus, the white matter tract connecting Wernicke and Broca areas. It presents with fluent speech, preserved comprehension, but severely impaired repetition.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Global aphasia typically results from occlusion of which artery?',
      options: [
        'Anterior cerebral artery',
        'Middle cerebral artery (dominant hemisphere)',
        'Posterior cerebral artery',
        'Basilar artery',
      ],
      correctIndex: 1,
      explanation:
          'Global aphasia (loss of all language function: non-fluent speech, impaired comprehension, impaired repetition) typically results from a large dominant-hemisphere MCA infarction affecting both Broca and Wernicke areas.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),

    // ── CRPS ─────────────────────────────────────────────────────────
    QuizQuestion(
      question:
          'Complex regional pain syndrome (CRPS) in the hemiplegic upper extremity after stroke is also historically known as:',
      options: [
        'Frozen shoulder',
        'Shoulder-hand syndrome',
        'Rotator cuff tendinopathy',
        'Thoracic outlet syndrome',
      ],
      correctIndex: 1,
      explanation:
          'CRPS Type I in the hemiplegic upper extremity is historically called shoulder-hand syndrome (or reflex sympathetic dystrophy). It presents with pain, edema, vasomotor changes, and trophic changes in the affected hand and shoulder.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Shoulder subluxation after stroke most commonly occurs in which direction?',
      options: [
        'Anterior',
        'Posterior',
        'Inferior',
        'Superior',
      ],
      correctIndex: 2,
      explanation:
          'Inferior subluxation is most common after stroke due to loss of supraspinatus and deltoid muscle tone (which normally maintain the humeral head in the glenoid fossa) during the flaccid phase.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),

    // ── DVT Prophylaxis ──────────────────────────────────────────────
    QuizQuestion(
      question:
          'Which DVT prophylaxis method is recommended for immobilized acute ischemic stroke patients?',
      options: [
        'Aspirin alone',
        'Intermittent pneumatic compression devices',
        'Elastic compression stockings',
        'Early weight-bearing only',
      ],
      correctIndex: 1,
      explanation:
          'Intermittent pneumatic compression (IPC) devices are recommended for DVT prophylaxis in immobilized acute stroke patients. The CLOTS 3 trial demonstrated their efficacy. Subcutaneous heparin/LMWH may be used but increases bleeding risk. Elastic stockings are NOT recommended (CLOTS 1 and 2 trials).',
      moduleId: 'acute_mgmt',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The CLOTS trials demonstrated that graduated compression stockings (GCS) in immobilized stroke patients:',
      options: [
        'Significantly reduce DVT risk',
        'Do not reduce DVT risk and may increase skin complications',
        'Reduce mortality at 6 months',
        'Are equivalent to low-molecular-weight heparin',
      ],
      correctIndex: 1,
      explanation:
          'The CLOTS 1 and 2 trials showed that thigh-length and below-knee graduated compression stockings did NOT significantly reduce DVT in stroke patients and were associated with increased skin breakdown. IPC devices were effective (CLOTS 3).',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),

    // ── Outcomes / Prognosis ─────────────────────────────────────────
    QuizQuestion(
      question:
          'The Functional Independence Measure (FIM) assesses function across how many domains?',
      options: [
        '10 items across 2 domains',
        '18 items across 6 domains',
        '30 items across 4 domains',
        '12 items across 3 domains',
      ],
      correctIndex: 1,
      explanation:
          'The FIM assesses 18 items across 6 domains: self-care (6), sphincter control (2), transfers (3), locomotion (2), communication (2), and social cognition (3). Each item is scored 1-7 (total 18-126).',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The modified Rankin Scale (mRS) ranges from:',
      options: [
        '0 (no symptoms) to 5 (severe disability)',
        '0 (no symptoms) to 6 (dead)',
        '1 (no disability) to 7 (dead)',
        '0 (dead) to 5 (no symptoms)',
      ],
      correctIndex: 1,
      explanation:
          'The mRS ranges from 0 (no symptoms) to 6 (dead). Scores of 0-2 generally indicate functional independence. It is the most commonly used primary outcome measure in stroke clinical trials.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which of the following is the strongest predictor of functional outcome after stroke?',
      options: [
        'Patient age',
        'Initial stroke severity (NIHSS)',
        'Lesion side (left vs right)',
        'Time to rehabilitation',
      ],
      correctIndex: 1,
      explanation:
          'Initial stroke severity, as measured by the NIHSS, is consistently the strongest predictor of functional outcome after stroke. Higher NIHSS scores correlate with worse outcomes.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Post-stroke depression affects approximately what percentage of stroke survivors?',
      options: ['5-10%', '15-20%', '30-35%', '50-60%'],
      correctIndex: 2,
      explanation:
          'Post-stroke depression affects approximately one-third (30-35%) of stroke survivors. It is associated with worse functional outcomes, increased mortality, and should be screened for and treated with SSRIs or SNRIs.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),

    // ── Additional Board-Level Questions ─────────────────────────────
    QuizQuestion(
      question:
          'The watershed (border zone) infarcts occur at the junction of which vascular territories?',
      options: [
        'Anterior and middle cerebral arteries only',
        'ACA-MCA and MCA-PCA border zones',
        'Basilar and vertebral arteries',
        'Internal and external carotid arteries',
      ],
      correctIndex: 1,
      explanation:
          'Watershed infarcts occur at the border zones between major vascular territories (ACA-MCA and MCA-PCA). They are typically caused by systemic hypotension or severe carotid stenosis with inadequate collateral flow.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A patient on warfarin with an INR of 8.5 presents with acute intracerebral hemorrhage. What is the most appropriate initial reversal agent?',
      options: [
        'Fresh frozen plasma only',
        '4-factor prothrombin complex concentrate (PCC) plus IV vitamin K',
        'Recombinant factor VIIa alone',
        'Protamine sulfate',
      ],
      correctIndex: 1,
      explanation:
          '4-factor PCC provides rapid, complete reversal of warfarin and is preferred over FFP for warfarin-associated ICH. IV vitamin K (10 mg) should be given concurrently for sustained reversal. Protamine reverses heparin, not warfarin.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Idarucizumab is the specific reversal agent for which anticoagulant?',
      options: [
        'Warfarin',
        'Rivaroxaban',
        'Dabigatran',
        'Enoxaparin',
      ],
      correctIndex: 2,
      explanation:
          'Idarucizumab (Praxbind) is a monoclonal antibody fragment that specifically binds and reverses dabigatran (a direct thrombin inhibitor). Andexanet alfa reverses factor Xa inhibitors (rivaroxaban, apixaban).',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Constraint-induced movement therapy (CIMT) is most appropriate for stroke patients who have:',
      options: [
        'Complete upper extremity plegia',
        'At least 20 degrees of active wrist extension and 10 degrees of finger extension',
        'Severe spasticity (Modified Ashworth 4)',
        'Locked-in syndrome',
      ],
      correctIndex: 1,
      explanation:
          'CIMT requires patients to have at least 20 degrees of active wrist extension and 10 degrees of active finger extension in the affected hand. It involves constraining the unaffected arm while intensively training the affected arm.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Hemispatial neglect is most commonly associated with lesions in which hemisphere?',
      options: [
        'Left (dominant)',
        'Right (non-dominant)',
        'Either hemisphere equally',
        'Posterior fossa',
      ],
      correctIndex: 1,
      explanation:
          'Hemispatial neglect (typically left-sided) is far more common and persistent with right (non-dominant) hemisphere lesions, particularly involving the right parietal lobe, temporoparietal junction, or frontal lobe.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Central post-stroke pain (Dejerine-Roussy syndrome) is associated with infarction of which structure?',
      options: [
        'Putamen',
        'Caudate nucleus',
        'Thalamus',
        'Cerebellum',
      ],
      correctIndex: 2,
      explanation:
          'Dejerine-Roussy syndrome (thalamic pain syndrome) results from thalamic infarction (typically ventral posterolateral nucleus). It produces contralateral burning, dysesthetic pain that is often refractory to standard analgesics. Amitriptyline or gabapentin may help.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which scale is used to assess severity of hemorrhagic stroke and predict 30-day mortality?',
      options: [
        'NIHSS',
        'ICH Score',
        'Hunt and Hess Scale',
        'Glasgow Coma Scale only',
      ],
      correctIndex: 1,
      explanation:
          'The ICH Score incorporates GCS, ICH volume, intraventricular hemorrhage, infratentorial origin, and age to predict 30-day mortality in spontaneous intracerebral hemorrhage. Hunt-Hess and Fisher scales are for subarachnoid hemorrhage.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Early supported discharge (ESD) after stroke has been shown to:',
      options: [
        'Increase mortality',
        'Reduce length of hospital stay with equivalent or better outcomes',
        'Increase readmission rates',
        'Be inferior to prolonged inpatient rehabilitation',
      ],
      correctIndex: 1,
      explanation:
          'Cochrane reviews demonstrate that ESD services reduce length of hospital stay and long-term dependency with no increase in readmissions or mortality, particularly for patients with mild-to-moderate disability.',
      moduleId: 'fundamentals',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The Barthel Index measures which of the following?',
      options: [
        'Cognitive function',
        'Activities of daily living (ADLs)',
        'Quality of life',
        'Motor recovery stage',
      ],
      correctIndex: 1,
      explanation:
          'The Barthel Index is a 10-item ordinal scale (0-100) measuring performance in basic ADLs: feeding, bathing, grooming, dressing, bowel/bladder control, toilet use, transfers, mobility, and stair climbing.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Pseudobulbar affect (pathological laughing/crying) after stroke is best treated with which medication?',
      options: [
        'Haloperidol',
        'Dextromethorphan/quinidine',
        'Methylphenidate',
        'Carbamazepine',
      ],
      correctIndex: 1,
      explanation:
          'Dextromethorphan/quinidine (Nuedexta) is FDA-approved for pseudobulbar affect. SSRIs and tricyclic antidepressants are also commonly used. The condition results from disruption of corticobulbar pathways.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which of the following hemorrhagic stroke presentations warrants emergent surgical evacuation?',
      options: [
        'Small putaminal hemorrhage with mild symptoms',
        'Cerebellar hemorrhage >3 cm with brainstem compression',
        'Thalamic hemorrhage with intraventricular extension',
        'Lobar hemorrhage in a comatose patient with bilateral fixed pupils',
      ],
      correctIndex: 1,
      explanation:
          'Cerebellar hemorrhage >3 cm (or with brainstem compression or hydrocephalus) requires emergent surgical evacuation because rapid deterioration can occur. Putaminal hemorrhages are generally managed medically. Thalamic hemorrhages are deep and not surgically accessible.',
      moduleId: 'acute_mgmt',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Hemianopia after a PCA stroke can be differentiated from an MCA stroke homonymous hemianopia by:',
      options: [
        'Hemianopia only occurs in PCA strokes',
        'MCA strokes typically spare the macula; PCA strokes do not',
        'PCA strokes typically have macular sparing; MCA strokes may not',
        'The side of the visual field defect is different',
      ],
      correctIndex: 2,
      explanation:
          'PCA strokes affecting the occipital cortex often demonstrate macular sparing because the macular region of the visual cortex has dual blood supply (PCA and MCA). MCA strokes affecting the optic radiations typically do not spare the macula.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
  ];
}
