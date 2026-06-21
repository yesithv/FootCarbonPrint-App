import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/footprint_provider.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final PageController _ctrl = PageController();
  int _page = 0;

  static List<_Lesson> _buildLessons(AppLocalizations l10n) => [
        _Lesson(
          emoji: '🌡️',
          gradient: const [Color(0xFFE53935), Color(0xFFFF7043)],
          title: l10n.l1Title,
          body: l10n.l1Body,
          factLabel: l10n.l1FactLabel,
          fact: l10n.l1Fact,
          visual: _ThermometerVisual(
            tempLow: l10n.l1TempLow,
            tempNow: l10n.l1TempNow,
            tempHeat: l10n.l1TempHeat,
            tempCrisis: l10n.l1TempCrisis,
          ),
        ),
        _Lesson(
          emoji: '💨',
          gradient: const [Color(0xFF1565C0), Color(0xFF0288D1)],
          title: l10n.l2Title,
          body: l10n.l2Body,
          factLabel: l10n.l2FactLabel,
          fact: l10n.l2Fact,
          visual: _GreenhouseVisual(
            step1: l10n.l2Step1,
            step2: l10n.l2Step2,
            step3: l10n.l2Step3,
            result: l10n.l2Result,
          ),
        ),
        _Lesson(
          emoji: '👣',
          gradient: const [Color(0xFF2E7D32), Color(0xFF43A047)],
          title: l10n.l3Title,
          body: l10n.l3Body,
          factLabel: l10n.l3FactLabel,
          fact: l10n.l3Fact,
          visual: _FootprintVisual(
            colombiaLabel: l10n.l3ColombiaLabel,
            worldLabel: l10n.l3WorldLabel,
            targetLabel: l10n.l3TargetLabel,
          ),
        ),
        _Lesson(
          emoji: '📊',
          gradient: const [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
          title: l10n.l4Title,
          body: l10n.l4Body,
          factLabel: l10n.l4FactLabel,
          fact: l10n.l4Fact,
          visual: _CategoriesVisual(
            transport: l10n.modTransport,
            food: l10n.modFood,
            home: l10n.modHome,
            shopping: l10n.modShopping,
            waste: l10n.modWaste,
            water: l10n.modWater,
          ),
        ),
        _Lesson(
          emoji: '⚖️',
          gradient: const [Color(0xFF00695C), Color(0xFF26A69A)],
          title: l10n.l5Title,
          body: l10n.l5Body,
          factLabel: l10n.l5FactLabel,
          fact: l10n.l5Fact,
          visual: const _ComparisonVisual(),
        ),
        _Lesson(
          emoji: '🚀',
          gradient: const [Color(0xFF1B5E20), Color(0xFF388E3C)],
          title: l10n.l6Title,
          body: l10n.l6Body,
          factLabel: l10n.l6FactLabel,
          fact: l10n.l6Fact,
          visual: _ActionsVisual(
            actionsLabel: l10n.l6ActionsLabel,
            action1: l10n.l6Action1,
            action2: l10n.l6Action2,
            action3: l10n.l6Action3,
            action4: l10n.l6Action4,
          ),
        ),
      ];

  void _next(AppLocalizations l10n) {
    final lessons = _buildLessons(l10n);
    if (_page < lessons.length - 1) {
      _ctrl.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
      context.read<FootprintProvider>().completeLearnGuide();
      Navigator.of(context).pop();
    }
  }

  void _prev() {
    _ctrl.previousPage(
        duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final lessons = _buildLessons(l10n);
    final lesson = lessons[_page];
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: lesson.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _TopBar(
                page: _page,
                total: lessons.length,
                title: l10n.learnGuideTitle,
                onClose: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _ctrl,
                  itemCount: lessons.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (_, i) => _LessonPage(lesson: lessons[i]),
                ),
              ),
              _BottomNav(
                page: _page,
                total: lessons.length,
                onNext: () => _next(l10n),
                onPrev: _page > 0 ? _prev : null,
                nextLabel: _page == lessons.length - 1
                    ? l10n.startTestNow
                    : l10n.learnNext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final int page;
  final int total;
  final String title;
  final VoidCallback onClose;

  const _TopBar(
      {required this.page,
      required this.total,
      required this.title,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: (page + 1) / total,
                    minHeight: 4,
                    backgroundColor: Colors.white24,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close_rounded, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _LessonPage extends StatelessWidget {
  final _Lesson lesson;
  const _LessonPage({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lesson.emoji, style: const TextStyle(fontSize: 56)),
          const SizedBox(height: 16),
          Text(
            lesson.title,
            style: GoogleFonts.inter(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            lesson.body,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 24),
          lesson.visual,
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(30),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    lesson.factLabel,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: lesson.gradient[0],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    lesson.fact,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int page;
  final int total;
  final VoidCallback onNext;
  final VoidCallback? onPrev;
  final String nextLabel;

  const _BottomNav(
      {required this.page,
      required this.total,
      required this.onNext,
      required this.nextLabel,
      this.onPrev});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Row(
        children: [
          if (onPrev != null)
            OutlinedButton(
              onPressed: onPrev,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Icon(Icons.arrow_back_rounded),
            ),
          if (onPrev != null) const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: Text(
                nextLabel,
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${page + 1}/$total',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white60,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Visuales por lección ────────────────────────────────────────────────────

class _ThermometerVisual extends StatelessWidget {
  final String tempLow;
  final String tempNow;
  final String tempHeat;
  final String tempCrisis;

  const _ThermometerVisual({
    required this.tempLow,
    required this.tempNow,
    required this.tempHeat,
    required this.tempCrisis,
  });

  @override
  Widget build(BuildContext context) {
    final levels = [
      _TempLevel('+0.5°C', tempLow, 0.2, false),
      _TempLevel('+1.2°C', tempNow, 0.45, true),
      _TempLevel('+2°C', tempHeat, 0.65, false),
      _TempLevel('+4°C', tempCrisis, 1.0, false),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: levels
            .map((l) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        child: Text(
                          l.label,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: l.current
                                ? FontWeight.w800
                                : FontWeight.w500,
                            color: l.current ? Colors.white : Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: l.value,
                            minHeight: l.current ? 12 : 8,
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              l.current ? Colors.white : Colors.white54,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 120,
                        child: Text(
                          l.description,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: l.current ? Colors.white : Colors.white60,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _TempLevel {
  final String label;
  final String description;
  final double value;
  final bool current;
  const _TempLevel(this.label, this.description, this.value, this.current);
}

class _GreenhouseVisual extends StatelessWidget {
  final String step1;
  final String step2;
  final String step3;
  final String result;

  const _GreenhouseVisual({
    required this.step1,
    required this.step2,
    required this.step3,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Step('☀️', step1),
              const Icon(Icons.arrow_forward_rounded,
                  color: Colors.white70, size: 20),
              _Step('🌍', step2),
              const Icon(Icons.arrow_forward_rounded,
                  color: Colors.white70, size: 20),
              _Step('💨', step3),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(20),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final String emoji;
  final String label;
  const _Step(this.emoji, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 10, color: Colors.white70),
        ),
      ],
    );
  }
}

class _FootprintVisual extends StatelessWidget {
  final String colombiaLabel;
  final String worldLabel;
  final String targetLabel;

  const _FootprintVisual({
    required this.colombiaLabel,
    required this.worldLabel,
    required this.targetLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: _FootprintNum(
              '1.8 t',
              colombiaLabel,
              Colors.white,
              isHighlight: false,
            ),
          ),
          Container(width: 1, height: 50, color: Colors.white24),
          Expanded(
            child: _FootprintNum(
              '4.7 t',
              worldLabel,
              Colors.white70,
              isHighlight: false,
            ),
          ),
          Container(width: 1, height: 50, color: Colors.white24),
          Expanded(
            child: _FootprintNum(
              '2.0 t',
              targetLabel,
              Colors.white,
              isHighlight: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _FootprintNum extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final bool isHighlight;
  const _FootprintNum(this.value, this.label, this.color,
      {required this.isHighlight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: isHighlight ? 22 : 18,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 10, color: Colors.white70),
        ),
      ],
    );
  }
}

class _CategoriesVisual extends StatelessWidget {
  final String transport;
  final String food;
  final String home;
  final String shopping;
  final String waste;
  final String water;

  const _CategoriesVisual({
    required this.transport,
    required this.food,
    required this.home,
    required this.shopping,
    required this.waste,
    required this.water,
  });

  @override
  Widget build(BuildContext context) {
    final cats = [
      _Cat('🚗', transport, 0.32, AppColors.transport),
      _Cat('🍽️', food, 0.26, AppColors.food),
      _Cat('🏠', home, 0.22, AppColors.home),
      _Cat('🛍️', shopping, 0.12, AppColors.shopping),
      _Cat('♻️', waste, 0.05, AppColors.waste),
      _Cat('💧', water, 0.03, AppColors.water),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: cats
            .map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(c.emoji, style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 72,
                        child: Text(
                          c.label,
                          style: GoogleFonts.inter(
                              fontSize: 11, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: c.pct,
                            minHeight: 10,
                            backgroundColor: Colors.white24,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white.withAlpha(200)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${(c.pct * 100).round()}%',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _Cat {
  final String emoji;
  final String label;
  final double pct;
  final Color color;
  const _Cat(this.emoji, this.label, this.pct, this.color);
}

class _ComparisonVisual extends StatelessWidget {
  const _ComparisonVisual();

  static const _countries = [
    _Country('🇺🇸', 'EE.UU.', 15.0, Color(0xFFEF5350)),
    _Country('🇩🇪', 'Alemania', 9.0, Color(0xFFFF7043)),
    _Country('🌍', 'Mundo', 4.7, Color(0xFFFFA726)),
    _Country('🎯', 'Meta 2030', 2.0, Color(0xFF66BB6A)),
    _Country('🇨🇴', 'Colombia', 1.8, Color(0xFF42A5F5)),
  ];

  @override
  Widget build(BuildContext context) {
    const maxVal = 15.0;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: _countries
            .map((c) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(c.flag, style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 68,
                        child: Text(
                          c.label,
                          style: GoogleFonts.inter(
                              fontSize: 11, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: c.value / maxVal,
                            minHeight: 10,
                            backgroundColor: Colors.white24,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(c.color),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${c.value} t',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class _Country {
  final String flag;
  final String label;
  final double value;
  final Color color;
  const _Country(this.flag, this.label, this.value, this.color);
}

class _ActionsVisual extends StatelessWidget {
  final String actionsLabel;
  final String action1;
  final String action2;
  final String action3;
  final String action4;

  const _ActionsVisual({
    required this.actionsLabel,
    required this.action1,
    required this.action2,
    required this.action3,
    required this.action4,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickAction('🥗', action1, '−0.8 t/año'),
      _QuickAction('🚌', action2, '−0.35 t/año'),
      _QuickAction('✈️', action3, '−1.5 t/año'),
      _QuickAction('💡', action4, '−0.15 t/año'),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            actionsLabel,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          ...actions.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(a.emoji, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      a.label,
                      style: GoogleFonts.inter(
                          fontSize: 13, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      a.saving,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction {
  final String emoji;
  final String label;
  final String saving;
  const _QuickAction(this.emoji, this.label, this.saving);
}

// ─── Modelos ─────────────────────────────────────────────────────────────────

class _Lesson {
  final String emoji;
  final List<Color> gradient;
  final String title;
  final String body;
  final String factLabel;
  final String fact;
  final Widget visual;

  const _Lesson({
    required this.emoji,
    required this.gradient,
    required this.title,
    required this.body,
    required this.factLabel,
    required this.fact,
    required this.visual,
  });
}
