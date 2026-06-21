import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/footprint_provider.dart';
import 'modules/transport_module.dart';
import 'modules/food_module.dart';
import 'modules/home_module.dart';
import 'modules/shopping_module.dart';
import 'modules/waste_module.dart';
import 'modules/water_module.dart';
import '../shell/main_shell.dart';
import '../learn/learn_screen.dart';

class TestHubScreen extends StatelessWidget {
  const TestHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Consumer<FootprintProvider>(
          builder: (context, provider, _) {
            final modules = _buildModules(context, provider);
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _Header(provider: provider),
                ),
                SliverToBoxAdapter(
                  child: _LearnBanner(
                    isFirstTime: provider.completedCount == 0,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => modules[i],
                      childCount: modules.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.9,
                    ),
                  ),
                ),
                if (provider.completedCount > 0)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            MainShell.of(context)?.goToTab(1),
                        icon: const Icon(Icons.bar_chart_rounded),
                        label: const Text('Ver mi Huella de Carbono'),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildModules(
      BuildContext context, FootprintProvider provider) {
    final defs = [
      _ModuleDef(
        id: 'transport',
        label: 'Transporte',
        icon: Icons.directions_car_rounded,
        color: AppColors.transport,
        weight: '28–35%',
        screen: const TransportModule(),
      ),
      _ModuleDef(
        id: 'food',
        label: 'Alimentación',
        icon: Icons.restaurant_rounded,
        color: AppColors.food,
        weight: '25–30%',
        screen: const FoodModule(),
      ),
      _ModuleDef(
        id: 'home',
        label: 'Hogar',
        icon: Icons.home_rounded,
        color: AppColors.home,
        weight: '20–25%',
        screen: const HomeModule(),
      ),
      _ModuleDef(
        id: 'shopping',
        label: 'Consumo',
        icon: Icons.shopping_bag_rounded,
        color: AppColors.shopping,
        weight: '10–15%',
        screen: const ShoppingModule(),
      ),
      _ModuleDef(
        id: 'waste',
        label: 'Residuos',
        icon: Icons.recycling_rounded,
        color: AppColors.waste,
        weight: '5–8%',
        screen: const WasteModule(),
      ),
      _ModuleDef(
        id: 'water',
        label: 'Agua',
        icon: Icons.water_drop_rounded,
        color: AppColors.water,
        weight: '~3%',
        screen: const WaterModule(),
      ),
    ];

    return defs
        .map((d) => _ModuleCard(
              def: d,
              isComplete: provider.isModuleComplete(d.id),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => d.screen),
              ),
            ))
        .toList();
  }
}

class _Header extends StatelessWidget {
  final FootprintProvider provider;
  const _Header({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.eco_rounded,
                    color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                'FootCarbonPrint',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Tu Auto-Test de\nHuella de Carbono',
            style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Completa los módulos para conocer tu impacto',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          _ProgressBar(completed: provider.completedCount, total: 6),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int completed;
  final int total;
  const _ProgressBar({required this.completed, required this.total});

  @override
  Widget build(BuildContext context) {
    final pct = completed / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$completed de $total módulos',
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary),
            ),
            Text(
              '${(pct * 100).round()}%',
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: pct,
            minHeight: 8,
            backgroundColor: AppColors.accent.withAlpha(80),
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }
}

class _ModuleDef {
  final String id;
  final String label;
  final IconData icon;
  final Color color;
  final String weight;
  final Widget screen;

  const _ModuleDef({
    required this.id,
    required this.label,
    required this.icon,
    required this.color,
    required this.weight,
    required this.screen,
  });
}

class _ModuleCard extends StatelessWidget {
  final _ModuleDef def;
  final bool isComplete;
  final VoidCallback onTap;

  const _ModuleCard({
    required this.def,
    required this.isComplete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isComplete ? def.color : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isComplete ? def.color : def.color.withAlpha(50),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: def.color.withAlpha(isComplete ? 60 : 20),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isComplete
                          ? Colors.white.withAlpha(40)
                          : def.color.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      def.icon,
                      color: isComplete ? Colors.white : def.color,
                      size: 24,
                    ),
                  ),
                  if (isComplete)
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check_rounded,
                          color: def.color, size: 16),
                    ),
                ],
              ),
              const Spacer(),
              Text(
                def.label,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isComplete ? Colors.white : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                def.weight,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: isComplete
                      ? Colors.white70
                      : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isComplete ? 'Completado ✓' : 'Tocar para empezar',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isComplete
                      ? Colors.white70
                      : def.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LearnBanner extends StatelessWidget {
  final bool isFirstTime;
  const _LearnBanner({required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const LearnScreen()),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1B5E20), Color(0xFF388E3C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(50),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isFirstTime ? '📚' : '🌍',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isFirstTime
                          ? '¿Primera vez aquí?'
                          : 'Guía de Huella de Carbono',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      isFirstTime
                          ? 'Aprende qué es la huella de carbono en 2 minutos'
                          : 'Repasa los conceptos clave — 6 lecciones visuales',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white54, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
