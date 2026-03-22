import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData dysphagiaContent = TopicData(
  id: 'dysphagia',
  title: 'Dysphagia After Stroke',
  tabs: [
    // ── Tab 1: Overview ──
    TopicTab(
      title: 'Overview',
      blocks: [
        HeaderBlock('Dysphagia After Stroke — Overview'),
        TextBlock(
          'Dysphagia (difficulty swallowing) affects 25-65% of acute stroke '
          'patients and is a major cause of aspiration pneumonia, malnutrition, '
          'and death. Prevalence varies by stroke location: brainstem strokes '
          'have the highest rate (67%), followed by left hemisphere (28%) and '
          'right hemisphere (21%). Early screening and intervention are critical.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Epidemiology',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            '25-65% of acute stroke patients have dysphagia',
            'Brainstem stroke: ~67% prevalence (highest risk)',
            'Left hemisphere stroke: ~28% prevalence',
            'Right hemisphere stroke: ~21% prevalence',
            'Bilateral hemispheric strokes: high risk for persistent dysphagia',
            'Most hemispheric dysphagia resolves within 2-4 weeks',
            'Brainstem dysphagia may be prolonged or permanent',
          ],
        ),
        BulletCardBlock(
          title: 'Consequences of Dysphagia',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Aspiration pneumonia — leading cause of death in subacute stroke',
            'Malnutrition and dehydration',
            'Increased length of stay and healthcare costs',
            'Reduced quality of life',
            'Delayed rehabilitation participation',
            'Social isolation due to mealtime difficulties',
          ],
        ),
        PearlBlock(
          'Silent Aspiration',
          'Aspiration is MISSED in 40-60% of patients on bedside clinical '
          'examination alone because they silently aspirate — food or liquid '
          'enters the airway below the vocal cords without triggering a cough '
          'reflex. This is why instrumental evaluation (VFSS or FEES) is '
          'essential in patients with suspected dysphagia. Silent aspiration '
          'is more common with brainstem and bilateral strokes.',
        ),
        PearlBlock(
          'Aspiration vs Aspiration Pneumonia',
          'Not all aspiration leads to pneumonia. Risk factors for aspiration '
          'pneumonia include: poor oral hygiene (colonized oral secretions), '
          'tube feeding (does NOT eliminate aspiration risk), impaired '
          'consciousness, reduced cough reflex, immune compromise, and '
          'volume/chronicity of aspiration. Good oral care is one of the '
          'most effective preventive measures.',
        ),
        ComparisonCardBlock(
          title: 'Aspiration Pneumonia vs Aspiration Pneumonitis',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.compare_arrows,
          description:
              'These two conditions are frequently confused but have different '
              'pathophysiology, presentation, and management.',
          keyPoints: [
            'Aspiration PNEUMONIA: infection caused by aspiration of colonized oropharyngeal secretions or contaminated material',
            'Pneumonia develops over hours to days with fever, productive cough, infiltrate on imaging',
            'Organisms: anaerobes, gram-negative rods, Staphylococcus — treat with antibiotics',
            'Risk factors: poor oral hygiene, dysphagia, impaired consciousness, tube feeding',
            'Aspiration PNEUMONITIS: chemical injury from aspiration of sterile gastric contents (acid)',
            'Pneumonitis is acute (within hours), with inflammatory response but NOT initially infectious',
            'May resolve spontaneously or progress to ARDS; antibiotics not initially needed',
            'Mendelson syndrome is the classic aspiration pneumonitis from gastric acid aspiration',
          ],
        ),
        TableBlock(
          title: 'Cranial Nerves Essential for Swallowing',
          columns: ['Cranial Nerve', 'Name', 'Role in Swallowing'],
          rows: [
            ['CN V', 'Trigeminal', 'Motor: muscles of mastication (temporalis, masseter, pterygoids). Sensory: oral cavity sensation, palate'],
            ['CN VII', 'Facial', 'Lip closure (orbicularis oris), buccal tone (buccinator) — prevents food pocketing in cheeks'],
            ['CN IX', 'Glossopharyngeal', 'Pharyngeal sensation (gag reflex afferent), taste posterior 1/3 tongue, stylopharyngeus muscle elevates pharynx'],
            ['CN X', 'Vagus', 'Soft palate elevation (levator veli palatini), pharyngeal constrictors, laryngeal elevation, vocal cord closure, UES relaxation, esophageal peristalsis'],
            ['CN XII', 'Hypoglossal', 'All intrinsic and most extrinsic tongue muscles — tongue manipulation, bolus formation, posterior propulsion'],
          ],
        ),
        PearlBlock(
          'Nucleus Ambiguus — The Swallowing Center',
          'The nucleus ambiguus in the lateral medulla contains motor neurons '
          'of CN IX and X that control pharyngeal and laryngeal muscles. It is '
          'the critical brainstem center for the pharyngeal swallow reflex. '
          'Lateral medullary (Wallenberg) syndrome damages this nucleus, '
          'causing severe dysphagia with ipsilateral pharyngeal weakness, '
          'vocal cord paralysis, and absent gag reflex. This is why lateral '
          'medullary strokes produce the most severe and persistent dysphagia '
          'of any stroke type.',
        ),
      ],
    ),

    // ── Tab 2: Diagnosis ──
    TopicTab(
      title: 'Diagnosis',
      blocks: [
        HeaderBlock('Diagnostic Evaluation of Dysphagia'),
        TextBlock(
          'Dysphagia evaluation begins with bedside screening, followed by '
          'instrumental assessment when clinically indicated. The goal is to '
          'identify aspiration risk, determine the phase of swallowing affected, '
          'and guide diet and treatment recommendations.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Bedside Swallowing Evaluation (BSE)',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.medical_services,
          description:
              'Clinical assessment performed by a speech-language pathologist '
              'at the bedside. First-line screening for dysphagia.',
          keyPoints: [
            'Assess level of consciousness and cognition',
            'Oral motor examination (lip, tongue, palate function)',
            'Trial swallows with various consistencies',
            'Observe for cough, wet/gurgly voice, delayed swallow',
            'Check laryngeal elevation by palpation',
            'Sensitivity for aspiration: only 40-60% (misses silent aspiration)',
            '3-oz water swallow test is a common screening protocol',
            'Cannot visualize pharyngeal phase directly',
          ],
        ),
        ComparisonCardBlock(
          title: 'Videofluoroscopic Swallow Study (VFSS)',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.videocam,
          description:
              'Modified barium swallow — real-time fluoroscopic imaging of '
              'swallowing with barium-coated food and liquid.',
          keyPoints: [
            'GOLD STANDARD for dysphagia evaluation',
            'Visualizes all 4 phases of swallowing',
            'Detects aspiration and penetration with timing',
            'Tests compensatory strategies in real time (chin tuck, head turn)',
            'Evaluates multiple consistencies (thin liquid, nectar, puree, solid)',
            'Radiation exposure is a limitation',
            'Requires patient transport to radiology',
            'Uses Penetration-Aspiration Scale (PAS) for grading',
          ],
        ),
        ComparisonCardBlock(
          title: 'Fiberoptic Endoscopic Evaluation of Swallowing (FEES)',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.camera,
          description:
              'Flexible nasopharyngoscope passed transnasally to observe '
              'pharyngeal and laryngeal structures during swallowing.',
          keyPoints: [
            'Portable — can be done at bedside (ICU, nursing home)',
            'No radiation exposure',
            'Excellent for laryngeal examination',
            'Can assess secretion management',
            'Detects aspiration and penetration',
            'CANNOT visualize oral phase or moment of swallow (white-out)',
            'Complements VFSS — each has unique advantages',
            'Useful for patients who cannot travel to radiology',
          ],
        ),
        TableBlock(
          title: 'VFSS vs FEES Comparison',
          columns: ['Feature', 'VFSS', 'FEES'],
          rows: [
            ['Gold standard', 'Yes', 'No (complementary)'],
            ['Oral phase', 'Visualized', 'Not visualized'],
            ['Pharyngeal phase', 'Visualized', 'Partially (white-out)'],
            ['Aspiration detection', 'Excellent', 'Good'],
            ['Radiation', 'Yes', 'No'],
            ['Portability', 'Requires radiology suite', 'Bedside capable'],
            ['Secretion assessment', 'Limited', 'Excellent'],
            ['Repeat testing', 'Radiation concern', 'No limit'],
          ],
        ),
        PearlBlock(
          'VFSS Is the Gold Standard',
          'VFSS (modified barium swallow) is the GOLD STANDARD for dysphagia '
          'evaluation because it visualizes ALL phases of swallowing in real '
          'time and allows testing of compensatory strategies. FEES is an '
          'excellent complement, especially when bedside evaluation is needed '
          'or for laryngeal assessment, but has a "white-out" period during '
          'the pharyngeal swallow.',
        ),
        ScaleBlock(
          scaleName: 'Penetration-Aspiration Scale (Rosenbek PAS)',
          description:
              'An 8-point ordinal scale used during VFSS or FEES to grade the '
              'severity of airway invasion. The most widely used scale for '
              'quantifying penetration and aspiration severity.',
          columns: ['Score', 'Description'],
          rows: [
            ['1', 'Material does not enter the airway'],
            ['2', 'Material enters the airway, remains above the vocal folds, and is ejected'],
            ['3', 'Material enters the airway, remains above the vocal folds, and is NOT ejected'],
            ['4', 'Material contacts the vocal folds and is ejected'],
            ['5', 'Material contacts the vocal folds and is NOT ejected'],
            ['6', 'Material passes below the vocal folds and is ejected into the airway or out of the airway'],
            ['7', 'Material passes below the vocal folds and is NOT ejected despite effort'],
            ['8', 'Material passes below the vocal folds and NO effort is made to eject (SILENT ASPIRATION)'],
          ],
          boardPearl:
              'PAS 1 = normal. PAS 2-5 = penetration (material above or at vocal folds). '
              'PAS 6-8 = aspiration (material below vocal folds). PAS 8 = silent aspiration '
              '(most dangerous — no cough reflex). Silent aspiration (PAS 8) carries the '
              'highest risk of aspiration pneumonia because the patient has no protective response.',
        ),
        BulletCardBlock(
          title: 'Vallecular & Pyriform Sinus Residue Patterns',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Vallecular residue: food pools in the space between tongue base and epiglottis',
            'Indicates reduced tongue base retraction or poor bolus propulsion',
            'Treatment: effortful swallow, chin tuck, tongue base exercises',
            'Pyriform sinus residue: food pools in the recesses lateral to the larynx',
            'Indicates reduced pharyngeal contraction, impaired laryngeal elevation, or cricopharyngeal dysfunction',
            'Unilateral pyriform residue suggests unilateral pharyngeal weakness — head turn toward weak side',
            'Bilateral pyriform residue suggests global pharyngeal weakness or UES dysfunction',
            'Treatment: Mendelsohn maneuver, head rotation, Shaker exercise',
            'Residue increases aspiration risk on subsequent swallows (post-swallow aspiration)',
          ],
        ),
      ],
    ),

    // ── Tab 3: Swallowing Phases ──
    TopicTab(
      title: 'Swallowing Phases',
      blocks: [
        HeaderBlock('Four Phases of Swallowing'),
        TextBlock(
          'Normal swallowing is divided into four sequential phases. '
          'Understanding each phase is essential for localizing the swallowing '
          'deficit and guiding treatment. Different stroke locations affect '
          'different phases of the swallow.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Phase 1: Oral Preparatory Phase',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.restaurant,
          description:
              'Food is placed in the mouth, masticated, and formed into a '
              'cohesive bolus mixed with saliva. Entirely voluntary.',
          keyPoints: [
            'Voluntary phase — under cortical control',
            'Lip closure to prevent anterior spillage',
            'Mastication (CN V — trigeminal motor)',
            'Tongue manipulation to mix bolus with saliva (CN XII)',
            'Buccal tension to keep food from pocketing in cheeks (CN VII)',
            'Deficits: drooling, pocketing food, poor bolus formation',
            'Affected by facial weakness, tongue weakness, dental status',
          ],
        ),
        ComparisonCardBlock(
          title: 'Phase 2: Oral (Propulsive/Transit) Phase',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.arrow_forward,
          description:
              'The tongue propels the bolus posteriorly from the oral cavity '
              'to the pharynx. Initiates the pharyngeal swallow reflex.',
          keyPoints: [
            'Voluntary phase — last voluntary phase of swallowing',
            'Tongue tip elevates and presses against hard palate',
            'Sequential posterior tongue stripping motion',
            'Duration: approximately 1 second',
            'Triggers pharyngeal swallow at anterior faucial arches',
            'Deficits: prolonged oral transit time, premature spillage',
            'Affected by tongue weakness (CN XII lesions)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Phase 3: Pharyngeal Phase',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.swap_vert,
          description:
              'The bolus is propelled through the pharynx into the esophagus. '
              'This is the most critical phase for airway protection.',
          keyPoints: [
            'INVOLUNTARY (reflexive) phase',
            'Soft palate elevation closes nasopharynx (CN X — vagus)',
            'Laryngeal elevation and epiglottic deflection close airway',
            'Vocal cord adduction provides second layer of airway protection',
            'Pharyngeal peristalsis (CN IX, X — pharyngeal constrictors)',
            'Upper esophageal sphincter (cricopharyngeus) opens',
            'Duration: approximately 1 second',
            'Aspiration occurs when this phase fails',
            'Most commonly affected phase in brainstem strokes',
          ],
        ),
        ComparisonCardBlock(
          title: 'Phase 4: Esophageal Phase',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.south,
          description:
              'Peristaltic waves propel the bolus through the esophagus to the '
              'stomach. Entirely involuntary and not typically affected by stroke.',
          keyPoints: [
            'Involuntary phase — controlled by esophageal plexus (CN X)',
            'Primary and secondary peristaltic waves',
            'Lower esophageal sphincter relaxes to allow passage',
            'Duration: 8-20 seconds',
            'Rarely affected by stroke directly',
            'Deficits suggest structural/motility disorder, not stroke',
            'Evaluation: barium swallow, esophageal manometry',
          ],
        ),
        PearlBlock(
          'Cranial Nerves in Swallowing',
          'Key cranial nerves for swallowing: CN V (mastication), CN VII '
          '(lip closure, buccal tone), CN IX (pharyngeal sensation, gag reflex), '
          'CN X (laryngeal elevation, vocal cord closure, pharyngeal peristalsis, '
          'UES relaxation), CN XII (tongue movement). Nucleus ambiguus (CN IX, X) '
          'in the medulla is the critical brainstem center for the pharyngeal '
          'swallow. Lesions here cause the most severe dysphagia.',
        ),
        HeaderBlock('Pharyngeal Phase — Detailed Airway Protection Sequence'),
        BulletCardBlock(
          title: 'Sequential Events in the Pharyngeal Swallow',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            '1. Soft palate elevation — closes nasopharynx to prevent nasal regurgitation (velopharyngeal closure)',
            '2. Hyoid bone and larynx elevate anteriorly and superiorly (suprahyoid muscles pull hyoid up and forward)',
            '3. Epiglottic inversion — epiglottis deflects posteriorly and inferiorly to cover laryngeal inlet',
            '4. Vocal fold adduction (true and false cords close) — second layer of airway protection',
            '5. Arytenoid cartilages tilt forward to contact epiglottic base — third layer of closure',
            '6. Pharyngeal peristalsis (sequential contraction of superior, middle, and inferior pharyngeal constrictors)',
            '7. Cricopharyngeal relaxation — upper esophageal sphincter (UES) opens via muscle relaxation AND mechanical pull from hyolaryngeal excursion',
            '8. Bolus enters the esophagus; UES closes behind it',
          ],
        ),
        PearlBlock(
          'Three Layers of Airway Protection',
          'The airway is protected during swallowing by THREE layers: '
          '(1) Epiglottic inversion over the laryngeal inlet, '
          '(2) True vocal fold adduction (closure), and '
          '(3) False vocal fold and arytenoid approximation. '
          'If any single layer fails, the others may still prevent aspiration. '
          'When multiple layers fail (as in severe brainstem stroke), aspiration '
          'risk is extremely high. Laryngeal elevation is the driving force — '
          'without adequate hyolaryngeal excursion, the epiglottis cannot '
          'invert properly, and the UES cannot open adequately.',
        ),
        ComparisonCardBlock(
          title: 'Tracheostomy and Swallowing',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.air,
          description:
              'Tracheostomy tubes significantly impact swallowing mechanics. '
              'Understanding these effects is critical for dysphagia management '
              'in tracheostomized patients.',
          keyPoints: [
            'Tracheostomy tethers the larynx, reducing hyolaryngeal elevation',
            'Inflated cuff does NOT reliably prevent aspiration (material can pass around the cuff)',
            'Inflated cuff eliminates subglottic air pressure, impairing cough and sensation',
            'Deflating the cuff restores subglottic air pressure and improves swallowing',
            'Passy-Muir speaking valve (PMV): one-way valve allows air IN through trach, OUT through upper airway',
            'PMV restores subglottic pressure, improves swallow coordination, enables phonation',
            'PMV requires cuff FULLY DEFLATED — air must exit through the upper airway',
            'NEVER place PMV with cuff inflated — creates a closed system and respiratory distress',
            'Above-cuff vocalization: fenestrated tube or cuff deflation allows some phonation without PMV',
          ],
        ),
      ],
    ),

    // ── Tab 4: Management ──
    TopicTab(
      title: 'Management',
      blocks: [
        HeaderBlock('Dysphagia Management'),
        TextBlock(
          'Management of dysphagia involves a combination of compensatory '
          'strategies, rehabilitative exercises, and diet modifications. '
          'The goal is to maintain safe oral nutrition while rehabilitating '
          'swallowing function. NPO with alternative feeding may be necessary '
          'when aspiration risk is too high.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Compensatory Strategies',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Chin tuck (chin down) — narrows airway entrance, widens valleculae, reduces aspiration',
            'Head rotation toward weak side — closes affected pyriform sinus, directs bolus to stronger side',
            'Head tilt toward strong side — uses gravity to direct bolus to stronger pharynx',
            'Supraglottic swallow — voluntary breath hold before and during swallow, cough after',
            'Super-supraglottic swallow — effortful breath hold, bear down, swallow, cough',
            'Effortful swallow — squeeze hard with tongue during swallow to increase pharyngeal pressure',
            'Multiple swallows — clear residue with repeat swallows',
            'Alternating liquids and solids — wash down pharyngeal residue',
          ],
        ),
        PearlBlock(
          'Chin Tuck — Most Commonly Tested Strategy',
          'The chin tuck posture is the most commonly used and tested '
          'compensatory strategy. Mechanism: the chin tuck pushes the tongue '
          'base posteriorly, narrows the laryngeal vestibule, and widens the '
          'valleculae (increasing the "catch" space above the airway). '
          'It is most effective for delayed pharyngeal swallow trigger and '
          'reduced tongue base retraction. Note: chin tuck is NOT effective '
          'for all patients and should be tested under VFSS.',
        ),
        BulletCardBlock(
          title: 'Diet Modification (IDDSI Framework)',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Level 0: Thin liquids (water, juice, coffee)',
            'Level 1: Slightly thick',
            'Level 2: Mildly thick (nectar-thick)',
            'Level 3: Moderately thick (honey-thick) / Liquidized food',
            'Level 4: Extremely thick / Pureed food',
            'Level 5: Minced and moist',
            'Level 6: Soft and bite-sized',
            'Level 7: Regular/easy to chew',
            'Thickened liquids slow bolus transit but may reduce compliance and hydration',
          ],
        ),
        ScaleBlock(
          scaleName: 'IDDSI Framework — International Dysphagia Diet Standardisation Initiative',
          description:
              'A globally standardized framework using numbered levels (0-7) with '
              'color coding for drinks (levels 0-4) and foods (levels 3-7). '
              'Levels 3 and 4 overlap between drinks and foods. Replaces older '
              'terminology (NDD Level 1-3, honey-thick, nectar-thick).',
          columns: ['Level', 'Drinks', 'Foods', 'Testing Method'],
          rows: [
            ['0 (Thin)', 'Water, tea, juice', '—', 'Flows through prongs of fork'],
            ['1 (Slightly Thick)', 'Thicker than water, flows through fork', '—', 'Flows through fork prongs slowly'],
            ['2 (Mildly Thick)', 'Sippable, drips slowly through fork', '—', 'Drips slowly off fork in drizzle'],
            ['3 (Moderately Thick / Liquidized)', 'Cannot drink from cup, needs spoon', 'Smooth puree, no lumps', 'Does not drip through fork; cannot be sucked through straw'],
            ['4 (Extremely Thick / Pureed)', 'Cannot be sucked through straw', 'No lumps, not sticky, falls off spoon', 'Sits in a pile on fork, does not flow off'],
            ['5 (Minced & Moist)', '—', 'Small lumps, 4mm pieces, can be mashed with fork', 'Pieces visible, easily mashed between fingers'],
            ['6 (Soft & Bite-Sized)', '—', '1.5 cm pieces, soft enough to mash with fork', 'Can be scooped and shaped on plate with fork'],
            ['7 (Regular)', '—', 'Normal everyday foods', 'No specific test — any method of eating'],
          ],
          boardPearl:
              'IDDSI replaces the older National Dysphagia Diet (NDD) system. Key change: '
              'standardized testing methods (fork drip test, spoon tilt test) provide objective '
              'measurement rather than subjective descriptions. IDDSI is now the international '
              'standard adopted by most English-speaking countries. Levels 3-4 bridge drinks '
              'and foods because textures at these levels can serve as either.',
        ),
        BulletCardBlock(
          title: 'Rehabilitative Exercises',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Mendelsohn maneuver — voluntarily maintain laryngeal elevation at peak of swallow',
            'Shaker exercise (head-lift) — strengthen suprahyoid muscles, improve UES opening',
            'Lee Silverman Voice Treatment (LSVT) — increase effort/loudness to improve swallow force',
            'Tongue strengthening exercises — resistance exercises for tongue',
            'Expiratory muscle strength training (EMST)',
            'McNeill Dysphagia Therapy Program — systematic exercise approach',
          ],
        ),
        TableBlock(
          title: 'Evidence for Swallowing Exercises',
          columns: ['Exercise', 'Mechanism', 'Target Deficit', 'Evidence Level'],
          rows: [
            [
              'Mendelsohn Maneuver',
              'Patient voluntarily holds larynx at highest point during swallow — prolongs UES opening duration and laryngeal elevation',
              'Reduced UES opening, reduced laryngeal elevation',
              'Moderate evidence — improves UES opening duration and hyoid excursion on VFSS',
            ],
            [
              'Effortful Swallow',
              'Patient squeezes all swallowing muscles as hard as possible during the swallow — increases tongue base pressure against posterior pharyngeal wall',
              'Reduced tongue base retraction, vallecular residue',
              'Moderate evidence — increases pharyngeal pressure and reduces residue',
            ],
            [
              'Shaker Exercise (Head Lift)',
              'Supine head raises (isometric hold + isotonic repetitions) — strengthens suprahyoid muscles that open the UES',
              'Reduced UES opening, pyriform sinus residue',
              'Strong evidence — RCT showed significant improvement in UES opening and reduced aspiration',
            ],
            [
              'EMST (Expiratory Muscle Strength Training)',
              'Forceful exhalation against a pressure threshold device — strengthens expiratory and suprahyoid muscles',
              'Weak cough, reduced hyolaryngeal excursion',
              'Moderate evidence — improves cough strength, penetration-aspiration scores, and hyoid movement',
            ],
            [
              'Masako Maneuver (Tongue Hold)',
              'Swallow while holding tongue tip between teeth — forces posterior pharyngeal wall to compensate',
              'Reduced pharyngeal wall contraction',
              'Limited evidence — may cause fatigue; use with caution, practice WITHOUT food',
            ],
          ],
        ),
        ComparisonCardBlock(
          title: 'Neuromuscular Electrical Stimulation (NMES / VitalStim)',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          icon: Icons.electrical_services,
          description:
              'Transcutaneous electrical stimulation applied to anterior neck '
              'muscles to augment swallowing. FDA-cleared but controversial.',
          keyPoints: [
            'VitalStim is the most common brand — surface electrodes on anterior neck',
            'Theory: electrical stimulation strengthens or re-educates swallowing muscles',
            'Electrode placement is critical — incorrect placement may PULL larynx DOWN, worsening aspiration',
            'Evidence is MIXED and CONTROVERSIAL — some studies show benefit, others show no difference from traditional therapy',
            'Cochrane review: insufficient evidence to support or refute NMES for dysphagia',
            'Should NOT be used as a standalone treatment — best as adjunct to traditional therapy',
            'Contraindications: cardiac pacemaker, anterior neck malignancy, cervical hardware',
            'Board answer: evidence is inconclusive; traditional swallowing therapy remains the standard of care',
          ],
        ),
        TableBlock(
          title: 'Compensatory Technique by Deficit',
          columns: ['Swallowing Deficit', 'Recommended Strategy'],
          rows: [
            ['Delayed pharyngeal trigger', 'Chin tuck, thermal-tactile stimulation'],
            ['Reduced tongue base retraction', 'Chin tuck, effortful swallow'],
            [
              'Unilateral pharyngeal weakness',
              'Head rotation toward weak side',
            ],
            ['Reduced laryngeal closure', 'Supraglottic swallow, chin tuck'],
            ['Reduced UES opening', 'Mendelsohn maneuver, Shaker exercise'],
            ['Oral phase dysfunction', 'Head tilt toward strong side, modified diet'],
          ],
        ),
        BulletCardBlock(
          title: 'Alternative Feeding',
          themeColor: Color(0xFF9333EA),
          backgroundColor: Color(0xFFF5F3FF),
          points: [
            'Nasogastric (NG) tube — short-term (< 4 weeks)',
            'PEG (percutaneous endoscopic gastrostomy) — if NPO expected > 4 weeks',
            'PEG does NOT prevent aspiration (patients still aspirate secretions)',
            'PEG does NOT prevent aspiration pneumonia — good oral care still essential',
            'Feeding jejunostomy (PEJ) — if severe reflux or aspiration of gastric contents',
            'IV fluids/TPN — temporary bridge, not long-term solution',
            'Decision for PEG should be multidisciplinary and patient-centered',
          ],
        ),
        TableBlock(
          title: 'Tube Feeding Comparison — NG vs PEG vs PEJ',
          columns: ['Feature', 'NG Tube', 'PEG', 'PEJ'],
          rows: [
            ['Placement', 'Bedside, no sedation', 'Endoscopic, mild sedation', 'Endoscopic or surgical'],
            ['Timing', 'Immediate, short-term (<4 weeks)', 'When NPO expected >4 weeks', 'When gastric feeding fails/contraindicated'],
            ['Indications', 'Acute dysphagia, temporary NPO', 'Prolonged dysphagia, chronic neurologic conditions', 'Severe GERD, gastroparesis, recurrent aspiration of gastric contents'],
            ['Aspiration risk', 'Present — reflux and oral secretions', 'Present — oral secretions and reflux', 'Lower — post-pyloric feeding reduces reflux-related aspiration'],
            ['Complications', 'Nasal irritation, sinusitis, tube displacement, aspiration', 'Wound infection (5-25%), tube leakage, buried bumper, peritonitis', 'Tube migration, clogging (small bore), diarrhea, dumping syndrome'],
            ['Patient tolerance', 'Poor — nasal discomfort, socially visible', 'Better — can be hidden under clothing', 'Similar to PEG but may cause more GI symptoms'],
            ['Self-removal risk', 'High — easily pulled out', 'Low — secured endoscopically', 'Moderate'],
            ['FOOD Trial evidence', 'NG preferred in first 2-4 weeks', 'No benefit over NG in early stroke', 'Limited stroke-specific evidence'],
          ],
        ),
        PearlBlock(
          'PEG Tubes Do NOT Prevent Aspiration',
          'A very common misconception: PEG tubes do NOT prevent aspiration or '
          'aspiration pneumonia. Patients still aspirate their own oral '
          'secretions and can aspirate refluxed gastric contents. In fact, '
          'some studies suggest PEG-fed patients may have HIGHER aspiration '
          'pneumonia rates. Good oral hygiene is the single most important '
          'intervention to reduce aspiration pneumonia regardless of feeding '
          'method.',
        ),
      ],
    ),
  ],
);
