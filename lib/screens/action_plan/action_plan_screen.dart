import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
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
            ); // goToTab(0) = Home, which has the "start test" button
          }
          final fp = provider.footprint;
          final actions = _buildActions(l10n, fp.breakdown, fp.totalCO2);
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            children: [
              _HeaderSection(total: fp.totalCO2),
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

  List<_Action> _buildActions(
      AppLocalizations l10n, Map<String, double> breakdown, double total) {
    final all = [
      _Action(
        id: 'flight',
        emoji: '✈️',
        title: l10n.actionFlightTitle,
        reduction: 1.5,
        category: l10n.modTransport,
        color: AppColors.transport,
        description: l10n.actionFlightDesc,
      ),
      _Action(
        id: 'flexitarian',
        emoji: '🥗',
        title: l10n.actionFlexitarianTitle,
        reduction: 0.8,
        category: l10n.modFood,
        color: AppColors.food,
        description: l10n.actionFlexitarianDesc,
      ),
      _Action(
        id: 'public_transport',
        emoji: '🚌',
        title: l10n.actionPublicTransportTitle,
        reduction: 0.35,
        category: l10n.modTransport,
        color: AppColors.transport,
        description: l10n.actionPublicTransportDesc,
      ),
      _Action(
        id: 'less_beef',
        emoji: '🥩',
        title: l10n.actionLessBeefTitle,
        reduction: 0.4,
        category: l10n.modFood,
        color: AppColors.food,
        description: l10n.actionLessBeefDesc,
      ),
      _Action(
        id: 'led',
        emoji: '💡',
        title: l10n.actionLedTitle,
        reduction: 0.15,
        category: l10n.modHome,
        color: AppColors.home,
        description: l10n.actionLedDesc,
      ),
      _Action(
        id: 'short_shower',
        emoji: '🛁',
        title: l10n.actionShortShowerTitle,
        reduction: 0.1,
        category: l10n.modWater,
        color: AppColors.water,
        description: l10n.actionShortShowerDesc,
      ),
      _Action(
        id: 'recycle',
        emoji: '♻️',
        title: l10n.actionRecycleTitle,
        reduction: 0.12,
        category: l10n.modWaste,
        color: AppColors.waste,
        description: l10n.actionRecycleDesc,
      ),
      _Action(
        id: 'secondhand',
        emoji: '👕',
        title: l10n.actionSecondhandTitle,
        reduction: 0.15,
        category: l10n.modShopping,
        color: AppColors.shopping,
        description: l10n.actionSecondhandDesc,
      ),
      _Action(
        id: 'compost',
        emoji: '🌱',
        title: l10n.actionCompostTitle,
        reduction: 0.08,
        category: l10n.modWaste,
        color: AppColors.waste,
        description: l10n.actionCompostDesc,
      ),
      _Action(
        id: 'bike',
        emoji: '🚴',
        title: l10n.actionBikeTitle,
        reduction: 0.3,
        category: l10n.modTransport,
        color: AppColors.transport,
        description: l10n.actionBikeDesc,
      ),
    ];

    all.sort((a, b) => b.reduction.compareTo(a.reduction));
    return all.take(6).toList();
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
  const _HeaderSection({required this.total});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const potential = 2.5;
    final reduced = (total - potential).clamp(0.0, total);
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
            '${reduced.toStringAsFixed(1)} tCO₂/año',
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
                  text: '−${a.reduction.toStringAsFixed(1)} tCO₂',
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
