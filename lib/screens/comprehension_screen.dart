import 'package:flutter/material.dart';
import '../data/ks1_comprehension_data.dart';
import '../progress_service.dart';

const _comprehensionColor = Color(0xFFE76F51);

IconData _passageIcon(String title) {
  if (title.contains('Garden')) return Icons.local_florist_rounded;
  if (title.contains('Library')) return Icons.local_library_rounded;
  if (title.contains('Pond')) return Icons.water_rounded;
  if (title.contains('Recycling')) return Icons.recycling_rounded;
  if (title.contains('Roman')) return Icons.account_balance_rounded;
  if (title.contains('Weather')) return Icons.cloud_rounded;
  if (title.contains('Magna')) return Icons.gavel_rounded;
  if (title.contains('Globe')) return Icons.theater_comedy_rounded;
  if (title.contains('Canal')) return Icons.directions_boat_rounded;
  if (title.contains('Vote')) return Icons.how_to_vote_rounded;
  if (title.contains('River')) return Icons.water_rounded;
  if (title.contains('Railway')) return Icons.train_rounded;
  if (title.contains('Honeybee')) return Icons.hive_rounded;
  if (title.contains('National Parks')) return Icons.park_rounded;
  return Icons.menu_book_rounded;
}

class ComprehensionScreen extends StatelessWidget {
  final String username;
  final String sectionTitle;
  final String sectionSubtitle;
  final Color accentColor;
  final Color pageColor;
  final List<ComprehensionPassage> passages;

  const ComprehensionScreen({
    super.key,
    required this.username,
    this.sectionTitle = 'Comprehension',
    this.sectionSubtitle =
        'Read the passage carefully, then answer the questions below it.',
    this.accentColor = _comprehensionColor,
    this.pageColor = const Color(0xFFFFF4EF),
    this.passages = ks1ComprehensionPassages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        title: Text(sectionTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Choose a passage, $username',
            style: TextStyle(
              color: accentColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            sectionSubtitle,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ...List.generate(passages.length, (index) {
            final passage = passages[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              elevation: 2,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                leading: CircleAvatar(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  child: Icon(_passageIcon(passage.title)),
                ),
                title: Text(
                  passage.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('5 multiple-choice + 5 written questions'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PassageQuizScreen(
                      passage: passage,
                      username: username,
                      sectionTitle: sectionTitle,
                      accentColor: accentColor,
                      pageColor: pageColor,
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

class PassageQuizScreen extends StatefulWidget {
  final ComprehensionPassage passage;
  final String username;
  final String sectionTitle;
  final Color accentColor;
  final Color pageColor;

  const PassageQuizScreen({
    super.key,
    required this.passage,
    required this.username,
    this.sectionTitle = 'Comprehension',
    this.accentColor = _comprehensionColor,
    this.pageColor = const Color(0xFFFFF4EF),
  });

  @override
  State<PassageQuizScreen> createState() => _PassageQuizScreenState();
}

class _PassageQuizScreenState extends State<PassageQuizScreen> {
  late final List<TextEditingController> _writtenControllers;
  late final List<int?> _selectedAnswers;
  bool _submitted = false;

  int get _score => List.generate(
    widget.passage.multipleChoiceQuestions.length,
    (index) =>
        _selectedAnswers[index] ==
            widget.passage.multipleChoiceQuestions[index].answerIndex
        ? 1
        : 0,
  ).fold(0, (total, point) => total + point);

  int get _writtenScore => List.generate(
    widget.passage.writtenQuestions.length,
    (index) => ProgressService.scoreWrittenAnswer(
      _writtenControllers[index].text,
      widget.passage.writtenQuestions[index].answer,
    ),
  ).fold(0, (total, point) => total + point);

  @override
  void initState() {
    super.initState();
    _writtenControllers = List.generate(
      widget.passage.writtenQuestions.length,
      (_) => TextEditingController(),
    );
    _selectedAnswers = List<int?>.filled(
      widget.passage.multipleChoiceQuestions.length,
      null,
    );
  }

  @override
  void dispose() {
    for (final controller in _writtenControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    final hasUnansweredChoice = _selectedAnswers.any(
      (answer) => answer == null,
    );
    final hasUnansweredWritten = _writtenControllers.any(
      (controller) => controller.text.trim().isEmpty,
    );

    if (hasUnansweredChoice || hasUnansweredWritten) {
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
        section: widget.sectionTitle,
        activity: widget.passage.title,
        multipleChoiceScore: _score,
        multipleChoiceTotal: widget.passage.multipleChoiceQuestions.length,
        writtenScore: _writtenScore,
        writtenTotal: widget.passage.writtenQuestions.length,
        completedAt: DateTime.now(),
      ),
    );
    if (mounted) setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    final passage = widget.passage;

    return Scaffold(
      backgroundColor: widget.pageColor,
      appBar: AppBar(
        backgroundColor: widget.accentColor,
        foregroundColor: Colors.white,
        title: Text('${widget.sectionTitle} | ${passage.title}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildPassageCard(passage),
          const SizedBox(height: 20),
          Text(
            'Multiple-choice questions',
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            passage.multipleChoiceQuestions.length,
            (index) => _buildMultipleChoiceQuestion(
              index,
              passage.multipleChoiceQuestions[index],
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Written questions',
            style: TextStyle(
              color: widget.accentColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            passage.writtenQuestions.length,
            (index) =>
                _buildWrittenQuestion(index, passage.writtenQuestions[index]),
          ),
          const SizedBox(height: 12),
          if (!_submitted)
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check_circle_outline_rounded),
                label: const Text(
                  'SUBMIT ANSWERS',
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

  Widget _buildPassageCard(ComprehensionPassage passage) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _passageIcon(passage.title),
                  color: widget.accentColor,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    passage.title,
                    style: TextStyle(
                      color: widget.accentColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              passage.text,
              style: const TextStyle(fontSize: 17, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleChoiceQuestion(
    int index,
    MultipleChoiceQuestion question,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}. ${question.question}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              Text(
                'Correct answer: ${question.options[question.answerIndex]}',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWrittenQuestion(int index, WrittenQuestion question) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}. ${question.question}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _writtenControllers[index],
              enabled: !_submitted,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Write your answer here',
                border: OutlineInputBorder(),
              ),
            ),
            if (_submitted) ...[
              const SizedBox(height: 10),
              Text(
                'Suggested answer: ${question.answer}',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    final mcqTotal = widget.passage.multipleChoiceQuestions.length;
    final writtenTotal = widget.passage.writtenQuestions.length;
    final total = mcqTotal + writtenTotal;
    final score = _score + _writtenScore;
    final percentage = (score / total * 100).round();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF263238),
        border: Border.all(color: const Color(0xFF90A4AE), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 52),
          SizedBox(height: 8),
          Text(
            'Passage Result',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '$score / $total correct ($percentage%)',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'MCQ: $_score / $mcqTotal    Theory: $_writtenScore / $writtenTotal',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFECEFF1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
