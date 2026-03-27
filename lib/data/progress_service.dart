import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static const _lastModuleKey = 'last_module_viewed';

  // Save quiz score for a module -- keeps only the best score
  static Future<void> saveQuizScore(
      String moduleId, int correct, int total) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'quiz_best_$moduleId';
    final existing = prefs.getString(key);
    if (existing != null) {
      final parts = existing.split('/');
      if (parts.length == 2) {
        final existingCorrect = int.tryParse(parts[0]) ?? 0;
        final existingTotal = int.tryParse(parts[1]) ?? 1;
        final existingPct = existingCorrect / existingTotal;
        final newPct = correct / total;
        if (newPct <= existingPct) return;
      }
    }
    await prefs.setString(key, '$correct/$total');
  }

  // Get best quiz scores for all modules
  static Future<Map<String, String>> getBestScores() async {
    final prefs = await SharedPreferences.getInstance();
    final best = <String, String>{};
    final keys = prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith('quiz_best_')) {
        final moduleId = key.substring('quiz_best_'.length);
        final value = prefs.getString(key);
        if (value != null) {
          final parts = value.split('/');
          if (parts.length == 2) {
            final correct = int.tryParse(parts[0]) ?? 0;
            final total = int.tryParse(parts[1]) ?? 1;
            final pct = (correct / total * 100).round();
            best[moduleId] = '$pct%';
          }
        }
      }
    }
    return best;
  }

  // Save last viewed module
  static Future<void> saveLastModule(String moduleId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastModuleKey, moduleId);
  }

  // Get last viewed module
  static Future<String?> getLastModule() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastModuleKey);
  }

  // Save flashcard progress -- keeps only the best score
  static Future<void> saveFlashcardProgress(
      String moduleId, int known, int total) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'flashcard_best_$moduleId';
    final existing = prefs.getString(key);
    if (existing != null) {
      final parts = existing.split('/');
      if (parts.length == 2) {
        final existingKnown = int.tryParse(parts[0]) ?? 0;
        final existingTotal = int.tryParse(parts[1]) ?? 1;
        final existingPct = existingKnown / existingTotal;
        final newPct = known / total;
        if (newPct <= existingPct) return;
      }
    }
    await prefs.setString(key, '$known/$total');
  }
}
