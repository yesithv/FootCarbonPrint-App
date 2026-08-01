import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

/// Compact equivalence / stat tile (emoji + big number + caption) used for the
/// "your impact, in images" row on the dashboard, results and Eco Card
/// (design system §6, stat tiles). Wrap in a Row of tiles; each one expands.
class StatTile extends StatelessWidget {
  final String emoji;
  final String value;
  final String label;

  /// When false the tile does not wrap itself in [Expanded] (use inside a
  /// non-flex parent such as a Wrap or fixed-width column).
  final bool expand;

  const StatTile({
    super.key,
    required this.emoji,
    required this.value,
    required this.label,
    this.expand = true,
  });

  @override
  Widget build(BuildContext context) {
    final tile = Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.palette.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.palette.border),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: context.palette.textPrimary,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 10,
              color: context.palette.textSecondary,
            ),
          ),
        ],
      ),
    );
    return expand ? Expanded(child: tile) : tile;
  }
}
