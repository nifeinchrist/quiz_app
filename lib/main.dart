import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final String? savedUsername = prefs.getString('username');
  final int? savedAge = prefs.getInt('age');

  runApp(EnglishQuizApp(initialUsername: savedUsername, initialAge: savedAge));
}

class EnglishQuizApp extends StatelessWidget {
  final String? initialUsername;
  final int? initialAge;

  const EnglishQuizApp({super.key, this.initialUsername, this.initialAge});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Quiz App',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      home: initialUsername != null && initialAge != null
          ? WelcomeScreen(username: initialUsername!, age: initialAge!)
          : const LoginScreen(),
    );
  }
}
