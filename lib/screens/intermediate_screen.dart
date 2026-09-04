import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../auth_service.dart';
import '../data/intermediate_comprehension_data.dart';
import '../data/intermediate_grammar_data.dart';
import '../data/intermediate_listening_data.dart';
import 'comprehension_screen.dart';
import 'grammar_screen.dart';
import 'listening_screen.dart';
import 'progress_screen.dart';

class KeyStage2Screen extends StatelessWidget {
  final String username;

  const KeyStage2Screen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.veryLightOrange,
      appBar: AppBar(
        backgroundColor: AppTheme.darkOrange,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => logout(context),
          icon: const Icon(Icons.logout_rounded),
          tooltip: 'Logout',
        ),
        title: const Text('Intermediate'),
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
                color: AppTheme.darkOrange,
              ),
              const SizedBox(height: 18),
              const Text(
                'Intermediate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.darkOrange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose a learning skill, $username!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              const Text(
                'Grades 3 and 4',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.darkOrange,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              _buildSubjectButton(
                context,
                title: 'Comprehension',
                icon: Icons.menu_book_rounded,
              ),
              _buildSubjectButton(
                context,
                title: 'Grammar',
                icon: Icons.spellcheck_rounded,
              ),
              _buildSubjectButton(
                context,
                title: 'Listening Skills',
                icon: Icons.headphones_rounded,
              ),
              _buildSubjectButton(
                context,
                title: 'My Progress & Awards',
                icon: Icons.workspace_premium_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectButton(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: SizedBox(
        height: 68,
        child: ElevatedButton.icon(
          onPressed: () {
            if (title == 'My Progress & Awards') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ProgressScreen(username: username, keyStage: 'KS2'),
                ),
              );
              return;
            }
            if (title == 'Comprehension') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ComprehensionScreen(
                    username: username,
                    sectionTitle: 'KS2 Comprehension',
                    sectionSubtitle:
                        'Challenge yourself with British texts for Grades 3 and 4.',
                    accentColor: AppTheme.darkOrange,
                    pageColor: AppTheme.veryLightOrange,
                    passages: ks2ComprehensionPassages.take(10).toList(),
                  ),
                ),
              );
              return;
            }
            if (title == 'Grammar') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GrammarScreen(
                    username: username,
                    keyStage: 'KS2',
                    title: 'Intermediate Grammar',
                    description:
                        'Choose a 15-question grammar test for Grades 3 and 4.',
                    accentColor: AppTheme.darkOrange,
                    backgroundColor: AppTheme.veryLightOrange,
                    tests: ks2GrammarTests,
                  ),
                ),
              );
              return;
            }
            if (title == 'Listening Skills') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ListeningScreen(
                    username: username,
                    keyStage: 'KS2',
                    title: 'Intermediate Listening Skills',
                    description:
                        'Listen to British-context passages and answer 10 MCQs plus 5 theory questions.',
                    accentColor: AppTheme.darkOrange,
                    backgroundColor: AppTheme.veryLightOrange,
                    exercises: ks2ListeningExercises,
                  ),
                ),
              );
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title activities are coming soon.')),
            );
          },
          icon: Icon(icon, size: 28),
          label: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: title == 'My Progress & Awards' 
                ? AppTheme.lemonGreen 
                : AppTheme.primaryOrange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
