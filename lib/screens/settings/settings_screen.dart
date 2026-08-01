import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/l10n/l10n_extensions.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/footprint_provider.dart';
import '../../providers/locale_provider.dart';
import '../../providers/theme_provider.dart';

/// Groups the app's personalization options in one place: display name, theme
/// (System / Light / Dark) and language (Automatic from device + the 5
/// supported languages).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Native endonyms — a language name is shown in its own language, so these
  // are intentionally not localized.
  static const _languageNames = {
    'en': 'English',
    'es': 'Español',
    'fr': 'Français',
    'pt': 'Português',
    'de': 'Deutsch',
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: context.palette.background,
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          _SectionCard(
            title: l10n.settingsName,
            icon: Icons.person_rounded,
            child: const _NameRow(),
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: l10n.settingsTheme,
            icon: Icons.palette_rounded,
            child: const _ThemeOptions(),
          ),
          const SizedBox(height: 16),
          _SectionCard(
            title: l10n.settingsLanguage,
            icon: Icons.language_rounded,
            child: _LanguageOptions(languageNames: _languageNames),
          ),
        ],
      ),
    );
  }
}

// ─── Section shell ────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  const _SectionCard(
      {required this.title, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.palette.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.palette.border),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: context.palette.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: context.palette.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

// ─── Name ─────────────────────────────────────────────────────────────────────

class _NameRow extends StatelessWidget {
  const _NameRow();

  Future<void> _edit(BuildContext context, FootprintProvider provider) async {
    final l10n = context.l10n;
    final ctrl = TextEditingController(text: provider.userName);
    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.nameDialogTitle,
            style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 18)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            hintText: l10n.nameDialogHint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.person_rounded),
          ),
          onSubmitted: (v) {
            provider.setUserName(v);
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text(l10n.cancel)),
          ElevatedButton(
            onPressed: () {
              provider.setUserName(ctrl.text);
              Navigator.pop(context);
            },
            child: Text(l10n.save),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final provider = context.watch<FootprintProvider>();
    final hasName = provider.userName.isNotEmpty;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _edit(context, provider),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                hasName ? provider.userName : l10n.addYourName,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: hasName ? FontWeight.w600 : FontWeight.w400,
                  color: hasName
                      ? context.palette.textPrimary
                      : context.palette.textSecondary,
                ),
              ),
            ),
            Icon(Icons.edit_rounded,
                size: 18, color: context.palette.textSecondary),
          ],
        ),
      ),
    );
  }
}

// ─── Theme ────────────────────────────────────────────────────────────────────

class _ThemeOptions extends StatelessWidget {
  const _ThemeOptions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final provider = context.watch<ThemeProvider>();
    final options = [
      (ThemeMode.system, Icons.brightness_auto_rounded, l10n.themeSystem),
      (ThemeMode.light, Icons.light_mode_rounded, l10n.themeLight),
      (ThemeMode.dark, Icons.dark_mode_rounded, l10n.themeDark),
    ];
    return Row(
      children: [
        for (final (mode, icon, label) in options) ...[
          Expanded(
            child: _ChoicePill(
              icon: icon,
              label: label,
              selected: provider.mode == mode,
              onTap: () => provider.setMode(mode),
            ),
          ),
          if (mode != ThemeMode.dark) const SizedBox(width: 10),
        ],
      ],
    );
  }
}

class _ChoicePill extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _ChoicePill(
      {required this.icon,
      required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primary = context.palette.primary;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: selected ? primary.withAlpha(20) : context.palette.background,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? primary : context.palette.border,
            width: selected ? 1.6 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 22,
                color: selected ? primary : context.palette.textSecondary),
            const SizedBox(height: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? primary : context.palette.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Language ─────────────────────────────────────────────────────────────────

class _LanguageOptions extends StatelessWidget {
  final Map<String, String> languageNames;
  const _LanguageOptions({required this.languageNames});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final provider = context.watch<LocaleProvider>();
    final current = provider.languageCode; // null = automatic

    Widget tile(String? code, String label) {
      final selected = current == code;
      return InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.read<LocaleProvider>().setLanguage(code),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected
                        ? context.palette.primary
                        : context.palette.textPrimary,
                  ),
                ),
              ),
              if (selected)
                Icon(Icons.check_rounded,
                    size: 20, color: context.palette.primary),
            ],
          ),
        ),
      );
    }

    final rows = <Widget>[tile(null, l10n.languageAuto)];
    for (final code in LocaleProvider.supported) {
      rows.add(Divider(height: 1, color: context.palette.border));
      rows.add(tile(code, languageNames[code] ?? code));
    }
    return Column(children: rows);
  }
}
