import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData strokeSyndromesContent = TopicData(
  id: 'stroke_syndromes',
  title: 'Stroke Syndromes',
  tabs: [
    // ── MCA Syndrome Tab ──
    TopicTab(
      title: 'MCA Syndrome',
      blocks: [
        HeaderBlock('Middle Cerebral Artery Syndrome'),
        TextBlock(
          'The MCA is the most commonly affected artery in stroke and '
          'produces the most recognizable clinical syndrome. It supplies the '
          'lateral surface of the cerebral hemisphere including the motor and '
          'sensory cortex for the face and upper extremity, as well as the '
          'language centers in the dominant hemisphere.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'MCA Stroke -- Motor & Sensory Deficits',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Contralateral hemiparesis -- face and arm GREATER THAN leg (leg representation is medial/ACA territory)',
            'Contralateral hemisensory loss -- face and arm greater than leg',
            'Contralateral homonymous hemianopia (optic radiations)',
            'Head and eyes deviated TOWARD the lesion (frontal eye field damage -- "eyes look at the lesion")',
            'Upper motor neuron pattern: initially flaccid, then spastic with flexor synergy pattern in the arm and extensor synergy pattern in the leg',
          ],
        ),
        BulletCardBlock(
          title: 'Dominant Hemisphere MCA (Usually Left)',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Broca\'s aphasia (inferior frontal gyrus) -- nonfluent, effortful speech; comprehension relatively preserved; frustrated patient',
            'Wernicke\'s aphasia (superior temporal gyrus) -- fluent but meaningless speech; poor comprehension; unaware patient',
            'Global aphasia (large MCA infarct) -- both expressive and receptive language devastated',
            'Conduction aphasia (arcuate fasciculus) -- fluent speech, good comprehension, poor repetition',
            'Gerstmann syndrome (angular gyrus): agraphia, acalculia, finger agnosia, left-right confusion',
            'Apraxia (ideomotor) -- cannot pantomime learned motor acts on command',
          ],
        ),
        BulletCardBlock(
          title: 'Non-Dominant Hemisphere MCA (Usually Right)',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Left hemispatial neglect -- fails to attend to left side of space (more severe and persistent than right neglect)',
            'Anosognosia -- denial or unawareness of deficit (may insist paralyzed limb works fine)',
            'Aprosodia -- loss of emotional tone/melody in speech',
            'Constructional apraxia -- difficulty with spatial tasks (drawing, building)',
            'Impaired awareness of social cues and emotional recognition',
            'Dressing apraxia -- difficulty dressing the contralateral side',
          ],
        ),
        PearlBlock(
          'Board Pearl: MCA Dominance Deficits',
          'Dominant MCA = aphasia. Non-dominant MCA = neglect. Left neglect '
          '(from right hemisphere damage) is more common, more severe, and '
          'more persistent than right neglect. Patients with neglect often '
          'have worse rehabilitation outcomes because they are unaware of '
          'their deficits (anosognosia). This is among the most heavily '
          'tested stroke concepts.',
        ),
        TableBlock(
          title: 'MCA Branch Syndromes',
          columns: ['Branch', 'Territory', 'Deficits'],
          rows: [
            ['Superior division', 'Frontal and anterior parietal', 'Broca\'s aphasia, contralateral face/arm weakness, face/arm sensory loss'],
            ['Inferior division', 'Temporal and posterior parietal', 'Wernicke\'s aphasia, homonymous hemianopia, Gerstmann syndrome'],
            ['Lenticulostriate branches', 'Basal ganglia, internal capsule', 'Pure motor hemiparesis (face=arm=leg), no cortical signs'],
            ['Complete MCA', 'Entire MCA territory', 'Global aphasia, hemiplegia, hemisensory loss, hemianopia, gaze deviation'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Gerstmann Syndrome',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          icon: Icons.psychology,
          description:
              'Caused by lesion of the left (dominant) angular gyrus, typically '
              'from inferior division MCA stroke. A classic board-tested syndrome.',
          keyPoints: [
            'Agraphia -- inability to write',
            'Acalculia -- inability to perform calculations',
            'Finger agnosia -- inability to identify individual fingers',
            'Left-right confusion -- cannot distinguish left from right',
            'All four elements must be present for the full syndrome',
            'Localizes precisely to the dominant angular gyrus (Brodmann area 39)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Gerstmann Tetrad',
          'The four components of Gerstmann syndrome (agraphia, acalculia, finger '
          'agnosia, left-right confusion) are frequently tested as a localization '
          'question. The answer is always the dominant (left) angular gyrus. If a '
          'question lists any 3-4 of these deficits, choose "left angular gyrus" '
          'or "dominant parietal lobe."',
        ),
        KnowledgeCheckBlock(
          question: 'A patient with a right MCA stroke is most likely to present with which of the following?',
          options: ['Broca\'s aphasia', 'Left hemispatial neglect', 'Leg-predominant weakness', 'Cortical blindness'],
          correctIndex: 1,
          explanation: 'Right (non-dominant) MCA strokes produce left hemispatial neglect and anosognosia. Left (dominant) MCA strokes produce aphasia. Left neglect from right hemisphere damage is more common, more severe, and more persistent than right neglect.',
          boardRelevance: 'BOARD-CORE',
        ),
      ],
    ),

    // ── ACA Syndrome Tab ──
    TopicTab(
      title: 'ACA Syndrome',
      blocks: [
        HeaderBlock('Anterior Cerebral Artery Syndrome'),
        TextBlock(
          'The ACA supplies the medial surface of the frontal and parietal '
          'lobes. Because the leg area of the motor and sensory homunculus is '
          'represented on the medial surface, ACA stroke produces a pattern '
          'opposite to MCA stroke: leg involvement greater than arm or face.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'ACA Stroke -- Clinical Features',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Contralateral hemiparesis -- LEG greater than arm or face (opposite of MCA pattern)',
            'Contralateral hemisensory loss -- leg greater than arm',
            'Urinary incontinence -- damage to medial frontal micturition center (paracentral lobule)',
            'Gait apraxia -- "frontal gait disorder" with magnetic/shuffling gait, difficulty initiating steps',
            'Personality changes -- apathy, abulia, flat affect (medial frontal/cingulate damage)',
            'Transcortical motor aphasia (dominant hemisphere) -- reduced spontaneous speech but preserved repetition',
          ],
        ),
        PearlBlock(
          'Board Pearl: ACA vs MCA Pattern',
          'The key to differentiating ACA from MCA stroke is the distribution '
          'of weakness. ACA = leg > arm/face. MCA = face/arm > leg. If the '
          'exam describes a stroke with leg-predominant weakness plus urinary '
          'incontinence and gait apraxia, the answer is ACA. The triad of '
          'leg weakness + incontinence + gait apraxia is classic ACA.',
        ),
        BulletCardBlock(
          title: 'Bilateral ACA Syndrome',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Akinetic mutism -- awake but makes no voluntary movement or speech (severe bilateral damage)',
            'Abulia -- lack of will or initiative; appears profoundly apathetic',
            'Bilateral leg weakness/paraparesis',
            'Alien hand syndrome -- one hand acts independently against the patient\'s will (corpus callosum involvement)',
            'Severe urinary incontinence',
            'Occurs when both ACAs arise from a single trunk (anatomical variant) and that trunk is occluded',
          ],
        ),
        TableBlock(
          title: 'ACA vs MCA Comparison',
          columns: ['Feature', 'ACA Stroke', 'MCA Stroke'],
          rows: [
            ['Motor deficit pattern', 'Leg > arm/face', 'Face/arm > leg'],
            ['Sensory deficit pattern', 'Leg > arm', 'Face/arm > leg'],
            ['Language', 'Transcortical motor aphasia (if dominant)', 'Broca\'s, Wernicke\'s, global, or conduction aphasia'],
            ['Behavioral changes', 'Abulia, apathy, personality change', 'Neglect (non-dominant), anosognosia'],
            ['Other key features', 'Urinary incontinence, gait apraxia', 'Gaze deviation toward lesion, hemianopia'],
            ['Frequency', 'Uncommon (~3% of strokes)', 'Most common stroke syndrome'],
          ],
        ),
      ],
    ),

    // ── PCA Syndrome Tab ──
    TopicTab(
      title: 'PCA Syndrome',
      blocks: [
        HeaderBlock('Posterior Cerebral Artery Syndrome'),
        TextBlock(
          'The PCA supplies the occipital lobe (primary visual cortex), '
          'inferior temporal lobe, thalamus, and portions of the midbrain. '
          'PCA strokes predominantly present with visual deficits, though '
          'thalamic involvement can produce pain syndromes and memory '
          'impairment.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'PCA Stroke -- Clinical Features',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Contralateral homonymous hemianopia WITH macular sparing (macula has dual blood supply from MCA and PCA)',
            'Visual agnosia -- inability to recognize objects by sight despite intact vision',
            'Prosopagnosia -- inability to recognize familiar faces (bilateral or right PCA)',
            'Color anomia and color agnosia',
            'Memory impairment -- if hippocampus or medial temporal lobe is involved',
            'Minimal or no motor deficit (motor cortex is in MCA/ACA territory)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Macular Sparing',
          'Macular sparing in homonymous hemianopia is the hallmark of PCA '
          '(occipital cortex) stroke and distinguishes it from optic '
          'radiation lesions. The macula is "spared" because it has dual '
          'blood supply from both PCA and MCA. This is one of the most '
          'commonly tested visual deficit localization questions.',
        ),
        BulletCardBlock(
          title: 'Special PCA Syndromes',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Anton syndrome (bilateral PCA) -- cortical blindness with DENIAL of blindness; patient confabulates visual experiences',
            'Alexia without agraphia (dominant PCA + splenium of corpus callosum) -- can write but cannot read what was written; visual information cannot reach the left angular gyrus',
            'Balint syndrome (bilateral PCA -- parieto-occipital) -- simultanagnosia, optic ataxia, ocular apraxia',
            'Dejerine-Roussy syndrome (thalamic PCA) -- contralateral burning/lancinating pain from thalamic infarction; initially sensory loss that evolves into central pain',
            'Parinaud syndrome (midbrain/dorsal midbrain) -- paralysis of upgaze, light-near dissociation, convergence-retraction nystagmus',
          ],
        ),
        PearlBlock(
          'Board Pearl: Alexia Without Agraphia',
          'Alexia without agraphia (pure alexia) is a "disconnection '
          'syndrome" caused by dominant PCA infarct involving the splenium '
          'of the corpus callosum. The left visual cortex is destroyed AND '
          'visual input from the intact right visual cortex cannot cross the '
          'damaged splenium to reach the left angular gyrus (reading center). '
          'The patient can write (motor pathways intact) but cannot read.',
        ),
        TableBlock(
          title: 'PCA Territory Deficits by Structure',
          columns: ['Structure', 'Deficit'],
          rows: [
            ['Primary visual cortex (calcarine)', 'Contralateral homonymous hemianopia with macular sparing'],
            ['Visual association cortex', 'Visual agnosia, prosopagnosia'],
            ['Hippocampus / medial temporal', 'Anterograde memory impairment'],
            ['Thalamus (VPL nucleus)', 'Dejerine-Roussy syndrome (thalamic pain)'],
            ['Splenium of corpus callosum', 'Alexia without agraphia (disconnection)'],
            ['Bilateral occipital cortex', 'Anton syndrome (cortical blindness with denial)'],
            ['Midbrain (perforators)', 'Weber syndrome, Parinaud syndrome'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Dejerine-Roussy Syndrome (Thalamic Pain)',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          icon: Icons.warning_amber,
          description:
              'Central post-stroke pain syndrome caused by thalamic infarction '
              '(usually VPL nucleus). One of the most debilitating consequences '
              'of PCA territory stroke.',
          keyPoints: [
            'Initially presents as contralateral sensory loss (acute phase)',
            'Weeks to months later, develops severe contralateral burning, lancinating, or aching pain',
            'Pain is spontaneous and exacerbated by light touch (allodynia) or emotional stress',
            'Notoriously difficult to treat -- often refractory to standard analgesics',
            'Treatment options: amitriptyline, gabapentin/pregabalin, lamotrigine, motor cortex stimulation',
            'Not limited to PCA strokes -- any thalamic injury can cause this syndrome',
          ],
        ),
        ComparisonCardBlock(
          title: 'Anton Syndrome (Cortical Blindness with Denial)',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          icon: Icons.visibility_off,
          description:
              'Bilateral PCA infarcts destroy both occipital visual cortices, '
              'causing complete cortical blindness. The patient denies being blind '
              'and confabulates visual experiences.',
          keyPoints: [
            'Bilateral PCA occlusion (often from top of basilar syndrome or bilateral posterior watershed)',
            'Patient is completely blind but insists they can see',
            'Confabulates visual descriptions -- may describe the room incorrectly when asked',
            'Pupillary light reflexes are PRESERVED (the reflex arc through the brainstem is intact)',
            'Anosognosia for blindness -- the association cortex that would detect visual failure is itself destroyed',
            'Distinguish from hysterical blindness: in Anton syndrome, optokinetic nystagmus is ABSENT',
          ],
        ),
        ComparisonCardBlock(
          title: 'Balint Syndrome',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          icon: Icons.remove_red_eye,
          description:
              'Caused by bilateral parieto-occipital lesions (bilateral PCA or '
              'watershed infarcts). A triad of visuospatial processing deficits.',
          keyPoints: [
            'Simultanagnosia -- can only perceive one object at a time; cannot see the "big picture"',
            'Optic ataxia -- cannot accurately reach for objects under visual guidance (misreaching)',
            'Ocular apraxia -- cannot voluntarily direct gaze to a specific target despite intact eye movements',
            'Caused by bilateral parieto-occipital junction lesions',
            'Can occur from bilateral watershed infarcts (MCA-PCA border zones) after hypotensive episodes',
            'Severely disabling -- patients cannot navigate environments or interact with multiple objects',
          ],
        ),
        ComparisonCardBlock(
          title: 'Top of Basilar Syndrome',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          icon: Icons.emergency,
          description:
              'Occlusion of the rostral basilar artery or its terminal branches. '
              'Produces devastating bilateral PCA and midbrain findings.',
          keyPoints: [
            'Bilateral PCA territory infarction -- cortical blindness (often with Anton syndrome)',
            'Midbrain involvement -- CN III palsies, vertical gaze palsy (Parinaud syndrome)',
            'Thalamic infarction -- altered consciousness, memory loss, behavioral changes',
            'Rostral brainstem infarction -- peduncular hallucinosis (vivid visual hallucinations)',
            'May present with sudden coma if reticular activating system is involved',
            'Often embolic (cardiac or artery-to-artery from vertebral or proximal basilar atherosclerosis)',
          ],
        ),
      ],
    ),

    // ── Brainstem Tab ──
    TopicTab(
      title: 'Brainstem',
      blocks: [
        HeaderBlock('Brainstem Stroke Syndromes'),
        TextBlock(
          'Brainstem strokes produce characteristic "crossed" or "alternating" '
          'findings: ipsilateral cranial nerve deficits with contralateral '
          'long tract signs (motor and sensory). This pattern occurs because '
          'the cranial nerve nuclei are at the level of the lesion, while the '
          'descending/ascending tracts cross at the medullary pyramids below.',
          isIntro: true,
        ),
        PearlBlock(
          'Board Pearl: Crossed Findings = Brainstem',
          'Ipsilateral cranial nerve deficit + contralateral hemiparesis = '
          'brainstem lesion. This "crossed" pattern is PATHOGNOMONIC for '
          'brainstem stroke. If all deficits are on the same side, the lesion '
          'is above the brainstem (cortical or subcortical).',
        ),
        TableBlock(
          title: 'Major Brainstem Stroke Syndromes',
          columns: ['Syndrome', 'Artery / Location', 'Key Features'],
          rows: [
            ['Wallenberg (lateral medullary)', 'PICA or vertebral artery', 'Ipsilateral: facial pain/temp loss, Horner\'s, ataxia, dysphagia, hoarseness, vertigo. Contralateral: body pain/temp loss. NO motor weakness.'],
            ['Medial medullary', 'Anterior spinal artery', 'Ipsilateral tongue deviation (CN XII). Contralateral: hemiparesis, loss of proprioception/vibration (medial lemniscus).'],
            ['Weber (ventral midbrain)', 'PCA perforators', 'Ipsilateral CN III palsy (eye "down and out," dilated pupil). Contralateral hemiparesis.'],
            ['Benedikt (tegmental midbrain)', 'PCA perforators', 'Ipsilateral CN III palsy. Contralateral tremor/chorea (red nucleus) and hemisensory loss.'],
            ['Millard-Gubler (ventral pons)', 'Basilar perforators', 'Ipsilateral CN VI (lateral rectus palsy) and CN VII (facial paralysis). Contralateral hemiparesis.'],
            ['Locked-in syndrome', 'Basilar artery (ventral pons)', 'Complete quadriplegia and anarthria with preserved consciousness. Only vertical eye movements and blinking preserved.'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Wallenberg Syndrome (Lateral Medullary)',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          icon: Icons.warning_amber,
          description:
              'The most commonly tested brainstem stroke syndrome. Caused by '
              'occlusion of PICA or vertebral artery affecting the lateral '
              'medulla.',
          keyPoints: [
            'Ipsilateral facial pain and temperature loss (descending spinal trigeminal nucleus)',
            'Contralateral body pain and temperature loss (spinothalamic tract)',
            'Ipsilateral Horner syndrome: miosis, ptosis, anhidrosis (descending sympathetics)',
            'Ipsilateral cerebellar ataxia (inferior cerebellar peduncle)',
            'Dysphagia and hoarseness (nucleus ambiguus -- CN IX/X)',
            'Vertigo, nystagmus, nausea (vestibular nuclei)',
            'NO motor weakness (corticospinal tract is medial, not affected)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Wallenberg -- Most Tested Brainstem Syndrome',
          'Wallenberg syndrome has NO motor weakness -- this is crucial for '
          'the exam. The corticospinal tract runs in the medial medulla and '
          'is spared in lateral medullary lesions. Key features to remember: '
          'ipsilateral face + contralateral body pain/temp loss, Horner '
          'syndrome, dysphagia, cerebellar ataxia, vertigo.',
        ),
        KnowledgeCheckBlock(
          question: 'A patient presents with ipsilateral facial pain/temperature loss, contralateral body pain/temperature loss, Horner syndrome, ataxia, and dysphagia but NO motor weakness. Which syndrome is this?',
          options: ['Weber syndrome', 'Medial medullary syndrome', 'Wallenberg syndrome', 'Locked-in syndrome'],
          correctIndex: 2,
          explanation: 'Wallenberg (lateral medullary) syndrome is caused by PICA or vertebral artery occlusion. The hallmark is the absence of motor weakness because the corticospinal tract runs medially and is spared in lateral medullary lesions.',
          boardRelevance: 'BOARD-CORE',
        ),
        ComparisonCardBlock(
          title: 'Locked-In Syndrome',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          icon: Icons.lock,
          description:
              'Caused by bilateral ventral pontine infarction (basilar artery '
              'occlusion). The patient is conscious and cognitively intact but '
              'completely paralyzed.',
          keyPoints: [
            'Complete quadriplegia (bilateral corticospinal tract destruction)',
            'Anarthria -- cannot speak (bilateral corticobulbar tract destruction)',
            'Preserved consciousness and cognition (reticular activating system is dorsal, spared)',
            'Only voluntary movements: vertical eye movements and blinking (CN III nucleus is in midbrain, above the lesion)',
            'EEG shows normal waking patterns -- distinguishes from coma or vegetative state',
            'Must not be confused with coma -- the patient is fully aware',
          ],
        ),
        TableBlock(
          title: 'Medial vs Lateral Brainstem Syndromes',
          columns: ['Feature', 'Medial Syndromes', 'Lateral Syndromes'],
          rows: [
            ['Artery involved', 'Paramedian perforators (anterior spinal, basilar perforators)', 'Circumferential arteries (PICA, AICA, SCA)'],
            ['Motor deficit', 'YES -- contralateral hemiparesis (corticospinal tract is medial)', 'NO motor weakness (corticospinal tract spared)'],
            ['Sensory deficit', 'Contralateral proprioception/vibration loss (medial lemniscus)', 'Contralateral pain/temperature loss (spinothalamic tract)'],
            ['Cranial nerve', 'Medial cranial nerves: CN III (midbrain), CN VI (pons), CN XII (medulla)', 'Lateral cranial nerves: CN V, VII, VIII, IX, X + sympathetics'],
            ['Cerebellar signs', 'Usually absent', 'Usually present (cerebellar peduncles are lateral)'],
            ['Classic example', 'Medial medullary syndrome (CN XII + contralateral weakness + proprioception loss)', 'Wallenberg syndrome (no weakness, crossed pain/temp, Horner, ataxia)'],
          ],
        ),
        MnemonicBlock(
          'Rule of 4 -- Brainstem Localization',
          '4 Medial structures (all start with M):\n'
          '  Motor pathway (corticospinal tract)\n'
          '  Medial lemniscus (proprioception/vibration)\n'
          '  MLF (medial longitudinal fasciculus -- conjugate gaze)\n'
          '  Motor nucleus of CN (CN III, VI, XII are medial)\n\n'
          '4 Lateral structures (all start with S):\n'
          '  Spinothalamic tract (pain/temperature)\n'
          '  Spinocerebellar pathways (cerebellar peduncles)\n'
          '  Sympathetic tract (Horner syndrome)\n'
          '  Sensory nucleus of CN V (facial pain/temperature)',
        ),
        PearlBlock(
          'Board Pearl: Rule of 4 Application',
          'The Rule of 4 simplifies brainstem localization: medial lesions produce '
          'the "4 Ms" (Motor weakness, Medial lemniscus proprioception loss, MLF '
          'internuclear ophthalmoplegia, Medial CN palsy). Lateral lesions produce '
          'the "4 Ss" (Spinothalamic pain/temp loss, Spinocerebellar ataxia, '
          'Sympathetic Horner, Sensory CN V). The CN number tells you the level: '
          'III/IV = midbrain, V-VIII = pons, IX-XII = medulla.',
        ),
        ComparisonCardBlock(
          title: 'Anterior Choroidal Artery Syndrome',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          icon: Icons.account_tree,
          description:
              'Occlusion of the anterior choroidal artery (branch of the ICA). '
              'Produces a classic triad that can mimic MCA stroke.',
          keyPoints: [
            'Contralateral hemiplegia (posterior limb of internal capsule -- lateral portion)',
            'Contralateral hemisensory loss (lateral thalamus)',
            'Contralateral homonymous hemianopia (lateral geniculate body/optic tract)',
            'May also include cognitive deficits if temporal lobe involved',
            'Distinguishing from MCA: anterior choroidal tends to produce equal face/arm/leg deficits, and lacks cortical signs like aphasia or neglect',
            'Full syndrome is relatively uncommon due to collateral supply',
          ],
        ),
        TableBlock(
          title: 'Visual Field Deficits by Lesion Location',
          columns: ['Lesion', 'Visual Field Deficit', 'Key Distinguishing Feature'],
          rows: [
            ['Optic nerve', 'Monocular vision loss (ipsilateral)', 'Only one eye affected; APD present'],
            ['Optic chiasm (central)', 'Bitemporal hemianopia', 'Pituitary tumor or AComm aneurysm compressing chiasm'],
            ['Optic tract', 'Contralateral homonymous hemianopia (incongruent)', 'Incongruent = fields do not perfectly match between eyes'],
            ['Temporal lobe (Meyer\'s loop)', 'Contralateral superior quadrantanopia ("pie in the sky")', 'MCA inferior division territory'],
            ['Parietal lobe', 'Contralateral inferior quadrantanopia ("pie on the floor")', 'MCA superior division territory'],
            ['Occipital cortex (PCA)', 'Contralateral homonymous hemianopia WITH macular sparing', 'Macular sparing = PCA lesion (dual blood supply to macula)'],
            ['Bilateral occipital', 'Complete cortical blindness (Anton if with denial)', 'Pupillary reflexes intact (subcortical pathway spared)'],
          ],
        ),
      ],
    ),

    // ── Lacunar Syndromes Tab ──
    TopicTab(
      title: 'Lacunar Syndromes',
      blocks: [
        HeaderBlock('Lacunar Stroke Syndromes'),
        TextBlock(
          'Lacunar syndromes result from occlusion of small, deep penetrating '
          'arteries causing infarcts <15 mm. They produce characteristic '
          '"pure" syndromes without cortical signs. There are five classic '
          'lacunar syndromes recognized for board examinations.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Five Classic Lacunar Syndromes',
          columns: ['Syndrome', 'Location', 'Presentation', 'Key Distinguishing Feature'],
          rows: [
            ['Pure motor hemiparesis', 'Posterior limb of internal capsule (most common) or basis pontis', 'Equal weakness of face, arm, and leg contralaterally', 'Most common lacunar syndrome; NO sensory loss'],
            ['Pure sensory stroke', 'VPL nucleus of thalamus', 'Numbness/paresthesias of contralateral face, arm, and leg', 'NO motor deficit; all sensory modalities affected'],
            ['Ataxic hemiparesis', 'Posterior limb of internal capsule or pons', 'Weakness + cerebellar ataxia on SAME side (contralateral to lesion)', 'Weakness and ataxia coexist on same side'],
            ['Dysarthria-clumsy hand', 'Basis pontis or genu of internal capsule', 'Dysarthria + contralateral hand weakness and clumsiness', 'Hand dysfunction out of proportion to other deficits'],
            ['Sensorimotor stroke', 'Thalamocapsular junction', 'Combined motor AND sensory loss, contralateral face/arm/leg', 'Largest lacunar infarct type; combines pure motor + pure sensory'],
          ],
        ),
        PearlBlock(
          'Board Pearl: No Cortical Signs',
          'The DEFINING feature of all lacunar syndromes is the ABSENCE of '
          'cortical signs: no aphasia, no neglect, no hemianopia, no '
          'seizures, no alterations of consciousness. If any cortical sign is '
          'described in the question stem, the answer is NOT a lacunar '
          'syndrome. Pure motor hemiparesis is the most commonly tested '
          'lacunar syndrome.',
        ),
        KnowledgeCheckBlock(
          question: 'Which lacunar syndrome localizes to the VPL nucleus of the thalamus?',
          options: ['Pure motor hemiparesis', 'Pure sensory stroke', 'Ataxic hemiparesis', 'Dysarthria-clumsy hand'],
          correctIndex: 1,
          explanation: 'Pure sensory stroke localizes to the ventral posterolateral (VPL) nucleus of the thalamus, supplied by thalamogeniculate arteries from the PCA. It presents as contralateral numbness/paresthesias of face, arm, and leg with no motor deficit.',
          boardRelevance: 'BOARD-CORE',
        ),
        BulletCardBlock(
          title: 'Lacunar Syndrome Quick Reference',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'All lacunar syndromes: NO cortical signs (no aphasia, neglect, hemianopia)',
            'Pure motor: posterior limb internal capsule -- face=arm=leg weakness',
            'Pure sensory: VPL thalamus -- face=arm=leg numbness',
            'Ataxic hemiparesis: internal capsule or pons -- weakness + ataxia same side',
            'Dysarthria-clumsy hand: pons or internal capsule genu -- slurred speech + clumsy hand',
            'Sensorimotor: thalamocapsular -- motor + sensory combined',
          ],
        ),
        BulletCardBlock(
          title: 'Clinical Pearls for Lacunar Syndromes',
          themeColor: Color(0xFF6366F1),
          backgroundColor: Color(0xFFEEF2FF),
          points: [
            'Hypertension is the #1 risk factor for lacunar strokes',
            'CT may be normal -- MRI is superior for detecting small deep infarcts',
            'Multiple lacunar infarcts over time cause "lacunar state" or "etat lacunaire" with vascular parkinsonism, pseudobulbar palsy, and cognitive decline',
            'Prognosis for individual lacunar strokes is generally better than large territory infarcts',
            'Antiplatelet therapy (not anticoagulation) is the standard secondary prevention',
            'Aggressive BP control is the most important preventive measure',
          ],
        ),
        MnemonicBlock(
          'Lacunar Syndromes -- "5 Ps" Memory Aid',
          'Pure Motor = Posterior limb of internal capsule\n'
          'Pure Sensory = thalamic VPL nucleus\n'
          'Proportional weakness (face=arm=leg equally) distinguishes from MCA\n'
          'Pons is an alternative site for pure motor and dysarthria-clumsy hand\n'
          'Preserved cortical function (no aphasia, neglect, hemianopia) = hallmark',
        ),
        TableBlock(
          title: 'Lacunar vs Cortical Stroke -- Key Differences',
          columns: ['Feature', 'Lacunar Stroke', 'Cortical (Large Territory) Stroke'],
          rows: [
            ['Size of infarct', '<15 mm', 'Variable, often large'],
            ['Motor pattern', 'Face = arm = leg equally', 'Face/arm > leg (MCA) or leg > arm (ACA)'],
            ['Aphasia', 'Absent', 'Present if dominant hemisphere'],
            ['Neglect', 'Absent', 'Present if non-dominant hemisphere'],
            ['Visual field deficit', 'Absent', 'Homonymous hemianopia common'],
            ['Seizures', 'Absent (subcortical)', 'May occur (cortical irritation)'],
            ['Level of consciousness', 'Preserved', 'May be impaired in large infarcts'],
            ['Prognosis', 'Generally good', 'Variable, often worse'],
          ],
        ),
      ],
    ),
  ],
);
