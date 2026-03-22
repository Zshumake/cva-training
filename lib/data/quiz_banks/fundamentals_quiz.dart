import '../../core/models/quiz_model.dart';

class FundamentalsQuiz {
  FundamentalsQuiz._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      question:
          'Which of the following is the most common modifiable risk factor for both ischemic and hemorrhagic stroke?',
      options: [
        'Diabetes mellitus',
        'Hypertension',
        'Hyperlipidemia',
        'Smoking',
      ],
      correctIndex: 1,
      explanation:
          'Hypertension is the single most important modifiable risk factor for stroke, contributing to approximately 70% of all strokes. It accelerates atherosclerosis and promotes lipohyalinosis of small penetrating arteries.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Approximately what percentage of all strokes are ischemic?',
      options: ['60%', '75%', '87%', '95%'],
      correctIndex: 2,
      explanation:
          'Approximately 87% of strokes are ischemic. Hemorrhagic strokes account for the remaining 13% (about 10% intracerebral hemorrhage and 3% subarachnoid hemorrhage).',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which cerebral artery supplies the lateral surface of the hemisphere including the face and arm areas of the motor cortex?',
      options: [
        'Anterior cerebral artery',
        'Middle cerebral artery',
        'Posterior cerebral artery',
        'Anterior choroidal artery',
      ],
      correctIndex: 1,
      explanation:
          'The MCA supplies the lateral convexity of the hemisphere, including the motor and sensory cortex for the face and upper extremity, the language areas (dominant hemisphere), and the insular cortex.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The anterior cerebral artery supplies the motor and sensory cortex for which body region?',
      options: [
        'Face',
        'Upper extremity',
        'Lower extremity',
        'Trunk only',
      ],
      correctIndex: 2,
      explanation:
          'The ACA supplies the medial surface of the frontal and parietal lobes, which corresponds to the lower extremity representation on the cortical homunculus. ACA strokes classically cause contralateral leg-predominant weakness.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The circle of Willis connects the anterior and posterior circulation via which arteries?',
      options: [
        'Ophthalmic arteries',
        'Posterior communicating arteries',
        'Superior cerebellar arteries',
        'Anterior choroidal arteries',
      ],
      correctIndex: 1,
      explanation:
          'The posterior communicating arteries connect the internal carotid arteries (anterior circulation) to the posterior cerebral arteries (posterior circulation), completing the circle of Willis and providing potential collateral flow.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'A transient ischemic attack (TIA) is defined as a transient episode of neurological dysfunction caused by focal brain ischemia lasting typically less than:',
      options: ['5 minutes', '1 hour', '24 hours', '72 hours'],
      correctIndex: 1,
      explanation:
          'The modern tissue-based definition of TIA is a transient episode of neurological dysfunction caused by focal ischemia without acute infarction. Most TIAs last less than 1 hour. The older time-based definition used 24 hours, but DWI-positive lesions can be found in many patients whose symptoms resolved before 24 hours.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which non-contrast imaging study is the first-line investigation in acute stroke to rule out hemorrhage?',
      options: [
        'MRI brain',
        'CT angiography',
        'Non-contrast CT head',
        'Transcranial Doppler',
      ],
      correctIndex: 2,
      explanation:
          'Non-contrast CT head is the first-line imaging study in acute stroke. It rapidly identifies hemorrhage (which appears hyperdense) and must be obtained before thrombolytic therapy. CT is widely available and fast, making it ideal for the emergent setting.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Diffusion-weighted imaging (DWI) on MRI detects ischemic stroke by identifying:',
      options: [
        'Vasogenic edema',
        'Cytotoxic edema with restricted water diffusion',
        'Blood-brain barrier breakdown',
        'Cerebral blood flow changes',
      ],
      correctIndex: 1,
      explanation:
          'DWI detects restricted water diffusion caused by cytotoxic edema (intracellular water accumulation) in ischemic tissue. This occurs within minutes of onset, making DWI the most sensitive sequence for hyperacute ischemic stroke.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The NIH Stroke Scale (NIHSS) is used primarily to:',
      options: [
        'Diagnose the type of stroke',
        'Quantify neurological deficit severity',
        'Predict long-term quality of life',
        'Determine rehabilitation placement',
      ],
      correctIndex: 1,
      explanation:
          'The NIHSS is a standardized clinical assessment tool that quantifies the severity of neurological deficits in acute stroke. Scores range from 0 to 42. It is used to guide treatment decisions (e.g., tPA eligibility) and predict outcomes.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which of the following is the most common mechanism of ischemic stroke?',
      options: [
        'Cardioembolism',
        'Large artery atherosclerosis',
        'Small vessel (lacunar) disease',
        'Arterial dissection',
      ],
      correctIndex: 0,
      explanation:
          'Cardioembolism accounts for approximately 20-30% of ischemic strokes and is the most common identifiable mechanism, followed by large artery atherosclerosis (about 20%) and small vessel disease (about 25%). However, cryptogenic stroke (unknown cause) accounts for up to 30%.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The TOAST classification of ischemic stroke subtypes includes all of the following EXCEPT:',
      options: [
        'Large artery atherosclerosis',
        'Cardioembolism',
        'Hemorrhagic transformation',
        'Small vessel occlusion (lacunar)',
      ],
      correctIndex: 2,
      explanation:
          'The TOAST classification includes: (1) large artery atherosclerosis, (2) cardioembolism, (3) small vessel occlusion, (4) stroke of other determined etiology, and (5) stroke of undetermined etiology. Hemorrhagic transformation is a complication, not a subtype.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The modified Rankin Scale (mRS) is primarily used to measure:',
      options: [
        'Stroke severity at presentation',
        'Global disability and functional outcome',
        'Cognitive function',
        'Depression severity',
      ],
      correctIndex: 1,
      explanation:
          'The mRS (0-6) is a global disability scale and the most widely used primary outcome measure in stroke clinical trials. Scores 0-2 indicate functional independence, 3-5 indicate increasing dependence, and 6 is death.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'The Functional Independence Measure (FIM) scores each item on a scale of:',
      options: [
        '0 to 5',
        '1 to 7',
        '0 to 10',
        '1 to 4',
      ],
      correctIndex: 1,
      explanation:
          'Each of the 18 FIM items is scored from 1 (total assistance) to 7 (complete independence). Total scores range from 18 to 126. FIM scores are strong predictors of discharge destination and caregiver burden.',
      moduleId: 'fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which of the following is the strongest single predictor of functional outcome after stroke?',
      options: [
        'Age',
        'Premorbid functional status',
        'Initial stroke severity (NIHSS)',
        'Lesion volume on MRI',
      ],
      correctIndex: 2,
      explanation:
          'Initial stroke severity, as quantified by the NIHSS, is consistently the strongest individual predictor of short- and long-term functional outcomes after stroke. Higher NIHSS scores correlate with worse outcomes and longer rehabilitation stays.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Lacunar infarcts result from occlusion of which type of vessels?',
      options: [
        'Large cortical arteries',
        'Small penetrating arterioles',
        'Venous sinuses',
        'Meningeal arteries',
      ],
      correctIndex: 1,
      explanation:
          'Lacunar infarcts (typically <15 mm) result from occlusion of small penetrating arterioles (lenticulostriate, thalamoperforating, pontine perforating) due to lipohyalinosis or microatheroma, most commonly associated with chronic hypertension and diabetes.',
      moduleId: 'fundamentals',
      difficulty: 'intermediate',
    ),
  ];
}
