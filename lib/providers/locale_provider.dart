import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Holds an optional manual language override. When [locale] is null the app
/// follows the device language automatically (see the resolution callback in
/// `main.dart`); when set, that language is forced and persisted.
class LocaleProvider extends ChangeNotifier {
  static const _prefKey = 'app_locale';

  /// Languages the user can pick manually (must be a subset of the app's
  /// supported locales). `null` in the UI means "automatic (device)".
  static const supported = ['en', 'es', 'fr', 'pt', 'de'];

  Locale? _locale;

  Locale? get locale => _locale;

  /// Language code of the override, or null when following the device.
  String? get languageCode => _locale?.languageCode;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefKey);
    if (saved != null && supported.contains(saved)) {
      _locale = Locale(saved);
    } else {
      _locale = null;
    }
    notifyListeners();
  }

  /// Pass a language code to force it, or null to follow the device again.
  Future<void> setLanguage(String? code) async {
    final next = (code != null && supported.contains(code)) ? Locale(code) : null;
    if (_locale?.languageCode == next?.languageCode) return;
    _locale = next;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (next == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, next.languageCode);
    }
  }
}
