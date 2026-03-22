import '../models/flashcard_model.dart';

class AcuteMgmtFlashcards {
  AcuteMgmtFlashcards._();

  static const List<Flashcard> cards = [
    Flashcard(
      front: 'What is the time window and dose for IV alteplase (tPA) in acute ischemic stroke?',
      back:
          'Window: within 3 hours (up to 4.5 hours in select patients).\nDose: 0.9 mg/kg, maximum 90 mg.\nAdministration: 10% as IV bolus over 1 minute, remaining 90% infused over 60 minutes.\nBP must be <185/110 before and <180/105 for 24 hours after.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the additional exclusion criteria for tPA in the 3-4.5 hour window?',
      back:
          'In the extended 3-4.5 hour window, additional exclusions include:\n1. Age >80 years\n2. NIHSS >25\n3. Taking oral anticoagulants (regardless of INR)\n4. History of BOTH prior stroke AND diabetes\nThese are based on the ECASS III trial.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the absolute contraindications to IV tPA?',
      back:
          '- Intracranial hemorrhage on CT\n- Active internal bleeding\n- Platelet count <100,000\n- INR >1.7 or PT >15 seconds\n- Heparin use within 48 hours with elevated aPTT\n- Recent intracranial/spinal surgery (3 months)\n- History of intracranial hemorrhage\n- Suspected aortic dissection\n- BP >185/110 despite treatment',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the BP management goals in acute ischemic stroke?',
      back:
          'With tPA: BP must be <185/110 before tPA; maintain <180/105 for 24 hours after.\nWithout tPA: permissive hypertension allowed up to 220/120. Treat only if >220/120 or if there is end-organ damage.\nRationale: maintain perfusion pressure to ischemic penumbra.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the key findings from the DAWN and DEFUSE 3 thrombectomy trials?',
      back:
          'DAWN (6-24 hours): thrombectomy beneficial for anterior circulation LVO with clinical-core mismatch.\nDEFUSE 3 (6-16 hours): thrombectomy beneficial with perfusion mismatch on CT perfusion or MRI.\nBoth extended the thrombectomy window beyond 6 hours using imaging selection. Standard window remains 0-6 hours without advanced imaging.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the criteria for mechanical thrombectomy?',
      back:
          '1. Anterior circulation large vessel occlusion (ICA or M1 MCA)\n2. Age >=18\n3. NIHSS >=6\n4. Pre-stroke mRS 0-1\n5. ASPECTS >=6 on CT (within 6 hours)\n6. Treatment can begin within 6 hours (up to 24 hours with favorable imaging)\n7. IV tPA should be given first if eligible (bridging therapy)',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is the ASPECTS score?',
      back:
          'Alberta Stroke Program Early CT Score. A 10-point quantitative CT score assessing early ischemic changes in the MCA territory. One point subtracted for each of 10 regions with early ischemic changes. Score of 10 = normal; <7 suggests large infarct core and worse prognosis with thrombectomy.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is permissive hypertension and why is it important in acute stroke?',
      back:
          'Permissive hypertension = allowing elevated BP (up to 220/120 in non-tPA patients) to maintain cerebral perfusion. Rationale: the ischemic penumbra depends on collateral flow driven by perfusion pressure. Aggressive BP lowering may extend the infarct by reducing flow to the penumbra.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What DVT prophylaxis is recommended after acute stroke?',
      back:
          'Intermittent pneumatic compression (IPC) devices - supported by CLOTS 3 trial.\nGraduated compression stockings are NOT recommended (CLOTS 1 and 2 showed no benefit, increased skin complications).\nSubcutaneous heparin or LMWH can be considered but balance bleeding risk.\nEarly mobilization when safe.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'When should anticoagulation be started after a cardioembolic stroke?',
      back:
          'The "1-3-6-12 day rule" is commonly used:\n- TIA: start anticoagulation day 1\n- Small stroke: day 3\n- Moderate stroke: day 6\n- Large stroke or hemorrhagic transformation: day 12-14\nExact timing varies by guidelines and clinical judgment. Repeat imaging before starting to exclude hemorrhagic transformation.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are DOACs and why are they preferred over warfarin for AF-related stroke prevention?',
      back:
          'Direct oral anticoagulants: dabigatran (direct thrombin inhibitor), rivaroxaban, apixaban, edoxaban (factor Xa inhibitors).\nAdvantages over warfarin: similar/better efficacy, lower intracranial hemorrhage risk, predictable pharmacokinetics, no routine INR monitoring, fewer food/drug interactions, rapid onset.\nContraindicated in mechanical heart valves.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is the DAPT strategy for minor stroke and high-risk TIA?',
      back:
          'Dual antiplatelet therapy: aspirin + clopidogrel started within 24 hours of minor ischemic stroke (NIHSS <=3) or high-risk TIA (ABCD2 >=4).\nDuration: 21 days (CHANCE trial).\nThen transition to single antiplatelet (clopidogrel or aspirin).\nReduces recurrent stroke risk by ~25% compared to aspirin alone.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the anticoagulant reversal agents?',
      back:
          'Warfarin: 4-factor PCC (rapid) + IV vitamin K 10 mg (sustained)\nDabigatran: idarucizumab (Praxbind)\nFactor Xa inhibitors (rivaroxaban, apixaban): andexanet alfa (Andexxa); 4-factor PCC if andexanet unavailable\nHeparin: protamine sulfate\nLMWH: protamine (partial reversal)',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'When is carotid endarterectomy (CEA) indicated?',
      back:
          'Symptomatic stenosis 70-99%: clearly beneficial (NASCET NNT ~6)\nSymptomatic stenosis 50-69%: moderate benefit\nSymptomatic stenosis <50%: not beneficial\nAsymptomatic stenosis >=60-70%: may benefit if perioperative complication rate <3%\nTiming: within 2 weeks of symptomatic event for maximum benefit\n100% occlusion: not a surgical candidate',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is the ICH Score and what does it predict?',
      back:
          'A clinical grading scale predicting 30-day mortality in intracerebral hemorrhage.\nComponents (total 0-6):\n- GCS 3-4 (2 pts), 5-12 (1 pt), 13-15 (0 pts)\n- ICH volume >=30 mL (1 pt)\n- Intraventricular hemorrhage (1 pt)\n- Infratentorial origin (1 pt)\n- Age >=80 (1 pt)\nICH Score 0 = 0% mortality; Score 5 = ~100% mortality',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the indications for surgical evacuation of intracerebral hemorrhage?',
      back:
          'Clear indication: cerebellar hemorrhage >3 cm with brainstem compression or hydrocephalus.\nConsider: lobar hemorrhage >30 mL within 1 cm of cortical surface causing deterioration.\nGenerally NOT surgical: deep hemorrhages (putamen, thalamus), small hemorrhages without deterioration, comatose patients with bilateral fixed pupils.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is decompressive hemicraniectomy for malignant MCA infarction?',
      back:
          'Surgical removal of a large bone flap and opening of the dura to accommodate brain swelling in massive MCA territory infarction.\nBest evidence: age 18-60, surgery within 48 hours.\nReduces mortality from ~80% to ~30%.\nSurvivors often have moderate-severe disability (mRS 3-4).\nTrials: DECIMAL, DESTINY, HAMLET.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is the target blood glucose in acute stroke?',
      back:
          'Target: 140-180 mg/dL.\nHyperglycemia (>180 mg/dL) increases infarct volume, hemorrhagic transformation risk, and worsens outcomes.\nHypoglycemia (<60 mg/dL) can mimic stroke and cause neuronal injury.\nTreat with insulin infusion if persistently elevated. Avoid dextrose-containing fluids unless hypoglycemic.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What is the role of dysphagia screening in acute stroke?',
      back:
          'All stroke patients should have a swallowing screen BEFORE any oral intake (food, liquid, or medications).\nFailed screen or high-risk patients: NPO and refer for formal evaluation (VFSS or FEES).\nAspiration pneumonia is a leading cause of death in the first 30 days after stroke.\nSilent aspiration (no cough) occurs in 40-70% of dysphagic stroke patients.',
      moduleId: 'acute_mgmt',
    ),
    Flashcard(
      front: 'What are the key components of an acute stroke protocol?',
      back:
          '1. Activate stroke team / code stroke\n2. ABCs, vitals, IV access, labs (glucose, CBC, coagulation, troponin)\n3. Non-contrast CT head (rule out hemorrhage) - door to CT <25 min\n4. Calculate NIHSS\n5. Determine tPA eligibility - door to needle <60 min\n6. CT angiography if LVO suspected\n7. Consider thrombectomy if LVO confirmed\n8. Admit to stroke unit / ICU\n9. Dysphagia screen before oral intake\n10. DVT prophylaxis, secondary prevention workup',
      moduleId: 'acute_mgmt',
    ),
  ];
}
