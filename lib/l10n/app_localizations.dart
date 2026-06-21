import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appName.
  ///
  /// In es, this message translates to:
  /// **'FootCarbonPrint'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In es, this message translates to:
  /// **'Conoce tu Huella. Cambia tu Mundo.'**
  String get tagline;

  /// No description provided for @save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @next.
  ///
  /// In es, this message translates to:
  /// **'Siguiente'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In es, this message translates to:
  /// **'Saltar'**
  String get skip;

  /// No description provided for @goToTest.
  ///
  /// In es, this message translates to:
  /// **'Ir al test'**
  String get goToTest;

  /// No description provided for @startTest.
  ///
  /// In es, this message translates to:
  /// **'¡Empezar mi test!'**
  String get startTest;

  /// No description provided for @startTestNow.
  ///
  /// In es, this message translates to:
  /// **'¡Hacer el test ahora! 🚀'**
  String get startTestNow;

  /// No description provided for @co2PerYear.
  ///
  /// In es, this message translates to:
  /// **'toneladas CO₂/año'**
  String get co2PerYear;

  /// No description provided for @co2Unit.
  ///
  /// In es, this message translates to:
  /// **'t CO₂/año'**
  String get co2Unit;

  /// No description provided for @moduleEstimate.
  ///
  /// In es, this message translates to:
  /// **'Estimado de este módulo'**
  String get moduleEstimate;

  /// No description provided for @saveModule.
  ///
  /// In es, this message translates to:
  /// **'Guardar módulo'**
  String get saveModule;

  /// No description provided for @completedCheck.
  ///
  /// In es, this message translates to:
  /// **'Completado ✓'**
  String get completedCheck;

  /// No description provided for @tapToStart.
  ///
  /// In es, this message translates to:
  /// **'Tocar para empezar'**
  String get tapToStart;

  /// No description provided for @onb1Title.
  ///
  /// In es, this message translates to:
  /// **'¿Cuánto contaminas\nsin saberlo?'**
  String get onb1Title;

  /// No description provided for @onb1Sub.
  ///
  /// In es, this message translates to:
  /// **'La mayoría de personas emite más CO₂ del que cree. En menos de 7 minutos descubre tu impacto real en el planeta.'**
  String get onb1Sub;

  /// No description provided for @onb2Title.
  ///
  /// In es, this message translates to:
  /// **'Tu huella,\nen datos reales'**
  String get onb2Title;

  /// No description provided for @onb2Sub.
  ///
  /// In es, this message translates to:
  /// **'Calculamos tu huella de carbono anual dividida por categorías: transporte, alimentación, hogar, consumo, residuos y agua.'**
  String get onb2Sub;

  /// No description provided for @onb3Title.
  ///
  /// In es, this message translates to:
  /// **'Un plan de acción\nque sí funciona'**
  String get onb3Title;

  /// No description provided for @onb3Sub.
  ///
  /// In es, this message translates to:
  /// **'No solo medimos — te decimos exactamente qué cambiar y cuánto CO₂ ahorras con cada acción. Paso a paso.'**
  String get onb3Sub;

  /// No description provided for @tabTest.
  ///
  /// In es, this message translates to:
  /// **'Mi Test'**
  String get tabTest;

  /// No description provided for @tabFootprint.
  ///
  /// In es, this message translates to:
  /// **'Mi Huella'**
  String get tabFootprint;

  /// No description provided for @tabPlan.
  ///
  /// In es, this message translates to:
  /// **'Plan'**
  String get tabPlan;

  /// No description provided for @testHubTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu Auto-Test de\nHuella de Carbono'**
  String get testHubTitle;

  /// No description provided for @testHubSub.
  ///
  /// In es, this message translates to:
  /// **'Completa los módulos para conocer tu impacto'**
  String get testHubSub;

  /// No description provided for @modulesProgress.
  ///
  /// In es, this message translates to:
  /// **'{completed} de {total} módulos'**
  String modulesProgress(int completed, int total);

  /// No description provided for @viewMyFootprint.
  ///
  /// In es, this message translates to:
  /// **'Ver mi Huella de Carbono'**
  String get viewMyFootprint;

  /// No description provided for @learnBannerFirstTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Primera vez aquí?'**
  String get learnBannerFirstTitle;

  /// No description provided for @learnBannerFirstSub.
  ///
  /// In es, this message translates to:
  /// **'Aprende qué es la huella de carbono en 2 minutos'**
  String get learnBannerFirstSub;

  /// No description provided for @learnBannerReturnTitle.
  ///
  /// In es, this message translates to:
  /// **'Guía de Huella de Carbono'**
  String get learnBannerReturnTitle;

  /// No description provided for @learnBannerReturnSub.
  ///
  /// In es, this message translates to:
  /// **'Repasa los conceptos clave — 6 lecciones visuales'**
  String get learnBannerReturnSub;

  /// No description provided for @modTransport.
  ///
  /// In es, this message translates to:
  /// **'Transporte'**
  String get modTransport;

  /// No description provided for @modTransportWeight.
  ///
  /// In es, this message translates to:
  /// **'28–35%'**
  String get modTransportWeight;

  /// No description provided for @modFood.
  ///
  /// In es, this message translates to:
  /// **'Alimentación'**
  String get modFood;

  /// No description provided for @modFoodWeight.
  ///
  /// In es, this message translates to:
  /// **'25–30%'**
  String get modFoodWeight;

  /// No description provided for @modHome.
  ///
  /// In es, this message translates to:
  /// **'Hogar'**
  String get modHome;

  /// No description provided for @modHomeWeight.
  ///
  /// In es, this message translates to:
  /// **'20–25%'**
  String get modHomeWeight;

  /// No description provided for @modShopping.
  ///
  /// In es, this message translates to:
  /// **'Consumo'**
  String get modShopping;

  /// No description provided for @modShoppingWeight.
  ///
  /// In es, this message translates to:
  /// **'10–15%'**
  String get modShoppingWeight;

  /// No description provided for @modWaste.
  ///
  /// In es, this message translates to:
  /// **'Residuos'**
  String get modWaste;

  /// No description provided for @modWasteWeight.
  ///
  /// In es, this message translates to:
  /// **'5–8%'**
  String get modWasteWeight;

  /// No description provided for @modWater.
  ///
  /// In es, this message translates to:
  /// **'Agua'**
  String get modWater;

  /// No description provided for @modWaterWeight.
  ///
  /// In es, this message translates to:
  /// **'~3%'**
  String get modWaterWeight;

  /// No description provided for @dashEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no tienes resultados'**
  String get dashEmptyTitle;

  /// No description provided for @dashEmptySub.
  ///
  /// In es, this message translates to:
  /// **'Completa al menos un módulo del test para ver tu huella de carbono aquí.'**
  String get dashEmptySub;

  /// No description provided for @dashAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu Huella de Carbono'**
  String get dashAppBarTitle;

  /// No description provided for @equivalencesTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu huella equivale a...'**
  String get equivalencesTitle;

  /// No description provided for @treesLabel.
  ///
  /// In es, this message translates to:
  /// **'árboles\ntalados/año'**
  String get treesLabel;

  /// No description provided for @bulbYearsLabel.
  ///
  /// In es, this message translates to:
  /// **'años de\nbombilla'**
  String get bulbYearsLabel;

  /// No description provided for @phoneChargesLabel.
  ///
  /// In es, this message translates to:
  /// **'cargas de\nsmartphone'**
  String get phoneChargesLabel;

  /// No description provided for @breakdownTitle.
  ///
  /// In es, this message translates to:
  /// **'Desglose por categoría'**
  String get breakdownTitle;

  /// No description provided for @benchmarkTitle.
  ///
  /// In es, this message translates to:
  /// **'Comparativa global'**
  String get benchmarkTitle;

  /// No description provided for @yourFootprint.
  ///
  /// In es, this message translates to:
  /// **'Tu huella'**
  String get yourFootprint;

  /// No description provided for @parisTarget.
  ///
  /// In es, this message translates to:
  /// **'Meta París 2050'**
  String get parisTarget;

  /// No description provided for @colombiaAvg.
  ///
  /// In es, this message translates to:
  /// **'Colombia promedio'**
  String get colombiaAvg;

  /// No description provided for @worldAvg.
  ///
  /// In es, this message translates to:
  /// **'Promedio mundial'**
  String get worldAvg;

  /// No description provided for @viewActionPlan.
  ///
  /// In es, this message translates to:
  /// **'Ver mi Plan de Acción'**
  String get viewActionPlan;

  /// No description provided for @ecoPoints.
  ///
  /// In es, this message translates to:
  /// **'puntos eco'**
  String get ecoPoints;

  /// No description provided for @nextLevelLabel.
  ///
  /// In es, this message translates to:
  /// **'Siguiente: {emoji} {name}'**
  String nextLevelLabel(String emoji, String name);

  /// No description provided for @ptsMore.
  ///
  /// In es, this message translates to:
  /// **'{pts} pts más'**
  String ptsMore(int pts);

  /// No description provided for @maxLevelReached.
  ///
  /// In es, this message translates to:
  /// **'¡Nivel máximo alcanzado! 🎉'**
  String get maxLevelReached;

  /// No description provided for @myAchievements.
  ///
  /// In es, this message translates to:
  /// **'Mis logros'**
  String get myAchievements;

  /// No description provided for @shareMyLevel.
  ///
  /// In es, this message translates to:
  /// **'Compartir mi nivel'**
  String get shareMyLevel;

  /// No description provided for @shareSub.
  ///
  /// In es, this message translates to:
  /// **'Descarga tu tarjeta eco y compártela en redes'**
  String get shareSub;

  /// No description provided for @lvlChampion.
  ///
  /// In es, this message translates to:
  /// **'Campeón Verde'**
  String get lvlChampion;

  /// No description provided for @lvlConscious.
  ///
  /// In es, this message translates to:
  /// **'Consciente'**
  String get lvlConscious;

  /// No description provided for @lvlOntrack.
  ///
  /// In es, this message translates to:
  /// **'En Camino'**
  String get lvlOntrack;

  /// No description provided for @lvlHigh.
  ///
  /// In es, this message translates to:
  /// **'Alto Impacto'**
  String get lvlHigh;

  /// No description provided for @lvlCritical.
  ///
  /// In es, this message translates to:
  /// **'Crítico'**
  String get lvlCritical;

  /// No description provided for @ecoLvlBeginner.
  ///
  /// In es, this message translates to:
  /// **'Principiante'**
  String get ecoLvlBeginner;

  /// No description provided for @ecoLvlLearner.
  ///
  /// In es, this message translates to:
  /// **'Aprendiz'**
  String get ecoLvlLearner;

  /// No description provided for @ecoLvlConscious.
  ///
  /// In es, this message translates to:
  /// **'Consciente'**
  String get ecoLvlConscious;

  /// No description provided for @ecoLvlActivist.
  ///
  /// In es, this message translates to:
  /// **'Activista'**
  String get ecoLvlActivist;

  /// No description provided for @ecoLvlChampion.
  ///
  /// In es, this message translates to:
  /// **'Eco-Campeón'**
  String get ecoLvlChampion;

  /// No description provided for @badgeFirstStep.
  ///
  /// In es, this message translates to:
  /// **'Primer Paso'**
  String get badgeFirstStep;

  /// No description provided for @badgeFirstStepDesc.
  ///
  /// In es, this message translates to:
  /// **'Completa tu primer módulo del test'**
  String get badgeFirstStepDesc;

  /// No description provided for @badgeExplorer.
  ///
  /// In es, this message translates to:
  /// **'Explorador'**
  String get badgeExplorer;

  /// No description provided for @badgeExplorerDesc.
  ///
  /// In es, this message translates to:
  /// **'Completa 3 módulos del test'**
  String get badgeExplorerDesc;

  /// No description provided for @badgeCompletionist.
  ///
  /// In es, this message translates to:
  /// **'Completista'**
  String get badgeCompletionist;

  /// No description provided for @badgeCompletionistDesc.
  ///
  /// In es, this message translates to:
  /// **'Completa los 6 módulos del test'**
  String get badgeCompletionistDesc;

  /// No description provided for @badgeEducated.
  ///
  /// In es, this message translates to:
  /// **'Educado'**
  String get badgeEducated;

  /// No description provided for @badgeEducatedDesc.
  ///
  /// In es, this message translates to:
  /// **'Termina la guía de aprendizaje'**
  String get badgeEducatedDesc;

  /// No description provided for @badgeConscious.
  ///
  /// In es, this message translates to:
  /// **'Consciente'**
  String get badgeConscious;

  /// No description provided for @badgeConsciousDesc.
  ///
  /// In es, this message translates to:
  /// **'Logra una huella menor a 3 toneladas'**
  String get badgeConsciousDesc;

  /// No description provided for @badgeChampion.
  ///
  /// In es, this message translates to:
  /// **'Huella Ligera'**
  String get badgeChampion;

  /// No description provided for @badgeChampionDesc.
  ///
  /// In es, this message translates to:
  /// **'Logra una huella menor a 1.5 toneladas'**
  String get badgeChampionDesc;

  /// No description provided for @badgeCommitted.
  ///
  /// In es, this message translates to:
  /// **'Comprometido'**
  String get badgeCommitted;

  /// No description provided for @badgeCommittedDesc.
  ///
  /// In es, this message translates to:
  /// **'Comprométete con al menos 1 acción'**
  String get badgeCommittedDesc;

  /// No description provided for @badgeActivist.
  ///
  /// In es, this message translates to:
  /// **'Activista'**
  String get badgeActivist;

  /// No description provided for @badgeActivistDesc.
  ///
  /// In es, this message translates to:
  /// **'Comprométete con 5 acciones del plan'**
  String get badgeActivistDesc;

  /// No description provided for @badgeLocked.
  ///
  /// In es, this message translates to:
  /// **'🔒 {description}'**
  String badgeLocked(String description);

  /// No description provided for @actionPlanTitle.
  ///
  /// In es, this message translates to:
  /// **'Plan de Acción'**
  String get actionPlanTitle;

  /// No description provided for @actionPlanEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no tienes plan'**
  String get actionPlanEmptyTitle;

  /// No description provided for @actionPlanEmptySub.
  ///
  /// In es, this message translates to:
  /// **'Completa al menos un módulo del test para ver tu plan de acción personalizado.'**
  String get actionPlanEmptySub;

  /// No description provided for @reductionTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cuánto puedes reducir?'**
  String get reductionTitle;

  /// No description provided for @reductionSub.
  ///
  /// In es, this message translates to:
  /// **'hasta un {pct}% con las acciones de abajo'**
  String reductionSub(int pct);

  /// No description provided for @actionsTitle.
  ///
  /// In es, this message translates to:
  /// **'Tus top acciones por impacto'**
  String get actionsTitle;

  /// No description provided for @actionsSub.
  ///
  /// In es, this message translates to:
  /// **'Ordenadas de mayor a menor reducción potencial'**
  String get actionsSub;

  /// No description provided for @commit.
  ///
  /// In es, this message translates to:
  /// **'Me comprometo'**
  String get commit;

  /// No description provided for @committedLabel.
  ///
  /// In es, this message translates to:
  /// **'✓ Comprometido'**
  String get committedLabel;

  /// No description provided for @challengesTitle.
  ///
  /// In es, this message translates to:
  /// **'Retos semanales 🎯'**
  String get challengesTitle;

  /// No description provided for @challengesSub.
  ///
  /// In es, this message translates to:
  /// **'Pequeños cambios con gran impacto'**
  String get challengesSub;

  /// No description provided for @actionFlightTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar 1 vuelo largo al año'**
  String get actionFlightTitle;

  /// No description provided for @actionFlightDesc.
  ///
  /// In es, this message translates to:
  /// **'Un vuelo de larga distancia emite más CO₂ que 2 meses en auto.'**
  String get actionFlightDesc;

  /// No description provided for @actionFlexitarianTitle.
  ///
  /// In es, this message translates to:
  /// **'Adoptar dieta flexitariana'**
  String get actionFlexitarianTitle;

  /// No description provided for @actionFlexitarianDesc.
  ///
  /// In es, this message translates to:
  /// **'Reducir carne a 2–3 veces por semana genera un gran impacto.'**
  String get actionFlexitarianDesc;

  /// No description provided for @actionPublicTransportTitle.
  ///
  /// In es, this message translates to:
  /// **'Usar transporte público 2 días/semana'**
  String get actionPublicTransportTitle;

  /// No description provided for @actionPublicTransportDesc.
  ///
  /// In es, this message translates to:
  /// **'Dejar el auto 2 días evita ~350 kg CO₂ al año.'**
  String get actionPublicTransportDesc;

  /// No description provided for @actionLessBeefTitle.
  ///
  /// In es, this message translates to:
  /// **'Dejar carne de res 3 días/semana'**
  String get actionLessBeefTitle;

  /// No description provided for @actionLessBeefDesc.
  ///
  /// In es, this message translates to:
  /// **'La carne de res emite 27 kgCO₂/kg — la más alta de todos los alimentos.'**
  String get actionLessBeefDesc;

  /// No description provided for @actionLedTitle.
  ///
  /// In es, this message translates to:
  /// **'Cambiar a bombillas LED'**
  String get actionLedTitle;

  /// No description provided for @actionLedDesc.
  ///
  /// In es, this message translates to:
  /// **'Las LED consumen 75% menos energía que las incandescentes.'**
  String get actionLedDesc;

  /// No description provided for @actionShortShowerTitle.
  ///
  /// In es, this message translates to:
  /// **'Duchas de máximo 5 minutos'**
  String get actionShortShowerTitle;

  /// No description provided for @actionShortShowerDesc.
  ///
  /// In es, this message translates to:
  /// **'Reducir la ducha a 5 min con agua caliente evita 100 kgCO₂/año.'**
  String get actionShortShowerDesc;

  /// No description provided for @actionRecycleTitle.
  ///
  /// In es, this message translates to:
  /// **'Separar residuos para reciclaje'**
  String get actionRecycleTitle;

  /// No description provided for @actionRecycleDesc.
  ///
  /// In es, this message translates to:
  /// **'El reciclaje evita la descomposición anaeróbica que genera metano.'**
  String get actionRecycleDesc;

  /// No description provided for @actionSecondhandTitle.
  ///
  /// In es, this message translates to:
  /// **'Comprar 50% ropa de segunda mano'**
  String get actionSecondhandTitle;

  /// No description provided for @actionSecondhandDesc.
  ///
  /// In es, this message translates to:
  /// **'La industria textil es una de las más contaminantes del mundo.'**
  String get actionSecondhandDesc;

  /// No description provided for @actionCompostTitle.
  ///
  /// In es, this message translates to:
  /// **'Compostar residuos orgánicos'**
  String get actionCompostTitle;

  /// No description provided for @actionCompostDesc.
  ///
  /// In es, this message translates to:
  /// **'El compost evita que los residuos orgánicos generen metano en rellenos.'**
  String get actionCompostDesc;

  /// No description provided for @actionBikeTitle.
  ///
  /// In es, this message translates to:
  /// **'Ir en bici o caminar al trabajo'**
  String get actionBikeTitle;

  /// No description provided for @actionBikeDesc.
  ///
  /// In es, this message translates to:
  /// **'Cero emisiones + beneficios de salud.'**
  String get actionBikeDesc;

  /// No description provided for @challenge1.
  ///
  /// In es, this message translates to:
  /// **'Semana sin plástico de un solo uso'**
  String get challenge1;

  /// No description provided for @challenge2.
  ///
  /// In es, this message translates to:
  /// **'7 días sin carne roja'**
  String get challenge2;

  /// No description provided for @challenge3.
  ///
  /// In es, this message translates to:
  /// **'Ve en bici o camina 3 días esta semana'**
  String get challenge3;

  /// No description provided for @challenge4.
  ///
  /// In es, this message translates to:
  /// **'Ducha de máximo 5 minutos por 5 días'**
  String get challenge4;

  /// No description provided for @learnGuideTitle.
  ///
  /// In es, this message translates to:
  /// **'Guía de Huella de Carbono'**
  String get learnGuideTitle;

  /// No description provided for @learnNext.
  ///
  /// In es, this message translates to:
  /// **'Siguiente →'**
  String get learnNext;

  /// No description provided for @l1Title.
  ///
  /// In es, this message translates to:
  /// **'El planeta\ntiene fiebre'**
  String get l1Title;

  /// No description provided for @l1Body.
  ///
  /// In es, this message translates to:
  /// **'Imagina que la Tierra es tu cuerpo. Cuando tienes fiebre de solo 1°C, ya te sientes muy mal. La Tierra ya tiene 1.2°C más que hace 150 años… y sigue subiendo cada año.'**
  String get l1Body;

  /// No description provided for @l1FactLabel.
  ///
  /// In es, this message translates to:
  /// **'DATO'**
  String get l1FactLabel;

  /// No description provided for @l1Fact.
  ///
  /// In es, this message translates to:
  /// **'2023 fue el año más caluroso jamás registrado. Los 10 más calurosos de la historia han sido en los últimos 10 años.'**
  String get l1Fact;

  /// No description provided for @l1TempLow.
  ///
  /// In es, this message translates to:
  /// **'Leve derretimiento de glaciares'**
  String get l1TempLow;

  /// No description provided for @l1TempNow.
  ///
  /// In es, this message translates to:
  /// **'Donde estamos hoy 📍'**
  String get l1TempNow;

  /// No description provided for @l1TempHeat.
  ///
  /// In es, this message translates to:
  /// **'Olas de calor extremas'**
  String get l1TempHeat;

  /// No description provided for @l1TempCrisis.
  ///
  /// In es, this message translates to:
  /// **'Civilización en riesgo'**
  String get l1TempCrisis;

  /// No description provided for @l2Title.
  ///
  /// In es, this message translates to:
  /// **'El gas\ninvisible'**
  String get l2Title;

  /// No description provided for @l2Body.
  ///
  /// In es, this message translates to:
  /// **'Cuando quemas gasolina, gas o carbón — o cuando se descompone comida — se libera CO₂. Este gas actúa como una manta: deja entrar el calor del sol, pero no lo deja salir. El planeta se calienta.'**
  String get l2Body;

  /// No description provided for @l2FactLabel.
  ///
  /// In es, this message translates to:
  /// **'ANALOGÍA'**
  String get l2FactLabel;

  /// No description provided for @l2Fact.
  ///
  /// In es, this message translates to:
  /// **'Es como dejar el carro encendido dentro de un garaje cerrado. Solo que el garaje es toda la atmósfera de la Tierra.'**
  String get l2Fact;

  /// No description provided for @l2Step1.
  ///
  /// In es, this message translates to:
  /// **'Sol envía\ncalor'**
  String get l2Step1;

  /// No description provided for @l2Step2.
  ///
  /// In es, this message translates to:
  /// **'Tierra\nrecibe'**
  String get l2Step2;

  /// No description provided for @l2Step3.
  ///
  /// In es, this message translates to:
  /// **'CO₂ atrapa\nel calor'**
  String get l2Step3;

  /// No description provided for @l2Result.
  ///
  /// In es, this message translates to:
  /// **'🌡️ El calor no puede escapar → temperatura sube'**
  String get l2Result;

  /// No description provided for @l3Title.
  ///
  /// In es, this message translates to:
  /// **'Tu huella\npersonal'**
  String get l3Title;

  /// No description provided for @l3Body.
  ///
  /// In es, this message translates to:
  /// **'La \"huella de carbono\" es el total de CO₂ que produces tú en un año. Incluye todo lo que consumes: el bus que tomas, la hamburguesa que comes, la camiseta que compras, la ducha caliente que te das.'**
  String get l3Body;

  /// No description provided for @l3FactLabel.
  ///
  /// In es, this message translates to:
  /// **'EN COLOMBIA'**
  String get l3FactLabel;

  /// No description provided for @l3Fact.
  ///
  /// In es, this message translates to:
  /// **'Un colombiano produce en promedio 1.8 toneladas de CO₂ al año. El promedio mundial es 4.7 t. La meta para salvar el planeta es llegar a 2 t antes de 2030.'**
  String get l3Fact;

  /// No description provided for @l3ColombiaLabel.
  ///
  /// In es, this message translates to:
  /// **'Colombia\npromedio'**
  String get l3ColombiaLabel;

  /// No description provided for @l3WorldLabel.
  ///
  /// In es, this message translates to:
  /// **'Mundo\npromedio'**
  String get l3WorldLabel;

  /// No description provided for @l3TargetLabel.
  ///
  /// In es, this message translates to:
  /// **'Meta\n2030 🎯'**
  String get l3TargetLabel;

  /// No description provided for @l4Title.
  ///
  /// In es, this message translates to:
  /// **'¿De dónde\nviene?'**
  String get l4Title;

  /// No description provided for @l4Body.
  ///
  /// In es, this message translates to:
  /// **'No solo los carros contaminan. Tu huella viene de 6 grandes categorías de tu vida cotidiana. Algunas sorprenden: la carne de res emite más CO₂ que manejar un carro.'**
  String get l4Body;

  /// No description provided for @l4FactLabel.
  ///
  /// In es, this message translates to:
  /// **'LAS 6 CATEGORÍAS'**
  String get l4FactLabel;

  /// No description provided for @l4Fact.
  ///
  /// In es, this message translates to:
  /// **'Transporte y alimentación juntos representan más del 55% de tu huella total.'**
  String get l4Fact;

  /// No description provided for @l5Title.
  ///
  /// In es, this message translates to:
  /// **'¿Cuánto\nes mucho?'**
  String get l5Title;

  /// No description provided for @l5Body.
  ///
  /// In es, this message translates to:
  /// **'Hay una meta global: para evitar los peores efectos del cambio climático, cada persona en el mundo necesita llegar a menos de 2 toneladas de CO₂ por año para 2030.'**
  String get l5Body;

  /// No description provided for @l5FactLabel.
  ///
  /// In es, this message translates to:
  /// **'COMPARATIVA'**
  String get l5FactLabel;

  /// No description provided for @l5Fact.
  ///
  /// In es, this message translates to:
  /// **'Un ciudadano de EE.UU. produce 15 t/año. Un alemán: 9 t. Un colombiano: 1.8 t. Pero la calidad de vida no tiene que bajar para reducir la huella.'**
  String get l5Fact;

  /// No description provided for @l6Title.
  ///
  /// In es, this message translates to:
  /// **'Tú puedes\ncambiar algo'**
  String get l6Title;

  /// No description provided for @l6Body.
  ///
  /// In es, this message translates to:
  /// **'No necesitas ser un activista ni cambiar tu vida de un día para otro. Pequeños cambios en tus hábitos de transporte, alimentación y hogar pueden reducir tu huella hasta un 40%.'**
  String get l6Body;

  /// No description provided for @l6FactLabel.
  ///
  /// In es, this message translates to:
  /// **'EL PRIMER PASO'**
  String get l6FactLabel;

  /// No description provided for @l6Fact.
  ///
  /// In es, this message translates to:
  /// **'Conocer tu huella es el primer paso. Lo que no se mide, no se puede mejorar. ¡Haz el test ahora!'**
  String get l6Fact;

  /// No description provided for @l6Action1.
  ///
  /// In es, this message translates to:
  /// **'Comer menos carne'**
  String get l6Action1;

  /// No description provided for @l6Action2.
  ///
  /// In es, this message translates to:
  /// **'Usar transporte público'**
  String get l6Action2;

  /// No description provided for @l6Action3.
  ///
  /// In es, this message translates to:
  /// **'Evitar 1 vuelo largo'**
  String get l6Action3;

  /// No description provided for @l6Action4.
  ///
  /// In es, this message translates to:
  /// **'Cambiar a LED'**
  String get l6Action4;

  /// No description provided for @l6ActionsLabel.
  ///
  /// In es, this message translates to:
  /// **'Acciones de alto impacto:'**
  String get l6ActionsLabel;

  /// No description provided for @profileCardTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Tarjeta Eco'**
  String get profileCardTitle;

  /// No description provided for @profileCardPreview.
  ///
  /// In es, this message translates to:
  /// **'Previsualización — comparte tu nivel en redes 🌍'**
  String get profileCardPreview;

  /// No description provided for @photoDialogTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Añadir tu foto?'**
  String get photoDialogTitle;

  /// No description provided for @photoDialogContent.
  ///
  /// In es, this message translates to:
  /// **'Puedes personalizar la tarjeta con tu foto de perfil, o dejar el emoji de tu nivel.'**
  String get photoDialogContent;

  /// No description provided for @emojiOnly.
  ///
  /// In es, this message translates to:
  /// **'Solo emoji'**
  String get emojiOnly;

  /// No description provided for @choosePhoto.
  ///
  /// In es, this message translates to:
  /// **'Elegir foto'**
  String get choosePhoto;

  /// No description provided for @addPhoto.
  ///
  /// In es, this message translates to:
  /// **'Añadir foto'**
  String get addPhoto;

  /// No description provided for @changePhoto.
  ///
  /// In es, this message translates to:
  /// **'Cambiar foto'**
  String get changePhoto;

  /// No description provided for @generating.
  ///
  /// In es, this message translates to:
  /// **'Generando...'**
  String get generating;

  /// No description provided for @downloadPng.
  ///
  /// In es, this message translates to:
  /// **'Descargar PNG'**
  String get downloadPng;

  /// No description provided for @cardDownloaded.
  ///
  /// In es, this message translates to:
  /// **'¡Tarjeta descargada! 🌿'**
  String get cardDownloaded;

  /// No description provided for @downloadHint.
  ///
  /// In es, this message translates to:
  /// **'La imagen se descarga en 1080×1080 px,\nideal para Instagram, WhatsApp y Twitter.'**
  String get downloadHint;

  /// No description provided for @cardFooterText.
  ///
  /// In es, this message translates to:
  /// **'Conoce tu huella. Cambia tu mundo.'**
  String get cardFooterText;

  /// No description provided for @statsModules.
  ///
  /// In es, this message translates to:
  /// **'Módulos'**
  String get statsModules;

  /// No description provided for @statsAchievements.
  ///
  /// In es, this message translates to:
  /// **'Logros'**
  String get statsAchievements;

  /// No description provided for @transportModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Transporte'**
  String get transportModuleTitle;

  /// No description provided for @transportModuleWeight.
  ///
  /// In es, this message translates to:
  /// **'28–35% de tu huella'**
  String get transportModuleWeight;

  /// No description provided for @transportQ1.
  ///
  /// In es, this message translates to:
  /// **'¿Cuál es tu medio de transporte principal?'**
  String get transportQ1;

  /// No description provided for @transportQ2.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántos km recorres por semana?'**
  String get transportQ2;

  /// No description provided for @transportKmHint.
  ///
  /// In es, this message translates to:
  /// **'{km} km/semana'**
  String transportKmHint(int km);

  /// No description provided for @transportQ3.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántos vuelos haces al año?'**
  String get transportQ3;

  /// No description provided for @flightShort.
  ///
  /// In es, this message translates to:
  /// **'Cortos (< 3h)'**
  String get flightShort;

  /// No description provided for @flightMedium.
  ///
  /// In es, this message translates to:
  /// **'Medios (3–6h)'**
  String get flightMedium;

  /// No description provided for @flightLong.
  ///
  /// In es, this message translates to:
  /// **'Largos (> 6h)'**
  String get flightLong;

  /// No description provided for @vehicleGasoline.
  ///
  /// In es, this message translates to:
  /// **'Gasolina'**
  String get vehicleGasoline;

  /// No description provided for @vehicleDiesel.
  ///
  /// In es, this message translates to:
  /// **'Diésel'**
  String get vehicleDiesel;

  /// No description provided for @vehicleHybrid.
  ///
  /// In es, this message translates to:
  /// **'Híbrido'**
  String get vehicleHybrid;

  /// No description provided for @vehicleElectric.
  ///
  /// In es, this message translates to:
  /// **'Eléctrico'**
  String get vehicleElectric;

  /// No description provided for @vehicleMotorcycle.
  ///
  /// In es, this message translates to:
  /// **'Moto'**
  String get vehicleMotorcycle;

  /// No description provided for @vehicleBus.
  ///
  /// In es, this message translates to:
  /// **'Bus/Metro'**
  String get vehicleBus;

  /// No description provided for @vehicleBicycle.
  ///
  /// In es, this message translates to:
  /// **'Bicicleta'**
  String get vehicleBicycle;

  /// No description provided for @vehicleWalking.
  ///
  /// In es, this message translates to:
  /// **'A pie'**
  String get vehicleWalking;

  /// No description provided for @foodModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Alimentación'**
  String get foodModuleTitle;

  /// No description provided for @foodModuleWeight.
  ///
  /// In es, this message translates to:
  /// **'25–30% de tu huella'**
  String get foodModuleWeight;

  /// No description provided for @foodQ1.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo describirías tu dieta?'**
  String get foodQ1;

  /// No description provided for @foodQ2.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántas veces comes carne de res por semana?'**
  String get foodQ2;

  /// No description provided for @foodBeefHint.
  ///
  /// In es, this message translates to:
  /// **'{n} veces'**
  String foodBeefHint(int n);

  /// No description provided for @foodQ3.
  ///
  /// In es, this message translates to:
  /// **'¿Cuánto desperdicias de comida?'**
  String get foodQ3;

  /// No description provided for @foodQ4.
  ///
  /// In es, this message translates to:
  /// **'¿Consumes alimentos locales y de temporada?'**
  String get foodQ4;

  /// No description provided for @dietVegan.
  ///
  /// In es, this message translates to:
  /// **'Vegano'**
  String get dietVegan;

  /// No description provided for @dietVeganSub.
  ///
  /// In es, this message translates to:
  /// **'Solo plantas'**
  String get dietVeganSub;

  /// No description provided for @dietVegetarian.
  ///
  /// In es, this message translates to:
  /// **'Vegetariano'**
  String get dietVegetarian;

  /// No description provided for @dietVegetarianSub.
  ///
  /// In es, this message translates to:
  /// **'Sin carne'**
  String get dietVegetarianSub;

  /// No description provided for @dietFlexitarian.
  ///
  /// In es, this message translates to:
  /// **'Flexitariano'**
  String get dietFlexitarian;

  /// No description provided for @dietFlexitarianSub.
  ///
  /// In es, this message translates to:
  /// **'Poca carne'**
  String get dietFlexitarianSub;

  /// No description provided for @dietOmnivore.
  ///
  /// In es, this message translates to:
  /// **'Omnívoro'**
  String get dietOmnivore;

  /// No description provided for @dietOmnivoreSub.
  ///
  /// In es, this message translates to:
  /// **'Carne regular'**
  String get dietOmnivoreSub;

  /// No description provided for @dietCarnivore.
  ///
  /// In es, this message translates to:
  /// **'Alta en carne'**
  String get dietCarnivore;

  /// No description provided for @dietCarnivoreSub.
  ///
  /// In es, this message translates to:
  /// **'Carne a diario'**
  String get dietCarnivoreSub;

  /// No description provided for @wasteNone.
  ///
  /// In es, this message translates to:
  /// **'Casi nada'**
  String get wasteNone;

  /// No description provided for @wasteSome.
  ///
  /// In es, this message translates to:
  /// **'Algo'**
  String get wasteSome;

  /// No description provided for @wasteLot.
  ///
  /// In es, this message translates to:
  /// **'Bastante'**
  String get wasteLot;

  /// No description provided for @wasteMuch.
  ///
  /// In es, this message translates to:
  /// **'Mucho'**
  String get wasteMuch;

  /// No description provided for @foodLocalTitle.
  ///
  /// In es, this message translates to:
  /// **'Principalmente local y de temporada'**
  String get foodLocalTitle;

  /// No description provided for @foodLocalSub.
  ///
  /// In es, this message translates to:
  /// **'Reduce hasta 0.1 tCO₂/año'**
  String get foodLocalSub;

  /// No description provided for @homeModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Hogar y Energía'**
  String get homeModuleTitle;

  /// No description provided for @homeModuleWeight.
  ///
  /// In es, this message translates to:
  /// **'20–25% de tu huella'**
  String get homeModuleWeight;

  /// No description provided for @homeQ1.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántas personas viven en tu hogar?'**
  String get homeQ1;

  /// No description provided for @homePersonsHint.
  ///
  /// In es, this message translates to:
  /// **'{n} persona{plural}'**
  String homePersonsHint(int n, String plural);

  /// No description provided for @homeQ2.
  ///
  /// In es, this message translates to:
  /// **'¿Cuál es tu fuente de energía principal?'**
  String get homeQ2;

  /// No description provided for @homeQ3.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántos kWh consumes al mes?'**
  String get homeQ3;

  /// No description provided for @homeKwhHint.
  ///
  /// In es, this message translates to:
  /// **'{n} kWh'**
  String homeKwhHint(int n);

  /// No description provided for @homeKwhAvg.
  ///
  /// In es, this message translates to:
  /// **'Promedio hogar Colombia: 170–250 kWh/mes'**
  String get homeKwhAvg;

  /// No description provided for @homeQ4.
  ///
  /// In es, this message translates to:
  /// **'¿Tienes aire acondicionado o calefacción?'**
  String get homeQ4;

  /// No description provided for @homeACTitle.
  ///
  /// In es, this message translates to:
  /// **'Sí, uso AC / calefacción'**
  String get homeACTitle;

  /// No description provided for @homeACHoursHint.
  ///
  /// In es, this message translates to:
  /// **'{n} horas/día'**
  String homeACHoursHint(int n);

  /// No description provided for @energyGrid.
  ///
  /// In es, this message translates to:
  /// **'Red eléctrica'**
  String get energyGrid;

  /// No description provided for @energySolar.
  ///
  /// In es, this message translates to:
  /// **'Solar'**
  String get energySolar;

  /// No description provided for @energyGas.
  ///
  /// In es, this message translates to:
  /// **'Gas natural'**
  String get energyGas;

  /// No description provided for @energyMixed.
  ///
  /// In es, this message translates to:
  /// **'Mixto'**
  String get energyMixed;

  /// No description provided for @shoppingModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Consumo'**
  String get shoppingModuleTitle;

  /// No description provided for @shoppingModuleWeight.
  ///
  /// In es, this message translates to:
  /// **'10–15% de tu huella'**
  String get shoppingModuleWeight;

  /// No description provided for @shoppingQ1.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántas prendas de ropa compras al mes?'**
  String get shoppingQ1;

  /// No description provided for @shoppingClothingHint.
  ///
  /// In es, this message translates to:
  /// **'{n} prendas'**
  String shoppingClothingHint(int n);

  /// No description provided for @shoppingQ2.
  ///
  /// In es, this message translates to:
  /// **'¿Dispositivos electrónicos nuevos por año?'**
  String get shoppingQ2;

  /// No description provided for @shoppingElectronicsHint.
  ///
  /// In es, this message translates to:
  /// **'{n} dispositivos'**
  String shoppingElectronicsHint(int n);

  /// No description provided for @shoppingQ3.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántos paquetes de e-commerce recibes al mes?'**
  String get shoppingQ3;

  /// No description provided for @shoppingPackagesHint.
  ///
  /// In es, this message translates to:
  /// **'{n} paquetes'**
  String shoppingPackagesHint(int n);

  /// No description provided for @shoppingQ4.
  ///
  /// In es, this message translates to:
  /// **'¿Compras ropa o artículos de segunda mano?'**
  String get shoppingQ4;

  /// No description provided for @shoppingSecondHandTitle.
  ///
  /// In es, this message translates to:
  /// **'Sí, compro segunda mano frecuentemente'**
  String get shoppingSecondHandTitle;

  /// No description provided for @shoppingSecondHandSub.
  ///
  /// In es, this message translates to:
  /// **'Reduce tu huella de consumo hasta 10%'**
  String get shoppingSecondHandSub;

  /// No description provided for @wasteModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Residuos'**
  String get wasteModuleTitle;

  /// No description provided for @wasteModuleWeight.
  ///
  /// In es, this message translates to:
  /// **'5–8% de tu huella'**
  String get wasteModuleWeight;

  /// No description provided for @wasteQ1.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántas bolsas de basura generas por semana?'**
  String get wasteQ1;

  /// No description provided for @wasteBagsHint.
  ///
  /// In es, this message translates to:
  /// **'{n} bolsa{plural}'**
  String wasteBagsHint(int n, String plural);

  /// No description provided for @wasteQ2.
  ///
  /// In es, this message translates to:
  /// **'¿Separas los residuos para reciclaje?'**
  String get wasteQ2;

  /// No description provided for @wasteSeparateTitle.
  ///
  /// In es, this message translates to:
  /// **'Sí, separo plástico, papel y vidrio'**
  String get wasteSeparateTitle;

  /// No description provided for @wasteSeparateSub.
  ///
  /// In es, this message translates to:
  /// **'Reduce tu huella de residuos un 30%'**
  String get wasteSeparateSub;

  /// No description provided for @wasteQ3.
  ///
  /// In es, this message translates to:
  /// **'¿Compostas residuos orgánicos?'**
  String get wasteQ3;

  /// No description provided for @wasteCompostTitle.
  ///
  /// In es, this message translates to:
  /// **'Sí, hago compost'**
  String get wasteCompostTitle;

  /// No description provided for @wasteCompostSub.
  ///
  /// In es, this message translates to:
  /// **'Reduce emisiones de metano del relleno'**
  String get wasteCompostSub;

  /// No description provided for @waterModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Agua'**
  String get waterModuleTitle;

  /// No description provided for @waterModuleWeight.
  ///
  /// In es, this message translates to:
  /// **'~3% de tu huella'**
  String get waterModuleWeight;

  /// No description provided for @waterQ1.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántos minutos dura tu ducha promedio?'**
  String get waterQ1;

  /// No description provided for @waterMinutesHint.
  ///
  /// In es, this message translates to:
  /// **'{n} minutos'**
  String waterMinutesHint(int n);

  /// No description provided for @waterQ2.
  ///
  /// In es, this message translates to:
  /// **'¿A qué temperatura te duchas normalmente?'**
  String get waterQ2;

  /// No description provided for @waterQ3.
  ///
  /// In es, this message translates to:
  /// **'¿Riegas jardín o zonas verdes en casa?'**
  String get waterQ3;

  /// No description provided for @waterGardenTitle.
  ///
  /// In es, this message translates to:
  /// **'Sí, tengo jardín o riego plantas'**
  String get waterGardenTitle;

  /// No description provided for @tempCold.
  ///
  /// In es, this message translates to:
  /// **'Fría'**
  String get tempCold;

  /// No description provided for @tempColdSub.
  ///
  /// In es, this message translates to:
  /// **'Sin calentador'**
  String get tempColdSub;

  /// No description provided for @tempWarm.
  ///
  /// In es, this message translates to:
  /// **'Tibia'**
  String get tempWarm;

  /// No description provided for @tempWarmSub.
  ///
  /// In es, this message translates to:
  /// **'Calentador moderado'**
  String get tempWarmSub;

  /// No description provided for @tempHot.
  ///
  /// In es, this message translates to:
  /// **'Caliente'**
  String get tempHot;

  /// No description provided for @tempHotSub.
  ///
  /// In es, this message translates to:
  /// **'Calentador máximo'**
  String get tempHotSub;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @greetingWithName.
  ///
  /// In es, this message translates to:
  /// **'Hola, {name} 👋'**
  String greetingWithName(String name);

  /// No description provided for @greetingEmpty.
  ///
  /// In es, this message translates to:
  /// **'Hola 👋'**
  String get greetingEmpty;

  /// No description provided for @addYourName.
  ///
  /// In es, this message translates to:
  /// **'Añade tu nombre'**
  String get addYourName;

  /// No description provided for @nameDialogTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo te llamas?'**
  String get nameDialogTitle;

  /// No description provided for @nameDialogHint.
  ///
  /// In es, this message translates to:
  /// **'Tu nombre'**
  String get nameDialogHint;

  /// No description provided for @nameOnCard.
  ///
  /// In es, this message translates to:
  /// **'nombre en la tarjeta'**
  String get nameOnCard;

  /// No description provided for @historyTitle.
  ///
  /// In es, this message translates to:
  /// **'Evolución de tu huella'**
  String get historyTitle;

  /// No description provided for @historyMeasurements.
  ///
  /// In es, this message translates to:
  /// **'{n} mediciones'**
  String historyMeasurements(int n);

  /// No description provided for @historyEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún sin historial'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptySub.
  ///
  /// In es, this message translates to:
  /// **'Actualiza tus módulos en distintos días para ver cómo evoluciona tu huella.'**
  String get historyEmptySub;

  /// No description provided for @historyOneMeasurement.
  ///
  /// In es, this message translates to:
  /// **'¡Primera medición registrada! 🎉'**
  String get historyOneMeasurement;

  /// No description provided for @historyOneSub.
  ///
  /// In es, this message translates to:
  /// **'Vuelve mañana y actualiza un módulo para ver tu evolución.'**
  String get historyOneSub;

  /// No description provided for @historyImproved.
  ///
  /// In es, this message translates to:
  /// **'↓ {pct}% desde tu primera medición'**
  String historyImproved(String pct);

  /// No description provided for @historyWorsened.
  ///
  /// In es, this message translates to:
  /// **'↑ {pct}% desde tu primera medición'**
  String historyWorsened(String pct);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
