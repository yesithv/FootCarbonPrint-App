import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'providers/footprint_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/onboarding/splash_screen.dart';

void main() {
  runApp(const FootCarbonPrintApp());
}

class FootCarbonPrintApp extends StatelessWidget {
  const FootCarbonPrintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FootprintProvider()..load()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()..load()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) => MaterialApp(
          title: 'FootCarbonPrint',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeProvider.mode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // Auto-select the app language from the device's ordered list of
          // preferred locales: pick the first one we support (matched by
          // language code, ignoring region), falling back to English when the
          // device language isn't among en/es/fr/pt/de.
          localeListResolutionCallback: (deviceLocales, supportedLocales) {
            if (deviceLocales != null) {
              for (final device in deviceLocales) {
                for (final supported in supportedLocales) {
                  if (supported.languageCode == device.languageCode) {
                    return supported;
                  }
                }
              }
            }
            return const Locale('en');
          },
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
