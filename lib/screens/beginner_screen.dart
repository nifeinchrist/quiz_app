import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../auth_service.dart';
import 'comprehension_screen.dart';
import 'grammar_screen.dart';
import 'listening_screen.dart';
import 'progress_screen.dart';

class KeyStage1Screen extends StatelessWidget {
  final String username;

  const KeyStage1Screen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return _SubjectSelectionPage(
      title: 'Beginner',
      subtitle: 'Choose a learning skill, $username!',
      grades: 'Grades 1 and 2',
      color: AppTheme.darkOrange,
      subjects: const [
        _SubjectOption(
          'Comprehension',
          Icons.menu_book_rounded,
          AppTheme.primaryOrange,
        ),
        _SubjectOption('Grammar', Icons.spellcheck_rounded, AppTheme.primaryOrange),
        _SubjectOption(
          'Listening Skills',
          Icons.headphones_rounded,
          AppTheme.primaryOrange,
        ),
        _SubjectOption(
          'My Progress',
          Icons.insights_rounded,
          AppTheme.lemonGreen,
        ),
      ],
      onSubjectSelected: (subject) {
        if (subject.title == 'My Progress') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  ProgressScreen(username: username, keyStage: 'KS1'),
            ),
          );
          return;
        }
        if (subject.title == 'Comprehension') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ComprehensionScreen(username: username),
            ),
          );
          return;
        }

        if (subject.title == 'Grammar') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GrammarScreen(username: username),
            ),
          );
          return;
        }

        if (subject.title == 'Listening Skills') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ListeningScreen(username: username),
            ),
          );
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${subject.title} activities are coming soon.'),
          ),
        );
      },
    );
  }
}

class _SubjectOption {
  final String title;
  final IconData icon;
  final Color color;

  const _SubjectOption(this.title, this.icon, this.color);
}

class _SubjectSelectionPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String grades;
  final Color color;
  final List<_SubjectOption> subjects;
  final void Function(_SubjectOption) onSubjectSelected;

  const _SubjectSelectionPage({
    required this.title,
    required this.subtitle,
    required this.grades,
    required this.color,
    required this.subjects,
    required this.onSubjectSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.veryLightOrange,
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => logout(context),
          icon: const Icon(Icons.logout_rounded),
          tooltip: 'Logout',
        ),
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Icon(Icons.auto_awesome_rounded, size: 64, color: color),
              const SizedBox(height: 18),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              Text(
                grades,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 32),
              ...subjects.map(
                (subject) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: SizedBox(
                    height: 68,
                    child: ElevatedButton.icon(
                      onPressed: () => onSubjectSelected(subject),
                      icon: Icon(subject.icon, size: 28),
                      label: Text(
                        subject.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: subject.color,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
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
