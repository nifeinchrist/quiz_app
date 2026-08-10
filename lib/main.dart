import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const EnglishQuizApp());
}

class EnglishQuizApp extends StatelessWidget {
  const EnglishQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Quiz App (Age 7)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF673AB7),
          primary: const Color(0xFF673AB7),
          secondary: Colors.amber,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F5FB),
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

