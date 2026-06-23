import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/constants/emission_factors.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../models/carbon_footprint.dart';
import '../../providers/footprint_provider.dart';
import '../shell/main_shell.dart';

class ActionPlanScreen extends StatelessWidget {
  const ActionPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.actionPlanTitle),
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<FootprintProvider>(
        builder: (context, provider, _) {
          if (provider.completedCount == 0) {
            return _EmptyState(
              onGoToTest: () => MainShell.of(context)?.goToTab(0),
            );
          }
          final fp = provider.footprint;
          final actions = _buildPersonalizedActions(l10n, fp);
          final potentialReduction =
              actions.fold(0.0, (sum, a) => sum + a.reduction);

          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            children: [
              _HeaderSection(
                total: fp.totalCO2,
                potentialReduction: potentialReduction,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.actionsTitle,
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.actionsSub,
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              ...actions.map((a) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ActionCard(action: a),
                  )),
              const SizedBox(height: 8),
              const _ChallengesSection(),
            ],
          );
        },
      ),
    );
  }

  // ── Personalized action builder ──────────────────────────────────────────
  //
  // Instead of showing a fixed list sorted by hardcoded savings, this method:
  //   1. Skips actions the user already performs.
  //   2. Computes realistic savings from the user's own emission values.
  //   3. Sorts by computed saving and returns the top 6.

  List<_Action> _buildPersonalizedActions(
      AppLocalizations l10n, CarbonFootprint fp) {
    final t = fp.transport;
    final f = fp.food;
    final h = fp.home;
    final s = fp.shopping;
    final w = fp.waste;
    final wa = fp.water;

    final breakdown = fp.breakdown;
    final transportCO2 = breakdown['Transporte'] ?? 0.0;
    final homeCO2 = breakdown['Hogar'] ?? 0.0;
    final shoppingCO2 = breakdown['Consumo'] ?? 0.0;
    final wasteCO2 = breakdown['Residuos'] ?? 0.0;

    final actions = <_Action>[];

    // ── TRANSPORT ────────────────────────────────────────────────────────────

    final totalFlights =
        t.shortFlights + t.mediumFlights + t.longFlights;
    if (totalFlights > 0) {
      // Saving = cost of eliminating the longest flight type the user takes.
      final longestFlight = t.longFlights > 0
          ? EmissionFactors.flightLong
          : (t.mediumFlights > 0
              ? EmissionFactors.flightMedium
              : EmissionFactors.flightShort);
      actions.add(_Action(
        id: 'flight',
        emoji: '✈️',
        title: l10n.actionFlightTitle,
        reduction: (longestFlight / 1000).clamp(0.25, 3.0),
        category: l10n.modTransport,
        color: AppColors.transport,
        description: l10n.actionFlightDesc,
      ));
    }

    if (['gasoline', 'diesel', 'hybrid', 'motorcycle']
        .contains(t.vehicle)) {
      // Switching 2 days/week ≈ 35 % of driving CO₂ avoided.
      actions.add(_Action(
        id: 'public_transport',
        emoji: '🚌',
        title: l10n.actionPublicTransportTitle,
        reduction: (transportCO2 * 0.35).clamp(0.10, 1.5),
        category: l10n.modTransport,
        color: AppColors.transport,
        description: l10n.actionPublicTransportDesc,
      ));

      if (t.vehicle != 'motorcycle') {
        actions.add(_Action(
          id: 'bike',
          emoji: '🚴',
          title: l10n.actionBikeTitle,
          reduction: (transportCO2 * 0.20).clamp(0.06, 0.8),
          category: l10n.modTransport,
          color: AppColors.transport,
          description: l10n.actionBikeDesc,
        ));
      }
    }

    // ── FOOD ─────────────────────────────────────────────────────────────────

    if (['omnivore', 'carnivore'].contains(f.diet)) {
      actions.add(_Action(
        id: 'flexitarian',
        emoji: '🥗',
        title: l10n.actionFlexitarianTitle,
        reduction: f.diet == 'carnivore' ? 1.2 : 0.8,
        category: l10n.modFood,
        color: AppColors.food,
        description: l10n.actionFlexitarianDesc,
      ));
    }

    if (f.beefServingsPerWeek >= 2) {
      // Cutting beef in half: save half of beef CO₂.
      final halfBeef = (f.beefServingsPerWeek / 2 * 0.35 * 52) / 1000;
      actions.add(_Action(
        id: 'less_beef',
        emoji: '🥩',
        title: l10n.actionLessBeefTitle,
        reduction: halfBeef.clamp(0.09, 1.0),
        category: l10n.modFood,
        color: AppColors.food,
        description: l10n.actionLessBeefDesc,
      ));
    }

    // ── HOME ─────────────────────────────────────────────────────────────────

    if (h.energySource != 'solar' && homeCO2 > 0.05) {
      // LEDs cut lighting ≈ 20 % of home energy.
      actions.add(_Action(
        id: 'led',
        emoji: '💡',
        title: l10n.actionLedTitle,
        reduction: (homeCO2 * 0.20).clamp(0.04, 0.30),
        category: l10n.modHome,
        color: AppColors.home,
        description: l10n.actionLedDesc,
      ));
    }

    // ── WATER ────────────────────────────────────────────────────────────────

    if (wa.showerTemp != 'cold' && wa.showerMinutes > 5) {
      final saveMins = wa.showerMinutes - 5;
      final tempFactor = wa.showerTemp == 'hot' ? 0.4 : 0.2;
      final saving = (saveMins * 365 * tempFactor) / 1000;
      actions.add(_Action(
        id: 'short_shower',
        emoji: '🚿',
        title: l10n.actionShortShowerTitle,
        reduction: saving.clamp(0.04, 0.40),
        category: l10n.modWater,
        color: AppColors.water,
        description: l10n.actionShortShowerDesc,
      ));
    }

    // ── WASTE ────────────────────────────────────────────────────────────────

    if (!w.separatesWaste) {
      actions.add(_Action(
        id: 'recycle',
        emoji: '♻️',
        title: l10n.actionRecycleTitle,
        reduction: (wasteCO2 * 0.30).clamp(0.02, 0.20),
        category: l10n.modWaste,
        color: AppColors.waste,
        description: l10n.actionRecycleDesc,
      ));
    }

    if (!w.composts) {
      actions.add(_Action(
        id: 'compost',
        emoji: '🌱',
        title: l10n.actionCompostTitle,
        reduction: (wasteCO2 * 0.20).clamp(0.02, 0.12),
        category: l10n.modWaste,
        color: AppColors.waste,
        description: l10n.actionCompostDesc,
      ));
    }

    // ── SHOPPING ─────────────────────────────────────────────────────────────

    if (!s.buysSecondHand) {
      actions.add(_Action(
        id: 'secondhand',
        emoji: '👕',
        title: l10n.actionSecondhandTitle,
        reduction: (shoppingCO2 * 0.30).clamp(0.04, 0.25),
        category: l10n.modShopping,
        color: AppColors.shopping,
        description: l10n.actionSecondhandDesc,
      ));
    }

    actions.sort((a, b) => b.reduction.compareTo(a.reduction));
    return actions.take(6).toList();
  }
}

