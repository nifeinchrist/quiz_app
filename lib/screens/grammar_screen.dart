import 'package:flutter/material.dart';
import '../data/ks1_grammar_data.dart';
import '../progress_service.dart';

const _grammarColor = Color(0xFFE09F3E);

class GrammarScreen extends StatefulWidget {
  final String username;
  final String keyStage;
  final String title;
  final String description;
  final Color accentColor;
  final Color backgroundColor;
  final List<List<GrammarQuestion>> tests;

  const GrammarScreen({
    super.key,
    required this.username,
    this.keyStage = 'KS1',
    this.title = 'Key Stage 1 Grammar',
    this.description = 'Select a test for Grades 1 and 2.',
    this.accentColor = _grammarColor,
    this.backgroundColor = const Color(0xFFFFF8E8),
    this.tests = ks1GrammarTests,
  });

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.accentColor,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Choose a grammar test, ${widget.username}',
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ...List.generate(widget.tests.length, (index) {
            final testNumber = index + 1;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                height: 62,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GrammarTestScreen(
                        username: widget.username,
                        testNumber: testNumber,
                        keyStage: widget.keyStage,
                        title: widget.title,
                        accentColor: widget.accentColor,
                        backgroundColor: widget.backgroundColor,
                        tests: widget.tests,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.quiz_rounded),
                  label: Text(
                    'Test $testNumber',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.accentColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class GrammarTestScreen extends StatefulWidget {
  final String username;
  final int testNumber;
  final String keyStage;
  final String title;
  final Color accentColor;
  final Color backgroundColor;
  final List<List<GrammarQuestion>> tests;

  const GrammarTestScreen({
    super.key,
    required this.username,
    required this.testNumber,
    this.keyStage = 'KS1',
    this.title = 'Key Stage 1 Grammar',
    this.accentColor = _grammarColor,
    this.backgroundColor = const Color(0xFFFFF8E8),
    this.tests = ks1GrammarTests,
  });

  @override
  State<GrammarTestScreen> createState() => _GrammarTestScreenState();
}

class _GrammarTestScreenState extends State<GrammarTestScreen> {
  late final List<int?> _selectedAnswers;
  bool _submitted = false;

  List<GrammarQuestion> get _questions => widget.tests[widget.testNumber - 1];

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List<int?>.filled(_questions.length, null);
  }

  Future<void> _submit() async {
    if (_selectedAnswers.any((answer) => answer == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please answer all questions before submitting.'),
        ),
      );
      return;
    }

    await ProgressService.save(
      ProgressRecord(
        username: widget.username,
        section: widget.keyStage,
        activity: '${widget.title} Test ${widget.testNumber}',
        multipleChoiceScore: _score,
        multipleChoiceTotal: _questions.length,
        writtenScore: 0,
        writtenTotal: 0,
        completedAt: DateTime.now(),
      ),
    );
    if (mounted) setState(() => _submitted = true);
  }

  int get _score => List.generate(_questions.length, (index) {
    return _selectedAnswers[index] == _questions[index].answerIndex ? 1 : 0;
  }).fold(0, (total, point) => total + point);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.accentColor,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Grammar Test ${widget.testNumber}, ${widget.username}',
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose the best answer for each question.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            _questions.length,
            (index) => _buildQuestion(index, _questions[index]),
          ),
          const SizedBox(height: 8),
          if (!_submitted)
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check_circle_outline_rounded),
                label: const Text(
                  'SUBMIT EXERCISE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.accentColor,
                  foregroundColor: Colors.white,
                ),
              ),
            )
          else
            _buildResult(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildQuestion(int index, GrammarQuestion question) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}. ${question.question}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            RadioGroup<int>(
              groupValue: _selectedAnswers[index],
              onChanged: (value) {
                if (!_submitted) {
                  setState(() => _selectedAnswers[index] = value);
                }
              },
              child: Column(
                children: List.generate(question.options.length, (optionIndex) {
                  final isCorrect = optionIndex == question.answerIndex;
                  final isSelected = _selectedAnswers[index] == optionIndex;
                  return ListTile(
                    leading: Radio<int>(value: optionIndex),
                    title: Text(question.options[optionIndex]),
                    dense: true,
                    trailing: _submitted && (isCorrect || isSelected)
                        ? Icon(
                            isCorrect
                                ? Icons.check_circle_rounded
                                : Icons.cancel_rounded,
                            color: isCorrect ? Colors.green : Colors.red,
                          )
                        : null,
                    tileColor: _submitted && (isCorrect || isSelected)
                        ? (isCorrect
                              ? Colors.green.shade50
                              : Colors.red.shade50)
                        : null,
                  );
                }),
              ),
            ),
            if (_submitted)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Correct answer: ${question.options[question.answerIndex]}',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    final percentage = (_score / _questions.length * 100).round();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: widget.accentColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 52),
          const SizedBox(height: 8),
          Text(
            'Exercise Result',
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$_score / ${_questions.length} correct ($percentage%)',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'MCQ: $_score / ${_questions.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
