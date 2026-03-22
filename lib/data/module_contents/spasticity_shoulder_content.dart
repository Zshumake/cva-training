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
      ],
    ),
  ],
);
