import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData outcomesContinuumContent = TopicData(
  id: 'outcomes_continuum',
  title: 'Outcomes & Continuum of Care',
  tabs: [
    // ── Tab 1: Prognostication ──
    TopicTab(
      title: 'Prognostication',
      blocks: [
        HeaderBlock('Stroke Prognostication'),
        TextBlock(
          'Accurate prediction of functional outcomes after stroke is essential '
          'for treatment planning, goal setting, family counseling, and '
          'discharge planning. Multiple clinical factors predict outcomes, '
          'though no single factor is sufficient. The most important predictors '
          'are stroke severity, age, and early motor recovery.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Positive Prognostic Factors',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          points: [
            'Younger age',
            'Mild stroke severity (low NIHSS)',
            'Lacunar stroke subtype — BEST prognosis',
            'Early motor recovery (hand movement by 4 weeks)',
            'Preserved sitting balance by 2 weeks',
            'Preserved cognition and continence',
            'Strong social support system',
            'Prior independence in ADLs',
            'Motivation and participation in rehabilitation',
          ],
        ),
        BulletCardBlock(
          title: 'Negative Prognostic Factors',
          themeColor: Color(0xFFF97316),
          backgroundColor: Color(0xFFFFF7ED),
          points: [
            'Older age (>75 years)',
            'Severe stroke (high NIHSS)',
            'Large vessel territory infarct (large MCA)',
            'Persistent incontinence at 2 weeks',
            'Poor sitting balance',
            'Hemispatial neglect and anosognosia',
            'Global aphasia',
            'Prior stroke or significant comorbidities',
            'Complete absence of hand movement by 4 weeks',
            'Severe cognitive impairment',
          ],
        ),
        PearlBlock(
          'Lacunar Strokes Have the Best Prognosis',
          'Lacunar infarcts (small vessel disease, <1.5 cm) have the best '
          'functional prognosis of all stroke subtypes. Up to 80% of lacunar '
          'stroke patients achieve functional independence. This is because '
          'the infarct size is small, cortical function is preserved, and '
          'motor recovery is often complete. However, lacunar strokes have '
          'a high recurrence rate (up to 25% in 5 years) and are associated '
          'with vascular cognitive impairment over time.',
        ),
        TableBlock(
          title: 'Key Predictive Milestones',
          columns: ['Milestone', 'Timing', 'Prognostic Implication'],
          rows: [
            [
              'Voluntary finger extension',
              '72 hours',
              '98% probability of some UE function (SAFE score)',
            ],
            [
              'Hand movement present',
              '4 weeks',
              '~70% chance of useful hand recovery',
            ],
            [
              'No hand movement',
              '4 weeks',
              'Poor prognosis for UE functional use',
            ],
            [
              'Sitting balance',
              '2 weeks',
              'Strong predictor of ambulation and ADL independence',
            ],
            [
              'Continence restored',
              '2 weeks',
              'Favorable discharge disposition',
            ],
            [
              'Best neurological recovery',
              '11 weeks',
              '95% reach best neurologic level by this time',
            ],
          ],
        ),
        PearlBlock(
          '95% Best Neurological Level by 11 Weeks',
          'The Copenhagen Stroke Study demonstrated that 95% of stroke patients '
          'reach their best neurological level by 11 weeks poststroke. This does '
          'NOT mean functional recovery stops — patients continue to make '
          'functional gains through compensation, skill acquisition, and '
          'adaptation well beyond 11 weeks. Neurological recovery is distinct '
          'from functional recovery.',
        ),
      ],
    ),

    // ── Tab 2: FIM & Scales ──
    TopicTab(
      title: 'FIM & Scales',
      blocks: [
        HeaderBlock('Functional Outcome Measures'),
        TextBlock(
          'Standardized outcome measures are essential for tracking recovery, '
          'comparing interventions, determining rehabilitation needs, and '
          'predicting discharge disposition. The FIM is the most widely used '
          'measure in rehabilitation settings.',
          isIntro: true,
        ),
        ScaleBlock(
          scaleName: 'Functional Independence Measure (FIM)',
          description:
              'An 18-item ordinal scale measuring functional independence in '
              'self-care, sphincter control, transfers, locomotion, communication, '
              'and social cognition. Each item scored 1-7.',
          columns: ['Score', 'Level', 'Description'],
          rows: [
            ['7', 'Complete Independence', 'Performs task safely without assistance, aids, or devices'],
            ['6', 'Modified Independence', 'Requires assistive device or extra time, but no helper'],
            ['5', 'Supervision/Setup', 'Requires standby assist, cueing, or setup only'],
            ['4', 'Minimal Assistance', 'Patient performs >=75% of task effort'],
            ['3', 'Moderate Assistance', 'Patient performs 50-74% of task effort'],
            ['2', 'Maximal Assistance', 'Patient performs 25-49% of task effort'],
            ['1', 'Total Assistance', 'Patient performs <25% of task effort'],
          ],
          boardPearl:
              'FIM total score ranges from 18 (total dependence) to 126 (complete '
              'independence). Motor subscale: 13 items, max 91. Cognitive subscale: '
              '5 items, max 35. FIM score >80 at discharge predicts home discharge. '
              'FIM efficiency = FIM gain / LOS (points per day). Average FIM '
              'efficiency in IRF is 1.5-2.0 points/day for stroke.',
        ),
        PearlBlock(
          'FIM Score >80 Predicts Home Discharge',
          'A discharge FIM score >80 is associated with high probability of '
          'discharge to home. A FIM score <40 at admission predicts poor '
          'rehabilitation outcomes and possible need for skilled nursing level '
          'of care. FIM gain (admission to discharge FIM change) and FIM '
          'efficiency (FIM gain / length of stay) are used for program '
          'evaluation and benchmarking.',
        ),
        TableBlock(
          title: 'FIM Domain Structure',
          columns: ['Domain', 'Items', 'Max Score'],
          rows: [
            ['Self-Care', 'Eating, Grooming, Bathing, Dressing Upper, Dressing Lower, Toileting', '42'],
            ['Sphincter Control', 'Bladder, Bowel', '14'],
            ['Transfers', 'Bed/Chair, Toilet, Tub/Shower', '21'],
            ['Locomotion', 'Walk/Wheelchair, Stairs', '14'],
            ['Communication', 'Comprehension, Expression', '14'],
            ['Social Cognition', 'Social Interaction, Problem Solving, Memory', '21'],
            ['TOTAL', '18 items', '126'],
          ],
        ),
        TableBlock(
          title: 'Other Common Outcome Scales',
          columns: ['Scale', 'Measures', 'Key Features'],
          rows: [
            [
              'Modified Rankin Scale (mRS)',
              'Global disability/dependence',
              '0-6 scale. 0=no symptoms, 5=severe disability, 6=dead. Most used in stroke trials.',
            ],
            [
              'Barthel Index',
              'Basic ADL independence',
              '0-100 score. 10 items. >60 = modified independence. Simple, widely used.',
            ],
            [
              'NIHSS',
              'Neurological deficit severity',
              '0-42 score. Acute severity and prognosis. 0=normal, >25=very severe.',
            ],
            [
              'Berg Balance Scale',
              'Balance and fall risk',
              '0-56 score. 14 items. <45 = increased fall risk.',
            ],
            [
              'Fugl-Meyer Assessment',
              'Sensorimotor recovery',
              '0-226 total. Motor UE 0-66, Motor LE 0-34. Based on Brunnstrom stages.',
            ],
            [
              '10-Meter Walk Test',
              'Gait speed',
              '<0.4 m/s = household ambulator. 0.4-0.8 = limited community. >0.8 = community.',
            ],
            [
              '6-Minute Walk Test',
              'Functional walking endurance',
              'Distance walked in 6 minutes. Community ambulation threshold ~300-350 m.',
            ],
          ],
        ),
        PearlBlock(
          'Gait Speed as the "Sixth Vital Sign"',
          'Gait speed, measured by the 10-meter walk test, is considered the '
          '"sixth vital sign" in rehabilitation. Functional ambulation categories: '
          '<0.4 m/s = household ambulator (cannot safely navigate community), '
          '0.4-0.8 m/s = limited community ambulator, >0.8 m/s = full community '
          'ambulator. Minimum gait speed to safely cross a street crosswalk is '
          'approximately 1.0-1.2 m/s.',
        ),
      ],
    ),

    // ── Tab 3: Rehab Settings ──
    TopicTab(
      title: 'Rehab Settings',
      blocks: [
        HeaderBlock('Rehabilitation Settings & Continuum'),
        TextBlock(
          'The stroke rehabilitation continuum spans from the acute hospital '
          'through inpatient rehabilitation, skilled nursing, home health, and '
          'outpatient services. Matching the patient to the appropriate setting '
          'based on medical stability, functional level, and therapy tolerance '
          'is critical for optimal outcomes.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Inpatient Rehabilitation Facility (IRF)',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.local_hospital,
          description:
              'Intensive inpatient rehabilitation with daily physician oversight '
              'and coordinated interdisciplinary team.',
          keyPoints: [
            'Requires tolerance of 3 hours of therapy per day, 5 days/week',
            'Must need at least 2 therapy disciplines (PT, OT, SLP)',
            'Must be medically stable',
            'Must have realistic, measurable functional goals',
            'Must require physician supervision (face-to-face 3x/week)',
            'CMS 60% rule: 60% of cases must meet qualifying diagnoses (stroke qualifies)',
            'Average length of stay for stroke: 15-17 days',
            'Better outcomes than SNF for moderate-severe stroke (AVERT trial data)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Skilled Nursing Facility (SNF)',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.apartment,
          description:
              'Lower intensity rehabilitation in a nursing facility setting. '
              'Appropriate for patients who cannot tolerate IRF intensity.',
          keyPoints: [
            'Therapy 1-2 hours per day typical',
            'For patients who cannot tolerate 3 hours/day of therapy',
            'Medically complex patients requiring nursing care',
            'Cognitive limitations may prevent active therapy participation',
            'Physician oversight less intensive than IRF',
            'Medicare covers up to 100 days per benefit period (with qualifying stay)',
            'Days 1-20 fully covered, days 21-100 require copay',
          ],
        ),
        ComparisonCardBlock(
          title: 'Home Health',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.home,
          description:
              'Therapy services delivered in the patient\'s home. Requires '
              'homebound status.',
          keyPoints: [
            'Patient must be "homebound" (leaving home is a taxing effort)',
            'PT, OT, SLP, nursing, social work, and aide services available',
            'Physician must certify need and create plan of care',
            'Typically 2-3 visits per week per discipline',
            'Focus on functional independence in actual home environment',
            'Environmental assessment and modification',
            'Caregiver training in the home setting',
            'Bridge between inpatient rehab and outpatient',
          ],
        ),
        ComparisonCardBlock(
          title: 'Outpatient Rehabilitation',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.directions_car,
          description:
              'Clinic-based therapy services for patients who can travel to '
              'the facility.',
          keyPoints: [
            'Patient able to travel to clinic',
            'Day rehabilitation programs: intensive (3-6 hours/day)',
            'Standard outpatient: 1-3 sessions per week',
            'Continued goal-directed therapy after inpatient rehab',
            'May continue for months to years after stroke',
            'Medicare therapy caps have been repealed (MIPS threshold replaces)',
            'Community re-integration focus',
          ],
        ),
        PearlBlock(
          'Early Rehabilitation = Better Outcomes',
          'Multiple studies demonstrate that early rehabilitation (initiated '
          'within 24-48 hours of medical stabilization) leads to better '
          'functional outcomes, shorter hospital stays, and lower mortality. '
          'However, the AVERT trial showed that VERY early high-dose '
          'mobilization (<24 hours) may be harmful. Current recommendation: '
          'begin rehabilitation within 24-48 hours with graduated intensity, '
          'avoiding aggressive early high-dose mobilization.',
        ),
        TableBlock(
          title: 'Rehabilitation Setting Selection Guide',
          columns: ['Criterion', 'IRF', 'SNF', 'Home Health'],
          rows: [
            ['Therapy tolerance', '3 hrs/day', '1-2 hrs/day', 'Variable'],
            ['Medical stability', 'Required', 'More complex OK', 'Stable'],
            ['Supervision need', '24-hour available', '24-hour nursing', 'Caregiver or independent'],
            ['Therapy disciplines', '>=2 required', '>=1', '>=1'],
            ['MD supervision', '3x/week face-to-face', 'Monthly', 'Certifying physician'],
            ['Avg LOS', '15-17 days', '21-35 days', 'Weeks to months'],
            ['Best for', 'Moderate-severe, motivated', 'Cannot tolerate IRF intensity', 'Homebound, functional plateau'],
          ],
        ),
      ],
    ),

    // ── Tab 4: Community ──
    TopicTab(
      title: 'Community',
      blocks: [
        HeaderBlock('Community Reintegration & Long-Term Outcomes'),
        TextBlock(
          'The ultimate goal of stroke rehabilitation is maximal participation '
          'in life roles and community activities. Long-term outcomes depend '
          'on ongoing management of risk factors, continued skill development, '
          'adaptive strategies, and psychosocial support. Approximately 50-70% '
          'of stroke survivors regain functional independence, but many face '
          'ongoing challenges.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Long-Term Functional Outcomes',
          columns: ['Outcome', 'Percentage', 'Notes'],
          rows: [
            ['Independent in basic ADLs', '50-70%', 'At 6 months poststroke'],
            ['Community ambulation', '50-60%', 'With or without assistive device'],
            ['Return to work', '25-50%', 'Highly variable, depends on job demands'],
            ['Return to driving', '30-50%', 'Requires formal driving evaluation'],
            ['Persistent depression', '30-50%', 'Ongoing screening needed'],
            ['Recurrent stroke within 5 years', '25-30%', 'Secondary prevention is critical'],
            ['Caregiver burden/burnout', '30-50%', 'Caregiver support programs essential'],
          ],
        ),
        BulletCardBlock(
          title: 'Driving After Stroke',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          points: [
            'No driving for at least 1-3 months after stroke (varies by state)',
            'Comprehensive driving evaluation (CDE) by driving rehabilitation specialist',
            'Assess vision, cognition, reaction time, judgment, motor function',
            'Behind-the-wheel evaluation is the gold standard',
            'Visual field cuts (hemianopia) are NOT absolute contraindications in all states',
            'Vehicle modifications may be needed (left-foot accelerator, hand controls, spinner knob)',
            'Physician has duty to report if patient is unsafe — varies by state law',
            'Seizure-free interval required if poststroke seizures',
          ],
        ),
        BulletCardBlock(
          title: 'Return to Work',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          points: [
            '25-50% of working-age stroke survivors return to work',
            'Predictors: younger age, mild deficit, white-collar job, supportive employer',
            'Vocational rehabilitation services — assessment, training, job coaching',
            'Americans with Disabilities Act (ADA) — reasonable accommodations required',
            'Supported employment programs improve return-to-work rates',
            'Cognitive and communication deficits often more limiting than motor deficits',
            'Gradual return with modified duties recommended',
          ],
        ),
        BulletCardBlock(
          title: 'Ongoing Care Needs',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          points: [
            'Secondary prevention compliance (medications, lifestyle)',
            'Ongoing spasticity management',
            'Annual depression screening',
            'Fall prevention program',
            'Exercise and fitness (adapted programs)',
            'Caregiver support and respite services',
            'Community-based stroke support groups',
            'Annual review of functional status and equipment needs',
            'Telehealth follow-up expanding access',
          ],
        ),
        PearlBlock(
          'Caregiver Burden',
          'Caregiver burden affects 30-50% of stroke caregivers and includes '
          'depression, anxiety, physical health decline, social isolation, '
          'and financial strain. Caregiver well-being directly impacts patient '
          'outcomes. Rehabilitation teams should assess and support caregivers '
          'through education, skills training, respite services, and counseling '
          'referrals. The Caregiver Strain Index (CSI) is a validated screening '
          'tool.',
        ),
        BulletCardBlock(
          title: 'Adaptive Equipment & Community Resources',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          points: [
            'Adaptive equipment: reachers, sock aids, rocker knife, built-up handles',
            'Bathroom safety: grab bars, tub bench, raised toilet seat, handheld shower',
            'Mobility: AFO, cane (held in UNAFFECTED hand), rollator, wheelchair',
            'Home modifications: ramp, stair lift, widened doorways',
            'Communication: speech-generating devices, aphasia apps',
            'Transportation: paratransit services, adaptive driving',
            'National Stroke Association and American Stroke Association resources',
          ],
        ),
      ],
    ),
  ],
);
