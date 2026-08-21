class AppConfig {
  // Age ranges for key stages
  static const int minAgeKS1 = 5;
  static const int maxAgeKS1 = 7;
  static const int minAgeKS2 = 8;
  static const int maxAgeKS2 = 11;

  // SharedPreferences key for storing selected age
  static const String selectedAgeKey = 'selected_age';

  /// Returns the key stage string based on the provided age.
  static String getKeyStage(int age) {
    if (age >= minAgeKS1 && age <= maxAgeKS1) return 'KS1';
    if (age >= minAgeKS2 && age <= maxAgeKS2) return 'KS2';
    return '';
  }

  // Duration of each question timer in seconds
  static const int timerDurationSeconds = 30;

  // Set this to your real API URL if you have a live backend.
  // When set, the app will try to fetch from the URL first, then fall back to the asset.
  static const String? remoteApiUrl = null;

  static String? get questionsAssetPath =>
      null; // e.g. 'https://yourapi.com/questions'
}
