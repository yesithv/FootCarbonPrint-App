import 'package:flutter/material.dart';

/// Static brand constants. These are the light-mode values and the colors
/// that must stay identical in both modes (e.g. fills that carry white text).
/// Widgets should normally read colors through `context.palette` so they
/// adapt to the active theme.
class AppColors {
  static const primary = Color(0xFF1B5E20);
  static const primaryLight = Color(0xFF2E7D32);
  static const secondary = Color(0xFF66BB6A);
  static const accent = Color(0xFFA5D6A7);
  static const surface = Color(0xFFFFFFFF);
  static const background = Color(0xFFF1F8E9);
  static const cardBg = Color(0xFFFFFFFF);

  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF555555);
  static const textHint = Color(0xFF9E9E9E);

  static const border = Color(0xFFE0E7DA);

  // Footprint state scale (see DESIGN_SYSTEM §2.3). `green`/`aware`/`yellow`/
  // `orange`/`red` map to champion/conscious/onTrack/high/critical.
  static const green = Color(0xFF2E7D32);
  static const aware = Color(0xFF7CB342);
  static const yellow = Color(0xFFF9A825);
  static const orange = Color(0xFFE65100);
  static const red = Color(0xFFB71C1C);

  static const transport = Color(0xFF1565C0);
  static const food = Color(0xFF6A1B9A);
  static const home = Color(0xFFE65100);
  static const shopping = Color(0xFF00695C);
  static const waste = Color(0xFF4E342E);
  static const water = Color(0xFF0277BD);
}

