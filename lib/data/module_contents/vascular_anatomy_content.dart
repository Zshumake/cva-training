import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData vascularAnatomyContent = TopicData(
  id: 'vascular_anatomy',
  title: 'Vascular Anatomy',
  tabs: [
    // ── Cerebral Circulation Tab ──
    TopicTab(
      title: 'Cerebral Circulation',
      blocks: [
        HeaderBlock('Cerebral Blood Supply'),
        TextBlock(
          'The brain receives approximately 15-20% of total cardiac output '
          'despite comprising only about 2% of body weight. The cerebral '
          'circulation is divided into anterior (carotid) and posterior '
          '(vertebrobasilar) systems, which are interconnected via the Circle '
          'of Willis.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Anterior Circulation (Carotid System)',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Internal carotid artery (ICA) supplies ~80% of cerebral blood flow',
            'ICA enters the skull through the carotid canal and gives off the ophthalmic artery',
            'ICA terminates by bifurcating into the ACA and MCA',
            'Middle cerebral artery (MCA) -- largest branch, supplies lateral cerebral hemisphere',
            'Anterior cerebral artery (ACA) -- supplies medial cerebral hemisphere',
            'Anterior communicating artery (AComm) connects the two ACAs',
          ],
        ),
        BulletCardBlock(
          title: 'Posterior Circulation (Vertebrobasilar System)',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Vertebral arteries arise from the subclavian arteries and ascend through the transverse foramina of C1-C6',
            'Vertebral arteries enter the skull through the foramen magnum',
            'Give off the posterior inferior cerebellar artery (PICA) before joining',
            'Two vertebral arteries merge at the pontomedullary junction to form the basilar artery',
            'Basilar artery gives off AICA and SCA before terminating as the two PCAs',
            'Posterior cerebral arteries (PCAs) supply the occipital lobes and inferior temporal lobes',
          ],
        ),
        PearlBlock(
          'Board Pearl: Blood Supply Percentages',
          'The anterior circulation (ICA system) supplies approximately 80% '
          'of total cerebral blood flow, while the posterior circulation '
          '(vertebrobasilar system) supplies approximately 20%. The MCA alone '
          'carries the majority of the anterior circulation flow and is the '
          'most commonly affected vessel in stroke.',
        ),
        TableBlock(
          title: 'Major Cerebral Arteries and Their Territories',
          columns: ['Artery', 'Territory Supplied', 'Key Structures'],
          rows: [
            ['MCA', 'Lateral hemisphere', 'Motor/sensory cortex (face, arm), Broca\'s & Wernicke\'s areas, basal ganglia, internal capsule (lenticulostriate branches)'],
            ['ACA', 'Medial hemisphere', 'Motor/sensory cortex (leg), supplementary motor area, corpus callosum, cingulate gyrus'],
            ['PCA', 'Occipital/inferior temporal', 'Primary visual cortex, thalamus, hippocampus, medial temporal lobe'],
            ['Basilar', 'Pons/cerebellum', 'Pontine nuclei, corticospinal tracts, cranial nerve nuclei V-VIII'],
            ['Vertebral/PICA', 'Medulla/inferior cerebellum', 'Lateral medulla, inferior cerebellar peduncle, vestibular nuclei'],
          ],
        ),
        BulletCardBlock(
          title: 'Lenticulostriate Arteries -- "Arteries of Stroke"',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          points: [
            'Small perforating branches arising from the M1 segment of the MCA',
            'Supply the putamen, globus pallidus, caudate head, and posterior limb of the internal capsule',
            'Called "arteries of stroke" (Charcot) because they are the most common site of hypertensive ICH and lacunar infarction',
            'Lack significant collateral supply -- occlusion results in predictable deep infarcts',
            'Charcot-Bouchard microaneurysms form on these vessels in chronic hypertension, predisposing to rupture',
            'Lipohyalinosis of these vessels causes lacunar infarcts (especially pure motor hemiparesis)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Anterior Choroidal Artery',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.account_tree,
          description:
              'Arises from the ICA just distal to the PComm origin. Despite its '
              'small caliber, it supplies critical deep structures.',
          keyPoints: [
            'Supplies the posterior limb of the internal capsule (lateral portion)',
            'Supplies the optic tract, lateral geniculate body, medial temporal lobe, and choroid plexus of the lateral ventricle',
            'Occlusion produces the classic triad: contralateral hemiplegia, hemisensory loss, and homonymous hemianopia',
            'Can mimic an MCA stroke but tends to have equal face/arm/leg involvement',
            'Often spared by collateral supply -- full syndrome is uncommon in clinical practice',
          ],
        ),
        TableBlock(
          title: 'Vertebrobasilar System -- Detailed Cerebellar Arteries',
          columns: ['Artery', 'Origin', 'Territory', 'Syndrome if Occluded'],
          rows: [
            ['PICA', 'Vertebral artery', 'Lateral medulla, inferior cerebellar surface, inferior vermis', 'Wallenberg (lateral medullary) syndrome -- ipsilateral Horner, facial pain/temp loss, ataxia; contralateral body pain/temp loss'],
            ['AICA', 'Proximal basilar', 'Lateral pons, middle cerebellar peduncle, inner ear', 'Lateral pontine syndrome -- ipsilateral facial paralysis (CN VII), deafness (CN VIII), ataxia; contralateral body pain/temp loss'],
            ['SCA', 'Distal basilar', 'Superior cerebellar surface, superior cerebellar peduncle, rostral pons', 'Ipsilateral cerebellar ataxia, contralateral pain/temp loss, ipsilateral Horner; tremor or choreiform movements'],
          ],
        ),
        PearlBlock(
          'Board Pearl: PICA vs AICA vs SCA',
          'All three cerebellar arteries produce ipsilateral cerebellar ataxia plus '
          'contralateral pain/temperature loss. The distinguishing features: PICA = '
          'lateral medullary signs (dysphagia, hoarseness, Horner). AICA = lateral '
          'pontine signs (CN VII facial palsy, CN VIII hearing loss). SCA = rarely '
          'tested alone; superior cerebellar signs with possible tremor.',
        ),
        KnowledgeCheckBlock(
          question: 'Which artery supplies approximately 80% of total cerebral blood flow?',
          options: ['Vertebral artery', 'Basilar artery', 'Internal carotid artery', 'Middle cerebral artery'],
          correctIndex: 2,
          explanation: 'The internal carotid artery (ICA) system supplies approximately 80% of cerebral blood flow. The posterior circulation (vertebrobasilar system) supplies the remaining 20%.',
          boardRelevance: 'BOARD-CORE',
        ),
        BulletCardBlock(
          title: 'Homunculus and Vascular Territory Mapping',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'The motor and sensory homunculus is arranged with leg medially (ACA territory) and face/arm laterally (MCA territory)',
            'The homunculus is "upside down" -- the foot and genitalia are on the medial surface near the interhemispheric fissure',
            'Hand and face have disproportionately large cortical representation -- small infarcts here produce significant deficits',
            'ACA infarct: leg weakness/numbness predominates because the leg area is on the medial cortical surface',
            'MCA infarct: face and arm weakness predominates because they are represented on the lateral cortical surface',
            'Watershed infarcts between ACA and MCA produce proximal arm weakness ("man in a barrel") because the shoulder/arm border zone straddles the two territories',
          ],
        ),
      ],
    ),

    // ── Circle of Willis Tab ──
    TopicTab(
      title: 'Circle of Willis',
      blocks: [
        HeaderBlock('Circle of Willis'),
        TextBlock(
          'The Circle of Willis is an arterial anastomosis at the base of '
          'the brain that provides collateral circulation between the anterior '
          'and posterior systems. It surrounds the optic chiasm and '
          'infundibulum of the pituitary gland. Its shape has been compared to '
          'a spider, with the body at the center and the arteries radiating '
          'outward as legs.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Components of the Circle of Willis',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Anterior communicating artery (AComm) -- connects left and right ACAs',
            'Anterior cerebral arteries (ACA) -- left and right A1 segments',
            'Internal carotid arteries (ICA) -- left and right terminal portions',
            'Posterior communicating arteries (PComm) -- connect ICA to PCA on each side',
            'Posterior cerebral arteries (PCA) -- left and right P1 segments',
            'Basilar artery tip -- provides the PCAs',
          ],
        ),
        PearlBlock(
          'Board Pearl: Complete Circle of Willis',
          'Only 20-25% of the population has a complete, fully functional '
          'Circle of Willis. The most common variant is hypoplasia or absence '
          'of one or both PComm arteries. This has important clinical '
          'implications: patients with an incomplete circle have less '
          'collateral reserve and may tolerate carotid occlusion poorly.',
        ),
        TableBlock(
          title: 'Circle of Willis -- Aneurysm Sites',
          columns: ['Location', 'Frequency', 'Clinical Significance'],
          rows: [
            ['AComm artery', '~30-35%', 'Most common location for saccular aneurysm; may compress optic chiasm causing bitemporal hemianopia'],
            ['PComm artery', '~25-30%', 'Second most common; may compress CN III causing ipsilateral pupil dilation and "down and out" eye'],
            ['MCA bifurcation', '~20%', 'Third most common; may present with focal deficits'],
            ['Basilar tip', '~5-10%', 'May compress brainstem or CN III'],
            ['ICA', '~5-10%', 'May involve the cavernous sinus'],
          ],
        ),
        MnemonicBlock(
          'Spider Anatomy of the Circle of Willis',
          'Think of a SPIDER sitting at the base of the brain:\n'
          '- Body = the communicating arteries (AComm and bilateral PComms)\n'
          '- Front legs = the ACAs extending forward and upward\n'
          '- Middle legs = the MCAs extending laterally\n'
          '- Back legs = the PCAs extending posteriorly\n'
          '- The ICAs and basilar artery are the "blood supply highways" feeding into the spider\'s body',
        ),
        BulletCardBlock(
          title: 'Clinical Significance of the Circle',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Provides collateral blood flow if one major artery is occluded',
            'Allows compensation for gradual carotid stenosis through cross-filling',
            'Most common site for saccular (berry) aneurysms that cause SAH',
            'Collateral capacity depends on anatomical completeness and patency',
            'Important surgical consideration during carotid endarterectomy or endovascular procedures',
          ],
        ),
        TableBlock(
          title: 'Circle of Willis -- Common Anatomical Variants',
          columns: ['Variant', 'Prevalence', 'Clinical Implication'],
          rows: [
            ['Hypoplastic or absent PComm (one or both)', '~30-40%', 'Reduced collateral between anterior and posterior systems; higher risk with carotid occlusion'],
            ['Fetal PCA (PCA arises from ICA)', '~15-30%', 'PCA territory depends on anterior circulation; carotid occlusion affects vision'],
            ['Hypoplastic or absent A1 (ACA)', '~10%', 'Contralateral ACA must supply both medial hemispheres; AComm aneurysm risk'],
            ['Absent AComm', '~5%', 'No cross-filling between hemispheres; unilateral carotid disease more dangerous'],
            ['Complete circle', '~20-25%', 'Full collateral reserve; best toleration of single-vessel occlusion'],
          ],
        ),
        PearlBlock(
          'Board Pearl: PComm Aneurysm and CN III',
          'The posterior communicating artery is the most common site of aneurysm '
          'presenting with cranial nerve signs. A PComm aneurysm compresses CN III, '
          'causing ipsilateral ptosis, mydriasis (dilated pupil), and "down and out" '
          'eye position. A pupil-involving CN III palsy is an aneurysm until proven '
          'otherwise and requires emergent CTA/angiography.',
        ),
        KnowledgeCheckBlock(
          question: 'What is the most common location for a saccular (berry) aneurysm in the Circle of Willis?',
          options: ['PComm artery', 'AComm artery', 'MCA bifurcation', 'Basilar tip'],
          correctIndex: 1,
          explanation: 'The anterior communicating artery (AComm) is the most common location for saccular aneurysms, accounting for approximately 30-35% of cases. The PComm is second most common at 25-30%.',
          boardRelevance: 'BOARD-CORE',
        ),
      ],
    ),

    // ── Vascular Territories Tab ──
    TopicTab(
      title: 'Vascular Territories',
      blocks: [
        HeaderBlock('Arterial Territories & Clinical Correlates'),
        TextBlock(
          'Each major cerebral artery supplies specific brain regions. '
          'Understanding these territories allows clinicians to predict which '
          'artery is involved based on the presenting neurological deficits, '
          'and conversely, to anticipate deficits when imaging identifies the '
          'occluded vessel.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Middle Cerebral Artery (MCA)',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.account_tree,
          description:
              'The MCA is the largest cerebral artery and the most commonly '
              'affected in stroke. It supplies the lateral surface of the '
              'frontal, parietal, and temporal lobes.',
          keyPoints: [
            'Contralateral hemiparesis and hemisensory loss -- face and arm greater than leg',
            'Dominant hemisphere (usually left): Broca\'s aphasia (frontal), Wernicke\'s aphasia (temporal), global aphasia (large MCA)',
            'Non-dominant hemisphere (usually right): hemispatial neglect, anosognosia, aprosodia',
            'Contralateral homonymous hemianopia',
            'Lenticulostriate branches supply the internal capsule and basal ganglia',
          ],
        ),
        ComparisonCardBlock(
          title: 'Anterior Cerebral Artery (ACA)',
          themeColor: Color(0xFF16A34A),
          backgroundColor: Color(0xFFF0FDF4),
          icon: Icons.account_tree,
          description:
              'The ACA supplies the medial surface of the frontal and parietal '
              'lobes, including the leg area of the motor and sensory '
              'homunculus.',
          keyPoints: [
            'Contralateral hemiparesis -- leg greater than arm or face (opposite of MCA)',
            'Contralateral hemisensory loss -- leg greater than arm',
            'Urinary incontinence (damage to medial frontal micturition centers)',
            'Gait apraxia (frontal gait disorder)',
            'Abulia / akinetic mutism (bilateral ACA infarcts)',
            'Alien hand syndrome (if corpus callosum is affected)',
            'Personality changes (medial frontal lobe)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Posterior Cerebral Artery (PCA)',
          themeColor: Color(0xFFDC2626),
          backgroundColor: Color(0xFFFEF2F2),
          icon: Icons.account_tree,
          description:
              'The PCA supplies the occipital lobe, inferior temporal lobe, '
              'thalamus, and midbrain.',
          keyPoints: [
            'Contralateral homonymous hemianopia with macular sparing (dual blood supply to macula)',
            'Anton syndrome -- cortical blindness with denial of visual loss (bilateral PCA)',
            'Alexia without agraphia -- can write but cannot read (dominant PCA with splenium involvement)',
            'Visual agnosia and prosopagnosia',
            'Thalamic pain syndrome (Dejerine-Roussy) -- contralateral burning pain from thalamic infarction',
            'Memory impairment if medial temporal structures involved',
          ],
        ),
        PearlBlock(
          'Board Pearl: Territory Pattern Recognition',
          'Face and arm > leg = MCA territory. Leg > arm and face = ACA '
          'territory. Visual field cuts with macular sparing = PCA territory. '
          'This is one of the most commonly tested concepts on boards. '
          'Remember: the homunculus is "upside down" -- leg is medial (ACA), '
          'face/arm is lateral (MCA).',
        ),
        TableBlock(
          title: 'Watershed (Border Zone) Infarcts',
          columns: ['Zone', 'Location', 'Presentation'],
          rows: [
            ['Anterior watershed', 'ACA-MCA border zone', 'Proximal arm weakness ("man in a barrel" syndrome), transcortical motor aphasia'],
            ['Posterior watershed', 'MCA-PCA border zone', 'Visual processing deficits, transcortical sensory aphasia'],
            ['Internal watershed', 'Deep white matter between superficial and deep perforators', 'Motor deficits affecting upper extremity'],
          ],
        ),
        BulletCardBlock(
          title: 'Watershed Infarcts -- Causes and Clinical Pearls',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Occur at border zones between major arterial territories where perfusion pressure is lowest',
            'Typical cause: systemic hypotension (cardiac arrest, severe hemorrhage, prolonged hypotension during surgery)',
            'Also caused by proximal arterial stenosis (e.g., severe bilateral carotid stenosis) combined with hypotension',
            '"Man in a barrel" syndrome: bilateral ACA-MCA watershed infarcts causing bilateral proximal arm weakness with preserved leg and facial function',
            'Internal (deep) watershed infarcts appear as "string of pearls" on MRI in the deep white matter',
            'Transcortical aphasias (preserved repetition) are characteristic of watershed zone damage -- language cortex is spared but disconnected',
          ],
        ),
        TableBlock(
          title: 'MCA Territory -- Superior vs Inferior Division',
          columns: ['Feature', 'Superior Division', 'Inferior Division'],
          rows: [
            ['Territory', 'Frontal lobe, anterior parietal', 'Temporal lobe, posterior parietal'],
            ['Motor deficit', 'Contralateral face/arm weakness (prominent)', 'Minimal or absent motor deficit'],
            ['Sensory deficit', 'Contralateral face/arm sensory loss', 'Less prominent sensory loss'],
            ['Language (dominant)', 'Broca\'s aphasia (nonfluent, effortful)', 'Wernicke\'s aphasia (fluent, nonsensical)'],
            ['Visual field', 'Usually spared', 'Contralateral homonymous hemianopia (superior quadrantanopia)'],
            ['Neglect (non-dominant)', 'Moderate', 'Severe hemispatial neglect'],
            ['Other', 'Gaze deviation toward lesion', 'Gerstmann syndrome (left angular gyrus)'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Watershed Infarct Clue',
          'When a question describes bilateral proximal arm weakness after a '
          'hypotensive episode (cardiac surgery, massive hemorrhage), think '
          'bilateral watershed infarcts ("man in a barrel"). When a question '
          'describes a transcortical aphasia (intact repetition), think watershed '
          'infarct sparing the perisylvian language cortex.',
        ),
        KnowledgeCheckBlock(
          question: 'A patient presents with contralateral leg weakness greater than arm or face weakness, urinary incontinence, and gait apraxia. Which vascular territory is most likely affected?',
          options: ['MCA', 'ACA', 'PCA', 'Basilar artery'],
          correctIndex: 1,
          explanation: 'The ACA supplies the medial surface of the frontal and parietal lobes, including the leg area of the motor homunculus. The triad of leg-predominant weakness, urinary incontinence, and gait apraxia is classic for ACA territory infarction.',
          boardRelevance: 'BOARD-CORE',
        ),
        TableBlock(
          title: 'Visual Field Deficits by Lesion Location',
          columns: ['Lesion Location', 'Visual Field Deficit', 'Vascular Territory'],
          rows: [
            ['Optic nerve', 'Monocular blindness (ipsilateral eye)', 'Ophthalmic artery (ICA branch)'],
            ['Optic chiasm (center)', 'Bitemporal hemianopia', 'AComm aneurysm, pituitary tumor'],
            ['Optic tract', 'Contralateral homonymous hemianopia (incongruent)', 'Anterior choroidal artery, PCA'],
            ['Temporal lobe (Meyer\'s loop)', 'Contralateral superior quadrantanopia ("pie in the sky")', 'MCA inferior division'],
            ['Parietal lobe (optic radiation)', 'Contralateral inferior quadrantanopia ("pie on the floor")', 'MCA superior division'],
            ['Occipital cortex', 'Contralateral homonymous hemianopia WITH macular sparing', 'PCA'],
            ['Bilateral occipital cortex', 'Cortical blindness (Anton syndrome if with denial)', 'Bilateral PCA'],
          ],
        ),
      ],
    ),

    // ── CSF Tab ──
    TopicTab(
      title: 'CSF',
      blocks: [
        HeaderBlock('Cerebrospinal Fluid'),
        TextBlock(
          'Cerebrospinal fluid (CSF) cushions the brain and spinal cord, '
          'removes metabolic waste, and maintains a stable chemical '
          'environment. Understanding CSF dynamics is essential because '
          'disruptions can cause hydrocephalus, a common complication of '
          'hemorrhagic stroke.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'CSF Production & Characteristics',
          themeColor: Color(0xFF8B5CF6),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Produced primarily by the choroid plexus in the ventricles (70%)',
            'Additional production from brain parenchyma and ependymal lining (30%)',
            'Total CSF volume: approximately 120-150 mL in adults',
            'Production rate: approximately 20 mL/hour (~500 mL/day)',
            'CSF is turned over approximately 3-4 times per day',
            'Normal opening pressure: 70-180 mm H2O (lumbar puncture)',
          ],
        ),
        NumberedListBlock([
          MapEntry('CSF Flow Pathway', ''),
          MapEntry('Lateral ventricles', 'CSF produced by choroid plexus'),
          MapEntry('Foramen of Monro', 'Connects lateral ventricles to 3rd ventricle'),
          MapEntry('Third ventricle', 'Located between the two thalami'),
          MapEntry('Cerebral aqueduct (of Sylvius)', 'Narrowest point -- most common site of obstructive hydrocephalus'),
          MapEntry('Fourth ventricle', 'Located between the pons/cerebellum'),
          MapEntry('Foramina of Luschka (lateral) and Magendie (median)', 'Exit points to subarachnoid space'),
          MapEntry('Subarachnoid space', 'CSF circulates around brain and spinal cord'),
          MapEntry('Arachnoid granulations', 'CSF reabsorbed into the superior sagittal sinus (venous system)'),
        ]),
        PearlBlock(
          'Board Pearl: Hydrocephalus after Stroke',
          'Hemorrhagic stroke (especially IVH and SAH) commonly causes '
          'hydrocephalus by blocking CSF flow or impairing reabsorption at '
          'arachnoid granulations. The cerebral aqueduct of Sylvius is the '
          'narrowest point and most common site of obstruction. '
          'Communicating hydrocephalus (impaired absorption) is the most '
          'common type after SAH.',
        ),
        TableBlock(
          title: 'Types of Hydrocephalus',
          columns: ['Type', 'Mechanism', 'Common Causes in Stroke'],
          rows: [
            ['Obstructive (non-communicating)', 'Blockage within the ventricular system', 'Cerebellar hemorrhage compressing 4th ventricle, intraventricular hemorrhage (IVH)'],
            ['Communicating', 'Impaired absorption at arachnoid granulations', 'SAH -- blood products clog arachnoid granulations'],
            ['Normal pressure hydrocephalus (NPH)', 'Chronic communicating hydrocephalus with normal ICP', 'Late complication of SAH; classic triad: gait disturbance, urinary incontinence, dementia ("wet, wobbly, wacky")'],
          ],
        ),
        MnemonicBlock(
          'NPH Triad: "Wet, Wobbly, Wacky"',
          'Wet = Urinary incontinence\n'
          'Wobbly = Gait disturbance (magnetic gait) -- presents first and improves most with treatment\n'
          'Wacky = Dementia/cognitive changes -- presents last',
        ),
      ],
    ),
  ],
);
