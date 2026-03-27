import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData motorRecoveryContent = TopicData(
  id: 'motor_recovery',
  title: 'Motor Recovery After Stroke',
  tabs: [
    // ── Tab 1: Recovery Patterns ──
    TopicTab(
      title: 'Recovery Patterns',
      blocks: [
        HeaderBlock('Patterns of Motor Recovery'),
        TextBlock(
          'Motor recovery after stroke follows a relatively predictable sequence '
          'first described by Twitchell (1951). The classic pattern progresses '
          'from flaccidity through spasticity to voluntary motor control. '
          'Most neurological recovery occurs in the first 3 months, with '
          'functional gains continuing for 6-12 months or longer.',
          isIntro: true,
        ),
        NumberedListBlock([
          MapEntry(
            'Flaccidity (Days to Weeks)',
            'Immediately after stroke, the affected limbs are flaccid with '
            'absent deep tendon reflexes. This represents spinal shock and '
            'loss of upper motor neuron input.',
          ),
          MapEntry(
            'Spasticity Emergence (Weeks 1-4)',
            'Reflexes return and become hyperactive. Spasticity develops in a '
            'characteristic pattern: UE flexor synergy and LE extensor synergy. '
            'Synergistic movement patterns emerge.',
          ),
          MapEntry(
            'Synergy Patterns (Weeks 2-8)',
            'Voluntary movement is possible only within stereotyped synergy '
            'patterns. Flexor synergy dominates the upper extremity; extensor '
            'synergy dominates the lower extremity.',
          ),
          MapEntry(
            'Out-of-Synergy Movement (Months 2-6)',
            'Isolated voluntary movements begin to emerge outside of synergy '
            'patterns. Spasticity begins to diminish.',
          ),
          MapEntry(
            'Selective Motor Control (Months 3-12+)',
            'Near-normal movement with isolated joint control. Coordination '
            'improves. Spasticity minimal or resolved.',
          ),
        ]),
        BulletCardBlock(
          title: 'UE Flexor Synergy Pattern',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          points: [
            'Scapular retraction and elevation',
            'Shoulder abduction and external rotation',
            'Elbow flexion',
            'Forearm supination',
            'Wrist and finger flexion',
          ],
        ),
        BulletCardBlock(
          title: 'LE Extensor Synergy Pattern',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          points: [
            'Hip extension, adduction, and internal rotation',
            'Knee extension',
            'Ankle plantarflexion and inversion',
            'Toe flexion',
          ],
        ),
        KnowledgeCheckBlock(
          question: 'According to the Copenhagen Stroke Study, by what time do 95% of patients reach their best neurological recovery level?',
          options: ['4 weeks', '8 weeks', '11 weeks', '6 months'],
          correctIndex: 2,
          explanation: 'The Copenhagen Stroke Study (1995) demonstrated that 95% of stroke patients reach their best neurological recovery level by 11 weeks. Functional recovery through compensation may continue beyond this point.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'Recovery Predictors',
          'Presence of voluntary finger extension and shoulder abduction '
          'within 72 hours predicts 98% probability of achieving some '
          'upper extremity function (SAFE score — Shoulder Abduction, '
          'Finger Extension). Hand movement present by 4 weeks predicts '
          'approximately 70% chance of useful hand function recovery. '
          'Complete absence of hand movement by 4 weeks predicts poor '
          'UE recovery.',
        ),
        TableBlock(
          title: 'Recovery Timeline',
          columns: ['Timeframe', 'Expected Recovery', 'Key Milestone'],
          rows: [
            ['0-2 weeks', 'Flaccidity, early reflexes', 'DTRs return'],
            ['2-6 weeks', 'Spasticity emergence', 'Synergistic movement'],
            ['6-12 weeks', 'Peak spasticity', 'Out-of-synergy begins'],
            [
              '3-6 months',
              'Most neurologic recovery',
              '95% reach best neuro level by 11 weeks',
            ],
            [
              '6-12+ months',
              'Functional adaptation',
              'Continued skill acquisition',
            ],
          ],
        ),
        ComparisonCardBlock(
          title: 'Copenhagen Stroke Study Data',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.insights,
          description:
              'The Copenhagen Stroke Study (1995) was a landmark prospective '
              'study of 947 consecutive stroke patients that defined the natural '
              'history of neurological and functional recovery.',
          keyPoints: [
            '95% of patients reached their best neurologic recovery level by 11 weeks',
            'Mild strokes (initial NIHSS <5): best recovery reached by 3-5 weeks',
            'Moderate strokes: best recovery reached by 6-11 weeks',
            'Severe strokes: best recovery reached by 13-17 weeks',
            'Functional recovery (ADLs) continued 2-4 weeks beyond neurologic plateau due to compensatory strategies',
            'Initial stroke severity was the strongest predictor of ultimate outcome',
            'Walking function: 80% achieved independent walking; most within 6 weeks',
            'Upper extremity: only 33% achieved useful hand function',
          ],
        ),
        ComparisonCardBlock(
          title: 'Proportional Recovery Rule',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.trending_up,
          description:
              'Most stroke patients recover approximately 70% of their potential '
              'recovery (the deficit between initial impairment and full recovery). '
              'This principle helps predict expected outcomes.',
          keyPoints: [
            'Proposed by Prabhakaran et al.: patients recover ~70% of their maximum possible improvement',
            'Example: if initial Fugl-Meyer UE = 20/66, deficit = 46, expected recovery = 46 x 0.7 = 32 points, predicted FM = 52',
            '"Fitters" (~70% of patients): follow the proportional recovery rule closely',
            '"Non-fitters" (~30% of patients): recover far less than predicted -- often have severe initial deficits',
            'Non-fitters typically have greater corticospinal tract damage (disrupted PLIC on DWI)',
            'The rule applies primarily to UE motor recovery measured by Fugl-Meyer',
            'Clinical utility: helps set realistic expectations and guide rehabilitation intensity',
          ],
        ),
        ComparisonCardBlock(
          title: 'Corticospinal Tract (CST) Integrity and Prediction',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.psychology,
          description:
              'Integrity of the corticospinal tract, particularly through the '
              'posterior limb of the internal capsule (PLIC), is the strongest '
              'neuroimaging predictor of motor recovery.',
          keyPoints: [
            'PLIC carries the majority of corticospinal fibers controlling hand and arm function',
            'DWI signal in the PLIC within 72 hours predicts motor outcome at 3-6 months',
            'Asymmetry in fractional anisotropy (FA) on DTI between affected and unaffected PLIC correlates with motor recovery',
            'FA ratio <0.5 (severely reduced CST integrity) predicts poor UE motor recovery',
            'Transcranial magnetic stimulation (TMS): presence of motor evoked potentials (MEPs) from affected hemisphere predicts good recovery',
            'Absent MEPs at 1-2 weeks post-stroke associated with "non-fitter" status',
            'PREP2 algorithm combines SAFE score + TMS + MRI to predict UE outcome with high accuracy',
          ],
        ),
        ComparisonCardBlock(
          title: 'SAFE Score',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.front_hand,
          description:
              'A simple bedside assessment at 72 hours post-stroke that predicts '
              'upper extremity motor recovery.',
          keyPoints: [
            'SAFE = Shoulder Abduction + Finger Extension',
            'Assess voluntary shoulder abduction and finger extension at 72 hours post-stroke',
            'Score each on Medical Research Council (MRC) scale: 0-5',
            'Total SAFE score: sum of shoulder abduction + finger extension (0-10)',
            'SAFE score >= 5: 98% probability of achieving some useful UE function',
            'SAFE score = 0 at 72 hours: poor prognosis for UE recovery',
            'Quick, requires no equipment, highly predictive',
            'Forms the first step in the PREP2 prediction algorithm',
          ],
        ),
      ],
    ),

    // ── Tab 2: Brunnstrom Stages ──
    TopicTab(
      title: 'Brunnstrom Stages',
      blocks: [
        HeaderBlock('Brunnstrom Stages of Motor Recovery'),
        TextBlock(
          'Signe Brunnstrom described 7 stages of motor recovery that describe '
          'the progression from flaccidity through synergistic movement to '
          'normal motor function. These stages remain a foundational framework '
          'in stroke rehabilitation and are frequently tested on board exams.',
          isIntro: true,
        ),
        ScaleBlock(
          scaleName: 'Brunnstrom Stages of Motor Recovery',
          description:
              'Sequential stages of motor recovery following upper motor neuron '
              'lesion, applicable to both upper and lower extremity.',
          columns: ['Stage', 'Description', 'Motor Characteristics'],
          rows: [
            [
              '1',
              'Flaccidity',
              'No voluntary movement. Absent reflexes. Complete paralysis.',
            ],
            [
              '2',
              'Spasticity Developing',
              'Minimal voluntary movement appears. Basic limb synergies '
              'may begin. Spasticity starts to develop.',
            ],
            [
              '3',
              'Spasticity Marked',
              'Voluntary movement ONLY within synergy patterns. '
              'Spasticity is at its peak. Flexor synergy (UE), '
              'extensor synergy (LE).',
            ],
            [
              '4',
              'Spasticity Declining',
              'Movement combinations OUT of synergy begin to appear. '
              'Spasticity begins to decrease.',
            ],
            [
              '5',
              'Synergies Less Dominant',
              'Relatively independent (isolated) joint movements. '
              'Synergies no longer dominate. Spasticity waning.',
            ],
            [
              '6',
              'Coordination Approaches Normal',
              'Isolated joint movements freely performed. Coordination '
              'near normal. Spasticity minimal.',
            ],
            [
              '7',
              'Normal',
              'Normal motor function restored. Full speed, coordination, '
              'and dexterity.',
            ],
          ],
          boardPearl:
              'Stage 3 is the most commonly tested stage — it represents '
              'PEAK spasticity with movement ONLY within synergies. '
              'The transition from Stage 3 to Stage 4 (out-of-synergy movement) '
              'marks the critical turning point in recovery. '
              'Most patients plateau at Stage 3-4.',
        ),
        TimelineBlock(
          title: 'Brunnstrom Stages & Motor Recovery Timeline',
          milestones: [
            TimelineMilestone(
              label: 'Days 1-14',
              title: 'Stage 1: Flaccidity',
              details: ['No voluntary movement', 'Absent reflexes', 'Monitor for DVT and skin breakdown'],
            ),
            TimelineMilestone(
              label: 'Weeks 1-4',
              title: 'Stage 2: Spasticity Developing',
              details: ['Minimal voluntary movement', 'Basic synergies begin', 'Reflexes return and become hyperactive'],
            ),
            TimelineMilestone(
              label: 'Weeks 2-8',
              title: 'Stage 3: Peak Spasticity',
              details: ['Movement ONLY within synergy patterns', 'UE flexor synergy, LE extensor synergy', 'Most commonly tested stage on boards'],
            ),
            TimelineMilestone(
              label: 'Months 2-4',
              title: 'Stage 4: Out-of-Synergy Begins',
              details: ['Critical turning point in recovery', 'Isolated movements emerge', 'Spasticity begins to decline'],
            ),
            TimelineMilestone(
              label: 'Months 3-6',
              title: 'Stages 5-6: Selective Motor Control',
              details: ['Synergies no longer dominate', 'Isolated joint movements freely performed', 'Coordination approaches normal'],
            ),
            TimelineMilestone(
              label: 'Months 6-12+',
              title: 'Stage 7: Normal (if achieved)',
              details: ['Full speed, coordination, dexterity', 'Most patients plateau at Stage 3-4', 'Functional gains continue via compensation'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'At Brunnstrom Stage 3, a patient asked to flex the elbow will demonstrate which pattern?',
          options: [
            'Isolated elbow flexion only',
            'The entire UE flexor synergy (shoulder abduction, elbow flexion, forearm supination, wrist flexion)',
            'Random movement in all directions',
            'No voluntary movement at all',
          ],
          correctIndex: 1,
          explanation: 'At Stage 3, voluntary movement occurs ONLY within synergy patterns. Attempting elbow flexion triggers the entire flexor synergy because isolated joint movements are not yet possible.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'Stage 3 Board Pearl',
          'At Brunnstrom Stage 3, a patient asked to flex the elbow will '
          'demonstrate the ENTIRE flexor synergy pattern (shoulder abduction, '
          'elbow flexion, forearm supination, wrist flexion). They cannot '
          'isolate individual joint movements. Similarly, LE effort produces '
          'the full extensor synergy. This is the hallmark finding of Stage 3.',
        ),
        BulletCardBlock(
          title: 'Key Stage 4 Movements (Out of Synergy)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          points: [
            'UE: Hand behind back (shoulder extension + internal rotation)',
            'UE: Shoulder flexion to 90 degrees with elbow extended',
            'UE: Forearm pronation/supination with elbow at 90 degrees',
            'LE: Knee flexion beyond 90 degrees in sitting',
            'LE: Ankle dorsiflexion with knee flexed',
          ],
        ),
        ScaleBlock(
          scaleName: 'Fugl-Meyer Assessment (FMA)',
          description:
              'The most widely used quantitative measure of motor impairment '
              'after stroke. Evaluates motor function, sensation, balance, '
              'joint ROM, and pain in a standardized protocol.',
          columns: ['Domain', 'Score Range', 'Key Details'],
          rows: [
            ['Upper Extremity Motor', '0-66', 'Shoulder/elbow/forearm (36), wrist (10), hand/fingers (14), coordination/speed (6)'],
            ['Lower Extremity Motor', '0-34', 'Hip/knee/ankle movements within and out of synergy, coordination'],
            ['Total Motor Score', '0-100', 'Sum of UE (66) + LE (34); most commonly reported score'],
            ['Sensation', '0-24', 'Light touch and proprioception of UE and LE'],
            ['Balance', '0-14', 'Sitting and standing balance'],
            ['Joint ROM', '0-44', 'Passive ROM of major joints'],
            ['Joint Pain', '0-44', 'Pain during passive ROM'],
            ['Grand Total', '0-226', 'All domains combined (rarely used as total)'],
          ],
          boardPearl:
              'UE FMA severity categories: 0-19 = severe; 20-47 = moderate; '
              '48-52 = mild-moderate; 53-66 = mild. Minimal clinically important '
              'difference (MCID) = 5.25 points for UE motor. The FMA is scored '
              'on a 3-point ordinal scale (0 = cannot perform, 1 = partial, '
              '2 = full performance) for each item.',
        ),
        ComparisonCardBlock(
          title: 'Wolf Motor Function Test (WMFT)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.timer,
          description:
              'A timed functional assessment of UE motor ability used '
              'primarily in CIMT research. Measures both speed and quality.',
          keyPoints: [
            '17 tasks progressing from simple (forearm to table) to complex (lifting basket)',
            'Tasks timed with 120-second maximum per task',
            'Functional ability scale: 0-5 for each task (0 = no attempt, 5 = normal)',
            'Primary outcome in the EXCITE trial for CIMT',
            'Sensitive to change in patients with mild-to-moderate UE impairment',
            'Median time and functional ability scores reported separately',
          ],
        ),
        ComparisonCardBlock(
          title: 'Action Research Arm Test (ARAT)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.back_hand,
          description:
              'A 19-item observational assessment of UE function evaluating '
              'grasp, grip, pinch, and gross movement.',
          keyPoints: [
            '4 subscales: grasp (6 items), grip (4 items), pinch (6 items), gross movement (3 items)',
            'Total score: 0-57 (higher = better function)',
            'Each item scored 0-3 (0 = no movement, 3 = normal performance)',
            'Hierarchical design: if patient scores 3 on hardest item in subscale, full score given for that subscale',
            'Takes 8-10 minutes to administer',
            'MCID = 5.7 points',
            'Widely used in stroke rehabilitation research as a primary outcome measure',
          ],
        ),
      ],
    ),

    // ── Tab 3: Rehab Methods ──
    TopicTab(
      title: 'Rehab Methods',
      blocks: [
        HeaderBlock('Traditional Rehabilitation Approaches'),
        TextBlock(
          'Multiple therapeutic approaches have been developed for motor '
          'rehabilitation after stroke. While no single approach has been proven '
          'definitively superior, task-specific repetitive practice with '
          'sufficient intensity has the strongest evidence base.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Bobath / Neurodevelopmental Treatment (NDT)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.accessibility_new,
          description:
              'Focus on inhibiting abnormal tone and movement patterns while '
              'facilitating normal movement through handling techniques.',
          keyPoints: [
            'Inhibit spasticity and abnormal synergy patterns',
            'Facilitate normal postural reactions and movement',
            'Use of reflex-inhibiting postures (RIPs)',
            'Therapist uses hands-on "key points of control"',
            'Most widely used approach worldwide',
            'Limited evidence of superiority over other approaches',
          ],
        ),
        ComparisonCardBlock(
          title: 'Brunnstrom Movement Therapy',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.directions_walk,
          description:
              'Uses synergy patterns as a building block for recovery. '
              'Encourages use of available synergies, then trains movements '
              'out of synergy.',
          keyPoints: [
            'Views synergies as a normal recovery stage, not pathological',
            'Facilitates synergistic patterns initially',
            'Progressively trains out-of-synergy movements',
            'Uses associated reactions to elicit movement',
            'Aligns treatment with natural recovery stages',
          ],
        ),
        ComparisonCardBlock(
          title: 'Proprioceptive Neuromuscular Facilitation (PNF)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.sports_gymnastics,
          description:
              'Uses diagonal and spiral movement patterns with resistance, '
              'stretch, and verbal/tactile cues to facilitate neuromuscular '
              'responses.',
          keyPoints: [
            'Based on spiral and diagonal functional movement patterns',
            'D1 and D2 flexion/extension patterns',
            'Uses manual resistance, stretch reflex, irradiation',
            'Contract-relax and hold-relax techniques for ROM',
            'Rhythmic stabilization for trunk control',
            'Emphasizes functional movement patterns over isolated muscles',
          ],
        ),
        ComparisonCardBlock(
          title: 'Rood Approach',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.touch_app,
          description:
              'Uses sensory stimulation techniques to activate or inhibit motor '
              'responses. Based on ontogenetic motor development sequence.',
          keyPoints: [
            'Facilitatory techniques: quick stretch, icing, brushing, tapping',
            'Inhibitory techniques: slow stroking, neutral warmth, prolonged pressure',
            'Follows developmental sequence (mobility -> stability -> controlled mobility -> skill)',
            'Light touch and fast brushing over muscle belly to facilitate',
            'Maintained pressure on tendon to inhibit',
          ],
        ),
        TableBlock(
          title: 'Rehabilitation Approach Comparison',
          columns: ['Approach', 'Philosophy', 'Key Technique'],
          rows: [
            ['Bobath/NDT', 'Inhibit abnormal, facilitate normal', 'Handling, RIPs'],
            ['Brunnstrom', 'Use synergies as building blocks', 'Synergy facilitation'],
            ['PNF', 'Diagonal spiral patterns', 'Manual resistance, irradiation'],
            ['Rood', 'Sensory stimulation drives motor', 'Icing, brushing, tapping'],
            [
              'Task-Oriented',
              'Practice the actual task',
              'Repetitive task-specific training',
            ],
          ],
        ),
        PearlBlock(
          'Evidence for Rehabilitation Approaches',
          'Systematic reviews show NO single traditional approach (Bobath, '
          'Brunnstrom, PNF, Rood) is clearly superior to others. '
          'The strongest evidence supports task-specific, repetitive, '
          'high-intensity practice with sufficient dosing. The amount and '
          'intensity of practice matters more than the specific approach used.',
        ),
        TableBlock(
          title: 'Locomotor Training Approaches Comparison',
          columns: ['Approach', 'Description', 'Evidence'],
          rows: [
            ['Overground gait training', 'Walking on flat surface with manual assist or assistive device', 'Standard of care; allows real-world practice of functional gait'],
            ['Body-weight-supported treadmill (BWSTT)', 'Harness-supported treadmill walking with therapist assistance', 'LEAPS trial: not superior to progressive overground exercise at 1 year'],
            ['Robotic gait training (Lokomat, Ekso)', 'Robotic exoskeleton assists or guides leg movement on treadmill', 'May benefit non-ambulatory patients; not superior to conventional for ambulatory patients'],
            ['FES-assisted gait', 'Electrical stimulation to dorsiflexors/plantarflexors during walking', 'Improves gait speed and reduces foot drop; can be neuroprosthetic or therapeutic'],
            ['Task-specific stepping', 'Repetitive stepping practice with varied speed, direction, terrain', 'Strongest evidence; high step count (3000+/session) recommended'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Ankle-Foot Orthosis (AFO) Prescribing',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.straighten,
          description:
              'AFOs are the most commonly prescribed orthotic after stroke, '
              'primarily to control equinovarus deformity and foot drop.',
          keyPoints: [
            'Solid AFO: blocks all ankle motion; best for severe spasticity or fixed equinovarus; limits push-off in gait',
            'Posterior leaf spring (PLS) AFO: thin posterior strut; assists dorsiflexion in swing; allows some plantarflexion; best for isolated foot drop with minimal spasticity',
            'Articulated AFO: hinged joint allows dorsiflexion, blocks plantarflexion; best for moderate spasticity with some active dorsiflexion',
            'Ground reaction AFO (GRAFO): anterior shell extends to tibial tuberosity; controls knee hyperextension (genu recurvatum)',
            'Timing: prescribe when gait training begins; reassess as recovery progresses',
            'Too rigid too early may limit motor learning; too flexible may not provide adequate control',
            'FES to dorsiflexors is an alternative or adjunct to AFO for foot drop',
          ],
        ),
        BulletCardBlock(
          title: 'Neuroplasticity Principles for Rehabilitation',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          points: [
            'Use it or lose it: failure to drive specific brain functions leads to degradation',
            'Use it and improve it: training drives cortical reorganization and functional improvement',
            'Specificity: the nature of training determines the nature of plasticity (practice the task you want to improve)',
            'Repetition matters: sufficient repetition is required to induce lasting neural changes (hundreds to thousands of reps)',
            'Intensity matters: training must be of sufficient intensity to drive plasticity',
            'Time matters: different forms of plasticity occur at different times post-stroke; earlier intervention drives more recovery',
            'Salience matters: the training must be meaningful and motivating to the patient',
            'Age matters: neuroplasticity occurs across the lifespan but may be slower in older adults',
            'Transference: plasticity in one set of neural circuits can enhance related behaviors',
            'Interference: plasticity in one pathway can impede others (maladaptive plasticity -- e.g., learned nonuse)',
          ],
        ),
      ],
    ),

    // ── Tab 4: Advanced Therapies ──
    TopicTab(
      title: 'Advanced Therapies',
      blocks: [
        HeaderBlock('Advanced Motor Recovery Therapies'),
        TextBlock(
          'Newer evidence-based interventions complement traditional therapy '
          'approaches. These techniques leverage neuroplasticity principles '
          'including use-dependent plasticity, intensive practice, and '
          'augmented feedback.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Constraint-Induced Movement Therapy (CIMT)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.front_hand,
          description:
              'Restrains the unaffected upper extremity to force intensive '
              'use of the affected limb. Based on learned nonuse theory.',
          keyPoints: [
            'Mitt or sling on unaffected hand for 90% of waking hours',
            'Intensive structured practice 6 hours/day for 2 weeks (original protocol)',
            'Modified CIMT (mCIMT): 30 min-3 hours/day for extended period',
            'EXCITE trial: Improved UE function maintained at 2 years',
            'Minimum motor criteria: 10 degrees wrist extension, 10 degrees finger extension',
            'Criteria also: 20 degrees active wrist extension from full flexion',
            'Overcomes learned nonuse — reversal of cortical reorganization',
            'Modified versions more practical and similarly effective',
          ],
        ),
        KnowledgeCheckBlock(
          question: 'What are the minimum motor criteria for eligibility for Constraint-Induced Movement Therapy (CIMT)?',
          options: [
            'Any trace movement in the affected hand',
            '10 degrees active wrist extension and 10 degrees active finger extension',
            'Full antigravity strength in the affected arm',
            'Ability to grasp and release a tennis ball',
          ],
          correctIndex: 1,
          explanation: 'CIMT requires at least 10 degrees of active wrist extension and 10 degrees of active finger extension. Only about 20-25% of stroke patients meet these criteria. This is a very commonly tested board fact.',
          boardRelevance: 'BOARD-CORE',
        ),
        PearlBlock(
          'CIMT Eligibility Criteria',
          'Patients must have at least 10 degrees of active wrist extension '
          'and 10 degrees of active finger extension to be eligible for CIMT. '
          'This ensures sufficient residual motor capacity to benefit from '
          'forced use. Only approximately 20-25% of stroke patients meet these '
          'criteria. This prerequisite is a very commonly tested board fact.',
        ),
        ComparisonCardBlock(
          title: 'Functional Electrical Stimulation (FES)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.electrical_services,
          description:
              'Application of electrical current to paretic muscles to produce '
              'functional movement during task practice.',
          keyPoints: [
            'Stimulates peripheral nerves to produce muscle contraction',
            'Used for dorsiflexion (foot drop), wrist/finger extension, grasp',
            'Can be triggered by EMG (EMG-triggered FES) for active participation',
            'NMES (neuromuscular electrical stimulation) is cyclic, non-task-based',
            'FES is applied during functional tasks (walking, reaching)',
            'Evidence supports improved motor recovery when combined with task practice',
            'Bioness L300 and WalkAide are FDA-cleared FES foot drop devices',
          ],
        ),
        ComparisonCardBlock(
          title: 'Body-Weight-Supported Treadmill Training (BWSTT)',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.directions_run,
          description:
              'Patient walks on a treadmill while partially suspended in a '
              'harness to reduce the load on paretic limbs.',
          keyPoints: [
            'Allows earlier gait training with reduced fall risk',
            'Typically unweight 20-40% of body weight initially',
            'Progressively reduce support as ability improves',
            'Based on locomotor training and CPG (central pattern generator) theory',
            'LEAPS trial: BWSTT not superior to progressive home exercise at 1 year',
            'Locomotor Experience Applied Post Stroke (LEAPS) was a landmark trial',
            'Still useful for early mobility and patients with significant weakness',
          ],
        ),
        ComparisonCardBlock(
          title: 'Robotic-Assisted Therapy',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          icon: Icons.precision_manufacturing,
          description:
              'Robotic devices assist or resist movement during repetitive '
              'practice to increase therapy dose and intensity.',
          keyPoints: [
            'MIT-Manus / InMotion ARM for UE',
            'Lokomat for LE gait training',
            'Enables high repetitions (hundreds to thousands per session)',
            'VA ROBOTICS trial: Similar outcomes to intensive conventional therapy',
            'Useful for patients too weak for conventional task practice',
            'Provides consistent, quantifiable movement assistance',
            'May be particularly beneficial in subacute phase',
          ],
        ),
        MedicationCardBlock(
          name: 'Fluoxetine (Prozac)',
          drugClass: 'Selective Serotonin Reuptake Inhibitor (SSRI)',
          mechanism:
              'Inhibits serotonin reuptake. Proposed to enhance neuroplasticity, '
              'promote BDNF expression, and modulate motor cortex excitability.',
          indication:
              'Potential adjunct for motor recovery after stroke (controversial).',
          dosing: '20 mg daily, started 5-10 days post-stroke.',
          sideEffects:
              'Nausea, insomnia, hyponatremia, increased fracture risk, '
              'serotonin syndrome.',
          boardPearl:
              'FLAME trial (2011): Fluoxetine 20 mg improved motor recovery '
              'at 3 months vs placebo in ischemic stroke. However, subsequent '
              'larger trials (FOCUS, AFFINITY, EFFECTS) did NOT confirm motor '
              'benefit and showed increased adverse events (falls, fractures, '
              'hyponatremia). SSRIs are NOT routinely recommended solely for '
              'motor recovery enhancement.',
        ),
        BulletCardBlock(
          title: 'Emerging Therapies',
          themeColor: Color(0xFFE11D48),
          backgroundColor: Color(0xFFFFF1F2),
          points: [
            'Transcranial magnetic stimulation (TMS) — modulates cortical excitability',
            'Transcranial direct current stimulation (tDCS) — enhances motor learning',
            'Brain-computer interfaces (BCI) — decode motor intent from EEG/ECoG',
            'Virtual reality therapy — immersive task practice with feedback',
            'Mirror therapy — visual feedback illusion for paretic limb',
            'Stem cell therapy — experimental, clinical trials ongoing',
          ],
        ),
      ],
    ),
  ],
);
