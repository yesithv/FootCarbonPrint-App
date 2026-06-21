import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/l10n/l10n_extensions.dart';
import '../core/theme/app_colors.dart';

class ModuleScaffold extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String weight;
  final VoidCallback onSave;
  final List<Widget> children;

  const ModuleScaffold({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.weight,
    required this.onSave,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            backgroundColor: color,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              title: Row(
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              background: Container(
                color: color,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.white54, size: 48),
                      const SizedBox(height: 8),
                      Text(
                        weight,
                        style: GoogleFonts.inter(
                            fontSize: 13, color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: children[i],
                ),
                childCount: children.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: onSave,
            child: Text(context.l10n.saveModule),
          ),
        ),
      ),
    );
  }
}
