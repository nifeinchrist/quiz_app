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
  bool get _isAdvanced => widget.keyStage == 'ADVANCED';
  Color get _accentColor => _isAdvanced
      ? const Color(0xFF5B4B8A)
      : _isKeyStage2
      ? const Color(0xFF174A5B)
      : const Color(0xFFE76F51);
  Color get _pageColor => _isAdvanced
      ? const Color(0xFFF3F0FF)
      : _isKeyStage2
      ? const Color(0xFFEAF4F6)
      : const Color(0xFFFFF4EF);
  String get _stageName => _isAdvanced
      ? 'Advanced'
      : _isKeyStage2
      ? 'Intermediate'
      : 'Beginner';

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
                _buildProgressChart(records),
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
    if (_isAdvanced) {
      return record.section == 'ADVANCED';
    }
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
            detail: 'Try all three sections',
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
          height: 172,
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
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      award.detail,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.2,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      award.earned ? 'Earned' : 'Not earned yet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: award.earned
                            ? Colors.green.shade800
                            : Colors.black54,
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

  Widget _buildProgressChart(List<ProgressRecord> records) {
    final chartRecords = records.take(8).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress chart',
          style: TextStyle(
            color: _accentColor,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: chartRecords.isEmpty
                ? const Text(
                    'Complete an activity to see your scores here.',
                    style: TextStyle(fontSize: 15),
                  )
                : Column(
                    children: chartRecords.map((record) {
                      final progress = record.percentage / 100;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    record.activity,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  '${record.percentage}%',
                                  style: TextStyle(
                                    color: _accentColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            LinearProgressIndicator(
                              value: progress.clamp(0.0, 1.0),
                              minHeight: 10,
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: _accentColor.withValues(
                                alpha: 0.15,
                              ),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _accentColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecord(ProgressRecord record) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    record.activity,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${record.percentage}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              record.section,
              style: TextStyle(
                color: _accentColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 6,
              children: [
                Text(
                  'MCQ: ${record.multipleChoiceScore}/${record.multipleChoiceTotal}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Theory: ${record.writtenScore}/${record.writtenTotal}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  _date(record.completedAt),
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
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
