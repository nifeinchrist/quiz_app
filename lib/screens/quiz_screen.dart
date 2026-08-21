import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_service.dart';
import '../models/question.dart';
import '../config.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String username;
  final int age;

  const QuizScreen({super.key, required this.username, required this.age});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static const int _questionsPerRound = 10;

  bool _isLoading = true;
  String? _errorMessage;

  int _remainingSeconds = AppConfig.timerDurationSeconds;
  Timer? _timer;

  List<Question> _sessionQuestions = [];
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _hasAnswered = false;

  final List<int?> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Fetch questions and select a fresh set.
  Future<void> _loadQuestions() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final prefs = await SharedPreferences.getInstance();

      final String historyKey = 'seen_${widget.username}';

      // Load questions
      final List<Question> allQuestions = await ApiService().fetchQuestions();

      // Get questions already seen
      final List<String> seenIds = prefs.getStringList(historyKey) ?? [];

      // Keep only unseen questions
      List<Question> unseen = allQuestions
          .where((q) => !seenIds.contains(q.id))
          .toList();

      // Reset history if there aren't enough questions
      if (unseen.length < _questionsPerRound) {
        await prefs.remove(historyKey);
        unseen = List.from(allQuestions);
      }

      // Shuffle questions
      unseen.shuffle();

      // Select questions for this round
      final List<Question> selected = unseen.take(_questionsPerRound).toList();

      if (!mounted) return;

      setState(() {
        _sessionQuestions = selected;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _errorMessage = 'Could not load questions. Please try again.';
      });
    }
  }

  /// Finish quiz and open result screen.
  Future<void> _finishQuiz() async {
    final prefs = await SharedPreferences.getInstance();

    final String historyKey = 'seen_${widget.username}';

    final List<String> existingSeen = prefs.getStringList(historyKey) ?? [];

    final Set<String> updatedSeen = {
      ...existingSeen,
      ..._sessionQuestions.map((q) => q.id),
    };

    await prefs.setStringList(historyKey, updatedSeen.toList());

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: _score,
          totalQuestions: _sessionQuestions.length,
          questions: _sessionQuestions,
          userAnswers: _userAnswers,
          username: widget.username,

          // IMPORTANT:
          // Pass the user's actual age.
          age: widget.age,
        ),
      ),
    );
  }

  void _handleAnswer(int selectedIndex) {
    if (_hasAnswered) return;

    final currentQuestion = _sessionQuestions[_currentIndex];

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
    if (_currentIndex < _sessionQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswerIndex = null;
        _hasAnswered = false;
      });
    } else {
      _finishQuiz();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoading();
    }

    if (_errorMessage != null) {
      return _buildError();
    }

    if (_sessionQuestions.isEmpty) {
      return _buildError();
    }

    return _buildQuiz();
  }

  Widget _buildLoading() {
    return const Scaffold(
      backgroundColor: Color(0xFFF4F5FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              'Loading questions…',
              style: TextStyle(
                fontSize: 16,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FB),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi_off_rounded,
                color: Colors.redAccent,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                _errorMessage ?? 'No questions are available.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _loadQuestions,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuiz() {
    final question = _sessionQuestions[_currentIndex];

    final progress = (_currentIndex + 1) / _sessionQuestions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.deepPurple,
          ),
          onPressed: () => _showExitDialog(context),
        ),
        title: Text(
          'Question ${_currentIndex + 1} of ${_sessionQuestions.length}',
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
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.deepPurple.shade100,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.deepPurple,
                  ),
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
                    // Category
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
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

                    // Question card
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

                    // Options
                    ...List.generate(question.options.length, (index) {
                      return _buildOptionTile(
                        index: index,
                        optionText: question.options[index],
                        correctIndex: question.correctAnswerIndex,
                      );
                    }),

                    // Explanation
                    if (_hasAnswered) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              _selectedAnswerIndex ==
                                  question.correctAnswerIndex
                              ? Colors.green.shade50
                              : Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color:
                                _selectedAnswerIndex ==
                                    question.correctAnswerIndex
                                ? Colors.green.shade200
                                : Colors.orange.shade200,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _selectedAnswerIndex ==
                                      question.correctAnswerIndex
                                  ? '🎉 '
                                  : '💡 ',
                              style: const TextStyle(fontSize: 22),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedAnswerIndex ==
                                            question.correctAnswerIndex
                                        ? 'Great Job!'
                                        : 'Let\'s Learn!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          _selectedAnswerIndex ==
                                              question.correctAnswerIndex
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

            // Next / Finish button
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
                          _currentIndex == _sessionQuestions.length - 1
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
                          _currentIndex == _sessionQuestions.length - 1
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

        iconWidget = const Icon(
          Icons.check_circle_rounded,
          color: Colors.green,
          size: 24,
        );
      } else if (index == _selectedAnswerIndex) {
        borderColor = Colors.red;
        bgColor = Colors.red.shade50;
        textColor = Colors.red.shade900;

        iconWidget = const Icon(
          Icons.cancel_rounded,
          color: Colors.red,
          size: 24,
        );
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
                        color:
                            _hasAnswered &&
                                (index == correctIndex ||
                                    index == _selectedAnswerIndex)
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

                // FIXED: replaced "?iconWidget"
                if (iconWidget != null) iconWidget,
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
        content: const Text(
          'Are you sure you want to leave? '
          'Your progress will be lost.',
        ),
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
