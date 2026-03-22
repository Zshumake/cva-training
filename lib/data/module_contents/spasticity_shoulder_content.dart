import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData spasticityShoulderContent = TopicData(
  id: 'spasticity_shoulder',
  title: 'Spasticity & Shoulder Complications',
  tabs: [
    // ── Tab 1: Spasticity ──
    TopicTab(
      title: 'Spasticity',
      blocks: [
        HeaderBlock('Spasticity After Stroke'),
        TextBlock(
          'Spasticity is a velocity-dependent increase in muscle tone due to '
          'hyperexcitability of the stretch reflex. It develops in approximately '
          '20-40% of stroke survivors and follows a characteristic pattern: '
          'upper extremity flexor synergy and lower extremity extensor synergy. '
          'It typically emerges days to weeks after stroke and peaks around '
          '1-3 months.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Classic Spasticity Patterns',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'UE FLEXOR pattern: shoulder adduction/internal rotation, elbow flexion, forearm pronation, wrist flexion, finger flexion, thumb-in-palm',
            'LE EXTENSOR pattern: hip extension/adduction/internal rotation, knee extension, ankle plantarflexion/inversion, toe flexion/curling',
            'Results in classic hemiplegic posture and gait',
            'Hemiplegic gait: circumduction pattern due to stiff extended leg',
          ],
        ),
        ScaleBlock(
          scaleName: 'Modified Ashworth Scale (MAS)',
          description:
              'Grades resistance to passive stretch on a 0-4 scale. '
              'The most widely used clinical measure of spasticity.',
          columns: ['Grade', 'Description'],
          rows: [
            ['0', 'No increase in muscle tone'],
            [
              '1',
              'Slight increase in tone — catch and release at end range '
              'of motion',
            ],
            [
              '1+',
              'Slight increase in tone — catch followed by minimal '
              'resistance through less than half of ROM',
            ],
            [
              '2',
              'More marked increase through most of ROM, but limb '
              'easily moved',
            ],
            [
              '3',
              'Considerable increase in tone — passive movement difficult',
            ],
            ['4', 'Limb rigid in flexion or extension'],
          ],
          boardPearl:
              'The Modified Ashworth Scale is a 6-point ordinal scale (0, 1, '
              '1+, 2, 3, 4). The "1+" grade distinguishes it from the original '
              'Ashworth scale. It measures resistance to passive stretch but '
              'does NOT differentiate between neural (spasticity) and non-neural '
              '(contracture) components. The Tardieu scale is more specific '
              'for true spasticity.',
        ),
        HeaderBlock('Spasticity Treatment Ladder'),
        NumberedListBlock([
          MapEntry(
            'Stretching & Positioning',
            'Daily ROM exercises, prolonged stretching, proper positioning '
            'to counteract spastic patterns. Foundation of all spasticity '
            'management.',
          ),
          MapEntry(
            'Splinting & Orthotics',
            'Static or dynamic splints to maintain range and prevent '
            'contracture. AFO for ankle/foot. Resting hand splint to prevent '
            'wrist/finger flexion contracture.',
          ),
          MapEntry(
            'Oral Medications',
            'Baclofen (GABA-B agonist), tizanidine (alpha-2 agonist), '
            'dantrolene (direct muscle relaxant — acts peripherally on '
            'ryanodine receptor). Side effects: sedation (baclofen, tizanidine), '
            'hepatotoxicity (dantrolene).',
          ),
          MapEntry(
            'Botulinum Toxin Injections',
            'OnabotulinumtoxinA (Botox) or abobotulinumtoxinA (Dysport). '
            'Blocks presynaptic acetylcholine release at NMJ. Focal treatment '
            'for specific muscles. Onset 2-3 days, peak 2-6 weeks, duration '
            '3-6 months.',
          ),
          MapEntry(
            'Phenol/Alcohol Nerve Blocks',
            'Chemical neurolysis with phenol (5-7%) or alcohol (45-100%). '
            'Denatures protein causing wallerian degeneration. Immediate '
            'onset, lasts 3-6 months. Best for large muscles or mixed nerves. '
            'Risk: dysesthesia if injected near sensory nerves.',
          ),
          MapEntry(
            'Intrathecal Baclofen (ITB) Pump',
            'Surgically implanted pump delivers baclofen directly to '
            'intrathecal space. 100-1000x more effective than oral baclofen '
            'at 1/100th the dose. Best for severe bilateral/generalized '
            'spasticity. Trial injection required before implantation.',
          ),
        ]),
        PearlBlock(
          'Botox vs Phenol',
          'Botulinum toxin is preferred for small muscles and when precise '
          'targeting is needed. Phenol is preferred for large muscles '
          '(hip adductors) or when cost is a factor. Phenol risks painful '
          'dysesthesia if injected near sensory nerve components — avoid in '
          'mixed motor/sensory nerves. Botox has NO sensory side effects. '
          'Both can be combined in the same treatment session.',
        ),
        PearlBlock(
          'Spasticity Can Be Beneficial',
          'Not all spasticity should be treated. Some patients USE extensor '
          'spasticity in the LE for standing and transfers (acts as an '
          'internal splint). Reducing LE extensor tone may paradoxically '
          'worsen function. Always assess functional impact before treating.',
        ),
        ScaleBlock(
          scaleName: 'Tardieu Scale',
          description:
              'Measures spasticity by assessing the muscle reaction at specified '
              'velocities of passive stretch. More specific for true spasticity '
              '(velocity-dependent) than the Modified Ashworth Scale.',
          columns: ['Feature', 'Tardieu Scale', 'Modified Ashworth Scale'],
          rows: [
            ['What it measures', 'Velocity-dependent catch angle', 'Resistance to passive stretch at one speed'],
            ['Testing speeds', 'Three velocities: V1 (slow as gravity), V2 (speed of gravity), V3 (fast as possible)', 'One standard speed'],
            ['Key measurement', 'Angle of catch (R1) vs full passive ROM (R2); R2-R1 = dynamic component of tone', 'Ordinal grade 0-4'],
            ['Differentiates neural vs non-neural', 'YES -- R2-R1 difference identifies neural (spastic) component', 'NO -- cannot distinguish spasticity from contracture'],
            ['Clinical advantage', 'Detects true velocity-dependent spasticity', 'Simple, quick, widely used'],
            ['Limitation', 'More complex to administer, less standardized', 'Poor inter-rater reliability, does not capture velocity-dependence'],
          ],
          boardPearl:
              'The Tardieu Scale is more specific for true spasticity than the '
              'MAS because it tests at multiple velocities and quantifies the '
              'dynamic catch angle. The difference between R1 (angle of catch '
              'at fast speed) and R2 (full passive ROM at slow speed) represents '
              'the neural (treatable) component of tone. A large R2-R1 gap suggests '
              'significant spasticity amenable to botulinum toxin. A small gap '
              'with limited R2 suggests fixed contracture requiring surgical or '
              'casting intervention.',
        ),
        TableBlock(
          title: 'Botulinum Toxin Injection Targets in Stroke',
          columns: ['Region', 'Target Muscle', 'Spastic Pattern Treated', 'Injection Guidance'],
          rows: [
            ['UE -- Elbow flexion', 'Biceps brachii, Brachialis, Brachioradialis', 'Elbow flexion in UE flexor synergy', 'EMG, ultrasound, or e-stim guided'],
            ['UE -- Forearm pronation', 'Pronator teres, Pronator quadratus', 'Persistent forearm pronation', 'EMG or ultrasound guided'],
            ['UE -- Wrist flexion', 'Flexor carpi radialis (FCR), Flexor carpi ulnaris (FCU)', 'Wrist flexion deformity', 'Palpation or ultrasound; FCR most common target'],
            ['UE -- Finger flexion', 'Flexor digitorum profundus (FDP), Flexor digitorum superficialis (FDS)', 'Clenched fist, hygiene difficulty', 'Ultrasound preferred; both superficial and deep flexors'],
            ['UE -- Thumb-in-palm', 'Flexor pollicis longus, Adductor pollicis, 1st dorsal interosseous', 'Thumb adducted across palm', 'Small muscles; use low doses per muscle'],
            ['LE -- Equinus', 'Gastrocnemius (medial & lateral heads), Soleus', 'Ankle plantarflexion (equinus)', 'Most common LE injection target; use both gastroc and soleus'],
            ['LE -- Varus', 'Tibialis posterior', 'Ankle inversion (varus)', 'Deep muscle; ultrasound or e-stim guided essential'],
            ['LE -- Stiff knee', 'Rectus femoris', 'Stiff-legged gait, delayed knee flexion in swing', 'Palpation usually sufficient'],
            ['LE -- Adducted thigh', 'Hip adductors (adductor longus, magnus)', 'Scissoring gait, hygiene issues', 'Palpation; phenol often preferred here due to large muscle mass'],
            ['LE -- Toe curling', 'Flexor digitorum longus, Flexor hallucis longus', 'Claw toes, toe curling in shoe', 'Ultrasound guided; small doses'],
          ],
        ),
        TableBlock(
          title: 'Phenol vs Botulinum Toxin Comparison',
          columns: ['Feature', 'Botulinum Toxin (Botox/Dysport)', 'Phenol (5-7%) / Alcohol'],
          rows: [
            ['Mechanism', 'Blocks presynaptic ACh release at NMJ', 'Chemical neurolysis -- denatures nerve protein'],
            ['Onset', 'Gradual: 2-3 days to 2 weeks', 'Immediate (within minutes)'],
            ['Peak effect', '2-6 weeks', 'Immediate to days'],
            ['Duration', '3-6 months (re-injection needed)', '3-6 months (variable; can be longer)'],
            ['Cost', 'Expensive (\$600-\$2000+ per session)', 'Very inexpensive (\$5-20 per vial)'],
            ['Best targets', 'Small muscles, precise targeting needed', 'Large muscles, pure motor nerves (obturator, musculocutaneous)'],
            ['Key risk', 'Diffusion to adjacent muscles; antibody formation with repeated use', 'Painful dysesthesia if sensory nerve fibers affected'],
            ['Guidance', 'EMG, ultrasound, or electrical stimulation', 'Electrical stimulation essential to locate motor point'],
            ['Reversibility', 'Self-limited; effect wears off', 'Partially reversible as nerve regenerates'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Phenol for Obturator Nerve',
          'Phenol nerve block to the obturator nerve is a classic treatment for '
          'hip adductor spasticity causing scissoring gait or hygiene difficulty. '
          'The obturator nerve is a PURE motor nerve to the adductors, so '
          'dysesthesia risk is minimal. This makes it an ideal phenol target. '
          'In contrast, phenol to the tibial nerve (mixed motor/sensory) carries '
          'significant dysesthesia risk and is generally avoided in favor of '
          'botulinum toxin for ankle/foot spasticity.',
        ),
      ],
    ),

    // ── Tab 2: Shoulder Pain ──
    TopicTab(
      title: 'Shoulder Pain',
      blocks: [
        HeaderBlock('Hemiplegic Shoulder Pain'),
        TextBlock(
          'Shoulder pain occurs in 70-84% of hemiplegic patients and is one of '
          'the most common and debilitating complications after stroke. '
          'It significantly interferes with rehabilitation, sleep, and '
          'functional recovery. Multiple etiologies often coexist.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Etiologies of Hemiplegic Shoulder Pain',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Glenohumeral subluxation (most common structural finding)',
            'Rotator cuff injury (impingement, tendinopathy, tears)',
            'Adhesive capsulitis (frozen shoulder)',
            'Spasticity-related pain (subscapularis, pectoralis major)',
            'Complex regional pain syndrome (CRPS / shoulder-hand syndrome)',
            'Brachial plexopathy',
            'Myofascial pain',
            'Central poststroke pain (thalamic pain)',
          ],
        ),
        HeaderBlock('Glenohumeral Subluxation'),
        TextBlock(
          'Subluxation of the glenohumeral joint occurs due to loss of '
          'supraspinatus and deltoid muscle tone, which normally hold the '
          'humeral head in the glenoid fossa. It occurs in up to 80% of '
          'flaccid hemiplegic shoulders.',
        ),
        PearlBlock(
          'Basmajian Principle',
          'Basmajian demonstrated that the supraspinatus and posterior deltoid '
          'are the primary muscles preventing inferior subluxation of the '
          'glenohumeral joint through their vertical force vector (the "locking '
          'mechanism"). In the flaccid stage, loss of supraspinatus and deltoid '
          'tone allows inferior subluxation. The joint capsule and superior '
          'capsular ligaments are secondary restraints. Subluxation itself does '
          'NOT necessarily correlate with pain severity.',
        ),
        BulletCardBlock(
          title: 'Subluxation Management',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Proper positioning — support arm on lap tray, armrest, pillows',
            'Avoid pulling on the affected arm during transfers',
            'Slings: Controversial — may contribute to flexor synergy pattern',
            'Types: single strap sling, GivMohr, Bobath roll, Harris hemi-sling',
            'FES to supraspinatus and posterior deltoid — best evidence for reducing subluxation',
            'Kinesiotaping — emerging evidence, low risk',
            'NEVER let the arm hang unsupported during standing/walking',
          ],
        ),
        PearlBlock(
          'Sling Controversies',
          'Slings prevent subluxation but have significant drawbacks: they '
          'immobilize the arm (risk of contracture/adhesive capsulitis), '
          'reinforce the flexor synergy pattern, inhibit arm swing during gait, '
          'and provide learned nonuse. Most rehab specialists limit sling use '
          'to upright mobility only and remove during therapy and rest. '
          'FES has been shown to be more effective than slings for subluxation '
          'reduction.',
        ),
        BulletCardBlock(
          title: 'Shoulder Pain Prevention',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Avoid overhead pulleys — can cause impingement and labral injury',
            'Never use overhead pulleys in hemiplegic shoulder (AHA guideline)',
            'Gentle PROM within pain-free range',
            'External rotation ROM most important to maintain',
            'Scapular mobilization before glenohumeral ROM',
            'Educate all staff on proper handling techniques',
            'Avoid traction on the affected arm during transfers',
          ],
        ),
        ComparisonCardBlock(
          title: 'Shoulder Subluxation Grading and FES',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.straighten,
          description:
              'Subluxation severity is graded by palpation of the sub-acromial '
              'gap. FES to the supraspinatus and posterior deltoid has the '
              'strongest evidence for subluxation reduction.',
          keyPoints: [
            'Grading by finger-breadth palpation: 1 FB = mild, 1.5 FB = moderate, 2+ FB = severe',
            'Palpate the sub-acromial space with patient seated, arm at side',
            'Radiographic measurement: distance from inferior acromion to superior humeral head',
            'FES protocol: supraspinatus and posterior deltoid, 30-60 min/day, 5-7 days/week for 4-6 weeks',
            'FES reduces subluxation by re-educating the shoulder stabilizers and maintaining muscle bulk',
            'Must start FES early (within first few weeks) for best results',
            'Ada (2005): FES + conventional therapy superior to conventional therapy alone for subluxation',
          ],
        ),
        ComparisonCardBlock(
          title: 'Rotator Cuff Tears in Hemiplegic Shoulder',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.healing,
          description:
              'Rotator cuff pathology is common in hemiplegic shoulders and '
              'is frequently missed because patients cannot report typical '
              'symptoms and exam findings may be obscured by weakness/spasticity.',
          keyPoints: [
            'Prevalence: rotator cuff tears found in 22-40% of hemiplegic shoulders on ultrasound/MRI',
            'Often pre-existing (age-related) but worsened by subluxation and abnormal mechanics',
            'Supraspinatus tear most common (same as general population)',
            'Mechanism: inferior subluxation stretches supraspinatus; abnormal scapulohumeral rhythm causes impingement',
            'Diagnosis: ultrasound is first-line (dynamic, portable, inexpensive); MRI for surgical planning',
            'Management: usually conservative (PT, subacromial injection); surgery rarely indicated in severe hemiplegia',
            'Key point: always consider rotator cuff pathology when shoulder pain is disproportionate or not responding to standard treatment',
          ],
        ),
        ComparisonCardBlock(
          title: 'Central Post-Stroke Pain (Dejerine-Roussy Syndrome)',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.local_fire_department,
          description:
              'Neuropathic pain syndrome caused by damage to the spinothalamocortical '
              'pathway, classically from thalamic infarction. Distinct from '
              'nociceptive musculoskeletal shoulder pain.',
          keyPoints: [
            'Typically DELAYED onset: weeks to months after stroke (often 1-6 months)',
            'Most commonly associated with thalamic strokes (ventral posterolateral nucleus -- VPL)',
            'Can also occur with lateral medullary (Wallenberg) and cortical strokes',
            'Character: burning, aching, lancinating, or freezing pain in hemiplegic side',
            'Allodynia (pain from normally non-painful stimuli) and hyperalgesia common',
            'Pain often worsened by temperature changes, emotional stress, and light touch',
            'No edema, vasomotor, or trophic changes (distinguishes from CRPS)',
            'First-line treatment: amitriptyline 25-75 mg at bedtime',
            'Alternatives: gabapentin 300-3600 mg/day, pregabalin 75-600 mg/day, lamotrigine',
            'Opioids generally ineffective for central neuropathic pain',
          ],
        ),
      ],
    ),

    // ── Tab 3: CRPS ──
    TopicTab(
      title: 'CRPS',
      blocks: [
        HeaderBlock('Complex Regional Pain Syndrome (CRPS)'),
        TextBlock(
          'CRPS (formerly reflex sympathetic dystrophy or shoulder-hand '
          'syndrome) occurs in 12-49% of stroke patients. It is characterized '
          'by pain, edema, vasomotor changes, and trophic changes in the '
          'affected hand and shoulder. Early recognition is critical as '
          'outcomes worsen with delayed treatment.',
          isIntro: true,
        ),
        TableBlock(
          title: 'CRPS Stages',
          columns: ['Stage', 'Name', 'Duration', 'Features'],
          rows: [
            [
              '1',
              'Acute/Warm',
              '0-3 months',
              'Burning pain, edema, warmth, redness, increased sweating, '
              'rapid nail/hair growth, limited ROM',
            ],
            [
              '2',
              'Dystrophic/Cold',
              '3-9 months',
              'Continued pain, cool/cyanotic skin, decreased hair growth, '
              'brittle nails, osteoporosis on X-ray, muscle wasting',
            ],
            [
              '3',
              'Atrophic',
              '9+ months',
              'Pain may decrease, severe contractures, glossy/pale skin, '
              'marked osteoporosis, irreversible changes, muscle atrophy',
            ],
          ],
        ),
        PearlBlock(
          'Triple Phase Bone Scan',
          'The triple phase (three-phase) bone scan is the most sensitive '
          'diagnostic test for CRPS. Shows increased uptake in all three '
          'phases (flow, blood pool, delayed). Delayed phase shows diffuse '
          'periarticular uptake in the affected hand. Sensitivity up to '
          '80-96% in early CRPS. Plain X-rays show patchy osteoporosis '
          'but only in later stages (low early sensitivity).',
        ),
        BulletCardBlock(
          title: 'CRPS Diagnostic Criteria (Budapest)',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Continuing pain disproportionate to the inciting event',
            'At least 1 symptom in 3 of 4 categories:',
            'Sensory: hyperesthesia, allodynia',
            'Vasomotor: temperature asymmetry, skin color changes',
            'Sudomotor/Edema: edema, sweating changes',
            'Motor/Trophic: decreased ROM, motor weakness, tremor, hair/nail/skin changes',
            'At least 1 sign in 2 or more categories',
            'No other diagnosis that better explains the findings',
          ],
        ),
        BulletCardBlock(
          title: 'CRPS Treatment',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Aggressive early therapy — ROM, desensitization, edema management',
            'Stress loading program (scrubbing and carrying)',
            'Corticosteroids — most effective in early acute CRPS (Stage 1)',
            'Bisphosphonates — may help with bone pain and osteoporosis',
            'Gabapentin/pregabalin for neuropathic pain',
            'Stellate ganglion block for UE CRPS (sympathetic block)',
            'Mirror therapy — growing evidence base',
            'TENS for pain management',
            'Vitamin C 500 mg/day may have preventive benefit',
          ],
        ),
        PearlBlock(
          'CRPS vs Central Poststroke Pain',
          'CRPS (Type I, no nerve injury) involves the distal extremity with '
          'edema, vasomotor changes, and trophic changes. Central poststroke '
          'pain (thalamic pain syndrome/Dejerine-Roussy) is burning/tingling '
          'pain in the hemiplegic side due to thalamic or spinothalamocortical '
          'pathway damage — no edema or trophic changes. Treatment of central '
          'pain: amitriptyline, lamotrigine, gabapentin. These are distinct '
          'entities that can coexist.',
        ),
        TableBlock(
          title: 'Shoulder-Hand Syndrome (CRPS Type I) Stage Detail',
          columns: ['Stage', 'Timeline', 'Shoulder', 'Hand', 'Bone/Imaging'],
          rows: [
            ['Stage 1 (Acute)', '0-3 months', 'Diffuse shoulder pain, limited ROM especially ER and abduction', 'Dorsal hand edema, warmth, erythema, sweating, metacarpophalangeal tenderness', 'X-ray may be normal; bone scan shows diffuse uptake'],
            ['Stage 2 (Dystrophic)', '3-9 months', 'Persistent shoulder stiffness, decreasing pain in some', 'Skin becomes cool, cyanotic; edema transitions to brawny induration; finger ROM decreasing', 'Patchy osteoporosis on X-ray (Sudeck atrophy); periarticular demineralization'],
            ['Stage 3 (Atrophic)', '9-12+ months', 'Adhesive capsulitis may be fixed', 'Glossy, pale, atrophic skin; severe MP and IP contractures; muscle wasting; pain may diminish', 'Marked diffuse osteoporosis; irreversible contractures; treatment at this stage has limited benefit'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Budapest Criteria for CRPS Diagnosis',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.checklist,
          description:
              'The Budapest criteria (2003, revised 2010) are the current '
              'international diagnostic criteria for CRPS. They replaced the '
              'older IASP criteria and have improved specificity.',
          keyPoints: [
            'Criterion 1: Continuing pain disproportionate to any inciting event',
            'Criterion 2: Must report at least 1 symptom in 3 of 4 categories:',
            'Sensory: reports of hyperesthesia and/or allodynia',
            'Vasomotor: reports of temperature asymmetry, skin color changes, or skin color asymmetry',
            'Sudomotor/Edema: reports of edema, sweating changes, or sweating asymmetry',
            'Motor/Trophic: reports of decreased ROM, motor dysfunction (weakness, tremor, dystonia), or trophic changes (hair, nail, skin)',
            'Criterion 3: Must display at least 1 sign at time of evaluation in 2 or more categories',
            'Criterion 4: No other diagnosis better explains the signs and symptoms',
            'Sensitivity: 85%; Specificity: 69% (clinical criteria); research criteria require signs in 3 of 4 categories for higher specificity',
          ],
        ),
      ],
    ),

    // ── Tab 4: Other MSK ──
    TopicTab(
      title: 'Other MSK',
      blocks: [
        HeaderBlock('Other Musculoskeletal Complications'),
        TextBlock(
          'Beyond shoulder pain and CRPS, stroke patients are at risk for '
          'multiple musculoskeletal complications including heterotopic '
          'ossification, contractures, osteoporosis, and fractures. '
          'Prevention through proper positioning and early mobilization '
          'is essential.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Heterotopic Ossification (HO)',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.healing_rounded,
          description:
              'Abnormal formation of mature lamellar bone in soft tissues '
              'around joints. Less common in stroke than TBI or SCI but occurs '
              'in approximately 0.5-1% of stroke patients.',
          keyPoints: [
            'Most common location: EXTENSOR (lateral) side of the elbow',
            'Also seen in hip, shoulder, knee',
            'Presents with warmth, swelling, decreased ROM, pain',
            'Elevated alkaline phosphatase (but nonspecific)',
            'Triple phase bone scan is most sensitive early test',
            'X-rays lag behind — may not show HO for 2-6 weeks',
            'Treatment: gentle ROM (DO NOT force through HO), NSAIDs, etidronate',
            'Surgery: only after HO is mature (12-18 months, normal alk phos)',
          ],
        ),
        PearlBlock(
          'HO in Stroke — Elbow Extensor Side',
          'In stroke, HO most commonly forms on the EXTENSOR (lateral/posterior) '
          'side of the elbow, which is different from the pattern in SCI (more '
          'commonly hip). This is a frequently tested board fact. Risk factors '
          'include prolonged immobility, spasticity, and vigorous passive ROM. '
          'Gentle ROM is continued through HO unless there is a clear block — '
          'aggressive ROM may worsen HO.',
        ),
        BulletCardBlock(
          title: 'Contracture Prevention & Management',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Equinovarus foot — most common LE contracture (ankle PF/inversion)',
            'Wrist/finger flexion contracture — most common UE contracture',
            'Prevention: daily ROM, proper positioning, splinting',
            'Serial casting for established contracture (progressive static stretch)',
            'Dynamic splinting for mild-moderate contracture',
            'Botox to spastic muscles before casting can improve outcomes',
            'Surgical release as last resort for severe fixed contractures',
          ],
        ),
        BulletCardBlock(
          title: 'Osteoporosis & Fracture Risk',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Bone mineral density decreases on hemiplegic side within weeks',
            'Disuse osteoporosis — up to 14% BMD loss in the first year',
            'Increased fall risk + osteoporosis = high fracture risk',
            'Proximal femur on hemiplegic side is most common fracture site',
            'Weight-bearing exercise and vitamin D supplementation recommended',
            'DEXA scan of hemiplegic hip for monitoring',
            'Bisphosphonates if osteoporosis confirmed',
          ],
        ),
        ComparisonCardBlock(
          title: 'Hemiplegic Gait Deviations',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.directions_walk,
          description:
              'Classic hemiplegic gait results from the combination of LE '
              'extensor spasticity, hip hiking, and circumduction.',
          keyPoints: [
            'Circumduction — swing leg moves in lateral arc due to stiff knee/ankle PF',
            'Hip hiking — elevates pelvis on swing side to clear the foot',
            'Trendelenburg — weak hip abductors cause pelvis drop on swing side',
            'Equinovarus — ankle PF/inversion from spastic tibialis posterior and gastroc',
            'Genu recurvatum — knee hyperextension from quadriceps spasticity or weakness',
            'AFO prescribed to control equinovarus and improve clearance',
            'Articulated AFO allows dorsiflexion, blocks plantarflexion',
          ],
        ),
        ComparisonCardBlock(
          title: 'Contracture Prevention Protocols',
          themeColor: Color(0xFF2563EB),
          backgroundColor: Color(0xFFEFF6FF),
          icon: Icons.accessibility,
          description:
              'Contractures develop rapidly in stroke patients due to spasticity, '
              'immobility, and positioning. Prevention is far more effective '
              'than treatment of established contractures.',
          keyPoints: [
            'Positioning: place limbs in anti-spasticity positions during rest and sleep',
            'UE positioning: shoulder abducted/externally rotated, elbow extended, wrist neutral, fingers extended',
            'LE positioning: hip neutral rotation, knee slightly flexed (avoid hyperextension), ankle at 90 degrees',
            'Daily ROM exercises: minimum 2 times/day, all joints through full available range',
            'Prolonged stretching: 20-30 minutes of sustained stretch is more effective than brief stretching',
            'Resting splints: wrist-hand orthosis at night to prevent wrist/finger flexion contracture',
            'Standing programs: 30-60 minutes/day of supported standing for LE contracture prevention',
            'Serial casting: for established contracture -- sequential casts at increasing stretch, changed every 5-7 days',
            'Combination therapy: botulinum toxin injection to reduce tone BEFORE serial casting improves outcomes',
            'Dynamic splinting: spring-loaded or elastic devices that provide prolonged low-load stretch',
          ],
        ),
        TableBlock(
          title: 'Anti-Spasticity Positioning Guide',
          columns: ['Joint', 'Spastic Pattern', 'Corrective Position'],
          rows: [
            ['Shoulder', 'Adduction, internal rotation', 'Abduction, external rotation; supported on pillow'],
            ['Elbow', 'Flexion', 'Extension; elbow splint at night if needed'],
            ['Forearm', 'Pronation', 'Neutral to slight supination'],
            ['Wrist', 'Flexion, ulnar deviation', 'Neutral to slight extension; resting hand splint'],
            ['Fingers', 'Flexion, thumb-in-palm', 'Extension with finger spreader or cone; thumb abduction splint'],
            ['Hip', 'Adduction, internal rotation', 'Neutral alignment; trochanter roll to prevent ER'],
            ['Knee', 'Extension (in standing/walking)', 'Slight flexion in bed (small roll behind knee)'],
            ['Ankle', 'Plantarflexion, inversion', 'Neutral dorsiflexion; pillows or AFO to prevent equinus'],
          ],
        ),
      ],
    ),
  ],
);
