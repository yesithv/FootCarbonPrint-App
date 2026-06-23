import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/footprint_provider.dart';
import '../../models/gamification.dart';
import '../../core/constants/emission_factors.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FootprintProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _HeroHeader()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: _MainResultCard(provider: provider),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: _ComparisonCard(provider: provider),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: _TopSourcesCard(provider: provider),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: _AchievementsCard(provider: provider),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: _CTAButtons(),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 48)),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Hero header
// ──────────────────────────────────────────────────────────────────────────────

class _HeroHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B5E20), Color(0xFF2E7D32), Color(0xFF43A047)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            const Text('🎉', style: TextStyle(fontSize: 52)),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                l10n.resultsTitle,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                l10n.resultsSub,
                style: GoogleFonts.inter(fontSize: 14, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Main CO₂ result card (overlaps hero)
// ──────────────────────────────────────────────────────────────────────────────

class _MainResultCard extends StatelessWidget {
  final FootprintProvider provider;
  const _MainResultCard({required this.provider});

  Color _levelColor(String level) {
    switch (level) {
      case 'champion':
        return AppColors.green;
      case 'conscious':
        return AppColors.secondary;
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
    final l10n = context.l10n;
    final fp = provider.footprint;
    final color = _levelColor(fp.level);

    return Transform.translate(
      offset: const Offset(0, -24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withAlpha(70), width: 2),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(40),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Column(
          children: [
            Text(
              l10n.resultsYourFootprint,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  fp.totalCO2.toStringAsFixed(1),
                  style: GoogleFonts.inter(
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                    color: color,
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 6),
                  child: Text(
                    'tCO₂/año',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: color.withAlpha(18),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withAlpha(60)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(fp.levelEmoji, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Text(
                    l10n.localizedFootprintLevel(fp.level),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Comparison bars
// ──────────────────────────────────────────────────────────────────────────────

class _ComparisonCard extends StatelessWidget {
  final FootprintProvider provider;
  const _ComparisonCard({required this.provider});

  Color _userColor(double v) {
    if (v < 1.5) return AppColors.green;
    if (v < 3.0) return AppColors.secondary;
    if (v < 5.0) return AppColors.yellow;
    if (v < 8.0) return AppColors.orange;
    return AppColors.red;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final userVal = provider.footprint.totalCO2;
    final maxVal =
        (userVal > EmissionFactors.globalAverage ? userVal : EmissionFactors.globalAverage) *
            1.15;

    final items = [
      _CompItem(l10n.resultsYou, userVal, _userColor(userVal), isUser: true),
      _CompItem(l10n.resultsParis, EmissionFactors.parisTarget, AppColors.green),
      _CompItem(l10n.resultsColombia, EmissionFactors.colombiaAverage, AppColors.secondary),
      _CompItem(l10n.resultsWorld, EmissionFactors.globalAverage, AppColors.orange),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.resultsCompareTitle,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...items.map((item) => _CompBar(item: item, maxVal: maxVal)),
        ],
      ),
    );
  }
}

class _CompItem {
  final String label;
  final double value;
  final Color color;
  final bool isUser;
  const _CompItem(this.label, this.value, this.color, {this.isUser = false});
}

class _CompBar extends StatelessWidget {
  final _CompItem item;
  final double maxVal;
  const _CompBar({required this.item, required this.maxVal});

  @override
  Widget build(BuildContext context) {
    final double frac = (item.value / maxVal).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 82,
            child: Text(
              item.label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: item.isUser ? FontWeight.w700 : FontWeight.w500,
                color: item.isUser ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: frac,
                minHeight: item.isUser ? 16 : 12,
                backgroundColor: AppColors.accent.withAlpha(35),
                valueColor: AlwaysStoppedAnimation<Color>(item.color),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 38,
            child: Text(
              '${item.value.toStringAsFixed(1)}t',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: item.color,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Top 3 emission sources
// ──────────────────────────────────────────────────────────────────────────────

class _TopSourcesCard extends StatelessWidget {
  final FootprintProvider provider;
  const _TopSourcesCard({required this.provider});

  static const _categoryColors = {
    'Transporte': AppColors.transport,
    'Alimentación': AppColors.food,
    'Hogar': AppColors.home,
    'Consumo': AppColors.shopping,
    'Residuos': AppColors.waste,
    'Agua': AppColors.water,
  };

  static const _categoryIcons = {
    'Transporte': Icons.directions_car_rounded,
    'Alimentación': Icons.restaurant_rounded,
    'Hogar': Icons.home_rounded,
    'Consumo': Icons.shopping_bag_rounded,
    'Residuos': Icons.recycling_rounded,
    'Agua': Icons.water_drop_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fp = provider.footprint;
    final total = fp.totalCO2;

    final sorted = fp.breakdown.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final top3 = sorted.take(3).toList();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.resultsTopSources,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...top3.asMap().entries.map((entry) {
            final rank = entry.key + 1;
            final item = entry.value;
            final color = _categoryColors[item.key] ?? AppColors.primary;
            final icon = _categoryIcons[item.key] ?? Icons.circle;
            final pct = total > 0 ? (item.value / total * 100).round() : 0;
            final double frac =
                total > 0 ? (item.value / total).clamp(0.0, 1.0) : 0.0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: color.withAlpha(20),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '#$rank',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon, color: color, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.key,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              '${item.value.toStringAsFixed(2)}t · $pct%',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: LinearProgressIndicator(
                            value: frac,
                            minHeight: 7,
                            backgroundColor: color.withAlpha(18),
                            valueColor: AlwaysStoppedAnimation<Color>(color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Achievements (badges + level + points)
// ──────────────────────────────────────────────────────────────────────────────

class _AchievementsCard extends StatelessWidget {
  final FootprintProvider provider;
  const _AchievementsCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final points = GamificationData.computePoints(provider);
    final earnedIds = GamificationData.computeEarnedBadgeIds(provider);
    final level = GamificationData.levelForPoints(points);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.resultsAchievements,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: level.color.withAlpha(18),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: level.color.withAlpha(60)),
                ),
                child: Text(
                  l10n.resultsEcoPoints(points),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: level.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '${level.emoji} ${level.name}',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: GamificationData.allBadges.map((badge) {
              final earned = earnedIds.contains(badge.id);
              return Tooltip(
                message: badge.description,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: earned
                        ? AppColors.primary.withAlpha(14)
                        : Colors.grey.withAlpha(10),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: earned
                          ? AppColors.primary.withAlpha(55)
                          : Colors.grey.withAlpha(28),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ColorFiltered(
                        colorFilter: earned
                            ? const ColorFilter.mode(
                                Colors.transparent, BlendMode.dst)
                            : const ColorFilter.matrix([
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0.2126, 0.7152, 0.0722, 0, 0,
                                0, 0, 0, 0.4, 0,
                              ]),
                        child: Text(
                          badge.emoji,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        badge.name,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: earned
                              ? AppColors.textPrimary
                              : AppColors.textHint,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          if (earnedIds.length < GamificationData.allBadges.length) ...[
            const SizedBox(height: 12),
            Text(
              '${earnedIds.length}/${GamificationData.allBadges.length} ${l10n.resultsBadgesUnlocked}',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.textHint,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// CTA buttons
// ──────────────────────────────────────────────────────────────────────────────

class _CTAButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: () => Navigator.pop(context, 'dashboard'),
          icon: const Icon(Icons.bar_chart_rounded),
          label: Text(l10n.resultsViewDashboard),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => Navigator.pop(context, 'plan'),
          icon: const Icon(Icons.emoji_events_rounded),
          label: Text(l10n.resultsViewPlan),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 2),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// Shared decoration
// ──────────────────────────────────────────────────────────────────────────────

BoxDecoration _cardDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(8),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
