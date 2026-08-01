import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_colors.dart';

/// Semicircular "health check" gauge — the wow moment of the results screen
/// (design system §6.8). Five equal arc segments coloured by the footprint
/// state scale (champion → critical); a needle animates from 0 to the user's
/// value on reveal and lands in the matching colour band. The hero number sits
/// under the arc, tinted with the current state colour.
class FootprintGauge extends StatelessWidget {
  final double value;
  final String unit;
  final double size;

  const FootprintGauge({
    super.key,
    required this.value,
    required this.unit,
    this.size = 240,
  });

  // State band boundaries (tCO₂/yr). Each band occupies one equal arc segment
  // so the needle always sits in the colour that matches `CarbonFootprint.level`.
  static const _bounds = [0.0, 1.5, 3.0, 5.0, 8.0, 12.0];

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final segColors = [
      palette.green,
      palette.aware,
      palette.yellow,
      palette.orange,
      palette.red,
    ];
    final valueColor = palette.stateColorForValue(value);
    final arcHeight = size / 2 + 24;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutBack,
      tween: Tween(begin: 0, end: value),
      builder: (context, animValue, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size,
              height: arcHeight,
              child: CustomPaint(
                painter: _GaugePainter(
                  value: animValue,
                  segColors: segColors,
                  trackColor: palette.accent,
                  needleColor: valueColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value.toStringAsFixed(1),
                  style: GoogleFonts.inter(
                    fontSize: 46,
                    fontWeight: FontWeight.w800,
                    color: valueColor,
                    height: 1.0,
                  ),
                ),
              ],
            ),
            Text(
              unit,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: palette.textSecondary,
              ),
            ),
          ],
        );
      },
    );
  }

  static double fractionFor(double v) {
    final clamped = v.clamp(_bounds.first, _bounds.last - 0.0001);
    for (var i = 0; i < _bounds.length - 1; i++) {
      if (clamped < _bounds[i + 1]) {
        final local = (clamped - _bounds[i]) / (_bounds[i + 1] - _bounds[i]);
        return (i + local) / 5.0;
      }
    }
    return 1.0;
  }
}

class _GaugePainter extends CustomPainter {
  final double value;
  final List<Color> segColors;
  final Color trackColor;
  final Color needleColor;

  _GaugePainter({
    required this.value,
    required this.segColors,
    required this.trackColor,
    required this.needleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.11;
    final center = Offset(size.width / 2, size.height - stroke);
    final radius = size.width / 2 - stroke / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Top semicircle: left (π) → up → right (2π).
    const start = math.pi;
    const total = math.pi;
    final segSweep = total / segColors.length;

    for (var i = 0; i < segColors.length; i++) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.butt
        ..color = segColors[i];
      canvas.drawArc(rect, start + segSweep * i, segSweep, false, paint);
    }

    // Needle.
    final frac = FootprintGauge.fractionFor(value);
    final angle = start + total * frac;
    final needleLen = radius + stroke / 2 - 6;
    final tip = Offset(
      center.dx + needleLen * math.cos(angle),
      center.dy + needleLen * math.sin(angle),
    );
    final needlePaint = Paint()
      ..color = needleColor
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, tip, needlePaint);
    canvas.drawCircle(center, stroke * 0.34, Paint()..color = needleColor);
    canvas.drawCircle(
      center,
      stroke * 0.16,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.value != value || old.needleColor != needleColor;
}
