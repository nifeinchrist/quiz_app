import 'package:flutter/material.dart';
import '../auth_service.dart';
import 'quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;
  final String keyStage;

  const WelcomeScreen({
    super.key,
    required this.username,
    required this.keyStage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF673AB7), Color(0xFF9C27B0), Color(0xFFE91E63)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logout button
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton.icon(
                    onPressed: () => logout(context),
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white70,
                      size: 20,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                ),

                const Spacer(),

                // Star Icon
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    size: 80,
                    color: Colors.amberAccent,
                  ),
                ),

                const SizedBox(height: 24),

                // Personalised welcome
                Text(
                  'Welcome, $username! 👋',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 6),

                // Quiz title
                const Text(
                  'English Fun Quiz!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  '$keyStage learning for bright Stars ⭐',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 32),

                // Info Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoCard(
                        icon: Icons.question_answer_rounded,
                        title: '10 Questions',
                        subtitle: 'Per Round',
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _buildInfoCard(
                        icon: Icons.child_care_rounded,
                        title: keyStage,
                        subtitle: 'Your Level',
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _buildInfoCard(
                        icon: Icons.star_rounded,
                        title: 'Earn Stars',
                        subtitle: 'Become A Pro',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Topics
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _TopicChip(label: '🔤 Spelling'),
                    _TopicChip(label: '📖 Grammar'),
                    _TopicChip(label: '🎵 Rhyming'),
                    _TopicChip(label: '✏️ Plurals'),
                    _TopicChip(label: '❓ Punctuation'),
                  ],
                ),

                const Spacer(),

                // Start Quiz Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            username: username,
                            keyStage: keyStage,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.deepPurple.shade900,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'START QUIZ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.play_arrow_rounded, size: 30),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.amberAccent, size: 28),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 2),

          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _TopicChip extends StatelessWidget {
  final String label;

  const _TopicChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
