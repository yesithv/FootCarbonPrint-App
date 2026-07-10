import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../models/gamification.dart';
import '../../providers/footprint_provider.dart';
import '../../providers/theme_provider.dart';
import '../shell/main_shell.dart';
import '../test/test_hub_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.background,
      body: Consumer<FootprintProvider>(
        builder: (context, provider, _) {
          if (!provider.loaded) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.completedCount == 0) {
            return _EmptyHome(
              userName: provider.userName,
              onStartTest: () => _openTest(context),
              onEditName: () => _showNameDialog(context, provider),
            );
          }
          return _HomeContent(
            provider: provider,
            onOpenTest: () => _openTest(context),
            onEditName: () => _showNameDialog(context, provider),
          );
        },
      ),
    );
  }

  void _openTest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TestHubScreen(
          onNavigate: (tab) {
            Navigator.pop(context);
            MainShell.of(context)?.goToTab(tab);
          },
        ),
      ),
    );
  }

  void _showNameDialog(BuildContext context, FootprintProvider provider) {
    final l10n = context.l10n;
    final ctrl = TextEditingController(text: provider.userName);
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.nameDialogTitle,
            style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 18)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            hintText: l10n.nameDialogHint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.person_rounded),
          ),
          onSubmitted: (v) {
            provider.setUserName(v);
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
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

// ─── Empty state ──────────────────────────────────────────────────────────────

class _EmptyHome extends StatelessWidget {
  final String userName;
  final VoidCallback onStartTest;
  final VoidCallback onEditName;
  const _EmptyHome(
      {required this.userName,
      required this.onStartTest,
      required this.onEditName});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomScrollView(
      slivers: [
        _HomeAppBar(userName: userName, onEditName: onEditName),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, Color(0xFF2E7D32)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Text('🌍', style: TextStyle(fontSize: 52)),
                ),
                const SizedBox(height: 28),
                Text(
                  l10n.homeWelcomeTitle,
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.homeWelcomeSub,
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: context.palette.textSecondary,
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onStartTest,
                    icon: const Icon(Icons.assignment_rounded),
                    label: Text(l10n.homeStartTest),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─── App Bar ──────────────────────────────────────────────────────────────────

class _ThemeMenuButton extends StatelessWidget {
  const _ThemeMenuButton();

  static const _options = [
    (ThemeMode.system, Icons.brightness_auto_rounded),
    (ThemeMode.light, Icons.light_mode_rounded),
    (ThemeMode.dark, Icons.dark_mode_rounded),
  ];

  String _label(BuildContext context, ThemeMode mode) => switch (mode) {
        ThemeMode.system => context.l10n.themeSystem,
        ThemeMode.light => context.l10n.themeLight,
        ThemeMode.dark => context.l10n.themeDark,
      };

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final mode = themeProvider.mode;
    final currentIcon =
        _options.firstWhere((o) => o.$1 == mode, orElse: () => _options.first).$2;

    return PopupMenuButton<ThemeMode>(
      tooltip: context.l10n.themeTooltip,
      icon: Icon(currentIcon, color: Colors.white70, size: 20),
      initialValue: mode,
      onSelected: themeProvider.setMode,
      itemBuilder: (context) => [
        for (final (option, icon) in _options)
          PopupMenuItem(
            value: option,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: option == mode
                      ? context.palette.primary
                      : context.palette.textSecondary,
                ),
                const SizedBox(width: 10),
                Text(
                  _label(context, option),
                  style: GoogleFonts.inter(
                    fontWeight:
                        option == mode ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  final String userName;
  final VoidCallback onEditName;
  const _HomeAppBar({required this.userName, required this.onEditName});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final greeting =
        userName.isNotEmpty ? l10n.greetingWithName(userName) : l10n.greetingEmpty;

    // Compact pinned bar: no expanded height, so scrolling back to the top
    // never opens an empty stretch of header above the greeting.
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: AppColors.primary,
      actions: [
        const _ThemeMenuButton(),
        IconButton(
          onPressed: onEditName,
          icon: Icon(
            userName.isEmpty ? Icons.person_add_rounded : Icons.edit_rounded,
            color: Colors.white70,
            size: 20,
          ),
          tooltip: userName.isEmpty ? l10n.addYourName : l10n.nameDialogTitle,
        ),
      ],
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white.withAlpha(45),
            child: userName.isNotEmpty
                ? Text(
                    userName[0].toUpperCase(),
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )
                : const Icon(Icons.eco_rounded, size: 15, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              greeting,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, Color(0xFF2E7D32)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}

// ─── Full home content ────────────────────────────────────────────────────────

class _HomeContent extends StatelessWidget {
  final FootprintProvider provider;
  final VoidCallback onOpenTest;
  final VoidCallback onEditName;
  const _HomeContent(
      {required this.provider,
      required this.onOpenTest,
      required this.onEditName});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _HomeAppBar(userName: provider.userName, onEditName: onEditName),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _HomeSummaryCard(provider: provider),
              const SizedBox(height: 20),
              _AchievementsCard(provider: provider),
              const SizedBox(height: 20),
              _WeeklyChallengeCard(provider: provider),
              const SizedBox(height: 20),
              _TestProgressCard(
                  provider: provider, onOpenTest: onOpenTest),
            ]),
          ),
        ),
      ],
    );
  }
}

// ─── Eco level summary card (gamification focus, no CO₂ number) ──────────────

class _HomeSummaryCard extends StatelessWidget {
  final FootprintProvider provider;
  const _HomeSummaryCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final pts = GamificationData.computePoints(provider);
    final level = GamificationData.levelForPoints(pts);
    final next = GamificationData.nextLevel(pts);
    final progress = GamificationData.levelProgress(pts);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [level.color, Color.lerp(level.color, Colors.black, 0.18)!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: level.color.withAlpha(90),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(level.emoji, style: const TextStyle(fontSize: 52)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.localizedEcoLevelName(level),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$pts ${l10n.ecoPoints}',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.white.withAlpha(40),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          if (next != null) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.nextLevelLabel(
                      next.emoji, l10n.localizedEcoLevelName(next)),
                  style: GoogleFonts.inter(
                      fontSize: 11, color: Colors.white70),
                ),
                Text(
                  l10n.ptsMore(next.minPoints - pts),
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 8),
            Text(
              l10n.maxLevelReached,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Achievements summary ─────────────────────────────────────────────────────

class _AchievementsCard extends StatelessWidget {
  final FootprintProvider provider;
  const _AchievementsCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
                  l10n.myAchievements,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: context.palette.primary.withAlpha(15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${earned.length}/${GamificationData.allBadges.length}',
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: context.palette.primary),
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
                  message: isEarned
                      ? l10n.localizedBadgeName(badge.id)
                      : l10n.badgeLocked(l10n.localizedBadgeDesc(badge.id)),
                  child: AnimatedOpacity(
                    opacity: isEarned ? 1.0 : 0.3,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isEarned
                            ? context.palette.primary.withAlpha(12)
                            : context.palette.background,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isEarned
                              ? context.palette.primary.withAlpha(60)
                              : context.palette.textHint.withAlpha(60),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(badge.emoji,
                              style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 4),
                          Text(
                            l10n.localizedBadgeName(badge.id),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: isEarned
                                  ? context.palette.textPrimary
                                  : context.palette.textSecondary,
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

// ─── Weekly challenge ─────────────────────────────────────────────────────────

class _WeeklyChallengeCard extends StatelessWidget {
  final FootprintProvider provider;
  const _WeeklyChallengeCard({required this.provider});

  String _title(int i, dynamic l10n) {
    switch (i) {
      case 0: return l10n.challenge1;
      case 1: return l10n.challenge2;
      case 2: return l10n.challenge3;
      default: return l10n.challenge4;
    }
  }

  String _desc(int i, dynamic l10n) {
    switch (i) {
      case 0: return l10n.challengeDesc1;
      case 1: return l10n.challengeDesc2;
      case 2: return l10n.challengeDesc3;
      default: return l10n.challengeDesc4;
    }
  }

  String _emoji(int i, dynamic l10n) {
    switch (i) {
      case 0: return l10n.challengeEmoji1;
      case 1: return l10n.challengeEmoji2;
      case 2: return l10n.challengeEmoji3;
      default: return l10n.challengeEmoji4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final idx = provider.currentChallengeIndex;
    final completed = provider.isCurrentChallengeCompleted;
    final activeColors = [const Color(0xFFF57C00), const Color(0xFFFF8F00)];
    final doneColors = [const Color(0xFF2E7D32), const Color(0xFF388E3C)];
    final colors = completed ? doneColors : activeColors;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: colors.first.withAlpha(80),
              blurRadius: 16,
              offset: const Offset(0, 6)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('🔥', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 6),
                Text(
                  l10n.challengeWeekLabel,
                  style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white70,
                      letterSpacing: 0.5),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    l10n.challengePts(25),
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_emoji(idx, l10n),
                    style: const TextStyle(fontSize: 40)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _title(idx, l10n),
                        style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            height: 1.2),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _desc(idx, l10n),
                        style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.white70,
                            height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            if (completed)
              Row(
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.challengeCompletedLabel,
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          l10n.challengeCompletedSub,
                          style: GoogleFonts.inter(
                              fontSize: 11, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => provider.completeCurrentChallenge(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: colors.first,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                      ),
                      child: Text(
                        l10n.challengeMarkDone,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      l10n.challengeExpiresLabel,
                      style: GoogleFonts.inter(
                          fontSize: 11, color: Colors.white54),
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

// ─── Test progress + update button ───────────────────────────────────────────

class _TestProgressCard extends StatelessWidget {
  final FootprintProvider provider;
  final VoidCallback onOpenTest;
  const _TestProgressCard(
      {required this.provider, required this.onOpenTest});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final completed = provider.completedCount;
    final pct = completed / 6;

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
                  l10n.homeModulesStatus(completed),
                  style: GoogleFonts.inter(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  '${(pct * 100).round()}%',
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: context.palette.primary),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 8,
                backgroundColor: context.palette.accent.withAlpha(80),
                valueColor:
                    AlwaysStoppedAnimation<Color>(context.palette.primary),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onOpenTest,
                icon: const Icon(Icons.assignment_rounded, size: 18),
                label: Text(
                  completed < 6
                      ? l10n.homeStartTest
                      : l10n.homeUpdateTest,
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.palette.primary,
                  side: BorderSide(color: context.palette.primary),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
