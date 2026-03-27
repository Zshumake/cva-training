class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String? moduleId;
  final String? difficulty; // 'basic', 'intermediate', 'board'
  final String? boardReadiness; // 'BOARD-CORE', 'BOARD-LIKELY', 'BOARD-EMERGING'
  final String? hint;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.moduleId,
    this.difficulty,
    this.boardReadiness,
    this.hint,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json, {String? moduleId}) {
    final answerOptions = json['answerOptions'] as List<dynamic>;
    final options = answerOptions.map((o) => o['text'] as String).toList();
    final correctIndex = answerOptions.indexWhere((o) => o['isCorrect'] == true);
    final correctOption = answerOptions.firstWhere(
      (o) => o['isCorrect'] == true,
      orElse: () => answerOptions.first,
    );

    return QuizQuestion(
      question: json['question'] as String,
      options: options,
      correctIndex: correctIndex >= 0 ? correctIndex : 0,
      explanation: correctOption['rationale'] as String? ?? '',
      moduleId: moduleId,
      difficulty: 'board',
      boardReadiness: json['boardReadiness'] as String?,
      hint: json['hint'] as String?,
    );
  }
}
