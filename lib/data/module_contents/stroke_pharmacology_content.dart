import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData strokePharmacologyContent = TopicData(
  id: 'stroke_pharmacology',
  title: 'Stroke Pharmacology',
  tabs: [
    // ── Tab 1: Antiplatelets ──
    TopicTab(
      title: 'Antiplatelets',
      blocks: [
        HeaderBlock('Antiplatelet Therapy in Stroke'),
        TextBlock(
          'Antiplatelet agents are the cornerstone of secondary prevention after '
          'ischemic stroke or TIA in patients without a cardioembolic source. '
          'Aspirin remains the first-line agent and should be started within '
          '24-48 hours of stroke onset.',
          isIntro: true,
        ),
        MedicationCardBlock(
          name: 'Aspirin (ASA)',
          drugClass: 'Antiplatelet — COX inhibitor',
          mechanism:
              'Irreversibly inhibits cyclooxygenase-1 (COX-1), blocking '
              'thromboxane A2 synthesis and platelet aggregation.',
          indication:
              'Secondary prevention of noncardioembolic ischemic stroke or TIA.',
          dosing:
              '50-325 mg daily. Initiate within 24-48 hours of stroke onset. '
              'If tPA was given, wait 24 hours before starting aspirin.',
          sideEffects: 'GI bleeding, peptic ulcer, tinnitus at high doses.',
          boardPearl:
              'Aspirin 50-325 mg/day is equally effective across the dose range '
              'for secondary stroke prevention (AHA/ASA Class I). Higher doses '
              'increase bleeding risk without additional efficacy.',
        ),
        MedicationCardBlock(
          name: 'Clopidogrel (Plavix)',
          drugClass: 'Antiplatelet — P2Y12 receptor antagonist',
          mechanism:
              'Irreversibly blocks the P2Y12 ADP receptor on platelets, '
              'inhibiting ADP-mediated platelet activation and aggregation.',
          indication:
              'Alternative to aspirin for secondary stroke prevention. '
              'Preferred in patients with aspirin allergy.',
          dosing: '75 mg daily. No loading dose needed for chronic use.',
          sideEffects:
              'Bleeding, TTP (rare), rash. Reduced efficacy in CYP2C19 '
              'poor metabolizers.',
          boardPearl:
              'CAPRIE trial showed clopidogrel slightly superior to aspirin '
              'for combined vascular endpoints. Dual antiplatelet therapy '
              '(aspirin + clopidogrel) for 21 days after minor stroke/TIA '
              'reduces recurrence (CHANCE and POINT trials) but increases '
              'bleeding risk if continued long-term.',
        ),
        MedicationCardBlock(
          name: 'Aspirin + Extended-Release Dipyridamole (Aggrenox)',
          drugClass: 'Combination antiplatelet',
          mechanism:
              'Dipyridamole inhibits phosphodiesterase and adenosine uptake, '
              'increasing cAMP and cGMP levels in platelets. Combined with '
              'aspirin for synergistic antiplatelet effect.',
          indication: 'Secondary prevention of noncardioembolic ischemic stroke.',
          dosing: '25 mg ASA / 200 mg ER dipyridamole twice daily.',
          sideEffects:
              'Headache (most common, up to 40% — often resolves in 1-2 weeks), '
              'GI upset, dizziness.',
          boardPearl:
              'ESPRIT and ESPS-2 trials showed Aggrenox superior to aspirin alone. '
              'PRoFESS trial showed Aggrenox equivalent to clopidogrel. '
              'Headache is the primary reason for discontinuation.',
        ),
        PearlBlock(
          'Dual Antiplatelet Therapy (DAPT) After Minor Stroke',
          'The CHANCE and POINT trials demonstrated that short-term DAPT '
          '(aspirin + clopidogrel for 21 days) started within 24 hours of '
          'minor stroke (NIHSS <=3) or high-risk TIA reduces the 90-day '
          'stroke recurrence rate. Long-term DAPT beyond 21-90 days is NOT '
          'recommended due to increased hemorrhagic risk (SPS3 trial).',
        ),
        TableBlock(
          title: 'Antiplatelet Agent Comparison',
          columns: ['Agent', 'Key Trial', 'Relative Efficacy'],
          rows: [
            ['Aspirin 50-325 mg', 'IST/CAST', 'Baseline comparator'],
            ['Clopidogrel 75 mg', 'CAPRIE', 'Slightly superior to ASA'],
            ['Aggrenox (ASA+DP)', 'ESPS-2, ESPRIT', 'Superior to ASA alone'],
            [
              'ASA + Clopidogrel (21d)',
              'CHANCE, POINT',
              'Superior short-term for minor stroke/TIA',
            ],
            [
              'ASA + Clopidogrel (long)',
              'SPS3, MATCH',
              'NOT recommended — increased bleeding',
            ],
          ],
        ),
        ComparisonCardBlock(
          title: 'CHANCE Trial (2013)',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.science,
          description:
              'Chinese study demonstrating benefit of short-term dual antiplatelet '
              'therapy (DAPT) after minor ischemic stroke or high-risk TIA.',
          keyPoints: [
            'Population: minor stroke (NIHSS <= 3) or high-risk TIA within 24 hours of onset',
            'Protocol: ASA 75 mg + clopidogrel 75 mg (300 mg load day 1) for 21 days, then clopidogrel alone',
            'Result: 90-day stroke recurrence 8.2% (DAPT) vs 11.7% (ASA alone) -- 32% relative risk reduction',
            'No significant increase in hemorrhagic events with 21-day DAPT',
            'Predominantly Chinese population -- CYP2C19 polymorphisms may affect generalizability',
            'Established 21 days as the optimal DAPT duration for minor stroke/TIA',
          ],
        ),
        ComparisonCardBlock(
          title: 'POINT Trial (2018)',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.science,
          description:
              'International trial confirming short-term DAPT benefit but '
              'revealing increased bleeding risk at 90 days.',
          keyPoints: [
            'Population: minor stroke (NIHSS <= 3) or high-risk TIA (ABCD2 >= 4) within 12 hours',
            'Protocol: ASA + clopidogrel (600 mg load, then 75 mg) for 90 days vs ASA alone',
            'Result: reduced major ischemic events (5.0% vs 6.5%) at 90 days',
            'BUT: increased major hemorrhage (0.9% vs 0.4%) with 90-day DAPT',
            'Post-hoc analysis: benefit concentrated in first 21 days, bleeding risk increased after 21 days',
            'Supports CHANCE protocol of 21-day DAPT (not 90 days) -- shorter duration, less bleeding',
            'AHA/ASA guidelines now recommend 21-day DAPT for minor stroke/TIA started within 24 hours',
          ],
        ),
        ComparisonCardBlock(
          title: 'COMPASS Trial (2017)',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.science,
          description:
              'Evaluated low-dose rivaroxaban plus aspirin for patients with '
              'stable atherosclerotic vascular disease.',
          keyPoints: [
            'Protocol: rivaroxaban 2.5 mg BID + ASA 100 mg vs ASA alone',
            'Reduced major cardiovascular events (stroke, MI, CV death) by 24%',
            'Reduced ischemic stroke by 42%',
            'Increased major bleeding (3.1% vs 1.9%) but no increase in fatal bleeding',
            'Net clinical benefit favored combination therapy',
            'Applicable to patients with stable atherosclerotic disease (CAD, PAD, carotid stenosis)',
            'NOT a first-line stroke secondary prevention regimen -- niche population with polyvascular disease',
          ],
        ),
        PearlBlock(
          'NAVIGATE ESUS (2018) -- Negative Trial',
          'Rivaroxaban 15 mg daily vs aspirin 100 mg daily for Embolic Stroke '
          'of Undetermined Source (ESUS). NO benefit of rivaroxaban over aspirin '
          'for preventing recurrent stroke. Increased bleeding with rivaroxaban. '
          'Similarly, the RE-SPECT ESUS trial showed no benefit of dabigatran '
          'over aspirin for ESUS. Conclusion: anticoagulation is NOT indicated '
          'for ESUS -- antiplatelet therapy remains standard unless a specific '
          'indication for anticoagulation is identified (e.g., occult AF).',
        ),
      ],
    ),

    // ── Tab 2: Anticoagulation ──
    TopicTab(
      title: 'Anticoagulation',
      blocks: [
        HeaderBlock('Anticoagulation for Stroke Prevention'),
        TextBlock(
          'Anticoagulation is indicated for secondary stroke prevention in '
          'cardioembolic stroke, most commonly due to atrial fibrillation. '
          'DOACs have largely replaced warfarin as first-line agents for '
          'nonvalvular AF.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Indications for Anticoagulation',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          points: [
            'Atrial fibrillation (valvular or nonvalvular)',
            'Mechanical heart valve (warfarin only — DOACs contraindicated)',
            'Left ventricular thrombus',
            'Aortic arch atheroma (controversial)',
            'Cerebral venous sinus thrombosis',
            'Hypercoagulable states (antiphospholipid syndrome — warfarin preferred)',
          ],
        ),
        MedicationCardBlock(
          name: 'Warfarin (Coumadin)',
          drugClass: 'Vitamin K antagonist',
          mechanism:
              'Inhibits vitamin K epoxide reductase, blocking synthesis of '
              'clotting factors II, VII, IX, X, and proteins C and S.',
          indication:
              'Cardioembolic stroke prevention in AF. Required for mechanical '
              'heart valves and antiphospholipid syndrome.',
          dosing:
              'Dose adjusted to INR 2.0-3.0 for AF. INR 2.5-3.5 for mechanical '
              'valves. Bridge with heparin during initiation.',
          sideEffects:
              'Bleeding, skin necrosis (protein C deficiency), teratogenicity, '
              'warfarin-induced calciphylaxis.',
          boardPearl:
              'Target INR 2.0-3.0 reduces stroke risk by ~67% in AF. '
              'Warfarin remains the ONLY approved anticoagulant for mechanical '
              'heart valves. Warfarin-induced skin necrosis occurs in first '
              '3-6 days due to rapid depletion of protein C.',
        ),
        MedicationCardBlock(
          name: 'Dabigatran (Pradaxa)',
          drugClass: 'DOAC — Direct thrombin inhibitor',
          mechanism:
              'Directly and reversibly inhibits free and clot-bound thrombin.',
          indication:
              'Stroke prevention in nonvalvular atrial fibrillation.',
          dosing:
              '150 mg BID (superior to warfarin for efficacy). 75 mg BID for '
              'CrCl 15-30 mL/min. Contraindicated if CrCl <15.',
          sideEffects: 'GI bleeding (higher than warfarin), dyspepsia.',
          boardPearl:
              'RE-LY trial: Dabigatran 150 mg BID was superior to warfarin '
              'for stroke prevention with similar major bleeding. '
              'Reversal agent: idarucizumab (Praxbind).',
        ),
        MedicationCardBlock(
          name: 'Rivaroxaban (Xarelto)',
          drugClass: 'DOAC — Factor Xa inhibitor',
          mechanism:
              'Directly and selectively inhibits free and clot-bound Factor Xa.',
          indication: 'Stroke prevention in nonvalvular AF.',
          dosing:
              '20 mg daily with evening meal. 15 mg daily for CrCl 15-50 mL/min.',
          sideEffects: 'Bleeding, anemia.',
          boardPearl:
              'ROCKET-AF trial: Rivaroxaban noninferior to warfarin. '
              'Once-daily dosing may improve compliance. '
              'Reversal agent: andexanet alfa (Andexxa).',
        ),
        MedicationCardBlock(
          name: 'Apixaban (Eliquis)',
          drugClass: 'DOAC — Factor Xa inhibitor',
          mechanism: 'Directly and selectively inhibits Factor Xa.',
          indication: 'Stroke prevention in nonvalvular AF.',
          dosing:
              '5 mg BID. Reduce to 2.5 mg BID if >=2 of: age >=80, '
              'weight <=60 kg, creatinine >=1.5.',
          sideEffects: 'Bleeding (lowest major bleeding rate among DOACs).',
          boardPearl:
              'ARISTOTLE trial: Apixaban was SUPERIOR to warfarin for both '
              'stroke prevention AND major bleeding reduction AND mortality. '
              'Often considered the preferred DOAC for AF.',
        ),
        TableBlock(
          title: 'DOAC Comparison for Atrial Fibrillation',
          columns: ['Drug', 'Trial', 'Dosing', 'vs Warfarin', 'Reversal'],
          rows: [
            [
              'Dabigatran',
              'RE-LY',
              '150 mg BID',
              'Superior efficacy',
              'Idarucizumab',
            ],
            [
              'Rivaroxaban',
              'ROCKET-AF',
              '20 mg daily',
              'Noninferior',
              'Andexanet alfa',
            ],
            [
              'Apixaban',
              'ARISTOTLE',
              '5 mg BID',
              'Superior efficacy + safety',
              'Andexanet alfa',
            ],
            [
              'Edoxaban',
              'ENGAGE AF',
              '60 mg daily',
              'Noninferior',
              'Andexanet alfa',
            ],
          ],
        ),
        PearlBlock(
          'Timing of Anticoagulation After Stroke',
          'There is no definitive evidence for optimal timing. General guidance: '
          'start anticoagulation 4-14 days after stroke onset depending on '
          'infarct size. Small infarct: 3-5 days. Moderate: 5-7 days. '
          'Large: 7-14 days. Hemorrhagic transformation delays initiation. '
          'The "1-3-6-12 day rule" is a commonly cited heuristic.',
        ),
        TableBlock(
          title: 'Anticoagulation Timing: 1-3-6-12 Day Rule',
          columns: ['Infarct Size', 'Start Anticoagulation', 'Rationale'],
          rows: [
            ['TIA (no infarct on imaging)', 'Day 1', 'No hemorrhagic transformation risk -- immediate benefit'],
            ['Small infarct (<1.5 cm)', 'Day 3', 'Low risk of hemorrhagic transformation'],
            ['Moderate infarct', 'Day 6', 'Moderate hemorrhagic risk; balance with recurrence risk'],
            ['Large infarct (>1/3 MCA territory)', 'Day 12-14', 'High hemorrhagic transformation risk; repeat imaging before starting'],
          ],
        ),
        TableBlock(
          title: 'Anticoagulant Reversal Agents',
          columns: ['Anticoagulant', 'Reversal Agent', 'Dose / Notes'],
          rows: [
            ['Warfarin', '4-factor PCC (Kcentra) + Vitamin K', 'PCC: dose based on INR (25-50 units/kg); Vitamin K 10 mg IV for sustained reversal; FFP if PCC unavailable'],
            ['Dabigatran', 'Idarucizumab (Praxbind)', '5 g IV (two 2.5 g vials); immediate and complete reversal; does NOT reverse factor Xa inhibitors'],
            ['Rivaroxaban / Apixaban / Edoxaban', 'Andexanet alfa (Andexxa)', 'Low-dose (400 mg bolus + 4 mg/min x 2h) or high-dose (800 mg bolus + 8 mg/min x 2h) based on drug/timing; very expensive'],
            ['All DOACs (if no specific agent available)', '4-factor PCC (off-label)', '50 units/kg IV; less effective than specific reversal agents but widely available'],
            ['Heparin (UFH)', 'Protamine sulfate', '1 mg per 100 units of heparin given in last 2-3 hours; max 50 mg'],
            ['LMWH (enoxaparin)', 'Protamine sulfate (partial)', '1 mg per 1 mg enoxaparin; only ~60% reversal (protamine does not fully reverse anti-Xa activity)'],
          ],
        ),
        PearlBlock(
          'Board Pearl: Reversal Agent Specificity',
          'Idarucizumab (Praxbind) is SPECIFIC for dabigatran only -- it is a '
          'monoclonal antibody fragment that binds dabigatran with 350x greater '
          'affinity than thrombin. Andexanet alfa (Andexxa) reverses ALL factor Xa '
          'inhibitors (rivaroxaban, apixaban, edoxaban) by acting as a decoy '
          'factor Xa. PCC (prothrombin complex concentrate) is the universal '
          'backup for any anticoagulant reversal.',
        ),
      ],
    ),

    // ── Tab 3: Statins ──
    TopicTab(
      title: 'Statins',
      blocks: [
        HeaderBlock('Statin Therapy After Stroke'),
        TextBlock(
          'High-intensity statin therapy is recommended for all patients with '
          'atherosclerotic ischemic stroke or TIA regardless of baseline LDL. '
          'Statins reduce recurrent stroke through lipid-lowering and '
          'pleiotropic effects (plaque stabilization, anti-inflammatory, '
          'endothelial function improvement).',
          isIntro: true,
        ),
        MedicationCardBlock(
          name: 'Atorvastatin (Lipitor)',
          drugClass: 'HMG-CoA reductase inhibitor (Statin)',
          mechanism:
              'Competitively inhibits HMG-CoA reductase, the rate-limiting '
              'enzyme in cholesterol biosynthesis. Upregulates hepatic LDL '
              'receptors, increasing LDL clearance.',
          indication:
              'All patients with atherosclerotic ischemic stroke or TIA. '
              'Target LDL <70 mg/dL (or >=50% reduction).',
          dosing:
              '40-80 mg daily (high-intensity). SPARCL trial used 80 mg.',
          sideEffects:
              'Myalgia, hepatotoxicity (rare), rhabdomyolysis (rare), '
              'new-onset diabetes.',
          boardPearl:
              'SPARCL trial: Atorvastatin 80 mg reduced recurrent stroke '
              'by 16% and major cardiovascular events by 20% in patients '
              'with recent stroke/TIA and no known coronary disease. '
              'Slight increase in hemorrhagic stroke observed.',
        ),
        BulletCardBlock(
          title: 'Statin Pleiotropic Effects',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          points: [
            'Atherosclerotic plaque stabilization',
            'Improved endothelial function and NO bioavailability',
            'Anti-inflammatory effects (reduced CRP)',
            'Antithrombotic properties',
            'Neuroprotective effects (experimental models)',
            'May promote neuroplasticity and angiogenesis',
          ],
        ),
        PearlBlock(
          'Statins for ALL Atherosclerotic Strokes',
          'AHA/ASA guidelines recommend high-intensity statin therapy for all '
          'patients with ischemic stroke or TIA of atherosclerotic origin, '
          'regardless of baseline LDL. Do NOT stop statins during acute '
          'stroke hospitalization — discontinuation is associated with worse '
          'outcomes. Hemorrhagic stroke is a relative concern with very high '
          'dose statins (SPARCL showed small absolute increase).',
        ),
        TableBlock(
          title: 'Statin Intensity Classification',
          columns: ['Intensity', 'Agent/Dose', 'Expected LDL Reduction'],
          rows: [
            ['High', 'Atorvastatin 40-80 mg', '>=50%'],
            ['High', 'Rosuvastatin 20-40 mg', '>=50%'],
            ['Moderate', 'Atorvastatin 10-20 mg', '30-49%'],
            ['Moderate', 'Simvastatin 20-40 mg', '30-49%'],
            ['Low', 'Simvastatin 10 mg', '<30%'],
            ['Low', 'Pravastatin 10-20 mg', '<30%'],
          ],
        ),
        ComparisonCardBlock(
          title: 'Statin Pleiotropic Effects -- Mechanism Detail',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.auto_awesome,
          description:
              'Statins reduce stroke risk through mechanisms beyond LDL lowering. '
              'These pleiotropic effects explain why statins benefit stroke '
              'patients even with normal cholesterol levels.',
          keyPoints: [
            'Anti-inflammatory: reduce CRP, IL-6, TNF-alpha; inhibit leukocyte adhesion molecules (ICAM-1, VCAM-1)',
            'Plaque stabilization: increase fibrous cap thickness, reduce lipid core and metalloproteinase activity',
            'Endothelial function: upregulate endothelial nitric oxide synthase (eNOS) -- improve NO bioavailability',
            'Antithrombotic: reduce tissue factor expression, decrease platelet reactivity, lower PAI-1',
            'Antioxidant: reduce LDL oxidation, decrease superoxide production',
            'Neuroprotection: promote BDNF expression, enhance angiogenesis in ischemic penumbra',
            'These effects occur rapidly (days to weeks), before significant LDL reduction',
          ],
        ),
        PearlBlock(
          'Board Pearl: Do NOT Stop Statins After Stroke',
          'Discontinuing statin therapy during acute hospitalization for stroke '
          'is associated with a 4.7-fold increased risk of death or dependency '
          'at 90 days. The acute withdrawal of pleiotropic effects (loss of '
          'endothelial protection, rebound inflammation) likely contributes. '
          'If a patient is already on a statin at stroke onset, continue it '
          'throughout hospitalization. If not on a statin, initiate high-intensity '
          'statin therapy during hospitalization.',
        ),
      ],
    ),

    // ── Tab 4: Secondary Prevention ──
    TopicTab(
      title: 'Secondary Prevention',
      blocks: [
        HeaderBlock('Secondary Stroke Prevention'),
        TextBlock(
          'Secondary prevention encompasses all medical and surgical strategies '
          'to prevent stroke recurrence. This includes blood pressure management, '
          'carotid revascularization, PFO closure, and lifestyle modifications '
          'in addition to antiplatelet/anticoagulant and statin therapy.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Blood Pressure Management',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          points: [
            'Hypertension is the single most important modifiable risk factor',
            'Target <130/80 mmHg for most stroke/TIA patients (SPRINT trial)',
            'Avoid aggressive lowering in the acute phase (first 24-48 hours)',
            'ACE inhibitors and thiazide diuretics have the best evidence (PROGRESS trial)',
            'Perindopril + indapamide reduced recurrent stroke by 43% (PROGRESS)',
            'Resume antihypertensives after the acute phase (typically 24-72 hours)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Carotid Endarterectomy (CEA)',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.content_cut,
          description:
              'Surgical removal of atherosclerotic plaque from the carotid artery. '
              'Gold standard for symptomatic high-grade carotid stenosis.',
          keyPoints: [
            'Symptomatic stenosis >70%: Strong benefit (NASCET NNT = 6)',
            'Symptomatic stenosis 50-69%: Moderate benefit (NASCET NNT = 22)',
            'Symptomatic stenosis <50%: No benefit',
            'Asymptomatic stenosis >60%: Modest benefit if perioperative risk <3%',
            'Best performed within 2 weeks of index event',
            'Perioperative stroke/death rate must be <6% for symptomatic, <3% for asymptomatic',
          ],
        ),
        ComparisonCardBlock(
          title: 'Carotid Artery Stenting (CAS)',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.tune,
          description:
              'Endovascular placement of a stent in the carotid artery with '
              'embolic protection device.',
          keyPoints: [
            'Alternative to CEA when surgical risk is high',
            'CREST trial: Similar long-term outcomes to CEA overall',
            'CAS: Higher periprocedural stroke risk',
            'CEA: Higher periprocedural MI risk',
            'Age <70: CAS may be preferred (CREST subanalysis)',
            'Age >70: CEA generally preferred',
            'Requires dual antiplatelet therapy periprocedurally',
          ],
        ),
        ComparisonCardBlock(
          title: 'PFO Closure',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.favorite,
          description:
              'Transcatheter closure of patent foramen ovale for secondary '
              'stroke prevention in cryptogenic stroke.',
          keyPoints: [
            'RESPECT trial: PFO closure superior to medical therapy for recurrent stroke',
            'CLOSE and REDUCE trials confirmed benefit',
            'Indicated for age <60 with cryptogenic stroke and moderate-to-large shunt',
            'Presence of atrial septal aneurysm increases benefit',
            'RoPE score helps identify patients most likely to benefit',
            'Higher RoPE score = more likely PFO is pathogenic',
            'Post-procedure: new-onset AF is the most common complication',
          ],
        ),
        PearlBlock(
          'NASCET Criteria for Carotid Stenosis',
          'NASCET measures stenosis as the ratio of the narrowest lumen '
          'diameter to the normal distal ICA diameter. ECST uses the estimated '
          'original vessel diameter as the denominator. A 70% NASCET stenosis '
          'is approximately equivalent to an 82% ECST stenosis. Always clarify '
          'which measurement method was used.',
        ),
        BulletCardBlock(
          title: 'Lifestyle Modifications',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          points: [
            'Smoking cessation (doubles stroke risk when active)',
            'Moderate-intensity exercise >=40 min, 3-4 days/week',
            'Mediterranean or DASH diet',
            'Limit alcohol to <=2 drinks/day (men), <=1 drink/day (women)',
            'Weight management (BMI 18.5-24.9)',
            'Diabetes management (HbA1c <7%)',
            'Obstructive sleep apnea screening and CPAP if indicated',
          ],
        ),
        ComparisonCardBlock(
          title: 'BP Targets: SPS3 Trial for Lacunar Stroke',
          themeColor: Color(0xFF0D9488),
          backgroundColor: Color(0xFFF0FDFA),
          icon: Icons.monitor_heart,
          description:
              'The SPS3 trial specifically evaluated blood pressure targets and '
              'antiplatelet therapy for secondary prevention of lacunar stroke.',
          keyPoints: [
            'SPS3 BP arm: target SBP <130 mmHg vs 130-149 mmHg in patients with recent lacunar stroke',
            'Lower target showed non-significant 19% reduction in recurrent stroke',
            'Significant 63% reduction in ICH with lower target',
            'AHA/ASA now recommends target <130/80 mmHg for secondary stroke prevention',
            'SPS3 antiplatelet arm: dual antiplatelet (ASA + clopidogrel) did NOT reduce recurrence vs ASA alone',
            'Dual antiplatelet INCREASED major bleeding and all-cause mortality in the long term',
            'Conclusion: for lacunar stroke, aggressive BP control is key; long-term DAPT is harmful',
          ],
        ),
        TableBlock(
          title: 'CREST Trial: Carotid Stenting vs Endarterectomy',
          columns: ['Feature', 'CEA (Endarterectomy)', 'CAS (Stenting)'],
          rows: [
            ['Primary composite endpoint', 'Similar overall', 'Similar overall'],
            ['Periprocedural stroke risk', 'Lower (2.3%)', 'Higher (4.1%)'],
            ['Periprocedural MI risk', 'Higher (2.3%)', 'Lower (1.1%)'],
            ['Age <70', 'Similar outcomes', 'May be preferred (lower complication rates)'],
            ['Age >70', 'Generally preferred (lower stroke risk)', 'Higher complication rates'],
            ['Restenosis at 2 years', 'Lower (~6%)', 'Higher (~6%) but usually asymptomatic'],
            ['Cranial nerve injury', '4.7% risk (marginal mandibular, vagus)', 'Essentially 0%'],
            ['Required antiplatelet', 'ASA alone acceptable', 'DAPT required periprocedurally'],
          ],
        ),
        PearlBlock(
          'Board Pearl: CEA vs CAS Age Rule',
          'The CREST trial showed that AGE is the key factor in choosing '
          'between CEA and CAS. Patients <70 years old had similar or better '
          'outcomes with stenting (CAS). Patients >70 years old had better '
          'outcomes with surgery (CEA) due to increased stroke risk with '
          'stenting in older patients, likely related to aortic arch tortuosity '
          'and atherosclerosis. Both procedures require perioperative '
          'complication rates below accepted thresholds to be beneficial.',
        ),
      ],
    ),
  ],
);
