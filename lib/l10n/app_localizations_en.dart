// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'FootCarbonPrint';

  @override
  String get tagline => 'Know Your Footprint. Change Your World.';

  @override
  String get save => 'Save';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get goToTest => 'Go to test';

  @override
  String get startTest => 'Start my test!';

  @override
  String get startTestNow => 'Start the test now! 🚀';

  @override
  String get co2PerYear => 'tonnes CO₂/year';

  @override
  String get co2Unit => 't CO₂/year';

  @override
  String get moduleEstimate => 'Estimated from this module';

  @override
  String get saveModule => 'Save module';

  @override
  String get completedCheck => 'Completed ✓';

  @override
  String get tapToStart => 'Tap to start';

  @override
  String get onb1Title => 'How much do you\npollute without knowing?';

  @override
  String get onb1Sub =>
      'Most people emit more CO₂ than they think. In less than 7 minutes, discover your real impact on the planet.';

  @override
  String get onb2Title => 'Your footprint,\nin real data';

  @override
  String get onb2Sub =>
      'We calculate your annual carbon footprint broken down by category: transport, food, home, shopping, waste, and water.';

  @override
  String get onb3Title => 'An action plan\nthat actually works';

  @override
  String get onb3Sub =>
      'We don\'t just measure — we tell you exactly what to change and how much CO₂ you save with each action. Step by step.';

  @override
  String get tabTest => 'My Test';

  @override
  String get tabFootprint => 'My Footprint';

  @override
  String get tabPlan => 'Plan';

  @override
  String get testHubTitle => 'Your Carbon\nFootprint Self-Test';

  @override
  String get testHubSub => 'Complete modules to discover your impact';

  @override
  String modulesProgress(int completed, int total) {
    return '$completed of $total modules';
  }

  @override
  String get viewMyFootprint => 'View My Carbon Footprint';

  @override
  String get learnBannerFirstTitle => 'First time here?';

  @override
  String get learnBannerFirstSub => 'Learn about carbon footprint in 2 minutes';

  @override
  String get learnBannerReturnTitle => 'Carbon Footprint Guide';

  @override
  String get learnBannerReturnSub =>
      'Review the key concepts — 6 visual lessons';

  @override
  String get modTransport => 'Transport';

  @override
  String get modTransportWeight => '28–35%';

  @override
  String get modFood => 'Food';

  @override
  String get modFoodWeight => '25–30%';

  @override
  String get modHome => 'Home';

  @override
  String get modHomeWeight => '20–25%';

  @override
  String get modShopping => 'Shopping';

  @override
  String get modShoppingWeight => '10–15%';

  @override
  String get modWaste => 'Waste';

  @override
  String get modWasteWeight => '5–8%';

  @override
  String get modWater => 'Water';

  @override
  String get modWaterWeight => '~3%';

  @override
  String get dashEmptyTitle => 'No results yet';

  @override
  String get dashEmptySub =>
      'Complete at least one test module to see your carbon footprint here.';

  @override
  String get dashAppBarTitle => 'Your Carbon Footprint';

  @override
  String get equivalencesTitle => 'Your footprint equals...';

  @override
  String get treesLabel => 'trees\ncut/year';

  @override
  String get bulbYearsLabel => 'light bulb\nyears';

  @override
  String get phoneChargesLabel => 'smartphone\ncharges';

  @override
  String get breakdownTitle => 'Breakdown by category';

  @override
  String get benchmarkTitle => 'Global comparison';

  @override
  String get yourFootprint => 'Your footprint';

  @override
  String get parisTarget => 'Paris 2050 target';

  @override
  String get colombiaAvg => 'Colombia average';

  @override
  String get worldAvg => 'World average';

  @override
  String get viewActionPlan => 'View Action Plan';

  @override
  String get ecoPoints => 'eco points';

  @override
  String nextLevelLabel(String emoji, String name) {
    return 'Next: $emoji $name';
  }

  @override
  String ptsMore(int pts) {
    return '$pts pts more';
  }

  @override
  String get maxLevelReached => 'Maximum level reached! 🎉';

  @override
  String get myAchievements => 'My achievements';

  @override
  String get shareMyLevel => 'Share my level';

  @override
  String get shareSub => 'Download your eco card and share it on social media';

  @override
  String get lvlChampion => 'Green Champion';

  @override
  String get lvlConscious => 'Conscious';

  @override
  String get lvlOntrack => 'On Track';

  @override
  String get lvlHigh => 'High Impact';

  @override
  String get lvlCritical => 'Critical';

  @override
  String get ecoLvlBeginner => 'Beginner';

  @override
  String get ecoLvlLearner => 'Learner';

  @override
  String get ecoLvlConscious => 'Conscious';

  @override
  String get ecoLvlActivist => 'Activist';

  @override
  String get ecoLvlChampion => 'Eco-Champion';

  @override
  String get badgeFirstStep => 'First Step';

  @override
  String get badgeFirstStepDesc => 'Complete your first test module';

  @override
  String get badgeExplorer => 'Explorer';

  @override
  String get badgeExplorerDesc => 'Complete 3 test modules';

  @override
  String get badgeCompletionist => 'Completionist';

  @override
  String get badgeCompletionistDesc => 'Complete all 6 test modules';

  @override
  String get badgeEducated => 'Educated';

  @override
  String get badgeEducatedDesc => 'Finish the learning guide';

  @override
  String get badgeConscious => 'Conscious';

  @override
  String get badgeConsciousDesc => 'Achieve a footprint below 3 tonnes';

  @override
  String get badgeChampion => 'Light Footprint';

  @override
  String get badgeChampionDesc => 'Achieve a footprint below 1.5 tonnes';

  @override
  String get badgeCommitted => 'Committed';

  @override
  String get badgeCommittedDesc => 'Commit to at least 1 action';

  @override
  String get badgeActivist => 'Activist';

  @override
  String get badgeActivistDesc => 'Commit to 5 actions from the plan';

  @override
  String badgeLocked(String description) {
    return '🔒 $description';
  }

  @override
  String get actionPlanTitle => 'Action Plan';

  @override
  String get actionPlanEmptyTitle => 'No plan yet';

  @override
  String get actionPlanEmptySub =>
      'Complete at least one test module to see your personalized action plan.';

  @override
  String get reductionTitle => 'How much can you reduce?';

  @override
  String reductionSub(int pct) {
    return 'up to $pct% with the actions below';
  }

  @override
  String get actionsTitle => 'Your top actions by impact';

  @override
  String get actionsSub => 'Sorted from highest to lowest reduction potential';

  @override
  String get commit => 'I commit';

  @override
  String get committedLabel => '✓ Committed';

  @override
  String get challengesTitle => 'Weekly challenges 🎯';

  @override
  String get challengesSub => 'Small changes with big impact';

  @override
  String get actionFlightTitle => 'Eliminate 1 long-haul flight per year';

  @override
  String get actionFlightDesc =>
      'A long-distance flight emits more CO₂ than 2 months of driving.';

  @override
  String get actionFlexitarianTitle => 'Adopt a flexitarian diet';

  @override
  String get actionFlexitarianDesc =>
      'Reducing meat to 2–3 times per week has a huge impact.';

  @override
  String get actionPublicTransportTitle => 'Use public transport 2 days/week';

  @override
  String get actionPublicTransportDesc =>
      'Leaving the car 2 days avoids ~350 kg CO₂ per year.';

  @override
  String get actionLessBeefTitle => 'Skip beef 3 days/week';

  @override
  String get actionLessBeefDesc =>
      'Beef emits 27 kgCO₂/kg — the highest of all foods.';

  @override
  String get actionLedTitle => 'Switch to LED bulbs';

  @override
  String get actionLedDesc =>
      'LEDs use 75% less energy than incandescent bulbs.';

  @override
  String get actionShortShowerTitle => 'Showers of max 5 minutes';

  @override
  String get actionShortShowerDesc =>
      'Reducing your shower to 5 min with hot water saves 100 kgCO₂/year.';

  @override
  String get actionRecycleTitle => 'Separate waste for recycling';

  @override
  String get actionRecycleDesc =>
      'Recycling prevents anaerobic decomposition that produces methane.';

  @override
  String get actionSecondhandTitle => 'Buy 50% secondhand clothing';

  @override
  String get actionSecondhandDesc =>
      'The textile industry is one of the most polluting in the world.';

  @override
  String get actionCompostTitle => 'Compost organic waste';

  @override
  String get actionCompostDesc =>
      'Composting prevents organic waste from producing methane in landfills.';

  @override
  String get actionBikeTitle => 'Bike or walk to work';

  @override
  String get actionBikeDesc => 'Zero emissions + health benefits.';

  @override
  String get challenge1 => 'One week without single-use plastic';

  @override
  String get challenge2 => '7 days without red meat';

  @override
  String get challenge3 => 'Bike or walk 3 days this week';

  @override
  String get challenge4 => 'Shower in max 5 minutes for 5 days';

  @override
  String get learnGuideTitle => 'Carbon Footprint Guide';

  @override
  String get learnNext => 'Next →';

  @override
  String get l1Title => 'The planet\nhas a fever';

  @override
  String get l1Body =>
      'Imagine the Earth is your body. When you have a fever of just 1°C, you already feel terrible. The Earth is already 1.2°C warmer than 150 years ago… and it keeps rising every year.';

  @override
  String get l1FactLabel => 'FACT';

  @override
  String get l1Fact =>
      '2023 was the hottest year ever recorded. The 10 hottest years in history have all been in the last 10 years.';

  @override
  String get l1TempLow => 'Slight glacial melting';

  @override
  String get l1TempNow => 'Where we are today 📍';

  @override
  String get l1TempHeat => 'Extreme heat waves';

  @override
  String get l1TempCrisis => 'Civilization at risk';

  @override
  String get l2Title => 'The invisible\ngas';

  @override
  String get l2Body =>
      'When you burn gasoline, gas or coal — or when food decomposes — CO₂ is released. This gas acts like a blanket: it lets the sun\'s heat in, but doesn\'t let it out. The planet warms.';

  @override
  String get l2FactLabel => 'ANALOGY';

  @override
  String get l2Fact =>
      'It\'s like leaving the car running inside a closed garage. Except the garage is the entire Earth\'s atmosphere.';

  @override
  String get l2Step1 => 'Sun sends\nheat';

  @override
  String get l2Step2 => 'Earth\nreceives';

  @override
  String get l2Step3 => 'CO₂ traps\nthe heat';

  @override
  String get l2Result => '🌡️ Heat can\'t escape → temperature rises';

  @override
  String get l3Title => 'Your personal\nfootprint';

  @override
  String get l3Body =>
      'Your \"carbon footprint\" is the total CO₂ you produce in a year. It includes everything you consume: the bus you take, the burger you eat, the shirt you buy, the hot shower you take.';

  @override
  String get l3FactLabel => 'IN COLOMBIA';

  @override
  String get l3Fact =>
      'A Colombian produces an average of 1.8 tonnes of CO₂ per year. The world average is 4.7 t. The target to save the planet is to reach 2 t before 2030.';

  @override
  String get l3ColombiaLabel => 'Colombia\naverage';

  @override
  String get l3WorldLabel => 'World\naverage';

  @override
  String get l3TargetLabel => '2030\nTarget 🎯';

  @override
  String get l4Title => 'Where does\nit come from?';

  @override
  String get l4Body =>
      'It\'s not just cars that pollute. Your footprint comes from 6 major categories of your daily life. Some are surprising: beef emits more CO₂ than driving a car.';

  @override
  String get l4FactLabel => 'THE 6 CATEGORIES';

  @override
  String get l4Fact =>
      'Transport and food together account for more than 55% of your total footprint.';

  @override
  String get l5Title => 'How much\nis too much?';

  @override
  String get l5Body =>
      'There is a global target: to avoid the worst effects of climate change, every person in the world needs to reach less than 2 tonnes of CO₂ per year by 2030.';

  @override
  String get l5FactLabel => 'COMPARISON';

  @override
  String get l5Fact =>
      'A US citizen produces 15 t/year. A German: 9 t. A Colombian: 1.8 t. But quality of life doesn\'t have to drop to reduce your footprint.';

  @override
  String get l6Title => 'You can\nchange something';

  @override
  String get l6Body =>
      'You don\'t need to be an activist or change your life overnight. Small changes in your transport, food, and home habits can reduce your footprint by up to 40%.';

  @override
  String get l6FactLabel => 'THE FIRST STEP';

  @override
  String get l6Fact =>
      'Knowing your footprint is the first step. What you don\'t measure, you can\'t improve. Take the test now!';

  @override
  String get l6Action1 => 'Eat less meat';

  @override
  String get l6Action2 => 'Use public transport';

  @override
  String get l6Action3 => 'Skip 1 long-haul flight';

  @override
  String get l6Action4 => 'Switch to LED';

  @override
  String get l6ActionsLabel => 'High-impact actions:';

  @override
  String get profileCardTitle => 'My Eco Card';

  @override
  String get profileCardPreview =>
      'Preview — share your level on social media 🌍';

  @override
  String get photoDialogTitle => 'Add your photo?';

  @override
  String get photoDialogContent =>
      'You can personalize the card with your profile photo, or just use your level emoji.';

  @override
  String get emojiOnly => 'Emoji only';

  @override
  String get choosePhoto => 'Choose photo';

  @override
  String get addPhoto => 'Add photo';

  @override
  String get changePhoto => 'Change photo';

  @override
  String get generating => 'Generating...';

  @override
  String get downloadPng => 'Download PNG';

  @override
  String get cardDownloaded => 'Card downloaded! 🌿';

  @override
  String get downloadHint =>
      'The image downloads at 1080×1080 px,\nperfect for Instagram, WhatsApp and Twitter.';

  @override
  String get cardFooterText => 'Know your footprint. Change your world.';

  @override
  String get statsModules => 'Modules';

  @override
  String get statsAchievements => 'Achievements';

  @override
  String get transportModuleTitle => 'Transport';

  @override
  String get transportModuleWeight => '28–35% of your footprint';

  @override
  String get transportQ1 => 'What is your main mode of transport?';

  @override
  String get transportQ2 => 'How many km do you travel per week?';

  @override
  String transportKmHint(int km) {
    return '$km km/week';
  }

  @override
  String get transportQ3 => 'How many flights do you take per year?';

  @override
  String get flightShort => 'Short (< 3h)';

  @override
  String get flightMedium => 'Medium (3–6h)';

  @override
  String get flightLong => 'Long (> 6h)';

  @override
  String get vehicleGasoline => 'Gasoline';

  @override
  String get vehicleDiesel => 'Diesel';

  @override
  String get vehicleHybrid => 'Hybrid';

  @override
  String get vehicleElectric => 'Electric';

  @override
  String get vehicleMotorcycle => 'Motorcycle';

  @override
  String get vehicleBus => 'Bus/Metro';

  @override
  String get vehicleBicycle => 'Bicycle';

  @override
  String get vehicleWalking => 'Walking';

  @override
  String get foodModuleTitle => 'Food';

  @override
  String get foodModuleWeight => '25–30% of your footprint';

  @override
  String get foodQ1 => 'How would you describe your diet?';

  @override
  String get foodQ2 => 'How many times a week do you eat beef?';

  @override
  String foodBeefHint(int n) {
    return '$n times';
  }

  @override
  String get foodQ3 => 'How much food do you waste?';

  @override
  String get foodQ4 => 'Do you eat local and seasonal food?';

  @override
  String get dietVegan => 'Vegan';

  @override
  String get dietVeganSub => 'Plants only';

  @override
  String get dietVegetarian => 'Vegetarian';

  @override
  String get dietVegetarianSub => 'No meat';

  @override
  String get dietFlexitarian => 'Flexitarian';

  @override
  String get dietFlexitarianSub => 'Little meat';

  @override
  String get dietOmnivore => 'Omnivore';

  @override
  String get dietOmnivoreSub => 'Regular meat';

  @override
  String get dietCarnivore => 'High meat';

  @override
  String get dietCarnivoreSub => 'Meat daily';

  @override
  String get wasteNone => 'Almost none';

  @override
  String get wasteSome => 'Some';

  @override
  String get wasteLot => 'Quite a bit';

  @override
  String get wasteMuch => 'A lot';

  @override
  String get foodLocalTitle => 'Mainly local and seasonal';

  @override
  String get foodLocalSub => 'Reduces up to 0.1 tCO₂/year';

  @override
  String get homeModuleTitle => 'Home & Energy';

  @override
  String get homeModuleWeight => '20–25% of your footprint';

  @override
  String get homeQ1 => 'How many people live in your home?';

  @override
  String homePersonsHint(int n, String plural) {
    return '$n person$plural';
  }

  @override
  String get homeQ2 => 'What is your main energy source?';

  @override
  String get homeQ3 => 'How many kWh do you use per month?';

  @override
  String homeKwhHint(int n) {
    return '$n kWh';
  }

  @override
  String get homeKwhAvg => 'Colombia household average: 170–250 kWh/month';

  @override
  String get homeQ4 => 'Do you have air conditioning or heating?';

  @override
  String get homeACTitle => 'Yes, I use AC / heating';

  @override
  String homeACHoursHint(int n) {
    return '$n hours/day';
  }

  @override
  String get energyGrid => 'Power grid';

  @override
  String get energySolar => 'Solar';

  @override
  String get energyGas => 'Natural gas';

  @override
  String get energyMixed => 'Mixed';

  @override
  String get shoppingModuleTitle => 'Shopping';

  @override
  String get shoppingModuleWeight => '10–15% of your footprint';

  @override
  String get shoppingQ1 => 'How many clothing items do you buy per month?';

  @override
  String shoppingClothingHint(int n) {
    return '$n items';
  }

  @override
  String get shoppingQ2 => 'New electronic devices per year?';

  @override
  String shoppingElectronicsHint(int n) {
    return '$n devices';
  }

  @override
  String get shoppingQ3 =>
      'How many e-commerce packages do you receive per month?';

  @override
  String shoppingPackagesHint(int n) {
    return '$n packages';
  }

  @override
  String get shoppingQ4 => 'Do you buy secondhand clothing or items?';

  @override
  String get shoppingSecondHandTitle => 'Yes, I buy secondhand frequently';

  @override
  String get shoppingSecondHandSub =>
      'Reduces your consumption footprint by up to 10%';

  @override
  String get wasteModuleTitle => 'Waste';

  @override
  String get wasteModuleWeight => '5–8% of your footprint';

  @override
  String get wasteQ1 => 'How many trash bags do you generate per week?';

  @override
  String wasteBagsHint(int n, String plural) {
    return '$n bag$plural';
  }

  @override
  String get wasteQ2 => 'Do you separate waste for recycling?';

  @override
  String get wasteSeparateTitle => 'Yes, I separate plastic, paper and glass';

  @override
  String get wasteSeparateSub => 'Reduces your waste footprint by 30%';

  @override
  String get wasteQ3 => 'Do you compost organic waste?';

  @override
  String get wasteCompostTitle => 'Yes, I compost';

  @override
  String get wasteCompostSub => 'Reduces methane emissions from landfill';

  @override
  String get waterModuleTitle => 'Water';

  @override
  String get waterModuleWeight => '~3% of your footprint';

  @override
  String get waterQ1 => 'How many minutes is your average shower?';

  @override
  String waterMinutesHint(int n) {
    return '$n minutes';
  }

  @override
  String get waterQ2 => 'What temperature do you usually shower at?';

  @override
  String get waterQ3 => 'Do you water a garden or green areas at home?';

  @override
  String get waterGardenTitle => 'Yes, I have a garden or water plants';

  @override
  String get tempCold => 'Cold';

  @override
  String get tempColdSub => 'No heater';

  @override
  String get tempWarm => 'Warm';

  @override
  String get tempWarmSub => 'Moderate heater';

  @override
  String get tempHot => 'Hot';

  @override
  String get tempHotSub => 'Full heater';

  @override
  String get cancel => 'Cancel';

  @override
  String greetingWithName(String name) {
    return 'Hello, $name 👋';
  }

  @override
  String get greetingEmpty => 'Hello 👋';

  @override
  String get addYourName => 'Add your name';

  @override
  String get nameDialogTitle => 'What\'s your name?';

  @override
  String get nameDialogHint => 'Your name';

  @override
  String get nameOnCard => 'name on card';

  @override
  String get historyTitle => 'Your footprint evolution';

  @override
  String historyMeasurements(int n) {
    return '$n measurements';
  }

  @override
  String get historyEmptyTitle => 'No history yet';

  @override
  String get historyEmptySub =>
      'Update your modules on different days to track how your footprint evolves.';

  @override
  String get historyOneMeasurement => 'First measurement recorded! 🎉';

  @override
  String get historyOneSub =>
      'Come back tomorrow and update a module to see your evolution.';

  @override
  String historyImproved(String pct) {
    return '↓ $pct% since your first measurement';
  }

  @override
  String historyWorsened(String pct) {
    return '↑ $pct% since your first measurement';
  }
}
