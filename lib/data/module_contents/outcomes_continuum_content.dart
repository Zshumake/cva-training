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
        KnowledgeCheckBlock(
          question: 'Which stroke subtype has the BEST functional prognosis, with up to 80% of patients achieving functional independence?',
          options: ['Large MCA territory infarct', 'Lacunar infarct', 'Cardioembolic stroke', 'Watershed infarct'],
          correctIndex: 1,
          explanation: 'Lacunar infarcts (small vessel disease, <1.5 cm) have the best functional prognosis because the infarct size is small, cortical function is preserved, and motor recovery is often complete. However, they have a high recurrence rate.',
          boardRelevance: 'BOARD-CORE',
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
        KnowledgeCheckBlock(
          question: 'What is the minimum FIM score at discharge that predicts a HIGH probability of discharge to home?',
          options: ['FIM > 40', 'FIM > 60', 'FIM > 80', 'FIM > 100'],
          correctIndex: 2,
          explanation: 'A discharge FIM score > 80 is associated with high probability of discharge to home. A FIM score < 40 at admission predicts poor rehabilitation outcomes and possible need for skilled nursing care.',
          boardRelevance: 'BOARD-CORE',
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
        ScaleBlock(
          scaleName: 'Modified Rankin Scale (mRS)',
          description:
              'The most widely used global outcome measure in stroke clinical '
              'trials. Measures degree of disability and dependence in daily '
              'activities. Simple 7-point scale (0-6).',
          columns: ['Score', 'Description', 'Functional Level'],
          rows: [
            ['0', 'No symptoms', 'Completely asymptomatic — no residual effects'],
            ['1', 'No significant disability', 'Symptoms present but able to carry out all usual activities and duties'],
            ['2', 'Slight disability', 'Unable to carry out all previous activities but able to look after own affairs without assistance'],
            ['3', 'Moderate disability', 'Requires some help but able to walk without assistance (may use cane)'],
            ['4', 'Moderately severe disability', 'Unable to walk without assistance and unable to attend to own bodily needs without assistance'],
            ['5', 'Severe disability', 'Bedridden, incontinent, requires constant nursing care and attention'],
            ['6', 'Dead', 'Patient has died'],
          ],
          boardPearl:
              'The mRS is the PRIMARY outcome measure in most major stroke trials '
              '(NINDS tPA, MR CLEAN, DAWN, DEFUSE 3). "Good outcome" is typically '
              'defined as mRS 0-2 (functional independence). "Favorable outcome" in '
              'some trials includes mRS 0-3. The shift analysis (ordinal shift across '
              'all mRS levels) is increasingly used rather than a single cutpoint. '
              'Structured mRS interview improves inter-rater reliability.',
        ),
        ScaleBlock(
          scaleName: 'Barthel Index',
          description:
              'A 10-item ordinal scale measuring independence in basic ADLs. '
              'Total score 0-100. One of the oldest and most widely used ADL '
              'measures worldwide.',
          columns: ['Activity', 'Independent Score', 'Dependent Score'],
          rows: [
            ['Feeding', '10', '0 (unable) or 5 (needs help)'],
            ['Bathing', '5', '0'],
            ['Grooming', '5', '0'],
            ['Dressing', '10', '0 or 5'],
            ['Bowel control', '10', '0 (incontinent) or 5 (occasional accident)'],
            ['Bladder control', '10', '0 or 5'],
            ['Toilet use', '10', '0 or 5'],
            ['Transfers (bed to chair)', '15', '0, 5, or 10'],
            ['Mobility (level surface)', '15', '0, 5, or 10'],
            ['Stairs', '10', '0 or 5'],
          ],
          boardPearl:
              'Barthel Index >60 = modified independence (can manage with minimal '
              'assistance). Score of 100 does NOT mean the patient is normal — it '
              'means independent in BASIC ADLs only. Limitations: ceiling effect '
              '(cannot distinguish among higher-functioning patients), does not '
              'assess IADLs (cooking, finances, community mobility), and does not '
              'assess cognition or communication. FIM is more sensitive than Barthel '
              'because of its 7-point scale vs Barthel\'s 3-point increments.',
        ),
        ComparisonCardBlock(
          title: 'Stroke Impact Scale (SIS)',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.person,
          description:
              'A patient-reported outcome measure (PROM) that captures the '
              'patient\'s own perspective on how stroke has affected their life '
              'across 8 domains.',
          keyPoints: [
            '59 items across 8 domains: Strength, Hand function, Mobility, ADL/IADL, Memory/thinking, Communication, Emotion, Social participation',
            'Each item scored 1-5 (1 = could not do, 5 = not difficult at all)',
            'Domain scores transformed to 0-100 scale (higher = less impact/better function)',
            'Includes a single-item stroke recovery rating (0-100 visual analog)',
            'Captures patient perspective — clinician-rated scales may miss important deficits',
            'More sensitive to change in higher-functioning patients than FIM or Barthel (no ceiling effect)',
            'Widely used in stroke rehabilitation research',
            'Limitation: requires adequate cognition and language to complete — not suitable for severe aphasia or cognitive impairment',
          ],
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
        TimelineBlock(
          title: 'Stroke Rehabilitation Continuum',
          milestones: [
            TimelineMilestone(
              label: 'Days 0-3',
              title: 'Acute Hospital Care',
              details: ['Medical stabilization', 'Early mobilization within 24-48 hours', 'Rehabilitation needs assessment and therapy screening'],
            ),
            TimelineMilestone(
              label: 'Days 3-7',
              title: 'Acute Rehab Assessment',
              details: ['Determine therapy tolerance (can tolerate 3 hrs/day?)', 'Match patient to appropriate rehab setting', 'IRF for moderate-severe, motivated patients'],
            ),
            TimelineMilestone(
              label: 'Weeks 1-3',
              title: 'Inpatient Rehabilitation Facility (IRF)',
              details: ['3 hours therapy/day, 5 days/week', 'Physician supervision 3x/week', 'Average LOS: 14-17 days for stroke'],
            ),
            TimelineMilestone(
              label: 'Weeks 3-8',
              title: 'SNF or Home Health',
              details: ['SNF: 1-2 hrs therapy/day for those who cannot tolerate IRF', 'Home health: homebound patients, 2-3 visits/week', 'Caregiver training in actual home environment'],
            ),
            TimelineMilestone(
              label: 'Months 2-6',
              title: 'Outpatient Rehabilitation',
              details: ['Clinic-based PT/OT/SLP 1-3x per week', 'Day rehab programs 3-6 hours/day', 'Community reintegration focus'],
            ),
            TimelineMilestone(
              label: 'Months 6+',
              title: 'Community & Long-Term',
              details: ['Community exercise programs and support groups', 'Vocational rehabilitation for return to work', 'Ongoing secondary prevention and annual reassessment'],
            ),
          ],
        ),
        KnowledgeCheckBlock(
          question: 'According to gait speed classification, what speed threshold defines a community ambulator?',
          options: ['> 0.4 m/s', '> 0.6 m/s', '> 0.8 m/s', '> 1.2 m/s'],
          correctIndex: 2,
          explanation: 'Gait speed >0.8 m/s = full community ambulator. <0.4 m/s = household ambulator. 0.4-0.8 m/s = limited community ambulator. Gait speed is considered the "sixth vital sign" in rehabilitation.',
          boardRelevance: 'BOARD-CORE',
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
        ComparisonCardBlock(
          title: 'CMS 60% Rule for IRF Admission',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.gavel,
          description:
              'CMS compliance requirement that at least 60% of an IRF\'s total '
              'patient population must have one of 13 qualifying diagnostic '
              'categories to maintain IRF classification.',
          keyPoints: [
            'Stroke is one of the 13 qualifying diagnoses — a major IRF admission category',
            'Other qualifying diagnoses: SCI, TBI, hip fracture, major multiple trauma, brain tumor, amputation, burns, and others',
            'Facilities falling below 60% risk reclassification as an acute care hospital (lower reimbursement)',
            'Pre-admission screening must document: qualifying diagnosis, medical stability, ability to tolerate 3 hours/day of therapy',
            'Patient must require active physician involvement and coordinated interdisciplinary team',
            'Rehabilitation physician must conduct face-to-face visit within 24 hours of admission',
            'IRF Patient Assessment Instrument (IRF-PAI) documents functional status using Section GG items',
            'CMS compliance review considers both diagnosis and intensity of services provided',
          ],
        ),
        BulletCardBlock(
          title: 'Length of Stay Trends in Stroke Rehabilitation',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          points: [
            'Average IRF LOS for stroke: approximately 14-15 days (trending downward over the past two decades)',
            'In the 1990s, average IRF LOS for stroke was 20-25 days',
            'Prospective payment system (PPS) implementation in 2002 drove significant LOS reductions',
            'Case mix groups (CMGs) determine reimbursement — grouped by diagnosis, functional status, age, and comorbidities',
            'Shorter LOS does not always mean worse outcomes — higher therapy intensity can compensate',
            'FIM efficiency (FIM gain / LOS) has INCREASED as LOS has decreased — more efficient rehabilitation',
            'SNF average LOS for stroke: 21-35 days',
            'Pressure to reduce LOS must be balanced against adequate functional recovery',
          ],
        ),
        TableBlock(
          title: 'Discharge Destination Predictors',
          columns: ['Predictor', 'Home Discharge', 'Institutional Care'],
          rows: [
            ['FIM score', 'Discharge FIM >80', 'Discharge FIM <60'],
            ['Social support', 'Spouse or family caregiver available', 'Lives alone, no caregiver'],
            ['Age', 'Younger (<75)', 'Older (>85)'],
            ['Cognition', 'Intact or mildly impaired', 'Moderate-severe cognitive impairment'],
            ['Continence', 'Continent or managed', 'Persistent incontinence'],
            ['Bowel/bladder', 'Independent management', 'Requires assistance'],
            ['Neglect/awareness', 'Absent or mild', 'Severe neglect with anosognosia'],
            ['Prior living situation', 'Community dwelling', 'Assisted living or nursing home'],
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
        ComparisonCardBlock(
          title: 'Caregiver Training Needs — Detailed',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.people,
          description:
              'Caregiver preparedness is a critical determinant of successful '
              'home discharge. Training should begin during inpatient rehabilitation '
              'and continue after discharge.',
          keyPoints: [
            'Transfer training: bed-to-wheelchair, wheelchair-to-toilet, car transfers — hands-on practice essential',
            'Medication management: understanding dosing, recognizing side effects, pill organization',
            'Skin inspection: daily checks of pressure-prone areas, recognition of early pressure injury',
            'Signs of medical emergency: stroke recurrence (FAST), DVT, PE, seizure, aspiration',
            'Emotional support: managing behavioral changes, depression screening, when to seek help',
            'Communication strategies for aphasia: yes/no questions, visual cues, patience, communication boards',
            'Fall prevention in the home: environmental hazards, safe mobility techniques, when to call for help',
            'Caregiver self-care: respite services, support groups, recognizing burnout signs',
            'Caregiver Strain Index (CSI): 13-item screening tool — score >=7 indicates high strain',
          ],
        ),
        ComparisonCardBlock(
          title: 'Community Reintegration Challenges',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.public,
          description:
              'Return to community living involves challenges beyond physical '
              'recovery. Social participation, transportation, leisure, and '
              'meaningful activity are key quality of life determinants.',
          keyPoints: [
            'Transportation: loss of driving privilege, reliance on paratransit, public transit barriers (stairs, timing)',
            'Social isolation: up to 50% of stroke survivors report significant social isolation',
            'Loss of leisure activities: hobbies, sports, travel — require adaptation or substitution',
            'Role changes within families: from provider/parent to dependent — significant psychological impact',
            'Financial impact: lost income, medical costs, home modifications, caregiver lost wages',
            'Community Participation Indicators (CPI) and Reintegration to Normal Living (RNL) Index — validated measures',
            'Community-based exercise programs (YMCA, Livestrong, adapted fitness classes) improve participation',
            'Stroke support groups provide peer support, information, and social connection',
            'Community Integration Questionnaire (CIQ) assesses home, social, and productive activities',
          ],
        ),
        ComparisonCardBlock(
          title: 'Telerehabilitation Evidence',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.video_call,
          description:
              'The delivery of rehabilitation services via telecommunication '
              'technology. Expanded rapidly post-COVID with growing evidence '
              'supporting its effectiveness.',
          keyPoints: [
            'Non-inferior to in-person therapy for many stroke rehabilitation interventions',
            'Effective for: upper extremity training, speech-language therapy, cognitive rehabilitation, caregiver education',
            'Advantages: eliminates transportation barriers, increases access in rural areas, enables more frequent sessions',
            'Limitations: cannot perform hands-on manual therapy, limited for severe cognitive/communication impairment',
            'Technology requirements: reliable internet, video-capable device, adequate hearing and vision',
            'Hybrid models (combination of in-person and telehealth) may be optimal',
            'CMS expanded telehealth coverage during COVID-19 pandemic — many expansions made permanent',
            'Emerging: remote monitoring of activity, gait sensors, wearable devices for home exercise feedback',
            'Patient satisfaction is generally high when technology barriers are addressed',
          ],
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
        ComparisonCardBlock(
          title: 'Quality Metrics in Stroke Care',
          themeColor: Color(0xFF0891B2),
          backgroundColor: Color(0xFFECFEFF),
          icon: Icons.verified,
          description:
              'Quality measurement programs drive improvement in stroke care '
              'and rehabilitation. Facilities are evaluated and compared on '
              'standardized metrics.',
          keyPoints: [
            'Joint Commission Primary Stroke Center (PSC) certification: standardized processes for acute stroke care',
            'Joint Commission Comprehensive Stroke Center (CSC): includes thrombectomy capability and neurocritical care',
            'CMS Hospital Quality Measures for Stroke: VTE prophylaxis, antithrombotic therapy, AF anticoagulation, DVT screening, rehab assessment, dysphagia screening',
            'Get With The Guidelines (GWTG) — Stroke: AHA/ASA quality improvement program tracking adherence to evidence-based care',
            'GWTG Gold Plus achievement: >=85% adherence to all applicable measures for >=24 consecutive months',
            'IRF quality measures: discharge to community rate, improvement in self-care, improvement in mobility (Section GG)',
            'CMS IMPACT Act: standardized patient assessment data across post-acute care settings',
            'Patient experience measures: HCAHPS (hospital), IRF-specific satisfaction surveys',
            'Risk-adjusted 30-day readmission rates: publicly reported, affect reimbursement',
          ],
        ),
      ],
    ),
  ],
);
