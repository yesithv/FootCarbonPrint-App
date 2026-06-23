import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'FootCarbonPrint'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Know Your Footprint. Change Your World.'**
  String get tagline;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @goToTest.
  ///
  /// In en, this message translates to:
  /// **'Go to test'**
  String get goToTest;

  /// No description provided for @startTest.
  ///
  /// In en, this message translates to:
  /// **'Start my test!'**
  String get startTest;

  /// No description provided for @startTestNow.
  ///
  /// In en, this message translates to:
  /// **'Start the test now! 🚀'**
  String get startTestNow;

  /// No description provided for @co2PerYear.
  ///
  /// In en, this message translates to:
  /// **'tonnes CO₂/year'**
  String get co2PerYear;

  /// No description provided for @co2Unit.
  ///
  /// In en, this message translates to:
  /// **'t CO₂/year'**
  String get co2Unit;

  /// No description provided for @moduleEstimate.
  ///
  /// In en, this message translates to:
  /// **'Estimated from this module'**
  String get moduleEstimate;

  /// No description provided for @saveModule.
  ///
  /// In en, this message translates to:
  /// **'Save module'**
  String get saveModule;

  /// No description provided for @completedCheck.
  ///
  /// In en, this message translates to:
  /// **'Completed ✓'**
  String get completedCheck;

  /// No description provided for @tapToStart.
  ///
  /// In en, this message translates to:
  /// **'Tap to start'**
  String get tapToStart;

  /// No description provided for @onb1Title.
  ///
  /// In en, this message translates to:
  /// **'How much do you\npollute without knowing?'**
  String get onb1Title;

  /// No description provided for @onb1Sub.
  ///
  /// In en, this message translates to:
  /// **'Most people emit more CO₂ than they think. In less than 7 minutes, discover your real impact on the planet.'**
  String get onb1Sub;

  /// No description provided for @onb2Title.
  ///
  /// In en, this message translates to:
  /// **'Your footprint,\nin real data'**
  String get onb2Title;

  /// No description provided for @onb2Sub.
  ///
  /// In en, this message translates to:
  /// **'We calculate your annual carbon footprint broken down by category: transport, food, home, shopping, waste, and water.'**
  String get onb2Sub;

  /// No description provided for @onb3Title.
  ///
  /// In en, this message translates to:
  /// **'An action plan\nthat actually works'**
  String get onb3Title;

  /// No description provided for @onb3Sub.
  ///
  /// In en, this message translates to:
  /// **'We don\'t just measure — we tell you exactly what to change and how much CO₂ you save with each action. Step by step.'**
  String get onb3Sub;

  /// No description provided for @tabTest.
  ///
  /// In en, this message translates to:
  /// **'My Test'**
  String get tabTest;

  /// No description provided for @tabFootprint.
  ///
  /// In en, this message translates to:
  /// **'My Footprint'**
  String get tabFootprint;

  /// No description provided for @tabPlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get tabPlan;

  /// No description provided for @testHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Carbon\nFootprint Self-Test'**
  String get testHubTitle;

  /// No description provided for @testHubSub.
  ///
  /// In en, this message translates to:
  /// **'Complete modules to discover your impact'**
  String get testHubSub;

  /// No description provided for @modulesProgress.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} modules'**
  String modulesProgress(int completed, int total);

  /// No description provided for @viewMyFootprint.
  ///
  /// In en, this message translates to:
  /// **'View My Carbon Footprint'**
  String get viewMyFootprint;

  /// No description provided for @learnBannerFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'First time here?'**
  String get learnBannerFirstTitle;

  /// No description provided for @learnBannerFirstSub.
  ///
  /// In en, this message translates to:
  /// **'Learn about carbon footprint in 2 minutes'**
  String get learnBannerFirstSub;

  /// No description provided for @learnBannerReturnTitle.
  ///
  /// In en, this message translates to:
  /// **'Carbon Footprint Guide'**
  String get learnBannerReturnTitle;

  /// No description provided for @learnBannerReturnSub.
  ///
  /// In en, this message translates to:
  /// **'Review the key concepts — 6 visual lessons'**
  String get learnBannerReturnSub;

  /// No description provided for @modTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get modTransport;

  /// No description provided for @modTransportWeight.
  ///
  /// In en, this message translates to:
  /// **'28–35%'**
  String get modTransportWeight;

  /// No description provided for @modFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get modFood;

  /// No description provided for @modFoodWeight.
  ///
  /// In en, this message translates to:
  /// **'25–30%'**
  String get modFoodWeight;

  /// No description provided for @modHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get modHome;

  /// No description provided for @modHomeWeight.
  ///
  /// In en, this message translates to:
  /// **'20–25%'**
  String get modHomeWeight;

  /// No description provided for @modShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get modShopping;

  /// No description provided for @modShoppingWeight.
  ///
  /// In en, this message translates to:
  /// **'10–15%'**
  String get modShoppingWeight;

  /// No description provided for @modWaste.
  ///
  /// In en, this message translates to:
  /// **'Waste'**
  String get modWaste;

  /// No description provided for @modWasteWeight.
  ///
  /// In en, this message translates to:
  /// **'5–8%'**
  String get modWasteWeight;

  /// No description provided for @modWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get modWater;

  /// No description provided for @modWaterWeight.
  ///
  /// In en, this message translates to:
  /// **'~3%'**
  String get modWaterWeight;

  /// No description provided for @dashEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No results yet'**
  String get dashEmptyTitle;

  /// No description provided for @dashEmptySub.
  ///
  /// In en, this message translates to:
  /// **'Complete at least one test module to see your carbon footprint here.'**
  String get dashEmptySub;

  /// No description provided for @dashAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Carbon Footprint'**
  String get dashAppBarTitle;

  /// No description provided for @equivalencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Your footprint equals...'**
  String get equivalencesTitle;

  /// No description provided for @treesLabel.
  ///
  /// In en, this message translates to:
  /// **'trees\ncut/year'**
  String get treesLabel;

  /// No description provided for @bulbYearsLabel.
  ///
  /// In en, this message translates to:
  /// **'light bulb\nyears'**
  String get bulbYearsLabel;

  /// No description provided for @phoneChargesLabel.
  ///
  /// In en, this message translates to:
  /// **'smartphone\ncharges'**
  String get phoneChargesLabel;

  /// No description provided for @breakdownTitle.
  ///
  /// In en, this message translates to:
  /// **'Breakdown by category'**
  String get breakdownTitle;

  /// No description provided for @benchmarkTitle.
  ///
  /// In en, this message translates to:
  /// **'Global comparison'**
  String get benchmarkTitle;

  /// No description provided for @yourFootprint.
  ///
  /// In en, this message translates to:
  /// **'Your footprint'**
  String get yourFootprint;

  /// No description provided for @parisTarget.
  ///
  /// In en, this message translates to:
  /// **'Paris 2050 target'**
  String get parisTarget;

  /// No description provided for @colombiaAvg.
  ///
  /// In en, this message translates to:
  /// **'Colombia average'**
  String get colombiaAvg;

  /// No description provided for @worldAvg.
  ///
  /// In en, this message translates to:
  /// **'World average'**
  String get worldAvg;

  /// No description provided for @viewActionPlan.
  ///
  /// In en, this message translates to:
  /// **'View Action Plan'**
  String get viewActionPlan;

  /// No description provided for @ecoPoints.
  ///
  /// In en, this message translates to:
  /// **'eco points'**
  String get ecoPoints;

  /// No description provided for @nextLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Next: {emoji} {name}'**
  String nextLevelLabel(String emoji, String name);

  /// No description provided for @ptsMore.
  ///
  /// In en, this message translates to:
  /// **'{pts} pts more'**
  String ptsMore(int pts);

  /// No description provided for @maxLevelReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum level reached! 🎉'**
  String get maxLevelReached;

  /// No description provided for @myAchievements.
  ///
  /// In en, this message translates to:
  /// **'My achievements'**
  String get myAchievements;

  /// No description provided for @shareMyLevel.
  ///
  /// In en, this message translates to:
  /// **'Share my level'**
  String get shareMyLevel;

  /// No description provided for @shareSub.
  ///
  /// In en, this message translates to:
  /// **'Download your eco card and share it on social media'**
  String get shareSub;

  /// No description provided for @lvlChampion.
  ///
  /// In en, this message translates to:
  /// **'Green Champion'**
  String get lvlChampion;

  /// No description provided for @lvlConscious.
  ///
  /// In en, this message translates to:
  /// **'Conscious'**
  String get lvlConscious;

  /// No description provided for @lvlOntrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get lvlOntrack;

  /// No description provided for @lvlHigh.
  ///
  /// In en, this message translates to:
  /// **'High Impact'**
  String get lvlHigh;

  /// No description provided for @lvlCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get lvlCritical;

  /// No description provided for @ecoLvlBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get ecoLvlBeginner;

  /// No description provided for @ecoLvlLearner.
  ///
  /// In en, this message translates to:
  /// **'Learner'**
  String get ecoLvlLearner;

  /// No description provided for @ecoLvlConscious.
  ///
  /// In en, this message translates to:
  /// **'Conscious'**
  String get ecoLvlConscious;

  /// No description provided for @ecoLvlActivist.
  ///
  /// In en, this message translates to:
  /// **'Activist'**
  String get ecoLvlActivist;

  /// No description provided for @ecoLvlChampion.
  ///
  /// In en, this message translates to:
  /// **'Eco-Champion'**
  String get ecoLvlChampion;

  /// No description provided for @badgeFirstStep.
  ///
  /// In en, this message translates to:
  /// **'First Step'**
  String get badgeFirstStep;

  /// No description provided for @badgeFirstStepDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete your first test module'**
  String get badgeFirstStepDesc;

  /// No description provided for @badgeExplorer.
  ///
  /// In en, this message translates to:
  /// **'Explorer'**
  String get badgeExplorer;

  /// No description provided for @badgeExplorerDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 3 test modules'**
  String get badgeExplorerDesc;

  /// No description provided for @badgeCompletionist.
  ///
  /// In en, this message translates to:
  /// **'Completionist'**
  String get badgeCompletionist;

  /// No description provided for @badgeCompletionistDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete all 6 test modules'**
  String get badgeCompletionistDesc;

  /// No description provided for @badgeEducated.
  ///
  /// In en, this message translates to:
  /// **'Educated'**
  String get badgeEducated;

  /// No description provided for @badgeEducatedDesc.
  ///
  /// In en, this message translates to:
  /// **'Finish the learning guide'**
  String get badgeEducatedDesc;

  /// No description provided for @badgeConscious.
  ///
  /// In en, this message translates to:
  /// **'Conscious'**
  String get badgeConscious;

  /// No description provided for @badgeConsciousDesc.
  ///
  /// In en, this message translates to:
  /// **'Achieve a footprint below 3 tonnes'**
  String get badgeConsciousDesc;

  /// No description provided for @badgeChampion.
  ///
  /// In en, this message translates to:
  /// **'Light Footprint'**
  String get badgeChampion;

  /// No description provided for @badgeChampionDesc.
  ///
  /// In en, this message translates to:
  /// **'Achieve a footprint below 1.5 tonnes'**
  String get badgeChampionDesc;

  /// No description provided for @badgeCommitted.
  ///
  /// In en, this message translates to:
  /// **'Committed'**
  String get badgeCommitted;

  /// No description provided for @badgeCommittedDesc.
  ///
  /// In en, this message translates to:
  /// **'Commit to at least 1 action'**
  String get badgeCommittedDesc;

  /// No description provided for @badgeActivist.
  ///
  /// In en, this message translates to:
  /// **'Activist'**
  String get badgeActivist;

  /// No description provided for @badgeActivistDesc.
  ///
  /// In en, this message translates to:
  /// **'Commit to 5 actions from the plan'**
  String get badgeActivistDesc;

  /// No description provided for @badgeLocked.
  ///
  /// In en, this message translates to:
  /// **'🔒 {description}'**
  String badgeLocked(String description);

  /// No description provided for @actionPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Action Plan'**
  String get actionPlanTitle;

  /// No description provided for @actionPlanEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No plan yet'**
  String get actionPlanEmptyTitle;

  /// No description provided for @actionPlanEmptySub.
  ///
  /// In en, this message translates to:
  /// **'Complete at least one test module to see your personalized action plan.'**
  String get actionPlanEmptySub;

  /// No description provided for @reductionTitle.
  ///
  /// In en, this message translates to:
  /// **'How much can you reduce?'**
  String get reductionTitle;

  /// No description provided for @reductionSub.
  ///
  /// In en, this message translates to:
  /// **'up to {pct}% with the actions below'**
  String reductionSub(int pct);

  /// No description provided for @actionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your top actions by impact'**
  String get actionsTitle;

  /// No description provided for @actionsSub.
  ///
  /// In en, this message translates to:
  /// **'Sorted from highest to lowest reduction potential'**
  String get actionsSub;

  /// No description provided for @commit.
  ///
  /// In en, this message translates to:
  /// **'I commit'**
  String get commit;

  /// No description provided for @committedLabel.
  ///
  /// In en, this message translates to:
  /// **'✓ Committed'**
  String get committedLabel;

  /// No description provided for @challengesTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly challenges 🎯'**
  String get challengesTitle;

  /// No description provided for @challengesSub.
  ///
  /// In en, this message translates to:
  /// **'Small changes with big impact'**
  String get challengesSub;

  /// No description provided for @actionFlightTitle.
  ///
  /// In en, this message translates to:
  /// **'Eliminate 1 long-haul flight per year'**
  String get actionFlightTitle;

  /// No description provided for @actionFlightDesc.
  ///
  /// In en, this message translates to:
  /// **'A long-distance flight emits more CO₂ than 2 months of driving.'**
  String get actionFlightDesc;

  /// No description provided for @actionFlexitarianTitle.
  ///
  /// In en, this message translates to:
  /// **'Adopt a flexitarian diet'**
  String get actionFlexitarianTitle;

  /// No description provided for @actionFlexitarianDesc.
  ///
  /// In en, this message translates to:
  /// **'Reducing meat to 2–3 times per week has a huge impact.'**
  String get actionFlexitarianDesc;

  /// No description provided for @actionPublicTransportTitle.
  ///
  /// In en, this message translates to:
  /// **'Use public transport 2 days/week'**
  String get actionPublicTransportTitle;

  /// No description provided for @actionPublicTransportDesc.
  ///
  /// In en, this message translates to:
  /// **'Leaving the car 2 days avoids ~350 kg CO₂ per year.'**
  String get actionPublicTransportDesc;

  /// No description provided for @actionLessBeefTitle.
  ///
  /// In en, this message translates to:
  /// **'Skip beef 3 days/week'**
  String get actionLessBeefTitle;

  /// No description provided for @actionLessBeefDesc.
  ///
  /// In en, this message translates to:
  /// **'Beef emits 27 kgCO₂/kg — the highest of all foods.'**
  String get actionLessBeefDesc;

  /// No description provided for @actionLedTitle.
  ///
  /// In en, this message translates to:
  /// **'Switch to LED bulbs'**
  String get actionLedTitle;

  /// No description provided for @actionLedDesc.
  ///
  /// In en, this message translates to:
  /// **'LEDs use 75% less energy than incandescent bulbs.'**
  String get actionLedDesc;

  /// No description provided for @actionShortShowerTitle.
  ///
  /// In en, this message translates to:
  /// **'Showers of max 5 minutes'**
  String get actionShortShowerTitle;

  /// No description provided for @actionShortShowerDesc.
  ///
  /// In en, this message translates to:
  /// **'Reducing your shower to 5 min with hot water saves 100 kgCO₂/year.'**
  String get actionShortShowerDesc;

  /// No description provided for @actionRecycleTitle.
  ///
  /// In en, this message translates to:
  /// **'Separate waste for recycling'**
  String get actionRecycleTitle;

  /// No description provided for @actionRecycleDesc.
  ///
  /// In en, this message translates to:
  /// **'Recycling prevents anaerobic decomposition that produces methane.'**
  String get actionRecycleDesc;

  /// No description provided for @actionSecondhandTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy 50% secondhand clothing'**
  String get actionSecondhandTitle;

  /// No description provided for @actionSecondhandDesc.
  ///
  /// In en, this message translates to:
  /// **'The textile industry is one of the most polluting in the world.'**
  String get actionSecondhandDesc;

  /// No description provided for @actionCompostTitle.
  ///
  /// In en, this message translates to:
  /// **'Compost organic waste'**
  String get actionCompostTitle;

  /// No description provided for @actionCompostDesc.
  ///
  /// In en, this message translates to:
  /// **'Composting prevents organic waste from producing methane in landfills.'**
  String get actionCompostDesc;

  /// No description provided for @actionBikeTitle.
  ///
  /// In en, this message translates to:
  /// **'Bike or walk to work'**
  String get actionBikeTitle;

  /// No description provided for @actionBikeDesc.
  ///
  /// In en, this message translates to:
  /// **'Zero emissions + health benefits.'**
  String get actionBikeDesc;

  /// No description provided for @challengeWeekLabel.
  ///
  /// In en, this message translates to:
  /// **'Challenge of the week'**
  String get challengeWeekLabel;

  /// No description provided for @challengeExpiresLabel.
  ///
  /// In en, this message translates to:
  /// **'Expires this Sunday'**
  String get challengeExpiresLabel;

  /// No description provided for @challengePts.
  ///
  /// In en, this message translates to:
  /// **'+{pts} pts'**
  String challengePts(int pts);

  /// No description provided for @challengeMarkDone.
  ///
  /// In en, this message translates to:
  /// **'I did it! Mark as completed'**
  String get challengeMarkDone;

  /// No description provided for @challengeCompletedLabel.
  ///
  /// In en, this message translates to:
  /// **'Challenge completed this week! 🎉'**
  String get challengeCompletedLabel;

  /// No description provided for @challengeCompletedSub.
  ///
  /// In en, this message translates to:
  /// **'You earned +25 pts'**
  String get challengeCompletedSub;

  /// No description provided for @challenge1.
  ///
  /// In en, this message translates to:
  /// **'One week without single-use plastic'**
  String get challenge1;

  /// No description provided for @challengeDesc1.
  ///
  /// In en, this message translates to:
  /// **'Bring a reusable bag and say no to plastic cups, straws, and bags for 7 days.'**
  String get challengeDesc1;

  /// No description provided for @challengeEmoji1.
  ///
  /// In en, this message translates to:
  /// **'🛍️'**
  String get challengeEmoji1;

  /// No description provided for @challenge2.
  ///
  /// In en, this message translates to:
  /// **'7 days without red meat'**
  String get challenge2;

  /// No description provided for @challengeDesc2.
  ///
  /// In en, this message translates to:
  /// **'Replace beef with chicken, fish, legumes, or tofu for the whole week.'**
  String get challengeDesc2;

  /// No description provided for @challengeEmoji2.
  ///
  /// In en, this message translates to:
  /// **'🥩'**
  String get challengeEmoji2;

  /// No description provided for @challenge3.
  ///
  /// In en, this message translates to:
  /// **'Bike or walk 3 days this week'**
  String get challenge3;

  /// No description provided for @challengeDesc3.
  ///
  /// In en, this message translates to:
  /// **'At least 3 days this week, leave the car and use a bike, scooter, or your feet.'**
  String get challengeDesc3;

  /// No description provided for @challengeEmoji3.
  ///
  /// In en, this message translates to:
  /// **'🚲'**
  String get challengeEmoji3;

  /// No description provided for @challenge4.
  ///
  /// In en, this message translates to:
  /// **'Shower in max 5 minutes for 5 days'**
  String get challenge4;

  /// No description provided for @challengeDesc4.
  ///
  /// In en, this message translates to:
  /// **'Use a timer — max 5 minutes with hot water, for 5 consecutive days.'**
  String get challengeDesc4;

  /// No description provided for @challengeEmoji4.
  ///
  /// In en, this message translates to:
  /// **'🚿'**
  String get challengeEmoji4;

  /// No description provided for @learnGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Carbon Footprint Guide'**
  String get learnGuideTitle;

  /// No description provided for @learnNext.
  ///
  /// In en, this message translates to:
  /// **'Next →'**
  String get learnNext;

  /// No description provided for @l1Title.
  ///
  /// In en, this message translates to:
  /// **'The planet\nhas a fever'**
  String get l1Title;

  /// No description provided for @l1Body.
  ///
  /// In en, this message translates to:
  /// **'Imagine the Earth is your body. When you have a fever of just 1°C, you already feel terrible. The Earth is already 1.2°C warmer than 150 years ago… and it keeps rising every year.'**
  String get l1Body;

  /// No description provided for @l1FactLabel.
  ///
  /// In en, this message translates to:
  /// **'FACT'**
  String get l1FactLabel;

  /// No description provided for @l1Fact.
  ///
  /// In en, this message translates to:
  /// **'2023 was the hottest year ever recorded. The 10 hottest years in history have all been in the last 10 years.'**
  String get l1Fact;

  /// No description provided for @l1TempLow.
  ///
  /// In en, this message translates to:
  /// **'Slight glacial melting'**
  String get l1TempLow;

  /// No description provided for @l1TempNow.
  ///
  /// In en, this message translates to:
  /// **'Where we are today 📍'**
  String get l1TempNow;

  /// No description provided for @l1TempHeat.
  ///
  /// In en, this message translates to:
  /// **'Extreme heat waves'**
  String get l1TempHeat;

  /// No description provided for @l1TempCrisis.
  ///
  /// In en, this message translates to:
  /// **'Civilization at risk'**
  String get l1TempCrisis;

  /// No description provided for @l2Title.
  ///
  /// In en, this message translates to:
  /// **'The invisible\ngas'**
  String get l2Title;

  /// No description provided for @l2Body.
  ///
  /// In en, this message translates to:
  /// **'When you burn gasoline, gas or coal — or when food decomposes — CO₂ is released. This gas acts like a blanket: it lets the sun\'s heat in, but doesn\'t let it out. The planet warms.'**
  String get l2Body;

  /// No description provided for @l2FactLabel.
  ///
  /// In en, this message translates to:
  /// **'ANALOGY'**
  String get l2FactLabel;

  /// No description provided for @l2Fact.
  ///
  /// In en, this message translates to:
  /// **'It\'s like leaving the car running inside a closed garage. Except the garage is the entire Earth\'s atmosphere.'**
  String get l2Fact;

  /// No description provided for @l2Step1.
  ///
  /// In en, this message translates to:
  /// **'Sun sends\nheat'**
  String get l2Step1;

  /// No description provided for @l2Step2.
  ///
  /// In en, this message translates to:
  /// **'Earth\nreceives'**
  String get l2Step2;

  /// No description provided for @l2Step3.
  ///
  /// In en, this message translates to:
  /// **'CO₂ traps\nthe heat'**
  String get l2Step3;

  /// No description provided for @l2Result.
  ///
  /// In en, this message translates to:
  /// **'🌡️ Heat can\'t escape → temperature rises'**
  String get l2Result;

  /// No description provided for @l3Title.
  ///
  /// In en, this message translates to:
  /// **'Your personal\nfootprint'**
  String get l3Title;

  /// No description provided for @l3Body.
  ///
  /// In en, this message translates to:
  /// **'Your \"carbon footprint\" is the total CO₂ you produce in a year. It includes everything you consume: the bus you take, the burger you eat, the shirt you buy, the hot shower you take.'**
  String get l3Body;

  /// No description provided for @l3FactLabel.
  ///
  /// In en, this message translates to:
  /// **'IN COLOMBIA'**
  String get l3FactLabel;

  /// No description provided for @l3Fact.
  ///
  /// In en, this message translates to:
  /// **'A Colombian produces an average of 1.8 tonnes of CO₂ per year. The world average is 4.7 t. The target to save the planet is to reach 2 t before 2030.'**
  String get l3Fact;

  /// No description provided for @l3ColombiaLabel.
  ///
  /// In en, this message translates to:
  /// **'Colombia\naverage'**
  String get l3ColombiaLabel;

  /// No description provided for @l3WorldLabel.
  ///
  /// In en, this message translates to:
  /// **'World\naverage'**
  String get l3WorldLabel;

  /// No description provided for @l3TargetLabel.
  ///
  /// In en, this message translates to:
  /// **'2030\nTarget 🎯'**
  String get l3TargetLabel;

  /// No description provided for @l4Title.
  ///
  /// In en, this message translates to:
  /// **'Where does\nit come from?'**
  String get l4Title;

  /// No description provided for @l4Body.
  ///
  /// In en, this message translates to:
  /// **'It\'s not just cars that pollute. Your footprint comes from 6 major categories of your daily life. Some are surprising: beef emits more CO₂ than driving a car.'**
  String get l4Body;

  /// No description provided for @l4FactLabel.
  ///
  /// In en, this message translates to:
  /// **'THE 6 CATEGORIES'**
  String get l4FactLabel;

  /// No description provided for @l4Fact.
  ///
  /// In en, this message translates to:
  /// **'Transport and food together account for more than 55% of your total footprint.'**
  String get l4Fact;

  /// No description provided for @l5Title.
  ///
  /// In en, this message translates to:
  /// **'How much\nis too much?'**
  String get l5Title;

  /// No description provided for @l5Body.
  ///
  /// In en, this message translates to:
  /// **'There is a global target: to avoid the worst effects of climate change, every person in the world needs to reach less than 2 tonnes of CO₂ per year by 2030.'**
  String get l5Body;

  /// No description provided for @l5FactLabel.
  ///
  /// In en, this message translates to:
  /// **'COMPARISON'**
  String get l5FactLabel;

  /// No description provided for @l5Fact.
  ///
  /// In en, this message translates to:
  /// **'A US citizen produces 15 t/year. A German: 9 t. A Colombian: 1.8 t. But quality of life doesn\'t have to drop to reduce your footprint.'**
  String get l5Fact;

  /// No description provided for @l6Title.
  ///
  /// In en, this message translates to:
  /// **'You can\nchange something'**
  String get l6Title;

  /// No description provided for @l6Body.
  ///
  /// In en, this message translates to:
  /// **'You don\'t need to be an activist or change your life overnight. Small changes in your transport, food, and home habits can reduce your footprint by up to 40%.'**
  String get l6Body;

  /// No description provided for @l6FactLabel.
  ///
  /// In en, this message translates to:
  /// **'THE FIRST STEP'**
  String get l6FactLabel;

  /// No description provided for @l6Fact.
  ///
  /// In en, this message translates to:
  /// **'Knowing your footprint is the first step. What you don\'t measure, you can\'t improve. Take the test now!'**
  String get l6Fact;

  /// No description provided for @l6Action1.
  ///
  /// In en, this message translates to:
  /// **'Eat less meat'**
  String get l6Action1;

  /// No description provided for @l6Action2.
  ///
  /// In en, this message translates to:
  /// **'Use public transport'**
  String get l6Action2;

  /// No description provided for @l6Action3.
  ///
  /// In en, this message translates to:
  /// **'Skip 1 long-haul flight'**
  String get l6Action3;

  /// No description provided for @l6Action4.
  ///
  /// In en, this message translates to:
  /// **'Switch to LED'**
  String get l6Action4;

  /// No description provided for @l6ActionsLabel.
  ///
  /// In en, this message translates to:
  /// **'High-impact actions:'**
  String get l6ActionsLabel;

  /// No description provided for @profileCardTitle.
  ///
  /// In en, this message translates to:
  /// **'My Eco Card'**
  String get profileCardTitle;

  /// No description provided for @profileCardPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview — share your level on social media 🌍'**
  String get profileCardPreview;

  /// No description provided for @photoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add your photo?'**
  String get photoDialogTitle;

  /// No description provided for @photoDialogContent.
  ///
  /// In en, this message translates to:
  /// **'You can personalize the card with your profile photo, or just use your level emoji.'**
  String get photoDialogContent;

  /// No description provided for @emojiOnly.
  ///
  /// In en, this message translates to:
  /// **'Emoji only'**
  String get emojiOnly;

  /// No description provided for @choosePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose photo'**
  String get choosePhoto;

  /// No description provided for @addPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get addPhoto;

  /// No description provided for @changePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhoto;

  /// No description provided for @generating.
  ///
  /// In en, this message translates to:
  /// **'Generating...'**
  String get generating;

  /// No description provided for @downloadPng.
  ///
  /// In en, this message translates to:
  /// **'Download PNG'**
  String get downloadPng;

  /// No description provided for @cardDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Card downloaded! 🌿'**
  String get cardDownloaded;

  /// No description provided for @downloadHint.
  ///
  /// In en, this message translates to:
  /// **'The image downloads at 1080×1080 px,\nperfect for Instagram, WhatsApp and Twitter.'**
  String get downloadHint;

  /// No description provided for @cardFooterText.
  ///
  /// In en, this message translates to:
  /// **'Know your footprint. Change your world.'**
  String get cardFooterText;

  /// No description provided for @statsModules.
  ///
  /// In en, this message translates to:
  /// **'Modules'**
  String get statsModules;

  /// No description provided for @statsAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get statsAchievements;

  /// No description provided for @transportModuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get transportModuleTitle;

  /// No description provided for @transportModuleWeight.
  ///
  /// In en, this message translates to:
  /// **'28–35% of your footprint'**
  String get transportModuleWeight;

  /// No description provided for @transportQ1.
  ///
  /// In en, this message translates to:
  /// **'What is your main mode of transport?'**
  String get transportQ1;

  /// No description provided for @transportQ2.
  ///
  /// In en, this message translates to:
  /// **'How many km do you travel per week?'**
  String get transportQ2;

  /// No description provided for @transportKmHint.
  ///
  /// In en, this message translates to:
  /// **'{km} km/week'**
  String transportKmHint(int km);

  /// No description provided for @transportQ3.
  ///
  /// In en, this message translates to:
  /// **'How many flights do you take per year?'**
  String get transportQ3;

  /// No description provided for @flightShort.
  ///
  /// In en, this message translates to:
  /// **'Short (< 3h)'**
  String get flightShort;

  /// No description provided for @flightMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium (3–6h)'**
  String get flightMedium;

  /// No description provided for @flightLong.
  ///
  /// In en, this message translates to:
  /// **'Long (> 6h)'**
  String get flightLong;

  /// No description provided for @vehicleGasoline.
  ///
  /// In en, this message translates to:
  /// **'Gasoline'**
  String get vehicleGasoline;

  /// No description provided for @vehicleDiesel.
  ///
  /// In en, this message translates to:
  /// **'Diesel'**
  String get vehicleDiesel;

  /// No description provided for @vehicleHybrid.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get vehicleHybrid;

  /// No description provided for @vehicleElectric.
  ///
  /// In en, this message translates to:
  /// **'Electric'**
  String get vehicleElectric;

  /// No description provided for @vehicleMotorcycle.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle'**
  String get vehicleMotorcycle;

  /// No description provided for @vehicleBus.
  ///
  /// In en, this message translates to:
  /// **'Bus/Metro'**
  String get vehicleBus;

  /// No description provided for @vehicleBicycle.
  ///
  /// In en, this message translates to:
  /// **'Bicycle'**
  String get vehicleBicycle;

  /// No description provided for @vehicleWalking.
  ///
  /// In en, this message translates to:
  /// **'Walking'**
  String get vehicleWalking;

  /// No description provided for @foodModuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get foodModuleTitle;

  /// No description provided for @foodModuleWeight.
  ///
  /// In en, this message translates to:
  /// **'25–30% of your footprint'**
  String get foodModuleWeight;

  /// No description provided for @foodQ1.
  ///
  /// In en, this message translates to:
  /// **'How would you describe your diet?'**
  String get foodQ1;

  /// No description provided for @foodQ2.
  ///
  /// In en, this message translates to:
  /// **'How many times a week do you eat beef?'**
  String get foodQ2;

  /// No description provided for @foodBeefHint.
  ///
  /// In en, this message translates to:
  /// **'{n} times'**
  String foodBeefHint(int n);

  /// No description provided for @foodQ3.
  ///
  /// In en, this message translates to:
  /// **'How much food do you waste?'**
  String get foodQ3;

  /// No description provided for @foodQ4.
  ///
  /// In en, this message translates to:
  /// **'Do you eat local and seasonal food?'**
  String get foodQ4;

  /// No description provided for @dietVegan.
  ///
  /// In en, this message translates to:
  /// **'Vegan'**
  String get dietVegan;

  /// No description provided for @dietVeganSub.
  ///
  /// In en, this message translates to:
  /// **'Plants only'**
  String get dietVeganSub;

  /// No description provided for @dietVegetarian.
  ///
  /// In en, this message translates to:
  /// **'Vegetarian'**
  String get dietVegetarian;

  /// No description provided for @dietVegetarianSub.
  ///
  /// In en, this message translates to:
  /// **'No meat'**
  String get dietVegetarianSub;

  /// No description provided for @dietFlexitarian.
  ///
  /// In en, this message translates to:
  /// **'Flexitarian'**
  String get dietFlexitarian;

  /// No description provided for @dietFlexitarianSub.
  ///
  /// In en, this message translates to:
  /// **'Little meat'**
  String get dietFlexitarianSub;

  /// No description provided for @dietOmnivore.
  ///
  /// In en, this message translates to:
  /// **'Omnivore'**
  String get dietOmnivore;

  /// No description provided for @dietOmnivoreSub.
  ///
  /// In en, this message translates to:
  /// **'Regular meat'**
  String get dietOmnivoreSub;

  /// No description provided for @dietCarnivore.
  ///
  /// In en, this message translates to:
  /// **'High meat'**
  String get dietCarnivore;

  /// No description provided for @dietCarnivoreSub.
  ///
  /// In en, this message translates to:
  /// **'Meat daily'**
  String get dietCarnivoreSub;

  /// No description provided for @wasteNone.
  ///
  /// In en, this message translates to:
  /// **'Almost none'**
  String get wasteNone;

  /// No description provided for @wasteSome.
  ///
  /// In en, this message translates to:
  /// **'Some'**
  String get wasteSome;

  /// No description provided for @wasteLot.
  ///
  /// In en, this message translates to:
  /// **'Quite a bit'**
  String get wasteLot;

  /// No description provided for @wasteMuch.
  ///
  /// In en, this message translates to:
  /// **'A lot'**
  String get wasteMuch;

  /// No description provided for @foodLocalTitle.
  ///
  /// In en, this message translates to:
  /// **'Mainly local and seasonal'**
  String get foodLocalTitle;

  /// No description provided for @foodLocalSub.
  ///
  /// In en, this message translates to:
  /// **'Reduces up to 0.1 tCO₂/year'**
  String get foodLocalSub;

  /// No description provided for @homeModuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Home & Energy'**
  String get homeModuleTitle;

  /// No description provided for @homeModuleWeight.
  ///
  /// In en, this message translates to:
  /// **'20–25% of your footprint'**
  String get homeModuleWeight;

  /// No description provided for @homeQ1.
  ///
  /// In en, this message translates to:
  /// **'How many people live in your home?'**
  String get homeQ1;

  /// No description provided for @homePersonsHint.
  ///
  /// In en, this message translates to:
  /// **'{n} person{plural}'**
  String homePersonsHint(int n, String plural);

  /// No description provided for @homeQ2.
  ///
  /// In en, this message translates to:
  /// **'What is your main energy source?'**
  String get homeQ2;

  /// No description provided for @homeQ3.
  ///
  /// In en, this message translates to:
  /// **'How many kWh do you use per month?'**
  String get homeQ3;

  /// No description provided for @homeKwhHint.
  ///
  /// In en, this message translates to:
  /// **'{n} kWh'**
  String homeKwhHint(int n);

  /// No description provided for @homeKwhAvg.
  ///
  /// In en, this message translates to:
  /// **'Colombia household average: 170–250 kWh/month'**
  String get homeKwhAvg;

  /// No description provided for @homeQ4.
  ///
  /// In en, this message translates to:
  /// **'Do you have air conditioning or heating?'**
  String get homeQ4;

  /// No description provided for @homeACTitle.
  ///
  /// In en, this message translates to:
  /// **'Yes, I use AC / heating'**
  String get homeACTitle;

  /// No description provided for @homeACHoursHint.
  ///
  /// In en, this message translates to:
  /// **'{n} hours/day'**
  String homeACHoursHint(int n);

  /// No description provided for @energyGrid.
  ///
  /// In en, this message translates to:
  /// **'Power grid'**
  String get energyGrid;

  /// No description provided for @energySolar.
  ///
  /// In en, this message translates to:
  /// **'Solar'**
  String get energySolar;

  /// No description provided for @energyGas.
  ///
  /// In en, this message translates to:
  /// **'Natural gas'**
  String get energyGas;

  /// No description provided for @energyMixed.
  ///
  /// In en, this message translates to:
  /// **'Mixed'**
  String get energyMixed;

  /// No description provided for @shoppingModuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get shoppingModuleTitle;

  /// No description provided for @shoppingModuleWeight.
  ///
  /// In en, this message translates to:
  /// **'10–15% of your footprint'**
  String get shoppingModuleWeight;

  /// No description provided for @shoppingQ1.
  ///
  /// In en, this message translates to:
  /// **'How many clothing items do you buy per month?'**
  String get shoppingQ1;

  /// No description provided for @shoppingClothingHint.
  ///
  /// In en, this message translates to:
  /// **'{n} items'**
  String shoppingClothingHint(int n);

  /// No description provided for @shoppingQ2.
  ///
  /// In en, this message translates to:
  /// **'New electronic devices per year?'**
  String get shoppingQ2;

  /// No description provided for @shoppingElectronicsHint.
  ///
  /// In en, this message translates to:
  /// **'{n} devices'**
  String shoppingElectronicsHint(int n);

  /// No description provided for @shoppingQ3.
  ///
  /// In en, this message translates to:
  /// **'How many e-commerce packages do you receive per month?'**
  String get shoppingQ3;

  /// No description provided for @shoppingPackagesHint.
  ///
  /// In en, this message translates to:
  /// **'{n} packages'**
  String shoppingPackagesHint(int n);

  /// No description provided for @shoppingQ4.
  ///
  /// In en, this message translates to:
  /// **'Do you buy secondhand clothing or items?'**
  String get shoppingQ4;

  /// No description provided for @shoppingSecondHandTitle.
  ///
  /// In en, this message translates to:
  /// **'Yes, I buy secondhand frequently'**
  String get shoppingSecondHandTitle;

  /// No description provided for @shoppingSecondHandSub.
  ///
  /// In en, this message translates to:
  /// **'Reduces your consumption footprint by up to 10%'**
  String get shoppingSecondHandSub;

  /// No description provided for @wasteModuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Waste'**
  String get wasteModuleTitle;

  /// No description provided for @wasteModuleWeight.
  ///
  /// In en, this message translates to:
  /// **'5–8% of your footprint'**
  String get wasteModuleWeight;

  /// No description provided for @wasteQ1.
  ///
  /// In en, this message translates to:
  /// **'How many trash bags do you generate per week?'**
  String get wasteQ1;

  /// No description provided for @wasteBagsHint.
  ///
  /// In en, this message translates to:
  /// **'{n} bag{plural}'**
  String wasteBagsHint(int n, String plural);

  /// No description provided for @wasteQ2.
  ///
  /// In en, this message translates to:
  /// **'Do you separate waste for recycling?'**
  String get wasteQ2;

  /// No description provided for @wasteSeparateTitle.
  ///
  /// In en, this message translates to:
  /// **'Yes, I separate plastic, paper and glass'**
  String get wasteSeparateTitle;

  /// No description provided for @wasteSeparateSub.
  ///
  /// In en, this message translates to:
  /// **'Reduces your waste footprint by 30%'**
  String get wasteSeparateSub;

  /// No description provided for @wasteQ3.
  ///
  /// In en, this message translates to:
  /// **'Do you compost organic waste?'**
  String get wasteQ3;

  /// No description provided for @wasteCompostTitle.
  ///
  /// In en, this message translates to:
  /// **'Yes, I compost'**
  String get wasteCompostTitle;

  /// No description provided for @wasteCompostSub.
  ///
  /// In en, this message translates to:
  /// **'Reduces methane emissions from landfill'**
  String get wasteCompostSub;

  /// No description provided for @waterModuleTitle.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get waterModuleTitle;

  /// No description provided for @waterModuleWeight.
  ///
  /// In en, this message translates to:
  /// **'~3% of your footprint'**
  String get waterModuleWeight;

  /// No description provided for @waterQ1.
  ///
  /// In en, this message translates to:
  /// **'How many minutes is your average shower?'**
  String get waterQ1;

  /// No description provided for @waterMinutesHint.
  ///
  /// In en, this message translates to:
  /// **'{n} minutes'**
  String waterMinutesHint(int n);

  /// No description provided for @waterQ2.
  ///
  /// In en, this message translates to:
  /// **'What temperature do you usually shower at?'**
  String get waterQ2;

  /// No description provided for @waterQ3.
  ///
  /// In en, this message translates to:
  /// **'Do you water a garden or green areas at home?'**
  String get waterQ3;

  /// No description provided for @waterGardenTitle.
  ///
  /// In en, this message translates to:
  /// **'Yes, I have a garden or water plants'**
  String get waterGardenTitle;

  /// No description provided for @tempCold.
  ///
  /// In en, this message translates to:
  /// **'Cold'**
  String get tempCold;

  /// No description provided for @tempColdSub.
  ///
  /// In en, this message translates to:
  /// **'No heater'**
  String get tempColdSub;

  /// No description provided for @tempWarm.
  ///
  /// In en, this message translates to:
  /// **'Warm'**
  String get tempWarm;

  /// No description provided for @tempWarmSub.
  ///
  /// In en, this message translates to:
  /// **'Moderate heater'**
  String get tempWarmSub;

  /// No description provided for @tempHot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get tempHot;

  /// No description provided for @tempHotSub.
  ///
  /// In en, this message translates to:
  /// **'Full heater'**
  String get tempHotSub;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @greetingWithName.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name} 👋'**
  String greetingWithName(String name);

  /// No description provided for @greetingEmpty.
  ///
  /// In en, this message translates to:
  /// **'Hello 👋'**
  String get greetingEmpty;

  /// No description provided for @addYourName.
  ///
  /// In en, this message translates to:
  /// **'Add your name'**
  String get addYourName;

  /// No description provided for @nameDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s your name?'**
  String get nameDialogTitle;

  /// No description provided for @nameDialogHint.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get nameDialogHint;

  /// No description provided for @nameOnCard.
  ///
  /// In en, this message translates to:
  /// **'name on card'**
  String get nameOnCard;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your footprint evolution'**
  String get historyTitle;

  /// No description provided for @historyMeasurements.
  ///
  /// In en, this message translates to:
  /// **'{n} measurements'**
  String historyMeasurements(int n);

  /// No description provided for @historyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No history yet'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptySub.
  ///
  /// In en, this message translates to:
  /// **'Update your modules on different days to track how your footprint evolves.'**
  String get historyEmptySub;

  /// No description provided for @historyOneMeasurement.
  ///
  /// In en, this message translates to:
  /// **'First measurement recorded! 🎉'**
  String get historyOneMeasurement;

  /// No description provided for @historyOneSub.
  ///
  /// In en, this message translates to:
  /// **'Come back tomorrow and update a module to see your evolution.'**
  String get historyOneSub;

  /// No description provided for @historyImproved.
  ///
  /// In en, this message translates to:
  /// **'↓ {pct}% since your first measurement'**
  String historyImproved(String pct);

  /// No description provided for @historyWorsened.
  ///
  /// In en, this message translates to:
  /// **'↑ {pct}% since your first measurement'**
  String historyWorsened(String pct);

  /// No description provided for @offsetTitle.
  ///
  /// In en, this message translates to:
  /// **'How to offset your footprint?'**
  String get offsetTitle;

  /// No description provided for @offsetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'While you reduce, you can neutralize the remaining CO₂'**
  String get offsetSubtitle;

  /// No description provided for @offsetTreesValue.
  ///
  /// In en, this message translates to:
  /// **'{n} trees'**
  String offsetTreesValue(int n);

  /// No description provided for @offsetTreesLabel.
  ///
  /// In en, this message translates to:
  /// **'to absorb your annual footprint'**
  String get offsetTreesLabel;

  /// No description provided for @offsetCostValue.
  ///
  /// In en, this message translates to:
  /// **'~{usd} USD/year'**
  String offsetCostValue(int usd);

  /// No description provided for @offsetCostMonthly.
  ///
  /// In en, this message translates to:
  /// **'~{usd} USD/month'**
  String offsetCostMonthly(int usd);

  /// No description provided for @offsetCostLabel.
  ///
  /// In en, this message translates to:
  /// **'in certified carbon credits'**
  String get offsetCostLabel;

  /// No description provided for @offsetReduceFirst.
  ///
  /// In en, this message translates to:
  /// **'Reduce first, offset later'**
  String get offsetReduceFirst;

  /// No description provided for @offsetReduceFirstDesc.
  ///
  /// In en, this message translates to:
  /// **'Carbon credits are a complement, not a substitute for reducing your footprint.'**
  String get offsetReduceFirstDesc;

  /// No description provided for @offsetPlatformsTitle.
  ///
  /// In en, this message translates to:
  /// **'Certified platforms'**
  String get offsetPlatformsTitle;

  /// No description provided for @offsetDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'* Estimate based on the voluntary carbon market (~\$20/t CO₂) and mature tree absorption (~21 kg CO₂/year).'**
  String get offsetDisclaimer;

  /// No description provided for @resultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Diagnosis complete!'**
  String get resultsTitle;

  /// No description provided for @resultsSub.
  ///
  /// In en, this message translates to:
  /// **'You have completed all 6 carbon footprint modules'**
  String get resultsSub;

  /// No description provided for @resultsYourFootprint.
  ///
  /// In en, this message translates to:
  /// **'Your annual carbon footprint'**
  String get resultsYourFootprint;

  /// No description provided for @resultsCompareTitle.
  ///
  /// In en, this message translates to:
  /// **'How do you compare?'**
  String get resultsCompareTitle;

  /// No description provided for @resultsYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get resultsYou;

  /// No description provided for @resultsParis.
  ///
  /// In en, this message translates to:
  /// **'Paris goal'**
  String get resultsParis;

  /// No description provided for @resultsColombia.
  ///
  /// In en, this message translates to:
  /// **'Colombia'**
  String get resultsColombia;

  /// No description provided for @resultsWorld.
  ///
  /// In en, this message translates to:
  /// **'World'**
  String get resultsWorld;

  /// No description provided for @resultsTopSources.
  ///
  /// In en, this message translates to:
  /// **'Main emission sources'**
  String get resultsTopSources;

  /// No description provided for @resultsAchievements.
  ///
  /// In en, this message translates to:
  /// **'Your achievements'**
  String get resultsAchievements;

  /// No description provided for @resultsEcoPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} EcoScore points'**
  String resultsEcoPoints(int points);

  /// No description provided for @resultsBadgesUnlocked.
  ///
  /// In en, this message translates to:
  /// **'achievements unlocked'**
  String get resultsBadgesUnlocked;

  /// No description provided for @resultsViewDashboard.
  ///
  /// In en, this message translates to:
  /// **'View full Dashboard'**
  String get resultsViewDashboard;

  /// No description provided for @resultsViewPlan.
  ///
  /// In en, this message translates to:
  /// **'Create my Action Plan'**
  String get resultsViewPlan;

  /// No description provided for @resultsViewAgain.
  ///
  /// In en, this message translates to:
  /// **'See my results 🏆'**
  String get resultsViewAgain;

  /// No description provided for @shareResult.
  ///
  /// In en, this message translates to:
  /// **'Share my result'**
  String get shareResult;

  /// No description provided for @exportResult.
  ///
  /// In en, this message translates to:
  /// **'Export image'**
  String get exportResult;

  /// No description provided for @downloadImage.
  ///
  /// In en, this message translates to:
  /// **'Download image'**
  String get downloadImage;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @homeWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Know your carbon footprint'**
  String get homeWelcomeTitle;

  /// No description provided for @homeWelcomeSub.
  ///
  /// In en, this message translates to:
  /// **'Complete the 6 diagnosis modules and discover how you can reduce your impact on the planet.'**
  String get homeWelcomeSub;

  /// No description provided for @homeStartTest.
  ///
  /// In en, this message translates to:
  /// **'Start my diagnosis'**
  String get homeStartTest;

  /// No description provided for @homeUpdateTest.
  ///
  /// In en, this message translates to:
  /// **'Update my test'**
  String get homeUpdateTest;

  /// No description provided for @homeViewFullFootprint.
  ///
  /// In en, this message translates to:
  /// **'View full analysis'**
  String get homeViewFullFootprint;

  /// No description provided for @homeModulesStatus.
  ///
  /// In en, this message translates to:
  /// **'{completed} of 6 modules complete'**
  String homeModulesStatus(int completed);
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
      <String>['de', 'en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
