/// Represents any content that can be scheduled for spaced repetition review.
abstract class ReviewableItem {
  /// Unique ID across all content types.
  String get itemId;

  /// Which module this belongs to.
  String get moduleId;

  /// Content type: 'flashcard', 'quiz', 'knowledge_check', 'spot_finding', 'audio'.
  String get itemType;

  /// Shown in the review stack as the card title.
  String get displayTitle;

  /// Preview / body text for the review card.
  String get displayBody;

  /// Board relevance tag: BOARD-CORE, BOARD-LIKELY, BOARD-EMERGING, or null.
  String? get boardRelevance;
}
