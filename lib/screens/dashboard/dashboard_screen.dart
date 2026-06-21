import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/constants/emission_factors.dart';
import '../../core/theme/app_colors.dart';
import '../../models/gamification.dart';
import '../../providers/footprint_provider.dart';
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
              _AppBarSliver(level: fp.levelLabel, emoji: fp.levelEmoji),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _TotalCard(footprint: fp),
                    const SizedBox(height: 20),
                    _EquivalencesCard(footprint: fp),
                    const SizedBox(height: 20),
                    _PieChartCard(breakdown: fp.breakdown),
                    const SizedBox(height: 20),
                    _BenchmarkCard(total: fp.totalCO2),
                    const SizedBox(height: 20),
                    _GamificationLevelCard(provider: provider),
                    const SizedBox(height: 20),
                    _BadgesCard(provider: provider),
                    const SizedBox(height: 28),
                    ElevatedButton.icon(
                      onPressed: () =>
                          MainShell.of(context)?.goToTab(2),
                      icon: const Icon(Icons.emoji_events_rounded),
                      label: const Text('Ver mi Plan de Acción'),
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
              'Aún no tienes resultados',
              style: GoogleFonts.inter(
                  fontSize: 22, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Completa al menos un módulo del test para ver tu huella de carbono aquí.',
              style: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                  height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onGoToTest,
              icon: const Icon(Icons.assignment_rounded),
              label: const Text('Ir al test'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarSliver extends StatelessWidget {
  final String level;
  final String emoji;
  const _AppBarSliver({required this.level, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        title: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 8),
            Text(
              'Tu Huella de Carbono',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        background: Container(color: AppColors.primary),
      ),
    );
  }
}

class _TotalCard extends StatelessWidget {
  final dynamic footprint;
  const _TotalCard({required this.footprint});

  Color get _levelColor {
    switch (footprint.level) {
      case 'champion':
        return AppColors.green;
      case 'conscious':
        return const Color(0xFF2196F3);
      case 'ontrack':
        return AppColors.yellow;
      case 'high':
        return AppColors.orange;
      default:
        return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: _levelColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _levelColor.withAlpha(80),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            footprint.levelEmoji,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 12),
          Text(
            footprint.levelLabel,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${footprint.totalCO2.toStringAsFixed(2)}',
            style: GoogleFonts.inter(
              fontSize: 56,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
            ),
          ),
          Text(
            'toneladas CO₂/año',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white70,
            ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tu huella equivale a...',
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _EquivItem(
                  emoji: '🌳',
                  value: '${footprint.treesEquivalent}',
                  label: 'árboles\ntalados/año',
                ),
                const SizedBox(width: 12),
                _EquivItem(
                  emoji: '💡',
                  value: '${footprint.lightBulbYears}',
                  label: 'años de\nbombilla',
                ),
                const SizedBox(width: 12),
                _EquivItem(
                  emoji: '📱',
                  value: '${(footprint.totalCO2 * 1000 / 0.082).round()}',
                  label: 'cargas de\nsmartphone',
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
    final entries = widget.breakdown.entries.toList();
    final total = entries.fold<double>(0, (s, e) => s + e.value);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Desglose por categoría',
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
                      '${e.key} (${e.value.toStringAsFixed(2)}t)',
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comparativa global',
              style: GoogleFonts.inter(
                  fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            _BenchmarkRow(
              label: 'Tu huella',
              value: total,
              maxValue: 10,
              color: _colorForValue(total),
              isYou: true,
            ),
            const SizedBox(height: 12),
            _BenchmarkRow(
              label: 'Meta París 2050',
              value: EmissionFactors.parisTarget,
              maxValue: 10,
              color: AppColors.green,
            ),
            const SizedBox(height: 12),
            _BenchmarkRow(
              label: 'Colombia promedio',
              value: EmissionFactors.colombiaAverage,
              maxValue: 10,
              color: const Color(0xFF2196F3),
            ),
            const SizedBox(height: 12),
            _BenchmarkRow(
              label: 'Promedio mundial',
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

class _GamificationLevelCard extends StatelessWidget {
  final FootprintProvider provider;
  const _GamificationLevelCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final pts = GamificationData.computePoints(provider);
    final level = GamificationData.levelForPoints(pts);
    final next = GamificationData.nextLevel(pts);
    final progress = GamificationData.levelProgress(pts);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: level.color.withAlpha(20),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(level.emoji,
                        style: const TextStyle(fontSize: 26)),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        level.name,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: level.color,
                        ),
                      ),
                      Text(
                        '$pts puntos eco',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                backgroundColor: level.color.withAlpha(20),
                valueColor: AlwaysStoppedAnimation<Color>(level.color),
              ),
            ),
            const SizedBox(height: 8),
            if (next != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Siguiente: ${next.emoji} ${next.name}',
                    style: GoogleFonts.inter(
                        fontSize: 12, color: AppColors.textSecondary),
                  ),
                  Text(
                    '${next.minPoints - pts} pts más',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: level.color,
                    ),
                  ),
                ],
              )
            else
              Text(
                '¡Nivel máximo alcanzado! 🎉',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: level.color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _BadgesCard extends StatelessWidget {
  final FootprintProvider provider;
  const _BadgesCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final earned = GamificationData.computeEarnedBadgeIds(provider);

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
                  'Mis logros',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${earned.length}/${GamificationData.allBadges.length}',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: GamificationData.allBadges.map((badge) {
                final isEarned = earned.contains(badge.id);
                return Tooltip(
                  message:
                      isEarned ? badge.name : '🔒 ${badge.description}',
                  child: AnimatedOpacity(
                    opacity: isEarned ? 1.0 : 0.3,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isEarned
                            ? AppColors.primary.withAlpha(12)
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isEarned
                              ? AppColors.primary.withAlpha(60)
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(badge.emoji,
                              style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 4),
                          Text(
                            badge.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: isEarned
                                  ? AppColors.textPrimary
                                  : AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
