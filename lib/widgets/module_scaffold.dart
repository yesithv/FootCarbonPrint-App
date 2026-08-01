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

  /// When provided, the save bar shows a compact "live estimate" (left) next to
  /// the save button (right), per the design. When null, the classic
  /// full-width save button is used (keeps modules not yet migrated working).
  final double? liveEstimate;

  const ModuleScaffold({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.weight,
    required this.onSave,
    required this.children,
    this.liveEstimate,
  });

  @override
  Widget build(BuildContext context) {
    final onColor = context.palette.onCategory;
    return Scaffold(
      backgroundColor: context.palette.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 148,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: color,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: null,
              background: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 12, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back_rounded, color: onColor),
                            visualDensity: VisualDensity.compact,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.close_rounded, color: onColor),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Icon(icon, color: onColor, size: 34),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    title,
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: onColor,
                                    ),
                                  ),
                                  Text(
                                    weight,
                                    style: GoogleFonts.inter(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w500,
                                      color: onColor.withAlpha(210),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Accent rule at the base of the header band.
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        height: 4,
                        decoration: BoxDecoration(
                          color: onColor.withAlpha(60),
                          borderRadius: BorderRadius.circular(999),
                        ),
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
      bottomNavigationBar: _SaveBar(
        color: color,
        onSave: onSave,
        liveEstimate: liveEstimate,
      ),
    );
  }
}

class _SaveBar extends StatelessWidget {
  final Color color;
  final VoidCallback onSave;
  final double? liveEstimate;
  const _SaveBar({
    required this.color,
    required this.onSave,
    required this.liveEstimate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final onColor = context.palette.onCategory;

    final saveButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: onColor,
        minimumSize: liveEstimate == null
            ? const Size(double.infinity, 52)
            : const Size(150, 52),
      ),
      onPressed: onSave,
      child: Text(l10n.saveModule),
    );

    return Container(
      decoration: BoxDecoration(
        color: context.palette.cardBg,
        border: Border(top: BorderSide(color: context.palette.border)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: liveEstimate == null
              ? saveButton
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.moduleEstimate,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: context.palette.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${liveEstimate!.toStringAsFixed(2)} ${l10n.co2Unit}',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    saveButton,
                  ],
                ),
        ),
      ),
    );
  }
}
