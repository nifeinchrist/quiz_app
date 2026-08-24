import 'package:flutter/material.dart';
import '../models/question.dart';
import 'quiz_screen.dart';
import 'welcome_screen.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final List<Question> questions;
  final List<int?> userAnswers;
  final String username;
  final String keyStage;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.questions,
    required this.userAnswers,
    required this.username,
    required this.keyStage,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _showReview = false;

  int get stars {
    final percentage = (widget.score / widget.totalQuestions) * 100;

    if (percentage >= 85) return 3;
    if (percentage >= 60) return 2;
    return 1;
  }

  String get feedbackMessage {
    switch (stars) {
      case 3:
        return '🌟 Outstanding! You are an English Superstar!';
      case 2:
        return '👏 Great Job! You did really well!';
      default:
        return '💪 Good try! Practice makes perfect!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = ((widget.score / widget.totalQuestions) * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Title Header
              const Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              // Star Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Icon(
                      Icons.star_rounded,
                      size: 52,
                      color: index < stars
                          ? Colors.amber
                          : Colors.grey.shade300,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 16),

              // Feedback Banner
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  feedbackMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade800,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Score Circle Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: CircularProgressIndicator(
                            value: widget.score / widget.totalQuestions,
                            strokeWidth: 12,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.deepPurple,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$percentage%',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            Text(
                              '${widget.score} / ${widget.totalQuestions}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatTile(
                          icon: Icons.check_circle_rounded,
                          color: Colors.green,
                          count: widget.score,
                          label: 'Correct',
                        ),
                        _buildStatTile(
                          icon: Icons.cancel_rounded,
                          color: Colors.red,
                          count: widget.totalQuestions - widget.score,
                          label: 'Wrong',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showReview = !_showReview;
                          });
                        },
                        icon: Icon(
                          _showReview ? Icons.visibility_off : Icons.visibility,
                        ),
                        label: Text(
                          _showReview ? 'HIDE REVIEW' : 'REVIEW ANSWERS',
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          side: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // PLAY AGAIN
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                username: widget.username,
                                keyStage: widget.keyStage,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.replay_rounded),
                        label: const Text('PLAY AGAIN'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          foregroundColor: Colors.deepPurple.shade900,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Back to Main Menu
              TextButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(
                        username: widget.username,
                        keyStage: widget.keyStage,
                      ),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.home_rounded, color: Colors.deepPurple),
                label: const Text(
                  'Back to Main Menu',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Review Section
              if (_showReview) ...[
                const SizedBox(height: 24),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Answer Review',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                ...List.generate(widget.questions.length, (i) {
                  final q = widget.questions[i];

                  final userAns = i < widget.userAnswers.length
                      ? widget.userAnswers[i]
                      : null;

                  final isCorrect = userAns == q.correctAnswerIndex;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isCorrect
                            ? Colors.green.shade300
                            : Colors.red.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isCorrect ? Icons.check_circle : Icons.cancel,
                              color: isCorrect ? Colors.green : Colors.red,
                              size: 20,
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                'Q${i + 1}: ${q.questionText}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Your Answer: ${userAns != null ? q.options[userAns] : 'Not answered'}',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        if (!isCorrect)
                          Text(
                            'Correct Answer: ${q.options[q.correctAnswerIndex]}',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                        const SizedBox(height: 4),

                        Text(
                          '💡 ${q.explanation}',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatTile({
    required IconData icon,
    required Color color,
    required int count,
    required String label,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 28),

        const SizedBox(width: 8),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }
}
