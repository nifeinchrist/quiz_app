import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_screen.dart';
import 'screens/key_stage_1_screen.dart';
import 'screens/key_stage_2_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final String? savedUsername = prefs.getString('username');
  final String? savedKeyStage = prefs.getString('key_stage');

  runApp(
    EnglishQuizApp(
      initialUsername: savedUsername,
      initialKeyStage: savedKeyStage,
    ),
  );
}

class EnglishQuizApp extends StatelessWidget {
  final String? initialUsername;
  final String? initialKeyStage;

  const EnglishQuizApp({super.key, this.initialUsername, this.initialKeyStage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Quiz App',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      home: initialUsername != null && initialKeyStage != null
          ? initialKeyStage == 'KS1'
                ? KeyStage1Screen(username: initialUsername!)
                : KeyStage2Screen(username: initialUsername!)
          : const LoginScreen(),
    );
  }
}
