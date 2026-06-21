import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final PageController _ctrl = PageController();
  int _page = 0;

  static final _lessons = [
    _Lesson(
      emoji: '🌡️',
      gradient: [Color(0xFFE53935), Color(0xFFFF7043)],
      title: 'El planeta\ntiene fiebre',
      body:
          'Imagina que la Tierra es tu cuerpo. Cuando tienes fiebre de solo 1°C, ya te sientes muy mal. La Tierra ya tiene 1.2°C más que hace 150 años… y sigue subiendo cada año.',
      factLabel: 'DATO',
      fact: '2023 fue el año más caluroso jamás registrado. Los 10 más calurosos de la historia han sido en los últimos 10 años.',
      visual: _ThermometerVisual(),
    ),
    _Lesson(
      emoji: '💨',
      gradient: [Color(0xFF1565C0), Color(0xFF0288D1)],
      title: 'El gas\ninvisible',
      body:
          'Cuando quemas gasolina, gas o carbón — o cuando se descompone comida — se libera CO₂. Este gas actúa como una manta: deja entrar el calor del sol, pero no lo deja salir. El planeta se calienta.',
      factLabel: 'ANALOGÍA',
      fact: 'Es como dejar el carro encendido dentro de un garaje cerrado. Solo que el garaje es toda la atmósfera de la Tierra.',
      visual: _GreenhouseVisual(),
    ),
    _Lesson(
      emoji: '👣',
      gradient: [Color(0xFF2E7D32), Color(0xFF43A047)],
      title: 'Tu huella\npersonal',
      body:
          'La "huella de carbono" es el total de CO₂ que produces tú en un año. Incluye todo lo que consumes: el bus que tomas, la hamburguesa que comes, la camiseta que compras, la ducha caliente que te das.',
      factLabel: 'EN COLOMBIA',
      fact: 'Un colombiano produce en promedio 1.8 toneladas de CO₂ al año. El promedio mundial es 4.7 t. La meta para salvar el planeta es llegar a 2 t antes de 2030.',
      visual: _FootprintVisual(),
    ),
    _Lesson(
      emoji: '📊',
      gradient: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
      title: '¿De dónde\nviene?',
      body:
          'No solo los carros contaminan. Tu huella viene de 6 grandes categorías de tu vida cotidiana. Algunas sorprenden: la carne de res emite más CO₂ que manejar un carro.',
      factLabel: 'LAS 6 CATEGORÍAS',
      fact: 'Transporte y alimentación juntos representan más del 55% de tu huella total.',
      visual: _CategoriesVisual(),
    ),
    _Lesson(
      emoji: '⚖️',
      gradient: [Color(0xFF00695C), Color(0xFF26A69A)],
      title: '¿Cuánto\nes mucho?',
      body:
          'Hay una meta global: para evitar los peores efectos del cambio climático, cada persona en el mundo necesita llegar a menos de 2 toneladas de CO₂ por año para 2030.',
      factLabel: 'COMPARATIVA',
      fact: 'Un ciudadano de EE.UU. produce 15 t/año. Un alemán: 9 t. Un colombiano: 1.8 t. Pero la calidad de vida no tiene que bajar para reducir la huella.',
      visual: _ComparisonVisual(),
    ),
    _Lesson(
      emoji: '🚀',
      gradient: [Color(0xFF1B5E20), Color(0xFF388E3C)],
      title: 'Tú puedes\ncambiar algo',
      body:
          'No necesitas ser un activista ni cambiar tu vida de un día para otro. Pequeños cambios en tus hábitos de transporte, alimentación y hogar pueden reducir tu huella hasta un 40%.',
      factLabel: 'EL PRIMER PASO',
      fact: 'Conocer tu huella es el primer paso. Lo que no se mide, no se puede mejorar. ¡Haz el test ahora!',
      visual: _ActionsVisual(),
    ),
  ];

  void _next() {
    if (_page < _lessons.length - 1) {
      _ctrl.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
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
    final lesson = _lessons[_page];
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
                total: _lessons.length,
                onClose: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _ctrl,
                  itemCount: _lessons.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (_, i) => _LessonPage(lesson: _lessons[i]),
                ),
              ),
              _BottomNav(
                page: _page,
                total: _lessons.length,
                onNext: _next,
                onPrev: _page > 0 ? _prev : null,
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
  final VoidCallback onClose;

  const _TopBar(
      {required this.page, required this.total, required this.onClose});

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
                  'Guía de Huella de Carbono',
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

  const _BottomNav(
      {required this.page,
      required this.total,
      required this.onNext,
      this.onPrev});

  @override
  Widget build(BuildContext context) {
    final isLast = page == total - 1;
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
                isLast ? '¡Hacer el test ahora! 🚀' : 'Siguiente →',
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
  const _ThermometerVisual();

  @override
  Widget build(BuildContext context) {
    final levels = [
      _TempLevel('+0.5°C', 'Leve derretimiento de glaciares', 0.2, false),
      _TempLevel('+1.2°C', 'Donde estamos hoy 📍', 0.45, true),
      _TempLevel('+2°C', 'Olas de calor extremas', 0.65, false),
      _TempLevel('+4°C', 'Civilización en riesgo', 1.0, false),
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
  const _GreenhouseVisual();

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
              _Step('☀️', 'Sol envía\ncalor'),
              const Icon(Icons.arrow_forward_rounded,
                  color: Colors.white70, size: 20),
              _Step('🌍', 'Tierra\nrecibe'),
              const Icon(Icons.arrow_forward_rounded,
                  color: Colors.white70, size: 20),
              _Step('💨', 'CO₂ atrapa\nel calor'),
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
              '🌡️ El calor no puede escapar → temperatura sube',
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
  const _FootprintVisual();

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
              'Colombia\npromedio',
              Colors.white,
              isHighlight: false,
            ),
          ),
          Container(width: 1, height: 50, color: Colors.white24),
          Expanded(
            child: _FootprintNum(
              '4.7 t',
              'Mundo\npromedio',
              Colors.white70,
              isHighlight: false,
            ),
          ),
          Container(width: 1, height: 50, color: Colors.white24),
          Expanded(
            child: _FootprintNum(
              '2.0 t',
              'Meta\n2030 🎯',
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
  const _CategoriesVisual();

  static const _cats = [
    _Cat('🚗', 'Transporte', 0.32, AppColors.transport),
    _Cat('🍽️', 'Alimentación', 0.26, AppColors.food),
    _Cat('🏠', 'Hogar', 0.22, AppColors.home),
    _Cat('🛍️', 'Consumo', 0.12, AppColors.shopping),
    _Cat('♻️', 'Residuos', 0.05, AppColors.waste),
    _Cat('💧', 'Agua', 0.03, AppColors.water),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: _cats
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
  const _ActionsVisual();

  static const _actions = [
    _QuickAction('🥗', 'Comer menos carne', '−0.8 t/año'),
    _QuickAction('🚌', 'Usar transporte público', '−0.35 t/año'),
    _QuickAction('✈️', 'Evitar 1 vuelo largo', '−1.5 t/año'),
    _QuickAction('💡', 'Cambiar a LED', '−0.15 t/año'),
  ];

  @override
  Widget build(BuildContext context) {
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
            'Acciones de alto impacto:',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          ..._actions.map(
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
