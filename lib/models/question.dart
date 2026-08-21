class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String category;
  final String keyStage;

  const Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.category,
    required this.keyStage,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String? ?? '',
      questionText: json['questionText'] as String? ?? '',
      options: List<String>.from(json['options'] as List? ?? []),
      correctAnswerIndex: json['correctAnswerIndex'] as int? ?? 0,
      explanation: json['explanation'] as String? ?? '',
      category: json['category'] as String? ?? '',
      keyStage: json['keyStage'] as String? ?? '',
    );
  }
}
