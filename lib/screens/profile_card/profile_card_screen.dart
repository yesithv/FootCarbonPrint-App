import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../models/gamification.dart';
import '../../providers/footprint_provider.dart';

class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  Uint8List? _photoBytes;
  bool _isGenerating = false;
  final _cardKey = GlobalKey();

  Future<void> _handlePhotoOption() async {
    final l10n = context.l10n;
    final choice = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          l10n.photoDialogTitle,
          style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        content: Text(
          l10n.photoDialogContent,
          style: GoogleFonts.inter(
              fontSize: 14, color: AppColors.textSecondary, height: 1.5),
        ),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.emojiOnly),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.add_a_photo_rounded, size: 16),
            label: Text(l10n.choosePhoto),
          ),
        ],
      ),
    );

    if (choice == true && mounted) {
      final picker = ImagePicker();
      final file =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
      if (file != null && mounted) {
        final bytes = await file.readAsBytes();
        setState(() => _photoBytes = bytes);
      }
    }
  }

  Future<void> _downloadCard() async {
    final l10n = context.l10n;
    setState(() => _isGenerating = true);
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      final boundary = _cardKey.currentContext!.findRenderObject()
          as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      if (data == null || !mounted) return;
      final bytes = data.buffer.asUint8List();
      final blob = html.Blob([bytes], 'image/png');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute('download', 'footcarbonprint_nivel.png')
        ..click();
      html.Url.revokeObjectUrl(url);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.cardDownloaded,
                style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(l10n.profileCardTitle),
        backgroundColor: AppColors.background,
      ),
      body: Consumer<FootprintProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 40),
            child: Column(
              children: [
                Text(
                  l10n.profileCardPreview,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 13, color: AppColors.textSecondary),
                ),
                const SizedBox(height: 20),
                Center(
                  child: RepaintBoundary(
                    key: _cardKey,
                    child: _ShareCard(
                      provider: provider,
                      photoBytes: _photoBytes,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _handlePhotoOption,
                        icon: const Icon(Icons.add_a_photo_rounded, size: 18),
                        label: Text(
                          _photoBytes == null ? l10n.addPhoto : l10n.changePhoto,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _isGenerating ? null : _downloadCard,
                        icon: _isGenerating
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.download_rounded, size: 18),
                        label: Text(
                          _isGenerating ? l10n.generating : l10n.downloadPng,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.downloadHint,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 12, color: AppColors.textHint, height: 1.6),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ─── Card widget (used both in preview and rendered PNG) ─────────────────────

class _ShareCard extends StatelessWidget {
  final FootprintProvider provider;
  final Uint8List? photoBytes;

  const _ShareCard({required this.provider, this.photoBytes});

  List<Color> _gradientFor(EcoLevel level) {
    switch (level.name) {
      case 'Eco-Campeón':
        return [const Color(0xFF1B5E20), const Color(0xFF2E7D32),
                const Color(0xFFF9A825)];
      case 'Activista':
        return [const Color(0xFF4A148C), const Color(0xFF6A1B9A),
                const Color(0xFFAD1457)];
      case 'Consciente':
        return [const Color(0xFF1B5E20), const Color(0xFF2E7D32),
                const Color(0xFF00695C)];
      case 'Aprendiz':
        return [const Color(0xFF0D47A1), const Color(0xFF1565C0),
                const Color(0xFF0277BD)];
      default:
        return [const Color(0xFF263238), const Color(0xFF37474F),
                const Color(0xFF455A64)];
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final pts = GamificationData.computePoints(provider);
    final level = GamificationData.levelForPoints(pts);
    final earned = GamificationData.computeEarnedBadgeIds(provider);
    final fp = provider.footprint;
    final colors = _gradientFor(level);

    return Container(
      width: 360,
      height: 400,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.first.withAlpha(100),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _HexPainter())),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 22),
            child: Column(
              children: [
                const _CardTopBar(),
                const SizedBox(height: 22),
                _Avatar(
                  photoBytes: photoBytes,
                  levelEmoji: fp.levelEmoji,
                  levelColor: level.color,
                ),
                const SizedBox(height: 16),
                _LevelBadge(
                  levelEmoji: level.emoji,
                  levelName: l10n.localizedEcoLevelName(level),
                  levelColor: level.color,
                  pts: pts,
                ),
                const Spacer(),
                _StatsRow(
                  co2: fp.totalCO2,
                  modules: provider.completedCount,
                  badges: earned.length,
                  modulesLabel: l10n.statsModules,
                  achievementsLabel: l10n.statsAchievements,
                ),
                const SizedBox(height: 12),
                _CardFooter(footerText: l10n.cardFooterText),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  const _CardTopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.eco_rounded, color: Colors.white, size: 17),
        ),
        const SizedBox(width: 9),
        Text(
          'FootCarbonPrint',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.4,
          ),
        ),
        const Spacer(),
        Row(
          children: List.generate(
            3,
            (i) => Container(
              margin: const EdgeInsets.only(left: 4),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(i == 2 ? 200 : 80),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final Uint8List? photoBytes;
  final String levelEmoji;
  final Color levelColor;

  const _Avatar({
    this.photoBytes,
    required this.levelEmoji,
    required this.levelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      height: 106,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipOval(
        child: photoBytes != null
            ? Image.memory(photoBytes!, fit: BoxFit.cover)
            : Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                ),
                child: Center(
                  child: Text(
                    levelEmoji,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  final String levelEmoji;
  final String levelName;
  final Color levelColor;
  final int pts;

  const _LevelBadge({
    required this.levelEmoji,
    required this.levelName,
    required this.levelColor,
    required this.pts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(levelEmoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text(
            levelName,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: levelColor,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: levelColor.withAlpha(18),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$pts pts',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: levelColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final double co2;
  final int modules;
  final int badges;
  final String modulesLabel;
  final String achievementsLabel;

  const _StatsRow({
    required this.co2,
    required this.modules,
    required this.badges,
    required this.modulesLabel,
    required this.achievementsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(35),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlpha(35)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Stat(value: '${co2.toStringAsFixed(1)} t', label: 'CO₂/año'),
          _Divider(),
          _Stat(value: '$modules/6', label: modulesLabel),
          _Divider(),
          _Stat(value: '$badges/8', label: achievementsLabel),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 10, color: Colors.white54),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) =>
      Container(width: 1, height: 30, color: Colors.white24);
}

class _CardFooter extends StatelessWidget {
  final String footerText;
  const _CardFooter({required this.footerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.language_rounded, color: Colors.white30, size: 11),
        const SizedBox(width: 4),
        Text(
          'footcarbonprint.app  •  $footerText',
          style: GoogleFonts.inter(fontSize: 9, color: Colors.white30),
        ),
      ],
    );
  }
}

// ─── Hexagonal pattern background ────────────────────────────────────────────

class _HexPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withAlpha(20)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    const r = 24.0;
    const h = r * 1.732;

    for (double row = -r; row < size.height + r; row += h) {
      for (double col = -r * 1.5; col < size.width + r * 1.5; col += r * 3) {
        _hex(canvas, paint, Offset(col, row), r);
        _hex(canvas, paint, Offset(col + r * 1.5, row + h / 2), r);
      }
    }
  }

  void _hex(Canvas canvas, Paint paint, Offset c, double r) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final a = i * pi / 3 - pi / 6;
      final p = Offset(c.dx + r * cos(a), c.dy + r * sin(a));
      i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
