import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/ks1_listening_data.dart';
import '../progress_service.dart';

const _listeningColor = Color(0xFF2A9D8F);

class ListeningScreen extends StatelessWidget {
  final String username;
  final String keyStage;
  final String title;
  final String description;
  final Color accentColor;
  final Color backgroundColor;
  final List<ListeningExercise> exercises;

  const ListeningScreen({
    super.key,
    required this.username,
    this.keyStage = 'KS1',
    this.title = 'Key Stage 1 Listening Skills',
    this.description =
        'Grades 1 and 2: listen carefully, then answer in writing.',
    this.accentColor = _listeningColor,
    this.backgroundColor = const Color(0xFFEFFAF7),
    this.exercises = ks1ListeningExercises,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Choose a listening exercise, $username',
            style: TextStyle(
              color: accentColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ...List.generate(exercises.length, (index) {
            final exerciseNumber = index + 1;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                height: 66,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ListeningExerciseScreen(
                        exercise: exercises[index],
                        username: username,
                        exerciseNumber: exerciseNumber,
                        keyStage: keyStage,
                        title: title,
                        accentColor: accentColor,
                        backgroundColor: backgroundColor,
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.headphones_rounded),
                  label: Text(
                    'Exercise $exerciseNumber',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
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

class ListeningExerciseScreen extends StatefulWidget {
  final ListeningExercise exercise;
  final int exerciseNumber;
  final String username;
  final String keyStage;
  final String title;
  final Color accentColor;
  final Color backgroundColor;

  const ListeningExerciseScreen({
    super.key,
    required this.exercise,
    required this.exerciseNumber,
    required this.username,
    this.keyStage = 'KS1',
    this.title = 'Key Stage 1 Listening Skills',
    this.accentColor = _listeningColor,
    this.backgroundColor = const Color(0xFFEFFAF7),
  });

  @override
  State<ListeningExerciseScreen> createState() =>
      _ListeningExerciseScreenState();
}

class _ListeningExerciseScreenState extends State<ListeningExerciseScreen> {
  final FlutterTts _tts = FlutterTts();
  late final List<int?> _selectedAnswers;
  late final List<TextEditingController> _responseControllers;
  late final Future<void> _voiceSetup;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List<int?>.filled(
      widget.exercise.questions.length,
      null,
    );
    _responseControllers = List.generate(
      widget.exercise.responseQuestions.length,
      (_) => TextEditingController(),
    );
    _voiceSetup = _configureAudio();
  }

  Future<void> _configureAudio() async {
    try {
      await _tts.setLanguage('en-GB');
      final voices = await _tts.getVoices;
      if (voices is List) {
        final britishVoices = voices
            .cast<dynamic>()
            .where(
              (voice) =>
                  '${voice['locale']}'.toLowerCase().replaceAll('_', '-') ==
                  'en-gb',
            )
            .toList();
        if (britishVoices.isNotEmpty) {
          britishVoices.sort(
            (first, second) =>
                _voiceQuality(second).compareTo(_voiceQuality(first)),
          );
          final selectedVoice = britishVoices.first;
          await _tts.setVoice({
            'name': selectedVoice['name'],
            'locale': selectedVoice['locale'],
          });
        }
      }
      await _tts.setSpeechRate(0.40);
      await _tts.setPitch(1.08);
    } catch (_) {
      // Keep the platform's British default if voice discovery is unavailable.
      await _tts.setLanguage('en-GB');
    }
  }

  int _voiceQuality(dynamic voice) {
    final name = '${voice['name']}'.toLowerCase();
    var quality = 0;
    const femaleClues = [
      'female',
      'woman',
      'girl',
      'hazel',
      'susan',
      'libby',
      'amy',
      'kate',
      'alice',
      'emma',
      'en-gb-x-gba',
    ];
    if (femaleClues.any(name.contains)) quality += 100;
    if (name.contains('neural') || name.contains('premium')) quality += 30;
    if (name.contains('network')) quality += 20;
    if (name.contains('local')) quality += 10;
    if (name.contains('compact')) quality -= 10;
    return quality;
  }

  @override
  void dispose() {
    _tts.stop();
    for (final controller in _responseControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await _voiceSetup;
    await _tts.stop();
    await _tts.speak(text);
  }

  String _normalise(String value) =>
      value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9 ]'), '').trim();

  Future<void> _submit() async {
    if (_selectedAnswers.any((answer) => answer == null) ||
        _responseControllers.any(
          (controller) => controller.text.trim().isEmpty,
        )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please answer every question before submitting.'),
        ),
      );
      return;
    }
    await ProgressService.save(
      ProgressRecord(
        username: widget.username,
        section: widget.keyStage,
        activity: '${widget.title} | ${widget.exercise.title}',
        multipleChoiceScore: _multipleChoiceScore,
        multipleChoiceTotal: widget.exercise.questions.length,
        writtenScore: _writtenScore,
        writtenTotal: widget.exercise.responseQuestions.length,
        completedAt: DateTime.now(),
      ),
    );
    if (mounted) setState(() => _submitted = true);
  }

  bool _matchesResponse(String submitted, String expected) {
    final submittedWords = _normalise(submitted).split(' ');
    final expectedWords = _normalise(
      expected,
    ).split(' ').where((word) => word.length > 2).toList();
    return expectedWords.every(submittedWords.contains);
  }

  int get _multipleChoiceScore =>
      List.generate(widget.exercise.questions.length, (index) {
        return _selectedAnswers[index] ==
                widget.exercise.questions[index].answerIndex
            ? 1
            : 0;
      }).fold(0, (total, point) => total + point);

  int get _writtenScore =>
      List.generate(widget.exercise.responseQuestions.length, (index) {
        final response = widget.exercise.responseQuestions[index];
        return ProgressService.scoreWrittenAnswer(
          _responseControllers[index].text,
          response.answer,
        );
      }).fold(0, (total, point) => total + point);

  int get _score => _multipleChoiceScore + _writtenScore;

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercise;
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.accentColor,
        foregroundColor: Colors.white,
        title: Text('${widget.title} | Exercise ${widget.exerciseNumber}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildPassageCard(exercise),
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
          ...List.generate(exercise.questions.length, (index) {
            return _buildQuestion(index, exercise.questions[index]);
          }),
          const SizedBox(height: 14),
          const Text(
            'Written questions',
            style: TextStyle(
              color: _listeningColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(exercise.responseQuestions.length, (index) {
            return _buildResponseQuestion(
              index,
              exercise.responseQuestions[index],
            );
          }),
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

  Widget _buildPassageCard(ListeningExercise exercise) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.title,
              style: TextStyle(
                color: widget.accentColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Listen to the passage',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            IconButton.filled(
              onPressed: () => _speak(exercise.passage),
              icon: const Icon(Icons.volume_up_rounded),
              tooltip: 'Play passage',
            ),
            const SizedBox(height: 8),
            Text(
              exercise.passage,
              style: const TextStyle(fontSize: 16, height: 1.45),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(int index, ListeningQuestion question) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${index + 1}. ${question.question}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _speak(question.question),
                  icon: const Icon(Icons.volume_up_rounded),
                  tooltip: 'Play question',
                ),
              ],
            ),
            const Text(
              'Choose the correct answer:',
              style: TextStyle(color: Colors.black54),
            ),
            RadioGroup<int>(
              groupValue: _selectedAnswers[index],
              onChanged: (value) {
                if (!_submitted && value != null) {
                  setState(() {
                    _selectedAnswers[index] = value;
                  });
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
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Correct answer: ${question.options[question.answerIndex]}',
                  style: const TextStyle(
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

  Widget _buildResponseQuestion(int index, ListeningResponseQuestion question) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${index + 1}. ${question.question}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _speak(question.question),
                  icon: const Icon(Icons.volume_up_rounded),
                  tooltip: 'Play question',
                ),
              ],
            ),
            TextField(
              controller: _responseControllers[index],
              enabled: !_submitted,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Written answer',
                border: const OutlineInputBorder(),
              ),
            ),
            if (_submitted)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Suggested answer: ${question.answer}',
                  style: const TextStyle(
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
    final total =
        widget.exercise.questions.length +
        widget.exercise.responseQuestions.length;
    final percentage = (_score / total * 100).round();
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
            '$_score / $total correct ($percentage%)',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'MCQ: $_multipleChoiceScore / ${widget.exercise.questions.length}    Theory: $_writtenScore / ${widget.exercise.responseQuestions.length}',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