/// Theme-aware palette. Registered as a [ThemeExtension] on both themes and
/// resolved through [PaletteContext.palette], so every color adapts when the
/// theme changes.
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.primary,
    required this.primaryLight,
    required this.secondary,
    required this.accent,
    required this.surface,
    required this.background,
    required this.cardBg,
    required this.textPrimary,
    required this.textSecondary,
    required this.textHint,
    required this.border,
    required this.green,
    required this.aware,
    required this.yellow,
    required this.orange,
    required this.red,
    required this.transport,
    required this.food,
    required this.home,
    required this.shopping,
    required this.waste,
    required this.water,
    required this.onCategory,
  });

  final Color primary;
  final Color primaryLight;
  final Color secondary;
  final Color accent;
  final Color surface;
  final Color background;
  final Color cardBg;
  final Color textPrimary;
  final Color textSecondary;
  final Color textHint;

  /// Subtle border / divider (used for card outlines, esp. in dark mode).
  final Color border;

  final Color green;

  /// "Consciente" state (green-lime) in the footprint scale.
  final Color aware;

  final Color yellow;
  final Color orange;
  final Color red;
  final Color transport;
  final Color food;
  final Color home;
  final Color shopping;
  final Color waste;
  final Color water;

  /// Foreground for text/icons placed on top of a category-colored fill
  /// (module headers, selected chips, completed cards).
  final Color onCategory;

  static const light = AppPalette(
    primary: AppColors.primary,
    primaryLight: AppColors.primaryLight,
    secondary: AppColors.secondary,
    accent: AppColors.accent,
    surface: AppColors.surface,
    background: AppColors.background,
    cardBg: AppColors.cardBg,
    textPrimary: AppColors.textPrimary,
    textSecondary: AppColors.textSecondary,
    textHint: AppColors.textHint,
    border: AppColors.border,
    green: AppColors.green,
    aware: AppColors.aware,
    yellow: AppColors.yellow,
    orange: AppColors.orange,
    red: AppColors.red,
    transport: AppColors.transport,
    food: AppColors.food,
    home: AppColors.home,
    shopping: AppColors.shopping,
    waste: AppColors.waste,
    water: AppColors.water,
    onCategory: Colors.white,
  );

  static const dark = AppPalette(
    primary: Color(0xFF81C784),
    primaryLight: Color(0xFF66BB6A),
    secondary: Color(0xFF66BB6A),
    accent: Color(0xFF2C3B2E),
    surface: Color(0xFF1B231C),
    background: Color(0xFF0F1511),
    cardBg: Color(0xFF1B231C),
    textPrimary: Color(0xFFE6EBE4),
    textSecondary: Color(0xFFADB6AC),
    textHint: Color(0xFF7F8A7F),
    border: Color(0xFF2C3B2E),
    green: Color(0xFF81C784),
    aware: Color(0xFFAED581),
    yellow: Color(0xFFFBC02D),
    orange: Color(0xFFFB8C00),
    red: Color(0xFFEF5350),
    transport: Color(0xFF64B5F6),
    food: Color(0xFFBA68C8),
    home: Color(0xFFFFA726),
    shopping: Color(0xFF4DB6AC),
    waste: Color(0xFFA1887F),
    water: Color(0xFF4FC3F7),
    onCategory: Color(0xFF0F1511),
  );

  @override
  AppPalette copyWith({
    Color? primary,
    Color? primaryLight,
    Color? secondary,
    Color? accent,
    Color? surface,
    Color? background,
    Color? cardBg,
    Color? textPrimary,
    Color? textSecondary,
    Color? textHint,
    Color? border,
    Color? green,
    Color? aware,
    Color? yellow,
    Color? orange,
    Color? red,
    Color? transport,
    Color? food,
    Color? home,
    Color? shopping,
    Color? waste,
    Color? water,
    Color? onCategory,
  }) {
    return AppPalette(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      surface: surface ?? this.surface,
      background: background ?? this.background,
      cardBg: cardBg ?? this.cardBg,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textHint: textHint ?? this.textHint,
      border: border ?? this.border,
      green: green ?? this.green,
      aware: aware ?? this.aware,
      yellow: yellow ?? this.yellow,
      orange: orange ?? this.orange,
      red: red ?? this.red,
      transport: transport ?? this.transport,
      food: food ?? this.food,
      home: home ?? this.home,
      shopping: shopping ?? this.shopping,
      waste: waste ?? this.waste,
      water: water ?? this.water,
      onCategory: onCategory ?? this.onCategory,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      background: Color.lerp(background, other.background, t)!,
      cardBg: Color.lerp(cardBg, other.cardBg, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textHint: Color.lerp(textHint, other.textHint, t)!,
      border: Color.lerp(border, other.border, t)!,
      green: Color.lerp(green, other.green, t)!,
      aware: Color.lerp(aware, other.aware, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      red: Color.lerp(red, other.red, t)!,
      transport: Color.lerp(transport, other.transport, t)!,
      food: Color.lerp(food, other.food, t)!,
      home: Color.lerp(home, other.home, t)!,
      shopping: Color.lerp(shopping, other.shopping, t)!,
      waste: Color.lerp(waste, other.waste, t)!,
      water: Color.lerp(water, other.water, t)!,
      onCategory: Color.lerp(onCategory, other.onCategory, t)!,
    );
  }

  /// Maps a footprint level key (`champion`/`conscious`/`ontrack`/`high`/
  /// `critical`, as produced by `CarbonFootprint.level`) to its state color.
  /// Single source of truth for the gauge, planet avatar, level chips and
  /// benchmark bars.
  Color stateColor(String level) {
    switch (level) {
      case 'champion':
        return green;
      case 'conscious':
        return aware;
      case 'ontrack':
        return yellow;
      case 'high':
        return orange;
      default:
        return red;
    }
  }

  /// Same scale resolved from a raw tCO₂ value (matches the thresholds in
  /// `CarbonFootprint.level`).
  Color stateColorForValue(double tco2) {
    if (tco2 < 1.5) return green;
    if (tco2 < 3.0) return aware;
    if (tco2 < 5.0) return yellow;
    if (tco2 < 8.0) return orange;
    return red;
  }
}

extension PaletteContext on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
