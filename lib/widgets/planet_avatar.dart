import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// The signature "avatar-planeta": a stylised Earth sitting inside a ring that
/// is tinted by the user's footprint state color. The color animates smoothly
/// when the footprint (and therefore the state) changes — the app's "living"
/// reaction described in the design system (§7).
///
/// Used at different sizes across Home (~104), Results (~120) and the Eco Card
/// (~48). Pass the footprint level key (`champion`/`conscious`/`ontrack`/
/// `high`/`critical`).
class PlanetAvatar extends StatelessWidget {
  final String level;
  final double size;

  /// Optional emoji override. Defaults to the Earth planet.
  final String emoji;

  const PlanetAvatar({
    super.key,
    required this.level,
    this.size = 104,
    this.emoji = '🌍',
  });

  @override
  Widget build(BuildContext context) {
    final color = context.palette.stateColor(level);
    final ringWidth = size * 0.09;
    final glow = size * 0.14;

    return TweenAnimationBuilder<Color?>(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      tween: ColorTween(begin: color, end: color),
      builder: (context, animColor, child) {
        final c = animColor ?? color;
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: c.withAlpha(30),
            border: Border.all(color: c, width: ringWidth),
            boxShadow: [
              BoxShadow(
                color: c.withAlpha(60),
                blurRadius: glow,
                spreadRadius: glow * 0.2,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            emoji,
            style: TextStyle(fontSize: size * 0.46),
          ),
        );
      },
    );
  }
}
