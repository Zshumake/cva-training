import 'package:flutter/material.dart';
import '../core/models/quiz_model.dart';
import '../core/theme/app_theme.dart';
import 'models/flashcard_model.dart';
import 'models/topic_content_model.dart';

// Module content imports
import 'module_contents/stroke_fundamentals_content.dart';
import 'module_contents/vascular_anatomy_content.dart';
import 'module_contents/ischemic_stroke_content.dart';
import 'module_contents/stroke_syndromes_content.dart';
import 'module_contents/hemorrhagic_stroke_content.dart';
import 'module_contents/diagnostic_studies_content.dart';
import 'module_contents/acute_management_content.dart';
import 'module_contents/stroke_pharmacology_content.dart';
import 'module_contents/motor_recovery_content.dart';
import 'module_contents/spasticity_shoulder_content.dart';
import 'module_contents/dysphagia_content.dart';
import 'module_contents/cognition_communication_content.dart';
import 'module_contents/medical_complications_content.dart';
import 'module_contents/outcomes_continuum_content.dart';

// Quiz bank imports
import 'quiz_banks/stroke_fundamentals_quiz.dart';
import 'quiz_banks/vascular_anatomy_quiz.dart';
import 'quiz_banks/ischemic_stroke_quiz.dart';
import 'quiz_banks/stroke_syndromes_quiz.dart';
import 'quiz_banks/hemorrhagic_stroke_quiz.dart';
import 'quiz_banks/diagnostic_studies_quiz.dart';
import 'quiz_banks/acute_management_quiz.dart';
import 'quiz_banks/stroke_pharmacology_quiz.dart';
import 'quiz_banks/motor_recovery_quiz.dart';
import 'quiz_banks/spasticity_shoulder_quiz.dart';
import 'quiz_banks/dysphagia_quiz.dart';
import 'quiz_banks/cognition_communication_quiz.dart';
import 'quiz_banks/medical_complications_quiz.dart';
import 'quiz_banks/outcomes_continuum_quiz.dart';

// Flashcard bank imports
import 'quiz_banks/stroke_fundamentals_flashcards.dart';
import 'quiz_banks/vascular_anatomy_flashcards.dart';
import 'quiz_banks/ischemic_stroke_flashcards.dart';
import 'quiz_banks/stroke_syndromes_flashcards.dart';
import 'quiz_banks/hemorrhagic_stroke_flashcards.dart';
import 'quiz_banks/diagnostic_studies_flashcards.dart';
import 'quiz_banks/acute_management_flashcards.dart';
import 'quiz_banks/stroke_pharmacology_flashcards.dart';
import 'quiz_banks/motor_recovery_flashcards.dart';
import 'quiz_banks/spasticity_shoulder_flashcards.dart';
import 'quiz_banks/dysphagia_flashcards.dart';
import 'quiz_banks/cognition_communication_flashcards.dart';
import 'quiz_banks/medical_complications_flashcards.dart';
import 'quiz_banks/outcomes_continuum_flashcards.dart';

class ModuleEntry {
  final String id;
  final String title;
  final String description;
  final List<String> highlights;
  final Color color;
  final IconData icon;
  final TopicData Function() topicDataFactory;
  final List<QuizQuestion> Function() quizQuestions;
  final List<Flashcard> Function() flashcards;
  final String? podcastAssetPath;
  final String? podcastTitle;

  const ModuleEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.highlights,
    required this.color,
    required this.icon,
    required this.topicDataFactory,
    required this.quizQuestions,
    required this.flashcards,
    this.podcastAssetPath,
    this.podcastTitle,
  });

  bool get hasPodcast => podcastAssetPath != null;
  int get quizCount => quizQuestions().length;
  int get flashcardCount => flashcards().length;
}

class ModuleRegistry {
  ModuleRegistry._();

