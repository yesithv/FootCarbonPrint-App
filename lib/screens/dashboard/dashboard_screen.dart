// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/constants/emission_factors.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../models/carbon_footprint.dart';
import '../../providers/footprint_provider.dart';
import '../profile_card/profile_card_screen.dart';
import '../shell/main_shell.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Consumer<FootprintProvider>(
        builder: (context, provider, _) {
          if (provider.completedCount == 0) {
            return _EmptyState(
              onGoToTest: () => MainShell.of(context)?.goToTab(0),
            );
          }
          final fp = provider.footprint;
          return CustomScrollView(
            slivers: [
              _AppBarSliver(
                footprint: fp,
                userName: provider.userName,
                onExport: () => _showExportSheet(context, fp),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _EquivalencesCard(footprint: fp),
                    const SizedBox(height: 20),
                    _PieChartCard(breakdown: fp.breakdown),
                    const SizedBox(height: 20),
                    _BenchmarkCard(total: fp.totalCO2),
                    const SizedBox(height: 20),
                    _HistoryCard(history: fp.history),
                    const SizedBox(height: 20),
                    _OffsetCalculatorCard(totalCO2: fp.totalCO2),
                    const SizedBox(height: 20),
                    const _ShareCardButton(),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => MainShell.of(context)?.goToTab(2),
                      icon: const Icon(Icons.emoji_events_rounded),
                      label: Text(context.l10n.viewActionPlan),
                    ),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback? onGoToTest;
  const _EmptyState({this.onGoToTest});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.bar_chart_rounded,
                  size: 64, color: AppColors.primary),
            ),
            const SizedBox(height: 28),
            Text(
              l10n.dashEmptyTitle,
              style: GoogleFonts.inter(
                  fontSize: 22, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.dashEmptySub,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onGoToTest,
              icon: const Icon(Icons.home_rounded),
              label: Text(l10n.goToTest),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarSliver extends StatelessWidget {
  final dynamic footprint;
  final String userName;
  final VoidCallback? onExport;
  const _AppBarSliver({
    required this.footprint,
    required this.userName,
    this.onExport,
  });

  Color get _levelColor {
    switch (footprint.level) {
      case 'champion': return AppColors.green;
      case 'conscious': return const Color(0xFF2196F3);
      case 'ontrack': return AppColors.yellow;
      case 'high': return AppColors.orange;
      default: return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = _levelColor;
    final levelLabel = l10n.localizedFootprintLevel(footprint.level);

    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: color,
      actions: [
        IconButton(
          onPressed: onExport,
          icon: const Icon(Icons.ios_share_rounded,
              color: Colors.white70, size: 20),
          tooltip: l10n.exportResult,
        ),
        IconButton(
          onPressed: () => _showNameDialog(context),
          icon: Icon(
            userName.isEmpty ? Icons.person_add_rounded : Icons.edit_rounded,
            color: Colors.white70,
            size: 20,
          ),
          tooltip: userName.isEmpty ? l10n.addYourName : l10n.nameDialogTitle,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(16, 0, 112, 14),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(footprint.levelEmoji,
                style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${footprint.totalCO2.toStringAsFixed(2)} t CO₂',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    levelLabel,
                    style: GoogleFonts.inter(
                        fontSize: 10, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, Color.lerp(color, Colors.black, 0.2)!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 100, 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    l10n.dashAppBarTitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white60,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        footprint.totalCO2.toStringAsFixed(2),
                        style: GoogleFonts.inter(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          l10n.co2PerYear,
                          style: GoogleFonts.inter(
                              fontSize: 12, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(footprint.levelEmoji,
                            style: const TextStyle(fontSize: 13)),
                        const SizedBox(width: 5),
                        Text(
                          levelLabel,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showNameDialog(BuildContext context) {
    final l10n = context.l10n;
    final provider = context.read<FootprintProvider>();
    final ctrl = TextEditingController(text: provider.userName);

    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          l10n.nameDialogTitle,
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            hintText: l10n.nameDialogHint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.person_rounded),
          ),
          onSubmitted: (v) {
            provider.setUserName(v);
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              provider.setUserName(ctrl.text);
              Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }
}

class _EquivalencesCard extends StatelessWidget {
  final dynamic footprint;
  const _EquivalencesCard({required this.footprint});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.equivalencesTitle,
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _EquivItem(
                  emoji: '🌳',
                  value: '${footprint.treesEquivalent}',
                  label: l10n.treesLabel,
                ),
                const SizedBox(width: 12),
                _EquivItem(
                  emoji: '💡',
                  value: '${footprint.lightBulbYears}',
                  label: l10n.bulbYearsLabel,
                ),
                const SizedBox(width: 12),
                _EquivItem(
                  emoji: '📱',
                  value: _compactInt(
                      (footprint.totalCO2 * 1000 / 0.082).round()),
                  label: l10n.phoneChargesLabel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EquivItem extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  const _EquivItem(
      {required this.emoji, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 6),
            Text(
              value,
              style: GoogleFonts.inter(
                  fontSize: 20, fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 10, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _PieChartCard extends StatefulWidget {
  final Map<String, double> breakdown;
  const _PieChartCard({required this.breakdown});

  @override
  State<_PieChartCard> createState() => _PieChartCardState();
}

class _PieChartCardState extends State<_PieChartCard> {
  int _touched = -1;

  static const _colors = [
    AppColors.transport,
    AppColors.food,
    AppColors.home,
    AppColors.shopping,
    AppColors.waste,
    AppColors.water,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final entries = widget.breakdown.entries.toList();
    final total = entries.fold<double>(0, (s, e) => s + e.value);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.breakdownTitle,
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (ev, resp) {
                      setState(() {
                        _touched = resp?.touchedSection
                                ?.touchedSectionIndex ??
                            -1;
                      });
                    },
                  ),
                  sections: List.generate(entries.length, (i) {
                    final e = entries[i];
                    final pct = total > 0 ? (e.value / total * 100) : 0;
                    final isTouched = i == _touched;
                    return PieChartSectionData(
                      value: e.value,
                      color: _colors[i % _colors.length],
                      radius: isTouched ? 80 : 65,
                      title: '${pct.round()}%',
                      titleStyle: GoogleFonts.inter(
                        fontSize: isTouched ? 14 : 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    );
                  }),
                  centerSpaceRadius: 40,
                  sectionsSpace: 3,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: List.generate(entries.length, (i) {
                final e = entries[i];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _colors[i % _colors.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${l10n.localizedCategoryName(e.key)} (${e.value.toStringAsFixed(2)}t)',
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _BenchmarkCard extends StatelessWidget {
  final double total;
  const _BenchmarkCard({required this.total});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.benchmarkTitle,
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            _BenchmarkRow(
              label: l10n.yourFootprint,
              value: total,
              maxValue: 10,
              color: _colorForValue(total),
              isYou: true,
            ),
            const SizedBox(height: 12),
            _BenchmarkRow(
              label: l10n.parisTarget,
              value: EmissionFactors.parisTarget,
              maxValue: 10,
              color: AppColors.green,
            ),
            const SizedBox(height: 12),
            _BenchmarkRow(
              label: l10n.colombiaAvg,
              value: EmissionFactors.colombiaAverage,
              maxValue: 10,
              color: const Color(0xFF2196F3),
            ),
            const SizedBox(height: 12),
            _BenchmarkRow(
              label: l10n.worldAvg,
              value: EmissionFactors.globalAverage,
              maxValue: 10,
              color: AppColors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Color _colorForValue(double v) {
    if (v < 1.5) return AppColors.green;
    if (v < 3) return const Color(0xFF2196F3);
    if (v < 5) return AppColors.yellow;
    if (v < 8) return AppColors.orange;
    return AppColors.red;
  }
}

class _BenchmarkRow extends StatelessWidget {
  final String label;
  final double value;
  final double maxValue;
  final Color color;
  final bool isYou;

  const _BenchmarkRow({
    required this.label,
    required this.value,
    required this.maxValue,
    required this.color,
    this.isYou = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight:
                    isYou ? FontWeight.w700 : FontWeight.w400,
                color: isYou ? color : AppColors.textSecondary,
              ),
            ),
            Text(
              '${value.toStringAsFixed(1)} t',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: (value / maxValue).clamp(0.0, 1.0),
            minHeight: isYou ? 10 : 6,
            backgroundColor: color.withAlpha(20),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final List<FootprintSnapshot> history;
  const _HistoryCard({required this.history});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.historyTitle,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                if (history.length >= 2)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      l10n.historyMeasurements(history.length),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (history.isEmpty) _HistoryEmpty(l10n: l10n),
            if (history.length == 1) _HistoryOne(snapshot: history.first, l10n: l10n),
            if (history.length >= 2) _HistoryChart(history: history, l10n: l10n),
          ],
        ),
      ),
    );
  }
}

class _HistoryEmpty extends StatelessWidget {
  final dynamic l10n;
  const _HistoryEmpty({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(12),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.show_chart_rounded,
                  size: 36, color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.historyEmptyTitle,
              style: GoogleFonts.inter(
                  fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.historyEmptySub,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryOne extends StatelessWidget {
  final FootprintSnapshot snapshot;
  final dynamic l10n;
  const _HistoryOne({required this.snapshot, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('d MMM yyyy');
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.flag_rounded,
                  color: AppColors.primary, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.historyOneMeasurement,
                    style: GoogleFonts.inter(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    fmt.format(snapshot.date),
                    style: GoogleFonts.inter(
                        fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            Text(
              '${snapshot.totalCO2.toStringAsFixed(2)} t',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          l10n.historyOneSub,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.textHint,
              height: 1.5),
        ),
      ],
    );
  }
}

class _HistoryChart extends StatelessWidget {
  final List<FootprintSnapshot> history;
  final dynamic l10n;
  const _HistoryChart({required this.history, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final first = history.first.totalCO2;
    final last = history.last.totalCO2;
    final delta = (last - first) / first * 100;
    final improved = delta <= 0;
    final deltaColor = improved ? AppColors.green : AppColors.red;
    final deltaText = improved
        ? l10n.historyImproved(delta.abs().toStringAsFixed(1))
        : l10n.historyWorsened(delta.abs().toStringAsFixed(1));

    final minY =
        (history.map((s) => s.totalCO2).reduce((a, b) => a < b ? a : b) - 0.5)
            .clamp(0.0, double.infinity);
    final maxY =
        history.map((s) => s.totalCO2).reduce((a, b) => a > b ? a : b) + 0.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: deltaColor.withAlpha(18),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            deltaText,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: deltaColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: LineChart(
            LineChartData(
              minY: minY,
              maxY: maxY,
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    history.length,
                    (i) => FlSpot(i.toDouble(), history[i].totalCO2),
                  ),
                  isCurved: history.length > 3,
                  color: AppColors.primary,
                  barWidth: 2.5,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, pct, bar, idx) =>
                        FlDotCirclePainter(
                      radius: 4,
                      color: AppColors.primary,
                      strokeWidth: 2,
                      strokeColor: Colors.white,
                    ),
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.primary.withAlpha(20),
                  ),
                ),
              ],
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, meta) => Text(
                      '${value.toStringAsFixed(1)}t',
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          color: AppColors.textSecondary),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: history.length > 6
                        ? (history.length / 4).ceilToDouble()
                        : 1,
                    getTitlesWidget: (value, meta) {
                      final idx = value.round();
                      if (idx < 0 || idx >= history.length) {
                        return const SizedBox.shrink();
                      }
                      final d = history[idx].date;
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          DateFormat('d/M').format(d),
                          style: GoogleFonts.inter(
                              fontSize: 9,
                              color: AppColors.textSecondary),
                        ),
                      );
                    },
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: Colors.grey.shade200,
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('d MMM yyyy').format(history.first.date),
              style: GoogleFonts.inter(
                  fontSize: 10, color: AppColors.textHint),
            ),
            Text(
              DateFormat('d MMM yyyy').format(history.last.date),
              style: GoogleFonts.inter(
                  fontSize: 10, color: AppColors.textHint),
            ),
          ],
        ),
      ],
    );
  }
}

class _OffsetCalculatorCard extends StatelessWidget {
  final double totalCO2;
  const _OffsetCalculatorCard({required this.totalCO2});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final treesNeeded =
        (totalCO2 * 1000 / EmissionFactors.treeAbsorptionKgPerYear).ceil();
    final costUsd =
        (totalCO2 * EmissionFactors.carbonCreditPriceUsdPerTonne).round();
    final costMonthly = (costUsd / 12).round().clamp(1, 9999);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('🌍', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.offsetTitle,
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        l10n.offsetSubtitle,
                        style: GoogleFonts.inter(
                            fontSize: 12, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Metrics row
            Row(
              children: [
                Expanded(
                  child: _OffsetMetric(
                    emoji: '🌳',
                    value: l10n.offsetTreesValue(treesNeeded),
                    label: l10n.offsetTreesLabel,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _OffsetMetric(
                    emoji: '💳',
                    value: l10n.offsetCostValue(costUsd),
                    label: '${l10n.offsetCostMonthly(costMonthly)}\n${l10n.offsetCostLabel}',
                    color: const Color(0xFF1565C0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Reduce-first warning
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.yellow.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.yellow.withAlpha(60)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('⚠️', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.offsetReduceFirst,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l10n.offsetReduceFirstDesc,
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                              height: 1.4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Platforms
            Text(
              l10n.offsetPlatformsTitle,
              style: GoogleFonts.inter(
                  fontSize: 13, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            const _OffsetPlatformLink(
              emoji: '🌿',
              name: 'Gold Standard',
              description: 'goldstandard.org',
              url: 'https://www.goldstandard.org',
            ),
            const SizedBox(height: 8),
            const _OffsetPlatformLink(
              emoji: '🌲',
              name: 'Pachama',
              description: 'pachama.com',
              url: 'https://pachama.com',
            ),
            const SizedBox(height: 8),
            const _OffsetPlatformLink(
              emoji: '✈️',
              name: 'atmosfair',
              description: 'atmosfair.de',
              url: 'https://www.atmosfair.de',
            ),
            const SizedBox(height: 12),
            Text(
              l10n.offsetDisclaimer,
              style: GoogleFonts.inter(
                  fontSize: 10, color: AppColors.textHint, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _OffsetMetric extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;
  final Color color;

  const _OffsetMetric({
    required this.emoji,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
                fontSize: 11, color: AppColors.textSecondary, height: 1.3),
          ),
        ],
      ),
    );
  }
}

class _OffsetPlatformLink extends StatelessWidget {
  final String emoji;
  final String name;
  final String description;
  final String url;

  const _OffsetPlatformLink({
    required this.emoji,
    required this.name,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        html.AnchorElement(href: url)
          ..setAttribute('target', '_blank')
          ..click();
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: GoogleFonts.inter(
                          fontSize: 13, fontWeight: FontWeight.w700)),
                  Text(description,
                      style: GoogleFonts.inter(
                          fontSize: 11, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(Icons.open_in_new_rounded,
                size: 16, color: AppColors.textHint),
          ],
        ),
      ),
    );
  }
}

class _ShareCardButton extends StatelessWidget {
  const _ShareCardButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfileCardScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(60),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('🪪', style: TextStyle(fontSize: 22)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.shareMyLevel,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.shareSub,
                    style: GoogleFonts.inter(
                        fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white54, size: 16),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Helpers
// ──────────────────────────────────────────────────────────────────────────────

String _compactInt(int n) {
  if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
  if (n >= 10000) return '${(n / 1000).round()}K';
  if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
  return '$n';
}

// ──────────────────────────────────────────────────────────────────────────────
// Export result as image
// ──────────────────────────────────────────────────────────────────────────────

void _showExportSheet(BuildContext context, CarbonFootprint footprint) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _ExportBottomSheet(footprint: footprint),
  );
}

class _ExportBottomSheet extends StatefulWidget {
  final CarbonFootprint footprint;
  const _ExportBottomSheet({required this.footprint});

  @override
  State<_ExportBottomSheet> createState() => _ExportBottomSheetState();
}

class _ExportBottomSheetState extends State<_ExportBottomSheet> {
  final _captureKey = GlobalKey();
  bool _downloading = false;

  Future<void> _download() async {
    setState(() => _downloading = true);
    try {
      final boundary = _captureKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;
      final bytes = byteData.buffer.asUint8List();
      final base64str = base64Encode(bytes);
      html.AnchorElement()
        ..href = 'data:image/png;base64,$base64str'
        ..setAttribute('download', 'mi-huella-carbono.png')
        ..click();
      if (mounted) Navigator.pop(context);
    } catch (e) {
      debugPrint('Export error: $e');
    } finally {
      if (mounted) setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40, height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          RepaintBoundary(
            key: _captureKey,
            child: _ResultShareCard(footprint: widget.footprint),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _downloading ? null : _download,
              icon: _downloading
                  ? const SizedBox(
                      width: 16, height: 16,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.download_rounded),
              label: Text(
                _downloading ? '...' : l10n.downloadImage,
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultShareCard extends StatelessWidget {
  final CarbonFootprint footprint;
  const _ResultShareCard({required this.footprint});

  Color _levelColor(String level) {
    switch (level) {
      case 'champion': return AppColors.green;
      case 'conscious': return const Color(0xFF2196F3);
      case 'ontrack': return AppColors.yellow;
      case 'high': return AppColors.orange;
      default: return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fp = footprint;
    final color = _levelColor(fp.level);
    final userVal = fp.totalCO2;
    final maxVal =
        (userVal > EmissionFactors.globalAverage ? userVal : EmissionFactors.globalAverage) *
            1.15;
    final dateStr = DateFormat('MMMM yyyy').format(DateTime.now());

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(50), width: 1.5),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Brand header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, Color(0xFF2E7D32)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.eco_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  'FootCarbonPrint',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  dateStr,
                  style: GoogleFonts.inter(
                      fontSize: 11, color: Colors.white60),
                ),
              ],
            ),
          ),
          // CO₂ result
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 4),
            child: Column(
              children: [
                Text(fp.levelEmoji, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 8),
                Text(
                  fp.levelLabel,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      fp.totalCO2.toStringAsFixed(1),
                      style: GoogleFonts.inter(
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        color: color,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 4),
                      child: Text(
                        't CO₂/año',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Comparison bars
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: Column(
              children: [
                _ExportCompBar('Tú', userVal, color, maxVal),
                const SizedBox(height: 6),
                _ExportCompBar(
                    'Obj. París', EmissionFactors.parisTarget, AppColors.green, maxVal),
                const SizedBox(height: 6),
                _ExportCompBar(
                    'Colombia', EmissionFactors.colombiaAverage, AppColors.secondary, maxVal),
                const SizedBox(height: 6),
                _ExportCompBar(
                    'Mundo', EmissionFactors.globalAverage, AppColors.orange, maxVal),
              ],
            ),
          ),
          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: AppColors.background,
            child: Text(
              '🌍  yesithv.github.io/FootCarbonPrint-App',
              style: GoogleFonts.inter(
                  fontSize: 10, color: AppColors.textHint),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExportCompBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final double maxVal;
  const _ExportCompBar(this.label, this.value, this.color, this.maxVal);

  @override
  Widget build(BuildContext context) {
    final double frac = (value / maxVal).clamp(0.0, 1.0);
    return Row(
      children: [
        SizedBox(
          width: 76,
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: frac,
              minHeight: 10,
              backgroundColor: AppColors.accent.withAlpha(30),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 34,
          child: Text(
            '${value.toStringAsFixed(1)}t',
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: color,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
