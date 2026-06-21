import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'providers/footprint_provider.dart';
import 'screens/onboarding/splash_screen.dart';

void main() {
  runApp(const FootCarbonPrintApp());
}

class FootCarbonPrintApp extends StatelessWidget {
  const FootCarbonPrintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FootprintProvider()..load(),
      child: MaterialApp(
        title: 'FootCarbonPrint',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SplashScreen(),
      ),
    );
  }
}
