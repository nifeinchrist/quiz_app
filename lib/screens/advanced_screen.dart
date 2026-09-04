import 'package:flutter/material.dart';

import '../auth_service.dart';
import '../data/advanced_comprehension_data.dart';
import '../data/advanced_grammar_data.dart';
import '../data/advanced_listening_data.dart';
import 'comprehension_screen.dart';
import 'grammar_screen.dart';
import 'listening_screen.dart';
import 'progress_screen.dart';

class AdvancedScreen extends StatelessWidget {
  final String username;

  const AdvancedScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B4B8A),
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => logout(context),
          icon: const Icon(Icons.logout_rounded),
          tooltip: 'Logout',
        ),
        title: const Text('Advanced'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Icon(
                Icons.auto_awesome_rounded,
                size: 64,
                color: Color(0xFF5B4B8A),
              ),
              const SizedBox(height: 18),
              const Text(
                'Advanced',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5B4B8A),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Coming soon, $username!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              const Text(
                'Grades 5 and 6',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5B4B8A),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              for (final subject in [
                ('Comprehension', Icons.menu_book_rounded),
                ('Grammar', Icons.spellcheck_rounded),
                ('Listening Skills', Icons.headphones_rounded),
                ('My Progress & Awards', Icons.workspace_premium_rounded),
              ])
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: SizedBox(
                    height: 68,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (subject.$1 == 'Comprehension') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ComprehensionScreen(
                                username: username,
                                sectionTitle: 'Advanced Comprehension',
                                sectionSubtitle:
                                    'British curriculum reading for Grades 7 and 8: analyse the passage, then answer 10 MCQs and 10 theory questions.',
                                accentColor: const Color(0xFF5B4B8A),
                                pageColor: const Color(0xFFF3F0FF),
                                passages: advancedComprehensionPassages
                                    .take(10)
                                    .toList(),
                              ),
                            ),
                          );
                          return;
                        }
                        if (subject.$1 == 'Grammar') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GrammarScreen(
                                username: username,
                                keyStage: 'ADVANCED',
                                title: 'Advanced Grammar',
                                description:
                                    'Choose from 10 tests of 20 British English grammar questions for Grades 7 and 8.',
                                accentColor: const Color(0xFF5B4B8A),
                                backgroundColor: const Color(0xFFF3F0FF),
                                tests: advancedGrammarTests,
                              ),
                            ),
                          );
                          return;
                        }
                        if (subject.$1 == 'Listening Skills') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ListeningScreen(
                                username: username,
                                keyStage: 'ADVANCED',
                                title: 'Advanced Listening Skills',
                                description:
                                    'British curriculum listening for Grades 7 and 8: hear each passage, then answer 10 MCQs and 10 theory questions.',
                                accentColor: const Color(0xFF5B4B8A),
                                backgroundColor: const Color(0xFFF3F0FF),
                                exercises: advancedListeningExercises,
                              ),
                            ),
                          );
                          return;
                        }
                        if (subject.$1 == 'My Progress & Awards') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProgressScreen(
                                username: username,
                                keyStage: 'ADVANCED',
                              ),
                            ),
                          );
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${subject.$1} activities are coming soon.',
                            ),
                          ),
                        );
                      },
                      icon: Icon(subject.$2, size: 28),
                      label: Text(
                        subject.$1,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B4B8A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
