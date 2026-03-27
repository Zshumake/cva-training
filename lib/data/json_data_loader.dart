import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../core/models/quiz_model.dart';
import 'models/flashcard_model.dart';

class JsonDataLoader {
  static const List<String> moduleIds = [
    'acute-management',
    'cognition-communication',
    'diagnostic-studies',
    'dysphagia',
    'hemorrhagic-stroke',
    'ischemic-stroke',
    'medical-complications',
    'motor-recovery',
    'outcomes-continuum',
    'spasticity-shoulder',
    'stroke-fundamentals',
    'stroke-pharmacology',
    'stroke-syndromes',
    'vascular-anatomy',
  ];

  static final Map<String, String> moduleDisplayNames = {
    'acute-management': 'Acute Management',
    'cognition-communication': 'Cognition & Communication',
    'diagnostic-studies': 'Diagnostic Studies',
    'dysphagia': 'Dysphagia & Nutrition',
    'hemorrhagic-stroke': 'Hemorrhagic Stroke',
    'ischemic-stroke': 'Ischemic Stroke',
    'medical-complications': 'Medical Complications',
    'motor-recovery': 'Motor Recovery',
    'outcomes-continuum': 'Outcomes & Continuum',
    'spasticity-shoulder': 'Spasticity & Shoulder',
    'stroke-fundamentals': 'Stroke Fundamentals',
    'stroke-pharmacology': 'Stroke Pharmacology',
    'stroke-syndromes': 'Stroke Syndromes',
    'vascular-anatomy': 'Vascular Anatomy',
  };

  static final Map<String, List<QuizQuestion>> _quizCache = {};
  static final Map<String, List<Flashcard>> _flashcardCache = {};

  static Future<List<QuizQuestion>> loadQuizQuestions(String moduleId) async {
    final cached = _quizCache[moduleId];
    if (cached != null) return cached;

    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/quizzes/$moduleId.json',
      );
      final data = json.decode(jsonString) as Map<String, dynamic>;
      final questions = data['questions'] as List<dynamic>;
      final result = questions
          .map((q) => QuizQuestion.fromJson(q as Map<String, dynamic>, moduleId: moduleId))
          .toList();
      _quizCache[moduleId] = result;
      return result;
    } catch (e) {
      return [];
    }
  }

  static Future<List<Flashcard>> loadFlashcards(String moduleId) async {
    final cached = _flashcardCache[moduleId];
    if (cached != null) return cached;

    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/flashcards/$moduleId.json',
      );
      final data = json.decode(jsonString) as Map<String, dynamic>;
      final cards = data['cards'] as List<dynamic>;
      final result = cards
          .map((c) => Flashcard.fromJson(c as Map<String, dynamic>, moduleId: moduleId))
          .toList();
      _flashcardCache[moduleId] = result;
      return result;
    } catch (e) {
      return [];
    }
  }

  static Future<List<QuizQuestion>> loadAllQuizQuestions() async {
    final results = await Future.wait(
      moduleIds.map((moduleId) => loadQuizQuestions(moduleId)),
    );
    return results.expand((questions) => questions).toList();
  }

  static Future<List<Flashcard>> loadAllFlashcards() async {
    final results = await Future.wait(
      moduleIds.map((moduleId) => loadFlashcards(moduleId)),
    );
    return results.expand((cards) => cards).toList();
  }

  static List<QuizQuestion> filterQuizByBoardReadiness(
    List<QuizQuestion> questions,
    String tag,
  ) {
    return questions.where((q) => q.boardReadiness == tag).toList();
  }

  static List<Flashcard> filterFlashcardsByBoardReadiness(
    List<Flashcard> cards,
    String tag,
  ) {
    return cards.where((c) => c.boardReadiness == tag).toList();
  }

  static Future<Map<String, int>> getQuizCounts() async {
    final counts = <String, int>{};
    for (final moduleId in moduleIds) {
      final questions = await loadQuizQuestions(moduleId);
      counts[moduleId] = questions.length;
    }
    return counts;
  }

  static Future<Map<String, int>> getFlashcardCounts() async {
    final counts = <String, int>{};
    for (final moduleId in moduleIds) {
      final cards = await loadFlashcards(moduleId);
      counts[moduleId] = cards.length;
    }
    return counts;
  }
}
