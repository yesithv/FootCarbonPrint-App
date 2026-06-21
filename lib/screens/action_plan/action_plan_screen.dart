import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/footprint_provider.dart';
import '../shell/main_shell.dart';

class ActionPlanScreen extends StatelessWidget {
  const ActionPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Plan de Acción'),
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
          final actions = _buildActions(fp.breakdown, fp.totalCO2);
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            children: [
              _HeaderSection(total: fp.totalCO2),
              const SizedBox(height: 24),
              Text(
                'Tus top acciones por impacto',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                'Ordenadas de mayor a menor reducción potencial',
                style: GoogleFonts.inter(
                    fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              ...actions.map((a) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ActionCard(action: a),
                  )),
              const SizedBox(height: 8),
              _ChallengesSection(),
            ],
          );
        },
      ),
    );
  }

  List<_Action> _buildActions(
      Map<String, double> breakdown, double total) {
    final all = [
      _Action(
        id: 'flight',
        emoji: '✈️',
        title: 'Eliminar 1 vuelo largo al año',
        reduction: 1.5,
        difficulty: 'Media',
        category: 'Transporte',
        color: AppColors.transport,
        description: 'Un vuelo de larga distancia emite más CO₂ que 2 meses en auto.',
      ),
      _Action(
        id: 'flexitarian',
        emoji: '🥗',
        title: 'Adoptar dieta flexitariana',
        reduction: 0.8,
        difficulty: 'Media',
        category: 'Alimentación',
        color: AppColors.food,
        description: 'Reducir carne a 2–3 veces por semana genera un gran impacto.',
      ),
      _Action(
        id: 'public_transport',
        emoji: '🚌',
        title: 'Usar transporte público 2 días/semana',
        reduction: 0.35,
        difficulty: 'Baja',
        category: 'Transporte',
        color: AppColors.transport,
        description: 'Dejar el auto 2 días evita ~350 kg CO₂ al año.',
      ),
      _Action(
        id: 'less_beef',
        emoji: '🥩',
        title: 'Dejar carne de res 3 días/semana',
        reduction: 0.4,
        difficulty: 'Baja',
        category: 'Alimentación',
        color: AppColors.food,
        description: 'La carne de res emite 27 kgCO₂/kg — la más alta de todos los alimentos.',
      ),
      _Action(
        id: 'led',
        emoji: '💡',
        title: 'Cambiar a bombillas LED',
        reduction: 0.15,
        difficulty: 'Baja',
        category: 'Hogar',
        color: AppColors.home,
        description: 'Las LED consumen 75% menos energía que las incandescentes.',
      ),
      _Action(
        id: 'short_shower',
        emoji: '🛁',
        title: 'Duchas de máximo 5 minutos',
        reduction: 0.1,
        difficulty: 'Baja',
        category: 'Agua',
        color: AppColors.water,
        description: 'Reducir la ducha a 5 min con agua caliente evita 100 kgCO₂/año.',
      ),
      _Action(
        id: 'recycle',
        emoji: '♻️',
        title: 'Separar residuos para reciclaje',
        reduction: 0.12,
        difficulty: 'Baja',
        category: 'Residuos',
        color: AppColors.waste,
        description: 'El reciclaje evita la descomposición anaeróbica que genera metano.',
      ),
      _Action(
        id: 'secondhand',
        emoji: '👕',
        title: 'Comprar 50% ropa de segunda mano',
        reduction: 0.15,
        difficulty: 'Baja',
        category: 'Consumo',
        color: AppColors.shopping,
        description: 'La industria textil es una de las más contaminantes del mundo.',
      ),
      _Action(
        id: 'compost',
        emoji: '🌱',
        title: 'Compostar residuos orgánicos',
        reduction: 0.08,
        difficulty: 'Baja',
        category: 'Residuos',
        color: AppColors.waste,
        description: 'El compost evita que los residuos orgánicos generen metano en rellenos.',
      ),
      _Action(
        id: 'bike',
        emoji: '🚴',
        title: 'Ir en bici o caminar al trabajo',
        reduction: 0.3,
        difficulty: 'Media',
        category: 'Transporte',
        color: AppColors.transport,
        description: 'Cero emisiones + beneficios de salud.',
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
              'Aún no tienes plan',
              style: GoogleFonts.inter(
                  fontSize: 22, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Completa al menos un módulo del test para ver tu plan de acción personalizado.',
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

class _HeaderSection extends StatelessWidget {
  final double total;
  const _HeaderSection({required this.total});

  @override
  Widget build(BuildContext context) {
    final potential = 2.5;
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
            '¿Cuánto puedes reducir?',
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
            'hasta un ${pct.round()}% con las acciones de abajo',
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
                const SizedBox(width: 8),
                _DifficultyTag(difficulty: a.difficulty),
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
                      committed ? '✓ Comprometido' : 'Me comprometo',
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

class _DifficultyTag extends StatelessWidget {
  final String difficulty;
  const _DifficultyTag({required this.difficulty});

  Color get color => difficulty == 'Baja'
      ? AppColors.green
      : difficulty == 'Media'
          ? AppColors.yellow
          : AppColors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Text(
        difficulty,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _ChallengesSection extends StatelessWidget {
  const _ChallengesSection();

  @override
  Widget build(BuildContext context) {
    final challenges = [
      _Challenge('🌱', 'Semana sin plástico de un solo uso'),
      _Challenge('🥦', '7 días sin carne roja'),
      _Challenge('🚴', 'Ve en bici o camina 3 días esta semana'),
      _Challenge('🚿', 'Ducha de máximo 5 minutos por 5 días'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          'Retos semanales 🎯',
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          'Pequeños cambios con gran impacto',
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
  final String difficulty;
  final String category;
  final Color color;
  final String description;

  const _Action({
    required this.id,
    required this.emoji,
    required this.title,
    required this.reduction,
    required this.difficulty,
    required this.category,
    required this.color,
    required this.description,
  });
}
