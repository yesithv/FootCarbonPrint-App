// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'FootCarbonPrint';

  @override
  String get tagline => 'Connais ton empreinte. Change ton monde.';

  @override
  String get save => 'Enregistrer';

  @override
  String get next => 'Suivant';

  @override
  String get skip => 'Passer';

  @override
  String get goToTest => 'Aller au test';

  @override
  String get startTest => 'Commencer mon test !';

  @override
  String get startTestNow => 'Faire le test maintenant ! 🚀';

  @override
  String get co2PerYear => 'tonnes CO₂/an';

  @override
  String get co2Unit => 't CO₂/an';

  @override
  String get moduleEstimate => 'Estimation de ce module';

  @override
  String get saveModule => 'Enregistrer le module';

  @override
  String get completedCheck => 'Terminé ✓';

  @override
  String get tapToStart => 'Appuyez pour commencer';

  @override
  String get onb1Title => 'Combien polluez-vous\nsans le savoir ?';

  @override
  String get onb1Sub =>
      'La plupart des gens émettent plus de CO₂ qu\'ils ne le pensent. En moins de 7 minutes, découvrez votre impact réel sur la planète.';

  @override
  String get onb2Title => 'Votre empreinte,\nen données réelles';

  @override
  String get onb2Sub =>
      'Nous calculons votre empreinte carbone annuelle par catégorie : transport, alimentation, logement, achats, déchets et eau.';

  @override
  String get onb3Title => 'Un plan d\'action\nqui fonctionne vraiment';

  @override
  String get onb3Sub =>
      'Nous ne faisons pas que mesurer — nous vous disons exactement quoi changer et combien de CO₂ vous économisez à chaque action. Étape par étape.';

  @override
  String get tabTest => 'Mon test';

  @override
  String get tabFootprint => 'Mon empreinte';

  @override
  String get tabPlan => 'Plan';

  @override
  String get testHubTitle => 'Auto-test de votre\nempreinte carbone';

  @override
  String get testHubSub => 'Complétez les modules pour découvrir votre impact';

  @override
  String modulesProgress(int completed, int total) {
    return '$completed sur $total modules';
  }

  @override
  String get viewMyFootprint => 'Voir mon empreinte carbone';

  @override
  String get learnBannerFirstTitle => 'Première fois ici ?';

  @override
  String get learnBannerFirstSub =>
      'Découvrez l\'empreinte carbone en 2 minutes';

  @override
  String get learnBannerReturnTitle => 'Guide de l\'empreinte carbone';

  @override
  String get learnBannerReturnSub =>
      'Revoyez les concepts clés — 6 leçons visuelles';

  @override
  String get modTransport => 'Transport';

  @override
  String get modTransportWeight => '28–35 %';

  @override
  String get modFood => 'Alimentation';

  @override
  String get modFoodWeight => '25–30 %';

  @override
  String get modHome => 'Logement';

  @override
  String get modHomeWeight => '20–25 %';

  @override
  String get modShopping => 'Achats';

  @override
  String get modShoppingWeight => '10–15 %';

  @override
  String get modWaste => 'Déchets';

  @override
  String get modWasteWeight => '5–8 %';

  @override
  String get modWater => 'Eau';

  @override
  String get modWaterWeight => '~3 %';

  @override
  String get dashEmptyTitle => 'Pas encore de résultats';

  @override
  String get dashEmptySub =>
      'Complétez au moins un module du test pour voir votre empreinte carbone ici.';

  @override
  String get dashAppBarTitle => 'Votre empreinte carbone';

  @override
  String get equivalencesTitle => 'Votre empreinte équivaut à...';

  @override
  String get treesLabel => 'arbres\ncoupés/an';

  @override
  String get bulbYearsLabel => 'années\nd\'ampoule';

  @override
  String get phoneChargesLabel => 'charges de\nsmartphone';

  @override
  String get breakdownTitle => 'Répartition par catégorie';

  @override
  String get benchmarkTitle => 'Comparaison mondiale';

  @override
  String get yourFootprint => 'Votre empreinte';

  @override
  String get parisTarget => 'Objectif Paris 2050';

  @override
  String get colombiaAvg => 'Moyenne Colombie';

  @override
  String get worldAvg => 'Moyenne mondiale';

  @override
  String get viewActionPlan => 'Voir le plan d\'action';

  @override
  String get ecoPoints => 'éco-points';

  @override
  String nextLevelLabel(String emoji, String name) {
    return 'Suivant : $emoji $name';
  }

  @override
  String ptsMore(int pts) {
    return '$pts pts de plus';
  }

  @override
  String get maxLevelReached => 'Niveau maximum atteint ! 🎉';

  @override
  String get myAchievements => 'Mes réussites';

  @override
  String get shareMyLevel => 'Partager mon niveau';

  @override
  String get shareSub =>
      'Téléchargez votre éco-carte et partagez-la sur les réseaux sociaux';

  @override
  String get lvlChampion => 'Champion Vert';

  @override
  String get lvlConscious => 'Conscient';

  @override
  String get lvlOntrack => 'Sur la bonne voie';

  @override
  String get lvlHigh => 'Fort impact';

  @override
  String get lvlCritical => 'Critique';

  @override
  String get ecoLvlBeginner => 'Débutant';

  @override
  String get ecoLvlLearner => 'Apprenti';

  @override
  String get ecoLvlConscious => 'Conscient';

  @override
  String get ecoLvlActivist => 'Activiste';

  @override
  String get ecoLvlChampion => 'Éco-Champion';

  @override
  String get badgeFirstStep => 'Premier pas';

  @override
  String get badgeFirstStepDesc => 'Complétez votre premier module de test';

  @override
  String get badgeExplorer => 'Explorateur';

  @override
  String get badgeExplorerDesc => 'Complétez 3 modules de test';

  @override
  String get badgeCompletionist => 'Complétiste';

  @override
  String get badgeCompletionistDesc => 'Complétez les 6 modules de test';

  @override
  String get badgeEducated => 'Informé';

  @override
  String get badgeEducatedDesc => 'Terminez le guide d\'apprentissage';

  @override
  String get badgeConscious => 'Conscient';

  @override
  String get badgeConsciousDesc =>
      'Atteignez une empreinte inférieure à 3 tonnes';

  @override
  String get badgeChampion => 'Empreinte légère';

  @override
  String get badgeChampionDesc =>
      'Atteignez une empreinte inférieure à 1,5 tonne';

  @override
  String get badgeCommitted => 'Engagé';

  @override
  String get badgeCommittedDesc => 'Engagez-vous sur au moins 1 action';

  @override
  String get badgeActivist => 'Activiste';

  @override
  String get badgeActivistDesc => 'Engagez-vous sur 5 actions du plan';

  @override
  String badgeLocked(String description) {
    return '🔒 $description';
  }

  @override
  String get actionPlanTitle => 'Plan d\'action';

  @override
  String get actionPlanEmptyTitle => 'Pas encore de plan';

  @override
  String get actionPlanEmptySub =>
      'Complétez au moins un module du test pour voir votre plan d\'action personnalisé.';

  @override
  String get reductionTitle => 'Combien pouvez-vous réduire ?';

  @override
  String reductionSub(int pct) {
    return 'jusqu\'à $pct % avec les actions ci-dessous';
  }

  @override
  String get actionsTitle => 'Vos meilleures actions par impact';

  @override
  String get actionsSub =>
      'Personnalisées selon votre empreinte — triées par potentiel de réduction';

  @override
  String get commit => 'Je m\'engage';

  @override
  String get committedLabel => '✓ Engagé';

  @override
  String get challengesTitle => 'Défis hebdomadaires 🎯';

  @override
  String get challengesSub => 'De petits changements à grand impact';

  @override
  String get actionFlightTitle => 'Supprimer 1 vol long-courrier par an';

  @override
  String get actionFlightDesc =>
      'Un vol longue distance émet plus de CO₂ que 2 mois de conduite.';

  @override
  String get actionFlexitarianTitle => 'Adopter un régime flexitarien';

  @override
  String get actionFlexitarianDesc =>
      'Réduire la viande à 2–3 fois par semaine a un impact énorme.';

  @override
  String get actionPublicTransportTitle =>
      'Prendre les transports en commun 2 jours/semaine';

  @override
  String get actionPublicTransportDesc =>
      'Laisser la voiture 2 jours évite ~350 kg de CO₂ par an.';

  @override
  String get actionLessBeefTitle => 'Éviter le bœuf 3 jours/semaine';

  @override
  String get actionLessBeefDesc =>
      'Le bœuf émet 27 kgCO₂/kg — le plus élevé de tous les aliments.';

  @override
  String get actionLedTitle => 'Passer aux ampoules LED';

  @override
  String get actionLedDesc =>
      'Les LED consomment 75 % d\'énergie en moins que les ampoules à incandescence.';

  @override
  String get actionShortShowerTitle => 'Douches de 5 minutes maximum';

  @override
  String get actionShortShowerDesc =>
      'Réduire votre douche à 5 min à l\'eau chaude économise 100 kgCO₂/an.';

  @override
  String get actionRecycleTitle => 'Trier les déchets pour le recyclage';

  @override
  String get actionRecycleDesc =>
      'Le recyclage évite la décomposition anaérobie qui produit du méthane.';

  @override
  String get actionSecondhandTitle => 'Acheter 50 % de vêtements d\'occasion';

  @override
  String get actionSecondhandDesc =>
      'L\'industrie textile est l\'une des plus polluantes au monde.';

  @override
  String get actionCompostTitle => 'Composter les déchets organiques';

  @override
  String get actionCompostDesc =>
      'Le compostage évite que les déchets organiques produisent du méthane dans les décharges.';

  @override
  String get actionBikeTitle => 'Aller au travail à vélo ou à pied';

  @override
  String get actionBikeDesc => 'Zéro émission + bienfaits pour la santé.';

  @override
  String get challengeWeekLabel => 'Défi de la semaine';

  @override
  String get challengeExpiresLabel => 'Expire ce dimanche';

  @override
  String challengePts(int pts) {
    return '+$pts pts';
  }

  @override
  String get challengeMarkDone => 'Je l\'ai fait ! Marquer comme terminé';

  @override
  String get challengeCompletedLabel => 'Défi terminé cette semaine ! 🎉';

  @override
  String get challengeCompletedSub => 'Vous avez gagné +25 pts';

  @override
  String get challenge1 => 'Une semaine sans plastique à usage unique';

  @override
  String get challengeDesc1 =>
      'Apportez un sac réutilisable et dites non aux gobelets, pailles et sacs en plastique pendant 7 jours.';

  @override
  String get challengeEmoji1 => '🛍️';

  @override
  String get challenge2 => '7 jours sans viande rouge';

  @override
  String get challengeDesc2 =>
      'Remplacez le bœuf par du poulet, du poisson, des légumineuses ou du tofu toute la semaine.';

  @override
  String get challengeEmoji2 => '🥩';

  @override
  String get challenge3 => 'Vélo ou marche 3 jours cette semaine';

  @override
  String get challengeDesc3 =>
      'Au moins 3 jours cette semaine, laissez la voiture et utilisez un vélo, une trottinette ou vos pieds.';

  @override
  String get challengeEmoji3 => '🚲';

  @override
  String get challenge4 => 'Douche de 5 minutes max pendant 5 jours';

  @override
  String get challengeDesc4 =>
      'Utilisez un minuteur — 5 minutes max à l\'eau chaude, pendant 5 jours consécutifs.';

  @override
  String get challengeEmoji4 => '🚿';

  @override
  String get learnGuideTitle => 'Guide de l\'empreinte carbone';

  @override
  String get learnNext => 'Suivant →';

  @override
  String get l1Title => 'La planète\na de la fièvre';

  @override
  String get l1Body =>
      'Imaginez que la Terre est votre corps. Avec seulement 1 °C de fièvre, vous vous sentez déjà très mal. La Terre est déjà 1,2 °C plus chaude qu\'il y a 150 ans… et cela continue d\'augmenter chaque année.';

  @override
  String get l1FactLabel => 'FAIT';

  @override
  String get l1Fact =>
      '2023 a été l\'année la plus chaude jamais enregistrée. Les 10 années les plus chaudes de l\'histoire se situent toutes dans les 10 dernières années.';

  @override
  String get l1TempLow => 'Légère fonte des glaciers';

  @override
  String get l1TempNow => 'Où nous en sommes aujourd\'hui 📍';

  @override
  String get l1TempHeat => 'Vagues de chaleur extrêmes';

  @override
  String get l1TempCrisis => 'Civilisation en danger';

  @override
  String get l2Title => 'Le gaz\ninvisible';

  @override
  String get l2Body =>
      'Quand vous brûlez de l\'essence, du gaz ou du charbon — ou quand des aliments se décomposent — du CO₂ est libéré. Ce gaz agit comme une couverture : il laisse entrer la chaleur du soleil, mais ne la laisse pas sortir. La planète se réchauffe.';

  @override
  String get l2FactLabel => 'ANALOGIE';

  @override
  String get l2Fact =>
      'C\'est comme laisser tourner la voiture dans un garage fermé. Sauf que le garage est toute l\'atmosphère terrestre.';

  @override
  String get l2Step1 => 'Le soleil\nenvoie la chaleur';

  @override
  String get l2Step2 => 'La Terre\nreçoit';

  @override
  String get l2Step3 => 'Le CO₂ piège\nla chaleur';

  @override
  String get l2Result =>
      '🌡️ La chaleur ne peut s\'échapper → la température monte';

  @override
  String get l3Title => 'Votre empreinte\npersonnelle';

  @override
  String get l3Body =>
      'Votre « empreinte carbone » est le total de CO₂ que vous produisez en un an. Elle inclut tout ce que vous consommez : le bus que vous prenez, le burger que vous mangez, la chemise que vous achetez, la douche chaude que vous prenez.';

  @override
  String get l3FactLabel => 'EN COLOMBIE';

  @override
  String get l3Fact =>
      'Un Colombien produit en moyenne 1,8 tonne de CO₂ par an. La moyenne mondiale est de 4,7 t. L\'objectif pour sauver la planète est d\'atteindre 2 t avant 2030.';

  @override
  String get l3ColombiaLabel => 'Moyenne\nColombie';

  @override
  String get l3WorldLabel => 'Moyenne\nmondiale';

  @override
  String get l3TargetLabel => 'Objectif\n2030 🎯';

  @override
  String get l4Title => 'D\'où\nvient-elle ?';

  @override
  String get l4Body =>
      'Ce ne sont pas que les voitures qui polluent. Votre empreinte provient de 6 grandes catégories de votre vie quotidienne. Certaines surprennent : le bœuf émet plus de CO₂ que la conduite d\'une voiture.';

  @override
  String get l4FactLabel => 'LES 6 CATÉGORIES';

  @override
  String get l4Fact =>
      'Le transport et l\'alimentation représentent ensemble plus de 55 % de votre empreinte totale.';

  @override
  String get l5Title => 'Combien,\nc\'est trop ?';

  @override
  String get l5Body =>
      'Il existe un objectif mondial : pour éviter les pires effets du changement climatique, chaque personne dans le monde doit atteindre moins de 2 tonnes de CO₂ par an d\'ici 2030.';

  @override
  String get l5FactLabel => 'COMPARAISON';

  @override
  String get l5Fact =>
      'Un citoyen américain produit 15 t/an. Un Allemand : 9 t. Un Colombien : 1,8 t. Mais la qualité de vie n\'a pas à baisser pour réduire votre empreinte.';

  @override
  String get l6Title => 'Vous pouvez\nchanger les choses';

  @override
  String get l6Body =>
      'Pas besoin d\'être un activiste ni de changer de vie du jour au lendemain. De petits changements dans vos habitudes de transport, d\'alimentation et de logement peuvent réduire votre empreinte jusqu\'à 40 %.';

  @override
  String get l6FactLabel => 'LE PREMIER PAS';

  @override
  String get l6Fact =>
      'Connaître votre empreinte est le premier pas. Ce que l\'on ne mesure pas, on ne peut pas l\'améliorer. Faites le test maintenant !';

  @override
  String get l6Action1 => 'Manger moins de viande';

  @override
  String get l6Action2 => 'Utiliser les transports en commun';

  @override
  String get l6Action3 => 'Supprimer 1 vol long-courrier';

  @override
  String get l6Action4 => 'Passer aux LED';

  @override
  String get l6ActionsLabel => 'Actions à fort impact :';

  @override
  String get profileCardTitle => 'Mon éco-carte';

  @override
  String get profileCardPreview =>
      'Aperçu — partagez votre niveau sur les réseaux sociaux 🌍';

  @override
  String get photoDialogTitle => 'Ajouter votre photo ?';

  @override
  String get photoDialogContent =>
      'Vous pouvez personnaliser la carte avec votre photo de profil, ou simplement utiliser l\'emoji de votre niveau.';

  @override
  String get emojiOnly => 'Emoji seulement';

  @override
  String get choosePhoto => 'Choisir une photo';

  @override
  String get addPhoto => 'Ajouter une photo';

  @override
  String get changePhoto => 'Changer la photo';

  @override
  String get generating => 'Génération...';

  @override
  String get downloadPng => 'Télécharger le PNG';

  @override
  String get cardDownloaded =>
      'Image ouverte dans votre navigateur 🌿 — appui long pour l\'enregistrer.';

  @override
  String get downloadHint =>
      'L\'image s\'ouvre dans votre navigateur en 1080×1080 px.\nAppui long pour l\'enregistrer sur votre appareil.';

  @override
  String get cardFooterText => 'Connais ton empreinte. Change ton monde.';

  @override
  String get statsModules => 'Modules';

  @override
  String get statsAchievements => 'Réussites';

  @override
  String get transportModuleTitle => 'Transport';

  @override
  String get transportModuleWeight => '28–35 % de votre empreinte';

  @override
  String get transportQ1 => 'Quel est votre moyen de transport principal ?';

  @override
  String get transportQ2 => 'Combien de km parcourez-vous par semaine ?';

  @override
  String transportKmHint(int km) {
    return '$km km/semaine';
  }

  @override
  String get transportQ3 => 'Combien de vols prenez-vous par an ?';

  @override
  String get flightShort => 'Court (< 3 h)';

  @override
  String get flightMedium => 'Moyen (3–6 h)';

  @override
  String get flightLong => 'Long (> 6 h)';

  @override
  String get vehicleGasoline => 'Essence';

  @override
  String get vehicleDiesel => 'Diesel';

  @override
  String get vehicleHybrid => 'Hybride';

  @override
  String get vehicleElectric => 'Électrique';

  @override
  String get vehicleMotorcycle => 'Moto';

  @override
  String get vehicleBus => 'Bus/Métro';

  @override
  String get vehicleBicycle => 'Vélo';

  @override
  String get vehicleWalking => 'À pied';

  @override
  String get foodModuleTitle => 'Alimentation';

  @override
  String get foodModuleWeight => '25–30 % de votre empreinte';

  @override
  String get foodQ1 => 'Comment décririez-vous votre régime ?';

  @override
  String get foodQ2 => 'Combien de fois par semaine mangez-vous du bœuf ?';

  @override
  String foodBeefHint(int n) {
    return '$n fois';
  }

  @override
  String get foodQ3 => 'Quelle quantité de nourriture gaspillez-vous ?';

  @override
  String get foodQ4 => 'Mangez-vous des aliments locaux et de saison ?';

  @override
  String get dietVegan => 'Végétalien';

  @override
  String get dietVeganSub => 'Uniquement végétal';

  @override
  String get dietVegetarian => 'Végétarien';

  @override
  String get dietVegetarianSub => 'Sans viande';

  @override
  String get dietFlexitarian => 'Flexitarien';

  @override
  String get dietFlexitarianSub => 'Peu de viande';

  @override
  String get dietOmnivore => 'Omnivore';

  @override
  String get dietOmnivoreSub => 'Viande régulière';

  @override
  String get dietCarnivore => 'Beaucoup de viande';

  @override
  String get dietCarnivoreSub => 'Viande au quotidien';

  @override
  String get wasteNone => 'Presque rien';

  @override
  String get wasteSome => 'Un peu';

  @override
  String get wasteLot => 'Pas mal';

  @override
  String get wasteMuch => 'Beaucoup';

  @override
  String get foodLocalTitle => 'Principalement local et de saison';

  @override
  String get foodLocalSub => 'Réduit jusqu\'à 0,1 tCO₂/an';

  @override
  String get homeModuleTitle => 'Logement et énergie';

  @override
  String get homeModuleWeight => '20–25 % de votre empreinte';

  @override
  String get homeQ1 => 'Combien de personnes vivent chez vous ?';

  @override
  String homePersonsHint(int n, String plural) {
    return '$n personne$plural';
  }

  @override
  String get homeQ2 => 'Quelle est votre principale source d\'énergie ?';

  @override
  String get homeQ3 => 'Combien de kWh utilisez-vous par mois ?';

  @override
  String homeKwhHint(int n) {
    return '$n kWh';
  }

  @override
  String get homeKwhAvg => 'Moyenne des foyers colombiens : 170–250 kWh/mois';

  @override
  String get homeQ4 => 'Avez-vous la climatisation ou le chauffage ?';

  @override
  String get homeACTitle => 'Oui, j\'utilise la clim / le chauffage';

  @override
  String homeACHoursHint(int n) {
    return '$n heures/jour';
  }

  @override
  String get energyGrid => 'Réseau électrique';

  @override
  String get energySolar => 'Solaire';

  @override
  String get energyGas => 'Gaz naturel';

  @override
  String get energyMixed => 'Mixte';

  @override
  String get homeQCountry => 'Dans quel pays vivez-vous ?';

  @override
  String get countryWorld => 'Autre (moyenne mondiale)';

  @override
  String get countryCo => 'Colombie';

  @override
  String get countryUs => 'États-Unis';

  @override
  String get countryMx => 'Mexique';

  @override
  String get countryBr => 'Brésil';

  @override
  String get countryEs => 'Espagne';

  @override
  String get countryDe => 'Allemagne';

  @override
  String get countryAr => 'Argentine';

  @override
  String get countryCl => 'Chili';

  @override
  String get countryPe => 'Pérou';

  @override
  String get shoppingModuleTitle => 'Achats';

  @override
  String get shoppingModuleWeight => '10–15 % de votre empreinte';

  @override
  String get shoppingQ1 => 'Combien de vêtements achetez-vous par mois ?';

  @override
  String shoppingClothingHint(int n) {
    return '$n articles';
  }

  @override
  String get shoppingQ2 => 'Nouveaux appareils électroniques par an ?';

  @override
  String shoppingElectronicsHint(int n) {
    return '$n appareils';
  }

  @override
  String get shoppingQ3 =>
      'Combien de colis e-commerce recevez-vous par mois ?';

  @override
  String shoppingPackagesHint(int n) {
    return '$n colis';
  }

  @override
  String get shoppingQ4 => 'Achetez-vous des vêtements ou objets d\'occasion ?';

  @override
  String get shoppingSecondHandTitle => 'Oui, j\'achète souvent d\'occasion';

  @override
  String get shoppingSecondHandSub =>
      'Réduit votre empreinte de consommation jusqu\'à 10 %';

  @override
  String get wasteModuleTitle => 'Déchets';

  @override
  String get wasteModuleWeight => '5–8 % de votre empreinte';

  @override
  String get wasteQ1 => 'Combien de sacs poubelle générez-vous par semaine ?';

  @override
  String wasteBagsHint(int n, String plural) {
    return '$n sac$plural';
  }

  @override
  String get wasteQ2 => 'Triez-vous les déchets pour le recyclage ?';

  @override
  String get wasteSeparateTitle =>
      'Oui, je trie le plastique, le papier et le verre';

  @override
  String get wasteSeparateSub => 'Réduit votre empreinte déchets de 30 %';

  @override
  String get wasteQ3 => 'Compostez-vous les déchets organiques ?';

  @override
  String get wasteCompostTitle => 'Oui, je composte';

  @override
  String get wasteCompostSub => 'Réduit les émissions de méthane des décharges';

  @override
  String get waterModuleTitle => 'Eau';

  @override
  String get waterModuleWeight => '~3 % de votre empreinte';

  @override
  String get waterQ1 => 'Combien de minutes dure votre douche en moyenne ?';

  @override
  String waterMinutesHint(int n) {
    return '$n minutes';
  }

  @override
  String get waterQ2 =>
      'À quelle température vous douchez-vous habituellement ?';

  @override
  String get waterQ3 =>
      'Arrosez-vous un jardin ou des espaces verts chez vous ?';

  @override
  String get waterGardenTitle =>
      'Oui, j\'ai un jardin ou j\'arrose des plantes';

  @override
  String get tempCold => 'Froide';

  @override
  String get tempColdSub => 'Sans chauffe-eau';

  @override
  String get tempWarm => 'Tiède';

  @override
  String get tempWarmSub => 'Chauffe-eau modéré';

  @override
  String get tempHot => 'Chaude';

  @override
  String get tempHotSub => 'Chauffe-eau à fond';

  @override
  String get cancel => 'Annuler';

  @override
  String greetingWithName(String name) {
    return 'Bonjour, $name 👋';
  }

  @override
  String get greetingEmpty => 'Bonjour 👋';

  @override
  String get themeTooltip => 'Changer de thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get settingsTheme => 'Thème';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsName => 'Nom';

  @override
  String get languageAuto => 'Automatique (appareil)';

  @override
  String get addYourName => 'Ajouter votre nom';

  @override
  String get nameDialogTitle => 'Quel est votre nom ?';

  @override
  String get nameDialogHint => 'Votre nom';

  @override
  String get nameOnCard => 'nom sur la carte';

  @override
  String get historyTitle => 'L\'évolution de votre empreinte';

  @override
  String historyMeasurements(int n) {
    return '$n mesures';
  }

  @override
  String get historyEmptyTitle => 'Pas encore d\'historique';

  @override
  String get historyEmptySub =>
      'Mettez à jour vos modules différents jours pour suivre l\'évolution de votre empreinte.';

  @override
  String get historyOneMeasurement => 'Première mesure enregistrée ! 🎉';

  @override
  String get historyOneSub =>
      'Revenez demain et mettez à jour un module pour voir votre évolution.';

  @override
  String historyImproved(String pct) {
    return '↓ $pct % depuis votre première mesure';
  }

  @override
  String historyWorsened(String pct) {
    return '↑ $pct % depuis votre première mesure';
  }

  @override
  String get offsetTitle => 'Comment compenser votre empreinte ?';

  @override
  String get offsetSubtitle =>
      'Pendant que vous réduisez, vous pouvez neutraliser le CO₂ restant';

  @override
  String offsetTreesValue(int n) {
    return '$n arbres';
  }

  @override
  String get offsetTreesLabel => 'pour absorber votre empreinte annuelle';

  @override
  String offsetCostValue(int usd) {
    return '~$usd USD/an';
  }

  @override
  String offsetCostMonthly(int usd) {
    return '~$usd USD/mois';
  }

  @override
  String get offsetCostLabel => 'en crédits carbone certifiés';

  @override
  String get offsetReduceFirst => 'Réduire d\'abord, compenser ensuite';

  @override
  String get offsetReduceFirstDesc =>
      'Les crédits carbone sont un complément, pas un substitut à la réduction de votre empreinte.';

  @override
  String get offsetPlatformsTitle => 'Plateformes certifiées';

  @override
  String get offsetDisclaimer =>
      '* Estimation basée sur le marché volontaire du carbone (~20 \$/t CO₂) et l\'absorption d\'un arbre mature (~21 kg CO₂/an).';

  @override
  String get resultsTitle => 'Diagnostic terminé !';

  @override
  String get resultsSub =>
      'Vous avez complété les 6 modules de l\'empreinte carbone';

  @override
  String get resultsYourFootprint => 'Votre empreinte carbone annuelle';

  @override
  String get resultsCompareTitle => 'Comment vous situez-vous ?';

  @override
  String get resultsYou => 'Vous';

  @override
  String get resultsParis => 'Objectif Paris';

  @override
  String get resultsColombia => 'Colombie';

  @override
  String get resultsWorld => 'Monde';

  @override
  String get resultsTopSources => 'Principales sources d\'émission';

  @override
  String get resultsAchievements => 'Vos réussites';

  @override
  String resultsEcoPoints(int points) {
    return '$points points EcoScore';
  }

  @override
  String get resultsBadgesUnlocked => 'réussites débloquées';

  @override
  String get resultsViewDashboard => 'Voir le tableau de bord complet';

  @override
  String get resultsViewPlan => 'Créer mon plan d\'action';

  @override
  String get resultsViewAgain => 'Voir mes résultats 🏆';

  @override
  String get shareResult => 'Partager mon résultat';

  @override
  String get exportResult => 'Exporter l\'image';

  @override
  String get downloadImage => 'Télécharger l\'image';

  @override
  String get tabHome => 'Accueil';

  @override
  String get homeWelcomeTitle => 'Connaissez votre empreinte carbone';

  @override
  String get homeWelcomeSub =>
      'Complétez les 6 modules de diagnostic et découvrez comment réduire votre impact sur la planète.';

  @override
  String get homeStartTest => 'Commencer mon diagnostic';

  @override
  String get homeUpdateTest => 'Mettre à jour mon test';

  @override
  String get homeViewFullFootprint => 'Voir l\'analyse complète';

  @override
  String homeModulesStatus(int completed) {
    return '$completed sur 6 modules terminés';
  }
}
