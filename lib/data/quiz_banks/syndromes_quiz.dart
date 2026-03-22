import '../../core/models/quiz_model.dart';

class SyndromesQuiz {
  SyndromesQuiz._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      question:
          'A patient presents with contralateral face and arm weakness greater than leg, homonymous hemianopia, and Wernicke aphasia. Which vascular territory is most likely affected?',
      options: [
        'Anterior cerebral artery (dominant)',
        'Middle cerebral artery (dominant)',
        'Posterior cerebral artery (dominant)',
        'Basilar artery',
      ],
      correctIndex: 1,
      explanation:
          'The dominant MCA supplies the lateral cortex including the face/arm motor strip, Wernicke area (posterior superior temporal gyrus), and optic radiations. This combination of findings is classic for a dominant MCA territory infarction.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient presents with contralateral leg-predominant weakness, abulia, and urinary incontinence. Which artery is occluded?',
      options: [
        'Middle cerebral artery',
        'Anterior cerebral artery',
        'Posterior cerebral artery',
        'Anterior choroidal artery',
      ],
      correctIndex: 1,
      explanation:
          'The ACA supplies the medial frontal and parietal lobes. Occlusion causes contralateral leg weakness (medial motor strip), abulia/apathy (medial frontal lobe), and urinary incontinence (damage to the medial frontal micturition center).',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Lateral medullary (Wallenberg) syndrome includes all of the following EXCEPT:',
      options: [
        'Ipsilateral Horner syndrome',
        'Contralateral body pain and temperature loss',
        'Ipsilateral hemiparesis',
        'Dysphagia and hoarseness',
      ],
      correctIndex: 2,
      explanation:
          'Wallenberg syndrome (PICA/vertebral artery occlusion) does NOT cause hemiparesis because the medullary pyramids (corticospinal tract) are located medially and are spared. Key features: ipsilateral Horner, ipsilateral facial and contralateral body pain/temperature loss, cerebellar ataxia, dysphagia, vertigo.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Medial medullary (Dejerine) syndrome is characterized by which triad?',
      options: [
        'Ipsilateral tongue deviation, contralateral hemiparesis, contralateral loss of proprioception',
        'Ipsilateral Horner syndrome, dysphagia, contralateral hemisensory loss',
        'Bilateral leg weakness, urinary retention, sensory level',
        'Ipsilateral facial palsy, contralateral hemiparesis, lateral gaze palsy',
      ],
      correctIndex: 0,
      explanation:
          'Medial medullary syndrome affects the hypoglossal nucleus/nerve (ipsilateral tongue deviation), the medullary pyramid (contralateral hemiparesis), and the medial lemniscus (contralateral proprioception/vibration loss).',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Weber syndrome (medial midbrain infarction) presents with:',
      options: [
        'Ipsilateral CN III palsy with contralateral hemiparesis',
        'Ipsilateral CN VI and VII palsy with contralateral hemiparesis',
        'Bilateral ptosis with vertical gaze palsy',
        'Ipsilateral Horner syndrome with contralateral ataxia',
      ],
      correctIndex: 0,
      explanation:
          'Weber syndrome results from infarction of the medial midbrain affecting the CN III fascicles (ipsilateral oculomotor palsy: ptosis, mydriasis, "down and out" eye) and cerebral peduncle (contralateral hemiparesis).',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Locked-in syndrome is caused by infarction of which structure?',
      options: [
        'Bilateral thalami',
        'Ventral pons (bilateral basis pontis)',
        'Midbrain tegmentum',
        'Bilateral medial medulla',
      ],
      correctIndex: 1,
      explanation:
          'Locked-in syndrome results from bilateral ventral pontine infarction (usually basilar artery occlusion), destroying corticospinal and corticobulbar tracts. Consciousness is preserved (reticular formation is dorsal). Only vertical eye movements and blinking are retained.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which of the following is the most common lacunar stroke syndrome?',
      options: [
        'Pure sensory stroke',
        'Ataxic hemiparesis',
        'Pure motor hemiparesis',
        'Dysarthria-clumsy hand syndrome',
      ],
      correctIndex: 2,
      explanation:
          'Pure motor hemiparesis is the most common lacunar syndrome, typically caused by an infarct in the posterior limb of the internal capsule or basis pontis. It presents with contralateral face, arm, and leg weakness without sensory, visual, or cortical deficits.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Broca aphasia is characterized by:',
      options: [
        'Fluent speech with poor comprehension and poor repetition',
        'Non-fluent speech with preserved comprehension and poor repetition',
        'Fluent speech with preserved comprehension and poor repetition',
        'Non-fluent speech with poor comprehension and preserved repetition',
      ],
      correctIndex: 1,
      explanation:
          'Broca aphasia (expressive/non-fluent): effortful, telegraphic speech; relatively preserved comprehension; impaired repetition. Lesion is in the posterior inferior frontal gyrus (Brodmann 44-45) of the dominant hemisphere.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which aphasia type has fluent speech, poor comprehension, poor repetition, and the patient is often unaware of their deficit?',
      options: [
        'Broca aphasia',
        'Wernicke aphasia',
        'Conduction aphasia',
        'Transcortical sensory aphasia',
      ],
      correctIndex: 1,
      explanation:
          'Wernicke aphasia (receptive/fluent): speech is fluent but filled with paraphasias and neologisms; comprehension and repetition are impaired; patients often have anosognosia for their language deficit. Lesion is in the posterior superior temporal gyrus.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Conduction aphasia results from a lesion of the arcuate fasciculus. What is its hallmark finding?',
      options: [
        'Non-fluent speech',
        'Impaired comprehension',
        'Disproportionately impaired repetition with preserved fluency and comprehension',
        'Preserved repetition with impaired comprehension',
      ],
      correctIndex: 2,
      explanation:
          'Conduction aphasia: fluent speech, preserved comprehension, but severely impaired repetition (especially for multisyllabic words and phrases). The arcuate fasciculus connects Wernicke area to Broca area.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Hemispatial neglect is most commonly and severely seen with lesions of which hemisphere?',
      options: [
        'Left (dominant) hemisphere',
        'Right (non-dominant) hemisphere',
        'Either hemisphere equally',
        'Bilateral hemispheres only',
      ],
      correctIndex: 1,
      explanation:
          'Left hemispatial neglect from right (non-dominant) hemisphere lesions is more common and persistent than right neglect from left hemisphere lesions. Key areas: right parietal lobe, temporoparietal junction, frontal lobe, and subcortical structures.',
      moduleId: 'syndromes',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'A patient with a PCA stroke presents with contralateral homonymous hemianopia and can write but cannot read. This syndrome is called:',
      options: [
        'Agraphia without alexia',
        'Alexia without agraphia',
        'Global aphasia',
        'Transcortical sensory aphasia',
      ],
      correctIndex: 1,
      explanation:
          'Alexia without agraphia (pure alexia) results from a dominant PCA infarct affecting the left occipital lobe and splenium of the corpus callosum. Visual information from the intact right hemisphere cannot reach the left angular gyrus for reading, but the writing pathway remains intact.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Dejerine-Roussy syndrome (thalamic pain syndrome) is characterized by:',
      options: [
        'Ipsilateral facial pain and contralateral body pain/temperature loss',
        'Delayed-onset contralateral burning/dysesthetic pain after thalamic stroke',
        'Bilateral headache with meningismus',
        'Ipsilateral limb ataxia with pain',
      ],
      correctIndex: 1,
      explanation:
          'Dejerine-Roussy syndrome presents with severe, burning, often intractable contralateral pain that develops weeks to months after a thalamic infarction (especially the ventral posterolateral nucleus). It may be accompanied by hyperpathia and allodynia.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The Brunnstrom stage at which a patient can perform voluntary movements OUTSIDE of synergy patterns is:',
      options: [
        'Stage 2',
        'Stage 3',
        'Stage 4',
        'Stage 5',
      ],
      correctIndex: 2,
      explanation:
          'Brunnstrom stages: 1-flaccidity, 2-spasticity developing/minimal voluntary movement, 3-spasticity peaks/voluntary movement only within synergy, 4-spasticity decreasing/some movements outside synergy, 5-spasticity waning/more isolated movements, 6-near-normal coordination.',
      moduleId: 'syndromes',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Anterior inferior cerebellar artery (AICA) syndrome includes all of the following EXCEPT:',
      options: [
        'Ipsilateral facial paralysis (CN VII)',
        'Ipsilateral hearing loss (CN VIII)',
        'Ipsilateral Horner syndrome',
        'Contralateral hemiparesis',
      ],
      correctIndex: 3,
      explanation:
          'AICA syndrome (lateral pontine infarction) features ipsilateral facial paralysis (CN VII), hearing loss (CN VIII), Horner syndrome, cerebellar ataxia, and contralateral body pain/temperature loss. Hemiparesis is not a typical feature as the corticospinal tract (medial pons) is usually spared.',
      moduleId: 'syndromes',
      difficulty: 'board',
    ),
  ];
}
