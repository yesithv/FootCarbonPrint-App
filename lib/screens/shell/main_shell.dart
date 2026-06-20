import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/footprint_provider.dart';
import '../test/test_hub_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../action_plan/action_plan_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => MainShellState();

  static MainShellState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainShellState>();
}

class MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  void goToTab(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Consumer<FootprintProvider>(
      builder: (context, provider, _) {
        final hasData = provider.completedCount > 0;

        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: const [
              TestHubScreen(),
              DashboardScreen(),
              ActionPlanScreen(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (i) => setState(() => _currentIndex = i),
            backgroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.black12,
            surfaceTintColor: Colors.transparent,
            indicatorColor: AppColors.primary.withAlpha(20),
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.assignment_outlined),
                selectedIcon: Icon(Icons.assignment_rounded,
                    color: AppColors.primary),
                label: 'Mi Test',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: !hasData && _currentIndex != 1,
                  backgroundColor: Colors.grey.shade300,
                  label: const Text('?',
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                  child: const Icon(Icons.bar_chart_outlined),
                ),
                selectedIcon: const Icon(Icons.bar_chart_rounded,
                    color: AppColors.primary),
                label: 'Mi Huella',
              ),
              NavigationDestination(
                icon: Badge(
                  isLabelVisible: !hasData && _currentIndex != 2,
                  backgroundColor: Colors.grey.shade300,
                  label: const Text('?',
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                  child: const Icon(Icons.emoji_events_outlined),
                ),
                selectedIcon: const Icon(Icons.emoji_events_rounded,
                    color: AppColors.primary),
                label: 'Plan',
              ),
            ],
          ),
        );
      },
    );
  }
}
