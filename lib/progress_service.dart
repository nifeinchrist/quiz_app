import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProgressRecord {
  final String username;
  final String section;
  final String activity;
  final int multipleChoiceScore;
  final int multipleChoiceTotal;
  final int writtenScore;
  final int writtenTotal;
  final DateTime completedAt;

  const ProgressRecord({
    required this.username,
    required this.section,
    required this.activity,
    required this.multipleChoiceScore,
    required this.multipleChoiceTotal,
    required this.writtenScore,
    required this.writtenTotal,
    required this.completedAt,
  });

  int get score => multipleChoiceScore + writtenScore;
  int get total => multipleChoiceTotal + writtenTotal;
  int get percentage => total == 0 ? 0 : (score / total * 100).round();

  Map<String, dynamic> toJson() => {
    'username': username,
    'section': section,
    'activity': activity,
    'multipleChoiceScore': multipleChoiceScore,
    'multipleChoiceTotal': multipleChoiceTotal,
    'writtenScore': writtenScore,
    'writtenTotal': writtenTotal,
    'completedAt': completedAt.toIso8601String(),
  };

  factory ProgressRecord.fromJson(Map<String, dynamic> json) => ProgressRecord(
    username: json['username'] as String,
    section: json['section'] as String,
    activity: json['activity'] as String,
    multipleChoiceScore: json['multipleChoiceScore'] as int,
    multipleChoiceTotal: json['multipleChoiceTotal'] as int,
    writtenScore: json['writtenScore'] as int,
    writtenTotal: json['writtenTotal'] as int,
    completedAt: DateTime.parse(json['completedAt'] as String),
  );
}

class ProgressService {
  static const _historyKey = 'ks1_progress_history';

  static Future<List<ProgressRecord>> load(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(_historyKey) ?? [];
    return stored
        .map((item) => ProgressRecord.fromJson(jsonDecode(item)))
        .where((record) => record.username == username)
        .toList()
      ..sort((a, b) => b.completedAt.compareTo(a.completedAt));
  }

  static Future<void> save(ProgressRecord record) async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(_historyKey) ?? [];
    stored.add(jsonEncode(record.toJson()));
    await prefs.setStringList(_historyKey, stored);
  }

  static int scoreWrittenAnswer(String submitted, String expected) {
    final submittedWords = _words(submitted).toSet();
    final expectedWords = _words(expected).toSet();
    if (submittedWords.isEmpty || expectedWords.isEmpty) return 0;

    final matches = expectedWords.where(submittedWords.contains).length;
    final requiredMatches = expectedWords.length < 3
        ? expectedWords.length
        : (expectedWords.length / 2).ceil();
    return matches >= requiredMatches ? 1 : 0;
  }

  static Set<String> _words(String value) => value
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9 ]'), ' ')
      .split(RegExp(r'\s+'))
      .where((word) => word.length > 2)
      .toSet();
}
