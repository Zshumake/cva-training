class Flashcard {
  final String front;
  final String back;
  final String? moduleId;
  final String? boardReadiness; // 'BOARD-CORE', 'BOARD-LIKELY', 'BOARD-EMERGING'

  const Flashcard({
    required this.front,
    required this.back,
    this.moduleId,
    this.boardReadiness,
  });

  factory Flashcard.fromJson(Map<String, dynamic> json, {String? moduleId}) {
    return Flashcard(
      front: json['front'] as String,
      back: json['back'] as String,
      moduleId: moduleId,
      boardReadiness: json['boardReadiness'] as String?,
    );
  }
}
