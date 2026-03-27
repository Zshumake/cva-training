import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// A single review record tracking SM-2 scheduling data for one item.
class ReviewRecord {
  final String itemId;
  final double easeFactor;
  final int interval;
  final int repetition;
  final DateTime nextReview;
  final DateTime lastReview;
  final int quality;

  const ReviewRecord({
    required this.itemId,
    required this.easeFactor,
    required this.interval,
    required this.repetition,
    required this.nextReview,
    required this.lastReview,
    required this.quality,
  });

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'easeFactor': easeFactor,
        'interval': interval,
        'repetition': repetition,
        'nextReview': nextReview.toIso8601String(),
        'lastReview': lastReview.toIso8601String(),
        'quality': quality,
      };

  factory ReviewRecord.fromJson(Map<String, dynamic> json) => ReviewRecord(
        itemId: json['itemId'] as String,
        easeFactor: (json['easeFactor'] as num).toDouble(),
        interval: json['interval'] as int,
        repetition: json['repetition'] as int,
        nextReview: DateTime.parse(json['nextReview'] as String),
        lastReview: DateTime.parse(json['lastReview'] as String),
        quality: json['quality'] as int,
      );

  ReviewRecord copyWith({
    double? easeFactor,
    int? interval,
    int? repetition,
    DateTime? nextReview,
    DateTime? lastReview,
    int? quality,
  }) =>
      ReviewRecord(
        itemId: itemId,
        easeFactor: easeFactor ?? this.easeFactor,
        interval: interval ?? this.interval,
        repetition: repetition ?? this.repetition,
        nextReview: nextReview ?? this.nextReview,
        lastReview: lastReview ?? this.lastReview,
        quality: quality ?? this.quality,
      );
}

/// SM-2 spaced repetition engine backed by SharedPreferences.
class SpacedRepetitionService {
  static const String _prefix = 'sr_';
  static const String _streakKey = 'sr_streak_count';
  static const String _lastReviewDateKey = 'sr_last_review_date';

  // ─── SM-2 ALGORITHM ───

  /// Process a review and return the updated record.
  ///
  /// [quality] ranges from 0 to 5:
  ///   0 = complete blackout
  ///   1 = incorrect, but recognized after seeing answer
  ///   2 = incorrect, but answer seemed easy to recall
  ///   3 = correct with serious difficulty
  ///   4 = correct after hesitation
  ///   5 = perfect response
  static ReviewRecord processReview(ReviewRecord? existing, String itemId, int quality) {
    final now = DateTime.now();
    final clamped = quality.clamp(0, 5);

    double ef = existing?.easeFactor ?? 2.5;
    int rep = existing?.repetition ?? 0;
    int interval = existing?.interval ?? 1;

    if (clamped < 3) {
      // Failed: reset to beginning
      rep = 0;
      interval = 1;
    } else {
      // Successful recall
      if (rep == 0) {
        interval = 1;
      } else if (rep == 1) {
        interval = 6;
      } else {
        interval = (interval * ef).round();
      }
      rep++;
    }

    // Update ease factor: EF' = EF + (0.1 - (5-q) * (0.08 + (5-q) * 0.02))
    ef = ef + (0.1 - (5 - clamped) * (0.08 + (5 - clamped) * 0.02));
    if (ef < 1.3) ef = 1.3;

    return ReviewRecord(
      itemId: itemId,
      easeFactor: ef,
      interval: interval,
      repetition: rep,
      nextReview: DateTime(now.year, now.month, now.day).add(Duration(days: interval)),
      lastReview: now,
      quality: clamped,
    );
  }

  // ─── PERSISTENCE ───

  /// Save a review record to SharedPreferences.
  static Future<void> _saveRecord(ReviewRecord record) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(record.toJson());
    await prefs.setString('$_prefix${record.itemId}', json);
  }

  /// Load a review record from SharedPreferences.
  static Future<ReviewRecord?> _loadRecord(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('$_prefix$itemId');
    if (json == null) return null;
    try {
      return ReviewRecord.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  /// Get all review records stored in SharedPreferences.
  static Future<List<ReviewRecord>> _allRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final records = <ReviewRecord>[];
    for (final key in prefs.getKeys()) {
      if (key.startsWith(_prefix) &&
          key != _streakKey &&
          key != _lastReviewDateKey) {
        final json = prefs.getString(key);
        if (json != null) {
          try {
            records.add(
              ReviewRecord.fromJson(jsonDecode(json) as Map<String, dynamic>),
            );
          } catch (_) {
            // skip corrupted records
          }
        }
      }
    }
    return records;
  }

  // ─── PUBLIC API ───

  /// Process and persist a review for the given item.
  static Future<void> saveReview(String itemId, int quality) async {
    final existing = await _loadRecord(itemId);
    final updated = processReview(existing, itemId, quality);
    await _saveRecord(updated);
    await _updateStreak();
  }

  /// Get all items that are due for review today or earlier.
  static Future<List<ReviewRecord>> getDueItems() async {
    final all = await _allRecords();
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    return all
        .where((r) => !r.nextReview.isAfter(todayDate))
        .toList()
      ..sort((a, b) => a.nextReview.compareTo(b.nextReview));
  }

  /// Get a daily review stack of mixed content, capped at [maxItems].
  /// Prioritizes overdue items, then items due today.
  static Future<List<ReviewRecord>> getDailyStack({int maxItems = 20}) async {
    final due = await getDueItems();
    if (due.length <= maxItems) return due;
    return due.sublist(0, maxItems);
  }

  /// Get statistics for the review dashboard.
  static Future<Map<String, dynamic>> getStats() async {
    final all = await _allRecords();
    final due = await getDueItems();
    final streak = await getStreak();

    int totalReviewed = 0;
    int masteredCount = 0; // items with 3+ successful reps
    for (final r in all) {
      totalReviewed++;
      if (r.repetition >= 3) masteredCount++;
    }

    return {
      'totalTracked': all.length,
      'dueToday': due.length,
      'streak': streak,
      'mastered': masteredCount,
      'totalReviewed': totalReviewed,
    };
  }

  /// Get the current study streak (consecutive days with reviews).
  static Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_streakKey) ?? 0;
  }

  /// Update the streak counter based on today's date.
  static Future<void> _updateStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final todayStr =
        '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    final lastDateStr = prefs.getString(_lastReviewDateKey);

    if (lastDateStr == todayStr) {
      // Already reviewed today, no change
      return;
    }

    int streak = prefs.getInt(_streakKey) ?? 0;

    if (lastDateStr != null) {
      final lastDate = DateTime.tryParse(lastDateStr);
      if (lastDate != null) {
        final diff = DateTime(today.year, today.month, today.day)
            .difference(DateTime(lastDate.year, lastDate.month, lastDate.day))
            .inDays;
        if (diff == 1) {
          // Consecutive day
          streak++;
        } else if (diff > 1) {
          // Streak broken
          streak = 1;
        }
      } else {
        streak = 1;
      }
    } else {
      streak = 1;
    }

    await prefs.setInt(_streakKey, streak);
    await prefs.setString(_lastReviewDateKey, todayStr);
  }

  /// Get the number of items due today (lightweight check for the home banner).
  static Future<int> getDueCount() async {
    final due = await getDueItems();
    return due.length;
  }
}
