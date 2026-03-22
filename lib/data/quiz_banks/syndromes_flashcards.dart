import '../models/flashcard_model.dart';

class SyndromesFlashcards {
  SyndromesFlashcards._();

  static const List<Flashcard> cards = [
    Flashcard(
      front: 'What are the clinical features of a middle cerebral artery (MCA) stroke?',
      back:
          'Contralateral hemiparesis/hemisensory loss (face and arm > leg), contralateral homonymous hemianopia, and:\n- Dominant hemisphere: aphasia (Broca, Wernicke, or global)\n- Non-dominant hemisphere: hemispatial neglect, anosognosia, aprosodia',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What are the clinical features of an anterior cerebral artery (ACA) stroke?',
      back:
          'Contralateral leg-predominant weakness and sensory loss, abulia/apathy (medial frontal), urinary incontinence, grasp reflex, alien hand syndrome (if corpus callosum involved). Arm and face are relatively spared.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What are the clinical features of a posterior cerebral artery (PCA) stroke?',
      back:
          'Contralateral homonymous hemianopia (often with macular sparing), visual agnosia, prosopagnosia (face recognition), alexia without agraphia (dominant hemisphere with splenium involvement). Thalamic branches: contralateral sensory loss, Dejerine-Roussy syndrome.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe the lateral medullary (Wallenberg) syndrome.',
      back:
          'Caused by PICA or vertebral artery occlusion.\nIpsilateral: Horner syndrome, facial pain/temperature loss (CN V), cerebellar ataxia, palatal/vocal cord paralysis (CN IX/X)\nContralateral: body pain/temperature loss (spinothalamic tract)\nAlso: vertigo, nystagmus, dysphagia, hoarseness\nNO hemiparesis (pyramid is medial and spared).',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe the medial medullary (Dejerine) syndrome.',
      back:
          'Caused by anterior spinal artery or vertebral artery occlusion.\nTriad:\n1. Ipsilateral tongue weakness/deviation (CN XII)\n2. Contralateral hemiparesis (pyramid)\n3. Contralateral proprioception/vibration loss (medial lemniscus)',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe Weber syndrome (medial midbrain).',
      back:
          'Ipsilateral CN III palsy (ptosis, dilated pupil, "down and out" eye) + contralateral hemiparesis (cerebral peduncle). Caused by paramedian branches of the PCA or basilar artery.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe Benedikt syndrome (tegmental midbrain).',
      back:
          'Ipsilateral CN III palsy + contralateral involuntary movements (tremor, chorea, athetosis) due to red nucleus involvement + contralateral hemisensory loss (medial lemniscus). Similar to Weber but involves the midbrain tegmentum rather than the basis.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What is locked-in syndrome?',
      back:
          'Bilateral ventral pontine infarction (usually basilar artery occlusion). Quadriplegia and anarthria with PRESERVED consciousness (reticular formation spared). Only voluntary movements are vertical eye movements and blinking. Cognition is intact.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What are the 5 classic lacunar syndromes?',
      back:
          '1. Pure motor hemiparesis (posterior limb of internal capsule or basis pontis)\n2. Pure sensory stroke (thalamus - VPL/VPM)\n3. Sensorimotor stroke (internal capsule + adjacent thalamus)\n4. Ataxic hemiparesis (pons, internal capsule)\n5. Dysarthria-clumsy hand syndrome (pons, genu of internal capsule)',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What is a watershed (border zone) infarct?',
      back:
          'Infarction at the boundary zones between major vascular territories (ACA-MCA, MCA-PCA). Caused by systemic hypotension or severe proximal stenosis. External border zone: cortical, "man in a barrel" syndrome (bilateral arm weakness). Internal border zone: subcortical white matter.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe Broca aphasia.',
      back:
          'Non-fluent/expressive aphasia.\n- Speech: effortful, telegraphic, reduced output\n- Comprehension: relatively preserved\n- Repetition: impaired\n- Naming: impaired\n- Lesion: posterior inferior frontal gyrus (Brodmann 44-45) of dominant hemisphere\n- Patients are often aware and frustrated',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe Wernicke aphasia.',
      back:
          'Fluent/receptive aphasia.\n- Speech: fluent but meaningless (paraphasias, neologisms, "word salad")\n- Comprehension: severely impaired\n- Repetition: impaired\n- Naming: impaired\n- Lesion: posterior superior temporal gyrus (Brodmann 22) of dominant hemisphere\n- Patients often unaware of deficit (anosognosia)',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'Describe conduction aphasia.',
      back:
          '- Speech: fluent\n- Comprehension: preserved\n- Repetition: severely impaired (hallmark)\n- Naming: variably impaired\n- Lesion: arcuate fasciculus (connecting Wernicke to Broca area)\n- Frequent phonemic paraphasias and conduite d\'approche (multiple self-correction attempts)',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'How do transcortical aphasias differ from perisylvian aphasias?',
      back:
          'Transcortical aphasias have PRESERVED repetition (the perisylvian language loop is intact).\n- Transcortical motor: non-fluent, preserved comprehension, preserved repetition\n- Transcortical sensory: fluent, impaired comprehension, preserved repetition\n- Mixed transcortical: non-fluent, impaired comprehension, preserved repetition (echolalia)',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What are the Brunnstrom stages of motor recovery?',
      back:
          'Stage 1: Flaccidity, no voluntary movement\nStage 2: Spasticity begins, minimal voluntary movement\nStage 3: Spasticity peaks, voluntary movement only within synergy patterns\nStage 4: Spasticity decreases, some movements outside synergy\nStage 5: Spasticity wanes, isolated joint movements possible\nStage 6: Spasticity absent, near-normal coordination',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What are the upper extremity flexor and extensor synergy patterns?',
      back:
          'Flexor synergy: scapular retraction/elevation, shoulder abduction to 90 degrees (or adduction/internal rotation), elbow flexion, forearm supination, wrist/finger flexion\n\nExtensor synergy: scapular protraction, shoulder adduction/internal rotation, elbow extension, forearm pronation, wrist/finger flexion',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What is hemispatial neglect and where is the lesion?',
      back:
          'Failure to attend to stimuli on the side contralateral to a brain lesion, not explained by sensory or motor deficits. Most commonly left-sided neglect from right hemisphere lesions (parietal lobe, temporoparietal junction, frontal lobe, or subcortical structures). Assessed by line bisection, cancellation tasks, and drawing tasks.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What is Dejerine-Roussy (thalamic pain) syndrome?',
      back:
          'Central post-stroke pain following thalamic infarction (especially VPL nucleus). After initial contralateral sensory loss, delayed onset (weeks to months) of severe burning/dysesthetic pain with allodynia and hyperpathia. Often refractory to standard analgesics. May respond to amitriptyline, gabapentin, pregabalin, or lamotrigine.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What is shoulder-hand syndrome (CRPS Type I) after stroke?',
      back:
          'Complex regional pain syndrome in the hemiplegic upper extremity.\nStage 1: pain, edema, warmth, erythema of hand/shoulder (months)\nStage 2: dystrophic changes, cool/cyanotic skin, decreased ROM\nStage 3: atrophic changes, contractures, skin/muscle atrophy\nPrevention: proper positioning, ROM exercises, shoulder support. Treatment: corticosteroids, stellate ganglion blocks, PT/OT.',
      moduleId: 'syndromes',
    ),
    Flashcard(
      front: 'What is the anterior choroidal artery syndrome?',
      back:
          'The anterior choroidal artery (branch of ICA) supplies the posterior limb of the internal capsule, optic tract, lateral geniculate body, and medial temporal lobe. Occlusion causes the classic triad:\n1. Contralateral hemiparesis\n2. Contralateral hemisensory loss\n3. Contralateral homonymous hemianopia\nCan mimic an MCA stroke but typically no aphasia or neglect.',
      moduleId: 'syndromes',
    ),
  ];
}
