import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _hasAnswered = false;
  final List<int?> _userAnswers = [];

  void _handleAnswer(int selectedIndex) {
    if (_hasAnswered) return;

    final currentQuestion = englishQuestions[_currentIndex];
    final isCorrect = selectedIndex == currentQuestion.correctAnswerIndex;

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _hasAnswered = true;
      if (isCorrect) {
        _score++;
      }
      _userAnswers.add(selectedIndex);
    });
  }

  void _nextQuestion() {
    if (_currentIndex < englishQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswerIndex = null;
        _hasAnswered = false;
      });
    } else {
      // Quiz finished -> navigate to results
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: _score,
            totalQuestions: englishQuestions.length,
            questions: englishQuestions,
            userAnswers: _userAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = englishQuestions[_currentIndex];
    final progress = (_currentIndex + 1) / englishQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.deepPurple),
          onPressed: () {
            _showExitDialog(context);
          },
        ),
        title: Text(
          'Question ${_currentIndex + 1} of ${englishQuestions.length}',
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.deepPurple.shade100,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Category Tag
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.deepPurple.shade200),
                        ),
                        child: Text(
                          '🏷️ ${question.category}',
                          style: TextStyle(
                            color: Colors.deepPurple.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Question Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        question.questionText,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3142),
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Options List
                    ...List.generate(question.options.length, (index) {
                      return _buildOptionTile(
                        index: index,
                        optionText: question.options[index],
                        correctIndex: question.correctAnswerIndex,
                      );
                    }),

                    // Explanation Box if answered
                    if (_hasAnswered) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _selectedAnswerIndex == question.correctAnswerIndex
                              ? Colors.green.shade50
                              : Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedAnswerIndex == question.correctAnswerIndex
                                ? Colors.green.shade200
                                : Colors.orange.shade200,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _selectedAnswerIndex == question.correctAnswerIndex
                                  ? '🎉 '
                                  : '💡 ',
                              style: const TextStyle(fontSize: 22),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedAnswerIndex == question.correctAnswerIndex
                                        ? 'Great Job!'
                                        : 'Let\'s Learn!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _selectedAnswerIndex == question.correctAnswerIndex
                                          ? Colors.green.shade800
                                          : Colors.orange.shade900,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    question.explanation,
                                    style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 14,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom Navigation Action
            if (_hasAnswered)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentIndex == englishQuestions.length - 1
                              ? 'FINISH QUIZ'
                              : 'NEXT QUESTION',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _currentIndex == englishQuestions.length - 1
                              ? Icons.emoji_events_rounded
                              : Icons.arrow_forward_rounded,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required int index,
    required String optionText,
    required int correctIndex,
  }) {
    Color borderColor = Colors.grey.shade300;
    Color bgColor = Colors.white;
    Color textColor = Colors.black87;
    Widget? iconWidget;

    if (_hasAnswered) {
      if (index == correctIndex) {
        borderColor = Colors.green;
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade900;
        iconWidget = const Icon(Icons.check_circle_rounded, color: Colors.green, size: 24);
      } else if (index == _selectedAnswerIndex) {
        borderColor = Colors.red;
        bgColor = Colors.red.shade50;
        textColor = Colors.red.shade900;
        iconWidget = const Icon(Icons.cancel_rounded, color: Colors.red, size: 24);
      }
    }

    final optionLabels = ['A', 'B', 'C', 'D'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleAnswer(index),
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: _hasAnswered && index == correctIndex
                        ? Colors.green
                        : (_hasAnswered && index == _selectedAnswerIndex
                            ? Colors.red
                            : Colors.deepPurple.shade50),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      optionLabels[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: _hasAnswered && (index == correctIndex || index == _selectedAnswerIndex)
                            ? Colors.white
                            : Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    optionText,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ),
                ?iconWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Quit Quiz?'),
        content: const Text('Are you sure you want to leave? Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('KEEP PLAYING'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('QUIT'),
          ),
        ],
      ),
    );
  }
}
