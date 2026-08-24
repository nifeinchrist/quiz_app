import 'package:flutter/material.dart';

import '../progress_service.dart';

class ProgressScreen extends StatefulWidget {
  final String username;
  final String keyStage;

  const ProgressScreen({
    super.key,
    required this.username,
    required this.keyStage,
  });

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late Future<List<ProgressRecord>> _history;

  bool get _isKeyStage2 => widget.keyStage == 'KS2';
  Color get _accentColor =>
      _isKeyStage2 ? const Color(0xFF174A5B) : const Color(0xFFE76F51);
  Color get _pageColor =>
      _isKeyStage2 ? const Color(0xFFEAF4F6) : const Color(0xFFFFF4EF);
  String get _stageName => _isKeyStage2 ? 'Key Stage 2' : 'Key Stage 1';

  @override
  void initState() {
    super.initState();
    _history = ProgressService.load(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageColor,
      appBar: AppBar(
        backgroundColor: _accentColor,
        foregroundColor: Colors.white,
        title: Text('$_stageName Progress'),
      ),
      body: FutureBuilder<List<ProgressRecord>>(
        future: _history,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final records = (snapshot.data ?? [])
              .where(_belongsToThisStage)
              .toList();
          return RefreshIndicator(
            onRefresh: () async {
              setState(() => _history = ProgressService.load(widget.username));
              await _history;
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Keep growing, ${widget.username}!',
                  style: TextStyle(
                    color: _accentColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your $_stageName activities, scores and awards appear here.',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                _buildSummary(records),
                const SizedBox(height: 20),
                _buildAwards(records),
                const SizedBox(height: 20),
                Text(
                  'Recent activity',
                  style: TextStyle(
                    color: _accentColor,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                if (records.isEmpty)
                  _buildEmptyState()
                else
                  ...records.take(20).map(_buildRecord),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _belongsToThisStage(ProgressRecord record) {
    if (_isKeyStage2) {
      return record.section == 'KS2' || record.section.startsWith('KS2 ');
    }
    return record.section == 'KS1' || !record.section.startsWith('KS2');
  }

  Widget _buildSummary(List<ProgressRecord> records) {
    final average = records.isEmpty
        ? 0
        : (records.map((record) => record.percentage).reduce((a, b) => a + b) /
                  records.length)
              .round();
    return Row(
      children: [
        Expanded(
          child: _stat('Activities', '${records.length}', Icons.school_rounded),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _stat('Average', '$average%', Icons.trending_up_rounded),
        ),
      ],
    );
  }

  Widget _stat(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _accentColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: _accentColor, size: 30),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildAwards(List<ProgressRecord> records) {
    final awards =
        <({String title, String detail, IconData icon, bool earned})>[
          (
            title: 'First steps',
            detail: 'Complete your first activity',
            icon: Icons.flag_rounded,
            earned: records.isNotEmpty,
          ),
          (
            title: 'Perfect score',
            detail: 'Get 100% in an activity',
            icon: Icons.star_rounded,
            earned: records.any((record) => record.percentage == 100),
          ),
          (
            title: 'Outstanding',
            detail: 'Score 85% or higher',
            icon: Icons.emoji_events_rounded,
            earned: records.any((record) => record.percentage >= 85),
          ),
          (
            title: 'Three in a row',
            detail: 'Complete three activities',
            icon: Icons.local_fire_department_rounded,
            earned: records.length >= 3,
          ),
          (
            title: 'All-round learner',
            detail: 'Try all three KS1 sections',
            icon: Icons.workspace_premium_rounded,
            earned: records.map((record) => record.section).toSet().length >= 3,
          ),
        ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Awards',
          style: TextStyle(
            color: _accentColor,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 132,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: awards.length,
            separatorBuilder: (_, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final award = awards[index];
              return Container(
                width: 150,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: award.earned
                      ? Colors.amber.shade50
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: award.earned ? Colors.amber : Colors.grey.shade300,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      award.icon,
                      size: 34,
                      color: award.earned ? Colors.amber.shade800 : Colors.grey,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      award.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      award.earned ? 'Earned' : 'Keep learning',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecord(ProgressRecord record) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _accentColor,
          foregroundColor: Colors.white,
          child: Text('${record.percentage}%'),
        ),
        title: Text(
          record.activity,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${record.section}  |  MCQ ${record.multipleChoiceScore}/${record.multipleChoiceTotal}  |  Theory ${record.writtenScore}/${record.writtenTotal}',
        ),
        trailing: Text(
          _date(record.completedAt),
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(Icons.insights_rounded, size: 48, color: _accentColor),
            const SizedBox(height: 8),
            const Text(
              'No results yet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Complete an activity to start building your progress.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _date(DateTime date) => '${date.day}/${date.month}/${date.year}';
}
