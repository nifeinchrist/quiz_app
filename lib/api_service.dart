import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'config.dart';
import 'models/question.dart';

class ApiService {
  /// Fetches the list of questions.
  ///
  /// Tries the remote API first if one is configured.
  /// If the API fails, it loads questions from the bundled JSON asset.
  Future<List<Question>> fetchQuestions() async {
    // Try remote API first
    if (AppConfig.remoteApiUrl != null) {
      try {
        final response = await http
            .get(Uri.parse(AppConfig.remoteApiUrl!))
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;

          return data
              .map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList();
        }
      } catch (_) {
        // If remote API fails, use local JSON.
      }
    }

    // Load questions from bundled JSON asset
    final String assetString = await rootBundle.loadString(
      AppConfig.questionsAssetPath!,
    );

    final List<dynamic> data = jsonDecode(assetString) as List<dynamic>;

    return data
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
