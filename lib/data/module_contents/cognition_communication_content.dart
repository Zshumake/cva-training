import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData cognitionCommunicationContent = TopicData(
  id: 'cognition_communication',
  title: 'Cognition & Communication',
  tabs: [
    // ── Tab 1: Aphasia ──
    TopicTab(
      title: 'Aphasia',
      blocks: [
        HeaderBlock('Aphasia Classification'),
        TextBlock(
          'Aphasia is an acquired language disorder caused by brain damage, '
          'most commonly from left hemisphere stroke. It affects approximately '
          '21-38% of acute stroke patients. Aphasia is classified by three key '
          'parameters: fluency, comprehension, and repetition. Understanding '
          'this classification system is essential for board examinations.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Aphasia Classification Table',
          columns: [
            'Type',
            'Fluency',
            'Comprehension',
            'Repetition',
            'Naming',
            'Lesion Site',
          ],
          rows: [
            [
              'Global',
              'Nonfluent',
              'Impaired',
              'Impaired',
              'Impaired',
              'Large L MCA territory (frontal + temporal + parietal)',
            ],
            [
              'Broca (Expressive)',
              'Nonfluent',
              'Intact',
              'Impaired',
              'Impaired',
              'L inferior frontal gyrus (Brodmann 44, 45)',
            ],
            [
              'Wernicke (Receptive)',
              'Fluent',
              'Impaired',
              'Impaired',
              'Impaired',
              'L superior temporal gyrus (Brodmann 22)',
            ],
            [
              'Conduction',
              'Fluent',
              'Intact',
              'Impaired',
              'Impaired',
              'Arcuate fasciculus (connects Broca and Wernicke)',
            ],
            [
              'Transcortical Motor',
              'Nonfluent',
              'Intact',
              'INTACT',
              'Impaired',
              'Anterior/superior to Broca area (watershed)',
            ],
            [
              'Transcortical Sensory',
              'Fluent',
              'Impaired',
              'INTACT',
              'Impaired',
              'Posterior to Wernicke area (watershed)',
            ],
            [
              'Transcortical Mixed',
              'Nonfluent',
              'Impaired',
              'INTACT',
              'Impaired',
              'Watershed territory (isolation of speech area)',
            ],
            [
              'Anomic',
              'Fluent',
              'Intact',
              'Intact',
              'Impaired',
              'Angular gyrus or various L hemisphere locations',
            ],
          ],
        ),
        KnowledgeCheckBlock(
          question: 'Which feature of aphasia classification distinguishes transcortical aphasias from perisylvian aphasias (Broca, Wernicke, Conduction, Global)?',
          options: ['Fluency', 'Comprehension', 'Repetition', 'Naming'],
          correctIndex: 2,
          explanation: 'REPETITION is the key discriminating feature. Transcortical aphasias have INTACT repetition because the perisylvian language zone is preserved -- the lesion is outside this zone in the watershed areas. All perisylvian aphasias have impaired repetition.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'The Repetition Rule',
          'REPETITION is the key discriminating feature for classification: '
          'Transcortical aphasias have INTACT repetition because the '
          'perisylvian language zone (Broca + Wernicke + arcuate fasciculus) '
          'is intact — the lesion is OUTSIDE this zone in the watershed areas. '
          'All other aphasias (Broca, Wernicke, Global, Conduction) have '
          'IMPAIRED repetition because the perisylvian zone is damaged.',
        ),
        MnemonicBlock(
          'Aphasia Classification Mnemonic',
          'Think of the "Big 3" features: Fluency, Comprehension, Repetition. '
          'Broca = Broken speech (Nonfluent, good Comprehension, poor Repetition). '
          'Wernicke = Wordy but Wrong (Fluent, poor Comprehension, poor Repetition). '
          'Conduction = Connection broken (Fluent, good Comprehension, poor Repetition — arcuate fasciculus disconnect). '
          'Transcortical = INTACT Repetition always (lesion outside perisylvian zone). '
          'Anomic = Almost normal except naming (mildest form).',
        ),
        PearlBlock(
          'Conduction Aphasia — Arcuate Fasciculus',
          'Conduction aphasia is caused by damage to the arcuate fasciculus, '
          'the white matter tract connecting Wernicke area to Broca area. '
          'Hallmark: disproportionately impaired REPETITION with relatively '
          'preserved fluency and comprehension. Patients make phonemic '
          'paraphasic errors and demonstrate "conduit d\'approche" — repeated '
          'self-correction attempts that get progressively closer to the target '
          'word.',
        ),
        BulletCardBlock(
          title: 'Aphasia Rehabilitation',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Constraint-Induced Language Therapy (CILT) — force verbal output',
            'Melodic Intonation Therapy (MIT) — uses singing to access right hemisphere',
            'MIT most effective for nonfluent aphasia with intact comprehension (Broca)',
            'Augmentative and Alternative Communication (AAC) devices',
            'Speech-language pathology — early and intensive is better',
            'Most spontaneous language recovery occurs in first 3-6 months',
            'Chronic aphasia can still improve with intensive therapy',
          ],
        ),
        TableBlock(
          title: 'Aphasia Recovery Patterns by Type',
          columns: ['Aphasia Type', 'Recovery Pattern', 'Prognosis'],
          rows: [
            [
              'Anomic',
              'Best recovery — mildest form, naming deficits often improve significantly',
              'BEST prognosis of all aphasia types',
            ],
            [
              'Broca (Expressive)',
              'Comprehension remains strong; verbal output improves but often remains nonfluent with telegraphic speech',
              'Moderate prognosis — expressive deficits frequently persist long-term',
            ],
            [
              'Wernicke (Receptive)',
              'Comprehension typically improves over first 3-6 months; paraphasic errors decrease',
              'Variable — comprehension often improves but self-monitoring deficits may persist',
            ],
            [
              'Conduction',
              'Repetition and naming improve; phonemic paraphasias decrease over time',
              'Good prognosis — often evolves into anomic aphasia',
            ],
            [
              'Global',
              'Limited recovery if lesion is large (full MCA territory); some may evolve to Broca pattern',
              'POOREST prognosis — large lesions involving both Broca and Wernicke areas',
            ],
            [
              'Transcortical Motor',
              'Often recovers well due to intact perisylvian zone; initiation improves',
              'Good prognosis — intact repetition is a favorable sign',
            ],
          ],
        ),
        ComparisonCardBlock(
          title: 'Speech vs Language — A Critical Distinction',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          icon: Icons.record_voice_over,
          description:
              'Speech and language are distinct processes. Confusing them leads '
              'to incorrect localization and treatment.',
          keyPoints: [
            'SPEECH = motor production of sounds (articulation, phonation, resonance, prosody)',
            'LANGUAGE = symbolic system for communication (semantics, syntax, comprehension, expression)',
            'Dysarthria = SPEECH disorder — slurred, imprecise articulation from neuromuscular impairment (UMN, LMN, cerebellar, extrapyramidal)',
            'Dysphonia = SPEECH disorder — abnormal voice quality from vocal cord dysfunction',
            'Aphasia = LANGUAGE disorder — impaired ability to formulate or comprehend language',
            'A patient with dysarthria has slurred speech but NORMAL language — they know the right words but cannot articulate them',
            'A patient with aphasia may have clear articulation but WRONG words (paraphasias) or cannot find words',
            'Apraxia of speech = motor programming disorder — inconsistent errors, groping for correct articulatory positions, distinct from dysarthria and aphasia',
          ],
        ),
        PearlBlock(
          'Crossed Aphasia',
          'Crossed aphasia refers to aphasia caused by a RIGHT hemisphere '
          'lesion in a RIGHT-HANDED person. This is rare, occurring in fewer '
          'than 5% of right-handed aphasic patients, because 95-99% of '
          'right-handed individuals have left hemisphere language dominance. '
          'In left-handed patients, language is still left-lateralized in '
          '~70% and bilateral in ~15%, so right hemisphere lesions causing '
          'aphasia are more common but still not the norm. Crossed aphasia '
          'may have atypical recovery patterns compared to standard aphasia.',
        ),
      ],
    ),

    // ── Tab 2: Neglect & Perception ──
    TopicTab(
      title: 'Neglect & Perception',
      blocks: [
        HeaderBlock('Hemispatial Neglect & Perceptual Deficits'),
        TextBlock(
          'Hemispatial neglect is a failure to attend to, respond to, or orient '
          'toward stimuli presented contralateral to a brain lesion. It occurs '
          'most commonly with RIGHT parietal lobe damage (left neglect) and is '
          'one of the strongest negative predictors of functional recovery '
          'after stroke.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Types of Neglect',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Personal neglect — failure to attend to the left side of own body',
            'Peripersonal neglect — failure to attend to objects within reach on the left',
            'Extrapersonal neglect — failure to attend to far space on the left',
            'Motor neglect — failure to move the left limbs even when strength is present',
            'Sensory neglect — extinction to simultaneous bilateral stimulation',
            'Representational neglect — failure to represent left side in mental imagery',
          ],
        ),
        BulletCardBlock(
          title: 'Bedside Tests for Neglect',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Line bisection test — patient marks center of a horizontal line (deviates right)',
            'Star/letter cancellation test — patient crosses out targets on a page (misses left side)',
            'Clock drawing — numbers crowded on right side of clock face',
            'Copy drawing — omits left side of copied figure',
            'Double simultaneous stimulation — extinguishes left stimulus when bilateral',
            'Catherine Bergego Scale — standardized assessment of functional neglect in ADLs',
            'Behavioral Inattention Test (BIT) — comprehensive standardized battery',
          ],
        ),
        KnowledgeCheckBlock(
          question: 'A patient cannot pantomime brushing teeth on command but performs the task spontaneously when given a toothbrush. What type of apraxia is this?',
          options: ['Ideational apraxia', 'Ideomotor apraxia', 'Constructional apraxia', 'Dressing apraxia'],
          correctIndex: 1,
          explanation: 'Ideomotor apraxia is characterized by inability to execute a learned motor act on command despite understanding and intact motor function. The hallmark is voluntary-automatic dissociation -- performance improves with actual tool use. Most commonly from left hemisphere lesions.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'Why Right Hemisphere Neglect Is Worse',
          'Left neglect (from RIGHT hemisphere damage) is far more common and '
          'severe than right neglect (from LEFT hemisphere damage). This is '
          'because the RIGHT hemisphere attends to BOTH sides of space, while '
          'the LEFT hemisphere attends primarily to the RIGHT side. When the '
          'right hemisphere is damaged, the left hemisphere cannot compensate '
          'for the left side of space. When the left hemisphere is damaged, '
          'the intact right hemisphere can still attend to both sides.',
        ),
        ComparisonCardBlock(
          title: 'Anosognosia',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          icon: Icons.psychology,
          description:
              'Unawareness or denial of neurological deficit. Most commonly '
              'seen with RIGHT hemisphere stroke.',
          keyPoints: [
            'Patient denies or is unaware of hemiplegia, visual field cut, or neglect',
            'Distinct from psychological denial — this is a neurological deficit',
            'Associated with right parietal and insular lesions',
            'Severe negative prognostic indicator for rehabilitation',
            'Patients may attempt unsafe activities because they deny deficits',
            'May partially improve over weeks to months',
            'Anosodiaphoria — awareness of deficit but lack of concern about it',
          ],
        ),
        HeaderBlock('Apraxia'),
        TableBlock(
          title: 'Types of Apraxia',
          columns: ['Type', 'Definition', 'Lesion Site', 'Example'],
          rows: [
            [
              'Ideomotor',
              'Cannot perform a learned motor act on command despite understanding and intact motor function',
              'Left parietal, SMA, premotor',
              'Cannot pantomime brushing teeth on command but does it spontaneously',
            ],
            [
              'Ideational',
              'Cannot sequence multi-step tasks or conceptualize the plan',
              'Left parietal, diffuse',
              'Cannot sequence steps to make coffee (puts filter, water, grounds in wrong order)',
            ],
            [
              'Constructional',
              'Cannot draw or copy spatial figures',
              'Right parietal (spatial type), Left parietal (simplified type)',
              'Cannot copy a cube or draw a clock face',
            ],
            [
              'Dressing',
              'Cannot orient clothing to body for dressing',
              'Right parietal',
              'Puts arm through head opening, cannot orient shirt',
            ],
          ],
        ),
        PearlBlock(
          'Ideomotor Apraxia — Most Tested Type',
          'In ideomotor apraxia, the patient KNOWS what to do and has the motor '
          'ability but cannot execute the movement on COMMAND. Key feature: '
          'performance improves with imitation and is best with actual tool use '
          '(voluntary-automatic dissociation). The concept is intact but the '
          'translation from concept to motor execution is disrupted. '
          'Most commonly from LEFT hemisphere lesions.',
        ),
      ],
    ),

    // ── Tab 3: Cognition ──
    TopicTab(
      title: 'Cognition',
      blocks: [
        HeaderBlock('Cognitive Deficits After Stroke'),
        TextBlock(
          'Cognitive impairment affects up to 70% of stroke survivors and '
          'includes deficits in attention, memory, executive function, and '
          'visuospatial processing. Cognitive deficits significantly impact '
          'rehabilitation participation, functional outcomes, and quality '
          'of life.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Cognitive Domains and Stroke Localization',
          columns: ['Domain', 'Deficit', 'Common Lesion Location'],
          rows: [
            ['Attention', 'Sustained attention, selective attention, divided attention', 'Right hemisphere, reticular formation, prefrontal'],
            ['Memory', 'Encoding new information, retrieval, working memory', 'Hippocampus, thalamus, prefrontal cortex'],
            ['Executive Function', 'Planning, initiation, sequencing, cognitive flexibility, judgment', 'Prefrontal cortex (bilateral), caudate'],
            ['Visuospatial', 'Spatial perception, figure-ground, depth perception', 'Right parietal, right temporal-occipital'],
            ['Processing Speed', 'Slowed information processing', 'White matter tracts, diffuse'],
            ['Language', 'Aphasia spectrum', 'Left perisylvian and surrounding areas'],
          ],
        ),
        BulletCardBlock(
          title: 'Right Hemisphere Cognitive Syndrome',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Left hemispatial neglect (most prominent feature)',
            'Anosognosia (denial of deficits)',
            'Impaired visuospatial processing',
            'Prosopagnosia (difficulty recognizing faces)',
            'Flat affect or aprosodia (impaired emotional tone of speech)',
            'Impulsive behavior and poor safety awareness',
            'Constructional apraxia',
            'Left homonymous hemianopia',
            'Often MORE functionally disabling than left hemisphere stroke despite preserved language',
          ],
        ),
        BulletCardBlock(
          title: 'Left Hemisphere Cognitive Syndrome',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Aphasia (most prominent feature)',
            'Ideomotor and ideational apraxia',
            'Right-left confusion (Gerstmann syndrome)',
            'Agraphia, acalculia, finger agnosia (Gerstmann syndrome)',
            'Depression (slightly more common than right hemisphere)',
            'Cautious, slow behavior',
            'Right homonymous hemianopia',
            'Alexia (reading impairment)',
          ],
        ),
        TimelineBlock(
          title: 'Aphasia Recovery Timeline by Severity',
          milestones: [
            TimelineMilestone(
              label: 'Weeks 1-4',
              title: 'Rapid Spontaneous Recovery Phase',
              details: ['Most significant language gains occur', 'Resolution of diaschisis and edema', 'Global aphasia may begin evolving toward Broca pattern'],
            ),
            TimelineMilestone(
              label: 'Months 1-3',
              title: 'Active Recovery Window',
              details: ['Anomic aphasia: substantial naming improvement', 'Conduction aphasia: often evolves to anomic type', 'Intensive SLP therapy yields greatest gains'],
            ),
            TimelineMilestone(
              label: 'Months 3-6',
              title: 'Most Spontaneous Recovery Complete',
              details: ['Broca: verbal output improves but telegraphic speech often persists', 'Wernicke: comprehension typically improves; paraphasias decrease', 'Global: limited if large lesion; some may reach Broca pattern'],
            ),
            TimelineMilestone(
              label: 'Months 6-12',
              title: 'Continued Therapy-Driven Gains',
              details: ['Slower rate of improvement', 'Compensatory strategies become more important', 'AAC devices introduced for persistent severe aphasia'],
            ),
            TimelineMilestone(
              label: '12+ months',
              title: 'Chronic Aphasia',
              details: ['Intensive therapy (CILT, MIT) can still produce gains', 'Anomic aphasia: best long-term prognosis', 'Global aphasia: poorest prognosis if large MCA territory lesion'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'Which cognitive screening tool is PREFERRED over the MMSE for detecting post-stroke cognitive impairment?',
          options: ['Trail Making Test', 'Montreal Cognitive Assessment (MoCA)', 'Clock Drawing Test', 'Cognitive FIM'],
          correctIndex: 1,
          explanation: 'The MoCA is more sensitive than the MMSE for detecting post-stroke cognitive impairment, particularly in executive function and visuospatial domains. Up to 50% of patients with post-stroke cognitive impairment score normal on MMSE but abnormal on MoCA.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'Gerstmann Syndrome',
          'Gerstmann syndrome results from a LEFT angular gyrus lesion and '
          'consists of four deficits: (1) Finger agnosia (cannot identify '
          'fingers), (2) Right-left confusion, (3) Agraphia (writing impairment), '
          '(4) Acalculia (calculation impairment). The full tetrad is not '
          'always present. This is a classic board question localizing to the '
          'dominant (usually left) parietal lobe.',
        ),
        BulletCardBlock(
          title: 'Cognitive Assessment Tools',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Montreal Cognitive Assessment (MoCA) — sensitive screening (score <=25 = impaired)',
            'Mini-Mental State Examination (MMSE) — less sensitive for executive and visuospatial',
            'Trail Making Test (Part A & B) — attention and executive function',
            'Clock Drawing Test — visuospatial and executive',
            'Cognitive FIM — comprehension, expression, social interaction, problem solving, memory',
            'Neuropsychological testing battery — comprehensive but time-intensive',
          ],
        ),
        ComparisonCardBlock(
          title: 'MoCA vs MMSE for Post-Stroke Cognitive Screening',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          icon: Icons.assessment,
          description:
              'The Montreal Cognitive Assessment (MoCA) is more sensitive than '
              'the MMSE for detecting post-stroke cognitive impairment, particularly '
              'in executive function and visuospatial domains.',
          keyPoints: [
            'MoCA: 30-point scale, score <=25 suggests cognitive impairment (+1 point if <=12 years education)',
            'Tests executive function (Trail Making B adaptation, verbal fluency, abstraction)',
            'Tests visuospatial/constructional skills (cube copy, clock drawing)',
            'Tests attention, concentration, working memory (serial 7s, digit span, target detection)',
            'Tests memory with delayed recall (5 words at 5 minutes — no cues initially)',
            'MMSE: 30-point scale, score <=23 suggests dementia — but MISSES mild cognitive impairment',
            'MMSE overemphasizes orientation and language, underrepresents executive function',
            'Up to 50% of patients with post-stroke cognitive impairment score NORMAL on MMSE but ABNORMAL on MoCA',
            'Board pearl: MoCA is the preferred screening tool for post-stroke cognitive impairment',
          ],
        ),
        ComparisonCardBlock(
          title: 'Vascular Dementia & Vascular Cognitive Impairment',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          icon: Icons.psychology_alt,
          description:
              'Vascular dementia is the second most common cause of dementia '
              'after Alzheimer disease. It includes multi-infarct dementia, '
              'strategic single-infarct dementia, and subcortical ischemic '
              'vascular dementia.',
          keyPoints: [
            'Multi-infarct dementia: cumulative effect of multiple cortical and subcortical infarcts',
            'Stepwise deterioration pattern — cognitive decline with each new stroke event',
            'Strategic single-infarct dementia: single stroke in a critical location (thalamus, angular gyrus, hippocampus, caudate)',
            'Subcortical ischemic vascular dementia (Binswanger disease): diffuse white matter disease with executive dysfunction, psychomotor slowing',
            'Distinguishing feature: executive dysfunction and processing speed are more prominently impaired than memory (unlike Alzheimer)',
            'Hachinski Ischemic Score: clinical tool to differentiate vascular dementia from Alzheimer (score >=7 = vascular)',
            'Risk factors: same as stroke — hypertension, diabetes, AF, hyperlipidemia, smoking',
            'Prevention = stroke prevention — controlling vascular risk factors is the primary treatment',
            'Post-stroke dementia occurs in ~30% of stroke survivors within the first year',
          ],
        ),
        TableBlock(
          title: 'Cognitive Domains — Detailed Impact After Stroke',
          columns: ['Domain', 'Typical Deficits', 'Functional Impact', 'Assessment'],
          rows: [
            [
              'Attention',
              'Sustained attention (vigilance), selective attention (filtering distractions), divided attention (multitasking)',
              'Cannot follow multistep commands, easily distracted during therapy, safety risks',
              'Digit span, continuous performance test, Trail Making A',
            ],
            [
              'Memory',
              'Encoding and retrieval deficits; working memory impairment; prospective memory (remembering to do things)',
              'Cannot learn new routines, forgets therapy instructions, medication non-adherence',
              'MoCA delayed recall, Rey Auditory Verbal Learning Test',
            ],
            [
              'Executive Function',
              'Planning, initiation, sequencing, cognitive flexibility, judgment, self-monitoring, abstract reasoning',
              'Cannot plan meals, manage finances, problem-solve novel situations; impulsive or apathetic behavior',
              'Trail Making B, Wisconsin Card Sorting, verbal fluency, clock drawing',
            ],
            [
              'Processing Speed',
              'Slowed information processing across all cognitive tasks',
              'Needs more time for all activities; appears confused when pace is too fast',
              'Timed tasks: Trail Making, Symbol Digit Modalities Test',
            ],
            [
              'Visuospatial',
              'Spatial perception, figure-ground discrimination, depth perception, spatial relationships',
              'Difficulty navigating environment, dressing, driving; construction and drawing impaired',
              'Line bisection, clock drawing, block design, figure copy',
            ],
          ],
        ),
      ],
    ),

    // ── Tab 4: Depression ──
    TopicTab(
      title: 'Depression',
      blocks: [
        HeaderBlock('Poststroke Depression & Emotional Disorders'),
        TextBlock(
          'Poststroke depression (PSD) affects up to 33-50% of stroke survivors '
          'and is the most common emotional disorder after stroke. It '
          'significantly impairs rehabilitation participation, functional '
          'recovery, quality of life, and survival. Both biological '
          '(neurochemical disruption) and psychological (grief, loss of '
          'function) factors contribute.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Poststroke Depression Key Facts',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Prevalence: 33-50% within the first year',
            'Peak onset: 3-6 months poststroke (can occur at any time)',
            'Previously attributed to left frontal lesions (Robinson hypothesis) — now debated',
            'Current evidence: location is less important than severity and disability',
            'Underdiagnosed — especially in aphasic patients',
            'Associated with worse functional outcomes and increased mortality',
            'Independent risk factor for recurrent stroke',
            'Screening should be routine in all stroke patients',
          ],
        ),
        TableBlock(
          title: 'Depression vs Emotional Lability (Pseudobulbar Affect)',
          columns: ['Feature', 'Depression', 'Pseudobulbar Affect (PBA)'],
          rows: [
            ['Nature', 'Sustained mood disorder', 'Involuntary emotional display'],
            ['Duration', 'Weeks to months', 'Brief episodes (seconds to minutes)'],
            ['Trigger', 'May be situational or spontaneous', 'Minimal or no stimulus'],
            ['Congruence', 'Emotion matches internal state', 'Display may NOT match internal state'],
            ['Crying/Laughing', 'Crying with depressed mood', 'Crying OR laughing without matching mood'],
            ['Lesion', 'Variable, frontal/subcortical', 'Bilateral corticobulbar tracts'],
            ['Treatment', 'SSRIs, psychotherapy', 'Dextromethorphan/quinidine (Nuedexta), SSRIs'],
          ],
        ),
        PearlBlock(
          'Pseudobulbar Affect Is NOT Depression',
          'Pseudobulbar affect (PBA, formerly "emotional lability" or '
          '"pathological crying/laughing") is an involuntary emotional display '
          'that is DISPROPORTIONATE or INCONGRUENT to the patient\'s internal '
          'emotional state. The patient may cry uncontrollably without feeling '
          'sad, or laugh at inappropriate times. It results from bilateral '
          'disruption of corticobulbar pathways. Treatment: '
          'dextromethorphan/quinidine (Nuedexta) is FDA-approved. SSRIs are '
          'also effective. This is distinct from depression.',
        ),
        BulletCardBlock(
          title: 'Treatment of Poststroke Depression',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'SSRIs are first-line pharmacotherapy (citalopram, sertraline, fluoxetine)',
            'Avoid tricyclics as first-line — anticholinergic effects, cardiac risk, seizure threshold',
            'SNRIs (venlafaxine, duloxetine) are second-line alternatives',
            'Methylphenidate or other stimulants for apathy and psychomotor retardation',
            'Stimulants may be used for rapid-onset effect while waiting for SSRI to work',
            'Cognitive behavioral therapy (CBT) when feasible',
            'Exercise has demonstrated antidepressant effects',
            'Treat for at least 6-12 months; reassess before discontinuation',
          ],
        ),
        PearlBlock(
          'SSRIs and Stimulants Together',
          'SSRIs (onset 2-4 weeks) are the mainstay of PSD treatment, but '
          'stimulants (methylphenidate) can be added for rapid effect on apathy, '
          'fatigue, and psychomotor retardation — common poststroke symptoms '
          'that impede rehabilitation participation. The combination is '
          'frequently used in rehabilitation settings. Monitor for agitation, '
          'hypertension, and appetite suppression with stimulants.',
        ),
        BulletCardBlock(
          title: 'Screening for Poststroke Depression',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'PHQ-9 or PHQ-2 — most commonly used screening tools',
            'Stroke Aphasic Depression Questionnaire (SADQ) for aphasic patients',
            'Visual Analog Mood Scale (VAMS) for patients with communication barriers',
            'Hamilton Depression Rating Scale (HAM-D) for severity assessment',
            'Screen at admission, during rehab, and at follow-up visits',
            'Caregiver depression should also be assessed — up to 30-40% of caregivers',
          ],
        ),
        ComparisonCardBlock(
          title: 'Pseudobulbar Affect (PBA) — Detailed',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          icon: Icons.mood,
          description:
              'Involuntary, exaggerated, or inappropriate emotional expression '
              'that is disproportionate to or incongruent with the underlying mood. '
              'Prevalence: 10-20% of stroke survivors.',
          keyPoints: [
            'Also known as: emotional lability, pathological crying/laughing, involuntary emotional expression disorder (IEED)',
            'Mechanism: disruption of bilateral corticobulbar tracts releasing the brainstem emotional motor system from cortical inhibition',
            'Common triggers: minimal emotional or social stimuli, or no trigger at all',
            'Episodes are brief (seconds to minutes) but highly distressing and socially disabling',
            'Patient often reports "I am not actually sad" during uncontrollable crying',
            'Dextromethorphan/quinidine (Nuedexta) — only FDA-approved treatment for PBA',
            'Nuedexta dosing: DM 20mg/quinidine 10mg — quinidine inhibits CYP2D6 to increase DM bioavailability',
            'SSRIs (sertraline, citalopram) also effective — lower cost alternative',
            'Must distinguish from depression — PBA episodes are brief and not sustained mood changes',
          ],
        ),
        ComparisonCardBlock(
          title: 'Post-Stroke Fatigue',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          icon: Icons.battery_1_bar,
          description:
              'An overwhelming sense of tiredness, lack of energy, and exhaustion '
              'that is disproportionate to activity level. Affects 25-85% of '
              'stroke survivors and is often undertreated.',
          keyPoints: [
            'Prevalence: 25-85% depending on definition and timing of assessment',
            'Distinct from depression — fatigue can occur WITHOUT depressed mood',
            'Distinct from physical deconditioning — persists even after physical recovery',
            'Mechanism: likely involves disruption of reticular activating system, thalamic connections, and neuroinflammation',
            'Major barrier to rehabilitation participation — patients cannot sustain therapy sessions',
            'Associated with worse functional outcomes independent of stroke severity',
            'Treatment: energy conservation strategies, graded exercise, sleep hygiene optimization',
            'Pharmacologic trials: modafinil, methylphenidate — limited evidence, off-label use',
            'Fatigue Severity Scale (FSS) — most commonly used screening tool',
            'Often persists for YEARS after stroke — requires long-term management',
          ],
        ),
        BulletCardBlock(
          title: 'Return to Work — Predictors and Barriers',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Only 25-50% of working-age stroke survivors return to work',
            'Strongest predictors: younger age (<55), mild stroke severity, white-collar occupation',
            'Cognitive function (especially executive function and processing speed) is often MORE limiting than motor deficits',
            'Aphasia severity: patients with moderate-severe aphasia have very low return-to-work rates',
            'Employer flexibility and willingness to modify duties significantly impacts outcomes',
            'Pre-stroke job characteristics: sedentary vs manual labor, supervisory vs entry-level',
            'Fatigue is a major underrecognized barrier — patients cannot sustain a full workday',
            'Depression independently reduces return-to-work rates',
            'Vocational rehabilitation and supported employment programs improve outcomes',
            'ADA (Americans with Disabilities Act) mandates reasonable accommodations',
          ],
        ),
        BulletCardBlock(
          title: 'Driving After Stroke — Evaluation Requirements',
          themeColor: Color(0xFF059669),
          backgroundColor: Color(0xFFECFDF5),
          points: [
            'Most states require a minimum waiting period (typically 3-6 months) before driving after stroke',
            'Laws are STATE-SPECIFIC — no uniform federal regulation for private vehicles',
            'Comprehensive Driving Evaluation (CDE) by a certified driver rehabilitation specialist (CDRS)',
            'CDE includes: clinical assessment (vision, cognition, motor) + behind-the-wheel evaluation',
            'Visual field requirements: most states require minimum 120-degree horizontal field of view',
            'Homonymous hemianopia: varies by state — some allow with compensatory scanning, others prohibit',
            'Cognitive requirements: intact attention, judgment, processing speed, decision-making',
            'If seizures occurred: typically requires 3-12 month seizure-free interval (state-specific)',
            'Vehicle modifications: left-foot accelerator, hand controls, spinner knob, adaptive mirrors',
            'Physician reporting: mandatory in some states, voluntary in others — know your state law',
          ],
        ),
      ],
    ),
  ],
);