// ── Header ──────────────────────────────────────────────────────────────────

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
              child: const Icon(Icons.emoji_events_rounded,
                  size: 64, color: AppColors.primary),
            ),
            const SizedBox(height: 28),
            Text(
              l10n.actionPlanEmptyTitle,
              style: GoogleFonts.inter(
                  fontSize: 22, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.actionPlanEmptySub,
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
              label: Text(l10n.goToTest),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final double total;
  final double potentialReduction;
  const _HeaderSection(
      {required this.total, required this.potentialReduction});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final reduced = potentialReduction.clamp(0.0, total);
    final pct = total > 0 ? (reduced / total * 100) : 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.reductionTitle,
            style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            '${reduced.toStringAsFixed(1)} ${l10n.co2Unit}',
            style: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          Text(
            l10n.reductionSub(pct.round()),
            style: GoogleFonts.inter(fontSize: 13, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: total > 0 ? (reduced / total).clamp(0.0, 1.0) : 0,
              minHeight: 10,
              backgroundColor: Colors.white24,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Action card ──────────────────────────────────────────────────────────────

class _ActionCard extends StatelessWidget {
  final _Action action;
  const _ActionCard({required this.action});

  @override
  Widget build(BuildContext context) {
    final a = action;
    return Consumer<FootprintProvider>(
      builder: (context, provider, _) {
        final committed = provider.isActionCommitted(a.id);
        return GestureDetector(
          onTap: () => provider.toggleCommitAction(a.id),
          child: _ActionCardContent(action: a, committed: committed),
        );
      },
    );
  }
}

class _ActionCardContent extends StatelessWidget {
  final _Action action;
  final bool committed;
  const _ActionCardContent(
      {required this.action, required this.committed});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final a = action;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: committed ? a.color.withAlpha(15) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: committed ? a.color : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(a.emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        a.title,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        a.description,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _Tag(
                  text: '−${a.reduction.toStringAsFixed(1)} t',
                  color: a.color,
                ),
                const SizedBox(width: 8),
                _Tag(
                  text: a.category,
                  color: a.color.withAlpha(40),
                  textColor: a.color,
                ),
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: committed ? a.color : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: a.color),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        committed ? l10n.committedLabel : l10n.commit,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: committed ? Colors.white : a.color,
                        ),
                      ),
                      if (committed) ...[
                        const SizedBox(width: 4),
                        Text('+15 pts',
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: Colors.white70,
                            )),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  const _Tag({required this.text, required this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}

// ── Weekly challenges ────────────────────────────────────────────────────────

class _ChallengesSection extends StatelessWidget {
  const _ChallengesSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final challenges = [
      _Challenge('🌱', l10n.challenge1),
      _Challenge('🥦', l10n.challenge2),
      _Challenge('🚴', l10n.challenge3),
      _Challenge('🚿', l10n.challenge4),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          l10n.challengesTitle,
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.challengesSub,
          style: GoogleFonts.inter(
              fontSize: 13, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 16),
        ...challenges.map((c) => _ChallengeCard(challenge: c)),
      ],
    );
  }
}

class _Challenge {
  final String emoji;
  final String title;
  const _Challenge(this.emoji, this.title);
}

class _ChallengeCard extends StatefulWidget {
  final _Challenge challenge;
  const _ChallengeCard({required this.challenge});

  @override
  State<_ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<_ChallengeCard> {
  bool _done = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => setState(() => _done = !_done),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: _done
                ? AppColors.primary.withAlpha(15)
                : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _done
                  ? AppColors.primary
                  : Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [
              Text(widget.challenge.emoji,
                  style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.challenge.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: _done
                        ? AppColors.primary
                        : AppColors.textPrimary,
                    decoration:
                        _done ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Icon(
                _done
                    ? Icons.check_circle_rounded
                    : Icons.circle_outlined,
                color:
                    _done ? AppColors.primary : Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Model ────────────────────────────────────────────────────────────────────

class _Action {
  final String id;
  final String emoji;
  final String title;
  final double reduction;
  final String category;
  final Color color;
  final String description;

  const _Action({
    required this.id,
    required this.emoji,
    required this.title,
    required this.reduction,
    required this.category,
    required this.color,
    required this.description,
  });
}