  static final List<ModuleEntry> modules = [
    ModuleEntry(
      id: 'stroke-fundamentals',
      title: 'Stroke Fundamentals',
      description:
          'Definition, epidemiology, risk factors, and the landscape of cerebrovascular disease.',
      highlights: ['Epidemiology', 'Risk factors', 'TIA'],
      color: AppTheme.fundamentalsColor,
      icon: Icons.menu_book_rounded,
      topicDataFactory: () => strokeFundamentalsContent,
      quizQuestions: () => StrokeFundamentalsQuiz.questions,
      flashcards: () => StrokeFundamentalsFlashcards.cards,
      podcastAssetPath: 'assets/audio/stroke_fundamentals_podcast.m4a',
      podcastTitle: 'Stroke Fundamentals Board Review',
    ),
    ModuleEntry(
      id: 'vascular-anatomy',
      title: 'Vascular Anatomy & Circle of Willis',
      description:
          'Cerebral circulation, Circle of Willis, vascular territories, and CSF circulation.',
      highlights: ['Circle of Willis', 'Vascular territories', 'CSF'],
      color: AppTheme.vascularColor,
      icon: Icons.account_tree_rounded,
      topicDataFactory: () => vascularAnatomyContent,
      quizQuestions: () => VascularAnatomyQuiz.questions,
      flashcards: () => VascularAnatomyFlashcards.cards,
      podcastAssetPath: 'assets/audio/vascular_anatomy_podcast.m4a',
      podcastTitle: 'Vascular Anatomy Board Review',
    ),
    ModuleEntry(
      id: 'ischemic-stroke',
      title: 'Ischemic Stroke Types',
      description:
          'Thrombotic, embolic, and lacunar strokes -- mechanisms, presentation, and differences.',
      highlights: ['Thrombotic', 'Embolic', 'Lacunar'],
      color: AppTheme.ischemicColor,
      icon: Icons.bolt_rounded,
      topicDataFactory: () => ischemicStrokeContent,
      quizQuestions: () => IschemicStrokeQuiz.questions,
      flashcards: () => IschemicStrokeFlashcards.cards,
      podcastAssetPath: 'assets/audio/ischemic_stroke_podcast.m4a',
      podcastTitle: 'Ischemic Stroke Board Review',
    ),
    ModuleEntry(
      id: 'stroke-syndromes',
      title: 'Stroke Syndromes & Localization',
      description:
          'MCA, ACA, PCA syndromes, brainstem syndromes, and vascular localization.',
      highlights: ['MCA', 'Wallenberg', 'Lacunar syndromes'],
      color: AppTheme.syndromesColor,
      icon: Icons.hub_rounded,
      topicDataFactory: () => strokeSyndromesContent,
      quizQuestions: () => StrokeSyndromesQuiz.questions,
      flashcards: () => StrokeSyndromesFlashcards.cards,
      podcastAssetPath: 'assets/audio/stroke_syndromes_podcast.m4a',
      podcastTitle: 'Stroke Syndromes Board Review',
    ),
    ModuleEntry(
      id: 'hemorrhagic-stroke',
      title: 'Hemorrhagic Stroke',
      description:
          'ICH, SAH, AVM, aneurysms, Hunt and Hess scale, and hemorrhagic management.',
      highlights: ['ICH', 'SAH', 'Hunt & Hess'],
      color: AppTheme.hemorrhagicColor,
      icon: Icons.water_drop_rounded,
      topicDataFactory: () => hemorrhagicStrokeContent,
      quizQuestions: () => HemorrhagicStrokeQuiz.questions,
      flashcards: () => HemorrhagicStrokeFlashcards.cards,
      podcastAssetPath: 'assets/audio/hemorrhagic_stroke_podcast.m4a',
      podcastTitle: 'Hemorrhagic Stroke Board Review',
    ),
    ModuleEntry(
      id: 'diagnostic-studies',
      title: 'Diagnostic Studies & Neuroimaging',
      description:
          'CT vs MRI, carotid ultrasound, angiography, echocardiography, and diagnostic workup.',
      highlights: ['CT vs MRI', 'Angiography', 'Echo'],
      color: AppTheme.diagnosticColor,
      icon: Icons.biotech_rounded,
      topicDataFactory: () => diagnosticStudiesContent,
      quizQuestions: () => DiagnosticStudiesQuiz.questions,
      flashcards: () => DiagnosticStudiesFlashcards.cards,
      podcastAssetPath: 'assets/audio/diagnostic_studies_podcast.m4a',
      podcastTitle: 'Diagnostic Studies Board Review',
    ),
    ModuleEntry(
      id: 'acute-management',
      title: 'Acute Stroke Management',
      description:
          'tPA criteria, thrombectomy, BP management, ICP, seizure management.',
      highlights: ['tPA', 'Thrombectomy', 'BP management'],
      color: AppTheme.acuteColor,
      icon: Icons.local_hospital_rounded,
      topicDataFactory: () => acuteManagementContent,
      quizQuestions: () => AcuteManagementQuiz.questions,
      flashcards: () => AcuteManagementFlashcards.cards,
      podcastAssetPath: 'assets/audio/acute_management_podcast.m4a',
      podcastTitle: 'Acute Stroke Management Board Review',
    ),
    ModuleEntry(
      id: 'stroke-pharmacology',
      title: 'Stroke Pharmacology & Prevention',
      description:
          'Anticoagulation, antiplatelets, statins, secondary prevention, and carotid surgery.',
      highlights: ['Antiplatelets', 'Anticoagulation', 'CEA'],
      color: AppTheme.pharmacologyColor,
      icon: Icons.medication_rounded,
      topicDataFactory: () => strokePharmacologyContent,
      quizQuestions: () => StrokePharmacologyQuiz.questions,
      flashcards: () => StrokePharmacologyFlashcards.cards,
      podcastAssetPath: 'assets/audio/stroke_pharmacology_podcast.m4a',
      podcastTitle: 'Stroke Pharmacology Board Review',
    ),
    ModuleEntry(
      id: 'motor-recovery',
      title: 'Motor Recovery & Rehabilitation',
      description:
          'Brunnstrom stages, Twitchell, NDT/Bobath, CIMT, FES, and recovery predictors.',
      highlights: ['Brunnstrom', 'CIMT', 'Recovery predictors'],
      color: AppTheme.motorRecoveryColor,
      icon: Icons.directions_run_rounded,
      topicDataFactory: () => motorRecoveryContent,
      quizQuestions: () => MotorRecoveryQuiz.questions,
      flashcards: () => MotorRecoveryFlashcards.cards,
      podcastAssetPath: 'assets/audio/motor_recovery_podcast.m4a',
      podcastTitle: 'Motor Recovery & Rehab Board Review',
    ),
    ModuleEntry(
      id: 'spasticity-shoulder',
      title: 'Spasticity & Shoulder Complications',
      description:
          'Spasticity management, shoulder pain, CRPS, subluxation, and heterotopic ossification.',
      highlights: ['CRPS', 'Subluxation', 'Spasticity Rx'],
      color: AppTheme.spasticityColor,
      icon: Icons.accessibility_new_rounded,
      topicDataFactory: () => spasticityShoulderContent,
      quizQuestions: () => SpasticityShoulderQuiz.questions,
      flashcards: () => SpasticityShoulderFlashcards.cards,
      podcastAssetPath: 'assets/audio/spasticity_shoulder_podcast.m4a',
      podcastTitle: 'Spasticity & Shoulder Board Review',
    ),
    ModuleEntry(
      id: 'dysphagia-nutrition',
      title: 'Dysphagia & Swallowing',
      description:
          'VFSS, FEES, aspiration, four phases of swallowing, and nutritional management.',
      highlights: ['VFSS', 'FEES', 'Aspiration'],
      color: AppTheme.dysphagiaColor,
      icon: Icons.restaurant_rounded,
      topicDataFactory: () => dysphagiaContent,
      quizQuestions: () => DysphagiaQuiz.questions,
      flashcards: () => DysphagiaFlashcards.cards,
      podcastAssetPath: 'assets/audio/dysphagia_podcast.m4a',
      podcastTitle: 'Dysphagia & Swallowing Board Review',
    ),
    ModuleEntry(
      id: 'cognition-communication',
      title: 'Cognition, Communication & Behavior',
      description:
          'Aphasia types, hemispatial neglect, apraxia, depression, and cognitive deficits.',
      highlights: ['Aphasia', 'Neglect', 'Depression'],
      color: AppTheme.cognitionColor,
      icon: Icons.psychology_rounded,
      topicDataFactory: () => cognitionCommunicationContent,
      quizQuestions: () => CognitionCommunicationQuiz.questions,
      flashcards: () => CognitionCommunicationFlashcards.cards,
      podcastAssetPath: 'assets/audio/cognition_communication_podcast.m4a',
      podcastTitle: 'Cognition & Communication Board Review',
    ),
    ModuleEntry(
      id: 'medical-complications',
      title: 'Medical Complications',
      description:
          'DVT, bladder/bowel dysfunction, cardiac disease, depression, and sexuality.',
      highlights: ['DVT', 'Bladder', 'Cardiac'],
      color: AppTheme.complicationsColor,
      icon: Icons.warning_rounded,
      topicDataFactory: () => medicalComplicationsContent,
      quizQuestions: () => MedicalComplicationsQuiz.questions,
      flashcards: () => MedicalComplicationsFlashcards.cards,
      podcastAssetPath: 'assets/audio/medical_complications_podcast.m4a',
      podcastTitle: 'Medical Complications Board Review',
    ),
    ModuleEntry(
      id: 'outcomes-continuum',
      title: 'Outcomes & Rehab Continuum',
      description:
          'FIM, prognostication, IRF criteria, community reintegration, and ongoing care.',
      highlights: ['FIM', 'IRF criteria', 'Prognosis'],
      color: AppTheme.outcomesColor,
      icon: Icons.trending_up_rounded,
      topicDataFactory: () => outcomesContinuumContent,
      quizQuestions: () => OutcomesContinuumQuiz.questions,
      flashcards: () => OutcomesContinuumFlashcards.cards,
      podcastAssetPath: 'assets/audio/outcomes_continuum_podcast.m4a',
      podcastTitle: 'Outcomes & Rehab Continuum Board Review',
    ),
  ];

  /// Lookup a module by its string ID. Returns null if not found.
  static ModuleEntry? findById(String id) {
    for (final m in modules) {
      if (m.id == id) return m;
    }
    return null;
  }

  /// Total quiz questions across all modules.
  static int get totalQuizCount =>
      modules.fold(0, (sum, m) => sum + m.quizCount);

  /// Total flashcards across all modules.
  static int get totalFlashcardCount =>
      modules.fold(0, (sum, m) => sum + m.flashcardCount);

  /// Only modules that have a podcast.
  static List<ModuleEntry> get modulesWithPodcasts =>
      modules.where((m) => m.hasPodcast).toList();
}
