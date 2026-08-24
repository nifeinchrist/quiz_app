class AppConfig {
  // SharedPreferences key for storing the selected key stage.
  static const String selectedKeyStageKey = 'key_stage';

  // Duration of each question timer in seconds
  static const int timerDurationSeconds = 30;

  // Set this to your real API URL if you have a live backend.
  // When set, the app will try to fetch from the URL first, then fall back to the asset.
  static const String? remoteApiUrl = null;

  static String? get questionsAssetPath =>
      null; // e.g. 'https://yourapi.com/questions'
}
